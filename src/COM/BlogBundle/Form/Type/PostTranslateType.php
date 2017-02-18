<?php
namespace COM\BlogBundle\Form\Type;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\RepeatedType;

class PostTranslateType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder->add('title', 'text')
                ->add('description', 'text')
                ->add('content', 'text')
        ;
    }
    
    /**
     * @param OptionsResolver $resolver
     */
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'COM\BlogBundle\Entity\PostTranslate',
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

