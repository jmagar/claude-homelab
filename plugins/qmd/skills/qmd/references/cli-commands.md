# qmd CLI Command Reference

Full command surface for `@tobilu/qmd` v1.0.7+. All commands trace to `qmd --help` output.

---

## Global Options

```
--index <name>    Use a custom index name (default: index)
                  Useful for maintaining separate indexes per project
```

---

## Collection Commands

Manage which directories qmd indexes.

```sh
# Add a directory as a collection
qmd collection add [path] --name <name> [--mask <pattern>]
  path      Directory to index (default: current directory)
  --name    Required. Collection identifier
  --mask    Glob pattern filter (e.g. "**/*.md", "**/*.{md,txt}")

# Examples
qmd collection add ~/notes --name notes
qmd collection add ~/work/docs --name docs --mask "**/*.md"
qmd collection add . --name project           # Index current dir

# List all collections with details (path, file count, last indexed)
qmd collection list

# Remove a collection
qmd collection remove <name>

# Rename a collection
qmd collection rename <old-name> <new-name>
```

---

## Context Commands

Attach descriptive context to collection paths. Returned alongside search results to help LLMs understand document provenance.

```sh
# Add context to a path
qmd context add [path] "<description>"
  path    Collection path, virtual path (qmd://name), or filesystem path
          (default: current directory)

# Examples
qmd context add qmd://notes "Personal notes, journal entries, and ideas"
qmd context add qmd://meetings "Meeting transcripts and action items"
qmd context add / "Global knowledge base description"

# List all contexts
qmd context list

# Remove context for a path
qmd context rm <path>
```

---

## Listing Commands

```sh
# List all collections (summary view)
qmd ls

# List files within a collection
qmd ls <collection>
qmd ls <collection/subfolder>

# Examples
qmd ls notes
qmd ls docs/api
```

---

## Indexing Commands

```sh
# Build vector embeddings for all indexed documents
# Downloads embedding model (~300MB) on first run
qmd embed

# Force re-embed all documents (ignore cache)
qmd embed -f

# Re-index all collections (picks up added/modified/deleted files)
qmd update

# Git pull first, then re-index
qmd update --pull

# Show index status: collections, file counts, embedding status
qmd status

# Remove cache and orphaned data, vacuum SQLite DB
qmd cleanup
```

---

## Search Commands

### `search` — BM25 Full-Text Keyword Search

Fast, no models required. Uses SQLite FTS5.

```sh
qmd search <query> [options]

Options:
  -n <num>              Number of results (default: 5)
  --all                 Return all matches (combine with --min-score)
  --min-score <num>     Minimum similarity score (0.0–1.0)
  --full                Output full document instead of snippet
  --line-numbers        Add line numbers to output
  --files               Output docid,score,filepath,context (default 20 results)
  --json                JSON output with snippets (default 20 results)
  --csv                 CSV output
  --md                  Markdown output
  --xml                 XML output
  -c, --collection <n>  Filter to a specific collection

Examples:
  qmd search "project timeline"
  qmd search "API authentication" -c docs
  qmd search "budget" --json -n 10
  qmd search "error" --all --files --min-score 0.3
```

### `vsearch` — Vector Similarity Search

Semantic search using embeddings. Requires `qmd embed` to have been run.

```sh
qmd vsearch <query> [options]
  (same options as qmd search)

Examples:
  qmd vsearch "how to deploy this service"
  qmd vsearch "payment processing" -c docs --json
  qmd vsearch "team communication" --all --min-score 0.4
```

### `query` — Hybrid Search with LLM Re-ranking

Best quality. Combines BM25 + vector search with query expansion and re-ranking. Requires all three models.

```sh
qmd query <query> [options]
  (same options as qmd search)

Examples:
  qmd query "quarterly planning process"
  qmd query "error handling patterns" --all --files --min-score 0.4
  qmd query "authentication flow" -c docs -n 10
  qmd query "meeting notes from last week" --md
```

---

## Document Retrieval Commands

### `get` — Retrieve Single Document

```sh
qmd get <file[:line]> [-l N] [--from N]

  file      Collection-relative path (e.g. meetings/2024-01-15.md)
            or docid from search results (e.g. #a1b2c3)
  :line     Optional start line (e.g. file.md:42)
  -l N      Maximum lines to return
  --from N  Start from line N

Examples:
  qmd get "meetings/2024-01-15.md"
  qmd get "#a1b2c3"                      # Get by docid
  qmd get "docs/guide.md:100" -l 50      # Lines 100–150
  qmd get "notes/todo.md" --from 20 -l 30
```

### `multi-get` — Retrieve Multiple Documents

```sh
qmd multi-get <pattern> [-l N] [--max-bytes N] [--json|--csv|--md|--xml|--files]

  pattern       Glob pattern or comma-separated list of paths/docids
  -l N          Maximum lines per file
  --max-bytes N Skip files larger than N bytes (default: 10240)

Examples:
  qmd multi-get "journals/2025-05*.md"
  qmd multi-get "docs/**/*.md" --max-bytes 20480
  qmd multi-get "notes/todo.md,notes/ideas.md" --md
  qmd multi-get "#a1b2c3,#d4e5f6"               # Multiple docids
```

---

## MCP Server Commands

```sh
# Start MCP server on stdio transport (used by .mcp.json)
qmd mcp

# Start MCP server on HTTP transport
qmd mcp --http [--port N]
  --port N    Port number (default: 8181)

# Start HTTP server as background daemon
qmd mcp --http --daemon

# Stop background MCP daemon
qmd mcp stop
```

**MCP Tools exposed:**

| Tool | Description |
|------|-------------|
| `qmd_search` | Fast BM25 keyword search |
| `qmd_vector_search` | Semantic vector similarity search |
| `qmd_deep_search` | Hybrid + query expansion + LLM re-ranking |
| `qmd_get` | Retrieve document by path or docid |
| `qmd_multi_get` | Retrieve multiple documents by glob or list |
| `qmd_status` | Index health and collection summary |

---

## Output Format Summary

| Flag | Format | Best for |
|------|--------|----------|
| (default) | Colored text with snippets | Terminal reading |
| `--json` | JSON array with snippets | LLM/agent consumption |
| `--files` | `docid,score,filepath,context` lines | Batch processing |
| `--csv` | CSV with snippets | Spreadsheet import |
| `--md` | Markdown output | Document export |
| `--xml` | XML output | Structured parsing |
| `--full` | Full document content | Complete retrieval |

---

## Search Result Fields

| Field | Description |
|-------|-------------|
| Path | Collection-relative path (e.g. `docs/guide.md`) |
| Docid | Short hash identifier (e.g. `#a1b2c3`) — use with `qmd get #a1b2c3` |
| Title | Extracted from document (first heading or filename) |
| Context | Path context from `qmd context add` (if configured) |
| Score | Similarity score — green >70%, yellow >40%, dim otherwise |
| Snippet | Context around match with query terms highlighted |
