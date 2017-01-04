<?php

namespace COM\AdvertBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Advert
 *
 * @ORM\Table(name="at_advert")
 * @ORM\Entity(repositoryClass="COM\AdvertBundle\Entity\AdvertRepository")
 */
class Advert
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
	 * @ORM\ManyToOne(targetEntity="COM\UserBundle\Entity\User", inversedBy="adverts")
	 * @ORM\JoinColumn(name="user_id", nullable=false)
	 */
	private $user;

	/**
	 * @ORM\OneToMany(targetEntity="COM\AdvertBundle\Entity\AdvertTranslate", mappedBy="advert")
	 */
	private $advertTranslates;

	/**
	 * @ORM\OneToMany(targetEntity="COM\PlatformBundle\Entity\View", mappedBy="advert")
	 */
	private $views;

	/**
	 * @ORM\ManyToOne(targetEntity="COM\AdvertBundle\Entity\AdvertCategory", inversedBy="adverts")
	 * @ORM\JoinColumn(name="advert_category_id", nullable=true)
	 */
	private $advertCategory;

    /**
     * @var string
     *
     * @ORM\Column(name="slug", type="string", length=255)
     */
    private $slug;

    /**
     * @var string
     *
     * @ORM\Column(name="default_title", type="string", length=255)
     */
    private $defaultTitle;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="date", type="datetime")
     */
    private $date;

    /**
     * @var bigint
     *
     * @ORM\Column(name="view_number", type="bigint")
     */
    private $viewNumber;
	
	private $locale;
	
	private $title;
	
    /**
     * Constructor
     */
    public function __construct()
    {
        $this->advertTranslates = new \Doctrine\Common\Collections\ArrayCollection();
    }


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
     * Set user
     *
     * @param \COM\UserBundle\Entity\User $user
     * @return Advert
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
     * Add advertTranslate
     *
     * @param \COM\AdvertBundle\Entity\AdvertTranslate $advertTranslate
     * @return Advert
     */
    public function addAdvertTranslate(\COM\AdvertBundle\Entity\AdvertTranslate $advertTranslate)
    {
        $this->advertTranslates[] = $advertTranslate;

        return $this;
    }

    /**
     * Remove advertTranslate
     *
     * @param \COM\AdvertBundle\Entity\AdvertTranslate $advertTranslate
     */
    public function removeAdvertTranslate(\COM\AdvertBundle\Entity\AdvertTranslate $advertTranslate)
    {
        $this->advertTranslates->removeElement($advertTranslate);
    }

    /**
     * Get advertTranslates
     *
     * @return \Doctrine\Common\Collections\Collection 
     */
    public function getAdvertTranslates()
    {
        return $this->advertTranslates;
    }

    /**
     * Set defaultTitle
     *
     * @param string $defaultTitle
     * @return Advert
     */
    public function setDefaultTitle($defaultTitle)
    {
        $this->defaultTitle = $defaultTitle;

        return $this;
    }

    /**
     * Get defaultTitle
     *
     * @return string 
     */
    public function getDefaultTitle()
    {
        return $this->defaultTitle;
    }

    /**
     * Set slug
     *
     * @param string $slug
     * @return Advert
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
     * Set date
     *
     * @param \DateTime $date
     * @return Advert
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
     * Set advertCategory
     *
     * @param \COM\AdvertBundle\Entity\AdvertCategory $advertCategory
     * @return Advert
     */
    public function setAdvertCategory(\COM\AdvertBundle\Entity\AdvertCategory $advertCategory = null)
    {
        $this->advertCategory = $advertCategory;

        return $this;
    }

    /**
     * Get advertCategory
     *
     * @return \COM\AdvertBundle\Entity\AdvertCategory 
     */
    public function getAdvertCategory()
    {
        return $this->advertCategory;
    }

    /**
     * Set viewNumber
     *
     * @param integer $viewNumber
     * @return Advert
     */
    public function setViewNumber($viewNumber)
    {
        $this->viewNumber = $viewNumber;

        return $this;
    }

    /**
     * Get viewNumber
     *
     * @return integer 
     */
    public function getViewNumber()
    {
        return $this->viewNumber;
    }

    /**
     * Add view
     *
     * @param \COM\PlatformBundle\Entity\View $view
     * @return Advert
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
