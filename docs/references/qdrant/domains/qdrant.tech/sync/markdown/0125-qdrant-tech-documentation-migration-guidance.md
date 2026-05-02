Migration Guidance - Qdrant
* [Documentation](https://qdrant.tech/documentation/)
*
* Migration Guidance# Migration Guidance
Switching databases is often necessary to improve the performance and costs of large software systems. As the size of data continues to grow, navigating this migration can be tricky. While a migration might appear to have been successful, several silent errors may be occurring. Some examples include: data loss, metadata drift, and search quality regressions. These problems can hide behind a successful import. To help mitigate these issues, this guide gives you a structured framework to verify that your migration worked correctly.
## Who This Guide Is For
Engineers and teams migrating to Qdrant from another vector search system (Pinecone, Weaviate, Milvus/Zilliz, Elasticsearch, pgvector, or any custom FAISS/ScaNN deployment). The verification steps are system-agnostic on the source side. That is, you capture baselines from your current system, then validate against Qdrant.
## Prerequisites
Before starting verification, you need:
* Access to your source system (to capture baselines)
* A Qdrant instance with your migrated data loaded
* Python 3.8+ with the `qdrant-client` library installed (code examples use Python, but the concepts apply to any client)
* The [Qdrant Migration Tool](https://qdrant.tech/documentation/migrate-to-qdrant/) already run## The Four Stages of Verification
This guide proposes four distinct stages of verification, each building on the next to ensure a successful migration:
1. **[Pre-Migration Baseline](https://qdrant.tech/documentation/migration-guidance/pre-migration-baseline/):** Before starting the migration, capture what &ldquo;correct&rdquo; looks like in your source system. This includes vector counts, metadata samples, collection configuration, and baseline search results. Without this, post-migration comparison is impossible. *Budget 15 to 30 minutes*.
2. **[Data Integrity](https://qdrant.tech/documentation/migration-guidance/data-integrity/):** After migration, verify that the data arrived intact. This layer catches missing vectors, dropped metadata fields, type coercion errors, and misconfigured collections. These checks take only minutes to run and catch the most common migration failures.
3. **[Search Quality](https://qdrant.tech/documentation/migration-guidance/search-quality/):** This layer catches result ranking changes, recall degradation, and relevance shifts caused by differences in indexing, quantization, or scoring between systems. *Depending on the tier you choose, this takes anywhere from 15 minutes to several hours.*
4. **[Diagnosing Discrepancies](https://qdrant.tech/documentation/migration-guidance/diagnosing-discrepancies/):** When any of the previous layers catches a problem, this section provides a decision tree for root-causing it: is the issue in the data or the configuration? Which vendor-specific gotcha is responsible? What&rsquo;s the fastest path to resolution?## Quick Reference: Verification Checklist
Use this as a summary after reading the full guide.
```
`PRE-MIGRATION
[ ] Capture vector count per collection/index
[ ] Export sample metadata records (at least 1,000 or 1% of data, whichever is larger)
[ ] Record collection configuration (distance metric, dimensions, index params)
[ ] Run and record baseline queries (10-50 representative queries with top-k results)
[ ] Note your source system's version, quantization settings, and index configuration
DATA INTEGRITY (post-migration)
[ ] Vector count matches source (exact or within expected tolerance)
[ ] Sample metadata spot-check passes (field names, types, values)
[ ] Collection configuration matches intent (distance metric, vector dimensions)
[ ] No orphaned or duplicate point IDs
SEARCH QUALITY
[ ] Tier 1: Spot-check 5-10 queries, results look reasonable
[ ] Tier 2: Recall@k on 50+ sampled queries meets threshold (e.g., ≥0.9)
[ ] Tier 3: (If applicable) NDCG/MRR on labeled evaluation set meets target
DISCREPANCY DIAGNOSIS (if checks fail)
[ ] Identify whether issue is data-level or configuration-level
[ ] Check distance metric alignment
[ ] Check quantization and indexing parameter differences
[ ] Check metadata type mapping
`
```
**Next:** [Pre-Migration Baseline](https://qdrant.tech/documentation/migration-guidance/pre-migration-baseline/)
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/migration-guidance/_index.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/migration-guidance/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/migration-guidance/_index.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)