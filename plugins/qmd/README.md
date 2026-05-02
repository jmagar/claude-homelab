# qmd

Local-first semantic search for markdown documents. Combines BM25 full-text search, vector similarity search, and LLM re-ranking — all running on-device via GGUF models. No cloud calls, no API keys, no data leaves your machine.

Created by [Tobi Lütke](https://github.com/tobi/qmd).

---

## IMPORTANT: Download Models Before Enabling This Plugin

**Do this before adding the plugin to Claude Code.**

`qmd mcp` (the MCP server that this plugin starts) loads ~2GB of GGUF models from HuggingFace on first use. If models are not already cached, the first MCP tool call will stall for several minutes while downloading — exceeding Claude Code's MCP server timeout and making all qmd tools unavailable.

**Pre-download steps:**

```sh
# 1. Index a collection
qmd collection add ~/notes --name notes

# 2. Run embed — downloads embedding model (~300MB) and builds vector index
qmd embed

# 3. Run a test query — downloads reranker + query expansion models (~1.7GB)
qmd query "test warmup"
```

After these complete, models are cached in `~/.cache/qmd/models/` and the MCP server starts tools in under 2 seconds.

See [tips-gotchas.md](skills/qmd/references/tips-gotchas.md) for partial download recovery, air-gapped setups, and cold-start latency advice.

---

## IMPORTANT: Index a Collection Before Using MCP Tools

**If no collection has been indexed, all MCP search tools return empty results with no error.** Users who install the plugin via the marketplace without running CLI setup first will get a working-but-useless MCP server.

After installing qmd, run these steps before enabling the plugin:

```sh
# 1. Add your markdown directory as a collection
qmd collection add ~/notes
# (substitute any directory containing .md files)

# 2. Build the vector index
qmd embed

# 3. Verify — should return results if setup succeeded
qmd query "test"
```

Once the index is built, all MCP tools (`qmd_search`, `qmd_vector_search`, `qmd_deep_search`, etc.) will return results.

---

## Installation

```sh
# Requires Node.js ≥ 22 or Bun ≥ 1.0
npm install -g @tobilu/qmd

# Or with Bun
bun install -g @tobilu/qmd
```

---

## Setup

```sh
# Add collections (directories to index)
qmd collection add ~/notes --name notes
qmd collection add ~/Documents/meetings --name meetings
qmd collection add ~/work/docs --name docs

# Optionally add context descriptions
qmd context add qmd://notes "Personal notes and ideas"
qmd context add qmd://meetings "Meeting transcripts"

# Build the vector index (downloads embedding model ~300MB)
qmd embed

# Warm up reranker + query expansion models (downloads ~1.7GB)
qmd query "test"
```

---

## MCP Tools

This plugin runs `qmd mcp` over stdio. The following MCP tools are available:

| Tool | Description |
|------|-------------|
| `qmd_search` | Fast BM25 keyword search |
| `qmd_vector_search` | Semantic vector similarity search |
| `qmd_deep_search` | Hybrid search with query expansion and LLM re-ranking |
| `qmd_get` | Retrieve a document by path or docid |
| `qmd_multi_get` | Retrieve multiple documents by glob pattern or list |
| `qmd_status` | Index health and collection summary |

---

## CLI Usage

```sh
# Keyword search (fast, no models)
qmd search "project timeline"

# Semantic search
qmd vsearch "deployment strategy"

# Hybrid with re-ranking (best quality)
qmd query "quarterly planning"

# Get a specific file
qmd get "notes/meeting-2025-01.md"

# Re-index after editing files
qmd update

# Index status
qmd status
```

---

## Configuration

| Variable | Description |
|----------|-------------|
| `XDG_CACHE_HOME` | Override cache base directory (default: `~/.cache`) |
| `QMD_EMBED_MODEL` | Custom HuggingFace GGUF URI for the embedding model |
| `QMD_EDITOR_URI` | Editor link template (e.g. `vscode://file/{path}:{line}:{col}`) |

Full configuration reference: [configuration.md](skills/qmd/references/configuration.md)

---

## Models

Three GGUF models are auto-downloaded from HuggingFace (~2GB total):

| Model | Size | Purpose |
|-------|------|---------|
| EmbeddingGemma-300M-Q8_0 | ~300MB | Vector embeddings |
| Qwen3-Reranker-0.6B-Q8_0 | ~640MB | Re-ranking |
| QMD Query Expansion 1.7B q4 | ~1.1GB | Query expansion |

Models cache in `~/.cache/qmd/models/`. ~3GB free disk space required.

---

## Links

- Upstream repository: https://github.com/tobi/qmd
- npm package: https://www.npmjs.com/package/@tobilu/qmd
