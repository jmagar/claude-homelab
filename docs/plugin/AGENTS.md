# Agent Definitions -- homelab-core

homelab-core ships one agent: `notebooklm-specialist`.

## File location

```
agents/
  notebooklm-specialist.md
```

Agents are Markdown files in the `agents/` directory. Claude Code discovers them automatically via plugin install or bash-path symlinks to `~/.claude/agents/`.

## notebooklm-specialist

**File:** `agents/notebooklm-specialist.md`
**Purpose:** Deep research and analysis via Google NotebookLM

### Frontmatter

```yaml
name: notebooklm-specialist
description: |
  Use this agent when you need AI-powered deep research and analysis via Google NotebookLM.
tools: Bash, Read, Write, SendMessage
memory: user
color: magenta
```

### Capabilities

- Creates NotebookLM notebooks and adds sources
- Runs deep research sessions (15-30 minute operations)
- Conducts citation-backed Q&A within notebooks
- Generates research artifacts (podcasts, summaries, videos)
- Communicates with orchestrator agents via SendMessage

### When to invoke

- User asks for deep research on a topic
- Orchestrator spawns this agent for NotebookLM analysis
- User wants to leverage NotebookLM's AI research capabilities

### Dependencies

Reads these skills before acting:
1. `skills/notebooklm/SKILL.md` -- NotebookLM techniques and CLI usage

### Tool restrictions

| Tool | Purpose |
| --- | --- |
| `Bash` | Run NotebookLM CLI commands |
| `Read` | Read skill docs and research materials |
| `Write` | Save research artifacts |
| `SendMessage` | Communicate with orchestrator |

## Naming conventions

| Pattern | Use case |
| --- | --- |
| `*-specialist.md` | Domain expert for a specific service |
| `*-orchestrator.md` | Coordinates multiple agents/tools |

## Adding a new agent

1. Create `agents/<name>.md` with YAML frontmatter
2. Include: name, description (with trigger examples), tools, memory, color
3. Define initialization (read relevant SKILL.md first)
4. Symlink: `ln -sf ~/claude-homelab/agents/<name>.md ~/.claude/agents/<name>.md`
5. Or re-run: `just symlinks`

## Cross-references

- [SKILLS.md](SKILLS.md) -- Skills that agents delegate to
- [COMMANDS.md](COMMANDS.md) -- Commands that may invoke agents
