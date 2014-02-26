-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 25, 2014 at 12:17 PM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `osclass`
--
CREATE DATABASE IF NOT EXISTS `osclass` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `osclass`;

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_admin`
--

CREATE TABLE IF NOT EXISTS `oc_t_admin` (
  `pk_i_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `s_name` varchar(100) NOT NULL,
  `s_username` varchar(40) NOT NULL,
  `s_password` char(60) NOT NULL,
  `s_email` varchar(100) DEFAULT NULL,
  `s_secret` varchar(40) DEFAULT NULL,
  `b_moderator` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pk_i_id`),
  UNIQUE KEY `s_username` (`s_username`),
  UNIQUE KEY `s_email` (`s_email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `oc_t_admin`
--

INSERT INTO `oc_t_admin` (`pk_i_id`, `s_name`, `s_username`, `s_password`, `s_email`, `s_secret`, `b_moderator`) VALUES
(1, 'Administrator', 'admin', '$2y$15$6/ePtOyTuKpN8GClnC0.MeLErXa9qSlAyo.BLrlJJ0lnvq1XWHaIS', 'admin@usahatani.com', 'VibNxvH1', 0),
(2, 'mod1', 'mod1', '$2y$15$DLVuBoVpY41ACasXPQrQ5.oejatVuM5b5w.QXa8U0U5GEY2JiARYq', 'mod1@usahatani.com', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_alerts`
--

CREATE TABLE IF NOT EXISTS `oc_t_alerts` (
  `pk_i_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `s_email` varchar(100) DEFAULT NULL,
  `fk_i_user_id` int(10) unsigned DEFAULT NULL,
  `s_search` longtext,
  `s_secret` varchar(40) DEFAULT NULL,
  `b_active` tinyint(1) NOT NULL DEFAULT '0',
  `e_type` enum('INSTANT','HOURLY','DAILY','WEEKLY','CUSTOM') NOT NULL,
  `dt_date` datetime DEFAULT NULL,
  `dt_unsub_date` datetime DEFAULT NULL,
  PRIMARY KEY (`pk_i_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_alerts_sent`
--

CREATE TABLE IF NOT EXISTS `oc_t_alerts_sent` (
  `d_date` date NOT NULL,
  `i_num_alerts_sent` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`d_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_ban_rule`
--

CREATE TABLE IF NOT EXISTS `oc_t_ban_rule` (
  `pk_i_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `s_name` varchar(250) NOT NULL DEFAULT '',
  `s_ip` varchar(50) NOT NULL DEFAULT '',
  `s_email` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`pk_i_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_category`
--

CREATE TABLE IF NOT EXISTS `oc_t_category` (
  `pk_i_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_i_parent_id` int(10) unsigned DEFAULT NULL,
  `i_expiration_days` int(3) unsigned NOT NULL DEFAULT '0',
  `i_position` int(2) unsigned NOT NULL DEFAULT '0',
  `b_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `b_price_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `s_icon` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`pk_i_id`),
  KEY `fk_i_parent_id` (`fk_i_parent_id`),
  KEY `i_position` (`i_position`),
  KEY `fk_i_parent_id_2` (`fk_i_parent_id`),
  KEY `i_position_2` (`i_position`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=108 ;

--
-- Dumping data for table `oc_t_category`
--

INSERT INTO `oc_t_category` (`pk_i_id`, `fk_i_parent_id`, `i_expiration_days`, `i_position`, `b_enabled`, `b_price_enabled`, `s_icon`) VALUES
(96, NULL, 0, 1, 1, 1, NULL),
(97, NULL, 0, 0, 1, 1, NULL),
(98, NULL, 0, 2, 1, 1, NULL),
(99, 97, 0, 1, 1, 1, NULL),
(100, 97, 0, 0, 1, 1, NULL),
(101, 97, 0, 3, 1, 1, NULL),
(102, 97, 0, 2, 1, 1, NULL),
(103, 97, 0, 4, 1, 1, NULL),
(104, 96, 0, 0, 1, 1, NULL),
(105, 96, 0, 1, 1, 1, NULL),
(106, 98, 0, 0, 1, 1, NULL),
(107, 98, 0, 1, 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_category_description`
--

CREATE TABLE IF NOT EXISTS `oc_t_category_description` (
  `fk_i_category_id` int(10) unsigned NOT NULL,
  `fk_c_locale_code` char(5) NOT NULL,
  `s_name` varchar(100) DEFAULT NULL,
  `s_description` text,
  `s_slug` varchar(100) NOT NULL,
  PRIMARY KEY (`fk_i_category_id`,`fk_c_locale_code`),
  KEY `idx_s_slug` (`s_slug`),
  KEY `fk_c_locale_code` (`fk_c_locale_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_t_category_description`
--

INSERT INTO `oc_t_category_description` (`fk_i_category_id`, `fk_c_locale_code`, `s_name`, `s_description`, `s_slug`) VALUES
(96, 'id_ID', 'Peternakan', '', 'peternakan'),
(97, 'id_ID', 'Pertanian', '', 'pertanian'),
(98, 'id_ID', 'Perikanan', '', 'perikanan'),
(99, 'id_ID', 'Sayuran', '', 'sayuran'),
(100, 'id_ID', 'Benih Tanaman', '', 'benih-tanaman'),
(101, 'id_ID', 'Buah-buahan', '', 'buah-buahan'),
(102, 'id_ID', 'Bunga Hias', '', 'bunga-hias'),
(103, 'id_ID', 'Pohon Keras', '', 'pohon-keras'),
(104, 'id_ID', 'Unggas', '', 'unggas'),
(105, 'id_ID', 'Sapi, Kambing, Domba, Kerbau ', 'Sapi, Kambing, Domba, Kerbau ', 'sapi-kambing-domba-kerbau'),
(106, 'id_ID', 'Ikan Darat', '', 'ikan-darat'),
(107, 'id_ID', 'Ikan Laut', '', 'ikan-laut');

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_category_stats`
--

CREATE TABLE IF NOT EXISTS `oc_t_category_stats` (
  `fk_i_category_id` int(10) unsigned NOT NULL,
  `i_num_items` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fk_i_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_t_category_stats`
--

INSERT INTO `oc_t_category_stats` (`fk_i_category_id`, `i_num_items`) VALUES
(96, 0),
(97, 2),
(98, 0),
(99, 0),
(100, 1),
(101, 1),
(102, 0),
(103, 0),
(104, 0),
(105, 0),
(106, 0),
(107, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_city`
--

CREATE TABLE IF NOT EXISTS `oc_t_city` (
  `pk_i_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_i_region_id` int(10) unsigned NOT NULL,
  `s_name` varchar(60) NOT NULL,
  `s_slug` varchar(60) NOT NULL DEFAULT '',
  `fk_c_country_code` char(2) DEFAULT NULL,
  `b_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`pk_i_id`),
  KEY `fk_i_region_id` (`fk_i_region_id`),
  KEY `idx_s_name` (`s_name`),
  KEY `idx_s_slug` (`s_slug`),
  KEY `fk_c_country_code` (`fk_c_country_code`),
  KEY `fk_i_region_id_2` (`fk_i_region_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=274631 ;

--
-- Dumping data for table `oc_t_city`
--

INSERT INTO `oc_t_city` (`pk_i_id`, `fk_i_region_id`, `s_name`, `s_slug`, `fk_c_country_code`, `b_active`) VALUES
(274165, 781431, 'Aceh Besar', '', 'id', 1),
(274166, 781431, 'Aceh Jaya', '', 'id', 1),
(274167, 781431, 'Aceh Singkil', '', 'id', 1),
(274168, 781431, 'Aceh Tamiang', '', 'id', 1),
(274169, 781431, 'Bener Meriah', '', 'id', 1),
(274170, 781431, 'Bireuën', '', 'id', 1),
(274171, 781431, 'Central Aceh', '', 'id', 1),
(274172, 781431, 'East Aceh', '', 'id', 1),
(274173, 781431, 'Gayo Lues', '', 'id', 1),
(274174, 781431, 'Nagan Raya', '', 'id', 1),
(274175, 781431, 'North Aceh', '', 'id', 1),
(274176, 781431, 'Pidie', '', 'id', 1),
(274177, 781431, 'Pidie Jaya', '', 'id', 1),
(274178, 781431, 'Simeulue', '', 'id', 1),
(274179, 781431, 'South Aceh', '', 'id', 1),
(274180, 781431, 'Southeast Aceh', '', 'id', 1),
(274181, 781431, 'Southwest Aceh', '', 'id', 1),
(274182, 781431, 'West Aceh', '', 'id', 1),
(274183, 781431, 'Banda Aceh', '', 'id', 1),
(274184, 781431, 'Langsa', '', 'id', 1),
(274185, 781431, 'Lhokseumawe', '', 'id', 1),
(274186, 781431, 'Sabang', '', 'id', 1),
(274187, 781431, 'Subulussalam', '', 'id', 1),
(274188, 781432, 'Badung', '', 'id', 1),
(274189, 781432, 'Bangli', '', 'id', 1),
(274190, 781432, 'Buleleng', '', 'id', 1),
(274191, 781432, 'Gianyar', '', 'id', 1),
(274192, 781432, 'Jembrana', '', 'id', 1),
(274193, 781432, 'Karangasem', '', 'id', 1),
(274194, 781432, 'Klungkung', '', 'id', 1),
(274195, 781432, 'Tabanan', '', 'id', 1),
(274196, 781432, 'Denpasar', '', 'id', 1),
(274197, 781433, 'Bangka', '', 'id', 1),
(274198, 781433, 'Belitung', '', 'id', 1),
(274199, 781433, 'Central Bangka', '', 'id', 1),
(274200, 781433, 'East Belitung', '', 'id', 1),
(274201, 781433, 'South Bangka', '', 'id', 1),
(274202, 781433, 'West Bangka', '', 'id', 1),
(274203, 781433, 'Pangkal Pinang', '', 'id', 1),
(274204, 781434, 'Lebak', '', 'id', 1),
(274205, 781434, 'Pandeglang', '', 'id', 1),
(274206, 781434, 'Serang', '', 'id', 1),
(274207, 781434, 'Cilegon', '', 'id', 1),
(274208, 781434, 'South Tangerang', '', 'id', 1),
(274209, 781434, 'Tangerang', '', 'id', 1),
(274210, 781435, 'Central Bengkulu', '', 'id', 1),
(274211, 781435, 'Kaur', '', 'id', 1),
(274212, 781435, 'Kepahiang', '', 'id', 1),
(274213, 781435, 'Lebong', '', 'id', 1),
(274214, 781435, 'Muko-Muko', '', 'id', 1),
(274215, 781435, 'North Bengkulu', '', 'id', 1),
(274216, 781435, 'Rejang Lebong', '', 'id', 1),
(274217, 781435, 'Seluma', '', 'id', 1),
(274218, 781435, 'South Bengkulu', '', 'id', 1),
(274219, 781435, 'Bengkulu', '', 'id', 1),
(274220, 781436, 'Banjarnegara', '', 'id', 1),
(274221, 781436, 'Banyumas', '', 'id', 1),
(274222, 781436, 'Batang', '', 'id', 1),
(274223, 781436, 'Blora Regency', '', 'id', 1),
(274224, 781436, 'Boyolali', '', 'id', 1),
(274225, 781436, 'Brebes', '', 'id', 1),
(274226, 781436, 'Cilacap', '', 'id', 1),
(274227, 781436, 'Demak', '', 'id', 1),
(274228, 781436, 'Grobogan', '', 'id', 1),
(274229, 781436, 'Jepara', '', 'id', 1),
(274230, 781436, 'Karanganyar', '', 'id', 1),
(274231, 781436, 'Kebumen', '', 'id', 1),
(274232, 781436, 'Kendal', '', 'id', 1),
(274233, 781436, 'Klaten', '', 'id', 1),
(274234, 781436, 'Magelang', '', 'id', 1),
(274235, 781436, 'Pati', '', 'id', 1),
(274236, 781436, 'Pekalongan', '', 'id', 1),
(274237, 781436, 'Pemalang', '', 'id', 1),
(274238, 781436, 'Purbalingga', '', 'id', 1),
(274239, 781436, 'Purworejo', '', 'id', 1),
(274240, 781436, 'Rembang', '', 'id', 1),
(274241, 781436, 'Semarang', '', 'id', 1),
(274242, 781436, 'Sragen', '', 'id', 1),
(274243, 781436, 'Sukoharjo', '', 'id', 1),
(274244, 781436, 'Tegal', '', 'id', 1),
(274245, 781436, 'Temanggung', '', 'id', 1),
(274246, 781436, 'Wonogiri', '', 'id', 1),
(274247, 781436, 'Wonosobo', '', 'id', 1),
(274248, 781436, 'Surakarta', '', 'id', 1),
(274249, 781436, 'Salatiga', '', 'id', 1),
(274250, 781436, 'Kudus', '', 'id', 1),
(274251, 781437, 'East Barito', '', 'id', 1),
(274252, 781437, 'East Kotawaringin', '', 'id', 1),
(274253, 781437, 'Gunung Mas', '', 'id', 1),
(274254, 781437, 'Kapuas', '', 'id', 1),
(274255, 781437, 'Katingan', '', 'id', 1),
(274256, 781437, 'Lamandau', '', 'id', 1),
(274257, 781437, 'Murung Raya', '', 'id', 1),
(274258, 781437, 'North Barito', '', 'id', 1),
(274259, 781437, 'Pulang Pisang', '', 'id', 1),
(274260, 781437, 'Sukamara', '', 'id', 1),
(274261, 781437, 'Seruyan', '', 'id', 1),
(274262, 781437, 'South Barito', '', 'id', 1),
(274263, 781437, 'West Kotawaringin', '', 'id', 1),
(274264, 781437, 'Palangkaraya', '', 'id', 1),
(274265, 781438, 'Banggai', '', 'id', 1),
(274266, 781438, 'Banggai Islands', '', 'id', 1),
(274267, 781438, 'Buol', '', 'id', 1),
(274268, 781438, 'Donggala', '', 'id', 1),
(274269, 781438, 'Morowali', '', 'id', 1),
(274270, 781438, 'Parigi Moutong', '', 'id', 1),
(274271, 781438, 'Poso', '', 'id', 1),
(274272, 781438, 'Sigi', '', 'id', 1),
(274273, 781438, 'Tojo Una-Una', '', 'id', 1),
(274274, 781438, 'Toli-Toli', '', 'id', 1),
(274275, 781438, 'Palu', '', 'id', 1),
(274276, 781439, 'Bangkalan Regency', '', 'id', 1),
(274277, 781439, 'Banyuwangi', '', 'id', 1),
(274278, 781439, 'Blitar', '', 'id', 1),
(274279, 781439, 'Bojonegoro', '', 'id', 1),
(274280, 781439, 'Bondowoso', '', 'id', 1),
(274281, 781439, 'Gresik', '', 'id', 1),
(274282, 781439, 'Jember', '', 'id', 1),
(274283, 781439, 'Jombang', '', 'id', 1),
(274284, 781439, 'Kediri', '', 'id', 1),
(274285, 781439, 'Lamongan', '', 'id', 1),
(274286, 781439, 'Lumajang', '', 'id', 1),
(274287, 781439, 'Madiun', '', 'id', 1),
(274288, 781439, 'Magetan', '', 'id', 1),
(274289, 781439, 'Malang', '', 'id', 1),
(274290, 781439, 'Mojokerto', '', 'id', 1),
(274291, 781439, 'Ngawi Regency', '', 'id', 1),
(274292, 781439, 'Pacitan', '', 'id', 1),
(274293, 781439, 'Pasuruan', '', 'id', 1),
(274294, 781439, 'Ponorogo', '', 'id', 1),
(274295, 781439, 'Probolinggo', '', 'id', 1),
(274296, 781439, 'Sampang', '', 'id', 1),
(274297, 781439, 'Sidoarjo', '', 'id', 1),
(274298, 781439, 'Situbondo', '', 'id', 1),
(274299, 781439, 'Sumenep', '', 'id', 1),
(274300, 781439, 'Trenggalek', '', 'id', 1),
(274301, 781439, 'Tuban', '', 'id', 1),
(274302, 781439, 'Tulungagung', '', 'id', 1),
(274303, 781439, 'Batu', '', 'id', 1),
(274304, 781439, 'Surabaya', '', 'id', 1),
(274305, 781439, 'Nganjuk', '', 'id', 1),
(274306, 781439, 'Pamekasan', '', 'id', 1),
(274307, 781440, 'Berau', '', 'id', 1),
(274308, 781440, 'Bulungan', '', 'id', 1),
(274309, 781440, 'East Kutai', '', 'id', 1),
(274310, 781440, 'Kutai Kartanegara', '', 'id', 1),
(274311, 781440, 'Malinau', '', 'id', 1),
(274312, 781440, 'North Penajam Paser', '', 'id', 1),
(274313, 781440, 'Nunukan', '', 'id', 1),
(274314, 781440, 'Paser', '', 'id', 1),
(274315, 781440, 'Tana Tidung', '', 'id', 1),
(274316, 781440, 'West Kutai', '', 'id', 1),
(274317, 781440, 'Tarakan', '', 'id', 1),
(274318, 781440, 'Bontang', '', 'id', 1),
(274319, 781440, 'Samarinda', '', 'id', 1),
(274320, 781440, 'Balikpapan', '', 'id', 1),
(274321, 781441, 'Alor', '', 'id', 1),
(274322, 781441, 'Belu', '', 'id', 1),
(274323, 781441, 'Central Sumba', '', 'id', 1),
(274324, 781441, 'East Flores', '', 'id', 1),
(274325, 781441, 'East Manggarai', '', 'id', 1),
(274326, 781441, 'East Sumba', '', 'id', 1),
(274327, 781441, 'Ende', '', 'id', 1),
(274328, 781441, 'Kupang', '', 'id', 1),
(274329, 781441, 'Lembata', '', 'id', 1),
(274330, 781441, 'Manggarai', '', 'id', 1),
(274331, 781441, 'Nagekeo', '', 'id', 1),
(274332, 781441, 'Ngada', '', 'id', 1),
(274333, 781441, 'North Central Timor', '', 'id', 1),
(274334, 781441, 'Rote Ndao', '', 'id', 1),
(274335, 781441, 'Sabu Raijua', '', 'id', 1),
(274336, 781441, 'Sikka', '', 'id', 1),
(274337, 781441, 'South Central Timor', '', 'id', 1),
(274338, 781441, 'Southwest Sumba', '', 'id', 1),
(274339, 781441, 'West Manggarai', '', 'id', 1),
(274340, 781441, 'West Sumba', '', 'id', 1),
(274341, 781442, 'Boalemo', '', 'id', 1),
(274342, 781442, 'Bone Bolango', '', 'id', 1),
(274343, 781442, 'Gorontalo', '', 'id', 1),
(274344, 781442, 'North Gorontalo', '', 'id', 1),
(274345, 781442, 'Pahuwato', '', 'id', 1),
(274346, 781443, 'Seribu Islands', '', 'id', 1),
(274347, 781443, 'Jakarta', '', 'id', 1),
(274348, 781444, 'Batang Hari', '', 'id', 1),
(274349, 781444, 'Bungo', '', 'id', 1),
(274350, 781444, 'Kerinci', '', 'id', 1),
(274351, 781444, 'Merangin', '', 'id', 1),
(274352, 781444, 'Muaro Jambi', '', 'id', 1),
(274353, 781444, 'Sarolangun', '', 'id', 1),
(274354, 781444, 'East Tanjung Jabung', '', 'id', 1),
(274355, 781444, 'West Tanjung Jabung', '', 'id', 1),
(274356, 781444, 'Tebo', '', 'id', 1),
(274357, 781444, 'Jambi', '', 'id', 1),
(274358, 781444, 'Sungai Penuh', '', 'id', 1),
(274359, 781445, 'Central Lampung', '', 'id', 1),
(274360, 781445, 'East Lampung', '', 'id', 1),
(274361, 781445, 'Mesuji', '', 'id', 1),
(274362, 781445, 'North Lampung', '', 'id', 1),
(274363, 781445, 'Pesawaran', '', 'id', 1),
(274364, 781445, 'Pringsewu', '', 'id', 1),
(274365, 781445, 'South Lampung', '', 'id', 1),
(274366, 781445, 'Tanggamus', '', 'id', 1),
(274367, 781445, 'Tulang Bawang', '', 'id', 1),
(274368, 781445, 'Way Kanan', '', 'id', 1),
(274369, 781445, 'West Lampung', '', 'id', 1),
(274370, 781445, 'West Tulang Bawang', '', 'id', 1),
(274371, 781445, 'Metro', '', 'id', 1),
(274372, 781445, 'Bandar Lampung', '', 'id', 1),
(274373, 781446, 'Aru Islands', '', 'id', 1),
(274374, 781446, 'Buru', '', 'id', 1),
(274375, 781446, 'Central Maluku', '', 'id', 1),
(274376, 781446, 'Eastern Seram', '', 'id', 1),
(274377, 781446, 'South Buru', '', 'id', 1),
(274378, 781446, 'Southeast Maluku', '', 'id', 1),
(274379, 781446, 'Southwest Maluku', '', 'id', 1),
(274380, 781446, 'Western Seram', '', 'id', 1),
(274381, 781446, 'Western Southeast Maluku', '', 'id', 1),
(274382, 781446, 'Ambon', '', 'id', 1),
(274383, 781446, 'Tual', '', 'id', 1),
(274384, 781447, 'Central Halmahera', '', 'id', 1),
(274385, 781447, 'East Halmahera', '', 'id', 1),
(274386, 781447, 'Morotai Islands', '', 'id', 1),
(274387, 781447, 'North Halmahera', '', 'id', 1),
(274388, 781447, 'South Halmahera', '', 'id', 1),
(274389, 781447, 'Sula Islands', '', 'id', 1),
(274390, 781447, 'West Halmahera', '', 'id', 1),
(274391, 781447, 'Ternate', '', 'id', 1),
(274392, 781447, 'Tidore Islands', '', 'id', 1),
(274393, 781448, 'Bolaang Mongondow Regency', '', 'id', 1),
(274394, 781448, 'East Bolaang Mongondow Regency', '', 'id', 1),
(274395, 781448, 'Minahasa Regency', '', 'id', 1),
(274396, 781448, 'North Bolaang Mongondow Regency', '', 'id', 1),
(274397, 781448, 'North Minahasa Regency', '', 'id', 1),
(274398, 781448, 'Sangihe Islands Regency', '', 'id', 1),
(274399, 781448, 'Sitaro Islands Regency', '', 'id', 1),
(274400, 781448, 'South Bolaang Mongondow Regency', '', 'id', 1),
(274401, 781448, 'South Minahasa Regency', '', 'id', 1),
(274402, 781448, 'Southeast Minahasa Regency', '', 'id', 1),
(274403, 781448, 'Talaud Islands Regency', '', 'id', 1),
(274404, 781448, 'Bitung', '', 'id', 1),
(274405, 781448, 'Kotamobagu', '', 'id', 1),
(274406, 781448, 'Tomohon', '', 'id', 1),
(274407, 781448, 'Manado', '', 'id', 1),
(274408, 781449, 'Asahan', '', 'id', 1),
(274409, 781449, 'Batubara', '', 'id', 1),
(274410, 781449, 'Central Tapanuli', '', 'id', 1),
(274411, 781449, 'Dairi', '', 'id', 1),
(274412, 781449, 'Humbang Hasundutan', '', 'id', 1),
(274413, 781449, 'Karo', '', 'id', 1),
(274414, 781449, 'Labuhan Batu', '', 'id', 1),
(274415, 781449, 'Langkat', '', 'id', 1),
(274416, 781449, 'Mandailing Natal', '', 'id', 1),
(274417, 781449, 'Nias', '', 'id', 1),
(274418, 781449, 'North Labuhan Batu', '', 'id', 1),
(274419, 781449, 'North Nias', '', 'id', 1),
(274420, 781449, 'North Padang Lawas', '', 'id', 1),
(274421, 781449, 'North Tapanuli', '', 'id', 1),
(274422, 781449, 'Padang Lawas', '', 'id', 1),
(274423, 781449, 'Pakpak Bharat', '', 'id', 1),
(274424, 781449, 'Samosir', '', 'id', 1),
(274425, 781449, 'Serdang Bedagai', '', 'id', 1),
(274426, 781449, 'Simalungun', '', 'id', 1),
(274427, 781449, 'South Labuhan Batu', '', 'id', 1),
(274428, 781449, 'South Nias', '', 'id', 1),
(274429, 781449, 'South Tapanuli', '', 'id', 1),
(274430, 781449, 'Toba Samosir', '', 'id', 1),
(274431, 781449, 'West Nias', '', 'id', 1),
(274432, 781449, 'Binjai', '', 'id', 1),
(274433, 781449, 'Gunungsitoli', '', 'id', 1),
(274434, 781449, 'Medan', '', 'id', 1),
(274435, 781449, 'Padang Sidempuan', '', 'id', 1),
(274436, 781449, 'Sibolga', '', 'id', 1),
(274437, 781449, 'Tanjung Balai', '', 'id', 1),
(274438, 781449, 'Tebing Tinggi', '', 'id', 1),
(274439, 781449, 'Pematangsiantar', '', 'id', 1),
(274440, 781449, 'Deli Serdang', '', 'id', 1),
(274441, 781450, 'Asmat', '', 'id', 1),
(274442, 781450, 'Biak Numfor', '', 'id', 1),
(274443, 781450, 'Boven Digoel', '', 'id', 1),
(274444, 781450, 'Central Mamberamo', '', 'id', 1),
(274445, 781450, 'Deiyai', '', 'id', 1),
(274446, 781450, 'Dogiyai', '', 'id', 1),
(274447, 781450, 'Intan Jaya', '', 'id', 1),
(274448, 781450, 'Jayawijaya', '', 'id', 1),
(274449, 781450, 'Keerom', '', 'id', 1),
(274450, 781450, 'Lanny Jaya', '', 'id', 1),
(274451, 781450, 'Mamberamo Jaya', '', 'id', 1),
(274452, 781450, 'Mappi', '', 'id', 1),
(274453, 781450, 'Merauke', '', 'id', 1),
(274454, 781450, 'Mimika', '', 'id', 1),
(274455, 781450, 'Nabire', '', 'id', 1),
(274456, 781450, 'Nduga', '', 'id', 1),
(274457, 781450, 'Paniai', '', 'id', 1),
(274458, 781450, 'Bintang Mountains', '', 'id', 1),
(274459, 781450, 'Puncak', '', 'id', 1),
(274460, 781450, 'Puncak Jaya', '', 'id', 1),
(274461, 781450, 'Sarmi', '', 'id', 1),
(274462, 781450, 'Supiori', '', 'id', 1),
(274463, 781450, 'Tolikara', '', 'id', 1),
(274464, 781450, 'Waropen', '', 'id', 1),
(274465, 781450, 'Yahukimo', '', 'id', 1),
(274466, 781450, 'Yalimo', '', 'id', 1),
(274467, 781450, 'Yapen Islands', '', 'id', 1),
(274468, 781450, 'Jayapura', '', 'id', 1),
(274469, 781451, 'Bengkalis Regency', '', 'id', 1),
(274470, 781451, 'Indragiri Hilir', '', 'id', 1),
(274471, 781451, 'Indragiri Hulu Regency', '', 'id', 1),
(274472, 781451, 'Kampar Regency', '', 'id', 1),
(274473, 781451, 'Kuantan Singingi', '', 'id', 1),
(274474, 781451, 'Meranti Islands', '', 'id', 1),
(274475, 781451, 'Pelalawan', '', 'id', 1),
(274476, 781451, 'Rokan Hulu', '', 'id', 1),
(274477, 781451, 'Rokan Hilir', '', 'id', 1),
(274478, 781451, 'Siak Regency', '', 'id', 1),
(274479, 781451, 'Dumai', '', 'id', 1),
(274480, 781451, 'Pekanbaru', '', 'id', 1),
(274481, 781452, 'Anambas Islands', '', 'id', 1),
(274482, 781452, 'Bintan', '', 'id', 1),
(274483, 781452, 'Karimun', '', 'id', 1),
(274484, 781452, 'Lingga', '', 'id', 1),
(274485, 781452, 'Natuna', '', 'id', 1),
(274486, 781452, 'Batam', '', 'id', 1),
(274487, 781452, 'Tanjung Pinang', '', 'id', 1),
(274488, 781453, 'Bombana', '', 'id', 1),
(274489, 781453, 'Buton', '', 'id', 1),
(274490, 781453, 'Kolaka', '', 'id', 1),
(274491, 781453, 'Konawe', '', 'id', 1),
(274492, 781453, 'Muna', '', 'id', 1),
(274493, 781453, 'North Buton', '', 'id', 1),
(274494, 781453, 'North Kolaka', '', 'id', 1),
(274495, 781453, 'North Konawe', '', 'id', 1),
(274496, 781453, 'South Konawe', '', 'id', 1),
(274497, 781453, 'Wakatobi', '', 'id', 1),
(274498, 781453, 'Bau-Bau', '', 'id', 1),
(274499, 781453, 'Kendari', '', 'id', 1),
(274500, 781454, 'Balangan', '', 'id', 1),
(274501, 781454, 'Banjar', '', 'id', 1),
(274502, 781454, 'Barito Kuala', '', 'id', 1),
(274503, 781454, 'Central Hulu Sungai', '', 'id', 1),
(274504, 781454, 'Kotabaru', '', 'id', 1),
(274505, 781454, 'North Hulu Sungai', '', 'id', 1),
(274506, 781454, 'South Hulu Sungai', '', 'id', 1),
(274507, 781454, 'Tabalong', '', 'id', 1),
(274508, 781454, 'Tanah Laut', '', 'id', 1),
(274509, 781454, 'Tanah Bumbu', '', 'id', 1),
(274510, 781454, 'Tapin', '', 'id', 1),
(274511, 781454, 'Banjarbaru', '', 'id', 1),
(274512, 781454, 'Banjarmasin', '', 'id', 1),
(274513, 781455, 'Bantaeng', '', 'id', 1),
(274514, 781455, 'Barru', '', 'id', 1),
(274515, 781455, 'Bone', '', 'id', 1),
(274516, 781455, 'Bulukumba', '', 'id', 1),
(274517, 781455, 'East Luwu', '', 'id', 1),
(274518, 781455, 'Enrekang', '', 'id', 1),
(274519, 781455, 'Gowa', '', 'id', 1),
(274520, 781455, 'Jeneponto', '', 'id', 1),
(274521, 781455, 'Luwu', '', 'id', 1),
(274522, 781455, 'North Luwu', '', 'id', 1),
(274523, 781455, 'Maros', '', 'id', 1),
(274524, 781455, 'Pangkajene Islands', '', 'id', 1),
(274525, 781455, 'Pinrang', '', 'id', 1),
(274526, 781455, 'Selayar Islands', '', 'id', 1),
(274527, 781455, 'Sidenreng Rappang', '', 'id', 1),
(274528, 781455, 'Soppeng', '', 'id', 1),
(274529, 781455, 'Takalar', '', 'id', 1),
(274530, 781455, 'Tana Toraja', '', 'id', 1),
(274531, 781455, 'Wajo', '', 'id', 1),
(274532, 781455, 'Palopo', '', 'id', 1),
(274533, 781455, 'Pare-Pare', '', 'id', 1),
(274534, 781455, 'Sinjai', '', 'id', 1),
(274535, 781455, 'Makassar', '', 'id', 1),
(274536, 781456, 'Banyuasin', '', 'id', 1),
(274537, 781456, 'East Ogan Komering Ulu', '', 'id', 1),
(274538, 781456, 'Empat Lawang', '', 'id', 1),
(274539, 781456, 'Muarama Enim', '', 'id', 1),
(274540, 781456, 'Musi Banyuasin', '', 'id', 1),
(274541, 781456, 'Musi Rawas', '', 'id', 1),
(274542, 781456, 'Ogan Ilir', '', 'id', 1),
(274543, 781456, 'Ogan Komering Ilir', '', 'id', 1),
(274544, 781456, 'Ogan Komering Ulu', '', 'id', 1),
(274545, 781456, 'South Ogan Komering Ulu', '', 'id', 1),
(274546, 781456, 'Pagar Alam', '', 'id', 1),
(274547, 781456, 'Palembang', '', 'id', 1),
(274548, 781456, 'Lahat', '', 'id', 1),
(274549, 781456, 'Prabumulih', '', 'id', 1),
(274550, 781456, 'Lubuklinggau', '', 'id', 1),
(274551, 781457, 'Bandung', '', 'id', 1),
(274552, 781457, 'Bekasi', '', 'id', 1),
(274553, 781457, 'Bogor', '', 'id', 1),
(274554, 781457, 'Ciamis', '', 'id', 1),
(274555, 781457, 'Cianjur', '', 'id', 1),
(274556, 781457, 'Cirebon', '', 'id', 1),
(274557, 781457, 'Garut', '', 'id', 1),
(274558, 781457, 'Karawang', '', 'id', 1),
(274559, 781457, 'Kuningan', '', 'id', 1),
(274560, 781457, 'Subang', '', 'id', 1),
(274561, 781457, 'Sukabumi', '', 'id', 1),
(274562, 781457, 'Sumedang', '', 'id', 1),
(274563, 781457, 'West Bandung', '', 'id', 1),
(274564, 781457, 'Banjar', '', 'id', 1),
(274565, 781457, 'Cimahi', '', 'id', 1),
(274566, 781457, 'Depok', '', 'id', 1),
(274567, 781457, 'Majalengka', '', 'id', 1),
(274568, 781457, 'Indramayu', '', 'id', 1),
(274569, 781457, 'Purwakarta', '', 'id', 1),
(274570, 781457, 'Tasikmalaya', '', 'id', 1),
(274571, 781458, 'Bengkayang Regency', '', 'id', 1),
(274572, 781458, 'Kapuas Hulu Regency', '', 'id', 1),
(274573, 781458, 'North Kayong Regency', '', 'id', 1),
(274574, 781458, 'Ketapang Regency', '', 'id', 1),
(274575, 781458, 'Kubu Raya Regency', '', 'id', 1),
(274576, 781458, 'Landak Regency', '', 'id', 1),
(274577, 781458, 'Melawi Regency', '', 'id', 1),
(274578, 781458, 'Sambas Regency', '', 'id', 1),
(274579, 781458, 'Sanggau Regency', '', 'id', 1),
(274580, 781458, 'Sekadau Regency', '', 'id', 1),
(274581, 781458, 'Sintang Regency', '', 'id', 1),
(274582, 781458, 'Singkawang', '', 'id', 1),
(274583, 781458, 'Pontianak', '', 'id', 1),
(274584, 781459, 'Bima', '', 'id', 1),
(274585, 781459, 'Central Lombok', '', 'id', 1),
(274586, 781459, 'Dompu', '', 'id', 1),
(274587, 781459, 'East Lombok', '', 'id', 1),
(274588, 781459, 'North Lombok', '', 'id', 1),
(274589, 781459, 'Sumbawa', '', 'id', 1),
(274590, 781459, 'West Lombok', '', 'id', 1),
(274591, 781459, 'West Sumbawa', '', 'id', 1),
(274592, 781459, 'Mataram', '', 'id', 1),
(274593, 781460, 'Fak-Fak', '', 'id', 1),
(274594, 781460, 'Kaimana', '', 'id', 1),
(274595, 781460, 'Maybrat', '', 'id', 1),
(274596, 781460, 'Raja Ampat', '', 'id', 1),
(274597, 781460, 'Sorong', '', 'id', 1),
(274598, 781460, 'South Sorong', '', 'id', 1),
(274599, 781460, 'Tambrauw', '', 'id', 1),
(274600, 781460, 'Teluk Bintuni', '', 'id', 1),
(274601, 781460, 'Teluk Wondama', '', 'id', 1),
(274602, 781460, 'Manokwari', '', 'id', 1),
(274603, 781461, 'Majene', '', 'id', 1),
(274604, 781461, 'Mamasa', '', 'id', 1),
(274605, 781461, 'Mamuju', '', 'id', 1),
(274606, 781461, 'North Mamuju', '', 'id', 1),
(274607, 781461, 'Polewali Mandar', '', 'id', 1),
(274608, 781462, 'Agam', '', 'id', 1),
(274609, 781462, 'Dharmasraya', '', 'id', 1),
(274610, 781462, 'Lima Puluh Kota', '', 'id', 1),
(274611, 781462, 'Mentawai Islands', '', 'id', 1),
(274612, 781462, 'Padang Pariaman', '', 'id', 1),
(274613, 781462, 'Pasaman', '', 'id', 1),
(274614, 781462, 'Sawahlunto Sijunjung', '', 'id', 1),
(274615, 781462, 'Solok', '', 'id', 1),
(274616, 781462, 'South Pesisir', '', 'id', 1),
(274617, 781462, 'South Solok', '', 'id', 1),
(274618, 781462, 'Tanah Datar', '', 'id', 1),
(274619, 781462, 'West Pasaman', '', 'id', 1),
(274620, 781462, 'Bukittinggi', '', 'id', 1),
(274621, 781462, 'Padang', '', 'id', 1),
(274622, 781462, 'Padang Panjang', '', 'id', 1),
(274623, 781462, 'Pariaman', '', 'id', 1),
(274624, 781462, 'Payakumbuh', '', 'id', 1),
(274625, 781462, 'Sawahlunto', '', 'id', 1),
(274626, 781463, 'Bantul', '', 'id', 1),
(274627, 781463, 'Gunung Kidul', '', 'id', 1),
(274628, 781463, 'Kulon Progo', '', 'id', 1),
(274629, 781463, 'Sleman', '', 'id', 1),
(274630, 781463, 'Yogyakarta', '', 'id', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_city_area`
--

CREATE TABLE IF NOT EXISTS `oc_t_city_area` (
  `pk_i_id` int(10) unsigned NOT NULL,
  `fk_i_city_id` int(10) unsigned NOT NULL,
  `s_name` varchar(255) NOT NULL,
  PRIMARY KEY (`pk_i_id`),
  KEY `fk_i_city_id` (`fk_i_city_id`),
  KEY `idx_s_name` (`s_name`),
  KEY `fk_i_city_id_2` (`fk_i_city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_city_stats`
--

CREATE TABLE IF NOT EXISTS `oc_t_city_stats` (
  `fk_i_city_id` int(10) unsigned NOT NULL,
  `i_num_items` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fk_i_city_id`),
  KEY `idx_num_items` (`i_num_items`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_t_city_stats`
--

INSERT INTO `oc_t_city_stats` (`fk_i_city_id`, `i_num_items`) VALUES
(274165, 0),
(274166, 0),
(274167, 0),
(274168, 0),
(274169, 0),
(274170, 0),
(274171, 0),
(274172, 0),
(274173, 0),
(274174, 0),
(274175, 0),
(274176, 0),
(274177, 0),
(274178, 0),
(274179, 0),
(274180, 0),
(274181, 0),
(274182, 0),
(274183, 0),
(274184, 0),
(274185, 0),
(274186, 0),
(274187, 0),
(274188, 0),
(274189, 0),
(274190, 0),
(274191, 0),
(274192, 0),
(274193, 0),
(274194, 0),
(274195, 0),
(274196, 0),
(274197, 0),
(274198, 0),
(274199, 0),
(274200, 0),
(274201, 0),
(274202, 0),
(274203, 0),
(274204, 0),
(274205, 0),
(274206, 0),
(274207, 0),
(274208, 0),
(274209, 0),
(274210, 0),
(274211, 0),
(274212, 0),
(274213, 0),
(274214, 0),
(274215, 0),
(274216, 0),
(274217, 0),
(274218, 0),
(274219, 0),
(274220, 0),
(274221, 0),
(274222, 0),
(274223, 0),
(274224, 0),
(274225, 0),
(274226, 0),
(274227, 0),
(274228, 0),
(274229, 0),
(274230, 0),
(274231, 0),
(274232, 0),
(274233, 0),
(274234, 0),
(274235, 0),
(274236, 0),
(274237, 0),
(274238, 0),
(274239, 0),
(274240, 0),
(274241, 0),
(274242, 0),
(274243, 0),
(274244, 0),
(274245, 0),
(274246, 0),
(274247, 0),
(274248, 0),
(274249, 0),
(274250, 0),
(274251, 0),
(274252, 0),
(274253, 0),
(274254, 0),
(274255, 0),
(274256, 0),
(274257, 0),
(274258, 0),
(274259, 0),
(274260, 0),
(274261, 0),
(274262, 0),
(274263, 0),
(274264, 0),
(274265, 0),
(274266, 0),
(274267, 0),
(274268, 0),
(274269, 0),
(274270, 0),
(274271, 0),
(274272, 0),
(274273, 0),
(274274, 0),
(274275, 0),
(274276, 0),
(274277, 0),
(274278, 0),
(274279, 0),
(274280, 0),
(274281, 0),
(274282, 0),
(274283, 0),
(274284, 0),
(274285, 0),
(274286, 0),
(274287, 0),
(274288, 0),
(274289, 0),
(274290, 0),
(274291, 0),
(274292, 0),
(274293, 0),
(274294, 0),
(274295, 0),
(274296, 0),
(274297, 0),
(274298, 0),
(274299, 0),
(274300, 0),
(274301, 0),
(274302, 0),
(274303, 0),
(274304, 0),
(274305, 0),
(274306, 0),
(274307, 0),
(274308, 0),
(274309, 0),
(274310, 0),
(274311, 0),
(274312, 0),
(274313, 0),
(274314, 0),
(274315, 0),
(274316, 0),
(274317, 0),
(274318, 0),
(274319, 0),
(274320, 0),
(274321, 0),
(274322, 0),
(274323, 0),
(274324, 0),
(274325, 0),
(274326, 0),
(274327, 0),
(274328, 0),
(274329, 0),
(274330, 0),
(274331, 0),
(274332, 0),
(274333, 0),
(274334, 0),
(274335, 0),
(274336, 0),
(274337, 0),
(274338, 0),
(274339, 0),
(274340, 0),
(274341, 0),
(274342, 0),
(274343, 0),
(274344, 0),
(274345, 0),
(274346, 0),
(274347, 0),
(274348, 0),
(274349, 0),
(274350, 0),
(274351, 0),
(274352, 0),
(274353, 0),
(274354, 0),
(274355, 0),
(274356, 0),
(274357, 0),
(274358, 0),
(274359, 0),
(274360, 0),
(274361, 0),
(274362, 0),
(274363, 0),
(274364, 0),
(274365, 0),
(274366, 0),
(274367, 0),
(274368, 0),
(274369, 0),
(274370, 0),
(274371, 0),
(274372, 0),
(274373, 0),
(274374, 0),
(274375, 0),
(274376, 0),
(274377, 0),
(274378, 0),
(274379, 0),
(274380, 0),
(274381, 0),
(274382, 0),
(274383, 0),
(274384, 0),
(274385, 0),
(274386, 0),
(274387, 0),
(274388, 0),
(274389, 0),
(274390, 0),
(274391, 0),
(274392, 0),
(274393, 0),
(274394, 0),
(274395, 0),
(274396, 0),
(274397, 0),
(274398, 0),
(274399, 0),
(274400, 0),
(274401, 0),
(274402, 0),
(274403, 0),
(274404, 0),
(274405, 0),
(274406, 0),
(274407, 0),
(274408, 0),
(274409, 0),
(274410, 0),
(274411, 0),
(274412, 0),
(274413, 0),
(274414, 0),
(274415, 0),
(274416, 0),
(274417, 0),
(274418, 0),
(274419, 0),
(274420, 0),
(274421, 0),
(274422, 0),
(274423, 0),
(274424, 0),
(274425, 0),
(274426, 0),
(274427, 0),
(274428, 0),
(274429, 0),
(274430, 0),
(274431, 0),
(274432, 0),
(274433, 0),
(274434, 0),
(274435, 0),
(274436, 0),
(274437, 0),
(274438, 0),
(274439, 0),
(274440, 0),
(274441, 0),
(274442, 0),
(274443, 0),
(274444, 0),
(274445, 0),
(274446, 0),
(274447, 0),
(274448, 0),
(274449, 0),
(274450, 0),
(274451, 0),
(274452, 0),
(274453, 0),
(274454, 0),
(274455, 0),
(274456, 0),
(274457, 0),
(274458, 0),
(274459, 0),
(274460, 0),
(274461, 0),
(274462, 0),
(274463, 0),
(274464, 0),
(274465, 0),
(274466, 0),
(274467, 0),
(274468, 0),
(274469, 0),
(274470, 0),
(274471, 0),
(274472, 0),
(274473, 0),
(274474, 0),
(274475, 0),
(274476, 0),
(274477, 0),
(274478, 0),
(274479, 0),
(274480, 0),
(274481, 0),
(274482, 0),
(274483, 0),
(274484, 0),
(274485, 0),
(274486, 0),
(274487, 0),
(274488, 0),
(274489, 0),
(274490, 0),
(274491, 0),
(274492, 0),
(274493, 0),
(274494, 0),
(274495, 0),
(274496, 0),
(274497, 0),
(274498, 0),
(274499, 0),
(274500, 0),
(274501, 0),
(274502, 0),
(274503, 0),
(274504, 0),
(274505, 0),
(274506, 0),
(274507, 0),
(274508, 0),
(274509, 0),
(274510, 0),
(274511, 0),
(274512, 0),
(274513, 0),
(274514, 0),
(274515, 0),
(274516, 0),
(274517, 0),
(274518, 0),
(274519, 0),
(274520, 0),
(274521, 0),
(274522, 0),
(274523, 0),
(274524, 0),
(274525, 0),
(274526, 0),
(274527, 0),
(274528, 0),
(274529, 0),
(274530, 0),
(274531, 0),
(274532, 0),
(274533, 0),
(274534, 0),
(274535, 0),
(274536, 0),
(274537, 0),
(274538, 0),
(274539, 0),
(274540, 0),
(274541, 0),
(274542, 0),
(274543, 0),
(274544, 0),
(274545, 0),
(274546, 0),
(274547, 0),
(274548, 0),
(274549, 0),
(274550, 0),
(274552, 0),
(274553, 0),
(274554, 0),
(274555, 0),
(274556, 0),
(274557, 0),
(274558, 0),
(274559, 0),
(274560, 0),
(274561, 0),
(274562, 0),
(274563, 0),
(274564, 0),
(274565, 0),
(274566, 0),
(274567, 0),
(274568, 0),
(274569, 0),
(274570, 0),
(274571, 0),
(274572, 0),
(274573, 0),
(274574, 0),
(274575, 0),
(274576, 0),
(274577, 0),
(274578, 0),
(274579, 0),
(274580, 0),
(274581, 0),
(274582, 0),
(274583, 0),
(274584, 0),
(274585, 0),
(274586, 0),
(274587, 0),
(274588, 0),
(274589, 0),
(274590, 0),
(274591, 0),
(274592, 0),
(274593, 0),
(274594, 0),
(274595, 0),
(274596, 0),
(274597, 0),
(274598, 0),
(274599, 0),
(274600, 0),
(274601, 0),
(274602, 0),
(274603, 0),
(274604, 0),
(274605, 0),
(274606, 0),
(274607, 0),
(274608, 0),
(274609, 0),
(274610, 0),
(274611, 0),
(274612, 0),
(274613, 0),
(274614, 0),
(274615, 0),
(274616, 0),
(274617, 0),
(274618, 0),
(274619, 0),
(274620, 0),
(274621, 0),
(274622, 0),
(274623, 0),
(274624, 0),
(274625, 0),
(274626, 0),
(274627, 0),
(274628, 0),
(274629, 0),
(274630, 0),
(274551, 2);

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_company_logos`
--

CREATE TABLE IF NOT EXISTS `oc_t_company_logos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL,
  `pic_ext` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_country`
--

CREATE TABLE IF NOT EXISTS `oc_t_country` (
  `pk_c_code` char(2) NOT NULL,
  `s_name` varchar(80) NOT NULL,
  `s_slug` varchar(80) NOT NULL DEFAULT '',
  PRIMARY KEY (`pk_c_code`),
  KEY `idx_s_slug` (`s_slug`),
  KEY `idx_s_name` (`s_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_t_country`
--

INSERT INTO `oc_t_country` (`pk_c_code`, `s_name`, `s_slug`) VALUES
('ID', 'Indonesia', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_country_stats`
--

CREATE TABLE IF NOT EXISTS `oc_t_country_stats` (
  `fk_c_country_code` char(2) NOT NULL,
  `i_num_items` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fk_c_country_code`),
  KEY `idx_num_items` (`i_num_items`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_t_country_stats`
--

INSERT INTO `oc_t_country_stats` (`fk_c_country_code`, `i_num_items`) VALUES
('ID', 2);

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_cron`
--

CREATE TABLE IF NOT EXISTS `oc_t_cron` (
  `e_type` enum('INSTANT','HOURLY','DAILY','WEEKLY','CUSTOM') NOT NULL,
  `d_last_exec` datetime NOT NULL,
  `d_next_exec` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_t_cron`
--

INSERT INTO `oc_t_cron` (`e_type`, `d_last_exec`, `d_next_exec`) VALUES
('HOURLY', '2014-02-25 19:06:40', '2014-02-25 20:06:40'),
('DAILY', '2014-02-24 19:40:01', '2014-02-25 19:40:01'),
('WEEKLY', '2014-02-25 19:06:40', '2014-03-04 19:06:40');

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_currency`
--

CREATE TABLE IF NOT EXISTS `oc_t_currency` (
  `pk_c_code` char(3) NOT NULL,
  `s_name` varchar(40) NOT NULL,
  `s_description` varchar(80) DEFAULT NULL,
  `b_enabled` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`pk_c_code`),
  UNIQUE KEY `s_name` (`s_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_t_currency`
--

INSERT INTO `oc_t_currency` (`pk_c_code`, `s_name`, `s_description`, `b_enabled`) VALUES
('IDR', 'Rupiah', 'Rp.', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_facebook_connect`
--

CREATE TABLE IF NOT EXISTS `oc_t_facebook_connect` (
  `fk_i_user_id` int(10) unsigned NOT NULL,
  `i_facebook_uid` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`fk_i_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_item`
--

CREATE TABLE IF NOT EXISTS `oc_t_item` (
  `pk_i_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_i_user_id` int(10) unsigned DEFAULT NULL,
  `fk_i_category_id` int(10) unsigned NOT NULL,
  `dt_pub_date` datetime NOT NULL,
  `dt_mod_date` datetime DEFAULT NULL,
  `f_price` float DEFAULT NULL,
  `i_price` bigint(20) DEFAULT NULL,
  `fk_c_currency_code` char(3) DEFAULT NULL,
  `s_contact_name` varchar(100) DEFAULT NULL,
  `s_contact_email` varchar(140) DEFAULT NULL,
  `s_ip` varchar(64) NOT NULL DEFAULT '',
  `b_premium` tinyint(1) NOT NULL DEFAULT '0',
  `b_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `b_active` tinyint(1) NOT NULL DEFAULT '0',
  `b_spam` tinyint(1) NOT NULL DEFAULT '0',
  `s_secret` varchar(40) DEFAULT NULL,
  `b_show_email` tinyint(1) DEFAULT NULL,
  `dt_expiration` datetime NOT NULL DEFAULT '9999-12-31 23:59:59',
  PRIMARY KEY (`pk_i_id`),
  KEY `fk_i_user_id` (`fk_i_user_id`),
  KEY `idx_s_contact_email` (`s_contact_email`(10)),
  KEY `fk_i_category_id` (`fk_i_category_id`),
  KEY `fk_c_currency_code` (`fk_c_currency_code`),
  KEY `idx_pub_date` (`dt_pub_date`),
  KEY `idx_price` (`i_price`),
  KEY `fk_i_user_id_2` (`fk_i_user_id`),
  KEY `fk_i_category_id_2` (`fk_i_category_id`),
  KEY `fk_c_currency_code_2` (`fk_c_currency_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `oc_t_item`
--

INSERT INTO `oc_t_item` (`pk_i_id`, `fk_i_user_id`, `fk_i_category_id`, `dt_pub_date`, `dt_mod_date`, `f_price`, `i_price`, `fk_c_currency_code`, `s_contact_name`, `s_contact_email`, `s_ip`, `b_premium`, `b_enabled`, `b_active`, `b_spam`, `s_secret`, `b_show_email`, `dt_expiration`) VALUES
(1, 1, 100, '2014-02-14 19:55:21', NULL, NULL, 1000000000, 'IDR', 'tes adh', 'teas@mail.com', '127.0.0.1', 0, 1, 1, 0, 'L2DUybuy', 0, '9999-12-31 23:59:59'),
(2, 1, 101, '2014-02-14 19:57:08', '2014-02-14 20:02:47', NULL, 1000000000, 'IDR', 'tes adh', 'teas@mail.com', '127.0.0.1', 0, 1, 1, 0, '7jcyUURn', 0, '9999-12-31 23:59:59');

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_item_comment`
--

CREATE TABLE IF NOT EXISTS `oc_t_item_comment` (
  `pk_i_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_i_item_id` int(10) unsigned NOT NULL,
  `dt_pub_date` datetime NOT NULL,
  `s_title` varchar(200) NOT NULL,
  `s_author_name` varchar(100) NOT NULL,
  `s_author_email` varchar(100) NOT NULL,
  `s_body` text NOT NULL,
  `b_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `b_active` tinyint(1) NOT NULL DEFAULT '0',
  `b_spam` tinyint(1) NOT NULL DEFAULT '0',
  `fk_i_user_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`pk_i_id`),
  KEY `fk_i_item_id` (`fk_i_item_id`),
  KEY `fk_i_user_id` (`fk_i_user_id`),
  KEY `fk_i_item_id_2` (`fk_i_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_item_description`
--

CREATE TABLE IF NOT EXISTS `oc_t_item_description` (
  `fk_i_item_id` int(10) unsigned NOT NULL,
  `fk_c_locale_code` char(5) NOT NULL,
  `s_title` varchar(100) NOT NULL,
  `s_description` mediumtext NOT NULL,
  PRIMARY KEY (`fk_i_item_id`,`fk_c_locale_code`),
  FULLTEXT KEY `s_description` (`s_description`,`s_title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_t_item_description`
--

INSERT INTO `oc_t_item_description` (`fk_i_item_id`, `fk_c_locale_code`, `s_title`, `s_description`) VALUES
(1, 'id_ID', 'benih buncis', 'jual benih buncis'),
(2, 'id_ID', 'jual makanan ternak', 'jual makanan ternak');

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_item_location`
--

CREATE TABLE IF NOT EXISTS `oc_t_item_location` (
  `fk_i_item_id` int(10) unsigned NOT NULL,
  `fk_c_country_code` char(2) DEFAULT NULL,
  `s_country` varchar(40) DEFAULT NULL,
  `s_address` varchar(100) DEFAULT NULL,
  `s_zip` varchar(15) DEFAULT NULL,
  `fk_i_region_id` int(10) unsigned DEFAULT NULL,
  `s_region` varchar(100) DEFAULT NULL,
  `fk_i_city_id` int(10) unsigned DEFAULT NULL,
  `s_city` varchar(100) DEFAULT NULL,
  `fk_i_city_area_id` int(10) unsigned DEFAULT NULL,
  `s_city_area` varchar(200) DEFAULT NULL,
  `d_coord_lat` decimal(10,6) DEFAULT NULL,
  `d_coord_long` decimal(10,6) DEFAULT NULL,
  PRIMARY KEY (`fk_i_item_id`),
  KEY `fk_c_country_code` (`fk_c_country_code`),
  KEY `fk_i_region_id` (`fk_i_region_id`),
  KEY `fk_i_city_id` (`fk_i_city_id`),
  KEY `fk_i_city_area_id` (`fk_i_city_area_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_t_item_location`
--

INSERT INTO `oc_t_item_location` (`fk_i_item_id`, `fk_c_country_code`, `s_country`, `s_address`, `s_zip`, `fk_i_region_id`, `s_region`, `fk_i_city_id`, `s_city`, `fk_i_city_area_id`, `s_city_area`, `d_coord_lat`, `d_coord_long`) VALUES
(1, 'ID', 'Indonesia', 'Jl. Abc No.123', NULL, NULL, 'jabar', 274551, 'Bandung', NULL, 'Bandung', NULL, NULL),
(2, 'ID', 'Indonesia', 'Jl. Padasuka 55', NULL, NULL, 'jawa barat', 274551, 'Bandung', NULL, 'Padasuka', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_item_meta`
--

CREATE TABLE IF NOT EXISTS `oc_t_item_meta` (
  `fk_i_item_id` int(10) unsigned NOT NULL,
  `fk_i_field_id` int(10) unsigned NOT NULL,
  `s_value` text,
  `s_multi` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`fk_i_item_id`,`fk_i_field_id`,`s_multi`),
  KEY `s_value` (`s_value`(255)),
  KEY `fk_i_field_id` (`fk_i_field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_item_products_attr`
--

CREATE TABLE IF NOT EXISTS `oc_t_item_products_attr` (
  `fk_i_item_id` int(10) unsigned NOT NULL,
  `s_make` varchar(40) DEFAULT NULL,
  `s_model` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`fk_i_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_item_resource`
--

CREATE TABLE IF NOT EXISTS `oc_t_item_resource` (
  `pk_i_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_i_item_id` int(10) unsigned NOT NULL,
  `s_name` varchar(60) DEFAULT NULL,
  `s_extension` varchar(10) DEFAULT NULL,
  `s_content_type` varchar(40) DEFAULT NULL,
  `s_path` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`pk_i_id`),
  KEY `fk_i_item_id` (`fk_i_item_id`),
  KEY `idx_s_content_type` (`pk_i_id`,`s_content_type`(10)),
  KEY `fk_i_item_id_2` (`fk_i_item_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `oc_t_item_resource`
--

INSERT INTO `oc_t_item_resource` (`pk_i_id`, `fk_i_item_id`, `s_name`, `s_extension`, `s_content_type`, `s_path`) VALUES
(2, 1, '3rJyZSQW', 'jpg', 'image/jpeg', 'oc-content/uploads/0/'),
(3, 1, 'Q5ZEnNlf', 'jpg', 'image/jpeg', 'oc-content/uploads/0/'),
(4, 2, 'n4b7w89O', 'jpg', 'image/jpeg', 'oc-content/uploads/0/'),
(5, 2, 'cdMCmKTT', 'jpg', 'image/jpeg', 'oc-content/uploads/0/'),
(6, 2, 'H0T85MxT', 'jpg', 'image/jpeg', 'oc-content/uploads/0/');

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_item_stats`
--

CREATE TABLE IF NOT EXISTS `oc_t_item_stats` (
  `fk_i_item_id` int(10) unsigned NOT NULL,
  `i_num_views` int(10) unsigned NOT NULL DEFAULT '0',
  `i_num_spam` int(10) unsigned NOT NULL DEFAULT '0',
  `i_num_repeated` int(10) unsigned NOT NULL DEFAULT '0',
  `i_num_bad_classified` int(10) unsigned NOT NULL DEFAULT '0',
  `i_num_offensive` int(10) unsigned NOT NULL DEFAULT '0',
  `i_num_expired` int(10) unsigned NOT NULL DEFAULT '0',
  `i_num_premium_views` int(10) unsigned NOT NULL DEFAULT '0',
  `dt_date` date NOT NULL,
  PRIMARY KEY (`fk_i_item_id`,`dt_date`),
  KEY `dt_date` (`dt_date`,`fk_i_item_id`),
  KEY `dt_date_2` (`dt_date`,`fk_i_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_t_item_stats`
--

INSERT INTO `oc_t_item_stats` (`fk_i_item_id`, `i_num_views`, `i_num_spam`, `i_num_repeated`, `i_num_bad_classified`, `i_num_offensive`, `i_num_expired`, `i_num_premium_views`, `dt_date`) VALUES
(1, 0, 0, 0, 0, 0, 0, 0, '2014-02-14'),
(2, 0, 0, 0, 0, 0, 0, 0, '2014-02-14');

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_keywords`
--

CREATE TABLE IF NOT EXISTS `oc_t_keywords` (
  `s_md5` varchar(32) NOT NULL,
  `fk_c_locale_code` char(5) NOT NULL,
  `s_original_text` varchar(255) NOT NULL,
  `s_anchor_text` varchar(255) NOT NULL,
  `s_normalized_text` varchar(255) NOT NULL,
  `fk_i_category_id` int(10) unsigned DEFAULT NULL,
  `fk_i_city_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`s_md5`,`fk_c_locale_code`),
  KEY `fk_i_category_id` (`fk_i_category_id`),
  KEY `fk_i_city_id` (`fk_i_city_id`),
  KEY `fk_c_locale_code` (`fk_c_locale_code`),
  KEY `fk_i_category_id_2` (`fk_i_category_id`),
  KEY `fk_i_city_id_2` (`fk_i_city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_latest_searches`
--

CREATE TABLE IF NOT EXISTS `oc_t_latest_searches` (
  `d_date` datetime NOT NULL,
  `s_search` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_locale`
--

CREATE TABLE IF NOT EXISTS `oc_t_locale` (
  `pk_c_code` char(5) NOT NULL,
  `s_name` varchar(100) NOT NULL,
  `s_short_name` varchar(40) NOT NULL,
  `s_description` varchar(100) NOT NULL,
  `s_version` varchar(20) NOT NULL,
  `s_author_name` varchar(100) NOT NULL,
  `s_author_url` varchar(100) NOT NULL,
  `s_currency_format` varchar(50) NOT NULL,
  `s_dec_point` varchar(2) DEFAULT '.',
  `s_thousands_sep` varchar(2) DEFAULT '',
  `i_num_dec` tinyint(4) DEFAULT '2',
  `s_date_format` varchar(20) NOT NULL,
  `s_stop_words` text,
  `b_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `b_enabled_bo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`pk_c_code`),
  UNIQUE KEY `s_short_name` (`s_short_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_t_locale`
--

INSERT INTO `oc_t_locale` (`pk_c_code`, `s_name`, `s_short_name`, `s_description`, `s_version`, `s_author_name`, `s_author_url`, `s_currency_format`, `s_dec_point`, `s_thousands_sep`, `i_num_dec`, `s_date_format`, `s_stop_words`, `b_enabled`, `b_enabled_bo`) VALUES
('id_ID', 'Indonesian', 'Indonesian', 'Indonesian translation', '3.1.0', 'Osclass', 'http://osclass.org/', '{CURRENCY} {NUMBER}', ',', '.', 2, 'd/m/Y', '', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_locations_tmp`
--

CREATE TABLE IF NOT EXISTS `oc_t_locations_tmp` (
  `id_location` varchar(10) NOT NULL,
  `e_type` enum('COUNTRY','REGION','CITY') NOT NULL,
  PRIMARY KEY (`id_location`,`e_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_log`
--

CREATE TABLE IF NOT EXISTS `oc_t_log` (
  `dt_date` datetime NOT NULL,
  `s_section` varchar(50) NOT NULL,
  `s_action` varchar(50) NOT NULL,
  `fk_i_id` int(10) unsigned NOT NULL,
  `s_data` varchar(250) NOT NULL,
  `s_ip` varchar(50) NOT NULL,
  `s_who` varchar(50) NOT NULL,
  `fk_i_who_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_t_log`
--

INSERT INTO `oc_t_log` (`dt_date`, `s_section`, `s_action`, `fk_i_id`, `s_data`, `s_ip`, `s_who`, `fk_i_who_id`) VALUES
('2014-02-08 22:48:52', 'item', 'add', 1, 'Example Ad', '127.0.0.1', 'admin', 0),
('2014-02-09 20:07:40', 'Item', 'deleteResourcesFromHD', 1, '1', '10.186.136.21', 'admin', 1),
('2014-02-09 20:07:40', 'Item', 'deleteResourcesFromHD', 1, '0', '10.186.136.21', 'admin', 1),
('2014-02-14 19:52:19', 'user', 'add', 1, 'teas@mail.com', '127.0.0.1', 'user', 1),
('2014-02-14 19:52:51', 'user', 'activate', 1, 'teas@mail.com', '127.0.0.1', 'admin', 1),
('2014-02-14 19:55:21', 'item', 'add', 1, 'benih buncis', '127.0.0.1', 'user', 1),
('2014-02-14 19:57:08', 'item', 'add', 2, 'jual makanan ternak', '127.0.0.1', 'user', 1),
('2014-02-14 20:02:49', 'item', 'edit', 2, 'jual makanan ternak', '127.0.0.1', 'user', 1),
('2014-02-24 20:20:41', 'item', 'delete resource', 1, '1', '127.0.0.1', 'admin', 1),
('2014-02-24 20:20:42', 'item', 'delete resource backtrace', 1, '#0 osc_deleteResource called@ [C:\\wamp\\www\\osclass\\oc-admin\\media.php:72] / #1 doModel called@ [C:\\wamp\\www\\osclass\\oc-admin\\index.php:60] / ', '127.0.0.1', 'admin', 1),
('2014-02-24 20:20:42', 'media', 'delete', 1, '1', '127.0.0.1', 'admin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_meta_categories`
--

CREATE TABLE IF NOT EXISTS `oc_t_meta_categories` (
  `fk_i_category_id` int(10) unsigned NOT NULL,
  `fk_i_field_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`fk_i_category_id`,`fk_i_field_id`),
  KEY `fk_i_field_id` (`fk_i_field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_meta_fields`
--

CREATE TABLE IF NOT EXISTS `oc_t_meta_fields` (
  `pk_i_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `s_name` varchar(255) NOT NULL,
  `s_slug` varchar(255) NOT NULL,
  `e_type` enum('TEXT','TEXTAREA','DROPDOWN','RADIO','CHECKBOX','URL','DATE','DATEINTERVAL') NOT NULL DEFAULT 'TEXT',
  `s_options` varchar(255) DEFAULT NULL,
  `b_required` tinyint(1) NOT NULL DEFAULT '0',
  `b_searchable` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pk_i_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `oc_t_meta_fields`
--

INSERT INTO `oc_t_meta_fields` (`pk_i_id`, `s_name`, `s_slug`, `e_type`, `s_options`, `b_required`, `b_searchable`) VALUES
(1, 'Field kustom BARU', 'field-kustom-baru', 'TEXT', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_pages`
--

CREATE TABLE IF NOT EXISTS `oc_t_pages` (
  `pk_i_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `s_internal_name` varchar(50) DEFAULT NULL,
  `b_indelible` tinyint(1) NOT NULL DEFAULT '0',
  `b_link` tinyint(1) NOT NULL DEFAULT '1',
  `dt_pub_date` datetime NOT NULL,
  `dt_mod_date` datetime DEFAULT NULL,
  `i_order` int(3) NOT NULL DEFAULT '0',
  `s_meta` text,
  PRIMARY KEY (`pk_i_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `oc_t_pages`
--

INSERT INTO `oc_t_pages` (`pk_i_id`, `s_internal_name`, `b_indelible`, `b_link`, `dt_pub_date`, `dt_mod_date`, `i_order`, `s_meta`) VALUES
(1, 'email_item_inquiry', 1, 1, '2014-02-09 13:48:44', NULL, 0, NULL),
(2, 'email_user_validation', 1, 1, '2014-02-09 13:48:44', NULL, 0, NULL),
(3, 'email_user_registration', 1, 1, '2014-02-09 13:48:44', NULL, 0, NULL),
(4, 'email_send_friend', 1, 1, '2014-02-09 13:48:44', NULL, 0, NULL),
(5, 'alert_email_hourly', 1, 1, '2014-02-09 13:48:44', NULL, 0, NULL),
(6, 'alert_email_daily', 1, 1, '2014-02-09 13:48:44', NULL, 0, NULL),
(7, 'alert_email_weekly', 1, 1, '2014-02-09 13:48:44', NULL, 0, NULL),
(8, 'alert_email_instant', 1, 1, '2014-02-09 13:48:44', NULL, 0, NULL),
(9, 'email_new_comment_admin', 1, 1, '2014-02-09 13:48:44', NULL, 0, NULL),
(10, 'email_new_item_non_register_user', 1, 1, '2014-02-09 13:48:44', NULL, 0, NULL),
(11, 'email_item_validation', 1, 1, '2014-02-09 13:48:45', NULL, 0, NULL),
(12, 'email_admin_new_item', 1, 1, '2014-02-09 13:48:45', NULL, 0, NULL),
(13, 'email_user_forgot_password', 1, 1, '2014-02-09 13:48:45', NULL, 0, NULL),
(14, 'email_new_email', 1, 1, '2014-02-09 13:48:45', NULL, 0, NULL),
(15, 'email_alert_validation', 1, 1, '2014-02-09 13:48:45', NULL, 0, NULL),
(16, 'email_comment_validated', 1, 1, '2014-02-09 13:48:45', NULL, 0, NULL),
(17, 'email_item_validation_non_register_user', 1, 1, '2014-02-09 13:48:45', NULL, 0, NULL),
(18, 'email_admin_new_user', 1, 1, '2014-02-09 13:48:45', NULL, 0, NULL),
(19, 'email_contact_user', 1, 1, '2014-02-09 13:48:45', NULL, 0, NULL),
(20, 'email_new_comment_user', 1, 1, '2014-02-09 13:48:45', NULL, 0, NULL),
(21, 'email_new_admin', 1, 1, '2014-02-09 13:48:45', NULL, 0, NULL),
(22, 'email_warn_expiration', 1, 1, '2014-02-09 13:48:45', NULL, 0, NULL),
(23, 'usaha-tani', 0, 1, '2014-02-08 22:48:52', '2014-02-14 19:40:03', 1, '""'),
(24, 'merancang-unit-pengolahan-hasil-pertanian-bagian-2', 0, 1, '2014-02-14 19:41:02', '2014-02-14 19:41:02', 2, '""'),
(25, 'merancang-unit-pengolahan-hasil-pertanian', 0, 1, '2014-02-14 19:41:57', '2014-02-14 19:41:57', 3, '""');

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_pages_description`
--

CREATE TABLE IF NOT EXISTS `oc_t_pages_description` (
  `fk_i_pages_id` int(10) unsigned NOT NULL,
  `fk_c_locale_code` char(5) NOT NULL,
  `s_title` varchar(255) NOT NULL,
  `s_text` text,
  PRIMARY KEY (`fk_i_pages_id`,`fk_c_locale_code`),
  KEY `fk_c_locale_code` (`fk_c_locale_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_t_pages_description`
--

INSERT INTO `oc_t_pages_description` (`fk_i_pages_id`, `fk_c_locale_code`, `s_title`, `s_text`) VALUES
(1, 'id_ID', '{WEB_TITLE} - Someone has a question about your listing', '<p>Hi {CONTACT_NAME}!</p><p>{USER_NAME} ({USER_EMAIL}, {USER_PHONE}) left you a message about your listing <a href="{ITEM_URL}">{ITEM_TITLE}</a>:</p><p>{COMMENT}</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(2, 'id_ID', 'Please validate your {WEB_TITLE} account', '<p>Hi {USER_NAME},</p><p>Please validate your registration by clicking on the following link: {VALIDATION_LINK}</p><p>Thank you!</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(3, 'id_ID', '{WEB_TITLE} - Registration successful!', '<p>Hi {USER_NAME},</p><p>You''ve successfully registered for {WEB_LINK}.</p><p>Thank you!</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(4, 'id_ID', 'Look at what I discovered on {WEB_TITLE}', '<p>Hi {FRIEND_NAME},</p><p>Your friend {USER_NAME} wants to share this listing with you <a href="{ITEM_URL}">{ITEM_TITLE}</a>.</p><p>Message:</p><p>{COMMENT}</p><p>Regards,</p><p>{WEB_TITLE}</p>'),
(5, 'id_ID', '{WEB_TITLE} - New listings in the last hour', '<p>Hi {USER_NAME},</p><p>New listings have been published in the last hour. Take a look at them:</p><p>{ADS}</p><p>-------------</p><p>To unsubscribe from this alert, click on: {UNSUB_LINK}</p><p>{WEB_LINK}</p>'),
(6, 'id_ID', '{WEB_TITLE} - New listings in the last day', '<p>Hi {USER_NAME},</p><p>New listings have been published in the last day. Take a look at them:</p><p>{ADS}</p><p>-------------</p><p>To unsubscribe from this alert, click on: {UNSUB_LINK}</p><p>{WEB_LINK}</p>'),
(7, 'id_ID', '{WEB_TITLE} - New listings in the last week', '<p>Hi {USER_NAME},</p><p>New listings have been published in the last week. Take a look at them:</p><p>{ADS}</p><p>-------------</p><p>To unsubscribe from this alert, click on: {UNSUB_LINK}</p><p>{WEB_LINK}</p>'),
(8, 'id_ID', '{WEB_TITLE} - New listings', '<p>Hi {USER_NAME},</p><p>A new listing has been published, check it out!</p><p>{ADS}</p><p>-------------</p><p>To unsubscribe from this alert, click on: {UNSUB_LINK}</p><p>{WEB_LINK}</p>'),
(9, 'id_ID', '{WEB_TITLE} - New comment', '<p>Someone commented on the listing <a href="{ITEM_URL}">{ITEM_TITLE}</a>.</p><p>Commenter: {COMMENT_AUTHOR}<br />Commenter''s email: {COMMENT_EMAIL}<br />Title: {COMMENT_TITLE}<br />Comment: {COMMENT_TEXT}</p>'),
(10, 'id_ID', '{WEB_TITLE} - Edit options for the listing {ITEM_TITLE}', '<p>Hi {USER_NAME},</p><p>You''re not registered at {WEB_LINK}, but you can still edit or delete the listing <a href="{ITEM_URL}">{ITEM_TITLE}</a> for a short period of time.</p><p>You can edit your listing by following this link: {EDIT_LINK}</p><p>You can delete your listing by following this link: {DELETE_LINK}</p><p>If you register as a user, you will have full access to editing options.</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(11, 'id_ID', '{WEB_TITLE} - Validate your listing', '<p>Hi {USER_NAME},</p><p>You''re receiving this e-mail because a listing has been published at {WEB_LINK}. Please validate this listing by clicking on the following link: {VALIDATION_LINK}. If you didn''t publish this listing, please ignore this email.</p><p>Listing details:</p><p>Contact name: {USER_NAME}<br />Contact e-mail: {USER_EMAIL}</p><p>{ITEM_DESCRIPTION}</p><p>Url: {ITEM_URL}</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(12, 'id_ID', '{WEB_TITLE} - A new listing has been published', '<p>Dear {WEB_TITLE} admin,</p><p>You''re receiving this email because a listing has been published at {WEB_LINK}.</p><p>Listing details:</p><p>Contact name: {USER_NAME}<br />Contact email: {USER_EMAIL}</p><p>{ITEM_DESCRIPTION}</p><p>Url: {ITEM_URL}</p><p>You can edit this listing by clicking on the following link: {EDIT_LINK}</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(13, 'id_ID', '{WEB_TITLE} - Recover your password', '<p>Hi {USER_NAME},</p><p>We''ve sent you this e-mail because you''ve requested a password reminder. Follow this link to recover it: {PASSWORD_LINK}</p><p>The link will be deactivated in 24 hours.</p><p>If you didn''t request a password reminder, please ignore this message. This request was made from IP {IP_ADDRESS} on {DATE_TIME}</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(14, 'id_ID', '{WEB_TITLE} - You requested an email change', '<p>Hi {USER_NAME}</p><p>You''re receiving this e-mail because you requested an e-mail change. Please confirm this new e-mail address by clicking on the following validation link: {VALIDATION_LINK}</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(15, 'id_ID', '{WEB_TITLE} - Please validate your alert', '<p>Hi {USER_NAME},</p><p>Please validate your alert registration by clicking on the following link: {VALIDATION_LINK}</p><p>Thank you!</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(16, 'id_ID', '{WEB_TITLE} - Your comment has been approved', '<p>Hi {COMMENT_AUTHOR},</p><p>Your comment on <a href="{ITEM_URL}">{ITEM_TITLE}</a> has been approved.</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(17, 'id_ID', '{WEB_TITLE} - Validate your listing', '<p>Hi {USER_NAME},</p><p>You''re receiving this e-mail because you’ve published a listing at {WEB_LINK}. Please validate this listing by clicking on the following link: {VALIDATION_LINK}. If you didn''t publish this listing, please ignore this e-mail.</p><p>Listing details:</p><p>Contact name: {USER_NAME}<br />Contact e-mail: {USER_EMAIL}</p><p>{ITEM_DESCRIPTION}</p><p>Url: {ITEM_URL}</p><p>Even if you''re not registered at {WEB_LINK}, you can still edit or delete your listing:</p><p>You can edit your listing by following this link: {EDIT_LINK}</p><p>You can delete your listing by following this link: {DELETE_LINK}</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(18, 'id_ID', '{WEB_TITLE} - A new user has registered', '<p>Dear {WEB_TITLE} admin,</p><p>You''re receiving this email because a new user has been created at {WEB_LINK}.</p><p>User details:</p><p>Name: {USER_NAME}<br />E-mail: {USER_EMAIL}</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(19, 'id_ID', '{WEB_TITLE} - Someone has a question for you', '<p>Hi {CONTACT_NAME}!</p><p>{USER_NAME} ({USER_EMAIL}, {USER_PHONE}) left you a message:</p><p>{COMMENT}</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(20, 'id_ID', '{WEB_TITLE} - Someone has commented on your listing', '<p>There''s a new comment on the listing: <a href="{ITEM_URL}">{ITEM_TITLE}</a>.</p><p>Author: {COMMENT_AUTHOR}<br />Author''s email: {COMMENT_EMAIL}<br />Title: {COMMENT_TITLE}<br />Comment: {COMMENT_TEXT}</p><p>{WEB_LINK}</p>'),
(23, 'id_ID', 'Usaha tani', '<h1 class="entry_title" style="margin: 0px; padding: 0px 0px 5px; border: 0px; font-weight: normal; font-size: 26px; font-family: georgia, verdana, sans-serif; vertical-align: baseline; line-height: 26px; letter-spacing: -1px; color: #555555;">Merancang Unit Pengolahan Hasil Pertanian</h1>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-size: 13px; font-family: ''Lucida Grande'', Tahoma, Verdana, georgia, ''palatino linotype'', palatino, ''times new roman'', times, serif; vertical-align: baseline; color: #333333; line-height: 17.920000076293945px;"> </p>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-size: 13px; font-family: ''Lucida Grande'', Tahoma, Verdana, georgia, ''palatino linotype'', palatino, ''times new roman'', times, serif; vertical-align: baseline; color: #333333; line-height: 17.920000076293945px;">Agar usaha pengolahan hasil pertanian dapat berjalan dan berkembang dengan baik, dibutuhkan beberapa aspek perencanaan dan pengambilan keputusan.  Pertimbangan tersebut berkaitan dengan aspek permodalan, perancangan produk, proses dan kapasitas produksi, sumber daya manusia, sistem informasi dan manajemen usaha.</p>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-size: 13px; font-family: ''Lucida Grande'', Tahoma, Verdana, georgia, ''palatino linotype'', palatino, ''times new roman'', times, serif; vertical-align: baseline; color: #333333; line-height: 17.920000076293945px;">Uraian aspek-aspek tersebut akan dimuat dalam dua tulisan. Bagian pertama akan membahas mengenai pendanaan atau modal, rancangan produk dan volume penjualan, sedangkan bagian kedua akan membahas proses dan kapasitas produksi, sumber daya manusia sistem informasi dan manajemen usaha.</p>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-size: 13px; font-family: ''Lucida Grande'', Tahoma, Verdana, georgia, ''palatino linotype'', palatino, ''times new roman'', times, serif; vertical-align: baseline; color: #333333; line-height: 17.920000076293945px;"><strong>Pendanaan atau Modal</strong></p>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-size: 13px; font-family: ''Lucida Grande'', Tahoma, Verdana, georgia, ''palatino linotype'', palatino, ''times new roman'', times, serif; vertical-align: baseline; color: #333333; line-height: 17.920000076293945px;">Pendanaan pada suatu unit pengolahan dibagi menjadi tiga kategori yaitu pendanaan awal, pendanaan operasional dan pendanaan bagi pengembangan usaha.</p>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-size: 13px; font-family: ''Lucida Grande'', Tahoma, Verdana, georgia, ''palatino linotype'', palatino, ''times new roman'', times, serif; vertical-align: baseline; color: #333333; line-height: 17.920000076293945px;">Pendanaan awal dimaksudkan sebagai dana untuk pengadaan peralatan, mesin, dan bangunan pengolahan. Untuk proses pengolahan yang lebih kompleks, pendanaan awal dapat pula diperlukan untuk menyusun studi kelayakan atau penelusuran trend produk dan aspek pendukungnya.</p>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-size: 13px; font-family: ''Lucida Grande'', Tahoma, Verdana, georgia, ''palatino linotype'', palatino, ''times new roman'', times, serif; vertical-align: baseline; color: #333333; line-height: 17.920000076293945px;">Pada tingkat kelompok tani atau Gapoktan, pendanaan awal dapat berasal dari kontribusi anggota atau pinjaman lembaga keuangan. Beberapa kegiatan unit pengolahan hasil pertanian yang dilakukan kelompok juga dibantu oleh pemerintah/pemerintah daerah dalam pengadaan peralatan, mesin dan bangunan produksi.</p>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-size: 13px; font-family: ''Lucida Grande'', Tahoma, Verdana, georgia, ''palatino linotype'', palatino, ''times new roman'', times, serif; vertical-align: baseline; color: #333333; line-height: 17.920000076293945px;">Bila unit pengolahan telah dibangun, peralatan telah tersedia dan dipasang sesuai dengan tata letak yang direncanakan, maka proses produksi dapat mulai dijalankan. Pada tahap ini diperlukan pendanaan untuk pembelian bahan baku, bahan tambahan proses, bahan pendukung lainnya, biaya tenaga kerja, dan biaya perawatan atau perbaikan bangunan dan alat.</p>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-size: 13px; font-family: ''Lucida Grande'', Tahoma, Verdana, georgia, ''palatino linotype'', palatino, ''times new roman'', times, serif; vertical-align: baseline; color: #333333; line-height: 17.920000076293945px;">Kategori ke tiga adalah pendanaan untuk pengembangan usaha. Dengan berkembangnya usaha dan meningkatnya permintaan konsumen terhadap produk yang dihasilkan, kapasitas produksi perlu ditingkatkan. Untuk itu diperlukan pendanaan bagi pengembangan usaha yang dapat berasal dari internal perusahaan seperti hasil keuntungan atau eksternal seperti dari perbankan dan mitra kerja.</p>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-size: 13px; font-family: ''Lucida Grande'', Tahoma, Verdana, georgia, ''palatino linotype'', palatino, ''times new roman'', times, serif; vertical-align: baseline; color: #333333; line-height: 17.920000076293945px;"><strong>Rancangan Produk</strong></p>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-size: 13px; font-family: ''Lucida Grande'', Tahoma, Verdana, georgia, ''palatino linotype'', palatino, ''times new roman'', times, serif; vertical-align: baseline; color: #333333; line-height: 17.920000076293945px;">Produk yang akan dibuat perlu dirancang dengan baik. Rancangan produk terkait dengan jenis produk, kualitas produk, bahan baku yang diperlukan, peralatan dan bangunan untuk pembuatan produk.</p>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-size: 13px; font-family: ''Lucida Grande'', Tahoma, Verdana, georgia, ''palatino linotype'', palatino, ''times new roman'', times, serif; vertical-align: baseline; color: #333333; line-height: 17.920000076293945px;">Untuk mewujudkan suatu produk, perlu diperhatikan pula aspek fungsi dari produk yang dihasilkan dan kemudahan untuk pembuatannya. Aspek fungsi yang dimaksud adalah, bila produk yang akan dihasilkan adalah makanan siap makan <span style="margin: 0px; padding: 0px 1em 0px 0px; border: 0px; font-weight: bold; font-style: inherit; font-family: inherit; vertical-align: top;">(ready to eat)</span>, maka harus dipastikan bahwa seluruh bahan dan prosesnya mendukung untuk terciptanya produk tersebut. Sedangkan aspek kemudahan pembuatan, terkait dengan jaminan bahwa produk tersebut dapat dibuat dengan teknik tertentu yang dikuasai oleh pengelola usaha.</p>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-size: 13px; font-family: ''Lucida Grande'', Tahoma, Verdana, georgia, ''palatino linotype'', palatino, ''times new roman'', times, serif; vertical-align: baseline; color: #333333; line-height: 17.920000076293945px;"><strong>Volume Penjualan</strong></p>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-size: 13px; font-family: ''Lucida Grande'', Tahoma, Verdana, georgia, ''palatino linotype'', palatino, ''times new roman'', times, serif; vertical-align: baseline; color: #333333; line-height: 17.920000076293945px;">Banyak usaha di tingkat kelompok tani keliru merencanakan unit usaha dan alat serta bangunan yang diperlukan, karena kelompok tersebut merancang volume produksi dan bukan volume penjualan.</p>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-size: 13px; font-family: ''Lucida Grande'', Tahoma, Verdana, georgia, ''palatino linotype'', palatino, ''times new roman'', times, serif; vertical-align: baseline; color: #333333; line-height: 17.920000076293945px;">Salah satu informasi penting dalam sistem unit produksi pengolahan hasil pertanian adalah besaran volume produk yang dikehendaki oleh konsumen atau pasar. Informasi ini terutama sekali berguna untuk menentukan jumlah dan kapasitas mesin produksi.</p>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-size: 13px; font-family: ''Lucida Grande'', Tahoma, Verdana, georgia, ''palatino linotype'', palatino, ''times new roman'', times, serif; vertical-align: baseline; color: #333333; line-height: 17.920000076293945px;">Dengan demikian, survai pasar yang dilakukan tidak terbatas pada minat konsumen pada produk yang akan dijual tetapi juga seberapa besar konsumen memerlukan atau akan membeli produk tersebut.</p>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-size: 13px; font-family: ''Lucida Grande'', Tahoma, Verdana, georgia, ''palatino linotype'', palatino, ''times new roman'', times, serif; vertical-align: baseline; color: #333333; line-height: 17.920000076293945px;"> </p>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-size: 13px; font-family: ''Lucida Grande'', Tahoma, Verdana, georgia, ''palatino linotype'', palatino, ''times new roman'', times, serif; vertical-align: baseline; color: #333333; line-height: 17.920000076293945px;">[dds/pphp/ddsulaeman@gmail.com]</p>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-size: 13px; font-family: ''Lucida Grande'', Tahoma, Verdana, georgia, ''palatino linotype'', palatino, ''times new roman'', times, serif; vertical-align: baseline; color: #333333; line-height: 17.920000076293945px;">Referensi</p>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-size: 13px; font-family: ''Lucida Grande'', Tahoma, Verdana, georgia, ''palatino linotype'', palatino, ''times new roman'', times, serif; vertical-align: baseline; color: #333333; line-height: 17.920000076293945px;">Wignjosoebroto, Sritomo, 2009, Edisi Ketiga, Tata Letak Pabrik dan Pemindahan Bahan, Guna Widya, Surabaya</p>'),
(24, 'id_ID', 'Merancang Unit Pengolahan Hasil Pertanian [Bagian 2]', '<h1 class="entry_title" style="margin: 0px; padding: 0px 0px 5px; border: 0px; font-weight: normal; font-size: 26px; font-family: georgia, verdana, sans-serif; vertical-align: baseline; line-height: 26px; letter-spacing: -1px; color: #555555;">Merancang Unit Pengolahan Hasil Pertanian [Bagian 2]</h1>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-size: 13px; font-family: ''Lucida Grande'', Tahoma, Verdana, georgia, ''palatino linotype'', palatino, ''times new roman'', times, serif; vertical-align: baseline; color: #333333; line-height: 17.920000076293945px;"> </p>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-size: 13px; font-family: ''Lucida Grande'', Tahoma, Verdana, georgia, ''palatino linotype'', palatino, ''times new roman'', times, serif; vertical-align: baseline; color: #333333; line-height: 17.920000076293945px;"> </p>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-size: 13px; font-family: ''Lucida Grande'', Tahoma, Verdana, georgia, ''palatino linotype'', palatino, ''times new roman'', times, serif; vertical-align: baseline; color: #333333; line-height: 17.920000076293945px;">Agar usaha pengolahan hasil pertanian dapat berjalan dan berkembang dengan baik, dibutuhkan beberapa aspek perencanaan dan pengambilan keputusan.  Pertimbangan tersebut berkaitan dengan aspek permodalan, perancangan produk, proses dan kapasitas produksi, sumber daya manusia, sistem informasi dan manajemen usaha.</p>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-size: 13px; font-family: ''Lucida Grande'', Tahoma, Verdana, georgia, ''palatino linotype'', palatino, ''times new roman'', times, serif; vertical-align: baseline; color: #333333; line-height: 17.920000076293945px;">Uraian aspek-aspek tersebut akan dimuat dalam dua tulisan. Bagian pertama akan membahas mengenai pendanaan atau modal, rancangan produk dan volume penjualan, sedangkan bagian kedua akan membahas proses dan kapasitas produksi, sumber daya manusia, sistem informasi dan manajemen usaha.</p>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-size: 13px; font-family: ''Lucida Grande'', Tahoma, Verdana, georgia, ''palatino linotype'', palatino, ''times new roman'', times, serif; vertical-align: baseline; color: #333333; line-height: 17.920000076293945px;"><strong>Proses dan Kapasitas Produksi</strong></p>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-size: 13px; font-family: ''Lucida Grande'', Tahoma, Verdana, georgia, ''palatino linotype'', palatino, ''times new roman'', times, serif; vertical-align: baseline; color: #333333; line-height: 17.920000076293945px;">Perencanaan proses produksi berkaitan dengan jenis proses apa yang akan digunakan untuk menghasilkan produk dan tata letak peralatan/mesin. Dalam manajemen industri, tahap pemilihan proses produksi dikenal dengan istilah <span style="margin: 0px; padding: 0px 1em 0px 0px; border: 0px; font-weight: bold; font-style: inherit; font-family: inherit; vertical-align: top;">tool engineering</span> yang didefinisikan sebagai <span style="margin: 0px; padding: 0px 1em 0px 0px; border: 0px; font-weight: bold; font-style: inherit; font-family: inherit; vertical-align: top;">“a specialized branch of engineering devoted primarily to planning the processes of economic manufacturing”</span>. Pemilihan proses produksi terkait erat dengan perhitungan ekonomi dari kegiatan yang akan dilakukan.</p>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-size: 13px; font-family: ''Lucida Grande'', Tahoma, Verdana, georgia, ''palatino linotype'', palatino, ''times new roman'', times, serif; vertical-align: baseline; color: #333333; line-height: 17.920000076293945px;">Beberapa pertimbangan ekonomi tersebut meliputi:</p>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-size: 13px; font-family: ''Lucida Grande'', Tahoma, Verdana, georgia, ''palatino linotype'', palatino, ''times new roman'', times, serif; vertical-align: baseline; color: #333333; line-height: 17.920000076293945px;">-       Penentuan tipe teknologi mesin yang akan digunakan</p>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-size: 13px; font-family: ''Lucida Grande'', Tahoma, Verdana, georgia, ''palatino linotype'', palatino, ''times new roman'', times, serif; vertical-align: baseline; color: #333333; line-height: 17.920000076293945px;">-       Penentuan bahan baku sesuai dengan rancangan kualitas produk yang akan dihasilkan</p>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-size: 13px; font-family: ''Lucida Grande'', Tahoma, Verdana, georgia, ''palatino linotype'', palatino, ''times new roman'', times, serif; vertical-align: baseline; color: #333333; line-height: 17.920000076293945px;">-       Penentuan <span style="margin: 0px; padding: 0px 1em 0px 0px; border: 0px; font-weight: bold; font-style: inherit; font-family: inherit; vertical-align: top;">rate of  return</span> dari modal yang diinvestasikan</p>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-size: 13px; font-family: ''Lucida Grande'', Tahoma, Verdana, georgia, ''palatino linotype'', palatino, ''times new roman'', times, serif; vertical-align: baseline; color: #333333; line-height: 17.920000076293945px;">Dengan dipilihnya suatu teknologi tertentu yang akan digunakan, maka bahan baku turut menyesuaikan teknologi tersebut, misalnya: teknologi yang dipilih hanya dapat memproses  bahan baku dengan kadar air maksimal 30%, maka bahan-bahan yang akan digunakan harus telah memiliki kadar air yang ditentukan.</p>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-size: 13px; font-family: ''Lucida Grande'', Tahoma, Verdana, georgia, ''palatino linotype'', palatino, ''times new roman'', times, serif; vertical-align: baseline; color: #333333; line-height: 17.920000076293945px;">Teknologi juga memengaruhi sistem operasi (tahapan proses) unit pengolahan. Ada teknologi yang mendahulukan proses basah terlebih dahulu baru selanjutnya proses kering atau sebaliknya.</p>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-size: 13px; font-family: ''Lucida Grande'', Tahoma, Verdana, georgia, ''palatino linotype'', palatino, ''times new roman'', times, serif; vertical-align: baseline; color: #333333; line-height: 17.920000076293945px;">Dengan demikian, kelompok tani atau Gapoktan yang akan menjalankan usaha pengolahan hasil perlu memahami proses produksi dan merencanakannya terlebih dahulu, sehingga ketika peralatan/mesin telah tersedia dapat langsung digunakan tanpa hambatan.</p>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-size: 13px; font-family: ''Lucida Grande'', Tahoma, Verdana, georgia, ''palatino linotype'', palatino, ''times new roman'', times, serif; vertical-align: baseline; color: #333333; line-height: 17.920000076293945px;"><strong>Analisa Membuat atau Membeli?</strong></p>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-size: 13px; font-family: ''Lucida Grande'', Tahoma, Verdana, georgia, ''palatino linotype'', palatino, ''times new roman'', times, serif; vertical-align: baseline; color: #333333; line-height: 17.920000076293945px;">Produk olahan berupa sirup nanas terdiri atas beragam jenis bahan atau komponen yang menyertainya. Bahan dapat terdiri dari buah nanas, gula, penguat rasa, dan pewarna makanan. Sedangkan komponen penyerta dapat terdiri dari bahan kemasan berupa botol kaca atau plastik, label, dan kardus pembungkus.</p>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-size: 13px; font-family: ''Lucida Grande'', Tahoma, Verdana, georgia, ''palatino linotype'', palatino, ''times new roman'', times, serif; vertical-align: baseline; color: #333333; line-height: 17.920000076293945px;">Dengan contoh di atas, dapat di pahami bahwa dalam suatu proses produksi ada beberapa bahan dan komponen yang tidak dibuat dalam proses tersebut, tetapi sangat dibutuhkan sebagai kesatuan utuh produk yang dihasilkan.</p>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-size: 13px; font-family: ''Lucida Grande'', Tahoma, Verdana, georgia, ''palatino linotype'', palatino, ''times new roman'', times, serif; vertical-align: baseline; color: #333333; line-height: 17.920000076293945px;">Dalam perencanaan usaha pengolahan hasil, perlu direncanakan bahan apa saja yang akan diproduksi sendiri dan yang tidak, sehingga perlu pengadaan dari pihak lain. Keputusan ini akan sangat terkait dengan proses produksi yang akan dijalankan, peralatan yang diperlukan dan sumberdaya manusia yang terlibat.</p>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-size: 13px; font-family: ''Lucida Grande'', Tahoma, Verdana, georgia, ''palatino linotype'', palatino, ''times new roman'', times, serif; vertical-align: baseline; color: #333333; line-height: 17.920000076293945px;"><strong>Sumberdaya Manusia</strong></p>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-size: 13px; font-family: ''Lucida Grande'', Tahoma, Verdana, georgia, ''palatino linotype'', palatino, ''times new roman'', times, serif; vertical-align: baseline; color: #333333; line-height: 17.920000076293945px;">Walaupun proses produksi sebagian atau sebagian besar dilakukan oleh perlatan atau mesin pengolahan, bukan berarti mengesampingkan kehadiran dan kualitas sumberdaya manusia. Justru dengan adanya peralatan atau mesin pengolahan, sumber dayam manusia harus meningkat kualitasnya agar dapat menjalankan dan mengoptimalkan peralatan yang ada.</p>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-size: 13px; font-family: ''Lucida Grande'', Tahoma, Verdana, georgia, ''palatino linotype'', palatino, ''times new roman'', times, serif; vertical-align: baseline; color: #333333; line-height: 17.920000076293945px;">Dalam merancang unit pengolahan hasil pertanian, sumberdaya manusia perlu disiapkan jumlah dan kualifikasinya. Petugas yang akan menjalankan unit pengolahan dapat ditihan atau magang di lokasi unit usaha yang sejenis.</p>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-size: 13px; font-family: ''Lucida Grande'', Tahoma, Verdana, georgia, ''palatino linotype'', palatino, ''times new roman'', times, serif; vertical-align: baseline; color: #333333; line-height: 17.920000076293945px;">Bila Pemerintah atau Pemerintah Daerah akan memfasilitasi alat atau mesin pengolahan kepada kelompok tani atau Gapoktan, maka harus dipastikan bahwa pada kelompok tersebut telah ada SDM yang memenuhi kualifikasi untuk menjalankan dan mengelolanya. Bila belum ada, maka terlebih dahulu perlu diadakan pelatihan dan pemagangan bagi calon pengelola.</p>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-size: 13px; font-family: ''Lucida Grande'', Tahoma, Verdana, georgia, ''palatino linotype'', palatino, ''times new roman'', times, serif; vertical-align: baseline; color: #333333; line-height: 17.920000076293945px;"><strong>Sistem Informasi</strong></p>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-size: 13px; font-family: ''Lucida Grande'', Tahoma, Verdana, georgia, ''palatino linotype'', palatino, ''times new roman'', times, serif; vertical-align: baseline; color: #333333; line-height: 17.920000076293945px;">Menjalankan unit pengolahan hasil pertanian perlu didukung oleh sistem informasi yang memadai. Sistem ini dapat dibuat dan diterapkan secara elektronik ataupun secara manual.</p>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-size: 13px; font-family: ''Lucida Grande'', Tahoma, Verdana, georgia, ''palatino linotype'', palatino, ''times new roman'', times, serif; vertical-align: baseline; color: #333333; line-height: 17.920000076293945px;">Secara sederhana sistem informasi ini harus dapat memandu petugas dalam menjalankan pekerjaannya, tahapan proses yang harus dilalui, jenis bahan yang digunakan, dan jumlah produk yang dihasilkan. Dengan sistem informasi, proses produksi tidak mengandalkan pengetahuan hanya dari satu orang tetapi memerlukan ketelibatan banyak pihak untuk menjalankannya.</p>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-size: 13px; font-family: ''Lucida Grande'', Tahoma, Verdana, georgia, ''palatino linotype'', palatino, ''times new roman'', times, serif; vertical-align: baseline; color: #333333; line-height: 17.920000076293945px;">Informasi yang diacu dapat diperbaharui oleh pengelola sesuai dengan perubahan yang terjadi karena adanya dinamika pasar, misalnya menaikan atau menurunkan jumlah produk, atau variasi produk.</p>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-size: 13px; font-family: ''Lucida Grande'', Tahoma, Verdana, georgia, ''palatino linotype'', palatino, ''times new roman'', times, serif; vertical-align: baseline; color: #333333; line-height: 17.920000076293945px;">Untuk itu, sebelum menjalankan unit pengolahan hasil pertanian, perlu ditentukan sistem informasi seperti apa yang akan digunakan, apakah elektronik atau menual, apakah tetap sepanjang waktu atau ada perubahan.</p>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-size: 13px; font-family: ''Lucida Grande'', Tahoma, Verdana, georgia, ''palatino linotype'', palatino, ''times new roman'', times, serif; vertical-align: baseline; color: #333333; line-height: 17.920000076293945px;"><strong>Manajemen Usaha</strong></p>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-size: 13px; font-family: ''Lucida Grande'', Tahoma, Verdana, georgia, ''palatino linotype'', palatino, ''times new roman'', times, serif; vertical-align: baseline; color: #333333; line-height: 17.920000076293945px;">Pengelola unit pengolahan hasil pertanian harus sudah memiliki rencana mengenai manajemen usaha yang akan dijalankan. Terlebih bila dikelola oleh kelompok tani atau Gapoktan.</p>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-size: 13px; font-family: ''Lucida Grande'', Tahoma, Verdana, georgia, ''palatino linotype'', palatino, ''times new roman'', times, serif; vertical-align: baseline; color: #333333; line-height: 17.920000076293945px;">Biasanya, Poktan atau Gapoktan membentuk unit tersendiri untuk menjalankan usaha pengolahan. Dengan demikian akan ada personil khusus mulai dari pengelola usaha hingga operator yang menjalankan usaha secara terstruktur.</p>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-size: 13px; font-family: ''Lucida Grande'', Tahoma, Verdana, georgia, ''palatino linotype'', palatino, ''times new roman'', times, serif; vertical-align: baseline; color: #333333; line-height: 17.920000076293945px;"> </p>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-size: 13px; font-family: ''Lucida Grande'', Tahoma, Verdana, georgia, ''palatino linotype'', palatino, ''times new roman'', times, serif; vertical-align: baseline; color: #333333; line-height: 17.920000076293945px;">[dds/pphp/ddsulaeman@gmail.com]</p>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-size: 13px; font-family: ''Lucida Grande'', Tahoma, Verdana, georgia, ''palatino linotype'', palatino, ''times new roman'', times, serif; vertical-align: baseline; color: #333333; line-height: 17.920000076293945px;">Referensi</p>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-size: 13px; font-family: ''Lucida Grande'', Tahoma, Verdana, georgia, ''palatino linotype'', palatino, ''times new roman'', times, serif; vertical-align: baseline; color: #333333; line-height: 17.920000076293945px;">Wignjosoebroto, Sritomo, 2009, Edisi Ketiga, Tata Letak Pabrik dan Pemindahan Bahan, Guna Widya, Surabaya</p>'),
(25, 'id_ID', 'Merancang Unit Pengolahan Hasil Pertanian', '<h1 class="entry_title" style="margin: 0px; padding: 0px 0px 5px; border: 0px; font-weight: normal; font-size: 26px; font-family: georgia, verdana, sans-serif; vertical-align: baseline; line-height: 26px; letter-spacing: -1px; color: #555555;">Merancang Unit Pengolahan Hasil Pertanian</h1>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-size: 13px; font-family: ''Lucida Grande'', Tahoma, Verdana, georgia, ''palatino linotype'', palatino, ''times new roman'', times, serif; vertical-align: baseline; color: #333333; line-height: 17.920000076293945px;"> </p>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-size: 13px; font-family: ''Lucida Grande'', Tahoma, Verdana, georgia, ''palatino linotype'', palatino, ''times new roman'', times, serif; vertical-align: baseline; color: #333333; line-height: 17.920000076293945px;">Agar usaha pengolahan hasil pertanian dapat berjalan dan berkembang dengan baik, dibutuhkan beberapa aspek perencanaan dan pengambilan keputusan.  Pertimbangan tersebut berkaitan dengan aspek permodalan, perancangan produk, proses dan kapasitas produksi, sumber daya manusia, sistem informasi dan manajemen usaha.</p>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-size: 13px; font-family: ''Lucida Grande'', Tahoma, Verdana, georgia, ''palatino linotype'', palatino, ''times new roman'', times, serif; vertical-align: baseline; color: #333333; line-height: 17.920000076293945px;">Uraian aspek-aspek tersebut akan dimuat dalam dua tulisan. Bagian pertama akan membahas mengenai pendanaan atau modal, rancangan produk dan volume penjualan, sedangkan bagian kedua akan membahas proses dan kapasitas produksi, sumber daya manusia sistem informasi dan manajemen usaha.</p>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-size: 13px; font-family: ''Lucida Grande'', Tahoma, Verdana, georgia, ''palatino linotype'', palatino, ''times new roman'', times, serif; vertical-align: baseline; color: #333333; line-height: 17.920000076293945px;"><strong>Pendanaan atau Modal</strong></p>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-size: 13px; font-family: ''Lucida Grande'', Tahoma, Verdana, georgia, ''palatino linotype'', palatino, ''times new roman'', times, serif; vertical-align: baseline; color: #333333; line-height: 17.920000076293945px;">Pendanaan pada suatu unit pengolahan dibagi menjadi tiga kategori yaitu pendanaan awal, pendanaan operasional dan pendanaan bagi pengembangan usaha.</p>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-size: 13px; font-family: ''Lucida Grande'', Tahoma, Verdana, georgia, ''palatino linotype'', palatino, ''times new roman'', times, serif; vertical-align: baseline; color: #333333; line-height: 17.920000076293945px;">Pendanaan awal dimaksudkan sebagai dana untuk pengadaan peralatan, mesin, dan bangunan pengolahan. Untuk proses pengolahan yang lebih kompleks, pendanaan awal dapat pula diperlukan untuk menyusun studi kelayakan atau penelusuran trend produk dan aspek pendukungnya.</p>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-size: 13px; font-family: ''Lucida Grande'', Tahoma, Verdana, georgia, ''palatino linotype'', palatino, ''times new roman'', times, serif; vertical-align: baseline; color: #333333; line-height: 17.920000076293945px;">Pada tingkat kelompok tani atau Gapoktan, pendanaan awal dapat berasal dari kontribusi anggota atau pinjaman lembaga keuangan. Beberapa kegiatan unit pengolahan hasil pertanian yang dilakukan kelompok juga dibantu oleh pemerintah/pemerintah daerah dalam pengadaan peralatan, mesin dan bangunan produksi.</p>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-size: 13px; font-family: ''Lucida Grande'', Tahoma, Verdana, georgia, ''palatino linotype'', palatino, ''times new roman'', times, serif; vertical-align: baseline; color: #333333; line-height: 17.920000076293945px;">Bila unit pengolahan telah dibangun, peralatan telah tersedia dan dipasang sesuai dengan tata letak yang direncanakan, maka proses produksi dapat mulai dijalankan. Pada tahap ini diperlukan pendanaan untuk pembelian bahan baku, bahan tambahan proses, bahan pendukung lainnya, biaya tenaga kerja, dan biaya perawatan atau perbaikan bangunan dan alat.</p>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-size: 13px; font-family: ''Lucida Grande'', Tahoma, Verdana, georgia, ''palatino linotype'', palatino, ''times new roman'', times, serif; vertical-align: baseline; color: #333333; line-height: 17.920000076293945px;">Kategori ke tiga adalah pendanaan untuk pengembangan usaha. Dengan berkembangnya usaha dan meningkatnya permintaan konsumen terhadap produk yang dihasilkan, kapasitas produksi perlu ditingkatkan. Untuk itu diperlukan pendanaan bagi pengembangan usaha yang dapat berasal dari internal perusahaan seperti hasil keuntungan atau eksternal seperti dari perbankan dan mitra kerja.</p>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-size: 13px; font-family: ''Lucida Grande'', Tahoma, Verdana, georgia, ''palatino linotype'', palatino, ''times new roman'', times, serif; vertical-align: baseline; color: #333333; line-height: 17.920000076293945px;"><strong>Rancangan Produk</strong></p>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-size: 13px; font-family: ''Lucida Grande'', Tahoma, Verdana, georgia, ''palatino linotype'', palatino, ''times new roman'', times, serif; vertical-align: baseline; color: #333333; line-height: 17.920000076293945px;">Produk yang akan dibuat perlu dirancang dengan baik. Rancangan produk terkait dengan jenis produk, kualitas produk, bahan baku yang diperlukan, peralatan dan bangunan untuk pembuatan produk.</p>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-size: 13px; font-family: ''Lucida Grande'', Tahoma, Verdana, georgia, ''palatino linotype'', palatino, ''times new roman'', times, serif; vertical-align: baseline; color: #333333; line-height: 17.920000076293945px;">Untuk mewujudkan suatu produk, perlu diperhatikan pula aspek fungsi dari produk yang dihasilkan dan kemudahan untuk pembuatannya. Aspek fungsi yang dimaksud adalah, bila produk yang akan dihasilkan adalah makanan siap makan <span style="margin: 0px; padding: 0px 1em 0px 0px; border: 0px; font-weight: bold; font-style: inherit; font-family: inherit; vertical-align: top;">(ready to eat)</span>, maka harus dipastikan bahwa seluruh bahan dan prosesnya mendukung untuk terciptanya produk tersebut. Sedangkan aspek kemudahan pembuatan, terkait dengan jaminan bahwa produk tersebut dapat dibuat dengan teknik tertentu yang dikuasai oleh pengelola usaha.</p>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-size: 13px; font-family: ''Lucida Grande'', Tahoma, Verdana, georgia, ''palatino linotype'', palatino, ''times new roman'', times, serif; vertical-align: baseline; color: #333333; line-height: 17.920000076293945px;"><strong>Volume Penjualan</strong></p>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-size: 13px; font-family: ''Lucida Grande'', Tahoma, Verdana, georgia, ''palatino linotype'', palatino, ''times new roman'', times, serif; vertical-align: baseline; color: #333333; line-height: 17.920000076293945px;">Banyak usaha di tingkat kelompok tani keliru merencanakan unit usaha dan alat serta bangunan yang diperlukan, karena kelompok tersebut merancang volume produksi dan bukan volume penjualan.</p>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-size: 13px; font-family: ''Lucida Grande'', Tahoma, Verdana, georgia, ''palatino linotype'', palatino, ''times new roman'', times, serif; vertical-align: baseline; color: #333333; line-height: 17.920000076293945px;">Salah satu informasi penting dalam sistem unit produksi pengolahan hasil pertanian adalah besaran volume produk yang dikehendaki oleh konsumen atau pasar. Informasi ini terutama sekali berguna untuk menentukan jumlah dan kapasitas mesin produksi.</p>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-size: 13px; font-family: ''Lucida Grande'', Tahoma, Verdana, georgia, ''palatino linotype'', palatino, ''times new roman'', times, serif; vertical-align: baseline; color: #333333; line-height: 17.920000076293945px;">Dengan demikian, survai pasar yang dilakukan tidak terbatas pada minat konsumen pada produk yang akan dijual tetapi juga seberapa besar konsumen memerlukan atau akan membeli produk tersebut.</p>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-size: 13px; font-family: ''Lucida Grande'', Tahoma, Verdana, georgia, ''palatino linotype'', palatino, ''times new roman'', times, serif; vertical-align: baseline; color: #333333; line-height: 17.920000076293945px;"> </p>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-size: 13px; font-family: ''Lucida Grande'', Tahoma, Verdana, georgia, ''palatino linotype'', palatino, ''times new roman'', times, serif; vertical-align: baseline; color: #333333; line-height: 17.920000076293945px;">[dds/pphp/ddsulaeman@gmail.com]</p>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-size: 13px; font-family: ''Lucida Grande'', Tahoma, Verdana, georgia, ''palatino linotype'', palatino, ''times new roman'', times, serif; vertical-align: baseline; color: #333333; line-height: 17.920000076293945px;">Referensi</p>\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-size: 13px; font-family: ''Lucida Grande'', Tahoma, Verdana, georgia, ''palatino linotype'', palatino, ''times new roman'', times, serif; vertical-align: baseline; color: #333333; line-height: 17.920000076293945px;">Wignjosoebroto, Sritomo, 2009, Edisi Ketiga, Tata Letak Pabrik dan Pemindahan Bahan, Guna Widya, Surabaya</p>');

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_plugin_category`
--

CREATE TABLE IF NOT EXISTS `oc_t_plugin_category` (
  `s_plugin_name` varchar(40) NOT NULL,
  `fk_i_category_id` int(10) unsigned NOT NULL,
  KEY `fk_i_category_id` (`fk_i_category_id`),
  KEY `fk_i_category_id_2` (`fk_i_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_t_plugin_category`
--

INSERT INTO `oc_t_plugin_category` (`s_plugin_name`, `fk_i_category_id`) VALUES
('products_plugin', 97),
('products_plugin', 100),
('products_plugin', 99),
('products_plugin', 102),
('products_plugin', 101),
('products_plugin', 103),
('products_plugin', 96),
('products_plugin', 104),
('products_plugin', 105),
('products_plugin', 98),
('products_plugin', 106),
('products_plugin', 107);

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_preference`
--

CREATE TABLE IF NOT EXISTS `oc_t_preference` (
  `s_section` varchar(40) NOT NULL,
  `s_name` varchar(40) NOT NULL,
  `s_value` longtext NOT NULL,
  `e_type` enum('STRING','INTEGER','BOOLEAN') NOT NULL,
  UNIQUE KEY `s_section` (`s_section`,`s_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_t_preference`
--

INSERT INTO `oc_t_preference` (`s_section`, `s_name`, `s_value`, `e_type`) VALUES
('alterego_theme', 'default_logo', '0', 'STRING'),
('alterego_theme', 'donation', '0', 'STRING'),
('alterego_theme', 'footer_link', '1', 'STRING'),
('alterego_theme', 'keyword_placeholder', 'Cari disini ...', 'STRING'),
('alterego_theme', 'version', 'alterego_THEME_VERSION', 'STRING'),
('bender_theme', 'defaultShowAs@all', 'list', 'STRING'),
('bender_theme', 'donation', '0', 'STRING'),
('bender_theme', 'footer_link', '1', 'STRING'),
('bender_theme', 'keyword_placeholder', 'ie. PHP Programmer', 'STRING'),
('bender_theme', 'version', '1.0.1', 'STRING'),
('facebook_connect', 'fbc_appId', '', 'STRING'),
('facebook_connect', 'fbc_secret', '', 'STRING'),
('modern_admin_theme', 'compact_mode', '1', 'STRING'),
('osclass', 'active_plugins', 'a:4:{i:0;s:18:"facebook/index.php";i:5;s:23:"company_logos/index.php";i:6;s:30:"carousel_for_osclass/index.php";i:7;s:20:"osc_mobile/index.php";}', 'STRING'),
('osclass', 'admin_language', 'en_US', 'STRING'),
('osclass', 'admin_theme', 'modern', 'STRING'),
('osclass', 'akismetKey', '', 'STRING'),
('osclass', 'allowedExt', 'png,gif,jpg,jpeg', 'STRING'),
('osclass', 'allow_report_osclass', '0', 'BOOLEAN'),
('osclass', 'auto_cron', '1', 'STRING'),
('osclass', 'auto_update', 'major|plugins|themes|languages', 'STRING'),
('osclass', 'comments_per_page', '10', 'STRING'),
('osclass', 'contactEmail', 'admin@usahatani.com', 'STRING'),
('osclass', 'contact_attachment', '0', 'STRING'),
('osclass', 'csrf_name', 'CSRF1404147290', 'STRING'),
('osclass', 'currency', 'IDR', 'STRING'),
('osclass', 'dateFormat', 'd/m/Y', 'STRING'),
('osclass', 'defaultOrderField@search', 'dt_pub_date', 'STRING'),
('osclass', 'defaultOrderType@search', '1', 'BOOLEAN'),
('osclass', 'defaultResultsPerPage@search', '12', 'STRING'),
('osclass', 'defaultShowAs@search', 'list', 'STRING'),
('osclass', 'description_character_length', '5000', 'INTEGER'),
('osclass', 'dimNormal', '640x480', 'STRING'),
('osclass', 'dimPreview', '480x340', 'STRING'),
('osclass', 'dimThumbnail', '240x200', 'STRING'),
('osclass', 'enabled_comments', '0', 'STRING'),
('osclass', 'enabled_recaptcha_items', '0', 'BOOLEAN'),
('osclass', 'enabled_users', '1', 'STRING'),
('osclass', 'enabled_user_registration', '1', 'STRING'),
('osclass', 'enabled_user_validation', '0', 'STRING'),
('osclass', 'enableField#f_price@items', '1', 'BOOLEAN'),
('osclass', 'enableField#images@items', '1', 'BOOLEAN'),
('osclass', 'force_aspect_image', '0', 'BOOLEAN'),
('osclass', 'installed_plugins', 'a:9:{i:0;s:18:"facebook/index.php";i:1;s:26:"google_analytics/index.php";i:2;s:21:"google_maps/index.php";i:3;s:27:"location_required/index.php";i:4;s:20:"osc_mobile/index.php";i:5;s:31:"registered_users_only/index.php";i:6;s:23:"company_logos/index.php";i:7;s:30:"carousel_for_osclass/index.php";i:8;s:29:"products_attributes/index.php";}', 'STRING'),
('osclass', 'items_wait_time', '0', 'INTEGER'),
('osclass', 'item_attachment', '0', 'BOOLEAN'),
('osclass', 'keep_original_image', '1', 'BOOLEAN'),
('osclass', 'language', 'id_ID', 'STRING'),
('osclass', 'languages_downloaded', '["en_US","id_ID"]', 'STRING'),
('osclass', 'languages_last_version_check', '1393245641', 'STRING'),
('osclass', 'languages_to_update', '[]', 'STRING'),
('osclass', 'languages_update_count', '0', 'STRING'),
('osclass', 'last_version_check', '1393245625', 'STRING'),
('osclass', 'location_todo', '500', 'STRING'),
('osclass', 'logged_user_item_validation', '1', 'BOOLEAN'),
('osclass', 'mailserver_auth', '', 'BOOLEAN'),
('osclass', 'mailserver_host', 'localhost', 'STRING'),
('osclass', 'mailserver_mail_from', '', 'STRING'),
('osclass', 'mailserver_name_from', '', 'STRING'),
('osclass', 'mailserver_password', '', 'STRING'),
('osclass', 'mailserver_pop', '', 'BOOLEAN'),
('osclass', 'mailserver_port', '', 'INTEGER'),
('osclass', 'mailserver_ssl', '', 'STRING'),
('osclass', 'mailserver_type', 'custom', 'STRING'),
('osclass', 'mailserver_username', '', 'STRING'),
('osclass', 'marketAllowExternalSources', '0', 'STRING'),
('osclass', 'marketURL', 'http://market.osclass.org/api/', 'STRING'),
('osclass', 'maxLatestItems@home', '12', 'STRING'),
('osclass', 'maxResultsPerPage@search', '50', 'INTEGER'),
('osclass', 'maxSizeKb', '2048', 'INTEGER'),
('osclass', 'moderate_comments', '-1', 'STRING'),
('osclass', 'moderate_items', '-1', 'INTEGER'),
('osclass', 'mod_rewrite_loaded', '0', 'BOOLEAN'),
('osclass', 'notify_contact_friends', '1', 'BOOLEAN'),
('osclass', 'notify_contact_item', '1', 'BOOLEAN'),
('osclass', 'notify_new_comment', '0', 'STRING'),
('osclass', 'notify_new_comment_user', '0', 'STRING'),
('osclass', 'notify_new_item', '1', 'BOOLEAN'),
('osclass', 'notify_new_user', '0', 'STRING'),
('osclass', 'numImages@items', '4', 'INTEGER'),
('osclass', 'num_rss_items', '50', 'STRING'),
('osclass', 'osclass_installed', '1', 'BOOLEAN'),
('osclass', 'pageDesc', 'UsahaTani', 'STRING'),
('osclass', 'pageTitle', 'UsahaTani', 'STRING'),
('osclass', 'ping_search_engines', '0', 'BOOLEAN'),
('osclass', 'plugins_downloaded', '["","","facebook-connect","osc-mobile","http:\\/\\/www.osclass.org\\/files\\/plugins\\/google_analytics\\/update.php","http:\\/\\/www.osclass.org\\/files\\/plugins\\/google_maps\\/update.php","location-required","products-attributes","registered-users-only","ads-4-osclass"]', 'STRING'),
('osclass', 'plugins_last_version_check', '1393254453', 'STRING'),
('osclass', 'plugins_to_update', '[]', 'STRING'),
('osclass', 'plugins_update_count', '0', 'STRING'),
('osclass', 'purge_latest_searches', 'week', 'STRING'),
('osclass', 'recaptchaPrivKey', '', 'STRING'),
('osclass', 'recaptchaPubKey', '', 'STRING'),
('osclass', 'reg_user_can_contact', '0', 'BOOLEAN'),
('osclass', 'reg_user_post', '0', 'BOOLEAN'),
('osclass', 'reg_user_post_comments', '0', 'STRING'),
('osclass', 'rewriteEnabled', '0', 'BOOLEAN'),
('osclass', 'rewrite_cat_url', '{CATEGORIES}', 'STRING'),
('osclass', 'rewrite_contact', 'contact', 'STRING'),
('osclass', 'rewrite_feed', 'feed', 'STRING'),
('osclass', 'rewrite_item_activate', 'item/activate', 'STRING'),
('osclass', 'rewrite_item_contact', 'item/contact', 'STRING'),
('osclass', 'rewrite_item_delete', 'item/delete', 'STRING'),
('osclass', 'rewrite_item_edit', 'item/edit', 'STRING'),
('osclass', 'rewrite_item_mark', 'item/mark', 'STRING'),
('osclass', 'rewrite_item_new', 'item/new', 'STRING'),
('osclass', 'rewrite_item_resource_delete', 'resource/delete', 'STRING'),
('osclass', 'rewrite_item_send_friend', 'item/send-friend', 'STRING'),
('osclass', 'rewrite_item_url', '{CATEGORIES}/{ITEM_TITLE}_i{ITEM_ID}', 'STRING'),
('osclass', 'rewrite_language', 'language', 'STRING'),
('osclass', 'rewrite_page_url', '{PAGE_SLUG}-p{PAGE_ID}', 'STRING'),
('osclass', 'rewrite_rules', '', 'STRING'),
('osclass', 'rewrite_search_category', 'category', 'STRING'),
('osclass', 'rewrite_search_city', 'city', 'STRING'),
('osclass', 'rewrite_search_city_area', 'cityarea', 'STRING'),
('osclass', 'rewrite_search_country', 'country', 'STRING'),
('osclass', 'rewrite_search_pattern', 'pattern', 'STRING'),
('osclass', 'rewrite_search_region', 'region', 'STRING'),
('osclass', 'rewrite_search_url', 'search', 'STRING'),
('osclass', 'rewrite_search_user', 'user', 'STRING'),
('osclass', 'rewrite_user_activate', 'user/activate', 'STRING'),
('osclass', 'rewrite_user_activate_alert', 'alert/confirm', 'STRING'),
('osclass', 'rewrite_user_alerts', 'user/alerts', 'STRING'),
('osclass', 'rewrite_user_change_email', 'email/change', 'STRING'),
('osclass', 'rewrite_user_change_email_confirm', 'email/confirm', 'STRING'),
('osclass', 'rewrite_user_change_password', 'password/change', 'STRING'),
('osclass', 'rewrite_user_change_username', 'username/change', 'STRING'),
('osclass', 'rewrite_user_dashboard', 'user/dashboard', 'STRING'),
('osclass', 'rewrite_user_forgot', 'user/forgot', 'STRING'),
('osclass', 'rewrite_user_items', 'user/items', 'STRING'),
('osclass', 'rewrite_user_login', 'user/login', 'STRING'),
('osclass', 'rewrite_user_logout', 'user/logout', 'STRING'),
('osclass', 'rewrite_user_profile', 'user/profile', 'STRING'),
('osclass', 'rewrite_user_recover', 'user/recover', 'STRING'),
('osclass', 'rewrite_user_register', 'user/register', 'STRING'),
('osclass', 'save_latest_searches', '1', 'STRING'),
('osclass', 'selectable_parent_categories', '', 'STRING'),
('osclass', 'seo_url_search_prefix', '', 'STRING'),
('osclass', 'subdomain_host', '', 'STRING'),
('osclass', 'subdomain_type', '', 'STRING'),
('osclass', 'theme', 'alterego', 'STRING'),
('osclass', 'themes_downloaded', '[""]', 'STRING'),
('osclass', 'themes_last_version_check', '1393245625', 'STRING'),
('osclass', 'themes_to_update', '[]', 'STRING'),
('osclass', 'themes_update_count', '0', 'STRING'),
('osclass', 'timeFormat', 'g:i A', 'STRING'),
('osclass', 'timezone', 'Asia/Jakarta', 'STRING'),
('osclass', 'title_character_length', '100', 'INTEGER'),
('osclass', 'update_core_json', '', 'STRING'),
('osclass', 'username_blacklist', 'admin,user', 'STRING'),
('osclass', 'use_imagick', '0', 'BOOLEAN'),
('osclass', 'version', '332', 'STRING'),
('osclass', 'warn_expiration', '0', 'INTEGER'),
('osclass', 'watermark_image', '', 'STRING'),
('osclass', 'watermark_place', 'centre', 'STRING'),
('osclass', 'watermark_text', '', 'STRING'),
('osclass', 'watermark_text_color', '', 'STRING'),
('osclass', 'weekStart', '1', 'STRING'),
('plugin-carousel_for_osclass', 'carousel_arrows', '1', 'INTEGER'),
('plugin-carousel_for_osclass', 'carousel_autoscroll', '1', 'INTEGER'),
('plugin-carousel_for_osclass', 'carousel_b_color', '#E9F5F9', 'STRING'),
('plugin-carousel_for_osclass', 'carousel_height', '120', 'INTEGER'),
('plugin-carousel_for_osclass', 'carousel_items', '2', 'INTEGER'),
('plugin-carousel_for_osclass', 'carousel_i_color', '#94CEE4', 'STRING'),
('plugin-carousel_for_osclass', 'carousel_limit', '15', 'INTEGER'),
('plugin-carousel_for_osclass', 'carousel_picOnly', '0', 'INTEGER'),
('plugin-carousel_for_osclass', 'carousel_premiumOnly', '0', 'INTEGER'),
('plugin-carousel_for_osclass', 'carousel_priceEnabled', '1', 'INTEGER'),
('plugin-carousel_for_osclass', 'carousel_random', '1', 'INTEGER'),
('plugin-carousel_for_osclass', 'carousel_scrolldelay', '2800', 'INTEGER'),
('plugin-carousel_for_osclass', 'carousel_scrollNum', '1', 'INTEGER'),
('plugin-carousel_for_osclass', 'carousel_sDir', '+', 'STRING'),
('plugin-carousel_for_osclass', 'carousel_Sheight', '110', 'INTEGER'),
('plugin-carousel_for_osclass', 'carousel_Swidth', '140', 'INTEGER'),
('plugin-carousel_for_osclass', 'carousel_version', '2.5.1', 'STRING'),
('plugin-carousel_for_osclass', 'carousel_vertical', '0', 'INTEGER'),
('plugin-carousel_for_osclass', 'carousel_width', '864', 'INTEGER'),
('plugin-google_analytics', 'google_analytics_id', '', 'STRING');

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_region`
--

CREATE TABLE IF NOT EXISTS `oc_t_region` (
  `pk_i_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_c_country_code` char(2) NOT NULL,
  `s_name` varchar(60) NOT NULL,
  `s_slug` varchar(60) NOT NULL DEFAULT '',
  `b_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`pk_i_id`),
  KEY `fk_c_country_code` (`fk_c_country_code`),
  KEY `idx_s_name` (`s_name`),
  KEY `idx_s_slug` (`s_slug`),
  KEY `fk_c_country_code_2` (`fk_c_country_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=781464 ;

--
-- Dumping data for table `oc_t_region`
--

INSERT INTO `oc_t_region` (`pk_i_id`, `fk_c_country_code`, `s_name`, `s_slug`, `b_active`) VALUES
(781431, 'id', 'Aceh', '', 1),
(781432, 'id', 'Bali', '', 1),
(781433, 'id', 'Bangka Belitung Islands', '', 1),
(781434, 'id', 'Banten', '', 1),
(781435, 'id', 'Bengkulu', '', 1),
(781436, 'id', 'Central Java', '', 1),
(781437, 'id', 'Central Kalimantan', '', 1),
(781438, 'id', 'Central Sulawesi', '', 1),
(781439, 'id', 'East Java', '', 1),
(781440, 'id', 'East Kalimantan', '', 1),
(781441, 'id', 'East Nusa Tenggara', '', 1),
(781442, 'id', 'Gorontalo', '', 1),
(781443, 'id', 'Jakarta', '', 1),
(781444, 'id', 'Jambi', '', 1),
(781445, 'id', 'Lampung', '', 1),
(781446, 'id', 'Maluku', '', 1),
(781447, 'id', 'North Maluku', '', 1),
(781448, 'id', 'North Sulawesi', '', 1),
(781449, 'id', 'North Sumatra', '', 1),
(781450, 'id', 'Papua', '', 1),
(781451, 'id', 'Riau', '', 1),
(781452, 'id', 'Riau Islands', '', 1),
(781453, 'id', 'South East Sulawesi', '', 1),
(781454, 'id', 'South Kalimantan', '', 1),
(781455, 'id', 'South Sulawesi', '', 1),
(781456, 'id', 'South Sumatra', '', 1),
(781457, 'id', 'West Java', '', 1),
(781458, 'id', 'West Kalimantan', '', 1),
(781459, 'id', 'West Nusa Tenggara', '', 1),
(781460, 'id', 'West Papua', '', 1),
(781461, 'id', 'West Sulawesi', '', 1),
(781462, 'id', 'West Sumatra', '', 1),
(781463, 'id', 'Yogyakarta', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_region_stats`
--

CREATE TABLE IF NOT EXISTS `oc_t_region_stats` (
  `fk_i_region_id` int(10) unsigned NOT NULL,
  `i_num_items` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fk_i_region_id`),
  KEY `idx_num_items` (`i_num_items`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_t_region_stats`
--

INSERT INTO `oc_t_region_stats` (`fk_i_region_id`, `i_num_items`) VALUES
(781431, 0),
(781432, 0),
(781433, 0),
(781434, 0),
(781435, 0),
(781436, 0),
(781437, 0),
(781438, 0),
(781439, 0),
(781440, 0),
(781441, 0),
(781442, 0),
(781443, 0),
(781444, 0),
(781445, 0),
(781446, 0),
(781447, 0),
(781448, 0),
(781449, 0),
(781450, 0),
(781451, 0),
(781452, 0),
(781453, 0),
(781454, 0),
(781455, 0),
(781456, 0),
(781457, 0),
(781458, 0),
(781459, 0),
(781460, 0),
(781461, 0),
(781462, 0),
(781463, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_user`
--

CREATE TABLE IF NOT EXISTS `oc_t_user` (
  `pk_i_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dt_reg_date` datetime NOT NULL,
  `dt_mod_date` datetime DEFAULT NULL,
  `s_name` varchar(100) NOT NULL,
  `s_username` varchar(100) NOT NULL,
  `s_password` char(60) NOT NULL,
  `s_secret` varchar(40) DEFAULT NULL,
  `s_email` varchar(100) DEFAULT NULL,
  `s_website` varchar(100) DEFAULT NULL,
  `s_phone_land` varchar(45) DEFAULT NULL,
  `s_phone_mobile` varchar(45) DEFAULT NULL,
  `b_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `b_active` tinyint(1) NOT NULL DEFAULT '0',
  `s_pass_code` varchar(100) DEFAULT NULL,
  `s_pass_date` datetime DEFAULT NULL,
  `s_pass_ip` varchar(15) DEFAULT NULL,
  `fk_c_country_code` char(2) DEFAULT NULL,
  `s_country` varchar(40) DEFAULT NULL,
  `s_address` varchar(100) DEFAULT NULL,
  `s_zip` varchar(15) DEFAULT NULL,
  `fk_i_region_id` int(10) unsigned DEFAULT NULL,
  `s_region` varchar(100) DEFAULT NULL,
  `fk_i_city_id` int(10) unsigned DEFAULT NULL,
  `s_city` varchar(100) DEFAULT NULL,
  `fk_i_city_area_id` int(10) unsigned DEFAULT NULL,
  `s_city_area` varchar(200) DEFAULT NULL,
  `d_coord_lat` decimal(10,6) DEFAULT NULL,
  `d_coord_long` decimal(10,6) DEFAULT NULL,
  `b_company` tinyint(1) NOT NULL DEFAULT '0',
  `i_items` int(10) unsigned DEFAULT '0',
  `i_comments` int(10) unsigned DEFAULT '0',
  `dt_access_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `s_access_ip` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`pk_i_id`),
  UNIQUE KEY `s_email` (`s_email`),
  KEY `idx_s_name` (`s_name`(6)),
  KEY `idx_s_username` (`s_username`),
  KEY `fk_c_country_code` (`fk_c_country_code`),
  KEY `fk_i_region_id` (`fk_i_region_id`),
  KEY `fk_i_city_id` (`fk_i_city_id`),
  KEY `fk_i_city_area_id` (`fk_i_city_area_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `oc_t_user`
--

INSERT INTO `oc_t_user` (`pk_i_id`, `dt_reg_date`, `dt_mod_date`, `s_name`, `s_username`, `s_password`, `s_secret`, `s_email`, `s_website`, `s_phone_land`, `s_phone_mobile`, `b_enabled`, `b_active`, `s_pass_code`, `s_pass_date`, `s_pass_ip`, `fk_c_country_code`, `s_country`, `s_address`, `s_zip`, `fk_i_region_id`, `s_region`, `fk_i_city_id`, `s_city`, `fk_i_city_area_id`, `s_city_area`, `d_coord_lat`, `d_coord_long`, `b_company`, `i_items`, `i_comments`, `dt_access_date`, `s_access_ip`) VALUES
(1, '2014-02-14 19:52:17', NULL, 'tes adh', '1', '$2y$15$XP3RHoKR/1wC0sFxVyAx/.2nHMq4S9VWYmrUVl29rpLVx.uKnl8ky', 'udyqqYNd', 'teas@mail.com', 'http://', '', '', 1, 1, NULL, NULL, NULL, NULL, '', '', '', NULL, '', NULL, '', NULL, '', NULL, NULL, 0, 2, 0, '2014-02-14 19:53:24', '127.0.0.1');

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_user_description`
--

CREATE TABLE IF NOT EXISTS `oc_t_user_description` (
  `fk_i_user_id` int(10) unsigned NOT NULL,
  `fk_c_locale_code` char(5) NOT NULL,
  `s_info` text,
  PRIMARY KEY (`fk_i_user_id`,`fk_c_locale_code`),
  KEY `fk_c_locale_code` (`fk_c_locale_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_user_email_tmp`
--

CREATE TABLE IF NOT EXISTS `oc_t_user_email_tmp` (
  `fk_i_user_id` int(10) unsigned NOT NULL,
  `s_new_email` varchar(100) NOT NULL,
  `dt_date` datetime NOT NULL,
  PRIMARY KEY (`fk_i_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_widget`
--

CREATE TABLE IF NOT EXISTS `oc_t_widget` (
  `pk_i_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `s_description` varchar(40) NOT NULL,
  `s_location` varchar(40) NOT NULL,
  `e_kind` enum('TEXT','HTML') NOT NULL,
  `s_content` mediumtext NOT NULL,
  PRIMARY KEY (`pk_i_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `oc_t_category`
--
ALTER TABLE `oc_t_category`
  ADD CONSTRAINT `oc_t_category_ibfk_1` FOREIGN KEY (`fk_i_parent_id`) REFERENCES `oc_t_category` (`pk_i_id`);

--
-- Constraints for table `oc_t_category_description`
--
ALTER TABLE `oc_t_category_description`
  ADD CONSTRAINT `oc_t_category_description_ibfk_1` FOREIGN KEY (`fk_i_category_id`) REFERENCES `oc_t_category` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_category_description_ibfk_2` FOREIGN KEY (`fk_c_locale_code`) REFERENCES `oc_t_locale` (`pk_c_code`);

--
-- Constraints for table `oc_t_category_stats`
--
ALTER TABLE `oc_t_category_stats`
  ADD CONSTRAINT `oc_t_category_stats_ibfk_1` FOREIGN KEY (`fk_i_category_id`) REFERENCES `oc_t_category` (`pk_i_id`);

--
-- Constraints for table `oc_t_city`
--
ALTER TABLE `oc_t_city`
  ADD CONSTRAINT `oc_t_city_ibfk_1` FOREIGN KEY (`fk_i_region_id`) REFERENCES `oc_t_region` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_city_ibfk_2` FOREIGN KEY (`fk_c_country_code`) REFERENCES `oc_t_country` (`pk_c_code`);

--
-- Constraints for table `oc_t_city_area`
--
ALTER TABLE `oc_t_city_area`
  ADD CONSTRAINT `oc_t_city_area_ibfk_1` FOREIGN KEY (`fk_i_city_id`) REFERENCES `oc_t_city` (`pk_i_id`);

--
-- Constraints for table `oc_t_city_stats`
--
ALTER TABLE `oc_t_city_stats`
  ADD CONSTRAINT `oc_t_city_stats_ibfk_1` FOREIGN KEY (`fk_i_city_id`) REFERENCES `oc_t_city` (`pk_i_id`);

--
-- Constraints for table `oc_t_country_stats`
--
ALTER TABLE `oc_t_country_stats`
  ADD CONSTRAINT `oc_t_country_stats_ibfk_1` FOREIGN KEY (`fk_c_country_code`) REFERENCES `oc_t_country` (`pk_c_code`);

--
-- Constraints for table `oc_t_facebook_connect`
--
ALTER TABLE `oc_t_facebook_connect`
  ADD CONSTRAINT `oc_t_facebook_connect_ibfk_1` FOREIGN KEY (`fk_i_user_id`) REFERENCES `oc_t_user` (`pk_i_id`);

--
-- Constraints for table `oc_t_item`
--
ALTER TABLE `oc_t_item`
  ADD CONSTRAINT `oc_t_item_ibfk_1` FOREIGN KEY (`fk_i_user_id`) REFERENCES `oc_t_user` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_item_ibfk_2` FOREIGN KEY (`fk_i_category_id`) REFERENCES `oc_t_category` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_item_ibfk_3` FOREIGN KEY (`fk_c_currency_code`) REFERENCES `oc_t_currency` (`pk_c_code`);

--
-- Constraints for table `oc_t_item_comment`
--
ALTER TABLE `oc_t_item_comment`
  ADD CONSTRAINT `oc_t_item_comment_ibfk_1` FOREIGN KEY (`fk_i_item_id`) REFERENCES `oc_t_item` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_item_comment_ibfk_2` FOREIGN KEY (`fk_i_user_id`) REFERENCES `oc_t_user` (`pk_i_id`);

--
-- Constraints for table `oc_t_item_location`
--
ALTER TABLE `oc_t_item_location`
  ADD CONSTRAINT `oc_t_item_location_ibfk_1` FOREIGN KEY (`fk_i_item_id`) REFERENCES `oc_t_item` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_item_location_ibfk_2` FOREIGN KEY (`fk_c_country_code`) REFERENCES `oc_t_country` (`pk_c_code`),
  ADD CONSTRAINT `oc_t_item_location_ibfk_3` FOREIGN KEY (`fk_i_region_id`) REFERENCES `oc_t_region` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_item_location_ibfk_4` FOREIGN KEY (`fk_i_city_id`) REFERENCES `oc_t_city` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_item_location_ibfk_5` FOREIGN KEY (`fk_i_city_area_id`) REFERENCES `oc_t_city_area` (`pk_i_id`);

--
-- Constraints for table `oc_t_item_meta`
--
ALTER TABLE `oc_t_item_meta`
  ADD CONSTRAINT `oc_t_item_meta_ibfk_1` FOREIGN KEY (`fk_i_item_id`) REFERENCES `oc_t_item` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_item_meta_ibfk_2` FOREIGN KEY (`fk_i_field_id`) REFERENCES `oc_t_meta_fields` (`pk_i_id`);

--
-- Constraints for table `oc_t_item_products_attr`
--
ALTER TABLE `oc_t_item_products_attr`
  ADD CONSTRAINT `oc_t_item_products_attr_ibfk_1` FOREIGN KEY (`fk_i_item_id`) REFERENCES `oc_t_item` (`pk_i_id`);

--
-- Constraints for table `oc_t_item_resource`
--
ALTER TABLE `oc_t_item_resource`
  ADD CONSTRAINT `oc_t_item_resource_ibfk_1` FOREIGN KEY (`fk_i_item_id`) REFERENCES `oc_t_item` (`pk_i_id`);

--
-- Constraints for table `oc_t_item_stats`
--
ALTER TABLE `oc_t_item_stats`
  ADD CONSTRAINT `oc_t_item_stats_ibfk_1` FOREIGN KEY (`fk_i_item_id`) REFERENCES `oc_t_item` (`pk_i_id`);

--
-- Constraints for table `oc_t_keywords`
--
ALTER TABLE `oc_t_keywords`
  ADD CONSTRAINT `oc_t_keywords_ibfk_1` FOREIGN KEY (`fk_i_category_id`) REFERENCES `oc_t_category` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_keywords_ibfk_2` FOREIGN KEY (`fk_i_city_id`) REFERENCES `oc_t_city` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_keywords_ibfk_3` FOREIGN KEY (`fk_c_locale_code`) REFERENCES `oc_t_locale` (`pk_c_code`);

--
-- Constraints for table `oc_t_meta_categories`
--
ALTER TABLE `oc_t_meta_categories`
  ADD CONSTRAINT `oc_t_meta_categories_ibfk_1` FOREIGN KEY (`fk_i_category_id`) REFERENCES `oc_t_category` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_meta_categories_ibfk_2` FOREIGN KEY (`fk_i_field_id`) REFERENCES `oc_t_meta_fields` (`pk_i_id`);

--
-- Constraints for table `oc_t_pages_description`
--
ALTER TABLE `oc_t_pages_description`
  ADD CONSTRAINT `oc_t_pages_description_ibfk_1` FOREIGN KEY (`fk_i_pages_id`) REFERENCES `oc_t_pages` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_pages_description_ibfk_2` FOREIGN KEY (`fk_c_locale_code`) REFERENCES `oc_t_locale` (`pk_c_code`);

--
-- Constraints for table `oc_t_plugin_category`
--
ALTER TABLE `oc_t_plugin_category`
  ADD CONSTRAINT `oc_t_plugin_category_ibfk_1` FOREIGN KEY (`fk_i_category_id`) REFERENCES `oc_t_category` (`pk_i_id`);

--
-- Constraints for table `oc_t_region`
--
ALTER TABLE `oc_t_region`
  ADD CONSTRAINT `oc_t_region_ibfk_1` FOREIGN KEY (`fk_c_country_code`) REFERENCES `oc_t_country` (`pk_c_code`);

--
-- Constraints for table `oc_t_region_stats`
--
ALTER TABLE `oc_t_region_stats`
  ADD CONSTRAINT `oc_t_region_stats_ibfk_1` FOREIGN KEY (`fk_i_region_id`) REFERENCES `oc_t_region` (`pk_i_id`);

--
-- Constraints for table `oc_t_user`
--
ALTER TABLE `oc_t_user`
  ADD CONSTRAINT `oc_t_user_ibfk_1` FOREIGN KEY (`fk_c_country_code`) REFERENCES `oc_t_country` (`pk_c_code`),
  ADD CONSTRAINT `oc_t_user_ibfk_2` FOREIGN KEY (`fk_i_region_id`) REFERENCES `oc_t_region` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_user_ibfk_3` FOREIGN KEY (`fk_i_city_id`) REFERENCES `oc_t_city` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_user_ibfk_4` FOREIGN KEY (`fk_i_city_area_id`) REFERENCES `oc_t_city_area` (`pk_i_id`);

--
-- Constraints for table `oc_t_user_description`
--
ALTER TABLE `oc_t_user_description`
  ADD CONSTRAINT `oc_t_user_description_ibfk_1` FOREIGN KEY (`fk_i_user_id`) REFERENCES `oc_t_user` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_user_description_ibfk_2` FOREIGN KEY (`fk_c_locale_code`) REFERENCES `oc_t_locale` (`pk_c_code`);

--
-- Constraints for table `oc_t_user_email_tmp`
--
ALTER TABLE `oc_t_user_email_tmp`
  ADD CONSTRAINT `oc_t_user_email_tmp_ibfk_1` FOREIGN KEY (`fk_i_user_id`) REFERENCES `oc_t_user` (`pk_i_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
