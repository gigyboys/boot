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
		$error = false;
		$form = $this->get('form.factory')->create(new ContactType(), $contact);
		
		if ($form->handleRequest($request)->isValid()) {
			if(trim($contact->getName()) == ""){
				$error = true;
				$msg .= "<div>Le champ full name est obligatoire.</div>";
			}
			
			if(trim($contact->getEmail()) == ""){
				$error = true;
				$msg .= "<div>Le champ email est obligatoire.</div>";
			}
			
			if(trim($contact->getContent()) == ""){
				$error = true;
				$msg .= "<div>Le champ message est obligatoire.</div>";
			}
			
			if(!$error){
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
			}else{
				$msg = "<div style='color:#a00'>".$msg."</div>";
			}
		}
		
		
        return $this->render('COMPlatformBundle:contact:contact.html.twig', array(
		  'formContact' => $form->createView(),
		  'contact' => $contact,
		  'msg' => $msg,
		));
    }
}
