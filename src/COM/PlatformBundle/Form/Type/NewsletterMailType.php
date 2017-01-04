<?php
namespace COM\PlatformBundle\Form\Type;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class NewsletterMailType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder->add('email', 'email')
				->add('isActive', 'choice', array(
					'choices'   => array(1 => 'abonnement', 0 => 'desabonnement'),
					'multiple' => false,
					'expanded' => true,
					'required' => true,
					'data' => 1
				))
                ->add('Envoyer', 'submit')
        ;
    }
    
    /**
     * @param OptionsResolver $resolver
     */
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'COM\PlatformBundle\Entity\NewsletterMail',
            'csrf_protection' => false,
        ));
		//$this->configureOptions($resolver);
    }

    /**
     * @return string
     */
    public function getName()
    {
        return '';
    }
}

