<?php

namespace COM\SchoolBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;

use COM\SchoolBundle\Entity\School;
use COM\SchoolBundle\Entity\Evaluation;
use COM\PlatformBundle\Entity\Locale;
use COM\PlatformBundle\Entity\View;
use COM\BlogBundle\Entity\Post;
use COM\SchoolBundle\Form\Type\EvaluationType;

class SchoolController extends Controller
{
    public function indexAction()
    {
		$em = $postRepository = $this->getDoctrine()->getManager();
		$localeRepository = $em->getRepository('COMPlatformBundle:Locale');
		$schoolRepository = $em->getRepository('COMSchoolBundle:School');
		
		$request = $this->get('request');
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
	
    public function viewAction($slug)
    {
		$em = $postRepository = $this->getDoctrine()->getManager();
		$schoolRepository = $em->getRepository('COMSchoolBundle:School');
		$schoolTranslateRepository = $em->getRepository('COMSchoolBundle:SchoolTranslate');
		$postRepository = $em->getRepository('COMBlogBundle:Post');
		$postTranslateRepository = $em->getRepository('COMBlogBundle:PostTranslate');
		$postSchoolRepository = $em->getRepository('COMPlatformBundle:PostSchool');
		$advertSchoolRepository = $em->getRepository('COMPlatformBundle:AdvertSchool');
		$localeRepository = $em->getRepository('COMPlatformBundle:Locale');
		$viewRepository = $em->getRepository('COMPlatformBundle:View');
		
		$request = $this->get('request');
		$shortLocale = $request->getLocale();
		$locale = $localeRepository->findOneBy(array(
			'locale' => $shortLocale,
		));
		
		$school = $schoolRepository->findOneBy(array(
			'slug' => $slug,
		));
		$schoolService = $this->container->get('com_school.school_service');
		$schoolService->hydrateSchoolLang($school, $locale);
			
		$schoolTranslate = $schoolTranslateRepository->findOneBy(array(
			'locale' => $locale,
			'school' => $school,
		));
		
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
		
		$platformService = $this->container->get('com_platform.platform_service');
		$platformService->registerView($school, $request);
		
        return $this->render('COMSchoolBundle:school:view_school.html.twig', array(
			'school' => $school,
			'schoolTranslate' => $schoolTranslate,
			'advertSchools' => $advertSchools,
			'postSchools' => $postSchools,
			'entityView' => 'school',
		));
    }
	
	public function addEvaluationAction($id, Request $request)
    {
		if ($request->isXmlHttpRequest()){
			$em = $postRepository = $this->getDoctrine()->getManager();
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
}
