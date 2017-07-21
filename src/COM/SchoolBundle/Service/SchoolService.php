<?php

namespace COM\SchoolBundle\Service;

use Doctrine\ORM\EntityManager;
use COM\SchoolBundle\Entity\School;
use COM\SchoolBundle\Entity\Type;
use COM\SchoolBundle\Entity\TypeSchool;
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
    
    public function getCategoriesWithPublishedSchool($limit) {
        $categoryRepository = $this->em->getRepository('COMSchoolBundle:Category');
        $categorySchoolRepository = $this->em->getRepository('COMSchoolBundle:CategorySchool');

		$categoryArray = array();
        $categories = $categoryRepository->findAll();
		
		foreach($categories as $category){
			
			$categorySchools = $categorySchoolRepository->findBy(array(
				'category' => $category,
			));
			$isCategory = false;
			foreach($categorySchools as $categorySchool){
				$school = $categorySchool->getSchool();
				if($school->getPublished()){
					$isCategory = true;
				}
			}
			if($isCategory){
				array_push($categoryArray, $category);
			}
		}
		
		if($limit == 0){
			return $categoryArray;
		}else{			
			$categoriesLimit = array();
			if(count($categoryArray) < $limit){
				$end = count($categoryArray);
			}else{
				$end = $limit;
			}
			
			for ($i=0; $i<$end; $i++) {
				array_push($categoriesLimit, $categoryArray[$i]);
			}
			
			return $categoriesLimit;
		}
    }
	
	public function getRelatedSchools(School $school, $limit) {
        $schoolRepository = $this->em->getRepository('COMSchoolBundle:School');
        $categorySchoolRepository = $this->em->getRepository('COMSchoolBundle:CategorySchool');

		$schoolIds = array();
		$schools = array();
		$categories = array();
        $categorySchools = $categorySchoolRepository->findBy(array(
			'school' => $school,
		));
		
		foreach($categorySchools as $categorySchool){
			$category = $categorySchool->getCategory();
			array_push($categories, $category);
			$schoolTemps = $this->getAllSchoolByCategory($category, true);
			foreach($schoolTemps as $schoolTemp){			
				if (!in_array($schoolTemp->getId(), $schoolIds) && $schoolTemp->getId() != $school->getId()) {
					array_push($schoolIds, $schoolTemp->getId());
				}	
			}
		}
		
		shuffle($schoolIds);
		$start = 0;
		if(count($schoolIds) < $start+$limit){
			$end = count($schoolIds);
		}else{
			$end = $start+$limit;
		}
		
		for ($i=$start; $i<$end; $i++) {
			$school = $schoolRepository->find($schoolIds[$i]);
			array_push($schools, $school);
		}
        
		return $schools;
    }
	
	public function getCategoriesBySchool(School $school, $limit, $shuffle) {
		$categorySchoolRepository = $this->em->getRepository('COMSchoolBundle:CategorySchool');
		
        $categories = array();
        $categorySchools = $categorySchoolRepository->findBy(array(
			'school' => $school,
		));
		
		foreach($categorySchools as $categorySchool){
			$category = $categorySchool->getCategory();
			array_push($categories, $category);
		}
		
		if($shuffle){
			shuffle($categories);
		}
		
		if($limit == 0){
			return $categories;
		}else{			
			$categoriesLimit = array();
			if(count($categories) < $limit){
				$end = count($categories);
			}else{
				$end = $limit;
			}
			
			for ($i=0; $i<$end; $i++) {
				array_push($categoriesLimit, $categories[$i]);
			}
			
			return $categoriesLimit;
		}
    }
	
	public function getType($school) {
        $typeRepository = $this->em->getRepository('COMSchoolBundle:Type');
        $typeSchoolRepository = $this->em->getRepository('COMSchoolBundle:TypeSchool');

        $typeSchool = $typeSchoolRepository->findOneBy(array(
            'school' => $school,
        ));
        if ($typeSchool){
			return $typeSchool->getType();
		}else{
			return null;
		}
    }
	
	public function getLastAddedSchools($limit) {
        $schoolRepository = $this->em->getRepository('COMSchoolBundle:School');
        
		$schoolTemps = $schoolRepository->getLastAddedSchools($limit);
		$schools = array();
			
		for ($i=count($schoolTemps)-1; $i>=0; $i--) {
			array_push($schools, $schoolTemps[$i]);
		}
        
		return $schools;
    }
    
    public function getEvaluatedSchools($limit) {
        $schoolRepository = $this->em->getRepository('COMSchoolBundle:School');
        $evaluationRepository = $this->em->getRepository('COMSchoolBundle:Evaluation');

		$schools = array();
        $schoolTemps = $schoolRepository->findBy(array(
			'published' => true,
		));
		
		foreach($schoolTemps as $school){
			
			$evaluations = $evaluationRepository->findBy(array(
				'school' => $school,
			));
			if($evaluations){
				array_push($schools, $school);
			}
		}
		
		if($limit == 0){
			return $schools;
		}else{			
			$schoolsLimit = array();
			if(count($schools) < $limit){
				$end = count($schools);
			}else{
				$end = $limit;
			}
			
			for ($i=0; $i<$end; $i++) {
				array_push($schoolsLimit, $schools[$i]);
			}
			
			return $schoolsLimit;
		}
    }
    
    public function getAllEvaluations() {
        $schoolRepository = $this->em->getRepository('COMSchoolBundle:School');
        $evaluationRepository = $this->em->getRepository('COMSchoolBundle:Evaluation');

		$evaluations = array();
        $evaluationTemps = $evaluationRepository->findAll();
		
		foreach($evaluationTemps as $evaluation){
			if($evaluation->getSchool()->getPublished()){
				array_push($evaluations, $evaluation);
			}
		}
		
		return $evaluations;
    }
	
	
}