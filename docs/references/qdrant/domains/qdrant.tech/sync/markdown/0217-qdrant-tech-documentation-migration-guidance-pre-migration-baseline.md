Pre-Migration Baseline - Qdrant
* [Documentation](https://qdrant.tech/documentation/)
*
* [Migration Guidance](https://qdrant.tech/documentation/migration-guidance/)
*
* Pre-Migration Baseline# Pre-Migration Baseline
Establishing a baseline is paramount for migration verification. If you don&rsquo;t capture what &ldquo;correct&rdquo; looks like before you migrate, you have nothing to compare against afterward. This page covers what to record from your source system before starting the migration.
## What to Capture
There are four pieces of information that need to be accounted for when establishing a baseline: collection/index inventory, metadata samples, baseline search results, and system configuration snapshots.
### 1. Collection/Index Inventory
For every index/collection you plan to migrate, record the following information:
```
`For each collection:
- Name / identifier
- Vector count
- Vector dimensions
- Distance metric (cosine, dot product, euclidean)
- Index type and parameters (e.g., HNSW ef\_construction, M)
- Quantization settings (if any)
- Replication factor (if applicable)
`
```
Pay close attention to the distance metric. Distance metric mismatches are the single most common cause of search quality regressions after migration. Cosine similarity vs. dot product vs. Euclidean distance will produce different rankings from the same vectors. If your source system uses cosine and you accidentally configure Qdrant for dot product, every search result changes.
**Pinecone**
```
`# Pinecone baseline capture
import pinecone
# Record index stats
index = pinecone.Index("your-index")
stats = index.describe\_index\_stats()
baseline = {
"total\_vector\_count": stats.total\_vector\_count,
"dimension": stats.dimension,
"namespaces": {
ns: {"vector\_count": ns\_stats.vector\_count}
for ns, ns\_stats in stats.namespaces.items()
},
# Pinecone doesn't expose distance metric via API;
# check your index creation code or dashboard
"metric": "cosine", # VERIFY THIS MANUALLY
}
`
```
**Weaviate**
```
`# Weaviate baseline capture
import weaviate
client = weaviate.Client("http://localhost:8080")
schema = client.schema.get()
for cls in schema["classes"]:
baseline = {
"class\_name": cls["class"],
"vector\_count": client.query.aggregate(cls["class"]).with\_meta\_count().do(),
"distance\_metric": cls.get("vectorIndexConfig", {}).get("distance", "cosine"),
"ef\_construction": cls.get("vectorIndexConfig", {}).get("efConstruction"),
"vector\_dimensions": None, # Weaviate infers from data; check a sample vector
}
`
```
**Milvus / Zilliz**
```
`# Milvus baseline capture
from pymilvus import connections, Collection
connections.connect("default", host="localhost", port="19530")
collection = Collection("your\_collection")
collection.load()
baseline = {
"collection\_name": collection.name,
"num\_entities": collection.num\_entities,
"schema\_fields": [
{"name": f.name, "dtype": str(f.dtype), "dim": getattr(f, "dim", None)}
for f in collection.schema.fields
],
"index\_params": collection.indexes, # Capture index type + params
}
`
```
**Elasticsearch**
```
`# Elasticsearch baseline capture
from elasticsearch import Elasticsearch
es = Elasticsearch("http://localhost:9200")
# Get mapping to find vector field config
mapping = es.indices.get\_mapping(index="your\_index")
stats = es.count(index="your\_index")
baseline = {
"index\_name": "your\_index",
"document\_count": stats["count"],
"mapping": mapping, # Contains vector field type, dims, similarity metric
}
`
```
**pgvector**
```
`-- pgvector baseline capture
SELECT
relname AS table\_name,
n\_live\_tup AS approximate\_row\_count
FROM pg\_stat\_user\_tables
WHERE relname = 'your\_embeddings\_table';
-- Vector dimensions (check first row)
SELECT vector\_dims(embedding) FROM your\_embeddings\_table LIMIT 1;
-- Index configuration
SELECT indexname, indexdef
FROM pg\_indexes
WHERE tablename = 'your\_embeddings\_table';
-- Distance metric: check your index definition
-- ivfflat with vector\_cosine\_ops = cosine
-- ivfflat with vector\_l2\_ops = euclidean
-- ivfflat with vector\_ip\_ops = inner product (dot)
`
```
### 2. Metadata Sample
Export a representative sample of metadata (or payloads) from your source system. You&rsquo;ll use this for field-by-field comparison after migration.
**How much to sample:** At least 1,000 records or 1% of your data, *whichever is larger*. For datasets under 100K vectors, consider exporting all metadata.
**What to record for each sample:**
```
`- Point/document ID
- All metadata fields with their values
- Metadata field types (string, integer, float, boolean, array, nested object)
- Any null/missing fields (important: some systems drop nulls on export)
`
```
Metadata type coercion is a subtle migration failure. A field stored as an integer in Pinecone might arrive as a float in Qdrant. A boolean stored as `"true"` (string) in Elasticsearch will need explicit type handling. These mismatches don&rsquo;t cause errors during import, but they break filtered search queries.
### 3. Baseline Search Queries
The most valuable baseline you can capture is search quality. Select 10 to 50 queries that represent your actual search workload:
```
`# Structure for recording baseline queries
baseline\_queries = [
{
"query\_id": "q001",
"description": "Product search: running shoes",
"query\_vector": [...], # The actual query vector
"filters": {"category": "footwear", "in\_stock": True}, # If applicable
"top\_k": 10,
"source\_results": [
{"id": "doc\_123", "score": 0.95, "rank": 1},
{"id": "doc\_456", "score": 0.91, "rank": 2},
# ... full top-k
],
"timestamp": "2026-03-10T14:30:00Z",
"source\_system": "pinecone",
"source\_index": "products-v2",
},
]
`
```
**How to choose representative queries:**
* Include your most frequent production queries (check logs)
* Include edge cases: queries with highly selective filters, queries that return few results, queries across multiple data types
* Include queries from different parts of the vector space (test across multiple clusters, not a single region of similar queries)
* If you use hybrid search (dense + sparse), capture both components
**What to record for each query:**
* The query vector itself (exact floats, not re-embedded)
* Any metadata filters applied
* The top-k value used
* The full ranked result list with scores
* Whether re-ranking was applied### 4. System Configuration Snapshot
Record the configuration of your source system that affects search behavior:
```
`- Software version (e.g., Pinecone API version, Weaviate 1.24, Milvus 2.3)
- Index/collection creation parameters
- Quantization settings (PQ, SQ, none)
- HNSW parameters (ef\_construction, M, ef\_search) if applicable
- Segment/shard configuration
- Any custom scoring, re-ranking, or post-processing logic
- Client library version
`
```
When search results differ post-migration, you need to determine whether the difference comes from the data or the configuration. Without a configuration snapshot, you can&rsquo;t distinguish between &ldquo;the vectors migrated incorrectly&rdquo; and &ldquo;the indexing parameters produce different recall characteristics.&rdquo;
## Output
After completing this step, you should have four artifacts:
1. **Collection inventory** (JSON or YAML): names, counts, dimensions, metrics, index params
2. **Metadata sample** (JSONL): representative records with all fields and types
3. **Baseline queries** (JSON): query vectors, filters, and source system results
4. **Configuration snapshot** (text): source system settings that affect search behavior
Store these alongside your migration scripts. You&rsquo;ll reference them in every subsequent verification step.
**Next:** [Data Integrity Verification](https://qdrant.tech/documentation/migration-guidance/data-integrity/)
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/migration-guidance/pre-migration-baseline.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/migration-guidance/pre-migration-baseline/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/migration-guidance/pre-migration-baseline.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)