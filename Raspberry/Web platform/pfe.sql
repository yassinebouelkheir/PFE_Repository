-- phpMyAdmin SQL Dump
-- version 5.0.4deb2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : jeu. 05 mai 2022 à 22:42
-- Version du serveur :  10.5.15-MariaDB-0+deb11u1
-- Version de PHP : 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `PFE`
--

-- --------------------------------------------------------

--
-- Structure de la table `ACCOUNTS`
--

CREATE TABLE `ACCOUNTS` (
  `ID` int(11) NOT NULL,
  `USERNAME` varchar(50) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `P1` int(11) NOT NULL DEFAULT 0,
  `P2` int(11) NOT NULL DEFAULT 0,
  `P3` int(11) NOT NULL DEFAULT 0,
  `P4` int(11) NOT NULL DEFAULT 0,
  `P5` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `ACCOUNTS`
--

INSERT INTO `ACCOUNTS` (`ID`, `USERNAME`, `PASSWORD`, `P1`, `P2`, `P3`, `P4`, `P5`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `CHARGES`
--

CREATE TABLE `CHARGES` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(24) NOT NULL,
  `VALUE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `CHARGES`
--

INSERT INTO `CHARGES` (`ID`, `NAME`, `VALUE`) VALUES
(1, 'Charge 1', 0),
(2, 'Charge 2', 0),
(3, 'Charge 3', 0),
(4, 'Charge 4', 0),
(5, 'Charge 5', 0),
(6, 'Charge 6', 0),
(7, 'Charge 7', 0),
(8, 'Charge 8', 0);

-- --------------------------------------------------------

--
-- Structure de la table `HISTORY`
--

CREATE TABLE `HISTORY` (
  `ID` int(11) NOT NULL,
  `UNIXDATE` timestamp NOT NULL DEFAULT current_timestamp(),
  `USERNAME` varchar(24) NOT NULL,
  `IP` varchar(15) NOT NULL,
  `ISP` varchar(24) DEFAULT NULL,
  `TYPE` int(11) NOT NULL DEFAULT 0,
  `VALUE` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `HISTORY`
--

INSERT INTO `HISTORY` (`ID`, `UNIXDATE`, `USERNAME`, `IP`, `ISP`, `TYPE`, `VALUE`) VALUES
(1, '2022-05-05 21:02:31', 'admin', '192.168.1.3', 'Local', 1, 'Test'),
(2, '2022-05-05 21:07:20', 'admin', '192.168.1.3', 'Local', 0, 'Local'),
(3, '2022-05-05 21:24:52', 'admin', '192.168.1.3', 'Local', 0, 'Local'),
(4, '2022-05-05 22:36:48', 'admin', '192.168.1.3', NULL, 1, 'Mettre à jour l état de charge ID IN1 à 1'),
(5, '2022-05-05 22:36:50', 'admin', '192.168.1.3', NULL, 1, 'Mettre à jour l état de charge ID IN1 à 0');

-- --------------------------------------------------------

--
-- Structure de la table `SENSORS`
--

CREATE TABLE `SENSORS` (
  `ID` int(11) NOT NULL,
  `VALUE` float NOT NULL,
  `UNIXDATE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `SENSORS`
--

INSERT INTO `SENSORS` (`ID`, `VALUE`, `UNIXDATE`) VALUES
(1, 0, 1648582100),
(1, 0, 1648582220),
(1, 0, 1648582340),
(1, 0, 1648582460),
(1, 0, 1648582580),
(1, 0, 1648582700),
(1, 0, 1648582820),
(1, 0, 1648582940),
(1, 0, 1648583060),
(1, 0, 1648583180),
(2, 0, 1648582100),
(2, 0, 1648582220),
(2, 0, 1648582340),
(2, 0, 1648582460),
(2, 0, 1648582580),
(2, 0, 1648582700),
(2, 0, 1648582820),
(2, 0, 1648582940),
(2, 0, 1648583060),
(2, 0, 1648583180),
(3, 0, 1648582100),
(3, 0, 1648582220),
(3, 0, 1648582340),
(3, 0, 1648582460),
(3, 0, 1648582580),
(3, 0, 1648582700),
(3, 0, 1648582820),
(3, 0, 1648582940),
(3, 0, 1648583060),
(3, 0, 1648583180),
(4, 0, 1648582100),
(4, 0, 1648582220),
(4, 0, 1648582340),
(4, 0, 1648582460),
(4, 0, 1648582580),
(4, 0, 1648582700),
(4, 0, 1648582820),
(4, 0, 1648582940),
(4, 0, 1648583060),
(4, 0, 1648583180),
(5, 0, 1648582100),
(5, 0, 1648582220),
(5, 0, 1648582340),
(5, 0, 1648582460),
(5, 0, 1648582580),
(5, 0, 1648582700),
(5, 0, 1648582820),
(5, 0, 1648582940),
(5, 0, 1648583060),
(5, 0, 1648583180),
(6, 0, 1648582100),
(6, 0, 1648582220),
(6, 0, 1648582340),
(6, 0, 1648582460),
(6, 0, 1648582580),
(6, 0, 1648582700),
(6, 0, 1648582820),
(6, 0, 1648582940),
(6, 0, 1648583060),
(6, 0, 1648583180),
(7, 0, 1648582100),
(7, 0, 1648582220),
(7, 0, 1648582340),
(7, 0, 1648582460),
(7, 0, 1648582580),
(7, 0, 1648582700),
(7, 0, 1648582820),
(7, 0, 1648582940),
(7, 0, 1648583060),
(7, 0, 1648583180),
(8, 0, 1648582100),
(8, 0, 1648582220),
(8, 0, 1648582340),
(8, 0, 1648582460),
(8, 0, 1648582580),
(8, 0, 1648582700),
(8, 0, 1648582820),
(8, 0, 1648582940),
(8, 0, 1648583060),
(8, 0, 1648583180),
(9, 0, 1648582100),
(9, 0, 1648582220),
(9, 0, 1648582340),
(9, 0, 1648582460),
(9, 0, 1648582580),
(9, 0, 1648582700),
(9, 0, 1648582820),
(9, 0, 1648582940),
(9, 0, 1648583060),
(9, 0, 1648583180),
(10, 0, 1648582100),
(10, 0, 1648582220),
(10, 0, 1648582340),
(10, 0, 1648582460),
(10, 0, 1648582580),
(10, 0, 1648582700),
(10, 0, 1648582820),
(10, 0, 1648582940),
(10, 0, 1648583060),
(10, 0, 1648583180),
(11, 0, 1648582100),
(11, 0, 1648582220),
(11, 0, 1648582340),
(11, 0, 1648582460),
(11, 0, 1648582580),
(11, 0, 1648582700),
(11, 0, 1648582820),
(11, 0, 1648582940),
(11, 0, 1648583060),
(11, 0, 1648583180),
(12, 0, 1648582100),
(12, 0, 1648582220),
(12, 0, 1648582340),
(12, 0, 1648582460),
(12, 0, 1648582580),
(12, 0, 1648582700),
(12, 0, 1648582820),
(12, 0, 1648582940),
(12, 0, 1648583060),
(12, 0, 1648583180),
(13, 0, 1648582100),
(13, 0, 1648582220),
(13, 0, 1648582340),
(13, 0, 1648582460),
(13, 0, 1648582580),
(13, 0, 1648582700),
(13, 0, 1648582820),
(13, 0, 1648582940),
(13, 0, 1648583060),
(13, 0, 1648583180),
(9, 0, 1651671415),
(10, 0, 1651671503),
(7, 359, 1651671503),
(8, 684, 1651671503),
(6, 0, 1651671503),
(1, 0.06, 1651671504),
(4, 2.51, 1651671506),
(10, 0, 1651671539),
(5, 24, 1651671539),
(8, 683, 1651671539),
(7, 352, 1651671539),
(1, 0.06, 1651671540),
(4, 2.51, 1651671541),
(11, 0, 1651672050),
(5, 23.3, 1651672050),
(8, 696, 1651672050),
(3, 0.32, 1651672050),
(7, 355, 1651672051),
(2, 0, 1651672051),
(7, 357, 1651672108),
(10, 0, 1651672108),
(6, 0, 1651672108),
(2, 0, 1651672108),
(8, 682, 1651672109),
(3, 0.32, 1651672110),
(5, 24.1, 1651672407),
(11, 0, 1651672407),
(3, 0.31, 1651672407),
(7, 355, 1651672407),
(2, 0, 1651672407),
(8, 685, 1651672408),
(10, 0, 1651672557),
(8, 683, 1651672557),
(7, 354, 1651672557),
(6, 0, 1651672557),
(4, 2.51, 1651672558),
(1, 0.07, 1651672558),
(8, 671, 1651674847),
(11, 0, 1651674847),
(6, 0, 1651674847),
(7, 359, 1651674847),
(2, 0, 1651674848),
(3, 0.3, 1651674848),
(7, 352, 1651675220),
(9, 0, 1651675220),
(3, 0.3, 1651675220),
(5, 23.4, 1651675220),
(11, 0, 1651675220),
(6, 0, 1651675220),
(8, 670, 1651675220),
(10, 0, 1651675221),
(2, 0, 1651675221),
(4, 2.51, 1651675221),
(1, 0.07, 1651675222),
(9, 0, 1651675340),
(7, 349, 1651675340),
(5, 24.5, 1651675340),
(6, 0, 1651675340),
(8, 670, 1651675340),
(11, 0, 1651675341),
(3, 0.3, 1651675341),
(10, 0, 1651675342),
(4, 2.51, 1651675343),
(1, 0.07, 1651675344),
(2, 0.02, 1651675350),
(6, 0, 1651675460),
(8, 669, 1651675461),
(9, 0, 1651675461),
(7, 355, 1651675461),
(5, 25.1, 1651675461),
(11, 0, 1651675462),
(10, 0, 1651675462),
(3, 0.3, 1651675463),
(1, 0.07, 1651675466),
(4, 2.51, 1651675471),
(2, 0, 1651675473),
(3, 0.3, 1651676549),
(6, 0, 1651676549),
(10, 0, 1651676549),
(8, 666, 1651676549),
(5, 25, 1651676549),
(7, 343, 1651676549),
(1, 0.07, 1651676549),
(9, 0, 1651676549),
(11, 0, 1651676550),
(2, 0, 1651676552),
(4, 2.51, 1651676552),
(2, 0, 1651676597),
(10, 0, 1651676597),
(6, 0, 1651676597),
(8, 670, 1651676597),
(9, 0, 1651676597),
(11, 0, 1651676598),
(1, 0.07, 1651676598),
(7, 343, 1651676599),
(5, 24.6, 1651676599),
(3, 0.3, 1651676599),
(4, 2.51, 1651676601),
(6, 0, 1651676717),
(8, 670, 1651676717),
(10, 0, 1651676718),
(11, 0, 1651676718),
(2, 0, 1651676718),
(9, 0, 1651676718),
(7, 347, 1651676720),
(5, 24.6, 1651676720),
(1, 0.07, 1651676720),
(3, 0.3, 1651676721),
(4, 2.51, 1651676723),
(8, 669, 1651676838),
(10, 0, 1651676838),
(11, 0, 1651676838),
(6, 0, 1651676839),
(2, 0, 1651676839),
(9, 0, 1651676840),
(7, 340, 1651676840),
(5, 25.3, 1651676840),
(3, 0.3, 1651676842),
(1, 0.07, 1651676843),
(4, 2.51, 1651676845),
(10, 0, 1651676958),
(11, 0, 1651676958),
(6, 0, 1651676959),
(8, 664, 1651676960),
(9, 0, 1651676960),
(7, 343, 1651676960),
(5, 24.8, 1651676961),
(2, 0, 1651676962),
(4, 2.51, 1651676966),
(3, 0.3, 1651676968),
(1, 0.07, 1651676970),
(10, 0, 1651677078),
(11, 0, 1651677079),
(6, 0, 1651677079),
(9, 0, 1651677080),
(5, 24.6, 1651677081),
(8, 665, 1651677082),
(7, 351, 1651677082),
(2, 0, 1651677083),
(4, 2.51, 1651677088),
(3, 0.3, 1651677090),
(1, 0.07, 1651677093),
(10, 0, 1651677199),
(11, 0, 1651677199),
(6, 0, 1651677200),
(9, 0, 1651677201),
(8, 663, 1651677202),
(7, 346, 1651677203),
(2, 0, 1651677206),
(5, 24.6, 1651677206),
(3, 0.3, 1651677215),
(1, 0.07, 1651677216),
(4, 2.51, 1651677231),
(10, 0, 1651677319),
(11, 0, 1651677320),
(6, 0, 1651677321),
(9, 0, 1651677323),
(8, 665, 1651677323),
(7, 350, 1651677324),
(2, 0, 1651677326),
(5, 24, 1651677327),
(1, 0.07, 1651677336),
(3, 0.3, 1651677337),
(4, 2.51, 1651677354),
(10, 0, 1651677440),
(11, 0, 1651677441),
(6, 0, 1651677442),
(9, 0, 1651677443),
(8, 664, 1651677446),
(7, 351, 1651677446),
(5, 24.8, 1651677447),
(2, 0, 1651677448),
(3, 0.3, 1651677458),
(1, 0.07, 1651677462),
(4, 2.51, 1651677475),
(10, 0, 1651677561),
(11, 0, 1651677561),
(9, 0, 1651677564),
(8, 668, 1651677567),
(7, 338, 1651677567),
(6, 0, 1651677568),
(5, 24.6, 1651677568),
(2, 0, 1651677573),
(3, 0.3, 1651677579),
(1, 0.07, 1651677586),
(4, 2.51, 1651677603),
(10, 0, 1651677682),
(11, 0, 1651677682),
(9, 0, 1651677684),
(7, 820, 1651677687),
(6, 0, 1651677688),
(8, 663, 1651677689),
(5, 24.8, 1651677690),
(2, 0, 1651677693),
(1, 0.06, 1651677710),
(3, 0.3, 1651677723),
(4, 2.51, 1651677725),
(10, 0, 1651677802),
(11, 0, 1651677803),
(9, 0, 1651677805),
(7, 402, 1651677808),
(6, 0, 1651677809),
(5, 25.2, 1651677810),
(8, 616, 1651677811),
(2, 0, 1651677818),
(1, 0.07, 1651677841),
(3, 0.3, 1651677844),
(4, 2.51, 1651677854),
(10, 0, 1651677923),
(11, 0, 1651677924),
(9, 0, 1651677925),
(7, 412, 1651677928),
(6, 0, 1651677930),
(5, 24.3, 1651677931),
(8, 665, 1651677934),
(2, 0, 1651677938),
(1, 0.07, 1651677966),
(3, 0.3, 1651677966),
(4, 2.51, 1651677989),
(10, 0, 1651678043),
(11, 0, 1651678044),
(9, 0, 1651678046),
(7, 759, 1651678049),
(6, 0, 1651678051),
(5, 24.9, 1651678052),
(8, 663, 1651678056),
(2, 0, 1651678061),
(1, 0.07, 1651678086),
(3, 0.3, 1651678087),
(4, 2.51, 1651678116),
(10, 0, 1651678163),
(11, 0, 1651678165),
(9, 0, 1651678166),
(7, 405, 1651678169),
(6, 0, 1651678171),
(5, 24.4, 1651678173),
(8, 659, 1651678177),
(2, 0, 1651678188),
(3, 0.3, 1651678208),
(1, 0.07, 1651678208),
(4, 2.51, 1651678239),
(10, 0, 1651678284),
(11, 0, 1651678286),
(9, 0, 1651678286),
(7, 400, 1651678291),
(6, 0, 1651678292),
(5, 24.7, 1651678295),
(8, 658, 1651678297),
(2, 0, 1651678310),
(1, 0.07, 1651678334),
(3, 0.3, 1651678336),
(4, 2.51, 1651678367),
(10, 0, 1651678404),
(11, 0, 1651678406),
(9, 0, 1651678407),
(7, 402, 1651678411),
(6, 0, 1651678414),
(8, 656, 1651678418),
(5, 24.8, 1651678419),
(2, 0, 1651678431),
(1, 0.07, 1651678454),
(3, 0.3, 1651678460),
(4, 2.51, 1651678493),
(10, 0, 1651678524),
(11, 0, 1651678527),
(9, 0, 1651678528),
(7, 398, 1651678532),
(6, 0, 1651678534),
(5, 23.9, 1651678539),
(8, 660, 1651678541),
(2, 0, 1651678552),
(3, 0.3, 1651678584),
(1, 0.07, 1651678586),
(4, 2.51, 1651678621),
(10, 0, 1651678648),
(11, 0, 1651678648),
(9, 0, 1651678649),
(7, 404, 1651678652),
(6, 0, 1651678656),
(5, 25.1, 1651678660),
(8, 655, 1651678662),
(2, 0, 1651678675),
(1, 0.07, 1651678709),
(3, 0.3, 1651678709),
(4, 2.51, 1651678743),
(10, 0, 1651678768),
(11, 0, 1651678768),
(9, 0, 1651678770),
(7, 399, 1651678773),
(6, 0, 1651678777),
(5, 24.3, 1651678781),
(8, 655, 1651678783),
(2, 0, 1651678796),
(1, 0.07, 1651678831),
(3, 0.3, 1651678837),
(4, 2.51, 1651678864),
(10, 0, 1651678888),
(11, 0, 1651678888),
(9, 0, 1651678891),
(7, 404, 1651678894),
(6, 0, 1651678897),
(8, 653, 1651678903),
(5, 24.5, 1651678906),
(2, 0, 1651678917),
(3, 0.3, 1651678961),
(1, 0.07, 1651678966),
(4, 2.51, 1651678986),
(10, 0, 1651679008),
(11, 0, 1651679009),
(9, 0, 1651679011),
(7, 405, 1651679015),
(6, 0, 1651679017),
(8, 656, 1651679027),
(5, 23.8, 1651679028),
(2, 0, 1651679046),
(3, 0.3, 1651679084),
(1, 0.07, 1651679086),
(4, 2.51, 1651679112),
(10, 0, 1651677873),
(1, 0.07, 1651677873),
(6, 0, 1651677874),
(9, 0, 1651677874),
(11, 0, 1651677874),
(5, 24.6, 1651677874),
(2, 0, 1651677874),
(7, 387, 1651677874),
(8, 655, 1651677874),
(4, 2.51, 1651677874),
(3, 0.3, 1651677880),
(10, 0.07, 1651677994),
(9, 0, 1651677994),
(6, 0, 1651677994),
(7, 395, 1651677994),
(8, 663, 1651677994),
(11, 0, 1651677994),
(2, 0, 1651677995),
(4, 2.51, 1651677995),
(5, 24.9, 1651677995),
(1, 0.07, 1651677997),
(3, 0.3, 1651678013),
(10, 0, 1651678114),
(9, 0, 1651678114),
(6, 0, 1651678114),
(8, 666, 1651678114),
(11, 0, 1651678115),
(5, 25.5, 1651678115),
(7, 386, 1651678115),
(2, 0, 1651678115),
(4, 2.51, 1651678115),
(1, 0.06, 1651678119),
(3, 0.3, 1651678139),
(10, 0, 1651678234),
(9, 0, 1651678234),
(8, 669, 1651678235),
(11, 0, 1651678235),
(6, 0, 1651678235),
(5, 24.9, 1651678235),
(7, 382, 1651678235),
(4, 2.51, 1651678236),
(1, 0.06, 1651678240),
(2, 0, 1651678242),
(3, 0.3, 1651678261),
(10, 0, 1651678354),
(9, 0, 1651678355),
(11, 0, 1651678355),
(8, 669, 1651678355),
(6, 0, 1651678355),
(4, 2.51, 1651678357),
(7, 379, 1651678357),
(5, 24.7, 1651678357),
(2, 0, 1651678362),
(1, 0.07, 1651678365),
(3, 0.3, 1651678382),
(11, 0, 1651678475),
(8, 666, 1651678475),
(6, 0, 1651678475),
(9, 0, 1651678476),
(10, 0, 1651678476),
(4, 2.51, 1651678477),
(5, 24.8, 1651678477),
(7, 382, 1651678479),
(2, 0, 1651678483),
(1, 0.07, 1651678486),
(3, 0.3, 1651678502),
(7, 377, 1651677874),
(5, 24.5, 1651677874),
(10, 0, 1651677874),
(6, 0, 1651677874),
(11, 0, 1651677874),
(9, 0, 1651677874),
(8, 706, 1651677874),
(1, 0.07, 1651677875),
(3, 0.3, 1651677875),
(9, 0, 1651679862),
(6, 0, 1651679862),
(10, 0, 1651679862),
(8, 670, 1651679862),
(4, 2.51, 1651679862),
(11, 0, 1651679862),
(5, 24, 1651679862),
(2, 0, 1651679863),
(7, 384, 1651679863),
(1, 0.07, 1651679863),
(3, 0.3, 1651679866),
(10, 0, 1651679878),
(4, 2.51, 1651680471),
(6, 0, 1651680471),
(7, 371, 1651680471),
(9, 0, 1651680471),
(5, 25, 1651680471),
(8, 670, 1651680471),
(10, 0, 1651680471),
(1, 0.06, 1651680471),
(11, 0, 1651680471),
(3, 0.3, 1651680474),
(2, 0, 1651680479),
(7, 382, 1651680591),
(9, 0, 1651680591),
(8, 675, 1651680591),
(6, 0, 1651680591),
(11, 0, 1651680592),
(4, 2.51, 1651680592),
(10, 0, 1651680592),
(5, 24.6, 1651680592),
(3, 0.3, 1651680595),
(1, 0.06, 1651680595),
(2, 0, 1651680604),
(7, 384, 1651680711),
(6, 0, 1651680711),
(8, 671, 1651680711),
(11, 0, 1651680712),
(9, 0, 1651680712),
(10, 0, 1651680712),
(5, 24.8, 1651680713),
(3, 0.3, 1651680715),
(1, 0.07, 1651680716),
(4, 2.51, 1651680717),
(2, 0, 1651680731),
(6, 0, 1651680831),
(8, 684, 1651680831),
(11, 0, 1651680832),
(9, 0, 1651680832),
(7, 388, 1651680832),
(10, 0, 1651680832),
(5, 25.3, 1651680833),
(1, 0.07, 1651680839),
(4, 2.51, 1651680839),
(3, 0.3, 1651680841),
(2, 0, 1651680852),
(6, 0, 1651680951),
(11, 0, 1651680952),
(7, 423, 1651680952),
(9, 0, 1651680952),
(8, 689, 1651680953),
(10, 0, 1651680953),
(5, 24.8, 1651680954),
(4, 2.51, 1651680960),
(1, 0.07, 1651680961),
(3, 0.3, 1651680961),
(2, 0, 1651680976),
(6, 0, 1651681072),
(11, 0, 1651681072),
(9, 0, 1651681072),
(7, 399, 1651681073),
(8, 691, 1651681073),
(10, 0, 1651681073),
(5, 24.3, 1651681074),
(4, 2.51, 1651681080),
(1, 0.07, 1651681084),
(3, 0.3, 1651681095),
(2, 0, 1651681102),
(11, 0, 1651681192),
(9, 0, 1651681192),
(6, 0, 1651681193),
(10, 0, 1651681193),
(8, 689, 1651681194),
(7, 393, 1651681194),
(5, 24.5, 1651681194),
(4, 2.51, 1651681201),
(1, 0.07, 1651681209),
(3, 0.3, 1651681220),
(2, 0, 1651681223),
(11, 0, 1651681312),
(9, 0, 1651681313),
(6, 0, 1651681313),
(10, 0, 1651681313),
(8, 691, 1651681314),
(5, 24.3, 1651681314),
(7, 399, 1651681316),
(4, 2.51, 1651681324),
(1, 0.07, 1651681330),
(2, 0, 1651681346),
(3, 0.3, 1651681353),
(11, 0, 1651681433),
(6, 0, 1651681433),
(8, 693, 1651681435),
(5, 24.5, 1651681435),
(9, 0, 1651681435),
(7, 403, 1651681436),
(10, 0, 1651681436),
(1, 0.07, 1651681451),
(4, 2.51, 1651681452),
(2, 0, 1651681466),
(3, 0.3, 1651681482),
(11, 0, 1651681554),
(6, 0, 1651681555),
(8, 693, 1651681556),
(5, 23.6, 1651681556),
(7, 406, 1651681556),
(9, 0, 1651681557),
(10, 0, 1651681557),
(4, 2.51, 1651681572),
(1, 0.07, 1651681577),
(2, 0, 1651681592),
(3, 0.3, 1651681603),
(6, 0, 1651681675),
(11, 0, 1651681675),
(8, 695, 1651681676),
(7, 414, 1651681677),
(9, 0, 1651681677),
(5, 24.5, 1651681678),
(10, 0, 1651681679),
(4, 2.51, 1651681697),
(1, 0.07, 1651681707),
(2, 0, 1651681714),
(3, 0.3, 1651681723),
(11, 0, 1651681795),
(6, 0, 1651681795),
(8, 698, 1651681797),
(7, 413, 1651681797),
(5, 24.3, 1651681798),
(9, 0, 1651681799),
(10, 0, 1651681800),
(4, 2.51, 1651681820),
(2, 0, 1651681834),
(1, 0.07, 1651681835),
(3, 0.3, 1651681853),
(11, 0, 1651681915),
(6, 0, 1651681915),
(7, 412, 1651681918),
(5, 24.3, 1651681918),
(8, 694, 1651681919),
(9, 0, 1651681920),
(10, 0, 1651681921),
(4, 2.51, 1651681941),
(1, 0.07, 1651681956),
(2, 0, 1651681958),
(3, 0.3, 1651681976),
(11, 0, 1651682036),
(6, 0, 1651682036),
(7, 425, 1651682038),
(5, 25.1, 1651682039),
(8, 754, 1651682039),
(9, 0, 1651682040),
(10, 0, 1651682042),
(4, 2.51, 1651682061),
(1, 0.07, 1651682079),
(2, 0, 1651682083),
(3, 0.3, 1651682101),
(6, 0, 1651682156),
(11, 0, 1651682157),
(7, 425, 1651682159),
(5, 24.3, 1651682160),
(8, 696, 1651682160),
(9, 0, 1651682161),
(10, 0, 1651682162),
(4, 2.51, 1651682188),
(2, 0, 1651682209),
(1, 0.07, 1651682211),
(3, 0.3, 1651682223),
(6, 0, 1651682277),
(11, 0, 1651682278),
(7, 434, 1651682280),
(8, 700, 1651682281),
(9, 0, 1651682282),
(10, 0, 1651682282),
(5, 24.7, 1651682283),
(4, 2.51, 1651682313),
(2, 0, 1651682330),
(1, 0.07, 1651682337),
(3, 0.3, 1651682346),
(6, 0, 1651682398),
(11, 0, 1651682399),
(7, 437, 1651682400),
(8, 700, 1651682401),
(9, 0, 1651682403),
(10, 0, 1651682403),
(5, 24.7, 1651682405),
(4, 2.51, 1651682440),
(2, 0, 1651682455),
(1, 0.07, 1651682459),
(3, 0.3, 1651682467),
(6, 0, 1651682518),
(11, 0, 1651682520),
(7, 442, 1651682521),
(8, 702, 1651682523),
(10, 0, 1651682523),
(9, 0, 1651682525),
(5, 24.5, 1651682527),
(2, 0, 1651682577),
(1, 0.07, 1651682580),
(3, 0.3, 1651682587),
(4, 2.51, 1651682604),
(6, 0, 1651682638),
(11, 0, 1651682641),
(7, 450, 1651682641),
(8, 700, 1651682643),
(10, 0, 1651682644),
(9, 0, 1651682645),
(5, 24.5, 1651682647),
(2, 0, 1651682702),
(3, 0.3, 1651682717),
(1, 0.07, 1651682722),
(4, 2.51, 1651682730),
(6, 0, 1651682758),
(7, 447, 1651682761),
(11, 0, 1651682762),
(10, 0, 1651682764),
(9, 0, 1651682766),
(5, 24.8, 1651682768),
(8, 692, 1651682768),
(2, 0, 1651682823),
(1, 0.07, 1651682844),
(4, 2.51, 1651682852),
(3, 0.29, 1651682857),
(6, 0, 1651682879),
(11, 0, 1651682883),
(7, 439, 1651682883),
(10, 0, 1651682885),
(9, 0, 1651682886),
(5, 24.7, 1651682888),
(8, 695, 1651682889),
(2, 0, 1651682946),
(1, 0.07, 1651682965),
(3, 0.3, 1651682978),
(4, 2.51, 1651682989),
(6, 0, 1651683000),
(7, 446, 1651683003),
(11, 0, 1651683003),
(10, 0, 1651683005),
(9, 0, 1651683008),
(5, 23.7, 1651683009),
(8, 696, 1651683009),
(2, 0, 1651683069),
(1, 0.07, 1651683086),
(3, 0.29, 1651683103),
(4, 2.51, 1651683112),
(6, 0, 1651683121),
(7, 456, 1651683124),
(11, 0, 1651683124),
(10, 0, 1651683126),
(5, 24.2, 1651683129),
(9, 0, 1651683129),
(8, 699, 1651683129),
(2, 0, 1651683190),
(1, 0.07, 1651683215),
(4, 2.51, 1651683239),
(3, 0.29, 1651683241),
(6, 0, 1651683242),
(7, 446, 1651683244),
(11, 0, 1651683244),
(10, 0, 1651683247),
(9, 0, 1651683249),
(5, 23.3, 1651683250),
(8, 698, 1651683251),
(2, 0, 1651683316),
(1, 0.06, 1651683338),
(6, 0, 1651683362),
(3, 0.3, 1651683362),
(7, 459, 1651683365),
(11, 0, 1651683366),
(10, 0, 1651683368),
(9, 0, 1651683370),
(5, 24.4, 1651683372),
(8, 699, 1651683372),
(4, 2.51, 1651683373),
(2, 0, 1651683437),
(1, 0.07, 1651683459),
(6, 0, 1651683483),
(3, 0.3, 1651683485),
(7, 459, 1651683485),
(11, 0, 1651683486),
(10, 0, 1651683488),
(9, 0, 1651683490),
(5, 23.9, 1651683495),
(8, 699, 1651683496),
(4, 2.51, 1651683499),
(2, 0, 1651683559),
(1, 0.06, 1651683589),
(6, 0, 1651683604),
(7, 458, 1651683606),
(11, 0, 1651683606),
(10, 0, 1651683608),
(9, 0, 1651683610),
(5, 25, 1651683616),
(8, 700, 1651683616),
(4, 2.51, 1651683620),
(3, 0.3, 1651683636),
(2, 0, 1651683681),
(1, 0.07, 1651683719),
(6, 0, 1651683726),
(11, 0, 1651683727),
(7, 456, 1651683727),
(10, 0, 1651683728),
(9, 0, 1651683732),
(5, 23.6, 1651683736),
(8, 697, 1651683738),
(4, 2.51, 1651683752),
(3, 0.3, 1651683758),
(2, 0, 1651683805),
(1, 0.07, 1651683839),
(6, 0, 1651683846),
(7, 459, 1651683848),
(11, 0, 1651683848),
(10, 0, 1651683848),
(9, 0, 1651683852),
(8, 694, 1651683859),
(5, 24.4, 1651683859),
(4, 2.51, 1651683874),
(3, 0.3, 1651683883),
(2, 0, 1651683926),
(1, 0.07, 1651683960),
(6, 0, 1651683968),
(11, 0, 1651683968),
(7, 457, 1651683968),
(10, 0, 1651683971),
(9, 0, 1651683973),
(5, 24.4, 1651683979),
(8, 693, 1651683980),
(4, 2.51, 1651683995),
(3, 0.3, 1651684004),
(2, 0, 1651684047),
(1, 0.07, 1651684083),
(6, 0, 1651684088),
(11, 0, 1651684088),
(7, 461, 1651684089),
(10, 0, 1651684092),
(9, 0, 1651684093),
(5, 25.2, 1651684101),
(8, 695, 1651684101),
(4, 2.51, 1651684116),
(3, 0.3, 1651684132),
(2, 0, 1651684168),
(6, 0, 1651684208),
(11, 0, 1651684209),
(7, 465, 1651684210),
(10, 0, 1651684212),
(9, 0, 1651684213),
(1, 0.07, 1651684219),
(5, 24.4, 1651684221),
(8, 693, 1651684221),
(4, 2.51, 1651684236),
(3, 0.29, 1651684253),
(2, 0, 1651684290),
(6, 0, 1651684329),
(7, 463, 1651684330),
(11, 0, 1651684330),
(10, 0, 1651684332),
(9, 0, 1651684333),
(1, 0.07, 1651684340),
(5, 25.4, 1651684341),
(8, 694, 1651684341),
(4, 2.51, 1651684369),
(3, 0.29, 1651684376),
(2, 0, 1651684410),
(7, 458, 1651684450),
(6, 0, 1651684450),
(11, 0, 1651684450),
(10, 0, 1651684453),
(9, 0, 1651684454),
(8, 696, 1651684462),
(5, 24, 1651684463),
(1, 0.07, 1651684465),
(4, 2.51, 1651684490),
(3, 0.29, 1651684508),
(2, 0, 1651684530),
(7, 466, 1651684570),
(6, 0, 1651684570),
(11, 0, 1651684571),
(10, 0, 1651684573),
(9, 0, 1651684577),
(5, 23.3, 1651684583),
(8, 694, 1651684586),
(1, 0.07, 1651684588),
(4, 2.51, 1651684612),
(3, 0.29, 1651684632),
(2, 0, 1651684655),
(6, 0, 1651684691),
(11, 0, 1651684691),
(7, 465, 1651684693),
(10, 0, 1651684693),
(9, 0, 1651684698),
(8, 695, 1651684707),
(5, 24.3, 1651684708),
(1, 0.07, 1651684712),
(4, 2.51, 1651684734),
(3, 0.29, 1651684757),
(2, 0, 1651684775),
(6, 0, 1651684811),
(11, 0, 1651684812),
(7, 459, 1651684813),
(10, 0, 1651684813),
(9, 0, 1651684819),
(5, 23.8, 1651684828),
(8, 698, 1651684830),
(1, 0.07, 1651684842),
(4, 2.51, 1651684871),
(3, 0.3, 1651684878),
(2, 0, 1651684896),
(6, 0, 1651684931),
(7, 465, 1651684933),
(11, 0, 1651684934),
(10, 0, 1651684934),
(9, 0, 1651684942),
(5, 24.4, 1651684948),
(8, 700, 1651684952),
(1, 0.07, 1651684964),
(4, 2.51, 1651684993),
(3, 0.3, 1651684999),
(2, 0, 1651685021),
(6, 0, 1651685052),
(7, 461, 1651685054),
(10, 0, 1651685054),
(11, 0, 1651685055),
(9, 0, 1651685062),
(5, 24.3, 1651685068),
(8, 696, 1651685073),
(1, 0.06, 1651685094),
(4, 2.51, 1651685115),
(3, 0.29, 1651685120),
(2, 0, 1651685156),
(6, 0, 1651685174),
(7, 463, 1651685174),
(10, 0.13, 1651685175),
(11, 0, 1651685175),
(9, 0, 1651685183),
(5, 24.2, 1651685189),
(8, 694, 1651685194),
(1, 0.06, 1651685214),
(4, 2.51, 1651685236),
(3, 0.29, 1651685244),
(2, 0, 1651685276),
(7, 460, 1651685294),
(11, 0, 1651685296),
(6, 0, 1651685296),
(10, 0, 1651685296),
(9, 0, 1651685306),
(5, 24, 1651685311),
(8, 697, 1651685315),
(1, 0.07, 1651685336),
(4, 2.51, 1651685364),
(3, 0.29, 1651685364),
(2, 0, 1651685396),
(7, 459, 1651685415),
(11, 0, 1651685417),
(10, 0, 1651685418),
(6, 0, 1651685418),
(9, 0, 1651685427),
(5, 23.8, 1651685432),
(8, 696, 1651685435),
(1, 0.06, 1651685460),
(3, 0.29, 1651685485),
(4, 2.51, 1651685491),
(2, 0, 1651685517),
(7, 459, 1651685535),
(6, 0, 1651685538),
(10, 0, 1651685538),
(11, 0, 1651685538),
(9, 0, 1651685547),
(5, 24.1, 1651685554),
(8, 697, 1651685555),
(1, 0.06, 1651685586),
(3, 0.29, 1651685609),
(4, 2.51, 1651685624),
(2, 0, 1651685640),
(7, 464, 1651685655),
(6, 0, 1651685658),
(11, 0, 1651685658),
(10, 0, 1651685659),
(9, 0, 1651685667),
(5, 24.1, 1651685674),
(8, 697, 1651685676),
(1, 0.06, 1651685712),
(3, 0.29, 1651685738),
(4, 2.51, 1651685748),
(2, 0, 1651685760),
(7, 459, 1651685776),
(6, 0, 1651685778),
(10, 0, 1651685779),
(11, 0, 1651685779),
(9, 0, 1651685788),
(5, 23.3, 1651685794),
(8, 697, 1651685796),
(1, 0.06, 1651685848),
(3, 0.28, 1651685866),
(2, 0, 1651685883),
(4, 2.51, 1651685883),
(7, 459, 1651685897),
(6, 0, 1651685898),
(10, 0, 1651685900),
(11, 0, 1651685900),
(9, 0, 1651685908),
(5, 23.9, 1651685917),
(8, 694, 1651685920),
(1, 0.06, 1651685970),
(3, 0.28, 1651685987),
(4, 2.51, 1651686005),
(2, 0, 1651686006),
(7, 458, 1651686018),
(6, 0, 1651686018),
(10, 0, 1651686020),
(11, 0, 1651686020),
(9, 0, 1651686033),
(5, 24.2, 1651686039),
(8, 694, 1651686044),
(1, 0.06, 1651686098),
(3, 0.29, 1651686118),
(2, 0, 1651686128),
(4, 2.51, 1651686135),
(7, 457, 1651686139),
(6, 0, 1651686139),
(10, 0, 1651686141),
(11, 0, 1651686141),
(9, 0, 1651686154),
(5, 23.9, 1651686159),
(8, 693, 1651686164),
(1, 0.07, 1651686223),
(2, 0, 1651686250),
(6, 0, 1651686259),
(4, 2.51, 1651686260),
(7, 458, 1651686260),
(11, 0, 1651686261),
(10, 0, 1651686262),
(3, 0.28, 1651686269),
(9, 0, 1651686275),
(5, 23.7, 1651686280),
(8, 692, 1651686285),
(1, 0.06, 1651686346),
(2, 0, 1651686379),
(6, 0, 1651686380),
(7, 461, 1651686381),
(11, 0, 1651686381),
(10, 0, 1651686383),
(4, 2.51, 1651686388),
(3, 0.28, 1651686392),
(9, 0, 1651686395),
(5, 24.1, 1651686400),
(8, 695, 1651686406),
(1, 0.06, 1651686468),
(6, 0, 1651686500),
(2, 0, 1651686501),
(7, 466, 1651686502),
(11, 0, 1651686503),
(10, 0, 1651686504),
(4, 2.51, 1651686516),
(9, 0, 1651686517),
(5, 23.8, 1651686521),
(8, 694, 1651686528),
(3, 0.28, 1651686562),
(1, 0.06, 1651686592),
(2, 0, 1651686621),
(7, 457, 1651686622),
(11, 0, 1651686624),
(10, 0, 1651686624),
(9, 0, 1651686637),
(4, 2.51, 1651686637),
(8, 698, 1651686648),
(6, 0, 1651686681),
(3, 0.29, 1651686684),
(5, 24.3, 1651686701),
(1, 0.06, 1651686718),
(2, 0, 1651686741),
(7, 470, 1651686743),
(11, 0, 1651686744),
(10, 0, 1651686745),
(4, 2.51, 1651686758),
(9, 0, 1651686758),
(8, 695, 1651686769),
(3, 0.28, 1651686804),
(1, 0.06, 1651686860),
(6, 0, 1651686861),
(7, 464, 1651686864),
(11, 0, 1651686865),
(2, 0, 1651686866),
(10, 0, 1651686866),
(9, 0, 1651686878),
(5, 24.3, 1651686885),
(8, 658, 1651686890),
(4, 2.51, 1651686902),
(3, 0.28, 1651686929),
(1, 0.06, 1651686983),
(7, 468, 1651686984),
(2, 0, 1651686987),
(10, 0, 1651686987),
(11, 0, 1651686990),
(9, 0, 1651686999),
(8, 695, 1651687013),
(4, 2.51, 1651687024),
(6, 0, 1651687043),
(3, 0.29, 1651687050),
(5, 23.8, 1651687067),
(7, 463, 1651687104),
(1, 0.06, 1651687106),
(10, 0, 1651687107),
(11, 0, 1651687111),
(2, 0, 1651687116),
(9, 0, 1651687119),
(8, 692, 1651687134),
(4, 2.51, 1651687170),
(3, 0.28, 1651687171),
(6, 0, 1651687223),
(7, 471, 1651687226),
(1, 0.06, 1651687227),
(10, 0, 1651687227),
(11, 0, 1651687232),
(2, 0, 1651687237),
(9, 0, 1651687239),
(5, 24.3, 1651687249),
(8, 705, 1651687254),
(4, 2.51, 1651687293),
(3, 0.28, 1651687293),
(7, 460, 1651687346),
(10, 0.2, 1651687348),
(1, 0.06, 1651687350),
(11, 0, 1651687353),
(9, 0, 1651687360),
(2, 0, 1651687360),
(8, 691, 1651687375),
(6, 0, 1651687403),
(3, 0.28, 1651687414),
(4, 2.51, 1651687419),
(5, 24, 1651687430),
(7, 462, 1651687466),
(10, 0, 1651687468),
(1, 0.07, 1651687471),
(11, 0, 1651687473),
(9, 0, 1651687480),
(2, 0, 1651687486),
(8, 696, 1651687495),
(6, 0, 1651687524),
(4, 2.51, 1651687540),
(5, 24.3, 1651687551),
(3, 0.28, 1651687557),
(7, 461, 1651687587),
(10, 0, 1651687589),
(1, 0.06, 1651687592),
(11, 0, 1651687594),
(9, 0, 1651687602),
(2, 0, 1651687607),
(8, 699, 1651687617),
(7, 469, 1651687666),
(11, 0, 1651687666),
(5, 22.8, 1651687666),
(4, 2.51, 1651687666),
(6, 0, 1651687666),
(10, 0, 1651687666),
(9, 0, 1651687666),
(1, 0.06, 1651687667),
(8, 698, 1651687667),
(2, 0, 1651687668),
(3, 0.28, 1651687676),
(5, 23.9, 1651687718),
(6, 0, 1651687718),
(11, 0, 1651687718),
(9, 0, 1651687718),
(7, 468, 1651687718),
(10, 0, 1651687719),
(8, 697, 1651687719),
(4, 2.51, 1651687719),
(3, 0.28, 1651687720),
(2, 0, 1651687720),
(1, 0.06, 1651687729);

-- --------------------------------------------------------

--
-- Structure de la table `SENSORS_STATIC`
--

CREATE TABLE `SENSORS_STATIC` (
  `ID` int(11) NOT NULL,
  `VALUE` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `SENSORS_STATIC`
--

INSERT INTO `SENSORS_STATIC` (`ID`, `VALUE`) VALUES
(1, 0.07),
(2, 0),
(3, 0.28),
(4, 2.51),
(5, 23.7),
(6, 0),
(7, 481),
(8, 698),
(9, 4.75),
(10, 0),
(11, 0),
(12, 0),
(13, 0);

-- --------------------------------------------------------

--
-- Structure de la table `UPDATETIME`
--

CREATE TABLE `UPDATETIME` (
  `ID` int(11) NOT NULL,
  `TIME` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `UPDATETIME`
--

INSERT INTO `UPDATETIME` (`ID`, `TIME`) VALUES
(1, 2),
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(6, 2),
(7, 2);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `ACCOUNTS`
--
ALTER TABLE `ACCOUNTS`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `HISTORY`
--
ALTER TABLE `HISTORY`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `ACCOUNTS`
--
ALTER TABLE `ACCOUNTS`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `HISTORY`
--
ALTER TABLE `HISTORY`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
