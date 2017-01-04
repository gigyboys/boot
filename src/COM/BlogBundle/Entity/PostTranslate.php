<?php

namespace COM\BlogBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * PostTranslate
 *
 * @ORM\Table(name="bg_post_translate")
 * @ORM\Entity(repositoryClass="COM\BlogBundle\Entity\PostTranslateRepository")
 */
class PostTranslate
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
	 * @ORM\ManyToOne(targetEntity="COM\BlogBundle\Entity\Post", inversedBy="postTranslates")
	 * @ORM\JoinColumn(name="post_id", nullable=false)
	 */
	private $post;

	/**
	* @ORM\ManyToOne(targetEntity="COM\PlatformBundle\Entity\Locale")
	* @ORM\JoinColumn(name="locale_id", nullable=false)
	*/
	private $locale;

    /**
     * @var string
     *
     * @ORM\Column(name="title", type="string", length=255)
     */
    private $title;

    /**
     * @var string
     *
     * @ORM\Column(name="content", type="text")
     */
    private $content;


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
     * Set title
     *
     * @param string $title
     * @return PostTranslate
     */
    public function setTitle($title)
    {
        $this->title = $title;

        return $this;
    }

    /**
     * Get title
     *
     * @return string 
     */
    public function getTitle()
    {
        return $this->title;
    }

    /**
     * Set content
     *
     * @param string $content
     * @return PostTranslate
     */
    public function setContent($content)
    {
        $this->content = $content;

        return $this;
    }

    /**
     * Get content
     *
     * @return string 
     */
    public function getContent()
    {
        return $this->content;
    }

    /**
     * Set post
     *
     * @param \COM\BlogBundle\Entity\Post $post
     * @return PostTranslate
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
     * Set locale
     *
     * @param \COM\PlatformBundle\Entity\Locale $locale
     * @return PostTranslate
     */
    public function setLocale(\COM\PlatformBundle\Entity\Locale $locale)
    {
        $this->locale = $locale;

        return $this;
    }

    /**
     * Get locale
     *
     * @return \COM\PlatformBundle\Entity\Locale 
     */
    public function getLocale()
    {
        return $this->locale;
    }
}
