CREATE TABLE `Università de La Laguna`(
    `id` INT UNSIGNED NULL AUTO_INCREMENT PRIMARY KEY,
    `Indirizzo` CHAR(255) NULL COMMENT 'char(255)',
    `N_tel` INT UNSIGNED NULL COMMENT 'not_null',
    `web_site` INT NULL COMMENT 'not_null',
    `Impiegati` CHAR(255) NULL,
    `Studenti` CHAR(255) NULL
);
CREATE TABLE `Dipartimanti`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Nome_Dipartimento` CHAR(255) NULL COMMENT 'Nome del corso universitario
not_null',
    `Descrizione` VARCHAR(255) NOT NULL COMMENT 'Descrizione corso universitario
Null'
);
CREATE TABLE `Corsi di laurea`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Nome corso` CHAR(255) NULL,
    `Descrizione` VARCHAR(255) NOT NULL,
    `Docenti` CHAR(255) NULL,
    `Appelli` DATE NOT NULL
);
CREATE TABLE `Data Impiegati`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Nome` CHAR(255) NULL,
    `Cognome` CHAR(255) NULL,
    `Data_nascita` DATE NOT NULL,
    `Nazionalità` CHAR(255) NOT NULL,
    `Tel` INT NOT NULL,
    `Indirizzo` CHAR(255) NOT NULL,
    `Ruolo` CHAR(255) NOT NULL,
    `Stipendio` MEDIUMINT NOT NULL,
    `Conto_accredito_stipendio` CHAR(255) NOT NULL,
    `anno_assunzione` DATE NOT NULL
);
CREATE TABLE `Data Studenti`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Nome` CHAR(255) NULL,
    `Cognome` CHAR(255) NULL,
    `Data di nascita` DATE NOT NULL,
    `Nazionalità` CHAR(255) NOT NULL,
    `Indirizzo` CHAR(255) NOT NULL,
    `Telefono` INT NOT NULL,
    `Tip_Documento` CHAR(255) NOT NULL,
    `Numero_Documento` CHAR(255) NOT NULL,
    `Corso di Laurea` CHAR(255) NOT NULL,
    `Anno_Laurea` DATE NOT NULL,
    `anno_iscrizione` DATE NOT NULL,
    `Pagella` INT NOT NULL COMMENT 'Numero esami dati'
);
CREATE TABLE `Nazionalità`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Italia` CHAR(255) NOT NULL,
    `Francia` CHAR(255) NOT NULL,
    `Spagna` CHAR(255) NOT NULL
);
CREATE TABLE `Ruolo`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Contabile` TINYINT(1) NULL,
    `Docente` TINYINT(1) NULL,
    `Pulizie` TINYINT(1) NULL,
    `Elettricista` TINYINT(1) NOT NULL,
    `Idraulico` TINYINT(1) NOT NULL,
    `Informatico` TINYINT(1) NOT NULL
);
CREATE TABLE `Data Esami`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Data` DATE NOT NULL,
    `Presenza` TINYINT(1) NOT NULL,
    `Voto` TINYINT NOT NULL,
    `Passato_O_No` TINYINT(1) NOT NULL
);
ALTER TABLE
    `Università de La Laguna` ADD CONSTRAINT `università de la laguna_impiegati_foreign` FOREIGN KEY(`Impiegati`) REFERENCES `Data Impiegati`(`id`);
ALTER TABLE
    `Università de La Laguna` ADD CONSTRAINT `università de la laguna_studenti_foreign` FOREIGN KEY(`Studenti`) REFERENCES `Data Studenti`(`id`);
ALTER TABLE
    `Dipartimanti` ADD CONSTRAINT `dipartimanti_nome_dipartimento_foreign` FOREIGN KEY(`Nome_Dipartimento`) REFERENCES `Università de La Laguna`(`id`);
ALTER TABLE
    `Dipartimanti` ADD CONSTRAINT `dipartimanti_nome_dipartimento_foreign` FOREIGN KEY(`Nome_Dipartimento`) REFERENCES `Corsi di laurea`(`id`);
ALTER TABLE
    `Corsi di laurea` ADD CONSTRAINT `corsi di laurea_appelli_foreign` FOREIGN KEY(`Appelli`) REFERENCES `Data Esami`(`id`);
ALTER TABLE
    `Data Impiegati` ADD CONSTRAINT `data impiegati_nazionalità_foreign` FOREIGN KEY(`Nazionalità`) REFERENCES `Nazionalità`(`id`);
ALTER TABLE
    `Data Impiegati` ADD CONSTRAINT `data impiegati_ruolo_foreign` FOREIGN KEY(`Ruolo`) REFERENCES `Ruolo`(`id`);
ALTER TABLE
    `Data Studenti` ADD CONSTRAINT `data studenti_nazionalità_foreign` FOREIGN KEY(`Nazionalità`) REFERENCES `Nazionalità`(`id`);
ALTER TABLE
    `Data Studenti` ADD CONSTRAINT `data studenti_pagella_foreign` FOREIGN KEY(`Pagella`) REFERENCES `Data Esami`(`id`);