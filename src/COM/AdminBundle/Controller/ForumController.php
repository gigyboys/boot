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

class ForumController extends Controller
{
	
    public function indexAction()
    {
		$em = $this->getDoctrine()->getManager();
		$topicRepository = $em->getRepository('COMForumBundle:Topic');

		$topics = $topicRepository->findAll();
		
        return $this->render('COMAdminBundle:forum:topic.html.twig', array('topics' => $topics));
    }
}
