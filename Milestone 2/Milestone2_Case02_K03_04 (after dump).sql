-- MariaDB dump 10.19  Distrib 10.10.3-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: lpdp
-- ------------------------------------------------------
-- Server version	10.10.3-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `lpdp`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `lpdp` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;

USE `lpdp`;

--
-- Table structure for table `beasiswa`
--

DROP TABLE IF EXISTS `beasiswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `beasiswa` (
  `idMahasiswa` int(11) DEFAULT NULL,
  `universitas` varchar(50) DEFAULT NULL,
  `prodi` varchar(50) DEFAULT NULL,
  `jumlahDana` int(11) DEFAULT NULL,
  KEY `idMahasiswa` (`idMahasiswa`),
  CONSTRAINT `beasiswa_ibfk_1` FOREIGN KEY (`idMahasiswa`) REFERENCES `pendaftar` (`idMahasiswa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beasiswa`
--

LOCK TABLES `beasiswa` WRITE;
/*!40000 ALTER TABLE `beasiswa` DISABLE KEYS */;
INSERT INTO `beasiswa` (`idMahasiswa`, `universitas`, `prodi`, `jumlahDana`) VALUES (25,'Academy of Arts','Graphic Design',1090),
(20,'Rocky Mountain College of Art and Design','Fashion Design',1238),
(19,'University of the West of England, Bristol','Computer Science',1316),
(3,'China University of Geosciences Wuhan','Geology',1312),
(5,'World University of Bangladesh','Communication',1025),
(69,'Université Ibn Zohr Agadir','Pharmacy',1488),
(44,'Universidade Federal da Grande Dourados','Mechanical Engineering',1223),
(36,'Free University Institute \"Carlo Cattaneo\"','International Law',1125),
(26,'Alahgaff University','Architecture',1408),
(88,'Institute of Management Sciences, Lahore (IMS)','Management',1016);
/*!40000 ALTER TABLE `beasiswa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diawasi`
--

DROP TABLE IF EXISTS `diawasi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diawasi` (
  `idPsikotest` int(11) DEFAULT NULL,
  `idPanitia` int(11) DEFAULT NULL,
  KEY `idPsikotest` (`idPsikotest`),
  KEY `idPanitia` (`idPanitia`),
  CONSTRAINT `diawasi_ibfk_1` FOREIGN KEY (`idPsikotest`) REFERENCES `psikotest` (`idPsikotest`),
  CONSTRAINT `diawasi_ibfk_2` FOREIGN KEY (`idPanitia`) REFERENCES `panitia` (`idPanitia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diawasi`
--

LOCK TABLES `diawasi` WRITE;
/*!40000 ALTER TABLE `diawasi` DISABLE KEYS */;
INSERT INTO `diawasi` (`idPsikotest`, `idPanitia`) VALUES (61,16),
(61,19),
(62,16),
(62,19);
/*!40000 ALTER TABLE `diawasi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diperiksa`
--

DROP TABLE IF EXISTS `diperiksa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diperiksa` (
  `idTesKesehatan` int(11) DEFAULT NULL,
  `idPanitia` int(11) DEFAULT NULL,
  KEY `idTesKesehatan` (`idTesKesehatan`),
  KEY `idPanitia` (`idPanitia`),
  CONSTRAINT `diperiksa_ibfk_1` FOREIGN KEY (`idTesKesehatan`) REFERENCES `teskesehatan` (`idTesKesehatan`),
  CONSTRAINT `diperiksa_ibfk_2` FOREIGN KEY (`idPanitia`) REFERENCES `panitia` (`idPanitia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diperiksa`
--

LOCK TABLES `diperiksa` WRITE;
/*!40000 ALTER TABLE `diperiksa` DISABLE KEYS */;
INSERT INTO `diperiksa` (`idTesKesehatan`, `idPanitia`) VALUES (63,20),
(64,20),
(65,20),
(66,21),
(67,21),
(68,20),
(69,22),
(70,21),
(71,23),
(72,24),
(73,21),
(74,22),
(75,22),
(76,23),
(77,23),
(78,22),
(79,24),
(80,23),
(81,24),
(82,24);
/*!40000 ALTER TABLE `diperiksa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diwawancara`
--

DROP TABLE IF EXISTS `diwawancara`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diwawancara` (
  `idWawancara` int(11) DEFAULT NULL,
  `idPanitia` int(11) DEFAULT NULL,
  KEY `idWawancara` (`idWawancara`),
  KEY `idPanitia` (`idPanitia`),
  CONSTRAINT `diwawancara_ibfk_1` FOREIGN KEY (`idWawancara`) REFERENCES `wawancara` (`idWawancara`),
  CONSTRAINT `diwawancara_ibfk_2` FOREIGN KEY (`idPanitia`) REFERENCES `panitia` (`idPanitia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diwawancara`
--

LOCK TABLES `diwawancara` WRITE;
/*!40000 ALTER TABLE `diwawancara` DISABLE KEYS */;
INSERT INTO `diwawancara` (`idWawancara`, `idPanitia`) VALUES (1,3),
(2,3),
(3,1),
(4,1),
(5,2),
(6,2),
(7,8),
(8,8),
(9,11),
(10,11),
(11,12),
(12,12),
(13,4),
(14,4),
(15,9),
(16,9),
(17,14),
(18,14),
(19,5),
(20,5),
(21,6),
(22,6),
(23,7),
(24,7),
(25,10),
(26,10),
(27,13),
(28,13),
(29,15),
(30,15),
(31,5),
(32,5),
(33,2),
(34,2),
(35,3),
(36,3),
(37,1),
(38,1),
(39,8),
(40,8),
(41,15),
(42,15),
(43,13),
(44,13),
(45,10),
(46,10),
(47,7),
(48,7),
(49,6),
(50,6),
(51,4),
(52,4),
(53,14),
(54,14),
(55,9),
(56,9),
(57,5),
(58,5),
(59,12),
(60,12);
/*!40000 ALTER TABLE `diwawancara` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dokter`
--

DROP TABLE IF EXISTS `dokter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dokter` (
  `idPanitia` int(11) NOT NULL,
  `spesialis` varchar(50) NOT NULL,
  KEY `idPanitia` (`idPanitia`),
  CONSTRAINT `dokter_ibfk_1` FOREIGN KEY (`idPanitia`) REFERENCES `panitia` (`idPanitia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dokter`
--

LOCK TABLES `dokter` WRITE;
/*!40000 ALTER TABLE `dokter` DISABLE KEYS */;
INSERT INTO `dokter` (`idPanitia`, `spesialis`) VALUES (20,'Umum'),
(21,'Umum'),
(22,'Umum'),
(23,'Umum'),
(24,'Umum');
/*!40000 ALTER TABLE `dokter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dokumen`
--

DROP TABLE IF EXISTS `dokumen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dokumen` (
  `idMahasiswa` int(11) NOT NULL,
  `idDokumen` int(11) NOT NULL,
  `jenis` int(11) NOT NULL,
  `link` varchar(50) NOT NULL,
  PRIMARY KEY (`idDokumen`),
  KEY `idMahasiswa` (`idMahasiswa`),
  CONSTRAINT `dokumen_ibfk_1` FOREIGN KEY (`idMahasiswa`) REFERENCES `pendaftar` (`idMahasiswa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dokumen`
--

LOCK TABLES `dokumen` WRITE;
/*!40000 ALTER TABLE `dokumen` DISABLE KEYS */;
INSERT INTO `dokumen` (`idMahasiswa`, `idDokumen`, `jenis`, `link`) VALUES (1,1,3,'1AFfAwvarsZzTLVU5KwA7vQfHLFAo8zK8k'),
(3,2,3,'1GKJdE4TGHmiR8SJoaDBbkZ4SkyheJ9Pt8'),
(1,3,2,'1HEYo4K2oYiLamZDFqpvfHTnuYWnKY6mVf'),
(3,4,2,'1H2t7bqvZgQrjtcjGgwJ2UriUWMgxjYNi3'),
(1,5,1,'1AkTTjqHWL7V9fnVDEj3Xsoi4yNAe8yBpR'),
(4,6,3,'1N2MXuXQYiJGVvsawZG85CZBjoN1v3RqjY'),
(6,7,3,'13MhXSzwWq4xWAiAeNx3VdpduuQU3JZWoe'),
(12,8,3,'1FtQAvw3Krf4PqDheQRNKhDuwJAskg322e'),
(4,9,2,'1BkBNmMGGqsrBkWbA2mAq7hzDDLbaHgXEd'),
(3,10,1,'14Nv3bhtBrcNRC8sRUh7UVyfaMsfwWjVxU'),
(5,11,2,'1SX96T4qomWe47ko72a5CohukyFH94B8n'),
(5,12,3,'1CVrPckgL9RaTuJhNKfgVe7LF4NxhD9NZh'),
(4,13,1,'16je62rurbUhdSAqQRFZEqkKx9Z2nGhVW5'),
(13,14,3,'15geoHGpZ3xRwiG6XfaT5BQ5QcUsoXabxk'),
(14,15,3,'15k7PRcNj1BNQvDdhdQsHhcbYWarWGCBHf'),
(6,16,2,'1AegUJcJV59p9qgBbRzBX8PjLu7FxPuKBj'),
(5,17,1,'1Lk6sp89RZspMUGc9noB9zBVA8Fz6eHY2a'),
(12,18,2,'18McGk4hzPWf1H6ehmccMwtCM5mTp7c9FP'),
(15,19,3,'14ebyVEuJtC4ZvxfNL1ek7cnBTk2mBAA2j'),
(13,20,2,'1CT6pZ9zAPJ3HdRKVEQLjPckrVp1f1TLSq'),
(6,21,1,'1La1unEAeMHfSCq1zVxRBK56Qr7unwPWwo'),
(14,22,2,'1Ep7JipfVmNewRmY9cyY4KAwqhg9q1uJAZ'),
(16,23,3,'171EqMzZNt2f8LkruK3ZwkYQJWmJGBjCfN'),
(15,24,2,'1NZrNMjk9XwYrTnpKURFyj45jXq8n4CvqN'),
(12,25,1,'1dRsZsgA7gAL1fKJPeBy52Buw7EBdo8hw'),
(17,26,3,'17igkgnSk2KhP5BXViCiycVCYQzqHBsbnr'),
(18,27,3,'1MLiuN7RtM2KQYhit2iNAsSpYp2fmK6xUG'),
(16,28,2,'13KJ9is2vwyrwqpYYrsQqFoGPb9tjiwbt4'),
(13,29,1,'1Pj2ksGwCZkgvdEH6ABxR5TqG5nixxXjxb'),
(14,30,1,'14KdJ5jpEr8xYizMj5x2gSfamZEvhCRD1m'),
(17,31,2,'1Csv6XtjGF93CfcTwGcKMqrk6TEXDc5Wds'),
(19,32,3,'1KMhKFyewGvYRMgsscE9LVPYxXu2FasvPw'),
(20,33,3,'1enL1wScZepDykrK4tfaDC95eetpFqKTi'),
(15,34,1,'1C7GQmN8gf8eAyLtAvwe4ZL581ACYfHTPe'),
(16,35,1,'1QALob2AnaaE2wxeZ7St8W2JRreY6xTph8'),
(17,36,1,'1AjceoNCYvxdnf8t56EovAxafGYdX5ecLd'),
(21,37,3,'1M2wyp9baRRaS64Drcu356ksJ8EZFTHNSp'),
(18,38,1,'1AzN7Xtzgdm8aSBHsHTUe8BX55oyW4HWKL'),
(18,39,2,'1DJ5CKLeZCMhUcygZpLwQ3Nj17MGT4nwVc'),
(19,40,1,'1PpprSWHD2u1HKkqKc22hKNWyR5CSamB29'),
(22,41,3,'1QLPcext3VHa5k1AKKKtECow43nFDgcMpU'),
(20,42,1,'122MTTBjveX7ugtw1mPAwHjzRWhspgDmdk'),
(19,43,2,'1fEu1nQGpJ3mNLL5D2y2TaSG1Sap1qeuC'),
(23,44,3,'1DQGtXnUcrQ8euGzK2QcqhoxsichG5nNTY'),
(21,45,1,'12KaPPJWoLo7yTMaUeBv6qHqaozZ2Khpoo'),
(20,46,2,'1EeYYpyvA8Kuqfn3oiYyAKauEhs42DxMtu'),
(21,47,2,'1G29buXBQEGiQCZwyHCcEbSWn3m7AFV1H5'),
(22,48,2,'1AdL2gfq3bhiZ5dc46gSCPga5aNL3EMHKQ'),
(23,49,2,'19N2bAAUSum29mXtd1HjD1qk5aNLUrUd2g'),
(24,50,3,'15f63fsWKenrD36iuzQiWUAhuZLPfBibXZ'),
(22,51,1,'1AM4i6g4pkzrDVGBuX8TTFdAKnYqAsYtd2'),
(25,52,3,'1MXqWNViFFrwBduPT7rHFqeXBATDTqbm9R'),
(24,53,2,'1LSqM2bceEN5bYcviD991WBa8ekY4KxMnp'),
(27,54,1,'13GKxd7bgDtMZS2Rn25wVYpSdjFTDb4A1B'),
(26,55,3,'19PnQr8PBY1R59VgxFcuhptZ8fMAKSyPMh'),
(27,56,3,'1NrhZ324MGwqKQSdcyf6XhQEUJErPXowHZ'),
(24,57,1,'16izABDdEcZJxkFb2QprTRsxTWePjP9RxT'),
(28,58,3,'16JC6U9mU29N7t7DT2Xj2SMG1oSH6BvQPU'),
(25,59,2,'1FSygEoF71XdkFDdMrkCXk1q5xhWzTUDh8'),
(26,60,2,'12spi5NpZWuvPy25mHHr8Wk6a7xyzhfvGJ'),
(29,61,3,'1CyMWE8Rcoh17jLa4DoZdtaQkxF9xRcioz'),
(25,62,1,'16ZzxV4veaVpmcJ1iNqcYL8EkYLjtZ3M8a'),
(30,63,3,'1NXuJ7c4oPD4udeCDLtTo9JKsvegJA6iZe'),
(31,64,3,'1MWBo8BqRc89YZHfSJSitXeu6sguT7zNwk'),
(26,65,1,'1DW2c584vd8Gjesn6yQZfDzjKKFhaPJcR1'),
(28,66,1,'1MjGZQbt2nEetP6D1cExXh6QhvqtLuB3BY'),
(29,67,1,'1APRK8ZJ6DVgdZnpUaASZPBsvCqe6xRKdE'),
(30,68,1,'18N81cKjc3KcG8cJgjxjB3z9jR4pogaYa7'),
(32,69,3,'16WAJ6u8QRkKe56meRvn8A8q78hfCxxDs2'),
(33,70,3,'18bj2Wri9et2tYQz7L9JNmy4DHEDB975uN'),
(34,71,3,'19MhhzYkn27FjMRMJdByPMzQeN6xiPBG3v'),
(70,72,3,'149NcsA1wZEkFSNp9hYT5nBfPqKgeHxy3o'),
(31,73,1,'1CkiWRTa6hyqDt5LVzo78GxidrCQGFQFzA'),
(32,74,1,'1B7D2z1NZCwFBQu85jb3PxT6g5HchbRPe5'),
(33,75,1,'1MYdMwEB6jtWZhueXSmJXa8aLtgzApvtox'),
(34,76,1,'15S91wQKsBGgHiABvaXFTiFUfio4j9t9h9'),
(36,77,3,'1AMLxnuinfwYXEer3oQTjPmfKKf6QSeNau'),
(35,78,1,'1Npsf1v32XkRmVJe6zag2hqJMfHzD6jnW2'),
(37,79,3,'1N195TA1Vy96WZ7waAdAf9GymWWMbVovsY'),
(73,80,3,'16aK6WKKimWEDeKYBuKLoCT5wxMa9YgAwH'),
(36,81,1,'1Q1o6SPni32qrJkHQJb3RBiEmBngohj3jf'),
(37,82,1,'1FWVB3XerDoh214b2snqK82JQgnmcWnCyq'),
(38,83,1,'177XjRfMjoerrnm8u2n4CwkgdhGm23zH4S'),
(39,84,1,'16F2JubuD9yDSBtETJsd9HaZpaTPWFup2A'),
(40,85,1,'1CBeVCoXzi4nagob7dF7yatiMjYL9kwZsg'),
(39,86,3,'1N43Mo61L6vGqTVqSdnqGH1KXhC7NTwzda'),
(61,87,1,'196bvVxfPZ65SUzXoii2ucf61vCDQASHAR'),
(62,88,1,'1N85KagA3QNvoBvSSQAjHLhhsjfvGNrfZp'),
(63,89,1,'1FCesGWMQkeL362oHPdc3mE8HDbdtjTXrt'),
(64,90,1,'1B7r6Y4dSUMjygAjfSTsmQEeMGQQPXWSHF'),
(65,91,1,'16CApNMLaWFGxBqNKgKqivPPPtm2riCpVq'),
(66,92,1,'17PEBgVUzWqjD1pGiYSmoJGS7ddvxg2BER'),
(67,93,1,'1J5g6A3EDMmjqVvBkjk2RwTcSSAMpaPzL9'),
(83,94,3,'12DrKpY4kXWdpsRDLTvb8RPT6peEmq4SoF'),
(68,95,1,'1K2LhoyASX1awQhTDXQTk4FCn2d25NquDA'),
(69,96,1,'1JPdSmfwQHwgvEZ9Py884w6Uae7v4pSpsm'),
(70,97,1,'1DwRXGYQF9VzBC5d4mmkaZnL1eovFYiyVc'),
(61,98,3,'1D7PZfT4P6sHaN85AqJykT3yBevoeeR9nB'),
(81,99,1,'19m1m1LALZXzZYwyLU3JVnVA1ZcwB7MVxW'),
(82,100,1,'1EdMMZxX3RTPvRxT7bnaNyEXpuQnYhhpe7'),
(83,101,1,'1DabJFh29rTv9bC2UQB2st226Myvt1o92f'),
(84,102,1,'1JSUKH5ARLru827U5zU8noR1S7obiJ9sXZ'),
(85,103,1,'15eYPswH6RrVcLd72wqhvimNbyewEr9FVw'),
(51,104,1,'1Dnbn85f7WnYa4bYXpv2dWjcyyFt8umrDG'),
(51,105,3,'13B23EqaKqVzwheqhqmYJNwXozpMEVCUxU'),
(86,106,1,'1DEuoAW5kBcrKUBHKNjud3AiyWztHbToA8'),
(71,107,3,'17dwMAB7zPeMZip1oKNE3B9yhH4AZZcQrC'),
(72,108,3,'1M3tqmLS5HCVJEoH1atzitcZXXHiSckQ4S'),
(71,109,1,'1Kh5aHJrPShocPLuWpsdRH7soBmgzrLChQ'),
(73,110,1,'1HZtLDBd3uN2y93rBixQznxFk8eewXPzP5'),
(63,111,3,'1PAvXXgyQas32uQofRtf6LJniiD317jb57'),
(62,112,3,'1JTKvCcjGCr9Vtkpuf2bzykJ3SyJfC3rfF'),
(74,113,1,'14p8f7PTd2EVcULuReYriehWRy3MbkPMcN'),
(64,114,3,'1Cfvuo7RE9TpoQ8Vd8JymaHQDWxRpaL6iz'),
(65,115,3,'1N8JJRBQL2R7yNLaYTYTRWt61VGmmDBXMi'),
(87,116,1,'1EHJXuJqRyfDeVD6K8VniBBXff1PLYmYGV'),
(66,117,3,'1NjfNT4nuTGMtwEK3fQE91WEBHigRnsawg'),
(67,118,3,'1CXsuSn8yoV3MTXJRjskyWHGWnTuhR8RMM'),
(88,119,1,'1LnbtV81ZgjH3JzNa3mKm7tze3F5pSKiZ8'),
(68,120,3,'1BoyVzEuRMCnqZmZmzEeuE2oBrP4Bvh643'),
(69,121,3,'1C9VibEMLQBLHZakcznV3DPNZVxAoNzLey'),
(75,122,1,'14Mc7Hwj1VHoP94CZ5ge78eqHWddTU9XCv'),
(74,123,3,'127A8XJwY9zxB5pxphDF5JQGMfsVkRKVF9'),
(76,124,1,'1LiWdKJoqL4JFwic83GcUMZfKxVC34cLSZ'),
(77,125,1,'138KUEd11LsYTLFFSxhoXQWC6GeJRW7kzR'),
(76,126,3,'1E9XjqVP8vAf753rRP7pMyS9Y1yvv3mUbu'),
(77,127,3,'1GZRiYxXCKUPMiVHJg6MniEoPfCR9EhCwA'),
(78,128,3,'1GJ7vWxRia5iopCtwQtyejTFTYwiq6gN6n'),
(79,129,3,'1KkpcQ1TRuGHSbbTM4giAeTdHPvLkhULZT'),
(80,130,3,'1E7dq97TAvxSpJ4inNim9kdmaxYm1PH2v3'),
(78,131,1,'1NrigegZk6EHntFh2cVrvYFyu3q4o3r6ci'),
(91,132,3,'18VkzZpCyvWJj1mruRp1asXQqtN9jYzy4z'),
(92,133,3,'1HWiSFHW33L1BoMqdkSNjx5mPkW1Z6YtUG'),
(89,135,3,'1PcxfzhibkeW6oMmMkLpCsFEzqgUdXCxaX'),
(93,136,3,'1NzyeFtdNK6oKjBBkF6XRakjSg27fjsxCC'),
(27,137,2,'1NzFPNPFBJf8Lu4MiC7T1N74pGJiysB8Di'),
(28,138,2,'19viosyFkSxuH3DGZfuQyAsHrem5Tf5YA3'),
(29,139,2,'1EhwUJaExZDWHZT4xbRvpGufXvRTRJi2km'),
(30,140,2,'1M8LkRQgcGwkymzbyYbiAv9ZgLe2yb9N2L'),
(86,141,3,'1A9YiZS3bgu3JRgwJu9QF5fydyCQKtnnit'),
(89,142,1,'1HS6vw6KbaBCsgMHsctQ3gVA6FvXuYesuv'),
(41,143,3,'1NsZnFiTg26CGETRZaYSJmFM1FLmiNGwJ9'),
(90,144,3,'1CnCC38Zf6i9wqy6eyuTmfrKsFw3tC9EEQ'),
(31,145,2,'1BxH5fdLfdMq6Shv9m3L1otqoNvpt76XXp'),
(32,146,2,'16TrXM3wD7TuC7bKuhwun5qwnu8vr1TtMS'),
(90,147,1,'14oveWbGZhG9vphpsKQqcYzHqwoPJRK2Hj'),
(93,148,1,'1DfFKDccQ6gobyqaVvfjQBVuv7A1dYUqTC'),
(94,149,1,'18B9C2GkTPY5VrNay7uzxChyfmdY76ufhf'),
(94,150,3,'1EqqH25rKTWesYaoA1dtZVmUrKPBsWBwhg'),
(95,151,1,'143pQmBci2rxL9aXfNaSqhDjVpDUD6tuiM'),
(95,152,3,'1Nsc28xiSFKsW35noE99VRx6G3PSrpoZQT'),
(96,153,3,'12L3qKsri4jiC2S43yMwnAVqappmeEjaHd'),
(97,154,1,'1ALXoaFf91KdpqxpZ5FsSdoQt34RvNF9by'),
(33,155,2,'1Nd7NowoS8iDGz64gEHVCVdxbq7gg1YkjF'),
(97,156,3,'1P18EWg7RoKs3yydq321b5FDdVcC8kYFFz'),
(98,157,3,'17WeqAqe7mHkWVmfPzXFpopMjtvc1h4Pib'),
(99,158,1,'14ddb5vjae6Gj2p1qa2rKaJFoEhbz6ZfYD'),
(55,159,3,'1L7K9R5kqVCHfXqYrthfVd46Qqi9osQRyw'),
(34,160,2,'1G2BLG1eKGFBKqAo6wuoS5zPtvDDFjoHQQ'),
(60,161,3,'1JpKZsRjvJGcxz3BE3pVsFr58J9b5mxqZJ'),
(100,162,3,'1Mi9eF3dArLP49rzFtJWsjMVheLKzMKJuX'),
(100,163,1,'1P9mQW87L2H2LPVVjSQ4yaHjwKM4UWoQgv'),
(101,164,1,'1GJHgnNNVLYLXnTAkVxmvZAKcFYiqo9i33'),
(62,165,2,'1A2AhWE9SxLgmD9Tsf7hHrN3AjXmSrrQQi'),
(36,166,2,'168Nfut13TmoRMd7QwYdsCCeUdbUBe1PTP'),
(37,167,2,'19rNdTvQ4fGxcp9wqfdSva5CkqPR8m6Lgy'),
(68,168,2,'1EGnjo3KMwnifQYbn9Sg99mJcNDNiWiq9X'),
(56,169,1,'1DrWynfRbzCjF9bukEq9KBffcwHYX9qcTj'),
(39,170,2,'1Q5MM96CBc4wh2MzSDVmzh1dVtHt5RY1kt'),
(105,171,1,'1EULvWdHbhgsDqpbu35dCgjkXfwek4NzCN'),
(106,172,3,'1J5DT3S98uaMMeC98qT8YQgCFkHZyQGPvr'),
(69,173,2,'1BD78KuxhsqaeFtdmSTs5kxaTRHkUNt9Hn'),
(56,174,3,'18Un6dFRs65nP7p88qE7jYRQm3GZc3UQbM'),
(101,175,3,'17Ejzc85ymDnBtsviFwtxXNPqYS4KqpFrA'),
(53,176,1,'1HicxYDawYL8gtW8UHN4HmuMaCS6VPyHjf'),
(53,177,3,'1ARhDiLVLvchwpUuQqE6Mudh1b5xpGaMN'),
(54,178,3,'1MHH3hTeBLeEnYEU1gpK1Jx47ivx9RyX4q'),
(50,179,3,'1CwJCQynyXxW9sThTqscsP5GK3cf2YKcfJ'),
(91,180,1,'14YUGxodDDVuPMZYMNQQ7WT6jWNS7Xvdtu'),
(52,181,1,'19UM48HAp4EwLC26FJqBcD44tZ5ES9cKr8'),
(70,182,2,'1AUrgTMiWGwrVMWpvbsexAWbAZzJNgLUTW'),
(73,183,2,'1EyG23gneTk6oAfvbYKMzLcwdsj4d6b9Qr'),
(42,184,3,'1Gfs7S3RpDiX13FrqffcAR15kbNeLJy2vw'),
(49,185,1,'1LhSUQe5icwHy5FFaPFYzkwpvQRDbvvJFj'),
(42,186,2,'1oUPEnF9d2SvB1gAKJH35n7FYnLRs8X49'),
(42,187,1,'14ctbfNSAWY8njMF6GW8VvyotA6sVpvMzt'),
(43,188,3,'14bJGCD54FzN4qqEZdUUnxzJdFkjocGj5a'),
(43,189,1,'1Mvf7JpRiZGxQrnHN9pSP4ee9BfqF6W7Tq'),
(44,190,3,'1L7sDUuFwhGSuVYZ76NBkQwYUrFt2K78jH'),
(43,191,2,'1PVcYKZF4btfQPzz5x9qXkMRCyQxPzfGZW'),
(44,192,2,'1LaGggGMoYXgeKtaD1GrJ1BWHcPdJqsi8L'),
(45,193,2,'1KXG1EMBhVD4fbztWmYVJ1muG3Qse8wqza'),
(46,194,3,'1Q4zGDt8DP2pspKd63PEXSg6cbdekCfPEC'),
(44,195,1,'1AFECByk5huznhJHMtg5oEv1ojMfXjkMjK'),
(45,196,1,'1HjJQhsnCfJVswVL6Mnkn7dUk829D3QhK8'),
(45,197,3,'16jRc3kdf8kXRymdUTH2hhgtBs4A93Uj8P'),
(46,198,2,'1GAgQa5KHznZgrqHYvaZRKujVju9YW1bEE'),
(47,199,3,'1PTPsVeu1MxzTz6gMZA8RZEvBYtJTNC9Rs'),
(46,200,1,'14rTEVg838TuiACnFv4izXiuJS8W6EdWjq'),
(74,201,2,'19cSj9HKKpbc76dwzgMMgfuM9xvKyk3rRs'),
(47,202,2,'19rVhzUJd5gyPZMTKVAq3AsiX47HL3Q6To'),
(52,203,3,'1JP3h8VBTAs1NLEEh2EiWkXA97yF28gRMz'),
(48,204,3,'1PXFUDvbm5WAG61Eb7c3yY4uwHu9MYgjtF'),
(52,205,2,'1L44hsPCLoi1dfgTsekZnacohHwMBL4WWf'),
(71,206,2,'1NVaGuV6WgWm8fNB3VZmqnrr3SjTem6yP8'),
(47,207,1,'1FcXbnyvYnrGG7g1pKJiQPbAZrzJT3GPhN'),
(49,208,2,'1DicD13FyEEYCGaq7o96n5Z8qHK65YkiiW'),
(49,209,3,'19wWG1JDRxXYrqNVwhbmm3UFpwTVA3c4pg'),
(56,210,2,'16NgG9PgvP7KHi6DuLSYbzktnkoeuxRfDL'),
(88,211,2,'1MJdRAyD6R2JHRwY4rHK8Gwv4XEETLpNaT'),
(92,212,1,'19MMR5NBpTdm5fSFnrnFQWqyykUXYEESXa'),
(59,213,3,'1MZncgjTNVfw65XTdBrfFHN7iyLmYjnyth'),
(53,214,2,'1MLumgQKbVgPChqmbTBLDdUpsvmpLRatXE'),
(50,215,1,'1M4v1Wzse6YRgs2n54mDJfS3X5qGeUdoL8'),
(54,216,1,'13SyFY1bDLFj6Gqpnu4yfFT4cZY2tDznBa'),
(83,217,2,'1DA9nCrvjmpKWSFnQKPXi8pjAF1cMtppE5'),
(91,218,2,'122VoPX83ZMbTEGBUSccfLeAExpc11vE5B'),
(57,219,1,'154hwUm2vVXqZmaYKw6j5zra3TSoS1Kv2W'),
(88,220,3,'18svmDAKeZTYXwnB329Hem6fjpHZ3hta3j'),
(92,221,2,'1DqW2ES3fZNJRvzr5zAkjYs3FsQw7UCaWM'),
(55,222,2,'1HBRwVzwcx8NYENGVqooFeCQ6tFbTHm6K7'),
(55,223,1,'1G8psu2YxbjRA6HiZfYQFtkedxbBGqq88C'),
(60,224,2,'17tH3dddNffAU92th7VEfswHkpU41LMarK'),
(58,225,1,'1NmpXMPSTPikPjXujG9NgFMrt4DLu91u1a'),
(59,226,1,'1AjJDLt1mzNzzL6g9w7eKegVFTfibfj6FU'),
(60,227,1,'1698v2GjJ3fnKmPBbM7YRNttZnCHqyxxcm'),
(105,228,3,'16NfTAs1o9NbcH1AwUscgUeDDjHYGaokgY'),
(102,229,1,'1NJTH4o4igmd1jSdDQAJeHdZjz9S74DTbu'),
(106,230,1,'19jR7mGb2APEEcUBT9pGpPtxFbnfgSH1uM'),
(102,231,3,'13W4cEMjD2nwLB2UzmwqEq8nYv7KJAWXqS'),
(103,232,1,'18YNUjkWgBzH8AravSUcnLBdhpvDpTwwzQ'),
(103,233,3,'1Mia75rEXeBDyHCxb7jdxpeLjefDF9M6Mi'),
(104,234,1,'1NvwLXjXnp6LazicnELpM212iFTB72vByC'),
(104,235,3,'1ER91o3oDMijXFhHJqmd17UcseFzQRJCUB'),
(108,236,1,'1CBxbRBrtGCzQoWA8hS6dodDtr7uVYxqua'),
(106,237,2,'1JRgwFBUrE3aZJ4vnXbzpwHXu4rAjigVfJ'),
(107,238,3,'12gdqEFuGHBS2BFRLvVn7Myf2GudNjcVmS'),
(107,239,1,'1A6oF15SWtX9pszz2qyiTJDPEqqtAqemUJ'),
(108,240,3,'15dT2n32h2zRJg4pNYhWcstsTbbcqcnZb6'),
(23,241,1,'20N2bAAUSum29mXtd1HjD1qk5aNLUrUd2g'),
(101,242,2,'21N2bAAUSum29mXtd1HjD1qk5aNLUrUd2g'),
(104,243,2,'22N2bAAUSum29mXtd1HjD1qk5aNLUrUd2g'),
(105,244,2,'23N2bAAUSum29mXtd1HjD1qk5aNLUrUd2g'),
(65,245,2,'24N2bAAUSum29mXtd1HjD1qk5aNLUrUd2g'),
(66,246,2,'25N2bAAUSum29mXtd1HjD1qk5aNLUrUd2g');
/*!40000 ALTER TABLE `dokumen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kelolosan`
--

DROP TABLE IF EXISTS `kelolosan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kelolosan` (
  `idPass` int(11) NOT NULL,
  `passingGrade` int(11) DEFAULT NULL,
  PRIMARY KEY (`idPass`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kelolosan`
--

LOCK TABLES `kelolosan` WRITE;
/*!40000 ALTER TABLE `kelolosan` DISABLE KEYS */;
INSERT INTO `kelolosan` (`idPass`, `passingGrade`) VALUES (1,140),
(2,195),
(3,140);
/*!40000 ALTER TABLE `kelolosan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `panitia`
--

DROP TABLE IF EXISTS `panitia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `panitia` (
  `idPanitia` int(11) NOT NULL,
  `namaLengkap` varchar(50) NOT NULL,
  PRIMARY KEY (`idPanitia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `panitia`
--

LOCK TABLES `panitia` WRITE;
/*!40000 ALTER TABLE `panitia` DISABLE KEYS */;
INSERT INTO `panitia` (`idPanitia`, `namaLengkap`) VALUES (1,'Vanya Piche'),
(2,'Fianna Goathrop'),
(3,'Alexio Rowan'),
(4,'Aurea Abrehart'),
(5,'Grenville Alam'),
(6,'Judas Avramov'),
(7,'Glennie Berrill'),
(8,'Eduino Pietrasik'),
(9,'Liva Schurig'),
(10,'Nanine Mullord'),
(11,'Sal Lanham'),
(12,'Ysabel Camplen'),
(13,'Jereme Moulson'),
(14,'Shelly Pritchard'),
(15,'Ernest Freeborn'),
(16,'Casey Darrow'),
(17,'Carlita Proudler'),
(18,'Ainslee Britner'),
(19,'Melinde Whether'),
(20,'Mathian Reuven'),
(21,'Irving Gillis'),
(22,'Carey Buzzing'),
(23,'Rudyard Gayter'),
(24,'Harwilll Brundill');
/*!40000 ALTER TABLE `panitia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pendaftar`
--

DROP TABLE IF EXISTS `pendaftar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pendaftar` (
  `idMahasiswa` int(11) NOT NULL,
  `namaLengkap` varchar(50) DEFAULT NULL,
  `jenisKelamin` varchar(50) DEFAULT NULL,
  `tempatLahir` varchar(50) DEFAULT NULL,
  `tanggalLahir` date DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `noTelp` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `kelengkapan` varchar(50) DEFAULT NULL,
  `idWawancara` int(11) DEFAULT NULL,
  `nilaiWawancara` decimal(5,2) DEFAULT NULL,
  `idPsikotest` int(11) DEFAULT NULL,
  `nilaiPsikotest` decimal(5,2) DEFAULT NULL,
  `idTesKesehatan` int(11) DEFAULT NULL,
  `nilaiTesKesehatan` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`idMahasiswa`),
  KEY `idWawancara` (`idWawancara`),
  KEY `idPsikotest` (`idPsikotest`),
  KEY `idTesKesehatan` (`idTesKesehatan`),
  CONSTRAINT `pendaftar_ibfk_1` FOREIGN KEY (`idWawancara`) REFERENCES `wawancara` (`idWawancara`),
  CONSTRAINT `pendaftar_ibfk_2` FOREIGN KEY (`idPsikotest`) REFERENCES `psikotest` (`idPsikotest`),
  CONSTRAINT `pendaftar_ibfk_3` FOREIGN KEY (`idTesKesehatan`) REFERENCES `teskesehatan` (`idTesKesehatan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pendaftar`
--

LOCK TABLES `pendaftar` WRITE;
/*!40000 ALTER TABLE `pendaftar` DISABLE KEYS */;
INSERT INTO `pendaftar` (`idMahasiswa`, `namaLengkap`, `jenisKelamin`, `tempatLahir`, `tanggalLahir`, `alamat`, `noTelp`, `email`, `kelengkapan`, `idWawancara`, `nilaiWawancara`, `idPsikotest`, `nilaiPsikotest`, `idTesKesehatan`, `nilaiTesKesehatan`) VALUES (1,'Egor Witheridge','Male','Gudauta','2002-08-29','875 Bobwhite Drive','603-549-4131','ewitheridge0@flavors.me','1',1,143.10,62,154.16,NULL,NULL),
(2,'Stoddard Bernet','Female','Annonay','2002-03-17','17848 Truax Place','576-689-5360','sbernet1@macromedia.com','0',NULL,NULL,NULL,NULL,NULL,NULL),
(3,'Marjory Brisley','Female','Maracaibo','2002-10-25','79535 Rowland Point','469-834-6100','mbrisley2@nationalgeographic.com','1',2,253.11,62,308.29,73,251.93),
(4,'Trisha Gregon','Female','Changliang','2003-02-03','8573 Lillian Alley','321-158-4959','tgregon3@jigsy.com','1',3,294.14,61,363.95,64,74.86),
(5,'Tommy Meffen','Male','La Unión','2001-08-06','71123 Elgar Lane','607-739-1605','tmeffen4@exblog.jp','1',4,175.19,62,332.16,66,243.71),
(6,'Elnar Cicerone','Male','Chame','2001-06-08','3400 Scott Parkway','655-266-1368','ecicerone5@geocities.com','1',5,110.12,NULL,NULL,NULL,NULL),
(7,'Farrel De Cristoforo','Male','Bagakay','2001-08-11','3632 Oakridge Parkway','372-464-0125','fde6@addtoany.com','0',NULL,NULL,NULL,NULL,NULL,NULL),
(8,'Francine Loughton','Female','Kalývia','2001-12-01','08226 Grover Point','835-720-0244','floughton7@ebay.com','0',NULL,NULL,NULL,NULL,NULL,NULL),
(9,'Gracie Cortez','Female','Grygov','2002-01-07','38 Sycamore Hill','208-320-4078','gcortez8@posterous.com','0',NULL,NULL,NULL,NULL,NULL,NULL),
(10,'Felisha Fielder','Genderfluid','Ipiaú','2001-09-14','62 Manley Road','956-350-0247','ffielder9@woothemes.com','0',NULL,NULL,NULL,NULL,NULL,NULL),
(11,'Tomkin Katzmann','Male','Dupi','2001-10-08','48907 Duke Center','783-623-9431','tkatzmanna@mac.com','0',NULL,NULL,NULL,NULL,NULL,NULL),
(12,'Joey Thomke','Male','Maliang','2001-10-10','1003 Autumn Leaf Junction','785-611-2052','jthomkeb@blogspot.com','1',6,363.99,61,73.74,NULL,NULL),
(13,'Malissa Figg','Female','Tubel','2001-11-03','741 Birchwood Crossing','304-342-4098','mfiggc@redcross.org','1',7,109.88,NULL,NULL,NULL,NULL),
(14,'Cammie Barnicott','Female','Strum','2002-12-23','2 Ilene Way','909-295-3966','cbarnicottd@wunderground.com','1',8,76.30,NULL,NULL,NULL,NULL),
(15,'Maxine Franks','Female','Sainte-Anne-des-Plaines','2002-07-24','1 East Plaza','350-314-6880','mfrankse@cdc.gov','1',9,122.44,NULL,NULL,NULL,NULL),
(16,'Walsh Roxburch','Polygender','Liushui','2002-12-05','679 Sunfield Junction','477-182-0420','wroxburchf@guardian.co.uk','1',10,288.76,61,131.34,NULL,NULL),
(17,'Marci Le Estut','Female','Landskrona','2001-04-30','0 Stoughton Circle','827-151-5644','mleg@reddit.com','1',11,169.20,62,163.30,NULL,NULL),
(18,'Saundra Bimson','Genderfluid','Ban Dung','2001-07-01','02 Carpenter Plaza','280-395-8021','sbimsonh@hibu.com','1',12,290.39,61,98.95,NULL,NULL),
(19,'Coop Celli','Male','Iguig','2001-06-12','9798 Hanson Road','643-629-1775','ccellii@tuttocitta.it','1',13,173.89,62,216.34,79,276.54),
(20,'Agnesse Ousley','Female','Leuburi','2002-07-10','72648 Hansons Pass','339-443-7418','aousleyj@freewebs.com','1',14,354.89,61,308.99,71,299.82),
(21,'Rebekah Hutten','Female','Santa Lucía','2003-02-28','20 Doe Crossing Hill','488-635-1310','rhuttenk@wisc.edu','1',15,334.82,61,243.62,78,133.47),
(22,'Kira Fuentes','Female','Houston','2001-09-01','25 Northport Street','281-433-4672','kfuentesl@msn.com','1',16,95.66,NULL,NULL,NULL,NULL),
(23,'Tuesday Tinniswood','Female','Tampocon','2002-04-02','4953 Pankratz Center','162-866-4015','ttinniswoodm@psu.edu','1',17,187.61,62,139.80,NULL,NULL),
(24,'Druci Affuso','Female','Chiba','2001-09-05','1349 Kinsman Street','313-294-1944','daffuson@cnn.com','1',18,254.39,62,63.21,NULL,NULL),
(25,'Welby Fielder','Male','Melgar','2001-06-10','36689 Esch Street','521-920-9583','wfieldero@ihg.com','1',19,341.24,61,320.72,69,368.10),
(26,'Shaine Capp','Female','Hezhang','2001-06-21','59 Manufacturers Terrace','171-999-4865','scappp@cdc.gov','1',20,343.83,61,202.07,80,170.37),
(27,'Vilhelmina Giametti','Female','Suwalki','2003-04-04','9404 Atwood Drive','894-879-4215','vgiamettiq@google.es','1',21,259.64,62,296.30,74,35.07),
(28,'Tanya Haquard','Female','Abuko','2001-11-04','255 Sunbrook Plaza','732-577-8962','thaquardr@google.de','1',22,224.18,62,364.02,63,109.26),
(29,'Cass Portal','Female','Hörby','2001-12-07','390 Sunnyside Drive','335-504-9250','cportals@oracle.com','1',23,268.35,61,324.73,68,40.99),
(30,'Christopher Secretan','Male','Karangnongko','2002-08-13','615 Aberg Circle','962-230-6610','csecretant@forbes.com','1',24,50.03,NULL,NULL,NULL,NULL),
(31,'Marita Mocher','Female','Lobez','2001-04-23','420 Nobel Circle','705-751-6228','mmocheru@thetimes.co.uk','1',25,358.01,61,166.46,NULL,NULL),
(32,'Robers Troutbeck','Male','Baška Voda','2001-04-30','6168 Stang Place','616-887-9730','rtroutbeckv@yale.edu','1',26,144.38,62,193.45,NULL,NULL),
(33,'Philip Hulles','Male','Andapa','2001-04-25','357 Forest Run Way','764-160-1605','phullesw@bbb.org','1',27,171.37,62,98.20,NULL,NULL),
(34,'Mil Icom','Female','Patimuan','2001-04-26','85750 Grim Avenue','752-771-6728','micomx@woothemes.com','1',28,118.92,NULL,NULL,NULL,NULL),
(35,'Retha Vickery','Female','Winterthur','2001-04-09','5946 Barnett Drive','374-992-8571','rvickeryy@infoseek.co.jp','0',NULL,NULL,NULL,NULL,NULL,NULL),
(36,'Talyah Fante','Female','Ladner','2002-06-05','958 Nevada Crossing','342-800-9819','tfantez@phoca.cz','1',29,239.91,62,312.25,71,182.06),
(37,'Normie Selcraig','Male','Nanping','2002-08-08','537 Kropf Avenue','985-542-8287','nselcraig10@wisc.edu','1',30,117.16,NULL,NULL,NULL,NULL),
(38,'Allen Ovanesian','Male','Lazaro Cardenas','2003-03-20','6964 Manufacturers Park','685-192-9151','aovanesian11@i2i.jp','0',NULL,NULL,NULL,NULL,NULL,NULL),
(39,'Caryn Meader','Female','Olupona','2003-03-12','17939 Rowland Terrace','564-497-0430','cmeader12@vimeo.com','1',31,192.55,62,251.20,77,67.93),
(40,'Drusilla Bartolacci','Female','Lago dos Rodrigues','2003-03-26','2 Derek Pass','546-476-4593','dbartolacci13@usda.gov','0',NULL,NULL,NULL,NULL,NULL,NULL),
(41,'Lesli Harley','Female','Guinabsan','2003-02-15','8 Springs Crossing','640-758-3342','lharley14@prnewswire.com','0',NULL,NULL,NULL,NULL,NULL,NULL),
(42,'Daisy Roostan','Female','Tucuruí','2002-07-07','78673 Debra Way','768-988-9564','droostan15@plala.or.jp','1',32,293.55,61,90.33,NULL,NULL),
(43,'Kettie Kleinsmuntz','Female','Ábrego','2002-04-28','77 Artisan Alley','648-813-9701','kkleinsmuntz16@google.com.au','1',33,340.39,61,335.74,65,134.48),
(44,'Inigo Hambrook','Male','Mayakovski','2002-11-20','5 Quincy Crossing','559-585-1395','ihambrook17@icq.com','1',34,365.60,61,329.61,67,196.86),
(45,'Annadiana McAuliffe','Female','São Domingos de Rana','2001-06-04','64498 Sachs Point','816-832-5168','amcauliffe18@reuters.com','1',35,301.11,61,168.35,NULL,NULL),
(46,'Barrett Hanse','Male','Qingshan','2001-11-23','5 Bluestem Alley','392-732-6881','bhanse19@cyberchimps.com','1',36,106.41,NULL,NULL,NULL,NULL),
(47,'Jabez Cordy','Male','Otuke','2002-02-14','1 Loftsgordon Hill','212-720-2443','jcordy1a@biglobe.ne.jp','1',37,46.84,NULL,NULL,NULL,NULL),
(48,'Washington Mathe','Male','Cikaung','2002-01-19','61603 Pearson Hill','713-601-9234','wmathe1b@slideshare.net','0',NULL,NULL,NULL,NULL,NULL,NULL),
(49,'Emanuel Lourenco','Male','Wadi as Salqa','2002-07-03','9736 Sachtjen Hill','470-903-2500','elourenco1c@cnet.com','1',38,170.70,62,94.73,NULL,NULL),
(50,'Pepi Turfitt','Female','Beidaihehaibin','2001-11-18','9 Westport Park','861-267-7452','pturfitt1d@cdc.gov','0',NULL,NULL,NULL,NULL,NULL,NULL),
(51,'Gilly Chaffey','Female','Mrgavan','2002-06-02','75 Rockefeller Alley','702-510-6729','gchaffey1e@fda.gov','0',NULL,NULL,NULL,NULL,NULL,NULL),
(52,'Seana Goodacre','Female','Lidzbark','2002-07-10','6 Lyons Street','517-528-5155','sgoodacre1f@stanford.edu','1',39,121.09,NULL,NULL,NULL,NULL),
(53,'Carrol Christofides','Male','Golbey','2003-04-04','711 Bashford Plaza','638-224-2169','cchristofides1g@xrea.com','1',40,326.68,61,261.38,76,100.19),
(54,'Coleman Brazener','Male','Knyaze-Volkonskoye','2002-07-10','3126 Waubesa Way','913-891-4922','cbrazener1h@businessweek.com','0',NULL,NULL,NULL,NULL,NULL,NULL),
(55,'Garnet Crosen','Genderqueer','Shuangkou','2001-06-21','50 Arrowood Road','639-436-1099','gcrosen1i@vkontakte.ru','1',41,275.80,61,41.83,NULL,NULL),
(56,'Chelsy Rizzo','Female','Cikadu','2001-05-21','896 Grasskamp Way','318-435-3049','crizzo1j@harvard.edu','1',42,173.87,62,312.38,70,87.55),
(57,'Quinlan Raecroft','Male','Montgomery','2001-10-24','708 Northport Parkway','334-298-7715','qraecroft1k@plala.or.jp','0',NULL,NULL,NULL,NULL,NULL,NULL),
(58,'Charmain Wilcocks','Female','Anto','2002-04-05','7 Ridgeway Circle','205-127-8441','cwilcocks1l@feedburner.com','0',NULL,NULL,NULL,NULL,NULL,NULL),
(59,'Jelene Timpany','Female','Ifon','2001-06-19','53 Loomis Circle','902-292-1394','jtimpany1m@merriam-webster.com','0',NULL,NULL,NULL,NULL,NULL,NULL),
(60,'Morton Davern','Male','Kazimierz Dolny','2002-06-14','21851 Springs Circle','126-383-8942','mdavern1n@diigo.com','1',43,310.83,61,312.38,NULL,NULL),
(61,'Marlow Kightly','Male','Rosso','2002-10-19','38 Commercial Street','921-431-4348','mkightly1o@mediafire.com','0',NULL,NULL,NULL,NULL,NULL,NULL),
(62,'Ogdan Perrie','Male','Mateur','2001-10-26','50799 Center Junction','128-780-2631','operrie1p@yelp.com','1',44,122.95,NULL,NULL,NULL,NULL),
(63,'Ernestine Vlahos','Female','San Vicente','2002-04-22','1495 Hazelcrest Street','162-217-4656','evlahos1q@123-reg.co.uk','0',NULL,NULL,NULL,NULL,NULL,NULL),
(64,'Ilsa Peiro','Female','Requena','2003-01-17','88909 Annamark Pass','710-640-5499','ipeiro1r@bloglines.com','0',NULL,NULL,NULL,NULL,NULL,NULL),
(65,'Heloise Hambric','Female','Staryy Oskol','2002-05-01','095 Twin Pines Road','789-557-3512','hhambric1s@sun.com','1',45,203.08,62,187.88,NULL,NULL),
(66,'Enrico Digginson','Male','Marugame','2002-08-21','19 Artisan Trail','648-544-0468','edigginson1t@flavors.me','1',60,35.26,NULL,NULL,NULL,NULL),
(67,'Deana Mafham','Female','Padangtiji','2001-10-21','40 Merrick Parkway','171-911-2442','dmafham1u@icio.us','0',NULL,NULL,NULL,NULL,NULL,NULL),
(68,'Jaine Redwood','Female','Áno Kopanákion','2001-07-09','44 Coleman Point','686-226-0659','jredwood1v@admin.ch','1',46,95.23,NULL,NULL,NULL,NULL),
(69,'Hayes Bau','Male','Reno','2002-05-15','75367 Petterle Road','775-520-5838','hbau1w@guardian.co.uk','1',47,259.41,62,197.05,82,212.41),
(70,'Ned Alderwick','Male','Witbank','2002-08-31','90349 Troy Alley','142-726-1504','nalderwick1x@acquirethisname.com','1',48,358.68,61,199.53,81,90.91),
(71,'Glenden Gopsall','Male','Chahe','2001-11-03','51 Sullivan Plaza','619-831-9645','ggopsall1y@harvard.edu','1',49,71.41,NULL,NULL,NULL,NULL),
(72,'Ulrika Maciak','Female','Umm Kaddadah','2003-03-25','3276 Grim Point','432-832-6218','umaciak1z@house.gov','0',NULL,NULL,NULL,NULL,NULL,NULL),
(73,'Abbey Adenet','Male','Mora','2001-09-05','738 Lukken Road','538-927-8313','aadenet20@forbes.com','1',50,124.52,NULL,NULL,NULL,NULL),
(74,'Daile Keave','Female','Horka nad Moravou','2002-09-27','1 Bartelt Crossing','671-783-4722','dkeave21@themeforest.net','1',51,132.08,NULL,NULL,NULL,NULL),
(75,'Ximenez MacGaughy','Male','Dengyue','2002-09-12','85 Bay Circle','685-338-4483','xmacgaughy22@usgs.gov','0',NULL,NULL,NULL,NULL,NULL,NULL),
(76,'Nadya Abramowitch','Female','Puyang','2002-10-13','38 Coolidge Hill','881-452-6195','nabramowitch23@paypal.com','0',NULL,NULL,NULL,NULL,NULL,NULL),
(77,'Edgardo Elderton','Male','Tesetice','2001-12-20','23 Hayes Center','825-512-3746','eelderton24@engadget.com','0',NULL,NULL,NULL,NULL,NULL,NULL),
(78,'Crawford Klimczak','Non-binary','Parczew','2001-04-22','3 Summerview Circle','269-181-1946','cklimczak25@goodreads.com','0',NULL,NULL,NULL,NULL,NULL,NULL),
(79,'Geri Syplus','Male','Zhangjiaji','2001-11-12','8588 Loftsgordon Pass','785-181-7356','gsyplus26@cbslocal.com','0',NULL,NULL,NULL,NULL,NULL,NULL),
(80,'Corrine Abrahim','Female','Paris 19','2001-04-27','9349 Harbort Trail','885-111-9531','cabrahim27@prweb.com','0',NULL,NULL,NULL,NULL,NULL,NULL),
(81,'Jud McParland','Polygender','Xieshui','2003-01-07','052 Hanson Place','146-720-7596','jmcparland28@ebay.com','0',NULL,NULL,NULL,NULL,NULL,NULL),
(82,'Callean Giacopetti','Male','Samouco','2002-02-28','51692 Twin Pines Road','639-967-2724','cgiacopetti29@hhs.gov','0',NULL,NULL,NULL,NULL,NULL,NULL),
(83,'Valery Gong','Female','Severskaya','2002-12-10','525 Saint Paul Parkway','532-818-8148','vgong2a@dmoz.org','1',52,257.61,62,169.20,NULL,NULL),
(84,'Gwyn Bransden','Female','Tundagan','2001-09-27','6 Shopko Place','286-796-1023','gbransden2b@engadget.com','0',NULL,NULL,NULL,NULL,NULL,NULL),
(85,'Donnie Parlatt','Polygender','Huangcun','2001-10-02','13544 Eastlawn Road','353-490-1417','dparlatt2c@nbcnews.com','0',NULL,NULL,NULL,NULL,NULL,NULL),
(86,'Maure Spyby','Female','Nanjie','2002-04-11','4 Arapahoe Parkway','135-208-8091','mspyby2d@mayoclinic.com','0',NULL,NULL,NULL,NULL,NULL,NULL),
(87,'Axe Gymlett','Male','Xuguang','2002-11-19','1 Warrior Circle','581-185-1149','agymlett2e@yandex.ru','0',NULL,NULL,NULL,NULL,NULL,NULL),
(88,'Anjela Bosdet','Female','Kokubunji','2002-06-24','4282 Pierstorff Avenue','433-705-8438','abosdet2f@ovh.net','1',53,300.34,61,295.66,75,148.56),
(89,'Lazar Clampin','Male','Krapina','2002-06-04','5134 Lotheville Street','446-530-0255','lclampin2g@jimdo.com','0',NULL,NULL,NULL,NULL,NULL,NULL),
(90,'Paolo Chin','Male','Santa Rita do Passa Quatro','2002-07-29','43 Little Fleur Park','129-710-6561','pchin2h@illinois.edu','0',NULL,NULL,NULL,NULL,NULL,NULL),
(91,'Dayle Halpine','Female','Krapina','2003-01-24','26493 Gulseth Street','177-772-6730','dhalpine2i@indiatimes.com','1',54,133.06,NULL,NULL,NULL,NULL),
(92,'Tiler Carnilian','Male','Dolinsk','2002-12-21','66220 Mosinee Park','531-849-3851','tcarnilian2j@blogspot.com','1',55,121.31,NULL,NULL,NULL,NULL),
(93,'Saw Caslake','Male','Sarvabad','2003-03-09','1 Annamark Center','619-202-1498','scaslake2k@nymag.com','0',NULL,NULL,NULL,NULL,NULL,NULL),
(94,'Heida Sabie','Female','Kratovo','2002-01-12','469 Evergreen Lane','222-842-9685','hsabie2l@berkeley.edu','0',NULL,NULL,NULL,NULL,NULL,NULL),
(95,'Pietrek Faire','Male','New Glasgow','2001-10-11','2 Artisan Road','335-696-9713','pfaire2m@harvard.edu','0',NULL,NULL,NULL,NULL,NULL,NULL),
(96,'Caresse Vannoort','Female','Huaqiao','2002-06-14','428 Mccormick Trail','775-759-3188','cvannoort2n@usatoday.com','0',NULL,NULL,NULL,NULL,NULL,NULL),
(97,'Christabel Bigrigg','Female','Chendong','2002-01-01','75624 Marquette Drive','488-448-7114','cbigrigg2o@china.com.cn','0',NULL,NULL,NULL,NULL,NULL,NULL),
(98,'Camella Rosten','Female','Taytay','2001-06-16','77 Union Circle','365-835-7869','crosten2p@samsung.com','0',NULL,NULL,NULL,NULL,NULL,NULL),
(99,'Yardley Crab','Male','Minneapolis','2003-03-18','47507 Barby Lane','651-599-7490','ycrab2q@canalblog.com','0',NULL,NULL,NULL,NULL,NULL,NULL),
(100,'Sara MacCague','Female','Looc','2002-06-03','59 Southridge Hill','784-145-4000','smaccague2r@yolasite.com','0',NULL,NULL,NULL,NULL,NULL,NULL),
(101,'Cristina Bunney','Female','Klenje','2003-01-19','91623 Blaine Way','375-921-5383','cbunney2s@shutterfly.com','1',56,142.86,62,86.76,NULL,NULL),
(102,'Brenna Kyd','Female','Stalowa Wola','2003-01-31','07237 Butterfield Hill','838-358-7864','bkyd2t@sbwire.com','0',NULL,NULL,NULL,NULL,NULL,NULL),
(103,'Ferrel Vautrey','Male','Profítis Ilías','2002-02-16','688 Delaware Circle','266-578-8608','fvautrey2u@umn.edu','0',NULL,NULL,NULL,NULL,NULL,NULL),
(104,'Allianora Paule','Female','Miao’ertan','2002-07-11','636 East Place','285-220-8389','apaule2v@nymag.com','1',57,317.07,61,132.59,NULL,NULL),
(105,'Trudey McKilroe','Female','Kolbuszowa','2002-11-06','5791 Warner Junction','367-190-2144','tmckilroe2w@cloudflare.com','1',58,88.72,NULL,NULL,NULL,NULL),
(106,'Dewitt Sine','Male','San Fernando','2002-07-14','6 Ridgeview Parkway','309-834-0526','dsine2x@fda.gov','1',59,344.75,61,102.11,NULL,NULL),
(107,'Salomon Esmead','Male','Dikwa','2001-12-30','759 Hovde Parkway','229-152-9341','sesmead2y@pcworld.com','0',NULL,NULL,NULL,NULL,NULL,NULL),
(108,'Malynda Grissett','Female','Ostružnica','2001-04-20','59442 Mayfield Crossing','425-989-0446','mgrissett2z@theguardian.com','0',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `pendaftar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pengawas`
--

DROP TABLE IF EXISTS `pengawas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pengawas` (
  `idPanitia` int(11) NOT NULL,
  `Divisi` varchar(50) NOT NULL,
  KEY `idPanitia` (`idPanitia`),
  CONSTRAINT `pengawas_ibfk_1` FOREIGN KEY (`idPanitia`) REFERENCES `panitia` (`idPanitia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pengawas`
--

LOCK TABLES `pengawas` WRITE;
/*!40000 ALTER TABLE `pengawas` DISABLE KEYS */;
INSERT INTO `pengawas` (`idPanitia`, `Divisi`) VALUES (16,'Lapangan'),
(17,'Lapangan'),
(18,'Komdis'),
(19,'Komdis');
/*!40000 ALTER TABLE `pengawas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pewawancara`
--

DROP TABLE IF EXISTS `pewawancara`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pewawancara` (
  `idPanitia` int(11) NOT NULL,
  `jabatan` varchar(50) NOT NULL,
  KEY `idPanitia` (`idPanitia`),
  CONSTRAINT `pewawancara_ibfk_1` FOREIGN KEY (`idPanitia`) REFERENCES `panitia` (`idPanitia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pewawancara`
--

LOCK TABLES `pewawancara` WRITE;
/*!40000 ALTER TABLE `pewawancara` DISABLE KEYS */;
INSERT INTO `pewawancara` (`idPanitia`, `jabatan`) VALUES (1,'Ketua'),
(2,'Wakil Ketua'),
(3,'Staff HR'),
(4,'Staff HR'),
(5,'Staff HR'),
(6,'Staff HR'),
(7,'Staff HR'),
(8,'Manager'),
(9,'Manager'),
(10,'Manager'),
(11,'Supervisor'),
(12,'Supervisor'),
(13,'Supervisor'),
(14,'Supervisor'),
(15,'Supervisor');
/*!40000 ALTER TABLE `pewawancara` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `psikotest`
--

DROP TABLE IF EXISTS `psikotest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `psikotest` (
  `idPsikotest` int(11) DEFAULT NULL,
  `ruangPsikotest` varchar(20) DEFAULT NULL,
  `sesiPsikotest` varchar(20) DEFAULT NULL,
  KEY `idPsikotest` (`idPsikotest`),
  CONSTRAINT `psikotest_ibfk_1` FOREIGN KEY (`idPsikotest`) REFERENCES `seleksi` (`idSeleksi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `psikotest`
--

LOCK TABLES `psikotest` WRITE;
/*!40000 ALTER TABLE `psikotest` DISABLE KEYS */;
INSERT INTO `psikotest` (`idPsikotest`, `ruangPsikotest`, `sesiPsikotest`) VALUES (61,'Multipurpose','Pagi'),
(62,'Lecture-03','Sore');
/*!40000 ALTER TABLE `psikotest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seleksi`
--

DROP TABLE IF EXISTS `seleksi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seleksi` (
  `idSeleksi` int(11) NOT NULL,
  `idPass` int(11) DEFAULT NULL,
  `tanggalSeleksi` date DEFAULT NULL,
  PRIMARY KEY (`idSeleksi`),
  KEY `idPass` (`idPass`),
  CONSTRAINT `seleksi_ibfk_1` FOREIGN KEY (`idPass`) REFERENCES `kelolosan` (`idPass`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seleksi`
--

LOCK TABLES `seleksi` WRITE;
/*!40000 ALTER TABLE `seleksi` DISABLE KEYS */;
INSERT INTO `seleksi` (`idSeleksi`, `idPass`, `tanggalSeleksi`) VALUES (1,1,'2023-04-01'),
(2,1,'2023-04-01'),
(3,1,'2023-04-01'),
(4,1,'2023-04-01'),
(5,1,'2023-04-01'),
(6,1,'2023-04-01'),
(7,1,'2023-04-01'),
(8,1,'2023-04-01'),
(9,1,'2023-04-01'),
(10,1,'2023-04-01'),
(11,1,'2023-04-01'),
(12,1,'2023-04-01'),
(13,1,'2023-04-01'),
(14,1,'2023-04-01'),
(15,1,'2023-04-01'),
(16,1,'2023-04-01'),
(17,1,'2023-04-01'),
(18,1,'2023-04-01'),
(19,1,'2023-04-01'),
(20,1,'2023-04-01'),
(21,1,'2023-04-01'),
(22,1,'2023-04-01'),
(23,1,'2023-04-01'),
(24,1,'2023-04-01'),
(25,1,'2023-04-01'),
(26,1,'2023-04-01'),
(27,1,'2023-04-01'),
(28,1,'2023-04-01'),
(29,1,'2023-04-01'),
(30,1,'2023-04-01'),
(31,1,'2023-04-02'),
(32,1,'2023-04-02'),
(33,1,'2023-04-02'),
(34,1,'2023-04-02'),
(35,1,'2023-04-02'),
(36,1,'2023-04-02'),
(37,1,'2023-04-02'),
(38,1,'2023-04-02'),
(39,1,'2023-04-02'),
(40,1,'2023-04-02'),
(41,1,'2023-04-02'),
(42,1,'2023-04-02'),
(43,1,'2023-04-02'),
(44,1,'2023-04-02'),
(45,1,'2023-04-02'),
(46,1,'2023-04-02'),
(47,1,'2023-04-02'),
(48,1,'2023-04-02'),
(49,1,'2023-04-02'),
(50,1,'2023-04-02'),
(51,1,'2023-04-02'),
(52,1,'2023-04-02'),
(53,1,'2023-04-02'),
(54,1,'2023-04-02'),
(55,1,'2023-04-02'),
(56,1,'2023-04-02'),
(57,1,'2023-04-02'),
(58,1,'2023-04-02'),
(59,1,'2023-04-02'),
(60,1,'2023-04-02'),
(61,2,'2023-04-10'),
(62,2,'2023-04-10'),
(63,3,'2023-04-17'),
(64,3,'2023-04-15'),
(65,3,'2023-04-16'),
(66,3,'2023-04-17'),
(67,3,'2023-04-15'),
(68,3,'2023-04-18'),
(69,3,'2023-04-15'),
(70,3,'2023-04-16'),
(71,3,'2023-04-15'),
(72,3,'2023-04-15'),
(73,3,'2023-04-18'),
(74,3,'2023-04-16'),
(75,3,'2023-04-17'),
(76,3,'2023-04-16'),
(77,3,'2023-04-17'),
(78,3,'2023-04-18'),
(79,3,'2023-04-16'),
(80,3,'2023-04-18'),
(81,3,'2023-04-17'),
(82,3,'2023-04-18');
/*!40000 ALTER TABLE `seleksi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teskesehatan`
--

DROP TABLE IF EXISTS `teskesehatan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teskesehatan` (
  `idTesKesehatan` int(11) DEFAULT NULL,
  `rumahSakit` varchar(20) DEFAULT NULL,
  `kota` varchar(20) DEFAULT NULL,
  KEY `idTesKesehatan` (`idTesKesehatan`),
  CONSTRAINT `teskesehatan_ibfk_1` FOREIGN KEY (`idTesKesehatan`) REFERENCES `seleksi` (`idSeleksi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teskesehatan`
--

LOCK TABLES `teskesehatan` WRITE;
/*!40000 ALTER TABLE `teskesehatan` DISABLE KEYS */;
INSERT INTO `teskesehatan` (`idTesKesehatan`, `rumahSakit`, `kota`) VALUES (63,'AMC','Bandung'),
(64,'AMC','Bandung'),
(65,'Borromeus','Bandung'),
(66,'Borromeus','Bandung'),
(67,'AMC','Bandung'),
(68,'Hermina','Bandung'),
(69,'Borromeus','Bandung'),
(70,'Hermina','Bandung'),
(71,'AMC','Bandung'),
(72,'Borromeus','Bandung'),
(73,'Borromeus','Bandung'),
(74,'Hermina','Bandung'),
(75,'Hermina','Bandung'),
(76,'AMC','Bandung'),
(77,'AMC','Bandung'),
(78,'AMC','Bandung'),
(79,'Borromeus','Bandung'),
(80,'Hasan Sadikin','Bandung'),
(81,'Borromeus','Bandung'),
(82,'Hasan Sadikin','Bandung');
/*!40000 ALTER TABLE `teskesehatan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wawancara`
--

DROP TABLE IF EXISTS `wawancara`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wawancara` (
  `idWawancara` int(11) DEFAULT NULL,
  `jenisWawancara` varchar(20) DEFAULT NULL,
  `sesiWawancara` varchar(20) DEFAULT NULL,
  KEY `idWawancara` (`idWawancara`),
  CONSTRAINT `wawancara_ibfk_1` FOREIGN KEY (`idWawancara`) REFERENCES `seleksi` (`idSeleksi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wawancara`
--

LOCK TABLES `wawancara` WRITE;
/*!40000 ALTER TABLE `wawancara` DISABLE KEYS */;
INSERT INTO `wawancara` (`idWawancara`, `jenisWawancara`, `sesiWawancara`) VALUES (1,'Luring','Pagi'),
(2,'Luring','Sore'),
(3,'Daring','Pagi'),
(4,'Daring','Sore'),
(5,'Luring','Pagi'),
(6,'Luring','Sore'),
(7,'Luring','Pagi'),
(8,'Luring','Sore'),
(9,'Daring','Pagi'),
(10,'Daring','Sore'),
(11,'Luring','Pagi'),
(12,'Luring','Sore'),
(13,'Luring','Pagi'),
(14,'Luring','Sore'),
(15,'Luring','Pagi'),
(16,'Luring','Sore'),
(17,'Luring','Pagi'),
(18,'Daring','Sore'),
(19,'Luring','Pagi'),
(20,'Luring','Sore'),
(21,'Luring','Pagi'),
(22,'Luring','Sore'),
(23,'Luring','Pagi'),
(24,'Luring','Sore'),
(25,'Luring','Pagi'),
(26,'Luring','Sore'),
(27,'Luring','Pagi'),
(28,'Luring','Sore'),
(29,'Luring','Pagi'),
(30,'Luring','Sore'),
(31,'Daring','Pagi'),
(32,'Daring','Sore'),
(33,'Luring','Pagi'),
(34,'Luring','Sore'),
(35,'Luring','Pagi'),
(36,'Luring','Sore'),
(37,'Luring','Pagi'),
(38,'Luring','Sore'),
(39,'Luring','Pagi'),
(40,'Luring','Sore'),
(41,'Daring','Pagi'),
(42,'Luring','Sore'),
(43,'Luring','Pagi'),
(44,'Luring','Sore'),
(45,'Luring','Pagi'),
(46,'Daring','Sore'),
(47,'Luring','Pagi'),
(48,'Luring','Sore'),
(49,'Luring','Pagi'),
(50,'Luring','Sore'),
(51,'Luring','Pagi'),
(52,'Luring','Sore'),
(53,'Luring','Pagi'),
(54,'Luring','Sore'),
(55,'Luring','Pagi'),
(56,'Luring','Sore'),
(57,'Luring','Pagi'),
(58,'Luring','Sore'),
(59,'Luring','Pagi'),
(60,'Luring','Sore');
/*!40000 ALTER TABLE `wawancara` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-11 18:56:40
