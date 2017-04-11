<?php

namespace COM\ForumBundle\Service;

use Doctrine\ORM\EntityManager;
use COM\ForumBundle\Entity\Topic;
use COM\ForumBundle\Entity\TopicTranslate;
use COM\PlatformBundle\Entity\Locale;

class ForumService {

    protected $em;

    public function __construct(EntityManager $em) {
        $this->em = $em;
    }
    
    public function hydrateTopicLang(Topic $topic, Locale $locale) {
		$topicTranslateRepository = $this->em->getRepository('COMForumBundle:TopicTranslate');
		
		$topicTranslate = $topicTranslateRepository->findOneBy(array(
			'topic' => $topic,
			'locale' => $locale,
		));
		
		$topic->setName($topicTranslate->getName());
		$topic->setDescription($topicTranslate->getDescription());
		
		return $topic;
    }
    
    public function getTopicTranslate(Topic $topic, $locale) {
        $topicTranslateRepository = $this->em->getRepository('COMForumBundle:TopicTranslate');

        $topicTranslate = $topicTranslateRepository->findOneBy(array(
            'topic' => $topic,
            'locale' => $locale,
        ));
        
		return $topicTranslate;
    }
    
    public function getIllustration(Topic $topic) {
        $topicIllustrationRepository = $this->em->getRepository('COMForumBundle:TopicIllustration');

        $topicIllustration = $topicIllustrationRepository->findOneBy(array(
            'topic' => $topic,
            'current' => true,
        ));

        if($topicIllustration){
            return $topicIllustration->getPath();
        }
        else{
            return 'default.jpeg';
        }
    }

}