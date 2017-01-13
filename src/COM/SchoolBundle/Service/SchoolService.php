<?php

namespace COM\SchoolBundle\Service;

use Doctrine\ORM\EntityManager;
use COM\SchoolBundle\Entity\School;

class SchoolService {

    protected $em;

    public function __construct(EntityManager $em) {
        $this->em = $em;
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
}