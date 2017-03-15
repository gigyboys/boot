<?php

namespace COM\BlogBundle\Service;

use Doctrine\ORM\EntityManager;
use COM\BlogBundle\Entity\Post;
use COM\BlogBundle\Entity\Category;
use COM\BlogBundle\Entity\PostTranslate;
use COM\BlogBundle\Entity\CategoryTranslate;
use COM\PlatformBundle\Entity\Locale;

class BlogService {

    protected $em;

    public function __construct(EntityManager $em) {
        $this->em = $em;
    }
    
    public function hydratePostLang(Post $post, Locale $locale) {
		$postTranslateRepository = $this->em->getRepository('COMBlogBundle:PostTranslate');
		
		$postTranslate = $postTranslateRepository->findOneBy(array(
			'post' => $post,
			'locale' => $locale,
		));
		if($postTranslate){
			$post->setTitle($postTranslate->getTitle());
			$post->setContent($postTranslate->getContent());
			$post->setDescription($postTranslate->getDescription());
		}else{
			$post->setTitle($post->getDefaultTitle());
			$post->setContent("");
			$post->setDescription("");
		}
		
		return $post;
    }
    
    public function getPostTranslate(Post $post, $locale) {
        $postTranslateRepository = $this->em->getRepository('COMBlogBundle:PostTranslate');

        $postTranslate = $postTranslateRepository->findOneBy(array(
            'post' => $post,
            'locale' => $locale,
        ));
        
		return $postTranslate;
    }
    
    public function getIllustration(Post $post) {
        $postIllustrationRepository = $this->em->getRepository('COMBlogBundle:PostIllustration');

        $postIllustration = $postIllustrationRepository->findOneBy(array(
            'post' => $post,
            'current' => true,
        ));

        if($postIllustration){
            return $postIllustration->getPath();
        }
        else{
            return 'default.jpeg';
            //return 'default.png';
        }
    }
    
    public function hydrateCategoryLang(Category $category, Locale $locale) {
		$categoryTranslateRepository = $this->em->getRepository('COMBlogBundle:CategoryTranslate');
		
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
        $categoryTranslateRepository = $this->em->getRepository('COMBlogBundle:CategoryTranslate');

        $categoryTranslate = $categoryTranslateRepository->findOneBy(array(
            'category' => $category,
            'locale' => $locale,
        ));
        
		return $categoryTranslate;
    }
    
    public function getAllCategory() {
        $categoryRepository = $this->em->getRepository('COMBlogBundle:Category');

        $categories = $categoryRepository->findAll();
        
		return $categories;
    }
    
    public function getCategoryByPost(Post $post) {
        $categoryPostRepository = $this->em->getRepository('COMBlogBundle:CategoryPost');
		$categoryRepository = $this->em->getRepository('COMBlogBundle:Category');

        $categoryPost = $categoryPostRepository->findOneBy(array(
            'post' => $post,
        ));
        if($categoryPost){
			return $categoryPost->getCategory();
		}else{
			return null;
		}
    }

}