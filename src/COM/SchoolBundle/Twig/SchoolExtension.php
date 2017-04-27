<?php

namespace COM\SchoolBundle\Twig;

use COM\SchoolBundle\Service\SchoolService;
use COM\SchoolBundle\Entity\School;
use COM\SchoolBundle\Entity\Field;
use COM\BlogBundle\Entity\Post;
use COM\UserBundle\Entity\User;

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
            'getFieldTranslate' => new \Twig_Function_Method($this, 'getFieldTranslateFunction'),
            'getNotSchoolsByPostAndUser' => new \Twig_Function_Method($this, 'getNotSchoolsByPostAndUserFunction'),
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

    public function getFieldTranslateFunction(Field $field, $locale) {
        return $this->schoolService->getFieldTranslate($field, $locale);
    }

    public function getNotSchoolsByPostAndUserFunction(Post $post, User $user) {
        return $this->schoolService->getNotSchoolsByPostAndUser($post, $user);
    }

    public function getName() {
            return 'school_extension';
    }

}