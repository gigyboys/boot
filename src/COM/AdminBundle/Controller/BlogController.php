<?php

namespace COM\AdminBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\RedirectResponse; 
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;

use COM\PlatformBundle\Entity\Locale;
use COM\PlatformBundle\Entity\PostSchool;
use COM\UserBundle\Entity\User;
use COM\BlogBundle\Entity\Post;
use COM\BlogBundle\Entity\PostCategory;
use COM\BlogBundle\Entity\PostTranslate;
use COM\BlogBundle\Entity\PostCategoryTranslate;
use COM\BlogBundle\Entity\PostIllustration;
use COM\BlogBundle\Form\Type\PostCommonType;
use COM\BlogBundle\Form\Type\PostCategoryCommonType;
use COM\BlogBundle\Form\Type\PostInitType;
use COM\BlogBundle\Form\Type\PostCategoryInitType;
use COM\BlogBundle\Form\Type\PostTranslateType;
use COM\BlogBundle\Form\Type\PostCategoryTranslateType;
use COM\BlogBundle\Form\Type\PostIllustrationType;

class BlogController extends Controller
{
    public function indexAction()
    {
		$url = $this->get('router')->generate('com_admin_blog_post');
		return new RedirectResponse($url);
    }
	
    public function postAction()
    {
		$em = $this->getDoctrine()->getManager();
		$postRepository = $em->getRepository('COMBlogBundle:Post');

		$posts = $postRepository->findAll();
		
        return $this->render('COMAdminBundle:blog:post.html.twig', array('posts' => $posts));
    }
	
    public function addPostAction(Request $request)
    {
		$em = $this->getDoctrine()->getManager();
		$localeRepository = $em->getRepository('COMPlatformBundle:Locale');
		
		$post = new Post();
		$formInitPost = $this->get('form.factory')->create(new PostInitType(), $post);
		
		if ($formInitPost->handleRequest($request)->isValid()) {
			$platformService = $this->container->get('com_platform.platform_service');
			$slug = $platformService->sluggify($post->getDefaultTitle());
			$post->setSlug($slug);
			$post->setDate(new \DateTime());
			$post->setViewNumber(0);
			$user = $this->getUser();
			$post->setUser($user);
			
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
			$em->flush();
			
			$url = $this->get('router')->generate('com_admin_blog_post_edit', array('id' => $post->getId()));
			return new RedirectResponse($url);
		}
		
        return $this->render('COMAdminBundle:blog:add_post.html.twig', array(
			'formInitPost' => $formInitPost->createView(),
		));
    }
	
    public function editPostAction($id)
    {
		$em = $this->getDoctrine()->getManager();
		$postRepository = $em->getRepository('COMBlogBundle:Post');
		$postTranslateRepository = $em->getRepository('COMBlogBundle:PostTranslate');
		$localeRepository = $em->getRepository('COMPlatformBundle:Locale');
		$postSchoolRepository = $em->getRepository('COMPlatformBundle:PostSchool');

		$post = $postRepository->find($id);
		$postSchools = $postSchoolRepository->findBy(array('post' => $post));
		
        return $this->render('COMAdminBundle:blog:edit_post.html.twig', array(
			'post' => $post,
			'postSchools' => $postSchools,
		));
    }

	public function changeIllustrationAction($id)
    {
        
        $em = $this->getDoctrine()->getManager();
		$postRepository = $em->getRepository('COMBlogBundle:Post');
        $postIllustrationRepository = $em->getRepository('COMBlogBundle:PostIllustration');
        
        $postIllustration = new PostIllustration();
        $post = $postRepository->find($id);
        
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
			
			$response = new Response();
            $response->setContent(json_encode(array(
                'state' => 1,
                'illustration116x116' => $illustration116x116,
            )));
            $response->headers->set('Content-Type', 'application/json');
            
            return $response;
        }

        $response = new Response();
		$response->setContent(json_encode(array(
			'state' => 0,
		)));
		$response->headers->set('Content-Type', 'application/json');
		
