<?php

namespace COM\BlogBundle\Service;

use Doctrine\ORM\EntityManager;
use COM\BlogBundle\Entity\Post;
use COM\BlogBundle\Entity\PostCategory;
use COM\BlogBundle\Entity\PostTranslate;
use COM\BlogBundle\Entity\PostCategoryTranslate;
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
    
    public function hydratePostCategoryLang(PostCategory $postCategory, Locale $locale) {
		$postCategoryTranslateRepository = $this->em->getRepository('COMBlogBundle:PostCategoryTranslate');
		
		$postCategoryTranslate = $postTranslateRepository->findOneBy(array(
			'postCategory' => $postCategory,
			'locale' => $locale,
		));
		if($postCategoryTranslate){
			$postCategory->setTitle($postCategoryTranslate->getName());
			$postCategory->setDescription($postCategoryTranslate->getDescription());
		}else{
			$postCategory->setTitle($postCategory->getDefaultTitle());
			$postCategory->setDescription("");
		}
		
		return $postCategory;
    }
    
    public function getPostCategoryTranslate(PostCategory $postCategory, $locale) {
        $postCategoryTranslateRepository = $this->em->getRepository('COMBlogBundle:PostCategoryTranslate');

        $postCategoryTranslate = $postCategoryTranslateRepository->findOneBy(array(
            'postCategory' => $postCategory,
            'locale' => $locale,
        ));
        
		return $postCategoryTranslate;
    }
    
    public function getAllPostCategory() {
        $postCategoryRepository = $this->em->getRepository('COMBlogBundle:PostCategory');

        $postCategories = $postCategoryRepository->findAll();
        
		return $postCategories;
    }
    
    public function getCategoryByPost(Post $post) {
        $categoryPostRepository = $this->em->getRepository('COMBlogBundle:CategoryPost');
		$postCategoryRepository = $this->em->getRepository('COMBlogBundle:PostCategory');

        $categoryPost = $categoryPostRepository->findOneBy(array(
            'post' => $post,
        ));
        if($categoryPost){
			return $categoryPost->getPostCategory();
		}else{
			return null;
		}
    }

}