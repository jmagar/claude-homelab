# Architecture Overview -- homelab-core

homelab-core is an orchestration hub, not an MCP server. It coordinates external MCP plugins and provides skill-based service integrations.

## System architecture

```
Claude Code / Codex / Gemini
    |
    +-- homelab-core plugin
    |     +-- 18 skills (service integrations via curl/scripts)
    |     +-- 1 agent (notebooklm-specialist)
    |     +-- 12 slash commands
    |     +-- Justfile (30+ operational recipes)
    |
    +-- External MCP plugins (10 repos)
    |     +-- overseerr-mcp    (media requests)
    |     +-- unraid-mcp       (server management)
    |     +-- unifi-mcp        (network management)
    |     +-- gotify-mcp       (push notifications)
    |     +-- swag-mcp         (reverse proxy)
    |     +-- synapse-mcp      (Docker + SSH)
    |     +-- arcane-mcp       (Docker via Arcane)
    |     +-- syslog-mcp       (log aggregation)
    |     +-- plugin-lab        (plugin development)
    |     +-- axon             (web crawl + RAG)
    |
    +-- Channel integrations
          +-- Discord (bidirectional messaging)
          +-- synapse-mcp events (infrastructure alerts)
```

## Skill execution model

Skills do not expose MCP tools. They provide domain knowledge and executable scripts that Claude Code uses to interact with services:

```
User asks about Plex
    |
    v
Claude Code loads skills/plex/SKILL.md
    |
    v
SKILL.md provides: API patterns, curl commands, workflows
    |
    v
Claude Code executes curl commands via Bash tool
    |
    v
curl -H "X-Plex-Token: $PLEX_TOKEN" "$PLEX_URL/library/sections"
    |
    v
Plex API responds with JSON
```

### Credential flow

```
~/.claude-homelab/.env
    |
    v (source load-env.sh)
Environment variables loaded into shell
    |
    v
Scripts read $SERVICE_URL, $SERVICE_API_KEY
    |
    v
curl/httpx calls to upstream services
```

## Marketplace architecture

The marketplace catalog (`marketplace.json`) serves as a registry of all plugins in the ecosystem:

```
marketplace.json (27 entries)
    |
    +-- homelab-core (source: "./")
    |     Local plugin -- this repo IS the plugin
    |
    +-- External plugins (source: {repo: "jmagar/<name>"})
    |     Each has its own repo, Docker container, MCP server
    |
    +-- Bundled skills (source: "./skills/<name>")
          Skills-only integrations, no MCP server
```

### Plugin graduation path

```
Bundled skill (skills/<name>/)
    |
    | Gains MCP server, agents, commands, or hooks
    v
Standalone plugin (jmagar/<name>-mcp)
    |
    | Gets external repo, Docker image, marketplace entry
    v
Full MCP plugin with its own lifecycle
```

## Dual-path installation

```
Plugin path:
  /plugin marketplace add jmagar/claude-homelab
      |
      v
  ~/.claude/plugins/cache/claude-homelab/
      |
      v
  Claude Code discovers skills, agents, commands automatically

Bash path:
  just symlinks
      |
      v
  ~/claude-homelab/skills/*  -->  ~/.claude/skills/*
  ~/claude-homelab/agents/*  -->  ~/.claude/agents/*
  ~/claude-homelab/commands/* --> ~/.claude/commands/*
      |
      v
  Claude Code discovers via symlinks
```

## Justfile as operations layer

The Justfile provides an operational layer on top of the plugin system:

```
just validate       -->  Environment + versions + connectivity + MCP
just health         -->  Service connectivity dashboard
just mcp-security   -->  TLS + auth + OAuth audit
just status         -->  Combined dashboard (versions + compose + health + MCP)
just lint           -->  Code quality across all repos
just deploy <name>  -->  Build + start MCP plugin container
```

## Cross-references

- [TECH.md](TECH.md) -- Technology stack details
- [PRE-REQS.md](PRE-REQS.md) -- Required tools
- [RECIPES.md](../repo/RECIPES.md) -- Justfile recipe reference
