<?php

namespace COM\BlogBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\RedirectResponse; 

use COM\PlatformBundle\Entity\Locale;
use COM\BlogBundle\Entity\Post;
use COM\BlogBundle\Entity\PostTranslate;
use COM\PlatformBundle\Entity\View;
use COM\PlatformBundle\Entity\Comment;
use COM\PlatformBundle\Entity\PostSchool;
use COM\PlatformBundle\Form\Type\CommentType;

class BlogController extends Controller
{

    public function indexAction()
    {
		$em = $this->getDoctrine()->getManager();
		$postRepository = $em->getRepository('COMBlogBundle:Post');
		$localeRepository = $em->getRepository('COMPlatformBundle:Locale');
		$parameterRepository = $em->getRepository('COMPlatformBundle:Parameter');
		
		$request = $this->get('request');
		$shortLocale = $request->getLocale();
		$locale = $localeRepository->findOneBy(array(
			'locale' => $shortLocale,
		));
		
		/*$posts = $postRepository->findBy(array(
			'published' => true,
		));
		*/
		
		$limit = $parameterRepository->findOneBy(array(
			'parameter' => 'posts_by_page',
		))->getValue();
		
		$order = "ASC";
		$posts = $postRepository->getPostsLimit($limit, $order);
		
		$blogService = $this->container->get('com_blog.blog_service');
		
		foreach($posts as $post){
			$blogService->hydratePostLang($post, $locale);
		}
		
		$previousPost = null;
		if(count($posts)){
			$index = count($posts)-1;
			$firstPost = $posts[$index];
			$previousPost = $postRepository->getSincePost($firstPost);
		}
		
        return $this->render('COMBlogBundle:blog:index.html.twig', array(
			'posts' => $posts,
			'previousPost' => $previousPost,
			'entityView' => 'blog',
		));
    }
	
	public function loadPostsAction($post_id, Request $request)
    {
		$em = $this->getDoctrine()->getManager();
		$postRepository = $em->getRepository('COMBlogBundle:Post');
		$localeRepository = $em->getRepository('COMPlatformBundle:Locale');
		$parameterRepository = $em->getRepository('COMPlatformBundle:Parameter');
		
		$request = $this->get('request');
		$shortLocale = $request->getLocale();
		$locale = $localeRepository->findOneBy(array(
			'locale' => $shortLocale,
		));
        
		$lastPost = $postRepository->find($post_id);
		
        $response = new Response();
		if($lastPost){		
			$limit = $parameterRepository->findOneBy(array(
				'parameter' => 'posts_by_page',
			))->getValue();
			
			$order = "ASC";
			$posts = $postRepository->getPostsSince($lastPost, $limit, $order);
			
			$blogService = $this->container->get('com_blog.blog_service');		
			foreach($posts as $post){
				$blogService->hydratePostLang($post, $locale);
			}
			
			$listPosts = array();
			foreach($posts as $post){
				$postItem = $this->renderView('COMBlogBundle:blog:include/post_item.html.twig', array(
				  'post' => $post
				));
				array_push($listPosts, array(
					"id" 			=> $post->getId(),
					"postItem" 		=> $postItem,
				));
			}
		
			$previousPost = null;
			$previousPostId = 0;
			$urlLoadPost = null;
			
			if(count($posts)){
				$index = count($posts)-1;
				$firstPost = $posts[$index];
				$previousPost = $postRepository->getSincePost($firstPost);
			}
			if ($previousPost){
				$previousPostId = $previousPost->getId();
				$urlLoadPost = $this->get('router')->generate('com_blog_load_posts', array(
					'post_id' => $previousPostId,
				));
			}
			
			$response->setContent(json_encode(array(
				'state' => 1,
				'posts' => $listPosts,
				'previousPostId' => $previousPostId,
				'urlLoadPost' => $urlLoadPost,
			)));
		}else{
			$response->setContent(json_encode(array(
				'state' => 0,
			)));
		}
		
        $response->headers->set('Content-Type', 'application/json');
		return $response;
    }

