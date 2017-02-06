<?php

namespace COM\AdminBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\RedirectResponse; 
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;

use COM\PlatformBundle\Entity\Locale;
use COM\UserBundle\Entity\User;
use COM\SchoolBundle\Entity\School;
use COM\SchoolBundle\Entity\Logo;
use COM\SchoolBundle\Form\Type\LogoType;
use COM\SchoolBundle\Entity\SchoolTranslate;
use COM\SchoolBundle\Form\Type\SchoolInitType;
use COM\SchoolBundle\Form\Type\SchoolGeneralType;
use COM\SchoolBundle\Form\Type\SchoolTranslateType;

class SchoolAdminController extends Controller
{
	public function indexAction($school_id)
    {
		$em = $this->getDoctrine()->getManager();
		$schoolRepository = $em->getRepository('COMSchoolBundle:School');
		$schoolAdminRepository = $em->getRepository('COMSchoolBundle:SchoolAdmin');

		$school = $schoolRepository->find($school_id);
		$schoolAdmins = $schoolAdminRepository->findBy(array(
			'school' => $school
		));
		
        return $this->render('COMAdminBundle:school:school_admin.html.twig', array(
			'school' => $school,
			'schoolAdmins' => $schoolAdmins
		));
    }
	
    public function getUsersNotAdminSchoolAction($school_id, $query, Request $request)
    {
		$em = $this->getDoctrine()->getManager();
		$schoolRepository = $em->getRepository('COMSchoolBundle:School');
        
        $school = $schoolRepository->find($id);
        
		$schoolTemp = new School();
		$formSchoolGeneral = $this->get('form.factory')->create(new SchoolGeneralType(), $schoolTemp);
		
        $response = new Response();
		
		if ($formSchoolGeneral->handleRequest($request)->isValid()) {
			$school->setName($schoolTemp->getName());
			$school->setShortName($schoolTemp->getShortName());
			$school->setSlug($schoolTemp->getSlug());
            
			$em->persist($school);
            $em->flush();

            $response->setContent(json_encode(array(
                'state' => 1,
                'name' => $school->getName(),
                'shortName' => $school->getShortName(),
                'slug' => $school->getSlug(),
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
