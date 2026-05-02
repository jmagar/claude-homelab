---
name: qdrant-quality
description: Run the Qdrant collection quality analysis and interpret the results. Checks embedding density, duplicate detection, thin-content ratio, and overall collection health. Use when diagnosing poor RAG retrieval quality, after large crawl operations, or when axon query/ask results feel stale or irrelevant.
---

## Qdrant Quality Analysis

### Run the analysis

```bash
cd /home/jmagar/workspace/axon_rust
python3 scripts/qdrant-quality.py --collection cortex 2>&1 | tee /tmp/qdrant-quality-report.txt
```

To target a different collection:
```bash
python3 scripts/qdrant-quality.py --collection <name>
```

To get JSON output for programmatic use:
```bash
python3 scripts/qdrant-quality.py --collection cortex --json 2>/dev/null
```

### Interpret Results

**Thin content ratio > 15%**
Re-crawl with default flags (thin dropping is already on). The root cause is usually `readability: true` being set somewhere — confirm `build_transform_config()` in `crates/core/content.rs` has `readability: false`. VitePress/SSR docs produce ~97% thin pages with readability enabled.

Fix:
```bash
./scripts/axon crawl <url> --drop-thin-markdown true --min-markdown-chars 200 --wait true
```

**Duplicate ratio > 10%**
Sitemap backfill is likely double-indexing URLs already fetched by the crawler, or `--embed true` ran twice without pre-delete.

Fix:
```bash
./scripts/axon embed --predelete true <url>
# or for a full collection dedup pass:
./scripts/axon dedupe
```

**Low embedding density (points per URL < 3)**
Pages are being chunked at <2000 chars, indicating very short content. Check if thin pages slipped through. TEI batch sizing may also be the issue.

Fix: Check `AXON_EMBED_DOC_TIMEOUT_SECS` and `TEI_MAX_CLIENT_BATCH_SIZE`. Verify TEI is healthy:
```bash
./scripts/axon doctor
```

**Stale points (points without a live URL)**
Points in Qdrant reference URLs that no longer exist or were recrawled under a new URL scheme.

Fix:
```bash
./scripts/axon dedupe
# or delete and re-embed a specific source:
./scripts/axon embed <url> --predelete true --wait true
```

**High failed/canceled job ratio in job tables**
Workers may have crashed during embedding. Check worker logs:
```bash
docker compose logs axon-workers --tail 100
```

Then recover stale jobs:
```bash
./scripts/axon crawl recover
```

### When to Run

- After any crawl that produced unexpected results
- When `axon ask` answers feel off-topic or outdated
- After a Docker restart that interrupted workers mid-job
- Monthly maintenance on large collections (>500k points)

### Quick Stats (no full analysis)
```bash
./scripts/axon stats
./scripts/axon sources | head -30
./scripts/axon domains
```
