<?php

namespace COM\ForumBundle\Twig;

use COM\ForumBundle\Service\ForumService;
use COM\ForumBundle\Entity\Topic;
use COM\ForumBundle\Entity\Subject;
use COM\ForumBundle\Entity\Message;

class ForumExtension extends \Twig_Extension {

    protected $forumService;

    public function __construct(ForumService $forumService) {
        $this->forumService = $forumService;
    }

    public function getFunctions() {
        return array(
            'getTopicTranslate' => new \Twig_Function_Method($this, 'getTopicTranslateFunction'),
            'topicIllustration' => new \Twig_Function_Method($this, 'topicIllustrationFunction'),
            'getSubjectsByTopic' => new \Twig_Function_Method($this, 'getSubjectsByTopicFunction'),
            'getMessagesBySubject' => new \Twig_Function_Method($this, 'getMessagesBySubjectFunction'),
            'getLastMessageByTopicId' => new \Twig_Function_Method($this, 'getLastMessageByTopicIdFunction'),
        );
    }

    public function getTopicTranslateFunction(Topic $topic, $locale) {
        return $this->forumService->getTopicTranslate($topic, $locale);
    }

    public function topicIllustrationFunction(Topic $topic) {
        return $this->forumService->getIllustration($topic);
    }

    public function getSubjectsByTopicFunction(Topic $topic) {
        return $this->forumService->getSubjectsByTopic($topic);
    }

    public function getMessagesBySubjectFunction(Subject $subject) {
        return $this->forumService->getMessagesBySubject($subject);
    }

    public function getLastMessageByTopicIdFunction($topic_id) {
        return $this->forumService->getLastMessageByTopicId($topic_id);
    }

    public function getName() {
            return 'forum_extension';
    }

}