<?php

namespace COM\SchoolBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Category
 *
 * @ORM\Table(name="sl_category")
 * @ORM\Entity(repositoryClass="COM\SchoolBundle\Entity\CategoryRepository")
 */
class Category
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
	 * @ORM\OneToMany(targetEntity="COM\SchoolBundle\Entity\CategoryTranslate", mappedBy="category")
	 */
	private $categoryTranslates;

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
	
	private $locale;
	
	private $name;

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

    /**
     * Add categoryTranslate
     *
     * @param \COM\SchoolBundle\Entity\CategoryTranslate $categoryTranslate
     * @return Category
     */
    public function addCategoryTranslate(\COM\SchoolBundle\Entity\CategoryTranslate $categoryTranslate)
    {
        $this->categoryTranslates[] = $categoryTranslate;

        return $this;
    }

    /**
     * Remove categoryTranslate
     *
     * @param \COM\SchoolBundle\Entity\CategoryTranslate $categoryTranslate
     */
    public function removeCategoryTranslate(\COM\SchoolBundle\Entity\CategoryTranslate $categoryTranslate)
    {
        $this->categoryTranslates->removeElement($categoryTranslate);
    }

    /**
     * Get categoryTranslates
     *
     * @return \Doctrine\Common\Collections\Collection 
     */
    public function getCategoryTranslates()
    {
        return $this->categoryTranslates;
    }
}
