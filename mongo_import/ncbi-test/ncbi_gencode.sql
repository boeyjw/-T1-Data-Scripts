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
-- Table structure for table `ncbi_gencode`
--

CREATE TABLE `ncbi_gencode` (
  `genetic_code_id` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `abbreviation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cde` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `starts` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ncbi_gencode`
--

INSERT INTO `ncbi_gencode` (`genetic_code_id`, `abbreviation`, `name`, `cde`, `starts`) VALUES
(0, NULL, 'Unspecified', '                                                                 ', '                                                                 '),
(1, NULL, 'Standard', 'FFLLSSSSYY**CC*WLLLLPPPPHHQQRRRRIIIMTTTTNNKKSSRRVVVVAAAADDEEGGGG ', '---M------**--*----M---------------M---------------------------- '),
(2, NULL, 'Vertebrate Mitochondrial', 'FFLLSSSSYY**CCWWLLLLPPPPHHQQRRRRIIMMTTTTNNKKSS**VVVVAAAADDEEGGGG ', '----------**--------------------MMMM----------**---M------------ '),
(3, NULL, 'Yeast Mitochondrial', 'FFLLSSSSYY**CCWWTTTTPPPPHHQQRRRRIIMMTTTTNNKKSSRRVVVVAAAADDEEGGGG ', '----------**----------------------MM---------------------------- '),
(4, NULL, 'Mold Mitochondrial; Protozoan Mitochondrial; Coelenterate Mitochondrial; Mycoplasma; Spiroplasma', 'FFLLSSSSYY**CCWWLLLLPPPPHHQQRRRRIIIMTTTTNNKKSSRRVVVVAAAADDEEGGGG ', '--MM------**-------M------------MMMM---------------M------------ '),
(5, NULL, 'Invertebrate Mitochondrial', 'FFLLSSSSYY**CCWWLLLLPPPPHHQQRRRRIIMMTTTTNNKKSSSSVVVVAAAADDEEGGGG ', '---M------**--------------------MMMM---------------M------------ '),
(6, NULL, 'Ciliate Nuclear; Dasycladacean Nuclear; Hexamita Nuclear', 'FFLLSSSSYYQQCC*WLLLLPPPPHHQQRRRRIIIMTTTTNNKKSSRRVVVVAAAADDEEGGGG ', '--------------*--------------------M---------------------------- '),
(9, NULL, 'Echinoderm Mitochondrial; Flatworm Mitochondrial', 'FFLLSSSSYY**CCWWLLLLPPPPHHQQRRRRIIIMTTTTNNNKSSSSVVVVAAAADDEEGGGG ', '----------**-----------------------M---------------M------------ '),
(10, NULL, 'Euplotid Nuclear', 'FFLLSSSSYY**CCCWLLLLPPPPHHQQRRRRIIIMTTTTNNKKSSRRVVVVAAAADDEEGGGG ', '----------**-----------------------M---------------------------- '),
(11, NULL, 'Bacterial, Archaeal and Plant Plastid', 'FFLLSSSSYY**CC*WLLLLPPPPHHQQRRRRIIIMTTTTNNKKSSRRVVVVAAAADDEEGGGG ', '---M------**--*----M------------MMMM---------------M------------ '),
(12, NULL, 'Alternative Yeast Nuclear', 'FFLLSSSSYY**CC*WLLLSPPPPHHQQRRRRIIIMTTTTNNKKSSRRVVVVAAAADDEEGGGG ', '----------**--*----M---------------M---------------------------- '),
(13, NULL, 'Ascidian Mitochondrial', 'FFLLSSSSYY**CCWWLLLLPPPPHHQQRRRRIIMMTTTTNNKKSSGGVVVVAAAADDEEGGGG ', '---M------**----------------------MM---------------M------------ '),
(14, NULL, 'Alternative Flatworm Mitochondrial', 'FFLLSSSSYYY*CCWWLLLLPPPPHHQQRRRRIIIMTTTTNNNKSSSSVVVVAAAADDEEGGGG ', '-----------*-----------------------M---------------------------- '),
(15, NULL, 'Blepharisma Macronuclear', 'FFLLSSSSYY*QCC*WLLLLPPPPHHQQRRRRIIIMTTTTNNKKSSRRVVVVAAAADDEEGGGG ', '----------*---*--------------------M---------------------------- '),
(16, NULL, 'Chlorophycean Mitochondrial', 'FFLLSSSSYY*LCC*WLLLLPPPPHHQQRRRRIIIMTTTTNNKKSSRRVVVVAAAADDEEGGGG ', '----------*---*--------------------M---------------------------- '),
(21, NULL, 'Trematode Mitochondrial', 'FFLLSSSSYY**CCWWLLLLPPPPHHQQRRRRIIMMTTTTNNNKSSSSVVVVAAAADDEEGGGG ', '----------**-----------------------M---------------M------------ '),
(22, NULL, 'Scenedesmus obliquus mitochondrial', 'FFLLSS*SYY*LCC*WLLLLPPPPHHQQRRRRIIIMTTTTNNKKSSRRVVVVAAAADDEEGGGG ', '------*---*---*--------------------M---------------------------- '),
(23, NULL, 'Thraustochytrium mitochondrial code', 'FF*LSSSSYY**CC*WLLLLPPPPHHQQRRRRIIIMTTTTNNKKSSRRVVVVAAAADDEEGGGG ', '--*-------**--*-----------------M--M---------------M------------ '),
(24, NULL, 'Pterobranchia Mitochondrial', 'FFLLSSSSYY**CCWWLLLLPPPPHHQQRRRRIIIMTTTTNNKKSSSKVVVVAAAADDEEGGGG ', '---M------**-------M---------------M---------------M------------ '),
(25, NULL, 'Candidate Division SR1 and Gracilibacteria', 'FFLLSSSSYY**CCGWLLLLPPPPHHQQRRRRIIIMTTTTNNKKSSRRVVVVAAAADDEEGGGG ', '---M------**-----------------------M---------------M------------ '),
(26, NULL, 'Pachysolen tannophilus Nuclear', 'FFLLSSSSYY**CC*WLLLAPPPPHHQQRRRRIIIMTTTTNNKKSSRRVVVVAAAADDEEGGGG ', '----------**--*----M---------------M---------------------------- '),
(27, NULL, 'Karyorelict Nuclear', 'FFLLSSSSYYQQCCWWLLLAPPPPHHQQRRRRIIIMTTTTNNKKSSRRVVVVAAAADDEEGGGG ', '--------------*--------------------M---------------------------- '),
(28, NULL, 'Condylostoma Nuclear', 'FFLLSSSSYYQQCCWWLLLAPPPPHHQQRRRRIIIMTTTTNNKKSSRRVVVVAAAADDEEGGGG ', '----------**--*--------------------M---------------------------- '),
(29, NULL, 'Mesodinium Nuclear', 'FFLLSSSSYYYYCC*WLLLAPPPPHHQQRRRRIIIMTTTTNNKKSSRRVVVVAAAADDEEGGGG ', '--------------*--------------------M---------------------------- '),
(30, NULL, 'Peritrich Nuclear', 'FFLLSSSSYYEECC*WLLLAPPPPHHQQRRRRIIIMTTTTNNKKSSRRVVVVAAAADDEEGGGG ', '--------------*--------------------M---------------------------- '),
(31, NULL, 'Blastocrithidia Nuclear', 'FFLLSSSSYYEECCWWLLLLPPPPHHQQRRRRIIIMTTTTNNKKSSRRVVVVAAAADDEEGGGG ', '----------**-----------------------M---------------------------- ');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ncbi_gencode`
--
ALTER TABLE `ncbi_gencode`
  ADD PRIMARY KEY (`genetic_code_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
