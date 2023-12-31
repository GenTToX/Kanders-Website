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
  `E_Mail` varchar(64) DEFAULT NULL,
  `Geburtsdatum` DATE DEFAULT NULL,
  `Geschlecht` varchar(8) DEFAULT NULL,
  `Telefonnummer` varchar(20) DEFAULT NULL,
  `Strasse` varchar(54) DEFAULT NULL,
  `Hausummer` varchar(10) DEFAULT NULL,
  `Ort` varchar(26) DEFAULT NULL,
  `PLZ` varchar (5) DEFAULT NULL,
  `Spitzname` varchar(64) DEFAULT NULL,
  
-- FOREIGN KEY
  `ROLL_ID` int NOT NULL,

  PRIMARY KEY (`MITG_ID`),

-- UNIQUE KEY
UNIQUE (Username)
);

--
--
--

INSERT INTO `Mitglied` (`Username`, `Vorname`, `Nachname`, `Passwort`, `Geburtsdatum`, `Geschlecht`, `ROLL_ID`, `E_Mail`, `Telefonnummer`, `Strasse`, `Hausummer`, `Ort`, `PLZ`, `Spitzname`) VALUES
(`Maxinum916`, `Maxi`, `Bich`, `916`, `2006-02-09`, `Männlich`, `1`, `Maximilianbich10@gmail.com`, `+49 123 456789`, `Frankfurter Str`, 4, `UNNA`, `59425`, `Maxi`);

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
  `Start_Wochentag` varchar(40) NOT NULL,
  `Start_Uhrzeit` time NOT NULL,
  `Start_Datum` DATE NOT NULL,
 
  PRIMARY KEY (`VERA_ID`),



  -- FOREIGN KEY
  `PRTP_ID` int NOT NULL,
  `VETP_ID` int NOT NULL,
  `VAOT_ID` int NOT NULL,

  `GORT_ID` int NOT NULL,
  'MITG_ID' int NOT NULL
);

INSERT INTO `Veranstaltung` (`Preis`, `Einlass`, `PRTP_ID`, `Start_Wochentag`, `Start_Uhrzeit`, `Start_Datum`, `VETP_ID`, `VAOT_ID`,  `GORT_ID`, 'MITG_ID') VALUES
('12.50','19:02:00', 1, 'Sunday', '16:02:00', '2023-09-10', 1, 1, 1, 1);


 -- --- hier mus noch sachen rein rein

 --
 --
 --

 CREATE TABLE `Preis_Typ` (
  `PRTP_ID` int NOT NULL AUTO_INCREMENT,
  `Bezeichnung` varchar(11),

  PRIMARY KEY (`PRTP_ID`),

  -- UNIQUE KEY
UNIQUE (Bezeichnung)
);

INSERT INTO `Preis_Typ` (`Bezeichnung`) VALUES
('Normal'),
('kein preis gegeben'),
('Eintritt frei'),
('Hutaktion');


--
--
--

CREATE TABLE `Veranstaltungs_Typ` (
 `VETP_ID` int NOT NULL AUTO_INCREMENT,
  `Bezeichnung` varchar(8),

  PRIMARY KEY (`VETP_ID`),

  -- UNIQUE KEY
UNIQUE (Bezeichnung)
);

INSERT INTO `Veranstaltungs_Typ`(`Bezeichnung`) VALUES
('Konzert'),
('Festival');

--
--
--

