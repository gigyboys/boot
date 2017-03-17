<?php

namespace COM\AdvertBundle\Twig;

use COM\AdvertBundle\Service\AdvertService;
use COM\AdvertBundle\Entity\Advert;
use COM\AdvertBundle\Entity\Category;

class AdvertExtension extends \Twig_Extension {

    protected $advertService;

    public function __construct(AdvertService $advertService) {
        $this->advertService = $advertService;
    }

    public function getFunctions() {
        return array(
            'getAdvertTranslate' => new \Twig_Function_Method($this, 'getAdvertTranslateFunction'),
            'advertIllustration' => new \Twig_Function_Method($this, 'advertIllustrationFunction'),
            'getAdvertCategoryTranslate' => new \Twig_Function_Method($this, 'getCategoryTranslateFunction'),
            'getAllAdvertCategory' => new \Twig_Function_Method($this, 'getAllCategoryFunction'),
            'getCategoryByAdvert' => new \Twig_Function_Method($this, 'getCategoryByPostFunction'),
        );
    }

    public function getAdvertTranslateFunction(Advert $advert, $locale) {
        return $this->advertService->getAdvertTranslate($advert, $locale);
    }

    public function advertIllustrationFunction(Advert $advert) {
        return $this->advertService->getIllustration($advert);
    }

    public function getCategoryTranslateFunction(Category $category, $locale) {
        return $this->advertService->getCategoryTranslate($category, $locale);
    }

    public function getAllCategoryFunction() {
        return $this->advertService->getAllCategory();
    }

    public function getCategoryByPostFunction(Advert $advert) {
        return $this->advertService->getCategoryByPost($advert);
    }

    public function getName() {
            return 'advert_extension';
    }

}