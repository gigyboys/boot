<?php

namespace COM\SchoolBundle\Service;

use Doctrine\ORM\EntityManager;
use COM\SchoolBundle\Entity\School;
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
}