<?php

namespace COM\PlatformBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class HomeController extends Controller
{
    public function indexAction()
    {
        return $this->render('COMPlatformBundle:home:home.html.twig');
    }
}
