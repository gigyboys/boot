<?php

namespace COM\BlogBundle\Twig;

use COM\BlogBundle\Service\BlogService;
use COM\BlogBundle\Entity\Post;

class BlogExtension extends \Twig_Extension {

    protected $blogService;

    public function __construct(BlogService $blogService) {
        $this->blogService = $blogService;
    }

    public function getFunctions() {
        return array(
            'getPostTranslate' => new \Twig_Function_Method($this, 'getPostTranslateFunction'),
        );
    }

    public function getPostTranslateFunction($post, $locale) {
        return $this->blogService->getPostTranslate($post, $locale);
    }

    public function getName() {
            return 'blog_extension';
    }

}