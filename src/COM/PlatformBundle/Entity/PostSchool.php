<?php

namespace COM\PlatformBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * PostSchool
 *
 * @ORM\Table(name="pm_post_school")
 * @ORM\Entity(repositoryClass="COM\PlatformBundle\Entity\PostSchoolRepository")
 */
class PostSchool
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
	 * @ORM\ManyToOne(targetEntity="COM\BlogBundle\Entity\Post")
	 * @ORM\JoinColumn(name="post_id", nullable=false)
	 */
	private $post;

	/**
	 * @ORM\ManyToOne(targetEntity="COM\SchoolBundle\Entity\School")
	 * @ORM\JoinColumn(name="school_id", nullable=false)
	 */
	private $school;

	/**
	 * @ORM\ManyToOne(targetEntity="COM\UserBundle\Entity\User")
	 * @ORM\JoinColumn(name="user_id", nullable=false)
	 */
	private $user;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="date", type="datetime", nullable=false)
     */
    private $date;

	/**
	 * @ORM\ManyToOne(targetEntity="COM\UserBundle\Entity\User")
	 * @ORM\JoinColumn(name="user_confirmation_id", nullable=true)
	 */
	private $userConfirmation;

    /**
     * @var boolean
     *
     * @ORM\Column(name="confirmation", type="boolean", nullable=false)
     */
    private $confirmation;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="date_confirmation", type="datetime", nullable=true)
     */
    private $dateConfirmation;

    /**
     * @var boolean
     *
     * @ORM\Column(name="post_to_school", type="boolean", nullable=false)
     */
    private $postToSchool;


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
     * Set post
     *
     * @param \COM\BlogBundle\Entity\Post $post
     * @return PostSchool
     */
    public function setPost(\COM\BlogBundle\Entity\Post $post)
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
     * Set school
     *
     * @param \COM\SchoolBundle\Entity\School $school
     * @return PostSchool
     */
    public function setSchool(\COM\SchoolBundle\Entity\School $school)
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
     * Set date
     *
     * @param \DateTime $date
     * @return PostSchool
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
     * Set confirmation
     *
     * @param boolean $confirmation
     * @return PostSchool
     */
    public function setConfirmation($confirmation)
    {
        $this->confirmation = $confirmation;

        return $this;
    }

    /**
     * Get confirmation
     *
     * @return boolean 
     */
    public function getConfirmation()
    {
        return $this->confirmation;
    }

    /**
     * Set dateConfirmation
     *
     * @param \DateTime $dateConfirmation
     * @return PostSchool
     */
    public function setDateConfirmation($dateConfirmation)
    {
        $this->dateConfirmation = $dateConfirmation;

        return $this;
    }

    /**
     * Get dateConfirmation
     *
     * @return \DateTime 
     */
    public function getDateConfirmation()
    {
        return $this->dateConfirmation;
    }

    /**
     * Set postToSchool
     *
     * @param boolean $postToSchool
     * @return PostSchool
     */
    public function setPostToSchool($postToSchool)
    {
        $this->postToSchool = $postToSchool;

        return $this;
    }

    /**
     * Get postToSchool
     *
     * @return boolean 
     */
    public function getPostToSchool()
    {
        return $this->postToSchool;
    }

    /**
     * Set user
     *
     * @param \COM\UserBundle\Entity\User $user
     * @return PostSchool
     */
    public function setUser(\COM\UserBundle\Entity\User $user)
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
     * Set userConfirmation
     *
     * @param \COM\UserBundle\Entity\User $userConfirmation
     * @return PostSchool
     */
    public function setUserConfirmation(\COM\UserBundle\Entity\User $userConfirmation)
    {
        $this->userConfirmation = $userConfirmation;

        return $this;
    }

    /**
     * Get userConfirmation
     *
     * @return \COM\UserBundle\Entity\User 
     */
    public function getUserConfirmation()
    {
        return $this->userConfirmation;
    }
}
