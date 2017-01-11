<?php

namespace COM\UserBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Security\Core\Authentication\Token\UsernamePasswordToken;

use COM\UserBundle\Entity\User;
use COM\UserBundle\Form\Type\UserType;
use COM\UserBundle\Form\Type\UserCommonType;
use COM\UserBundle\Entity\Avatar;
use COM\UserBundle\Form\Type\AvatarType;

class UserController extends Controller
{
    public function registerAction(Request $request)
    {
		// Si le visiteur est déjà identifié, on le redirige vers l'accueil
		if ($this->get('security.context')->isGranted('IS_AUTHENTICATED_REMEMBERED')) {
			return $this->redirectToRoute('com_platform_home');
		}
		
		$em = $this->getDoctrine()->getManager();
		$localeRepository = $em->getRepository('COMPlatformBundle:Locale');
		
		$request = $this->get('request');
		$shortLocale = $request->getLocale();
		$locale = $localeRepository->findOneBy(array(
			'locale' => $shortLocale,
		));
		
		$user = new User();
		$msg = "";
		$form = $this->get('form.factory')->create(new userType(), $user);

		if ($form->handleRequest($request)->isValid()) {
			$factory = $this->get('security.encoder_factory');
			$encoder = $factory->getEncoder($user);
			$user->setSalt(md5(time()));
			$pass = $encoder->encodePassword($user->getPassword(), $user->getSalt());
			$user->setPassword($pass);
			$user->setLocale($locale);
			$em->persist($user);
			$em->flush();
						
			//add email to newsletter with isActive = false
			$email = $user->getEmail();
			$newsletterService = $this->container->get('com_platform.newsletter_service');
			$newsletterService->addEmail($email);
				
			$token = new UsernamePasswordToken($user, null, 'main', $user->getRoles());
			$this->get('security.context')->setToken($token);
			$this->get('session')->set('_security_main',serialize($token));
			
			//$msg = "<div style='color:#050'>Inscription validé</div>";
			//$user = new User();
			//$form = $this->get('form.factory')->create(new userType(), $user);
			return $this->render('COMUserBundle:user:profile.html.twig', array(
				'user' => $user,
			));
		}

		/*return $this->render('OCPlatformBundle:Advert:add.html.twig', array(
		  'form' => $form->createView(),
		));*/
        return $this->render('COMUserBundle:user:register.html.twig', array(
		  'formRegister' => $form->createView(),
		  'msg' => $msg,
		));
    }
	
	public function loginAction(Request $request)
	{
		// Si le visiteur est déjà identifié, on le redirige vers l'accueil
		if ($this->get('security.context')->isGranted('IS_AUTHENTICATED_REMEMBERED')) {
			return $this->redirectToRoute('com_platform_home');
		}

		// Le service authentication_utils permet de récupérer le nom d'utilisateur
		// et l'erreur dans le cas où le formulaire a déjà été soumis mais était invalide
		// (mauvais mot de passe par exemple)
		$authenticationUtils = $this->get('security.authentication_utils');

		return $this->render('COMUserBundle:user:login.html.twig', array(
			'last_username' => $authenticationUtils->getLastUsername(),
			'error'         => $authenticationUtils->getLastAuthenticationError(),
		));
	}
	
    public function profileAction($username)
    {
		$em = $this->getDoctrine()->getManager();
		$userRepository = $em->getRepository('COMUserBundle:User');
		$localeRepository = $em->getRepository('COMPlatformBundle:Locale');
		
		$request = $this->get('request');
		$shortLocale = $request->getLocale();
		$locale = $localeRepository->findOneBy(array(
			'locale' => $shortLocale,
		));
		
		$user = $userRepository->findOneBy(array(
			'username' => $username,
		));
		
        return $this->render('COMUserBundle:user:profile.html.twig', array(
			'user' => $user,
			'locale' => $locale,
		));
    }

	public function modifyAvatarAction()
    {
        
        $em = $this->getDoctrine()->getManager();
        $avatarRepository = $em->getRepository('COMUserBundle:Avatar');
        
        $avatar = new Avatar();
        $user = $this->getUser();
        
        $formAvatar = $this->get('form.factory')->create(new AvatarType, $avatar);
        $formAvatar->handleRequest($this->getRequest());

        if ($formAvatar->isValid()) {
            $avatars = $avatarRepository->findBy(array('user' => $user));
            
            foreach ($avatars as $userAvatar) {
                $userAvatar->setCurrentAvatar(false);
            }
			
            $avatar->setCurrentAvatar(true);
			
            $avatar->setUser($user);
            $avatar->setCurrentAvatar(true);
			
            $em->persist($avatar);
            $em->flush();
			
            $avatar32x32 = $this->renderView('COMUserBundle:user:include/avatar32x32.html.twig', array(
			  'avatarPath' => $avatar->getWebPath()
			));
			
            $avatar80x80 = $this->renderView('COMUserBundle:user:include/avatar80x80.html.twig', array(
			  'avatarPath' => $avatar->getWebPath()
			));
			
			$response = new Response();
            $response->setContent(json_encode(array(
                'state' => 1,
                'avatar32x32' => $avatar32x32,
                'avatar80x80' => $avatar80x80,
            )));
            $response->headers->set('Content-Type', 'application/json');
            
            return $response;
        }

        $response = new Response();
		$response->setContent(json_encode(array(
			'state' => 0,
		)));
		$response->headers->set('Content-Type', 'application/json');
		
		return $response;
    }
	
    public function editUserCommonAction($user_id, Request $request)
    {
		$em = $this->getDoctrine()->getManager();
		$userRepository = $em->getRepository('COMUserBundle:User');
        
        $user = $userRepository->find($user_id);
        
		$userTemp = new User();
		$formUserCommon = $this->get('form.factory')->create(new UserCommonType(), $userTemp);
		
        $response = new Response();
		
		if ($formUserCommon->handleRequest($request)->isValid()) {
			//name
			$user->setName($userTemp->getName());
			//username
			$platformService = $this->container->get('com_platform.platform_service');
			$username = $platformService->sluggify($userTemp->getUsername());
			
			/*vérification username à ajouter*/
			
			$user->setUsername($username);
			
			$user->setEmail($userTemp->getEmail());
            
			$em->persist($user);
            $em->flush();
			
			$oldToken = $this->container->get('security.context')->getToken();
			$token = new UsernamePasswordToken(
				$user,
				null,
				$oldToken->getProviderKey(),
				$user->getRoles()
			);
			$this->container->get('security.context')->setToken($token);
			
			$title = 'Profile '.$user->getUsername();
			$url = $this->get('router')->generate('com_user_profile', array('username' => $user->getUsername()));
            $response->setContent(json_encode(array(
                'state' => 1,
                'name' => $user->getName(),
                'username' => $user->getUsername(),
                'email' => $user->getEmail(),
                'title' => $title,
                'url' => $url,
            )));
		}else{
            $response->setContent(json_encode(array(
                'state' => 0,
                'message' => 'serveur message : une erreur est survenue',
            )));
		}
        $response->headers->set('Content-Type', 'application/json');
		return $response;
    }
}
