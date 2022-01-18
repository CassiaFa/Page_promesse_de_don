-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8081
-- Generation Time: Jan 18, 2022 at 09:49 PM
-- Server version: 5.7.24
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `promesse_don`
--

-- --------------------------------------------------------

--
-- Table structure for table `adresses`
--

CREATE TABLE `adresses` (
  `id_adresse` int(11) NOT NULL,
  `voie_adresse` varchar(200) NOT NULL DEFAULT 'Non renseigné',
  `complement_adresse` varchar(200) NOT NULL DEFAULT 'Non renseigné',
  `cp_adresse` int(11) NOT NULL,
  `ville_adresse` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ddates`
--

CREATE TABLE `ddates` (
  `date_ddate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `donnateurs`
--

CREATE TABLE `donnateurs` (
  `id_donnateur` int(11) NOT NULL,
  `genre_donnateur` varchar(10) NOT NULL,
  `nom_donnateur` varchar(50) NOT NULL,
  `mail_donnateur` varchar(50) NOT NULL,
  `id_adresse` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dons`
--

CREATE TABLE `dons` (
  `id_don` int(11) NOT NULL,
  `date_ddate` datetime NOT NULL,
  `id_donnateur` int(11) NOT NULL,
  `valeur_don` int(11) NOT NULL,
  `reglement_don` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `libelles`
--

CREATE TABLE `libelles` (
  `id_libelle` int(11) NOT NULL,
  `nom_libelle` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `libelles`
--

INSERT INTO `libelles` (`id_libelle`, `nom_libelle`) VALUES
(1, 'Administrateur'),
(2, 'Visiteur');

-- --------------------------------------------------------

--
-- Table structure for table `utilisateurs`
--

CREATE TABLE `utilisateurs` (
  `id_utilisateur` int(11) NOT NULL,
  `login_utilisateur` varchar(30) NOT NULL,
  `mdp_utilisateur` varchar(50) NOT NULL,
  `id_libelle` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `utilisateurs`
--

INSERT INTO `utilisateurs` (`id_utilisateur`, `login_utilisateur`, `mdp_utilisateur`, `id_libelle`) VALUES
(1, 'admin', 'C@chalotBest', 1),
(2, 'toto', '12345', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adresses`
--
ALTER TABLE `adresses`
  ADD PRIMARY KEY (`id_adresse`);

--
-- Indexes for table `ddates`
--
ALTER TABLE `ddates`
  ADD PRIMARY KEY (`date_ddate`);

--
-- Indexes for table `donnateurs`
--
ALTER TABLE `donnateurs`
  ADD PRIMARY KEY (`id_donnateur`),
  ADD KEY `fk_donnateurs_adresses` (`id_adresse`);

--
-- Indexes for table `dons`
--
ALTER TABLE `dons`
  ADD PRIMARY KEY (`id_don`),
  ADD KEY `fk_dons_donnateurs` (`id_donnateur`),
  ADD KEY `fk_dons_ddates` (`date_ddate`);

--
-- Indexes for table `libelles`
--
ALTER TABLE `libelles`
  ADD PRIMARY KEY (`id_libelle`);

--
-- Indexes for table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD PRIMARY KEY (`id_utilisateur`),
  ADD KEY `fk_user_libelle` (`id_libelle`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adresses`
--
ALTER TABLE `adresses`
  MODIFY `id_adresse` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `donnateurs`
--
ALTER TABLE `donnateurs`
  MODIFY `id_donnateur` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dons`
--
ALTER TABLE `dons`
  MODIFY `id_don` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `libelles`
--
ALTER TABLE `libelles`
  MODIFY `id_libelle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  MODIFY `id_utilisateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `donnateurs`
--
ALTER TABLE `donnateurs`
  ADD CONSTRAINT `fk_donnateurs_adresses` FOREIGN KEY (`id_adresse`) REFERENCES `adresses` (`id_adresse`);

--
-- Constraints for table `dons`
--
ALTER TABLE `dons`
  ADD CONSTRAINT `fk_dons_ddates` FOREIGN KEY (`date_ddate`) REFERENCES `ddates` (`date_ddate`),
  ADD CONSTRAINT `fk_dons_donnateurs` FOREIGN KEY (`id_donnateur`) REFERENCES `donnateurs` (`id_donnateur`);

--
-- Constraints for table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD CONSTRAINT `fk_user_libelle` FOREIGN KEY (`id_libelle`) REFERENCES `libelles` (`id_libelle`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