		return $response;
    }
	
    public function editPostCommonAction($id, Request $request)
    {
		$em = $this->getDoctrine()->getManager();
		$postRepository = $em->getRepository('COMBlogBundle:Post');
        
        $post = $postRepository->find($id);
        
		$postTemp = new Post();
		$formPostCommon = $this->get('form.factory')->create(new PostCommonType(), $postTemp);
		
        $response = new Response();
		
		if ($formPostCommon->handleRequest($request)->isValid()) {
			$post->setDefaultTitle($postTemp->getDefaultTitle());
			
			$platformService = $this->container->get('com_platform.platform_service');
			$slug = $platformService->sluggify($postTemp->getSlug());
			
			$post->setSlug($slug);
            
			$em->persist($post);
            $em->flush();

            $response->setContent(json_encode(array(
                'state' => 1,
                'defaultTitle' => $post->getDefaultTitle(),
                'slug' => $post->getSlug(),
            )));
		}else{
            $response->setContent(json_encode(array(
                'state' => 0,
            )));
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
        
        $post = $postRepository->find($id);
        $localeObj = $localeRepository->findOneBy(array(
			'locale' => $locale,
		));
        
		$postTranslateTemp = new PostTranslate();
		$formPostTranslate = $this->get('form.factory')->create(new PostTranslateType(), $postTranslateTemp);
		
        $response = new Response();
		
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
		$postCategoryRepository = $em->getRepository('COMBlogBundle:PostCategory');

		$postCategories = $postCategoryRepository->findAll();
		
        return $this->render('COMAdminBundle:blog:category.html.twig', array('postCategories' => $postCategories));
    }
	
    public function addCategoryAction(Request $request)
    {
		$em = $this->getDoctrine()->getManager();
		$localeRepository = $em->getRepository('COMPlatformBundle:Locale');
		
		$postCategory = new PostCategory();
		$formInitPostCategory = $this->get('form.factory')->create(new PostCategoryInitType(), $postCategory);
		
		if ($formInitPostCategory->handleRequest($request)->isValid()) {
			$platformService = $this->container->get('com_platform.platform_service');
			$slug = $platformService->sluggify($postCategory->getDefaultName());
			$postCategory->setSlug($slug);
			
			$locales = $localeRepository->findAll();
			foreach($locales as $locale){
				$postCategoryTranslate = new PostCategoryTranslate();
				$postCategoryTranslate->setPostCategory($postCategory);
				$postCategoryTranslate->setLocale($locale);
				$postCategoryTranslate->setName($locale->getLocale()." ".$postCategory->getDefaultName());
				$postCategoryTranslate->setDescription($locale->getLocale().". Description .".$postCategory->getDefaultName());
				$em->persist($postCategoryTranslate);
			}
			
			$em->persist($postCategory);
			$em->flush();
			
			$url = $this->get('router')->generate('com_admin_blog_category_edit', array('id' => $postCategory->getId()));
			return new RedirectResponse($url);
		}
		
        return $this->render('COMAdminBundle:blog:add_category.html.twig', array(
			'formInitPostCategory' => $formInitPostCategory->createView(),
		));
    }
	
    public function editCategoryAction($id)
    {
		$em = $this->getDoctrine()->getManager();
		$postCategoryRepository = $em->getRepository('COMBlogBundle:PostCategory');
		$localeRepository = $em->getRepository('COMPlatformBundle:Locale');

		$postCategory = $postCategoryRepository->find($id);
		
        return $this->render('COMAdminBundle:blog:edit_category.html.twig', array(
			'postCategory' => $postCategory,
		));
    }
	
    public function editCategoryCommonAction($id, Request $request)
    {
		$em = $this->getDoctrine()->getManager();
		$postCategoryRepository = $em->getRepository('COMBlogBundle:PostCategory');
        
        $postCategory = $postCategoryRepository->find($id);
        
		$postCategoryTemp = new PostCategory();
		$formPostCategoryCommon = $this->get('form.factory')->create(new PostCategoryCommonType(), $postCategoryTemp);
		
        $response = new Response();
		
		if ($formPostCategoryCommon->handleRequest($request)->isValid()) {
			$postCategory->setDefaultName($postCategoryTemp->getDefaultName());
			
			$platformService = $this->container->get('com_platform.platform_service');
			$slug = $platformService->sluggify($postCategoryTemp->getSlug());
			
			$postCategory->setSlug($slug);
            
			$em->persist($postCategory);
            $em->flush();

            $response->setContent(json_encode(array(
                'state' => 1,
                'defaultName' => $postCategory->getDefaultName(),
                'slug' => $postCategory->getSlug(),
            )));
		}else{
            $response->setContent(json_encode(array(
                'state' => 0,
            )));
		}
        $response->headers->set('Content-Type', 'application/json');
		return $response;
    }
	
    public function editCategoryTranslateAction($id, $locale, Request $request)
    {
		$em = $this->getDoctrine()->getManager();
		$postCategoryRepository = $em->getRepository('COMBlogBundle:PostCategory');
		$postCategoryTranslateRepository = $em->getRepository('COMBlogBundle:PostCategoryTranslate');
		$localeRepository = $em->getRepository('COMPlatformBundle:Locale');
        
        $postCategory = $postCategoryRepository->find($id);
        $localeObj = $localeRepository->findOneBy(array(
			'locale' => $locale,
		));
        
		$postCategoryTranslateTemp = new PostCategoryTranslate();
		$formPostCategoryTranslate = $this->get('form.factory')->create(new PostCategoryTranslateType(), $postCategoryTranslateTemp);
		
        $response = new Response();
		
		if ($formPostCategoryTranslate->handleRequest($request)->isValid()) {
			$postCategoryTranslate = $postCategoryTranslateRepository->findOneBy(array(
				'postCategory' => $postCategory,
				'locale' => $localeObj,
			));
			if(!$postCategoryTranslate){
				$postCategoryTranslate = new PostCategoryTranslate();
				$postCategoryTranslate->setLocale($localeObj);
				$postCategoryTranslate->setPostCategory($postCategory);
			}
			$postCategoryTranslate->setName($postCategoryTranslateTemp->getName());
			$postCategoryTranslate->setDescription($postCategoryTranslateTemp->getDescription());
            
			$em->persist($postCategoryTranslate);
            $em->flush();

            $response->setContent(json_encode(array(
                'state' => 1,
                'name' => $postCategoryTranslate->getName(),
                'description' => $postCategoryTranslate->getDescription()
            )));
		}else{
            $response->setContent(json_encode(array(
                'state' => 0,
            )));
		}
        $response->headers->set('Content-Type', 'application/json');
		return $response;
    }
}
