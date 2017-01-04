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
		
		$topics = $topicRepository->findAll();
		
        return $this->render('COMForumBundle:forum:index_forum.html.twig', array(
			'topics' => $topics,
		));
    }
}
