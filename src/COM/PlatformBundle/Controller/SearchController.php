<?php

namespace COM\PlatformBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\RedirectResponse; 

use COM\PlatformBundle\Entity\Locale;
use COM\UserBundle\Entity\User;
use COM\BlogBundle\Entity\Post;
use COM\BlogBundle\Entity\PostTranslate;

class SearchController extends Controller
{
	
    public function indexAction()
    {
		$em = $postRepository = $this->getDoctrine()->getManager();
		$schoolRepository = $em->getRepository('COMSchoolBundle:School');
		$postRepository = $em->getRepository('COMBlogBundle:Post');
		$advertRepository = $em->getRepository('COMAdvertBundle:Advert');
		$localeRepository = $em->getRepository('COMPlatformBundle:Locale');
		
		$request = $this->get('request');
		$entity = $request->query->get('entity');
		$q = $request->query->get('q');
		
		$resultList = array();
		switch ($entity){
			case "school":
				$schools = $schoolRepository->getSchoolSearch($q);
				$resultList = $schools;
			break ;
			case "post":
				$posts = $postRepository->findAll();
				$resultList = $posts;
			break ;
			case "advert":
				$adverts = $advertRepository->findAll();
				$resultList =  $adverts;
			break ;
		}
		
        return $this->render('COMPlatformBundle:search:search.html.twig', array(
			'entity' 		=> $entity,
			'q' 			=> $q,
			'resultList' 	=> $resultList,
			'entityView'	=> $entity
		));
    }
}
