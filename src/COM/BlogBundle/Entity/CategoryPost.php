<?php

namespace COM\BlogBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * CategoryPost
 *
 * @ORM\Table(name="bg_category_post")
 * @ORM\Entity(repositoryClass="COM\BlogBundle\Entity\CategoryPostRepository")
 */
class CategoryPost
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
	 * @ORM\ManyToOne(targetEntity="COM\BlogBundle\Entity\Post")
	 * @ORM\JoinColumn(name="post_id", nullable=false)
	 */
	private $post;

	/**
	 * @ORM\ManyToOne(targetEntity="COM\BlogBundle\Entity\Category")
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
     * @param \COM\BlogBundle\Entity\Post $post
     * @return CategoryPost
     */
    public function setPost(\COM\BlogBundle\Entity\Post $post)
    {
        $this->post = $post;

        return $this;
    }

    /**
     * Get post
     *
     * @return \COM\BlogBundle\Entity\Post 
     */
    public function getPost()
    {
        return $this->post;
    }

    /**
     * Set category
     *
     * @param \COM\BlogBundle\Entity\Category $category
     * @return CategoryPost
     */
    public function setCategory(\COM\BlogBundle\Entity\Category $category)
    {
        $this->category = $category;

        return $this;
    }

    /**
     * Get category
     *
     * @return \COM\BlogBundle\Entity\Category 
     */
    public function getCategory()
    {
        return $this->category;
    }
}
