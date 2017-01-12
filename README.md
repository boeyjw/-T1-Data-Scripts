# -T1-Data-Scripts

##mysql-imports
Unique check <== 1

Primary key check <== 2

Foreign key check <== 3

 - gbif-backbone.sql <== TESTING
  - IS GBIF
 
 - taxdump.sql <== 1 < PASS ; 2 < PASS <(`tax_id`) is PK for entire DB> ; 3 < PASS \<All relation links to `ncbi_nodes`(`tax_id`)\>
  - IS NCBI
 
 - ncbi_accession.sql <== 1 < NULL ; 2 < NULL ; 3 < FAIL \<Link from (`tax_id`) to `ncbi_nodes`(`tax_id`) failed\>
  - IS NCBI
