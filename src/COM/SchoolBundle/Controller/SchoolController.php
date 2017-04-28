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
    public function indexAction(Request $request)
    {
		$em = $this->getDoctrine()->getManager();
		$localeRepository = $em->getRepository('COMPlatformBundle:Locale');
		$schoolRepository = $em->getRepository('COMSchoolBundle:School');
		
		$shortLocale = $request->getLocale();
		$locale = $localeRepository->findOneBy(array(
			'locale' => $shortLocale,
		));
		
		$schools = $schoolRepository->findAll();
		
		$schoolService = $this->container->get('com_school.school_service');
		foreach($schools as $school){
			$schoolService->hydrateSchoolLang($school, $locale);
		}
		
        return $this->render('COMSchoolBundle:school:index.html.twig', array(
			'schools' => $schools,
			'entityView' => 'school',
		));
    }
	
    public function viewAction($slug, $type, Request $request)
    {
		$em = $this->getDoctrine()->getManager();
		$schoolRepository = $em->getRepository('COMSchoolBundle:School');
		$postRepository = $em->getRepository('COMBlogBundle:Post');
		$postSchoolRepository = $em->getRepository('COMPlatformBundle:PostSchool');
		$advertSchoolRepository = $em->getRepository('COMPlatformBundle:AdvertSchool');
		$localeRepository = $em->getRepository('COMPlatformBundle:Locale');
		$fieldRepository = $em->getRepository('COMSchoolBundle:Field');
		
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
		
		$postSchools = $postSchoolRepository->findBy(array(
			'school' => $school,
		));
		
		$blogService = $this->container->get('com_blog.blog_service');
		foreach($postSchools as $postSchool){
			$post = $postSchool->getPost();
			$blogService->hydratePostLang($post, $locale);
		}
		
		$advertSchools = $advertSchoolRepository->findBy(array(
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
		
		$types = array("about", "post", "advert", "evaluation");
		if (!in_array($type, $types)) {
			$type = "about";
		}
        return $this->render('COMSchoolBundle:school:view_school.html.twig', array(
			'school' => $school,
			'advertSchools' => $advertSchools,
			'postSchools' => $postSchools,
			'locale' => $locale,
			'fields' => $fields,
			'entityView' => 'school',
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
