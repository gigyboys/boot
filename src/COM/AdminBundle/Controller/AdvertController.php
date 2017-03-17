<?php

namespace COM\AdminBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\RedirectResponse; 
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;

use COM\PlatformBundle\Entity\Locale;
use COM\UserBundle\Entity\User;
use COM\AdvertBundle\Entity\Advert;
use COM\AdvertBundle\Entity\AdvertTranslate;
use COM\AdvertBundle\Entity\Category;
use COM\AdvertBundle\Entity\CategoryTranslate;
use COM\AdvertBundle\Form\Type\AdvertCommonType;
use COM\AdvertBundle\Form\Type\CategoryCommonType;
use COM\AdvertBundle\Entity\AdvertIllustration;
use COM\AdvertBundle\Form\Type\AdvertIllustrationType;
use COM\AdvertBundle\Form\Type\AdvertTranslateType;
use COM\AdvertBundle\Form\Type\CategoryTranslateType;
use COM\AdvertBundle\Form\Type\AdvertInitType;
use COM\AdvertBundle\Form\Type\CategoryInitType;

class AdvertController extends Controller
{
	
    public function indexAction()
    {
		$em = $this->getDoctrine()->getManager();
		$advertRepository = $em->getRepository('COMAdvertBundle:Advert');

		$adverts = $advertRepository->findAll();
		
        return $this->render('COMAdminBundle:advert:advert.html.twig', array('adverts' => $adverts));
    }
	
    public function addAdvertAction(Request $request)
    {
		$em = $this->getDoctrine()->getManager();
		$localeRepository = $em->getRepository('COMPlatformBundle:Locale');
		
		$advert = new Advert();
		$formAdvertPost = $this->get('form.factory')->create(new AdvertInitType(), $advert);
		
		if ($formAdvertPost->handleRequest($request)->isValid()) {
			$platformService = $this->container->get('com_platform.platform_service');
			$slug = $platformService->sluggify($advert->getDefaultTitle());
			$advert->setSlug($slug);
			$advert->setDate(new \DateTime());
			$advert->setViewNumber(0);
			$user = $this->getUser();
			$advert->setUser($user);
			
			$locales = $localeRepository->findAll();
			foreach($locales as $locale){
				$advertTranslate = new AdvertTranslate();
				$advertTranslate->setAdvert($advert);
				$advertTranslate->setLocale($locale);
				$advertTranslate->setTitle($locale->getLocale()." ".$advert->getDefaultTitle());
				$advertTranslate->setContent($locale->getLocale().". Content .".$advert->getDefaultTitle());
				$em->persist($advertTranslate);
			}
			
			$em->persist($advert);
			$em->flush();
			
			$url = $this->get('router')->generate('com_admin_advert_edit', array('id' => $advert->getId()));
			return new RedirectResponse($url);
		}
		
        return $this->render('COMAdminBundle:advert:add_advert.html.twig', array(
			'formAdvertPost' => $formAdvertPost->createView(),
		));
    }
	
    public function editAdvertAction($id)
    {
		$em = $this->getDoctrine()->getManager();
		$advertRepository = $em->getRepository('COMAdvertBundle:Advert');
		$localeRepository = $em->getRepository('COMPlatformBundle:Locale');

		$advert = $advertRepository->find($id);
		
        return $this->render('COMAdminBundle:advert:edit_advert.html.twig', array(
			'advert' => $advert,
		));
    }

