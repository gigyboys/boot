<?php

namespace COM\UserBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Security\Core\Authentication\Token\UsernamePasswordToken;
use Symfony\Component\HttpFoundation\RedirectResponse; 
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;

use COM\UserBundle\Entity\User;
use COM\UserBundle\Entity\UserPassword;
use COM\UserBundle\Form\Type\UserType;
use COM\UserBundle\Form\Type\UserPasswordType;
use COM\UserBundle\Form\Type\UserSetNewPasswordType;
use COM\UserBundle\Form\Type\UserCommonType;
use COM\UserBundle\Form\Type\UserBiographyType;
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
		$userRepository = $em->getRepository('COMUserBundle:User');
		$userService = $this->container->get('com_user.user_service');
		$platformService = $this->container->get('com_platform.platform_service');
		
		$request = $this->get('request');
		$shortLocale = $request->getLocale();
		$locale = $localeRepository->findOneBy(array(
			'locale' => $shortLocale,
		));
		
		$user = new User();
		$msg = "";
		$form = $this->get('form.factory')->create(new userType(), $user);
		
		$error = false;
		$errorEmail = "";
		$errorName = "";
		$errorPassword = "";

		if ($form->handleRequest($request)->isValid()) {
			
			//name
			$user->setName(trim($user->getName()));
			if($user->getName() == ""){
				$error = true;
				$errorName = "Vous devez fournir votre nom complet";
			}
			
			//email
			$user->setEmail(trim($user->getEmail()));
			if($user->getEmail() == ""){
				$error = true;
				$errorEmail = "Vous devez fournir votre adresse email";
			}
			if($errorEmail == ""){
				if (!filter_var($user->getEmail(), FILTER_VALIDATE_EMAIL)) {
					$error = true;
					$errorEmail = "Vous devez fournir une adresse mail valide";
				}
			}
			if($errorEmail == ""){
				$hasEmailDoublon = $userService->checkHasEmailDoublon($user->getEmail(), $user->getId());
				if($hasEmailDoublon){
					$error = true;
					$errorEmail = "Choisissez une autre adresse email";	
				}
			}
			
			//password
			if(strlen($user->getPassword())<8){
				$error = true;
				$errorPassword = "ne doit pas être moins de 8 caractères";
			}
			
			if($error){
				return $this->render('COMUserBundle:user:register.html.twig', array(
					'formRegister' => $form->createView(),
					'user' => $user,
					'errorEmail' => $errorEmail,
					'errorName' => $errorName,
					'errorPassword' => $errorPassword,
					'msg' => $msg,
				));
			}else{
				$user->setDate(new \DateTime());
				$factory = $this->get('security.encoder_factory');
				$encoder = $factory->getEncoder($user);
				$user->setSalt(md5(time()));
				$pass = $encoder->encodePassword($user->getPassword(), $user->getSalt());
				$user->setPassword($pass);
				
				$slug = $platformService->sluggify($user->getName());
				
				$slugtmp = $slug;
				$notSlugs = array(
					"school", 
					"blog", 
					"advert", 
					"forum", 
					"about", 
					"team", 
					"legal-notice", 
					"contact", 
					"newsletter",
					"categories", 
					"category", 
					"user", 
					"admin", 
					"logout", 
					"login", 
					"register",
				);
				$isSluggable = true;
				$i = 2;
				do {
					$usertmp = $userRepository->findOneBy(array(
						'username' => $slugtmp
					));
					if($usertmp || in_array($slugtmp, $notSlugs)){
						$slugtmp = $slug."-".$i;
						$i++;
					}
					else{
						$isSluggable = false;
					}
				} 
				while ($isSluggable);
				$slug = $slugtmp;
				
				$user->setUsername($slug);
				
				$user->setSex(0);
				
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
				
				$url = $this->get('router')->generate('com_user_profile', array('username' => $user->getUsername()));
				return new RedirectResponse($url);
			}
		}else{
			return $this->render('COMUserBundle:user:register.html.twig', array(
				'formRegister' => $form->createView(),
				'user' => $user,
				'errorEmail' => $errorEmail,
				'errorName' => $errorName,
				'errorPassword' => $errorPassword,
				'msg' => $msg,
			));
		}
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
	
	public function setNewPasswordAction(Request $request)
	{
		if ($this->get('security.context')->isGranted('IS_AUTHENTICATED_REMEMBERED')) {
			return $this->redirectToRoute('com_platform_home');
		}
		$em = $this->getDoctrine()->getManager();
		$localeRepository = $em->getRepository('COMPlatformBundle:Locale');
		$userRepository = $em->getRepository('COMUserBundle:User');
		$platformService = $this->container->get('com_platform.platform_service');
		
		$shortLocale = $request->getLocale();
		$locale = $localeRepository->findOneBy(array(
			'locale' => $shortLocale,
		));
		
		$userTemp = new User();
		$form = $this->get('form.factory')->create(new userSetNewPasswordType(), $userTemp);
		$error = "";
		if ($form->handleRequest($request)->isValid()) {
			$user = $userRepository->findOneBy(array(
				"email" => $userTemp->getEmail(),
			));
			if($user){
				$token = $platformService->generateRandomString(64);
				$user->setToken($token);
				$em->persist($user);
				$em->flush();
				
				$urlToken = $this->get('router')->generate('com_user_set_new_password_token', array('user_id' => $user->getId(), 'token' => $user->getToken()), true);
				
				/*
				*@todo sending mail here
				*/
						
				$content = "Voici le lien qui permet de reinitialiser votre mot de passe : <a href=".$urlToken.">".$urlToken."</a>";
				$message = (new \Swift_Message('Password recuperation'))
					->setFrom('notification@gmail.com')
					->setTo($user->getEmail())
					->setBody(
						$content,
						'text/html'
					)
				;
				$this->get('mailer')->send($message);
				
				return $this->render('COMUserBundle:user:set_new_password_step2.html.twig', array(
					"user" => $user,
					"urlToken" => $urlToken,
				));
			}else{
				$error = "Cette adresse n'est pas lié à un utilisateur";
			}
		}

		return $this->render('COMUserBundle:user:set_new_password.html.twig', array(
			'formSetNewPassword' => $form->createView(),
			'error' => $error,
		));
	}
	
	public function sendNewPasswordAction($user_id, $token, Request $request)
	{
		if ($this->get('security.context')->isGranted('IS_AUTHENTICATED_REMEMBERED')) {
			return $this->redirectToRoute('com_platform_home');
		}
		$em = $this->getDoctrine()->getManager();
		$localeRepository = $em->getRepository('COMPlatformBundle:Locale');
		$userRepository = $em->getRepository('COMUserBundle:User');
		$platformService = $this->container->get('com_platform.platform_service');
		
		$shortLocale = $request->getLocale();
		$locale = $localeRepository->findOneBy(array(
			'locale' => $shortLocale,
		));
		
		$user = $userRepository->findOneBy(array(
			"id" => $user_id,
			"token" => $token,
		));
		
		$error = "";
		if ($user) {
			$passwordLenght = rand(8,12);
			//$plainpassword = "0000";
			$plainpassword = $platformService->generateRandomString($passwordLenght);;
			$encoder = $this->container->get('security.encoder_factory')->getEncoder($user);
			$encodedPassword = $encoder->encodePassword($plainpassword, $user->getSalt());
			$user->setPassword($encodedPassword);
			$em->persist($user);
			$em->flush();
			
			/*
			*@todo sending mail here
			*/
			$content = "Vous pouvez vous connecter sur le site avec votre nouveaul identifiant : <span> email : ".$user->getEmail()."</span> - <span> password : ".$plainpassword."</span>";
			$message = (new \Swift_Message('Password recuperation'))
				->setFrom('notification@gmail.com')
				->setTo($user->getEmail())
				->setBody(
					$content,
					'text/html'
				)
			;
			$this->get('mailer')->send($message);			
			
			return $this->render('COMUserBundle:user:set_new_password_step3.html.twig', array(
				"user" => $user,
				//"password" => $plainpassword,
			));
		}else{
			$error = "Une erreur est survenue. Veuillez renvoyer votre email.";
		}

		return $this->render('COMUserBundle:user:set_new_password.html.twig', array(
			'error' => $error,
		));
	}
	
    public function profileAction($username, $type)
    {
		$em = $this->getDoctrine()->getManager();
		$userRepository = $em->getRepository('COMUserBundle:User');
		$schoolSubscriptionRepository = $em->getRepository('COMSchoolBundle:SchoolSubscription');
		$localeRepository = $em->getRepository('COMPlatformBundle:Locale');
		
		$request = $this->get('request');
		$shortLocale = $request->getLocale();
		$locale = $localeRepository->findOneBy(array(
			'locale' => $shortLocale,
		));
		
		$user = $userRepository->findOneBy(array(
			'username' => $username,
		));
		
		if($user){
			$schoolSubscriptions = $schoolSubscriptionRepository->findBy(array(
				'user' => $user,
			));
			
			
			if($type == "profile" || $type == "subscription" || $type == "contribution" ){
				return $this->render('COMUserBundle:user:profile.html.twig', array(
					'user' => $user,
					'locale' => $locale,
					'type' => $type,
					'schoolSubscriptions' => $schoolSubscriptions,
				));
			}
			elseif ($this->get('security.context')->isGranted('IS_AUTHENTICATED_REMEMBERED') &&  $this->getUser()->getId() == $user->getId()) {
				$types = array("profile", "setting");
				if (!in_array($type, $types)) {
					$type = "profile";
				}
				
				return $this->render('COMUserBundle:user:profile.html.twig', array(
					'user' => $user,
					'locale' => $locale,
					'type' => $type,
					'schoolSubscriptions' => $schoolSubscriptions,
				));
			}else{
				$url = $this->get('router')->generate('com_user_profile', array(
					'username' => $username,
					'type' => 'profile',
				));
				return new RedirectResponse($url);
			}
		}else{
			throw new NotFoundHttpException('Page not found');
		}
    }

	public function modifyAvatarPopupAction()
    {
        $em = $this->getDoctrine()->getManager();
		$localeRepository = $em->getRepository('COMPlatformBundle:Locale');
        $avatarRepository = $em->getRepository('COMUserBundle:Avatar');
		
		$user = $this->getUser();
		$avatars = $avatarRepository->findBy(array('user' => $user));
		$currentAvatar = $avatarRepository->findOneBy(array(
			'user' => $user,
			'currentAvatar' => true,
		));
		
        $response = new Response();

		$content = $this->renderView('COMUserBundle:user:modify_avatar_popup.html.twig', array(
			'avatars' => $avatars,
			'currentAvatar' => $currentAvatar,
		));
			
		$response->setContent(json_encode(array(
			'state' => 1,
			'content' => $content,
		)));
		
        $response->headers->set('Content-Type', 'application/json');
		return $response;
    }

	public function selectAvatarAction($id)
    {
        
        $em = $this->getDoctrine()->getManager();
		$localeRepository = $em->getRepository('COMPlatformBundle:Locale');
        $avatarRepository = $em->getRepository('COMUserBundle:Avatar');
		
		$user = $this->getUser();
		
		$response = new Response();
		
		$response->setContent(json_encode(array(
			'state' => 0,
		)));
		
		if($user){
			if($id == 0){
				$avatars = $avatarRepository->findBy(array('user' => $user));

				foreach ($avatars as $userAvatar) {
					$userAvatar->setCurrentAvatar(false);
					$em->persist($userAvatar);
				}
				$em->flush();
				
				$defaultAvatarPath = 'default/images/user/avatar/default.jpeg';
				$avatar32x32 = $this->renderView('COMUserBundle:user:include/avatar32x32.html.twig', array(
				  'avatarPath' => $defaultAvatarPath
				));
				
				$avatar116x116 = $this->renderView('COMUserBundle:user:include/avatar116x116.html.twig', array(
				  'avatarPath' => $defaultAvatarPath
				));
				
				$avatar50x50 = $this->renderView('COMUserBundle:user:include/avatar50x50.html.twig', array(
				  'avatarPath' => $defaultAvatarPath
				));
				
				
				$response->setContent(json_encode(array(
					'state' => 1,
					'avatar32x32' => $avatar32x32,
					'avatar116x116' => $avatar116x116,
					'avatar50x50' => $avatar50x50,
				)));
			}else{
				$avatar = $avatarRepository->find($id);
				
				if($avatar && $user->getId() == $avatar->getUser()->getId()){
					$avatars = $avatarRepository->findBy(array('user' => $user));
					
					foreach ($avatars as $userAvatar) {
						$userAvatar->setCurrentAvatar(false);
						$em->persist($userAvatar);
					}
					
					$avatar->setCurrentAvatar(true);
					
					$em->persist($avatar);
					$em->flush();
					
					$avatar32x32 = $this->renderView('COMUserBundle:user:include/avatar32x32.html.twig', array(
					  'avatarPath' => $avatar->getWebPath()
					));
					
					$avatar116x116 = $this->renderView('COMUserBundle:user:include/avatar116x116.html.twig', array(
					  'avatarPath' => $avatar->getWebPath()
					));
					
					$avatar50x50 = $this->renderView('COMUserBundle:user:include/avatar50x50.html.twig', array(
					  'avatarPath' => $avatar->getWebPath()
					));
					
					
					$response->setContent(json_encode(array(
						'state' => 1,
						'avatar32x32' => $avatar32x32,
						'avatar116x116' => $avatar116x116,
						'avatar50x50' => $avatar50x50,
					)));
				}
			}
		}
		
        $response->headers->set('Content-Type', 'application/json');
		return $response;
    }

	public function deleteAvatarAction($id)
    {
        
        $em = $this->getDoctrine()->getManager();
		$localeRepository = $em->getRepository('COMPlatformBundle:Locale');
        $avatarRepository = $em->getRepository('COMUserBundle:Avatar');
		
		$user = $this->getUser();
		$avatar = $avatarRepository->find($id);
		
        $response = new Response();
		
		$response->setContent(json_encode(array(
			'state' => 0,
		)));
		
		if($user && $avatar){
			if($user->getId() == $avatar->getUser()->getId()){
				$avatarId = $avatar->getId();
				$em->remove($avatar);
				$em->flush();
				
				$currentAvatar = $avatarRepository->findOneBy(array(
					'user' => $user,
					'currentAvatar' => true,
				));
				
				if($currentAvatar){
					$avatar32x32 = $this->renderView('COMUserBundle:user:include/avatar32x32.html.twig', array(
					  'avatarPath' => $currentAvatar->getWebPath()
					));
					
					$avatar116x116 = $this->renderView('COMUserBundle:user:include/avatar116x116.html.twig', array(
					  'avatarPath' => $currentAvatar->getWebPath()
					));
					
					$avatar50x50 = $this->renderView('COMUserBundle:user:include/avatar50x50.html.twig', array(
					  'avatarPath' => $currentAvatar->getWebPath()
					));
					
					$response->setContent(json_encode(array(
						'state' => 1,
						'avatarId' => $avatarId,
						'avatar32x32' => $avatar32x32,
						'avatar116x116' => $avatar116x116,
						'avatar50x50' => $avatar50x50,
						'isCurrentAvatar' => false,
					)));
				}else{
					$defaultAvatarPath = 'default/images/user/avatar/default.jpeg';
					$avatar32x32 = $this->renderView('COMUserBundle:user:include/avatar32x32.html.twig', array(
					  'avatarPath' => $defaultAvatarPath
					));
					
					$avatar116x116 = $this->renderView('COMUserBundle:user:include/avatar116x116.html.twig', array(
					  'avatarPath' => $defaultAvatarPath
					));
					
					$avatar50x50 = $this->renderView('COMUserBundle:user:include/avatar50x50.html.twig', array(
					  'avatarPath' => $defaultAvatarPath
					));
					
					$response->setContent(json_encode(array(
						'state' => 1,
						'avatarId' => $avatarId,
						'avatar32x32' => $avatar32x32,
						'avatar116x116' => $avatar116x116,
						'avatar50x50' => $avatar50x50,
						'isCurrentAvatar' => true,
					)));
				}
			}
		}
		
        $response->headers->set('Content-Type', 'application/json');
		return $response;
    }

	public function modifyAvatarAction()
    {
        
        $em = $this->getDoctrine()->getManager();
        $avatarRepository = $em->getRepository('COMUserBundle:Avatar');
        
        $avatar = new Avatar();
        $user = $this->getUser();
        
        $formAvatar = $this->get('form.factory')->create(new AvatarType, $avatar);
        $formAvatar->handleRequest($this->getRequest());
		
		$response = new Response();
		$response->setContent(json_encode(array(
			'state' => 0,
		)));
		
        if ($user && $formAvatar->isValid()) {
            $avatars = $avatarRepository->findBy(array('user' => $user));
            
            foreach ($avatars as $userAvatar) {
                $userAvatar->setCurrentAvatar(false);
            }
			
            $avatar->setCurrentAvatar(true);
			
            $avatar->setUser($user);
			
            $em->persist($avatar);
            $em->flush();
			
            $avatar32x32 = $this->renderView('COMUserBundle:user:include/avatar32x32.html.twig', array(
			  'avatarPath' => $avatar->getWebPath()
			));
			
            $avatar116x116 = $this->renderView('COMUserBundle:user:include/avatar116x116.html.twig', array(
			  'avatarPath' => $avatar->getWebPath()
			));
			
            $avatar50x50 = $this->renderView('COMUserBundle:user:include/avatar50x50.html.twig', array(
			  'avatarPath' => $avatar->getWebPath()
			));
			
            $avatarItemContent = $this->renderView('COMUserBundle:user:include/avatar_item.html.twig', array(
			  'avatar' => $avatar,
			  'classActive' => 'active'
			));
			
            $response->setContent(json_encode(array(
                'state' => 1,
                'avatar32x32' 		=> $avatar32x32,
                'avatar116x116'	 	=> $avatar116x116,
                'avatar50x50' 		=> $avatar50x50,
                'avatarItemContent' => $avatarItemContent,
            )));
        }

		$response->headers->set('Content-Type', 'application/json');
		
		return $response;
    }
	
    public function editUserCommonAction(Request $request)
    {
		if ($request->isXmlHttpRequest()){
			$user = $this->getUser();
			$response = new Response();
			if($user){
				$em = $this->getDoctrine()->getManager();
				
				$userTemp = new User();
				$formUserCommon = $this->get('form.factory')->create(new UserCommonType(), $userTemp);
				
				if ($formUserCommon->handleRequest($request)->isValid()) {
					$userService = $this->container->get('com_user.user_service');
					$error = false;
					$errorUsername = "";
					$errorEmail = "";
					$errorName = "";
					$listErrors = array();
					
					//username
					$platformService = $this->container->get('com_platform.platform_service');
					$username = $platformService->sluggify($userTemp->getUsername());
					
					if($username == ""){
						$error = true;
						$errorUsername = "Vous devez fournir votre nom d'utilisateur";
					}

					if($errorUsername == ""){
						$hasDoublon = $userService->checkHasDoublon($username, $user->getId());
						if($hasDoublon){
							$error = true;
							$errorUsername = "Choisissez un autre nom d'utilisateur";	
						}
					}
					
					//email
					$email = trim($userTemp->getEmail());
					if($email == ""){
						$error = true;
						$errorEmail = "Vous devez fournir votre adresse email";
					}
					
					if($errorEmail == ""){
						if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
							$error = true;
							$errorEmail = "Vous devez fournir une adresse mail valide";
						}
					}
					
					if($errorEmail == ""){
						$hasEmailDoublon = $userService->checkHasEmailDoublon($email, $user->getId());
						if($hasEmailDoublon){
							$error = true;
							$errorEmail = "Choisissez une autre adresse email";	
						}
					}
					
					//name
					$name = trim($userTemp->getName());
					if($name == ""){
						$error = true;
						$errorName = "Vous devez fournir votre nom complet";
					}
					
					//location
					$location = trim($userTemp->getLocation());
					
					if($error){
						$listErrors["errorUsername"]= $errorUsername;
						$listErrors["errorEmail"]= $errorEmail;
						$listErrors["errorName"]= $errorName;
						$response->setContent(json_encode(array(
							'state' => 2,
							'error' => $listErrors,
						)));
						return $response;
					}
					
					$user->setName($name);
					$user->setUsername($username);
					$user->setLocation($location);
					$user->setEmail($email);
					
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
					
					$location = $user->getLocation();
					if($location == null || $location == ""){
						$location = "";
					}
					$title = 'Profile '.$user->getUsername();
					
					$url = $this->get('router')->generate('com_user_profile', array('username' => $user->getUsername()));
					$urlSetting = $this->get('router')->generate('com_user_profile', array(
						'username' => $user->getUsername(),
						'type' => 'setting',
					));
					
					$response->setContent(json_encode(array(
						'state' => 1,
						'name' => $user->getName(),
						'username' => $user->getUsername(),
						'location' => $location,
						'email' => $user->getEmail(),
						'title' => $title,
						'url' => $url,
						'urlSetting' => $urlSetting,
					)));
				}else{
					$response->setContent(json_encode(array(
						'state' => 0,
						'message' => 'serveur message : une erreur est survenue',
					)));
				}
			}else{
				$urlLogin = $this->get('router')->generate('com_user_login');
				$response->setContent(json_encode(array(
					'state' => 3,
					'urlLogin' => $urlLogin,
				)));
			}
			$response->headers->set('Content-Type', 'application/json');
			return $response;
		}else{
            throw new NotFoundHttpException('Page not found');
        }
    }
	
    public function editUserBiographyAction(Request $request)
    {
		if ($request->isXmlHttpRequest()){
			$em = $this->getDoctrine()->getManager();
			
			$user = $this->getUser();
			if($user){
				$userTemp = new User();
				$formUserBiography = $this->get('form.factory')->create(new UserBiographyType(), $userTemp);
				
				$response = new Response();
				
				if ($formUserBiography->handleRequest($request)->isValid()) {
					//traitement
				
					$user->setBiography($userTemp->getBiography());
					$em->persist($user);
					$em->flush();
					
					$response->setContent(json_encode(array(
						'state' => 1,
						'biography' => $user->getBiography(),
					)));
					//fin traitement
				}else{
					$response->setContent(json_encode(array(
						'state' => 0,
						'message' => 'serveur message : une erreur est survenue',
					)));
				}
				$response->headers->set('Content-Type', 'application/json');
				return $response;
			}else{
				
			}
		}else{
            throw new NotFoundHttpException('Page not found');
        }
    }
	
    public function editUserPasswordAction(Request $request)
    {
		if ($request->isXmlHttpRequest()){
			$em = $this->getDoctrine()->getManager();
			
			$user = $this->getUser();
			if($user){
				$userPassword = new UserPassword();
				$formUserPassword = $this->get('form.factory')->create(new UserPasswordType(), $userPassword);
				
				$response = new Response();
				
				if ($formUserPassword->handleRequest($request)->isValid()) {
					//traitement
					$encoder = $this->container->get('security.encoder_factory')->getEncoder($user);
					$currentPasswordEncoded = $encoder->encodePassword($userPassword->getCurrentPassword(), $user->getSalt());
					if($user->getPassword() == $currentPasswordEncoded && $userPassword->getNewPassword() != "" && $userPassword->getNewPassword() == $userPassword->getRepeatPassword()) {
						$newPasswordEncoded = $encoder->encodePassword($userPassword->getNewPassword(), $user->getSalt());
						$user->setPassword($newPasswordEncoded);
						$em->persist($user);
						$em->flush();
						
						$response->setContent(json_encode(array(
							'state' => 1,
							'currentPassword' => $userPassword->getCurrentPassword(),
							'newPassword' => $userPassword->getNewPassword(),
							'repeatPassword' => $userPassword->getRepeatPassword(),
							'newPasswordEncoded' => $newPasswordEncoded,
						)));
					} else {
						$response->setContent(json_encode(array(
							'state' => 0,
							'message' => 'serveur message : une erreur est survenue',
						)));
					}
					//fin traitement
				}else{
					$response->setContent(json_encode(array(
						'state' => 0,
						'message' => 'serveur message : une erreur est survenue',
					)));
				}
				$response->headers->set('Content-Type', 'application/json');
				return $response;
			}else{
				
			}
		}else{
            throw new NotFoundHttpException('Page not found');
        }
    }
	
    public function infoPopupAction($id, Request $request)
    {
		if ($request->isXmlHttpRequest()){
			$em = $this->getDoctrine()->getManager();
			$userRepository = $em->getRepository('COMUserBundle:User');
			$user = $userRepository->find($id);
			
			$response = new Response();
			$content = $this->renderView('COMUserBundle:user:info-popup.html.twig', array(
			  'user' => $user
			));
			$response->setContent(json_encode(array(
				'state' => 1,
				'content' => $content,
			)));
			
			$response->headers->set('Content-Type', 'application/json');
			return $response;
		}else{
            throw new NotFoundHttpException('Page not found');
        }
    }
}
