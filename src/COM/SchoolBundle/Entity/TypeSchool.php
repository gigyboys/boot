<?php

namespace COM\SchoolBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TypeSchool
 *
 * @ORM\Table(name="sl_type_school")
 * @ORM\Entity(repositoryClass="COM\SchoolBundle\Entity\TypeSchoolRepository")
 */
class TypeSchool
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
	 * @ORM\ManyToOne(targetEntity="COM\SchoolBundle\Entity\Type")
	 * @ORM\JoinColumn(name="type_id", nullable=false)
	 */
	private $type;


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
     * @return TypeSchool
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
     * Set type
     *
     * @param \COM\SchoolBundle\Entity\Type $type
     * @return TypeSchool
     */
    public function setType(\COM\SchoolBundle\Entity\Type $type)
    {
        $this->type = $type;

        return $this;
    }

    /**
     * Get type
     *
     * @return \COM\SchoolBundle\Entity\Type 
     */
    public function getType()
    {
        return $this->type;
    }


}
