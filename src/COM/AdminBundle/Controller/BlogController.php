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
use COM\BlogBundle\Entity\PostTranslate;
use COM\BlogBundle\Form\Type\PostCommonType;
use COM\BlogBundle\Form\Type\PostTranslateType;

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
	
    public function editPostAction($id)
    {
		$em = $this->getDoctrine()->getManager();
		$postRepository = $em->getRepository('COMBlogBundle:Post');
		$postTranslateRepository = $em->getRepository('COMBlogBundle:PostTranslate');
		$localeRepository = $em->getRepository('COMPlatformBundle:Locale');
		$postSchoolRepository = $em->getRepository('COMPlatformBundle:PostSchool');

		$post = $postRepository->find($id);
		$postSchools = $postSchoolRepository->findBy(array('post' => $post));
		
		$localeFR =  $localeRepository->findOneBy(array('locale' => 'fr'));
		$postFR = $postTranslateRepository->findOneBy(array('post' => $post, 'locale' => $localeFR));
		
		$localeEN =  $localeRepository->findOneBy(array('locale' => 'en'));
		$postEN = $postTranslateRepository->findOneBy(array('post' => $post, 'locale' => $localeEN));
		
		$localeMG =  $localeRepository->findOneBy(array('locale' => 'mg'));
		$postMG = $postTranslateRepository->findOneBy(array('post' => $post, 'locale' => $localeMG));
		
		$localeIT =  $localeRepository->findOneBy(array('locale' => 'it'));
		$postIT = $postTranslateRepository->findOneBy(array('post' => $post, 'locale' => $localeIT));
		
		$localeES =  $localeRepository->findOneBy(array('locale' => 'es'));
		$postES = $postTranslateRepository->findOneBy(array('post' => $post, 'locale' => $localeES));
		
		$localeES =  $localeRepository->findOneBy(array('locale' => 'de'));
		$postDE = $postTranslateRepository->findOneBy(array('post' => $post, 'locale' => $localeES));
		
        return $this->render('COMAdminBundle:blog:edit_post.html.twig', array(
			'post' => $post,
			'postSchools' => $postSchools,
			'postFR' => $postFR,
			'postEN' => $postEN,
			'postMG' => $postMG,
			'postIT' => $postIT,
			'postES' => $postES,
			'postDE' => $postDE,
		));
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
}
