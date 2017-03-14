<?php

namespace COM\BlogBundle\Twig;

use COM\BlogBundle\Service\BlogService;
use COM\BlogBundle\Entity\Post;
use COM\BlogBundle\Entity\PostCategory;

class BlogExtension extends \Twig_Extension {

    protected $blogService;

    public function __construct(BlogService $blogService) {
        $this->blogService = $blogService;
    }

    public function getFunctions() {
        return array(
            'getPostTranslate' => new \Twig_Function_Method($this, 'getPostTranslateFunction'),
            'postIllustration' => new \Twig_Function_Method($this, 'postIllustrationFunction'),
            'getPostCategoryTranslate' => new \Twig_Function_Method($this, 'getPostCategoryTranslateFunction'),
            'getAllPostCategory' => new \Twig_Function_Method($this, 'getAllPostCategoryFunction'),
            'getCategoryByPost' => new \Twig_Function_Method($this, 'getCategoryByPostFunction'),
        );
    }

    public function getPostTranslateFunction($post, $locale) {
        return $this->blogService->getPostTranslate($post, $locale);
    }

    public function postIllustrationFunction(Post $post) {
        return $this->blogService->getIllustration($post);
    }

    public function getPostCategoryTranslateFunction(PostCategory $postCategory, $locale) {
        return $this->blogService->getPostCategoryTranslate($postCategory, $locale);
    }

    public function getAllPostCategoryFunction() {
        return $this->blogService->getAllPostCategory();
    }

    public function getCategoryByPostFunction(Post $post) {
        return $this->blogService->getCategoryByPost($post);
    }

    public function getName() {
            return 'blog_extension';
    }

}