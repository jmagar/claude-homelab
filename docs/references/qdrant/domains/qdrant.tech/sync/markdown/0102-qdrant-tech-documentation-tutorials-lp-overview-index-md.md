# Overview
# Qdrant Tutorial Repository
### Basic Tutorials
*Get up and running with Qdrant in minutes.*
| Tutorial | Objective | Stack | Time | Level |
| :--- | :--- | :--- | :--- | :--- |
| [Qdrant Local Quickstart](/documentation/quickstart/index.md) | Basic CRUD operations and local deployment. | Python | 10m | Beginner |
| [Semantic Search 101](/documentation/tutorials-basics/search-beginners/index.md) | Build a search engine for science fiction books. | Python | 5m | Beginner |
---
### Search Engineering Tutorials
*Master vector search modalities, reranking, and retrieval quality.*
| Tutorial | Objective | Stack | Time | Level |
| :--- | :--- | :--- | :--- | :--- |
| [Semantic Search Intro](/documentation/tutorials-search-engineering/neural-search/index.md) | Deploy a search service for company descriptions. | FastAPI | 30m | Beginner |
| [Hybrid Search with FastEmbed](/documentation/tutorials-search-engineering/hybrid-search-fastembed/index.md) | Combine dense and sparse search. | FastAPI | 20m | Beginner |
| [Relevance Feedback](/documentation/tutorials-search-engineering/using-relevance-feedback/index.md) | Relevance Feedback Retrieval in Qdrant | Python | 30m | Intermediate |
| [Collaborative Filtering](/documentation/tutorials-search-engineering/collaborative-filtering/index.md) | Collaborative filtering using sparse embeddings. | Python | 45m | Intermediate |
| [Multivector Document Retrieval](/documentation/tutorials-search-engineering/pdf-retrieval-at-scale/index.md) | PDF RAG using ColPali and embedding pooling. | Python | 30m | Intermediate |
| [Retrieval Quality Evaluation](/documentation/tutorials-search-engineering/retrieval-quality/index.md) | Measure quality and tune HNSW parameters. | Python | 30m | Intermediate |
| [Hybrid Search with Reranking](/documentation/tutorials-search-engineering/reranking-hybrid-search/index.md) | Implement late interaction and sparse reranking. | Python | 40m | Intermediate |
| [Semantic Search for Code](/documentation/tutorials-search-engineering/code-search/index.md) | Navigate codebases using vector similarity. | Python | 45m | Intermediate |
| [Multivectors and Late Interaction](/documentation/tutorials-search-engineering/using-multivector-representations/index.md) | Effective use of multivector representations. | Python | 30m | Intermediate |
| [Static Embeddings](/documentation/tutorials-search-engineering/static-embeddings/index.md) | Evaluate the utility of static embeddings. | Python | 20m | Intermediate |
---
### Operations & Scale
*Production-grade management, monitoring, and high-volume optimization.*
| Tutorial | Objective | Stack | Time | Level |
| :--- | :--- | :--- | :--- | :--- |
| [Snapshots](/documentation/tutorials-operations/create-snapshot/index.md) | Create and restore collection snapshots. | Python | 20m | Beginner |
| [Data Migration](/documentation/tutorials-operations/migration/index.md) | Move embeddings to Qdrant. | CLI | 30m | Intermediate |
| [Embedding Model Migration](/documentation/tutorials-operations/embedding-model-migration/index.md) | Use your new model with zero downtime. | None | 40m | Intermediate |
| [Time-Based Sharding](/documentation/tutorials-operations/time-based-sharding/index.md) | Efficiently manage time-series data with user-defined sharding. | None | 1h | Intermediate |
| [Large-Scale Search](/documentation/tutorials-operations/large-scale-search/index.md) | Cost-efficient search for LAION-400M datasets. | None | 48h | Advanced |
| [Qdrant Cloud Prometheus Monitoring](/documentation/ops-monitoring/managed-cloud-prometheus/index.md) | Observability with Prometheus and Grafana. | Prometheus | 30m | Intermediate |
| [Self-Hosted Prometheus Monitoring](/documentation/ops-monitoring/hybrid-cloud-prometheus/index.md) | Observability for hybrid/private cloud setups. | Prometheus | 30m | Intermediate |
---
### Develop & Implement
*Core tools and APIs for building with Qdrant.*
| Tutorial | Objective | Stack | Time | Level |
| :--- | :--- | :--- | :--- | :--- |
| [Bulk Operations](/documentation/tutorials-develop/bulk-upload/index.md) | High-scale ingestion approaches. | Python | 20m | Intermediate |
| [Async API](/documentation/tutorials-develop/async-api/index.md) | Use Asynchronous programming for efficiency. | Python | 25m | Intermediate |
---
### Migrate to Qdrant
*Move your vectors from other databases and keep them in sync.*
| Tutorial | Objective | Stack | Time | Level |
| :--- | :--- | :--- | :--- | :--- |
| [Migration Tool Overview](/documentation/migrate-to-qdrant/index.md) | Migrate vectors from any supported source. | CLI | Varies | Intermediate |
| [From Pinecone](/documentation/migrate-to-qdrant/from-pinecone/index.md) | Migrate from Pinecone serverless indexes. | CLI | 15m | Intermediate |
| [From Weaviate](/documentation/migrate-to-qdrant/from-weaviate/index.md) | Migrate from Weaviate (pre-create collection). | CLI | 20m | Intermediate |
| [From Milvus](/documentation/migrate-to-qdrant/from-milvus/index.md) | Migrate from Milvus/Zilliz with partitions. | CLI | 15m | Intermediate |
| [From Elasticsearch](/documentation/migrate-to-qdrant/from-elasticsearch/index.md) | Migrate dense vectors from Elasticsearch. | CLI | 15m | Intermediate |
| [From pgvector](/documentation/migrate-to-qdrant/from-pgvector/index.md) | Migrate from PostgreSQL pgvector tables. | CLI | 15m | Intermediate |
| [Migration Verification](/documentation/migration-guidance/index.md) | Verify data integrity and search quality. | Python | 1h+ | Intermediate |
| [Keeping Postgres in Sync](/documentation/data-synchronization/index.md) | Keep Postgres and Qdrant in sync. | Python | 30m | Intermediate |