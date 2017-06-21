<?php

namespace COM\SchoolBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * CategorySchool
 *
 * @ORM\Table(name="sl_category_school")
 * @ORM\Entity(repositoryClass="COM\SchoolBundle\Entity\CategorySchoolRepository")
 */
class CategorySchool
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
	 * @ORM\ManyToOne(targetEntity="COM\SchoolBundle\Entity\Category")
	 * @ORM\JoinColumn(name="category_id", nullable=false)
	 */
	private $category;
	
    /**
     * @var boolean
     *
     * @ORM\Column(name="current", type="boolean")
     */
    private $current;


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
     * @return CategorySchool
     */
    public function setSchool(\COM\SchoolBundle\Entity\School $school)
    {
        $this->school = $school;

        return $this;
    }

    /**
     * Get school
     *
     * @return \COM\SchoolBundle\Entity\school 
     */
    public function getSchool()
    {
        return $this->school;
    }

    /**
     * Set category
     *
     * @param \COM\SchoolBundle\Entity\Category $category
     * @return CategorySchool
     */
    public function setCategory(\COM\SchoolBundle\Entity\Category $category)
    {
        $this->category = $category;

        return $this;
    }

    /**
     * Get category
     *
     * @return \COM\SchoolBundle\Entity\Category 
     */
    public function getCategory()
    {
        return $this->category;
    }


    /**
     * Set current
     *
     * @param boolean $current
     *
     * @return CategorySchool
     */
    public function setCurrent($current)
    {
        $this->current = $current;

        return $this;
    }

    /**
     * Get current
     *
     * @return boolean
     */
    public function getCurrent()
    {
        return $this->current;
    }
}
