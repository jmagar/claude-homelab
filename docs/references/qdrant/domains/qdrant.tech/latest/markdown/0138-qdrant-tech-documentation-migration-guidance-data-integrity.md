Data Integrity - Qdrant
* [Documentation](https://qdrant.tech/documentation/)
*
* [Migration Guidance](https://qdrant.tech/documentation/migration-guidance/)
*
* Data Integrity# Data Integrity Verification
Once you&rsquo;ve established a [baseline](https://qdrant.tech/documentation/migration-guidance/pre-migration-baseline/), you first need to check data integrity. Data integrity answers the question: &ldquo;Did all my data arrive, and did it arrive correctly?&rdquo; These are the fastest checks to run and catch the most common migration failures.
## 1. Vector Count Verification
The simplest check: does the number of vectors in Qdrant match your source system?
```
`from qdrant\_client import QdrantClient
client = QdrantClient("localhost", port=6333)
# Get collection info
collection\_info = client.get\_collection("your\_collection")
qdrant\_count = collection\_info.points\_count
# Compare against baseline
source\_count = baseline["total\_vector\_count"] # From pre-migration capture
if qdrant\_count == source\_count:
print(f"✓ Vector count matches: {qdrant\_count}")
else:
diff = source\_count - qdrant\_count
pct = (diff / source\_count) \* 100
print(f"✗ Count mismatch: source={source\_count}, qdrant={qdrant\_count}, "
f"missing={diff} ({pct:.2f}%)")
`
```
**Common causes of count mismatches:**
|Symptom|Likely Cause|
|Qdrant count is lower|Migration script failed partway through; duplicate IDs in source were deduplicated; source count included soft-deleted records|
|Qdrant count is higher|Duplicate inserts from a retried migration; source count didn&rsquo;t include all namespaces/partitions|
|Counts match but data is wrong|ID collision: different vectors mapped to the same point ID|
**When exact match isn&rsquo;t expected:** Some source systems count differently. Pinecone&rsquo;s `describe\_index\_stats` counts across all namespaces; if you migrated only a subset, the counts won&rsquo;t match. pgvector&rsquo;s `n\_live\_tup` is an estimate. Document these expected discrepancies before concluding the migration failed.
## 2. Vector Dimension Verification
Confirm that vector dimensions match your source configuration:
```
`collection\_info = client.get\_collection("your\_collection")
qdrant\_dim = collection\_info.config.params.vectors.size
# For named vectors:
# qdrant\_dim = collection\_info.config.params.vectors["dense"].size
source\_dim = baseline["dimension"]
assert qdrant\_dim == source\_dim, (
f"Dimension mismatch: source={source\_dim}, qdrant={qdrant\_dim}"
)
`
```
**If dimensions don&rsquo;t match:** This almost always indicates a migration script error (e.g., truncated vectors, wrong embedding model used for re-embedding). Do not proceed with further verification until this is resolved.
## 3. Distance Metric Verification
Verify the distance metric matches your source system&rsquo;s configuration:
```
`qdrant\_metric = collection\_info.config.params.vectors.distance
# Returns: "Cosine", "Euclid", or "Dot"
# Map source system metrics to Qdrant equivalents
METRIC\_MAP = {
# Pinecone
"cosine": "Cosine",
"euclidean": "Euclid",
"dotproduct": "Dot",
# Weaviate
"l2-squared": "Euclid",
# Milvus
"COSINE": "Cosine",
"L2": "Euclid",
"IP": "Dot",
}
expected\_metric = METRIC\_MAP.get(baseline["metric"])
assert qdrant\_metric == expected\_metric, (
f"Distance metric mismatch: source={baseline['metric']} "
f"(expected {expected\_metric}), qdrant={qdrant\_metric}"
)
`
```
A distance metric mismatch is a silent error. When migrating, the vectors still load, and queries still return results. For example, cosine similarity and dot product produce identical rankings only when vectors are unit-normalized. If your vectors aren&rsquo;t normalized and you switch between cosine and dot product, every search result changes.
## 4. Metadata (Payload) Verification
Metadata verification checks three things: field presence, field types, and field values.
### 4a. Field Presence
Check that all expected metadata fields exist in Qdrant:
```
`import random
# Sample points from Qdrant using scroll
records, \_next = client.scroll(
collection\_name="your\_collection",
limit=1000,
with\_payload=True,
with\_vectors=False, # Skip vectors to speed up the check
)
# Collect all field names across sampled records
qdrant\_fields = set()
for record in records:
if record.payload:
qdrant\_fields.update(record.payload.keys())
source\_fields = set(baseline["metadata\_fields"])
missing = source\_fields - qdrant\_fields
extra = qdrant\_fields - source\_fields
if missing:
print(f"✗ Fields missing in Qdrant: {missing}")
if extra:
print(f"⚠ Extra fields in Qdrant (may be expected): {extra}")
if not missing and not extra:
print(f"✓ All {len(source\_fields)} metadata fields present")
`
```
### 4b. Field Type Consistency
Check that field types survived the migration:
```
`def check\_field\_types(source\_record, qdrant\_record):
"""Compare field types between source and Qdrant records."""
issues = []
for field, source\_value in source\_record.items():
if field not in qdrant\_record:
issues.append(f" {field}: missing in Qdrant")
continue
qdrant\_value = qdrant\_record[field]
if type(source\_value) != type(qdrant\_value):
issues.append(
f" {field}: type changed from "
f"{type(source\_value).\_\_name\_\_} to {type(qdrant\_value).\_\_name\_\_} "
f"(source={source\_value!r}, qdrant={qdrant\_value!r})"
)
return issues
`
```
**Common type coercion issues:**
|Source Type|Qdrant Arrival|Impact|
|Integer → Float|`42` → `42.0`|Filter `= 42` may fail; use range filter instead|
|Boolean → String|`true` → `"true"`|Filter `= true` returns no results|
|Nested object → Flattened|`{"a": {"b": 1}}` → `{"a.b": 1}`|Nested filter syntax won&rsquo;t match|
|Array → Single value|`["tag1", "tag2"]` → `"tag1"`|Array containment filters break|
|Null → Missing field|`null` → (field absent)|`is\_null` filter won&rsquo;t find it|
### 4c. Field Value Spot-Check
For your sampled records, compare actual values:
```
`def spot\_check\_values(source\_sample, qdrant\_collection, client):
"""Compare metadata values for sampled records."""
mismatches = []
for source\_record in source\_sample:
point\_id = source\_record["id"]
qdrant\_points = client.retrieve(
collection\_name=qdrant\_collection,
ids=[point\_id],
with\_payload=True,
)
if not qdrant\_points:
mismatches.append({"id": point\_id, "issue": "Point not found in Qdrant"})
continue
qdrant\_payload = qdrant\_points[0].payload
for field, source\_value in source\_record["metadata"].items():
qdrant\_value = qdrant\_payload.get(field)
if source\_value != qdrant\_value:
mismatches.append({
"id": point\_id,
"field": field,
"source": source\_value,
"qdrant": qdrant\_value,
})
return mismatches
`
```
## 5. Point ID Verification
Check for duplicate or orphaned point IDs:
```
`# Scroll through all points and collect IDs
all\_ids = []
next\_offset = None
while True:
records, next\_offset = client.scroll(
collection\_name="your\_collection",
limit=1000,
offset=next\_offset,
with\_payload=False,
with\_vectors=False,
)
all\_ids.extend([r.id for r in records])
if next\_offset is None:
break
# Check for duplicates
if len(all\_ids) != len(set(all\_ids)):
duplicates = [id for id in all\_ids if all\_ids.count(id) \> 1]
print(f"✗ Found {len(duplicates)} duplicate point IDs")
else:
print(f"✓ No duplicate point IDs ({len(all\_ids)} unique)")
`
```
**Note on ID mapping:** If your source system uses string IDs and you mapped them to integer IDs (or vice versa) during migration, maintain a mapping file and verify it&rsquo;s consistent.
## 6. Vector Value Spot-Check
For a small sample, verify that the actual vector values match:
```
`import numpy as np
def verify\_vectors(source\_vectors, qdrant\_collection, client, tolerance=1e-6):
"""Spot-check that vector values match between source and Qdrant."""
mismatches = []
for source in source\_vectors:
qdrant\_points = client.retrieve(
collection\_name=qdrant\_collection,
ids=[source["id"]],
with\_vectors=True,
)
if not qdrant\_points:
mismatches.append({"id": source["id"], "issue": "not found"})
continue
source\_vec = np.array(source["vector"])
qdrant\_vec = np.array(qdrant\_points[0].vector)
if not np.allclose(source\_vec, qdrant\_vec, atol=tolerance):
max\_diff = np.max(np.abs(source\_vec - qdrant\_vec))
mismatches.append({
"id": source["id"],
"max\_difference": float(max\_diff),
})
return mismatches
`
```
**Expected tolerance:** Exact float equality (tolerance=0) is too strict if quantization is applied on either side. If you&rsquo;re using scalar quantization in Qdrant, expect small differences. If neither system uses quantization, values should match exactly.
## Passing Criteria
|Check|Pass|Investigate|
|Vector count|Exact match (or within documented tolerance)|Any unexplained difference|
|Dimensions|Exact match|Any mismatch (stop here)|
|Distance metric|Maps correctly to Qdrant equivalent|Any mismatch (stop here)|
|Metadata fields|All source fields present|Missing fields|
|Metadata types|Types preserved or intentionally converted|Unexpected type changes|
|Metadata values|Spot-check sample matches|\>1% mismatch rate|
|Point IDs|No duplicates, all source IDs present|Missing or duplicate IDs|
|Vector values|Within tolerance (1e-6 without quantization)|Differences exceeding tolerance|
**Next:** [Search Quality Verification](https://qdrant.tech/documentation/migration-guidance/search-quality/)
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/migration-guidance/data-integrity.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/migration-guidance/data-integrity/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/migration-guidance/data-integrity.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)