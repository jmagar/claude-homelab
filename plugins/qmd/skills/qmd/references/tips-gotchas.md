# qmd Tips & Gotchas

---

## CRITICAL: Pre-Download Models Before Enabling the MCP Plugin

**`qmd mcp` (the MCP server started by `.mcp.json`) loads GGUF models lazily — on the first tool call, not at startup.** If models are not cached, the first call stalls while ~2GB of files download from HuggingFace. Claude Code's MCP tool timeout will fire before the download completes, leaving all qmd tools unavailable.

**Required pre-activation steps:**

```sh
# Step 1: Create at least one collection
qmd collection add ~/notes --name notes
# (or any directory you want to index)

# Step 2: Build embeddings — downloads the embedding model (~300MB)
qmd embed

# Step 3: Run a test query — downloads reranker + query expansion models (~1.7GB)
qmd query "test warmup"
```

After all three steps complete, `~/.cache/qmd/models/` contains all three GGUF files and the MCP server can start tools in under 2 seconds.

---

## Partial Download Recovery

If a download is interrupted mid-way (network drop, power loss, Ctrl+C):

1. Check what's in `~/.cache/qmd/models/` — partial files may have a `.part` or incomplete extension
2. Delete any incomplete model files manually
3. Re-run the download step (`qmd embed` for the embedding model, `qmd query "test"` for reranker/expansion)
4. If corruption is suspected, run `qmd cleanup` to vacuum the database, then re-embed

```sh
# Check model cache size
du -sh ~/.cache/qmd/models/

# Expected sizes when complete:
# embeddinggemma-300M-Q8_0.gguf  ~300MB
# qwen3-reranker-0.6b-q8_0.gguf ~640MB
# qmd-query-expansion-*.gguf     ~1.1GB

# If you need to start fresh
rm -rf ~/.cache/qmd/models/
qmd embed && qmd query "test"
```

---

## Air-Gapped / Offline Setup with QMD_EMBED_MODEL

For environments without HuggingFace access, download models on a connected machine and transfer them:

```sh
# On connected machine: trigger downloads by running qmd normally
qmd embed
qmd query "test"

# Copy the models directory to the air-gapped machine
rsync -av ~/.cache/qmd/models/ airgapped-host:~/.cache/qmd/models/

# On air-gapped machine: point to a pre-downloaded local GGUF
export QMD_EMBED_MODEL="/path/to/embeddinggemma-300M-Q8_0.gguf"
qmd embed -f
```

For a fully custom embedding model that avoids HuggingFace entirely:

```sh
export QMD_EMBED_MODEL="hf:Qwen/Qwen3-Embedding-0.6B-GGUF/qwen3-embedding-0.6b-q8_0.gguf"
# Point to a local copy:
export QMD_EMBED_MODEL="/absolute/path/to/model.gguf"
```

Note: `QMD_EMBED_MODEL` only overrides the embedding model. The reranker and query expansion models (used by `qmd query`) still download from HuggingFace unless you modify `src/llm.ts` or skip the `query` command entirely.

---

## Cold-Start Latency for `query` Mode

Even after models are fully cached, the first `qmd_deep_search` (or `qmd query`) call in a session takes **5–30 seconds** to load the GGUF models into memory, depending on:

- System RAM and available memory (swapping adds significant time)
- Disk speed (NVMe vs. spinning disk)
- Model sizes (~2GB total to map into memory)

After the first call, models remain resident for ~5 minutes of idle time. On the next call after idle, there's a ~1 second reload penalty.

**Practical advice:**
- For interactive agentic use, prefer `qmd_search` (BM25, instant) or `qmd_vector_search` (fast after embed) when query quality is sufficient
- Reserve `qmd_deep_search` for cases where precision matters more than latency
- Accept the first-call warmup as a one-time cost per session

---

## The `--index` Flag Affects All Commands

If you set a custom index name, you must pass `--index` to every command:

```sh
# Wrong — creates a default index for collection add, separate index for search
qmd --index work collection add ~/work --name work
qmd search "query"                         # Searches default index — empty!

# Correct
qmd --index work collection add ~/work --name work
qmd --index work embed
qmd --index work search "query"
```

---

## Re-indexing After File Changes

qmd does not watch for file changes automatically. After adding, editing, or deleting markdown files:

```sh
qmd update          # Re-indexes all collections
qmd update --pull   # Git pull all collections first, then re-index
qmd embed -f        # Force re-embed (needed after changing QMD_EMBED_MODEL)
```

For agentic workflows that modify notes, call `qmd update` before running searches.

---

## Search Not Finding Expected Results

1. **BM25 miss:** `qmd search` is keyword-based. Try `qmd vsearch` or `qmd query` for semantic matching
2. **No embeddings:** If `qmd vsearch` returns nothing, run `qmd embed` first
3. **Collection not indexed:** Check `qmd status` to confirm the collection exists and has files
4. **Score threshold too high:** Try `--min-score 0.2` or omit `--min-score` entirely
5. **Wrong index:** If using `--index`, ensure all commands use the same index name

---

## Docids Change After Re-indexing

Docids (e.g. `#a1b2c3`) are content hashes. Editing a document changes its docid. Do not store docids as stable references across `qmd update` runs — use file paths instead.

---

## Zero Results With No Error — No Collection Indexed

**Symptom:** All MCP search tools (`qmd_search`, `qmd_vector_search`, `qmd_deep_search`) return empty results. No error message is shown. `qmd_status` may show zero documents or an empty collection list.

**Cause:** The MCP server starts successfully regardless of whether any collection has been indexed. If no collection has been added and embedded, search tools have nothing to query and return empty without signaling a problem.

**Who hits this:** Users who enable the plugin via the marketplace (or add it to `.mcp.json`) before running any CLI setup steps.

**Fix:** See SKILL.md Prerequisites section for the initial setup steps. Run the three-step sequence described there (`qmd collection add`, `qmd embed`, `qmd query "test"`) before enabling the MCP plugin.

After all three steps complete, MCP search tools will return results.

**Verification:** Run `qmd status` — a healthy setup shows at least one collection with a non-zero document count.

---

## `qmd search` vs `qmd vsearch` vs `qmd query`

| Aspect | `search` (BM25) | `vsearch` | `query` (hybrid) |
|--------|-----------------|-----------|-----------------|
| Speed | Instant | Fast (~1s) | Slow (5–30s first call) |
| Semantic understanding | No | Yes | Yes + expansion |
| Requires models | No | Embed model only | All three models |
| Best for | Exact terms, code, IDs | Natural language | Best precision |

Start with `qmd_search` for agentic use where latency matters. Escalate to `qmd_deep_search` when precision is critical.
