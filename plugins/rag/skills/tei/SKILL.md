---
name: tei
description: Lab's wrapper for Hugging Face Text Embeddings Inference (TEI) — embeddings/reranking server (embed text, rerank candidates, tokenize). Use when the user asks to embed/rerank/tokenize via the lab TEI service or invokes `lab tei` / `mcp__rag__tei`. NOT for: 'teach/team' typos, or the Text Encoding Initiative XML standard.
---

# Hugging Face Text Embeddings Inference

Embeddings/reranking server — embed text, rerank candidates, tokenize. Exposes **8 actions** (category: `ai`) via the `lab` homelab control plane, surfaced through the `rag` plugin's MCP server (alongside `qdrant`).

## How to call it

**Prefer the MCP tool. Fall back to the CLI only when MCP is unavailable.**

### MCP (preferred)

The `rag` plugin's `.mcp.json` runs `lab mcp --services qdrant,tei`, so TEI is exposed as `mcp__rag__tei`. Dispatch shape: `{ "action": "<name>", "params": {...} }`.

Discover actions live (always check before calling unfamiliar actions):
```json
{ "action": "help" }
{ "action": "schema", "params": { "action": "<name>" } }
```

Full action catalog: [`references/mcp.md`](references/mcp.md).

### CLI fallback

```bash
lab tei --help                      # subcommand list
lab tei <action> --help             # parameter help for one action
lab --json tei <action> ...         # JSON output (parseable)
```

CLI mirrors MCP actions; dots become dashes (`server.health` → `server-health`). Full CLI surface: [`references/cli.md`](references/cli.md).

## Highlights

- `server.health` — Check whether the TEI server is healthy
- `server.info` — Get served model and runtime metadata
- `embed.create` — Generate embeddings for one or more input strings
- `embed.rerank` — Rerank texts against a query (POST /rerank). Max 100 texts per call — split larger batches across multiple requests.
- `embed.tokenize` — Tokenize one or more input strings (POST /tokenize). Returns token-id sequences.
- `embed.similarity` — Compute pairwise similarity scores for sentence pairs (POST /similarity). Inputs must be an array of [string, string] pairs.
- `embed.sparse` — Generate sparse (SPLADE-style) embeddings for one or more inputs (POST /embed_sparse).
- `embed.openai` — Generate embeddings via the OpenAI-compatible endpoint (POST /v1/embeddings). Body and response are passed through as raw JSON.

## Configuration

Credentials and base URLs live in `~/.lab/.env`. Onboard / re-extract with
`lab extract scan` and `lab extract apply`. Verify connectivity:

```bash
lab doctor service tei
```

## Destructive actions

TEI has **no destructive actions** in this catalog — every action is read-only or non-mutating. No special confirmation required.

## When NOT to use this skill

- The user is asking about Qdrant — load the `qdrant-vector-search` or `qdrant-quality` skill in this same plugin.
- The user is asking about a non-RAG lab service — load that service's skill instead.
- The user is asking about `lab` itself (CLI internals, install, gateway) — operator-tier, not `tei`-specific.
