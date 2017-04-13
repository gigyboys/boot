<?php

namespace COM\ForumBundle\Entity;

use Doctrine\ORM\Mapping as ORM;


class SubjectInit
{
    private $title;

    private $message;


    public function setTitle($title)
    {
        $this->title = $title;

        return $this;
    }

    public function getTitle()
    {
        return $this->title;
    }


    public function setMessage($message)
    {
        $this->message = $message;

        return $this;
    }

    public function getMessage()
    {
        return $this->message;
    }
}
