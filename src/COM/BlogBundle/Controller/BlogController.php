<?php

namespace COM\BlogBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;

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
		
		$request = $this->get('request');
		$shortLocale = $request->getLocale();
		$locale = $localeRepository->findOneBy(array(
			'locale' => $shortLocale,
		));
		
		$posts = $postRepository->findAll();
		
		$blogService = $this->container->get('com_blog.blog_service');
		
		foreach($posts as $post){
			$blogService->hydratePostLang($post, $locale);
		}
		
        return $this->render('COMBlogBundle:blog:index.html.twig', array(
			'posts' => $posts,
			'entityView' => 'blog',
		));
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
		
		$comments = $commentRepository->findBy(array(
			'post' => $post,
		));
		
		$platformService = $this->container->get('com_platform.platform_service');
		$platformService->registerView($post, $user, $request);
		
        return $this->render('COMBlogBundle:blog:view_post.html.twig', array(
			'post' => $post,
			'locale' => $locale,
			'comments' => $comments,
			'entityView' => 'blog',
		));
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
