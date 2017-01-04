<?php

namespace COM\EventBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class DefaultController extends Controller
{
    public function indexAction($name)
    {
        return $this->render('COMEventBundle:Default:index.html.twig', array('name' => $name));
    }
}
