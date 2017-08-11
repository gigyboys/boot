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
use COM\BlogBundle\Entity\Category;
use COM\BlogBundle\Entity\CategoryPost;
use COM\BlogBundle\Entity\PostTranslate;
use COM\BlogBundle\Entity\CategoryTranslate;
use COM\BlogBundle\Entity\PostIllustration;
use COM\BlogBundle\Form\Type\PostCommonType;
use COM\BlogBundle\Form\Type\CategoryCommonType;
use COM\BlogBundle\Form\Type\PostInitType;
use COM\BlogBundle\Form\Type\CategoryInitType;
use COM\BlogBundle\Form\Type\PostTranslateType;
use COM\BlogBundle\Form\Type\CategoryTranslateType;
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
		$publishedPosts = $postRepository->findBy(array(
			'published' => true
		));
		$notPublishedPosts = $postRepository->findBy(array(
			'published' => false
		));
		
        return $this->render('COMAdminBundle:blog:post.html.twig', array(
			'posts' => $posts,
			'publishedPosts' => $publishedPosts,
			'notPublishedPosts' => $notPublishedPosts,
		));
    }
	
    public function addPostAction(Request $request)
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
	
    public function categoryAction()
    {
		$em = $this->getDoctrine()->getManager();
		$categoryRepository = $em->getRepository('COMBlogBundle:Category');

		$categories = $categoryRepository->findAll();
		
        return $this->render('COMAdminBundle:blog:category.html.twig', array('categories' => $categories));
    }
	
    public function addCategoryAction(Request $request)
    {
		$em = $this->getDoctrine()->getManager();
		$localeRepository = $em->getRepository('COMPlatformBundle:Locale');
		$categoryRepository = $em->getRepository('COMBlogBundle:Category');
		
		$category = new Category();
		$formInitCategory = $this->get('form.factory')->create(new CategoryInitType(), $category);
		
		if ($formInitCategory->handleRequest($request)->isValid()) {
			$platformService = $this->container->get('com_platform.platform_service');
			$slug = $platformService->sluggify($category->getDefaultName());
			
			$slugtmp = $slug;
			$notSlugs = array(
				"category", 
				"categories",
			);
            $isSluggable = true;
            $i = 2;
            do {
                $categorytmp = $categoryRepository->findOneBy(array(
					'slug' => $slugtmp
				));
				if($categorytmp || in_array($slugtmp, $notSlugs)){
					$slugtmp = $slug."-".$i;
					$i++;
				}
				else{
					$isSluggable = false;
				}
            } 
            while ($isSluggable);
            $slug = $slugtmp;
			
			$category->setSlug($slug);
			
			$locales = $localeRepository->findAll();
			foreach($locales as $locale){
				$categoryTranslate = new CategoryTranslate();
				$categoryTranslate->setCategory($category);
				$categoryTranslate->setLocale($locale);
				$categoryTranslate->setName($locale->getLocale()." ".$category->getDefaultName());
				$categoryTranslate->setDescription($locale->getLocale().". Description .".$category->getDefaultName());
				$em->persist($categoryTranslate);
			}
			
			$em->persist($category);
			$em->flush();
			
			$url = $this->get('router')->generate('com_admin_blog_category_edit', array('id' => $category->getId()));
			return new RedirectResponse($url);
		}
		
        return $this->render('COMAdminBundle:blog:add_category.html.twig', array(
			'formInitCategory' => $formInitCategory->createView(),
		));
    }
	
    public function editCategoryAction($id)
    {
		$em = $this->getDoctrine()->getManager();
		$categoryRepository = $em->getRepository('COMBlogBundle:Category');
		$localeRepository = $em->getRepository('COMPlatformBundle:Locale');

		$category = $categoryRepository->find($id);
		
        return $this->render('COMAdminBundle:blog:edit_category.html.twig', array(
			'category' => $category,
		));
    }
	
    public function editCategoryCommonAction($id, Request $request)
    {
		$em = $this->getDoctrine()->getManager();
		$categoryRepository = $em->getRepository('COMBlogBundle:Category');
        
        $category = $categoryRepository->find($id);
        
		$categoryTemp = new Category();
		$formCategoryCommon = $this->get('form.factory')->create(new CategoryCommonType(), $categoryTemp);
		
        $response = new Response();
		
		if ($formCategoryCommon->handleRequest($request)->isValid()) {
			$category->setDefaultName($categoryTemp->getDefaultName());
			
			$platformService = $this->container->get('com_platform.platform_service');
			$slug = $platformService->sluggify($categoryTemp->getSlug());
			
			$slugtmp = $slug;
			$notSlugs = array(
				"category", 
				"categories",
			);
            $isSluggable = true;
            $i = 2;
            do {
                $categorytmp = $categoryRepository->findOneBy(array(
					'slug' => $slugtmp
				));
				if(($categorytmp && $categorytmp->getId() != $category->getId()) || in_array($slugtmp, $notSlugs)){
					$slugtmp = $slug."-".$i;
					$i++;
				}
				else{
					$isSluggable = false;
				}
            } 
            while ($isSluggable);
            $slug = $slugtmp;
			
			$category->setSlug($slug);
            
			$em->persist($category);
            $em->flush();

            $response->setContent(json_encode(array(
                'state' => 1,
                'defaultName' => $category->getDefaultName(),
                'slug' => $category->getSlug(),
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
		$categoryRepository = $em->getRepository('COMBlogBundle:Category');
		$categoryTranslateRepository = $em->getRepository('COMBlogBundle:CategoryTranslate');
		$localeRepository = $em->getRepository('COMPlatformBundle:Locale');
        
        $category = $categoryRepository->find($id);
        $localeObj = $localeRepository->findOneBy(array(
			'locale' => $locale,
		));
        
		$categoryTranslateTemp = new CategoryTranslate();
		$formCategoryTranslate = $this->get('form.factory')->create(new CategoryTranslateType(), $categoryTranslateTemp);
		
        $response = new Response();
		
		if ($formCategoryTranslate->handleRequest($request)->isValid()) {
			$categoryTranslate = $categoryTranslateRepository->findOneBy(array(
				'category' => $category,
				'locale' => $localeObj,
			));
			if(!$categoryTranslate){
				$categoryTranslate = new CategoryTranslate();
				$categoryTranslate->setLocale($localeObj);
				$categoryTranslate->setCategory($category);
			}
			$categoryTranslate->setName($categoryTranslateTemp->getName());
			$categoryTranslate->setDescription($categoryTranslateTemp->getDescription());
            
			$em->persist($categoryTranslate);
            $em->flush();

            $response->setContent(json_encode(array(
                'state' => 1,
                'name' => $categoryTranslate->getName(),
                'description' => $categoryTranslate->getDescription()
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