CREATE TABLE `Veranstaltungsort` (
  `VAOT_ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(64) DEFAULT NULL,
  `PLZ` varchar(64) DEFAULT NULL,
  `Starasse` varchar(64) DEFAULT NULL,
  `Hausnummer` varchar(64) DEFAULT NULL,

 -- --- hier mus noch strassennamen Hausnummern und die plz rein   `PLZ` int (5) DEFAULT NULL, 
  
  PRIMARY KEY (`VAOT_ID`),

  -- UNIQUE KEY
UNIQUE (`Name`)
);


INSERT INTO `Veranstaltungsort` (`Name`, 'PLZ', 'Strasse', 'Hausnummer') VALUES 
('Mitsubishi-Halle', NULL, NULL, NULL),
('AKKA', NULL, NULL, NULL),
('Piano', NULL, NULL, NULL),
('Stadtschenke', NULL, NULL, NULL),
('Kump', NULL, NULL, NULL),
('Ablüh', NULL, NULL, NULL),
('Turbinenhalle', NULL, NULL, NULL),
('Rockmusikverein', NULL, NULL, NULL),
('Westfalenhalle', NULL, NULL, NULL);


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
('Unna'),
('Paderborn'),
('Dortmund'),
('Brilon'),
('Masberg'),
('Oberhausen'),
('Salzkotten'),
('Düsseldorf');



--
--
--

CREATE TABLE `Stadtteil`(
  `STTL_ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(40) DEFAULT NULL,

  PRIMARY KEY(`STTL_ID`),

  -- UNIQUE KEY
UNIQUE (`Name`)
);

INSERT INTO `Stadtteil` (`Name`) VALUES

('Westheim');


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
(NULL);

-- --- Hier muss noch die richtige region eingetragen werden für die gueltigen orte.
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

(NULL);

-- --- Alle bundeländer müssen noch rausgefunden werden !!!
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
  `MURI_ID` int NULL,
  `MUSI_ID` int NULL,
  `SONG_ID` int NULL
);


-- bezihungstabellen machen und das `MURI_ID` ,`MUSI_ID`, `SONG_ID` ändern

INSERT INTO `Band` (`Name`,  `MURI_ID` ,`MUSI_ID`, `SONG_ID`) VALUES
('Trivium', NULL, NULL, NULL),
('Heaven Shall Burn', NULL, NULL, NULL),
('Open Range', NULL, NULL, NULL),
('Stairway To Heaven', NULL, NULL, NULL),;
('Rock-Party', NULL, NULL, NULL),
('Supersonic Baby', NULL, NULL, NULL),
('Fido Plays Zappa', NULL, NULL, NULL),
('Bad Moon', NULL, NULL, NULL),
('Alle Außer Ich', NULL, NULL, NULL),
('Markuz Walach', NULL, NULL, NULL),
("Fiddler's Green", NULL, NULL, NULL),
("Begbie's Pint", NULL, NULL, NULL)
('Bukahara', NULL, NULL, NULL);


-- " ' " testen und kanders sagen 


--
--
--

CREATE TABLE `Konzert`(
    `VERA_ID` int NOT NULL,
    PRIMARY key (`VERA_ID`),



    -- ----FOREIGN KEY
    `BAND_ID` int NOT NULL
);


INSERT INTO `Konzert` (`BAND_ID`) VALUES
(1);
--
--
--

CREATE TABLE `Festival`(
    `VERA_ID` int (11) NOT NULL,
    `Ende_Datum` Date NOT NULL,
    `Ende_Uhrzeit` time NOT NUll,
    `Ende_Wochentag` varchar(10) NOT NULL,
  
    PRIMARY KEY (`VERA_ID`),



    -- --FOREIGN KEY
    `BAND_ID` int NOT NULL,
    `FSNM_ID` int NOT NULL

);

-- bEZIHUNGSTABELLE MACHEN und verknüpfen

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



INSERT INTO `Festival_Name` (`name`) VALUES
('Noch nicht gegeben');

-- --- hier müssen die namen noch eingetragen werden !!!


--
--
--

CREATE TABLE `Musiker` (
  `MUSI_ID` int NOT NULL AUTO_INCREMENT,
  `Vorname` varchar(40) DEFAULT NULL,
  `Nachname` varchar(40) DEFAULT NULL,
  `Kuenstlername` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`MUSI_ID`),


  -- FOREIGN KEY
  `BAND_ID` int NOT NULL
);

INSERT INTO `Musiker` (`Vorname`, `Nachname`, `BAND_ID`,`Kuenstlername` ) VALUES
('Maximilian', 'Bich',1, NUll);

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

