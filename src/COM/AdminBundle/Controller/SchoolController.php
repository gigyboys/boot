<?php

namespace COM\AdminBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\RedirectResponse; 
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;

use COM\PlatformBundle\Entity\Locale;
use COM\UserBundle\Entity\User;
use COM\SchoolBundle\Entity\School;
use COM\SchoolBundle\Entity\SchoolTranslate;
use COM\SchoolBundle\Form\Type\SchoolInitType;

class SchoolController extends Controller
{
	
    public function indexAction()
    {
		$em = $this->getDoctrine()->getManager();
		$schoolRepository = $em->getRepository('COMSchoolBundle:School');

		$schools = $schoolRepository->findAll();
		
        return $this->render('COMAdminBundle:school:school.html.twig', array('schools' => $schools));
    }
	
    public function addSchoolAction(Request $request)
    {
		$em = $this->getDoctrine()->getManager();
		$localeRepository = $em->getRepository('COMPlatformBundle:Locale');
		
		$school = new School();
		$formInitSchool = $this->get('form.factory')->create(new SchoolInitType(), $school);
		
		if ($formInitSchool->handleRequest($request)->isValid()) {
			$platformService = $this->container->get('com_platform.platform_service');
			$slug = $platformService->sluggify($school->getName());
			$school->setSlug($slug);
			
			$locales = $localeRepository->findAll();
			foreach($locales as $locale){
				$schoolTranslate = new SchoolTranslate();
				$schoolTranslate->setSchool($school);
				$schoolTranslate->setLocale($locale);
				$schoolTranslate->setName($school->getName());
				$schoolTranslate->setShortDescription($locale->getLocale().". Short description .".$school->getName());
				$schoolTranslate->setDescription($locale->getLocale().". Description .".$school->getName());
				$em->persist($schoolTranslate);
			}
			
			$em->persist($school);
			
			$em->flush();
			
			$school = new School();
			$formInitSchool = $this->get('form.factory')->create(new SchoolInitType(), $school);
			return $this->render('COMAdminBundle:school:add_school.html.twig', array(
				'formInitSchool' => $formInitSchool->createView(),
			));
		}
		
        return $this->render('COMAdminBundle:school:add_school.html.twig', array(
			'formInitSchool' => $formInitSchool->createView(),
		));
    }
	
    public function editSchoolAction($id)
    {
		$em = $this->getDoctrine()->getManager();
		$schoolRepository = $em->getRepository('COMSchoolBundle:School');
		//$schoolTranslateRepository = $em->getRepository('COMSchoolBundle:SchoolTranslate');
		//$localeRepository = $em->getRepository('COMPlatformBundle:Locale');

		$school = $schoolRepository->find($id);
		
        return $this->render('COMAdminBundle:school:edit_school.html.twig', array(
			'school' => $school,
		));
    }
}
