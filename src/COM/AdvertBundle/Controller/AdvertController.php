<?php

namespace COM\AdvertBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\RedirectResponse; 

use COM\AdvertBundle\Entity\Advert;
use COM\AdvertBundle\Entity\AdvertTranslate;
use COM\PlatformBundle\Entity\View;
use COM\PlatformBundle\Entity\Comment;
use COM\PlatformBundle\Entity\AdvertSchool;
use COM\PlatformBundle\Form\Type\CommentType;

class AdvertController extends Controller
{
    public function indexAction()
    {
		$em = $this->getDoctrine()->getManager();
		$advertRepository = $em->getRepository('COMAdvertBundle:Advert');
		$localeRepository = $em->getRepository('COMPlatformBundle:Locale');
		
		$adverts = $advertRepository->findAll();
		
        return $this->render('COMAdvertBundle:advert:index_advert.html.twig', array(
			'adverts' => $adverts,
			'entityView' => 'advert',
		));
    }
	
    public function viewAction($slug)
    {
		$em = $this->getDoctrine()->getManager();
		$advertRepository = $em->getRepository('COMAdvertBundle:Advert');
		$commentRepository = $em->getRepository('COMPlatformBundle:Comment');
		$localeRepository = $em->getRepository('COMPlatformBundle:Locale');
		
		$user = $this->getUser();
		
		$request = $this->get('request');
		$shortLocale = $request->getLocale();
		$locale = $localeRepository->findOneBy(array(
			'locale' => $shortLocale,
		));
		
		$advert = $advertRepository->findOneBy(array(
			'slug' => $slug,
		));
		
		$advertService = $this->container->get('com_advert.advert_service');
		$advertService->hydrateAdvertLang($advert, $locale);
		
		$allComments = $commentRepository->findBy(array(
			'advert' => $advert,
		));
		
		$limit = 10;
		$type = "advert";
		$order = "ASC";
		$comments = $commentRepository->getCommentsLimit($type, $advert, $limit, $order);
		
		$previousComment = null;
		if(count($comments)){
			$index = count($comments)-1;
			$firstComment = $comments[$index];
			$previousComment = $commentRepository->getSinceComment($firstComment, $type, $advert);
		}
		
		$platformService = $this->container->get('com_platform.platform_service');
		$platformService->registerView($advert, $user, $request);
		
        return $this->render('COMAdvertBundle:advert:view_advert.html.twig', array(
			'advert' => $advert,
			'locale' => $locale,
			'comments' => $comments,
			'allComments' => $allComments,
			'previousComment' => $previousComment,
			'entityView' => 'advert',
		));
    }
	
    public function viewByIdAction($id, Request $request)
    {
		$em = $this->getDoctrine()->getManager();
		$advertRepository = $em->getRepository('COMAdvertBundle:Advert');
		
		$advert = $advertRepository->find($id);
		$url = $this->get('router')->generate('com_advert_view', array('slug' => $advert->getSlug()));
		return new RedirectResponse($url);
    }
	
	public function loadCommentsAction($advert_id, $comment_id, Request $request)
    {
		$em = $this->getDoctrine()->getManager();
		$advertRepository = $em->getRepository('COMAdvertBundle:Advert');
		$commentRepository = $em->getRepository('COMPlatformBundle:Comment');
        
		$comment = new Comment();
		$advert = $advertRepository->find($advert_id);
		$lastComment = $commentRepository->find($comment_id);
		
        $response = new Response();
		if($advert && $lastComment){
			$limit = 10;
			$type = "advert";
			$order = "ASC";
			$comments = $commentRepository->getCommentsSince($lastComment, $type, $advert, $limit, $order);
			
			$listComments = array();
			foreach($comments as $comment){
				$commentItem = $this->renderView('COMAdvertBundle:advert:include/comment_item.html.twig', array(
				  'comment' => $comment
				));
				array_push($listComments, array(
					"id" 			=> $comment->getId(),
					"commentItem" 	=> $commentItem,
				));
			}
		
			$previousComment = null;
			$previousCommentId = 0;
			$urlLoadComment = null;
			
			if(count($comments)){
				$index = count($comments)-1;
				$firstComment = $comments[$index];
				$previousComment = $commentRepository->getSinceComment($firstComment, $type, $advert, $order);
			}
			if ($previousComment){
				$previousCommentId = $previousComment->getId();
				$urlLoadComment = $this->get('router')->generate('com_advert_load_comment', array(
					'advert_id' => $advert->getId(),
					'comment_id' => $previousCommentId,
				));
			}
			
			$response->setContent(json_encode(array(
				'state' => 1,
				'comments' => $listComments,
				'previousCommentId' => $previousCommentId,
				'urlLoadComment' => $urlLoadComment,
			)));
		}else{
			$response->setContent(json_encode(array(
				'state' => 0,
			)));
		}
		
        $response->headers->set('Content-Type', 'application/json');
		return $response;
    }
	
