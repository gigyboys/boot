<?php

namespace COM\AdminBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class DashboardController extends Controller
{
    public function indexAction()
    {
		$em = $this->getDoctrine()->getManager();
		$schoolRepository = $em->getRepository('COMSchoolBundle:School');
		$postRepository = $em->getRepository('COMBlogBundle:Post');
		$advertRepository = $em->getRepository('COMAdvertBundle:Advert');
		
		$schools = $schoolRepository->findAll();
		$posts = $postRepository->findAll();
		$adverts = $advertRepository->findAll();
		
        return $this->render('COMAdminBundle:dashboard:index.html.twig', array(
			'schools' => $schools,
			'posts' => $posts,
			'adverts' => $adverts,
		));
    }
}
