<?php

namespace COM\SchoolBundle\Twig;

use COM\SchoolBundle\Service\SchoolService;
use COM\SchoolBundle\Entity\School;

class SchoolExtension extends \Twig_Extension {

    protected $schoolService;

    public function __construct(SchoolService $schoolService) {
        $this->schoolService = $schoolService;
    }

    public function getFunctions() {
        return array(
            'getSchoolTranslate' => new \Twig_Function_Method($this, 'getSchoolTranslateFunction'),
            'schoolLogo' => new \Twig_Function_Method($this, 'schoolLogoFunction'),
            'schoolAdmins' => new \Twig_Function_Method($this, 'schoolAdminsFunction'),
        );
    }

    public function getSchoolTranslateFunction($school, $locale) {
        return $this->schoolService->getSchoolTranslate($school, $locale);
    }

    public function schoolLogoFunction(School $school) {
        return $this->schoolService->getLogo($school);
    }

    public function schoolAdminsFunction(School $school) {
        return $this->schoolService->getSchoolAdmins($school);
    }

    public function getName() {
            return 'school_extension';
    }

}