-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Lun 31 Juillet 2017 à 18:14
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
(21, 17, 2),
(22, 18, 1),
(23, 19, 1),
(24, 20, 1),
(25, 21, 1),
(26, 22, 1),
(27, 23, 1),
(28, 24, 1),
(29, 25, 1),
(30, 26, 1),
(31, 27, 1),
(32, 28, 1),
(33, 29, 2),
(34, 30, 1),
(38, 33, 2),
(39, 32, 2),
(40, 31, 2),
(42, 35, 4),
(43, 34, 2);

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
(17, 1, 'ceci-dfj-klfjqkls-fjlkqdsjfljslf', 'pt-2', '2017-06-28 15:07:55', 0, 0, 1),
(18, 1, 'rabitur laoreet varius malesuada.', 'rabitur-laoreet-varius-malesuada-n', '2017-07-01 12:03:12', 0, 1, 1),
(19, 1, 'varius malesuada. Nullam la', 'varius-malesuada-nullam-la', '2017-07-01 12:04:09', 0, 0, 1),
(20, 1, 'Nam ultrices nibh sa', 'nam-ultrices-nibh-sa', '2017-07-01 12:05:37', 0, 1, 1),
(21, 1, 'Nam ultrices nibh sa 2', 'nam-ultrices-nibh-sa-2', '2017-07-01 12:05:50', 0, 1, 1),
(22, 1, 'Nam ultrices nibh sa 3', 'nam-ultrices-nibh-sa-3', '2017-07-01 12:06:11', 0, 1, 1),
(23, 1, 'Nam ultrices nibh sa 4', 'nam-ultrices-nibh-sa-4', '2017-07-01 12:06:25', 0, 1, 1),
(24, 1, 'Nam ultrices nibh sa 5', 'nam-ultrices-nibh-sa-5', '2017-07-01 12:06:38', 0, 1, 1),
(25, 1, 'Nam ultrices nibh sa 6', 'nam-ultrices-nibh-sa-6', '2017-07-01 12:06:53', 0, 1, 1),
(26, 1, 'Nam ultrices nibh sa 6', 'nam-ultrices-nibh-sa-6-2', '2017-07-01 12:07:03', 0, 1, 1),
(27, 1, 'Nam ultrices nibh sa 7', 'nam-ultrices-nibh-sa-7', '2017-07-01 12:07:23', 0, 1, 1),
(28, 1, 'Nam ultrices nibh sa 8', 'nam-ultrices-nibh-sa-8', '2017-07-01 12:07:36', 0, 1, 1),
(29, 1, 'Nam ultrices nibh sa 9', 'nam-ultrices-nibh-sa-9', '2017-07-01 12:07:51', 0, 1, 1),
(30, 1, 'Nam ultrices nibh sa 9', 'nam-ultrices-nibh-sa-9-2', '2017-07-01 12:08:04', 0, 1, 1),
(31, 1, 'Nam ultrices nibh sa 10', 'nam-ultrices-nibh-sa-10', '2017-07-01 12:08:17', 0, 1, 1),
(32, 1, 'Nam ultrices nibh sa 11', 'nam-ultrices-nibh-sa-11', '2017-07-01 12:08:27', 0, 1, 1),
(33, 1, 'Nam ultrices nibh sa 12', 'nam-ultrices-nibh-sa-12', '2017-07-01 12:08:37', 0, 1, 1),
(34, 4, 'Vontovorona - Les polytechniciens se révoltent', 'vontovorona-les-polytechniciens-se-revoltent', '2017-07-20 18:23:18', 0, 1, 1),
(35, 1, 'n tristique elit sit amet, finibus rhon', 'n-tristique-elit-sit-amet-finibus-rhon', '2017-07-23 18:39:47', 0, 1, 1);

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
(41, 8, 'landesm.jpg', 'ce89c5f69d380cf4efce342c364c9b60bb1564f3.jpeg', 'landesm.jpg', 1),
(42, 25, 'ssss.jpg', '817ebb43fa3f38d593a32c154e9d4bb18227365a.jpeg', 'ssss.jpg', 1),
(43, 33, '41152.jpg', '5077f9da25e4cbe3a53e1156d86aa78298629244.jpeg', '41152.jpg', 1),
(44, 31, 'iep-vie-etudiante.jpg', '276b2eb022fa0318f12ea7c03e3353a2a6b28766.jpeg', 'iep-vie-etudiante.jpg', 1),
(45, 29, 'fianara.jpg', '201042b0877166bd632fe08c871287553d58d2da.jpeg', 'fianara.jpg', 1);

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
(67, 12, 1, '3 ingrédients d''une photo de paysage réussie', 'Iis igitur est difficilius satis facere, qui se Latina scripta dicunt contemnere. in quibus hoc primum est in quo admirer, cur in gravissimis rebus non delectet eos sermo patrius, cum idem fabellas Latinas ad verbum e Graecis expressas non inviti legant. quis enim tam inimicus paene nomini Romano est, qui Ennii Medeam aut Antiopam Pacuvii spernat aut reiciat, quod se isdem Euripidis fabulis delectari dicat, Latinas litteras oderit?Iis igitur est difficilius satis facere, qui se Latina scripta dicunt contemnere. in quibus hoc primum est in quo admirer, cur in gravissimis rebus non delectet eos sermo patrius, cum idem fabellas Latinas ad verbum e Graecis expressas non inviti legant. quis enim tam inimicus paene nomini Romano est, qui Ennii Medeam aut Antiopam Pacuvii spernat aut reiciat, quod se isdem Euripidis fabulis delectari dicat, Latinas litteras oderit?', '<p style="text-align: justify;">Iis igitur est difficilius satis facere, qui se Latina scripta dicunt contemnere. in quibus hoc primum est in quo admirer, cur in gravissimis rebus non delectet eos sermo patrius, cum idem fabellas Latinas ad verbum e Graecis expressas non inviti legant. quis enim tam inimicus paene nomini Romano est, qui Ennii Medeam aut Antiopam Pacuvii spernat aut reiciat, quod se isdem Euripidis fabulis delectari dicat, Latinas litteras oderit?Iis igitur est difficilius satis facere, qui se Latina scripta dicunt contemnere. in quibus hoc primum est in quo admirer, cur in gravissimis rebus non delectet eos sermo patrius, cum idem fabellas Latinas ad verbum e Graecis expressas non inviti legant. quis enim tam inimicus paene nomini Romano est, qui Ennii Medeam aut Antiopam Pacuvii spernat aut reiciat, quod se isdem Euripidis fabulis delectari dicat, Latinas litteras oderit?Iis igitur est difficilius satis facere, qui se Latina scripta dicunt contemnere. in quibus hoc primum est in quo admirer, cur in gravissimis rebus non delectet eos sermo patrius, cum idem fabellas Latinas ad verbum e Graecis expressas non inviti legant. quis enim tam inimicus paene nomini Romano est, qui Ennii Medeam aut Antiopam Pacuvii spernat aut reiciat, quod se isdem Euripidis fabulis delectari dicat.</p>\n<p style="text-align: justify;">Latinas litteras oderit?Iis igitur est difficilius satis facere, qui se Latina scripta dicunt contemnere. in quibus hoc primum est in quo admirer, cur in gravissimis rebus non delectet eos sermo patrius, cum idem fabellas Latinas ad verbum e Graecis expressas non inviti legant. quis enim tam inimicus paene nomini Romano est, qui Ennii Medeam aut Antiopam Pacuvii spernat aut reiciat, quod se isdem Euripidis fabulis delectari dicat, Latinas litteras oderit?Iis igitur est difficilius satis facere, qui se Latina scripta dicunt contemnere. in quibus hoc primum est in quo admirer, cur in gravissimis rebus non delectet eos sermo patrius, cum idem fabellas Latinas ad verbum e Graecis expressas non inviti legant. quis enim tam inimicus paene nomini Romano est, qui Ennii Medeam aut Antiopam Pacuvii spernat aut reiciat, quod se isdem Euripidis fabulis delectari dicat, Latinas litteras oderit?</p>'),
(68, 12, 2, '3 ingrédients d''une photo de paysage réussie', 'Iis igitur est difficilius satis facere, qui se Latina scripta dicunt contemnere. in quibus hoc primum est in quo admirer, cur in gravissimis rebus non delectet eos sermo patrius, cum idem fabellas Latinas ad verbum e Graecis expressas non inviti legant. quis enim tam inimicus paene nomini Romano est, qui Ennii Medeam aut Antiopam Pacuvii spernat aut reiciat, quod se isdem Euripidis fabulis delectari dicat, Latinas litteras oderit?Iis igitur est difficilius satis facere, qui se Latina scripta dicunt contemnere. in quibus hoc primum est in quo admirer, cur in gravissimis rebus non delectet eos sermo patrius, cum idem fabellas Latinas ad verbum e Graecis expressas non inviti legant. quis enim tam inimicus paene nomini Romano est, qui Ennii Medeam aut Antiopam Pacuvii spernat aut reiciat, quod se isdem Euripidis fabulis delectari dicat, Latinas litteras oderit?', '<p style="text-align: justify;">Iis igitur est difficilius satis facere, qui se Latina scripta dicunt contemnere. in quibus hoc primum est in quo admirer, cur in gravissimis rebus non delectet eos sermo patrius, cum idem fabellas Latinas ad verbum e Graecis expressas non inviti legant. quis enim tam inimicus paene nomini Romano est, qui Ennii Medeam aut Antiopam Pacuvii spernat aut reiciat, quod se isdem Euripidis fabulis delectari dicat, Latinas litteras oderit?Iis igitur est difficilius satis facere, qui se Latina scripta dicunt contemnere. in quibus hoc primum est in quo admirer, cur in gravissimis rebus non delectet eos sermo patrius, cum idem fabellas Latinas ad verbum e Graecis expressas non inviti legant. quis enim tam inimicus paene nomini Romano est, qui Ennii Medeam aut Antiopam Pacuvii spernat aut reiciat, quod se isdem Euripidis fabulis delectari dicat, Latinas litteras oderit?Iis igitur est difficilius satis facere, qui se Latina scripta dicunt contemnere. in quibus hoc primum est in quo admirer, cur in gravissimis rebus non delectet eos sermo patrius, cum idem fabellas Latinas ad verbum e Graecis expressas non inviti legant. quis enim tam inimicus paene nomini Romano est, qui Ennii Medeam aut Antiopam Pacuvii spernat aut reiciat, quod se isdem Euripidis fabulis delectari dicat.</p>\n<p style="text-align: justify;">Latinas litteras oderit?Iis igitur est difficilius satis facere, qui se Latina scripta dicunt contemnere. in quibus hoc primum est in quo admirer, cur in gravissimis rebus non delectet eos sermo patrius, cum idem fabellas Latinas ad verbum e Graecis expressas non inviti legant. quis enim tam inimicus paene nomini Romano est, qui Ennii Medeam aut Antiopam Pacuvii spernat aut reiciat, quod se isdem Euripidis fabulis delectari dicat, Latinas litteras oderit?Iis igitur est difficilius satis facere, qui se Latina scripta dicunt contemnere. in quibus hoc primum est in quo admirer, cur in gravissimis rebus non delectet eos sermo patrius, cum idem fabellas Latinas ad verbum e Graecis expressas non inviti legant. quis enim tam inimicus paene nomini Romano est, qui Ennii Medeam aut Antiopam Pacuvii spernat aut reiciat, quod se isdem Euripidis fabulis delectari dicat, Latinas litteras oderit?</p>'),
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
(102, 17, 6, 'de pt', 'de. Description .pt', 'de. Content .pt'),
(103, 18, 1, 'fr rabitur laoreet varius malesuada. Nullam lacinia felis nisi, ut varius ipsum luctus non. Pellentesque ex magna, euismod sit amet ultricies consequat, eleifend eu purus. Nullam odio nisl, accumsan tristique elit sit amet, finibus rhoncus', 'fr. Description .rabitur laoreet varius malesuada. Nullam lacinia felis nisi, ut varius ipsum luctus non. Pellentesque ex magna, euismod sit amet ultricies consequat, eleifend eu purus. Nullam odio nisl, accumsan tristique elit sit amet, finibus rhoncus', 'fr. Content .rabitur laoreet varius malesuada. Nullam lacinia felis nisi, ut varius ipsum luctus non. Pellentesque ex magna, euismod sit amet ultricies consequat, eleifend eu purus. Nullam odio nisl, accumsan tristique elit sit amet, finibus rhoncus'),
(104, 18, 2, 'en rabitur laoreet varius malesuada. Nullam lacinia felis nisi, ut varius ipsum luctus non. Pellentesque ex magna, euismod sit amet ultricies consequat, eleifend eu purus. Nullam odio nisl, accumsan tristique elit sit amet, finibus rhoncus', 'en. Description .rabitur laoreet varius malesuada. Nullam lacinia felis nisi, ut varius ipsum luctus non. Pellentesque ex magna, euismod sit amet ultricies consequat, eleifend eu purus. Nullam odio nisl, accumsan tristique elit sit amet, finibus rhoncus', 'en. Content .rabitur laoreet varius malesuada. Nullam lacinia felis nisi, ut varius ipsum luctus non. Pellentesque ex magna, euismod sit amet ultricies consequat, eleifend eu purus. Nullam odio nisl, accumsan tristique elit sit amet, finibus rhoncus'),
(105, 18, 3, 'mg rabitur laoreet varius malesuada. Nullam lacinia felis nisi, ut varius ipsum luctus non. Pellentesque ex magna, euismod sit amet ultricies consequat, eleifend eu purus. Nullam odio nisl, accumsan tristique elit sit amet, finibus rhoncus', 'mg. Description .rabitur laoreet varius malesuada. Nullam lacinia felis nisi, ut varius ipsum luctus non. Pellentesque ex magna, euismod sit amet ultricies consequat, eleifend eu purus. Nullam odio nisl, accumsan tristique elit sit amet, finibus rhoncus', 'mg. Content .rabitur laoreet varius malesuada. Nullam lacinia felis nisi, ut varius ipsum luctus non. Pellentesque ex magna, euismod sit amet ultricies consequat, eleifend eu purus. Nullam odio nisl, accumsan tristique elit sit amet, finibus rhoncus'),
(106, 18, 4, 'it rabitur laoreet varius malesuada. Nullam lacinia felis nisi, ut varius ipsum luctus non. Pellentesque ex magna, euismod sit amet ultricies consequat, eleifend eu purus. Nullam odio nisl, accumsan tristique elit sit amet, finibus rhoncus', 'it. Description .rabitur laoreet varius malesuada. Nullam lacinia felis nisi, ut varius ipsum luctus non. Pellentesque ex magna, euismod sit amet ultricies consequat, eleifend eu purus. Nullam odio nisl, accumsan tristique elit sit amet, finibus rhoncus', 'it. Content .rabitur laoreet varius malesuada. Nullam lacinia felis nisi, ut varius ipsum luctus non. Pellentesque ex magna, euismod sit amet ultricies consequat, eleifend eu purus. Nullam odio nisl, accumsan tristique elit sit amet, finibus rhoncus'),
(107, 18, 5, 'es rabitur laoreet varius malesuada. Nullam lacinia felis nisi, ut varius ipsum luctus non. Pellentesque ex magna, euismod sit amet ultricies consequat, eleifend eu purus. Nullam odio nisl, accumsan tristique elit sit amet, finibus rhoncus', 'es. Description .rabitur laoreet varius malesuada. Nullam lacinia felis nisi, ut varius ipsum luctus non. Pellentesque ex magna, euismod sit amet ultricies consequat, eleifend eu purus. Nullam odio nisl, accumsan tristique elit sit amet, finibus rhoncus', 'es. Content .rabitur laoreet varius malesuada. Nullam lacinia felis nisi, ut varius ipsum luctus non. Pellentesque ex magna, euismod sit amet ultricies consequat, eleifend eu purus. Nullam odio nisl, accumsan tristique elit sit amet, finibus rhoncus'),
(108, 18, 6, 'de rabitur laoreet varius malesuada. Nullam lacinia felis nisi, ut varius ipsum luctus non. Pellentesque ex magna, euismod sit amet ultricies consequat, eleifend eu purus. Nullam odio nisl, accumsan tristique elit sit amet, finibus rhoncus', 'de. Description .rabitur laoreet varius malesuada. Nullam lacinia felis nisi, ut varius ipsum luctus non. Pellentesque ex magna, euismod sit amet ultricies consequat, eleifend eu purus. Nullam odio nisl, accumsan tristique elit sit amet, finibus rhoncus', 'de. Content .rabitur laoreet varius malesuada. Nullam lacinia felis nisi, ut varius ipsum luctus non. Pellentesque ex magna, euismod sit amet ultricies consequat, eleifend eu purus. Nullam odio nisl, accumsan tristique elit sit amet, finibus rhoncus'),
(109, 19, 1, 'fr varius malesuada. Nullam la', 'fr. Description .varius malesuada. Nullam la', 'fr. Content .varius malesuada. Nullam la'),
(110, 19, 2, 'en varius malesuada. Nullam la', 'en. Description .varius malesuada. Nullam la', 'en. Content .varius malesuada. Nullam la'),
(111, 19, 3, 'mg varius malesuada. Nullam la', 'mg. Description .varius malesuada. Nullam la', 'mg. Content .varius malesuada. Nullam la'),
(112, 19, 4, 'it varius malesuada. Nullam la', 'it. Description .varius malesuada. Nullam la', 'it. Content .varius malesuada. Nullam la'),
(113, 19, 5, 'es varius malesuada. Nullam la', 'es. Description .varius malesuada. Nullam la', 'es. Content .varius malesuada. Nullam la'),
(114, 19, 6, 'de varius malesuada. Nullam la', 'de. Description .varius malesuada. Nullam la', 'de. Content .varius malesuada. Nullam la'),
(115, 20, 1, 'fr Nam ultrices nibh sa', 'fr. Description .Nam ultrices nibh sa', 'fr. Content .Nam ultrices nibh sa'),
(116, 20, 2, 'en Nam ultrices nibh sa', 'en. Description .Nam ultrices nibh sa', 'en. Content .Nam ultrices nibh sa'),
(117, 20, 3, 'mg Nam ultrices nibh sa', 'mg. Description .Nam ultrices nibh sa', 'mg. Content .Nam ultrices nibh sa'),
(118, 20, 4, 'it Nam ultrices nibh sa', 'it. Description .Nam ultrices nibh sa', 'it. Content .Nam ultrices nibh sa'),
(119, 20, 5, 'es Nam ultrices nibh sa', 'es. Description .Nam ultrices nibh sa', 'es. Content .Nam ultrices nibh sa'),
(120, 20, 6, 'de Nam ultrices nibh sa', 'de. Description .Nam ultrices nibh sa', 'de. Content .Nam ultrices nibh sa'),
(121, 21, 1, 'fr Nam ultrices nibh sa 2', 'fr. Description .Nam ultrices nibh sa 2', 'fr. Content .Nam ultrices nibh sa 2'),
(122, 21, 2, 'en Nam ultrices nibh sa 2', 'en. Description .Nam ultrices nibh sa 2', 'en. Content .Nam ultrices nibh sa 2'),
(123, 21, 3, 'mg Nam ultrices nibh sa 2', 'mg. Description .Nam ultrices nibh sa 2', 'mg. Content .Nam ultrices nibh sa 2'),
(124, 21, 4, 'it Nam ultrices nibh sa 2', 'it. Description .Nam ultrices nibh sa 2', 'it. Content .Nam ultrices nibh sa 2'),
(125, 21, 5, 'es Nam ultrices nibh sa 2', 'es. Description .Nam ultrices nibh sa 2', 'es. Content .Nam ultrices nibh sa 2'),
(126, 21, 6, 'de Nam ultrices nibh sa 2', 'de. Description .Nam ultrices nibh sa 2', 'de. Content .Nam ultrices nibh sa 2'),
(127, 22, 1, 'fr Nam ultrices nibh sa 3', 'fr. Description .Nam ultrices nibh sa 3', 'fr. Content .Nam ultrices nibh sa 3'),
(128, 22, 2, 'en Nam ultrices nibh sa 3', 'en. Description .Nam ultrices nibh sa 3', 'en. Content .Nam ultrices nibh sa 3'),
(129, 22, 3, 'mg Nam ultrices nibh sa 3', 'mg. Description .Nam ultrices nibh sa 3', 'mg. Content .Nam ultrices nibh sa 3'),
(130, 22, 4, 'it Nam ultrices nibh sa 3', 'it. Description .Nam ultrices nibh sa 3', 'it. Content .Nam ultrices nibh sa 3'),
(131, 22, 5, 'es Nam ultrices nibh sa 3', 'es. Description .Nam ultrices nibh sa 3', 'es. Content .Nam ultrices nibh sa 3'),
(132, 22, 6, 'de Nam ultrices nibh sa 3', 'de. Description .Nam ultrices nibh sa 3', 'de. Content .Nam ultrices nibh sa 3'),
(133, 23, 1, 'fr Nam ultrices nibh sa 4', 'fr. Description .Nam ultrices nibh sa 4', 'fr. Content .Nam ultrices nibh sa 4'),
(134, 23, 2, 'en Nam ultrices nibh sa 4', 'en. Description .Nam ultrices nibh sa 4', 'en. Content .Nam ultrices nibh sa 4'),
(135, 23, 3, 'mg Nam ultrices nibh sa 4', 'mg. Description .Nam ultrices nibh sa 4', 'mg. Content .Nam ultrices nibh sa 4'),
(136, 23, 4, 'it Nam ultrices nibh sa 4', 'it. Description .Nam ultrices nibh sa 4', 'it. Content .Nam ultrices nibh sa 4'),
(137, 23, 5, 'es Nam ultrices nibh sa 4', 'es. Description .Nam ultrices nibh sa 4', 'es. Content .Nam ultrices nibh sa 4'),
(138, 23, 6, 'de Nam ultrices nibh sa 4', 'de. Description .Nam ultrices nibh sa 4', 'de. Content .Nam ultrices nibh sa 4'),
(139, 24, 1, 'fr Nam ultrices nibh sa 5', 'fr. Description .Nam ultrices nibh sa 5', 'fr. Content .Nam ultrices nibh sa 5'),
(140, 24, 2, 'en Nam ultrices nibh sa 5', 'en. Description .Nam ultrices nibh sa 5', 'en. Content .Nam ultrices nibh sa 5'),
(141, 24, 3, 'mg Nam ultrices nibh sa 5', 'mg. Description .Nam ultrices nibh sa 5', 'mg. Content .Nam ultrices nibh sa 5'),
(142, 24, 4, 'it Nam ultrices nibh sa 5', 'it. Description .Nam ultrices nibh sa 5', 'it. Content .Nam ultrices nibh sa 5'),
(143, 24, 5, 'es Nam ultrices nibh sa 5', 'es. Description .Nam ultrices nibh sa 5', 'es. Content .Nam ultrices nibh sa 5'),
(144, 24, 6, 'de Nam ultrices nibh sa 5', 'de. Description .Nam ultrices nibh sa 5', 'de. Content .Nam ultrices nibh sa 5'),
(145, 25, 1, 'fr Nam ultrices nibh sa 6', 'fr. Description .Nam ultrices nibh sa 6', 'fr. Content .Nam ultrices nibh sa 6'),
(146, 25, 2, 'en Nam ultrices nibh sa 6', 'en. Description .Nam ultrices nibh sa 6', 'en. Content .Nam ultrices nibh sa 6'),
(147, 25, 3, 'mg Nam ultrices nibh sa 6', 'mg. Description .Nam ultrices nibh sa 6', 'mg. Content .Nam ultrices nibh sa 6'),
(148, 25, 4, 'it Nam ultrices nibh sa 6', 'it. Description .Nam ultrices nibh sa 6', 'it. Content .Nam ultrices nibh sa 6'),
(149, 25, 5, 'es Nam ultrices nibh sa 6', 'es. Description .Nam ultrices nibh sa 6', 'es. Content .Nam ultrices nibh sa 6'),
(150, 25, 6, 'de Nam ultrices nibh sa 6', 'de. Description .Nam ultrices nibh sa 6', 'de. Content .Nam ultrices nibh sa 6'),
(151, 26, 1, 'fr Nam ultrices nibh sa 6', 'fr. Description .Nam ultrices nibh sa 6', 'fr. Content .Nam ultrices nibh sa 6'),
(152, 26, 2, 'en Nam ultrices nibh sa 6', 'en. Description .Nam ultrices nibh sa 6', 'en. Content .Nam ultrices nibh sa 6'),
(153, 26, 3, 'mg Nam ultrices nibh sa 6', 'mg. Description .Nam ultrices nibh sa 6', 'mg. Content .Nam ultrices nibh sa 6'),
(154, 26, 4, 'it Nam ultrices nibh sa 6', 'it. Description .Nam ultrices nibh sa 6', 'it. Content .Nam ultrices nibh sa 6'),
(155, 26, 5, 'es Nam ultrices nibh sa 6', 'es. Description .Nam ultrices nibh sa 6', 'es. Content .Nam ultrices nibh sa 6'),
(156, 26, 6, 'de Nam ultrices nibh sa 6', 'de. Description .Nam ultrices nibh sa 6', 'de. Content .Nam ultrices nibh sa 6'),
(157, 27, 1, 'fr Nam ultrices nibh sa 7', 'fr. Description .Nam ultrices nibh sa 7', 'fr. Content .Nam ultrices nibh sa 7'),
(158, 27, 2, 'en Nam ultrices nibh sa 7', 'en. Description .Nam ultrices nibh sa 7', 'en. Content .Nam ultrices nibh sa 7'),
(159, 27, 3, 'mg Nam ultrices nibh sa 7', 'mg. Description .Nam ultrices nibh sa 7', 'mg. Content .Nam ultrices nibh sa 7'),
(160, 27, 4, 'it Nam ultrices nibh sa 7', 'it. Description .Nam ultrices nibh sa 7', 'it. Content .Nam ultrices nibh sa 7'),
(161, 27, 5, 'es Nam ultrices nibh sa 7', 'es. Description .Nam ultrices nibh sa 7', 'es. Content .Nam ultrices nibh sa 7'),
(162, 27, 6, 'de Nam ultrices nibh sa 7', 'de. Description .Nam ultrices nibh sa 7', 'de. Content .Nam ultrices nibh sa 7'),
(163, 28, 1, 'fr Nam ultrices nibh sa 8', 'fr. Description .Nam ultrices nibh sa 8', 'fr. Content .Nam ultrices nibh sa 8'),
(164, 28, 2, 'en Nam ultrices nibh sa 8', 'en. Description .Nam ultrices nibh sa 8', 'en. Content .Nam ultrices nibh sa 8'),
(165, 28, 3, 'mg Nam ultrices nibh sa 8', 'mg. Description .Nam ultrices nibh sa 8', 'mg. Content .Nam ultrices nibh sa 8'),
(166, 28, 4, 'it Nam ultrices nibh sa 8', 'it. Description .Nam ultrices nibh sa 8', 'it. Content .Nam ultrices nibh sa 8'),
(167, 28, 5, 'es Nam ultrices nibh sa 8', 'es. Description .Nam ultrices nibh sa 8', 'es. Content .Nam ultrices nibh sa 8'),
(168, 28, 6, 'de Nam ultrices nibh sa 8', 'de. Description .Nam ultrices nibh sa 8', 'de. Content .Nam ultrices nibh sa 8'),
(169, 29, 1, 'fr Nam ultrices nibh sa 9', 'fr. Description .Nam ultrices nibh sa 9', 'fr. Content .Nam ultrices nibh sa 9'),
(170, 29, 2, 'en Nam ultrices nibh sa 9', 'en. Description .Nam ultrices nibh sa 9', 'en. Content .Nam ultrices nibh sa 9'),
(171, 29, 3, 'mg Nam ultrices nibh sa 9', 'mg. Description .Nam ultrices nibh sa 9', 'mg. Content .Nam ultrices nibh sa 9'),
(172, 29, 4, 'it Nam ultrices nibh sa 9', 'it. Description .Nam ultrices nibh sa 9', 'it. Content .Nam ultrices nibh sa 9'),
(173, 29, 5, 'es Nam ultrices nibh sa 9', 'es. Description .Nam ultrices nibh sa 9', 'es. Content .Nam ultrices nibh sa 9'),
(174, 29, 6, 'de Nam ultrices nibh sa 9', 'de. Description .Nam ultrices nibh sa 9', 'de. Content .Nam ultrices nibh sa 9'),
(175, 30, 1, 'fr Nam ultrices nibh sa 9', 'fr. Description .Nam ultrices nibh sa 9', 'fr. Content .Nam ultrices nibh sa 9'),
(176, 30, 2, 'en Nam ultrices nibh sa 9', 'en. Description .Nam ultrices nibh sa 9', 'en. Content .Nam ultrices nibh sa 9'),
(177, 30, 3, 'mg Nam ultrices nibh sa 9', 'mg. Description .Nam ultrices nibh sa 9', 'mg. Content .Nam ultrices nibh sa 9'),
(178, 30, 4, 'it Nam ultrices nibh sa 9', 'it. Description .Nam ultrices nibh sa 9', 'it. Content .Nam ultrices nibh sa 9'),
(179, 30, 5, 'es Nam ultrices nibh sa 9', 'es. Description .Nam ultrices nibh sa 9', 'es. Content .Nam ultrices nibh sa 9'),
(180, 30, 6, 'de Nam ultrices nibh sa 9', 'de. Description .Nam ultrices nibh sa 9', 'de. Content .Nam ultrices nibh sa 9'),
(181, 31, 1, 'fr Nam ultrices nibh sa 10', 'fr. Description .Nam ultrices nibh sa 10', 'fr. Content .Nam ultrices nibh sa 10'),
(182, 31, 2, 'en Nam ultrices nibh sa 10', 'en. Description .Nam ultrices nibh sa 10', 'en. Content .Nam ultrices nibh sa 10'),
(183, 31, 3, 'mg Nam ultrices nibh sa 10', 'mg. Description .Nam ultrices nibh sa 10', 'mg. Content .Nam ultrices nibh sa 10'),
(184, 31, 4, 'it Nam ultrices nibh sa 10', 'it. Description .Nam ultrices nibh sa 10', 'it. Content .Nam ultrices nibh sa 10'),
(185, 31, 5, 'es Nam ultrices nibh sa 10', 'es. Description .Nam ultrices nibh sa 10', 'es. Content .Nam ultrices nibh sa 10'),
(186, 31, 6, 'de Nam ultrices nibh sa 10', 'de. Description .Nam ultrices nibh sa 10', 'de. Content .Nam ultrices nibh sa 10'),
(187, 32, 1, 'fr Nam ultrices nibh sa 11', 'fr. Description .Nam ultrices nibh sa 11', 'fr. Content .Nam ultrices nibh sa 11'),
(188, 32, 2, 'en Nam ultrices nibh sa 11', 'en. Description .Nam ultrices nibh sa 11', 'en. Content .Nam ultrices nibh sa 11'),
(189, 32, 3, 'mg Nam ultrices nibh sa 11', 'mg. Description .Nam ultrices nibh sa 11', 'mg. Content .Nam ultrices nibh sa 11'),
(190, 32, 4, 'it Nam ultrices nibh sa 11', 'it. Description .Nam ultrices nibh sa 11', 'it. Content .Nam ultrices nibh sa 11'),
(191, 32, 5, 'es Nam ultrices nibh sa 11', 'es. Description .Nam ultrices nibh sa 11', 'es. Content .Nam ultrices nibh sa 11'),
(192, 32, 6, 'de Nam ultrices nibh sa 11', 'de. Description .Nam ultrices nibh sa 11', 'de. Content .Nam ultrices nibh sa 11'),
(193, 33, 1, 'fr Nam ultrices nibh sa 12', 'Nihil est enim virtute amabilius, nihil quod magis adliciat ad diligendum, quippe cum propter virtutem et probitatem etiam eos, quos numquam vidimus, quodam modo diligamus. Quis est qui C. Fabrici, M''. Curi non cum caritate aliqua benevola memoriam usurpet, quos numquam viderit? quis autem est, qui Tarquinium Superbum, qui Sp. Cassium, Sp. Maelium non oderit? Cum duobus ducibus de imperio in Italia est decertatum, Pyrrho et Hannibale; ab altero propter probitatem eius non nimis alienos animos habemus, alterum propter crudelitatem semper haec civitas oderit. Iam in altera philosophiae parte.', '<p style="text-align: justify;">Nihil est enim virtute amabilius, nihil quod magis adliciat ad diligendum, quippe cum propter virtutem et probitatem etiam eos, quos numquam vidimus, quodam modo diligamus. Quis est qui C. Fabrici, M''. Curi non cum caritate aliqua benevola memoriam usurpet, quos numquam viderit? quis autem est, qui Tarquinium Superbum, qui Sp. Cassium, Sp. Maelium non oderit? Cum duobus ducibus de imperio in Italia est decertatum, Pyrrho et Hannibale; ab altero propter probitatem eius non nimis alienos animos habemus, alterum propter crudelitatem semper haec civitas oderit. Iam in altera philosophiae parte. quae est quaerendi ac disserendi, quae logikh dicitur, iste vester plane, ut mihi quidem videtur, inermis ac nudus est. tollit definitiones, nihil de dividendo ac partiendo docet, non quo modo efficiatur concludaturque ratio tradit, non qua via captiosa solvantur ambigua distinguantur ostendit; iudicia rerum in sensibus ponit, quibus si semel aliquid falsi pro vero probatum sit, sublatum esse omne iudicium veri et falsi putat.<br /><br />Restabat ut Caesar post haec properaret accitus et abstergendae causa suspicionis sororem suam, eius uxorem, Constantius ad se tandem desideratam venire multis fictisque blanditiis hortabatur. quae licet ambigeret metuens saepe cruentum, spe tamen quod eum lenire poterit ut germanum profecta, cum Bithyniam introisset, in statione quae Caenos Gallicanos appellatur, absumpta est vi febrium repentina. cuius post obitum maritus contemplans cecidisse fiduciam qua se fultum existimabat, anxia cogitatione, quid moliretur haerebat. Eodem tempore Serenianus ex duce, cuius ignavia populatam in Phoenice Celsen ante rettulimus, pulsatae maiestatis imperii reus iure postulatus ac lege, incertum qua potuit suffragatione absolvi, aperte convictus familiarem suum cum pileo, quo caput operiebat, incantato vetitis artibus ad templum misisse fatidicum, quaeritatum expresse an ei firmum portenderetur imperium, ut cupiebat, et cunctum.</p>'),
(194, 33, 2, 'en Nam ultrices nibh sa 12', 'Nihil est enim virtute amabilius, nihil quod magis adliciat ad diligendum, quippe cum propter virtutem et probitatem etiam eos, quos numquam vidimus, quodam modo diligamus. Quis est qui C. Fabrici, M''. Curi non cum caritate aliqua benevola memoriam usurpet, quos numquam viderit? quis autem est, qui Tarquinium Superbum, qui Sp. Cassium, Sp. Maelium non oderit? Cum duobus ducibus de imperio in Italia est decertatum, Pyrrho et Hannibale; ab altero propter probitatem eius non nimis alienos animos habemus, alterum propter crudelitatem semper haec civitas oderit. Iam in altera philosophiae parte.', '<p style="text-align: justify;">Nihil est enim virtute amabilius, nihil quod magis adliciat ad diligendum, quippe cum propter virtutem et probitatem etiam eos, quos numquam vidimus, quodam modo diligamus. Quis est qui C. Fabrici, M''. Curi non cum caritate aliqua benevola memoriam usurpet, quos numquam viderit? quis autem est, qui Tarquinium Superbum, qui Sp. Cassium, Sp. Maelium non oderit? Cum duobus ducibus de imperio in Italia est decertatum, Pyrrho et Hannibale; ab altero propter probitatem eius non nimis alienos animos habemus, alterum propter crudelitatem semper haec civitas oderit. Iam in altera philosophiae parte. quae est quaerendi ac disserendi, quae logikh dicitur, iste vester plane, ut mihi quidem videtur, inermis ac nudus est. tollit definitiones, nihil de dividendo ac partiendo docet, non quo modo efficiatur concludaturque ratio tradit, non qua via captiosa solvantur ambigua distinguantur ostendit; iudicia rerum in sensibus ponit, quibus si semel aliquid falsi pro vero probatum sit, sublatum esse omne iudicium veri et falsi putat.<br /><br />Restabat ut Caesar post haec properaret accitus et abstergendae causa suspicionis sororem suam, eius uxorem, Constantius ad se tandem desideratam venire multis fictisque blanditiis hortabatur. quae licet ambigeret metuens saepe cruentum, spe tamen quod eum lenire poterit ut germanum profecta, cum Bithyniam introisset, in statione quae Caenos Gallicanos appellatur, absumpta est vi febrium repentina. cuius post obitum maritus contemplans cecidisse fiduciam qua se fultum existimabat, anxia cogitatione, quid moliretur haerebat. Eodem tempore Serenianus ex duce, cuius ignavia populatam in Phoenice Celsen ante rettulimus, pulsatae maiestatis imperii reus iure postulatus ac lege, incertum qua potuit suffragatione absolvi, aperte convictus familiarem suum cum pileo, quo caput operiebat, incantato vetitis artibus ad templum misisse fatidicum, quaeritatum expresse an ei firmum portenderetur imperium, ut cupiebat, et cunctum.</p>'),
(195, 33, 3, 'mg Nam ultrices nibh sa 12', 'mg. Description .Nam ultrices nibh sa 12', 'mg. Content .Nam ultrices nibh sa 12'),
(196, 33, 4, 'it Nam ultrices nibh sa 12', 'it. Description .Nam ultrices nibh sa 12', 'it. Content .Nam ultrices nibh sa 12'),
(197, 33, 5, 'es Nam ultrices nibh sa 12', 'es. Description .Nam ultrices nibh sa 12', 'es. Content .Nam ultrices nibh sa 12'),
(198, 33, 6, 'de Nam ultrices nibh sa 12', 'de. Description .Nam ultrices nibh sa 12', 'de. Content .Nam ultrices nibh sa 12'),
(199, 34, 1, 'Vontovorona - Les polytechniciens se révoltent', 'Les étudiants d’Antananarivo font à nouveau parler d’eux. Ceux de Vontovorona notamment ont bloqué la circulation dans la localité. Ils ont ainsi bloqué la circulation à Vontovorona, de 8 heures à 11 heures. Ils ont placé des moellons sur la largeur de la chaussée, en plusieurs endroits, et brûlé des pneus. Une forte délégation du ministère de l’Enseignement supérieur et de la recherche scientifique (Mesupres) est descendue sur place. Elle a réuni les manifestants  pour tenter de trouver une solution.', '<p style="text-align: justify;">R&eacute;volte. Neuf barrages ont &eacute;t&eacute; install&eacute;s par les &eacute;tudiants de l&rsquo;&Eacute;cole sup&eacute;rieure polytechnique d&rsquo;Antananarivo (ESPA) &agrave; Vontovorona, hier matin, le long de la route qui relie Alakamisy-Fenoarivo et le campus universitaire. Ils ont cri&eacute; haro sur le co&ucirc;t exorbitant de leurs droits d&rsquo;inscription. &laquo; Nous payons 50 000 ariary de plus que les &eacute;tudiants des autres facult&eacute;s. On nous avait promis plusieurs am&eacute;liorations en contrepartie. Mais depuis trois ans, nous n&rsquo;avons b&eacute;n&eacute;fici&eacute; que de quelques tableaux num&eacute;riques &raquo;, ass&egrave;ne Hasina Razakaniononana, pr&eacute;sident de l&rsquo;Association des &eacute;tudiants de Vontovorona. Les niveaux Licence L1-L2-L3 s&rsquo;acquittent de 100 000 ariary par an, ceux du Master, M1 et M2, de 125 000 ariary. Les &eacute;tudiants des autres facult&eacute;s paient respectivement 50 000 ariary et 75 000 ariary. &laquo; Si les trois mille &eacute;tudiants de la Polytechnique paient chacun 50 000 ariary, cela fait un gain de 150 000 000 ariary par an. Nous exigeons la transparence et revendiquons, soit la baisse du tarif des droits d&rsquo;inscription, soit la hausse de l&rsquo;indemnit&eacute; d&rsquo;&eacute;quipement&raquo;, r&eacute;clame leur porte-parole.</p>\n<p style="text-align: justify;"><strong>Convoqu&eacute;s</strong><br /> Ils ont ainsi bloqu&eacute; la circulation &agrave; Vontovorona, de 8 heures &agrave; 11 heures. Ils ont plac&eacute; des moellons sur la largeur de la chauss&eacute;e, en plusieurs endroits, et br&ucirc;l&eacute; des pneus. Une forte d&eacute;l&eacute;gation du minist&egrave;re de l&rsquo;Enseignement sup&eacute;rieur et de la recherche scientifique (Mesupres) est descendue sur place. Elle a r&eacute;uni les manifestants&nbsp; pour tenter de trouver une solution. &laquo; Il est normal que vous payez davantage. Vous devez payer le carburant des enseignants, car votre &eacute;tablissement est &eacute;loign&eacute; &raquo;, argue le directeur par int&eacute;rim de l&rsquo;ESPA. Il s&rsquo;est fait huer par les &eacute;tudiants. Les repr&eacute;sentants du minist&egrave;re ont rejet&eacute; la responsabilit&eacute; sur l&rsquo;ESPA. Pour &eacute;viter les d&eacute;bordements, le vice-pr&eacute;sident de l&rsquo;universit&eacute;, Roger Randrianja, et le pr&eacute;sident de l&rsquo;Association des &eacute;tudiants ont convenu de repousser la cl&ocirc;ture de l&rsquo;inscription pour l&rsquo;ESPA et de se r&eacute;unir, d&egrave;s l&rsquo;arriv&eacute;e du directeur de l&rsquo;&eacute;tablissement. Ce dernier est actuellement en mission.</p>');
INSERT INTO `bg_post_translate` (`id`, `post_id`, `locale_id`, `title`, `description`, `content`) VALUES
(200, 34, 2, 'Vontovorona - Les polytechniciens se révoltent', 'Les étudiants d’Antananarivo font à nouveau parler d’eux. Ceux de Vontovorona notamment ont bloqué la circulation dans la localité. Ils ont ainsi bloqué la circulation à Vontovorona, de 8 heures à 11 heures. Ils ont placé des moellons sur la largeur de la chaussée, en plusieurs endroits, et brûlé des pneus. Une forte délégation du ministère de l’Enseignement supérieur et de la recherche scientifique (Mesupres) est descendue sur place. Elle a réuni les manifestants  pour tenter de trouver une solution.', '<p style="text-align: justify;">R&eacute;volte. Neuf barrages ont &eacute;t&eacute; install&eacute;s par les &eacute;tudiants de l&rsquo;&Eacute;cole sup&eacute;rieure polytechnique d&rsquo;Antananarivo (ESPA) &agrave; Vontovorona, hier matin, le long de la route qui relie Alakamisy-Fenoarivo et le campus universitaire. Ils ont cri&eacute; haro sur le co&ucirc;t exorbitant de leurs droits d&rsquo;inscription. &laquo; Nous payons 50 000 ariary de plus que les &eacute;tudiants des autres facult&eacute;s. On nous avait promis plusieurs am&eacute;liorations en contrepartie. Mais depuis trois ans, nous n&rsquo;avons b&eacute;n&eacute;fici&eacute; que de quelques tableaux num&eacute;riques &raquo;, ass&egrave;ne Hasina Razakaniononana, pr&eacute;sident de l&rsquo;Association des &eacute;tudiants de Vontovorona. Les niveaux Licence L1-L2-L3 s&rsquo;acquittent de 100 000 ariary par an, ceux du Master, M1 et M2, de 125 000 ariary. Les &eacute;tudiants des autres facult&eacute;s paient respectivement 50 000 ariary et 75 000 ariary. &laquo; Si les trois mille &eacute;tudiants de la Polytechnique paient chacun 50 000 ariary, cela fait un gain de 150 000 000 ariary par an. Nous exigeons la transparence et revendiquons, soit la baisse du tarif des droits d&rsquo;inscription, soit la hausse de l&rsquo;indemnit&eacute; d&rsquo;&eacute;quipement&raquo;, r&eacute;clame leur porte-parole.</p>\n<p style="text-align: justify;"><strong>Convoqu&eacute;s</strong><br /> Ils ont ainsi bloqu&eacute; la circulation &agrave; Vontovorona, de 8 heures &agrave; 11 heures. Ils ont plac&eacute; des moellons sur la largeur de la chauss&eacute;e, en plusieurs endroits, et br&ucirc;l&eacute; des pneus. Une forte d&eacute;l&eacute;gation du minist&egrave;re de l&rsquo;Enseignement sup&eacute;rieur et de la recherche scientifique (Mesupres) est descendue sur place. Elle a r&eacute;uni les manifestants&nbsp; pour tenter de trouver une solution. &laquo; Il est normal que vous payez davantage. Vous devez payer le carburant des enseignants, car votre &eacute;tablissement est &eacute;loign&eacute; &raquo;, argue le directeur par int&eacute;rim de l&rsquo;ESPA. Il s&rsquo;est fait huer par les &eacute;tudiants. Les repr&eacute;sentants du minist&egrave;re ont rejet&eacute; la responsabilit&eacute; sur l&rsquo;ESPA. Pour &eacute;viter les d&eacute;bordements, le vice-pr&eacute;sident de l&rsquo;universit&eacute;, Roger Randrianja, et le pr&eacute;sident de l&rsquo;Association des &eacute;tudiants ont convenu de repousser la cl&ocirc;ture de l&rsquo;inscription pour l&rsquo;ESPA et de se r&eacute;unir, d&egrave;s l&rsquo;arriv&eacute;e du directeur de l&rsquo;&eacute;tablissement. Ce dernier est actuellement en mission.</p>'),
(201, 34, 3, 'Vontovorona - Les polytechniciens se révoltent', 'Les étudiants d’Antananarivo font à nouveau parler d’eux. Ceux de Vontovorona notamment ont bloqué la circulation dans la localité.', '<p style="text-align: justify;">R&eacute;volte. Neuf barrages ont &eacute;t&eacute; install&eacute;s par les &eacute;tudiants de l&rsquo;&Eacute;cole sup&eacute;rieure polytechnique d&rsquo;Antananarivo (ESPA) &agrave; Vontovorona, hier matin, le long de la route qui relie Alakamisy-Fenoarivo et le campus universitaire. Ils ont cri&eacute; haro sur le co&ucirc;t exorbitant de leurs droits d&rsquo;inscription. &laquo; Nous payons 50 000 ariary de plus que les &eacute;tudiants des autres facult&eacute;s. On nous avait promis plusieurs am&eacute;liorations en contrepartie. Mais depuis trois ans, nous n&rsquo;avons b&eacute;n&eacute;fici&eacute; que de quelques tableaux num&eacute;riques &raquo;, ass&egrave;ne Hasina Razakaniononana, pr&eacute;sident de l&rsquo;Association des &eacute;tudiants de Vontovorona. Les niveaux Licence L1-L2-L3 s&rsquo;acquittent de 100 000 ariary par an, ceux du Master, M1 et M2, de 125 000 ariary. Les &eacute;tudiants des autres facult&eacute;s paient respectivement 50 000 ariary et 75 000 ariary. &laquo; Si les trois mille &eacute;tudiants de la Polytechnique paient chacun 50 000 ariary, cela fait un gain de 150 000 000 ariary par an. Nous exigeons la transparence et revendiquons, soit la baisse du tarif des droits d&rsquo;inscription, soit la hausse de l&rsquo;indemnit&eacute; d&rsquo;&eacute;quipement&raquo;, r&eacute;clame leur porte-parole.</p>\n<p style="text-align: justify;"><strong>Convoqu&eacute;s</strong><br /> Ils ont ainsi bloqu&eacute; la circulation &agrave; Vontovorona, de 8 heures &agrave; 11 heures. Ils ont plac&eacute; des moellons sur la largeur de la chauss&eacute;e, en plusieurs endroits, et br&ucirc;l&eacute; des pneus. Une forte d&eacute;l&eacute;gation du minist&egrave;re de l&rsquo;Enseignement sup&eacute;rieur et de la recherche scientifique (Mesupres) est descendue sur place. Elle a r&eacute;uni les manifestants&nbsp; pour tenter de trouver une solution. &laquo; Il est normal que vous payez davantage. Vous devez payer le carburant des enseignants, car votre &eacute;tablissement est &eacute;loign&eacute; &raquo;, argue le directeur par int&eacute;rim de l&rsquo;ESPA. Il s&rsquo;est fait huer par les &eacute;tudiants. Les repr&eacute;sentants du minist&egrave;re ont rejet&eacute; la responsabilit&eacute; sur l&rsquo;ESPA. Pour &eacute;viter les d&eacute;bordements, le vice-pr&eacute;sident de l&rsquo;universit&eacute;, Roger Randrianja, et le pr&eacute;sident de l&rsquo;Association des &eacute;tudiants ont convenu de repousser la cl&ocirc;ture de l&rsquo;inscription pour l&rsquo;ESPA et de se r&eacute;unir, d&egrave;s l&rsquo;arriv&eacute;e du directeur de l&rsquo;&eacute;tablissement. Ce dernier est actuellement en mission.</p>'),
(202, 34, 4, 'Vontovorona - Les polytechniciens se révoltent', 'Les étudiants d’Antananarivo font à nouveau parler d’eux. Ceux de Vontovorona notamment ont bloqué la circulation dans la localité.', '<p style="text-align: justify;">R&eacute;volte. Neuf barrages ont &eacute;t&eacute; install&eacute;s par les &eacute;tudiants de l&rsquo;&Eacute;cole sup&eacute;rieure polytechnique d&rsquo;Antananarivo (ESPA) &agrave; Vontovorona, hier matin, le long de la route qui relie Alakamisy-Fenoarivo et le campus universitaire. Ils ont cri&eacute; haro sur le co&ucirc;t exorbitant de leurs droits d&rsquo;inscription. &laquo; Nous payons 50 000 ariary de plus que les &eacute;tudiants des autres facult&eacute;s. On nous avait promis plusieurs am&eacute;liorations en contrepartie. Mais depuis trois ans, nous n&rsquo;avons b&eacute;n&eacute;fici&eacute; que de quelques tableaux num&eacute;riques &raquo;, ass&egrave;ne Hasina Razakaniononana, pr&eacute;sident de l&rsquo;Association des &eacute;tudiants de Vontovorona. Les niveaux Licence L1-L2-L3 s&rsquo;acquittent de 100 000 ariary par an, ceux du Master, M1 et M2, de 125 000 ariary. Les &eacute;tudiants des autres facult&eacute;s paient respectivement 50 000 ariary et 75 000 ariary. &laquo; Si les trois mille &eacute;tudiants de la Polytechnique paient chacun 50 000 ariary, cela fait un gain de 150 000 000 ariary par an. Nous exigeons la transparence et revendiquons, soit la baisse du tarif des droits d&rsquo;inscription, soit la hausse de l&rsquo;indemnit&eacute; d&rsquo;&eacute;quipement&raquo;, r&eacute;clame leur porte-parole.</p>\n<p style="text-align: justify;"><strong>Convoqu&eacute;s</strong><br /> Ils ont ainsi bloqu&eacute; la circulation &agrave; Vontovorona, de 8 heures &agrave; 11 heures. Ils ont plac&eacute; des moellons sur la largeur de la chauss&eacute;e, en plusieurs endroits, et br&ucirc;l&eacute; des pneus. Une forte d&eacute;l&eacute;gation du minist&egrave;re de l&rsquo;Enseignement sup&eacute;rieur et de la recherche scientifique (Mesupres) est descendue sur place. Elle a r&eacute;uni les manifestants&nbsp; pour tenter de trouver une solution. &laquo; Il est normal que vous payez davantage. Vous devez payer le carburant des enseignants, car votre &eacute;tablissement est &eacute;loign&eacute; &raquo;, argue le directeur par int&eacute;rim de l&rsquo;ESPA. Il s&rsquo;est fait huer par les &eacute;tudiants. Les repr&eacute;sentants du minist&egrave;re ont rejet&eacute; la responsabilit&eacute; sur l&rsquo;ESPA. Pour &eacute;viter les d&eacute;bordements, le vice-pr&eacute;sident de l&rsquo;universit&eacute;, Roger Randrianja, et le pr&eacute;sident de l&rsquo;Association des &eacute;tudiants ont convenu de repousser la cl&ocirc;ture de l&rsquo;inscription pour l&rsquo;ESPA et de se r&eacute;unir, d&egrave;s l&rsquo;arriv&eacute;e du directeur de l&rsquo;&eacute;tablissement. Ce dernier est actuellement en mission.</p>'),
(203, 34, 5, 'Vontovorona - Les polytechniciens se révoltent', 'Les étudiants d’Antananarivo font à nouveau parler d’eux. Ceux de Vontovorona notamment ont bloqué la circulation dans la localité.', '<p style="text-align: justify;">R&eacute;volte. Neuf barrages ont &eacute;t&eacute; install&eacute;s par les &eacute;tudiants de l&rsquo;&Eacute;cole sup&eacute;rieure polytechnique d&rsquo;Antananarivo (ESPA) &agrave; Vontovorona, hier matin, le long de la route qui relie Alakamisy-Fenoarivo et le campus universitaire. Ils ont cri&eacute; haro sur le co&ucirc;t exorbitant de leurs droits d&rsquo;inscription. &laquo; Nous payons 50 000 ariary de plus que les &eacute;tudiants des autres facult&eacute;s. On nous avait promis plusieurs am&eacute;liorations en contrepartie. Mais depuis trois ans, nous n&rsquo;avons b&eacute;n&eacute;fici&eacute; que de quelques tableaux num&eacute;riques &raquo;, ass&egrave;ne Hasina Razakaniononana, pr&eacute;sident de l&rsquo;Association des &eacute;tudiants de Vontovorona. Les niveaux Licence L1-L2-L3 s&rsquo;acquittent de 100 000 ariary par an, ceux du Master, M1 et M2, de 125 000 ariary. Les &eacute;tudiants des autres facult&eacute;s paient respectivement 50 000 ariary et 75 000 ariary. &laquo; Si les trois mille &eacute;tudiants de la Polytechnique paient chacun 50 000 ariary, cela fait un gain de 150 000 000 ariary par an. Nous exigeons la transparence et revendiquons, soit la baisse du tarif des droits d&rsquo;inscription, soit la hausse de l&rsquo;indemnit&eacute; d&rsquo;&eacute;quipement&raquo;, r&eacute;clame leur porte-parole.</p>\n<p style="text-align: justify;"><strong>Convoqu&eacute;s</strong><br /> Ils ont ainsi bloqu&eacute; la circulation &agrave; Vontovorona, de 8 heures &agrave; 11 heures. Ils ont plac&eacute; des moellons sur la largeur de la chauss&eacute;e, en plusieurs endroits, et br&ucirc;l&eacute; des pneus. Une forte d&eacute;l&eacute;gation du minist&egrave;re de l&rsquo;Enseignement sup&eacute;rieur et de la recherche scientifique (Mesupres) est descendue sur place. Elle a r&eacute;uni les manifestants&nbsp; pour tenter de trouver une solution. &laquo; Il est normal que vous payez davantage. Vous devez payer le carburant des enseignants, car votre &eacute;tablissement est &eacute;loign&eacute; &raquo;, argue le directeur par int&eacute;rim de l&rsquo;ESPA. Il s&rsquo;est fait huer par les &eacute;tudiants. Les repr&eacute;sentants du minist&egrave;re ont rejet&eacute; la responsabilit&eacute; sur l&rsquo;ESPA. Pour &eacute;viter les d&eacute;bordements, le vice-pr&eacute;sident de l&rsquo;universit&eacute;, Roger Randrianja, et le pr&eacute;sident de l&rsquo;Association des &eacute;tudiants ont convenu de repousser la cl&ocirc;ture de l&rsquo;inscription pour l&rsquo;ESPA et de se r&eacute;unir, d&egrave;s l&rsquo;arriv&eacute;e du directeur de l&rsquo;&eacute;tablissement. Ce dernier est actuellement en mission.</p>'),
(204, 34, 6, 'Vontovorona - Les polytechniciens se révoltent', 'Les étudiants d’Antananarivo font à nouveau parler d’eux. Ceux de Vontovorona notamment ont bloqué la circulation dans la localité.', '<p style="text-align: justify;">R&eacute;volte. Neuf barrages ont &eacute;t&eacute; install&eacute;s par les &eacute;tudiants de l&rsquo;&Eacute;cole sup&eacute;rieure polytechnique d&rsquo;Antananarivo (ESPA) &agrave; Vontovorona, hier matin, le long de la route qui relie Alakamisy-Fenoarivo et le campus universitaire. Ils ont cri&eacute; haro sur le co&ucirc;t exorbitant de leurs droits d&rsquo;inscription. &laquo; Nous payons 50 000 ariary de plus que les &eacute;tudiants des autres facult&eacute;s. On nous avait promis plusieurs am&eacute;liorations en contrepartie. Mais depuis trois ans, nous n&rsquo;avons b&eacute;n&eacute;fici&eacute; que de quelques tableaux num&eacute;riques &raquo;, ass&egrave;ne Hasina Razakaniononana, pr&eacute;sident de l&rsquo;Association des &eacute;tudiants de Vontovorona. Les niveaux Licence L1-L2-L3 s&rsquo;acquittent de 100 000 ariary par an, ceux du Master, M1 et M2, de 125 000 ariary. Les &eacute;tudiants des autres facult&eacute;s paient respectivement 50 000 ariary et 75 000 ariary. &laquo; Si les trois mille &eacute;tudiants de la Polytechnique paient chacun 50 000 ariary, cela fait un gain de 150 000 000 ariary par an. Nous exigeons la transparence et revendiquons, soit la baisse du tarif des droits d&rsquo;inscription, soit la hausse de l&rsquo;indemnit&eacute; d&rsquo;&eacute;quipement&raquo;, r&eacute;clame leur porte-parole.</p>\n<p style="text-align: justify;"><strong>Convoqu&eacute;s</strong><br /> Ils ont ainsi bloqu&eacute; la circulation &agrave; Vontovorona, de 8 heures &agrave; 11 heures. Ils ont plac&eacute; des moellons sur la largeur de la chauss&eacute;e, en plusieurs endroits, et br&ucirc;l&eacute; des pneus. Une forte d&eacute;l&eacute;gation du minist&egrave;re de l&rsquo;Enseignement sup&eacute;rieur et de la recherche scientifique (Mesupres) est descendue sur place. Elle a r&eacute;uni les manifestants&nbsp; pour tenter de trouver une solution. &laquo; Il est normal que vous payez davantage. Vous devez payer le carburant des enseignants, car votre &eacute;tablissement est &eacute;loign&eacute; &raquo;, argue le directeur par int&eacute;rim de l&rsquo;ESPA. Il s&rsquo;est fait huer par les &eacute;tudiants. Les repr&eacute;sentants du minist&egrave;re ont rejet&eacute; la responsabilit&eacute; sur l&rsquo;ESPA. Pour &eacute;viter les d&eacute;bordements, le vice-pr&eacute;sident de l&rsquo;universit&eacute;, Roger Randrianja, et le pr&eacute;sident de l&rsquo;Association des &eacute;tudiants ont convenu de repousser la cl&ocirc;ture de l&rsquo;inscription pour l&rsquo;ESPA et de se r&eacute;unir, d&egrave;s l&rsquo;arriv&eacute;e du directeur de l&rsquo;&eacute;tablissement. Ce dernier est actuellement en mission.</p>'),
(205, 35, 1, 'fr n tristique elit sit amet, finibus rhon', 'fr. Description .n tristique elit sit amet, finibus rhon', 'fr. Content .n tristique elit sit amet, finibus rhon'),
(206, 35, 2, 'en n tristique elit sit amet, finibus rhon', 'en. Description .n tristique elit sit amet, finibus rhon', 'en. Content .n tristique elit sit amet, finibus rhon'),
(207, 35, 3, 'mg n tristique elit sit amet, finibus rhon', 'mg. Description .n tristique elit sit amet, finibus rhon', 'mg. Content .n tristique elit sit amet, finibus rhon'),
(208, 35, 4, 'it n tristique elit sit amet, finibus rhon', 'it. Description .n tristique elit sit amet, finibus rhon', 'it. Content .n tristique elit sit amet, finibus rhon'),
(209, 35, 5, 'es n tristique elit sit amet, finibus rhon', 'es. Description .n tristique elit sit amet, finibus rhon', 'es. Content .n tristique elit sit amet, finibus rhon'),
(210, 35, 6, 'de n tristique elit sit amet, finibus rhon', 'de. Description .n tristique elit sit amet, finibus rhon', 'de. Content .n tristique elit sit amet, finibus rhon');

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
(56, 'sdfsdf', 23, 2, '2017-06-09 10:18:23'),
(57, 'http://localhost/boot/web/app_dev.php/en/forum/subject/pellentesque-justo-aenean-dignissim-mollis-tellus-non-aliquam', 24, 1, '2017-07-04 22:42:04');

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
(23, 'sdfsdf', 'sdfsdf', 1, 2, '2017-06-09 10:18:23'),
(24, 'http://localhost/boot/web/app_dev.php/en/forum/subject/pellentesque-justo-aenean-dignissim-mollis-tellus-non-aliquam', 'http-localhost-boot-web-app-dev-php-en-forum-subject-pellentesque-justo-aenean-dignissim-mollis-tellus-non-aliquam', 4, 1, '2017-07-04 22:42:04');

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
(131, 3, 'fsdf sdf sdfs sdf', 2, '2017-06-30 07:44:27', NULL),
(132, 33, 'Ceci est un commentaire', 1, '2017-07-03 19:21:58', NULL),
(133, 29, 'mombamomba ekipa mentions légales fifandraisana newsletter \n\nEconomy Engineering Sciences naturelles Technologies Sciences humaines Arts Gestion Commerce & Marketing Paramedical Science sociale Informatique Droit Humans resources Tourisme Teleco', 1, '2017-07-04 22:34:03', NULL),
(134, 33, 'gikh dicitur, iste vester plane, ut mihi quidem videtur, inermis ac nudus est. tollit definitiones, nihil de dividendo ac partiendo docet, non quo modo efficiatur concludaturque ratio tradit, non qua via captiosa solvantur ambigua distinguantur ostendit; iudicia rerum in sensibus ponit, quibus si semel aliquid falsi pro vero probatum sit, sublatum esse omne iudic', 1, '2017-07-11 10:29:12', NULL),
(135, 34, 'Vous devez payer le carburant des enseignants, car votre établissement est éloigné », argue le directeur par intérim de l’ESPA. Il s’est fait huer par les étudiants. Les représentants du ministère ont rejeté la responsabilité sur l’ESPA. Pour éviter les débordements, le vice-président de l’université, Roger Randrianja, et le président de l’Association des étudiants ont convenu de repousser la clôture de l’inscription pour l’ESPA et de se réunir, dès l’arrivée du directeur de l’établissement. Ce dernier est actuellement en mission.', 1, '2017-07-24 15:48:53', NULL),
(136, NULL, 'Tandis que s''engager dans des études de comptabilité l''est beaucoup moins. La faute à l''image que l''on a des comptables et aux idées reçues qui traînent à leur sujet. A balayer de toute urgence.', 1, '2017-07-28 16:01:37', 1);

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
  `user_id` int(11) DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `pm_contact`
--

INSERT INTO `pm_contact` (`id`, `name`, `date`, `email`, `website`, `content`, `user_id`, `phone`) VALUES
(1, 'rakoto', '2017-02-16 06:55:02', 'rakoto@fmail.fe', 'dfgdfg', 'content', NULL, ''),
(2, 'Ut laoreet malesuada', '2017-04-24 12:00:37', 'user7@test.com', NULL, 'sdfsdf', NULL, ''),
(3, 'Ut laoreet malesuada', '2017-04-24 12:01:07', 'user7@test.com', NULL, 'sdfsdf', NULL, ''),
(4, 'Sed posuere nisl sed', '2017-04-24 12:06:56', 'user7@test.com', NULL, 'rzerze', NULL, ''),
(5, 'randria', '2017-04-24 12:22:14', 'randria@gamil.fom', NULL, 'sdfsdf', NULL, ''),
(6, 'Ut laoreet malesuada', '2017-04-24 12:23:07', 'gigy.idbooster@gmail.com', NULL, 'http://localhost/boot/web/app_dev.php/en/contact', 1, ''),
(7, 'Ut laoreet malesuada', '2017-04-24 12:51:24', 'randria@gamil.fom', NULL, 'et turpis ut, blandit egestas eros. Aliquam non nisi a felis sodales rutrum. Vivamus eget scelerisque nibh.\r\nNulla pulvinar a velit sit amet al', 1, ''),
(8, 'Ut laoreet malesuada', '2017-04-24 13:27:02', 'randria@gamil.fom', NULL, 'dfsdf', NULL, ''),
(9, 'dfgd', '2017-04-24 13:30:52', 'user12@test.fr', NULL, 'et convallis felis et convallis felis et convallis felis et convallis felis et convallis felis', NULL, ''),
(10, 'nom', '2017-06-12 07:35:42', 'sfsdf@df.dfd', NULL, 'uam erat volutpat. Suspendisse molestie rhoncus velit a elementum. Maecenas eleifend, lectus sit amet cursus porttitor, metus turpis luctus mauris, sit amet convallis felis turpis eget nequam erat volutpat. Suspendisse molestie rhoncus velit a elementum. Maecenas eleifend, lectus sit amet cursus porttitor, metus turpis luctus mauris, sit amet convallis felis turpis eget neq', NULL, ''),
(11, 'Suspendisse moles', '2017-07-04 22:50:42', 'Suspendisse@jj.jj', NULL, 'Suspendisse moles', 1, ''),
(12, 'rakoto', '2017-07-21 16:46:12', 'ma@gmail.com', NULL, 'vivamus pus erat loborotis', 1, ''),
(13, 'rakoto', '2017-07-21 16:51:19', 'ma@gmail.com', NULL, 'vivamus pus erat loborotis', 1, ''),
(14, 'randrianarisoa', '2017-07-21 16:59:33', 'randria@gmail.com', NULL, 'ceci est un message', NULL, '034 12 235 23'),
(15, 'randrianarisoa', '2017-07-21 17:00:04', 'randria@gmail.com', NULL, 'ceci est un message', NULL, '034 12 235 23'),
(16, 'randrianarisoa', '2017-07-21 17:06:34', 'randria@gmail.com', NULL, 'a pulvinar a velit sit amet aliquet. Aliquam erat volutpat. Suspendisse molestie rhoncus velit a elementum. Maecenas eleifend, lectus sit amet cursus porttitor, metus turpis luctus mauris, sit amet convallis felis turpis eget neque. Vestibulum metus nulla, tin', 1, '034 12 235 234'),
(17, 'autre test', '2017-07-21 17:09:52', 'user1@oio2.com', NULL, 't volutpat. Suspendisse molestie rhoncus velit a elementum. Maecenas eleifend, lectus sit amet cursus porttitor, metus turpis luctus mauris, sit amet convallis felis turpis eget neque. Vestibulum metus nulla, tincidunt in convallis vel, molestie at orci. U', 1, '034 12 235 23 12'),
(18, 'randrianarisoa', '2017-07-23 11:53:43', 'ma@gmail.com', NULL, 'ceci est un message', NULL, '034 12 235 23'),
(19, 'test5@oio.com', '2017-07-27 11:13:21', 'user1@oio.com', NULL, 'sit amet cursus porttitor, metus turpis luctus mauris, sit amet convallis felis turpis eget neque. Vestibulum metus nulla, tincidunt in convall', NULL, '034 12 235 23');

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
(21, 'sfsdf@df.dfd', '2017-06-12 07:35:43', 0),
(22, 'Suspendisse@jj.jj', '2017-07-04 22:50:42', 0),
(23, 'micka232@yahoo.fr', '2017-07-15 20:48:06', 0),
(24, 'nomtest@dfd.df', '2017-07-18 16:32:28', 0),
(25, 'aaa@aa.aa', '2017-07-18 16:38:16', 0),
(26, 'ma@gmail.com', '2017-07-18 16:56:16', 0),
(27, 'randria@gmail.com', '2017-07-21 16:59:33', 1),
(28, 'user1@oio2.com', '2017-07-21 17:09:52', 0),
(29, 'test@oio.com', '2017-07-21 18:06:33', 0),
(30, 'andy@oio.com', '2017-07-25 19:23:22', 0),
(31, 'nirina@oio.com', '2017-07-25 19:29:19', 0),
(32, 'nom@oio.com', '2017-07-25 19:30:43', 0),
(33, 'espa@gmail.com', '2017-07-25 19:45:05', 0),
(34, 'test2@oio.com', '2017-07-26 09:34:23', 0),
(35, 'test3@oio.com', '2017-07-26 09:36:44', 0),
(36, 'test4@oio.com', '2017-07-26 09:39:22', 0),
(37, 'test5@oio.com', '2017-07-26 09:43:02', 0),
(38, 'test6@oio.com', '2017-07-26 09:44:56', 0),
(39, 'user1@oio.com', '2017-07-27 11:13:22', 0);

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
(4, 'posts_by_page', '4');

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
(52, 13, 46, 2, 2, '2017-06-30 09:02:20', 1, '2017-06-30 09:02:20', 1),
(53, 33, 6, 1, 1, '2017-07-02 22:52:15', 1, '2017-07-02 22:52:15', 1),
(54, 33, 3, 1, 1, '2017-07-02 22:52:18', 1, '2017-07-02 22:52:18', 1),
(55, 33, 8, 1, 1, '2017-07-02 22:52:21', 1, '2017-07-02 22:52:21', 1),
(56, 25, 4, 1, 1, '2017-07-03 19:19:20', 1, '2017-07-03 19:19:20', 1),
(57, 25, 8, 1, 1, '2017-07-03 19:19:33', 1, '2017-07-03 19:19:33', 1),
(58, 33, 4, 1, 1, '2017-07-03 19:23:05', 1, '2017-07-03 19:23:05', 1),
(59, 30, 4, 1, 1, '2017-07-06 20:01:46', 1, '2017-07-06 20:01:46', 1),
(60, 29, 4, 1, 1, '2017-07-10 11:39:22', 1, '2017-07-10 11:39:22', 1),
(61, 29, 6, 1, 1, '2017-07-10 11:39:27', 1, '2017-07-10 11:39:27', 1),
(62, 29, 5, 1, 1, '2017-07-10 11:39:30', 1, '2017-07-10 11:39:30', 1),
(63, 29, 8, 1, 1, '2017-07-10 11:39:31', 1, '2017-07-10 11:39:31', 1),
(64, 29, 3, 1, 1, '2017-07-10 11:39:32', 1, '2017-07-10 11:39:32', 1),
(65, 29, 18, 1, 1, '2017-07-10 11:39:34', 1, '2017-07-10 11:39:34', 1),
(66, 34, 4, 1, 1, '2017-07-24 15:16:06', 1, '2017-07-24 15:16:06', 1),
(67, 33, 18, 1, 1, '2017-07-26 18:50:30', 1, '2017-07-26 18:50:30', 1);

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
(8, 'Commerce & Marketing', 'commerce-marketing'),
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
(24, 'agriculture', 'agriculture'),
(25, 'Finances', 'finances'),
(26, 'Geologie & gemmologie & mines', 'geologie-gemmologie-mines'),
(27, 'Multimedia', 'multimedia'),
(28, 'Lettres', 'lettres'),
(29, 'Langues étrangères', 'langues-etrangeres'),
(30, 'Politique', 'politique'),
(31, 'Diplomatie', 'diplomatie'),
(32, 'Météorologie', 'meteorologie'),
(33, 'Environnement', 'environnement'),
(34, 'Sociologie', 'sociologie'),
(35, 'Elevage', 'elevage'),
(36, 'Education', 'education'),
(37, 'Mécanique', 'mecanique'),
(38, 'Génie industriel', 'genie-industriel'),
(39, 'Développement', 'developpement'),
(40, 'Philosophie', 'philosophie'),
(41, 'Pédagogie', 'pedagogie'),
(42, 'Architecture', 'architecture'),
(43, 'Médecine', 'medecine'),
(44, 'Aéronotique', 'aeronotique');

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
(1, 1, 1, 1),
(6, 2, 2, 0),
(7, 2, 4, 1),
(8, 2, 6, 0),
(11, 1, 7, 0),
(12, 1, 8, 0),
(13, 3, 2, 0),
(14, 3, 4, 0),
(16, 5, 2, 0),
(17, 5, 4, 0),
(19, 6, 3, 0),
(21, 6, 5, 0),
(22, 6, 7, 0),
(23, 6, 8, 0),
(24, 7, 1, 0),
(25, 7, 7, 0),
(26, 7, 8, 0),
(27, 8, 8, 0),
(28, 8, 7, 0),
(30, 8, 1, 0),
(31, 9, 1, 0),
(32, 9, 2, 0),
(34, 9, 7, 0),
(35, 9, 8, 0),
(36, 11, 2, 0),
(37, 11, 3, 0),
(38, 11, 7, 0),
(39, 12, 5, 0),
(41, 13, 3, 0),
(42, 14, 3, 1),
(43, 14, 4, 0),
(45, 15, 3, 0),
(46, 16, 1, 0),
(47, 16, 2, 0),
(48, 16, 3, 0),
(50, 16, 5, 0),
(52, 16, 7, 0),
(53, 16, 8, 0),
(55, 17, 7, 0),
(62, 18, 7, 0),
(63, 18, 8, 0),
(65, 19, 7, 0),
(66, 19, 4, 0),
(68, 21, 2, 0),
(69, 21, 4, 0),
(71, 22, 7, 0),
(72, 22, 8, 1),
(73, 22, 5, 0),
(74, 23, 7, 0),
(75, 23, 8, 0),
(76, 24, 7, 0),
(78, 26, 2, 0),
(79, 26, 4, 0),
(80, 27, 5, 0),
(82, 29, 8, 0),
(83, 29, 7, 0),
(84, 29, 4, 0),
(85, 29, 2, 0),
(86, 31, 6, 0),
(89, 23, 1, 0),
(90, 32, 10, 1),
(91, 32, 9, 0),
(92, 17, 9, 0),
(93, 5, 11, 0),
(94, 29, 11, 0),
(95, 10, 12, 1),
(96, 10, 1, 0),
(97, 10, 8, 1),
(98, 10, 10, 1),
(99, 10, 5, 1),
(100, 33, 12, 1),
(102, 33, 6, 1),
(104, 33, 9, 0),
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
(150, 46, 11, 0),
(151, 36, 21, 0),
(153, 4, 26, 0),
(154, 21, 27, 0),
(155, 37, 27, 0),
(156, 12, 28, 0),
(157, 12, 29, 0),
(158, 27, 30, 0),
(159, 30, 30, 0),
(160, 4, 32, 0),
(161, 10, 34, 0),
(162, 48, 33, 0),
(163, 48, 7, 0),
(164, 49, 14, 0),
(165, 50, 17, 0),
(166, 50, 24, 0),
(167, 50, 35, 0),
(168, 51, 6, 0),
(169, 51, 18, 0),
(170, 40, 4, 0),
(171, 20, 11, 1),
(172, 52, 12, 0),
(173, 52, 7, 0),
(174, 53, 7, 0),
(175, 53, 11, 0),
(176, 54, 7, 0),
(177, 55, 19, 0),
(178, 55, 14, 0),
(179, 56, 9, 0),
(180, 57, 11, 0),
(181, 58, 7, 0),
(182, 58, 33, 0),
(183, 59, 7, 0),
(184, 59, 25, 0),
(185, 59, 8, 0),
(186, 60, 7, 0),
(187, 60, 8, 0),
(188, 61, 24, 0),
(189, 62, 7, 0),
(190, 63, 13, 0),
(191, 64, 7, 0),
(192, 65, 17, 0),
(193, 65, 1, 0),
(194, 65, 14, 0),
(195, 66, 16, 0),
(196, 66, 7, 0),
(197, 67, 12, 0),
(198, 67, 7, 0),
(199, 67, 25, 0),
(200, 68, 17, 0),
(201, 69, 22, 0),
(202, 30, 12, 0),
(203, 70, 10, 0),
(204, 70, 7, 0),
(205, 70, 1, 0),
(206, 71, 12, 0),
(207, 71, 30, 0),
(208, 72, 9, 0),
(209, 73, 9, 0),
(210, 74, 9, 0),
(211, 75, 7, 0),
(212, 75, 12, 0),
(213, 75, 11, 0),
(214, 75, 14, 0),
(215, 75, 19, 0),
(216, 76, 9, 0),
(217, 77, 9, 0),
(218, 78, 22, 0),
(219, 79, 11, 0),
(220, 79, 16, 0),
(221, 80, 9, 0),
(222, 81, 11, 0),
(223, 81, 7, 0),
(224, 82, 9, 0),
(225, 83, 8, 0),
(226, 83, 7, 0),
(227, 84, 16, 0),
(228, 84, 14, 0),
(229, 84, 19, 0),
(230, 84, 7, 0),
(231, 84, 36, 0),
(232, 85, 11, 0),
(233, 85, 7, 0),
(234, 13, 36, 0),
(235, 86, 11, 0),
(236, 87, 7, 0),
(237, 87, 12, 0),
(238, 87, 30, 0),
(239, 87, 11, 0),
(240, 87, 14, 0),
(241, 87, 33, 0),
(242, 87, 8, 0),
(243, 87, 31, 0),
(244, 88, 20, 0),
(245, 88, 22, 0),
(246, 88, 37, 0),
(247, 88, 14, 0),
(248, 88, 8, 0),
(249, 89, 7, 0),
(250, 89, 11, 0),
(251, 90, 37, 0),
(252, 90, 38, 0),
(253, 4, 38, 0),
(254, 91, 39, 0),
(255, 92, 40, 0),
(256, 93, 7, 0),
(257, 93, 14, 0),
(258, 93, 17, 0),
(259, 93, 11, 0),
(260, 94, 14, 0),
(261, 95, 15, 0),
(262, 95, 11, 0),
(263, 95, 21, 0),
(264, 95, 22, 0),
(265, 95, 1, 0),
(266, 95, 7, 0),
(267, 96, 29, 0),
(268, 97, 41, 0),
(269, 98, 7, 0),
(270, 99, 9, 0),
(271, 100, 9, 0),
(272, 101, 9, 0),
(273, 102, 9, 0),
(274, 103, 9, 0),
(275, 104, 9, 0),
(276, 105, 9, 0),
(277, 106, 9, 0),
(278, 107, 9, 0),
(279, 108, 9, 0),
(280, 109, 9, 0),
(281, 110, 41, 0),
(282, 111, 9, 0),
(283, 112, 9, 0),
(284, 113, 9, 0),
(285, 114, 9, 0),
(286, 115, 9, 0),
(287, 116, 9, 0),
(288, 117, 9, 0),
(289, 118, 9, 0),
(290, 119, 9, 0),
(291, 119, 4, 0),
(292, 120, 26, 0),
(293, 121, 38, 0),
(294, 121, 42, 0),
(295, 122, 26, 0),
(296, 123, 10, 0),
(297, 123, 16, 0),
(298, 124, 7, 0),
(299, 124, 8, 0),
(300, 124, 11, 0),
(301, 125, 7, 0),
(302, 125, 8, 0),
(303, 125, 43, 0),
(304, 125, 30, 0),
(305, 125, 12, 0),
(306, 126, 7, 0),
(307, 126, 20, 0),
(308, 127, 19, 0),
(309, 127, 14, 0),
(310, 127, 8, 0),
(311, 127, 22, 0),
(312, 128, 6, 0),
(313, 128, 11, 0),
(314, 128, 27, 0),
(315, 129, 7, 0),
(316, 130, 9, 0),
(317, 131, 37, 0),
(318, 131, 21, 0),
(319, 132, 9, 0),
(320, 133, 9, 0),
(321, 134, 9, 0),
(322, 15, 43, 0),
(323, 63, 39, 0),
(324, 135, 9, 0),
(325, 136, 9, 0),
(326, 137, 9, 0),
(327, 138, 9, 0),
(328, 139, 42, 0),
(329, 139, 22, 0),
(330, 140, 7, 0),
(331, 140, 28, 0),
(332, 140, 29, 0),
(333, 141, 9, 0),
(334, 142, 9, 0),
(335, 143, 17, 0),
(336, 144, 11, 0),
(337, 144, 1, 0),
(338, 145, 9, 0),
(339, 146, 7, 0),
(340, 146, 17, 0),
(341, 147, 25, 0),
(342, 147, 7, 0),
(343, 148, 7, 0),
(344, 149, 8, 0),
(345, 149, 7, 0),
(346, 149, 12, 0),
(347, 149, 16, 0),
(348, 150, 9, 0),
(349, 150, 7, 0),
(350, 150, 11, 0),
(351, 150, 22, 0),
(352, 151, 22, 0),
(353, 151, 11, 0),
(354, 151, 1, 0),
(355, 151, 7, 0),
(356, 151, 29, 0),
(357, 152, 41, 0),
(358, 152, 11, 0),
(359, 152, 7, 0),
(360, 152, 28, 0),
(361, 152, 9, 0),
(362, 153, 7, 0),
(363, 153, 20, 0),
(364, 154, 7, 0),
(365, 154, 8, 0),
(366, 3, 6, 0),
(367, 3, 8, 0),
(368, 3, 11, 0),
(369, 3, 12, 0),
(370, 3, 24, 0),
(371, 13, 41, 0),
(372, 4, 22, 0),
(373, 4, 21, 0),
(374, 155, 39, 0),
(375, 155, 7, 0),
(376, 155, 11, 0),
(377, 159, 16, 0),
(378, 159, 22, 0),
(379, 160, 44, 0),
(380, 156, 7, 0),
(381, 156, 11, 0),
(382, 157, 21, 0),
(383, 157, 11, 0),
(384, 158, 26, 0),
(385, 158, 33, 0),
(386, 158, 22, 0),
(387, 158, 7, 0),
(388, 161, 15, 0),
(389, 161, 21, 0),
(390, 161, 11, 0),
(391, 162, 7, 0),
(392, 162, 11, 0),
(393, 163, 11, 0),
(394, 164, 9, 0),
(395, 165, 11, 0),
(396, 165, 22, 0),
(401, 167, 7, 0),
(402, 167, 11, 0),
(403, 167, 8, 0),
(404, 67, 20, 0),
(405, 67, 41, 0),
(406, 25, 9, 0),
(407, 168, 7, 0),
(408, 168, 11, 0),
(409, 28, 14, 0),
(410, 28, 19, 0),
(411, 166, 9, 0),
(412, 169, 9, 0),
(413, 170, 9, 0),
(414, 47, 9, 0),
(415, 29, 22, 0),
(416, 29, 42, 0),
(417, 29, 14, 0),
(418, 29, 33, 0),
(419, 171, 7, 0),
(420, 172, 12, 0),
(421, 172, 7, 0),
(422, 173, 17, 0),
(423, 173, 14, 0),
(424, 173, 7, 0),
(425, 174, 17, 0),
(426, 175, 10, 0),
(427, 176, 7, 0),
(428, 176, 8, 0),
(429, 177, 25, 0),
(430, 178, 20, 0),
(431, 178, 33, 0),
(432, 179, 11, 0),
(433, 179, 7, 0),
(434, 179, 30, 0),
(435, 179, 16, 0),
(436, 180, 7, 0),
(437, 181, 7, 0),
(438, 182, 7, 0),
(439, 19, 33, 0),
(440, 19, 11, 0),
(441, 19, 22, 0),
(442, 19, 16, 0),
(443, 19, 9, 0),
(444, 19, 14, 0),
(445, 19, 12, 0),
(446, 183, 6, 0);

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
(31, 8, 1, 'Commerce & Marketing', 'fr. Description .Etude de commerce'),
(32, 8, 2, 'Commerce & Marketing', 'en. Description .Etude de commerce'),
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
(138, 25, 6, 'de Finances', 'de. Description .Finances'),
(139, 26, 1, 'fr Geologie', 'fr. Description .Geologie'),
(140, 26, 2, 'en Geologie', 'en. Description .Geologie'),
(141, 26, 3, 'mg Geologie', 'mg. Description .Geologie'),
(142, 26, 4, 'it Geologie', 'it. Description .Geologie'),
(143, 26, 5, 'es Geologie', 'es. Description .Geologie'),
(144, 26, 6, 'de Geologie', 'de. Description .Geologie'),
(145, 27, 1, 'fr Multimedia', 'fr. Description .Multimedia'),
(146, 27, 2, 'en Multimedia', 'en. Description .Multimedia'),
(147, 27, 3, 'mg Multimedia', 'mg. Description .Multimedia'),
(148, 27, 4, 'it Multimedia', 'it. Description .Multimedia'),
(149, 27, 5, 'es Multimedia', 'es. Description .Multimedia'),
(150, 27, 6, 'de Multimedia', 'de. Description .Multimedia'),
(151, 28, 1, 'fr Lettres', 'fr. Description .Lettres'),
(152, 28, 2, 'en Lettres', 'en. Description .Lettres'),
(153, 28, 3, 'mg Lettres', 'mg. Description .Lettres'),
(154, 28, 4, 'it Lettres', 'it. Description .Lettres'),
(155, 28, 5, 'es Lettres', 'es. Description .Lettres'),
(156, 28, 6, 'de Lettres', 'de. Description .Lettres'),
(157, 29, 1, 'fr Langues étrangères', 'fr. Description .Langues étrangères'),
(158, 29, 2, 'en Langues étrangères', 'en. Description .Langues étrangères'),
(159, 29, 3, 'mg Langues étrangères', 'mg. Description .Langues étrangères'),
(160, 29, 4, 'it Langues étrangères', 'it. Description .Langues étrangères'),
(161, 29, 5, 'es Langues étrangères', 'es. Description .Langues étrangères'),
(162, 29, 6, 'de Langues étrangères', 'de. Description .Langues étrangères'),
(163, 30, 1, 'Politique', 'fr. Description .Poli'),
(164, 30, 2, 'Politique', 'en. Description .Poli'),
(165, 30, 3, 'mg Poli', 'mg. Description .Poli'),
(166, 30, 4, 'it Poli', 'it. Description .Poli'),
(167, 30, 5, 'es Poli', 'es. Description .Poli'),
(168, 30, 6, 'de Poli', 'de. Description .Poli'),
(169, 31, 1, 'fr Diplomatie', 'fr. Description .Diplomatie'),
(170, 31, 2, 'en Diplomatie', 'en. Description .Diplomatie'),
(171, 31, 3, 'mg Diplomatie', 'mg. Description .Diplomatie'),
(172, 31, 4, 'it Diplomatie', 'it. Description .Diplomatie'),
(173, 31, 5, 'es Diplomatie', 'es. Description .Diplomatie'),
(174, 31, 6, 'de Diplomatie', 'de. Description .Diplomatie'),
(175, 32, 1, 'fr Météorologie', 'fr. Description .Météorologie'),
(176, 32, 2, 'en Météorologie', 'en. Description .Météorologie'),
(177, 32, 3, 'mg Météorologie', 'mg. Description .Météorologie'),
(178, 32, 4, 'it Météorologie', 'it. Description .Météorologie'),
(179, 32, 5, 'es Météorologie', 'es. Description .Météorologie'),
(180, 32, 6, 'de Météorologie', 'de. Description .Météorologie'),
(181, 33, 1, 'fr Environnement', 'fr. Description .Environnement'),
(182, 33, 2, 'en Environnement', 'en. Description .Environnement'),
(183, 33, 3, 'mg Environnement', 'mg. Description .Environnement'),
(184, 33, 4, 'it Environnement', 'it. Description .Environnement'),
(185, 33, 5, 'es Environnement', 'es. Description .Environnement'),
(186, 33, 6, 'de Environnement', 'de. Description .Environnement'),
(187, 34, 1, 'fr Sociologie', 'fr. Description .Sociologie'),
(188, 34, 2, 'en Sociologie', 'en. Description .Sociologie'),
(189, 34, 3, 'mg Sociologie', 'mg. Description .Sociologie'),
(190, 34, 4, 'it Sociologie', 'it. Description .Sociologie'),
(191, 34, 5, 'es Sociologie', 'es. Description .Sociologie'),
(192, 34, 6, 'de Sociologie', 'de. Description .Sociologie'),
(193, 35, 1, 'fr Elevage', 'fr. Description .Elevage'),
(194, 35, 2, 'en Elevage', 'en. Description .Elevage'),
(195, 35, 3, 'mg Elevage', 'mg. Description .Elevage'),
(196, 35, 4, 'it Elevage', 'it. Description .Elevage'),
(197, 35, 5, 'es Elevage', 'es. Description .Elevage'),
(198, 35, 6, 'de Elevage', 'de. Description .Elevage'),
(199, 36, 1, 'fr Education', 'fr. Description .Education'),
(200, 36, 2, 'en Education', 'en. Description .Education'),
(201, 36, 3, 'mg Education', 'mg. Description .Education'),
(202, 36, 4, 'it Education', 'it. Description .Education'),
(203, 36, 5, 'es Education', 'es. Description .Education'),
(204, 36, 6, 'de Education', 'de. Description .Education'),
(205, 37, 1, 'fr Mécanique', 'fr. Description .Mécanique'),
(206, 37, 2, 'en Mécanique', 'en. Description .Mécanique'),
(207, 37, 3, 'mg Mécanique', 'mg. Description .Mécanique'),
(208, 37, 4, 'it Mécanique', 'it. Description .Mécanique'),
(209, 37, 5, 'es Mécanique', 'es. Description .Mécanique'),
(210, 37, 6, 'de Mécanique', 'de. Description .Mécanique'),
(211, 38, 1, 'fr Génie industriel', 'fr. Description .Génie industriel'),
(212, 38, 2, 'en Génie industriel', 'en. Description .Génie industriel'),
(213, 38, 3, 'mg Génie industriel', 'mg. Description .Génie industriel'),
(214, 38, 4, 'it Génie industriel', 'it. Description .Génie industriel'),
(215, 38, 5, 'es Génie industriel', 'es. Description .Génie industriel'),
(216, 38, 6, 'de Génie industriel', 'de. Description .Génie industriel'),
(217, 39, 1, 'fr Développement', 'fr. Description .Développement'),
(218, 39, 2, 'en Développement', 'en. Description .Développement'),
(219, 39, 3, 'mg Développement', 'mg. Description .Développement'),
(220, 39, 4, 'it Développement', 'it. Description .Développement'),
(221, 39, 5, 'es Développement', 'es. Description .Développement'),
(222, 39, 6, 'de Développement', 'de. Description .Développement'),
(223, 40, 1, 'fr Philosophie', 'fr. Description .Philosophie'),
(224, 40, 2, 'en Philosophie', 'en. Description .Philosophie'),
(225, 40, 3, 'mg Philosophie', 'mg. Description .Philosophie'),
(226, 40, 4, 'it Philosophie', 'it. Description .Philosophie'),
(227, 40, 5, 'es Philosophie', 'es. Description .Philosophie'),
(228, 40, 6, 'de Philosophie', 'de. Description .Philosophie'),
(229, 41, 1, 'fr Pédagogie', 'fr. Description .Pédagogie'),
(230, 41, 2, 'en Pédagogie', 'en. Description .Pédagogie'),
(231, 41, 3, 'mg Pédagogie', 'mg. Description .Pédagogie'),
(232, 41, 4, 'it Pédagogie', 'it. Description .Pédagogie'),
(233, 41, 5, 'es Pédagogie', 'es. Description .Pédagogie'),
(234, 41, 6, 'de Pédagogie', 'de. Description .Pédagogie'),
(235, 42, 1, 'fr Architecture', 'fr. Description .Architecture'),
(236, 42, 2, 'en Architecture', 'en. Description .Architecture'),
(237, 42, 3, 'mg Architecture', 'mg. Description .Architecture'),
(238, 42, 4, 'it Architecture', 'it. Description .Architecture'),
(239, 42, 5, 'es Architecture', 'es. Description .Architecture'),
(240, 42, 6, 'de Architecture', 'de. Description .Architecture'),
(241, 43, 1, 'fr Médecine', 'fr. Description .Médecine'),
(242, 43, 2, 'en Médecine', 'en. Description .Médecine'),
(243, 43, 3, 'mg Médecine', 'mg. Description .Médecine'),
(244, 43, 4, 'it Médecine', 'it. Description .Médecine'),
(245, 43, 5, 'es Médecine', 'es. Description .Médecine'),
(246, 43, 6, 'de Médecine', 'de. Description .Médecine'),
(247, 44, 1, 'fr Aéronotique', 'fr. Description .Aéronotique'),
(248, 44, 2, 'en Aéronotique', 'en. Description .Aéronotique'),
(249, 44, 3, 'mg Aéronotique', 'mg. Description .Aéronotique'),
(250, 44, 4, 'it Aéronotique', 'it. Description .Aéronotique'),
(251, 44, 5, 'es Aéronotique', 'es. Description .Aéronotique'),
(252, 44, 6, 'de Aéronotique', 'de. Description .Aéronotique');

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
(39, 17, 'land97.JPG', 'decbe42577ebc522f48308ff646c1edd8a0fce8f.jpeg', 'land97.JPG', 0),
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
(51, 3, 'land92.JPG', 'a489ecc8c5e367c9437427fbe852aebb45b8977f.jpeg', 'land92.JPG', 0),
(52, 1, 'land3.jpg', '70b01d2b91b05ff5dc7dae5644dd41fc6d502763.jpeg', 'land3.jpg', 0),
(53, 1, 'land96.jpg', '8fbb090b22cde6eccec8bec556b0bf6e34c10514.jpeg', 'land96.jpg', 0),
(54, 1, 'land92.JPG', '122e0a58c1e5115643274d114e8fe71444ac6a93.jpeg', 'land92.JPG', 0),
(55, 1, 'land6.jpg', 'f0dc202b255252e77503de7067bf8e32e867bf1d.jpeg', 'land6.jpg', 0),
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
(70, 35, 'ism.jpg', 'f1ce0df2bacad1f647998b59083d93f30085bdf5.jpeg', 'ism.jpg', 1),
(71, 46, 'ssss.jpg', 'faade4b461b64eb19fe352a9d73df9342aec261c.jpeg', 'ssss.jpg', 1),
(72, 17, 'inspnmad-TSIDIDY-2-9.jpg', '7f11c6bbe305431f8238da0aac2bdaf75874b476.jpeg', 'inspnmad-TSIDIDY-2-9.jpg', 1),
(73, 30, 'barley-2117454_1920.jpg', '4aea0914d3967c3fcca4317a4d2b334219a3ae7d.jpeg', 'barley-2117454_1920.jpg', 1),
(74, 1, 'trano.jpg', 'c85405244f4036972fd2f0049f349549b98efcb4.jpeg', 'trano.jpg', 1),
(75, 3, 'asjam.png', '4f1a282e218f43185cfed94ea03c42618ded818b.png', 'asjam.png', 1),
(76, 106, 'fianara.jpg', 'ee39887a5b908d1f8cffdf5e9f63cafd13fa9a20.jpeg', 'fianara.jpg', 1),
(77, 99, 'vert.jpg', '9ad9cba097d63089bd1f8b1e1e8f76cfe82be458.jpeg', 'vert.jpg', 1),
(78, 151, '15112.jpg', '0fe146494dcafc35614fe5fe0574734cdf3ef0ba.jpeg', '15112.jpg', 1),
(79, 150, '713522.jpg', '13a61efa8401e5b74c8cd470dd47bbe51693c67d.jpeg', '713522.jpg', 1),
(80, 67, 'nice.jpg', '0216853274f6f41e28ce26182301a0783a6d3bd6.jpeg', 'nice.jpg', 1),
(81, 88, 'tanety2.png', '4d23b73f9f793f842770a59b16ec00375fffdaf6.png', 'tanety2.png', 1),
(82, 27, 'iep-vie-etudiante.jpg', '792ec41c24d63d260331b3728a6f3f8486b85096.jpeg', 'iep-vie-etudiante.jpg', 1),
(83, 87, 'jaune.jpg', '49f478c787899766dd7014703c8f220013df63e2.jpeg', 'jaune.jpg', 1),
(84, 166, '19072.png', '3391bf386abcb88e639b1b8c355081aa09930c26.png', '19072.png', 1),
(85, 47, '41152.jpg', 'f48580865787a3c93842166285faaf1389ad059f.jpeg', '41152.jpg', 1),
(86, 170, '06-012.jpg', 'b06417017d33cb2425af5b9ededae3c4ac4728d0.jpeg', '06-012.jpg', 1),
(87, 105, '68962.jpg', '89e9089cd7b74bb319a21814c36d0156ae8a44f2.jpeg', '68962.jpg', 1),
(88, 119, '76312.png', '307b66feba4c2e60cff3e200eaeb8024b9c67faf.png', '76312.png', 1),
(89, 127, '1111.jpg', '8629f3ed6dad9181f7b942f60e1952188ccc1d5b.jpeg', '1111.jpg', 1),
(90, 69, '7123.jpg', '144500a4bcbdf8d691fa9950696ce94192b1045a.jpeg', '7123.jpg', 1),
(91, 108, '2422.jpg', '431924664c8fa20ea2f2e5eab3d0a415ff58cea4.jpeg', '2422.jpg', 1),
(92, 173, 'rivierenature.jpg', '7e56595f9ae699a8555f55a6ab29290281c9538e.jpeg', 'rivierenature.jpg', 1),
(93, 183, 'musicegm.jpg', '02aadc382b9ea39103bcbe5d4cde576cac703d27.jpeg', 'musicegm.jpg', 1);

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
(95, 46, 2, 100, 'nsternuntur, aut ex necessitate ultima fortiter dimicante, superati periculose per prona discedunt. Hanc regionem praestitutis celebritati diebus invadere parans dux ante edictus per solitudines Aboraeque amnis herbidas ripas, suorum indicio proditus, qui admissi flagitii metu exagitati ad praesidia descivere Romana. absque ullo egress', '2017-06-30 09:01:05'),
(96, 25, 4, 80, 'hkh hhkjhjk', '2017-07-01 18:01:52'),
(97, 37, 1, 40, 'mofsd ljsdlf jsdlfjslkdf', '2017-07-03 19:30:56'),
(98, 15, 1, 100, 'ctus id Caesar libertatemque superbiam ratus tamquam obtrectatorem audacem excarnificari praecepit, qui ita evisceratus ut cruciatibus membra deessent, inplorans caelo iustitiam, torvum renidens fundato pectore mansit inmobilis nec se incusare nec quemquam alium passus et tandem nec confessus nec confutatus cum abiecto consorte po', '2017-07-07 11:37:58'),
(99, 3, 1, 80, 'fsdfsdf', '2017-07-12 10:19:27'),
(100, 67, 1, 80, 'Lorem ipsum dolor et sit amet', '2017-07-15 09:57:10'),
(101, 136, 2, 80, 'ropos de Institut Supérieur des Paramédicaux d’ Alaotrropos de Institut Supérieur des Paramédicaux d’ Alaotr', '2017-07-15 18:31:00'),
(102, 1, 17, 100, 'nouvelle evaluation : et. Sed tempor iaculis ligula quis tincidunt. Vivamus nec commodo ipsum, sed viverra nibh. Phasellus hendrerit condimentum mi, vitae volutpat lorem convallis eu. Suspendisse commodo sollicitudin mi, eu scelerisque turpis facilisis non.Quisque ullamcorper pulvinar libero, sit amet tristique est auctor sit amet. Sed tempor iaculis ligula quis tincidunt', '2017-07-18 17:00:32'),
(103, 170, 1, 40, 'Ibi victu recreati et quiete, postquam abierat timor, vicos opulentos adorti equestrium adventu cohortium, quae casu propinquabant, nec resistere planitie porrecta conati digressi sunt retroque concedentes omne iuventutis robur relictum in sedibus acciverunt.', '2017-07-21 15:39:58'),
(104, 29, 1, 100, 'Une très beau institut à frequenter . très sérieux. je le conseille.', '2017-07-24 15:37:46'),
(105, 106, 1, 60, 'homines quidam ignoti, vilitate ipsa parum cavendi ad colligendos rumores per Antiochiae latera cuncta destinarentur relaturi quae audirent. hi peragranter et dissimulanter honoratorum circulis adsistendo pervadendoque divites domus egentium habitu quicquid noscere poterant vel audire latenter intromissi per posticas in regiam nuntiabant, id observantes', '2017-07-26 17:38:52'),
(106, 108, 1, 80, 'homines quidam ignoti, vilitate ipsa parum cavendi ad colligendos rumores per Antiochiae latera cuncta destinarentur relaturi quae audirent. hi peragranter et dissimulanter honoratorum circulis adsistendo pervadendoque divites domus egentium habitu quicquid noscere poterant vel audire latenter intromissi per posticas in regiam nuntiabant, id observantes', '2017-07-26 17:40:33'),
(107, 183, 1, 100, 'Je le conseille vivement. c''est un bon établissement avec frais de formation abordable', '2017-07-28 16:31:04');

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
(5, 'textile-et-habillement', 3, 'textile et habillement', 1),
(6, 'production-et-sante-animale-psa', 3, 'Production et Santé Animale (PSA)', 1),
(7, 'mauris-facilisis-lacus', 8, 'Mauris facilisis lacus', 0),
(11, 'llam-odio-nisl-accumsan', 8, 'llam odio nisl, accumsan', 0),
(12, 'theologie', 6, 'Théologie', 0),
(13, 'droit-et-affaires-etrangeres', 6, 'Droit et affaires étrangères', 0),
(14, 'batiment-et-travaux-publiques-btp', 4, 'Batiment et Travaux Publiques (BTP)', 0),
(15, 'nam-ultrices-nibh-sapien-vel-cursus-leo-tempus-eu', 11, 'Nam ultrices nibh sapien, vel cursus leo tempus eu', 0),
(16, 'informatique-et-telecommunications', 29, 'Informatique et Télécommunications', 0),
(17, 'curabitur-laoreet-varius-malesuada', 1, 'Curabitur laoreet varius malesuada', 1),
(22, 'uismod-sit-amet-ultricies-co', 22, 'uismod sit amet ultricies co', 0),
(23, 'felis-nisi-ut-variu', 22, 'felis nisi, ut variu', 0),
(24, 'sit-amet-ultricies-co', 1, 'sit amet ultricies co', 0),
(25, 'acinia-fel', 1, 'acinia fel', 0),
(26, 'droit', 3, 'Droit', 0),
(27, 'mod-sit-amet-ultricies', 2, 'mod sit amet ultricies', 0),
(28, 'gestion-commerciale', 3, 'gestion commerciale', 0),
(29, 'ressources-humaines', 34, 'Ressources Humaines', 0),
(30, 'telecommunications', 4, 'Télécommunications', 0),
(31, 'sciences-agricoles', 3, 'Sciences agricoles', 0),
(32, 'informatique', 3, 'Informatique', 0),
(33, 'sci-ences-de-la-terre', 3, 'Sci ences de la Terre', 0),
(34, 'economie-et-commerce', 3, 'Economie et Commerce', 0),
(35, 'telecommunications', 3, 'Télécommunications', 0),
(36, 'sage-femme', 99, 'Sage-femme', 0),
(37, 'infirmier', 99, 'Infirmier', 0),
(38, 'droit', 87, 'Droit', 0),
(39, 'interpretariat-diplomatie-sciences-politiques', 87, 'Interprétariat / Diplomatie / Sciences politiques', 0),
(40, 'administration-management', 87, 'Administration / Management', 0),
(41, 'commerce-marketing', 87, 'Commerce / Marketing', 0),
(42, 'tourisme-hotellerie-environnement', 87, 'Tourisme / Hôtellerie / Environnement', 0),
(43, 'informatique', 87, 'Informatique', 0),
(44, 'droit-et-technique-des-affaires', 67, 'Droit et Technique des Affaires', 0),
(45, 'gestion-et-administration-d-rsquo-entreprise', 67, 'Gestion et administration d’entreprise', 0),
(46, 'banque-et-institution-des-micro-finances', 67, 'Banque et Institution des Micro Finances', 0),
(47, 'formation-pedagogique-et-administration-scolaire', 67, 'Formation Pédagogique et Administration Scolaire', 0),
(48, 'sage-femme', 25, 'Sage - femme', 0),
(49, 'infirmier-generaliste', 25, 'Infirmier généraliste', 0),
(50, 'bio-technicien', 25, 'Bio technicien', 0),
(51, 'informatique', 168, 'Informatique', 0),
(52, 'gestion', 168, 'Gestion', 0),
(53, 'infirmier-generaliste', 166, 'Infirmier généraliste', 0),
(54, 'sages-femmes', 166, 'Sages - femmes', 0),
(55, 'aide-soignante', 166, 'Aide soignante', 0),
(56, 'secretaire-medical', 166, 'Secrétaire médical', 0),
(57, 'sage-femme', 169, 'Sage-femme', 0),
(58, 'infirmier', 169, 'Infirmier', 0),
(59, 'sage-femme', 170, 'Sage-femme', 0),
(60, 'infirmier', 170, 'Infirmier', 0),
(61, 'technicien-de-laboratoire', 170, 'Technicien de laboratoire', 0),
(63, 'infirmier', 47, 'Infirmier', 0),
(64, 'sage-femme', 47, 'Sage-femme', 0),
(65, 'masso-kinesitherapie', 47, 'Masso-Kinesithérapie', 0),
(66, 'technicien-de-laboratoire', 47, 'Technicien de laboratoire', 0),
(67, 'infirmier-generaliste', 119, 'Infirmier généraliste', 0),
(68, 'sage-femme', 119, 'Sage - femme', 0),
(69, 't-echnologie-medicale', 119, 'T echnologie médicale', 0),
(70, 'genie-civil-et-architecture', 29, 'Génie civil et Architecture', 0),
(71, 'genie-industriel', 29, 'Génie industriel', 0),
(72, 'biotechnologies', 29, 'Biotechnologies', 0),
(73, 'techniques-des-affaires-et-administration-et-techniques-juridiques', 29, 'Techniques des Affaires et Administration et Techniques   juridiques', 0),
(74, 'techniques-du-tourisme-et-de-l-rsquo-environnement', 29, 'Techniques du Tourisme et de l’Environnement', 0),
(75, 'bio-informatique-et-biotechnologie', 29, 'Bio Informatique et Biotechnologie', 0),
(76, 'gestion-budgetaire-et-controle-de-gestion-budgetaire', 171, 'Gestion budgétaire et Contrôle de gestion budgétaire', 0),
(77, 'conception-budgetaire-et-controle-de-gestion', 171, 'Conception budgétaire et Contrôle de gestion', 0),
(78, 'droit', 172, 'Droit', 0),
(79, 'gestion', 172, 'Gestion', 0),
(80, 'sciences-agronomiques-et-halieutiques', 174, 'Sciences Agronomiques et Halieutiques', 0),
(81, 'geologie-mines', 4, 'Géologie & mines', 0),
(82, 'electroniques', 4, 'Electroniques', 0),
(83, 'meteorologie', 4, 'Météorologie', 0),
(84, 'genie-industriel', 4, 'Génie industriel', 0),
(85, 'hotel-and-tourism-management', 127, 'hotel and tourism management', 0),
(86, 'management-and-business-studies', 127, 'Management and business studies', 0),
(87, 'batiment-et-travaux-publics', 127, 'Batiment et Travaux Publics', 0),
(88, 'travail-social', 175, 'Travail social', 0),
(89, 'genie-civil', 69, 'Génie civil', 0),
(90, 'management-en-hotellerie-internationale', 31, 'Management en Hôtellerie Internationale', 0),
(91, 'sage-femme', 108, 'Sage-femme', 0),
(92, 'infirmier', 108, 'Infirmier', 0),
(93, 'gestion', 176, 'Gestion', 0),
(94, 'commerce', 176, 'Commerce', 0),
(95, 'maths-finances', 177, 'Maths - Finances', 0),
(96, 'gestion-et-administration-d-rsquo-entreprise', 178, 'Gestion et administration d’entreprise', 0),
(97, 'sciences-marines-et-de-l-rsquo-environnement', 178, 'Sciences Marines et de l’Environnement', 0),
(98, 'informatique', 179, 'Informatique', 0),
(99, 'sciences-de-la-gestion', 179, 'Sciences de la Gestion', 0),
(100, 'hautes-etudes-politiques', 179, 'Hautes Etudes Politiques', 0),
(101, 'communication', 179, 'Communication', 0),
(102, 'management-et-gestion', 179, 'Management et Gestion', 0),
(103, 'management-et-entreprenariat', 180, 'Management et Entreprenariat', 0),
(104, 'sciences-de-la-gestion', 181, 'Sciences de la Gestion', 0),
(105, 'gestion', 182, 'Gestion', 0),
(106, 'environnement', 19, 'Environnement', 0),
(107, 'batiment-et-travaux-publics', 19, 'Bâtiment et Travaux Publics', 0),
(108, 'informatique', 19, 'Informatique', 0),
(109, 'gestion-management', 19, 'Gestion & Management', 0),
(110, 'information-communication-journalisme', 19, 'Information & Communication & Journalisme', 0),
(111, 'management-tourisme', 19, 'Management Tourisme', 0),
(112, 'sciences-paramedicales', 19, 'Sciences paramédicales', 0),
(113, 'management', 146, 'Management', 0),
(114, 'agronomie-specialisation-agri-business', 146, 'Agronomie Spécialisation Agri business', 0),
(115, 'agronomie-specialisation-agri-industrie', 146, 'Agronomie Spécialisation Agri industrie', 0),
(116, 'agronomie', 173, 'Agronomie', 0),
(117, 'tourisme-durable', 173, 'Tourisme durable', 0),
(118, 'gestion', 173, 'Gestion', 0),
(120, 'etudes-musicales', 183, 'Etudes Musicales', 0),
(121, 'danse', 183, 'Danse', 0),
(122, 'theatre', 183, 'Théatre', 0);

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
(26, 'textile et habillement', '<p>Aenean auctor imperdiet augue, non vestibulum urna sollicitudin in. Phasellus a sapien lorem. Duis condimentum elit eu gravida pellentesque. Maecenas rutrum neque eget tellus consectetur blandit. Cras et mauris nec mauris accumsan vehicula cursus non elit. Vivamus eleifend mauris et sollicitudin varius. Donec eu metus erat. Etiam nec sem rhoncus, elementum enim sed, lacinia risus. Phasellus neque massa, mattis non scelerisque aliquet, rhoncus vel massa. Vestibulum volutpat accumsan facilisis. Maecenas sagittis eu magna eu malesuada. Quisque tincidunt felis a sem mollis, at mattis sapien viverra.</p>', 5, 1),
(27, 'textile et habillement', '<p>Aenean auctor imperdiet augue, non vestibulum urna sollicitudin in. Phasellus a sapien lorem. Duis condimentum elit eu gravida pellentesque. Maecenas rutrum neque eget tellus consectetur blandit. Cras et mauris nec mauris accumsan vehicula cursus non elit. Vivamus eleifend mauris et sollicitudin varius. Donec eu metus erat. Etiam nec sem rhoncus, elementum enim sed, lacinia risus. Phasellus neque massa, mattis non scelerisque aliquet, rhoncus vel massa. Vestibulum volutpat accumsan facilisis. Maecenas sagittis eu magna eu malesuada. Quisque tincidunt felis a sem mollis, at mattis sapien viverra.</p>', 5, 2),
(28, 'textile et habillement', '<p>mg. Description .euismod sit amet ultricies</p>', 5, 3),
(29, 'textile et habillement', '<p>it. Description .euismod sit amet ultricies</p>', 5, 4),
(30, 'textile et habillement', '<p>es. Description .euismod sit amet ultricies</p>', 5, 5),
(31, 'textile et habillement', '<p>de. Description .euismod sit amet ultricies</p>', 5, 6),
(32, 'Production et Santé Animale (PSA)', '<p>Morbi cursus ut orci eget hendrerit. Suspendisse id elit lacus. Donec suscipit placerat est, sed sagittis nisi. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur sit amet elementum magna.</p>\n<p>Aenean auctor imperdiet augue, non vestibulum urna sollicitudin in. Phasellus a sapien lorem. Duis condimentum elit eu gravida pellentesque. Maecenas rutrum neque eget tellus consectetur blandit. Cras et mauris nec mauris accumsan vehicula cursus non elit. Vivamus eleifend mauris et sollicitudin varius. Donec eu metus erat. Etiam nec sem rhoncus, elementum enim sed, lacinia risus. Phasellus neque massa, mattis non scelerisque aliquet, rhoncus vel massa. Vestibulum volutpat accumsan facilisis. Maecenas sagittis eu magna eu malesuada. Quisque tincidunt felis a sem mollis, at mattis sapien viverra. Nulla nibh justo, lacinia non quam a, dignissim sagittis lectus. Phasellus vitae lacus consequat, dictum massa vitae, maximus quam.</p>\n<p>Nam auctor risus et dolor viverra placerat. Aenean non ligula non lorem dapibus finibus. Donec est urna, dapibus sed nisi ac, placerat ullamcorper diam. In tempor, augue ac suscipit rhoncus, lorem ligula euismod mi, a facilisis urna felis ac est. Proin ut vestibulum lacus.</p>', 6, 1),
(33, 'Production et Santé Animale (PSA)', '<p>Morbi cursus ut orci eget hendrerit. Suspendisse id elit lacus. Donec suscipit placerat est, sed sagittis nisi. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur sit amet elementum magna.</p>\n<p>Aenean auctor imperdiet augue, non vestibulum urna sollicitudin in. Phasellus a sapien lorem. Duis condimentum elit eu gravida pellentesque. Maecenas rutrum neque eget tellus consectetur blandit. Cras et mauris nec mauris accumsan vehicula cursus non elit. Vivamus eleifend mauris et sollicitudin varius. Donec eu metus erat. Etiam nec sem rhoncus, elementum enim sed, lacinia risus. Phasellus neque massa, mattis non scelerisque aliquet, rhoncus vel massa. Vestibulum volutpat accumsan facilisis. Maecenas sagittis eu magna eu malesuada. Quisque tincidunt felis a sem mollis, at mattis sapien viverra. Nulla nibh justo, lacinia non quam a, dignissim sagittis lectus. Phasellus vitae lacus consequat, dictum massa vitae, maximus quam.</p>\n<p>Nam auctor risus et dolor viverra placerat. Aenean non ligula non lorem dapibus finibus. Donec est urna, dapibus sed nisi ac, placerat ullamcorper diam. In tempor, augue ac suscipit rhoncus, lorem ligula euismod mi, a facilisis urna felis ac est. Proin ut vestibulum lacus.</p>', 6, 2),
(34, 'Production et Santé Animale (PSA)', '<p>mg. Description .Nunc ultricies ac arcu vitae</p>', 6, 3),
(35, 'Production et Santé Animale (PSA)', '<p>it. Description .Nunc ultricies ac arcu vitae</p>', 6, 4),
(36, 'Production et Santé Animale (PSA)', '<p>es. Description .Nunc ultricies ac arcu vitae</p>', 6, 5),
(37, 'Production et Santé Animale (PSA)', '<p>de. Description .Nunc ultricies ac arcu vitae</p>', 6, 6),
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
(92, 'Informatique et Télécommunications', '<p>fr. Description .vel cursus leo tempus eu</p>', 16, 1),
(93, 'Informatique et Télécommunications', '<p>en. Description .vel cursus leo tempus eu</p>', 16, 2),
(94, 'Informatique et Télécommunications', '<p>mg. Description .vel cursus leo tempus eu</p>', 16, 3),
(95, 'Informatique et Télécommunications', '<p>it. Description .vel cursus leo tempus eu</p>', 16, 4),
(96, 'Informatique et Télécommunications', '<p>es. Description .vel cursus leo tempus eu</p>', 16, 5),
(97, 'Informatique et Télécommunications', '<p>de. Description .vel cursus leo tempus eu</p>', 16, 6),
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
(152, 'Droit', '<p>fr. Description .d sit amet ultricies c</p>', 26, 1),
(153, 'Droit', '<p>en. Description .d sit amet ultricies c</p>', 26, 2),
(154, 'Droit', '<p>mg. Description .d sit amet ultricies c</p>', 26, 3),
(155, 'Droit', '<p>it. Description .d sit amet ultricies c</p>', 26, 4),
(156, 'Droit', '<p>es. Description .d sit amet ultricies c</p>', 26, 5),
(157, 'Droit', '<p>de. Description .d sit amet ultricies c</p>', 26, 6),
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
(181, 'Télécommunications', 'de. Description .Télécommunications', 30, 6),
(182, 'Sciences agricoles', 'fr. Description .Sciences agricoles', 31, 1),
(183, 'Sciences agricoles', 'en. Description .Sciences agricoles', 31, 2),
(184, 'Sciences agricoles', 'mg. Description .Sciences agricoles', 31, 3),
(185, 'Sciences agricoles', 'it. Description .Sciences agricoles', 31, 4),
(186, 'Sciences agricoles', 'es. Description .Sciences agricoles', 31, 5),
(187, 'Sciences agricoles', 'de. Description .Sciences agricoles', 31, 6),
(188, 'Informatique', 'fr. Description .Informatique', 32, 1),
(189, 'Informatique', 'en. Description .Informatique', 32, 2),
(190, 'Informatique', 'mg. Description .Informatique', 32, 3),
(191, 'Informatique', 'it. Description .Informatique', 32, 4),
(192, 'Informatique', 'es. Description .Informatique', 32, 5),
(193, 'Informatique', 'de. Description .Informatique', 32, 6),
(194, 'Sci ences de la Terre', 'fr. Description .Sci ences de la Terre', 33, 1),
(195, 'Sci ences de la Terre', 'en. Description .Sci ences de la Terre', 33, 2),
(196, 'Sci ences de la Terre', 'mg. Description .Sci ences de la Terre', 33, 3),
(197, 'Sci ences de la Terre', 'it. Description .Sci ences de la Terre', 33, 4),
(198, 'Sci ences de la Terre', 'es. Description .Sci ences de la Terre', 33, 5),
(199, 'Sci ences de la Terre', 'de. Description .Sci ences de la Terre', 33, 6),
(200, 'Economie et Commerce', 'fr. Description .Economie et Commerce', 34, 1),
(201, 'Economie et Commerce', 'en. Description .Economie et Commerce', 34, 2),
(202, 'Economie et Commerce', 'mg. Description .Economie et Commerce', 34, 3),
(203, 'Economie et Commerce', 'it. Description .Economie et Commerce', 34, 4),
(204, 'Economie et Commerce', 'es. Description .Economie et Commerce', 34, 5),
(205, 'Economie et Commerce', 'de. Description .Economie et Commerce', 34, 6),
(206, 'Télécommunications', 'fr. Description .Télécommunications', 35, 1),
(207, 'Télécommunications', 'en. Description .Télécommunications', 35, 2),
(208, 'Télécommunications', 'mg. Description .Télécommunications', 35, 3),
(209, 'Télécommunications', 'it. Description .Télécommunications', 35, 4),
(210, 'Télécommunications', 'es. Description .Télécommunications', 35, 5),
(211, 'Télécommunications', 'de. Description .Télécommunications', 35, 6),
(212, 'Sage-femme', 'fr. Description .Sage-femme', 36, 1),
(213, 'Sage-femme', 'en. Description .Sage-femme', 36, 2),
(214, 'Sage-femme', 'mg. Description .Sage-femme', 36, 3),
(215, 'Sage-femme', 'it. Description .Sage-femme', 36, 4),
(216, 'Sage-femme', 'es. Description .Sage-femme', 36, 5),
(217, 'Sage-femme', 'de. Description .Sage-femme', 36, 6),
(218, 'Infirmier', 'fr. Description .Infirmier', 37, 1),
(219, 'Infirmier', 'en. Description .Infirmier', 37, 2),
(220, 'Infirmier', 'mg. Description .Infirmier', 37, 3),
(221, 'Infirmier', 'it. Description .Infirmier', 37, 4),
(222, 'Infirmier', 'es. Description .Infirmier', 37, 5),
(223, 'Infirmier', 'de. Description .Infirmier', 37, 6),
(224, 'Droit', 'fr. Description .Droit', 38, 1),
(225, 'Droit', 'en. Description .Droit', 38, 2),
(226, 'Droit', 'mg. Description .Droit', 38, 3),
(227, 'Droit', 'it. Description .Droit', 38, 4),
(228, 'Droit', 'es. Description .Droit', 38, 5),
(229, 'Droit', 'de. Description .Droit', 38, 6),
(230, 'Interprétariat / Diplomatie / Sciences politiques', 'fr. Description .Interprétariat / Diplomatie / Sciences politiques', 39, 1),
(231, 'Interprétariat / Diplomatie / Sciences politiques', 'en. Description .Interprétariat / Diplomatie / Sciences politiques', 39, 2),
(232, 'Interprétariat / Diplomatie / Sciences politiques', 'mg. Description .Interprétariat / Diplomatie / Sciences politiques', 39, 3),
(233, 'Interprétariat / Diplomatie / Sciences politiques', 'it. Description .Interprétariat / Diplomatie / Sciences politiques', 39, 4),
(234, 'Interprétariat / Diplomatie / Sciences politiques', 'es. Description .Interprétariat / Diplomatie / Sciences politiques', 39, 5),
(235, 'Interprétariat / Diplomatie / Sciences politiques', 'de. Description .Interprétariat / Diplomatie / Sciences politiques', 39, 6),
(236, 'Administration / Management', 'fr. Description .Administration / Management', 40, 1),
(237, 'Administration / Management', 'en. Description .Administration / Management', 40, 2),
(238, 'Administration / Management', 'mg. Description .Administration / Management', 40, 3),
(239, 'Administration / Management', 'it. Description .Administration / Management', 40, 4),
(240, 'Administration / Management', 'es. Description .Administration / Management', 40, 5),
(241, 'Administration / Management', 'de. Description .Administration / Management', 40, 6),
(242, 'Commerce / Marketing', 'fr. Description .Commerce / Marketing', 41, 1),
(243, 'Commerce / Marketing', 'en. Description .Commerce / Marketing', 41, 2),
(244, 'Commerce / Marketing', 'mg. Description .Commerce / Marketing', 41, 3),
(245, 'Commerce / Marketing', 'it. Description .Commerce / Marketing', 41, 4),
(246, 'Commerce / Marketing', 'es. Description .Commerce / Marketing', 41, 5),
(247, 'Commerce / Marketing', 'de. Description .Commerce / Marketing', 41, 6),
(248, 'Tourisme / Hôtellerie / Environnement', 'fr. Description .Tourisme / Hôtellerie / Environnement', 42, 1),
(249, 'Tourisme / Hôtellerie / Environnement', 'en. Description .Tourisme / Hôtellerie / Environnement', 42, 2),
(250, 'Tourisme / Hôtellerie / Environnement', 'mg. Description .Tourisme / Hôtellerie / Environnement', 42, 3),
(251, 'Tourisme / Hôtellerie / Environnement', 'it. Description .Tourisme / Hôtellerie / Environnement', 42, 4),
(252, 'Tourisme / Hôtellerie / Environnement', 'es. Description .Tourisme / Hôtellerie / Environnement', 42, 5),
(253, 'Tourisme / Hôtellerie / Environnement', 'de. Description .Tourisme / Hôtellerie / Environnement', 42, 6),
(254, 'Informatique', 'fr. Description .Informatique', 43, 1),
(255, 'Informatique', 'en. Description .Informatique', 43, 2),
(256, 'Informatique', 'mg. Description .Informatique', 43, 3),
(257, 'Informatique', 'it. Description .Informatique', 43, 4),
(258, 'Informatique', 'es. Description .Informatique', 43, 5),
(259, 'Informatique', 'de. Description .Informatique', 43, 6),
(260, 'Droit et Technique des Affaires', 'fr. Description .Droit et Technique des Affaires', 44, 1),
(261, 'Droit et Technique des Affaires', 'en. Description .Droit et Technique des Affaires', 44, 2),
(262, 'Droit et Technique des Affaires', 'mg. Description .Droit et Technique des Affaires', 44, 3),
(263, 'Droit et Technique des Affaires', 'it. Description .Droit et Technique des Affaires', 44, 4),
(264, 'Droit et Technique des Affaires', 'es. Description .Droit et Technique des Affaires', 44, 5),
(265, 'Droit et Technique des Affaires', 'de. Description .Droit et Technique des Affaires', 44, 6),
(266, 'Gestion et administration d’entreprise', 'fr. Description .Gestion et administration d’entreprise', 45, 1),
(267, 'Gestion et administration d’entreprise', 'en. Description .Gestion et administration d’entreprise', 45, 2),
(268, 'Gestion et administration d’entreprise', 'mg. Description .Gestion et administration d’entreprise', 45, 3),
(269, 'Gestion et administration d’entreprise', 'it. Description .Gestion et administration d’entreprise', 45, 4),
(270, 'Gestion et administration d’entreprise', 'es. Description .Gestion et administration d’entreprise', 45, 5),
(271, 'Gestion et administration d’entreprise', 'de. Description .Gestion et administration d’entreprise', 45, 6),
(272, 'Banque et Institution des Micro Finances', 'fr. Description .Banque et Institution des Micro Finances', 46, 1),
(273, 'Banque et Institution des Micro Finances', 'en. Description .Banque et Institution des Micro Finances', 46, 2),
(274, 'Banque et Institution des Micro Finances', 'mg. Description .Banque et Institution des Micro Finances', 46, 3),
(275, 'Banque et Institution des Micro Finances', 'it. Description .Banque et Institution des Micro Finances', 46, 4),
(276, 'Banque et Institution des Micro Finances', 'es. Description .Banque et Institution des Micro Finances', 46, 5),
(277, 'Banque et Institution des Micro Finances', 'de. Description .Banque et Institution des Micro Finances', 46, 6),
(278, 'Formation Pédagogique et Administration Scolaire', 'fr. Description .Formation Pédagogique et Administration Scolaire', 47, 1),
(279, 'Formation Pédagogique et Administration Scolaire', 'en. Description .Formation Pédagogique et Administration Scolaire', 47, 2),
(280, 'Formation Pédagogique et Administration Scolaire', 'mg. Description .Formation Pédagogique et Administration Scolaire', 47, 3),
(281, 'Formation Pédagogique et Administration Scolaire', 'it. Description .Formation Pédagogique et Administration Scolaire', 47, 4),
(282, 'Formation Pédagogique et Administration Scolaire', 'es. Description .Formation Pédagogique et Administration Scolaire', 47, 5),
(283, 'Formation Pédagogique et Administration Scolaire', 'de. Description .Formation Pédagogique et Administration Scolaire', 47, 6),
(284, 'Sage - femme', 'fr. Description .Sage - femme', 48, 1),
(285, 'Sage - femme', 'en. Description .Sage - femme', 48, 2),
(286, 'Sage - femme', 'mg. Description .Sage - femme', 48, 3),
(287, 'Sage - femme', 'it. Description .Sage - femme', 48, 4),
(288, 'Sage - femme', 'es. Description .Sage - femme', 48, 5),
(289, 'Sage - femme', 'de. Description .Sage - femme', 48, 6),
(290, 'Infirmier généraliste', 'fr. Description .Infirmier généraliste', 49, 1),
(291, 'Infirmier généraliste', 'en. Description .Infirmier généraliste', 49, 2),
(292, 'Infirmier généraliste', 'mg. Description .Infirmier généraliste', 49, 3),
(293, 'Infirmier généraliste', 'it. Description .Infirmier généraliste', 49, 4),
(294, 'Infirmier généraliste', 'es. Description .Infirmier généraliste', 49, 5),
(295, 'Infirmier généraliste', 'de. Description .Infirmier généraliste', 49, 6),
(296, 'Bio technicien', 'fr. Description .Bio technicien', 50, 1),
(297, 'Bio technicien', 'en. Description .Bio technicien', 50, 2),
(298, 'Bio technicien', 'mg. Description .Bio technicien', 50, 3),
(299, 'Bio technicien', 'it. Description .Bio technicien', 50, 4),
(300, 'Bio technicien', 'es. Description .Bio technicien', 50, 5),
(301, 'Bio technicien', 'de. Description .Bio technicien', 50, 6),
(302, 'In', 'fr. Description .In', 51, 1),
(303, 'Informatique', '<p>en. Description .In</p>', 51, 2),
(304, 'In', 'mg. Description .In', 51, 3),
(305, 'In', 'it. Description .In', 51, 4),
(306, 'In', 'es. Description .In', 51, 5),
(307, 'In', 'de. Description .In', 51, 6),
(308, 'Gestion', 'fr. Description .Gestion', 52, 1),
(309, 'Gestion', 'en. Description .Gestion', 52, 2),
(310, 'Gestion', 'mg. Description .Gestion', 52, 3),
(311, 'Gestion', 'it. Description .Gestion', 52, 4),
(312, 'Gestion', 'es. Description .Gestion', 52, 5),
(313, 'Gestion', 'de. Description .Gestion', 52, 6),
(314, 'Infirmier généraliste', 'fr. Description .Infirmier généraliste', 53, 1),
(315, 'Infirmier généraliste', 'en. Description .Infirmier généraliste', 53, 2),
(316, 'Infirmier généraliste', 'mg. Description .Infirmier généraliste', 53, 3),
(317, 'Infirmier généraliste', 'it. Description .Infirmier généraliste', 53, 4),
(318, 'Infirmier généraliste', 'es. Description .Infirmier généraliste', 53, 5),
(319, 'Infirmier généraliste', 'de. Description .Infirmier généraliste', 53, 6),
(320, 'Sages - femmes', 'fr. Description .Sages - femmes', 54, 1),
(321, 'Sages - femmes', 'en. Description .Sages - femmes', 54, 2),
(322, 'Sages - femmes', 'mg. Description .Sages - femmes', 54, 3),
(323, 'Sages - femmes', 'it. Description .Sages - femmes', 54, 4),
(324, 'Sages - femmes', 'es. Description .Sages - femmes', 54, 5),
(325, 'Sages - femmes', 'de. Description .Sages - femmes', 54, 6),
(326, 'Aide soignante', 'fr. Description .Aide soignante', 55, 1),
(327, 'Aide soignante', 'en. Description .Aide soignante', 55, 2),
(328, 'Aide soignante', 'mg. Description .Aide soignante', 55, 3),
(329, 'Aide soignante', 'it. Description .Aide soignante', 55, 4),
(330, 'Aide soignante', 'es. Description .Aide soignante', 55, 5),
(331, 'Aide soignante', 'de. Description .Aide soignante', 55, 6),
(332, 'Secrétaire médical', 'fr. Description .Secrétaire médical', 56, 1),
(333, 'Secrétaire médical', 'en. Description .Secrétaire médical', 56, 2),
(334, 'Secrétaire médical', 'mg. Description .Secrétaire médical', 56, 3),
(335, 'Secrétaire médical', 'it. Description .Secrétaire médical', 56, 4),
(336, 'Secrétaire médical', 'es. Description .Secrétaire médical', 56, 5),
(337, 'Secrétaire médical', 'de. Description .Secrétaire médical', 56, 6),
(338, 'Sage-femme', 'fr. Description .Sage-femme', 57, 1),
(339, 'Sage-femme', 'en. Description .Sage-femme', 57, 2),
(340, 'Sage-femme', 'mg. Description .Sage-femme', 57, 3),
(341, 'Sage-femme', 'it. Description .Sage-femme', 57, 4),
(342, 'Sage-femme', 'es. Description .Sage-femme', 57, 5),
(343, 'Sage-femme', 'de. Description .Sage-femme', 57, 6),
(344, 'Infirmier', 'fr. Description .Infirmier', 58, 1),
(345, 'Infirmier', 'en. Description .Infirmier', 58, 2),
(346, 'Infirmier', 'mg. Description .Infirmier', 58, 3),
(347, 'Infirmier', 'it. Description .Infirmier', 58, 4),
(348, 'Infirmier', 'es. Description .Infirmier', 58, 5),
(349, 'Infirmier', 'de. Description .Infirmier', 58, 6),
(350, 'Sage-femme', 'fr. Description .Sage-femme', 59, 1),
(351, 'Sage-femme', 'en. Description .Sage-femme', 59, 2),
(352, 'Sage-femme', 'mg. Description .Sage-femme', 59, 3),
(353, 'Sage-femme', 'it. Description .Sage-femme', 59, 4),
(354, 'Sage-femme', 'es. Description .Sage-femme', 59, 5),
(355, 'Sage-femme', 'de. Description .Sage-femme', 59, 6),
(356, 'Infirmier', 'fr. Description .Infirmier', 60, 1),
(357, 'Infirmier', 'en. Description .Infirmier', 60, 2),
(358, 'Infirmier', 'mg. Description .Infirmier', 60, 3),
(359, 'Infirmier', 'it. Description .Infirmier', 60, 4),
(360, 'Infirmier', 'es. Description .Infirmier', 60, 5),
(361, 'Infirmier', 'de. Description .Infirmier', 60, 6),
(362, 'Technicien de laboratoire', 'fr. Description .Technicien de laboratoire', 61, 1),
(363, 'Technicien de laboratoire', 'en. Description .Technicien de laboratoire', 61, 2),
(364, 'Technicien de laboratoire', 'mg. Description .Technicien de laboratoire', 61, 3),
(365, 'Technicien de laboratoire', 'it. Description .Technicien de laboratoire', 61, 4),
(366, 'Technicien de laboratoire', 'es. Description .Technicien de laboratoire', 61, 5),
(367, 'Technicien de laboratoire', 'de. Description .Technicien de laboratoire', 61, 6),
(374, 'Infirmier', 'fr. Description .Infirmier', 63, 1),
(375, 'Infirmier', 'en. Description .Infirmier', 63, 2),
(376, 'Infirmier', 'mg. Description .Infirmier', 63, 3),
(377, 'Infirmier', 'it. Description .Infirmier', 63, 4),
(378, 'Infirmier', 'es. Description .Infirmier', 63, 5),
(379, 'Infirmier', 'de. Description .Infirmier', 63, 6),
(380, 'Sage-femme', 'fr. Description .Sage-femme', 64, 1),
(381, 'Sage-femme', 'en. Description .Sage-femme', 64, 2),
(382, 'Sage-femme', 'mg. Description .Sage-femme', 64, 3),
(383, 'Sage-femme', 'it. Description .Sage-femme', 64, 4),
(384, 'Sage-femme', 'es. Description .Sage-femme', 64, 5),
(385, 'Sage-femme', 'de. Description .Sage-femme', 64, 6),
(386, 'Masso-Kinesithérapie', 'fr. Description .Masso-Kinesithérapie', 65, 1),
(387, 'Masso-Kinesithérapie', 'en. Description .Masso-Kinesithérapie', 65, 2),
(388, 'Masso-Kinesithérapie', 'mg. Description .Masso-Kinesithérapie', 65, 3),
(389, 'Masso-Kinesithérapie', 'it. Description .Masso-Kinesithérapie', 65, 4),
(390, 'Masso-Kinesithérapie', 'es. Description .Masso-Kinesithérapie', 65, 5),
(391, 'Masso-Kinesithérapie', 'de. Description .Masso-Kinesithérapie', 65, 6),
(392, 'Technicien de laboratoire', 'fr. Description .Technicien de laboratoire', 66, 1),
(393, 'Technicien de laboratoire', 'en. Description .Technicien de laboratoire', 66, 2),
(394, 'Technicien de laboratoire', 'mg. Description .Technicien de laboratoire', 66, 3),
(395, 'Technicien de laboratoire', 'it. Description .Technicien de laboratoire', 66, 4),
(396, 'Technicien de laboratoire', 'es. Description .Technicien de laboratoire', 66, 5),
(397, 'Technicien de laboratoire', 'de. Description .Technicien de laboratoire', 66, 6),
(398, 'Infirmier généraliste', 'fr. Description .Infirmier généraliste', 67, 1),
(399, 'Infirmier généraliste', 'en. Description .Infirmier généraliste', 67, 2),
(400, 'Infirmier généraliste', 'mg. Description .Infirmier généraliste', 67, 3),
(401, 'Infirmier généraliste', 'it. Description .Infirmier généraliste', 67, 4),
(402, 'Infirmier généraliste', 'es. Description .Infirmier généraliste', 67, 5),
(403, 'Infirmier généraliste', 'de. Description .Infirmier généraliste', 67, 6),
(404, 'Sage - femme', 'fr. Description .Sage - femme', 68, 1),
(405, 'Sage - femme', 'en. Description .Sage - femme', 68, 2),
(406, 'Sage - femme', 'mg. Description .Sage - femme', 68, 3),
(407, 'Sage - femme', 'it. Description .Sage - femme', 68, 4),
(408, 'Sage - femme', 'es. Description .Sage - femme', 68, 5),
(409, 'Sage - femme', 'de. Description .Sage - femme', 68, 6),
(410, 'T echnologie médicale', 'fr. Description .T echnologie médicale', 69, 1),
(411, 'T echnologie médicale', 'en. Description .T echnologie médicale', 69, 2),
(412, 'T echnologie médicale', 'mg. Description .T echnologie médicale', 69, 3),
(413, 'T echnologie médicale', 'it. Description .T echnologie médicale', 69, 4),
(414, 'T echnologie médicale', 'es. Description .T echnologie médicale', 69, 5),
(415, 'T echnologie médicale', 'de. Description .T echnologie médicale', 69, 6),
(416, 'Génie civil et Architecture', 'fr. Description .Génie civil et Architecture', 70, 1),
(417, 'Génie civil et Architecture', 'en. Description .Génie civil et Architecture', 70, 2),
(418, 'Génie civil et Architecture', 'mg. Description .Génie civil et Architecture', 70, 3),
(419, 'Génie civil et Architecture', 'it. Description .Génie civil et Architecture', 70, 4),
(420, 'Génie civil et Architecture', 'es. Description .Génie civil et Architecture', 70, 5),
(421, 'Génie civil et Architecture', 'de. Description .Génie civil et Architecture', 70, 6),
(422, 'Génie industriel', 'fr. Description .Génie industriel', 71, 1),
(423, 'Génie industriel', 'en. Description .Génie industriel', 71, 2),
(424, 'Génie industriel', 'mg. Description .Génie industriel', 71, 3),
(425, 'Génie industriel', 'it. Description .Génie industriel', 71, 4),
(426, 'Génie industriel', 'es. Description .Génie industriel', 71, 5),
(427, 'Génie industriel', 'de. Description .Génie industriel', 71, 6),
(428, 'Biotechnologies', 'fr. Description .Biotechnologies', 72, 1),
(429, 'Biotechnologies', 'en. Description .Biotechnologies', 72, 2),
(430, 'Biotechnologies', 'mg. Description .Biotechnologies', 72, 3),
(431, 'Biotechnologies', 'it. Description .Biotechnologies', 72, 4),
(432, 'Biotechnologies', 'es. Description .Biotechnologies', 72, 5),
(433, 'Biotechnologies', 'de. Description .Biotechnologies', 72, 6),
(434, 'Techniques des Affaires et Administration et Techniques   juridiques', 'fr. Description .Techniques des Affaires et Administration et Techniques   juridiques', 73, 1),
(435, 'Techniques des Affaires et Administration et Techniques   juridiques', 'en. Description .Techniques des Affaires et Administration et Techniques   juridiques', 73, 2),
(436, 'Techniques des Affaires et Administration et Techniques   juridiques', 'mg. Description .Techniques des Affaires et Administration et Techniques   juridiques', 73, 3),
(437, 'Techniques des Affaires et Administration et Techniques   juridiques', 'it. Description .Techniques des Affaires et Administration et Techniques   juridiques', 73, 4),
(438, 'Techniques des Affaires et Administration et Techniques   juridiques', 'es. Description .Techniques des Affaires et Administration et Techniques   juridiques', 73, 5),
(439, 'Techniques des Affaires et Administration et Techniques   juridiques', 'de. Description .Techniques des Affaires et Administration et Techniques   juridiques', 73, 6),
(440, 'Techniques du Tourisme et de l’Environnement', 'fr. Description .Techniques du Tourisme et de l’Environnement', 74, 1),
(441, 'Techniques du Tourisme et de l’Environnement', 'en. Description .Techniques du Tourisme et de l’Environnement', 74, 2),
(442, 'Techniques du Tourisme et de l’Environnement', 'mg. Description .Techniques du Tourisme et de l’Environnement', 74, 3),
(443, 'Techniques du Tourisme et de l’Environnement', 'it. Description .Techniques du Tourisme et de l’Environnement', 74, 4),
(444, 'Techniques du Tourisme et de l’Environnement', 'es. Description .Techniques du Tourisme et de l’Environnement', 74, 5),
(445, 'Techniques du Tourisme et de l’Environnement', 'de. Description .Techniques du Tourisme et de l’Environnement', 74, 6),
(446, 'Bio Informatique et Biotechnologie', 'fr. Description .Bio Informatique et Biotechnologie', 75, 1),
(447, 'Bio Informatique et Biotechnologie', 'en. Description .Bio Informatique et Biotechnologie', 75, 2),
(448, 'Bio Informatique et Biotechnologie', 'mg. Description .Bio Informatique et Biotechnologie', 75, 3),
(449, 'Bio Informatique et Biotechnologie', 'it. Description .Bio Informatique et Biotechnologie', 75, 4),
(450, 'Bio Informatique et Biotechnologie', 'es. Description .Bio Informatique et Biotechnologie', 75, 5),
(451, 'Bio Informatique et Biotechnologie', 'de. Description .Bio Informatique et Biotechnologie', 75, 6),
(452, 'Gestion budgétaire et Contrôle de gestion budgétaire', 'fr. Description .Gestion budgétaire et Contrôle de gestion budgétaire', 76, 1),
(453, 'Gestion budgétaire et Contrôle de gestion budgétaire', 'en. Description .Gestion budgétaire et Contrôle de gestion budgétaire', 76, 2),
(454, 'Gestion budgétaire et Contrôle de gestion budgétaire', 'mg. Description .Gestion budgétaire et Contrôle de gestion budgétaire', 76, 3),
(455, 'Gestion budgétaire et Contrôle de gestion budgétaire', 'it. Description .Gestion budgétaire et Contrôle de gestion budgétaire', 76, 4),
(456, 'Gestion budgétaire et Contrôle de gestion budgétaire', 'es. Description .Gestion budgétaire et Contrôle de gestion budgétaire', 76, 5),
(457, 'Gestion budgétaire et Contrôle de gestion budgétaire', 'de. Description .Gestion budgétaire et Contrôle de gestion budgétaire', 76, 6),
(458, 'Conception budgétaire et Contrôle de gestion', 'fr. Description .Conception budgétaire et Contrôle de gestion', 77, 1),
(459, 'Conception budgétaire et Contrôle de gestion', 'en. Description .Conception budgétaire et Contrôle de gestion', 77, 2),
(460, 'Conception budgétaire et Contrôle de gestion', 'mg. Description .Conception budgétaire et Contrôle de gestion', 77, 3),
(461, 'Conception budgétaire et Contrôle de gestion', 'it. Description .Conception budgétaire et Contrôle de gestion', 77, 4),
(462, 'Conception budgétaire et Contrôle de gestion', 'es. Description .Conception budgétaire et Contrôle de gestion', 77, 5),
(463, 'Conception budgétaire et Contrôle de gestion', 'de. Description .Conception budgétaire et Contrôle de gestion', 77, 6),
(464, 'Droit', 'fr. Description .Droit', 78, 1),
(465, 'Droit', 'en. Description .Droit', 78, 2),
(466, 'Droit', 'mg. Description .Droit', 78, 3),
(467, 'Droit', 'it. Description .Droit', 78, 4),
(468, 'Droit', 'es. Description .Droit', 78, 5),
(469, 'Droit', 'de. Description .Droit', 78, 6),
(470, 'Gestion', 'fr. Description .Gestion', 79, 1),
(471, 'Gestion', 'en. Description .Gestion', 79, 2),
(472, 'Gestion', 'mg. Description .Gestion', 79, 3),
(473, 'Gestion', 'it. Description .Gestion', 79, 4),
(474, 'Gestion', 'es. Description .Gestion', 79, 5),
(475, 'Gestion', 'de. Description .Gestion', 79, 6),
(476, 'Sciences Agronomiques et Halieutiques', 'fr. Description .Sciences Agronomiques et Halieutiques', 80, 1),
(477, 'Sciences Agronomiques et Halieutiques', 'en. Description .Sciences Agronomiques et Halieutiques', 80, 2),
(478, 'Sciences Agronomiques et Halieutiques', 'mg. Description .Sciences Agronomiques et Halieutiques', 80, 3),
(479, 'Sciences Agronomiques et Halieutiques', 'it. Description .Sciences Agronomiques et Halieutiques', 80, 4),
(480, 'Sciences Agronomiques et Halieutiques', 'es. Description .Sciences Agronomiques et Halieutiques', 80, 5),
(481, 'Sciences Agronomiques et Halieutiques', 'de. Description .Sciences Agronomiques et Halieutiques', 80, 6),
(482, 'Géologie & mines', 'fr. Description .Géologie & mines', 81, 1),
(483, 'Géologie & mines', 'en. Description .Géologie & mines', 81, 2),
(484, 'Géologie & mines', 'mg. Description .Géologie & mines', 81, 3),
(485, 'Géologie & mines', 'it. Description .Géologie & mines', 81, 4),
(486, 'Géologie & mines', 'es. Description .Géologie & mines', 81, 5),
(487, 'Géologie & mines', 'de. Description .Géologie & mines', 81, 6),
(488, 'Electroniques', 'fr. Description .Electroniques', 82, 1),
(489, 'Electroniques', 'en. Description .Electroniques', 82, 2),
(490, 'Electroniques', 'mg. Description .Electroniques', 82, 3),
(491, 'Electroniques', 'it. Description .Electroniques', 82, 4),
(492, 'Electroniques', 'es. Description .Electroniques', 82, 5),
(493, 'Electroniques', 'de. Description .Electroniques', 82, 6),
(494, 'Météorologie', 'fr. Description .Météorologie', 83, 1),
(495, 'Météorologie', 'en. Description .Météorologie', 83, 2),
(496, 'Météorologie', 'mg. Description .Météorologie', 83, 3),
(497, 'Météorologie', 'it. Description .Météorologie', 83, 4),
(498, 'Météorologie', 'es. Description .Météorologie', 83, 5),
(499, 'Météorologie', 'de. Description .Météorologie', 83, 6),
(500, 'Génie industriel', 'fr. Description .Génie industriel', 84, 1),
(501, 'Génie industriel', 'en. Description .Génie industriel', 84, 2),
(502, 'Génie industriel', 'mg. Description .Génie industriel', 84, 3),
(503, 'Génie industriel', 'it. Description .Génie industriel', 84, 4),
(504, 'Génie industriel', 'es. Description .Génie industriel', 84, 5),
(505, 'Génie industriel', 'de. Description .Génie industriel', 84, 6),
(506, 'hotel and tourism management', 'fr. Description .hotel and tourism management', 85, 1),
(507, 'hotel and tourism management', 'en. Description .hotel and tourism management', 85, 2),
(508, 'hotel and tourism management', 'mg. Description .hotel and tourism management', 85, 3),
(509, 'hotel and tourism management', 'it. Description .hotel and tourism management', 85, 4),
(510, 'hotel and tourism management', 'es. Description .hotel and tourism management', 85, 5),
(511, 'hotel and tourism management', 'de. Description .hotel and tourism management', 85, 6),
(512, 'Management and business studies', 'fr. Description .Management and business studies', 86, 1),
(513, 'Management and business studies', 'en. Description .Management and business studies', 86, 2),
(514, 'Management and business studies', 'mg. Description .Management and business studies', 86, 3),
(515, 'Management and business studies', 'it. Description .Management and business studies', 86, 4),
(516, 'Management and business studies', 'es. Description .Management and business studies', 86, 5),
(517, 'Management and business studies', 'de. Description .Management and business studies', 86, 6),
(518, 'Batiment et Travaux Publics', 'fr. Description .Batiment et Travaux Publics', 87, 1),
(519, 'Batiment et Travaux Publics', 'en. Description .Batiment et Travaux Publics', 87, 2),
(520, 'Batiment et Travaux Publics', 'mg. Description .Batiment et Travaux Publics', 87, 3),
(521, 'Batiment et Travaux Publics', 'it. Description .Batiment et Travaux Publics', 87, 4),
(522, 'Batiment et Travaux Publics', 'es. Description .Batiment et Travaux Publics', 87, 5),
(523, 'Batiment et Travaux Publics', 'de. Description .Batiment et Travaux Publics', 87, 6),
(524, 'Travail social', 'fr. Description .Travail social', 88, 1),
(525, 'Travail social', 'en. Description .Travail social', 88, 2),
(526, 'Travail social', 'mg. Description .Travail social', 88, 3),
(527, 'Travail social', 'it. Description .Travail social', 88, 4),
(528, 'Travail social', 'es. Description .Travail social', 88, 5),
(529, 'Travail social', 'de. Description .Travail social', 88, 6),
(530, 'Génie civil', 'fr. Description .Génie civil', 89, 1),
(531, 'Génie civil', 'en. Description .Génie civil', 89, 2),
(532, 'Génie civil', 'mg. Description .Génie civil', 89, 3),
(533, 'Génie civil', 'it. Description .Génie civil', 89, 4),
(534, 'Génie civil', 'es. Description .Génie civil', 89, 5),
(535, 'Génie civil', 'de. Description .Génie civil', 89, 6),
(536, 'Management en Hôtellerie Internationale', 'fr. Description .Management en Hôtellerie Internationale', 90, 1),
(537, 'Management en Hôtellerie Internationale', 'en. Description .Management en Hôtellerie Internationale', 90, 2),
(538, 'Management en Hôtellerie Internationale', 'mg. Description .Management en Hôtellerie Internationale', 90, 3),
(539, 'Management en Hôtellerie Internationale', 'it. Description .Management en Hôtellerie Internationale', 90, 4),
(540, 'Management en Hôtellerie Internationale', 'es. Description .Management en Hôtellerie Internationale', 90, 5),
(541, 'Management en Hôtellerie Internationale', 'de. Description .Management en Hôtellerie Internationale', 90, 6),
(542, 'Sage-femme', 'fr. Description .Sage-femme', 91, 1),
(543, 'Sage-femme', 'en. Description .Sage-femme', 91, 2),
(544, 'Sage-femme', 'mg. Description .Sage-femme', 91, 3),
(545, 'Sage-femme', 'it. Description .Sage-femme', 91, 4),
(546, 'Sage-femme', 'es. Description .Sage-femme', 91, 5),
(547, 'Sage-femme', 'de. Description .Sage-femme', 91, 6),
(548, 'Infirmier', 'fr. Description .Infirmier', 92, 1),
(549, 'Infirmier', 'en. Description .Infirmier', 92, 2),
(550, 'Infirmier', 'mg. Description .Infirmier', 92, 3),
(551, 'Infirmier', 'it. Description .Infirmier', 92, 4),
(552, 'Infirmier', 'es. Description .Infirmier', 92, 5),
(553, 'Infirmier', 'de. Description .Infirmier', 92, 6),
(554, 'Gestion', 'fr. Description .Gestion', 93, 1),
(555, 'Gestion', 'en. Description .Gestion', 93, 2),
(556, 'Gestion', 'mg. Description .Gestion', 93, 3),
(557, 'Gestion', 'it. Description .Gestion', 93, 4),
(558, 'Gestion', 'es. Description .Gestion', 93, 5),
(559, 'Gestion', 'de. Description .Gestion', 93, 6),
(560, 'Commerce', 'fr. Description .Commerce', 94, 1);
INSERT INTO `sl_field_translate` (`id`, `name`, `description`, `field_id`, `locale_id`) VALUES
(561, 'Commerce', 'en. Description .Commerce', 94, 2),
(562, 'Commerce', 'mg. Description .Commerce', 94, 3),
(563, 'Commerce', 'it. Description .Commerce', 94, 4),
(564, 'Commerce', 'es. Description .Commerce', 94, 5),
(565, 'Commerce', 'de. Description .Commerce', 94, 6),
(566, 'Maths - Finances', 'fr. Description .Maths - Finances', 95, 1),
(567, 'Maths - Finances', 'en. Description .Maths - Finances', 95, 2),
(568, 'Maths - Finances', 'mg. Description .Maths - Finances', 95, 3),
(569, 'Maths - Finances', 'it. Description .Maths - Finances', 95, 4),
(570, 'Maths - Finances', 'es. Description .Maths - Finances', 95, 5),
(571, 'Maths - Finances', 'de. Description .Maths - Finances', 95, 6),
(572, 'Gestion et administration d’entreprise', 'fr. Description .Gestion et administration d’entreprise', 96, 1),
(573, 'Gestion et administration d’entreprise', 'en. Description .Gestion et administration d’entreprise', 96, 2),
(574, 'Gestion et administration d’entreprise', 'mg. Description .Gestion et administration d’entreprise', 96, 3),
(575, 'Gestion et administration d’entreprise', 'it. Description .Gestion et administration d’entreprise', 96, 4),
(576, 'Gestion et administration d’entreprise', 'es. Description .Gestion et administration d’entreprise', 96, 5),
(577, 'Gestion et administration d’entreprise', 'de. Description .Gestion et administration d’entreprise', 96, 6),
(578, 'Sciences Marines et de l’Environnement', 'fr. Description .Sciences Marines et de l’Environnement', 97, 1),
(579, 'Sciences Marines et de l’Environnement', 'en. Description .Sciences Marines et de l’Environnement', 97, 2),
(580, 'Sciences Marines et de l’Environnement', 'mg. Description .Sciences Marines et de l’Environnement', 97, 3),
(581, 'Sciences Marines et de l’Environnement', 'it. Description .Sciences Marines et de l’Environnement', 97, 4),
(582, 'Sciences Marines et de l’Environnement', 'es. Description .Sciences Marines et de l’Environnement', 97, 5),
(583, 'Sciences Marines et de l’Environnement', 'de. Description .Sciences Marines et de l’Environnement', 97, 6),
(584, 'Informatique', 'fr. Description .Informatique', 98, 1),
(585, 'Informatique', 'en. Description .Informatique', 98, 2),
(586, 'Informatique', 'mg. Description .Informatique', 98, 3),
(587, 'Informatique', 'it. Description .Informatique', 98, 4),
(588, 'Informatique', 'es. Description .Informatique', 98, 5),
(589, 'Informatique', 'de. Description .Informatique', 98, 6),
(590, 'Sciences de la Gestion', 'fr. Description .Sciences de la Gestion', 99, 1),
(591, 'Sciences de la Gestion', 'en. Description .Sciences de la Gestion', 99, 2),
(592, 'Sciences de la Gestion', 'mg. Description .Sciences de la Gestion', 99, 3),
(593, 'Sciences de la Gestion', 'it. Description .Sciences de la Gestion', 99, 4),
(594, 'Sciences de la Gestion', 'es. Description .Sciences de la Gestion', 99, 5),
(595, 'Sciences de la Gestion', 'de. Description .Sciences de la Gestion', 99, 6),
(596, 'Hautes Etudes Politiques', 'fr. Description .Hautes Etudes Politiques', 100, 1),
(597, 'Hautes Etudes Politiques', 'en. Description .Hautes Etudes Politiques', 100, 2),
(598, 'Hautes Etudes Politiques', 'mg. Description .Hautes Etudes Politiques', 100, 3),
(599, 'Hautes Etudes Politiques', 'it. Description .Hautes Etudes Politiques', 100, 4),
(600, 'Hautes Etudes Politiques', 'es. Description .Hautes Etudes Politiques', 100, 5),
(601, 'Hautes Etudes Politiques', 'de. Description .Hautes Etudes Politiques', 100, 6),
(602, 'Communication', 'fr. Description .Communication', 101, 1),
(603, 'Communication', 'en. Description .Communication', 101, 2),
(604, 'Communication', 'mg. Description .Communication', 101, 3),
(605, 'Communication', 'it. Description .Communication', 101, 4),
(606, 'Communication', 'es. Description .Communication', 101, 5),
(607, 'Communication', 'de. Description .Communication', 101, 6),
(608, 'Management et Gestion', 'fr. Description .Management et Gestion', 102, 1),
(609, 'Management et Gestion', 'en. Description .Management et Gestion', 102, 2),
(610, 'Management et Gestion', 'mg. Description .Management et Gestion', 102, 3),
(611, 'Management et Gestion', 'it. Description .Management et Gestion', 102, 4),
(612, 'Management et Gestion', 'es. Description .Management et Gestion', 102, 5),
(613, 'Management et Gestion', 'de. Description .Management et Gestion', 102, 6),
(614, 'Management et Entreprenariat', 'fr. Description .Management et Entreprenariat', 103, 1),
(615, 'Management et Entreprenariat', 'en. Description .Management et Entreprenariat', 103, 2),
(616, 'Management et Entreprenariat', 'mg. Description .Management et Entreprenariat', 103, 3),
(617, 'Management et Entreprenariat', 'it. Description .Management et Entreprenariat', 103, 4),
(618, 'Management et Entreprenariat', 'es. Description .Management et Entreprenariat', 103, 5),
(619, 'Management et Entreprenariat', 'de. Description .Management et Entreprenariat', 103, 6),
(620, 'Sciences de la Gestion', 'fr. Description .Sciences de la Gestion', 104, 1),
(621, 'Sciences de la Gestion', 'en. Description .Sciences de la Gestion', 104, 2),
(622, 'Sciences de la Gestion', 'mg. Description .Sciences de la Gestion', 104, 3),
(623, 'Sciences de la Gestion', 'it. Description .Sciences de la Gestion', 104, 4),
(624, 'Sciences de la Gestion', 'es. Description .Sciences de la Gestion', 104, 5),
(625, 'Sciences de la Gestion', 'de. Description .Sciences de la Gestion', 104, 6),
(626, 'Gestion', 'fr. Description .Gestion', 105, 1),
(627, 'Gestion', 'en. Description .Gestion', 105, 2),
(628, 'Gestion', 'mg. Description .Gestion', 105, 3),
(629, 'Gestion', 'it. Description .Gestion', 105, 4),
(630, 'Gestion', 'es. Description .Gestion', 105, 5),
(631, 'Gestion', 'de. Description .Gestion', 105, 6),
(632, 'Environnement', 'fr. Description .Environnement', 106, 1),
(633, 'Environnement', 'en. Description .Environnement', 106, 2),
(634, 'Environnement', 'mg. Description .Environnement', 106, 3),
(635, 'Environnement', 'it. Description .Environnement', 106, 4),
(636, 'Environnement', 'es. Description .Environnement', 106, 5),
(637, 'Environnement', 'de. Description .Environnement', 106, 6),
(638, 'Bâtiment et Travaux Publics', 'fr. Description .Bâtiment et Travaux Publics', 107, 1),
(639, 'Bâtiment et Travaux Publics', 'en. Description .Bâtiment et Travaux Publics', 107, 2),
(640, 'Bâtiment et Travaux Publics', 'mg. Description .Bâtiment et Travaux Publics', 107, 3),
(641, 'Bâtiment et Travaux Publics', 'it. Description .Bâtiment et Travaux Publics', 107, 4),
(642, 'Bâtiment et Travaux Publics', 'es. Description .Bâtiment et Travaux Publics', 107, 5),
(643, 'Bâtiment et Travaux Publics', 'de. Description .Bâtiment et Travaux Publics', 107, 6),
(644, 'Informatique', 'fr. Description .Informatique', 108, 1),
(645, 'Informatique', 'en. Description .Informatique', 108, 2),
(646, 'Informatique', 'mg. Description .Informatique', 108, 3),
(647, 'Informatique', 'it. Description .Informatique', 108, 4),
(648, 'Informatique', 'es. Description .Informatique', 108, 5),
(649, 'Informatique', 'de. Description .Informatique', 108, 6),
(650, 'Gestion & Management', 'fr. Description .Gestion & Management', 109, 1),
(651, 'Gestion & Management', 'en. Description .Gestion & Management', 109, 2),
(652, 'Gestion & Management', 'mg. Description .Gestion & Management', 109, 3),
(653, 'Gestion & Management', 'it. Description .Gestion & Management', 109, 4),
(654, 'Gestion & Management', 'es. Description .Gestion & Management', 109, 5),
(655, 'Gestion & Management', 'de. Description .Gestion & Management', 109, 6),
(656, 'Information & Communication & Journalism', 'fr. Description .Information & Communication & Journalism', 110, 1),
(657, 'Information & Communication & Journalism', 'en. Description .Information & Communication & Journalism', 110, 2),
(658, 'Information & Communication & Journalism', 'mg. Description .Information & Communication & Journalism', 110, 3),
(659, 'Information & Communication & Journalism', 'it. Description .Information & Communication & Journalism', 110, 4),
(660, 'Information & Communication & Journalism', 'es. Description .Information & Communication & Journalism', 110, 5),
(661, 'Information & Communication & Journalism', 'de. Description .Information & Communication & Journalism', 110, 6),
(662, 'Management Tourisme', 'fr. Description .Management Tourisme', 111, 1),
(663, 'Management Tourisme', 'en. Description .Management Tourisme', 111, 2),
(664, 'Management Tourisme', 'mg. Description .Management Tourisme', 111, 3),
(665, 'Management Tourisme', 'it. Description .Management Tourisme', 111, 4),
(666, 'Management Tourisme', 'es. Description .Management Tourisme', 111, 5),
(667, 'Management Tourisme', 'de. Description .Management Tourisme', 111, 6),
(668, 'Sciences paramédicales', 'fr. Description .Sciences paramédicales', 112, 1),
(669, 'Sciences paramédicales', 'en. Description .Sciences paramédicales', 112, 2),
(670, 'Sciences paramédicales', 'mg. Description .Sciences paramédicales', 112, 3),
(671, 'Sciences paramédicales', 'it. Description .Sciences paramédicales', 112, 4),
(672, 'Sciences paramédicales', 'es. Description .Sciences paramédicales', 112, 5),
(673, 'Sciences paramédicales', 'de. Description .Sciences paramédicales', 112, 6),
(674, 'Management', 'fr. Description .Management', 113, 1),
(675, 'Management', 'en. Description .Management', 113, 2),
(676, 'Management', 'mg. Description .Management', 113, 3),
(677, 'Management', 'it. Description .Management', 113, 4),
(678, 'Management', 'es. Description .Management', 113, 5),
(679, 'Management', 'de. Description .Management', 113, 6),
(680, 'Agronomie Spécialisation Agri business', 'fr. Description .Agronomie Spécialisation Agri business', 114, 1),
(681, 'Agronomie Spécialisation Agri business', 'en. Description .Agronomie Spécialisation Agri business', 114, 2),
(682, 'Agronomie Spécialisation Agri business', 'mg. Description .Agronomie Spécialisation Agri business', 114, 3),
(683, 'Agronomie Spécialisation Agri business', 'it. Description .Agronomie Spécialisation Agri business', 114, 4),
(684, 'Agronomie Spécialisation Agri business', 'es. Description .Agronomie Spécialisation Agri business', 114, 5),
(685, 'Agronomie Spécialisation Agri business', 'de. Description .Agronomie Spécialisation Agri business', 114, 6),
(686, 'Agronomie Spécialisation Agri industrie', 'fr. Description .Agronomie Spécialisation Agri industrie', 115, 1),
(687, 'Agronomie Spécialisation Agri industrie', 'en. Description .Agronomie Spécialisation Agri industrie', 115, 2),
(688, 'Agronomie Spécialisation Agri industrie', 'mg. Description .Agronomie Spécialisation Agri industrie', 115, 3),
(689, 'Agronomie Spécialisation Agri industrie', 'it. Description .Agronomie Spécialisation Agri industrie', 115, 4),
(690, 'Agronomie Spécialisation Agri industrie', 'es. Description .Agronomie Spécialisation Agri industrie', 115, 5),
(691, 'Agronomie Spécialisation Agri industrie', 'de. Description .Agronomie Spécialisation Agri industrie', 115, 6),
(692, 'Agronomie', 'fr. Description .Agronomie', 116, 1),
(693, 'Agronomie', 'en. Description .Agronomie', 116, 2),
(694, 'Agronomie', 'mg. Description .Agronomie', 116, 3),
(695, 'Agronomie', 'it. Description .Agronomie', 116, 4),
(696, 'Agronomie', 'es. Description .Agronomie', 116, 5),
(697, 'Agronomie', 'de. Description .Agronomie', 116, 6),
(698, 'Tourisme durable', 'fr. Description .Tourisme durable', 117, 1),
(699, 'Tourisme durable', 'en. Description .Tourisme durable', 117, 2),
(700, 'Tourisme durable', 'mg. Description .Tourisme durable', 117, 3),
(701, 'Tourisme durable', 'it. Description .Tourisme durable', 117, 4),
(702, 'Tourisme durable', 'es. Description .Tourisme durable', 117, 5),
(703, 'Tourisme durable', 'de. Description .Tourisme durable', 117, 6),
(704, 'Gestion', 'fr. Description .Gestion', 118, 1),
(705, 'Gestion', 'en. Description .Gestion', 118, 2),
(706, 'Gestion', 'mg. Description .Gestion', 118, 3),
(707, 'Gestion', 'it. Description .Gestion', 118, 4),
(708, 'Gestion', 'es. Description .Gestion', 118, 5),
(709, 'Gestion', 'de. Description .Gestion', 118, 6),
(716, 'Etudes Musicales', 'fr. Description .Etudes Musicales', 120, 1),
(717, 'Etudes Musicales', 'en. Description .Etudes Musicales', 120, 2),
(718, 'Etudes Musicales', 'mg. Description .Etudes Musicales', 120, 3),
(719, 'Etudes Musicales', 'it. Description .Etudes Musicales', 120, 4),
(720, 'Etudes Musicales', 'es. Description .Etudes Musicales', 120, 5),
(721, 'Etudes Musicales', 'de. Description .Etudes Musicales', 120, 6),
(722, 'Danse', 'fr. Description .Danse', 121, 1),
(723, 'Danse', 'en. Description .Danse', 121, 2),
(724, 'Danse', 'mg. Description .Danse', 121, 3),
(725, 'Danse', 'it. Description .Danse', 121, 4),
(726, 'Danse', 'es. Description .Danse', 121, 5),
(727, 'Danse', 'de. Description .Danse', 121, 6),
(728, 'Théatre', 'fr. Description .Théatre', 122, 1),
(729, 'Théatre', 'en. Description .Théatre', 122, 2),
(730, 'Théatre', 'mg. Description .Théatre', 122, 3),
(731, 'Théatre', 'it. Description .Théatre', 122, 4),
(732, 'Théatre', 'es. Description .Théatre', 122, 5),
(733, 'Théatre', 'de. Description .Théatre', 122, 6);

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
(79, 47, 'isstparamedlogo.jpg', '25555501601ead19767f7e2a2f4996a447c5f3bf.jpeg', 'isstparamedlogo.jpg', 1),
(80, 48, 'ISSEG.jpg', 'fb29373e238f593fae1517cce2bc95c1d2a04a9d.jpeg', 'ISSEG.jpg', 1),
(81, 49, 'INFOTOUR.jpg', 'e6b66d8dd39f11532fd9717752cf68e170813d71.jpeg', 'INFOTOUR.jpg', 1),
(82, 50, 'ISPPM.jpg', 'e02668b4df8975f4f2c6de6bb0421f0dca57de55.jpeg', 'ISPPM.jpg', 1),
(83, 88, '1511.jpg', 'f3471cc65156e860e33cf8ad7f20093cfa853574.jpeg', '1511.jpg', 1),
(84, 65, 'eli.png', 'ee65d78fc4de02fad4c49f1637e6fffd9d960712.png', 'eli.png', 1),
(85, 87, 'ESTIIM.jpg', 'ade1671ee306e2dbd382fd4d0423df99f0bea8cb.jpeg', 'ESTIIM.jpg', 1),
(86, 166, 'ISM ADVANCEA.jpg', 'e329a8a0233a35cbcda8d26453dc29bcd2f2a5f2.jpeg', 'ISM ADVANCEA.jpg', 0),
(87, 166, 'ission.png', 'b43b6332394c7ed716447c9db510699ecfb1f05c.png', 'ission.png', 1),
(88, 173, 'istam.png', '1c20fbce1aab65905df3addb6fd98ba8219e14a2.png', 'istam.png', 1),
(89, 183, 'EGM.jpg', '1a0b2287579db244fcfd8a990ca3b38b6d009fd7.jpeg', 'EGM.jpg', 1),
(90, 127, 'IMT.jpg', '106a2afe452a1243ab38a086fcb435393359422b.jpeg', 'IMT.jpg', 1),
(91, 55, 'atouttourisme.jpg', '5f485805df1808f35842c8afac955861eb9c8d48.jpeg', 'atouttourisme.jpg', 1),
(92, 176, 'IUM.jpg', '76c381d22fbe1d063a97924da75b02efdbc48c94.jpeg', 'IUM.jpg', 1),
(93, 95, 'HECMMA.jpg', 'eac025d610570c6014a0475992e15d1500e8e5d6.jpeg', 'HECMMA.jpg', 1),
(94, 179, 'jau.jpg', '911f870c4c36216322d68a8d641d161845e56315.jpeg', 'jau.jpg', 1),
(95, 85, 'EST.jpg', '4cc0e7d8a9098aa6c9f22f7df1d3a846b7f3dc71.jpeg', 'EST.jpg', 1),
(96, 172, 'ISSUP.jpg', '3342f01799247ae01e7f2c5ebf3f2924bd992a40.jpeg', 'ISSUP.jpg', 1);

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
(12, 'Faculté des Lettres et Sciences Humaines', 'FLSH', 'faculte-des-lettres-et-sciences-humaines', 1),
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
(47, 'Institut Superieur des Sciences Technologiques', 'ISST', 'institut-superieur-des-sciences-technologiques', 1),
(48, 'Institut Supérieur en Sciences de l''environnement et de gestion', 'ISSEG', 'institut-superieur-en-sciences-de-l-environnement-et-de-gestion', 1),
(49, 'Institut de Formation en Tourisme', 'INFOTOUR', 'institut-de-formation-en-tourisme', 1),
(50, 'Institut Superieur Protestant Paul Minault', 'ISPPM', 'institut-superieur-protestant-paul-minault', 1),
(51, 'Ecole de Coupe et Couture Volana Antananarivo', 'ECCOVA', 'ecole-de-coupe-et-couture-volana-antananarivo', 1),
(52, 'ACADEMIE RAKETAMANGA', 'ACADEMIE RAKETAMANGA', 'academie-raketamanga', 1),
(53, 'AFACO', 'Institut Professionnel AFACO', 'afaco', 1),
(54, 'Atlas University', 'ATLAS', 'atlas', 1),
(55, 'Institut Supérieur ATOUT TOURISME MADAGASCAR', 'ISATTM', 'institut-superieur-atout-tourisme-madagascar', 1),
(56, 'Boeny Institut Paramédical', 'BIP', 'boeny-institut-paramedical', 1),
(57, 'Centre d’Etudes, de l’Information et des Technologies, Orienté Professionnel', 'CEITOP', 'centre-d-rsquo-etudes-de-l-rsquo-information-et-des-technologies-oriente-professionnel', 1),
(58, 'Centre Ecologique de Libanona', 'CEL', 'centre-ecologique-de-libanona', 1),
(59, 'Conseils - Etudes - Réalisation - Formation ARMI', 'CERF ARMI', 'conseils-etudes-realisation-formation-armi', 1),
(60, 'Centre de Formation à des Activités du Commerce', 'CFAC', 'centre-de-formation-a-des-activites-du-commerce', 1),
(61, 'Centre de Formation et d’Application du Machinisme Agricole Antsirabe', 'CFAMA', 'centre-de-formation-et-d-rsquo-application-du-machinisme-agricole-antsirabe', 1),
(62, 'Institut d’Administration des Entreprises – COGEFE - FORMATION', 'IAE - COGEFE - FORMATION', 'institut-d-rsquo-administration-des-entreprises-ndash-cogefe-formation', 1),
(63, 'Conseil de Recherche - Action en Développement Communautaire', 'CRADEC', 'conseil-de-recherche-action-en-developpement-communautaire', 1),
(64, 'Ecole de Comptabilité et d’Administration Taratra', 'ECAT - TARATRA', 'ecole-de-comptabilite-et-d-rsquo-administration-taratra', 1),
(65, 'ELI - Laulanie Green University', 'ELGU', 'eli-laulanie-green-university', 1),
(66, 'Ecole Professionnelle de Commerce et Technique', 'EPCT', 'ecole-professionnelle-de-commerce-et-technique', 1),
(67, 'Etablissement Privé d’Enseignement Supérieur Lumière', 'EPSL', 'etablissement-prive-d-rsquo-enseignement-superieur-lumiere', 1),
(68, 'Ecole Professionnelle Supérieure Agricole', 'EPSA', 'ecole-professionnelle-superieure-agricole', 1),
(69, 'Ecole Supérieure de Bâtiment et Travaux Publics Bevalala', 'ESBTPB', 'ecole-superieure-de-batiment-et-travaux-publics-bevalala', 1),
(70, 'Ecole Supérieure de Développement Economique et Social', 'ESDES', 'ecole-superieure-de-developpement-economique-et-social', 1),
(71, 'Ecole Supérieure de Droit et de Sciences Politiques', 'ESDSP', 'ecole-superieure-de-droit-et-de-sciences-politiques', 1),
(72, 'Ecole Supérieure de Formation des Infirmiers', 'ESFI', 'ecole-superieure-de-formation-des-infirmiers', 1),
(73, 'Ecole Supérieure de Formation Paramédicale de Bongolava', 'ESFPB', 'ecole-superieure-de-formation-paramedicale-de-bongolava', 1),
(74, 'Ecole des Sage - femme et Infirmier de Fianarantsoa', 'ESIF', 'ecole-des-sage-femme-et-infirmier-de-fianarantsoa', 1),
(75, 'Ecole Supérieure d’Informatique et de Gestion des Entreprises', 'ESIGE', 'ecole-superieure-d-rsquo-informatique-et-de-gestion-des-entreprises', 1),
(76, 'Ecole Supérieure d’Infirmier et  Sage - femme Jean Paul II', 'ESISJP II', 'ecole-superieure-d-rsquo-infirmier-et-sage-femme-jean-paul-ii', 1),
(77, 'Ecole Supérieure d’Infirmière et de Sage - femme Saint François d’Assise', 'ESISSFA', 'ecole-superieure-d-rsquo-infirmiere-et-de-sage-femme-saint-francois-d-rsquo-assise', 1),
(78, 'Ecole Supérieure des Métiers et Arts Plastiques', 'ESMAP', 'ecole-superieure-des-metiers-et-arts-plastiques', 1),
(79, 'Etablissement Supérieur Professionnel Bureautique, Informatique et Gestion', 'ESPBIG', 'etablissement-superieur-professionnel-bureautique-informatique-et-gestion', 1),
(80, 'Ecole Supérieure Paramédicale Alaotra Mangoro', 'ESPA', 'ecole-superieure-paramedicale-alaotra-mangoro', 1),
(81, 'Ecole Supérieure Professionnelle en Informatique et Commerce', 'ESPIC', 'ecole-superieure-professionnelle-en-informatique-et-commerce', 1),
(82, 'Ecole Supérieure Paramédicale de Madagascar', 'ESPMA', 'ecole-superieure-paramedicale-de-madagascar', 1),
(83, 'Ecole Supérieure Saint Gabriel Mahajanga', 'ESSGAM', 'ecole-superieure-saint-gabriel-mahajanga', 1),
(84, 'Ecole Supérieure Spécialisée de Vakinakaratra', 'ESSVA', 'ecole-superieure-specialisee-de-vakinakaratra', 1),
(85, 'Ecole Supérieure de Technologie', 'EST', 'ecole-superieure-de-technologie', 1),
(86, 'Ecole Supérieure des Technologies de l’Information Antanimena', 'ESTI', 'ecole-superieure-des-technologies-de-l-rsquo-information-antanimena', 1),
(87, 'Engineering School of Tourism, Informatics, Interpreter ship and Management', 'ESTIIM', 'engineering-school-of-tourism-informatics-interpreter-ship-and-management', 1),
(88, 'Education in Training, Employment and Communication', 'ETEC', 'education-in-training-employment-and-communication', 1),
(89, 'Etablissement Technique de Formation Professionnelle Supérieure RLG', 'ETFPS RLG', 'etablissement-technique-de-formation-professionnelle-superieure-rlg', 1),
(90, 'Etablissement Technique Supérieur', 'ETS', 'etablissement-technique-superieur', 1),
(91, 'Fifampiofanana Fanabeazana Fikolokoloana ho Malagasy Mahomby', 'FFFMM IMD', 'fifampiofanana-fanabeazana-fikolokoloana-ho-malagasy-mahomby', 1),
(92, 'Grand Seminaire Saint Paul Ap ôtre Cycle Philosophique Manantenasoa  Antsirabe', 'GSSPA', 'grand-seminaire-saint-paul-ap-otre-cycle-philosophique-manantenasoa-antsirabe', 1),
(93, 'Gate University Ambohidratrimo', 'GUA', 'gate-university-ambohidratrimo', 1),
(94, 'Global University of Madagascar', 'GUM', 'global-university-of-madagascar', 1),
(95, 'Hautes Etudes Chrétiennes de Management et de Mathématiques Appliquées', 'HECMMA', 'hautes-etudes-chretiennes-de-management-et-de-mathematiques-appliquees', 1),
(96, 'Institut Catholique Notre Dame', 'ICND', 'institut-catholique-notre-dame', 1),
(97, 'Institut Catholique de Pédagogie', 'ICP', 'institut-catholique-de-pedagogie', 1),
(98, 'Institut d’Enseignement Supérieur de Technologie Informatique et de Management d’Entreprise', 'IESTIME', 'institut-d-rsquo-enseignement-superieur-de-technologie-informatique-et-de-management-d-rsquo-entreprise', 1),
(99, 'Institut de Formation des Agents de Santé', 'IFAS', 'institut-de-formation-des-agents-de-sante', 1),
(100, 'Institut de Formation en Environnement Linguistique et Paramédicale', 'IFELP', 'institut-de-formation-en-environnement-linguistique-et-paramedicale', 1),
(101, 'Institut Supérieur de Formation Infirmière et Sage Femme', 'IFISA', 'institut-superieur-de-formation-infirmiere-et-sage-femme', 1),
(102, 'Institut de Formation d’Infirmière et Sage - femme d’Amoron’i Mania', 'IFISAM', 'institut-de-formation-d-rsquo-infirmiere-et-sage-femme-d-rsquo-amoron-rsquo-i-mania', 1),
(103, 'Institut de Formation des Paramédicaux de la région SAVA', 'IFP SAVA', 'institut-de-formation-des-paramedicaux-de-la-region-sava', 1),
(104, 'Institut de Formation des Paramédicaux Analanjirofo', 'IFPA', 'institut-de-formation-des-paramedicaux-analanjirofo', 1),
(105, 'Institut de Formation des Paramédicaux Mananara Avaratra', 'IFPAMA', 'institut-de-formation-des-paramedicaux-mananara-avaratra', 1),
(106, 'Institut de Formation des Paramédicaux Fianarantsoa', 'IFPF', 'institut-de-formation-des-paramedicaux-fianarantsoa', 1),
(107, 'Institut de Formation des Paramédicaux de Mandritsara', 'IFPM', 'institut-de-formation-des-paramedicaux-de-mandritsara', 1),
(108, 'Institut de Formation des Paramédicaux Sofia', 'IFPS', 'institut-de-formation-des-paramedicaux-sofia', 1),
(109, 'Institut de Formation des Paramédicaux de Tsiroanomandidy', 'IFPT', 'institut-de-formation-des-paramedicaux-de-tsiroanomandidy', 1),
(110, 'Institut de Formation et de s Recherche s Pédagogique s', 'IFRP', 'institut-de-formation-et-de-s-recherche-s-pedagogique-s', 1),
(111, 'Institut de Formation en Sage - femme et Infirmière Intermed', 'IFSI INTERMED', 'institut-de-formation-en-sage-femme-et-infirmiere-intermed', 1),
(112, 'Institut de Formation des Soins infirmiers Sainte Jeanne d’Arc', 'IFSI Ste Jeanne d’Arc', 'institut-de-formation-des-soins-infirmiers-sainte-jeanne-d-rsquo-arc', 1),
(113, 'Institut de Formation S ocio - Médicale', 'IFSM', 'institut-de-formation-s-ocio-medicale', 1),
(114, 'Institut de Formation S ocio - Médicale Analanjirofo', 'IFSM Analanjirofo', 'institut-de-formation-s-ocio-medicale-analanjirofo', 1),
(115, 'Institut de Formation Supérieure des Paramédicaux Les Rossignols', 'IFSP Les Rossignols', 'institut-de-formation-superieure-des-paramedicaux-les-rossignols', 1),
(116, 'Institut de Formation Supérieure des Paramédicaux', 'IFSP Soanierana Namontana', 'institut-de-formation-superieure-des-paramedicaux', 1),
(117, 'nstitut de Format ion Supérieure des Paramédicaux A tsinanana', 'IFSPA', 'nstitut-de-format-ion-superieure-des-paramedicaux-a-tsinanana', 1),
(118, 'Institut de Format ion Supérieure des Paramédicaux Toamasina', 'IFSPT', 'institut-de-format-ion-superieure-des-paramedicaux-toamasina', 1),
(119, 'Institut de Formation en Santé et Technologie Médicale', 'IFSTM', 'institut-de-formation-en-sante-et-technologie-medicale', 1),
(120, 'Institut de Gemmologie d’Antananarivo', 'IGA', 'institut-de-gemmologie-d-rsquo-antananarivo', 1),
(121, 'Institut de Génie Civil et Architecture de Madagasikara', 'IGCAM', 'institut-de-genie-civil-et-architecture-de-madagasikara', 1),
(122, 'Institut de Gemmologie de Madagascar', 'IGM', 'institut-de-gemmologie-de-madagascar', 1),
(123, 'Institut International de Sciences Sociales', 'IISS', 'institut-international-de-sciences-sociales', 1),
(124, 'Institut de Leadership Chrétien', 'ILC', 'institut-de-leadership-chretien', 1),
(125, 'Institut de Management et de Gestion Appliqués', 'IMAGE APPLI', 'institut-de-management-et-de-gestion-appliques', 1),
(126, 'Institut de Management Administration, Gestion d’En treprise et Droit des Affaires', 'IMAGEDA', 'institut-de-management-administration-gestion-d-rsquo-en-treprise-et-droit-des-affaires', 1),
(127, 'Institute of Management and Tourism', 'IMT', 'institute-of-management-and-tourism', 1),
(128, 'Institut des Arts et des Technologies Avancées', 'INATA', 'institut-des-arts-et-des-technologies-avancees', 1),
(129, 'Ecole Info Espace', 'INFO ESPACE', 'ecole-info-espace', 1),
(130, 'Institut de Formation Supérieure des Paramédicaux', 'INFOSUP', 'infosup', 1),
(131, 'Institut National du Sciences Appliquées', 'INSA', 'institut-national-du-sciences-appliquees', 1),
(132, 'Institut Supérieur de Formation Paramédicale', 'INSFP', 'institut-superieur-de-formation-paramedicale', 1),
(133, 'Institut Supérieur de Formation Paramédicale Toamasina Analanjirofo', 'INSFPTA', 'institut-superieur-de-formation-paramedicale-toamasina-analanjirofo', 1),
(134, 'Institut Supérieur d’Etude Paramédicale du Menabe', 'INSPA Men', 'institut-superieur-d-rsquo-etude-paramedicale-du-menabe', 1),
(135, 'Institut Supérieur des Paramédicaux de Fort Dauphin', 'INSPAFORT', 'institut-superieur-des-paramedicaux-de-fort-dauphin', 1),
(136, 'Institut Supérieur des Paramédicaux d’ Alaotra Mangoro', 'INSPALM', 'institut-superieur-des-paramedicaux-d-rsquo-alaotra-mangoro', 1),
(137, 'Institut Supérieur d’Etude Paramédicale de Madagascar', 'INSPAM', 'institut-superieur-d-rsquo-etude-paramedicale-de-madagascar', 1),
(138, 'Institut Supérieur des Paramédicaux de la Région d’Ihosy', 'INSPARI', 'institut-superieur-des-paramedicaux-de-la-region-d-rsquo-ihosy', 1),
(139, 'Institute of Technical Technology, Living and Interdisciplinary Arts of Madagascar', 'INTETLIAM', 'institute-of-technical-technology-living-and-interdisciplinary-arts-of-madagascar', 1),
(140, 'Institut Privé  Al Moustapha', 'IPAM', 'institut-prive-al-moustapha', 1),
(141, 'Institut Privé Le Bon Samaritain Toliara', 'IPLBS', 'institut-prive-le-bon-samaritain-toliara', 1),
(142, 'Institut Privé Paramédical d’Ihorombe', 'IPPI', 'institut-prive-paramedical-d-rsquo-ihorombe', 1),
(143, 'Institut Professionnel Superieur en Agronomie et en Technologie de Tombotsoa Antsirabe', 'IPSATTA', 'institut-professionnel-superieur-en-agronomie-et-en-technologie-de-tombotsoa-antsirabe', 1),
(144, 'Institut Supérieur des Métiers de Madagascar', 'IS2M', 'institut-superieur-des-metiers-de-madagascar', 1),
(145, 'Institut Sainte Anne', 'ISA', 'institut-sainte-anne', 1),
(146, 'Institut Supérieur de l''Agronomie des Affaires et de la Communication', 'ISAAC', 'institut-superieur-de-l-agronomie-des-affaires-et-de-la-communication', 1),
(147, 'Institut  en Administration d’Entreprise « Cabinet Atomic »', 'ISAE', 'institut-en-administration-d-rsquo-entreprise-laquo-cabinet-atomic-raquo', 1),
(148, 'Institut Supérieur Adventiste de Gestion', 'ISAG', 'institut-superieur-adventiste-de-gestion', 1),
(149, 'Institut Supérieur des Avenirs Professionnels', 'ISAP', 'institut-superieur-des-avenirs-professionnels', 1),
(150, 'Institut Supérieur pour l’Avenir des Polytechniciens et la Santé Publique', 'ISAPSP', 'institut-superieur-pour-l-rsquo-avenir-des-polytechniciens-et-la-sante-publique', 1),
(151, 'Institut Supérieur – ARCADE', 'IS ARCADE', 'institut-superieur-ndash-arcade', 1),
(152, 'Institut Supérieur Catholique du Menabe', 'ISCAMEN', 'institut-superieur-catholique-du-menabe', 1),
(153, 'Institut Supérieur pour le Développement de l’Entreprenariat', 'ISDE', 'institut-superieur-pour-le-developpement-de-l-rsquo-entreprenariat', 1),
(154, 'Institut Supérieur pour l’Entrepreneuriat, le Commerce et le Management', 'ISECOM', 'institut-superieur-pour-l-rsquo-entrepreneuriat-le-commerce-et-le-management', 1),
(155, 'Institut Supérieur d’Etude , de Recherche et de Pratique', 'ISERP', 'institut-superieur-d-rsquo-etude-de-recherche-et-de-pratique', 1),
(156, 'Institut Supérieur de Formation en Gestion Informatisée', 'ISFGI', 'institut-superieur-de-formation-en-gestion-informatisee', 1),
(157, 'Institut Supérieur de Génie Electronique Informatique', 'ISGEI', 'institut-superieur-de-genie-electronique-informatique', 1),
(158, 'Institut Supérieur de Géologie de l’Ingénieur et de l’Environnement de Madagascar', 'ISGIEM', 'institut-superieur-de-geologie-de-l-rsquo-ingenieur-et-de-l-rsquo-environnement-de-madagascar', 1),
(159, 'Institut  Supérieur  d’Enseignement  Technologique  et  des Sciences', 'ISETS', 'institut-superieur-d-rsquo-enseignement-technologique-et-des-sciences', 1),
(160, 'Institut Supérieur de Formation Aéronautique Aérovision', 'ISFAA', 'institut-superieur-de-formation-aeronautique-aerovision', 1),
(161, 'Institut Supérieur d’Electronique et de Système Informatique', 'IS-IESI', 'institut-superieur-d-rsquo-electronique-et-de-systeme-informatique', 1),
(162, 'Institut   Supérieur   d’Informatique   et   de   Management d’Entreprise', 'ISIME', 'institut-superieur-d-rsquo-informatique-et-de-management-d-rsquo-entreprise', 1),
(163, 'Institut Supérieur en Informatique', 'IS INFO', 'institut-superieur-en-informatique', 1),
(164, 'Institut Supérieur d’Infirmiers et des Sages - femmes d’Antsiranana', 'ISISFA', 'institut-superieur-d-rsquo-infirmiers-et-des-sages-femmes-d-rsquo-antsiranana', 1),
(165, 'Institut Supérieur de l’Ingénierie et des Techniques de Management', 'ISITM', 'institut-superieur-de-l-rsquo-ingenierie-et-des-techniques-de-management', 1),
(166, 'Institut Supérieur en Sciences Infirmières et Obstétricales', 'ISSIO', 'institut-superieur-en-sciences-infirmieres-et-obstetricales', 1),
(167, 'Institut Supérieur de Majunga', 'ISMA', 'institut-superieur-de-majunga', 1),
(168, 'Institut Supérieur Spécialisé en Informatique et en Gestion', 'ISSIG', 'institut-superieur-specialise-en-informatique-et-en-gestion', 1),
(169, 'Institut Supérieur des Sciences Paramédicales de Madagascar', 'ISSPM', 'institut-superieur-des-sciences-paramedicales-de-madagascar', 1),
(170, 'Institut supérieur en Sciences de la Santé pour le Développement', 'ISSSD', 'institut-superieur-en-sciences-de-la-sante-pour-le-developpement', 1),
(171, 'Institut de spécialisation en Sciences de Gestion EMIR Consulting', 'ISSG EMIR Consulting', 'institut-de-specialisation-en-sciences-de-gestion-emir-consulting', 1),
(172, 'Institut Supérieur Privé Professionnel', 'ISSUP', 'institut-superieur-prive-professionnel', 1),
(173, 'Institut Supérieur de Technologie Touristique, Agricole et Minière', 'ISTAM', 'institut-superieur-de-technologie-touristique-agricole-et-miniere', 1),
(174, 'Institut Supérieur de Technologie Régionale de Vatovavy Fitovinany', 'ISTR - V7V', 'institut-superieur-de-technologie-regionale-de-vatovavy-fitovinany', 1),
(175, 'Institut Supérieur de Travail Social', 'ISTS', 'institut-superieur-de-travail-social', 1),
(176, 'Institut Universitaire de Madagascar', 'IUM', 'institut-universitaire-de-madagascar', 1),
(177, 'Institut Universitaire Privé de Tananarive', 'IUP', 'institut-universitaire-prive-de-tananarive', 1),
(178, 'Institut Universitaire Professionnel en Administration d’Entreprise et en Sciences Marines', 'IUPAESM', 'institut-universitaire-professionnel-en-administration-d-entreprise-et-en-sciences-marines', 1),
(179, 'Jeanne D''Arc University', 'JAU', 'jeanne-d-arc-university', 1),
(180, 'Lutheran Institute of Management  and Entrepreneurship Fianarantsoa', 'LIME', 'lutheran-institute-of-management-and-entrepreneurship-fianarantsoa', 1),
(181, 'Leadership Management Business University', 'LMBU', 'leadership-management-business-university', 1),
(182, 'Miasa Initiative and Business Consulting – Institute Formation et Création', 'MIBC INSTITUTE', 'miasa-initiative-and-business-consulting-institute-formation-et-creation', 1),
(183, 'Ecole de Guitare de Madagascar', 'EGM', 'egm', 1);

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
(32, 46, 2, '2017-06-30 09:01:27', 1),
(33, 18, 1, '2017-07-02 22:57:44', 1),
(34, 18, 3, '2017-07-02 23:07:28', 0);

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
(4, 29, 'Antsobolo, Antananarivo, Madagascar', '033 12 171 60 / 034 17 583 69 / 020 26 384 08', 'www.ispm-edu.com', '', '', 1, 'ispm@ispm.edu.com'),
(5, 1, 'Maison des produits 67 Ha BP 946 101 Tananarive Madagascar', '(+261) 20 22 660 65/ 22 660 66', 'http://www.inscae.mg/', '', '', 1, 'inscae@mail.mail'),
(6, 1, 'Nunc ultricies ac arcu vitae elementum', '+261 05 21 541 21', 'www.inscae.mg', '36', '12', 1, ''),
(7, 4, 'Lorem ipsum dolor et sit amet consectus', '+261 33 985 65', 'www.espa.com', '56', '89', 1, 'espaofficial@espa.com'),
(8, 17, 'my address', '+261 34 52 325 23', 'www.inspnmad.mg', '89', '56', 1, 'inspnmad@gmail.com'),
(9, 3, 'ique elit sit amet, finibus rhoncus ipsum. Nunc ultricie', '45 45 454545 4545', 'sfs.sdfsd.sdf', '', '', 1, 'sdfsdfs@dfsd.df'),
(10, 99, 'IFAS Lot II N69 A Analamahitsy', '034 39 415 28', '', '', '', 1, 'ifas@yahoo.fr'),
(11, 87, 'ESTIIM’, Immeuble CENAM 67 Ha Sud, Antananarivo 101', '020 22 294 53 / 020 24 331 19 / 034 20 065 65', 'www.estiim.net', '', '', 1, 'estiim@yahoo.fr'),
(12, 67, 'Lot FA IV 12 A Village Malaho – 102 Antananarivo Atsimondrano', '', '', '', '', 1, 'ecole-lumiere@orange.fr'),
(13, 25, 'Lot 28 Soamiampita Itaosy', '033 73 734 77 - 034 07 734 77', 'espm@gmail.com', '', '', 1, ''),
(14, 168, 'Infocentre de la Salle - Frères des Ecoles Chrétiennes Soavimbahoaka BP 583', '020 22 408 18', '', '', '', 1, 'princyother@yahoo.fr'),
(15, 169, 'Institut Supérieur des Sciences Paramédicales de Madagascar', '033 02 707 81 / 034 29 014 17', '', '', '', 1, 'isspmtoa@yahoo.fr'),
(16, 170, 'lot 0512 - F - 142 Tsarasaotra – 110 Antsirabe', '032 85 681 28', '', '', '', 1, 'isssd@rosketmail.com'),
(17, 47, 'Andrefan''Ambohijanahary', '034 13 844 62', '', '', '', 1, ''),
(18, 119, 'Lot 116 Pile 519 Marovato Abattoir Mahajanga 401', '032 80 783 51', '', '', '', 1, 'bellah.suzia@gmail.com'),
(19, 171, 'Lot IVN 54 BTX 67H N/O (Ankasina) Antananarivo', '020 22 319 24 / 033 37 009 01 / 034 07 009 01', '', '', '', 1, 'rabrhylan@yahoo.fr ; isssg.emir@haoo.fr'),
(20, 172, 'Lot IVD 23 Ter Behoririka – 101 Antananarivo', '032 45 464 75 / 033 09 463 87 / 032 02 254 48', '', '', '', 1, 'contact@issup.net'),
(21, 173, 'Institut Supérieur de Technologie Touristique, Agricole et Minière', '033 25 908 54', '', '', '', 1, 'manjary_frederic@yahoo.fr'),
(22, 174, 'mbokala Manakara', '', '', '', '', 1, ''),
(23, 4, 'B.P 1500 - 101 Antananarivo', '020 22 689 15 / 020 22  630 30', '', '', '', 1, 'espa.tana@gmail.com'),
(24, 127, 'Lot IVS 30 Antanimena Antananarivo', '033 41 317 59 / 032 02 504 89 / 034 29 373 32', '', '', '', 1, 'imtmada@gmail.com'),
(25, 175, 'Lot IAV 309 B Mandrimena Iavoloha BP 9103 Andoharanofotsy – 102 Antananarivo', '020 22 460 34', '', '', '', 1, 'stsmad@moov.mg; istsmadagascar@moov.mg'),
(26, 69, 'BP 3832 Antananarivo', '032 11 102 54', '', '', '', 1, 'esbtpbevalala@gmail.com'),
(27, 31, 'Lot VB 22 C bis Ambatoroka', '034 20 821 48', '', '', '', 1, 'ramakavelogenevieve@gmail.com'),
(28, 108, 'Villa Fiaka Ambalatany – 407 Antsohihy', '032 40 496 62 / 032 67 692 67', '', '', '', 1, ''),
(29, 176, 'Lot I BG 12 Isoraka – Antananarivo', '033 12 662 45', '', '', '', 1, 'kenovaralainirina@yahoo.fr'),
(30, 177, 'Lot VF 30 Mahamasina Nord Antananarivo Siège : Immeuble CNAPS 67 Ha', '020 24 610 88 / 032 70 601 84', '', '', '', 1, 'iuptananarive@gmail.com'),
(31, 178, 'Nosy Be Hell Ville', '032 59 229 72 / 032 04 450 27', '', '', '', 1, 'resinosykomba@yahoo.fr'),
(32, 179, 'Lot II V 65 Ampandrana Bel Air - Immeuble O PEN 2è étage', '033 11 157 00', '', '', '', 1, 'loloaparany@yahoo.fr'),
(33, 180, 'Lot 0307/0120 Ambonifahidrano près des Cités des Profs 301', '034 04 216 11', '', '', '', 1, 'razafye@yahoo.fr'),
(34, 181, 'Ambatomaro', '020 26 414 14', '', '', '', 1, 'administration@lgs.mg ; navalona@lgs.mg'),
(35, 182, '200FI Ambohitravao Talatamaty', '034 70 529 04', '', '', '', 1, 'mibc.madagascar@gmail.com'),
(36, 19, 'Lot SIBE 5 Bis Soarano, Rue Andrianampoinimerina', '020 22 651 72 / 020 22 652 18', '', '', '', 1, 'iftmadagascar@moov.mg'),
(37, 146, '364/G Moramanga Ambony', '', '', '', '', 1, ''),
(38, 183, 'Lot 1402 67ha Nord Ouest', '033 15 812 45', '', '', '', 1, '');

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
(14, 46, '2017-06-30 08:34:10', 1, '2017-06-30'),
(15, 45, '2017-07-01 11:59:33', 1, '2017-07-01'),
(16, 29, '2017-07-02 13:12:53', 1, '2017-07-02'),
(17, 30, '2017-07-03 19:17:46', 1, '2017-07-03'),
(18, 40, '2017-07-04 12:53:08', 1, '2017-07-04'),
(19, 39, '2017-07-05 09:40:01', 1, '2017-07-05'),
(20, 2, '2017-07-06 19:34:24', 1, '2017-07-06'),
(21, 26, '2017-07-07 09:02:09', 1, '2017-07-07'),
(22, 31, '2017-07-09 21:29:18', 1, '2017-07-09'),
(23, 30, '2017-07-10 11:06:20', 1, '2017-07-10'),
(24, 14, '2017-07-11 08:43:21', 1, '2017-07-11'),
(25, 39, '2017-07-12 09:42:15', 1, '2017-07-12'),
(26, 106, '2017-07-13 09:56:42', 1, '2017-07-13'),
(27, 14, '2017-07-14 10:23:47', 0, '2017-07-14'),
(28, 25, '2017-07-14 11:34:53', 0, '2017-07-14'),
(29, 99, '2017-07-14 11:35:16', 1, '2017-07-14'),
(30, 67, '2017-07-15 09:09:31', 1, '2017-07-15'),
(31, 87, '2017-07-17 09:45:48', 1, '2017-07-17'),
(32, 135, '2017-07-18 12:29:07', 1, '2017-07-18'),
(33, 97, '2017-07-19 09:54:51', 1, '2017-07-19'),
(34, 38, '2017-07-20 17:06:10', 1, '2017-07-20'),
(35, 47, '2017-07-21 11:22:51', 0, '2017-07-21'),
(36, 105, '2017-07-21 15:43:22', 1, '2017-07-21'),
(37, 79, '2017-07-23 09:21:17', 1, '2017-07-23'),
(38, 127, '2017-07-24 10:02:45', 1, '2017-07-24'),
(39, 69, '2017-07-25 08:45:40', 1, '2017-07-25'),
(40, 108, '2017-07-26 09:14:43', 1, '2017-07-26'),
(41, 146, '2017-07-27 09:23:35', 1, '2017-07-27'),
(42, 173, '2017-07-28 09:20:22', 1, '2017-07-28'),
(43, 84, '2017-07-30 14:49:24', 1, '2017-07-30'),
(44, 27, '2017-07-31 08:34:30', 1, '2017-07-31');

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
(5, 4, 4, '2017-05-02 07:22:08', 0),
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
(26, 33, 2, '2017-06-27 09:00:39', 1),
(27, 3, 1, '2017-07-13 16:36:17', 1);

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
(2, 1, 2, 'Institut national des sciences comptables et de l''administration d''entreprises', 'Créé en 1981 et destiné à former des cadres d''entreprises de haut niveau, à promouvoir les initiatives entrepreneuriales et à développer les activités de recherche en gestion, notre Institut offre des programmes de formation de premier cycle, de second cycle et de troisième cycle professionnel ou de recherche dans le domaine de la Comptabilité, de la Finance et du Management. En effet, toujours à l''écoute des aspirations du milieu économique confronté à la mondialisation et la globalisation des marchés, cette Ecole s''est efforcée de répondre constamment aux attentes des entreprises, voire du secteur public, en ouvrant presque tous les ans de nouveaux programmes, ce qui a contribué à sa bonne renommée tant au niveau local, régional, qu''international. Nous espérons qu''en consultant tous nos programmes de formation, vous trouverez celui qui répondrait au mieux à vos besoins et que vous serez des nôtres très bientôt', '<div style="text-align: justify;"><strong>Ann&eacute;es 80</strong><br /><br />Cr&eacute;&eacute; en 1981, &agrave; la suite d''un protocole d''accord entre la R&eacute;publique de Madagascar et la Banque Mondiale, le Centre de Formation en Comptabilit&eacute; (CFC) &eacute;largit rapidement son champ d''intervention pour devenir en 1986 l''Institut National des Sciences Comptables et de l''Administration d''Entreprises (INSCAE). L''INSCAE est un Etablissement Public &agrave; caract&egrave;re scientifique et culturel dot&eacute; de la personnalit&eacute; morale et jouissant de l''autonomie administrative et financi&egrave;re, il a pour mission de former des cadres de haut niveau, de promouvoir les initiatives entrepreneuriales et de d&eacute;velopper les activit&eacute;s de recherche en gestion. Du CFC &agrave; l''INSCAE, les nationaux, successeurs des canadiens &agrave; la commande de l''Institut, arrivent non seulement &agrave; capitaliser les acquis mais aussi &agrave; trouver une judicieuse compl&eacute;mentarit&eacute; entre les sciences comptables et l''administration d''entreprises. Ils sont en train de fa&ccedil;onner un nouveau mod&egrave;le de formation en sciences de gestion r&eacute;pondant aux besoins du d&eacute;veloppement national. En effet, le mod&egrave;le de formation dans le syst&egrave;me classique est b&acirc;ti pour servir l''&eacute;conomie dirig&eacute;e. L''INSCAE, se rapprochant davantage des entreprises, apporte une d&eacute;terminante contribution, lors de l''&eacute;laboration du Plan Comptable G&eacute;n&eacute;ral 1987.<br /><br /><strong>Ann&eacute;es 90</strong><br /><br />Madagascar entame la deuxi&egrave;me p&eacute;riode d''Ajustement Structurel et opte pour la lib&eacute;ration de son &eacute;conomie, ce qui traduit, entre autres, par le d&eacute;sengagement de l''Etat du secteur de production d''o&ugrave; appel &agrave; des investisseurs. Cette r&eacute;orientation &eacute;conomique est dict&eacute;e &agrave; la fois par le contexte international et la performance de l''&eacute;conomie nationale. Force est de noter que le basculement d''une &eacute;conomie dirig&eacute;e &agrave; une &eacute;conomie lib&eacute;rale n''est pas toujours facile, en particulier le secteur priv&eacute; national est-il pr&ecirc;t ou du moins pr&eacute;par&eacute; &agrave; un tel changement? Cette deuxi&egrave;me p&eacute;riode est marqu&eacute;e, au niveau national, par l''av&egrave;nement des &eacute;tablissements d''enseignement sup&eacute;rieur priv&eacute; dont la quasi-totalit&eacute; aussure de la formation en sciences de gestion, d''o&ugrave; concurrence.<br /><br />Au niveau international, qualit&eacute; et internationalisation deviennent les mots cl&eacute;s. Aussi, l''Institut adopte une politique de coop&eacute;ration internationale dynamique. Il est membre de l''Agence Universitaire de la Francophonie, du R&eacute;seau Africain et Malagasy pour l''Excellence en Gestion d''Entrerprises et de l''Association des Institutions d''Enseignement et de Recherche de l''Ocean Indien. Il &eacute;tablit des programmes de coop&eacute;ration avec des universit&eacute;s canadienne, fran&ccedil;aises et mauricienne et avec l''Institut de la Francophonie pour l''Entrepreneuriat &agrave; l''Ile Maurice. Au niveau du contenu des programmes, le respect des normes internationales et la consid&eacute;ration des sp&eacute;cificit&eacute;s nationales sont judicieusements concili&eacute;s. Tr&egrave;s fr&eacute;quemment, dans les programmes de 3&egrave;me cycle, cibl&eacute;s et co-dipl&ocirc;m&eacute;s avec les partenaires apr&egrave;s la d&eacute;finition de base commune, l''Institut prend les initiatives qu''il juge pertinentes.<br /><br /><strong>Ann&eacute;es 2000</strong><br /><br />L&rsquo;Ajustement Structurel change d&rsquo;appellation mais la population ne b&eacute;n&eacute;ficie pas des retomb&eacute;es des mesures &eacute;conomiques, la pauvret&eacute; s&rsquo;accentue et le cycle de vie des crises politiques malagasy se raccourcit. Au niveau international, la crise financi&egrave;re cl&ocirc;ture la premi&egrave;re d&eacute;cennie. Face au changement de contexte et &agrave; l&rsquo;&eacute;volution des sciences et de la technologie, l&rsquo;INSCAE adapte ses offres de formations dipl&ocirc;mante et qualifiante et ses th&egrave;mes de recherche. Mais l&rsquo;INSCAE ne se contente pas seulement d&rsquo;adapter, il essaie aussi d&rsquo;anticiper. L''inauguration de l''immeuble le 21 Ao&ucirc;t 2014 est &agrave; marquer d''une pierre blanche dans l''histoire de l''INSCAE. En effet, apr&egrave;s trois d&eacute;cennies d''existence l''INSCAE finit par avoir son site propre gr&acirc;ce au concours du gouvernent malagasy avec la Banque Arabe pour le D&eacute;veloppement Economique en Afrique (BADEA) et de l''OPEC Fund for International Development (OFID)<br /><br /><strong>INSCAE et les instances dirigeantes</strong><br /><br />Le conseil d''Administration, compos&eacute; par les repr&eacute;sentants des Minist&egrave;res de tutelle, des associations professionnelles, du Personnel Enseignant, du Personnel Administratif et de l''Association des dipl&ocirc;m&eacute;s, a &eacute;t&eacute; pr&eacute;sid&eacute; successivement par : Blandin RAZAFIMANJATO, Raymond RABENORO,&nbsp; Victor MANANTSOA,&nbsp; RAZANANIRINA Bruno.<br />La direction G&eacute;n&eacute;rale a &eacute;t&eacute; confi&eacute;e successivement &agrave; : G&eacute;rard DUCHARNE (CFC),&nbsp; R&eacute;gis PARENT (CFC),&nbsp; Flavien TODY (INSCAE),&nbsp; Juliette RAHARISOA (INSCAE), Victor HARISON (INSCAE)</div>'),
(3, 1, 3, 'mg. name . Institut de Commerce et Management d\\''Antananarivo', 'mg. courte description . Institut de Commerce et Management d\\''Antananarivo', '<p>mg. description .</p> <p>desc Institut de Commerce et Management d''Antananarivo</p>'),
(4, 1, 4, 'it. name . Institut de Commerce et Management d\\''Antananarivo', 'it. courte description . Institut de Commerce et Management d\\''Antananarivo', '<p>it. description .</p> <p>desc Institut de Commerce et Management d''Antananarivo</p>'),
(5, 1, 5, 'es. name . Institut de Commerce et Management d\\''Antananarivo', 'es. courte description . Institut de Commerce et Management d\\''Antananarivo', '<p>es. description .</p>\n<p>desc Institut de Commerce et Management d''Antananarivo</p>'),
(6, 1, 6, 'de. name . Institut de Commerce et Management d\\''Antananarivo', 'de. courte description . Institut de Commerce et Management d\\''Antananarivo', '<p>de. description .</p> <p>desc Institut de Commerce et Management d''Antananarivo</p>'),
(7, 2, 1, 'Institut Supérieure de Technologie', 'L’IST d’Antananarivo offre trois types de formation : Les formations de cycle court de type alternatif (Bacc + 2 / Bacc + 3), Les formations d’Ingénieur de grade Master, Les formations de type hybride : Formation Ouverte et A Distance (FOAD) diplômante - Formation présentielle de type initial et de type continu diplômante et qualifiante', '<p style="text-align: justify;">L&rsquo;Institut sup&eacute;rieur de Technologie d&rsquo;Antananarivo (IST-T) est un &eacute;tablissement d&rsquo;enseignement sup&eacute;rieur et de recherche rattach&eacute; au Minist&egrave;re en charge de ce domaine. A la fois centre d&rsquo;enseignement sup&eacute;rieur et de recherche et partenaire des professionnels, l&rsquo;IST-T &oelig;uvre avec succ&egrave;s sur trois actions scientifiques d&eacute;finies dans sa strat&eacute;gie &agrave; l&rsquo;horizon 2020&nbsp;:</p>\n<ul>\n<li>Transfert de connaissances&nbsp;: le respect et la r&eacute;f&eacute;rence au programme de l&rsquo;uniformisation du syst&egrave;me d&rsquo;enseignement sup&eacute;rieur et de recherche &agrave; Madagascar&nbsp;;</li>\n<li>Satisfaire au mieux le besoin du pays sans pour autant laisser de c&ocirc;t&eacute; les enjeux mondiaux&nbsp;: la strat&eacute;gie de promotion de la formation de qualit&eacute; et &eacute;volutive&nbsp;;</li>\n<li>Repousser d&rsquo;avantage les limites du professionnalisme&nbsp;: le d&eacute;veloppement continuel de relation avec le patronat, utilisateur des produits pour maintenir l&rsquo;&eacute;quilibre formation-emploi et le partenariat international.</li>\n</ul>\n<p style="text-align: justify;">A l&rsquo;instar de ses premiers vingt cinq ans, l&rsquo;IST-T compte sur les valeurs qui ont forg&eacute; sa cr&eacute;dibilit&eacute; et sa r&eacute;putation&nbsp;: technicit&eacute; et comp&eacute;tence, discipline et rigueur, bonnes relations humaines. S&rsquo;affranchissant des fronti&egrave;res g&eacute;ographiques gr&acirc;ce &agrave; la formation ouverte et &agrave; distance, notre Institut constitue un v&eacute;ritable outil de d&eacute;veloppement de talents dont d&eacute;pend l&rsquo;&eacute;conomie de notre pays. Connu sur l&rsquo;ensemble du territoire et ouvert sur le monde gr&acirc;ce &agrave; un syst&egrave;me de formation et de recherche incluant la p&eacute;dagogie universitaire et le num&eacute;rique &eacute;ducatif&nbsp;; L&rsquo;IST-T continue &agrave; conna&icirc;tre une remarquable &eacute;volution &agrave; travers les formations correspondant&nbsp;&agrave; un ensemble des nombreuses activit&eacute;s portant sur le d&eacute;veloppement et l&rsquo;&eacute;mergence de notre pays.</p>\n<p style="text-align: justify;">Aussi, avec l&rsquo;ensemble du corps enseignant et du personnel administratif et technique, avec le concours des partenaires professionnels et sous l&rsquo;&eacute;gide du Conseil d&rsquo;Administration de l&rsquo;Institut, nous engageons-nous avec d&eacute;termination et d&eacute;vouement &agrave; la formation, &agrave; relever le double d&eacute;fi qui consiste d&rsquo;abord &agrave; am&eacute;liorer la r&eacute;ussite interne qui se situe en ce moment autour de 95 %, et &agrave; am&eacute;liorer par la suite l&rsquo;efficacit&eacute; externe &agrave; travers une meilleure comp&eacute;titivit&eacute; des produits de formation sur le march&eacute; du travail. La valeur ajout&eacute;e de l&rsquo;IST-T, la synergie des trois cursus, &agrave; savoir TS, TSS et Ing&eacute;nieur, sont aussi&nbsp;&agrave; l&rsquo;origine de notre ambition &agrave; travailler sur des th&egrave;mes f&eacute;d&eacute;rateurs que sont les infrastructures et l&rsquo;am&eacute;nagement, l&rsquo;entrepreneuriat, le transport et la logistique, la p&eacute;dagogie universitaire et l&rsquo;&eacute;nergie renouvelable.</p>\n<p style="text-align: justify;">En rejoignant l&rsquo;IST-T, vous vous donnez la certitude de d&eacute;velopper vos talents et d&rsquo;acqu&eacute;rir des technicit&eacute;s et des comp&eacute;tences exig&eacute;es sur le march&eacute; de l&rsquo;emploi. Nous sommes particuli&egrave;rement fiers de vous offrir une r&eacute;ponse appropri&eacute;e &agrave; vos attentes et un service de qualit&eacute; ayant pour objectif de relever ces d&eacute;fis. Ce site permet d&rsquo;avoir un panorama des actions convenues dans notre Plan de D&eacute;veloppement Institutionnel Evolutif 2015 &ndash; 2020, qui vise &agrave; faire de notre Institut un acteur pour le d&eacute;veloppement pragmatique de notre pays. Je crois que cette visite virtuelle de l&rsquo;IST-T vous apportera les informations pertinentes que vous recherchez sur notre &eacute;tablissement.</p>'),
(8, 2, 2, 'Institut Supérieure de Technologie', 'L’IST d’Antananarivo offre trois types de formation : Les formations de cycle court de type alternatif (Bacc + 2 / Bacc + 3), Les formations d’Ingénieur de grade Master, Les formations de type hybride : Formation Ouverte et A Distance (FOAD) diplômante - Formation présentielle de type initial et de type continu diplômante et qualifiante', '<p style="text-align: justify;">L&rsquo;Institut sup&eacute;rieur de Technologie d&rsquo;Antananarivo (IST-T) est un &eacute;tablissement d&rsquo;enseignement sup&eacute;rieur et de recherche rattach&eacute; au Minist&egrave;re en charge de ce domaine. A la fois centre d&rsquo;enseignement sup&eacute;rieur et de recherche et partenaire des professionnels, l&rsquo;IST-T &oelig;uvre avec succ&egrave;s sur trois actions scientifiques d&eacute;finies dans sa strat&eacute;gie &agrave; l&rsquo;horizon 2020&nbsp;:</p>\n<ul>\n<li>Transfert de connaissances&nbsp;: le respect et la r&eacute;f&eacute;rence au programme de l&rsquo;uniformisation du syst&egrave;me d&rsquo;enseignement sup&eacute;rieur et de recherche &agrave; Madagascar&nbsp;;</li>\n<li>Satisfaire au mieux le besoin du pays sans pour autant laisser de c&ocirc;t&eacute; les enjeux mondiaux&nbsp;: la strat&eacute;gie de promotion de la formation de qualit&eacute; et &eacute;volutive&nbsp;;</li>\n<li>Repousser d&rsquo;avantage les limites du professionnalisme&nbsp;: le d&eacute;veloppement continuel de relation avec le patronat, utilisateur des produits pour maintenir l&rsquo;&eacute;quilibre formation-emploi et le partenariat international.</li>\n</ul>\n<p style="text-align: justify;">A l&rsquo;instar de ses premiers vingt cinq ans, l&rsquo;IST-T compte sur les valeurs qui ont forg&eacute; sa cr&eacute;dibilit&eacute; et sa r&eacute;putation&nbsp;: technicit&eacute; et comp&eacute;tence, discipline et rigueur, bonnes relations humaines. S&rsquo;affranchissant des fronti&egrave;res g&eacute;ographiques gr&acirc;ce &agrave; la formation ouverte et &agrave; distance, notre Institut constitue un v&eacute;ritable outil de d&eacute;veloppement de talents dont d&eacute;pend l&rsquo;&eacute;conomie de notre pays. Connu sur l&rsquo;ensemble du territoire et ouvert sur le monde gr&acirc;ce &agrave; un syst&egrave;me de formation et de recherche incluant la p&eacute;dagogie universitaire et le num&eacute;rique &eacute;ducatif&nbsp;; L&rsquo;IST-T continue &agrave; conna&icirc;tre une remarquable &eacute;volution &agrave; travers les formations correspondant&nbsp;&agrave; un ensemble des nombreuses activit&eacute;s portant sur le d&eacute;veloppement et l&rsquo;&eacute;mergence de notre pays.</p>\n<p style="text-align: justify;">Aussi, avec l&rsquo;ensemble du corps enseignant et du personnel administratif et technique, avec le concours des partenaires professionnels et sous l&rsquo;&eacute;gide du Conseil d&rsquo;Administration de l&rsquo;Institut, nous engageons-nous avec d&eacute;termination et d&eacute;vouement &agrave; la formation, &agrave; relever le double d&eacute;fi qui consiste d&rsquo;abord &agrave; am&eacute;liorer la r&eacute;ussite interne qui se situe en ce moment autour de 95 %, et &agrave; am&eacute;liorer par la suite l&rsquo;efficacit&eacute; externe &agrave; travers une meilleure comp&eacute;titivit&eacute; des produits de formation sur le march&eacute; du travail. La valeur ajout&eacute;e de l&rsquo;IST-T, la synergie des trois cursus, &agrave; savoir TS, TSS et Ing&eacute;nieur, sont aussi&nbsp;&agrave; l&rsquo;origine de notre ambition &agrave; travailler sur des th&egrave;mes f&eacute;d&eacute;rateurs que sont les infrastructures et l&rsquo;am&eacute;nagement, l&rsquo;entrepreneuriat, le transport et la logistique, la p&eacute;dagogie universitaire et l&rsquo;&eacute;nergie renouvelable.</p>\n<p style="text-align: justify;">En rejoignant l&rsquo;IST-T, vous vous donnez la certitude de d&eacute;velopper vos talents et d&rsquo;acqu&eacute;rir des technicit&eacute;s et des comp&eacute;tences exig&eacute;es sur le march&eacute; de l&rsquo;emploi. Nous sommes particuli&egrave;rement fiers de vous offrir une r&eacute;ponse appropri&eacute;e &agrave; vos attentes et un service de qualit&eacute; ayant pour objectif de relever ces d&eacute;fis. Ce site permet d&rsquo;avoir un panorama des actions convenues dans notre Plan de D&eacute;veloppement Institutionnel Evolutif 2015 &ndash; 2020, qui vise &agrave; faire de notre Institut un acteur pour le d&eacute;veloppement pragmatique de notre pays. Je crois que cette visite virtuelle de l&rsquo;IST-T vous apportera les informations pertinentes que vous recherchez sur notre &eacute;tablissement.</p>'),
(9, 2, 3, 'mg. name . Ecole Supérieure de Technologie', 'mg. courte description . Ecole Supérieure de Technologie', '<p>mg. description .</p> <p>desc Ecole Supérieure de Technologie</p>'),
(10, 2, 4, 'it. name . Ecole Supérieure de Technologie', 'it. courte description . Ecole Supérieure de Technologie', '<p>it. description .</p> <p>desc Ecole Supérieure de Technologie</p>'),
(11, 2, 5, 'es. name . Ecole Supérieure de Technologie', 'es. courte description . Ecole Supérieure de Technologie', '<p>es. description .</p> <p>desc Ecole Supérieure de Technologie</p>'),
(12, 2, 6, 'de. name . Ecole Supérieure de Technologie', 'de. courte description . Ecole Supérieure de Technologie', '<p>de. description .</p> <p>desc Ecole Supérieure de Technologie</p>'),
(13, 3, 1, 'Athénée Saint Joseph Antsirabe', 'L’ASJA propose une architecture de ses offres de formation en 2 domaines : Sciences et Technologies (ST) et Sciences de la Société (SSo). Le 1er domaine (ST) comporte 4 mentions ; Sciences agronomiques, Informatique, Sciences de la Terre, Textile et Habillement et le 2ème domaine (SSo), les mentions Economie et Commerce et Droit. Chaque mention doit pouvoir offrir une gamme de formations capable de répondre à la demande croissante de polyvalence et multi-compétence dans les métiers et les fonctions exercées.', '<div id="apDiv2">\n<p align="justify">D&egrave;s son ouverture en 2000, l&rsquo;ASJA a pour vocation d&rsquo;assurer la formation professionnalisante dans divers domaines d&rsquo;activit&eacute;s r&eacute;pondant aux besoins socio-&eacute;conomiques du pays. Pour satisfaire &agrave; ces derniers, les offres de formation ont pris en compte les r&eacute;alit&eacute;s socio-&eacute;conomiques de la r&eacute;gion de Vakinankaratra (i-e agro-&eacute;levage). Les formations pro-naissant des besoins constat&eacute;s sont alors mis en place avec les partenaires industriels socio-&eacute;conomiques. Aujourd&rsquo;hui, l&rsquo;effectif est de 1014 &eacute;tudiants encadr&eacute;s par 155 enseignants (universitaires et cadres d&rsquo;entreprises).</p>\n<p align="justify">L&rsquo;ASJA s&rsquo;est pr&eacute;par&eacute;e &agrave; rentrer dans le syst&egrave;me LMD, en 2004. Les principales actions concernaient alors en l&rsquo;&eacute;quipement des laboratoires et en l&rsquo;&eacute;laboration des programmes d&rsquo;enseignement selon l&rsquo;esprit du syst&egrave;me LMD, et cela gr&acirc;ce &agrave; l&rsquo;appui des Universit&eacute;s partenaires &eacute;trang&egrave;res et au financement du projet MADSUP relay&eacute; depuis 2007 par le projet FSP pour d&eacute;marrer la mise en place de ce nouveau syst&egrave;me. L&rsquo;ASJA, actuellement, apr&egrave;s s&rsquo;&ecirc;tre bien pr&eacute;par&eacute;e est d&eacute;cid&eacute;e, &agrave; la sortie des textes officiels du MESUPRES, &agrave; demander l&rsquo;habilitation de ses offres de formation dans le cadre du syst&egrave;me LMD, et se pr&eacute;pare &eacute;galement &agrave; postuler sa candidature en vue de la reconnaissance &agrave; l&rsquo;accr&eacute;ditation ult&eacute;rieurement.</p>\n<p align="justify">Dans le processus de mise en place du syst&egrave;me LMD, le dipl&ocirc;me de DUT (Bac+3ans) va &ecirc;tre transform&eacute; en <em><strong>Licence Professionnelle </strong></em>et celui de l&rsquo;Ing&eacute;niorat (Bac +5ans) en <strong><em>Master Professionnel. </em></strong>Les contours de la Formation Professionnelle doivent tenir compte des points suivants :</p>\n<ul>\n<li>Stages en entreprise</li>\n<li>Etudes des cas ou de projets</li>\n<li>Enseignements assur&eacute;s par des professionnels</li>\n<li>Enseignements connexes (langues, &eacute;conomie, droit, &eacute;thique&hellip;)</li>\n<li>Suivi et analyse de l&rsquo;insertion des &eacute;tudiants (CIP)</li>\n</ul>\n<p>Pour le financement du syst&egrave;me, la recherche de nouvelles ressources s&rsquo;impose : ex : la formation continue et l&rsquo;ASJA y pense s&eacute;rieusement. La mission fondamentale de l&rsquo;ASJA conduit &agrave; fixer les objectifs suivants :</p>\n<ul>\n<li>Recherche de l&rsquo;excellence dans tous les domaines de connaissance</li>\n<li>Promotion de la science, de la culture, et du progr&egrave;s social</li>\n<li>Promotion sociale avec la participation des structures nationales comp&eacute;tentes et des milieux socio-professionnels , notamment en ce qui concerne la d&eacute;finition des programmes et l&rsquo;organisation des ET,EP et stages.</li>\n</ul>\n</div>'),
(14, 3, 2, 'Athénée Saint Joseph Antsirabe', 'L’ASJA propose une architecture de ses offres de formation en 2 domaines : Sciences et Technologies (ST) et Sciences de la Société (SSo). Le 1er domaine (ST) comporte 4 mentions ; Sciences agronomiques, Informatique, Sciences de la Terre, Textile et Habillement et le 2ème domaine (SSo), les mentions Economie et Commerce et Droit. Chaque mention doit pouvoir offrir une gamme de formations capable de répondre à la demande croissante de polyvalence et multi-compétence dans les métiers et les fonctions exercées.', '<div id="apDiv2">\n<p align="justify">D&egrave;s son ouverture en 2000, l&rsquo;ASJA a pour vocation d&rsquo;assurer la formation professionnalisante dans divers domaines d&rsquo;activit&eacute;s r&eacute;pondant aux besoins socio-&eacute;conomiques du pays. Pour satisfaire &agrave; ces derniers, les offres de formation ont pris en compte les r&eacute;alit&eacute;s socio-&eacute;conomiques de la r&eacute;gion de Vakinankaratra (i-e agro-&eacute;levage). Les formations pro-naissant des besoins constat&eacute;s sont alors mis en place avec les partenaires industriels socio-&eacute;conomiques. Aujourd&rsquo;hui, l&rsquo;effectif est de 1014 &eacute;tudiants encadr&eacute;s par 155 enseignants (universitaires et cadres d&rsquo;entreprises).</p>\n<p align="justify">L&rsquo;ASJA s&rsquo;est pr&eacute;par&eacute;e &agrave; rentrer dans le syst&egrave;me LMD, en 2004. Les principales actions concernaient alors en l&rsquo;&eacute;quipement des laboratoires et en l&rsquo;&eacute;laboration des programmes d&rsquo;enseignement selon l&rsquo;esprit du syst&egrave;me LMD, et cela gr&acirc;ce &agrave; l&rsquo;appui des Universit&eacute;s partenaires &eacute;trang&egrave;res et au financement du projet MADSUP relay&eacute; depuis 2007 par le projet FSP pour d&eacute;marrer la mise en place de ce nouveau syst&egrave;me. L&rsquo;ASJA, actuellement, apr&egrave;s s&rsquo;&ecirc;tre bien pr&eacute;par&eacute;e est d&eacute;cid&eacute;e, &agrave; la sortie des textes officiels du MESUPRES, &agrave; demander l&rsquo;habilitation de ses offres de formation dans le cadre du syst&egrave;me LMD, et se pr&eacute;pare &eacute;galement &agrave; postuler sa candidature en vue de la reconnaissance &agrave; l&rsquo;accr&eacute;ditation ult&eacute;rieurement.</p>\n<p align="justify">Dans le processus de mise en place du syst&egrave;me LMD, le dipl&ocirc;me de DUT (Bac+3ans) va &ecirc;tre transform&eacute; en <em><strong>Licence Professionnelle </strong></em>et celui de l&rsquo;Ing&eacute;niorat (Bac +5ans) en <strong><em>Master Professionnel. </em></strong>Les contours de la Formation Professionnelle doivent tenir compte des points suivants :</p>\n<ul>\n<li>Stages en entreprise</li>\n<li>Etudes des cas ou de projets</li>\n<li>Enseignements assur&eacute;s par des professionnels</li>\n<li>Enseignements connexes (langues, &eacute;conomie, droit, &eacute;thique&hellip;)</li>\n<li>Suivi et analyse de l&rsquo;insertion des &eacute;tudiants (CIP)</li>\n</ul>\n<p>Pour le financement du syst&egrave;me, la recherche de nouvelles ressources s&rsquo;impose : ex : la formation continue et l&rsquo;ASJA y pense s&eacute;rieusement. La mission fondamentale de l&rsquo;ASJA conduit &agrave; fixer les objectifs suivants :</p>\n<ul>\n<li>Recherche de l&rsquo;excellence dans tous les domaines de connaissance</li>\n<li>Promotion de la science, de la culture, et du progr&egrave;s social</li>\n<li>Promotion sociale avec la participation des structures nationales comp&eacute;tentes et des milieux socio-professionnels , notamment en ce qui concerne la d&eacute;finition des programmes et l&rsquo;organisation des ET,EP et stages.</li>\n</ul>\n</div>'),
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
(97, 17, 1, 'Institut Supérieur des Paramédicaux Novateurs de Madagascar', 'Le Groupe In.S.P.N.Mad est la première école privée paramédicale ayant une couverture nationale au niveau des Licences embrassant quatre spécialités, en l’occurrence, l’infirmerie généraliste, la maïeutique (Sage-femme), la kinésithérapie, les techniques en Laboratoire. En outre il s’est doté d’une école à niveau Master Professionnel comportant trois filières : l’anesthésie et réanimation, le management de qualité de soins et la kinésithérapie.', '<p style="text-align: justify;">Le Groupe In.S.P.N.Mad est la premi&egrave;re &eacute;cole priv&eacute;e param&eacute;dicale ayant une couverture nationale au niveau des Licences embrassant quatre sp&eacute;cialit&eacute;s, en l&rsquo;occurrence, l&rsquo;infirmerie g&eacute;n&eacute;raliste, la ma&iuml;eutique (Sage-femme), la kin&eacute;sith&eacute;rapie, les techniques en Laboratoire. En outre il s&rsquo;est dot&eacute; d&rsquo;une &eacute;cole &agrave; niveau Master Professionnel comportant trois fili&egrave;res : l&rsquo;anesth&eacute;sie et r&eacute;animation, le management de qualit&eacute; de soins et la kin&eacute;sith&eacute;rapie.&nbsp;</p>\n<p style="text-align: justify;">Le Groupe s&rsquo;engage actuellement, dans ses modalit&eacute;s de formation &agrave; combiner le Syst&egrave;me LMD, le Syst&egrave;me privil&eacute;giant la maitrise de la dext&eacute;rit&eacute; manuelle et les imp&eacute;ratifs de recrutement internationaux. En effet, il est li&eacute; depuis le mois de septembre 2015 &agrave; une convention de partenariat technique avec la plus grande Clinique priv&eacute;e de l&rsquo;&icirc;le Maurice, &agrave; savoir la clinique Fortis Darney, qui re&ccedil;oit des stagiaires de l&rsquo;In.S.P.N.Mad &agrave; partir du niveau de troisi&egrave;me ann&eacute;e de Licence, et recrute &eacute;galement des dipl&ocirc;m&eacute;s de notre institution. Pour le compte de cette ann&eacute;e acad&eacute;mique 2014-2015, 28 dipl&ocirc;m&eacute;s ont &eacute;t&eacute; int&eacute;gr&eacute;s parmi le personnel technique de la dite Clinique. &nbsp;<br />Bref, les mots du Pr&eacute;sident Directeur G&eacute;n&eacute;ral / Coordonnateur National des Programmes se r&eacute;sume en trois termes cl&eacute;s : D&eacute;vouement, Autodiscipline et Progr&egrave;s.</p>'),
(98, 17, 2, 'Institut Supérieur des Paramédicaux Novateurs de Madagascar', 'Le Groupe In.S.P.N.Mad est la première école privée paramédicale ayant une couverture nationale au niveau des Licences embrassant quatre spécialités, en l’occurrence, l’infirmerie généraliste, la maïeutique (Sage-femme), la kinésithérapie, les techniques en Laboratoire. En outre il s’est doté d’une école à niveau Master Professionnel comportant trois filières : l’anesthésie et réanimation, le management de qualité de soins et la kinésithérapie.', '<p style="text-align: justify;">Le Groupe In.S.P.N.Mad est la premi&egrave;re &eacute;cole priv&eacute;e param&eacute;dicale ayant une couverture nationale au niveau des Licences embrassant quatre sp&eacute;cialit&eacute;s, en l&rsquo;occurrence, l&rsquo;infirmerie g&eacute;n&eacute;raliste, la ma&iuml;eutique (Sage-femme), la kin&eacute;sith&eacute;rapie, les techniques en Laboratoire. En outre il s&rsquo;est dot&eacute; d&rsquo;une &eacute;cole &agrave; niveau Master Professionnel comportant trois fili&egrave;res : l&rsquo;anesth&eacute;sie et r&eacute;animation, le management de qualit&eacute; de soins et la kin&eacute;sith&eacute;rapie.&nbsp;</p>\n<p style="text-align: justify;">Le Groupe s&rsquo;engage actuellement, dans ses modalit&eacute;s de formation &agrave; combiner le Syst&egrave;me LMD, le Syst&egrave;me privil&eacute;giant la maitrise de la dext&eacute;rit&eacute; manuelle et les imp&eacute;ratifs de recrutement internationaux. En effet, il est li&eacute; depuis le mois de septembre 2015 &agrave; une convention de partenariat technique avec la plus grande Clinique priv&eacute;e de l&rsquo;&icirc;le Maurice, &agrave; savoir la clinique Fortis Darney, qui re&ccedil;oit des stagiaires de l&rsquo;In.S.P.N.Mad &agrave; partir du niveau de troisi&egrave;me ann&eacute;e de Licence, et recrute &eacute;galement des dipl&ocirc;m&eacute;s de notre institution. Pour le compte de cette ann&eacute;e acad&eacute;mique 2014-2015, 28 dipl&ocirc;m&eacute;s ont &eacute;t&eacute; int&eacute;gr&eacute;s parmi le personnel technique de la dite Clinique. &nbsp;<br />Bref, les mots du Pr&eacute;sident Directeur G&eacute;n&eacute;ral / Coordonnateur National des Programmes se r&eacute;sume en trois termes cl&eacute;s : D&eacute;vouement, Autodiscipline et Progr&egrave;s.</p>');
INSERT INTO `sl_school_translate` (`id`, `school_id`, `locale_id`, `name`, `short_description`, `description`) VALUES
(99, 17, 3, 'Institut Supérieur des Paramédicaux Novateurs de Madagascar', 'Le Groupe In.S.P.N.Mad est la première école privée paramédicale ayant une couverture nationale au niveau des Licences embrassant quatre spécialités, en l’occurrence, l’infirmerie généraliste, la maïeutique (Sage-femme), la kinésithérapie, les techniques en Laboratoire. En outre il s’est doté d’une école à niveau Master Professionnel comportant trois filières : l’anesthésie et réanimation, le management de qualité de soins et la kinésithérapie.', '<p style="text-align: justify;">Le Groupe In.S.P.N.Mad est la premi&egrave;re &eacute;cole priv&eacute;e param&eacute;dicale ayant une couverture nationale au niveau des Licences embrassant quatre sp&eacute;cialit&eacute;s, en l&rsquo;occurrence, l&rsquo;infirmerie g&eacute;n&eacute;raliste, la ma&iuml;eutique (Sage-femme), la kin&eacute;sith&eacute;rapie, les techniques en Laboratoire. En outre il s&rsquo;est dot&eacute; d&rsquo;une &eacute;cole &agrave; niveau Master Professionnel comportant trois fili&egrave;res : l&rsquo;anesth&eacute;sie et r&eacute;animation, le management de qualit&eacute; de soins et la kin&eacute;sith&eacute;rapie.&nbsp;</p>\n<p style="text-align: justify;">Le Groupe s&rsquo;engage actuellement, dans ses modalit&eacute;s de formation &agrave; combiner le Syst&egrave;me LMD, le Syst&egrave;me privil&eacute;giant la maitrise de la dext&eacute;rit&eacute; manuelle et les imp&eacute;ratifs de recrutement internationaux. En effet, il est li&eacute; depuis le mois de septembre 2015 &agrave; une convention de partenariat technique avec la plus grande Clinique priv&eacute;e de l&rsquo;&icirc;le Maurice, &agrave; savoir la clinique Fortis Darney, qui re&ccedil;oit des stagiaires de l&rsquo;In.S.P.N.Mad &agrave; partir du niveau de troisi&egrave;me ann&eacute;e de Licence, et recrute &eacute;galement des dipl&ocirc;m&eacute;s de notre institution. Pour le compte de cette ann&eacute;e acad&eacute;mique 2014-2015, 28 dipl&ocirc;m&eacute;s ont &eacute;t&eacute; int&eacute;gr&eacute;s parmi le personnel technique de la dite Clinique. &nbsp;<br />Bref, les mots du Pr&eacute;sident Directeur G&eacute;n&eacute;ral / Coordonnateur National des Programmes se r&eacute;sume en trois termes cl&eacute;s : D&eacute;vouement, Autodiscipline et Progr&egrave;s.</p>'),
(100, 17, 4, 'Institut Supérieur des Paramédicaux Novateurs de Madagascar', 'Le Groupe In.S.P.N.Mad est la première école privée paramédicale ayant une couverture nationale au niveau des Licences embrassant quatre spécialités, en l’occurrence, l’infirmerie généraliste, la maïeutique (Sage-femme), la kinésithérapie, les techniques en Laboratoire. En outre il s’est doté d’une école à niveau Master Professionnel comportant trois filières : l’anesthésie et réanimation, le management de qualité de soins et la kinésithérapie.', '<p style="text-align: justify;">Le Groupe In.S.P.N.Mad est la premi&egrave;re &eacute;cole priv&eacute;e param&eacute;dicale ayant une couverture nationale au niveau des Licences embrassant quatre sp&eacute;cialit&eacute;s, en l&rsquo;occurrence, l&rsquo;infirmerie g&eacute;n&eacute;raliste, la ma&iuml;eutique (Sage-femme), la kin&eacute;sith&eacute;rapie, les techniques en Laboratoire. En outre il s&rsquo;est dot&eacute; d&rsquo;une &eacute;cole &agrave; niveau Master Professionnel comportant trois fili&egrave;res : l&rsquo;anesth&eacute;sie et r&eacute;animation, le management de qualit&eacute; de soins et la kin&eacute;sith&eacute;rapie.&nbsp;</p>\n<p style="text-align: justify;">Le Groupe s&rsquo;engage actuellement, dans ses modalit&eacute;s de formation &agrave; combiner le Syst&egrave;me LMD, le Syst&egrave;me privil&eacute;giant la maitrise de la dext&eacute;rit&eacute; manuelle et les imp&eacute;ratifs de recrutement internationaux. En effet, il est li&eacute; depuis le mois de septembre 2015 &agrave; une convention de partenariat technique avec la plus grande Clinique priv&eacute;e de l&rsquo;&icirc;le Maurice, &agrave; savoir la clinique Fortis Darney, qui re&ccedil;oit des stagiaires de l&rsquo;In.S.P.N.Mad &agrave; partir du niveau de troisi&egrave;me ann&eacute;e de Licence, et recrute &eacute;galement des dipl&ocirc;m&eacute;s de notre institution. Pour le compte de cette ann&eacute;e acad&eacute;mique 2014-2015, 28 dipl&ocirc;m&eacute;s ont &eacute;t&eacute; int&eacute;gr&eacute;s parmi le personnel technique de la dite Clinique. &nbsp;<br />Bref, les mots du Pr&eacute;sident Directeur G&eacute;n&eacute;ral / Coordonnateur National des Programmes se r&eacute;sume en trois termes cl&eacute;s : D&eacute;vouement, Autodiscipline et Progr&egrave;s.</p>'),
(101, 17, 5, 'Institut Supérieur des Paramédicaux Novateurs de Madagascar', 'Le Groupe In.S.P.N.Mad est la première école privée paramédicale ayant une couverture nationale au niveau des Licences embrassant quatre spécialités, en l’occurrence, l’infirmerie généraliste, la maïeutique (Sage-femme), la kinésithérapie, les techniques en Laboratoire. En outre il s’est doté d’une école à niveau Master Professionnel comportant trois filières : l’anesthésie et réanimation, le management de qualité de soins et la kinésithérapie.', '<p style="text-align: justify;">Le Groupe In.S.P.N.Mad est la premi&egrave;re &eacute;cole priv&eacute;e param&eacute;dicale ayant une couverture nationale au niveau des Licences embrassant quatre sp&eacute;cialit&eacute;s, en l&rsquo;occurrence, l&rsquo;infirmerie g&eacute;n&eacute;raliste, la ma&iuml;eutique (Sage-femme), la kin&eacute;sith&eacute;rapie, les techniques en Laboratoire. En outre il s&rsquo;est dot&eacute; d&rsquo;une &eacute;cole &agrave; niveau Master Professionnel comportant trois fili&egrave;res : l&rsquo;anesth&eacute;sie et r&eacute;animation, le management de qualit&eacute; de soins et la kin&eacute;sith&eacute;rapie.&nbsp;</p>\n<p style="text-align: justify;">Le Groupe s&rsquo;engage actuellement, dans ses modalit&eacute;s de formation &agrave; combiner le Syst&egrave;me LMD, le Syst&egrave;me privil&eacute;giant la maitrise de la dext&eacute;rit&eacute; manuelle et les imp&eacute;ratifs de recrutement internationaux. En effet, il est li&eacute; depuis le mois de septembre 2015 &agrave; une convention de partenariat technique avec la plus grande Clinique priv&eacute;e de l&rsquo;&icirc;le Maurice, &agrave; savoir la clinique Fortis Darney, qui re&ccedil;oit des stagiaires de l&rsquo;In.S.P.N.Mad &agrave; partir du niveau de troisi&egrave;me ann&eacute;e de Licence, et recrute &eacute;galement des dipl&ocirc;m&eacute;s de notre institution. Pour le compte de cette ann&eacute;e acad&eacute;mique 2014-2015, 28 dipl&ocirc;m&eacute;s ont &eacute;t&eacute; int&eacute;gr&eacute;s parmi le personnel technique de la dite Clinique. &nbsp;<br />Bref, les mots du Pr&eacute;sident Directeur G&eacute;n&eacute;ral / Coordonnateur National des Programmes se r&eacute;sume en trois termes cl&eacute;s : D&eacute;vouement, Autodiscipline et Progr&egrave;s.</p>'),
(102, 17, 6, 'Institut Supérieur des Paramédicaux Novateurs de Madagascar', 'Le Groupe In.S.P.N.Mad est la première école privée paramédicale ayant une couverture nationale au niveau des Licences embrassant quatre spécialités, en l’occurrence, l’infirmerie généraliste, la maïeutique (Sage-femme), la kinésithérapie, les techniques en Laboratoire. En outre il s’est doté d’une école à niveau Master Professionnel comportant trois filières : l’anesthésie et réanimation, le management de qualité de soins et la kinésithérapie.', '<p style="text-align: justify;">Le Groupe In.S.P.N.Mad est la premi&egrave;re &eacute;cole priv&eacute;e param&eacute;dicale ayant une couverture nationale au niveau des Licences embrassant quatre sp&eacute;cialit&eacute;s, en l&rsquo;occurrence, l&rsquo;infirmerie g&eacute;n&eacute;raliste, la ma&iuml;eutique (Sage-femme), la kin&eacute;sith&eacute;rapie, les techniques en Laboratoire. En outre il s&rsquo;est dot&eacute; d&rsquo;une &eacute;cole &agrave; niveau Master Professionnel comportant trois fili&egrave;res : l&rsquo;anesth&eacute;sie et r&eacute;animation, le management de qualit&eacute; de soins et la kin&eacute;sith&eacute;rapie.&nbsp;</p>\n<p style="text-align: justify;">Le Groupe s&rsquo;engage actuellement, dans ses modalit&eacute;s de formation &agrave; combiner le Syst&egrave;me LMD, le Syst&egrave;me privil&eacute;giant la maitrise de la dext&eacute;rit&eacute; manuelle et les imp&eacute;ratifs de recrutement internationaux. En effet, il est li&eacute; depuis le mois de septembre 2015 &agrave; une convention de partenariat technique avec la plus grande Clinique priv&eacute;e de l&rsquo;&icirc;le Maurice, &agrave; savoir la clinique Fortis Darney, qui re&ccedil;oit des stagiaires de l&rsquo;In.S.P.N.Mad &agrave; partir du niveau de troisi&egrave;me ann&eacute;e de Licence, et recrute &eacute;galement des dipl&ocirc;m&eacute;s de notre institution. Pour le compte de cette ann&eacute;e acad&eacute;mique 2014-2015, 28 dipl&ocirc;m&eacute;s ont &eacute;t&eacute; int&eacute;gr&eacute;s parmi le personnel technique de la dite Clinique. &nbsp;<br />Bref, les mots du Pr&eacute;sident Directeur G&eacute;n&eacute;ral / Coordonnateur National des Programmes se r&eacute;sume en trois termes cl&eacute;s : D&eacute;vouement, Autodiscipline et Progr&egrave;s.</p>'),
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
(135, 23, 3, 'Verum ad istam omnem orationem', 'mg. Short description .Verum ad istam omnem orationem', 'mg. Description .Verum ad istam omnem orationem'),
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
(169, 29, 1, 'Institut Supérieur Polytechnique de Madagascar', 'ISPM vous offre une formation habilitée (Ministère de l''Enseignement Supérieur et Ministère de la fonction publique) à BACC+3 (Licence) et à BACC+5 (Master) dans les mentions suivantes : Informatique et Télécommunications, Génie Industriel, Génie Civil et Architecture, Droit et Techniques des Affaires, Biotechnologie et Agronomie, Tourisme', '<p>ISPM vous offre une formation habilit&eacute;e (Minist&egrave;re de l''Enseignement Sup&eacute;rieur et Minist&egrave;re de la fonction publique) &agrave; BACC+3 (Licence) et &agrave; BACC+5 (Master) dans les mentions suivantes : Informatique et T&eacute;l&eacute;communications, G&eacute;nie Industriel, G&eacute;nie Civil et Architecture, Droit et Techniques des Affaires, Biotechnologie et Agronomie, Tourisme</p>'),
(170, 29, 2, 'Institut Supérieur Polytechnique de Madagascar', 'ISPM vous offre une formation habilitée (Ministère de l''Enseignement Supérieur et Ministère de la fonction publique) à BACC+3 (Licence) et à BACC+5 (Master) dans les mentions suivantes : Informatique et Télécommunications, Génie Industriel, Génie Civil et Architecture, Droit et Techniques des Affaires, Biotechnologie et Agronomie, Tourisme', '<p>ISPM vous offre une formation habilit&eacute;e (Minist&egrave;re de l''Enseignement Sup&eacute;rieur et Minist&egrave;re de la fonction publique) &agrave; BACC+3 (Licence) et &agrave; BACC+5 (Master) dans les mentions suivantes : Informatique et T&eacute;l&eacute;communications, G&eacute;nie Industriel, G&eacute;nie Civil et Architecture, Droit et Techniques des Affaires, Biotechnologie et Agronomie, Tourisme</p>'),
(171, 29, 3, 'Institut Supérieur Polytechnique de Madagascar', 'ISPM vous offre une formation habilitée (Ministère de l''Enseignement Supérieur et Ministère de la fonction publique) à BACC+3 (Licence) et à BACC+5 (Master) dans les mentions suivantes : Informatique et Télécommunications, Génie Industriel, Génie Civil et Architecture, Droit et Techniques des Affaires, Biotechnologie et Agronomie, Tourisme', '<p>ISPM vous offre une formation habilit&eacute;e (Minist&egrave;re de l''Enseignement Sup&eacute;rieur et Minist&egrave;re de la fonction publique) &agrave; BACC+3 (Licence) et &agrave; BACC+5 (Master) dans les mentions suivantes : Informatique et T&eacute;l&eacute;communications, G&eacute;nie Industriel, G&eacute;nie Civil et Architecture, Droit et Techniques des Affaires, Biotechnologie et Agronomie, Tourisme</p>'),
(172, 29, 4, 'Institut Supérieur Polytechnique de Madagascar', 'ISPM vous offre une formation habilitée (Ministère de l''Enseignement Supérieur et Ministère de la fonction publique) à BACC+3 (Licence) et à BACC+5 (Master) dans les mentions suivantes : Informatique et Télécommunications, Génie Industriel, Génie Civil et Architecture, Droit et Techniques des Affaires, Biotechnologie et Agronomie, Tourisme', '<p>ISPM vous offre une formation habilit&eacute;e (Minist&egrave;re de l''Enseignement Sup&eacute;rieur et Minist&egrave;re de la fonction publique) &agrave; BACC+3 (Licence) et &agrave; BACC+5 (Master) dans les mentions suivantes : Informatique et T&eacute;l&eacute;communications, G&eacute;nie Industriel, G&eacute;nie Civil et Architecture, Droit et Techniques des Affaires, Biotechnologie et Agronomie, Tourisme</p>'),
(173, 29, 5, 'Institut Supérieur Polytechnique de Madagascar', 'ISPM vous offre une formation habilitée (Ministère de l''Enseignement Supérieur et Ministère de la fonction publique) à BACC+3 (Licence) et à BACC+5 (Master) dans les mentions suivantes : Informatique et Télécommunications, Génie Industriel, Génie Civil et Architecture, Droit et Techniques des Affaires, Biotechnologie et Agronomie, Tourisme', '<p>ISPM vous offre une formation habilit&eacute;e (Minist&egrave;re de l''Enseignement Sup&eacute;rieur et Minist&egrave;re de la fonction publique) &agrave; BACC+3 (Licence) et &agrave; BACC+5 (Master) dans les mentions suivantes : Informatique et T&eacute;l&eacute;communications, G&eacute;nie Industriel, G&eacute;nie Civil et Architecture, Droit et Techniques des Affaires, Biotechnologie et Agronomie, Tourisme</p>'),
(174, 29, 6, 'Institut Supérieur Polytechnique de Madagascar', 'ISPM vous offre une formation habilitée (Ministère de l''Enseignement Supérieur et Ministère de la fonction publique) à BACC+3 (Licence) et à BACC+5 (Master) dans les mentions suivantes : Informatique et Télécommunications, Génie Industriel, Génie Civil et Architecture, Droit et Techniques des Affaires, Biotechnologie et Agronomie, Tourisme', '<p>ISPM vous offre une formation habilit&eacute;e (Minist&egrave;re de l''Enseignement Sup&eacute;rieur et Minist&egrave;re de la fonction publique) &agrave; BACC+3 (Licence) et &agrave; BACC+5 (Master) dans les mentions suivantes : Informatique et T&eacute;l&eacute;communications, G&eacute;nie Industriel, G&eacute;nie Civil et Architecture, Droit et Techniques des Affaires, Biotechnologie et Agronomie, Tourisme</p>'),
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
(185, 31, 5, 'Ecole internationale d''hôtellerie et de management VATEL', 'Parmi plus de 42 établissements tous prestigieux, le groupe Vatel et ses 35 campus dans le monde, remporte le titre de ʺMeilleure Ecole Hôtelièreʺ lors de la 17e édition des Worldwide Hospitality Awards qui a rassemblé hier soir 14 novembre 2016, plus de 1 000 professionnels de l''hôtellerie internationale dans le salon Opéra de l’InterContinental Paris le Grand.\n\nC’est toute une industrie qui exprime ainsi au groupe Vatel sa reconnaissance et sa confiance.', '<p>Parmi plus de 42 &eacute;tablissements tous prestigieux, le groupe Vatel et ses 35 campus dans le monde, remporte le titre de ʺMeilleure Ecole H&ocirc;teli&egrave;reʺ lors de la 17e &eacute;dition des Worldwide Hospitality Awards qui a rassembl&eacute; hier soir 14 novembre 2016, plus de 1 000 professionnels de l''h&ocirc;tellerie internationale dans le salon Op&eacute;ra de l&rsquo;InterContinental Paris le Grand.<br /><br />C&rsquo;est toute une industrie qui exprime ainsi au groupe Vatel sa reconnaissance et sa confiance.</p>');
INSERT INTO `sl_school_translate` (`id`, `school_id`, `locale_id`, `name`, `short_description`, `description`) VALUES
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
(199, 34, 1, 'Centre de Formation des Ressources Humaines', 'CFRH INSTITUTE est le premier Établissement Supérieur Privé à Madagascar se spécialisant dans le domaine de la « GESTION DES RESSOURCES HUMAINES ». Créé en 2004, CFRH INSTITUTE a pour vocation de former les futurs responsables en Ressources Humaines mais également d’apporter un renforcement de compétence aux travailleurs déjà en activité. Fort de trois agréments de l’Etat, il délivre des diplômes reconnus par le Ministère de la Fonction Publique du travail et des Lois Sociales. CFRH INSTITUTE est dirigé et animé par une équipe de professionnels consultants ayant des années d’expériences confirmées dans le secteur des ressources humaines au sein de groupes de sociétés les plus reconnues de la place.', '<p style="text-align: justify;">CFRH INSTITUTE est le premier &Eacute;tablissement Sup&eacute;rieur Priv&eacute; &agrave; Madagascar se sp&eacute;cialisant dans le domaine de la &laquo; GESTION DES RESSOURCES HUMAINES &raquo;. Cr&eacute;&eacute; en 2004, CFRH INSTITUTE a pour vocation de former les futurs responsables en Ressources Humaines mais &eacute;galement d&rsquo;apporter un renforcement de comp&eacute;tence aux travailleurs d&eacute;j&agrave; en activit&eacute;. Fort de trois agr&eacute;ments de l&rsquo;Etat, il d&eacute;livre des dipl&ocirc;mes reconnus par le Minist&egrave;re de la Fonction Publique du travail et des Lois Sociales. CFRH INSTITUTE est dirig&eacute; et anim&eacute; par une &eacute;quipe de professionnels consultants ayant des ann&eacute;es d&rsquo;exp&eacute;riences confirm&eacute;es dans le secteur des ressources humaines au sein de groupes de soci&eacute;t&eacute;s les plus reconnues de la place.<br /><br />NOS FORMATIONS :<br /><br />I. FORMATION CONTINUE en &laquo; PACK FORMATION &raquo; :<br />CFRH INSTITUTE a opt&eacute; pour ce syst&egrave;me incluant les trois (3) &eacute;l&eacute;ments suivants, pour un m&ecirc;me CO&Ucirc;T DE FORMATION, &agrave; savoir :<br />1) COURS ASSIST&Eacute; EN COURS DU SOIR<br />Du Lundi au Vendredi (sauf le Mercredi)<br />Horaire : de 17h30 &agrave; 19h00<br />2) COURS ASSIST&Eacute; EN COURS DU SAMEDI<br />Horaire : de 08h00 &agrave; 12h00<br />3) COURS PAR CORRESPONDANCE OU &Agrave; DISTANCE<br />Envoi des Cours une fois par semaine sous fichier PDF :<br />&bull; 1 fichier pour le module &laquo; ADMINSTRATION DU PERSONNEL &raquo;<br />&bull; 1 fichier pour le module &laquo; GESTION&nbsp; DES&nbsp; RESSOURCES HUMAINES &raquo;<br />Sanctions :<br />1)&nbsp; DIPL&Ocirc;ME&nbsp; DE&nbsp; FIN&nbsp; DE&nbsp; FORMATION&nbsp; EN ADMINISTRATION DU PERSONNEL<br />2)&nbsp; DIPL&Ocirc;ME&nbsp; DE&nbsp; FIN&nbsp; DE&nbsp; FORMATION&nbsp; EN&nbsp; GESTION&nbsp; DES RESSOURCES HUMAINES<br />Cours de commerce international<br /><br />II. FORMATION INITIALE<br />Pour les Bacheliers, toutes s&eacute;ries,&nbsp; CFRH INSTITUTE propose des &eacute;tudes sup&eacute;rieures en salle sur la fili&egrave;re &laquo; GESTION DES RESSOURCES HUMAINES &raquo;, et dont la dur&eacute;e est de deux (2) ans. En deuxi&egrave;me ann&eacute;e, les &eacute;tudiants effectueront des stages en entreprise, et pr&eacute;senteront leur M&eacute;moire de fin d&rsquo;&Eacute;tudes en vue de l&rsquo;obtention du &laquo; D.T.S. ou&nbsp; Dipl&ocirc;me&nbsp; de&nbsp; Technicien&nbsp; Sup&eacute;rieur&nbsp; en&nbsp; GESTION&nbsp; DES&nbsp; RESSOURCES HUMAINES &raquo;.<br /><br />III. FORMATION A TITRE PRIVE<br />CFRH INSTITUTE dispose des formations &agrave; titre priv&eacute; pour les entreprises ou des particuliers qui pr&eacute;f&egrave;rent apprendre la &laquo; GESTION&nbsp; DES&nbsp; RESSOURCES&nbsp; HUMAINES &raquo; en dehors des heures d&rsquo;&eacute;tudes au CFRH INSTITUTE, et dans leurs locaux (selon leur convenance personnelle).</p>'),
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
(229, 39, 1, 'Institut Superieur Saint Michel Itaosy', 'Établissement Supérieur Catholique professionnalisant sous l’égide des Pères Carmes, l’Institut Supérieur Saint Michel Itaosy, ISSMI a été fondé en 2003, avec l’agrément d’ouverture du Ministère de l’Enseignement Supérieur et de la Recherche Scientifique : ARRETE N° 532-2005/MENRS.', '<p><strong>A propos</strong></p>\n<p>&Eacute;tablissement Sup&eacute;rieur Catholique professionnalisant sous l&rsquo;&eacute;gide des P&egrave;res Carmes, l&rsquo;Institut Sup&eacute;rieur Saint Michel Itaosy, ISSMI a &eacute;t&eacute; fond&eacute; en 2003, avec l&rsquo;agr&eacute;ment d&rsquo;ouverture du Minist&egrave;re de l&rsquo;Enseignement Sup&eacute;rieur et de la Recherche Scientifique : ARRETE N&deg; 532-2005/MENRS. Les dipl&ocirc;mes d&eacute;livr&eacute;s &agrave; l&rsquo;ISSMI sont reconnus par la Fonction Publique avec &eacute;quivalence administrative :</p>\n<ul>\n<li>Bac +2 : Ex Cat IV Echelle B1 (Arr&ecirc;t&eacute; : 3491/2009-CNEAT)</li>\n<li>Bac+3 : Ex Cat V Echelle A3 (Arr&ecirc;t&eacute; : 3493/ 2009-CNEAT)</li>\n</ul>\n<p>Les offres de formations &agrave; l&rsquo;ISSMI sont habilit&eacute;es par le Minist&egrave;re de l&rsquo;Enseignement Sup&eacute;rieur et de la recherche Scientifique :</p>\n<ul>\n<li>TOURISME ENVIRONNEMENT HOTELLERIE T.E.H : Arr&ecirc;t&eacute; 1072/2014-MESupRES</li>\n<li>GESTION : Arr&ecirc;t&eacute; 1949/2013- MESupRES</li>\n<li>INFORMATIQUE : Arr&ecirc;t&eacute; 36831/2013- MESupRES</li>\n</ul>\n<p><br /><strong>Mission :</strong></p>\n<p style="text-align: justify;">S&rsquo;ins&eacute;rant dans les &oelig;uvres &eacute;ducationnelles Carm&eacute;litaines, sa mise en place est une continuit&eacute; logique des travaux entrepris dans&nbsp; le cadre des &eacute;coles, des coll&egrave;ges et des lyc&eacute;es des districts de toute l&rsquo;Ile, o&ugrave; l&rsquo;Ordre est pr&eacute;sent. &laquo; Rester et Devenir Meilleur &raquo;, telle est sa devise. Il ambitionne ainsi dans un effort quasi permanent, de toujours fournir le meilleur de lui-m&ecirc;me afin de couronner de succ&egrave;s tout ce qu&rsquo;il entreprend. Se d&eacute;finir par rapport &agrave; soi ne suffit cependant pas, se positionner par rapport aux autres est aussi une autre paire de manche. Le statut de &laquo; meilleur &raquo; n&rsquo;est paradoxalement pas statique et n&rsquo;est jamais acquis d&eacute;finitivement, le chemin de la victoire et sem&eacute; d&rsquo;embuches et d&rsquo;obstacles &agrave; surmonter. Le monde concurrentiel est complexe et en incessante &eacute;volution et il nous appartient de suivre et&nbsp; de vivre ce dynamique afin de r&eacute;ussir sur tous les plans. Viser la formation int&eacute;grale de l&rsquo;homme, c&rsquo;est pr&eacute;server l&rsquo;&eacute;quilibre entre le corps, le c&oelig;ur, et l&rsquo;&acirc;me, c&rsquo;est aussi r&eacute;pondre &agrave; l&rsquo;imp&eacute;ratif du triptyque : qualit&eacute;, rigueur, t&eacute;moignage de foi vivante. Il s&rsquo;agit en r&eacute;sum&eacute; de former des jeunes citoyens responsables, performants et b&acirc;tisseur.</p>'),
(230, 39, 2, 'Institut Superieur Saint Michel Itaosy', 'Établissement Supérieur Catholique professionnalisant sous l’égide des Pères Carmes, l’Institut Supérieur Saint Michel Itaosy, ISSMI a été fondé en 2003, avec l’agrément d’ouverture du Ministère de l’Enseignement Supérieur et de la Recherche Scientifique : ARRETE N° 532-2005/MENRS.', '<p><strong>A propos</strong></p>\n<p>&Eacute;tablissement Sup&eacute;rieur Catholique professionnalisant sous l&rsquo;&eacute;gide des P&egrave;res Carmes, l&rsquo;Institut Sup&eacute;rieur Saint Michel Itaosy, ISSMI a &eacute;t&eacute; fond&eacute; en 2003, avec l&rsquo;agr&eacute;ment d&rsquo;ouverture du Minist&egrave;re de l&rsquo;Enseignement Sup&eacute;rieur et de la Recherche Scientifique : ARRETE N&deg; 532-2005/MENRS. Les dipl&ocirc;mes d&eacute;livr&eacute;s &agrave; l&rsquo;ISSMI sont reconnus par la Fonction Publique avec &eacute;quivalence administrative :</p>\n<ul>\n<li>Bac +2 : Ex Cat IV Echelle B1 (Arr&ecirc;t&eacute; : 3491/2009-CNEAT)</li>\n<li>Bac+3 : Ex Cat V Echelle A3 (Arr&ecirc;t&eacute; : 3493/ 2009-CNEAT)</li>\n</ul>\n<p>Les offres de formations &agrave; l&rsquo;ISSMI sont habilit&eacute;es par le Minist&egrave;re de l&rsquo;Enseignement Sup&eacute;rieur et de la recherche Scientifique :</p>\n<ul>\n<li>TOURISME ENVIRONNEMENT HOTELLERIE T.E.H : Arr&ecirc;t&eacute; 1072/2014-MESupRES</li>\n<li>GESTION : Arr&ecirc;t&eacute; 1949/2013- MESupRES</li>\n<li>INFORMATIQUE : Arr&ecirc;t&eacute; 36831/2013- MESupRES</li>\n</ul>\n<p><br /><strong>Mission :</strong></p>\n<p style="text-align: justify;">S&rsquo;ins&eacute;rant dans les &oelig;uvres &eacute;ducationnelles Carm&eacute;litaines, sa mise en place est une continuit&eacute; logique des travaux entrepris dans&nbsp; le cadre des &eacute;coles, des coll&egrave;ges et des lyc&eacute;es des districts de toute l&rsquo;Ile, o&ugrave; l&rsquo;Ordre est pr&eacute;sent. &laquo; Rester et Devenir Meilleur &raquo;, telle est sa devise. Il ambitionne ainsi dans un effort quasi permanent, de toujours fournir le meilleur de lui-m&ecirc;me afin de couronner de succ&egrave;s tout ce qu&rsquo;il entreprend. Se d&eacute;finir par rapport &agrave; soi ne suffit cependant pas, se positionner par rapport aux autres est aussi une autre paire de manche. Le statut de &laquo; meilleur &raquo; n&rsquo;est paradoxalement pas statique et n&rsquo;est jamais acquis d&eacute;finitivement, le chemin de la victoire et sem&eacute; d&rsquo;embuches et d&rsquo;obstacles &agrave; surmonter. Le monde concurrentiel est complexe et en incessante &eacute;volution et il nous appartient de suivre et&nbsp; de vivre ce dynamique afin de r&eacute;ussir sur tous les plans. Viser la formation int&eacute;grale de l&rsquo;homme, c&rsquo;est pr&eacute;server l&rsquo;&eacute;quilibre entre le corps, le c&oelig;ur, et l&rsquo;&acirc;me, c&rsquo;est aussi r&eacute;pondre &agrave; l&rsquo;imp&eacute;ratif du triptyque : qualit&eacute;, rigueur, t&eacute;moignage de foi vivante. Il s&rsquo;agit en r&eacute;sum&eacute; de former des jeunes citoyens responsables, performants et b&acirc;tisseur.</p>'),
(231, 39, 3, 'Institut Superieur Saint Michel Itaosy', 'Établissement Supérieur Catholique professionnalisant sous l’égide des Pères Carmes, l’Institut Supérieur Saint Michel Itaosy, ISSMI a été fondé en 2003, avec l’agrément d’ouverture du Ministère de l’Enseignement Supérieur et de la Recherche Scientifique : ARRETE N° 532-2005/MENRS.', '<p style="text-align: justify;">&Eacute;tablissement Sup&eacute;rieur Catholique professionnalisant sous l&rsquo;&eacute;gide des P&egrave;res Carmes, l&rsquo;Institut Sup&eacute;rieur Saint Michel Itaosy, ISSMI a &eacute;t&eacute; fond&eacute; en 2003, avec l&rsquo;agr&eacute;ment d&rsquo;ouverture du Minist&egrave;re de l&rsquo;Enseignement Sup&eacute;rieur et de la Recherche Scientifique : ARRETE N&deg; 532-2005/MENRS. Les dipl&ocirc;mes d&eacute;livr&eacute;s &agrave; l&rsquo;ISSMI sont reconnus par la Fonction Publique avec &eacute;quivalence administrative :<br />Bac +2 : Ex Cat IV Echelle B1 (Arr&ecirc;t&eacute; : 3491/2009-CNEAT)<br />Bac+3 : Ex Cat V Echelle A3 (Arr&ecirc;t&eacute; : 3493/ 2009-CNEAT)<br /><br />Les offres de formations &agrave; l&rsquo;ISSMI sont habilit&eacute;es par le Minist&egrave;re de l&rsquo;Enseignement Sup&eacute;rieur et de la recherche Scientifique :<br />TOURISME ENVIRONNEMENT HOTELLERIE T.E.H : Arr&ecirc;t&eacute; 1072/2014-MESupRES<br />GESTION : Arr&ecirc;t&eacute; 1949/2013- MESupRES<br />INFORMATIQUE : Arr&ecirc;t&eacute; 36831/2013- MESupRES<br /><br />Mission :<br />S&rsquo;ins&eacute;rant dans les &oelig;uvres &eacute;ducationnelles Carm&eacute;litaines, sa mise en place est une continuit&eacute; logique des travaux entrepris dans&nbsp; le cadre des &eacute;coles, des coll&egrave;ges et des lyc&eacute;es des districts de toute l&rsquo;Ile, o&ugrave; l&rsquo;Ordre est pr&eacute;sent. &laquo; Rester et Devenir Meilleur &raquo;, telle est sa devise. Il ambitionne ainsi dans un effort quasi permanent, de toujours fournir le meilleur de lui-m&ecirc;me afin de couronner de succ&egrave;s tout ce qu&rsquo;il entreprend. Se d&eacute;finir par rapport &agrave; soi ne suffit cependant pas, se positionner par rapport aux autres est aussi une autre paire de manche. Le statut de &laquo; meilleur &raquo; n&rsquo;est paradoxalement pas statique et n&rsquo;est jamais acquis d&eacute;finitivement, le chemin de la victoire et sem&eacute; d&rsquo;embuches et d&rsquo;obstacles &agrave; surmonter. Le monde concurrentiel est complexe et en incessante &eacute;volution et il nous appartient de suivre et&nbsp; de vivre ce dynamique afin de r&eacute;ussir sur tous les plans. Viser la formation int&eacute;grale de l&rsquo;homme, c&rsquo;est pr&eacute;server l&rsquo;&eacute;quilibre entre le corps, le c&oelig;ur, et l&rsquo;&acirc;me, c&rsquo;est aussi r&eacute;pondre &agrave; l&rsquo;imp&eacute;ratif du triptyque : qualit&eacute;, rigueur, t&eacute;moignage de foi vivante. Il s&rsquo;agit en r&eacute;sum&eacute; de former des jeunes citoyens responsables, performants et b&acirc;tisseur.</p>');
INSERT INTO `sl_school_translate` (`id`, `school_id`, `locale_id`, `name`, `short_description`, `description`) VALUES
(232, 39, 4, 'Institut Superieur Saint Michel Itaosy', 'Établissement Supérieur Catholique professionnalisant sous l’égide des Pères Carmes, l’Institut Supérieur Saint Michel Itaosy, ISSMI a été fondé en 2003, avec l’agrément d’ouverture du Ministère de l’Enseignement Supérieur et de la Recherche Scientifique : ARRETE N° 532-2005/MENRS.', '<p style="text-align: justify;">&Eacute;tablissement Sup&eacute;rieur Catholique professionnalisant sous l&rsquo;&eacute;gide des P&egrave;res Carmes, l&rsquo;Institut Sup&eacute;rieur Saint Michel Itaosy, ISSMI a &eacute;t&eacute; fond&eacute; en 2003, avec l&rsquo;agr&eacute;ment d&rsquo;ouverture du Minist&egrave;re de l&rsquo;Enseignement Sup&eacute;rieur et de la Recherche Scientifique : ARRETE N&deg; 532-2005/MENRS. Les dipl&ocirc;mes d&eacute;livr&eacute;s &agrave; l&rsquo;ISSMI sont reconnus par la Fonction Publique avec &eacute;quivalence administrative :<br />Bac +2 : Ex Cat IV Echelle B1 (Arr&ecirc;t&eacute; : 3491/2009-CNEAT)<br />Bac+3 : Ex Cat V Echelle A3 (Arr&ecirc;t&eacute; : 3493/ 2009-CNEAT)<br /><br />Les offres de formations &agrave; l&rsquo;ISSMI sont habilit&eacute;es par le Minist&egrave;re de l&rsquo;Enseignement Sup&eacute;rieur et de la recherche Scientifique :<br />TOURISME ENVIRONNEMENT HOTELLERIE T.E.H : Arr&ecirc;t&eacute; 1072/2014-MESupRES<br />GESTION : Arr&ecirc;t&eacute; 1949/2013- MESupRES<br />INFORMATIQUE : Arr&ecirc;t&eacute; 36831/2013- MESupRES<br /><br />Mission :<br />S&rsquo;ins&eacute;rant dans les &oelig;uvres &eacute;ducationnelles Carm&eacute;litaines, sa mise en place est une continuit&eacute; logique des travaux entrepris dans&nbsp; le cadre des &eacute;coles, des coll&egrave;ges et des lyc&eacute;es des districts de toute l&rsquo;Ile, o&ugrave; l&rsquo;Ordre est pr&eacute;sent. &laquo; Rester et Devenir Meilleur &raquo;, telle est sa devise. Il ambitionne ainsi dans un effort quasi permanent, de toujours fournir le meilleur de lui-m&ecirc;me afin de couronner de succ&egrave;s tout ce qu&rsquo;il entreprend. Se d&eacute;finir par rapport &agrave; soi ne suffit cependant pas, se positionner par rapport aux autres est aussi une autre paire de manche. Le statut de &laquo; meilleur &raquo; n&rsquo;est paradoxalement pas statique et n&rsquo;est jamais acquis d&eacute;finitivement, le chemin de la victoire et sem&eacute; d&rsquo;embuches et d&rsquo;obstacles &agrave; surmonter. Le monde concurrentiel est complexe et en incessante &eacute;volution et il nous appartient de suivre et&nbsp; de vivre ce dynamique afin de r&eacute;ussir sur tous les plans. Viser la formation int&eacute;grale de l&rsquo;homme, c&rsquo;est pr&eacute;server l&rsquo;&eacute;quilibre entre le corps, le c&oelig;ur, et l&rsquo;&acirc;me, c&rsquo;est aussi r&eacute;pondre &agrave; l&rsquo;imp&eacute;ratif du triptyque : qualit&eacute;, rigueur, t&eacute;moignage de foi vivante. Il s&rsquo;agit en r&eacute;sum&eacute; de former des jeunes citoyens responsables, performants et b&acirc;tisseur.</p>'),
(233, 39, 5, 'Institut Superieur Saint Michel Itaosy', 'Établissement Supérieur Catholique professionnalisant sous l’égide des Pères Carmes, l’Institut Supérieur Saint Michel Itaosy, ISSMI a été fondé en 2003, avec l’agrément d’ouverture du Ministère de l’Enseignement Supérieur et de la Recherche Scientifique : ARRETE N° 532-2005/MENRS.', '<p style="text-align: justify;">&Eacute;tablissement Sup&eacute;rieur Catholique professionnalisant sous l&rsquo;&eacute;gide des P&egrave;res Carmes, l&rsquo;Institut Sup&eacute;rieur Saint Michel Itaosy, ISSMI a &eacute;t&eacute; fond&eacute; en 2003, avec l&rsquo;agr&eacute;ment d&rsquo;ouverture du Minist&egrave;re de l&rsquo;Enseignement Sup&eacute;rieur et de la Recherche Scientifique : ARRETE N&deg; 532-2005/MENRS. Les dipl&ocirc;mes d&eacute;livr&eacute;s &agrave; l&rsquo;ISSMI sont reconnus par la Fonction Publique avec &eacute;quivalence administrative :<br />Bac +2 : Ex Cat IV Echelle B1 (Arr&ecirc;t&eacute; : 3491/2009-CNEAT)<br />Bac+3 : Ex Cat V Echelle A3 (Arr&ecirc;t&eacute; : 3493/ 2009-CNEAT)<br /><br />Les offres de formations &agrave; l&rsquo;ISSMI sont habilit&eacute;es par le Minist&egrave;re de l&rsquo;Enseignement Sup&eacute;rieur et de la recherche Scientifique :<br />TOURISME ENVIRONNEMENT HOTELLERIE T.E.H : Arr&ecirc;t&eacute; 1072/2014-MESupRES<br />GESTION : Arr&ecirc;t&eacute; 1949/2013- MESupRES<br />INFORMATIQUE : Arr&ecirc;t&eacute; 36831/2013- MESupRES<br /><br />Mission :<br />S&rsquo;ins&eacute;rant dans les &oelig;uvres &eacute;ducationnelles Carm&eacute;litaines, sa mise en place est une continuit&eacute; logique des travaux entrepris dans&nbsp; le cadre des &eacute;coles, des coll&egrave;ges et des lyc&eacute;es des districts de toute l&rsquo;Ile, o&ugrave; l&rsquo;Ordre est pr&eacute;sent. &laquo; Rester et Devenir Meilleur &raquo;, telle est sa devise. Il ambitionne ainsi dans un effort quasi permanent, de toujours fournir le meilleur de lui-m&ecirc;me afin de couronner de succ&egrave;s tout ce qu&rsquo;il entreprend. Se d&eacute;finir par rapport &agrave; soi ne suffit cependant pas, se positionner par rapport aux autres est aussi une autre paire de manche. Le statut de &laquo; meilleur &raquo; n&rsquo;est paradoxalement pas statique et n&rsquo;est jamais acquis d&eacute;finitivement, le chemin de la victoire et sem&eacute; d&rsquo;embuches et d&rsquo;obstacles &agrave; surmonter. Le monde concurrentiel est complexe et en incessante &eacute;volution et il nous appartient de suivre et&nbsp; de vivre ce dynamique afin de r&eacute;ussir sur tous les plans. Viser la formation int&eacute;grale de l&rsquo;homme, c&rsquo;est pr&eacute;server l&rsquo;&eacute;quilibre entre le corps, le c&oelig;ur, et l&rsquo;&acirc;me, c&rsquo;est aussi r&eacute;pondre &agrave; l&rsquo;imp&eacute;ratif du triptyque : qualit&eacute;, rigueur, t&eacute;moignage de foi vivante. Il s&rsquo;agit en r&eacute;sum&eacute; de former des jeunes citoyens responsables, performants et b&acirc;tisseur.</p>'),
(234, 39, 6, 'Institut Superieur Saint Michel Itaosy', 'Établissement Supérieur Catholique professionnalisant sous l’égide des Pères Carmes, l’Institut Supérieur Saint Michel Itaosy, ISSMI a été fondé en 2003, avec l’agrément d’ouverture du Ministère de l’Enseignement Supérieur et de la Recherche Scientifique : ARRETE N° 532-2005/MENRS.', '<p style="text-align: justify;">&Eacute;tablissement Sup&eacute;rieur Catholique professionnalisant sous l&rsquo;&eacute;gide des P&egrave;res Carmes, l&rsquo;Institut Sup&eacute;rieur Saint Michel Itaosy, ISSMI a &eacute;t&eacute; fond&eacute; en 2003, avec l&rsquo;agr&eacute;ment d&rsquo;ouverture du Minist&egrave;re de l&rsquo;Enseignement Sup&eacute;rieur et de la Recherche Scientifique : ARRETE N&deg; 532-2005/MENRS. Les dipl&ocirc;mes d&eacute;livr&eacute;s &agrave; l&rsquo;ISSMI sont reconnus par la Fonction Publique avec &eacute;quivalence administrative :<br />Bac +2 : Ex Cat IV Echelle B1 (Arr&ecirc;t&eacute; : 3491/2009-CNEAT)<br />Bac+3 : Ex Cat V Echelle A3 (Arr&ecirc;t&eacute; : 3493/ 2009-CNEAT)<br /><br />Les offres de formations &agrave; l&rsquo;ISSMI sont habilit&eacute;es par le Minist&egrave;re de l&rsquo;Enseignement Sup&eacute;rieur et de la recherche Scientifique :<br />TOURISME ENVIRONNEMENT HOTELLERIE T.E.H : Arr&ecirc;t&eacute; 1072/2014-MESupRES<br />GESTION : Arr&ecirc;t&eacute; 1949/2013- MESupRES<br />INFORMATIQUE : Arr&ecirc;t&eacute; 36831/2013- MESupRES<br /><br />Mission :<br />S&rsquo;ins&eacute;rant dans les &oelig;uvres &eacute;ducationnelles Carm&eacute;litaines, sa mise en place est une continuit&eacute; logique des travaux entrepris dans&nbsp; le cadre des &eacute;coles, des coll&egrave;ges et des lyc&eacute;es des districts de toute l&rsquo;Ile, o&ugrave; l&rsquo;Ordre est pr&eacute;sent. &laquo; Rester et Devenir Meilleur &raquo;, telle est sa devise. Il ambitionne ainsi dans un effort quasi permanent, de toujours fournir le meilleur de lui-m&ecirc;me afin de couronner de succ&egrave;s tout ce qu&rsquo;il entreprend. Se d&eacute;finir par rapport &agrave; soi ne suffit cependant pas, se positionner par rapport aux autres est aussi une autre paire de manche. Le statut de &laquo; meilleur &raquo; n&rsquo;est paradoxalement pas statique et n&rsquo;est jamais acquis d&eacute;finitivement, le chemin de la victoire et sem&eacute; d&rsquo;embuches et d&rsquo;obstacles &agrave; surmonter. Le monde concurrentiel est complexe et en incessante &eacute;volution et il nous appartient de suivre et&nbsp; de vivre ce dynamique afin de r&eacute;ussir sur tous les plans. Viser la formation int&eacute;grale de l&rsquo;homme, c&rsquo;est pr&eacute;server l&rsquo;&eacute;quilibre entre le corps, le c&oelig;ur, et l&rsquo;&acirc;me, c&rsquo;est aussi r&eacute;pondre &agrave; l&rsquo;imp&eacute;ratif du triptyque : qualit&eacute;, rigueur, t&eacute;moignage de foi vivante. Il s&rsquo;agit en r&eacute;sum&eacute; de former des jeunes citoyens responsables, performants et b&acirc;tisseur.</p>'),
(235, 1, 1, 'Institut national des sciences comptables et de l''administration d''entreprises', 'Créé en 1981 et destiné à former des cadres d''entreprises de haut niveau, à promouvoir les initiatives entrepreneuriales et à développer les activités de recherche en gestion, notre Institut offre des programmes de formation de premier cycle, de second cycle et de troisième cycle professionnel ou de recherche dans le domaine de la Comptabilité, de la Finance et du Management. En effet, toujours à l''écoute des aspirations du milieu économique confronté à la mondialisation et la globalisation des marchés, cette Ecole s''est efforcée de répondre constamment aux attentes des entreprises, voire du secteur public, en ouvrant presque tous les ans de nouveaux programmes, ce qui a contribué à sa bonne renommée tant au niveau local, régional, qu''international. Nous espérons qu''en consultant tous nos programmes de formation, vous trouverez celui qui répondrait au mieux à vos besoins et que vous serez des nôtres très bientôt', '<div style="text-align: justify;"><strong>Ann&eacute;es 80</strong><br /><br />Cr&eacute;&eacute; en 1981, &agrave; la suite d''un protocole d''accord entre la R&eacute;publique de Madagascar et la Banque Mondiale, le Centre de Formation en Comptabilit&eacute; (CFC) &eacute;largit rapidement son champ d''intervention pour devenir en 1986 l''Institut National des Sciences Comptables et de l''Administration d''Entreprises (INSCAE). L''INSCAE est un Etablissement Public &agrave; caract&egrave;re scientifique et culturel dot&eacute; de la personnalit&eacute; morale et jouissant de l''autonomie administrative et financi&egrave;re, il a pour mission de former des cadres de haut niveau, de promouvoir les initiatives entrepreneuriales et de d&eacute;velopper les activit&eacute;s de recherche en gestion. Du CFC &agrave; l''INSCAE, les nationaux, successeurs des canadiens &agrave; la commande de l''Institut, arrivent non seulement &agrave; capitaliser les acquis mais aussi &agrave; trouver une judicieuse compl&eacute;mentarit&eacute; entre les sciences comptables et l''administration d''entreprises. Ils sont en train de fa&ccedil;onner un nouveau mod&egrave;le de formation en sciences de gestion r&eacute;pondant aux besoins du d&eacute;veloppement national. En effet, le mod&egrave;le de formation dans le syst&egrave;me classique est b&acirc;ti pour servir l''&eacute;conomie dirig&eacute;e. L''INSCAE, se rapprochant davantage des entreprises, apporte une d&eacute;terminante contribution, lors de l''&eacute;laboration du Plan Comptable G&eacute;n&eacute;ral 1987.<br /><br /><strong>Ann&eacute;es 90</strong><br /><br />Madagascar entame la deuxi&egrave;me p&eacute;riode d''Ajustement Structurel et opte pour la lib&eacute;ration de son &eacute;conomie, ce qui traduit, entre autres, par le d&eacute;sengagement de l''Etat du secteur de production d''o&ugrave; appel &agrave; des investisseurs. Cette r&eacute;orientation &eacute;conomique est dict&eacute;e &agrave; la fois par le contexte international et la performance de l''&eacute;conomie nationale. Force est de noter que le basculement d''une &eacute;conomie dirig&eacute;e &agrave; une &eacute;conomie lib&eacute;rale n''est pas toujours facile, en particulier le secteur priv&eacute; national est-il pr&ecirc;t ou du moins pr&eacute;par&eacute; &agrave; un tel changement? Cette deuxi&egrave;me p&eacute;riode est marqu&eacute;e, au niveau national, par l''av&egrave;nement des &eacute;tablissements d''enseignement sup&eacute;rieur priv&eacute; dont la quasi-totalit&eacute; aussure de la formation en sciences de gestion, d''o&ugrave; concurrence.<br /><br />Au niveau international, qualit&eacute; et internationalisation deviennent les mots cl&eacute;s. Aussi, l''Institut adopte une politique de coop&eacute;ration internationale dynamique. Il est membre de l''Agence Universitaire de la Francophonie, du R&eacute;seau Africain et Malagasy pour l''Excellence en Gestion d''Entrerprises et de l''Association des Institutions d''Enseignement et de Recherche de l''Ocean Indien. Il &eacute;tablit des programmes de coop&eacute;ration avec des universit&eacute;s canadienne, fran&ccedil;aises et mauricienne et avec l''Institut de la Francophonie pour l''Entrepreneuriat &agrave; l''Ile Maurice. Au niveau du contenu des programmes, le respect des normes internationales et la consid&eacute;ration des sp&eacute;cificit&eacute;s nationales sont judicieusements concili&eacute;s. Tr&egrave;s fr&eacute;quemment, dans les programmes de 3&egrave;me cycle, cibl&eacute;s et co-dipl&ocirc;m&eacute;s avec les partenaires apr&egrave;s la d&eacute;finition de base commune, l''Institut prend les initiatives qu''il juge pertinentes.<br /><br /><strong>Ann&eacute;es 2000</strong><br /><br />L&rsquo;Ajustement Structurel change d&rsquo;appellation mais la population ne b&eacute;n&eacute;ficie pas des retomb&eacute;es des mesures &eacute;conomiques, la pauvret&eacute; s&rsquo;accentue et le cycle de vie des crises politiques malagasy se raccourcit. Au niveau international, la crise financi&egrave;re cl&ocirc;ture la premi&egrave;re d&eacute;cennie. Face au changement de contexte et &agrave; l&rsquo;&eacute;volution des sciences et de la technologie, l&rsquo;INSCAE adapte ses offres de formations dipl&ocirc;mante et qualifiante et ses th&egrave;mes de recherche. Mais l&rsquo;INSCAE ne se contente pas seulement d&rsquo;adapter, il essaie aussi d&rsquo;anticiper. L''inauguration de l''immeuble le 21 Ao&ucirc;t 2014 est &agrave; marquer d''une pierre blanche dans l''histoire de l''INSCAE. En effet, apr&egrave;s trois d&eacute;cennies d''existence l''INSCAE finit par avoir son site propre gr&acirc;ce au concours du gouvernent malagasy avec la Banque Arabe pour le D&eacute;veloppement Economique en Afrique (BADEA) et de l''OPEC Fund for International Development (OFID)<br /><br /><strong>INSCAE et les instances dirigeantes</strong><br /><br />Le conseil d''Administration, compos&eacute; par les repr&eacute;sentants des Minist&egrave;res de tutelle, des associations professionnelles, du Personnel Enseignant, du Personnel Administratif et de l''Association des dipl&ocirc;m&eacute;s, a &eacute;t&eacute; pr&eacute;sid&eacute; successivement par : Blandin RAZAFIMANJATO, Raymond RABENORO,&nbsp; Victor MANANTSOA,&nbsp; RAZANANIRINA Bruno.<br />La direction G&eacute;n&eacute;rale a &eacute;t&eacute; confi&eacute;e successivement &agrave; : G&eacute;rard DUCHARNE (CFC),&nbsp; R&eacute;gis PARENT (CFC),&nbsp; Flavien TODY (INSCAE),&nbsp; Juliette RAHARISOA (INSCAE), Victor HARISON (INSCAE)</div>'),
(236, 40, 1, 'IT University', 'IT University est un établissement d’enseignement supérieur privé spécialisé en informatique, nouvellement créé, pour répondre aux  besoins du secteur professionnel en matière de nouvelles technologies.', '<p>IT University est un &eacute;tablissement d&rsquo;enseignement sup&eacute;rieur priv&eacute; sp&eacute;cialis&eacute; en informatique, nouvellement cr&eacute;&eacute;, pour r&eacute;pondre aux&nbsp; besoins du secteur professionnel en mati&egrave;re de nouvelles technologies.<br /><br />IT University adopte le syst&egrave;me LMD et offre actuellement une formation de 3ans apr&egrave;s le BAC, dans les modules suivants :<br />&nbsp;&nbsp;&nbsp; Licence sp&eacute;cialis&eacute;e en d&eacute;veloppement d&rsquo;applications (Programmation)<br />&nbsp;&nbsp;&nbsp; Licence sp&eacute;cialis&eacute;e en Base de donn&eacute;es et R&eacute;seaux<br />&nbsp;&nbsp;&nbsp; Licence sp&eacute;cialis&eacute;e&nbsp; en Web Int&eacute;gration et Web designer<br /><br />Apr&egrave;s ce programme , tous les sortants d&rsquo;IT University seront&nbsp; tout de suite op&eacute;rationnels, IT University met surtout en exergue la base math&eacute;matique dans son programme, afin de permettre aux &eacute;tudiants d&rsquo;avoir un bon niveau de raisonnement&nbsp; et&nbsp; de continuer leurs &eacute;tudes en master et en doctorat.</p>'),
(237, 40, 2, 'IT University', 'IT University est un établissement d’enseignement supérieur privé spécialisé en informatique, nouvellement créé, pour répondre aux  besoins du secteur professionnel en matière de nouvelles technologies.', '<p>IT University est un &eacute;tablissement d&rsquo;enseignement sup&eacute;rieur priv&eacute; sp&eacute;cialis&eacute; en informatique, nouvellement cr&eacute;&eacute;, pour r&eacute;pondre aux&nbsp; besoins du secteur professionnel en mati&egrave;re de nouvelles technologies.<br /><br />IT University adopte le syst&egrave;me LMD et offre actuellement une formation de 3ans apr&egrave;s le BAC, dans les modules suivants :<br />&nbsp;&nbsp;&nbsp; Licence sp&eacute;cialis&eacute;e en d&eacute;veloppement d&rsquo;applications (Programmation)<br />&nbsp;&nbsp;&nbsp; Licence sp&eacute;cialis&eacute;e en Base de donn&eacute;es et R&eacute;seaux<br />&nbsp;&nbsp;&nbsp; Licence sp&eacute;cialis&eacute;e&nbsp; en Web Int&eacute;gration et Web designer<br /><br />Apr&egrave;s ce programme , tous les sortants d&rsquo;IT University seront&nbsp; tout de suite op&eacute;rationnels, IT University met surtout en exergue la base math&eacute;matique dans son programme, afin de permettre aux &eacute;tudiants d&rsquo;avoir un bon niveau de raisonnement&nbsp; et&nbsp; de continuer leurs &eacute;tudes en master et en doctorat.</p>'),
(238, 40, 3, 'IT University', 'IT University est un établissement d’enseignement supérieur privé spécialisé en informatique, nouvellement créé, pour répondre aux  besoins du secteur professionnel en matière de nouvelles technologies.', '<p>IT University est un &eacute;tablissement d&rsquo;enseignement sup&eacute;rieur priv&eacute; sp&eacute;cialis&eacute; en informatique, nouvellement cr&eacute;&eacute;, pour r&eacute;pondre aux&nbsp; besoins du secteur professionnel en mati&egrave;re de nouvelles technologies.<br /><br />IT University adopte le syst&egrave;me LMD et offre actuellement une formation de 3ans apr&egrave;s le BAC, dans les modules suivants :<br />&nbsp;&nbsp;&nbsp; Licence sp&eacute;cialis&eacute;e en d&eacute;veloppement d&rsquo;applications (Programmation)<br />&nbsp;&nbsp;&nbsp; Licence sp&eacute;cialis&eacute;e en Base de donn&eacute;es et R&eacute;seaux<br />&nbsp;&nbsp;&nbsp; Licence sp&eacute;cialis&eacute;e&nbsp; en Web Int&eacute;gration et Web designer<br /><br />Apr&egrave;s ce programme , tous les sortants d&rsquo;IT University seront&nbsp; tout de suite op&eacute;rationnels, IT University met surtout en exergue la base math&eacute;matique dans son programme, afin de permettre aux &eacute;tudiants d&rsquo;avoir un bon niveau de raisonnement&nbsp; et&nbsp; de continuer leurs &eacute;tudes en master et en doctorat.</p>'),
(239, 40, 4, 'IT University', 'IT University est un établissement d’enseignement supérieur privé spécialisé en informatique, nouvellement créé, pour répondre aux  besoins du secteur professionnel en matière de nouvelles technologies.', '<p>IT University est un &eacute;tablissement d&rsquo;enseignement sup&eacute;rieur priv&eacute; sp&eacute;cialis&eacute; en informatique, nouvellement cr&eacute;&eacute;, pour r&eacute;pondre aux&nbsp; besoins du secteur professionnel en mati&egrave;re de nouvelles technologies.<br /><br />IT University adopte le syst&egrave;me LMD et offre actuellement une formation de 3ans apr&egrave;s le BAC, dans les modules suivants :<br />&nbsp;&nbsp;&nbsp; Licence sp&eacute;cialis&eacute;e en d&eacute;veloppement d&rsquo;applications (Programmation)<br />&nbsp;&nbsp;&nbsp; Licence sp&eacute;cialis&eacute;e en Base de donn&eacute;es et R&eacute;seaux<br />&nbsp;&nbsp;&nbsp; Licence sp&eacute;cialis&eacute;e&nbsp; en Web Int&eacute;gration et Web designer<br /><br />Apr&egrave;s ce programme , tous les sortants d&rsquo;IT University seront&nbsp; tout de suite op&eacute;rationnels, IT University met surtout en exergue la base math&eacute;matique dans son programme, afin de permettre aux &eacute;tudiants d&rsquo;avoir un bon niveau de raisonnement&nbsp; et&nbsp; de continuer leurs &eacute;tudes en master et en doctorat.</p>'),
(240, 40, 5, 'IT University', 'IT University est un établissement d’enseignement supérieur privé spécialisé en informatique, nouvellement créé, pour répondre aux  besoins du secteur professionnel en matière de nouvelles technologies.', '<p>IT University est un &eacute;tablissement d&rsquo;enseignement sup&eacute;rieur priv&eacute; sp&eacute;cialis&eacute; en informatique, nouvellement cr&eacute;&eacute;, pour r&eacute;pondre aux&nbsp; besoins du secteur professionnel en mati&egrave;re de nouvelles technologies.<br /><br />IT University adopte le syst&egrave;me LMD et offre actuellement une formation de 3ans apr&egrave;s le BAC, dans les modules suivants :<br />&nbsp;&nbsp;&nbsp; Licence sp&eacute;cialis&eacute;e en d&eacute;veloppement d&rsquo;applications (Programmation)<br />&nbsp;&nbsp;&nbsp; Licence sp&eacute;cialis&eacute;e en Base de donn&eacute;es et R&eacute;seaux<br />&nbsp;&nbsp;&nbsp; Licence sp&eacute;cialis&eacute;e&nbsp; en Web Int&eacute;gration et Web designer<br /><br />Apr&egrave;s ce programme , tous les sortants d&rsquo;IT University seront&nbsp; tout de suite op&eacute;rationnels, IT University met surtout en exergue la base math&eacute;matique dans son programme, afin de permettre aux &eacute;tudiants d&rsquo;avoir un bon niveau de raisonnement&nbsp; et&nbsp; de continuer leurs &eacute;tudes en master et en doctorat.</p>'),
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
(267, 46, 2, 'Oio scholl', 'Specimen. Coactique aliquotiens nostri pedites ad eos persequendos scandere clivos sublimes etiam si lapsantibus plantis fruticeta prensando vel dumos ad vertices venerint summos, inter arta tamen et invia nullas acies explicare permissi nec firmare nisu valido gressus: hoste discursatore rupium abscisa volvente, ruinis ponderum inmanium consternuntur, aut ex necessitate ultima fortiter dimicante, superati periculose per prona discedunt. Hanc regionem praestitutis celebritati diebus invadere parans dux ante edictus per solitudines Aboraeque amnis herbidas ripas, suorum indicio proditus, qui admissi flagitii metu exagitati ad praesidia descivere Romana. absque ullo egressus effectu deinde tabescebat immobilis.', '<p style="text-align: justify;">Specimen. Post haec Gallus Hierapolim profecturus ut expeditioni specie tenus adesset, Antiochensi plebi suppliciter obsecranti ut inediae dispelleret metum, quae per multas difficilisque causas adfore iam sperabatur, non ut mos est principibus, quorum diffusa potestas localibus subinde medetur aerumnis, disponi quicquam statuit vel ex provinciis alimenta transferri conterminis, sed consularem Syriae Theophilum prope adstantem ultima metuenti multitudini dedit id adsidue replicando quod invito rectore nullus egere poterit victu. Nihil est enim virtute amabilius, nihil quod magis adliciat ad diligendum, quippe cum propter virtutem et probitatem etiam eos, quos numquam vidimus, quodam modo diligamus. Quis est qui C. Fabrici, M''. Curi non cum caritate aliqua benevola memoriam usurpet, quos numquam viderit? quis autem est, qui Tarquinium Superbum, qui Sp. Cassium, Sp. Maelium non oderit? Cum duobus ducibus de imperio in Italia est decertatum, Pyrrho et Hannibale; ab altero propter probitatem eius non nimis alienos animos habemus, alterum propter crudelitatem semper haec civitas oderit.<br /><br />Excitavit hic ardor milites per municipia plurima, quae isdem conterminant, dispositos et castella, sed quisque serpentes latius pro viribus repellere moliens, nunc globis confertos, aliquotiens et dispersos multitudine superabatur ingenti, quae nata et educata inter editos recurvosque ambitus montium eos ut loca plana persultat et mollia, missilibus obvios eminus lacessens et ululatu truci perterrens. Metuentes igitur idem latrones Lycaoniam magna parte campestrem cum se inpares nostris fore congressione stataria documentis frequentibus scirent, tramitibus deviis petivere Pamphyliam diu quidem intactam sed timore populationum et caedium, milite per omnia diffuso propinqua, magnis undique praesidiis conmunitam.<br /><br />Et interdum acciderat, ut siquid in penetrali secreto nullo citerioris vitae ministro praesente paterfamilias uxori susurrasset in aurem, velut Amphiarao referente aut Marcio, quondam vatibus inclitis, postridie disceret imperator. ideoque etiam parietes arcanorum soli conscii timebantur. Abusus enim multitudine hominum, quam tranquillis in rebus diutius rexit, ex agrestibus habitaculis urbes construxit multis opibus firmas et viribus, quarum ad praesens pleraeque licet Graecis nominibus appellentur, quae isdem ad arbitrium inposita sunt conditoris, primigenia tamen nomina non amittunt, quae eis Assyria lingua institutores veteres indiderunt.</p>');
INSERT INTO `sl_school_translate` (`id`, `school_id`, `locale_id`, `name`, `short_description`, `description`) VALUES
(268, 46, 3, 'Oio scholl', 'Specimen. Coactique aliquotiens nostri pedites ad eos persequendos scandere clivos sublimes etiam si lapsantibus plantis fruticeta prensando vel dumos ad vertices venerint summos, inter arta tamen et invia nullas acies explicare permissi nec firmare nisu valido gressus: hoste discursatore rupium abscisa volvente, ruinis ponderum inmanium consternuntur, aut ex necessitate ultima fortiter dimicante, superati periculose per prona discedunt. Hanc regionem praestitutis celebritati diebus invadere parans dux ante edictus per solitudines Aboraeque amnis herbidas ripas, suorum indicio proditus, qui admissi flagitii metu exagitati ad praesidia descivere Romana. absque ullo egressus effectu deinde tabescebat immobilis.', '<p style="text-align: justify;">Specimen. Post haec Gallus Hierapolim profecturus ut expeditioni specie tenus adesset, Antiochensi plebi suppliciter obsecranti ut inediae dispelleret metum, quae per multas difficilisque causas adfore iam sperabatur, non ut mos est principibus, quorum diffusa potestas localibus subinde medetur aerumnis, disponi quicquam statuit vel ex provinciis alimenta transferri conterminis, sed consularem Syriae Theophilum prope adstantem ultima metuenti multitudini dedit id adsidue replicando quod invito rectore nullus egere poterit victu. Nihil est enim virtute amabilius, nihil quod magis adliciat ad diligendum, quippe cum propter virtutem et probitatem etiam eos, quos numquam vidimus, quodam modo diligamus. Quis est qui C. Fabrici, M''. Curi non cum caritate aliqua benevola memoriam usurpet, quos numquam viderit? quis autem est, qui Tarquinium Superbum, qui Sp. Cassium, Sp. Maelium non oderit? Cum duobus ducibus de imperio in Italia est decertatum, Pyrrho et Hannibale; ab altero propter probitatem eius non nimis alienos animos habemus, alterum propter crudelitatem semper haec civitas oderit.<br /><br />Excitavit hic ardor milites per municipia plurima, quae isdem conterminant, dispositos et castella, sed quisque serpentes latius pro viribus repellere moliens, nunc globis confertos, aliquotiens et dispersos multitudine superabatur ingenti, quae nata et educata inter editos recurvosque ambitus montium eos ut loca plana persultat et mollia, missilibus obvios eminus lacessens et ululatu truci perterrens. Metuentes igitur idem latrones Lycaoniam magna parte campestrem cum se inpares nostris fore congressione stataria documentis frequentibus scirent, tramitibus deviis petivere Pamphyliam diu quidem intactam sed timore populationum et caedium, milite per omnia diffuso propinqua, magnis undique praesidiis conmunitam.<br /><br />Et interdum acciderat, ut siquid in penetrali secreto nullo citerioris vitae ministro praesente paterfamilias uxori susurrasset in aurem, velut Amphiarao referente aut Marcio, quondam vatibus inclitis, postridie disceret imperator. ideoque etiam parietes arcanorum soli conscii timebantur. Abusus enim multitudine hominum, quam tranquillis in rebus diutius rexit, ex agrestibus habitaculis urbes construxit multis opibus firmas et viribus, quarum ad praesens pleraeque licet Graecis nominibus appellentur, quae isdem ad arbitrium inposita sunt conditoris, primigenia tamen nomina non amittunt, quae eis Assyria lingua institutores veteres indiderunt.</p>'),
(269, 46, 4, 'Oio scholl', 'Specimen. Coactique aliquotiens nostri pedites ad eos persequendos scandere clivos sublimes etiam si lapsantibus plantis fruticeta prensando vel dumos ad vertices venerint summos, inter arta tamen et invia nullas acies explicare permissi nec firmare nisu valido gressus: hoste discursatore rupium abscisa volvente, ruinis ponderum inmanium consternuntur, aut ex necessitate ultima fortiter dimicante, superati periculose per prona discedunt. Hanc regionem praestitutis celebritati diebus invadere parans dux ante edictus per solitudines Aboraeque amnis herbidas ripas, suorum indicio proditus, qui admissi flagitii metu exagitati ad praesidia descivere Romana. absque ullo egressus effectu deinde tabescebat immobilis.', '<p style="text-align: justify;">Specimen. Post haec Gallus Hierapolim profecturus ut expeditioni specie tenus adesset, Antiochensi plebi suppliciter obsecranti ut inediae dispelleret metum, quae per multas difficilisque causas adfore iam sperabatur, non ut mos est principibus, quorum diffusa potestas localibus subinde medetur aerumnis, disponi quicquam statuit vel ex provinciis alimenta transferri conterminis, sed consularem Syriae Theophilum prope adstantem ultima metuenti multitudini dedit id adsidue replicando quod invito rectore nullus egere poterit victu. Nihil est enim virtute amabilius, nihil quod magis adliciat ad diligendum, quippe cum propter virtutem et probitatem etiam eos, quos numquam vidimus, quodam modo diligamus. Quis est qui C. Fabrici, M''. Curi non cum caritate aliqua benevola memoriam usurpet, quos numquam viderit? quis autem est, qui Tarquinium Superbum, qui Sp. Cassium, Sp. Maelium non oderit? Cum duobus ducibus de imperio in Italia est decertatum, Pyrrho et Hannibale; ab altero propter probitatem eius non nimis alienos animos habemus, alterum propter crudelitatem semper haec civitas oderit.<br /><br />Excitavit hic ardor milites per municipia plurima, quae isdem conterminant, dispositos et castella, sed quisque serpentes latius pro viribus repellere moliens, nunc globis confertos, aliquotiens et dispersos multitudine superabatur ingenti, quae nata et educata inter editos recurvosque ambitus montium eos ut loca plana persultat et mollia, missilibus obvios eminus lacessens et ululatu truci perterrens. Metuentes igitur idem latrones Lycaoniam magna parte campestrem cum se inpares nostris fore congressione stataria documentis frequentibus scirent, tramitibus deviis petivere Pamphyliam diu quidem intactam sed timore populationum et caedium, milite per omnia diffuso propinqua, magnis undique praesidiis conmunitam.<br /><br />Et interdum acciderat, ut siquid in penetrali secreto nullo citerioris vitae ministro praesente paterfamilias uxori susurrasset in aurem, velut Amphiarao referente aut Marcio, quondam vatibus inclitis, postridie disceret imperator. ideoque etiam parietes arcanorum soli conscii timebantur. Abusus enim multitudine hominum, quam tranquillis in rebus diutius rexit, ex agrestibus habitaculis urbes construxit multis opibus firmas et viribus, quarum ad praesens pleraeque licet Graecis nominibus appellentur, quae isdem ad arbitrium inposita sunt conditoris, primigenia tamen nomina non amittunt, quae eis Assyria lingua institutores veteres indiderunt.</p>'),
(270, 46, 5, 'Oio scholl', 'Specimen. Coactique aliquotiens nostri pedites ad eos persequendos scandere clivos sublimes etiam si lapsantibus plantis fruticeta prensando vel dumos ad vertices venerint summos, inter arta tamen et invia nullas acies explicare permissi nec firmare nisu valido gressus: hoste discursatore rupium abscisa volvente, ruinis ponderum inmanium consternuntur, aut ex necessitate ultima fortiter dimicante, superati periculose per prona discedunt. Hanc regionem praestitutis celebritati diebus invadere parans dux ante edictus per solitudines Aboraeque amnis herbidas ripas, suorum indicio proditus, qui admissi flagitii metu exagitati ad praesidia descivere Romana. absque ullo egressus effectu deinde tabescebat immobilis.', '<p style="text-align: justify;">Specimen. Post haec Gallus Hierapolim profecturus ut expeditioni specie tenus adesset, Antiochensi plebi suppliciter obsecranti ut inediae dispelleret metum, quae per multas difficilisque causas adfore iam sperabatur, non ut mos est principibus, quorum diffusa potestas localibus subinde medetur aerumnis, disponi quicquam statuit vel ex provinciis alimenta transferri conterminis, sed consularem Syriae Theophilum prope adstantem ultima metuenti multitudini dedit id adsidue replicando quod invito rectore nullus egere poterit victu. Nihil est enim virtute amabilius, nihil quod magis adliciat ad diligendum, quippe cum propter virtutem et probitatem etiam eos, quos numquam vidimus, quodam modo diligamus. Quis est qui C. Fabrici, M''. Curi non cum caritate aliqua benevola memoriam usurpet, quos numquam viderit? quis autem est, qui Tarquinium Superbum, qui Sp. Cassium, Sp. Maelium non oderit? Cum duobus ducibus de imperio in Italia est decertatum, Pyrrho et Hannibale; ab altero propter probitatem eius non nimis alienos animos habemus, alterum propter crudelitatem semper haec civitas oderit.<br /><br />Excitavit hic ardor milites per municipia plurima, quae isdem conterminant, dispositos et castella, sed quisque serpentes latius pro viribus repellere moliens, nunc globis confertos, aliquotiens et dispersos multitudine superabatur ingenti, quae nata et educata inter editos recurvosque ambitus montium eos ut loca plana persultat et mollia, missilibus obvios eminus lacessens et ululatu truci perterrens. Metuentes igitur idem latrones Lycaoniam magna parte campestrem cum se inpares nostris fore congressione stataria documentis frequentibus scirent, tramitibus deviis petivere Pamphyliam diu quidem intactam sed timore populationum et caedium, milite per omnia diffuso propinqua, magnis undique praesidiis conmunitam.<br /><br />Et interdum acciderat, ut siquid in penetrali secreto nullo citerioris vitae ministro praesente paterfamilias uxori susurrasset in aurem, velut Amphiarao referente aut Marcio, quondam vatibus inclitis, postridie disceret imperator. ideoque etiam parietes arcanorum soli conscii timebantur. Abusus enim multitudine hominum, quam tranquillis in rebus diutius rexit, ex agrestibus habitaculis urbes construxit multis opibus firmas et viribus, quarum ad praesens pleraeque licet Graecis nominibus appellentur, quae isdem ad arbitrium inposita sunt conditoris, primigenia tamen nomina non amittunt, quae eis Assyria lingua institutores veteres indiderunt.</p>'),
(271, 46, 6, 'Oio scholl', 'Specimen. Coactique aliquotiens nostri pedites ad eos persequendos scandere clivos sublimes etiam si lapsantibus plantis fruticeta prensando vel dumos ad vertices venerint summos, inter arta tamen et invia nullas acies explicare permissi nec firmare nisu valido gressus: hoste discursatore rupium abscisa volvente, ruinis ponderum inmanium consternuntur, aut ex necessitate ultima fortiter dimicante, superati periculose per prona discedunt. Hanc regionem praestitutis celebritati diebus invadere parans dux ante edictus per solitudines Aboraeque amnis herbidas ripas, suorum indicio proditus, qui admissi flagitii metu exagitati ad praesidia descivere Romana. absque ullo egressus effectu deinde tabescebat immobilis.', '<p style="text-align: justify;">Specimen. Post haec Gallus Hierapolim profecturus ut expeditioni specie tenus adesset, Antiochensi plebi suppliciter obsecranti ut inediae dispelleret metum, quae per multas difficilisque causas adfore iam sperabatur, non ut mos est principibus, quorum diffusa potestas localibus subinde medetur aerumnis, disponi quicquam statuit vel ex provinciis alimenta transferri conterminis, sed consularem Syriae Theophilum prope adstantem ultima metuenti multitudini dedit id adsidue replicando quod invito rectore nullus egere poterit victu. Nihil est enim virtute amabilius, nihil quod magis adliciat ad diligendum, quippe cum propter virtutem et probitatem etiam eos, quos numquam vidimus, quodam modo diligamus. Quis est qui C. Fabrici, M''. Curi non cum caritate aliqua benevola memoriam usurpet, quos numquam viderit? quis autem est, qui Tarquinium Superbum, qui Sp. Cassium, Sp. Maelium non oderit? Cum duobus ducibus de imperio in Italia est decertatum, Pyrrho et Hannibale; ab altero propter probitatem eius non nimis alienos animos habemus, alterum propter crudelitatem semper haec civitas oderit.<br /><br />Excitavit hic ardor milites per municipia plurima, quae isdem conterminant, dispositos et castella, sed quisque serpentes latius pro viribus repellere moliens, nunc globis confertos, aliquotiens et dispersos multitudine superabatur ingenti, quae nata et educata inter editos recurvosque ambitus montium eos ut loca plana persultat et mollia, missilibus obvios eminus lacessens et ululatu truci perterrens. Metuentes igitur idem latrones Lycaoniam magna parte campestrem cum se inpares nostris fore congressione stataria documentis frequentibus scirent, tramitibus deviis petivere Pamphyliam diu quidem intactam sed timore populationum et caedium, milite per omnia diffuso propinqua, magnis undique praesidiis conmunitam.<br /><br />Et interdum acciderat, ut siquid in penetrali secreto nullo citerioris vitae ministro praesente paterfamilias uxori susurrasset in aurem, velut Amphiarao referente aut Marcio, quondam vatibus inclitis, postridie disceret imperator. ideoque etiam parietes arcanorum soli conscii timebantur. Abusus enim multitudine hominum, quam tranquillis in rebus diutius rexit, ex agrestibus habitaculis urbes construxit multis opibus firmas et viribus, quarum ad praesens pleraeque licet Graecis nominibus appellentur, quae isdem ad arbitrium inposita sunt conditoris, primigenia tamen nomina non amittunt, quae eis Assyria lingua institutores veteres indiderunt.</p>'),
(272, 47, 1, 'Institut Superieur des Sciences Technologiques', 'fr. Short description .Institut Superieur des Sciences Technologiques', 'fr. Description .Institut Superieur des Sciences Technologiques'),
(273, 47, 2, 'Institut Superieur des Sciences Technologiques', 'en. Short description .Institut Superieur des Sciences Technologiques', 'en. Description .Institut Superieur des Sciences Technologiques'),
(274, 47, 3, 'Institut Superieur des Sciences Technologiques', 'mg. Short description .Institut Superieur des Sciences Technologiques', 'mg. Description .Institut Superieur des Sciences Technologiques'),
(275, 47, 4, 'Institut Superieur des Sciences Technologiques', 'it. Short description .Institut Superieur des Sciences Technologiques', 'it. Description .Institut Superieur des Sciences Technologiques'),
(276, 47, 5, 'Institut Superieur des Sciences Technologiques', 'es. Short description .Institut Superieur des Sciences Technologiques', 'es. Description .Institut Superieur des Sciences Technologiques'),
(277, 47, 6, 'Institut Superieur des Sciences Technologiques', 'de. Short description .Institut Superieur des Sciences Technologiques', 'de. Description .Institut Superieur des Sciences Technologiques'),
(278, 48, 1, 'Institut Supérieur en Sciences de l''environnement et de gestion', 'fr. Short description .Institut Supérieur en Sciences de l''environnement et de gestion', 'fr. Description .Institut Supérieur en Sciences de l''environnement et de gestion'),
(279, 48, 2, 'Institut Supérieur en Sciences de l''environnement et de gestion', 'en. Short description .Institut Supérieur en Sciences de l''environnement et de gestion', 'en. Description .Institut Supérieur en Sciences de l''environnement et de gestion'),
(280, 48, 3, 'Institut Supérieur en Sciences de l''environnement et de gestion', 'mg. Short description .Institut Supérieur en Sciences de l''environnement et de gestion', 'mg. Description .Institut Supérieur en Sciences de l''environnement et de gestion'),
(281, 48, 4, 'Institut Supérieur en Sciences de l''environnement et de gestion', 'it. Short description .Institut Supérieur en Sciences de l''environnement et de gestion', 'it. Description .Institut Supérieur en Sciences de l''environnement et de gestion'),
(282, 48, 5, 'Institut Supérieur en Sciences de l''environnement et de gestion', 'es. Short description .Institut Supérieur en Sciences de l''environnement et de gestion', 'es. Description .Institut Supérieur en Sciences de l''environnement et de gestion'),
(283, 48, 6, 'Institut Supérieur en Sciences de l''environnement et de gestion', 'de. Short description .Institut Supérieur en Sciences de l''environnement et de gestion', 'de. Description .Institut Supérieur en Sciences de l''environnement et de gestion'),
(284, 49, 1, 'Institut de Formation en Tourisme', 'fr. Short description .Institut de Formation en Tourisme', 'fr. Description .Institut de Formation en Tourisme'),
(285, 49, 2, 'Institut de Formation en Tourisme', 'en. Short description .Institut de Formation en Tourisme', 'en. Description .Institut de Formation en Tourisme'),
(286, 49, 3, 'Institut de Formation en Tourisme', 'mg. Short description .Institut de Formation en Tourisme', 'mg. Description .Institut de Formation en Tourisme'),
(287, 49, 4, 'Institut de Formation en Tourisme', 'it. Short description .Institut de Formation en Tourisme', 'it. Description .Institut de Formation en Tourisme'),
(288, 49, 5, 'Institut de Formation en Tourisme', 'es. Short description .Institut de Formation en Tourisme', 'es. Description .Institut de Formation en Tourisme'),
(289, 49, 6, 'Institut de Formation en Tourisme', 'de. Short description .Institut de Formation en Tourisme', 'de. Description .Institut de Formation en Tourisme'),
(290, 50, 1, 'Institut Superieur Protestant Paul Minault', 'fr. Short description .Institut Superieur Protestant Paul Minault', 'fr. Description .Institut Superieur Protestant Paul Minault'),
(291, 50, 2, 'Institut Superieur Protestant Paul Minault', 'en. Short description .Institut Superieur Protestant Paul Minault', 'en. Description .Institut Superieur Protestant Paul Minault'),
(292, 50, 3, 'Institut Superieur Protestant Paul Minault', 'mg. Short description .Institut Superieur Protestant Paul Minault', 'mg. Description .Institut Superieur Protestant Paul Minault'),
(293, 50, 4, 'Institut Superieur Protestant Paul Minault', 'it. Short description .Institut Superieur Protestant Paul Minault', 'it. Description .Institut Superieur Protestant Paul Minault'),
(294, 50, 5, 'Institut Superieur Protestant Paul Minault', 'es. Short description .Institut Superieur Protestant Paul Minault', 'es. Description .Institut Superieur Protestant Paul Minault'),
(295, 50, 6, 'Institut Superieur Protestant Paul Minault', 'de. Short description .Institut Superieur Protestant Paul Minault', 'de. Description .Institut Superieur Protestant Paul Minault'),
(296, 51, 1, 'Ecole de Coupe et Couture Volana Antananarivo', 'fr. Short description .Ecole de Coupe et Couture Volana Antananarivo', 'fr. Description .Ecole de Coupe et Couture Volana Antananarivo'),
(297, 51, 2, 'Ecole de Coupe et Couture Volana Antananarivo', 'en. Short description .Ecole de Coupe et Couture Volana Antananarivo', 'en. Description .Ecole de Coupe et Couture Volana Antananarivo'),
(298, 51, 3, 'Ecole de Coupe et Couture Volana Antananarivo', 'mg. Short description .Ecole de Coupe et Couture Volana Antananarivo', 'mg. Description .Ecole de Coupe et Couture Volana Antananarivo'),
(299, 51, 4, 'Ecole de Coupe et Couture Volana Antananarivo', 'it. Short description .Ecole de Coupe et Couture Volana Antananarivo', 'it. Description .Ecole de Coupe et Couture Volana Antananarivo'),
(300, 51, 5, 'Ecole de Coupe et Couture Volana Antananarivo', 'es. Short description .Ecole de Coupe et Couture Volana Antananarivo', 'es. Description .Ecole de Coupe et Couture Volana Antananarivo'),
(301, 51, 6, 'Ecole de Coupe et Couture Volana Antananarivo', 'de. Short description .Ecole de Coupe et Couture Volana Antananarivo', 'de. Description .Ecole de Coupe et Couture Volana Antananarivo'),
(302, 52, 1, 'ACADEMIE RAKETAMANGA', 'fr. Short description .ACADEMIE RAKETAMANGA', 'fr. Description .ACADEMIE RAKETAMANGA'),
(303, 52, 2, 'ACADEMIE RAKETAMANGA', 'en. Short description .ACADEMIE RAKETAMANGA', 'en. Description .ACADEMIE RAKETAMANGA'),
(304, 52, 3, 'ACADEMIE RAKETAMANGA', 'mg. Short description .ACADEMIE RAKETAMANGA', 'mg. Description .ACADEMIE RAKETAMANGA'),
(305, 52, 4, 'ACADEMIE RAKETAMANGA', 'it. Short description .ACADEMIE RAKETAMANGA', 'it. Description .ACADEMIE RAKETAMANGA'),
(306, 52, 5, 'ACADEMIE RAKETAMANGA', 'es. Short description .ACADEMIE RAKETAMANGA', 'es. Description .ACADEMIE RAKETAMANGA'),
(307, 52, 6, 'ACADEMIE RAKETAMANGA', 'de. Short description .ACADEMIE RAKETAMANGA', 'de. Description .ACADEMIE RAKETAMANGA'),
(308, 53, 1, 'AFACO', 'fr. Short description .AFACO', 'fr. Description .AFACO'),
(309, 53, 2, 'AFACO', 'en. Short description .AFACO', 'en. Description .AFACO'),
(310, 53, 3, 'AFACO', 'mg. Short description .AFACO', 'mg. Description .AFACO'),
(311, 53, 4, 'AFACO', 'it. Short description .AFACO', 'it. Description .AFACO'),
(312, 53, 5, 'AFACO', 'es. Short description .AFACO', 'es. Description .AFACO'),
(313, 53, 6, 'AFACO', 'de. Short description .AFACO', 'de. Description .AFACO'),
(314, 54, 1, 'ATLAS', 'fr. Short description .ATLAS', 'fr. Description .ATLAS'),
(315, 54, 2, 'ATLAS', 'en. Short description .ATLAS', 'en. Description .ATLAS'),
(316, 54, 3, 'ATLAS', 'mg. Short description .ATLAS', 'mg. Description .ATLAS'),
(317, 54, 4, 'ATLAS', 'it. Short description .ATLAS', 'it. Description .ATLAS'),
(318, 54, 5, 'ATLAS', 'es. Short description .ATLAS', 'es. Description .ATLAS'),
(319, 54, 6, 'ATLAS', 'de. Short description .ATLAS', 'de. Description .ATLAS'),
(320, 55, 1, 'Institut Supérieur ATOUT TOURISME MADAGASCAR', 'fr. Short description .Institut Supérieur ATOUT TOURISME MADAGASCAR', 'fr. Description .Institut Supérieur ATOUT TOURISME MADAGASCAR'),
(321, 55, 2, 'Institut Supérieur ATOUT TOURISME MADAGASCAR', 'en. Short description .Institut Supérieur ATOUT TOURISME MADAGASCAR', 'en. Description .Institut Supérieur ATOUT TOURISME MADAGASCAR'),
(322, 55, 3, 'Institut Supérieur ATOUT TOURISME MADAGASCAR', 'mg. Short description .Institut Supérieur ATOUT TOURISME MADAGASCAR', 'mg. Description .Institut Supérieur ATOUT TOURISME MADAGASCAR'),
(323, 55, 4, 'Institut Supérieur ATOUT TOURISME MADAGASCAR', 'it. Short description .Institut Supérieur ATOUT TOURISME MADAGASCAR', 'it. Description .Institut Supérieur ATOUT TOURISME MADAGASCAR'),
(324, 55, 5, 'Institut Supérieur ATOUT TOURISME MADAGASCAR', 'es. Short description .Institut Supérieur ATOUT TOURISME MADAGASCAR', 'es. Description .Institut Supérieur ATOUT TOURISME MADAGASCAR'),
(325, 55, 6, 'Institut Supérieur ATOUT TOURISME MADAGASCAR', 'de. Short description .Institut Supérieur ATOUT TOURISME MADAGASCAR', 'de. Description .Institut Supérieur ATOUT TOURISME MADAGASCAR'),
(326, 56, 1, 'Boeny Institut Paramédical', 'fr. Short description .Boeny Institut Paramédical', 'fr. Description .Boeny Institut Paramédical'),
(327, 56, 2, 'Boeny Institut Paramédical', 'en. Short description .Boeny Institut Paramédical', 'en. Description .Boeny Institut Paramédical'),
(328, 56, 3, 'Boeny Institut Paramédical', 'mg. Short description .Boeny Institut Paramédical', 'mg. Description .Boeny Institut Paramédical'),
(329, 56, 4, 'Boeny Institut Paramédical', 'it. Short description .Boeny Institut Paramédical', 'it. Description .Boeny Institut Paramédical'),
(330, 56, 5, 'Boeny Institut Paramédical', 'es. Short description .Boeny Institut Paramédical', 'es. Description .Boeny Institut Paramédical'),
(331, 56, 6, 'Boeny Institut Paramédical', 'de. Short description .Boeny Institut Paramédical', 'de. Description .Boeny Institut Paramédical'),
(332, 57, 1, 'Centre d’Etudes, de l’Information et des Technologies, Orienté Professionnel', 'fr. Short description .Centre d’Etudes, de l’Information et des Technologies, Orienté Professionnel', 'fr. Description .Centre d’Etudes, de l’Information et des Technologies, Orienté Professionnel'),
(333, 57, 2, 'Centre d’Etudes, de l’Information et des Technologies, Orienté Professionnel', 'en. Short description .Centre d’Etudes, de l’Information et des Technologies, Orienté Professionnel', 'en. Description .Centre d’Etudes, de l’Information et des Technologies, Orienté Professionnel'),
(334, 57, 3, 'Centre d’Etudes, de l’Information et des Technologies, Orienté Professionnel', 'mg. Short description .Centre d’Etudes, de l’Information et des Technologies, Orienté Professionnel', 'mg. Description .Centre d’Etudes, de l’Information et des Technologies, Orienté Professionnel'),
(335, 57, 4, 'Centre d’Etudes, de l’Information et des Technologies, Orienté Professionnel', 'it. Short description .Centre d’Etudes, de l’Information et des Technologies, Orienté Professionnel', 'it. Description .Centre d’Etudes, de l’Information et des Technologies, Orienté Professionnel'),
(336, 57, 5, 'Centre d’Etudes, de l’Information et des Technologies, Orienté Professionnel', 'es. Short description .Centre d’Etudes, de l’Information et des Technologies, Orienté Professionnel', 'es. Description .Centre d’Etudes, de l’Information et des Technologies, Orienté Professionnel'),
(337, 57, 6, 'Centre d’Etudes, de l’Information et des Technologies, Orienté Professionnel', 'de. Short description .Centre d’Etudes, de l’Information et des Technologies, Orienté Professionnel', 'de. Description .Centre d’Etudes, de l’Information et des Technologies, Orienté Professionnel'),
(338, 58, 1, 'Centre Ecologique de Libanona .', 'fr. Short description .Centre Ecologique de Libanona .', 'fr. Description .Centre Ecologique de Libanona .'),
(339, 58, 2, 'Centre Ecologique de Libanona .', 'en. Short description .Centre Ecologique de Libanona .', 'en. Description .Centre Ecologique de Libanona .'),
(340, 58, 3, 'Centre Ecologique de Libanona .', 'mg. Short description .Centre Ecologique de Libanona .', 'mg. Description .Centre Ecologique de Libanona .'),
(341, 58, 4, 'Centre Ecologique de Libanona .', 'it. Short description .Centre Ecologique de Libanona .', 'it. Description .Centre Ecologique de Libanona .'),
(342, 58, 5, 'Centre Ecologique de Libanona .', 'es. Short description .Centre Ecologique de Libanona .', 'es. Description .Centre Ecologique de Libanona .'),
(343, 58, 6, 'Centre Ecologique de Libanona .', 'de. Short description .Centre Ecologique de Libanona .', 'de. Description .Centre Ecologique de Libanona .'),
(344, 59, 1, 'Conseils - Etudes - Réalisation - Formation ARMI', 'fr. Short description .Conseils - Etudes - Réalisation - Formation ARMI', 'fr. Description .Conseils - Etudes - Réalisation - Formation ARMI'),
(345, 59, 2, 'Conseils - Etudes - Réalisation - Formation ARMI', 'en. Short description .Conseils - Etudes - Réalisation - Formation ARMI', 'en. Description .Conseils - Etudes - Réalisation - Formation ARMI'),
(346, 59, 3, 'Conseils - Etudes - Réalisation - Formation ARMI', 'mg. Short description .Conseils - Etudes - Réalisation - Formation ARMI', 'mg. Description .Conseils - Etudes - Réalisation - Formation ARMI'),
(347, 59, 4, 'Conseils - Etudes - Réalisation - Formation ARMI', 'it. Short description .Conseils - Etudes - Réalisation - Formation ARMI', 'it. Description .Conseils - Etudes - Réalisation - Formation ARMI'),
(348, 59, 5, 'Conseils - Etudes - Réalisation - Formation ARMI', 'es. Short description .Conseils - Etudes - Réalisation - Formation ARMI', 'es. Description .Conseils - Etudes - Réalisation - Formation ARMI'),
(349, 59, 6, 'Conseils - Etudes - Réalisation - Formation ARMI', 'de. Short description .Conseils - Etudes - Réalisation - Formation ARMI', 'de. Description .Conseils - Etudes - Réalisation - Formation ARMI'),
(350, 60, 1, 'Centre de Formation à des Activités du Commerce', 'fr. Short description .Centre de Formation à des Activités du Commerce', 'fr. Description .Centre de Formation à des Activités du Commerce'),
(351, 60, 2, 'Centre de Formation à des Activités du Commerce', 'en. Short description .Centre de Formation à des Activités du Commerce', 'en. Description .Centre de Formation à des Activités du Commerce'),
(352, 60, 3, 'Centre de Formation à des Activités du Commerce', 'mg. Short description .Centre de Formation à des Activités du Commerce', 'mg. Description .Centre de Formation à des Activités du Commerce'),
(353, 60, 4, 'Centre de Formation à des Activités du Commerce', 'it. Short description .Centre de Formation à des Activités du Commerce', 'it. Description .Centre de Formation à des Activités du Commerce'),
(354, 60, 5, 'Centre de Formation à des Activités du Commerce', 'es. Short description .Centre de Formation à des Activités du Commerce', 'es. Description .Centre de Formation à des Activités du Commerce'),
(355, 60, 6, 'Centre de Formation à des Activités du Commerce', 'de. Short description .Centre de Formation à des Activités du Commerce', 'de. Description .Centre de Formation à des Activités du Commerce'),
(356, 61, 1, 'Centre de Formation et d’Application du Machinisme Agricole Antsirabe', 'fr. Short description .Centre de Formation et d’Application du Machinisme Agricole Antsirabe', 'fr. Description .Centre de Formation et d’Application du Machinisme Agricole Antsirabe'),
(357, 61, 2, 'Centre de Formation et d’Application du Machinisme Agricole Antsirabe', 'en. Short description .Centre de Formation et d’Application du Machinisme Agricole Antsirabe', 'en. Description .Centre de Formation et d’Application du Machinisme Agricole Antsirabe'),
(358, 61, 3, 'Centre de Formation et d’Application du Machinisme Agricole Antsirabe', 'mg. Short description .Centre de Formation et d’Application du Machinisme Agricole Antsirabe', 'mg. Description .Centre de Formation et d’Application du Machinisme Agricole Antsirabe'),
(359, 61, 4, 'Centre de Formation et d’Application du Machinisme Agricole Antsirabe', 'it. Short description .Centre de Formation et d’Application du Machinisme Agricole Antsirabe', 'it. Description .Centre de Formation et d’Application du Machinisme Agricole Antsirabe'),
(360, 61, 5, 'Centre de Formation et d’Application du Machinisme Agricole Antsirabe', 'es. Short description .Centre de Formation et d’Application du Machinisme Agricole Antsirabe', 'es. Description .Centre de Formation et d’Application du Machinisme Agricole Antsirabe'),
(361, 61, 6, 'Centre de Formation et d’Application du Machinisme Agricole Antsirabe', 'de. Short description .Centre de Formation et d’Application du Machinisme Agricole Antsirabe', 'de. Description .Centre de Formation et d’Application du Machinisme Agricole Antsirabe'),
(362, 62, 1, 'Institut d’Administration des Entreprises – COGEFE - FORMATION', 'fr. Short description .Institut d’Administration des Entreprises – COGEFE - FORMATION', 'fr. Description .Institut d’Administration des Entreprises – COGEFE - FORMATION'),
(363, 62, 2, 'Institut d’Administration des Entreprises – COGEFE - FORMATION', 'en. Short description .Institut d’Administration des Entreprises – COGEFE - FORMATION', 'en. Description .Institut d’Administration des Entreprises – COGEFE - FORMATION'),
(364, 62, 3, 'Institut d’Administration des Entreprises – COGEFE - FORMATION', 'mg. Short description .Institut d’Administration des Entreprises – COGEFE - FORMATION', 'mg. Description .Institut d’Administration des Entreprises – COGEFE - FORMATION'),
(365, 62, 4, 'Institut d’Administration des Entreprises – COGEFE - FORMATION', 'it. Short description .Institut d’Administration des Entreprises – COGEFE - FORMATION', 'it. Description .Institut d’Administration des Entreprises – COGEFE - FORMATION'),
(366, 62, 5, 'Institut d’Administration des Entreprises – COGEFE - FORMATION', 'es. Short description .Institut d’Administration des Entreprises – COGEFE - FORMATION', 'es. Description .Institut d’Administration des Entreprises – COGEFE - FORMATION'),
(367, 62, 6, 'Institut d’Administration des Entreprises – COGEFE - FORMATION', 'de. Short description .Institut d’Administration des Entreprises – COGEFE - FORMATION', 'de. Description .Institut d’Administration des Entreprises – COGEFE - FORMATION'),
(368, 63, 1, 'Conseil de Recherche - Action en Développement Communautaire', 'fr. Short description .Conseil de Recherche - Action en Développement Communautaire', 'fr. Description .Conseil de Recherche - Action en Développement Communautaire'),
(369, 63, 2, 'Conseil de Recherche - Action en Développement Communautaire', 'en. Short description .Conseil de Recherche - Action en Développement Communautaire', 'en. Description .Conseil de Recherche - Action en Développement Communautaire'),
(370, 63, 3, 'Conseil de Recherche - Action en Développement Communautaire', 'mg. Short description .Conseil de Recherche - Action en Développement Communautaire', 'mg. Description .Conseil de Recherche - Action en Développement Communautaire'),
(371, 63, 4, 'Conseil de Recherche - Action en Développement Communautaire', 'it. Short description .Conseil de Recherche - Action en Développement Communautaire', 'it. Description .Conseil de Recherche - Action en Développement Communautaire'),
(372, 63, 5, 'Conseil de Recherche - Action en Développement Communautaire', 'es. Short description .Conseil de Recherche - Action en Développement Communautaire', 'es. Description .Conseil de Recherche - Action en Développement Communautaire'),
(373, 63, 6, 'Conseil de Recherche - Action en Développement Communautaire', 'de. Short description .Conseil de Recherche - Action en Développement Communautaire', 'de. Description .Conseil de Recherche - Action en Développement Communautaire'),
(374, 64, 1, 'E cole de Comptabilité et d’Administration Taratra', 'fr. Short description .E cole de Comptabilité et d’Administration Taratra', 'fr. Description .E cole de Comptabilité et d’Administration Taratra'),
(375, 64, 2, 'E cole de Comptabilité et d’Administration Taratra', 'en. Short description .E cole de Comptabilité et d’Administration Taratra', 'en. Description .E cole de Comptabilité et d’Administration Taratra'),
(376, 64, 3, 'E cole de Comptabilité et d’Administration Taratra', 'mg. Short description .E cole de Comptabilité et d’Administration Taratra', 'mg. Description .E cole de Comptabilité et d’Administration Taratra'),
(377, 64, 4, 'E cole de Comptabilité et d’Administration Taratra', 'it. Short description .E cole de Comptabilité et d’Administration Taratra', 'it. Description .E cole de Comptabilité et d’Administration Taratra'),
(378, 64, 5, 'E cole de Comptabilité et d’Administration Taratra', 'es. Short description .E cole de Comptabilité et d’Administration Taratra', 'es. Description .E cole de Comptabilité et d’Administration Taratra'),
(379, 64, 6, 'E cole de Comptabilité et d’Administration Taratra', 'de. Short description .E cole de Comptabilité et d’Administration Taratra', 'de. Description .E cole de Comptabilité et d’Administration Taratra'),
(380, 65, 1, 'ELI - Laulanie Green University', 'fr. Short description .ELI - Laulanie Green University', 'fr. Description .ELI - Laulanie Green University'),
(381, 65, 2, 'ELI - Laulanie Green University', 'en. Short description .ELI - Laulanie Green University', 'en. Description .ELI - Laulanie Green University'),
(382, 65, 3, 'ELI - Laulanie Green University', 'mg. Short description .ELI - Laulanie Green University', 'mg. Description .ELI - Laulanie Green University'),
(383, 65, 4, 'ELI - Laulanie Green University', 'it. Short description .ELI - Laulanie Green University', 'it. Description .ELI - Laulanie Green University'),
(384, 65, 5, 'ELI - Laulanie Green University', 'es. Short description .ELI - Laulanie Green University', 'es. Description .ELI - Laulanie Green University'),
(385, 65, 6, 'ELI - Laulanie Green University', 'de. Short description .ELI - Laulanie Green University', 'de. Description .ELI - Laulanie Green University'),
(386, 66, 1, 'Ecole Professionnelle de Commerce et Technique', 'fr. Short description .Ecole Professionnelle de Commerce et Technique', 'fr. Description .Ecole Professionnelle de Commerce et Technique'),
(387, 66, 2, 'Ecole Professionnelle de Commerce et Technique', 'en. Short description .Ecole Professionnelle de Commerce et Technique', 'en. Description .Ecole Professionnelle de Commerce et Technique'),
(388, 66, 3, 'Ecole Professionnelle de Commerce et Technique', 'mg. Short description .Ecole Professionnelle de Commerce et Technique', 'mg. Description .Ecole Professionnelle de Commerce et Technique'),
(389, 66, 4, 'Ecole Professionnelle de Commerce et Technique', 'it. Short description .Ecole Professionnelle de Commerce et Technique', 'it. Description .Ecole Professionnelle de Commerce et Technique'),
(390, 66, 5, 'Ecole Professionnelle de Commerce et Technique', 'es. Short description .Ecole Professionnelle de Commerce et Technique', 'es. Description .Ecole Professionnelle de Commerce et Technique'),
(391, 66, 6, 'Ecole Professionnelle de Commerce et Technique', 'de. Short description .Ecole Professionnelle de Commerce et Technique', 'de. Description .Ecole Professionnelle de Commerce et Technique'),
(392, 67, 1, 'Etablissement Privé d’Enseignement Supérieur Lumière', 'fr. Short description .Etablissement Privé d’Enseignement Supérieur Lumière', 'fr. Description .Etablissement Privé d’Enseignement Supérieur Lumière'),
(393, 67, 2, 'Etablissement Privé d’Enseignement Supérieur Lumière', 'en. Short description .Etablissement Privé d’Enseignement Supérieur Lumière', 'en. Description .Etablissement Privé d’Enseignement Supérieur Lumière'),
(394, 67, 3, 'Etablissement Privé d’Enseignement Supérieur Lumière', 'mg. Short description .Etablissement Privé d’Enseignement Supérieur Lumière', 'mg. Description .Etablissement Privé d’Enseignement Supérieur Lumière'),
(395, 67, 4, 'Etablissement Privé d’Enseignement Supérieur Lumière', 'it. Short description .Etablissement Privé d’Enseignement Supérieur Lumière', 'it. Description .Etablissement Privé d’Enseignement Supérieur Lumière'),
(396, 67, 5, 'Etablissement Privé d’Enseignement Supérieur Lumière', 'es. Short description .Etablissement Privé d’Enseignement Supérieur Lumière', 'es. Description .Etablissement Privé d’Enseignement Supérieur Lumière'),
(397, 67, 6, 'Etablissement Privé d’Enseignement Supérieur Lumière', 'de. Short description .Etablissement Privé d’Enseignement Supérieur Lumière', 'de. Description .Etablissement Privé d’Enseignement Supérieur Lumière'),
(398, 68, 1, 'Ecole Professionnelle Supérieure Agricole', 'fr. Short description .Ecole Professionnelle Supérieure Agricole', 'fr. Description .Ecole Professionnelle Supérieure Agricole'),
(399, 68, 2, 'Ecole Professionnelle Supérieure Agricole', 'en. Short description .Ecole Professionnelle Supérieure Agricole', 'en. Description .Ecole Professionnelle Supérieure Agricole'),
(400, 68, 3, 'Ecole Professionnelle Supérieure Agricole', 'mg. Short description .Ecole Professionnelle Supérieure Agricole', 'mg. Description .Ecole Professionnelle Supérieure Agricole'),
(401, 68, 4, 'Ecole Professionnelle Supérieure Agricole', 'it. Short description .Ecole Professionnelle Supérieure Agricole', 'it. Description .Ecole Professionnelle Supérieure Agricole'),
(402, 68, 5, 'Ecole Professionnelle Supérieure Agricole', 'es. Short description .Ecole Professionnelle Supérieure Agricole', 'es. Description .Ecole Professionnelle Supérieure Agricole'),
(403, 68, 6, 'Ecole Professionnelle Supérieure Agricole', 'de. Short description .Ecole Professionnelle Supérieure Agricole', 'de. Description .Ecole Professionnelle Supérieure Agricole'),
(404, 69, 1, 'Ecole Supérieure de Bâtiment et Travaux Publics Bevalala', 'fr. Short description .Ecole Supérieure de Bâtiment et Travaux Publics Bevalala', 'fr. Description .Ecole Supérieure de Bâtiment et Travaux Publics Bevalala'),
(405, 69, 2, 'Ecole Supérieure de Bâtiment et Travaux Publics Bevalala', 'en. Short description .Ecole Supérieure de Bâtiment et Travaux Publics Bevalala', 'en. Description .Ecole Supérieure de Bâtiment et Travaux Publics Bevalala'),
(406, 69, 3, 'Ecole Supérieure de Bâtiment et Travaux Publics Bevalala', 'mg. Short description .Ecole Supérieure de Bâtiment et Travaux Publics Bevalala', 'mg. Description .Ecole Supérieure de Bâtiment et Travaux Publics Bevalala'),
(407, 69, 4, 'Ecole Supérieure de Bâtiment et Travaux Publics Bevalala', 'it. Short description .Ecole Supérieure de Bâtiment et Travaux Publics Bevalala', 'it. Description .Ecole Supérieure de Bâtiment et Travaux Publics Bevalala'),
(408, 69, 5, 'Ecole Supérieure de Bâtiment et Travaux Publics Bevalala', 'es. Short description .Ecole Supérieure de Bâtiment et Travaux Publics Bevalala', 'es. Description .Ecole Supérieure de Bâtiment et Travaux Publics Bevalala'),
(409, 69, 6, 'Ecole Supérieure de Bâtiment et Travaux Publics Bevalala', 'de. Short description .Ecole Supérieure de Bâtiment et Travaux Publics Bevalala', 'de. Description .Ecole Supérieure de Bâtiment et Travaux Publics Bevalala'),
(410, 70, 1, 'Ecole Supérieure de Développement Economique et Social', 'fr. Short description .Ecole Supérieure de Développement Economique et Social', 'fr. Description .Ecole Supérieure de Développement Economique et Social'),
(411, 70, 2, 'Ecole Supérieure de Développement Economique et Social', 'en. Short description .Ecole Supérieure de Développement Economique et Social', 'en. Description .Ecole Supérieure de Développement Economique et Social'),
(412, 70, 3, 'Ecole Supérieure de Développement Economique et Social', 'mg. Short description .Ecole Supérieure de Développement Economique et Social', 'mg. Description .Ecole Supérieure de Développement Economique et Social'),
(413, 70, 4, 'Ecole Supérieure de Développement Economique et Social', 'it. Short description .Ecole Supérieure de Développement Economique et Social', 'it. Description .Ecole Supérieure de Développement Economique et Social'),
(414, 70, 5, 'Ecole Supérieure de Développement Economique et Social', 'es. Short description .Ecole Supérieure de Développement Economique et Social', 'es. Description .Ecole Supérieure de Développement Economique et Social'),
(415, 70, 6, 'Ecole Supérieure de Développement Economique et Social', 'de. Short description .Ecole Supérieure de Développement Economique et Social', 'de. Description .Ecole Supérieure de Développement Economique et Social'),
(416, 71, 1, 'Ecole Supérieure de Droit et de Sciences Politiques', 'fr. Short description .Ecole Supérieure de Droit et de Sciences Politiques', 'fr. Description .Ecole Supérieure de Droit et de Sciences Politiques'),
(417, 71, 2, 'Ecole Supérieure de Droit et de Sciences Politiques', 'en. Short description .Ecole Supérieure de Droit et de Sciences Politiques', 'en. Description .Ecole Supérieure de Droit et de Sciences Politiques'),
(418, 71, 3, 'Ecole Supérieure de Droit et de Sciences Politiques', 'mg. Short description .Ecole Supérieure de Droit et de Sciences Politiques', 'mg. Description .Ecole Supérieure de Droit et de Sciences Politiques'),
(419, 71, 4, 'Ecole Supérieure de Droit et de Sciences Politiques', 'it. Short description .Ecole Supérieure de Droit et de Sciences Politiques', 'it. Description .Ecole Supérieure de Droit et de Sciences Politiques'),
(420, 71, 5, 'Ecole Supérieure de Droit et de Sciences Politiques', 'es. Short description .Ecole Supérieure de Droit et de Sciences Politiques', 'es. Description .Ecole Supérieure de Droit et de Sciences Politiques'),
(421, 71, 6, 'Ecole Supérieure de Droit et de Sciences Politiques', 'de. Short description .Ecole Supérieure de Droit et de Sciences Politiques', 'de. Description .Ecole Supérieure de Droit et de Sciences Politiques'),
(422, 72, 1, 'Ecole Supérieure de Formation des Infirmiers', 'fr. Short description .Ecole Supérieure de Formation des Infirmiers', 'fr. Description .Ecole Supérieure de Formation des Infirmiers'),
(423, 72, 2, 'Ecole Supérieure de Formation des Infirmiers', 'en. Short description .Ecole Supérieure de Formation des Infirmiers', 'en. Description .Ecole Supérieure de Formation des Infirmiers'),
(424, 72, 3, 'Ecole Supérieure de Formation des Infirmiers', 'mg. Short description .Ecole Supérieure de Formation des Infirmiers', 'mg. Description .Ecole Supérieure de Formation des Infirmiers'),
(425, 72, 4, 'Ecole Supérieure de Formation des Infirmiers', 'it. Short description .Ecole Supérieure de Formation des Infirmiers', 'it. Description .Ecole Supérieure de Formation des Infirmiers'),
(426, 72, 5, 'Ecole Supérieure de Formation des Infirmiers', 'es. Short description .Ecole Supérieure de Formation des Infirmiers', 'es. Description .Ecole Supérieure de Formation des Infirmiers'),
(427, 72, 6, 'Ecole Supérieure de Formation des Infirmiers', 'de. Short description .Ecole Supérieure de Formation des Infirmiers', 'de. Description .Ecole Supérieure de Formation des Infirmiers'),
(428, 73, 1, 'Ecole Supérieure de Formation Paramédicale de Bongolava', 'fr. Short description .Ecole Supérieure de Formation Paramédicale de Bongolava', 'fr. Description .Ecole Supérieure de Formation Paramédicale de Bongolava'),
(429, 73, 2, 'Ecole Supérieure de Formation Paramédicale de Bongolava', 'en. Short description .Ecole Supérieure de Formation Paramédicale de Bongolava', 'en. Description .Ecole Supérieure de Formation Paramédicale de Bongolava'),
(430, 73, 3, 'Ecole Supérieure de Formation Paramédicale de Bongolava', 'mg. Short description .Ecole Supérieure de Formation Paramédicale de Bongolava', 'mg. Description .Ecole Supérieure de Formation Paramédicale de Bongolava'),
(431, 73, 4, 'Ecole Supérieure de Formation Paramédicale de Bongolava', 'it. Short description .Ecole Supérieure de Formation Paramédicale de Bongolava', 'it. Description .Ecole Supérieure de Formation Paramédicale de Bongolava'),
(432, 73, 5, 'Ecole Supérieure de Formation Paramédicale de Bongolava', 'es. Short description .Ecole Supérieure de Formation Paramédicale de Bongolava', 'es. Description .Ecole Supérieure de Formation Paramédicale de Bongolava'),
(433, 73, 6, 'Ecole Supérieure de Formation Paramédicale de Bongolava', 'de. Short description .Ecole Supérieure de Formation Paramédicale de Bongolava', 'de. Description .Ecole Supérieure de Formation Paramédicale de Bongolava'),
(434, 74, 1, 'Ecole des Sage - femme et Infirmier de Fianarantsoa', 'fr. Short description .Ecole des Sage - femme et Infirmier de Fianarantsoa', 'fr. Description .Ecole des Sage - femme et Infirmier de Fianarantsoa'),
(435, 74, 2, 'Ecole des Sage - femme et Infirmier de Fianarantsoa', 'en. Short description .Ecole des Sage - femme et Infirmier de Fianarantsoa', 'en. Description .Ecole des Sage - femme et Infirmier de Fianarantsoa'),
(436, 74, 3, 'Ecole des Sage - femme et Infirmier de Fianarantsoa', 'mg. Short description .Ecole des Sage - femme et Infirmier de Fianarantsoa', 'mg. Description .Ecole des Sage - femme et Infirmier de Fianarantsoa'),
(437, 74, 4, 'Ecole des Sage - femme et Infirmier de Fianarantsoa', 'it. Short description .Ecole des Sage - femme et Infirmier de Fianarantsoa', 'it. Description .Ecole des Sage - femme et Infirmier de Fianarantsoa'),
(438, 74, 5, 'Ecole des Sage - femme et Infirmier de Fianarantsoa', 'es. Short description .Ecole des Sage - femme et Infirmier de Fianarantsoa', 'es. Description .Ecole des Sage - femme et Infirmier de Fianarantsoa'),
(439, 74, 6, 'Ecole des Sage - femme et Infirmier de Fianarantsoa', 'de. Short description .Ecole des Sage - femme et Infirmier de Fianarantsoa', 'de. Description .Ecole des Sage - femme et Infirmier de Fianarantsoa'),
(440, 75, 1, 'Ecole Supérieure d’Informatique et de Gestion des Entreprises', 'fr. Short description .Ecole Supérieure d’Informatique et de Gestion des Entreprises', 'fr. Description .Ecole Supérieure d’Informatique et de Gestion des Entreprises'),
(441, 75, 2, 'Ecole Supérieure d’Informatique et de Gestion des Entreprises', 'en. Short description .Ecole Supérieure d’Informatique et de Gestion des Entreprises', 'en. Description .Ecole Supérieure d’Informatique et de Gestion des Entreprises'),
(442, 75, 3, 'Ecole Supérieure d’Informatique et de Gestion des Entreprises', 'mg. Short description .Ecole Supérieure d’Informatique et de Gestion des Entreprises', 'mg. Description .Ecole Supérieure d’Informatique et de Gestion des Entreprises'),
(443, 75, 4, 'Ecole Supérieure d’Informatique et de Gestion des Entreprises', 'it. Short description .Ecole Supérieure d’Informatique et de Gestion des Entreprises', 'it. Description .Ecole Supérieure d’Informatique et de Gestion des Entreprises'),
(444, 75, 5, 'Ecole Supérieure d’Informatique et de Gestion des Entreprises', 'es. Short description .Ecole Supérieure d’Informatique et de Gestion des Entreprises', 'es. Description .Ecole Supérieure d’Informatique et de Gestion des Entreprises'),
(445, 75, 6, 'Ecole Supérieure d’Informatique et de Gestion des Entreprises', 'de. Short description .Ecole Supérieure d’Informatique et de Gestion des Entreprises', 'de. Description .Ecole Supérieure d’Informatique et de Gestion des Entreprises'),
(446, 76, 1, 'Ecole Supérieure d’Infirmier et  Sage - femme Jean Paul II', 'fr. Short description .Ecole Supérieure d’Infirmier et  Sage - femme Jean Paul II', 'fr. Description .Ecole Supérieure d’Infirmier et  Sage - femme Jean Paul II'),
(447, 76, 2, 'Ecole Supérieure d’Infirmier et  Sage - femme Jean Paul II', 'en. Short description .Ecole Supérieure d’Infirmier et  Sage - femme Jean Paul II', 'en. Description .Ecole Supérieure d’Infirmier et  Sage - femme Jean Paul II'),
(448, 76, 3, 'Ecole Supérieure d’Infirmier et  Sage - femme Jean Paul II', 'mg. Short description .Ecole Supérieure d’Infirmier et  Sage - femme Jean Paul II', 'mg. Description .Ecole Supérieure d’Infirmier et  Sage - femme Jean Paul II'),
(449, 76, 4, 'Ecole Supérieure d’Infirmier et  Sage - femme Jean Paul II', 'it. Short description .Ecole Supérieure d’Infirmier et  Sage - femme Jean Paul II', 'it. Description .Ecole Supérieure d’Infirmier et  Sage - femme Jean Paul II'),
(450, 76, 5, 'Ecole Supérieure d’Infirmier et  Sage - femme Jean Paul II', 'es. Short description .Ecole Supérieure d’Infirmier et  Sage - femme Jean Paul II', 'es. Description .Ecole Supérieure d’Infirmier et  Sage - femme Jean Paul II'),
(451, 76, 6, 'Ecole Supérieure d’Infirmier et  Sage - femme Jean Paul II', 'de. Short description .Ecole Supérieure d’Infirmier et  Sage - femme Jean Paul II', 'de. Description .Ecole Supérieure d’Infirmier et  Sage - femme Jean Paul II'),
(452, 77, 1, 'Ecole Supérieure d’Infirmière et de Sage - femme Saint François d’Assise', 'fr. Short description .Ecole Supérieure d’Infirmière et de Sage - femme Saint François d’Assise', 'fr. Description .Ecole Supérieure d’Infirmière et de Sage - femme Saint François d’Assise');
INSERT INTO `sl_school_translate` (`id`, `school_id`, `locale_id`, `name`, `short_description`, `description`) VALUES
(453, 77, 2, 'Ecole Supérieure d’Infirmière et de Sage - femme Saint François d’Assise', 'en. Short description .Ecole Supérieure d’Infirmière et de Sage - femme Saint François d’Assise', 'en. Description .Ecole Supérieure d’Infirmière et de Sage - femme Saint François d’Assise'),
(454, 77, 3, 'Ecole Supérieure d’Infirmière et de Sage - femme Saint François d’Assise', 'mg. Short description .Ecole Supérieure d’Infirmière et de Sage - femme Saint François d’Assise', 'mg. Description .Ecole Supérieure d’Infirmière et de Sage - femme Saint François d’Assise'),
(455, 77, 4, 'Ecole Supérieure d’Infirmière et de Sage - femme Saint François d’Assise', 'it. Short description .Ecole Supérieure d’Infirmière et de Sage - femme Saint François d’Assise', 'it. Description .Ecole Supérieure d’Infirmière et de Sage - femme Saint François d’Assise'),
(456, 77, 5, 'Ecole Supérieure d’Infirmière et de Sage - femme Saint François d’Assise', 'es. Short description .Ecole Supérieure d’Infirmière et de Sage - femme Saint François d’Assise', 'es. Description .Ecole Supérieure d’Infirmière et de Sage - femme Saint François d’Assise'),
(457, 77, 6, 'Ecole Supérieure d’Infirmière et de Sage - femme Saint François d’Assise', 'de. Short description .Ecole Supérieure d’Infirmière et de Sage - femme Saint François d’Assise', 'de. Description .Ecole Supérieure d’Infirmière et de Sage - femme Saint François d’Assise'),
(458, 78, 1, 'Ecole Supérieure des Métiers et Arts Plastiques', 'fr. Short description .Ecole Supérieure des Métiers et Arts Plastiques', 'fr. Description .Ecole Supérieure des Métiers et Arts Plastiques'),
(459, 78, 2, 'Ecole Supérieure des Métiers et Arts Plastiques', 'en. Short description .Ecole Supérieure des Métiers et Arts Plastiques', 'en. Description .Ecole Supérieure des Métiers et Arts Plastiques'),
(460, 78, 3, 'Ecole Supérieure des Métiers et Arts Plastiques', 'mg. Short description .Ecole Supérieure des Métiers et Arts Plastiques', 'mg. Description .Ecole Supérieure des Métiers et Arts Plastiques'),
(461, 78, 4, 'Ecole Supérieure des Métiers et Arts Plastiques', 'it. Short description .Ecole Supérieure des Métiers et Arts Plastiques', 'it. Description .Ecole Supérieure des Métiers et Arts Plastiques'),
(462, 78, 5, 'Ecole Supérieure des Métiers et Arts Plastiques', 'es. Short description .Ecole Supérieure des Métiers et Arts Plastiques', 'es. Description .Ecole Supérieure des Métiers et Arts Plastiques'),
(463, 78, 6, 'Ecole Supérieure des Métiers et Arts Plastiques', 'de. Short description .Ecole Supérieure des Métiers et Arts Plastiques', 'de. Description .Ecole Supérieure des Métiers et Arts Plastiques'),
(464, 79, 1, 'Etablissement Supérieur Professionnel Bureautique, Informatique et Gestion', 'fr. Short description .Etablissement Supérieur Professionnel Bureautique, Informatique et Gestion', 'fr. Description .Etablissement Supérieur Professionnel Bureautique, Informatique et Gestion'),
(465, 79, 2, 'Etablissement Supérieur Professionnel Bureautique, Informatique et Gestion', 'en. Short description .Etablissement Supérieur Professionnel Bureautique, Informatique et Gestion', 'en. Description .Etablissement Supérieur Professionnel Bureautique, Informatique et Gestion'),
(466, 79, 3, 'Etablissement Supérieur Professionnel Bureautique, Informatique et Gestion', 'mg. Short description .Etablissement Supérieur Professionnel Bureautique, Informatique et Gestion', 'mg. Description .Etablissement Supérieur Professionnel Bureautique, Informatique et Gestion'),
(467, 79, 4, 'Etablissement Supérieur Professionnel Bureautique, Informatique et Gestion', 'it. Short description .Etablissement Supérieur Professionnel Bureautique, Informatique et Gestion', 'it. Description .Etablissement Supérieur Professionnel Bureautique, Informatique et Gestion'),
(468, 79, 5, 'Etablissement Supérieur Professionnel Bureautique, Informatique et Gestion', 'es. Short description .Etablissement Supérieur Professionnel Bureautique, Informatique et Gestion', 'es. Description .Etablissement Supérieur Professionnel Bureautique, Informatique et Gestion'),
(469, 79, 6, 'Etablissement Supérieur Professionnel Bureautique, Informatique et Gestion', 'de. Short description .Etablissement Supérieur Professionnel Bureautique, Informatique et Gestion', 'de. Description .Etablissement Supérieur Professionnel Bureautique, Informatique et Gestion'),
(470, 80, 1, 'Ecole Supérieure Paramédicale Alaotra Mangoro', 'fr. Short description .Ecole Supérieure Paramédicale Alaotra Mangoro', 'fr. Description .Ecole Supérieure Paramédicale Alaotra Mangoro'),
(471, 80, 2, 'Ecole Supérieure Paramédicale Alaotra Mangoro', 'en. Short description .Ecole Supérieure Paramédicale Alaotra Mangoro', 'en. Description .Ecole Supérieure Paramédicale Alaotra Mangoro'),
(472, 80, 3, 'Ecole Supérieure Paramédicale Alaotra Mangoro', 'mg. Short description .Ecole Supérieure Paramédicale Alaotra Mangoro', 'mg. Description .Ecole Supérieure Paramédicale Alaotra Mangoro'),
(473, 80, 4, 'Ecole Supérieure Paramédicale Alaotra Mangoro', 'it. Short description .Ecole Supérieure Paramédicale Alaotra Mangoro', 'it. Description .Ecole Supérieure Paramédicale Alaotra Mangoro'),
(474, 80, 5, 'Ecole Supérieure Paramédicale Alaotra Mangoro', 'es. Short description .Ecole Supérieure Paramédicale Alaotra Mangoro', 'es. Description .Ecole Supérieure Paramédicale Alaotra Mangoro'),
(475, 80, 6, 'Ecole Supérieure Paramédicale Alaotra Mangoro', 'de. Short description .Ecole Supérieure Paramédicale Alaotra Mangoro', 'de. Description .Ecole Supérieure Paramédicale Alaotra Mangoro'),
(476, 81, 1, 'Ecole Supérieure Professionnelle en Informatique et Commerce', 'fr. Short description .Ecole Supérieure Professionnelle en Informatique et Commerce', 'fr. Description .Ecole Supérieure Professionnelle en Informatique et Commerce'),
(477, 81, 2, 'Ecole Supérieure Professionnelle en Informatique et Commerce', 'en. Short description .Ecole Supérieure Professionnelle en Informatique et Commerce', 'en. Description .Ecole Supérieure Professionnelle en Informatique et Commerce'),
(478, 81, 3, 'Ecole Supérieure Professionnelle en Informatique et Commerce', 'mg. Short description .Ecole Supérieure Professionnelle en Informatique et Commerce', 'mg. Description .Ecole Supérieure Professionnelle en Informatique et Commerce'),
(479, 81, 4, 'Ecole Supérieure Professionnelle en Informatique et Commerce', 'it. Short description .Ecole Supérieure Professionnelle en Informatique et Commerce', 'it. Description .Ecole Supérieure Professionnelle en Informatique et Commerce'),
(480, 81, 5, 'Ecole Supérieure Professionnelle en Informatique et Commerce', 'es. Short description .Ecole Supérieure Professionnelle en Informatique et Commerce', 'es. Description .Ecole Supérieure Professionnelle en Informatique et Commerce'),
(481, 81, 6, 'Ecole Supérieure Professionnelle en Informatique et Commerce', 'de. Short description .Ecole Supérieure Professionnelle en Informatique et Commerce', 'de. Description .Ecole Supérieure Professionnelle en Informatique et Commerce'),
(482, 82, 1, 'Ecole Supérieure Paramédicale de Madagascar', 'fr. Short description .Ecole Supérieure Paramédicale de Madagascar', 'fr. Description .Ecole Supérieure Paramédicale de Madagascar'),
(483, 82, 2, 'Ecole Supérieure Paramédicale de Madagascar', 'en. Short description .Ecole Supérieure Paramédicale de Madagascar', 'en. Description .Ecole Supérieure Paramédicale de Madagascar'),
(484, 82, 3, 'Ecole Supérieure Paramédicale de Madagascar', 'mg. Short description .Ecole Supérieure Paramédicale de Madagascar', 'mg. Description .Ecole Supérieure Paramédicale de Madagascar'),
(485, 82, 4, 'Ecole Supérieure Paramédicale de Madagascar', 'it. Short description .Ecole Supérieure Paramédicale de Madagascar', 'it. Description .Ecole Supérieure Paramédicale de Madagascar'),
(486, 82, 5, 'Ecole Supérieure Paramédicale de Madagascar', 'es. Short description .Ecole Supérieure Paramédicale de Madagascar', 'es. Description .Ecole Supérieure Paramédicale de Madagascar'),
(487, 82, 6, 'Ecole Supérieure Paramédicale de Madagascar', 'de. Short description .Ecole Supérieure Paramédicale de Madagascar', 'de. Description .Ecole Supérieure Paramédicale de Madagascar'),
(488, 83, 1, 'Ecole Supérieure Saint Gabriel Mahajanga', 'fr. Short description .Ecole Supérieure Saint Gabriel Mahajanga', 'fr. Description .Ecole Supérieure Saint Gabriel Mahajanga'),
(489, 83, 2, 'Ecole Supérieure Saint Gabriel Mahajanga', 'en. Short description .Ecole Supérieure Saint Gabriel Mahajanga', 'en. Description .Ecole Supérieure Saint Gabriel Mahajanga'),
(490, 83, 3, 'Ecole Supérieure Saint Gabriel Mahajanga', 'mg. Short description .Ecole Supérieure Saint Gabriel Mahajanga', 'mg. Description .Ecole Supérieure Saint Gabriel Mahajanga'),
(491, 83, 4, 'Ecole Supérieure Saint Gabriel Mahajanga', 'it. Short description .Ecole Supérieure Saint Gabriel Mahajanga', 'it. Description .Ecole Supérieure Saint Gabriel Mahajanga'),
(492, 83, 5, 'Ecole Supérieure Saint Gabriel Mahajanga', 'es. Short description .Ecole Supérieure Saint Gabriel Mahajanga', 'es. Description .Ecole Supérieure Saint Gabriel Mahajanga'),
(493, 83, 6, 'Ecole Supérieure Saint Gabriel Mahajanga', 'de. Short description .Ecole Supérieure Saint Gabriel Mahajanga', 'de. Description .Ecole Supérieure Saint Gabriel Mahajanga'),
(494, 84, 1, 'Ecole Supérieure Spécialisée de Vakinakaratra', 'fr. Short description .Ecole Supérieure Spécialisée de Vakinakaratra', 'fr. Description .Ecole Supérieure Spécialisée de Vakinakaratra'),
(495, 84, 2, 'Ecole Supérieure Spécialisée de Vakinakaratra', 'en. Short description .Ecole Supérieure Spécialisée de Vakinakaratra', 'en. Description .Ecole Supérieure Spécialisée de Vakinakaratra'),
(496, 84, 3, 'Ecole Supérieure Spécialisée de Vakinakaratra', 'mg. Short description .Ecole Supérieure Spécialisée de Vakinakaratra', 'mg. Description .Ecole Supérieure Spécialisée de Vakinakaratra'),
(497, 84, 4, 'Ecole Supérieure Spécialisée de Vakinakaratra', 'it. Short description .Ecole Supérieure Spécialisée de Vakinakaratra', 'it. Description .Ecole Supérieure Spécialisée de Vakinakaratra'),
(498, 84, 5, 'Ecole Supérieure Spécialisée de Vakinakaratra', 'es. Short description .Ecole Supérieure Spécialisée de Vakinakaratra', 'es. Description .Ecole Supérieure Spécialisée de Vakinakaratra'),
(499, 84, 6, 'Ecole Supérieure Spécialisée de Vakinakaratra', 'de. Short description .Ecole Supérieure Spécialisée de Vakinakaratra', 'de. Description .Ecole Supérieure Spécialisée de Vakinakaratra'),
(500, 85, 1, 'Ecole Supérieure de Technologie', 'fr. Short description .Ecole Supérieure de Technologie', 'fr. Description .Ecole Supérieure de Technologie'),
(501, 85, 2, 'Ecole Supérieure de Technologie', 'en. Short description .Ecole Supérieure de Technologie', 'en. Description .Ecole Supérieure de Technologie'),
(502, 85, 3, 'Ecole Supérieure de Technologie', 'mg. Short description .Ecole Supérieure de Technologie', 'mg. Description .Ecole Supérieure de Technologie'),
(503, 85, 4, 'Ecole Supérieure de Technologie', 'it. Short description .Ecole Supérieure de Technologie', 'it. Description .Ecole Supérieure de Technologie'),
(504, 85, 5, 'Ecole Supérieure de Technologie', 'es. Short description .Ecole Supérieure de Technologie', 'es. Description .Ecole Supérieure de Technologie'),
(505, 85, 6, 'Ecole Supérieure de Technologie', 'de. Short description .Ecole Supérieure de Technologie', 'de. Description .Ecole Supérieure de Technologie'),
(506, 86, 1, 'Ecole Supérieure des Technologies de l’Information Antanimena', 'fr. Short description .Ecole Supérieure des Technologies de l’Information Antanimena', 'fr. Description .Ecole Supérieure des Technologies de l’Information Antanimena'),
(507, 86, 2, 'Ecole Supérieure des Technologies de l’Information Antanimena', 'en. Short description .Ecole Supérieure des Technologies de l’Information Antanimena', 'en. Description .Ecole Supérieure des Technologies de l’Information Antanimena'),
(508, 86, 3, 'Ecole Supérieure des Technologies de l’Information Antanimena', 'mg. Short description .Ecole Supérieure des Technologies de l’Information Antanimena', 'mg. Description .Ecole Supérieure des Technologies de l’Information Antanimena'),
(509, 86, 4, 'Ecole Supérieure des Technologies de l’Information Antanimena', 'it. Short description .Ecole Supérieure des Technologies de l’Information Antanimena', 'it. Description .Ecole Supérieure des Technologies de l’Information Antanimena'),
(510, 86, 5, 'Ecole Supérieure des Technologies de l’Information Antanimena', 'es. Short description .Ecole Supérieure des Technologies de l’Information Antanimena', 'es. Description .Ecole Supérieure des Technologies de l’Information Antanimena'),
(511, 86, 6, 'Ecole Supérieure des Technologies de l’Information Antanimena', 'de. Short description .Ecole Supérieure des Technologies de l’Information Antanimena', 'de. Description .Ecole Supérieure des Technologies de l’Information Antanimena'),
(512, 87, 1, 'Engineering School of Tourism, Informatics, Interpreter ship and Management', 'L’ESTIIM’, fondé en 2002, a obtenu la reconnaissance du ministère de l’éducation nationale et de la recherche scientifique. Il joue un rôle de premier plan dans l’enseignement supérieur privé. Le programme scientifique de l’institut a été établi en tenant compte des besoins du milieu professionnel et en visant l’excellence et le leadership dans des créneaux de pointe de la recherche académique. La multidisciplinarité de la formation est assurée par la présence d’un corps professoral spécialisé et expérimenté dans divers domaines.', '<p style="text-align: justify;"><strong>Pr&eacute;sentation</strong><br /><br />L&rsquo;ESTIIM&rsquo;, fond&eacute; en 2002, a obtenu la reconnaissance du minist&egrave;re de l&rsquo;&eacute;ducation nationale et de la recherche scientifique. Il joue un r&ocirc;le de premier plan dans l&rsquo;enseignement sup&eacute;rieur priv&eacute;. Le programme scientifique de l&rsquo;institut a &eacute;t&eacute; &eacute;tabli en tenant compte des besoins du milieu professionnel et en visant l&rsquo;excellence et le leadership dans des cr&eacute;neaux de pointe de la recherche acad&eacute;mique. La multidisciplinarit&eacute; de la formation est assur&eacute;e par la pr&eacute;sence d&rsquo;un corps professoral sp&eacute;cialis&eacute; et exp&eacute;riment&eacute; dans divers domaines.<br /><br /><strong>Objectifs</strong><br /><br />En mati&egrave;re de formation, le but de l&rsquo;ESTIIM&rsquo; est de fournir un enseignement de haut niveau &agrave; ses apprenants dans le souci de r&eacute;pondre aux besoins affirm&eacute;s des entreprises et des &eacute;tudiants. L&rsquo;un des objectifs principaux de l&rsquo;&eacute;tablissement est donc de renforcer le processus d&rsquo;enseignement en r&eacute;unissant dans une m&ecirc;me &eacute;quipe des enseignants dipl&ocirc;m&eacute;s et exp&eacute;riment&eacute;s, des cadres d&rsquo;entreprises innovateurs et comp&eacute;tents, des sp&eacute;cialistes nationaux et &eacute;trangers dispos&eacute;s &agrave; conduire les &eacute;tudiants vers l&rsquo;excellence. Les efforts que l&rsquo;&eacute;cole d&eacute;ploie sont tendus vers l&rsquo;internationalisation de sa formation.</p>'),
(513, 87, 2, 'Engineering School of Tourism, Informatics, Interpreter ship and Management', 'L’ESTIIM’, fondé en 2002, a obtenu la reconnaissance du ministère de l’éducation nationale et de la recherche scientifique. Il joue un rôle de premier plan dans l’enseignement supérieur privé. Le programme scientifique de l’institut a été établi en tenant compte des besoins du milieu professionnel et en visant l’excellence et le leadership dans des créneaux de pointe de la recherche académique. La multidisciplinarité de la formation est assurée par la présence d’un corps professoral spécialisé et expérimenté dans divers domaines.', '<p style="text-align: justify;"><strong>Pr&eacute;sentation</strong><br /><br />L&rsquo;ESTIIM&rsquo;, fond&eacute; en 2002, a obtenu la reconnaissance du minist&egrave;re de l&rsquo;&eacute;ducation nationale et de la recherche scientifique. Il joue un r&ocirc;le de premier plan dans l&rsquo;enseignement sup&eacute;rieur priv&eacute;. Le programme scientifique de l&rsquo;institut a &eacute;t&eacute; &eacute;tabli en tenant compte des besoins du milieu professionnel et en visant l&rsquo;excellence et le leadership dans des cr&eacute;neaux de pointe de la recherche acad&eacute;mique. La multidisciplinarit&eacute; de la formation est assur&eacute;e par la pr&eacute;sence d&rsquo;un corps professoral sp&eacute;cialis&eacute; et exp&eacute;riment&eacute; dans divers domaines.<br /><br /><strong>Objectifs</strong><br /><br />En mati&egrave;re de formation, le but de l&rsquo;ESTIIM&rsquo; est de fournir un enseignement de haut niveau &agrave; ses apprenants dans le souci de r&eacute;pondre aux besoins affirm&eacute;s des entreprises et des &eacute;tudiants. L&rsquo;un des objectifs principaux de l&rsquo;&eacute;tablissement est donc de renforcer le processus d&rsquo;enseignement en r&eacute;unissant dans une m&ecirc;me &eacute;quipe des enseignants dipl&ocirc;m&eacute;s et exp&eacute;riment&eacute;s, des cadres d&rsquo;entreprises innovateurs et comp&eacute;tents, des sp&eacute;cialistes nationaux et &eacute;trangers dispos&eacute;s &agrave; conduire les &eacute;tudiants vers l&rsquo;excellence. Les efforts que l&rsquo;&eacute;cole d&eacute;ploie sont tendus vers l&rsquo;internationalisation de sa formation.</p>'),
(514, 87, 3, 'Engineering School of Tourism, Informatics, Interpreter ship and Management', 'mg. Short description .Engineering School of Tourism, Informatics, Interpreter ship and Management', 'mg. Description .Engineering School of Tourism, Informatics, Interpreter ship and Management'),
(515, 87, 4, 'Engineering School of Tourism, Informatics, Interpreter ship and Management', 'it. Short description .Engineering School of Tourism, Informatics, Interpreter ship and Management', 'it. Description .Engineering School of Tourism, Informatics, Interpreter ship and Management'),
(516, 87, 5, 'Engineering School of Tourism, Informatics, Interpreter ship and Management', 'es. Short description .Engineering School of Tourism, Informatics, Interpreter ship and Management', 'es. Description .Engineering School of Tourism, Informatics, Interpreter ship and Management'),
(517, 87, 6, 'Engineering School of Tourism, Informatics, Interpreter ship and Management', 'de. Short description .Engineering School of Tourism, Informatics, Interpreter ship and Management', 'de. Description .Engineering School of Tourism, Informatics, Interpreter ship and Management'),
(518, 88, 1, 'Education in Training, Employment and Communication', 'fr. Short description .Education in Training, Employment and Communication', 'fr. Description .Education in Training, Employment and Communication'),
(519, 88, 2, 'Education in Training, Employment and Communication', 'en. Short description .Education in Training, Employment and Communication', 'en. Description .Education in Training, Employment and Communication'),
(520, 88, 3, 'Education in Training, Employment and Communication', 'mg. Short description .Education in Training, Employment and Communication', 'mg. Description .Education in Training, Employment and Communication'),
(521, 88, 4, 'Education in Training, Employment and Communication', 'it. Short description .Education in Training, Employment and Communication', 'it. Description .Education in Training, Employment and Communication'),
(522, 88, 5, 'Education in Training, Employment and Communication', 'es. Short description .Education in Training, Employment and Communication', 'es. Description .Education in Training, Employment and Communication'),
(523, 88, 6, 'Education in Training, Employment and Communication', 'de. Short description .Education in Training, Employment and Communication', 'de. Description .Education in Training, Employment and Communication'),
(524, 89, 1, 'Etablissement Technique de Formation Professionnelle Supérieure RLG', 'fr. Short description .Etablissement Technique de Formation Professionnelle Supérieure RLG', 'fr. Description .Etablissement Technique de Formation Professionnelle Supérieure RLG'),
(525, 89, 2, 'Etablissement Technique de Formation Professionnelle Supérieure RLG', 'en. Short description .Etablissement Technique de Formation Professionnelle Supérieure RLG', 'en. Description .Etablissement Technique de Formation Professionnelle Supérieure RLG'),
(526, 89, 3, 'Etablissement Technique de Formation Professionnelle Supérieure RLG', 'mg. Short description .Etablissement Technique de Formation Professionnelle Supérieure RLG', 'mg. Description .Etablissement Technique de Formation Professionnelle Supérieure RLG'),
(527, 89, 4, 'Etablissement Technique de Formation Professionnelle Supérieure RLG', 'it. Short description .Etablissement Technique de Formation Professionnelle Supérieure RLG', 'it. Description .Etablissement Technique de Formation Professionnelle Supérieure RLG'),
(528, 89, 5, 'Etablissement Technique de Formation Professionnelle Supérieure RLG', 'es. Short description .Etablissement Technique de Formation Professionnelle Supérieure RLG', 'es. Description .Etablissement Technique de Formation Professionnelle Supérieure RLG'),
(529, 89, 6, 'Etablissement Technique de Formation Professionnelle Supérieure RLG', 'de. Short description .Etablissement Technique de Formation Professionnelle Supérieure RLG', 'de. Description .Etablissement Technique de Formation Professionnelle Supérieure RLG'),
(530, 90, 1, 'Etablissement Technique Supérieur', 'fr. Short description .Etablissement Technique Supérieur', 'fr. Description .Etablissement Technique Supérieur'),
(531, 90, 2, 'Etablissement Technique Supérieur', 'en. Short description .Etablissement Technique Supérieur', 'en. Description .Etablissement Technique Supérieur'),
(532, 90, 3, 'Etablissement Technique Supérieur', 'mg. Short description .Etablissement Technique Supérieur', 'mg. Description .Etablissement Technique Supérieur'),
(533, 90, 4, 'Etablissement Technique Supérieur', 'it. Short description .Etablissement Technique Supérieur', 'it. Description .Etablissement Technique Supérieur'),
(534, 90, 5, 'Etablissement Technique Supérieur', 'es. Short description .Etablissement Technique Supérieur', 'es. Description .Etablissement Technique Supérieur'),
(535, 90, 6, 'Etablissement Technique Supérieur', 'de. Short description .Etablissement Technique Supérieur', 'de. Description .Etablissement Technique Supérieur'),
(536, 91, 1, 'Fifampiofanana Fanabeazana Fikolokoloana ho Malagasy Mahomby', 'fr. Short description .Fifampiofanana Fanabeazana Fikolokoloana ho Malagasy Mahomby', 'fr. Description .Fifampiofanana Fanabeazana Fikolokoloana ho Malagasy Mahomby'),
(537, 91, 2, 'Fifampiofanana Fanabeazana Fikolokoloana ho Malagasy Mahomby', 'en. Short description .Fifampiofanana Fanabeazana Fikolokoloana ho Malagasy Mahomby', 'en. Description .Fifampiofanana Fanabeazana Fikolokoloana ho Malagasy Mahomby'),
(538, 91, 3, 'Fifampiofanana Fanabeazana Fikolokoloana ho Malagasy Mahomby', 'mg. Short description .Fifampiofanana Fanabeazana Fikolokoloana ho Malagasy Mahomby', 'mg. Description .Fifampiofanana Fanabeazana Fikolokoloana ho Malagasy Mahomby'),
(539, 91, 4, 'Fifampiofanana Fanabeazana Fikolokoloana ho Malagasy Mahomby', 'it. Short description .Fifampiofanana Fanabeazana Fikolokoloana ho Malagasy Mahomby', 'it. Description .Fifampiofanana Fanabeazana Fikolokoloana ho Malagasy Mahomby'),
(540, 91, 5, 'Fifampiofanana Fanabeazana Fikolokoloana ho Malagasy Mahomby', 'es. Short description .Fifampiofanana Fanabeazana Fikolokoloana ho Malagasy Mahomby', 'es. Description .Fifampiofanana Fanabeazana Fikolokoloana ho Malagasy Mahomby'),
(541, 91, 6, 'Fifampiofanana Fanabeazana Fikolokoloana ho Malagasy Mahomby', 'de. Short description .Fifampiofanana Fanabeazana Fikolokoloana ho Malagasy Mahomby', 'de. Description .Fifampiofanana Fanabeazana Fikolokoloana ho Malagasy Mahomby'),
(542, 92, 1, 'Grand Seminaire Saint Paul Ap ôtre Cycle Philosophique Manantenasoa  Antsirabe', 'fr. Short description .Grand Seminaire Saint Paul Ap ôtre Cycle Philosophique Manantenasoa  Antsirabe', 'fr. Description .Grand Seminaire Saint Paul Ap ôtre Cycle Philosophique Manantenasoa  Antsirabe'),
(543, 92, 2, 'Grand Seminaire Saint Paul Ap ôtre Cycle Philosophique Manantenasoa  Antsirabe', 'en. Short description .Grand Seminaire Saint Paul Ap ôtre Cycle Philosophique Manantenasoa  Antsirabe', 'en. Description .Grand Seminaire Saint Paul Ap ôtre Cycle Philosophique Manantenasoa  Antsirabe'),
(544, 92, 3, 'Grand Seminaire Saint Paul Ap ôtre Cycle Philosophique Manantenasoa  Antsirabe', 'mg. Short description .Grand Seminaire Saint Paul Ap ôtre Cycle Philosophique Manantenasoa  Antsirabe', 'mg. Description .Grand Seminaire Saint Paul Ap ôtre Cycle Philosophique Manantenasoa  Antsirabe'),
(545, 92, 4, 'Grand Seminaire Saint Paul Ap ôtre Cycle Philosophique Manantenasoa  Antsirabe', 'it. Short description .Grand Seminaire Saint Paul Ap ôtre Cycle Philosophique Manantenasoa  Antsirabe', 'it. Description .Grand Seminaire Saint Paul Ap ôtre Cycle Philosophique Manantenasoa  Antsirabe'),
(546, 92, 5, 'Grand Seminaire Saint Paul Ap ôtre Cycle Philosophique Manantenasoa  Antsirabe', 'es. Short description .Grand Seminaire Saint Paul Ap ôtre Cycle Philosophique Manantenasoa  Antsirabe', 'es. Description .Grand Seminaire Saint Paul Ap ôtre Cycle Philosophique Manantenasoa  Antsirabe'),
(547, 92, 6, 'Grand Seminaire Saint Paul Ap ôtre Cycle Philosophique Manantenasoa  Antsirabe', 'de. Short description .Grand Seminaire Saint Paul Ap ôtre Cycle Philosophique Manantenasoa  Antsirabe', 'de. Description .Grand Seminaire Saint Paul Ap ôtre Cycle Philosophique Manantenasoa  Antsirabe'),
(548, 93, 1, 'Gate University Ambohidratrimo', 'fr. Short description .Gate University Ambohidratrimo', 'fr. Description .Gate University Ambohidratrimo'),
(549, 93, 2, 'Gate University Ambohidratrimo', 'en. Short description .Gate University Ambohidratrimo', 'en. Description .Gate University Ambohidratrimo'),
(550, 93, 3, 'Gate University Ambohidratrimo', 'mg. Short description .Gate University Ambohidratrimo', 'mg. Description .Gate University Ambohidratrimo'),
(551, 93, 4, 'Gate University Ambohidratrimo', 'it. Short description .Gate University Ambohidratrimo', 'it. Description .Gate University Ambohidratrimo'),
(552, 93, 5, 'Gate University Ambohidratrimo', 'es. Short description .Gate University Ambohidratrimo', 'es. Description .Gate University Ambohidratrimo'),
(553, 93, 6, 'Gate University Ambohidratrimo', 'de. Short description .Gate University Ambohidratrimo', 'de. Description .Gate University Ambohidratrimo'),
(554, 94, 1, 'Global University of Madagascar', 'fr. Short description .Global University of Madagascar', 'fr. Description .Global University of Madagascar'),
(555, 94, 2, 'Global University of Madagascar', 'en. Short description .Global University of Madagascar', 'en. Description .Global University of Madagascar'),
(556, 94, 3, 'Global University of Madagascar', 'mg. Short description .Global University of Madagascar', 'mg. Description .Global University of Madagascar'),
(557, 94, 4, 'Global University of Madagascar', 'it. Short description .Global University of Madagascar', 'it. Description .Global University of Madagascar'),
(558, 94, 5, 'Global University of Madagascar', 'es. Short description .Global University of Madagascar', 'es. Description .Global University of Madagascar'),
(559, 94, 6, 'Global University of Madagascar', 'de. Short description .Global University of Madagascar', 'de. Description .Global University of Madagascar'),
(560, 95, 1, 'Hautes Etudes Chrétiennes de Management et de Mathématiques Appliquées', 'fr. Short description .Hautes Etudes Chrétiennes de Management et de Mathématiques Appliquées', 'fr. Description .Hautes Etudes Chrétiennes de Management et de Mathématiques Appliquées'),
(561, 95, 2, 'Hautes Etudes Chrétiennes de Management et de Mathématiques Appliquées', 'en. Short description .Hautes Etudes Chrétiennes de Management et de Mathématiques Appliquées', 'en. Description .Hautes Etudes Chrétiennes de Management et de Mathématiques Appliquées'),
(562, 95, 3, 'Hautes Etudes Chrétiennes de Management et de Mathématiques Appliquées', 'mg. Short description .Hautes Etudes Chrétiennes de Management et de Mathématiques Appliquées', 'mg. Description .Hautes Etudes Chrétiennes de Management et de Mathématiques Appliquées'),
(563, 95, 4, 'Hautes Etudes Chrétiennes de Management et de Mathématiques Appliquées', 'it. Short description .Hautes Etudes Chrétiennes de Management et de Mathématiques Appliquées', 'it. Description .Hautes Etudes Chrétiennes de Management et de Mathématiques Appliquées'),
(564, 95, 5, 'Hautes Etudes Chrétiennes de Management et de Mathématiques Appliquées', 'es. Short description .Hautes Etudes Chrétiennes de Management et de Mathématiques Appliquées', 'es. Description .Hautes Etudes Chrétiennes de Management et de Mathématiques Appliquées'),
(565, 95, 6, 'Hautes Etudes Chrétiennes de Management et de Mathématiques Appliquées', 'de. Short description .Hautes Etudes Chrétiennes de Management et de Mathématiques Appliquées', 'de. Description .Hautes Etudes Chrétiennes de Management et de Mathématiques Appliquées'),
(566, 96, 1, 'Institut Catholique Notre Dame', 'fr. Short description .Institut Catholique Notre Dame', 'fr. Description .Institut Catholique Notre Dame'),
(567, 96, 2, 'Institut Catholique Notre Dame', 'en. Short description .Institut Catholique Notre Dame', 'en. Description .Institut Catholique Notre Dame'),
(568, 96, 3, 'Institut Catholique Notre Dame', 'mg. Short description .Institut Catholique Notre Dame', 'mg. Description .Institut Catholique Notre Dame'),
(569, 96, 4, 'Institut Catholique Notre Dame', 'it. Short description .Institut Catholique Notre Dame', 'it. Description .Institut Catholique Notre Dame'),
(570, 96, 5, 'Institut Catholique Notre Dame', 'es. Short description .Institut Catholique Notre Dame', 'es. Description .Institut Catholique Notre Dame'),
(571, 96, 6, 'Institut Catholique Notre Dame', 'de. Short description .Institut Catholique Notre Dame', 'de. Description .Institut Catholique Notre Dame'),
(572, 97, 1, 'Institut Catholique de Pédagogie', 'fr. Short description .Institut Catholique de Pédagogie', 'fr. Description .Institut Catholique de Pédagogie'),
(573, 97, 2, 'Institut Catholique de Pédagogie', 'en. Short description .Institut Catholique de Pédagogie', 'en. Description .Institut Catholique de Pédagogie'),
(574, 97, 3, 'Institut Catholique de Pédagogie', 'mg. Short description .Institut Catholique de Pédagogie', 'mg. Description .Institut Catholique de Pédagogie'),
(575, 97, 4, 'Institut Catholique de Pédagogie', 'it. Short description .Institut Catholique de Pédagogie', 'it. Description .Institut Catholique de Pédagogie'),
(576, 97, 5, 'Institut Catholique de Pédagogie', 'es. Short description .Institut Catholique de Pédagogie', 'es. Description .Institut Catholique de Pédagogie'),
(577, 97, 6, 'Institut Catholique de Pédagogie', 'de. Short description .Institut Catholique de Pédagogie', 'de. Description .Institut Catholique de Pédagogie'),
(578, 98, 1, 'Institut d’Enseignement Supérieur de Technologie Informatique et de Management d’Entreprise', 'fr. Short description .Institut d’Enseignement Supérieur de Technologie Informatique et de Management d’Entreprise', 'fr. Description .Institut d’Enseignement Supérieur de Technologie Informatique et de Management d’Entreprise'),
(579, 98, 2, 'Institut d’Enseignement Supérieur de Technologie Informatique et de Management d’Entreprise', 'en. Short description .Institut d’Enseignement Supérieur de Technologie Informatique et de Management d’Entreprise', 'en. Description .Institut d’Enseignement Supérieur de Technologie Informatique et de Management d’Entreprise'),
(580, 98, 3, 'Institut d’Enseignement Supérieur de Technologie Informatique et de Management d’Entreprise', 'mg. Short description .Institut d’Enseignement Supérieur de Technologie Informatique et de Management d’Entreprise', 'mg. Description .Institut d’Enseignement Supérieur de Technologie Informatique et de Management d’Entreprise'),
(581, 98, 4, 'Institut d’Enseignement Supérieur de Technologie Informatique et de Management d’Entreprise', 'it. Short description .Institut d’Enseignement Supérieur de Technologie Informatique et de Management d’Entreprise', 'it. Description .Institut d’Enseignement Supérieur de Technologie Informatique et de Management d’Entreprise'),
(582, 98, 5, 'Institut d’Enseignement Supérieur de Technologie Informatique et de Management d’Entreprise', 'es. Short description .Institut d’Enseignement Supérieur de Technologie Informatique et de Management d’Entreprise', 'es. Description .Institut d’Enseignement Supérieur de Technologie Informatique et de Management d’Entreprise'),
(583, 98, 6, 'Institut d’Enseignement Supérieur de Technologie Informatique et de Management d’Entreprise', 'de. Short description .Institut d’Enseignement Supérieur de Technologie Informatique et de Management d’Entreprise', 'de. Description .Institut d’Enseignement Supérieur de Technologie Informatique et de Management d’Entreprise'),
(584, 99, 1, 'Institut de Formation des Agents de Santé', 'fr. Short description .Institut de Formation des Agents de Santé', 'fr. Description .Institut de Formation des Agents de Santé'),
(585, 99, 2, 'Institut de Formation des Agents de Santé', 'en. Short description .Institut de Formation des Agents de Santé', 'en. Description .Institut de Formation des Agents de Santé'),
(586, 99, 3, 'Institut de Formation des Agents de Santé', 'mg. Short description .Institut de Formation des Agents de Santé', 'mg. Description .Institut de Formation des Agents de Santé'),
(587, 99, 4, 'Institut de Formation des Agents de Santé', 'it. Short description .Institut de Formation des Agents de Santé', 'it. Description .Institut de Formation des Agents de Santé'),
(588, 99, 5, 'Institut de Formation des Agents de Santé', 'es. Short description .Institut de Formation des Agents de Santé', 'es. Description .Institut de Formation des Agents de Santé'),
(589, 99, 6, 'Institut de Formation des Agents de Santé', 'de. Short description .Institut de Formation des Agents de Santé', 'de. Description .Institut de Formation des Agents de Santé'),
(590, 100, 1, 'Institut de Formation en Environnement Linguistique et Paramédicale', 'fr. Short description .Institut de Formation en Environnement Linguistique et Paramédicale', 'fr. Description .Institut de Formation en Environnement Linguistique et Paramédicale'),
(591, 100, 2, 'Institut de Formation en Environnement Linguistique et Paramédicale', 'en. Short description .Institut de Formation en Environnement Linguistique et Paramédicale', 'en. Description .Institut de Formation en Environnement Linguistique et Paramédicale'),
(592, 100, 3, 'Institut de Formation en Environnement Linguistique et Paramédicale', 'mg. Short description .Institut de Formation en Environnement Linguistique et Paramédicale', 'mg. Description .Institut de Formation en Environnement Linguistique et Paramédicale'),
(593, 100, 4, 'Institut de Formation en Environnement Linguistique et Paramédicale', 'it. Short description .Institut de Formation en Environnement Linguistique et Paramédicale', 'it. Description .Institut de Formation en Environnement Linguistique et Paramédicale'),
(594, 100, 5, 'Institut de Formation en Environnement Linguistique et Paramédicale', 'es. Short description .Institut de Formation en Environnement Linguistique et Paramédicale', 'es. Description .Institut de Formation en Environnement Linguistique et Paramédicale'),
(595, 100, 6, 'Institut de Formation en Environnement Linguistique et Paramédicale', 'de. Short description .Institut de Formation en Environnement Linguistique et Paramédicale', 'de. Description .Institut de Formation en Environnement Linguistique et Paramédicale'),
(596, 101, 1, 'Institut Supérieur de Formation Infirmière et Sage Femme', 'fr. Short description .Institut Supérieur de Formation Infirmière et Sage Femme', 'fr. Description .Institut Supérieur de Formation Infirmière et Sage Femme'),
(597, 101, 2, 'Institut Supérieur de Formation Infirmière et Sage Femme', 'en. Short description .Institut Supérieur de Formation Infirmière et Sage Femme', 'en. Description .Institut Supérieur de Formation Infirmière et Sage Femme'),
(598, 101, 3, 'Institut Supérieur de Formation Infirmière et Sage Femme', 'mg. Short description .Institut Supérieur de Formation Infirmière et Sage Femme', 'mg. Description .Institut Supérieur de Formation Infirmière et Sage Femme'),
(599, 101, 4, 'Institut Supérieur de Formation Infirmière et Sage Femme', 'it. Short description .Institut Supérieur de Formation Infirmière et Sage Femme', 'it. Description .Institut Supérieur de Formation Infirmière et Sage Femme'),
(600, 101, 5, 'Institut Supérieur de Formation Infirmière et Sage Femme', 'es. Short description .Institut Supérieur de Formation Infirmière et Sage Femme', 'es. Description .Institut Supérieur de Formation Infirmière et Sage Femme'),
(601, 101, 6, 'Institut Supérieur de Formation Infirmière et Sage Femme', 'de. Short description .Institut Supérieur de Formation Infirmière et Sage Femme', 'de. Description .Institut Supérieur de Formation Infirmière et Sage Femme'),
(602, 102, 1, 'Institut de Formation d’Infirmière et Sage - femme d’Amoron’i Mania', 'fr. Short description .Institut de Formation d’Infirmière et Sage - femme d’Amoron’i Mania', 'fr. Description .Institut de Formation d’Infirmière et Sage - femme d’Amoron’i Mania'),
(603, 102, 2, 'Institut de Formation d’Infirmière et Sage - femme d’Amoron’i Mania', 'en. Short description .Institut de Formation d’Infirmière et Sage - femme d’Amoron’i Mania', 'en. Description .Institut de Formation d’Infirmière et Sage - femme d’Amoron’i Mania'),
(604, 102, 3, 'Institut de Formation d’Infirmière et Sage - femme d’Amoron’i Mania', 'mg. Short description .Institut de Formation d’Infirmière et Sage - femme d’Amoron’i Mania', 'mg. Description .Institut de Formation d’Infirmière et Sage - femme d’Amoron’i Mania'),
(605, 102, 4, 'Institut de Formation d’Infirmière et Sage - femme d’Amoron’i Mania', 'it. Short description .Institut de Formation d’Infirmière et Sage - femme d’Amoron’i Mania', 'it. Description .Institut de Formation d’Infirmière et Sage - femme d’Amoron’i Mania'),
(606, 102, 5, 'Institut de Formation d’Infirmière et Sage - femme d’Amoron’i Mania', 'es. Short description .Institut de Formation d’Infirmière et Sage - femme d’Amoron’i Mania', 'es. Description .Institut de Formation d’Infirmière et Sage - femme d’Amoron’i Mania'),
(607, 102, 6, 'Institut de Formation d’Infirmière et Sage - femme d’Amoron’i Mania', 'de. Short description .Institut de Formation d’Infirmière et Sage - femme d’Amoron’i Mania', 'de. Description .Institut de Formation d’Infirmière et Sage - femme d’Amoron’i Mania'),
(608, 103, 1, 'Institut de Formation des Paramédicaux de la région SAVA', 'fr. Short description .Institut de Formation des Paramédicaux de la région SAVA', 'fr. Description .Institut de Formation des Paramédicaux de la région SAVA'),
(609, 103, 2, 'Institut de Formation des Paramédicaux de la région SAVA', 'en. Short description .Institut de Formation des Paramédicaux de la région SAVA', 'en. Description .Institut de Formation des Paramédicaux de la région SAVA'),
(610, 103, 3, 'Institut de Formation des Paramédicaux de la région SAVA', 'mg. Short description .Institut de Formation des Paramédicaux de la région SAVA', 'mg. Description .Institut de Formation des Paramédicaux de la région SAVA'),
(611, 103, 4, 'Institut de Formation des Paramédicaux de la région SAVA', 'it. Short description .Institut de Formation des Paramédicaux de la région SAVA', 'it. Description .Institut de Formation des Paramédicaux de la région SAVA'),
(612, 103, 5, 'Institut de Formation des Paramédicaux de la région SAVA', 'es. Short description .Institut de Formation des Paramédicaux de la région SAVA', 'es. Description .Institut de Formation des Paramédicaux de la région SAVA'),
(613, 103, 6, 'Institut de Formation des Paramédicaux de la région SAVA', 'de. Short description .Institut de Formation des Paramédicaux de la région SAVA', 'de. Description .Institut de Formation des Paramédicaux de la région SAVA'),
(614, 104, 1, 'Institut de Formation des Paramédicaux Analanjirofo', 'fr. Short description .Institut de Formation des Paramédicaux Analanjirofo', 'fr. Description .Institut de Formation des Paramédicaux Analanjirofo'),
(615, 104, 2, 'Institut de Formation des Paramédicaux Analanjirofo', 'en. Short description .Institut de Formation des Paramédicaux Analanjirofo', 'en. Description .Institut de Formation des Paramédicaux Analanjirofo'),
(616, 104, 3, 'Institut de Formation des Paramédicaux Analanjirofo', 'mg. Short description .Institut de Formation des Paramédicaux Analanjirofo', 'mg. Description .Institut de Formation des Paramédicaux Analanjirofo'),
(617, 104, 4, 'Institut de Formation des Paramédicaux Analanjirofo', 'it. Short description .Institut de Formation des Paramédicaux Analanjirofo', 'it. Description .Institut de Formation des Paramédicaux Analanjirofo'),
(618, 104, 5, 'Institut de Formation des Paramédicaux Analanjirofo', 'es. Short description .Institut de Formation des Paramédicaux Analanjirofo', 'es. Description .Institut de Formation des Paramédicaux Analanjirofo'),
(619, 104, 6, 'Institut de Formation des Paramédicaux Analanjirofo', 'de. Short description .Institut de Formation des Paramédicaux Analanjirofo', 'de. Description .Institut de Formation des Paramédicaux Analanjirofo'),
(620, 105, 1, 'Institut de Formation des Paramédicaux Mananara Avaratra', 'fr. Short description .Institut de Formation des Paramédicaux Mananara Avaratra', 'fr. Description .Institut de Formation des Paramédicaux Mananara Avaratra'),
(621, 105, 2, 'Institut de Formation des Paramédicaux Mananara Avaratra', 'en. Short description .Institut de Formation des Paramédicaux Mananara Avaratra', 'en. Description .Institut de Formation des Paramédicaux Mananara Avaratra'),
(622, 105, 3, 'Institut de Formation des Paramédicaux Mananara Avaratra', 'mg. Short description .Institut de Formation des Paramédicaux Mananara Avaratra', 'mg. Description .Institut de Formation des Paramédicaux Mananara Avaratra'),
(623, 105, 4, 'Institut de Formation des Paramédicaux Mananara Avaratra', 'it. Short description .Institut de Formation des Paramédicaux Mananara Avaratra', 'it. Description .Institut de Formation des Paramédicaux Mananara Avaratra'),
(624, 105, 5, 'Institut de Formation des Paramédicaux Mananara Avaratra', 'es. Short description .Institut de Formation des Paramédicaux Mananara Avaratra', 'es. Description .Institut de Formation des Paramédicaux Mananara Avaratra'),
(625, 105, 6, 'Institut de Formation des Paramédicaux Mananara Avaratra', 'de. Short description .Institut de Formation des Paramédicaux Mananara Avaratra', 'de. Description .Institut de Formation des Paramédicaux Mananara Avaratra'),
(626, 106, 1, 'Institut de Formation des Paramédicaux Fianarantsoa', 'fr. Short description .Institut de Formation des Paramédicaux Fianarantsoa', 'fr. Description .Institut de Formation des Paramédicaux Fianarantsoa'),
(627, 106, 2, 'Institut de Formation des Paramédicaux Fianarantsoa', 'en. Short description .Institut de Formation des Paramédicaux Fianarantsoa', 'en. Description .Institut de Formation des Paramédicaux Fianarantsoa'),
(628, 106, 3, 'Institut de Formation des Paramédicaux Fianarantsoa', 'mg. Short description .Institut de Formation des Paramédicaux Fianarantsoa', 'mg. Description .Institut de Formation des Paramédicaux Fianarantsoa'),
(629, 106, 4, 'Institut de Formation des Paramédicaux Fianarantsoa', 'it. Short description .Institut de Formation des Paramédicaux Fianarantsoa', 'it. Description .Institut de Formation des Paramédicaux Fianarantsoa'),
(630, 106, 5, 'Institut de Formation des Paramédicaux Fianarantsoa', 'es. Short description .Institut de Formation des Paramédicaux Fianarantsoa', 'es. Description .Institut de Formation des Paramédicaux Fianarantsoa'),
(631, 106, 6, 'Institut de Formation des Paramédicaux Fianarantsoa', 'de. Short description .Institut de Formation des Paramédicaux Fianarantsoa', 'de. Description .Institut de Formation des Paramédicaux Fianarantsoa'),
(632, 107, 1, 'Institut de Formation des Paramédicaux de Mandritsara', 'fr. Short description .Institut de Formation des Paramédicaux de Mandritsara', 'fr. Description .Institut de Formation des Paramédicaux de Mandritsara'),
(633, 107, 2, 'Institut de Formation des Paramédicaux de Mandritsara', 'en. Short description .Institut de Formation des Paramédicaux de Mandritsara', 'en. Description .Institut de Formation des Paramédicaux de Mandritsara'),
(634, 107, 3, 'Institut de Formation des Paramédicaux de Mandritsara', 'mg. Short description .Institut de Formation des Paramédicaux de Mandritsara', 'mg. Description .Institut de Formation des Paramédicaux de Mandritsara'),
(635, 107, 4, 'Institut de Formation des Paramédicaux de Mandritsara', 'it. Short description .Institut de Formation des Paramédicaux de Mandritsara', 'it. Description .Institut de Formation des Paramédicaux de Mandritsara'),
(636, 107, 5, 'Institut de Formation des Paramédicaux de Mandritsara', 'es. Short description .Institut de Formation des Paramédicaux de Mandritsara', 'es. Description .Institut de Formation des Paramédicaux de Mandritsara'),
(637, 107, 6, 'Institut de Formation des Paramédicaux de Mandritsara', 'de. Short description .Institut de Formation des Paramédicaux de Mandritsara', 'de. Description .Institut de Formation des Paramédicaux de Mandritsara'),
(638, 108, 1, 'Institut de Formation des Paramédicaux Sofia', 'fr. Short description .Institut de Formation des Paramédicaux Sofia', 'fr. Description .Institut de Formation des Paramédicaux Sofia'),
(639, 108, 2, 'Institut de Formation des Paramédicaux Sofia', 'en. Short description .Institut de Formation des Paramédicaux Sofia', 'en. Description .Institut de Formation des Paramédicaux Sofia'),
(640, 108, 3, 'Institut de Formation des Paramédicaux Sofia', 'mg. Short description .Institut de Formation des Paramédicaux Sofia', 'mg. Description .Institut de Formation des Paramédicaux Sofia'),
(641, 108, 4, 'Institut de Formation des Paramédicaux Sofia', 'it. Short description .Institut de Formation des Paramédicaux Sofia', 'it. Description .Institut de Formation des Paramédicaux Sofia'),
(642, 108, 5, 'Institut de Formation des Paramédicaux Sofia', 'es. Short description .Institut de Formation des Paramédicaux Sofia', 'es. Description .Institut de Formation des Paramédicaux Sofia'),
(643, 108, 6, 'Institut de Formation des Paramédicaux Sofia', 'de. Short description .Institut de Formation des Paramédicaux Sofia', 'de. Description .Institut de Formation des Paramédicaux Sofia'),
(644, 109, 1, 'Institut de Formation des Paramédicaux de Tsiroanomandidy', 'fr. Short description .Institut de Formation des Paramédicaux de Tsiroanomandidy', 'fr. Description .Institut de Formation des Paramédicaux de Tsiroanomandidy'),
(645, 109, 2, 'Institut de Formation des Paramédicaux de Tsiroanomandidy', 'en. Short description .Institut de Formation des Paramédicaux de Tsiroanomandidy', 'en. Description .Institut de Formation des Paramédicaux de Tsiroanomandidy'),
(646, 109, 3, 'Institut de Formation des Paramédicaux de Tsiroanomandidy', 'mg. Short description .Institut de Formation des Paramédicaux de Tsiroanomandidy', 'mg. Description .Institut de Formation des Paramédicaux de Tsiroanomandidy'),
(647, 109, 4, 'Institut de Formation des Paramédicaux de Tsiroanomandidy', 'it. Short description .Institut de Formation des Paramédicaux de Tsiroanomandidy', 'it. Description .Institut de Formation des Paramédicaux de Tsiroanomandidy'),
(648, 109, 5, 'Institut de Formation des Paramédicaux de Tsiroanomandidy', 'es. Short description .Institut de Formation des Paramédicaux de Tsiroanomandidy', 'es. Description .Institut de Formation des Paramédicaux de Tsiroanomandidy'),
(649, 109, 6, 'Institut de Formation des Paramédicaux de Tsiroanomandidy', 'de. Short description .Institut de Formation des Paramédicaux de Tsiroanomandidy', 'de. Description .Institut de Formation des Paramédicaux de Tsiroanomandidy'),
(650, 110, 1, 'Institut de Formation et de s Recherche s Pédagogique s', 'fr. Short description .Institut de Formation et de s Recherche s Pédagogique s', 'fr. Description .Institut de Formation et de s Recherche s Pédagogique s'),
(651, 110, 2, 'Institut de Formation et de s Recherche s Pédagogique s', 'en. Short description .Institut de Formation et de s Recherche s Pédagogique s', 'en. Description .Institut de Formation et de s Recherche s Pédagogique s'),
(652, 110, 3, 'Institut de Formation et de s Recherche s Pédagogique s', 'mg. Short description .Institut de Formation et de s Recherche s Pédagogique s', 'mg. Description .Institut de Formation et de s Recherche s Pédagogique s'),
(653, 110, 4, 'Institut de Formation et de s Recherche s Pédagogique s', 'it. Short description .Institut de Formation et de s Recherche s Pédagogique s', 'it. Description .Institut de Formation et de s Recherche s Pédagogique s'),
(654, 110, 5, 'Institut de Formation et de s Recherche s Pédagogique s', 'es. Short description .Institut de Formation et de s Recherche s Pédagogique s', 'es. Description .Institut de Formation et de s Recherche s Pédagogique s'),
(655, 110, 6, 'Institut de Formation et de s Recherche s Pédagogique s', 'de. Short description .Institut de Formation et de s Recherche s Pédagogique s', 'de. Description .Institut de Formation et de s Recherche s Pédagogique s'),
(656, 111, 1, 'Institut de Formation en Sage - femme et Infirmière Intermed', 'fr. Short description .Institut de Formation en Sage - femme et Infirmière Intermed', 'fr. Description .Institut de Formation en Sage - femme et Infirmière Intermed');
INSERT INTO `sl_school_translate` (`id`, `school_id`, `locale_id`, `name`, `short_description`, `description`) VALUES
(657, 111, 2, 'Institut de Formation en Sage - femme et Infirmière Intermed', 'en. Short description .Institut de Formation en Sage - femme et Infirmière Intermed', 'en. Description .Institut de Formation en Sage - femme et Infirmière Intermed'),
(658, 111, 3, 'Institut de Formation en Sage - femme et Infirmière Intermed', 'mg. Short description .Institut de Formation en Sage - femme et Infirmière Intermed', 'mg. Description .Institut de Formation en Sage - femme et Infirmière Intermed'),
(659, 111, 4, 'Institut de Formation en Sage - femme et Infirmière Intermed', 'it. Short description .Institut de Formation en Sage - femme et Infirmière Intermed', 'it. Description .Institut de Formation en Sage - femme et Infirmière Intermed'),
(660, 111, 5, 'Institut de Formation en Sage - femme et Infirmière Intermed', 'es. Short description .Institut de Formation en Sage - femme et Infirmière Intermed', 'es. Description .Institut de Formation en Sage - femme et Infirmière Intermed'),
(661, 111, 6, 'Institut de Formation en Sage - femme et Infirmière Intermed', 'de. Short description .Institut de Formation en Sage - femme et Infirmière Intermed', 'de. Description .Institut de Formation en Sage - femme et Infirmière Intermed'),
(662, 112, 1, 'Institut de Formation des Soins infirmiers Sainte Jeanne d’Arc', 'fr. Short description .Institut de Formation des Soins infirmiers Sainte Jeanne d’Arc', 'fr. Description .Institut de Formation des Soins infirmiers Sainte Jeanne d’Arc'),
(663, 112, 2, 'Institut de Formation des Soins infirmiers Sainte Jeanne d’Arc', 'en. Short description .Institut de Formation des Soins infirmiers Sainte Jeanne d’Arc', 'en. Description .Institut de Formation des Soins infirmiers Sainte Jeanne d’Arc'),
(664, 112, 3, 'Institut de Formation des Soins infirmiers Sainte Jeanne d’Arc', 'mg. Short description .Institut de Formation des Soins infirmiers Sainte Jeanne d’Arc', 'mg. Description .Institut de Formation des Soins infirmiers Sainte Jeanne d’Arc'),
(665, 112, 4, 'Institut de Formation des Soins infirmiers Sainte Jeanne d’Arc', 'it. Short description .Institut de Formation des Soins infirmiers Sainte Jeanne d’Arc', 'it. Description .Institut de Formation des Soins infirmiers Sainte Jeanne d’Arc'),
(666, 112, 5, 'Institut de Formation des Soins infirmiers Sainte Jeanne d’Arc', 'es. Short description .Institut de Formation des Soins infirmiers Sainte Jeanne d’Arc', 'es. Description .Institut de Formation des Soins infirmiers Sainte Jeanne d’Arc'),
(667, 112, 6, 'Institut de Formation des Soins infirmiers Sainte Jeanne d’Arc', 'de. Short description .Institut de Formation des Soins infirmiers Sainte Jeanne d’Arc', 'de. Description .Institut de Formation des Soins infirmiers Sainte Jeanne d’Arc'),
(668, 113, 1, 'Institut de Formation S ocio - Médicale', 'fr. Short description .Institut de Formation S ocio - Médicale', 'fr. Description .Institut de Formation S ocio - Médicale'),
(669, 113, 2, 'Institut de Formation S ocio - Médicale', 'en. Short description .Institut de Formation S ocio - Médicale', 'en. Description .Institut de Formation S ocio - Médicale'),
(670, 113, 3, 'Institut de Formation S ocio - Médicale', 'mg. Short description .Institut de Formation S ocio - Médicale', 'mg. Description .Institut de Formation S ocio - Médicale'),
(671, 113, 4, 'Institut de Formation S ocio - Médicale', 'it. Short description .Institut de Formation S ocio - Médicale', 'it. Description .Institut de Formation S ocio - Médicale'),
(672, 113, 5, 'Institut de Formation S ocio - Médicale', 'es. Short description .Institut de Formation S ocio - Médicale', 'es. Description .Institut de Formation S ocio - Médicale'),
(673, 113, 6, 'Institut de Formation S ocio - Médicale', 'de. Short description .Institut de Formation S ocio - Médicale', 'de. Description .Institut de Formation S ocio - Médicale'),
(674, 114, 1, 'Institut de Formation S ocio - Médicale Analanjirofo', 'fr. Short description .Institut de Formation S ocio - Médicale Analanjirofo', 'fr. Description .Institut de Formation S ocio - Médicale Analanjirofo'),
(675, 114, 2, 'Institut de Formation S ocio - Médicale Analanjirofo', 'en. Short description .Institut de Formation S ocio - Médicale Analanjirofo', 'en. Description .Institut de Formation S ocio - Médicale Analanjirofo'),
(676, 114, 3, 'Institut de Formation S ocio - Médicale Analanjirofo', 'mg. Short description .Institut de Formation S ocio - Médicale Analanjirofo', 'mg. Description .Institut de Formation S ocio - Médicale Analanjirofo'),
(677, 114, 4, 'Institut de Formation S ocio - Médicale Analanjirofo', 'it. Short description .Institut de Formation S ocio - Médicale Analanjirofo', 'it. Description .Institut de Formation S ocio - Médicale Analanjirofo'),
(678, 114, 5, 'Institut de Formation S ocio - Médicale Analanjirofo', 'es. Short description .Institut de Formation S ocio - Médicale Analanjirofo', 'es. Description .Institut de Formation S ocio - Médicale Analanjirofo'),
(679, 114, 6, 'Institut de Formation S ocio - Médicale Analanjirofo', 'de. Short description .Institut de Formation S ocio - Médicale Analanjirofo', 'de. Description .Institut de Formation S ocio - Médicale Analanjirofo'),
(680, 115, 1, 'Institut de Formation Supérieure des Paramédicaux Les Rossignols', 'fr. Short description .Institut de Formation Supérieure des Paramédicaux Les Rossignols', 'fr. Description .Institut de Formation Supérieure des Paramédicaux Les Rossignols'),
(681, 115, 2, 'Institut de Formation Supérieure des Paramédicaux Les Rossignols', 'en. Short description .Institut de Formation Supérieure des Paramédicaux Les Rossignols', 'en. Description .Institut de Formation Supérieure des Paramédicaux Les Rossignols'),
(682, 115, 3, 'Institut de Formation Supérieure des Paramédicaux Les Rossignols', 'mg. Short description .Institut de Formation Supérieure des Paramédicaux Les Rossignols', 'mg. Description .Institut de Formation Supérieure des Paramédicaux Les Rossignols'),
(683, 115, 4, 'Institut de Formation Supérieure des Paramédicaux Les Rossignols', 'it. Short description .Institut de Formation Supérieure des Paramédicaux Les Rossignols', 'it. Description .Institut de Formation Supérieure des Paramédicaux Les Rossignols'),
(684, 115, 5, 'Institut de Formation Supérieure des Paramédicaux Les Rossignols', 'es. Short description .Institut de Formation Supérieure des Paramédicaux Les Rossignols', 'es. Description .Institut de Formation Supérieure des Paramédicaux Les Rossignols'),
(685, 115, 6, 'Institut de Formation Supérieure des Paramédicaux Les Rossignols', 'de. Short description .Institut de Formation Supérieure des Paramédicaux Les Rossignols', 'de. Description .Institut de Formation Supérieure des Paramédicaux Les Rossignols'),
(686, 116, 1, 'Institut de Formation Supérieure des Paramédicaux', 'fr. Short description .Institut de Formation Supérieure des Paramédicaux', 'fr. Description .Institut de Formation Supérieure des Paramédicaux'),
(687, 116, 2, 'Institut de Formation Supérieure des Paramédicaux', 'en. Short description .Institut de Formation Supérieure des Paramédicaux', 'en. Description .Institut de Formation Supérieure des Paramédicaux'),
(688, 116, 3, 'Institut de Formation Supérieure des Paramédicaux', 'mg. Short description .Institut de Formation Supérieure des Paramédicaux', 'mg. Description .Institut de Formation Supérieure des Paramédicaux'),
(689, 116, 4, 'Institut de Formation Supérieure des Paramédicaux', 'it. Short description .Institut de Formation Supérieure des Paramédicaux', 'it. Description .Institut de Formation Supérieure des Paramédicaux'),
(690, 116, 5, 'Institut de Formation Supérieure des Paramédicaux', 'es. Short description .Institut de Formation Supérieure des Paramédicaux', 'es. Description .Institut de Formation Supérieure des Paramédicaux'),
(691, 116, 6, 'Institut de Formation Supérieure des Paramédicaux', 'de. Short description .Institut de Formation Supérieure des Paramédicaux', 'de. Description .Institut de Formation Supérieure des Paramédicaux'),
(692, 117, 1, 'nstitut de Format ion Supérieure des Paramédicaux A tsinanana', 'fr. Short description .nstitut de Format ion Supérieure des Paramédicaux A tsinanana', 'fr. Description .nstitut de Format ion Supérieure des Paramédicaux A tsinanana'),
(693, 117, 2, 'nstitut de Format ion Supérieure des Paramédicaux A tsinanana', 'en. Short description .nstitut de Format ion Supérieure des Paramédicaux A tsinanana', 'en. Description .nstitut de Format ion Supérieure des Paramédicaux A tsinanana'),
(694, 117, 3, 'nstitut de Format ion Supérieure des Paramédicaux A tsinanana', 'mg. Short description .nstitut de Format ion Supérieure des Paramédicaux A tsinanana', 'mg. Description .nstitut de Format ion Supérieure des Paramédicaux A tsinanana'),
(695, 117, 4, 'nstitut de Format ion Supérieure des Paramédicaux A tsinanana', 'it. Short description .nstitut de Format ion Supérieure des Paramédicaux A tsinanana', 'it. Description .nstitut de Format ion Supérieure des Paramédicaux A tsinanana'),
(696, 117, 5, 'nstitut de Format ion Supérieure des Paramédicaux A tsinanana', 'es. Short description .nstitut de Format ion Supérieure des Paramédicaux A tsinanana', 'es. Description .nstitut de Format ion Supérieure des Paramédicaux A tsinanana'),
(697, 117, 6, 'nstitut de Format ion Supérieure des Paramédicaux A tsinanana', 'de. Short description .nstitut de Format ion Supérieure des Paramédicaux A tsinanana', 'de. Description .nstitut de Format ion Supérieure des Paramédicaux A tsinanana'),
(698, 118, 1, 'Institut de Format ion Supérieure des Paramédicaux Toamasina', 'fr. Short description .Institut de Format ion Supérieure des Paramédicaux Toamasina', 'fr. Description .Institut de Format ion Supérieure des Paramédicaux Toamasina'),
(699, 118, 2, 'Institut de Format ion Supérieure des Paramédicaux Toamasina', 'en. Short description .Institut de Format ion Supérieure des Paramédicaux Toamasina', 'en. Description .Institut de Format ion Supérieure des Paramédicaux Toamasina'),
(700, 118, 3, 'Institut de Format ion Supérieure des Paramédicaux Toamasina', 'mg. Short description .Institut de Format ion Supérieure des Paramédicaux Toamasina', 'mg. Description .Institut de Format ion Supérieure des Paramédicaux Toamasina'),
(701, 118, 4, 'Institut de Format ion Supérieure des Paramédicaux Toamasina', 'it. Short description .Institut de Format ion Supérieure des Paramédicaux Toamasina', 'it. Description .Institut de Format ion Supérieure des Paramédicaux Toamasina'),
(702, 118, 5, 'Institut de Format ion Supérieure des Paramédicaux Toamasina', 'es. Short description .Institut de Format ion Supérieure des Paramédicaux Toamasina', 'es. Description .Institut de Format ion Supérieure des Paramédicaux Toamasina'),
(703, 118, 6, 'Institut de Format ion Supérieure des Paramédicaux Toamasina', 'de. Short description .Institut de Format ion Supérieure des Paramédicaux Toamasina', 'de. Description .Institut de Format ion Supérieure des Paramédicaux Toamasina'),
(704, 119, 1, 'Institut de Formation e n Santé et Technologie Médicale', 'fr. Short description .Institut de Formation e n Santé et Technologie Médicale', 'fr. Description .Institut de Formation e n Santé et Technologie Médicale'),
(705, 119, 2, 'Institut de Formation e n Santé et Technologie Médicale', 'en. Short description .Institut de Formation e n Santé et Technologie Médicale', 'en. Description .Institut de Formation e n Santé et Technologie Médicale'),
(706, 119, 3, 'Institut de Formation e n Santé et Technologie Médicale', 'mg. Short description .Institut de Formation e n Santé et Technologie Médicale', 'mg. Description .Institut de Formation e n Santé et Technologie Médicale'),
(707, 119, 4, 'Institut de Formation e n Santé et Technologie Médicale', 'it. Short description .Institut de Formation e n Santé et Technologie Médicale', 'it. Description .Institut de Formation e n Santé et Technologie Médicale'),
(708, 119, 5, 'Institut de Formation e n Santé et Technologie Médicale', 'es. Short description .Institut de Formation e n Santé et Technologie Médicale', 'es. Description .Institut de Formation e n Santé et Technologie Médicale'),
(709, 119, 6, 'Institut de Formation e n Santé et Technologie Médicale', 'de. Short description .Institut de Formation e n Santé et Technologie Médicale', 'de. Description .Institut de Formation e n Santé et Technologie Médicale'),
(710, 120, 1, 'Institut de Gemmologie d’Antananarivo', 'fr. Short description .Institut de Gemmologie d’Antananarivo', 'fr. Description .Institut de Gemmologie d’Antananarivo'),
(711, 120, 2, 'Institut de Gemmologie d’Antananarivo', 'en. Short description .Institut de Gemmologie d’Antananarivo', 'en. Description .Institut de Gemmologie d’Antananarivo'),
(712, 120, 3, 'Institut de Gemmologie d’Antananarivo', 'mg. Short description .Institut de Gemmologie d’Antananarivo', 'mg. Description .Institut de Gemmologie d’Antananarivo'),
(713, 120, 4, 'Institut de Gemmologie d’Antananarivo', 'it. Short description .Institut de Gemmologie d’Antananarivo', 'it. Description .Institut de Gemmologie d’Antananarivo'),
(714, 120, 5, 'Institut de Gemmologie d’Antananarivo', 'es. Short description .Institut de Gemmologie d’Antananarivo', 'es. Description .Institut de Gemmologie d’Antananarivo'),
(715, 120, 6, 'Institut de Gemmologie d’Antananarivo', 'de. Short description .Institut de Gemmologie d’Antananarivo', 'de. Description .Institut de Gemmologie d’Antananarivo'),
(716, 121, 1, 'Institut de Génie Civil et Architecture de Madagasikara', 'fr. Short description .Institut de Génie Civil et Architecture de Madagasikara', 'fr. Description .Institut de Génie Civil et Architecture de Madagasikara'),
(717, 121, 2, 'Institut de Génie Civil et Architecture de Madagasikara', 'en. Short description .Institut de Génie Civil et Architecture de Madagasikara', 'en. Description .Institut de Génie Civil et Architecture de Madagasikara'),
(718, 121, 3, 'Institut de Génie Civil et Architecture de Madagasikara', 'mg. Short description .Institut de Génie Civil et Architecture de Madagasikara', 'mg. Description .Institut de Génie Civil et Architecture de Madagasikara'),
(719, 121, 4, 'Institut de Génie Civil et Architecture de Madagasikara', 'it. Short description .Institut de Génie Civil et Architecture de Madagasikara', 'it. Description .Institut de Génie Civil et Architecture de Madagasikara'),
(720, 121, 5, 'Institut de Génie Civil et Architecture de Madagasikara', 'es. Short description .Institut de Génie Civil et Architecture de Madagasikara', 'es. Description .Institut de Génie Civil et Architecture de Madagasikara'),
(721, 121, 6, 'Institut de Génie Civil et Architecture de Madagasikara', 'de. Short description .Institut de Génie Civil et Architecture de Madagasikara', 'de. Description .Institut de Génie Civil et Architecture de Madagasikara'),
(722, 122, 1, 'Institut de Gemmologie de Madagascar', 'fr. Short description .Institut de Gemmologie de Madagascar', 'fr. Description .Institut de Gemmologie de Madagascar'),
(723, 122, 2, 'Institut de Gemmologie de Madagascar', 'en. Short description .Institut de Gemmologie de Madagascar', 'en. Description .Institut de Gemmologie de Madagascar'),
(724, 122, 3, 'Institut de Gemmologie de Madagascar', 'mg. Short description .Institut de Gemmologie de Madagascar', 'mg. Description .Institut de Gemmologie de Madagascar'),
(725, 122, 4, 'Institut de Gemmologie de Madagascar', 'it. Short description .Institut de Gemmologie de Madagascar', 'it. Description .Institut de Gemmologie de Madagascar'),
(726, 122, 5, 'Institut de Gemmologie de Madagascar', 'es. Short description .Institut de Gemmologie de Madagascar', 'es. Description .Institut de Gemmologie de Madagascar'),
(727, 122, 6, 'Institut de Gemmologie de Madagascar', 'de. Short description .Institut de Gemmologie de Madagascar', 'de. Description .Institut de Gemmologie de Madagascar'),
(728, 123, 1, 'Institut International de Sciences Sociales', 'fr. Short description .Inst itut International de Sciences Sociales', '<p>fr. Description .Inst itut International de Sciences Sociales</p>'),
(729, 123, 2, 'Institut International de Sciences Sociales', 'en. Short description .Inst itut International de Sciences Sociales', '<p>en. Description .Inst itut International de Sciences Sociales</p>'),
(730, 123, 3, 'Institut International de Sciences Sociales', 'mg. Short description .Inst itut International de Sciences Sociales', '<p>mg. Description .Inst itut International de Sciences Sociales</p>'),
(731, 123, 4, 'Institut International de Sciences Sociales', 'it. Short description .Inst itut International de Sciences Sociales', '<p>it. Description .Inst itut International de Sciences Sociales</p>'),
(732, 123, 5, 'Institut International de Sciences Sociales', 'es. Short description .Inst itut International de Sciences Sociales', '<p>es. Description .Inst itut International de Sciences Sociales</p>'),
(733, 123, 6, 'Institut International de Sciences Sociales', 'de. Short description .Inst itut International de Sciences Sociales', '<p>de. Description .Inst itut International de Sciences Sociales</p>'),
(734, 124, 1, 'Institut de Leadership Chrétien', 'fr. Short description .Institut de Leadership Chrétien', 'fr. Description .Institut de Leadership Chrétien'),
(735, 124, 2, 'Institut de Leadership Chrétien', 'en. Short description .Institut de Leadership Chrétien', 'en. Description .Institut de Leadership Chrétien'),
(736, 124, 3, 'Institut de Leadership Chrétien', 'mg. Short description .Institut de Leadership Chrétien', 'mg. Description .Institut de Leadership Chrétien'),
(737, 124, 4, 'Institut de Leadership Chrétien', 'it. Short description .Institut de Leadership Chrétien', 'it. Description .Institut de Leadership Chrétien'),
(738, 124, 5, 'Institut de Leadership Chrétien', 'es. Short description .Institut de Leadership Chrétien', 'es. Description .Institut de Leadership Chrétien'),
(739, 124, 6, 'Institut de Leadership Chrétien', 'de. Short description .Institut de Leadership Chrétien', 'de. Description .Institut de Leadership Chrétien'),
(740, 125, 1, 'Institut de Management et de Gestion Appliqués', 'fr. Short description .Institut de Management et de Gestion Appliqués', 'fr. Description .Institut de Management et de Gestion Appliqués'),
(741, 125, 2, 'Institut de Management et de Gestion Appliqués', 'en. Short description .Institut de Management et de Gestion Appliqués', 'en. Description .Institut de Management et de Gestion Appliqués'),
(742, 125, 3, 'Institut de Management et de Gestion Appliqués', 'mg. Short description .Institut de Management et de Gestion Appliqués', 'mg. Description .Institut de Management et de Gestion Appliqués'),
(743, 125, 4, 'Institut de Management et de Gestion Appliqués', 'it. Short description .Institut de Management et de Gestion Appliqués', 'it. Description .Institut de Management et de Gestion Appliqués'),
(744, 125, 5, 'Institut de Management et de Gestion Appliqués', 'es. Short description .Institut de Management et de Gestion Appliqués', 'es. Description .Institut de Management et de Gestion Appliqués'),
(745, 125, 6, 'Institut de Management et de Gestion Appliqués', 'de. Short description .Institut de Management et de Gestion Appliqués', 'de. Description .Institut de Management et de Gestion Appliqués'),
(746, 126, 1, 'Institut de Management Administration, Gestion d’En treprise et Droit des Affaires', 'fr. Short description .Institut de Management Administration, Gestion d’En treprise et Droit des Affaires', 'fr. Description .Institut de Management Administration, Gestion d’En treprise et Droit des Affaires'),
(747, 126, 2, 'Institut de Management Administration, Gestion d’En treprise et Droit des Affaires', 'en. Short description .Institut de Management Administration, Gestion d’En treprise et Droit des Affaires', 'en. Description .Institut de Management Administration, Gestion d’En treprise et Droit des Affaires'),
(748, 126, 3, 'Institut de Management Administration, Gestion d’En treprise et Droit des Affaires', 'mg. Short description .Institut de Management Administration, Gestion d’En treprise et Droit des Affaires', 'mg. Description .Institut de Management Administration, Gestion d’En treprise et Droit des Affaires'),
(749, 126, 4, 'Institut de Management Administration, Gestion d’En treprise et Droit des Affaires', 'it. Short description .Institut de Management Administration, Gestion d’En treprise et Droit des Affaires', 'it. Description .Institut de Management Administration, Gestion d’En treprise et Droit des Affaires'),
(750, 126, 5, 'Institut de Management Administration, Gestion d’En treprise et Droit des Affaires', 'es. Short description .Institut de Management Administration, Gestion d’En treprise et Droit des Affaires', 'es. Description .Institut de Management Administration, Gestion d’En treprise et Droit des Affaires'),
(751, 126, 6, 'Institut de Management Administration, Gestion d’En treprise et Droit des Affaires', 'de. Short description .Institut de Management Administration, Gestion d’En treprise et Droit des Affaires', 'de. Description .Institut de Management Administration, Gestion d’En treprise et Droit des Affaires'),
(752, 127, 1, 'Institute of Management and Tourism', 'fr. Short description .Institut e of Management and Tourism', '<p>fr. Description .Institut e of Management and Tourism</p>'),
(753, 127, 2, 'Institute of Management and Tourism', 'en. Short description .Institut e of Management and Tourism', '<p>en. Description .Institut e of Management and Tourism</p>'),
(754, 127, 3, 'Institute of Management and Tourism', 'mg. Short description .Institut e of Management and Tourism', '<p>mg. Description .Institut e of Management and Tourism</p>'),
(755, 127, 4, 'Institute of Management and Tourism', 'it. Short description .Institut e of Management and Tourism', '<p>it. Description .Institut e of Management and Tourism</p>'),
(756, 127, 5, 'Institute of Management and Tourism', 'es. Short description .Institut e of Management and Tourism', '<p>es. Description .Institut e of Management and Tourism</p>'),
(757, 127, 6, 'Institute of Management and Tourism', 'de. Short description .Institut e of Management and Tourism', '<p>de. Description .Institut e of Management and Tourism</p>'),
(758, 128, 1, 'Institut des Arts et des Technologies Avancées', 'fr. Short description .Institut des Arts et des Technologies Avancées', 'fr. Description .Institut des Arts et des Technologies Avancées'),
(759, 128, 2, 'Institut des Arts et des Technologies Avancées', 'en. Short description .Institut des Arts et des Technologies Avancées', 'en. Description .Institut des Arts et des Technologies Avancées'),
(760, 128, 3, 'Institut des Arts et des Technologies Avancées', 'mg. Short description .Institut des Arts et des Technologies Avancées', 'mg. Description .Institut des Arts et des Technologies Avancées'),
(761, 128, 4, 'Institut des Arts et des Technologies Avancées', 'it. Short description .Institut des Arts et des Technologies Avancées', 'it. Description .Institut des Arts et des Technologies Avancées'),
(762, 128, 5, 'Institut des Arts et des Technologies Avancées', 'es. Short description .Institut des Arts et des Technologies Avancées', 'es. Description .Institut des Arts et des Technologies Avancées'),
(763, 128, 6, 'Institut des Arts et des Technologies Avancées', 'de. Short description .Institut des Arts et des Technologies Avancées', 'de. Description .Institut des Arts et des Technologies Avancées'),
(764, 129, 1, 'Ecole Info Espace', 'fr. Short description .Ecole Info Espace', 'fr. Description .Ecole Info Espace'),
(765, 129, 2, 'Ecole Info Espace', 'en. Short description .Ecole Info Espace', 'en. Description .Ecole Info Espace'),
(766, 129, 3, 'Ecole Info Espace', 'mg. Short description .Ecole Info Espace', 'mg. Description .Ecole Info Espace'),
(767, 129, 4, 'Ecole Info Espace', 'it. Short description .Ecole Info Espace', 'it. Description .Ecole Info Espace'),
(768, 129, 5, 'Ecole Info Espace', 'es. Short description .Ecole Info Espace', 'es. Description .Ecole Info Espace'),
(769, 129, 6, 'Ecole Info Espace', 'de. Short description .Ecole Info Espace', 'de. Description .Ecole Info Espace'),
(770, 130, 1, 'Institut de Formation Supérieure des Paramédicaux', 'fr. Short description .Institut de Formation Supérieure des Paramédicaux', 'fr. Description .Institut de Formation Supérieure des Paramédicaux'),
(771, 130, 2, 'Institut de Formation Supérieure des Paramédicaux', 'en. Short description .Institut de Formation Supérieure des Paramédicaux', 'en. Description .Institut de Formation Supérieure des Paramédicaux'),
(772, 130, 3, 'Institut de Formation Supérieure des Paramédicaux', 'mg. Short description .Institut de Formation Supérieure des Paramédicaux', 'mg. Description .Institut de Formation Supérieure des Paramédicaux'),
(773, 130, 4, 'Institut de Formation Supérieure des Paramédicaux', 'it. Short description .Institut de Formation Supérieure des Paramédicaux', 'it. Description .Institut de Formation Supérieure des Paramédicaux'),
(774, 130, 5, 'Institut de Formation Supérieure des Paramédicaux', 'es. Short description .Institut de Formation Supérieure des Paramédicaux', 'es. Description .Institut de Formation Supérieure des Paramédicaux'),
(775, 130, 6, 'Institut de Formation Supérieure des Paramédicaux', 'de. Short description .Institut de Formation Supérieure des Paramédicaux', 'de. Description .Institut de Formation Supérieure des Paramédicaux'),
(776, 131, 1, 'Institut National du Sciences Appliquées', 'fr. Short description .Institut National du Sciences Appliquées', 'fr. Description .Institut National du Sciences Appliquées'),
(777, 131, 2, 'Institut National du Sciences Appliquées', 'en. Short description .Institut National du Sciences Appliquées', 'en. Description .Institut National du Sciences Appliquées'),
(778, 131, 3, 'Institut National du Sciences Appliquées', 'mg. Short description .Institut National du Sciences Appliquées', 'mg. Description .Institut National du Sciences Appliquées'),
(779, 131, 4, 'Institut National du Sciences Appliquées', 'it. Short description .Institut National du Sciences Appliquées', 'it. Description .Institut National du Sciences Appliquées'),
(780, 131, 5, 'Institut National du Sciences Appliquées', 'es. Short description .Institut National du Sciences Appliquées', 'es. Description .Institut National du Sciences Appliquées'),
(781, 131, 6, 'Institut National du Sciences Appliquées', 'de. Short description .Institut National du Sciences Appliquées', 'de. Description .Institut National du Sciences Appliquées'),
(782, 132, 1, 'Institut Supérieur de Formation Paramédicale', 'fr. Short description .Institut Supérieur de Formation Paramédicale', 'fr. Description .Institut Supérieur de Formation Paramédicale'),
(783, 132, 2, 'Institut Supérieur de Formation Paramédicale', 'en. Short description .Institut Supérieur de Formation Paramédicale', 'en. Description .Institut Supérieur de Formation Paramédicale'),
(784, 132, 3, 'Institut Supérieur de Formation Paramédicale', 'mg. Short description .Institut Supérieur de Formation Paramédicale', 'mg. Description .Institut Supérieur de Formation Paramédicale'),
(785, 132, 4, 'Institut Supérieur de Formation Paramédicale', 'it. Short description .Institut Supérieur de Formation Paramédicale', 'it. Description .Institut Supérieur de Formation Paramédicale'),
(786, 132, 5, 'Institut Supérieur de Formation Paramédicale', 'es. Short description .Institut Supérieur de Formation Paramédicale', 'es. Description .Institut Supérieur de Formation Paramédicale'),
(787, 132, 6, 'Institut Supérieur de Formation Paramédicale', 'de. Short description .Institut Supérieur de Formation Paramédicale', 'de. Description .Institut Supérieur de Formation Paramédicale'),
(788, 133, 1, 'Institut Supérieur de Formation Paramédicale Toamasina Analanjirofo', 'fr. Short description .Institut Supérieur de Formation Paramédicale Toamasina Analanjirofo', 'fr. Description .Institut Supérieur de Formation Paramédicale Toamasina Analanjirofo'),
(789, 133, 2, 'Institut Supérieur de Formation Paramédicale Toamasina Analanjirofo', 'en. Short description .Institut Supérieur de Formation Paramédicale Toamasina Analanjirofo', 'en. Description .Institut Supérieur de Formation Paramédicale Toamasina Analanjirofo'),
(790, 133, 3, 'Institut Supérieur de Formation Paramédicale Toamasina Analanjirofo', 'mg. Short description .Institut Supérieur de Formation Paramédicale Toamasina Analanjirofo', 'mg. Description .Institut Supérieur de Formation Paramédicale Toamasina Analanjirofo'),
(791, 133, 4, 'Institut Supérieur de Formation Paramédicale Toamasina Analanjirofo', 'it. Short description .Institut Supérieur de Formation Paramédicale Toamasina Analanjirofo', 'it. Description .Institut Supérieur de Formation Paramédicale Toamasina Analanjirofo'),
(792, 133, 5, 'Institut Supérieur de Formation Paramédicale Toamasina Analanjirofo', 'es. Short description .Institut Supérieur de Formation Paramédicale Toamasina Analanjirofo', 'es. Description .Institut Supérieur de Formation Paramédicale Toamasina Analanjirofo'),
(793, 133, 6, 'Institut Supérieur de Formation Paramédicale Toamasina Analanjirofo', 'de. Short description .Institut Supérieur de Formation Paramédicale Toamasina Analanjirofo', 'de. Description .Institut Supérieur de Formation Paramédicale Toamasina Analanjirofo'),
(794, 134, 1, 'Institut Supérieur d’Etude Paramédicale du Menabe', 'fr. Short description .Institut Supérieur d’Etude Paramédicale du Menabe', 'fr. Description .Institut Supérieur d’Etude Paramédicale du Menabe'),
(795, 134, 2, 'Institut Supérieur d’Etude Paramédicale du Menabe', 'en. Short description .Institut Supérieur d’Etude Paramédicale du Menabe', 'en. Description .Institut Supérieur d’Etude Paramédicale du Menabe'),
(796, 134, 3, 'Institut Supérieur d’Etude Paramédicale du Menabe', 'mg. Short description .Institut Supérieur d’Etude Paramédicale du Menabe', 'mg. Description .Institut Supérieur d’Etude Paramédicale du Menabe'),
(797, 134, 4, 'Institut Supérieur d’Etude Paramédicale du Menabe', 'it. Short description .Institut Supérieur d’Etude Paramédicale du Menabe', 'it. Description .Institut Supérieur d’Etude Paramédicale du Menabe'),
(798, 134, 5, 'Institut Supérieur d’Etude Paramédicale du Menabe', 'es. Short description .Institut Supérieur d’Etude Paramédicale du Menabe', 'es. Description .Institut Supérieur d’Etude Paramédicale du Menabe'),
(799, 134, 6, 'Institut Supérieur d’Etude Paramédicale du Menabe', 'de. Short description .Institut Supérieur d’Etude Paramédicale du Menabe', 'de. Description .Institut Supérieur d’Etude Paramédicale du Menabe'),
(800, 135, 1, 'Institut Supérieur des Paramédicaux de Fort Dauphin', 'fr. Short description .Institut Supérieur des Paramédicaux de Fort Dauphin', 'fr. Description .Institut Supérieur des Paramédicaux de Fort Dauphin'),
(801, 135, 2, 'Institut Supérieur des Paramédicaux de Fort Dauphin', 'en. Short description .Institut Supérieur des Paramédicaux de Fort Dauphin', 'en. Description .Institut Supérieur des Paramédicaux de Fort Dauphin'),
(802, 135, 3, 'Institut Supérieur des Paramédicaux de Fort Dauphin', 'mg. Short description .Institut Supérieur des Paramédicaux de Fort Dauphin', 'mg. Description .Institut Supérieur des Paramédicaux de Fort Dauphin'),
(803, 135, 4, 'Institut Supérieur des Paramédicaux de Fort Dauphin', 'it. Short description .Institut Supérieur des Paramédicaux de Fort Dauphin', 'it. Description .Institut Supérieur des Paramédicaux de Fort Dauphin'),
(804, 135, 5, 'Institut Supérieur des Paramédicaux de Fort Dauphin', 'es. Short description .Institut Supérieur des Paramédicaux de Fort Dauphin', 'es. Description .Institut Supérieur des Paramédicaux de Fort Dauphin'),
(805, 135, 6, 'Institut Supérieur des Paramédicaux de Fort Dauphin', 'de. Short description .Institut Supérieur des Paramédicaux de Fort Dauphin', 'de. Description .Institut Supérieur des Paramédicaux de Fort Dauphin'),
(806, 136, 1, 'Institut Supérieur des Paramédicaux d’ Alaotra Mangoro', 'fr. Short description .Institut Supérieur des Paramédicaux d’ Alaotra Mangoro', 'fr. Description .Institut Supérieur des Paramédicaux d’ Alaotra Mangoro'),
(807, 136, 2, 'Institut Supérieur des Paramédicaux d’ Alaotra Mangoro', 'en. Short description .Institut Supérieur des Paramédicaux d’ Alaotra Mangoro', 'en. Description .Institut Supérieur des Paramédicaux d’ Alaotra Mangoro'),
(808, 136, 3, 'Institut Supérieur des Paramédicaux d’ Alaotra Mangoro', 'mg. Short description .Institut Supérieur des Paramédicaux d’ Alaotra Mangoro', 'mg. Description .Institut Supérieur des Paramédicaux d’ Alaotra Mangoro'),
(809, 136, 4, 'Institut Supérieur des Paramédicaux d’ Alaotra Mangoro', 'it. Short description .Institut Supérieur des Paramédicaux d’ Alaotra Mangoro', 'it. Description .Institut Supérieur des Paramédicaux d’ Alaotra Mangoro'),
(810, 136, 5, 'Institut Supérieur des Paramédicaux d’ Alaotra Mangoro', 'es. Short description .Institut Supérieur des Paramédicaux d’ Alaotra Mangoro', 'es. Description .Institut Supérieur des Paramédicaux d’ Alaotra Mangoro'),
(811, 136, 6, 'Institut Supérieur des Paramédicaux d’ Alaotra Mangoro', 'de. Short description .Institut Supérieur des Paramédicaux d’ Alaotra Mangoro', 'de. Description .Institut Supérieur des Paramédicaux d’ Alaotra Mangoro'),
(812, 137, 1, 'Institut Supérieur d’Etude Paramédicale de Madagascar', 'fr. Short description .Institut Supérieur d’Etude Paramédicale de Madagascar', 'fr. Description .Institut Supérieur d’Etude Paramédicale de Madagascar'),
(813, 137, 2, 'Institut Supérieur d’Etude Paramédicale de Madagascar', 'en. Short description .Institut Supérieur d’Etude Paramédicale de Madagascar', 'en. Description .Institut Supérieur d’Etude Paramédicale de Madagascar'),
(814, 137, 3, 'Institut Supérieur d’Etude Paramédicale de Madagascar', 'mg. Short description .Institut Supérieur d’Etude Paramédicale de Madagascar', 'mg. Description .Institut Supérieur d’Etude Paramédicale de Madagascar'),
(815, 137, 4, 'Institut Supérieur d’Etude Paramédicale de Madagascar', 'it. Short description .Institut Supérieur d’Etude Paramédicale de Madagascar', 'it. Description .Institut Supérieur d’Etude Paramédicale de Madagascar'),
(816, 137, 5, 'Institut Supérieur d’Etude Paramédicale de Madagascar', 'es. Short description .Institut Supérieur d’Etude Paramédicale de Madagascar', 'es. Description .Institut Supérieur d’Etude Paramédicale de Madagascar'),
(817, 137, 6, 'Institut Supérieur d’Etude Paramédicale de Madagascar', 'de. Short description .Institut Supérieur d’Etude Paramédicale de Madagascar', 'de. Description .Institut Supérieur d’Etude Paramédicale de Madagascar'),
(818, 138, 1, 'Institut Supérieur des Paramédicaux de la Région d’Ihosy', 'fr. Short description .Institut Supérieur des Paramédicaux de la Région d’Ihosy', 'fr. Description .Institut Supérieur des Paramédicaux de la Région d’Ihosy'),
(819, 138, 2, 'Institut Supérieur des Paramédicaux de la Région d’Ihosy', 'en. Short description .Institut Supérieur des Paramédicaux de la Région d’Ihosy', 'en. Description .Institut Supérieur des Paramédicaux de la Région d’Ihosy'),
(820, 138, 3, 'Institut Supérieur des Paramédicaux de la Région d’Ihosy', 'mg. Short description .Institut Supérieur des Paramédicaux de la Région d’Ihosy', 'mg. Description .Institut Supérieur des Paramédicaux de la Région d’Ihosy'),
(821, 138, 4, 'Institut Supérieur des Paramédicaux de la Région d’Ihosy', 'it. Short description .Institut Supérieur des Paramédicaux de la Région d’Ihosy', 'it. Description .Institut Supérieur des Paramédicaux de la Région d’Ihosy'),
(822, 138, 5, 'Institut Supérieur des Paramédicaux de la Région d’Ihosy', 'es. Short description .Institut Supérieur des Paramédicaux de la Région d’Ihosy', 'es. Description .Institut Supérieur des Paramédicaux de la Région d’Ihosy'),
(823, 138, 6, 'Institut Supérieur des Paramédicaux de la Région d’Ihosy', 'de. Short description .Institut Supérieur des Paramédicaux de la Région d’Ihosy', 'de. Description .Institut Supérieur des Paramédicaux de la Région d’Ihosy'),
(824, 139, 1, 'Institute of Technical Technology, Living and Interdisciplinary Arts of Madagascar', 'fr. Short description .Institute of Technical Technology, Living and Interdisciplinary Arts of Madagascar', 'fr. Description .Institute of Technical Technology, Living and Interdisciplinary Arts of Madagascar'),
(825, 139, 2, 'Institute of Technical Technology, Living and Interdisciplinary Arts of Madagascar', 'en. Short description .Institute of Technical Technology, Living and Interdisciplinary Arts of Madagascar', 'en. Description .Institute of Technical Technology, Living and Interdisciplinary Arts of Madagascar'),
(826, 139, 3, 'Institute of Technical Technology, Living and Interdisciplinary Arts of Madagascar', 'mg. Short description .Institute of Technical Technology, Living and Interdisciplinary Arts of Madagascar', 'mg. Description .Institute of Technical Technology, Living and Interdisciplinary Arts of Madagascar'),
(827, 139, 4, 'Institute of Technical Technology, Living and Interdisciplinary Arts of Madagascar', 'it. Short description .Institute of Technical Technology, Living and Interdisciplinary Arts of Madagascar', 'it. Description .Institute of Technical Technology, Living and Interdisciplinary Arts of Madagascar'),
(828, 139, 5, 'Institute of Technical Technology, Living and Interdisciplinary Arts of Madagascar', 'es. Short description .Institute of Technical Technology, Living and Interdisciplinary Arts of Madagascar', 'es. Description .Institute of Technical Technology, Living and Interdisciplinary Arts of Madagascar'),
(829, 139, 6, 'Institute of Technical Technology, Living and Interdisciplinary Arts of Madagascar', 'de. Short description .Institute of Technical Technology, Living and Interdisciplinary Arts of Madagascar', 'de. Description .Institute of Technical Technology, Living and Interdisciplinary Arts of Madagascar'),
(830, 140, 1, 'Institut Privé  Al Moustapha', 'fr. Short description .Institut Privé  Al Moustapha', 'fr. Description .Institut Privé  Al Moustapha'),
(831, 140, 2, 'Institut Privé  Al Moustapha', 'en. Short description .Institut Privé  Al Moustapha', 'en. Description .Institut Privé  Al Moustapha'),
(832, 140, 3, 'Institut Privé  Al Moustapha', 'mg. Short description .Institut Privé  Al Moustapha', 'mg. Description .Institut Privé  Al Moustapha'),
(833, 140, 4, 'Institut Privé  Al Moustapha', 'it. Short description .Institut Privé  Al Moustapha', 'it. Description .Institut Privé  Al Moustapha'),
(834, 140, 5, 'Institut Privé  Al Moustapha', 'es. Short description .Institut Privé  Al Moustapha', 'es. Description .Institut Privé  Al Moustapha'),
(835, 140, 6, 'Institut Privé  Al Moustapha', 'de. Short description .Institut Privé  Al Moustapha', 'de. Description .Institut Privé  Al Moustapha'),
(836, 141, 1, 'Institut Privé Le Bon Samaritain Toliara', 'fr. Short description .Institut Privé Le Bon Samaritain Toliara', 'fr. Description .Institut Privé Le Bon Samaritain Toliara'),
(837, 141, 2, 'Institut Privé Le Bon Samaritain Toliara', 'en. Short description .Institut Privé Le Bon Samaritain Toliara', 'en. Description .Institut Privé Le Bon Samaritain Toliara'),
(838, 141, 3, 'Institut Privé Le Bon Samaritain Toliara', 'mg. Short description .Institut Privé Le Bon Samaritain Toliara', 'mg. Description .Institut Privé Le Bon Samaritain Toliara'),
(839, 141, 4, 'Institut Privé Le Bon Samaritain Toliara', 'it. Short description .Institut Privé Le Bon Samaritain Toliara', 'it. Description .Institut Privé Le Bon Samaritain Toliara'),
(840, 141, 5, 'Institut Privé Le Bon Samaritain Toliara', 'es. Short description .Institut Privé Le Bon Samaritain Toliara', 'es. Description .Institut Privé Le Bon Samaritain Toliara'),
(841, 141, 6, 'Institut Privé Le Bon Samaritain Toliara', 'de. Short description .Institut Privé Le Bon Samaritain Toliara', 'de. Description .Institut Privé Le Bon Samaritain Toliara'),
(842, 142, 1, 'Institut Privé Paramédical d’Ihorombe', 'fr. Short description .Institut Privé Paramédical d’Ihorombe', 'fr. Description .Institut Privé Paramédical d’Ihorombe'),
(843, 142, 2, 'Institut Privé Paramédical d’Ihorombe', 'en. Short description .Institut Privé Paramédical d’Ihorombe', 'en. Description .Institut Privé Paramédical d’Ihorombe'),
(844, 142, 3, 'Institut Privé Paramédical d’Ihorombe', 'mg. Short description .Institut Privé Paramédical d’Ihorombe', 'mg. Description .Institut Privé Paramédical d’Ihorombe'),
(845, 142, 4, 'Institut Privé Paramédical d’Ihorombe', 'it. Short description .Institut Privé Paramédical d’Ihorombe', 'it. Description .Institut Privé Paramédical d’Ihorombe'),
(846, 142, 5, 'Institut Privé Paramédical d’Ihorombe', 'es. Short description .Institut Privé Paramédical d’Ihorombe', 'es. Description .Institut Privé Paramédical d’Ihorombe'),
(847, 142, 6, 'Institut Privé Paramédical d’Ihorombe', 'de. Short description .Institut Privé Paramédical d’Ihorombe', 'de. Description .Institut Privé Paramédical d’Ihorombe'),
(848, 143, 1, 'Institut Professionnel Superieur en Agronomie et en Technologie de Tombotsoa Antsirabe', 'fr. Short description .Institut Professionnel Superieur en Agronomie et en Technologie de Tombotsoa Antsirabe', 'fr. Description .Institut Professionnel Superieur en Agronomie et en Technologie de Tombotsoa Antsirabe'),
(849, 143, 2, 'Institut Professionnel Superieur en Agronomie et en Technologie de Tombotsoa Antsirabe', 'en. Short description .Institut Professionnel Superieur en Agronomie et en Technologie de Tombotsoa Antsirabe', 'en. Description .Institut Professionnel Superieur en Agronomie et en Technologie de Tombotsoa Antsirabe'),
(850, 143, 3, 'Institut Professionnel Superieur en Agronomie et en Technologie de Tombotsoa Antsirabe', 'mg. Short description .Institut Professionnel Superieur en Agronomie et en Technologie de Tombotsoa Antsirabe', 'mg. Description .Institut Professionnel Superieur en Agronomie et en Technologie de Tombotsoa Antsirabe'),
(851, 143, 4, 'Institut Professionnel Superieur en Agronomie et en Technologie de Tombotsoa Antsirabe', 'it. Short description .Institut Professionnel Superieur en Agronomie et en Technologie de Tombotsoa Antsirabe', 'it. Description .Institut Professionnel Superieur en Agronomie et en Technologie de Tombotsoa Antsirabe'),
(852, 143, 5, 'Institut Professionnel Superieur en Agronomie et en Technologie de Tombotsoa Antsirabe', 'es. Short description .Institut Professionnel Superieur en Agronomie et en Technologie de Tombotsoa Antsirabe', 'es. Description .Institut Professionnel Superieur en Agronomie et en Technologie de Tombotsoa Antsirabe'),
(853, 143, 6, 'Institut Professionnel Superieur en Agronomie et en Technologie de Tombotsoa Antsirabe', 'de. Short description .Institut Professionnel Superieur en Agronomie et en Technologie de Tombotsoa Antsirabe', 'de. Description .Institut Professionnel Superieur en Agronomie et en Technologie de Tombotsoa Antsirabe'),
(854, 144, 1, 'Institut Supérieur des Métiers de Madagascar', 'fr. Short description .Institut Supérieur des Métiers de Madagascar', 'fr. Description .Institut Supérieur des Métiers de Madagascar'),
(855, 144, 2, 'Institut Supérieur des Métiers de Madagascar', 'en. Short description .Institut Supérieur des Métiers de Madagascar', 'en. Description .Institut Supérieur des Métiers de Madagascar'),
(856, 144, 3, 'Institut Supérieur des Métiers de Madagascar', 'mg. Short description .Institut Supérieur des Métiers de Madagascar', 'mg. Description .Institut Supérieur des Métiers de Madagascar'),
(857, 144, 4, 'Institut Supérieur des Métiers de Madagascar', 'it. Short description .Institut Supérieur des Métiers de Madagascar', 'it. Description .Institut Supérieur des Métiers de Madagascar'),
(858, 144, 5, 'Institut Supérieur des Métiers de Madagascar', 'es. Short description .Institut Supérieur des Métiers de Madagascar', 'es. Description .Institut Supérieur des Métiers de Madagascar'),
(859, 144, 6, 'Institut Supérieur des Métiers de Madagascar', 'de. Short description .Institut Supérieur des Métiers de Madagascar', 'de. Description .Institut Supérieur des Métiers de Madagascar'),
(860, 145, 1, 'Institut Sainte Anne', 'fr. Short description .Institut Sainte Anne', 'fr. Description .Institut Sainte Anne'),
(861, 145, 2, 'Institut Sainte Anne', 'en. Short description .Institut Sainte Anne', 'en. Description .Institut Sainte Anne'),
(862, 145, 3, 'Institut Sainte Anne', 'mg. Short description .Institut Sainte Anne', 'mg. Description .Institut Sainte Anne'),
(863, 145, 4, 'Institut Sainte Anne', 'it. Short description .Institut Sainte Anne', 'it. Description .Institut Sainte Anne'),
(864, 145, 5, 'Institut Sainte Anne', 'es. Short description .Institut Sainte Anne', 'es. Description .Institut Sainte Anne'),
(865, 145, 6, 'Institut Sainte Anne', 'de. Short description .Institut Sainte Anne', 'de. Description .Institut Sainte Anne'),
(866, 146, 1, 'Institut Supérieur de l’Agronomie des Affaires et de la Communication', 'fr. Short description .Institut Supérieur de l’Agronomie des Affaires et de la Communication', 'fr. Description .Institut Supérieur de l’Agronomie des Affaires et de la Communication'),
(867, 146, 2, 'Institut Supérieur de l’Agronomie des Affaires et de la Communication', 'en. Short description .Institut Supérieur de l’Agronomie des Affaires et de la Communication', 'en. Description .Institut Supérieur de l’Agronomie des Affaires et de la Communication'),
(868, 146, 3, 'Institut Supérieur de l’Agronomie des Affaires et de la Communication', 'mg. Short description .Institut Supérieur de l’Agronomie des Affaires et de la Communication', 'mg. Description .Institut Supérieur de l’Agronomie des Affaires et de la Communication'),
(869, 146, 4, 'Institut Supérieur de l’Agronomie des Affaires et de la Communication', 'it. Short description .Institut Supérieur de l’Agronomie des Affaires et de la Communication', 'it. Description .Institut Supérieur de l’Agronomie des Affaires et de la Communication'),
(870, 146, 5, 'Institut Supérieur de l’Agronomie des Affaires et de la Communication', 'es. Short description .Institut Supérieur de l’Agronomie des Affaires et de la Communication', 'es. Description .Institut Supérieur de l’Agronomie des Affaires et de la Communication'),
(871, 146, 6, 'Institut Supérieur de l’Agronomie des Affaires et de la Communication', 'de. Short description .Institut Supérieur de l’Agronomie des Affaires et de la Communication', 'de. Description .Institut Supérieur de l’Agronomie des Affaires et de la Communication'),
(872, 147, 1, 'Institut  en Administration d’Entreprise « Cabinet Atomic »', 'fr. Short description .Institut  en Administration d’Entreprise « Cabinet Atomic »', 'fr. Description .Institut  en Administration d’Entreprise « Cabinet Atomic »'),
(873, 147, 2, 'Institut  en Administration d’Entreprise « Cabinet Atomic »', 'en. Short description .Institut  en Administration d’Entreprise « Cabinet Atomic »', 'en. Description .Institut  en Administration d’Entreprise « Cabinet Atomic »'),
(874, 147, 3, 'Institut  en Administration d’Entreprise « Cabinet Atomic »', 'mg. Short description .Institut  en Administration d’Entreprise « Cabinet Atomic »', 'mg. Description .Institut  en Administration d’Entreprise « Cabinet Atomic »'),
(875, 147, 4, 'Institut  en Administration d’Entreprise « Cabinet Atomic »', 'it. Short description .Institut  en Administration d’Entreprise « Cabinet Atomic »', 'it. Description .Institut  en Administration d’Entreprise « Cabinet Atomic »'),
(876, 147, 5, 'Institut  en Administration d’Entreprise « Cabinet Atomic »', 'es. Short description .Institut  en Administration d’Entreprise « Cabinet Atomic »', 'es. Description .Institut  en Administration d’Entreprise « Cabinet Atomic »'),
(877, 147, 6, 'Institut  en Administration d’Entreprise « Cabinet Atomic »', 'de. Short description .Institut  en Administration d’Entreprise « Cabinet Atomic »', 'de. Description .Institut  en Administration d’Entreprise « Cabinet Atomic »'),
(878, 148, 1, 'Institut Supérieur Adventiste de Gestion', 'fr. Short description .Institut Supérieur Adventiste de Gestion', 'fr. Description .Institut Supérieur Adventiste de Gestion'),
(879, 148, 2, 'Institut Supérieur Adventiste de Gestion', 'en. Short description .Institut Supérieur Adventiste de Gestion', 'en. Description .Institut Supérieur Adventiste de Gestion'),
(880, 148, 3, 'Institut Supérieur Adventiste de Gestion', 'mg. Short description .Institut Supérieur Adventiste de Gestion', 'mg. Description .Institut Supérieur Adventiste de Gestion'),
(881, 148, 4, 'Institut Supérieur Adventiste de Gestion', 'it. Short description .Institut Supérieur Adventiste de Gestion', 'it. Description .Institut Supérieur Adventiste de Gestion'),
(882, 148, 5, 'Institut Supérieur Adventiste de Gestion', 'es. Short description .Institut Supérieur Adventiste de Gestion', 'es. Description .Institut Supérieur Adventiste de Gestion'),
(883, 148, 6, 'Institut Supérieur Adventiste de Gestion', 'de. Short description .Institut Supérieur Adventiste de Gestion', 'de. Description .Institut Supérieur Adventiste de Gestion'),
(884, 149, 1, 'Institut Supérieur des Avenirs Professionnels', 'fr. Short description .Institut Supérieur des Avenirs Professionnels', 'fr. Description .Institut Supérieur des Avenirs Professionnels'),
(885, 149, 2, 'Institut Supérieur des Avenirs Professionnels', 'en. Short description .Institut Supérieur des Avenirs Professionnels', 'en. Description .Institut Supérieur des Avenirs Professionnels'),
(886, 149, 3, 'Institut Supérieur des Avenirs Professionnels', 'mg. Short description .Institut Supérieur des Avenirs Professionnels', 'mg. Description .Institut Supérieur des Avenirs Professionnels'),
(887, 149, 4, 'Institut Supérieur des Avenirs Professionnels', 'it. Short description .Institut Supérieur des Avenirs Professionnels', 'it. Description .Institut Supérieur des Avenirs Professionnels'),
(888, 149, 5, 'Institut Supérieur des Avenirs Professionnels', 'es. Short description .Institut Supérieur des Avenirs Professionnels', 'es. Description .Institut Supérieur des Avenirs Professionnels');
INSERT INTO `sl_school_translate` (`id`, `school_id`, `locale_id`, `name`, `short_description`, `description`) VALUES
(889, 149, 6, 'Institut Supérieur des Avenirs Professionnels', 'de. Short description .Institut Supérieur des Avenirs Professionnels', 'de. Description .Institut Supérieur des Avenirs Professionnels'),
(890, 150, 1, 'Institut Supérieur pour l’Avenir des Polytechniciens et la Santé Publique', 'fr. Short description .Institut Supérieur pour l’Avenir des Polytechniciens et la Santé Publique', 'fr. Description .Institut Supérieur pour l’Avenir des Polytechniciens et la Santé Publique'),
(891, 150, 2, 'Institut Supérieur pour l’Avenir des Polytechniciens et la Santé Publique', 'en. Short description .Institut Supérieur pour l’Avenir des Polytechniciens et la Santé Publique', 'en. Description .Institut Supérieur pour l’Avenir des Polytechniciens et la Santé Publique'),
(892, 150, 3, 'Institut Supérieur pour l’Avenir des Polytechniciens et la Santé Publique', 'mg. Short description .Institut Supérieur pour l’Avenir des Polytechniciens et la Santé Publique', 'mg. Description .Institut Supérieur pour l’Avenir des Polytechniciens et la Santé Publique'),
(893, 150, 4, 'Institut Supérieur pour l’Avenir des Polytechniciens et la Santé Publique', 'it. Short description .Institut Supérieur pour l’Avenir des Polytechniciens et la Santé Publique', 'it. Description .Institut Supérieur pour l’Avenir des Polytechniciens et la Santé Publique'),
(894, 150, 5, 'Institut Supérieur pour l’Avenir des Polytechniciens et la Santé Publique', 'es. Short description .Institut Supérieur pour l’Avenir des Polytechniciens et la Santé Publique', 'es. Description .Institut Supérieur pour l’Avenir des Polytechniciens et la Santé Publique'),
(895, 150, 6, 'Institut Supérieur pour l’Avenir des Polytechniciens et la Santé Publique', 'de. Short description .Institut Supérieur pour l’Avenir des Polytechniciens et la Santé Publique', 'de. Description .Institut Supérieur pour l’Avenir des Polytechniciens et la Santé Publique'),
(896, 151, 1, 'Institut Supérieur – ARCADE', 'fr. Short description .Institut Supérieur – ARCADE', 'fr. Description .Institut Supérieur – ARCADE'),
(897, 151, 2, 'Institut Supérieur – ARCADE', 'en. Short description .Institut Supérieur – ARCADE', 'en. Description .Institut Supérieur – ARCADE'),
(898, 151, 3, 'Institut Supérieur – ARCADE', 'mg. Short description .Institut Supérieur – ARCADE', 'mg. Description .Institut Supérieur – ARCADE'),
(899, 151, 4, 'Institut Supérieur – ARCADE', 'it. Short description .Institut Supérieur – ARCADE', 'it. Description .Institut Supérieur – ARCADE'),
(900, 151, 5, 'Institut Supérieur – ARCADE', 'es. Short description .Institut Supérieur – ARCADE', 'es. Description .Institut Supérieur – ARCADE'),
(901, 151, 6, 'Institut Supérieur – ARCADE', 'de. Short description .Institut Supérieur – ARCADE', 'de. Description .Institut Supérieur – ARCADE'),
(902, 152, 1, 'Institut Supérieur Catholique du Menabe', 'fr. Short description .Institut Supérieur Catholique du Menabe', 'fr. Description .Institut Supérieur Catholique du Menabe'),
(903, 152, 2, 'Institut Supérieur Catholique du Menabe', 'en. Short description .Institut Supérieur Catholique du Menabe', 'en. Description .Institut Supérieur Catholique du Menabe'),
(904, 152, 3, 'Institut Supérieur Catholique du Menabe', 'mg. Short description .Institut Supérieur Catholique du Menabe', 'mg. Description .Institut Supérieur Catholique du Menabe'),
(905, 152, 4, 'Institut Supérieur Catholique du Menabe', 'it. Short description .Institut Supérieur Catholique du Menabe', 'it. Description .Institut Supérieur Catholique du Menabe'),
(906, 152, 5, 'Institut Supérieur Catholique du Menabe', 'es. Short description .Institut Supérieur Catholique du Menabe', 'es. Description .Institut Supérieur Catholique du Menabe'),
(907, 152, 6, 'Institut Supérieur Catholique du Menabe', 'de. Short description .Institut Supérieur Catholique du Menabe', 'de. Description .Institut Supérieur Catholique du Menabe'),
(908, 153, 1, 'Institut Supérieur pour le Développement de l’Entreprenariat', 'fr. Short description .Institut Supérieur pour le Développement de l’Entreprenariat', 'fr. Description .Institut Supérieur pour le Développement de l’Entreprenariat'),
(909, 153, 2, 'Institut Supérieur pour le Développement de l’Entreprenariat', 'en. Short description .Institut Supérieur pour le Développement de l’Entreprenariat', 'en. Description .Institut Supérieur pour le Développement de l’Entreprenariat'),
(910, 153, 3, 'Institut Supérieur pour le Développement de l’Entreprenariat', 'mg. Short description .Institut Supérieur pour le Développement de l’Entreprenariat', 'mg. Description .Institut Supérieur pour le Développement de l’Entreprenariat'),
(911, 153, 4, 'Institut Supérieur pour le Développement de l’Entreprenariat', 'it. Short description .Institut Supérieur pour le Développement de l’Entreprenariat', 'it. Description .Institut Supérieur pour le Développement de l’Entreprenariat'),
(912, 153, 5, 'Institut Supérieur pour le Développement de l’Entreprenariat', 'es. Short description .Institut Supérieur pour le Développement de l’Entreprenariat', 'es. Description .Institut Supérieur pour le Développement de l’Entreprenariat'),
(913, 153, 6, 'Institut Supérieur pour le Développement de l’Entreprenariat', 'de. Short description .Institut Supérieur pour le Développement de l’Entreprenariat', 'de. Description .Institut Supérieur pour le Développement de l’Entreprenariat'),
(914, 154, 1, 'Institut Supérieur pour l’Entrepreneuriat, le Commerce et le Management', 'fr. Short description .Institut Supérieur pour l’Entrepreneuriat, le Commerce et le Management', 'fr. Description .Institut Supérieur pour l’Entrepreneuriat, le Commerce et le Management'),
(915, 154, 2, 'Institut Supérieur pour l’Entrepreneuriat, le Commerce et le Management', 'en. Short description .Institut Supérieur pour l’Entrepreneuriat, le Commerce et le Management', 'en. Description .Institut Supérieur pour l’Entrepreneuriat, le Commerce et le Management'),
(916, 154, 3, 'Institut Supérieur pour l’Entrepreneuriat, le Commerce et le Management', 'mg. Short description .Institut Supérieur pour l’Entrepreneuriat, le Commerce et le Management', 'mg. Description .Institut Supérieur pour l’Entrepreneuriat, le Commerce et le Management'),
(917, 154, 4, 'Institut Supérieur pour l’Entrepreneuriat, le Commerce et le Management', 'it. Short description .Institut Supérieur pour l’Entrepreneuriat, le Commerce et le Management', 'it. Description .Institut Supérieur pour l’Entrepreneuriat, le Commerce et le Management'),
(918, 154, 5, 'Institut Supérieur pour l’Entrepreneuriat, le Commerce et le Management', 'es. Short description .Institut Supérieur pour l’Entrepreneuriat, le Commerce et le Management', 'es. Description .Institut Supérieur pour l’Entrepreneuriat, le Commerce et le Management'),
(919, 154, 6, 'Institut Supérieur pour l’Entrepreneuriat, le Commerce et le Management', 'de. Short description .Institut Supérieur pour l’Entrepreneuriat, le Commerce et le Management', 'de. Description .Institut Supérieur pour l’Entrepreneuriat, le Commerce et le Management'),
(920, 155, 1, 'Institut Supérieur d’Etude , de Recherche et de Pratique', 'Institut Supérieur d’Etude , de Recherche et de Pratique', '<p>Institut Sup&eacute;rieur d&rsquo;Etude , de Recherche et de Pratique</p>'),
(921, 155, 2, 'test kely', 'en. Short description .test kely', 'en. Description .test kely'),
(922, 155, 3, 'test kely', 'mg. Short description .test kely', 'mg. Description .test kely'),
(923, 155, 4, 'test kely', 'it. Short description .test kely', 'it. Description .test kely'),
(924, 155, 5, 'test kely', 'es. Short description .test kely', 'es. Description .test kely'),
(925, 155, 6, 'test kely', 'de. Short description .test kely', 'de. Description .test kely'),
(926, 156, 1, 'Institut Supérieur de Formation en Gestion Informatisée', 'Institut Supérieur de Formation en Gestion Informatisée', '<p>Institut Sup&eacute;rieur de Formation en Gestion Informatis&eacute;e</p>'),
(927, 156, 2, 'Institut Supérieur de Formation en Gestion Informatisée', 'Institut Supérieur de Formation en Gestion Informatisée', '<p>Institut Sup&eacute;rieur de Formation en Gestion Informatis&eacute;e</p>'),
(928, 156, 3, 'test kelyf', 'mg. Short description .test kelyf', 'mg. Description .test kelyf'),
(929, 156, 4, 'test kelyf', 'it. Short description .test kelyf', 'it. Description .test kelyf'),
(930, 156, 5, 'test kelyf', 'es. Short description .test kelyf', 'es. Description .test kelyf'),
(931, 156, 6, 'test kelyf', 'de. Short description .test kelyf', 'de. Description .test kelyf'),
(932, 157, 1, 'Institut Supérieur de Génie Electronique Informatique', 'Institut Supérieur de Génie Electronique Informatique', '<p>Institut Sup&eacute;rieur de G&eacute;nie Electronique Informatique</p>'),
(933, 157, 2, 'Institut Supérieur de Génie Electronique Informatique', 'Institut Supérieur de Génie Electronique Informatique', '<p>Institut Sup&eacute;rieur de G&eacute;nie Electronique Informatique</p>'),
(934, 157, 3, 'gdfsd skskml', 'mg. Short description .gdfsd skskml', 'mg. Description .gdfsd skskml'),
(935, 157, 4, 'gdfsd skskml', 'it. Short description .gdfsd skskml', 'it. Description .gdfsd skskml'),
(936, 157, 5, 'gdfsd skskml', 'es. Short description .gdfsd skskml', 'es. Description .gdfsd skskml'),
(937, 157, 6, 'gdfsd skskml', 'de. Short description .gdfsd skskml', 'de. Description .gdfsd skskml'),
(938, 158, 1, 'Institut Supérieur de Géologie de l’Ingénieur et de l’Environnement de Madagascar', 'Institut Supérieur de Géologie de l’Ingénieur et de l’Environnement de Madagascar', '<p>Institut Sup&eacute;rieur de G&eacute;ologie de l&rsquo;Ing&eacute;nieur et de l&rsquo;Environnement de Madagascar</p>'),
(939, 158, 2, 'Institut Supérieur de Géologie de l’Ingénieur et de l’Environnement de Madagascar', 'Institut Supérieur de Géologie de l’Ingénieur et de l’Environnement de Madagascar', '<p>Institut Sup&eacute;rieur de G&eacute;ologie de l&rsquo;Ing&eacute;nieur et de l&rsquo;Environnement de Madagascar</p>'),
(940, 158, 3, 'autre test', 'mg. Short description .autre test', 'mg. Description .autre test'),
(941, 158, 4, 'autre test', 'it. Short description .autre test', 'it. Description .autre test'),
(942, 158, 5, 'autre test', 'es. Short description .autre test', 'es. Description .autre test'),
(943, 158, 6, 'autre test', 'de. Short description .autre test', 'de. Description .autre test'),
(944, 159, 1, 'Institut  Supérieur  d’Enseignement  Technologique  et  des Sciences', 'fr. Short description .Institut  Supérieur  d’Enseignement  Technologique  et  des Sciences', 'fr. Description .Institut  Supérieur  d’Enseignement  Technologique  et  des Sciences'),
(945, 159, 2, 'Institut  Supérieur  d’Enseignement  Technologique  et  des Sciences', 'en. Short description .Institut  Supérieur  d’Enseignement  Technologique  et  des Sciences', 'en. Description .Institut  Supérieur  d’Enseignement  Technologique  et  des Sciences'),
(946, 159, 3, 'Institut  Supérieur  d’Enseignement  Technologique  et  des Sciences', 'mg. Short description .Institut  Supérieur  d’Enseignement  Technologique  et  des Sciences', 'mg. Description .Institut  Supérieur  d’Enseignement  Technologique  et  des Sciences'),
(947, 159, 4, 'Institut  Supérieur  d’Enseignement  Technologique  et  des Sciences', 'it. Short description .Institut  Supérieur  d’Enseignement  Technologique  et  des Sciences', 'it. Description .Institut  Supérieur  d’Enseignement  Technologique  et  des Sciences'),
(948, 159, 5, 'Institut  Supérieur  d’Enseignement  Technologique  et  des Sciences', 'es. Short description .Institut  Supérieur  d’Enseignement  Technologique  et  des Sciences', 'es. Description .Institut  Supérieur  d’Enseignement  Technologique  et  des Sciences'),
(949, 159, 6, 'Institut  Supérieur  d’Enseignement  Technologique  et  des Sciences', 'de. Short description .Institut  Supérieur  d’Enseignement  Technologique  et  des Sciences', 'de. Description .Institut  Supérieur  d’Enseignement  Technologique  et  des Sciences'),
(950, 160, 1, 'Institut Supérieur de Formation Aéronautique Aérovision', 'fr. Short description .Institut Supérieur de Formation Aéronautique Aérovision', 'fr. Description .Institut Supérieur de Formation Aéronautique Aérovision'),
(951, 160, 2, 'Institut Supérieur de Formation Aéronautique Aérovision', 'en. Short description .Institut Supérieur de Formation Aéronautique Aérovision', 'en. Description .Institut Supérieur de Formation Aéronautique Aérovision'),
(952, 160, 3, 'Institut Supérieur de Formation Aéronautique Aérovision', 'mg. Short description .Institut Supérieur de Formation Aéronautique Aérovision', 'mg. Description .Institut Supérieur de Formation Aéronautique Aérovision'),
(953, 160, 4, 'Institut Supérieur de Formation Aéronautique Aérovision', 'it. Short description .Institut Supérieur de Formation Aéronautique Aérovision', 'it. Description .Institut Supérieur de Formation Aéronautique Aérovision'),
(954, 160, 5, 'Institut Supérieur de Formation Aéronautique Aérovision', 'es. Short description .Institut Supérieur de Formation Aéronautique Aérovision', 'es. Description .Institut Supérieur de Formation Aéronautique Aérovision'),
(955, 160, 6, 'Institut Supérieur de Formation Aéronautique Aérovision', 'de. Short description .Institut Supérieur de Formation Aéronautique Aérovision', 'de. Description .Institut Supérieur de Formation Aéronautique Aérovision'),
(956, 161, 1, 'Institut Supérieur d’Electronique et de Système Informatique', 'fr. Short description .Institut Supérieur d’Electronique et de Système Informatique', 'fr. Description .Institut Supérieur d’Electronique et de Système Informatique'),
(957, 161, 2, 'Institut Supérieur d’Electronique et de Système Informatique', 'en. Short description .Institut Supérieur d’Electronique et de Système Informatique', 'en. Description .Institut Supérieur d’Electronique et de Système Informatique'),
(958, 161, 3, 'Institut Supérieur d’Electronique et de Système Informatique', 'mg. Short description .Institut Supérieur d’Electronique et de Système Informatique', 'mg. Description .Institut Supérieur d’Electronique et de Système Informatique'),
(959, 161, 4, 'Institut Supérieur d’Electronique et de Système Informatique', 'it. Short description .Institut Supérieur d’Electronique et de Système Informatique', 'it. Description .Institut Supérieur d’Electronique et de Système Informatique'),
(960, 161, 5, 'Institut Supérieur d’Electronique et de Système Informatique', 'es. Short description .Institut Supérieur d’Electronique et de Système Informatique', 'es. Description .Institut Supérieur d’Electronique et de Système Informatique'),
(961, 161, 6, 'Institut Supérieur d’Electronique et de Système Informatique', 'de. Short description .Institut Supérieur d’Electronique et de Système Informatique', 'de. Description .Institut Supérieur d’Electronique et de Système Informatique'),
(962, 162, 1, 'Institut   Supérieur   d’Informatique   et   de   Management d’Entreprise', 'fr. Short description .Institut   Supérieur   d’Informatique   et   de   Management d’Entreprise', 'fr. Description .Institut   Supérieur   d’Informatique   et   de   Management d’Entreprise'),
(963, 162, 2, 'Institut   Supérieur   d’Informatique   et   de   Management d’Entreprise', 'en. Short description .Institut   Supérieur   d’Informatique   et   de   Management d’Entreprise', 'en. Description .Institut   Supérieur   d’Informatique   et   de   Management d’Entreprise'),
(964, 162, 3, 'Institut   Supérieur   d’Informatique   et   de   Management d’Entreprise', 'mg. Short description .Institut   Supérieur   d’Informatique   et   de   Management d’Entreprise', 'mg. Description .Institut   Supérieur   d’Informatique   et   de   Management d’Entreprise'),
(965, 162, 4, 'Institut   Supérieur   d’Informatique   et   de   Management d’Entreprise', 'it. Short description .Institut   Supérieur   d’Informatique   et   de   Management d’Entreprise', 'it. Description .Institut   Supérieur   d’Informatique   et   de   Management d’Entreprise'),
(966, 162, 5, 'Institut   Supérieur   d’Informatique   et   de   Management d’Entreprise', 'es. Short description .Institut   Supérieur   d’Informatique   et   de   Management d’Entreprise', 'es. Description .Institut   Supérieur   d’Informatique   et   de   Management d’Entreprise'),
(967, 162, 6, 'Institut   Supérieur   d’Informatique   et   de   Management d’Entreprise', 'de. Short description .Institut   Supérieur   d’Informatique   et   de   Management d’Entreprise', 'de. Description .Institut   Supérieur   d’Informatique   et   de   Management d’Entreprise'),
(968, 163, 1, 'Institut Supérieur en Informatique', 'fr. Short description .Institut Supérieur en Informatique', 'fr. Description .Institut Supérieur en Informatique'),
(969, 163, 2, 'Institut Supérieur en Informatique', 'en. Short description .Institut Supérieur en Informatique', 'en. Description .Institut Supérieur en Informatique'),
(970, 163, 3, 'Institut Supérieur en Informatique', 'mg. Short description .Institut Supérieur en Informatique', 'mg. Description .Institut Supérieur en Informatique'),
(971, 163, 4, 'Institut Supérieur en Informatique', 'it. Short description .Institut Supérieur en Informatique', 'it. Description .Institut Supérieur en Informatique'),
(972, 163, 5, 'Institut Supérieur en Informatique', 'es. Short description .Institut Supérieur en Informatique', 'es. Description .Institut Supérieur en Informatique'),
(973, 163, 6, 'Institut Supérieur en Informatique', 'de. Short description .Institut Supérieur en Informatique', 'de. Description .Institut Supérieur en Informatique'),
(974, 164, 1, 'Institut Supérieur d’Infirmiers et des Sages - femmes d’Antsiranana', 'fr. Short description .Institut Supérieur d’Infirmiers et des Sages - femmes d’Antsiranana', 'fr. Description .Institut Supérieur d’Infirmiers et des Sages - femmes d’Antsiranana'),
(975, 164, 2, 'Institut Supérieur d’Infirmiers et des Sages - femmes d’Antsiranana', 'en. Short description .Institut Supérieur d’Infirmiers et des Sages - femmes d’Antsiranana', 'en. Description .Institut Supérieur d’Infirmiers et des Sages - femmes d’Antsiranana'),
(976, 164, 3, 'Institut Supérieur d’Infirmiers et des Sages - femmes d’Antsiranana', 'mg. Short description .Institut Supérieur d’Infirmiers et des Sages - femmes d’Antsiranana', 'mg. Description .Institut Supérieur d’Infirmiers et des Sages - femmes d’Antsiranana'),
(977, 164, 4, 'Institut Supérieur d’Infirmiers et des Sages - femmes d’Antsiranana', 'it. Short description .Institut Supérieur d’Infirmiers et des Sages - femmes d’Antsiranana', 'it. Description .Institut Supérieur d’Infirmiers et des Sages - femmes d’Antsiranana'),
(978, 164, 5, 'Institut Supérieur d’Infirmiers et des Sages - femmes d’Antsiranana', 'es. Short description .Institut Supérieur d’Infirmiers et des Sages - femmes d’Antsiranana', 'es. Description .Institut Supérieur d’Infirmiers et des Sages - femmes d’Antsiranana'),
(979, 164, 6, 'Institut Supérieur d’Infirmiers et des Sages - femmes d’Antsiranana', 'de. Short description .Institut Supérieur d’Infirmiers et des Sages - femmes d’Antsiranana', 'de. Description .Institut Supérieur d’Infirmiers et des Sages - femmes d’Antsiranana'),
(980, 165, 1, 'Institut Supérieur de l’Ingénierie et des Techniques de Management', 'fr. Short description .Institut Supérieur de l’Ingénierie et des Techniques de Management', 'fr. Description .Institut Supérieur de l’Ingénierie et des Techniques de Management'),
(981, 165, 2, 'Institut Supérieur de l’Ingénierie et des Techniques de Management', 'en. Short description .Institut Supérieur de l’Ingénierie et des Techniques de Management', 'en. Description .Institut Supérieur de l’Ingénierie et des Techniques de Management'),
(982, 165, 3, 'Institut Supérieur de l’Ingénierie et des Techniques de Management', 'mg. Short description .Institut Supérieur de l’Ingénierie et des Techniques de Management', 'mg. Description .Institut Supérieur de l’Ingénierie et des Techniques de Management'),
(983, 165, 4, 'Institut Supérieur de l’Ingénierie et des Techniques de Management', 'it. Short description .Institut Supérieur de l’Ingénierie et des Techniques de Management', 'it. Description .Institut Supérieur de l’Ingénierie et des Techniques de Management'),
(984, 165, 5, 'Institut Supérieur de l’Ingénierie et des Techniques de Management', 'es. Short description .Institut Supérieur de l’Ingénierie et des Techniques de Management', 'es. Description .Institut Supérieur de l’Ingénierie et des Techniques de Management'),
(985, 165, 6, 'Institut Supérieur de l’Ingénierie et des Techniques de Management', 'de. Short description .Institut Supérieur de l’Ingénierie et des Techniques de Management', 'de. Description .Institut Supérieur de l’Ingénierie et des Techniques de Management'),
(986, 166, 1, 'Institut Supérieur en Sciences Infirmières et Obstétricales', 'fr. Short description .Institut Universitaire Polytechnique de Madagascar', '<p>fr. Description .Institut Universitaire Polytechnique de Madagascar</p>'),
(987, 166, 2, 'Institut Supérieur en Sciences Infirmières et Obstétricales', 'en. Short description .Institut Universitaire Polytechnique de Madagascar', '<p>en. Description .Institut Universitaire Polytechnique de Madagascar</p>'),
(988, 166, 3, 'Institut Supérieur en Sciences Infirmières et Obstétricales', 'mg. Short description .Institut Universitaire Polytechnique de Madagascar', '<p>mg. Description .Institut Universitaire Polytechnique de Madagascar</p>'),
(989, 166, 4, 'Institut Supérieur en Sciences Infirmières et Obstétricales', 'it. Short description .Institut Universitaire Polytechnique de Madagascar', '<p>it. Description .Institut Universitaire Polytechnique de Madagascar</p>'),
(990, 166, 5, 'Institut Supérieur en Sciences Infirmières et Obstétricales', 'es. Short description .Institut Universitaire Polytechnique de Madagascar', '<p>es. Description .Institut Universitaire Polytechnique de Madagascar</p>'),
(991, 166, 6, 'Institut Supérieur en Sciences Infirmières et Obstétricales', 'de. Short description .Institut Universitaire Polytechnique de Madagascar', '<p>de. Description .Institut Universitaire Polytechnique de Madagascar</p>'),
(992, 167, 1, 'Institut Supérieur de Majunga', 'fr. Short description .Institut Supérieur de Majunga', 'fr. Description .Institut Supérieur de Majunga'),
(993, 167, 2, 'Institut Supérieur de Majunga', 'en. Short description .Institut Supérieur de Majunga', 'en. Description .Institut Supérieur de Majunga'),
(994, 167, 3, 'Institut Supérieur de Majunga', 'mg. Short description .Institut Supérieur de Majunga', 'mg. Description .Institut Supérieur de Majunga'),
(995, 167, 4, 'Institut Supérieur de Majunga', 'it. Short description .Institut Supérieur de Majunga', 'it. Description .Institut Supérieur de Majunga'),
(996, 167, 5, 'Institut Supérieur de Majunga', 'es. Short description .Institut Supérieur de Majunga', 'es. Description .Institut Supérieur de Majunga'),
(997, 167, 6, 'Institut Supérieur de Majunga', 'de. Short description .Institut Supérieur de Majunga', 'de. Description .Institut Supérieur de Majunga'),
(998, 168, 1, 'Institut Supérieur Spécialisé en Informatique et en Gestion', 'fr. Short description .Institut Supérieur Spécialisé en Informatique et en Gestion', 'fr. Description .Institut Supérieur Spécialisé en Informatique et en Gestion'),
(999, 168, 2, 'Institut Supérieur Spécialisé en Informatique et en Gestion', 'en. Short description .Institut Supérieur Spécialisé en Informatique et en Gestion', 'en. Description .Institut Supérieur Spécialisé en Informatique et en Gestion'),
(1000, 168, 3, 'Institut Supérieur Spécialisé en Informatique et en Gestion', 'mg. Short description .Institut Supérieur Spécialisé en Informatique et en Gestion', 'mg. Description .Institut Supérieur Spécialisé en Informatique et en Gestion'),
(1001, 168, 4, 'Institut Supérieur Spécialisé en Informatique et en Gestion', 'it. Short description .Institut Supérieur Spécialisé en Informatique et en Gestion', 'it. Description .Institut Supérieur Spécialisé en Informatique et en Gestion'),
(1002, 168, 5, 'Institut Supérieur Spécialisé en Informatique et en Gestion', 'es. Short description .Institut Supérieur Spécialisé en Informatique et en Gestion', 'es. Description .Institut Supérieur Spécialisé en Informatique et en Gestion'),
(1003, 168, 6, 'Institut Supérieur Spécialisé en Informatique et en Gestion', 'de. Short description .Institut Supérieur Spécialisé en Informatique et en Gestion', 'de. Description .Institut Supérieur Spécialisé en Informatique et en Gestion'),
(1004, 169, 1, 'Institut Supérieur des Sciences Paramédicales de Madagascar', 'fr. Short description .Institut Supérieur des Sciences Paramédicales de Madagascar', 'fr. Description .Institut Supérieur des Sciences Paramédicales de Madagascar'),
(1005, 169, 2, 'Institut Supérieur des Sciences Paramédicales de Madagascar', 'en. Short description .Institut Supérieur des Sciences Paramédicales de Madagascar', 'en. Description .Institut Supérieur des Sciences Paramédicales de Madagascar'),
(1006, 169, 3, 'Institut Supérieur des Sciences Paramédicales de Madagascar', 'mg. Short description .Institut Supérieur des Sciences Paramédicales de Madagascar', 'mg. Description .Institut Supérieur des Sciences Paramédicales de Madagascar'),
(1007, 169, 4, 'Institut Supérieur des Sciences Paramédicales de Madagascar', 'it. Short description .Institut Supérieur des Sciences Paramédicales de Madagascar', 'it. Description .Institut Supérieur des Sciences Paramédicales de Madagascar'),
(1008, 169, 5, 'Institut Supérieur des Sciences Paramédicales de Madagascar', 'es. Short description .Institut Supérieur des Sciences Paramédicales de Madagascar', 'es. Description .Institut Supérieur des Sciences Paramédicales de Madagascar'),
(1009, 169, 6, 'Institut Supérieur des Sciences Paramédicales de Madagascar', 'de. Short description .Institut Supérieur des Sciences Paramédicales de Madagascar', 'de. Description .Institut Supérieur des Sciences Paramédicales de Madagascar'),
(1010, 170, 1, 'Institut supérieur en Sciences de la Santé pour le Développement', 'fr. Short description .Institut supérieur en Sciences de la Santé pour le Développement', 'fr. Description .Institut supérieur en Sciences de la Santé pour le Développement'),
(1011, 170, 2, 'Institut supérieur en Sciences de la Santé pour le Développement', 'en. Short description .Institut supérieur en Sciences de la Santé pour le Développement', 'en. Description .Institut supérieur en Sciences de la Santé pour le Développement'),
(1012, 170, 3, 'Institut supérieur en Sciences de la Santé pour le Développement', 'mg. Short description .Institut supérieur en Sciences de la Santé pour le Développement', 'mg. Description .Institut supérieur en Sciences de la Santé pour le Développement'),
(1013, 170, 4, 'Institut supérieur en Sciences de la Santé pour le Développement', 'it. Short description .Institut supérieur en Sciences de la Santé pour le Développement', 'it. Description .Institut supérieur en Sciences de la Santé pour le Développement'),
(1014, 170, 5, 'Institut supérieur en Sciences de la Santé pour le Développement', 'es. Short description .Institut supérieur en Sciences de la Santé pour le Développement', 'es. Description .Institut supérieur en Sciences de la Santé pour le Développement'),
(1015, 170, 6, 'Institut supérieur en Sciences de la Santé pour le Développement', 'de. Short description .Institut supérieur en Sciences de la Santé pour le Développement', 'de. Description .Institut supérieur en Sciences de la Santé pour le Développement'),
(1016, 171, 1, 'Institut de spécialisation en Sciences de Gestion EMIR Consulting', 'fr. Short description .Institut de spécialisation en Sciences de Gestion EMIR Consulting', 'fr. Description .Institut de spécialisation en Sciences de Gestion EMIR Consulting'),
(1017, 171, 2, 'Institut de spécialisation en Sciences de Gestion EMIR Consulting', 'en. Short description .Institut de spécialisation en Sciences de Gestion EMIR Consulting', 'en. Description .Institut de spécialisation en Sciences de Gestion EMIR Consulting'),
(1018, 171, 3, 'Institut de spécialisation en Sciences de Gestion EMIR Consulting', 'mg. Short description .Institut de spécialisation en Sciences de Gestion EMIR Consulting', 'mg. Description .Institut de spécialisation en Sciences de Gestion EMIR Consulting'),
(1019, 171, 4, 'Institut de spécialisation en Sciences de Gestion EMIR Consulting', 'it. Short description .Institut de spécialisation en Sciences de Gestion EMIR Consulting', 'it. Description .Institut de spécialisation en Sciences de Gestion EMIR Consulting'),
(1020, 171, 5, 'Institut de spécialisation en Sciences de Gestion EMIR Consulting', 'es. Short description .Institut de spécialisation en Sciences de Gestion EMIR Consulting', 'es. Description .Institut de spécialisation en Sciences de Gestion EMIR Consulting'),
(1021, 171, 6, 'Institut de spécialisation en Sciences de Gestion EMIR Consulting', 'de. Short description .Institut de spécialisation en Sciences de Gestion EMIR Consulting', 'de. Description .Institut de spécialisation en Sciences de Gestion EMIR Consulting'),
(1022, 172, 1, 'Institut Supérieur Privé Professionnel', 'fr. Short description .Institut Supérieur Privé Professionnel', 'fr. Description .Institut Supérieur Privé Professionnel'),
(1023, 172, 2, 'Institut Supérieur Privé Professionnel', 'en. Short description .Institut Supérieur Privé Professionnel', 'en. Description .Institut Supérieur Privé Professionnel'),
(1024, 172, 3, 'Institut Supérieur Privé Professionnel', 'mg. Short description .Institut Supérieur Privé Professionnel', 'mg. Description .Institut Supérieur Privé Professionnel'),
(1025, 172, 4, 'Institut Supérieur Privé Professionnel', 'it. Short description .Institut Supérieur Privé Professionnel', 'it. Description .Institut Supérieur Privé Professionnel'),
(1026, 172, 5, 'Institut Supérieur Privé Professionnel', 'es. Short description .Institut Supérieur Privé Professionnel', 'es. Description .Institut Supérieur Privé Professionnel'),
(1027, 172, 6, 'Institut Supérieur Privé Professionnel', 'de. Short description .Institut Supérieur Privé Professionnel', 'de. Description .Institut Supérieur Privé Professionnel'),
(1028, 173, 1, 'Institut Supérieur de Technologie Touristique, Agricole et Minière', 'fr. Short description .Institut Supérieur de Technologie Touristique, Agricole et Minière', 'fr. Description .Institut Supérieur de Technologie Touristique, Agricole et Minière'),
(1029, 173, 2, 'Institut Supérieur de Technologie Touristique, Agricole et Minière', 'en. Short description .Institut Supérieur de Technologie Touristique, Agricole et Minière', 'en. Description .Institut Supérieur de Technologie Touristique, Agricole et Minière'),
(1030, 173, 3, 'Institut Supérieur de Technologie Touristique, Agricole et Minière', 'mg. Short description .Institut Supérieur de Technologie Touristique, Agricole et Minière', 'mg. Description .Institut Supérieur de Technologie Touristique, Agricole et Minière'),
(1031, 173, 4, 'Institut Supérieur de Technologie Touristique, Agricole et Minière', 'it. Short description .Institut Supérieur de Technologie Touristique, Agricole et Minière', 'it. Description .Institut Supérieur de Technologie Touristique, Agricole et Minière'),
(1032, 173, 5, 'Institut Supérieur de Technologie Touristique, Agricole et Minière', 'es. Short description .Institut Supérieur de Technologie Touristique, Agricole et Minière', 'es. Description .Institut Supérieur de Technologie Touristique, Agricole et Minière'),
(1033, 173, 6, 'Institut Supérieur de Technologie Touristique, Agricole et Minière', 'de. Short description .Institut Supérieur de Technologie Touristique, Agricole et Minière', 'de. Description .Institut Supérieur de Technologie Touristique, Agricole et Minière'),
(1034, 174, 1, 'Institut Supérieur de Technologie Régionale de Vatovavy Fitovinany', 'fr. Short description .Institut Supérieur de Technologie Régionale de Vatovavy Fitovinany', 'fr. Description .Institut Supérieur de Technologie Régionale de Vatovavy Fitovinany'),
(1035, 174, 2, 'Institut Supérieur de Technologie Régionale de Vatovavy Fitovinany', 'en. Short description .Institut Supérieur de Technologie Régionale de Vatovavy Fitovinany', 'en. Description .Institut Supérieur de Technologie Régionale de Vatovavy Fitovinany'),
(1036, 174, 3, 'Institut Supérieur de Technologie Régionale de Vatovavy Fitovinany', 'mg. Short description .Institut Supérieur de Technologie Régionale de Vatovavy Fitovinany', 'mg. Description .Institut Supérieur de Technologie Régionale de Vatovavy Fitovinany'),
(1037, 174, 4, 'Institut Supérieur de Technologie Régionale de Vatovavy Fitovinany', 'it. Short description .Institut Supérieur de Technologie Régionale de Vatovavy Fitovinany', 'it. Description .Institut Supérieur de Technologie Régionale de Vatovavy Fitovinany'),
(1038, 174, 5, 'Institut Supérieur de Technologie Régionale de Vatovavy Fitovinany', 'es. Short description .Institut Supérieur de Technologie Régionale de Vatovavy Fitovinany', 'es. Description .Institut Supérieur de Technologie Régionale de Vatovavy Fitovinany'),
(1039, 174, 6, 'Institut Supérieur de Technologie Régionale de Vatovavy Fitovinany', 'de. Short description .Institut Supérieur de Technologie Régionale de Vatovavy Fitovinany', 'de. Description .Institut Supérieur de Technologie Régionale de Vatovavy Fitovinany'),
(1040, 175, 1, 'Institut Supérieur de Travail Social', 'fr. Short description .Institut Supérieur de Travail Social', 'fr. Description .Institut Supérieur de Travail Social'),
(1041, 175, 2, 'Institut Supérieur de Travail Social', 'en. Short description .Institut Supérieur de Travail Social', 'en. Description .Institut Supérieur de Travail Social'),
(1042, 175, 3, 'Institut Supérieur de Travail Social', 'mg. Short description .Institut Supérieur de Travail Social', 'mg. Description .Institut Supérieur de Travail Social'),
(1043, 175, 4, 'Institut Supérieur de Travail Social', 'it. Short description .Institut Supérieur de Travail Social', 'it. Description .Institut Supérieur de Travail Social'),
(1044, 175, 5, 'Institut Supérieur de Travail Social', 'es. Short description .Institut Supérieur de Travail Social', 'es. Description .Institut Supérieur de Travail Social'),
(1045, 175, 6, 'Institut Supérieur de Travail Social', 'de. Short description .Institut Supérieur de Travail Social', 'de. Description .Institut Supérieur de Travail Social'),
(1046, 176, 1, 'Institut Universitaire de Madagascar', 'fr. Short description .Institut Universitaire de Madagascar', 'fr. Description .Institut Universitaire de Madagascar'),
(1047, 176, 2, 'Institut Universitaire de Madagascar', 'en. Short description .Institut Universitaire de Madagascar', 'en. Description .Institut Universitaire de Madagascar'),
(1048, 176, 3, 'Institut Universitaire de Madagascar', 'mg. Short description .Institut Universitaire de Madagascar', 'mg. Description .Institut Universitaire de Madagascar'),
(1049, 176, 4, 'Institut Universitaire de Madagascar', 'it. Short description .Institut Universitaire de Madagascar', 'it. Description .Institut Universitaire de Madagascar'),
(1050, 176, 5, 'Institut Universitaire de Madagascar', 'es. Short description .Institut Universitaire de Madagascar', 'es. Description .Institut Universitaire de Madagascar'),
(1051, 176, 6, 'Institut Universitaire de Madagascar', 'de. Short description .Institut Universitaire de Madagascar', 'de. Description .Institut Universitaire de Madagascar'),
(1052, 177, 1, 'Institut Universitaire Privé de Tananarive', 'fr. Short description .Institut Universitaire Privé de Tananarive', 'fr. Description .Institut Universitaire Privé de Tananarive'),
(1053, 177, 2, 'Institut Universitaire Privé de Tananarive', 'en. Short description .Institut Universitaire Privé de Tananarive', 'en. Description .Institut Universitaire Privé de Tananarive'),
(1054, 177, 3, 'Institut Universitaire Privé de Tananarive', 'mg. Short description .Institut Universitaire Privé de Tananarive', 'mg. Description .Institut Universitaire Privé de Tananarive'),
(1055, 177, 4, 'Institut Universitaire Privé de Tananarive', 'it. Short description .Institut Universitaire Privé de Tananarive', 'it. Description .Institut Universitaire Privé de Tananarive'),
(1056, 177, 5, 'Institut Universitaire Privé de Tananarive', 'es. Short description .Institut Universitaire Privé de Tananarive', 'es. Description .Institut Universitaire Privé de Tananarive'),
(1057, 177, 6, 'Institut Universitaire Privé de Tananarive', 'de. Short description .Institut Universitaire Privé de Tananarive', 'de. Description .Institut Universitaire Privé de Tananarive'),
(1058, 178, 1, 'Institut Univers itaire Professionnel en Administration d’Entreprise et en Sciences Marines', 'fr. Short description .Institut Univers itaire Professionnel en Administration d’Entreprise et en Sciences Marines', 'fr. Description .Institut Univers itaire Professionnel en Administration d’Entreprise et en Sciences Marines'),
(1059, 178, 2, 'Institut Univers itaire Professionnel en Administration d’Entreprise et en Sciences Marines', 'en. Short description .Institut Univers itaire Professionnel en Administration d’Entreprise et en Sciences Marines', 'en. Description .Institut Univers itaire Professionnel en Administration d’Entreprise et en Sciences Marines'),
(1060, 178, 3, 'Institut Univers itaire Professionnel en Administration d’Entreprise et en Sciences Marines', 'mg. Short description .Institut Univers itaire Professionnel en Administration d’Entreprise et en Sciences Marines', 'mg. Description .Institut Univers itaire Professionnel en Administration d’Entreprise et en Sciences Marines'),
(1061, 178, 4, 'Institut Univers itaire Professionnel en Administration d’Entreprise et en Sciences Marines', 'it. Short description .Institut Univers itaire Professionnel en Administration d’Entreprise et en Sciences Marines', 'it. Description .Institut Univers itaire Professionnel en Administration d’Entreprise et en Sciences Marines'),
(1062, 178, 5, 'Institut Univers itaire Professionnel en Administration d’Entreprise et en Sciences Marines', 'es. Short description .Institut Univers itaire Professionnel en Administration d’Entreprise et en Sciences Marines', 'es. Description .Institut Univers itaire Professionnel en Administration d’Entreprise et en Sciences Marines'),
(1063, 178, 6, 'Institut Univers itaire Professionnel en Administration d’Entreprise et en Sciences Marines', 'de. Short description .Institut Univers itaire Professionnel en Administration d’Entreprise et en Sciences Marines', 'de. Description .Institut Univers itaire Professionnel en Administration d’Entreprise et en Sciences Marines'),
(1064, 179, 1, 'Jeanne D’Arc University', 'fr. Short description .Jeanne D’Arc University', 'fr. Description .Jeanne D’Arc University'),
(1065, 179, 2, 'Jeanne D’Arc University', 'en. Short description .Jeanne D’Arc University', 'en. Description .Jeanne D’Arc University'),
(1066, 179, 3, 'Jeanne D’Arc University', 'mg. Short description .Jeanne D’Arc University', 'mg. Description .Jeanne D’Arc University'),
(1067, 179, 4, 'Jeanne D’Arc University', 'it. Short description .Jeanne D’Arc University', 'it. Description .Jeanne D’Arc University'),
(1068, 179, 5, 'Jeanne D’Arc University', 'es. Short description .Jeanne D’Arc University', 'es. Description .Jeanne D’Arc University'),
(1069, 179, 6, 'Jeanne D’Arc University', 'de. Short description .Jeanne D’Arc University', 'de. Description .Jeanne D’Arc University'),
(1070, 180, 1, 'Lutheran Institute of Management  and Entrepreneurship Fianarantsoa', 'fr. Short description .Lutheran Institute of Management  and Entrepreneurship Fianarantsoa', 'fr. Description .Lutheran Institute of Management  and Entrepreneurship Fianarantsoa'),
(1071, 180, 2, 'Lutheran Institute of Management  and Entrepreneurship Fianarantsoa', 'en. Short description .Lutheran Institute of Management  and Entrepreneurship Fianarantsoa', 'en. Description .Lutheran Institute of Management  and Entrepreneurship Fianarantsoa'),
(1072, 180, 3, 'Lutheran Institute of Management  and Entrepreneurship Fianarantsoa', 'mg. Short description .Lutheran Institute of Management  and Entrepreneurship Fianarantsoa', 'mg. Description .Lutheran Institute of Management  and Entrepreneurship Fianarantsoa'),
(1073, 180, 4, 'Lutheran Institute of Management  and Entrepreneurship Fianarantsoa', 'it. Short description .Lutheran Institute of Management  and Entrepreneurship Fianarantsoa', 'it. Description .Lutheran Institute of Management  and Entrepreneurship Fianarantsoa'),
(1074, 180, 5, 'Lutheran Institute of Management  and Entrepreneurship Fianarantsoa', 'es. Short description .Lutheran Institute of Management  and Entrepreneurship Fianarantsoa', 'es. Description .Lutheran Institute of Management  and Entrepreneurship Fianarantsoa'),
(1075, 180, 6, 'Lutheran Institute of Management  and Entrepreneurship Fianarantsoa', 'de. Short description .Lutheran Institute of Management  and Entrepreneurship Fianarantsoa', 'de. Description .Lutheran Institute of Management  and Entrepreneurship Fianarantsoa'),
(1076, 181, 1, 'Leadership Management Business University', 'fr. Short description .Leadership Management Business University', 'fr. Description .Leadership Management Business University'),
(1077, 181, 2, 'Leadership Management Business University', 'en. Short description .Leadership Management Business University', 'en. Description .Leadership Management Business University'),
(1078, 181, 3, 'Leadership Management Business University', 'mg. Short description .Leadership Management Business University', 'mg. Description .Leadership Management Business University'),
(1079, 181, 4, 'Leadership Management Business University', 'it. Short description .Leadership Management Business University', 'it. Description .Leadership Management Business University'),
(1080, 181, 5, 'Leadership Management Business University', 'es. Short description .Leadership Management Business University', 'es. Description .Leadership Management Business University'),
(1081, 181, 6, 'Leadership Management Business University', 'de. Short description .Leadership Management Business University', 'de. Description .Leadership Management Business University'),
(1082, 182, 1, 'Miasa Initiative and Business Consulting – Institute Formation et Création', 'fr. Short description .Miasa Initiative and Business Consulting – Institute Formation et Création', 'fr. Description .Miasa Initiative and Business Consulting – Institute Formation et Création'),
(1083, 182, 2, 'Miasa Initiative and Business Consulting – Institute Formation et Création', 'en. Short description .Miasa Initiative and Business Consulting – Institute Formation et Création', 'en. Description .Miasa Initiative and Business Consulting – Institute Formation et Création'),
(1084, 182, 3, 'Miasa Initiative and Business Consulting – Institute Formation et Création', 'mg. Short description .Miasa Initiative and Business Consulting – Institute Formation et Création', 'mg. Description .Miasa Initiative and Business Consulting – Institute Formation et Création'),
(1085, 182, 4, 'Miasa Initiative and Business Consulting – Institute Formation et Création', 'it. Short description .Miasa Initiative and Business Consulting – Institute Formation et Création', 'it. Description .Miasa Initiative and Business Consulting – Institute Formation et Création'),
(1086, 182, 5, 'Miasa Initiative and Business Consulting – Institute Formation et Création', 'es. Short description .Miasa Initiative and Business Consulting – Institute Formation et Création', 'es. Description .Miasa Initiative and Business Consulting – Institute Formation et Création'),
(1087, 182, 6, 'Miasa Initiative and Business Consulting – Institute Formation et Création', 'de. Short description .Miasa Initiative and Business Consulting – Institute Formation et Création', 'de. Description .Miasa Initiative and Business Consulting – Institute Formation et Création'),
(1088, 183, 1, 'Ecole de Guitare de Madagascar', 'Premier « Conservatoire et de Faculté de Musique de Madagascar, L’EGM, est un établissement d’enseignement musical privé d’envergure nationale. Ouvert en 2005, elle forme depuis des étudiants venus des quatre coins du pays à travers ses 3 départements : MUSIQUE, DANSE et THEATRE.', '<p>Premier &laquo; Conservatoire et de Facult&eacute; de Musique de Madagascar, L&rsquo;EGM, est un &eacute;tablissement d&rsquo;enseignement musical priv&eacute; d&rsquo;envergure nationale. Ouvert en 2005, elle forme depuis des &eacute;tudiants venus des quatre coins du pays &agrave; travers ses 3 d&eacute;partements : MUSIQUE, DANSE et THEATRE.<br /><br />L&rsquo;EGM propose 3 formations bien distinctes:</p>\n<ul>\n<li>la formation acad&eacute;mique/pr&eacute;paratoire (du niveau d&eacute;butant &agrave; niveau Cycle3)</li>\n<li>la formation professionnelle (DEM)</li>\n<li>la formation sup&eacute;rieure/universitaire (DTS-Bac+2, Licence-Bac+3 en cours)</li>\n</ul>\n<p>L&rsquo;ann&eacute;e acad&eacute;mique d&eacute;bute en octobre et se termine en juillet. L&rsquo;EGM offre aussi bien des cours de vacances pour tout &acirc;ge tout niveau que des stages de perfectionnement.<br /><br />&laquo; La vie sans musique serait une erreur &raquo; F. Nietzsche</p>'),
(1089, 183, 2, 'Ecole de Guitare de Madagascar', 'Premier « Conservatoire et de Faculté de Musique de Madagascar, L’EGM, est un établissement d’enseignement musical privé d’envergure nationale. Ouvert en 2005, elle forme depuis des étudiants venus des quatre coins du pays à travers ses 3 départements : MUSIQUE, DANSE et THEATRE.', '<p>Premier &laquo; Conservatoire et de Facult&eacute; de Musique de Madagascar, L&rsquo;EGM, est un &eacute;tablissement d&rsquo;enseignement musical priv&eacute; d&rsquo;envergure nationale. Ouvert en 2005, elle forme depuis des &eacute;tudiants venus des quatre coins du pays &agrave; travers ses 3 d&eacute;partements : MUSIQUE, DANSE et THEATRE.<br /><br />L&rsquo;EGM propose 3 formations bien distinctes:</p>\n<ul>\n<li>la formation acad&eacute;mique/pr&eacute;paratoire (du niveau d&eacute;butant &agrave; niveau Cycle3)</li>\n<li>la formation professionnelle (DEM)</li>\n<li>la formation sup&eacute;rieure/universitaire (DTS-Bac+2, Licence-Bac+3 en cours)</li>\n</ul>\n<p>L&rsquo;ann&eacute;e acad&eacute;mique d&eacute;bute en octobre et se termine en juillet. L&rsquo;EGM offre aussi bien des cours de vacances pour tout &acirc;ge tout niveau que des stages de perfectionnement.<br /><br />&laquo; La vie sans musique serait une erreur &raquo; F. Nietzsche</p>'),
(1090, 183, 3, 'Ecole de Guitare de Madagascar', 'Premier « Conservatoire et de Faculté de Musique de Madagascar, L’EGM, est un établissement d’enseignement musical privé d’envergure nationale. Ouvert en 2005, elle forme depuis des étudiants venus des quatre coins du pays à travers ses 3 départements : MUSIQUE, DANSE et THEATRE.', '<p>Premier &laquo; Conservatoire et de Facult&eacute; de Musique de Madagascar, L&rsquo;EGM, est un &eacute;tablissement d&rsquo;enseignement musical priv&eacute; d&rsquo;envergure nationale. Ouvert en 2005, elle forme depuis des &eacute;tudiants venus des quatre coins du pays &agrave; travers ses 3 d&eacute;partements : MUSIQUE, DANSE et THEATRE.<br /><br />L&rsquo;EGM propose 3 formations bien distinctes:</p>\n<ul>\n<li>la formation acad&eacute;mique/pr&eacute;paratoire (du niveau d&eacute;butant &agrave; niveau Cycle3)</li>\n<li>la formation professionnelle (DEM)</li>\n<li>la formation sup&eacute;rieure/universitaire (DTS-Bac+2, Licence-Bac+3 en cours)</li>\n</ul>\n<p>L&rsquo;ann&eacute;e acad&eacute;mique d&eacute;bute en octobre et se termine en juillet. L&rsquo;EGM offre aussi bien des cours de vacances pour tout &acirc;ge tout niveau que des stages de perfectionnement.<br /><br />&laquo; La vie sans musique serait une erreur &raquo; F. Nietzsche</p>'),
(1091, 183, 4, 'Ecole de Guitare de Madagascar', 'Premier « Conservatoire et de Faculté de Musique de Madagascar, L’EGM, est un établissement d’enseignement musical privé d’envergure nationale. Ouvert en 2005, elle forme depuis des étudiants venus des quatre coins du pays à travers ses 3 départements : MUSIQUE, DANSE et THEATRE.', '<p>Premier &laquo; Conservatoire et de Facult&eacute; de Musique de Madagascar, L&rsquo;EGM, est un &eacute;tablissement d&rsquo;enseignement musical priv&eacute; d&rsquo;envergure nationale. Ouvert en 2005, elle forme depuis des &eacute;tudiants venus des quatre coins du pays &agrave; travers ses 3 d&eacute;partements : MUSIQUE, DANSE et THEATRE.<br /><br />L&rsquo;EGM propose 3 formations bien distinctes:</p>\n<ul>\n<li>la formation acad&eacute;mique/pr&eacute;paratoire (du niveau d&eacute;butant &agrave; niveau Cycle3)</li>\n<li>la formation professionnelle (DEM)</li>\n<li>la formation sup&eacute;rieure/universitaire (DTS-Bac+2, Licence-Bac+3 en cours)</li>\n</ul>\n<p>L&rsquo;ann&eacute;e acad&eacute;mique d&eacute;bute en octobre et se termine en juillet. L&rsquo;EGM offre aussi bien des cours de vacances pour tout &acirc;ge tout niveau que des stages de perfectionnement.<br /><br />&laquo; La vie sans musique serait une erreur &raquo; F. Nietzsche</p>');
INSERT INTO `sl_school_translate` (`id`, `school_id`, `locale_id`, `name`, `short_description`, `description`) VALUES
(1092, 183, 5, 'Ecole de Guitare de Madagascar', 'Premier « Conservatoire et de Faculté de Musique de Madagascar, L’EGM, est un établissement d’enseignement musical privé d’envergure nationale. Ouvert en 2005, elle forme depuis des étudiants venus des quatre coins du pays à travers ses 3 départements : MUSIQUE, DANSE et THEATRE.', '<p>Premier &laquo; Conservatoire et de Facult&eacute; de Musique de Madagascar, L&rsquo;EGM, est un &eacute;tablissement d&rsquo;enseignement musical priv&eacute; d&rsquo;envergure nationale. Ouvert en 2005, elle forme depuis des &eacute;tudiants venus des quatre coins du pays &agrave; travers ses 3 d&eacute;partements : MUSIQUE, DANSE et THEATRE.<br /><br />L&rsquo;EGM propose 3 formations bien distinctes:</p>\n<ul>\n<li>la formation acad&eacute;mique/pr&eacute;paratoire (du niveau d&eacute;butant &agrave; niveau Cycle3)</li>\n<li>la formation professionnelle (DEM)</li>\n<li>la formation sup&eacute;rieure/universitaire (DTS-Bac+2, Licence-Bac+3 en cours)</li>\n</ul>\n<p>L&rsquo;ann&eacute;e acad&eacute;mique d&eacute;bute en octobre et se termine en juillet. L&rsquo;EGM offre aussi bien des cours de vacances pour tout &acirc;ge tout niveau que des stages de perfectionnement.<br /><br />&laquo; La vie sans musique serait une erreur &raquo; F. Nietzsche</p>'),
(1093, 183, 6, 'Ecole de Guitare de Madagascar', 'Premier « Conservatoire et de Faculté de Musique de Madagascar, L’EGM, est un établissement d’enseignement musical privé d’envergure nationale. Ouvert en 2005, elle forme depuis des étudiants venus des quatre coins du pays à travers ses 3 départements : MUSIQUE, DANSE et THEATRE.', '<p>Premier &laquo; Conservatoire et de Facult&eacute; de Musique de Madagascar, L&rsquo;EGM, est un &eacute;tablissement d&rsquo;enseignement musical priv&eacute; d&rsquo;envergure nationale. Ouvert en 2005, elle forme depuis des &eacute;tudiants venus des quatre coins du pays &agrave; travers ses 3 d&eacute;partements : MUSIQUE, DANSE et THEATRE.<br /><br />L&rsquo;EGM propose 3 formations bien distinctes:</p>\n<ul>\n<li>la formation acad&eacute;mique/pr&eacute;paratoire (du niveau d&eacute;butant &agrave; niveau Cycle3)</li>\n<li>la formation professionnelle (DEM)</li>\n<li>la formation sup&eacute;rieure/universitaire (DTS-Bac+2, Licence-Bac+3 en cours)</li>\n</ul>\n<p>L&rsquo;ann&eacute;e acad&eacute;mique d&eacute;bute en octobre et se termine en juillet. L&rsquo;EGM offre aussi bien des cours de vacances pour tout &acirc;ge tout niveau que des stages de perfectionnement.<br /><br />&laquo; La vie sans musique serait une erreur &raquo; F. Nietzsche</p>');

-- --------------------------------------------------------

--
-- Structure de la table `sl_type`
--

CREATE TABLE `sl_type` (
  `id` int(11) NOT NULL,
  `default_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `sl_type`
--

INSERT INTO `sl_type` (`id`, `default_name`, `slug`) VALUES
(1, 'public', 'public'),
(2, 'private', 'private');

-- --------------------------------------------------------

--
-- Structure de la table `sl_type_school`
--

CREATE TABLE `sl_type_school` (
  `id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `sl_type_school`
--

INSERT INTO `sl_type_school` (`id`, `school_id`, `type_id`) VALUES
(8, 1, 2),
(9, 2, 2),
(10, 3, 2),
(11, 4, 1),
(12, 5, 1),
(13, 6, 2),
(14, 7, 2),
(15, 8, 2),
(16, 9, 1),
(17, 10, 1),
(18, 11, 1),
(19, 12, 1),
(20, 13, 1),
(21, 14, 1),
(22, 15, 1),
(23, 16, 2),
(24, 17, 2),
(25, 18, 2),
(26, 19, 2),
(27, 20, 1),
(28, 21, 2),
(29, 22, 2),
(30, 23, 2),
(31, 24, 2),
(32, 25, 2),
(33, 26, 2),
(34, 27, 2),
(35, 28, 2),
(36, 29, 2),
(37, 30, 2),
(39, 31, 2),
(40, 32, 2),
(41, 33, 2),
(42, 34, 2),
(43, 35, 2),
(44, 36, 2),
(45, 37, 2),
(46, 38, 2),
(47, 39, 2),
(48, 40, 2),
(49, 41, 2),
(50, 43, 2),
(51, 44, 2),
(53, 46, 2),
(54, 47, 2),
(55, 48, 2),
(56, 49, 2),
(57, 50, 2),
(58, 51, 2),
(59, 52, 2),
(60, 53, 2),
(61, 54, 2),
(62, 55, 2),
(63, 56, 2),
(64, 57, 2),
(65, 58, 2),
(66, 59, 2),
(67, 60, 2),
(68, 61, 2),
(69, 62, 2),
(70, 63, 2),
(71, 64, 2),
(72, 65, 2),
(73, 66, 2),
(74, 67, 2),
(75, 68, 2),
(76, 69, 2),
(77, 70, 2),
(78, 71, 2),
(79, 72, 2),
(80, 73, 2),
(81, 74, 2),
(82, 75, 2),
(83, 76, 2),
(84, 77, 2),
(85, 78, 2),
(86, 79, 2),
(87, 80, 2),
(88, 81, 2),
(89, 82, 2),
(90, 83, 2),
(91, 84, 2),
(92, 85, 2),
(93, 86, 2),
(94, 87, 2),
(95, 88, 2),
(96, 89, 2),
(97, 90, 2),
(98, 91, 2),
(99, 92, 2),
(100, 93, 2),
(101, 94, 2),
(102, 95, 2),
(103, 96, 2),
(104, 97, 2),
(105, 98, 2),
(106, 99, 2),
(107, 100, 2),
(108, 101, 2),
(109, 102, 2),
(110, 103, 2),
(111, 104, 2),
(112, 105, 2),
(113, 106, 2),
(114, 107, 2),
(115, 108, 2),
(116, 109, 2),
(117, 110, 2),
(118, 111, 2),
(119, 112, 2),
(120, 113, 2),
(121, 114, 2),
(122, 115, 2),
(123, 116, 2),
(124, 117, 2),
(125, 118, 2),
(127, 120, 2),
(128, 121, 2),
(129, 122, 2),
(131, 124, 2),
(132, 125, 2),
(133, 126, 2),
(135, 128, 2),
(136, 129, 2),
(137, 130, 2),
(138, 131, 2),
(139, 132, 2),
(140, 133, 2),
(141, 134, 2),
(142, 135, 2),
(143, 136, 2),
(144, 137, 2),
(145, 138, 2),
(146, 139, 2),
(147, 140, 2),
(148, 141, 2),
(149, 142, 2),
(150, 143, 2),
(151, 144, 2),
(152, 145, 2),
(154, 147, 2),
(155, 148, 2),
(156, 149, 2),
(157, 150, 2),
(158, 151, 2),
(159, 152, 2),
(160, 153, 2),
(161, 154, 2),
(163, 45, 1),
(164, 155, 2),
(165, 159, 2),
(166, 160, 2),
(167, 156, 2),
(169, 157, 2),
(170, 158, 2),
(171, 161, 2),
(172, 162, 2),
(173, 163, 2),
(176, 164, 2),
(177, 165, 2),
(180, 167, 2),
(181, 168, 2),
(182, 166, 2),
(183, 169, 2),
(184, 170, 2),
(185, 119, 2),
(186, 171, 2),
(187, 172, 2),
(188, 173, 2),
(189, 174, 2),
(190, 127, 2),
(191, 175, 2),
(192, 176, 2),
(193, 177, 2),
(198, 178, 2),
(200, 179, 2),
(201, 180, 2),
(202, 181, 2),
(205, 182, 2),
(206, 146, 2),
(208, 123, 2),
(209, 183, 2);

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
(30, 1, 'swag.jpg', '15b5f19c93c27f4ba3d829ad8c30cf7bcda947b4.jpeg', 'swag.jpg', 0),
(31, 1, 'Great-FC-Barcelona-Neymar-Kit-Number-FC-Barcelona-Wallpaper-HD-2017-DJF9.png', '22688d149bfe9adddbc08186bb947c367eabd6c0.png', 'Great-FC-Barcelona-Neymar-Kit-Number-FC-Barcelona-Wallpaper-HD-2017-DJF9.png', 0),
(32, 1, 'inspnmad-TSIDIDY-2-9.jpg', 'cf09ea2457cd59145e1be0eebf3a2d1059fc3cef.jpeg', 'inspnmad-TSIDIDY-2-9.jpg', 0),
(33, 1, 'Great-FC-Barcelona-Neymar-Kit-Number-FC-Barcelona-Wallpaper-HD-2017-DJF9.png', 'df6d6f615d87eb95c61fed1c7639ecba09e6b527.png', 'Great-FC-Barcelona-Neymar-Kit-Number-FC-Barcelona-Wallpaper-HD-2017-DJF9.png', 0),
(34, 1, 'Great-FC-Barcelona-Neymar-Kit-Number-FC-Barcelona-Wallpaper-HD-2017-DJF9.png', '9e4501642bebd652f91ceff0d92282e55698681f.png', 'Great-FC-Barcelona-Neymar-Kit-Number-FC-Barcelona-Wallpaper-HD-2017-DJF9.png', 0),
(35, 1, 'fianara.jpg', '10e2f637b483d7c2760542785572b0d6ef6d4156.jpeg', 'fianara.jpg', 0),
(36, 1, 'tanety2.png', '604e11db52110ec5407de37f1076cb4ffd9a3c37.png', 'tanety2.png', 0),
(37, 1, 'inspnmad-TSIDIDY-2-9.jpg', 'f01e6be9d361cb467f15fcc15ca5f69f0944daad.jpeg', 'inspnmad-TSIDIDY-2-9.jpg', 0),
(38, 1, 'Great-FC-Barcelona-Neymar-Kit-Number-FC-Barcelona-Wallpaper-HD-2017-DJF9.png', '21502cb796d1f7fc8dba18a839a28995f8c1933c.png', 'Great-FC-Barcelona-Neymar-Kit-Number-FC-Barcelona-Wallpaper-HD-2017-DJF9.png', 0),
(39, 1, 'enmglogo.jpg', '8f197ed285f2129391ab6368a5ea74f2994b01ad.jpeg', 'enmglogo.jpg', 1);

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
  `sex` int(11) NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `ur_user`
--

INSERT INTO `ur_user` (`id`, `locale_id`, `username`, `email`, `password`, `salt`, `roles`, `location`, `name`, `biography`, `sex`, `token`) VALUES
(1, 1, 'frank-anthony', 'user1@oio.com', 'Rm5EXn+/rs1DcjgIZk5AFf5+Lzpv//JwBjmn9rFjEqBnGQQEt/gL2KZnpD2dUX+ku1VVAlThH/DqKjdZeE823w==', '10e5f90d7339069fc348e82591d36cbd', 'a:1:{i:0;s:10:"ROLE_ADMIN";}', 'Antananarivo', 'Frank anthony', 'Excogitatum est super his, ut homines quidam ignoti, vilitate ipsa parum cavendi ad colligendos rumores per Antiochiae latera cuncta destinarentur relaturi quae audirent. hi peragranter et dissimulanter honoratorum circulis adsistendo pervadendoque divites domus egentium habitu quicquid noscere poterant vel audire latenter intromissi per posticas in regiam nuntiabant, id observantes conspiratione concordi, ut fingerent quaedam et cognita duplicarent in peius, laudes vero supprimerent Caesaris, quas invitis conpluribus formido malorum inpendentium exprimebat.\n\nti, vilitate ipsa parum cavendi ad colligendos rumores per Antiochiae latera cuncta destinarentur relaturi quae audirent. hi peragranter et dissimulanter honoratorum circulis ads', 1, 'b7ILgAuPQ2cRFOkYWMOKog8he6h9aFHtqLmPKMKjjwPxSl3zD6o0j8kX8hP0NSmf'),
(2, 2, 'user2', 'user2.fortunat@boot.com', 'LcI4TKVPhbdheLgGK7jygbUhMZcHpg1cRZSazjEq1CogQlx/E+iBwqNwBNLWCqV0CDeSJ3OW2uvXF+zAPaPPqw==', '10e5f90d7339069fc348e82591d36cbd', 'a:1:{i:0;s:10:"ROLE_ADMIN";}', 'location', 'scelerisque quis eget felis', 'An API endpoint "defines the address or connection point to a Web service. It is typically represented by a simple HTTP URL string". So basically, the endpoint URL is the URL of the web service that are you attempting to interact with.', 1, NULL),
(3, 1, 'user3', 'user3@boot.comk', 'wPscR9RyDzUt/1RawB/8cOdGt7CmIABQBSGcZG+et3V7jMXlywRMtMqBQ0djPX3FvcsZ+YTzgL8JXi5lGknWWA==', '10e5f90d7339069fc348e82591d36cbd', 'a:1:{i:0;s:10:"ROLE_ADMIN";}', 'Paris, France', 'Phasellus finibus volutpat', 'J''ai un fichier css qui ne fonctionne qu''à moitier. ... Float, fonctionne parfaitement mais font-style-type pas. .... d''aide concernant le code par MP ni par mail, le forum est là pour çaJ''ai un fichier css qui ne fonctionne qu''à moitier. ... Float, fonctionne parfaitement mais font-style-type pas. .... d''aide concernant le code par MP ni par mail, le forum est là pour ça', 1, NULL),
(4, 1, 'user4', 'user4@boot.com', 'kHi9aNEtzraNe6IGuqFMdJQ9TSU8TR3BKrbJs+ZVNfbAdOgxdSjmyHrB1YrD9ZxKa3wApwEySN8lAqRZvWiSNQ==', '10e5f90d7339069fc348e82591d36cbd', 'a:1:{i:0;s:10:"ROLE_ADMIN";}', 'Ambatondrazaka', 'Jean Ranaivoarisoa', 'Vestibulum vitae accumsan turpis, ut sollicitudin ex. Cras bibendum bibendum pharetra. Vestibulum sed venenatis justo, sit amet feugiat lectus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed in iaculis leo. Integer vel diam iaculis, tincidunt nibh vitae, maximus nulla. Suspendisse at tincidunt elit. Maecenas mattis neque vehicula justo ornare dictum a vel risus.', 1, 'SI8yLnkGbUicYeCPtQnMwHaMsg638wKiUWdJBt66zBuBEhYYb0Ep2I7EwTtTvviS'),
(5, 2, 'user5', 'user5lauk@fr', 'xj4ORdkmhShk/d8x9orJiYUvtzBsuiFjJdmqsPW/OjTWDxH2YaC2NQQr13U6BfI/UDGxpmlqdr3w7hZSoNMS0Q==', 'ab4a12557c97c9f8b9edb18c4a958d62', 'a:0:{}', NULL, 'Rick Fullname', NULL, 1, NULL),
(6, 2, 'user6', 'user6@test.com', 'qyv7+4HEZZdA1RIKJB8OjDjUlTK8qH5oYUe6qwdHd7BItyyMNQn6TEn6g+Na6ytRa2O0+g5ipBsdYIYnemM0DA==', 'e2ed1681e1c2406d7993e5483d3440ee', 'a:0:{}', 'Antananarivo, Madagascar', 'Randrianilaina Modar', NULL, 1, NULL),
(7, 2, 'user7', 'user7@test.com', 'xlZcWUrXYj0KR5wHOrcFY5JWhJjhDGbx8Js24K2zM6EA9ZuJs+cOIV8CmSC5RbCrfRQt6CHl/rDCduPZW1v/0Q==', 'd51a1caa9758eb1c7f02ab99358a9bfe', 'a:0:{}', NULL, 'Ut laoreet malesuada', 'Phasellus vitae lorem id felis congue accumsan. Vestibulum dapibus nisl id lectus fringilla, quis semper eros volutpat. Cras mollis nec nibh vel lobortis. Phasellus nec ex vel dui sagittis ultricies id nec nulla. Fusce vulputate erat ligula, non imperdiet ante aliquam non. Pellentesque tristique, sapien nec dignissim porta, libero eros porta nulla, tincidunt facilisis risus ligula sed orci. Proin augue augue, iaculis et lorem sit amet, mollis rhoncus augue. Quisque posuere libero eget gravida imperdiet. Proin venenatis non massa vitae sagittis. Nunc nulla diam, sodales nec elit vitae, dignissim faucibus orci. Morbi congue mollis tellus non viverra.', 1, NULL),
(8, 2, 'user9', 'user9@test.com', 'w7VBKVNGUJYhhPgXW6lACvkSQuwIuA/5eeI/cX4Z/CsixkrUh+BKK5EcP3w3y6W2adOpq3Z+GhHGDGt2gBeX5g==', '204b4786d532eb7ee0c9d21c86becbf7', 'a:0:{}', 'Antananarivo, Madagascar', 'Tricia Rasoarivelo', NULL, 1, NULL),
(9, 2, 'user10', 'user10@test.fr', 'yYFbQVO55Ft3gfemf9/mLuZANzYQN60ZFCIWJjfzXl7flcp3a8o6j7lJsASQGtM+1yPUnh4N3Xyh+Q4ibS+YZg==', '1080a96af79c023968236b319f2a8f8f', 'a:0:{}', NULL, 'varius malesuada', NULL, 1, NULL),
(10, 2, 'user11', 'user11@test.mg', 'BkI0xzi1fpAn1FqO83dSXhWXBIduvSpL/2fi24ER24/iXQzyggvZBuloeT/Wdhxngud5UByIDAKe+PsJBLX/ow==', '4b053fa99ffc4a1cc9700bf265786a5c', 'a:0:{}', NULL, 'varius malesuada varius malesuada', 'Cras quis velit sed ipsum blandit sollicitudin. Etiam vel congue mi, non fermentum libero. Donec volutpat lobortis nisl non cursus. Suspendisse nec pharetra ex. Pellentesque et urna aliquet, sagittis justo ut, pellentesque justo. Aenean dignissim mollis tellus non aliquam. Donec nec orci in tortor elementum congue in ut odio. Ut laoreet malesuada quam nec elementum. Vivamus congue magna erat, vel sodales nulla tincidunt nec. Etiam lacinia ut libero nec tempus. Donec convallis tortor eget dictum rutrum. Mauris faucibus nisi eu tempor hendrerit. Quisque feugiat massa sem, non condimentum sem posuere at. Sed consequat placerat est, ac feugiat tortor scelerisque in. Aenean eget felis non massa sollicitudin tristique quis non nisl.', 1, NULL),
(11, 2, 'user8', 'user8@test.gr', 'zyMp6WTgNlbrnWCpTbKirngyf0LyV9A3v1M5XuRJGkcdwugghBO1tHXFDhIjN+Fn4h88o2tBTYBJHZ6cgi58EA==', 'fb7ca5cadd402273e1cefea70896a0d6', 'a:0:{}', 'Toamasina, Madagasikara', 'Donec arcu tortor', 'misaotra atsika rehetra; vita soama-tsara ny dejeuner dansante izay nokarakaraina. mankasitra indrindra t@ ezakin''ny tsirairay :)\ntohizo hatrany ny ezaka', 1, NULL),
(12, 2, 'user12', 'user12@test.fr', 'pQEY7AtTOeW5+xvwwXi3AwKhtOtgzZS28d7y+MXR7EEdE2M1Pfta1LIiH76YH431KosKgWthrNcm7q9GZizJCQ==', '7e80fa1c958dbea71aa8072a9b0aada7', 'a:0:{}', NULL, 'Sed posuere nisl sed', NULL, 2, NULL),
(13, 2, 'user13', 'user13@test.fr', 'hpWkc9h3xB9Rfwi4Sja5rWyiJqXL96sXaOW7cRR5UnQkHAn9OzZK1+PF9gKbL1b69XKN3jF2fYscTerEl07L+g==', '9f2330999f9fc22abfce99f245c2f412', 'a:0:{}', NULL, 'Nulla tempor auctor', NULL, 3, NULL),
(14, 2, 'mick', 'micka232@yahoo.fr', 'aCX0rZbn8egzl/1LxgmpiEKxZQg0qosKhPJ88atU6BsrKWLpHXDuEAVFbDKW5QF222ZB4VNHHFUvWN5hwrkqvg==', '55fd83caa943fa0235caed77e2807b90', 'a:0:{}', 'Antananarivo, Madagascar', 'Mickael Andriantiana André', 'J''aime ce que tout le monde déteste parceque l''amour véritable c''est celui que tout le monde déteste...', 1, NULL),
(15, 1, 'nom-test', 'nomtest@dfd.df', 'aCWFxrV1Sfn6YgIZmmLB+5HRdXXpgnEQFDfPViRe10VSAEdXo20fXzIcTdo7cQTHukz4YFLXsTSF6BjusUn7QA==', 'fd11fe28fb69d23162d26bb3f29ba0d6', 'a:0:{}', NULL, 'nom test', NULL, 2, NULL),
(16, 1, 'koto-jean', 'aaa@aa.aa', 'HB8EBI6ILus77mDdXTol5+Sd4FzE/r1Uil+WI1XgUugdQeXbbLuWlV1Fl0W8kdmnclrBtq9rIpuTFSu7X9A4uw==', '9ab6835cc3188fab3a23a6cf270b5895', 'a:0:{}', NULL, 'koto jean', NULL, 1, NULL),
(17, 1, 'mananteasoa-andry', 'ma@gmail.com', 'GWH0y1QnaZR1DLUz5HridxwhC96hXF8tTUE1eGzyKXVgYiBENYEi/4iIKvo2Xc6sBZjMNWL/VCxuZTsEoND2Jw==', '67db495feeeef872011e7070f8fc6238', 'a:0:{}', NULL, 'Mananteasoa Andry', NULL, 1, NULL),
(18, 1, 'compte-test', 'test@oio.com', 'jwq8RWDG+CsLJhNdWJjgCtbhZjuC8avDQhOWvTsrxJjgGRfOrU/ylxlohnZUhbesM5ivfd9LrmyLeDI279zKtQ==', '65880f1ccef537c3f58a7305e94bcf44', 'a:0:{}', NULL, 'Compte test', NULL, 1, NULL),
(19, 1, 'randrianomentsoa-andy', 'andy@oio.com', 'GEke5YuIAU2cQ/8K9NtdNrO6RndsClj95KJ3UP1aENULso2p0+65DzkM1nDSSJ4DqrucH2+IL98u9Z5Sc0r3IA==', '16e45eb9b3277659c00c6d46c1d03bb5', 'a:0:{}', NULL, 'Randrianomentsoa Andy', NULL, 1, 'JgOiSjqnzjJlrY3DywffxGEDrF6MTcX7Yu2FhgIRUKOFsDGAZaby84C3YxS26ig0'),
(20, 1, 'nirina-onisoa', 'nirina@oio.com', 'bKU0d5jR+yTaHN+4HyOWcGd1pUojg+Z8DZ6NZP7KsJxS3OttX+nTZJsz93N+ynVRKLm9ds/WlrR75HH8XSuE/Q==', 'c9a8aba0fe8efe57a7c3d7e6a73cc328', 'a:0:{}', NULL, 'Nirina Onisoa', NULL, 2, NULL),
(21, 1, 'nom-test-2', 'nom@oio.com', 'xLu55Jq7kboOPuOefzCd07BeiQYvErUGi7KIeeFwf4pXggetgpnN4Nv+BSy9k0OgWa4Jxky4GyyLTZ+7oZ9slA==', '8b20a4e10c0a0cdbed191c00d725c401', 'a:0:{}', NULL, 'nom test 2', NULL, 1, NULL),
(22, 1, 'espa-vontovorona', 'espa@gmail.com', 'HiKtlJZ190Lr855qt9A74yd1DzSYNvMgzJTK3Gd+fWO4onL83KSsPfWXAghrvx2vH2UCfXJF76YsiojhqobM8Q==', '94c4acd1196d7978f342e4558235f51d', 'a:0:{}', NULL, 'Espa Vontovorona', NULL, 1, NULL),
(23, 1, 'quia-montius-inter-dilanc', 'test2@oio.com', 'ofgxHBTMAX5rlMaAp/erfMowT0Vz60hor4d4VTEgy6wDD189A3qh9Z0v7dKjWhXzxMLiPlPVtVjXwHcEsaaZNw==', 'bc5c04e0f8a6aed9685b23f9a6eb2c22', 'a:0:{}', NULL, 'quia Montius inter dilanc', NULL, 1, NULL),
(24, 1, 'test3-oio-com', 'test3@oio.com', 'sr4U0r37y46cRT0qv/6P20aTQyAO0+6h6hKfdACUZck7HrvN0WGXyINKO0EN5ilWoYhmiKRhlLuhRzQ1mdFxOA==', '518865e05e352b76866c690fdd1fecdc', 'a:0:{}', NULL, 'test3@oio.com', NULL, 1, NULL),
(25, 1, 'test4-oio-com', 'test4@oio.com', 'wNscO/WVud0zxpJk26FDb4fbRqG1Z/cExNV70idcdVWVPO8syKA0zrzADLx4pDEMqVXkTaVW2gOoOqe+8jlPQQ==', 'df12cdb7f420fbc02ef0d3930ce8afac', 'a:0:{}', NULL, 'test4@oio.com', NULL, 1, NULL),
(26, 1, 'test5-oio-com', 'test5@oio.com', 'gudUZKh7156AFxiTHjZoz850lk0No7W0T8ENo32xjj7apCCkjqasgxk8AD4CWpgLfoBuIaa5g5/SgaD5Lb655w==', '64f1f850aed954a380408b948c535af0', 'a:0:{}', NULL, 'test5@oio.com', NULL, 1, 'xhfdUuAPMZeBCSnmoJLszEBJ7eCwwz0GIgvycolYWzdinSllwTtuNJNzdZ2UdLpm'),
(27, 1, 'test6-oio-com', 'test6@oio.com', 'ziT8IAGciLpOJxXfPcH9xS52RSHc0Ii1dvVOXIf6bDvLU0xiWZlJs73dn46m6N8Spymz1rbZzFTlUTZIgF94zA==', '68cbc7078937da739b9a63bf72eec1b2', 'a:0:{}', NULL, 'test6@oio.com', NULL, 2, NULL);

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
-- Index pour la table `sl_type`
--
ALTER TABLE `sl_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_3B6270A9989D9B62` (`slug`);

--
-- Index pour la table `sl_type_school`
--
ALTER TABLE `sl_type_school`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_2CDD49EEC32A47EE` (`school_id`),
  ADD KEY `IDX_2CDD49EEC54C8C93` (`type_id`);

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
  ADD UNIQUE KEY `UNIQ_7342DD775F37A13B` (`token`),
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT pour la table `bg_category_translate`
--
ALTER TABLE `bg_category_translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;
--
-- AUTO_INCREMENT pour la table `bg_post`
--
ALTER TABLE `bg_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT pour la table `bg_post_illustration`
--
ALTER TABLE `bg_post_illustration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT pour la table `bg_post_translate`
--
ALTER TABLE `bg_post_translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=211;
--
-- AUTO_INCREMENT pour la table `et_event`
--
ALTER TABLE `et_event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `fm_message`
--
ALTER TABLE `fm_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;
--
-- AUTO_INCREMENT pour la table `fm_subject`
--
ALTER TABLE `fm_subject`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;
--
-- AUTO_INCREMENT pour la table `pm_contact`
--
ALTER TABLE `pm_contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT pour la table `pm_parameter`
--
ALTER TABLE `pm_parameter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `pm_post_school`
--
ALTER TABLE `pm_post_school`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;
--
-- AUTO_INCREMENT pour la table `pm_view`
--
ALTER TABLE `pm_view`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=490;
--
-- AUTO_INCREMENT pour la table `sl_category`
--
ALTER TABLE `sl_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT pour la table `sl_category_school`
--
ALTER TABLE `sl_category_school`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=447;
--
-- AUTO_INCREMENT pour la table `sl_category_translate`
--
ALTER TABLE `sl_category_translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=253;
--
-- AUTO_INCREMENT pour la table `sl_cover`
--
ALTER TABLE `sl_cover`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;
--
-- AUTO_INCREMENT pour la table `sl_evaluation`
--
ALTER TABLE `sl_evaluation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;
--
-- AUTO_INCREMENT pour la table `sl_field`
--
ALTER TABLE `sl_field`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;
--
-- AUTO_INCREMENT pour la table `sl_field_translate`
--
ALTER TABLE `sl_field_translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=734;
--
-- AUTO_INCREMENT pour la table `sl_logo`
--
ALTER TABLE `sl_logo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;
--
-- AUTO_INCREMENT pour la table `sl_school`
--
ALTER TABLE `sl_school`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=184;
--
-- AUTO_INCREMENT pour la table `sl_school_admin`
--
ALTER TABLE `sl_school_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT pour la table `sl_school_contact`
--
ALTER TABLE `sl_school_contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT pour la table `sl_school_contact_translate`
--
ALTER TABLE `sl_school_contact_translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT pour la table `sl_school_of_the_day`
--
ALTER TABLE `sl_school_of_the_day`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT pour la table `sl_school_subscription`
--
ALTER TABLE `sl_school_subscription`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT pour la table `sl_school_translate`
--
ALTER TABLE `sl_school_translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1094;
--
-- AUTO_INCREMENT pour la table `sl_type`
--
ALTER TABLE `sl_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `sl_type_school`
--
ALTER TABLE `sl_type_school`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=210;
--
-- AUTO_INCREMENT pour la table `ur_avatar`
--
ALTER TABLE `ur_avatar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT pour la table `ur_user`
--
ALTER TABLE `ur_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
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
-- Contraintes pour la table `sl_type_school`
--
ALTER TABLE `sl_type_school`
  ADD CONSTRAINT `FK_2CDD49EEC32A47EE` FOREIGN KEY (`school_id`) REFERENCES `sl_school` (`id`),
  ADD CONSTRAINT `FK_2CDD49EEC54C8C93` FOREIGN KEY (`type_id`) REFERENCES `sl_type` (`id`);

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
