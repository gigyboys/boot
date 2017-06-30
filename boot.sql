-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Ven 30 Juin 2017 à 15:51
-- Version du serveur :  10.1.19-MariaDB
-- Version de PHP :  5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `boot`
--

-- --------------------------------------------------------

--
-- Structure de la table `an_menu`
--

CREATE TABLE `an_menu` (
  `id` int(11) NOT NULL,
  `menu_parent_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `route` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `linkable` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `at_advert`
--

CREATE TABLE `at_advert` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `default_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `view_number` bigint(20) NOT NULL,
  `published` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `at_advert`
--

INSERT INTO `at_advert` (`id`, `user_id`, `slug`, `default_title`, `date`, `view_number`, `published`) VALUES
(1, 1, 'concours-d-entree-en-premiere-annee', 'Concours d''entrée en première année', '2017-02-06 07:24:06', 0, 1),
(2, 1, 'avis-de-concours', 'Avis de concours', '2017-03-06 12:24:46', 0, 1),
(3, 1, 'stage-de-formation', 'Stage de Formation', '2017-03-06 12:33:03', 0, 1),
(4, 3, 'recrutement-en-vague', 'Recrutement en vague', '2017-03-17 06:12:44', 0, 0),
(5, 3, 'unde-rufinus-ea-tempestate', 'Unde Rufinus ea tempestate', '2017-03-17 10:20:06', 0, 0),
(6, 3, 'tste2', 'tste2', '2017-03-17 10:20:38', 0, 1),
(7, 3, 'ceci-est-un-test', 'Ceci est un test', '2017-03-17 10:38:15', 0, 1),
(8, 2, 'apien-vel-cursus-leo', 'apien, vel cursus leo', '2017-06-12 09:04:48', 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `at_advert_illustration`
--

CREATE TABLE `at_advert_illustration` (
  `id` int(11) NOT NULL,
  `advert_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `originalname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `current` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `at_advert_illustration`
--

INSERT INTO `at_advert_illustration` (`id`, `advert_id`, `name`, `path`, `originalname`, `current`) VALUES
(1, 1, 'acrea.jpg', '7ab60ac52ff34c5497e57366c7e43def9719ce87.jpeg', 'acrea.jpg', 0),
(2, 1, 'acrea.jpg', 'abd740c587ef2a7b69f2dc514eb2cbd55e0d50c3.jpeg', 'acrea.jpg', 0),
(3, 1, 'adiva.jpg', 'c52558ccd4d0fef805b3236fb198d9b01c6af6cf.jpeg', 'adiva.jpg', 0),
(4, 1, 'adiva.jpg', '40e537dd8b3b17f0782f0e2228064407730e6ec3.jpeg', 'adiva.jpg', 0),
(5, 1, 'aixam.jpg', '1224e3338d3ec18593ab4c823b257c7aeac05ca5.jpeg', 'aixam.jpg', 0),
(6, 1, 'aston-martin.jpg', '069baad4956229de1de588219b364025df13cba6.jpeg', 'aston-martin.jpg', 0),
(7, 1, 'kasea.jpg', '6b11d0e6da647034be6abba41f1bb3096cc7da0e.jpeg', 'kasea.jpg', 0),
(8, 1, 'santana.jpg', '91ea0f9860ea49a51c68cd6ada80ee155a559815.jpeg', 'santana.jpg', 1),
(9, 2, 'martin.jpg', '33910d93c79dfd1338750e21d71cd3030d3a7dde.jpeg', 'martin.jpg', 0),
(10, 3, 'lotus.jpg', '2d7669e1638e7518fb2a35a384734d7478d2fba8.jpeg', 'lotus.jpg', 1),
(11, 2, 'westfield.jpg', 'a26ff440e5846c6d6616b278dc2b3bba1fd98b48.jpeg', 'westfield.jpg', 1),
(12, 4, 'peugeot.jpg', '79ad36172981385ac4849f291c1bab39cf9fb403.jpeg', 'peugeot.jpg', 1),
(13, 5, 'manet-korado.jpg', '63c8ce66429ef8c924cb6f63ff8f189fc13f5596.jpeg', 'manet-korado.jpg', 1),
(14, 6, 'acrea.jpg', '992ce4670861b5d6589db9e87eff13f39bbded14.jpeg', 'acrea.jpg', 1);

-- --------------------------------------------------------

--
-- Structure de la table `at_advert_translate`
--

CREATE TABLE `at_advert_translate` (
  `id` int(11) NOT NULL,
  `advert_id` int(11) NOT NULL,
  `locale_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `at_advert_translate`
--

INSERT INTO `at_advert_translate` (`id`, `advert_id`, `locale_id`, `title`, `content`) VALUES
(1, 1, 1, 'Concours d''entrée en première année2', '<div>\n<p>Concours. La fili&egrave;re compta gestion continue &agrave; offrir d''excellents d&eacute;bouch&eacute;s d''autant plus que les m&eacute;tiers de comptable et d''expert-comptable manquent de jeunes pour renouveler les d&eacute;parts en retraite. Pleine d''atouts, la profession continue pourtant &agrave; souffrir d''une image un peu terne. Des id&eacute;es souvent fausses &agrave; corriger d''urgence.</p>\n<p>Faire du webmarketing ou du management, c''est classe. Tandis que s''engager dans des &eacute;tudes de comptabilit&eacute; l''est beaucoup moins. La faute &agrave; l''image que l''on a des comptables et aux id&eacute;es re&ccedil;ues qui tra&icirc;nent &agrave; leur sujet. A balayer de toute urgence.</p>\n</div>'),
(2, 1, 2, 'Concours d''entrée en première année', '<div>\n<p>Concours. La fili&egrave;re compta gestion continue &agrave; offrir d''excellents d&eacute;bouch&eacute;s d''autant plus que les m&eacute;tiers de comptable et d''expert-comptable manquent de jeunes pour renouveler les d&eacute;parts en retraite. Pleine d''atouts, la profession continue pourtant &agrave; souffrir d''une image un peu terne. Des id&eacute;es souvent fausses &agrave; corriger d''urgence.</p>\n<p>Faire du webmarketing ou du management, c''est classe. Tandis que s''engager dans des &eacute;tudes de comptabilit&eacute; l''est beaucoup moins. La faute &agrave; l''image que l''on a des comptables et aux id&eacute;es re&ccedil;ues qui tra&icirc;nent &agrave; leur sujet. A balayer de toute urgence.</p>\n</div>'),
(3, 1, 3, 'Concours d''entrée en première année', '<div>\n<p>Concours. La fili&egrave;re compta gestion continue &agrave; offrir d''excellents d&eacute;bouch&eacute;s d''autant plus que les m&eacute;tiers de comptable et d''expert-comptable manquent de jeunes pour renouveler les d&eacute;parts en retraite. Pleine d''atouts, la profession continue pourtant &agrave; souffrir d''une image un peu terne. Des id&eacute;es souvent fausses &agrave; corriger d''urgence.</p>\n<p>Faire du webmarketing ou du management, c''est classe. Tandis que s''engager dans des &eacute;tudes de comptabilit&eacute; l''est beaucoup moins. La faute &agrave; l''image que l''on a des comptables et aux id&eacute;es re&ccedil;ues qui tra&icirc;nent &agrave; leur sujet. A balayer de toute urgence.</p>\n</div>'),
(4, 1, 4, 'Concours d''entrée en première année2', '<div>\n<p>Concours. La fili&egrave;re compta gestion continue &agrave; offrir d''excellents d&eacute;bouch&eacute;s d''autant plus que les m&eacute;tiers de comptable et d''expert-comptable manquent de jeunes pour renouveler les d&eacute;parts en retraite. Pleine d''atouts, la profession continue pourtant &agrave; souffrir d''une image un peu terne. Des id&eacute;es souvent fausses &agrave; corriger d''urgence.</p>\n<p>Faire du webmarketing ou du management, c''est classe. Tandis que s''engager dans des &eacute;tudes de comptabilit&eacute; l''est beaucoup moins. La faute &agrave; l''image que l''on a des comptables et aux id&eacute;es re&ccedil;ues qui tra&icirc;nent &agrave; leur sujet. A balayer de toute urgence.</p>\n</div>'),
(5, 1, 5, 'Concours d''entrée en première année', '<div>\n<p>Concours. La fili&egrave;re compta gestion continue &agrave; offrir d''excellents d&eacute;bouch&eacute;s d''autant plus que les m&eacute;tiers de comptable et d''expert-comptable manquent de jeunes pour renouveler les d&eacute;parts en retraite. Pleine d''atouts, la profession continue pourtant &agrave; souffrir d''une image un peu terne. Des id&eacute;es souvent fausses &agrave; corriger d''urgence.</p>\n<p>Faire du webmarketing ou du management, c''est classe. Tandis que s''engager dans des &eacute;tudes de comptabilit&eacute; l''est beaucoup moins. La faute &agrave; l''image que l''on a des comptables et aux id&eacute;es re&ccedil;ues qui tra&icirc;nent &agrave; leur sujet. A balayer de toute urgence.</p>\n</div>'),
(6, 1, 6, 'Concours d''entrée en première année', '<div>\n<p>Concours. La fili&egrave;re compta gestion continue &agrave; offrir d''excellents d&eacute;bouch&eacute;s d''autant plus que les m&eacute;tiers de comptable et d''expert-comptable manquent de jeunes pour renouveler les d&eacute;parts en retraite. Pleine d''atouts, la profession continue pourtant &agrave; souffrir d''une image un peu terne. Des id&eacute;es souvent fausses &agrave; corriger d''urgence.</p>\n<p>Faire du webmarketing ou du management, c''est classe. Tandis que s''engager dans des &eacute;tudes de comptabilit&eacute; l''est beaucoup moins. La faute &agrave; l''image que l''on a des comptables et aux id&eacute;es re&ccedil;ues qui tra&icirc;nent &agrave; leur sujet. A balayer de toute urgence.</p>\n</div>'),
(7, 2, 1, 'Avis de concours', '<p>Avis de concours</p>'),
(8, 2, 2, 'Avis de concours', '<p>Avis de concours</p>'),
(9, 2, 3, 'Avis de concours', '<p>Avis de concours</p>'),
(10, 2, 4, 'Avis de concours', '<p>Avis de concours</p>'),
(11, 2, 5, 'Avis de concours', '<p>Avis de concours</p>'),
(12, 2, 6, 'Avis de concours', '<p>Avis de concours</p>'),
(13, 3, 1, 'Stage de Formation', '<p>Stage de Formation</p>'),
(14, 3, 2, 'Stage de Formation', '<p>Stage de Formation</p>'),
(15, 3, 3, 'Stage de Formation', '<p>Stage de Formation</p>'),
(16, 3, 4, 'Stage de Formation', '<p>Stage de Formation</p>'),
(17, 3, 5, 'Stage de Formation', '<p>Stage de Formation</p>'),
(18, 3, 6, 'Stage de Formation', '<p>Stage de Formation</p>'),
(19, 4, 1, 'Recrutement en vague', '<p>Fusce commodo convallis velit. Sed dignissim ligula turpis, auctor interdum augue tristique ac. Maecenas ultrices dignissim fringilla. Cras aliquam vestibulum feugiat. Ut congue dui non accumsan condimentum. Pellentesque nec lacinia turpis, eu condimentum augue. In mollis lobortis porttitor. Suspendisse potenti. Maecenas quis nisi vel neque tincidunt bibendum sed eget nisi. Aliquam erat volutpat. Pellentesque non facilisis leo. Duis at faucibus nisl. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis maximus sem eu ex cursus, non mattis nulla maximus. Curabitur hendrerit luctus nibh, ut vulputate lorem posuere eu.</p>\n<p>Nulla non laoreet felis. Aenean rutrum commodo arcu et cursus. Donec fermentum vulputate ex, at accumsan odio posuere sit amet. Vivamus condimentum quis tortor a sodales. Suspendisse aliquam elit massa, ut iaculis ex elementum a. Nam ac ultrices augue. Pellentesque feugiat pulvinar est, non cursus felis dapibus vel. Sed eleifend varius elit vel vulputate. Etiam quis ex lorem. Curabitur nec iaculis odio. Mauris tellus orci, finibus id ex quis, porttitor aliquet orci. Sed porttitor ipsum quis turpis ornare, quis condimentum leo bibendum. Fusce commodo, turpis eget eleifend luctus, quam elit porttitor mauris, ut vestibulum leo purus ut sapien. Etiam vel consequat mauris.</p>\n<p>Aenean ultricies posuere risus sit amet ultrices. Pellentesque tincidunt, justo egestas tincidunt condimentum, nisl mi viverra erat, posuere pharetra erat orci nec velit. Etiam egestas nunc id quam tempor, sed facilisis massa porttitor. Praesent molestie turpis quis risus dapibus commodo eget in enim. Nam pretium non magna a finibus. Curabitur aliquet pharetra elementum. Quisque porttitor fringilla tincidunt. Integer eu tellus vitae libero condimentum congue. Fusce id mauris nec eros bibendum bibendum.</p>\n<p>Praesent eu euismod nisl. Nunc sed egestas lectus, nec ultrices dui. Vestibulum iaculis pretium turpis quis fermentum. Maecenas et ipsum eu arcu sagittis efficitur sit amet non justo. Nunc non leo sit amet tellus pellentesque dignissim. Praesent massa magna, vestibulum ac imperdiet non, ullamcorper aliquet risus. Ut interdum risus libero, vitae volutpat tortor finibus sed. Sed a tincidunt ex. Ut eleifend ullamcorper mi, sit amet finibus mauris maximus eget. Maecenas vulputate urna nec urna ultricies, quis luctus risus gravida.</p>'),
(20, 4, 2, 'Recrutement en vague', '<p>Fusce commodo convallis velit. Sed dignissim ligula turpis, auctor interdum augue tristique ac. Maecenas ultrices dignissim fringilla. Cras aliquam vestibulum feugiat. Ut congue dui non accumsan condimentum. Pellentesque nec lacinia turpis, eu condimentum augue. In mollis lobortis porttitor. Suspendisse potenti. Maecenas quis nisi vel neque tincidunt bibendum sed eget nisi. Aliquam erat volutpat. Pellentesque non facilisis leo. Duis at faucibus nisl. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis maximus sem eu ex cursus, non mattis nulla maximus. Curabitur hendrerit luctus nibh, ut vulputate lorem posuere eu.</p>\n<p>Nulla non laoreet felis. Aenean rutrum commodo arcu et cursus. Donec fermentum vulputate ex, at accumsan odio posuere sit amet. Vivamus condimentum quis tortor a sodales. Suspendisse aliquam elit massa, ut iaculis ex elementum a. Nam ac ultrices augue. Pellentesque feugiat pulvinar est, non cursus felis dapibus vel. Sed eleifend varius elit vel vulputate. Etiam quis ex lorem. Curabitur nec iaculis odio. Mauris tellus orci, finibus id ex quis, porttitor aliquet orci. Sed porttitor ipsum quis turpis ornare, quis condimentum leo bibendum. Fusce commodo, turpis eget eleifend luctus, quam elit porttitor mauris, ut vestibulum leo purus ut sapien. Etiam vel consequat mauris.</p>\n<p>Aenean ultricies posuere risus sit amet ultrices. Pellentesque tincidunt, justo egestas tincidunt condimentum, nisl mi viverra erat, posuere pharetra erat orci nec velit. Etiam egestas nunc id quam tempor, sed facilisis massa porttitor. Praesent molestie turpis quis risus dapibus commodo eget in enim. Nam pretium non magna a finibus. Curabitur aliquet pharetra elementum. Quisque porttitor fringilla tincidunt. Integer eu tellus vitae libero condimentum congue. Fusce id mauris nec eros bibendum bibendum.</p>\n<p>Praesent eu euismod nisl. Nunc sed egestas lectus, nec ultrices dui. Vestibulum iaculis pretium turpis quis fermentum. Maecenas et ipsum eu arcu sagittis efficitur sit amet non justo. Nunc non leo sit amet tellus pellentesque dignissim. Praesent massa magna, vestibulum ac imperdiet non, ullamcorper aliquet risus. Ut interdum risus libero, vitae volutpat tortor finibus sed. Sed a tincidunt ex. Ut eleifend ullamcorper mi, sit amet finibus mauris maximus eget. Maecenas vulputate urna nec urna ultricies, quis luctus risus gravida.</p>'),
(21, 4, 3, 'Recrutement en vague', '<p>Fusce commodo convallis velit. Sed dignissim ligula turpis, auctor interdum augue tristique ac. Maecenas ultrices dignissim fringilla. Cras aliquam vestibulum feugiat. Ut congue dui non accumsan condimentum. Pellentesque nec lacinia turpis, eu condimentum augue. In mollis lobortis porttitor. Suspendisse potenti. Maecenas quis nisi vel neque tincidunt bibendum sed eget nisi. Aliquam erat volutpat. Pellentesque non facilisis leo. Duis at faucibus nisl. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis maximus sem eu ex cursus, non mattis nulla maximus. Curabitur hendrerit luctus nibh, ut vulputate lorem posuere eu.</p>\n<p>Nulla non laoreet felis. Aenean rutrum commodo arcu et cursus. Donec fermentum vulputate ex, at accumsan odio posuere sit amet. Vivamus condimentum quis tortor a sodales. Suspendisse aliquam elit massa, ut iaculis ex elementum a. Nam ac ultrices augue. Pellentesque feugiat pulvinar est, non cursus felis dapibus vel. Sed eleifend varius elit vel vulputate. Etiam quis ex lorem. Curabitur nec iaculis odio. Mauris tellus orci, finibus id ex quis, porttitor aliquet orci. Sed porttitor ipsum quis turpis ornare, quis condimentum leo bibendum. Fusce commodo, turpis eget eleifend luctus, quam elit porttitor mauris, ut vestibulum leo purus ut sapien. Etiam vel consequat mauris.</p>\n<p>Aenean ultricies posuere risus sit amet ultrices. Pellentesque tincidunt, justo egestas tincidunt condimentum, nisl mi viverra erat, posuere pharetra erat orci nec velit. Etiam egestas nunc id quam tempor, sed facilisis massa porttitor. Praesent molestie turpis quis risus dapibus commodo eget in enim. Nam pretium non magna a finibus. Curabitur aliquet pharetra elementum. Quisque porttitor fringilla tincidunt. Integer eu tellus vitae libero condimentum congue. Fusce id mauris nec eros bibendum bibendum.</p>\n<p>Praesent eu euismod nisl. Nunc sed egestas lectus, nec ultrices dui. Vestibulum iaculis pretium turpis quis fermentum. Maecenas et ipsum eu arcu sagittis efficitur sit amet non justo. Nunc non leo sit amet tellus pellentesque dignissim. Praesent massa magna, vestibulum ac imperdiet non, ullamcorper aliquet risus. Ut interdum risus libero, vitae volutpat tortor finibus sed. Sed a tincidunt ex. Ut eleifend ullamcorper mi, sit amet finibus mauris maximus eget. Maecenas vulputate urna nec urna ultricies, quis luctus risus gravida.</p>'),
(22, 4, 4, 'Recrutement en vague', '<p>Fusce commodo convallis velit. Sed dignissim ligula turpis, auctor interdum augue tristique ac. Maecenas ultrices dignissim fringilla. Cras aliquam vestibulum feugiat. Ut congue dui non accumsan condimentum. Pellentesque nec lacinia turpis, eu condimentum augue. In mollis lobortis porttitor. Suspendisse potenti. Maecenas quis nisi vel neque tincidunt bibendum sed eget nisi. Aliquam erat volutpat. Pellentesque non facilisis leo. Duis at faucibus nisl. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis maximus sem eu ex cursus, non mattis nulla maximus. Curabitur hendrerit luctus nibh, ut vulputate lorem posuere eu.</p>\n<p>Nulla non laoreet felis. Aenean rutrum commodo arcu et cursus. Donec fermentum vulputate ex, at accumsan odio posuere sit amet. Vivamus condimentum quis tortor a sodales. Suspendisse aliquam elit massa, ut iaculis ex elementum a. Nam ac ultrices augue. Pellentesque feugiat pulvinar est, non cursus felis dapibus vel. Sed eleifend varius elit vel vulputate. Etiam quis ex lorem. Curabitur nec iaculis odio. Mauris tellus orci, finibus id ex quis, porttitor aliquet orci. Sed porttitor ipsum quis turpis ornare, quis condimentum leo bibendum. Fusce commodo, turpis eget eleifend luctus, quam elit porttitor mauris, ut vestibulum leo purus ut sapien. Etiam vel consequat mauris.</p>\n<p>Aenean ultricies posuere risus sit amet ultrices. Pellentesque tincidunt, justo egestas tincidunt condimentum, nisl mi viverra erat, posuere pharetra erat orci nec velit. Etiam egestas nunc id quam tempor, sed facilisis massa porttitor. Praesent molestie turpis quis risus dapibus commodo eget in enim. Nam pretium non magna a finibus. Curabitur aliquet pharetra elementum. Quisque porttitor fringilla tincidunt. Integer eu tellus vitae libero condimentum congue. Fusce id mauris nec eros bibendum bibendum.</p>\n<p>Praesent eu euismod nisl. Nunc sed egestas lectus, nec ultrices dui. Vestibulum iaculis pretium turpis quis fermentum. Maecenas et ipsum eu arcu sagittis efficitur sit amet non justo. Nunc non leo sit amet tellus pellentesque dignissim. Praesent massa magna, vestibulum ac imperdiet non, ullamcorper aliquet risus. Ut interdum risus libero, vitae volutpat tortor finibus sed. Sed a tincidunt ex. Ut eleifend ullamcorper mi, sit amet finibus mauris maximus eget. Maecenas vulputate urna nec urna ultricies, quis luctus risus gravida.</p>'),
(23, 4, 5, 'Recrutement en vague', '<p>Fusce commodo convallis velit. Sed dignissim ligula turpis, auctor interdum augue tristique ac. Maecenas ultrices dignissim fringilla. Cras aliquam vestibulum feugiat. Ut congue dui non accumsan condimentum. Pellentesque nec lacinia turpis, eu condimentum augue. In mollis lobortis porttitor. Suspendisse potenti. Maecenas quis nisi vel neque tincidunt bibendum sed eget nisi. Aliquam erat volutpat. Pellentesque non facilisis leo. Duis at faucibus nisl. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis maximus sem eu ex cursus, non mattis nulla maximus. Curabitur hendrerit luctus nibh, ut vulputate lorem posuere eu.</p>\n<p>Nulla non laoreet felis. Aenean rutrum commodo arcu et cursus. Donec fermentum vulputate ex, at accumsan odio posuere sit amet. Vivamus condimentum quis tortor a sodales. Suspendisse aliquam elit massa, ut iaculis ex elementum a. Nam ac ultrices augue. Pellentesque feugiat pulvinar est, non cursus felis dapibus vel. Sed eleifend varius elit vel vulputate. Etiam quis ex lorem. Curabitur nec iaculis odio. Mauris tellus orci, finibus id ex quis, porttitor aliquet orci. Sed porttitor ipsum quis turpis ornare, quis condimentum leo bibendum. Fusce commodo, turpis eget eleifend luctus, quam elit porttitor mauris, ut vestibulum leo purus ut sapien. Etiam vel consequat mauris.</p>\n<p>Aenean ultricies posuere risus sit amet ultrices. Pellentesque tincidunt, justo egestas tincidunt condimentum, nisl mi viverra erat, posuere pharetra erat orci nec velit. Etiam egestas nunc id quam tempor, sed facilisis massa porttitor. Praesent molestie turpis quis risus dapibus commodo eget in enim. Nam pretium non magna a finibus. Curabitur aliquet pharetra elementum. Quisque porttitor fringilla tincidunt. Integer eu tellus vitae libero condimentum congue. Fusce id mauris nec eros bibendum bibendum.</p>\n<p>Praesent eu euismod nisl. Nunc sed egestas lectus, nec ultrices dui. Vestibulum iaculis pretium turpis quis fermentum. Maecenas et ipsum eu arcu sagittis efficitur sit amet non justo. Nunc non leo sit amet tellus pellentesque dignissim. Praesent massa magna, vestibulum ac imperdiet non, ullamcorper aliquet risus. Ut interdum risus libero, vitae volutpat tortor finibus sed. Sed a tincidunt ex. Ut eleifend ullamcorper mi, sit amet finibus mauris maximus eget. Maecenas vulputate urna nec urna ultricies, quis luctus risus gravida.</p>'),
(24, 4, 6, 'Recrutement en vague', '<p>Fusce commodo convallis velit. Sed dignissim ligula turpis, auctor interdum augue tristique ac. Maecenas ultrices dignissim fringilla. Cras aliquam vestibulum feugiat. Ut congue dui non accumsan condimentum. Pellentesque nec lacinia turpis, eu condimentum augue. In mollis lobortis porttitor. Suspendisse potenti. Maecenas quis nisi vel neque tincidunt bibendum sed eget nisi. Aliquam erat volutpat. Pellentesque non facilisis leo. Duis at faucibus nisl. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis maximus sem eu ex cursus, non mattis nulla maximus. Curabitur hendrerit luctus nibh, ut vulputate lorem posuere eu.</p>\n<p>Nulla non laoreet felis. Aenean rutrum commodo arcu et cursus. Donec fermentum vulputate ex, at accumsan odio posuere sit amet. Vivamus condimentum quis tortor a sodales. Suspendisse aliquam elit massa, ut iaculis ex elementum a. Nam ac ultrices augue. Pellentesque feugiat pulvinar est, non cursus felis dapibus vel. Sed eleifend varius elit vel vulputate. Etiam quis ex lorem. Curabitur nec iaculis odio. Mauris tellus orci, finibus id ex quis, porttitor aliquet orci. Sed porttitor ipsum quis turpis ornare, quis condimentum leo bibendum. Fusce commodo, turpis eget eleifend luctus, quam elit porttitor mauris, ut vestibulum leo purus ut sapien. Etiam vel consequat mauris.</p>\n<p>Aenean ultricies posuere risus sit amet ultrices. Pellentesque tincidunt, justo egestas tincidunt condimentum, nisl mi viverra erat, posuere pharetra erat orci nec velit. Etiam egestas nunc id quam tempor, sed facilisis massa porttitor. Praesent molestie turpis quis risus dapibus commodo eget in enim. Nam pretium non magna a finibus. Curabitur aliquet pharetra elementum. Quisque porttitor fringilla tincidunt. Integer eu tellus vitae libero condimentum congue. Fusce id mauris nec eros bibendum bibendum.</p>\n<p>Praesent eu euismod nisl. Nunc sed egestas lectus, nec ultrices dui. Vestibulum iaculis pretium turpis quis fermentum. Maecenas et ipsum eu arcu sagittis efficitur sit amet non justo. Nunc non leo sit amet tellus pellentesque dignissim. Praesent massa magna, vestibulum ac imperdiet non, ullamcorper aliquet risus. Ut interdum risus libero, vitae volutpat tortor finibus sed. Sed a tincidunt ex. Ut eleifend ullamcorper mi, sit amet finibus mauris maximus eget. Maecenas vulputate urna nec urna ultricies, quis luctus risus gravida.</p>'),
(25, 5, 1, 'Unde Rufinus ea tempestate', '<p>Unde Rufinus ea tempestate praefectus praetorio ad discrimen trusus est ultimum. ire enim ipse compellebatur ad militem, quem exagitabat inopia simul et feritas, et alioqui coalito more in ordinarias dignitates asperum semper et saevum, ut satisfaceret atque monstraret, quam ob causam annonae convectio sit impedita.</p>\n<p>Itaque tum Scaevola cum in eam ipsam mentionem incidisset, exposuit nobis sermonem Laeli de amicitia habitum ab illo secum et cum altero genero, C. Fannio Marci filio, paucis diebus post mortem Africani. Eius disputationis sententias memoriae mandavi, quas hoc libro exposui arbitratu meo; quasi enim ipsos induxi loquentes, ne ''inquam'' et ''inquit'' saepius interponeretur, atque ut tamquam a praesentibus coram haberi sermo videretur.</p>\n<p>Post emensos insuperabilis expeditionis eventus languentibus partium animis, quas periculorum varietas fregerat et laborum, nondum tubarum cessante clangore vel milite locato per stationes hibernas, fortunae saevientis procellae tempestates alias rebus infudere communibus per multa illa et dira facinora Caesaris Galli, qui ex squalore imo miseriarum in aetatis adultae primitiis ad principale culmen insperato saltu provectus ultra terminos potestatis delatae procurrens asperitate nimia cuncta foedabat. propinquitate enim regiae stirpis gentilitateque etiam tum Constantini nominis efferebatur in fastus, si plus valuisset, ausurus hostilia in auctorem suae felicitatis, ut videbatur.</p>'),
(26, 5, 2, 'Unde Rufinus ea tempestate', '<p>Unde Rufinus ea tempestate praefectus praetorio ad discrimen trusus est ultimum. ire enim ipse compellebatur ad militem, quem exagitabat inopia simul et feritas, et alioqui coalito more in ordinarias dignitates asperum semper et saevum, ut satisfaceret atque monstraret, quam ob causam annonae convectio sit impedita.</p>\n<p>Itaque tum Scaevola cum in eam ipsam mentionem incidisset, exposuit nobis sermonem Laeli de amicitia habitum ab illo secum et cum altero genero, C. Fannio Marci filio, paucis diebus post mortem Africani. Eius disputationis sententias memoriae mandavi, quas hoc libro exposui arbitratu meo; quasi enim ipsos induxi loquentes, ne ''inquam'' et ''inquit'' saepius interponeretur, atque ut tamquam a praesentibus coram haberi sermo videretur.</p>\n<p>Post emensos insuperabilis expeditionis eventus languentibus partium animis, quas periculorum varietas fregerat et laborum, nondum tubarum cessante clangore vel milite locato per stationes hibernas, fortunae saevientis procellae tempestates alias rebus infudere communibus per multa illa et dira facinora Caesaris Galli, qui ex squalore imo miseriarum in aetatis adultae primitiis ad principale culmen insperato saltu provectus ultra terminos potestatis delatae procurrens asperitate nimia cuncta foedabat. propinquitate enim regiae stirpis gentilitateque etiam tum Constantini nominis efferebatur in fastus, si plus valuisset, ausurus hostilia in auctorem suae felicitatis, ut videbatur.</p>'),
(27, 5, 3, 'mg test1', 'mg. Content .test1'),
(28, 5, 4, 'it test1', 'it. Content .test1'),
(29, 5, 5, 'es test1', 'es. Content .test1'),
(30, 5, 6, 'de test1', 'de. Content .test1'),
(31, 6, 1, 'fr tste2', 'fr. Content .tste2'),
(32, 6, 2, 'en tste2', 'en. Content .tste2'),
(33, 6, 3, 'mg tste2', 'mg. Content .tste2'),
(34, 6, 4, 'it tste2', 'it. Content .tste2'),
(35, 6, 5, 'es tste2', 'es. Content .tste2'),
(36, 6, 6, 'de tste2', 'de. Content .tste2'),
(37, 7, 1, 'fr dfgdfg', 'fr. Content .dfgdfg'),
(38, 7, 2, 'en dfgdfg', 'en. Content .dfgdfg'),
(39, 7, 3, 'mg dfgdfg', 'mg. Content .dfgdfg'),
(40, 7, 4, 'it dfgdfg', 'it. Content .dfgdfg'),
(41, 7, 5, 'es dfgdfg', 'es. Content .dfgdfg'),
(42, 7, 6, 'de dfgdfg', 'de. Content .dfgdfg'),
(43, 8, 1, 'fr apien, vel cursus leo', 'fr. Content .apien, vel cursus leo'),
(44, 8, 2, 'en apien, vel cursus leo', 'en. Content .apien, vel cursus leo'),
(45, 8, 3, 'mg apien, vel cursus leo', 'mg. Content .apien, vel cursus leo'),
(46, 8, 4, 'it apien, vel cursus leo', 'it. Content .apien, vel cursus leo'),
(47, 8, 5, 'es apien, vel cursus leo', 'es. Content .apien, vel cursus leo'),
(48, 8, 6, 'de apien, vel cursus leo', 'de. Content .apien, vel cursus leo');

-- --------------------------------------------------------

--
-- Structure de la table `at_category`
--

CREATE TABLE `at_category` (
  `id` int(11) NOT NULL,
  `default_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `at_category`
--

INSERT INTO `at_category` (`id`, `default_name`, `slug`) VALUES
(1, 'concours', 'concours'),
(2, 'Job', 'job');

-- --------------------------------------------------------

--
-- Structure de la table `at_category_advert`
--

CREATE TABLE `at_category_advert` (
  `id` int(11) NOT NULL,
  `advert_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `at_category_advert`
--

INSERT INTO `at_category_advert` (`id`, `advert_id`, `category_id`) VALUES
(7, 3, 2),
(9, 6, 1),
(11, 5, 1),
(12, 8, 1),
(13, 7, 1);

-- --------------------------------------------------------

--
-- Structure de la table `at_category_translate`
--

CREATE TABLE `at_category_translate` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `locale_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `at_category_translate`
--

INSERT INTO `at_category_translate` (`id`, `name`, `description`, `category_id`, `locale_id`) VALUES
(1, 'concours', 'concours', 1, 1),
(2, 'concours', 'concours', 1, 6),
(3, 'Job', 'Job', 2, 1),
(4, 'Job', 'Job', 2, 2),
(5, 'Job', 'Job', 2, 3),
(6, 'Job', 'Job', 2, 4),
(7, 'Job', 'Job', 2, 5),
(8, 'Job', 'Job', 2, 6),
(9, 'concours', 'concours', 1, 2),
(10, 'concours', 'concours', 1, 3),
(11, 'concours', 'concours', 1, 4),
(12, 'concours', 'concours', 1, 5);

-- --------------------------------------------------------

--
-- Structure de la table `bg_category`
--

CREATE TABLE `bg_category` (
  `id` int(11) NOT NULL,
  `default_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `bg_category`
--

INSERT INTO `bg_category` (`id`, `default_name`, `slug`) VALUES
(1, 'Avenir', 'avenir'),
(2, 'Système', 'systeme'),
(4, 'Conférence', 'conference'),
(5, 'Séminaire', 'seminaire'),
(6, 'Rencontres', 'rencontres'),
(7, 'Curabitur laoreet', 'curabitur-laoreet'),
(8, 'systeme', 'systeme-2'),
(9, 'category', 'category-3'),
(10, 'craft', 'craft'),
(11, 'category', 'category-4'),
(12, 'category', 'category-2');

-- --------------------------------------------------------

--
-- Structure de la table `bg_category_post`
--

CREATE TABLE `bg_category_post` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `bg_category_post`
--

INSERT INTO `bg_category_post` (`id`, `post_id`, `category_id`) VALUES
(5, 11, 1),
(6, 9, 2),
(12, 4, 4),
(13, 8, 1),
(14, 13, 2),
(15, 12, 4),
(16, 1, 2),
(17, 14, 5),
(18, 15, 7),
(21, 17, 2);

-- --------------------------------------------------------

--
-- Structure de la table `bg_category_translate`
--

CREATE TABLE `bg_category_translate` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `locale_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `bg_category_translate`
--

INSERT INTO `bg_category_translate` (`id`, `name`, `description`, `category_id`, `locale_id`) VALUES
(1, 'conférence', 'Conférence', 4, 1),
(2, 'Conférence', 'Conférence', 4, 2),
(3, 'Conférence', 'Conférence', 4, 3),
(4, 'Conférence', 'Conférence', 4, 4),
(5, 'Conférence', 'Conférence', 4, 5),
(6, 'Conférence', 'Conférence', 4, 6),
(7, 'Séminaire', 'Séminaire', 5, 1),
(8, 'Séminaire', 'Séminaire', 5, 2),
(9, 'Séminaire', 'Séminaire', 5, 3),
(10, 'Séminaire', 'Séminaire', 5, 4),
(11, 'Séminaire', 'Séminaire', 5, 5),
(12, 'Séminaire', 'Séminaire', 5, 6),
(13, 'Système', 'Système', 2, 1),
(14, 'Système', 'Système', 2, 4),
(15, 'Rencontres', 'Rencontres', 6, 1),
(16, 'Rencontres', 'Rencontres', 6, 2),
(17, 'Rencontres', 'Rencontres', 6, 3),
(18, 'Rencontres', 'Rencontres', 6, 4),
(19, 'Rencontres', 'Rencontres', 6, 5),
(20, 'Rencontres', 'Rencontres', 6, 6),
(21, 'Avenir', 'Avenir', 1, 1),
(22, 'Avenir', 'Avenir', 1, 2),
(23, 'Avenir', 'Avenir', 1, 3),
(24, 'Avenir', 'Avenir', 1, 4),
(25, 'Avenir', 'Avenir', 1, 5),
(26, 'Avenir', 'Avenir', 1, 6),
(27, 'Système', 'Système', 2, 2),
(28, 'Système', 'Système', 2, 3),
(29, 'Système', 'Système', 2, 5),
(30, 'Système', 'Système', 2, 6),
(31, 'fr Curabitur laoreet', 'fr. Description .Curabitur laoreet', 7, 1),
(32, 'en Curabitur laoreet', 'en. Description .Curabitur laoreet', 7, 2),
(33, 'mg Curabitur laoreet', 'mg. Description .Curabitur laoreet', 7, 3),
(34, 'it Curabitur laoreet', 'it. Description .Curabitur laoreet', 7, 4),
(35, 'es Curabitur laoreet', 'es. Description .Curabitur laoreet', 7, 5),
(36, 'de Curabitur laoreet', 'de. Description .Curabitur laoreet', 7, 6),
(37, 'fr systeme', 'fr. Description .systeme', 8, 1),
(38, 'en systeme', 'en. Description .systeme', 8, 2),
(39, 'mg systeme', 'mg. Description .systeme', 8, 3),
(40, 'it systeme', 'it. Description .systeme', 8, 4),
(41, 'es systeme', 'es. Description .systeme', 8, 5),
(42, 'de systeme', 'de. Description .systeme', 8, 6),
(43, 'fr category', 'fr. Description .category', 9, 1),
(44, 'en category', 'en. Description .category', 9, 2),
(45, 'mg category', 'mg. Description .category', 9, 3),
(46, 'it category', 'it. Description .category', 9, 4),
(47, 'es category', 'es. Description .category', 9, 5),
(48, 'de category', 'de. Description .category', 9, 6),
(49, 'fr craft', 'fr. Description .craft', 10, 1),
(50, 'en craft', 'en. Description .craft', 10, 2),
(51, 'mg craft', 'mg. Description .craft', 10, 3),
(52, 'it craft', 'it. Description .craft', 10, 4),
(53, 'es craft', 'es. Description .craft', 10, 5),
(54, 'de craft', 'de. Description .craft', 10, 6),
(55, 'fr category', 'fr. Description .category', 11, 1),
(56, 'en category', 'en. Description .category', 11, 2),
(57, 'mg category', 'mg. Description .category', 11, 3),
(58, 'it category', 'it. Description .category', 11, 4),
(59, 'es category', 'es. Description .category', 11, 5),
(60, 'de category', 'de. Description .category', 11, 6),
(61, 'fr category', 'fr. Description .category', 12, 1),
(62, 'en category', 'en. Description .category', 12, 2),
(63, 'mg category', 'mg. Description .category', 12, 3),
(64, 'it category', 'it. Description .category', 12, 4),
(65, 'es category', 'es. Description .category', 12, 5),
(66, 'de category', 'de. Description .category', 12, 6);

-- --------------------------------------------------------

--
-- Structure de la table `bg_post`
--

CREATE TABLE `bg_post` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `default_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `view_number` bigint(20) NOT NULL,
  `published` tinyint(1) NOT NULL,
  `show_author` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `bg_post`
--

INSERT INTO `bg_post` (`id`, `user_id`, `default_title`, `slug`, `date`, `view_number`, `published`, `show_author`) VALUES
(1, 1, 'Concours d''entrée en première année', 'concours-d-entree-en-premiere-annee', '2017-02-06 07:24:06', 0, 1, 1),
(2, 2, 'Que faire après le bacc?', 'que-faire-après-le-bacc', '2017-02-06 07:24:06', 10, 1, 0),
(3, 2, 'Les avantages du système LMD', 'les-avantages-du-systeme-lmd', '2017-02-06 07:24:06', 0, 1, 1),
(4, 1, 'Sac de transport sur roulettes de luxe', 'sac-de-transport-sur-roulettes-de-luxe', '2017-03-06 09:10:25', 0, 1, 1),
(5, 1, 'pt', 'pt', '2017-03-06 10:00:25', 0, 0, 1),
(6, 1, 'Recevez nos actualités', 'category-2', '2017-03-07 12:44:56', 0, 1, 1),
(7, 1, 'dfgdfg', 'dfgdfg', '2017-03-13 13:39:32', 0, 1, 1),
(8, 1, 'Integer congue placerat quam vitae mollis', 'integer-congue-placerat-quam-vitae-mollis', '2017-03-13 13:40:58', 0, 1, 0),
(9, 1, 'infrastructure universelle', 'infrastructure-universelle', '2017-03-14 10:27:00', 0, 1, 1),
(10, 1, 'conférence config', 'conference-config', '2017-03-14 13:48:19', 0, 1, 1),
(11, 1, 'porte ouverte', 'porte-ouverte', '2017-03-15 12:59:02', 0, 1, 1),
(12, 1, '3 ingrédients d''une photo de paysage réussie', '3-ingredients-d-une-photo-de-paysage-reussie', '2017-03-15 13:07:14', 0, 1, 1),
(13, 3, 'Travail dur! recevoir plus', 'travail-dur-recevoir-plus', '2017-03-17 10:38:44', 0, 1, 1),
(14, 2, 'llis ultricies. Nam', 'llis-ultricies-nam', '2017-06-12 08:13:01', 0, 1, 1),
(15, 2, 'Ouverture de la formation : economie et developpement', 'ouverture-de-la-formation-economie-et-developpement', '2017-06-27 07:14:42', 0, 1, 0),
(16, 1, 'category', 'category-3', '2017-06-28 15:07:43', 0, 0, 1),
(17, 1, 'ceci-dfj-klfjqkls-fjlkqdsjfljslf', 'pt-2', '2017-06-28 15:07:55', 0, 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `bg_post_illustration`
--

CREATE TABLE `bg_post_illustration` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `originalname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `current` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `bg_post_illustration`
--

INSERT INTO `bg_post_illustration` (`id`, `post_id`, `name`, `path`, `originalname`, `current`) VALUES
(1, 1, 'adly.jpg', 'c61315370b6eb886d9167457f5bd7ed7d6327a1e.jpeg', 'adly.jpg', 0),
(2, 2, 'aixam.jpg', 'ae82a0cd1a60e4b312c913f220c3cf177aa48145.jpeg', 'aixam.jpg', 0),
(3, 3, 'adiva.jpg', '43fb696594c74b0fa029caa221c2beff07e09c64.jpeg', 'adiva.jpg', 0),
(4, 2, 'arctic-cat.jpg', '31e60ba7581e4354fd0985afc1804e54438ca72b.jpeg', 'arctic-cat.jpg', 0),
(5, 1, 'acrea.jpg', 'f942479e66de7a6a80d5f00ad0718c60650b07a3.jpeg', 'acrea.jpg', 0),
(6, 1, 'acrea.jpg', '99506787c71f9f28a56caf38353b01e68f95bd6f.jpeg', 'acrea.jpg', 0),
(7, 1, 'aeon.jpg', '4cddeefc65e35a15de29354c6873036cf3d7a7ee.jpeg', 'aeon.jpg', 0),
(8, 4, 'aixam.jpg', '7c965e37d0077d87a6d087fadcb49a1d50ebff57.jpeg', 'aixam.jpg', 0),
(9, 5, 'daf.jpg', '9de1f8c78e80ca5b563f2a8a03724ddff96dc8bb.jpeg', 'daf.jpg', 0),
(10, 7, 'jaguar.jpg', 'b8ad20e57576f3f15f1275394c04dd141f2ec8c6.jpeg', 'jaguar.jpg', 0),
(11, 8, 'magni.jpg', 'b93f5de0fce03066d429ffe38dc065085ad9f896.jpeg', 'magni.jpg', 0),
(12, 8, 'zongshen.jpg', '60baac64cf09ddc0d2101545f339f9d31558a303.jpeg', 'zongshen.jpg', 0),
(13, 8, 'yamaha.jpg', '0831c28e8accff1e1975fc91138cf9c523ce4def.jpeg', 'yamaha.jpg', 0),
(14, 8, 'opel.jpg', 'd9062fc11dc9843234852242377d91272507eb80.jpeg', 'opel.jpg', 0),
(15, 8, 'landwind.jpg', '3db231c28a9886f9ae0fb23a3ca150a1eab4ea42.jpeg', 'landwind.jpg', 0),
(16, 9, 'grecav.jpg', '44a6a472c883bd3d1a086118a62130cbab255c1d.jpeg', 'grecav.jpg', 0),
(17, 10, 'martin.jpg', '03e0d7c219dd1dc3b4ca5e0c4671a9d108baa9bf.jpeg', 'martin.jpg', 0),
(18, 10, 'sky-team.jpg', 'cc21af5ecd10909dcd82bd35d67273838ede4bc3.jpeg', 'sky-team.jpg', 0),
(19, 12, 'aixam.jpg', '5465f0bd3f015472b95547d394a00f4b3774c7d9.jpeg', 'aixam.jpg', 0),
(20, 11, 'masai.jpg', '7fdfafca33719e22ca73d4570c27e7bbedc2d00c.jpeg', 'masai.jpg', 0),
(21, 1, 'sherco.jpg', '2741072029138ee583f077392ce6c95a8c7eee34.jpeg', 'sherco.jpg', 0),
(22, 2, 'gilera.jpg', '5aed09543819dbbd870b78175ac9a0cc8fb55d4e.jpeg', 'gilera.jpg', 0),
(23, 3, 'lifan.jpg', '8fa25c81d92a4eba874201ff6df1f87d3d8f2fa3.jpeg', 'lifan.jpg', 0),
(24, 4, 'montesa.jpg', 'f3ecd34f6aa1089923452c322c58347714ec11f7.jpeg', 'montesa.jpg', 0),
(25, 1, 'land1.jpg', '6c1eee90d86e2b8a6425b5460a610671f6dc2b1e.jpeg', 'land1.jpg', 1),
(26, 2, 'land95.jpg', 'ac145c2955311d19c2f75160cafd7639879c1b5f.jpeg', 'land95.jpg', 1),
(27, 3, 'landcntemad.jpg', '67af3d017a116bd362c4a9fb981dd0fed35243a7.jpeg', 'landcntemad.jpg', 0),
(28, 4, 'land3.jpg', '9faaca15a567b2da295bcf936a6d0a3e58e4c682.jpeg', 'land3.jpg', 0),
(29, 4, 'land92.JPG', 'e5ad72267ada5636d850cfd6ff3d6e7f37703d63.jpeg', 'land92.JPG', 1),
(30, 5, 'land96.jpg', '5fc92b9dde899b30b187b06b1975345ce4f454a1.jpeg', 'land96.jpg', 1),
(31, 6, 'land94.jpg', '9cda6ddd3bf2f04785845c4fc216968eac4b53a4.jpeg', 'land94.jpg', 1),
(32, 7, 'land96.jpg', '25fabd9c7673625cd7b2733011f15ca151a3863c.jpeg', 'land96.jpg', 1),
(33, 8, 'land4.jpg', '79d34e6ac0daa5e375d8b5961ef392a54d609d5a.jpeg', 'land4.jpg', 0),
(34, 9, 'land98.JPG', 'f3502b22e85f54fccde84f0c889ac2af71118526.jpeg', 'land98.JPG', 1),
(35, 10, 'land2.jpg', '05e3a5b29b8fc1a047a9220e5771a5496bff3151.jpeg', 'land2.jpg', 0),
(36, 10, 'land5.jpg', 'de489a5af7499eb67a3eb20dc6f95123a0bfb561.jpeg', 'land5.jpg', 1),
(37, 11, 'land6.jpg', '5702b841d56a6390fa2b20c60ee72d3808fb660a.jpeg', 'land6.jpg', 1),
(38, 12, 'land7.jpg', '2b135b115984e855a6ba2fd20c9313c7d886eee0.jpeg', 'land7.jpg', 1),
(39, 13, 'land99.jpg', 'd9614865eed5a550a231c0d6cae268dd1705a1b4.jpeg', 'land99.jpg', 1),
(40, 3, 'land93.jpg', 'c1fc613e4fd50df3afa416840d662b2ac0e9b808.jpeg', 'land93.jpg', 1),
(41, 8, 'landesm.jpg', 'ce89c5f69d380cf4efce342c364c9b60bb1564f3.jpeg', 'landesm.jpg', 1);

-- --------------------------------------------------------

--
-- Structure de la table `bg_post_translate`
--

CREATE TABLE `bg_post_translate` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `locale_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `bg_post_translate`
--

INSERT INTO `bg_post_translate` (`id`, `post_id`, `locale_id`, `title`, `description`, `content`) VALUES
(1, 1, 1, 'l''avenir des étudiants en gestion', 'fr.description. La filière compta gestion continue à offrir d''excellents débouchés d''autant plus que les métiers de comptable et d''expert-comptable manquent de jeunes pour renouveler les départs en retraite. Pleine d''atouts, la profession continue pourtant à souffrir d''une image un peu terne. Des idées souvent fausses à corriger d''urgence. fr.description. La filière compta gestion continue à offrir d''excellents débouchés d''autant plus que les métiers de comptable et d''expert-comptable manquent de jeunes pour renouveler les départs en retraite. Pleine d''atouts, la profession continue pourtant à souffrir d''une image un peu terne. Des idées souvent fausses à corriger d''urgence.', '<div><p>fr. La filière compta gestion continue à offrir d''excellents débouchés d''autant plus que les métiers de comptable et d''expert-comptable manquent de jeunes pour renouveler les départs en retraite. Pleine d''atouts, la profession continue pourtant à souffrir d''une image un peu terne. Des idées souvent fausses à corriger d''urgence.</p><p>Faire du webmarketing ou du management, c''est classe. Tandis que s''engager dans des études de comptabilité l''est beaucoup moins. La faute à l''image que l''on a des comptables et aux idées reçues qui traînent à leur sujet. A balayer de toute urgence. </p></div>'),
(2, 1, 2, 'Future of Student Management', 'description en.', '<div><p>en. La filière compta gestion continue à offrir d''excellents débouchés d''autant plus que les métiers de comptable et d''expert-comptable manquent de jeunes pour renouveler les départs en retraite. Pleine d''atouts, la profession continue pourtant à souffrir d''une image un peu terne. Des idées souvent fausses à corriger d''urgence.</p><p>Faire du webmarketing ou du management, c''est classe. Tandis que s''engager dans des études de comptabilité l''est beaucoup moins. La faute à l''image que l''on a des comptables et aux idées reçues qui traînent à leur sujet. A balayer de toute urgence. </p></div>'),
(3, 1, 3, 'Ny hoavin''ny mpianatra ao amin''ny sampana fitantanana', 'description mg.', '<div><p>mg. La filière compta gestion continue à offrir d''excellents débouchés d''autant plus que les métiers de comptable et d''expert-comptable manquent de jeunes pour renouveler les départs en retraite. Pleine d''atouts, la profession continue pourtant à souffrir d''une image un peu terne. Des idées souvent fausses à corriger d''urgence.</p><p>Faire du webmarketing ou du management, c''est classe. Tandis que s''engager dans des études de comptabilité l''est beaucoup moins. La faute à l''image que l''on a des comptables et aux idées reçues qui traînent à leur sujet. A balayer de toute urgence. </p></div>'),
(4, 1, 4, 'Il futuro della gestione degli studenti', 'description it.', '<div><p>it. La filière compta gestion continue à offrir d''excellents débouchés d''autant plus que les métiers de comptable et d''expert-comptable manquent de jeunes pour renouveler les départs en retraite. Pleine d''atouts, la profession continue pourtant à souffrir d''une image un peu terne. Des idées souvent fausses à corriger d''urgence.</p><p>Faire du webmarketing ou du management, c''est classe. Tandis que s''engager dans des études de comptabilité l''est beaucoup moins. La faute à l''image que l''on a des comptables et aux idées reçues qui traînent à leur sujet. A balayer de toute urgence. </p></div>'),
(5, 1, 5, 'Futuro de la gestión del Estudiante', 'description es.', '<div><p>es. La filière compta gestion continue à offrir d''excellents débouchés d''autant plus que les métiers de comptable et d''expert-comptable manquent de jeunes pour renouveler les départs en retraite. Pleine d''atouts, la profession continue pourtant à souffrir d''une image un peu terne. Des idées souvent fausses à corriger d''urgence.</p><p>Faire du webmarketing ou du management, c''est classe. Tandis que s''engager dans des études de comptabilité l''est beaucoup moins. La faute à l''image que l''on a des comptables et aux idées reçues qui traînent à leur sujet. A balayer de toute urgence. </p></div>'),
(6, 1, 6, 'Zukunft der Studentenverwaltung', 'description de.', '<div><p>de. La filière compta gestion continue à offrir d''excellents débouchés d''autant plus que les métiers de comptable et d''expert-comptable manquent de jeunes pour renouveler les départs en retraite. Pleine d''atouts, la profession continue pourtant à souffrir d''une image un peu terne. Des idées souvent fausses à corriger d''urgence.</p><p>Faire du webmarketing ou du management, c''est classe. Tandis que s''engager dans des études de comptabilité l''est beaucoup moins. La faute à l''image que l''on a des comptables et aux idées reçues qui traînent à leur sujet. A balayer de toute urgence. </p></div>'),
(7, 2, 1, 'Que faire après le bacc?', 'Duplexque isdem diebus acciderat malum, quod et Theophilum insontem atrox interceperat casus, et Serenianus dignus exsecratione cunctorum, innoxius, modo non reclamante publico vigore, discessit.Duplexque isdem diebus acciderat malum, quod et Theophilum insontem atrox interceperat casus, et Serenianus dignus exsecratione cunctorum, innoxius, modo non reclamante publico vigore, discessit.', '<div>\n<p>fr. La fili&egrave;re compta gestion continue &agrave; offrir d''excellents d&eacute;bouch&eacute;s d''autant plus que les m&eacute;tiers de comptable et d''expert-comptable manquent de jeunes pour renouveler les d&eacute;parts en retraite. Pleine d''atouts, la profession continue pourtant &agrave; souffrir d''une image un peu terne. Des id&eacute;es souvent fausses &agrave; corriger d''urgence.</p>\n<p>Faire du webmarketing ou du management, c''est classe. Tandis que s''engager dans des &eacute;tudes de comptabilit&eacute; l''est beaucoup moins. La faute &agrave; l''image que l''on a des comptables et aux id&eacute;es re&ccedil;ues qui tra&icirc;nent &agrave; leur sujet. A balayer de toute urgence.</p>\n</div>'),
(8, 2, 2, 'What to do after the baccalaureate?', 'Duplexque isdem diebus acciderat malum, quod et Theophilum insontem atrox interceperat casus, et Serenianus dignus exsecratione cunctorum, innoxius, modo non reclamante publico vigore, discessit.Duplexque isdem diebus acciderat malum, quod et Theophilum insontem atrox interceperat casus, et Serenianus dignus exsecratione cunctorum, innoxius, modo non reclamante publico vigore, discessit.', '<div>\n<p>en. La fili&egrave;re compta gestion continue &agrave; offrir d''excellents d&eacute;bouch&eacute;s d''autant plus que les m&eacute;tiers de comptable et d''expert-comptable manquent de jeunes pour renouveler les d&eacute;parts en retraite. Pleine d''atouts, la profession continue pourtant &agrave; souffrir d''une image un peu terne. Des id&eacute;es souvent fausses &agrave; corriger d''urgence.</p>\n<p>Faire du webmarketing ou du management, c''est classe. Tandis que s''engager dans des &eacute;tudes de comptabilit&eacute; l''est beaucoup moins. La faute &agrave; l''image que l''on a des comptables et aux id&eacute;es re&ccedil;ues qui tra&icirc;nent &agrave; leur sujet. A balayer de toute urgence.</p>\n</div>'),
(9, 2, 3, 'Inona ny ketrika vita bakalorea?', 'description mg.', '<div><p>mg. La filière compta gestion continue à offrir d''excellents débouchés d''autant plus que les métiers de comptable et d''expert-comptable manquent de jeunes pour renouveler les départs en retraite. Pleine d''atouts, la profession continue pourtant à souffrir d''une image un peu terne. Des idées souvent fausses à corriger d''urgence.</p><p>Faire du webmarketing ou du management, c''est classe. Tandis que s''engager dans des études de comptabilité l''est beaucoup moins. La faute à l''image que l''on a des comptables et aux idées reçues qui traînent à leur sujet. A balayer de toute urgence. </p></div>'),
(10, 2, 4, 'Cosa fare dopo il diploma di maturità?', 'description it.', '<div><p>it. La filière compta gestion continue à offrir d''excellents débouchés d''autant plus que les métiers de comptable et d''expert-comptable manquent de jeunes pour renouveler les départs en retraite. Pleine d''atouts, la profession continue pourtant à souffrir d''une image un peu terne. Des idées souvent fausses à corriger d''urgence.</p><p>Faire du webmarketing ou du management, c''est classe. Tandis que s''engager dans des études de comptabilité l''est beaucoup moins. La faute à l''image que l''on a des comptables et aux idées reçues qui traînent à leur sujet. A balayer de toute urgence. </p></div>'),
(11, 2, 5, '¿Qué hacer después del bachillerato?', 'description es.', '<div><p>es. La filière compta gestion continue à offrir d''excellents débouchés d''autant plus que les métiers de comptable et d''expert-comptable manquent de jeunes pour renouveler les départs en retraite. Pleine d''atouts, la profession continue pourtant à souffrir d''une image un peu terne. Des idées souvent fausses à corriger d''urgence.</p><p>Faire du webmarketing ou du management, c''est classe. Tandis que s''engager dans des études de comptabilité l''est beaucoup moins. La faute à l''image que l''on a des comptables et aux idées reçues qui traînent à leur sujet. A balayer de toute urgence. </p></div>'),
(12, 2, 6, 'Was nach dem Bakkalaureat zu tun?', 'description de.', '<div>\n<p>de. La fili&egrave;re compta gestion continue &agrave; offrir d''excellents d&eacute;bouch&eacute;s d''autant plus que les m&eacute;tiers de comptable et d''expert-comptable manquent de jeunes pour renouveler les d&eacute;parts en retraite. Pleine d''atouts, la profession continue pourtant &agrave; souffrir d''une image un peu terne. Des id&eacute;es souvent fausses &agrave; corriger d''urgence.</p>\n<p>Faire du webmarketing ou du management, c''est classe. Tandis que s''engager dans des &eacute;tudes de comptabilit&eacute; l''est beaucoup moins. La faute &agrave; l''image que l''on a des comptables et aux id&eacute;es re&ccedil;ues qui tra&icirc;nent &agrave; leur sujet. A balayer de toute urgence.</p>\n</div>'),
(13, 3, 1, 'Les avantages du système LMD', 'Haec igitur Epicuri non probo, inquam. De cetero vellem equidem aut ipse doctrinis fuisset instructior est enim, quod tibi ita videri necesse est, non satis politus iis artibus, quas qui tenent, eruditi appellantur aut ne deterruisset alios a studiis. quamquam te quidem video minime esse deterritum.Haec igitur Epicuri non probo, inquam. De cetero vellem equidem aut ipse doctrinis fuisset instructior est enim, quod tibi ita videri necesse est, non satis politus iis artibus, quas qui tenent, eruditi appellantur aut ne deterruisset alios a studiis. quamquam te quidem video minime esse deterritum.', '<div>\n<p>fr. La fili&egrave;re compta gestion continue &agrave; offrir d''excellents d&eacute;bouch&eacute;s d''autant plus que les m&eacute;tiers de comptable et d''expert-comptable manquent de jeunes pour renouveler les d&eacute;parts en retraite. Pleine d''atouts, la profession continue pourtant &agrave; souffrir d''une image un peu terne. Des id&eacute;es souvent fausses &agrave; corriger d''urgence.</p>\n<p>Faire du webmarketing ou du management, c''est classe. Tandis que s''engager dans des &eacute;tudes de comptabilit&eacute; l''est beaucoup moins. La faute &agrave; l''image que l''on a des comptables et aux id&eacute;es re&ccedil;ues qui tra&icirc;nent &agrave; leur sujet. A balayer de toute urgence.</p>\n</div>'),
(14, 3, 2, 'The advantages of the LMD system', 'Haec igitur Epicuri non probo, inquam. De cetero vellem equidem aut ipse doctrinis fuisset instructior est enim, quod tibi ita videri necesse est, non satis politus iis artibus, quas qui tenent, eruditi appellantur aut ne deterruisset alios a studiis. quamquam te quidem video minime esse deterritum.Haec igitur Epicuri non probo, inquam. De cetero vellem equidem aut ipse doctrinis fuisset instructior est enim, quod tibi ita videri necesse est, non satis politus iis artibus, quas qui tenent, eruditi appellantur aut ne deterruisset alios a studiis. quamquam te quidem video minime esse deterritum.', '<div>\n<p>en. La fili&egrave;re compta gestion continue &agrave; offrir d''excellents d&eacute;bouch&eacute;s d''autant plus que les m&eacute;tiers de comptable et d''expert-comptable manquent de jeunes pour renouveler les d&eacute;parts en retraite. Pleine d''atouts, la profession continue pourtant &agrave; souffrir d''une image un peu terne. Des id&eacute;es souvent fausses &agrave; corriger d''urgence.</p>\n<p>Faire du webmarketing ou du management, c''est classe. Tandis que s''engager dans des &eacute;tudes de comptabilit&eacute; l''est beaucoup moins. La faute &agrave; l''image que l''on a des comptables et aux id&eacute;es re&ccedil;ues qui tra&icirc;nent &agrave; leur sujet. A balayer de toute urgence.</p>\n</div>'),
(15, 3, 3, 'Ny tombotsoan''ny rafitra LMD', 'description mg.', '<div><p>mg. La filière compta gestion continue à offrir d''excellents débouchés d''autant plus que les métiers de comptable et d''expert-comptable manquent de jeunes pour renouveler les départs en retraite. Pleine d''atouts, la profession continue pourtant à souffrir d''une image un peu terne. Des idées souvent fausses à corriger d''urgence.</p><p>Faire du webmarketing ou du management, c''est classe. Tandis que s''engager dans des études de comptabilité l''est beaucoup moins. La faute à l''image que l''on a des comptables et aux idées reçues qui traînent à leur sujet. A balayer de toute urgence. </p></div>'),
(16, 3, 4, 'I vantaggi del sistema LMD', 'description it.', '<div><p>it. La filière compta gestion continue à offrir d''excellents débouchés d''autant plus que les métiers de comptable et d''expert-comptable manquent de jeunes pour renouveler les départs en retraite. Pleine d''atouts, la profession continue pourtant à souffrir d''une image un peu terne. Des idées souvent fausses à corriger d''urgence.</p><p>Faire du webmarketing ou du management, c''est classe. Tandis que s''engager dans des études de comptabilité l''est beaucoup moins. La faute à l''image que l''on a des comptables et aux idées reçues qui traînent à leur sujet. A balayer de toute urgence. </p></div>'),
(17, 3, 5, 'Las ventajas del sistema LMD', 'description es.', '<div><p>es. La filière compta gestion continue à offrir d''excellents débouchés d''autant plus que les métiers de comptable et d''expert-comptable manquent de jeunes pour renouveler les départs en retraite. Pleine d''atouts, la profession continue pourtant à souffrir d''une image un peu terne. Des idées souvent fausses à corriger d''urgence.</p><p>Faire du webmarketing ou du management, c''est classe. Tandis que s''engager dans des études de comptabilité l''est beaucoup moins. La faute à l''image que l''on a des comptables et aux idées reçues qui traînent à leur sujet. A balayer de toute urgence. </p></div>'),
(18, 3, 6, 'Die Vorteile des Systems LMD', 'description de.', '<div><p>de. La filière compta gestion continue à offrir d''excellents débouchés d''autant plus que les métiers de comptable et d''expert-comptable manquent de jeunes pour renouveler les départs en retraite. Pleine d''atouts, la profession continue pourtant à souffrir d''une image un peu terne. Des idées souvent fausses à corriger d''urgence.</p><p>Faire du webmarketing ou du management, c''est classe. Tandis que s''engager dans des études de comptabilité l''est beaucoup moins. La faute à l''image que l''on a des comptables et aux idées reçues qui traînent à leur sujet. A balayer de toute urgence. </p></div>'),
(19, 4, 1, 'Sac de transport sur roulettes de luxe', 'Vivamus nec pellentesque est. Sed cursus sit amet risus vel blandit. Phasellus efficitur dui in orci tincidunt, et feugiat tortor blandit. Pellentesque pretium sagittis elit, sit amet porta neque finibus tempus. Sed ac vestibulum turpis. Sed laoreet gravida justo et fermentum. Ut tristique velit metus, vitae hendrerit enim vulputate a. Nulla id luctus enim, ut fringilla nunc. Vestibulum dignissim quam id cursus commodo. Sed diam massa, hendrerit sagittis turpis sed, dignissim ultrices metus. Suspendisse id facilisis nulla. Aliquam ut tellus vestibulum, aliquam diam laoreet, porttitor sem.', '<p>Vivamus nec pellentesque est. Sed cursus sit amet risus vel blandit. Phasellus efficitur dui in orci tincidunt, et feugiat tortor blandit. Pellentesque pretium sagittis elit, sit amet porta neque finibus tempus. Sed ac vestibulum turpis. Sed laoreet gravida justo et fermentum. Ut tristique velit metus, vitae hendrerit enim vulputate a. Nulla id luctus enim, ut fringilla nunc. Vestibulum dignissim quam id cursus commodo.</p>\n<p>Sed diam massa, hendrerit sagittis turpis sed, dignissim ultrices metus. Suspendisse id facilisis nulla. Aliquam ut tellus vestibulum, aliquam diam laoreet, porttitor sem. Nulla at vehicula enim, at euismod purus. Mauris ac elit pellentesque, euismod est id, fermentum arcu. Praesent tempus libero a blandit ultrices. Suspendisse id maximus sapien.</p>\n<p>Morbi varius felis a vehicula mollis. Morbi non consectetur dui. Aenean vulputate diam sit amet quam auctor pharetra. Curabitur porta blandit orci et gravida. Proin maximus hendrerit elit a tristique. Mauris convallis a mauris aliquam volutpat. Proin magna turpis, tristique id nunc sed, auctor elementum massa. Praesent ultricies dignissim tortor non pellentesque.</p>\n<p>Sed at metus vestibulum, venenatis dui nec, ultrices risus. Donec sit amet commodo neque. Vivamus quis dignissim felis, in imperdiet velit. Sed sollicitudin lorem et eros dapibus, nec elementum massa dictum. Nullam consectetur dignissim eros ac tincidunt. Maecenas blandit nibh id eros commodo maximus. Quisque laoreet libero sed ipsum ullamcorper, rhoncus accumsan velit interdum. Curabitur a magna sapien. Aliquam sed neque nec ligula rhoncus varius ac et ligula.</p>'),
(20, 4, 2, 'Sac de transport sur roulettes de luxe', 'Vivamus nec pellentesque est. Sed cursus sit amet risus vel blandit. Phasellus efficitur dui in orci tincidunt, et feugiat tortor blandit. Pellentesque pretium sagittis elit, sit amet porta neque finibus tempus. Sed ac vestibulum turpis. Sed laoreet gravida justo et fermentum. Ut tristique velit metus, vitae hendrerit enim vulputate a. Nulla id luctus enim, ut fringilla nunc. Vestibulum dignissim quam id cursus commodo.\n\nSed diam massa, hendrerit sagittis turpis sed, dignissim ultrices metus. Suspendisse id facilisis nulla. Aliquam ut tellus vestibulum, aliquam diam laoreet, porttitor sem. Nulla at vehicula enim, at euismod purus. Mauris ac elit pellentesque, euismod est id, fermentum arcu. Praesent tempus libero a blandit ultrices. Suspendisse id maximus sapien. Morbi varius felis a vehicula mollis. Morbi non consectetur dui. Aenean vulputate diam sit amet quam auctor pharetra. Curabitur porta blandit orci et gravida. Proin maximus hendrerit elit a tristique. Mauris convallis a mauris aliquam volutpat.', '<p>Vivamus nec pellentesque est. Sed cursus sit amet risus vel blandit. Phasellus efficitur dui in orci tincidunt, et feugiat tortor blandit. Pellentesque pretium sagittis elit, sit amet porta neque finibus tempus. Sed ac vestibulum turpis. Sed laoreet gravida justo et fermentum. Ut tristique velit metus, vitae hendrerit enim vulputate a. Nulla id luctus enim, ut fringilla nunc. Vestibulum dignissim quam id cursus commodo.</p>\n<p>Sed diam massa, hendrerit sagittis turpis sed, dignissim ultrices metus. Suspendisse id facilisis nulla. Aliquam ut tellus vestibulum, aliquam diam laoreet, porttitor sem. Nulla at vehicula enim, at euismod purus. Mauris ac elit pellentesque, euismod est id, fermentum arcu. Praesent tempus libero a blandit ultrices. Suspendisse id maximus sapien.</p>\n<p>Morbi varius felis a vehicula mollis. Morbi non consectetur dui. Aenean vulputate diam sit amet quam auctor pharetra. Curabitur porta blandit orci et gravida. Proin maximus hendrerit elit a tristique. Mauris convallis a mauris aliquam volutpat. Proin magna turpis, tristique id nunc sed, auctor elementum massa. Praesent ultricies dignissim tortor non pellentesque.</p>\n<p>Sed at metus vestibulum, venenatis dui nec, ultrices risus. Donec sit amet commodo neque. Vivamus quis dignissim felis, in imperdiet velit. Sed sollicitudin lorem et eros dapibus, nec elementum massa dictum. Nullam consectetur dignissim eros ac tincidunt. Maecenas blandit nibh id eros commodo maximus. Quisque laoreet libero sed ipsum ullamcorper, rhoncus accumsan velit interdum. Curabitur a magna sapien. Aliquam sed neque nec ligula rhoncus varius ac et ligula.</p>'),
(21, 4, 3, 'mg gdfgd dgdfg', 'mg. Description .gdfgd dgdfg', 'mg. Content .gdfgd dgdfg'),
(22, 4, 4, 'it gdfgd dgdfg', 'it. Description .gdfgd dgdfg', 'it. Content .gdfgd dgdfg'),
(23, 4, 5, 'es gdfgd dgdfg', 'es. Description .gdfgd dgdfg', 'es. Content .gdfgd dgdfg'),
(24, 4, 6, 'de gdfgd dgdfg', 'de. Description .gdfgd dgdfg', 'de. Content .gdfgd dgdfg'),
(25, 5, 1, 'fr sd sdf sdf sfd', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus purus nulla, laoreet ac sodales et, molestie lacinia tellus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Maecenas turpis ante, aliquam nec fermentum sit amet, bibendum a mauris. Mauris cursus tellus odio, vel feugiat nisi fermentum sit amet. Donec et tincidunt metus, fermentum hendrerit odio. Praesent laoreet mollis faucibus. Ut quis mattis justo, eu tincidunt sapien. Duis vel metus congue, placerat tortor sit amet, ornare diam. Quisque venenatis egestas nisi non feugiat. Mauris lobortis ligula nibh, at fringilla diam tincidunt sit amet. Sed mattis sed sem at euismod. In tincidunt turpis sed dui lacinia semper. Praesent ut purus non eros efficitur aliquam. Nam id dapibus tellus, ut faucibus ante. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus purus nulla, laoreet ac sodales et, molestie lacinia tellus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Maecenas turpis ante, aliquam nec fermentum sit amet, bibendum a mauris. Mauris cursus tellus odio, vel feugiat nisi fermentum sit amet. Donec et tincidunt metus, fermentum hendrerit odio. Praesent laoreet mollis faucibus. Ut quis mattis justo, eu tincidunt sapien. Duis vel metus congue, placerat tortor sit amet, ornare diam. Quisque venenatis egestas nisi non feugiat. Mauris lobortis ligula nibh, at fringilla diam tincidunt sit amet. Sed mattis sed sem at euismod. In tincidunt turpis sed dui lacinia semper. Praesent ut purus non eros efficitur aliquam. Nam id dapibus tellus, ut faucibus ante. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.</p>\n<p>Praesent pellentesque fermentum suscipit. Curabitur nec tristique nibh. Proin vitae faucibus quam. Sed metus orci, condimentum sit amet congue vel, fermentum sit amet ipsum. Sed nibh metus, vestibulum vitae lectus quis, iaculis eleifend mi. Fusce dapibus quam vitae rutrum fermentum. Sed ullamcorper lacinia felis, pharetra iaculis ex luctus a. Fusce pretium molestie ipsum vitae scelerisque. Vestibulum ante purus, scelerisque vel ante eget, sodales molestie nulla. Nulla cursus non nibh quis eleifend. Morbi malesuada arcu at nisl blandit, vel sodales velit aliquet. Cras a ante sed eros aliquet congue a sed nisl. Mauris eu erat eget nulla ornare semper id vitae arcu. Nulla pellentesque vehicula efficitur. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed luctus bibendum arcu quis consectetur.</p>'),
(26, 5, 2, 'en sd sdf sdf sfd', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus purus nulla, laoreet ac sodales et, molestie lacinia tellus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Maecenas turpis ante, aliquam nec fermentum sit amet, bibendum a mauris. Mauris cursus tellus odio, vel feugiat nisi fermentum sit amet. Donec et tincidunt metus, fermentum hendrerit odio. Praesent laoreet mollis faucibus. Ut quis mattis justo, eu tincidunt sapien. Duis vel metus congue, placerat tortor sit amet, ornare diam. Quisque venenatis egestas nisi non feugiat. Mauris lobortis ligula nibh, at fringilla diam tincidunt sit amet. Sed mattis sed sem at euismod. In tincidunt turpis sed dui lacinia semper. Praesent ut purus non eros efficitur aliquam. Nam id dapibus tellus, ut faucibus ante. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus purus nulla, laoreet ac sodales et, molestie lacinia tellus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Maecenas turpis ante, aliquam nec fermentum sit amet, bibendum a mauris. Mauris cursus tellus odio, vel feugiat nisi fermentum sit amet. Donec et tincidunt metus, fermentum hendrerit odio. Praesent laoreet mollis faucibus. Ut quis mattis justo, eu tincidunt sapien. Duis vel metus congue, placerat tortor sit amet, ornare diam. Quisque venenatis egestas nisi non feugiat. Mauris lobortis ligula nibh, at fringilla diam tincidunt sit amet. Sed mattis sed sem at euismod. In tincidunt turpis sed dui lacinia semper. Praesent ut purus non eros efficitur aliquam. Nam id dapibus tellus, ut faucibus ante. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.</p>\n<p>Praesent pellentesque fermentum suscipit. Curabitur nec tristique nibh. Proin vitae faucibus quam. Sed metus orci, condimentum sit amet congue vel, fermentum sit amet ipsum. Sed nibh metus, vestibulum vitae lectus quis, iaculis eleifend mi. Fusce dapibus quam vitae rutrum fermentum. Sed ullamcorper lacinia felis, pharetra iaculis ex luctus a. Fusce pretium molestie ipsum vitae scelerisque. Vestibulum ante purus, scelerisque vel ante eget, sodales molestie nulla. Nulla cursus non nibh quis eleifend. Morbi malesuada arcu at nisl blandit, vel sodales velit aliquet. Cras a ante sed eros aliquet congue a sed nisl. Mauris eu erat eget nulla ornare semper id vitae arcu. Nulla pellentesque vehicula efficitur. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed luctus bibendum arcu quis consectetur.</p>'),
(27, 5, 3, 'mg sd sdf sdf sfd', 'mg. Description .sd sdf sdf sfd', 'mg. Content .sd sdf sdf sfd'),
(28, 5, 4, 'it sd sdf sdf sfd', 'it. Description .sd sdf sdf sfd', 'it. Content .sd sdf sdf sfd'),
(29, 5, 5, 'es sd sdf sdf sfd', 'es. Description .sd sdf sdf sfd', 'es. Content .sd sdf sdf sfd'),
(30, 5, 6, 'de sd sdf sdf sfd', 'de. Description .sd sdf sdf sfd', 'de. Content .sd sdf sdf sfd'),
(31, 6, 1, 'fr Recevez nos actualités', 'Cum haec taliaque sollicitas eius aures everberarent expositas semper eius modi rumoribus et patentes, varia animo tum miscente consilia, tandem id ut optimum factu elegit: et Vrsicinum primum ad se venire summo cum honore mandavit ea specie ut pro rerum tunc urgentium captu disponeretur concordi consilio, quibus virium incrementis Parthicarum gentium a arma minantium impetus frangerentur.', '<p>Cum haec taliaque sollicitas eius aures everberarent expositas semper eius modi rumoribus et patentes, varia animo tum miscente consilia, tandem id ut optimum factu elegit: et Vrsicinum primum ad se venire summo cum honore mandavit ea specie ut pro rerum tunc urgentium captu disponeretur concordi consilio, quibus virium incrementis Parthicarum gentium a arma minantium impetus frangerentur.Cum haec taliaque sollicitas eius aures everberarent expositas semper eius modi rumoribus et patentes, varia animo tum miscente consilia, tandem id ut optimum factu elegit: et Vrsicinum primum ad se venire summo cum honore mandavit ea specie ut pro rerum tunc urgentium captu disponeretur concordi consilio, quibus virium incrementis Parthicarum gentium a arma minantium impetus frangerentur.Cum haec taliaque sollicitas eius aures everberarent expositas semper eius modi rumoribus et patentes, varia animo tum miscente consilia, tandem id ut optimum factu elegit: et Vrsicinum primum ad se venire summo cum honore mandavit ea specie ut pro rerum tunc urgentium captu disponeretur concordi consilio, quibus virium incrementis Parthicarum gentium a arma minantium impetus frangerentur.</p>'),
(32, 6, 2, 'en Recevez nos actualités', 'en. Description .Recevez nos actualités', 'en. Content .Recevez nos actualités'),
(33, 6, 3, 'mg Recevez nos actualités', 'mg. Description .Recevez nos actualités', 'mg. Content .Recevez nos actualités'),
(34, 6, 4, 'it Recevez nos actualités', 'it. Description .Recevez nos actualités', 'it. Content .Recevez nos actualités'),
(35, 6, 5, 'es Recevez nos actualités', 'es. Description .Recevez nos actualités', 'es. Content .Recevez nos actualités'),
(36, 6, 6, 'de Recevez nos actualités', 'de. Description .Recevez nos actualités', 'de. Content .Recevez nos actualités'),
(37, 7, 1, 'fr dfgdfg', 'Vbi curarum abiectis ponderibus aliis tamquam nodum et codicem difficillimum Caesarem convellere nisu valido cogitabat, eique deliberanti cum proximis clandestinis conloquiis et nocturnis qua vi, quibusve commentis id fieret, antequam effundendis rebus pertinacius incumberet confidentia, acciri mollioribus scriptis per simulationem tractatus publici nimis urgentis eundem placuerat Gallum, ut auxilio destitutus sine ullo interiret obstaculo.', '<p>Vbi curarum abiectis ponderibus aliis tamquam nodum et codicem difficillimum Caesarem convellere nisu valido cogitabat, eique deliberanti cum proximis clandestinis conloquiis et nocturnis qua vi, quibusve commentis id fieret, antequam effundendis rebus pertinacius incumberet confidentia, acciri mollioribus scriptis per simulationem tractatus publici nimis urgentis eundem placuerat Gallum, ut auxilio destitutus sine ullo interiret obstaculo.Vbi curarum abiectis ponderibus aliis tamquam nodum et codicem difficillimum Caesarem convellere nisu valido cogitabat, eique deliberanti cum proximis clandestinis conloquiis et nocturnis qua vi, quibusve commentis id fieret, antequam effundendis rebus pertinacius incumberet confidentia, acciri mollioribus scriptis per simulationem tractatus publici nimis urgentis eundem placuerat Gallum, ut auxilio destitutus sine ullo interiret obstaculo.Vbi curarum abiectis ponderibus aliis tamquam nodum et codicem difficillimum Caesarem convellere nisu valido cogitabat, eique deliberanti cum proximis clandestinis conloquiis et nocturnis qua vi, quibusve commentis id fieret, antequam effundendis rebus pertinacius incumberet confidentia, acciri mollioribus scriptis per simulationem tractatus publici nimis urgentis eundem placuerat Gallum, ut auxilio destitutus sine ullo interiret obstaculo.</p>'),
(38, 7, 2, 'en dfgdfg', 'en. Description .dfgdfg', 'en. Content .dfgdfg'),
(39, 7, 3, 'mg dfgdfg', 'mg. Description .dfgdfg', 'mg. Content .dfgdfg'),
(40, 7, 4, 'it dfgdfg', 'it. Description .dfgdfg', 'it. Content .dfgdfg'),
(41, 7, 5, 'es dfgdfg', 'es. Description .dfgdfg', 'es. Content .dfgdfg'),
(42, 7, 6, 'de dfgdfg', 'de. Description .dfgdfg', 'de. Content .dfgdfg'),
(43, 8, 1, 'Integer congue placerat quam vitae mollis', 'Integer congue placerat quam vitae mollis. Morbi egestas enim felis, sit amet consequat neque sagittis in. Curabitur malesuada ultricies tincidunt. Integer accumsan enim sagittis arcu efficitur, vitae finibus urna placerat. Morbi lacinia condimentum elit eu molestie. Nam at quam ante. Sed libero dolor, molestie ut nunc sit amet, convallis rhoncus neque. Aliquam sit amet arcu velit. Aenean in purus est. Vivamus sit amet neque sit amet purus porta elementum eget condimentum ipsum. Etiam tellus urna, rutrum in placerat ac, sagittis et purus. Curabitur non dui tempus, finibus magna non, malesuada sem. Nullam quis dapibus velit, eu molestie ex. Mauris commodo dignissim metus a interdum.', '<p>Donec lacus nibh, commodo sed metus vel, pulvinar faucibus nulla. Maecenas id volutpat magna. Nunc vitae varius massa. Sed dictum feugiat justo at bibendum. Curabitur a ipsum dapibus, eleifend nisl id, bibendum urna. Cras quis purus justo. Nam augue ante, dictum eget consequat at, vulputate quis nulla. Vestibulum vitae sem ut enim posuere accumsan.</p>\n<p>Integer congue placerat quam vitae mollis. Morbi egestas enim felis, sit amet consequat neque sagittis in. Curabitur malesuada ultricies tincidunt. Integer accumsan enim sagittis arcu efficitur, vitae finibus urna placerat. Morbi lacinia condimentum elit eu molestie. Nam at quam ante. Sed libero dolor, molestie ut nunc sit amet, convallis rhoncus neque. Aliquam sit amet arcu velit. Aenean in purus est. Vivamus sit amet neque sit amet purus porta elementum eget condimentum ipsum. Etiam tellus urna, rutrum in placerat ac, sagittis et purus. Curabitur non dui tempus, finibus magna non, malesuada sem. Nullam quis dapibus velit, eu molestie ex. Mauris commodo dignissim metus a interdum.</p>\n<p>Nulla volutpat gravida cursus. Ut eros orci, auctor sed libero non, lacinia consectetur turpis. In porta porttitor enim vitae interdum. Duis quis tortor et nibh gravida blandit et eu diam. In tincidunt ante non odio egestas, et feugiat risus volutpat. Etiam gravida ultricies finibus. Phasellus in sem consequat, feugiat ex a, finibus purus. Quisque ut feugiat sapien. Vivamus id ante sit amet orci dapibus ultricies non eu dui. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</p>\n<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce feugiat tellus augue. Ut tincidunt urna quis finibus mollis. Vivamus lacinia enim eu urna convallis iaculis. Aliquam convallis, quam vitae scelerisque scelerisque, nisl justo convallis sapien, nec venenatis tortor purus in justo. Vestibulum id pharetra sapien. Donec lobortis placerat elit, in aliquet lacus aliquam eget. Vestibulum bibendum sollicitudin dolor vitae vulputate.</p>\n<p>Ut porta tristique fermentum. Etiam sit amet metus turpis. Donec risus est, ornare ut neque eget, maximus placerat leo. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed sed fermentum ante. Curabitur condimentum quam ut varius facilisis. Donec lacinia diam turpis, ac facilisis eros commodo aliquam. Suspendisse elementum eget eros non dictum.</p>\n<p>Cras pretium hendrerit feugiat. Ut id porta leo. Duis vel mattis ipsum. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis vestibulum ipsum sit amet lobortis vehicula. Suspendisse a nunc orci. Sed eu elit sit amet neque lobortis maximus in eu diam. Pellentesque consectetur nec nunc sit amet mattis. Vivamus tempus volutpat massa, eu condimentum augue maximus eget. Ut ligula ex, posuere ut mauris vel, elementum efficitur tellus. Nulla facilisi. Quisque dapibus nunc massa, ac ultrices leo consectetur eu. Aliquam tristique, ex eget scelerisque porta, ante ipsum hendrerit augue, in ullamcorper neque arcu vitae est.</p>\n<p>Sed dictum sollicitudin lorem sed vehicula. Maecenas a enim fermentum, suscipit felis ac, placerat ligula. Fusce sem dui, porttitor sit amet felis sed, egestas facilisis urna. Integer vehicula, neque sit amet interdum fringilla, eros dui aliquet leo, scelerisque volutpat mi libero non dolor. Fusce aliquam efficitur eleifend. Fusce elit sem, dapibus vulputate interdum sit amet, sollicitudin at est. Quisque sollicitudin dui ut posuere tincidunt.</p>\n<p>Nullam non justo laoreet, convallis sem in, eleifend nisl. Pellentesque iaculis vestibulum enim, sit amet tempus tortor laoreet et. Phasellus sollicitudin eleifend metus, in tincidunt neque blandit quis. Pellentesque eleifend aliquet nisl ut tincidunt. Donec laoreet ut erat lobortis vestibulum. Nullam in ante lectus. Donec imperdiet, ligula eget egestas accumsan, nisl dui fringilla nunc, ac tincidunt enim mauris vitae metus. Etiam dictum varius ipsum, sed tempus justo sodales tincidunt. Sed dolor libero, varius a tellus congue, malesuada iaculis urna. Sed finibus mauris varius, tempor lacus eget, dignissim mi. Praesent posuere nibh mi, sed rutrum urna vehicula ut.</p>'),
(44, 8, 2, 'Integer congue placerat quam vitae mollis', 'Integer congue placerat quam vitae mollis. Morbi egestas enim felis, sit amet consequat neque sagittis in. Curabitur malesuada ultricies tincidunt. Integer accumsan enim sagittis arcu efficitur, vitae finibus urna placerat. Morbi lacinia condimentum elit eu molestie. Nam at quam ante. Sed libero dolor, molestie ut nunc sit amet, convallis rhoncus neque. Aliquam sit amet arcu velit. Aenean in purus est. Vivamus sit amet neque sit amet purus porta elementum eget condimentum ipsum. Etiam tellus urna, rutrum in placerat ac, sagittis et purus. Curabitur non dui tempus, finibus magna non, malesuada sem. Nullam quis dapibus velit, eu molestie ex. Mauris commodo dignissim metus a interdum.', '<p>Donec lacus nibh, commodo sed metus vel, pulvinar faucibus nulla. Maecenas id volutpat magna. Nunc vitae varius massa. Sed dictum feugiat justo at bibendum. Curabitur a ipsum dapibus, eleifend nisl id, bibendum urna. Cras quis purus justo. Nam augue ante, dictum eget consequat at, vulputate quis nulla. Vestibulum vitae sem ut enim posuere accumsan.</p>\n<p>Integer congue placerat quam vitae mollis. Morbi egestas enim felis, sit amet consequat neque sagittis in. Curabitur malesuada ultricies tincidunt. Integer accumsan enim sagittis arcu efficitur, vitae finibus urna placerat. Morbi lacinia condimentum elit eu molestie. Nam at quam ante. Sed libero dolor, molestie ut nunc sit amet, convallis rhoncus neque. Aliquam sit amet arcu velit. Aenean in purus est. Vivamus sit amet neque sit amet purus porta elementum eget condimentum ipsum. Etiam tellus urna, rutrum in placerat ac, sagittis et purus. Curabitur non dui tempus, finibus magna non, malesuada sem. Nullam quis dapibus velit, eu molestie ex. Mauris commodo dignissim metus a interdum.</p>\n<p>Nulla volutpat gravida cursus. Ut eros orci, auctor sed libero non, lacinia consectetur turpis. In porta porttitor enim vitae interdum. Duis quis tortor et nibh gravida blandit et eu diam. In tincidunt ante non odio egestas, et feugiat risus volutpat. Etiam gravida ultricies finibus. Phasellus in sem consequat, feugiat ex a, finibus purus. Quisque ut feugiat sapien. Vivamus id ante sit amet orci dapibus ultricies non eu dui. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</p>\n<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce feugiat tellus augue. Ut tincidunt urna quis finibus mollis. Vivamus lacinia enim eu urna convallis iaculis. Aliquam convallis, quam vitae scelerisque scelerisque, nisl justo convallis sapien, nec venenatis tortor purus in justo. Vestibulum id pharetra sapien. Donec lobortis placerat elit, in aliquet lacus aliquam eget. Vestibulum bibendum sollicitudin dolor vitae vulputate.</p>\n<p>Ut porta tristique fermentum. Etiam sit amet metus turpis. Donec risus est, ornare ut neque eget, maximus placerat leo. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed sed fermentum ante. Curabitur condimentum quam ut varius facilisis. Donec lacinia diam turpis, ac facilisis eros commodo aliquam. Suspendisse elementum eget eros non dictum.</p>\n<p>Cras pretium hendrerit feugiat. Ut id porta leo. Duis vel mattis ipsum. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis vestibulum ipsum sit amet lobortis vehicula. Suspendisse a nunc orci. Sed eu elit sit amet neque lobortis maximus in eu diam. Pellentesque consectetur nec nunc sit amet mattis. Vivamus tempus volutpat massa, eu condimentum augue maximus eget. Ut ligula ex, posuere ut mauris vel, elementum efficitur tellus. Nulla facilisi. Quisque dapibus nunc massa, ac ultrices leo consectetur eu. Aliquam tristique, ex eget scelerisque porta, ante ipsum hendrerit augue, in ullamcorper neque arcu vitae est.</p>\n<p>Sed dictum sollicitudin lorem sed vehicula. Maecenas a enim fermentum, suscipit felis ac, placerat ligula. Fusce sem dui, porttitor sit amet felis sed, egestas facilisis urna. Integer vehicula, neque sit amet interdum fringilla, eros dui aliquet leo, scelerisque volutpat mi libero non dolor. Fusce aliquam efficitur eleifend. Fusce elit sem, dapibus vulputate interdum sit amet, sollicitudin at est. Quisque sollicitudin dui ut posuere tincidunt.</p>\n<p>Nullam non justo laoreet, convallis sem in, eleifend nisl. Pellentesque iaculis vestibulum enim, sit amet tempus tortor laoreet et. Phasellus sollicitudin eleifend metus, in tincidunt neque blandit quis. Pellentesque eleifend aliquet nisl ut tincidunt. Donec laoreet ut erat lobortis vestibulum. Nullam in ante lectus. Donec imperdiet, ligula eget egestas accumsan, nisl dui fringilla nunc, ac tincidunt enim mauris vitae metus. Etiam dictum varius ipsum, sed tempus justo sodales tincidunt. Sed dolor libero, varius a tellus congue, malesuada iaculis urna. Sed finibus mauris varius, tempor lacus eget, dignissim mi. Praesent posuere nibh mi, sed rutrum urna vehicula ut.</p>'),
(45, 8, 3, 'mg dfgd dfgdfg dfg', 'mg. Description .dfgd dfgdfg dfg', 'mg. Content .dfgd dfgdfg dfg'),
(46, 8, 4, 'it dfgd dfgdfg dfg', 'it. Description .dfgd dfgdfg dfg', 'it. Content .dfgd dfgdfg dfg'),
(47, 8, 5, 'es dfgd dfgdfg dfg', 'es. Description .dfgd dfgdfg dfg', 'es. Content .dfgd dfgdfg dfg'),
(48, 8, 6, 'de dfgd dfgdfg dfg', 'de. Description .dfgd dfgdfg dfg', 'de. Content .dfgd dfgdfg dfg'),
(49, 9, 1, 'fr sdfsd fsdf', 'fr. Description .sdfsd fsdf', 'fr. Content .sdfsd fsdf'),
(50, 9, 2, 'en sdfsd fsdf', 'en. Description .sdfsd fsdf', 'en. Content .sdfsd fsdf'),
(51, 9, 3, 'mg sdfsd fsdf', 'mg. Description .sdfsd fsdf', 'mg. Content .sdfsd fsdf'),
(52, 9, 4, 'it sdfsd fsdf', 'it. Description .sdfsd fsdf', 'it. Content .sdfsd fsdf'),
(53, 9, 5, 'es sdfsd fsdf', 'es. Description .sdfsd fsdf', 'es. Content .sdfsd fsdf'),
(54, 9, 6, 'de sdfsd fsdf', 'de. Description .sdfsd fsdf', 'de. Content .sdfsd fsdf'),
(55, 10, 1, 'fr dfgdfg dfgdfg', 'fr. Description .dfgdfg dfgdfg', 'fr. Content .dfgdfg dfgdfg'),
(56, 10, 2, 'en dfgdfg dfgdfg', 'en. Description .dfgdfg dfgdfg', 'en. Content .dfgdfg dfgdfg'),
(57, 10, 3, 'mg dfgdfg dfgdfg', 'mg. Description .dfgdfg dfgdfg', 'mg. Content .dfgdfg dfgdfg'),
(58, 10, 4, 'it dfgdfg dfgdfg', 'it. Description .dfgdfg dfgdfg', 'it. Content .dfgdfg dfgdfg'),
(59, 10, 5, 'es dfgdfg dfgdfg', 'es. Description .dfgdfg dfgdfg', 'es. Content .dfgdfg dfgdfg'),
(60, 10, 6, 'de dfgdfg dfgdfg', 'de. Description .dfgdfg dfgdfg', 'de. Content .dfgdfg dfgdfg'),
(61, 11, 1, 'fr gdgd', 'fr. Description .gdgd', 'fr. Content .gdgd'),
(62, 11, 2, 'en gdgd', 'en. Description .gdgd', 'en. Content .gdgd'),
(63, 11, 3, 'mg gdgd', 'mg. Description .gdgd', 'mg. Content .gdgd'),
(64, 11, 4, 'it gdgd', 'it. Description .gdgd', 'it. Content .gdgd'),
(65, 11, 5, 'es gdgd', 'es. Description .gdgd', 'es. Content .gdgd'),
(66, 11, 6, 'de gdgd', 'de. Description .gdgd', 'de. Content .gdgd'),
(67, 12, 1, '3 ingrédients d''une photo de paysage réussie', 'Iis igitur est difficilius satis facere, qui se Latina scripta dicunt contemnere. in quibus hoc primum est in quo admirer, cur in gravissimis rebus non delectet eos sermo patrius, cum idem fabellas Latinas ad verbum e Graecis expressas non inviti legant. quis enim tam inimicus paene nomini Romano est, qui Ennii Medeam aut Antiopam Pacuvii spernat aut reiciat, quod se isdem Euripidis fabulis delectari dicat, Latinas litteras oderit?Iis igitur est difficilius satis facere, qui se Latina scripta dicunt contemnere. in quibus hoc primum est in quo admirer, cur in gravissimis rebus non delectet eos sermo patrius, cum idem fabellas Latinas ad verbum e Graecis expressas non inviti legant. quis enim tam inimicus paene nomini Romano est, qui Ennii Medeam aut Antiopam Pacuvii spernat aut reiciat, quod se isdem Euripidis fabulis delectari dicat, Latinas litteras oderit?', '<p>Iis igitur est difficilius satis facere, qui se Latina scripta dicunt contemnere. in quibus hoc primum est in quo admirer, cur in gravissimis rebus non delectet eos sermo patrius, cum idem fabellas Latinas ad verbum e Graecis expressas non inviti legant. quis enim tam inimicus paene nomini Romano est, qui Ennii Medeam aut Antiopam Pacuvii spernat aut reiciat, quod se isdem Euripidis fabulis delectari dicat, Latinas litteras oderit?Iis igitur est difficilius satis facere, qui se Latina scripta dicunt contemnere. in quibus hoc primum est in quo admirer, cur in gravissimis rebus non delectet eos sermo patrius, cum idem fabellas Latinas ad verbum e Graecis expressas non inviti legant. quis enim tam inimicus paene nomini Romano est, qui Ennii Medeam aut Antiopam Pacuvii spernat aut reiciat, quod se isdem Euripidis fabulis delectari dicat, Latinas litteras oderit?Iis igitur est difficilius satis facere, qui se Latina scripta dicunt contemnere. in quibus hoc primum est in quo admirer, cur in gravissimis rebus non delectet eos sermo patrius, cum idem fabellas Latinas ad verbum e Graecis expressas non inviti legant. quis enim tam inimicus paene nomini Romano est, qui Ennii Medeam aut Antiopam Pacuvii spernat aut reiciat, quod se isdem Euripidis fabulis delectari dicat, Latinas litteras oderit?Iis igitur est difficilius satis facere, qui se Latina scripta dicunt contemnere. in quibus hoc primum est in quo admirer, cur in gravissimis rebus non delectet eos sermo patrius, cum idem fabellas Latinas ad verbum e Graecis expressas non inviti legant. quis enim tam inimicus paene nomini Romano est, qui Ennii Medeam aut Antiopam Pacuvii spernat aut reiciat, quod se isdem Euripidis fabulis delectari dicat, Latinas litteras oderit?Iis igitur est difficilius satis facere, qui se Latina scripta dicunt contemnere. in quibus hoc primum est in quo admirer, cur in gravissimis rebus non delectet eos sermo patrius, cum idem fabellas Latinas ad verbum e Graecis expressas non inviti legant. quis enim tam inimicus paene nomini Romano est, qui Ennii Medeam aut Antiopam Pacuvii spernat aut reiciat, quod se isdem Euripidis fabulis delectari dicat, Latinas litteras oderit?</p>'),
(68, 12, 2, '3 ingrédients d''une photo de paysage réussie', 'Iis igitur est difficilius satis facere, qui se Latina scripta dicunt contemnere. in quibus hoc primum est in quo admirer, cur in gravissimis rebus non delectet eos sermo patrius, cum idem fabellas Latinas ad verbum e Graecis expressas non inviti legant. quis enim tam inimicus paene nomini Romano est, qui Ennii Medeam aut Antiopam Pacuvii spernat aut reiciat, quod se isdem Euripidis fabulis delectari dicat, Latinas litteras oderit?Iis igitur est difficilius satis facere, qui se Latina scripta dicunt contemnere. in quibus hoc primum est in quo admirer, cur in gravissimis rebus non delectet eos sermo patrius, cum idem fabellas Latinas ad verbum e Graecis expressas non inviti legant. quis enim tam inimicus paene nomini Romano est, qui Ennii Medeam aut Antiopam Pacuvii spernat aut reiciat, quod se isdem Euripidis fabulis delectari dicat, Latinas litteras oderit?', '<p>Iis igitur est difficilius satis facere, qui se Latina scripta dicunt contemnere. in quibus hoc primum est in quo admirer, cur in gravissimis rebus non delectet eos sermo patrius, cum idem fabellas Latinas ad verbum e Graecis expressas non inviti legant. quis enim tam inimicus paene nomini Romano est, qui Ennii Medeam aut Antiopam Pacuvii spernat aut reiciat, quod se isdem Euripidis fabulis delectari dicat, Latinas litteras oderit?Iis igitur est difficilius satis facere, qui se Latina scripta dicunt contemnere. in quibus hoc primum est in quo admirer, cur in gravissimis rebus non delectet eos sermo patrius, cum idem fabellas Latinas ad verbum e Graecis expressas non inviti legant. quis enim tam inimicus paene nomini Romano est, qui Ennii Medeam aut Antiopam Pacuvii spernat aut reiciat, quod se isdem Euripidis fabulis delectari dicat, Latinas litteras oderit?Iis igitur est difficilius satis facere, qui se Latina scripta dicunt contemnere. in quibus hoc primum est in quo admirer, cur in gravissimis rebus non delectet eos sermo patrius, cum idem fabellas Latinas ad verbum e Graecis expressas non inviti legant. quis enim tam inimicus paene nomini Romano est, qui Ennii Medeam aut Antiopam Pacuvii spernat aut reiciat, quod se isdem Euripidis fabulis delectari dicat, Latinas litteras oderit?Iis igitur est difficilius satis facere, qui se Latina scripta dicunt contemnere. in quibus hoc primum est in quo admirer, cur in gravissimis rebus non delectet eos sermo patrius, cum idem fabellas Latinas ad verbum e Graecis expressas non inviti legant. quis enim tam inimicus paene nomini Romano est, qui Ennii Medeam aut Antiopam Pacuvii spernat aut reiciat, quod se isdem Euripidis fabulis delectari dicat, Latinas litteras oderit?Iis igitur est difficilius satis facere, qui se Latina scripta dicunt contemnere. in quibus hoc primum est in quo admirer, cur in gravissimis rebus non delectet eos sermo patrius, cum idem fabellas Latinas ad verbum e Graecis expressas non inviti legant. quis enim tam inimicus paene nomini Romano est, qui Ennii Medeam aut Antiopam Pacuvii spernat aut reiciat, quod se isdem Euripidis fabulis delectari dicat, Latinas litteras oderit?</p>'),
(69, 12, 3, 'mg gdfg dfgd', 'mg. Description .gdfg dfgd', 'mg. Content .gdfg dfgd'),
(70, 12, 4, 'it gdfg dfgd', 'it. Description .gdfg dfgd', 'it. Content .gdfg dfgd'),
(71, 12, 5, 'es gdfg dfgd', 'es. Description .gdfg dfgd', 'es. Content .gdfg dfgd'),
(72, 12, 6, 'de gdfg dfgd', 'de. Description .gdfg dfgd', 'de. Content .gdfg dfgd');
INSERT INTO `bg_post_translate` (`id`, `post_id`, `locale_id`, `title`, `description`, `content`) VALUES
(73, 13, 1, 'Travail dur! recevoir plus', 'Superatis Tauri montis verticibus qui ad solis ortum sublimius attolluntur, Cilicia spatiis porrigitur late distentis dives bonis omnibus terra, eiusque lateri dextro adnexa Isauria, pari sorte uberi palmite viget et frugibus minutis, quam mediam navigabile flumen Calycadnus interscindit.Superatis Tauri montis verticibus qui ad solis ortum sublimius attolluntur, Cilicia spatiis porrigitur late distentis dives bonis omnibus terra, eiusque lateri dextro adnexa Isauria, pari sorte uberi palmite viget et frugibus minutis, quam mediam navigabile flumen Calycadnus interscindit.', '<p>Superatis Tauri montis verticibus qui ad solis ortum sublimius attolluntur, Cilicia spatiis porrigitur late distentis dives bonis omnibus terra, eiusque lateri dextro adnexa Isauria, pari sorte uberi palmite viget et frugibus minutis, quam mediam navigabile flumen Calycadnus interscindit.Superatis Tauri montis verticibus qui ad solis ortum sublimius attolluntur, Cilicia spatiis porrigitur late distentis dives bonis omnibus terra, eiusque lateri dextro adnexa Isauria, pari sorte uberi palmite viget et frugibus minutis, quam mediam navigabile flumen Calycadnus interscindit.Superatis Tauri montis verticibus qui ad solis ortum sublimius attolluntur, Cilicia spatiis porrigitur late distentis dives bonis omnibus terra, eiusque lateri dextro adnexa Isauria, pari sorte uberi palmite viget et frugibus minutis, quam mediam navigabile flumen Calycadnus interscindit.Superatis Tauri montis verticibus qui ad solis ortum sublimius attolluntur, Cilicia spatiis porrigitur late distentis dives bonis omnibus terra, eiusque lateri dextro adnexa Isauria, pari sorte uberi palmite viget et frugibus minutis, quam mediam navigabile flumen Calycadnus interscindit.Superatis Tauri montis verticibus qui ad solis ortum sublimius attolluntur, Cilicia spatiis porrigitur late distentis dives bonis omnibus terra, eiusque lateri dextro adnexa Isauria, pari sorte uberi palmite viget et frugibus minutis, quam mediam navigabile flumen Calycadnus interscindit.Superatis Tauri montis verticibus qui ad solis ortum sublimius attolluntur, Cilicia spatiis porrigitur late distentis dives bonis omnibus terra, eiusque lateri dextro adnexa Isauria, pari sorte uberi palmite viget et frugibus minutis, quam mediam navigabile flumen Calycadnus interscindit.</p>'),
(74, 13, 2, 'Travail dur! recevoir plus', 'Superatis Tauri montis verticibus qui ad solis ortum sublimius attolluntur, Cilicia spatiis porrigitur late distentis dives bonis omnibus terra, eiusque lateri dextro adnexa Isauria, pari sorte uberi palmite viget et frugibus minutis, quam mediam navigabile flumen Calycadnus interscindit.Superatis Tauri montis verticibus qui ad solis ortum sublimius attolluntur, Cilicia spatiis porrigitur late distentis dives bonis omnibus terra, eiusque lateri dextro adnexa Isauria, pari sorte uberi palmite viget et frugibus minutis, quam mediam navigabile flumen Calycadnus interscindit.', '<p>Superatis Tauri montis verticibus qui ad solis ortum sublimius attolluntur, Cilicia spatiis porrigitur late distentis dives bonis omnibus terra, eiusque lateri dextro adnexa Isauria, pari sorte uberi palmite viget et frugibus minutis, quam mediam navigabile flumen Calycadnus interscindit.Superatis Tauri montis verticibus qui ad solis ortum sublimius attolluntur, Cilicia spatiis porrigitur late distentis dives bonis omnibus terra, eiusque lateri dextro adnexa Isauria, pari sorte uberi palmite viget et frugibus minutis, quam mediam navigabile flumen Calycadnus interscindit.Superatis Tauri montis verticibus qui ad solis ortum sublimius attolluntur, Cilicia spatiis porrigitur late distentis dives bonis omnibus terra, eiusque lateri dextro adnexa Isauria, pari sorte uberi palmite viget et frugibus minutis, quam mediam navigabile flumen Calycadnus interscindit.Superatis Tauri montis verticibus qui ad solis ortum sublimius attolluntur, Cilicia spatiis porrigitur late distentis dives bonis omnibus terra, eiusque lateri dextro adnexa Isauria, pari sorte uberi palmite viget et frugibus minutis, quam mediam navigabile flumen Calycadnus interscindit.Superatis Tauri montis verticibus qui ad solis ortum sublimius attolluntur, Cilicia spatiis porrigitur late distentis dives bonis omnibus terra, eiusque lateri dextro adnexa Isauria, pari sorte uberi palmite viget et frugibus minutis, quam mediam navigabile flumen Calycadnus interscindit.Superatis Tauri montis verticibus qui ad solis ortum sublimius attolluntur, Cilicia spatiis porrigitur late distentis dives bonis omnibus terra, eiusque lateri dextro adnexa Isauria, pari sorte uberi palmite viget et frugibus minutis, quam mediam navigabile flumen Calycadnus interscindit.</p>'),
(75, 13, 3, 'mg sdfsd sdf', 'mg. Description .sdfsd sdf', 'mg. Content .sdfsd sdf'),
(76, 13, 4, 'it sdfsd sdf', 'it. Description .sdfsd sdf', 'it. Content .sdfsd sdf'),
(77, 13, 5, 'es sdfsd sdf', 'es. Description .sdfsd sdf', 'es. Content .sdfsd sdf'),
(78, 13, 6, 'de sdfsd sdf', 'de. Description .sdfsd sdf', 'de. Content .sdfsd sdf'),
(79, 14, 1, 'fr llis ultricies. Nam', 'fr. Description .llis ultricies. Nam', 'fr. Content .llis ultricies. Nam'),
(80, 14, 2, 'en llis ultricies. Nam', 'en. Description .llis ultricies. Nam', 'en. Content .llis ultricies. Nam'),
(81, 14, 3, 'mg llis ultricies. Nam', 'mg. Description .llis ultricies. Nam', 'mg. Content .llis ultricies. Nam'),
(82, 14, 4, 'it llis ultricies. Nam', 'it. Description .llis ultricies. Nam', 'it. Content .llis ultricies. Nam'),
(83, 14, 5, 'es llis ultricies. Nam', 'es. Description .llis ultricies. Nam', 'es. Content .llis ultricies. Nam'),
(84, 14, 6, 'de llis ultricies. Nam', 'de. Description .llis ultricies. Nam', 'de. Content .llis ultricies. Nam'),
(85, 15, 1, 'Ouverture de la formation : economie et developpement', 'Depuis sa création en 2008, l’Université ACEEM est une université riche en diversité culturelle et sociale de part ses étudiants cosmopolites. Après différents études de besoins, l’Université a décidé d’ouvrir une nouvelle formation, la Mention Economie et Développement. Cette nouvelle formation, tout aussi enrichissante et intéressante que la Gestion, la Communication, le Droit, l’Informatique-Electronique et les Sciences de la Santé, a pour objectif de former des Economistes experts œuvrant au sein des ONG nationales et internationales, des institutions financières et compagnies d’assurances, des institutions de développement rural et territorial, des institutions de développement socio-économique, des entreprises et multinationales.', '<p style="text-align: justify;">Depuis sa cr&eacute;ation en 2008, l&rsquo;Universit&eacute; ACEEM est une universit&eacute; riche en diversit&eacute; culturelle et sociale de part ses &eacute;tudiants cosmopolites. Apr&egrave;s diff&eacute;rents &eacute;tudes de besoins, l&rsquo;Universit&eacute; a d&eacute;cid&eacute; d&rsquo;ouvrir une nouvelle formation, la Mention Economie et D&eacute;veloppement. Cette nouvelle formation, tout aussi enrichissante et int&eacute;ressante que la Gestion, la Communication, le Droit, l&rsquo;Informatique-Electronique et les Sciences de la Sant&eacute;, a pour objectif de former des Economistes experts &oelig;uvrant au sein des ONG nationales et internationales, des institutions financi&egrave;res et compagnies d&rsquo;assurances, des institutions de d&eacute;veloppement rural et territorial, des institutions de d&eacute;veloppement socio-&eacute;conomique, des entreprises et multinationales. Pour int&eacute;grer la formation en niveau L1, les candidats doivent &ecirc;tre titulaires d&rsquo;un baccalaur&eacute;at (toutes les diverses s&eacute;ries sont admises). Nos formations suivent le syst&egrave;me LMD, ainsi les sanctions pour chaque cycle de formation sont respectivement : LICENCE &ndash; MASTER - DOCTORAT<br /><br />Les PARCOURS que nous disposons sont:<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Economie publique (&eacute;conomie du d&eacute;veloppement rural et&nbsp; &eacute;conomie de collectivit&eacute; territoriale)<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Economie de d&eacute;veloppement des Entreprises (d&eacute;veloppement durable et RSE, gestion de projet de d&eacute;veloppement)<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Banque, finances et assurances (techniques bancaires et assurances, &eacute;conomie et finance internationale).<br />Les inscriptions pour le concours d&rsquo;entr&eacute;e en L1 (premi&egrave;re ann&eacute;e) sont ouvertes.</p>'),
(86, 15, 2, 'Ouverture de la formation : economie et developpement', 'Depuis sa création en 2008, l’Université ACEEM est une université riche en diversité culturelle et sociale de part ses étudiants cosmopolites. Après différents études de besoins, l’Université a décidé d’ouvrir une nouvelle formation, la Mention Economie et Développement. Cette nouvelle formation, tout aussi enrichissante et intéressante que la Gestion, la Communication, le Droit, l’Informatique-Electronique et les Sciences de la Santé, a pour objectif de former des Economistes experts œuvrant au sein des ONG nationales et internationales, des institutions financières et compagnies d’assurances, des institutions de développement rural et territorial, des institutions de développement socio-économique, des entreprises et multinationales.', '<p style="text-align: justify;">Depuis sa cr&eacute;ation en 2008, l&rsquo;Universit&eacute; ACEEM est une universit&eacute; riche en diversit&eacute; culturelle et sociale de part ses &eacute;tudiants cosmopolites. Apr&egrave;s diff&eacute;rents &eacute;tudes de besoins, l&rsquo;Universit&eacute; a d&eacute;cid&eacute; d&rsquo;ouvrir une nouvelle formation, la Mention Economie et D&eacute;veloppement. Cette nouvelle formation, tout aussi enrichissante et int&eacute;ressante que la Gestion, la Communication, le Droit, l&rsquo;Informatique-Electronique et les Sciences de la Sant&eacute;, a pour objectif de former des Economistes experts &oelig;uvrant au sein des ONG nationales et internationales, des institutions financi&egrave;res et compagnies d&rsquo;assurances, des institutions de d&eacute;veloppement rural et territorial, des institutions de d&eacute;veloppement socio-&eacute;conomique, des entreprises et multinationales. Pour int&eacute;grer la formation en niveau L1, les candidats doivent &ecirc;tre titulaires d&rsquo;un baccalaur&eacute;at (toutes les diverses s&eacute;ries sont admises). Nos formations suivent le syst&egrave;me LMD, ainsi les sanctions pour chaque cycle de formation sont respectivement : LICENCE &ndash; MASTER - DOCTORAT<br /><br />Les PARCOURS que nous disposons sont:<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Economie publique (&eacute;conomie du d&eacute;veloppement rural et&nbsp; &eacute;conomie de collectivit&eacute; territoriale)<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Economie de d&eacute;veloppement des Entreprises (d&eacute;veloppement durable et RSE, gestion de projet de d&eacute;veloppement)<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Banque, finances et assurances (techniques bancaires et assurances, &eacute;conomie et finance internationale).<br />Les inscriptions pour le concours d&rsquo;entr&eacute;e en L1 (premi&egrave;re ann&eacute;e) sont ouvertes.</p>'),
(87, 15, 3, 'Ouverture de la formation : economie et developpement', 'Depuis sa création en 2008, l’Université ACEEM est une université riche en diversité culturelle et sociale de part ses étudiants cosmopolites. Après différents études de besoins, l’Université a décidé d’ouvrir une nouvelle formation, la Mention Economie et Développement. Cette nouvelle formation, tout aussi enrichissante et intéressante que la Gestion, la Communication, le Droit, l’Informatique-Electronique et les Sciences de la Santé, a pour objectif de former des Economistes experts œuvrant au sein des ONG nationales et internationales, des institutions financières et compagnies d’assurances, des institutions de développement rural et territorial, des institutions de développement socio-économique, des entreprises et multinationales.', '<p style="text-align: justify;">Depuis sa cr&eacute;ation en 2008, l&rsquo;Universit&eacute; ACEEM est une universit&eacute; riche en diversit&eacute; culturelle et sociale de part ses &eacute;tudiants cosmopolites. Apr&egrave;s diff&eacute;rents &eacute;tudes de besoins, l&rsquo;Universit&eacute; a d&eacute;cid&eacute; d&rsquo;ouvrir une nouvelle formation, la Mention Economie et D&eacute;veloppement. Cette nouvelle formation, tout aussi enrichissante et int&eacute;ressante que la Gestion, la Communication, le Droit, l&rsquo;Informatique-Electronique et les Sciences de la Sant&eacute;, a pour objectif de former des Economistes experts &oelig;uvrant au sein des ONG nationales et internationales, des institutions financi&egrave;res et compagnies d&rsquo;assurances, des institutions de d&eacute;veloppement rural et territorial, des institutions de d&eacute;veloppement socio-&eacute;conomique, des entreprises et multinationales. Pour int&eacute;grer la formation en niveau L1, les candidats doivent &ecirc;tre titulaires d&rsquo;un baccalaur&eacute;at (toutes les diverses s&eacute;ries sont admises). Nos formations suivent le syst&egrave;me LMD, ainsi les sanctions pour chaque cycle de formation sont respectivement : LICENCE &ndash; MASTER - DOCTORAT<br /><br />Les PARCOURS que nous disposons sont:<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Economie publique (&eacute;conomie du d&eacute;veloppement rural et&nbsp; &eacute;conomie de collectivit&eacute; territoriale)<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Economie de d&eacute;veloppement des Entreprises (d&eacute;veloppement durable et RSE, gestion de projet de d&eacute;veloppement)<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Banque, finances et assurances (techniques bancaires et assurances, &eacute;conomie et finance internationale).<br />Les inscriptions pour le concours d&rsquo;entr&eacute;e en L1 (premi&egrave;re ann&eacute;e) sont ouvertes.</p>'),
(88, 15, 4, 'Ouverture de la formation : economie et developpement', 'Depuis sa création en 2008, l’Université ACEEM est une université riche en diversité culturelle et sociale de part ses étudiants cosmopolites. Après différents études de besoins, l’Université a décidé d’ouvrir une nouvelle formation, la Mention Economie et Développement. Cette nouvelle formation, tout aussi enrichissante et intéressante que la Gestion, la Communication, le Droit, l’Informatique-Electronique et les Sciences de la Santé, a pour objectif de former des Economistes experts œuvrant au sein des ONG nationales et internationales, des institutions financières et compagnies d’assurances, des institutions de développement rural et territorial, des institutions de développement socio-économique, des entreprises et multinationales.', '<p style="text-align: justify;">Depuis sa cr&eacute;ation en 2008, l&rsquo;Universit&eacute; ACEEM est une universit&eacute; riche en diversit&eacute; culturelle et sociale de part ses &eacute;tudiants cosmopolites. Apr&egrave;s diff&eacute;rents &eacute;tudes de besoins, l&rsquo;Universit&eacute; a d&eacute;cid&eacute; d&rsquo;ouvrir une nouvelle formation, la Mention Economie et D&eacute;veloppement. Cette nouvelle formation, tout aussi enrichissante et int&eacute;ressante que la Gestion, la Communication, le Droit, l&rsquo;Informatique-Electronique et les Sciences de la Sant&eacute;, a pour objectif de former des Economistes experts &oelig;uvrant au sein des ONG nationales et internationales, des institutions financi&egrave;res et compagnies d&rsquo;assurances, des institutions de d&eacute;veloppement rural et territorial, des institutions de d&eacute;veloppement socio-&eacute;conomique, des entreprises et multinationales. Pour int&eacute;grer la formation en niveau L1, les candidats doivent &ecirc;tre titulaires d&rsquo;un baccalaur&eacute;at (toutes les diverses s&eacute;ries sont admises). Nos formations suivent le syst&egrave;me LMD, ainsi les sanctions pour chaque cycle de formation sont respectivement : LICENCE &ndash; MASTER - DOCTORAT<br /><br />Les PARCOURS que nous disposons sont:<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Economie publique (&eacute;conomie du d&eacute;veloppement rural et&nbsp; &eacute;conomie de collectivit&eacute; territoriale)<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Economie de d&eacute;veloppement des Entreprises (d&eacute;veloppement durable et RSE, gestion de projet de d&eacute;veloppement)<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Banque, finances et assurances (techniques bancaires et assurances, &eacute;conomie et finance internationale).<br />Les inscriptions pour le concours d&rsquo;entr&eacute;e en L1 (premi&egrave;re ann&eacute;e) sont ouvertes.</p>'),
(89, 15, 5, 'Ouverture de la formation : economie et developpement', 'Depuis sa création en 2008, l’Université ACEEM est une université riche en diversité culturelle et sociale de part ses étudiants cosmopolites. Après différents études de besoins, l’Université a décidé d’ouvrir une nouvelle formation, la Mention Economie et Développement. Cette nouvelle formation, tout aussi enrichissante et intéressante que la Gestion, la Communication, le Droit, l’Informatique-Electronique et les Sciences de la Santé, a pour objectif de former des Economistes experts œuvrant au sein des ONG nationales et internationales, des institutions financières et compagnies d’assurances, des institutions de développement rural et territorial, des institutions de développement socio-économique, des entreprises et multinationales.', '<p>Depuis sa cr&eacute;ation en 2008, l&rsquo;Universit&eacute; ACEEM est une universit&eacute; riche en diversit&eacute; culturelle et sociale de part ses &eacute;tudiants cosmopolites. Apr&egrave;s diff&eacute;rents &eacute;tudes de besoins, l&rsquo;Universit&eacute; a d&eacute;cid&eacute; d&rsquo;ouvrir une nouvelle formation, la Mention Economie et D&eacute;veloppement. Cette nouvelle formation, tout aussi enrichissante et int&eacute;ressante que la Gestion, la Communication, le Droit, l&rsquo;Informatique-Electronique et les Sciences de la Sant&eacute;, a pour objectif de former des Economistes experts &oelig;uvrant au sein des ONG nationales et internationales, des institutions financi&egrave;res et compagnies d&rsquo;assurances, des institutions de d&eacute;veloppement rural et territorial, des institutions de d&eacute;veloppement socio-&eacute;conomique, des entreprises et multinationales. Pour int&eacute;grer la formation en niveau L1, les candidats doivent &ecirc;tre titulaires d&rsquo;un baccalaur&eacute;at (toutes les diverses s&eacute;ries sont admises). Nos formations suivent le syst&egrave;me LMD, ainsi les sanctions pour chaque cycle de formation sont respectivement : LICENCE &ndash; MASTER - DOCTORAT<br /><br />Les PARCOURS que nous disposons sont:<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Economie publique (&eacute;conomie du d&eacute;veloppement rural et&nbsp; &eacute;conomie de collectivit&eacute; territoriale)<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Economie de d&eacute;veloppement des Entreprises (d&eacute;veloppement durable et RSE, gestion de projet de d&eacute;veloppement)<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Banque, finances et assurances (techniques bancaires et assurances, &eacute;conomie et finance internationale).<br />Les inscriptions pour le concours d&rsquo;entr&eacute;e en L1 (premi&egrave;re ann&eacute;e) sont ouvertes.</p>'),
(90, 15, 6, 'Ouverture de la formation : economie et developpement', 'Depuis sa création en 2008, l’Université ACEEM est une université riche en diversité culturelle et sociale de part ses étudiants cosmopolites. Après différents études de besoins, l’Université a décidé d’ouvrir une nouvelle formation, la Mention Economie et Développement. Cette nouvelle formation, tout aussi enrichissante et intéressante que la Gestion, la Communication, le Droit, l’Informatique-Electronique et les Sciences de la Santé, a pour objectif de former des Economistes experts œuvrant au sein des ONG nationales et internationales, des institutions financières et compagnies d’assurances, des institutions de développement rural et territorial, des institutions de développement socio-économique, des entreprises et multinationales.', '<p>Depuis sa cr&eacute;ation en 2008, l&rsquo;Universit&eacute; ACEEM est une universit&eacute; riche en diversit&eacute; culturelle et sociale de part ses &eacute;tudiants cosmopolites. Apr&egrave;s diff&eacute;rents &eacute;tudes de besoins, l&rsquo;Universit&eacute; a d&eacute;cid&eacute; d&rsquo;ouvrir une nouvelle formation, la Mention Economie et D&eacute;veloppement. Cette nouvelle formation, tout aussi enrichissante et int&eacute;ressante que la Gestion, la Communication, le Droit, l&rsquo;Informatique-Electronique et les Sciences de la Sant&eacute;, a pour objectif de former des Economistes experts &oelig;uvrant au sein des ONG nationales et internationales, des institutions financi&egrave;res et compagnies d&rsquo;assurances, des institutions de d&eacute;veloppement rural et territorial, des institutions de d&eacute;veloppement socio-&eacute;conomique, des entreprises et multinationales. Pour int&eacute;grer la formation en niveau L1, les candidats doivent &ecirc;tre titulaires d&rsquo;un baccalaur&eacute;at (toutes les diverses s&eacute;ries sont admises). Nos formations suivent le syst&egrave;me LMD, ainsi les sanctions pour chaque cycle de formation sont respectivement : LICENCE &ndash; MASTER - DOCTORAT<br /><br />Les PARCOURS que nous disposons sont:<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Economie publique (&eacute;conomie du d&eacute;veloppement rural et&nbsp; &eacute;conomie de collectivit&eacute; territoriale)<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Economie de d&eacute;veloppement des Entreprises (d&eacute;veloppement durable et RSE, gestion de projet de d&eacute;veloppement)<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Banque, finances et assurances (techniques bancaires et assurances, &eacute;conomie et finance internationale).<br />Les inscriptions pour le concours d&rsquo;entr&eacute;e en L1 (premi&egrave;re ann&eacute;e) sont ouvertes.</p>'),
(91, 16, 1, 'fr category', 'fr. Description .category', 'fr. Content .category'),
(92, 16, 2, 'en category', 'en. Description .category', 'en. Content .category'),
(93, 16, 3, 'mg category', 'mg. Description .category', 'mg. Content .category'),
(94, 16, 4, 'it category', 'it. Description .category', 'it. Content .category'),
(95, 16, 5, 'es category', 'es. Description .category', 'es. Content .category'),
(96, 16, 6, 'de category', 'de. Description .category', 'de. Content .category'),
(97, 17, 1, 'fr pt', 'fr. Description .pt', 'fr. Content .pt'),
(98, 17, 2, 'en pt', 'en. Description .pt', 'en. Content .pt'),
(99, 17, 3, 'mg pt', 'mg. Description .pt', 'mg. Content .pt'),
(100, 17, 4, 'it pt', 'it. Description .pt', 'it. Content .pt'),
(101, 17, 5, 'es pt', 'es. Description .pt', 'es. Content .pt'),
(102, 17, 6, 'de pt', 'de. Description .pt', 'de. Content .pt');

-- --------------------------------------------------------

--
-- Structure de la table `et_event`
--

CREATE TABLE `et_event` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `fm_message`
--

CREATE TABLE `fm_message` (
  `id` int(11) NOT NULL,
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `subject_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `fm_message`
--

INSERT INTO `fm_message` (`id`, `message`, `subject_id`, `user_id`, `date`) VALUES
(19, 'Vivamus vitae scelerisque diam. Nullam vitae risus et lorem efficitur scelerisque quis eget felis.\n Curabitur non tellus dui. Duis blandit fringilla dolor non feugiat. Proin faucibus vel magna vel luctus. \nInteger sem mauris, luctus quis efficitur id, accumsan vitae nisi. Phasellus et neque sed tellus pharetra aliquam. \n\nAenean hendrerit, libero eget porttitor interdum, orci lorem pulvinar nunc, id dignissim nunc ligula ac magna. Fusce vel leo sit amet lacus posuere hendrerit. Sed euismod faucibus diam quis iaculis. Integer et sodales ante.', 9, 2, '2017-04-13 07:48:28'),
(20, 'Vivamus vitae scelerisque diam. Nullam vitae risus et lorem efficitur scelerisque quis eget felis. Curabitur non tellus dui. Duis blandit fringilla dolor non feugiat. Proin faucibus vel magna vel luctus. Integer sem mauris,\n luctus quis efficitur id, accumsan vitae nisi. Phasellus et neque sed tellus pharetra aliquam. Aenean hendrerit, libero eget porttitor interdum, orci lorem pulvinar nunc, id dignissim nunc ligula ac magna. Fusce vel leo sit amet lacus posuere hendrerit. \nSed euismod faucibus diam quis iaculis. Integer et sodales ante.', 10, 2, '2017-04-13 08:02:48'),
(21, 'Aenean hendrerit, libero eget porttitor interdum, orci lorem pulvinar nunc, id dignissim nunc ligula ac magna. Fusce vel leo sit amet lacus posuere hendrerit. Sed euismod faucibus diam quis iaculis. Integer et sodales ante.', 11, 3, '2017-04-13 08:40:25'),
(22, 'Aenean hendrerit, \nlibero eget porttitor interdum, orci lorem pulvinar nunc, id dignissim nunc ligula ac magna. Fusce vel leo sit amet lacus posuere hendrerit. Sed euismod faucibus diam quis iaculis. \nInteger et sodales ante.', 10, 3, '2017-04-13 08:49:08'),
(23, 'dui. Duis blandit fringilla dolor non feugiat. Proin faucibus vel magna vel luctus.\nInteger sem mauris, luctus quis efficit', 9, 3, '2017-04-13 11:00:15'),
(24, 'uis blandit fringilla dolor non feugiat. Proin faucibus vel magna vel luctus.\nInteger sem mauris, luctus quis efficitur id, ac', 9, 1, '2017-04-13 11:41:22'),
(25, 'Tout d''abord, rappelons le cas d''utilisation principal de ces jointures. C''est surtout lorsque vous bouclez sur une liste d''entités A (par exemple des annonces), et que dans cette boucle vous', 12, 1, '2017-04-13 13:22:30'),
(26, 'Aenean auctor imperdiet augue, non vestibulum urna sollicitudin in. Phasellus a sapien lorem. Duis condimentum elit eu gravida pellentesque. Maecenas rutrum neque eget tellus consectetur blandit. Cras et mauris nec mauris accumsan vehicula cursus non elit. Vivamus eleifend mauris et sollicitudin varius. Donec eu metus erat. Etiam nec sem rhoncus, elementum enim sed, lacinia risus. Phasellus neque massa, mattis non scelerisque aliquet, rhoncus vel massa. Vestibulum volutpat accumsan facilisis. Maecenas sagittis eu magna eu malesuada. Quisque tincidunt felis a sem mollis, at mattis sapien viverra. Nulla nibh justo, lacinia non quam a, dignissim sagittis lectus. Phasellus vitae lacus consequat, dictum massa vitae, maximus quam.\n\nNam auctor risus et dolor viverra placerat. Aenean non ligula non lorem dapibus finibus. Donec est urna, dapibus sed nisi ac, placerat ullamcorper diam. In tempor, augue ac suscipit rhoncus, lorem ligula euismod mi, a facilisis urna felis ac est. Proin ut vestibulum lacus. Donec sed gravida libero. Vivamus ac felis non nisl lobortis varius. Vivamus in dictum ex, eu fringilla tellus. Quisque eget lorem justo. Donec maximus dolor ut neque mattis, at aliquam ante aliquet. Nunc ipsum ante, facilisis quis ante eu, venenatis lobortis quam.\n\nNullam vulputate pharetra libero, vitae viverra urna. Nam sit amet urna eu sem eleifend sollicitudin vitae nec lacus. Aenean sodales justo arcu, ut imperdiet ante pulvinar et. Phasellus eget nisl ut libero ultrices dictum. Morbi nec tristique libero. In ullamcorper justo nisi. Sed imperdiet leo magna, nec posuere massa semper vel. Cras sit amet bibendum orci. Curabitur iaculis purus at mauris dictum dapibus. Curabitur sed tortor velit.', 13, 1, '2017-04-13 13:25:10'),
(27, 'Phasellus et neque sed tellus pharetra aliquam.\n Aenean hendrerit, libero eget porttitor interdum, orci lorem pulvinar nunc, id dignissim nunc ligula ac magna. Fusce vel leo sit amet lacus posuere hendrerit.\nSed euismod faucibus diam quis iaculis. Integer et sodales ante.', 10, 2, '2017-04-13 14:12:35'),
(28, 'en Nam ultrices nibh sapienen Nam ultrices nibh sapienen Nam ultrices nibh sapienen Nam ultrices nibh sapienen Nam ultrices nibh sapienen Nam ultrices nibh sapien\nen Nam ultrices nibh sapienen Nam ultrices nibh sapienen Nam ultrices nibh sapienen Nam ultrices nibh sapien\nen Nam ultrices nibh sapienen Nam ultrices nibh sapienen Nam ultrices nibh sapienen Nam ultrices nibh sapienen Nam ultrices nibh sapienen Nam ultrices nibh sapienen Nam ultrices nibh sapienen Nam ultrices nibh sapien\nen Nam ultrices nibh sapienen Nam ultrices nibh sapien\nen Nam ultrices nibh sapienen Nam ultrices nibh sapienen Nam ultrices nibh sapienen Nam ultrices nibh sapien', 14, 1, '2017-04-14 16:21:41'),
(29, 'Integer sem mauris, luctus quis efficitur id, accumsan vitae nisi. Phasellus et neque sed tellus pharetra aliquam.\n\nAenean hendrerit, libero eget porttitor interdum, orci lorem pulvinar nunc, id dignissim nunc ligula ac magna. Fusce vel leo sit amet lacus posuere hendrerit. Sed euismod faucibus diam quis iaculis. Integer et sodales ante.', 9, 1, '2017-04-18 12:57:16'),
(30, 'Vestibulum a dui quis odio facilisis euismod commodo at neque. Duis facilisis hendrerit tortor. \nSed eget neque congue, scelerisque eros a, tincidunt nibh. Mauris blandit erat sit amet sapien maximus mattis non ac magna. \n\nPellentesque facilisis arcu nisl, in dictum ligula rutrum bibendum. Sed pulvinar nunc id urna finibus accumsan. \nCras id luctus ex, quis ornare quam. Ut efficitur justo enim, ut tempus ante varius quis. Integer ante lacus, dapibus vel nisi et, molestie molestie neque. Vivamus ornare luctus elementum. Nulla quis sem pellentesque, aliquet diam sit amet, suscipit lorem. In mollis sapien id tincidunt finibus.', 12, 6, '2017-04-19 08:02:17'),
(31, 'Maecenas sit amet fringilla enim. Donec vitae mi id tellus fermentum euismod nec in odio. Cras quam nisi, facilisis eget blandit quis, porttitor id purus. Etiam ultrices nunc at diam varius, sed rutrum ante laoreet. Mauris leo libero, egestas id mi a, sodales finibus lorem. Fusce cursus ac sapien a tincidunt. \n\nQuisque ac diam sollicitudin, commodo lectus at, semper est. Praesent et libero augue. \nPraesent placerat quam enim, et ornare odio consequat porttitor. In aliquam condimentum sem, sed mattis ligula bibendum sed. In lectus lectus, accumsan eu libero sed, vehicula condimentum justo. Curabitur ut ultricies urna, vel laoreet dolor. \n\nSed a ex dictum, efficitur ipsum eget, porttitor tellus. Nulla in leo a est euismod volutpat accumsan sit amet mi.', 15, 6, '2017-04-19 12:28:52'),
(32, 'Phasellus vitae lorem id felis congue accumsan. Vestibulum dapibus nisl id lectus fringilla, quis semper eros volutpat. \nCras mollis nec nibh vel lobortis. Phasellus nec ex vel dui sagittis ultricies id nec nulla. Fusce vulputate erat ligula, \n\nnon imperdiet ante aliquam non. Pellentesque tristique, sapien nec dignissim porta, \nlibero eros porta nulla, tincidunt facilisis risus ligula sed orci. Proin augue augue, iaculis et lorem sit amet, mollis rhoncus augue. \n\nQuisque posuere libero eget gravida imperdiet. Proin venenatis non massa vitae sagittis. Nunc nulla diam, sodales nec elit vitae, dignissim faucibus orci. Morbi congue mollis tellus non viverra.', 9, 7, '2017-04-19 12:33:48'),
(33, 'Cras quis velit sed ipsum blandit sollicitudin. Etiam vel congue mi, non fermentum libero. Donec volutpat lobortis nisl non cursus. Suspendisse nec pharetra ex. Pellentesque et urna aliquet, sagittis justo ut, pellentesque justo. \nAenean dignissim mollis tellus non aliquam. Donec nec orci in tortor elementum congue in ut odio. Ut laoreet malesuada quam nec elementum. Vivamus congue magna erat, vel sodales nulla tincidunt nec. \n\nEtiam lacinia ut libero nec tempus. Donec convallis tortor eget dictum rutrum. Mauris faucibus nisi eu tempor hendrerit. Quisque feugiat massa sem, non condimentum sem posuere at. Sed consequat placerat est, ac feugiat tortor scelerisque in. Aenean eget felis non massa sollicitudin tristique quis non nisl.', 11, 10, '2017-04-19 13:00:45'),
(34, 'Ut fringilla dolor hendrerit tempus varius. Donec arcu tortor, ullamcorper eget vestibulum nec, convallis eget nisi. Cras in mollis nisi, vel accumsan turpis. Nulla tempor auctor metus vitae sodales. Pellentesque nec elit scelerisque, vehicula nibh ultrices, tincidunt dui. Aliquam erat volutpat. Sed posuere nisl sed pretium congue. Interdum et malesuada fames ac ante ipsum primis in faucibus.\n\nCras quis velit sed ipsum blandit sollicitudin. Etiam vel congue mi, non fermentum libero. Donec volutpat lobortis nisl non cursus. Suspendisse nec pharetra ex. Pellentesque et urna aliquet, sagittis justo ut, pellentesque justo. Aenean dignissim mollis tellus non aliquam. Donec nec orci in tortor elementum congue in ut odio. Ut laoreet malesuada quam nec elementum. Vivamus congue magna erat, vel sodales nulla tincidunt nec. \n\nEtiam lacinia ut libero nec tempus. Donec convallis tortor eget dictum rutrum. Mauris faucibus nisi eu tempor hendrerit. Quisque feugiat massa sem, non condimentum sem posuere at. Sed consequat placerat est, ac feugiat tortor scelerisque in. Aenean eget felis non massa sollicitudin tristique quis non nisl.', 16, 11, '2017-04-19 13:27:05'),
(35, 'Cras quis velit sed ipsum blandit sollicitudin. Etiam vel congue mi, non fermentum libero. Donec volutpat lobortis nisl non cursus. Suspendisse nec pharetra ex. Pellentesque et urna aliquet, sagittis justo ut, pellentesque justo.\n Aenean dignissim mollis tellus non aliquam. Donec nec orci in tortor elementum congue in ut odio. Ut laoreet malesuada quam nec elementum. Vivamus congue magna erat, vel sodales nulla tincidunt nec.\n\nEtiam lacinia ut libero nec tempus. Donec convallis tortor eget dictum rutrum. Mauris faucibus nisi eu tempor hendrerit. Quisque feugiat massa sem, non condimentum sem posuere at. Sed consequat placerat est, ac feugiat tortor scelerisque in. Aenean eget felis non massa sollicitudin tristique quis non nisl.', 9, 12, '2017-04-19 15:47:47'),
(36, 'Maecenas sit amet fringilla enim. Donec vitae mi id tellus fermentum euismod nec in odio. Cras quam nisi, facilisis eget blandit quis, porttitor id purus. Etiam ultrices nunc at diam varius, sed rutrum ante laoreet. Mauris leo libero, egestas id mi a, sodales finibus lorem.\n\n Fusce cursus ac sapien a tincidunt. Quisque ac diam sollicitudin, commodo lectus at, semper est. Praesent et libero augue. Praesent placerat quam enim, et ornare odio consequat porttitor. In aliquam condimentum sem, sed mattis ligula bibendum sed. In lectus lectus, accumsan eu libero sed, vehicula condimentum justo. Curabitur ut ultricies urna, vel laoreet dolor. Sed a ex dictum, efficitur ipsum eget, porttitor tellus. Nulla in leo a est euismod volutpat accumsan sit amet mi.', 10, 13, '2017-04-19 15:51:09'),
(37, 'Phasellus vitae lorem id felis congue accumsan. Vestibulum dapibus nisl id lectus fringilla, quis semper eros volutpat.\nCras mollis nec nibh vel lobortis. Phasellus nec ex vel dui sagittis ultricies id nec nulla. Fusce vulputate erat ligula,\n\nnon imperdiet ante aliquam non. Pellentesque tristique, sapien nec dignissim porta,\nlibero eros porta nulla, tincidunt facilisis risus ligula sed orci. Proin augue augue, iaculis et lorem sit amet, mollis rhoncus augue.\n\nQuisque posuere libero eget gravida imperdiet. Proin venenatis non massa vitae sagittis. Nunc nulla diam, sodales nec elit vitae, dignissim faucibus orci. Morbi congue mollis tellus non viverra.', 9, 8, '2017-04-20 12:18:42'),
(38, 'sfsdf sf sfsdf', 17, 1, '2017-04-26 11:57:56'),
(39, 'lorem ipsum dolor et sit amet. consecterum vi della maritiuslorem ipsum dolor et sit amet. consecterum vi della maritiuslorem ipsum dolor et sit amet. consecterum vi della maritiuslorem ipsum dolor et sit amet. consecterum vi della maritius', 18, 2, '2017-05-03 07:12:31'),
(40, 'Dans le panier proposer que les méthodes de livraison du restaurateur.\nSi on choisis Sur place ou à Emporter, les frais de port sont à 0€\n\nPouvoir gérer des délais de livraison par méthodeDans le panier proposer que les méthodes de livraison du restaurateur.\nSi on choisis Sur place ou à Emporter, les frais de port sont à 0€\n\nPouvoir gérer des délais de livraison par méthode', 19, 6, '2017-05-04 07:42:22'),
(41, 'ulla, tincidunt facilisis risus ligula sed orci. Proin augue augue, iaculis et lorem sit amet, mollis rhoncus augue.\n\nQuisque posuere libero eget gravida imperdiet. Proin venenatis non massa vitae sagittis. Nunc nulla diam, sodales nec elit vitae, dignissim faucibus orci. Morbi congue mollis tellus non viverra.', 9, 1, '2017-05-19 09:11:17'),
(42, 'sdfsfd\n\n\ndsfsdf', 9, 1, '2017-05-19 09:13:16'),
(43, 'sdfsdf', 9, 1, '2017-05-19 09:18:36'),
(44, 'frfdsfsd', 9, 1, '2017-05-19 09:21:03'),
(45, 'sdfsdf', 20, 1, '2017-05-19 09:30:30'),
(46, ', sed mattis ligula bibendum sed, sed mattis ligula bibendum sed, sed mattis ligula bibendum sed, sed mattis ligula bibendum sed, sed mattis ligula bibendum sed, sed mattis ligula bibendum sed', 21, 1, '2017-05-19 09:31:25'),
(47, 'sed mattis ligula bibendum sed, sed mattis liga bibendum sed, sed mattis ligula bibendum sed, sed mattis ligula bibendum sed, sed mattis ligula bibendum sed, sed mattis ligula bibendum sed, sed mattis ligula bibendula bibendum sed, sed mattis ligula bibendum sed, sed mattis ligula bibendum sed, sed mattis ligula bibendum sed, sed mattis ligula bibenda bibendum sa bibendum sed, sed mattis ligula bibendum sed, sed mattis ligula bibendum sed, sed mattis ligula bibendum sed, sed mattis ligula bibendum sed, sed mattis ligula bibenda bibendum sed, sed mattis ligula bibendum sed, sed mattis ligula bibendum sed, sed mattis ligula bibendum sed, sed mattis ligula bibendum sed, sed mattis ligula bibendva bibendum sed, sed mattis ligula bibendum sed, sed mattis ligula bibendum sed, sed mattis ligula bibendum sed, sed mattis ligula bibendum sed, sed mattis ligula bibendea bibendum sed, sed mattis ligula bibendum sed, sed mattis ligula bibendum sed, sed mattis ligula bibendum sed, sed mattis ligula bibendum sed, sed mattis ligula bibendd, sed mattis ligula bibendum sed, sed mata bibendum sed, sed mattis ligula bibena bibendum sed, sed mattis ligula bibendum sed, sed mattis ligula bibendum sed, sed mattis ligula bibendum sed, sed mata bibendum sed, sed mattis ligula bibendum sed, sed mattis ligula bibendum sed, sed mattis ligula bibendum sed, sed mattis ligula bibendum sed, sed mattis ligula bibendtis ligula bibendum sed, sed mattis ligula bibenddum sed, sed mattis ligula bibendum sed, sed mattis ligula bibendum sed, sed mattis ligula bibendum sed, sed mattis ligula bibendtis ligula bibendum sed, sed mattis ligula bibendum sed, sed mattis ligula bibendum sed', 21, 1, '2017-05-19 09:34:50'),
(48, 'non. Pellentesque tristique, sapien nec dignissim porta,\nlibero eros porta nulla, tincidunt  non. Pellentesque tristique, sapien nec dignissim porta,\nlibero eros porta nulla, tincidunt', 9, 11, '2017-05-22 11:16:06'),
(49, 'lorem ipsum', 9, 1, '2017-05-23 14:48:02'),
(50, 'cursus loream aleator ixusis dolisaumcursus loream aleator ixusis dolisaumcursus loream aleator ixusis dolisaum', 22, 4, '2017-05-24 07:04:31'),
(51, 'cursus loream aleator ixusis dolisaumcursus loream aleator ixusis dolisaumcursus loream aleator ixusis dolisaumcursus loream aleator ixusis dolisaumv', 22, 4, '2017-05-24 07:04:57'),
(52, 'dfgdfg', 9, 2, '2017-05-29 14:25:27'),
(53, 'fsdfsdf', 9, 2, '2017-05-29 14:26:12'),
(54, 'dsfsdf', 9, 2, '2017-05-29 14:26:38'),
(55, 'dfgdfg', 9, 2, '2017-05-29 14:27:45'),
(56, 'sdfsdf', 23, 2, '2017-06-09 10:18:23');

-- --------------------------------------------------------

--
-- Structure de la table `fm_subject`
--

CREATE TABLE `fm_subject` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `topic_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `fm_subject`
--

INSERT INTO `fm_subject` (`id`, `title`, `slug`, `topic_id`, `user_id`, `date`) VALUES
(9, 'libero eget porttitor interdum, orci lorem pulvinar nunc', 'libero-eget-porttitor-interdum-orci-lorem-pulvinar-nunc', 1, 2, '2017-04-13 07:48:28'),
(10, 'Vivamus vitae scelerisque diam', 'vivamus-vitae-scelerisque-diam', 2, 2, '2017-04-13 08:02:48'),
(11, 'Fusce vel leo sit amet lacus posuere hendrerit. Sed euismod faucibus diam quis iaculis. Integer et sodales ante', 'fusce-vel-leo-sit-amet-lacus-posuere-hendrerit-sed-euismod-faucibus-diam-quis-iaculis-integer-et-sodales-ante', 2, 3, '2017-04-13 08:40:25'),
(12, 'Tout d''abord', 'tout-d-abord', 1, 1, '2017-04-13 13:22:30'),
(13, 'Quisque eget lorem justo. Donec maximus dolor ut neque mattis, at aliquam ante aliquet', 'quisque-eget-lorem-justo-donec-maximus-dolor-ut-neque-mattis-at-aliquam-ante-aliquet', 5, 1, '2017-04-13 13:25:10'),
(14, 'en Nam ultrices nibh sapienen Nam ultrices nibh sapien', 'en-nam-ultrices-nibh-sapienen-nam-ultrices-nibh-sapien', 3, 1, '2017-04-14 16:21:41'),
(15, 'ornare odio consequat porttitor. In aliquam condimentum sem, sed mattis ligula bibendum sed', 'ornare-odio-consequat-porttitor-in-aliquam-condimentum-sem-sed-mattis-ligula-bibendum-sed', 6, 6, '2017-04-19 12:28:52'),
(16, 'pellentesque justo. Aenean dignissim mollis tellus non aliquam', 'pellentesque-justo-aenean-dignissim-mollis-tellus-non-aliquam', 4, 11, '2017-04-19 13:27:05'),
(17, 'fsdfsd', 'fsdfsd', 1, 1, '2017-04-26 11:57:56'),
(18, 'lorem ipsum dolor et sit amet. consecterum vi della maritius', 'lorem-ipsum-dolor-et-sit-amet-consecterum-vi-della-maritius', 1, 2, '2017-05-03 07:12:31'),
(19, 'Si on choisis Sur place ou à Emporter, les frais de port sont à 0€', 'si-on-choisis-sur-place-ou-a-emporter-les-frais-de-port-sont-a-0-euro', 1, 6, '2017-05-04 07:42:22'),
(20, 'sdfsdf', 'sdfsdf', 1, 1, '2017-05-19 09:30:30'),
(21, ', sed mattis ligula bibendum sed, sed mattis ligula bibendum sed', 'sed-mattis-ligula-bibendum-sed-sed-mattis-ligula-bibendum-sed', 6, 1, '2017-05-19 09:31:25'),
(22, 'cursus loream aleator ixusis dolisaum', 'cursus-loream-aleator-ixusis-dolisaum', 1, 4, '2017-05-24 07:04:31'),
(23, 'sdfsdf', 'sdfsdf', 1, 2, '2017-06-09 10:18:23');

-- --------------------------------------------------------

--
-- Structure de la table `fm_topic`
--

CREATE TABLE `fm_topic` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `default_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `fm_topic`
--

INSERT INTO `fm_topic` (`id`, `slug`, `default_name`, `user_id`) VALUES
(1, 'systeme', 'Système', 1),
(2, 'cursus-leo-tempus', 'cursus leo tempus', 1),
(3, 'nam-ultrices-nibh', 'Nam ultrices nibh sapien', 1),
(4, 'nullam-odio-nisl', 'Nullam odio nisl', 1),
(5, 'ut-scelerisque-arcu-odio', 'Ut scelerisque arcu odio', 3),
(6, 'vivamus-vitae-scelerisque-diam', 'Vivamus vitae scelerisque diam', 3);

-- --------------------------------------------------------

--
-- Structure de la table `fm_topic_illustration`
--

CREATE TABLE `fm_topic_illustration` (
  `id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `originalname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `current` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `fm_topic_illustration`
--

INSERT INTO `fm_topic_illustration` (`id`, `topic_id`, `name`, `path`, `originalname`, `current`) VALUES
(1, 1, 'ac.jpg', '8268f374590666f5662a78c27bffc307402e97d8.jpeg', 'ac.jpg', 0),
(2, 1, 'adly.jpg', '996b9e16e3870a840ab365c91f77974da8510462.jpeg', 'adly.jpg', 0),
(3, 1, 'alpine.jpg', 'c691548b86a0720dc8875b8d388e45a5e43c61cf.jpeg', 'alpine.jpg', 0),
(4, 1, 'hotchkiss.jpg', '35a927f2575ab695081bf459cc7821f74432e2f9.jpeg', 'hotchkiss.jpg', 0),
(5, 1, 'mz.jpg', 'b7aaab20ad2c6a669b2c14348b9144bcf2abe5a4.jpeg', 'mz.jpg', 1),
(6, 2, 'manet-korado.jpg', '267eb9aa6622a114d10ce6516f4c76dee3a8b4a2.jpeg', 'manet-korado.jpg', 1),
(7, 3, 'montesa.jpg', 'c8cf9b39837a4bf7b4df1f5238f235762707f398.jpeg', 'montesa.jpg', 1),
(8, 4, 'hrd.jpg', 'ea72207e807eaefd080fa9f73467a2afa8e14ed8.jpeg', 'hrd.jpg', 0),
(9, 5, 'proton.jpg', '692748497262ba4d9e3ec6bfeb50bef32b363913.jpeg', 'proton.jpg', 1),
(10, 6, 'sky-team.jpg', 'fb90fec4d8259d687b0c8edee45126b25e9a6dd3.jpeg', 'sky-team.jpg', 0),
(11, 4, 'zhongyu.jpg', 'bfb1eb257859794d2ff26d0b241794265c385cab.jpeg', 'zhongyu.jpg', 0),
(12, 4, 'tomos.jpg', '83d9040fb76bc4e65dd2e37c45fba67d5aa7606b.jpeg', 'tomos.jpg', 1),
(13, 6, 'morgan.jpg', '92150da8f849851e7274d2f0c24dac543ab2cb2c.jpeg', 'morgan.jpg', 1);

-- --------------------------------------------------------

--
-- Structure de la table `fm_topic_translate`
--

CREATE TABLE `fm_topic_translate` (
  `id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `locale_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `fm_topic_translate`
--

INSERT INTO `fm_topic_translate` (`id`, `topic_id`, `name`, `description`, `locale_id`) VALUES
(1, 1, 'Système', 'Sed eu interdum tortor, quis auctor quam. Donec facilisis leo in nisl vestibulum, sed ullamcorper nisl mollis. Maecenas euismod interdum magna at porttitor.', 1),
(2, 1, 'topic 1', 'topic 1', 3),
(3, 1, 'System', 'Sed eu interdum tortor, quis auctor quam. Donec facilisis leo in nisl vestibulum, sed ullamcorper nisl mollis. Maecenas euismod interdum magna at porttitor.', 2),
(4, 2, 'fr cursus leo tempus', 'Cras in eros mi. Phasellus finibus volutpat neque, at imperdiet velit. Ut eget purus lacus. Aliquam venenatis et erat et fermentum. In tincidunt, metus non convallis consequat, lacus risus rutrum dolor, id ullamcorper sapien nunc ac felis.', 1),
(5, 2, 'en cursus leo tempus', 'Cras in eros mi. Phasellus finibus volutpat neque, at imperdiet velit. Ut eget purus lacus. Aliquam venenatis et erat et fermentum. In tincidunt, metus non convallis consequat, lacus risus rutrum dolor, id ullamcorper sapien nunc ac felis.', 2),
(6, 2, 'mg cursus leo tempus', 'mg. Content .cursus leo tempus', 3),
(7, 2, 'it cursus leo tempus', 'it. Content .cursus leo tempus', 4),
(8, 2, 'es cursus leo tempus', 'es. Content .cursus leo tempus', 5),
(9, 2, 'de cursus leo tempus', 'de. Content .cursus leo tempus', 6),
(10, 3, 'fr Nam ultrices nibh sapien', 'Vivamus vitae scelerisque diam. Nullam vitae risus et lorem efficitur scelerisque quis eget felis. Curabitur non tellus dui. Duis blandit fringilla dolor non feugiat.', 1),
(11, 3, 'en Nam ultrices nibh sapien', 'Vivamus vitae scelerisque diam. Nullam vitae risus et lorem efficitur scelerisque quis eget felis. Curabitur non tellus dui. Duis blandit fringilla dolor non feugiat.', 2),
(12, 3, 'mg Nam ultrices nibh sapien', 'mg. Content .Nam ultrices nibh sapien', 3),
(13, 3, 'it Nam ultrices nibh sapien', 'it. Content .Nam ultrices nibh sapien', 4),
(14, 3, 'es Nam ultrices nibh sapien', 'es. Content .Nam ultrices nibh sapien', 5),
(15, 3, 'de Nam ultrices nibh sapien', 'de. Content .Nam ultrices nibh sapien', 6),
(16, 4, 'fr Nullam odio nisl', 'Mauris facilisis lacus ut nibh luctus, sit amet laoreet odio pretium. Mauris viverra, velit sit amet mollis tincidunt, erat augue venenatis nisi, non elementum dolor leo vel augue. Pellentesque tempor lorem id leo volutpat pulvinar. Ut scelerisque arcu odio', 1),
(17, 4, 'en Nullam odio nisl', 'Mauris facilisis lacus ut nibh luctus, sit amet laoreet odio pretium. Mauris viverra, velit sit amet mollis tincidunt, erat augue venenatis nisi, non elementum dolor leo vel augue. Pellentesque tempor lorem id leo volutpat pulvinar. Ut scelerisque arcu odio', 2),
(18, 4, 'mg Nullam odio nisl', 'mg. Content .Nullam odio nisl', 3),
(19, 4, 'it Nullam odio nisl', 'it. Content .Nullam odio nisl', 4),
(20, 4, 'es Nullam odio nisl', 'es. Content .Nullam odio nisl', 5),
(21, 4, 'de Nullam odio nisl', 'de. Content .Nullam odio nisl', 6),
(22, 5, 'Ut scelerisque arcu odio', 'erat augue venenatis nisi, non elementum dolor leo vel augue. Pellentesque tempor lorem id leo volutpat pulvinar.', 1),
(23, 5, 'Ut scelerisque arcu odio', 'erat augue venenatis nisi, non elementum dolor leo vel augue. Pellentesque tempor lorem id leo volutpat pulvinar.', 2),
(24, 5, 'mg Ut scelerisque arcu odio', 'mg. Content .Ut scelerisque arcu odio', 3),
(25, 5, 'it Ut scelerisque arcu odio', 'it. Content .Ut scelerisque arcu odio', 4),
(26, 5, 'es Ut scelerisque arcu odio', 'es. Content .Ut scelerisque arcu odio', 5),
(27, 5, 'de Ut scelerisque arcu odio', 'de. Content .Ut scelerisque arcu odio', 6),
(28, 6, 'Vivamus vitae scelerisque diam', 'Nullam vitae risus et lorem efficitur scelerisque quis eget felis. Curabitur non tellus dui. Duis blandit fringilla dolor non feugiat. Proin faucibus vel magna vel luctus. Integer sem mauris, luctus quis efficitur id, accumsan vitae nisi. Phasellus et neque sed tellus pharetra aliquam', 1),
(29, 6, 'Vivamus vitae scelerisque diam', 'Nullam vitae risus et lorem efficitur scelerisque quis eget felis. Curabitur non tellus dui. Duis blandit fringilla dolor non feugiat. Proin faucibus vel magna vel luctus. Integer sem mauris, luctus quis efficitur id, accumsan vitae nisi. Phasellus et neque sed tellus pharetra aliquam', 2),
(30, 6, 'mg Vivamus vitae scelerisque diam', 'mg. Content .Vivamus vitae scelerisque diam', 3),
(31, 6, 'it Vivamus vitae scelerisque diam', 'it. Content .Vivamus vitae scelerisque diam', 4),
(32, 6, 'es Vivamus vitae scelerisque diam', 'es. Content .Vivamus vitae scelerisque diam', 5),
(33, 6, 'de Vivamus vitae scelerisque diam', 'de. Content .Vivamus vitae scelerisque diam', 6),
(34, 1, 'systema', 'Sed eu interdum tortor, quis auctor quam. Donec facilisis leo in nisl vestibulum, sed ullamcorper nisl mollis. Maecenas euismod interdum magna at porttitor.', 4);

-- --------------------------------------------------------

--
-- Structure de la table `pm_advert_school`
--

CREATE TABLE `pm_advert_school` (
  `id` int(11) NOT NULL,
  `advert_id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_confirmation_id` int(11) DEFAULT NULL,
  `date` datetime NOT NULL,
  `confirmation` tinyint(1) NOT NULL,
  `date_confirmation` datetime DEFAULT NULL,
  `advert_to_school` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `pm_advert_school`
--

INSERT INTO `pm_advert_school` (`id`, `advert_id`, `school_id`, `user_id`, `user_confirmation_id`, `date`, `confirmation`, `date_confirmation`, `advert_to_school`) VALUES
(1, 1, 1, 1, 1, '2017-02-06 07:24:06', 1, '2017-02-06 07:24:06', 1),
(2, 3, 8, 1, 1, '2017-04-28 08:31:16', 1, '2017-04-28 08:31:16', 1),
(3, 3, 1, 1, 1, '2017-04-28 08:31:48', 1, '2017-04-28 08:31:48', 1),
(4, 5, 1, 1, 1, '2017-04-28 08:33:02', 1, '2017-04-28 08:33:02', 1),
(5, 2, 3, 1, 1, '2017-05-17 07:50:45', 1, '2017-05-17 07:50:45', 1),
(6, 5, 3, 1, 1, '2017-05-17 07:51:02', 1, '2017-05-17 07:51:02', 1),
(7, 1, 2, 4, 4, '2017-05-24 07:55:16', 1, '2017-05-24 07:55:16', 1),
(8, 4, 46, 2, 2, '2017-06-30 09:02:39', 1, '2017-06-30 09:02:39', 1);

-- --------------------------------------------------------

--
-- Structure de la table `pm_comment`
--

CREATE TABLE `pm_comment` (
  `id` int(11) NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `advert_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `pm_comment`
--

INSERT INTO `pm_comment` (`id`, `post_id`, `message`, `user_id`, `date`, `advert_id`) VALUES
(18, NULL, 'Non elementum dolor leoNon elementum dolor leo', 1, '2017-04-21 07:47:12', 3),
(19, NULL, 'Non elementum dolor leoNon elementum dolor leo\nNon elementum dolor leoNon elementum dolor leoNon elementum dolor leoNon elementum dolor leo', 1, '2017-04-21 07:48:15', 3),
(20, 1, 'Tandis que s''engager dans des études de comptabilité l''est beaucoup moins. La faute à l''image que l''on a des comptables et aux idées reçues qui traînent à leur sujet. A balayer de toute urgence.', 1, '2017-04-21 07:48:58', NULL),
(21, NULL, 'à souffrir d''une image un peu terne. Des idées souvent fausses à corriger d''urgence.\n\nFaire du webmarketing ou du management, c''est classe. Tandis que s''engager dans des études de comptabilité l''est beaucoup moins. La faute à l''image que l''on a des comptables et aux idées reçues qui traînent à leur sujet. A balayer de toute urgence.', 1, '2017-04-21 07:57:54', 1),
(22, NULL, 'Aenean ultricies posuere risus sit amet ultrices. Pellentesque tincidunt, justo egestas tincidunt condimentum, nisl mi viverra erat, posuere pharetra erat orci nec velit. Etiam egestas nunc id quam tempor, sed facilisis massa porttitor. \nPraesent molestie turpis quis risus dapibus commodo eget in enim. Nam pretium non magna a finibus. Curabitur aliquet pharetra elementum. Quisque porttitor fringilla tincidunt. Integer eu tellus vitae libero condimentum congue. Fusce id mauris nec eros bibendum bibendum.\n\nPraesent eu euismod nisl. Nunc sed egestas lectus, nec ultrices dui. Vestibulum iaculis pretium turpis quis fermentum. Maecenas et ipsum eu arcu sagittis efficitur sit amet non justo. Nunc non leo sit amet tellus pellentesque dignissim. \n\nPraesent massa magna, vestibulum ac imperdiet non, ullamcorper aliquet risus. Ut interdum risus libero, vitae volutpat tortor finibus sed. Sed a tincidunt ex. Ut eleifend ullamcorper mi, sit amet finibus mauris maximus eget. Maecenas vulputate urna nec urna ultricies, quis luctus risus gravida.', 3, '2017-04-21 08:04:58', 1),
(23, NULL, 'nascetur ridiculus mus. Duis maximus sem eu ex cursus, non mattis nulla maximus. Curabitur hendrerit luctus nibh, ut vulputate lorem posuere eu.\n\nNulla non laoreet felis. Aenean rutrum commodo arcu et cursus. Donec fermentum vulputate ex, at accumsan odio posuere sit amet. Vivamus condimentum quis tortor a sodales. Suspendisse aliquam elit massa, ut iaculis ex elementum a. Nam ac ultrices augue. Pellentesque feugiat pulvinar est, non cursus felis dapibus vel. Sed eleifend varius elit vel vulputate. \n\nEtiam quis ex lorem. Curabitur nec iaculis odio. Mauris tellus orci, finibus id ex quis, porttitor aliquet orci. Sed porttitor ipsum quis turpis ornare, quis condimentum leo bibendum. Fusce commodo, turpis eget eleifend luctus, quam elit porttitor mauris, ut vestibulum leo purus ut sapien. Etiam vel consequat mauris.', 3, '2017-04-21 08:12:35', 4),
(24, 1, 'voici un commentaire', 1, '2017-04-27 08:37:43', NULL),
(25, 4, 'Le commerce n''est pas un monstre et la publicité n’est pas un mal en soi. Mais ni l''un ni l''autre n’ont leur place ici. Nous n''en voulons pas sur Wikipédia.\n\nWikipédia est un outil particulier. À la manière d''une bibliothèque ou d''un jardin public, il s''agit d''un refuge pour l’esprit. C’est un endroit que chacun peut visiter pour l''aider dans sa réflexion, y apprendre ou partager ses connaissances.\n\nEn fondant Wikipédia, j’aurais pu créer une entreprise commerciale et y vendre des espaces publicitaires, mais j’ai décidé d’en faire quelque chose de différent. Nous avons travaillé dur au fil des ans pour que notre organisation soit efficace et économe. Aujourd’hui, nous remplissons notre mission.\nSi chaque personne lisant ce message donnait, notre levée de fonds serait achevée en une heure.', 1, '2017-04-27 13:09:33', NULL),
(26, 5, 'diam tincidunt sit amet. Sed mattis sed sem at euismod. In tincidunt turpis sed dui lacinia semper. Praesent ut purus non eros efficitur aliquam. Nam id dapibus tellus, ut faucibus ante. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.\n\nPraesent pellentesque fermentum suscipit. Curabitur nec tristique nibh. Proin vit', 1, '2017-04-27 15:16:14', NULL),
(27, 3, 'Tandis que s''engager dans des études de comptabilité l''est beaucoup moins. La faute à l''image que l''on a des comptables et aux idées reçues qui traînent à leur sujet. A balayer de toute urgence.', 2, '2017-04-28 11:17:03', NULL),
(28, 8, 'Sed dictum sollicitudin lorem sed vehicula. Maecenas a enim fermentum, suscipit felis ac, placerat ligula. Fusce sem dui, porttitor sit amet felis sed, egestas facilisis urna. Integer vehicula, neque sit amet interdum fringilla, eros dui aliquet leo, scelerisque volutpat mi libero non dolor. Fusce aliquam efficitur eleifend. Fusce elit sem, dapibus vulputate interdum sit amet, sollicitudin at est. Quisque sollicitudin dui ut posuere tincidunt.', 4, '2017-05-02 07:06:18', NULL),
(29, 12, 'c''est tres  bien', 2, '2017-05-02 08:53:39', NULL),
(30, NULL, 'ententias memoriae mandavi, quas hoc libro exposui arbitratu meo; quasi enim ipsos induxi loquentes, ne ''inquam'' et ''inquit'' saepius interponeretur, atque ut tamquam a praesentibus coram haberi sermo videretur.\n\nPost emensos insuperabilis expeditionis eventus languentibus partium animis, quas periculorum varietas fregerat et laborum, nondum tubarum cessante clangore vel milite locato per stationes hibernas, fortunae saevientis procellae temp', 1, '2017-05-02 15:25:34', 5),
(31, 1, 'sdfsdf', 1, '2017-05-19 09:23:06', NULL),
(32, 1, 'sdfsdfsdf', 1, '2017-05-19 09:26:05', NULL),
(33, 4, 'dsfsdf', 1, '2017-05-19 09:37:21', NULL),
(34, 4, 'sdfsds pu créer une entreprise commerciale et y vendre des espaces publicitaires, mais j’ai décidé d’en faire quelque chose de différent. Nous avons travaillé dur au fil des ans pour que notre organisation soit efficace et économe. Aujourd’hui, nous remplissons notre mission.\nSi chaque personne lisant ce message donn', 1, '2017-05-19 09:38:07', NULL),
(35, 12, 'fsdfs sdf sd', 1, '2017-05-19 12:58:04', NULL),
(36, 1, 'Lorem ipsum 1', 3, '2017-05-19 13:16:03', NULL),
(37, 1, 'Lorem ipsum 2', 3, '2017-05-19 13:16:10', NULL),
(38, 1, 'Lorem ipsum 3', 3, '2017-05-19 13:16:14', NULL),
(39, 1, 'Lorem ipsum 4', 3, '2017-05-19 13:16:19', NULL),
(40, 1, 'Lorem ipsum 5', 3, '2017-05-19 13:16:24', NULL),
(41, 1, 'Lorem ipsum 6', 3, '2017-05-19 13:16:28', NULL),
(42, 1, 'Lorem ipsum 7', 3, '2017-05-19 13:16:32', NULL),
(43, 1, 'Lorem ipsum 8', 3, '2017-05-19 13:16:37', NULL),
(44, 1, 'Lorem ipsum 9', 3, '2017-05-19 13:16:41', NULL),
(45, 1, 'Lorem ipsum 10', 3, '2017-05-19 13:16:48', NULL),
(46, 1, 'Lorem ipsum 11', 3, '2017-05-19 13:18:17', NULL),
(47, 1, 'Lorem ipsum 12', 3, '2017-05-19 13:18:38', NULL),
(48, 1, 'Lorem ipsum 13', 3, '2017-05-19 13:18:45', NULL),
(49, 1, 'Lorem ipsum 14', 3, '2017-05-19 13:18:50', NULL),
(50, 1, 'Lorem ipsum 15', 3, '2017-05-19 13:20:11', NULL),
(51, 1, 'Lorem ipsum 16', 3, '2017-05-19 13:20:15', NULL),
(52, 1, 'Lorem ipsum 17', 3, '2017-05-19 13:20:20', NULL),
(53, 1, 'Lorem ipsum 18', 3, '2017-05-19 13:20:24', NULL),
(54, 1, 'Lorem ipsum 19', 3, '2017-05-19 13:20:28', NULL),
(55, 1, 'Lorem ipsum 20', 3, '2017-05-19 13:20:32', NULL),
(56, 1, 'Lorem ipsum 21', 3, '2017-05-19 14:04:20', NULL),
(57, 1, 'Lorem ipsum 22', 3, '2017-05-19 16:14:38', NULL),
(58, 1, 'Lorem ipsum 23', 3, '2017-05-19 16:14:46', NULL),
(59, 3, 'Lorem ipsum 22', 3, '2017-05-19 16:14:56', NULL),
(60, 3, 'Lorem ipsum 22df', 3, '2017-05-19 16:14:59', NULL),
(61, 3, 'Lorem ipsum 22dsf', 3, '2017-05-19 16:15:02', NULL),
(62, 1, 'Lorem ipsum 24', 3, '2017-05-19 16:15:27', NULL),
(63, 1, 'Lorem ipsum 25', 3, '2017-05-19 16:15:35', NULL),
(64, 1, 'Lorem ipsum 26', 3, '2017-05-19 16:15:40', NULL),
(65, 1, 'Lorem ipsum 27', 3, '2017-05-19 16:15:43', NULL),
(66, NULL, 'lorem 1', 4, '2017-05-22 08:32:10', 1),
(67, NULL, 'lorem 2', 4, '2017-05-22 08:32:17', 1),
(68, NULL, 'lorem 3', 4, '2017-05-22 08:32:42', 1),
(69, NULL, 'lorem 4', 4, '2017-05-22 08:32:47', 1),
(70, NULL, 'lorem 5', 4, '2017-05-22 08:32:50', 1),
(71, NULL, 'lorem 6', 4, '2017-05-22 08:32:55', 1),
(72, NULL, 'lorem 7', 4, '2017-05-22 08:32:59', 1),
(73, NULL, 'lorem 8', 4, '2017-05-22 08:33:03', 1),
(74, NULL, 'lorem 9', 4, '2017-05-22 08:33:07', 1),
(75, NULL, 'lorem 10', 4, '2017-05-22 08:33:10', 1),
(76, NULL, 'lorem 11', 4, '2017-05-22 08:33:14', 1),
(77, NULL, 'lorem 12', 4, '2017-05-22 08:33:18', 1),
(78, NULL, 'lorem 13', 4, '2017-05-22 08:33:21', 1),
(79, NULL, 'lorem 14', 4, '2017-05-22 08:33:26', 1),
(80, NULL, 'lorem 15', 5, '2017-05-22 08:35:14', 1),
(81, NULL, 'lorem 16', 5, '2017-05-22 08:35:18', 1),
(82, NULL, 'lorem 17', 5, '2017-05-22 08:35:22', 1),
(83, NULL, 'lorem 18', 5, '2017-05-22 08:35:28', 1),
(84, NULL, 'lorem 19', 5, '2017-05-22 08:35:32', 1),
(85, NULL, 'lorem 20', 5, '2017-05-22 08:35:36', 1),
(86, NULL, 'lorem 21', 5, '2017-05-22 08:35:39', 1),
(87, NULL, 'lorem 22. Etiam egestas nunc id quam tempor, sed facilisis massa porttitor.\nPraesent molestie turpis quis risus dapibus commodo eget in enim. Nam pretium non magna a finibus. Curabitur aliquet pharetra elementum. Quisque porttitor fringilla tincidunt. Integer eu tellus vitae libero condimentum congue. Fusce id mauris nec eros bibendum bibendum.', 5, '2017-05-22 08:36:03', 1),
(88, NULL, 'lorem 23', 5, '2017-05-22 08:55:48', 1),
(89, NULL, 'lorem 24', 5, '2017-05-22 09:15:56', 1),
(90, NULL, 'lorem 25 dssfsdf', 5, '2017-05-22 09:44:48', 1),
(91, NULL, 'lorem 26', 5, '2017-05-22 09:45:48', 1),
(92, NULL, 'lorem 27', 5, '2017-05-22 09:46:19', 1),
(93, NULL, 'lorem 28', 5, '2017-05-22 09:48:36', 1),
(94, 1, 'lorem 28', 5, '2017-05-22 09:54:11', NULL),
(95, NULL, 'lorem 29', 5, '2017-05-22 09:54:23', 1),
(96, NULL, 'lorem 30', 11, '2017-05-22 11:04:41', 1),
(97, NULL, 'lorem 31', 11, '2017-05-22 11:04:59', 1),
(98, 1, 'lorem 29', 11, '2017-05-22 11:05:52', NULL),
(99, NULL, 'lorem 32', 1, '2017-05-23 08:08:27', 1),
(100, 1, 'lorem 30', 1, '2017-05-23 09:20:54', NULL),
(101, 1, 'sdfsfs', 1, '2017-05-23 14:39:31', NULL),
(102, NULL, 'lorem 33', 1, '2017-05-23 14:41:36', 1),
(103, 1, 'Tandis que s''engager dans des études de comptabilité l''est beaucoup moins. La faute à l''image que l''on a des comptables et aux idées reçues qui traînent à leur sujet. A balayer de toute urgence.', 4, '2017-05-24 08:06:10', NULL),
(104, 12, 'qui se Latina scripta dicunt contemnere. in quibus hoc primum est in quo admirer, cur in gravissimis rebus non delectet eos sermo patrius, cum idem fabellas Latinas ad verbum e Graecis expressas non inviti legant. quis enim tam inimicus paene nomini Romano est, qui Ennii Medeam aut Antiopam Pacuvii spernat aut reiciat, quod se isdem Euripidis fabulis delectari di', 4, '2017-05-24 14:30:00', NULL),
(105, 13, 'omnibus terra, eiusque lateri dextro adnexa Isauria, pari sorte uberi palmite viget et frugibus minutis, quam mediam navigabile flumen Calycadnus interscindit.Superatis Tauri montis verticibus qui ad solis ortum sublimius attolluntur, Cilicia spatiis porrigitur late distentis dives bonis omnibus terra, eiusque lateri dextro adnexa Isauria, pari sorte uberi palmite vige', 4, '2017-05-24 14:42:04', NULL),
(106, 13, 'omnibus terra, eiusque lateri dextro adnexa Isauria, pari sorte uberi palmite viget et frugibus minutis, quam mediam navigabile flumen Calycadnus interscindit.Superatis Tauri montis verticibus qui ad solis ortum sublimius attolluntur, Cilicia spatiis porrigitur late distentis dives bonis omnibus terra, eiusque lateri dextro adnexa Isauria, pari sorte uberi palmite vige omnibus terra, eiusque lateri dextro adnexa Isauria, pari sorte uberi palmite viget et frugibus minutis, quam mediam navigabile flumen Calycadnus interscindit.Superatis Tauri montis verticibus qui ad solis ortum sublimius attolluntur, Cilicia spatiis porrigitur late distentis dives bonis omnibus terra, eiusque lateri dextro adnexa Isauria, pari sorte uberi palmite vige', 4, '2017-05-24 14:42:09', NULL),
(107, 13, 'ontis verticibus qui ad solis ortum sublimius attolluntur, Cilicia spatiis porrigitur late distentis dives bonis omnibus terra, eiusque lateri dextro adnexa Isauria, pari sorte uberi palmite viget et frugibus minutis, quam mediam navigabile flumen Calycadnus interscindit.Superatis Tauri montis verticibus qui ad solis ortum sublimius attolluntur, Cilicia spatiis porrigitur la', 4, '2017-05-24 14:42:13', NULL),
(108, 1, 'fsdfsd', 2, '2017-05-29 14:28:19', NULL),
(109, 1, 'dfgdfg', 2, '2017-05-29 14:30:01', NULL),
(110, 1, 'dfgdfg', 2, '2017-05-29 14:30:04', NULL),
(111, NULL, 'dfsfs', 2, '2017-05-29 14:30:32', 1),
(112, NULL, 'sdfsdf', 2, '2017-05-29 14:30:35', 1),
(113, 14, 'ceci est un commentaire', 2, '2017-06-12 08:22:01', NULL),
(114, NULL, 'en. Content .apien, vel cursus leo en. Content .apien, vel cursus leo en. Content .apien, vel cursus leo', 2, '2017-06-12 09:05:11', 8),
(115, 3, 'dfgd fg dfg', 2, '2017-06-14 10:22:57', NULL),
(116, 2, 'Pleine d''atouts, la profession continue pourtant à souffrir d''une image un peu terne. Des idées souvent fausses à corriger d''urgence.\nFaire du webmarketing ou du', 2, '2017-06-15 15:22:45', NULL),
(117, 3, 'fdgd', 1, '2017-06-20 14:30:18', NULL),
(118, 13, 'ur, Cilicia spatiis porrigitur late distentis dives bonis omnibus terra, eiusque lateri dextro adnexa Isauria, pari sorte uberi palmite vige omnibus terra, eiusque lateri dextro adnexa Isauria, pari sorte uberi palmite viget et frugibus minutis, quam mediam navigabile flumen Calycadnus interscindit.Superatis Tauri montis verticibus qui ad solis ortum sublimius attolluntur, Cilicia spatiis porrigitur late distentis dives bonis omnibus terra, eiusque lateri dextro adnexa Isauria, pari sorte uberi palmite vige', 1, '2017-06-20 15:08:18', NULL),
(119, 2, 'dfs fsdf sfsdf', 2, '2017-06-21 15:12:55', NULL),
(120, 15, 'les candidats doivent être titulaires d’un baccalauréat (toutes les diverses séries sont admises). Nos formations suivent le système LMD, ainsi les sanctions pour chaque cycle de formation sont respectivement.\n\nLes inscriptions pour le concours d’entrée en L1 (première année) sont ouvertes.', 2, '2017-06-27 07:25:33', NULL),
(121, 3, 'dfdsfs dsd', 1, '2017-06-29 12:43:20', NULL),
(122, 3, 'sdf sdfsdfsdf', 1, '2017-06-29 12:43:24', NULL),
(123, 3, 'ertert et ete ter', 1, '2017-06-29 12:43:28', NULL),
(124, 3, 'dfgd dgd gdfg', 1, '2017-06-29 12:44:55', NULL),
(125, 3, 'gdgd fdfg dfg df', 1, '2017-06-29 12:45:00', NULL),
(126, 3, 'gdfgd dg d gdfgdf g', 1, '2017-06-29 12:45:03', NULL),
(127, 3, 'ty tryrt yrty rt', 1, '2017-06-29 12:45:08', NULL),
(128, 3, 'fghfh fgh\ndfgdfg\n\ndfgdfg dfgdfgd', 1, '2017-06-29 12:45:13', NULL),
(129, 3, 'gdfgd d dg dfg', 1, '2017-06-29 12:45:17', NULL),
(130, 1, 'djlfjgfdl jdlkfjglkdfj ldjf djfkgl djfgkl djfklgdf', 1, '2017-06-29 12:51:01', NULL),
(131, 3, 'fsdf sdf sdfs sdf', 2, '2017-06-30 07:44:27', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `pm_contact`
--

CREATE TABLE `pm_contact` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `pm_contact`
--

INSERT INTO `pm_contact` (`id`, `name`, `date`, `email`, `website`, `content`, `user_id`) VALUES
(1, 'rakoto', '2017-02-16 06:55:02', 'rakoto@fmail.fe', 'dfgdfg', 'content', NULL),
(2, 'Ut laoreet malesuada', '2017-04-24 12:00:37', 'user7@test.com', NULL, 'sdfsdf', NULL),
(3, 'Ut laoreet malesuada', '2017-04-24 12:01:07', 'user7@test.com', NULL, 'sdfsdf', NULL),
(4, 'Sed posuere nisl sed', '2017-04-24 12:06:56', 'user7@test.com', NULL, 'rzerze', NULL),
(5, 'randria', '2017-04-24 12:22:14', 'randria@gamil.fom', NULL, 'sdfsdf', NULL),
(6, 'Ut laoreet malesuada', '2017-04-24 12:23:07', 'gigy.idbooster@gmail.com', NULL, 'http://localhost/boot/web/app_dev.php/en/contact', 1),
(7, 'Ut laoreet malesuada', '2017-04-24 12:51:24', 'randria@gamil.fom', NULL, 'et turpis ut, blandit egestas eros. Aliquam non nisi a felis sodales rutrum. Vivamus eget scelerisque nibh.\r\nNulla pulvinar a velit sit amet al', 1),
(8, 'Ut laoreet malesuada', '2017-04-24 13:27:02', 'randria@gamil.fom', NULL, 'dfsdf', NULL),
(9, 'dfgd', '2017-04-24 13:30:52', 'user12@test.fr', NULL, 'et convallis felis et convallis felis et convallis felis et convallis felis et convallis felis', NULL),
(10, 'nom', '2017-06-12 07:35:42', 'sfsdf@df.dfd', NULL, 'uam erat volutpat. Suspendisse molestie rhoncus velit a elementum. Maecenas eleifend, lectus sit amet cursus porttitor, metus turpis luctus mauris, sit amet convallis felis turpis eget nequam erat volutpat. Suspendisse molestie rhoncus velit a elementum. Maecenas eleifend, lectus sit amet cursus porttitor, metus turpis luctus mauris, sit amet convallis felis turpis eget neq', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `pm_hashtag`
--

CREATE TABLE `pm_hashtag` (
  `id` int(11) NOT NULL,
  `tag` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `pm_locale`
--

CREATE TABLE `pm_locale` (
  `id` int(11) NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `pm_locale`
--

INSERT INTO `pm_locale` (`id`, `locale`, `label`) VALUES
(1, 'fr', 'french'),
(2, 'en', 'english'),
(3, 'mg', 'malagasy'),
(4, 'it', 'italian'),
(5, 'es', 'spain'),
(6, 'de', 'deutch');

-- --------------------------------------------------------

--
-- Structure de la table `pm_newsletter`
--

CREATE TABLE `pm_newsletter` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `object` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `pm_newsletter_mail`
--

CREATE TABLE `pm_newsletter_mail` (
  `id` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `pm_newsletter_mail`
--

INSERT INTO `pm_newsletter_mail` (`id`, `email`, `date`, `is_active`) VALUES
(1, 'user1@boot.com', '2017-02-06 07:24:05', 1),
(2, 'user2@boot.com', '2017-02-06 07:24:05', 1),
(3, 'user3@boot.com', '2017-02-06 07:24:05', 1),
(4, 'user4@boot.com', '2017-02-06 07:24:06', 1),
(5, 'testse@dfd.fe', '2017-02-15 06:40:39', 1),
(6, 'testse@dfd.fey', '2017-02-15 06:40:45', 0),
(7, 'rakoto@fmail.fe', '2017-02-16 06:55:03', 0),
(8, 'user5lauk@fr', '2017-03-22 15:38:47', 0),
(9, 'user6@test.com', '2017-04-19 08:01:38', 0),
(10, 'user7@test.com', '2017-04-19 12:30:59', 1),
(11, 'user9@test.com', '2017-04-19 12:56:09', 0),
(12, 'user10@test.fr', '2017-04-19 12:58:45', 0),
(13, 'user11@test.mg', '2017-04-19 13:00:01', 0),
(14, 'user8@test.gr', '2017-04-19 13:26:32', 0),
(15, 'user12@test.fr', '2017-04-19 15:44:57', 0),
(16, 'user13@test.fr', '2017-04-19 15:50:38', 0),
(17, 'jeteste@test.fr', '2017-04-19 15:58:32', 1),
(18, 'randria@gamil.fom', '2017-04-24 12:22:14', 0),
(19, 'gigy.idbooster@gmail.com', '2017-04-24 12:23:07', 0),
(20, 'tset@dfd.fr', '2017-06-08 07:18:07', 0),
(21, 'sfsdf@df.dfd', '2017-06-12 07:35:43', 0);

-- --------------------------------------------------------

--
-- Structure de la table `pm_parameter`
--

CREATE TABLE `pm_parameter` (
  `id` int(11) NOT NULL,
  `parameter` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `pm_parameter`
--

INSERT INTO `pm_parameter` (`id`, `parameter`, `value`) VALUES
(1, 'populate', '1'),
(2, 'schools_by_page', '12'),
(3, 'categories_index', '12'),
(4, 'posts_by_page', '5');

-- --------------------------------------------------------

--
-- Structure de la table `pm_post_school`
--

CREATE TABLE `pm_post_school` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_confirmation_id` int(11) DEFAULT NULL,
  `date` datetime NOT NULL,
  `confirmation` tinyint(1) NOT NULL,
  `date_confirmation` datetime DEFAULT NULL,
  `post_to_school` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `pm_post_school`
--

INSERT INTO `pm_post_school` (`id`, `post_id`, `school_id`, `user_id`, `user_confirmation_id`, `date`, `confirmation`, `date_confirmation`, `post_to_school`) VALUES
(29, 4, 1, 1, 1, '2017-04-27 14:51:25', 1, '2017-04-27 14:51:25', 1),
(30, 4, 5, 1, 1, '2017-04-27 14:51:28', 1, '2017-04-27 14:51:28', 1),
(31, 4, 8, 1, 1, '2017-04-27 14:51:29', 1, '2017-04-27 14:51:29', 1),
(32, 4, 6, 1, 1, '2017-04-27 14:51:32', 1, '2017-04-27 14:51:32', 1),
(33, 5, 8, 1, 1, '2017-04-27 15:15:32', 1, '2017-04-27 15:15:32', 1),
(34, 5, 5, 1, 1, '2017-04-27 15:24:58', 1, '2017-04-27 15:24:58', 1),
(35, 5, 1, 1, 1, '2017-04-27 15:34:41', 1, '2017-04-27 15:34:41', 1),
(36, 6, 4, 1, 1, '2017-04-27 15:43:30', 1, '2017-04-27 15:43:30', 1),
(37, 6, 8, 1, 1, '2017-04-27 15:45:41', 1, '2017-04-27 15:45:41', 1),
(38, 8, 4, 2, 2, '2017-04-27 15:57:50', 1, '2017-04-27 15:57:50', 1),
(39, 3, 9, 2, 2, '2017-04-28 11:16:48', 1, '2017-04-28 11:16:48', 1),
(40, 4, 2, 3, 3, '2017-04-28 14:12:15', 1, '2017-04-28 14:12:15', 1),
(41, 8, 1, 4, 4, '2017-05-02 07:05:48', 1, '2017-05-02 07:05:48', 1),
(42, 2, 8, 1, 1, '2017-05-02 15:41:41', 1, '2017-05-02 15:41:41', 1),
(43, 1, 3, 1, 1, '2017-05-17 07:50:10', 1, '2017-05-17 07:50:10', 1),
(44, 3, 3, 1, 1, '2017-05-17 07:50:27', 1, '2017-05-17 07:50:27', 1),
(45, 4, 3, 1, 1, '2017-05-19 10:59:39', 1, '2017-05-19 10:59:39', 1),
(46, 4, 4, 1, 1, '2017-05-19 10:59:47', 1, '2017-05-19 10:59:47', 1),
(47, 1, 9, 3, 3, '2017-05-19 16:42:22', 1, '2017-05-19 16:42:22', 1),
(48, 13, 1, 4, 4, '2017-05-24 14:42:27', 1, '2017-05-24 14:42:27', 1),
(49, 13, 6, 1, 1, '2017-06-20 15:08:26', 1, '2017-06-20 15:08:26', 1),
(50, 15, 18, 2, 2, '2017-06-27 07:24:09', 1, '2017-06-27 07:24:09', 1),
(51, 15, 46, 2, 2, '2017-06-30 09:01:44', 1, '2017-06-30 09:01:44', 1),
(52, 13, 46, 2, 2, '2017-06-30 09:02:20', 1, '2017-06-30 09:02:20', 1);

-- --------------------------------------------------------

--
-- Structure de la table `pm_view`
--

CREATE TABLE `pm_view` (
  `id` int(11) NOT NULL,
  `school_id` int(11) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `advert_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date` datetime NOT NULL,
  `ip` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `pm_view`
--

INSERT INTO `pm_view` (`id`, `school_id`, `post_id`, `advert_id`, `user_id`, `date`, `ip`) VALUES
(429, 2, NULL, NULL, NULL, '2017-04-07 12:29:04', '::1'),
(430, 2, NULL, NULL, 2, '2017-04-07 12:29:37', '::1'),
(431, NULL, 1, NULL, 2, '2017-04-07 12:33:26', '::1'),
(432, NULL, 3, NULL, NULL, '2017-04-07 12:33:41', '::1'),
(433, NULL, NULL, 2, NULL, '2017-04-07 12:33:48', '::1'),
(434, 1, NULL, NULL, 2, '2017-04-07 12:34:36', '::1'),
(435, 1, NULL, NULL, 2, '2017-04-07 12:39:14', '::1'),
(436, 2, NULL, NULL, 2, '2017-04-07 13:09:59', '::1'),
(437, 2, NULL, NULL, 2, '2017-04-07 13:24:04', '::1'),
(438, 3, NULL, NULL, NULL, '2017-04-10 07:21:57', '::1'),
(439, NULL, 1, NULL, 1, '2017-04-10 07:23:13', '::1'),
(440, 2, NULL, NULL, 1, '2017-04-10 07:23:22', '::1'),
(441, 2, NULL, NULL, 1, '2017-04-10 07:29:29', '::1'),
(442, 9, NULL, NULL, 1, '2017-04-10 07:32:12', '::1'),
(443, 2, NULL, NULL, 1, '2017-04-10 07:32:33', '::1'),
(444, 2, NULL, NULL, NULL, '2017-04-11 08:07:32', '::1'),
(445, 2, NULL, NULL, 1, '2017-04-12 12:39:23', '::1'),
(446, 4, NULL, NULL, 1, '2017-04-13 07:34:34', '::1'),
(447, 6, NULL, NULL, 3, '2017-04-13 08:23:29', '::1'),
(448, 5, NULL, NULL, 1, '2017-04-13 11:51:50', '::1'),
(449, 1, NULL, NULL, 1, '2017-04-13 13:36:15', '::1'),
(450, 3, NULL, NULL, 1, '2017-04-13 13:37:01', '::1'),
(451, 3, NULL, NULL, 1, '2017-04-13 13:42:33', '::1'),
(452, 3, NULL, NULL, 1, '2017-04-13 13:49:49', '::1'),
(453, 3, NULL, NULL, 1, '2017-04-13 13:50:14', '::1'),
(454, 3, NULL, NULL, 1, '2017-04-13 13:51:28', '::1'),
(455, 3, NULL, NULL, 1, '2017-04-13 13:52:58', '::1'),
(456, 3, NULL, NULL, 1, '2017-04-13 13:53:27', '::1'),
(457, 1, NULL, NULL, 1, '2017-04-13 13:54:23', '::1'),
(458, 1, NULL, NULL, 2, '2017-04-13 15:08:02', '::1'),
(459, NULL, 2, NULL, 2, '2017-04-13 15:46:40', '::1'),
(460, 8, NULL, NULL, NULL, '2017-04-14 15:12:30', '::1'),
(461, 8, NULL, NULL, 2, '2017-04-14 15:12:58', '::1'),
(462, 8, NULL, NULL, 2, '2017-04-14 15:14:19', '::1'),
(463, 2, NULL, NULL, 1, '2017-04-18 15:27:35', '::1'),
(464, 3, NULL, NULL, 6, '2017-04-19 08:47:00', '::1'),
(465, 2, NULL, NULL, 6, '2017-04-19 09:03:15', '::1'),
(466, 4, NULL, NULL, 6, '2017-04-19 11:28:53', '::1'),
(467, 4, NULL, NULL, 6, '2017-04-19 11:29:33', '::1'),
(468, 4, NULL, NULL, 6, '2017-04-19 11:33:59', '::1'),
(469, 6, NULL, NULL, 6, '2017-04-19 11:35:35', '::1'),
(470, 1, NULL, NULL, 1, '2017-04-19 15:13:21', '::1'),
(471, 1, NULL, NULL, 1, '2017-04-19 15:14:22', '::1'),
(472, 1, NULL, NULL, 1, '2017-04-19 15:14:38', '::1'),
(473, 1, NULL, NULL, 1, '2017-04-19 15:14:46', '::1'),
(474, 1, NULL, NULL, 1, '2017-04-19 15:20:06', '::1'),
(475, 1, NULL, NULL, 1, '2017-04-19 15:20:47', '::1'),
(476, 1, NULL, NULL, 1, '2017-04-19 15:31:50', '::1'),
(477, 8, NULL, NULL, 1, '2017-04-19 16:15:03', '::1'),
(478, 8, NULL, NULL, 1, '2017-04-19 16:15:26', '::1'),
(479, 2, NULL, NULL, 1, '2017-04-19 16:15:58', '::1'),
(480, NULL, 1, NULL, NULL, '2017-04-20 06:55:02', '::1'),
(481, NULL, 1, NULL, NULL, '2017-04-20 06:57:53', '::1'),
(482, NULL, 1, NULL, NULL, '2017-04-20 06:58:19', '::1'),
(483, NULL, 1, NULL, NULL, '2017-04-20 06:58:57', '::1'),
(484, NULL, 1, NULL, NULL, '2017-04-20 07:03:15', '::1'),
(485, NULL, 1, NULL, NULL, '2017-04-20 07:12:33', '::1'),
(486, NULL, 1, NULL, NULL, '2017-04-20 07:13:08', '::1'),
(487, NULL, 1, NULL, NULL, '2017-04-20 07:13:26', '::1'),
(488, NULL, 1, NULL, NULL, '2017-04-20 07:14:15', '::1'),
(489, NULL, 1, NULL, 2, '2017-04-20 07:16:48', '::1'),
(490, NULL, 1, NULL, 2, '2017-04-20 07:20:50', '::1'),
(491, NULL, 1, NULL, 2, '2017-04-20 07:21:19', '::1'),
(492, NULL, 1, NULL, 2, '2017-04-20 07:38:12', '::1'),
(493, NULL, 1, NULL, 2, '2017-04-20 07:38:44', '::1'),
(494, NULL, 1, NULL, 2, '2017-04-20 07:39:24', '::1'),
(495, NULL, 1, NULL, 2, '2017-04-20 07:40:27', '::1'),
(496, NULL, 1, NULL, 2, '2017-04-20 07:41:13', '::1'),
(497, NULL, 1, NULL, 2, '2017-04-20 07:44:57', '::1'),
(498, NULL, 1, NULL, 2, '2017-04-20 07:45:58', '::1'),
(499, NULL, 1, NULL, 2, '2017-04-20 07:46:52', '::1'),
(500, NULL, 1, NULL, 2, '2017-04-20 07:50:29', '::1'),
(501, NULL, 1, NULL, 2, '2017-04-20 07:50:41', '::1'),
(502, NULL, 1, NULL, 2, '2017-04-20 07:50:54', '::1'),
(503, NULL, 1, NULL, 3, '2017-04-20 07:54:03', '::1'),
(504, NULL, 1, NULL, 3, '2017-04-20 07:55:18', '::1'),
(505, NULL, 1, NULL, 3, '2017-04-20 08:02:42', '::1'),
(506, NULL, 3, NULL, 3, '2017-04-20 08:04:05', '::1'),
(507, NULL, 3, NULL, 3, '2017-04-20 08:04:45', '::1'),
(508, NULL, 3, NULL, 3, '2017-04-20 08:06:23', '::1'),
(509, NULL, 1, NULL, 8, '2017-04-20 12:21:09', '::1'),
(510, NULL, NULL, 1, 8, '2017-04-20 13:11:09', '::1'),
(511, NULL, NULL, 1, 8, '2017-04-20 13:12:22', '::1'),
(512, NULL, 1, NULL, 8, '2017-04-20 13:46:22', '::1'),
(513, NULL, 1, NULL, 1, '2017-04-21 07:09:40', '::1'),
(514, NULL, NULL, 3, 1, '2017-04-21 07:41:11', '::1'),
(515, NULL, NULL, 3, 1, '2017-04-21 07:42:26', '::1'),
(516, NULL, NULL, 3, 1, '2017-04-21 07:43:08', '::1'),
(517, NULL, NULL, 3, 1, '2017-04-21 07:44:11', '::1'),
(518, NULL, NULL, 3, 1, '2017-04-21 07:45:27', '::1'),
(519, NULL, NULL, 3, 1, '2017-04-21 07:46:44', '::1'),
(520, NULL, NULL, 3, 1, '2017-04-21 07:47:24', '::1'),
(521, NULL, 1, NULL, 1, '2017-04-21 07:48:48', '::1'),
(522, NULL, NULL, 1, 1, '2017-04-21 07:56:04', '::1'),
(523, NULL, NULL, 1, 3, '2017-04-21 08:04:13', '::1'),
(524, NULL, 1, NULL, 3, '2017-04-21 08:05:35', '::1'),
(525, NULL, 1, NULL, 3, '2017-04-21 08:08:05', '::1'),
(526, NULL, 1, NULL, 3, '2017-04-21 08:08:40', '::1'),
(527, NULL, NULL, 4, 3, '2017-04-21 08:09:21', '::1'),
(528, NULL, NULL, 4, 3, '2017-04-21 08:11:13', '::1'),
(529, NULL, NULL, 4, 3, '2017-04-21 08:13:35', '::1'),
(530, NULL, NULL, 4, 3, '2017-04-21 08:19:02', '::1'),
(531, NULL, NULL, 4, 3, '2017-04-21 08:19:20', '::1'),
(532, NULL, NULL, 4, 3, '2017-04-21 08:19:26', '::1'),
(533, NULL, NULL, 4, 3, '2017-04-21 08:19:32', '::1'),
(534, NULL, NULL, 4, 3, '2017-04-21 08:20:12', '::1'),
(535, NULL, NULL, 4, NULL, '2017-04-21 08:20:36', '::1'),
(536, NULL, NULL, 4, NULL, '2017-04-21 08:37:27', '::1'),
(537, 7, NULL, NULL, NULL, '2017-04-21 08:38:55', '::1'),
(538, NULL, NULL, 1, NULL, '2017-04-21 08:52:34', '::1'),
(539, 5, NULL, NULL, NULL, '2017-04-21 09:32:03', '::1'),
(540, 6, NULL, NULL, 1, '2017-04-21 10:55:12', '::1'),
(541, 2, NULL, NULL, 1, '2017-04-21 12:23:29', '::1'),
(542, 4, NULL, NULL, 1, '2017-04-21 12:34:22', '::1'),
(543, NULL, NULL, 4, 1, '2017-04-21 12:36:01', '::1'),
(544, 1, NULL, NULL, 1, '2017-04-21 13:03:30', '::1'),
(545, 2, NULL, NULL, 1, '2017-04-21 13:20:12', '::1'),
(546, 4, NULL, NULL, NULL, '2017-04-24 09:12:15', '::1'),
(547, 1, NULL, NULL, 1, '2017-04-24 09:31:54', '::1'),
(548, 1, NULL, NULL, 1, '2017-04-24 09:33:10', '::1'),
(549, 1, NULL, NULL, 4, '2017-04-24 10:17:13', '::1'),
(550, 1, NULL, NULL, 4, '2017-04-24 10:17:43', '::1'),
(551, 1, NULL, NULL, 4, '2017-04-24 10:18:39', '::1'),
(552, 1, NULL, NULL, 4, '2017-04-24 11:32:36', '::1'),
(553, 1, NULL, NULL, 4, '2017-04-24 11:48:24', '::1'),
(554, 2, NULL, NULL, 1, '2017-04-24 13:00:02', '::1'),
(555, 2, NULL, NULL, NULL, '2017-04-24 14:42:15', '::1'),
(556, 2, NULL, NULL, NULL, '2017-04-24 14:50:18', '::1'),
(557, 2, NULL, NULL, NULL, '2017-04-24 16:11:53', '::1'),
(558, 4, NULL, NULL, 1, '2017-04-25 07:21:24', '::1'),
(559, 8, NULL, NULL, 1, '2017-04-26 09:04:40', '::1'),
(560, 8, NULL, NULL, 1, '2017-04-26 09:40:18', '::1'),
(561, 2, NULL, NULL, 1, '2017-04-26 09:51:03', '::1'),
(562, 2, NULL, NULL, 1, '2017-04-26 09:54:27', '::1'),
(563, 2, NULL, NULL, 1, '2017-04-26 09:54:48', '::1'),
(564, 2, NULL, NULL, 1, '2017-04-26 09:55:18', '::1'),
(565, 2, NULL, NULL, 1, '2017-04-26 09:55:27', '::1'),
(566, 2, NULL, NULL, NULL, '2017-04-26 10:39:15', '::1'),
(567, 1, NULL, NULL, NULL, '2017-04-26 10:39:53', '::1'),
(568, 1, NULL, NULL, NULL, '2017-04-26 11:19:36', '::1'),
(569, 8, NULL, NULL, NULL, '2017-04-26 11:21:52', '::1'),
(570, 2, NULL, NULL, NULL, '2017-04-26 11:56:16', '::1'),
(571, 3, NULL, NULL, 1, '2017-04-26 12:00:56', '::1'),
(572, NULL, NULL, 1, 1, '2017-04-26 12:04:54', '::1'),
(573, NULL, NULL, 1, NULL, '2017-04-26 12:53:12', '::1'),
(574, 3, NULL, NULL, NULL, '2017-04-26 13:54:04', '::1'),
(575, NULL, 1, NULL, NULL, '2017-04-27 06:55:53', '::1'),
(576, NULL, 1, NULL, 1, '2017-04-27 06:58:27', '::1'),
(577, NULL, 1, NULL, 1, '2017-04-27 07:00:29', '::1'),
(578, NULL, 1, NULL, 1, '2017-04-27 07:01:06', '::1'),
(579, NULL, 1, NULL, 1, '2017-04-27 07:02:18', '::1'),
(580, NULL, 1, NULL, 1, '2017-04-27 07:04:09', '::1'),
(581, NULL, 1, NULL, 1, '2017-04-27 07:08:18', '::1'),
(582, NULL, 1, NULL, 1, '2017-04-27 07:08:41', '::1'),
(583, NULL, 1, NULL, 1, '2017-04-27 07:16:32', '::1'),
(584, NULL, 1, NULL, 1, '2017-04-27 07:17:10', '::1'),
(585, NULL, 1, NULL, 1, '2017-04-27 07:21:09', '::1'),
(586, NULL, 1, NULL, 1, '2017-04-27 07:21:39', '::1'),
(587, NULL, 1, NULL, 1, '2017-04-27 07:26:12', '::1'),
(588, NULL, 1, NULL, 1, '2017-04-27 08:00:53', '::1'),
(589, NULL, 1, NULL, 1, '2017-04-27 08:02:12', '::1'),
(590, NULL, 1, NULL, 1, '2017-04-27 08:02:54', '::1'),
(591, 1, NULL, NULL, 1, '2017-04-27 08:03:24', '::1'),
(592, NULL, 1, NULL, 1, '2017-04-27 08:06:18', '::1'),
(593, NULL, 1, NULL, 1, '2017-04-27 08:06:59', '::1'),
(594, NULL, 1, NULL, 1, '2017-04-27 08:08:06', '::1'),
(595, NULL, 1, NULL, 1, '2017-04-27 08:11:44', '::1'),
(596, NULL, 1, NULL, 1, '2017-04-27 08:16:10', '::1'),
(597, NULL, 1, NULL, 1, '2017-04-27 08:17:18', '::1'),
(598, NULL, 1, NULL, 1, '2017-04-27 08:18:11', '::1'),
(599, NULL, 1, NULL, 1, '2017-04-27 08:27:39', '::1'),
(600, NULL, 1, NULL, 1, '2017-04-27 08:28:43', '::1'),
(601, NULL, 1, NULL, 1, '2017-04-27 08:28:55', '::1'),
(602, NULL, 1, NULL, 1, '2017-04-27 08:29:59', '::1'),
(603, NULL, 1, NULL, 1, '2017-04-27 08:30:48', '::1'),
(604, NULL, 1, NULL, 1, '2017-04-27 08:34:46', '::1'),
(605, NULL, 1, NULL, 1, '2017-04-27 08:36:56', '::1'),
(606, NULL, 1, NULL, 1, '2017-04-27 08:38:08', '::1'),
(607, 6, NULL, NULL, 1, '2017-04-27 11:29:32', '::1'),
(608, 6, NULL, NULL, 1, '2017-04-27 11:57:36', '::1'),
(609, 6, NULL, NULL, 1, '2017-04-27 11:59:04', '::1'),
(610, 6, NULL, NULL, 1, '2017-04-27 12:00:39', '::1'),
(611, NULL, 4, NULL, 1, '2017-04-27 13:08:12', '::1'),
(612, NULL, 4, NULL, 1, '2017-04-27 13:19:19', '::1'),
(613, NULL, 4, NULL, 1, '2017-04-27 13:45:32', '::1'),
(614, 1, NULL, NULL, 1, '2017-04-27 14:17:40', '::1'),
(615, NULL, 4, NULL, 1, '2017-04-27 14:19:51', '::1'),
(616, NULL, 4, NULL, 1, '2017-04-27 14:20:06', '::1'),
(617, NULL, 4, NULL, 1, '2017-04-27 14:21:18', '::1'),
(618, NULL, 4, NULL, 1, '2017-04-27 14:22:09', '::1'),
(619, NULL, 4, NULL, 1, '2017-04-27 14:22:55', '::1'),
(620, NULL, 4, NULL, 1, '2017-04-27 14:25:39', '::1'),
(621, NULL, 4, NULL, 1, '2017-04-27 14:25:59', '::1'),
(622, NULL, 4, NULL, 1, '2017-04-27 14:27:03', '::1'),
(623, NULL, 4, NULL, 1, '2017-04-27 14:27:30', '::1'),
(624, 1, NULL, NULL, 1, '2017-04-27 14:28:05', '::1'),
(625, NULL, 4, NULL, 1, '2017-04-27 14:28:23', '::1'),
(626, NULL, 4, NULL, 1, '2017-04-27 14:28:42', '::1'),
(627, NULL, 4, NULL, 1, '2017-04-27 14:34:46', '::1'),
(628, NULL, 4, NULL, 1, '2017-04-27 14:36:19', '::1'),
(629, NULL, 4, NULL, 1, '2017-04-27 14:51:18', '::1'),
(630, NULL, 4, NULL, 1, '2017-04-27 14:51:35', '::1'),
(631, NULL, 4, NULL, 1, '2017-04-27 15:02:46', '::1'),
(632, 2, NULL, NULL, 1, '2017-04-27 15:14:47', '::1'),
(633, NULL, 2, NULL, 1, '2017-04-27 15:15:03', '::1'),
(634, NULL, 4, NULL, 1, '2017-04-27 15:15:16', '::1'),
(635, NULL, 5, NULL, 1, '2017-04-27 15:15:26', '::1'),
(636, 8, NULL, NULL, 1, '2017-04-27 15:15:43', '::1'),
(637, NULL, 5, NULL, 1, '2017-04-27 15:15:53', '::1'),
(638, 1, NULL, NULL, 1, '2017-04-27 15:25:43', '::1'),
(639, 1, NULL, NULL, 1, '2017-04-27 15:28:38', '::1'),
(640, 1, NULL, NULL, 1, '2017-04-27 15:33:13', '::1'),
(641, 1, NULL, NULL, 1, '2017-04-27 15:33:53', '::1'),
(642, NULL, 4, NULL, 1, '2017-04-27 15:34:26', '::1'),
(643, NULL, 5, NULL, 1, '2017-04-27 15:34:33', '::1'),
(644, 1, NULL, NULL, 1, '2017-04-27 15:34:52', '::1'),
(645, 1, NULL, NULL, 1, '2017-04-27 15:36:15', '::1'),
(646, 1, NULL, NULL, 1, '2017-04-27 15:36:31', '::1'),
(647, 1, NULL, NULL, 1, '2017-04-27 15:36:57', '::1'),
(648, 1, NULL, NULL, 1, '2017-04-27 15:37:30', '::1'),
(649, 1, NULL, NULL, 1, '2017-04-27 15:37:52', '::1'),
(650, 1, NULL, NULL, 1, '2017-04-27 15:38:27', '::1'),
(651, 1, NULL, NULL, 1, '2017-04-27 15:39:23', '::1'),
(652, 1, NULL, NULL, 1, '2017-04-27 15:39:35', '::1'),
(653, 1, NULL, NULL, 1, '2017-04-27 15:40:25', '::1'),
(654, 4, NULL, NULL, 1, '2017-04-27 15:41:52', '::1'),
(655, NULL, 6, NULL, 1, '2017-04-27 15:43:20', '::1'),
(656, 4, NULL, NULL, 1, '2017-04-27 15:43:35', '::1'),
(657, NULL, 6, NULL, 1, '2017-04-27 15:45:33', '::1'),
(658, 8, NULL, NULL, 1, '2017-04-27 15:45:52', '::1'),
(659, NULL, 8, NULL, 2, '2017-04-27 15:57:31', '::1'),
(660, 4, NULL, NULL, 2, '2017-04-27 15:59:30', '::1'),
(661, NULL, 8, NULL, 2, '2017-04-27 15:59:39', '::1'),
(662, NULL, 8, NULL, 2, '2017-04-27 16:00:23', '::1'),
(663, 4, NULL, NULL, 2, '2017-04-27 16:01:27', '::1'),
(664, NULL, 4, NULL, NULL, '2017-04-28 08:08:01', '::1'),
(665, NULL, 4, NULL, NULL, '2017-04-28 08:10:31', '::1'),
(666, NULL, 4, NULL, NULL, '2017-04-28 08:11:18', '::1'),
(667, NULL, 4, NULL, 1, '2017-04-28 08:14:06', '::1'),
(668, NULL, NULL, 3, 1, '2017-04-28 08:28:50', '::1'),
(669, NULL, NULL, 3, 1, '2017-04-28 08:31:20', '::1'),
(670, 1, NULL, NULL, 1, '2017-04-28 08:31:55', '::1'),
(671, 1, NULL, NULL, 1, '2017-04-28 08:32:37', '::1'),
(672, NULL, NULL, 5, 1, '2017-04-28 08:32:57', '::1'),
(673, 1, NULL, NULL, 1, '2017-04-28 08:36:49', '::1'),
(674, NULL, NULL, 5, 1, '2017-04-28 08:36:56', '::1'),
(675, 1, NULL, NULL, NULL, '2017-04-28 08:39:50', '::1'),
(676, 1, NULL, NULL, NULL, '2017-04-28 08:42:27', '::1'),
(677, 1, NULL, NULL, NULL, '2017-04-28 08:43:29', '::1'),
(678, 1, NULL, NULL, NULL, '2017-04-28 08:43:42', '::1'),
(679, 1, NULL, NULL, NULL, '2017-04-28 08:45:12', '::1'),
(680, 1, NULL, NULL, NULL, '2017-04-28 08:45:42', '::1'),
(681, 1, NULL, NULL, NULL, '2017-04-28 08:46:09', '::1'),
(682, NULL, NULL, 1, NULL, '2017-04-28 08:46:27', '::1'),
(683, 1, NULL, NULL, NULL, '2017-04-28 08:47:34', '::1'),
(684, 1, NULL, NULL, NULL, '2017-04-28 08:49:07', '::1'),
(685, NULL, 5, NULL, NULL, '2017-04-28 11:13:46', '::1'),
(686, NULL, 5, NULL, 2, '2017-04-28 11:14:07', '::1'),
(687, NULL, 5, NULL, 2, '2017-04-28 11:14:14', '::1'),
(688, NULL, 5, NULL, 2, '2017-04-28 11:15:01', '::1'),
(689, NULL, 3, NULL, 2, '2017-04-28 11:15:13', '::1'),
(690, NULL, 3, NULL, 2, '2017-04-28 11:16:22', '::1'),
(691, 1, NULL, NULL, 2, '2017-04-28 11:27:05', '::1'),
(692, 1, NULL, NULL, 1, '2017-04-28 12:37:37', '::1'),
(693, 1, NULL, NULL, 1, '2017-04-28 12:54:46', '::1'),
(694, 1, NULL, NULL, 1, '2017-04-28 12:55:33', '::1'),
(695, 1, NULL, NULL, 1, '2017-04-28 12:56:02', '::1'),
(696, 1, NULL, NULL, 1, '2017-04-28 13:47:12', '::1'),
(697, 1, NULL, NULL, 1, '2017-04-28 13:47:55', '::1'),
(698, 1, NULL, NULL, 1, '2017-04-28 13:48:25', '::1'),
(699, 1, NULL, NULL, 1, '2017-04-28 13:48:58', '::1'),
(700, 1, NULL, NULL, 1, '2017-04-28 13:49:43', '::1'),
(701, 1, NULL, NULL, 1, '2017-04-28 13:50:46', '::1'),
(702, 1, NULL, NULL, 1, '2017-04-28 13:51:55', '::1'),
(703, 1, NULL, NULL, 1, '2017-04-28 13:53:09', '::1'),
(704, 1, NULL, NULL, 1, '2017-04-28 13:53:56', '::1'),
(705, 1, NULL, NULL, 1, '2017-04-28 13:54:11', '::1'),
(706, 1, NULL, NULL, 1, '2017-04-28 14:02:51', '::1'),
(707, 1, NULL, NULL, 1, '2017-04-28 14:03:44', '::1'),
(708, 1, NULL, NULL, 1, '2017-04-28 14:03:56', '::1'),
(709, 1, NULL, NULL, 1, '2017-04-28 14:04:04', '::1'),
(710, 2, NULL, NULL, 3, '2017-04-28 14:10:26', '::1'),
(711, NULL, 4, NULL, 3, '2017-04-28 14:12:05', '::1'),
(712, 2, NULL, NULL, 3, '2017-04-28 14:12:34', '::1'),
(713, 2, NULL, NULL, 3, '2017-04-28 14:13:06', '::1'),
(714, 2, NULL, NULL, 3, '2017-04-28 14:14:26', '::1'),
(715, 1, NULL, NULL, 3, '2017-04-28 14:48:32', '::1'),
(716, 1, NULL, NULL, NULL, '2017-05-02 07:03:15', '::1'),
(717, 1, NULL, NULL, 4, '2017-05-02 07:04:02', '::1'),
(718, NULL, 4, NULL, 4, '2017-05-02 07:04:53', '::1'),
(719, NULL, 8, NULL, 4, '2017-05-02 07:05:08', '::1'),
(720, 1, NULL, NULL, 4, '2017-05-02 07:18:27', '::1'),
(721, 4, NULL, NULL, 4, '2017-05-02 07:22:04', '::1'),
(722, 4, NULL, NULL, 4, '2017-05-02 07:24:24', '::1'),
(723, 3, NULL, NULL, 4, '2017-05-02 07:51:16', '::1'),
(724, 3, NULL, NULL, 2, '2017-05-02 07:52:13', '::1'),
(725, 3, NULL, NULL, 2, '2017-05-02 07:52:16', '::1'),
(726, 2, NULL, NULL, 2, '2017-05-02 08:25:30', '::1'),
(727, NULL, 12, NULL, 2, '2017-05-02 08:53:20', '::1'),
(728, NULL, 1, NULL, 2, '2017-05-02 09:25:53', '::1'),
(729, 4, NULL, NULL, 2, '2017-05-02 09:26:43', '::1'),
(730, 2, NULL, NULL, 2, '2017-05-02 10:49:16', '::1'),
(731, 5, NULL, NULL, NULL, '2017-05-02 10:50:39', '::1'),
(732, 3, NULL, NULL, NULL, '2017-05-02 10:50:57', '::1'),
(733, 2, NULL, NULL, 2, '2017-05-02 10:51:18', '::1'),
(734, 5, NULL, NULL, 1, '2017-05-02 10:59:54', '::1'),
(735, 2, NULL, NULL, 2, '2017-05-02 11:19:16', '::1'),
(736, 2, NULL, NULL, 2, '2017-05-02 11:33:50', '::1'),
(737, 2, NULL, NULL, 1, '2017-05-02 11:57:45', '::1'),
(738, 3, NULL, NULL, 1, '2017-05-02 11:58:00', '::1'),
(739, 6, NULL, NULL, 1, '2017-05-02 11:58:26', '::1'),
(740, NULL, 5, NULL, 2, '2017-05-02 12:04:31', '::1'),
(741, 1, NULL, NULL, 2, '2017-05-02 12:37:46', '::1'),
(742, 4, NULL, NULL, 2, '2017-05-02 12:39:36', '::1'),
(743, 4, NULL, NULL, 2, '2017-05-02 12:42:21', '::1'),
(744, 1, NULL, NULL, 2, '2017-05-02 12:45:31', '::1'),
(745, 1, NULL, NULL, 2, '2017-05-02 12:47:40', '::1'),
(746, 1, NULL, NULL, 2, '2017-05-02 13:00:47', '::1'),
(747, 1, NULL, NULL, 2, '2017-05-02 13:00:50', '::1'),
(748, 1, NULL, NULL, 2, '2017-05-02 13:01:32', '::1'),
(749, 1, NULL, NULL, 2, '2017-05-02 13:01:35', '::1'),
(750, 1, NULL, NULL, 2, '2017-05-02 13:02:46', '::1'),
(751, 1, NULL, NULL, 2, '2017-05-02 13:02:49', '::1'),
(752, 1, NULL, NULL, 2, '2017-05-02 13:04:48', '::1'),
(753, 1, NULL, NULL, 2, '2017-05-02 13:05:37', '::1'),
(754, 1, NULL, NULL, 2, '2017-05-02 13:05:38', '::1'),
(755, 1, NULL, NULL, 2, '2017-05-02 13:06:09', '::1'),
(756, 2, NULL, NULL, 1, '2017-05-02 13:12:35', '::1'),
(757, 8, NULL, NULL, 2, '2017-05-02 13:21:42', '::1'),
(758, 6, NULL, NULL, 2, '2017-05-02 13:27:57', '::1'),
(759, 6, NULL, NULL, NULL, '2017-05-02 13:28:33', '::1'),
(760, 6, NULL, NULL, NULL, '2017-05-02 13:28:40', '::1'),
(761, 6, NULL, NULL, NULL, '2017-05-02 13:30:37', '::1'),
(762, 1, NULL, NULL, NULL, '2017-05-02 13:31:01', '::1'),
(763, 1, NULL, NULL, NULL, '2017-05-02 13:31:07', '::1'),
(764, 6, NULL, NULL, NULL, '2017-05-02 13:31:14', '::1'),
(765, 6, NULL, NULL, NULL, '2017-05-02 13:31:49', '::1'),
(766, 6, NULL, NULL, NULL, '2017-05-02 13:34:33', '::1'),
(767, 6, NULL, NULL, NULL, '2017-05-02 13:36:40', '::1'),
(768, 1, NULL, NULL, NULL, '2017-05-02 13:37:29', '::1'),
(769, 6, NULL, NULL, NULL, '2017-05-02 13:37:32', '::1'),
(770, 6, NULL, NULL, NULL, '2017-05-02 13:38:06', '::1'),
(771, 6, NULL, NULL, NULL, '2017-05-02 13:38:19', '::1'),
(772, 1, NULL, NULL, NULL, '2017-05-02 13:38:42', '::1'),
(773, 1, NULL, NULL, NULL, '2017-05-02 13:38:52', '::1'),
(774, 1, NULL, NULL, NULL, '2017-05-02 13:38:58', '::1'),
(775, 6, NULL, NULL, NULL, '2017-05-02 13:39:28', '::1'),
(776, 6, NULL, NULL, NULL, '2017-05-02 13:39:38', '::1'),
(777, 1, NULL, NULL, NULL, '2017-05-02 13:39:39', '::1'),
(778, 1, NULL, NULL, 1, '2017-05-02 13:41:33', '::1'),
(779, 1, NULL, NULL, 1, '2017-05-02 13:42:40', '::1'),
(780, 1, NULL, NULL, 1, '2017-05-02 13:42:50', '::1'),
(781, 1, NULL, NULL, 1, '2017-05-02 13:43:55', '::1'),
(782, 7, NULL, NULL, 1, '2017-05-02 13:52:22', '::1'),
(783, 7, NULL, NULL, 1, '2017-05-02 13:57:38', '::1'),
(784, 4, NULL, NULL, 1, '2017-05-02 14:01:38', '::1'),
(785, 7, NULL, NULL, 1, '2017-05-02 14:03:06', '::1'),
(786, 3, NULL, NULL, 1, '2017-05-02 14:06:27', '::1'),
(787, 6, NULL, NULL, 1, '2017-05-02 14:18:02', '::1'),
(788, 1, NULL, NULL, NULL, '2017-05-02 14:25:22', '::1'),
(789, 6, NULL, NULL, 1, '2017-05-02 15:07:15', '::1'),
(790, 6, NULL, NULL, 1, '2017-05-02 15:12:02', '::1'),
(791, 8, NULL, NULL, 1, '2017-05-02 15:18:15', '::1'),
(792, NULL, NULL, 5, 1, '2017-05-02 15:25:19', '::1'),
(793, NULL, NULL, 5, 1, '2017-05-02 15:25:41', '::1'),
(794, 3, NULL, NULL, 1, '2017-05-02 15:32:26', '::1'),
(795, 3, NULL, NULL, 1, '2017-05-02 15:40:54', '::1'),
(796, NULL, 2, NULL, 1, '2017-05-02 15:41:32', '::1'),
(797, 8, NULL, NULL, 1, '2017-05-02 15:41:54', '::1'),
(798, 2, NULL, NULL, 1, '2017-05-02 15:47:57', '::1'),
(799, 2, NULL, NULL, 1, '2017-05-02 15:50:00', '::1'),
(800, 2, NULL, NULL, 1, '2017-05-02 15:53:41', '::1'),
(801, 2, NULL, NULL, 1, '2017-05-02 15:56:04', '::1'),
(802, 2, NULL, NULL, 1, '2017-05-02 15:57:14', '::1'),
(803, 2, NULL, NULL, 1, '2017-05-02 15:57:22', '::1'),
(804, 2, NULL, NULL, 1, '2017-05-02 15:57:35', '::1'),
(805, 2, NULL, NULL, NULL, '2017-05-03 07:04:16', '::1'),
(806, NULL, 4, NULL, NULL, '2017-05-03 07:04:37', '::1'),
(807, 8, NULL, NULL, 2, '2017-05-03 07:05:33', '::1'),
(808, 3, NULL, NULL, 2, '2017-05-03 07:11:44', '::1'),
(809, 1, NULL, NULL, 2, '2017-05-03 09:03:17', '::1'),
(810, 9, NULL, NULL, 2, '2017-05-03 09:05:34', '::1'),
(811, 9, NULL, NULL, 2, '2017-05-03 09:05:58', '::1'),
(812, 9, NULL, NULL, 2, '2017-05-03 09:07:20', '::1'),
(813, 9, NULL, NULL, 2, '2017-05-03 09:13:08', '::1'),
(814, 9, NULL, NULL, 2, '2017-05-03 09:16:17', '::1'),
(815, 9, NULL, NULL, NULL, '2017-05-03 09:57:51', '::1'),
(816, 9, NULL, NULL, 1, '2017-05-03 11:56:45', '::1'),
(817, 9, NULL, NULL, 1, '2017-05-03 11:56:59', '::1'),
(818, 9, NULL, NULL, 1, '2017-05-03 11:57:36', '::1'),
(819, 9, NULL, NULL, 1, '2017-05-03 11:59:24', '::1'),
(820, 9, NULL, NULL, 1, '2017-05-03 12:01:58', '::1'),
(821, 9, NULL, NULL, 1, '2017-05-03 12:04:11', '::1'),
(822, 2, NULL, NULL, 1, '2017-05-03 12:04:34', '::1'),
(823, 9, NULL, NULL, 1, '2017-05-03 12:07:00', '::1'),
(824, 9, NULL, NULL, 1, '2017-05-03 12:09:15', '::1'),
(825, 9, NULL, NULL, NULL, '2017-05-03 13:40:22', '::1'),
(826, 4, NULL, NULL, 2, '2017-05-03 13:44:57', '::1'),
(827, 4, NULL, NULL, 2, '2017-05-03 13:45:13', '::1'),
(828, 1, NULL, NULL, 2, '2017-05-03 13:45:49', '::1'),
(829, 4, NULL, NULL, 2, '2017-05-03 14:01:22', '::1'),
(830, 1, NULL, NULL, 2, '2017-05-03 14:20:18', '::1'),
(831, 2, NULL, NULL, 2, '2017-05-03 14:25:22', '::1'),
(832, 2, NULL, NULL, 2, '2017-05-03 14:26:35', '::1'),
(833, 2, NULL, NULL, 2, '2017-05-03 14:27:57', '::1'),
(834, 1, NULL, NULL, 2, '2017-05-03 14:35:15', '::1'),
(835, 1, NULL, NULL, 2, '2017-05-03 14:36:42', '::1'),
(836, 2, NULL, NULL, 2, '2017-05-03 14:36:56', '::1'),
(837, 4, NULL, NULL, 2, '2017-05-03 14:37:15', '::1'),
(838, 2, NULL, NULL, 2, '2017-05-03 14:37:46', '::1'),
(839, 2, NULL, NULL, 2, '2017-05-03 14:43:11', '::1'),
(840, 1, NULL, NULL, 2, '2017-05-03 14:51:26', '::1'),
(841, 1, NULL, NULL, 2, '2017-05-03 15:04:46', '::1'),
(842, 1, NULL, NULL, 2, '2017-05-03 15:06:02', '::1'),
(843, 5, NULL, NULL, 2, '2017-05-03 15:07:52', '::1'),
(844, 5, NULL, NULL, 2, '2017-05-03 15:09:43', '::1'),
(845, 6, NULL, NULL, 2, '2017-05-03 15:11:16', '::1'),
(846, 6, NULL, NULL, 2, '2017-05-03 15:11:44', '::1'),
(847, 6, NULL, NULL, NULL, '2017-05-03 15:12:23', '::1'),
(848, 7, NULL, NULL, 2, '2017-05-03 15:13:44', '::1'),
(849, 7, NULL, NULL, 2, '2017-05-03 15:14:11', '::1'),
(850, 8, NULL, NULL, 2, '2017-05-03 15:14:33', '::1'),
(851, 8, NULL, NULL, 2, '2017-05-03 15:16:19', '::1'),
(852, 8, NULL, NULL, 2, '2017-05-03 15:16:47', '::1'),
(853, 3, NULL, NULL, 2, '2017-05-03 15:17:02', '::1'),
(854, 3, NULL, NULL, 2, '2017-05-03 15:18:40', '::1'),
(855, 3, NULL, NULL, 2, '2017-05-03 15:19:44', '::1'),
(856, 1, NULL, NULL, 2, '2017-05-03 15:19:55', '::1'),
(857, 9, NULL, NULL, 2, '2017-05-03 15:20:06', '::1'),
(858, 4, NULL, NULL, 2, '2017-05-03 15:20:16', '::1'),
(859, 5, NULL, NULL, 2, '2017-05-03 15:20:41', '::1'),
(860, 1, NULL, NULL, 2, '2017-05-03 15:47:04', '::1'),
(861, 2, NULL, NULL, 2, '2017-05-03 15:47:38', '::1'),
(862, 3, NULL, NULL, 2, '2017-05-03 15:48:12', '::1'),
(863, 3, NULL, NULL, 2, '2017-05-03 15:57:47', '::1'),
(864, 8, NULL, NULL, 2, '2017-05-03 16:01:13', '::1'),
(865, 4, NULL, NULL, 2, '2017-05-03 16:08:20', '::1'),
(866, 8, NULL, NULL, 2, '2017-05-03 16:14:24', '::1'),
(867, 2, NULL, NULL, 2, '2017-05-03 16:17:51', '::1'),
(868, 7, NULL, NULL, NULL, '2017-05-04 07:31:59', '::1'),
(869, 2, NULL, NULL, 6, '2017-05-04 07:34:09', '::1'),
(870, 3, NULL, NULL, 6, '2017-05-04 07:35:43', '::1'),
(871, 1, NULL, NULL, 6, '2017-05-04 07:41:00', '::1'),
(872, 1, NULL, NULL, 6, '2017-05-04 07:42:46', '::1'),
(873, 1, NULL, NULL, 6, '2017-05-04 07:43:27', '::1'),
(874, 6, NULL, NULL, 6, '2017-05-04 07:44:24', '::1'),
(875, 6, NULL, NULL, 6, '2017-05-04 07:54:06', '::1'),
(876, 6, NULL, NULL, 1, '2017-05-04 08:32:45', '::1'),
(877, 6, NULL, NULL, 1, '2017-05-04 08:36:30', '::1'),
(878, 7, NULL, NULL, 1, '2017-05-04 08:36:44', '::1'),
(879, 5, NULL, NULL, 1, '2017-05-04 08:37:03', '::1'),
(880, 8, NULL, NULL, 1, '2017-05-04 08:45:13', '::1'),
(881, 8, NULL, NULL, 1, '2017-05-04 08:47:00', '::1'),
(882, 2, NULL, NULL, 1, '2017-05-04 08:47:13', '::1'),
(883, 6, NULL, NULL, 1, '2017-05-04 08:47:27', '::1'),
(884, 6, NULL, NULL, 1, '2017-05-04 08:48:02', '::1'),
(885, 9, NULL, NULL, 1, '2017-05-04 08:48:27', '::1'),
(886, 1, NULL, NULL, 1, '2017-05-04 08:50:19', '::1'),
(887, 4, NULL, NULL, 1, '2017-05-04 09:16:57', '::1'),
(888, 4, NULL, NULL, 1, '2017-05-04 10:03:40', '::1'),
(889, 8, NULL, NULL, 1, '2017-05-04 10:16:53', '::1'),
(890, 6, NULL, NULL, 1, '2017-05-04 10:24:15', '::1'),
(891, 7, NULL, NULL, 1, '2017-05-04 10:39:45', '::1'),
(892, 7, NULL, NULL, 1, '2017-05-04 11:13:24', '::1'),
(893, 5, NULL, NULL, 1, '2017-05-04 11:17:44', '::1'),
(894, 5, NULL, NULL, 1, '2017-05-04 11:35:46', '::1'),
(895, 6, NULL, NULL, 1, '2017-05-04 11:35:59', '::1'),
(896, 7, NULL, NULL, 1, '2017-05-04 11:39:15', '::1'),
(897, 9, NULL, NULL, 1, '2017-05-04 12:12:59', '::1'),
(898, 9, NULL, NULL, 1, '2017-05-04 12:13:17', '::1'),
(899, 9, NULL, NULL, 1, '2017-05-04 12:44:34', '::1'),
(900, 9, NULL, NULL, 1, '2017-05-04 12:45:03', '::1'),
(901, 9, NULL, NULL, 1, '2017-05-04 13:40:17', '::1'),
(902, 8, NULL, NULL, 1, '2017-05-04 13:47:13', '::1'),
(903, 8, NULL, NULL, 1, '2017-05-04 13:49:05', '::1'),
(904, 10, NULL, NULL, 1, '2017-05-04 14:26:26', '::1'),
(905, 10, NULL, NULL, 1, '2017-05-04 14:29:55', '::1'),
(906, 2, NULL, NULL, 1, '2017-05-04 14:33:43', '::1'),
(907, 10, NULL, NULL, 1, '2017-05-04 14:34:40', '::1'),
(908, 2, NULL, NULL, 1, '2017-05-04 15:20:55', '::1'),
(909, 4, NULL, NULL, 1, '2017-05-04 15:26:58', '::1'),
(910, 6, NULL, NULL, 1, '2017-05-04 15:35:29', '::1'),
(911, 1, NULL, NULL, 1, '2017-05-04 16:01:42', '::1'),
(912, 3, NULL, NULL, NULL, '2017-05-05 06:24:21', '::1'),
(913, 1, NULL, NULL, NULL, '2017-05-05 06:25:09', '::1'),
(914, 1, NULL, NULL, NULL, '2017-05-05 06:39:45', '::1'),
(915, 2, NULL, NULL, NULL, '2017-05-05 07:05:05', '::1'),
(916, 1, NULL, NULL, NULL, '2017-05-05 07:33:45', '::1'),
(917, 6, NULL, NULL, NULL, '2017-05-05 08:21:17', '::1'),
(918, 2, NULL, NULL, NULL, '2017-05-05 08:22:07', '::1'),
(919, 1, NULL, NULL, NULL, '2017-05-05 10:56:21', '::1'),
(920, 1, NULL, NULL, NULL, '2017-05-05 10:57:01', '::1'),
(921, 1, NULL, NULL, NULL, '2017-05-05 10:57:08', '::1'),
(922, 1, NULL, NULL, NULL, '2017-05-05 10:57:17', '::1'),
(923, 1, NULL, NULL, NULL, '2017-05-05 10:59:46', '::1'),
(924, 1, NULL, NULL, NULL, '2017-05-05 11:02:10', '::1'),
(925, 1, NULL, NULL, NULL, '2017-05-05 11:03:59', '::1'),
(926, 1, NULL, NULL, NULL, '2017-05-05 11:04:15', '::1'),
(927, 1, NULL, NULL, NULL, '2017-05-05 11:14:41', '::1'),
(928, 1, NULL, NULL, NULL, '2017-05-05 11:16:13', '::1'),
(929, 3, NULL, NULL, NULL, '2017-05-05 11:17:26', '::1'),
(930, 1, NULL, NULL, NULL, '2017-05-05 12:26:52', '::1'),
(931, 2, NULL, NULL, NULL, '2017-05-05 12:37:27', '::1'),
(932, 4, NULL, NULL, NULL, '2017-05-05 12:42:27', '::1'),
(933, 4, NULL, NULL, NULL, '2017-05-05 12:43:05', '::1'),
(934, 7, NULL, NULL, 1, '2017-05-05 13:20:19', '::1'),
(935, 8, NULL, NULL, 1, '2017-05-05 13:41:19', '::1'),
(936, 6, NULL, NULL, 1, '2017-05-05 13:55:09', '::1'),
(937, 1, NULL, NULL, 1, '2017-05-05 15:01:53', '::1'),
(938, 1, NULL, NULL, 1, '2017-05-05 15:06:22', '::1'),
(939, 1, NULL, NULL, NULL, '2017-05-08 08:13:53', '::1'),
(940, 1, NULL, NULL, NULL, '2017-05-08 10:41:24', '::1'),
(941, 2, NULL, NULL, NULL, '2017-05-08 10:41:59', '::1'),
(942, 1, NULL, NULL, NULL, '2017-05-08 11:24:46', '::1'),
(943, 7, NULL, NULL, NULL, '2017-05-08 11:27:20', '::1'),
(944, 8, NULL, NULL, NULL, '2017-05-08 11:28:22', '::1'),
(945, 9, NULL, NULL, NULL, '2017-05-08 11:32:22', '::1'),
(946, 1, NULL, NULL, NULL, '2017-05-08 11:35:35', '::1'),
(947, 11, NULL, NULL, 3, '2017-05-08 11:49:27', '::1'),
(948, 12, NULL, NULL, 3, '2017-05-08 11:58:28', '::1'),
(949, 12, NULL, NULL, 3, '2017-05-08 11:59:57', '::1'),
(950, 12, NULL, NULL, 3, '2017-05-08 12:00:18', '::1'),
(951, 12, NULL, NULL, 3, '2017-05-08 12:02:54', '::1'),
(952, 14, NULL, NULL, 3, '2017-05-08 13:43:51', '::1'),
(953, 14, NULL, NULL, 3, '2017-05-08 13:45:19', '::1'),
(954, 1, NULL, NULL, 3, '2017-05-08 13:48:46', '::1'),
(955, 8, NULL, NULL, 3, '2017-05-08 14:04:04', '::1'),
(956, 5, NULL, NULL, 3, '2017-05-08 14:13:34', '::1'),
(957, 7, NULL, NULL, 3, '2017-05-08 14:34:57', '::1'),
(958, 3, NULL, NULL, 3, '2017-05-08 14:42:31', '::1'),
(959, 1, NULL, NULL, 3, '2017-05-08 14:43:58', '::1'),
(960, 1, NULL, NULL, 3, '2017-05-08 15:02:41', '::1'),
(961, 5, NULL, NULL, 3, '2017-05-08 15:19:05', '::1'),
(962, 7, NULL, NULL, 3, '2017-05-08 15:38:47', '::1'),
(963, 1, NULL, NULL, NULL, '2017-05-09 07:26:50', '::1'),
(964, 9, NULL, NULL, NULL, '2017-05-09 07:27:10', '::1'),
(965, 9, NULL, NULL, NULL, '2017-05-09 07:28:18', '::1'),
(966, 14, NULL, NULL, NULL, '2017-05-09 08:35:35', '::1'),
(967, 1, NULL, NULL, NULL, '2017-05-09 08:48:29', '::1'),
(968, 7, NULL, NULL, NULL, '2017-05-09 09:03:14', '::1'),
(969, 16, NULL, NULL, NULL, '2017-05-09 09:06:27', '::1'),
(970, 3, NULL, NULL, NULL, '2017-05-09 09:42:21', '::1'),
(971, 6, NULL, NULL, NULL, '2017-05-09 10:25:15', '::1'),
(972, 5, NULL, NULL, NULL, '2017-05-09 10:40:36', '::1'),
(973, 6, NULL, NULL, NULL, '2017-05-09 10:40:46', '::1'),
(974, 16, NULL, NULL, NULL, '2017-05-09 10:53:48', '::1'),
(975, 16, NULL, NULL, 1, '2017-05-09 10:54:13', '::1'),
(976, 2, NULL, NULL, 1, '2017-05-09 11:47:48', '::1'),
(977, 2, NULL, NULL, 1, '2017-05-09 12:09:57', '::1'),
(978, 2, NULL, NULL, 1, '2017-05-09 12:13:12', '::1'),
(979, 2, NULL, NULL, 1, '2017-05-09 12:21:02', '::1'),
(980, 2, NULL, NULL, 1, '2017-05-09 12:21:56', '::1'),
(981, 2, NULL, NULL, 1, '2017-05-09 12:23:35', '::1'),
(982, 2, NULL, NULL, 1, '2017-05-09 12:40:31', '::1'),
(983, 12, NULL, NULL, 1, '2017-05-09 12:48:14', '::1'),
(984, 12, NULL, NULL, 1, '2017-05-09 13:00:49', '::1'),
(985, 12, NULL, NULL, 1, '2017-05-09 13:05:56', '::1'),
(986, 12, NULL, NULL, 1, '2017-05-09 13:08:35', '::1'),
(987, 6, NULL, NULL, NULL, '2017-05-09 13:48:29', '::1'),
(988, 15, NULL, NULL, NULL, '2017-05-09 13:50:35', '::1'),
(989, 12, NULL, NULL, NULL, '2017-05-09 13:53:25', '::1'),
(990, 1, NULL, NULL, 1, '2017-05-09 13:55:10', '::1'),
(991, 2, NULL, NULL, 1, '2017-05-09 14:34:30', '::1'),
(992, 6, NULL, NULL, NULL, '2017-05-10 07:32:36', '::1'),
(993, 4, NULL, NULL, NULL, '2017-05-10 07:45:42', '::1'),
(994, 4, NULL, NULL, NULL, '2017-05-10 07:47:17', '::1'),
(995, 4, NULL, NULL, NULL, '2017-05-10 07:49:09', '::1'),
(996, NULL, 1, NULL, 1, '2017-05-10 07:56:13', '::1'),
(997, NULL, 1, NULL, 1, '2017-05-10 07:59:10', '::1'),
(998, NULL, 1, NULL, 1, '2017-05-10 08:00:09', '::1'),
(999, NULL, 1, NULL, 1, '2017-05-10 08:00:50', '::1'),
(1000, NULL, 1, NULL, 1, '2017-05-10 08:01:37', '::1'),
(1001, NULL, 1, NULL, 1, '2017-05-10 08:02:45', '::1'),
(1002, NULL, 1, NULL, 1, '2017-05-10 08:04:30', '::1'),
(1003, NULL, 1, NULL, 1, '2017-05-10 08:05:10', '::1'),
(1004, NULL, 1, NULL, 1, '2017-05-10 08:06:45', '::1'),
(1005, NULL, 1, NULL, 1, '2017-05-10 08:08:46', '::1'),
(1006, NULL, 1, NULL, 1, '2017-05-10 08:10:25', '::1'),
(1007, NULL, 1, NULL, 1, '2017-05-10 08:11:27', '::1'),
(1008, NULL, 1, NULL, 1, '2017-05-10 08:11:43', '::1'),
(1009, NULL, NULL, 1, 1, '2017-05-10 08:12:09', '::1'),
(1010, NULL, NULL, 1, 1, '2017-05-10 08:13:35', '::1'),
(1011, NULL, NULL, 1, 1, '2017-05-10 08:14:05', '::1'),
(1012, 4, NULL, NULL, 1, '2017-05-10 11:13:22', '::1'),
(1013, 7, NULL, NULL, 1, '2017-05-10 11:25:41', '::1'),
(1014, 7, NULL, NULL, 1, '2017-05-10 11:26:00', '::1'),
(1015, 17, NULL, NULL, 1, '2017-05-12 12:31:22', '::1'),
(1016, 17, NULL, NULL, 1, '2017-05-12 12:35:01', '::1'),
(1017, 2, NULL, NULL, NULL, '2017-05-15 07:19:01', '::1'),
(1018, 3, NULL, NULL, NULL, '2017-05-15 07:21:32', '::1'),
(1019, 17, NULL, NULL, NULL, '2017-05-15 07:21:59', '::1'),
(1020, 17, NULL, NULL, 2, '2017-05-15 07:22:48', '::1'),
(1021, 14, NULL, NULL, 2, '2017-05-15 07:29:59', '::1'),
(1022, 13, NULL, NULL, 2, '2017-05-15 07:31:09', '::1'),
(1023, 13, NULL, NULL, 2, '2017-05-15 07:31:26', '::1'),
(1024, 13, NULL, NULL, 2, '2017-05-15 07:37:26', '::1'),
(1025, 2, NULL, NULL, 2, '2017-05-15 07:50:30', '::1'),
(1026, 8, NULL, NULL, 2, '2017-05-15 07:51:24', '::1'),
(1027, 2, NULL, NULL, 2, '2017-05-15 10:29:38', '::1'),
(1028, 3, NULL, NULL, 2, '2017-05-15 10:31:06', '::1'),
(1029, 2, NULL, NULL, 2, '2017-05-15 11:40:06', '::1'),
(1030, 8, NULL, NULL, 2, '2017-05-15 12:43:31', '::1'),
(1031, 1, NULL, NULL, 2, '2017-05-15 12:58:19', '::1'),
(1032, 1, NULL, NULL, 2, '2017-05-15 14:28:31', '::1'),
(1033, 1, NULL, NULL, 2, '2017-05-15 14:39:47', '::1'),
(1034, 13, NULL, NULL, 2, '2017-05-15 14:40:15', '::1'),
(1035, 2, NULL, NULL, 2, '2017-05-15 14:42:33', '::1'),
(1036, 7, NULL, NULL, 2, '2017-05-15 14:43:01', '::1'),
(1037, 3, NULL, NULL, 2, '2017-05-15 14:43:10', '::1'),
(1038, 16, NULL, NULL, 2, '2017-05-15 14:54:41', '::1'),
(1039, 3, NULL, NULL, 2, '2017-05-15 15:04:04', '::1'),
(1040, 3, NULL, NULL, 2, '2017-05-15 15:04:46', '::1'),
(1041, 3, NULL, NULL, 2, '2017-05-15 15:06:10', '::1'),
(1042, 3, NULL, NULL, 2, '2017-05-15 15:06:24', '::1'),
(1043, 7, NULL, NULL, 2, '2017-05-15 15:21:38', '::1'),
(1044, 3, NULL, NULL, NULL, '2017-05-16 06:34:50', '::1'),
(1045, 3, NULL, NULL, NULL, '2017-05-16 06:36:23', '::1'),
(1046, 7, NULL, NULL, 1, '2017-05-16 07:05:53', '::1'),
(1047, 1, NULL, NULL, 1, '2017-05-16 07:14:44', '::1'),
(1048, 7, NULL, NULL, 1, '2017-05-16 07:18:01', '::1'),
(1049, 2, NULL, NULL, 1, '2017-05-16 11:55:54', '::1'),
(1050, 3, NULL, NULL, 1, '2017-05-16 12:12:54', '::1'),
(1051, 3, NULL, NULL, 1, '2017-05-16 12:18:08', '::1'),
(1052, 3, NULL, NULL, 1, '2017-05-16 12:18:23', '::1'),
(1053, 3, NULL, NULL, 1, '2017-05-16 12:18:34', '::1'),
(1054, 3, NULL, NULL, 1, '2017-05-16 12:20:33', '::1'),
(1055, 3, NULL, NULL, 1, '2017-05-16 12:23:03', '::1'),
(1056, 3, NULL, NULL, 1, '2017-05-16 12:23:04', '::1'),
(1057, 3, NULL, NULL, 1, '2017-05-16 12:23:52', '::1'),
(1058, 3, NULL, NULL, 1, '2017-05-16 12:23:54', '::1'),
(1059, 3, NULL, NULL, 1, '2017-05-16 12:25:03', '::1'),
(1060, 3, NULL, NULL, 1, '2017-05-16 12:25:06', '::1'),
(1061, 3, NULL, NULL, 1, '2017-05-16 12:27:42', '::1'),
(1062, 3, NULL, NULL, 1, '2017-05-16 12:28:25', '::1'),
(1063, 3, NULL, NULL, 1, '2017-05-16 12:30:07', '::1'),
(1064, 3, NULL, NULL, 1, '2017-05-16 12:30:19', '::1'),
(1065, 3, NULL, NULL, 1, '2017-05-16 12:30:28', '::1'),
(1066, 3, NULL, NULL, 1, '2017-05-16 12:31:45', '::1'),
(1067, 3, NULL, NULL, 1, '2017-05-16 12:31:59', '::1'),
(1068, 3, NULL, NULL, 1, '2017-05-16 12:33:00', '::1'),
(1069, 3, NULL, NULL, 1, '2017-05-16 12:33:21', '::1'),
(1070, 3, NULL, NULL, 1, '2017-05-16 12:38:00', '::1'),
(1071, 3, NULL, NULL, 1, '2017-05-16 12:38:50', '::1'),
(1072, 3, NULL, NULL, 1, '2017-05-16 12:39:01', '::1'),
(1073, 3, NULL, NULL, 1, '2017-05-16 12:41:05', '::1'),
(1074, 2, NULL, NULL, 1, '2017-05-16 12:47:50', '::1'),
(1075, 3, NULL, NULL, 1, '2017-05-16 13:57:04', '::1'),
(1076, 3, NULL, NULL, 1, '2017-05-16 13:57:17', '::1'),
(1077, 3, NULL, NULL, 1, '2017-05-16 14:05:27', '::1'),
(1078, 3, NULL, NULL, 1, '2017-05-16 14:05:51', '::1'),
(1079, 3, NULL, NULL, 1, '2017-05-16 14:06:01', '::1'),
(1080, 3, NULL, NULL, 1, '2017-05-16 14:07:40', '::1'),
(1081, 3, NULL, NULL, 1, '2017-05-16 14:12:42', '::1'),
(1082, 3, NULL, NULL, 1, '2017-05-16 14:20:23', '::1'),
(1083, 3, NULL, NULL, NULL, '2017-05-17 07:38:40', '::1'),
(1084, 3, NULL, NULL, NULL, '2017-05-17 07:39:41', '::1'),
(1085, 13, NULL, NULL, NULL, '2017-05-17 07:41:26', '::1'),
(1086, 3, NULL, NULL, 1, '2017-05-17 07:44:39', '::1'),
(1087, NULL, 1, NULL, 1, '2017-05-17 07:49:09', '::1'),
(1088, NULL, 1, NULL, 1, '2017-05-17 07:49:58', '::1'),
(1089, NULL, 3, NULL, 1, '2017-05-17 07:50:20', '::1'),
(1090, NULL, NULL, 2, 1, '2017-05-17 07:50:38', '::1'),
(1091, NULL, NULL, 5, 1, '2017-05-17 07:50:55', '::1'),
(1092, 3, NULL, NULL, 1, '2017-05-17 07:51:35', '::1'),
(1093, 3, NULL, NULL, 1, '2017-05-17 07:55:53', '::1'),
(1094, 3, NULL, NULL, 1, '2017-05-17 07:58:22', '::1'),
(1095, 3, NULL, NULL, 1, '2017-05-17 08:01:48', '::1'),
(1096, 3, NULL, NULL, 1, '2017-05-17 08:03:40', '::1'),
(1097, 3, NULL, NULL, 1, '2017-05-17 08:05:42', '::1'),
(1098, 3, NULL, NULL, 1, '2017-05-17 08:07:41', '::1'),
(1099, 3, NULL, NULL, 1, '2017-05-17 08:11:19', '::1'),
(1100, 3, NULL, NULL, 1, '2017-05-17 08:12:31', '::1'),
(1101, 3, NULL, NULL, 1, '2017-05-17 08:16:20', '::1'),
(1102, 3, NULL, NULL, 1, '2017-05-17 08:17:03', '::1'),
(1103, 3, NULL, NULL, 1, '2017-05-17 08:17:17', '::1'),
(1104, 3, NULL, NULL, 1, '2017-05-17 08:19:31', '::1'),
(1105, 3, NULL, NULL, 1, '2017-05-17 08:21:02', '::1'),
(1106, 3, NULL, NULL, 1, '2017-05-17 08:22:53', '::1'),
(1107, 3, NULL, NULL, 1, '2017-05-17 08:23:31', '::1'),
(1108, 3, NULL, NULL, 1, '2017-05-17 08:25:20', '::1'),
(1109, 3, NULL, NULL, 1, '2017-05-17 08:26:16', '::1'),
(1110, 3, NULL, NULL, 1, '2017-05-17 08:29:12', '::1'),
(1111, 3, NULL, NULL, 1, '2017-05-17 08:33:12', '::1'),
(1112, 3, NULL, NULL, 1, '2017-05-17 08:49:04', '::1'),
(1113, 3, NULL, NULL, 1, '2017-05-17 08:52:44', '::1'),
(1114, 3, NULL, NULL, 1, '2017-05-17 08:54:51', '::1'),
(1115, 3, NULL, NULL, 1, '2017-05-17 08:55:40', '::1'),
(1116, 3, NULL, NULL, 1, '2017-05-17 09:00:45', '::1'),
(1117, 3, NULL, NULL, 1, '2017-05-17 09:03:06', '::1'),
(1118, 16, NULL, NULL, 1, '2017-05-17 09:20:24', '::1'),
(1119, 3, NULL, NULL, 1, '2017-05-17 09:27:40', '::1'),
(1120, 7, NULL, NULL, 1, '2017-05-17 09:27:57', '::1'),
(1121, 2, NULL, NULL, 1, '2017-05-17 09:28:59', '::1'),
(1122, 2, NULL, NULL, 1, '2017-05-17 09:29:58', '::1'),
(1123, 2, NULL, NULL, 1, '2017-05-17 09:37:19', '::1'),
(1124, 2, NULL, NULL, 1, '2017-05-17 09:37:53', '::1'),
(1125, 2, NULL, NULL, 1, '2017-05-17 09:39:51', '::1'),
(1126, 2, NULL, NULL, 1, '2017-05-17 09:40:15', '::1'),
(1127, 2, NULL, NULL, 1, '2017-05-17 09:41:10', '::1'),
(1128, 7, NULL, NULL, 1, '2017-05-17 09:41:59', '::1'),
(1129, 16, NULL, NULL, 1, '2017-05-17 09:59:36', '::1'),
(1130, 9, NULL, NULL, 1, '2017-05-17 10:03:39', '::1'),
(1131, 4, NULL, NULL, 1, '2017-05-17 10:25:10', '::1'),
(1132, 1, NULL, NULL, 2, '2017-05-18 07:48:14', '::1'),
(1133, 15, NULL, NULL, 2, '2017-05-18 08:53:00', '::1'),
(1134, 11, NULL, NULL, 2, '2017-05-18 08:53:58', '::1'),
(1135, 15, NULL, NULL, 2, '2017-05-18 08:55:24', '::1'),
(1136, 13, NULL, NULL, 2, '2017-05-18 11:15:06', '::1'),
(1137, 11, NULL, NULL, 2, '2017-05-18 11:15:13', '::1'),
(1138, 13, NULL, NULL, 2, '2017-05-18 11:23:48', '::1'),
(1139, 13, NULL, NULL, 2, '2017-05-18 11:25:34', '::1'),
(1140, 7, NULL, NULL, 2, '2017-05-18 13:21:36', '::1'),
(1141, 17, NULL, NULL, 2, '2017-05-18 13:34:25', '::1'),
(1142, 17, NULL, NULL, 2, '2017-05-18 13:34:47', '::1'),
(1143, 6, NULL, NULL, NULL, '2017-05-19 07:49:32', '::1'),
(1144, NULL, 4, NULL, 1, '2017-05-19 09:13:37', '::1'),
(1145, NULL, 1, NULL, 1, '2017-05-19 09:21:18', '::1'),
(1146, NULL, 1, NULL, 1, '2017-05-19 09:21:43', '::1'),
(1147, NULL, 1, NULL, 1, '2017-05-19 09:22:10', '::1'),
(1148, NULL, 1, NULL, 1, '2017-05-19 09:22:54', '::1'),
(1149, NULL, 1, NULL, 1, '2017-05-19 09:25:49', '::1'),
(1150, NULL, 4, NULL, 1, '2017-05-19 09:37:45', '::1'),
(1151, 2, NULL, NULL, 1, '2017-05-19 12:41:07', '::1'),
(1152, NULL, 12, NULL, 1, '2017-05-19 12:55:54', '::1'),
(1153, NULL, 1, NULL, 1, '2017-05-19 13:12:14', '::1'),
(1154, NULL, 1, NULL, 3, '2017-05-19 13:15:28', '::1'),
(1155, NULL, 1, NULL, 3, '2017-05-19 13:20:35', '::1'),
(1156, NULL, 1, NULL, 3, '2017-05-19 13:22:17', '::1'),
(1157, NULL, 1, NULL, 3, '2017-05-19 13:53:04', '::1'),
(1158, NULL, 1, NULL, 3, '2017-05-19 13:56:56', '::1'),
(1159, NULL, 1, NULL, 3, '2017-05-19 14:03:54', '::1'),
(1160, NULL, 1, NULL, 3, '2017-05-19 14:14:41', '::1'),
(1161, NULL, 1, NULL, 3, '2017-05-19 14:18:39', '::1'),
(1162, NULL, 1, NULL, 3, '2017-05-19 14:18:48', '::1'),
(1163, NULL, 1, NULL, 3, '2017-05-19 14:18:58', '::1'),
(1164, NULL, 1, NULL, 3, '2017-05-19 14:20:25', '::1'),
(1165, NULL, 1, NULL, 3, '2017-05-19 14:29:44', '::1'),
(1166, NULL, 1, NULL, 3, '2017-05-19 15:04:44', '::1'),
(1167, NULL, 1, NULL, 3, '2017-05-19 15:06:20', '::1'),
(1168, NULL, 3, NULL, 3, '2017-05-19 15:06:35', '::1'),
(1169, NULL, 1, NULL, 3, '2017-05-19 15:18:48', '::1'),
(1170, NULL, 3, NULL, 3, '2017-05-19 15:18:50', '::1'),
(1171, NULL, 1, NULL, 3, '2017-05-19 15:27:32', '::1'),
(1172, NULL, 1, NULL, 3, '2017-05-19 15:27:50', '::1'),
(1173, NULL, 3, NULL, 3, '2017-05-19 15:27:53', '::1'),
(1174, NULL, 1, NULL, 3, '2017-05-19 15:50:36', '::1'),
(1175, NULL, 3, NULL, 3, '2017-05-19 15:50:38', '::1'),
(1176, NULL, 1, NULL, 3, '2017-05-19 15:56:00', '::1'),
(1177, NULL, 1, NULL, 3, '2017-05-19 15:59:32', '::1'),
(1178, NULL, 1, NULL, 3, '2017-05-19 16:00:12', '::1'),
(1179, NULL, 1, NULL, 3, '2017-05-19 16:04:30', '::1'),
(1180, NULL, 1, NULL, 3, '2017-05-19 16:05:21', '::1'),
(1181, NULL, 1, NULL, 3, '2017-05-19 16:05:38', '::1'),
(1182, NULL, 1, NULL, 3, '2017-05-19 16:06:52', '::1'),
(1183, NULL, 3, NULL, 3, '2017-05-19 16:06:55', '::1'),
(1184, NULL, 1, NULL, 3, '2017-05-19 16:10:33', '::1'),
(1185, NULL, 3, NULL, 3, '2017-05-19 16:10:41', '::1'),
(1186, NULL, 1, NULL, 3, '2017-05-19 16:11:40', '::1'),
(1187, NULL, 1, NULL, 3, '2017-05-19 16:12:45', '::1'),
(1188, NULL, 1, NULL, 3, '2017-05-19 16:13:16', '::1'),
(1189, NULL, 1, NULL, 3, '2017-05-19 16:14:05', '::1'),
(1190, NULL, 3, NULL, 3, '2017-05-19 16:14:26', '::1'),
(1191, NULL, 1, NULL, 3, '2017-05-19 16:14:49', '::1'),
(1192, NULL, 3, NULL, 3, '2017-05-19 16:15:05', '::1'),
(1193, NULL, 1, NULL, 3, '2017-05-19 16:15:07', '::1'),
(1194, NULL, 1, NULL, 3, '2017-05-19 16:15:45', '::1'),
(1195, NULL, 1, NULL, 3, '2017-05-19 16:16:07', '::1'),
(1196, NULL, 3, NULL, 3, '2017-05-19 16:16:18', '::1'),
(1197, NULL, 1, NULL, 3, '2017-05-19 16:16:41', '::1'),
(1198, NULL, 1, NULL, 3, '2017-05-19 16:17:27', '::1'),
(1199, NULL, 1, NULL, 3, '2017-05-19 16:18:44', '::1'),
(1200, NULL, 1, NULL, 3, '2017-05-19 16:19:47', '::1'),
(1201, 1, NULL, NULL, 3, '2017-05-19 16:27:53', '::1'),
(1202, NULL, 1, NULL, 3, '2017-05-19 16:28:26', '::1'),
(1203, NULL, 1, NULL, 3, '2017-05-19 16:36:45', '::1'),
(1204, NULL, 1, NULL, 3, '2017-05-19 16:38:13', '::1'),
(1205, 15, NULL, NULL, 3, '2017-05-19 16:42:47', '::1'),
(1206, 5, NULL, NULL, 3, '2017-05-19 16:45:50', '::1'),
(1207, NULL, 1, NULL, 3, '2017-05-19 16:50:30', '::1'),
(1208, 12, NULL, NULL, 3, '2017-05-19 16:57:42', '::1'),
(1209, NULL, 1, NULL, 3, '2017-05-19 17:01:09', '::1'),
(1210, NULL, 1, NULL, NULL, '2017-05-22 07:59:14', '::1'),
(1211, NULL, 1, NULL, NULL, '2017-05-22 08:19:06', '::1'),
(1212, NULL, 1, NULL, NULL, '2017-05-22 08:23:23', '::1'),
(1213, NULL, NULL, 1, NULL, '2017-05-22 08:29:44', '::1'),
(1214, NULL, NULL, 1, 4, '2017-05-22 08:31:48', '::1'),
(1215, NULL, NULL, 1, 5, '2017-05-22 08:34:32', '::1'),
(1216, NULL, NULL, 1, 5, '2017-05-22 08:39:09', '::1'),
(1217, NULL, NULL, 1, 5, '2017-05-22 08:46:28', '::1'),
(1218, NULL, 1, NULL, 5, '2017-05-22 08:49:14', '::1'),
(1219, NULL, NULL, 1, 5, '2017-05-22 08:51:51', '::1'),
(1220, NULL, NULL, 1, 5, '2017-05-22 08:53:17', '::1'),
(1221, NULL, NULL, 1, 5, '2017-05-22 08:58:49', '::1'),
(1222, NULL, NULL, 1, 5, '2017-05-22 09:01:19', '::1'),
(1223, NULL, NULL, 1, 5, '2017-05-22 09:07:41', '::1'),
(1224, NULL, NULL, 1, 5, '2017-05-22 09:07:51', '::1'),
(1225, NULL, NULL, 1, 5, '2017-05-22 09:08:15', '::1'),
(1226, NULL, NULL, 1, 5, '2017-05-22 09:09:19', '::1'),
(1227, NULL, NULL, 1, 5, '2017-05-22 09:11:04', '::1'),
(1228, NULL, 1, NULL, 5, '2017-05-22 09:12:35', '::1'),
(1229, NULL, NULL, 1, 5, '2017-05-22 09:12:36', '::1'),
(1230, NULL, NULL, 1, 5, '2017-05-22 09:13:15', '::1'),
(1231, NULL, NULL, 1, 5, '2017-05-22 09:14:24', '::1'),
(1232, NULL, NULL, 1, 5, '2017-05-22 09:25:27', '::1'),
(1233, NULL, 1, NULL, 5, '2017-05-22 09:25:28', '::1'),
(1234, NULL, NULL, 1, 5, '2017-05-22 09:29:43', '::1'),
(1235, NULL, NULL, 1, 5, '2017-05-22 09:30:50', '::1'),
(1236, NULL, NULL, 1, 5, '2017-05-22 09:38:43', '::1'),
(1237, NULL, NULL, 1, 5, '2017-05-22 09:42:04', '::1'),
(1238, NULL, 1, NULL, 5, '2017-05-22 09:42:43', '::1'),
(1239, NULL, NULL, 1, 5, '2017-05-22 09:44:18', '::1'),
(1240, NULL, NULL, 1, 5, '2017-05-22 09:45:52', '::1'),
(1241, NULL, 1, NULL, 5, '2017-05-22 09:46:48', '::1'),
(1242, NULL, 1, NULL, 5, '2017-05-22 09:47:35', '::1'),
(1243, NULL, NULL, 1, 5, '2017-05-22 09:47:35', '::1'),
(1244, NULL, 1, NULL, 5, '2017-05-22 09:52:21', '::1'),
(1245, NULL, NULL, 1, 5, '2017-05-22 09:53:42', '::1'),
(1246, NULL, 1, NULL, 5, '2017-05-22 09:53:44', '::1'),
(1247, NULL, 1, NULL, NULL, '2017-05-22 10:08:37', '::1'),
(1248, 1, NULL, NULL, NULL, '2017-05-22 10:37:51', '::1'),
(1249, NULL, NULL, 1, NULL, '2017-05-22 10:38:41', '::1'),
(1250, NULL, NULL, 1, 11, '2017-05-22 11:04:27', '::1'),
(1251, NULL, 1, NULL, 11, '2017-05-22 11:05:38', '::1'),
(1252, 3, NULL, NULL, 11, '2017-05-22 11:08:54', '::1'),
(1253, 5, NULL, NULL, 11, '2017-05-22 11:18:14', '::1'),
(1254, 15, NULL, NULL, 11, '2017-05-22 12:12:00', '::1'),
(1255, NULL, 1, NULL, 11, '2017-05-22 12:39:10', '::1'),
(1256, 1, NULL, NULL, 11, '2017-05-22 12:42:44', '::1'),
(1257, 1, NULL, NULL, 11, '2017-05-22 12:43:47', '::1'),
(1258, 1, NULL, NULL, 11, '2017-05-22 12:44:06', '::1'),
(1259, 2, NULL, NULL, 11, '2017-05-22 12:44:47', '::1'),
(1260, 17, NULL, NULL, 11, '2017-05-22 12:45:04', '::1'),
(1261, 7, NULL, NULL, 11, '2017-05-22 12:57:03', '::1'),
(1262, 7, NULL, NULL, 11, '2017-05-22 13:13:25', '::1'),
(1263, 6, NULL, NULL, 11, '2017-05-22 13:13:40', '::1'),
(1264, 14, NULL, NULL, 11, '2017-05-22 14:48:48', '::1'),
(1265, 14, NULL, NULL, 11, '2017-05-22 15:07:59', '::1'),
(1266, NULL, NULL, 1, 11, '2017-05-22 15:08:13', '::1'),
(1267, 1, NULL, NULL, NULL, '2017-05-23 08:01:52', '::1'),
(1268, 1, NULL, NULL, 1, '2017-05-23 08:03:42', '::1'),
(1269, 1, NULL, NULL, 1, '2017-05-23 08:04:06', '::1'),
(1270, 1, NULL, NULL, 1, '2017-05-23 08:04:21', '::1'),
(1271, 1, NULL, NULL, 1, '2017-05-23 08:05:22', '::1'),
(1272, 1, NULL, NULL, 1, '2017-05-23 08:05:36', '::1'),
(1273, NULL, NULL, 1, 1, '2017-05-23 08:08:07', '::1'),
(1274, 1, NULL, NULL, 1, '2017-05-23 08:09:51', '::1'),
(1275, 1, NULL, NULL, 1, '2017-05-23 08:31:36', '::1'),
(1276, 2, NULL, NULL, 1, '2017-05-23 09:01:09', '::1'),
(1277, NULL, 1, NULL, 1, '2017-05-23 09:20:27', '::1'),
(1278, 13, NULL, NULL, 1, '2017-05-23 09:40:35', '::1'),
(1279, 27, NULL, NULL, 1, '2017-05-23 11:02:34', '::1'),
(1280, 22, NULL, NULL, 1, '2017-05-23 11:03:31', '::1'),
(1281, 8, NULL, NULL, 1, '2017-05-23 11:03:38', '::1'),
(1282, 28, NULL, NULL, 1, '2017-05-23 11:05:03', '::1'),
(1283, 8, NULL, NULL, 1, '2017-05-23 11:19:04', '::1'),
(1284, 24, NULL, NULL, 1, '2017-05-23 11:20:06', '::1'),
(1285, 24, NULL, NULL, 1, '2017-05-23 11:22:35', '::1'),
(1286, 24, NULL, NULL, 1, '2017-05-23 11:22:43', '::1'),
(1287, 24, NULL, NULL, 1, '2017-05-23 11:23:18', '::1'),
(1288, 24, NULL, NULL, 1, '2017-05-23 11:24:07', '::1'),
(1289, 24, NULL, NULL, 1, '2017-05-23 11:25:34', '::1'),
(1290, 24, NULL, NULL, 1, '2017-05-23 11:27:20', '::1'),
(1291, 24, NULL, NULL, 1, '2017-05-23 11:28:06', '::1'),
(1292, 2, NULL, NULL, 1, '2017-05-23 11:28:21', '::1'),
(1293, 24, NULL, NULL, 1, '2017-05-23 11:32:05', '::1'),
(1294, 24, NULL, NULL, 1, '2017-05-23 11:40:34', '::1'),
(1295, 27, NULL, NULL, 1, '2017-05-23 13:12:33', '::1'),
(1296, 25, NULL, NULL, 1, '2017-05-23 14:02:55', '::1'),
(1297, 25, NULL, NULL, 1, '2017-05-23 14:03:57', '::1'),
(1298, 17, NULL, NULL, 1, '2017-05-23 14:10:29', '::1'),
(1299, 1, NULL, NULL, 1, '2017-05-23 14:16:32', '::1'),
(1300, 5, NULL, NULL, 1, '2017-05-23 14:25:14', '::1'),
(1301, 7, NULL, NULL, 1, '2017-05-23 14:27:43', '::1'),
(1302, 7, NULL, NULL, 1, '2017-05-23 14:31:36', '::1'),
(1303, 7, NULL, NULL, 1, '2017-05-23 14:34:25', '::1'),
(1304, 7, NULL, NULL, 1, '2017-05-23 14:34:59', '::1'),
(1305, NULL, 1, NULL, 1, '2017-05-23 14:36:08', '::1'),
(1306, NULL, 1, NULL, 1, '2017-05-23 14:39:15', '::1'),
(1307, NULL, NULL, 1, 1, '2017-05-23 14:41:10', '::1'),
(1308, 6, NULL, NULL, 1, '2017-05-23 14:59:56', '::1'),
(1309, 11, NULL, NULL, 1, '2017-05-23 15:23:51', '::1'),
(1310, 17, NULL, NULL, 1, '2017-05-23 15:33:16', '::1'),
(1311, 17, NULL, NULL, 1, '2017-05-23 15:33:35', '::1'),
(1312, 5, NULL, NULL, 1, '2017-05-23 15:41:14', '::1'),
(1313, 7, NULL, NULL, 1, '2017-05-23 15:48:35', '::1'),
(1314, 3, NULL, NULL, 1, '2017-05-23 15:53:24', '::1'),
(1315, 9, NULL, NULL, 3, '2017-05-23 16:03:46', '::1'),
(1316, 9, NULL, NULL, 3, '2017-05-23 16:05:02', '::1'),
(1317, 9, NULL, NULL, 3, '2017-05-23 16:06:14', '::1'),
(1318, 15, NULL, NULL, 3, '2017-05-23 16:18:16', '::1'),
(1319, 20, NULL, NULL, 3, '2017-05-23 16:30:56', '::1'),
(1320, 24, NULL, NULL, 3, '2017-05-23 16:41:16', '::1'),
(1321, 23, NULL, NULL, 3, '2017-05-23 16:47:18', '::1'),
(1322, 1, NULL, NULL, NULL, '2017-05-24 06:55:00', '::1'),
(1323, 28, NULL, NULL, NULL, '2017-05-24 06:56:48', '::1'),
(1324, 28, NULL, NULL, 4, '2017-05-24 06:57:21', '::1'),
(1325, 28, NULL, NULL, 4, '2017-05-24 06:58:41', '::1'),
(1326, 23, NULL, NULL, 4, '2017-05-24 06:59:06', '::1'),
(1327, 23, NULL, NULL, 4, '2017-05-24 07:01:07', '::1'),
(1328, 1, NULL, NULL, 4, '2017-05-24 07:44:48', '::1'),
(1329, 1, NULL, NULL, 4, '2017-05-24 07:47:01', '::1'),
(1330, 9, NULL, NULL, 4, '2017-05-24 07:47:47', '::1'),
(1331, 9, NULL, NULL, 4, '2017-05-24 07:51:45', '::1'),
(1332, 1, NULL, NULL, 4, '2017-05-24 07:52:02', '::1'),
(1333, NULL, NULL, 1, 4, '2017-05-24 07:52:35', '::1'),
(1334, 21, NULL, NULL, 4, '2017-05-24 07:57:22', '::1'),
(1335, 6, NULL, NULL, 4, '2017-05-24 08:02:42', '::1'),
(1336, NULL, 1, NULL, 4, '2017-05-24 08:05:53', '::1'),
(1337, NULL, 1, NULL, 4, '2017-05-24 08:06:33', '::1'),
(1338, 19, NULL, NULL, 4, '2017-05-24 08:10:31', '::1'),
(1339, 19, NULL, NULL, 4, '2017-05-24 08:13:29', '::1'),
(1340, 19, NULL, NULL, 4, '2017-05-24 08:13:43', '::1'),
(1341, 19, NULL, NULL, 4, '2017-05-24 08:13:50', '::1'),
(1342, 19, NULL, NULL, 4, '2017-05-24 08:13:57', '::1'),
(1343, 12, NULL, NULL, 4, '2017-05-24 08:14:35', '::1'),
(1344, 7, NULL, NULL, 4, '2017-05-24 08:22:40', '::1'),
(1345, 5, NULL, NULL, 4, '2017-05-24 08:23:25', '::1'),
(1346, 9, NULL, NULL, 4, '2017-05-24 08:23:53', '::1'),
(1347, 9, NULL, NULL, 4, '2017-05-24 08:26:45', '::1'),
(1348, 9, NULL, NULL, NULL, '2017-05-24 08:26:59', '::1'),
(1349, 1, NULL, NULL, NULL, '2017-05-24 08:27:18', '::1'),
(1350, NULL, 1, NULL, NULL, '2017-05-24 08:28:40', '::1'),
(1351, NULL, 1, NULL, NULL, '2017-05-24 08:28:41', '::1'),
(1352, 9, NULL, NULL, 4, '2017-05-24 08:50:34', '::1');
INSERT INTO `pm_view` (`id`, `school_id`, `post_id`, `advert_id`, `user_id`, `date`, `ip`) VALUES
(1353, 9, NULL, NULL, 4, '2017-05-24 09:02:44', '::1'),
(1354, 9, NULL, NULL, 4, '2017-05-24 09:03:18', '::1'),
(1355, 9, NULL, NULL, 4, '2017-05-24 09:05:53', '::1'),
(1356, 9, NULL, NULL, 4, '2017-05-24 09:06:45', '::1'),
(1357, 9, NULL, NULL, 4, '2017-05-24 09:07:47', '::1'),
(1358, 1, NULL, NULL, 4, '2017-05-24 09:11:07', '::1'),
(1359, 1, NULL, NULL, 4, '2017-05-24 09:11:15', '::1'),
(1360, 24, NULL, NULL, 4, '2017-05-24 09:12:44', '::1'),
(1361, NULL, 1, NULL, 4, '2017-05-24 09:16:50', '::1'),
(1362, NULL, 1, NULL, 4, '2017-05-24 10:15:44', '::1'),
(1363, NULL, 1, NULL, 4, '2017-05-24 12:24:45', '::1'),
(1364, NULL, 1, NULL, 4, '2017-05-24 13:18:03', '::1'),
(1365, NULL, NULL, 1, 4, '2017-05-24 13:18:16', '::1'),
(1366, NULL, 12, NULL, 4, '2017-05-24 14:26:50', '::1'),
(1367, NULL, 12, NULL, 4, '2017-05-24 14:28:38', '::1'),
(1368, NULL, 12, NULL, 4, '2017-05-24 14:29:24', '::1'),
(1369, NULL, 12, NULL, 4, '2017-05-24 14:29:40', '::1'),
(1370, NULL, 13, NULL, 4, '2017-05-24 14:41:51', '::1'),
(1371, 9, NULL, NULL, 4, '2017-05-24 14:48:02', '::1'),
(1372, 5, NULL, NULL, 4, '2017-05-24 14:52:43', '::1'),
(1373, NULL, 1, NULL, NULL, '2017-05-26 08:53:09', '::1'),
(1374, NULL, 2, NULL, NULL, '2017-05-26 08:55:56', '::1'),
(1375, NULL, 4, NULL, NULL, '2017-05-26 08:57:00', '::1'),
(1376, NULL, 13, NULL, NULL, '2017-05-26 09:22:20', '::1'),
(1377, 2, NULL, NULL, 2, '2017-05-26 09:34:10', '::1'),
(1378, NULL, 12, NULL, 2, '2017-05-26 12:26:07', '::1'),
(1379, NULL, 1, NULL, 2, '2017-05-26 12:26:24', '::1'),
(1380, 11, NULL, NULL, 2, '2017-05-26 12:29:02', '::1'),
(1381, 11, NULL, NULL, 2, '2017-05-26 12:31:07', '::1'),
(1382, 11, NULL, NULL, 2, '2017-05-26 12:31:48', '::1'),
(1383, 11, NULL, NULL, 2, '2017-05-26 12:36:39', '::1'),
(1384, NULL, 3, NULL, 2, '2017-05-26 12:45:34', '::1'),
(1385, 3, NULL, NULL, 2, '2017-05-26 12:49:27', '::1'),
(1386, 29, NULL, NULL, 2, '2017-05-26 13:13:21', '::1'),
(1387, 29, NULL, NULL, 2, '2017-05-26 13:13:41', '::1'),
(1388, 29, NULL, NULL, 2, '2017-05-26 13:25:25', '::1'),
(1389, 29, NULL, NULL, 2, '2017-05-26 13:25:36', '::1'),
(1390, 29, NULL, NULL, 2, '2017-05-26 13:27:30', '::1'),
(1391, 29, NULL, NULL, 2, '2017-05-26 13:29:19', '::1'),
(1392, 29, NULL, NULL, 2, '2017-05-26 13:29:40', '::1'),
(1393, 29, NULL, NULL, 2, '2017-05-26 13:50:50', '::1'),
(1394, 2, NULL, NULL, 2, '2017-05-26 14:47:24', '::1'),
(1395, 2, NULL, NULL, 2, '2017-05-26 15:18:16', '::1'),
(1396, 13, NULL, NULL, 2, '2017-05-26 15:20:29', '::1'),
(1397, 15, NULL, NULL, 2, '2017-05-26 15:23:14', '::1'),
(1398, 12, NULL, NULL, 2, '2017-05-26 15:25:06', '::1'),
(1399, 2, NULL, NULL, 2, '2017-05-26 15:25:47', '::1'),
(1400, 15, NULL, NULL, 2, '2017-05-26 15:34:18', '::1'),
(1401, 9, NULL, NULL, 2, '2017-05-26 15:35:52', '::1'),
(1402, 29, NULL, NULL, 2, '2017-05-26 15:37:27', '::1'),
(1403, NULL, 2, NULL, NULL, '2017-05-29 10:34:25', '::1'),
(1404, 1, NULL, NULL, 2, '2017-05-29 10:44:04', '::1'),
(1405, 1, NULL, NULL, 2, '2017-05-29 10:45:57', '::1'),
(1406, 1, NULL, NULL, 2, '2017-05-29 10:46:21', '::1'),
(1407, 1, NULL, NULL, 2, '2017-05-29 10:49:02', '::1'),
(1408, 1, NULL, NULL, 2, '2017-05-29 11:01:54', '::1'),
(1409, 1, NULL, NULL, 2, '2017-05-29 11:02:58', '::1'),
(1410, 1, NULL, NULL, 2, '2017-05-29 11:06:01', '::1'),
(1411, 1, NULL, NULL, 2, '2017-05-29 11:06:35', '::1'),
(1412, 1, NULL, NULL, 2, '2017-05-29 11:06:43', '::1'),
(1413, 1, NULL, NULL, 2, '2017-05-29 11:08:51', '::1'),
(1414, 1, NULL, NULL, 2, '2017-05-29 11:12:14', '::1'),
(1415, 1, NULL, NULL, 2, '2017-05-29 11:13:01', '::1'),
(1416, 1, NULL, NULL, 2, '2017-05-29 11:14:10', '::1'),
(1417, 1, NULL, NULL, 2, '2017-05-29 11:14:42', '::1'),
(1418, 1, NULL, NULL, 2, '2017-05-29 11:15:52', '::1'),
(1419, 1, NULL, NULL, 2, '2017-05-29 11:16:54', '::1'),
(1420, 1, NULL, NULL, 2, '2017-05-29 11:17:49', '::1'),
(1421, 1, NULL, NULL, 2, '2017-05-29 11:18:01', '::1'),
(1422, 1, NULL, NULL, 2, '2017-05-29 11:18:33', '::1'),
(1423, 1, NULL, NULL, 2, '2017-05-29 11:19:31', '::1'),
(1424, 1, NULL, NULL, 2, '2017-05-29 11:20:02', '::1'),
(1425, 1, NULL, NULL, 2, '2017-05-29 11:20:16', '::1'),
(1426, 1, NULL, NULL, 2, '2017-05-29 11:21:03', '::1'),
(1427, 1, NULL, NULL, 2, '2017-05-29 11:26:38', '::1'),
(1428, 1, NULL, NULL, 2, '2017-05-29 11:27:20', '::1'),
(1429, 1, NULL, NULL, 2, '2017-05-29 11:29:07', '::1'),
(1430, 1, NULL, NULL, 2, '2017-05-29 11:30:09', '::1'),
(1431, 1, NULL, NULL, 2, '2017-05-29 11:36:05', '::1'),
(1432, NULL, 1, NULL, 2, '2017-05-29 11:36:50', '::1'),
(1433, 1, NULL, NULL, 2, '2017-05-29 13:21:49', '::1'),
(1434, 1, NULL, NULL, 2, '2017-05-29 13:25:25', '::1'),
(1435, 1, NULL, NULL, 2, '2017-05-29 13:26:23', '::1'),
(1436, 1, NULL, NULL, 2, '2017-05-29 13:27:24', '::1'),
(1437, 1, NULL, NULL, 2, '2017-05-29 13:28:33', '::1'),
(1438, 1, NULL, NULL, 2, '2017-05-29 13:29:33', '::1'),
(1439, 2, NULL, NULL, 2, '2017-05-29 13:39:17', '::1'),
(1440, 3, NULL, NULL, 2, '2017-05-29 13:40:37', '::1'),
(1441, 3, NULL, NULL, 2, '2017-05-29 13:41:07', '::1'),
(1442, 5, NULL, NULL, 2, '2017-05-29 14:02:55', '::1'),
(1443, 3, NULL, NULL, 2, '2017-05-29 14:14:54', '::1'),
(1444, NULL, 1, NULL, 2, '2017-05-29 14:28:00', '::1'),
(1445, NULL, 1, NULL, 2, '2017-05-29 14:29:49', '::1'),
(1446, NULL, NULL, 1, 2, '2017-05-29 14:30:16', '::1'),
(1447, NULL, 1, NULL, 2, '2017-05-29 14:49:16', '::1'),
(1448, 9, NULL, NULL, 2, '2017-05-29 15:21:54', '::1'),
(1449, 3, NULL, NULL, NULL, '2017-05-30 10:57:49', '::1'),
(1450, 3, NULL, NULL, NULL, '2017-05-30 10:59:18', '::1'),
(1451, 9, NULL, NULL, NULL, '2017-05-30 11:01:35', '::1'),
(1452, 9, NULL, NULL, NULL, '2017-05-30 11:05:56', '::1'),
(1453, 1, NULL, NULL, 2, '2017-05-30 11:07:19', '::1'),
(1454, 1, NULL, NULL, 2, '2017-05-30 11:10:32', '::1'),
(1455, 29, NULL, NULL, 2, '2017-05-30 11:18:50', '::1'),
(1456, 30, NULL, NULL, 2, '2017-05-30 14:51:04', '::1'),
(1457, 30, NULL, NULL, 2, '2017-05-30 14:53:52', '::1'),
(1458, 29, NULL, NULL, 2, '2017-05-30 15:18:09', '::1'),
(1459, 9, NULL, NULL, 2, '2017-05-30 16:28:51', '::1'),
(1460, 9, NULL, NULL, 2, '2017-05-30 16:34:57', '::1'),
(1461, 9, NULL, NULL, 2, '2017-05-30 17:06:43', '::1'),
(1462, 29, NULL, NULL, NULL, '2017-05-31 07:32:54', '::1'),
(1463, 21, NULL, NULL, NULL, '2017-05-31 07:34:16', '::1'),
(1464, 14, NULL, NULL, 2, '2017-05-31 08:39:38', '::1'),
(1465, 4, NULL, NULL, 2, '2017-05-31 10:48:29', '::1'),
(1466, 4, NULL, NULL, 2, '2017-05-31 10:52:51', '::1'),
(1467, 1, NULL, NULL, 2, '2017-05-31 10:56:32', '::1'),
(1468, 4, NULL, NULL, 2, '2017-05-31 11:04:51', '::1'),
(1469, 21, NULL, NULL, 2, '2017-05-31 14:16:21', '::1'),
(1470, 2, NULL, NULL, 2, '2017-05-31 15:38:31', '::1'),
(1471, 4, NULL, NULL, 2, '2017-06-02 09:04:14', '::1'),
(1472, 4, NULL, NULL, 2, '2017-06-02 09:09:56', '::1'),
(1473, 29, NULL, NULL, 2, '2017-06-02 09:27:27', '::1'),
(1474, 4, NULL, NULL, 2, '2017-06-02 09:32:21', '::1'),
(1475, 5, NULL, NULL, NULL, '2017-06-08 07:12:13', '::1'),
(1476, 3, NULL, NULL, NULL, '2017-06-08 07:40:12', '::1'),
(1477, 1, NULL, NULL, 2, '2017-06-08 07:45:03', '::1'),
(1478, 39, NULL, NULL, 2, '2017-06-09 10:16:17', '::1'),
(1479, 2, NULL, NULL, 2, '2017-06-09 10:16:31', '::1'),
(1480, NULL, NULL, 1, 2, '2017-06-09 10:16:50', '::1'),
(1481, NULL, NULL, 1, 2, '2017-06-09 10:17:21', '::1'),
(1482, NULL, NULL, 1, 2, '2017-06-09 10:17:31', '::1'),
(1483, 29, NULL, NULL, 2, '2017-06-09 10:18:52', '::1'),
(1484, 29, NULL, NULL, 2, '2017-06-09 10:26:25', '::1'),
(1485, 29, NULL, NULL, 2, '2017-06-09 10:26:48', '::1'),
(1486, 36, NULL, NULL, 2, '2017-06-12 08:21:46', '::1'),
(1487, NULL, 14, NULL, 2, '2017-06-12 08:21:49', '::1'),
(1488, NULL, NULL, 8, 2, '2017-06-12 09:04:57', '::1'),
(1489, NULL, NULL, 7, 2, '2017-06-12 09:11:25', '::1'),
(1490, 31, NULL, NULL, 2, '2017-06-12 14:18:28', '::1'),
(1491, NULL, 3, NULL, 2, '2017-06-14 09:45:36', '::1'),
(1492, NULL, 3, NULL, 2, '2017-06-14 10:21:17', '::1'),
(1493, NULL, 12, NULL, 2, '2017-06-14 10:55:26', '::1'),
(1494, NULL, 3, NULL, 2, '2017-06-14 14:18:58', '::1'),
(1495, NULL, 3, NULL, 2, '2017-06-14 14:21:33', '::1'),
(1496, NULL, 8, NULL, NULL, '2017-06-15 09:12:50', '::1'),
(1497, 23, NULL, NULL, NULL, '2017-06-15 09:18:56', '::1'),
(1498, 23, NULL, NULL, NULL, '2017-06-15 09:23:19', '::1'),
(1499, 23, NULL, NULL, NULL, '2017-06-15 09:27:21', '::1'),
(1500, 31, NULL, NULL, NULL, '2017-06-15 09:40:20', '::1'),
(1501, 1, NULL, NULL, NULL, '2017-06-15 10:13:30', '::1'),
(1502, 1, NULL, NULL, NULL, '2017-06-15 10:15:12', '::1'),
(1503, 1, NULL, NULL, NULL, '2017-06-15 10:18:35', '::1'),
(1504, 1, NULL, NULL, NULL, '2017-06-15 14:10:18', '::1'),
(1505, 1, NULL, NULL, 2, '2017-06-15 14:14:21', '::1'),
(1506, 1, NULL, NULL, 2, '2017-06-15 14:14:52', '::1'),
(1507, 1, NULL, NULL, 2, '2017-06-15 14:15:15', '::1'),
(1508, 1, NULL, NULL, 2, '2017-06-15 14:17:22', '::1'),
(1509, 1, NULL, NULL, 2, '2017-06-15 14:20:43', '::1'),
(1510, 1, NULL, NULL, 2, '2017-06-15 14:22:58', '::1'),
(1511, 1, NULL, NULL, 2, '2017-06-15 14:26:04', '::1'),
(1512, 1, NULL, NULL, 2, '2017-06-15 14:26:51', '::1'),
(1513, 1, NULL, NULL, 2, '2017-06-15 14:27:27', '::1'),
(1514, 1, NULL, NULL, 2, '2017-06-15 14:28:51', '::1'),
(1515, 1, NULL, NULL, 2, '2017-06-15 14:32:06', '::1'),
(1516, 14, NULL, NULL, 2, '2017-06-15 14:37:03', '::1'),
(1517, 14, NULL, NULL, 2, '2017-06-15 14:37:36', '::1'),
(1518, 6, NULL, NULL, 2, '2017-06-15 14:37:56', '::1'),
(1519, 1, NULL, NULL, 2, '2017-06-15 14:38:53', '::1'),
(1520, 14, NULL, NULL, 2, '2017-06-15 14:38:59', '::1'),
(1521, 13, NULL, NULL, 2, '2017-06-15 15:10:43', '::1'),
(1522, 19, NULL, NULL, 2, '2017-06-15 15:13:57', '::1'),
(1523, NULL, 2, NULL, 2, '2017-06-15 15:22:34', '::1'),
(1524, 1, NULL, NULL, 2, '2017-06-15 15:23:38', '::1'),
(1525, 1, NULL, NULL, NULL, '2017-06-16 06:35:57', '::1'),
(1526, NULL, 5, NULL, NULL, '2017-06-16 06:40:03', '::1'),
(1527, NULL, 5, NULL, 1, '2017-06-16 06:40:20', '::1'),
(1528, 1, NULL, NULL, 1, '2017-06-16 06:40:37', '::1'),
(1529, 1, NULL, NULL, 1, '2017-06-16 06:52:39', '::1'),
(1530, 1, NULL, NULL, 1, '2017-06-16 06:55:26', '::1'),
(1531, NULL, NULL, 5, 1, '2017-06-16 06:56:46', '::1'),
(1532, NULL, NULL, 5, 1, '2017-06-16 06:56:51', '::1'),
(1533, 1, NULL, NULL, 1, '2017-06-16 06:57:11', '::1'),
(1534, 1, NULL, NULL, 1, '2017-06-16 07:03:15', '::1'),
(1535, 1, NULL, NULL, 1, '2017-06-16 07:05:08', '::1'),
(1536, 1, NULL, NULL, 1, '2017-06-16 07:08:02', '::1'),
(1537, 1, NULL, NULL, 1, '2017-06-16 07:12:23', '::1'),
(1538, 1, NULL, NULL, 1, '2017-06-16 07:12:44', '::1'),
(1539, 1, NULL, NULL, 1, '2017-06-16 07:12:51', '::1'),
(1540, 1, NULL, NULL, 1, '2017-06-16 07:12:55', '::1'),
(1541, 1, NULL, NULL, 1, '2017-06-16 07:13:12', '::1'),
(1542, 1, NULL, NULL, 2, '2017-06-16 07:42:34', '::1'),
(1543, 1, NULL, NULL, 2, '2017-06-16 07:42:40', '::1'),
(1544, 1, NULL, NULL, 2, '2017-06-16 07:42:57', '::1'),
(1545, NULL, 13, NULL, 2, '2017-06-16 07:44:35', '::1'),
(1546, 4, NULL, NULL, 2, '2017-06-16 07:52:47', '::1'),
(1547, 1, NULL, NULL, 2, '2017-06-16 08:21:33', '::1'),
(1548, 1, NULL, NULL, 2, '2017-06-16 08:25:41', '::1'),
(1549, 1, NULL, NULL, 2, '2017-06-16 08:26:23', '::1'),
(1550, NULL, 4, NULL, 2, '2017-06-16 08:27:54', '::1'),
(1551, NULL, 4, NULL, 2, '2017-06-16 08:32:01', '::1'),
(1552, 25, NULL, NULL, 2, '2017-06-16 10:03:12', '::1'),
(1553, 25, NULL, NULL, 2, '2017-06-16 10:05:44', '::1'),
(1554, 34, NULL, NULL, 2, '2017-06-16 10:08:06', '::1'),
(1555, 34, NULL, NULL, 2, '2017-06-16 10:08:58', '::1'),
(1556, 34, NULL, NULL, 2, '2017-06-16 10:10:38', '::1'),
(1557, 3, NULL, NULL, 2, '2017-06-16 10:22:42', '::1'),
(1558, 3, NULL, NULL, 2, '2017-06-16 10:27:09', '::1'),
(1559, 3, NULL, NULL, 2, '2017-06-16 10:28:04', '::1'),
(1560, NULL, 10, NULL, 2, '2017-06-16 10:30:08', '::1'),
(1561, NULL, 10, NULL, NULL, '2017-06-16 10:30:22', '::1'),
(1562, 6, NULL, NULL, NULL, '2017-06-16 10:30:35', '::1'),
(1563, 10, NULL, NULL, NULL, '2017-06-16 10:56:24', '::1'),
(1564, 5, NULL, NULL, NULL, '2017-06-16 12:52:08', '::1'),
(1565, 9, NULL, NULL, 1, '2017-06-20 10:46:46', '::1'),
(1566, 22, NULL, NULL, 1, '2017-06-20 10:51:37', '::1'),
(1567, 30, NULL, NULL, 1, '2017-06-20 10:54:21', '::1'),
(1568, 20, NULL, NULL, 1, '2017-06-20 11:16:35', '::1'),
(1569, 17, NULL, NULL, 1, '2017-06-20 13:08:52', '::1'),
(1570, 1, NULL, NULL, 1, '2017-06-20 13:53:13', '::1'),
(1571, 17, NULL, NULL, 1, '2017-06-20 13:54:00', '::1'),
(1572, 9, NULL, NULL, 1, '2017-06-20 13:55:00', '::1'),
(1573, 16, NULL, NULL, 1, '2017-06-20 13:59:24', '::1'),
(1574, 6, NULL, NULL, 1, '2017-06-20 14:19:52', '::1'),
(1575, NULL, 3, NULL, 1, '2017-06-20 14:30:08', '::1'),
(1576, NULL, 3, NULL, 1, '2017-06-20 14:30:30', '::1'),
(1577, 23, NULL, NULL, 1, '2017-06-20 14:35:21', '::1'),
(1578, 9, NULL, NULL, 1, '2017-06-20 14:36:06', '::1'),
(1579, 2, NULL, NULL, 1, '2017-06-20 14:41:58', '::1'),
(1580, 2, NULL, NULL, 1, '2017-06-20 14:43:01', '::1'),
(1581, 3, NULL, NULL, 1, '2017-06-20 14:58:37', '::1'),
(1582, NULL, 13, NULL, 1, '2017-06-20 15:08:11', '::1'),
(1583, 7, NULL, NULL, 1, '2017-06-20 15:33:50', '::1'),
(1584, 6, NULL, NULL, 1, '2017-06-20 15:33:52', '::1'),
(1585, 17, NULL, NULL, 1, '2017-06-20 15:45:56', '::1'),
(1586, 17, NULL, NULL, 1, '2017-06-20 15:46:06', '::1'),
(1587, 26, NULL, NULL, 1, '2017-06-20 15:46:16', '::1'),
(1588, 6, NULL, NULL, 1, '2017-06-20 15:48:30', '::1'),
(1589, 7, NULL, NULL, 1, '2017-06-20 15:48:38', '::1'),
(1590, 1, NULL, NULL, 1, '2017-06-20 15:48:46', '::1'),
(1591, NULL, NULL, 1, 1, '2017-06-20 15:48:50', '::1'),
(1592, 2, NULL, NULL, 1, '2017-06-20 15:57:22', '::1'),
(1593, 16, NULL, NULL, NULL, '2017-06-21 08:03:45', '::1'),
(1594, 1, NULL, NULL, NULL, '2017-06-21 08:04:08', '::1'),
(1595, 1, NULL, NULL, NULL, '2017-06-21 08:14:27', '::1'),
(1596, 1, NULL, NULL, NULL, '2017-06-21 08:18:57', '::1'),
(1597, 1, NULL, NULL, NULL, '2017-06-21 08:20:56', '::1'),
(1598, 1, NULL, NULL, NULL, '2017-06-21 08:29:30', '::1'),
(1599, 1, NULL, NULL, NULL, '2017-06-21 08:32:01', '::1'),
(1600, 1, NULL, NULL, NULL, '2017-06-21 08:32:47', '::1'),
(1601, 1, NULL, NULL, NULL, '2017-06-21 08:34:55', '::1'),
(1602, 1, NULL, NULL, NULL, '2017-06-21 08:44:46', '::1'),
(1603, 1, NULL, NULL, NULL, '2017-06-21 08:46:34', '::1'),
(1604, 1, NULL, NULL, NULL, '2017-06-21 08:46:49', '::1'),
(1605, 1, NULL, NULL, NULL, '2017-06-21 08:49:08', '::1'),
(1606, 1, NULL, NULL, NULL, '2017-06-21 08:50:22', '::1'),
(1607, 1, NULL, NULL, NULL, '2017-06-21 08:58:03', '::1'),
(1608, 1, NULL, NULL, NULL, '2017-06-21 09:00:44', '::1'),
(1609, 1, NULL, NULL, NULL, '2017-06-21 09:02:46', '::1'),
(1610, 1, NULL, NULL, NULL, '2017-06-21 09:06:56', '::1'),
(1611, 1, NULL, NULL, NULL, '2017-06-21 09:08:02', '::1'),
(1612, 1, NULL, NULL, NULL, '2017-06-21 09:11:59', '::1'),
(1613, 1, NULL, NULL, NULL, '2017-06-21 09:15:16', '::1'),
(1614, 1, NULL, NULL, NULL, '2017-06-21 09:16:29', '::1'),
(1615, 1, NULL, NULL, NULL, '2017-06-21 09:19:07', '::1'),
(1616, 1, NULL, NULL, NULL, '2017-06-21 09:22:18', '::1'),
(1617, 1, NULL, NULL, NULL, '2017-06-21 09:23:49', '::1'),
(1618, 1, NULL, NULL, NULL, '2017-06-21 09:26:29', '::1'),
(1619, 1, NULL, NULL, NULL, '2017-06-21 09:27:48', '::1'),
(1620, 1, NULL, NULL, NULL, '2017-06-21 09:28:02', '::1'),
(1621, 1, NULL, NULL, NULL, '2017-06-21 09:30:11', '::1'),
(1622, 1, NULL, NULL, NULL, '2017-06-21 09:31:40', '::1'),
(1623, 2, NULL, NULL, NULL, '2017-06-21 09:34:39', '::1'),
(1624, 31, NULL, NULL, NULL, '2017-06-21 09:35:12', '::1'),
(1625, 6, NULL, NULL, NULL, '2017-06-21 09:35:22', '::1'),
(1626, 1, NULL, NULL, NULL, '2017-06-21 09:48:37', '::1'),
(1627, 3, NULL, NULL, NULL, '2017-06-21 10:11:19', '::1'),
(1628, 17, NULL, NULL, NULL, '2017-06-21 10:16:47', '::1'),
(1629, 7, NULL, NULL, NULL, '2017-06-21 10:16:56', '::1'),
(1630, 29, NULL, NULL, NULL, '2017-06-21 10:17:31', '::1'),
(1631, 12, NULL, NULL, NULL, '2017-06-21 10:17:44', '::1'),
(1632, 2, NULL, NULL, NULL, '2017-06-21 10:18:25', '::1'),
(1633, 16, NULL, NULL, NULL, '2017-06-21 10:18:40', '::1'),
(1634, 1, NULL, NULL, NULL, '2017-06-21 10:21:47', '::1'),
(1635, 1, NULL, NULL, NULL, '2017-06-21 10:21:57', '::1'),
(1636, 1, NULL, NULL, NULL, '2017-06-21 10:23:01', '::1'),
(1637, 1, NULL, NULL, NULL, '2017-06-21 10:25:23', '::1'),
(1638, 3, NULL, NULL, NULL, '2017-06-21 10:25:51', '::1'),
(1639, 6, NULL, NULL, NULL, '2017-06-21 10:35:49', '::1'),
(1640, 19, NULL, NULL, NULL, '2017-06-21 10:48:34', '::1'),
(1641, 7, NULL, NULL, NULL, '2017-06-21 10:52:30', '::1'),
(1642, 22, NULL, NULL, NULL, '2017-06-21 11:10:02', '::1'),
(1643, 9, NULL, NULL, NULL, '2017-06-21 13:18:06', '::1'),
(1644, 6, NULL, NULL, NULL, '2017-06-21 13:18:20', '::1'),
(1645, 7, NULL, NULL, NULL, '2017-06-21 13:19:07', '::1'),
(1646, 9, NULL, NULL, NULL, '2017-06-21 13:19:26', '::1'),
(1647, 31, NULL, NULL, 1, '2017-06-21 14:54:46', '::1'),
(1648, 12, NULL, NULL, NULL, '2017-06-21 15:04:13', '::1'),
(1649, 22, NULL, NULL, NULL, '2017-06-21 15:04:27', '::1'),
(1650, 16, NULL, NULL, NULL, '2017-06-21 15:04:36', '::1'),
(1651, 1, NULL, NULL, NULL, '2017-06-21 15:04:56', '::1'),
(1652, 2, NULL, NULL, NULL, '2017-06-21 15:05:41', '::1'),
(1653, 1, NULL, NULL, 1, '2017-06-21 15:10:28', '::1'),
(1654, 1, NULL, NULL, 1, '2017-06-21 15:10:50', '::1'),
(1655, NULL, 2, NULL, NULL, '2017-06-21 15:12:28', '::1'),
(1656, NULL, 2, NULL, 2, '2017-06-21 15:12:44', '::1'),
(1657, NULL, 2, NULL, 2, '2017-06-21 15:13:27', '::1'),
(1658, 4, NULL, NULL, 2, '2017-06-21 15:15:07', '::1'),
(1659, 4, NULL, NULL, 2, '2017-06-21 15:15:21', '::1'),
(1660, NULL, 2, NULL, 1, '2017-06-21 15:20:57', '::1'),
(1661, NULL, 2, NULL, NULL, '2017-06-21 15:21:27', '::1'),
(1662, 26, NULL, NULL, 1, '2017-06-21 15:25:03', '::1'),
(1663, 26, NULL, NULL, 1, '2017-06-21 15:27:18', '::1'),
(1664, 26, NULL, NULL, 1, '2017-06-21 15:28:12', '::1'),
(1665, 26, NULL, NULL, 1, '2017-06-21 15:29:23', '::1'),
(1666, 26, NULL, NULL, 1, '2017-06-21 15:32:00', '::1'),
(1667, 26, NULL, NULL, 1, '2017-06-21 15:32:14', '::1'),
(1668, 1, NULL, NULL, 1, '2017-06-21 15:37:11', '::1'),
(1669, 4, NULL, NULL, 1, '2017-06-21 15:38:38', '::1'),
(1670, 32, NULL, NULL, 1, '2017-06-21 15:45:36', '::1'),
(1671, 5, NULL, NULL, 1, '2017-06-21 15:58:55', '::1'),
(1672, 32, NULL, NULL, 1, '2017-06-22 07:53:44', '::1'),
(1673, 1, NULL, NULL, 1, '2017-06-22 07:54:14', '::1'),
(1674, 33, NULL, NULL, 1, '2017-06-22 08:04:34', '::1'),
(1675, 2, NULL, NULL, 1, '2017-06-22 08:09:16', '::1'),
(1676, 33, NULL, NULL, 1, '2017-06-22 08:09:56', '::1'),
(1677, 2, NULL, NULL, 1, '2017-06-22 08:10:26', '::1'),
(1678, 25, NULL, NULL, 1, '2017-06-22 08:11:21', '::1'),
(1679, 34, NULL, NULL, 1, '2017-06-22 08:15:55', '::1'),
(1680, NULL, 2, NULL, 1, '2017-06-22 08:16:20', '::1'),
(1681, 34, NULL, NULL, 1, '2017-06-22 08:18:45', '::1'),
(1682, 34, NULL, NULL, 1, '2017-06-22 08:19:35', '::1'),
(1683, 34, NULL, NULL, 1, '2017-06-22 08:21:05', '::1'),
(1684, 34, NULL, NULL, 1, '2017-06-22 08:22:10', '::1'),
(1685, 34, NULL, NULL, 1, '2017-06-22 08:22:28', '::1'),
(1686, 35, NULL, NULL, 1, '2017-06-22 08:27:19', '::1'),
(1687, 35, NULL, NULL, 1, '2017-06-22 08:28:33', '::1'),
(1688, 39, NULL, NULL, 1, '2017-06-22 08:34:31', '::1'),
(1689, 2, NULL, NULL, 1, '2017-06-22 10:31:26', '::1'),
(1690, 2, NULL, NULL, 1, '2017-06-22 13:47:35', '::1'),
(1691, 2, NULL, NULL, 1, '2017-06-22 14:03:02', '::1'),
(1692, 24, NULL, NULL, 1, '2017-06-22 14:23:59', '::1'),
(1693, 23, NULL, NULL, 1, '2017-06-22 15:29:37', '::1'),
(1694, 35, NULL, NULL, 1, '2017-06-22 15:30:47', '::1'),
(1695, 31, NULL, NULL, 1, '2017-06-22 15:32:07', '::1'),
(1696, 31, NULL, NULL, 1, '2017-06-22 15:32:19', '::1'),
(1697, 31, NULL, NULL, 1, '2017-06-22 15:32:55', '::1'),
(1698, 31, NULL, NULL, 1, '2017-06-22 15:33:44', '::1'),
(1699, 29, NULL, NULL, 1, '2017-06-22 15:34:17', '::1'),
(1700, 1, NULL, NULL, 1, '2017-06-22 15:40:03', '::1'),
(1701, 16, NULL, NULL, 1, '2017-06-22 15:52:28', '::1'),
(1702, 1, NULL, NULL, 1, '2017-06-22 15:55:44', '::1'),
(1703, 2, NULL, NULL, 1, '2017-06-22 16:00:07', '::1'),
(1704, 2, NULL, NULL, NULL, '2017-06-23 07:35:09', '::1'),
(1705, 2, NULL, NULL, NULL, '2017-06-23 07:36:01', '::1'),
(1706, 2, NULL, NULL, 1, '2017-06-23 07:36:33', '::1'),
(1707, 2, NULL, NULL, 1, '2017-06-23 07:36:52', '::1'),
(1708, 4, NULL, NULL, 1, '2017-06-23 09:01:10', '::1'),
(1709, 1, NULL, NULL, 1, '2017-06-23 09:14:39', '::1'),
(1710, 25, NULL, NULL, 1, '2017-06-23 09:14:56', '::1'),
(1711, 25, NULL, NULL, 1, '2017-06-23 09:15:05', '::1'),
(1712, 11, NULL, NULL, 1, '2017-06-23 11:10:59', '::1'),
(1713, 25, NULL, NULL, 1, '2017-06-23 13:25:50', '::1'),
(1714, 32, NULL, NULL, 2, '2017-06-27 06:55:28', '::1'),
(1715, 33, NULL, NULL, 2, '2017-06-27 06:55:37', '::1'),
(1716, 38, NULL, NULL, 2, '2017-06-27 07:00:55', '::1'),
(1717, 38, NULL, NULL, 2, '2017-06-27 07:04:27', '::1'),
(1718, 38, NULL, NULL, 2, '2017-06-27 07:06:01', '::1'),
(1719, 5, NULL, NULL, 2, '2017-06-27 07:06:16', '::1'),
(1720, 35, NULL, NULL, 2, '2017-06-27 07:08:12', '::1'),
(1721, NULL, 15, NULL, 2, '2017-06-27 07:20:14', '::1'),
(1722, NULL, 15, NULL, 2, '2017-06-27 07:20:26', '::1'),
(1723, NULL, 15, NULL, 2, '2017-06-27 07:21:01', '::1'),
(1724, NULL, 15, NULL, 2, '2017-06-27 07:23:22', '::1'),
(1725, NULL, 15, NULL, 2, '2017-06-27 07:24:05', '::1'),
(1726, 18, NULL, NULL, 2, '2017-06-27 07:24:21', '::1'),
(1727, 18, NULL, NULL, 2, '2017-06-27 07:25:00', '::1'),
(1728, NULL, 15, NULL, 2, '2017-06-27 07:25:16', '::1'),
(1729, NULL, 15, NULL, 2, '2017-06-27 07:32:58', '::1'),
(1730, 5, NULL, NULL, 2, '2017-06-27 07:39:53', '::1'),
(1731, 35, NULL, NULL, 2, '2017-06-27 07:49:42', '::1'),
(1732, 9, NULL, NULL, 2, '2017-06-27 07:50:02', '::1'),
(1733, 3, NULL, NULL, NULL, '2017-06-27 08:54:52', '::1'),
(1734, 36, NULL, NULL, NULL, '2017-06-27 08:55:18', '::1'),
(1735, 40, NULL, NULL, 2, '2017-06-27 08:58:36', '::1'),
(1736, 33, NULL, NULL, 2, '2017-06-27 09:00:22', '::1'),
(1737, 33, NULL, NULL, 2, '2017-06-27 09:02:15', '::1'),
(1738, 40, NULL, NULL, 2, '2017-06-27 09:03:03', '::1'),
(1739, 40, NULL, NULL, 2, '2017-06-27 09:04:58', '::1'),
(1740, 24, NULL, NULL, 2, '2017-06-27 09:05:53', '::1'),
(1741, 19, NULL, NULL, 2, '2017-06-27 09:07:12', '::1'),
(1742, 11, NULL, NULL, 2, '2017-06-27 09:16:10', '::1'),
(1743, 11, NULL, NULL, 2, '2017-06-27 09:16:37', '::1'),
(1744, 11, NULL, NULL, NULL, '2017-06-27 09:17:12', '::1'),
(1745, 6, NULL, NULL, NULL, '2017-06-27 09:18:28', '::1'),
(1746, 6, NULL, NULL, NULL, '2017-06-27 09:28:29', '::1'),
(1747, 11, NULL, NULL, NULL, '2017-06-27 09:30:51', '::1'),
(1748, 10, NULL, NULL, NULL, '2017-06-27 09:32:46', '::1'),
(1749, 10, NULL, NULL, 2, '2017-06-27 09:33:18', '::1'),
(1750, 10, NULL, NULL, 2, '2017-06-27 09:33:53', '::1'),
(1751, 10, NULL, NULL, 2, '2017-06-27 09:52:46', '::1'),
(1752, 3, NULL, NULL, 2, '2017-06-27 10:23:45', '::1'),
(1753, 39, NULL, NULL, 1, '2017-06-27 10:44:47', '::1'),
(1754, 39, NULL, NULL, 1, '2017-06-27 10:47:44', '::1'),
(1755, 39, NULL, NULL, 1, '2017-06-27 10:48:48', '::1'),
(1756, 39, NULL, NULL, 1, '2017-06-27 10:55:38', '::1'),
(1757, 39, NULL, NULL, 1, '2017-06-27 11:06:57', '::1'),
(1758, 39, NULL, NULL, 1, '2017-06-27 11:07:31', '::1'),
(1759, 39, NULL, NULL, 1, '2017-06-27 11:08:44', '::1'),
(1760, 4, NULL, NULL, 1, '2017-06-27 12:34:37', '::1'),
(1761, 39, NULL, NULL, 1, '2017-06-27 12:44:55', '::1'),
(1762, 39, NULL, NULL, 1, '2017-06-27 12:45:34', '::1'),
(1763, 39, NULL, NULL, 1, '2017-06-27 12:47:23', '::1'),
(1764, 40, NULL, NULL, 1, '2017-06-27 12:47:48', '::1'),
(1765, 39, NULL, NULL, 1, '2017-06-27 12:48:13', '::1'),
(1766, 39, NULL, NULL, 1, '2017-06-27 12:49:27', '::1'),
(1767, 39, NULL, NULL, 1, '2017-06-27 12:50:02', '::1'),
(1768, 31, NULL, NULL, 1, '2017-06-27 12:51:47', '::1'),
(1769, 39, NULL, NULL, 1, '2017-06-27 12:55:25', '::1'),
(1770, 16, NULL, NULL, 1, '2017-06-27 13:01:12', '::1'),
(1771, 1, NULL, NULL, 1, '2017-06-27 13:11:53', '::1'),
(1772, 6, NULL, NULL, 1, '2017-06-27 13:40:05', '::1'),
(1773, 4, NULL, NULL, 1, '2017-06-27 13:51:19', '::1'),
(1774, 32, NULL, NULL, 1, '2017-06-27 14:25:08', '::1'),
(1775, 34, NULL, NULL, NULL, '2017-06-28 07:29:50', '::1'),
(1776, 34, NULL, NULL, NULL, '2017-06-28 07:31:28', '::1'),
(1777, 7, NULL, NULL, NULL, '2017-06-28 08:08:31', '::1'),
(1778, 34, NULL, NULL, NULL, '2017-06-28 09:09:56', '::1'),
(1779, 34, NULL, NULL, NULL, '2017-06-28 10:37:38', '::1'),
(1780, 1, NULL, NULL, 3, '2017-06-28 14:30:05', '::1'),
(1781, NULL, 15, NULL, 1, '2017-06-28 15:16:07', '::1'),
(1782, 41, NULL, NULL, 1, '2017-06-28 15:52:36', '::1'),
(1783, 45, NULL, NULL, 1, '2017-06-28 16:09:21', '::1'),
(1784, 38, NULL, NULL, 1, '2017-06-28 19:39:36', '::1'),
(1785, 45, NULL, NULL, 1, '2017-06-28 19:40:42', '::1'),
(1786, 34, NULL, NULL, 1, '2017-06-28 19:41:21', '::1'),
(1787, 8, NULL, NULL, 1, '2017-06-28 19:44:32', '::1'),
(1788, 1, NULL, NULL, 1, '2017-06-29 12:09:53', '::1'),
(1789, 46, NULL, NULL, 1, '2017-06-29 12:11:25', '::1'),
(1790, 46, NULL, NULL, 1, '2017-06-29 12:13:41', '::1'),
(1791, 46, NULL, NULL, 1, '2017-06-29 12:17:43', '::1'),
(1792, 46, NULL, NULL, 1, '2017-06-29 12:18:46', '::1'),
(1793, 46, NULL, NULL, 1, '2017-06-29 12:20:42', '::1'),
(1794, 46, NULL, NULL, 1, '2017-06-29 12:27:47', '::1'),
(1795, 1, NULL, NULL, 1, '2017-06-29 12:35:56', '::1'),
(1796, 25, NULL, NULL, 1, '2017-06-29 12:37:57', '::1'),
(1797, NULL, 3, NULL, 1, '2017-06-29 12:42:57', '::1'),
(1798, NULL, 3, NULL, 1, '2017-06-29 12:45:22', '::1'),
(1799, NULL, NULL, 1, 1, '2017-06-29 12:46:30', '::1'),
(1800, NULL, 1, NULL, 1, '2017-06-29 12:49:58', '::1'),
(1801, NULL, 12, NULL, 1, '2017-06-29 13:12:22', '::1'),
(1802, 46, NULL, NULL, 1, '2017-06-29 14:44:34', '::1'),
(1803, 46, NULL, NULL, 1, '2017-06-29 14:46:42', '::1'),
(1804, 43, NULL, NULL, 1, '2017-06-29 14:48:26', '::1'),
(1805, 11, NULL, NULL, 1, '2017-06-29 14:48:49', '::1'),
(1806, NULL, 13, NULL, NULL, '2017-06-29 19:11:04', '::1'),
(1807, NULL, 1, NULL, 1, '2017-06-29 21:35:10', '::1'),
(1808, NULL, 3, NULL, 2, '2017-06-30 07:44:01', '::1'),
(1809, 39, NULL, NULL, 2, '2017-06-30 08:21:38', '::1'),
(1810, 46, NULL, NULL, 2, '2017-06-30 08:34:44', '::1'),
(1811, 46, NULL, NULL, 2, '2017-06-30 08:37:34', '::1'),
(1812, 46, NULL, NULL, 2, '2017-06-30 08:38:26', '::1'),
(1813, 46, NULL, NULL, 2, '2017-06-30 08:38:38', '::1'),
(1814, 46, NULL, NULL, 2, '2017-06-30 08:58:18', '::1'),
(1815, 46, NULL, NULL, 2, '2017-06-30 09:00:26', '::1'),
(1816, NULL, 15, NULL, 2, '2017-06-30 09:01:37', '::1'),
(1817, NULL, 13, NULL, 2, '2017-06-30 09:01:55', '::1'),
(1818, NULL, NULL, 4, 2, '2017-06-30 09:02:32', '::1'),
(1819, 46, NULL, NULL, 2, '2017-06-30 09:03:03', '::1'),
(1820, 46, NULL, NULL, 2, '2017-06-30 09:49:56', '::1'),
(1821, 47, NULL, NULL, 2, '2017-06-30 09:56:20', '::1');

-- --------------------------------------------------------

--
-- Structure de la table `sl_category`
--

CREATE TABLE `sl_category` (
  `id` int(11) NOT NULL,
  `default_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `sl_category`
--

INSERT INTO `sl_category` (`id`, `default_name`, `slug`) VALUES
(1, 'Economy', 'economy'),
(2, 'Engineering', 'engineering'),
(3, 'Sciences naturelles', 'sciences-naturelles'),
(4, 'Technologies', 'technologies'),
(5, 'Sciences humaines', 'sciences-humaines'),
(6, 'Arts', 'arts'),
(7, 'Gestion', 'gestion'),
(8, 'Etude de commerce', 'etude-de-commerce'),
(9, 'Paramedical', 'paramedical'),
(10, 'Science sociale', 'science-sociale'),
(11, 'Informatique', 'informatique'),
(12, 'Droit', 'droit'),
(13, 'Humans resources', 'humans-resources'),
(14, 'Tourisme', 'tourisme'),
(15, 'Telecommunications', 'telecommunications'),
(16, 'Communication', 'communication'),
(17, 'Agronomie', 'agronomie'),
(18, 'Formation Professionnelle', 'formation-professionnelle'),
(19, 'Hotellerie', 'hotellerie'),
(20, 'administration', 'administration'),
(21, 'électronique', 'electronique'),
(22, 'Bâtiments & Travaux Publics', 'batiments-travaux-publics'),
(23, 'environnements', 'environnements'),
(24, 'agriculture', 'agriculture'),
(25, 'Finances', 'finances');

-- --------------------------------------------------------

--
-- Structure de la table `sl_category_school`
--

CREATE TABLE `sl_category_school` (
  `id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `current` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `sl_category_school`
--

INSERT INTO `sl_category_school` (`id`, `school_id`, `category_id`, `current`) VALUES
(1, 1, 1, 0),
(6, 2, 2, 0),
(7, 2, 4, 0),
(8, 2, 6, 0),
(11, 1, 7, 0),
(12, 1, 8, 0),
(13, 3, 2, 0),
(14, 3, 4, 0),
(16, 5, 2, 0),
(17, 5, 4, 0),
(19, 6, 3, 0),
(20, 6, 4, 0),
(21, 6, 5, 0),
(22, 6, 7, 0),
(23, 6, 8, 0),
(24, 7, 1, 0),
(25, 7, 7, 0),
(26, 7, 8, 0),
(27, 8, 8, 0),
(28, 8, 7, 0),
(29, 8, 6, 0),
(30, 8, 1, 0),
(31, 9, 1, 0),
(32, 9, 2, 0),
(33, 9, 4, 0),
(34, 9, 7, 0),
(35, 9, 8, 0),
(36, 11, 2, 0),
(37, 11, 3, 0),
(38, 11, 7, 0),
(39, 12, 5, 0),
(40, 13, 5, 0),
(41, 13, 3, 0),
(42, 14, 3, 1),
(43, 14, 4, 0),
(44, 14, 2, 0),
(45, 15, 3, 0),
(46, 16, 1, 0),
(47, 16, 2, 0),
(48, 16, 3, 0),
(49, 16, 4, 0),
(50, 16, 5, 0),
(51, 16, 6, 0),
(52, 16, 7, 0),
(53, 16, 8, 0),
(55, 17, 7, 0),
(62, 18, 7, 0),
(63, 18, 8, 0),
(64, 19, 2, 0),
(65, 19, 7, 0),
(66, 19, 4, 0),
(67, 20, 4, 0),
(68, 21, 2, 0),
(69, 21, 4, 0),
(71, 22, 7, 0),
(72, 22, 8, 1),
(73, 22, 5, 0),
(74, 23, 7, 0),
(75, 23, 8, 0),
(76, 24, 7, 0),
(77, 25, 3, 0),
(78, 26, 2, 0),
(79, 26, 4, 0),
(80, 27, 5, 0),
(81, 28, 6, 0),
(82, 29, 8, 0),
(83, 29, 7, 0),
(84, 29, 4, 0),
(85, 29, 2, 0),
(86, 31, 6, 0),
(87, 30, 5, 0),
(89, 23, 1, 0),
(90, 32, 10, 1),
(91, 32, 9, 0),
(92, 17, 9, 0),
(93, 5, 11, 0),
(94, 29, 11, 0),
(95, 10, 12, 1),
(96, 10, 1, 1),
(97, 10, 8, 1),
(98, 10, 10, 1),
(99, 10, 5, 1),
(100, 33, 12, 1),
(102, 33, 6, 1),
(103, 33, 4, 1),
(104, 33, 9, 0),
(105, 33, 11, 0),
(106, 34, 13, 0),
(107, 35, 7, 0),
(108, 35, 8, 0),
(109, 35, 12, 0),
(110, 35, 11, 0),
(111, 35, 2, 0),
(112, 35, 14, 0),
(113, 31, 14, 0),
(114, 36, 2, 0),
(115, 36, 15, 0),
(116, 36, 11, 0),
(117, 4, 15, 0),
(118, 3, 15, 0),
(119, 37, 8, 0),
(120, 37, 4, 0),
(121, 37, 6, 0),
(122, 37, 16, 0),
(123, 4, 16, 0),
(124, 4, 2, 0),
(125, 4, 4, 0),
(126, 4, 11, 0),
(127, 11, 17, 0),
(128, 38, 18, 1),
(129, 18, 18, 0),
(130, 18, 16, 0),
(131, 40, 11, 0),
(132, 19, 18, 0),
(133, 39, 19, 0),
(134, 39, 14, 1),
(135, 39, 7, 0),
(136, 39, 11, 0),
(137, 31, 19, 1),
(139, 41, 8, 0),
(140, 41, 25, 0),
(141, 41, 20, 0),
(142, 43, 9, 0),
(143, 43, 7, 0),
(144, 43, 12, 0),
(145, 43, 22, 0),
(146, 43, 17, 0),
(147, 43, 16, 0),
(148, 44, 19, 0),
(149, 45, 12, 0),
(150, 46, 11, 1),
(151, 36, 21, 0);

-- --------------------------------------------------------

--
-- Structure de la table `sl_category_translate`
--

CREATE TABLE `sl_category_translate` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `locale_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `sl_category_translate`
--

INSERT INTO `sl_category_translate` (`id`, `category_id`, `locale_id`, `name`, `description`) VALUES
(1, 3, 1, 'fr Sciences naturelsss', 'fr. Description .Sciences naturelsss'),
(2, 3, 2, 'en Sciences naturels', 'en. Description .Sciences naturels'),
(3, 3, 3, 'mg Sciences naturels', 'mg. Description .Sciences naturels'),
(4, 3, 4, 'it Sciences naturels', 'it. Description .Sciences naturels'),
(5, 3, 5, 'es Sciences naturels', 'es. Description .Sciences naturels'),
(6, 3, 6, 'de Sciences naturels', 'de. Description .Sciences naturels'),
(7, 4, 1, 'fr Technologies', 'fr. Description .Technologies'),
(8, 4, 2, 'en Technology', 'en. Description .Technology'),
(9, 4, 3, 'mg Technology', 'mg. Description .Technology'),
(10, 4, 4, 'it Technology', 'it. Description .Technology'),
(11, 4, 5, 'es Technology', 'es. Description .Technology'),
(12, 4, 6, 'de Technologies', 'de. Description .Technologies'),
(13, 5, 1, 'fr Sciences humaines', 'fr. Description .Sciences humaines'),
(14, 5, 2, 'en Sciences humaines', 'en. Description .Sciences humaines'),
(15, 5, 3, 'mg Sciences humaines', 'mg. Description .Sciences humaines'),
(16, 5, 4, 'it Sciences humaines', 'it. Description .Sciences humaines'),
(17, 5, 5, 'es Sciences humaines', 'es. Description .Sciences humaines'),
(18, 5, 6, 'de Sciences humaines', 'de. Description .Sciences humaines'),
(19, 6, 1, 'fr Arts', 'fr. Description .Arts'),
(20, 6, 2, 'en Arts', 'en. Description .Arts'),
(21, 6, 3, 'mg Arts', 'mg. Description .Arts'),
(22, 6, 4, 'it Arts', 'it. Description .Arts'),
(23, 6, 5, 'es Arts', 'es. Description .Arts'),
(24, 6, 6, 'de Arts', 'de. Description .Arts'),
(25, 7, 1, 'fr Gestion', 'fr. Description .Gestion'),
(26, 7, 2, 'en Gestion', 'en. Description .Gestion'),
(27, 7, 3, 'mg Gestion', 'mg. Description .Gestion'),
(28, 7, 4, 'it Gestion', 'it. Description .Gestion'),
(29, 7, 5, 'es Gestion', 'es. Description .Gestion'),
(30, 7, 6, 'de Gestion', 'de. Description .Gestion'),
(31, 8, 1, 'fr Etude de commerce', 'fr. Description .Etude de commerce'),
(32, 8, 2, 'en Etude de commerce', 'en. Description .Etude de commerce'),
(33, 8, 3, 'mg Etude de commerce', 'mg. Description .Etude de commerce'),
(34, 8, 4, 'it Etude de commerce', 'it. Description .Etude de commerce'),
(35, 8, 5, 'es Etude de commerce', 'es. Description .Etude de commerce'),
(36, 8, 6, 'de Etude de commerce', 'de. Description .Etude de commerce'),
(37, 9, 1, 'fr Paramedical', 'fr. Description .Paramedical'),
(38, 9, 2, 'en Paramedical', 'en. Description .Paramedical'),
(39, 9, 3, 'mg Paramedical', 'mg. Description .Paramedical'),
(40, 9, 4, 'it Paramedical', 'it. Description .Paramedical'),
(41, 9, 5, 'es Paramedical', 'es. Description .Paramedical'),
(42, 9, 6, 'de Paramedical', 'de. Description .Paramedical'),
(43, 10, 1, 'fr Science sociale', 'fr. Description .Science sociale'),
(44, 10, 2, 'en Science sociale', 'en. Description .Science sociale'),
(45, 10, 3, 'mg Science sociale', 'mg. Description .Science sociale'),
(46, 10, 4, 'it Science sociale', 'it. Description .Science sociale'),
(47, 10, 5, 'es Science sociale', 'es. Description .Science sociale'),
(48, 10, 6, 'de Science sociale', 'de. Description .Science sociale'),
(49, 11, 1, 'fr Informatique', 'fr. Description .Informatique'),
(50, 11, 2, 'en Informatique', 'en. Description .Informatique'),
(51, 11, 3, 'mg Informatique', 'mg. Description .Informatique'),
(52, 11, 4, 'it Informatique', 'it. Description .Informatique'),
(53, 11, 5, 'es Informatique', 'es. Description .Informatique'),
(54, 11, 6, 'de Informatique', 'de. Description .Informatique'),
(55, 12, 1, 'fr Droit', 'fr. Description .Droit'),
(56, 12, 2, 'en Droit', 'en. Description .Droit'),
(57, 12, 3, 'mg Droit', 'mg. Description .Droit'),
(58, 12, 4, 'it Droit', 'it. Description .Droit'),
(59, 12, 5, 'es Droit', 'es. Description .Droit'),
(60, 12, 6, 'de Droit', 'de. Description .Droit'),
(61, 13, 1, 'fr Humans resources', 'fr. Description .Humans resources'),
(62, 13, 2, 'en Humans resources', 'en. Description .Humans resources'),
(63, 13, 3, 'mg Humans resources', 'mg. Description .Humans resources'),
(64, 13, 4, 'it Humans resources', 'it. Description .Humans resources'),
(65, 13, 5, 'es Humans resources', 'es. Description .Humans resources'),
(66, 13, 6, 'de Humans resources', 'de. Description .Humans resources'),
(67, 14, 1, 'fr Tourisme', 'fr. Description .Tourisme'),
(68, 14, 2, 'en Tourisme', 'en. Description .Tourisme'),
(69, 14, 3, 'mg Tourisme', 'mg. Description .Tourisme'),
(70, 14, 4, 'it Tourisme', 'it. Description .Tourisme'),
(71, 14, 5, 'es Tourisme', 'es. Description .Tourisme'),
(72, 14, 6, 'de Tourisme', 'de. Description .Tourisme'),
(73, 15, 1, 'fr Telecommunications', 'fr. Description .Telecommunications'),
(74, 15, 2, 'en Telecommunications', 'en. Description .Telecommunications'),
(75, 15, 3, 'mg Telecommunications', 'mg. Description .Telecommunications'),
(76, 15, 4, 'it Telecommunications', 'it. Description .Telecommunications'),
(77, 15, 5, 'es Telecommunications', 'es. Description .Telecommunications'),
(78, 15, 6, 'de Telecommunications', 'de. Description .Telecommunications'),
(79, 16, 1, 'fr Communication', 'fr. Description .Communication'),
(80, 16, 2, 'en Communication', 'en. Description .Communication'),
(81, 16, 3, 'mg Communication', 'mg. Description .Communication'),
(82, 16, 4, 'it Communication', 'it. Description .Communication'),
(83, 16, 5, 'es Communication', 'es. Description .Communication'),
(84, 16, 6, 'de Communication', 'de. Description .Communication'),
(85, 17, 1, 'fr Agronomie', 'fr. Description .Agronomie'),
(86, 17, 2, 'en Agronomie', 'en. Description .Agronomie'),
(87, 17, 3, 'mg Agronomie', 'mg. Description .Agronomie'),
(88, 17, 4, 'it Agronomie', 'it. Description .Agronomie'),
(89, 17, 5, 'es Agronomie', 'es. Description .Agronomie'),
(90, 17, 6, 'de Agronomie', 'de. Description .Agronomie'),
(91, 18, 1, 'fr Formation Professionnelle', 'fr. Description .Formation Professionnelle'),
(92, 18, 2, 'en Formation Professionnelle', 'en. Description .Formation Professionnelle'),
(93, 18, 3, 'mg Formation Professionnelle', 'mg. Description .Formation Professionnelle'),
(94, 18, 4, 'it Formation Professionnelle', 'it. Description .Formation Professionnelle'),
(95, 18, 5, 'es Formation Professionnelle', 'es. Description .Formation Professionnelle'),
(96, 18, 6, 'de Formation Professionnelle', 'de. Description .Formation Professionnelle'),
(97, 19, 1, 'fr Hotellerie', 'fr. Description .Hotellerie'),
(98, 19, 2, 'en Hotellerie', 'en. Description .Hotellerie'),
(99, 19, 3, 'mg Hotellerie', 'mg. Description .Hotellerie'),
(100, 19, 4, 'it Hotellerie', 'it. Description .Hotellerie'),
(101, 19, 5, 'es Hotellerie', 'es. Description .Hotellerie'),
(102, 19, 6, 'de Hotellerie', 'de. Description .Hotellerie'),
(103, 20, 1, 'fr economy', 'fr. Description .economy'),
(104, 20, 2, 'en economy', 'en. Description .economy'),
(105, 20, 3, 'mg economy', 'mg. Description .economy'),
(106, 20, 4, 'it economy', 'it. Description .economy'),
(107, 20, 5, 'es economy', 'es. Description .economy'),
(108, 20, 6, 'de economy', 'de. Description .economy'),
(109, 21, 1, 'électronique', 'électronique'),
(110, 21, 2, 'électronique', 'électronique'),
(111, 21, 3, 'mg category', 'mg. Description .category'),
(112, 21, 4, 'it category', 'it. Description .category'),
(113, 21, 5, 'es category', 'es. Description .category'),
(114, 21, 6, 'de category', 'de. Description .category'),
(115, 22, 1, 'Bâtiments & Travaux Publics', 'Bâtiments & Travaux Publics'),
(116, 22, 2, 'Bâtiments & Travaux Publics', 'Bâtiments & Travaux Publics'),
(117, 22, 3, 'mg category-3', 'mg. Description .category-3'),
(118, 22, 4, 'it category-3', 'it. Description .category-3'),
(119, 22, 5, 'es category-3', 'es. Description .category-3'),
(120, 22, 6, 'de category-3', 'de. Description .category-3'),
(121, 23, 1, 'Environnements', 'Environnements'),
(122, 23, 2, 'Environnements', 'Environnements'),
(123, 23, 3, 'mg craft', 'mg. Description .craft'),
(124, 23, 4, 'it craft', 'it. Description .craft'),
(125, 23, 5, 'es craft', 'es. Description .craft'),
(126, 23, 6, 'de craft', 'de. Description .craft'),
(127, 24, 1, 'fr category', 'fr. Description .category'),
(128, 24, 2, 'en category', 'en. Description .category'),
(129, 24, 3, 'mg category', 'mg. Description .category'),
(130, 24, 4, 'it category', 'it. Description .category'),
(131, 24, 5, 'es category', 'es. Description .category'),
(132, 24, 6, 'de category', 'de. Description .category'),
(133, 25, 1, 'fr Finances', 'fr. Description .Finances'),
(134, 25, 2, 'en Finances', 'en. Description .Finances'),
(135, 25, 3, 'mg Finances', 'mg. Description .Finances'),
(136, 25, 4, 'it Finances', 'it. Description .Finances'),
(137, 25, 5, 'es Finances', 'es. Description .Finances'),
(138, 25, 6, 'de Finances', 'de. Description .Finances');

-- --------------------------------------------------------

--
-- Structure de la table `sl_cover`
--

CREATE TABLE `sl_cover` (
  `id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `originalname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `current` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `sl_cover`
--

INSERT INTO `sl_cover` (`id`, `school_id`, `name`, `path`, `originalname`, `current`) VALUES
(14, 9, 'Sans titre.png', '1d967e13f4e8cf80b6c8b6d99c5da72280c8dd31.png', 'Sans titre.png', 0),
(15, 9, 'ordreFO.PNG', '5ff6386cc3fab439ef8c3c44f1cccd538fc1e2ee.png', 'ordreFO.PNG', 0),
(16, 9, '001.jpg', '355246bec883d848d6a6c011ce99c449ca2eaf36.jpeg', '001.jpg', 0),
(17, 9, 'ordreFO.PNG', 'c697cb4e83552b707d8c0b08604fb5551da94b59.png', 'ordreFO.PNG', 0),
(18, 9, 'cat-vasque.PNG', '14ed3072d4babe9ba635588316c7a04a24263f2a.png', 'cat-vasque.PNG', 0),
(19, 9, 'ordreFO.PNG', 'a79a5f806f581e83af24effb49b66c4f8f11b074.png', 'ordreFO.PNG', 0),
(20, 9, 'land1.jpg', 'f96deecf40cf181a3cfb29d5b4f3e450b377211c.jpeg', 'land1.jpg', 0),
(21, 9, 'land2.jpg', '081a9b6df02f85ed2c37b01c0918637732d2abc1.jpeg', 'land2.jpg', 0),
(22, 4, 'land1.jpg', '7cb4ce2d91054d0beca860bb28134c681e3681f1.jpeg', 'land1.jpg', 0),
(23, 1, 'land3.jpg', 'c8f6618841f9f49a60ccb298da591b19a8be5768.jpeg', 'land3.jpg', 0),
(24, 1, 'land3.jpg', 'c92ae378d365b280c0806908f9a145f873b6982f.jpeg', 'land3.jpg', 0),
(25, 2, 'land4.jpg', 'a76038effd721c54af330c34162a4742d353d1a3.jpeg', 'land4.jpg', 0),
(26, 2, 'land5.jpg', '6a536adb50d2457bd4ab011f31334a0a28736285.jpeg', 'land5.jpg', 1),
(27, 1, 'land6.jpg', '5bdbc45dc4f681e4c4ca24a41a7f7a862cca9890.jpeg', 'land6.jpg', 0),
(28, 5, 'land7.jpg', '675d65ebd333a85ed4882814daf46de20c2362cb.jpeg', 'land7.jpg', 1),
(29, 6, 'land8.jpg', '7098a17002e9e792db269b5d2097301865633f07.jpeg', 'land8.jpg', 1),
(30, 7, 'land9.jpg', '85c43d595ffed35309547601d5c31e0717976d25.jpeg', 'land9.jpg', 1),
(31, 8, 'land91.jpg', '307fecd483dba70da05d870056e9c0a4610baca8.jpeg', 'land91.jpg', 1),
(32, 3, 'land92.JPG', '207dbb9f84a524b7d7d370ab5f7bb21538229f88.jpeg', 'land92.JPG', 0),
(33, 9, 'land93.jpg', 'fe2c6a5d48cba41d1e1565e59afa135df1040ca6.jpeg', 'land93.jpg', 0),
(34, 10, 'land2.jpg', 'f54ad7ceb24f8d9b27b7d63e0235e9da6b206920.jpeg', 'land2.jpg', 1),
(35, 12, 'land94.jpg', '06c9af48ba031de901a99c12ac43219707bb96d0.jpeg', 'land94.jpg', 0),
(36, 12, 'land94.jpg', '0f003998402f26850a50e9f8cefb9fa3e09d16fb.jpeg', 'land94.jpg', 1),
(37, 14, 'land95.jpg', '401a4d5d26cfe1956d604b8638330dbb865092e6.jpeg', 'land95.jpg', 1),
(38, 16, 'land96.jpg', '6935d68961981f91d51055436498cb97d0316739.jpeg', 'land96.jpg', 1),
(39, 17, 'land97.JPG', 'decbe42577ebc522f48308ff646c1edd8a0fce8f.jpeg', 'land97.JPG', 1),
(40, 13, 'land3.jpg', '9d1b149715e2fb6be1625e81b18d1d1999d42d4f.jpeg', 'land3.jpg', 0),
(41, 13, 'land4.jpg', '8ebb3d2fde364cd4d0c264d68f89bf2eb0ca1545.jpeg', 'land4.jpg', 1),
(42, 1, 'graduate-150374_640.png', '7722443591abdc18a687a6dee10556c9e270cc30.png', 'graduate-150374_640.png', 0),
(43, 1, 'land6.jpg', '1b89fe9eae7ffdaa91416a7556be485958d3e527.jpeg', 'land6.jpg', 0),
(44, 3, 'graduate-150374_640.png', 'f6cbb3da9fae826cd27ddb76b01f62ada1216aa5.png', 'graduate-150374_640.png', 0),
(45, 3, 'land92.JPG', '636a26d79e5c54debf48ad6cad68b6318394e98e.jpeg', 'land92.JPG', 0),
(46, 3, 'graduate-150374_640.png', 'da40b10600d3483d30f550e4117ad647163b9476.png', 'graduate-150374_640.png', 0),
(47, 3, 'land92.JPG', '7270003cff213b740b67326ebd62c1c40ae6c45b.jpeg', 'land92.JPG', 0),
(48, 3, 'land95.jpg', '55b6f51a4ac7baff93d1f1a5dc7afbff084205cf.jpeg', 'land95.jpg', 0),
(49, 3, 'land92.JPG', 'a73059ce25943df7faaa5f93c20414801269fa73.jpeg', 'land92.JPG', 0),
(50, 3, 'graduate-150374_640.png', 'bba595fdf1748f0364e380ee7f30cf5c4f72d95e.png', 'graduate-150374_640.png', 0),
(51, 3, 'land92.JPG', 'a489ecc8c5e367c9437427fbe852aebb45b8977f.jpeg', 'land92.JPG', 1),
(52, 1, 'land3.jpg', '70b01d2b91b05ff5dc7dae5644dd41fc6d502763.jpeg', 'land3.jpg', 0),
(53, 1, 'land96.jpg', '8fbb090b22cde6eccec8bec556b0bf6e34c10514.jpeg', 'land96.jpg', 0),
(54, 1, 'land92.JPG', '122e0a58c1e5115643274d114e8fe71444ac6a93.jpeg', 'land92.JPG', 0),
(55, 1, 'land6.jpg', 'f0dc202b255252e77503de7067bf8e32e867bf1d.jpeg', 'land6.jpg', 1),
(56, 28, 'land98.JPG', 'b501475a4d29af34365894e962bdeaaafb397573.jpeg', 'land98.JPG', 1),
(57, 24, 'land99.jpg', '850de97d9cefc988a36c3143648babc92413ee7a.jpeg', 'land99.jpg', 1),
(58, 9, 'landcntemad.jpg', '6e192ece3cbf2a2dfe8d10ea243765d6d62a2fd8.jpeg', 'landcntemad.jpg', 1),
(59, 21, 'landesm.jpg', '1f5b7dded3635199b2212e103379991e8adfb8cd.jpeg', 'landesm.jpg', 1),
(60, 29, 'landispm.JPG', '91a76204595439e46b035123213fe78aeb248d3d.jpeg', 'landispm.JPG', 1),
(61, 4, 'landespa.JPG', '2802c3bc16977cb469eae5dfad4faf01ead8c5d4.jpeg', 'landespa.JPG', 0),
(62, 4, 'landespa2.JPG', '83f67d175405f51344ad1e010492f7362844197a.jpeg', 'landespa2.JPG', 1),
(63, 39, 'land96.jpg', '25c66798ed16c20902ccc057c21491525df5c8fc.jpeg', 'land96.jpg', 1),
(64, 31, 'vatel.jpg', 'ec334b5f015c877aca605fce2e6c87e1e0d5c71e.jpeg', 'vatel.jpg', 1),
(65, 25, 'espm.jpg', '723903791d28aa2ddd00b009333082f843c0e67a.jpeg', 'espm.jpg', 1),
(66, 34, 'atesa.jpg', '985c98d2386a65a413d0fffc56ca4480ac0bf61a.jpeg', 'atesa.jpg', 1),
(67, 26, 'esmia.jpg', '50456c5117164212c171a325951771a2381e4886.jpeg', 'esmia.jpg', 0),
(68, 26, 'esmia.jpg', '4193f94750e0d6213c6ca1691253ca48dbb8e7cf.jpeg', 'esmia.jpg', 1),
(69, 32, 'isfps.jpg', '95316f1dfc2f87c5ee81b899a369a864daecd54d.jpeg', 'isfps.jpg', 1),
(70, 35, 'ism.jpg', 'f1ce0df2bacad1f647998b59083d93f30085bdf5.jpeg', 'ism.jpg', 1);

-- --------------------------------------------------------

--
-- Structure de la table `sl_evaluation`
--

CREATE TABLE `sl_evaluation` (
  `id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `mark` double NOT NULL,
  `comment` longtext COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `sl_evaluation`
--

INSERT INTO `sl_evaluation` (`id`, `school_id`, `user_id`, `mark`, `comment`, `date`) VALUES
(1, 1, 2, 80, 'Quisque ullamcorper pulvinar libero, sit amet tristique est auctor sit amet. Sed tempor iaculis ligula quis tincidunt. Vivamus nec commodo ipsum, sed viverra nibh. Phasellus hendrerit condimentum mi, vitae volutpat lorem convallis eu. Suspendisse commodo sollicitudin mi, eu scelerisque turpis facilisis non.Quisque ullamcorper pulvinar libero, sit amet tristique est auctor sit amet. Sed tempor iaculis ligula quis tincidunt. Vivamus nec commodo ipsum, sed viverra nibh. Phasellus hendrerit condimentum mi, vitae volutpat lorem convallis eu. Suspendisse commodo sollicitudin mi, eu scelerisque turpis facilisis non.', '2017-03-16 00:00:00'),
(2, 1, 4, 60, 'Vestibulum vitae accumsan turpis, ut sollicitudin ex. Cras bibendum bibendum pharetra. Vestibulum sed venenatis justo, sit amet feugiat lectus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed in iaculis leo. Integer vel diam iaculis, tincidunt nibh vitae, maximus nulla. Suspendisse at tincidunt elit. Maecenas mattis neque vehicula justo ornare dictum a vel risus. ', '2017-03-17 00:00:00'),
(31, 6, 1, 80, 'ment du faux texte employé dans la composition et la mise en page avant impression. \nLe Lorem Ipsum est le faux texte standard de l''imprimerie depuis les années 1500, quand un peintre anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte. \nIl n''a pas fait que survivre cinq siècles.', '2017-03-22 13:46:13'),
(32, 2, 1, 80, 'Quisque condimentum risus lectus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Proin posuere scelerisque massa id tincidunt. Phasellus venenatis convallis nunc, eget malesuada lectus. Curabitur ex augue, vestibulum at enim non, volutpat facilisis nulla. Vestibulum nec volutpat nisi, sed faucibus neque.', '2017-03-22 13:47:25'),
(33, 2, 1, 80, 'Quisque condimentum risus lectus. \nInterdum et malesuada fames ac ante ipsum primis in faucibus. Proin posuere scelerisque massa id tincidunt. Phasellus venenatis convallis nunc, eget malesuada lectus. Curabitur ex augue, vestibulum at enim non, volutpat facilisis nulla. \nVestibulum nec volutpat nisi, sed faucibus neque.', '2017-03-22 13:49:41'),
(34, 2, 2, 80, 'non congue nisi urna non mi. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Vivamus varius orci eu augue semper, vel vehicula odio egestas.\nCurabitur ex augue, vestibulum at enim non, volutpat facilisis nulla.', '2017-03-22 13:52:55'),
(35, 6, 2, 100, 'le faux texte standard de l''imprimerie depuis les années 1500, quand un peintre anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte.', '2017-03-22 14:01:12'),
(36, 4, 2, 80, 'Le Lorem Ipsum est le faux texte standard de l''imprimerie depuis les années 1500, quand un peintre anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte. Il n''a pas fait que survivre cinq siècles.', '2017-03-22 14:02:11'),
(37, 6, 2, 20, 'Ipsum est le faux texte standard de l''imprimerie depuis les années 1500, quand un peintre anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de', '2017-03-22 15:37:18'),
(38, 2, 5, 100, 'Ceci n''est rien qu''un test. je vous remercie quand même de lire cette évaluation. bonne continuation', '2017-03-22 15:39:56'),
(39, 6, 5, 80, 'quand un peintre anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte. Il n''a pas fait que survivre cinq siècles.', '2017-03-22 15:45:25'),
(40, 3, 5, 100, 'Suspendisse leo urna, varius eu nunc vel, dignissim consequat ligula. Donec mollis tincidunt ex, eu sagittis lectus aliquet eget. Aenean ligula ex, dapibus vel magna non, imperdiet semper nisi. Fusce id cursus nulla. Aenean facilisis porta metus eget vulputate. Sed nisi arcu, gravida vel sollicitudin eget, lobortis dapibus leo.', '2017-03-22 16:08:04'),
(41, 5, 1, 100, 'Maecenas pharetra nunc eleifend magna tempus, a lacinia sem varius. Mauris elit metus, sodales blandit vehicula eget, congue eu diam.', '2017-03-23 07:33:57'),
(42, 2, 1, 80, 'tus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Proin posuere scelerisque massa id tincidunt. Phasellus venenatis convallis nunc, eget malesuada lectus', '2017-03-24 07:50:16'),
(43, 2, 1, 80, 'tus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Proin posuere scelerisque massa id tincidunt. Phasellus venenatis convallis nunc, eget malesuada lectus', '2017-03-24 07:50:24'),
(44, 3, 1, 20, 'Donec placerat augue risus, viverra molestie libero ultricies eu. Suspendisse leo urna, varius eu nunc vel, dignissim consequat ligula. Donec mollis tincidunt ex, eu sagittis lectus aliquet eget.', '2017-03-24 07:51:20'),
(45, 4, 1, 100, 'Donec vestibulum sem ac rutrum tempus. Sed feugiat rutrum elit id ullamcorper. Aliquam erat volutpat. Nullam nec neque quis orci porttitor blandit. Ut in convallis tellus. Sed bibendum posuere mi, a sodales diam efficitur sit amet. Nunc eu euismod felis. Mauris vel turpis in metus sagittis dignissim. Vestibulum euismod finibus mattis. Phasellus porttitor mi odio, quis facilisis arcu pulvinar non. Fusce lacinia turpis vehicula elit interdum, ut viverra odio scelerisque. Aenean sit amet nisl id nulla consequat semper a eu massa.', '2017-03-24 09:38:11'),
(46, 4, 3, 40, 'Interdum et malesuada fames ac ante ipsum primis in faucibus. Curabitur consectetur elit eget ante pulvinar, sit amet porttitor tortor suscipit. Pellentesque sit amet ultrices neque, et tempor mauris. Nam vitae sollicitudin turpis. Nulla id sapien sit amet magna eleifend condimentum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Phasellus vel risus in orci convallis semper sit amet in urna. Sed rhoncus augue euismod, accumsan nulla nec, commodo magna. Quisque laoreet lacus id consequat imperdiet. Sed vel massa ac magna venenatis aliquet nec et justo.', '2017-03-27 07:27:05'),
(47, 7, 3, 100, 'Nullam vestibulum, libero aliquet sodales finibus, est nibh tincidunt ipsum, sit amet ultrices felis mauris id purus. Nam sed lobortis massa, sit amet tempus velit. Nam ex nunc, ultricies et augue ac, rutrum luctus tellus. Quisque vitae elementum enim, non gravida nisl. Donec varius convallis mauris eget tincidunt.', '2017-03-27 07:37:00'),
(48, 1, 1, 20, 'Suspendisse commodo sollicitudin mi, eu scelerisque turpis facilisis non.Quisque ullamcorper pulvinar libero, sit amet tristique est auctor sit amet. Sed tempor iaculis ligula quis tincidunt. Vivamus nec commodo ipsum, sed viverra nibh. Phasellus hendrerit condimentum mi, vitae volutpat lorem convallis eu. Suspendisse commodo sollicitudin mi, eu scelerisque turpis facilisis non.', '2017-03-28 14:35:35'),
(49, 1, 1, 80, 'sdfsdf', '2017-03-28 15:03:19'),
(50, 2, 2, 80, 'L’IST d’Antananarivo offre trois types de formation : Les formations de cycle court de type alternatif (Bacc + 2 / Bacc + 3), Les formations d’Ingénieur de grade Master, Les formations de type hybride : Formation Ouverte et A Distance (FOAD) diplômante - Formation présentielle de type initial et de type continu diplômante et qualifiante', '2017-04-07 13:24:20'),
(51, 8, 2, 80, 'Mauris facilisis lacus ut nibh luctus, sit amet laoreet odio pretium. \nMauris viverra, velit sit amet mollis tincidunt, erat augue venenatis nisi, non elementum dolor leo vel augue. \n\nPellentesque tempor lorem id leo volutpat pulvinar. Ut scelerisque arcu odio', '2017-04-14 15:15:09'),
(52, 4, 6, 80, 'Nam vitae sollicitudin turpis. Nulla id sapien sit amet magna eleifend condimentum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Phasellus vel risus in orci convallis semper sit amet in urna.', '2017-04-19 11:32:45'),
(53, 8, 1, 80, 'Pellentesque tempor lorem id leo volutpat pulvinar. Ut scelerisque arcu odio', '2017-04-19 16:15:15'),
(54, 8, 1, 40, 'Mauris facilisis lacus ut nibh luctus, sit amet laoreet odio pretium.\nMauris viverra, velit sit amet mollis tincidunt, erat augue venenatis nisi, non elementum dolor leo vel augue.\n\nPellentesque tempor lorem id leo volutpat pulvinar. Ut scelerisque arcu odio', '2017-04-19 16:15:23'),
(55, 2, 1, 80, 'éàopç', '2017-04-21 13:20:25'),
(56, 6, 1, 20, 'test', '2017-04-27 11:30:56'),
(57, 5, 1, 80, 'test tsets', '2017-05-02 11:00:15'),
(58, 5, 1, 40, 'test tsets tests s dsfd', '2017-05-02 11:00:22'),
(59, 8, 2, 80, 'c''est aussi bénéficier d''un accompagnement personnalisé qui vous permettra de mener à bien votre projet de formation et de vous préparer à l''entrée dans la vie active et professionnelle.', '2017-05-03 07:06:02'),
(60, 9, 2, 80, 'alesuada .Curabitur laoreet varius malesuada .Curabitur laoreet varius malesuada .Curabitur laoreet varius malesuada .Curabitur laoreet varius malesuada .Curabitur laoreet varius malesuada .Curabitur laoreet varius malesuada .Curabitur laoreet varius malesuada .Curabitur laoreet varius malesuada .Curabitur laoreet varius ma', '2017-05-03 09:22:11'),
(61, 1, 6, 100, 'tetur adipiscing elit. Nunc dapibus scelerisque felis, quis pretium metus dignissim id. Nulla sed cursus felis, nec egestas felis. Donec convallis sapien nec sem efficitur interdum. Mauris vel magna quis ipsum maximus feugiat nec eget mi. Fusce imperdiet auctor nibh, quis gravida mi dictum ut. Sed elit dolor, cursus sed augue viverra, tempor aliquet quam. Morbi diam lectus, por', '2017-05-04 07:42:59'),
(62, 4, 1, 80, 'C''est est un établissement supérieur rattaché à l''université d''Antananarivo. Anciennement dénommé Etablissement Supérieur Polytechnique (E.E.S.P.), elle a reçu sa nouvelle appellation par le Décret n°91-148 du 26 mars 1991 portant création des Ecoles Supérieure Polytechnique. L''ESPA est située géographiquement au Campus de Vontovorona, à 20 kilomètres de la capitale sur la RN1.', '2017-05-04 15:27:11'),
(63, 12, 3, 80, 'ibi falso responsa sint, erubescas. Quis est enim, cui via ista non pateat, qui isti aetati atque etiam isti dignitati non possit quam velit petulanter, etiamsi sine ulla suspicione, at non sine argumento male dicere? Sed istarum partium culpa est eorum, qui te agere voluerunt; laus pudoris tui, quod ea te invitum dicere videba', '2017-05-08 12:03:10'),
(64, 16, 1, 80, 'clarae indolis viri negotium est actitatum, cuius hunc novimus esse textum. cum Africam pro consule regeret Carthaginiensibus victus inopia iam lassatis, ex horreis Ro', '2017-05-09 10:54:22'),
(65, 16, 1, 80, 'clarae indoclarae indolis viri negotium est actitatum, cuius hunc novimus esse textum. cum Africam pro consule regeret Carthaginiensibus victus inopia iam lassatis, ex horreis Rolis viri negotium est actitatum, cuius hunc novimus esse textum. cum Africam pro consule regeret Carthaginiensibus victus inopia iam lassatis, ex horreis Ro', '2017-05-09 10:54:27'),
(66, 17, 2, 100, '« Ce n''est pas la jalousie que les femmes haïssent, c''est la manière dont les hommes sont jaloux. » Jean-Benjamin de Laborde', '2017-05-15 07:23:22'),
(67, 13, 2, 80, 'Cumque pertinacius ut legum gnarus accusatorem flagitaret atque sollemnia, doctus id Caesar libertatemque superbiam ratus tamquam obtrectatorem audacem excarnificari praecepit, qui ita evisceratus ut cruciatibus membra deessent, inplorans caelo iustitiam, torvum renidens fundato pectore mansit inmobilis nec se incusare nec quemquam alium passus et tandem nec confessus nec confutatus cum abiecto consorte poenali est morte multatus. et ducebatur intrepidus temporum iniquitati insultans, imitatus Zenonem illum veterem Stoicum qui ut mentiretur quaedam laceratus diutius, avulsam sedibus linguam suam cum cruento sputamine in oculos interrogantis Cyprii regis inpegit.', '2017-05-15 07:37:49'),
(68, 3, 2, 20, 'Sciences agronomiques, Informatique, Sciences de la Terre, Textile et Habillement et le 2ème domaine (SSo), les mentions Economie et Commerce et Droit. Chaque mention doit pouvoir offrir une gamme de formations capable de répondre à la demande croissante de polyvalence et multi-compétence dans les métiers et les fonctions exercées.', '2017-05-15 14:43:48'),
(69, 3, 1, 20, 'onsequat ligula. Donec mollis tincidunt ex, eu sagittis lectus aliquet eget. Aenean ligula ex, dapibus vel magna non, imperdiet semper nisi. Fusce id cursus nulla. Aenean f', '2017-05-17 08:13:05'),
(70, 3, 1, 80, ', dignissim consequat ligula. Donec mollis tincidunt ex, eu sagittis lectus aliquet eget. Aenean ligula ex, dapibus vel magna non, imperdiet semper nisi. Fusce id cursus nulla. Aen', '2017-05-17 08:17:14'),
(71, 3, 1, 60, 's ; Sciences agronomiques, Informatique, Sciences de la Terre, Textile et Habillement et le 2ème domaine (SSo), les mentions Economie et Commerce et Droit. Chaque mention doit pouvoir offrir une gamme de formations capable de répondre à la demande croissante de polyvalence et multi-compétence dans les méti', '2017-05-17 08:21:32'),
(72, 2, 1, 80, 'tum risus lectus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Proin posuere scelerisque massa id tincidunt. Phasellus venenatis convallis nunc, eget malesuada lectus. Curabitur ex augue, vestibulum at enim non, volutpat facilisis nulla. Vestibulum nec volutpat nisi,', '2017-05-17 09:33:15'),
(73, 2, 1, 100, 'tus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Proin posuere scelerisque massa id tincidunt. Phasellus venenatis convallis nunc, eget malesuada lectus. Curabitur ex augue, vestibulum at enim non, volutpat facilisis nulla. Vestibulum nec volutpat nisi, sed fa', '2017-05-17 09:37:36'),
(74, 2, 1, 80, 'ctus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Proin posuere scelerisque massa id tincidunt. Phasellus venenatis convallis nunc, eget malesuada lectus. Curabitur ex augue, vestibulum at enim non, volutpat facilisis nulla. Vestibulum nec volutpat nisi, sed fau', '2017-05-17 09:40:46'),
(75, 2, 1, 100, 'ctus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Proin posuere scelerisque massa id tincidunt. Phasellus venenatis convallis nunc, eget malesuada lectus. Curabitur ex augu', '2017-05-17 09:41:43'),
(76, 7, 1, 80, 'a', '2017-05-17 09:42:28'),
(77, 15, 2, 80, 'pertinacius ut legum gnarus accusatorem flagitaret atque sollemnia, doctus id Caesar libertatemque superbiam ratus tamquam obtrectatorem audacem excarnificari praecepit, qui ita evisceratus ut cruciatibus membra deessent, inplorans caelo iustitiam, torvum renidens fundato pectore mansit inmobilis nec se incusare nec quemquam alium passus et tandem nec confessus nec confutatus cum abiecto consorte poenali est morte multatus. et ducebatur intrepidus temporum iniqu', '2017-05-18 08:56:19'),
(78, 1, 1, 100, 'et. Sed tempor iaculis ligula quis tincidunt. Vivamus nec commodo ipsum, sed viverra nibh. Phasellus hendrerit condimentum mi, vitae volutpat lorem convallis eu. Suspendisse co', '2017-05-23 08:10:10'),
(79, 24, 1, 20, 'halassius vero ea tempestate praefecthalassius vero ea tempestate praefecthalassius vero ea tempestate praefect', '2017-05-23 11:20:31'),
(80, 7, 1, 80, 't, libero aliquet sodales finibus, est nibh tincidunt ipsum, sit amet ultrices felis mauris id purus. Nam sed lobortis massa, sit amet tempus velit. Nam ex nunc, ultricies et au', '2017-05-23 14:34:47'),
(81, 7, 1, 80, 'a\n\n\na', '2017-05-23 14:35:33'),
(82, 11, 1, 80, 'et sapiens (sic enim est habitus) et amicitiae gloria excellens de amicitia loquetur. Tu velim a me animum parumper avertas, Laelium loqui ipsum putes. C. Fannius et Q. Mucius ad socerum veniunt post mortem Africani; ab his sermo oritur, respondet Laelius, cuius tota disputatio est de amicitia, quam legens te ipse cognosces.', '2017-05-23 15:24:24'),
(83, 7, 1, 40, 'ero aliquet sodales finibus, est nibh tincidunt ipsum, sit amet ultrices felis mauris id purus. Nam sed lobortis massa, sit amet tempus velit. Nam ex nunc, ultricies et augue a', '2017-05-23 15:49:15'),
(84, 7, 1, 20, 'ero aliquet sodales finibus, est nibh tincidunt ipsum, sit amet ultrices felis mauris id purus. Nam sed lobortis massa, sit amet tempus velit. Nam ex nunc, ultricies et augue aero aliquet sodales finibus, est nibh tincidunt ipsum, sit amet ultrices felis mauris id purus. Nam sed lobortis massa, sit amet tempus velit. Nam ex nunc, ultricies et augue aero aliquet sodales finibus, est nibh tincidunt ipsum, sit amet ultrices felis mauris id purus. Nam sed lobortis massa, sit amet tempus velit. Nam ex nunc, ultricies et augue a', '2017-05-23 15:49:24'),
(85, 11, 2, 80, 'c enim est habitus) et amicitiae gloria excellens de amicitia loquetur. Tu velim a me animum parumper avertas, Laelium loqui ipsum putes. C. Fannius et Q. Mucius ad s\n\nc enim est habitus) et amicitiae gloria excellens de amicitia loquetur. Tu velim a me animum parumper avertas, Laelium loqui ipsum putes. C. Fannius et Q. Mucius ad s', '2017-05-26 12:29:53'),
(86, 11, 2, 20, 'c enim est habitus) et amicitiae gloria excellens de amicitia loquetur. Tu velim a me animum parumper avertas, Laelium loqui ipsum putes. C. Fannius et Q. Mucius ad sc enim est habitus) et amicitiae gloria excellens de amicitia loquetur. Tu velim a me animum parumper avertas, Laelium loqui ipsum putes. C. Fannius et Q. Mucius ad sc enim est habitus) et amicitiae gloria excellens de amicitia loquetur. Tu velim a me animum parumper avertas, Laelium loqui ipsum putes. C. Fannius et Q. Mucius ad s', '2017-05-26 12:29:58'),
(87, 11, 2, 20, 'jghjghj', '2017-05-26 12:31:20'),
(88, 1, 2, 80, 'fgdg dfg dfg', '2017-05-29 11:36:37'),
(89, 9, 2, 40, 'fsdfsdf', '2017-05-29 15:23:32'),
(90, 9, 2, 40, 'sdfsdf', '2017-05-29 15:23:36'),
(91, 1, 2, 80, 'por iaculis ligula quis tincidunt. Vivamus nec commodo ipsum, sed viverra nibh. Phasellus hendrerit condimentum mi, vitae volutpat lorem convallis eu. Suspendisse commodo \npor iaculis ligula quis tincidunt. Vivamus nec commodo ipsum, sed viverra nibh. Phasellus hendrerit condimentum mi, vitae volutpat lorem convallis eu. Suspendisse commodo por iaculis ligula quis tincidunt. Vivamus nec commodo ipsum, sed viverra nibh. Phasellus hendrerit condimentum mi, vitae volutpat lorem convallis eu. Suspendisse commodo', '2017-05-30 11:07:37'),
(92, 1, 1, 60, 'dfsd sdf sdf', '2017-06-16 07:13:55'),
(93, 4, 1, 80, 'dfds sdf sdf', '2017-06-21 15:39:02'),
(94, 11, 1, 100, 'et sapiens (sic enim est habitus) et amicitiae gloria excellens de amicitia loquetur. Tu velim a me animum parumper avertas, Laelium loqui ipsum putes. C. Fannius et Q. Mucius ad socerum veniunt post mortem Africani; ab his sermo oritur, respondet Laelius, cuius tota disputatio est de amicitia, quam legens te ipse cognosces.', '2017-06-29 14:51:28'),
(95, 46, 2, 100, 'nsternuntur, aut ex necessitate ultima fortiter dimicante, superati periculose per prona discedunt. Hanc regionem praestitutis celebritati diebus invadere parans dux ante edictus per solitudines Aboraeque amnis herbidas ripas, suorum indicio proditus, qui admissi flagitii metu exagitati ad praesidia descivere Romana. absque ullo egress', '2017-06-30 09:01:05');

-- --------------------------------------------------------

--
-- Structure de la table `sl_field`
--

CREATE TABLE `sl_field` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `school_id` int(11) NOT NULL,
  `default_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `published` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `sl_field`
--

INSERT INTO `sl_field` (`id`, `slug`, `school_id`, `default_name`, `published`) VALUES
(1, 'management-des-affaires', 1, 'Management des affaires', 0),
(4, 'eleifend', 9, 'eleifend', 0),
(5, 'euismod-sit-amet-ultricies', 3, 'euismod sit amet ultricies', 0),
(6, 'nunc-ultricies-ac-arcu-vitae', 3, 'Nunc ultricies ac arcu vitae', 0),
(7, 'mauris-facilisis-lacus', 8, 'Mauris facilisis lacus', 0),
(11, 'llam-odio-nisl-accumsan', 8, 'llam odio nisl, accumsan', 0),
(12, 'theologie', 6, 'Théologie', 0),
(13, 'droit-et-affaires-etrangeres', 6, 'Droit et affaires étrangères', 0),
(14, 'batiment-et-travaux-publiques-btp', 4, 'Batiment et Travaux Publiques (BTP)', 0),
(15, 'nam-ultrices-nibh-sapien-vel-cursus-leo-tempus-eu', 11, 'Nam ultrices nibh sapien, vel cursus leo tempus eu', 0),
(16, 'vel-cursus-leo-tempus-eu', 29, 'vel cursus leo tempus eu', 0),
(17, 'curabitur-laoreet-varius-malesuada', 1, 'Curabitur laoreet varius malesuada', 1),
(22, 'uismod-sit-amet-ultricies-co', 22, 'uismod sit amet ultricies co', 0),
(23, 'felis-nisi-ut-variu', 22, 'felis nisi, ut variu', 0),
(24, 'sit-amet-ultricies-co', 1, 'sit amet ultricies co', 0),
(25, 'acinia-fel', 1, 'acinia fel', 0),
(26, 'd-sit-amet-ultricies-c', 3, 'd sit amet ultricies c', 0),
(27, 'mod-sit-amet-ultricies', 2, 'mod sit amet ultricies', 0),
(28, 'gestion-commerciale', 3, 'gestion commerciale', 0),
(29, 'ressources-humaines', 34, 'Ressources Humaines', 0),
(30, 'telecommunications', 4, 'Télécommunications', 0);

-- --------------------------------------------------------

--
-- Structure de la table `sl_field_translate`
--

CREATE TABLE `sl_field_translate` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `field_id` int(11) NOT NULL,
  `locale_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `sl_field_translate`
--

INSERT INTO `sl_field_translate` (`id`, `name`, `description`, `field_id`, `locale_id`) VALUES
(1, 'Management', '<div>Le <strong>management</strong> est la mise en &oelig;uvre des moyens humains et mat&eacute;riels d''une entreprise pour atteindre ses objectifs. Le management d&eacute;signe aussi ses responsables.</div>\n<div>Le management d''une grande organisation est un ensemble bidimensionnel de principes et de r&egrave;gles d''action empiriques contingents dont l''application syst&eacute;matique doit assurer l''efficience de la coordination des activit&eacute;s collectives et, conjointement, la motivation pour une coop&eacute;ration active et gratifiante de la part des membres de l''organisation.</div>', 1, 1),
(2, 'Management', '<div>Le <strong>management</strong> est la mise en &oelig;uvre des moyens humains et mat&eacute;riels d''une entreprise pour atteindre ses objectifs. Le management d&eacute;signe aussi ses responsables.</div>\n<div>Le management d''une grande organisation est un ensemble bidimensionnel de principes et de r&egrave;gles d''action empiriques contingents dont l''application syst&eacute;matique doit assurer l''efficience de la coordination des activit&eacute;s collectives et, conjointement, la motivation pour une coop&eacute;ration active et gratifiante de la part des membres de l''organisation.</div>', 1, 2),
(3, 'Management', 'mg. Description .Management', 1, 3),
(4, 'Management', 'it. Description .Management', 1, 4),
(5, 'Management', 'es. Description .Management', 1, 5),
(19, 'deutch name', '<p>&nbsp;deutch description</p>', 1, 6),
(20, 'eleifend', 'fr. Description .eleifend', 4, 1),
(21, 'eleifend', 'en. Description .eleifend', 4, 2),
(22, 'eleifend', 'mg. Description .eleifend', 4, 3),
(23, 'eleifend', 'it. Description .eleifend', 4, 4),
(24, 'eleifend', 'es. Description .eleifend', 4, 5),
(25, 'eleifend', 'de. Description .eleifend', 4, 6),
(26, 'euismod sit amet ultricies', '<p>Aenean auctor imperdiet augue, non vestibulum urna sollicitudin in. Phasellus a sapien lorem. Duis condimentum elit eu gravida pellentesque. Maecenas rutrum neque eget tellus consectetur blandit. Cras et mauris nec mauris accumsan vehicula cursus non elit. Vivamus eleifend mauris et sollicitudin varius. Donec eu metus erat. Etiam nec sem rhoncus, elementum enim sed, lacinia risus. Phasellus neque massa, mattis non scelerisque aliquet, rhoncus vel massa. Vestibulum volutpat accumsan facilisis. Maecenas sagittis eu magna eu malesuada. Quisque tincidunt felis a sem mollis, at mattis sapien viverra.</p>', 5, 1),
(27, 'euismod sit amet ultricies', '<p>Aenean auctor imperdiet augue, non vestibulum urna sollicitudin in. Phasellus a sapien lorem. Duis condimentum elit eu gravida pellentesque. Maecenas rutrum neque eget tellus consectetur blandit. Cras et mauris nec mauris accumsan vehicula cursus non elit. Vivamus eleifend mauris et sollicitudin varius. Donec eu metus erat. Etiam nec sem rhoncus, elementum enim sed, lacinia risus. Phasellus neque massa, mattis non scelerisque aliquet, rhoncus vel massa. Vestibulum volutpat accumsan facilisis. Maecenas sagittis eu magna eu malesuada. Quisque tincidunt felis a sem mollis, at mattis sapien viverra.</p>', 5, 2),
(28, 'euismod sit amet ultricies', 'mg. Description .euismod sit amet ultricies', 5, 3),
(29, 'euismod sit amet ultricies', 'it. Description .euismod sit amet ultricies', 5, 4),
(30, 'euismod sit amet ultricies', 'es. Description .euismod sit amet ultricies', 5, 5),
(31, 'euismod sit amet ultricies', 'de. Description .euismod sit amet ultricies', 5, 6),
(32, 'Nunc ultricies ac arcu vitae', '<p>Morbi cursus ut orci eget hendrerit. Suspendisse id elit lacus. Donec suscipit placerat est, sed sagittis nisi. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur sit amet elementum magna.</p>\n<p>Aenean auctor imperdiet augue, non vestibulum urna sollicitudin in. Phasellus a sapien lorem. Duis condimentum elit eu gravida pellentesque. Maecenas rutrum neque eget tellus consectetur blandit. Cras et mauris nec mauris accumsan vehicula cursus non elit. Vivamus eleifend mauris et sollicitudin varius. Donec eu metus erat. Etiam nec sem rhoncus, elementum enim sed, lacinia risus. Phasellus neque massa, mattis non scelerisque aliquet, rhoncus vel massa. Vestibulum volutpat accumsan facilisis. Maecenas sagittis eu magna eu malesuada. Quisque tincidunt felis a sem mollis, at mattis sapien viverra. Nulla nibh justo, lacinia non quam a, dignissim sagittis lectus. Phasellus vitae lacus consequat, dictum massa vitae, maximus quam.</p>\n<p>Nam auctor risus et dolor viverra placerat. Aenean non ligula non lorem dapibus finibus. Donec est urna, dapibus sed nisi ac, placerat ullamcorper diam. In tempor, augue ac suscipit rhoncus, lorem ligula euismod mi, a facilisis urna felis ac est. Proin ut vestibulum lacus.</p>', 6, 1),
(33, 'Nunc ultricies ac arcu vitae', '<p>Morbi cursus ut orci eget hendrerit. Suspendisse id elit lacus. Donec suscipit placerat est, sed sagittis nisi. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur sit amet elementum magna.</p>\n<p>Aenean auctor imperdiet augue, non vestibulum urna sollicitudin in. Phasellus a sapien lorem. Duis condimentum elit eu gravida pellentesque. Maecenas rutrum neque eget tellus consectetur blandit. Cras et mauris nec mauris accumsan vehicula cursus non elit. Vivamus eleifend mauris et sollicitudin varius. Donec eu metus erat. Etiam nec sem rhoncus, elementum enim sed, lacinia risus. Phasellus neque massa, mattis non scelerisque aliquet, rhoncus vel massa. Vestibulum volutpat accumsan facilisis. Maecenas sagittis eu magna eu malesuada. Quisque tincidunt felis a sem mollis, at mattis sapien viverra. Nulla nibh justo, lacinia non quam a, dignissim sagittis lectus. Phasellus vitae lacus consequat, dictum massa vitae, maximus quam.</p>\n<p>Nam auctor risus et dolor viverra placerat. Aenean non ligula non lorem dapibus finibus. Donec est urna, dapibus sed nisi ac, placerat ullamcorper diam. In tempor, augue ac suscipit rhoncus, lorem ligula euismod mi, a facilisis urna felis ac est. Proin ut vestibulum lacus.</p>', 6, 2),
(34, 'Nunc ultricies ac arcu vitae', 'mg. Description .Nunc ultricies ac arcu vitae', 6, 3),
(35, 'Nunc ultricies ac arcu vitae', 'it. Description .Nunc ultricies ac arcu vitae', 6, 4),
(36, 'Nunc ultricies ac arcu vitae', 'es. Description .Nunc ultricies ac arcu vitae', 6, 5),
(37, 'Nunc ultricies ac arcu vitae', 'de. Description .Nunc ultricies ac arcu vitae', 6, 6),
(38, 'Mauris facilisis lacus', '<p>Mauris facilisis lacus ut nibh luctus, sit amet laoreet odio pretium. Mauris viverra, velit sit amet mollis tincidunt, erat augue venenatis nisi, non elementum dolor leo vel augue. Pellentesque tempor lorem id leo volutpat pulvinar. Ut scelerisque arcu odioMauris facilisis lacus ut nibh luctus, sit amet laoreet odio pretium. Mauris viverra, velit sit amet mollis tincidunt, erat augue venenatis nisi, non elementum dolor leo vel augue. Pellentesque tempor lorem id leo volutpat pulvinar. Ut scelerisque arcu odio</p>', 7, 1),
(39, 'Mauris facilisis lacus', '<p>Mauris facilisis lacus ut nibh luctus, sit amet laoreet odio pretium. Mauris viverra, velit sit amet mollis tincidunt, erat augue venenatis nisi, non elementum dolor leo vel augue. Pellentesque tempor lorem id leo volutpat pulvinar. Ut scelerisque arcu odioMauris facilisis lacus ut nibh luctus, sit amet laoreet odio pretium. Mauris viverra, velit sit amet mollis tincidunt, erat augue venenatis nisi, non elementum dolor leo vel augue. Pellentesque tempor lorem id leo volutpat pulvinar. Ut scelerisque arcu odio</p>', 7, 2),
(40, 'Mauris facilisis lacus', 'mg. Description .Mauris facilisis lacus', 7, 3),
(41, 'Mauris facilisis lacus', 'it. Description .Mauris facilisis lacus', 7, 4),
(42, 'Mauris facilisis lacus', 'es. Description .Mauris facilisis lacus', 7, 5),
(43, 'Mauris facilisis lacus', 'de. Description .Mauris facilisis lacus', 7, 6),
(62, 'llam odio nisl, accumsan', 'fr. Description .llam odio nisl, accumsan', 11, 1),
(63, 'llam odio nisl, accumsan', 'en. Description .llam odio nisl, accumsan', 11, 2),
(64, 'llam odio nisl, accumsan', 'mg. Description .llam odio nisl, accumsan', 11, 3),
(65, 'llam odio nisl, accumsan', 'it. Description .llam odio nisl, accumsan', 11, 4),
(66, 'llam odio nisl, accumsan', 'es. Description .llam odio nisl, accumsan', 11, 5),
(67, 'llam odio nisl, accumsan', 'de. Description .llam odio nisl, accumsan', 11, 6),
(68, 'Théologie', '<p>Sed non erat in neque mollis ultricies. Nam ultrices nibh sapien, vel cursus leo tempus eu. Curabitur laoreet varius malesuada. Nullam lacinia felis nisi, ut varius ipsum luctus non. Pellentesque ex magna, euismod sit amet ultricies consequat, eleifend eu purus. Nullam odio nisl, accumsan tristique elit sit amet, finibus rhoncus ipsum. Nunc ultricies ac arcu vitae elementum.</p>', 12, 1),
(69, 'Théologie', '<p>Sed non erat in neque mollis ultricies. Nam ultrices nibh sapien, vel cursus leo tempus eu. Curabitur laoreet varius malesuada. Nullam lacinia felis nisi, ut varius ipsum luctus non. Pellentesque ex magna, euismod sit amet ultricies consequat, eleifend eu purus. Nullam odio nisl, accumsan tristique elit sit amet, finibus rhoncus ipsum. Nunc ultricies ac arcu vitae elementum.</p>', 12, 2),
(70, 'Théologie', 'mg. Description .Théologie', 12, 3),
(71, 'Théologie', 'it. Description .Théologie', 12, 4),
(72, 'Théologie', 'es. Description .Théologie', 12, 5),
(73, 'Théologie', 'de. Description .Théologie', 12, 6),
(74, 'Droit et affaires étrangères', '<p>Nam ultrices nibh sapien, vel cursus leo tempus eu. Curabitur laoreet varius malesuada. Nullam lacinia felis nisi, ut varius ipsum luctus non. Pellentesque ex magna, euismod sit amet ultricies consequat, eleifend eu purus. Nullam odio nisl, accumsan tristique elit sit amet, finibus rhoncus ipsum. Nunc ultricies ac arcu vitae elementum.</p>', 13, 1),
(75, 'Droit et affaires étrangères', '<p>Nam ultrices nibh sapien, vel cursus leo tempus eu. Curabitur laoreet varius malesuada. Nullam lacinia felis nisi, ut varius ipsum luctus non. Pellentesque ex magna, euismod sit amet ultricies consequat, eleifend eu purus. Nullam odio nisl, accumsan tristique elit sit amet, finibus rhoncus ipsum. Nunc ultricies ac arcu vitae elementum.</p>', 13, 2),
(76, 'Droit et affaires étrangères', 'mg. Description .Droit et affaires étrangères', 13, 3),
(77, 'Droit et affaires étrangères', 'it. Description .Droit et affaires étrangères', 13, 4),
(78, 'Droit et affaires étrangères', 'es. Description .Droit et affaires étrangères', 13, 5),
(79, 'Droit et affaires étrangères', 'de. Description .Droit et affaires étrangères', 13, 6),
(80, 'Batiment et Travaux Publiques (BTP)', 'fr. Description .Batiment et Travaux Publiques (BTP)', 14, 1),
(81, 'Batiment et Travaux Publiques (BTP)', 'en. Description .Batiment et Travaux Publiques (BTP)', 14, 2),
(82, 'Batiment et Travaux Publiques (BTP)', 'mg. Description .Batiment et Travaux Publiques (BTP)', 14, 3),
(83, 'Batiment et Travaux Publiques (BTP)', 'it. Description .Batiment et Travaux Publiques (BTP)', 14, 4),
(84, 'Batiment et Travaux Publiques (BTP)', 'es. Description .Batiment et Travaux Publiques (BTP)', 14, 5),
(85, 'Batiment et Travaux Publiques (BTP)', 'de. Description .Batiment et Travaux Publiques (BTP)', 14, 6),
(86, 'Nam ultrices nibh sapien, vel cursus leo tempus eu', 'fr. Description .Nam ultrices nibh sapien, vel cursus leo tempus eu', 15, 1),
(87, 'Nam ultrices nibh sapien, vel cursus leo tempus eu', 'en. Description .Nam ultrices nibh sapien, vel cursus leo tempus eu', 15, 2),
(88, 'Nam ultrices nibh sapien, vel cursus leo tempus eu', 'mg. Description .Nam ultrices nibh sapien, vel cursus leo tempus eu', 15, 3),
(89, 'Nam ultrices nibh sapien, vel cursus leo tempus eu', 'it. Description .Nam ultrices nibh sapien, vel cursus leo tempus eu', 15, 4),
(90, 'Nam ultrices nibh sapien, vel cursus leo tempus eu', 'es. Description .Nam ultrices nibh sapien, vel cursus leo tempus eu', 15, 5),
(91, 'Nam ultrices nibh sapien, vel cursus leo tempus eu', 'de. Description .Nam ultrices nibh sapien, vel cursus leo tempus eu', 15, 6),
(92, 'vel cursus leo tempus eu', 'fr. Description .vel cursus leo tempus eu', 16, 1),
(93, 'vel cursus leo tempus eu', 'en. Description .vel cursus leo tempus eu', 16, 2),
(94, 'vel cursus leo tempus eu', 'mg. Description .vel cursus leo tempus eu', 16, 3),
(95, 'vel cursus leo tempus eu', 'it. Description .vel cursus leo tempus eu', 16, 4),
(96, 'vel cursus leo tempus eu', 'es. Description .vel cursus leo tempus eu', 16, 5),
(97, 'vel cursus leo tempus eu', 'de. Description .vel cursus leo tempus eu', 16, 6),
(98, 'Curabitur laoreet varius malesuada', 'fr. Description .Curabitur laoreet varius malesuada', 17, 1),
(99, 'Curabitur laoreet varius malesuada', 'en. Description .Curabitur laoreet varius malesuada', 17, 2),
(100, 'Curabitur laoreet varius malesuada', 'mg. Description .Curabitur laoreet varius malesuada', 17, 3),
(101, 'Curabitur laoreet varius malesuada', 'it. Description .Curabitur laoreet varius malesuada', 17, 4),
(102, 'Curabitur laoreet varius malesuada', 'es. Description .Curabitur laoreet varius malesuada', 17, 5),
(103, 'Curabitur laoreet varius malesuada', 'de. Description .Curabitur laoreet varius malesuada', 17, 6),
(128, 'uismod sit amet ultricies co', 'fr. Description .uismod sit amet ultricies co', 22, 1),
(129, 'uismod sit amet ultricies co', 'en. Description .uismod sit amet ultricies co', 22, 2),
(130, 'uismod sit amet ultricies co', 'mg. Description .uismod sit amet ultricies co', 22, 3),
(131, 'uismod sit amet ultricies co', 'it. Description .uismod sit amet ultricies co', 22, 4),
(132, 'uismod sit amet ultricies co', 'es. Description .uismod sit amet ultricies co', 22, 5),
(133, 'uismod sit amet ultricies co', 'de. Description .uismod sit amet ultricies co', 22, 6),
(134, 'felis nisi, ut variu', 'fr. Description .felis nisi, ut variu', 23, 1),
(135, 'felis nisi, ut variu', 'en. Description .felis nisi, ut variu', 23, 2),
(136, 'felis nisi, ut variu', 'mg. Description .felis nisi, ut variu', 23, 3),
(137, 'felis nisi, ut variu', 'it. Description .felis nisi, ut variu', 23, 4),
(138, 'felis nisi, ut variu', 'es. Description .felis nisi, ut variu', 23, 5),
(139, 'felis nisi, ut variu', 'de. Description .felis nisi, ut variu', 23, 6),
(140, 'sit amet ultricies co', 'fr. Description .sit amet ultricies co', 24, 1),
(141, 'sit amet ultricies co', 'en. Description .sit amet ultricies co', 24, 2),
(142, 'sit amet ultricies co', 'mg. Description .sit amet ultricies co', 24, 3),
(143, 'sit amet ultricies co', 'it. Description .sit amet ultricies co', 24, 4),
(144, 'sit amet ultricies co', 'es. Description .sit amet ultricies co', 24, 5),
(145, 'sit amet ultricies co', 'de. Description .sit amet ultricies co', 24, 6),
(146, 'acinia fel', 'fr. Description .acinia fel', 25, 1),
(147, 'acinia fel', 'en. Description .acinia fel', 25, 2),
(148, 'acinia fel', 'mg. Description .acinia fel', 25, 3),
(149, 'acinia fel', 'it. Description .acinia fel', 25, 4),
(150, 'acinia fel', 'es. Description .acinia fel', 25, 5),
(151, 'acinia fel', 'de. Description .acinia fel', 25, 6),
(152, 'd sit amet ultricies c', 'fr. Description .d sit amet ultricies c', 26, 1),
(153, 'd sit amet ultricies c', 'en. Description .d sit amet ultricies c', 26, 2),
(154, 'd sit amet ultricies c', 'mg. Description .d sit amet ultricies c', 26, 3),
(155, 'd sit amet ultricies c', 'it. Description .d sit amet ultricies c', 26, 4),
(156, 'd sit amet ultricies c', 'es. Description .d sit amet ultricies c', 26, 5),
(157, 'd sit amet ultricies c', 'de. Description .d sit amet ultricies c', 26, 6),
(158, 'mod sit amet ultricies', 'fr. Description .mod sit amet ultricies', 27, 1),
(159, 'mod sit amet ultricies', 'en. Description .mod sit amet ultricies', 27, 2),
(160, 'mod sit amet ultricies', 'mg. Description .mod sit amet ultricies', 27, 3),
(161, 'mod sit amet ultricies', 'it. Description .mod sit amet ultricies', 27, 4),
(162, 'mod sit amet ultricies', 'es. Description .mod sit amet ultricies', 27, 5),
(163, 'mod sit amet ultricies', 'de. Description .mod sit amet ultricies', 27, 6),
(164, 'gestion commerciale', '<p>Une bonne gestion d''entreprise passe ind&eacute;niablement par une bonne gestion commerciale. En effet, votre facturation, vos cr&eacute;ances clients sont des donn&eacute;es &agrave; absolument maitriser pour assurer la continuit&eacute; d''exploitation de votre soci&eacute;t&eacute;, il faut savoir relancer vos clients pour ne pas laisser&nbsp;votre chiffre d''affaires en dehors de votre compte bancaire. Le suivi de vos fournisseurs &eacute;galement, essayez de n&eacute;gocier avec eux des d&eacute;lais de r&egrave;glement.</p>', 28, 1),
(165, 'gestion commerciale', '<p>Une bonne gestion d''entreprise passe ind&eacute;niablement par une bonne gestion commerciale. En effet, votre facturation, vos cr&eacute;ances clients sont des donn&eacute;es &agrave; absolument maitriser pour assurer la continuit&eacute; d''exploitation de votre soci&eacute;t&eacute;, il faut savoir relancer vos clients pour ne pas laisser&nbsp;votre chiffre d''affaires en dehors de votre compte bancaire. Le suivi de vos fournisseurs &eacute;galement, essayez de n&eacute;gocier avec eux des d&eacute;lais de r&egrave;glement.</p>', 28, 2),
(166, 'gestion commerciale', '<p>Une bonne gestion d''entreprise passe ind&eacute;niablement par une bonne gestion commerciale. En effet, votre facturation, vos cr&eacute;ances clients sont des donn&eacute;es &agrave; absolument maitriser pour assurer la continuit&eacute; d''exploitation de votre soci&eacute;t&eacute;, il faut savoir relancer vos clients pour ne pas laisser&nbsp;votre chiffre d''affaires en dehors de votre compte bancaire. Le suivi de vos fournisseurs &eacute;galement, essayez de n&eacute;gocier avec eux des d&eacute;lais de r&egrave;glement.</p>', 28, 3),
(167, 'gestion commerciale', '<p>Une bonne gestion d''entreprise passe ind&eacute;niablement par une bonne gestion commerciale. En effet, votre facturation, vos cr&eacute;ances clients sont des donn&eacute;es &agrave; absolument maitriser pour assurer la continuit&eacute; d''exploitation de votre soci&eacute;t&eacute;, il faut savoir relancer vos clients pour ne pas laisser&nbsp;votre chiffre d''affaires en dehors de votre compte bancaire. Le suivi de vos fournisseurs &eacute;galement, essayez de n&eacute;gocier avec eux des d&eacute;lais de r&egrave;glement.</p>', 28, 4),
(168, 'gestion commerciale', '<p>Une bonne gestion d''entreprise passe ind&eacute;niablement par une bonne gestion commerciale. En effet, votre facturation, vos cr&eacute;ances clients sont des donn&eacute;es &agrave; absolument maitriser pour assurer la continuit&eacute; d''exploitation de votre soci&eacute;t&eacute;, il faut savoir relancer vos clients pour ne pas laisser&nbsp;votre chiffre d''affaires en dehors de votre compte bancaire. Le suivi de vos fournisseurs &eacute;galement, essayez de n&eacute;gocier avec eux des d&eacute;lais de r&egrave;glement.</p>', 28, 5),
(169, 'gestion commerciale', '<p>Une bonne gestion d''entreprise passe ind&eacute;niablement par une bonne gestion commerciale. En effet, votre facturation, vos cr&eacute;ances clients sont des donn&eacute;es &agrave; absolument maitriser pour assurer la continuit&eacute; d''exploitation de votre soci&eacute;t&eacute;, il faut savoir relancer vos clients pour ne pas laisser&nbsp;votre chiffre d''affaires en dehors de votre compte bancaire. Le suivi de vos fournisseurs &eacute;galement, essayez de n&eacute;gocier avec eux des d&eacute;lais de r&egrave;glement.</p>', 28, 6),
(170, 'Ressources Humaines', 'fr. Description .Ressources Humaines', 29, 1),
(171, 'Ressources Humaines', 'en. Description .Ressources Humaines', 29, 2),
(172, 'Ressources Humaines', 'mg. Description .Ressources Humaines', 29, 3),
(173, 'Ressources Humaines', 'it. Description .Ressources Humaines', 29, 4),
(174, 'Ressources Humaines', 'es. Description .Ressources Humaines', 29, 5),
(175, 'Ressources Humaines', 'de. Description .Ressources Humaines', 29, 6),
(176, 'Télécommunications', 'fr. Description .Télécommunications', 30, 1),
(177, 'Télécommunications', 'en. Description .Télécommunications', 30, 2),
(178, 'Télécommunications', 'mg. Description .Télécommunications', 30, 3),
(179, 'Télécommunications', 'it. Description .Télécommunications', 30, 4),
(180, 'Télécommunications', 'es. Description .Télécommunications', 30, 5),
(181, 'Télécommunications', 'de. Description .Télécommunications', 30, 6);

-- --------------------------------------------------------

--
-- Structure de la table `sl_logo`
--

CREATE TABLE `sl_logo` (
  `id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `originalname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `current_logo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `sl_logo`
--

INSERT INTO `sl_logo` (`id`, `school_id`, `name`, `path`, `originalname`, `current_logo`) VALUES
(1, 1, 'cpi.jpg', '8f99bc1ca7ce09a2eac48c42c26f3aaf2dd550af.jpeg', 'cpi.jpg', 0),
(2, 3, 'ac.jpg', '0093de9797335d13f2f537d038ef6c78c9e27f94.jpeg', 'ac.jpg', 0),
(3, 4, 'aeon.jpg', 'e74aa108ca1f1649d23065434dc7adf05dc4b7b0.jpeg', 'aeon.jpg', 0),
(4, 2, 'adiva.jpg', '43b871cfc5a93eaac5d1a56a97d0da3e3324abe6.jpeg', 'adiva.jpg', 0),
(5, 3, 'dangel.jpg', 'faf468ac39f70833d3a37dfc9938aa7883465d06.jpeg', 'dangel.jpg', 0),
(6, 4, 'espa.png', 'cf552c4a3d94a4b40fe45413004f979a4100b9b4.png', 'espa.png', 0),
(7, 1, 'ispm-logo.png', '2a356c87e7e4f41f39e937db76338c8afa8c11de.png', 'ispm-logo.png', 0),
(8, 2, 'logo_univ_antananarivo_mg.gif', 'c3b0cd69711b9db9588ccb502772c4c1eab0aab1.gif', 'logo_univ_antananarivo_mg.gif', 0),
(9, 5, 'kahena.jpg', '601aa92382cebadb24bcd836ef80b2f99065c321.jpeg', 'kahena.jpg', 0),
(10, 1, 'austin.jpg', '06cf4febad4287959a7ff06e5811e7494317514e.jpeg', 'austin.jpg', 0),
(11, 1, 'lamborghini.jpg', '8e1d875dde4e0e772de4e5013b80d3dfaed8ea8e.jpeg', 'lamborghini.jpg', 0),
(12, 6, 'dkw-auto-union.jpg', '9318da304629a41a84dbd7aaf9ed1b32990f0d40.jpeg', 'dkw-auto-union.jpg', 0),
(13, 6, 'logo-ucm.jpg', '935f658a557100f08592e10fef894061d0d0c1f9.jpeg', 'logo-ucm.jpg', 0),
(14, 3, 'royal-enfield.jpg', 'fb8d20430f09b4af35884034476dc9cc211def8f.jpeg', 'royal-enfield.jpg', 0),
(15, 3, 'pgo.jpg', '96d247fc390036c9decca94ce37632d0e5f1b16a.jpeg', 'pgo.jpg', 0),
(16, 2, 'logo_univ.jpg', '68df8f12fc61931f1385869cf47e8996cad4961d.jpeg', 'logo_univ.jpg', 0),
(17, 4, 'logo-poly.jpg', '1040576480c28e6010bbd7c6b2dcd2d547b1f466.jpeg', 'logo-poly.jpg', 0),
(18, 3, 'pgo.jpg', '772d23df34c9f37ed92cfe31a39cff91c0acfe70.jpeg', 'pgo.jpg', 0),
(19, 1, 'lam.jpg', '04ad6795fb334dac6d762fe82b6e8a3bcbc59bd5.jpeg', 'lam.jpg', 0),
(20, 6, 'ucm2.jpg', '4cb70b55dc0be94efd692b390c32a4cc0d9fd67e.jpeg', 'ucm2.jpg', 1),
(21, 7, 'ESCAME.jpg', '185f2ab650151736444e7f551ce4863a51a1fb5d.jpeg', 'ESCAME.jpg', 0),
(22, 8, 'gsilogo.jpg', '4182fbffdb7fb86646bccf24967b0464d833cb88.jpeg', 'gsilogo.jpg', 1),
(23, 3, 'asjalogo.jpg', 'fe52aba671166ffe7e4a4447d56913a54b1545dc.jpeg', 'asjalogo.jpg', 1),
(24, 4, 'logopoly2.jpg', '0367ec484508fd138a9ff042f8c5b145644647d4.jpeg', 'logopoly2.jpg', 1),
(25, 7, 'ESCAME.jpg', '9510c23bd1132ad4f2d01fce0e90e01c52ec0884.jpeg', 'ESCAME.jpg', 1),
(26, 2, 'ist.jpg', 'd57b82a25450aebe40733a203bb8b5e8c1f07748.jpeg', 'ist.jpg', 1),
(27, 1, 'inscaelogo.jpg', '86d3bcc307457219b48d179809e1d9bd7a072372.jpeg', 'inscaelogo.jpg', 0),
(28, 5, 'eni.jpg', '8bd30cc8baa84f9b0eeb700e8bf3b450bd20f6ad.jpeg', 'eni.jpg', 1),
(29, 1, 'inscae.png', '519565aeeda6eb045cf98593e8bcaa65b1cde750.png', 'inscae.png', 0),
(30, 1, 'inscaelogo.jpg', '6a1876cf467f0d60acb897466b8e604d5801e9e7.jpeg', 'inscaelogo.jpg', 1),
(31, 9, 'benelli.jpg', '47e9ee52f7f6bf58c6a8c42db9c3a5dc4c2e3cde.jpeg', 'benelli.jpg', 0),
(32, 9, 'peugeot.jpg', '116eb252ce4a156db343d32c477e07346c100b6d.jpeg', 'peugeot.jpg', 0),
(33, 9, 'aeon.jpg', 'd73e1b65cf10ca60363db99b1c65d77a93e97ef9.jpeg', 'aeon.jpg', 0),
(34, 9, 'land3.jpg', 'e70c4364d62dc8b9c40691d42fbf257eaa356567.jpeg', 'land3.jpg', 0),
(35, 9, 'peugeot.jpg', '009463cb9c6977a786938e55ec5de369ff524283.jpeg', 'peugeot.jpg', 0),
(36, 9, 'graduate-150374_640.png', '4f6455c9d11da0f4c2535c2d446454905210dfaf.png', 'graduate-150374_640.png', 0),
(37, 10, 'land9.jpg', '11aba6719e4f6616927c33b44d423670ad3f52b7.jpeg', 'land9.jpg', 0),
(38, 11, 'lancia.jpg', 'a6303d0ffd609a53e524e208b44a47e2218a6456.jpeg', 'lancia.jpg', 0),
(39, 17, 'inspnmad.png', '18ef052aac457cf9df320813cba35475170c1262.png', 'inspnmad.png', 1),
(40, 24, 'land98.JPG', 'ebd29966ed2dc5d3cfadcbd810daae3f9001a7fc.jpeg', 'land98.JPG', 0),
(41, 9, 'CNTEMAD.jpg', '4ef1b48469b4a19e4b9d63718622f4787357f0f3.jpeg', 'CNTEMAD.jpg', 1),
(42, 16, 'UPRIM.jpg', '9625195b553b1259444807f802e58fc3ddc68e44.jpeg', 'UPRIM.jpg', 1),
(43, 18, 'aceem.png', 'bfa97f27cb1620dcbc36572130e6c138c9865fe0.png', 'aceem.png', 1),
(44, 19, 'IFT.jpg', '802daf8dc9244d9a94dcc2c3792252ab4e07e223.jpeg', 'IFT.jpg', 1),
(45, 20, 'misa.png', '5a38c99f641e8f83279ed01985716f653373603f.png', 'misa.png', 1),
(46, 21, 'ESM.jpg', 'a8b00878b66895b82e302a6bd540091fa5d078c9.jpeg', 'ESM.jpg', 1),
(47, 22, 'ESSCA.png', '37172f1e09caca9faea4104db25ff9f85d5a9087.png', 'ESSCA.png', 1),
(48, 23, 'ISCAM.jpg', 'a98d586a4619c44fe5ee93e00be44f60b94feab0.jpeg', 'ISCAM.jpg', 1),
(49, 24, 'EEFPS CONDORCET.jpg', 'f2e4df893a4889b33bbc9f4d2c65dd064b752c25.jpeg', 'EEFPS CONDORCET.jpg', 1),
(50, 25, 'ESPM.jpg', '8686b0299bc88f0d3318265ee8d33db4a810ccce.jpeg', 'ESPM.jpg', 1),
(51, 26, 'logo-esmia-court.png', 'f81c24bec5cb279f502e5c0f719b9976df12cafa.png', 'logo-esmia-court.png', 1),
(52, 27, 'IEP-madagascar-logo.jpg', '4d849d3707fbad3074e8d86bf01f71bb8bda585f.jpeg', 'IEP-madagascar-logo.jpg', 1),
(53, 28, 'logo-inth.jpg', '42b142fe3ab3096bf7ac220762ae9eaf23be9f1d.jpeg', 'logo-inth.jpg', 1),
(54, 29, 'ispmlogo.jpg', 'd33f4b63521dab491c9345ff51c9216ad1888697.jpeg', 'ispmlogo.jpg', 1),
(55, 13, 'enslogo.jpg', 'c6fcd0e6b0b51e2996eaa1177f57f47ff5c6b090.jpeg', 'enslogo.jpg', 1),
(56, 15, 'medecine.png', '2a9e98d61cc82d15a26ca0de3ebbd805dba457d7.png', 'medecine.png', 1),
(57, 14, 'sciences.png', '77bab17ae48308add86dddb684b6d5fe08c2b4b8.png', 'sciences.png', 1),
(58, 12, 'lettres.jpg', 'af85178d1c3091315068d4f2848c39904c113984.jpeg', 'lettres.jpg', 1),
(59, 33, '1.JPG', '128673be9f9e84cdd3857eda4cc183e840367056.jpeg', '1.JPG', 0),
(60, 33, 'ico_accueil_big.png', 'edfc949f71acaa49246f16d8c33e91fcd0f45c9c.png', 'ico_accueil_big.png', 0),
(61, 31, 'vatel.png', '8337ef4592bb2efd0a0d39a241feb0b51918ea57.png', 'vatel.png', 1),
(62, 33, 'ifagi-menu.png', '194fa790d240fa575f0b9031710b263cec7b19a7.png', 'ifagi-menu.png', 1),
(63, 34, 'CFRH.jpg', '42ec802ef7c98a0f5f30f174ff0591928de0bc27.jpeg', 'CFRH.jpg', 1),
(64, 35, 'ISM ADVANCEA.jpg', '75abb1ffdffe244e0e7c328bba7df590393df210.jpeg', 'ISM ADVANCEA.jpg', 1),
(65, 36, 'EUROI.jpg', '16cebc8a6baa98063d704ca0b51c651808ec9fff.jpeg', 'EUROI.jpg', 1),
(66, 37, 'EMEDIA.jpg', 'dcb6f3942476e59a15b4212d1003bbfe515dd8c5.jpeg', 'EMEDIA.jpg', 1),
(67, 10, 'logo_univ.jpg', 'e762844414d63c7ba37de1cf81d66135d54ef95d.jpeg', 'logo_univ.jpg', 1),
(68, 11, 'logo_essa.png', '493646fcd241f652ee8441c2f6dfa8350271a5cd.png', 'logo_essa.png', 0),
(69, 11, 'essalogo.jpg', 'ba97558792ae9bd2e3c72dfd30989cce13a51b21.jpeg', 'essalogo.jpg', 1),
(70, 38, 'ifproglogo.jpg', '0421a15a548b2db40ca32cd4074096a284361b67.jpeg', 'ifproglogo.jpg', 1),
(71, 40, 'itulogo.jpg', '1d011e5bbd021cbbf12cca4ef2d2e2abe5305788.jpeg', 'itulogo.jpg', 1),
(72, 39, 'issmilogo.jpg', 'b356ed009e2a294fb8447a453eec256ecb453c6a.jpeg', 'issmilogo.jpg', 1),
(73, 41, 'imgamlogo.jpg', '056c6ca7501328ba13f7586809ed3ee4021d50a1.jpeg', 'imgamlogo.jpg', 1),
(74, 43, 'ismateclogo.jpg', 'e1af4261bf4dc389398113409a856aa730564397.jpeg', 'ismateclogo.jpg', 1),
(75, 44, 'isp-mdf.jpg', 'b193ec2e02299767643e565fae651b7218f9d13d.jpeg', 'isp-mdf.jpg', 1),
(76, 45, 'enmglogo.jpg', '272bdb9598285740b49427281e35d472455272a3.jpeg', 'enmglogo.jpg', 1),
(77, 46, 'oiologo.png', '8630277ee5b914fad7a3825ad008458b77a8d834.png', 'oiologo.png', 0),
(78, 46, 'oiologo2.png', 'e909bf06a8599a024a44edcf894cc65bbf5dd6d3.png', 'oiologo2.png', 1),
(79, 47, 'isstparamedlogo.jpg', '25555501601ead19767f7e2a2f4996a447c5f3bf.jpeg', 'isstparamedlogo.jpg', 1);

-- --------------------------------------------------------

--
-- Structure de la table `sl_school`
--

CREATE TABLE `sl_school` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `short_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `published` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `sl_school`
--

INSERT INTO `sl_school` (`id`, `name`, `short_name`, `slug`, `published`) VALUES
(1, 'Institut national des sciences comptables et de l''administration d''entreprises', 'INSCAE', 'inscae', 1),
(2, 'Institut Supérieur de Technologie', 'IST', 'ist', 1),
(3, 'Athénée Saint Joseph Antsirabe', 'ASJA', 'asja', 1),
(4, 'Ecole Supérieure Polytechnique de d''Antananarivo', 'ESPA', 'espa', 1),
(5, 'Ecole Nationale de L''Informatique', 'ENI', 'ecole-nationale-de-l-informatique', 1),
(6, 'Université Catholique de Madagascar', 'UCM', 'ist-2', 1),
(7, 'Ecole Supérieure en Comptabilité d''Administration et de Management d''Entreprise', 'ESCAME', 'escame', 1),
(8, 'GSI Université', 'GSI', 'gsi-universite', 1),
(9, 'Centre National du Télé-Enseignement de Madagascar', 'CNTEMAD', 'centre-national-du-tele-enseignement-de-madagascar', 1),
(10, 'Faculté de Droit, d’Economie, de Gestion et de Sociologie', 'DEGS', 'degs', 1),
(11, 'Ecole Supérieure des Sciences Agronomiques', 'ESSA', 'ecole-superieure-des-sciences-agronomiques', 1),
(12, 'Faculté des Lettres et Sciences Humaines', 'LETTRES', 'faculte-des-lettres-et-sciences-humaines', 1),
(13, 'Ecole Normale Supérieure', 'ENS', 'ecole-normale-superieure', 1),
(14, 'Faculté des Sciences', 'SCIENCES', 'faculte-des-sciences', 1),
(15, 'Faculté de Médecine', 'MEDECINE', 'faculte-de-medecine', 1),
(16, 'Universite Privée de Madagascar', 'UPRIM', 'universite-privee-de-madagascar', 1),
(17, 'Institut Supérieur des Paramédicaux Novateurs de Madagascar', 'InSPNMad', 'institut-superieur-des-paramedicaux-novateurs-de-madagascar', 1),
(18, 'Université ACEEM', 'ACEEM', 'universite-aceem', 1),
(19, 'Institut de Formation Technique', 'IFT', 'institut-de-formation-technique', 1),
(20, 'Mathématiques, Informatique et Statistique Appliquées', 'MISA', 'mathematiques-informatique-et-statistique-appliquees', 1),
(21, 'Ecole Supérieure de Multimédia Antananarivo', 'ESM', 'ecole-superieure-de-multimedia-antananarivo', 1),
(22, 'Ecole Supérieure Sacré-Coeur Antanimena', 'ESSCA', 'ecole-superieure-sacre-coeur-antanimena', 1),
(23, 'Institut Supérieur de la Communication, des Affaires et du Management', 'ISCAM', 'institut-superieur-de-la-communication-des-affaires-et-du-management', 1),
(24, 'Etablissement d''Enseignement et de Formation Professionnelle Superieure', 'EEFPS CONDORCET', 'etablissement-d-enseignement-et-de-formation-professionnelle-superieure', 1),
(25, 'Ecole Supérieure Paramédical de Madagascar', 'ESPM', 'ecole-superieure-paramedical-de-madagascar', 1),
(26, 'Ecole Supérieure de Management et d’Informatique Appliquée', 'ESMIA', 'ecole-superieure-de-management-et-d-rsquo-informatique-appliquee', 1),
(27, 'Institut d''etudes Politiques de Madagascar', 'IEP', 'institut-d-etudes-politiques-de-madagascar', 1),
(28, 'Institut National de Tourisme et d''Hôtellerie', 'INTH', 'institut-national-de-tourisme-et-d-hotellerie', 1),
(29, 'Institut Supérieur Polytechnique de Madagascar', 'ISPM', 'institut-superieur-polytechnique-de-madagascar', 1),
(30, 'Ecole supérieure de Droit et science politique', 'ESD', 'ecole-superieure-de-droit-et-science-politique', 1),
(31, 'Ecole internationale d''hôtellerie et de management VATEL', 'VATEL', 'ecole-internationale-d-hotellerie-et-de-management-vatel', 1),
(32, 'Institut Supérieur de Formation Paramédicale et Science-social.', 'ISFPS Leader', 'isfps-leader', 1),
(33, 'Institut de Formation en Agronomie, Gemmologie, Industrialisation & 7ème Art', 'IFAGI & 7e Art', 'ifagi-7e-art', 1),
(34, 'Centre de Formation des Ressources Humaines', 'CFRH', 'centre-de-formation-des-ressources-humaines', 1),
(35, 'Institut Universitaire Polytechnique de Madagascar', 'ISM', 'ism', 1),
(36, 'Espace Universitaire Regional de l''Ocean Indien', 'EUROI', 'espace-universitaire-regional-de-l-ocean-indien', 1),
(37, 'Ecole Supérieure de la Nouvelle Technologie du multimédia et de la publicité', 'E-media', 'e-media', 1),
(38, 'Institut de Formation PRofessionnelle Garantie Madagascar', 'IFPROG', 'ifprog', 1),
(39, 'Institut Superieur Saint Michel Itaosy', 'ISSMI', 'issmi', 1),
(40, 'IT University', 'ITU', 'it-university', 1),
(41, 'Institut de Management des Arts et Metiers', 'IMGAM', 'imgam', 1),
(43, 'Institut des Sciences Médicales, de l’Administration et de Technologie', 'ISMATEC', 'ismatec', 1),
(44, 'Institut Supérieur Prive Madagascar Développement Formation', 'ISP-MDF', 'isp-mdf', 1),
(45, 'Ecole Nationale de la Magistrature et des Greffes', 'ENMG', 'enmg', 1),
(46, 'Oio School', 'OIOS', 'oio', 1),
(47, 'Institut Superieur des Sciences Technologiques', 'ISST', 'institut-superieur-des-sciences-technologiques', 1);

-- --------------------------------------------------------

--
-- Structure de la table `sl_school_admin`
--

CREATE TABLE `sl_school_admin` (
  `id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `sl_school_admin`
--

INSERT INTO `sl_school_admin` (`id`, `school_id`, `user_id`, `date`, `active`) VALUES
(1, 1, 1, '2017-02-06 07:24:06', 0),
(2, 1, 2, '2017-02-06 07:24:06', 0),
(3, 9, 2, '2017-04-21 00:00:00', 1),
(4, 9, 3, '2017-04-20 00:00:00', 1),
(5, 1, 3, '2017-04-26 07:48:16', 1),
(6, 1, 6, '2017-04-26 07:56:35', 0),
(7, 1, 8, '2017-04-26 07:57:01', 0),
(8, 1, 11, '2017-04-26 08:21:15', 0),
(9, 1, 13, '2017-04-26 08:21:30', 0),
(10, 1, 4, '2017-04-26 08:26:59', 0),
(11, 1, 9, '2017-04-26 08:37:25', 0),
(12, 1, 5, '2017-04-26 08:50:21', 1),
(13, 2, 7, '2017-04-26 08:50:47', 0),
(14, 8, 9, '2017-04-26 08:56:33', 0),
(15, 8, 10, '2017-04-26 08:56:38', 0),
(16, 8, 12, '2017-04-26 08:56:43', 0),
(17, 8, 2, '2017-04-26 08:58:38', 0),
(18, 8, 6, '2017-04-26 08:59:54', 1),
(19, 5, 1, '2017-04-27 08:01:36', 1),
(20, 8, 1, '2017-04-27 08:02:03', 1),
(21, 6, 1, '2017-04-27 08:07:52', 1),
(22, 6, 2, '2017-04-27 08:20:42', 0),
(23, 6, 4, '2017-04-27 08:20:49', 0),
(24, 4, 1, '2017-04-27 15:42:21', 1),
(25, 4, 2, '2017-04-27 15:56:57', 1),
(26, 2, 3, '2017-04-28 14:11:49', 0),
(27, 2, 4, '2017-05-15 07:41:31', 1),
(28, 2, 2, '2017-05-15 07:41:53', 0),
(29, 3, 1, '2017-05-17 07:49:49', 1),
(30, 1, 7, '2017-06-12 13:07:21', 1),
(31, 18, 2, '2017-06-27 07:24:02', 1),
(32, 46, 2, '2017-06-30 09:01:27', 1);

-- --------------------------------------------------------

--
-- Structure de la table `sl_school_contact`
--

CREATE TABLE `sl_school_contact` (
  `id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `Address` longtext COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `longitude` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `latitude` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `showmap` tinyint(1) NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `sl_school_contact`
--

INSERT INTO `sl_school_contact` (`id`, `school_id`, `Address`, `phone`, `website`, `longitude`, `latitude`, `showmap`, `email`) VALUES
(1, 3, 'Université ASJA  (Campus situé à Tombontsoa, à 7km au nord d’Antsirabe sur la RN7)  BP 287 – 00110 Antsirabe – Madagascar', '+261 (0)20 44 483 19 / +261 (0)20 44 483 20', 'http://www.univ-asja.net', '-18.888358', '47.532310', 1, 'asja@moov.mg'),
(3, 13, 'sapien, vel cursus le', '+33 121 45 78', 'www.sitekui.com', '45', '-21.32', 1, ''),
(4, 29, 'Antsobolo, Antananarivo, Madagascar', '+261 33 12 171 60', 'www.ispm-edu.com', '-18.915916', '47.567034', 1, ''),
(5, 1, 'Maison des produits 67 Ha BP 946 101 Tananarive Madagascar', '(+261) 20 22 660 65/ 22 660 66', 'http://www.inscae.mg/', '', '', 1, 'inscae@mail.mail'),
(6, 1, 'Nunc ultricies ac arcu vitae elementum', '+261 05 21 541 21', 'www.inscae.mg', '36', '12', 1, ''),
(7, 4, 'Lorem ipsum dolor et sit amet consectus', '+261 33 985 65', 'www.espa.com', '56', '89', 1, 'espaofficial@espa.com');

-- --------------------------------------------------------

--
-- Structure de la table `sl_school_contact_translate`
--

CREATE TABLE `sl_school_contact_translate` (
  `id` int(11) NOT NULL,
  `school_contact_id` int(11) NOT NULL,
  `locale_id` int(11) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `sl_school_contact_translate`
--

INSERT INTO `sl_school_contact_translate` (`id`, `school_contact_id`, `locale_id`, `description`) VALUES
(1, 1, 1, 'L’ASJA, actuellement, après s’être bien préparée est décidée, à la sortie des textes officiels du MESUPRES, à demander l’habilitation de ses offres de formation dans le cadre du système LMD, et se prépare également à postuler sa candidature en vue de la reconnaissance à l’accréditation ultérieurement.'),
(2, 1, 2, 'L’ASJA, actuellement, après s’être bien préparée est décidée, à la sortie des textes officiels du MESUPRES, à demander l’habilitation de ses offres de formation dans le cadre du système LMD, et se prépare également à postuler sa candidature en vue de la reconnaissance à l’accréditation ultérieurement.'),
(4, 3, 1, 'Lorem ipsum dolor et sit amet concetus iris actum vienasmipum'),
(5, 4, 1, 'D''après le Shangaï ranking of Universities, ISPM est classé parmi les dix meilleures Universités de Madagascar (Top-10) (parmi les 140 universités publiques et privées).'),
(6, 4, 2, 'D''après le Shangaï ranking of Universities, ISPM est classé parmi les dix meilleures Universités de Madagascar (Top-10) (parmi les 140 universités publiques et privées).'),
(7, 4, 3, 'D''après le Shangaï ranking of Universities, ISPM est classé parmi les dix meilleures Universités de Madagascar (Top-10) (parmi les 140 universités publiques et privées).'),
(8, 4, 4, 'D''après le Shangaï ranking of Universities, ISPM est classé parmi les dix meilleures Universités de Madagascar (Top-10) (parmi les 140 universités publiques et privées).'),
(9, 4, 5, 'D''après le Shangaï ranking of Universities, ISPM est classé parmi les dix meilleures Universités de Madagascar (Top-10) (parmi les 140 universités publiques et privées).'),
(10, 4, 6, 'D''après le Shangaï ranking of Universities, ISPM est classé parmi les dix meilleures Universités de Madagascar (Top-10) (parmi les 140 universités publiques et privées).'),
(11, 5, 1, 'Excogitatum est super his, ut homines quidam ignoti, vilitate ipsa parum cavendi ad colligendos rumores per Antiochiae latera cuncta destinarentur relaturi quae audirent. hi peragranter et dissimulanter honoratorum circulis adsistendo pervadendoque divites domus egentium habitu quicquid noscere poterant vel audire latenter intromissi per posticas in regiam nuntiabant, id observantes conspiratione concordi'),
(12, 5, 2, 'Excogitatum est super his, ut homines quidam ignoti, vilitate ipsa parum cavendi ad colligendos rumores per Antiochiae latera cuncta destinarentur relaturi quae audirent. hi peragranter et dissimulanter honoratorum circulis adsistendo pervadendoque divites domus egentium habitu quicquid noscere poterant vel audire latenter intromissi per posticas in regiam nuntiabant, id observantes conspiratione concordi'),
(13, 1, 3, 'L’ASJA, actuellement, après s’être bien préparée est décidée, à la sortie des textes officiels du MESUPRES, à demander l’habilitation de ses offres de formation dans le cadre du système LMD, et se prépare également à postuler sa candidature en vue de la reconnaissance à l’accréditation ultérieurement.'),
(14, 1, 4, 'L’ASJA, actuellement, après s’être bien préparée est décidée, à la sortie des textes officiels du MESUPRES, à demander l’habilitation de ses offres de formation dans le cadre du système LMD, et se prépare également à postuler sa candidature en vue de la reconnaissance à l’accréditation ultérieurement.'),
(15, 1, 5, 'L’ASJA, actuellement, après s’être bien préparée est décidée, à la sortie des textes officiels du MESUPRES, à demander l’habilitation de ses offres de formation dans le cadre du système LMD, et se prépare également à postuler sa candidature en vue de la reconnaissance à l’accréditation ultérieurement.'),
(16, 1, 6, 'L’ASJA, actuellement, après s’être bien préparée est décidée, à la sortie des textes officiels du MESUPRES, à demander l’habilitation de ses offres de formation dans le cadre du système LMD, et se prépare également à postuler sa candidature en vue de la reconnaissance à l’accréditation ultérieurement.');

-- --------------------------------------------------------

--
-- Structure de la table `sl_school_of_the_day`
--

CREATE TABLE `sl_school_of_the_day` (
  `id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `current` tinyint(1) NOT NULL,
  `day` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `sl_school_of_the_day`
--

INSERT INTO `sl_school_of_the_day` (`id`, `school_id`, `date`, `current`, `day`) VALUES
(1, 2, '2017-06-22 00:00:00', 0, '0000-00-00'),
(2, 3, '2017-06-23 00:00:00', 0, '0000-00-00'),
(3, 5, '2017-06-24 00:00:00', 0, '2017-06-23'),
(7, 25, '2017-06-23 09:13:02', 1, '2017-06-23'),
(8, 6, '2017-06-27 06:52:59', 1, '2017-06-27'),
(9, 34, '2017-06-28 07:28:30', 0, '2017-06-28'),
(10, 25, '2017-06-28 19:41:51', 1, '2017-06-28'),
(11, 43, '2017-06-29 10:49:03', 1, '2017-06-29'),
(12, 39, '2017-06-30 07:35:51', 0, '2017-06-30'),
(13, 15, '2017-06-30 08:33:43', 0, '2017-06-30'),
(14, 46, '2017-06-30 08:34:10', 1, '2017-06-30');

-- --------------------------------------------------------

--
-- Structure de la table `sl_school_subscription`
--

CREATE TABLE `sl_school_subscription` (
  `id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `sl_school_subscription`
--

INSERT INTO `sl_school_subscription` (`id`, `school_id`, `user_id`, `date`, `active`) VALUES
(1, 1, 1, '2017-04-28 00:00:00', 1),
(2, 1, 3, '2017-04-28 00:59:00', 0),
(3, 2, 3, '2017-04-28 14:14:34', 1),
(4, 1, 4, '2017-05-02 07:04:20', 1),
(5, 4, 4, '2017-05-02 07:22:08', 1),
(6, 3, 4, '2017-05-02 07:51:24', 1),
(7, 3, 2, '2017-05-02 07:52:22', 1),
(8, 5, 1, '2017-05-02 11:00:02', 1),
(9, 2, 2, '2017-05-02 11:30:17', 1),
(10, 8, 2, '2017-05-03 07:05:46', 0),
(11, 4, 2, '2017-05-03 16:12:43', 1),
(12, 2, 6, '2017-05-04 07:34:38', 1),
(13, 9, 1, '2017-05-04 12:13:09', 1),
(14, 12, 3, '2017-05-08 12:00:25', 1),
(15, 1, 2, '2017-05-18 08:43:42', 0),
(16, 5, 11, '2017-05-22 11:37:57', 1),
(17, 7, 11, '2017-05-22 13:03:48', 1),
(18, 24, 1, '2017-05-23 11:20:53', 0),
(19, 25, 1, '2017-05-23 14:03:15', 1),
(20, 17, 1, '2017-05-23 14:12:17', 1),
(21, 11, 1, '2017-05-23 15:24:12', 1),
(22, 9, 4, '2017-05-24 09:03:57', 0),
(23, 11, 2, '2017-05-26 12:31:41', 1),
(24, 14, 2, '2017-05-31 08:44:15', 1),
(25, 6, 2, '2017-06-15 14:38:36', 1),
(26, 33, 2, '2017-06-27 09:00:39', 1);

-- --------------------------------------------------------

--
-- Structure de la table `sl_school_translate`
--

CREATE TABLE `sl_school_translate` (
  `id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `locale_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `short_description` longtext COLLATE utf8_unicode_ci,
  `description` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `sl_school_translate`
--

INSERT INTO `sl_school_translate` (`id`, `school_id`, `locale_id`, `name`, `short_description`, `description`) VALUES
(2, 1, 2, 'en. name . Institut de Commerce et Management d\\''Antananarivo', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc dapibus scelerisque felis, quis pretium metus dignissim id. Nulla sed cursus felis, nec egestas felis. Donec convallis sapien nec sem efficitur interdum. Mauris vel magna quis ipsum maximus feugiat nec eget mi. Fusce imperdiet auctor nibh, quis gravida mi dictum ut. Sed elit dolor, cursus sed augue viverra, tempor aliquet quam. Morbi diam lectus, porta eget turpis in, faucibus dictum ipsum.', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc dapibus scelerisque felis, quis pretium metus dignissim id. Nulla sed cursus felis, nec egestas felis. Donec convallis sapien nec sem efficitur interdum. Mauris vel magna quis ipsum maximus feugiat nec eget mi. Fusce imperdiet auctor nibh, quis gravida mi dictum ut. Sed elit dolor, cursus sed augue viverra, tempor aliquet quam. Morbi diam lectus, porta eget turpis in, faucibus dictum ipsum. Curabitur vitae nibh semper, hendrerit mauris vel, pulvinar eros. Morbi interdum lacus ac sodales elementum. Morbi fermentum sapien a porttitor accumsan. In vehicula tempor elit, eu maximus urna hendrerit blandit. Etiam viverra ante vel fermentum vehicula.</p>\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc dapibus scelerisque felis, quis pretium metus dignissim id. Nulla sed cursus felis, nec egestas felis. Donec convallis sapien nec sem efficitur interdum. Mauris vel magna quis ipsum maximus feugiat nec eget mi. Fusce imperdiet auctor nibh, quis gravida mi dictum ut. Sed elit dolor, cursus sed augue viverra, tempor aliquet quam. Morbi diam lectus, porta eget turpis in, faucibus dictum ipsum. Curabitur vitae nibh semper, hendrerit mauris vel, pulvinar eros. Morbi interdum lacus ac sodales elementum. Morbi fermentum sapien a porttitor accumsan. In vehicula tempor elit, eu maximus urna hendrerit blandit. Etiam viverra ante vel fermentum vehicula.</p>'),
(3, 1, 3, 'mg. name . Institut de Commerce et Management d\\''Antananarivo', 'mg. courte description . Institut de Commerce et Management d\\''Antananarivo', '<p>mg. description .</p> <p>desc Institut de Commerce et Management d''Antananarivo</p>'),
(4, 1, 4, 'it. name . Institut de Commerce et Management d\\''Antananarivo', 'it. courte description . Institut de Commerce et Management d\\''Antananarivo', '<p>it. description .</p> <p>desc Institut de Commerce et Management d''Antananarivo</p>'),
(5, 1, 5, 'es. name . Institut de Commerce et Management d\\''Antananarivo', 'es. courte description . Institut de Commerce et Management d\\''Antananarivo', '<p>es. description .</p>\n<p>desc Institut de Commerce et Management d''Antananarivo</p>'),
(6, 1, 6, 'de. name . Institut de Commerce et Management d\\''Antananarivo', 'de. courte description . Institut de Commerce et Management d\\''Antananarivo', '<p>de. description .</p> <p>desc Institut de Commerce et Management d''Antananarivo</p>'),
(7, 2, 1, 'Institut Supérieure de Technologie', 'L’IST d’Antananarivo offre trois types de formation : Les formations de cycle court de type alternatif (Bacc + 2 / Bacc + 3), Les formations d’Ingénieur de grade Master, Les formations de type hybride : Formation Ouverte et A Distance (FOAD) diplômante - Formation présentielle de type initial et de type continu diplômante et qualifiante', '<p>L&rsquo;Institut sup&eacute;rieur de Technologie d&rsquo;Antananarivo (IST-T) est un &eacute;tablissement d&rsquo;enseignement sup&eacute;rieur et de recherche rattach&eacute; au Minist&egrave;re en charge de ce domaine.</p>\n<p>A la fois centre d&rsquo;enseignement sup&eacute;rieur et de recherche et partenaire des professionnels, l&rsquo;IST-T &oelig;uvre avec succ&egrave;s sur trois actions scientifiques d&eacute;finies dans sa strat&eacute;gie &agrave; l&rsquo;horizon 2020&nbsp;:</p>\n<ul>\n<li>Transfert de connaissances&nbsp;: le respect et la r&eacute;f&eacute;rence au programme de l&rsquo;uniformisation du syst&egrave;me d&rsquo;enseignement sup&eacute;rieur et de recherche &agrave; Madagascar&nbsp;;</li>\n<li>Satisfaire au mieux le besoin du pays sans pour autant laisser de c&ocirc;t&eacute; les enjeux mondiaux&nbsp;: la strat&eacute;gie de promotion de la formation de qualit&eacute; et &eacute;volutive&nbsp;;</li>\n<li>Repousser d&rsquo;avantage les limites du professionnalisme&nbsp;: le d&eacute;veloppement continuel de relation avec le patronat, utilisateur des produits pour maintenir l&rsquo;&eacute;quilibre formation-emploi et le partenariat international.</li>\n</ul>\n<p style="text-align: justify;">&nbsp;A l&rsquo;instar de ses premiers vingt cinq ans, l&rsquo;IST-T compte sur les valeurs qui ont forg&eacute; sa cr&eacute;dibilit&eacute; et sa r&eacute;putation&nbsp;: technicit&eacute; et comp&eacute;tence, discipline et rigueur, bonnes relations humaines.</p>\n<p>S&rsquo;affranchissant des fronti&egrave;res g&eacute;ographiques gr&acirc;ce &agrave; la formation ouverte et &agrave; distance, notre Institut constitue un v&eacute;ritable outil de d&eacute;veloppement de talents dont d&eacute;pend l&rsquo;&eacute;conomie de notre pays.</p>\n<ul>\n<ul>Connu sur l&rsquo;ensemble du territoire et ouvert sur le monde gr&acirc;ce &agrave; un syst&egrave;me de formation et de recherche incluant la p&eacute;dagogie universitaire et le num&eacute;rique &eacute;ducatif&nbsp;;</ul>\n</ul>\n<ul>\n<ul>L&rsquo;IST-T continue &agrave; conna&icirc;tre une remarquable &eacute;volution &agrave; travers les formations correspondant&nbsp;&agrave; un ensemble des nombreuses activit&eacute;s portant sur le d&eacute;veloppement et l&rsquo;&eacute;mergence de notre pays.</ul>\n</ul>\n<p style="text-align: justify;">Aussi, avec l&rsquo;ensemble du corps enseignant et du personnel administratif et technique, avec le concours des partenaires professionnels et sous l&rsquo;&eacute;gide du Conseil d&rsquo;Administration de l&rsquo;Institut, nous engageons-nous avec d&eacute;termination et d&eacute;vouement &agrave; la formation, &agrave; relever le double d&eacute;fi qui consiste d&rsquo;abord &agrave; am&eacute;liorer la r&eacute;ussite interne qui se situe en ce moment autour de 95 %, et &agrave; am&eacute;liorer par la suite l&rsquo;efficacit&eacute; externe &agrave; travers une meilleure comp&eacute;titivit&eacute; des produits de formation sur le march&eacute; du travail.</p>\n<p>La valeur ajout&eacute;e de l&rsquo;IST-T, la synergie des trois cursus, &agrave; savoir TS, TSS et Ing&eacute;nieur, sont aussi&nbsp;&agrave; l&rsquo;origine de notre ambition &agrave; travailler sur des th&egrave;mes f&eacute;d&eacute;rateurs que sont les infrastructures et l&rsquo;am&eacute;nagement, l&rsquo;entrepreneuriat, le transport et la logistique, la p&eacute;dagogie universitaire et l&rsquo;&eacute;nergie renouvelable.</p>\n<p>En rejoignant l&rsquo;IST-T, vous vous donnez la certitude de d&eacute;velopper vos talents et d&rsquo;acqu&eacute;rir des technicit&eacute;s et des comp&eacute;tences exig&eacute;es sur le march&eacute; de l&rsquo;emploi.</p>\n<p>Nous sommes particuli&egrave;rement fiers de vous offrir une r&eacute;ponse appropri&eacute;e &agrave; vos attentes et un service de qualit&eacute; ayant pour objectif de relever ces d&eacute;fis.</p>\n<p>Ce site permet d&rsquo;avoir un panorama des actions convenues dans notre Plan de D&eacute;veloppement Institutionnel Evolutif 2015 &ndash; 2020, qui vise &agrave; faire de notre Institut un acteur pour le d&eacute;veloppement pragmatique de notre pays.</p>\n<p>Je crois que cette visite virtuelle de l&rsquo;IST-T vous apportera les informations pertinentes que vous recherchez sur notre &eacute;tablissement.</p>'),
(8, 2, 2, 'Institut Supérieure de Technologie', 'L’IST d’Antananarivo offre trois types de formation : Les formations de cycle court de type alternatif (Bacc + 2 / Bacc + 3), Les formations d’Ingénieur de grade Master, Les formations de type hybride : Formation Ouverte et A Distance (FOAD) diplômante - Formation présentielle de type initial et de type continu diplômante et qualifiante', '<p>L&rsquo;Institut sup&eacute;rieur de Technologie d&rsquo;Antananarivo (IST-T) est un &eacute;tablissement d&rsquo;enseignement sup&eacute;rieur et de recherche rattach&eacute; au Minist&egrave;re en charge de ce domaine.</p>\n<p>A la fois centre d&rsquo;enseignement sup&eacute;rieur et de recherche et partenaire des professionnels, l&rsquo;IST-T &oelig;uvre avec succ&egrave;s sur trois actions scientifiques d&eacute;finies dans sa strat&eacute;gie &agrave; l&rsquo;horizon 2020&nbsp;:</p>\n<ul>\n<li>Transfert de connaissances&nbsp;: le respect et la r&eacute;f&eacute;rence au programme de l&rsquo;uniformisation du syst&egrave;me d&rsquo;enseignement sup&eacute;rieur et de recherche &agrave; Madagascar&nbsp;;</li>\n<li>Satisfaire au mieux le besoin du pays sans pour autant laisser de c&ocirc;t&eacute; les enjeux mondiaux&nbsp;: la strat&eacute;gie de promotion de la formation de qualit&eacute; et &eacute;volutive&nbsp;;</li>\n<li>Repousser d&rsquo;avantage les limites du professionnalisme&nbsp;: le d&eacute;veloppement continuel de relation avec le patronat, utilisateur des produits pour maintenir l&rsquo;&eacute;quilibre formation-emploi et le partenariat international.</li>\n</ul>\n<p style="text-align: justify;">&nbsp;A l&rsquo;instar de ses premiers vingt cinq ans, l&rsquo;IST-T compte sur les valeurs qui ont forg&eacute; sa cr&eacute;dibilit&eacute; et sa r&eacute;putation&nbsp;: technicit&eacute; et comp&eacute;tence, discipline et rigueur, bonnes relations humaines.</p>\n<p>S&rsquo;affranchissant des fronti&egrave;res g&eacute;ographiques gr&acirc;ce &agrave; la formation ouverte et &agrave; distance, notre Institut constitue un v&eacute;ritable outil de d&eacute;veloppement de talents dont d&eacute;pend l&rsquo;&eacute;conomie de notre pays.</p>\n<ul>\n<ul>Connu sur l&rsquo;ensemble du territoire et ouvert sur le monde gr&acirc;ce &agrave; un syst&egrave;me de formation et de recherche incluant la p&eacute;dagogie universitaire et le num&eacute;rique &eacute;ducatif&nbsp;;</ul>\n</ul>\n<ul>\n<ul>L&rsquo;IST-T continue &agrave; conna&icirc;tre une remarquable &eacute;volution &agrave; travers les formations correspondant&nbsp;&agrave; un ensemble des nombreuses activit&eacute;s portant sur le d&eacute;veloppement et l&rsquo;&eacute;mergence de notre pays.</ul>\n</ul>\n<p style="text-align: justify;">Aussi, avec l&rsquo;ensemble du corps enseignant et du personnel administratif et technique, avec le concours des partenaires professionnels et sous l&rsquo;&eacute;gide du Conseil d&rsquo;Administration de l&rsquo;Institut, nous engageons-nous avec d&eacute;termination et d&eacute;vouement &agrave; la formation, &agrave; relever le double d&eacute;fi qui consiste d&rsquo;abord &agrave; am&eacute;liorer la r&eacute;ussite interne qui se situe en ce moment autour de 95 %, et &agrave; am&eacute;liorer par la suite l&rsquo;efficacit&eacute; externe &agrave; travers une meilleure comp&eacute;titivit&eacute; des produits de formation sur le march&eacute; du travail.</p>\n<p>La valeur ajout&eacute;e de l&rsquo;IST-T, la synergie des trois cursus, &agrave; savoir TS, TSS et Ing&eacute;nieur, sont aussi&nbsp;&agrave; l&rsquo;origine de notre ambition &agrave; travailler sur des th&egrave;mes f&eacute;d&eacute;rateurs que sont les infrastructures et l&rsquo;am&eacute;nagement, l&rsquo;entrepreneuriat, le transport et la logistique, la p&eacute;dagogie universitaire et l&rsquo;&eacute;nergie renouvelable.</p>\n<p>En rejoignant l&rsquo;IST-T, vous vous donnez la certitude de d&eacute;velopper vos talents et d&rsquo;acqu&eacute;rir des technicit&eacute;s et des comp&eacute;tences exig&eacute;es sur le march&eacute; de l&rsquo;emploi.</p>\n<p>Nous sommes particuli&egrave;rement fiers de vous offrir une r&eacute;ponse appropri&eacute;e &agrave; vos attentes et un service de qualit&eacute; ayant pour objectif de relever ces d&eacute;fis.</p>\n<p>Ce site permet d&rsquo;avoir un panorama des actions convenues dans notre Plan de D&eacute;veloppement Institutionnel Evolutif 2015 &ndash; 2020, qui vise &agrave; faire de notre Institut un acteur pour le d&eacute;veloppement pragmatique de notre pays.</p>\n<p>Je crois que cette visite virtuelle de l&rsquo;IST-T vous apportera les informations pertinentes que vous recherchez sur notre &eacute;tablissement.</p>'),
(9, 2, 3, 'mg. name . Ecole Supérieure de Technologie', 'mg. courte description . Ecole Supérieure de Technologie', '<p>mg. description .</p> <p>desc Ecole Supérieure de Technologie</p>'),
(10, 2, 4, 'it. name . Ecole Supérieure de Technologie', 'it. courte description . Ecole Supérieure de Technologie', '<p>it. description .</p> <p>desc Ecole Supérieure de Technologie</p>'),
(11, 2, 5, 'es. name . Ecole Supérieure de Technologie', 'es. courte description . Ecole Supérieure de Technologie', '<p>es. description .</p> <p>desc Ecole Supérieure de Technologie</p>'),
(12, 2, 6, 'de. name . Ecole Supérieure de Technologie', 'de. courte description . Ecole Supérieure de Technologie', '<p>de. description .</p> <p>desc Ecole Supérieure de Technologie</p>'),
(13, 3, 1, 'Athénée Saint Joseph Antsirabe', 'L’ASJA propose une architecture de ses offres de formation en 2 domaines : Sciences et Technologies (ST) et Sciences de la Société (SSo). Le 1er domaine (ST) comporte 4 mentions ; Sciences agronomiques, Informatique, Sciences de la Terre, Textile et Habillement et le 2ème domaine (SSo), les mentions Economie et Commerce et Droit. Chaque mention doit pouvoir offrir une gamme de formations capable de répondre à la demande croissante de polyvalence et multi-compétence dans les métiers et les fonctions exercées.', '<div id="apDiv2">\n<p align="justify">D&egrave;s son ouverture en 2000, l&rsquo;ASJA a pour vocation d&rsquo;assurer la formation professionnalisante dans divers domaines d&rsquo;activit&eacute;s r&eacute;pondant aux besoins socio-&eacute;conomiques du pays. Pour satisfaire &agrave; ces derniers, les offres de formation ont pris en compte les r&eacute;alit&eacute;s socio-&eacute;conomiques de la r&eacute;gion de Vakinankaratra (i-e agro-&eacute;levage). Les formations pro-naissant des besoins constat&eacute;s sont alors mis en place avec les partenaires industriels socio-&eacute;conomiques.</p>\n<p align="justify">Aujourd&rsquo;hui, l&rsquo;effectif est de 1014 &eacute;tudiants encadr&eacute;s par 155 enseignants (universitaires et cadres d&rsquo;entreprises).</p>\n<p align="justify"><strong><em>L&rsquo;ASJA s&rsquo;est pr&eacute;par&eacute;e &agrave; rentrer dans le syst&egrave;me LMD, en 2004</em></strong>. Les principales actions concernaient alors en l&rsquo;&eacute;quipement des laboratoires et en l&rsquo;&eacute;laboration des programmes d&rsquo;enseignement selon l&rsquo;esprit du syst&egrave;me LMD, et cela gr&acirc;ce &agrave; l&rsquo;appui des Universit&eacute;s partenaires &eacute;trang&egrave;res et au financement du projet MADSUP relay&eacute; depuis 2007 par le projet FSP pour d&eacute;marrer la mise en place de ce nouveau syst&egrave;me.</p>\n<p align="justify">L&rsquo;ASJA, actuellement, apr&egrave;s s&rsquo;&ecirc;tre bien pr&eacute;par&eacute;e est d&eacute;cid&eacute;e, &agrave; la sortie des textes officiels du MESUPRES, &agrave; demander l&rsquo;habilitation de ses offres de formation dans le cadre du syst&egrave;me LMD, et se pr&eacute;pare &eacute;galement &agrave; postuler sa candidature en vue de la reconnaissance &agrave; l&rsquo;accr&eacute;ditation ult&eacute;rieurement.</p>\n<p align="justify">Dans le processus de mise en place du syst&egrave;me LMD, le dipl&ocirc;me de DUT (Bac+3ans) va &ecirc;tre transform&eacute; en <em><strong>Licence Professionnelle </strong></em>et celui de l&rsquo;Ing&eacute;niorat (Bac +5ans) en <strong><em>Master Professionnel.</em></strong></p>\n<p align="justify">Les contours de la Formation Professionnelle doivent tenir compte des points suivants :<br /> Stages en entreprise<br /> Etudes des cas ou de projets<br /> Enseignements assur&eacute;s par des professionnels<br /> Enseignements connexes (langues, &eacute;conomie, droit, &eacute;thique&hellip;)<br /> Suivi et analyse de l&rsquo;insertion des &eacute;tudiants (CIP)<br /> Pour le financement du syst&egrave;me, la recherche de nouvelles ressources s&rsquo;impose : ex : la formation continue et l&rsquo;ASJA y pense s&eacute;rieusement.</p>\n<p align="justify">La mission fondamentale de l&rsquo;ASJA conduit &agrave; fixer les objectifs suivants :<br /> - Recherche de l&rsquo;excellence dans tous les domaines de connaissance<br /> - Promotion de la science, de la culture, et du progr&egrave;s social<br /> - Promotion sociale avec la participation des structures nationales comp&eacute;tentes et des milieux socio-professionnels , notamment en ce qui concerne la d&eacute;finition des programmes et l&rsquo;organisation des ET,EP et stages.</p>\n</div>'),
(14, 3, 2, 'Athénée Saint Joseph Antsirabe', 'L’ASJA propose une architecture de ses offres de formation en 2 domaines : Sciences et Technologies (ST) et Sciences de la Société (SSo). Le 1er domaine (ST) comporte 4 mentions ; Sciences agronomiques, Informatique, Sciences de la Terre, Textile et Habillement et le 2ème domaine (SSo), les mentions Economie et Commerce et Droit. Chaque mention doit pouvoir offrir une gamme de formations capable de répondre à la demande croissante de polyvalence et multi-compétence dans les métiers et les fonctions exercées.', '<div id="apDiv2">\n<p align="justify">D&egrave;s son ouverture en 2000, l&rsquo;ASJA a pour vocation d&rsquo;assurer la formation professionnalisante dans divers domaines d&rsquo;activit&eacute;s r&eacute;pondant aux besoins socio-&eacute;conomiques du pays. Pour satisfaire &agrave; ces derniers, les offres de formation ont pris en compte les r&eacute;alit&eacute;s socio-&eacute;conomiques de la r&eacute;gion de Vakinankaratra (i-e agro-&eacute;levage). Les formations pro-naissant des besoins constat&eacute;s sont alors mis en place avec les partenaires industriels socio-&eacute;conomiques.</p>\n<p align="justify">Aujourd&rsquo;hui, l&rsquo;effectif est de 1014 &eacute;tudiants encadr&eacute;s par 155 enseignants (universitaires et cadres d&rsquo;entreprises).</p>\n<p align="justify"><strong><em>L&rsquo;ASJA s&rsquo;est pr&eacute;par&eacute;e &agrave; rentrer dans le syst&egrave;me LMD, en 2004</em></strong>. Les principales actions concernaient alors en l&rsquo;&eacute;quipement des laboratoires et en l&rsquo;&eacute;laboration des programmes d&rsquo;enseignement selon l&rsquo;esprit du syst&egrave;me LMD, et cela gr&acirc;ce &agrave; l&rsquo;appui des Universit&eacute;s partenaires &eacute;trang&egrave;res et au financement du projet MADSUP relay&eacute; depuis 2007 par le projet FSP pour d&eacute;marrer la mise en place de ce nouveau syst&egrave;me.</p>\n<p align="justify">L&rsquo;ASJA, actuellement, apr&egrave;s s&rsquo;&ecirc;tre bien pr&eacute;par&eacute;e est d&eacute;cid&eacute;e, &agrave; la sortie des textes officiels du MESUPRES, &agrave; demander l&rsquo;habilitation de ses offres de formation dans le cadre du syst&egrave;me LMD, et se pr&eacute;pare &eacute;galement &agrave; postuler sa candidature en vue de la reconnaissance &agrave; l&rsquo;accr&eacute;ditation ult&eacute;rieurement.</p>\n<p align="justify">Dans le processus de mise en place du syst&egrave;me LMD, le dipl&ocirc;me de DUT (Bac+3ans) va &ecirc;tre transform&eacute; en <em><strong>Licence Professionnelle </strong></em>et celui de l&rsquo;Ing&eacute;niorat (Bac +5ans) en <strong><em>Master Professionnel.</em></strong></p>\n<p align="justify">Les contours de la Formation Professionnelle doivent tenir compte des points suivants :<br /> Stages en entreprise<br /> Etudes des cas ou de projets<br /> Enseignements assur&eacute;s par des professionnels<br /> Enseignements connexes (langues, &eacute;conomie, droit, &eacute;thique&hellip;)<br /> Suivi et analyse de l&rsquo;insertion des &eacute;tudiants (CIP)<br /> Pour le financement du syst&egrave;me, la recherche de nouvelles ressources s&rsquo;impose : ex : la formation continue et l&rsquo;ASJA y pense s&eacute;rieusement.</p>\n<p align="justify">La mission fondamentale de l&rsquo;ASJA conduit &agrave; fixer les objectifs suivants :<br /> - Recherche de l&rsquo;excellence dans tous les domaines de connaissance<br /> - Promotion de la science, de la culture, et du progr&egrave;s social<br /> - Promotion sociale avec la participation des structures nationales comp&eacute;tentes et des milieux socio-professionnels , notamment en ce qui concerne la d&eacute;finition des programmes et l&rsquo;organisation des ET,EP et stages.</p>\n</div>'),
(15, 3, 3, 'association recupération', 'mg. Short description .association recupération', 'mg. Description .association recupération'),
(16, 3, 4, 'association recupération', 'it. Short description .association recupération', 'it. Description .association recupération'),
(17, 3, 5, 'association recupération', 'es. Short description .association recupération', 'es. Description .association recupération'),
(18, 3, 6, 'association recupération', 'de. Short description .association recupération', 'de. Description .association recupération'),
(19, 4, 1, 'Ecole Supérieure Polytechnique de d''Antananarivo', 'C''est est un établissement supérieur rattaché à l''université d''Antananarivo. Anciennement dénommé Etablissement Supérieur Polytechnique (E.E.S.P.), elle a reçu sa nouvelle appellation par le Décret n°91-148 du 26 mars 1991 portant création des Ecoles Supérieure Polytechnique. L''ESPA est située géographiquement au Campus de Vontovorona, à 20 kilomètres de la capitale sur la RN1.', '<p class="font_8" style="line-height: 1.3em; text-align: justify;"><span style="color: #000000;"><span style="line-height: 1.3em;">C''est est un &eacute;tablissement sup&eacute;rieur rattach&eacute; &agrave; l''universit&eacute; d''Antananarivo. Anciennement d&eacute;nomm&eacute; Etablissement Sup&eacute;rieur Polytechnique (E.E.S.P.), elle a re&ccedil;u sa nouvelle appellation par le D&eacute;cret n&deg;91-148 du 26 mars 1991 portant cr&eacute;ation des Ecoles Sup&eacute;rieure Polytechnique. L''ESPA est situ&eacute;e g&eacute;ographiquement au Campus de Vontovorona, &agrave; 20 kilom&egrave;tres de la capitale sur la RN1.</span></span></p>\n<p class="font_8" style="line-height: 1.3em; text-align: justify;"><span style="color: #000000;"><span style="line-height: 1.3em;">Par contre son Administration Centrale est implant&eacute;e &agrave; Ambohitsaina. Des laboratoires des D&eacute;partements Electronique et T&eacute;l&eacute;communications et un bloc technique, centre de production et de travaux pratiques (fabrication m&eacute;canique,...) se trouve &eacute;galement &agrave; Ambohitsaina.</span></span></p>'),
(20, 4, 2, 'qdsf jklm', 'C''est est un établissement supérieur rattaché à l''université d''Antananarivo. Anciennement dénommé Etablissement Supérieur Polytechnique (E.E.S.P.), elle a reçu sa nouvelle appellation par le Décret n°91-148 du 26 mars 1991 portant création des Ecoles Supérieure Polytechnique. L''ESPA est située géographiquement au Campus de Vontovorona, à 20 kilomètres de la capitale sur la RN1.', '<p class="font_8" style="line-height: 1.3em; text-align: justify;"><span style="color: #000000;"><span style="line-height: 1.3em;">C''est est un &eacute;tablissement sup&eacute;rieur rattach&eacute; &agrave; l''universit&eacute; d''Antananarivo. Anciennement d&eacute;nomm&eacute; Etablissement Sup&eacute;rieur Polytechnique (E.E.S.P.), elle a re&ccedil;u sa nouvelle appellation par le D&eacute;cret n&deg;91-148 du 26 mars 1991 portant cr&eacute;ation des Ecoles Sup&eacute;rieure Polytechnique. L''ESPA est situ&eacute;e g&eacute;ographiquement au Campus de Vontovorona, &agrave; 20 kilom&egrave;tres de la capitale sur la RN1.</span></span></p>\n<p class="font_8" style="line-height: 1.3em; text-align: justify;"><span style="color: #000000;"><span style="line-height: 1.3em;">Par contre son Administration Centrale est implant&eacute;e &agrave; Ambohitsaina. Des laboratoires des D&eacute;partements Electronique et T&eacute;l&eacute;communications et un bloc technique, centre de production et de travaux pratiques (fabrication m&eacute;canique,...) se trouve &eacute;galement &agrave; Ambohitsaina.</span></span></p>'),
(21, 4, 3, 'qdsf jklm', 'mg. Short description .qdsf jklm', 'mg. Description .qdsf jklm'),
(22, 4, 4, 'qdsf jklm', 'it. Short description .qdsf jklm', 'it. Description .qdsf jklm'),
(23, 4, 5, 'qdsf jklm', 'es. Short description .qdsf jklm', 'es. Description .qdsf jklm'),
(24, 4, 6, 'qdsf jklm', 'de. Short description .qdsf jklm', 'de. Description .qdsf jklm'),
(25, 5, 1, 'Ecole Nationale de L''Informatique', 'Formation universitaire et professionnelle de cadres informaticiens. Perfectionnement professionnel des spécialistes informaticiens en cours d’emploi et de cadres d’entreprises du secteur économique. Formation de Licence Professionnelle : concours. Formation d’ingénieur : concours + passage des étudiants en troisième année Licence Professionnelle. Formation de troisième cycle (DEA): sélection de dossiers', '<div id="js_10" class="_5pbx userContent" data-ft="{&quot;tn&quot;:&quot;K&quot;}">\n<p>PRESENTATION DE L''ENI</p>\n<p>ECOLE NATIONALE D&rsquo;INFORMATIQUE</p>\n<p>BP: 1487 Fianarantsoa MADAGASCAR</p>\n<p>T&eacute;l: 75 508 01,</p>\n<p>E-mail: eni@univ-fianar.mg</p>\n<p>Site web: <a href="http://www.univ-fianar.mg/" target="_blank" rel="nofollow">http://www.univ-fianar.mg</a><br /> La p&eacute;pini&egrave;re des &eacute;lites informaticiennes Malgaches - 27 ann&eacute;es d&rsquo;existence</p>\n<p>Directeur:Dr. RAFAMANTANANTSOA Fontaine</p>\n<p><br /> PRINCIPALES CARACTERISTIQUES DE L&rsquo;ENI</p>\n<p>Ann&eacute;e de cr&eacute;ation : 1983 suivant arr&ecirc;t&eacute; N&deg;183/83 du 24 mai 1983</p>\n<p>Statut l&eacute;gal : Etablissement Public d&rsquo;Enseignement Sup&eacute;rieur</p>\n<p>Missions :</p>\n<p>Formation universitaire et professionnelle de cadres informaticiens<br /> Perfectionnement professionnel des sp&eacute;cialistes informaticiens en cours d&rsquo;emploi et de cadres d&rsquo;entreprises du secteur &eacute;conomique.</p>\n<p>DEPARTEMENTS EXISTANTS ( Chefs de d&eacute;partements)</p>\n<p>D&eacute;partement de la Formation th&eacute;orique : RATIARSON Venot<br /> D&eacute;partement de la Formation pratique : RAKOTOASIMBAHOAKA Cyprien Robert<br /> D&eacute;partement de la Formation de troisi&egrave;me cycle : RAZAFIMANDIMBY Josvah Paul</p>\n<p>MODALITE DE RECRUTEMENT DES ETUDIANTS</p>\n<p>Formation de Licence Professionnelle : concours<br /> Formation d&rsquo;ing&eacute;nieur : concours + passage des &eacute;tudiants en troisi&egrave;me ann&eacute;e Licence Professionnelle<br /> Formation de troisi&egrave;me cycle (DEA): s&eacute;lection de dossiers</p>\n<p>PROGRAMMES ET ORGANISATION DES COURS - DUREE DES ETUDES</p>\n<p>Formation th&eacute;orique : Enseignements th&eacute;oriques, Travaux dirig&eacute;s ,Travaux pratiques<br /> Formation pratique : Etude de cas, travaux de r&eacute;alisation, Projets, voyage d&rsquo;&eacute;tudes et stages en entreprises suivis de soutenance de m&eacute;moire<br /> Chaque niveau comprend deux semestres (une ann&eacute;e universitaire)</p>\n<p>STAGES ET PARTENARIAT</p>\n<p>Relations partenariales avec des universit&eacute;s : toutes les autres universit&eacute;s nationales, des universit&eacute;s &eacute;trang&egrave;res comme IREMIA, Universit&eacute; de R&eacute;union, IUFM de Lyon 1, Universit&eacute; LAVAL au Canada, Ecole Polytechnique F&eacute;d&eacute;rale de Lausanne &agrave; Suisse, Ecole doctorale STIC de l&rsquo;Universit&eacute; de NICE Sophia-Antipolis, Universit&eacute; Haute Savoie &hellip;<br /> Relations partenariales avec quelques entreprises priv&eacute;es nationales et internationales : MADES, ACCENTURE &agrave; Maurice, SNEDA en France, TELMA &agrave; Madagascar.<br /> Stages des &eacute;tudiants dans divers &eacute;tablissements publics : MAEP, MEI, MEF, MEN, MESRES, MFB, CNA et &eacute;tablissements priv&eacute;s : AIRMAD, AUF, BANQUE CENTRALE, BLUELINE, ORANGE, QMM, SECREN, Soci&eacute;t&eacute; d&rsquo;exploitation du port de Toamasina, Airtel &hellip;</p>\n<p>LES ENSEIGNANTS-CHERCHEURS PERMANENTS</p>\n<p>RAMAMONJISOA Andriantiana Bertin Olivier, Professeur<br /> RAZAFIMANDIMBY Josvah Paul, Professeur<br /> RASOLOARIJAONA Madison, Ma&icirc;tre de conf&eacute;rences<br /> RAZAFINDRANDRIATSIMANIRY Dieu Donn&eacute;e Michel, Ma&icirc;tre de conf&eacute;rences<br /> RAFAMANTANANTSOA Fontaine, Ma&icirc;tre de conf&eacute;rences<br /> MAHATTODY Thomas, Ma&icirc;tre de conf&eacute;rences<br /> RAKOTOASIMAHOAKA Cyprien Robert, Ma&icirc;tre de conf&eacute;rences<br /> SIAKA, Assistant<br /> RATIARSON Venot, Ma&icirc;tre de conf&eacute;rences<br /> RABEARIJAONA Jocelyn Laurore, Assistant<br /> RAKOTONIRAINY Henri, Assistant<br /> RALAIVAO Jean Christian, Assistant<br /> RABETAFIKA Louis Haja, Assistant</p>\n<p>EFFECTIF DES ETUDIANTS</p>\n<p>1&egrave;re ann&eacute;e Licence Professionnelle : 64<br /> 2&egrave;me ann&eacute;e Licence Professionnelle : 52<br /> 3&egrave;me ann&eacute;e Licence Professionnelle : 52<br /> 1&egrave;re ann&eacute;e de Master : 100<br /> 3&egrave;me ann&eacute;e d&rsquo;ing&eacute;nieur : 45<br /> DEA : 27</p>\n<p>INTITULES DES DIPLOMES DELIVRES</p>\n<p>1er cycle : Licence Professionnelle en Informatique Option : " Administration des Syst&egrave;mes et R&eacute;seaux &rdquo; ou &ldquo;Base de Donn&eacute;es et G&eacute;nie logiciel &rdquo;<br /> 2nd cycle : Ing&eacute;niorat en Informatique et Master<br /> 3&egrave;me cycle : Dipl&ocirc;me d&rsquo;&eacute;tudes approfondis d&rsquo;informatique, Option : &ldquo;Cognition artificielle, formalisation du raisonnement et Syst&egrave;mes intelligents&rdquo; ou &ldquo; Traitement d&rsquo;images et technologies Multim&eacute;dia&rdquo; ou &ldquo; Mod&eacute;lisation informatique et math&eacute;matique des syst&egrave;mes complexes&rdquo;</p>\n<p>DEBOUCHES DES DIPLOMES DE L&rsquo;ENI</p>\n<p>Soci&eacute;t&eacute; de service, de conseils et d&rsquo;ing&eacute;nierie informatique<br /> Soci&eacute;t&eacute;s commerciales, industrielles et agricoles<br /> Etablissements financiers<br /> Soci&eacute;t&eacute; de t&eacute;l&eacute;communication et de transport<br /> Et autres soci&eacute;t&eacute;s et organismes publics et priv&eacute;s du secteur tertiaire</p>\n<p>FILIERE DE FORMATION DE 3&egrave;me CYCLE EXISTANTE</p>\n<p>DEA d&rsquo;Informatique, Option : &ldquo;Cognition artificielle, formalisation du raisonnement et Syst&egrave;mes intelligents&rdquo; ou &ldquo; Traitement d&rsquo;images et technologies Multim&eacute;dia&rdquo; ou &ldquo; Mod&eacute;lisation informatique et math&eacute;matique des syst&egrave;mes complexes&rdquo;</p>\n<p>PARTENAIRES ETRANGERS ET COOPERATION INTERNATIONALE</p>\n<p>Institut de Recherche en Informatique de Toulouse (IRIT), Universit&eacute; Paul Sabatier &ndash; Toulouse<br /> Institut National Polytechnique de Grenoble (INPG)<br /> ENSIEG (Grenoble)<br /> ENSERG (Grenoble)<br /> ENSIMAG (Ecole Nationale Sup&eacute;rieure d&rsquo;Informatique et de Math&eacute;matiques Appliqu&eacute;es de Grenoble)<br /> Institut National des Sciences Appliqu&eacute;es de Rennes (INSA), D&eacute;partement Informatique<br /> Universit&eacute; de Rennes1<br /> Universit&eacute; de Lyon<br /> Universit&eacute; de Blaise Pascal, Clermont Ferrand II<br /> IEMN, Universit&eacute; de Valenciennes -France<br /> Universit&eacute; de Savoie<br /> IRD (Institut de Recherche pour le D&eacute;veloppement)<br /> Facult&eacute; polydisciplinaire d&rsquo;Ouarzazate - Universit&eacute; Ibn Zohr &ndash; Maroc<br /> Facult&eacute; des Sciences d&rsquo;Antananarivo &ndash; Universit&eacute; d&rsquo;Antananarivo &ndash; Madagascar.<br /> Universit&eacute; de Toliara<br /> L''IHSM (Institut Halieutique et des Sciences Marines) de Toliara</p>\n<p>ETAPES REALISEES POUR LE BASCULEMENT VERS LE SYSTEME LMD</p>\n<p>Demande d&rsquo;habilitation de la Licence et du Master en informatique<br /> Domaine : Sciences de l&rsquo;ing&eacute;nieur<br /> Mention : Informatique<br /> Parcours:<br /> Administration des Syst&egrave;mes et R&eacute;seaux<br /> G&eacute;nie Logiciel et Base de Donn&eacute;es</p>\n<p>PROJETS DE DEVELOPPEMENT INSTITUTIONNEL (&agrave; court et moyen termes)</p>\n<p>Organisation de formations &agrave; distance et en ligne (Vid&eacute;oconf&eacute;rences et visioconf&eacute;rences)<br /> Modernisation et diversification des fili&egrave;res de formation et de recherche sur la base des Sciences et Technologies de l''Information et de la Communication (STIC)<br /> Appui &agrave; l''appropriation des STIC par les Enseignants et les &eacute;tudiants de l''Ecole, ainsi que par la communaut&eacute; extra-universitaire (Organisations Non Gouvernementales, Collectivit&eacute;s d&eacute;centralis&eacute;es, entreprises, Organismes d''appui au d&eacute;veloppement, Soci&eacute;t&eacute; civile) par l''interm&eacute;diaire d''un Cybercentre qui fournira des sessions de formation et des services Internet.</p>\n</div>'),
(26, 5, 2, 'Ecole Nationale de L''Informatique', 'Formation universitaire et professionnelle de cadres informaticiens. Perfectionnement professionnel des spécialistes informaticiens en cours d’emploi et de cadres d’entreprises du secteur économique. Formation de Licence Professionnelle : concours. Formation d’ingénieur : concours + passage des étudiants en troisième année Licence Professionnelle. Formation de troisième cycle (DEA): sélection de dossiers', '<div id="js_10" class="_5pbx userContent" data-ft="{&quot;tn&quot;:&quot;K&quot;}">\n<p>PRESENTATION DE L''ENI</p>\n<p>ECOLE NATIONALE D&rsquo;INFORMATIQUE</p>\n<p>BP: 1487 Fianarantsoa MADAGASCAR</p>\n<p>T&eacute;l: 75 508 01,</p>\n<p>E-mail: eni@univ-fianar.mg</p>\n<p>Site web: <a href="http://www.univ-fianar.mg/" target="_blank" rel="nofollow">http://www.univ-fianar.mg</a><br /> La p&eacute;pini&egrave;re des &eacute;lites informaticiennes Malgaches - 27 ann&eacute;es d&rsquo;existence</p>\n<p>Directeur:Dr. RAFAMANTANANTSOA Fontaine</p>\n<p><br /> PRINCIPALES CARACTERISTIQUES DE L&rsquo;ENI</p>\n<p>Ann&eacute;e de cr&eacute;ation : 1983 suivant arr&ecirc;t&eacute; N&deg;183/83 du 24 mai 1983</p>\n<p>Statut l&eacute;gal : Etablissement Public d&rsquo;Enseignement Sup&eacute;rieur</p>\n<p>Missions :</p>\n<p>Formation universitaire et professionnelle de cadres informaticiens<br /> Perfectionnement professionnel des sp&eacute;cialistes informaticiens en cours d&rsquo;emploi et de cadres d&rsquo;entreprises du secteur &eacute;conomique.</p>\n<p>DEPARTEMENTS EXISTANTS ( Chefs de d&eacute;partements)</p>\n<p>D&eacute;partement de la Formation th&eacute;orique : RATIARSON Venot<br /> D&eacute;partement de la Formation pratique : RAKOTOASIMBAHOAKA Cyprien Robert<br /> D&eacute;partement de la Formation de troisi&egrave;me cycle : RAZAFIMANDIMBY Josvah Paul</p>\n<p>MODALITE DE RECRUTEMENT DES ETUDIANTS</p>\n<p>Formation de Licence Professionnelle : concours<br /> Formation d&rsquo;ing&eacute;nieur : concours + passage des &eacute;tudiants en troisi&egrave;me ann&eacute;e Licence Professionnelle<br /> Formation de troisi&egrave;me cycle (DEA): s&eacute;lection de dossiers</p>\n<p>PROGRAMMES ET ORGANISATION DES COURS - DUREE DES ETUDES</p>\n<p>Formation th&eacute;orique : Enseignements th&eacute;oriques, Travaux dirig&eacute;s ,Travaux pratiques<br /> Formation pratique : Etude de cas, travaux de r&eacute;alisation, Projets, voyage d&rsquo;&eacute;tudes et stages en entreprises suivis de soutenance de m&eacute;moire<br /> Chaque niveau comprend deux semestres (une ann&eacute;e universitaire)</p>\n<p>STAGES ET PARTENARIAT</p>\n<p>Relations partenariales avec des universit&eacute;s : toutes les autres universit&eacute;s nationales, des universit&eacute;s &eacute;trang&egrave;res comme IREMIA, Universit&eacute; de R&eacute;union, IUFM de Lyon 1, Universit&eacute; LAVAL au Canada, Ecole Polytechnique F&eacute;d&eacute;rale de Lausanne &agrave; Suisse, Ecole doctorale STIC de l&rsquo;Universit&eacute; de NICE Sophia-Antipolis, Universit&eacute; Haute Savoie &hellip;<br /> Relations partenariales avec quelques entreprises priv&eacute;es nationales et internationales : MADES, ACCENTURE &agrave; Maurice, SNEDA en France, TELMA &agrave; Madagascar.<br /> Stages des &eacute;tudiants dans divers &eacute;tablissements publics : MAEP, MEI, MEF, MEN, MESRES, MFB, CNA et &eacute;tablissements priv&eacute;s : AIRMAD, AUF, BANQUE CENTRALE, BLUELINE, ORANGE, QMM, SECREN, Soci&eacute;t&eacute; d&rsquo;exploitation du port de Toamasina, Airtel &hellip;</p>\n<p>LES ENSEIGNANTS-CHERCHEURS PERMANENTS</p>\n<p>RAMAMONJISOA Andriantiana Bertin Olivier, Professeur<br /> RAZAFIMANDIMBY Josvah Paul, Professeur<br /> RASOLOARIJAONA Madison, Ma&icirc;tre de conf&eacute;rences<br /> RAZAFINDRANDRIATSIMANIRY Dieu Donn&eacute;e Michel, Ma&icirc;tre de conf&eacute;rences<br /> RAFAMANTANANTSOA Fontaine, Ma&icirc;tre de conf&eacute;rences<br /> MAHATTODY Thomas, Ma&icirc;tre de conf&eacute;rences<br /> RAKOTOASIMAHOAKA Cyprien Robert, Ma&icirc;tre de conf&eacute;rences<br /> SIAKA, Assistant<br /> RATIARSON Venot, Ma&icirc;tre de conf&eacute;rences<br /> RABEARIJAONA Jocelyn Laurore, Assistant<br /> RAKOTONIRAINY Henri, Assistant<br /> RALAIVAO Jean Christian, Assistant<br /> RABETAFIKA Louis Haja, Assistant</p>\n<p>EFFECTIF DES ETUDIANTS</p>\n<p>1&egrave;re ann&eacute;e Licence Professionnelle : 64<br /> 2&egrave;me ann&eacute;e Licence Professionnelle : 52<br /> 3&egrave;me ann&eacute;e Licence Professionnelle : 52<br /> 1&egrave;re ann&eacute;e de Master : 100<br /> 3&egrave;me ann&eacute;e d&rsquo;ing&eacute;nieur : 45<br /> DEA : 27</p>\n<p>INTITULES DES DIPLOMES DELIVRES</p>\n<p>1er cycle : Licence Professionnelle en Informatique Option : " Administration des Syst&egrave;mes et R&eacute;seaux &rdquo; ou &ldquo;Base de Donn&eacute;es et G&eacute;nie logiciel &rdquo;<br /> 2nd cycle : Ing&eacute;niorat en Informatique et Master<br /> 3&egrave;me cycle : Dipl&ocirc;me d&rsquo;&eacute;tudes approfondis d&rsquo;informatique, Option : &ldquo;Cognition artificielle, formalisation du raisonnement et Syst&egrave;mes intelligents&rdquo; ou &ldquo; Traitement d&rsquo;images et technologies Multim&eacute;dia&rdquo; ou &ldquo; Mod&eacute;lisation informatique et math&eacute;matique des syst&egrave;mes complexes&rdquo;</p>\n<p>DEBOUCHES DES DIPLOMES DE L&rsquo;ENI</p>\n<p>Soci&eacute;t&eacute; de service, de conseils et d&rsquo;ing&eacute;nierie informatique<br /> Soci&eacute;t&eacute;s commerciales, industrielles et agricoles<br /> Etablissements financiers<br /> Soci&eacute;t&eacute; de t&eacute;l&eacute;communication et de transport<br /> Et autres soci&eacute;t&eacute;s et organismes publics et priv&eacute;s du secteur tertiaire</p>\n<p>FILIERE DE FORMATION DE 3&egrave;me CYCLE EXISTANTE</p>\n<p>DEA d&rsquo;Informatique, Option : &ldquo;Cognition artificielle, formalisation du raisonnement et Syst&egrave;mes intelligents&rdquo; ou &ldquo; Traitement d&rsquo;images et technologies Multim&eacute;dia&rdquo; ou &ldquo; Mod&eacute;lisation informatique et math&eacute;matique des syst&egrave;mes complexes&rdquo;</p>\n<p>PARTENAIRES ETRANGERS ET COOPERATION INTERNATIONALE</p>\n<p>Institut de Recherche en Informatique de Toulouse (IRIT), Universit&eacute; Paul Sabatier &ndash; Toulouse<br /> Institut National Polytechnique de Grenoble (INPG)<br /> ENSIEG (Grenoble)<br /> ENSERG (Grenoble)<br /> ENSIMAG (Ecole Nationale Sup&eacute;rieure d&rsquo;Informatique et de Math&eacute;matiques Appliqu&eacute;es de Grenoble)<br /> Institut National des Sciences Appliqu&eacute;es de Rennes (INSA), D&eacute;partement Informatique<br /> Universit&eacute; de Rennes1<br /> Universit&eacute; de Lyon<br /> Universit&eacute; de Blaise Pascal, Clermont Ferrand II<br /> IEMN, Universit&eacute; de Valenciennes -France<br /> Universit&eacute; de Savoie<br /> IRD (Institut de Recherche pour le D&eacute;veloppement)<br /> Facult&eacute; polydisciplinaire d&rsquo;Ouarzazate - Universit&eacute; Ibn Zohr &ndash; Maroc<br /> Facult&eacute; des Sciences d&rsquo;Antananarivo &ndash; Universit&eacute; d&rsquo;Antananarivo &ndash; Madagascar.<br /> Universit&eacute; de Toliara<br /> L''IHSM (Institut Halieutique et des Sciences Marines) de Toliara</p>\n<p>ETAPES REALISEES POUR LE BASCULEMENT VERS LE SYSTEME LMD</p>\n<p>Demande d&rsquo;habilitation de la Licence et du Master en informatique<br /> Domaine : Sciences de l&rsquo;ing&eacute;nieur<br /> Mention : Informatique<br /> Parcours:<br /> Administration des Syst&egrave;mes et R&eacute;seaux<br /> G&eacute;nie Logiciel et Base de Donn&eacute;es</p>\n<p>PROJETS DE DEVELOPPEMENT INSTITUTIONNEL (&agrave; court et moyen termes)</p>\n<p>Organisation de formations &agrave; distance et en ligne (Vid&eacute;oconf&eacute;rences et visioconf&eacute;rences)<br /> Modernisation et diversification des fili&egrave;res de formation et de recherche sur la base des Sciences et Technologies de l''Information et de la Communication (STIC)<br /> Appui &agrave; l''appropriation des STIC par les Enseignants et les &eacute;tudiants de l''Ecole, ainsi que par la communaut&eacute; extra-universitaire (Organisations Non Gouvernementales, Collectivit&eacute;s d&eacute;centralis&eacute;es, entreprises, Organismes d''appui au d&eacute;veloppement, Soci&eacute;t&eacute; civile) par l''interm&eacute;diaire d''un Cybercentre qui fournira des sessions de formation et des services Internet.</p>\n</div>'),
(27, 5, 3, 'Ecole Nationale de L''Informatique', 'mg. Short description .Ecole Nationale de L''Informatique', 'mg. Description .Ecole Nationale de L''Informatique'),
(28, 5, 4, 'Ecole Nationale de L''Informatique', 'it. Short description .Ecole Nationale de L''Informatique', 'it. Description .Ecole Nationale de L''Informatique'),
(29, 5, 5, 'Ecole Nationale de L''Informatique', 'es. Short description .Ecole Nationale de L''Informatique', 'es. Description .Ecole Nationale de L''Informatique'),
(30, 5, 6, 'Ecole Nationale de L''Informatique', 'de. Short description .Ecole Nationale de L''Informatique', 'de. Description .Ecole Nationale de L''Informatique');
INSERT INTO `sl_school_translate` (`id`, `school_id`, `locale_id`, `name`, `short_description`, `description`) VALUES
(31, 6, 1, 'Université Catholique de Madagascar', 'Etant un institut d’enseignement supérieur privé confessionnel,  les formations dispensées sont établies suivant les préceptes de l’Eglise Catholique  Apostolique Romaine,  en ses constitutions  Sapientia Christiana (1979) et Ex Corde Ecclesia (1990) et quand bien même conformément aux principes et conditions de la politique générale de l’Etat malagasy,    en matière d’éducation et de formation. Article 3 du statut d’organisation de l’enseignement supérieur catholique de Madagascar.', '<p><strong>A propos</strong></p>\n<p style="text-align: justify;">L&rsquo;Universit&eacute; Catholique de Madagascar&nbsp; s&rsquo;organise autour des mots d&rsquo;ordre &laquo;&nbsp;<strong><span style="color: #333333;">Foi et Responsabilit&eacute;</span> &raquo;</strong> traduit du mot latin&nbsp; <strong>&laquo;&nbsp;<span style="color: #333333;">Fides et lux</span> &raquo;.</strong> Chaque D&eacute;partement, malgr&eacute; son autonomie respective, se voit r&eacute;gi par les m&ecirc;mes r&egrave;glements.</p>\n<p style="text-align: justify;">Etant un institut d&rsquo;enseignement sup&eacute;rieur priv&eacute; confessionnel,&nbsp; les formations dispens&eacute;es sont &eacute;tablies suivant les pr&eacute;ceptes de l&rsquo;Eglise Catholique&nbsp; Apostolique Romaine,&nbsp; en ses constitutions&nbsp; <span style="color: #333333;"><strong>Sapientia Christiana (1979)</strong></span> et<span style="color: #333333;"> <strong>E</strong><strong>x</strong> <strong>Corde Ecclesia (1990)</strong></span> et quand bien m&ecirc;me conform&eacute;ment aux principes et conditions de la politique g&eacute;n&eacute;rale de l&rsquo;Etat malagasy,&nbsp;&nbsp;&nbsp; en mati&egrave;re d&rsquo;&eacute;ducation et de formation. Article 3 du statut d&rsquo;organisation de l&rsquo;enseignement sup&eacute;rieur catholique de Madagascar.</p>\n<p><strong>Mot du Doyen</strong></p>\n<p style="text-align: justify;">La notion de savoir est au c&oelig;ur de ces diff&eacute;rentes mutations. Le savoir est devenu l&rsquo;objet d&rsquo;immenses enjeux &eacute;conomiques, politiques et culturels, au point de pouvoir pr&eacute;tendre qualifier les soci&eacute;t&eacute;s dont nous commen&ccedil;ons &agrave; voir se dessiner les contours&nbsp;: les soci&eacute;t&eacute;s du savoir.</p>\n<p style="text-align: justify;">Apprendre est le crit&egrave;re primordial de base de cette soci&eacute;t&eacute; du savoir. Les &eacute;tudiants de la Facult&eacute; des Sciences sociales (FSS) l&rsquo;ont compris&nbsp;: l&rsquo;effort r&eacute;gulier de tous les jours, et l&rsquo;ardeur &agrave; la t&acirc;che font qu&rsquo;ils ont adopt&eacute; cette volont&eacute; de fournir tous les jours un effort permanent <em>(non recusolaborem)</em>. &Eacute;tudier, apprendre vous est devenu, chers &eacute;tudiants, un r&eacute;flexe ontologique et prax&eacute;ologique. C&rsquo;est le sens, le but et la raison d&rsquo;&ecirc;tre &hellip;des &eacute;tudiants&nbsp;! Cependant, sachez que former l&rsquo;&eacute;lite n&rsquo;est pas sans difficult&eacute;s et la FSS n&rsquo;admet ni la compromission ni la demi-mesure&nbsp;! Selon la strat&eacute;gie du Samoura&iuml;, &laquo;&nbsp;&ccedil;a passe ou &ccedil;a casse&nbsp;!&nbsp;&raquo;</p>\n<p style="text-align: justify;">Si apprendre est une des valeurs cl&eacute;s de la soci&eacute;t&eacute; du savoir et qui est adopt&eacute;e par la FSS, cette derni&egrave;re va tout faire pour que la fracture cognitive devienne asymptotique, tende vers z&eacute;ro, et privil&eacute;gie le partage du savoir. Vaincre l&rsquo;ignorance est une voie salutaire de l&rsquo;&eacute;panouissement du syst&egrave;me cognitif (&laquo;&nbsp;il n&rsquo;est pauvret&eacute; que d&rsquo;ignorance&nbsp;&raquo;, <em>Le Talmud</em>). Les enseignants qui vous coachent sont l&agrave; pour cela et pour vous rassurer&nbsp;: ils allient p&eacute;dagogie et recherche dans leur magist&egrave;re&nbsp;! Ils vous nourrissent de leurs cours lest&eacute;s de leurs recherches en laboratoire, signifiant ainsi un garanti de qualit&eacute; et d&rsquo;actualisation. Ou bien encore, ce sont des professionnels inv&eacute;t&eacute;r&eacute;s qui excellent dans leurs domaines respectifs d&rsquo;activit&eacute; qui viennent vous gratifier de leurs savoirs&nbsp;!</p>\n<p style="text-align: justify;">L&rsquo;offre de formation qui vous a &eacute;t&eacute; pr&eacute;sent&eacute;e et mise en pratique ne cesse d&rsquo;&ecirc;tre actualis&eacute;e, et elle se veut g&eacute;n&eacute;raliste au d&eacute;but (par l&rsquo;interm&eacute;diaire du tronc commun) pour s&rsquo;affiner et se r&eacute;partir en diverses branches de sp&eacute;cialisation d&egrave;s L3. Cette m&eacute;tamorphose graduelle acquiert et donne &agrave; la formation ses labels de qualit&eacute; nationale, pour se tendre <em>a posteriori</em> vers une adaptabilit&eacute; internationale qui vous facilitera toute d&eacute;marche internationale, notamment avec les universit&eacute;s &eacute;trang&egrave;res, partenaires ou non, de l&rsquo;Universit&eacute; catholique de Madagascar.</p>\n<p style="text-align: justify;">Nous avons voulu id&eacute;aliser &agrave; travers notre devise (foi &ndash; excellence &ndash; responsabilit&eacute;) notre vie estudiantine au sein de la Facult&eacute; des sciences sociales. Nous y parviendrons gr&acirc;ce &agrave; notre pugnacit&eacute;&nbsp;! Il ne nous est plus possible de &laquo;&nbsp;remettre au lendemain&nbsp;&raquo; notre t&acirc;che quotidienne&nbsp;: la procrastination est hideuse et &agrave; &eacute;viter dans ce cas. Mais, elle n&rsquo;est pas toujours n&eacute;gative car elle permet &eacute;galement ce recul, cette halte pour r&eacute;fl&eacute;chir, analyser et approfondir (&laquo;&nbsp;<em>Commence par t&rsquo;asseoir</em> &raquo;, St Luc 14, 25-33). Approprions-nous cette culture de l&rsquo;excellence&nbsp;! Adoptons &eacute;galement le management de la performanceau sein de la FSS (la perfonomique)&nbsp;: Cela vous boostera dans vos &eacute;tudes, annihilant vos craintes et peurs de l&rsquo;&eacute;chec, vos appr&eacute;hensions du lendemain&nbsp;!</p>\n<p style="text-align: justify;"><strong>D&eacute;partement Th&eacute;ologie</strong></p>\n<p style="text-align: justify;">Le D&eacute;partement de Th&eacute;ologie de l&rsquo;Universit&eacute; Catholique de Madagascar&nbsp;entend donner une formation syst&eacute;matique dans les disciplines th&eacute;ologiques avec un accent particulier sur l&rsquo;histoire et les m&eacute;thodes de recherche scientifique propres &agrave; chaque discipline, d&rsquo;une part, et d&rsquo;autre part, sur les exigences intellectuelles de l&rsquo;inculturation de la foi chr&eacute;tienne dans le contexte de Madagascar. (cf. Constitution&nbsp; "Sapientia Christiana" n&deg;66).</p>\n<p style="text-align: justify;">Le d&eacute;partement de th&eacute;ologie&nbsp;forme des &eacute;tudiants aussi bien pr&ecirc;tres que la&iuml;cs, &agrave; la fois th&eacute;ologiens, pasteurs et ma&icirc;tres spirituels, capables d&rsquo;accompagner les intellectuels malgaches, de mener des recherches &agrave; partir des questions concr&egrave;tes de l&rsquo;Eglise &agrave; Madagascar, d&rsquo;enseigner dans les s&eacute;minaires et Universit&eacute;s, d&rsquo;animer la r&eacute;flexion pastorale dans les communaut&eacute;s d&rsquo;Eglise locale.Il forme des la&iuml;cs, des religieuses et religieux aptes &agrave; intervenir dans les noviciats et autres structures de formation, &agrave; enseigner dans les s&eacute;minaires ou dans d&rsquo;autres milieux de formation religieuse,&nbsp;et capables&nbsp;de mener des recherches n&eacute;cessaires &agrave; la vie de l&rsquo;Eglise.</p>'),
(32, 6, 2, 'Université Catholique de Madagascar', 'Etant un institut d’enseignement supérieur privé confessionnel,  les formations dispensées sont établies suivant les préceptes de l’Eglise Catholique  Apostolique Romaine,  en ses constitutions  Sapientia Christiana (1979) et Ex Corde Ecclesia (1990) et quand bien même conformément aux principes et conditions de la politique générale de l’Etat malagasy,    en matière d’éducation et de formation. Article 3 du statut d’organisation de l’enseignement supérieur catholique de Madagascar.', '<p><strong>A propos</strong></p>\n<p style="text-align: justify;">L&rsquo;Universit&eacute; Catholique de Madagascar&nbsp; s&rsquo;organise autour des mots d&rsquo;ordre &laquo;&nbsp;<strong><span style="color: #333333;">Foi et Responsabilit&eacute;</span> &raquo;</strong> traduit du mot latin&nbsp; <strong>&laquo;&nbsp;<span style="color: #333333;">Fides et lux</span> &raquo;.</strong> Chaque D&eacute;partement, malgr&eacute; son autonomie respective, se voit r&eacute;gi par les m&ecirc;mes r&egrave;glements.</p>\n<p style="text-align: justify;">Etant un institut d&rsquo;enseignement sup&eacute;rieur priv&eacute; confessionnel,&nbsp; les formations dispens&eacute;es sont &eacute;tablies suivant les pr&eacute;ceptes de l&rsquo;Eglise Catholique&nbsp; Apostolique Romaine,&nbsp; en ses constitutions&nbsp; <span style="color: #333333;"><strong>Sapientia Christiana (1979)</strong></span> et<span style="color: #333333;"> <strong>E</strong><strong>x</strong> <strong>Corde Ecclesia (1990)</strong></span> et quand bien m&ecirc;me conform&eacute;ment aux principes et conditions de la politique g&eacute;n&eacute;rale de l&rsquo;Etat malagasy,&nbsp;&nbsp;&nbsp; en mati&egrave;re d&rsquo;&eacute;ducation et de formation. Article 3 du statut d&rsquo;organisation de l&rsquo;enseignement sup&eacute;rieur catholique de Madagascar.</p>\n<p><strong>Mot du Doyen</strong></p>\n<p style="text-align: justify;">La notion de savoir est au c&oelig;ur de ces diff&eacute;rentes mutations. Le savoir est devenu l&rsquo;objet d&rsquo;immenses enjeux &eacute;conomiques, politiques et culturels, au point de pouvoir pr&eacute;tendre qualifier les soci&eacute;t&eacute;s dont nous commen&ccedil;ons &agrave; voir se dessiner les contours&nbsp;: les soci&eacute;t&eacute;s du savoir.</p>\n<p style="text-align: justify;">Apprendre est le crit&egrave;re primordial de base de cette soci&eacute;t&eacute; du savoir. Les &eacute;tudiants de la Facult&eacute; des Sciences sociales (FSS) l&rsquo;ont compris&nbsp;: l&rsquo;effort r&eacute;gulier de tous les jours, et l&rsquo;ardeur &agrave; la t&acirc;che font qu&rsquo;ils ont adopt&eacute; cette volont&eacute; de fournir tous les jours un effort permanent <em>(non recusolaborem)</em>. &Eacute;tudier, apprendre vous est devenu, chers &eacute;tudiants, un r&eacute;flexe ontologique et prax&eacute;ologique. C&rsquo;est le sens, le but et la raison d&rsquo;&ecirc;tre &hellip;des &eacute;tudiants&nbsp;! Cependant, sachez que former l&rsquo;&eacute;lite n&rsquo;est pas sans difficult&eacute;s et la FSS n&rsquo;admet ni la compromission ni la demi-mesure&nbsp;! Selon la strat&eacute;gie du Samoura&iuml;, &laquo;&nbsp;&ccedil;a passe ou &ccedil;a casse&nbsp;!&nbsp;&raquo;</p>\n<p style="text-align: justify;">Si apprendre est une des valeurs cl&eacute;s de la soci&eacute;t&eacute; du savoir et qui est adopt&eacute;e par la FSS, cette derni&egrave;re va tout faire pour que la fracture cognitive devienne asymptotique, tende vers z&eacute;ro, et privil&eacute;gie le partage du savoir. Vaincre l&rsquo;ignorance est une voie salutaire de l&rsquo;&eacute;panouissement du syst&egrave;me cognitif (&laquo;&nbsp;il n&rsquo;est pauvret&eacute; que d&rsquo;ignorance&nbsp;&raquo;, <em>Le Talmud</em>). Les enseignants qui vous coachent sont l&agrave; pour cela et pour vous rassurer&nbsp;: ils allient p&eacute;dagogie et recherche dans leur magist&egrave;re&nbsp;! Ils vous nourrissent de leurs cours lest&eacute;s de leurs recherches en laboratoire, signifiant ainsi un garanti de qualit&eacute; et d&rsquo;actualisation. Ou bien encore, ce sont des professionnels inv&eacute;t&eacute;r&eacute;s qui excellent dans leurs domaines respectifs d&rsquo;activit&eacute; qui viennent vous gratifier de leurs savoirs&nbsp;!</p>\n<p style="text-align: justify;">L&rsquo;offre de formation qui vous a &eacute;t&eacute; pr&eacute;sent&eacute;e et mise en pratique ne cesse d&rsquo;&ecirc;tre actualis&eacute;e, et elle se veut g&eacute;n&eacute;raliste au d&eacute;but (par l&rsquo;interm&eacute;diaire du tronc commun) pour s&rsquo;affiner et se r&eacute;partir en diverses branches de sp&eacute;cialisation d&egrave;s L3. Cette m&eacute;tamorphose graduelle acquiert et donne &agrave; la formation ses labels de qualit&eacute; nationale, pour se tendre <em>a posteriori</em> vers une adaptabilit&eacute; internationale qui vous facilitera toute d&eacute;marche internationale, notamment avec les universit&eacute;s &eacute;trang&egrave;res, partenaires ou non, de l&rsquo;Universit&eacute; catholique de Madagascar.</p>\n<p style="text-align: justify;">Nous avons voulu id&eacute;aliser &agrave; travers notre devise (foi &ndash; excellence &ndash; responsabilit&eacute;) notre vie estudiantine au sein de la Facult&eacute; des sciences sociales. Nous y parviendrons gr&acirc;ce &agrave; notre pugnacit&eacute;&nbsp;! Il ne nous est plus possible de &laquo;&nbsp;remettre au lendemain&nbsp;&raquo; notre t&acirc;che quotidienne&nbsp;: la procrastination est hideuse et &agrave; &eacute;viter dans ce cas. Mais, elle n&rsquo;est pas toujours n&eacute;gative car elle permet &eacute;galement ce recul, cette halte pour r&eacute;fl&eacute;chir, analyser et approfondir (&laquo;&nbsp;<em>Commence par t&rsquo;asseoir</em> &raquo;, St Luc 14, 25-33). Approprions-nous cette culture de l&rsquo;excellence&nbsp;! Adoptons &eacute;galement le management de la performanceau sein de la FSS (la perfonomique)&nbsp;: Cela vous boostera dans vos &eacute;tudes, annihilant vos craintes et peurs de l&rsquo;&eacute;chec, vos appr&eacute;hensions du lendemain&nbsp;!</p>\n<p style="text-align: justify;"><strong>D&eacute;partement Th&eacute;ologie</strong></p>\n<p style="text-align: justify;">Le D&eacute;partement de Th&eacute;ologie de l&rsquo;Universit&eacute; Catholique de Madagascar&nbsp;entend donner une formation syst&eacute;matique dans les disciplines th&eacute;ologiques avec un accent particulier sur l&rsquo;histoire et les m&eacute;thodes de recherche scientifique propres &agrave; chaque discipline, d&rsquo;une part, et d&rsquo;autre part, sur les exigences intellectuelles de l&rsquo;inculturation de la foi chr&eacute;tienne dans le contexte de Madagascar. (cf. Constitution&nbsp; "Sapientia Christiana" n&deg;66).</p>\n<p style="text-align: justify;">Le d&eacute;partement de th&eacute;ologie&nbsp;forme des &eacute;tudiants aussi bien pr&ecirc;tres que la&iuml;cs, &agrave; la fois th&eacute;ologiens, pasteurs et ma&icirc;tres spirituels, capables d&rsquo;accompagner les intellectuels malgaches, de mener des recherches &agrave; partir des questions concr&egrave;tes de l&rsquo;Eglise &agrave; Madagascar, d&rsquo;enseigner dans les s&eacute;minaires et Universit&eacute;s, d&rsquo;animer la r&eacute;flexion pastorale dans les communaut&eacute;s d&rsquo;Eglise locale.Il forme des la&iuml;cs, des religieuses et religieux aptes &agrave; intervenir dans les noviciats et autres structures de formation, &agrave; enseigner dans les s&eacute;minaires ou dans d&rsquo;autres milieux de formation religieuse,&nbsp;et capables&nbsp;de mener des recherches n&eacute;cessaires &agrave; la vie de l&rsquo;Eglise.</p>'),
(33, 6, 3, 'Université Catholique de Madagascar', 'mg. Short description .Université Catholique de Madagascar', 'mg. Description .Université Catholique de Madagascar'),
(34, 6, 4, 'Université Catholique de Madagascar', 'it. Short description .Université Catholique de Madagascar', 'it. Description .Université Catholique de Madagascar'),
(35, 6, 5, 'Université Catholique de Madagascar', 'es. Short description .Université Catholique de Madagascar', 'es. Description .Université Catholique de Madagascar'),
(36, 6, 6, 'Université Catholique de Madagascar', 'de. Short description .Université Catholique de Madagascar', 'de. Description .Université Catholique de Madagascar'),
(37, 7, 1, 'Ecole Supérieure en Comptabilité d''Administration et de Management d''Entreprise', 'L’ESCAME est une université privée agréée par l’Etat selon l’arrêté n°1293/2002. Elle offre des formations d’excellence en 1er et 2ème cycle au niveau : Bacc +2 : Technicien Supérieur en Comptabilité et Administration d’Entreprise, Bacc +3 : Etudes Supérieures en Management, Commerces, Finances et Banques, Bacc +4 : Hautes Etudes en Commerce, Management, Finances et Banques', '<p>Pr&eacute;sentation<br />L&rsquo;ESCAME est une universit&eacute; priv&eacute;e agr&eacute;&eacute;e par l&rsquo;Etat selon l&rsquo;arr&ecirc;t&eacute; n&deg;1293/2002. Elle offre des formations d&rsquo;excellence en 1er et 2&egrave;me cycle au niveau :<br />- Bacc +2 : Technicien Sup&eacute;rieur en Comptabilit&eacute; et Administration d&rsquo;Entreprise<br />- Bacc +3 : Etudes Sup&eacute;rieures en Management, Commerces, Finances et Banques<br />- Bacc +4 : Hautes Etudes en Commerce, Management, Finances et Banques</p>'),
(38, 7, 2, 'Ecole Supérieure en Comptabilité d''Administration et de Management d''Entreprise', 'L’ESCAME est une université privée agréée par l’Etat selon l’arrêté n°1293/2002. Elle offre des formations d’excellence en 1er et 2ème cycle au niveau : Bacc +2 : Technicien Supérieur en Comptabilité et Administration d’Entreprise, Bacc +3 : Etudes Supérieures en Management, Commerces, Finances et Banques, Bacc +4 : Hautes Etudes en Commerce, Management, Finances et Banques', '<p>Pr&eacute;sentation<br />L&rsquo;ESCAME est une universit&eacute; priv&eacute;e agr&eacute;&eacute;e par l&rsquo;Etat selon l&rsquo;arr&ecirc;t&eacute; n&deg;1293/2002. Elle offre des formations d&rsquo;excellence en 1er et 2&egrave;me cycle au niveau :<br />- Bacc +2 : Technicien Sup&eacute;rieur en Comptabilit&eacute; et Administration d&rsquo;Entreprise<br />- Bacc +3 : Etudes Sup&eacute;rieures en Management, Commerces, Finances et Banques<br />- Bacc +4 : Hautes Etudes en Commerce, Management, Finances et Banques</p>'),
(39, 7, 3, 'Ecole Supérieure en Comptabilité d''Administration et de Management d''Entreprise', 'L’ESCAME est une université privée agréée par l’Etat selon l’arrêté n°1293/2002. Elle offre des formations d’excellence en 1er et 2ème cycle au niveau : Bacc +2 : Technicien Supérieur en Comptabilité et Administration d’Entreprise, Bacc +3 : Etudes Supérieures en Management, Commerces, Finances et Banques, Bacc +4 : Hautes Etudes en Commerce, Management, Finances et Banques', '<p>Pr&eacute;sentation<br />L&rsquo;ESCAME est une universit&eacute; priv&eacute;e agr&eacute;&eacute;e par l&rsquo;Etat selon l&rsquo;arr&ecirc;t&eacute; n&deg;1293/2002. Elle offre des formations d&rsquo;excellence en 1er et 2&egrave;me cycle au niveau :<br />- Bacc +2 : Technicien Sup&eacute;rieur en Comptabilit&eacute; et Administration d&rsquo;Entreprise<br />- Bacc +3 : Etudes Sup&eacute;rieures en Management, Commerces, Finances et Banques<br />- Bacc +4 : Hautes Etudes en Commerce, Management, Finances et Banques</p>'),
(40, 7, 4, 'Ecole Supérieure en Comptabilité d''Administration et de Management d''Entreprise', 'Présentation\nL’ESCAME est une université privée agréée par l’Etat selon l’arrêté n°1293/2002. Elle offre des formations d’excellence en 1er et 2ème cycle au niveau :\n- Bacc +2 : Technicien Supérieur en Comptabilité et Administration d’Entreprise\n- Bacc +3 : Etudes Supérieures en Management, Commerces, Finances et Banques\n- Bacc +4 : Hautes Etudes en Commerce, Management, Finances et Banques', '<p>Pr&eacute;sentation<br />L&rsquo;ESCAME est une universit&eacute; priv&eacute;e agr&eacute;&eacute;e par l&rsquo;Etat selon l&rsquo;arr&ecirc;t&eacute; n&deg;1293/2002. Elle offre des formations d&rsquo;excellence en 1er et 2&egrave;me cycle au niveau :<br />- Bacc +2 : Technicien Sup&eacute;rieur en Comptabilit&eacute; et Administration d&rsquo;Entreprise<br />- Bacc +3 : Etudes Sup&eacute;rieures en Management, Commerces, Finances et Banques<br />- Bacc +4 : Hautes Etudes en Commerce, Management, Finances et Banques</p>'),
(41, 7, 5, 'Ecole Supérieure en Comptabilité d''Administration et de Management d''Entreprise', 'Présentation\nL’ESCAME est une université privée agréée par l’Etat selon l’arrêté n°1293/2002. Elle offre des formations d’excellence en 1er et 2ème cycle au niveau :\n- Bacc +2 : Technicien Supérieur en Comptabilité et Administration d’Entreprise\n- Bacc +3 : Etudes Supérieures en Management, Commerces, Finances et Banques\n- Bacc +4 : Hautes Etudes en Commerce, Management, Finances et Banques', '<p>Pr&eacute;sentation<br />L&rsquo;ESCAME est une universit&eacute; priv&eacute;e agr&eacute;&eacute;e par l&rsquo;Etat selon l&rsquo;arr&ecirc;t&eacute; n&deg;1293/2002. Elle offre des formations d&rsquo;excellence en 1er et 2&egrave;me cycle au niveau :<br />- Bacc +2 : Technicien Sup&eacute;rieur en Comptabilit&eacute; et Administration d&rsquo;Entreprise<br />- Bacc +3 : Etudes Sup&eacute;rieures en Management, Commerces, Finances et Banques<br />- Bacc +4 : Hautes Etudes en Commerce, Management, Finances et Banques</p>'),
(42, 7, 6, 'Ecole Supérieure en Comptabilité d''Administration et de Management d''Entreprise', 'Présentation\nL’ESCAME est une université privée agréée par l’Etat selon l’arrêté n°1293/2002. Elle offre des formations d’excellence en 1er et 2ème cycle au niveau :\n- Bacc +2 : Technicien Supérieur en Comptabilité et Administration d’Entreprise\n- Bacc +3 : Etudes Supérieures en Management, Commerces, Finances et Banques\n- Bacc +4 : Hautes Etudes en Commerce, Management, Finances et Banques', '<p>Pr&eacute;sentation<br />L&rsquo;ESCAME est une universit&eacute; priv&eacute;e agr&eacute;&eacute;e par l&rsquo;Etat selon l&rsquo;arr&ecirc;t&eacute; n&deg;1293/2002. Elle offre des formations d&rsquo;excellence en 1er et 2&egrave;me cycle au niveau :<br />- Bacc +2 : Technicien Sup&eacute;rieur en Comptabilit&eacute; et Administration d&rsquo;Entreprise<br />- Bacc +3 : Etudes Sup&eacute;rieures en Management, Commerces, Finances et Banques<br />- Bacc +4 : Hautes Etudes en Commerce, Management, Finances et Banques</p>'),
(43, 8, 1, 'GSI Université', 'L''université GSI a pour objectif de former ses étudiants à développer ses connaissances, sa curiosité, son esprit de créativité et surtout son talent. Etudier à l''Université GSI, c''est aussi bénéficier d''un accompagnement personnalisé qui vous permettra de mener à bien votre projet de formation et de vous préparer à l''entrée dans la vie active et professionnelle...', '<p><strong>PRESENTATION GENERALE DE L&rsquo;UNIVERSITE GSI</strong><br /><br />L&rsquo;universit&eacute; G.S.I fut fond&eacute;e en 2002 sur une initiative de Madame Nina ANDRIAMIHANTAHERIZO, actuellement Directrice G&eacute;n&eacute;rale. Elle a plusieurs ann&eacute;es d&rsquo;exp&eacute;riences dans le domaine de la communication journalisme, de l&rsquo;audio visuel et de l&rsquo;enseignement.<br /><br />Le Pr&eacute;sident de l&rsquo;universit&eacute; est Monsieur Geremioh W. RANDRIANAIVO. Il dispose d&rsquo;une riche exp&eacute;rience au sein de Multinationales et de cabinets d&rsquo;Audit et de Conseil. Apr&egrave;s son Master en Administration d&rsquo;Entreprise, il occupe respectivement les postes de responsable administratif et financier aupr&egrave;s du Groupe Fraise et de charg&eacute; d&rsquo;expertise comptable au sein de la SECOI. Il d&eacute;ploie d&eacute;sormais ses comp&eacute;tences professionnelles au service de l&rsquo;universit&eacute;.<br /><br />L&rsquo;universit&eacute; a &eacute;t&eacute; cr&eacute;&eacute;e pour transmettre des enseignements de haut niveau aux futurs cadres d&rsquo;entreprise.<br />GSI est une universit&eacute; priv&eacute;e agr&eacute;&eacute; par l&rsquo;Etat, ses dipl&ocirc;mes sont reconnus par le Minist&egrave;re de la fonction publique suivant les textes r&egrave;glementaires suivants :<br />&ndash; D&eacute;cision N&deg; 027/METFP/DG du 20 Novembre 2002 portant autorisation d&rsquo;ouverture et d&rsquo;agr&eacute;ment provisoire d&rsquo;un Etablissement de formation Professionnelle &laquo; GSI &raquo;<br />&ndash; Arr&ecirc;t&eacute; N&deg; 48 753/2009/PM/SEETFP du 27 octobre 2009 portant autorisation d&rsquo;ouverture et d&rsquo;agr&eacute;ment d&rsquo;une Universit&eacute; Priv&eacute;e<br />&ndash; Arr&ecirc;t&eacute; N&deg; 48 755/2009/PM/SEETFP du 27 octobre 2009 portant agr&eacute;ment de fili&egrave;res au &laquo; INSTITUT UNIVERSITAIRE PROFESSIONNEL &raquo; &laquo; GSI &raquo;<br />&ndash; Arr&ecirc;t&eacute; N&deg; 00747/2010/PM/CNEAT/MinFop/CNEAT du 21 Janvier 2010 portant l&rsquo;&eacute;quivalence administrative d&rsquo;un titre de la Fonction Publique du Dipl&ocirc;me de Technicien Sup&eacute;rieur BACC+2 &ndash; Cat&eacute;gorie IV &ndash; Echelle B1<br />&ndash; Arr&ecirc;t&eacute; N&deg; 5465/2013/CNEAT du 21 Janvier 2010 Portant d&eacute;termination de l&rsquo;&eacute;quivalence administrative d&rsquo;un titre de la Fonction Publique du Dipl&ocirc;me de Technicien Sup&eacute;rieur en B&acirc;timents et Travaux Publics BACC+2 &ndash; Cat&eacute;gorie IV &ndash; Echelle B1<br />&ndash; Arr&ecirc;t&eacute; d&rsquo;habilitation N&deg;36831/2013-MESUPRES portant d&eacute;termination de l&rsquo;&eacute;quivalence administrative d&rsquo;un titre dans la Fonction Publique du Dipl&ocirc;me Licence Professionnelle en B&acirc;timents et Travaux Publics BACC+3 &ndash; Cat&eacute;gorie V &ndash; Echelle A3.<br />&ndash; Arr&ecirc;t&eacute; d&rsquo;habilitation N&deg;29378/2013-CNEAT portant d&eacute;termination de l&rsquo;&eacute;quivalence administrative d&rsquo;un titre dans la Fonction Publique du Dipl&ocirc;me Licence Professionnelle en Multim&eacute;dia et Communication BACC+3 &ndash; Cat&eacute;gorie V &ndash; Echelle A3.<br />&ndash; Arr&ecirc;t&eacute; d&rsquo;habilitation N&deg;29378/2013-CNEAT portant d&eacute;termination de l&rsquo;&eacute;quivalence administrative d&rsquo;un titre dans la Fonction Publique du Dipl&ocirc;me Licence Professionnelle en Gestion BACC+3 &ndash; Cat&eacute;gorie V &ndash; Echelle A3.<br />&ndash; Arr&ecirc;t&eacute; d&rsquo;habilitation N&deg;7700/2013-CNEAT portant d&eacute;termination de l&rsquo;&eacute;quivalence administrative d&rsquo;un titre dans la Fonction Publique du Dipl&ocirc;me Licence Professionnelle en Informatique de Gestion BACC+3 &ndash; Cat&eacute;gorie V &ndash; Echelle A3.<br /><br />G.S.I est habilit&eacute;e par l&rsquo;Etat suivant l&rsquo;Arr&ecirc;t&eacute; n&deg; 1949/21013/MESUPRES/2013</p>'),
(44, 8, 2, 'GSI Université', 'L''université GSI a pour objectif de former ses étudiants à développer ses connaissances, sa curiosité, son esprit de créativité et surtout son talent. Etudier à l''Université GSI, c''est aussi bénéficier d''un accompagnement personnalisé qui vous permettra de mener à bien votre projet de formation et de vous préparer à l''entrée dans la vie active et professionnelle.', '<p><strong>PRESENTATION GENERALE DE L&rsquo;UNIVERSITE GSI</strong><br /><br />L&rsquo;universit&eacute; G.S.I fut fond&eacute;e en 2002 sur une initiative de Madame Nina ANDRIAMIHANTAHERIZO, actuellement Directrice G&eacute;n&eacute;rale. Elle a plusieurs ann&eacute;es d&rsquo;exp&eacute;riences dans le domaine de la communication journalisme, de l&rsquo;audio visuel et de l&rsquo;enseignement.<br /><br />Le Pr&eacute;sident de l&rsquo;universit&eacute; est Monsieur Geremioh W. RANDRIANAIVO. Il dispose d&rsquo;une riche exp&eacute;rience au sein de Multinationales et de cabinets d&rsquo;Audit et de Conseil. Apr&egrave;s son Master en Administration d&rsquo;Entreprise, il occupe respectivement les postes de responsable administratif et financier aupr&egrave;s du Groupe Fraise et de charg&eacute; d&rsquo;expertise comptable au sein de la SECOI. Il d&eacute;ploie d&eacute;sormais ses comp&eacute;tences professionnelles au service de l&rsquo;universit&eacute;.<br /><br />L&rsquo;universit&eacute; a &eacute;t&eacute; cr&eacute;&eacute;e pour transmettre des enseignements de haut niveau aux futurs cadres d&rsquo;entreprise.<br />GSI est une universit&eacute; priv&eacute;e agr&eacute;&eacute; par l&rsquo;Etat, ses dipl&ocirc;mes sont reconnus par le Minist&egrave;re de la fonction publique suivant les textes r&egrave;glementaires suivants :<br />&ndash; D&eacute;cision N&deg; 027/METFP/DG du 20 Novembre 2002 portant autorisation d&rsquo;ouverture et d&rsquo;agr&eacute;ment provisoire d&rsquo;un Etablissement de formation Professionnelle &laquo; GSI &raquo;<br />&ndash; Arr&ecirc;t&eacute; N&deg; 48 753/2009/PM/SEETFP du 27 octobre 2009 portant autorisation d&rsquo;ouverture et d&rsquo;agr&eacute;ment d&rsquo;une Universit&eacute; Priv&eacute;e<br />&ndash; Arr&ecirc;t&eacute; N&deg; 48 755/2009/PM/SEETFP du 27 octobre 2009 portant agr&eacute;ment de fili&egrave;res au &laquo; INSTITUT UNIVERSITAIRE PROFESSIONNEL &raquo; &laquo; GSI &raquo;<br />&ndash; Arr&ecirc;t&eacute; N&deg; 00747/2010/PM/CNEAT/MinFop/CNEAT du 21 Janvier 2010 portant l&rsquo;&eacute;quivalence administrative d&rsquo;un titre de la Fonction Publique du Dipl&ocirc;me de Technicien Sup&eacute;rieur BACC+2 &ndash; Cat&eacute;gorie IV &ndash; Echelle B1<br />&ndash; Arr&ecirc;t&eacute; N&deg; 5465/2013/CNEAT du 21 Janvier 2010 Portant d&eacute;termination de l&rsquo;&eacute;quivalence administrative d&rsquo;un titre de la Fonction Publique du Dipl&ocirc;me de Technicien Sup&eacute;rieur en B&acirc;timents et Travaux Publics BACC+2 &ndash; Cat&eacute;gorie IV &ndash; Echelle B1<br />&ndash; Arr&ecirc;t&eacute; d&rsquo;habilitation N&deg;36831/2013-MESUPRES portant d&eacute;termination de l&rsquo;&eacute;quivalence administrative d&rsquo;un titre dans la Fonction Publique du Dipl&ocirc;me Licence Professionnelle en B&acirc;timents et Travaux Publics BACC+3 &ndash; Cat&eacute;gorie V &ndash; Echelle A3.<br />&ndash; Arr&ecirc;t&eacute; d&rsquo;habilitation N&deg;29378/2013-CNEAT portant d&eacute;termination de l&rsquo;&eacute;quivalence administrative d&rsquo;un titre dans la Fonction Publique du Dipl&ocirc;me Licence Professionnelle en Multim&eacute;dia et Communication BACC+3 &ndash; Cat&eacute;gorie V &ndash; Echelle A3.<br />&ndash; Arr&ecirc;t&eacute; d&rsquo;habilitation N&deg;29378/2013-CNEAT portant d&eacute;termination de l&rsquo;&eacute;quivalence administrative d&rsquo;un titre dans la Fonction Publique du Dipl&ocirc;me Licence Professionnelle en Gestion BACC+3 &ndash; Cat&eacute;gorie V &ndash; Echelle A3.<br />&ndash; Arr&ecirc;t&eacute; d&rsquo;habilitation N&deg;7700/2013-CNEAT portant d&eacute;termination de l&rsquo;&eacute;quivalence administrative d&rsquo;un titre dans la Fonction Publique du Dipl&ocirc;me Licence Professionnelle en Informatique de Gestion BACC+3 &ndash; Cat&eacute;gorie V &ndash; Echelle A3.<br /><br />G.S.I est habilit&eacute;e par l&rsquo;Etat suivant l&rsquo;Arr&ecirc;t&eacute; n&deg; 1949/21013/MESUPRES/2013</p>'),
(45, 8, 3, 'GSI', 'mg. Short description .GSI', 'mg. Description .GSI'),
(46, 8, 4, 'GSI', 'it. Short description .GSI', 'it. Description .GSI'),
(47, 8, 5, 'GSI', 'es. Short description .GSI', 'es. Description .GSI'),
(48, 8, 6, 'GSI', 'de. Short description .GSI', 'de. Description .GSI'),
(49, 9, 1, 'Curabitur laoreet varius malesuada', 'Le Centre National de Télé-Enseignement de Madagascar (CNTEMAD)  est un établissement public à caractère scientifique, sous tutelle technique du MESupReS, œuvrant dans le domaine de l’enseignement supérieur, qui fut fondé, en 1992, suivant le décret 92-953 du  04/11/92,  afin d’assister et d’accompagner, étroitement,  l’administration des universités publiques malgaches dans leurs taches fondamentales, qui seraient : d’accueillir, de former, puis de valoriser les parcours (via les diplômes) de tout citoyen bachelier en quête de cursus universitaire.', '<p style="text-align: justify;">Le Centre National de T&eacute;l&eacute;-Enseignement de Madagascar (CNTEMAD)&nbsp; est un &eacute;tablissement public &agrave; caract&egrave;re scientifique, sous tutelle technique du MESupReS, &oelig;uvrant dans le domaine de l&rsquo;enseignement sup&eacute;rieur, qui fut fond&eacute;, en 1992, suivant le d&eacute;cret 92-953 du&nbsp; 04/11/92,&nbsp; afin d&rsquo;assister et d&rsquo;accompagner, &eacute;troitement,&nbsp; l&rsquo;administration des universit&eacute;s publiques malgaches dans leurs taches fondamentales, qui seraient : d&rsquo;accueillir, de former, puis de valoriser les parcours (via les dipl&ocirc;mes) de tout citoyen bachelier en qu&ecirc;te de cursus universitaire.<br /><br />Outre le fait de dispenser des formations universitaires habilit&eacute;es aux marginalis&eacute;s de l&rsquo;universit&eacute; publique (marginalis&eacute;s pour fautes de moyens et d&rsquo;infrastructures),&nbsp; le CNTEMAD a &oelig;uvr&eacute; pour la promotion de l&rsquo;enseignement sup&eacute;rieur malgache, &agrave; travers le t&eacute;l&eacute;-enseignement, auquel il fut le pionnier. Par le biais de cette pratique, le CNTEMAD a d&eacute;finitivement &ocirc;t&eacute; la notion d&rsquo;&eacute;loignement g&eacute;ographique aux contraintes majeures des &eacute;tudiants ; qu&rsquo;il a &eacute;t&eacute; constat&eacute;, par cons&eacute;quent, un fort accroissement du taux de fr&eacute;quentation, &agrave; l&rsquo;enseignement sup&eacute;rieur, des bacheliers. Un fait qui aurait g&eacute;n&eacute;r&eacute; une &eacute;mergence surprenante de nouvelles g&eacute;n&eacute;rations d&rsquo;intellectuels et de&nbsp; professionnels &agrave; Madagascar.<br /><br />Le CNTEMAD est r&eacute;gi sous l&rsquo;administration d&rsquo;un conseil compos&eacute; par des repr&eacute;sentants : minist&eacute;riels (MESupReS, MinFoP), de la f&eacute;d&eacute;ration des chambres du commerce malgache et de l&rsquo;Enseignement Sup&eacute;rieur malgache (pr&eacute;sidents et doyens de facult&eacute;s). Son syst&egrave;me d&rsquo;administration se base sur les politiques manag&eacute;riales d&rsquo;un Directeur National, assist&eacute; par cinq sous-directeurs. Afin d&rsquo;assurer une totale couverture de la grande &icirc;le en formation accr&eacute;dit&eacute;e, le CNTEMAD est d&eacute;concentr&eacute; en trente quatre (34) centres r&eacute;gionaux de t&eacute;l&eacute;-enseignement (CRTE). Chaque ann&eacute;e, on compte dans les seize mille (16.000) le nombre d&rsquo;apprenants qui s&rsquo;inscrivent&nbsp; au CNTEMAD. Les formations qui y sont dispens&eacute;es se distinguent en deux domaines : les Sciences de l&rsquo;Ing&eacute;nieur et les Sciences de la Soci&eacute;t&eacute;. Le domaine des Sciences de l&rsquo;Ing&eacute;nieur est &eacute;tal&eacute; en trois mentions : l&rsquo;Informatique, le G&eacute;nie Industriel et la T&eacute;l&eacute;communication. Le second domaine est, quant &agrave; lui, &eacute;tal&eacute; en : Droit, Economie, Commerce et&nbsp; Communication. Toutes ces mentions comprendront par la suite des ensembles de parcours, constitu&eacute;s par des groupes d&rsquo;unit&eacute; d&rsquo;enseignement. Aux termes de leurs cursus, le CNTEMAD d&eacute;livre &agrave; ses apprenants des dipl&ocirc;mes de Licence ou de Master, cautionn&eacute;s par le MESupReS et reconnus par le MinFoP.</p>'),
(50, 9, 2, 'Curabitur laoreet varius malesuada', 'Le Centre National de Télé-Enseignement de Madagascar (CNTEMAD)  est un établissement public à caractère scientifique, sous tutelle technique du MESupReS, œuvrant dans le domaine de l’enseignement supérieur, qui fut fondé, en 1992, suivant le décret 92-953 du  04/11/92,  afin d’assister et d’accompagner, étroitement,  l’administration des universités publiques malgaches dans leurs taches fondamentales, qui seraient : d’accueillir, de former, puis de valoriser les parcours (via les diplômes) de tout citoyen bachelier en quête de cursus universitaire.', '<p style="text-align: justify;">Le Centre National de T&eacute;l&eacute;-Enseignement de Madagascar (CNTEMAD)&nbsp; est un &eacute;tablissement public &agrave; caract&egrave;re scientifique, sous tutelle technique du MESupReS, &oelig;uvrant dans le domaine de l&rsquo;enseignement sup&eacute;rieur, qui fut fond&eacute;, en 1992, suivant le d&eacute;cret 92-953 du&nbsp; 04/11/92,&nbsp; afin d&rsquo;assister et d&rsquo;accompagner, &eacute;troitement,&nbsp; l&rsquo;administration des universit&eacute;s publiques malgaches dans leurs taches fondamentales, qui seraient : d&rsquo;accueillir, de former, puis de valoriser les parcours (via les dipl&ocirc;mes) de tout citoyen bachelier en qu&ecirc;te de cursus universitaire.<br /><br />Outre le fait de dispenser des formations universitaires habilit&eacute;es aux marginalis&eacute;s de l&rsquo;universit&eacute; publique (marginalis&eacute;s pour fautes de moyens et d&rsquo;infrastructures),&nbsp; le CNTEMAD a &oelig;uvr&eacute; pour la promotion de l&rsquo;enseignement sup&eacute;rieur malgache, &agrave; travers le t&eacute;l&eacute;-enseignement, auquel il fut le pionnier. Par le biais de cette pratique, le CNTEMAD a d&eacute;finitivement &ocirc;t&eacute; la notion d&rsquo;&eacute;loignement g&eacute;ographique aux contraintes majeures des &eacute;tudiants ; qu&rsquo;il a &eacute;t&eacute; constat&eacute;, par cons&eacute;quent, un fort accroissement du taux de fr&eacute;quentation, &agrave; l&rsquo;enseignement sup&eacute;rieur, des bacheliers. Un fait qui aurait g&eacute;n&eacute;r&eacute; une &eacute;mergence surprenante de nouvelles g&eacute;n&eacute;rations d&rsquo;intellectuels et de&nbsp; professionnels &agrave; Madagascar.<br /><br />Le CNTEMAD est r&eacute;gi sous l&rsquo;administration d&rsquo;un conseil compos&eacute; par des repr&eacute;sentants : minist&eacute;riels (MESupReS, MinFoP), de la f&eacute;d&eacute;ration des chambres du commerce malgache et de l&rsquo;Enseignement Sup&eacute;rieur malgache (pr&eacute;sidents et doyens de facult&eacute;s). Son syst&egrave;me d&rsquo;administration se base sur les politiques manag&eacute;riales d&rsquo;un Directeur National, assist&eacute; par cinq sous-directeurs. Afin d&rsquo;assurer une totale couverture de la grande &icirc;le en formation accr&eacute;dit&eacute;e, le CNTEMAD est d&eacute;concentr&eacute; en trente quatre (34) centres r&eacute;gionaux de t&eacute;l&eacute;-enseignement (CRTE). Chaque ann&eacute;e, on compte dans les seize mille (16.000) le nombre d&rsquo;apprenants qui s&rsquo;inscrivent&nbsp; au CNTEMAD. Les formations qui y sont dispens&eacute;es se distinguent en deux domaines : les Sciences de l&rsquo;Ing&eacute;nieur et les Sciences de la Soci&eacute;t&eacute;. Le domaine des Sciences de l&rsquo;Ing&eacute;nieur est &eacute;tal&eacute; en trois mentions : l&rsquo;Informatique, le G&eacute;nie Industriel et la T&eacute;l&eacute;communication. Le second domaine est, quant &agrave; lui, &eacute;tal&eacute; en : Droit, Economie, Commerce et&nbsp; Communication. Toutes ces mentions comprendront par la suite des ensembles de parcours, constitu&eacute;s par des groupes d&rsquo;unit&eacute; d&rsquo;enseignement. Aux termes de leurs cursus, le CNTEMAD d&eacute;livre &agrave; ses apprenants des dipl&ocirc;mes de Licence ou de Master, cautionn&eacute;s par le MESupReS et reconnus par le MinFoP.</p>'),
(51, 9, 3, 'Curabitur laoreet varius malesuada', 'Le Centre National de Télé-Enseignement de Madagascar (CNTEMAD)  est un établissement public à caractère scientifique, sous tutelle technique du MESupReS, œuvrant dans le domaine de l’enseignement supérieur, qui fut fondé, en 1992, suivant le décret 92-953 du  04/11/92,  afin d’assister et d’accompagner, étroitement,  l’administration des universités publiques malgaches dans leurs taches fondamentales, qui seraient : d’accueillir, de former, puis de valoriser les parcours (via les diplômes) de tout citoyen bachelier en quête de cursus universitaire.', '<p style="text-align: justify;">Le Centre National de T&eacute;l&eacute;-Enseignement de Madagascar (CNTEMAD)&nbsp; est un &eacute;tablissement public &agrave; caract&egrave;re scientifique, sous tutelle technique du MESupReS, &oelig;uvrant dans le domaine de l&rsquo;enseignement sup&eacute;rieur, qui fut fond&eacute;, en 1992, suivant le d&eacute;cret 92-953 du&nbsp; 04/11/92,&nbsp; afin d&rsquo;assister et d&rsquo;accompagner, &eacute;troitement,&nbsp; l&rsquo;administration des universit&eacute;s publiques malgaches dans leurs taches fondamentales, qui seraient : d&rsquo;accueillir, de former, puis de valoriser les parcours (via les dipl&ocirc;mes) de tout citoyen bachelier en qu&ecirc;te de cursus universitaire.<br /><br />Outre le fait de dispenser des formations universitaires habilit&eacute;es aux marginalis&eacute;s de l&rsquo;universit&eacute; publique (marginalis&eacute;s pour fautes de moyens et d&rsquo;infrastructures),&nbsp; le CNTEMAD a &oelig;uvr&eacute; pour la promotion de l&rsquo;enseignement sup&eacute;rieur malgache, &agrave; travers le t&eacute;l&eacute;-enseignement, auquel il fut le pionnier. Par le biais de cette pratique, le CNTEMAD a d&eacute;finitivement &ocirc;t&eacute; la notion d&rsquo;&eacute;loignement g&eacute;ographique aux contraintes majeures des &eacute;tudiants ; qu&rsquo;il a &eacute;t&eacute; constat&eacute;, par cons&eacute;quent, un fort accroissement du taux de fr&eacute;quentation, &agrave; l&rsquo;enseignement sup&eacute;rieur, des bacheliers. Un fait qui aurait g&eacute;n&eacute;r&eacute; une &eacute;mergence surprenante de nouvelles g&eacute;n&eacute;rations d&rsquo;intellectuels et de&nbsp; professionnels &agrave; Madagascar.<br /><br />Le CNTEMAD est r&eacute;gi sous l&rsquo;administration d&rsquo;un conseil compos&eacute; par des repr&eacute;sentants : minist&eacute;riels (MESupReS, MinFoP), de la f&eacute;d&eacute;ration des chambres du commerce malgache et de l&rsquo;Enseignement Sup&eacute;rieur malgache (pr&eacute;sidents et doyens de facult&eacute;s). Son syst&egrave;me d&rsquo;administration se base sur les politiques manag&eacute;riales d&rsquo;un Directeur National, assist&eacute; par cinq sous-directeurs. Afin d&rsquo;assurer une totale couverture de la grande &icirc;le en formation accr&eacute;dit&eacute;e, le CNTEMAD est d&eacute;concentr&eacute; en trente quatre (34) centres r&eacute;gionaux de t&eacute;l&eacute;-enseignement (CRTE). Chaque ann&eacute;e, on compte dans les seize mille (16.000) le nombre d&rsquo;apprenants qui s&rsquo;inscrivent&nbsp; au CNTEMAD. Les formations qui y sont dispens&eacute;es se distinguent en deux domaines : les Sciences de l&rsquo;Ing&eacute;nieur et les Sciences de la Soci&eacute;t&eacute;. Le domaine des Sciences de l&rsquo;Ing&eacute;nieur est &eacute;tal&eacute; en trois mentions : l&rsquo;Informatique, le G&eacute;nie Industriel et la T&eacute;l&eacute;communication. Le second domaine est, quant &agrave; lui, &eacute;tal&eacute; en : Droit, Economie, Commerce et&nbsp; Communication. Toutes ces mentions comprendront par la suite des ensembles de parcours, constitu&eacute;s par des groupes d&rsquo;unit&eacute; d&rsquo;enseignement. Aux termes de leurs cursus, le CNTEMAD d&eacute;livre &agrave; ses apprenants des dipl&ocirc;mes de Licence ou de Master, cautionn&eacute;s par le MESupReS et reconnus par le MinFoP.</p>'),
(52, 9, 4, 'Curabitur laoreet varius malesuada', 'Le Centre National de Télé-Enseignement de Madagascar (CNTEMAD)  est un établissement public à caractère scientifique, sous tutelle technique du MESupReS, œuvrant dans le domaine de l’enseignement supérieur, qui fut fondé, en 1992, suivant le décret 92-953 du  04/11/92,  afin d’assister et d’accompagner, étroitement,  l’administration des universités publiques malgaches dans leurs taches fondamentales, qui seraient : d’accueillir, de former, puis de valoriser les parcours (via les diplômes) de tout citoyen bachelier en quête de cursus universitaire.', '<p style="text-align: justify;">Le Centre National de T&eacute;l&eacute;-Enseignement de Madagascar (CNTEMAD)&nbsp; est un &eacute;tablissement public &agrave; caract&egrave;re scientifique, sous tutelle technique du MESupReS, &oelig;uvrant dans le domaine de l&rsquo;enseignement sup&eacute;rieur, qui fut fond&eacute;, en 1992, suivant le d&eacute;cret 92-953 du&nbsp; 04/11/92,&nbsp; afin d&rsquo;assister et d&rsquo;accompagner, &eacute;troitement,&nbsp; l&rsquo;administration des universit&eacute;s publiques malgaches dans leurs taches fondamentales, qui seraient : d&rsquo;accueillir, de former, puis de valoriser les parcours (via les dipl&ocirc;mes) de tout citoyen bachelier en qu&ecirc;te de cursus universitaire.<br /><br />Outre le fait de dispenser des formations universitaires habilit&eacute;es aux marginalis&eacute;s de l&rsquo;universit&eacute; publique (marginalis&eacute;s pour fautes de moyens et d&rsquo;infrastructures),&nbsp; le CNTEMAD a &oelig;uvr&eacute; pour la promotion de l&rsquo;enseignement sup&eacute;rieur malgache, &agrave; travers le t&eacute;l&eacute;-enseignement, auquel il fut le pionnier. Par le biais de cette pratique, le CNTEMAD a d&eacute;finitivement &ocirc;t&eacute; la notion d&rsquo;&eacute;loignement g&eacute;ographique aux contraintes majeures des &eacute;tudiants ; qu&rsquo;il a &eacute;t&eacute; constat&eacute;, par cons&eacute;quent, un fort accroissement du taux de fr&eacute;quentation, &agrave; l&rsquo;enseignement sup&eacute;rieur, des bacheliers. Un fait qui aurait g&eacute;n&eacute;r&eacute; une &eacute;mergence surprenante de nouvelles g&eacute;n&eacute;rations d&rsquo;intellectuels et de&nbsp; professionnels &agrave; Madagascar.<br /><br />Le CNTEMAD est r&eacute;gi sous l&rsquo;administration d&rsquo;un conseil compos&eacute; par des repr&eacute;sentants : minist&eacute;riels (MESupReS, MinFoP), de la f&eacute;d&eacute;ration des chambres du commerce malgache et de l&rsquo;Enseignement Sup&eacute;rieur malgache (pr&eacute;sidents et doyens de facult&eacute;s). Son syst&egrave;me d&rsquo;administration se base sur les politiques manag&eacute;riales d&rsquo;un Directeur National, assist&eacute; par cinq sous-directeurs. Afin d&rsquo;assurer une totale couverture de la grande &icirc;le en formation accr&eacute;dit&eacute;e, le CNTEMAD est d&eacute;concentr&eacute; en trente quatre (34) centres r&eacute;gionaux de t&eacute;l&eacute;-enseignement (CRTE). Chaque ann&eacute;e, on compte dans les seize mille (16.000) le nombre d&rsquo;apprenants qui s&rsquo;inscrivent&nbsp; au CNTEMAD. Les formations qui y sont dispens&eacute;es se distinguent en deux domaines : les Sciences de l&rsquo;Ing&eacute;nieur et les Sciences de la Soci&eacute;t&eacute;. Le domaine des Sciences de l&rsquo;Ing&eacute;nieur est &eacute;tal&eacute; en trois mentions : l&rsquo;Informatique, le G&eacute;nie Industriel et la T&eacute;l&eacute;communication. Le second domaine est, quant &agrave; lui, &eacute;tal&eacute; en : Droit, Economie, Commerce et&nbsp; Communication. Toutes ces mentions comprendront par la suite des ensembles de parcours, constitu&eacute;s par des groupes d&rsquo;unit&eacute; d&rsquo;enseignement. Aux termes de leurs cursus, le CNTEMAD d&eacute;livre &agrave; ses apprenants des dipl&ocirc;mes de Licence ou de Master, cautionn&eacute;s par le MESupReS et reconnus par le MinFoP.</p>');
INSERT INTO `sl_school_translate` (`id`, `school_id`, `locale_id`, `name`, `short_description`, `description`) VALUES
(53, 9, 5, 'Curabitur laoreet varius malesuada', 'Le Centre National de Télé-Enseignement de Madagascar (CNTEMAD)  est un établissement public à caractère scientifique, sous tutelle technique du MESupReS, œuvrant dans le domaine de l’enseignement supérieur, qui fut fondé, en 1992, suivant le décret 92-953 du  04/11/92,  afin d’assister et d’accompagner, étroitement,  l’administration des universités publiques malgaches dans leurs taches fondamentales, qui seraient : d’accueillir, de former, puis de valoriser les parcours (via les diplômes) de tout citoyen bachelier en quête de cursus universitaire.', '<p style="text-align: justify;">Le Centre National de T&eacute;l&eacute;-Enseignement de Madagascar (CNTEMAD)&nbsp; est un &eacute;tablissement public &agrave; caract&egrave;re scientifique, sous tutelle technique du MESupReS, &oelig;uvrant dans le domaine de l&rsquo;enseignement sup&eacute;rieur, qui fut fond&eacute;, en 1992, suivant le d&eacute;cret 92-953 du&nbsp; 04/11/92,&nbsp; afin d&rsquo;assister et d&rsquo;accompagner, &eacute;troitement,&nbsp; l&rsquo;administration des universit&eacute;s publiques malgaches dans leurs taches fondamentales, qui seraient : d&rsquo;accueillir, de former, puis de valoriser les parcours (via les dipl&ocirc;mes) de tout citoyen bachelier en qu&ecirc;te de cursus universitaire.<br /><br />Outre le fait de dispenser des formations universitaires habilit&eacute;es aux marginalis&eacute;s de l&rsquo;universit&eacute; publique (marginalis&eacute;s pour fautes de moyens et d&rsquo;infrastructures),&nbsp; le CNTEMAD a &oelig;uvr&eacute; pour la promotion de l&rsquo;enseignement sup&eacute;rieur malgache, &agrave; travers le t&eacute;l&eacute;-enseignement, auquel il fut le pionnier. Par le biais de cette pratique, le CNTEMAD a d&eacute;finitivement &ocirc;t&eacute; la notion d&rsquo;&eacute;loignement g&eacute;ographique aux contraintes majeures des &eacute;tudiants ; qu&rsquo;il a &eacute;t&eacute; constat&eacute;, par cons&eacute;quent, un fort accroissement du taux de fr&eacute;quentation, &agrave; l&rsquo;enseignement sup&eacute;rieur, des bacheliers. Un fait qui aurait g&eacute;n&eacute;r&eacute; une &eacute;mergence surprenante de nouvelles g&eacute;n&eacute;rations d&rsquo;intellectuels et de&nbsp; professionnels &agrave; Madagascar.<br /><br />Le CNTEMAD est r&eacute;gi sous l&rsquo;administration d&rsquo;un conseil compos&eacute; par des repr&eacute;sentants : minist&eacute;riels (MESupReS, MinFoP), de la f&eacute;d&eacute;ration des chambres du commerce malgache et de l&rsquo;Enseignement Sup&eacute;rieur malgache (pr&eacute;sidents et doyens de facult&eacute;s). Son syst&egrave;me d&rsquo;administration se base sur les politiques manag&eacute;riales d&rsquo;un Directeur National, assist&eacute; par cinq sous-directeurs. Afin d&rsquo;assurer une totale couverture de la grande &icirc;le en formation accr&eacute;dit&eacute;e, le CNTEMAD est d&eacute;concentr&eacute; en trente quatre (34) centres r&eacute;gionaux de t&eacute;l&eacute;-enseignement (CRTE). Chaque ann&eacute;e, on compte dans les seize mille (16.000) le nombre d&rsquo;apprenants qui s&rsquo;inscrivent&nbsp; au CNTEMAD. Les formations qui y sont dispens&eacute;es se distinguent en deux domaines : les Sciences de l&rsquo;Ing&eacute;nieur et les Sciences de la Soci&eacute;t&eacute;. Le domaine des Sciences de l&rsquo;Ing&eacute;nieur est &eacute;tal&eacute; en trois mentions : l&rsquo;Informatique, le G&eacute;nie Industriel et la T&eacute;l&eacute;communication. Le second domaine est, quant &agrave; lui, &eacute;tal&eacute; en : Droit, Economie, Commerce et&nbsp; Communication. Toutes ces mentions comprendront par la suite des ensembles de parcours, constitu&eacute;s par des groupes d&rsquo;unit&eacute; d&rsquo;enseignement. Aux termes de leurs cursus, le CNTEMAD d&eacute;livre &agrave; ses apprenants des dipl&ocirc;mes de Licence ou de Master, cautionn&eacute;s par le MESupReS et reconnus par le MinFoP.</p>'),
(54, 9, 6, 'Curabitur laoreet varius malesuada', 'Le Centre National de Télé-Enseignement de Madagascar (CNTEMAD)  est un établissement public à caractère scientifique, sous tutelle technique du MESupReS, œuvrant dans le domaine de l’enseignement supérieur, qui fut fondé, en 1992, suivant le décret 92-953 du  04/11/92,  afin d’assister et d’accompagner, étroitement,  l’administration des universités publiques malgaches dans leurs taches fondamentales, qui seraient : d’accueillir, de former, puis de valoriser les parcours (via les diplômes) de tout citoyen bachelier en quête de cursus universitaire.', '<p style="text-align: justify;">Le Centre National de T&eacute;l&eacute;-Enseignement de Madagascar (CNTEMAD)&nbsp; est un &eacute;tablissement public &agrave; caract&egrave;re scientifique, sous tutelle technique du MESupReS, &oelig;uvrant dans le domaine de l&rsquo;enseignement sup&eacute;rieur, qui fut fond&eacute;, en 1992, suivant le d&eacute;cret 92-953 du&nbsp; 04/11/92,&nbsp; afin d&rsquo;assister et d&rsquo;accompagner, &eacute;troitement,&nbsp; l&rsquo;administration des universit&eacute;s publiques malgaches dans leurs taches fondamentales, qui seraient : d&rsquo;accueillir, de former, puis de valoriser les parcours (via les dipl&ocirc;mes) de tout citoyen bachelier en qu&ecirc;te de cursus universitaire.<br /><br />Outre le fait de dispenser des formations universitaires habilit&eacute;es aux marginalis&eacute;s de l&rsquo;universit&eacute; publique (marginalis&eacute;s pour fautes de moyens et d&rsquo;infrastructures),&nbsp; le CNTEMAD a &oelig;uvr&eacute; pour la promotion de l&rsquo;enseignement sup&eacute;rieur malgache, &agrave; travers le t&eacute;l&eacute;-enseignement, auquel il fut le pionnier. Par le biais de cette pratique, le CNTEMAD a d&eacute;finitivement &ocirc;t&eacute; la notion d&rsquo;&eacute;loignement g&eacute;ographique aux contraintes majeures des &eacute;tudiants ; qu&rsquo;il a &eacute;t&eacute; constat&eacute;, par cons&eacute;quent, un fort accroissement du taux de fr&eacute;quentation, &agrave; l&rsquo;enseignement sup&eacute;rieur, des bacheliers. Un fait qui aurait g&eacute;n&eacute;r&eacute; une &eacute;mergence surprenante de nouvelles g&eacute;n&eacute;rations d&rsquo;intellectuels et de&nbsp; professionnels &agrave; Madagascar.<br /><br />Le CNTEMAD est r&eacute;gi sous l&rsquo;administration d&rsquo;un conseil compos&eacute; par des repr&eacute;sentants : minist&eacute;riels (MESupReS, MinFoP), de la f&eacute;d&eacute;ration des chambres du commerce malgache et de l&rsquo;Enseignement Sup&eacute;rieur malgache (pr&eacute;sidents et doyens de facult&eacute;s). Son syst&egrave;me d&rsquo;administration se base sur les politiques manag&eacute;riales d&rsquo;un Directeur National, assist&eacute; par cinq sous-directeurs. Afin d&rsquo;assurer une totale couverture de la grande &icirc;le en formation accr&eacute;dit&eacute;e, le CNTEMAD est d&eacute;concentr&eacute; en trente quatre (34) centres r&eacute;gionaux de t&eacute;l&eacute;-enseignement (CRTE). Chaque ann&eacute;e, on compte dans les seize mille (16.000) le nombre d&rsquo;apprenants qui s&rsquo;inscrivent&nbsp; au CNTEMAD. Les formations qui y sont dispens&eacute;es se distinguent en deux domaines : les Sciences de l&rsquo;Ing&eacute;nieur et les Sciences de la Soci&eacute;t&eacute;. Le domaine des Sciences de l&rsquo;Ing&eacute;nieur est &eacute;tal&eacute; en trois mentions : l&rsquo;Informatique, le G&eacute;nie Industriel et la T&eacute;l&eacute;communication. Le second domaine est, quant &agrave; lui, &eacute;tal&eacute; en : Droit, Economie, Commerce et&nbsp; Communication. Toutes ces mentions comprendront par la suite des ensembles de parcours, constitu&eacute;s par des groupes d&rsquo;unit&eacute; d&rsquo;enseignement. Aux termes de leurs cursus, le CNTEMAD d&eacute;livre &agrave; ses apprenants des dipl&ocirc;mes de Licence ou de Master, cautionn&eacute;s par le MESupReS et reconnus par le MinFoP.</p>'),
(55, 10, 1, 'Deflexit iam aliquantum de spatio', 'fr. Short description .Deflexit iam aliquantum de spatio', 'fr. Description .Deflexit iam aliquantum de spatio'),
(56, 10, 2, 'Deflexit iam aliquantum de spatio', 'en. Short description .Deflexit iam aliquantum de spatio', 'en. Description .Deflexit iam aliquantum de spatio'),
(57, 10, 3, 'Deflexit iam aliquantum de spatio', 'mg. Short description .Deflexit iam aliquantum de spatio', 'mg. Description .Deflexit iam aliquantum de spatio'),
(58, 10, 4, 'Deflexit iam aliquantum de spatio', 'it. Short description .Deflexit iam aliquantum de spatio', 'it. Description .Deflexit iam aliquantum de spatio'),
(59, 10, 5, 'Deflexit iam aliquantum de spatio', 'es. Short description .Deflexit iam aliquantum de spatio', 'es. Description .Deflexit iam aliquantum de spatio'),
(60, 10, 6, 'Deflexit iam aliquantum de spatio', 'de. Short description .Deflexit iam aliquantum de spatio', 'de. Description .Deflexit iam aliquantum de spatio'),
(61, 11, 1, 'ultricies ac arcu vitae elementum', 'Sed ut tum ad senem senex de senectute, sic hoc libro ad amicum amicissimus scripsi de amicitia. Tum est Cato locutus, quo erat nemo fere senior temporibus illis, nemo prudentior; nunc Laelius et sapiens (sic enim est habitus) et amicitiae gloria excellens de amicitia loquetur. Tu velim a me animum parumper avertas, Laelium loqui ipsum putes. C. Fannius et Q. Mucius ad socerum veniunt post mortem Africani; ab his sermo oritur, respondet Laelius, cuius tota disputatio est de amicitia, quam legens te ipse cognosces.', '<p>Siquis enim militarium vel honoratorum aut nobilis inter suos rumore tenus esset insimulatus fovisse partes hostiles, iniecto onere catenarum in modum beluae trahebatur et inimico urgente vel nullo, quasi sufficiente hoc solo, quod nominatus esset aut delatus aut postulatus, capite vel multatione bonorum aut insulari solitudine damnabatur.</p>\n<p>Nec minus feminae quoque calamitatum participes fuere similium. nam ex hoc quoque sexu peremptae sunt originis altae conplures, adulteriorum flagitiis obnoxiae vel stuprorum. inter quas notiores fuere Claritas et Flaviana, quarum altera cum duceretur ad mortem, indumento, quo vestita erat, abrepto, ne velemen quidem secreto membrorum sufficiens retinere permissa est. ideoque carnifex nefas admisisse convictus inmane, vivus exustus est.</p>\n<p>Etenim si attendere diligenter, existimare vere de omni hac causa volueritis, sic constituetis, iudices, nec descensurum quemquam ad hanc accusationem fuisse, cui, utrum vellet, liceret, nec, cum descendisset, quicquam habiturum spei fuisse, nisi alicuius intolerabili libidine et nimis acerbo odio niteretur. Sed ego Atratino, humanissimo atque optimo adulescenti meo necessario, ignosco, qui habet excusationem vel pietatis vel necessitatis vel aetatis. Si voluit accusare, pietati tribuo, si iussus est, necessitati, si speravit aliquid, pueritiae. Ceteris non modo nihil ignoscendum, sed etiam acriter est resistendum.</p>\n<p>Sed fruatur sane hoc solacio atque hanc insignem ignominiam, quoniam uni praeter se inusta sit, putet esse leviorem, dum modo, cuius exemplo se consolatur, eius exitum expectet, praesertim cum in Albucio nec Pisonis libidines nec audacia Gabini fuerit ac tamen hac una plaga conciderit, ignominia senatus.</p>\n<p>Nec vox accusatoris ulla licet subditicii in his malorum quaerebatur acervis ut saltem specie tenus crimina praescriptis legum committerentur, quod aliquotiens fecere principes saevi: sed quicquid Caesaris implacabilitati sedisset, id velut fas iusque perpensum confestim urgebatur impleri.</p>'),
(62, 11, 2, 'ultricies ac arcu vitae elementum', 'Sed ut tum ad senem senex de senectute, sic hoc libro ad amicum amicissimus scripsi de amicitia. Tum est Cato locutus, quo erat nemo fere senior temporibus illis, nemo prudentior; nunc Laelius et sapiens (sic enim est habitus) et amicitiae gloria excellens de amicitia loquetur. Tu velim a me animum parumper avertas, Laelium loqui ipsum putes. C. Fannius et Q. Mucius ad socerum veniunt post mortem Africani; ab his sermo oritur, respondet Laelius, cuius tota disputatio est de amicitia, quam legens te ipse cognosces.', '<p>Siquis enim militarium vel honoratorum aut nobilis inter suos rumore tenus esset insimulatus fovisse partes hostiles, iniecto onere catenarum in modum beluae trahebatur et inimico urgente vel nullo, quasi sufficiente hoc solo, quod nominatus esset aut delatus aut postulatus, capite vel multatione bonorum aut insulari solitudine damnabatur.</p>\n<p>Nec minus feminae quoque calamitatum participes fuere similium. nam ex hoc quoque sexu peremptae sunt originis altae conplures, adulteriorum flagitiis obnoxiae vel stuprorum. inter quas notiores fuere Claritas et Flaviana, quarum altera cum duceretur ad mortem, indumento, quo vestita erat, abrepto, ne velemen quidem secreto membrorum sufficiens retinere permissa est. ideoque carnifex nefas admisisse convictus inmane, vivus exustus est.</p>\n<p>Etenim si attendere diligenter, existimare vere de omni hac causa volueritis, sic constituetis, iudices, nec descensurum quemquam ad hanc accusationem fuisse, cui, utrum vellet, liceret, nec, cum descendisset, quicquam habiturum spei fuisse, nisi alicuius intolerabili libidine et nimis acerbo odio niteretur. Sed ego Atratino, humanissimo atque optimo adulescenti meo necessario, ignosco, qui habet excusationem vel pietatis vel necessitatis vel aetatis. Si voluit accusare, pietati tribuo, si iussus est, necessitati, si speravit aliquid, pueritiae. Ceteris non modo nihil ignoscendum, sed etiam acriter est resistendum.</p>\n<p>Sed fruatur sane hoc solacio atque hanc insignem ignominiam, quoniam uni praeter se inusta sit, putet esse leviorem, dum modo, cuius exemplo se consolatur, eius exitum expectet, praesertim cum in Albucio nec Pisonis libidines nec audacia Gabini fuerit ac tamen hac una plaga conciderit, ignominia senatus.</p>\n<p>Nec vox accusatoris ulla licet subditicii in his malorum quaerebatur acervis ut saltem specie tenus crimina praescriptis legum committerentur, quod aliquotiens fecere principes saevi: sed quicquid Caesaris implacabilitati sedisset, id velut fas iusque perpensum confestim urgebatur impleri.</p>'),
(63, 11, 3, 'ultricies ac arcu vitae elementum', 'mg. Short description .ultricies ac arcu vitae elementum', 'mg. Description .ultricies ac arcu vitae elementum'),
(64, 11, 4, 'ultricies ac arcu vitae elementum', 'it. Short description .ultricies ac arcu vitae elementum', 'it. Description .ultricies ac arcu vitae elementum'),
(65, 11, 5, 'ultricies ac arcu vitae elementum', 'es. Short description .ultricies ac arcu vitae elementum', 'es. Description .ultricies ac arcu vitae elementum'),
(66, 11, 6, 'ultricies ac arcu vitae elementum', 'de. Short description .ultricies ac arcu vitae elementum', 'de. Description .ultricies ac arcu vitae elementum'),
(67, 12, 1, 'Quod si rectum statuerimus vel concedere', 'Illud tamen te esse admonitum volo, primum ut qualis es talem te esse omnes existiment ut, quantum a rerum turpitudine abes, tantum te a verborum libertate seiungas; deinde ut ea in alterum ne dicas, quae cum tibi falso responsa sint, erubescas. Quis est enim, cui via ista non pateat, qui isti aetati atque etiam isti dignitati non possit quam velit petulanter, etiamsi sine ulla suspicione, at non sine argumento male dicere? Sed istarum partium culpa est eorum, qui te agere voluerunt; laus pudoris tui, quod ea te invitum dicere videbamus, ingenii, quod ornate politeque dixisti.', '<p>Nec vox accusatoris ulla licet subditicii in his malorum quaerebatur acervis ut saltem specie tenus crimina praescriptis legum committerentur, quod aliquotiens fecere principes saevi: sed quicquid Caesaris implacabilitati sedisset, id velut fas iusque perpensum confestim urgebatur impleri.</p>\n<p>Illud tamen te esse admonitum volo, primum ut qualis es talem te esse omnes existiment ut, quantum a rerum turpitudine abes, tantum te a verborum libertate seiungas; deinde ut ea in alterum ne dicas, quae cum tibi falso responsa sint, erubescas. Quis est enim, cui via ista non pateat, qui isti aetati atque etiam isti dignitati non possit quam velit petulanter, etiamsi sine ulla suspicione, at non sine argumento male dicere? Sed istarum partium culpa est eorum, qui te agere voluerunt; laus pudoris tui, quod ea te invitum dicere videbamus, ingenii, quod ornate politeque dixisti.</p>\n<p>Quod si rectum statuerimus vel concedere amicis, quidquid velint, vel impetrare ab iis, quidquid velimus, perfecta quidem sapientia si simus, nihil habeat res vitii; sed loquimur de iis amicis qui ante oculos sunt, quos vidimus aut de quibus memoriam accepimus, quos novit vita communis. Ex hoc numero nobis exempla sumenda sunt, et eorum quidem maxime qui ad sapientiam proxime accedunt.</p>\n<p>Advenit post multos Scudilo Scutariorum tribunus velamento subagrestis ingenii persuasionis opifex callidus. qui eum adulabili sermone seriis admixto solus omnium proficisci pellexit vultu adsimulato saepius replicando quod flagrantibus votis eum videre frater cuperet patruelis, siquid per inprudentiam gestum est remissurus ut mitis et clemens, participemque eum suae maiestatis adscisceret, futurum laborum quoque socium, quos Arctoae provinciae diu fessae poscebant.</p>'),
(68, 12, 2, 'Quod si rectum statuerimus vel concedere', 'Illud tamen te esse admonitum volo, primum ut qualis es talem te esse omnes existiment ut, quantum a rerum turpitudine abes, tantum te a verborum libertate seiungas; deinde ut ea in alterum ne dicas, quae cum tibi falso responsa sint, erubescas. Quis est enim, cui via ista non pateat, qui isti aetati atque etiam isti dignitati non possit quam velit petulanter, etiamsi sine ulla suspicione, at non sine argumento male dicere? Sed istarum partium culpa est eorum, qui te agere voluerunt; laus pudoris tui, quod ea te invitum dicere videbamus, ingenii, quod ornate politeque dixisti.', '<p>Nec vox accusatoris ulla licet subditicii in his malorum quaerebatur acervis ut saltem specie tenus crimina praescriptis legum committerentur, quod aliquotiens fecere principes saevi: sed quicquid Caesaris implacabilitati sedisset, id velut fas iusque perpensum confestim urgebatur impleri.</p>\n<p>Illud tamen te esse admonitum volo, primum ut qualis es talem te esse omnes existiment ut, quantum a rerum turpitudine abes, tantum te a verborum libertate seiungas; deinde ut ea in alterum ne dicas, quae cum tibi falso responsa sint, erubescas. Quis est enim, cui via ista non pateat, qui isti aetati atque etiam isti dignitati non possit quam velit petulanter, etiamsi sine ulla suspicione, at non sine argumento male dicere? Sed istarum partium culpa est eorum, qui te agere voluerunt; laus pudoris tui, quod ea te invitum dicere videbamus, ingenii, quod ornate politeque dixisti.</p>\n<p>Quod si rectum statuerimus vel concedere amicis, quidquid velint, vel impetrare ab iis, quidquid velimus, perfecta quidem sapientia si simus, nihil habeat res vitii; sed loquimur de iis amicis qui ante oculos sunt, quos vidimus aut de quibus memoriam accepimus, quos novit vita communis. Ex hoc numero nobis exempla sumenda sunt, et eorum quidem maxime qui ad sapientiam proxime accedunt.</p>\n<p>Advenit post multos Scudilo Scutariorum tribunus velamento subagrestis ingenii persuasionis opifex callidus. qui eum adulabili sermone seriis admixto solus omnium proficisci pellexit vultu adsimulato saepius replicando quod flagrantibus votis eum videre frater cuperet patruelis, siquid per inprudentiam gestum est remissurus ut mitis et clemens, participemque eum suae maiestatis adscisceret, futurum laborum quoque socium, quos Arctoae provinciae diu fessae poscebant.</p>'),
(69, 12, 3, 'Quod si rectum statuerimus vel concedere', 'mg. Short description .Quod si rectum statuerimus vel concedere', 'mg. Description .Quod si rectum statuerimus vel concedere'),
(70, 12, 4, 'Quod si rectum statuerimus vel concedere', 'it. Short description .Quod si rectum statuerimus vel concedere', 'it. Description .Quod si rectum statuerimus vel concedere'),
(71, 12, 5, 'Quod si rectum statuerimus vel concedere', 'es. Short description .Quod si rectum statuerimus vel concedere', 'es. Description .Quod si rectum statuerimus vel concedere'),
(72, 12, 6, 'Quod si rectum statuerimus vel concedere', 'de. Short description .Quod si rectum statuerimus vel concedere', 'de. Description .Quod si rectum statuerimus vel concedere'),
(73, 13, 1, 'Ceteris non modo nihil ignoscendum', 'Quod cum ita sit, paucae domus studiorum seriis cultibus antea celebratae nunc ludibriis ignaviae torpentis exundant, vocali sonu, perflabili tinnitu fidium resultantes. denique pro philosopho cantor et in locum oratoris doctor artium ludicrarum accitur et bybliothecis sepulcrorum ritu in perpetuum clausis organa fabricantur hydraulica, et lyrae ad speciem carpentorum ingentes tibiaeque et histrionici gestus instrumenta non levia.', '<p>Latius iam disseminata licentia onerosus bonis omnibus Caesar nullum post haec adhibens modum orientis latera cuncta vexabat nec honoratis parcens nec urbium primatibus nec plebeiis.</p>\n<p>Cumque pertinacius ut legum gnarus accusatorem flagitaret atque sollemnia, doctus id Caesar libertatemque superbiam ratus tamquam obtrectatorem audacem excarnificari praecepit, qui ita evisceratus ut cruciatibus membra deessent, inplorans caelo iustitiam, torvum renidens fundato pectore mansit inmobilis nec se incusare nec quemquam alium passus et tandem nec confessus nec confutatus cum abiecto consorte poenali est morte multatus. et ducebatur intrepidus temporum iniquitati insultans, imitatus Zenonem illum veterem Stoicum qui ut mentiretur quaedam laceratus diutius, avulsam sedibus linguam suam cum cruento sputamine in oculos interrogantis Cyprii regis inpegit.</p>\n<p>Denique Antiochensis ordinis vertices sub uno elogio iussit occidi ideo efferatus, quod ei celebrari vilitatem intempestivam urgenti, cum inpenderet inopia, gravius rationabili responderunt; et perissent ad unum ni comes orientis tunc Honoratus fixa constantia restitisset.</p>\n<p>Exsistit autem hoc loco quaedam quaestio subdifficilis, num quando amici novi, digni amicitia, veteribus sint anteponendi, ut equis vetulis teneros anteponere solemus. Indigna homine dubitatio! Non enim debent esse amicitiarum sicut aliarum rerum satietates; veterrima quaeque, ut ea vina, quae vetustatem ferunt, esse debet suavissima; verumque illud est, quod dicitur, multos modios salis simul edendos esse, ut amicitiae munus expletum sit.</p>'),
(74, 13, 2, 'Ceteris non modo nihil ignoscendum', 'Quod cum ita sit, paucae domus studiorum seriis cultibus antea celebratae nunc ludibriis ignaviae torpentis exundant, vocali sonu, perflabili tinnitu fidium resultantes. denique pro philosopho cantor et in locum oratoris doctor artium ludicrarum accitur et bybliothecis sepulcrorum ritu in perpetuum clausis organa fabricantur hydraulica, et lyrae ad speciem carpentorum ingentes tibiaeque et histrionici gestus instrumenta non levia.', '<p>Latius iam disseminata licentia onerosus bonis omnibus Caesar nullum post haec adhibens modum orientis latera cuncta vexabat nec honoratis parcens nec urbium primatibus nec plebeiis.</p>\n<p>Cumque pertinacius ut legum gnarus accusatorem flagitaret atque sollemnia, doctus id Caesar libertatemque superbiam ratus tamquam obtrectatorem audacem excarnificari praecepit, qui ita evisceratus ut cruciatibus membra deessent, inplorans caelo iustitiam, torvum renidens fundato pectore mansit inmobilis nec se incusare nec quemquam alium passus et tandem nec confessus nec confutatus cum abiecto consorte poenali est morte multatus. et ducebatur intrepidus temporum iniquitati insultans, imitatus Zenonem illum veterem Stoicum qui ut mentiretur quaedam laceratus diutius, avulsam sedibus linguam suam cum cruento sputamine in oculos interrogantis Cyprii regis inpegit.</p>\n<p>Denique Antiochensis ordinis vertices sub uno elogio iussit occidi ideo efferatus, quod ei celebrari vilitatem intempestivam urgenti, cum inpenderet inopia, gravius rationabili responderunt; et perissent ad unum ni comes orientis tunc Honoratus fixa constantia restitisset.</p>\n<p>Exsistit autem hoc loco quaedam quaestio subdifficilis, num quando amici novi, digni amicitia, veteribus sint anteponendi, ut equis vetulis teneros anteponere solemus. Indigna homine dubitatio! Non enim debent esse amicitiarum sicut aliarum rerum satietates; veterrima quaeque, ut ea vina, quae vetustatem ferunt, esse debet suavissima; verumque illud est, quod dicitur, multos modios salis simul edendos esse, ut amicitiae munus expletum sit.</p>'),
(75, 13, 3, 'Ceteris non modo nihil ignoscendum', 'mg. Short description .Ceteris non modo nihil ignoscendum', 'mg. Description .Ceteris non modo nihil ignoscendum'),
(76, 13, 4, 'Ceteris non modo nihil ignoscendum', 'it. Short description .Ceteris non modo nihil ignoscendum', 'it. Description .Ceteris non modo nihil ignoscendum'),
(77, 13, 5, 'Ceteris non modo nihil ignoscendum', 'es. Short description .Ceteris non modo nihil ignoscendum', 'es. Description .Ceteris non modo nihil ignoscendum'),
(78, 13, 6, 'Ceteris non modo nihil ignoscendum', 'de. Short description .Ceteris non modo nihil ignoscendum', 'de. Description .Ceteris non modo nihil ignoscendum'),
(79, 14, 1, 'Hoc inmaturo interitu ipse quoque', 'Hoc inmaturo interitu ipse quoque sui pertaesus excessit e vita aetatis nono anno atque vicensimo cum quadriennio imperasset. natus apud Tuscos in Massa Veternensi, patre Constantio Constantini fratre imperatoris, matreque Galla sorore Rufini et Cerealis, quos trabeae consulares nobilitarunt et praefecturae.', '<p>Hinc ille commotus ut iniusta perferens et indigna praefecti custodiam protectoribus mandaverat fidis. quo conperto Montius tunc quaestor acer quidem sed ad lenitatem propensior, consulens in commune advocatos palatinarum primos scholarum adlocutus est mollius docens nec decere haec fieri nec prodesse addensque vocis obiurgatorio sonu quod si id placeret, post statuas Constantii deiectas super adimenda vita praefecto conveniet securius cogitari.</p>\n<p>Hoc inmaturo interitu ipse quoque sui pertaesus excessit e vita aetatis nono anno atque vicensimo cum quadriennio imperasset. natus apud Tuscos in Massa Veternensi, patre Constantio Constantini fratre imperatoris, matreque Galla sorore Rufini et Cerealis, quos trabeae consulares nobilitarunt et praefecturae.</p>\n<p>Ut enim quisque sibi plurimum confidit et ut quisque maxime virtute et sapientia sic munitus est, ut nullo egeat suaque omnia in se ipso posita iudicet, ita in amicitiis expetendis colendisque maxime excellit. Quid enim? Africanus indigens mei? Minime hercule! ac ne ego quidem illius; sed ego admiratione quadam virtutis eius, ille vicissim opinione fortasse non nulla, quam de meis moribus habebat, me dilexit; auxit benevolentiam consuetudo. Sed quamquam utilitates multae et magnae consecutae sunt, non sunt tamen ab earum spe causae diligendi profectae.</p>\n<p>Tempore quo primis auspiciis in mundanum fulgorem surgeret victura dum erunt homines Roma, ut augeretur sublimibus incrementis, foedere pacis aeternae Virtus convenit atque Fortuna plerumque dissidentes, quarum si altera defuisset, ad perfectam non venerat summitatem.</p>'),
(80, 14, 2, 'Hoc inmaturo interitu ipse quoque', 'Hoc inmaturo interitu ipse quoque sui pertaesus excessit e vita aetatis nono anno atque vicensimo cum quadriennio imperasset. natus apud Tuscos in Massa Veternensi, patre Constantio Constantini fratre imperatoris, matreque Galla sorore Rufini et Cerealis, quos trabeae consulares nobilitarunt et praefecturae.', '<p>Hinc ille commotus ut iniusta perferens et indigna praefecti custodiam protectoribus mandaverat fidis. quo conperto Montius tunc quaestor acer quidem sed ad lenitatem propensior, consulens in commune advocatos palatinarum primos scholarum adlocutus est mollius docens nec decere haec fieri nec prodesse addensque vocis obiurgatorio sonu quod si id placeret, post statuas Constantii deiectas super adimenda vita praefecto conveniet securius cogitari.</p>\n<p>Hoc inmaturo interitu ipse quoque sui pertaesus excessit e vita aetatis nono anno atque vicensimo cum quadriennio imperasset. natus apud Tuscos in Massa Veternensi, patre Constantio Constantini fratre imperatoris, matreque Galla sorore Rufini et Cerealis, quos trabeae consulares nobilitarunt et praefecturae.</p>\n<p>Ut enim quisque sibi plurimum confidit et ut quisque maxime virtute et sapientia sic munitus est, ut nullo egeat suaque omnia in se ipso posita iudicet, ita in amicitiis expetendis colendisque maxime excellit. Quid enim? Africanus indigens mei? Minime hercule! ac ne ego quidem illius; sed ego admiratione quadam virtutis eius, ille vicissim opinione fortasse non nulla, quam de meis moribus habebat, me dilexit; auxit benevolentiam consuetudo. Sed quamquam utilitates multae et magnae consecutae sunt, non sunt tamen ab earum spe causae diligendi profectae.</p>\n<p>Tempore quo primis auspiciis in mundanum fulgorem surgeret victura dum erunt homines Roma, ut augeretur sublimibus incrementis, foedere pacis aeternae Virtus convenit atque Fortuna plerumque dissidentes, quarum si altera defuisset, ad perfectam non venerat summitatem.</p>'),
(81, 14, 3, 'Hoc inmaturo interitu ipse quoque', 'mg. Short description .Hoc inmaturo interitu ipse quoque', 'mg. Description .Hoc inmaturo interitu ipse quoque'),
(82, 14, 4, 'Hoc inmaturo interitu ipse quoque', 'it. Short description .Hoc inmaturo interitu ipse quoque', 'it. Description .Hoc inmaturo interitu ipse quoque'),
(83, 14, 5, 'Hoc inmaturo interitu ipse quoque', 'es. Short description .Hoc inmaturo interitu ipse quoque', 'es. Description .Hoc inmaturo interitu ipse quoque'),
(84, 14, 6, 'Hoc inmaturo interitu ipse quoque', 'de. Short description .Hoc inmaturo interitu ipse quoque', 'de. Description .Hoc inmaturo interitu ipse quoque'),
(85, 15, 1, 'Denique Antiochensis ordinis vertices sub', 'Cumque pertinacius ut legum gnarus accusatorem flagitaret atque sollemnia, doctus id Caesar libertatemque superbiam ratus tamquam obtrectatorem audacem excarnificari praecepit, qui ita evisceratus ut cruciatibus membra deessent, inplorans caelo iustitiam, torvum renidens fundato pectore mansit inmobilis nec se incusare nec quemquam alium passus et tandem nec confessus nec confutatus cum abiecto consorte poenali est morte multatus. et ducebatur intrepidus temporum iniquitati insultans, imitatus Zenonem illum veterem Stoicum qui ut mentiretur quaedam laceratus diutius, avulsam sedibus linguam suam cum cruento sputamine in oculos interrogantis Cyprii regis inpegit.', '<p>Denique Antiochensis ordinis vertices sub uno elogio iussit occidi ideo efferatus, quod ei celebrari vilitatem intempestivam urgenti, cum inpenderet inopia, gravius rationabili responderunt; et perissent ad unum ni comes orientis tunc Honoratus fixa constantia restitisset.</p>\n<p>Exsistit autem hoc loco quaedam quaestio subdifficilis, num quando amici novi, digni amicitia, veteribus sint anteponendi, ut equis vetulis teneros anteponere solemus. Indigna homine dubitatio! Non enim debent esse amicitiarum sicut aliarum rerum satietates; veterrima quaeque, ut ea vina, quae vetustatem ferunt, esse debet suavissima; verumque illud est, quod dicitur, multos modios salis simul edendos esse, ut amicitiae munus expletum sit.</p>\n<p>Quaestione igitur per multiplices dilatata fortunas cum ambigerentur quaedam, non nulla levius actitata constaret, post multorum clades Apollinares ambo pater et filius in exilium acti cum ad locum Crateras nomine pervenissent, villam scilicet suam quae ab Antiochia vicensimo et quarto disiungitur lapide, ut mandatum est, fractis cruribus occiduntur.</p>\n<p>Hinc ille commotus ut iniusta perferens et indigna praefecti custodiam protectoribus mandaverat fidis. quo conperto Montius tunc quaestor acer quidem sed ad lenitatem propensior, consulens in commune advocatos palatinarum primos scholarum adlocutus est mollius docens nec decere haec fieri nec prodesse addensque vocis obiurgatorio sonu quod si id placeret, post statuas Constantii deiectas super adimenda vita praefecto conveniet securius cogitari.</p>\n<p>Hoc inmaturo interitu ipse quoque sui pertaesus excessit e vita aetatis nono anno atque vicensimo cum quadriennio imperasset. natus apud Tuscos in Massa Veternensi, patre Constantio Constantini fratre imperatoris, matreque Galla sorore Rufini et Cerealis, quos trabeae consulares nobilitarunt et praefecturae.</p>\n<p>Ut enim quisque sibi plurimum confidit et ut quisque maxime virtute et sapientia sic munitus est, ut nullo egeat suaque omnia in se ipso posita iudicet, ita in amicitiis expetendis colendisque maxime excellit. Quid enim? Africanus indigens mei? Minime hercule! ac ne ego quidem illius; sed ego admiratione quadam virtutis eius, ille vicissim opinione fortasse non nulla, quam de meis moribus habebat, me dilexit; auxit benevolentiam consuetudo. Sed quamquam utilitates multae et magnae consecutae sunt, non sunt tamen ab earum spe causae diligendi profectae.</p>\n<p>Tempore quo primis auspiciis in mundanum fulgorem surgeret victura dum erunt homines Roma, ut augeretur sublimibus incrementis, foedere pacis aeternae Virtus convenit atque Fortuna plerumque dissidentes, quarum si altera defuisset, ad perfectam non venerat summitatem.</p>'),
(86, 15, 2, 'Denique Antiochensis ordinis vertices sub', 'Cumque pertinacius ut legum gnarus accusatorem flagitaret atque sollemnia, doctus id Caesar libertatemque superbiam ratus tamquam obtrectatorem audacem excarnificari praecepit, qui ita evisceratus ut cruciatibus membra deessent, inplorans caelo iustitiam, torvum renidens fundato pectore mansit inmobilis nec se incusare nec quemquam alium passus et tandem nec confessus nec confutatus cum abiecto consorte poenali est morte multatus. et ducebatur intrepidus temporum iniquitati insultans, imitatus Zenonem illum veterem Stoicum qui ut mentiretur quaedam laceratus diutius, avulsam sedibus linguam suam cum cruento sputamine in oculos interrogantis Cyprii regis inpegit.', '<p>Denique Antiochensis ordinis vertices sub uno elogio iussit occidi ideo efferatus, quod ei celebrari vilitatem intempestivam urgenti, cum inpenderet inopia, gravius rationabili responderunt; et perissent ad unum ni comes orientis tunc Honoratus fixa constantia restitisset.</p>\n<p>Exsistit autem hoc loco quaedam quaestio subdifficilis, num quando amici novi, digni amicitia, veteribus sint anteponendi, ut equis vetulis teneros anteponere solemus. Indigna homine dubitatio! Non enim debent esse amicitiarum sicut aliarum rerum satietates; veterrima quaeque, ut ea vina, quae vetustatem ferunt, esse debet suavissima; verumque illud est, quod dicitur, multos modios salis simul edendos esse, ut amicitiae munus expletum sit.</p>\n<p>Quaestione igitur per multiplices dilatata fortunas cum ambigerentur quaedam, non nulla levius actitata constaret, post multorum clades Apollinares ambo pater et filius in exilium acti cum ad locum Crateras nomine pervenissent, villam scilicet suam quae ab Antiochia vicensimo et quarto disiungitur lapide, ut mandatum est, fractis cruribus occiduntur.</p>\n<p>Hinc ille commotus ut iniusta perferens et indigna praefecti custodiam protectoribus mandaverat fidis. quo conperto Montius tunc quaestor acer quidem sed ad lenitatem propensior, consulens in commune advocatos palatinarum primos scholarum adlocutus est mollius docens nec decere haec fieri nec prodesse addensque vocis obiurgatorio sonu quod si id placeret, post statuas Constantii deiectas super adimenda vita praefecto conveniet securius cogitari.</p>\n<p>Hoc inmaturo interitu ipse quoque sui pertaesus excessit e vita aetatis nono anno atque vicensimo cum quadriennio imperasset. natus apud Tuscos in Massa Veternensi, patre Constantio Constantini fratre imperatoris, matreque Galla sorore Rufini et Cerealis, quos trabeae consulares nobilitarunt et praefecturae.</p>\n<p>Ut enim quisque sibi plurimum confidit et ut quisque maxime virtute et sapientia sic munitus est, ut nullo egeat suaque omnia in se ipso posita iudicet, ita in amicitiis expetendis colendisque maxime excellit. Quid enim? Africanus indigens mei? Minime hercule! ac ne ego quidem illius; sed ego admiratione quadam virtutis eius, ille vicissim opinione fortasse non nulla, quam de meis moribus habebat, me dilexit; auxit benevolentiam consuetudo. Sed quamquam utilitates multae et magnae consecutae sunt, non sunt tamen ab earum spe causae diligendi profectae.</p>\n<p>Tempore quo primis auspiciis in mundanum fulgorem surgeret victura dum erunt homines Roma, ut augeretur sublimibus incrementis, foedere pacis aeternae Virtus convenit atque Fortuna plerumque dissidentes, quarum si altera defuisset, ad perfectam non venerat summitatem.</p>'),
(87, 15, 3, 'Denique Antiochensis ordinis vertices sub', 'mg. Short description .Denique Antiochensis ordinis vertices sub', 'mg. Description .Denique Antiochensis ordinis vertices sub'),
(88, 15, 4, 'Denique Antiochensis ordinis vertices sub', 'it. Short description .Denique Antiochensis ordinis vertices sub', 'it. Description .Denique Antiochensis ordinis vertices sub'),
(89, 15, 5, 'Denique Antiochensis ordinis vertices sub', 'es. Short description .Denique Antiochensis ordinis vertices sub', 'es. Description .Denique Antiochensis ordinis vertices sub'),
(90, 15, 6, 'Denique Antiochensis ordinis vertices sub', 'de. Short description .Denique Antiochensis ordinis vertices sub', 'de. Description .Denique Antiochensis ordinis vertices sub'),
(91, 16, 1, 'Haec igitur Epicuri non probo', 'Eodem tempore etiam Hymetii praeclarae indolis viri negotium est actitatum, cuius hunc novimus esse textum. cum Africam pro consule regeret Carthaginiensibus victus inopia iam lassatis, ex horreis Romano populo destinatis frumentum dedit, pauloque postea cum provenisset segetum copia, integre sine ulla restituit mora.', '<p>Haec igitur Epicuri non probo, inquam. De cetero vellem equidem aut ipse doctrinis fuisset instructior est enim, quod tibi ita videri necesse est, non satis politus iis artibus, quas qui tenent, eruditi appellantur aut ne deterruisset alios a studiis. quamquam te quidem video minime esse deterritum.</p>\n<p>Eodem tempore etiam Hymetii praeclarae indolis viri negotium est actitatum, cuius hunc novimus esse textum. cum Africam pro consule regeret Carthaginiensibus victus inopia iam lassatis, ex horreis Romano populo destinatis frumentum dedit, pauloque postea cum provenisset segetum copia, integre sine ulla restituit mora.</p>\n<p>Inter quos Paulus eminebat notarius ortus in Hispania, glabro quidam sub vultu latens, odorandi vias periculorum occultas perquam sagax. is in Brittanniam missus ut militares quosdam perduceret ausos conspirasse Magnentio, cum reniti non possent, iussa licentius supergressus fluminis modo fortunis conplurium sese repentinus infudit et ferebatur per strages multiplices ac ruinas, vinculis membra ingenuorum adfligens et quosdam obterens manicis, crimina scilicet multa consarcinando a veritate longe discreta. unde admissum est facinus impium, quod Constanti tempus nota inusserat sempiterna.</p>\n<p>Inter quos Paulus eminebat notarius ortus in Hispania, glabro quidam sub vultu latens, odorandi vias periculorum occultas perquam sagax. is in Brittanniam missus ut militares quosdam perduceret ausos conspirasse Magnentio, cum reniti non possent, iussa licentius supergressus fluminis modo fortunis conplurium sese repentinus infudit et ferebatur per strages multiplices ac ruinas, vinculis membra ingenuorum adfligens et quosdam obterens manicis, crimina scilicet multa consarcinando a veritate longe discreta. unde admissum est facinus impium, quod Constanti tempus nota inusserat sempiterna.</p>\n<p>Illud tamen clausos vehementer angebat quod captis navigiis, quae frumenta vehebant per flumen, Isauri quidem alimentorum copiis adfluebant, ipsi vero solitarum rerum cibos iam consumendo inediae propinquantis aerumnas exitialis horrebant.</p>'),
(92, 16, 2, 'Haec igitur Epicuri non probo', 'Eodem tempore etiam Hymetii praeclarae indolis viri negotium est actitatum, cuius hunc novimus esse textum. cum Africam pro consule regeret Carthaginiensibus victus inopia iam lassatis, ex horreis Romano populo destinatis frumentum dedit, pauloque postea cum provenisset segetum copia, integre sine ulla restituit mora.', '<p>Haec igitur Epicuri non probo, inquam. De cetero vellem equidem aut ipse doctrinis fuisset instructior est enim, quod tibi ita videri necesse est, non satis politus iis artibus, quas qui tenent, eruditi appellantur aut ne deterruisset alios a studiis. quamquam te quidem video minime esse deterritum.</p>\n<p>Eodem tempore etiam Hymetii praeclarae indolis viri negotium est actitatum, cuius hunc novimus esse textum. cum Africam pro consule regeret Carthaginiensibus victus inopia iam lassatis, ex horreis Romano populo destinatis frumentum dedit, pauloque postea cum provenisset segetum copia, integre sine ulla restituit mora.</p>\n<p>Inter quos Paulus eminebat notarius ortus in Hispania, glabro quidam sub vultu latens, odorandi vias periculorum occultas perquam sagax. is in Brittanniam missus ut militares quosdam perduceret ausos conspirasse Magnentio, cum reniti non possent, iussa licentius supergressus fluminis modo fortunis conplurium sese repentinus infudit et ferebatur per strages multiplices ac ruinas, vinculis membra ingenuorum adfligens et quosdam obterens manicis, crimina scilicet multa consarcinando a veritate longe discreta. unde admissum est facinus impium, quod Constanti tempus nota inusserat sempiterna.</p>\n<p>Inter quos Paulus eminebat notarius ortus in Hispania, glabro quidam sub vultu latens, odorandi vias periculorum occultas perquam sagax. is in Brittanniam missus ut militares quosdam perduceret ausos conspirasse Magnentio, cum reniti non possent, iussa licentius supergressus fluminis modo fortunis conplurium sese repentinus infudit et ferebatur per strages multiplices ac ruinas, vinculis membra ingenuorum adfligens et quosdam obterens manicis, crimina scilicet multa consarcinando a veritate longe discreta. unde admissum est facinus impium, quod Constanti tempus nota inusserat sempiterna.</p>\n<p>Illud tamen clausos vehementer angebat quod captis navigiis, quae frumenta vehebant per flumen, Isauri quidem alimentorum copiis adfluebant, ipsi vero solitarum rerum cibos iam consumendo inediae propinquantis aerumnas exitialis horrebant.</p>'),
(93, 16, 3, 'Haec igitur Epicuri non probo', 'mg. Short description .Haec igitur Epicuri non probo', 'mg. Description .Haec igitur Epicuri non probo'),
(94, 16, 4, 'Haec igitur Epicuri non probo', 'it. Short description .Haec igitur Epicuri non probo', 'it. Description .Haec igitur Epicuri non probo'),
(95, 16, 5, 'Haec igitur Epicuri non probo', 'es. Short description .Haec igitur Epicuri non probo', 'es. Description .Haec igitur Epicuri non probo'),
(96, 16, 6, 'Haec igitur Epicuri non probo', 'de. Short description .Haec igitur Epicuri non probo', 'de. Description .Haec igitur Epicuri non probo'),
(97, 17, 1, 'Institut Supérieur des Paramédicaux Novateurs de Madagascar', 'fr. Short description .Institut Supérieur des Paramédicaux Novateurs de Madagascar', 'fr. Description .Institut Supérieur des Paramédicaux Novateurs de Madagascar'),
(98, 17, 2, 'Institut Supérieur des Paramédicaux Novateurs de Madagascar', 'en. Short description .Institut Supérieur des Paramédicaux Novateurs de Madagascar', 'en. Description .Institut Supérieur des Paramédicaux Novateurs de Madagascar'),
(99, 17, 3, 'Institut Supérieur des Paramédicaux Novateurs de Madagascar', 'mg. Short description .Institut Supérieur des Paramédicaux Novateurs de Madagascar', 'mg. Description .Institut Supérieur des Paramédicaux Novateurs de Madagascar'),
(100, 17, 4, 'Institut Supérieur des Paramédicaux Novateurs de Madagascar', 'it. Short description .Institut Supérieur des Paramédicaux Novateurs de Madagascar', 'it. Description .Institut Supérieur des Paramédicaux Novateurs de Madagascar'),
(101, 17, 5, 'Institut Supérieur des Paramédicaux Novateurs de Madagascar', 'es. Short description .Institut Supérieur des Paramédicaux Novateurs de Madagascar', 'es. Description .Institut Supérieur des Paramédicaux Novateurs de Madagascar'),
(102, 17, 6, 'Institut Supérieur des Paramédicaux Novateurs de Madagascar', 'de. Short description .Institut Supérieur des Paramédicaux Novateurs de Madagascar', 'de. Description .Institut Supérieur des Paramédicaux Novateurs de Madagascar'),
(103, 18, 1, 'Pandente itaque viam fatorum', 'fr. Short description .Pandente itaque viam fatorum', 'fr. Description .Pandente itaque viam fatorum'),
(104, 18, 2, 'Pandente itaque viam fatorum', 'en. Short description .Pandente itaque viam fatorum', 'en. Description .Pandente itaque viam fatorum'),
(105, 18, 3, 'Pandente itaque viam fatorum', 'mg. Short description .Pandente itaque viam fatorum', 'mg. Description .Pandente itaque viam fatorum'),
(106, 18, 4, 'Pandente itaque viam fatorum', 'it. Short description .Pandente itaque viam fatorum', 'it. Description .Pandente itaque viam fatorum'),
(107, 18, 5, 'Pandente itaque viam fatorum', 'es. Short description .Pandente itaque viam fatorum', 'es. Description .Pandente itaque viam fatorum'),
(108, 18, 6, 'Pandente itaque viam fatorum', 'de. Short description .Pandente itaque viam fatorum', 'de. Description .Pandente itaque viam fatorum'),
(109, 19, 1, 'Raptimp roperantes ut igitur', 'fr. Short description .Raptimp roperantes ut igitur', 'fr. Description .Raptimp roperantes ut igitur'),
(110, 19, 2, 'Raptimp roperantes ut igitur', 'en. Short description .Raptimp roperantes ut igitur', 'en. Description .Raptimp roperantes ut igitur'),
(111, 19, 3, 'Raptimp roperantes ut igitur', 'mg. Short description .Raptimp roperantes ut igitur', 'mg. Description .Raptimp roperantes ut igitur'),
(112, 19, 4, 'Raptimp roperantes ut igitur', 'it. Short description .Raptimp roperantes ut igitur', 'it. Description .Raptimp roperantes ut igitur'),
(113, 19, 5, 'Raptimp roperantes ut igitur', 'es. Short description .Raptimp roperantes ut igitur', 'es. Description .Raptimp roperantes ut igitur'),
(114, 19, 6, 'Raptimp roperantes ut igitur', 'de. Short description .Raptimp roperantes ut igitur', 'de. Description .Raptimp roperantes ut igitur'),
(115, 20, 1, 'Quam quidem partem accusationis admiratus', 'fr. Short description .Quam quidem partem accusationis admiratus', 'fr. Description .Quam quidem partem accusationis admiratus'),
(116, 20, 2, 'Quam quidem partem accusationis admiratus', 'en. Short description .Quam quidem partem accusationis admiratus', 'en. Description .Quam quidem partem accusationis admiratus'),
(117, 20, 3, 'Quam quidem partem accusationis admiratus', 'mg. Short description .Quam quidem partem accusationis admiratus', 'mg. Description .Quam quidem partem accusationis admiratus'),
(118, 20, 4, 'Quam quidem partem accusationis admiratus', 'it. Short description .Quam quidem partem accusationis admiratus', 'it. Description .Quam quidem partem accusationis admiratus'),
(119, 20, 5, 'Quam quidem partem accusationis admiratus', 'es. Short description .Quam quidem partem accusationis admiratus', 'es. Description .Quam quidem partem accusationis admiratus'),
(120, 20, 6, 'Quam quidem partem accusationis admiratus', 'de. Short description .Quam quidem partem accusationis admiratus', 'de. Description .Quam quidem partem accusationis admiratus'),
(121, 21, 1, 'Restabat ut Caesar post haec properaret', 'fr. Short description .Restabat ut Caesar post haec properaret', 'fr. Description .Restabat ut Caesar post haec properaret'),
(122, 21, 2, 'Restabat ut Caesar post haec properaret', 'en. Short description .Restabat ut Caesar post haec properaret', 'en. Description .Restabat ut Caesar post haec properaret'),
(123, 21, 3, 'Restabat ut Caesar post haec properaret', 'mg. Short description .Restabat ut Caesar post haec properaret', 'mg. Description .Restabat ut Caesar post haec properaret'),
(124, 21, 4, 'Restabat ut Caesar post haec properaret', 'it. Short description .Restabat ut Caesar post haec properaret', 'it. Description .Restabat ut Caesar post haec properaret'),
(125, 21, 5, 'Restabat ut Caesar post haec properaret', 'es. Short description .Restabat ut Caesar post haec properaret', 'es. Description .Restabat ut Caesar post haec properaret'),
(126, 21, 6, 'Restabat ut Caesar post haec properaret', 'de. Short description .Restabat ut Caesar post haec properaret', 'de. Description .Restabat ut Caesar post haec properaret'),
(127, 22, 1, 'Caenos Gallicanos appellatur', 'fr. Short description .Caenos Gallicanos appellatur', 'fr. Description .Caenos Gallicanos appellatur'),
(128, 22, 2, 'Caenos Gallicanos appellatur', 'en. Short description .Caenos Gallicanos appellatur', 'en. Description .Caenos Gallicanos appellatur'),
(129, 22, 3, 'Caenos Gallicanos appellatur', 'mg. Short description .Caenos Gallicanos appellatur', 'mg. Description .Caenos Gallicanos appellatur'),
(130, 22, 4, 'Caenos Gallicanos appellatur', 'it. Short description .Caenos Gallicanos appellatur', 'it. Description .Caenos Gallicanos appellatur'),
(131, 22, 5, 'Caenos Gallicanos appellatur', 'es. Short description .Caenos Gallicanos appellatur', 'es. Description .Caenos Gallicanos appellatur'),
(132, 22, 6, 'Caenos Gallicanos appellatur', 'de. Short description .Caenos Gallicanos appellatur', 'de. Description .Caenos Gallicanos appellatur'),
(133, 23, 1, 'Verum ad istam omnem orationem', 'fr. Short description .Verum ad istam omnem orationem', 'fr. Description .Verum ad istam omnem orationem'),
(134, 23, 2, 'Verum ad istam omnem orationem', 'en. Short description .Verum ad istam omnem orationem', 'en. Description .Verum ad istam omnem orationem'),
(135, 23, 3, 'Verum ad istam omnem orationem', 'mg. Short description .Verum ad istam omnem orationem', 'mg. Description .Verum ad istam omnem orationem');
INSERT INTO `sl_school_translate` (`id`, `school_id`, `locale_id`, `name`, `short_description`, `description`) VALUES
(136, 23, 4, 'Verum ad istam omnem orationem', 'it. Short description .Verum ad istam omnem orationem', 'it. Description .Verum ad istam omnem orationem'),
(137, 23, 5, 'Verum ad istam omnem orationem', 'es. Short description .Verum ad istam omnem orationem', 'es. Description .Verum ad istam omnem orationem'),
(138, 23, 6, 'Verum ad istam omnem orationem', 'de. Short description .Verum ad istam omnem orationem', 'de. Description .Verum ad istam omnem orationem'),
(139, 24, 1, 'Thalassius vero ea tempestate praefectus', 'Quibus occurrere bene pertinax miles explicatis ordinibus parans hastisque feriens scuta qui habitus iram pugnantium concitat et dolorem proximos iam gestu terrebat sed eum in certamen alacriter consurgentem revocavere ductores rati intempestivum anceps subire certamen cum haut longe muri distarent, quorum tutela securitas poterat in solido locari cunctorum.', '<p>Constituendi autem sunt qui sint in amicitia fines et quasi termini diligendi. De quibus tres video sententias ferri, quarum nullam probo, unam, ut eodem modo erga amicum adfecti simus, quo erga nosmet ipsos, alteram, ut nostra in amicos benevolentia illorum erga nos benevolentiae pariter aequaliterque respondeat, tertiam, ut, quanti quisque se ipse facit, tanti fiat ab amicis.</p>\n<p>Quibus occurrere bene pertinax miles explicatis ordinibus parans hastisque feriens scuta qui habitus iram pugnantium concitat et dolorem proximos iam gestu terrebat sed eum in certamen alacriter consurgentem revocavere ductores rati intempestivum anceps subire certamen cum haut longe muri distarent, quorum tutela securitas poterat in solido locari cunctorum.</p>\n<p>Quapropter a natura mihi videtur potius quam ab indigentia orta amicitia, applicatione magis animi cum quodam sensu amandi quam cogitatione quantum illa res utilitatis esset habitura. Quod quidem quale sit, etiam in bestiis quibusdam animadverti potest, quae ex se natos ita amant ad quoddam tempus et ab eis ita amantur ut facile earum sensus appareat. Quod in homine multo est evidentius, primum ex ea caritate quae est inter natos et parentes, quae dirimi nisi detestabili scelere non potest; deinde cum similis sensus exstitit amoris, si aliquem nacti sumus cuius cum moribus et natura congruamus, quod in eo quasi lumen aliquod probitatis et virtutis perspicere videamur.</p>\n<p>Sed laeditur hic coetuum magnificus splendor levitate paucorum incondita, ubi nati sunt non reputantium, sed tamquam indulta licentia vitiis ad errores lapsorum ac lasciviam. ut enim Simonides lyricus docet, beate perfecta ratione vieturo ante alia patriam esse convenit gloriosam.</p>\n<p>Incenderat autem audaces usque ad insaniam homines ad haec, quae nefariis egere conatibus, Luscus quidam curator urbis subito visus: eosque ut heiulans baiolorum praecentor ad expediendum quod orsi sunt incitans vocibus crebris. qui haut longe postea ideo vivus exustus est.</p>'),
(140, 24, 2, 'Thalassius vero ea tempestate praefectus', 'Quibus occurrere bene pertinax miles explicatis ordinibus parans hastisque feriens scuta qui habitus iram pugnantium concitat et dolorem proximos iam gestu terrebat sed eum in certamen alacriter consurgentem revocavere ductores rati intempestivum anceps subire certamen cum haut longe muri distarent, quorum tutela securitas poterat in solido locari cunctorum.', '<p>Constituendi autem sunt qui sint in amicitia fines et quasi termini diligendi. De quibus tres video sententias ferri, quarum nullam probo, unam, ut eodem modo erga amicum adfecti simus, quo erga nosmet ipsos, alteram, ut nostra in amicos benevolentia illorum erga nos benevolentiae pariter aequaliterque respondeat, tertiam, ut, quanti quisque se ipse facit, tanti fiat ab amicis.</p>\n<p>Quibus occurrere bene pertinax miles explicatis ordinibus parans hastisque feriens scuta qui habitus iram pugnantium concitat et dolorem proximos iam gestu terrebat sed eum in certamen alacriter consurgentem revocavere ductores rati intempestivum anceps subire certamen cum haut longe muri distarent, quorum tutela securitas poterat in solido locari cunctorum.</p>\n<p>Quapropter a natura mihi videtur potius quam ab indigentia orta amicitia, applicatione magis animi cum quodam sensu amandi quam cogitatione quantum illa res utilitatis esset habitura. Quod quidem quale sit, etiam in bestiis quibusdam animadverti potest, quae ex se natos ita amant ad quoddam tempus et ab eis ita amantur ut facile earum sensus appareat. Quod in homine multo est evidentius, primum ex ea caritate quae est inter natos et parentes, quae dirimi nisi detestabili scelere non potest; deinde cum similis sensus exstitit amoris, si aliquem nacti sumus cuius cum moribus et natura congruamus, quod in eo quasi lumen aliquod probitatis et virtutis perspicere videamur.</p>\n<p>Sed laeditur hic coetuum magnificus splendor levitate paucorum incondita, ubi nati sunt non reputantium, sed tamquam indulta licentia vitiis ad errores lapsorum ac lasciviam. ut enim Simonides lyricus docet, beate perfecta ratione vieturo ante alia patriam esse convenit gloriosam.</p>\n<p>Incenderat autem audaces usque ad insaniam homines ad haec, quae nefariis egere conatibus, Luscus quidam curator urbis subito visus: eosque ut heiulans baiolorum praecentor ad expediendum quod orsi sunt incitans vocibus crebris. qui haut longe postea ideo vivus exustus est.</p>'),
(141, 24, 3, 'Thalassius vero ea tempestate praefectus', 'mg. Short description .Thalassius vero ea tempestate praefectus', 'mg. Description .Thalassius vero ea tempestate praefectus'),
(142, 24, 4, 'Thalassius vero ea tempestate praefectus', 'it. Short description .Thalassius vero ea tempestate praefectus', 'it. Description .Thalassius vero ea tempestate praefectus'),
(143, 24, 5, 'Thalassius vero ea tempestate praefectus', 'es. Short description .Thalassius vero ea tempestate praefectus', 'es. Description .Thalassius vero ea tempestate praefectus'),
(144, 24, 6, 'Thalassius vero ea tempestate praefectus', 'de. Short description .Thalassius vero ea tempestate praefectus', 'de. Description .Thalassius vero ea tempestate praefectus'),
(145, 25, 1, 'Fuerit toto in consulatu sine provincia', 'fr. Short description .Fuerit toto in consulatu sine provincia', 'fr. Description .Fuerit toto in consulatu sine provincia'),
(146, 25, 2, 'Fuerit toto in consulatu sine provincia', 'en. Short description .Fuerit toto in consulatu sine provincia', 'en. Description .Fuerit toto in consulatu sine provincia'),
(147, 25, 3, 'Fuerit toto in consulatu sine provincia', 'mg. Short description .Fuerit toto in consulatu sine provincia', 'mg. Description .Fuerit toto in consulatu sine provincia'),
(148, 25, 4, 'Fuerit toto in consulatu sine provincia', 'it. Short description .Fuerit toto in consulatu sine provincia', 'it. Description .Fuerit toto in consulatu sine provincia'),
(149, 25, 5, 'Fuerit toto in consulatu sine provincia', 'es. Short description .Fuerit toto in consulatu sine provincia', 'es. Description .Fuerit toto in consulatu sine provincia'),
(150, 25, 6, 'Fuerit toto in consulatu sine provincia', 'de. Short description .Fuerit toto in consulatu sine provincia', 'de. Description .Fuerit toto in consulatu sine provincia'),
(151, 26, 1, 'Quam ob rem id primum videamus', 'L’Ecole Supérieure de Management et d’Informatique Appliquée (ESMIA) est une école innovante,  jeune, dynamique,  en réseau avec plusieurs Universités, Centres de Recherche, Ecoles Privées et Publiques, ouverte aux mouvements de la société dans toute sa diversité. Elle forme des managers, dotés de solides compétences scientifiques  et techniques, de capacité d’intégration et de synthèse, de créativité et d’innovation, possédant les qualités nécessaires pour entreprendre et diriger, partager, communiquer et piloter.', '<p>Les formations propos&eacute;es &agrave; l''ESMIA sont habilit&eacute;es par l''ETAT selon l''arr&ecirc;t&eacute; minist&eacute;riel n&deg; 36.831/2013 - MESupReS du Minist&egrave;re de l''Enseignement Sup&eacute;rieur et de la Recherche Scientifique (MESupReS).<br /><br />Les dipl&ocirc;mes d&eacute;livr&eacute;s par l''ESMIA (Licence: Bacc +3 et Master: Bacc + 5) sont &eacute;galement recconus par la FOP (Fonction Publique). L''Ecole Sup&eacute;rieure de Management et d''Informatique Appliqu&eacute;e est cr&eacute;&eacute;e dans la volont&eacute; d&rsquo;offrir la m&ecirc;me chance &agrave; tous les jeunes et de les pr&eacute;parer &agrave; un meilleur avenir. Au sein de l''ESMIA,&nbsp; les &eacute;tudiants peuvent ais&eacute;ment acc&eacute;der &agrave; une formation universitaire dipl&ocirc;mante, une formation de qualit&eacute; et r&eacute;pondant aux standards internationaux.<br /><br />L&rsquo;Ecole Sup&eacute;rieure de Management et d&rsquo;Informatique Appliqu&eacute;e (ESMIA) est une &eacute;cole innovante,&nbsp; jeune, dynamique,&nbsp; en r&eacute;seau avec plusieurs Universit&eacute;s, Centres de Recherche, <br />Ecoles Priv&eacute;es et Publiques, ouverte aux mouvements de la soci&eacute;t&eacute; dans toute sa diversit&eacute;. Elle forme des managers, dot&eacute;s de solides comp&eacute;tences scientifiques&nbsp; et techniques, <br />de capacit&eacute; d&rsquo;int&eacute;gration et de synth&egrave;se, de cr&eacute;ativit&eacute; et d&rsquo;innovation, poss&eacute;dant les qualit&eacute;s n&eacute;cessaires pour entreprendre et diriger, partager, communiquer et piloter.</p>'),
(152, 26, 2, 'Quam ob rem id primum videamus', 'L’Ecole Supérieure de Management et d’Informatique Appliquée (ESMIA) est une école innovante,  jeune, dynamique,  en réseau avec plusieurs Universités, Centres de Recherche, Ecoles Privées et Publiques, ouverte aux mouvements de la société dans toute sa diversité. Elle forme des managers, dotés de solides compétences scientifiques  et techniques, de capacité d’intégration et de synthèse, de créativité et d’innovation, possédant les qualités nécessaires pour entreprendre et diriger, partager, communiquer et piloter.', '<p>Les formations propos&eacute;es &agrave; l''ESMIA sont habilit&eacute;es par l''ETAT selon l''arr&ecirc;t&eacute; minist&eacute;riel n&deg; 36.831/2013 - MESupReS du Minist&egrave;re de l''Enseignement Sup&eacute;rieur et de la Recherche Scientifique (MESupReS).<br /><br />Les dipl&ocirc;mes d&eacute;livr&eacute;s par l''ESMIA (Licence: Bacc +3 et Master: Bacc + 5) sont &eacute;galement recconus par la FOP (Fonction Publique). L''Ecole Sup&eacute;rieure de Management et d''Informatique Appliqu&eacute;e est cr&eacute;&eacute;e dans la volont&eacute; d&rsquo;offrir la m&ecirc;me chance &agrave; tous les jeunes et de les pr&eacute;parer &agrave; un meilleur avenir. Au sein de l''ESMIA,&nbsp; les &eacute;tudiants peuvent ais&eacute;ment acc&eacute;der &agrave; une formation universitaire dipl&ocirc;mante, une formation de qualit&eacute; et r&eacute;pondant aux standards internationaux.<br /><br />L&rsquo;Ecole Sup&eacute;rieure de Management et d&rsquo;Informatique Appliqu&eacute;e (ESMIA) est une &eacute;cole innovante,&nbsp; jeune, dynamique,&nbsp; en r&eacute;seau avec plusieurs Universit&eacute;s, Centres de Recherche, <br />Ecoles Priv&eacute;es et Publiques, ouverte aux mouvements de la soci&eacute;t&eacute; dans toute sa diversit&eacute;. Elle forme des managers, dot&eacute;s de solides comp&eacute;tences scientifiques&nbsp; et techniques, <br />de capacit&eacute; d&rsquo;int&eacute;gration et de synth&egrave;se, de cr&eacute;ativit&eacute; et d&rsquo;innovation, poss&eacute;dant les qualit&eacute;s n&eacute;cessaires pour entreprendre et diriger, partager, communiquer et piloter.</p>'),
(153, 26, 3, 'Quam ob rem id primum videamus', 'L’Ecole Supérieure de Management et d’Informatique Appliquée (ESMIA) est une école innovante,  jeune, dynamique,  en réseau avec plusieurs Universités, Centres de Recherche, Ecoles Privées et Publiques, ouverte aux mouvements de la société dans toute sa diversité. Elle forme des managers, dotés de solides compétences scientifiques  et techniques, de capacité d’intégration et de synthèse, de créativité et d’innovation, possédant les qualités nécessaires pour entreprendre et diriger, partager, communiquer et piloter.', '<p>Les formations propos&eacute;es &agrave; l''ESMIA sont habilit&eacute;es par l''ETAT selon l''arr&ecirc;t&eacute; minist&eacute;riel n&deg; 36.831/2013 - MESupReS du Minist&egrave;re de l''Enseignement Sup&eacute;rieur et de la Recherche Scientifique (MESupReS).<br /><br />Les dipl&ocirc;mes d&eacute;livr&eacute;s par l''ESMIA (Licence: Bacc +3 et Master: Bacc + 5) sont &eacute;galement recconus par la FOP (Fonction Publique). L''Ecole Sup&eacute;rieure de Management et d''Informatique Appliqu&eacute;e est cr&eacute;&eacute;e dans la volont&eacute; d&rsquo;offrir la m&ecirc;me chance &agrave; tous les jeunes et de les pr&eacute;parer &agrave; un meilleur avenir. Au sein de l''ESMIA,&nbsp; les &eacute;tudiants peuvent ais&eacute;ment acc&eacute;der &agrave; une formation universitaire dipl&ocirc;mante, une formation de qualit&eacute; et r&eacute;pondant aux standards internationaux.<br /><br />L&rsquo;Ecole Sup&eacute;rieure de Management et d&rsquo;Informatique Appliqu&eacute;e (ESMIA) est une &eacute;cole innovante,&nbsp; jeune, dynamique,&nbsp; en r&eacute;seau avec plusieurs Universit&eacute;s, Centres de Recherche, <br />Ecoles Priv&eacute;es et Publiques, ouverte aux mouvements de la soci&eacute;t&eacute; dans toute sa diversit&eacute;. Elle forme des managers, dot&eacute;s de solides comp&eacute;tences scientifiques&nbsp; et techniques, <br />de capacit&eacute; d&rsquo;int&eacute;gration et de synth&egrave;se, de cr&eacute;ativit&eacute; et d&rsquo;innovation, poss&eacute;dant les qualit&eacute;s n&eacute;cessaires pour entreprendre et diriger, partager, communiquer et piloter.</p>'),
(154, 26, 4, 'Quam ob rem id primum videamus', 'L’Ecole Supérieure de Management et d’Informatique Appliquée (ESMIA) est une école innovante,  jeune, dynamique,  en réseau avec plusieurs Universités, Centres de Recherche, Ecoles Privées et Publiques, ouverte aux mouvements de la société dans toute sa diversité. Elle forme des managers, dotés de solides compétences scientifiques  et techniques, de capacité d’intégration et de synthèse, de créativité et d’innovation, possédant les qualités nécessaires pour entreprendre et diriger, partager, communiquer et piloter.', '<p>Les formations propos&eacute;es &agrave; l''ESMIA sont habilit&eacute;es par l''ETAT selon l''arr&ecirc;t&eacute; minist&eacute;riel n&deg; 36.831/2013 - MESupReS du Minist&egrave;re de l''Enseignement Sup&eacute;rieur et de la Recherche Scientifique (MESupReS).<br /><br />Les dipl&ocirc;mes d&eacute;livr&eacute;s par l''ESMIA (Licence: Bacc +3 et Master: Bacc + 5) sont &eacute;galement recconus par la FOP (Fonction Publique).<br /><br />L''Ecole Sup&eacute;rieure de Management et d''Informatique Appliqu&eacute;e est cr&eacute;&eacute;e dans la volont&eacute; d&rsquo;offrir la m&ecirc;me chance &agrave; tous les jeunes et de les pr&eacute;parer &agrave; un meilleur avenir.<br /><br />Au sein de l''ESMIA,&nbsp; les &eacute;tudiants peuvent ais&eacute;ment acc&eacute;der &agrave; une formation universitaire dipl&ocirc;mante, une formation de qualit&eacute; et r&eacute;pondant aux standards internationaux.<br /><br />L&rsquo;Ecole Sup&eacute;rieure de Management et d&rsquo;Informatique Appliqu&eacute;e (ESMIA) est une &eacute;cole innovante,&nbsp; jeune, dynamique,&nbsp; en r&eacute;seau avec plusieurs Universit&eacute;s, Centres de Recherche, <br />Ecoles Priv&eacute;es et Publiques, ouverte aux mouvements de la soci&eacute;t&eacute; dans toute sa diversit&eacute;. Elle forme des managers, dot&eacute;s de solides comp&eacute;tences scientifiques&nbsp; et techniques, <br />de capacit&eacute; d&rsquo;int&eacute;gration et de synth&egrave;se, de cr&eacute;ativit&eacute; et d&rsquo;innovation, poss&eacute;dant les qualit&eacute;s n&eacute;cessaires pour entreprendre et diriger, partager, communiquer et piloter.</p>'),
(155, 26, 5, 'Quam ob rem id primum videamus', 'L’Ecole Supérieure de Management et d’Informatique Appliquée (ESMIA) est une école innovante,  jeune, dynamique,  en réseau avec plusieurs Universités, Centres de Recherche, Ecoles Privées et Publiques, ouverte aux mouvements de la société dans toute sa diversité. Elle forme des managers, dotés de solides compétences scientifiques  et techniques, de capacité d’intégration et de synthèse, de créativité et d’innovation, possédant les qualités nécessaires pour entreprendre et diriger, partager, communiquer et piloter.', '<p>Les formations propos&eacute;es &agrave; l''ESMIA sont habilit&eacute;es par l''ETAT selon l''arr&ecirc;t&eacute; minist&eacute;riel n&deg; 36.831/2013 - MESupReS du Minist&egrave;re de l''Enseignement Sup&eacute;rieur et de la Recherche Scientifique (MESupReS).<br /><br />Les dipl&ocirc;mes d&eacute;livr&eacute;s par l''ESMIA (Licence: Bacc +3 et Master: Bacc + 5) sont &eacute;galement recconus par la FOP (Fonction Publique).<br /><br />L''Ecole Sup&eacute;rieure de Management et d''Informatique Appliqu&eacute;e est cr&eacute;&eacute;e dans la volont&eacute; d&rsquo;offrir la m&ecirc;me chance &agrave; tous les jeunes et de les pr&eacute;parer &agrave; un meilleur avenir.<br /><br />Au sein de l''ESMIA,&nbsp; les &eacute;tudiants peuvent ais&eacute;ment acc&eacute;der &agrave; une formation universitaire dipl&ocirc;mante, une formation de qualit&eacute; et r&eacute;pondant aux standards internationaux.<br /><br />L&rsquo;Ecole Sup&eacute;rieure de Management et d&rsquo;Informatique Appliqu&eacute;e (ESMIA) est une &eacute;cole innovante,&nbsp; jeune, dynamique,&nbsp; en r&eacute;seau avec plusieurs Universit&eacute;s, Centres de Recherche, <br />Ecoles Priv&eacute;es et Publiques, ouverte aux mouvements de la soci&eacute;t&eacute; dans toute sa diversit&eacute;. Elle forme des managers, dot&eacute;s de solides comp&eacute;tences scientifiques&nbsp; et techniques, <br />de capacit&eacute; d&rsquo;int&eacute;gration et de synth&egrave;se, de cr&eacute;ativit&eacute; et d&rsquo;innovation, poss&eacute;dant les qualit&eacute;s n&eacute;cessaires pour entreprendre et diriger, partager, communiquer et piloter.</p>'),
(156, 26, 6, 'Quam ob rem id primum videamus', 'L’Ecole Supérieure de Management et d’Informatique Appliquée (ESMIA) est une école innovante,  jeune, dynamique,  en réseau avec plusieurs Universités, Centres de Recherche, Ecoles Privées et Publiques, ouverte aux mouvements de la société dans toute sa diversité. Elle forme des managers, dotés de solides compétences scientifiques  et techniques, de capacité d’intégration et de synthèse, de créativité et d’innovation, possédant les qualités nécessaires pour entreprendre et diriger, partager, communiquer et piloter.', '<p>Les formations propos&eacute;es &agrave; l''ESMIA sont habilit&eacute;es par l''ETAT selon l''arr&ecirc;t&eacute; minist&eacute;riel n&deg; 36.831/2013 - MESupReS du Minist&egrave;re de l''Enseignement Sup&eacute;rieur et de la Recherche Scientifique (MESupReS).<br /><br />Les dipl&ocirc;mes d&eacute;livr&eacute;s par l''ESMIA (Licence: Bacc +3 et Master: Bacc + 5) sont &eacute;galement recconus par la FOP (Fonction Publique).<br /><br />L''Ecole Sup&eacute;rieure de Management et d''Informatique Appliqu&eacute;e est cr&eacute;&eacute;e dans la volont&eacute; d&rsquo;offrir la m&ecirc;me chance &agrave; tous les jeunes et de les pr&eacute;parer &agrave; un meilleur avenir.<br /><br />Au sein de l''ESMIA,&nbsp; les &eacute;tudiants peuvent ais&eacute;ment acc&eacute;der &agrave; une formation universitaire dipl&ocirc;mante, une formation de qualit&eacute; et r&eacute;pondant aux standards internationaux.<br /><br />L&rsquo;Ecole Sup&eacute;rieure de Management et d&rsquo;Informatique Appliqu&eacute;e (ESMIA) est une &eacute;cole innovante,&nbsp; jeune, dynamique,&nbsp; en r&eacute;seau avec plusieurs Universit&eacute;s, Centres de Recherche, <br />Ecoles Priv&eacute;es et Publiques, ouverte aux mouvements de la soci&eacute;t&eacute; dans toute sa diversit&eacute;. Elle forme des managers, dot&eacute;s de solides comp&eacute;tences scientifiques&nbsp; et techniques, <br />de capacit&eacute; d&rsquo;int&eacute;gration et de synth&egrave;se, de cr&eacute;ativit&eacute; et d&rsquo;innovation, poss&eacute;dant les qualit&eacute;s n&eacute;cessaires pour entreprendre et diriger, partager, communiquer et piloter.</p>'),
(157, 27, 1, 'Haec igitur prima lex amicitiae sanciatur', 'fr. Short description .Haec igitur prima lex amicitiae sanciatur', 'fr. Description .Haec igitur prima lex amicitiae sanciatur'),
(158, 27, 2, 'Haec igitur prima lex amicitiae sanciatur', 'en. Short description .Haec igitur prima lex amicitiae sanciatur', 'en. Description .Haec igitur prima lex amicitiae sanciatur'),
(159, 27, 3, 'Haec igitur prima lex amicitiae sanciatur', 'mg. Short description .Haec igitur prima lex amicitiae sanciatur', 'mg. Description .Haec igitur prima lex amicitiae sanciatur'),
(160, 27, 4, 'Haec igitur prima lex amicitiae sanciatur', 'it. Short description .Haec igitur prima lex amicitiae sanciatur', 'it. Description .Haec igitur prima lex amicitiae sanciatur'),
(161, 27, 5, 'Haec igitur prima lex amicitiae sanciatur', 'es. Short description .Haec igitur prima lex amicitiae sanciatur', 'es. Description .Haec igitur prima lex amicitiae sanciatur'),
(162, 27, 6, 'Haec igitur prima lex amicitiae sanciatur', 'de. Short description .Haec igitur prima lex amicitiae sanciatur', 'de. Description .Haec igitur prima lex amicitiae sanciatur'),
(163, 28, 1, 'Plurimum in amicitia amicorum bene suadentium', 'fr. Short description .Plurimum in amicitia amicorum bene suadentium', 'fr. Description .Plurimum in amicitia amicorum bene suadentium'),
(164, 28, 2, 'Plurimum in amicitia amicorum bene suadentium', 'en. Short description .Plurimum in amicitia amicorum bene suadentium', 'en. Description .Plurimum in amicitia amicorum bene suadentium'),
(165, 28, 3, 'Plurimum in amicitia amicorum bene suadentium', 'mg. Short description .Plurimum in amicitia amicorum bene suadentium', 'mg. Description .Plurimum in amicitia amicorum bene suadentium'),
(166, 28, 4, 'Plurimum in amicitia amicorum bene suadentium', 'it. Short description .Plurimum in amicitia amicorum bene suadentium', 'it. Description .Plurimum in amicitia amicorum bene suadentium'),
(167, 28, 5, 'Plurimum in amicitia amicorum bene suadentium', 'es. Short description .Plurimum in amicitia amicorum bene suadentium', 'es. Description .Plurimum in amicitia amicorum bene suadentium'),
(168, 28, 6, 'Plurimum in amicitia amicorum bene suadentium', 'de. Short description .Plurimum in amicitia amicorum bene suadentium', 'de. Description .Plurimum in amicitia amicorum bene suadentium'),
(169, 29, 1, 'Institut Supérieur Polytechnique de Madagascar', 'fr. Short description .Institut Supérieur Polytechnique de Madagascar', 'fr. Description .Institut Supérieur Polytechnique de Madagascar'),
(170, 29, 2, 'Institut Supérieur Polytechnique de Madagascar', 'en. Short description .Institut Supérieur Polytechnique de Madagascar', 'en. Description .Institut Supérieur Polytechnique de Madagascar'),
(171, 29, 3, 'Institut Supérieur Polytechnique de Madagascar', 'mg. Short description .Institut Supérieur Polytechnique de Madagascar', 'mg. Description .Institut Supérieur Polytechnique de Madagascar'),
(172, 29, 4, 'Institut Supérieur Polytechnique de Madagascar', 'it. Short description .Institut Supérieur Polytechnique de Madagascar', 'it. Description .Institut Supérieur Polytechnique de Madagascar'),
(173, 29, 5, 'Institut Supérieur Polytechnique de Madagascar', 'es. Short description .Institut Supérieur Polytechnique de Madagascar', 'es. Description .Institut Supérieur Polytechnique de Madagascar'),
(174, 29, 6, 'Institut Supérieur Polytechnique de Madagascar', 'de. Short description .Institut Supérieur Polytechnique de Madagascar', 'de. Description .Institut Supérieur Polytechnique de Madagascar'),
(175, 30, 1, 'Ecole supérieure de Droit et science politique', 'fr. Short description .Ecole supérieure de Droit et science politique', 'fr. Description .Ecole supérieure de Droit et science politique'),
(176, 30, 2, 'Ecole supérieure de Droit et science politique', 'en. Short description .Ecole supérieure de Droit et science politique', 'en. Description .Ecole supérieure de Droit et science politique'),
(177, 30, 3, 'Ecole supérieure de Droit et science politique', 'mg. Short description .Ecole supérieure de Droit et science politique', 'mg. Description .Ecole supérieure de Droit et science politique'),
(178, 30, 4, 'Ecole supérieure de Droit et science politique', 'it. Short description .Ecole supérieure de Droit et science politique', 'it. Description .Ecole supérieure de Droit et science politique'),
(179, 30, 5, 'Ecole supérieure de Droit et science politique', 'es. Short description .Ecole supérieure de Droit et science politique', 'es. Description .Ecole supérieure de Droit et science politique'),
(180, 30, 6, 'Ecole supérieure de Droit et science politique', 'de. Short description .Ecole supérieure de Droit et science politique', 'de. Description .Ecole supérieure de Droit et science politique'),
(181, 31, 1, 'Ecole internationale d''hôtellerie et de management VATEL', 'Parmi plus de 42 établissements tous prestigieux, le groupe Vatel et ses 35 campus dans le monde, remporte le titre de ʺMeilleure Ecole Hôtelièreʺ lors de la 17e édition des Worldwide Hospitality Awards qui a rassemblé hier soir 14 novembre 2016, plus de 1 000 professionnels de l''hôtellerie internationale dans le salon Opéra de l’InterContinental Paris le Grand.\n\nC’est toute une industrie qui exprime ainsi au groupe Vatel sa reconnaissance et sa confiance.', '<p>Parmi plus de 42 &eacute;tablissements tous prestigieux, le groupe Vatel et ses 35 campus dans le monde, remporte le titre de ʺMeilleure Ecole H&ocirc;teli&egrave;reʺ lors de la 17e &eacute;dition des Worldwide Hospitality Awards qui a rassembl&eacute; hier soir 14 novembre 2016, plus de 1 000 professionnels de l''h&ocirc;tellerie internationale dans le salon Op&eacute;ra de l&rsquo;InterContinental Paris le Grand.<br /><br />C&rsquo;est toute une industrie qui exprime ainsi au groupe Vatel sa reconnaissance et sa confiance.</p>'),
(182, 31, 2, 'Ecole internationale d''hôtellerie et de management VATEL', 'Parmi plus de 42 établissements tous prestigieux, le groupe Vatel et ses 35 campus dans le monde, remporte le titre de ʺMeilleure Ecole Hôtelièreʺ lors de la 17e édition des Worldwide Hospitality Awards qui a rassemblé hier soir 14 novembre 2016, plus de 1 000 professionnels de l''hôtellerie internationale dans le salon Opéra de l’InterContinental Paris le Grand.\n\nC’est toute une industrie qui exprime ainsi au groupe Vatel sa reconnaissance et sa confiance.', '<p>Parmi plus de 42 &eacute;tablissements tous prestigieux, le groupe Vatel et ses 35 campus dans le monde, remporte le titre de ʺMeilleure Ecole H&ocirc;teli&egrave;reʺ lors de la 17e &eacute;dition des Worldwide Hospitality Awards qui a rassembl&eacute; hier soir 14 novembre 2016, plus de 1 000 professionnels de l''h&ocirc;tellerie internationale dans le salon Op&eacute;ra de l&rsquo;InterContinental Paris le Grand.<br /><br />C&rsquo;est toute une industrie qui exprime ainsi au groupe Vatel sa reconnaissance et sa confiance.</p>'),
(183, 31, 3, 'Ecole internationale d''hôtellerie et de management VATEL', 'Parmi plus de 42 établissements tous prestigieux, le groupe Vatel et ses 35 campus dans le monde, remporte le titre de ʺMeilleure Ecole Hôtelièreʺ lors de la 17e édition des Worldwide Hospitality Awards qui a rassemblé hier soir 14 novembre 2016, plus de 1 000 professionnels de l''hôtellerie internationale dans le salon Opéra de l’InterContinental Paris le Grand.\n\nC’est toute une industrie qui exprime ainsi au groupe Vatel sa reconnaissance et sa confiance.', '<p>Parmi plus de 42 &eacute;tablissements tous prestigieux, le groupe Vatel et ses 35 campus dans le monde, remporte le titre de ʺMeilleure Ecole H&ocirc;teli&egrave;reʺ lors de la 17e &eacute;dition des Worldwide Hospitality Awards qui a rassembl&eacute; hier soir 14 novembre 2016, plus de 1 000 professionnels de l''h&ocirc;tellerie internationale dans le salon Op&eacute;ra de l&rsquo;InterContinental Paris le Grand.<br /><br />C&rsquo;est toute une industrie qui exprime ainsi au groupe Vatel sa reconnaissance et sa confiance.</p>'),
(184, 31, 4, 'Ecole internationale d''hôtellerie et de management VATEL', 'Parmi plus de 42 établissements tous prestigieux, le groupe Vatel et ses 35 campus dans le monde, remporte le titre de ʺMeilleure Ecole Hôtelièreʺ lors de la 17e édition des Worldwide Hospitality Awards qui a rassemblé hier soir 14 novembre 2016, plus de 1 000 professionnels de l''hôtellerie internationale dans le salon Opéra de l’InterContinental Paris le Grand.\n\nC’est toute une industrie qui exprime ainsi au groupe Vatel sa reconnaissance et sa confiance.', '<p>Parmi plus de 42 &eacute;tablissements tous prestigieux, le groupe Vatel et ses 35 campus dans le monde, remporte le titre de ʺMeilleure Ecole H&ocirc;teli&egrave;reʺ lors de la 17e &eacute;dition des Worldwide Hospitality Awards qui a rassembl&eacute; hier soir 14 novembre 2016, plus de 1 000 professionnels de l''h&ocirc;tellerie internationale dans le salon Op&eacute;ra de l&rsquo;InterContinental Paris le Grand.<br /><br />C&rsquo;est toute une industrie qui exprime ainsi au groupe Vatel sa reconnaissance et sa confiance.</p>'),
(185, 31, 5, 'Ecole internationale d''hôtellerie et de management VATEL', 'Parmi plus de 42 établissements tous prestigieux, le groupe Vatel et ses 35 campus dans le monde, remporte le titre de ʺMeilleure Ecole Hôtelièreʺ lors de la 17e édition des Worldwide Hospitality Awards qui a rassemblé hier soir 14 novembre 2016, plus de 1 000 professionnels de l''hôtellerie internationale dans le salon Opéra de l’InterContinental Paris le Grand.\n\nC’est toute une industrie qui exprime ainsi au groupe Vatel sa reconnaissance et sa confiance.', '<p>Parmi plus de 42 &eacute;tablissements tous prestigieux, le groupe Vatel et ses 35 campus dans le monde, remporte le titre de ʺMeilleure Ecole H&ocirc;teli&egrave;reʺ lors de la 17e &eacute;dition des Worldwide Hospitality Awards qui a rassembl&eacute; hier soir 14 novembre 2016, plus de 1 000 professionnels de l''h&ocirc;tellerie internationale dans le salon Op&eacute;ra de l&rsquo;InterContinental Paris le Grand.<br /><br />C&rsquo;est toute une industrie qui exprime ainsi au groupe Vatel sa reconnaissance et sa confiance.</p>'),
(186, 31, 6, 'Ecole internationale d''hôtellerie et de management VATEL', 'Parmi plus de 42 établissements tous prestigieux, le groupe Vatel et ses 35 campus dans le monde, remporte le titre de ʺMeilleure Ecole Hôtelièreʺ lors de la 17e édition des Worldwide Hospitality Awards qui a rassemblé hier soir 14 novembre 2016, plus de 1 000 professionnels de l''hôtellerie internationale dans le salon Opéra de l’InterContinental Paris le Grand.\n\nC’est toute une industrie qui exprime ainsi au groupe Vatel sa reconnaissance et sa confiance.', '<p>Parmi plus de 42 &eacute;tablissements tous prestigieux, le groupe Vatel et ses 35 campus dans le monde, remporte le titre de ʺMeilleure Ecole H&ocirc;teli&egrave;reʺ lors de la 17e &eacute;dition des Worldwide Hospitality Awards qui a rassembl&eacute; hier soir 14 novembre 2016, plus de 1 000 professionnels de l''h&ocirc;tellerie internationale dans le salon Op&eacute;ra de l&rsquo;InterContinental Paris le Grand.<br /><br />C&rsquo;est toute une industrie qui exprime ainsi au groupe Vatel sa reconnaissance et sa confiance.</p>'),
(187, 32, 1, 'finibus rhoncus ipsum', 'fr. Short description .finibus rhoncus ipsum', 'fr. Description .finibus rhoncus ipsum'),
(188, 32, 2, 'finibus rhoncus ipsum', 'en. Short description .finibus rhoncus ipsum', 'en. Description .finibus rhoncus ipsum'),
(189, 32, 3, 'finibus rhoncus ipsum', 'mg. Short description .finibus rhoncus ipsum', 'mg. Description .finibus rhoncus ipsum'),
(190, 32, 4, 'finibus rhoncus ipsum', 'it. Short description .finibus rhoncus ipsum', 'it. Description .finibus rhoncus ipsum'),
(191, 32, 5, 'finibus rhoncus ipsum', 'es. Short description .finibus rhoncus ipsum', 'es. Description .finibus rhoncus ipsum'),
(192, 32, 6, 'finibus rhoncus ipsum', 'de. Short description .finibus rhoncus ipsum', 'de. Description .finibus rhoncus ipsum'),
(193, 33, 1, 'ultrices nibh sa', 'L''IFAGI & 7ème Art ou Institut de Formation en Agronomie, Gemmologie, Industrialisation & 7ème Art a été crée en 2001. Le siège Social se trouve à Anjanahary au Lot II A 92 D et a actuellement deux annexes: à 67ha et à Manjakaray. Grâce aux résultats des recherches incessantes des Enseignants chercheurs et desceux des autres Universités de Madagascar, dont l''objectif de la formation des jeunes et des personnes adultes a pour but de leur permettre d''acquérir les compétences nécessaires dans un domaine précis de la vie professionnelle et d''acquérir un biveau de développement personnel suffisant pour surmonter les épreuves de la vie et les difficultés de toutes sortes et enfin, un sens moral visant le respect des personnes.', '<p>L''IFAGI &amp; 7&egrave;me Art ou Institut de Formation en Agronomie, Gemmologie, Industrialisation &amp; 7&egrave;me Art a &eacute;t&eacute; cr&eacute;e en 2001. Le si&egrave;ge Social se trouve &agrave; Anjanahary au Lot II A 92 D et a actuellement deux annexes: &agrave; 67ha et &agrave; Manjakaray. Gr&acirc;ce aux r&eacute;sultats des recherches incessantes des Enseignants chercheurs et desceux des autres Universit&eacute;s de Madagascar, dont l''objectif de la formation des jeunes et des personnes adultes a pour but de leur permettre d''acqu&eacute;rir les comp&eacute;tences n&eacute;cessaires dans un domaine pr&eacute;cis de la vie professionnelle et d''acqu&eacute;rir un biveau de d&eacute;veloppement personnel suffisant pour surmonter les &eacute;preuves de la vie et les difficult&eacute;s de toutes sortes et enfin, un sens moral visant le respect des personnes.</p>'),
(194, 33, 2, 'ultrices nibh sa', 'L''IFAGI & 7ème Art ou Institut de Formation en Agronomie, Gemmologie, Industrialisation & 7ème Art a été crée en 2001. Le siège Social se trouve à Anjanahary au Lot II A 92 D et a actuellement deux annexes: à 67ha et à Manjakaray. Grâce aux résultats des recherches incessantes des Enseignants chercheurs et desceux des autres Universités de Madagascar, dont l''objectif de la formation des jeunes et des personnes adultes a pour but de leur permettre d''acquérir les compétences nécessaires dans un domaine précis de la vie professionnelle et d''acquérir un biveau de développement personnel suffisant pour surmonter les épreuves de la vie et les difficultés de toutes sortes et enfin, un sens moral visant le respect des personnes.', '<p>L''IFAGI &amp; 7&egrave;me Art ou Institut de Formation en Agronomie, Gemmologie, Industrialisation &amp; 7&egrave;me Art a &eacute;t&eacute; cr&eacute;e en 2001. Le si&egrave;ge Social se trouve &agrave; Anjanahary au Lot II A 92 D et a actuellement deux annexes: &agrave; 67ha et &agrave; Manjakaray. Gr&acirc;ce aux r&eacute;sultats des recherches incessantes des Enseignants chercheurs et desceux des autres Universit&eacute;s de Madagascar, dont l''objectif de la formation des jeunes et des personnes adultes a pour but de leur permettre d''acqu&eacute;rir les comp&eacute;tences n&eacute;cessaires dans un domaine pr&eacute;cis de la vie professionnelle et d''acqu&eacute;rir un biveau de d&eacute;veloppement personnel suffisant pour surmonter les &eacute;preuves de la vie et les difficult&eacute;s de toutes sortes et enfin, un sens moral visant le respect des personnes.</p>'),
(195, 33, 3, 'ultrices nibh sa', 'L''IFAGI & 7ème Art ou Institut de Formation en Agronomie, Gemmologie, Industrialisation & 7ème Art a été crée en 2001. Le siège Social se trouve à Anjanahary au Lot II A 92 D et a actuellement deux annexes: à 67ha et à Manjakaray. Grâce aux résultats des recherches incessantes des Enseignants chercheurs et desceux des autres Universités de Madagascar, dont l''objectif de la formation des jeunes et des personnes adultes a pour but de leur permettre d''acquérir les compétences nécessaires dans un domaine précis de la vie professionnelle et d''acquérir un biveau de développement personnel suffisant pour surmonter les épreuves de la vie et les difficultés de toutes sortes et enfin, un sens moral visant le respect des personnes.', '<p>L''IFAGI &amp; 7&egrave;me Art ou Institut de Formation en Agronomie, Gemmologie, Industrialisation &amp; 7&egrave;me Art a &eacute;t&eacute; cr&eacute;e en 2001. Le si&egrave;ge Social se trouve &agrave; Anjanahary au Lot II A 92 D et a actuellement deux annexes: &agrave; 67ha et &agrave; Manjakaray. Gr&acirc;ce aux r&eacute;sultats des recherches incessantes des Enseignants chercheurs et desceux des autres Universit&eacute;s de Madagascar, dont l''objectif de la formation des jeunes et des personnes adultes a pour but de leur permettre d''acqu&eacute;rir les comp&eacute;tences n&eacute;cessaires dans un domaine pr&eacute;cis de la vie professionnelle et d''acqu&eacute;rir un biveau de d&eacute;veloppement personnel suffisant pour surmonter les &eacute;preuves de la vie et les difficult&eacute;s de toutes sortes et enfin, un sens moral visant le respect des personnes.</p>'),
(196, 33, 4, 'ultrices nibh sa', 'L''IFAGI & 7ème Art ou Institut de Formation en Agronomie, Gemmologie, Industrialisation & 7ème Art a été crée en 2001. Le siège Social se trouve à Anjanahary au Lot II A 92 D et a actuellement deux annexes: à 67ha et à Manjakaray. Grâce aux résultats des recherches incessantes des Enseignants chercheurs et desceux des autres Universités de Madagascar, dont l''objectif de la formation des jeunes et des personnes adultes a pour but de leur permettre d''acquérir les compétences nécessaires dans un domaine précis de la vie professionnelle et d''acquérir un biveau de développement personnel suffisant pour surmonter les épreuves de la vie et les difficultés de toutes sortes et enfin, un sens moral visant le respect des personnes.', '<p>L''IFAGI &amp; 7&egrave;me Art ou Institut de Formation en Agronomie, Gemmologie, Industrialisation &amp; 7&egrave;me Art a &eacute;t&eacute; cr&eacute;e en 2001. Le si&egrave;ge Social se trouve &agrave; Anjanahary au Lot II A 92 D et a actuellement deux annexes: &agrave; 67ha et &agrave; Manjakaray. Gr&acirc;ce aux r&eacute;sultats des recherches incessantes des Enseignants chercheurs et desceux des autres Universit&eacute;s de Madagascar, dont l''objectif de la formation des jeunes et des personnes adultes a pour but de leur permettre d''acqu&eacute;rir les comp&eacute;tences n&eacute;cessaires dans un domaine pr&eacute;cis de la vie professionnelle et d''acqu&eacute;rir un biveau de d&eacute;veloppement personnel suffisant pour surmonter les &eacute;preuves de la vie et les difficult&eacute;s de toutes sortes et enfin, un sens moral visant le respect des personnes.</p>'),
(197, 33, 5, 'ultrices nibh sa', 'L''IFAGI & 7ème Art ou Institut de Formation en Agronomie, Gemmologie, Industrialisation & 7ème Art a été crée en 2001. Le siège Social se trouve à Anjanahary au Lot II A 92 D et a actuellement deux annexes: à 67ha et à Manjakaray. Grâce aux résultats des recherches incessantes des Enseignants chercheurs et desceux des autres Universités de Madagascar, dont l''objectif de la formation des jeunes et des personnes adultes a pour but de leur permettre d''acquérir les compétences nécessaires dans un domaine précis de la vie professionnelle et d''acquérir un biveau de développement personnel suffisant pour surmonter les épreuves de la vie et les difficultés de toutes sortes et enfin, un sens moral visant le respect des personnes.', '<p>L''IFAGI &amp; 7&egrave;me Art ou Institut de Formation en Agronomie, Gemmologie, Industrialisation &amp; 7&egrave;me Art a &eacute;t&eacute; cr&eacute;e en 2001. Le si&egrave;ge Social se trouve &agrave; Anjanahary au Lot II A 92 D et a actuellement deux annexes: &agrave; 67ha et &agrave; Manjakaray. Gr&acirc;ce aux r&eacute;sultats des recherches incessantes des Enseignants chercheurs et desceux des autres Universit&eacute;s de Madagascar, dont l''objectif de la formation des jeunes et des personnes adultes a pour but de leur permettre d''acqu&eacute;rir les comp&eacute;tences n&eacute;cessaires dans un domaine pr&eacute;cis de la vie professionnelle et d''acqu&eacute;rir un biveau de d&eacute;veloppement personnel suffisant pour surmonter les &eacute;preuves de la vie et les difficult&eacute;s de toutes sortes et enfin, un sens moral visant le respect des personnes.</p>'),
(198, 33, 6, 'ultrices nibh sa', 'L''IFAGI & 7ème Art ou Institut de Formation en Agronomie, Gemmologie, Industrialisation & 7ème Art a été crée en 2001. Le siège Social se trouve à Anjanahary au Lot II A 92 D et a actuellement deux annexes: à 67ha et à Manjakaray. Grâce aux résultats des recherches incessantes des Enseignants chercheurs et desceux des autres Universités de Madagascar, dont l''objectif de la formation des jeunes et des personnes adultes a pour but de leur permettre d''acquérir les compétences nécessaires dans un domaine précis de la vie professionnelle et d''acquérir un biveau de développement personnel suffisant pour surmonter les épreuves de la vie et les difficultés de toutes sortes et enfin, un sens moral visant le respect des personnes.', '<p>L''IFAGI &amp; 7&egrave;me Art ou Institut de Formation en Agronomie, Gemmologie, Industrialisation &amp; 7&egrave;me Art a &eacute;t&eacute; cr&eacute;e en 2001. Le si&egrave;ge Social se trouve &agrave; Anjanahary au Lot II A 92 D et a actuellement deux annexes: &agrave; 67ha et &agrave; Manjakaray. Gr&acirc;ce aux r&eacute;sultats des recherches incessantes des Enseignants chercheurs et desceux des autres Universit&eacute;s de Madagascar, dont l''objectif de la formation des jeunes et des personnes adultes a pour but de leur permettre d''acqu&eacute;rir les comp&eacute;tences n&eacute;cessaires dans un domaine pr&eacute;cis de la vie professionnelle et d''acqu&eacute;rir un biveau de d&eacute;veloppement personnel suffisant pour surmonter les &eacute;preuves de la vie et les difficult&eacute;s de toutes sortes et enfin, un sens moral visant le respect des personnes.</p>'),
(199, 34, 1, 'Centre de Formation des Ressources Humaines', 'CFRH INSTITUTE est le premier Établissement Supérieur Privé à Madagascar se spécialisant dans le domaine de la « GESTION DES RESSOURCES HUMAINES ». Créé en 2004, CFRH INSTITUTE a pour vocation de former les futurs responsables en Ressources Humaines mais également d’apporter un renforcement de compétence aux travailleurs déjà en activité. Fort de trois agréments de l’Etat, il délivre des diplômes reconnus par le Ministère de la Fonction Publique du travail et des Lois Sociales. CFRH INSTITUTE est dirigé et animé par une équipe de professionnels consultants ayant des années d’expériences confirmées dans le secteur des ressources humaines au sein de groupes de sociétés les plus reconnues de la place.', '<p style="text-align: justify;">CFRH INSTITUTE est le premier &Eacute;tablissement Sup&eacute;rieur Priv&eacute; &agrave; Madagascar se sp&eacute;cialisant dans le domaine de la &laquo; GESTION DES RESSOURCES HUMAINES &raquo;. Cr&eacute;&eacute; en 2004, CFRH INSTITUTE a pour vocation de former les futurs responsables en Ressources Humaines mais &eacute;galement d&rsquo;apporter un renforcement de comp&eacute;tence aux travailleurs d&eacute;j&agrave; en activit&eacute;. Fort de trois agr&eacute;ments de l&rsquo;Etat, il d&eacute;livre des dipl&ocirc;mes reconnus par le Minist&egrave;re de la Fonction Publique du travail et des Lois Sociales. CFRH INSTITUTE est dirig&eacute; et anim&eacute; par une &eacute;quipe de professionnels consultants ayant des ann&eacute;es d&rsquo;exp&eacute;riences confirm&eacute;es dans le secteur des ressources humaines au sein de groupes de soci&eacute;t&eacute;s les plus reconnues de la place.<br /><br />NOS FORMATIONS :<br /><br />I. FORMATION CONTINUE en &laquo; PACK FORMATION &raquo; :<br />CFRH INSTITUTE a opt&eacute; pour ce syst&egrave;me incluant les trois (3) &eacute;l&eacute;ments suivants, pour un m&ecirc;me CO&Ucirc;T DE FORMATION, &agrave; savoir :<br />1) COURS ASSIST&Eacute; EN COURS DU SOIR<br />Du Lundi au Vendredi (sauf le Mercredi)<br />Horaire : de 17h30 &agrave; 19h00<br />2) COURS ASSIST&Eacute; EN COURS DU SAMEDI<br />Horaire : de 08h00 &agrave; 12h00<br />3) COURS PAR CORRESPONDANCE OU &Agrave; DISTANCE<br />Envoi des Cours une fois par semaine sous fichier PDF :<br />&bull; 1 fichier pour le module &laquo; ADMINSTRATION DU PERSONNEL &raquo;<br />&bull; 1 fichier pour le module &laquo; GESTION&nbsp; DES&nbsp; RESSOURCES HUMAINES &raquo;<br />Sanctions :<br />1)&nbsp; DIPL&Ocirc;ME&nbsp; DE&nbsp; FIN&nbsp; DE&nbsp; FORMATION&nbsp; EN ADMINISTRATION DU PERSONNEL<br />2)&nbsp; DIPL&Ocirc;ME&nbsp; DE&nbsp; FIN&nbsp; DE&nbsp; FORMATION&nbsp; EN&nbsp; GESTION&nbsp; DES RESSOURCES HUMAINES<br />Cours de commerce international<br /><br />II. FORMATION INITIALE<br />Pour les Bacheliers, toutes s&eacute;ries,&nbsp; CFRH INSTITUTE propose des &eacute;tudes sup&eacute;rieures en salle sur la fili&egrave;re &laquo; GESTION DES RESSOURCES HUMAINES &raquo;, et dont la dur&eacute;e est de deux (2) ans. En deuxi&egrave;me ann&eacute;e, les &eacute;tudiants effectueront des stages en entreprise, et pr&eacute;senteront leur M&eacute;moire de fin d&rsquo;&Eacute;tudes en vue de l&rsquo;obtention du &laquo; D.T.S. ou&nbsp; Dipl&ocirc;me&nbsp; de&nbsp; Technicien&nbsp; Sup&eacute;rieur&nbsp; en&nbsp; GESTION&nbsp; DES&nbsp; RESSOURCES HUMAINES &raquo;.<br /><br />III. FORMATION A TITRE PRIVE<br />CFRH INSTITUTE dispose des formations &agrave; titre priv&eacute; pour les entreprises ou des particuliers qui pr&eacute;f&egrave;rent apprendre la &laquo; GESTION&nbsp; DES&nbsp; RESSOURCES&nbsp; HUMAINES &raquo; en dehors des heures d&rsquo;&eacute;tudes au CFRH INSTITUTE, et dans leurs locaux (selon leur convenance personnelle).</p>');
INSERT INTO `sl_school_translate` (`id`, `school_id`, `locale_id`, `name`, `short_description`, `description`) VALUES
(200, 34, 2, 'Centre de Formation des Ressources Humaines', 'CFRH INSTITUTE est le premier Établissement Supérieur Privé à Madagascar se spécialisant dans le domaine de la « GESTION DES RESSOURCES HUMAINES ». Créé en 2004, CFRH INSTITUTE a pour vocation de former les futurs responsables en Ressources Humaines mais également d’apporter un renforcement de compétence aux travailleurs déjà en activité. Fort de trois agréments de l’Etat, il délivre des diplômes reconnus par le Ministère de la Fonction Publique du travail et des Lois Sociales. CFRH INSTITUTE est dirigé et animé par une équipe de professionnels consultants ayant des années d’expériences confirmées dans le secteur des ressources humaines au sein de groupes de sociétés les plus reconnues de la place.', '<p style="text-align: justify;">CFRH INSTITUTE est le premier &Eacute;tablissement Sup&eacute;rieur Priv&eacute; &agrave; Madagascar se sp&eacute;cialisant dans le domaine de la &laquo; GESTION DES RESSOURCES HUMAINES &raquo;. Cr&eacute;&eacute; en 2004, CFRH INSTITUTE a pour vocation de former les futurs responsables en Ressources Humaines mais &eacute;galement d&rsquo;apporter un renforcement de comp&eacute;tence aux travailleurs d&eacute;j&agrave; en activit&eacute;. Fort de trois agr&eacute;ments de l&rsquo;Etat, il d&eacute;livre des dipl&ocirc;mes reconnus par le Minist&egrave;re de la Fonction Publique du travail et des Lois Sociales. CFRH INSTITUTE est dirig&eacute; et anim&eacute; par une &eacute;quipe de professionnels consultants ayant des ann&eacute;es d&rsquo;exp&eacute;riences confirm&eacute;es dans le secteur des ressources humaines au sein de groupes de soci&eacute;t&eacute;s les plus reconnues de la place.<br /><br />NOS FORMATIONS :<br /><br />I. FORMATION CONTINUE en &laquo; PACK FORMATION &raquo; :<br />CFRH INSTITUTE a opt&eacute; pour ce syst&egrave;me incluant les trois (3) &eacute;l&eacute;ments suivants, pour un m&ecirc;me CO&Ucirc;T DE FORMATION, &agrave; savoir :<br />1) COURS ASSIST&Eacute; EN COURS DU SOIR<br />Du Lundi au Vendredi (sauf le Mercredi)<br />Horaire : de 17h30 &agrave; 19h00<br />2) COURS ASSIST&Eacute; EN COURS DU SAMEDI<br />Horaire : de 08h00 &agrave; 12h00<br />3) COURS PAR CORRESPONDANCE OU &Agrave; DISTANCE<br />Envoi des Cours une fois par semaine sous fichier PDF :<br />&bull; 1 fichier pour le module &laquo; ADMINSTRATION DU PERSONNEL &raquo;<br />&bull; 1 fichier pour le module &laquo; GESTION&nbsp; DES&nbsp; RESSOURCES HUMAINES &raquo;<br />Sanctions :<br />1)&nbsp; DIPL&Ocirc;ME&nbsp; DE&nbsp; FIN&nbsp; DE&nbsp; FORMATION&nbsp; EN ADMINISTRATION DU PERSONNEL<br />2)&nbsp; DIPL&Ocirc;ME&nbsp; DE&nbsp; FIN&nbsp; DE&nbsp; FORMATION&nbsp; EN&nbsp; GESTION&nbsp; DES RESSOURCES HUMAINES<br />Cours de commerce international<br /><br />II. FORMATION INITIALE<br />Pour les Bacheliers, toutes s&eacute;ries,&nbsp; CFRH INSTITUTE propose des &eacute;tudes sup&eacute;rieures en salle sur la fili&egrave;re &laquo; GESTION DES RESSOURCES HUMAINES &raquo;, et dont la dur&eacute;e est de deux (2) ans. En deuxi&egrave;me ann&eacute;e, les &eacute;tudiants effectueront des stages en entreprise, et pr&eacute;senteront leur M&eacute;moire de fin d&rsquo;&Eacute;tudes en vue de l&rsquo;obtention du &laquo; D.T.S. ou&nbsp; Dipl&ocirc;me&nbsp; de&nbsp; Technicien&nbsp; Sup&eacute;rieur&nbsp; en&nbsp; GESTION&nbsp; DES&nbsp; RESSOURCES HUMAINES &raquo;.<br /><br />III. FORMATION A TITRE PRIVE<br />CFRH INSTITUTE dispose des formations &agrave; titre priv&eacute; pour les entreprises ou des particuliers qui pr&eacute;f&egrave;rent apprendre la &laquo; GESTION&nbsp; DES&nbsp; RESSOURCES&nbsp; HUMAINES &raquo; en dehors des heures d&rsquo;&eacute;tudes au CFRH INSTITUTE, et dans leurs locaux (selon leur convenance personnelle).</p>'),
(201, 34, 3, 'accumsan tristique elit sit am', 'CFRH INSTITUTE est le premier Établissement Supérieur Privé à Madagascar se spécialisant dans le domaine de la « GESTION DES RESSOURCES HUMAINES ». Créé en 2004, CFRH INSTITUTE a pour vocation de former les futurs responsables en Ressources Humaines mais également d’apporter un renforcement de compétence aux travailleurs déjà en activité. Fort de trois agréments de l’Etat, il délivre des diplômes reconnus par le Ministère de la Fonction Publique du travail et des Lois Sociales. CFRH INSTITUTE est dirigé et animé par une équipe de professionnels consultants ayant des années d’expériences confirmées dans le secteur des ressources humaines au sein de groupes de sociétés les plus reconnues de la place.', '<p style="text-align: justify;">CFRH INSTITUTE est le premier &Eacute;tablissement Sup&eacute;rieur Priv&eacute; &agrave; Madagascar se sp&eacute;cialisant dans le domaine de la &laquo; GESTION DES RESSOURCES HUMAINES &raquo;. Cr&eacute;&eacute; en 2004, CFRH INSTITUTE a pour vocation de former les futurs responsables en Ressources Humaines mais &eacute;galement d&rsquo;apporter un renforcement de comp&eacute;tence aux travailleurs d&eacute;j&agrave; en activit&eacute;. Fort de trois agr&eacute;ments de l&rsquo;Etat, il d&eacute;livre des dipl&ocirc;mes reconnus par le Minist&egrave;re de la Fonction Publique du travail et des Lois Sociales. CFRH INSTITUTE est dirig&eacute; et anim&eacute; par une &eacute;quipe de professionnels consultants ayant des ann&eacute;es d&rsquo;exp&eacute;riences confirm&eacute;es dans le secteur des ressources humaines au sein de groupes de soci&eacute;t&eacute;s les plus reconnues de la place.<br /><br />NOS FORMATIONS :<br /><br />I. FORMATION CONTINUE en &laquo; PACK FORMATION &raquo; :<br />CFRH INSTITUTE a opt&eacute; pour ce syst&egrave;me incluant les trois (3) &eacute;l&eacute;ments suivants, pour un m&ecirc;me CO&Ucirc;T DE FORMATION, &agrave; savoir :<br />1) COURS ASSIST&Eacute; EN COURS DU SOIR<br />Du Lundi au Vendredi (sauf le Mercredi)<br />Horaire : de 17h30 &agrave; 19h00<br />2) COURS ASSIST&Eacute; EN COURS DU SAMEDI<br />Horaire : de 08h00 &agrave; 12h00<br />3) COURS PAR CORRESPONDANCE OU &Agrave; DISTANCE<br />Envoi des Cours une fois par semaine sous fichier PDF :<br />&bull; 1 fichier pour le module &laquo; ADMINSTRATION DU PERSONNEL &raquo;<br />&bull; 1 fichier pour le module &laquo; GESTION&nbsp; DES&nbsp; RESSOURCES HUMAINES &raquo;<br />Sanctions :<br />1)&nbsp; DIPL&Ocirc;ME&nbsp; DE&nbsp; FIN&nbsp; DE&nbsp; FORMATION&nbsp; EN ADMINISTRATION DU PERSONNEL<br />2)&nbsp; DIPL&Ocirc;ME&nbsp; DE&nbsp; FIN&nbsp; DE&nbsp; FORMATION&nbsp; EN&nbsp; GESTION&nbsp; DES RESSOURCES HUMAINES<br />Cours de commerce international<br /><br />II. FORMATION INITIALE<br />Pour les Bacheliers, toutes s&eacute;ries,&nbsp; CFRH INSTITUTE propose des &eacute;tudes sup&eacute;rieures en salle sur la fili&egrave;re &laquo; GESTION DES RESSOURCES HUMAINES &raquo;, et dont la dur&eacute;e est de deux (2) ans. En deuxi&egrave;me ann&eacute;e, les &eacute;tudiants effectueront des stages en entreprise, et pr&eacute;senteront leur M&eacute;moire de fin d&rsquo;&Eacute;tudes en vue de l&rsquo;obtention du &laquo; D.T.S. ou&nbsp; Dipl&ocirc;me&nbsp; de&nbsp; Technicien&nbsp; Sup&eacute;rieur&nbsp; en&nbsp; GESTION&nbsp; DES&nbsp; RESSOURCES HUMAINES &raquo;.<br /><br />III. FORMATION A TITRE PRIVE<br />CFRH INSTITUTE dispose des formations &agrave; titre priv&eacute; pour les entreprises ou des particuliers qui pr&eacute;f&egrave;rent apprendre la &laquo; GESTION&nbsp; DES&nbsp; RESSOURCES&nbsp; HUMAINES &raquo; en dehors des heures d&rsquo;&eacute;tudes au CFRH INSTITUTE, et dans leurs locaux (selon leur convenance personnelle).</p>'),
(202, 34, 4, 'accumsan tristique elit sit am', 'CFRH INSTITUTE est le premier Établissement Supérieur Privé à Madagascar se spécialisant dans le domaine de la « GESTION DES RESSOURCES HUMAINES ». Créé en 2004, CFRH INSTITUTE a pour vocation de former les futurs responsables en Ressources Humaines mais également d’apporter un renforcement de compétence aux travailleurs déjà en activité. Fort de trois agréments de l’Etat, il délivre des diplômes reconnus par le Ministère de la Fonction Publique du travail et des Lois Sociales. CFRH INSTITUTE est dirigé et animé par une équipe de professionnels consultants ayant des années d’expériences confirmées dans le secteur des ressources humaines au sein de groupes de sociétés les plus reconnues de la place.', '<p style="text-align: justify;">CFRH INSTITUTE est le premier &Eacute;tablissement Sup&eacute;rieur Priv&eacute; &agrave; Madagascar se sp&eacute;cialisant dans le domaine de la &laquo; GESTION DES RESSOURCES HUMAINES &raquo;. Cr&eacute;&eacute; en 2004, CFRH INSTITUTE a pour vocation de former les futurs responsables en Ressources Humaines mais &eacute;galement d&rsquo;apporter un renforcement de comp&eacute;tence aux travailleurs d&eacute;j&agrave; en activit&eacute;. Fort de trois agr&eacute;ments de l&rsquo;Etat, il d&eacute;livre des dipl&ocirc;mes reconnus par le Minist&egrave;re de la Fonction Publique du travail et des Lois Sociales. CFRH INSTITUTE est dirig&eacute; et anim&eacute; par une &eacute;quipe de professionnels consultants ayant des ann&eacute;es d&rsquo;exp&eacute;riences confirm&eacute;es dans le secteur des ressources humaines au sein de groupes de soci&eacute;t&eacute;s les plus reconnues de la place.<br /><br />NOS FORMATIONS :<br /><br />I. FORMATION CONTINUE en &laquo; PACK FORMATION &raquo; :<br />CFRH INSTITUTE a opt&eacute; pour ce syst&egrave;me incluant les trois (3) &eacute;l&eacute;ments suivants, pour un m&ecirc;me CO&Ucirc;T DE FORMATION, &agrave; savoir :<br />1) COURS ASSIST&Eacute; EN COURS DU SOIR<br />Du Lundi au Vendredi (sauf le Mercredi)<br />Horaire : de 17h30 &agrave; 19h00<br />2) COURS ASSIST&Eacute; EN COURS DU SAMEDI<br />Horaire : de 08h00 &agrave; 12h00<br />3) COURS PAR CORRESPONDANCE OU &Agrave; DISTANCE<br />Envoi des Cours une fois par semaine sous fichier PDF :<br />&bull; 1 fichier pour le module &laquo; ADMINSTRATION DU PERSONNEL &raquo;<br />&bull; 1 fichier pour le module &laquo; GESTION&nbsp; DES&nbsp; RESSOURCES HUMAINES &raquo;<br />Sanctions :<br />1)&nbsp; DIPL&Ocirc;ME&nbsp; DE&nbsp; FIN&nbsp; DE&nbsp; FORMATION&nbsp; EN ADMINISTRATION DU PERSONNEL<br />2)&nbsp; DIPL&Ocirc;ME&nbsp; DE&nbsp; FIN&nbsp; DE&nbsp; FORMATION&nbsp; EN&nbsp; GESTION&nbsp; DES RESSOURCES HUMAINES<br />Cours de commerce international<br /><br />II. FORMATION INITIALE<br />Pour les Bacheliers, toutes s&eacute;ries,&nbsp; CFRH INSTITUTE propose des &eacute;tudes sup&eacute;rieures en salle sur la fili&egrave;re &laquo; GESTION DES RESSOURCES HUMAINES &raquo;, et dont la dur&eacute;e est de deux (2) ans. En deuxi&egrave;me ann&eacute;e, les &eacute;tudiants effectueront des stages en entreprise, et pr&eacute;senteront leur M&eacute;moire de fin d&rsquo;&Eacute;tudes en vue de l&rsquo;obtention du &laquo; D.T.S. ou&nbsp; Dipl&ocirc;me&nbsp; de&nbsp; Technicien&nbsp; Sup&eacute;rieur&nbsp; en&nbsp; GESTION&nbsp; DES&nbsp; RESSOURCES HUMAINES &raquo;.<br /><br />III. FORMATION A TITRE PRIVE<br />CFRH INSTITUTE dispose des formations &agrave; titre priv&eacute; pour les entreprises ou des particuliers qui pr&eacute;f&egrave;rent apprendre la &laquo; GESTION&nbsp; DES&nbsp; RESSOURCES&nbsp; HUMAINES &raquo; en dehors des heures d&rsquo;&eacute;tudes au CFRH INSTITUTE, et dans leurs locaux (selon leur convenance personnelle).</p>'),
(203, 34, 5, 'accumsan tristique elit sit am', 'CFRH INSTITUTE est le premier Établissement Supérieur Privé à Madagascar se spécialisant dans le domaine de la « GESTION DES RESSOURCES HUMAINES ». Créé en 2004, CFRH INSTITUTE a pour vocation de former les futurs responsables en Ressources Humaines mais également d’apporter un renforcement de compétence aux travailleurs déjà en activité. Fort de trois agréments de l’Etat, il délivre des diplômes reconnus par le Ministère de la Fonction Publique du travail et des Lois Sociales. CFRH INSTITUTE est dirigé et animé par une équipe de professionnels consultants ayant des années d’expériences confirmées dans le secteur des ressources humaines au sein de groupes de sociétés les plus reconnues de la place.', '<p style="text-align: justify;">CFRH INSTITUTE est le premier &Eacute;tablissement Sup&eacute;rieur Priv&eacute; &agrave; Madagascar se sp&eacute;cialisant dans le domaine de la &laquo; GESTION DES RESSOURCES HUMAINES &raquo;. Cr&eacute;&eacute; en 2004, CFRH INSTITUTE a pour vocation de former les futurs responsables en Ressources Humaines mais &eacute;galement d&rsquo;apporter un renforcement de comp&eacute;tence aux travailleurs d&eacute;j&agrave; en activit&eacute;. Fort de trois agr&eacute;ments de l&rsquo;Etat, il d&eacute;livre des dipl&ocirc;mes reconnus par le Minist&egrave;re de la Fonction Publique du travail et des Lois Sociales. CFRH INSTITUTE est dirig&eacute; et anim&eacute; par une &eacute;quipe de professionnels consultants ayant des ann&eacute;es d&rsquo;exp&eacute;riences confirm&eacute;es dans le secteur des ressources humaines au sein de groupes de soci&eacute;t&eacute;s les plus reconnues de la place.<br /><br />NOS FORMATIONS :<br /><br />I. FORMATION CONTINUE en &laquo; PACK FORMATION &raquo; :<br />CFRH INSTITUTE a opt&eacute; pour ce syst&egrave;me incluant les trois (3) &eacute;l&eacute;ments suivants, pour un m&ecirc;me CO&Ucirc;T DE FORMATION, &agrave; savoir :<br />1) COURS ASSIST&Eacute; EN COURS DU SOIR<br />Du Lundi au Vendredi (sauf le Mercredi)<br />Horaire : de 17h30 &agrave; 19h00<br />2) COURS ASSIST&Eacute; EN COURS DU SAMEDI<br />Horaire : de 08h00 &agrave; 12h00<br />3) COURS PAR CORRESPONDANCE OU &Agrave; DISTANCE<br />Envoi des Cours une fois par semaine sous fichier PDF :<br />&bull; 1 fichier pour le module &laquo; ADMINSTRATION DU PERSONNEL &raquo;<br />&bull; 1 fichier pour le module &laquo; GESTION&nbsp; DES&nbsp; RESSOURCES HUMAINES &raquo;<br />Sanctions :<br />1)&nbsp; DIPL&Ocirc;ME&nbsp; DE&nbsp; FIN&nbsp; DE&nbsp; FORMATION&nbsp; EN ADMINISTRATION DU PERSONNEL<br />2)&nbsp; DIPL&Ocirc;ME&nbsp; DE&nbsp; FIN&nbsp; DE&nbsp; FORMATION&nbsp; EN&nbsp; GESTION&nbsp; DES RESSOURCES HUMAINES<br />Cours de commerce international<br /><br />II. FORMATION INITIALE<br />Pour les Bacheliers, toutes s&eacute;ries,&nbsp; CFRH INSTITUTE propose des &eacute;tudes sup&eacute;rieures en salle sur la fili&egrave;re &laquo; GESTION DES RESSOURCES HUMAINES &raquo;, et dont la dur&eacute;e est de deux (2) ans. En deuxi&egrave;me ann&eacute;e, les &eacute;tudiants effectueront des stages en entreprise, et pr&eacute;senteront leur M&eacute;moire de fin d&rsquo;&Eacute;tudes en vue de l&rsquo;obtention du &laquo; D.T.S. ou&nbsp; Dipl&ocirc;me&nbsp; de&nbsp; Technicien&nbsp; Sup&eacute;rieur&nbsp; en&nbsp; GESTION&nbsp; DES&nbsp; RESSOURCES HUMAINES &raquo;.<br /><br />III. FORMATION A TITRE PRIVE<br />CFRH INSTITUTE dispose des formations &agrave; titre priv&eacute; pour les entreprises ou des particuliers qui pr&eacute;f&egrave;rent apprendre la &laquo; GESTION&nbsp; DES&nbsp; RESSOURCES&nbsp; HUMAINES &raquo; en dehors des heures d&rsquo;&eacute;tudes au CFRH INSTITUTE, et dans leurs locaux (selon leur convenance personnelle).</p>'),
(204, 34, 6, 'accumsan tristique elit sit am', 'CFRH INSTITUTE est le premier Établissement Supérieur Privé à Madagascar se spécialisant dans le domaine de la « GESTION DES RESSOURCES HUMAINES ». Créé en 2004, CFRH INSTITUTE a pour vocation de former les futurs responsables en Ressources Humaines mais également d’apporter un renforcement de compétence aux travailleurs déjà en activité. Fort de trois agréments de l’Etat, il délivre des diplômes reconnus par le Ministère de la Fonction Publique du travail et des Lois Sociales. CFRH INSTITUTE est dirigé et animé par une équipe de professionnels consultants ayant des années d’expériences confirmées dans le secteur des ressources humaines au sein de groupes de sociétés les plus reconnues de la place.', '<p style="text-align: justify;">CFRH INSTITUTE est le premier &Eacute;tablissement Sup&eacute;rieur Priv&eacute; &agrave; Madagascar se sp&eacute;cialisant dans le domaine de la &laquo; GESTION DES RESSOURCES HUMAINES &raquo;. Cr&eacute;&eacute; en 2004, CFRH INSTITUTE a pour vocation de former les futurs responsables en Ressources Humaines mais &eacute;galement d&rsquo;apporter un renforcement de comp&eacute;tence aux travailleurs d&eacute;j&agrave; en activit&eacute;. Fort de trois agr&eacute;ments de l&rsquo;Etat, il d&eacute;livre des dipl&ocirc;mes reconnus par le Minist&egrave;re de la Fonction Publique du travail et des Lois Sociales. CFRH INSTITUTE est dirig&eacute; et anim&eacute; par une &eacute;quipe de professionnels consultants ayant des ann&eacute;es d&rsquo;exp&eacute;riences confirm&eacute;es dans le secteur des ressources humaines au sein de groupes de soci&eacute;t&eacute;s les plus reconnues de la place.<br /><br />NOS FORMATIONS :<br /><br />I. FORMATION CONTINUE en &laquo; PACK FORMATION &raquo; :<br />CFRH INSTITUTE a opt&eacute; pour ce syst&egrave;me incluant les trois (3) &eacute;l&eacute;ments suivants, pour un m&ecirc;me CO&Ucirc;T DE FORMATION, &agrave; savoir :<br />1) COURS ASSIST&Eacute; EN COURS DU SOIR<br />Du Lundi au Vendredi (sauf le Mercredi)<br />Horaire : de 17h30 &agrave; 19h00<br />2) COURS ASSIST&Eacute; EN COURS DU SAMEDI<br />Horaire : de 08h00 &agrave; 12h00<br />3) COURS PAR CORRESPONDANCE OU &Agrave; DISTANCE<br />Envoi des Cours une fois par semaine sous fichier PDF :<br />&bull; 1 fichier pour le module &laquo; ADMINSTRATION DU PERSONNEL &raquo;<br />&bull; 1 fichier pour le module &laquo; GESTION&nbsp; DES&nbsp; RESSOURCES HUMAINES &raquo;<br />Sanctions :<br />1)&nbsp; DIPL&Ocirc;ME&nbsp; DE&nbsp; FIN&nbsp; DE&nbsp; FORMATION&nbsp; EN ADMINISTRATION DU PERSONNEL<br />2)&nbsp; DIPL&Ocirc;ME&nbsp; DE&nbsp; FIN&nbsp; DE&nbsp; FORMATION&nbsp; EN&nbsp; GESTION&nbsp; DES RESSOURCES HUMAINES<br />Cours de commerce international<br /><br />II. FORMATION INITIALE<br />Pour les Bacheliers, toutes s&eacute;ries,&nbsp; CFRH INSTITUTE propose des &eacute;tudes sup&eacute;rieures en salle sur la fili&egrave;re &laquo; GESTION DES RESSOURCES HUMAINES &raquo;, et dont la dur&eacute;e est de deux (2) ans. En deuxi&egrave;me ann&eacute;e, les &eacute;tudiants effectueront des stages en entreprise, et pr&eacute;senteront leur M&eacute;moire de fin d&rsquo;&Eacute;tudes en vue de l&rsquo;obtention du &laquo; D.T.S. ou&nbsp; Dipl&ocirc;me&nbsp; de&nbsp; Technicien&nbsp; Sup&eacute;rieur&nbsp; en&nbsp; GESTION&nbsp; DES&nbsp; RESSOURCES HUMAINES &raquo;.<br /><br />III. FORMATION A TITRE PRIVE<br />CFRH INSTITUTE dispose des formations &agrave; titre priv&eacute; pour les entreprises ou des particuliers qui pr&eacute;f&egrave;rent apprendre la &laquo; GESTION&nbsp; DES&nbsp; RESSOURCES&nbsp; HUMAINES &raquo; en dehors des heures d&rsquo;&eacute;tudes au CFRH INSTITUTE, et dans leurs locaux (selon leur convenance personnelle).</p>'),
(205, 35, 1, 'Institut Universitaire Polytechnique de Madagascar', 'fr. Short description .c ultricies ac arcu vitae', '<p>fr. Description .c ultricies ac arcu vitae</p>'),
(206, 35, 2, 'Institut Universitaire Polytechnique de Madagascar', 'en. Short description .c ultricies ac arcu vitae', '<p>en. Description .c ultricies ac arcu vitae</p>'),
(207, 35, 3, 'Institut Universitaire Polytechnique de Madagascar', 'mg. Short description .c ultricies ac arcu vitae', '<p>mg. Description .c ultricies ac arcu vitae</p>'),
(208, 35, 4, 'Institut Universitaire Polytechnique de Madagascar', 'it. Short description .c ultricies ac arcu vitae', '<p>it. Description .c ultricies ac arcu vitae</p>'),
(209, 35, 5, 'Institut Universitaire Polytechnique de Madagascar', 'es. Short description .c ultricies ac arcu vitae', '<p>es. Description .c ultricies ac arcu vitae</p>'),
(210, 35, 6, 'Institut Universitaire Polytechnique de Madagascar', 'de. Short description .c ultricies ac arcu vitae', '<p>de. Description .c ultricies ac arcu vitae</p>'),
(211, 36, 1, 'Espace Universitaire Regional de l''Ocean Indien', 'fr. Short description .cumsan tristique elit sit', '<p>fr. Description .cumsan tristique elit sit</p>'),
(212, 36, 2, 'Espace Universitaire Regional de l''Ocean Indien', 'en. Short description .cumsan tristique elit sit', '<p>en. Description .cumsan tristique elit sit</p>'),
(213, 36, 3, 'Espace Universitaire Regional de l''Ocean Indien', 'mg. Short description .cumsan tristique elit sit', '<p>mg. Description .cumsan tristique elit sit</p>'),
(214, 36, 4, 'Espace Universitaire Regional de l''Ocean Indien', 'it. Short description .cumsan tristique elit sit', '<p>it. Description .cumsan tristique elit sit</p>'),
(215, 36, 5, 'Espace Universitaire Regional de l''Ocean Indien', 'es. Short description .cumsan tristique elit sit', '<p>es. Description .cumsan tristique elit sit</p>'),
(216, 36, 6, 'Espace Universitaire Regional de l''Ocean Indien', 'de. Short description .cumsan tristique elit sit', '<p>de. Description .cumsan tristique elit sit</p>'),
(217, 37, 1, 'E-media', 'fr. Short description .ultricies ac arcu vitae elementum', '<p>fr. Description .ultricies ac arcu vitae elementum</p>'),
(218, 37, 2, 'E-media', 'en. Short description .ultricies ac arcu vitae elementum', '<p>en. Description .ultricies ac arcu vitae elementum</p>'),
(219, 37, 3, 'E-media', 'mg. Short description .ultricies ac arcu vitae elementum', '<p>mg. Description .ultricies ac arcu vitae elementum</p>'),
(220, 37, 4, 'E-media', 'it. Short description .ultricies ac arcu vitae elementum', '<p>it. Description .ultricies ac arcu vitae elementum</p>'),
(221, 37, 5, 'E-media', 'es. Short description .ultricies ac arcu vitae elementum', '<p>es. Description .ultricies ac arcu vitae elementum</p>'),
(222, 37, 6, 'E-media', 'de. Short description .ultricies ac arcu vitae elementum', '<p>de. Description .ultricies ac arcu vitae elementum</p>'),
(223, 38, 1, 'Institut de Formation PRofessionnelle Garantie Madagascar', '"Avenir assuré, boulot à gogo, chômage zéro". Vous serez dès PRO avec I.F.PRO.G', '<p>fr. Description .euismod sit amet ultricies</p>'),
(224, 38, 2, 'Institut de Formation PRofessionnelle Garantie Madagascar', '"Avenir assuré, boulot à gogo, chômage zéro". Vous serez dès PRO avec I.F.PRO.G', '<p>en. Description .euismod sit amet ultricies</p>'),
(225, 38, 3, 'Institut de Formation PRofessionnelle Garantie Madagascar', '"Avenir assuré, boulot à gogo, chômage zéro". Vous serez dès PRO avec I.F.PRO.G', '<p>mg. Description .euismod sit amet ultricies</p>'),
(226, 38, 4, 'Institut de Formation PRofessionnelle Garantie Madagascar', '"Avenir assuré, boulot à gogo, chômage zéro". Vous serez dès PRO avec I.F.PRO.G', '<p>it. Description .euismod sit amet ultricies</p>'),
(227, 38, 5, 'Institut de Formation PRofessionnelle Garantie Madagascar', '"Avenir assuré, boulot à gogo, chômage zéro". Vous serez dès PRO avec I.F.PRO.G', '<p>es. Description .euismod sit amet ultricies</p>'),
(228, 38, 6, 'Institut de Formation PRofessionnelle Garantie Madagascar', '"Avenir assuré, boulot à gogo, chômage zéro". Vous serez dès PRO avec I.F.PRO.G', '<p>de. Description .euismod sit amet ultricies</p>'),
(229, 39, 1, 'Institut Superieur Saint Michel Itaosy', 'Établissement Supérieur Catholique professionnalisant sous l’égide des Pères Carmes, l’Institut Supérieur Saint Michel Itaosy, ISSMI a été fondé en 2003, avec l’agrément d’ouverture du Ministère de l’Enseignement Supérieur et de la Recherche Scientifique : ARRETE N° 532-2005/MENRS.', '<p><strong>A propos</strong></p>\n<p>&Eacute;tablissement Sup&eacute;rieur Catholique professionnalisant sous l&rsquo;&eacute;gide des P&egrave;res Carmes, l&rsquo;Institut Sup&eacute;rieur Saint Michel Itaosy, ISSMI a &eacute;t&eacute; fond&eacute; en 2003, avec l&rsquo;agr&eacute;ment d&rsquo;ouverture du Minist&egrave;re de l&rsquo;Enseignement Sup&eacute;rieur et de la Recherche Scientifique : ARRETE N&deg; 532-2005/MENRS. Les dipl&ocirc;mes d&eacute;livr&eacute;s &agrave; l&rsquo;ISSMI sont reconnus par la Fonction Publique avec &eacute;quivalence administrative :<br />Bac +2 : Ex Cat IV Echelle B1 (Arr&ecirc;t&eacute; : 3491/2009-CNEAT)<br />Bac+3 : Ex Cat V Echelle A3 (Arr&ecirc;t&eacute; : 3493/ 2009-CNEAT)<br /><br />Les offres de formations &agrave; l&rsquo;ISSMI sont habilit&eacute;es par le Minist&egrave;re de l&rsquo;Enseignement Sup&eacute;rieur et de la recherche Scientifique :<br />TOURISME ENVIRONNEMENT HOTELLERIE T.E.H : Arr&ecirc;t&eacute; 1072/2014-MESupRES<br />GESTION : Arr&ecirc;t&eacute; 1949/2013- MESupRES<br />INFORMATIQUE : Arr&ecirc;t&eacute; 36831/2013- MESupRES<br /><br /><strong>Mission :</strong></p>\n<p style="text-align: justify;">S&rsquo;ins&eacute;rant dans les &oelig;uvres &eacute;ducationnelles Carm&eacute;litaines, sa mise en place est une continuit&eacute; logique des travaux entrepris dans&nbsp; le cadre des &eacute;coles, des coll&egrave;ges et des lyc&eacute;es des districts de toute l&rsquo;Ile, o&ugrave; l&rsquo;Ordre est pr&eacute;sent. &laquo; Rester et Devenir Meilleur &raquo;, telle est sa devise. Il ambitionne ainsi dans un effort quasi permanent, de toujours fournir le meilleur de lui-m&ecirc;me afin de couronner de succ&egrave;s tout ce qu&rsquo;il entreprend. Se d&eacute;finir par rapport &agrave; soi ne suffit cependant pas, se positionner par rapport aux autres est aussi une autre paire de manche. Le statut de &laquo; meilleur &raquo; n&rsquo;est paradoxalement pas statique et n&rsquo;est jamais acquis d&eacute;finitivement, le chemin de la victoire et sem&eacute; d&rsquo;embuches et d&rsquo;obstacles &agrave; surmonter. Le monde concurrentiel est complexe et en incessante &eacute;volution et il nous appartient de suivre et&nbsp; de vivre ce dynamique afin de r&eacute;ussir sur tous les plans. Viser la formation int&eacute;grale de l&rsquo;homme, c&rsquo;est pr&eacute;server l&rsquo;&eacute;quilibre entre le corps, le c&oelig;ur, et l&rsquo;&acirc;me, c&rsquo;est aussi r&eacute;pondre &agrave; l&rsquo;imp&eacute;ratif du triptyque : qualit&eacute;, rigueur, t&eacute;moignage de foi vivante. Il s&rsquo;agit en r&eacute;sum&eacute; de former des jeunes citoyens responsables, performants et b&acirc;tisseur.</p>'),
(230, 39, 2, 'Institut Superieur Saint Michel Itaosy', 'Établissement Supérieur Catholique professionnalisant sous l’égide des Pères Carmes, l’Institut Supérieur Saint Michel Itaosy, ISSMI a été fondé en 2003, avec l’agrément d’ouverture du Ministère de l’Enseignement Supérieur et de la Recherche Scientifique : ARRETE N° 532-2005/MENRS.', '<div><strong>A propos</strong></div>\n<p style="text-align: justify;">&Eacute;tablissement Sup&eacute;rieur Catholique professionnalisant sous l&rsquo;&eacute;gide des P&egrave;res Carmes, l&rsquo;Institut Sup&eacute;rieur Saint Michel Itaosy, ISSMI a &eacute;t&eacute; fond&eacute; en 2003, avec l&rsquo;agr&eacute;ment d&rsquo;ouverture du Minist&egrave;re de l&rsquo;Enseignement Sup&eacute;rieur et de la Recherche Scientifique : ARRETE N&deg; 532-2005/MENRS. Les dipl&ocirc;mes d&eacute;livr&eacute;s &agrave; l&rsquo;ISSMI sont reconnus par la Fonction Publique avec &eacute;quivalence administrative :</p>\n<ul style="list-style-type: circle;">\n<li>Bac +2 : Ex Cat IV Echelle B1 (Arr&ecirc;t&eacute; : 3491/2009-CNEAT)</li>\n<li>Bac+3 : Ex Cat V Echelle A3 (Arr&ecirc;t&eacute; : 3493/ 2009-CNEAT)</li>\n</ul>\n<p>Les offres de formations &agrave; l&rsquo;ISSMI sont habilit&eacute;es par le Minist&egrave;re de l&rsquo;Enseignement Sup&eacute;rieur et de la recherche Scientifique :</p>\n<ul style="list-style-type: circle;">\n<li>TOURISME ENVIRONNEMENT HOTELLERIE T.E.H : Arr&ecirc;t&eacute; 1072/2014-MESupRES</li>\n<li>ESTION : Arr&ecirc;t&eacute; 1949/2013- MESupRES</li>\n<li>INFORMATIQUE : Arr&ecirc;t&eacute; 36831/2013- MESupRES</li>\n</ul>\n<p><strong>Mission :</strong></p>\n<div style="text-align: justify;">S&rsquo;ins&eacute;rant dans les &oelig;uvres &eacute;ducationnelles Carm&eacute;litaines, sa mise en place est une continuit&eacute; logique des travaux entrepris dans&nbsp; le cadre des &eacute;coles, des coll&egrave;ges et des lyc&eacute;es des districts de toute l&rsquo;Ile, o&ugrave; l&rsquo;Ordre est pr&eacute;sent. &laquo; Rester et Devenir Meilleur &raquo;, telle est sa devise. Il ambitionne ainsi dans un effort quasi permanent, de toujours fournir le meilleur de lui-m&ecirc;me afin de couronner de succ&egrave;s tout ce qu&rsquo;il entreprend. Se d&eacute;finir par rapport &agrave; soi ne suffit cependant pas, se positionner par rapport aux autres est aussi une autre paire de manche. Le statut de &laquo; meilleur &raquo; n&rsquo;est paradoxalement pas statique et n&rsquo;est jamais acquis d&eacute;finitivement, le chemin de la victoire et sem&eacute; d&rsquo;embuches et d&rsquo;obstacles &agrave; surmonter. Le monde concurrentiel est complexe et en incessante &eacute;volution et il nous appartient de suivre et&nbsp; de vivre ce dynamique afin de r&eacute;ussir sur tous les plans. Viser la formation int&eacute;grale de l&rsquo;homme, c&rsquo;est pr&eacute;server l&rsquo;&eacute;quilibre entre le corps, le c&oelig;ur, et l&rsquo;&acirc;me, c&rsquo;est aussi r&eacute;pondre &agrave; l&rsquo;imp&eacute;ratif du triptyque : qualit&eacute;, rigueur, t&eacute;moignage de foi vivante. Il s&rsquo;agit en r&eacute;sum&eacute; de former des jeunes citoyens responsables, performants et b&acirc;tisseur.</div>'),
(231, 39, 3, 'Institut Superieur Saint Michel Itaosy', 'Établissement Supérieur Catholique professionnalisant sous l’égide des Pères Carmes, l’Institut Supérieur Saint Michel Itaosy, ISSMI a été fondé en 2003, avec l’agrément d’ouverture du Ministère de l’Enseignement Supérieur et de la Recherche Scientifique : ARRETE N° 532-2005/MENRS.', '<p style="text-align: justify;">&Eacute;tablissement Sup&eacute;rieur Catholique professionnalisant sous l&rsquo;&eacute;gide des P&egrave;res Carmes, l&rsquo;Institut Sup&eacute;rieur Saint Michel Itaosy, ISSMI a &eacute;t&eacute; fond&eacute; en 2003, avec l&rsquo;agr&eacute;ment d&rsquo;ouverture du Minist&egrave;re de l&rsquo;Enseignement Sup&eacute;rieur et de la Recherche Scientifique : ARRETE N&deg; 532-2005/MENRS. Les dipl&ocirc;mes d&eacute;livr&eacute;s &agrave; l&rsquo;ISSMI sont reconnus par la Fonction Publique avec &eacute;quivalence administrative :<br />Bac +2 : Ex Cat IV Echelle B1 (Arr&ecirc;t&eacute; : 3491/2009-CNEAT)<br />Bac+3 : Ex Cat V Echelle A3 (Arr&ecirc;t&eacute; : 3493/ 2009-CNEAT)<br /><br />Les offres de formations &agrave; l&rsquo;ISSMI sont habilit&eacute;es par le Minist&egrave;re de l&rsquo;Enseignement Sup&eacute;rieur et de la recherche Scientifique :<br />TOURISME ENVIRONNEMENT HOTELLERIE T.E.H : Arr&ecirc;t&eacute; 1072/2014-MESupRES<br />GESTION : Arr&ecirc;t&eacute; 1949/2013- MESupRES<br />INFORMATIQUE : Arr&ecirc;t&eacute; 36831/2013- MESupRES<br /><br />Mission :<br />S&rsquo;ins&eacute;rant dans les &oelig;uvres &eacute;ducationnelles Carm&eacute;litaines, sa mise en place est une continuit&eacute; logique des travaux entrepris dans&nbsp; le cadre des &eacute;coles, des coll&egrave;ges et des lyc&eacute;es des districts de toute l&rsquo;Ile, o&ugrave; l&rsquo;Ordre est pr&eacute;sent. &laquo; Rester et Devenir Meilleur &raquo;, telle est sa devise. Il ambitionne ainsi dans un effort quasi permanent, de toujours fournir le meilleur de lui-m&ecirc;me afin de couronner de succ&egrave;s tout ce qu&rsquo;il entreprend. Se d&eacute;finir par rapport &agrave; soi ne suffit cependant pas, se positionner par rapport aux autres est aussi une autre paire de manche. Le statut de &laquo; meilleur &raquo; n&rsquo;est paradoxalement pas statique et n&rsquo;est jamais acquis d&eacute;finitivement, le chemin de la victoire et sem&eacute; d&rsquo;embuches et d&rsquo;obstacles &agrave; surmonter. Le monde concurrentiel est complexe et en incessante &eacute;volution et il nous appartient de suivre et&nbsp; de vivre ce dynamique afin de r&eacute;ussir sur tous les plans. Viser la formation int&eacute;grale de l&rsquo;homme, c&rsquo;est pr&eacute;server l&rsquo;&eacute;quilibre entre le corps, le c&oelig;ur, et l&rsquo;&acirc;me, c&rsquo;est aussi r&eacute;pondre &agrave; l&rsquo;imp&eacute;ratif du triptyque : qualit&eacute;, rigueur, t&eacute;moignage de foi vivante. Il s&rsquo;agit en r&eacute;sum&eacute; de former des jeunes citoyens responsables, performants et b&acirc;tisseur.</p>'),
(232, 39, 4, 'Institut Superieur Saint Michel Itaosy', 'Établissement Supérieur Catholique professionnalisant sous l’égide des Pères Carmes, l’Institut Supérieur Saint Michel Itaosy, ISSMI a été fondé en 2003, avec l’agrément d’ouverture du Ministère de l’Enseignement Supérieur et de la Recherche Scientifique : ARRETE N° 532-2005/MENRS.', '<p style="text-align: justify;">&Eacute;tablissement Sup&eacute;rieur Catholique professionnalisant sous l&rsquo;&eacute;gide des P&egrave;res Carmes, l&rsquo;Institut Sup&eacute;rieur Saint Michel Itaosy, ISSMI a &eacute;t&eacute; fond&eacute; en 2003, avec l&rsquo;agr&eacute;ment d&rsquo;ouverture du Minist&egrave;re de l&rsquo;Enseignement Sup&eacute;rieur et de la Recherche Scientifique : ARRETE N&deg; 532-2005/MENRS. Les dipl&ocirc;mes d&eacute;livr&eacute;s &agrave; l&rsquo;ISSMI sont reconnus par la Fonction Publique avec &eacute;quivalence administrative :<br />Bac +2 : Ex Cat IV Echelle B1 (Arr&ecirc;t&eacute; : 3491/2009-CNEAT)<br />Bac+3 : Ex Cat V Echelle A3 (Arr&ecirc;t&eacute; : 3493/ 2009-CNEAT)<br /><br />Les offres de formations &agrave; l&rsquo;ISSMI sont habilit&eacute;es par le Minist&egrave;re de l&rsquo;Enseignement Sup&eacute;rieur et de la recherche Scientifique :<br />TOURISME ENVIRONNEMENT HOTELLERIE T.E.H : Arr&ecirc;t&eacute; 1072/2014-MESupRES<br />GESTION : Arr&ecirc;t&eacute; 1949/2013- MESupRES<br />INFORMATIQUE : Arr&ecirc;t&eacute; 36831/2013- MESupRES<br /><br />Mission :<br />S&rsquo;ins&eacute;rant dans les &oelig;uvres &eacute;ducationnelles Carm&eacute;litaines, sa mise en place est une continuit&eacute; logique des travaux entrepris dans&nbsp; le cadre des &eacute;coles, des coll&egrave;ges et des lyc&eacute;es des districts de toute l&rsquo;Ile, o&ugrave; l&rsquo;Ordre est pr&eacute;sent. &laquo; Rester et Devenir Meilleur &raquo;, telle est sa devise. Il ambitionne ainsi dans un effort quasi permanent, de toujours fournir le meilleur de lui-m&ecirc;me afin de couronner de succ&egrave;s tout ce qu&rsquo;il entreprend. Se d&eacute;finir par rapport &agrave; soi ne suffit cependant pas, se positionner par rapport aux autres est aussi une autre paire de manche. Le statut de &laquo; meilleur &raquo; n&rsquo;est paradoxalement pas statique et n&rsquo;est jamais acquis d&eacute;finitivement, le chemin de la victoire et sem&eacute; d&rsquo;embuches et d&rsquo;obstacles &agrave; surmonter. Le monde concurrentiel est complexe et en incessante &eacute;volution et il nous appartient de suivre et&nbsp; de vivre ce dynamique afin de r&eacute;ussir sur tous les plans. Viser la formation int&eacute;grale de l&rsquo;homme, c&rsquo;est pr&eacute;server l&rsquo;&eacute;quilibre entre le corps, le c&oelig;ur, et l&rsquo;&acirc;me, c&rsquo;est aussi r&eacute;pondre &agrave; l&rsquo;imp&eacute;ratif du triptyque : qualit&eacute;, rigueur, t&eacute;moignage de foi vivante. Il s&rsquo;agit en r&eacute;sum&eacute; de former des jeunes citoyens responsables, performants et b&acirc;tisseur.</p>'),
(233, 39, 5, 'Institut Superieur Saint Michel Itaosy', 'Établissement Supérieur Catholique professionnalisant sous l’égide des Pères Carmes, l’Institut Supérieur Saint Michel Itaosy, ISSMI a été fondé en 2003, avec l’agrément d’ouverture du Ministère de l’Enseignement Supérieur et de la Recherche Scientifique : ARRETE N° 532-2005/MENRS.', '<p style="text-align: justify;">&Eacute;tablissement Sup&eacute;rieur Catholique professionnalisant sous l&rsquo;&eacute;gide des P&egrave;res Carmes, l&rsquo;Institut Sup&eacute;rieur Saint Michel Itaosy, ISSMI a &eacute;t&eacute; fond&eacute; en 2003, avec l&rsquo;agr&eacute;ment d&rsquo;ouverture du Minist&egrave;re de l&rsquo;Enseignement Sup&eacute;rieur et de la Recherche Scientifique : ARRETE N&deg; 532-2005/MENRS. Les dipl&ocirc;mes d&eacute;livr&eacute;s &agrave; l&rsquo;ISSMI sont reconnus par la Fonction Publique avec &eacute;quivalence administrative :<br />Bac +2 : Ex Cat IV Echelle B1 (Arr&ecirc;t&eacute; : 3491/2009-CNEAT)<br />Bac+3 : Ex Cat V Echelle A3 (Arr&ecirc;t&eacute; : 3493/ 2009-CNEAT)<br /><br />Les offres de formations &agrave; l&rsquo;ISSMI sont habilit&eacute;es par le Minist&egrave;re de l&rsquo;Enseignement Sup&eacute;rieur et de la recherche Scientifique :<br />TOURISME ENVIRONNEMENT HOTELLERIE T.E.H : Arr&ecirc;t&eacute; 1072/2014-MESupRES<br />GESTION : Arr&ecirc;t&eacute; 1949/2013- MESupRES<br />INFORMATIQUE : Arr&ecirc;t&eacute; 36831/2013- MESupRES<br /><br />Mission :<br />S&rsquo;ins&eacute;rant dans les &oelig;uvres &eacute;ducationnelles Carm&eacute;litaines, sa mise en place est une continuit&eacute; logique des travaux entrepris dans&nbsp; le cadre des &eacute;coles, des coll&egrave;ges et des lyc&eacute;es des districts de toute l&rsquo;Ile, o&ugrave; l&rsquo;Ordre est pr&eacute;sent. &laquo; Rester et Devenir Meilleur &raquo;, telle est sa devise. Il ambitionne ainsi dans un effort quasi permanent, de toujours fournir le meilleur de lui-m&ecirc;me afin de couronner de succ&egrave;s tout ce qu&rsquo;il entreprend. Se d&eacute;finir par rapport &agrave; soi ne suffit cependant pas, se positionner par rapport aux autres est aussi une autre paire de manche. Le statut de &laquo; meilleur &raquo; n&rsquo;est paradoxalement pas statique et n&rsquo;est jamais acquis d&eacute;finitivement, le chemin de la victoire et sem&eacute; d&rsquo;embuches et d&rsquo;obstacles &agrave; surmonter. Le monde concurrentiel est complexe et en incessante &eacute;volution et il nous appartient de suivre et&nbsp; de vivre ce dynamique afin de r&eacute;ussir sur tous les plans. Viser la formation int&eacute;grale de l&rsquo;homme, c&rsquo;est pr&eacute;server l&rsquo;&eacute;quilibre entre le corps, le c&oelig;ur, et l&rsquo;&acirc;me, c&rsquo;est aussi r&eacute;pondre &agrave; l&rsquo;imp&eacute;ratif du triptyque : qualit&eacute;, rigueur, t&eacute;moignage de foi vivante. Il s&rsquo;agit en r&eacute;sum&eacute; de former des jeunes citoyens responsables, performants et b&acirc;tisseur.</p>'),
(234, 39, 6, 'Institut Superieur Saint Michel Itaosy', 'Établissement Supérieur Catholique professionnalisant sous l’égide des Pères Carmes, l’Institut Supérieur Saint Michel Itaosy, ISSMI a été fondé en 2003, avec l’agrément d’ouverture du Ministère de l’Enseignement Supérieur et de la Recherche Scientifique : ARRETE N° 532-2005/MENRS.', '<p style="text-align: justify;">&Eacute;tablissement Sup&eacute;rieur Catholique professionnalisant sous l&rsquo;&eacute;gide des P&egrave;res Carmes, l&rsquo;Institut Sup&eacute;rieur Saint Michel Itaosy, ISSMI a &eacute;t&eacute; fond&eacute; en 2003, avec l&rsquo;agr&eacute;ment d&rsquo;ouverture du Minist&egrave;re de l&rsquo;Enseignement Sup&eacute;rieur et de la Recherche Scientifique : ARRETE N&deg; 532-2005/MENRS. Les dipl&ocirc;mes d&eacute;livr&eacute;s &agrave; l&rsquo;ISSMI sont reconnus par la Fonction Publique avec &eacute;quivalence administrative :<br />Bac +2 : Ex Cat IV Echelle B1 (Arr&ecirc;t&eacute; : 3491/2009-CNEAT)<br />Bac+3 : Ex Cat V Echelle A3 (Arr&ecirc;t&eacute; : 3493/ 2009-CNEAT)<br /><br />Les offres de formations &agrave; l&rsquo;ISSMI sont habilit&eacute;es par le Minist&egrave;re de l&rsquo;Enseignement Sup&eacute;rieur et de la recherche Scientifique :<br />TOURISME ENVIRONNEMENT HOTELLERIE T.E.H : Arr&ecirc;t&eacute; 1072/2014-MESupRES<br />GESTION : Arr&ecirc;t&eacute; 1949/2013- MESupRES<br />INFORMATIQUE : Arr&ecirc;t&eacute; 36831/2013- MESupRES<br /><br />Mission :<br />S&rsquo;ins&eacute;rant dans les &oelig;uvres &eacute;ducationnelles Carm&eacute;litaines, sa mise en place est une continuit&eacute; logique des travaux entrepris dans&nbsp; le cadre des &eacute;coles, des coll&egrave;ges et des lyc&eacute;es des districts de toute l&rsquo;Ile, o&ugrave; l&rsquo;Ordre est pr&eacute;sent. &laquo; Rester et Devenir Meilleur &raquo;, telle est sa devise. Il ambitionne ainsi dans un effort quasi permanent, de toujours fournir le meilleur de lui-m&ecirc;me afin de couronner de succ&egrave;s tout ce qu&rsquo;il entreprend. Se d&eacute;finir par rapport &agrave; soi ne suffit cependant pas, se positionner par rapport aux autres est aussi une autre paire de manche. Le statut de &laquo; meilleur &raquo; n&rsquo;est paradoxalement pas statique et n&rsquo;est jamais acquis d&eacute;finitivement, le chemin de la victoire et sem&eacute; d&rsquo;embuches et d&rsquo;obstacles &agrave; surmonter. Le monde concurrentiel est complexe et en incessante &eacute;volution et il nous appartient de suivre et&nbsp; de vivre ce dynamique afin de r&eacute;ussir sur tous les plans. Viser la formation int&eacute;grale de l&rsquo;homme, c&rsquo;est pr&eacute;server l&rsquo;&eacute;quilibre entre le corps, le c&oelig;ur, et l&rsquo;&acirc;me, c&rsquo;est aussi r&eacute;pondre &agrave; l&rsquo;imp&eacute;ratif du triptyque : qualit&eacute;, rigueur, t&eacute;moignage de foi vivante. Il s&rsquo;agit en r&eacute;sum&eacute; de former des jeunes citoyens responsables, performants et b&acirc;tisseur.</p>'),
(235, 1, 1, 'Institut national des sciences comptables et de l''administration d''entreprises', 'Institut national des sciences comptables eInstitut national des sciences comptables et de l''administration d''entreprisesInstitut national des sciences comptables et de l''administration d''entreprisesInstitut national des sciences comptables et de l''administration d''entreprisest de l''administration d''entreprisesInstitut national des sciences comptables et de l''administration d''entreprises', '<p>Institut national des sciences comptables et de l''administration d''entreprisesInstitut national des sciences comptables et de l''administration d''entreprisesInstitut national des sciences comptables et de l''administration d''entreprisesInstitut national des sciences comptables et de l''administration d''entreprisesInstitut national des sciences comptables et de l''administration d''entreprisesInstitut national des sciences comptables et de l''administration d''entreprisesInstitut national des sciences comptables et de l''administration d''entreprisesInstitut national des sciences comptables et de l''administration d''entreprisesInstitut national des sciences comptables et de l''administration d''entreprises</p>'),
(236, 40, 1, 'IT University', 'IT University est un établissement d’enseignement supérieur privé spécialisé en informatique, nouvellement créé, pour répondre aux  besoins du secteur professionnel en matière de nouvelles technologies.', '<p>IT University est un &eacute;tablissement d&rsquo;enseignement sup&eacute;rieur priv&eacute; sp&eacute;cialis&eacute; en informatique, nouvellement cr&eacute;&eacute;, pour r&eacute;pondre aux&nbsp; besoins du secteur professionnel en mati&egrave;re de nouvelles technologies.<br /><br />IT University adopte le syst&egrave;me LMD et offre actuellement une formation de 3ans apr&egrave;s le BAC, dans les modules suivants :<br />&nbsp;&nbsp;&nbsp; Licence sp&eacute;cialis&eacute;e en d&eacute;veloppement d&rsquo;applications (Programmation)<br />&nbsp;&nbsp;&nbsp; Licence sp&eacute;cialis&eacute;e en Base de donn&eacute;es et R&eacute;seaux<br />&nbsp;&nbsp;&nbsp; Licence sp&eacute;cialis&eacute;e&nbsp; en Web Int&eacute;gration et Web designer<br /><br />Apr&egrave;s ce programme , tous les sortants d&rsquo;IT University seront&nbsp; tout de suite op&eacute;rationnels, IT University met surtout en exergue la base math&eacute;matique dans son programme, afin de permettre aux &eacute;tudiants d&rsquo;avoir un bon niveau de raisonnement&nbsp; et&nbsp; de continuer leurs &eacute;tudes en master et en doctorat.</p>'),
(237, 40, 2, 'IT University', 'IT University est un établissement d’enseignement supérieur privé spécialisé en informatique, nouvellement créé, pour répondre aux  besoins du secteur professionnel en matière de nouvelles technologies.', '<p>IT University est un &eacute;tablissement d&rsquo;enseignement sup&eacute;rieur priv&eacute; sp&eacute;cialis&eacute; en informatique, nouvellement cr&eacute;&eacute;, pour r&eacute;pondre aux&nbsp; besoins du secteur professionnel en mati&egrave;re de nouvelles technologies.<br /><br />IT University adopte le syst&egrave;me LMD et offre actuellement une formation de 3ans apr&egrave;s le BAC, dans les modules suivants :<br />&nbsp;&nbsp;&nbsp; Licence sp&eacute;cialis&eacute;e en d&eacute;veloppement d&rsquo;applications (Programmation)<br />&nbsp;&nbsp;&nbsp; Licence sp&eacute;cialis&eacute;e en Base de donn&eacute;es et R&eacute;seaux<br />&nbsp;&nbsp;&nbsp; Licence sp&eacute;cialis&eacute;e&nbsp; en Web Int&eacute;gration et Web designer<br /><br />Apr&egrave;s ce programme , tous les sortants d&rsquo;IT University seront&nbsp; tout de suite op&eacute;rationnels, IT University met surtout en exergue la base math&eacute;matique dans son programme, afin de permettre aux &eacute;tudiants d&rsquo;avoir un bon niveau de raisonnement&nbsp; et&nbsp; de continuer leurs &eacute;tudes en master et en doctorat.</p>'),
(238, 40, 3, 'IT University', 'IT University est un établissement d’enseignement supérieur privé spécialisé en informatique, nouvellement créé, pour répondre aux  besoins du secteur professionnel en matière de nouvelles technologies.', '<p>IT University est un &eacute;tablissement d&rsquo;enseignement sup&eacute;rieur priv&eacute; sp&eacute;cialis&eacute; en informatique, nouvellement cr&eacute;&eacute;, pour r&eacute;pondre aux&nbsp; besoins du secteur professionnel en mati&egrave;re de nouvelles technologies.<br /><br />IT University adopte le syst&egrave;me LMD et offre actuellement une formation de 3ans apr&egrave;s le BAC, dans les modules suivants :<br />&nbsp;&nbsp;&nbsp; Licence sp&eacute;cialis&eacute;e en d&eacute;veloppement d&rsquo;applications (Programmation)<br />&nbsp;&nbsp;&nbsp; Licence sp&eacute;cialis&eacute;e en Base de donn&eacute;es et R&eacute;seaux<br />&nbsp;&nbsp;&nbsp; Licence sp&eacute;cialis&eacute;e&nbsp; en Web Int&eacute;gration et Web designer<br /><br />Apr&egrave;s ce programme , tous les sortants d&rsquo;IT University seront&nbsp; tout de suite op&eacute;rationnels, IT University met surtout en exergue la base math&eacute;matique dans son programme, afin de permettre aux &eacute;tudiants d&rsquo;avoir un bon niveau de raisonnement&nbsp; et&nbsp; de continuer leurs &eacute;tudes en master et en doctorat.</p>'),
(239, 40, 4, 'IT University', 'IT University est un établissement d’enseignement supérieur privé spécialisé en informatique, nouvellement créé, pour répondre aux  besoins du secteur professionnel en matière de nouvelles technologies.', '<p>IT University est un &eacute;tablissement d&rsquo;enseignement sup&eacute;rieur priv&eacute; sp&eacute;cialis&eacute; en informatique, nouvellement cr&eacute;&eacute;, pour r&eacute;pondre aux&nbsp; besoins du secteur professionnel en mati&egrave;re de nouvelles technologies.<br /><br />IT University adopte le syst&egrave;me LMD et offre actuellement une formation de 3ans apr&egrave;s le BAC, dans les modules suivants :<br />&nbsp;&nbsp;&nbsp; Licence sp&eacute;cialis&eacute;e en d&eacute;veloppement d&rsquo;applications (Programmation)<br />&nbsp;&nbsp;&nbsp; Licence sp&eacute;cialis&eacute;e en Base de donn&eacute;es et R&eacute;seaux<br />&nbsp;&nbsp;&nbsp; Licence sp&eacute;cialis&eacute;e&nbsp; en Web Int&eacute;gration et Web designer<br /><br />Apr&egrave;s ce programme , tous les sortants d&rsquo;IT University seront&nbsp; tout de suite op&eacute;rationnels, IT University met surtout en exergue la base math&eacute;matique dans son programme, afin de permettre aux &eacute;tudiants d&rsquo;avoir un bon niveau de raisonnement&nbsp; et&nbsp; de continuer leurs &eacute;tudes en master et en doctorat.</p>'),
(240, 40, 5, 'IT University', 'IT University est un établissement d’enseignement supérieur privé spécialisé en informatique, nouvellement créé, pour répondre aux  besoins du secteur professionnel en matière de nouvelles technologies.', '<p>IT University est un &eacute;tablissement d&rsquo;enseignement sup&eacute;rieur priv&eacute; sp&eacute;cialis&eacute; en informatique, nouvellement cr&eacute;&eacute;, pour r&eacute;pondre aux&nbsp; besoins du secteur professionnel en mati&egrave;re de nouvelles technologies.<br /><br />IT University adopte le syst&egrave;me LMD et offre actuellement une formation de 3ans apr&egrave;s le BAC, dans les modules suivants :<br />&nbsp;&nbsp;&nbsp; Licence sp&eacute;cialis&eacute;e en d&eacute;veloppement d&rsquo;applications (Programmation)<br />&nbsp;&nbsp;&nbsp; Licence sp&eacute;cialis&eacute;e en Base de donn&eacute;es et R&eacute;seaux<br />&nbsp;&nbsp;&nbsp; Licence sp&eacute;cialis&eacute;e&nbsp; en Web Int&eacute;gration et Web designer<br /><br />Apr&egrave;s ce programme , tous les sortants d&rsquo;IT University seront&nbsp; tout de suite op&eacute;rationnels, IT University met surtout en exergue la base math&eacute;matique dans son programme, afin de permettre aux &eacute;tudiants d&rsquo;avoir un bon niveau de raisonnement&nbsp; et&nbsp; de continuer leurs &eacute;tudes en master et en doctorat.</p>');
INSERT INTO `sl_school_translate` (`id`, `school_id`, `locale_id`, `name`, `short_description`, `description`) VALUES
(241, 40, 6, 'IT University', 'IT University est un établissement d’enseignement supérieur privé spécialisé en informatique, nouvellement créé, pour répondre aux  besoins du secteur professionnel en matière de nouvelles technologies.', '<p>IT University est un &eacute;tablissement d&rsquo;enseignement sup&eacute;rieur priv&eacute; sp&eacute;cialis&eacute; en informatique, nouvellement cr&eacute;&eacute;, pour r&eacute;pondre aux&nbsp; besoins du secteur professionnel en mati&egrave;re de nouvelles technologies.<br /><br />IT University adopte le syst&egrave;me LMD et offre actuellement une formation de 3ans apr&egrave;s le BAC, dans les modules suivants :<br />&nbsp;&nbsp;&nbsp; Licence sp&eacute;cialis&eacute;e en d&eacute;veloppement d&rsquo;applications (Programmation)<br />&nbsp;&nbsp;&nbsp; Licence sp&eacute;cialis&eacute;e en Base de donn&eacute;es et R&eacute;seaux<br />&nbsp;&nbsp;&nbsp; Licence sp&eacute;cialis&eacute;e&nbsp; en Web Int&eacute;gration et Web designer<br /><br />Apr&egrave;s ce programme , tous les sortants d&rsquo;IT University seront&nbsp; tout de suite op&eacute;rationnels, IT University met surtout en exergue la base math&eacute;matique dans son programme, afin de permettre aux &eacute;tudiants d&rsquo;avoir un bon niveau de raisonnement&nbsp; et&nbsp; de continuer leurs &eacute;tudes en master et en doctorat.</p>'),
(242, 41, 1, 'Institut de Management des Arts et Metiers', 'L''IMGAM forme des professionnels de Madagascar depuis bientôt 25 ans. L''institut situé dans un quartier estimé de la capitale, offre aux jeunes un choix de diplômes de reconnaissance nationale et internationale, reconnu par le Ministère de la fonction publique malgache et divers partenaires internationaux tels que l''IDRAC France, le HEC ... Des milliers de jeunes formés à l''IMGAM ont su tirer profits des formations alliant l''académique à l''expérience professionnelle. Nos étudiants ont pour la plupart intégré rapidement le monde du travail et occupent aujourd''hui des postes de responsabilité dans plusieurs grandes entreprises tant à Madagascar qu''à l''étranger. Proche du monde de l''entreprise, les formations de l''IMGAM s''adaptent à la fois aux besoins des étudiants et aux éxigences du marché du travail.', '<p>L''IMGAM forme des professionnels de Madagascar depuis bient&ocirc;t 25 ans. L''institut situ&eacute; dans un quartier estim&eacute; de la capitale, offre aux jeunes un choix de dipl&ocirc;mes de reconnaissance nationale et internationale, reconnu par le Minist&egrave;re de la fonction publique malgache et divers partenaires internationaux tels que l''IDRAC France, le HEC ... Des milliers de jeunes form&eacute;s &agrave; l''IMGAM ont su tirer profits des formations alliant l''acad&eacute;mique &agrave; l''exp&eacute;rience professionnelle. Nos &eacute;tudiants ont pour la plupart int&eacute;gr&eacute; rapidement le monde du travail et occupent aujourd''hui des postes de responsabilit&eacute; dans plusieurs grandes entreprises tant &agrave; Madagascar qu''&agrave; l''&eacute;tranger. Proche du monde de l''entreprise, les formations de l''IMGAM s''adaptent &agrave; la fois aux besoins des &eacute;tudiants et aux &eacute;xigences du march&eacute; du travail.</p>'),
(243, 41, 2, 'Institut de Management des Arts et Metiers', 'L''IMGAM forme des professionnels de Madagascar depuis bientôt 25 ans. L''institut situé dans un quartier estimé de la capitale, offre aux jeunes un choix de diplômes de reconnaissance nationale et internationale, reconnu par le Ministère de la fonction publique malgache et divers partenaires internationaux tels que l''IDRAC France, le HEC ... Des milliers de jeunes formés à l''IMGAM ont su tirer profits des formations alliant l''académique à l''expérience professionnelle. Nos étudiants ont pour la plupart intégré rapidement le monde du travail et occupent aujourd''hui des postes de responsabilité dans plusieurs grandes entreprises tant à Madagascar qu''à l''étranger. Proche du monde de l''entreprise, les formations de l''IMGAM s''adaptent à la fois aux besoins des étudiants et aux éxigences du marché du travail.', '<p>L''IMGAM forme des professionnels de Madagascar depuis bient&ocirc;t 25 ans. L''institut situ&eacute; dans un quartier estim&eacute; de la capitale, offre aux jeunes un choix de dipl&ocirc;mes de reconnaissance nationale et internationale, reconnu par le Minist&egrave;re de la fonction publique malgache et divers partenaires internationaux tels que l''IDRAC France, le HEC ... Des milliers de jeunes form&eacute;s &agrave; l''IMGAM ont su tirer profits des formations alliant l''acad&eacute;mique &agrave; l''exp&eacute;rience professionnelle. Nos &eacute;tudiants ont pour la plupart int&eacute;gr&eacute; rapidement le monde du travail et occupent aujourd''hui des postes de responsabilit&eacute; dans plusieurs grandes entreprises tant &agrave; Madagascar qu''&agrave; l''&eacute;tranger. Proche du monde de l''entreprise, les formations de l''IMGAM s''adaptent &agrave; la fois aux besoins des &eacute;tudiants et aux &eacute;xigences du march&eacute; du travail.</p>'),
(244, 41, 3, 'Institut de Management des Arts et Metiers', 'L''IMGAM forme des professionnels de Madagascar depuis bientôt 25 ans. L''institut situé dans un quartier estimé de la capitale, offre aux jeunes un choix de diplômes de reconnaissance nationale et internationale, reconnu par le Ministère de la fonction publique malgache et divers partenaires internationaux tels que l''IDRAC France, le HEC ... Des milliers de jeunes formés à l''IMGAM ont su tirer profits des formations alliant l''académique à l''expérience professionnelle. Nos étudiants ont pour la plupart intégré rapidement le monde du travail et occupent aujourd''hui des postes de responsabilité dans plusieurs grandes entreprises tant à Madagascar qu''à l''étranger. Proche du monde de l''entreprise, les formations de l''IMGAM s''adaptent à la fois aux besoins des étudiants et aux éxigences du marché du travail.', '<p>L''IMGAM forme des professionnels de Madagascar depuis bient&ocirc;t 25 ans. L''institut situ&eacute; dans un quartier estim&eacute; de la capitale, offre aux jeunes un choix de dipl&ocirc;mes de reconnaissance nationale et internationale, reconnu par le Minist&egrave;re de la fonction publique malgache et divers partenaires internationaux tels que l''IDRAC France, le HEC ... Des milliers de jeunes form&eacute;s &agrave; l''IMGAM ont su tirer profits des formations alliant l''acad&eacute;mique &agrave; l''exp&eacute;rience professionnelle. Nos &eacute;tudiants ont pour la plupart int&eacute;gr&eacute; rapidement le monde du travail et occupent aujourd''hui des postes de responsabilit&eacute; dans plusieurs grandes entreprises tant &agrave; Madagascar qu''&agrave; l''&eacute;tranger. Proche du monde de l''entreprise, les formations de l''IMGAM s''adaptent &agrave; la fois aux besoins des &eacute;tudiants et aux &eacute;xigences du march&eacute; du travail.</p>'),
(245, 41, 4, 'Institut de Management des Arts et Metiers', 'L''IMGAM forme des professionnels de Madagascar depuis bientôt 25 ans. L''institut situé dans un quartier estimé de la capitale, offre aux jeunes un choix de diplômes de reconnaissance nationale et internationale, reconnu par le Ministère de la fonction publique malgache et divers partenaires internationaux tels que l''IDRAC France, le HEC ... Des milliers de jeunes formés à l''IMGAM ont su tirer profits des formations alliant l''académique à l''expérience professionnelle. Nos étudiants ont pour la plupart intégré rapidement le monde du travail et occupent aujourd''hui des postes de responsabilité dans plusieurs grandes entreprises tant à Madagascar qu''à l''étranger. Proche du monde de l''entreprise, les formations de l''IMGAM s''adaptent à la fois aux besoins des étudiants et aux éxigences du marché du travail.', '<p>L''IMGAM forme des professionnels de Madagascar depuis bient&ocirc;t 25 ans. L''institut situ&eacute; dans un quartier estim&eacute; de la capitale, offre aux jeunes un choix de dipl&ocirc;mes de reconnaissance nationale et internationale, reconnu par le Minist&egrave;re de la fonction publique malgache et divers partenaires internationaux tels que l''IDRAC France, le HEC ... Des milliers de jeunes form&eacute;s &agrave; l''IMGAM ont su tirer profits des formations alliant l''acad&eacute;mique &agrave; l''exp&eacute;rience professionnelle. Nos &eacute;tudiants ont pour la plupart int&eacute;gr&eacute; rapidement le monde du travail et occupent aujourd''hui des postes de responsabilit&eacute; dans plusieurs grandes entreprises tant &agrave; Madagascar qu''&agrave; l''&eacute;tranger. Proche du monde de l''entreprise, les formations de l''IMGAM s''adaptent &agrave; la fois aux besoins des &eacute;tudiants et aux &eacute;xigences du march&eacute; du travail.</p>'),
(246, 41, 5, 'Institut de Management des Arts et Metiers', 'L''IMGAM forme des professionnels de Madagascar depuis bientôt 25 ans. L''institut situé dans un quartier estimé de la capitale, offre aux jeunes un choix de diplômes de reconnaissance nationale et internationale, reconnu par le Ministère de la fonction publique malgache et divers partenaires internationaux tels que l''IDRAC France, le HEC ... Des milliers de jeunes formés à l''IMGAM ont su tirer profits des formations alliant l''académique à l''expérience professionnelle. Nos étudiants ont pour la plupart intégré rapidement le monde du travail et occupent aujourd''hui des postes de responsabilité dans plusieurs grandes entreprises tant à Madagascar qu''à l''étranger. Proche du monde de l''entreprise, les formations de l''IMGAM s''adaptent à la fois aux besoins des étudiants et aux éxigences du marché du travail.', '<p>L''IMGAM forme des professionnels de Madagascar depuis bient&ocirc;t 25 ans. L''institut situ&eacute; dans un quartier estim&eacute; de la capitale, offre aux jeunes un choix de dipl&ocirc;mes de reconnaissance nationale et internationale, reconnu par le Minist&egrave;re de la fonction publique malgache et divers partenaires internationaux tels que l''IDRAC France, le HEC ... Des milliers de jeunes form&eacute;s &agrave; l''IMGAM ont su tirer profits des formations alliant l''acad&eacute;mique &agrave; l''exp&eacute;rience professionnelle. Nos &eacute;tudiants ont pour la plupart int&eacute;gr&eacute; rapidement le monde du travail et occupent aujourd''hui des postes de responsabilit&eacute; dans plusieurs grandes entreprises tant &agrave; Madagascar qu''&agrave; l''&eacute;tranger. Proche du monde de l''entreprise, les formations de l''IMGAM s''adaptent &agrave; la fois aux besoins des &eacute;tudiants et aux &eacute;xigences du march&eacute; du travail.</p>'),
(247, 41, 6, 'Institut de Management des Arts et Metiers', 'L''IMGAM forme des professionnels de Madagascar depuis bientôt 25 ans. L''institut situé dans un quartier estimé de la capitale, offre aux jeunes un choix de diplômes de reconnaissance nationale et internationale, reconnu par le Ministère de la fonction publique malgache et divers partenaires internationaux tels que l''IDRAC France, le HEC ... Des milliers de jeunes formés à l''IMGAM ont su tirer profits des formations alliant l''académique à l''expérience professionnelle. Nos étudiants ont pour la plupart intégré rapidement le monde du travail et occupent aujourd''hui des postes de responsabilité dans plusieurs grandes entreprises tant à Madagascar qu''à l''étranger. Proche du monde de l''entreprise, les formations de l''IMGAM s''adaptent à la fois aux besoins des étudiants et aux éxigences du marché du travail.', '<p>L''IMGAM forme des professionnels de Madagascar depuis bient&ocirc;t 25 ans. L''institut situ&eacute; dans un quartier estim&eacute; de la capitale, offre aux jeunes un choix de dipl&ocirc;mes de reconnaissance nationale et internationale, reconnu par le Minist&egrave;re de la fonction publique malgache et divers partenaires internationaux tels que l''IDRAC France, le HEC ... Des milliers de jeunes form&eacute;s &agrave; l''IMGAM ont su tirer profits des formations alliant l''acad&eacute;mique &agrave; l''exp&eacute;rience professionnelle. Nos &eacute;tudiants ont pour la plupart int&eacute;gr&eacute; rapidement le monde du travail et occupent aujourd''hui des postes de responsabilit&eacute; dans plusieurs grandes entreprises tant &agrave; Madagascar qu''&agrave; l''&eacute;tranger. Proche du monde de l''entreprise, les formations de l''IMGAM s''adaptent &agrave; la fois aux besoins des &eacute;tudiants et aux &eacute;xigences du march&eacute; du travail.</p>'),
(248, 43, 1, 'Institut des Sciences Médicales, de l’Administration et de Technologie', 'fr. Short description .ist', '<p>fr. Description .ist</p>'),
(249, 43, 2, 'Institut des Sciences Médicales, de l’Administration et de Technologie', 'en. Short description .ist', '<p>en. Description .ist</p>'),
(250, 43, 3, 'Institut des Sciences Médicales, de l’Administration et de Technologie', 'mg. Short description .ist', '<p>mg. Description .ist</p>'),
(251, 43, 4, 'Institut des Sciences Médicales, de l’Administration et de Technologie', 'it. Short description .ist', '<p>it. Description .ist</p>'),
(252, 43, 5, 'Institut des Sciences Médicales, de l’Administration et de Technologie', 'es. Short description .ist', '<p>es. Description .ist</p>'),
(253, 43, 6, 'Institut des Sciences Médicales, de l’Administration et de Technologie', 'de. Short description .ist', '<p>de. Description .ist</p>'),
(254, 44, 1, 'Institut Supérieur Prive Madagascar Développement Formation', 'fr. Short description .ist', '<p>fr. Description .ist</p>'),
(255, 44, 2, 'Institut Supérieur Prive Madagascar Développement Formation', 'en. Short description .ist', '<p>en. Description .ist</p>'),
(256, 44, 3, 'Institut Supérieur Prive Madagascar Développement Formation', 'mg. Short description .ist', '<p>mg. Description .ist</p>'),
(257, 44, 4, 'Institut Supérieur Prive Madagascar Développement Formation', 'it. Short description .ist', '<p>it. Description .ist</p>'),
(258, 44, 5, 'Institut Supérieur Prive Madagascar Développement Formation', 'es. Short description .ist', '<p>es. Description .ist</p>'),
(259, 44, 6, 'Institut Supérieur Prive Madagascar Développement Formation', 'de. Short description .ist', '<p>de. Description .ist</p>'),
(260, 45, 1, 'Ecole Nationale de la Magistrature et des Greffes', 'Ecole Nationale de la Magistrature et des Greffes', '<p>Ecole Nationale de la Magistrature et des Greffes</p>'),
(261, 45, 2, 'Ecole Nationale de la Magistrature et des Greffes', 'en. Short description .ceci-dfj-klfjqkls-fjlkqdsjfljslfjs-jlsdj-ldjfldj-kl sjd-skldf jslkdjf-lksdjfsj- fsjdf-s jkdlfj-skldfj-lsd jfsjkld-slkdjflsdj-fl sj dlfjsldkfjlsd-fljkjsdklf-jlskdfjlk-ssdjf-lskjflksdj-sj-dklfjsk-sldfjlk-jslkdceci-dfj-klfjqkls-fjlkqdsjfljslfjs-jlsdj-ldjfldj-klsceci-dfj-klfjqkls-fjlkqdsjfljslfjs-jlsdj-ldjfldj-kl sjd-skldf jslkdjf-lksdjfsj- fsjdf-s jkdlfj-skldfj-lsd jfsjkld-slkdjflsdj-fl sj dlfjsldkfjlsd-fljkjsdklf-jlskdfjlk-ssdjf-lskjflksdj-sj-dklfjsk-sldfjlk-jslkdceci-dfj-klfjqkls-fjlkqdsjfljslfjs-jlsdj-ldjfldj-kls', '<p>en. Description .ceci-dfj-klfjqkls-fjlkqdsjfljslfjs-jlsdj-ldjfldj-kl sjd-skldf jslkdjf-lksdjfsj- fsjdf-s jkdlfj-skldfj-lsd jfsjkld-slkdjflsdj-fl sj dlfjsldkfjlsd-fljkjsdklf-jlskdfjlk-ssdjf-lskjflksdj-sj-dklfjsk-sldfjlk-jslkdceci-dfj-klfjqkls-fjlkqdsjfljslfjs-jlsdj-ldjfldj-klsceci-dfj-klfjqkls-fjlkqdsjfljslfjs-jlsdj-ldjfldj-kl sjd-skldf jslkdjf-lksdjfsj- fsjdf-s jkdlfj-skldfj-lsd jfsjkld-slkdjflsdj-fl sj dlfjsldkfjlsd-fljkjsdklf-jlskdfjlk-ssdjf-lskjflksdj-sj-dklfjsk-sldfjlk-jslkdceci-dfj-klfjqkls-fjlkqdsjfljslfjs-jlsdj-ldjfldj-kls</p>'),
(262, 45, 3, 'Ecole Nationale de la Magistrature et des Greffes', 'mg. Short description .ceci-dfj-klfjqkls-fjlkqdsjfljslfjs-jlsdj-ldjfldj-kl sjd-skldf jslkdjf-lksdjfsj- fsjdf-s jkdlfj-skldfj-lsd jfsjkld-slkdjflsdj-fl sj dlfjsldkfjlsd-fljkjsdklf-jlskdfjlk-ssdjf-lskjflksdj-sj-dklfjsk-sldfjlk-jslkdceci-dfj-klfjqkls-fjlkqdsjfljslfjs-jlsdj-ldjfldj-klsceci-dfj-klfjqkls-fjlkqdsjfljslfjs-jlsdj-ldjfldj-kl sjd-skldf jslkdjf-lksdjfsj- fsjdf-s jkdlfj-skldfj-lsd jfsjkld-slkdjflsdj-fl sj dlfjsldkfjlsd-fljkjsdklf-jlskdfjlk-ssdjf-lskjflksdj-sj-dklfjsk-sldfjlk-jslkdceci-dfj-klfjqkls-fjlkqdsjfljslfjs-jlsdj-ldjfldj-kls', '<p>mg. Description .ceci-dfj-klfjqkls-fjlkqdsjfljslfjs-jlsdj-ldjfldj-kl sjd-skldf jslkdjf-lksdjfsj- fsjdf-s jkdlfj-skldfj-lsd jfsjkld-slkdjflsdj-fl sj dlfjsldkfjlsd-fljkjsdklf-jlskdfjlk-ssdjf-lskjflksdj-sj-dklfjsk-sldfjlk-jslkdceci-dfj-klfjqkls-fjlkqdsjfljslfjs-jlsdj-ldjfldj-klsceci-dfj-klfjqkls-fjlkqdsjfljslfjs-jlsdj-ldjfldj-kl sjd-skldf jslkdjf-lksdjfsj- fsjdf-s jkdlfj-skldfj-lsd jfsjkld-slkdjflsdj-fl sj dlfjsldkfjlsd-fljkjsdklf-jlskdfjlk-ssdjf-lskjflksdj-sj-dklfjsk-sldfjlk-jslkdceci-dfj-klfjqkls-fjlkqdsjfljslfjs-jlsdj-ldjfldj-kls</p>'),
(263, 45, 4, 'Ecole Nationale de la Magistrature et des Greffes', 'it. Short description .ceci-dfj-klfjqkls-fjlkqdsjfljslfjs-jlsdj-ldjfldj-kl sjd-skldf jslkdjf-lksdjfsj- fsjdf-s jkdlfj-skldfj-lsd jfsjkld-slkdjflsdj-fl sj dlfjsldkfjlsd-fljkjsdklf-jlskdfjlk-ssdjf-lskjflksdj-sj-dklfjsk-sldfjlk-jslkdceci-dfj-klfjqkls-fjlkqdsjfljslfjs-jlsdj-ldjfldj-klsceci-dfj-klfjqkls-fjlkqdsjfljslfjs-jlsdj-ldjfldj-kl sjd-skldf jslkdjf-lksdjfsj- fsjdf-s jkdlfj-skldfj-lsd jfsjkld-slkdjflsdj-fl sj dlfjsldkfjlsd-fljkjsdklf-jlskdfjlk-ssdjf-lskjflksdj-sj-dklfjsk-sldfjlk-jslkdceci-dfj-klfjqkls-fjlkqdsjfljslfjs-jlsdj-ldjfldj-kls', '<p>it. Description .ceci-dfj-klfjqkls-fjlkqdsjfljslfjs-jlsdj-ldjfldj-kl sjd-skldf jslkdjf-lksdjfsj- fsjdf-s jkdlfj-skldfj-lsd jfsjkld-slkdjflsdj-fl sj dlfjsldkfjlsd-fljkjsdklf-jlskdfjlk-ssdjf-lskjflksdj-sj-dklfjsk-sldfjlk-jslkdceci-dfj-klfjqkls-fjlkqdsjfljslfjs-jlsdj-ldjfldj-klsceci-dfj-klfjqkls-fjlkqdsjfljslfjs-jlsdj-ldjfldj-kl sjd-skldf jslkdjf-lksdjfsj- fsjdf-s jkdlfj-skldfj-lsd jfsjkld-slkdjflsdj-fl sj dlfjsldkfjlsd-fljkjsdklf-jlskdfjlk-ssdjf-lskjflksdj-sj-dklfjsk-sldfjlk-jslkdceci-dfj-klfjqkls-fjlkqdsjfljslfjs-jlsdj-ldjfldj-kls</p>'),
(264, 45, 5, 'Ecole Nationale de la Magistrature et des Greffes', 'es. Short description .ceci-dfj-klfjqkls-fjlkqdsjfljslfjs-jlsdj-ldjfldj-kl sjd-skldf jslkdjf-lksdjfsj- fsjdf-s jkdlfj-skldfj-lsd jfsjkld-slkdjflsdj-fl sj dlfjsldkfjlsd-fljkjsdklf-jlskdfjlk-ssdjf-lskjflksdj-sj-dklfjsk-sldfjlk-jslkdceci-dfj-klfjqkls-fjlkqdsjfljslfjs-jlsdj-ldjfldj-klsceci-dfj-klfjqkls-fjlkqdsjfljslfjs-jlsdj-ldjfldj-kl sjd-skldf jslkdjf-lksdjfsj- fsjdf-s jkdlfj-skldfj-lsd jfsjkld-slkdjflsdj-fl sj dlfjsldkfjlsd-fljkjsdklf-jlskdfjlk-ssdjf-lskjflksdj-sj-dklfjsk-sldfjlk-jslkdceci-dfj-klfjqkls-fjlkqdsjfljslfjs-jlsdj-ldjfldj-kls', '<p>es. Description .ceci-dfj-klfjqkls-fjlkqdsjfljslfjs-jlsdj-ldjfldj-kl sjd-skldf jslkdjf-lksdjfsj- fsjdf-s jkdlfj-skldfj-lsd jfsjkld-slkdjflsdj-fl sj dlfjsldkfjlsd-fljkjsdklf-jlskdfjlk-ssdjf-lskjflksdj-sj-dklfjsk-sldfjlk-jslkdceci-dfj-klfjqkls-fjlkqdsjfljslfjs-jlsdj-ldjfldj-klsceci-dfj-klfjqkls-fjlkqdsjfljslfjs-jlsdj-ldjfldj-kl sjd-skldf jslkdjf-lksdjfsj- fsjdf-s jkdlfj-skldfj-lsd jfsjkld-slkdjflsdj-fl sj dlfjsldkfjlsd-fljkjsdklf-jlskdfjlk-ssdjf-lskjflksdj-sj-dklfjsk-sldfjlk-jslkdceci-dfj-klfjqkls-fjlkqdsjfljslfjs-jlsdj-ldjfldj-kls</p>'),
(265, 45, 6, 'Ecole Nationale de la Magistrature et des Greffes', 'de. Short description .ceci-dfj-klfjqkls-fjlkqdsjfljslfjs-jlsdj-ldjfldj-kl sjd-skldf jslkdjf-lksdjfsj- fsjdf-s jkdlfj-skldfj-lsd jfsjkld-slkdjflsdj-fl sj dlfjsldkfjlsd-fljkjsdklf-jlskdfjlk-ssdjf-lskjflksdj-sj-dklfjsk-sldfjlk-jslkdceci-dfj-klfjqkls-fjlkqdsjfljslfjs-jlsdj-ldjfldj-klsceci-dfj-klfjqkls-fjlkqdsjfljslfjs-jlsdj-ldjfldj-kl sjd-skldf jslkdjf-lksdjfsj- fsjdf-s jkdlfj-skldfj-lsd jfsjkld-slkdjflsdj-fl sj dlfjsldkfjlsd-fljkjsdklf-jlskdfjlk-ssdjf-lskjflksdj-sj-dklfjsk-sldfjlk-jslkdceci-dfj-klfjqkls-fjlkqdsjfljslfjs-jlsdj-ldjfldj-kls', '<p>de. Description .ceci-dfj-klfjqkls-fjlkqdsjfljslfjs-jlsdj-ldjfldj-kl sjd-skldf jslkdjf-lksdjfsj- fsjdf-s jkdlfj-skldfj-lsd jfsjkld-slkdjflsdj-fl sj dlfjsldkfjlsd-fljkjsdklf-jlskdfjlk-ssdjf-lskjflksdj-sj-dklfjsk-sldfjlk-jslkdceci-dfj-klfjqkls-fjlkqdsjfljslfjs-jlsdj-ldjfldj-klsceci-dfj-klfjqkls-fjlkqdsjfljslfjs-jlsdj-ldjfldj-kl sjd-skldf jslkdjf-lksdjfsj- fsjdf-s jkdlfj-skldfj-lsd jfsjkld-slkdjflsdj-fl sj dlfjsldkfjlsd-fljkjsdklf-jlskdfjlk-ssdjf-lskjflksdj-sj-dklfjsk-sldfjlk-jslkdceci-dfj-klfjqkls-fjlkqdsjfljslfjs-jlsdj-ldjfldj-kls</p>'),
(266, 46, 1, 'Oio scholl', 'Specimen. Coactique aliquotiens nostri pedites ad eos persequendos scandere clivos sublimes etiam si lapsantibus plantis fruticeta prensando vel dumos ad vertices venerint summos, inter arta tamen et invia nullas acies explicare permissi nec firmare nisu valido gressus: hoste discursatore rupium abscisa volvente, ruinis ponderum inmanium consternuntur, aut ex necessitate ultima fortiter dimicante, superati periculose per prona discedunt. Hanc regionem praestitutis celebritati diebus invadere parans dux ante edictus per solitudines Aboraeque amnis herbidas ripas, suorum indicio proditus, qui admissi flagitii metu exagitati ad praesidia descivere Romana. absque ullo egressus effectu deinde tabescebat immobilis.', '<p style="text-align: justify;">Specimen. Post haec Gallus Hierapolim profecturus ut expeditioni specie tenus adesset, Antiochensi plebi suppliciter obsecranti ut inediae dispelleret metum, quae per multas difficilisque causas adfore iam sperabatur, non ut mos est principibus, quorum diffusa potestas localibus subinde medetur aerumnis, disponi quicquam statuit vel ex provinciis alimenta transferri conterminis, sed consularem Syriae Theophilum prope adstantem ultima metuenti multitudini dedit id adsidue replicando quod invito rectore nullus egere poterit victu. Nihil est enim virtute amabilius, nihil quod magis adliciat ad diligendum, quippe cum propter virtutem et probitatem etiam eos, quos numquam vidimus, quodam modo diligamus. Quis est qui C. Fabrici, M''. Curi non cum caritate aliqua benevola memoriam usurpet, quos numquam viderit? quis autem est, qui Tarquinium Superbum, qui Sp. Cassium, Sp. Maelium non oderit? Cum duobus ducibus de imperio in Italia est decertatum, Pyrrho et Hannibale; ab altero propter probitatem eius non nimis alienos animos habemus, alterum propter crudelitatem semper haec civitas oderit.<br /><br />Excitavit hic ardor milites per municipia plurima, quae isdem conterminant, dispositos et castella, sed quisque serpentes latius pro viribus repellere moliens, nunc globis confertos, aliquotiens et dispersos multitudine superabatur ingenti, quae nata et educata inter editos recurvosque ambitus montium eos ut loca plana persultat et mollia, missilibus obvios eminus lacessens et ululatu truci perterrens. Metuentes igitur idem latrones Lycaoniam magna parte campestrem cum se inpares nostris fore congressione stataria documentis frequentibus scirent, tramitibus deviis petivere Pamphyliam diu quidem intactam sed timore populationum et caedium, milite per omnia diffuso propinqua, magnis undique praesidiis conmunitam.<br /><br />Et interdum acciderat, ut siquid in penetrali secreto nullo citerioris vitae ministro praesente paterfamilias uxori susurrasset in aurem, velut Amphiarao referente aut Marcio, quondam vatibus inclitis, postridie disceret imperator. ideoque etiam parietes arcanorum soli conscii timebantur. Abusus enim multitudine hominum, quam tranquillis in rebus diutius rexit, ex agrestibus habitaculis urbes construxit multis opibus firmas et viribus, quarum ad praesens pleraeque licet Graecis nominibus appellentur, quae isdem ad arbitrium inposita sunt conditoris, primigenia tamen nomina non amittunt, quae eis Assyria lingua institutores veteres indiderunt.</p>'),
(267, 46, 2, 'Oio scholl', 'Specimen. Coactique aliquotiens nostri pedites ad eos persequendos scandere clivos sublimes etiam si lapsantibus plantis fruticeta prensando vel dumos ad vertices venerint summos, inter arta tamen et invia nullas acies explicare permissi nec firmare nisu valido gressus: hoste discursatore rupium abscisa volvente, ruinis ponderum inmanium consternuntur, aut ex necessitate ultima fortiter dimicante, superati periculose per prona discedunt. Hanc regionem praestitutis celebritati diebus invadere parans dux ante edictus per solitudines Aboraeque amnis herbidas ripas, suorum indicio proditus, qui admissi flagitii metu exagitati ad praesidia descivere Romana. absque ullo egressus effectu deinde tabescebat immobilis.', '<p style="text-align: justify;">Specimen. Post haec Gallus Hierapolim profecturus ut expeditioni specie tenus adesset, Antiochensi plebi suppliciter obsecranti ut inediae dispelleret metum, quae per multas difficilisque causas adfore iam sperabatur, non ut mos est principibus, quorum diffusa potestas localibus subinde medetur aerumnis, disponi quicquam statuit vel ex provinciis alimenta transferri conterminis, sed consularem Syriae Theophilum prope adstantem ultima metuenti multitudini dedit id adsidue replicando quod invito rectore nullus egere poterit victu. Nihil est enim virtute amabilius, nihil quod magis adliciat ad diligendum, quippe cum propter virtutem et probitatem etiam eos, quos numquam vidimus, quodam modo diligamus. Quis est qui C. Fabrici, M''. Curi non cum caritate aliqua benevola memoriam usurpet, quos numquam viderit? quis autem est, qui Tarquinium Superbum, qui Sp. Cassium, Sp. Maelium non oderit? Cum duobus ducibus de imperio in Italia est decertatum, Pyrrho et Hannibale; ab altero propter probitatem eius non nimis alienos animos habemus, alterum propter crudelitatem semper haec civitas oderit.<br /><br />Excitavit hic ardor milites per municipia plurima, quae isdem conterminant, dispositos et castella, sed quisque serpentes latius pro viribus repellere moliens, nunc globis confertos, aliquotiens et dispersos multitudine superabatur ingenti, quae nata et educata inter editos recurvosque ambitus montium eos ut loca plana persultat et mollia, missilibus obvios eminus lacessens et ululatu truci perterrens. Metuentes igitur idem latrones Lycaoniam magna parte campestrem cum se inpares nostris fore congressione stataria documentis frequentibus scirent, tramitibus deviis petivere Pamphyliam diu quidem intactam sed timore populationum et caedium, milite per omnia diffuso propinqua, magnis undique praesidiis conmunitam.<br /><br />Et interdum acciderat, ut siquid in penetrali secreto nullo citerioris vitae ministro praesente paterfamilias uxori susurrasset in aurem, velut Amphiarao referente aut Marcio, quondam vatibus inclitis, postridie disceret imperator. ideoque etiam parietes arcanorum soli conscii timebantur. Abusus enim multitudine hominum, quam tranquillis in rebus diutius rexit, ex agrestibus habitaculis urbes construxit multis opibus firmas et viribus, quarum ad praesens pleraeque licet Graecis nominibus appellentur, quae isdem ad arbitrium inposita sunt conditoris, primigenia tamen nomina non amittunt, quae eis Assyria lingua institutores veteres indiderunt.</p>'),
(268, 46, 3, 'Oio scholl', 'Specimen. Coactique aliquotiens nostri pedites ad eos persequendos scandere clivos sublimes etiam si lapsantibus plantis fruticeta prensando vel dumos ad vertices venerint summos, inter arta tamen et invia nullas acies explicare permissi nec firmare nisu valido gressus: hoste discursatore rupium abscisa volvente, ruinis ponderum inmanium consternuntur, aut ex necessitate ultima fortiter dimicante, superati periculose per prona discedunt. Hanc regionem praestitutis celebritati diebus invadere parans dux ante edictus per solitudines Aboraeque amnis herbidas ripas, suorum indicio proditus, qui admissi flagitii metu exagitati ad praesidia descivere Romana. absque ullo egressus effectu deinde tabescebat immobilis.', '<p style="text-align: justify;">Specimen. Post haec Gallus Hierapolim profecturus ut expeditioni specie tenus adesset, Antiochensi plebi suppliciter obsecranti ut inediae dispelleret metum, quae per multas difficilisque causas adfore iam sperabatur, non ut mos est principibus, quorum diffusa potestas localibus subinde medetur aerumnis, disponi quicquam statuit vel ex provinciis alimenta transferri conterminis, sed consularem Syriae Theophilum prope adstantem ultima metuenti multitudini dedit id adsidue replicando quod invito rectore nullus egere poterit victu. Nihil est enim virtute amabilius, nihil quod magis adliciat ad diligendum, quippe cum propter virtutem et probitatem etiam eos, quos numquam vidimus, quodam modo diligamus. Quis est qui C. Fabrici, M''. Curi non cum caritate aliqua benevola memoriam usurpet, quos numquam viderit? quis autem est, qui Tarquinium Superbum, qui Sp. Cassium, Sp. Maelium non oderit? Cum duobus ducibus de imperio in Italia est decertatum, Pyrrho et Hannibale; ab altero propter probitatem eius non nimis alienos animos habemus, alterum propter crudelitatem semper haec civitas oderit.<br /><br />Excitavit hic ardor milites per municipia plurima, quae isdem conterminant, dispositos et castella, sed quisque serpentes latius pro viribus repellere moliens, nunc globis confertos, aliquotiens et dispersos multitudine superabatur ingenti, quae nata et educata inter editos recurvosque ambitus montium eos ut loca plana persultat et mollia, missilibus obvios eminus lacessens et ululatu truci perterrens. Metuentes igitur idem latrones Lycaoniam magna parte campestrem cum se inpares nostris fore congressione stataria documentis frequentibus scirent, tramitibus deviis petivere Pamphyliam diu quidem intactam sed timore populationum et caedium, milite per omnia diffuso propinqua, magnis undique praesidiis conmunitam.<br /><br />Et interdum acciderat, ut siquid in penetrali secreto nullo citerioris vitae ministro praesente paterfamilias uxori susurrasset in aurem, velut Amphiarao referente aut Marcio, quondam vatibus inclitis, postridie disceret imperator. ideoque etiam parietes arcanorum soli conscii timebantur. Abusus enim multitudine hominum, quam tranquillis in rebus diutius rexit, ex agrestibus habitaculis urbes construxit multis opibus firmas et viribus, quarum ad praesens pleraeque licet Graecis nominibus appellentur, quae isdem ad arbitrium inposita sunt conditoris, primigenia tamen nomina non amittunt, quae eis Assyria lingua institutores veteres indiderunt.</p>'),
(269, 46, 4, 'Oio scholl', 'Specimen. Coactique aliquotiens nostri pedites ad eos persequendos scandere clivos sublimes etiam si lapsantibus plantis fruticeta prensando vel dumos ad vertices venerint summos, inter arta tamen et invia nullas acies explicare permissi nec firmare nisu valido gressus: hoste discursatore rupium abscisa volvente, ruinis ponderum inmanium consternuntur, aut ex necessitate ultima fortiter dimicante, superati periculose per prona discedunt. Hanc regionem praestitutis celebritati diebus invadere parans dux ante edictus per solitudines Aboraeque amnis herbidas ripas, suorum indicio proditus, qui admissi flagitii metu exagitati ad praesidia descivere Romana. absque ullo egressus effectu deinde tabescebat immobilis.', '<p style="text-align: justify;">Specimen. Post haec Gallus Hierapolim profecturus ut expeditioni specie tenus adesset, Antiochensi plebi suppliciter obsecranti ut inediae dispelleret metum, quae per multas difficilisque causas adfore iam sperabatur, non ut mos est principibus, quorum diffusa potestas localibus subinde medetur aerumnis, disponi quicquam statuit vel ex provinciis alimenta transferri conterminis, sed consularem Syriae Theophilum prope adstantem ultima metuenti multitudini dedit id adsidue replicando quod invito rectore nullus egere poterit victu. Nihil est enim virtute amabilius, nihil quod magis adliciat ad diligendum, quippe cum propter virtutem et probitatem etiam eos, quos numquam vidimus, quodam modo diligamus. Quis est qui C. Fabrici, M''. Curi non cum caritate aliqua benevola memoriam usurpet, quos numquam viderit? quis autem est, qui Tarquinium Superbum, qui Sp. Cassium, Sp. Maelium non oderit? Cum duobus ducibus de imperio in Italia est decertatum, Pyrrho et Hannibale; ab altero propter probitatem eius non nimis alienos animos habemus, alterum propter crudelitatem semper haec civitas oderit.<br /><br />Excitavit hic ardor milites per municipia plurima, quae isdem conterminant, dispositos et castella, sed quisque serpentes latius pro viribus repellere moliens, nunc globis confertos, aliquotiens et dispersos multitudine superabatur ingenti, quae nata et educata inter editos recurvosque ambitus montium eos ut loca plana persultat et mollia, missilibus obvios eminus lacessens et ululatu truci perterrens. Metuentes igitur idem latrones Lycaoniam magna parte campestrem cum se inpares nostris fore congressione stataria documentis frequentibus scirent, tramitibus deviis petivere Pamphyliam diu quidem intactam sed timore populationum et caedium, milite per omnia diffuso propinqua, magnis undique praesidiis conmunitam.<br /><br />Et interdum acciderat, ut siquid in penetrali secreto nullo citerioris vitae ministro praesente paterfamilias uxori susurrasset in aurem, velut Amphiarao referente aut Marcio, quondam vatibus inclitis, postridie disceret imperator. ideoque etiam parietes arcanorum soli conscii timebantur. Abusus enim multitudine hominum, quam tranquillis in rebus diutius rexit, ex agrestibus habitaculis urbes construxit multis opibus firmas et viribus, quarum ad praesens pleraeque licet Graecis nominibus appellentur, quae isdem ad arbitrium inposita sunt conditoris, primigenia tamen nomina non amittunt, quae eis Assyria lingua institutores veteres indiderunt.</p>'),
(270, 46, 5, 'Oio scholl', 'Specimen. Coactique aliquotiens nostri pedites ad eos persequendos scandere clivos sublimes etiam si lapsantibus plantis fruticeta prensando vel dumos ad vertices venerint summos, inter arta tamen et invia nullas acies explicare permissi nec firmare nisu valido gressus: hoste discursatore rupium abscisa volvente, ruinis ponderum inmanium consternuntur, aut ex necessitate ultima fortiter dimicante, superati periculose per prona discedunt. Hanc regionem praestitutis celebritati diebus invadere parans dux ante edictus per solitudines Aboraeque amnis herbidas ripas, suorum indicio proditus, qui admissi flagitii metu exagitati ad praesidia descivere Romana. absque ullo egressus effectu deinde tabescebat immobilis.', '<p style="text-align: justify;">Specimen. Post haec Gallus Hierapolim profecturus ut expeditioni specie tenus adesset, Antiochensi plebi suppliciter obsecranti ut inediae dispelleret metum, quae per multas difficilisque causas adfore iam sperabatur, non ut mos est principibus, quorum diffusa potestas localibus subinde medetur aerumnis, disponi quicquam statuit vel ex provinciis alimenta transferri conterminis, sed consularem Syriae Theophilum prope adstantem ultima metuenti multitudini dedit id adsidue replicando quod invito rectore nullus egere poterit victu. Nihil est enim virtute amabilius, nihil quod magis adliciat ad diligendum, quippe cum propter virtutem et probitatem etiam eos, quos numquam vidimus, quodam modo diligamus. Quis est qui C. Fabrici, M''. Curi non cum caritate aliqua benevola memoriam usurpet, quos numquam viderit? quis autem est, qui Tarquinium Superbum, qui Sp. Cassium, Sp. Maelium non oderit? Cum duobus ducibus de imperio in Italia est decertatum, Pyrrho et Hannibale; ab altero propter probitatem eius non nimis alienos animos habemus, alterum propter crudelitatem semper haec civitas oderit.<br /><br />Excitavit hic ardor milites per municipia plurima, quae isdem conterminant, dispositos et castella, sed quisque serpentes latius pro viribus repellere moliens, nunc globis confertos, aliquotiens et dispersos multitudine superabatur ingenti, quae nata et educata inter editos recurvosque ambitus montium eos ut loca plana persultat et mollia, missilibus obvios eminus lacessens et ululatu truci perterrens. Metuentes igitur idem latrones Lycaoniam magna parte campestrem cum se inpares nostris fore congressione stataria documentis frequentibus scirent, tramitibus deviis petivere Pamphyliam diu quidem intactam sed timore populationum et caedium, milite per omnia diffuso propinqua, magnis undique praesidiis conmunitam.<br /><br />Et interdum acciderat, ut siquid in penetrali secreto nullo citerioris vitae ministro praesente paterfamilias uxori susurrasset in aurem, velut Amphiarao referente aut Marcio, quondam vatibus inclitis, postridie disceret imperator. ideoque etiam parietes arcanorum soli conscii timebantur. Abusus enim multitudine hominum, quam tranquillis in rebus diutius rexit, ex agrestibus habitaculis urbes construxit multis opibus firmas et viribus, quarum ad praesens pleraeque licet Graecis nominibus appellentur, quae isdem ad arbitrium inposita sunt conditoris, primigenia tamen nomina non amittunt, quae eis Assyria lingua institutores veteres indiderunt.</p>'),
(271, 46, 6, 'Oio scholl', 'Specimen. Coactique aliquotiens nostri pedites ad eos persequendos scandere clivos sublimes etiam si lapsantibus plantis fruticeta prensando vel dumos ad vertices venerint summos, inter arta tamen et invia nullas acies explicare permissi nec firmare nisu valido gressus: hoste discursatore rupium abscisa volvente, ruinis ponderum inmanium consternuntur, aut ex necessitate ultima fortiter dimicante, superati periculose per prona discedunt. Hanc regionem praestitutis celebritati diebus invadere parans dux ante edictus per solitudines Aboraeque amnis herbidas ripas, suorum indicio proditus, qui admissi flagitii metu exagitati ad praesidia descivere Romana. absque ullo egressus effectu deinde tabescebat immobilis.', '<p style="text-align: justify;">Specimen. Post haec Gallus Hierapolim profecturus ut expeditioni specie tenus adesset, Antiochensi plebi suppliciter obsecranti ut inediae dispelleret metum, quae per multas difficilisque causas adfore iam sperabatur, non ut mos est principibus, quorum diffusa potestas localibus subinde medetur aerumnis, disponi quicquam statuit vel ex provinciis alimenta transferri conterminis, sed consularem Syriae Theophilum prope adstantem ultima metuenti multitudini dedit id adsidue replicando quod invito rectore nullus egere poterit victu. Nihil est enim virtute amabilius, nihil quod magis adliciat ad diligendum, quippe cum propter virtutem et probitatem etiam eos, quos numquam vidimus, quodam modo diligamus. Quis est qui C. Fabrici, M''. Curi non cum caritate aliqua benevola memoriam usurpet, quos numquam viderit? quis autem est, qui Tarquinium Superbum, qui Sp. Cassium, Sp. Maelium non oderit? Cum duobus ducibus de imperio in Italia est decertatum, Pyrrho et Hannibale; ab altero propter probitatem eius non nimis alienos animos habemus, alterum propter crudelitatem semper haec civitas oderit.<br /><br />Excitavit hic ardor milites per municipia plurima, quae isdem conterminant, dispositos et castella, sed quisque serpentes latius pro viribus repellere moliens, nunc globis confertos, aliquotiens et dispersos multitudine superabatur ingenti, quae nata et educata inter editos recurvosque ambitus montium eos ut loca plana persultat et mollia, missilibus obvios eminus lacessens et ululatu truci perterrens. Metuentes igitur idem latrones Lycaoniam magna parte campestrem cum se inpares nostris fore congressione stataria documentis frequentibus scirent, tramitibus deviis petivere Pamphyliam diu quidem intactam sed timore populationum et caedium, milite per omnia diffuso propinqua, magnis undique praesidiis conmunitam.<br /><br />Et interdum acciderat, ut siquid in penetrali secreto nullo citerioris vitae ministro praesente paterfamilias uxori susurrasset in aurem, velut Amphiarao referente aut Marcio, quondam vatibus inclitis, postridie disceret imperator. ideoque etiam parietes arcanorum soli conscii timebantur. Abusus enim multitudine hominum, quam tranquillis in rebus diutius rexit, ex agrestibus habitaculis urbes construxit multis opibus firmas et viribus, quarum ad praesens pleraeque licet Graecis nominibus appellentur, quae isdem ad arbitrium inposita sunt conditoris, primigenia tamen nomina non amittunt, quae eis Assyria lingua institutores veteres indiderunt.</p>'),
(272, 47, 1, 'Institut Superieur des Sciences Technologiques', 'fr. Short description .Institut Superieur des Sciences Technologiques', 'fr. Description .Institut Superieur des Sciences Technologiques'),
(273, 47, 2, 'Institut Superieur des Sciences Technologiques', 'en. Short description .Institut Superieur des Sciences Technologiques', 'en. Description .Institut Superieur des Sciences Technologiques'),
(274, 47, 3, 'Institut Superieur des Sciences Technologiques', 'mg. Short description .Institut Superieur des Sciences Technologiques', 'mg. Description .Institut Superieur des Sciences Technologiques'),
(275, 47, 4, 'Institut Superieur des Sciences Technologiques', 'it. Short description .Institut Superieur des Sciences Technologiques', 'it. Description .Institut Superieur des Sciences Technologiques'),
(276, 47, 5, 'Institut Superieur des Sciences Technologiques', 'es. Short description .Institut Superieur des Sciences Technologiques', 'es. Description .Institut Superieur des Sciences Technologiques'),
(277, 47, 6, 'Institut Superieur des Sciences Technologiques', 'de. Short description .Institut Superieur des Sciences Technologiques', 'de. Description .Institut Superieur des Sciences Technologiques');

-- --------------------------------------------------------

--
-- Structure de la table `ur_avatar`
--

CREATE TABLE `ur_avatar` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `originalname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `current_avatar` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `ur_avatar`
--

INSERT INTO `ur_avatar` (`id`, `user_id`, `name`, `path`, `originalname`, `current_avatar`) VALUES
(1, 1, 'volkswagen.jpg', 'dd5894ee49fae2a834c947000e6450f44b8afdd1.jpeg', 'volkswagen.jpg', 0),
(2, 2, 'keeway.jpg', 'd225a722c1ccc06a04d9cca259e148906994c74b.jpeg', 'keeway.jpg', 0),
(3, 3, 'avatar.jpg', 'a6006d48d8be6e13735b7df2bab3dcc39467a5a3.jpeg', 'avatar.jpg', 1),
(4, 1, 'adiva.jpg', '79f07f0c0655e9e5889fee10c5229b55a4ede5d8.jpeg', 'adiva.jpg', 0),
(5, 2, 'proton.jpg', 'cb64ac226da459ab4928c130d2d2a2b46431cc9f.jpeg', 'proton.jpg', 0),
(6, 1, 'triumph.jpg', '9459460b8b36517b5a6dfcc8c49d7049514a6670.jpeg', 'triumph.jpg', 0),
(7, 2, 'gas-gas.jpg', '366d2d5977fb83a145a02d113e474bd18967024f.jpeg', 'gas-gas.jpg', 0),
(8, 5, 'maico.jpg', '478e354403496c20da05bba83ac4210908e00d85.jpeg', 'maico.jpg', 0),
(9, 5, 'renault.jpg', '88d38571309951e63e2347c2883c5eabf9289e97.jpeg', 'renault.jpg', 1),
(10, 1, 'beyond.jpg', '66427452d1527a5b0bcefd950ebb58d8973a4d46.jpeg', 'beyond.jpg', 0),
(11, 1, 'mg.jpg', '06d0a30528fd02b2a08ba88ac53339478122066d.jpeg', 'mg.jpg', 0),
(12, 1, 'hesketh.jpg', '021ed777c06ce7cd22364be6109b0f8d4cc95918.jpeg', 'hesketh.jpg', 0),
(13, 1, 'mini-bmw.jpg', '72324373f055032e777a58ec299581a31e0249ef.jpeg', 'mini-bmw.jpg', 0),
(14, 2, 'volkswagen.jpg', '4b8a6b0626ad11025c44151e508e7a0de89df44b.jpeg', 'volkswagen.jpg', 0),
(15, 1, 'skoda.jpg', '8d91cc0a0f43efdfa05ec71fbdc326a2d3719413.jpeg', 'skoda.jpg', 0),
(16, 1, 'saab.jpg', 'a688f2e84337987c30be3d3ee056e50538285ce1.jpeg', 'saab.jpg', 0),
(17, 1, 'tomos.jpg', '8ac7da7f539af1a7a9e49ff708a49488854c56e3.jpeg', 'tomos.jpg', 0),
(18, 1, 'vauxhall.jpg', 'db2920291665bfd1284e637272f3f2e569169789.jpeg', 'vauxhall.jpg', 0),
(19, 6, 'profilfemme.JPG', 'a607080125cc6ecb6dce1f7752a37c70f45c25e6.jpeg', 'profilfemme.JPG', 1),
(20, 7, 'profilfemme2.JPG', 'ec285cfe54e340903267de5424b4c6e74a9fefa0.jpeg', 'profilfemme2.JPG', 1),
(21, 10, 'peugeot.jpg', '46eadbf042388b758ad259f30f0f5b07fe0f4ff0.jpeg', 'peugeot.jpg', 1),
(22, 1, 'jaguar.jpg', '9f2dff07b008a0ca15831f2387729fc85b32c71d.jpeg', 'jaguar.jpg', 0),
(23, 8, 'profilfemme3.JPG', 'e239c6fe686cfc8b91be6c23f5ee69102e38feb8.jpeg', 'profilfemme3.JPG', 1),
(24, 1, 'fortunat.JPG', 'fa88a22858d9f22f55a1926e692f3d5d7cc4cea3.jpeg', 'fortunat.JPG', 0),
(25, 4, 'phone.JPG', '6036ae19ef106a7c22ccdd2a5b95a22f3d5306d8.jpeg', 'phone.JPG', 0),
(26, 1, 'conseil2.jpg', 'a45b7009eece8e0ecc44ae8783a72302d3fcaaed.jpeg', 'conseil2.jpg', 0),
(27, 11, 'icone_accueil.jpg', 'b8985cfbd03e270b7dc77ac700c286db142099dd.jpeg', 'icone_accueil.jpg', 1),
(28, 4, 'ppddff.jpg', '0a847df923de1e56e34d17913c9d8d62caf2f3cc.jpeg', 'ppddff.jpg', 1),
(29, 2, 'ur_icon.png', 'f0ab56ddc4315ddd37a16738136f2d641a194082.png', 'ur_icon.png', 1),
(30, 1, 'swag.jpg', '15b5f19c93c27f4ba3d829ad8c30cf7bcda947b4.jpeg', 'swag.jpg', 1);

-- --------------------------------------------------------

--
-- Structure de la table `ur_user`
--

CREATE TABLE `ur_user` (
  `id` int(11) NOT NULL,
  `locale_id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `biography` longtext COLLATE utf8_unicode_ci,
  `sex` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `ur_user`
--

INSERT INTO `ur_user` (`id`, `locale_id`, `username`, `email`, `password`, `salt`, `roles`, `location`, `name`, `biography`, `sex`) VALUES
(1, 1, 'user1', 'rchr@boot.com', 'Rm5EXn+/rs1DcjgIZk5AFf5+Lzpv//JwBjmn9rFjEqBnGQQEt/gL2KZnpD2dUX+ku1VVAlThH/DqKjdZeE823w==', '10e5f90d7339069fc348e82591d36cbd', 'a:1:{i:0;s:10:"ROLE_ADMIN";}', 'Barcelone', 'Rakotoarison Christiana', 'Milay be le mot latin. Tiako!!! Sady milay kely le script en latin. Aleo tonga de tsy ovaina tsony. paozinao hoatran''ny mot latin', 1),
(2, 2, 'user2', 'user2.fortunat@boot.com', 'LcI4TKVPhbdheLgGK7jygbUhMZcHpg1cRZSazjEq1CogQlx/E+iBwqNwBNLWCqV0CDeSJ3OW2uvXF+zAPaPPqw==', '10e5f90d7339069fc348e82591d36cbd', 'a:1:{i:0;s:10:"ROLE_ADMIN";}', 'location', 'scelerisque quis eget felis', 'An API endpoint "defines the address or connection point to a Web service. It is typically represented by a simple HTTP URL string". So basically, the endpoint URL is the URL of the web service that are you attempting to interact with.', 1),
(3, 1, 'user3', 'user3@boot.comk', 'wPscR9RyDzUt/1RawB/8cOdGt7CmIABQBSGcZG+et3V7jMXlywRMtMqBQ0djPX3FvcsZ+YTzgL8JXi5lGknWWA==', '10e5f90d7339069fc348e82591d36cbd', 'a:1:{i:0;s:10:"ROLE_ADMIN";}', 'Paris, France', 'Phasellus finibus volutpat', 'J''ai un fichier css qui ne fonctionne qu''à moitier. ... Float, fonctionne parfaitement mais font-style-type pas. .... d''aide concernant le code par MP ni par mail, le forum est là pour çaJ''ai un fichier css qui ne fonctionne qu''à moitier. ... Float, fonctionne parfaitement mais font-style-type pas. .... d''aide concernant le code par MP ni par mail, le forum est là pour ça', 1),
(4, 1, 'user4', 'user4@boot.com', 'SMoyWgVxVImkEm2gOSOX9q8Ep4bdvZ0ppFP5cTviqeaWA8CAuOCnwN56Qr4VYM7MDc+Wb0TaG8Rz5sMUXPyrmg==', '10e5f90d7339069fc348e82591d36cbd', 'a:1:{i:0;s:10:"ROLE_ADMIN";}', 'Ambatondrazaka', 'Jean Ranaivoarisoa', 'Vestibulum vitae accumsan turpis, ut sollicitudin ex. Cras bibendum bibendum pharetra. Vestibulum sed venenatis justo, sit amet feugiat lectus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed in iaculis leo. Integer vel diam iaculis, tincidunt nibh vitae, maximus nulla. Suspendisse at tincidunt elit. Maecenas mattis neque vehicula justo ornare dictum a vel risus.', 1),
(5, 2, 'user5', 'user5lauk@fr', 'xj4ORdkmhShk/d8x9orJiYUvtzBsuiFjJdmqsPW/OjTWDxH2YaC2NQQr13U6BfI/UDGxpmlqdr3w7hZSoNMS0Q==', 'ab4a12557c97c9f8b9edb18c4a958d62', 'a:0:{}', NULL, 'Rick Fullname', NULL, 1),
(6, 2, 'user6', 'user6@test.com', 'qyv7+4HEZZdA1RIKJB8OjDjUlTK8qH5oYUe6qwdHd7BItyyMNQn6TEn6g+Na6ytRa2O0+g5ipBsdYIYnemM0DA==', 'e2ed1681e1c2406d7993e5483d3440ee', 'a:0:{}', 'Antananarivo, Madagascar', 'Randrianilaina Modar', NULL, 1),
(7, 2, 'user7', 'user7@test.com', 'xlZcWUrXYj0KR5wHOrcFY5JWhJjhDGbx8Js24K2zM6EA9ZuJs+cOIV8CmSC5RbCrfRQt6CHl/rDCduPZW1v/0Q==', 'd51a1caa9758eb1c7f02ab99358a9bfe', 'a:0:{}', NULL, 'Ut laoreet malesuada', 'Phasellus vitae lorem id felis congue accumsan. Vestibulum dapibus nisl id lectus fringilla, quis semper eros volutpat. Cras mollis nec nibh vel lobortis. Phasellus nec ex vel dui sagittis ultricies id nec nulla. Fusce vulputate erat ligula, non imperdiet ante aliquam non. Pellentesque tristique, sapien nec dignissim porta, libero eros porta nulla, tincidunt facilisis risus ligula sed orci. Proin augue augue, iaculis et lorem sit amet, mollis rhoncus augue. Quisque posuere libero eget gravida imperdiet. Proin venenatis non massa vitae sagittis. Nunc nulla diam, sodales nec elit vitae, dignissim faucibus orci. Morbi congue mollis tellus non viverra.', 1),
(8, 2, 'user9', 'user9@test.com', 'w7VBKVNGUJYhhPgXW6lACvkSQuwIuA/5eeI/cX4Z/CsixkrUh+BKK5EcP3w3y6W2adOpq3Z+GhHGDGt2gBeX5g==', '204b4786d532eb7ee0c9d21c86becbf7', 'a:0:{}', 'Antananarivo, Madagascar', 'Tricia Rasoarivelo', NULL, 1),
(9, 2, 'user10', 'user10@test.fr', 'yYFbQVO55Ft3gfemf9/mLuZANzYQN60ZFCIWJjfzXl7flcp3a8o6j7lJsASQGtM+1yPUnh4N3Xyh+Q4ibS+YZg==', '1080a96af79c023968236b319f2a8f8f', 'a:0:{}', NULL, 'varius malesuada', NULL, 1),
(10, 2, 'user11', 'user11@test.mg', 'BkI0xzi1fpAn1FqO83dSXhWXBIduvSpL/2fi24ER24/iXQzyggvZBuloeT/Wdhxngud5UByIDAKe+PsJBLX/ow==', '4b053fa99ffc4a1cc9700bf265786a5c', 'a:0:{}', NULL, 'varius malesuada varius malesuada', 'Cras quis velit sed ipsum blandit sollicitudin. Etiam vel congue mi, non fermentum libero. Donec volutpat lobortis nisl non cursus. Suspendisse nec pharetra ex. Pellentesque et urna aliquet, sagittis justo ut, pellentesque justo. Aenean dignissim mollis tellus non aliquam. Donec nec orci in tortor elementum congue in ut odio. Ut laoreet malesuada quam nec elementum. Vivamus congue magna erat, vel sodales nulla tincidunt nec. Etiam lacinia ut libero nec tempus. Donec convallis tortor eget dictum rutrum. Mauris faucibus nisi eu tempor hendrerit. Quisque feugiat massa sem, non condimentum sem posuere at. Sed consequat placerat est, ac feugiat tortor scelerisque in. Aenean eget felis non massa sollicitudin tristique quis non nisl.', 1),
(11, 2, 'user8', 'user8@test.gr', 'zyMp6WTgNlbrnWCpTbKirngyf0LyV9A3v1M5XuRJGkcdwugghBO1tHXFDhIjN+Fn4h88o2tBTYBJHZ6cgi58EA==', 'fb7ca5cadd402273e1cefea70896a0d6', 'a:0:{}', 'Toamasina, Madagasikara', 'Donec arcu tortor', 'misaotra atsika rehetra; vita soama-tsara ny dejeuner dansante izay nokarakaraina. mankasitra indrindra t@ ezakin''ny tsirairay :)\ntohizo hatrany ny ezaka', 1),
(12, 2, 'user12', 'user12@test.fr', 'pQEY7AtTOeW5+xvwwXi3AwKhtOtgzZS28d7y+MXR7EEdE2M1Pfta1LIiH76YH431KosKgWthrNcm7q9GZizJCQ==', '7e80fa1c958dbea71aa8072a9b0aada7', 'a:0:{}', NULL, 'Sed posuere nisl sed', NULL, 2),
(13, 2, 'user13', 'user13@test.fr', 'hpWkc9h3xB9Rfwi4Sja5rWyiJqXL96sXaOW7cRR5UnQkHAn9OzZK1+PF9gKbL1b69XKN3jF2fYscTerEl07L+g==', '9f2330999f9fc22abfce99f245c2f412', 'a:0:{}', NULL, 'Nulla tempor auctor', NULL, 3);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `an_menu`
--
ALTER TABLE `an_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_64514B906B3AAD44` (`menu_parent_id`);

--
-- Index pour la table `at_advert`
--
ALTER TABLE `at_advert`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_B5A5D2D5A76ED395` (`user_id`);

--
-- Index pour la table `at_advert_illustration`
--
ALTER TABLE `at_advert_illustration`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_609DA49AD07ECCB6` (`advert_id`);

--
-- Index pour la table `at_advert_translate`
--
ALTER TABLE `at_advert_translate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_14A56637D07ECCB6` (`advert_id`),
  ADD KEY `IDX_14A56637E559DFD1` (`locale_id`);

--
-- Index pour la table `at_category`
--
ALTER TABLE `at_category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `at_category_advert`
--
ALTER TABLE `at_category_advert`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_B247CA89D07ECCB6` (`advert_id`),
  ADD KEY `IDX_B247CA8912469DE2` (`category_id`);

--
-- Index pour la table `at_category_translate`
--
ALTER TABLE `at_category_translate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_CB66A1BB12469DE2` (`category_id`),
  ADD KEY `IDX_CB66A1BBE559DFD1` (`locale_id`);

--
-- Index pour la table `bg_category`
--
ALTER TABLE `bg_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_9E81C913989D9B62` (`slug`);

--
-- Index pour la table `bg_category_post`
--
ALTER TABLE `bg_category_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_249F866B4B89032C` (`post_id`),
  ADD KEY `IDX_249F866B12469DE2` (`category_id`);

--
-- Index pour la table `bg_category_translate`
--
ALTER TABLE `bg_category_translate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_330CC802FE0617CD` (`category_id`),
  ADD KEY `IDX_330CC802E559DFD1` (`locale_id`);

--
-- Index pour la table `bg_post`
--
ALTER TABLE `bg_post`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_553956DB989D9B62` (`slug`),
  ADD KEY `IDX_553956DBA76ED395` (`user_id`);

--
-- Index pour la table `bg_post_illustration`
--
ALTER TABLE `bg_post_illustration`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_1D5592574B89032C` (`post_id`);

--
-- Index pour la table `bg_post_translate`
--
ALTER TABLE `bg_post_translate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_4A5A006E4B89032C` (`post_id`),
  ADD KEY `IDX_4A5A006EE559DFD1` (`locale_id`);

--
-- Index pour la table `et_event`
--
ALTER TABLE `et_event`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `fm_message`
--
ALTER TABLE `fm_message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_358874D923EDC87` (`subject_id`),
  ADD KEY `IDX_358874D9A76ED395` (`user_id`);

--
-- Index pour la table `fm_subject`
--
ALTER TABLE `fm_subject`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_78FB7ADC1F55203D` (`topic_id`),
  ADD KEY `IDX_78FB7ADCA76ED395` (`user_id`);

--
-- Index pour la table `fm_topic`
--
ALTER TABLE `fm_topic`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_3F7DC854A76ED395` (`user_id`);

--
-- Index pour la table `fm_topic_illustration`
--
ALTER TABLE `fm_topic_illustration`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_BFF5CDA31F55203D` (`topic_id`);

--
-- Index pour la table `fm_topic_translate`
--
ALTER TABLE `fm_topic_translate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_DD1214F21F55203D` (`topic_id`),
  ADD KEY `IDX_DD1214F2E559DFD1` (`locale_id`);

--
-- Index pour la table `pm_advert_school`
--
ALTER TABLE `pm_advert_school`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_4E94259FD07ECCB6` (`advert_id`),
  ADD KEY `IDX_4E94259FC32A47EE` (`school_id`),
  ADD KEY `IDX_4E94259FA76ED395` (`user_id`),
  ADD KEY `IDX_4E94259F797089C1` (`user_confirmation_id`);

--
-- Index pour la table `pm_comment`
--
ALTER TABLE `pm_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_3DF1E7654B89032C` (`post_id`),
  ADD KEY `IDX_3DF1E765A76ED395` (`user_id`),
  ADD KEY `IDX_3DF1E765D07ECCB6` (`advert_id`);

--
-- Index pour la table `pm_contact`
--
ALTER TABLE `pm_contact`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_E5E75331A76ED395` (`user_id`);

--
-- Index pour la table `pm_hashtag`
--
ALTER TABLE `pm_hashtag`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `pm_locale`
--
ALTER TABLE `pm_locale`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `pm_newsletter`
--
ALTER TABLE `pm_newsletter`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `pm_newsletter_mail`
--
ALTER TABLE `pm_newsletter_mail`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `pm_parameter`
--
ALTER TABLE `pm_parameter`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `pm_post_school`
--
ALTER TABLE `pm_post_school`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_9EDF3AED4B89032C` (`post_id`),
  ADD KEY `IDX_9EDF3AEDC32A47EE` (`school_id`),
  ADD KEY `IDX_9EDF3AEDA76ED395` (`user_id`),
  ADD KEY `IDX_9EDF3AED797089C1` (`user_confirmation_id`);

--
-- Index pour la table `pm_view`
--
ALTER TABLE `pm_view`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_A0943F59C32A47EE` (`school_id`),
  ADD KEY `IDX_A0943F594B89032C` (`post_id`),
  ADD KEY `IDX_A0943F59D07ECCB6` (`advert_id`),
  ADD KEY `IDX_A0943F59A76ED395` (`user_id`);

--
-- Index pour la table `sl_category`
--
ALTER TABLE `sl_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_91929EF989D9B62` (`slug`);

--
-- Index pour la table `sl_category_school`
--
ALTER TABLE `sl_category_school`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_C51E0541C32A47EE` (`school_id`),
  ADD KEY `IDX_C51E054112469DE2` (`category_id`);

--
-- Index pour la table `sl_category_translate`
--
ALTER TABLE `sl_category_translate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_195BCFBD12469DE2` (`category_id`),
  ADD KEY `IDX_195BCFBDE559DFD1` (`locale_id`);

--
-- Index pour la table `sl_cover`
--
ALTER TABLE `sl_cover`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_BD19A471C32A47EE` (`school_id`);

--
-- Index pour la table `sl_evaluation`
--
ALTER TABLE `sl_evaluation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_3EFD93A0C32A47EE` (`school_id`),
  ADD KEY `IDX_3EFD93A0A76ED395` (`user_id`);

--
-- Index pour la table `sl_field`
--
ALTER TABLE `sl_field`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_6BE467ECC32A47EE` (`school_id`);

--
-- Index pour la table `sl_field_translate`
--
ALTER TABLE `sl_field_translate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_9C7BF07C443707B0` (`field_id`),
  ADD KEY `IDX_9C7BF07CE559DFD1` (`locale_id`);

--
-- Index pour la table `sl_logo`
--
ALTER TABLE `sl_logo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_4053C7FCC32A47EE` (`school_id`);

--
-- Index pour la table `sl_school`
--
ALTER TABLE `sl_school`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_35A2BC0C989D9B62` (`slug`);

--
-- Index pour la table `sl_school_admin`
--
ALTER TABLE `sl_school_admin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_65013271C32A47EE` (`school_id`),
  ADD KEY `IDX_65013271A76ED395` (`user_id`);

--
-- Index pour la table `sl_school_contact`
--
ALTER TABLE `sl_school_contact`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_B545B0CDC32A47EE` (`school_id`);

--
-- Index pour la table `sl_school_contact_translate`
--
ALTER TABLE `sl_school_contact_translate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D1992B685200A5B8` (`school_contact_id`),
  ADD KEY `IDX_D1992B68E559DFD1` (`locale_id`);

--
-- Index pour la table `sl_school_of_the_day`
--
ALTER TABLE `sl_school_of_the_day`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_BE20BEF0C32A47EE` (`school_id`);

--
-- Index pour la table `sl_school_subscription`
--
ALTER TABLE `sl_school_subscription`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_3508E111C32A47EE` (`school_id`),
  ADD KEY `IDX_3508E111A76ED395` (`user_id`);

--
-- Index pour la table `sl_school_translate`
--
ALTER TABLE `sl_school_translate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_A1D37B69C32A47EE` (`school_id`),
  ADD KEY `IDX_A1D37B69E559DFD1` (`locale_id`);

--
-- Index pour la table `ur_avatar`
--
ALTER TABLE `ur_avatar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_C0604E0BA76ED395` (`user_id`);

--
-- Index pour la table `ur_user`
--
ALTER TABLE `ur_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_7342DD77F85E0677` (`username`),
  ADD UNIQUE KEY `UNIQ_7342DD77E7927C74` (`email`),
  ADD KEY `IDX_7342DD77E559DFD1` (`locale_id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `an_menu`
--
ALTER TABLE `an_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `at_advert`
--
ALTER TABLE `at_advert`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT pour la table `at_advert_illustration`
--
ALTER TABLE `at_advert_illustration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT pour la table `at_advert_translate`
--
ALTER TABLE `at_advert_translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT pour la table `at_category`
--
ALTER TABLE `at_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `at_category_advert`
--
ALTER TABLE `at_category_advert`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT pour la table `at_category_translate`
--
ALTER TABLE `at_category_translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT pour la table `bg_category`
--
ALTER TABLE `bg_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT pour la table `bg_category_post`
--
ALTER TABLE `bg_category_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT pour la table `bg_category_translate`
--
ALTER TABLE `bg_category_translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;
--
-- AUTO_INCREMENT pour la table `bg_post`
--
ALTER TABLE `bg_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT pour la table `bg_post_illustration`
--
ALTER TABLE `bg_post_illustration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT pour la table `bg_post_translate`
--
ALTER TABLE `bg_post_translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;
--
-- AUTO_INCREMENT pour la table `et_event`
--
ALTER TABLE `et_event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `fm_message`
--
ALTER TABLE `fm_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
--
-- AUTO_INCREMENT pour la table `fm_subject`
--
ALTER TABLE `fm_subject`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT pour la table `fm_topic`
--
ALTER TABLE `fm_topic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `fm_topic_illustration`
--
ALTER TABLE `fm_topic_illustration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT pour la table `fm_topic_translate`
--
ALTER TABLE `fm_topic_translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT pour la table `pm_advert_school`
--
ALTER TABLE `pm_advert_school`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT pour la table `pm_comment`
--
ALTER TABLE `pm_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;
--
-- AUTO_INCREMENT pour la table `pm_contact`
--
ALTER TABLE `pm_contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT pour la table `pm_hashtag`
--
ALTER TABLE `pm_hashtag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `pm_locale`
--
ALTER TABLE `pm_locale`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `pm_newsletter`
--
ALTER TABLE `pm_newsletter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `pm_newsletter_mail`
--
ALTER TABLE `pm_newsletter_mail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT pour la table `pm_parameter`
--
ALTER TABLE `pm_parameter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `pm_post_school`
--
ALTER TABLE `pm_post_school`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;
--
-- AUTO_INCREMENT pour la table `pm_view`
--
ALTER TABLE `pm_view`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1822;
--
-- AUTO_INCREMENT pour la table `sl_category`
--
ALTER TABLE `sl_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT pour la table `sl_category_school`
--
ALTER TABLE `sl_category_school`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;
--
-- AUTO_INCREMENT pour la table `sl_category_translate`
--
ALTER TABLE `sl_category_translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;
--
-- AUTO_INCREMENT pour la table `sl_cover`
--
ALTER TABLE `sl_cover`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;
--
-- AUTO_INCREMENT pour la table `sl_evaluation`
--
ALTER TABLE `sl_evaluation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;
--
-- AUTO_INCREMENT pour la table `sl_field`
--
ALTER TABLE `sl_field`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT pour la table `sl_field_translate`
--
ALTER TABLE `sl_field_translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=182;
--
-- AUTO_INCREMENT pour la table `sl_logo`
--
ALTER TABLE `sl_logo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;
--
-- AUTO_INCREMENT pour la table `sl_school`
--
ALTER TABLE `sl_school`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;
--
-- AUTO_INCREMENT pour la table `sl_school_admin`
--
ALTER TABLE `sl_school_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT pour la table `sl_school_contact`
--
ALTER TABLE `sl_school_contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT pour la table `sl_school_contact_translate`
--
ALTER TABLE `sl_school_contact_translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT pour la table `sl_school_of_the_day`
--
ALTER TABLE `sl_school_of_the_day`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT pour la table `sl_school_subscription`
--
ALTER TABLE `sl_school_subscription`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT pour la table `sl_school_translate`
--
ALTER TABLE `sl_school_translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=278;
--
-- AUTO_INCREMENT pour la table `ur_avatar`
--
ALTER TABLE `ur_avatar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT pour la table `ur_user`
--
ALTER TABLE `ur_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `an_menu`
--
ALTER TABLE `an_menu`
  ADD CONSTRAINT `FK_64514B906B3AAD44` FOREIGN KEY (`menu_parent_id`) REFERENCES `an_menu` (`id`);

--
-- Contraintes pour la table `at_advert`
--
ALTER TABLE `at_advert`
  ADD CONSTRAINT `FK_B5A5D2D5A76ED395` FOREIGN KEY (`user_id`) REFERENCES `ur_user` (`id`);

--
-- Contraintes pour la table `at_advert_illustration`
--
ALTER TABLE `at_advert_illustration`
  ADD CONSTRAINT `FK_609DA49AD07ECCB6` FOREIGN KEY (`advert_id`) REFERENCES `at_advert` (`id`);

--
-- Contraintes pour la table `at_advert_translate`
--
ALTER TABLE `at_advert_translate`
  ADD CONSTRAINT `FK_14A56637D07ECCB6` FOREIGN KEY (`advert_id`) REFERENCES `at_advert` (`id`),
  ADD CONSTRAINT `FK_14A56637E559DFD1` FOREIGN KEY (`locale_id`) REFERENCES `pm_locale` (`id`);

--
-- Contraintes pour la table `at_category_advert`
--
ALTER TABLE `at_category_advert`
  ADD CONSTRAINT `FK_B247CA8912469DE2` FOREIGN KEY (`category_id`) REFERENCES `at_category` (`id`),
  ADD CONSTRAINT `FK_B247CA89D07ECCB6` FOREIGN KEY (`advert_id`) REFERENCES `at_advert` (`id`);

--
-- Contraintes pour la table `at_category_translate`
--
ALTER TABLE `at_category_translate`
  ADD CONSTRAINT `FK_CB66A1BB12469DE2` FOREIGN KEY (`category_id`) REFERENCES `at_category` (`id`),
  ADD CONSTRAINT `FK_CB66A1BBE559DFD1` FOREIGN KEY (`locale_id`) REFERENCES `pm_locale` (`id`);

--
-- Contraintes pour la table `bg_category_post`
--
ALTER TABLE `bg_category_post`
  ADD CONSTRAINT `FK_249F866B12469DE2` FOREIGN KEY (`category_id`) REFERENCES `bg_category` (`id`),
  ADD CONSTRAINT `FK_249F866B4B89032C` FOREIGN KEY (`post_id`) REFERENCES `bg_post` (`id`);

--
-- Contraintes pour la table `bg_category_translate`
--
ALTER TABLE `bg_category_translate`
  ADD CONSTRAINT `FK_330CC802E559DFD1` FOREIGN KEY (`locale_id`) REFERENCES `pm_locale` (`id`),
  ADD CONSTRAINT `FK_330CC802FE0617CD` FOREIGN KEY (`category_id`) REFERENCES `bg_category` (`id`);

--
-- Contraintes pour la table `bg_post`
--
ALTER TABLE `bg_post`
  ADD CONSTRAINT `FK_553956DBA76ED395` FOREIGN KEY (`user_id`) REFERENCES `ur_user` (`id`);

--
-- Contraintes pour la table `bg_post_illustration`
--
ALTER TABLE `bg_post_illustration`
  ADD CONSTRAINT `FK_1D5592574B89032C` FOREIGN KEY (`post_id`) REFERENCES `bg_post` (`id`);

--
-- Contraintes pour la table `bg_post_translate`
--
ALTER TABLE `bg_post_translate`
  ADD CONSTRAINT `FK_4A5A006E4B89032C` FOREIGN KEY (`post_id`) REFERENCES `bg_post` (`id`),
  ADD CONSTRAINT `FK_4A5A006EE559DFD1` FOREIGN KEY (`locale_id`) REFERENCES `pm_locale` (`id`);

--
-- Contraintes pour la table `fm_message`
--
ALTER TABLE `fm_message`
  ADD CONSTRAINT `FK_358874D923EDC87` FOREIGN KEY (`subject_id`) REFERENCES `fm_subject` (`id`),
  ADD CONSTRAINT `FK_358874D9A76ED395` FOREIGN KEY (`user_id`) REFERENCES `ur_user` (`id`);

--
-- Contraintes pour la table `fm_subject`
--
ALTER TABLE `fm_subject`
  ADD CONSTRAINT `FK_78FB7ADC1F55203D` FOREIGN KEY (`topic_id`) REFERENCES `fm_topic` (`id`),
  ADD CONSTRAINT `FK_78FB7ADCA76ED395` FOREIGN KEY (`user_id`) REFERENCES `ur_user` (`id`);

--
-- Contraintes pour la table `fm_topic`
--
ALTER TABLE `fm_topic`
  ADD CONSTRAINT `FK_3F7DC854A76ED395` FOREIGN KEY (`user_id`) REFERENCES `ur_user` (`id`);

--
-- Contraintes pour la table `fm_topic_illustration`
--
ALTER TABLE `fm_topic_illustration`
  ADD CONSTRAINT `FK_BFF5CDA31F55203D` FOREIGN KEY (`topic_id`) REFERENCES `fm_topic` (`id`);

--
-- Contraintes pour la table `fm_topic_translate`
--
ALTER TABLE `fm_topic_translate`
  ADD CONSTRAINT `FK_DD1214F21F55203D` FOREIGN KEY (`topic_id`) REFERENCES `fm_topic` (`id`),
  ADD CONSTRAINT `FK_DD1214F2E559DFD1` FOREIGN KEY (`locale_id`) REFERENCES `pm_locale` (`id`);

--
-- Contraintes pour la table `pm_advert_school`
--
ALTER TABLE `pm_advert_school`
  ADD CONSTRAINT `FK_4E94259F797089C1` FOREIGN KEY (`user_confirmation_id`) REFERENCES `ur_user` (`id`),
  ADD CONSTRAINT `FK_4E94259FA76ED395` FOREIGN KEY (`user_id`) REFERENCES `ur_user` (`id`),
  ADD CONSTRAINT `FK_4E94259FC32A47EE` FOREIGN KEY (`school_id`) REFERENCES `sl_school` (`id`),
  ADD CONSTRAINT `FK_4E94259FD07ECCB6` FOREIGN KEY (`advert_id`) REFERENCES `at_advert` (`id`);

--
-- Contraintes pour la table `pm_comment`
--
ALTER TABLE `pm_comment`
  ADD CONSTRAINT `FK_3DF1E7654B89032C` FOREIGN KEY (`post_id`) REFERENCES `bg_post` (`id`),
  ADD CONSTRAINT `FK_3DF1E765A76ED395` FOREIGN KEY (`user_id`) REFERENCES `ur_user` (`id`),
  ADD CONSTRAINT `FK_3DF1E765D07ECCB6` FOREIGN KEY (`advert_id`) REFERENCES `at_advert` (`id`);

--
-- Contraintes pour la table `pm_contact`
--
ALTER TABLE `pm_contact`
  ADD CONSTRAINT `FK_E5E75331A76ED395` FOREIGN KEY (`user_id`) REFERENCES `ur_user` (`id`);

--
-- Contraintes pour la table `pm_post_school`
--
ALTER TABLE `pm_post_school`
  ADD CONSTRAINT `FK_9EDF3AED4B89032C` FOREIGN KEY (`post_id`) REFERENCES `bg_post` (`id`),
  ADD CONSTRAINT `FK_9EDF3AED797089C1` FOREIGN KEY (`user_confirmation_id`) REFERENCES `ur_user` (`id`),
  ADD CONSTRAINT `FK_9EDF3AEDA76ED395` FOREIGN KEY (`user_id`) REFERENCES `ur_user` (`id`),
  ADD CONSTRAINT `FK_9EDF3AEDC32A47EE` FOREIGN KEY (`school_id`) REFERENCES `sl_school` (`id`);

--
-- Contraintes pour la table `pm_view`
--
ALTER TABLE `pm_view`
  ADD CONSTRAINT `FK_A0943F594B89032C` FOREIGN KEY (`post_id`) REFERENCES `bg_post` (`id`),
  ADD CONSTRAINT `FK_A0943F59A76ED395` FOREIGN KEY (`user_id`) REFERENCES `ur_user` (`id`),
  ADD CONSTRAINT `FK_A0943F59C32A47EE` FOREIGN KEY (`school_id`) REFERENCES `sl_school` (`id`),
  ADD CONSTRAINT `FK_A0943F59D07ECCB6` FOREIGN KEY (`advert_id`) REFERENCES `at_advert` (`id`);

--
-- Contraintes pour la table `sl_category_school`
--
ALTER TABLE `sl_category_school`
  ADD CONSTRAINT `FK_C51E054112469DE2` FOREIGN KEY (`category_id`) REFERENCES `sl_category` (`id`),
  ADD CONSTRAINT `FK_C51E0541C32A47EE` FOREIGN KEY (`school_id`) REFERENCES `sl_school` (`id`);

--
-- Contraintes pour la table `sl_category_translate`
--
ALTER TABLE `sl_category_translate`
  ADD CONSTRAINT `FK_195BCFBD12469DE2` FOREIGN KEY (`category_id`) REFERENCES `sl_category` (`id`),
  ADD CONSTRAINT `FK_195BCFBDE559DFD1` FOREIGN KEY (`locale_id`) REFERENCES `pm_locale` (`id`);

--
-- Contraintes pour la table `sl_cover`
--
ALTER TABLE `sl_cover`
  ADD CONSTRAINT `FK_BD19A471C32A47EE` FOREIGN KEY (`school_id`) REFERENCES `sl_school` (`id`);

--
-- Contraintes pour la table `sl_evaluation`
--
ALTER TABLE `sl_evaluation`
  ADD CONSTRAINT `FK_3EFD93A0A76ED395` FOREIGN KEY (`user_id`) REFERENCES `ur_user` (`id`),
  ADD CONSTRAINT `FK_3EFD93A0C32A47EE` FOREIGN KEY (`school_id`) REFERENCES `sl_school` (`id`);

--
-- Contraintes pour la table `sl_field`
--
ALTER TABLE `sl_field`
  ADD CONSTRAINT `FK_6BE467ECC32A47EE` FOREIGN KEY (`school_id`) REFERENCES `sl_school` (`id`);

--
-- Contraintes pour la table `sl_field_translate`
--
ALTER TABLE `sl_field_translate`
  ADD CONSTRAINT `FK_9C7BF07C443707B0` FOREIGN KEY (`field_id`) REFERENCES `sl_field` (`id`),
  ADD CONSTRAINT `FK_9C7BF07CE559DFD1` FOREIGN KEY (`locale_id`) REFERENCES `pm_locale` (`id`);

--
-- Contraintes pour la table `sl_logo`
--
ALTER TABLE `sl_logo`
  ADD CONSTRAINT `FK_4053C7FCC32A47EE` FOREIGN KEY (`school_id`) REFERENCES `sl_school` (`id`);

--
-- Contraintes pour la table `sl_school_admin`
--
ALTER TABLE `sl_school_admin`
  ADD CONSTRAINT `FK_65013271A76ED395` FOREIGN KEY (`user_id`) REFERENCES `ur_user` (`id`),
  ADD CONSTRAINT `FK_65013271C32A47EE` FOREIGN KEY (`school_id`) REFERENCES `sl_school` (`id`);

--
-- Contraintes pour la table `sl_school_contact`
--
ALTER TABLE `sl_school_contact`
  ADD CONSTRAINT `FK_B545B0CDC32A47EE` FOREIGN KEY (`school_id`) REFERENCES `sl_school` (`id`);

--
-- Contraintes pour la table `sl_school_contact_translate`
--
ALTER TABLE `sl_school_contact_translate`
  ADD CONSTRAINT `FK_D1992B685200A5B8` FOREIGN KEY (`school_contact_id`) REFERENCES `sl_school_contact` (`id`),
  ADD CONSTRAINT `FK_D1992B68E559DFD1` FOREIGN KEY (`locale_id`) REFERENCES `pm_locale` (`id`);

--
-- Contraintes pour la table `sl_school_of_the_day`
--
ALTER TABLE `sl_school_of_the_day`
  ADD CONSTRAINT `FK_BE20BEF0C32A47EE` FOREIGN KEY (`school_id`) REFERENCES `sl_school` (`id`);

--
-- Contraintes pour la table `sl_school_subscription`
--
ALTER TABLE `sl_school_subscription`
  ADD CONSTRAINT `FK_3508E111A76ED395` FOREIGN KEY (`user_id`) REFERENCES `ur_user` (`id`),
  ADD CONSTRAINT `FK_3508E111C32A47EE` FOREIGN KEY (`school_id`) REFERENCES `sl_school` (`id`);

--
-- Contraintes pour la table `sl_school_translate`
--
ALTER TABLE `sl_school_translate`
  ADD CONSTRAINT `FK_A1D37B69C32A47EE` FOREIGN KEY (`school_id`) REFERENCES `sl_school` (`id`),
  ADD CONSTRAINT `FK_A1D37B69E559DFD1` FOREIGN KEY (`locale_id`) REFERENCES `pm_locale` (`id`);

--
-- Contraintes pour la table `ur_avatar`
--
ALTER TABLE `ur_avatar`
  ADD CONSTRAINT `FK_C0604E0BA76ED395` FOREIGN KEY (`user_id`) REFERENCES `ur_user` (`id`);

--
-- Contraintes pour la table `ur_user`
--
ALTER TABLE `ur_user`
  ADD CONSTRAINT `FK_7342DD77E559DFD1` FOREIGN KEY (`locale_id`) REFERENCES `pm_locale` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
