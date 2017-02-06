<?php

namespace COM\BlogBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

use COM\PlatformBundle\Entity\Locale;
use COM\BlogBundle\Entity\Post;
use COM\BlogBundle\Entity\PostTranslate;
use COM\PlatformBundle\Entity\View;

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
			'entityView' => 'post',
		));
    }
	
    public function viewAction($slug)
    {
		$em = $this->getDoctrine()->getManager();
		$postRepository = $em->getRepository('COMBlogBundle:Post');
		$localeRepository = $em->getRepository('COMPlatformBundle:Locale');
		
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
		
		$platformService = $this->container->get('com_platform.platform_service');
		$platformService->registerView($post, $request);
		
        return $this->render('COMBlogBundle:blog:view_post.html.twig', array(
			'post' => $post,
			'locale' => $locale,
			'entityView' => 'post',
		));
    }
}
