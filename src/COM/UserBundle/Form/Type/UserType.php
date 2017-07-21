<?php
namespace COM\UserBundle\Form\Type;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\RepeatedType;

class UserType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder->add('name', 'text')
                //->add('username', 'text')
                ->add('email', 'email')
                //->add('password', 'text')
                ->add('password', 'text')
				/*
				->add('password', RepeatedType::class, array(
					'first_options'  => array('label' => 'Password'),
					'second_options' => array('label' => 'Repeat Password'),
				))*/
                ->add('sex', 'text')
                ->add('register', 'submit')
        ;
    }
    
    /**
     * @param OptionsResolver $resolver
     */
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'COM\UserBundle\Entity\User',
            'csrf_protection' => false,
        ));
    }

    /**
     * @return string
     */
    public function getName()
    {
        return '';
    }
}

