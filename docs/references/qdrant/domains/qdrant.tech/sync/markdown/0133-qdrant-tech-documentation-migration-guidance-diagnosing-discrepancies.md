Diagnosing Discrepancies - Qdrant
* [Documentation](https://qdrant.tech/documentation/)
*
* [Migration Guidance](https://qdrant.tech/documentation/migration-guidance/)
*
* Diagnosing Discrepancies# Diagnosing Discrepancies
When verification catches a problem, you need to determine whether it&rsquo;s a data issue (something went wrong during migration) or a configuration issue (the data is correct but the systems behave differently). This page provides a diagnostic decision tree and vendor-specific gotchas.
## Decision Tree
Start here when any verification check fails:
```
`Is the vector count wrong?
├─ Yes → Data-level issue
│ ├─ Count lower than expected → Check migration script logs for errors,
│ │ timeouts, or partial failures. Re-run for missing segments.
│ ├─ Count higher than expected → Check for duplicate inserts (retried batches)
│ │ or source count excluding namespaces/partitions.
│ └─ Count matches but IDs differ → ID mapping error during migration.
│
└─ No (count matches) → Continue
│
Are metadata fields missing or wrong type?
├─ Yes → Payload mapping issue
│ ├─ Fields missing → Source system may omit null fields on export.
│ │ Check migration script's null handling.
│ ├─ Types changed → See "Type Coercion" section below.
│ └─ Values differ → Encoding issue (UTF-8, special characters, unicode normalization).
│
└─ No (metadata looks correct) → Continue
│
Are search results completely different?
├─ Yes → Configuration-level issue
│ ├─ Check distance metric (most common cause)
│ ├─ Check if index is built (HNSW may not be built yet on fresh data)
│ └─ Check if vectors are normalized (affects cosine vs. dot product)
│
└─ No (results overlap but differ at the margins) → Expected behavior
│
Is recall@10 below 0.85?
├─ Yes → Indexing parameter mismatch
│ ├─ Compare HNSW ef\_construction and M values
│ ├─ Compare ef (search-time) parameters
│ └─ Check quantization settings
│
└─ No → Migration is working correctly.
Results differ on borderline cases due to
ANN approximation. This is normal.
`
```
## Configuration-Level Issues
### Distance Metric Mismatch
The most impactful configuration error. Here&rsquo;s how metrics map across systems:
|Source System|Source Metric|Qdrant Equivalent|Notes|
|Pinecone|`cosine`|`Cosine`|Direct mapping|
|Pinecone|`dotproduct`|`Dot`|Pinecone requires unit-normalized vectors for dotproduct|
|Pinecone|`euclidean`|`Euclid`|Direct mapping|
|Weaviate|`cosine`|`Cosine`|Direct mapping|
|Weaviate|`l2-squared`|`Euclid`|Qdrant uses L2, not L2-squared; scores will differ in magnitude but ranking is identical|
|Weaviate|`dot`|`Dot`|Direct mapping|
|Milvus|`COSINE`|`Cosine`|Direct mapping|
|Milvus|`L2`|`Euclid`|Direct mapping|
|Milvus|`IP` (inner product)|`Dot`|Direct mapping|
|Elasticsearch|`cosine`|`Cosine`|ES returns `1 - cosine\_distance`; Qdrant returns cosine similarity directly|
|pgvector|`vector\_cosine\_ops`|`Cosine`|pgvector returns distance (1 - similarity); Qdrant returns similarity|
|pgvector|`vector\_l2\_ops`|`Euclid`|Direct mapping|
|pgvector|`vector\_ip\_ops`|`Dot`|pgvector uses negative inner product for ordering; scores will be inverted|
**Diagnostic test:** Take a single query vector, compute its distance to a known target vector manually (using numpy), and compare against both systems:
```
`import numpy as np
query = np.array([...]) # Your query vector
target = np.array([...]) # A known result vector
# Manual distance calculations
cosine\_sim = np.dot(query, target) / (np.linalg.norm(query) \* np.linalg.norm(target))
dot\_product = np.dot(query, target)
euclidean = np.linalg.norm(query - target)
print(f"Cosine similarity: {cosine\_sim:.6f}")
print(f"Dot product: {dot\_product:.6f}")
print(f"Euclidean distance: {euclidean:.6f}")
# Compare against Qdrant's reported score
qdrant\_result = client.query\_points(
collection\_name="your\_collection",
query=query.tolist(),
limit=1,
)
print(f"Qdrant score: {qdrant\_result.points[0].score:.6f}")
# The Qdrant score should match one of the manual calculations.
# If it doesn't match the expected metric, the collection is misconfigured.
`
```
### HNSW Index Not Built
On a freshly migrated collection, the HNSW index may still be building. During this period, Qdrant falls back to brute-force search, which returns exact results (recall = 1.0). Once the index finishes building, results shift to approximate.
```
`# Check index status
collection\_info = client.get\_collection("your\_collection")
print(f"Indexed vectors: {collection\_info.indexed\_vectors\_count}")
print(f"Total vectors: {collection\_info.points\_count}")
if collection\_info.indexed\_vectors\_count \< collection\_info.points\_count:
print("⚠ Index is still building. Wait for completion before running search quality checks.")
`
```
**Gotcha:** If you run Tier 2 verification while the index is building, you&rsquo;ll get artificially high recall (brute-force is exact). Re-run after indexing completes to get the real numbers.
### Vector Normalization
Cosine similarity and dot product produce identical rankings when vectors are unit-normalized (L2 norm = 1.0). If your source system assumed normalized vectors and you switch to dot product (or vice versa) during migration, results will differ.
```
`# Check if vectors are normalized
sample\_points = client.scroll(
collection\_name="your\_collection",
limit=100,
with\_vectors=True,
)[0]
norms = [np.linalg.norm(p.vector) for p in sample\_points]
print(f"Vector norms: min={min(norms):.4f}, max={max(norms):.4f}, mean={np.mean(norms):.4f}")
if all(abs(n - 1.0) \< 0.001 for n in norms):
print("Vectors are unit-normalized. Cosine and Dot produce equivalent rankings.")
else:
print("Vectors are NOT normalized. Cosine and Dot will produce different rankings.")
`
```
### Quantization Differences
If your source system uses one quantization scheme and Qdrant uses another (or none), scores will differ. This is expected and doesn&rsquo;t indicate data corruption.
|Source Quantization|Qdrant Quantization|Expected Impact|
|None|None|Scores should match closely|
|None|Scalar (int8)|Small score differences, recall may change by 1-2%|
|None|Product Quantization|Larger score differences, recall may drop 2-5% (tune `rescore` to compensate)|
|PQ|None|Qdrant results will be more accurate than source|
|PQ|PQ|Scores will differ (different codebooks), but recall should be comparable|
## Data-Level Issues
### Partial Migration Failures
The most common data-level issue: a batch upload timed out or errored, and the migration script didn&rsquo;t retry.
```
`# Find missing IDs by comparing source and Qdrant
all\_ids = set()
offset = None
while True:
records, offset = client.scroll(
collection\_name="your\_collection",
limit=1000,
offset=offset,
with\_payload=False,
with\_vectors=False,
)
all\_ids.update(r.id for r in records)
if offset is None:
break
# Compare against source IDs
source\_ids = set(baseline["all\_ids"]) # Or load from your mapping file
missing = source\_ids - all\_ids
if missing:
print(f"Missing {len(missing)} IDs. First 10: {list(missing)[:10]}")
`
```
### Type Coercion Problems
When metadata types change during migration, filtered search breaks silently. The filter executes without error but matches zero documents.
**Debugging approach:**
```
`# Verify what types Qdrant stored
sample = client.scroll(
collection\_name="your\_collection",
limit=1,
with\_payload=True,
)[0][0]
for field, value in sample.payload.items():
print(f" {field}: {type(value).\_\_name\_\_} = {value!r}")
`
```
**Common fixes:**
|Problem|Fix|
|Integer stored as float|Use range filter (`gte`/`lte`) instead of exact match, or re-upload with explicit int casting|
|Boolean stored as string|Re-upload the affected payload field with `client.set\_payload()`|
|Array flattened to single value|Re-upload; check your migration script&rsquo;s array handling|
|Nested object lost structure|Re-upload with correct nesting; Qdrant supports nested payloads|
### Encoding and Unicode Issues
Metadata strings with non-ASCII characters, emoji, or special Unicode can be mangled during migration if encoding isn&rsquo;t handled consistently.
```
`# Spot-check strings with non-ASCII content
import unicodedata
for record in sample\_records:
for field, value in record.payload.items():
if isinstance(value, str) and not value.isascii():
# Check for common encoding issues
try:
value.encode("utf-8").decode("utf-8")
except UnicodeError:
print(f" Encoding issue: {field} in record {record.id}")
`
```
## Vendor-Specific Gotchas
**From Pinecone**
* **Namespace handling:** Pinecone namespaces don&rsquo;t have a direct Qdrant equivalent. Common approach: migrate each namespace as a separate collection, or merge into one collection with a `namespace` payload field. Verify your approach preserved the separation correctly.
* **Metadata size limits:** Pinecone limits metadata to 40KB per vector. Qdrant has no per-payload size limit, so this shouldn&rsquo;t cause issues. But if your migration script truncated metadata to fit Pinecone&rsquo;s limit, the truncated version is what you&rsquo;re migrating.
* **Score scaling:** Pinecone cosine similarity returns values in [0, 1] (rescaled). Qdrant returns [-1, 1]. Rankings are identical, but raw scores won&rsquo;t match.**From Weaviate**
* **GraphQL to REST:** Weaviate&rsquo;s GraphQL query model is structurally different from Qdrant&rsquo;s REST/gRPC API. Filter translation is the most error-prone step. Verify each filter type (string match, numeric range, boolean, array containment) individually.
* **Cross-references:** Weaviate cross-references don&rsquo;t have a direct equivalent. Store referenced IDs as payload fields and rebuild the linking in your application layer.
* **Module dependencies:** If you used Weaviate modules (e.g., `text2vec-openai`), the vectorization happened server-side. Ensure you exported the actual vectors, not the source text alone.**From Milvus / Zilliz**
* **Schema strictness:** Milvus enforces schema on write; Qdrant is schema-flexible. Verify that schema-less flexibility didn&rsquo;t cause payload fields to drift during migration.
* **Partition mapping:** Milvus partitions can map to Qdrant collections or payload filters. Verify the mapping preserved query isolation.
* **Dynamic fields:** Milvus dynamic fields (introduced in 2.3) may serialize differently. Check that JSON-typed dynamic fields survived the migration with correct structure.**From Elasticsearch**
* **BM25 + vector hybrid:** If your ES setup used hybrid BM25 + kNN scoring, you&rsquo;ll need to reconstruct this in Qdrant using sparse vectors (for BM25-like behavior) alongside dense vectors. The scores won&rsquo;t match 1:1 because the ranking models are different.
* **Nested documents:** ES nested documents need to be flattened or restructured for Qdrant&rsquo;s payload model.
* **Score normalization:** ES `\_score` values are not comparable to Qdrant scores. Don&rsquo;t use raw score comparison; use rank-based metrics (recall@k, Spearman correlation).**From pgvector**
* **Partition structure:** If you had manual partitions in pgvector (common at scale), verify that all partitions were migrated, not just the primary table.
* **NULL handling:** PostgreSQL NULLs may be dropped during export. Check that optional fields are represented correctly in Qdrant payloads.
* **Index type:** pgvector supports IVFFlat and HNSW. The index type affects which results you captured in your baseline. If your baseline was captured with IVFFlat (lower recall), Qdrant&rsquo;s HNSW may return better results. This looks like a &ldquo;mismatch&rdquo; but is an improvement.## When to Re-Migrate vs. Adjust Configuration
|Diagnosis|Action|
|Distance metric wrong|Re-create collection with correct metric; re-upload vectors|
|HNSW parameters suboptimal|Adjust parameters and wait for re-indexing (no re-upload needed)|
|Missing vectors|Re-run migration for missing batches only (use upsert)|
|Metadata types wrong|Use `set\_payload` to fix affected fields (no vector re-upload needed)|
|Payload fields missing|Use `set\_payload` to add missing fields from source export|
|Quantization causing recall drop|Adjust quantization settings or enable rescoring|
|Everything checks out but &ldquo;feels wrong&rdquo;|Build Tier 3 evaluation data. &ldquo;Feels wrong&rdquo; without metrics isn&rsquo;t actionable.|
**Previous:** [Search Quality Verification](https://qdrant.tech/documentation/migration-guidance/search-quality/) | **Start:** [Migration Verification Overview](https://qdrant.tech/documentation/migration-guidance/)
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/migration-guidance/diagnosing-discrepancies.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/migration-guidance/diagnosing-discrepancies/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/migration-guidance/diagnosing-discrepancies.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)