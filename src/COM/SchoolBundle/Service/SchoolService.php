<?php

namespace COM\SchoolBundle\Service;

use Doctrine\ORM\EntityManager;
use COM\SchoolBundle\Entity\School;
use COM\SchoolBundle\Entity\Field;
use COM\SchoolBundle\Entity\Evaluation;
use COM\BlogBundle\Entity\Post;
use COM\AdvertBundle\Entity\Advert;
use COM\UserBundle\Entity\User;
use COM\PlatformBundle\Entity\Locale;

class SchoolService {

    protected $em;

    public function __construct(EntityManager $em) {
        $this->em = $em;
    }
    
    public function hydrateSchoolLang(School $school, Locale $locale) {
		$schoolTranslateRepository = $this->em->getRepository('COMSchoolBundle:SchoolTranslate');
		
		$schoolTranslate = $schoolTranslateRepository->findOneBy(array(
			'school' => $school,
			'locale' => $locale,
		));
		
		$school->setDescription($schoolTranslate->getDescription());
		$school->setShortDescription($schoolTranslate->getShortDescription());
		
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
		
		$field->setName($fieldTranslate->getName());
		$field->setDescription($fieldTranslate->getDescription());
		
		return $field;
    }
}