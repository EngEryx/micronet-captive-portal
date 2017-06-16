-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 28, 2017 at 01:02 AM
-- Server version: 5.7.17-0ubuntu0.16.04.1
-- PHP Version: 7.0.13-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eryx_labs`
--
CREATE DATABASE IF NOT EXISTS `eryx_labs` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `eryx_labs`;

-- --------------------------------------------------------

--
-- Table structure for table `auto_contacts`
--

CREATE TABLE `auto_contacts` (
  `id` char(36) NOT NULL,
  `auto_mac_id` char(36) NOT NULL DEFAULT '',
  `ip_address` varchar(15) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auto_groups`
--

CREATE TABLE `auto_groups` (
  `id` char(36) NOT NULL,
  `name` varchar(80) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auto_groups`
--

INSERT INTO `auto_groups` (`id`, `name`, `created`, `modified`) VALUES
('4b41de4a-6048-407c-b2a0-19dda509ff00', 'Network', '2010-01-04 14:25:46', '2010-01-04 14:25:46'),
('4b42e302-a4e8-4d9d-8d35-3b96a509ff00', 'OpenVPN', '2010-01-05 08:58:10', '2010-01-05 08:58:10'),
('4b444e2a-e32c-4f34-90b7-2252a509ff00', 'Wireless', '2010-01-06 10:47:38', '2010-01-06 10:47:38');

-- --------------------------------------------------------

--
-- Table structure for table `auto_macs`
--

CREATE TABLE `auto_macs` (
  `id` char(36) NOT NULL,
  `name` varchar(17) NOT NULL,
  `contact_ip` varchar(17) NOT NULL DEFAULT '',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auto_setups`
--

CREATE TABLE `auto_setups` (
  `id` char(36) NOT NULL,
  `auto_group_id` char(36) NOT NULL DEFAULT '',
  `auto_mac_id` char(36) NOT NULL DEFAULT '',
  `description` varchar(80) NOT NULL,
  `value` varchar(2000) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `batches`
--

CREATE TABLE `batches` (
  `id` char(36) NOT NULL,
  `name` varchar(40) NOT NULL,
  `realm_id` char(36) NOT NULL DEFAULT '',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `batches_vouchers`
--

CREATE TABLE `batches_vouchers` (
  `batch_id` char(36) NOT NULL,
  `voucher_id` char(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `billingplan`
--

CREATE TABLE `billingplan` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `amount` int(255) NOT NULL,
  `valid_for` int(11) DEFAULT NULL,
  `price` float NOT NULL,
  `IdleTimeout` int(255) NOT NULL,
  `simultaneous` int(10) NOT NULL,
  `redirect_url` varchar(255) NOT NULL,
  `bw_upload` int(255) NOT NULL,
  `bw_download` int(255) NOT NULL,
  `created_by` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `billingplan`
--

INSERT INTO `billingplan` (`id`, `name`, `type`, `amount`, `valid_for`, `price`, `IdleTimeout`, `simultaneous`, `redirect_url`, `bw_upload`, `bw_download`, `created_by`) VALUES
(11, 'Atomic', 'packet', 1000, 7, 100, 10, 0, 'www.eryx.co.ke', 512000, 1024000, 'Admin Eric'),
(12, 'UnLiminet', 'time', 1440, 7, 50, 10, 0, 'www.eryx.co.ke', 2048000, 2048000, 'Admin Eric'),
(13, 'Hustler Package', 'packets', 1500, 7, 50, 10, 0, 'www.eryx.co.ke', 2048000, 2048000, 'Admin Eric'),
(14, 'HomeUse', 'time', 10080, 7, 50, 10, 0, 'www.eryx.co.ke', 2048000, 2048000, 'Admin Eric'),
(15, 'Light One', 'time', 10, 1, 20, 10, 0, 'www.eryx.co.ke', 2048000, 2048000, 'Admin Eric'),
(16, 'Demo One', 'time', 4, 1, 20, 1, 0, 'http://www.eryx.co.ke', 2048000, 2048000, 'Admin'),
(17, 'Demo Two', 'time', 5, 1, 22, 1, 0, 'http://www.eryx.co.ke', 2048000, 2048000, 'Admin'),
(18, 'Onemb', 'packet', 1, 1, 8, 2, 0, 'http://www.eryx.co.ke', 512000, 512000, 'Admin'),
(19, '3G', 'time', 200, 2, 500, 5, 0, '', 512000, 2048000, 'Eric'),
(20, 'FreeWIFI', 'time', 2, 1, 10, 2, 0, '', 512000, 512000, 'Admin'),
(21, 'Boda', 'time', 2, 1, 10, 10, 0, '', 512000, 512000, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `checks`
--

CREATE TABLE `checks` (
  `id` char(36) NOT NULL,
  `name` varchar(40) NOT NULL,
  `value` varchar(40) NOT NULL DEFAULT '',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `user_agent` varchar(50) NOT NULL,
  `last_activity` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `session_data` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ci_sessions`
--

INSERT INTO `ci_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `session_data`) VALUES
('8e9209d9d9607ab14e85ea8ba27dc52c', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36', 1478002795, 'a:9:{s:2:"id";s:1:"1";s:9:"user_name";s:5:"admin";s:10:"country_id";s:1:"0";s:5:"email";s:18:"root@localhost.com";s:4:"role";s:10:"superadmin";s:10:"last_visit";s:19:"2016-11-01 09:01:25";s:7:"created";s:19:"2016-11-01 09:01:25";s:8:"modified";s:19:"0000-00-00 00:00:00";s:6:"search";N;}'),
('2595b4d5047093955306e641e23adeed', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36', 1478907423, 'a:8:{s:2:"id";s:1:"1";s:9:"user_name";s:5:"admin";s:10:"country_id";s:1:"0";s:5:"email";s:18:"root@localhost.com";s:4:"role";s:10:"superadmin";s:10:"last_visit";s:19:"2016-11-01 12:30:41";s:7:"created";s:19:"2016-11-01 12:30:41";s:8:"modified";s:19:"0000-00-00 00:00:00";}'),
('12f902ad2598216b6aa76d149cb5d2bd', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36', 1478907396, NULL),
('71982e2e1920214241d5697892c00295', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36', 1478941651, 'a:0:{}'),
('8e9feb245fc93ba0654bf31da8c72ddb', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36', 1479229559, 'a:3:{s:24:"flash:old:requested_page";s:0:"";s:22:"flash:old:flashMessage";s:85:"You do not have the credentials to access this reserved area, please login and retry.";s:24:"flash:new:requested_page";s:0:"";}'),
('a32adce9d6c39da376465029986d64d7', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36', 1479587716, 'a:9:{s:2:"id";s:1:"1";s:9:"user_name";s:5:"admin";s:10:"country_id";s:1:"0";s:5:"email";s:18:"root@localhost.com";s:4:"role";s:10:"superadmin";s:10:"last_visit";s:19:"2016-11-12 02:36:50";s:7:"created";s:19:"2016-11-12 02:36:50";s:8:"modified";s:19:"0000-00-00 00:00:00";s:22:"flash:old:flashMessage";s:55:"Cannot Create Invoice, this account has never been used";}'),
('253d5046b9b8761111359a7a4f697f86', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36', 1479587616, NULL),
('ab175a3f03ba9131044b927227d6997b', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36', 1479669070, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `eryx_news`
--

CREATE TABLE `eryx_news` (
  `id` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `slug` varchar(128) NOT NULL,
  `text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `eryx_news`
--

INSERT INTO `eryx_news` (`id`, `title`, `slug`, `text`) VALUES
(1, 'The Erx Innovation', 'eryx_inno', 'The Eryx Innovation has really helped in shaping our world into a more comfortable place that lets us speak our minds.'),
(2, 'The Erx Innovation', 'eryx_ke', 'The Eryx Innovation has really helped in shaping our world into a more comfortable place that lets us speak our minds.'),
(3, 'The Erx-KE Innovation', 'innovation', 'The Eryx Innovation has really helped in shaping our world into a more comfortable place that lets us speak our minds.'),
(4, 'Eric Kirima Innovation', 'innovation', 'The Eryx Innovation has really helped in shaping our world into a more comfortable place that lets us speak our minds.'),
(5, 'Kever Makes it Code Igniter', 'kever-makes-it-code-igniter', 'Today i felt very privilidged to come across a php framework known as Code Igniter'),
(6, 'Eric Invents HOT', 'eric-invents-hot', 'HOT is a php library created by eric to handle error pages with any php framework.'),
(7, 'Eric Invents HOT', 'eric-invents-hot', 'HOT is a php library created by eric to handle error pages with any php framework.');

-- --------------------------------------------------------

--
-- Table structure for table `expiration_account`
--

CREATE TABLE `expiration_account` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `expiration_plan` varchar(255) NOT NULL,
  `created_by` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `expirationplan`
--

CREATE TABLE `expirationplan` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `price` float NOT NULL DEFAULT '0',
  `amount` varchar(255) NOT NULL,
  `bw_download` int(10) DEFAULT NULL,
  `bw_upload` int(10) DEFAULT NULL,
  `idletimeout` int(10) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fa_country`
--

CREATE TABLE `fa_country` (
  `id` int(11) NOT NULL,
  `iso` char(2) NOT NULL,
  `name` varchar(80) NOT NULL,
  `iso3` char(3) DEFAULT NULL,
  `numcode` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fa_country`
--

INSERT INTO `fa_country` (`id`, `iso`, `name`, `iso3`, `numcode`) VALUES
(1, 'AF', 'Afghanistan', 'AFG', 4),
(2, 'AL', 'Albania', 'ALB', 8),
(3, 'DZ', 'Algeria', 'DZA', 12),
(4, 'AS', 'American Samoa', 'ASM', 16),
(5, 'AD', 'Andorra', 'AND', 20),
(6, 'AO', 'Angola', 'AGO', 24),
(7, 'AI', 'Anguilla', 'AIA', 660),
(8, 'AQ', 'Antarctica', NULL, NULL),
(9, 'AG', 'Antigua and Barbuda', 'ATG', 28),
(10, 'AR', 'Argentina', 'ARG', 32),
(11, 'AM', 'Armenia', 'ARM', 51),
(12, 'AW', 'Aruba', 'ABW', 533),
(13, 'AU', 'Australia', 'AUS', 36),
(14, 'AT', 'Austria', 'AUT', 40),
(15, 'AZ', 'Azerbaijan', 'AZE', 31),
(16, 'BS', 'Bahamas', 'BHS', 44),
(17, 'BH', 'Bahrain', 'BHR', 48),
(18, 'BD', 'Bangladesh', 'BGD', 50),
(19, 'BB', 'Barbados', 'BRB', 52),
(20, 'BY', 'Belarus', 'BLR', 112),
(21, 'BE', 'Belgium', 'BEL', 56),
(22, 'BZ', 'Belize', 'BLZ', 84),
(23, 'BJ', 'Benin', 'BEN', 204),
(24, 'BM', 'Bermuda', 'BMU', 60),
(25, 'BT', 'Bhutan', 'BTN', 64),
(26, 'BO', 'Bolivia', 'BOL', 68),
(27, 'BA', 'Bosnia and Herzegovina', 'BIH', 70),
(28, 'BW', 'Botswana', 'BWA', 72),
(29, 'BV', 'Bouvet Island', NULL, NULL),
(30, 'BR', 'Brazil', 'BRA', 76),
(31, 'IO', 'British Indian Ocean Territory', NULL, NULL),
(32, 'BN', 'Brunei Darussalam', 'BRN', 96),
(33, 'BG', 'Bulgaria', 'BGR', 100),
(34, 'BF', 'Burkina Faso', 'BFA', 854),
(35, 'BI', 'Burundi', 'BDI', 108),
(36, 'KH', 'Cambodia', 'KHM', 116),
(37, 'CM', 'Cameroon', 'CMR', 120),
(38, 'CA', 'Canada', 'CAN', 124),
(39, 'CV', 'Cape Verde', 'CPV', 132),
(40, 'KY', 'Cayman Islands', 'CYM', 136),
(41, 'CF', 'Central African Republic', 'CAF', 140),
(42, 'TD', 'Chad', 'TCD', 148),
(43, 'CL', 'Chile', 'CHL', 152),
(44, 'CN', 'China', 'CHN', 156),
(45, 'CX', 'Christmas Island', NULL, NULL),
(46, 'CC', 'Cocos (Keeling) Islands', NULL, NULL),
(47, 'CO', 'Colombia', 'COL', 170),
(48, 'KM', 'Comoros', 'COM', 174),
(49, 'CG', 'Congo', 'COG', 178),
(50, 'CD', 'Congo, the Democratic Republic of the', 'COD', 180),
(51, 'CK', 'Cook Islands', 'COK', 184),
(52, 'CR', 'Costa Rica', 'CRI', 188),
(53, 'CI', 'Cote D\'Ivoire', 'CIV', 384),
(54, 'HR', 'Croatia', 'HRV', 191),
(55, 'CU', 'Cuba', 'CUB', 192),
(56, 'CY', 'Cyprus', 'CYP', 196),
(57, 'CZ', 'Czech Republic', 'CZE', 203),
(58, 'DK', 'Denmark', 'DNK', 208),
(59, 'DJ', 'Djibouti', 'DJI', 262),
(60, 'DM', 'Dominica', 'DMA', 212),
(61, 'DO', 'Dominican Republic', 'DOM', 214),
(62, 'EC', 'Ecuador', 'ECU', 218),
(63, 'EG', 'Egypt', 'EGY', 818),
(64, 'SV', 'El Salvador', 'SLV', 222),
(65, 'GQ', 'Equatorial Guinea', 'GNQ', 226),
(66, 'ER', 'Eritrea', 'ERI', 232),
(67, 'EE', 'Estonia', 'EST', 233),
(68, 'ET', 'Ethiopia', 'ETH', 231),
(69, 'FK', 'Falkland Islands (Malvinas)', 'FLK', 238),
(70, 'FO', 'Faroe Islands', 'FRO', 234),
(71, 'FJ', 'Fiji', 'FJI', 242),
(72, 'FI', 'Finland', 'FIN', 246),
(73, 'FR', 'France', 'FRA', 250),
(74, 'GF', 'French Guiana', 'GUF', 254),
(75, 'PF', 'French Polynesia', 'PYF', 258),
(76, 'TF', 'French Southern Territories', NULL, NULL),
(77, 'GA', 'Gabon', 'GAB', 266),
(78, 'GM', 'Gambia', 'GMB', 270),
(79, 'GE', 'Georgia', 'GEO', 268),
(80, 'DE', 'Germany', 'DEU', 276),
(81, 'GH', 'Ghana', 'GHA', 288),
(82, 'GI', 'Gibraltar', 'GIB', 292),
(83, 'GR', 'Greece', 'GRC', 300),
(84, 'GL', 'Greenland', 'GRL', 304),
(85, 'GD', 'Grenada', 'GRD', 308),
(86, 'GP', 'Guadeloupe', 'GLP', 312),
(87, 'GU', 'Guam', 'GUM', 316),
(88, 'GT', 'Guatemala', 'GTM', 320),
(89, 'GN', 'Guinea', 'GIN', 324),
(90, 'GW', 'Guinea-Bissau', 'GNB', 624),
(91, 'GY', 'Guyana', 'GUY', 328),
(92, 'HT', 'Haiti', 'HTI', 332),
(93, 'HM', 'Heard Island and Mcdonald Islands', NULL, NULL),
(94, 'VA', 'Holy See (Vatican City State)', 'VAT', 336),
(95, 'HN', 'Honduras', 'HND', 340),
(96, 'HK', 'Hong Kong', 'HKG', 344),
(97, 'HU', 'Hungary', 'HUN', 348),
(98, 'IS', 'Iceland', 'ISL', 352),
(99, 'IN', 'India', 'IND', 356),
(100, 'ID', 'Indonesia', 'IDN', 360),
(101, 'IR', 'Iran, Islamic Republic of', 'IRN', 364),
(102, 'IQ', 'Iraq', 'IRQ', 368),
(103, 'IE', 'Ireland', 'IRL', 372),
(104, 'IL', 'Israel', 'ISR', 376),
(105, 'IT', 'Italy', 'ITA', 380),
(106, 'JM', 'Jamaica', 'JAM', 388),
(107, 'JP', 'Japan', 'JPN', 392),
(108, 'JO', 'Jordan', 'JOR', 400),
(109, 'KZ', 'Kazakhstan', 'KAZ', 398),
(110, 'KE', 'Kenya', 'KEN', 404),
(111, 'KI', 'Kiribati', 'KIR', 296),
(112, 'KP', 'Korea, Democratic People\'s Republic of', 'PRK', 408),
(113, 'KR', 'Korea, Republic of', 'KOR', 410),
(114, 'KW', 'Kuwait', 'KWT', 414),
(115, 'KG', 'Kyrgyzstan', 'KGZ', 417),
(116, 'LA', 'Lao People\'s Democratic Republic', 'LAO', 418),
(117, 'LV', 'Latvia', 'LVA', 428),
(118, 'LB', 'Lebanon', 'LBN', 422),
(119, 'LS', 'Lesotho', 'LSO', 426),
(120, 'LR', 'Liberia', 'LBR', 430),
(121, 'LY', 'Libyan Arab Jamahiriya', 'LBY', 434),
(122, 'LI', 'Liechtenstein', 'LIE', 438),
(123, 'LT', 'Lithuania', 'LTU', 440),
(124, 'LU', 'Luxembourg', 'LUX', 442),
(125, 'MO', 'Macao', 'MAC', 446),
(126, 'MK', 'Macedonia, the Former Yugoslav Republic of', 'MKD', 807),
(127, 'MG', 'Madagascar', 'MDG', 450),
(128, 'MW', 'Malawi', 'MWI', 454),
(129, 'MY', 'Malaysia', 'MYS', 458),
(130, 'MV', 'Maldives', 'MDV', 462),
(131, 'ML', 'Mali', 'MLI', 466),
(132, 'MT', 'Malta', 'MLT', 470),
(133, 'MH', 'Marshall Islands', 'MHL', 584),
(134, 'MQ', 'Martinique', 'MTQ', 474),
(135, 'MR', 'Mauritania', 'MRT', 478),
(136, 'MU', 'Mauritius', 'MUS', 480),
(137, 'YT', 'Mayotte', NULL, NULL),
(138, 'MX', 'Mexico', 'MEX', 484),
(139, 'FM', 'Micronesia, Federated States of', 'FSM', 583),
(140, 'MD', 'Moldova, Republic of', 'MDA', 498),
(141, 'MC', 'Monaco', 'MCO', 492),
(142, 'MN', 'Mongolia', 'MNG', 496),
(143, 'MS', 'Montserrat', 'MSR', 500),
(144, 'MA', 'Morocco', 'MAR', 504),
(145, 'MZ', 'Mozambique', 'MOZ', 508),
(146, 'MM', 'Myanmar', 'MMR', 104),
(147, 'NA', 'Namibia', 'NAM', 516),
(148, 'NR', 'Nauru', 'NRU', 520),
(149, 'NP', 'Nepal', 'NPL', 524),
(150, 'NL', 'Netherlands', 'NLD', 528),
(151, 'AN', 'Netherlands Antilles', 'ANT', 530),
(152, 'NC', 'New Caledonia', 'NCL', 540),
(153, 'NZ', 'New Zealand', 'NZL', 554),
(154, 'NI', 'Nicaragua', 'NIC', 558),
(155, 'NE', 'Niger', 'NER', 562),
(156, 'NG', 'Nigeria', 'NGA', 566),
(157, 'NU', 'Niue', 'NIU', 570),
(158, 'NF', 'Norfolk Island', 'NFK', 574),
(159, 'MP', 'Northern Mariana Islands', 'MNP', 580),
(160, 'NO', 'Norway', 'NOR', 578),
(161, 'OM', 'Oman', 'OMN', 512),
(162, 'PK', 'Pakistan', 'PAK', 586),
(163, 'PW', 'Palau', 'PLW', 585),
(164, 'PS', 'Palestinian Territory, Occupied', NULL, NULL),
(165, 'PA', 'Panama', 'PAN', 591),
(166, 'PG', 'Papua New Guinea', 'PNG', 598),
(167, 'PY', 'Paraguay', 'PRY', 600),
(168, 'PE', 'Peru', 'PER', 604),
(169, 'PH', 'Philippines', 'PHL', 608),
(170, 'PN', 'Pitcairn', 'PCN', 612),
(171, 'PL', 'Poland', 'POL', 616),
(172, 'PT', 'Portugal', 'PRT', 620),
(173, 'PR', 'Puerto Rico', 'PRI', 630),
(174, 'QA', 'Qatar', 'QAT', 634),
(175, 'RE', 'Reunion', 'REU', 638),
(176, 'RO', 'Romania', 'ROM', 642),
(177, 'RU', 'Russian Federation', 'RUS', 643),
(178, 'RW', 'Rwanda', 'RWA', 646),
(179, 'SH', 'Saint Helena', 'SHN', 654),
(180, 'KN', 'Saint Kitts and Nevis', 'KNA', 659),
(181, 'LC', 'Saint Lucia', 'LCA', 662),
(182, 'PM', 'Saint Pierre and Miquelon', 'SPM', 666),
(183, 'VC', 'Saint Vincent and the Grenadines', 'VCT', 670),
(184, 'WS', 'Samoa', 'WSM', 882),
(185, 'SM', 'San Marino', 'SMR', 674),
(186, 'ST', 'Sao Tome and Principe', 'STP', 678),
(187, 'SA', 'Saudi Arabia', 'SAU', 682),
(188, 'SN', 'Senegal', 'SEN', 686),
(189, 'CS', 'Serbia and Montenegro', NULL, NULL),
(190, 'SC', 'Seychelles', 'SYC', 690),
(191, 'SL', 'Sierra Leone', 'SLE', 694),
(192, 'SG', 'Singapore', 'SGP', 702),
(193, 'SK', 'Slovakia', 'SVK', 703),
(194, 'SI', 'Slovenia', 'SVN', 705),
(195, 'SB', 'Solomon Islands', 'SLB', 90),
(196, 'SO', 'Somalia', 'SOM', 706),
(197, 'ZA', 'South Africa', 'ZAF', 710),
(198, 'GS', 'South Georgia and the South Sandwich Islands', NULL, NULL),
(199, 'ES', 'Spain', 'ESP', 724),
(200, 'LK', 'Sri Lanka', 'LKA', 144),
(201, 'SD', 'Sudan', 'SDN', 736),
(202, 'SR', 'Suriname', 'SUR', 740),
(203, 'SJ', 'Svalbard and Jan Mayen', 'SJM', 744),
(204, 'SZ', 'Swaziland', 'SWZ', 748),
(205, 'SE', 'Sweden', 'SWE', 752),
(206, 'CH', 'Switzerland', 'CHE', 756),
(207, 'SY', 'Syrian Arab Republic', 'SYR', 760),
(208, 'TW', 'Taiwan, Province of China', 'TWN', 158),
(209, 'TJ', 'Tajikistan', 'TJK', 762),
(210, 'TZ', 'Tanzania, United Republic of', 'TZA', 834),
(211, 'TH', 'Thailand', 'THA', 764),
(212, 'TL', 'Timor-Leste', NULL, NULL),
(213, 'TG', 'Togo', 'TGO', 768),
(214, 'TK', 'Tokelau', 'TKL', 772),
(215, 'TO', 'Tonga', 'TON', 776),
(216, 'TT', 'Trinidad and Tobago', 'TTO', 780),
(217, 'TN', 'Tunisia', 'TUN', 788),
(218, 'TR', 'Turkey', 'TUR', 792),
(219, 'TM', 'Turkmenistan', 'TKM', 795),
(220, 'TC', 'Turks and Caicos Islands', 'TCA', 796),
(221, 'TV', 'Tuvalu', 'TUV', 798),
(222, 'UG', 'Uganda', 'UGA', 800),
(223, 'UA', 'Ukraine', 'UKR', 804),
(224, 'AE', 'United Arab Emirates', 'ARE', 784),
(225, 'GB', 'United Kingdom', 'GBR', 826),
(226, 'US', 'United States', 'USA', 840),
(227, 'UM', 'United States Minor Outlying Islands', NULL, NULL),
(228, 'UY', 'Uruguay', 'URY', 858),
(229, 'UZ', 'Uzbekistan', 'UZB', 860),
(230, 'VU', 'Vanuatu', 'VUT', 548),
(231, 'VE', 'Venezuela', 'VEN', 862),
(232, 'VN', 'Viet Nam', 'VNM', 704),
(233, 'VG', 'Virgin Islands, British', 'VGB', 92),
(234, 'VI', 'Virgin Islands, U.s.', 'VIR', 850),
(235, 'WF', 'Wallis and Futuna', 'WLF', 876),
(236, 'EH', 'Western Sahara', 'ESH', 732),
(237, 'YE', 'Yemen', 'YEM', 887),
(238, 'ZM', 'Zambia', 'ZMB', 894),
(239, 'ZW', 'Zimbabwe', 'ZWE', 716);

-- --------------------------------------------------------

--
-- Table structure for table `fa_user`
--

CREATE TABLE `fa_user` (
  `id` int(11) NOT NULL,
  `user_name` varchar(45) NOT NULL,
  `country_id` int(11) DEFAULT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(120) NOT NULL,
  `role` varchar(50) NOT NULL DEFAULT 'user',
  `banned` tinyint(1) NOT NULL DEFAULT '0',
  `forgotten_password_code` varchar(50) DEFAULT NULL,
  `last_visit` datetime DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fa_user`
--

INSERT INTO `fa_user` (`id`, `user_name`, `country_id`, `password`, `email`, `role`, `banned`, `forgotten_password_code`, `last_visit`, `created`, `modified`) VALUES
(1, 'admin', 0, '8709d7dc8f2ba1f9bd2b7140ff7078c2', 'root@localhost.com', 'superadmin', 0, NULL, '2016-11-19 23:33:46', '2016-11-19 20:33:46', '0000-00-00 00:00:00'),
(9, 'cashier', 0, '8709d7dc8f2ba1f9bd2b7140ff7078c2', 'cashier@localhost.com', 'user', 0, NULL, NULL, '2015-11-14 10:46:03', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `fa_user_profile`
--

CREATE TABLE `fa_user_profile` (
  `id` int(11) NOT NULL,
  `field_1` varchar(50) DEFAULT NULL,
  `field_2` varchar(50) DEFAULT NULL,
  `call_me_nicely` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fa_user_profile`
--

INSERT INTO `fa_user_profile` (`id`, `field_1`, `field_2`, `call_me_nicely`) VALUES
(1, 'Rafeequl', 'Rafeequl Rahman Awan', '102'),
(9, 'John', 'John Doe', '123');

-- --------------------------------------------------------

--
-- Table structure for table `fa_user_temp`
--

CREATE TABLE `fa_user_temp` (
  `id` int(11) NOT NULL,
  `user_name` varchar(45) NOT NULL,
  `country_id` int(11) DEFAULT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(120) NOT NULL,
  `activation_code` varchar(50) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fa_user_temp`
--

INSERT INTO `fa_user_temp` (`id`, `user_name`, `country_id`, `password`, `email`, `activation_code`, `created`) VALUES
(1, '123456', 100, 'ecdd9981841fa22896d34776a5249535', 'rafeequl@gmsail.com', 'llprt', '2007-12-10 21:28:17');

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` char(36) NOT NULL,
  `name` varchar(127) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `created`, `modified`) VALUES
('499ef44e-42e8-4615-8d51-2f51a509ff00', 'Administrators', '2009-02-20 20:19:58', '2009-02-20 20:19:58'),
('499ef455-acf4-469e-991b-2f51a509ff00', 'Access Providers', '2009-02-20 20:20:05', '2009-02-20 20:20:05'),
('499ef45a-dc24-42b1-8d99-2f51a509ff00', 'Users', '2009-02-20 20:20:10', '2009-02-20 20:20:10');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `id` int(5) NOT NULL,
  `realname` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `used` int(255) NOT NULL,
  `bill_by` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `current_total` decimal(10,4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`id`, `realname`, `username`, `used`, `bill_by`, `date`, `current_total`) VALUES
(14, 'Brian Njoroge', 'brayo', 2, 'time', '2016-03-18', '3.9333'),
(15, 'Eric Kirima', 'engeryx', 4, 'time', '2016-05-30', '7.2667');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_detail`
--

CREATE TABLE `invoice_detail` (
  `id` int(11) NOT NULL,
  `realname` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `start` datetime NOT NULL,
  `stop` datetime NOT NULL,
  `used` int(11) NOT NULL,
  `bill_by` varchar(255) NOT NULL,
  `total` decimal(10,4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice_detail`
--

INSERT INTO `invoice_detail` (`id`, `realname`, `username`, `start`, `stop`, `used`, `bill_by`, `total`) VALUES
(23, 'Brian Njoroge', 'brayo', '2015-11-15 02:46:47', '2015-11-15 02:48:45', 2, 'time', '3.9333'),
(24, 'Eric Kirima', 'engeryx', '2015-11-15 02:25:36', '2015-11-15 02:25:41', 0, 'time', '0.1667'),
(25, 'Eric Kirima', 'engeryx', '2015-11-15 03:45:58', '2015-11-15 03:49:31', 4, 'time', '7.1000');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int(10) NOT NULL,
  `user_id` char(36) NOT NULL,
  `billing_plan_id` char(36) NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `user_id`, `billing_plan_id`, `start_date`, `end_date`, `created`, `modified`) VALUES
(64, '4a0b0cb6-9718-4221-886b-3706a509ff00', '4a562c4c-7f50-4a27-b48e-2b8ba509ff00', '2009-03-01 00:00:00', '2009-03-31 23:59:59', '2009-07-20 21:22:47', '2009-07-20 21:22:47'),
(51, '4a280b2f-5100-45f4-8bf9-486dc4072569', '4a562c4c-7f50-4a27-b48e-2b8ba509ff00', '2009-05-01 00:00:00', '2009-05-31 23:59:59', '2009-07-09 21:04:01', '2009-07-09 21:04:01'),
(65, '4a0b0cb6-9718-4221-886b-3706a509ff00', '4a562c4c-7f50-4a27-b48e-2b8ba509ff00', '2009-04-01 00:00:00', '2009-04-30 23:59:59', '2009-07-21 04:31:10', '2009-07-21 04:31:10'),
(61, '4a2bb886-89dc-4152-9d3d-49d3c4072569', '4a562c4c-7f50-4a27-b48e-2b8ba509ff00', '2009-07-01 00:00:00', '2009-07-31 23:59:59', '2009-07-17 09:31:02', '2009-07-17 09:31:02'),
(54, '4a280b2f-5100-45f4-8bf9-486dc4072569', '4a562c4c-7f50-4a27-b48e-2b8ba509ff00', '2009-06-01 00:00:00', '2009-06-30 23:59:59', '2009-07-10 04:38:23', '2009-07-10 04:38:23'),
(66, '4a0b0cb6-9718-4221-886b-3706a509ff00', '4a562c4c-7f50-4a27-b48e-2b8ba509ff00', '2009-05-01 00:00:00', '2009-05-31 23:59:59', '2009-07-21 04:31:48', '2009-07-21 04:31:48'),
(63, '4a0b0cb6-9718-4221-886b-3706a509ff00', '4a562c4c-7f50-4a27-b48e-2b8ba509ff00', '2009-02-01 00:00:00', '2009-02-28 23:59:59', '2009-07-20 16:06:08', '2009-07-20 16:06:08'),
(76, '4a6c96f6-2f30-42c9-9d2c-68bca509ff00', '4a562c4c-7f50-4a27-b48e-2b8ba509ff00', '2009-07-01 00:00:00', '2009-07-31 23:59:59', '2009-07-26 19:48:58', '2009-07-26 19:48:58'),
(75, '4a0b0cb6-9718-4221-886b-3706a509ff00', '4a562c4c-7f50-4a27-b48e-2b8ba509ff00', '2009-06-01 00:00:00', '2009-06-30 23:59:59', '2009-07-26 11:05:45', '2009-07-26 11:05:45');

-- --------------------------------------------------------

--
-- Table structure for table `iptable_rules`
--

CREATE TABLE `iptable_rules` (
  `id` char(36) NOT NULL,
  `profile_id` char(36) NOT NULL,
  `priority` int(3) NOT NULL DEFAULT '100',
  `action` enum('allow','block') NOT NULL DEFAULT 'allow',
  `destination` varchar(100) NOT NULL,
  `protocol` varchar(10) NOT NULL,
  `port` int(7) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` char(36) NOT NULL,
  `name` varchar(100) NOT NULL,
  `iso_name` varchar(50) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mpesa_clients`
--

CREATE TABLE `mpesa_clients` (
  `clientID` int(11) NOT NULL,
  `client_receipt` varchar(10) NOT NULL,
  `client_name` varchar(25) NOT NULL,
  `client_phone` varchar(12) NOT NULL,
  `client_cash` varchar(10) NOT NULL,
  `client_expiry` varchar(25) NOT NULL,
  `client_plan` varchar(25) NOT NULL,
  `client_replied` int(2) NOT NULL,
  `client_username` varchar(25) NOT NULL,
  `client_password` varchar(25) NOT NULL,
  `client_merchant` varchar(25) NOT NULL,
  `client_gateway` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mpesa_clients`
--

INSERT INTO `mpesa_clients` (`clientID`, `client_receipt`, `client_name`, `client_phone`, `client_cash`, `client_expiry`, `client_plan`, `client_replied`, `client_username`, `client_password`, `client_merchant`, `client_gateway`) VALUES
(1, 'JIF34DF12E', 'SIMON-WAIGWA', '0719393894', '100.00', '7', 'Atomic', 1, 'simonwai', 'mickimmut', 'payplug', '0719393894'),
(2, 'JK76EV0ERY', 'Tracy-Kimani', '0719393894', '100.00', '7', 'Atomic', 1, 'tracykim', 'mutmukthi', 'payplug', '0719393894'),
(14, 'JI861V7A7U', 'BONIFACE-KOSGEI', '0719393894', '100.00', '7', 'Atomic', 1, 'bonifacekosr', 'naoserery', 'payplug', '0719393894'),
(16, 'JK76EV0ERY', 'Eric-Kirima', '0719393894', '100.00', '7', 'Atomic', 1, 'erickir', 'netnaomut', 'payplug', '0719393894'),
(17, 'JK76EV0ERY', 'Eric-Kirima', '0719393894', '100.00', '7', 'Atomic', 1, 'erickiry', 'mwanetint', 'payplug', '0719393894'),
(18, 'JKF2GOCDEI', 'ERICK-ROB', '0722978552', '20.00', '1', 'Light One', 1, 'erickrob', 'uneeriomi', 'payplug', '0719393894'),
(19, 'Preston', 'Chege-', 'payplug', '100.00', '7', 'Atomic', 1, 'prestonche', 'naorontra', '0719393894', 'JK61EJUUM1'),
(20, 'JKF2GOCDEI', 'ERICK-ROB', '0717353774', '100.00', '7', 'Atomic', 1, 'erickrobd', 'kensertra', 'payplug', '0719393894'),
(21, 'JK61EJUUM1', 'Preston-Chege', '0719520795', '100.00', '7', 'Atomic', 1, 'prestonchew', 'thidatomi', 'payplug', '0719393894'),
(22, 'JK76EV0ERY', 'Eric-Kirima', '0719393894', '100.00', '7', 'Atomic', 1, 'erickirc', 'sermutmuk', 'payplug', '0719393894'),
(23, 'JK76EV0ERY', 'Eric-Kirima', '0719393894', '100.00', '7', 'Atomic', 1, 'erickiru', 'paukirken', 'payplug', '0719393894'),
(24, 'JK76EV0ERY', 'Eric-Kirima', '0701262410', '100.00', '7', 'Atomic', 1, 'erickirq', 'dattraken', 'payplug', '0719393894'),
(25, 'JK76EV0ERY', 'Eric-Kirima', '0701262410', '100.00', '7', 'Atomic', 1, 'erickirv', 'netmicint', 'payplug', '0719393894'),
(26, 'JK76EV0ERY', 'Eric-Kirima', '0701262410', '100.00', '7', 'Atomic', 1, 'erickirm', 'kentraser', 'payplug', '0719393894'),
(27, 'JK76EV0ERY', 'Eric-Kirima', '0701262410', '100.00', '7', 'Atomic', 1, 'erickirg', 'intmickir', 'payplug', '0719393894');

-- --------------------------------------------------------

--
-- Table structure for table `mpesa_pay`
--

CREATE TABLE `mpesa_pay` (
  `col_id` int(11) NOT NULL,
  `receipt` varchar(12) NOT NULL,
  `timereceived` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `amount` varchar(12) NOT NULL,
  `sender` varchar(50) NOT NULL,
  `mobilenumber` varchar(25) NOT NULL,
  `status` varchar(25) NOT NULL,
  `username` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `na_realms`
--

CREATE TABLE `na_realms` (
  `id` char(36) NOT NULL,
  `na_id` char(36) NOT NULL,
  `realm_id` char(36) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `na_states`
--

CREATE TABLE `na_states` (
  `id` char(36) NOT NULL,
  `na_id` char(36) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `na_states`
--

INSERT INTO `na_states` (`id`, `na_id`, `state`, `created`, `modified`) VALUES
('4b7aa3b6-85f8-4a70-bbdf-23aea509ff00', '1', 1, '2010-02-16 15:55:02', '2010-02-16 15:55:02'),
('4b7aa473-96d4-4782-bb49-29a9a509ff00', '2', 0, '2010-02-16 15:58:11', '2010-02-16 15:58:11');

-- --------------------------------------------------------

--
-- Table structure for table `nas`
--

CREATE TABLE `nas` (
  `id` int(10) NOT NULL,
  `nasname` varchar(128) NOT NULL,
  `shortname` varchar(32) DEFAULT NULL,
  `type` varchar(30) DEFAULT 'other',
  `ports` int(5) DEFAULT NULL,
  `secret` varchar(60) NOT NULL DEFAULT 'secret',
  `community` varchar(50) DEFAULT NULL,
  `description` varchar(200) DEFAULT 'RADIUS Client',
  `monitor` tinyint(1) NOT NULL DEFAULT '1',
  `user_id` char(36) NOT NULL,
  `lat` double DEFAULT NULL,
  `lon` double DEFAULT NULL,
  `photo_file_name` varchar(128) NOT NULL DEFAULT 'logo.jpg',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(10) NOT NULL,
  `user_id` char(36) NOT NULL,
  `value` int(5) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `postpaid_account`
--

CREATE TABLE `postpaid_account` (
  `id` int(255) NOT NULL,
  `realname` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `bill_by` varchar(255) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `IdleTimeout` int(10) NOT NULL,
  `valid_until` varchar(255) NOT NULL,
  `smsmobile` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `postpaid_account`
--

INSERT INTO `postpaid_account` (`id`, `realname`, `username`, `password`, `bill_by`, `created_by`, `IdleTimeout`, `valid_until`, `smsmobile`) VALUES
(9, 'sfsdfsdf', 'ddjjf', 'fdfdf', '2', 'hacker', 10, 'November 2 2015 24:00:00', '999'),
(20, 'Joel Wamae', 'joel', 'pass', 'time', 'admin', 10, 'November 16 2015 24:00:00', '0712694102'),
(21, 'Ken Wambugu', 'ken', 'kenlab', 'time', 'Eric', 10, 'November 17 2015 24:00:00', '0729448322'),
(22, 'demo', 'demo', 'demo', 'time', 'Admin', 10, 'August 4 2016 24:00:00', '0712345678');

-- --------------------------------------------------------

--
-- Stand-in structure for view `postpaid_account_bill`
--
CREATE TABLE `postpaid_account_bill` (
`realname` varchar(255)
,`username` varchar(255)
,`password` varchar(255)
,`start` datetime
,`stop` datetime
,`time_used` decimal(15,4)
,`packet_used` decimal(24,4)
,`bill_by` varchar(255)
,`time_price` double
,`packet_price` double
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `postpaid_account_list`
--
CREATE TABLE `postpaid_account_list` (
`id` int(255)
,`realname` varchar(255)
,`username` varchar(255)
,`password` varchar(255)
,`time_used` decimal(37,4)
,`packet_used` decimal(46,4)
,`smsmobile` varchar(15)
,`bill_by` varchar(255)
,`time_price` double
,`packet_price` double
,`valid_until` varchar(255)
);

-- --------------------------------------------------------

--
-- Table structure for table `postplan`
--

CREATE TABLE `postplan` (
  `id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` float DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `postplan`
--

INSERT INTO `postplan` (`id`, `name`, `price`) VALUES
(1, 'packet', 5),
(2, 'time', 2),
(3, 'bw_download', 1024000),
(4, 'bw_upload', 1024000),
(5, 'idletimeout', 10);

-- --------------------------------------------------------

--
-- Table structure for table `profile_realms`
--

CREATE TABLE `profile_realms` (
  `id` char(36) NOT NULL,
  `profile_id` char(36) NOT NULL,
  `realm_id` char(36) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `id` char(36) NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `template_id` varchar(128) NOT NULL DEFAULT '',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`id`, `name`, `template_id`, `created`, `modified`) VALUES
('4a62fd7a-6068-42fd-aaae-1c72a509ff00', 'Voucher 10M CAP', '4a629d58-7114-4f73-a4db-4298a509ff00', '2009-07-19 13:03:22', '2009-07-19 13:03:22'),
('4a62f9c4-25a8-45bc-ab56-1c84a509ff00', 'Permanent 250M CAP', '4a62984f-d8e4-428b-bb45-39a8a509ff00', '2009-07-19 12:47:32', '2009-07-19 12:47:32'),
('4a6320ad-2f3c-4eb3-9bee-489da509ff00', 'Permanent 1h/day 7d/month', '4a629864-f8fc-475f-b694-39a8a509ff00', '2009-07-19 15:33:33', '2009-07-19 15:33:33'),
('4a62f5ca-1f54-4034-aa59-1c69a509ff00', 'Permanent 10Days CAP', '4a62982e-f070-4332-af98-19c9a509ff00', '2009-07-19 12:30:34', '2009-07-19 12:30:34');

-- --------------------------------------------------------

--
-- Table structure for table `radacct`
--

CREATE TABLE `radacct` (
  `radacctid` bigint(21) NOT NULL,
  `acctsessionid` varchar(64) NOT NULL DEFAULT '',
  `acctuniqueid` varchar(32) NOT NULL DEFAULT '',
  `username` varchar(64) NOT NULL DEFAULT '',
  `groupname` varchar(64) NOT NULL DEFAULT '',
  `realm` varchar(64) DEFAULT '',
  `nasipaddress` varchar(15) NOT NULL DEFAULT '',
  `nasportid` varchar(15) DEFAULT NULL,
  `nasporttype` varchar(32) DEFAULT NULL,
  `acctstarttime` datetime DEFAULT NULL,
  `acctstoptime` datetime DEFAULT NULL,
  `acctsessiontime` int(12) DEFAULT NULL,
  `acctauthentic` varchar(32) DEFAULT NULL,
  `connectinfo_start` varchar(50) DEFAULT NULL,
  `connectinfo_stop` varchar(50) DEFAULT NULL,
  `acctinputoctets` bigint(20) DEFAULT NULL,
  `acctoutputoctets` bigint(20) DEFAULT NULL,
  `calledstationid` varchar(50) NOT NULL DEFAULT '',
  `callingstationid` varchar(50) NOT NULL DEFAULT '',
  `acctterminatecause` varchar(32) NOT NULL DEFAULT '',
  `servicetype` varchar(32) DEFAULT NULL,
  `framedprotocol` varchar(32) DEFAULT NULL,
  `framedipaddress` varchar(15) NOT NULL DEFAULT '',
  `acctstartdelay` int(12) DEFAULT NULL,
  `acctstopdelay` int(12) DEFAULT NULL,
  `xascendsessionsvrkey` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `radacct`
--

INSERT INTO `radacct` (`radacctid`, `acctsessionid`, `acctuniqueid`, `username`, `groupname`, `realm`, `nasipaddress`, `nasportid`, `nasporttype`, `acctstarttime`, `acctstoptime`, `acctsessiontime`, `acctauthentic`, `connectinfo_start`, `connectinfo_stop`, `acctinputoctets`, `acctoutputoctets`, `calledstationid`, `callingstationid`, `acctterminatecause`, `servicetype`, `framedprotocol`, `framedipaddress`, `acctstartdelay`, `acctstopdelay`, `xascendsessionsvrkey`) VALUES
(1, '564787fb00000005', '2eccb34775bc3365', 'georgegac', '', '', '0.0.0.0', '5', 'Wireless-802.11', '2015-11-14 23:22:30', '2015-11-14 23:48:50', 1580, '', '', '', 395496, 158674, '08-00-27-C9-02-CC', 'D4-40-F0-7B-C5-8D', 'User-Request', '', '', '192.168.182.11', 0, 0, ''),
(2, '5647ac4f00000000', '660e96f09928ae84', 'wadhov14', '', '', '0.0.0.0', '0', 'Wireless-802.11', '2015-11-15 00:51:41', '2015-11-15 00:53:50', 129, '', '', '', 282820, 773012, '08-00-27-C9-02-CC', '60-FE-1E-08-45-06', 'Session-Timeout', '', '', '192.168.182.12', 0, 0, ''),
(3, '5647a66a00000005', 'd2476bfd83d4bf1f', 'hostan12', '', '', '0.0.0.0', '5', 'Wireless-802.11', '2015-11-15 00:51:53', '2015-11-15 00:55:56', 243, '', '', '', 634564, 12277766, '08-00-27-C9-02-CC', '2C-D0-5A-E5-63-97', 'Session-Timeout', '', '', '192.168.182.6', 0, 0, ''),
(4, '5647ae4100000008', '727774f8824e21aa', 'hicrel11', '', '', '0.0.0.0', '8', 'Wireless-802.11', '2015-11-15 01:04:35', '2015-11-15 01:11:29', 414, '', '', '', 192405, 858955, '08-00-27-C9-02-CC', 'C4-05-28-0D-B5-9B', 'Session-Timeout', '', '', '192.168.182.15', 0, 0, ''),
(5, '5647ad6e00000000', 'b2057c7909d49393', 'macxog13', '', '', '0.0.0.0', '0', 'Wireless-802.11', '2015-11-15 01:11:57', '2015-11-15 01:13:20', 83, '', '', '', 98363, 970621, '08-00-27-C9-02-CC', '60-FE-1E-08-45-06', 'Session-Timeout', '', '', '192.168.182.12', 0, 0, ''),
(6, '5647bb5300000001', '99b3396395a60869', 'georgegacs', '', '', '0.0.0.0', '1', 'Wireless-802.11', '2015-11-15 02:08:39', '2015-11-15 02:08:56', 17, '', '', '', 2486, 5272, '08-00-27-C9-02-CC', 'A0-B3-CC-24-45-3D', 'User-Request', '', '', '192.168.182.10', 0, 0, ''),
(26, '574c1d0400000001', 'b2c54b3227212e7b', 'ceskiz12', '', '', '0.0.0.0', '1', 'Wireless-802.11', '2016-05-30 14:13:54', '2016-05-30 14:16:04', 130, '', '', '', 92182, 756115, '08-00-27-6E-96-DD', '38-EA-A7-88-87-EF', 'Admin-Reset', '', '', '192.168.182.3', 0, 0, ''),
(9, '5647d17200000000', '1f623508f0824133', 'prestonchew', '', '', '0.0.0.0', '0', 'Wireless-802.11', '2015-11-15 03:28:46', '2015-11-15 03:35:16', 390, '', '', '', 224139, 4260844, '08-00-27-C9-02-CC', 'F0-E7-7E-F6-16-7D', 'Admin-Reset', '', '', '192.168.182.6', 0, 0, ''),
(32, '57a1cd9c00000002', 'f2875684008684cf', 'kilxeb7', '', '', '0.0.0.0', '2', 'Wireless-802.11', '2016-08-03 14:28:41', '2016-08-03 14:30:44', 123, '', '', '', 194918, 1992006, '08-00-27-6E-96-DD', '80-19-67-FB-E6-1B', 'Session-Timeout', '', '', '192.168.182.4', 0, 0, ''),
(11, '5647d80900000001', '9ceb120ff6bb1b88', 'erickrob', '', '', '0.0.0.0', '1', 'Wireless-802.11', '2015-11-15 04:24:01', '2015-11-15 04:27:39', 218, '', '', '', 22593, 37198, '08-00-27-C9-02-CC', 'D4-40-F0-7B-C5-8D', 'Admin-Reset', '', '', '192.168.182.3', 0, 0, ''),
(12, '5647df8b00000001', '1b6eebab5ad587e2', 'erickrob', '', '', '0.0.0.0', '1', 'Wireless-802.11', '2015-11-15 04:30:36', '2015-11-15 04:31:54', 78, '', '', '', 4942, 13740, '08-00-27-C9-02-CC', 'D4-40-F0-7B-C5-8D', 'Admin-Reset', '', '', '192.168.182.3', 0, 0, ''),
(13, '5647e08a00000001', '4e275126118a2d49', 'erickrob', '', '', '0.0.0.0', '1', 'Wireless-802.11', '2015-11-15 04:34:47', '2015-11-15 04:37:20', 153, '', '', '', 46692, 227444, '08-00-27-C9-02-CC', 'D4-40-F0-7B-C5-8D', 'Admin-Reset', '', '', '192.168.182.3', 0, 0, ''),
(14, '564c63de00000002', 'cd32a48a19ff2c25', 'erickiru', '', '', '0.0.0.0', '2', 'Wireless-802.11', '2015-11-18 15:13:29', '2015-11-18 15:13:54', 25, '', '', '', 4096, 5979, '08-00-27-C9-02-CC', '7C-05-07-59-1C-FA', 'User-Request', '', '', '192.168.182.4', 0, 0, ''),
(15, '564c6cb700000004', '34ce1a0a883d7169', 'noddit14', '', '', '0.0.0.0', '4', 'Wireless-802.11', '2015-11-18 15:21:39', '2015-11-18 16:05:31', 2632, '', '', '', 790593, 18157155, '08-00-27-C9-02-CC', '30-AA-BD-64-75-BC', 'Admin-Reset', '', '', '192.168.182.8', 0, 0, ''),
(16, '564c6fb10000000a', 'f0b99a3756807dc8', 'cosxem13', '', '', '0.0.0.0', '10', 'Wireless-802.11', '2015-11-18 15:34:25', '2015-11-18 15:37:08', 163, '', '', '', 221163, 895881, '08-00-27-C9-02-CC', '30-AA-BD-EE-BA-F6', 'Session-Timeout', '', '', '192.168.182.15', 0, 0, ''),
(17, '564c748900000007', '80e1ecf285c358a4', 'towyel15', '', '', '0.0.0.0', '7', 'Wireless-802.11', '2015-11-18 16:00:06', '2015-11-18 16:00:56', 50, '', '', '', 61449, 1066651, '08-00-27-C9-02-CC', '80-19-67-3D-01-C2', 'Session-Timeout', '', '', '192.168.182.18', 0, 0, ''),
(18, '564c761b00000006', '2606069844961f8f', 'bonifacekost', '', '', '0.0.0.0', '6', 'Wireless-802.11', '2015-11-18 16:02:03', '2015-11-18 16:05:46', 223, '', '', '', 45935, 153484, '08-00-27-C9-02-CC', '40-72-0D-39-66-CB', 'Admin-Reset', '', '', '192.168.182.20', 0, 0, ''),
(19, '564c7a0a0000000f', '1d835f477840112f', 'widhoh9', '', '', '0.0.0.0', '15', 'Wireless-802.11', '2015-11-18 16:17:44', '2015-11-18 16:19:08', 84, '', '', '', 297016, 759683, '08-00-27-C9-02-CC', '0C-E7-25-5C-28-DC', 'Session-Timeout', '', '', '192.168.182.29', 0, 0, ''),
(20, '564c7bce00000006', 'bac652e46bd0f79e', 'bonifacekosu', '', '', '0.0.0.0', '6', 'Wireless-802.11', '2015-11-18 16:26:09', '2015-11-18 16:39:34', 805, '', '', '', 511159, 12642686, '08-00-27-C9-02-CC', '6C-F3-73-63-E9-D8', 'Admin-Reset', '', '', '192.168.182.32', 0, 0, ''),
(21, '564c7c290000000b', '65b897ce1ab52e37', 'tuplik7', '', '', '0.0.0.0', '11', 'Wireless-802.11', '2015-11-18 16:26:37', '2015-11-18 16:28:49', 132, '', '', '', 402110, 234470, '08-00-27-C9-02-CC', '80-C5-E6-9B-EE-10', 'Admin-Reset', '', '', '192.168.182.33', 0, 0, ''),
(22, '564c7de20000000a', '7b4267cbe7a6e003', 'erickiry', '', '', '0.0.0.0', '10', 'Wireless-802.11', '2015-11-18 16:38:02', '2015-11-18 16:43:24', 322, '', '', '', 1701153, 1150075, '08-00-27-C9-02-CC', '80-19-67-4F-31-D7', 'Admin-Reset', '', '', '192.168.182.36', 0, 0, ''),
(23, '564c81750000000d', '49da87328e37e9db', 'sasrah5', '', '', '0.0.0.0', '13', 'Wireless-802.11', '2015-11-18 16:49:50', '2015-11-18 16:50:26', 36, '', '', '', 309865, 741862, '08-00-27-C9-02-CC', '40-C6-2A-06-92-B3', 'Session-Timeout', '', '', '192.168.182.41', 0, 0, ''),
(24, '564ceedd00000002', 'ad6f3e1402d119a0', 'erickirg', '', '', '0.0.0.0', '2', 'Wireless-802.11', '2015-11-19 02:10:23', '2015-11-19 02:12:11', 108, '', '', '', 369970, 1640091, '08-00-27-C9-02-CC', 'C4-05-28-0D-70-49', 'Admin-Reset', '', '', '192.168.182.49', 0, 0, ''),
(25, '564d095c00000010', 'ca36d4ec08b8ec7d', 'hitrin15', '', '', '0.0.0.0', '16', 'Wireless-802.11', '2015-11-19 02:45:35', '2015-11-19 02:56:51', 676, '', '', '', 202449, 371037, '08-00-27-C9-02-CC', 'D4-40-F0-7B-C5-8D', 'Idle-Timeout', '', '', '192.168.182.53', 0, 0, ''),
(27, '574c2dcb00000004', '6b5fa32336c5a1bb', 'ceskiz12', '', '', '0.0.0.0', '4', 'Wireless-802.11', '2016-05-30 15:19:20', '2016-05-30 15:19:20', 0, '', '', '', 4838, 9625, '08-00-27-6E-96-DD', 'E8-94-F6-1E-34-F6', 'User-Request', '', '', '192.168.182.6', 0, 0, ''),
(28, '574c2fc800000004', '522c033104d4ef57', 'ceskiz12', '', '', '0.0.0.0', '4', 'Wireless-802.11', '2016-05-30 15:20:05', '2016-05-30 15:20:05', 0, '', '', '', 3290, 7852, '08-00-27-6E-96-DD', 'E8-94-F6-1E-34-F6', 'User-Request', '', '', '192.168.182.6', 0, 0, ''),
(29, '574c2ff500000004', 'c7015a69ad9ae11f', 'nehxar9', '', '', '0.0.0.0', '4', 'Wireless-802.11', '2016-05-30 15:32:52', '2016-05-30 15:32:52', 0, '', '', '', 4876, 9514, '08-00-27-6E-96-DD', 'E8-94-F6-1E-34-F6', 'User-Request', '', '', '192.168.182.6', 0, 0, ''),
(30, '574c32f400000004', 'd6db46141219a833', 'nehxar9', '', '', '0.0.0.0', '4', 'Wireless-802.11', '2016-05-30 15:35:18', '2016-05-30 15:35:18', 0, '', '', '', 2917, 7198, '08-00-27-6E-96-DD', 'E8-94-F6-1E-34-F6', 'User-Request', '', '', '192.168.182.6', 0, 0, ''),
(31, '574c2df000000005', '0d4fe6d6b6d58ac2', 'nehxar9', '', '', '0.0.0.0', '5', 'Wireless-802.11', '2016-05-30 15:36:39', '2016-05-30 15:38:40', 121, '', '', '', 212852, 1403885, '08-00-27-6E-96-DD', '80-19-67-D7-97-2B', 'Session-Timeout', '', '', '192.168.182.7', 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `radcheck`
--

CREATE TABLE `radcheck` (
  `id` int(11) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `attribute` varchar(32) NOT NULL DEFAULT '',
  `op` char(2) NOT NULL DEFAULT '==',
  `value` varchar(253) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `radcheck`
--

INSERT INTO `radcheck` (`id`, `username`, `attribute`, `op`, `value`) VALUES
(4, 'simonwai', 'Cleartext-Password', ':=', 'mickimmut'),
(5, 'simonwai', 'Expiration', ':=', 'November 21 2015 24:00:00'),
(6, 'tracykim', 'Cleartext-Password', ':=', 'mutmukthi'),
(7, 'tracykim', 'Expiration', ':=', 'November 21 2015 24:00:00'),
(8, 'margaretkir', 'Cleartext-Password', ':=', 'pauthimut'),
(9, 'margaretkir', 'Expiration', ':=', 'November 21 2015 24:00:00'),
(10, 'annwan', 'Cleartext-Password', ':=', 'erynaoomi'),
(11, 'annwan', 'Expiration', ':=', 'November 21 2015 24:00:00'),
(14, 'georgegacs', 'Cleartext-Password', ':=', 'eridatdat'),
(15, 'georgegacs', 'Expiration', ':=', 'November 15 2015 24:00:00'),
(16, 'xivdoy13', 'Cleartext-Password', ':=', 'dabbusok'),
(17, 'xivdoy13', 'Expiration', ':=', 'November 16 2015 24:00:00'),
(18, 'hostan12', 'Cleartext-Password', ':=', 'nekgekor'),
(19, 'hostan12', 'Expiration', ':=', 'November 16 2015 24:00:00'),
(20, 'wadhov14', 'Cleartext-Password', ':=', 'tipkomok'),
(21, 'wadhov14', 'Expiration', ':=', 'November 16 2015 24:00:00'),
(22, 'hicrel11', 'Cleartext-Password', ':=', 'lumkibus'),
(23, 'hicrel11', 'Expiration', ':=', 'November 16 2015 24:00:00'),
(24, 'macxog13', 'Cleartext-Password', ':=', 'notpumac'),
(25, 'macxog13', 'Expiration', ':=', 'November 16 2015 24:00:00'),
(35, 'joel', 'Expiration', ':=', 'November 16 2015 24:00:00'),
(36, 'joel', 'Simultaneous-Use', ':=', '1'),
(37, 'joel', 'Cleartext-Password', ':=', 'pass'),
(38, 'ken', 'Expiration', ':=', 'November 17 2015 24:00:00'),
(39, 'ken', 'Simultaneous-Use', ':=', '1'),
(40, 'ken', 'Cleartext-Password', ':=', 'kenlab'),
(41, 'bonifacekos', 'Cleartext-Password', ':=', 'erynetmuk'),
(42, 'bonifacekos', 'Expiration', ':=', 'November 22 2015 24:00:00'),
(43, 'bonifacekosm', 'Cleartext-Password', ':=', 'erisermic'),
(44, 'bonifacekosm', 'Expiration', ':=', 'November 22 2015 24:00:00'),
(45, 'bonifacekosv', 'Cleartext-Password', ':=', 'serintnet'),
(46, 'bonifacekosv', 'Expiration', ':=', 'November 22 2015 24:00:00'),
(47, 'bonifacekosq', 'Cleartext-Password', ':=', 'muterypau'),
(48, 'bonifacekosq', 'Expiration', ':=', 'November 22 2015 24:00:00'),
(49, 'bonifacekosu', 'Cleartext-Password', ':=', 'naodatomi'),
(50, 'bonifacekosu', 'Expiration', ':=', 'November 22 2015 24:00:00'),
(53, 'bonifacekosd', 'Cleartext-Password', ':=', 'mutserkim'),
(54, 'bonifacekosd', 'Expiration', ':=', 'November 22 2015 24:00:00'),
(55, 'bonifacekosr', 'Cleartext-Password', ':=', 'naoserery'),
(56, 'bonifacekosr', 'Expiration', ':=', 'November 22 2015 24:00:00'),
(57, 'preston071', 'Cleartext-Password', ':=', 'nettraery'),
(58, 'preston071', 'Expiration', ':=', 'November 22 2015 24:00:00'),
(59, 'erickir', 'Cleartext-Password', ':=', 'netnaomut'),
(60, 'erickir', 'Expiration', ':=', 'November 22 2015 24:00:00'),
(61, 'erickiry', 'Cleartext-Password', ':=', 'mwanetint'),
(62, 'erickiry', 'Expiration', ':=', 'November 22 2015 24:00:00'),
(63, 'erickrob', 'Cleartext-Password', ':=', 'uneeriomi'),
(64, 'erickrob', 'Expiration', ':=', 'November 16 2015 24:00:00'),
(65, 'prestonche', 'Cleartext-Password', ':=', 'naorontra'),
(66, 'prestonche', 'Expiration', ':=', 'November 22 2015 24:00:00'),
(67, 'erickrobd', 'Cleartext-Password', ':=', 'kensertra'),
(68, 'erickrobd', 'Expiration', ':=', 'November 22 2015 24:00:00'),
(69, 'prestonchew', 'Cleartext-Password', ':=', 'thidatomi'),
(70, 'prestonchew', 'Expiration', ':=', 'November 22 2015 24:00:00'),
(71, 'erickirc', 'Cleartext-Password', ':=', 'sermutmuk'),
(72, 'erickirc', 'Expiration', ':=', 'November 25 2015 24:00:00'),
(73, 'erickiru', 'Cleartext-Password', ':=', 'paukirken'),
(74, 'erickiru', 'Expiration', ':=', 'November 25 2015 24:00:00'),
(75, 'noddit14', 'Cleartext-Password', ':=', 'lostucad'),
(76, 'noddit14', 'Expiration', ':=', 'November 19 2015 24:00:00'),
(77, 'cosxem13', 'Cleartext-Password', ':=', 'memkogim'),
(78, 'cosxem13', 'Expiration', ':=', 'November 19 2015 24:00:00'),
(79, 'towyel15', 'Cleartext-Password', ':=', 'gupcukeg'),
(80, 'towyel15', 'Expiration', ':=', 'November 19 2015 24:00:00'),
(81, 'tuplik7', 'Cleartext-Password', ':=', 'rogpacal'),
(82, 'tuplik7', 'Expiration', ':=', 'November 19 2015 24:00:00'),
(83, 'widhoh9', 'Cleartext-Password', ':=', 'lembosob'),
(84, 'widhoh9', 'Expiration', ':=', 'November 19 2015 24:00:00'),
(85, 'sasrah5', 'Cleartext-Password', ':=', 'kabnirud'),
(86, 'sasrah5', 'Expiration', ':=', 'November 19 2015 24:00:00'),
(87, 'dodsap5', 'Cleartext-Password', ':=', 'letpibes'),
(88, 'dodsap5', 'Expiration', ':=', 'November 19 2015 24:00:00'),
(89, 'huvrog13', 'Cleartext-Password', ':=', 'sesruged'),
(90, 'huvrog13', 'Expiration', ':=', 'November 20 2015 24:00:00'),
(91, 'tikkik11', 'Cleartext-Password', ':=', 'gopmimic'),
(92, 'tikkik11', 'Expiration', ':=', 'November 20 2015 24:00:00'),
(93, 'sewhow10', 'Cleartext-Password', ':=', 'memkeren'),
(94, 'sewhow10', 'Expiration', ':=', 'November 20 2015 24:00:00'),
(95, 'wugwun12', 'Cleartext-Password', ':=', 'depdabeb'),
(96, 'wugwun12', 'Expiration', ':=', 'November 20 2015 24:00:00'),
(97, 'ruspeg5', 'Cleartext-Password', ':=', 'bocmupac'),
(98, 'ruspeg5', 'Expiration', ':=', 'November 20 2015 24:00:00'),
(99, 'yexsuv12', 'Cleartext-Password', ':=', 'rictigur'),
(100, 'yexsuv12', 'Expiration', ':=', 'November 20 2015 24:00:00'),
(101, 'tegzox12', 'Cleartext-Password', ':=', 'rubcudeg'),
(102, 'tegzox12', 'Expiration', ':=', 'November 20 2015 24:00:00'),
(103, 'gimpoc12', 'Cleartext-Password', ':=', 'gorgadeg'),
(104, 'gimpoc12', 'Expiration', ':=', 'November 20 2015 24:00:00'),
(105, 'keybar10', 'Cleartext-Password', ':=', 'natnedon'),
(106, 'keybar10', 'Expiration', ':=', 'November 20 2015 24:00:00'),
(107, 'hitrin15', 'Cleartext-Password', ':=', 'sidgerum'),
(108, 'hitrin15', 'Expiration', ':=', 'November 20 2015 24:00:00'),
(109, 'erickirq', 'Cleartext-Password', ':=', 'dattraken'),
(110, 'erickirq', 'Expiration', ':=', 'November 26 2015 24:00:00'),
(111, 'erickirv', 'Cleartext-Password', ':=', 'netmicint'),
(112, 'erickirv', 'Expiration', ':=', 'November 26 2015 24:00:00'),
(113, 'erickirm', 'Cleartext-Password', ':=', 'kentraser'),
(114, 'erickirm', 'Expiration', ':=', 'November 26 2015 24:00:00'),
(115, 'erickirg', 'Cleartext-Password', ':=', 'intmickir'),
(116, 'erickirg', 'Expiration', ':=', 'November 26 2015 24:00:00'),
(117, 'liyvev13', 'Cleartext-Password', ':=', 'sagkopib'),
(118, 'liyvev13', 'Expiration', ':=', 'June 1 2016 24:00:00'),
(119, 'ceskiz12', 'Cleartext-Password', ':=', 'litbugur'),
(120, 'ceskiz12', 'Expiration', ':=', 'June 1 2016 24:00:00'),
(121, 'himdib10', 'Cleartext-Password', ':=', 'sicmomir'),
(122, 'himdib10', 'Expiration', ':=', 'May 31 2016 24:00:00'),
(123, 'wogyom11', 'Cleartext-Password', ':=', 'sarkacal'),
(124, 'wogyom11', 'Expiration', ':=', 'May 31 2016 24:00:00'),
(125, 'vehlar10', 'Cleartext-Password', ':=', 'mudricem'),
(126, 'vehlar10', 'Expiration', ':=', 'May 31 2016 24:00:00'),
(127, 'raypam14', 'Cleartext-Password', ':=', 'panmacak'),
(128, 'raypam14', 'Expiration', ':=', 'May 31 2016 24:00:00'),
(129, 'yukrix11', 'Cleartext-Password', ':=', 'tuslucib'),
(130, 'yukrix11', 'Expiration', ':=', 'May 31 2016 24:00:00'),
(131, 'polyip10', 'Cleartext-Password', ':=', 'rugkarok'),
(132, 'polyip10', 'Expiration', ':=', 'May 31 2016 24:00:00'),
(133, 'sudhep14', 'Cleartext-Password', ':=', 'bunlorig'),
(134, 'sudhep14', 'Expiration', ':=', 'May 31 2016 24:00:00'),
(135, 'notxez10', 'Cleartext-Password', ':=', 'dobteran'),
(136, 'notxez10', 'Expiration', ':=', 'May 31 2016 24:00:00'),
(137, 'cayzew12', 'Cleartext-Password', ':=', 'bessarud'),
(138, 'cayzew12', 'Expiration', ':=', 'May 31 2016 24:00:00'),
(139, 'nehxar9', 'Cleartext-Password', ':=', 'nimnopok'),
(140, 'nehxar9', 'Expiration', ':=', 'May 31 2016 24:00:00'),
(141, 'demo', 'Expiration', ':=', 'August 4 2016 24:00:00'),
(142, 'demo', 'Simultaneous-Use', ':=', '1'),
(143, 'demo', 'Cleartext-Password', ':=', 'demo'),
(144, 'kilxeb7', 'Cleartext-Password', ':=', 'doskidop'),
(145, 'kilxeb7', 'Expiration', ':=', 'August 4 2016 24:00:00'),
(146, 'nimzax5', 'Cleartext-Password', ':=', 'kakgitit'),
(147, 'nimzax5', 'Expiration', ':=', 'August 4 2016 24:00:00'),
(148, 'cilwol8', 'Cleartext-Password', ':=', 'rokkadop'),
(149, 'cilwol8', 'Expiration', ':=', 'August 4 2016 24:00:00'),
(150, 'keybul9', 'Cleartext-Password', ':=', 'nucteror'),
(151, 'keybul9', 'Expiration', ':=', 'August 4 2016 24:00:00'),
(152, 'buxxuv12', 'Cleartext-Password', ':=', 'midradul'),
(153, 'buxxuv12', 'Expiration', ':=', 'August 4 2016 24:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `radgroupcheck`
--

CREATE TABLE `radgroupcheck` (
  `id` int(11) UNSIGNED NOT NULL,
  `groupname` varchar(64) NOT NULL DEFAULT '',
  `attribute` varchar(32) NOT NULL DEFAULT '',
  `op` char(2) NOT NULL DEFAULT '==',
  `value` varchar(253) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `radgroupcheck`
--

INSERT INTO `radgroupcheck` (`id`, `groupname`, `attribute`, `op`, `value`) VALUES
(3, '50 Megs', 'Max-All-MB', ':=', '50'),
(4, '50 Megs', 'Simultaneous-Use', ':=', '1'),
(6, 'sdfd', 'Session-Timeout', ':=', '6000'),
(7, 'sdfd', 'Simultaneous-Use', ':=', '1'),
(22, 'Atomic', 'Max-All-MB', ':=', '1000'),
(23, 'Atomic', 'Simultaneous-Use', ':=', '1'),
(24, 'UnLiminet', 'Session-Timeout', ':=', '86400'),
(25, 'UnLiminet', 'Simultaneous-Use', ':=', '1'),
(26, 'Hustler Package', 'Simultaneous-Use', ':=', '1'),
(27, 'HomeUse', 'Session-Timeout', ':=', '604800'),
(28, 'HomeUse', 'Simultaneous-Use', ':=', '1'),
(29, 'Light One', 'Session-Timeout', ':=', '600'),
(30, 'Light One', 'Simultaneous-Use', ':=', '1'),
(31, 'Demo One', 'Session-Timeout', ':=', '240'),
(32, 'Demo One', 'Simultaneous-Use', ':=', '1'),
(33, 'Demo Two', 'Session-Timeout', ':=', '300'),
(34, 'Demo Two', 'Simultaneous-Use', ':=', '1'),
(35, 'Onemb', 'Max-All-MB', ':=', '1'),
(36, 'Onemb', 'Simultaneous-Use', ':=', '1'),
(37, '3G', 'Session-Timeout', ':=', '12000'),
(38, '3G', 'Simultaneous-Use', ':=', '1'),
(39, 'FreeWIFI', 'Session-Timeout', ':=', '120'),
(40, 'FreeWIFI', 'Simultaneous-Use', ':=', '1'),
(41, 'Boda', 'Session-Timeout', ':=', '120'),
(42, 'Boda', 'Simultaneous-Use', ':=', '1');

-- --------------------------------------------------------

--
-- Table structure for table `radgroupreply`
--

CREATE TABLE `radgroupreply` (
  `id` int(11) UNSIGNED NOT NULL,
  `groupname` varchar(64) NOT NULL DEFAULT '',
  `attribute` varchar(32) NOT NULL DEFAULT '',
  `op` char(2) NOT NULL DEFAULT '=',
  `value` varchar(253) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `radgroupreply`
--

INSERT INTO `radgroupreply` (`id`, `groupname`, `attribute`, `op`, `value`) VALUES
(1, 'Demo One', 'WISPr-Bandwidth-Max-Down', ':=', '2048000'),
(2, 'Demo One', 'WISPr-Bandwidth-Max-Up', ':=', '2048000'),
(3, 'Demo One', 'Session-Timeout', ':=', '240'),
(4, 'Demo One', 'Idle-Timeout', ':=', '60'),
(5, 'Demo One', 'Acct-Interim-Interval', ':=', '120'),
(6, 'Demo Two', 'WISPr-Bandwidth-Max-Down', ':=', '2048000'),
(7, 'Demo Two', 'WISPr-Bandwidth-Max-Up', ':=', '2048000'),
(8, 'Demo Two', 'Session-Timeout', ':=', '300'),
(9, 'Demo Two', 'Idle-Timeout', ':=', '60'),
(10, 'Demo Two', 'Acct-Interim-Interval', ':=', '120'),
(11, 'Onemb', 'WISPr-Bandwidth-Max-Down', ':=', '512000'),
(12, 'Onemb', 'WISPr-Bandwidth-Max-Up', ':=', '512000'),
(13, 'Onemb', 'ChilliSpot-Max-Total-Octets', ':=', '1048576'),
(14, 'Onemb', 'Idle-Timeout', ':=', '120'),
(15, 'Onemb', 'Acct-Interim-Interval', ':=', '120'),
(16, '3G', 'WISPr-Bandwidth-Max-Down', ':=', '2048000'),
(17, '3G', 'WISPr-Bandwidth-Max-Up', ':=', '512000'),
(18, '3G', 'Session-Timeout', ':=', '12000'),
(19, '3G', 'Idle-Timeout', ':=', '300'),
(20, '3G', 'Acct-Interim-Interval', ':=', '120'),
(21, 'FreeWIFI', 'WISPr-Bandwidth-Max-Down', ':=', '512000'),
(22, 'FreeWIFI', 'WISPr-Bandwidth-Max-Up', ':=', '512000'),
(23, 'FreeWIFI', 'Session-Timeout', ':=', '120'),
(24, 'FreeWIFI', 'Idle-Timeout', ':=', '120'),
(25, 'FreeWIFI', 'Acct-Interim-Interval', ':=', '120'),
(26, 'Boda', 'WISPr-Bandwidth-Max-Down', ':=', '512000'),
(27, 'Boda', 'WISPr-Bandwidth-Max-Up', ':=', '512000'),
(28, 'Boda', 'Session-Timeout', ':=', '120'),
(29, 'Boda', 'Idle-Timeout', ':=', '600'),
(30, 'Boda', 'Acct-Interim-Interval', ':=', '120');

-- --------------------------------------------------------

--
-- Table structure for table `radpostauth`
--

CREATE TABLE `radpostauth` (
  `id` int(11) NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `pass` varchar(64) NOT NULL DEFAULT '',
  `reply` varchar(32) NOT NULL DEFAULT '',
  `authdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `radpostauth`
--

INSERT INTO `radpostauth` (`id`, `username`, `pass`, `reply`, `authdate`) VALUES
(1, 'georgegac', 'kirintser', 'Access-Accept', '2015-11-14 20:22:30'),
(2, 'wadhov14', 'tipkomok', 'Access-Accept', '2015-11-14 21:51:40'),
(3, 'hostan12', 'nekgekor', 'Access-Accept', '2015-11-14 21:51:52'),
(4, 'hicrel11', 'lumkibus', 'Access-Accept', '2015-11-14 22:04:35'),
(5, 'macxog13', 'notpumac', 'Access-Accept', '2015-11-14 22:11:57'),
(6, 'georgegacs', '0x0032c196bd8a1b8b1c6a4397bd5e3d78d2', 'Access-Accept', '2015-11-14 23:08:39'),
(7, 'georgegacs', 'eridatdat', 'Access-Accept', '2015-11-14 23:13:13'),
(8, 'engeryx', 'data', 'Access-Accept', '2015-11-14 23:25:05'),
(9, 'engeryx', '0x006fe48519ecde01ca74bcd79b277ef0c8', 'Access-Accept', '2015-11-14 23:25:36'),
(10, 'ken', 'kenlab', 'Access-Accept', '2015-11-14 23:41:52'),
(11, 'brayo', 'brinjow', 'Access-Accept', '2015-11-14 23:46:47'),
(12, 'prestonchew', 'thidatomi', 'Access-Accept', '2015-11-15 00:28:45'),
(13, 'engeryx', 'data', 'Access-Accept', '2015-11-15 00:45:58'),
(14, 'erickrob', 'uneeriomi', 'Access-Accept', '2015-11-15 01:24:01'),
(15, 'erickrob', 'uneeriomi', 'Access-Accept', '2015-11-15 01:30:36'),
(16, 'erickrob', 'uneeriomi', 'Access-Accept', '2015-11-15 01:34:47'),
(17, 'erickiru', 'paukirken', 'Access-Accept', '2015-11-18 12:13:29'),
(18, 'noddit14', 'lostucad', 'Access-Accept', '2015-11-18 12:21:39'),
(19, 'cosxem13', 'memkogim', 'Access-Accept', '2015-11-18 12:34:25'),
(20, 'towyel15', 'gupcukeg', 'Access-Accept', '2015-11-18 13:00:06'),
(21, 'bonifacekost', 'mwamwaint', 'Access-Accept', '2015-11-18 13:02:03'),
(22, 'widhoh9', 'lembosob', 'Access-Accept', '2015-11-18 13:17:44'),
(23, 'bonifacekosu', 'naodatomi', 'Access-Accept', '2015-11-18 13:26:09'),
(24, 'tuplik7', 'rogpacal', 'Access-Accept', '2015-11-18 13:26:37'),
(25, 'erickiry', 'mwanetint', 'Access-Accept', '2015-11-18 13:38:02'),
(26, 'sasrah5', 'kabnirud', 'Access-Accept', '2015-11-18 13:49:50'),
(27, 'erickirg', 'intmickir', 'Access-Accept', '2015-11-18 23:10:23'),
(28, 'hitrin15', 'sidgerum', 'Access-Accept', '2015-11-18 23:45:35'),
(29, 'ceskiz12', 'litbugur', 'Access-Accept', '2016-05-30 11:13:54'),
(30, 'ceskiz12', 'litbugur', 'Access-Accept', '2016-05-30 12:19:20'),
(31, 'ceskiz12', 'litbugur', 'Access-Accept', '2016-05-30 12:20:05'),
(32, 'nehxar9', 'nimnopok', 'Access-Accept', '2016-05-30 12:32:52'),
(33, 'nehxar9', 'nimnopok', 'Access-Accept', '2016-05-30 12:35:18'),
(34, 'nehxar9', 'nimnopok', 'Access-Accept', '2016-05-30 12:36:39'),
(35, 'kilxeb7', 'doskidop', 'Access-Accept', '2016-08-03 11:28:41');

-- --------------------------------------------------------

--
-- Table structure for table `radreply`
--

CREATE TABLE `radreply` (
  `id` int(11) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `attribute` varchar(32) NOT NULL DEFAULT '',
  `op` char(2) NOT NULL DEFAULT '=',
  `value` varchar(253) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `radreply`
--

INSERT INTO `radreply` (`id`, `username`, `attribute`, `op`, `value`) VALUES
(17, 'joel', 'WISPr-Bandwidth-Max-Down', ':=', '2.048e+06'),
(18, 'joel', 'WISPr-Bandwidth-Max-Up', ':=', '2.048e+06'),
(19, 'joel', 'Idle-Timeout', ':=', '600'),
(20, 'joel', 'Acct-Interim-Interval', ':=', '120'),
(21, 'ken', 'WISPr-Bandwidth-Max-Down', ':=', '2048000'),
(22, 'ken', 'WISPr-Bandwidth-Max-Up', ':=', '512000'),
(23, 'ken', 'Idle-Timeout', ':=', '600'),
(24, 'ken', 'Acct-Interim-Interval', ':=', '120'),
(25, 'demo', 'WISPr-Bandwidth-Max-Down', ':=', '1.024e+06'),
(26, 'demo', 'WISPr-Bandwidth-Max-Up', ':=', '1.024e+06'),
(27, 'demo', 'Idle-Timeout', ':=', '600'),
(28, 'demo', 'Acct-Interim-Interval', ':=', '120');

-- --------------------------------------------------------

--
-- Table structure for table `radusergroup`
--

CREATE TABLE `radusergroup` (
  `username` varchar(64) NOT NULL DEFAULT '',
  `groupname` varchar(64) NOT NULL DEFAULT '',
  `priority` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `radusergroup`
--

INSERT INTO `radusergroup` (`username`, `groupname`, `priority`) VALUES
('simonwai', 'Atomic', 1),
('tracykim', 'Atomic', 1),
('margaretkir', 'Atomic', 1),
('annwan', 'Atomic', 1),
('georgegacs', 'Light One', 1),
('xivdoy13', 'Light One', 1),
('hostan12', 'Demo One', 1),
('wadhov14', 'Onemb', 1),
('hicrel11', 'Onemb', 1),
('macxog13', 'Onemb', 1),
('bonifacekos', 'Atomic', 1),
('bonifacekosm', 'Atomic', 1),
('bonifacekosv', 'Atomic', 1),
('bonifacekosq', 'Atomic', 1),
('bonifacekosu', 'Atomic', 1),
('bonifacekosd', 'Atomic', 1),
('bonifacekosr', 'Atomic', 1),
('preston071', 'Atomic', 1),
('erickir', 'Atomic', 1),
('erickiry', 'Atomic', 1),
('erickrob', 'Light One', 1),
('prestonche', 'Atomic', 1),
('erickrobd', 'Atomic', 1),
('prestonchew', 'Atomic', 1),
('erickirc', 'Atomic', 1),
('erickiru', 'Atomic', 1),
('noddit14', 'Light One', 1),
('cosxem13', 'Onemb', 1),
('towyel15', 'Onemb', 1),
('tuplik7', 'Onemb', 1),
('widhoh9', 'Onemb', 1),
('sasrah5', 'Onemb', 1),
('dodsap5', 'Onemb', 1),
('huvrog13', 'Onemb', 1),
('tikkik11', 'Onemb', 1),
('sewhow10', 'Onemb', 1),
('wugwun12', 'Onemb', 1),
('ruspeg5', 'Onemb', 1),
('yexsuv12', 'Onemb', 1),
('tegzox12', 'Onemb', 1),
('gimpoc12', 'Onemb', 1),
('keybar10', 'Onemb', 1),
('hitrin15', 'Onemb', 1),
('erickirq', 'Atomic', 1),
('erickirv', 'Atomic', 1),
('erickirm', 'Atomic', 1),
('erickirg', 'Atomic', 1),
('liyvev13', '3G', 1),
('ceskiz12', '3G', 1),
('himdib10', 'FreeWIFI', 1),
('wogyom11', 'FreeWIFI', 1),
('vehlar10', 'FreeWIFI', 1),
('raypam14', 'FreeWIFI', 1),
('yukrix11', 'FreeWIFI', 1),
('polyip10', 'FreeWIFI', 1),
('sudhep14', 'FreeWIFI', 1),
('notxez10', 'FreeWIFI', 1),
('cayzew12', 'FreeWIFI', 1),
('nehxar9', 'FreeWIFI', 1),
('kilxeb7', 'Boda', 1),
('nimzax5', 'Boda', 1),
('cilwol8', 'Boda', 1),
('keybul9', 'Boda', 1),
('buxxuv12', 'Boda', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users_groups`
--

CREATE TABLE `users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(3, 1, 1),
(4, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `users_mpesa`
--

CREATE TABLE `users_mpesa` (
  `trans_id` int(11) NOT NULL,
  `receipt` varchar(12) NOT NULL,
  `customer_name` varchar(25) NOT NULL,
  `customer_phone` varchar(15) NOT NULL,
  `time_paid` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT '0',
  `paid_amount` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users_smses`
--

CREATE TABLE `users_smses` (
  `sms_id` int(11) NOT NULL,
  `sms` varchar(300) NOT NULL,
  `sms_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sms_code` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `voucher`
--

CREATE TABLE `voucher` (
  `id` int(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `billingplan` varchar(255) NOT NULL,
  `isprinted` tinyint(1) NOT NULL DEFAULT '0',
  `mobile` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `voucher`
--

INSERT INTO `voucher` (`id`, `username`, `password`, `billingplan`, `isprinted`, `mobile`) VALUES
(33, 'simonwai', 'mickimmut', 'Atomic', 0, '0719393894'),
(34, 'tracykim', 'mutmukthi', 'Atomic', 0, '0719393894'),
(35, 'margaretkir', 'pauthimut', 'Atomic', 0, '0719393894'),
(36, 'annwan', 'erynaoomi', 'Atomic', 0, '0719393894'),
(38, 'georgegacs', 'eridatdat', 'Light One', 0, '0719393894'),
(39, 'xivdoy13', 'dabbusok', 'Light One', 1, '0719393894'),
(40, 'hostan12', 'nekgekor', 'Demo One', 1, '0719393894'),
(41, 'wadhov14', 'tipkomok', 'Onemb', 0, '0719393894'),
(42, 'hicrel11', 'lumkibus', 'Onemb', 1, '0719393894'),
(43, 'macxog13', 'notpumac', 'Onemb', 0, '0719393894'),
(44, 'bonifacekos', 'erynetmuk', 'Atomic', 0, '0719393894'),
(45, 'bonifacekosm', 'erisermic', 'Atomic', 0, '0719393894'),
(46, 'bonifacekosv', 'serintnet', 'Atomic', 0, '0719393894'),
(47, 'bonifacekosq', 'muterypau', 'Atomic', 0, '0719393894'),
(48, 'bonifacekosu', 'naodatomi', 'Atomic', 1, '0719393894'),
(50, 'bonifacekosd', 'mutserkim', 'Atomic', 0, '0719393894'),
(51, 'bonifacekosr', 'naoserery', 'Atomic', 0, '0719393894'),
(52, 'preston071', 'nettraery', 'Atomic', 0, 'on'),
(53, 'erickir', 'netnaomut', 'Atomic', 0, '0719393894'),
(54, 'erickiry', 'mwanetint', 'Atomic', 1, '0719393894'),
(55, 'erickrob', 'uneeriomi', 'Light One', 1, '0722978552'),
(56, 'prestonche', 'naorontra', 'Atomic', 0, 'payplug'),
(57, 'erickrobd', 'kensertra', 'Atomic', 1, '0717353774'),
(58, 'prestonchew', 'thidatomi', 'Atomic', 1, '0719520795'),
(59, 'erickirc', 'sermutmuk', 'Atomic', 0, '0719393894'),
(60, 'erickiru', 'paukirken', 'Atomic', 0, '0719393894'),
(61, 'noddit14', 'lostucad', 'Light One', 1, '0719393894'),
(62, 'cosxem13', 'memkogim', 'Onemb', 1, '0719393894'),
(63, 'towyel15', 'gupcukeg', 'Onemb', 1, '0719393894'),
(64, 'tuplik7', 'rogpacal', 'Onemb', 1, '0719393894'),
(65, 'widhoh9', 'lembosob', 'Onemb', 1, '0719393894'),
(66, 'sasrah5', 'kabnirud', 'Onemb', 1, '0719393894'),
(67, 'dodsap5', 'letpibes', 'Onemb', 1, '0719393894'),
(68, 'huvrog13', 'sesruged', 'Onemb', 0, '0719393894'),
(69, 'tikkik11', 'gopmimic', 'Onemb', 0, '0719393894'),
(70, 'sewhow10', 'memkeren', 'Onemb', 0, '0719393894'),
(71, 'wugwun12', 'depdabeb', 'Onemb', 0, '0719393894'),
(72, 'ruspeg5', 'bocmupac', 'Onemb', 0, '0719393894'),
(73, 'yexsuv12', 'rictigur', 'Onemb', 0, '0719393894'),
(74, 'tegzox12', 'rubcudeg', 'Onemb', 0, '0719393894'),
(75, 'gimpoc12', 'gorgadeg', 'Onemb', 0, '0719393894'),
(76, 'keybar10', 'natnedon', 'Onemb', 0, '0719393894'),
(77, 'hitrin15', 'sidgerum', 'Onemb', 1, '0719393894'),
(78, 'erickirq', 'dattraken', 'Atomic', 0, '0701262410'),
(79, 'erickirv', 'netmicint', 'Atomic', 0, '0701262410'),
(80, 'erickirm', 'kentraser', 'Atomic', 0, '0701262410'),
(81, 'erickirg', 'intmickir', 'Atomic', 1, '0701262410'),
(82, 'liyvev13', 'sagkopib', '3G', 0, '0719393894'),
(83, 'ceskiz12', 'litbugur', '3G', 1, '0719393894'),
(84, 'himdib10', 'sicmomir', 'FreeWIFI', 0, '0719393894'),
(85, 'wogyom11', 'sarkacal', 'FreeWIFI', 0, '0719393894'),
(86, 'vehlar10', 'mudricem', 'FreeWIFI', 0, '0719393894'),
(87, 'raypam14', 'panmacak', 'FreeWIFI', 0, '0719393894'),
(88, 'yukrix11', 'tuslucib', 'FreeWIFI', 0, '0719393894'),
(89, 'polyip10', 'rugkarok', 'FreeWIFI', 1, '0719393894'),
(90, 'sudhep14', 'bunlorig', 'FreeWIFI', 0, '0719393894'),
(91, 'notxez10', 'dobteran', 'FreeWIFI', 0, '0719393894'),
(92, 'cayzew12', 'bessarud', 'FreeWIFI', 0, '0719393894'),
(93, 'nehxar9', 'nimnopok', 'FreeWIFI', 1, '0719393894'),
(94, 'kilxeb7', 'doskidop', 'Boda', 1, '0719393894'),
(95, 'nimzax5', 'kakgitit', 'Boda', 0, '0719393894'),
(96, 'cilwol8', 'rokkadop', 'Boda', 0, '0719393894'),
(97, 'keybul9', 'nucteror', 'Boda', 0, '0719393894'),
(98, 'buxxuv12', 'midradul', 'Boda', 0, '0719393894');

-- --------------------------------------------------------

--
-- Stand-in structure for view `voucher_list`
--
CREATE TABLE `voucher_list` (
`id` int(255)
,`username` varchar(255)
,`password` varchar(255)
,`billingplan` varchar(255)
,`mobile` varchar(15)
,`type` varchar(255)
,`amount` int(255)
,`valid_for` int(11)
,`price` float
,`valid_until` varchar(253)
,`time_used` decimal(37,4)
,`time_remain` varchar(72)
,`packet_used` decimal(46,4)
,`packet_remain` varchar(72)
,`isprinted` tinyint(1)
,`valid` varchar(5)
);

-- --------------------------------------------------------

--
-- Structure for view `postpaid_account_bill`
--
DROP TABLE IF EXISTS `postpaid_account_bill`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `postpaid_account_bill`  AS  select `postpaid_account`.`realname` AS `realname`,`postpaid_account`.`username` AS `username`,`postpaid_account`.`password` AS `password`,`radacct`.`acctstarttime` AS `start`,`radacct`.`acctstoptime` AS `stop`,(`radacct`.`acctsessiontime` / 60) AS `time_used`,((`radacct`.`acctoutputoctets` + `radacct`.`acctinputoctets`) / 1048576) AS `packet_used`,`postpaid_account`.`bill_by` AS `bill_by`,(`postplan`.`price` * (`radacct`.`acctsessiontime` / 60)) AS `time_price`,(`postplan`.`price` * ((`radacct`.`acctoutputoctets` + `radacct`.`acctinputoctets`) / 1048576)) AS `packet_price` from ((`postpaid_account` left join `radacct` on((`postpaid_account`.`username` = `radacct`.`username`))) join `postplan` on((`postplan`.`name` = `postpaid_account`.`bill_by`))) ;

-- --------------------------------------------------------

--
-- Structure for view `postpaid_account_list`
--
DROP TABLE IF EXISTS `postpaid_account_list`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `postpaid_account_list`  AS  select `postpaid_account`.`id` AS `id`,`postpaid_account`.`realname` AS `realname`,`postpaid_account`.`username` AS `username`,`postpaid_account`.`password` AS `password`,(sum(`radacct`.`acctsessiontime`) / 60) AS `time_used`,(sum((`radacct`.`acctoutputoctets` + `radacct`.`acctinputoctets`)) / 1048576) AS `packet_used`,`postpaid_account`.`smsmobile` AS `smsmobile`,`postpaid_account`.`bill_by` AS `bill_by`,(`postplan`.`price` * (sum(`radacct`.`acctsessiontime`) / 60)) AS `time_price`,(`postplan`.`price` * (sum((`radacct`.`acctoutputoctets` + `radacct`.`acctinputoctets`)) / 1048576)) AS `packet_price`,`postpaid_account`.`valid_until` AS `valid_until` from ((`postpaid_account` left join `radacct` on((`postpaid_account`.`username` = `radacct`.`username`))) join `postplan` on((`postplan`.`name` = `postpaid_account`.`bill_by`))) group by `postpaid_account`.`username` ;

-- --------------------------------------------------------

--
-- Structure for view `voucher_list`
--
DROP TABLE IF EXISTS `voucher_list`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `voucher_list`  AS  select `v`.`id` AS `id`,`v`.`username` AS `username`,`v`.`password` AS `password`,`v`.`billingplan` AS `billingplan`,`v`.`mobile` AS `mobile`,`b`.`type` AS `type`,`b`.`amount` AS `amount`,`b`.`valid_for` AS `valid_for`,`b`.`price` AS `price`,`rc`.`value` AS `valid_until`,(sum(`ra`.`acctsessiontime`) / 60) AS `time_used`,if((`b`.`type` = _latin1'time'),(`b`.`amount` - (sum(`ra`.`acctsessiontime`) / 60)),_latin1'null') AS `time_remain`,((sum(`ra`.`acctoutputoctets`) + sum(`ra`.`acctinputoctets`)) / 1048576) AS `packet_used`,if((`b`.`type` = _latin1'packet'),(`b`.`amount` - (sum((`ra`.`acctoutputoctets` + `ra`.`acctinputoctets`)) / 1048576)),_latin1'null') AS `packet_remain`,`v`.`isprinted` AS `isprinted`,if((`b`.`type` = _latin1'time'),if(((sum(`ra`.`acctsessiontime`) / 60) >= `b`.`amount`),_latin1'exp',_latin1'valid'),if((((sum(`ra`.`acctoutputoctets`) + sum(`ra`.`acctinputoctets`)) / 1048576) >= `b`.`amount`),_latin1'exp',_latin1'valid')) AS `valid` from (((`voucher` `v` left join `radacct` `ra` on((`v`.`username` = `ra`.`username`))) join `billingplan` `b` on((`b`.`name` = `v`.`billingplan`))) join `radcheck` `rc` on((`rc`.`username` = `v`.`username`))) where (`rc`.`attribute` = _latin1'Expiration') group by `v`.`username` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auto_contacts`
--
ALTER TABLE `auto_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auto_groups`
--
ALTER TABLE `auto_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auto_macs`
--
ALTER TABLE `auto_macs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auto_setups`
--
ALTER TABLE `auto_setups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `batches`
--
ALTER TABLE `batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `billingplan`
--
ALTER TABLE `billingplan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `checks`
--
ALTER TABLE `checks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- Indexes for table `eryx_news`
--
ALTER TABLE `eryx_news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slug` (`slug`);

--
-- Indexes for table `expiration_account`
--
ALTER TABLE `expiration_account`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expirationplan`
--
ALTER TABLE `expirationplan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fa_country`
--
ALTER TABLE `fa_country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fa_user`
--
ALTER TABLE `fa_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_FI_1` (`country_id`);

--
-- Indexes for table `fa_user_profile`
--
ALTER TABLE `fa_user_profile`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `fa_user_temp`
--
ALTER TABLE `fa_user_temp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_FI_1` (`country_id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `invoice_detail`
--
ALTER TABLE `invoice_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `iptable_rules`
--
ALTER TABLE `iptable_rules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mpesa_clients`
--
ALTER TABLE `mpesa_clients`
  ADD PRIMARY KEY (`clientID`);

--
-- Indexes for table `mpesa_pay`
--
ALTER TABLE `mpesa_pay`
  ADD PRIMARY KEY (`col_id`);

--
-- Indexes for table `na_realms`
--
ALTER TABLE `na_realms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `na_states`
--
ALTER TABLE `na_states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nas`
--
ALTER TABLE `nas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nasname` (`nasname`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `postpaid_account`
--
ALTER TABLE `postpaid_account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `postplan`
--
ALTER TABLE `postplan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profile_realms`
--
ALTER TABLE `profile_realms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `radacct`
--
ALTER TABLE `radacct`
  ADD PRIMARY KEY (`radacctid`),
  ADD KEY `username` (`username`),
  ADD KEY `framedipaddress` (`framedipaddress`),
  ADD KEY `acctsessionid` (`acctsessionid`),
  ADD KEY `acctsessiontime` (`acctsessiontime`),
  ADD KEY `acctuniqueid` (`acctuniqueid`),
  ADD KEY `acctstarttime` (`acctstarttime`),
  ADD KEY `acctstoptime` (`acctstoptime`),
  ADD KEY `nasipaddress` (`nasipaddress`);

--
-- Indexes for table `radcheck`
--
ALTER TABLE `radcheck`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`(32));

--
-- Indexes for table `radgroupcheck`
--
ALTER TABLE `radgroupcheck`
  ADD PRIMARY KEY (`id`),
  ADD KEY `groupname` (`groupname`(32));

--
-- Indexes for table `radgroupreply`
--
ALTER TABLE `radgroupreply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `groupname` (`groupname`(32));

--
-- Indexes for table `radpostauth`
--
ALTER TABLE `radpostauth`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `radreply`
--
ALTER TABLE `radreply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`(32));

--
-- Indexes for table `radusergroup`
--
ALTER TABLE `radusergroup`
  ADD KEY `username` (`username`(32));

--
-- Indexes for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  ADD KEY `fk_users_groups_users1_idx` (`user_id`),
  ADD KEY `fk_users_groups_groups1_idx` (`group_id`);

--
-- Indexes for table `users_mpesa`
--
ALTER TABLE `users_mpesa`
  ADD PRIMARY KEY (`trans_id`),
  ADD KEY `receipt` (`receipt`);

--
-- Indexes for table `users_smses`
--
ALTER TABLE `users_smses`
  ADD PRIMARY KEY (`sms_id`),
  ADD KEY `sms_code` (`sms_code`);

--
-- Indexes for table `voucher`
--
ALTER TABLE `voucher`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `billingplan`
--
ALTER TABLE `billingplan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `eryx_news`
--
ALTER TABLE `eryx_news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `expiration_account`
--
ALTER TABLE `expiration_account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `expirationplan`
--
ALTER TABLE `expirationplan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `fa_country`
--
ALTER TABLE `fa_country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240;
--
-- AUTO_INCREMENT for table `fa_user`
--
ALTER TABLE `fa_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `fa_user_temp`
--
ALTER TABLE `fa_user_temp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `invoice_detail`
--
ALTER TABLE `invoice_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;
--
-- AUTO_INCREMENT for table `mpesa_clients`
--
ALTER TABLE `mpesa_clients`
  MODIFY `clientID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `mpesa_pay`
--
ALTER TABLE `mpesa_pay`
  MODIFY `col_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `nas`
--
ALTER TABLE `nas`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `postpaid_account`
--
ALTER TABLE `postpaid_account`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `radacct`
--
ALTER TABLE `radacct`
  MODIFY `radacctid` bigint(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `radcheck`
--
ALTER TABLE `radcheck`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=154;
--
-- AUTO_INCREMENT for table `radgroupcheck`
--
ALTER TABLE `radgroupcheck`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT for table `radgroupreply`
--
ALTER TABLE `radgroupreply`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `radpostauth`
--
ALTER TABLE `radpostauth`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `radreply`
--
ALTER TABLE `radreply`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `users_mpesa`
--
ALTER TABLE `users_mpesa`
  MODIFY `trans_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users_smses`
--
ALTER TABLE `users_smses`
  MODIFY `sms_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `voucher`
--
ALTER TABLE `voucher`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;
