---
name: qmd
description: This skill should be used when the user asks to "qmd semantic search", "search my notes", "qmd index", "index markdown files", "semantic search over markdown", "search knowledge base locally", "@tobilu/qmd", "query markdown documents", "full-text search notes", or mentions searching personal markdown notes, meeting transcripts, or documentation without cloud services. Do NOT trigger for unrelated "quick markdown" requests.
---

# qmd — Local Semantic Markdown Search

**Philosophy:** Local-first, no cloud calls, no API keys. Opinionated and markdown-native — assumes your knowledge lives in `.md` files. All indexing, embedding, and re-ranking runs on-device via GGUF models (~2GB total). Your documents never leave your machine.

---

## PREREQUISITE: Download Models Before Enabling MCP

**CRITICAL — do this before activating the plugin in Claude Code.**

`qmd mcp` lazily loads models on the first tool call. On a cold start with undownloaded models, the first call will stall for several minutes while ~2GB of GGUF models download from HuggingFace. Force the downloads in advance:

```sh
# 1. Index at least one collection (required for embed to work)
qmd collection add ~/notes --name notes

# 2. Download the embedding model and build vector index
qmd embed

# 3. Download reranker + query expansion models
qmd query "test warmup query"
```

After all three steps complete, models are cached in `~/.cache/qmd/models/` and subsequent starts are fast.

See [tips-gotchas.md](references/tips-gotchas.md) for partial download recovery, air-gapped setup, and cold-start latency details.

---

## PREREQUISITE 2 — Set Up a Collection Before Using MCP Tools

**CRITICAL — if no collection has been indexed, all MCP search tools return empty results with no error.**

Users who enable the plugin via the marketplace without running CLI setup will get a working MCP server that silently returns nothing. You must add at least one collection and build the index before MCP tools are useful:

```sh
# 1. Add your markdown directory as a collection
qmd collection add ~/notes
# (or any directory containing .md files)

# 2. Build the vector index
qmd embed

# 3. Verify indexing worked — should return results
qmd query "test"
```

After these three steps, `qmd_search`, `qmd_vector_search`, `qmd_deep_search`, and related MCP tools will return results.

---

## MCP Tools

When the MCP server is running (via `.mcp.json`), these tools are available:

| Tool | Description |
|------|-------------|
| `qmd_search` | Fast BM25 keyword search |
| `qmd_vector_search` | Semantic vector similarity search |
| `qmd_deep_search` | Hybrid search with query expansion and LLM re-ranking (best quality) |
| `qmd_get` | Retrieve a document by path or docid |
| `qmd_multi_get` | Retrieve multiple documents by glob pattern or list |
| `qmd_status` | Index health and collection info |

All tools support an optional `collection` filter.

---

## Setup Workflow

### 1. Add collections

```sh
qmd collection add ~/notes --name notes
qmd collection add ~/Documents/meetings --name meetings
qmd collection add ~/work/docs --name docs --mask "**/*.md"
```

### 2. Add context (optional but recommended)

Context strings are returned alongside matching documents — helps the LLM make better decisions.

```sh
qmd context add qmd://notes "Personal notes and ideas"
qmd context add qmd://meetings "Meeting transcripts"
qmd context add qmd://docs "Work documentation"
```

### 3. Build the index

```sh
qmd embed          # Build vector embeddings
qmd update         # Re-index after adding/editing files
qmd update --pull  # Git pull then re-index
```

---

## Search Commands (CLI)

```sh
# BM25 keyword search — fast, no models needed
qmd search "project timeline"

# Vector similarity search — semantic, requires embedded index
qmd vsearch "how do I deploy this"

# Hybrid + reranking — best quality, uses all three models
qmd query "quarterly planning process"

# Scope to a collection
qmd search "API authentication" -c docs

# More results with score threshold
qmd query "error handling" --all --files --min-score 0.4

# JSON output for agentic use
qmd search "budget" --json -n 10
```

---

## Document Retrieval (CLI)

```sh
# Get a document by path
qmd get "meetings/2024-01-15.md"

# Get by docid (shown in search results as #abc123)
qmd get "#a1b2c3"

# Get from a specific line with N lines
qmd get "docs/guide.md:42" -l 30

# Multiple documents by glob
qmd multi-get "journals/2025-05*.md"

# Multiple documents, skip large files
qmd multi-get "docs/**/*.md" --max-bytes 20480
```

---

## Management Commands

```sh
qmd collection list              # List all collections
qmd collection remove <name>     # Remove a collection
qmd collection rename <old> <new>

qmd ls                           # List all collections
qmd ls notes                     # List files in 'notes' collection
qmd ls notes/subfolder

qmd status                       # Index stats and collection summary
qmd cleanup                      # Remove orphaned cache data, vacuum DB
```

---

## MCP Server (CLI)

```sh
qmd mcp                          # stdio transport (used by .mcp.json)
qmd mcp --http --port 8181       # HTTP transport
qmd mcp --http --daemon          # Background HTTP daemon
qmd mcp stop                     # Stop background daemon
```

---

## Decision Guide

| Goal | Use |
|------|-----|
| Exact keyword match | `qmd_search` / `qmd search` |
| Meaning-based match | `qmd_vector_search` / `qmd vsearch` |
| Best overall quality | `qmd_deep_search` / `qmd query` |
| Fetch specific file | `qmd_get` / `qmd get` |
| Fetch many files | `qmd_multi_get` / `qmd multi-get` |
| Index health | `qmd_status` / `qmd status` |

Full CLI reference: [cli-commands.md](references/cli-commands.md)
Configuration and models: [configuration.md](references/configuration.md)
Gotchas and tips: [tips-gotchas.md](references/tips-gotchas.md)
