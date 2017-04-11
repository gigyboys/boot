<?php

namespace COM\AdminBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\RedirectResponse; 
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;

use COM\PlatformBundle\Entity\Locale;
use COM\UserBundle\Entity\User;
use COM\ForumBundle\Entity\Topic;
use COM\ForumBundle\Entity\TopicTranslate;
use COM\ForumBundle\Entity\Subject;
use COM\ForumBundle\Form\Type\TopicCommonType;
use COM\ForumBundle\Form\Type\TopicTranslateType;

class ForumController extends Controller
{
	
    public function indexAction()
    {
		$em = $this->getDoctrine()->getManager();
		$topicRepository = $em->getRepository('COMForumBundle:Topic');

		$topics = $topicRepository->findAll();
		
        return $this->render('COMAdminBundle:forum:topic.html.twig', array('topics' => $topics));
    }
	
    public function editTopicAction($id)
    {
		$em = $this->getDoctrine()->getManager();
		$topicRepository = $em->getRepository('COMForumBundle:Topic');

		$topic = $topicRepository->find($id);
		
        return $this->render('COMAdminBundle:forum:edit_topic.html.twig', array(
			'topic' => $topic,
		));
    }
	
    public function editTopicCommonAction($id, Request $request)
    {
		$em = $this->getDoctrine()->getManager();
		$topicRepository = $em->getRepository('COMForumBundle:Topic');
        
        $topic = $topicRepository->find($id);
        
		$topicTemp = new Topic();
		$formTopicCommon = $this->get('form.factory')->create(new TopicCommonType(), $topicTemp);
		
        $response = new Response();
		
		if ($formTopicCommon->handleRequest($request)->isValid()) {
			$topic->setDefaultName($topicTemp->getDefaultName());
			
			$platformService = $this->container->get('com_platform.platform_service');
			$slug = $platformService->sluggify($topicTemp->getSlug());
			
			$topic->setSlug($slug);
            
			$em->persist($topic);
			
            $em->flush();

            $response->setContent(json_encode(array(
                'state' => 1,
                'defaultName' => $topic->getDefaultName(),
                'slug' => $topic->getSlug(),
            )));
		}else{
            $response->setContent(json_encode(array(
                'state' => 0,
            )));
		}
        $response->headers->set('Content-Type', 'application/json');
		return $response;
    }
	
    public function editTopicTranslateAction($id, $locale, Request $request)
    {
		$em = $this->getDoctrine()->getManager();
		$topicRepository = $em->getRepository('COMForumBundle:Topic');
		$topicTranslateRepository = $em->getRepository('COMForumBundle:TopicTranslate');
		$localeRepository = $em->getRepository('COMPlatformBundle:Locale');
        
        $topic = $topicRepository->find($id);
        $localeObj = $localeRepository->findOneBy(array(
			'locale' => $locale,
		));
        
		$topicTranslateTemp = new TopicTranslate();
		$formTopicTranslate = $this->get('form.factory')->create(new TopicTranslateType(), $topicTranslateTemp);
		
        $response = new Response();
		
		if ($formTopicTranslate->handleRequest($request)->isValid()) {
			$topicTranslate = $topicTranslateRepository->findOneBy(array(
				'topic' => $topic,
				'locale' => $localeObj,
			));
			if(!$topicTranslate){
				$topicTranslate = new TopicTranslate();
				$topicTranslate->setLocale($localeObj);
				$topicTranslate->setTopic($topic);
			}
			$topicTranslate->setName($topicTranslateTemp->getName());
			$topicTranslate->setDescription($topicTranslateTemp->getDescription());
			$topicTranslate->setDescription($topicTranslateTemp->getDescription());
            
			$em->persist($topicTranslate);
            $em->flush();

            $response->setContent(json_encode(array(
                'state' => 1,
                'name' => $topicTranslate->getName(),
                'description' => $topicTranslate->getDescription(),
            )));
		}else{
            $response->setContent(json_encode(array(
                'state' => 0,
            )));
		}
        $response->headers->set('Content-Type', 'application/json');
		return $response;
    }
}
