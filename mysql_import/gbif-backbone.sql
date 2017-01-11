SET autocommit = 0;
SET unique_checks = 0;
SET foreign_key_checks = 0;

SELECT 'SET Initialised' as '';

#Drop any table with same names in foreign key order
DROP TABLE IF EXISTS `gbif_reference`;
DROP TABLE IF EXISTS `gbif_multimedia`;
DROP TABLE IF EXISTS `gbif_vernacularname`;
DROP TABLE IF EXISTS `gbif_distribution`;
DROP TABLE IF EXISTS `gbif_taxon`;

#taxon.txt
CREATE TABLE `gbif_taxon` (
	`coreID` int unsigned NOT NULL default '0',
	`taxonID` int unsigned NOT NULL default '0',
	`datasetID` char(36) NOT NULL default '',
	`parentNameUsageID` int unsigned default NULL,
	`acceptedNameUsageID` int unsigned default NULL,
	`scientificName` varchar(255) NOT NULL default '',
	`taxonRank` varchar(255) NOT NULL default '',
	`nameAccordingTo` varchar(255) default NULL,
	`namePublishedIn` varchar(255) default NULL,
	`taxonomicStatus` varchar(255) default NULL,
	`nomenclaturalStatus` varchar(255) default NULL,
	`kingdom` varchar(255) default NULL,
	`phylum` varchar(255) default NULL,
	`class` varchar(255) default NULL,
	`order` varchar(255) default NULL,
	`family` varchar(255) default NULL,
	`genus` varchar(255) default NULL,
	`taxonRemarks` varchar(255) default NULL
);

LOAD DATA LOCAL INFILE '/var/lib/mysql-files/taxon.txt'
	INTO TABLE `gbif_taxon`
	CHARACTER SET utf8mb4
	FIELDS TERMINATED BY '\t'
	LINES TERMINATED BY '\n';
COMMIT;

SELECT 'Inserted gbif_taxon' as '';

ALTER TABLE `gbif_taxon` ADD CONSTRAINT `pk-coreID` PRIMARY KEY (`coreID`);
COMMIT;

SELECT 'gbif_taxon INDEXED' as '';

#references.txt
CREATE TABLE `gbif_reference` (
	`coreID` int unsigned NOT NULL default '0',
	`bibliographicCitation` varchar(255) NOT NULL default '',
	`references` varchar(255) default NULL,
	`source` varchar(255) default NULL,
	`identifier` varchar(255) default NULL
);

LOAD DATA LOCAL INFILE '/var/lib/mysql-files/reference.txt'
	INTO TABLE `gbif_reference`
	CHARACTER SET utf8mb4
	FIELDS TERMINATED BY '\t'
	LINES TERMINATED BY '\n';
COMMIT;

SELECT 'Inserted gbif_reference' as '';

ALTER TABLE `gbif_reference` ADD CONSTRAINT `fk-coreID-reference` FOREIGN KEY (`coreID`) REFERENCES `gbif_taxon`(`coreID`);
COMMIT;

SELECT 'gbif_reference INDEXED'as '';
	
#multimedia.txt
CREATE TABLE `gbif_multimedia` (
	`coreID` int unsigned NOT NULL default '0',
	`references` varchar(255) NOT NULL default '',
	`description` varchar(255) default NULL,
	`title` varchar(255) default NULL,
	`contributor` varchar(255) default NULL,
	`source` varchar(255) default NULL,
	`created` varchar(255) default NULL,
	`license` varchar(255) default NULL,
	`identifier` varchar(255) default NULL,
	`creator` varchar(255) default NULL,
	`publisher` varchar(255) default NULL,
	`rightsHolder` varchar(255) default NULL
);

LOAD DATA LOCAL INFILE '/var/lib/mysql-files/multimedia.txt'
	INTO TABLE `gbif_multimedia`
	CHARACTER SET utf8mb4
	FIELDS TERMINATED BY '\t'
	LINES TERMINATED BY '\n';
COMMIT;

SELECT 'Inserted gbif_multimedia:' as '';

ALTER TABLE `gbif_multimedia` ADD CONSTRAINT `fk-coreID-multimedia` FOREIGN KEY (`coreID`) REFERENCES `gbif_taxon`(`coreID`);
COMMIT;

SELECT 'gbif_multimedia INDEXED' as '';
	
#vernacularname.txt
CREATE TABLE `gbif_vernacularname` (
	`coreID` int unsigned NOT NULL default '0',
	`vernacularName` varchar(255) NOT NULL default '',
	`source` varchar(255) default NULL,
	`sex` varchar(255) default NULL,
	`lifeStage` varchar(255) default NULL,
	`language` varchar(255) default NULL,
	`countryCode` varchar(255) default NULL,
	`country` varchar(255) default NULL
);

LOAD DATA LOCAL INFILE '/var/lib/mysql-files/vernacularname.txt'
	INTO TABLE `gbif_vernacularname`
	CHARACTER SET utf8mb4
	FIELDS TERMINATED BY '\t'
	LINES TERMINATED BY '\n';
COMMIT;

SELECT 'Inserted gbif_vernacularname' as '';

ALTER TABLE `gbif_vernacularname` ADD CONSTRAINT `fk-coreID-vernacularname` FOREIGN KEY (`coreID`) REFERENCES `gbif_taxon`(`coreID`);
COMMIT;

SELECT 'gbif_vernacularname INDEXED' as '';
	
#distribution.txt
CREATE TABLE `gbif_distribution` (
	`coreID` int unsigned NOT NULL default '0',
	`source` varchar(255) NOT NULL default '',
	`threatStatus` varchar(255) default NULL,
	`locality` varchar(255) default NULL,
	`lifeStage` varchar(255) default NULL,
	`occuranceStatus` varchar(255) default NULL,
	`locationID` varchar(255) default NULL,
	`locationRemarks` varchar(255) default NULL,
	`establishmentMeans` varchar(255) default NULL,
	`countryCode` varchar(255) default NULL,
	`country` varchar(255) default NULL
);

LOAD DATA LOCAL INFILE '/var/lib/mysql-files/distribution.txt'
	INTO TABLE `gbif_distribution`
	CHARACTER SET utf8mb4
	FIELDS TERMINATED BY '\t'
	LINES TERMINATED BY '\n';
COMMIT;

SELECT 'Inserted gbif_distribution' as '';

ALTER TABLE `gbif_distribution` ADD CONSTRAINT `fk-coreID-distribution` FOREIGN KEY (`coreID`) REFERENCES `gbif_taxon`(`coreID`);
COMMIT;

SELECT 'gbif_distribution INDEXED' as '';

#Echo whole table
SELECT table_name, TABLE_ROWS FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = (SELECT DATABASE());

SET autocommit = 1;
SET unique_checks = 1;
SET foreign_key_checks = 1;

SELECT 'SET reset' as '';