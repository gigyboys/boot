<?php
namespace COM\PlatformBundle\Form\Type;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class ContactType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder->add('name', 'text')
                ->add('email', 'email')
                ->add('content', 'textarea')
                ->add('Envoyer', 'submit')
        ;
    }
    
    /**
     * @param OptionsResolver $resolver
     */
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'COM\PlatformBundle\Entity\Contact',
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

