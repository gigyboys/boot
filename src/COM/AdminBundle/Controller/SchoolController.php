<?php

namespace COM\AdminBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\RedirectResponse; 
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;

use COM\PlatformBundle\Entity\Locale;
use COM\UserBundle\Entity\User;
use COM\SchoolBundle\Entity\School;
use COM\SchoolBundle\Entity\Logo;
use COM\SchoolBundle\Entity\Cover;
use COM\SchoolBundle\Form\Type\LogoType;
use COM\SchoolBundle\Form\Type\CoverType;
use COM\SchoolBundle\Entity\SchoolTranslate;
use COM\SchoolBundle\Form\Type\SchoolInitType;
use COM\SchoolBundle\Form\Type\SchoolGeneralType;
use COM\SchoolBundle\Form\Type\SchoolTranslateType;

use COM\SchoolBundle\Entity\Category;
use COM\SchoolBundle\Entity\CategorySchool;
use COM\SchoolBundle\Entity\CategoryTranslate;
use COM\SchoolBundle\Form\Type\CategoryCommonType;
use COM\SchoolBundle\Form\Type\CategoryInitType;
use COM\SchoolBundle\Form\Type\CategoryTranslateType;

class SchoolController extends Controller
{
	
    public function indexAction()
    {
		$em = $this->getDoctrine()->getManager();
		$schoolRepository = $em->getRepository('COMSchoolBundle:School');

		$schools = $schoolRepository->findAll();
		$publishedSchools = $schoolRepository->findBy(array(
			'published' => true
		));
		$notPublishedSchools = $schoolRepository->findBy(array(
			'published' => false
		));
		
        return $this->render('COMAdminBundle:school:school.html.twig', array(
			'schools' => $schools,
			'publishedSchools' => $publishedSchools,
			'notPublishedSchools' => $notPublishedSchools,
		));
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
			$published = false;
			$school->setPublished($published);
			
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
			
			$url = $this->get('router')->generate('com_admin_school_edit', array('id' => $school->getId()));
			return new RedirectResponse($url);
		}
		
