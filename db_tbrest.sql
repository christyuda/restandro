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


-- Dumping database structure for db_tbrest
CREATE DATABASE IF NOT EXISTS `db_tbrest` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `db_tbrest`;

-- Dumping structure for table db_tbrest.keys
CREATE TABLE IF NOT EXISTS `keys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `key` varchar(40) CHARACTER SET utf8 NOT NULL,
  `level` int(2) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT '0',
  `is_private_key` tinyint(1) NOT NULL DEFAULT '0',
  `ip_addresses` text CHARACTER SET utf8,
  `date_created` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table db_tbrest.keys: ~0 rows (approximately)
/*!40000 ALTER TABLE `keys` DISABLE KEYS */;
REPLACE INTO `keys` (`id`, `user_id`, `key`, `level`, `ignore_limits`, `is_private_key`, `ip_addresses`, `date_created`) VALUES
	(1, 1, 'pemrog', 1, 0, 0, NULL, 1);
/*!40000 ALTER TABLE `keys` ENABLE KEYS */;

-- Dumping structure for table db_tbrest.limits
CREATE TABLE IF NOT EXISTS `limits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) CHARACTER SET utf8 NOT NULL,
  `count` int(10) NOT NULL,
  `hour_started` int(11) NOT NULL,
  `api_key` varchar(40) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table db_tbrest.limits: ~0 rows (approximately)
/*!40000 ALTER TABLE `limits` DISABLE KEYS */;
/*!40000 ALTER TABLE `limits` ENABLE KEYS */;

