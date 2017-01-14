#NCBI taxdump outfile

SELECT 'OUTFILE: ncbi_nodes';
SELECT `tax_id` FROM `ncbi_nodes`
INTO OUTFILE '/var/lib/mysql-files/ncbi_nodes-tax_id'
LINES TERMINATED BY '\n';
SELECT 'COMPLETED: ncbi_nodes';

SELECT 'OUTFILE: ncbi_names';
SELECT `tax_id` FROM `ncbi_names`
INTO OUTFILE '/var/lib/mysql-files/ncbi_names-tax_id'
LINES TERMINATED BY '\n';

SELECT `name_txt` FROM `ncbi_names`
INTO OUTFILE '/var/lib/mysql-files/ncbi_names-name_txt'
LINES TERMINATED BY '\n';
SELECT 'COMPLETED: ncbi_names';

SELECT 'OUTFILE: ncbi_accessionid2taxid';
SELECT `tax_id` FROM `ncbi_nucl_est`
INTO OUTFILE '/var/lib/mysql-files/ncbi_nucl_est-tax_id'
LINES TERMINATED BY '\n';

SELECT `tax_id` FROM `ncbi_nucl_gss`
INTO OUTFILE '/var/lib/mysql-files/ncbi_nucl_gss-tax_id'
LINES TERMINATED BY '\n';

SELECT `tax_id` FROM `ncbi_nucl_wgs`
INTO OUTFILE '/var/lib/mysql-files/ncbi_nucl_wgs-tax_id'
LINES TERMINATED BY '\n';

SELECT `tax_id` FROM `ncbi_nucl_gb`
INTO OUTFILE '/var/lib/mysql-files/ncbi_nucl_gb-tax_id'
LINES TERMINATED BY '\n';

SELECT `tax_id` FROM `ncbi_prot`
INTO OUTFILE '/var/lib/mysql-files/ncbi_prot-tax_id'
LINES TERMINATED BY '\n';
SELECT 'COMPLETED: ncbi_accessionid2taxid';