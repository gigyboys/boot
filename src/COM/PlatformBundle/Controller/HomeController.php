<?php

namespace COM\PlatformBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;

class HomeController extends Controller
{
    public function indexAction(Request $request)
    {
		$em = $this->getDoctrine()->getManager();
		$categoryRepository = $em->getRepository('COMSchoolBundle:Category');
		$localeRepository = $em->getRepository('COMPlatformBundle:Locale');
		
		$shortLocale = $request->getLocale();
		$locale = $localeRepository->findOneBy(array(
			'locale' => $shortLocale,
		));
		
		$categories = $categoryRepository->findAll();
		
		
        return $this->render('COMPlatformBundle:home:home.html.twig', array(
			'locale' => $locale,
			'categories' => $categories,
		));
    }
}
