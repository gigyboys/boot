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
	private $post;

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
     * Set post
     *
     * @param \COM\AdvertBundle\Entity\Advert $post
     * @return CategoryAdvert
     */
    public function setPost(\COM\AdvertBundle\Entity\Advert $post)
    {
        $this->post = $post;

        return $this;
    }

    /**
     * Get post
     *
     * @return \COM\AdvertBundle\Entity\Advert 
     */
    public function getPost()
    {
        return $this->post;
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
}
