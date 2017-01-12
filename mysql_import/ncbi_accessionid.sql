SET autocommit = 0;
SET unique_checks = 0;
SET foreign_key_checks = 0;

SELECT 'SET initialised' AS '';
/*
#Drop any same name tables. No order enforced.
DROP TABLE IF EXISTS `ncbi_nucl_est`;
DROP TABLE IF EXISTS `ncbi_nucl_gss`;
DROP TABLE IF EXISTS `ncbi_nucl_wgs`;
DROP TABLE IF EXISTS `ncbi_nucl_gb`;
DROP TABLE IF EXISTS `ncbi_prot`;

CREATE TABLE `ncbi_nucl_est` (
	`accession` varchar(8) NOT NULL default '0',
	`accession.version` varchar(12) NOT NULL default '0',
	`tax_id` mediumint(11) unsigned NOT NULL default 0,
	`gi` varchar(12) NOT NULL default 'na.'
);

LOAD DATA LOCAL INFILE '/var/lib/mysql-files/nucl_est.accession2taxid'
	INTO TABLE `ncbi_nucl_est`
	CHARACTER SET utf8mb4
	FIELDS TERMINATED BY '\t'
	LINES TERMINATED BY '\n'
	IGNORE 1 LINES;
COMMIT;

SELECT 'Inserted ncbi_nucl_est' AS '';*/ #Imported - Boey

/*ALTER TABLE `ncbi_nucl_est` ADD CONSTRAINT `fk-tax_id-nucl_est` FOREIGN KEY (`tax_id`) REFERENCES `ncbi_nodes` (`tax_id`);
COMMIT;

SELECT 'ncbi_nucl_est INDEXED' AS '';*/

CREATE TABLE `ncbi_nucl_gss` (
	`accession` varchar(8) NOT NULL default '0',
	`accession.version` varchar(12) NOT NULL default '0',
	`tax_id` mediumint(11) unsigned NOT NULL default 0,
	`gi` varchar(12) NOT NULL default 'na.'
);

LOAD DATA LOCAL INFILE '/var/lib/mysql-files/nucl_gss.accession2taxid'
	INTO TABLE `ncbi_nucl_gss`
	CHARACTER SET utf8mb4
	FIELDS TERMINATED BY '\t'
	LINES TERMINATED BY '\n'
	IGNORE 1 LINES;
COMMIT;

SELECT 'Inserted ncbi_nucl_gss' AS '';

/*ALTER TABLE `ncbi_nucl_gss` ADD CONSTRAINT `fk-tax_id-nucl_gss` FOREIGN KEY (`tax_id`) REFERENCES `ncbi_nodes` (`tax_id`);
COMMIT;

SELECT 'ncbi_nucl_gss INDEXED' AS '';*/

CREATE TABLE `ncbi_nucl_wgs` (
	`accession` varchar(8) NOT NULL default '0',
	`accession.version` varchar(12) NOT NULL default '0',
	`tax_id` mediumint(11) unsigned NOT NULL default 0,
	`gi` varchar(12) NOT NULL default 'na.'
);

LOAD DATA LOCAL INFILE '/var/lib/mysql-files/nucl_wgs.accession2taxid'
	INTO TABLE `ncbi_nucl_wgs`
	CHARACTER SET utf8mb4
	FIELDS TERMINATED BY '\t'
	LINES TERMINATED BY '\n'
	IGNORE 1 LINES;
COMMIT;

SELECT 'Inserted ncbi_nucl_wgs' AS '';

/*ALTER TABLE `ncbi_nucl_wgs` ADD CONSTRAINT `fk-tax_id-nucl_wgs` FOREIGN KEY (`tax_id`) REFERENCES `ncbi_nodes` (`tax_id`);
COMMIT;

SELECT 'ncbi_nucl_wgs INDEXED' AS '';*/

CREATE TABLE `ncbi_nucl_gb` (
	`accession` varchar(8) NOT NULL default '0',
	`accession.version` varchar(12) NOT NULL default '0',
	`tax_id` mediumint(11) unsigned NOT NULL default 0,
	`gi` varchar(12) NOT NULL default 'na.'
);

LOAD DATA LOCAL INFILE '/var/lib/mysql-files/nucl_gb.accession2taxid'
	INTO TABLE `ncbi_nucl_gb`
	CHARACTER SET utf8mb4
	FIELDS TERMINATED BY '\t'
	LINES TERMINATED BY '\n'
	IGNORE 1 LINES;
COMMIT;

SELECT 'Inserted ncbi_nucl_gb: ", row_count(), " rows' AS '';

/*ALTER TABLE `ncbi_nucl_gb` ADD CONSTRAINT `fk-tax_id-nucl_gb` FOREIGN KEY (`tax_id`) REFERENCES `ncbi_nodes` (`tax_id`);
COMMIT;

SELECT 'ncbi_nucl_gb INDEXED' AS '';*/

CREATE TABLE `ncbi_prot` (
	`accession` varchar(8) NOT NULL default '0',
	`accession.version` varchar(12) NOT NULL default '0',
	`tax_id` mediumint(11) unsigned NOT NULL default 0,
	`gi` varchar(12) NOT NULL default 'na.'
);

LOAD DATA LOCAL INFILE '/var/lib/mysql-files/prot.accession2taxid'
	INTO TABLE `ncbi_prot`
	CHARACTER SET utf8mb4
	FIELDS TERMINATED BY '\t'
	LINES TERMINATED BY '\n'
	IGNORE 1 LINES;
COMMIT;

SELECT 'Inserted ncbi_prot' AS '';

/*ALTER TABLE `ncbi_prot` ADD CONSTRAINT `fk-tax_id-prot` FOREIGN KEY (`tax_id`) REFERENCES `ncbi_nodes` (`tax_id`);
COMMIT;

SELECT 'ncbi_prot INDEXED' AS '';*/

#Echo whole table
SELECT table_name, TABLE_ROWS FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = (SELECT DATABASE());

SET autocommit = 1;
SET unique_checks = 1;
SET foreign_key_checks = 1;

SELECT 'SET reset' AS '';