	public function changeIllustrationAction($id)
    {
        $em = $this->getDoctrine()->getManager();
		$advertRepository = $em->getRepository('COMAdvertBundle:Advert');
        $advertIllustrationRepository = $em->getRepository('COMAdvertBundle:AdvertIllustration');
        
        $advertIllustration = new AdvertIllustration();
        $advert = $advertRepository->find($id);
        
        $formAdvertIllustration = $this->get('form.factory')->create(new AdvertIllustrationType, $advertIllustration);
        $formAdvertIllustration->handleRequest($this->getRequest());

        if ($formAdvertIllustration->isValid()) {
            $advertIllustrations = $advertIllustrationRepository->findBy(array('advert' => $advert));
            
            foreach ($advertIllustrations as $advertIllustrationTemp) {
                $advertIllustrationTemp->setCurrent(false);
            }
			
            $advertIllustration->setCurrent(true);
            $advertIllustration->setAdvert($advert);
			
            $em->persist($advertIllustration);
            $em->flush();
			
            $illustration116x116 = $this->renderView('COMAdminBundle:advert:include/illustration116x116.html.twig', array(
			  'path' => $advertIllustration->getWebPath()
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
	
    public function editAdvertCommonAction($id, Request $request)
    {
		$em = $this->getDoctrine()->getManager();
		$advertRepository = $em->getRepository('COMAdvertBundle:Advert');
        
        $advert = $advertRepository->find($id);
        
		$advertTemp = new Advert();
		$formAdvertCommon = $this->get('form.factory')->create(new AdvertCommonType(), $advertTemp);
		
        $response = new Response();
		
		if ($formAdvertCommon->handleRequest($request)->isValid()) {
			$advert->setDefaultTitle($advertTemp->getDefaultTitle());
			
			$platformService = $this->container->get('com_platform.platform_service');
			$slug = $platformService->sluggify($advertTemp->getSlug());
			
			$advert->setSlug($slug);
            
			$em->persist($advert);
            $em->flush();

            $response->setContent(json_encode(array(
                'state' => 1,
                'defaultTitle' => $advert->getDefaultTitle(),
                'slug' => $advert->getSlug(),
            )));
		}else{
            $response->setContent(json_encode(array(
                'state' => 0,
            )));
		}
        $response->headers->set('Content-Type', 'application/json');
		return $response;
    }
	
    public function editAdvertTranslateAction($id, $locale, Request $request)
    {
		$em = $this->getDoctrine()->getManager();
		$advertRepository = $em->getRepository('COMAdvertBundle:Advert');
		$advertTranslateRepository = $em->getRepository('COMAdvertBundle:AdvertTranslate');
		$localeRepository = $em->getRepository('COMPlatformBundle:Locale');
        
        $advert = $advertRepository->find($id);
        $localeObj = $localeRepository->findOneBy(array(
			'locale' => $locale,
		));
        
		$advertTranslateTemp = new AdvertTranslate();
		$formAdvertTranslate = $this->get('form.factory')->create(new AdvertTranslateType(), $advertTranslateTemp);
		
        $response = new Response();
		
		if ($formAdvertTranslate->handleRequest($request)->isValid()) {
			$advertTranslate = $advertTranslateRepository->findOneBy(array(
				'advert' => $advert,
				'locale' => $localeObj,
			));
			if(!$advertTranslate){
				$advertTranslate = new AdvertTranslate();
				$advertTranslate->setLocale($localeObj);
				$advertTranslate->setAdvert($advert);
			}
			$advertTranslate->setTitle($advertTranslateTemp->getTitle());
			$advertTranslate->setContent($advertTranslateTemp->getContent());
            
			$em->persist($advertTranslate);
            $em->flush();

            $response->setContent(json_encode(array(
                'state' => 1,
                'title' => $advertTranslate->getTitle(),
                'content' => $advertTranslate->getContent(),
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
		$categoryRepository = $em->getRepository('COMAdvertBundle:Category');

		$categories = $categoryRepository->findAll();
		
        return $this->render('COMAdminBundle:advert:category.html.twig', array('categories' => $categories));
    }
	
    public function addCategoryAction(Request $request)
    {
		$em = $this->getDoctrine()->getManager();
		$localeRepository = $em->getRepository('COMPlatformBundle:Locale');
		
		$category = new Category();
		$formInitCategory = $this->get('form.factory')->create(new CategoryInitType(), $category);
		
		if ($formInitCategory->handleRequest($request)->isValid()) {
			$platformService = $this->container->get('com_platform.platform_service');
			$slug = $platformService->sluggify($category->getDefaultName());
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
			
			$url = $this->get('router')->generate('com_admin_advert_category_edit', array('id' => $category->getId()));
			return new RedirectResponse($url);
		}
		
        return $this->render('COMAdminBundle:advert:add_category.html.twig', array(
			'formInitCategory' => $formInitCategory->createView(),
		));
    }
	
    public function editCategoryAction($id)
    {
		$em = $this->getDoctrine()->getManager();
		$categoryRepository = $em->getRepository('COMAdvertBundle:Category');
		$localeRepository = $em->getRepository('COMPlatformBundle:Locale');

		$category = $categoryRepository->find($id);
		
        return $this->render('COMAdminBundle:advert:edit_category.html.twig', array(
			'category' => $category,
		));
    }
	
    public function editCategoryCommonAction($id, Request $request)
    {
		$em = $this->getDoctrine()->getManager();
		$categoryRepository = $em->getRepository('COMAdvertBundle:Category');
        
        $category = $categoryRepository->find($id);
        
		$categoryTemp = new Category();
		$formCategoryCommon = $this->get('form.factory')->create(new CategoryCommonType(), $categoryTemp);
		
        $response = new Response();
		
		if ($formCategoryCommon->handleRequest($request)->isValid()) {
			$category->setDefaultName($categoryTemp->getDefaultName());
			
			$platformService = $this->container->get('com_platform.platform_service');
			$slug = $platformService->sluggify($categoryTemp->getSlug());
			
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
		$categoryRepository = $em->getRepository('COMAdvertBundle:Category');
		$categoryTranslateRepository = $em->getRepository('COMAdvertBundle:CategoryTranslate');
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
