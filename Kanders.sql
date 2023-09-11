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
-- Tabellenstruktur für Tabelle `Mitglied`
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
('Maxinum', 'Maximilian', 'Bich', '916', '2006-02-09', 'Männlich', 1);

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
  
  `Wochentag` varchar(40) NOT NULL,
  `Start-Uhrzeit` time NOT NULL,
  `Start-Datum` DATE NOT NULL,
 
  PRIMARY KEY (`VERA_ID`),

  -- FOREIGN KEY
  `PRTP_ID` int NOT NULL,
  `VETP_ID` int NOT NULL,
  `BULA_ID` int NOT NULL,
  `REGI_ID` int NOT NULL,
  `STTL_ID` int NOT NULL,
  `STDT_ID` int NOT NULL,
  `VAOT_ID` int NOT NULL
);

INSERT INTO `Veranstaltung` (`Preis`, `PRTP_ID`, `Wochentag`, `Start-Uhrzeit`, `Start-Datum`, `VETP_ID`, `BULA_ID`, `REGI_ID`, `STTL_ID`, `STDT_ID`, `VAOT_ID`) VALUES
('', 1, 'Sunday', '16:02:00', '2023-09-10', 0, 0, 0, 0, 0, 0);

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

INSERT INTO `Veranstaltungs-Typ`(`Bezeichnung`) VALUES
('Veranstaltungs-Tyo')
--
--
CREATE TABLE `Veranstaltungsort` (
  `VAOT_ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(40) DEFAULT NULL,
  
  PRIMARY KEY (`VAOT_ID`)
);

INSERT INTO `Veranstaltungsort` (`Name`) VALUES ('Schalander');
--
--
--

CREATE TABLE `Stadt` (
  `STDT_ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(40) NOT NULL,

  PRIMARY KEY (`STDT_ID`)
);



INSERT INTO `Stadt` (`Name`) VALUES
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

INSERT INTO `Stadtteil` (`Name`, `PLZ`) VALUES
('Unna', '5425')

--
--
--

CREATE TABLE `Region`(
  `REGI_ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(40) DEFAULT NULL,

  PRIMARY KEY(`REGI_ID`)
);

INSERT INTO`Region` (`Name`) VALUES 
('Keine Ahnung')

--
--
--

CREATE TABLE `Bundesland`(
    `BULA_ID` int NOT NULL AUTO_INCREMENT,
    `Name` varchar(40),

    PRIMARY KEY(`BULA_ID`)
);


INSERT INTO `Bundesland`(`Name`) VALUES
('NRW')
--
--
--

CREATE TABLE `Band` (
  `BAND_ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(40) NOT NULL,

  PRIMARY KEY (`BAND_ID`),
  -- FOREIGN KEY
  `VERA_ID` int NOT NULL,

  `MURI_ID` int NOT NULL,
  `MUSI_ID` int NOT NULL,
  `SONG_ID` int NOT NULL
);

INSERT INTO `Band` (`Name`, `VERA_ID`,  `MURI_ID` ,`MUSI_ID`, `SONG_ID`) VALUES
('Bring me the Horizon', 0, 0, 0, 0);

--
--
--

CREATE TABLE `Konzert`(
    `VERA_ID` int NOT NULL
);

--
--
--

CREATE TABLE `Festival`(
    `VERA_ID` int NOT NULL,
    `End-Datum` Date NOT NULL,
    `Ende-Uhrzeit` time NOT NUll,
    `Name` varchar(40) NOT NULL
);

--
--
--

CREATE TABLE `Musiker` (
  `MUSI_ID` int NOT NULL AUTO_INCREMENT,
  `Vorname` varchar(40) DEFAULT NULL,
  `Nachname` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`MUSI_ID`),
  -- FOREIGN KEY
  `BAND_ID` int NOT NULL
);

--
--
--

CREATE TABLE `Song` (
  `SONG_ID` int NOT NULL AUTO_INCREMENT,
  `Song_Typ` varchar(40),
  `Name` varchar(40),
  PRIMARY KEY (`SONG_ID`),
  -- FOREIGN KEY
  `BAND_ID` int NOT NULL
);

--
--
--

CREATE TABLE `Musik-Richtung`(
    `MURI_ID` int NOT NULL AUTO_INCREMENT,
    `Bezeichnung` varchar(40) DEFAULT NULL,

    PRIMARY KEY(`MURI_ID`),
    -- FOREIGN KEY
    `BAND_ID` int NOT NULL
);
-- --------------------------------------------------------------------------------------------

CREATE TABLE `R_Mitglied_besitzt_eine_Rolle`(
`MITG_ID` int NOT NULL,
`ROLL_ID` int NOT NULL
);





CREATE TABLE `R_Veranstaltung_wird_vorgeschlagen_von_Mitglied`(
`VERA_ID` int NOT NULL,
`MITG_ID` int NOT NULL
);




CREATE TABLE `R_Veranstaltung_findet_statt_in_Bundesland`(
`VERA_ID` int NOT NULL,
`BULA_ID` int NOT NULL
);




CREATE TABLE `R_Veranstaltung_findet_statt_in_Region`(
`VERA_ID` int NOT NULL,
`REGI_ID` int NOT NULL
);




CREATE TABLE `R_Veranstaltung_findet_statt_in_Stadtteil`(
`VERA_ID` int NOT NULL,
`STTL_ID` int NOT NULL
);




CREATE TABLE `R_Veranstaltung_findet_statt_in_Stadt`(
`VERA_ID` int NOT NULL,
`STDT_ID` int NOT NULL
);




