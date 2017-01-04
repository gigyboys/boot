<?php

namespace COM\AdminBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\RedirectResponse; 

use COM\PlatformBundle\Entity\Locale;
use COM\PlatformBundle\Entity\PostSchool;
use COM\UserBundle\Entity\User;
use COM\BlogBundle\Entity\Post;
use COM\BlogBundle\Entity\PostTranslate;

class BlogController extends Controller
{
    public function indexAction()
    {
		$url = $this->get('router')->generate('com_admin_blog_post');
		return new RedirectResponse($url);
    }
	
    public function postAction()
    {
		$em = $this->getDoctrine()->getManager();
		$postRepository = $em->getRepository('COMBlogBundle:Post');

		$posts = $postRepository->findAll();
		
        return $this->render('COMAdminBundle:blog:post.html.twig', array('posts' => $posts));
    }
	
    public function editPostAction($id)
    {
		$em = $this->getDoctrine()->getManager();
		$postRepository = $em->getRepository('COMBlogBundle:Post');
		$postTranslateRepository = $em->getRepository('COMBlogBundle:PostTranslate');
		$localeRepository = $em->getRepository('COMPlatformBundle:Locale');
		$postSchoolRepository = $em->getRepository('COMPlatformBundle:PostSchool');

		$post = $postRepository->find($id);
		$postSchools = $postSchoolRepository->findBy(array('post' => $post));
		
		$localeFR =  $localeRepository->findOneBy(array('locale' => 'fr'));
		$postFR = $postTranslateRepository->findOneBy(array('post' => $post, 'locale' => $localeFR));
		
		$localeEN =  $localeRepository->findOneBy(array('locale' => 'en'));
		$postEN = $postTranslateRepository->findOneBy(array('post' => $post, 'locale' => $localeEN));
		
		$localeMG =  $localeRepository->findOneBy(array('locale' => 'mg'));
		$postMG = $postTranslateRepository->findOneBy(array('post' => $post, 'locale' => $localeMG));
		
		$localeIT =  $localeRepository->findOneBy(array('locale' => 'it'));
		$postIT = $postTranslateRepository->findOneBy(array('post' => $post, 'locale' => $localeIT));
		
		$localeES =  $localeRepository->findOneBy(array('locale' => 'es'));
		$postES = $postTranslateRepository->findOneBy(array('post' => $post, 'locale' => $localeES));
		
		$localeES =  $localeRepository->findOneBy(array('locale' => 'de'));
		$postDE = $postTranslateRepository->findOneBy(array('post' => $post, 'locale' => $localeES));
		
        return $this->render('COMAdminBundle:blog:edit_post.html.twig', array(
			'post' => $post,
			'postSchools' => $postSchools,
			'postFR' => $postFR,
			'postEN' => $postEN,
			'postMG' => $postMG,
			'postIT' => $postIT,
			'postES' => $postES,
			'postDE' => $postDE,
		));
    }
}
