From Redis - Qdrant
* [Documentation](https://qdrant.tech/documentation/)
*
* [Migration Tool](https://qdrant.tech/documentation/migrate-to-qdrant/)
*
* From Redis# Migrate from Redis to Qdrant
## What You Need from Redis
* **Redis address** — host and port of your Redis instance
* **FT index name** — the RediSearch full-text index that contains your vectors
* **Authentication** — username and password, if configured**Important:** Redis does not expose vector configurations (dimensions, distance metric) after an index is created. You must create the Qdrant collection manually before running the migration.## Concept Mapping
|Redis|Qdrant|Notes|
|FT Index|Collection|One-to-one mapping|
|Document|Point|Each document becomes a point|
|Vector field|Vector|Named vectors are preserved|
|Hash/JSON fields|Payload|Direct mapping|
|Document key|Payload field|Stored via `--qdrant.id-field`|
## Run the Migration
```
`docker run --net=host --rm -it registry.cloud.qdrant.io/library/qdrant-migration redis \\
--redis.index 'your-ft-index' \\
--redis.addr 'localhost:6379' \\
--qdrant.url 'https://your-instance.cloud.qdrant.io:6334' \\
--qdrant.api-key 'your-qdrant-api-key' \\
--qdrant.collection 'your-collection'
`
```
### With Authentication
```
`docker run --net=host --rm -it registry.cloud.qdrant.io/library/qdrant-migration redis \\
--redis.index 'your-ft-index' \\
--redis.addr 'your-redis-host:6379' \\
--redis.username 'your-username' \\
--redis.password 'your-password' \\
--qdrant.url 'https://your-instance.cloud.qdrant.io:6334' \\
--qdrant.api-key 'your-qdrant-api-key' \\
--qdrant.collection 'your-collection' \\
--migration.create-collection false
`
```
### All Redis-Specific Flags
|Flag|Required|Description|
|`--redis.index`|Yes|RediSearch FT index name|
|`--redis.addr`|No|Redis address (default: `localhost:6379`)|
|`--redis.protocol`|No|Redis protocol version (default: `2`)|
|`--redis.username`|No|Username for authentication|
|`--redis.password`|No|Password for authentication|
|`--redis.client-name`|No|Client name|
|`--redis.db`|No|Database number|
|`--redis.network`|No|Network type: `tcp` or `unix` (default: `tcp`)|
### Qdrant-Side Options
|Flag|Default|Description|
|`--qdrant.id-field`|`\_\_id\_\_`|Payload field name for original Redis document keys|
## Gotchas
* **Named vectors:** If your Redis index has multiple vector fields, all are migrated as named vectors. Ensure your pre-created Qdrant collection has a matching named vector configuration.
* **ID mapping:** Redis document keys are converted to Qdrant point IDs. The original key is stored in the payload under `--qdrant.id-field`.## Next Steps
After migration, verify your data arrived correctly with the [Migration Verification Guide](https://qdrant.tech/documentation/migration-guidance/).
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/migrate-to-qdrant/from-redis.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/migrate-to-qdrant/from-redis/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/migrate-to-qdrant/from-redis.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)