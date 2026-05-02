# mcporter tips and gotchas

Real footguns, in rough order of how often they bite.

## `--help` coverage is uneven

Top-level, `list`, `call`, `auth`, and every `config <sub>` accept `--help`. The generator commands (`generate-cli`, `inspect-cli`, `emit-ts`) **don't** — invoking them with no args prints a usage hint instead. Source of truth for `generate-cli` flags lives in `dist/cli/generate/flags.js`.

## Quote function-call tokens

```bash
# Right — single shell token
mcporter call 'server.tool(arg: "value")'

# Wrong — shell splits on spaces, mcporter sees garbled input
mcporter call server.tool(arg: "value")
```

## `generate-cli` input is mutually exclusive

Pick exactly one of `--server`, `--command`, `--from`. Combining them is rejected. The bare positional form auto-routes (URL → `--command`, name → `--server`).

## `--include-tools` and `--exclude-tools` don't combine

Pick one. They're both repeatable, and entries within the chosen flag merge.

## Bun is required for `--compile`

Set `--runtime bun` (or let auto-detection pick it). Node-runtime CLIs can't be compiled to a single binary.

## Persisting ad-hoc servers is opt-in

`--persist <path>` (and `--yes` to skip the confirmation) writes the ad-hoc definition into an `mcporter.json`. Without it, the definition vanishes at the end of the run.

## The daemon ignores ad-hoc targets

`--persist` them first, then `mcporter daemon restart`. The daemon **only** manages named servers from config/imports.

## Unknown long flags fail fast on `call`

`--source import` errors instead of silently becoming a positional arg. Use `source=import`, `--args '{…}'`, or `--` to mark literals:

```bash
mcporter call server.tool source=import          # key=value form
mcporter call server.tool --args '{"source":"import"}'
mcporter call server.tool -- --source import     # `--` stops flag parsing
```

This is by design (since 0.9.x) — silent re-routing was the source of most "why didn't my arg make it" bugs.

## `config doctor` first when things look wrong

Three big buckets it covers:

- "server isn't showing up" — config not at the path mcporter resolved.
- "credentials missing" — token cache deleted or `tokenCacheDir` mismatched.
- "wrong file is being read" — multi-config order surprises (project `./config/` vs `~/.mcporter/`).

Run it before any other diagnostic.

## Debug stuck transports with `MCPORTER_DEBUG_HANG=1`

Verbose handle diagnostics for transports that refuse to close. Pair with tmux when the hang is hard to reproduce — leave a session running so you can inspect after the fact.

## `string` schema fields stay strings

Since 0.9.0, schema-declared `string` fields keep their value verbatim even if it looks numeric. Use `--no-coerce` to disable coercion globally, or `--raw-strings` to preserve numeric-looking strings without disabling other coercion.
