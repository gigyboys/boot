<?php

namespace COM\ForumBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TopicTranslate
 *
 * @ORM\Table(name="fm_topic_translate")
 * @ORM\Entity(repositoryClass="COM\ForumBundle\Entity\TopicTranslateRepository")
 */
class TopicTranslate
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
	 * @ORM\ManyToOne(targetEntity="COM\ForumBundle\Entity\Topic", inversedBy="topicTranslates")
	 * @ORM\JoinColumn(name="topic_id", nullable=false)
	 */
	private $topic;

    /**
     * @var string
     *
     * @ORM\Column(name="name", type="string", length=255)
     */
    private $name;

    /**
     * @var string
     *
     * @ORM\Column(name="description", type="text")
     */
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
     * Set name
     *
     * @param string $name
     * @return TopicTranslate
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
     * Set description
     *
     * @param string $description
     * @return TopicTranslate
     */
    public function setDescription($description)
    {
        $this->description = $description;

        return $this;
    }

    /**
     * Get description
     *
     * @return string 
     */
    public function getDescription()
    {
        return $this->description;
    }

    /**
     * Set topic
     *
     * @param \COM\ForumBundle\Entity\Topic $topic
     * @return TopicTranslate
     */
    public function setTopic(\COM\ForumBundle\Entity\Topic $topic)
    {
        $this->topic = $topic;

        return $this;
    }

    /**
     * Get topic
     *
     * @return \COM\ForumBundle\Entity\Topic 
     */
    public function getTopic()
    {
        return $this->topic;
    }
}
