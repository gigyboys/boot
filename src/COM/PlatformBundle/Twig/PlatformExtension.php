<?php

namespace COM\PlatformBundle\Twig;

use COM\PlatformBundle\Service\PlatformService;
use COM\PlatformBundle\Entity\Locale;

class PlatformExtension extends \Twig_Extension {

    protected $platformService;

    public function __construct(PlatformService $platformService) {
        $this->platformService = $platformService;
    }

    public function getFunctions() {
        return array(
            'getLocales' => new \Twig_Function_Method($this, 'getLocalesFunction'),
            'getLocale' => new \Twig_Function_Method($this, 'getLocaleFunction'),
        );
    }

    public function getLocaleFunction($locales) {
        return $this->platformService->getLocale($locales);
    }

    public function getLocalesFunction() {
        return $this->platformService->getLocales();
    }

    public function getName() {
            return 'platform_extension';
    }

}