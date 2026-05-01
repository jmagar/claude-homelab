# summarize — Configuration Reference

## BYO API key requirement

`summarize` does **not** bundle a model. You must supply at least one LLM API key. The CLI exits immediately if no usable key is found.

**Minimum requirement for any summarization:**
- At least one of `OPENAI_API_KEY`, `ANTHROPIC_API_KEY`, or `GEMINI_API_KEY`

**Additional key for URL content (web pages):**
- `FIRECRAWL_API_KEY` — required for fetching and cleaning web page content. Without it, URL summarization fails even if you have an LLM key. Obtain at [firecrawl.dev](https://www.firecrawl.dev/).

---

## Config file

Location: `~/.summarize/config.json` (JSON5 format — comments allowed)

Create with strict permissions (see [tips-gotchas.md](tips-gotchas.md) for why):

```bash
mkdir -p ~/.summarize
touch ~/.summarize/config.json
chmod 0600 ~/.summarize/config.json
```

### Schema

```jsonc
{
  // Default model. Can be a provider/model string or "auto"
  "model": "anthropic/claude-sonnet-4-5",

  // Environment variable overrides (merged with shell env; shell env takes precedence)
  "env": {
    "OPENAI_API_KEY": "sk-...",
    "ANTHROPIC_API_KEY": "sk-ant-...",
    "GEMINI_API_KEY": "...",
    "FIRECRAWL_API_KEY": "fc-..."
  },

  // Default output length
  "output": {
    "length": "medium"
  },

  // Download / summary cache settings
  "cache": {
    "media": {
      "ttl": "7d",
      "maxSize": "2gb"
    }
  },

  // Default video handling mode
  "media": {
    "videoMode": "auto"
  },

  // Slide extraction defaults
  "slides": {
    "enabled": false,
    "max": 50,
    "ocr": false,
    "dir": "~/summarize-slides"
  },

  // CLI theme
  "ui": {
    "theme": "aurora"
  },

  // OpenAI-specific defaults
  "openai": {
    "serviceTier": "default",
    "thinking": "none",
    "textVerbosity": "normal",
    "useChatCompletions": false
  }
}
```

---

## Environment variables

### LLM API keys

| Variable | Provider |
|----------|----------|
| `OPENAI_API_KEY` | OpenAI (GPT models) |
| `ANTHROPIC_API_KEY` | Anthropic (Claude models) |
| `GEMINI_API_KEY` | Google Gemini |
| `GOOGLE_GENERATIVE_AI_API_KEY` | Google Gemini (alternate) |
| `GOOGLE_API_KEY` | Google Gemini (alternate) |
| `XAI_API_KEY` | xAI (Grok) |
| `Z_AI_API_KEY` / `ZAI_API_KEY` | ZAI |
| `NVIDIA_API_KEY` | NVIDIA NIM |
| `OPENROUTER_API_KEY` | OpenRouter (multi-provider gateway) |

### URL content fetching

| Variable | Description |
|----------|-------------|
| `FIRECRAWL_API_KEY` | **Required for URL summarization.** Firecrawl fetches and cleans web page content before passing it to the LLM. |

### Transcription / media

| Variable | Description |
|----------|-------------|
| `GROQ_API_KEY` | Groq (fast Whisper transcription) |
| `ASSEMBLYAI_API_KEY` | AssemblyAI transcription |
| `OPENAI_WHISPER_BASE_URL` | Custom Whisper endpoint |
| `FAL_KEY` | fal.ai (media models) |
| `APIFY_API_TOKEN` | Apify (web scraping fallback) |

### Behavior overrides

| Variable | Description |
|----------|-------------|
| `SUMMARIZE_MODEL` | Override default model without editing config |
| `SUMMARIZE_THEME` | CLI theme override |
| `SUMMARIZE_TRUECOLOR=1` | Force 24-bit ANSI colors |
| `SUMMARIZE_NO_TRUECOLOR=1` | Disable 24-bit ANSI colors |

### Local transcription paths

| Variable | Description |
|----------|-------------|
| `SUMMARIZE_ONNX_PARAKEET_CMD` | ONNX Parakeet transcription command |
| `SUMMARIZE_ONNX_CANARY_CMD` | ONNX Canary transcription command |
| `SUMMARIZE_WHISPER_CPP_MODEL_PATH` | Local Whisper.cpp model file |
| `SUMMARIZE_WHISPER_CPP_BINARY` | Whisper.cpp binary path override |
| `SUMMARIZE_DISABLE_LOCAL_WHISPER_CPP=1` | Force remote transcription |

---

## Model selection

`--model` accepts a `provider/model` string. Examples:

| Provider | Example model string |
|----------|---------------------|
| OpenAI | `openai/gpt-4o`, `openai/o3` |
| Anthropic | `anthropic/claude-opus-4-5`, `anthropic/claude-sonnet-4-5` |
| Google | `gemini/gemini-2.5-pro` |
| OpenRouter | `openrouter/meta-llama/llama-3.3-70b-instruct` |

Use `--model auto` to let `summarize` pick based on available keys.

### Provider cost notes

- **OpenAI** — GPT-4o is the default OpenAI model. `o3`/`o4-mini` use reasoning tokens; set `--thinking` accordingly. `--service-tier fast` reduces latency at higher cost.
- **Anthropic** — Claude Opus is the highest quality at the highest cost; Haiku is cheapest. Cache warm-up (multiple calls to the same document) reduces cost on subsequent runs.
- **Google Gemini** — Gemini 2.5 Pro offers a large context window useful for long documents.
- **OpenRouter** — Gives access to many providers under a single key. Useful for `--model auto` fallback chains. `refresh-free` updates the free-tier preset.
