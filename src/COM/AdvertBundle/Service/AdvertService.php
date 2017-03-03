<?php

namespace COM\AdvertBundle\Service;

use Doctrine\ORM\EntityManager;
use COM\AdvertBundle\Entity\Advert;
use COM\AdvertBundle\Entity\AdvertTranslate;
use COM\PlatformBundle\Entity\Locale;

class AdvertService {

    protected $em;

    public function __construct(EntityManager $em) {
        $this->em = $em;
    }
    
    public function hydrateAdvertLang(Advert $advert, Locale $locale) {
		$advertTranslateRepository = $this->em->getRepository('COMAdvertBundle:AdvertTranslate');
		
		$advertTranslate = $advertTranslateRepository->findOneBy(array(
			'advert' => $advert,
			'locale' => $locale,
		));
		
		$advert->setTitle($advertTranslate->getTitle());
		$advert->setContent($advertTranslate->getContent());
		
		return $advert;
    }
    
    public function getAdvertTranslate(Advert $advert, $locale) {
        $advertTranslateRepository = $this->em->getRepository('COMAdvertBundle:AdvertTranslate');

        $advertTranslate = $advertTranslateRepository->findOneBy(array(
            'advert' => $advert,
            'locale' => $locale,
        ));
        
		return $advertTranslate;
    }
    
    public function getIllustration(Advert $advert) {
        $advertIllustrationRepository = $this->em->getRepository('COMAdvertBundle:AdvertIllustration');

        $advertIllustration = $advertIllustrationRepository->findOneBy(array(
            'advert' => $advert,
            'current' => true,
        ));

        if($advertIllustration){
            return $advertIllustration->getPath();
        }
        else{
            return 'default.jpeg';
        }
    }

}