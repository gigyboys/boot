<?php

namespace COM\AdminBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Menu
 *
 * @ORM\Table(name="an_menu")
 * @ORM\Entity(repositoryClass="COM\AdminBundle\Entity\MenuRepository")
 */
class Menu
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
     * @ORM\Column(name="name", type="string", length=255)
     */
    private $name;

    /**
     * @var string
     *
     * @ORM\Column(name="route", type="string", length=255)
     */
    private $route;
	
	/**
     * @var boolean
     *
     * @ORM\Column(name="linkable", type="boolean", nullable=false)
     */
    private $linkable;

	/**
	 * @ORM\OneToMany(targetEntity="COM\AdminBundle\Entity\Menu", mappedBy="menuParent")
	 */
	private $menuChilds;

	/**
	 * @ORM\ManyToOne(targetEntity="COM\AdminBundle\Entity\Menu", inversedBy="menuChilds")
	 * @ORM\JoinColumn(name="menu_parent_id", nullable=true)
	 */
	private $menuParent;


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
     * @return Menu
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
     * Set route
     *
     * @param string $route
     * @return Menu
     */
    public function setRoute($route)
    {
        $this->route = $route;

        return $this;
    }

    /**
     * Get route
     *
     * @return string 
     */
    public function getRoute()
    {
        return $this->route;
    }
    /**
     * Constructor
     */
    public function __construct()
    {
        $this->menuChilds = new \Doctrine\Common\Collections\ArrayCollection();
    }

    /**
     * Add menuChild
     *
     * @param \COM\AdminBundle\Entity\Menu $menuChild
     * @return Menu
     */
    public function addMenuChild(\COM\AdminBundle\Entity\Menu $menuChild)
    {
        $this->menuChilds[] = $menuChild;

        return $this;
    }

    /**
     * Remove menuChild
     *
     * @param \COM\AdminBundle\Entity\Menu $menuChild
     */
    public function removeMenuChild(\COM\AdminBundle\Entity\Menu $menuChild)
    {
        $this->menuChilds->removeElement($menuChild);
    }

    /**
     * Get menuChilds
     *
     * @return \Doctrine\Common\Collections\Collection 
     */
    public function getMenuChilds()
    {
        return $this->menuChilds;
    }

    /**
     * Set menuParent
     *
     * @param \COM\AdminBundle\Entity\Menu $menuParent
     * @return Menu
     */
    public function setMenuParent(\COM\AdminBundle\Entity\Menu $menuParent = null)
    {
        $this->menuParent = $menuParent;

        return $this;
    }

    /**
     * Get menuParent
     *
     * @return \COM\AdminBundle\Entity\Menu 
     */
    public function getMenuParent()
    {
        return $this->menuParent;
    }

    /**
     * Set linkable
     *
     * @param boolean $linkable
     * @return Menu
     */
    public function setLinkable($linkable)
    {
        $this->linkable = $linkable;

        return $this;
    }

    /**
     * Get linkable
     *
     * @return boolean 
     */
    public function getLinkable()
    {
        return $this->linkable;
    }
}
