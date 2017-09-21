<?php

namespace COM\UserBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert;
/**
 * Avatar
 *
 * @ORM\Table(name="ur_avatar")
 * @ORM\Entity(repositoryClass="COM\UserBundle\Entity\AvatarRepository")
 * @ORM\HasLifecycleCallbacks
 */
class Avatar
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
     * @var string
     *
     * @ORM\Column(name="name", type="string", length=255, nullable=true)
     */
    private $name;

    /**
     * @var string
     *
     * @ORM\Column(name="path", type="string", length=255, nullable=true)
     */
    private $path;

    /**
     * @var string
     *
     * @ORM\Column(name="originalname", type="string", length=255, nullable=true)
     */
    private $originalname;
	
    /**
    * @ORM\ManyToOne(targetEntity="COM\UserBundle\Entity\User")
    * @ORM\JoinColumn(nullable=false)
    */
    private $user;
	
    /**
     * @var boolean
     *
     * @ORM\Column(name="current_avatar", type="boolean")
     */
    private $currentAvatar;

    /**
     * @Assert\File(maxSize="2m", maxSizeMessage = "The file is too large ({{ size }})", mimeTypes = {"image/jpg", "image/jpeg", "image/gif", "image/png"}, mimeTypesMessage = "Please upload a valid Image")
     */
    public $file;
    
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
     * @return Avatar
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
     * Set path
     *
     * @param string $path
     * @return Avatar
     */
    public function setPath($path)
    {
        $this->path = $path;

        return $this;
    }

    /**
     * Get path
     *
     * @return string 
     */
    public function getPath()
    {
        return $this->path;
    }
    
    /**
     * Set originalname
     *
     * @param string $originalname
     * @return Avatar
     */
    public function setOriginalname($originalname)
    {
        $this->originalname = $originalname;

        return $this;
    }

    /**
     * Get originalname
     *
     * @return string 
     */
    public function getOriginalname()
    {
        return $this->originalname;
    }
    
    public function getAbsolutePath()
    {
        return null === $this->path ? null : $this->getUploadRootDir().'/'.$this->path;
    }

    public function getWebPath()
    {
        return null === $this->path ? null : $this->getUploadDir().'/'.$this->path;
    }

    protected function getUploadRootDir()
    {
        // le chemin absolu du répertoire où les documents uploadés doivent être sauvegardés
        return __DIR__.'/../../../../web/'.$this->getUploadDir();
    }

    protected function getUploadDir()
    {
        // on se débarrasse de « __DIR__ » afin de ne pas avoir de problème lorsqu'on affiche
        // le document/image dans la vue.
        return 'uploads/images/user/avatar';
    }
    
    /**
     * @ORM\PrePersist()
     * @ORM\PreUpdate()
     */
    public function preUpload()
    {
        if (null !== $this->file) {
            // generation nom unique
			$t=time();
			
            $this->path = substr(sha1(uniqid(mt_rand(), true)), 0, 15).'_'.$this->user->getId().'_'.$t.'.'.$this->file->guessExtension();
            $this->originalname = $this->file->getClientOriginalName();
            $this->name = $this->file->getClientOriginalName();
        }
    }
    
    /*
    public function upload()
    {
        // la propriété « file » peut être vide si le champ n'est pas requis
        if (null === $this->file) {
            return;
        }

        // utilisez le nom de fichier original ici mais
        // vous devriez « l'assainir » pour au moins éviter
        // quelconques problèmes de sécurité

        // la méthode « move » prend comme arguments le répertoire cible et
        // le nom de fichier cible où le fichier doit être déplacé
        $this->file->move($this->getUploadRootDir(), $this->file->getClientOriginalName());

        // définit la propriété « path » comme étant le nom de fichier où vous
        // avez stocké le fichier
        $this->path = $this->file->getClientOriginalName();

        // « nettoie » la propriété « file » comme vous n'en aurez plus besoin
        $this->file = null;
    }*/
    
    /**
     * @ORM\PostPersist()
     * @ORM\PostUpdate()
     */
    public function upload()
    {
        if (null === $this->file) {
            return;
        }

        // s'il y a une erreur lors du déplacement du fichier, une exception
        // va automatiquement être lancée par la méthode move(). Cela va empêcher
        // proprement l'entité d'être persistée dans la base de données si
        // erreur il y a
        $this->file->move($this->getUploadRootDir(), $this->path);

        unset($this->file);
    }

    /**
     * @ORM\PostRemove()
     */
    public function removeUpload()
    {
		//Suppression du fichier principal
		$file = $this->getAbsolutePath();
        if (file_exists($file)) {
            unlink($file);
        }
		
		//Suppression des fichiers dans le dossier créé par le bundle liip . see app/config/liip.yml
		$dossiers = array(
			"20x20", 
			"22x22", 
			"32x32", 
			"36x36", 
			"40x40", 
			"50x50", 
			"60x60", 
			"80x80", 
			"100x100", 
			"116x116", 
			"140x140", 
			"160x160", 
			"170x170", 
			"187x123", 
			"218x140", 
			"228x152", 
			"248x165", 
			"258x172", 
			"263x175", 
			"300x100", 
			"765x510", 
			"960x240", 
			"960x300", 
			"1200x300" 
		);
		foreach ($dossiers as $dossier) {
			$file = __DIR__.'/../../../../web/media/'.$dossier.'/'.$this->getUploadDir().'/'.$this->path;
			if (file_exists($file)) {
				unlink($file);
			}
		}

    }


    /**
     * Set currentAvatar
     *
     * @param boolean $currentAvatar
     *
     * @return Avatar
     */
    public function setCurrentAvatar($currentAvatar)
    {
        $this->currentAvatar = $currentAvatar;

        return $this;
    }

    /**
     * Get currentAvatar
     *
     * @return boolean
     */
    public function getCurrentAvatar()
    {
        return $this->currentAvatar;
    }

    /**
     * Set user
     *
     * @param \COM\UserBundle\Entity\User $user
     *
     * @return Avatar
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
}
