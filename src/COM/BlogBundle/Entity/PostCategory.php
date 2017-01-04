<?php

namespace COM\BlogBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * PostCategory
 *
 * @ORM\Table(name="bg_post_category")
 * @ORM\Entity(repositoryClass="COM\BlogBundle\Entity\PostCategoryRepository")
 */
class PostCategory
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
	 * @ORM\OneToMany(targetEntity="COM\BlogBundle\Entity\Post", mappedBy="postCategory")
	 */
	private $posts;

    /**
     * @var string
     *
     * @ORM\Column(name="default_name", type="string", length=255)
     */
    private $defaultName;

    /**
     * @var string
     *
     * @ORM\Column(name="slug", type="string", length=255)
     */
    private $slug;
	
	private $locale;
	
	private $name;

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
     * @return PostCategory
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
     * Set defaultName
     *
     * @param string $defaultName
     * @return PostCategory
     */
    public function setDefaultName($defaultName)
    {
        $this->defaultName = $defaultName;

        return $this;
    }

    /**
     * Get defaultName
     *
     * @return string 
     */
    public function getDefaultName()
    {
        return $this->defaultName;
    }
    /**
     * Constructor
     */
    public function __construct()
    {
        $this->posts = new \Doctrine\Common\Collections\ArrayCollection();
    }

    /**
     * Add post
     *
     * @param \COM\BlogBundle\Entity\Post $post
     * @return PostCategory
     */
    public function addPost(\COM\BlogBundle\Entity\Post $post)
    {
        $this->posts[] = $post;

        return $this;
    }

    /**
     * Remove post
     *
     * @param \COM\BlogBundle\Entity\Post $post
     */
    public function removePost(\COM\BlogBundle\Entity\Post $post)
    {
        $this->posts->removeElement($post);
    }

    /**
     * Get posts
     *
     * @return \Doctrine\Common\Collections\Collection 
     */
    public function getPosts()
    {
        return $this->posts;
    }
}
