-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 13 mars 2023 à 15:07
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `weather`
--

-- --------------------------------------------------------

--
-- Structure de la table `weather_data`
--

DROP TABLE IF EXISTS `weather_data`;
CREATE TABLE IF NOT EXISTS `weather_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `temperature` decimal(10,0) DEFAULT NULL,
  `humidity` decimal(10,0) DEFAULT NULL,
  `valid_from` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `valid_to` datetime(6) NOT NULL DEFAULT '9999-12-31 23:59:59.999999',
  PRIMARY KEY (`id`),
  KEY `idx_valid` (`valid_from`,`valid_to`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `weather_data`
--

INSERT INTO `weather_data` (`id`, `date`, `temperature`, `humidity`, `valid_from`, `valid_to`) VALUES
(1, '2023-03-01', '13', '60', '2023-03-01 00:00:00.000000', '2023-03-01 23:59:59.999999'),
(2, '2023-03-01', '14', '60', '2023-03-01 12:00:00.000000', '2023-03-01 23:59:59.999999'),
(3, '2023-03-13', '14', '60', '2023-03-01 12:00:00.000000', '2023-03-01 23:59:59.999999');

-- --------------------------------------------------------

--
-- Structure de la table `weather_snapshot`
--

DROP TABLE IF EXISTS `weather_snapshot`;
CREATE TABLE IF NOT EXISTS `weather_snapshot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `temperature` decimal(10,0) DEFAULT NULL,
  `humidity` decimal(10,0) DEFAULT NULL,
  `timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `valid_from` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `valid_to` datetime(6) NOT NULL DEFAULT '9999-12-31 23:59:59.999999',
  PRIMARY KEY (`id`),
  KEY `idx_valid` (`valid_from`,`valid_to`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `weather_snapshot`
--

INSERT INTO `weather_snapshot` (`id`, `date`, `temperature`, `humidity`, `timestamp`, `valid_from`, `valid_to`) VALUES
(1, '2023-03-13', '14', '60', '2023-03-13 16:05:16', '2023-03-13 16:05:16.708123', '9999-12-31 23:59:59.999999');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
