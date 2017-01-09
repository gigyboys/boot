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
        );
    }

    public function getSchoolTranslateFunction($school, $locale) {
        return $this->schoolService->getSchoolTranslate($school, $locale);
    }

    public function getName() {
            return 'school_extension';
    }

}