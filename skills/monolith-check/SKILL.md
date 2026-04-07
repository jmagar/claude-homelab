---
name: monolith-check
description: Check files against the monolith size policy (500L file limit). Works for any language — Rust gets full function-size enforcement via enforce_monoliths.py; Python, TypeScript, Go, shell, and others get file-level checks. Defaults to staged files.
disable-model-invocation: true
---

Run monolith policy check against staged files (default):

```bash
python3 skills/monolith-check/check.py --staged
```

Check ALL tracked files (slow, use before a big PR):

```bash
python3 skills/monolith-check/check.py --all
```

Check a single file by path:

```bash
python3 skills/monolith-check/check.py --file crates/jobs/crawl_jobs.rs
```

Override the file size limit (default 500):

```bash
python3 skills/monolith-check/check.py --staged --file-max-lines 300
```

**What gets checked:**
- `.rs` → file size + function size (via `scripts/enforce_monoliths.py`; hard limit 120L/fn, warn at 80L)
- `.py`, `.ts`, `.tsx`, `.js`, `.jsx`, `.go`, `.java`, `.kt`, `.swift`, `.cpp`, `.c`, `.h`, `.sh` → file size only
- Exclusions: `tests/`, `benches/`, `target/`, `node_modules/`, `.venv/`, `*.lock`
- Exceptions: add paths to `.monolith-allowlist`

**Exit codes:** 0 = clean, 1 = violations found, 2 = setup error
