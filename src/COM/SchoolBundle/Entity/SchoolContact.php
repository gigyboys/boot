<?php

namespace COM\SchoolBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * SchoolContact
 *
 * @ORM\Table(name="sl_school_contact")
 * @ORM\Entity(repositoryClass="COM\SchoolBundle\Entity\SchoolContactRepository")
 */
class SchoolContact
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
	 * @ORM\ManyToOne(targetEntity="COM\SchoolBundle\Entity\School")
	 * @ORM\JoinColumn(name="school_id", nullable=false)
	 */
	private $school;

    /**
     * @var string
     *
     * @ORM\Column(name="Address", type="text")
     */
    private $address;

    /**
     * @var string
     *
     * @ORM\Column(name="email", type="string", length=255)
     */
    private $email;

    /**
     * @var string
     *
     * @ORM\Column(name="phone", type="string", length=255)
     */
    private $phone;

    /**
     * @var string
     *
     * @ORM\Column(name="website", type="string", length=255)
     */
    private $website;

    /**
     * @var string
     *
     * @ORM\Column(name="longitude", type="string", length=255)
     */
    private $longitude;

    /**
     * @var string
     *
     * @ORM\Column(name="latitude", type="string", length=255)
     */
    private $latitude;

    /**
     * @var boolean
     *
     * @ORM\Column(name="showmap", type="boolean")
     */
    private $showmap;
	
    /**
     * @var boolean
     *
     * @ORM\Column(name="published", type="boolean")
     */
    private $published;


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
     * Set school
     *
     * @param \COM\SchoolBundle\Entity\School $school
     * @return SchoolAdmin
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
     * Set address
     *
     * @param string $address
     * @return SchoolContact
     */
    public function setAddress($address)
    {
        $this->address = $address;

        return $this;
    }

    /**
     * Get address
     *
     * @return string 
     */
    public function getAddress()
    {
        return $this->address;
    }

    /**
     * Set email
     *
     * @param string $email
     * @return User
     */
    public function setEmail($email)
    {
        $this->email = $email;

        return $this;
    }

    /**
     * Get email
     *
     * @return string 
     */
    public function getEmail()
    {
        return $this->email;
    }

    /**
     * Set phone
     *
     * @param string $phone
     * @return SchoolContact
     */
    public function setPhone($phone)
    {
        $this->phone = $phone;

        return $this;
    }

    /**
     * Get phone
     *
     * @return string 
     */
    public function getPhone()
    {
        return $this->phone;
    }

    /**
     * Set website
     *
     * @param string $website
     * @return SchoolContact
     */
    public function setWebsite($website)
    {
        $this->website = $website;

        return $this;
    }

    /**
     * Get website
     *
     * @return string 
     */
    public function getWebsite()
    {
        return $this->website;
    }

    /**
     * Set longitude
     *
     * @param string $longitude
     * @return SchoolContact
     */
    public function setLongitude($longitude)
    {
        $this->longitude = $longitude;

        return $this;
    }

    /**
     * Get longitude
     *
     * @return string 
     */
    public function getLongitude()
    {
        return $this->longitude;
    }

    /**
     * Set latitude
     *
     * @param string $latitude
     * @return SchoolContact
     */
    public function setLatitude($latitude)
    {
        $this->latitude = $latitude;

        return $this;
    }

    /**
     * Get latitude
     *
     * @return string 
     */
    public function getLatitude()
    {
        return $this->latitude;
    }

    /**
     * Set showmap
     *
     * @param boolean $showmap
     * @return SchoolContact
     */
    public function setShowmap($showmap)
    {
        $this->showmap = $showmap;

        return $this;
    }

    /**
     * Get showmap
     *
     * @return boolean 
     */
    public function getShowmap()
    {
        return $this->showmap;
    }


    /**
     * Set published
     *
     * @param boolean $published
     *
     * @return SchoolContact
     */
    public function setPublished($published)
    {
        $this->published = $published;

        return $this;
    }

    /**
     * Get published
     *
     * @return boolean
     */
    public function getPublished()
    {
        return $this->published;
    }
}
