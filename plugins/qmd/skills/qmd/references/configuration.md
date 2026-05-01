# qmd Configuration Reference

---

## Environment Variables

| Variable | Default | Description |
|----------|---------|-------------|
| `XDG_CACHE_HOME` | `~/.cache` | Base cache directory. qmd stores index and models under `$XDG_CACHE_HOME/qmd/` |
| `QMD_EMBED_MODEL` | EmbeddingGemma-300M (see below) | Override the default embedding model with a custom HuggingFace GGUF URI |
| `QMD_EDITOR_URI` | (none) | Editor link template for clickable file paths in search output |
| `NO_COLOR` | (unset) | Set to any value to disable colorized CLI output |

---

## Storage Paths

| Path | Contents |
|------|----------|
| `~/.cache/qmd/index.sqlite` | Main SQLite database: document index, FTS5 index, vector embeddings, collections, contexts |
| `~/.cache/qmd/models/` | Downloaded GGUF model files (~2GB total) |

The `index.sqlite` path is shown at the bottom of `qmd --help` output.

If `XDG_CACHE_HOME` is set, paths become:
- `$XDG_CACHE_HOME/qmd/index.sqlite`
- `$XDG_CACHE_HOME/qmd/models/`

---

## GGUF Models

Three models are auto-downloaded from HuggingFace on first use. Total size: ~2GB.

| Model | Size | Purpose | Downloaded on |
|-------|------|---------|---------------|
| `embeddinggemma-300M-Q8_0` | ~300MB | Vector embeddings for `vsearch` and `query` | `qmd embed` |
| `qwen3-reranker-0.6b-q8_0` | ~640MB | Document relevance re-ranking in `query` | `qmd query` (first call) |
| `qmd-query-expansion-1.7B-q4_k_m` | ~1.1GB | Query expansion / variant generation in `query` | `qmd query` (first call) |

Model files are sourced from HuggingFace:
- `hf:ggml-org/embeddinggemma-300M-GGUF/embeddinggemma-300M-Q8_0.gguf`
- `hf:ggml-org/Qwen3-Reranker-0.6B-Q8_0-GGUF/qwen3-reranker-0.6b-q8_0.gguf`
- `hf:tobil/qmd-query-expansion-1.7B-gguf/qmd-query-expansion-1.7B-q4_k_m.gguf`

---

## Custom Embedding Model (`QMD_EMBED_MODEL`)

Override the default embedding model with any HuggingFace GGUF URI.

```sh
export QMD_EMBED_MODEL="hf:Qwen/Qwen3-Embedding-0.6B-GGUF/qwen3-embedding-0.6b-q8_0.gguf"
qmd embed -f    # Force re-embed all documents with the new model
```

**When to override:**
- Multilingual content (CJK, Arabic, etc.) — Qwen3-Embedding covers 119 languages
- Air-gapped environments — pre-download and point to a local GGUF file path
- Experimentation with different embedding quality/size tradeoffs

**Important:** Changing `QMD_EMBED_MODEL` invalidates existing embeddings. Always run `qmd embed -f` after switching models.

---

## Editor URI (`QMD_EDITOR_URI`)

Configures clickable file links in search output.

```sh
export QMD_EDITOR_URI="vscode://file/{path}:{line}:{col}"
```

Supported placeholders:

| Placeholder | Description |
|-------------|-------------|
| `{path}` | Absolute file path |
| `{line}` | Line number |
| `{col}` or `{column}` | Column number |

**Common presets:**

```sh
# VS Code
export QMD_EDITOR_URI="vscode://file/{path}:{line}:{col}"

# Cursor
export QMD_EDITOR_URI="cursor://file/{path}:{line}:{col}"

# Zed
export QMD_EDITOR_URI="zed://file/{path}:{line}:{col}"

# Sublime Text
export QMD_EDITOR_URI="subl://{path}:{line}:{col}"
```

---

## Multiple Indexes

Use `--index <name>` to maintain separate databases for different projects:

```sh
# Work index
qmd --index work collection add ~/work/docs --name docs
qmd --index work embed
qmd --index work query "deployment process"

# Personal index
qmd --index personal collection add ~/notes --name notes
qmd --index personal embed
qmd --index personal search "birthday ideas"
```

Each index creates a separate SQLite file: `~/.cache/qmd/<name>.sqlite`.

---

## Installation Requirements

- Node.js ≥ 22 **or** Bun ≥ 1.0
- Internet access for initial model downloads (~2GB from HuggingFace)
- ~3GB free disk space (2GB models + index data)
- SQLite (typically pre-installed; `brew install sqlite` if missing on macOS)

```sh
# Install
npm install -g @tobilu/qmd

# Or with Bun
bun install -g @tobilu/qmd

# Or without installing
npx @tobilu/qmd search "query"
bunx @tobilu/qmd search "query"
```
