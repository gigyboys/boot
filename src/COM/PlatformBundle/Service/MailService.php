<?php

namespace COM\PlatformBundle\Service;

use Doctrine\ORM\EntityManager;
use COM\BlogBundle\Entity\Post;
use COM\SchoolBundle\Entity\School;
use COM\AdvertBundle\Entity\Advert;
use COM\PlatformBundle\Entity\View;

class MailService {

    protected $em;

    public function __construct(EntityManager $em) {
        $this->em = $em;
    }

    
    public function mail() {
		
    }

}