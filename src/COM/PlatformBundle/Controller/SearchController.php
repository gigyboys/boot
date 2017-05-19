<?php

namespace COM\PlatformBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\RedirectResponse; 
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;

use COM\PlatformBundle\Entity\Locale;
use COM\UserBundle\Entity\User;
use COM\BlogBundle\Entity\Post;
use COM\BlogBundle\Entity\PostTranslate;

class SearchController extends Controller
{
	
    public function indexAction(Request $request)
    {
		$em = $this->getDoctrine()->getManager();
		$schoolRepository = $em->getRepository('COMSchoolBundle:School');
		$postRepository = $em->getRepository('COMBlogBundle:Post');
		$advertRepository = $em->getRepository('COMAdvertBundle:Advert');
		$localeRepository = $em->getRepository('COMPlatformBundle:Locale');
		
		$shortLocale = $request->getLocale();
		$locale = $localeRepository->findOneBy(array(
			'locale' => $shortLocale,
		));
		
		$request = $this->get('request');
		$entity = $request->query->get('entity');
		$q = $request->query->get('q');
		
		$resultList = array();
		$entityView = "";
		switch ($entity){
			case "school":
				$schools = $schoolRepository->getSchoolSearch($q);
				$resultList = $schools;
				$entityView = "school";
			break ;
			case "post":
				$posts = $postRepository->getPostSearch($q);
				$resultList = $posts;
				$entityView = "blog";
			break ;
			case "advert":
				$adverts = $advertRepository->getAdvertSearch($q);
				$resultList =  $adverts;
				$entityView = "advert";
			break ;
		}
		
        return $this->render('COMPlatformBundle:search:search.html.twig', array(
			'entity' 		=> $entity,
			'q' 			=> $q,
			'resultList' 	=> $resultList,
			'entityView'	=> $entityView,
			'locale' => $locale,
		));
    }
}
