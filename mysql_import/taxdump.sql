SET autocommit = 0;
SET unique_checks = 0;
SET foreign_key_checks = 0;

SELECT 'SET initialised' as '';

#Drop any table with same names in foreign key order
DROP TABLE IF EXISTS `ncbi_delnodes`;
DROP TABLE IF EXISTS `ncbi_merged`;
DROP TABLE IF EXISTS `ncbi_citations`;
DROP TABLE IF EXISTS `ncbi_names`;
DROP TABLE IF EXISTS `ncbi_nodes`;
DROP TABLE IF EXISTS `ncbi_division`;
DROP TABLE IF EXISTS `ncbi_gencode`;

#division.dmp
CREATE TABLE `ncbi_division` (
	`division_id` smallint(6) unsigned NOT NULL default 0,
	`division_cde` char(3) NOT NULL default '',
	`division_name` varchar(255) NOT NULL default '',
	`comments` text default NULL
);

LOAD DATA LOCAL INFILE '/var/lib/mysql-files/division.dmp'
	INTO TABLE `ncbi_division`
	CHARACTER SET utf8mb4
	FIELDS ESCAPED BY '\\' TERMINATED BY '\t|\t'
	LINES TERMINATED BY '\t|\n';
COMMIT;

SELECT 'Inserted ncbi_division' as '';

ALTER TABLE `ncbi_division` ADD CONSTRAINT `pk-division_id` PRIMARY KEY(`division_id`);
COMMIT;

SELECT "ncbi_division INDEXED" as '';
	
#gencode.dmp
CREATE TABLE `ncbi_gencode` (
	`genetic_code_id` smallint(6) unsigned NOT NULL default 0,
	`abbreviation` varchar(255) default NULL,
	`name` varchar(255) NOT NULL default '',
	`cde` varchar(255) NOT NULL default '',
	`starts` varchar(255) NOT NULL default ''
);

LOAD DATA LOCAL INFILE '/var/lib/mysql-files/gencode.dmp'
	INTO TABLE `ncbi_gencode`
	CHARACTER SET utf8mb4
	FIELDS TERMINATED BY '\t|\t'
	LINES TERMINATED BY '\t|\n';
COMMIT;

SELECT 'Inserted ncbi_gencode' as '';

ALTER TABLE `ncbi_gencode` ADD CONSTRAINT `pk-genetic_code_id` PRIMARY KEY (`genetic_code_id`);
COMMIT;

SELECT 'ncbi_gencode INDEXED' as '';
	
#delnodes.dmp
CREATE TABLE `ncbi_delnodes` (
	`tax_id` mediumint(11) unsigned NOT NULL default 0
);

LOAD DATA LOCAL INFILE '/var/lib/mysql-files/delnodes.dmp'
	INTO TABLE `ncbi_delnodes`
	CHARACTER SET utf8mb4
	FIELDS TERMINATED BY '\t|\t'
	LINES TERMINATED BY '\t|\n';
COMMIT;

SELECT 'Inserted ncbi_delnodes' as '';

ALTER TABLE `ncbi_delnodes` ADD CONSTRAINT `uq-tax_id` UNIQUE (`tax_id`);
COMMIT;

SELECT 'ncbi_delnodex INDEXED' as '';
	
#merged.dmp
CREATE TABLE `ncbi_merged` (
	`old_tax_id` mediumint(11) unsigned NOT NULL default 0,
	`new_tax_id` mediumint(11) unsigned NOT NULL default 0
);

LOAD DATA LOCAL INFILE '/var/lib/mysql-files/merged.dmp'
	INTO TABLE `ncbi_merged`
	CHARACTER SET utf8mb4
	FIELDS TERMINATED BY '\t|\t'
	LINES TERMINATED BY '\t|\n';
COMMIT;

SELECT 'Inserted ncbi_merged' as '';

ALTER TABLE `ncbi_merged` ADD CONSTRAINT `uq-old_tax_id` UNIQUE (`old_tax_id`);
COMMIT;

SELECT 'ncbi_merged INDEXED' as '';
	
