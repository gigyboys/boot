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
use COM\SchoolBundle\Entity\SchoolAdmin;
use COM\SchoolBundle\Form\Type\LogoType;
use COM\SchoolBundle\Entity\SchoolTranslate;
use COM\SchoolBundle\Form\Type\SchoolInitType;
use COM\SchoolBundle\Form\Type\SchoolGeneralType;
use COM\SchoolBundle\Form\Type\SchoolTranslateType;
use COM\PlatformBundle\Entity\Query;
use COM\PlatformBundle\Form\Type\QueryType;

class SchoolAdminController extends Controller
{
	public function indexAction($school_id)
    {
		$em = $this->getDoctrine()->getManager();
		$schoolRepository = $em->getRepository('COMSchoolBundle:School');
		$schoolAdminRepository = $em->getRepository('COMSchoolBundle:SchoolAdmin');

		$school = $schoolRepository->find($school_id);
		$schoolAdmins = $schoolAdminRepository->findBy(array(
			'school' => $school,
			'active' => true,
		));
		
        return $this->render('COMAdminBundle:school:school_admin.html.twig', array(
			'school' => $school,
			'schoolAdmins' => $schoolAdmins
		));
    }
	
    public function getUsersNotAdminSchoolAction($school_id, Request $request)
    {
		$em = $this->getDoctrine()->getManager();
		$schoolRepository = $em->getRepository('COMSchoolBundle:School');
		$userRepository = $em->getRepository('COMUserBundle:User');
        
        $school = $schoolRepository->find($school_id);
		
        $response = new Response();
		
		$query = new Query();
		$formQuery = $this->get('form.factory')->create(new QueryType(), $query);
		if ($formQuery->handleRequest($request)->isValid()) {
			
			$users = $userRepository->getUsersNotSchoolAdmin($school, $query->getQuery());
			
			$listUsers = array();
			foreach($users as $user){
				$avatar60x60 = $this->renderView('COMUserBundle:user:include/avatar60x60.html.twig', array(
				  'user' => $user,
				));
				$urlSetAdmin = $this->get('router')->generate('com_admin_school_set_admin', array(
					'school_id' => $school->getId(),
					'user_id' => $user->getId(),
				));
				array_push($listUsers, array(
					"id" 			=> $user->getId(),
					"username"		=> $user->getUsername(),
					"name" 			=> $user->getName(),
					"email" 		=> $user->getEmail(),
					"avatar" 		=> $avatar60x60,
					"urlSetAdmin" 	=> $urlSetAdmin,
				));
			}

            $response->setContent(json_encode(array(
                'state' => 1,
                'schoolId' => $school->getId(),
                'users' => $listUsers,
            )));
		}else{
            $response->setContent(json_encode(array(
                'state' => 0,
            )));
		}
        $response->headers->set('Content-Type', 'application/json');
		return $response;
    }
	
    public function setAdminSchoolAction($school_id, $user_id, Request $request)
    {
		$em = $this->getDoctrine()->getManager();
		$schoolRepository = $em->getRepository('COMSchoolBundle:School');
		$userRepository = $em->getRepository('COMUserBundle:User');
		$schoolAdminRepository = $em->getRepository('COMSchoolBundle:SchoolAdmin');
        
        $school = $schoolRepository->find($school_id);
        $user = $userRepository->find($user_id);
		
        $response = new Response();
		
		if ($user && $school) {
			$em = $this->getDoctrine()->getManager();
			
			$schoolAdmin = $schoolAdminRepository->findOneBy(array(
				'school' => $school,
				'user' => $user,
			));
			if($schoolAdmin){
				$schoolAdmin->setActive(true);
			}else{
				$schoolAdmin = new SchoolAdmin();
				$schoolAdmin->setSchool($school);
				$schoolAdmin->setUser($user);
				$schoolAdmin->setDate(new \DateTime());
				$schoolAdmin->setActive(true);
			}
				
			$em->persist($schoolAdmin);
			$em->flush();
			
			$schoolAdminItem = $this->renderView('COMAdminBundle:school:include/school_admin_item.html.twig', array(
			  'schoolAdmin' => $schoolAdmin,
			));
			
			$response->setContent(
				json_encode(array(
					'state' => 1,
					'schoolId' => $school->getId(),
					'user' => $schoolAdmin->getUser()->getUsername(),
					'schoolAdminItem' => $schoolAdminItem,
				))
			);
		}else{
            $response->setContent(json_encode(array(
                'state' => 0,
            )));
		}
        $response->headers->set('Content-Type', 'application/json');
		return $response;
    }
	
    public function removeAdminSchoolAction($school_id, $user_id, Request $request)
    {
		$em = $this->getDoctrine()->getManager();
		$schoolRepository = $em->getRepository('COMSchoolBundle:School');
		$userRepository = $em->getRepository('COMUserBundle:User');
		$schoolAdminRepository = $em->getRepository('COMSchoolBundle:SchoolAdmin');
        
        $school = $schoolRepository->find($school_id);
        $user = $userRepository->find($user_id);
		
        $response = new Response();
		
		if ($user && $school) {
			
			$schoolAdmin = $schoolAdminRepository->findOneBy(array(
				'school' => $school,
				'user' => $user,
			));
			
			if($schoolAdmin){
				$em = $this->getDoctrine()->getManager();
				
				$schoolAdmin->setActive(false);
				
				$em->persist($schoolAdmin);
				$em->flush();
				
				$response->setContent(
					json_encode(array(
						'state' => 1,
						'schoolAdminId' => $schoolAdmin->getId(),
					))
				);
			}else{
				$response->setContent(json_encode(array(
					'state' => 0,
				)));
			}
		}else{
            $response->setContent(json_encode(array(
                'state' => 0,
            )));
		}
        $response->headers->set('Content-Type', 'application/json');
		return $response;
    }
}
