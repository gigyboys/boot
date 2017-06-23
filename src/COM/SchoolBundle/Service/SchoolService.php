<?php

namespace COM\SchoolBundle\Service;

use Doctrine\ORM\EntityManager;
use COM\SchoolBundle\Entity\School;
use COM\SchoolBundle\Entity\Category;
use COM\SchoolBundle\Entity\Field;
use COM\SchoolBundle\Entity\SchoolContact;
use COM\SchoolBundle\Entity\Evaluation;
use COM\SchoolBundle\Entity\SchoolOfTheDay;
use COM\BlogBundle\Entity\Post;
use COM\AdvertBundle\Entity\Advert;
use COM\UserBundle\Entity\User;
use COM\PlatformBundle\Entity\Locale;

class SchoolService {

    protected $em;

    public function __construct(EntityManager $em) {
        $this->em = $em;
    }
    
    public function getSchoolById($id) {
        $schoolRepository = $this->em->getRepository('COMSchoolBundle:School');
        $school = $schoolRepository->find($id);
		return $school;
    }
    
    public function hydrateSchoolLang(School $school, Locale $locale) {
		$schoolTranslateRepository = $this->em->getRepository('COMSchoolBundle:SchoolTranslate');
		
		$schoolTranslate = $schoolTranslateRepository->findOneBy(array(
			'school' => $school,
			'locale' => $locale,
		));
		if($schoolTranslate){
			$school->setDescription($schoolTranslate->getDescription());
			$school->setShortDescription($schoolTranslate->getShortDescription());
		}else{
			$school->setDescription("");
			$school->setShortDescription("");
		}
		
		return $school;
    }
    
    public function getSchoolTranslate($school, $locale) {
        $schoolTranslateRepository = $this->em->getRepository('COMSchoolBundle:SchoolTranslate');

        $schoolTranslate = $schoolTranslateRepository->findOneBy(array(
            'school' => $school,
            'locale' => $locale,
        ));
        
		return $schoolTranslate;
    }
    
    public function getLogo(School $school) {
        $logoRepository = $this->em->getRepository('COMSchoolBundle:Logo');

        $logo = $logoRepository->findOneBy(array(
            'school' => $school,
            'currentLogo' => true,
        ));

        if($logo){
            return $logo->getPath();
        }
        else{
            return 'default.jpeg';
        }
    }
    
    public function getCover(School $school) {
        $coverRepository = $this->em->getRepository('COMSchoolBundle:Cover');

        $cover = $coverRepository->findOneBy(array(
            'school' => $school,
            'current' => true,
        ));

        if($cover){
            return $cover->getPath();
        }
        else{
            return 'default.jpeg';
        }
    }
    
    public function getSchoolAdmins($school) {
        $schoolAdminRepository = $this->em->getRepository('COMSchoolBundle:SchoolAdmin');

        $schoolAdmins = $schoolAdminRepository->findBy(array(
            'school' => $school,
            'active' => true,
        ));
        
		return $schoolAdmins;
    }
    
    public function getSchoolNotAdmins($school, $query) {
        $schoolAdminRepository = $this->em->getRepository('COMSchoolBundle:SchoolAdmin');
        $userRepository = $this->em->getRepository('COMUserBundle:User');

        $schoolNotAdmins = $userRepository->findAll();
        
		return $schoolNotAdmins;
    }
    
    public function getEvaluations($school) {
        $evaluationRepository = $this->em->getRepository('COMSchoolBundle:Evaluation');

        $schoolAdmins = $schoolAdminRepository->findBy(array(
            'school' => $school,
            'active' => true,
        ));
        
		return $schoolAdmins;
    }
    
    public function getNotSchoolsByPostAndUser(Post $post, User $user) {
        $schoolAdminRepository = $this->em->getRepository('COMSchoolBundle:SchoolAdmin');
        $postSchoolRepository = $this->em->getRepository('COMPlatformBundle:PostSchool');
        
        $schoolAdmins = $schoolAdminRepository->findBy(array(
            'user' => $user,
            'active' => true,
        ));
		
		$listSchool = array();
		foreach($schoolAdmins as $schoolAdmin){
			$postSchool = $postSchoolRepository->findOneBy(array(
				'school' => $schoolAdmin->getSchool(),
				'post' => $post,
			));
			if(!$postSchool){
				array_push($listSchool, $schoolAdmin->getSchool());
			}
		}
        
		return $listSchool;
    }
    
