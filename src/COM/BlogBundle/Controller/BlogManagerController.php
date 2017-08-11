<?php

namespace COM\BlogBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\RedirectResponse; 
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;

use COM\PlatformBundle\Entity\Locale;
use COM\BlogBundle\Entity\Post;
use COM\BlogBundle\Entity\PostTranslate;
use COM\PlatformBundle\Entity\View;
use COM\PlatformBundle\Entity\Comment;
use COM\PlatformBundle\Entity\PostSchool;
use COM\PlatformBundle\Form\Type\CommentType;

use COM\BlogBundle\Entity\Category;
use COM\BlogBundle\Entity\CategoryPost;
use COM\BlogBundle\Entity\CategoryTranslate;
use COM\BlogBundle\Entity\PostIllustration;
use COM\BlogBundle\Form\Type\PostCommonType;
use COM\BlogBundle\Form\Type\CategoryCommonType;
use COM\BlogBundle\Form\Type\PostInitType;
use COM\BlogBundle\Form\Type\CategoryInitType;
use COM\BlogBundle\Form\Type\PostTranslateType;
use COM\BlogBundle\Form\Type\CategoryTranslateType;
use COM\BlogBundle\Form\Type\PostIllustrationType;

class BlogManagerController extends Controller
{

    public function addPostAjaxAction()
    {
		$em = $this->getDoctrine()->getManager();
		$localeRepository = $em->getRepository('COMPlatformBundle:Locale');
		
        $response = new Response();

		$content = $this->renderView('COMBlogBundle:blog:post_add_ajax.html.twig', array(
			
		));
			
		$response->setContent(json_encode(array(
			'state' => 1,
			'content' => $content,
		)));
		
        $response->headers->set('Content-Type', 'application/json');
		return $response;
    }

    public function addPostValidationAction(Request $request)
    {
		$em = $this->getDoctrine()->getManager();
		$postRepository = $em->getRepository('COMBlogBundle:Post');
		$categoryRepository = $em->getRepository('COMBlogBundle:Category');
		$localeRepository = $em->getRepository('COMPlatformBundle:Locale');
		
		$post = new Post();
		$formInitPost = $this->get('form.factory')->create(new PostInitType(), $post);
		
		if ($formInitPost->handleRequest($request)->isValid()) {
			$platformService = $this->container->get('com_platform.platform_service');
			$slug = $platformService->sluggify($post->getDefaultTitle());
			
			$slugtmp = $slug;
			$notSlugs = array(
				"category", 
				"categories", 
				"archive",
				"archives",
			);
            $isSluggable = true;
            $i = 2;
            do {
                $posttmp = $postRepository->findOneBy(array(
					'slug' => $slugtmp
				));
				if($posttmp || in_array($slugtmp, $notSlugs)){
					$slugtmp = $slug."-".$i;
					$i++;
				}
				else{
					$isSluggable = false;
				}
            } 
            while ($isSluggable);
            $slug = $slugtmp;
			
			$post->setSlug($slug);
			$post->setDate(new \DateTime());
			$post->setPublished(false);
			$post->setValid(false);
			$post->setDeleted(false);
			$post->setViewNumber(0);
			
			$user = $this->getUser();
			$post->setUser($user);
			$post->setShowAuthor(true);
			
			$locales = $localeRepository->findAll();
			foreach($locales as $locale){
				$postTranslate = new PostTranslate();
				$postTranslate->setPost($post);
				$postTranslate->setLocale($locale);
				$postTranslate->setTitle($locale->getLocale()." ".$post->getDefaultTitle());
				$postTranslate->setDescription($locale->getLocale().". Description .".$post->getDefaultTitle());
				$postTranslate->setContent($locale->getLocale().". Content .".$post->getDefaultTitle());
				$em->persist($postTranslate);
			}
			
			$em->persist($post);
			
			if($post->getCategoryId() != 0){
				$category = $categoryRepository->find($post->getCategoryId());
				if($category){
					$categoryPost = new CategoryPost();
					$categoryPost->setCategory($category);
					$categoryPost->setPost($post);
					$em->persist($categoryPost);
				}
			}
			
			$em->flush();
			
			$url = $this->get('router')->generate('com_blog_manager_edit_post', array('post_id' => $post->getId()));
			return new RedirectResponse($url);
		}
		
        return $this->render('COMAdminBundle:blog:add_post.html.twig', array(
			'formInitPost' => $formInitPost->createView(),
		));
    }
	
