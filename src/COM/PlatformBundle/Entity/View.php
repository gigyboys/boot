<?php

namespace COM\PlatformBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * View
 *
 * @ORM\Table(name="pm_view")
 * @ORM\Entity(repositoryClass="COM\PlatformBundle\Entity\ViewRepository")
 */
class View
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;
	
	/**
	 * @ORM\ManyToOne(targetEntity="COM\SchoolBundle\Entity\School", inversedBy="views")
	 * @ORM\JoinColumn(name="school_id", nullable=true)
	 */
	private $school;
	
	/**
	 * @ORM\ManyToOne(targetEntity="COM\BlogBundle\Entity\Post", inversedBy="views")
	 * @ORM\JoinColumn(name="post_id", nullable=true)
	 */
	private $post;
	
	/**
	 * @ORM\ManyToOne(targetEntity="COM\AdvertBundle\Entity\Advert", inversedBy="views")
	 * @ORM\JoinColumn(name="advert_id", nullable=true)
	 */
	private $advert;
	
	/**
	 * @ORM\ManyToOne(targetEntity="COM\UserBundle\Entity\User")
	 * @ORM\JoinColumn(name="user_id", nullable=true)
	 */
	private $user;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="date", type="datetime")
     */
    private $date;

    /**
     * @var string
     *
     * @ORM\Column(name="ip", type="string", length=255)
     */
    private $ip;


    /**
     * Get id
     *
     * @return integer 
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set date
     *
     * @param \DateTime $date
     * @return View
     */
    public function setDate($date)
    {
        $this->date = $date;

        return $this;
    }

    /**
     * Get date
     *
     * @return \DateTime 
     */
    public function getDate()
    {
        return $this->date;
    }

    /**
     * Set ip
     *
     * @param string $ip
     * @return View
     */
    public function setIp($ip)
    {
        $this->ip = $ip;

        return $this;
    }

    /**
     * Get ip
     *
     * @return string 
     */
    public function getIp()
    {
        return $this->ip;
    }

    /**
     * Set school
     *
     * @param \COM\SchoolBundle\Entity\School $school
     * @return View
     */
    public function setSchool(\COM\SchoolBundle\Entity\School $school = null)
    {
        $this->school = $school;

        return $this;
    }

    /**
     * Get school
     *
     * @return \COM\SchoolBundle\Entity\School 
     */
    public function getSchool()
    {
        return $this->school;
    }

    /**
     * Set user
     *
     * @param \COM\UserBundle\Entity\User $user
     * @return View
     */
    public function setUser(\COM\UserBundle\Entity\User $user = null)
    {
        $this->user = $user;

        return $this;
    }

    /**
     * Get user
     *
     * @return \COM\UserBundle\Entity\User 
     */
    public function getUser()
    {
        return $this->user;
    }

    /**
     * Set post
     *
     * @param \COM\BlogBundle\Entity\Post $post
     * @return View
     */
    public function setPost(\COM\BlogBundle\Entity\Post $post = null)
    {
        $this->post = $post;

        return $this;
    }

    /**
     * Get post
     *
     * @return \COM\BlogBundle\Entity\Post 
     */
    public function getPost()
    {
        return $this->post;
    }

    /**
     * Set advert
     *
     * @param \COM\AdvertBundle\Entity\Advert $advert
     * @return View
     */
    public function setAdvert(\COM\AdvertBundle\Entity\Advert $advert = null)
    {
        $this->advert = $advert;

        return $this;
    }

    /**
     * Get advert
     *
     * @return \COM\AdvertBundle\Entity\Advert 
     */
    public function getAdvert()
    {
        return $this->advert;
    }
}
