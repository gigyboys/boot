<?php

namespace COM\AdvertBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * CategoryAdvert
 *
 * @ORM\Table(name="at_category_advert")
 * @ORM\Entity(repositoryClass="COM\AdvertBundle\Entity\CategoryAdvertRepository")
 */
class CategoryAdvert
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
	 * @ORM\ManyToOne(targetEntity="COM\AdvertBundle\Entity\Advert")
	 * @ORM\JoinColumn(name="advert_id", nullable=false)
	 */
	private $advert;

	/**
	 * @ORM\ManyToOne(targetEntity="COM\AdvertBundle\Entity\Category")
	 * @ORM\JoinColumn(name="category_id", nullable=false)
	 */
	private $category;


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
     * Set category
     *
     * @param \COM\AdvertBundle\Entity\Category $category
     * @return CategoryAdvert
     */
    public function setCategory(\COM\AdvertBundle\Entity\Category $category)
    {
        $this->category = $category;

        return $this;
    }

    /**
     * Get category
     *
     * @return \COM\AdvertBundle\Entity\Category 
     */
    public function getCategory()
    {
        return $this->category;
    }

    /**
     * Set advert
     *
     * @param \COM\AdvertBundle\Entity\Advert $advert
     * @return CategoryAdvert
     */
    public function setAdvert(\COM\AdvertBundle\Entity\Advert $advert)
    {
        $this->advert = $advert;

        return $this;
    }

    /**
     * Get advert
     *
     * @return \COM\AdvertBundle\Entity\Advert 
     */
    public function getAdvert()
    {
        return $this->advert;
    }
}
