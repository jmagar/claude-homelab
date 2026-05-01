# summarize — Tips & Gotchas

## Config file permissions (important on multi-user systems)

`~/.summarize/config.json` may contain API keys in its `env` block. If the file is world-readable, any local user can read your keys.

**Always set 0600 permissions after creating the file:**

```bash
chmod 0600 ~/.summarize/config.json
```

**Health check — verify permissions:**

```bash
stat -c "%a" ~/.summarize/config.json
```

The output should be `600`. If it shows `644` or `664`, run `chmod 0600` immediately.

---

## URL summarization requires two keys, not one

A common point of confusion: even if you have `OPENAI_API_KEY` set, summarizing a URL will fail without `FIRECRAWL_API_KEY`. Firecrawl handles the web fetch and HTML-to-markdown conversion step before the LLM receives any content.

Error symptom: `Error: Firecrawl API key not found` or a network/auth error on the fetch step, even though the LLM key is valid.

Fix: set `FIRECRAWL_API_KEY` (get one at [firecrawl.dev](https://www.firecrawl.dev/)).

If you only have LLM keys and no Firecrawl key:
- Local files and PDFs work fine
- YouTube (transcript mode) works fine
- Podcast RSS feeds work fine
- Public web URLs will fail

---

## Cache behavior

`summarize` caches both media downloads and LLM-generated summaries under `~/.summarize/cache/`.

- **Summary cache**: Repeated calls to the same input with the same model and length return the cached result instantly. Use `--no-cache` to force a fresh summary.
- **Media download cache**: Audio/video downloads are cached by URL. Use `--no-media-cache` to re-download. Default TTL is 7 days; configurable via `cache.media.ttl` in `config.json`.

Clearing the cache manually:

```bash
rm -rf ~/.summarize/cache/
```

---

## Length tradeoffs

| Length | Best for |
|--------|----------|
| `short` | Quick triage — headline + 2–3 bullets |
| `medium` | Default — good for articles, blog posts |
| `long` | Technical papers, detailed documentation |
| `xl` | Long-form video transcripts, book chapters |
| `xxl` | Very long documents, exhaustive coverage |

Longer outputs cost more tokens. `xxl` on a long document with a reasoning model (e.g. `openai/o3`) can be expensive.

---

## YouTube and podcast notes

- YouTube summarization uses the transcript when available; falls back to audio transcription if no transcript exists.
- Podcast RSS feeds: pass the feed URL directly. `summarize` fetches the latest episode by default.
- For Apple Podcasts or Spotify, pass the episode page URL. `summarize` extracts the audio stream.
- Local transcription models (Parakeet, Canary, Whisper.cpp) avoid sending audio to remote APIs. Set up with `summarize transcriber setup`.

---

## Streaming vs. non-streaming

On a TTY, `summarize` streams output by default (`--stream auto`). In a script or piped context, streaming is off. Force it with `--stream on` or disable with `--stream off`.

---

## Short content passthrough

If the input is very short, `summarize` may pass it through without summarizing. Use `--force-summary` to always produce a structured TL;DR even for short content.

---

## stdin input

Pipe content directly:

```bash
cat ~/notes.txt | summarize -
curl -s https://example.com/article.txt | summarize - --length short
```

---

## JSON output for scripting

```bash
summarize <input> --json
```

Returns a JSON object with `summary`, `diagnostics`, `metrics` (including token counts and estimated cost), and timing data.
