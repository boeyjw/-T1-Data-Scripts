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
	`taxonID` int unsigned NOT NULL default 0,
	`datasetID` char(36) NOT NULL default '',
	`parentNameUsageID` int unsigned default NULL,
	`acceptedNameUsageID` int unsigned default NULL,
	`originalNameUsageID` int unsigned default NULL,
	`scientificName` varchar(255) default NULL,
	`scientificNameAuthorship` varchar(255) default NULL,
	`canonicalName` varchar(255) default NULL,
	`genericName` varchar(255) default NULL,
	`specificEpithet` varchar(255) default NULL,
	`infraspecificEpithet` varchar(255) default NULL,
	`taxonRank` varchar(255) default NULL,
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

LOAD DATA LOCAL INFILE 'D:/Download Placement/backbone-current/taxon.txt'
	INTO TABLE `gbif_taxon`
	CHARACTER SET utf8mb4
	FIELDS TERMINATED BY '\t'
	LINES TERMINATED BY '\n'
	(`taxonID`, `datasetID`, @pnuid, @anuid, @onuid, @sn, @sna, @cn, @gn, @se, @ie, @tr, @nat, @npi, @ts, @ns, @kd, @pl, @cl, @orde, @fam, @gen, @tr)
	SET
	`parentNameUsageID` = nullif(@pnuid, ''),
	`acceptedNameUsageID` = nullif(@anuid, ''),
	`originalNameUsageID` = nullif(@onuid, ''),
	`scientificName` = nullif(@sn, ''),
	`scientificNameAuthorship` = nullif(@sna, ''),
	`canonicalName` = nullif(@cn, ''),
	`genericName` = nullif(@gn, ''),
	`specificEpithet` = nullif(@se, ''),
	`infraspecificEpithet` = nullif(@ie, ''),
	`taxonRank` = nullif(@tr, ''),
	`nameAccordingTo` = nullif(@nat, ''),
	`namePublishedIn` = nullif(@npi, ''),
	`taxonomicStatus` = nullif(@ts, ''),
	`nomenclaturalStatus` = nullif(@ns, ''),
	`kingdom` = nullif(@kd, ''),
	`phylum` = nullif(@pl, ''),
	`class` = nullif(@cl, ''),
	`order` = nullif(@orde, ''),
	`family` = nullif(@fam, ''),
	`genus` = nullif(@gen, ''),
	`taxonRemarks` = nullif(@tr, '');
COMMIT;

SELECT 'Inserted gbif_taxon' as '';

ALTER TABLE `gbif_taxon` ADD CONSTRAINT `pk-coreID` PRIMARY KEY (`taxonID`);
COMMIT;

SELECT 'gbif_taxon INDEXED' as '';

#reference.txt
CREATE TABLE `gbif_reference` (
	`taxonID` int unsigned NOT NULL default 0,
	`bibliographicCitation` varchar(255) NOT NULL default '',
	`references` varchar(255) default NULL,
	`source` varchar(255) default NULL,
	`identifier` varchar(255) default NULL
);

LOAD DATA LOCAL INFILE 'D:/Download Placement/backbone-current/reference.txt'
	INTO TABLE `gbif_reference`
	CHARACTER SET utf8mb4
	FIELDS TERMINATED BY '\t'
	LINES TERMINATED BY '\n'
	(`taxonID`, `bibliographicCitation`, @refe, @src, @id)
	SET
	`references` = nullif(@refe, ''),
	`source` = nullif(@src, ''),
	`identifier` = nullif(@id, '');
COMMIT;

SELECT 'Inserted gbif_reference' as '';

ALTER TABLE `gbif_reference` ADD CONSTRAINT `fk-coreID-reference` FOREIGN KEY (`taxonID`) REFERENCES `gbif_taxon`(`taxonID`);
COMMIT;

SELECT 'gbif_reference INDEXED'as '';
	
#multimedia.txt
CREATE TABLE `gbif_multimedia` (
	`taxonID` int unsigned NOT NULL default 0,
	`license` varchar(255) default NULL,
	`rightsHolder` varchar(255) default NULL,
	`creator` varchar(255) default NULL,
	`references` varchar(255) NOT NULL default '',
	`contributor` varchar(255) default NULL,
	`source` varchar(255) default NULL,
	`identifier` varchar(255) default NULL,
	`created` varchar(255) default NULL,
	`title` varchar(255) default NULL,
	`publisher` varchar(255) default NULL,
	`description` varchar(255) default NULL
);

