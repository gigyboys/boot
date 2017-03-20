<?php

namespace COM\AdminBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\RedirectResponse; 
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;

use COM\PlatformBundle\Entity\Locale;
use COM\UserBundle\Entity\User;

class UserController extends Controller
{
	
    public function indexAction()
    {
		$em = $this->getDoctrine()->getManager();
		$userRepository = $em->getRepository('COMUserBundle:User');

		$users = $userRepository->findAll();
		
        return $this->render('COMAdminBundle:user:user.html.twig', array('users' => $users));
    }
	
    public function editUserAction($id)
    {
		$em = $this->getDoctrine()->getManager();
		$userRepository = $em->getRepository('COMUserBundle:User');

		$user = $userRepository->find($id);
		
        return $this->render('COMAdminBundle:user:edit_user.html.twig', array(
			'user' => $user,
		));
    }
}
