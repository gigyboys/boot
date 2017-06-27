<?php

namespace COM\SchoolBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\RedirectResponse; 

use COM\SchoolBundle\Entity\School;
use COM\SchoolBundle\Entity\Evaluation;
use COM\SchoolBundle\Entity\SchoolSubscription;
use COM\PlatformBundle\Entity\Locale;
use COM\PlatformBundle\Entity\View;
use COM\BlogBundle\Entity\Post;
use COM\SchoolBundle\Form\Type\EvaluationType;

class SchoolController extends Controller
{
    public function indexAction($page, Request $request)
    {
		$em = $this->getDoctrine()->getManager();
		$localeRepository = $em->getRepository('COMPlatformBundle:Locale');
		$parameterRepository = $em->getRepository('COMPlatformBundle:Parameter');
		$schoolRepository = $em->getRepository('COMSchoolBundle:School');
		
		$shortLocale = $request->getLocale();
		$locale = $localeRepository->findOneBy(array(
			'locale' => $shortLocale,
		));
		$parameter = $parameterRepository->findOneBy(array(
			'parameter' => 'schools_by_page',
		));
		$limit = $parameter->getValue();
		$offset = ($page-1) * $limit;
		$publishState = 1; // published == true
		$schools = $schoolRepository->getSchoolOffsetLimit($offset, $limit, $publishState);
		
		$allSchools = $schoolRepository->findBy(array(
			"published" 	=> true
		));
		
		$schoolService = $this->container->get('com_school.school_service');
		foreach($schools as $school){
			$schoolService->hydrateSchoolLang($school, $locale);
		}
		
		$response = new Response();
		if ($request->isXmlHttpRequest()){
			//listSchool
			$listSchools = array();
			foreach($schools as $school){
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
			$pagination = $this->renderView('COMSchoolBundle:school:include/pagination_list_school.html.twig', array(
				'allSchools' => $allSchools,
				'schools' => $schools,
				'limit' => $limit,
				'currentpage' => $page,
				'locale' => $locale,
			));
			
			$currentUrl = $this->get('router')->generate('com_school_home', array('page' => $page));
			
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
			if(!$schools){
				$url = $this->get('router')->generate('com_school_home', array('page' => 1));
				return new RedirectResponse($url);
			}
			$response = $this->render('COMSchoolBundle:school:index.html.twig', array(
				'allSchools' => $allSchools,
				'schools' => $schools,
				'currentpage' => $page,
				'limit' => $limit,
				'locale' => $locale,
				'entityView' => 'school',
			));
		}
		
		return $response;
    }
	
	/*
	* view list all categories
	*/
	public function categoriesAction(Request $request)
    {
		$em = $this->getDoctrine()->getManager();
		$localeRepository = $em->getRepository('COMPlatformBundle:Locale');
		$parameterRepository = $em->getRepository('COMPlatformBundle:Parameter');
		$categoryRepository = $em->getRepository('COMSchoolBundle:Category');
		
		$shortLocale = $request->getLocale();
		$locale = $localeRepository->findOneBy(array(
			'locale' => $shortLocale,
		));
		
		$limit = 0;
		
		$schoolService = $this->container->get('com_school.school_service');
		
		$categories = $schoolService->getCategoriesWithPublishedSchool($limit);
		//$categories = null;
		
		
        return $this->render('COMSchoolBundle:school:categories.html.twig', array(
			'locale' => $locale,
			'categories' => $categories,
		));
		
    }
	
	/*
	 * view category
	 */
    public function viewCategoryAction($slug, $page, Request $request)
    {
		$em = $this->getDoctrine()->getManager();
		$localeRepository = $em->getRepository('COMPlatformBundle:Locale');
		$parameterRepository = $em->getRepository('COMPlatformBundle:Parameter');
		$schoolRepository = $em->getRepository('COMSchoolBundle:School');
		$categoryRepository = $em->getRepository('COMSchoolBundle:Category');
		$categorySchoolRepository = $em->getRepository('COMSchoolBundle:CategorySchool');
		
		$shortLocale = $request->getLocale();
		$locale = $localeRepository->findOneBy(array(
			'locale' => $shortLocale,
		));
		
		$category = $categoryRepository->findOneBy(array(
			'slug' => $slug,
		));
		
		$limit = $parameterRepository->findOneBy(array(
			'parameter' => 'schools_by_page',
		))->getValue();
		$offset = ($page-1) * $limit;
		$publishState = true; // published == true
		$schoolService = $this->container->get('com_school.school_service');
		
		$schools = $schoolService->getSchoolByCategoryOffsetLimit($category, $offset, $limit, $publishState);
		
		$allSchools = $schoolService->getAllSchoolByCategory($category, $publishState);
		
		foreach($schools as $school){
			$schoolService->hydrateSchoolLang($school, $locale);
		}
		
		$response = new Response();
		if ($request->isXmlHttpRequest()){
			//listSchool
			$listSchools = array();
			foreach($schools as $school){
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
			$pagination = $this->renderView('COMSchoolBundle:school:include/pagination_view_category.html.twig', array(
				'allSchools' => $allSchools,
				'schools' => $schools,
				'category' => $category,
				'currentpage' => $page,
				'locale' => $locale,
			));
			
			$currentUrl = $this->get('router')->generate('com_school_category_view', array(
				'slug' => $category->getSlug(),
				'page' => $page,
			));
			
			$response->setContent(json_encode(array(
				'state' => 1,
				'schools' => $listSchools,
				'currentpage' => $page,
				'pagination' => $pagination,
				'currentUrl' => $currentUrl,
				'category' => $category,
				'page' => $page,
				'locale' => $locale,
			)));
		}else{
			if(!$schools){
				$url = $this->get('router')->generate('com_school_home', array('page' => 1));
				return new RedirectResponse($url);
			}
			$response = $this->render('COMSchoolBundle:school:view_category.html.twig', array(
				'category' => $category,
				'allSchools' => $allSchools,
				'schools' => $schools,
				'currentpage' => $page,
				'locale' => $locale,
				'entityView' => 'school',
			));
		}
		
		return $response;
    }
	
    public function viewAction($slug, $type, Request $request)
    {
		$em = $this->getDoctrine()->getManager();
		$schoolRepository = $em->getRepository('COMSchoolBundle:School');
		$postRepository = $em->getRepository('COMBlogBundle:Post');
		$schoolContactRepository = $em->getRepository('COMSchoolBundle:SchoolContact');
		$localeRepository = $em->getRepository('COMPlatformBundle:Locale');
		$fieldRepository = $em->getRepository('COMSchoolBundle:Field');
		$categoryRepository = $em->getRepository('COMSchoolBundle:Category');
		$categorySchoolRepository = $em->getRepository('COMSchoolBundle:CategorySchool');
		
		$user = $this->getUser();
		
		$shortLocale = $request->getLocale();
		$locale = $localeRepository->findOneBy(array(
			'locale' => $shortLocale,
		));
		
		$school = $schoolRepository->findOneBy(array(
			'slug' => $slug,
		));
		$schoolService = $this->container->get('com_school.school_service');
		$schoolService->hydrateSchoolLang($school, $locale);
		
		//categories
		$categories = array();
        $categorySchools = $categorySchoolRepository->findBy(array(
			'school' => $school,
		));
		
		foreach($categorySchools as $categorySchool){
			$category = $categorySchool->getCategory();
			array_push($categories, $category);
		}
		
		//posts
		$blogService = $this->container->get('com_blog.blog_service');
		$posts = $blogService->getPublishedPostsBySchool($school);
		foreach($posts as $post){
			$blogService->hydratePostLang($post, $locale);
		}
		
		//advert
		$advertService = $this->container->get('com_advert.advert_service');
		$adverts = $advertService->getPublishedAdvertsBySchool($school);
		foreach($adverts as $advert){
			$advertService->hydrateAdvertLang($advert, $locale);
		}
		
		$schoolContacts = $schoolContactRepository->findBy(array(
			'school' => $school,
		));
		
		$fields = $fieldRepository->findBy(array(
			'school' => $school
		));
		foreach($fields as $field){
			$schoolService->hydrateFieldLang($field, $locale);
		}
		
		$platformService = $this->container->get('com_platform.platform_service');
		$platformService->registerView($school, $user, $request);
		
		$types = array("about", "post", "advert", "evaluation", "contact");
		if (!in_array($type, $types)) {
			$type = "about";
		}
        return $this->render('COMSchoolBundle:school:view_school.html.twig', array(
			'school' => $school,
			'categories' => $categories,
			'adverts' => $adverts,
			'posts' => $posts,
			'schoolContacts' => $schoolContacts,
			'locale' => $locale,
			'fields' => $fields,
			'entityView' => 'school',
			'viewSchool' => true,
			'type' => $type,
		));
    }
	
    public function viewByIdAction($id, Request $request)
    {
		$em = $this->getDoctrine()->getManager();
		$schoolRepository = $em->getRepository('COMSchoolBundle:School');
		
		$school = $schoolRepository->find($id);
		$url = $this->get('router')->generate('com_school_view', array('slug' => $school->getSlug()));
		return new RedirectResponse($url);
    }
	
	public function addEvaluationAction($id, Request $request)
    {
		if ($request->isXmlHttpRequest()){
			$em = $this->getDoctrine()->getManager();
			$schoolRepository = $em->getRepository('COMSchoolBundle:School');
			
			$user = $this->getUser();
			
			if($user){
				$school = $schoolRepository->find($id);
				
				$evaluation = new Evaluation();
				$formEvaluation = $this->get('form.factory')->create(new EvaluationType(), $evaluation);
				
				$response = new Response();
				
				if ($formEvaluation->handleRequest($request)->isValid()) {
					
					$evaluation->setUser($user);
					$evaluation->setSchool($school);
					$evaluation->setDate(new \DateTime());
					
					$em->persist($evaluation);
					$em->flush();
					
					$evaluationItem = $this->renderView('COMSchoolBundle:school:include/evaluation_item.html.twig', array(
					  'evaluation' => $evaluation
					));
					$response->setContent(json_encode(array(
						'state' => 1,
						'schoolId' => $school->getId(),
						'evaluationId' => $evaluation->getId(),
						'evaluationMark' => $evaluation->getMark(),
						'evaluationComment' => $evaluation->getComment(),
						'userId' => $user->getId(),
						'evaluationItem' => $evaluationItem,
					)));
				}else{
					$response->setContent(json_encode(array(
						'state' => 0,
						'message' => 'serveur message : une erreur est survenue',
					)));
				}
			}else{
				$response->setContent(json_encode(array(
					'state' => 0,
					'message' => 'serveur message : user not connected',
				)));
			}
			$response->headers->set('Content-Type', 'application/json');
			return $response;
			
		}else{
            throw new NotFoundHttpException('Page not found');
        }
    }
	
	public function toogleSubscriptionAction($school_id, Request $request)
    {
		$em = $this->getDoctrine()->getManager();
		$schoolRepository = $em->getRepository('COMSchoolBundle:School');
		
		$school = $schoolRepository->find($school_id);
		$user = $this->getUser();
		
        $response = new Response();
		
		if ($school && $user) {
			$schoolSubscriptionRepository = $em->getRepository('COMSchoolBundle:SchoolSubscription');
			
			$schoolSubscription = $schoolSubscriptionRepository->findOneBy(array(
				'user' => $user,
				'school' => $school,
			));
			
			if($schoolSubscription){
				if($schoolSubscription->getActive()){
					$schoolSubscription->setActive(false);
				}else{
					$schoolSubscription->setActive(true);
				}
			}else{
				$schoolSubscription = new SchoolSubscription();
				$schoolSubscription->setSchool($school);
				$schoolSubscription->setUser($user);
				$schoolSubscription->setActive(true);
				$schoolSubscription->setDate(new \DateTime());
			}
			
			$em->persist($schoolSubscription);
			$em->flush();
			
			if($schoolSubscription->getActive()){
				$active = 1;
			}else{
				$active = 0;
			}
			$response->setContent(json_encode(array(
				'state' => 1,
				'active' => $active,
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
