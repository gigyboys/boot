<?php

namespace COM\PlatformBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\RedirectResponse; 

use COM\PlatformBundle\Entity\Locale;
use COM\UserBundle\Entity\User;
use COM\SchoolBundle\Entity\School;
use COM\SchoolBundle\Entity\SchoolTranslate;
use COM\SchoolBundle\Entity\SchoolAdmin;
use COM\BlogBundle\Entity\Post;
use COM\BlogBundle\Entity\PostTranslate;
use COM\AdvertBundle\Entity\Category AS AdvertCategory;
use COM\AdvertBundle\Entity\Advert;
use COM\AdvertBundle\Entity\AdvertTranslate;
use COM\PlatformBundle\Entity\PostSchool;
use COM\PlatformBundle\Entity\AdvertSchool;
use COM\ForumBundle\Entity\Topic;
use COM\PlatformBundle\Entity\Parameter;

class InitController extends Controller
{
    public function initAction()
    {
		$em = $this->getDoctrine()->getManager();
		$parameterRepository = $em->getRepository('COMPlatformBundle:Parameter');
		
		//test si c'est déjà populé
		$populate = $parameterRepository->findOneBy(array('parameter' => 'populate'));
		if($populate && $populate->getValue()){
			$url = $this->get('router')->generate('com_platform_home');
			return new RedirectResponse($url);
		}
		
		/** traitement locales **/
		$localeFR = new Locale();
		$localeFR->setLocale('fr');
		$localeFR->setLabel('french');
		$em->persist($localeFR);
		
		$localeEN = new Locale();
		$localeEN->setLocale('en');
		$localeEN->setLabel('english');
		$em->persist($localeEN);
		
		$localeMG = new Locale();
		$localeMG->setLocale('mg');
		$localeMG->setLabel('malagasy');
		$em->persist($localeMG);
		
		$localeIT = new Locale();
		$localeIT->setLocale('it');
		$localeIT->setLabel('italian');
		$em->persist($localeIT);
		
		$localeES = new Locale();
		$localeES->setLocale('es');
		$localeES->setLabel('spain');
		$em->persist($localeES);
		
		$localeDE = new Locale();
		$localeDE->setLocale('de');
		$localeDE->setLabel('deutch');
		$em->persist($localeDE);
		/** traitement locales **/
		
		/** traitement users **/
		$factory = $this->get('security.encoder_factory');
		$user = new User();
		$encoder = $factory->getEncoder($user);
		$salt = md5(time());
		
		$newsletterService = $this->container->get('com_platform.newsletter_service');
		
		$roles = array("ROLE_ADMIN");
		
		$user1 = new User();
		$user1->setUsername('user1');
		$user1->setLocale($localeFR);
		$user1->setEmail('user1@boot.com');
		$user1->setPassword($encoder->encodePassword('user1', $salt));
		$user1->setSalt($salt);
		$user1->setName('Randrianilaina Modar');
		$user1->setSex(1);
		$user1->setRoles($roles);
		$newsletterService->addEmail($user1->getEmail(), true);
		$em->persist($user1);
		
		$user2 = new User();
		$user2->setUsername('user2');
		$user2->setLocale($localeEN);
		$user2->setEmail('user2@boot.com');
		$user2->setPassword($encoder->encodePassword('user2', $salt));
		$user2->setSalt($salt);
		$user2->setName('Andriamiarantsoa Fortunat');
		$user2->setSex(1);
		$user2->setRoles($roles);
		$newsletterService->addEmail($user2->getEmail(), true);
		$em->persist($user2);
		
		$user3 = new User();
		$user3->setUsername('user3');
		$user3->setLocale($localeFR);
		$user3->setEmail('user3@boot.com');
		$user3->setPassword($encoder->encodePassword('user3', $salt));
		$user3->setSalt($salt);
		$user3->setName('Rapariarison Haja');
		$user3->setSex(1);
		$user3->setRoles($roles);
		$newsletterService->addEmail($user3->getEmail(), true);
		$em->persist($user3);
		
		$user4 = new User();
		$user4->setUsername('user4');
		$user4->setLocale($localeFR);
		$user4->setEmail('user4@boot.com');
		$user4->setPassword($encoder->encodePassword('user4', $salt));
		$user4->setSalt($salt);
		$user4->setName('Misandratra Rakotondrabe Séverin');
		$user4->setSex(1);
		//$user4->setRoles($roles);
		$newsletterService->addEmail($user4->getEmail(), true);
		$em->persist($user4);
		/** fin traitement users **/
		
		
		/** traitement school **/
		
		$school1 = new School();
		$school1->setName('Institut de Commerce et Management d\'Antananarivo');
		$school1->setShortName('ICMA');
		$school1->setSlug('institut-de-commerce-et-management-d-antananarivo');
		$school1->setPublished(true);
		$em->persist($school1);
		
		$school2 = new School();
		$school2->setName('Ecole Supérieure de Technologie');
		$school2->setShortName('EST');
		$school2->setSlug('ecole-superieure-de-technologie');
		$school2->setPublished(true);
		$em->persist($school2);
		/** fin traitement school  **/
		
		
		/** traitement schooltranslate **/
		$schoolTranslate1 = new SchoolTranslate();
		$schoolTranslate1->setSchool($school1);
		$schoolTranslate1->setLocale($localeFR);
		$schoolTranslate1->setName("fr. name . Institut de Commerce et Management d\'Antananarivo");
		$schoolTranslate1->setShortDescription("fr. courte description . Institut de Commerce et Management d\'Antananarivo");
		$schoolTranslate1->setDescription("<p>fr. description .</p> <p>desc Institut de Commerce et Management d'Antananarivo</p>");
		$em->persist($schoolTranslate1);
		
		$schoolTranslate2 = new SchoolTranslate();
		$schoolTranslate2->setSchool($school1);
		$schoolTranslate2->setLocale($localeEN);
		$schoolTranslate2->setName("en. name . Institut de Commerce et Management d\'Antananarivo");
		$schoolTranslate2->setShortDescription("en. courte description . Institut de Commerce et Management d\'Antananarivo");
		$schoolTranslate2->setDescription("<p>en. description .</p> <p>desc Institut de Commerce et Management d'Antananarivo</p>");
		$em->persist($schoolTranslate2);
		
		$schoolTranslate3 = new SchoolTranslate();
		$schoolTranslate3->setSchool($school1);
		$schoolTranslate3->setLocale($localeMG);
		$schoolTranslate3->setName("mg. name . Institut de Commerce et Management d\'Antananarivo");
		$schoolTranslate3->setShortDescription("mg. courte description . Institut de Commerce et Management d\'Antananarivo");
		$schoolTranslate3->setDescription("<p>mg. description .</p> <p>desc Institut de Commerce et Management d'Antananarivo</p>");
		$em->persist($schoolTranslate3);
		
		$schoolTranslate4 = new SchoolTranslate();
		$schoolTranslate4->setSchool($school1);
		$schoolTranslate4->setLocale($localeIT);
		$schoolTranslate4->setName("it. name . Institut de Commerce et Management d\'Antananarivo");
		$schoolTranslate4->setShortDescription("it. courte description . Institut de Commerce et Management d\'Antananarivo");
		$schoolTranslate4->setDescription("<p>it. description .</p> <p>desc Institut de Commerce et Management d'Antananarivo</p>");
		$em->persist($schoolTranslate4);
		
		$schoolTranslate5 = new SchoolTranslate();
		$schoolTranslate5->setSchool($school1);
		$schoolTranslate5->setLocale($localeES);
		$schoolTranslate5->setName("es. name . Institut de Commerce et Management d\'Antananarivo");
		$schoolTranslate5->setShortDescription("es. courte description . Institut de Commerce et Management d\'Antananarivo");
		$schoolTranslate5->setDescription("<p>es. description .</p> <p>desc Institut de Commerce et Management d'Antananarivo</p>");
		$em->persist($schoolTranslate5);
		
		$schoolTranslate6 = new SchoolTranslate();
		$schoolTranslate6->setSchool($school1);
		$schoolTranslate6->setLocale($localeDE);
		$schoolTranslate6->setName("de. name . Institut de Commerce et Management d\'Antananarivo");
		$schoolTranslate6->setShortDescription("de. courte description . Institut de Commerce et Management d\'Antananarivo");
		$schoolTranslate6->setDescription("<p>de. description .</p> <p>desc Institut de Commerce et Management d'Antananarivo</p>");
		$em->persist($schoolTranslate6);
		
		$schoolTranslate7 = new SchoolTranslate();
		$schoolTranslate7->setSchool($school2);
		$schoolTranslate7->setLocale($localeFR);
		$schoolTranslate7->setName("fr. name . Ecole Supérieure de Technologie");
		$schoolTranslate7->setShortDescription("fr. courte description . Ecole Supérieure de Technologie");
		$schoolTranslate7->setDescription("<p>fr. description .</p> <p>desc Ecole Supérieure de Technologie</p>");
		$em->persist($schoolTranslate7);
		
		$schoolTranslate8 = new SchoolTranslate();
		$schoolTranslate8->setSchool($school2);
		$schoolTranslate8->setLocale($localeEN);
		$schoolTranslate8->setName("en. name . Ecole Supérieure de Technologie");
		$schoolTranslate8->setShortDescription("en. courte description . Ecole Supérieure de Technologie");
		$schoolTranslate8->setDescription("<p>en. description .</p> <p>desc Ecole Supérieure de Technologie</p>");
		$em->persist($schoolTranslate8);
		
		$schoolTranslate9 = new SchoolTranslate();
		$schoolTranslate9->setSchool($school2);
		$schoolTranslate9->setLocale($localeMG);
		$schoolTranslate9->setName("mg. name . Ecole Supérieure de Technologie");
		$schoolTranslate9->setShortDescription("mg. courte description . Ecole Supérieure de Technologie");
		$schoolTranslate9->setDescription("<p>mg. description .</p> <p>desc Ecole Supérieure de Technologie</p>");
		$em->persist($schoolTranslate9);
		
		$schoolTranslate10 = new SchoolTranslate();
		$schoolTranslate10->setSchool($school2);
		$schoolTranslate10->setLocale($localeIT);
		$schoolTranslate10->setName("it. name . Ecole Supérieure de Technologie");
		$schoolTranslate10->setShortDescription("it. courte description . Ecole Supérieure de Technologie");
		$schoolTranslate10->setDescription("<p>it. description .</p> <p>desc Ecole Supérieure de Technologie</p>");
		$em->persist($schoolTranslate10);
		
		$schoolTranslate11 = new SchoolTranslate();
		$schoolTranslate11->setSchool($school2);
		$schoolTranslate11->setLocale($localeES);
		$schoolTranslate11->setName("es. name . Ecole Supérieure de Technologie");
		$schoolTranslate11->setShortDescription("es. courte description . Ecole Supérieure de Technologie");
		$schoolTranslate11->setDescription("<p>es. description .</p> <p>desc Ecole Supérieure de Technologie</p>");
		$em->persist($schoolTranslate11);
		
		$schoolTranslate12 = new SchoolTranslate();
		$schoolTranslate12->setSchool($school2);
		$schoolTranslate12->setLocale($localeDE);
		$schoolTranslate12->setName("de. name . Ecole Supérieure de Technologie");
		$schoolTranslate12->setShortDescription("de. courte description . Ecole Supérieure de Technologie");
		$schoolTranslate12->setDescription("<p>de. description .</p> <p>desc Ecole Supérieure de Technologie</p>");
		$em->persist($schoolTranslate12);
		/** fin traitement schooltranslate  **/
		
		
		/** traitement school admin **/
		$schoolAdmin1 = new SchoolAdmin();
		$schoolAdmin1->setDate(new \DateTime());
		$schoolAdmin1->setSchool($school1);
		$schoolAdmin1->setUser($user1);
		$schoolAdmin1->setActive(true);
		$em->persist($schoolAdmin1);
		
		$schoolAdmin2 = new SchoolAdmin();
		$schoolAdmin2->setDate(new \DateTime());
		$schoolAdmin2->setSchool($school1);
		$schoolAdmin2->setUser($user2);
		$schoolAdmin2->setActive(true);
		$em->persist($schoolAdmin2);
		
		/** fin traitement school admin  **/
		
		
		/** traitement posts **/
		$post1 = new Post();
		$post1->setUser($user1);
		$post1->setDefaultTitle('l\'avenir des étudiants en gestion');
		$post1->setSlug('l-avenir-des-etudiants-en-gestion');
		$post1->setDate(new \DateTime());
		$post1->setViewNumber(0);
		$post1->setPublished(true);
		$post1->setShowAuthor(true);
		$em->persist($post1);
		
		/** fin traitement posts **/
		
		/** traitement posttranslates **/
		//post1
		$postTranslate1 = new PostTranslate();
		$postTranslate1->setPost($post1);
		$postTranslate1->setLocale($localeFR);
		$postTranslate1->setTitle('l\'avenir des étudiants en gestion');
		$descFR = "fr.description. La filière compta gestion continue à offrir d'excellents débouchés d'autant plus que les métiers de comptable et d'expert-comptable manquent de jeunes pour renouveler les départs en retraite. Pleine d'atouts, la profession continue pourtant à souffrir d'une image un peu terne. Des idées souvent fausses à corriger d'urgence. fr.description. La filière compta gestion continue à offrir d'excellents débouchés d'autant plus que les métiers de comptable et d'expert-comptable manquent de jeunes pour renouveler les départs en retraite. Pleine d'atouts, la profession continue pourtant à souffrir d'une image un peu terne. Des idées souvent fausses à corriger d'urgence.";
		$postTranslate1->setDescription($descFR);
		$contentFR = "<div><p>fr. La filière compta gestion continue à offrir d'excellents débouchés d'autant plus que les métiers de comptable et d'expert-comptable manquent de jeunes pour renouveler les départs en retraite. Pleine d'atouts, la profession continue pourtant à souffrir d'une image un peu terne. Des idées souvent fausses à corriger d'urgence.</p><p>Faire du webmarketing ou du management, c'est classe. Tandis que s'engager dans des études de comptabilité l'est beaucoup moins. La faute à l'image que l'on a des comptables et aux idées reçues qui traînent à leur sujet. A balayer de toute urgence. </p></div>";
		$postTranslate1->setContent($contentFR);
		$em->persist($postTranslate1);
		
		$postTranslate2 = new PostTranslate();
		$postTranslate2->setPost($post1);
		$postTranslate2->setLocale($localeEN);
		$postTranslate2->setTitle('Future of Student Management');
		$postTranslate2->setDescription('description en.');
		$contentEN = "<div><p>en. La filière compta gestion continue à offrir d'excellents débouchés d'autant plus que les métiers de comptable et d'expert-comptable manquent de jeunes pour renouveler les départs en retraite. Pleine d'atouts, la profession continue pourtant à souffrir d'une image un peu terne. Des idées souvent fausses à corriger d'urgence.</p><p>Faire du webmarketing ou du management, c'est classe. Tandis que s'engager dans des études de comptabilité l'est beaucoup moins. La faute à l'image que l'on a des comptables et aux idées reçues qui traînent à leur sujet. A balayer de toute urgence. </p></div>";
		$postTranslate2->setContent($contentEN);
		$em->persist($postTranslate2);
		
		$postTranslate3 = new PostTranslate();
		$postTranslate3->setPost($post1);
		$postTranslate3->setLocale($localeMG);
		$postTranslate3->setTitle("Ny hoavin'ny mpianatra ao amin'ny sampana fitantanana");
		$postTranslate3->setDescription('description mg.');
		$contentMG = "<div><p>mg. La filière compta gestion continue à offrir d'excellents débouchés d'autant plus que les métiers de comptable et d'expert-comptable manquent de jeunes pour renouveler les départs en retraite. Pleine d'atouts, la profession continue pourtant à souffrir d'une image un peu terne. Des idées souvent fausses à corriger d'urgence.</p><p>Faire du webmarketing ou du management, c'est classe. Tandis que s'engager dans des études de comptabilité l'est beaucoup moins. La faute à l'image que l'on a des comptables et aux idées reçues qui traînent à leur sujet. A balayer de toute urgence. </p></div>";
		$postTranslate3->setContent($contentMG);
		$em->persist($postTranslate3);
		
		$postTranslate4 = new PostTranslate();
		$postTranslate4->setPost($post1);
		$postTranslate4->setLocale($localeIT);
		$postTranslate4->setTitle('Il futuro della gestione degli studenti');
		$postTranslate4->setDescription('description it.');
		$contentIT = "<div><p>it. La filière compta gestion continue à offrir d'excellents débouchés d'autant plus que les métiers de comptable et d'expert-comptable manquent de jeunes pour renouveler les départs en retraite. Pleine d'atouts, la profession continue pourtant à souffrir d'une image un peu terne. Des idées souvent fausses à corriger d'urgence.</p><p>Faire du webmarketing ou du management, c'est classe. Tandis que s'engager dans des études de comptabilité l'est beaucoup moins. La faute à l'image que l'on a des comptables et aux idées reçues qui traînent à leur sujet. A balayer de toute urgence. </p></div>";
		$postTranslate4->setContent($contentIT);
		$em->persist($postTranslate4);
		
		$postTranslate5 = new PostTranslate();
		$postTranslate5->setPost($post1);
		$postTranslate5->setLocale($localeES);
		$postTranslate5->setTitle('Futuro de la gestión del Estudiante');
		$postTranslate5->setDescription('description es.');
		$contentES = "<div><p>es. La filière compta gestion continue à offrir d'excellents débouchés d'autant plus que les métiers de comptable et d'expert-comptable manquent de jeunes pour renouveler les départs en retraite. Pleine d'atouts, la profession continue pourtant à souffrir d'une image un peu terne. Des idées souvent fausses à corriger d'urgence.</p><p>Faire du webmarketing ou du management, c'est classe. Tandis que s'engager dans des études de comptabilité l'est beaucoup moins. La faute à l'image que l'on a des comptables et aux idées reçues qui traînent à leur sujet. A balayer de toute urgence. </p></div>";
		$postTranslate5->setContent($contentES);
		$em->persist($postTranslate5);
		
		$postTranslate6 = new PostTranslate();
		$postTranslate6->setPost($post1);
		$postTranslate6->setLocale($localeDE);
		$postTranslate6->setTitle('Zukunft der Studentenverwaltung');
		$postTranslate6->setDescription('description de.');
		$contentDE = "<div><p>de. La filière compta gestion continue à offrir d'excellents débouchés d'autant plus que les métiers de comptable et d'expert-comptable manquent de jeunes pour renouveler les départs en retraite. Pleine d'atouts, la profession continue pourtant à souffrir d'une image un peu terne. Des idées souvent fausses à corriger d'urgence.</p><p>Faire du webmarketing ou du management, c'est classe. Tandis que s'engager dans des études de comptabilité l'est beaucoup moins. La faute à l'image que l'on a des comptables et aux idées reçues qui traînent à leur sujet. A balayer de toute urgence. </p></div>";
		$postTranslate6->setContent($contentDE);
		$em->persist($postTranslate6);
		
		/** fin traitement posttranslates **/
		
		
		/** traitement post_school **/
		
		$postSchool1 = new PostSchool();
		$postSchool1->setPost($post1);
		$postSchool1->setSchool($school1);
		$postSchool1->setUser($user1);
		$postSchool1->setDate(new \DateTime());
		$postSchool1->setUserConfirmation($user1);
		$postSchool1->setConfirmation(true);
		$postSchool1->setDateConfirmation(new \DateTime());
		$postSchool1->setPostToSchool(true);
		$em->persist($postSchool1);
		/** fin traitement post_school  **/
		
		/** traitement advertCategory  **/
		$advertCategory1 = new AdvertCategory();
		$advertCategory1->setDefaultName('concours');
		$advertCategory1->setSlug('concours');
		$em->persist($advertCategory1);
		/** fin traitement advertCategory  **/
		
		/** traitement advert  **/
		$advert1 = new Advert();
		$advert1->setUser($user1);
		$advert1->setDefaultTitle("Concours d'entrée en première année");
		$advert1->setSlug("concours-d-entree-en-premiere-annee");
		$advert1->setDate(new \DateTime());
		$advert1->setViewNumber(0);
		$advert1->setPublished(true);
		$em->persist($advert1);
		/** fin traitement advert  **/
		
		
		/** traitement adverttranslates **/
		$advertTranslate1 = new AdvertTranslate();
		$advertTranslate1->setAdvert($advert1);
		$advertTranslate1->setLocale($localeFR);
		$advertTranslate1->setTitle("fr. Concours d'entrée en première année");
		$contentFR = "<div><p>fr. Concours. La filière compta gestion continue à offrir d'excellents débouchés d'autant plus que les métiers de comptable et d'expert-comptable manquent de jeunes pour renouveler les départs en retraite. Pleine d'atouts, la profession continue pourtant à souffrir d'une image un peu terne. Des idées souvent fausses à corriger d'urgence.</p><p>Faire du webmarketing ou du management, c'est classe. Tandis que s'engager dans des études de comptabilité l'est beaucoup moins. La faute à l'image que l'on a des comptables et aux idées reçues qui traînent à leur sujet. A balayer de toute urgence. </p></div>";
		$advertTranslate1->setContent($contentFR);
		$em->persist($advertTranslate1);
		
		$advertTranslate2 = new AdvertTranslate();
		$advertTranslate2->setAdvert($advert1);
		$advertTranslate2->setLocale($localeEN);
		$advertTranslate2->setTitle("en. Concours d'entrée en première année");
		$contentEN = "<div><p>en. Concours. La filière compta gestion continue à offrir d'excellents débouchés d'autant plus que les métiers de comptable et d'expert-comptable manquent de jeunes pour renouveler les départs en retraite. Pleine d'atouts, la profession continue pourtant à souffrir d'une image un peu terne. Des idées souvent fausses à corriger d'urgence.</p><p>Faire du webmarketing ou du management, c'est classe. Tandis que s'engager dans des études de comptabilité l'est beaucoup moins. La faute à l'image que l'on a des comptables et aux idées reçues qui traînent à leur sujet. A balayer de toute urgence. </p></div>";
		$advertTranslate2->setContent($contentEN);
		$em->persist($advertTranslate2);
		
		$advertTranslate3 = new AdvertTranslate();
		$advertTranslate3->setAdvert($advert1);
		$advertTranslate3->setLocale($localeMG);
		$advertTranslate3->setTitle("mg. Concours d'entrée en première année");
		$contentMG = "<div><p>mg. Concours. La filière compta gestion continue à offrir d'excellents débouchés d'autant plus que les métiers de comptable et d'expert-comptable manquent de jeunes pour renouveler les départs en retraite. Pleine d'atouts, la profession continue pourtant à souffrir d'une image un peu terne. Des idées souvent fausses à corriger d'urgence.</p><p>Faire du webmarketing ou du management, c'est classe. Tandis que s'engager dans des études de comptabilité l'est beaucoup moins. La faute à l'image que l'on a des comptables et aux idées reçues qui traînent à leur sujet. A balayer de toute urgence. </p></div>";
		$advertTranslate3->setContent($contentMG);
		$em->persist($advertTranslate3);
		
		$advertTranslate4 = new AdvertTranslate();
		$advertTranslate4->setAdvert($advert1);
		$advertTranslate4->setLocale($localeIT);
		$advertTranslate4->setTitle("it. Concours d'entrée en première année");
		$contentIT = "<div><p>it. Concours. La filière compta gestion continue à offrir d'excellents débouchés d'autant plus que les métiers de comptable et d'expert-comptable manquent de jeunes pour renouveler les départs en retraite. Pleine d'atouts, la profession continue pourtant à souffrir d'une image un peu terne. Des idées souvent fausses à corriger d'urgence.</p><p>Faire du webmarketing ou du management, c'est classe. Tandis que s'engager dans des études de comptabilité l'est beaucoup moins. La faute à l'image que l'on a des comptables et aux idées reçues qui traînent à leur sujet. A balayer de toute urgence. </p></div>";
		$advertTranslate4->setContent($contentIT);
		$em->persist($advertTranslate4);
		
		$advertTranslate5 = new AdvertTranslate();
		$advertTranslate5->setAdvert($advert1);
		$advertTranslate5->setLocale($localeES);
		$advertTranslate5->setTitle("es. Concours d'entrée en première année");
		$contentES = "<div><p>es. Concours. La filière compta gestion continue à offrir d'excellents débouchés d'autant plus que les métiers de comptable et d'expert-comptable manquent de jeunes pour renouveler les départs en retraite. Pleine d'atouts, la profession continue pourtant à souffrir d'une image un peu terne. Des idées souvent fausses à corriger d'urgence.</p><p>Faire du webmarketing ou du management, c'est classe. Tandis que s'engager dans des études de comptabilité l'est beaucoup moins. La faute à l'image que l'on a des comptables et aux idées reçues qui traînent à leur sujet. A balayer de toute urgence. </p></div>";
		$advertTranslate5->setContent($contentES);
		$em->persist($advertTranslate5);
		
		$advertTranslate6 = new AdvertTranslate();
		$advertTranslate6->setAdvert($advert1);
		$advertTranslate6->setLocale($localeDE);
		$advertTranslate6->setTitle("de. Concours d'entrée en première année");
		$contentDE = "<div><p>de. Concours. La filière compta gestion continue à offrir d'excellents débouchés d'autant plus que les métiers de comptable et d'expert-comptable manquent de jeunes pour renouveler les départs en retraite. Pleine d'atouts, la profession continue pourtant à souffrir d'une image un peu terne. Des idées souvent fausses à corriger d'urgence.</p><p>Faire du webmarketing ou du management, c'est classe. Tandis que s'engager dans des études de comptabilité l'est beaucoup moins. La faute à l'image que l'on a des comptables et aux idées reçues qui traînent à leur sujet. A balayer de toute urgence. </p></div>";
		$advertTranslate6->setContent($contentDE);
		$em->persist($advertTranslate6);
		/** fin traitement advert  **/
		
		/** traitement advert_school **/
		$advertSchool1 = new AdvertSchool();
		$advertSchool1->setAdvert($advert1);
		$advertSchool1->setSchool($school1);
		$advertSchool1->setUser($user1);
		$advertSchool1->setDate(new \DateTime());
		$advertSchool1->setUserConfirmation($user1);
		$advertSchool1->setConfirmation(true);
		$advertSchool1->setDateConfirmation(new \DateTime());
		$advertSchool1->setAdvertToSchool(true);
		$em->persist($advertSchool1);
		/** fin traitement advert_school  **/
		
		/** traitement forum topics **/
		$topic1 = new Topic();
		$topic1->setDefaultName("Système");
		$topic1->setSlug("systeme");
		$topic1->setUser($user1);
		$em->persist($topic1);
		/** fin traitement forum topics  **/
		
		/** traitement add parameter populate **/
		$parameter1 = new Parameter();
		$parameter1->setParameter("populate");
		$parameter1->setValue("1");
		$em->persist($parameter2);
		/** fin traitement add parameter populate **/
		
		/** traitement add parameter schools_by_page **/
		$parameter2 = new Parameter();
		$parameter2->setParameter("schools_by_page");
		$parameter2->setValue("12");
		$em->persist($parameter2);
		/** fin traitement add parameter schools_by_page **/
		
		/** traitement add parameter categories_index **/
		$parameter3 = new Parameter();
		$parameter3->setParameter("categories_index");
		$parameter3->setValue("12");
		$em->persist($parameter3);
		/** fin traitement add parameter categories_index **/
		
		
		$em->flush();
	
		$url = $this->get('router')->generate('com_platform_home');
		return new RedirectResponse($url);
    }
}
