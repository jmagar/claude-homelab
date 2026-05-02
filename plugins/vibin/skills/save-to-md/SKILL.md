---
name: save-to-md
description: Save session documentation to a markdown file with full context — date, branch, HEAD, session ID, and git state pre-injected. Use when the user says "save session", "save to md", "document this session", "write up what we did", "save session notes", or asks to capture the current conversation as a session log. Also invoked automatically by quick-push after a successful push.
allowed-tools: Write, Read, Bash
argument-hint: [path]
---

## Context

- Date: !`TZ=America/New_York date '+%Y-%m-%d %H:%M:%S EST'`
- Repo: !`git remote get-url origin`
- Branch: !`git branch --show-current`
- HEAD: !`git rev-parse --short HEAD`
- Recent commits: !`git log --oneline -5`
- Files currently dirty: !`git status --short`
- Files in recent commits: !`git log --oneline --name-only -10`
- Transcript: !`ls -t ~/.claude/projects/$(pwd | sed 's|/|-|g')/*.jsonl 2>/dev/null | head -1`
- Active plan: !`cat .claude/current-plan 2>/dev/null || echo "none"`
- Working directory: !`pwd`
- Worktree: !`git worktree list | grep $(pwd) | head -1`
- Active PR: !`gh pr view --json number,title,url 2>/dev/null || echo "none"`

# Save Session Documentation

Document the **entire conversation session** (not just recent work) as a markdown file at `$ARGUMENTS`. If no path is provided, save to `docs/sessions/YYYY-MM-DD-description.md` under the repo root.

Path rules:
- Relative paths resolve from the repo root (not CWD).
- Keep this workflow in-repo. If the resolved target is outside the repo root, stop and report the path issue.
- Check whether the target directory exists (`[ -d <dir> ]`) before creating it — only run `mkdir -p` if the check fails.
- If the target filename already exists, do not overwrite. Append a suffix like `-v2`, `-v3`, etc.

## Documentation Requirements

Start the file with a metadata block populated from the injected context above:

```yaml
date: YYYY-MM-DD HH:MM:SS EST
repo: <remote URL>
branch: <current branch>
head: <HEAD commit SHA>
plan: <path/to/plan.md> (if applicable)
agent: <Claude, Codex, Gemini, etc>
session id: <UUID filename of the transcript, e.g. cef54ead-b02d-4c3e-a833-a8672fa20523>
transcript: <full path to the .jsonl transcript file>
working directory: <pwd>
worktree: <worktree path if applicable, otherwise omit>
pr: <PR number, title, and URL if applicable, otherwise omit>
```

Then include these sections:
1. **User Request**: The original prompt or goal that initiated the session — one or two sentences verbatim or paraphrased
2. **Session Overview**: Brief summary of what was accomplished
3. **Sequence of Events**: Chronological breakdown of major activities (no timestamps — order only)
4. **Key Findings**: Important discoveries with file paths and line numbers where relevant
5. **Technical Decisions**: Reasoning behind implementation choices
6. **Files Modified**: List of all files created/modified with purpose
7. **Commands Executed**: Critical bash commands and their results
8. **Errors Encountered**: What failed, root cause, and how it was resolved — omit if no errors occurred
9. **Behavior Changes (Before/After)**: User-visible or system-visible behavior changes caused by this session
10. **Verification Evidence**: Table with `command | expected | actual | status` — omit if no verification commands were run
11. **Risks and Rollback**: Concise risk notes and rollback path for non-trivial changes — omit if no risk
12. **Decisions Not Taken**: Alternatives considered but rejected, with brief rationale — omit if none
13. **References**: Docs, PRs, issues, or URLs consulted during the session — omit if none
14. **Open Questions**: Unresolved items or assumptions that need follow-up — omit if none
15. **Next Steps**: Unfinished work from this session (started but not completed) and follow-on tasks not yet started — distinguish between the two

After writing the file, print the final absolute path so callers (e.g., `quick-push`) can reference it.

Content quality rules:
- Facts only. Do not infer values that were not observed in tool/command output.
- If something is uncertain, place it in **Open Questions** instead of stating it as fact.
- Keep sections concise (target max 5 bullets per section), but exceed when needed to preserve material implementation details, critical evidence, or safety context.
- Use file:line references (e.g., `server.ts:45`) for code-specific findings.
