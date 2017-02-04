<?php

namespace COM\SchoolBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

use COM\SchoolBundle\Entity\School;
use COM\PlatformBundle\Entity\Locale;
use COM\PlatformBundle\Entity\View;
use COM\BlogBundle\Entity\Post;

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
}
