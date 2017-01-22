table "gbif_taxon", :rename_to => 'taxon' do
	column "coreID", :key
	column "taxonID", :integer
	column "datasetID", :string
	column "parentNameUsageID", :integer
	column "acceptedNameUsageID", :integer
	column "scientificName", :string
	column "taxonRank", :string
	column "nameAccordingTo", :string
	column "namePublishedIn", :string
	column "taxonomicStatus", :string
	column "nomenclaturalStatus", :string
	column "kingdom", :string
	column "phylum", :string
	column "class", :string
	column "order", :string
	column "family", :string
	column "genus", :string
	column "taxonRemarks", :string
end

table "gbif_distribution", :rename_to => 'distribution', :embed_in => 'taxon', :on => 'coreID' do
	column "coreID", :integer, :references => :taxon
	column "source", :string
	column "threatStatus", :string
	column "locality", :string
	column "lifeStage", :string
	column "occuranceStatus", :string
	column "locationID", :string
	column "locationRemarks", :string
	column "establishmentMeans", :string
	column "countryCode", :string
	column "country", :string
end

table "gbif_multimedia", :rename_to => 'multimedia', :embed_in => 'taxon', :on => 'coreID' do
	column "coreID", :integer, :references => :taxon
	column "references", :string
	column "description", :string
	column "title", :string
	column "contributor", :string
	column "source", :string
	column "created", :string
	column "license", :string
	column "identifier", :string
	column "creator", :string
	column "publisher", :string
	column "rightsHolder", :string
end

table "gbif_reference", :rename_to => 'reference', :embed_in => 'taxon', :on => 'coreID' do
	column "coreID", :integer, :references => :taxon
	column "bibliographicCitation", :string
	column "references", :string
	column "source", :string
	column "identifier", :string
end

table "gbif_vernacularname", :rename_to => 'vernacularname', :embed_in => 'taxon', :on => 'coreID' do
	column "coreID", :integer, :references => :taxon
	column "vernacularName", :string
	column "source", :string
	column "sex", :string
	column "lifeStage", :string
	column "language", :string
	column "countryCode", :string
	column "country", :string
end

