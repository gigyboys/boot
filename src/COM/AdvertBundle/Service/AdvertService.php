<?php

namespace COM\AdvertBundle\Service;

use Doctrine\ORM\EntityManager;
use COM\AdvertBundle\Entity\Advert;
use COM\AdvertBundle\Entity\Category;
use COM\AdvertBundle\Entity\AdvertTranslate;
use COM\AdvertBundle\Entity\CategoryTranslate;
use COM\PlatformBundle\Entity\Locale;
use COM\SchoolBundle\Entity\School;

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
		if($advertTranslate){
			$advert->setTitle($advertTranslate->getTitle());
			$advert->setContent($advertTranslate->getContent());
		}else{
			$advert->setTitle($advert->getDefaultTitle());
			$advert->setContent("");
		}
		
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
    
    public function hydrateCategoryLang(Category $category, Locale $locale) {
		$categoryTranslateRepository = $this->em->getRepository('COMAdvertBundle:CategoryTranslate');
		
		$categoryTranslate = $categoryTranslateRepository->findOneBy(array(
			'category' => $category,
			'locale' => $locale,
		));
		if($categoryTranslate){
			$category->setTitle($categoryTranslate->getName());
			$category->setDescription($categoryTranslate->getDescription());
		}else{
			$category->setTitle($category->getDefaultTitle());
			$category->setDescription("");
		}
		
		return $category;
    }
    
    public function getCategoryTranslate(Category $category, $locale) {
        $categoryTranslateRepository = $this->em->getRepository('COMAdvertBundle:CategoryTranslate');

        $categoryTranslate = $categoryTranslateRepository->findOneBy(array(
            'category' => $category,
            'locale' => $locale,
        ));
        
		return $categoryTranslate;
    }
    
    public function getAllCategory() {
        $categoryRepository = $this->em->getRepository('COMAdvertBundle:Category');

        $categories = $categoryRepository->findAll();
        
		return $categories;
    }
    
    public function getPublishedAdvertsBySchool(School $school) {
        $advertSchoolRepository = $this->em->getRepository('COMPlatformBundle:AdvertSchool');

		$adverts = array();
		
		$advertSchools = $advertSchoolRepository->findBy(array(
			'school' => $school,
		));
		
		foreach($advertSchools as $advertSchool){
			$advert = $advertSchool->getAdvert();
			if($advert->getPublished()){
				array_push($adverts, $advert);
			}
		}
        
		return $adverts;
    }
    
    public function getCategoryByAdvert(Advert $advert) {
        $categoryAdvertRepository = $this->em->getRepository('COMAdvertBundle:CategoryAdvert');
		$categoryRepository = $this->em->getRepository('COMAdvertBundle:Category');

        $categoryAdvert = $categoryAdvertRepository->findOneBy(array(
            'advert' => $advert,
        ));
        if($categoryAdvert){
			return $categoryAdvert->getCategory();
		}else{
			return null;
		}
    }

}