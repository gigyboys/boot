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
	
    public function indexAction($page, Request $request)
    {
		$em = $this->getDoctrine()->getManager();
		$schoolRepository = $em->getRepository('COMSchoolBundle:School');
		$categoryRepository = $em->getRepository('COMSchoolBundle:Category');;
		$categorySchoolRepository = $em->getRepository('COMSchoolBundle:CategorySchool');
		$typeRepository = $em->getRepository('COMSchoolBundle:Type');
		$typeSchoolRepository = $em->getRepository('COMSchoolBundle:TypeSchool');
		$parameterRepository = $em->getRepository('COMPlatformBundle:Parameter');
		
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
				$publishState = 1; // published == true
				$schools = $schoolRepository->getSchoolSearch($q, $publishState);
				
				$schoolsArray = array();
				$schoolsArrayTmp = array();
				
				$catSlug = $request->query->get('category');
				if($catSlug != "all"){
					$category =  $categoryRepository->findOneBy(array(
						'slug' => $catSlug
					));
					foreach ($schools as $school) {						
						$categorySchool =  $categorySchoolRepository->findOneBy(array(
							'school' => $school,
							'category' => $category
						));
						if($categorySchool){
							array_push($schoolsArrayTmp, $school);
						}
					}
					$schoolsArray = $schoolsArrayTmp;
				}else{
					$schoolsArray = $schools;
				}
				
				$schoolsArrayTmp = array();
				$typeSlug = $request->query->get('type');
				if($typeSlug != "all"){
					$type =  $typeRepository->findOneBy(array(
						'slug' => $typeSlug
					));
					foreach ($schoolsArray as $school) {						
						$typeSchool =  $typeSchoolRepository->findOneBy(array(
							'school' => $school,
							'type' => $type
						));
						if($typeSchool){
							array_push($schoolsArrayTmp, $school);
						}
					}
					$schoolsArray = $schoolsArrayTmp;
				}
								
				$parameter = $parameterRepository->findOneBy(array(
					'parameter' => 'schools_by_page',
				));
				$limit = $parameter->getValue();
				$offset = ($page-1) * $limit;
				
				if(count($schoolsArray) < $limit+$offset){
					$end = count($schoolsArray);
				}else{
					$end = $limit+$offset;
				}
				$resultList = array();
				for ($i=$offset; $i<$end; $i++) {
					array_push($resultList, $schoolsArray[$i]);
				}

				$entityView = "school";
				$response = new Response();
				if ($request->isXmlHttpRequest()){
					//listSchool
					$listSchools = array();
					foreach($resultList as $school){
						$school_view = $this->renderView('COMSchoolBundle:school:include/school_item.html.twig', array(
							'school' => $school,
							'locale' => $locale,
						));
						array_push($listSchools, array(
							"school_id" 	=> $school->getId(),
							"school_view" 	=> $school_view,
						));
					}
					
					//pagination
					$pagination = $this->renderView('COMSchoolBundle:school:include/pagination_list_school_search.html.twig', array(
						'entity' 		=> $entity,
						'q' 			=> $q,
						'catSlug'		=> $catSlug,
						'typeSlug'		=> $typeSlug,
						'allSchools' => $schoolsArray,
						'schools' => $resultList,
						'limit' => $limit,
						'currentpage' => $page,
						'locale' => $locale,
					));
					
					$currentUrl = $this->get('router')->generate('cf_platform_search', array(
						'page' => $page,
						'entity' => $entity, 
						'page' => $page, 
						'q' => $q,
						'category' => $catSlug, 
						'type' => $typeSlug
					));
					
					$response->setContent(json_encode(array(
						'state' => 1,
						'schools' => $listSchools,
						'currentpage' => $page,
						'pagination' => $pagination,
						'currentUrl' => $currentUrl,
						'page' => $page,
						'locale' => $locale,
					)));
				}else{
					$response = $this->render('COMPlatformBundle:search:search.html.twig', array(
						'entity' 		=> $entity,
						'q' 			=> $q,
						'catSlug'		=> $catSlug,
						'typeSlug'		=> $typeSlug,
						'resultList' 	=> $resultList,
						'allSchools' 	=> $schoolsArray,
						'limit' 		=> $limit,
						'currentpage' => $page,
						'entityView'	=> $entityView,
						'locale' 		=> $locale,
					));
				}
				return $response;
			break ;
			case "post":
				$posts = $postRepository->getPostSearch($q);
				$resultList = $posts;
				$entityView = "blog";
						
				return $this->render('COMPlatformBundle:search:search.html.twig', array(
					'entity' 		=> $entity,
					'q' 			=> $q,
					'resultList' 	=> $resultList,
					'entityView'	=> $entityView,
					'locale' => $locale,
				));
			break ;
			case "advert":
				$adverts = $advertRepository->getAdvertSearch($q);
				$resultList =  $adverts;
				$entityView = "advert";
						
				return $this->render('COMPlatformBundle:search:search.html.twig', array(
					'entity' 		=> $entity,
					'q' 			=> $q,
					'resultList' 	=> $resultList,
					'entityView'	=> $entityView,
					'locale' => $locale,
				));
			break ;
		}
    }
	
    public function getSingleSchoolAction(Request $request){
		$em = $this->getDoctrine()->getManager();
		$schoolRepository = $em->getRepository('COMSchoolBundle:School');
		$categoryRepository = $em->getRepository('COMSchoolBundle:Category');;
		$categorySchoolRepository = $em->getRepository('COMSchoolBundle:CategorySchool');
		$typeRepository = $em->getRepository('COMSchoolBundle:Type');
		$typeSchoolRepository = $em->getRepository('COMSchoolBundle:TypeSchool');
		$parameterRepository = $em->getRepository('COMPlatformBundle:Parameter');
		
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

		$publishState = 1; // published == true
		$schools = $schoolRepository->getSchoolSearch($q, $publishState);
		
		$schoolsArray = array();
		$schoolsArrayTmp = array();
		
		$catSlug = $request->query->get('category');
		if($catSlug != "all"){
			$category =  $categoryRepository->findOneBy(array(
				'slug' => $catSlug
			));
			foreach ($schools as $school) {						
				$categorySchool =  $categorySchoolRepository->findOneBy(array(
					'school' => $school,
					'category' => $category
				));
				if($categorySchool){
					array_push($schoolsArrayTmp, $school);
				}
			}
			$schoolsArray = $schoolsArrayTmp;
		}else{
			$schoolsArray = $schools;
		}
		
		$schoolsArrayTmp = array();
		$typeSlug = $request->query->get('type');
		if($typeSlug != "all"){
			$type =  $typeRepository->findOneBy(array(
				'slug' => $typeSlug
			));
			foreach ($schoolsArray as $school) {						
				$typeSchool =  $typeSchoolRepository->findOneBy(array(
					'school' => $school,
					'type' => $type
				));
				if($typeSchool){
					array_push($schoolsArrayTmp, $school);
				}
			}
			$schoolsArray = $schoolsArrayTmp;
		}

		$response = new Response();
		if($schoolsArray){
			$entityView = "school";
			
			//get random school
			$randomIndex = rand(0, count($schoolsArray)-1);

			$school = $schoolsArray[$randomIndex];
			$school_view = $this->renderView('COMSchoolBundle:school:include/school_single_result.html.twig', array(
				'school' => $school,
				'locale' => $locale,
			));
			
			$response->setContent(json_encode(array(
				'state' => 1,
				'schoolid' => $school->getId(),
				'schoolname' => $school->getName(),
				'school_view' => $school_view,
			)));
		}else{
			$response->setContent(json_encode(array(
				'state' => 0,
			)));
		}
		
		return $response;
    }
}
