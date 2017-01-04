<?php

namespace COM\PlatformBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;

use COM\PlatformBundle\Entity\NewsletterMail;
use COM\PlatformBundle\Form\Type\NewsletterMailType;

class NewsletterController extends Controller
{
    public function indexAction(Request $request)
    {
		$em = $this->getDoctrine()->getManager();
		$newsletterMailRepository = $em->getRepository('COMPlatformBundle:NewsletterMail');
		
		$newsletterMail = new NewsletterMail();
		$msg = "";
		$form = $this->get('form.factory')->create(new NewsletterMailType(), $newsletterMail);

		if ($form->handleRequest($request)->isValid()) {
		
			$newsletterMailTemp = $newsletterMailRepository->findOneBy(array(
				'email' => $newsletterMail->getEmail(),
			));
			
			if (!$newsletterMailTemp){
				$newsletterMail->setDate(new \DateTime());
				
				$em->persist($newsletterMail);
				$em->flush();
				$msg = "ok! vous êtes abonné à la newsletter";
			}else{
				$newsletterMailTemp->setIsActive($newsletterMail->getIsActive());
				
				$em->persist($newsletterMailTemp);
				$em->flush();
				if($newsletterMail->getIsActive()){
					$msg = "ok! vous êtes abonné à la newsletter";
				}else{
					$msg = "ok! vous êtes desabonné à la newsletter";
				}
			}
		}

        return $this->render('COMPlatformBundle:newsletter:newsletter_mail.html.twig', array(
			'formNewsletterMail' => $form->createView(),
			'msg' => $msg,
		));
    }
}