	public function editPostAction($post_id)
    {
		$em = $this->getDoctrine()->getManager();
		$postRepository = $em->getRepository('COMBlogBundle:Post');
		$postTranslateRepository = $em->getRepository('COMBlogBundle:PostTranslate');
		$localeRepository = $em->getRepository('COMPlatformBundle:Locale');
		$postSchoolRepository = $em->getRepository('COMPlatformBundle:PostSchool');
		
		$user = $this->getUser();
		$post = $postRepository->find($post_id);
		if($post){
			if ($this->container->get('security.authorization_checker')->isGranted('ROLE_ADMIN') || $this->container->get('security.authorization_checker')->isGranted('ROLE_SUPER_ADMIN') || $post->getUser() == $user){
				return $this->render('COMBlogBundle:blog:edit_post.html.twig', array(
					'post' => $post,
				));
			}else{
				throw new NotFoundHttpException('page introuvable');
			}
		}else{
			throw new NotFoundHttpException('page introuvable');
		}
    }
	
    public function editPostCommonAction($id, Request $request)
    {
		
		$em = $this->getDoctrine()->getManager();
		$postRepository = $em->getRepository('COMBlogBundle:Post');
		$categoryRepository = $em->getRepository('COMBlogBundle:Category');
		$categoryPostRepository = $em->getRepository('COMBlogBundle:CategoryPost');
        
		$user = $this->getUser();
        $post = $postRepository->find($id);
				
		$response = new Response();
		
		//set state 0 in error case
		$response->setContent(json_encode(array(
			'state' => 0,
		)));
        
		if($post){
			if ($this->container->get('security.authorization_checker')->isGranted('ROLE_ADMIN') || $this->container->get('security.authorization_checker')->isGranted('ROLE_SUPER_ADMIN') || $post->getUser() == $user){
				$postTemp = new Post();
				$formPostCommon = $this->get('form.factory')->create(new PostCommonType(), $postTemp);
				
				if ($formPostCommon->handleRequest($request)->isValid()) {
					$post->setDefaultTitle($postTemp->getDefaultTitle());
					
					$platformService = $this->container->get('com_platform.platform_service');
					$slug = $platformService->sluggify($postTemp->getSlug());
					
					$slugtmp = $slug;
					$notSlugs = array(
						"category", 
						"categories", 
						"archive",
						"archives",
					);
					$isSluggable = true;
					$i = 2;
					do {
						$posttmp = $postRepository->findOneBy(array(
							'slug' => $slugtmp
						));
						if(($posttmp && $posttmp->getId() != $post->getId()) || in_array($slugtmp, $notSlugs)){
							$slugtmp = $slug."-".$i;
							$i++;
						}
						else{
							$isSluggable = false;
						}
					} 
					while ($isSluggable);
					$slug = $slugtmp;
					
					$post->setSlug($slug);
					
					$em->persist($post);
					
					$categoryPosts = $categoryPostRepository->findBy(array(
						'post' => $post,
					));
					if($categoryPosts){
						foreach ($categoryPosts as $categoryPost) {
							$em->remove($categoryPost);
						}
					}
					$categoryName = "NAN";
					if($postTemp->getCategoryId() != 0){
						$category = $categoryRepository->find($postTemp->getCategoryId());
						if($category){
							$categoryPost = new CategoryPost();
							$categoryPost->setCategory($category);
							$categoryPost->setPost($post);
							$em->persist($categoryPost);
							$categoryName = $category->getDefaultName();
						}
					}
					
					$em->flush();

					$response->setContent(json_encode(array(
						'state' => 1,
						'defaultTitle' => $post->getDefaultTitle(),
						'slug' => $post->getSlug(),
						'category' => $categoryName,
					)));
				}
			}
		}
			
        $response->headers->set('Content-Type', 'application/json');
		return $response;
    }
	
