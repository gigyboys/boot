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
	 * @ORM\ManyToOne(targetEntity="COM\BlogBundle\Entity\PostCategory")
	 * @ORM\JoinColumn(name="post_category_id", nullable=false)
	 */
	private $postCategory;


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
     * Set postCategory
     *
     * @param \COM\BlogBundle\Entity\PostCategory $postCategory
     * @return CategoryPost
     */
    public function setPostCategory(\COM\BlogBundle\Entity\PostCategory $postCategory)
    {
        $this->postCategory = $postCategory;

        return $this;
    }

    /**
     * Get postCategory
     *
     * @return \COM\BlogBundle\Entity\PostCategory 
     */
    public function getPostCategory()
    {
        return $this->postCategory;
    }
}
