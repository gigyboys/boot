<?php

namespace COM\BlogBundle\Service;

use Doctrine\ORM\EntityManager;
use COM\BlogBundle\Entity\Post;
use COM\BlogBundle\Entity\PostTranslate;
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
		
		$post->setTitle($postTranslate->getTitle());
		$post->setContent($postTranslate->getContent());
		$post->setDescription($postTranslate->getDescription());
		
		return $post;
    }
    
    public function getPostTranslate($post, $locale) {
        $postTranslateRepository = $this->em->getRepository('COMBlogBundle:PostTranslate');

        $postTranslate = $postTranslateRepository->findOneBy(array(
            'post' => $post,
            'locale' => $locale,
        ));
        
		return $postTranslate;
    }

}