-- Dumping structure for table db_tbrest.t_ekskul
CREATE TABLE IF NOT EXISTS `t_ekskul` (
  `id_ekskul` int(11) NOT NULL AUTO_INCREMENT,
  `nama_ekskul` varchar(50) NOT NULL,
  `id_pendamping` int(11) NOT NULL DEFAULT '0',
  `lokasi` varchar(50) NOT NULL,
  `hari` enum('senin','selasa','rabu','kamis','jumat','sabtu','minggu') NOT NULL,
  `jam_mulai` time NOT NULL,
  `jam_selesai` time NOT NULL,
  PRIMARY KEY (`id_ekskul`),
  KEY `id_pendamping` (`id_pendamping`),
  CONSTRAINT `FK_ekskul_pendamping` FOREIGN KEY (`id_pendamping`) REFERENCES `t_pendamping` (`id_pendamping`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=123334 DEFAULT CHARSET=latin1;

-- Dumping data for table db_tbrest.t_ekskul: ~2 rows (approximately)
/*!40000 ALTER TABLE `t_ekskul` DISABLE KEYS */;
REPLACE INTO `t_ekskul` (`id_ekskul`, `nama_ekskul`, `id_pendamping`, `lokasi`, `hari`, `jam_mulai`, `jam_selesai`) VALUES
	(123333, 'futsal', 1, 'lapangan a', 'selasa', '22:20:07', '22:20:08');
/*!40000 ALTER TABLE `t_ekskul` ENABLE KEYS */;

-- Dumping structure for table db_tbrest.t_nilai
CREATE TABLE IF NOT EXISTS `t_nilai` (
  `id_nilai` int(11) NOT NULL,
  `id_siswa` int(11) DEFAULT NULL,
  `nama_siswa` varchar(50) DEFAULT NULL,
  `jumlah_nilai` int(11) DEFAULT NULL,
  `keterangan` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_nilai`),
  KEY `id_siswa` (`id_siswa`),
  CONSTRAINT `FK_nilai_siswa` FOREIGN KEY (`id_siswa`) REFERENCES `t_siswa` (`id_siswa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table db_tbrest.t_nilai: ~2 rows (approximately)
/*!40000 ALTER TABLE `t_nilai` DISABLE KEYS */;
REPLACE INTO `t_nilai` (`id_nilai`, `id_siswa`, `nama_siswa`, `jumlah_nilai`, `keterangan`) VALUES
	(0, NULL, NULL, NULL, NULL),
	(1, 1, 'yuda', 1, 'A');
/*!40000 ALTER TABLE `t_nilai` ENABLE KEYS */;

-- Dumping structure for table db_tbrest.t_pendamping
CREATE TABLE IF NOT EXISTS `t_pendamping` (
  `id_pendamping` int(11) NOT NULL,
  `nip` int(11) DEFAULT NULL,
  `nama_pendamping` varchar(50) NOT NULL,
  `tempat_lahir` varchar(50) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `agama` varchar(50) DEFAULT NULL,
  `alamat` text NOT NULL,
  `no_hp` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_pendamping`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table db_tbrest.t_pendamping: ~1 rows (approximately)
/*!40000 ALTER TABLE `t_pendamping` DISABLE KEYS */;
REPLACE INTO `t_pendamping` (`id_pendamping`, `nip`, `nama_pendamping`, `tempat_lahir`, `tanggal_lahir`, `agama`, `alamat`, `no_hp`, `email`) VALUES
	(1, 1213, 'boras', 'baturaja', '2022-07-16', 'katolik', 'jln saja', '89456487859', 'boras@gmail.com');
/*!40000 ALTER TABLE `t_pendamping` ENABLE KEYS */;

-- Dumping structure for table db_tbrest.t_registrasi
CREATE TABLE IF NOT EXISTS `t_registrasi` (
  `id_registrasi` int(11) NOT NULL AUTO_INCREMENT,
  `id_ekskul` int(11) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `tanggal_daftar` date NOT NULL,
  PRIMARY KEY (`id_registrasi`),
  KEY `fk_siswa` (`id_siswa`) USING BTREE,
  KEY `fk_ekskul` (`id_ekskul`) USING BTREE,
  CONSTRAINT `FK_registrasi_Eskul` FOREIGN KEY (`id_ekskul`) REFERENCES `t_ekskul` (`id_ekskul`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_registrasi_Siswa` FOREIGN KEY (`id_siswa`) REFERENCES `t_siswa` (`id_siswa`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table db_tbrest.t_registrasi: ~2 rows (approximately)
/*!40000 ALTER TABLE `t_registrasi` DISABLE KEYS */;
REPLACE INTO `t_registrasi` (`id_registrasi`, `id_ekskul`, `id_siswa`, `tanggal_daftar`) VALUES
	(1, 123333, 1, '2022-07-16');
/*!40000 ALTER TABLE `t_registrasi` ENABLE KEYS */;

-- Dumping structure for table db_tbrest.t_siswa
CREATE TABLE IF NOT EXISTS `t_siswa` (
  `id_siswa` int(11) NOT NULL AUTO_INCREMENT,
  `nis` varchar(20) NOT NULL,
  `nama_siswa` varchar(50) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `tempat_lahir` varchar(50) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `agama` varchar(50) DEFAULT NULL,
  `alamat` text NOT NULL,
  `kelas` enum('10','11','12','') NOT NULL,
  `jurusan` enum('IPA','IPS') NOT NULL,
  `rombel` varchar(1) NOT NULL,
  `no_hp` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `apikey` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_siswa`)
) ENGINE=InnoDB AUTO_INCREMENT=1204027 DEFAULT CHARSET=latin1;

-- Dumping data for table db_tbrest.t_siswa: ~2 rows (approximately)
/*!40000 ALTER TABLE `t_siswa` DISABLE KEYS */;
REPLACE INTO `t_siswa` (`id_siswa`, `nis`, `nama_siswa`, `username`, `password`, `tempat_lahir`, `tanggal_lahir`, `agama`, `alamat`, `kelas`, `jurusan`, `rombel`, `no_hp`, `email`, `apikey`) VALUES
	(1, '1293', 'yuda', 'yuda', '123', 'baturaja', '2022-07-16', 'Katolik', 'jalan danau', '10', 'IPA', 'A', '85609357335', 'yuda@gmail.com', NULL),
	(1204026, '12021312', 'deta ', NULL, NULL, 'baturaja', '2022-08-06', 'katolik', 'jogja', '10', 'IPA', 'A', '82172215698', 'deta@gmail.com', NULL);
/*!40000 ALTER TABLE `t_siswa` ENABLE KEYS */;

-- Dumping structure for table db_tbrest.t_turnamen
CREATE TABLE IF NOT EXISTS `t_turnamen` (
  `id_turnamen` int(11) NOT NULL,
  `nama_turnamen` varchar(50) DEFAULT NULL,
  `tingkat_turnamen` varchar(50) DEFAULT NULL,
  `lokasi` varchar(50) NOT NULL DEFAULT '',
  `hari` enum('senin','selasa','rabu','kamis','jumat','sabtu','minggu') NOT NULL,
  `id_ekskul` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_turnamen`),
  KEY `id_eskul` (`id_ekskul`),
  CONSTRAINT `FK_turnamen_ekskul` FOREIGN KEY (`id_ekskul`) REFERENCES `t_ekskul` (`id_ekskul`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table db_tbrest.t_turnamen: ~2 rows (approximately)
/*!40000 ALTER TABLE `t_turnamen` DISABLE KEYS */;
REPLACE INTO `t_turnamen` (`id_turnamen`, `nama_turnamen`, `tingkat_turnamen`, `lokasi`, `hari`, `id_ekskul`) VALUES
	(1, 'gandos turnamen', 'provinsi', 'taman ahmad yani', 'senin', 123333),
	(12, 'rowlers turnamen', 'provinsi', 'taman ahmad yani', 'senin', 123333);
/*!40000 ALTER TABLE `t_turnamen` ENABLE KEYS */;

-- Dumping structure for table db_tbrest.t_user
CREATE TABLE IF NOT EXISTS `t_user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `apikey` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table db_tbrest.t_user: ~0 rows (approximately)
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
REPLACE INTO `t_user` (`id_user`, `username`, `password`, `apikey`) VALUES
	(1, 'admin', 'admin', 'pemrog');
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
