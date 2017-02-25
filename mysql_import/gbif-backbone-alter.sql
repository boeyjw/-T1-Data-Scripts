ALTER TABLE `gbif_taxon` ADD CONSTRAINT `pk-coreID` PRIMARY KEY (`taxonID`);
SELECT 'gbif_taxon INDEXED' as '';

ALTER TABLE `gbif_reference` ADD CONSTRAINT `fk-coreID-reference` FOREIGN KEY (`taxonID`) REFERENCES `gbif_taxon`(`taxonID`);
SELECT 'gbif_reference INDEXED'as '';

ALTER TABLE `gbif_multimedia` ADD CONSTRAINT `fk-coreID-multimedia` FOREIGN KEY (`taxonID`) REFERENCES `gbif_taxon`(`taxonID`);
SELECT 'gbif_multimedia INDEXED' as '';

ALTER TABLE `gbif_vernacularname` ADD CONSTRAINT `fk-coreID-vernacularname` FOREIGN KEY (`taxonID`) REFERENCES `gbif_taxon`(`taxonID`);
SELECT 'gbif_vernacularname INDEXED' as '';

ALTER TABLE `gbif_distribution` ADD CONSTRAINT `fk-coreID-distribution` FOREIGN KEY (`taxonID`) REFERENCES `gbif_taxon`(`taxonID`);
SELECT 'gbif_distribution INDEXED' as '';