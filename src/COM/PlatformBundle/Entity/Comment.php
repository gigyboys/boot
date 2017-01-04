<?php

namespace COM\PlatformBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Comment
 *
 * @ORM\Table(name="pm_comment")
 * @ORM\Entity(repositoryClass="COM\PlatformBundle\Entity\commentRepository")
 */
class Comment
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
	 * @ORM\ManyToOne(targetEntity="COM\BlogBundle\Entity\Post", inversedBy="comments")
	 * @ORM\JoinColumn(name="post_id", nullable=false)
	 */
	private $post;

    /**
     * @var string
     *
     * @ORM\Column(name="message", type="text")
     */
    private $message;


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
     * Set message
     *
     * @param string $message
     * @return comment
     */
    public function setMessage($message)
    {
        $this->message = $message;

        return $this;
    }

    /**
     * Get message
     *
     * @return string 
     */
    public function getMessage()
    {
        return $this->message;
    }

    /**
     * Set post
     *
     * @param \COM\BlogBundle\Entity\Post $post
     * @return Comment
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
}
