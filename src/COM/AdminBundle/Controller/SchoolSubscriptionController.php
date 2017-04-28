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

class SchoolSubscriptionController extends Controller
{
	public function indexAction($school_id)
    {
		$em = $this->getDoctrine()->getManager();
		$schoolRepository = $em->getRepository('COMSchoolBundle:School');
		$schoolSubscriptionRepository = $em->getRepository('COMSchoolBundle:SchoolSubscription');

		$school = $schoolRepository->find($school_id);
		$schoolSubscribers = $schoolSubscriptionRepository->findBy(array(
			'school' => $school,
			'active' => true,
		));
		
        return $this->render('COMAdminBundle:school:school_subscriber.html.twig', array(
			'school' => $school,
			'schoolSubscribers' => $schoolSubscribers
		));
    }
}
