<?php

namespace COM\SchoolBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * School
 *
 * @ORM\Table(name="sl_school")
 * @ORM\Entity(repositoryClass="COM\SchoolBundle\Entity\SchoolRepository")
 */
class School
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
	 * @ORM\OneToMany(targetEntity="COM\SchoolBundle\Entity\SchoolTranslate", mappedBy="school")
	 */
	private $schoolTranslates;

	/**
	 * @ORM\OneToMany(targetEntity="COM\SchoolBundle\Entity\Evaluation", mappedBy="school")
	 */
	private $evaluations;

	/**
	 * @ORM\OneToMany(targetEntity="COM\PlatformBundle\Entity\View", mappedBy="school")
	 */
	private $views;

    /**
     * @var string
     *
     * @ORM\Column(name="name", type="string", length=255)
     */
    private $name;

    /**
     * @var string
     *
     * @ORM\Column(name="short_name", type="string", length=255)
     */
    private $shortName;

    /**
     * @var string
     *
     * @ORM\Column(name="slug", type="string", length=255)
     */
    private $slug;
	
	private $locale;

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
     * @return School
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
     * Set name
     *
     * @param string $name
     * @return School
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
     * Set shortName
     *
     * @param string $shortName
     * @return School
     */
    public function setShortName($shortName)
    {
        $this->shortName = $shortName;

        return $this;
    }

    /**
     * Get shortName
     *
     * @return string 
     */
    public function getShortName()
    {
        return $this->shortName;
    }
    /**
     * Constructor
     */
    public function __construct()
    {
        $this->schoolTranslates = new \Doctrine\Common\Collections\ArrayCollection();
    }

    /**
     * Add schoolTranslate
     *
     * @param \COM\SchoolBundle\Entity\SchoolTranslate $schoolTranslate
     * @return School
     */
    public function addSchoolTranslate(\COM\SchoolBundle\Entity\SchoolTranslate $schoolTranslate)
    {
        $this->schoolTranslates[] = $schoolTranslate;

        return $this;
    }

    /**
     * Remove schoolTranslate
     *
     * @param \COM\SchoolBundle\Entity\SchoolTranslate $schoolTranslate
     */
    public function removeSchoolTranslate(\COM\SchoolBundle\Entity\SchoolTranslate $schoolTranslate)
    {
        $this->schoolTranslates->removeElement($schoolTranslate);
    }

    /**
     * Get schoolTranslates
     *
     * @return \Doctrine\Common\Collections\Collection 
     */
    public function getSchoolTranslates()
    {
        return $this->schoolTranslates;
    }

    /**
     * Add evaluation
     *
     * @param \COM\SchoolBundle\Entity\Evaluation $evaluation
     * @return School
     */
    public function addEvaluation(\COM\SchoolBundle\Entity\Evaluation $evaluation)
    {
        $this->evaluations[] = $evaluation;

        return $this;
    }

    /**
     * Remove evaluation
     *
     * @param \COM\SchoolBundle\Entity\Evaluation $evaluation
     */
    public function removeEvaluation(\COM\SchoolBundle\Entity\Evaluation $evaluation)
    {
        $this->evaluations->removeElement($evaluation);
    }

    /**
     * Get evaluations
     *
     * @return \Doctrine\Common\Collections\Collection 
     */
    public function getEvaluations()
    {
        return $this->evaluations;
    }

    /**
     * Add view
     *
     * @param \COM\PlatformBundle\Entity\View $view
     * @return School
     */
    public function addView(\COM\PlatformBundle\Entity\View $view)
    {
        $this->views[] = $view;

        return $this;
    }

    /**
     * Remove view
     *
     * @param \COM\PlatformBundle\Entity\View $view
     */
    public function removeView(\COM\PlatformBundle\Entity\View $view)
    {
        $this->views->removeElement($view);
    }

    /**
     * Get views
     *
     * @return \Doctrine\Common\Collections\Collection 
     */
    public function getViews()
    {
        return $this->views;
    }
}