    public function categoryAction()
    {
		$em = $this->getDoctrine()->getManager();
		$postRepository = $em->getRepository('COMBlogBundle:Post');
		$categoryRepository = $em->getRepository('COMBlogBundle:Category');
		$localeRepository = $em->getRepository('COMPlatformBundle:Locale');
		
		$request = $this->get('request');
		$shortLocale = $request->getLocale();
		$locale = $localeRepository->findOneBy(array(
			'locale' => $shortLocale,
		));
			
		$blogService = $this->container->get('com_blog.blog_service');
		$categories = $blogService->getCategoryWithPublishedPost();
		
		return $this->render('COMBlogBundle:blog:category.html.twig', array(
			'categories' => $categories,
			'entityView' => 'blog',
		));
    }

    public function viewCategoryAction($slug)
    {
		$em = $this->getDoctrine()->getManager();
		$postRepository = $em->getRepository('COMBlogBundle:Post');
		$categoryRepository = $em->getRepository('COMBlogBundle:Category');
		$localeRepository = $em->getRepository('COMPlatformBundle:Locale');
		
		$request = $this->get('request');
		$shortLocale = $request->getLocale();
		$locale = $localeRepository->findOneBy(array(
			'locale' => $shortLocale,
		));
		
		$category = $categoryRepository->findOneBy(array(
			'slug' => $slug,
		));
		if($category){
			/*$posts = $postRepository->findBy(array(
				'published' => true,
				'published' => true,
			));*/
			
			$blogService = $this->container->get('com_blog.blog_service');
			$posts = $blogService->getPublishedPostsByCategory($category);
			
			foreach($posts as $post){
				$blogService->hydratePostLang($post, $locale);
			}
			
			return $this->render('COMBlogBundle:blog:viewCategory.html.twig', array(
				'posts' => $posts,
				'category' => $category,
				'entityView' => 'blog',
			));
		}else{
			
		}
    }
	
    public function viewAction($slug)
    {
		$em = $this->getDoctrine()->getManager();
		$postRepository = $em->getRepository('COMBlogBundle:Post');
		$commentRepository = $em->getRepository('COMPlatformBundle:Comment');
		$localeRepository = $em->getRepository('COMPlatformBundle:Locale');
		
		$user = $this->getUser();
		
		$request = $this->get('request');
		$shortLocale = $request->getLocale();
		$locale = $localeRepository->findOneBy(array(
			'locale' => $shortLocale,
		));
		
		$post = $postRepository->findOneBy(array(
			'slug' => $slug,
		));
		
		$blogService = $this->container->get('com_blog.blog_service');
		$blogService->hydratePostLang($post, $locale);
		
		$allComments = $commentRepository->findBy(array(
			'post' => $post,
		));
		
		$limit = 10;
		$type = "post";
		$order = "DESC";
		$comments = $commentRepository->getCommentsLimit($type, $post, $limit, $order);
		
		$previousComment = null;
		if(count($comments)>0){
			$firstComment = $comments[0];
			$previousComment = $commentRepository->getSinceComment($firstComment, $type, $post);
		}
		
		$platformService = $this->container->get('com_platform.platform_service');
		$platformService->registerView($post, $user, $request);
		
        return $this->render('COMBlogBundle:blog:view_post.html.twig', array(
			'post' => $post,
			'locale' => $locale,
			'comments' => $comments,
			'allComments' => $allComments,
			'previousComment' => $previousComment,
			'entityView' => 'blog',
		));
    }
	
    public function viewByIdAction($id, Request $request)
    {
		$em = $this->getDoctrine()->getManager();
		$postRepository = $em->getRepository('COMBlogBundle:Post');
		
		$post = $postRepository->find($id);
		$url = $this->get('router')->generate('com_blog_view', array('slug' => $post->getSlug()));
		return new RedirectResponse($url);
    }
	
