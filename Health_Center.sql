-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 08. Jul 2020 um 15:31
-- Server-Version: 10.4.13-MariaDB
-- PHP-Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `Health Center`
--
CREATE DATABASE IF NOT EXISTS `Health Center` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `Health Center`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Doctors`
--

CREATE TABLE `Doctors` (
  `Doctors_ID` smallint(5) NOT NULL,
  `First_Name` varchar(30) DEFAULT NULL,
  `Sure_Name` varchar(30) DEFAULT NULL,
  `Speciality` varchar(30) DEFAULT NULL,
  `Unit_ID` smallint(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `Doctors`
--

INSERT INTO `Doctors` (`Doctors_ID`, `First_Name`, `Sure_Name`, `Speciality`, `Unit_ID`) VALUES
(1, 'Georg', 'Pichler', 'Unfallchirurgie', 1),
(2, 'Markus', 'Brandtner', 'Onkologie', 2),
(3, 'Alexander', 'Eder', 'Gynäkologie', 3),
(4, 'Thomas', 'Varga', 'Radiologie', 4);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Interventions`
--

CREATE TABLE `Interventions` (
  `Interventions_ID` smallint(5) NOT NULL,
  `Symptom` varchar(30) DEFAULT NULL,
  `Treatment` varchar(30) DEFAULT NULL,
  `Date_Intervention` date DEFAULT NULL,
  `Social_Security_Number_ID` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `Interventions`
--

INSERT INTO `Interventions` (`Interventions_ID`, `Symptom`, `Treatment`, `Date_Intervention`, `Social_Security_Number_ID`) VALUES
(1, 'Beinbruch', 'Gips', '2020-07-05', 345010277),
(2, 'Lungenkarzinom', 'Bestrahlung', '2020-07-06', 1161030477),
(3, 'Starke Blutung', 'Kürettage', '2020-07-07', 1261010278),
(4, 'Kopfschmerzen', 'Kopf aufschneiden', '2020-07-08', 1234010276);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Patients`
--

CREATE TABLE `Patients` (
  `Social_Security_Number_ID` int(10) NOT NULL,
  `First_Name` varchar(30) DEFAULT NULL,
  `Sure_Name` varchar(30) DEFAULT NULL,
  `Date_Admission` date DEFAULT NULL,
  `Doctors_ID` smallint(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `Patients`
--

INSERT INTO `Patients` (`Social_Security_Number_ID`, `First_Name`, `Sure_Name`, `Date_Admission`, `Doctors_ID`) VALUES
(345010277, 'Herbert', 'Eder', '2020-07-02', 1),
(1161030477, 'Klaus', 'Burger', '2020-07-03', 2),
(1234010276, 'Alex', 'Bauer', '2020-07-01', 4),
(1261010278, 'Sandra', 'Maischberger', '2020-07-04', 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Unit`
--

CREATE TABLE `Unit` (
  `Unit_ID` smallint(5) NOT NULL,
  `Name` varchar(30) DEFAULT NULL,
  `Floor` smallint(5) NOT NULL,
  `Social_Security_Number_ID` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `Unit`
--

INSERT INTO `Unit` (`Unit_ID`, `Name`, `Floor`, `Social_Security_Number_ID`) VALUES
(1, 'Unfallchirurgie', 1, 345010277),
(2, 'Onkologie', 2, 1161030477),
(3, 'Gynäkologie', 3, 1261010278),
(4, 'Radiologie', 4, 1234010276);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `Doctors`
--
ALTER TABLE `Doctors`
  ADD PRIMARY KEY (`Doctors_ID`),
  ADD KEY `Unit_ID` (`Unit_ID`);

--
-- Indizes für die Tabelle `Interventions`
--
ALTER TABLE `Interventions`
  ADD PRIMARY KEY (`Interventions_ID`),
  ADD KEY `Social_Security_Number_ID` (`Social_Security_Number_ID`);

--
-- Indizes für die Tabelle `Patients`
--
ALTER TABLE `Patients`
  ADD PRIMARY KEY (`Social_Security_Number_ID`),
  ADD KEY `Doctors_ID` (`Doctors_ID`);

--
-- Indizes für die Tabelle `Unit`
--
ALTER TABLE `Unit`
  ADD PRIMARY KEY (`Unit_ID`),
  ADD KEY `Social_Security_Number_ID` (`Social_Security_Number_ID`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `Doctors`
--
ALTER TABLE `Doctors`
  MODIFY `Doctors_ID` smallint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `Interventions`
--
ALTER TABLE `Interventions`
  MODIFY `Interventions_ID` smallint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `Unit`
--
ALTER TABLE `Unit`
  MODIFY `Unit_ID` smallint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `Doctors`
--
ALTER TABLE `Doctors`
  ADD CONSTRAINT `Doctors_ibfk_1` FOREIGN KEY (`Unit_ID`) REFERENCES `Unit` (`Unit_ID`),
  ADD CONSTRAINT `Doctors_ibfk_2` FOREIGN KEY (`Unit_ID`) REFERENCES `Unit` (`Unit_ID`);

--
-- Constraints der Tabelle `Interventions`
--
ALTER TABLE `Interventions`
  ADD CONSTRAINT `Interventions_ibfk_1` FOREIGN KEY (`Social_Security_Number_ID`) REFERENCES `Patients` (`Social_Security_Number_ID`);

--
-- Constraints der Tabelle `Patients`
--
ALTER TABLE `Patients`
  ADD CONSTRAINT `Patients_ibfk_1` FOREIGN KEY (`Doctors_ID`) REFERENCES `Doctors` (`Doctors_ID`);

--
-- Constraints der Tabelle `Unit`
--
ALTER TABLE `Unit`
  ADD CONSTRAINT `Unit_ibfk_1` FOREIGN KEY (`Social_Security_Number_ID`) REFERENCES `Patients` (`Social_Security_Number_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
