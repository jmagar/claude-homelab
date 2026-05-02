Migration Tool - Qdrant
* [Documentation](https://qdrant.tech/documentation/)
*
* Migration Tool# Migrate to Qdrant
The [Qdrant Migration Tool](https://github.com/qdrant/migration) is a CLI that moves your vectors, metadata, and sparse embeddings from other vector databases into Qdrant. It runs as a Docker container, streams data in batches, and can resume interrupted migrations.
```
`docker pull registry.cloud.qdrant.io/library/qdrant-migration
`
```
## Supported Sources
|Source|CLI Subcommand|Auto-Creates Collection?|
|[Pinecone](https://qdrant.tech/documentation/migrate-to-qdrant/from-pinecone/)|`pinecone`|Yes|
|[Weaviate](https://qdrant.tech/documentation/migrate-to-qdrant/from-weaviate/)|`weaviate`|No (must pre-create)|
|[Milvus](https://qdrant.tech/documentation/migrate-to-qdrant/from-milvus/)|`milvus`|Yes|
|[Elasticsearch](https://qdrant.tech/documentation/migrate-to-qdrant/from-elasticsearch/)|`elasticsearch`|Yes|
|[OpenSearch](https://qdrant.tech/documentation/migrate-to-qdrant/from-opensearch/)|`opensearch`|Yes|
|[pgvector](https://qdrant.tech/documentation/migrate-to-qdrant/from-pgvector/)|`pg`|Yes|
|[S3 Vectors](https://qdrant.tech/documentation/migrate-to-qdrant/from-s3-vectors/)|`s3`|Yes|
|[Chroma](https://qdrant.tech/documentation/migrate-to-qdrant/from-chroma/)|`chroma`|Yes|
|[Redis](https://qdrant.tech/documentation/migrate-to-qdrant/from-redis/)|`redis`|No (must pre-create)|
|[MongoDB](https://qdrant.tech/documentation/migrate-to-qdrant/from-mongodb/)|`mongodb`|No (must pre-create)|
|[FAISS](https://qdrant.tech/documentation/migrate-to-qdrant/from-faiss/)|`faiss`|Yes|
|[Apache Solr](https://qdrant.tech/documentation/migrate-to-qdrant/from-solr/)|`solr`|No (must pre-create)|
|[Qdrant](https://qdrant.tech/documentation/migrate-to-qdrant/from-qdrant/)|`qdrant`|Yes|
Not seeing your current vector store? [Open an issue on GitHub](https://github.com/qdrant/migration/issues) and let us know!
## General Advice
1. **Run the tool close to your databases.** Direct connectivity between source and target is not required — the tool streams through the machine it runs on. For best performance, use a machine with low latency to both.
2. **Use `--net=host` for local instances.** If either database runs on the host machine, the container needs host networking to reach `localhost`.
3. **The tool resumes by default.** Migration progress is tracked in a `\_migration\_offsets` collection in Qdrant. If a migration is interrupted, re-running the same command picks up where it left off. Use `--migration.restart` to force a fresh start.
4. **Batch size is tunable.** The default batch size is 50. For large migrations, increase it with `--migration.batch-size` (e.g., 256 or 512) to improve throughput.
## Universal CLI Options
These flags apply to all source types:
|Flag|Default|Description|
|`--migration.batch-size`|50|Points per upsert batch|
|`--migration.restart`|false|Ignore saved progress, start fresh|
|`--migration.create-collection`|true|Auto-create target collection|
|`--migration.batch-delay`|0|Milliseconds between batches|
|`--migration.offsets-collection`|`\_migration\_offsets`|Collection used to track migration progress|
|`--debug` / `--trace`|—|Verbose logging|
|`--skip-tls-verification`|false|Skip TLS certificate verification|
`--migration.num-workers` is only available for the `pg` and `qdrant` subcommands.## After Migration
Once your data is in Qdrant, verify that everything arrived correctly:
* **[Migration Verification Guide](https://qdrant.tech/documentation/migration-guidance/)** — a structured framework covering data integrity checks and search quality validation.
* **[Keeping Postgres in Sync](https://qdrant.tech/documentation/data-synchronization/)** — if you&rsquo;re running Postgres alongside Qdrant, learn how to keep them in sync.
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/migrate-to-qdrant/_index.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/migrate-to-qdrant/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/migrate-to-qdrant/_index.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)