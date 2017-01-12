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
	LINES TERMINATED BY '\t|\n'
	(`division_id`, `division_cde`, `division_name`, @vcomments)
	SET `comments` = nullif(@vcomments, '');
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
	LINES TERMINATED BY '\t|\n'
	(`genetic_code_id`, @vabb, `name`, `cde`, `starts`)
	SET `abbreviation` = nullif(@vabb, '');
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
	`url` varchar(255) default NULL,
	`text` text default NULL,
	`taxid_list` varchar(255) NOT NULL default '0'
);

LOAD DATA LOCAL INFILE '/var/lib/mysql-files/citations.dmp'
	INTO TABLE `ncbi_citations`
	CHARACTER SET utf8mb4
	FIELDS ESCAPED BY '\\' TERMINATED BY '\t|\t'
	LINES TERMINATED BY '\t|\n'
	(`cit_id`, `cit_key`, `pubmed_id`, `medline_id`, @vurl, @vtxt, `taxid_list`)
	SET 
	`url` = nullif(@vurl, ''),
	`text` = nullif(@vtxt, '');
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
  `inherited_div_flag` tinyint(4) default NULL,
  `genetic_code_id` smallint(6) unsigned NOT NULL default 0,
  `inherited_GC_flag` tinyint(4) default NULL,
  `mitochondrial_genetic_code_id` smallint(4) default NULL,
  `inherited_MGC_flag` tinyint(4) default NULL,
  `GenBank_hidden_flag` smallint(4) default NULL,
  `hidden_subtree_root_flag` tinyint(4) default NULL,
  `comments` text default NULL
);

LOAD DATA LOCAL INFILE '/var/lib/mysql-files/nodes.dmp'
	INTO TABLE `ncbi_nodes`
	CHARACTER SET utf8mb4
	FIELDS ESCAPED BY '\\' TERMINATED BY '\t|\t'
	LINES TERMINATED BY '\t|\n'
	(`tax_id`, `parent_tax_id`, @vrank, @vembl_code, `division_id`, @vinherited_div_flag, `genetic_code_id`, @vinherited_GC_flag, @vmitochondrial_genetic_code_id, @vinherited_MGC_flag, @vGenBank_hidden_flag, @vhidden_subtree_root_flag, @vcomments)
	SET 
	`rank` = nullif(@vrank, ''),
	`embl_code` = nullif(@vembl_code, ''),
	`inherited_div_flag` = nullif(@vinherited_div_flag, ''),
	`inherited_GC_flag` = nullif(@vinherited_GC_flag, ''),
	`mitochondrial_genetic_code_id` = nullif(@vmitochondrial_genetic_code_id, ''),
	`inherited_MGC_flag` = nullif(@vinherited_MGC_flag, ''),
	`GenBank_hidden_flag` = nullif(@vGenBank_hidden_flag, ''),
	`hidden_subtree_root_flag` = nullif(@vhidden_subtree_root_flag, ''),
	`comments` = nullif(@vcomments, '');
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
  `name_txt` varchar(255) default NULL,
  `unique_name` varchar(255) default NULL,
  `name_class` varchar(32) default NULL
);

LOAD DATA LOCAL INFILE '/var/lib/mysql-files/names.dmp'
	INTO TABLE `ncbi_names`
	CHARACTER SET utf8mb4
	FIELDS TERMINATED BY '\t|\t'
	LINES TERMINATED BY '\t|\n'
	(`tax_id`, @vname_txt, @vunique_name, @name_class)
	SET 
	`name_txt` = nullif(@vname_txt, ''),
	`unique_name` = nullif(@vunique_name, ''),
	`name_class` = nullif(@vname_class, '');
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