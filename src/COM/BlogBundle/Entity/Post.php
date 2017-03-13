<?php

namespace COM\BlogBundle\Entity;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Doctrine\ORM\Mapping as ORM;

/**
 * Post
 *
 * @ORM\Table(name="bg_post")
 * @ORM\Entity(repositoryClass="COM\BlogBundle\Entity\PostRepository")
 * @ORM\HasLifecycleCallbacks()
 */
class Post extends Controller
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
	 * @ORM\ManyToOne(targetEntity="COM\UserBundle\Entity\User", inversedBy="posts")
	 * @ORM\JoinColumn(name="user_id", nullable=false)
	 */
	private $user;

	/**
	 * @ORM\OneToMany(targetEntity="COM\BlogBundle\Entity\PostTranslate", mappedBy="post")
	 */
	private $postTranslates;

	/**
	 * @ORM\OneToMany(targetEntity="COM\PlatformBundle\Entity\View", mappedBy="post")
	 */
	private $views;

	/**
	 * @ORM\ManyToOne(targetEntity="COM\BlogBundle\Entity\PostCategory", inversedBy="posts")
	 * @ORM\JoinColumn(name="post_category_id", nullable=true)
	 */
	private $postCategory;

	/**
	* @ORM\OneToMany(targetEntity="COM\PlatformBundle\Entity\Comment", mappedBy="post")
	*/
	private $comments;

    /**
     * @var string
     *
     * @ORM\Column(name="default_title", type="string", length=255)
     */
    private $defaultTitle;

    /**
     * @var string
     *
     * @ORM\Column(name="slug", type="string", length=255)
     */
    private $slug;

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
	
    private $description;
	
    private $content;
	
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
     * Set slug
     *
     * @param string $slug
     * @return Post
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
     * @return Post
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
     * Set user
     *
     * @param \COM\UserBundle\Entity\User $user
     * @return Post
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
     * Constructor
     */
    public function __construct()
    {
        $this->postTranslates = new \Doctrine\Common\Collections\ArrayCollection();
    }

    /**
     * Add postTranslate
     *
     * @param \COM\BlogBundle\Entity\PostTranslate $postTranslate
     * @return Post
     */
    public function addPostTranslate(\COM\BlogBundle\Entity\PostTranslate $postTranslate)
    {
        $this->postTranslates[] = $postTranslate;

        return $this;
    }

    /**
     * Remove postTranslate
     *
     * @param \COM\BlogBundle\Entity\PostTranslate $postTranslate
     */
    public function removePostTranslate(\COM\BlogBundle\Entity\PostTranslate $postTranslate)
    {
        $this->postTranslates->removeElement($postTranslate);
    }

    /**
     * Get postTranslates
     *
     * @return \Doctrine\Common\Collections\Collection 
     */
    public function getPostTranslates()
    {
        return $this->postTranslates;
    }

    /**
     * Set defaultTitle
     *
     * @param string $defaultTitle
     * @return Post
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
     * Set viewNumber
     *
     * @param integer $viewNumber
     * @return Post
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
     * Add comment
     *
     * @param \COM\PlatformBundle\Entity\Comment $comment
     * @return Post
     */
    public function addComment(\COM\PlatformBundle\Entity\Comment $comment)
    {
        $this->comments[] = $comment;

        return $this;
    }

    /**
     * Remove comment
     *
     * @param \COM\PlatformBundle\Entity\Comment $comment
     */
    public function removeComment(\COM\PlatformBundle\Entity\Comment $comment)
    {
        $this->comments->removeElement($comment);
    }

    /**
     * Get comments
     *
     * @return \Doctrine\Common\Collections\Collection 
     */
    public function getComments()
    {
        return $this->comments;
    }

    /**
     * Set postCategory
     *
     * @param \COM\BlogBundle\Entity\PostCategory $postCategory
     * @return Post
     */
    public function setPostCategory(\COM\BlogBundle\Entity\PostCategory $postCategory = null)
    {
        $this->postCategory = $postCategory;

        return $this;
    }

    /**
     * Get postCategory
     *
     * @return \COM\BlogBundle\Entity\postCategory 
     */
    public function getPostCategory()
    {
        return $this->postCategory;
    }
	
	//title
    public function setTitle($title)
    {
        $this->title = $title;

        return $this;
    }
    public function getTitle()
    {
        return $this->title;
    }
	

    //description
    
    public function setDescription($description)
    {
        $this->description = $description;

        return $this;
    }

    public function getDescription()
    {
        return $this->description;
    }
	
	//content
    public function setContent($content)
    {
        $this->content = $content;

        return $this;
    }
    public function getContent()
    {
        return $this->content;
    }
	
	//category
    public function setCategory($category)
    {
        $this->category = $category;

        return $this;
    }
    public function getCategory()
    {
        return $this->category;
    }

    /**
     * Add view
     *
     * @param \COM\PlatformBundle\Entity\View $view
     * @return Post
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
