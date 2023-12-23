-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 17, 2023 at 02:37 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sistem_kehadiran_safwan`
--

-- --------------------------------------------------------

--
-- Table structure for table `ahli`
--

CREATE TABLE `ahli` (
  `noKP` char(12) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `kataLaluan` char(10) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `noTel` char(10) DEFAULT NULL,
  `idKelas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ahli`
--

INSERT INTO `ahli` (`noKP`, `nama`, `kataLaluan`, `email`, `noTel`, `idKelas`) VALUES
('111111071111', 'Nabilah', 'abcd1234', 'nabilah@gmail.com', '0111234567', 1),
('222222072222', 'Saadah', 'abcd1234', 'saadah@gmail.com', '0121234567', 1),
('333333073333', 'Athiyyah', 'abcd1234', 'athiyyah@gmail.com', '0131234567', 3),
('444444074444', 'Maisarah', 'abcd1234', 'maisarah@gmail.com', '0141234567', 5),
('555555075555', 'Siti Noor', 'abcd1234', 'siti@gmail.com', '0151234567', 8);

-- --------------------------------------------------------

--
-- Table structure for table `aktiviti`
--

CREATE TABLE `aktiviti` (
  `idAktiviti` int(11) NOT NULL,
  `namaAktiviti` varchar(255) NOT NULL,
  `tempat` varchar(255) DEFAULT NULL,
  `tarikh` date DEFAULT NULL,
  `masaMula` time DEFAULT NULL,
  `masaAkhir` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `aktiviti`
--

INSERT INTO `aktiviti` (`idAktiviti`, `namaAktiviti`, `tempat`, `tarikh`, `masaMula`, `masaAkhir`) VALUES
(1, 'Latihan Rumah Sukan 1', 'Padang Rekreasi', '2024-01-02', '07:30:00', '09:00:00'),
(2, 'Latihan Rumah Sukan 2', 'Padang Perdana', '2024-01-09', '07:30:00', '09:00:00'),
(3, 'Latihan Rumah Sukan 3', 'Padang Rekreasi', '2024-01-16', '07:30:00', '09:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `kehadiran`
--

CREATE TABLE `kehadiran` (
  `idKehadiran` int(11) NOT NULL,
  `noKP` char(12) NOT NULL,
  `idAktiviti` int(11) NOT NULL,
  `status` char(1) DEFAULT 'T'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kehadiran`
--

INSERT INTO `kehadiran` (`idKehadiran`, `noKP`, `idAktiviti`, `status`) VALUES
(1, '111111071111', 1, 'T'),
(2, '222222072222', 1, 'T'),
(3, '333333073333', 1, 'T'),
(4, '444444074444', 1, 'T'),
(5, '555555075555', 1, 'T'),
(6, '111111071111', 2, 'T'),
(7, '222222072222', 2, 'T'),
(8, '333333073333', 2, 'T'),
(9, '444444074444', 2, 'T'),
(10, '555555075555', 2, 'T'),
(11, '111111071111', 3, 'T'),
(12, '222222072222', 3, 'T'),
(13, '333333073333', 3, 'T'),
(14, '444444074444', 3, 'T'),
(15, '555555075555', 3, 'T');

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `idKelas` int(11) NOT NULL,
  `tingkatan` int(11) NOT NULL,
  `namaKelas` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`idKelas`, `tingkatan`, `namaKelas`) VALUES
(1, 1, 'Akik'),
(2, 1, 'Delima'),
(3, 1, 'Intan'),
(4, 2, 'Akik'),
(5, 2, 'Delima'),
(6, 2, 'Intan'),
(7, 3, 'Akik'),
(8, 3, 'Delima'),
(9, 3, 'Intan');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ahli`
--
ALTER TABLE `ahli`
  ADD PRIMARY KEY (`noKP`),
  ADD KEY `fk_ahli_kelas` (`idKelas`);

--
-- Indexes for table `aktiviti`
--
ALTER TABLE `aktiviti`
  ADD PRIMARY KEY (`idAktiviti`);

--
-- Indexes for table `kehadiran`
--
ALTER TABLE `kehadiran`
  ADD PRIMARY KEY (`idKehadiran`),
  ADD KEY `fk_kehadiran_ahli` (`noKP`),
  ADD KEY `fk_kehadiran_aktiviti` (`idAktiviti`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`idKelas`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aktiviti`
--
ALTER TABLE `aktiviti`
  MODIFY `idAktiviti` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kehadiran`
--
ALTER TABLE `kehadiran`
  MODIFY `idKehadiran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
  MODIFY `idKelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ahli`
--
ALTER TABLE `ahli`
  ADD CONSTRAINT `fk_ahli_kelas` FOREIGN KEY (`idKelas`) REFERENCES `kelas` (`idKelas`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `kehadiran`
--
ALTER TABLE `kehadiran`
  ADD CONSTRAINT `fk_kehadiran_ahli` FOREIGN KEY (`noKP`) REFERENCES `ahli` (`noKP`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_kehadiran_aktiviti` FOREIGN KEY (`idAktiviti`) REFERENCES `aktiviti` (`idAktiviti`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
