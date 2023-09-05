 -- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Erstellungszeit: 05. Sep 2023 um 17:20
-- Server-Version: 8.0.34-0ubuntu0.20.04.1
-- PHP-Version: 7.4.3-4ubuntu2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


--
--
--

--
-- Datenbank: Kanders
--

-- 
CREATE DATABASE IF NOT EXISTS `Kanders` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `Kanders`;
--
-- Tabellenstruktur für Tabelle `accounts`
--

CREATE TABLE `accounts` (
  `account_ID` int NOT NULL AUTO_INCREMENT,
  `Vorname` varchar(40) NOT NULL,
  `Passwort` varchar(40) NOT NULL,
  `Nachname` varchar(40) DEFAULT NULL,
  `E-Mail` varchar(40) DEFAULT NULL,
  `Geburtsdatum` DATE DEFAULT NULL,
  `Geschlecht` varchar(40) DEFAULT NULL,
  `Telefonnummer` int DEFAULT NULL,
  `Adresse` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`account_ID`)
);

--
--
--

INSERT INTO `accounts` (`Vorname`, `Nachname`, `Passwort`, `Geburtsdatum`, `Geschlecht`) VALUES
('Maximilian', 'Bich', '916', '2006-02-09', 'Männlich');

--
--
--

CREATE TABLE `Rolle` (
  `R_ID` int NOT NULL AUTO_INCREMENT,
  `Bezeichnung` varchar(40) NOT NULL,
  PRIMARY KEY (`R_ID`)
);

INSERT INTO `Rolle` (`Bezeichnung`) VALUES
('Adminstrator'),
('Member');

--
--
--

CREATE TABLE `Event` (
  `Event_ID` int NOT NULL AUTO_INCREMENT,
  `Preis` decimal(5, 2) DEFAULT NULL, 
  `Preis_Typ` int NOT NULL,
  `Standort` varchar(40) NOT NULL,
  `Uhrzeit` time NOT NULL,
  `Datum` DATE NOT NULL,
  `Wochentag` varchar(40) NOT NULL,
  PRIMARY KEY (`Event_ID`)
);

INSERT INTO `Event` (`Preis`, `Preis_Typ`, `Standort`, `Uhrzeit`, `Datum`, `Wochentag`) VALUES
('', 1, 'Unna', '16:02:00', '2023-09-10', 'Sunday');

 --
 --
 --

 CREATE TABLE `Preis_Typ` (
  `PRTP_ID` int NOT NULL AUTO_INCREMENT,
  `Bezeichnung` varchar(40),
  PRIMARY KEY (`PRTP_ID`)
);

INSERT INTO `Preis_Typ` (`Bezeichnung`) VALUES
('Normal'),
('Hutaktion');

--
--
--

CREATE TABLE `Ort` (
  `Ort_ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(40) NOT NULL,
  `PLZ` int DEFAULT NULL,
  PRIMARY KEY (`Ort_ID`)
);

INSERT INTO `Ort` (`Name`, `PLZ`) VALUES
('Unna', 59425);
--
--
--

CREATE TABLE `Veranstaltungsort` (
  `VAOT_ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(40),
  PRIMARY KEY (`VAOT_ID`)
);

INSERT INTO `Veranstaltungsort` (`Name`) VALUES
('Schalander');
--
--
--

/*CREATE TABLE `Festival`(
`Event_ID` int NOT NULL,
`Name` varchar(40) NOT NULL,
`End_Datum` DATE DEFAULT NULL,
`End_Uhrzeit` time DEFAULT NULL
)

--
--
--
INSERT INTO `Festival`(`Name`)


--
--
--
ALTER TABLE `Festival`
  ADD FOREIGN KEY (Event_ID) REFERENCES `Event` (Event_ID);

CREATE TABLE `Konzert`(
 `Event_ID` int NOT NULL,

)
ALTER TABLE `Konzert`  
ADD FOREIGN KEY (Event_ID) REFERENCES `Event` (Event_ID); */

CREATE TABLE `Band` (
  `Band_ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(40) NOT NULL,
  PRIMARY KEY (`Band_ID`)
);

INSERT INTO `Band` (`Name`) VALUES
('Bring me the Horizon');
--
--
--

CREATE TABLE `Mitglieder` (
  `MITG_ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`MITG_ID`)
);

--
--
--

CREATE TABLE `Song` (
  `Song_ID` int NOT NULL AUTO_INCREMENT,
  `Song_Typ` varchar(40),
  `Name` varchar(40),
  PRIMARY KEY (`Song_ID`)
);

--
--
--





