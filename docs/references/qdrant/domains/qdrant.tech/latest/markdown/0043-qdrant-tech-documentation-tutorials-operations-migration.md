Data Migration - Qdrant
* [Documentation](https://qdrant.tech/documentation/)
*
* [Operations & Scale](https://qdrant.tech/documentation/tutorials-operations/)
*
* Data Migration# Migrate Your Embeddings to Qdrant
|Time: Varies|Level: Intermediate|
Migrating data between vector databases, especially across regions, platforms, or deployment types, can be a hassle. That’s where the [Qdrant Migration Tool](https://github.com/qdrant/migration) comes in. It supports a wide range of migration needs, including transferring data between Qdrant instances and migrating from other vector database providers to Qdrant.
You can run the migration tool on any machine where you have connectivity to both the source and the target Qdrant databases. Direct connectivity between both databases is not required. For optimal performance, you should run the tool on a machine with a fast network connection and minimum latency to both databases.
In this tutorial, we will learn how to use the migration tool and walk through a practical example of migrating from another vector database to Qdrant.
## Why use this instead of Qdrant’s Native Snapshotting?
Qdrant supports [snapshot-based backups](https://qdrant.tech/documentation/snapshots/), which are low-level disk operations built for same-cluster recovery or local backups. These snapshots:
* Require snapshot consistency across nodes.
* Can be hard to port across machines or cloud zones.
On the other hand, the Qdrant Migration Tool:
* Streams data in live batches.
* Can resume interrupted migrations.
* Works even when data is being inserted.
* Supports collection reconfiguration (e.g., changing replication settings and quantization).
* Supports migrating from other vector DBs (Pinecone, Chroma, Weaviate, etc.)## How to Use the Qdrant Migration Tool
You can run the tool via Docker.
Installation:
```
`docker pull registry.cloud.qdrant.io/library/qdrant-migration
`
```
Here is an example of how to perform a Qdrant to Qdrant migration:
```
`docker run --rm -it \\
registry.cloud.qdrant.io/library/qdrant-migration qdrant \\
--source.url 'https://source-instance.cloud.qdrant.io:6334' \\
--source.api-key 'qdrant-source-key' \\
--source.collection 'benchmark' \\
--target.url 'https://target-instance.cloud.qdrant.io:6334' \\
--target.api-key 'qdrant-target-key' \\
--target.collection 'benchmark'
`
```
Note: The migration CLI uses the Qdrant gRPC API, so you must always configure the gRPC port for Qdrant URLs with the Migration CLI (default: 6334).## Example: Migrate from Pinecone to Qdrant
Let’s now walk through an example of migrating from Pinecone to Qdrant. Assume your Pinecone index looks like this:
The information you need from Pinecone is:
* Your Pinecone API key
* The index name
* The index host URL
With that information, you can migrate your vector database from Pinecone to Qdrant with the following command:
```
`docker run --net=host --rm -it registry.cloud.qdrant.io/library/qdrant-migration pinecone \\
--pinecone.index-host 'https://sample-movies-efgjrye.svc.aped-4627-b74a.pinecone.io' \\
--pinecone.index-name 'sample-movies' \\
--pinecone.api-key 'pcsk\_7Dh5MW\_…' \\
--qdrant.url 'https://5f1a5c6c-7d47-45c3-8d47-d7389b1fad66.eu-west-1-0.aws.cloud.qdrant.io:6334' \\
--qdrant.api-key 'eyJhbGciOiJIUzI1NiIsInR5c…' \\
--qdrant.collection 'sample-movies' \\
--migration.batch-size 64
`
```
When the migration is complete, you will see the new collection on Qdrant with all the vectors.
## Conclusion
The **Qdrant Migration Tool** makes data transfer across vector database instances effortless. Whether you&rsquo;re moving between cloud regions, upgrading from self-hosted to Qdrant Cloud, or switching from other databases such as Pinecone, this tool saves you hours of manual effort. [Try it today](https://github.com/qdrant/migration).
For detailed per-provider migration guides (Pinecone, Weaviate, Milvus, Elasticsearch, pgvector), see the [Migrate to Qdrant](https://qdrant.tech/documentation/migrate-to-qdrant/) section. After migrating, use the [Migration Verification Guide](https://qdrant.tech/documentation/migration-guidance/) to confirm data integrity and search quality.
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/tutorials-operations/migration.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/tutorials-operations/migration/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/tutorials-operations/migration.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)