<?php

namespace COM\PlatformBundle\Service;

use Doctrine\ORM\EntityManager;
use COM\PlatformBundle\Entity\NewsletterMail;

class NewsletterService {

    protected $em;

    public function __construct(EntityManager $em) {
        $this->em = $em;
    }
    
    public function addEmail($email, $forceActive = false) {
		
		$newsletterMailRepository = $this->em->getRepository('COMPlatformBundle:NewsletterMail');
		
		$newsletterMail = $newsletterMailRepository->findOneBy(array(
			'email' => $email,
		));
		
		if (!$newsletterMail){
			$newsletterMail = new NewsletterMail();
			
			$newsletterMail->setEmail($email);
			$newsletterMail->setDate(new \DateTime());
			if($forceActive){
				$newsletterMail->setIsActive(true);
			}else{
				$newsletterMail->setIsActive(false);
			}
			
			$this->em->persist($newsletterMail);
			$this->em->flush();
		}else{
			if($forceActive){
				$newsletterMail->setIsActive(true);
				$this->em->persist($newsletterMail);
				$this->em->flush();
			}
		}
		
		return $newsletterMail;
    }

}
