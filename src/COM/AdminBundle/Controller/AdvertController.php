<?php

namespace COM\AdminBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\RedirectResponse; 
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;

use COM\PlatformBundle\Entity\Locale;
use COM\PlatformBundle\Entity\PostSchool;
use COM\UserBundle\Entity\User;
use COM\AdvertBundle\Entity\Advert;
use COM\AdvertBundle\Entity\AdvertTranslate;

class AdvertController extends Controller
{
	
    public function indexAction()
    {
		$em = $this->getDoctrine()->getManager();
		$advertRepository = $em->getRepository('COMAdvertBundle:Advert');

		$adverts = $advertRepository->findAll();
		
        return $this->render('COMAdminBundle:advert:advert.html.twig', array('adverts' => $adverts));
    }
}
