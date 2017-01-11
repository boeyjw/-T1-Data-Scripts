SET autocommit = 0;
SET unique_checks = 0;
SET foreign_key_checks = 0;

SELECT 'SET initialised' AS '';

#Drop any same name tables. No order enforced.
DROP TABLE IF EXISTS `ncbi_nucl_est`;
DROP TABLE IF EXISTS `ncbi_nucl_gss`;
DROP TABLE IF EXISTS `ncbi_nucl_wgs`;
DROP TABLE IF EXISTS `ncbi_nucl_gb`;
DROP TABLE IF EXISTS `ncbi_prot`;

CREATE TABLE `ncbi_nucl_est` (
	accession varchar(8) NOT NULL default '0',
	accession.version varchar(12) NOT NULL default '0',
	tax_id int NOT NULL default 0,
	gi varchar(12) NOT NULL default 'na.'
);

LOAD DATA INFILE '/var/lib/mysql-files/nucl_est.accession2taxid'
	INTO TABLE `ncbi_nucl_est`
	CHARACTER SET utf8mb4
	FIELDS TERMINATED BY '\t'
	LINES TERMINATED BY '\n';
COMMIT;

SELECT 'Inserted ncbi_nucl_est' AS '';

CREATE TABLE `ncbi_nucl_gss` (
	accession varchar(8) NOT NULL default '0',
	accession.version varchar(12) NOT NULL default '0',
	tax_id int NOT NULL default 0,
	gi varchar(12) NOT NULL default 'na.'
);

LOAD DATA INFILE '/var/lib/mysql-files/nucl_gss.accession2taxid'
	INTO TABLE `ncbi_nucl_gss`
	CHARACTER SET utf8mb4
	FIELDS TERMINATED BY '\t'
	LINES TERMINATED BY '\n';
COMMIT;

SELECT 'Inserted ncbi_nucl_gss' AS '';

CREATE TABLE `ncbi_nucl_wgs` (
	accession varchar(8) NOT NULL default '0',
	accession.version varchar(12) NOT NULL default '0',
	tax_id int NOT NULL default 0,
	gi varchar(12) NOT NULL default 'na.'
);

LOAD DATA INFILE '/var/lib/mysql-files/nucl_wgs.accession2taxid'
	INTO TABLE `ncbi_nucl_wgs`
	CHARACTER SET utf8mb4
	FIELDS TERMINATED BY '\t'
	LINES TERMINATED BY '\n';
COMMIT;

SELECT 'Inserted ncbi_nucl_wgs' AS '';

CREATE TABLE `ncbi_nucl_gb` (
	accession varchar(8) NOT NULL default '0',
	accession.version varchar(12) NOT NULL default '0',
	tax_id int NOT NULL default 0,
	gi varchar(12) NOT NULL default 'na.'
);

LOAD DATA INFILE '/var/lib/mysql-files/nucl_gb.accession2taxid'
	INTO TABLE `ncbi_nucl_gb`
	CHARACTER SET utf8mb4
	FIELDS TERMINATED BY '\t'
	LINES TERMINATED BY '\n';
COMMIT;

SELECT 'Inserted ncbi_nucl_gb: ", row_count(), " rows' AS '';

CREATE TABLE `ncbi_prot` (
	accession varchar(8) NOT NULL default '0',
	accession.version varchar(12) NOT NULL default '0',
	tax_id int NOT NULL default 0,
	gi varchar(12) NOT NULL default 'na.'
);

LOAD DATA INFILE '/var/lib/mysql-files/prot.accession2taxid'
	INTO TABLE `ncbi_prot`
	CHARACTER SET utf8mb4
	FIELDS TERMINATED BY '\t'
	LINES TERMINATED BY '\n';
COMMIT;

SELECT 'Inserted ncbi_prot' AS '';

#Echo whole table
SELECT table_name, TABLE_ROWS FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = (SELECT DATABASE());

SET autocommit = 1;
SET unique_checks = 1;
SET foreign_key_checks = 1;

SELECT 'SET reset' AS '';