	public function newCommentAction($advert_id, Request $request)
    {
		$em = $this->getDoctrine()->getManager();
		$advertRepository = $em->getRepository('COMAdvertBundle:Advert');
		$commentRepository = $em->getRepository('COMPlatformBundle:Comment');
        
		$comment = new Comment();
		$formComment = $this->get('form.factory')->create(new CommentType(), $comment);
		
        $response = new Response();
		
		if ($formComment->handleRequest($request)->isValid()) {
			$advert = $advertRepository->find($advert_id);
			$user = $this->getUser();
			
			if($advert && $user){
				
				//creation message
				$comment->setAdvert($advert);
				$comment->setUser($user);
				$comment->setDate(new \DateTime());
				
				$em->persist($comment);
				
				$em->flush();
				
				$comments = $commentRepository->findBy(array(
					'advert' => $advert,
				));
					
				$commentItem = $this->renderView('COMAdvertBundle:advert:include/comment_item.html.twig', array(
				  'comment' => $comment
				));
				
				$infoComment = "";
				if(count($comments) < 2){
					$infoComment = count($comments)." Commentaire" ;
				}else{
					$infoComment = count($comments)." Commentaires"; 
				}
				$response->setContent(json_encode(array(
					'state' => 1,
					'commentItem' => $commentItem,
					'infoComment' => $infoComment,
				)));
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
	
	public function setAdvertSchoolAction($advert_id, $school_id, Request $request)
    {
		$em = $this->getDoctrine()->getManager();
		$advertRepository = $em->getRepository('COMAdvertBundle:Advert');
		$schoolRepository = $em->getRepository('COMSchoolBundle:School');
		$schoolAdminRepository = $em->getRepository('COMSchoolBundle:SchoolAdmin');
		
		$advert = $advertRepository->find($advert_id);
		$school = $schoolRepository->find($school_id);
		$user = $this->getUser();
		
		$schoolAdmin = null;
		if($user){
			$schoolAdmin = $schoolAdminRepository->findOneBy(array(
				'user' => $user,
				'school' => $school,
			));
		}
		
        $response = new Response();
		
		if ($advert && $school && $schoolAdmin) {
			$advertSchoolRepository = $em->getRepository('COMPlatformBundle:AdvertSchool');
			
			$advertSchool = $advertSchoolRepository->findOneBy(array(
				'advert' => $advert,
				'school' => $school,
			));
			
			if($advertSchool){
				$response->setContent(json_encode(array(
					'state' => 0,
				)));
			}else{
				$advertSchool = new AdvertSchool();
				$advertSchool->setAdvert($advert);
				$advertSchool->setSchool($school);
				$advertSchool->setUser($user);
				$advertSchool->setUserConfirmation($user);
				$advertSchool->setAdvertToSchool(true);
				$advertSchool->setConfirmation(true);
				$advertSchool->setDate(new \DateTime());
				$advertSchool->setDateConfirmation(new \DateTime());
				
				$em->persist($advertSchool);
				$em->flush();
				
				$response->setContent(json_encode(array(
					'state' => 1,
					'schoolId' => $school->getId(),
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