CREATE TABLE `R_Veranstaltung_findet_statt_in_Veranstaltungsort`(
`VERA_ID` int NOT NULL,
`VAOT_ID` int NOT NULL
);




CREATE TABLE `R_Veranstaltung_hat_Preis-Typ`(
`VERA_ID` int NOT NULL,
`PRTP_ID` int NOT NULL
);



CREATE TABLE `R_Veranstaltung_hat_Veranstaltungs-Typ`(
  `VERA_ID` int NOT NULL,
  `VETP_ID` int NOT NULL
);



CREATE TABLE `R_Band_ist_Hauptgruppe_bei_Konzert`(
`VERA_ID` int NOT NULL,
`BAND_ID` int NOT NULL
);





CREATE TABLE `R_Band_ist_Vorgruppe_bei_Konzert`(
`VERA_ID` int NOT NULL,
`BAND_ID` int NOT NULL
);




CREATE TABLE `R_Band_tritt_auf_bei_Festival`(
`VERA_ID` int NOT NULL,
`BAND_ID` int NOT NULL,
`Datum` date NOT NULL,
`Uhrzeit` time NOT NULL,
`Wochentag` varchar(40) DEFAULT NULL
);




CREATE TABLE `R_Band_spielt_Musik-Richtung`(
`BAND_ID` int NOT NULL,
`MURI_ID` int NOT NULL
);




CREATE TABLE `R_Band_hat_Song`(
`BAND_ID` int NOT NULL,
`SONG_ID` int NOT NULL
);




CREATE TABLE `R_Musiker_spielt_in_Band`(
`BAND_ID` int NOT NULL,
`MUSI_ID` int NOT NULL
);



-- --------------------------------------------------------------------------------------------

ALTER TABLE R_Musiker_spielt_in_Band
ADD FOREIGN KEY (BAND_ID) REFERENCES Band(BAND_ID);

ALTER TABLE R_Musiker_spielt_in_Band
ADD FOREIGN KEY (MUSI_ID) REFERENCES Musiker(MUSI_ID);
-- -----------

ALTER TABLE R_Band_hat_Song
ADD FOREIGN KEY (BAND_ID) REFERENCES Band(BAND_ID);

ALTER TABLE R_Band_hat_Song
ADD FOREIGN KEY (SONG_ID) REFERENCES Song(SONG_ID);

-- ----------

ALTER TABLE `R_Band_spielt_Musik-Richtung`
ADD FOREIGN KEY(BAND_ID) REFERENCES Band(BAND_ID);

ALTER TABLE `R_Band_spielt_Musik-Richtung`
ADD FOREIGN KEY (MURI_ID) REFERENCES Musiker(MUSI_ID);

-- ---------



-- --------


-- --------
ALTER TABLE `R_Veranstaltung_hat_Preis-Typ`
ADD FOREIGN KEY (VERA_ID) REFERENCES Veranstaltung(VERA_ID);

ALTER TABLE `R_Veranstaltung_hat_Preis-Typ`
ADD FOREIGN KEY(PRTP_ID) REFERENCES `Preis-Typ`(PRTP_ID);

-- --------

ALTER TABLE `R_Veranstaltung_hat_Veranstaltungs-Typ`
ADD FOREIGN KEY(VERA_ID) REFERENCES Veranstaltung(VERA_ID);

ALTER TABLE `R_Veranstaltung_hat_Veranstaltungs-Typ`
ADD FOREIGN KEY(VETP_ID) REFERENCES `Veranstaltungs-Typ`(VETP_ID);

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
ADD FOREIGN KEY(VERA_ID) REFERENCES Veranstaltung(VERA_ID);

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
ADD FOREIGN KEY(VERA_ID) REFERENCES Veranstaltung(VERA_ID);

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





 ALTER TABLE `Veranstaltung`
 ADD FOREIGN KEY (PRTP_ID) REFERENCES `Preis-Typ`(PRTP_ID);

ALTER TABLE `Veranstaltung`
ADD FOREIGN KEY (VETP_ID) REFERENCES `Veranstaltungs-Typ`(VETP_ID);

 ALTER TABLE `Veranstaltung`
 ADD FOREIGN KEY(BULA_ID) REFERENCES Bundesland(BULA_ID);

 ALTER TABLE `Veranstaltung`
 ADD FOREIGN KEY(REGI_ID) REFERENCES Region(REGI_ID);

 ALTER TABLE `Veranstaltung`
 ADD FOREIGN KEY(STTL_ID) REFERENCES Stadtteil(STTL_ID);

 ALTER TABLE `Veranstaltung`
 ADD FOREIGN KEY(STDT_ID) REFERENCES Stadt(STDT_ID);

 ALTER TABLE `Veranstaltung`
 ADD FOREIGN KEY(VAOT_ID) REFERENCES Veranstaltungsort(VAOT_ID;)

 ALTER TABLE `Band`
 ADD FOREIGN KEY(MUSI_ID) REFERENCES Musiker(MUSI_ID);

 ALTER TABLE`Musiker`
 ADD FOREIGN KEY(BAND_ID) REFERENCES Band(BAND_ID);

 ALTER TABLE`Band`
 ADD FOREIGN KEY(SONG_ID) REFERENCES Song(SONG_ID);

 ALTER TABLE`Song`
 ADD FOREIGN KEY(BAND_ID) REFERENCES Band(BAND_ID);

 ALTER TABLE `Musik-Richtung`
 ADD FOREIGN KEY(BAND_ID) REFERENCES Band(BAND_ID);

 ALTER TABLE`Band`
 ADD FOREIGN KEY(MURI_ID) REFERENCES Musik-Richtung(MURI_ID);
