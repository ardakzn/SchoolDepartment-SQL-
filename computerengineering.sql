-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1:3306
-- Üretim Zamanı: 11 Eki 2019, 13:31:16
-- Sunucu sürümü: 5.7.26
-- PHP Sürümü: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `computerengineering`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `announces`
--

DROP TABLE IF EXISTS `announces`;
CREATE TABLE IF NOT EXISTS `announces` (
  `a_ID` int(20) NOT NULL AUTO_INCREMENT,
  `t_ID` int(20) DEFAULT NULL,
  `std_ID` int(20) DEFAULT NULL,
  `a_Date` date NOT NULL,
  `a_Link` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`a_ID`),
  KEY `t_ID` (`t_ID`),
  KEY `std_ID` (`std_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Tablo döküm verisi `announces`
--

INSERT INTO `announces` (`a_ID`, `t_ID`, `std_ID`, `a_Date`, `a_Link`) VALUES
(19, 440675915, NULL, '2019-09-24', 'https://www.hku.edu.tr/ilanlar/ek-yerlestirme-muafiyet-ve-duzey-belirleme-sinavi/'),
(20, NULL, 181501016, '2019-09-13', 'https://www.hku.edu.tr/ilanlar/hazirlik-muafiyet-ve-duzey-belirleme-sinavi-bilgilendirme/'),
(21, 771951754, NULL, '2019-09-24', 'https://www.hku.edu.tr/ilanlar/ek-yerlestirme-muafiyet-ve-duzey-belirleme-sinavi/'),
(22, 824039678, NULL, '2019-09-24', 'https://www.hku.edu.tr/ilanlar/ek-yerlestirme-muafiyet-ve-duzey-belirleme-sinavi/'),
(23, 198374450, 181501016, '2019-09-20', 'https://www.hku.edu.tr/ilanlar/2019-osym-ek-yerlestirme-kayitlari-icin-kayit-kilavuzu/'),
(24, NULL, 171501549, '2019-09-13', 'https://www.hku.edu.tr/ilanlar/hazirlik-muafiyet-ve-duzey-belirleme-sinavi-bilgilendirme/');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `classes`
--

DROP TABLE IF EXISTS `classes`;
CREATE TABLE IF NOT EXISTS `classes` (
  `cl_ID` int(20) NOT NULL AUTO_INCREMENT,
  `cl_Code` varchar(50) COLLATE utf8_bin NOT NULL,
  `cl_Place` set('Amphitheater','Classroom','Laboratories') COLLATE utf8_bin DEFAULT NULL,
  `cl_Capacity` int(10) DEFAULT NULL,
  PRIMARY KEY (`cl_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Tablo döküm verisi `classes`
--

INSERT INTO `classes` (`cl_ID`, `cl_Code`, `cl_Place`, `cl_Capacity`) VALUES
(1, 'MF003', 'Classroom', 40),
(2, 'MF119', 'Laboratories', 40),
(3, 'YA1', 'Amphitheater', 70);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `courses`
--

DROP TABLE IF EXISTS `courses`;
CREATE TABLE IF NOT EXISTS `courses` (
  `c_ID` int(20) NOT NULL AUTO_INCREMENT,
  `t_ID` int(20) NOT NULL,
  `std_ID` int(20) NOT NULL,
  `cl_ID` int(20) NOT NULL,
  `c_Name` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `c_Hours` varchar(20) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`c_ID`),
  KEY `std_ID` (`std_ID`),
  KEY `t_ID` (`t_ID`),
  KEY `cl_ID` (`cl_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Tablo döküm verisi `courses`
--

INSERT INTO `courses` (`c_ID`, `t_ID`, `std_ID`, `cl_ID`, `c_Name`, `c_Hours`) VALUES
(1, 810488570, 181501016, 1, 'Computer Engineering 111', '3h'),
(2, 828663205, 181501016, 2, 'Computer Engineering Lab', '2h'),
(3, 808196055, 181501016, 3, 'General Physics 2', '5h'),
(4, 810488570, 181501779, 1, 'Computer Engineering 111', '3h'),
(5, 828663205, 181501779, 2, 'Computer Engineering Lab', '2h');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `exams`
--

DROP TABLE IF EXISTS `exams`;
CREATE TABLE IF NOT EXISTS `exams` (
  `e_ID` int(20) NOT NULL AUTO_INCREMENT,
  `t_ID` int(20) DEFAULT NULL,
  `std_id` int(20) DEFAULT NULL,
  `cl_ID` int(20) NOT NULL,
  `e_Code` varchar(50) COLLATE utf8_bin NOT NULL,
  `e_Name` varchar(250) COLLATE utf8_bin NOT NULL,
  `e_Date` date NOT NULL,
  `e_Start_Time` varchar(20) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`e_ID`),
  KEY `std_id` (`std_id`),
  KEY `t_ID` (`t_ID`),
  KEY `exams_ibfk_3` (`cl_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Tablo döküm verisi `exams`
--

INSERT INTO `exams` (`e_ID`, `t_ID`, `std_id`, `cl_ID`, `e_Code`, `e_Name`, `e_Date`, `e_Start_Time`) VALUES
(1, 828663205, 181501016, 2, 'CENG111', 'Computer Engineering Lab', '2019-10-31', '10:40'),
(2, 810488570, 181501016, 1, 'CENG111', 'Computer Engineering 111', '2019-11-21', '10:40'),
(3, 808196055, 181501779, 3, 'PHYS102', 'General Physics 2', '2020-01-07', '13:40');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `exam_results`
--

DROP TABLE IF EXISTS `exam_results`;
CREATE TABLE IF NOT EXISTS `exam_results` (
  `er_ID` int(20) NOT NULL AUTO_INCREMENT,
  `std_ID` int(20) NOT NULL,
  `e_ID` int(20) NOT NULL,
  `er_Name` varchar(250) COLLATE utf8_bin NOT NULL,
  `er_Points` varchar(20) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`er_ID`),
  KEY `std_ID` (`std_ID`),
  KEY `e_ID` (`e_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Tablo döküm verisi `exam_results`
--

INSERT INTO `exam_results` (`er_ID`, `std_ID`, `e_ID`, `er_Name`, `er_Points`) VALUES
(5, 181501016, 1, 'Computer Engineering Lab', 'BC'),
(6, 181501016, 2, 'Computer Engineering 111', 'CA'),
(7, 181501779, 3, 'General Physics 2', 'AB');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `students`
--

DROP TABLE IF EXISTS `students`;
CREATE TABLE IF NOT EXISTS `students` (
  `std_ID` int(20) NOT NULL,
  `std_Name` varchar(250) COLLATE utf8_bin NOT NULL,
  `std_Surname` varchar(250) COLLATE utf8_bin NOT NULL,
  `std_Date_of_Birth` date NOT NULL,
  `std_Phone_Number` varchar(20) COLLATE utf8_bin NOT NULL,
  `std_Email` varchar(250) COLLATE utf8_bin NOT NULL,
  `std_Country` varchar(100) COLLATE utf8_bin NOT NULL,
  `std_Year` set('1st Year','2nd Year','3rd Year','4th Year') COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`std_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Tablo döküm verisi `students`
--

INSERT INTO `students` (`std_ID`, `std_Name`, `std_Surname`, `std_Date_of_Birth`, `std_Phone_Number`, `std_Email`, `std_Country`, `std_Year`) VALUES
(171501549, 'Mehmet', 'Çınaroğlu', '1998-09-18', '+90 532 683 1295', 'mehmet.cinaroglu@std.hku.edu.tr', 'Gaziantep', '2nd Year'),
(181501016, 'Arda', 'Kozan', '1999-11-07', '+90 (530) 125 8395', 'tarda.kozan@std.hku.edu.tr', 'Gaziantep', '1st Year'),
(181501779, 'Ahmet Yasin', 'Korkmaz', '1999-11-23', '+90 530 680 3546', 'ahmetyasin.korkmaz@std.hku.edu.tr', 'Kırklareli', '1st Year');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `teachers`
--

DROP TABLE IF EXISTS `teachers`;
CREATE TABLE IF NOT EXISTS `teachers` (
  `t_ID` int(20) NOT NULL,
  `t_Name` varchar(250) COLLATE utf8_bin NOT NULL,
  `t_Surname` varchar(250) COLLATE utf8_bin NOT NULL,
  `t_Date_of_Birth` date NOT NULL,
  `t_Country` varchar(100) COLLATE utf8_bin NOT NULL,
  `t_Position` varchar(250) COLLATE utf8_bin NOT NULL,
  `t_Email` varchar(250) COLLATE utf8_bin NOT NULL,
  `t_Phone_Number` varchar(250) COLLATE utf8_bin NOT NULL,
  `t_CV_Link` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`t_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Tablo döküm verisi `teachers`
--

INSERT INTO `teachers` (`t_ID`, `t_Name`, `t_Surname`, `t_Date_of_Birth`, `t_Country`, `t_Position`, `t_Email`, `t_Phone_Number`, `t_CV_Link`) VALUES
(104997828, 'Saed', 'Alqaraleh', '1983-05-18', 'Ma\'an', 'Assistant Professor', 'saed.alqaraleh@hku.edu.tr', '0(342) 211 80 80', 'https://profil.hku.edu.tr/wp-content/uploads/Saed-alqaraleh.pdf'),
(198374450, 'Ulaş', 'Güleç', '1986-02-27', 'Ankara', 'Assistant Professor', 'ulas.gulec@hku.edu.tr', '0(342) 211 80 80', 'https://profil.hku.edu.tr/wp-content/uploads/ulas-gulec.pdf'),
(440675915, 'Bülent', 'Haznedar', '1978-10-21', 'Kayseri', 'Assistant Professor', 'bulent.haznedar@hku.edu.tr', '0(342) 211 80 80', 'https://profil.hku.edu.tr/wp-content/uploads/bulent-haznedar.pdf'),
(479295873, 'Veysi', 'İşler', '1964-09-08', 'Ankara', 'Full Professor Doctor', 'veysi.isler@hku.edu.tr', '0(342) 211 80 80', 'https://profil.hku.edu.tr/akademik/veysi-isler/'),
(771951754, 'Cihan', 'Kuzudişli', '1983-04-19', 'Gaziantep', 'Research/Teaching Assistant', 'cihan.kuzudisli@hku.edu.tr', '0(342) 211 8080', 'https://profil.hku.edu.tr/wp-content/uploads/Cihan-Kuzudi%C5%9Fli.pdf'),
(808196055, 'Mustafa', 'Bıçakçı', '1985-12-01', 'Konya', 'Lecturer', 'mustafa.bicakci@hku.edu.tr', ' 0(342) 211 80 80', 'https://profil.hku.edu.tr/wp-content/uploads/Mustafa-BI%C3%87AKCI.pdf'),
(810488570, 'Muhammed Fatih', 'Hasoğlu', '1976-06-18', 'Gaziantep', 'Associate Professor', 'mfatih.hasoglu@hku.edu.tr', '0(342) 211 80 80', 'https://profil.hku.edu.tr/akademik/fatih-hasoglu/'),
(824039678, 'Melih', 'Yayla', '1987-03-08', 'Antalya', 'Research/Teaching Assistant', 'melih.yayla@hku.edu.tr', '0(342) 211 8080', 'https://profil.hku.edu.tr/akademik/melih-yayla/'),
(828663205, 'Nihat Yılmaz', 'Şimşek', '1991-07-25', 'Malatya', 'Research/Teaching Assistant', 'nyilmaz.simsek@hku.edu.tr', '0(342) 211 80 80', 'https://profil.hku.edu.tr/wp-content/uploads/Nihat-Y%C4%B1lmaz-%C5%9Eim%C5%9Fek.pdf');

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `announces`
--
ALTER TABLE `announces`
  ADD CONSTRAINT `announces_ibfk_1` FOREIGN KEY (`t_ID`) REFERENCES `teachers` (`t_ID`),
  ADD CONSTRAINT `announces_ibfk_2` FOREIGN KEY (`std_ID`) REFERENCES `students` (`std_ID`);

--
-- Tablo kısıtlamaları `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`std_ID`) REFERENCES `students` (`std_ID`),
  ADD CONSTRAINT `courses_ibfk_2` FOREIGN KEY (`t_ID`) REFERENCES `teachers` (`t_ID`),
  ADD CONSTRAINT `courses_ibfk_3` FOREIGN KEY (`cl_ID`) REFERENCES `classes` (`cl_ID`);

--
-- Tablo kısıtlamaları `exams`
--
ALTER TABLE `exams`
  ADD CONSTRAINT `exams_ibfk_1` FOREIGN KEY (`std_id`) REFERENCES `students` (`std_ID`),
  ADD CONSTRAINT `exams_ibfk_2` FOREIGN KEY (`t_ID`) REFERENCES `teachers` (`t_ID`),
  ADD CONSTRAINT `exams_ibfk_3` FOREIGN KEY (`cl_ID`) REFERENCES `classes` (`cl_ID`);

--
-- Tablo kısıtlamaları `exam_results`
--
ALTER TABLE `exam_results`
  ADD CONSTRAINT `exam_results_ibfk_1` FOREIGN KEY (`std_ID`) REFERENCES `students` (`std_ID`),
  ADD CONSTRAINT `exam_results_ibfk_2` FOREIGN KEY (`e_ID`) REFERENCES `exams` (`e_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
