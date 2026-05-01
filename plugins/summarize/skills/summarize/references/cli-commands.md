# summarize — CLI Command Reference

Source: [steipete/summarize](https://github.com/steipete/summarize)

## Usage

```
summarize <URL|file|-> [OPTIONS]
```

Pass `-` to read from stdin.

---

## Input & Model Selection

| Flag | Description |
|------|-------------|
| `--model <provider/model>` | Specify model, e.g. `openai/gpt-4o`, `anthropic/claude-opus-4-5` |
| `--model auto` | Automatic selection with fallback across available providers |
| `--cli [provider]` | Use a CLI backend: `claude`, `gemini`, `codex`, `agent`, `openclaw`, `opencode` |

---

## Output Control

| Flag | Description |
|------|-------------|
| `--length short\|medium\|long\|xl\|xxl\|<chars>` | Output length guideline (default: `medium`) |
| `--max-output-tokens <count>` | Hard cap on LLM output tokens |
| `--force-summary` | Override short-content passthrough (always summarize) |
| `--format md\|text` | Content format (default: `text`) |
| `--stream auto\|on\|off` | Enable streaming output (`auto` detects TTY) |
| `--plain` | Raw output without ANSI rendering |
| `--no-color` | Disable ANSI colors |
| `--theme aurora\|ember\|moss\|mono` | CLI theme |
| `--json` | Machine-readable output with diagnostics, metrics, and cost |
| `--metrics off\|on\|detailed` | Metrics output verbosity |
| `--verbose` | Debug output to stderr |

---

## Content Extraction

| Flag | Description |
|------|-------------|
| `--extract` | Print extracted content then exit (no summarization) |
| `--markdown-mode off\|auto\|llm\|readability` | HTML-to-markdown conversion mode |
| `--preprocess off\|auto\|always` | Control markitdown pre-processing |
| `--firecrawl off\|auto\|always` | Firecrawl fallback mode for URL fetching |

---

## Media Processing

| Flag | Description |
|------|-------------|
| `--slides` | Extract video slides with scene detection |
| `--slides-ocr` | Run OCR on extracted slides |
| `--slides-dir <dir>` | Output directory for extracted slides |
| `--slides-scene-threshold <value>` | Scene detection threshold (0.1–1.0) |
| `--slides-max <count>` | Maximum slides to extract |
| `--slides-min-duration <seconds>` | Minimum seconds between slide captures |
| `--youtube auto` | YouTube transcript extraction strategy |
| `--video-mode transcript\|understand\|auto` | Media handling approach |
| `--transcriber parakeet\|canary\|whisper\|auto` | Local transcription model |

---

## Language & Timeout

| Flag | Description |
|------|-------------|
| `--language <language>`, `--lang <language>` | Output language; `auto` matches source |
| `--timeout <duration>` | Request timeout, e.g. `30s`, `2m`, `5000ms` |
| `--retries <count>` | LLM retry attempts on timeout |

---

## OpenAI-Specific

| Flag | Description |
|------|-------------|
| `--fast` | Shorthand for `--service-tier fast` |
| `--service-tier default\|fast\|priority\|flex` | OpenAI service tier |
| `--thinking none\|low\|medium\|high\|xhigh` | OpenAI reasoning effort |

---

## Caching

| Flag | Description |
|------|-------------|
| `--no-cache` | Skip summary caching |
| `--no-media-cache` | Skip media download caching |

---

## Subcommands

| Subcommand | Description |
|------------|-------------|
| `daemon install --token <TOKEN>` | Install background service daemon |
| `daemon status` | Check daemon status |
| `refresh-free [--set-default]` | Regenerate OpenRouter free model preset |
| `transcriber setup` | Set up local transcription model |

---

## Supported Input Types

- Web URLs (articles, blog posts, documentation)
- Local files: text, PDF, images, audio, video
- YouTube URLs (transcript or audio transcription)
- Podcast RSS feeds
- Apple Podcasts episode pages
- Spotify episodes
- Amazon Music / Audible pages
- Podbean, Podchaser
- HLS playlists
- Stdin (`-`)
