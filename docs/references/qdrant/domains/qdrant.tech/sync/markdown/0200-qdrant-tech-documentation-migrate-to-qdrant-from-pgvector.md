From pgvector - Qdrant
* [Documentation](https://qdrant.tech/documentation/)
*
* [Migration Tool](https://qdrant.tech/documentation/migrate-to-qdrant/)
*
* From pgvector# Migrate from pgvector to Qdrant
## What You Need from Postgres
* **Connection URL** — a standard Postgres connection string
* **Table name** — the table containing your vector data## Concept Mapping
|pgvector|Qdrant|Notes|
|Table|Collection|One-to-one mapping|
|Row|Point|Each row becomes a point|
|`vector` column|Vector|Mapped automatically|
|Other columns|Payload|All non-vector columns become payload fields|
|`vector\_cosine\_ops`|`Cosine`|pgvector returns distance (1 - similarity); Qdrant returns similarity|
|`vector\_l2\_ops`|`Euclid`|Direct mapping|
|`vector\_ip\_ops`|`Dot`|pgvector uses negative inner product for ordering; scores will be inverted|
## Run the Migration
```
`docker run --net=host --rm -it registry.cloud.qdrant.io/library/qdrant-migration pg \\
--pg.url 'postgres://user:password@host:5432/dbname' \\
--pg.table 'your\_embeddings\_table' \\
--pg.key-column 'id' \\
--qdrant.url 'https://your-instance.cloud.qdrant.io:6334' \\
--qdrant.api-key 'your-qdrant-api-key' \\
--qdrant.collection 'your-collection'
`
```
### Selecting Specific Columns
By default, all columns are migrated. Use `--pg.columns` to select specific ones:
```
`docker run --net=host --rm -it registry.cloud.qdrant.io/library/qdrant-migration pg \\
--pg.url 'postgres://user:password@host:5432/dbname' \\
--pg.table 'your\_embeddings\_table' \\
--pg.key-column 'id' \\
--pg.columns 'id,embedding,title,category' \\
--qdrant.url 'https://your-instance.cloud.qdrant.io:6334' \\
--qdrant.api-key 'your-qdrant-api-key' \\
--qdrant.collection 'your-collection'
`
```
### All pgvector-Specific Flags
|Flag|Required|Description|
|`--pg.url`|Yes|Postgres connection string|
|`--pg.table`|Yes|Table name to migrate|
|`--pg.key-column`|Yes|Column to use as point ID|
|`--pg.columns`|No|Comma-separated columns to migrate (default: all)|
|`--migration.num-workers`|No|Parallel workers (default: number of CPU cores)|
### Qdrant-Side Options
|Flag|Default|Description|
|`--qdrant.distance-metric`|`cosine`|Distance metric per vector field (map format)|
## Gotchas
* **Partition structure:** If you had manual partitions in pgvector (common at scale), verify that all partitions were migrated, not just the primary table.
* **NULL handling:** PostgreSQL NULLs may be dropped during export. Check that optional fields are represented correctly in Qdrant payloads.
* **Index type and recall:** pgvector supports IVFFlat and HNSW. If your baseline was captured with IVFFlat (lower recall), Qdrant&rsquo;s HNSW may return better results. This looks like a &ldquo;mismatch&rdquo; but is an improvement.
* **Row count approximation:** Postgres&rsquo;s `n\_live\_tup` is an estimate, not an exact count. Use `SELECT COUNT(\*) FROM your\_table` for accurate comparison during [migration verification](https://qdrant.tech/documentation/migration-guidance/).## After Migration: Keeping Postgres and Qdrant in Sync
If you continue using Postgres as your source of truth alongside Qdrant, you&rsquo;ll need a sync strategy. The [Data Synchronization Guide](https://qdrant.tech/documentation/data-synchronization/) covers three approaches from simple dual-writes to production-grade Change Data Capture.
## Next Steps
After migration, verify your data arrived correctly with the [Migration Verification Guide](https://qdrant.tech/documentation/migration-guidance/).
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/migrate-to-qdrant/from-pgvector.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/migrate-to-qdrant/from-pgvector/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/migrate-to-qdrant/from-pgvector.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)