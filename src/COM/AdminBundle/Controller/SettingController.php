<?php

namespace COM\AdminBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\RedirectResponse; 
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;

use COM\PlatformBundle\Entity\Locale;
use COM\UserBundle\Entity\User;
use COM\PlatformBundle\Entity\Parameter;
use COM\PlatformBundle\Entity\Accessibility;
use COM\PlatformBundle\Form\Type\AccessibilityType;

class SettingController extends Controller
{
	
    public function accessibilityAction(Request $request)
    {
		$em = $this->getDoctrine()->getManager();
		$localeRepository = $em->getRepository('COMPlatformBundle:Locale');
		$parameterRepository = $em->getRepository('COMPlatformBundle:Parameter');
		
		$response = new Response();
		if ($request->isXmlHttpRequest()){
			$accessibility = new Accessibility();
			$formAccessibility = $this->get('form.factory')->create(new AccessibilityType(), $accessibility);
			
			if ($formAccessibility->handleRequest($request)->isValid()) {
				$default = 12;
				$categories_index = $parameterRepository->findOneBy(array(
					'parameter' => 'categories_index'
				));
				$categories_index->setValue($accessibility->getCategoriesIndex());
				if(!($categories_index->getValue()>=2 && $categories_index->getValue()<=24)){
					$categories_index->setValue($default);
				}
				$em->persist($categories_index);
				
				$schools_by_page = $parameterRepository->findOneBy(array(
					'parameter' => 'schools_by_page'
				));
				$schools_by_page->setValue($accessibility->getSchoolsByPage());
				if(!($schools_by_page->getValue()>=2 && $schools_by_page->getValue()<=24)){
					$schools_by_page->setValue($default);
				}
				$em->persist($schools_by_page);
				
				$posts_by_page = $parameterRepository->findOneBy(array(
					'parameter' => 'posts_by_page'
				));
				$posts_by_page->setValue($accessibility->getPostsByPage());
				if(!($posts_by_page->getValue()>=2 && $posts_by_page->getValue()<=24)){
					$posts_by_page->setValue($default);
				}
				$em->persist($posts_by_page);
				
				$em->flush();

				$response->setContent(json_encode(array(
					'state' => 1,
					'categoriesIndex' => $categories_index->getValue(),
					'schoolsByPage' => $schools_by_page->getValue(),
					'postsByPage' => $posts_by_page->getValue(),
				)));
			}else{
				$response->setContent(json_encode(array(
					'state' => 0,
				)));
			}
		}else{	
			$categories_index = $parameterRepository->findOneBy(array(
				'parameter' => 'categories_index'
			));		
			$schools_by_page = $parameterRepository->findOneBy(array(
				'parameter' => 'schools_by_page'
			));		
			$posts_by_page = $parameterRepository->findOneBy(array(
				'parameter' => 'posts_by_page'
			));
			
			$response = $this->render('COMAdminBundle:setting:accessibility.html.twig', array(
				'categories_index' => $categories_index->getValue(),
				'schools_by_page' => $schools_by_page->getValue(),
				'posts_by_page' => $posts_by_page->getValue(),
			));
		}
		return $response;
    }
}