#citations.dmp
CREATE TABLE `ncbi_citations` (
	`cit_id` mediumint(11) unsigned NOT NULL default 0,
	`cit_key` varchar(255) NOT NULL default '',
	`pubmed_id` mediumint(11) unsigned NOT NULL default 0,
	`medline_id` mediumint(11) unsigned NOT NULL default 0,
	`url` varchar(255) NOT NULL default '',
	`text` text default NULL,
	`taxid_list` varchar(255) NOT NULL default '0'
);

LOAD DATA LOCAL INFILE '/var/lib/mysql-files/citations.dmp'
	INTO TABLE `ncbi_citations`
	CHARACTER SET utf8mb4
	FIELDS ESCAPED BY '\\' TERMINATED BY '\t|\t'
	LINES TERMINATED BY '\t|\n';
COMMIT;

SELECT 'Inserted ncbi_citations' as '';

ALTER TABLE `ncbi_citations` ADD CONSTRAINT `pk-cit_id` PRIMARY KEY (`cit_id`);
COMMIT;

SELECT 'ncbi_citations INDEXED' as '';

#nodes.dmp
CREATE TABLE `ncbi_nodes` (
  `tax_id` mediumint(11) unsigned NOT NULL default 0,
  `parent_tax_id` mediumint(8) unsigned NOT NULL default 0,
  `rank` varchar(32) default NULL,
  `embl_code` varchar(16) default NULL,
  `division_id` smallint(6) unsigned NOT NULL default 0,
  `inherited_div_flag` tinyint(4) NOT NULL default 0,
  `genetic_code_id` smallint(6) unsigned NOT NULL default 0,
  `inherited_GC_flag` tinyint(4) NOT NULL default 0,
  `mitochondrial_genetic_code_id` smallint(4) NOT NULL default 0,
  `inherited_MGC_flag` tinyint(4) NOT NULL default 0,
  `GenBank_hidden_flag` smallint(4) NOT NULL default 0,
  `hidden_subtree_root_flag` tinyint(4) NOT NULL default 0,
  `comments` text default NULL
);

LOAD DATA LOCAL INFILE '/var/lib/mysql-files/nodes.dmp'
	INTO TABLE `ncbi_nodes`
	CHARACTER SET utf8mb4
	FIELDS ESCAPED BY '\\' TERMINATED BY '\t|\t'
	LINES TERMINATED BY '\t|\n';
COMMIT;

SELECT 'Inserted ncbi_nodes' as '';

ALTER TABLE `ncbi_nodes`
	ADD CONSTRAINT `pk-tax_id` PRIMARY KEY (`tax_id`),
	ADD CONSTRAINT `fk-division_id` FOREIGN KEY (`division_id`) REFERENCES `ncbi_division` (`division_id`),
	ADD CONSTRAINT `fk-gencode_code_id` FOREIGN KEY (`genetic_code_id`) REFERENCES `ncbi_gencode` (`genetic_code_id`);
COMMIT;

SELECT 'ncbi_nodes INDEXED' as '';

#names.dmp
CREATE TABLE `ncbi_names` (
  `tax_id` mediumint(11) unsigned NOT NULL default 0,
  `name_txt` varchar(255) NOT NULL default '',
  `unique_name` varchar(255) default NULL,
  `name_class` varchar(32) NOT NULL default ''
);

LOAD DATA LOCAL INFILE '/var/lib/mysql-files/names.dmp'
	INTO TABLE `ncbi_names`
	CHARACTER SET utf8mb4
	FIELDS TERMINATED BY '\t|\t'
	LINES TERMINATED BY '\t|\n';
COMMIT;

SELECT 'Inserted ncbi_names' as '';

ALTER TABLE `ncbi_names` ADD CONSTRAINT `fk-tax_id` FOREIGN KEY (`tax_id`) REFERENCES `ncbi_nodes`(`tax_id`);

SELECT 'ncbi_names INDEXED' as '';

#Echo whole table
SELECT table_name, TABLE_ROWS FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = (SELECT DATABASE());

SET autocommit = 1;
SET unique_checks = 1;
SET foreign_key_checks = 1;

SELECT 'SET reset' as '';