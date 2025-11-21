-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 21, 2025 at 06:23 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fp_spk_rfox`
--

-- --------------------------------------------------------

--
-- Table structure for table `ahp_data`
--

CREATE TABLE `ahp_data` (
  `id` int(11) NOT NULL,
  `matrix` text NOT NULL,
  `normalized_matrix` text NOT NULL,
  `weights` text NOT NULL,
  `cr` float NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ahp_data`
--

INSERT INTO `ahp_data` (`id`, `matrix`, `normalized_matrix`, `weights`, `cr`, `created_at`) VALUES
(40, '[[1,\"3\",\"4\"],[0.3333333333333333,1,\"3\"],[0.25,0.3333333333333333,1]]', '[[0.6315789473684211,0.6923076923076924,0.5],[0.21052631578947367,0.23076923076923078,0.375],[0.15789473684210528,0.07692307692307693,0.125],[0.6315789473684211,0.6923076923076924,0.5],[0.21052631578947367,0.23076923076923078,0.375],[0.15789473684210528,0.07692307692307693,0.125]]', '[0.6079622132253711,0.27209851551956815,-0.11993927125506072]', 0.0639086, '2025-11-21 06:06:36');

-- --------------------------------------------------------

--
-- Table structure for table `alternatif`
--

CREATE TABLE `alternatif` (
  `id_alternatif` int(11) NOT NULL,
  `nama_universitas` varchar(255) NOT NULL,
  `akreditasi` int(11) NOT NULL,
  `fasilitas` int(11) NOT NULL,
  `biaya_perkuliahan` int(11) NOT NULL,
  `s_value` float DEFAULT NULL,
  `v_value` float DEFAULT NULL,
  `ranking` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `alternatif`
--

INSERT INTO `alternatif` (`id_alternatif`, `nama_universitas`, `akreditasi`, `fasilitas`, `biaya_perkuliahan`, `s_value`, `v_value`, `ranking`) VALUES
(1, 'Universitas Indonesia', 4, 5, 20000000, 0.479224, 0.102884, 4),
(2, 'Institut Teknologi Bandung', 4, 5, 12500000, 0.507014, 0.10885, 3),
(3, 'Universitas Padjadjaran', 4, 4, 18000000, 0.456728, 0.098054, 6),
(4, 'Universitas Brawijaya', 4, 4, 33739000, 0.423575, 0.0909366, 9),
(5, 'Universitas Gadjah Mada', 4, 5, 24700000, 0.467244, 0.100312, 5),
(6, 'Universitas Airlangga', 4, 4, 25000000, 0.439082, 0.0942657, 8),
(7, 'Institut Teknologi Sepuluh Nopember', 4, 5, 12500000, 0.507014, 0.10885, 2),
(8, 'Universitas Bina Nusantara', 4, 3, 22400000, 0.411406, 0.0883239, 10),
(9, 'Universitas Diponegoro', 4, 4, 22000000, 0.445866, 0.0957222, 7),
(10, 'Institut Pertanian Bogor', 4, 5, 10000000, 0.520767, 0.111802, 1);

-- --------------------------------------------------------

--
-- Table structure for table `importance_scale`
--

CREATE TABLE `importance_scale` (
  `id` int(11) NOT NULL,
  `scale_value` int(11) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `kriteria`
--

CREATE TABLE `kriteria` (
  `id_kriteria` int(11) NOT NULL,
  `jenis_kriteria` varchar(52) NOT NULL,
  `nama_kriteria` varchar(100) NOT NULL,
  `bobot` int(52) NOT NULL,
  `modified_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kriteria`
--

INSERT INTO `kriteria` (`id_kriteria`, `jenis_kriteria`, `nama_kriteria`, `bobot`, `modified_date`) VALUES
(1, 'Cost', 'Akreditasi', 1, '2024-12-16 16:09:09'),
(2, 'Cost', 'Fasilitas', 0, '2024-12-16 16:09:09'),
(3, 'Benefit', 'Biaya Perkuliahan', 0, '2024-12-16 16:09:09');

-- --------------------------------------------------------

--
-- Table structure for table `sub_kriteria`
--

CREATE TABLE `sub_kriteria` (
  `id_sub_kriteria` int(11) NOT NULL,
  `nilai_sub_kriteria` int(11) NOT NULL,
  `nama_sub_kriteria` varchar(100) DEFAULT NULL,
  `id_kriteria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sub_kriteria`
--

INSERT INTO `sub_kriteria` (`id_sub_kriteria`, `nilai_sub_kriteria`, `nama_sub_kriteria`, `id_kriteria`) VALUES
(1, 4, 'Akreditasi Unggul/A', 1),
(2, 3, 'Akreditasi Baik Sekali/B', 1),
(3, 2, 'Akreditasi Baik/C', 1),
(4, 1, 'Tidak Terakreditasi', 1),
(5, 5, 'Sangat Lengkap', 2),
(6, 4, 'Lengkap', 2),
(7, 3, 'Cukup Lengkap', 2),
(8, 2, 'Kurang Lengkap', 2),
(9, 1, 'Sangat Tidak Lengkap', 2),
(10, 1, 'Nilai Max UKT Termahal', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ahp_data`
--
ALTER TABLE `ahp_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `alternatif`
--
ALTER TABLE `alternatif`
  ADD PRIMARY KEY (`id_alternatif`);

--
-- Indexes for table `importance_scale`
--
ALTER TABLE `importance_scale`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kriteria`
--
ALTER TABLE `kriteria`
  ADD PRIMARY KEY (`id_kriteria`);

--
-- Indexes for table `sub_kriteria`
--
ALTER TABLE `sub_kriteria`
  ADD PRIMARY KEY (`id_sub_kriteria`),
  ADD KEY `id_kriteria` (`id_kriteria`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ahp_data`
--
ALTER TABLE `ahp_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `alternatif`
--
ALTER TABLE `alternatif`
  MODIFY `id_alternatif` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `importance_scale`
--
ALTER TABLE `importance_scale`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kriteria`
--
ALTER TABLE `kriteria`
  MODIFY `id_kriteria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sub_kriteria`
--
ALTER TABLE `sub_kriteria`
  MODIFY `id_sub_kriteria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `sub_kriteria`
--
ALTER TABLE `sub_kriteria`
  ADD CONSTRAINT `sub_kriteria_ibfk_1` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id_kriteria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
