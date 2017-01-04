<?php

namespace COM\AdvertBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * AdvertTranslate
 *
 * @ORM\Table(name="at_advert_translate")
 * @ORM\Entity(repositoryClass="COM\AdvertBundle\Entity\AdvertTranslateRepository")
 */
class AdvertTranslate
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
	 * @ORM\ManyToOne(targetEntity="COM\AdvertBundle\Entity\Advert", inversedBy="advertTranslates")
	 * @ORM\JoinColumn(name="advert_id", nullable=false)
	 */
	private $advert;

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
     * Set advert
     *
     * @param \COM\AdvertBundle\Entity\Advert $advert
     * @return AdvertTranslate
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

    /**
     * Set locale
     *
     * @param \COM\PlatformBundle\Entity\Locale $locale
     * @return AdvertTranslate
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

    /**
     * Set title
     *
     * @param string $title
     * @return AdvertTranslate
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
     * @return AdvertTranslate
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
}
