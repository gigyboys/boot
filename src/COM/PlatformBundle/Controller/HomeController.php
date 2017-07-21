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
		$schoolRepository = $em->getRepository('COMSchoolBundle:School');
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
		
		//school
		$allSchools = $schoolRepository->findBy(array(
			'published' => true,
		));
		
		//$evaluated Schools
		$evaluatedSchools = $schoolService->getEvaluatedSchools(0);
		
		//all published evaluations in published school
		$allEvaluations = $schoolService->getAllEvaluations();
		
		//$categories
		$allCategories = $schoolService->getCategoriesWithPublishedSchool(0);
		shuffle($allCategories);
		
		if($limit > 0){		
			$categoriesLimit = array();
			if(count($allCategories) < $limit){
				$end = count($allCategories);
			}else{
				$end = $limit;
			}
			
			for ($i=0; $i<$end; $i++) {
				array_push($categoriesLimit, $allCategories[$i]);
			}
			
			$categories = $categoriesLimit;
		}
		
		
        return $this->render('COMPlatformBundle:home:home.html.twig', array(
			'locale' => $locale,
			'categories' => $categories,
			'allSchools' => $allSchools,
			'allCategories' => $allCategories,
			'evaluatedSchools' => $evaluatedSchools,
			'allEvaluations' => $allEvaluations,
		));
    }
}
