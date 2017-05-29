<?php

namespace COM\AdminBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\RedirectResponse; 
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;

//use COM\PlatformBundle\Entity\Locale;
//use COM\UserBundle\Entity\User;
//use COM\SchoolBundle\Entity\School;
use COM\SchoolBundle\Entity\SchoolContact;
//use COM\SchoolBundle\Entity\Logo;
//use COM\SchoolBundle\Entity\SchoolAdmin;
//use COM\SchoolBundle\Form\Type\LogoType;
use COM\SchoolBundle\Entity\SchoolContactTranslate;
//use COM\SchoolBundle\Form\Type\SchoolInitType;
use COM\SchoolBundle\Form\Type\SchoolContactInitType;
use COM\SchoolBundle\Form\Type\SchoolContactCommonType;
use COM\SchoolBundle\Form\Type\SchoolContactTranslateType;
//use COM\SchoolBundle\Form\Type\SchoolGeneralType;
//use COM\SchoolBundle\Form\Type\SchoolTranslateType;
//use COM\PlatformBundle\Entity\Query;
//use COM\PlatformBundle\Form\Type\QueryType;

class SchoolContactController extends Controller
{
	public function indexAction($school_id)
    {
		$em = $this->getDoctrine()->getManager();
		$schoolRepository = $em->getRepository('COMSchoolBundle:School');
		$schoolContactRepository = $em->getRepository('COMSchoolBundle:SchoolContact');

		$school = $schoolRepository->find($school_id);
		$schoolContacts = $schoolContactRepository->findBy(array(
			'school' => $school,
		));
		
        return $this->render('COMAdminBundle:school:school_contact.html.twig', array(
			'school' => $school,
			'contacts' => $schoolContacts
		));
    }
	
	/*
	 * School add contact
	 */
    public function addContactAction($school_id, Request $request)
    {
		$em = $this->getDoctrine()->getManager();
		$localeRepository = $em->getRepository('COMPlatformBundle:Locale');
		$schoolRepository = $em->getRepository('COMSchoolBundle:School');

		$school = $schoolRepository->find($school_id);
		
		$schoolContact = new SchoolContact();
		$formInitSchoolContact = $this->get('form.factory')->create(new SchoolContactInitType(), $schoolContact);
		
		if ($formInitSchoolContact->handleRequest($request)->isValid()) {
			$schoolContact->setSchool($school);
			$schoolContact->setEmail("");
			$schoolContact->setPhone("");
			$schoolContact->setWebsite("");
			$schoolContact->setLongitude("");
			$schoolContact->setLatitude("");
			$schoolContact->setShowmap(true);
			
			$em->persist($schoolContact);
			$em->flush();
			
			$url = $this->get('router')->generate('com_admin_school_contact_edit', array(
				'contact_id' => $schoolContact->getId(),
			));
			return new RedirectResponse($url);
		}
		
        return $this->render('COMAdminBundle:school:school_contact_add.html.twig', array(
			'school' => $school,
			'formInitSchoolContact' => $formInitSchoolContact->createView(),
		));
    }
	
	/*
	 * School Edition contact
	 */
    public function editContactAction($contact_id)
    {
		$em = $this->getDoctrine()->getManager();
		$schoolRepository = $em->getRepository('COMSchoolBundle:School');
		$schoolContactRepository = $em->getRepository('COMSchoolBundle:SchoolContact');
		$contact = $schoolContactRepository->find($contact_id);
		
        return $this->render('COMAdminBundle:school:edit_contact.html.twig', array(
			'contact' => $contact,
			'school' => $contact->getSchool(),
		));
    }
	
	/*
	 * School Contact Edition common
	 */
    public function editContactCommonAction($contact_id, Request $request)
    {
		$em = $this->getDoctrine()->getManager();
		$schoolContactRepository = $em->getRepository('COMSchoolBundle:SchoolContact');
        
        $schoolContact = $schoolContactRepository->find($contact_id);
        
		$schoolContactTemp = new SchoolContact();
		$formSchoolContactCommon = $this->get('form.factory')->create(new SchoolContactCommonType(), $schoolContactTemp);
		
        $response = new Response();
		
		if ($formSchoolContactCommon->handleRequest($request)->isValid()) {
			$schoolContact->setAddress($schoolContactTemp->getAddress());
			$schoolContact->setEmail($schoolContactTemp->getEmail());
			$schoolContact->setPhone($schoolContactTemp->getPhone());
			$schoolContact->setWebsite($schoolContactTemp->getWebsite());
			$schoolContact->setLongitude($schoolContactTemp->getLongitude());
			$schoolContact->setLatitude($schoolContactTemp->getLatitude());
            
			$em->persist($schoolContact);
            $em->flush();
			
            $response->setContent(json_encode(array(
                'state' => 1,
                'address' => $schoolContact->getAddress(),
                'email' => $schoolContact->getEmail(),
                'phone' => $schoolContact->getPhone(),
                'website' => $schoolContact->getWebsite(),
                'longitude' => $schoolContact->getLongitude(),
                'latitude' => $schoolContact->getLatitude(),
            )));
		}else{
            $response->setContent(json_encode(array(
                'state' => 0,
            )));
		}
        $response->headers->set('Content-Type', 'application/json');
		return $response;
    }
	
    public function editContactTranslateAction($contact_id, $locale, Request $request)
    {
		$em = $this->getDoctrine()->getManager();
		$schoolContactRepository = $em->getRepository('COMSchoolBundle:SchoolContact');
		$schoolContactTranslateRepository = $em->getRepository('COMSchoolBundle:SchoolContactTranslate');
		$localeRepository = $em->getRepository('COMPlatformBundle:Locale');
        
        $schoolContact = $schoolContactRepository->find($contact_id);
        $localeObj = $localeRepository->findOneBy(array(
			'locale' => $locale,
		));
        
		$schoolContactTranslateTemp = new SchoolContactTranslate();
		$formSchoolContactTranslate = $this->get('form.factory')->create(new SchoolContactTranslateType(), $schoolContactTranslateTemp);
		
        $response = new Response();
		
		if ($formSchoolContactTranslate->handleRequest($request)->isValid()) {
			$schoolContactTranslate = $schoolContactTranslateRepository->findOneBy(array(
				'schoolContact' => $schoolContact,
				'locale' => $localeObj,
			));
			if(!$schoolContactTranslate){
				$schoolContactTranslate = new SchoolContactTranslate();
				$schoolContactTranslate->setLocale($localeObj);
				$schoolContactTranslate->setSchoolContact($schoolContact);
			}
			
			$schoolContactTranslate->setDescription($schoolContactTranslateTemp->getDescription());
            
			$em->persist($schoolContactTranslate);
            $em->flush();

            $response->setContent(json_encode(array(
                'state' => 1,
                'description' => $schoolContactTranslate->getDescription(),
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
