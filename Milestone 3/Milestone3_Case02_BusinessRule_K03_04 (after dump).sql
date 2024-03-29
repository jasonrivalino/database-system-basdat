-- MariaDB dump 10.19  Distrib 10.10.3-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: lpdp4
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
-- Current Database: `lpdp4`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `lpdp4` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;

USE `lpdp4`;

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
  CONSTRAINT `beasiswa_ibfk_1` FOREIGN KEY (`idMahasiswa`) REFERENCES `infopendaftar` (`idMahasiswa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beasiswa`
--

LOCK TABLES `beasiswa` WRITE;
/*!40000 ALTER TABLE `beasiswa` DISABLE KEYS */;
INSERT INTO `beasiswa` (`idMahasiswa`, `universitas`, `prodi`, `jumlahDana`) VALUES (7,'Academy of Arts','Graphic Design',1090),
(12,'Rocky Mountain College of Art and Design','Fashion Design',1238),
(23,'University of the West of England, Bristol','Computer Science',1316),
(43,'China University of Geosciences Wuhan','Geology',1312),
(59,'World University of Bangladesh','Communication',1025),
(82,'Universit├⌐ Ibn Zohr Agadir','Pharmacy',1488),
(84,'Universidade Federal da Grande Dourados','Mechanical Engineering',1223),
(87,'Free University Institute \"Carlo Cattaneo\"','International Law',1125),
(90,'Alahgaff University','Architecture',1408),
(95,'Institute of Management Sciences, Lahore (IMS)','Management',1016);
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
  CONSTRAINT `dokumen_ibfk_1` FOREIGN KEY (`idMahasiswa`) REFERENCES `infopendaftar` (`idMahasiswa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dokumen`
--

LOCK TABLES `dokumen` WRITE;
/*!40000 ALTER TABLE `dokumen` DISABLE KEYS */;
INSERT INTO `dokumen` (`idMahasiswa`, `idDokumen`, `jenis`, `link`) VALUES (1,1,1,'1KgGvXp52ZhD84AiLaH5ueMzr5MN89iojw'),
(2,2,1,'1MSt5kvonmPSkwMZp8iDANN9zW1nxZYEmA'),
(3,3,1,'1Ns4L5CT7KRye5oFLBmzAgCG3h8GnsEd1C'),
(4,4,1,'1ALGFiqVpCSjsHocFbzBC98puTZLm3p5hg'),
(5,5,1,'1kcN9r27skLnhGM6DLuaDErbAgAjATK4V'),
(6,6,1,'1CtyLky94y2tU6j3yK2CsSCnSB5T3jwDNc'),
(7,7,1,'13eEmiAiMLDrKUv9ecMyy3ueHazX9nAscU'),
(8,8,1,'1G1MYb6T4jqusVTaLVNyASmbLKHM6UCot9'),
(9,9,1,'14n3het3qW9ek2XpW1TQYtAz74Vz9df9GR'),
(10,10,1,'1Ft1D1axPiJik8oTWjQNKbDtVDda1QN6kg'),
(11,11,1,'1P4H2a5qdUryY18tEnHuhjfutcHW8Ntoa7'),
(12,12,1,'18gvgamYrKLhNLgUiiBxzAyowS5WYTVVMX'),
(13,13,1,'1GKs2t4u6M1QGbMbg9Xcey8xZFhhUxMTey'),
(14,14,1,'1MYThUzgzDX9CrVtEmc4WW1BBFe1MnZVdK'),
(15,15,1,'1QFGJEummvvkL64CAu6nx4tCythydg5Pr4'),
(16,16,1,'12qraR2MkVKrRgFaDj3cw4gRjdShkTzHoF'),
(17,17,1,'1BWEWHR494xRtvrCZ4p3brYCYJSFsKo7vs'),
(18,18,1,'1GZAZZhJAYmHkZv5ZX4e8SLt7GgMPmt3KW'),
(19,19,1,'1CMP48Wym4NcT2hs2pbH4wRSz31ZaQDZ7H'),
(20,20,1,'1PV9C2N5EAvanpe2BhFuEaLC2PBZtv5fDJ'),
(21,21,1,'1HwBmzfD6TAgTcd9CoHLqiFrzsC2rqkx74'),
(22,22,1,'1NpC2qFT79Fm6jPowjPgCn9kEDBR7KPf2h'),
(23,23,1,'1CadR5dmFKgfM3DWsHdexGuHpDmrDPuEXF'),
(24,24,1,'12dCsyuNsXZZLkDBuT59N5jnZQ78eri8FT'),
(25,25,1,'15Wp68w7LTiFLPoEKqp7cnxGs31c3hDrEp'),
(26,26,1,'18AkFsSssS45TDR1nCyjggYGqCtPwJRhNa'),
(27,27,1,'14yZUgtR5gR4dba3GqW4SvwhzoNvEFu6qv'),
(28,28,1,'1ETtmk8XS2K675tAuq5zfWwLkFY1UpMPNZ'),
(29,29,1,'14hN5MRUzNJHMR1nTrRq6wBdTUc1FjmQoG'),
(30,30,1,'1942ka8eTxqAGhuUTFg9fy8Ausd9H2Fui2'),
(31,31,1,'14aGNVKHknzNawfm7cg2EiapPxbao2Q1iv'),
(32,32,1,'1NNbt4ohH51pXPJBTwBMFGh9D6s41dk3dM'),
(33,33,1,'17LMBEXbZxUeucRhKoG99asAKvUefnyxhb'),
(34,34,1,'17zRsq8CPZvoxfJ6A8y4XtxMMwWXmi1tTY'),
(35,35,1,'14bW57zPGSv8fZbzrF6UK8ZNyUvZyPbuZB'),
(36,36,1,'196Zeu4P1A5c4QpwV38saUzMMWMbhacTbS'),
(37,37,1,'18vVtyFemEzWCnEFQbe79wxvpX6cJCiHgN'),
(38,38,1,'1PJP6JRJcex9UXSZJCEMNVjAa7F95VLmYD'),
(39,39,1,'1AomdhgZF9f7yLJQyALo4EPgfewyUNjnwi'),
(40,40,1,'1ASn31wK8V557M6WPNzKWkRndQGdQvKraK'),
(41,41,1,'14cJpUzFaYaXiogexW8awNVbVVe6TENKfP'),
(42,42,1,'1H7d8kjpXTfTQyY2a6imNRUkMFVpJ4cHYm'),
(43,43,1,'1JhuUserSVETuXVpZCV6PH2TuzNFJ1QnSo'),
(44,44,1,'1jaHmyegWjH9rMb5z1FpyLPW9ctFGcrGW'),
(45,45,1,'13DKCCBYu7iRDNA31EeNQ5heydzxDXkyj4'),
(46,46,1,'191gCnihr4g1FwAWJz6nkjmDegpw2THRMN'),
(47,47,1,'1PLhjkzAeTxf7mY6ZjpQk3v7YRpLX1txSj'),
(48,48,1,'19i8A6vLJDu9PLiEYzXYVCP5QMqM8Pccec'),
(49,49,1,'1HrXx9rT4UU29iGY6WsJez4T4gm6QtCtGw'),
(50,50,1,'1D4XeP9gidjffo1NEyAo6Wi2RoDN6JUx6u'),
(51,51,1,'1CDhuuqowCf5QsWp9nmzNjEywfB3F3ht6u'),
(52,52,1,'1Hy4VsT7c5CFe1SxZExo9ehNcbNoN9XSM8'),
(53,53,1,'1EHNMGHibzeaoTWYnjjKAf9ttwdY8NoWuS'),
(54,54,1,'1NfYZCLHhaH89Du5BuBXHRYA9BXDoArKBF'),
(55,55,1,'1QA16122RznNh2wdWR65o6HqB3Vcnm4FPY'),
(56,56,1,'14CTFXMNK7d5MjPxFzFzMGRYagAKHjrF6b'),
(57,57,1,'15DgjkvKm2SoVNscQJGU7L6kk3VzgouSh3'),
(58,58,1,'1QKDGDntwpdAC1uZJ5Ar5RUzUNjSRsf5yo'),
(59,59,1,'1DTkzT7RiTdxJAYfhF3cAPDvuU1JNikhpg'),
(60,60,1,'191twpQam2wHA3e8CdKv9JHhfqdvoGGsQk'),
(61,61,1,'167nDVabAEtzVQ292BtRbFof1EPedjiQ6J'),
(62,62,1,'1FoE4HRbXoR73CjC3wuXJhdEvXURnD9Nj3'),
(63,63,1,'1CbQj4N6uxDQVzgUB1zkfp38i7PTanFgrq'),
(64,64,1,'16LF5ctVoeRHfMn3ee5ASz9xEX1DEQecCT'),
(65,65,1,'15jHv592r7U23U4xV86Dd4TPR99Jf6vHKt'),
(66,66,1,'1KNoEUrmcwHVUxNKUroVs8DHEnuiK9aZrf'),
(67,67,1,'1PnvwvNATjAPbUAVAqiMbYQpU4owBsbYEK'),
(68,68,1,'17bxupgFCkhrZs2NSnWzuUekcRHdhqud4P'),
(69,69,1,'1LpwbyT9e5QzHiLTvahzFWvYuS9ogpvA8g'),
(70,70,1,'1EgvZh6HunbzaASxSSHHy1UfrkvXzP1L52'),
(71,71,1,'177XJWrjJ4oyPXw6NtsnwJhaeyj8YL5R43'),
(72,72,1,'18QQMsXBNddeTeFFeW3eZ2iYNBwMJVR4Q6'),
(73,73,1,'1ESjAjnB7Kuwk72Qk8833uGpyLQ4stAJGU'),
(74,74,1,'16LTzUWMsju2ggW6KFmPZyKz9hggj2qT45'),
(75,75,1,'12z9zkoVowYv7QUFBE3ruMnGdcHQiaEBcp'),
(76,76,1,'12KjSZbsSwDd6ACutWqSZGg4AEDMntaWVr'),
(77,77,1,'13ZJxQibzwbyEXJ4eMczHnPzA22Z1RoJAM'),
(78,78,1,'1AqesyJfDQ6bw7nVkm6x1LwXg2kaB5jnus'),
(79,79,1,'1HMgnYiYdN2w8pakEMXcGq2EafyG6Pns7b'),
(80,80,1,'17pxPRiWSvNJBDCAfeSUZ6GKQEBWfz3ccT'),
(81,81,1,'1JNfqmJhbvo2PX6woLpsW4vrjFDKCGmTbA'),
(82,82,1,'1EbfCF38sV6B7BntwjUCrvZzTVfsn5xWvW'),
(83,83,1,'1CTYaWDzHCtXbfj2E19ruiaHUEn9vewJYk'),
(84,84,1,'1NTaAGybqyB5r9Wpc8Pqf1gcnsUKboKS4A'),
(85,85,1,'1PA6Hm2soKAkfWBezdq1pzmSAB1xsyxVmC'),
(86,86,1,'1GSqJ7nDyPwGdQ6EJTbBSjmiNDUgGFoafL'),
(87,87,1,'1Mzd9XebLdNPZhK6GDCnaAjPDZAPacySNS'),
(88,88,1,'1BwtyYHVZVAQG1mEqNJT2Cf9jpcMqg2tU6'),
(89,89,1,'1P9Pw69J7axfcfcr4NdyjmEYcHoScQbkoY'),
(90,90,1,'16WkA1QFPMZ9tWzN1dpUhbF9PbbvCTFYp3'),
(91,91,1,'12kJuQaqJJUooumJm2Zss8Am2bAnLyia9P'),
(92,92,1,'1PH427atYsRMYEWnsN7V8HanDDkLffXnRM'),
(93,93,1,'14S59tNNd27mEBoYg8PfZt6DtKtXAGMWBD'),
(94,94,1,'16EsXgeBySByk1qfHjjupZGL1kuZQ3o6pL'),
(95,95,1,'168vmnuXKLfMUdn7Q8neUhs5Wb88So5GGe'),
(96,96,1,'1ZLyeD6rEac5KDDFqx8mifTTqXQKUAjVe'),
(97,97,1,'1CFk4tovEM88VB1oS4YdkfDLquih5KpVuh'),
(98,98,1,'1DTJf9e9strNRpvn53CVUKPsHK5zSSAnja'),
(99,99,1,'1G6PvwfnkBoT9fWLNnqDFvwfUx3G1R6QJJ'),
(100,100,1,'1M7zQCZF9MZvMBgHq4UzqEbZ256jVT9RuX'),
(101,101,1,'1AgbauFH9sPsxGTvF7kHC5wKW3cptxz4bt'),
(102,102,1,'1LvVfDPKdYe4fF7wa7PnEQQPyAgXHvwrDP'),
(103,103,1,'16KKtZTNwikRfMCMf1DNACGr8NKXXdfYLp'),
(104,104,1,'18hfrBfQeNRGtt55mxRAFU7pDozadpZUy'),
(105,105,1,'1GDa2knvQJdHiJKTetCuKWifmbyLNVkB8q'),
(106,106,1,'1x1321J6LAu8epyPNSNQJmY18jnqvYQCU'),
(107,107,1,'14vrAUzsYULGkAgnUYu5i7iaSuXw8unm6g'),
(108,108,1,'1DWm4xCd5pYWL21rHtUGX48UfW2m4zXfy6'),
(1,109,2,'13W88ZqiQkvG6iJf43irts4V2EuaChpZai'),
(2,110,2,'14cSJmQhuU1jsfERTHhRkv6PsZdSB4n7rM'),
(3,111,2,'15ajMHVe45d9mPNXbYYCuukDf2ApDLZHnt'),
(4,112,2,'17niEeDfx6fC2eCuJ94L2NAmd4DgPhH3VH'),
(5,113,2,'18PEsMrtx55B7XSjc4tAaFuzPpx6HbHiZ2'),
(6,114,2,'1NZTh6ksnzvhfQQmnvQrQwX63r864KW8Wj'),
(7,115,2,'1HKre17hMdues3kyT2D6M2qQZc7kSwEfW9'),
(8,116,2,'154ZgLWTyRgYSFZN7pSh5ZiY3q3weUTT7S'),
(9,117,2,'1KL1e6EUn4WX15ePo8MhtpfBDERpfz5juH'),
(10,118,2,'1NTo2bvuPkP7oW6x4dcsnVLnnMQYVTxbjs'),
(11,119,2,'1MGLJUnXHxeXcNms9CeSLb3jxi9d8GCfzD'),
(12,120,2,'13NGBuMxqyms3nCt8TgZytwUMdZAiKC9qB'),
(13,121,2,'13jr6ddSeJPLmcK6kuU17XbmdhowU1eDPL'),
(14,122,2,'1Px15VijY7yXGuK95rjN968c6d6jBCzjJP'),
(15,123,2,'1BQa1rofz7WWZFt7HWWj1wFj3qmdHWq5vH'),
(16,124,2,'1KfwYF2DjHvT2gPAY7VZWfXjnqnQGzEdYt'),
(17,125,2,'1PpkJSJoELBvGR8Y5vPjUr9bZ6iiPQzMzM'),
(18,126,2,'1P5xVj47XyoXQ5jbSWWH92KZ6fvRnQzZJ'),
(19,127,2,'1JvApJRMU6kSDMpaLY9KXtr2925eSMjCHr'),
(20,128,2,'1EQNZryxSeLYebHLcfyVVXR36LqfsqsKsS'),
(21,129,2,'1B1VcPEYPg9YmAu2wH6KtJ5mtBumnJ11fY'),
(22,130,2,'1n3BmwH7zB3wgVFqJXXpprNoot6A26txB'),
(23,131,2,'1DC6hfviyxTkQ5ByNcKx7iYCxt1uCM41A6'),
(24,132,2,'1LQJ6vSXSHAeFiFjtYweWjsFbNybcnU1Kk'),
(25,133,2,'1JnbEJHu8jXMRqiv4W9QDU83XodW81zhAA'),
(26,134,2,'1Pt6cDpdkxJs9jqQd9BLL7ipFTWJKQtsj5'),
(27,135,2,'1HmiDxfQKivyp53i2h2Q8eEeJByxBjYenL'),
(28,136,2,'1FwpxvMxjosGxEP3wrEnQjLqjD9KQdFgRa'),
(29,137,2,'193ucVrtQDJ6kvTVEhUKo3epviCwyV8QGX'),
(30,138,2,'1BppY3HoAQySRmaSHwuNMZD8US8wPfgN6E'),
(31,139,2,'1DZRbApsGfEZEDoh3w76oyE3Pw8G1zk4w4'),
(32,140,2,'1AGP1tS3MATk1FXAz5zhjAWkYgZVsNy4jy'),
(33,141,2,'1RqkzVUfPuPeGfs4EF1w5vxXTAv4x3pmj'),
(34,142,2,'1N2bhE5jnwDzpbuem5C9ME3EPn1UnpfCtU'),
(35,143,2,'13sPDdEwXPcMHwUdmR9vpQtbBWJMgwhs4S'),
(36,144,2,'13CKFCkA4wuk9eXReQbLjZc5LuV2yDm6rY'),
(37,145,2,'1JdaB9CrsNeF9MrJTXEnTnAWLfHHKxBiH5'),
(38,146,2,'1PVzng83aaP7GSPaFTGPrkcfAVRy7EH1W'),
(39,147,2,'1JRUR8iy8EAsRxaKKpp9TxJJb9PzQ5VHFo'),
(40,148,2,'1EL7kgKW2XL3eiWKN47tsPpRXRufQwGK9s'),
(41,149,2,'1PwzUyzeVijAcUQ4cALD7gaMPRJepJBi9X'),
(42,150,2,'12dWtDkva5npzqkFCKbgsAsRRHn7RXd3CG'),
(43,151,2,'1MuC2CMZ1GbtH8gJuPHcfD8D3Swnk9mLeB'),
(44,152,2,'1L9AuWHsYCD72qdSiy1JTQPQYC1NCuVWDL'),
(45,153,2,'1CnG6cCgHjN8uvPe5PMuQubSE12yeGoJeB'),
(46,154,2,'1ATarBLH2snPFhnKD71UaxhknY3Lpko4Xq'),
(47,155,2,'15De8Y6PePG1wm1BJS2YK5EMnqJCffnKCF'),
(48,156,2,'1GQmQoWRqx8j8e8FC1db7VWToRv6Dm15PK'),
(49,157,2,'194DM3bDdArTtnpcsuWdN2gMGr1sDYJmsj'),
(50,158,2,'18fAzzVnfEgLkxd1Q2RmouAtFNaHC4eRbb'),
(51,159,2,'1ExQBkNNar2SRGAv7hTw3jMyJRSWcLEEW6'),
(52,160,2,'1PFgLB79Xj6kd7jaaKdN9voHbJh2jirXrM'),
(53,161,2,'1M86eJoKKcP2jX92JQxvp13Q5bBRtdW4ro'),
(54,162,2,'1PE3tp6c1F7Vj5iWDbQ7NVoW4UbyUq8iZD'),
(55,163,2,'1NHEd2Lg7AANgEEXu5VDPAgkkrtr9mSfrB'),
(56,164,2,'1JFM9w8XWY6KhuoVvbR8FTgoQjZkUodWup'),
(57,165,2,'1PkftthVcTJtS48KgxWdDZbxmduGmgErK1'),
(58,166,2,'1He1Rw3sFnn34xFyZES4oDzteMvzNhzBd9'),
(59,167,2,'157BpFRT5HYUzYVMXeytNmXQozYSQvK6px'),
(60,168,2,'1FPgwgg2Z7m2p48ttaAxFyjk7rrUH8vDzs'),
(61,169,2,'1EocK4NwxZCg8HoRJpR3h1Ah1dgQ7daboN'),
(62,170,2,'1G4aUDYbgv2wyXBmPhRiz4qWygVCd1ba5w'),
(63,171,2,'188z8Ah7oY2UQdYTDnpqK5ZbKboBdQbLC6'),
(64,172,2,'1HG3eW4njxtjcbMz6vwkViEP7YPMmatwbr'),
(65,173,2,'1CDeyx1dxZxeZK8UorKizhHswWsZktgWPx'),
(66,174,2,'1MEsUtvbXJ7CtrPQ3EFTNSqw1h4JKvxXja'),
(67,175,2,'1BPXh9x6DcmdS14QUu8Rtdgmni8gkxWk6r'),
(68,176,2,'1GAgDzjiieMsukdc8wyjjWoZ6V3jCUTDsV'),
(69,177,2,'18wfd9HRZFPaQBbTPLeZrLH5Kn1kmf9nMa'),
(70,178,2,'1H7ejMb7FuB97YiCceaSq73NvwMmabTXkt'),
(71,179,2,'1LqxAdqd2wMMSSD3hXuCQB3kNUJ6msL3Cb'),
(72,180,2,'14aKRixQqywumuVJSQsWBXb4EuA93nvEQz'),
(73,181,2,'1Dr6PETo1Efna2mrUXozzjLsZn2tTVX8eh'),
(74,182,2,'1Hjm9wBfiDzE8GSa8PFS8RAj4bBLaRH4J8'),
(75,183,2,'1GiNavrCQTq3yDR8eCgWaFErrCVDZYsgYA'),
(76,184,2,'1Az3wYzFhQsBVrbHvtB5cAdjomkCeV6zy8'),
(77,185,2,'16idJ17R555AcEryqQ6Mewhq4BRtBvAxgJ'),
(78,186,2,'1Aqjht8qnjauzNUk7FXvPcFzy9V6JMeSCX'),
(79,187,2,'1Jh57jA6H3B27YdWQ7nasxofsXga2PvESZ'),
(80,188,2,'1JcN2RNj3MH6tjsH9PQMzUKZqpSpcW5bEZ'),
(81,189,2,'1P6pLhubw4YJZ7fBcxv22f11gaaq8keuXv'),
(82,190,2,'1MsRirqwSDSxwSXSZZY7iYGXRfXbyVDwMc'),
(83,191,2,'1P8SZR3KF5iYFSpFYiLaTwK1W5NYp1X5oD'),
(84,192,2,'17D2FNyfNbotAqPABXNKrdhkR8cBAxP6Ya'),
(85,193,2,'1LmYimqNDRvHXv38uyXeuGxYfPCnVytWgk'),
(86,194,2,'15nQVpBMY7CdnDwtbBWaasu2Qx8c2UgYK7'),
(87,195,2,'1ASeUvCdkTudAcy2CDazaEyBufXxQ3VXvW'),
(88,196,2,'1E6Cime9DsqcX5i2YoQPuezP6ESaccinJG'),
(89,197,2,'12Po1YsaJGXnagqX5qqNt55San8zzBYRcT'),
(90,198,2,'194dhQNQ7xAUeaxpMiNiRiMZFcCxPtd6Z3'),
(91,199,2,'1HTZs4M7FAozkpZAWnXbiM83pnWs6bEPKF'),
(92,200,2,'19g9Bgeu6AWMBxUmkSYAitkHY6ww8yvpti'),
(93,201,2,'1BS2FGvihfQGZHz9N8PyEL8uubP5JzqXxr'),
(94,202,2,'1LjVkBZxpHtfp5gfSy2UrRecA7rReMd1xK'),
(95,203,2,'148BTxkHzB9cLQ5kfQ7hVFuqiVmGW7MQ8P'),
(96,204,2,'17X2nGxtbErY3Q1aLvCMTJr3Ew3migykCV'),
(97,205,2,'127ufG1xM2z7bVg2osGcUdiMmjyaS2Qrz3'),
(98,206,2,'1PtaeyXjXuvCH8ajD3m3311mH8hsW4JEYS'),
(99,207,2,'1FuJgX8iE7CADiQHf3wbBiwdhU84WFGd6m'),
(100,208,2,'1Lg7BqENDsEaZ5pK8Viqd8k8JrVrqUC6tp'),
(101,209,2,'1GSpvAdL9fy4cQPNA7ivz2xGVrwQQZktyX'),
(102,210,2,'177WB4C67bqKVFY1PWLymkEimoqmwYYqGi'),
(103,211,2,'1GPKrgEsos7LaKZc5NCASg66yTmGmEsni5'),
(104,212,2,'1GAfQFEQH8bihnzCryfpH9Re6XwG16Cv5b'),
(105,213,2,'15mLzUXtCiBAqDarvUWLhzPnHEts3x8X63'),
(106,214,2,'1618k2Pd8L7zRLj2h5cFyZkw4NLMx3XgnQ'),
(107,215,2,'19irjr4ExdkNCCKuWA3CVo4EyzpTVcLxcM'),
(108,216,2,'1369U7fo9HbNuWdgLr6HqY6UEPbVZiz4t7'),
(1,217,3,'17ScbouzB6SQmQTvY6jjBWvPsYRbVcr6Hk'),
(3,218,3,'16vmAwXBNRjjnsWbcT8NhEENrTwrZBq4RL'),
(5,219,3,'18f95L4cocNypVaq9SeDEEQsQk9AYW41y4'),
(6,220,3,'1GfBojG9v4kryZbdHGnnb2unrd19NFHtfu'),
(7,221,3,'1438gHBmfYBhQ8P62Sr9zhZdi1bfB9J9bL'),
(8,222,3,'13TGpXTU4KEra8ieSxiA59jVEW9r25a8qt'),
(9,223,3,'1qX7F7DoknqTwWMjrN92Dzh4QeNxU8hQN'),
(10,224,3,'14bvXJqc6eKydCzjWnUjJfWJcHNKRG7P4i'),
(12,225,3,'1DsVqVHDbqRry8KEaG2CVRFU5A1WfKHzt5'),
(13,226,3,'1DMHogHbNLkmr5e6GUdrEKpZ5zjCmrf4Bz'),
(14,227,3,'1ERX6bMRTyhG5NRoCSpVgC6MPCti12ahP3'),
(16,228,3,'19tL1mpiJDEH5d2EQNWexHT5pCRTAkKMVA'),
(17,229,3,'1F8MXP2UTyL21NYZGDofc3zegsEZGDioG1'),
(18,230,3,'16TpFxYAPXiLk2XteFMYwMgN1Af8ZQB1YG'),
(19,231,3,'1JtQgZ5fTQRN7Y2htkDxPZ1fhvVVxZUYRf'),
(20,232,3,'1HxUiqreccxpWW154TaQ1giZ12ntDUd8Zy'),
(23,233,3,'1F79PQxmjEuy53RhVj1VuWKySRHRAANV6G'),
(24,234,3,'164NcJhBAsPohcUDTd7WAVeGzwR1FZuwMr'),
(27,235,3,'1Hrvm44YstDpkgiwCen2ScmDErFtDGcuWn'),
(28,236,3,'1PTgNV3HVMNfVjMNt3TEVkaZksRuVfUYE2'),
(30,237,3,'112DvLv2e1onTdDuW7hStwf5atFq14FBNH'),
(32,238,3,'18T3172weJn3ZqtCDm8hogQBdfnGzDFMzU'),
(33,239,3,'1J16RNX5jYajZmU49Y7jU4Q68Bfgyj1rGe'),
(34,240,3,'16xJCymYeke4L2nEK7BvYgRKtEX4PijUYu'),
(36,241,3,'1FkjcFsJYhs8YTtZEPA4neH524c7UdY6sC'),
(37,242,3,'1F7pbhCHnTiJSqeetgbEFUB8qK5bJ7wphn'),
(38,243,3,'15A7oRmhUsndKBxjDych7nHNiysw7dm9L4'),
(40,244,3,'167iy7zssJyk1wFJznvTUSaBR5vu1fYyJ2'),
(41,245,3,'1Ag2wfsms5p4fCnVfaMpghgNtm8Ef9nE2K'),
(43,246,3,'1AsR1A5T3r4uJicagmo3AaWCebbftB3p2p'),
(44,247,3,'1Led3Sk6ePHY6U8LWSzduKH4N6vAnH41zk'),
(50,248,3,'1KfLTqr6mszmf7wNF24YEbxTxQgTo3b4Nz'),
(55,249,3,'1DX24KbfG4v62vE1rw9P8yGdRdnkp5naZL'),
(59,250,3,'1P83Kcs7we623shyA94d4bActaCDHAjP8A'),
(61,251,3,'1C6vsPfJGbWrR5W6jSts2m4S5rYAr5Hbpv'),
(63,252,3,'19TRjE6QWSs5hxC5J6uQpCE9YR7veVPT5a'),
(64,253,3,'1AJXggobCNun7FhR63iVXcdpASnfiAy2uw'),
(65,254,3,'1CM3E1s67E3W5shCZvSDQeEtiMS5iCuQeq'),
(67,255,3,'14CzdzWbykKpL7qSRcNDm72Go1fLH31iCA'),
(69,256,3,'1MkY5JDrJy8jWxZktWwXF3bHFQvBEQxg7w'),
(70,257,3,'1C7QkRhWr2oCWczXbjB9Vwwq2Yue2m4MQD'),
(73,258,3,'1PBmBzB1NamgC3WQDtv4VBgpy87XeBjrZr'),
(76,259,3,'1CsLfApR9GAduS2CMUJvFDC9aouxujicVg'),
(81,260,3,'1Fqu6RbhGu3y8DXtPUFAC9TAhWABZNYXvH'),
(82,261,3,'12wZDPPr5s8tYkmpwnsa2AYkGLhT4v2A4L'),
(84,262,3,'1MZwmson3DWMpFb3b817YjrkoRHEPFx46m'),
(86,263,3,'1DDQ9tWeaaNgDeyeEXBeqB7y17WrbF32n3'),
(87,264,3,'1Cdn1ZKoiCPmeiHx2nAdWxexKN7chCJpPa'),
(88,265,3,'17L6GB6crtgzhKLsiMVbqku1L6kC3HQ9Ap'),
(89,266,3,'16RaVFnM8KhSMBNxFfBQfpbpETVGEivYC5'),
(90,267,3,'1BZKgdr2Uv9f5SKT2jqK1CTrL1bTfUnPiB'),
(92,268,3,'18Ltw78iWqyWGmXtPKPFDcD6viRSBANJNY'),
(93,269,3,'1C7RS8cfeuZghSrMYXWmZPbfD82FTwC1ty'),
(94,270,3,'1Gw5zfM2dGhyGzc5fYgpMBHWVbVFhCbDYY'),
(95,271,3,'16PRfChGWjVb3GXLioxruav7ZVtn9PwqBA'),
(96,272,3,'12Tx76CyysgGCcE9cH46A7cyKyvu449JCb'),
(97,273,3,'1PiV1pDee3EpfGFMJxU5qjUoKTyWbNV7r7'),
(98,274,3,'173N5vXX2spuTPusAm9UG8fUGCqS8GUC9r'),
(99,275,3,'15hEngMoz6zMSwBT6QiD7eNLG1DP5a5u2s'),
(100,276,3,'1EigCRHKjhb5ecdrcPfSjD5BGzY3UBWbej');
/*!40000 ALTER TABLE `dokumen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `infopendaftar`
--

DROP TABLE IF EXISTS `infopendaftar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `infopendaftar` (
  `idMahasiswa` int(11) NOT NULL,
  `namaLengkap` varchar(50) DEFAULT NULL,
  `jenisKelamin` varchar(50) DEFAULT NULL,
  `tempatLahir` varchar(50) DEFAULT NULL,
  `tanggalLahir` date DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `noTelp` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `kelengkapan` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idMahasiswa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infopendaftar`
--

LOCK TABLES `infopendaftar` WRITE;
/*!40000 ALTER TABLE `infopendaftar` DISABLE KEYS */;
INSERT INTO `infopendaftar` (`idMahasiswa`, `namaLengkap`, `jenisKelamin`, `tempatLahir`, `tanggalLahir`, `alamat`, `noTelp`, `email`, `kelengkapan`) VALUES (1,'Sibley Wilstead','Female','Rostokino','2003-02-09','8 Corscot Trail','594-443-2923','swilstead0@tripod.com','1'),
(2,'Rockie Chaperling','Male','Luksuhin','2003-01-12','688 New Castle Drive','734-999-4222','rchaperling1@berkeley.edu','0'),
(3,'Yalonda Tume','Female','Link├╢ping','2002-07-01','9303 Everett Pass','958-762-5367','ytume2@salon.com','1'),
(4,'Enrichetta Pittford','Female','Sanshilipu','2003-01-14','11239 Shopko Hill','295-340-6335','epittford3@soup.io','0'),
(5,'Somerset Stears','Male','Baghdad','2002-09-13','4 Bunting Place','722-493-2808','sstears4@artisteer.com','1'),
(6,'Tilly Ockenden','Female','Guatrach├⌐','2002-07-28','89 Troy Plaza','473-682-9670','tockenden5@themeforest.net','1'),
(7,'Wylma Oxby','Female','Mbak├⌐','2002-06-12','4212 Corscot Drive','644-413-1581','woxby6@ycombinator.com','1'),
(8,'Stacee Latore','Female','Mahanoro','2002-09-15','04 Fairview Street','723-138-4360','slatore7@vistaprint.com','1'),
(9,'Terri Starkey','Female','Yag La','2003-01-30','814 Butternut Road','725-758-7116','tstarkey8@spotify.com','1'),
(10,'Dell Antley','Male','Leran Kulon','2002-05-28','03 Carioca Point','563-735-6459','dantley9@hao123.com','1'),
(11,'Sumner Ditts','Male','Itsandra','2002-10-28','59371 Oak Terrace','547-495-7611','sdittsa@storify.com','0'),
(12,'Klara Corkhill','Female','Serebryanyye Prudy','2002-10-27','0 Warbler Avenue','902-717-6644','kcorkhillb@google.fr','1'),
(13,'Doy Bendle','Male','Brooklyn','2002-07-04','53797 Eagle Crest Parkway','212-439-6249','dbendlec@creativecommons.org','1'),
(14,'Nana Hoolaghan','Female','Yashalta','2002-11-17','7917 Nancy Road','185-905-3027','nhoolaghand@artisteer.com','1'),
(15,'Corina Aylesbury','Female','Oenunu','2002-08-03','40746 Westridge Parkway','587-724-5144','caylesburye@cyberchimps.com','0'),
(16,'Scotti Walkling','Male','Talnakh','2002-09-30','41718 Iowa Hill','280-669-7943','swalklingf@squarespace.com','1'),
(17,'Cindy Ensley','Female','Paoniawy-Bramura','2002-11-03','2 Buhler Court','528-388-9679','censleyg@sohu.com','1'),
(18,'Elden Bercevelo','Male','Huilong','2003-02-02','40 Linden Pass','676-879-8555','eberceveloh@psu.edu','1'),
(19,'Pall Alcorn','Male','Esch-sur-Alzette','2003-02-21','89026 Kinsman Terrace','146-212-5576','palcorni@businesswire.com','1'),
(20,'Debor Pechacek','Female','Sabi','2002-04-29','4298 Artisan Pass','830-334-3968','dpechacekj@cargocollective.com','1'),
(21,'Carlina Thripp','Female','Wates','2002-04-20','72 Hintze Terrace','659-410-9484','cthrippk@blogspot.com','0'),
(22,'Ginny Saynor','Female','Bastos','2002-07-06','4296 Mcguire Terrace','357-519-7433','gsaynorl@tripadvisor.com','0'),
(23,'Pincus Brunini','Male','Zhuji','2002-06-12','8455 Toban Place','783-947-1535','pbruninim@amazon.de','1'),
(24,'Niven Coakley','Male','Carangola','2002-12-20','4337 American Road','574-404-8737','ncoakleyn@tripadvisor.com','1'),
(25,'Saul Sharpin','Male','Birigui','2003-01-16','2 Crescent Oaks Point','909-368-1305','ssharpino@g.co','0'),
(26,'Kessia Aristide','Female','Nukualofa','2002-12-14','6598 Holy Cross Crossing','371-495-1452','karistidep@dion.ne.jp','0'),
(27,'Curcio Keast','Male','Punta Gorda','2002-12-06','12896 Fallview Circle','941-447-3141','ckeastq@twitter.com','1'),
(28,'Juieta Courcey','Female','Mabalacat','2002-09-21','9 Rockefeller Trail','908-542-1148','jcourceyr@europa.eu','1'),
(29,'Hermine Charles','Female','Florencio Varela','2002-12-12','5227 Dryden Avenue','739-216-3400','hcharless@bravesites.com','0'),
(30,'Ola Wainer','Female','Shinyanga','2003-02-09','867 Fremont Street','671-304-1795','owainert@java.com','1'),
(31,'Karlis Penddreth','Male','L├╝cheng','2002-05-06','59 Pawling Crossing','709-975-4099','kpenddrethu@jimdo.com','0'),
(32,'Mariette Lidster','Female','Kopen','2002-11-09','93 Carioca Junction','123-594-8362','mlidsterv@usda.gov','1'),
(33,'Delbert Petkov','Male','Ribeir├úo Preto','2002-11-03','5 Anzinger Alley','396-436-3504','dpetkovw@jigsy.com','1'),
(34,'Laney Gheeraert','Male','Kelowna','2002-05-10','997 Twin Pines Hill','554-674-2024','lgheeraertx@aboutads.info','1'),
(35,'Romola Allabarton','Female','Huazhu','2002-04-30','25514 Bowman Way','994-415-9559','rallabartony@wufoo.com','0'),
(36,'Lockwood Clampin','Male','Jingxiyuan','2002-06-07','431 Elgar Point','965-391-8779','lclampinz@tmall.com','1'),
(37,'Daffy Whitmore','Female','Xinandu','2002-04-26','762 Melvin Terrace','269-508-9986','dwhitmore10@1und1.de','1'),
(38,'Raff Rohlfs','Male','Nikolsk','2002-05-16','5989 Harper Center','557-563-3423','rrohlfs11@elegantthemes.com','1'),
(39,'Darda Hamblington','Female','Zuocun','2002-10-09','0 Towne Terrace','361-542-4920','dhamblington12@drupal.org','0'),
(40,'Ian Kellitt','Male','Vetluzhskiy','2002-06-28','395 Bunting Drive','375-348-3728','ikellitt13@drupal.org','1'),
(41,'Marie-jeanne Chedzoy','Female','Shatoujiao','2002-11-25','23 Artisan Hill','791-274-2177','mchedzoy14@yellowbook.com','1'),
(42,'Meghann Abbitt','Female','Tanggan','2002-09-27','8616 Delaware Trail','904-929-1347','mabbitt15@kickstarter.com','0'),
(43,'Madelaine Irnis','Female','Kuala Bintang','2002-07-25','33 Express Drive','990-401-3290','mirnis16@springer.com','1'),
(44,'Saundra Birkenhead','Male','Amassoma','2002-06-22','701 Birchwood Parkway','522-221-5386','sbirkenhead17@google.co.uk','1'),
(45,'Arly Halwill','Female','Polyarnyye Zori','2002-10-12','45 Schurz Junction','345-299-1212','ahalwill18@webmd.com','0'),
(46,'Alena Rubrow','Female','Kil','2002-11-15','2 8th Way','811-294-6729','arubrow19@pinterest.com','0'),
(47,'Buddy Paradyce','Male','Berlin','2002-12-27','91539 Shelley Place','578-506-5654','bparadyce1a@ed.gov','0'),
(48,'Rouvin Garlicke','Male','Bhatpara Abhaynagar','2002-10-31','021 Scott Place','780-652-4412','rgarlicke1b@google.de','0'),
(49,'Rolfe Wiltshire','Male','Wakuya','2002-10-17','2846 North Center','432-151-3564','rwiltshire1c@dmoz.org','0'),
(50,'Halie Challice','Female','Torreira','2002-06-17','2225 Rockefeller Parkway','376-618-2519','hchallice1d@dedecms.com','1'),
(51,'Bryanty Tideswell','Male','Sipe Sipe','2002-09-19','1273 Park Meadow Hill','968-672-7274','btideswell1e@etsy.com','0'),
(52,'Nanny Toffoletto','Female','Choropampa','2002-06-26','3 Towne Center','987-329-1897','ntoffoletto1f@privacy.gov.au','0'),
(53,'Yancey Pavlasek','Male','Penitik','2002-10-27','13 Starling Terrace','997-483-2632','ypavlasek1g@msn.com','0'),
(54,'Matty Greve','Male','Sepidan','2002-04-06','661 Blue Bill Park Hill','742-931-8376','mgreve1h@people.com.cn','0'),
(55,'Rabbi Santos','Male','Yamaga','2002-10-15','949 Ohio Center','359-730-0877','rsantos1i@paypal.com','1'),
(56,'Casey Hadlington','Male','Arad','2003-01-13','0152 Katie Place','272-590-6617','chadlington1j@npr.org','0'),
(57,'Cleveland Vuitton','Male','Den Haag','2002-08-27','0 Bellgrove Pass','961-455-3219','cvuitton1k@woothemes.com','0'),
(58,'Aubert Bullin','Male','Berlin','2002-12-06','05 Kipling Lane','647-134-3931','abullin1l@apache.org','0'),
(59,'Bart Itzkov','Male','Kastornoye','2002-08-23','284 Springview Point','983-247-4187','bitzkov1m@blogspot.com','1'),
(60,'Ruthie Decreuze','Female','Neglasari','2002-08-03','885 Ilene Pass','465-568-9675','rdecreuze1n@yelp.com','0'),
(61,'Carlita Inett','Female','Ganhe','2002-06-05','4711 Hallows Place','807-953-1504','cinett1o@ebay.co.uk','1'),
(62,'Catherin Stratz','Female','Renko','2002-08-13','90 Michigan Terrace','143-722-1781','cstratz1p@utexas.edu','0'),
(63,'Dasya Kopf','Female','Skuratovskiy','2002-11-07','8601 Eagan Pass','518-124-2142','dkopf1q@altervista.org','1'),
(64,'Roselin Sterley','Female','Ma\'an','2002-12-14','85 Fallview Parkway','728-423-1501','rsterley1r@youtube.com','1'),
(65,'Farrand Lumsdale','Female','Almendra','2002-09-29','606 Helena Pass','183-711-9448','flumsdale1s@sbwire.com','1'),
(66,'Desi O\'Towey','Male','Dembeni','2002-12-06','538 Homewood Alley','479-594-2226','dotowey1t@rambler.ru','0'),
(67,'Anastasia Witnall','Female','Jammain','2003-02-06','468 Commercial Junction','828-667-4670','awitnall1u@msu.edu','1'),
(68,'Thatch Tillett','Male','Guabito','2002-12-13','18881 Sloan Park','697-313-0096','ttillett1v@intel.com','0'),
(69,'Jourdan Faunch','Female','Xiadian','2002-05-08','4 Rieder Plaza','846-339-4920','jfaunch1w@cam.ac.uk','1'),
(70,'Coretta Sutter','Female','Sukumo','2002-05-05','87 Eastwood Street','684-836-9314','csutter1x@harvard.edu','1'),
(71,'Yanaton Joseff','Male','Malveira','2003-02-12','61 Prairieview Avenue','840-942-8166','yjoseff1y@irs.gov','0'),
(72,'Wittie Littell','Male','Volzhskiy','2002-04-08','104 Prairieview Way','662-420-6197','wlittell1z@addtoany.com','0'),
(73,'Rosemarie Lankham','Female','Manta','2003-01-24','32 Londonderry Drive','780-412-7705','rlankham20@mtv.com','1'),
(74,'Giana Timothy','Female','V├ñstra Fr├╢lunda','2003-01-26','809 Dennis Pass','786-553-8827','gtimothy21@apple.com','0'),
(75,'Shelagh Bartolomeotti','Female','Honolulu','2002-10-11','1277 Chive Trail','808-543-4875','sbartolomeotti22@intel.com','0'),
(76,'Mirna Gelletly','Female','Badin','2002-06-21','231 Westend Trail','810-320-4548','mgelletly23@cnbc.com','1'),
(77,'Jason Mixworthy','Male','Binuangan','2002-12-17','72979 Mifflin Terrace','794-259-8465','jmixworthy24@loc.gov','0'),
(78,'Meggi Kingswood','Female','Dauphin','2002-10-07','57 Prairieview Avenue','384-155-1897','mkingswood25@ustream.tv','0'),
(79,'Wilie Fonte','Female','Nha Be','2002-09-09','74 Manufacturers Drive','942-904-3296','wfonte26@phoca.cz','0'),
(80,'Annalise Alfonzo','Female','Cabarroguis','2002-07-05','322 Scott Lane','543-639-4092','aalfonzo27@de.vu','0'),
(81,'Thaxter Allsworth','Male','Helmsange','2002-08-19','34 Waywood Point','714-300-4983','tallsworth28@live.com','1'),
(82,'Kerstin Esterbrook','Female','Wuyahe','2002-12-30','7455 Forest Court','108-538-7828','kesterbrook29@liveinternet.ru','1'),
(83,'Ilse McBrearty','Female','Xinbao','2003-02-12','262 Southridge Road','970-437-5111','imcbrearty2a@miibeian.gov.cn','0'),
(84,'Ronnie Moraleda','Female','Crauthem','2002-09-21','58931 Dexter Center','372-528-8228','rmoraleda2b@geocities.com','1'),
(85,'Tera Vannoni','Female','Bangan-Oda','2002-06-13','0045 Butternut Way','621-502-2607','tvannoni2c@sbwire.com','0'),
(86,'Wallace Rabjohn','Male','Shchuchin','2002-04-11','24 Kim Drive','586-271-7819','wrabjohn2d@ifeng.com','1'),
(87,'Chelsie Andrys','Female','Gunung Talang','2002-08-17','7 Melvin Terrace','718-986-8682','candrys2e@instagram.com','1'),
(88,'Petronille Bydaway','Female','Haoxinying','2002-12-12','3 Loomis Hill','130-113-5545','pbydaway2f@yahoo.com','1'),
(89,'Oliver Densey','Male','Dos Quebradas','2002-08-25','1 Bluejay Point','814-632-9764','odensey2g@timesonline.co.uk','1'),
(90,'Iorgo Garling','Male','Suchan','2002-12-01','03637 Logan Pass','598-542-3324','igarling2h@alibaba.com','1'),
(91,'Alaric Josebury','Male','Stare Kurowo','2003-02-02','0070 Alpine Drive','192-192-7822','ajosebury2i@flavors.me','0'),
(92,'Vasilis Pooke','Male','Jiangshan','2002-08-30','6564 Bowman Park','764-820-5149','vpooke2j@scribd.com','1'),
(93,'Agnola Kittman','Female','Xindian','2002-07-04','17364 Arizona Place','545-928-2019','akittman2k@tripadvisor.com','1'),
(94,'Chantalle Marvel','Female','Huangnaihai','2003-03-02','36 Del Sol Hill','929-563-0997','cmarvel2l@rediff.com','1'),
(95,'Gauthier Leatham','Male','Farmahin','2003-01-18','628 David Crossing','630-285-1010','gleatham2m@webs.com','1'),
(96,'Meade Eckford','Male','San Sim├│n','2002-05-14','26 Cody Center','391-706-1952','meckford2n@bbc.co.uk','1'),
(97,'Wenona Antonognoli','Female','Saltsjo-Boo','2002-07-04','95 Graceland Hill','904-415-2432','wantonognoli2o@cmu.edu','1'),
(98,'Ava Brickwood','Female','El Rosario','2002-07-02','64 Blaine Street','755-312-7132','abrickwood2p@taobao.com','1'),
(99,'Daniela Baybutt','Female','Yantal','2002-08-28','676 Fremont Hill','465-977-4767','dbaybutt2q@umn.edu','1'),
(100,'Peyton Kopfer','Male','Astara','2002-06-09','1380 Autumn Leaf Parkway','888-867-2986','pkopfer2r@si.edu','1'),
(101,'Valry Isacq','Female','Dois Portos','2003-02-20','32870 Oneill Avenue','591-970-9715','visacq2s@facebook.com','0'),
(102,'Orran Milkin','Male','Paritaman','2002-09-09','088 Roxbury Park','498-673-6505','omilkin2t@4shared.com','0'),
(103,'Baxy Richt','Male','Paraipaba','2002-10-06','84334 Loeprich Court','274-780-8146','bricht2u@lycos.com','0'),
(104,'Costanza Buesnel','Female','Capaj','2002-07-19','4 Fallview Crossing','957-764-7422','cbuesnel2v@vinaora.com','0'),
(105,'Nixie Dodsley','Female','Dalianhe','2002-12-06','98 Drewry Street','176-954-2029','ndodsley2w@goo.gl','0'),
(106,'Westley Grellier','Male','Raposos','2002-08-11','82 Mosinee Trail','151-779-4049','wgrellier2x@weibo.com','0'),
(107,'Gladys Brandes','Female','Hudiksvall','2002-10-17','52 Warner Terrace','516-533-9637','gbrandes2y@shop-pro.jp','0'),
(108,'Griff Stanyland','Male','Lawonda','2002-09-03','7840 Oak Valley Circle','406-720-4752','gstanyland2z@toplist.cz','0');
/*!40000 ALTER TABLE `infopendaftar` ENABLE KEYS */;
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
-- Table structure for table `nilaipsikotestpendaftar`
--

DROP TABLE IF EXISTS `nilaipsikotestpendaftar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nilaipsikotestpendaftar` (
  `idPsikotest` int(11) DEFAULT NULL,
  `nilaiPsikotest` decimal(5,2) DEFAULT NULL,
  KEY `idPsikotest` (`idPsikotest`),
  CONSTRAINT `nilaipsikotestpendaftar_ibfk_1` FOREIGN KEY (`idPsikotest`) REFERENCES `psikotest` (`idPsikotest`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nilaipsikotestpendaftar`
--

LOCK TABLES `nilaipsikotestpendaftar` WRITE;
/*!40000 ALTER TABLE `nilaipsikotestpendaftar` DISABLE KEYS */;
INSERT INTO `nilaipsikotestpendaftar` (`idPsikotest`, `nilaiPsikotest`) VALUES (62,383.76),
(62,42.65),
(62,286.20),
(62,47.09),
(62,293.57),
(62,241.62),
(61,309.36),
(62,195.96),
(61,95.39),
(61,7.59),
(61,53.20),
(61,278.71),
(62,87.05),
(62,317.11),
(61,236.65),
(61,168.86),
(61,167.12),
(61,134.28),
(61,121.98),
(61,259.31),
(62,168.24),
(62,372.18),
(62,43.88),
(62,62.28),
(62,33.93),
(61,85.24),
(61,3.98),
(61,169.28),
(62,263.82),
(61,105.11),
(61,39.94),
(62,199.13),
(61,206.98),
(61,227.53),
(62,265.38),
(62,372.09),
(61,288.24),
(61,264.61),
(61,345.57),
(62,158.69);
/*!40000 ALTER TABLE `nilaipsikotestpendaftar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nilaiteskesehatanpendaftar`
--

DROP TABLE IF EXISTS `nilaiteskesehatanpendaftar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nilaiteskesehatanpendaftar` (
  `idTesKesehatan` int(11) DEFAULT NULL,
  `nilaiTesKesehatan` decimal(5,2) DEFAULT NULL,
  KEY `idTesKesehatan` (`idTesKesehatan`),
  CONSTRAINT `nilaiteskesehatanpendaftar_ibfk_1` FOREIGN KEY (`idTesKesehatan`) REFERENCES `teskesehatan` (`idTesKesehatan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nilaiteskesehatanpendaftar`
--

LOCK TABLES `nilaiteskesehatanpendaftar` WRITE;
/*!40000 ALTER TABLE `nilaiteskesehatanpendaftar` DISABLE KEYS */;
INSERT INTO `nilaiteskesehatanpendaftar` (`idTesKesehatan`, `nilaiTesKesehatan`) VALUES (68,55.66),
(64,321.13),
(72,71.77),
(73,149.99),
(74,31.08),
(66,92.70),
(82,265.25),
(63,87.07),
(79,16.11),
(67,251.11),
(76,348.39),
(75,48.36),
(81,253.35),
(65,297.10),
(70,239.10),
(80,72.67),
(78,310.89),
(77,78.38),
(69,383.77),
(71,77.11);
/*!40000 ALTER TABLE `nilaiteskesehatanpendaftar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nilaiwawancarapendaftar`
--

DROP TABLE IF EXISTS `nilaiwawancarapendaftar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nilaiwawancarapendaftar` (
  `idWawancara` int(11) DEFAULT NULL,
  `nilaiWawancara` decimal(5,2) DEFAULT NULL,
  KEY `idWawancara` (`idWawancara`),
  CONSTRAINT `nilaiwawancarapendaftar_ibfk_1` FOREIGN KEY (`idWawancara`) REFERENCES `wawancara` (`idWawancara`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nilaiwawancarapendaftar`
--

LOCK TABLES `nilaiwawancarapendaftar` WRITE;
/*!40000 ALTER TABLE `nilaiwawancarapendaftar` DISABLE KEYS */;
INSERT INTO `nilaiwawancarapendaftar` (`idWawancara`, `nilaiWawancara`) VALUES (1,86.91),
(2,60.84),
(3,296.91),
(4,185.19),
(5,188.27),
(6,125.40),
(7,230.76),
(8,228.63),
(9,200.73),
(10,280.96),
(11,7.25),
(12,128.75),
(13,297.14),
(14,355.02),
(15,337.69),
(16,165.51),
(17,208.38),
(18,381.03),
(19,88.59),
(20,288.17),
(21,295.12),
(22,254.52),
(23,315.69),
(24,88.31),
(25,81.63),
(26,248.60),
(27,396.28),
(28,22.12),
(29,35.82),
(30,154.04),
(31,107.64),
(32,102.49),
(33,222.37),
(34,281.66),
(35,269.87),
(36,338.26),
(37,26.61),
(38,218.49),
(39,334.84),
(40,291.18),
(41,305.09),
(42,220.16),
(43,250.10),
(44,290.10),
(45,271.09),
(46,213.34),
(47,31.60),
(48,287.16),
(49,172.25),
(50,39.82),
(51,280.73),
(52,3.58),
(53,17.70),
(54,216.45),
(55,148.78),
(56,197.28),
(57,98.29),
(58,111.82),
(59,125.80),
(60,212.17);
/*!40000 ALTER TABLE `nilaiwawancarapendaftar` ENABLE KEYS */;
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
-- Table structure for table `tespendaftar`
--

DROP TABLE IF EXISTS `tespendaftar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tespendaftar` (
  `idMahasiswa` int(11) NOT NULL,
  `idWawancara` int(11) DEFAULT NULL,
  `idPsikotest` int(11) DEFAULT NULL,
  `idTesKesehatan` int(11) DEFAULT NULL,
  PRIMARY KEY (`idMahasiswa`),
  UNIQUE KEY `unique_selections` (`idMahasiswa`,`idWawancara`,`idTesKesehatan`),
  KEY `idPsikotest` (`idPsikotest`),
  KEY `idTesKesehatan` (`idTesKesehatan`),
  CONSTRAINT `tespendaftar_ibfk_1` FOREIGN KEY (`idMahasiswa`) REFERENCES `infopendaftar` (`idMahasiswa`),
  CONSTRAINT `tespendaftar_ibfk_2` FOREIGN KEY (`idPsikotest`) REFERENCES `nilaipsikotestpendaftar` (`idPsikotest`),
  CONSTRAINT `tespendaftar_ibfk_3` FOREIGN KEY (`idTesKesehatan`) REFERENCES `nilaiteskesehatanpendaftar` (`idTesKesehatan`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`idWawancara` is not null and `idPsikotest` is not null or `idPsikotest` is null),
  CONSTRAINT `CONSTRAINT_2` CHECK (`idTesKesehatan` is not null and `idPsikotest` is not null or `idTesKesehatan` is null),
  CONSTRAINT `cek_maksimal_seleksi` CHECK (case when `idWawancara` is not null then 1 else 0 end + case when `idPsikotest` is not null then 1 else 0 end + case when `idTesKesehatan` is not null then 1 else 0 end <= 3)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tespendaftar`
--

LOCK TABLES `tespendaftar` WRITE;
/*!40000 ALTER TABLE `tespendaftar` DISABLE KEYS */;
INSERT INTO `tespendaftar` (`idMahasiswa`, `idWawancara`, `idPsikotest`, `idTesKesehatan`) VALUES (1,1,NULL,NULL),
(2,NULL,NULL,NULL),
(3,2,NULL,NULL),
(4,NULL,NULL,NULL),
(5,3,62,68),
(6,4,62,NULL),
(7,5,62,64),
(8,6,NULL,NULL),
(9,7,62,NULL),
(10,8,62,72),
(11,NULL,NULL,NULL),
(12,9,62,73),
(13,10,61,74),
(14,11,NULL,NULL),
(15,NULL,NULL,NULL),
(16,12,NULL,NULL),
(17,13,62,66),
(18,14,61,NULL),
(19,15,61,NULL),
(20,16,61,NULL),
(21,NULL,NULL,NULL),
(22,NULL,NULL,NULL),
(23,17,61,82),
(24,18,62,NULL),
(25,NULL,NULL,NULL),
(26,NULL,NULL,NULL),
(27,19,NULL,NULL),
(28,20,62,63),
(29,NULL,NULL,NULL),
(30,21,61,79),
(31,NULL,NULL,NULL),
(32,22,61,NULL),
(33,23,61,NULL),
(34,24,NULL,NULL),
(35,NULL,NULL,NULL),
(36,25,NULL,NULL),
(37,26,61,NULL),
(38,27,61,NULL),
(39,NULL,NULL,NULL),
(40,28,NULL,NULL),
(41,29,NULL,NULL),
(42,NULL,NULL,NULL),
(43,30,61,67),
(44,31,NULL,NULL),
(45,NULL,NULL,NULL),
(46,NULL,NULL,NULL),
(47,NULL,NULL,NULL),
(48,NULL,NULL,NULL),
(49,NULL,NULL,NULL),
(50,32,NULL,NULL),
(51,NULL,NULL,NULL),
(52,NULL,NULL,NULL),
(53,NULL,NULL,NULL),
(54,NULL,NULL,NULL),
(55,33,62,NULL),
(56,NULL,NULL,NULL),
(57,NULL,NULL,NULL),
(58,NULL,NULL,NULL),
(59,34,62,76),
(60,NULL,NULL,NULL),
(61,35,62,NULL),
(62,NULL,NULL,NULL),
(63,36,62,NULL),
(64,37,NULL,NULL),
(65,38,62,NULL),
(66,NULL,NULL,NULL),
(67,39,61,NULL),
(68,NULL,NULL,NULL),
(69,40,61,NULL),
(70,41,61,NULL),
(71,NULL,NULL,NULL),
(72,NULL,NULL,NULL),
(73,42,62,75),
(74,NULL,NULL,NULL),
(75,NULL,NULL,NULL),
(76,43,61,NULL),
(77,NULL,NULL,NULL),
(78,NULL,NULL,NULL),
(79,NULL,NULL,NULL),
(80,NULL,NULL,NULL),
(81,44,61,NULL),
(82,45,62,81),
(83,NULL,NULL,NULL),
(84,46,61,65),
(85,NULL,NULL,NULL),
(86,47,NULL,NULL),
(87,48,61,70),
(88,49,62,80),
(89,50,NULL,NULL),
(90,51,62,78),
(91,NULL,NULL,NULL),
(92,52,NULL,NULL),
(93,53,NULL,NULL),
(94,54,61,77),
(95,55,61,69),
(96,56,61,71),
(97,57,NULL,NULL),
(98,58,NULL,NULL),
(99,59,NULL,NULL),
(100,60,62,NULL),
(101,NULL,NULL,NULL),
(102,NULL,NULL,NULL),
(103,NULL,NULL,NULL),
(104,NULL,NULL,NULL),
(105,NULL,NULL,NULL),
(106,NULL,NULL,NULL),
(107,NULL,NULL,NULL),
(108,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tespendaftar` ENABLE KEYS */;
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

-- Dump completed on 2023-05-05 22:26:21
