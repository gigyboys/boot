<?php

namespace COM\SchoolBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Category
 *
 * @ORM\Table(name="sl_type")
 * @ORM\Entity(repositoryClass="COM\SchoolBundle\Entity\TypeRepository")
 */
class Type
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
     * @var string
     *
     * @ORM\Column(name="default_name", type="string", length=255)
     */
    private $defaultName;

    /**
     * @var string
     *
     * @ORM\Column(name="slug", type="string", length=255, unique=true)
     */
    private $slug;


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
     * Set slug
     *
     * @param string $slug
     * @return Category
     */
    public function setSlug($slug)
    {
        $this->slug = $slug;

        return $this;
    }

    /**
     * Get slug
     *
     * @return string 
     */
    public function getSlug()
    {
        return $this->slug;
    }

    /**
     * Set defaultName
     *
     * @param string $defaultName
     * @return Category
     */
    public function setDefaultName($defaultName)
    {
        $this->defaultName = $defaultName;

        return $this;
    }

    /**
     * Get defaultName
     *
     * @return string 
     */
    public function getDefaultName()
    {
        return $this->defaultName;
    }
    /**
     * Constructor
     */
    public function __construct()
    {

    }
}
