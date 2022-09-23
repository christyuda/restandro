-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.33 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for xaveba
CREATE DATABASE IF NOT EXISTS `xaveba` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `xaveba`;

-- Dumping structure for table xaveba.absensi
CREATE TABLE IF NOT EXISTS `absensi` (
  `id_absen` int(11) NOT NULL,
  `kode_absen` int(11) NOT NULL,
  `waktu_absen` date DEFAULT NULL,
  PRIMARY KEY (`id_absen`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table xaveba.absensi: ~0 rows (approximately)
/*!40000 ALTER TABLE `absensi` DISABLE KEYS */;
/*!40000 ALTER TABLE `absensi` ENABLE KEYS */;

-- Dumping structure for table xaveba.keys
CREATE TABLE IF NOT EXISTS `keys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `key` varchar(40) CHARACTER SET utf8 NOT NULL,
  `level` int(2) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT '0',
  `is_private_key` tinyint(1) NOT NULL DEFAULT '0',
  `ip_addresses` text CHARACTER SET utf8,
  `date_created` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Dumping data for table xaveba.keys: ~1 rows (approximately)
/*!40000 ALTER TABLE `keys` DISABLE KEYS */;
REPLACE INTO `keys` (`id`, `user_id`, `key`, `level`, `ignore_limits`, `is_private_key`, `ip_addresses`, `date_created`) VALUES
	(1, 1, 'xaveba', 1, 0, 0, NULL, 1);
/*!40000 ALTER TABLE `keys` ENABLE KEYS */;

-- Dumping structure for table xaveba.t_guru
CREATE TABLE IF NOT EXISTS `t_guru` (
  `id_guru` int(11) NOT NULL,
  `nama_guru` varchar(50) NOT NULL DEFAULT '',
  `jk` enum('Laki-Laki','Perempuan') NOT NULL,
  `agama` enum('Islam','Katolik','Kristen Protestan','Buddha','Hindu') NOT NULL,
  `no_hp` int(11) NOT NULL,
  `password` int(11) NOT NULL,
  PRIMARY KEY (`id_guru`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table xaveba.t_guru: ~0 rows (approximately)
/*!40000 ALTER TABLE `t_guru` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_guru` ENABLE KEYS */;

-- Dumping structure for table xaveba.t_siswa
CREATE TABLE IF NOT EXISTS `t_siswa` (
  `id_siswa` int(11) NOT NULL,
  `nama_siswa` varchar(50) NOT NULL,
  `tgl` date NOT NULL,
  `jk` enum('Laki-Laki','Perempuan') NOT NULL,
  `agama` enum('Islam','Katolik','Kristen Protestan','Buddha','Hindu') NOT NULL,
  `kelas` enum('X IPA','X IPS','XI IPA','XI IPS','XII IPA','XII IPS') NOT NULL,
  `kode_absen` varchar(50) NOT NULL,
  `no_hp` int(20) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_siswa`),
  KEY `absen_id` (`kode_absen`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table xaveba.t_siswa: ~2 rows (approximately)
/*!40000 ALTER TABLE `t_siswa` DISABLE KEYS */;
REPLACE INTO `t_siswa` (`id_siswa`, `nama_siswa`, `tgl`, `jk`, `agama`, `kelas`, `kode_absen`, `no_hp`, `password`) VALUES
	(1, 'a', '2022-09-22', 'Laki-Laki', 'Katolik', 'X IPA', '123', 623569, '123'),
	(12, 'b', '2022-09-22', 'Perempuan', 'Katolik', 'X IPA', 'av2sv', 6285695, '12345');
/*!40000 ALTER TABLE `t_siswa` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
