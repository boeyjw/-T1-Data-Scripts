'use strict';
const runAsyncGen = require('run-async-gen');
const SqlToJson = require('sql-to-json');
const mysql = require('mysql'); // can be any sql db client with query method.
const fs = require('fs')

runAsyncGen(GenerateJsonFile(), function(err) {
    if (err) {
        console.log(err);
        process.exit(1);
    }
    console.log('Done');
});

function* GenerateJsonFile() {
    const mySqlDbClient = mysql.createConnection({
        host: 'localhost',
        user: 'root',
        pass: '',
        database: 'GBIF'
    });
    mySqlDbClient.connect();

    const struct = 
    {
        "type": "object",
        "preLoadTable": {
            "distribution": "SELECT * FROM gbif_distribution",
            "multimedia": "SELECT * FROM gbif_multimedia",
            "reference": "SELECT * FROM gbif_reference",
            "taxon": "SELECT * FROM gbif_taxon",
            "vernacularname": "SELECT * FROM gbif_vernacularname"
        },
        "memquery": "SELECT coreID FROM gbif_taxon"
        "keyField": "coreID"
    };
    const instance = new SqlToJson(mySqlDbClient);
    const dataAsJson = yield* instance.executeGen(struct);

    fs.writeFileSync('output.json', JSON.stringify(dataAsJson));
    mySqlDbClient.end();
}