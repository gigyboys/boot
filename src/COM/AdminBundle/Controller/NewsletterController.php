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
	
    public function editPostAction($id)
    {
		$em = $postRepository = $this->getDoctrine()->getManager();
		$postRepository = $em->getRepository('COMBlogBundle:Post');
		$postTranslateRepository = $em->getRepository('COMBlogBundle:PostTranslate');
		$localeRepository = $em->getRepository('COMPlatformBundle:Locale');
		$postSchoolRepository = $em->getRepository('COMPlatformBundle:PostSchool');

		$post = $postRepository->find($id);
		$postSchools = $postSchoolRepository->findBy(array('post' => $post));
		
		$localeFR =  $localeRepository->findOneBy(array('locale' => 'fr'));
		$postFR = $postTranslateRepository->findOneBy(array('post' => $post, 'locale' => $localeFR));
		
		$localeEN =  $localeRepository->findOneBy(array('locale' => 'en'));
		$postEN = $postTranslateRepository->findOneBy(array('post' => $post, 'locale' => $localeEN));
		
		$localeMG =  $localeRepository->findOneBy(array('locale' => 'mg'));
		$postMG = $postTranslateRepository->findOneBy(array('post' => $post, 'locale' => $localeMG));
		
		$localeIT =  $localeRepository->findOneBy(array('locale' => 'it'));
		$postIT = $postTranslateRepository->findOneBy(array('post' => $post, 'locale' => $localeIT));
		
		$localeES =  $localeRepository->findOneBy(array('locale' => 'es'));
		$postES = $postTranslateRepository->findOneBy(array('post' => $post, 'locale' => $localeES));
		
		$localeES =  $localeRepository->findOneBy(array('locale' => 'de'));
		$postDE = $postTranslateRepository->findOneBy(array('post' => $post, 'locale' => $localeES));
		
        return $this->render('COMAdminBundle:blog:edit_post.html.twig', array(
			'post' => $post,
			'postSchools' => $postSchools,
			'postFR' => $postFR,
			'postEN' => $postEN,
			'postMG' => $postMG,
			'postIT' => $postIT,
			'postES' => $postES,
			'postDE' => $postDE,
		));
    }
}