    public function getNotSchoolsByAdvertAndUser(Advert $advert, User $user) {
        $schoolAdminRepository = $this->em->getRepository('COMSchoolBundle:SchoolAdmin');
        $advertSchoolRepository = $this->em->getRepository('COMPlatformBundle:AdvertSchool');
        
        $schoolAdmins = $schoolAdminRepository->findBy(array(
            'user' => $user,
            'active' => true,
        ));
		
		$listSchool = array();
		foreach($schoolAdmins as $schoolAdmin){
			$advertSchool = $advertSchoolRepository->findOneBy(array(
				'school' => $schoolAdmin->getSchool(),
				'advert' => $advert,
			));
			if(!$advertSchool){
				array_push($listSchool, $schoolAdmin->getSchool());
			}
		}
        
		return $listSchool;
    }
    
    public function getFieldTranslate(Field $field, $locale) {
        $fieldTranslateRepository = $this->em->getRepository('COMSchoolBundle:FieldTranslate');

        $fieldTranslate = $fieldTranslateRepository->findOneBy(array(
            'field' => $field,
            'locale' => $locale,
        ));
        
		return $fieldTranslate;
    }
    
    public function hydrateFieldLang(Field $field, Locale $locale) {
		$fieldTranslateRepository = $this->em->getRepository('COMSchoolBundle:FieldTranslate');
		
		$fieldTranslate = $fieldTranslateRepository->findOneBy(array(
			'field' => $field,
			'locale' => $locale,
		));
		if($fieldTranslate){
			$field->setName($fieldTranslate->getName());
			$field->setDescription($fieldTranslate->getDescription());
		}else{
			$field->setName($field->getDefaultName());
			$field->setDescription("");
		}
		
		return $field;
    }
    
    public function isSubscribed(School $school, User $user) {
        $schoolSubscriptionRepository = $this->em->getRepository('COMSchoolBundle:SchoolSubscription');
        
        $schoolSubscription = $schoolSubscriptionRepository->findOneBy(array(
            'user' => $user,
            'school' => $school,
            'active' => true,
        ));
		
		if($schoolSubscription){
			return true;
		}
        
		return false;
    }
    
    public function getSchoolContactTranslate(SchoolContact $schoolContact, $locale) {
        $schoolContactTranslateRepository = $this->em->getRepository('COMSchoolBundle:SchoolContactTranslate');

        $schoolContactTranslate = $schoolContactTranslateRepository->findOneBy(array(
            'schoolContact' => $schoolContact,
            'locale' => $locale,
        ));
        
		return $schoolContactTranslate;
    }
    
    public function getCategoryTranslate(Category $category, $locale) {
        $categoryTranslateRepository = $this->em->getRepository('COMSchoolBundle:CategoryTranslate');

        $categoryTranslate = $categoryTranslateRepository->findOneBy(array(
            'category' => $category,
            'locale' => $locale,
        ));
        
		return $categoryTranslate;
    }
    
    public function isCategorySchool(School $school, Category $category) {
        $categorySchoolRepository = $this->em->getRepository('COMSchoolBundle:CategorySchool');

        $categorySchool = $categorySchoolRepository->findOneBy(array(
			'school' => $school,
			'category' => $category,
		));
		
		if($categorySchool){
			$isCategory = true;
		}else{
			$isCategory = false;
		}
        
		return $isCategory;
    }
    
