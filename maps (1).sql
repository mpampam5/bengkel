-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 15, 2018 at 11:45 PM
-- Server version: 5.5.32
-- PHP Version: 5.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `maps`
--
CREATE DATABASE IF NOT EXISTS `maps` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `maps`;

-- --------------------------------------------------------

--
-- Table structure for table `tb_jenis_perbaikan`
--

CREATE TABLE IF NOT EXISTS `tb_jenis_perbaikan` (
  `id_jenis_perbaikan` int(11) NOT NULL AUTO_INCREMENT,
  `jenis_perbaikan` varchar(150) NOT NULL,
  PRIMARY KEY (`id_jenis_perbaikan`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `tb_jenis_perbaikan`
--

INSERT INTO `tb_jenis_perbaikan` (`id_jenis_perbaikan`, `jenis_perbaikan`) VALUES
(1, 'Oli Mesin'),
(2, 'Saringan Udara'),
(3, 'Oli Transmisi'),
(4, 'Oli gardan'),
(5, 'Kerenggangan Baut'),
(6, 'Rem'),
(7, 'Tie Rods'),
(8, 'Gear Box Steering'),
(9, 'Drive Belt'),
(10, 'Radiator'),
(11, 'Busi'),
(12, 'Oli filter'),
(13, 'Shockbreaker'),
(14, 'Kampas kopling'),
(15, 'Clutch clover'),
(16, 'Kopling'),
(17, 'Saringan Bensin'),
(18, 'Tali Kipas');

-- --------------------------------------------------------

--
-- Table structure for table `tb_kendaraan`
--

CREATE TABLE IF NOT EXISTS `tb_kendaraan` (
  `id_kendaraan` int(11) NOT NULL AUTO_INCREMENT,
  `no_kendaraan` varchar(20) DEFAULT NULL,
  `merek_kendaraan` varchar(150) DEFAULT NULL,
  `transmisi_kendaraan` enum('manual','automatic') DEFAULT NULL,
  `cc_kendaraan` int(11) DEFAULT NULL,
  `warna_kendaraan` varchar(50) DEFAULT NULL,
  `tahun_pembuatan` int(11) DEFAULT NULL,
  `waktu_pembelian` date DEFAULT NULL,
  `kilometer` int(11) DEFAULT NULL,
  `kilometer_skrg` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_kendaraan`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tb_kendaraan`
--

INSERT INTO `tb_kendaraan` (`id_kendaraan`, `no_kendaraan`, `merek_kendaraan`, `transmisi_kendaraan`, `cc_kendaraan`, `warna_kendaraan`, `tahun_pembuatan`, `waktu_pembelian`, `kilometer`, `kilometer_skrg`) VALUES
(1, 'DD123HI', 'daihatsu', 'automatic', 100000, 'hitam', 2009, '2018-01-14', 13000, 15000),
(2, 'DD1234HH', 'Kijjang Innova', 'manual', 100000, 'merah', 2011, '2018-07-24', 900, 1000),
(3, 'DD1401H3', 'Honda brio', 'automatic', 9000, 'merah', 2016, '2017-06-21', 2100, 2100);

-- --------------------------------------------------------

--
-- Table structure for table `tb_login`
--

CREATE TABLE IF NOT EXISTS `tb_login` (
  `id_login` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `telepon` varchar(15) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(32) NOT NULL,
  PRIMARY KEY (`id_login`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `tb_login`
--

INSERT INTO `tb_login` (`id_login`, `nama`, `telepon`, `username`, `password`) VALUES
(3, 'Abdul Gaffar Jaelani', '', 'superadmin@mail.com', '96e79218965eb72c92a549dd5a330112'),
(4, 'Muhammad irfan ibnu', '1234567', 'mpampam', '96e79218965eb72c92a549dd5a330112');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pemilik`
--

CREATE TABLE IF NOT EXISTS `tb_pemilik` (
  `id_pemilik` int(11) NOT NULL AUTO_INCREMENT,
  `nama_pemilik` varchar(150) DEFAULT NULL,
  `telepon_pemilik` varchar(20) DEFAULT NULL,
  `email_pemilik` varchar(100) DEFAULT NULL,
  `alamat_pemilik` text,
  `jk_pemilik` enum('pria','wanita') DEFAULT NULL,
  `foto_pemilik` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_pemilik`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `tb_pemilik`
--

INSERT INTO `tb_pemilik` (`id_pemilik`, `nama_pemilik`, `telepon_pemilik`, `email_pemilik`, `alamat_pemilik`, `jk_pemilik`, `foto_pemilik`) VALUES
(3, 'Alex pablox', '085288882994', 'mpampam5@gmail.com', 'dsadsaasd', 'wanita', 'customer_15112018074033.jpg'),
(4, 'Muhammad Irfan Ibnu', '085288882994', 'mpampam5@gmail.com', 'Jl. Mannuruki 1 Pondok 16', 'pria', ''),
(5, 'Taufik', '098765273', 'taufik@mail.com', 'Jalan mannuruki raya no 13', 'pria', '');

-- --------------------------------------------------------

--
-- Table structure for table `tb_profile`
--

CREATE TABLE IF NOT EXISTS `tb_profile` (
  `id_profile` int(11) NOT NULL AUTO_INCREMENT,
  `nama_bengkel` varchar(150) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telepon` varchar(20) DEFAULT NULL,
  `alamat` text,
  `kordinat` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_profile`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tb_profile`
--

INSERT INTO `tb_profile` (`id_profile`, `nama_bengkel`, `email`, `telepon`, `alamat`, `kordinat`) VALUES
(1, 'TITI MOTOR', 'titi@mail.com', '0853242343', 'Jl. mannuruki 1', '-5.1551676,119.42787980000003');

-- --------------------------------------------------------

--
-- Table structure for table `tb_service`
--

CREATE TABLE IF NOT EXISTS `tb_service` (
  `id_service` int(11) NOT NULL AUTO_INCREMENT,
  `nama_service` varchar(150) DEFAULT NULL,
  `jarak_tempuh` int(11) DEFAULT NULL,
  `s_jarak_tempuh` int(11) DEFAULT NULL,
  `waktu` int(11) DEFAULT NULL,
  `s_waktu` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_service`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `tb_service`
--

INSERT INTO `tb_service` (`id_service`, `nama_service`, `jarak_tempuh`, `s_jarak_tempuh`, `waktu`, `s_waktu`) VALUES
(8, 'Service 1', 1000, 10000, 1, 6),
(11, 'Service 2', 10000, 20000, 6, 12),
(12, 'Service 3', 20000, 40000, 12, 18),
(13, 'Service 4', 40000, 50000, 18, 24),
(14, 'Service 5', 50000, 60000, 24, 30),
(15, 'Service 6', 60000, 70000, 30, 36),
(16, 'Service 7', 70000, 80000, 36, 42),
(17, 'Service 8', 80000, 90000, 42, 48),
(18, 'Service 9', 90000, 100000, 48, 54),
(19, 'Service 10', 100000, 110000, 54, 60),
(20, 'Service 11', 110000, 120000, 60, 66),
(21, 'Service 12', 120000, 130000, 66, 72),
(22, 'Service 13', 130000, 140000, 72, 78);

-- --------------------------------------------------------

--
-- Table structure for table `trans_cs_perbaikan`
--

CREATE TABLE IF NOT EXISTS `trans_cs_perbaikan` (
  `id_cs_perbaikan` int(11) NOT NULL AUTO_INCREMENT,
  `id_trans_cs_service` int(11) NOT NULL,
  `id_trans_service` int(11) NOT NULL,
  PRIMARY KEY (`id_cs_perbaikan`),
  KEY `id_perbaikan` (`id_trans_service`),
  KEY `id_trans_cs_service` (`id_trans_cs_service`),
  KEY `id_trans_cs_service_2` (`id_trans_cs_service`),
  KEY `id_trans_service` (`id_trans_service`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=50 ;

--
-- Dumping data for table `trans_cs_perbaikan`
--

INSERT INTO `trans_cs_perbaikan` (`id_cs_perbaikan`, `id_trans_cs_service`, `id_trans_service`) VALUES
(32, 22, 297),
(33, 22, 300),
(34, 22, 303),
(39, 23, 281),
(40, 23, 284),
(41, 24, 298),
(42, 24, 301),
(43, 24, 304),
(44, 25, 281),
(45, 25, 284),
(46, 25, 287),
(47, 26, 95),
(48, 26, 98),
(49, 26, 101);

-- --------------------------------------------------------

--
-- Table structure for table `trans_cs_service`
--

CREATE TABLE IF NOT EXISTS `trans_cs_service` (
  `id_trans_cs_service` int(11) NOT NULL AUTO_INCREMENT,
  `id_trans_kendaraan` int(11) NOT NULL,
  `id_service` int(11) NOT NULL,
  `keterangan` text,
  `waktu_service` date NOT NULL,
  `waktu_tempuh` int(11) DEFAULT NULL,
  `jarak_tempuh` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_trans_cs_service`),
  KEY `id_trans_kendaraan` (`id_trans_kendaraan`),
  KEY `id_service` (`id_service`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `trans_cs_service`
--

INSERT INTO `trans_cs_service` (`id_trans_cs_service`, `id_trans_kendaraan`, `id_service`, `keterangan`, `waktu_service`, `waktu_tempuh`, `jarak_tempuh`) VALUES
(22, 2, 11, '', '2018-12-13', 1, 100),
(23, 3, 8, 'Perbaikan dan perawatan kendaraan ', '2018-10-10', 1, 0),
(24, 3, 11, 'Perbaikan dan perawatan kendaraan ', '2018-10-16', 1, 0),
(25, 2, 8, 'Perbaikan dan perawatan kendaraan ', '2018-01-01', 1, 100),
(26, 3, 12, 'Perbaikan dan perawatan kendaraan ', '2018-02-06', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `trans_kendaraan`
--

CREATE TABLE IF NOT EXISTS `trans_kendaraan` (
  `id_trans_kendaraan` int(11) NOT NULL AUTO_INCREMENT,
  `no_registrasi` varchar(50) NOT NULL,
  `tgl_registrasi` date DEFAULT NULL,
  `id_pemilik` int(11) DEFAULT NULL,
  `id_kendaraan` int(11) DEFAULT NULL,
  `aktif` enum('y','n') DEFAULT 'y',
  PRIMARY KEY (`id_trans_kendaraan`),
  KEY `id_kendaraan` (`id_kendaraan`),
  KEY `id_pemilik` (`id_pemilik`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `trans_kendaraan`
--

INSERT INTO `trans_kendaraan` (`id_trans_kendaraan`, `no_registrasi`, `tgl_registrasi`, `id_pemilik`, `id_kendaraan`, `aktif`) VALUES
(2, '161118110736', '2018-12-08', 4, 2, 'y'),
(3, '101218040419', '2018-12-10', 5, 3, 'y');

-- --------------------------------------------------------

--
-- Table structure for table `trans_service`
--

CREATE TABLE IF NOT EXISTS `trans_service` (
  `id_trans_service` int(11) NOT NULL AUTO_INCREMENT,
  `id_service` int(11) NOT NULL,
  `id_perbaikan` int(11) NOT NULL,
  PRIMARY KEY (`id_trans_service`) USING BTREE,
  KEY `id_service` (`id_service`),
  KEY `id_perbaikan` (`id_perbaikan`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=305 ;

--
-- Dumping data for table `trans_service`
--

INSERT INTO `trans_service` (`id_trans_service`, `id_service`, `id_perbaikan`) VALUES
(95, 12, 1),
(96, 12, 2),
(97, 12, 3),
(98, 12, 5),
(99, 12, 6),
(100, 12, 7),
(101, 12, 8),
(102, 12, 10),
(103, 12, 12),
(112, 13, 2),
(113, 13, 3),
(114, 13, 5),
(115, 13, 6),
(116, 13, 7),
(117, 13, 8),
(118, 13, 10),
(119, 14, 1),
(120, 14, 2),
(121, 14, 5),
(122, 14, 6),
(123, 14, 7),
(124, 14, 8),
(125, 14, 10),
(126, 14, 11),
(127, 14, 12),
(135, 15, 1),
(136, 15, 2),
(137, 15, 5),
(138, 15, 6),
(139, 15, 7),
(140, 15, 8),
(141, 15, 10),
(142, 16, 1),
(143, 16, 2),
(144, 16, 5),
(145, 16, 6),
(146, 16, 7),
(147, 16, 8),
(148, 16, 10),
(149, 16, 12),
(150, 17, 1),
(151, 17, 2),
(152, 17, 5),
(153, 17, 6),
(154, 17, 7),
(155, 17, 8),
(156, 17, 10),
(166, 18, 1),
(167, 18, 2),
(168, 18, 5),
(169, 18, 6),
(170, 18, 7),
(171, 18, 8),
(172, 18, 10),
(173, 18, 11),
(174, 18, 12),
(175, 18, 17),
(176, 19, 1),
(177, 19, 2),
(178, 19, 5),
(179, 19, 6),
(180, 19, 10),
(181, 20, 1),
(182, 20, 2),
(183, 20, 5),
(184, 20, 6),
(185, 20, 7),
(186, 20, 8),
(187, 20, 10),
(188, 20, 12),
(189, 20, 13),
(190, 20, 14),
(191, 20, 15),
(209, 21, 1),
(210, 21, 2),
(211, 21, 5),
(212, 21, 6),
(213, 21, 7),
(214, 21, 8),
(215, 21, 10),
(216, 21, 18),
(217, 22, 1),
(218, 22, 2),
(219, 22, 3),
(220, 22, 5),
(221, 22, 6),
(222, 22, 7),
(223, 22, 8),
(224, 22, 10),
(225, 22, 11),
(226, 22, 12),
(227, 22, 18),
(281, 8, 1),
(282, 8, 2),
(283, 8, 3),
(284, 8, 4),
(285, 8, 5),
(286, 8, 6),
(287, 8, 7),
(288, 8, 8),
(289, 8, 9),
(297, 11, 1),
(298, 11, 2),
(299, 11, 5),
(300, 11, 6),
(301, 11, 7),
(302, 11, 8),
(303, 11, 10),
(304, 11, 16);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `trans_cs_perbaikan`
--
ALTER TABLE `trans_cs_perbaikan`
  ADD CONSTRAINT `trans_cs_perbaikan_ibfk_1` FOREIGN KEY (`id_trans_cs_service`) REFERENCES `trans_cs_service` (`id_trans_cs_service`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `trans_cs_perbaikan_ibfk_2` FOREIGN KEY (`id_trans_service`) REFERENCES `trans_service` (`id_trans_service`);

--
-- Constraints for table `trans_cs_service`
--
ALTER TABLE `trans_cs_service`
  ADD CONSTRAINT `trans_cs_service_ibfk_1` FOREIGN KEY (`id_trans_kendaraan`) REFERENCES `trans_kendaraan` (`id_trans_kendaraan`) ON UPDATE CASCADE,
  ADD CONSTRAINT `trans_cs_service_ibfk_2` FOREIGN KEY (`id_service`) REFERENCES `tb_service` (`id_service`) ON UPDATE CASCADE;

--
-- Constraints for table `trans_kendaraan`
--
ALTER TABLE `trans_kendaraan`
  ADD CONSTRAINT `trans_kendaraan_ibfk_1` FOREIGN KEY (`id_pemilik`) REFERENCES `tb_pemilik` (`id_pemilik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `trans_kendaraan_ibfk_2` FOREIGN KEY (`id_kendaraan`) REFERENCES `tb_kendaraan` (`id_kendaraan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `trans_service`
--
ALTER TABLE `trans_service`
  ADD CONSTRAINT `trans_service_ibfk_1` FOREIGN KEY (`id_service`) REFERENCES `tb_service` (`id_service`) ON DELETE CASCADE,
  ADD CONSTRAINT `trans_service_ibfk_2` FOREIGN KEY (`id_perbaikan`) REFERENCES `tb_jenis_perbaikan` (`id_jenis_perbaikan`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