LOAD DATA LOCAL INFILE 'D:/Download Placement/backbone-current/multimedia.txt'
	INTO TABLE `gbif_multimedia`
	CHARACTER SET utf8mb4
	FIELDS TERMINATED BY '\t'
	LINES TERMINATED BY '\n'
	(`taxonID`, @lc, @rh, @crtr, `references`, @cont, @src, @id, @crtd, @tt, @pub, @descr)
	SET
	`license` = nullif(@lc, ''),
	`rightsHolder` = nullif(@rh, ''),
	`creator` = nullif(@crtr, ''),
	`contributor` = nullif(@cont, ''),
	`source` = nullif(@src, ''),
	`identifier` = nullif(@id, ''),
	`created` = nullif(@crtd, ''),
	`title` = nullif(@tt, ''),
	`publisher` = nullif(@pub, ''),
	`description` = nullif(@descr, '');
COMMIT;

SELECT 'Inserted gbif_multimedia:' as '';

ALTER TABLE `gbif_multimedia` ADD CONSTRAINT `fk-coreID-multimedia` FOREIGN KEY (`taxonID`) REFERENCES `gbif_taxon`(`taxonID`);
COMMIT;

SELECT 'gbif_multimedia INDEXED' as '';
	
#vernacularname.txt
CREATE TABLE `gbif_vernacularname` (
	`taxonID` int unsigned NOT NULL default 0,
	`sex` varchar(255) default NULL,
	`lifeStage` varchar(255) default NULL,
	`source` varchar(255) default NULL,
	`vernacularName` varchar(255) NOT NULL default '',
	`language` varchar(255) default NULL,
	`country` varchar(255) default NULL,
	`countryCode` varchar(255) default NULL
);

LOAD DATA LOCAL INFILE 'D:/Download Placement/backbone-current/vernacularname.txt'
	INTO TABLE `gbif_vernacularname`
	CHARACTER SET utf8mb4
	FIELDS TERMINATED BY '\t'
	LINES TERMINATED BY '\n'
	(`taxonID`, @sx, @ls, @src, `vernacularName`, @lang, @ct, @cc)
	SET
	`sex` = nullif(@sx, ''),
	`lifeStage` = nullif(@ls, ''),
	`source` = nullif(@src, ''),
	`language` = nullif(@lang, ''),
	`country` = nullif(@ct, ''),
	`countryCode` = nullif(@cc, '');
COMMIT;

SELECT 'Inserted gbif_vernacularname' as '';

ALTER TABLE `gbif_vernacularname` ADD CONSTRAINT `fk-coreID-vernacularname` FOREIGN KEY (`taxonID`) REFERENCES `gbif_taxon`(`taxonID`);
COMMIT;

SELECT 'gbif_vernacularname INDEXED' as '';
	
#distribution.txt
CREATE TABLE `gbif_distribution` (
	`taxonID` int unsigned NOT NULL default 0,
	`threatStatus` varchar(255) default NULL,
	`establishmentMeans` varchar(255) default NULL,
	`lifeStage` varchar(255) default NULL,
	`source` varchar(255) NOT NULL default '',
	`country` varchar(255) default NULL,
	`occuranceStatus` varchar(255) default NULL,
	`countryCode` varchar(255) default NULL,
	`locationID` varchar(255) default NULL,
	`locality` varchar(255) default NULL,
	`locationRemarks` varchar(255) default NULL
);

LOAD DATA LOCAL INFILE 'D:/Download Placement/backbone-current/distribution.txt'
	INTO TABLE `gbif_distribution`
	CHARACTER SET utf8mb4
	FIELDS TERMINATED BY '\t'
	LINES TERMINATED BY '\n'
	(`taxonID`, @ts, @em, @ls, `source`, @ct, @os, @cc, @lid, @lc, @lr)
	SET
	`threatStatus` = nullif(@ts, ''),
	`establishmentMeans` = nullif(@em, ''),
	`lifeStage` = nullif(@ls, ''),
	`country` = nullif(@ct, ''),
	`occuranceStatus` = nullif(@os, ''),
	`countryCode` = nullif(@cc, ''),
	`locationID` = nullif(@lid, ''),
	`locality` = nullif(@lc, ''),
	`locationRemarks` = nullif(@lr, '');
COMMIT;

SELECT 'Inserted gbif_distribution' as '';

ALTER TABLE `gbif_distribution` ADD CONSTRAINT `fk-coreID-distribution` FOREIGN KEY (`taxonID`) REFERENCES `gbif_taxon`(`taxonID`);
COMMIT;

SELECT 'gbif_distribution INDEXED' as '';

#Echo whole table
SELECT table_name, TABLE_ROWS FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = (SELECT DATABASE());

SET autocommit = 1;
SET unique_checks = 1;
SET foreign_key_checks = 1;

SELECT 'SET reset' as '';