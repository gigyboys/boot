<?php

namespace COM\PlatformBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;

class HomeController extends Controller
{
    public function indexAction(Request $request)
    {
		$em = $this->getDoctrine()->getManager();
		$localeRepository = $em->getRepository('COMPlatformBundle:Locale');
		$parameterRepository = $em->getRepository('COMPlatformBundle:Parameter');
		$categoryRepository = $em->getRepository('COMSchoolBundle:Category');
		
		$shortLocale = $request->getLocale();
		$locale = $localeRepository->findOneBy(array(
			'locale' => $shortLocale,
		));
		
		$parameter = $parameterRepository->findOneBy(array(
			'parameter' => 'categories_index',
		));
		$limit = $parameter->getValue();
		
		$schoolService = $this->container->get('com_school.school_service');
		
		//$categories = $categoryRepository->findAll();
		$categories = $schoolService->getCategoriesWithPublishedSchool(0);
		shuffle($categories);
		
		if($limit > 0){		
			$categoriesLimit = array();
			if(count($categories) < $limit){
				$end = count($categories);
			}else{
				$end = $limit;
			}
			
			for ($i=0; $i<$end; $i++) {
				array_push($categoriesLimit, $categories[$i]);
			}
			
			$categories = $categoriesLimit;
		}
		
		
        return $this->render('COMPlatformBundle:home:home.html.twig', array(
			'locale' => $locale,
			'categories' => $categories,
		));
    }
}
