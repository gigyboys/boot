<?php

namespace COM\AdminBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\RedirectResponse; 
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;

use COM\PlatformBundle\Entity\Locale;
use COM\UserBundle\Entity\User;
use COM\SchoolBundle\Entity\School;
use COM\SchoolBundle\Entity\Field;
use COM\SchoolBundle\Entity\FieldTranslate;
use COM\SchoolBundle\Entity\Logo;
use COM\SchoolBundle\Form\Type\LogoType;
use COM\SchoolBundle\Entity\SchoolTranslate;
use COM\SchoolBundle\Form\Type\SchoolInitType;
use COM\SchoolBundle\Form\Type\FieldInitType;
use COM\SchoolBundle\Form\Type\SchoolGeneralType;
use COM\SchoolBundle\Form\Type\FieldCommonType;
use COM\SchoolBundle\Form\Type\SchoolTranslateType;
use COM\SchoolBundle\Form\Type\FieldTranslateType;

class SchoolFieldController extends Controller
{
	public function indexAction($school_id)
    {
		$em = $this->getDoctrine()->getManager();
		$schoolRepository = $em->getRepository('COMSchoolBundle:School');
		$schoolFieldRepository = $em->getRepository('COMSchoolBundle:Field');

		$school = $schoolRepository->find($school_id);
		$fields = $schoolFieldRepository->findBy(array(
			'school' => $school
		));
		
        return $this->render('COMAdminBundle:school:school_field.html.twig', array(
			'school' => $school,
			'fields' => $fields
		));
    }
	
    public function addFieldAction($school_id, Request $request)
    {
		$em = $this->getDoctrine()->getManager();
		$localeRepository = $em->getRepository('COMPlatformBundle:Locale');
		$schoolRepository = $em->getRepository('COMSchoolBundle:School');

		$school = $schoolRepository->find($school_id);
		
		$field = new Field();
		$formInitField = $this->get('form.factory')->create(new FieldInitType(), $field);
		
		if ($formInitField->handleRequest($request)->isValid()) {
			$platformService = $this->container->get('com_platform.platform_service');
			$slug = $platformService->sluggify($field->getDefaultName());
			$field->setSlug($slug);
			$field->setPublished(false);
			$field->setSchool($school);
			
			$locales = $localeRepository->findAll();
			foreach($locales as $locale){
				$fieldTranslate = new FieldTranslate();
				$fieldTranslate->setField($field);
				$fieldTranslate->setLocale($locale);
				$fieldTranslate->setName($field->getDefaultName());
				$fieldTranslate->setDescription("");
				$em->persist($fieldTranslate);
			}
			
			$em->persist($field);
			$em->flush();
			
			$url = $this->get('router')->generate('com_admin_school_field_edit', array(
				'school_id' => $school->getId(),
				'field_id' => $field->getId(),
			));
			return new RedirectResponse($url);
		}
		
        return $this->render('COMAdminBundle:school:school_field_add.html.twig', array(
			'school' => $school,
			'formInitField' => $formInitField->createView(),
		));
    }
	
	//add ajax
    public function addFieldAjaxAction($school_id, Request $request)
    {
		$em = $this->getDoctrine()->getManager();
		$localeRepository = $em->getRepository('COMPlatformBundle:Locale');
		$schoolRepository = $em->getRepository('COMSchoolBundle:School');

		$school = $schoolRepository->find($school_id);
		
		$field = new Field();
		
        $response = new Response();

		$content = $this->renderView('COMAdminBundle:school:school_field_add_ajax.html.twig', array(
			'school' => $school,
		));
			
		$response->setContent(json_encode(array(
			'state' => 1,
			'content' => $content,
		)));
		
        $response->headers->set('Content-Type', 'application/json');
		return $response;
    }
	
	/*
	 * School Edition field
	 */
    public function editFieldAction($field_id)
    {
		$em = $this->getDoctrine()->getManager();
		$schoolRepository = $em->getRepository('COMSchoolBundle:School');
		$fieldRepository = $em->getRepository('COMSchoolBundle:Field');
		$field = $fieldRepository->find($field_id);
		
        return $this->render('COMAdminBundle:school:edit_field.html.twig', array(
			'field' => $field,
			'school' => $field->getSchool(),
		));
    }
	
