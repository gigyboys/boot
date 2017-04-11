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
}
