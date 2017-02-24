-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 16, 2017 at 09:17 AM
-- Server version: 5.7.17-0ubuntu0.16.04.1
-- PHP Version: 7.0.13-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `NCBI`
--

-- --------------------------------------------------------

--
-- Table structure for table `ncbi_division`
--

CREATE TABLE `ncbi_division` (
  `division_id` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `division_cde` char(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `division_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comments` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ncbi_division`
--

INSERT INTO `ncbi_division` (`division_id`, `division_cde`, `division_name`, `comments`) VALUES
(0, 'BCT', 'Bacteria', NULL),
(1, 'INV', 'Invertebrates', NULL),
(2, 'MAM', 'Mammals', NULL),
(3, 'PHG', 'Phages', NULL),
(4, 'PLN', 'Plants and Fungi', NULL),
(5, 'PRI', 'Primates', NULL),
(6, 'ROD', 'Rodents', NULL),
(7, 'SYN', 'Synthetic and Chimeric', NULL),
(8, 'UNA', 'Unassigned', 'No species nodes should inherit this division assignment'),
(9, 'VRL', 'Viruses', NULL),
(10, 'VRT', 'Vertebrates', NULL),
(11, 'ENV', 'Environmental samples', 'Anonymous sequences cloned directly from the environment');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ncbi_division`
--
ALTER TABLE `ncbi_division`
  ADD PRIMARY KEY (`division_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
