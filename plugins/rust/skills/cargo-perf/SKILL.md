---
name: cargo-perf
description: Profile a slow axon CLI command. Identifies Qdrant full-collection scroll hotspots, Postgres N+1 queries, and async bottlenecks. Follows the axon performance pattern established for sources/stats/suggest fixes: facets > scroll, parallel > sequential, capped > unbounded.
---

## Axon Command Performance Investigation

### Step 1 — Measure baseline

```bash
time ./scripts/axon <command> [args] --json 2>/dev/null
```

Anything >500ms for a non-crawl command is a red flag. Known baselines:
- `sources`: ~8ms (facet endpoint)
- `stats`: ~7ms (parallelized postgres)
- `query`: ~200ms (vector search — acceptable)
- `suggest`: ~1s (capped scroll)

### Step 2 — Find Qdrant scroll-all calls (most common culprit)

Full-collection scans are O(n) on point count. With 2.57M+ points in `cortex`, these are slow by definition.

```bash
grep -rn 'qdrant_scroll_pages\|qdrant_indexed_urls' crates/
```

For aggregation queries (counting, listing unique values): replace with the `/facet` endpoint.
For dedup/full-scan operations: add an env-var cap.

**Facet pattern** (replaces full scroll for URL listing):
```rust
// POST /collections/{name}/facet
// Body: {"key": "url", "limit": limit}
// Returns unique values with counts — no scrolling needed
let facet_url = format!("{}/collections/{}/facet", qdrant_url, collection);
```

**Env-var cap pattern**:
```rust
let limit = std::env::var("AXON_<COMMAND>_LIMIT")
    .ok()
    .and_then(|v| v.parse::<usize>().ok())
    .unwrap_or(50_000);
```

### Step 3 — Find Postgres N+1 queries

```bash
grep -rn 'sqlx::query\|query!\|query_as!' crates/cli/commands/<command>.rs crates/core/
```

Look for `query` calls inside loops or `.map()` chains. Refactor to:
- A single `JOIN` query
- `future::join_all()` for parallel fetches
- `tokio::join!()` for a fixed set of independent queries

**Parallelization pattern** (from `stats` fix):
```rust
let (metric_a, metric_b, metric_c) = tokio::join!(
    fetch_metric_a(&pool),
    fetch_metric_b(&pool),
    fetch_metric_c(&pool),
);
```

### Step 4 — Check for sequential awaits that can parallelize

```bash
grep -n '\.await' crates/cli/commands/<command>.rs | head -30
```

Three or more sequential `.await` calls with no dependency between them = `tokio::join!` candidate.

### Step 5 — Verify with timing after fix

```bash
time ./scripts/axon <command> [args] --json 2>/dev/null
```

Document the before/after in `CHANGELOG.md` under `### Performance`.

### Known Patterns — What Was Fixed

| Command | Root Cause | Fix Applied |
|---------|-----------|-------------|
| `sources` | `qdrant_scroll_pages` full 2.57M scan | `/facet` endpoint, `AXON_SOURCES_FACET_LIMIT` cap |
| `stats` | 24 sequential Postgres queries | `tokio::join!` parallelization |
| `suggest` | `qdrant_indexed_urls(cfg, None)` unbounded scroll | `AXON_SUGGEST_INDEX_LIMIT` cap (50k default) |

### Red Flags to Audit Next

Any command using these patterns on the main `cortex` collection needs a cap or replacement:
- `qdrant_scroll_pages` with no limit parameter
- `qdrant_indexed_urls(cfg, None)` — the `None` means unbounded
- Sequential Postgres queries in a loop

Check with:
```bash
grep -rn 'qdrant_scroll_pages\|qdrant_indexed_urls.*None' crates/ | grep -v test
```
