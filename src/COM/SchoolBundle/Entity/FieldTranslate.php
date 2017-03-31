<?php

namespace COM\SchoolBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * FieldTranslate
 *
 * @ORM\Table(name="sl_field_translate")
 * @ORM\Entity(repositoryClass="COM\SchoolBundle\Entity\FieldTranslateRepository")
 */
class FieldTranslate
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
	 * @ORM\ManyToOne(targetEntity="COM\SchoolBundle\Entity\Field")
	 * @ORM\JoinColumn(name="field_id", nullable=false)
	 */
	private $field;

	/**
	* @ORM\ManyToOne(targetEntity="COM\PlatformBundle\Entity\Locale")
	* @ORM\JoinColumn(name="locale_id", nullable=false)
	*/
	private $locale;

    /**
     * @var string
     *
     * @ORM\Column(name="name", type="string", length=255)
     */
    private $name;

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
     * Set name
     *
     * @param string $name
     * @return BranchTranslate
     */
    public function setName($name)
    {
        $this->name = $name;

        return $this;
    }

    /**
     * Get name
     *
     * @return string 
     */
    public function getName()
    {
        return $this->name;
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
     * Set field
     *
     * @param \COM\SchoolBundle\Entity\Field $field
     * @return FieldTranslate
     */
    public function setField(\COM\SchoolBundle\Entity\Field $field)
    {
        $this->field = $field;

        return $this;
    }

    /**
     * Get field
     *
     * @return \COM\SchoolBundle\Entity\Field 
     */
    public function getField()
    {
        return $this->field;
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