    public function getSchoolByCategoryOffsetLimit(Category $category, $offset, $limit, $publishState) {
        $categorySchoolRepository = $this->em->getRepository('COMSchoolBundle:CategorySchool');

		$allSchools = array();
		$schools = array();
        $categorySchools = $categorySchoolRepository->findBy(array(
            'category' => $category,
        ));
		
		foreach($categorySchools as $categorySchool){
			$school = $categorySchool->getSchool();
			if($school->getPublished() == $publishState){
				array_push($allSchools, $school);
			}
		}
		
		$start = $offset;
		if(count($allSchools) < $offset+$limit){
			$end = count($allSchools);
		}else{
			$end = $offset+$limit;
		}
		
		for ($i=$offset; $i<$end; $i++) {
			array_push($schools, $allSchools[$i]);
		}
        
		return $schools;
    }
    
    public function getAllSchoolByCategory(Category $category, $publishState) {
        $categorySchoolRepository = $this->em->getRepository('COMSchoolBundle:CategorySchool');

		$schools = array();
        $categorySchools = $categorySchoolRepository->findBy(array(
            'category' => $category,
        ));
		
		foreach($categorySchools as $categorySchool){
			$school = $categorySchool->getSchool();
			if($school->getPublished() == $publishState){
				array_push($schools, $school);
			}
		}
        
		return $schools;
    }
    
    public function getCurrentSchoolByCategory(Category $category) {
        $categorySchoolRepository = $this->em->getRepository('COMSchoolBundle:CategorySchool');

        $categorySchool = $categorySchoolRepository->findOneBy(array(
            'category' => $category,
            'current' => true,
        ));
		
		if($categorySchool && $categorySchool->getSchool()->getPublished()){
			return $categorySchool->getSchool();
		}else{
			$schools = array();
			$categorySchools = $categorySchoolRepository->findBy(array(
				'category' => $category,
			));
			
			foreach($categorySchools as $categorySchool){
				$school = $categorySchool->getSchool();
				if($school->getPublished() == true){
					array_push($schools, $school);
				}
			}
			if($schools){
				$index = array_rand($schools, 1);
				return $schools[$index];
			}
			
			return null;
		}
    }
    
    public function getSchoolOfTheDay() {
        $schoolOfTheDayRepository = $this->em->getRepository('COMSchoolBundle:SchoolOfTheDay');
        $schoolRepository = $this->em->getRepository('COMSchoolBundle:School');
		
		$date = new \DateTime();
        $schoolOfTheDay = $schoolOfTheDayRepository->findOneBy(array(
            'day' => $date,
            'current' => true,
        ));
		
		if($schoolOfTheDay){
			if($schoolOfTheDay->getSchool()->getPublished()){
				return $schoolOfTheDay->getSchool();
			}else{
				$schoolOfTheDays = $schoolOfTheDayRepository->findBy(array(
					'day' => $date
				));
            
				foreach ($schoolOfTheDays as $schoolOfTheDay) {
					$schoolOfTheDay->setCurrent(false);
				}
				
				$schoolOfTheDay = new SchoolOfTheDay();
				$schoolOfTheDay->setDate($date);
				$schoolOfTheDay->setDay($date);
				$schoolOfTheDay->setCurrent(true);
							
				$schools = $schoolRepository->findBy(array(
					'published' => true,
				));
				$schoolsArray = array();
				foreach($schools as $school){
					array_push($schoolsArray, $school);
				}
				$index = array_rand($schoolsArray, 1);
				$school = $schoolsArray[$index];
				
				
				$schoolOfTheDay->setSchool($school);
				
				$this->em->persist($schoolOfTheDay);
				$this->em->flush();
				
				return $school;
			}
		}else{
			$schoolOfTheDay = new SchoolOfTheDay();
			$schoolOfTheDay->setDate($date);
			$schoolOfTheDay->setDay($date);
			$schoolOfTheDay->setCurrent(true);
							
			$schools = $schoolRepository->findBy(array(
				'published' => true,
			));
			$schoolsArray = array();
			foreach($schools as $school){
				array_push($schoolsArray, $school);
			}
			$index = array_rand($schoolsArray, 1);
			$school = $schoolsArray[$index];
			
			$schoolOfTheDay->setSchool($school);
				
			$this->em->persist($schoolOfTheDay);
			$this->em->flush();
			
			return $school;
		}
    }
}