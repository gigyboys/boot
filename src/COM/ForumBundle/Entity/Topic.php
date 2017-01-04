<?php

namespace COM\ForumBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Topic
 *
 * @ORM\Table(name="fm_topic")
 * @ORM\Entity(repositoryClass="COM\ForumBundle\Entity\TopicRepository")
 */
class Topic
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
	 * @ORM\OneToMany(targetEntity="COM\ForumBundle\Entity\TopicTranslate", mappedBy="topic")
	 */
	private $topicTranslates;

    /**
     * @var string
     *
     * @ORM\Column(name="slug", type="string", length=255)
     */
    private $slug;

    /**
     * @var string
     *
     * @ORM\Column(name="default_name", type="string", length=255)
     */
    private $defaultName;


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
     * @return Topic
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
     * @return Topic
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
        $this->topicTranslates = new \Doctrine\Common\Collections\ArrayCollection();
    }

    /**
     * Add topicTranslate
     *
     * @param \COM\ForumBundle\Entity\TopicTranslate $topicTranslate
     * @return Topic
     */
    public function addTopicTranslate(\COM\ForumBundle\Entity\TopicTranslate $topicTranslate)
    {
        $this->topicTranslates[] = $topicTranslate;

        return $this;
    }

    /**
     * Remove topicTranslate
     *
     * @param \COM\ForumBundle\Entity\TopicTranslate $topicTranslate
     */
    public function removeTopicTranslate(\COM\ForumBundle\Entity\TopicTranslate $topicTranslate)
    {
        $this->topicTranslates->removeElement($topicTranslate);
    }

    /**
     * Get topicTranslates
     *
     * @return \Doctrine\Common\Collections\Collection 
     */
    public function getTopicTranslates()
    {
        return $this->topicTranslates;
    }
}