	public function loadCommentsAction($post_id, $comment_id, Request $request)
    {
		$em = $this->getDoctrine()->getManager();
		$postRepository = $em->getRepository('COMBlogBundle:Post');
		$commentRepository = $em->getRepository('COMPlatformBundle:Comment');
        
		$comment = new Comment();
		$post = $postRepository->find($post_id);
		$lastComment = $commentRepository->find($comment_id);
		
        $response = new Response();
		if($post && $lastComment){
			$limit = 10;
			$type = "post";
			$order = "DESC";
			$comments = $commentRepository->getCommentsSince($lastComment, $type, $post, $limit, $order);
			
			$listComments = array();
			foreach($comments as $comment){
				$commentItem = $this->renderView('COMBlogBundle:blog:include/comment_item.html.twig', array(
				  'comment' => $comment
				));
				array_push($listComments, array(
					"id" 			=> $comment->getId(),
					"commentItem" 	=> $commentItem,
				));
			}
		
			$previousComment = null;
			$previousCommentId = 0;
			$urlLoadComment = null;
			
			if($comments[0]){
				$firstComment = $comments[0];
				$previousComment = $commentRepository->getSinceComment($firstComment, $type, $post, $order);
			}
			if ($previousComment){
				$previousCommentId = $previousComment->getId();
				$urlLoadComment = $this->get('router')->generate('com_blog_post_load_comment', array(
					'post_id' => $post->getId(),
					'comment_id' => $previousCommentId,
				));
			}
			
			$response->setContent(json_encode(array(
				'state' => 1,
				'comments' => $listComments,
				'previousCommentId' => $previousCommentId,
				'urlLoadComment' => $urlLoadComment,
			)));
		}else{
			$response->setContent(json_encode(array(
				'state' => 0,
			)));
		}
		
        $response->headers->set('Content-Type', 'application/json');
		return $response;
    }
	
	public function newCommentAction($post_id, Request $request)
    {
		$em = $this->getDoctrine()->getManager();
		$postRepository = $em->getRepository('COMBlogBundle:Post');
		$commentRepository = $em->getRepository('COMPlatformBundle:Comment');
        
		$comment = new Comment();
		$formComment = $this->get('form.factory')->create(new CommentType(), $comment);
		
        $response = new Response();
		
		if ($formComment->handleRequest($request)->isValid()) {
			$post = $postRepository->find($post_id);
			$user = $this->getUser();
			
			if($post && $user){
				
				//creation message
				$comment->setPost($post);
				$comment->setUser($user);
				$comment->setDate(new \DateTime());
				
				$em->persist($comment);
				
				$em->flush();
				
				$comments = $commentRepository->findBy(array(
					'post' => $post,
				));
					
				$commentItem = $this->renderView('COMBlogBundle:blog:include/comment_item.html.twig', array(
				  'comment' => $comment
				));
				
				$infoComment = "";
				if(count($comments) < 2){
					$infoComment = count($comments)." Commentaire" ;
				}else{
					$infoComment = count($comments)." Commentaires"; 
				}
				$response->setContent(json_encode(array(
					'state' => 1,
					'commentItem' => $commentItem,
					'infoComment' => $infoComment,
				)));
			}else{
				$response->setContent(json_encode(array(
					'state' => 0,
				)));
			}
		}else{
            $response->setContent(json_encode(array(
                'state' => 0,
            )));
		}
        $response->headers->set('Content-Type', 'application/json');
		return $response;
    }
	
	public function setPostSchoolAction($post_id, $school_id, Request $request)
    {
		$em = $this->getDoctrine()->getManager();
		$postRepository = $em->getRepository('COMBlogBundle:Post');
		$schoolRepository = $em->getRepository('COMSchoolBundle:School');
		$schoolAdminRepository = $em->getRepository('COMSchoolBundle:SchoolAdmin');
		
		$post = $postRepository->find($post_id);
		$school = $schoolRepository->find($school_id);
		$user = $this->getUser();
		
		$schoolAdmin = null;
		if($user){
			$schoolAdmin = $schoolAdminRepository->findOneBy(array(
				'user' => $user,
				'school' => $school,
			));
		}
		
        $response = new Response();
		
		if ($post && $school && $schoolAdmin) {
			$postSchoolRepository = $em->getRepository('COMPlatformBundle:PostSchool');
			
			$postSchool = $postSchoolRepository->findOneBy(array(
				'post' => $post,
				'school' => $school,
			));
			
			if($postSchool){
				$response->setContent(json_encode(array(
					'state' => 0,
				)));
			}else{
				$postSchool = new PostSchool();
				$postSchool->setPost($post);
				$postSchool->setSchool($school);
				$postSchool->setUser($user);
				$postSchool->setUserConfirmation($user);
				$postSchool->setPostToSchool(true);
				$postSchool->setConfirmation(true);
				$postSchool->setDate(new \DateTime());
				$postSchool->setDateConfirmation(new \DateTime());
				
				$em->persist($postSchool);
				$em->flush();
				
				$response->setContent(json_encode(array(
					'state' => 1,
					'schoolId' => $school->getId(),
				)));
			}
		}else{
            $response->setContent(json_encode(array(
                'state' => 0,
            )));
		}
        $response->headers->set('Content-Type', 'application/json');
		return $response;
    }
}