    public function editPostTranslateAction($id, $locale, Request $request)
    {
		$em = $this->getDoctrine()->getManager();
		$postRepository = $em->getRepository('COMBlogBundle:Post');
		$postTranslateRepository = $em->getRepository('COMBlogBundle:PostTranslate');
		$localeRepository = $em->getRepository('COMPlatformBundle:Locale');
        
		$user = $this->getUser();
        $post = $postRepository->find($id);
				
		$response = new Response();
		
		//set state 0 in error case
		$response->setContent(json_encode(array(
			'state' => 0,
		)));
		
		if($post){
			if ($this->container->get('security.authorization_checker')->isGranted('ROLE_ADMIN') || $this->container->get('security.authorization_checker')->isGranted('ROLE_SUPER_ADMIN') || $post->getUser() == $user){
				$localeObj = $localeRepository->findOneBy(array(
					'locale' => $locale,
				));
				
				$postTranslateTemp = new PostTranslate();
				$formPostTranslate = $this->get('form.factory')->create(new PostTranslateType(), $postTranslateTemp);
				
				if ($formPostTranslate->handleRequest($request)->isValid()) {
					$postTranslate = $postTranslateRepository->findOneBy(array(
						'post' => $post,
						'locale' => $localeObj,
					));
					if(!$postTranslate){
						$postTranslate = new PostTranslate();
						$postTranslate->setLocale($localeObj);
						$postTranslate->setPost($post);
					}
					$postTranslate->setTitle($postTranslateTemp->getTitle());
					$postTranslate->setDescription($postTranslateTemp->getDescription());
					$postTranslate->setContent($postTranslateTemp->getContent());
					
					$em->persist($postTranslate);
					$em->flush();

					$response->setContent(json_encode(array(
						'state' => 1,
						'title' => $postTranslate->getTitle(),
						'description' => $postTranslate->getDescription(),
						'content' => $postTranslate->getContent(),
					)));
				}
			}
		}
		
        $response->headers->set('Content-Type', 'application/json');
		return $response;
    }

	public function changeIllustrationAction($id)
    {
        $em = $this->getDoctrine()->getManager();
		$postRepository = $em->getRepository('COMBlogBundle:Post');
        $postIllustrationRepository = $em->getRepository('COMBlogBundle:PostIllustration');
        
        $user = $this->getUser();
        $post = $postRepository->find($id);
				
		$response = new Response();
		
		//set state 0 in error case
		$response->setContent(json_encode(array(
			'state' => 0,
		)));
		
		if($post){
			if ($this->container->get('security.authorization_checker')->isGranted('ROLE_ADMIN') || $this->container->get('security.authorization_checker')->isGranted('ROLE_SUPER_ADMIN') || $post->getUser() == $user){
				$postIllustration = new PostIllustration();
				
				$formPostIllustration = $this->get('form.factory')->create(new PostIllustrationType, $postIllustration);
				$formPostIllustration->handleRequest($this->getRequest());

				if ($formPostIllustration->isValid()) {
					$postIllustrations = $postIllustrationRepository->findBy(array('post' => $post));
					
					foreach ($postIllustrations as $postIllustrationTemp) {
						$postIllustrationTemp->setCurrent(false);
					}
					
					$postIllustration->setCurrent(true);
					$postIllustration->setPost($post);
					
					$em->persist($postIllustration);
					$em->flush();
					
					$illustration116x116 = $this->renderView('COMAdminBundle:blog:include/illustration116x116.html.twig', array(
					  'path' => $postIllustration->getWebPath()
					));
					
					$response->setContent(json_encode(array(
						'state' => 1,
						'illustration116x116' => $illustration116x116,
					)));
				}else{
					 $errors= array();

					   foreach ($formPostIllustration->getErrors() as $key => $error) {
							$errors[$key] = $error->getMessage();
					   }   

					$response->setContent(json_encode(array(
						'state' => 2,
						'errors' => $errors,
					)));
				}
			}
		}
		
		$response->headers->set('Content-Type', 'application/json');
		return $response;
    }
	
