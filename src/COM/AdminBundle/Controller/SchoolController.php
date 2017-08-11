<?php

namespace COM\AdminBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\RedirectResponse; 
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;

use COM\PlatformBundle\Entity\Locale;
use COM\UserBundle\Entity\User;
use COM\SchoolBundle\Entity\School;
use COM\SchoolBundle\Entity\Type;
use COM\SchoolBundle\Entity\TypeSchool;
use COM\SchoolBundle\Entity\SchoolInit;
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
		$schoolRepository = $em->getRepository('COMSchoolBundle:School');
		$typeRepository = $em->getRepository('COMSchoolBundle:Type');
		$typeSchoolRepository = $em->getRepository('COMSchoolBundle:TypeSchool');
		
		$schoolInit = new SchoolInit();
		$formInitSchool = $this->get('form.factory')->create(new SchoolInitType(), $schoolInit);
		
		if ($formInitSchool->handleRequest($request)->isValid()) {
			$platformService = $this->container->get('com_platform.platform_service');
			
			$school = new School();
			$school->setName($schoolInit->getName());
			$school->setShortName($schoolInit->getShortName());
			
			$slug = $platformService->sluggify($school->getName());
			
			$slugtmp = $slug;
			$notSlugs = array(
				"school", 
				"blog", 
				"advert", 
				"forum", 
				"about", 
				"team", 
				"legal-notice", 
				"contact", 
				"newsletter",
				"categories", 
				"category", 
				"user", 
				"admin", 
				"logout", 
				"login", 
				"register",
			);
            $isSluggable = true;
            $i = 2;
            do {
                $schooltmp = $schoolRepository->findOneBy(array(
					'slug' => $slugtmp
				));
				if($schooltmp || in_array($slugtmp, $notSlugs)){
					$slugtmp = $slug."-".$i;
					$i++;
				}
				else{
					$isSluggable = false;
				}
            } 
            while ($isSluggable);
            $slug = $slugtmp;
			
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
			//typeschool
			if($schoolInit->getTypeId() == 1 || $schoolInit->getTypeId() == 2){
				$type = $typeRepository->find($schoolInit->getTypeId());
				$typeSchool = new TypeSchool();
				$typeSchool->setSchool($school);
				$typeSchool->setType($type);
				
				$em->persist($typeSchool);
			}
			
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
		
        $response = new Response();

		$response->setContent(json_encode(array(
			'state' => 0,
		)));

        if ($formLogo->isValid()) {
            $logos = $logoRepository->findBy(array('school' => $school));
            
            foreach ($logos as $schoolLogo) {
                $schoolLogo->setCurrentLogo(false);
				$em->persist($schoolLogo);
            }
			
            $logo->setCurrentLogo(true);
            $logo->setSchool($school);
			
            $em->persist($logo);
            $em->flush();
			
            $logo116x116 = $this->renderView('COMAdminBundle:school:include/logo116x116.html.twig', array(
			  'logoPath' => $logo->getWebPath()
			));
			
            $response->setContent(json_encode(array(
                'state' => 1,
                'logo116x116' => $logo116x116,
            )));
        }
		
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
		$typeRepository = $em->getRepository('COMSchoolBundle:Type');
		$typeSchoolRepository = $em->getRepository('COMSchoolBundle:TypeSchool');
        
        $school = $schoolRepository->find($id);
        
		$schoolTemp = new SchoolInit();
		$formSchoolGeneral = $this->get('form.factory')->create(new SchoolGeneralType(), $schoolTemp);
		
        $response = new Response();
		
		if ($formSchoolGeneral->handleRequest($request)->isValid()) {
			$school->setName($schoolTemp->getName());
			$school->setShortName($schoolTemp->getShortName());
			
			$platformService = $this->container->get('com_platform.platform_service');
			$slug = $platformService->sluggify($schoolTemp->getSlug());
			
			$slugtmp = $slug;
			$notSlugs = array(
				"home", 
				"school", 
				"blog", 
				"advert", 
				"forum", 
				"about", 
				"team", 
				"legal-notice", 
				"contact", 
				"newsletter",
				"categories", 
				"category", 
				"user", 
				"admin", 
				"logout", 
				"login", 
				"register",
			);
            $isSluggable = true;
            $i = 2;
            do {
                $schooltmp = $schoolRepository->findOneBy(array(
					'slug' => $slugtmp
				));
				if(($schooltmp && $schooltmp->getId() != $school->getId()) || in_array($slugtmp, $notSlugs)){
					$slugtmp = $slug."-".$i;
					$i++;
				}
				else{
					$isSluggable = false;
				}
            } 
            while ($isSluggable);
            $slug = $slugtmp;
			
			$school->setSlug($slug);
            
			$em->persist($school);
			
			//schooltype
			$type = $typeRepository->find($schoolTemp->getTypeId());
			if(!$type){
				//set private default
				$type = $typeRepository->find(2);
			}
			
			$schoolType = $typeSchoolRepository->findOneBy(array(
				'school' => $school,
			));
			if($schoolType){
				$em->remove($schoolType);
			}
			
			$typeSchoolNew = new TypeSchool();
			$typeSchoolNew->setSchool($school);
			$typeSchoolNew->setType($type);
			
			$em->persist($typeSchoolNew);
			
            $em->flush();

            $response->setContent(json_encode(array(
                'state' => 1,
                'name' => $school->getName(),
                'shortName' => $school->getShortName(),
                'slug' => $school->getSlug(),
                'typeId' => $type->getId(),
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
		$categoryRepository = $em->getRepository('COMSchoolBundle:Category');
		
		$category = new Category();
		$formInitCategory = $this->get('form.factory')->create(new CategoryInitType(), $category);
		
		if ($formInitCategory->handleRequest($request)->isValid()) {
			$platformService = $this->container->get('com_platform.platform_service');
			$slug = $platformService->sluggify($category->getDefaultName());
			
			$slugtmp = $slug;
			$notSlugs = array(
				"category", 
				"categories",
			);
            $isSluggable = true;
            $i = 2;
            do {
                $categorytmp = $categoryRepository->findOneBy(array(
					'slug' => $slugtmp
				));
				if($categorytmp || in_array($slugtmp, $notSlugs)){
					$slugtmp = $slug."-".$i;
					$i++;
				}
				else{
					$isSluggable = false;
				}
            } 
            while ($isSluggable);
            $slug = $slugtmp;
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
			
			$slugtmp = $slug;
			$notSlugs = array(
				"category", 
				"categories",
			);
            $isSluggable = true;
            $i = 2;
            do {
                $categorytmp = $categoryRepository->findOneBy(array(
					'slug' => $slugtmp
				));
				if(($categorytmp && $categorytmp->getId() != $category->getId()) || in_array($slugtmp, $notSlugs)){
					$slugtmp = $slug."-".$i;
					$i++;
				}
				else{
					$isSluggable = false;
				}
            } 
            while ($isSluggable);
            $slug = $slugtmp;
			
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
	
	public function categoriesAction($school_id)
    {
		$em = $this->getDoctrine()->getManager();
		$schoolRepository = $em->getRepository('COMSchoolBundle:School');
		$categoryRepository = $em->getRepository('COMSchoolBundle:Category');

		$school = $schoolRepository->find($school_id);
		$categories = $categoryRepository->findAll();
		
        return $this->render('COMAdminBundle:school:school_categories.html.twig', array(
			'school' => $school,
			'categories' => $categories
		));
    }
	
    public function toogleCategoryAction($school_id, $category_id, Request $request)
    {
		$em = $this->getDoctrine()->getManager();
		$schoolRepository = $em->getRepository('COMSchoolBundle:School');
		$categoryRepository = $em->getRepository('COMSchoolBundle:Category');
		$categorySchoolRepository = $em->getRepository('COMSchoolBundle:CategorySchool');
        
        $school = $schoolRepository->find($school_id);
        $category = $categoryRepository->find($category_id);
		
        $response = new Response();
		
		if ($school && $category) {
			$categorySchool = $categorySchoolRepository->findOneBy(array(
                'school' => $school,
                'category' => $category,
            ));
			
			if($categorySchool){
				$em->remove($categorySchool);
				$isCategory = false;
			}else{
				$categorySchool = new CategorySchool;
				$categorySchool->setSchool($school);
				$categorySchool->setCategory($category);
				$categorySchool->setCurrent(false);
				
				$em->persist($categorySchool);
				$isCategory = true;
			}
            
            $em->flush();

            $response->setContent(json_encode(array(
                'state' => 1,
                'isCategory' => $isCategory,
            )));
		}else{
            $response->setContent(json_encode(array(
                'state' => 0,
            )));
		}
        $response->headers->set('Content-Type', 'application/json');
		return $response;
    }
	
	public function editCategorySchoolsAction($id)
    {
		$em = $this->getDoctrine()->getManager();
		$schoolRepository = $em->getRepository('COMSchoolBundle:School');
		$categoryRepository = $em->getRepository('COMSchoolBundle:Category');
		$categorySchoolRepository = $em->getRepository('COMSchoolBundle:CategorySchool');

		$category = $categoryRepository->find($id);
		$categorySchools = $categorySchoolRepository->findBy(array(
			'category' => $category
		));
		$defaultCategorySchool = $categorySchoolRepository->findOneBy(array(
			'category' => $category,
			'current' => true,
		));
		
        return $this->render('COMAdminBundle:school:edit_category_schools.html.twig', array(
			'category' => $category,
			'categorySchools' => $categorySchools,
			'defaultCategorySchool' => $defaultCategorySchool,
		));
    }
	
    public function editCategorySetDefaultSchoolAction($id, $school_id, Request $request)
    {
		$em = $this->getDoctrine()->getManager();
		$schoolRepository = $em->getRepository('COMSchoolBundle:School');
		$categoryRepository = $em->getRepository('COMSchoolBundle:Category');
		$categorySchoolRepository = $em->getRepository('COMSchoolBundle:CategorySchool');
        
		
		$response = new Response();
		$category = $categoryRepository->find($id);
		if ($category) {
			if ($school_id != 0) {
				$school = $schoolRepository->find($school_id);
				if ($school) {
					$categorySchools = $categorySchoolRepository->findBy(array(
						'category' => $category,
					));
					
					foreach ($categorySchools as $categorySchoolTemp) {
						$categorySchoolTemp->setCurrent(false);
						$em->persist($categorySchoolTemp);
					}
					
					$categorySchool = $categorySchoolRepository->findOneBy(array(
						'category' => $category,
						'school' => $school,
					));
					if ($categorySchool) {
						$categorySchool->setCurrent(true);
						$em->persist($categorySchool);
					}else{
						$categorySchool = new CategorySchool;
						$categorySchool->setSchool($school);
						$categorySchool->setCategory($category);
						$categorySchool->setCurrent(true);
						$em->persist($categorySchool);
					}
				
					$em->flush();

					$response->setContent(json_encode(array(
						'state' => 1,
						'categoryId' => $category->getId(),
						'schoolId' => $categorySchool->getSchool()->getId(),
						'schoolName' => $categorySchool->getSchool()->getName(),
					)));
				}else{
					$response->setContent(json_encode(array(
						'state' => 0,
					)));
				}
			}else{
				$categorySchools = $categorySchoolRepository->findBy(array(
					'category' => $category,
				));
				
				foreach ($categorySchools as $categorySchoolTemp) {
					$categorySchoolTemp->setCurrent(false);
					$em->persist($categorySchoolTemp);
				}
			
				$em->flush();

				$response->setContent(json_encode(array(
					'state' => 1,
					'categoryId' => $category->getId(),
					'schoolId' => 0,
				)));
			}
		}else{
			$response->setContent(json_encode(array(
				'state' => 0,
			)));
		}
        $response->headers->set('Content-Type', 'application/json');
		return $response;
    }
	
    public function editCategoryRemoveSchoolAction($id, $school_id, Request $request)
    {
		$em = $this->getDoctrine()->getManager();
		$schoolRepository = $em->getRepository('COMSchoolBundle:School');
		$categoryRepository = $em->getRepository('COMSchoolBundle:Category');
		$categorySchoolRepository = $em->getRepository('COMSchoolBundle:CategorySchool');
        
		
		$response = new Response();
		$category = $categoryRepository->find($id);
		$school = $schoolRepository->find($school_id);
		
		if ($school && $category) {
			
			$categorySchool = $categorySchoolRepository->findOneBy(array(
				'category' => $category,
				'school' => $school,
			));
			if ($categorySchool) {
				$isDefaultSchool = 0;
				if($categorySchool->getCurrent()){
					$isDefaultSchool = 1;
				}
				
				$em->remove($categorySchool);
				$em->flush();

				$response->setContent(json_encode(array(
					'state' => 1,
					'categoryId' => $category->getId(),
					'schoolId' => $school->getId(),
					'schoolName' => $school->getName(),
					'isDefaultSchool' => $isDefaultSchool,
				)));
			}else{
				$response->setContent(json_encode(array(
					'state' => 0,
				)));
			}
		}else{
			$response->setContent(json_encode(array(
				'state' => 0,
			)));
		}
		
        $response->headers->set('Content-Type', 'application/json');
		return $response;
    }
}
