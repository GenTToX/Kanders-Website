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
  `E-Mail` varchar(64) DEFAULT NULL,
  `Geburtsdatum` DATE DEFAULT NULL,
  `Geschlecht` varchar(8) DEFAULT NULL,
  `Telefonnummer` varchar(20) DEFAULT NULL,
  `Strasse` varchar(54) DEFAULT NULL,
  `Hausummer` varchar(10) DEFAULT NULL,
  `Ort` varchar(26) DEFAULT NULL,
  `PLZ` varchar (5) DEFAULT NULL,
  
-- FOREIGN KEY
  `ROLL_ID` int NOT NULL,

  PRIMARY KEY (`MITG_ID`),

-- UNIQUE KEY
UNIQUE (Username)
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
  `Bezeichnung` varchar(20) NOT NULL,

  PRIMARY KEY (`ROLL_ID`),

  -- UNIQUE KEY
UNIQUE (Bezeichnung)
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
  `Einlass` time NOT NULL,
  `Start-Wochentag` varchar(40) NOT NULL,
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

INSERT INTO `Veranstaltung` (`Preis`, `Einlass`, `PRTP_ID`, `Start-Wochentag`, `Start-Uhrzeit`, `Start-Datum`, `VETP_ID`, `BULA_ID`, `REGI_ID`, `STTL_ID`, `STDT_ID`, `VAOT_ID`) VALUES
('','19:02:00', 1, 'Sunday', '16:02:00', '2023-09-10', 1, 1, 1, 1, 1, 1);

 --
 --
 --

 CREATE TABLE `Preis-Typ` (
  `PRTP_ID` int NOT NULL AUTO_INCREMENT,
  `Bezeichnung` varchar(11),

  PRIMARY KEY (`PRTP_ID`),

  -- UNIQUE KEY
UNIQUE (Bezeichnung)
);

INSERT INTO `Preis-Typ` (`Bezeichnung`) VALUES
('Normal'),
('Hutaktion');

--
--
--

CREATE TABLE `Veranstaltungs-Typ` (
 `VETP_ID` int NOT NULL AUTO_INCREMENT,
  `Bezeichnung` varchar(8),

  PRIMARY KEY (`VETP_ID`),

  -- UNIQUE KEY
UNIQUE (Bezeichnung)
);

INSERT INTO `Veranstaltungs-Typ`(`Bezeichnung`) VALUES
('VeranstaltungsTyp');

--
--
--

CREATE TABLE `Veranstaltungsort` (
  `VAOT_ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(64) DEFAULT NULL,
  
  PRIMARY KEY (`VAOT_ID`),

  -- UNIQUE KEY
UNIQUE (`Name`)
);

INSERT INTO `Veranstaltungsort` (`Name`) VALUES 
('Schalander');

--
--
--

CREATE TABLE `Stadt` (
  `STDT_ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(40) NOT NULL,

  PRIMARY KEY (`STDT_ID`),

  -- UNIQUE KEY
UNIQUE (`Name`)
);



INSERT INTO `Stadt` (`Name`) VALUES
('Unna');



--
--
--

CREATE TABLE `Stadtteil`(
  `STTL_ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(40) DEFAULT NULL,
  `PLZ` int (5) DEFAULT NULL,

  PRIMARY KEY(`STTL_ID`),

  -- UNIQUE KEY
UNIQUE (`Name`)
);

INSERT INTO `Stadtteil` (`Name`, `PLZ`) VALUES
('Unna', '5425');

--
--
--

CREATE TABLE `Region`(
  `REGI_ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(40) DEFAULT NULL,

  PRIMARY KEY(`REGI_ID`),

  -- UNIQUE KEY
UNIQUE (`Name`)
);

INSERT INTO`Region` (`Name`) VALUES 
('Keine Ahnung');

--
--
--

CREATE TABLE `Bundesland`(
    `BULA_ID` int NOT NULL AUTO_INCREMENT,
    `Name` varchar(22),

    PRIMARY KEY(`BULA_ID`),

    -- UNIQUE KEY
UNIQUE (`Name`)
);


INSERT INTO `Bundesland`(`Name`) VALUES
('NRW');

--
--
--

CREATE TABLE `Band` (
  `BAND_ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(40) NOT NULL,

  PRIMARY KEY (`BAND_ID`),

  -- UNIQUE KEY
UNIQUE (`Name`),
 
  -- FOREIGN KEY
  `MURI_ID` int NOT NULL,
  `MUSI_ID` int NOT NULL,
  `SONG_ID` int NOT NULL
);




INSERT INTO `Band` (`Name`,  `MURI_ID` ,`MUSI_ID`, `SONG_ID`) VALUES
('Bring me the Horizon', 1, 1, 1);

--
--
--

CREATE TABLE `Konzert`(
    `VERA_ID` int NOT NULL,
    PRIMARY key (`VERA_ID`),



    -- ----FOREIGN KEY
    `BAND_ID` int NOT NULL
);

--
--
--

CREATE TABLE `Festival`(
    `VERA_ID` int NOT NULL,
    `Ende-Datum` Date NOT NULL,
    `Ende-Uhrzeit` time NOT NUll,
    `Ende-Wochentag` varchar( ) NOT NULL,
  
    PRIMARY KEY (`VERA_ID`),



    -- --FOREIGN KEY
    `BAND_ID` int NOT NULL,
    `FSNM_ID` int NOT NULL

);

--
--
--

CREATE TABLE `Festival_Name`(
    `FSNM_ID` int NOT NULL AUTO_INCREMENT,
    `Name` varchar(40) NOT NULL,

    PRIMARY KEY(`FSNM_ID`),
    -- UNIQUE KEY
    UNIQUE (`Name`)
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

INSERT INTO `Musiker` (`Vorname`, `Nachname`, `BAND_ID`) VALUES
('Maximilian', 'Bich',1);

--
--
--

CREATE TABLE `Song` (
  `SONG_ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(40),
  PRIMARY KEY (`SONG_ID`),




  -- FOREIGN KEY
  `BAND_ID` int NOT NULL
);

