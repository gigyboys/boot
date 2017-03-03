<?php

namespace COM\AdvertBundle\Twig;

use COM\AdvertBundle\Service\AdvertService;
use COM\AdvertBundle\Entity\Advert;

class AdvertExtension extends \Twig_Extension {

    protected $advertService;

    public function __construct(AdvertService $advertService) {
        $this->advertService = $advertService;
    }

    public function getFunctions() {
        return array(
            'getAdvertTranslate' => new \Twig_Function_Method($this, 'getAdvertTranslateFunction'),
            'advertIllustration' => new \Twig_Function_Method($this, 'advertIllustrationFunction'),
        );
    }

    public function getAdvertTranslateFunction(Advert $advert, $locale) {
        return $this->advertService->getAdvertTranslate($advert, $locale);
    }

    public function advertIllustrationFunction(Advert $advert) {
        return $this->advertService->getIllustration($advert);
    }

    public function getName() {
            return 'advert_extension';
    }

}