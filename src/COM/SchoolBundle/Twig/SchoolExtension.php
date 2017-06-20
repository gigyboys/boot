<?php

namespace COM\SchoolBundle\Twig;

use COM\SchoolBundle\Service\SchoolService;
use COM\SchoolBundle\Entity\School;
use COM\SchoolBundle\Entity\Category;
use COM\SchoolBundle\Entity\Field;
use COM\SchoolBundle\Entity\SchoolContact;
use COM\BlogBundle\Entity\Post;
use COM\AdvertBundle\Entity\Advert;
use COM\UserBundle\Entity\User;

class SchoolExtension extends \Twig_Extension {

    protected $schoolService;

    public function __construct(SchoolService $schoolService) {
        $this->schoolService = $schoolService;
    }

    public function getFunctions() {
        return array(
            'getSchoolById' => new \Twig_Function_Method($this, 'getSchoolByIdFunction'),
            'getSchoolTranslate' => new \Twig_Function_Method($this, 'getSchoolTranslateFunction'),
            'schoolLogo' => new \Twig_Function_Method($this, 'schoolLogoFunction'),
            'schoolCover' => new \Twig_Function_Method($this, 'schoolCoverFunction'),
            'schoolAdmins' => new \Twig_Function_Method($this, 'schoolAdminsFunction'),
            'getFieldTranslate' => new \Twig_Function_Method($this, 'getFieldTranslateFunction'),
            'getNotSchoolsByPostAndUser' => new \Twig_Function_Method($this, 'getNotSchoolsByPostAndUserFunction'),
            'getNotSchoolsByAdvertAndUser' => new \Twig_Function_Method($this, 'getNotSchoolsByAdvertAndUserFunction'),
            'isSubscribed' => new \Twig_Function_Method($this, 'isSubscribedFunction'),
            'getSchoolContactTranslate' => new \Twig_Function_Method($this, 'getSchoolContactTranslateFunction'),
            'getSchoolCategoryTranslate' => new \Twig_Function_Method($this, 'getCategoryTranslateFunction'),
            'isCategorySchool' => new \Twig_Function_Method($this, 'isCategorySchoolFunction'),
        );
    }

    public function getSchoolByIdFunction($id) {
        return $this->schoolService->getSchoolById($id);
    }

    public function getSchoolTranslateFunction($school, $locale) {
        return $this->schoolService->getSchoolTranslate($school, $locale);
    }

    public function schoolLogoFunction(School $school) {
        return $this->schoolService->getLogo($school);
    }

    public function schoolCoverFunction(School $school) {
        return $this->schoolService->getCover($school);
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

    public function getNotSchoolsByAdvertAndUserFunction(Advert $advert, User $user) {
        return $this->schoolService->getNotSchoolsByAdvertAndUser($advert, $user);
    }

    public function isSubscribedFunction(School $school, User $user) {
        return $this->schoolService->isSubscribed($school, $user);
    }

    public function getSchoolContactTranslateFunction(SchoolContact $schoolContact, $locale) {
        return $this->schoolService->getSchoolContactTranslate($schoolContact, $locale);
    }

    public function getCategoryTranslateFunction(Category $category, $locale) {
        return $this->schoolService->getCategoryTranslate($category, $locale);
    }

    public function isCategorySchoolFunction(School $school, Category $category) {
        return $this->schoolService->isCategorySchool($school, $category);
    }

    public function getName() {
            return 'school_extension';
    }

}