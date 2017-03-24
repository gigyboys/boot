<?php

namespace COM\AdminBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\RedirectResponse; 

use COM\PlatformBundle\Entity\Locale;
use COM\PlatformBundle\Entity\Newsletter;
use COM\PlatformBundle\Entity\NewsletterMail;
use COM\UserBundle\Entity\User;

class NewsletterController extends Controller
{
    public function indexAction()
    {
		$url = $this->get('router')->generate('com_admin_newsletter_email');
		return new RedirectResponse($url);
    }
	
    public function emailAction()
    {
		$em = $this->getDoctrine()->getManager();
		$newsletterMailRepository = $em->getRepository('COMPlatformBundle:NewsletterMail');

		$newsletterMails = $newsletterMailRepository->findAll();
		
        return $this->render('COMAdminBundle:newsletter:newsletter_mail.html.twig', array(
			'newsletterMails' => $newsletterMails
		));
    }
}
