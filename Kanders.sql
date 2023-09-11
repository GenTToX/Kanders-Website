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

CREATE TABLE `Mitglied` (
  `MITG_ID` int NOT NULL AUTO_INCREMENT,
  `Username` varchar(40) NOT NULL,
  `Vorname` varchar(40) DEFAULT NULL,
  `Passwort` varchar(40) NOT NULL,
  `Nachname` varchar(40) DEFAULT NULL,
  `E-Mail` varchar(40) DEFAULT NULL,
  `Geburtsdatum` DATE DEFAULT NULL,
  `Geschlecht` varchar(40) DEFAULT NULL,
  `Telefonnummer` int DEFAULT NULL,
  `Strasse` varchar(40) DEFAULT NULL,
  `Hausummer` int DEFAULT NULL,
  `Ort` varchar(40) DEFAULT NULL,
  `PLZ` int DEFAULT NULL,
-- FOREIGN KEY
  `ROLL_ID` int NOT NULL,

  PRIMARY KEY (`MITG_ID`)
);

--
--
--

INSERT INTO `Mitglied` (`Username`, `Vorname`, `Nachname`, `Passwort`, `Geburtsdatum`, `Geschlecht`, `ROLL_ID`) VALUES
(`Maxinum916`, 'Maximilian', 'Bich', '916', '2006-02-09', 'Männlich', 1);

--
--
--

CREATE TABLE `Rolle` (
  `ROLL_ID` int NOT NULL AUTO_INCREMENT,
  `Bezeichnung` varchar(40) NOT NULL,

  PRIMARY KEY (`ROLL_ID`)
);

INSERT INTO `Rolle` (`Bezeichnung`) VALUES
('Adminstrator'),
('Member');

--
--
--

CREATE TABLE `Veranstaltung` (
  `VERA_ID` int NOT NULL AUTO_INCREMENT,
  `Preis` decimal(5, 2) DEFAULT NULL, 
  `Preis_Typ` int NOT NULL,
  `Wochentag` varchar(40) NOT NULL,
  `Start-Uhrzeit` time NOT NULL,
  `Start-Datum` DATE NOT NULL,
 
  PRIMARY KEY (`VERA_ID`)
);

INSERT INTO `Veranstaltung` (`Preis`, `Preis_Typ`, `Wochentag`, `Start-Uhrzeit`, `Start-Datum`) VALUES
('', 1, 'Sunday', '16:02:00', '2023-09-10');

 --
 --
 --

 CREATE TABLE `Preis-Typ` (
  `PRTP_ID` int NOT NULL AUTO_INCREMENT,
  `Bezeichnung` varchar(40),

  PRIMARY KEY (`PRTP_ID`)
);

INSERT INTO `Preis-Typ` (`Bezeichnung`) VALUES
('Normal'),
('Hutaktion');

--
--
--

CREATE TABLE `Veranstaltungs-Typ` (
 `VETP_ID` int NOT NULL AUTO_INCREMENT,
  `Bezeichnung` varchar(40),

  PRIMARY KEY (`VETP_ID`)
);
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

CREATE TABLE `Stadt` (
  `STDT_ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(40) NOT NULL,

  PRIMARY KEY (`Ort_ID`)
);



INSERT INTO `Ort` (`Name`) VALUES
('Unna');



--
--
--

CREATE TABLE `Stadtteil`(
  `STTL_ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(40) DEFAULT NULL,
  `PLZ` int DEFAULT NULL,

  PRIMARY KEY(`STTL_ID`)
);

--
--
--

CREATE TABLE `Region`(
  `REGI_ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(40) DEFAULT NULL,

  PRIMARY KEY(`REGI_ID`)
);

--
--
--

CREATE TABLE `Bundesland`(
    `BULA_ID` int NOT NULL AUTO_INCREMENT,
    `Name` varchar(40),

    PRIMARY KEY(`BULA_ID`)
);

--
--
--

CREATE TABLE `Band` (
  `BAND_ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(40) NOT NULL,

  PRIMARY KEY (`BAND_ID`)
);

INSERT INTO `Band` (`Name`) VALUES
('Bring me the Horizon');

--
--
--

CREATE TABLE `Konzert`(
    
);

--
--
--

CREATE TABLE `Festival`(
    `End-Datum` Date NOT NULL,
    `Ende-Uhrzeit` time NOT NUll,
    `Name` varchar(40) NOT NULL,
);

