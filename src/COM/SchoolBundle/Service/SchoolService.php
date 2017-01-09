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
}