    public function tooglePublicationAction($post_id, Request $request)
    {
		$em = $this->getDoctrine()->getManager();
		$postRepository = $em->getRepository('COMBlogBundle:Post');
        
        $user = $this->getUser();
        $post = $postRepository->find($post_id);
				
		$response = new Response();
		
		//set state 0 in error case
		$response->setContent(json_encode(array(
			'state' => 0,
		)));
		
		if ($post) {
			if ($this->container->get('security.authorization_checker')->isGranted('ROLE_ADMIN') || $this->container->get('security.authorization_checker')->isGranted('ROLE_SUPER_ADMIN') || $post->getUser() == $user){
				if($post->getPublished() == true){
					$post->setPublished(false) ;
				}else{
					$post->setPublished(true) ;
				}
				
				$em->persist($post);
				$em->flush();

				$response->setContent(json_encode(array(
					'state' => 1,
					'published' => $post->getPublished(),
				)));
			}
		}
        $response->headers->set('Content-Type', 'application/json');
		return $response;
    }
	
    public function toogleShowAuthorAction($post_id, Request $request)
    {
		$em = $this->getDoctrine()->getManager();
		$postRepository = $em->getRepository('COMBlogBundle:Post');
        
        $user = $this->getUser();
        $post = $postRepository->find($post_id);
				
		$response = new Response();
		
		//set state 0 in error case
		$response->setContent(json_encode(array(
			'state' => 0,
		)));
		
		if ($post) {
			if ($this->container->get('security.authorization_checker')->isGranted('ROLE_ADMIN') || $this->container->get('security.authorization_checker')->isGranted('ROLE_SUPER_ADMIN') || $post->getUser() == $user){
				if($post->getShowAuthor() == true){
					$post->setShowAuthor(false) ;
				}else{
					$post->setShowAuthor(true) ;
				}
				
				$em->persist($post);
				$em->flush();

				$response->setContent(json_encode(array(
					'state' => 1,
					'showAuthor' => $post->getShowAuthor(),
				)));
			}
		}
		
        $response->headers->set('Content-Type', 'application/json');
		return $response;
    }
	
    public function toogleValidationAction($post_id, Request $request)
    {
		$em = $this->getDoctrine()->getManager();
		$postRepository = $em->getRepository('COMBlogBundle:Post');
        
        $user = $this->getUser();
        $post = $postRepository->find($post_id);
				
		$response = new Response();
		
		//set state 0 in error case
		$response->setContent(json_encode(array(
			'state' => 0,
		)));
		
		if ($post) {
			if ($this->container->get('security.authorization_checker')->isGranted('ROLE_ADMIN') || $this->container->get('security.authorization_checker')->isGranted('ROLE_SUPER_ADMIN') || $post->getUser() == $user){
				if($post->getValid() == true){
					$post->setValid(false) ;
				}else{
					$post->setValid(true) ;
				}
				
				$em->persist($post);
				$em->flush();

				$response->setContent(json_encode(array(
					'state' => 1,
					'valid' => $post->getValid(),
				)));
			}
		}
		
        $response->headers->set('Content-Type', 'application/json');
		return $response;
    }
	
    public function toogleDeletionAction($post_id, Request $request)
    {
		$em = $this->getDoctrine()->getManager();
		$postRepository = $em->getRepository('COMBlogBundle:Post');
        
        $user = $this->getUser();
        $post = $postRepository->find($post_id);
				
		$response = new Response();
		
		//set state 0 in error case
		$response->setContent(json_encode(array(
			'state' => 0,
		)));
		
		if ($post) {
			if ($this->container->get('security.authorization_checker')->isGranted('ROLE_ADMIN') || $this->container->get('security.authorization_checker')->isGranted('ROLE_SUPER_ADMIN') || $post->getUser() == $user){
				if($post->getDeleted() == true){
					$post->setDeleted(false) ;
				}else{
					$post->setDeleted(true) ;
				}
				
				$em->persist($post);
				$em->flush();

				$response->setContent(json_encode(array(
					'state' => 1,
					'deleted' => $post->getDeleted(),
				)));
			}
		}
		
        $response->headers->set('Content-Type', 'application/json');
		return $response;
    }
}
