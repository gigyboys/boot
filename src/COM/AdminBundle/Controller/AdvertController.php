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
use COM\AdvertBundle\Form\Type\AdvertCommonType;
use COM\AdvertBundle\Entity\AdvertIllustration;
use COM\AdvertBundle\Form\Type\AdvertIllustrationType;
use COM\AdvertBundle\Form\Type\AdvertTranslateType;

class AdvertController extends Controller
{
	
    public function indexAction()
    {
		$em = $this->getDoctrine()->getManager();
		$advertRepository = $em->getRepository('COMAdvertBundle:Advert');

		$adverts = $advertRepository->findAll();
		
        return $this->render('COMAdminBundle:advert:advert.html.twig', array('adverts' => $adverts));
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
}
