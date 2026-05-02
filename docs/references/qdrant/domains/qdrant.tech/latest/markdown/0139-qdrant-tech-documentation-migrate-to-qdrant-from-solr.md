From Apache Solr - Qdrant
* [Documentation](https://qdrant.tech/documentation/)
*
* [Migration Tool](https://qdrant.tech/documentation/migrate-to-qdrant/)
*
* From Apache Solr# Migrate from Apache Solr to Qdrant
## What You Need from Solr
* **Solr URL** — the base URL of your Solr instance (e.g., `http://localhost:8983`)
* **Collection name** — the Solr collection to migrate
* **Authentication** — username and password, if configured**Important:** Solr does not reliably expose vector dimensions and distance metrics via its schema API. You must create the Qdrant collection manually before running the migration.## Concept Mapping
|Solr|Qdrant|Notes|
|Collection|Collection|One-to-one mapping|
|Document|Point|Each document becomes a point|
|Dense vector field|Vector|Named vectors are preserved|
|Non-vector fields|Payload|Direct mapping|
|Document ID (`id` field)|Payload field|Stored via `--qdrant.id-field`|
## Run the Migration
```
`docker run --net=host --rm -it registry.cloud.qdrant.io/library/qdrant-migration solr \\
--solr.url 'http://localhost:8983' \\
--solr.collection 'your-collection' \\
--qdrant.url 'https://your-instance.cloud.qdrant.io:6334' \\
--qdrant.api-key 'your-qdrant-api-key' \\
--qdrant.collection 'your-collection'
`
```
### With Authentication
```
`docker run --net=host --rm -it registry.cloud.qdrant.io/library/qdrant-migration solr \\
--solr.url 'https://your-solr-host:8983' \\
--solr.collection 'your-collection' \\
--solr.username 'your-username' \\
--solr.password 'your-password' \\
--qdrant.url 'https://your-instance.cloud.qdrant.io:6334' \\
--qdrant.api-key 'your-qdrant-api-key' \\
--qdrant.collection 'your-collection' \\
--migration.create-collection false
`
```
### All Solr-Specific Flags
|Flag|Required|Description|
|`--solr.url`|Yes|Solr base URL (e.g., `http://localhost:8983`)|
|`--solr.collection`|Yes|Solr collection name|
|`--solr.username`|No|Username for basic authentication|
|`--solr.password`|No|Password for basic authentication|
|`--solr.insecure-skip-verify`|No|Skip TLS certificate verification (default: `false`)|
### Qdrant-Side Options
|Flag|Default|Description|
|`--qdrant.id-field`|`\_\_id\_\_`|Payload field name for original Solr document IDs|
## Gotchas
* **Named vectors:** If your Solr schema has multiple dense vector fields, all are migrated as named vectors. Ensure your pre-created collection has matching named vector configurations.
* **ID mapping:** Solr document IDs (strings) are converted to Qdrant UUIDs. The original Solr ID is stored in payload under `--qdrant.id-field`.## Next Steps
After migration, verify your data arrived correctly with the [Migration Verification Guide](https://qdrant.tech/documentation/migration-guidance/).
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/migrate-to-qdrant/from-solr.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/migrate-to-qdrant/from-solr/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/migrate-to-qdrant/from-solr.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)