<?php

namespace COM\BlogBundle\Twig;

use COM\BlogBundle\Service\BlogService;
use COM\BlogBundle\Entity\Post;
use COM\BlogBundle\Entity\Category;

class BlogExtension extends \Twig_Extension {

    protected $blogService;

    public function __construct(BlogService $blogService) {
        $this->blogService = $blogService;
    }

    public function getFunctions() {
        return array(
            'getPostTranslate' => new \Twig_Function_Method($this, 'getPostTranslateFunction'),
            'postIllustration' => new \Twig_Function_Method($this, 'postIllustrationFunction'),
            'getCategoryTranslate' => new \Twig_Function_Method($this, 'getCategoryTranslateFunction'),
            'getAllCategory' => new \Twig_Function_Method($this, 'getAllCategoryFunction'),
            'getCategoryByPost' => new \Twig_Function_Method($this, 'getCategoryByPostFunction'),
            'getCommentsByPost' => new \Twig_Function_Method($this, 'getCommentsByPostFunction'),
            'getCategoryWithPublishedPost' => new \Twig_Function_Method($this, 'getCategoryWithPublishedPostFunction'),
            'getPublishedPostsByCategory' => new \Twig_Function_Method($this, 'getPublishedPostsByCategoryFunction'),
            'getPostsByDay' => new \Twig_Function_Method($this, 'getPostsByDayFunction'),
        );
    }

    public function getPostTranslateFunction($post, $locale) {
        return $this->blogService->getPostTranslate($post, $locale);
    }

    public function postIllustrationFunction(Post $post) {
        return $this->blogService->getIllustration($post);
    }

    public function getCategoryTranslateFunction(Category $category, $locale) {
        return $this->blogService->getCategoryTranslate($category, $locale);
    }

    public function getAllCategoryFunction() {
        return $this->blogService->getAllCategory();
    }

    public function getCommentsByPostFunction(Post $post) {
        return $this->blogService->getCommentsByPost($post);
    }

    public function getCategoryByPostFunction(Post $post) {
        return $this->blogService->getCategoryByPost($post);
    }

    public function getCategoryWithPublishedPostFunction() {
        return $this->blogService->getCategoryWithPublishedPost();
    }

    public function getPublishedPostsByCategoryFunction(Category $category) {
        return $this->blogService->getPublishedPostsByCategory($category);
    }

    public function getPostsByDayFunction($dateFormat) {
        return $this->blogService->getPostsByDay($dateFormat);
    }

    public function getName() {
            return 'blog_extension';
    }

}