INSERT INTO `Song` ( `Name`, `BAND_ID`) VALUES
( 'Bad Habbit', 1);


--
--
--

CREATE TABLE `Musik-Richtung`(
    `MURI_ID` int NOT NULL AUTO_INCREMENT,
    `Bezeichnung` varchar(40) DEFAULT NULL,

    PRIMARY KEY(`MURI_ID`),

    -- UNIQUE KEY
    UNIQUE (Bezeichnung),

    -- FOREIGN KEY
    `BAND_ID` int NOT NULL
);
INSERT INTO `Musik-Richtung`(`Bezeichnung`, `BAND_ID`) VALUES
('Heavy Metal', 1);


--
--
--

CREATE TABLE `Gueltieger_Ort`(
    `GORT_ID` int NOT NULL AUTO_INCREMENT,
    `Stadt` varchar(40) DEFAULT NULL,
    `Stadtteil` varchar(40) DEFAULT NULL,
    `Region` varchar(40) DEFAULT NULL,
    `Bundesland` varchar(40) DEFAULT NULL,

    PRIMARY KEY(`GORT_ID`),


    -- FOREIGN KEY
    `STDT_ID` int NOT NULL,
    `STTL_ID` int NOT NULL,
    `REGI_ID` int NOT NULL,
    `BULA_ID` int NOT NULL
);














-- --------------------------------------------------------------------------------------------



CREATE TABLE `R_Band_ist_Vorgruppe_bei_Konzert`(
`R_BVK_ID` int NOT NULL AUTO_INCREMENT,
`RBIVBK_ID` int NOT NULL,
`VERA_ID` int NOT NULL,
`BAND_ID` int NOT NULL,
 
PRIMARY KEY (`R_BVK_ID`),

-- UNIQUE KEY
UNIQUE (RBIVBK_ID)
);




CREATE TABLE `R_Band_tritt_auf_bei_Festival`(
`R_BAF_ID` int NOT NULL AUTO_INCREMENT,
`VERA_ID` int NOT NULL,
`BAND_ID` int NOT NULL,
`Datum` date NOT NULL,
`Uhrzeit` time NOT NULL,
`Wochentag` varchar(10) DEFAULT NULL,
`RTABF_ID` int NOT NULL,
PRIMARY KEY(`R_BAF_ID`),

-- UNIQUE KEY
UNIQUE (RTABF_ID)
);




CREATE TABLE `R_Band_hat_Song`(
`R_BHS_ID` int NOT NULL AUTO_INCREMENT,
`BAND_ID` int NOT NULL,
`SONG_ID` int NOT NULL,

PRIMARY KEY(`R_BHS_ID`)
);




CREATE TABLE `R_Musiker_spielt_in_Band`(
`R_MSB_ID` int NOT NULL AUTO_INCREMENT,
`BAND_ID` int NOT NULL,
`MUSI_ID` int NOT NULL,
PRIMARY KEY (`R_MSB_ID`)
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

ALTER TABLE R_Band_tritt_auf_bei_Festival
ADD FOREIGN KEY(VERA_ID) REFERENCES Festival(VERA_ID);

ALTER TABLE R_Band_tritt_auf_bei_Festival
ADD FOREIGN KEY(BAND_ID) REFERENCES Band(BAND_ID);


-- ---------

ALTER TABLE R_Band_ist_Vorgruppe_bei_Konzert
ADD FOREIGN KEY(BAND_ID) REFERENCES Band(BAND_ID);

ALTER TABLE R_Band_ist_Vorgruppe_bei_Konzert
ADD FOREIGN KEY(VERA_ID) REFERENCES Konzert(VERA_ID);



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
ADD FOREIGN KEY(VAOT_ID) REFERENCES Veranstaltungsort(VAOT_ID);

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
ADD FOREIGN KEY(MURI_ID) REFERENCES `Musik-Richtung`(MURI_ID);

ALTER TABLE `Festival`
ADD FOREIGN KEY(BAND_ID) REFERENCES Band(BAND_ID);

ALTER TABLE `Konzert`
ADD FOREIGN KEY(BAND_ID) REFERENCES Band(BAND_ID);

ALTER TABLE `Festival`
ADD FOREIGN KEY(FSNM_ID) REFERENCES `Festival-Name`(FSNM_ID);

-- ------------------------------------------------------------------------------------