CREATE TABLE `Musik_Richtung`(
    `MURI_ID` int NOT NULL AUTO_INCREMENT,
    `Bezeichnung` varchar(40) DEFAULT NULL,

    PRIMARY KEY(`MURI_ID`),

    -- UNIQUE KEY
    UNIQUE (Bezeichnung),

    -- FOREIGN KEY
    `BAND_ID` int NOT NULL
);
INSERT INTO `Musik_Richtung`(`Bezeichnung`, `BAND_ID`) VALUES
('Heavy Metal', 1);


--
--
--

CREATE TABLE `Gueltieger_Ort`(
    `GORT_ID` int NOT NULL AUTO_INCREMENT,

    PRIMARY KEY(`GORT_ID`),


    -- FOREIGN KEY
    `STDT_ID` int NOT NULL,
    `STTL_ID` int NOT NULL,
    `REGI_ID` int NOT NULL,
    `BULA_ID` int NOT NULL
);

-- --- die orte müssen miteinander verknüpf weden !!!












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

-- --- die sachen müssen miteinander verknüpf weden !!!


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


-- --- die sachen müssen miteinander verknüpf weden !!!

CREATE TABLE `R_Band_hat_Song`(
`R_BHS_ID` int NOT NULL AUTO_INCREMENT,
`BAND_ID` int NOT NULL,
`SONG_ID` int NOT NULL,

PRIMARY KEY(`R_BHS_ID`)
);

-- --- die sachen müssen miteinander verknüpf weden !!!


CREATE TABLE `R_Musiker_spielt_in_Band`(
`R_MSB_ID` int NOT NULL AUTO_INCREMENT,
`BAND_ID` int NOT NULL,
`MUSI_ID` int NOT NULL,
PRIMARY KEY (`R_MSB_ID`)
);

-- --- die sachen müssen miteinander verknüpf weden !!!



CREATE TABLE `R_Band_ist_Vorgruppe_bei_Konzert`(
`R_BVK_ID` int NOT NULL AUTO_INCREMENT,
`RBIVBK_ID` int NOT NULL,
`VERA_ID` int NOT NULL,
`BAND_ID` int NOT NULL,
 
PRIMARY KEY (`R_BVK_ID`),

-- UNIQUE KEY
UNIQUE (RBIVBK_ID)
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
ADD FOREIGN KEY (PRTP_ID) REFERENCES `Preis_Typ`(PRTP_ID);

ALTER TABLE `Veranstaltung`
ADD FOREIGN KEY (PRTP_ID) REFERENCES `Preis_Typ`(PRTP_ID);

ALTER TABLE `Veranstaltung`
ADD FOREIGN KEY (MITG_ID) REFERENCES `Mitglied`(MITG_ID);

ALTER TABLE `Veranstaltung`
ADD FOREIGN KEY (GORT_ID) REFERENCES `Gueltiger_Ort`(GORT_ID);

ALTER TABLE `Veranstaltung`
ADD FOREIGN KEY (GORT_ID) REFERENCES `Gueltiger_Ort`(GORT_ID);

ALTER TABLE `Gueltieger_Ort`
ADD FOREIGN KEY(BULA_ID) REFERENCES Bundesland(BULA_ID);

ALTER TABLE `Gueltieger_Ort`
ADD FOREIGN KEY(REGI_ID) REFERENCES Region(REGI_ID);

ALTER TABLE `Gueltieger_Ort`
ADD FOREIGN KEY(STTL_ID) REFERENCES Stadtteil(STTL_ID);

ALTER TABLE `Gueltieger_Ort`
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
                                                        
ALTER TABLE `Musik_Richtung`
ADD FOREIGN KEY(BAND_ID) REFERENCES Band(BAND_ID);

ALTER TABLE`Band`
ADD FOREIGN KEY(MURI_ID) REFERENCES `Musik_Richtung`(MURI_ID);

ALTER TABLE `Festival`
ADD FOREIGN KEY(BAND_ID) REFERENCES Band(BAND_ID);

ALTER TABLE `Konzert`
ADD FOREIGN KEY(BAND_ID) REFERENCES Band(BAND_ID);

ALTER TABLE `Festival`
ADD FOREIGN KEY(FSNM_ID) REFERENCES `Festival_Name`(FSNM_ID);

-- ------------------------------------------------------------------------------------
