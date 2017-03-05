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
	`datasetID` varchar(50) default NULL,
	`parentNameUsageID` int unsigned default NULL,
	`acceptedNameUsageID` int unsigned default NULL,
	`originalNameUsageID` int unsigned default NULL,
	`scientificName` text default NOT NULL,
	`scientificNameAuthorship` varchar(255) default NULL,
	`canonicalName` varchar(255) default NOT NULL,
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
	`taxonRemarks` text default NULL
);

LOAD DATA LOCAL INFILE 'D:/Download Placement/backbone-current/taxon.txt'
	INTO TABLE `gbif_taxon`
	CHARACTER SET utf8mb4
	FIELDS TERMINATED BY '\t'
	LINES TERMINATED BY '\n'
	(`taxonID`, @dtid, @pnuid, @anuid, @onuid, @sn, @sna, @cn, @gn, @se, @ie, @tr, @nat, @npi, @ts, @ns, @kd, @pl, @cl, @orde, @fam, @gen, @tre)
	SET
	`datasetID` = nullif(@dtid, ''),
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
	`taxonRemarks` = nullif(@tre, '');
COMMIT;

SELECT 'Inserted gbif_taxon' as '';

#reference.txt
CREATE TABLE `gbif_reference` (
	`taxonID` int unsigned NOT NULL default 0,
	`bibliographicCitation` text default NULL,
	`reference` varchar(255) default NULL,
	`source` varchar(255) default NULL,
	`identifier` varchar(255) default NULL
);

LOAD DATA LOCAL INFILE 'D:/Download Placement/backbone-current/reference.txt'
	INTO TABLE `gbif_reference`
	CHARACTER SET utf8mb4
	FIELDS TERMINATED BY '\t'
	LINES TERMINATED BY '\n'
	(`taxonID`, @bc, @refe, @src, @id)
	SET
	`bibliographicCitation` = nullif(@bc, ''),
	`reference` = nullif(@refe, ''),
	`source` = nullif(@src, ''),
	`identifier` = nullif(@id, '');
COMMIT;

SELECT 'Inserted gbif_reference' as '';
	
#multimedia.txt
CREATE TABLE `gbif_multimedia` (
	`taxonID` int unsigned NOT NULL default 0,
	`license` text default NULL,
	`rightsHolder` text default NULL,
	`creator` text default NULL,
	`references` text default NULL,
	`contributor` varchar(255) default NULL,
	`source` varchar(255) default NULL,
	`identifier` text default NULL,
	`created` varchar(255) default NULL,
	`title` text default NULL,
	`publisher` varchar(255) default NULL,
	`description` text default NULL
);

LOAD DATA LOCAL INFILE 'D:/Download Placement/backbone-current/multimedia.txt'
	INTO TABLE `gbif_multimedia`
	CHARACTER SET utf8mb4
	FIELDS TERMINATED BY '\t'
	LINES TERMINATED BY '\n'
	(`taxonID`, @lc, @rh, @crtr, @refe, @cont, @src, @id, @crtd, @tt, @pub, @descr)
	SET
	`license` = nullif(@lc, ''),
	`rightsHolder` = nullif(@rh, ''),
	`creator` = nullif(@crtr, ''),
	`references` = nullif(@refe, ''),
	`contributor` = nullif(@cont, ''),
	`source` = nullif(@src, ''),
	`identifier` = nullif(@id, ''),
	`created` = nullif(@crtd, ''),
	`title` = nullif(@tt, ''),
	`publisher` = nullif(@pub, ''),
	`description` = nullif(@descr, '');
COMMIT;

SELECT 'Inserted gbif_multimedia:' as '';
	
#vernacularname.txt
CREATE TABLE `gbif_vernacularname` (
	`taxonID` int unsigned NOT NULL default 0,
	`sex` varchar(255) default NULL,
	`lifeStage` varchar(255) default NULL,
	`source` varchar(255) default NULL,
	`vernacularName` text default NOT NULL,
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
	
#distribution.txt
CREATE TABLE `gbif_distribution` (
	`taxonID` int unsigned NOT NULL default 0,
	`threatStatus` varchar(255) default NULL,
	`establishmentMeans` varchar(255) default NULL,
	`lifeStage` varchar(255) default NULL,
	`source` varchar(255) default NULL,
	`country` varchar(255) default NULL,
	`occuranceStatus` varchar(255) default NULL,
	`countryCode` varchar(255) default NULL,
	`locationID` text default NULL,
	`locality` text default NULL,
	`locationRemarks` text default NULL
);

LOAD DATA LOCAL INFILE 'D:/Download Placement/backbone-current/distribution.txt'
	INTO TABLE `gbif_distribution`
	CHARACTER SET utf8mb4
	FIELDS TERMINATED BY '\t'
	LINES TERMINATED BY '\n'
	(`taxonID`, @ts, @em, @ls, @src, @ct, @os, @cc, @lid, @lc, @lr)
	SET
	`threatStatus` = nullif(@ts, ''),
	`establishmentMeans` = nullif(@em, ''),
	`lifeStage` = nullif(@ls, ''),
	`source` = nullif(@src, ''),
	`country` = nullif(@ct, ''),
	`occuranceStatus` = nullif(@os, ''),
	`countryCode` = nullif(@cc, ''),
	`locationID` = nullif(@lid, ''),
	`locality` = nullif(@lc, ''),
	`locationRemarks` = nullif(@lr, '');
COMMIT;

SELECT 'Inserted gbif_distribution' as '';

#Echo whole table
SELECT table_name, TABLE_ROWS FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = (SELECT DATABASE());

SET autocommit = 1;
SET unique_checks = 1;
SET foreign_key_checks = 1;

SELECT 'SET reset' as '';