	/*
	 * School Field Edition common
	 */
    public function editFieldCommonAction($id, Request $request)
    {
		$em = $this->getDoctrine()->getManager();
		$fieldRepository = $em->getRepository('COMSchoolBundle:Field');
        
        $field = $fieldRepository->find($id);
        
		$fieldTemp = new Field();
		$formFieldCommon = $this->get('form.factory')->create(new FieldCommonType(), $fieldTemp);
		
        $response = new Response();
		
		if ($formFieldCommon->handleRequest($request)->isValid()) {
			$field->setDefaultName($fieldTemp->getDefaultName());
			
			$platformService = $this->container->get('com_platform.platform_service');
			$slug = $platformService->sluggify($fieldTemp->getSlug());
			$field->setSlug($slug);
            
			$em->persist($field);
            $em->flush();

            $response->setContent(json_encode(array(
                'state' => 1,
                'defaultName' => $field->getDefaultName(),
                'slug' => $field->getSlug(),
            )));
		}else{
            $response->setContent(json_encode(array(
                'state' => 0,
            )));
		}
        $response->headers->set('Content-Type', 'application/json');
		return $response;
    }
	
    public function editFieldTranslateAction($id, $locale, Request $request)
    {
		$em = $this->getDoctrine()->getManager();
		$fieldRepository = $em->getRepository('COMSchoolBundle:Field');
		$fieldTranslateRepository = $em->getRepository('COMSchoolBundle:FieldTranslate');
		$localeRepository = $em->getRepository('COMPlatformBundle:Locale');
        
        $field = $fieldRepository->find($id);
        $localeObj = $localeRepository->findOneBy(array(
			'locale' => $locale,
		));
        
		$fieldTranslateTemp = new FieldTranslate();
		$formFieldTranslate = $this->get('form.factory')->create(new FieldTranslateType(), $fieldTranslateTemp);
		
        $response = new Response();
		
		if ($formFieldTranslate->handleRequest($request)->isValid()) {
			$fieldTranslate = $fieldTranslateRepository->findOneBy(array(
				'field' => $field,
				'locale' => $localeObj,
			));
			if(!$fieldTranslate){
				$fieldTranslate = new FieldTranslate();
				$fieldTranslate->setLocale($localeObj);
				$fieldTranslate->setField($field);
			}
			$fieldTranslate->setName($fieldTranslateTemp->getName());
			$fieldTranslate->setDescription($fieldTranslateTemp->getDescription());
            
			$em->persist($fieldTranslate);
            $em->flush();

            $response->setContent(json_encode(array(
                'state' => 1,
                'name' => $fieldTranslate->getName(),
                'description' => $fieldTranslate->getDescription(),
            )));
		}else{
            $response->setContent(json_encode(array(
                'state' => 0,
            )));
		}
        $response->headers->set('Content-Type', 'application/json');
		return $response;
    }
	
	/*
	 * School Field delete
	 */
    public function deleteFieldAction($id, Request $request)
    {
		$em = $this->getDoctrine()->getManager();
		$fieldRepository = $em->getRepository('COMSchoolBundle:Field');
		$fieldTranslateRepository = $em->getRepository('COMSchoolBundle:FieldTranslate');
        
        $field = $fieldRepository->find($id);

        $response = new Response();

		if ($field) {
			$fieldTranslates = $fieldTranslateRepository->findBy(array(
                'field' => $field,
            ));
			foreach($fieldTranslates as $fieldTranslate){
				$em->remove($fieldTranslate);
			}
			$em->remove($field);
            $em->flush();

            $response->setContent(json_encode(array(
                'state' => 1,
                'id' => $id,
            )));
		}else{
            $response->setContent(json_encode(array(
                'state' => 0,
            )));
		}
        $response->headers->set('Content-Type', 'application/json');
		return $response;
    }
	
    public function tooglePublicationFieldAction($field_id, Request $request)
    {
		$em = $this->getDoctrine()->getManager();
		$schoolRepository = $em->getRepository('COMSchoolBundle:School');
		$fieldRepository = $em->getRepository('COMSchoolBundle:Field');
        
        $field = $fieldRepository->find($field_id);
		
        $response = new Response();
		
		if ($field) {
			if($field->getPublished() == true){
				$field->setPublished(false) ;
			}else{
				$field->setPublished(true) ;
			}
            
			$em->persist($field);
            $em->flush();

            $response->setContent(json_encode(array(
                'state' => 1,
                'published' => $field->getPublished(),
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
