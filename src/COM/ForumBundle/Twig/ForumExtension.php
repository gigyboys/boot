<?php

namespace COM\ForumBundle\Twig;

use COM\ForumBundle\Service\ForumService;
use COM\ForumBundle\Entity\Topic;

class ForumExtension extends \Twig_Extension {

    protected $forumService;

    public function __construct(ForumService $forumService) {
        $this->forumService = $forumService;
    }

    public function getFunctions() {
        return array(
            'getTopicTranslate' => new \Twig_Function_Method($this, 'getTopicTranslateFunction'),
            'topicIllustration' => new \Twig_Function_Method($this, 'topicIllustrationFunction'),
        );
    }

    public function getTopicTranslateFunction(Topic $topic, $locale) {
        return $this->forumService->getTopicTranslate($topic, $locale);
    }

    public function topicIllustrationFunction(Topic $topic) {
        return $this->forumService->getIllustration($topic);
    }

    public function getName() {
            return 'forum_extension';
    }

}