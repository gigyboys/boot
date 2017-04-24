<?php

namespace COM\PlatformBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;

use COM\PlatformBundle\Entity\Contact;
use COM\PlatformBundle\Form\Type\ContactType;

class ContactController extends Controller
{
    public function indexAction(Request $request)
    {
		$em = $this->getDoctrine()->getManager();
		$user = $this->getUser();
		
		$contact = new Contact();
		if($user){
			$contact->setUser($user);
		}
		
		$msg = "";
		$form = $this->get('form.factory')->create(new ContactType(), $contact);

		if ($form->handleRequest($request)->isValid()) {
			$contact->setDate(new \DateTime());
			if($user){
				$contact->setUser($user);
			}
			$em->persist($contact);
			$em->flush();
			
			//add email to newsletter with isActive = false
			$email = $contact->getEmail();
			$newsletterService = $this->container->get('com_platform.newsletter_service');
			$newsletterService->addEmail($email);
		
			$msg = "<div style='color:#050'>Contact bien envoyé</div>";
			$contact = new Contact();
		}
		
        return $this->render('COMPlatformBundle:contact:contact.html.twig', array(
		  'formContact' => $form->createView(),
		  'contact' => $contact,
		  'msg' => $msg,
		));
    }
}
