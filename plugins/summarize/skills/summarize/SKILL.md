---
name: summarize
description: This skill should be used when the user wants to summarize an external URL, PDF, local file, YouTube video, podcast episode, or RSS feed using the `summarize` CLI. Trigger on "summarize this URL", "TL;DR a PDF", "summarize YouTube video", "summarize podcast", "get key takeaways from", "digest this article". Do NOT trigger when Claude already has the text in context — this skill is for fetching and summarizing external content that Claude cannot read directly.
---

# Summarize

Wraps Peter Steinberger's [`summarize`](https://github.com/steipete/summarize) CLI — a multi-source LLM summarizer that handles URLs, PDFs, local files, YouTube videos, podcasts, and RSS feeds.

**BYO API key required.** At least one of `OPENAI_API_KEY`, `ANTHROPIC_API_KEY`, or `GEMINI_API_KEY` must be set. Without a key the CLI exits immediately. See [configuration.md](references/configuration.md) for the full setup.

## When to use this skill vs. asking Claude directly

Use this skill when:
- The source is a URL, YouTube link, podcast feed, or file that Claude cannot read inline
- The document is a local PDF or media file requiring external fetch or transcription
- You want a structured markdown summary with TL;DR + key takeaways

Skip this skill when:
- You have already pasted or attached the text — just ask Claude to summarize it
- The content is short enough to copy-paste directly

## Install

```bash
brew install summarize          # preferred
npm i -g @steipete/summarize    # alternative (requires Node 24+)
summarize --version
```

## Basic syntax

```bash
summarize <URL|file|->
```

All inputs use the same command; flags control model, length, and output.

## Highlights

**Summarize a URL**
```bash
summarize https://example.com/article
```
Requires `FIRECRAWL_API_KEY` for web pages (see [configuration.md](references/configuration.md)).

**Summarize a local file or PDF**
```bash
summarize ~/downloads/report.pdf
summarize ~/notes.txt
```

**Summarize a YouTube video**
```bash
summarize https://www.youtube.com/watch?v=VIDEO_ID
```

**Control output length**
```bash
summarize <input> --length short
summarize <input> --length xl
```
Valid values: `short`, `medium`, `long`, `xl`, `xxl`, or a character count.

**Switch model**
```bash
summarize <input> --model anthropic/claude-opus-4-5
summarize <input> --model openai/gpt-4o
```

**Output in a specific language**
```bash
summarize <input> --language Spanish
```

## Output format

Default output is structured markdown:

```
## TL;DR
One-sentence summary.

## Key Takeaways
- Point one
- Point two

## Full Summary
...
```

Use `--json` for machine-readable output with diagnostics and cost estimates.

## Configuration

Credentials and defaults live in `~/.summarize/config.json`. See [configuration.md](references/configuration.md) for the full schema, environment variable reference, and provider cost notes.

## Reference docs

- [cli-commands.md](references/cli-commands.md) — All flags and subcommands
- [configuration.md](references/configuration.md) — Config file schema, env vars, model selection, provider notes
- [tips-gotchas.md](references/tips-gotchas.md) — Cache behavior, length tradeoffs, config file permissions
