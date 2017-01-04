<?php

namespace COM\PlatformBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class AboutController extends Controller
{
    public function indexAction()
    {
        return $this->render('COMPlatformBundle:about:about.html.twig');
    }
	
    public function teamAction()
    {
        return $this->render('COMPlatformBundle:about:team.html.twig');
    }
	
    public function noticeAction()
    {
        return $this->render('COMPlatformBundle:about:notice.html.twig');
    }
}
