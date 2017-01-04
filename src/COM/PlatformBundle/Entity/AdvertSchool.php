<?php

namespace COM\PlatformBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * AdvertSchool
 *
 * @ORM\Table(name="pm_advert_school")
 * @ORM\Entity(repositoryClass="COM\PlatformBundle\Entity\AdvertSchoolRepository")
 */
class AdvertSchool
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
	 * @ORM\ManyToOne(targetEntity="COM\AdvertBundle\Entity\Advert")
	 * @ORM\JoinColumn(name="advert_id", nullable=false)
	 */
	private $advert;

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
     * @ORM\Column(name="advert_to_school", type="boolean", nullable=false)
     */
    private $advertToSchool;


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
     * @return AdvertSchool
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
     * @return AdvertSchool
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
     * @return AdvertSchool
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
     * Set advertToSchool
     *
     * @param boolean $advertToSchool
     * @return AdvertSchool
     */
    public function setAdvertToSchool($advertToSchool)
    {
        $this->advertToSchool = $advertToSchool;

        return $this;
    }

    /**
     * Get advertToSchool
     *
     * @return boolean 
     */
    public function getAdvertToSchool()
    {
        return $this->advertToSchool;
    }

    /**
     * Set advert
     *
     * @param \COM\AdvertBundle\Entity\Advert $advert
     * @return AdvertSchool
     */
    public function setAdvert(\COM\AdvertBundle\Entity\Advert $advert)
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

    /**
     * Set school
     *
     * @param \COM\SchoolBundle\Entity\School $school
     * @return AdvertSchool
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
     * Set user
     *
     * @param \COM\UserBundle\Entity\User $user
     * @return AdvertSchool
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
     * @return AdvertSchool
     */
    public function setUserConfirmation(\COM\UserBundle\Entity\User $userConfirmation = null)
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
