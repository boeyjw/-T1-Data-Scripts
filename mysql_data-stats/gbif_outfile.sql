#GBIF outfile

SELECT 'OUTFILE: gbif_taxon';
SELECT `coreID` FROM `gbif_taxon`
INTO OUTFILE '/var/lib/mysql-files/gbif_taxon-coreID'
LINES TERMINATED BY '\n';

SELECT `scientificName` FROM `gbif_taxon`
INTO OUTFILE '/var/lib/mysql-files/gbif_taxon-scientificName'
LINES TERMINATED BY '\n';
SELECT 'COMPLETED: gbif_taxon';

SELECT 'OUTFILE: gbif_vernacularname';
SELECT `coreID` FROM `gbif_vernacularname`
INTO OUTFILE '/var/lib/mysql-files/gbif_vernacularname-coreID'
LINES TERMINATED BY '\n';

SELECT `vernacularName` FROM `gbif_vernacularname`
INTO OUTFILE '/var/lib/mysql-files/gbif_vernacularname-vernacularName'
LINES TERMINATED BY '\n';
SELECT 'COMPLETED: gbif_vernacularname';

SELECT 'OUTFILE: gbif_multimedia';
SELECT `coreID` FROM `gbif_multimedia`
INTO OUTFILE '/var/lib/mysql-files/gbif_multimedia-coreID'
LINES TERMINATED BY '\n';
SELECT 'COMPLETED: gbif_multimedia';

SELECT 'OUTFILE: gbif_distribution';
SELECT `coreID` FROM `gbif_distribution`
INTO OUTFILE '/var/lib/mysql-files/gbif_distribution-coreID'
LINES TERMINATED BY '\n';
SELECT 'COMPLETED: gbif_distribution';

SELECT 'OUTFILE: gbif_reference';
SELECT `coreID` FROM `gbif_reference`
INTO OUTFILE '/var/lib/mysql-files/gbif_reference-coreID'
LINES TERMINATED BY '\n';
SELECT 'COMPLETED: gbif_reference';