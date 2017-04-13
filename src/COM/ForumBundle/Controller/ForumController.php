<?php

namespace COM\ForumBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;

use COM\ForumBundle\Entity\Subject;
use COM\ForumBundle\Entity\Message;
use COM\ForumBundle\Entity\SubjectInit;
use COM\ForumBundle\Form\Type\SubjectInitType;
use COM\ForumBundle\Form\Type\MessageType;

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
	
	public function newSubjectAction($topic_id, Request $request)
    {
		$em = $this->getDoctrine()->getManager();
		$topicRepository = $em->getRepository('COMForumBundle:Topic');
		$subjectRepository = $em->getRepository('COMForumBundle:Subject');
		$messageRepository = $em->getRepository('COMForumBundle:Message');
        
		$subjectInit = new SubjectInit();
		$formSubjectInit = $this->get('form.factory')->create(new SubjectInitType(), $subjectInit);
		
        $response = new Response();
		
		if ($formSubjectInit->handleRequest($request)->isValid()) {
			$topic = $topicRepository->find($topic_id);
			$user = $this->getUser();
			if($topic && $user){
				//creation subject
				$subject = new Subject();
				$subject->setTopic($topic);
				$subject->setUser($user);
				$subject->setTitle($subjectInit->getTitle());
				$subject->setDate(new \DateTime());
				
				$platformService = $this->container->get('com_platform.platform_service');
				$slug = $platformService->sluggify($subjectInit->getTitle());
				$subject->setSlug($slug);
				
				$em->persist($subject);
				
				//creation message
				$message = new Message();
				$message->setSubject($subject);
				$message->setUser($user);
				$message->setDate(new \DateTime());
				$message->setMessage($subjectInit->getMessage());
				
				$em->persist($message);
				
				$em->flush();

				$urlSubject = $this->get('router')->generate('com_forum_view_subject', array('slug' => $subject->getSlug()));
				
				$response->setContent(json_encode(array(
					'state' => 1,
					'urlSubject' => $urlSubject,
				)));
			}else{
				$response->setContent(json_encode(array(
					'state' => 0,
				)));
			}
		}else{
            $response->setContent(json_encode(array(
                'state' => 0,
            )));
		}
        $response->headers->set('Content-Type', 'application/json');
		return $response;
    }
	
	public function newMessageAction($subject_id, Request $request)
    {
		$em = $this->getDoctrine()->getManager();
		$topicRepository = $em->getRepository('COMForumBundle:Topic');
		$subjectRepository = $em->getRepository('COMForumBundle:Subject');
		$messageRepository = $em->getRepository('COMForumBundle:Message');
        
		$message = new Message();
		$formMessage = $this->get('form.factory')->create(new MessageType(), $message);
		
        $response = new Response();
		
		if ($formMessage->handleRequest($request)->isValid()) {
			$subject = $subjectRepository->find($subject_id);
			$user = $this->getUser();
			if($subject && $user){
				
				//creation message
				$message->setSubject($subject);
				$message->setUser($user);
				$message->setDate(new \DateTime());
				
				$em->persist($message);
				
				$em->flush();
					
				$messageItem = $this->renderView('COMForumBundle:forum:include/message_item.html.twig', array(
				  'message' => $message
				));
				
				$response->setContent(json_encode(array(
					'state' => 1,
					'messageItem' => $messageItem,
				)));
			}else{
				$response->setContent(json_encode(array(
					'state' => 0,
				)));
			}
		}else{
            $response->setContent(json_encode(array(
                'state' => 0,
            )));
		}
        $response->headers->set('Content-Type', 'application/json');
		return $response;
    }
}
