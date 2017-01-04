<?php

namespace COM\SchoolBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Evaluation
 *
 * @ORM\Table(name="sl_evaluation")
 * @ORM\Entity(repositoryClass="COM\SchoolBundle\Entity\EvaluationRepository")
 */
class Evaluation
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
	 * @ORM\ManyToOne(targetEntity="COM\SchoolBundle\Entity\School", inversedBy="evaluations")
	 * @ORM\JoinColumn(name="school_id", nullable=false)
	 */
	private $school;

	/**
	 * @ORM\ManyToOne(targetEntity="COM\UserBundle\Entity\User", inversedBy="evaluations")
	 * @ORM\JoinColumn(name="user_id", nullable=false)
	 */
	private $user;

    /**
     * @var float
     *
     * @ORM\Column(name="mark", type="float")
     */
    private $mark;

    /**
     * @var string
     *
     * @ORM\Column(name="comment", type="text")
     */
    private $comment;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="date", type="datetime")
     */
    private $date;


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
     * Set mark
     *
     * @param float $mark
     * @return Evaluation
     */
    public function setMark($mark)
    {
        $this->mark = $mark;

        return $this;
    }

    /**
     * Get mark
     *
     * @return float 
     */
    public function getMark()
    {
        return $this->mark;
    }

    /**
     * Set comment
     *
     * @param string $comment
     * @return Evaluation
     */
    public function setComment($comment)
    {
        $this->comment = $comment;

        return $this;
    }

    /**
     * Get comment
     *
     * @return string 
     */
    public function getComment()
    {
        return $this->comment;
    }

    /**
     * Set date
     *
     * @param \DateTime $date
     * @return Evaluation
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
     * Set school
     *
     * @param \COM\SchoolBundle\Entity\School $school
     * @return Evaluation
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
     * @return Evaluation
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
}