        return $this->render('COMAdminBundle:school:add_school.html.twig', array(
			'formInitSchool' => $formInitSchool->createView(),
		));
    }
	
	/*
	 * School Edition for view
	 */
    public function editSchoolAction($id)
    {
		$em = $this->getDoctrine()->getManager();
		$schoolRepository = $em->getRepository('COMSchoolBundle:School');
		$school = $schoolRepository->find($id);
		
        return $this->render('COMAdminBundle:school:edit_school.html.twig', array(
			'school' => $school,
		));
    }

	public function changeLogoAction($school_id)
    {
        
        $em = $this->getDoctrine()->getManager();
		$schoolRepository = $em->getRepository('COMSchoolBundle:School');
        $logoRepository = $em->getRepository('COMSchoolBundle:Logo');
        
        $logo = new Logo();
        $school = $schoolRepository->find($school_id);
        
        $formLogo = $this->get('form.factory')->create(new LogoType, $logo);
        $formLogo->handleRequest($this->getRequest());

        if ($formLogo->isValid()) {
            $logos = $logoRepository->findBy(array('school' => $school));
            
            foreach ($logos as $schoolLogo) {
                $schoolLogo->setCurrentLogo(false);
            }
			
            $logo->setCurrentLogo(true);
            $logo->setSchool($school);
			
            $em->persist($logo);
            $em->flush();
			
            $logo116x116 = $this->renderView('COMAdminBundle:school:include/logo116x116.html.twig', array(
			  'logoPath' => $logo->getWebPath()
			));
			
			$response = new Response();
            $response->setContent(json_encode(array(
                'state' => 1,
                'logo116x116' => $logo116x116,
            )));
            $response->headers->set('Content-Type', 'application/json');
            
            return $response;
        }

        $response = new Response();
		$response->setContent(json_encode(array(
			'state' => 0,
		)));
		$response->headers->set('Content-Type', 'application/json');
		
		return $response;
    }

	public function addCoverAction($school_id)
    {
        $em = $this->getDoctrine()->getManager();
		$schoolRepository = $em->getRepository('COMSchoolBundle:School');
        $coverRepository = $em->getRepository('COMSchoolBundle:Cover');
        
        $cover = new Cover();
        $school = $schoolRepository->find($school_id);
        
        $formCover = $this->get('form.factory')->create(new CoverType, $cover);
        $formCover->handleRequest($this->getRequest());

        if ($formCover->isValid()) {
            $covers = $coverRepository->findBy(array('school' => $school));
            
            foreach ($covers as $schoolCover) {
                $schoolCover->setCurrent(false);
            }
			
            $cover->setCurrent(true);
            $cover->setSchool($school);
			
            $em->persist($cover);
            $em->flush();
			
            $cover300x100 = $this->renderView('COMAdminBundle:school:include/cover300x100.html.twig', array(
			  'coverPath' => $cover->getWebPath()
			));
			
			$response = new Response();
            $response->setContent(json_encode(array(
                'state' => 1,
                'cover300x100' => $cover300x100,
            )));
            $response->headers->set('Content-Type', 'application/json');
            
            return $response;
        }

        $response = new Response();
		$response->setContent(json_encode(array(
			'state' => 0,
		)));
		$response->headers->set('Content-Type', 'application/json');
		
		return $response;
    }
	
    public function tooglePublicationAction($school_id, Request $request)
    {
		$em = $this->getDoctrine()->getManager();
		$schoolRepository = $em->getRepository('COMSchoolBundle:School');
        
        $school = $schoolRepository->find($school_id);
		
        $response = new Response();
		
		if ($school) {
			if($school->getPublished() == true){
				$school->setPublished(false) ;
			}else{
				$school->setPublished(true) ;
			}
            
			$em->persist($school);
            $em->flush();

            $response->setContent(json_encode(array(
                'state' => 1,
                'published' => $school->getPublished(),
            )));
		}else{
            $response->setContent(json_encode(array(
                'state' => 0,
            )));
		}
        $response->headers->set('Content-Type', 'application/json');
		return $response;
    }
	
    public function editSchoolCommonAction($id, Request $request)
    {
		$em = $this->getDoctrine()->getManager();
		$schoolRepository = $em->getRepository('COMSchoolBundle:School');
        
        $school = $schoolRepository->find($id);
        
		$schoolTemp = new School();
		$formSchoolGeneral = $this->get('form.factory')->create(new SchoolGeneralType(), $schoolTemp);
		
        $response = new Response();
		
		if ($formSchoolGeneral->handleRequest($request)->isValid()) {
			$school->setName($schoolTemp->getName());
			$school->setShortName($schoolTemp->getShortName());
			
			$platformService = $this->container->get('com_platform.platform_service');
			$slug = $platformService->sluggify($schoolTemp->getSlug());
			$school->setSlug($slug);
            
			$em->persist($school);
            $em->flush();

            $response->setContent(json_encode(array(
                'state' => 1,
                'name' => $school->getName(),
                'shortName' => $school->getShortName(),
                'slug' => $school->getSlug(),
            )));
		}else{
            $response->setContent(json_encode(array(
                'state' => 0,
            )));
		}
        $response->headers->set('Content-Type', 'application/json');
		return $response;
    }
	
    public function editSchoolTranslateAction($id, $locale, Request $request)
    {
		$em = $this->getDoctrine()->getManager();
		$schoolRepository = $em->getRepository('COMSchoolBundle:School');
		$schoolTranslateRepository = $em->getRepository('COMSchoolBundle:SchoolTranslate');
		$localeRepository = $em->getRepository('COMPlatformBundle:Locale');
        
        $school = $schoolRepository->find($id);
        $localeObj = $localeRepository->findOneBy(array(
			'locale' => $locale,
		));
        
		$schoolTranslateTemp = new SchoolTranslate();
		$formSchoolTranslate = $this->get('form.factory')->create(new SchoolTranslateType(), $schoolTranslateTemp);
		
        $response = new Response();
		
		if ($formSchoolTranslate->handleRequest($request)->isValid()) {
			$schoolTranslate = $schoolTranslateRepository->findOneBy(array(
				'school' => $school,
				'locale' => $localeObj,
			));
			if(!$schoolTranslate){
				$schoolTranslate = new SchoolTranslate();
				$schoolTranslate->setLocale($localeObj);
				$schoolTranslate->setSchool($school);
			}
			$schoolTranslate->setName($schoolTranslateTemp->getName());
			$schoolTranslate->setShortDescription($schoolTranslateTemp->getShortDescription());
			$schoolTranslate->setDescription($schoolTranslateTemp->getDescription());
            
			$em->persist($schoolTranslate);
            $em->flush();

            $response->setContent(json_encode(array(
                'state' => 1,
                'name' => $schoolTranslate->getName(),
                'shortDescription' => $schoolTranslate->getShortDescription(),
                'description' => $schoolTranslate->getDescription(),
            )));
		}else{
            $response->setContent(json_encode(array(
                'state' => 0,
            )));
		}
        $response->headers->set('Content-Type', 'application/json');
		return $response;
    }
	
	/*
	 * category school
	 */
    public function categoryAction()
    {
		$em = $this->getDoctrine()->getManager();
		$categoryRepository = $em->getRepository('COMSchoolBundle:Category');

		$categories = $categoryRepository->findAll();
		
        return $this->render('COMAdminBundle:school:category.html.twig', array('categories' => $categories));
    }
	
    public function addCategoryAction(Request $request)
    {
		$em = $this->getDoctrine()->getManager();
		$localeRepository = $em->getRepository('COMPlatformBundle:Locale');
		
		$category = new Category();
		$formInitCategory = $this->get('form.factory')->create(new CategoryInitType(), $category);
		
		if ($formInitCategory->handleRequest($request)->isValid()) {
			$platformService = $this->container->get('com_platform.platform_service');
			$slug = $platformService->sluggify($category->getDefaultName());
			$category->setSlug($slug);
			
			$locales = $localeRepository->findAll();
			foreach($locales as $locale){
				$categoryTranslate = new CategoryTranslate();
				$categoryTranslate->setCategory($category);
				$categoryTranslate->setLocale($locale);
				$categoryTranslate->setName($locale->getLocale()." ".$category->getDefaultName());
				$categoryTranslate->setDescription($locale->getLocale().". Description .".$category->getDefaultName());
				$em->persist($categoryTranslate);
			}
			
			$em->persist($category);
			$em->flush();
			
			$url = $this->get('router')->generate('com_admin_school_category_edit', array('id' => $category->getId()));
			return new RedirectResponse($url);
		}
		
        return $this->render('COMAdminBundle:school:add_category.html.twig', array(
			'formInitCategory' => $formInitCategory->createView(),
		));
    }
	
    public function editCategoryAction($id)
    {
		$em = $this->getDoctrine()->getManager();
		$categoryRepository = $em->getRepository('COMSchoolBundle:Category');
		$localeRepository = $em->getRepository('COMPlatformBundle:Locale');

		$category = $categoryRepository->find($id);
		
        return $this->render('COMAdminBundle:school:edit_category.html.twig', array(
			'category' => $category,
		));
    }
	
    public function editCategoryCommonAction($id, Request $request)
    {
		$em = $this->getDoctrine()->getManager();
		$categoryRepository = $em->getRepository('COMSchoolBundle:Category');
        
        $category = $categoryRepository->find($id);
        
		$categoryTemp = new Category();
		$formCategoryCommon = $this->get('form.factory')->create(new CategoryCommonType(), $categoryTemp);
		
        $response = new Response();
		
		if ($formCategoryCommon->handleRequest($request)->isValid()) {
			$category->setDefaultName($categoryTemp->getDefaultName());
			
			$platformService = $this->container->get('com_platform.platform_service');
			$slug = $platformService->sluggify($categoryTemp->getSlug());
			
			$category->setSlug($slug);
            
			$em->persist($category);
            $em->flush();

            $response->setContent(json_encode(array(
                'state' => 1,
                'defaultName' => $category->getDefaultName(),
                'slug' => $category->getSlug(),
            )));
		}else{
            $response->setContent(json_encode(array(
                'state' => 0,
            )));
		}
        $response->headers->set('Content-Type', 'application/json');
		return $response;
    }
	
    public function editCategoryTranslateAction($id, $locale, Request $request)
    {
		$em = $this->getDoctrine()->getManager();
		$categoryRepository = $em->getRepository('COMSchoolBundle:Category');
		$categoryTranslateRepository = $em->getRepository('COMSchoolBundle:CategoryTranslate');
		$localeRepository = $em->getRepository('COMPlatformBundle:Locale');
        
        $category = $categoryRepository->find($id);
        $localeObj = $localeRepository->findOneBy(array(
			'locale' => $locale,
		));
        
		$categoryTranslateTemp = new CategoryTranslate();
		$formCategoryTranslate = $this->get('form.factory')->create(new CategoryTranslateType(), $categoryTranslateTemp);
		
        $response = new Response();
		
		if ($formCategoryTranslate->handleRequest($request)->isValid()) {
			$categoryTranslate = $categoryTranslateRepository->findOneBy(array(
				'category' => $category,
				'locale' => $localeObj,
			));
			if(!$categoryTranslate){
				$categoryTranslate = new CategoryTranslate();
				$categoryTranslate->setLocale($localeObj);
				$categoryTranslate->setCategory($category);
			}
			$categoryTranslate->setName($categoryTranslateTemp->getName());
			$categoryTranslate->setDescription($categoryTranslateTemp->getDescription());
            
			$em->persist($categoryTranslate);
            $em->flush();

            $response->setContent(json_encode(array(
                'state' => 1,
                'name' => $categoryTranslate->getName(),
                'description' => $categoryTranslate->getDescription()
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
