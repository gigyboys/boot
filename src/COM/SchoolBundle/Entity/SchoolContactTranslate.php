<?php

namespace COM\SchoolBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * SchoolContactTranslate
 *
 * @ORM\Table(name="sl_school_contact_translate")
 * @ORM\Entity(repositoryClass="COM\SchoolBundle\Entity\SchoolContactTranslateRepository")
 */
class SchoolContactTranslate
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
	 * @ORM\ManyToOne(targetEntity="COM\SchoolBundle\Entity\SchoolContact")
	 * @ORM\JoinColumn(name="school_contact_id", nullable=false)
	 */
	private $schoolContact;

	/**
	* @ORM\ManyToOne(targetEntity="COM\PlatformBundle\Entity\Locale")
	* @ORM\JoinColumn(name="locale_id", nullable=false)
	*/
	private $locale;

    /**
     * @var string
     *
     * @ORM\Column(name="description", type="text")
     */
    private $description;


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
     * Set description
     *
     * @param string $description
     * @return BranchTranslate
     */
    public function setDescription($description)
    {
        $this->description = $description;

        return $this;
    }

    /**
     * Get description
     *
     * @return string 
     */
    public function getDescription()
    {
        return $this->description;
    }

    /**
     * Set schoolContact
     *
     * @param \COM\SchoolBundle\Entity\SchoolContact $schoolContact
     * @return FieldTranslate
     */
    public function setSchoolContact(\COM\SchoolBundle\Entity\SchoolContact $schoolContact)
    {
        $this->schoolContact = $schoolContact;

        return $this;
    }

    /**
     * Get schoolContact
     *
     * @return \COM\SchoolBundle\Entity\SchoolContact 
     */
    public function getSchoolContact()
    {
        return $this->schoolContact;
    }

    /**
     * Set locale
     *
     * @param \COM\PlatformBundle\Entity\Locale $locale
     * @return FieldTranslate
     */
    public function setLocale(\COM\PlatformBundle\Entity\Locale $locale)
    {
        $this->locale = $locale;

        return $this;
    }

    /**
     * Get locale
     *
     * @return \COM\PlatformBundle\Entity\Locale 
     */
    public function getLocale()
    {
        return $this->locale;
    }
}