--
--
--

CREATE TABLE `Musiker` (
  `MUSI_ID` int NOT NULL AUTO_INCREMENT,
  `Vorname` varchar(40) DEFAULT NULL,
  `Nachname` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`MITG_ID`)
);

--
--
--

CREATE TABLE `Song` (
  `SONG_ID` int NOT NULL AUTO_INCREMENT,
  `Song_Typ` varchar(40),
  `Name` varchar(40),
  PRIMARY KEY (`SONG_ID`)
);

--
--
--

CREATE TABLE `Musik-Richtung`(
    `MURI_ID` int NOT NULL AUTO_INCREMENT,
    `Bezeichnung` varchar(40) DEFAULT NULL,
);
-- --------------------------------------------------------------------------------------------

CREATE TABLE `R_Mitglied_besitzt_eine_Rolle`(
`MITG_ID` int NOT NULL,
`ROLL_ID` int NOT NULL,
);





CREATE TABLE `R_Veranstaltung_wird_vorgeschlagen_von_Mitglied`(
`VERA_ID` int NOT NULL,
`MITG_ID` int NOT NULL,
);




CREATE TABLE `R_Veranstaltung_findet_statt_in_Bundesland`(
`VERA_ID` int NOT NULL,
`BULA_ID` int NOT NULL,
);




CREATE TABLE `R_Veranstaltung_findet_statt_in_Region`(
`VERA_ID` int NOT NULL,
`REGI_ID` int NOT NULL,
);




CREATE TABLE `R_Veranstaltung_findet_statt_in_Stadtteil`(
`VERA_ID` int NOT NULL,
`STTL_ID` int NOT NULL,
);




CREATE TABLE `R_Veranstaltung_findet_statt_in_Stadt`(
`VERA_ID` int NOT NULL,
`STDT_ID` int NOT NULL,
);




CREATE TABLE `R_Veranstaltung_findet_statt_in_Veranstaltungsort`(
`VERA_ID` int NOT NULL,
`VAOT_ID` int NOT NULL,
);




CREATE TABLE `R_Veranstaltung_hat_Preis-Typ`(
`VERA_ID` int NOT NULL,
`PRTP_ID` int NOT NULL,
);



CREATE `R_Veranstaltung_hat_Veranstaltungs-Typ`(
  `VERA_ID` int NOT NULL,
  `VETP_ID` int NOT NULL,
)



CREATE TABLE `R_Band_ist_Haupt/Vorgruppe_bei_Konzert`(
`VERA_ID` int NOT NULL,
`BAND_ID` int NOT NULL,
);





CREATE TABLE `R_Band_tritt_auf_bei_Festival`(
`VERA_ID` int NOT NULL,
`BAND_ID` int NOT NULL,
`Datum` date NOT NULL,
`Uhrzeit` time NOT NULL,
`Wochentag` varchar(40) DEFAULT NULL,
);




CREATE TABLE `R_Band_spielt_Musik-Richtung`(
`BAND_ID` int NOT NULL,
`Muri_ID` int NOT NULL,
);




CREATE TABLE `R_Band_hat_Song`(
`BAND_ID` int NOT NULL,
`SONG_ID` int NOT NULL,
);




CREATE TABLE `R_Musiker_spielt_in_Band`(
`BAND_ID` int NOT NULL,
`MUSI_ID` int NOT NULL,
);



-- --------------------------------------------------------------------------------------------

ALTER TABLE R_spielt_in_Musiker
ADD FOREIGN KEY (BAND_ID) REFERENCES Band(BAND_ID);

ALTER TABLE R_spielt_in_Musiker
ADD FOREIGN KEY (MUSI_ID) REFERENCES Musiker(MUSI_ID);
-- -----------

ALTER TABLE R_Band_hat_Song
ADD FOREIGN KEY (BAND_ID) REFERENCES Band(BAND_ID);

ALTER TABLE R_Band_hat_Song
ADD FOREIGN KEY (MUSI_ID) REFERENCES Musiker(MUSI_ID);

-- ----------

ALTER TABLE R_Band_spielt_Musik-Richtung
ADD FOREIGN KEY(BAND_ID) REFERENCES Band(BAND_ID);

ALTER TABLE R_Band_spielt_Musik-Richtung
ADD FOREIGN KEY (Muri_ID) REFERENCES Musiker(MUSI_ID);

-- ---------

