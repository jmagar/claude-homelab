# Summarize

Claude Code plugin wrapping Peter Steinberger's [`summarize`](https://github.com/steipete/summarize) CLI — a multi-source LLM summarizer for URLs, PDFs, local files, YouTube videos, podcasts, and RSS feeds.

**BYO API key.** No model is bundled. At least one of `OPENAI_API_KEY`, `ANTHROPIC_API_KEY`, or `GEMINI_API_KEY` is required. URL summarization additionally requires `FIRECRAWL_API_KEY`.

## Install

```bash
brew install summarize          # preferred
npm i -g @steipete/summarize    # alternative (requires Node 24+)
```

## Quick start

```bash
# Set your key(s)
export OPENAI_API_KEY="sk-..."
export FIRECRAWL_API_KEY="fc-..."   # required for URL input

# Summarize anything
summarize https://example.com/article
summarize ~/downloads/paper.pdf
summarize https://www.youtube.com/watch?v=VIDEO_ID
```

## Configuration

Copy your API keys into `~/.summarize/config.json` for persistent defaults:

```bash
mkdir -p ~/.summarize
cat > ~/.summarize/config.json <<'EOF'
{
  "model": "openai/gpt-4o",
  "env": {
    "OPENAI_API_KEY": "sk-...",
    "FIRECRAWL_API_KEY": "fc-..."
  }
}
EOF
chmod 0600 ~/.summarize/config.json
```

See [`skills/summarize/references/configuration.md`](skills/summarize/references/configuration.md) for the full schema.

## Skill

The bundled skill activates on phrases like "summarize this URL", "TL;DR a PDF", or "summarize YouTube video". It provides:

- Full CLI flag reference
- Configuration and env var documentation
- Tips on cache behavior, length tradeoffs, and config file security
