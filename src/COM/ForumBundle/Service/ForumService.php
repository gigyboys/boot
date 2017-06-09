<?php

namespace COM\ForumBundle\Service;

use Doctrine\ORM\EntityManager;
use COM\ForumBundle\Entity\Topic;
use COM\ForumBundle\Entity\Subject;
use COM\ForumBundle\Entity\Message;
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
		
		if($topicTranslate){
			$topic->setName($topicTranslate->getName());
			$topic->setDescription($topicTranslate->getDescription());
		}else{
			$topic->setName($topic->getDefaultname());
			$topic->setDescription("");
		}
		
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
    
    public function getSubjectsByTopic(Topic $topic) {
        $subjectRepository = $this->em->getRepository('COMForumBundle:Subject');

        $subjects = $subjectRepository->findBy(array(
            'topic' => $topic,
        ));
        
		return $subjects;
    }
    
    public function getMessagesBySubject(Subject $subject) {
        $messageRepository = $this->em->getRepository('COMForumBundle:Message');

        $messages = $messageRepository->findBy(array(
            'subject' => $subject,
        ));
        
		return $messages;
    }
    
    public function getLastMessageByTopicId($topic_id) {
        $messageRepository = $this->em->getRepository('COMForumBundle:Message');

        $message = $messageRepository->getLastMessageByTopicId($topic_id);
        
		return $message;
    }

}