ALTER TABLE R_Band_tritt_auf_bei_Festival
ADD FOREIGN KEY(VERA_ID) REFERENCES Festival(VERA_ID);

ALTER TABLE R_Band_tritt_auf_bei_Festival
ADD FOREIGN KEY(BAND_ID) REFERENCES Band(BAND_ID);

-- ---------

ALTER TABLE R_Band_ist_Haupt/Vorgruppe_bei_Konzert
ADD FOREIGN KEY(BAND_ID) REFERENCES Band(BAND_ID);

ALTER TABLE R_Band_ist_Haupt/Vorgruppe_bei_Konzert
ADD FOREIGN KEY(VERA_ID) REFERENCES Konzert(VERA_ID);

-- --------

ALTER TABLE R_Veranstaltung_hat_Preis-Typ
ADD FOREIGN KEY (VERA_IDD) REFERENCES Veranstaltung(VERA_ID);

ALTER TABLE R_Veranstaltung_hat_Preis-Typ
ADD FOREIGN KEY(PRTP_ID) REFERENCES Preis-Typ(PRTP_ID);

-- --------

ALTER TABLE R_Veranstaltung_hat_Veranstaltungs-Typ
ADD FOREIGN KEY(VERA_ID) REFERENCES Veranstaltung(VERA_ID);

ALTER TABLE R_Veranstaltung_hat_Veranstaltungs-Typ
ADD FOREIGN KEY(VETP_ID) REFERENCES Veranstaltungs-Typ(VETP_ID);

-- --------
ALTER TABLE R_Veranstaltung_findet_statt_in_Veranstaltungsort
ADD FOREIGN KEY(VERA_ID) REFERENCES Veranstaltung(VERA_ID);

ALTER TABLE R_Veranstaltung_findet_statt_in_Veranstaltungsort
ADD FOREIGN KEY(VAOT_ID) REFERENCES Veranstaltungsort(VAOT_ID);

-- -------

ALTER TABLE R_Veranstaltung_findet_statt_in_Stadt
ADD FOREIGN KEY(VERA_ID) REFERENCES Veranstaltung(VERA_ID);

ALTER TABLE R_Veranstaltung_findet_statt_in_Stadt
ADD FOREIGN KEY(STDT_ID) REFERENCES Stadt(STDT_ID);

-- -----

ALTER TABLE R_Veranstaltung_findet_statt_in_Stadtteil
ADD FOREIGN KEY(VER_ID) REFERENCES Veranstaltung(VERA_ID);

ALTER TABLE R_Veranstaltung_findet_statt_in_Stadtteil
ADD FOREIGN KEY(STTL_ID) REFERENCES Stadtteil(STTL_ID);

-- -----

ALTER TABLE R_Veranstaltung_findet_statt_in_Region
ADD FOREIGN KEY(VERA_ID) REFERENCES Veranstaltung(VERA_ID);

ALTER TABLE R_Veranstaltung_findet_statt_in_Region
ADD FOREIGN KEY(REGI_ID) REFERENCES Region(REGI_ID);

-- -----

ALTER TABLE R_Veranstaltung_findet_statt_in_Bundesland
ADD FOREIGN KEY(VERA_ID) REFERENCES Veranstaltung(VERA_ID);

ALTER TABLE R_Veranstaltung_findet_statt_in_Bundesland
ADD FOREIGN KEY(BULA_ID) REFERENCES Bundesland(BULA_ID);

-- -------

ALTER TABLE R_Veranstaltung_wird_vorgeschlagen_von_Mitglied
ADD FOREIGN KEY(VER_ID) REFERENCES Veranstaltung(VERA_ID)

ALTER TABLE R_Veranstaltung_wird_vorgeschlagen_von_Mitglied
ADD FOREIGN KEY(MITG_ID) REFERENCES Mitglied(MITG_ID);

-- -------

ALTER TABLE R_Mitglied_besitzt_eine_Rolle
ADD FOREIGN KEY(MITG_ID) REFERENCES Mitglied(MITG_ID);

ALTER TABLE R_Mitglied_besitzt_eine_Rolle
ADD FOREIGN KEY(ROLL_ID) REFERENCES Rolle(ROLL_ID);

-- --------------------------------------------------------------------------------------------
ALTER TABLE`Mitglied`
 ADD FOREIGN KEY (ROLL_ID) REFERENCES Rolle(ROLL_ID);

 
