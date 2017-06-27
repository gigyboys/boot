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
		$localeRepository = $em->getRepository('COMPlatformBundle:Locale');
		$parameterRepository = $em->getRepository('COMPlatformBundle:Parameter');
		$categoryRepository = $em->getRepository('COMSchoolBundle:Category');
		
		$shortLocale = $request->getLocale();
		$locale = $localeRepository->findOneBy(array(
			'locale' => $shortLocale,
		));
		
		$parameter = $parameterRepository->findOneBy(array(
			'parameter' => 'categories_index',
		));
		$limit = $parameter->getValue();
		
		$schoolService = $this->container->get('com_school.school_service');
		
		//$categories = $categoryRepository->findAll();
		$categories = $schoolService->getCategoriesWithPublishedSchool($limit);
		
		
        return $this->render('COMPlatformBundle:home:home.html.twig', array(
			'locale' => $locale,
			'categories' => $categories,
		));
    }
}
