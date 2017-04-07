<?php

namespace COM\AdvertBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

use COM\AdvertBundle\Entity\Advert;
use COM\AdvertBundle\Entity\AdvertTranslate;
use COM\PlatformBundle\Entity\View;

class AdvertController extends Controller
{
    public function indexAction()
    {
		$em = $this->getDoctrine()->getManager();
		$advertRepository = $em->getRepository('COMAdvertBundle:Advert');
		$advertTranslateRepository = $em->getRepository('COMAdvertBundle:AdvertTranslate');
		$localeRepository = $em->getRepository('COMPlatformBundle:Locale');
		
		$adverts = $advertRepository->findAll();
		
        return $this->render('COMAdvertBundle:advert:index_advert.html.twig', array(
			'adverts' => $adverts,
			'entityView' => 'advert',
		));
    }
	
    public function viewAction($slug)
    {
		$em = $this->getDoctrine()->getManager();
		$advertRepository = $em->getRepository('COMAdvertBundle:Advert');
		$advertTranslateRepository = $em->getRepository('COMAdvertBundle:AdvertTranslate');
		$localeRepository = $em->getRepository('COMPlatformBundle:Locale');
		
		$user = $this->getUser();
		
		$request = $this->get('request');
		$shortLocale = $request->getLocale();
		$locale = $localeRepository->findOneBy(array(
			'locale' => $shortLocale,
		));
		
		$advert = $advertRepository->findOneBy(array(
			'slug' => $slug,
		));
		
		$advertTranslate = $advertTranslateRepository->findOneBy(array(
			'advert' => $advert,
			'locale' => $locale,
		));
		
		$platformService = $this->container->get('com_platform.platform_service');
		$platformService->registerView($advert, $user, $request);
		
        return $this->render('COMAdvertBundle:advert:view_advert.html.twig', array(
			'advert' => $advert,
			'locale' => $locale,
			'advertTranslate' => $advertTranslate,
			'entityView' => 'advert',
		));
    }
}
