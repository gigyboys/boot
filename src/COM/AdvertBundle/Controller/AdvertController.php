<?php

namespace COM\AdvertBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;

use COM\AdvertBundle\Entity\Advert;
use COM\AdvertBundle\Entity\AdvertTranslate;
use COM\PlatformBundle\Entity\View;
use COM\PlatformBundle\Entity\Comment;
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
		
		$comments = $commentRepository->findBy(array(
			'advert' => $advert,
		));
		
		$platformService = $this->container->get('com_platform.platform_service');
		$platformService->registerView($advert, $user, $request);
		
        return $this->render('COMAdvertBundle:advert:view_advert.html.twig', array(
			'advert' => $advert,
			'locale' => $locale,
			'comments' => $comments,
			'entityView' => 'advert',
		));
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
					
				$commentItem = $this->renderView('COMBlogBundle:blog:include/comment_item.html.twig', array(
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
}
