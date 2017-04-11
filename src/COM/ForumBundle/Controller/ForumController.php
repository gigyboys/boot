<?php

namespace COM\ForumBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class ForumController extends Controller
{
    public function indexAction()
    {
		$em = $this->getDoctrine()->getManager();
		$topicRepository = $em->getRepository('COMForumBundle:Topic');
		$localeRepository = $em->getRepository('COMPlatformBundle:Locale');
		
		$request = $this->get('request');
		$shortLocale = $request->getLocale();
		$locale = $localeRepository->findOneBy(array(
			'locale' => $shortLocale,
		));
		
		$topics = $topicRepository->findAll();
		
		$forumService = $this->container->get('com_forum.forum_service');
		
		foreach($topics as $topic){
			$forumService->hydrateTopicLang($topic, $locale);
		}
		
        return $this->render('COMForumBundle:forum:index_forum.html.twig', array(
			'topics' => $topics,
		));
    }
	
    public function viewTopicAction($slug)
    {
		$em = $this->getDoctrine()->getManager();
		$topicRepository = $em->getRepository('COMForumBundle:Topic');
		$subjectRepository = $em->getRepository('COMForumBundle:Subject');
		$messageRepository = $em->getRepository('COMForumBundle:Message');
		$localeRepository = $em->getRepository('COMPlatformBundle:Locale');
		
		$request = $this->get('request');
		$shortLocale = $request->getLocale();
		$locale = $localeRepository->findOneBy(array(
			'locale' => $shortLocale,
		));
		
		$topic = $topicRepository->findOneBy(array(
			'slug' => $slug,
		));
		
		if($topic){
			$forumService = $this->container->get('com_forum.forum_service');
			$forumService->hydrateTopicLang($topic, $locale);
			
			$subjects = $subjectRepository->findBy(array(
				'topic' => $topic,
			));
		
			return $this->render('COMForumBundle:forum:view_topic.html.twig', array(
				'topic' => $topic,
				'subjects' => $subjects,
			));
		}else{
			//todo
		}
    }
	
    public function viewSubjectAction($slug)
    {
		$em = $this->getDoctrine()->getManager();
		$topicRepository = $em->getRepository('COMForumBundle:Topic');
		$subjectRepository = $em->getRepository('COMForumBundle:Subject');
		$messageRepository = $em->getRepository('COMForumBundle:Message');
		$localeRepository = $em->getRepository('COMPlatformBundle:Locale');
		
		$request = $this->get('request');
		$shortLocale = $request->getLocale();
		$locale = $localeRepository->findOneBy(array(
			'locale' => $shortLocale,
		));
		
		$subject = $subjectRepository->findOneBy(array(
			'slug' => $slug,
		));
		
		if($subject){
			$messages = $messageRepository->findBy(array(
				'subject' => $subject,
			));
			return $this->render('COMForumBundle:forum:view_subject.html.twig', array(
				'subject' => $subject,
				'messages' => $messages,
			));
		}else{
			//todo
		}
    }
}
