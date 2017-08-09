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
	
	public function testSendMailAction($name)
	{
		//$name = "Jean";
		$content = "mon nom : ".$name;
		$message = (new \Swift_Message('Hello Email'))
			->setFrom('severingigy@gmail.com')
			->setTo('severingigy@yahoo.fr')
			->setBody(
				$content,
				'text/html'
			)
		;

		//$mailer->send($message);
		$this->get('mailer')->send($message);

		return $this->render('COMPlatformBundle:about:notice.html.twig');
	}
}
