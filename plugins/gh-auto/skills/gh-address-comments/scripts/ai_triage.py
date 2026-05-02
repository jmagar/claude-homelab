#!/usr/bin/env python3
"""
AI-powered triage of PR review threads using Claude.

Reads open threads and produces a prioritized action plan: bugs vs style vs
nitpicks, duplicate/related thread detection, effort estimates, and suggested
order to tackle them.

Requires: claude CLI in PATH (ships with Claude Code)

Usage:
  gh-ai-triage --input pr.json
  gh-ai-triage --input pr.json --focus bugs
  gh-ai-triage --pr 2               # live fetch + triage
"""

from __future__ import annotations

import argparse
import json
import subprocess
import sys
from typing import Any


TRIAGE_PROMPT = """\
You are a senior engineer triaging pull request review comments. Analyze the
open review threads below and produce a clear, actionable triage report.

For each thread, determine:
1. Category: bug/correctness, security, performance, style/formatting, documentation, nitpick, or question
2. Effort: quick (<15 min), moderate (15–60 min), involved (>1 hr)
3. Whether it duplicates or is closely related to another thread

Then output:
- A PRIORITY ORDER list (what to fix first and why)
- A DUPLICATES/RELATED section (threads addressing the same root cause)
- A SKIP/DEFER section (threads that are nitpicks or can be resolved with a comment)

Format the output as plain text — no JSON. Be specific and concise.
Use the thread IDs so the developer can cross-reference.

{focus_instruction}

=== OPEN REVIEW THREADS ===

{threads_text}
"""


def _run_json(cmd: list[str]) -> Any:
    p = subprocess.run(cmd, capture_output=True, text=True)
    if p.returncode != 0:
        raise RuntimeError(f"Command failed: {' '.join(cmd)}\n{p.stderr}")
    return json.loads(p.stdout)


def format_threads_for_prompt(threads: list[dict[str, Any]]) -> str:
    parts = []
    for i, thread in enumerate(threads, 1):
        tid = thread.get("id", "?")
        path = thread.get("path", "?")
        line = thread.get("line") or thread.get("originalLine", "?")
        comments = thread.get("comments", {}).get("nodes", [])
        parts.append(f"--- Thread {i} ---")
        parts.append(f"ID: {tid}")
        parts.append(f"File: {path}:L{line}")
        for j, c in enumerate(comments):
            author = c.get("author", {}).get("login", "?")
            body = c.get("body", "").strip()
            # Strip HTML/badge noise beyond first 500 chars
            body = body[:500]
            label = "Comment" if j == 0 else f"Reply {j}"
            parts.append(f"{label} (@{author}):\n{body}")
        parts.append("")
    return "\n".join(parts)


def run_claude(prompt: str) -> str:
    p = subprocess.run(
        ["claude", "-p", prompt],
        capture_output=True, text=True,
    )
    if p.returncode != 0:
        raise RuntimeError(f"claude CLI failed:\n{p.stderr}")
    return p.stdout.strip()


def main() -> None:
    parser = argparse.ArgumentParser(
        description="AI-powered triage of PR review threads using Claude",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog=(
            "Examples:\n"
            "  gh-ai-triage --input pr.json\n"
            "  gh-ai-triage --input pr.json --focus bugs\n"
            "  gh-ai-triage --pr 2\n"
        ),
    )
    parser.add_argument("--input", "-i", metavar="FILE", help="Cached JSON from gh-fetch-comments")
    parser.add_argument("--pr", type=int, metavar="NUMBER", help="PR number (live fetch)")
    parser.add_argument("--repo", metavar="OWNER/REPO", help="Repository (default: auto-detect)")
    parser.add_argument(
        "--focus", metavar="AREA",
        help="Focus triage on a specific concern (e.g. 'bugs', 'security', 'quick wins')",
    )
    parser.add_argument("--max-threads", type=int, default=40, metavar="N",
                        help="Max threads to send to Claude (default: 40)")
    args = parser.parse_args()

    if not args.input and not args.pr:
        parser.error("Provide --input FILE or --pr NUMBER")

    # Load data
    try:
        if args.input:
            with open(args.input) as f:
                data = json.load(f)
        else:
            repo_flag = []
            if args.repo:
                repo_flag = ["--repo", args.repo]
            out = subprocess.run(
                [sys.executable, __file__.replace("ai_triage.py", "fetch_comments.py"),
                 "--pr", str(args.pr)] + repo_flag,
                capture_output=True, text=True,
            )
            data = json.loads(out.stdout)
    except (OSError, json.JSONDecodeError) as e:
        print(f"Error loading data: {e}", file=sys.stderr)
        sys.exit(1)

    threads = data.get("review_threads", [])
    open_threads = [t for t in threads if not t.get("isResolved") and not t.get("isOutdated")]

    if not open_threads:
        print("✓ No open threads to triage.")
        return

    pr = data.get("pull_request", {})
    print(f"Triaging {len(open_threads)} open thread(s) for PR #{pr.get('number', '?')}: {pr.get('title', '')}")
    print(f"Sending to Claude...\n")

    # Truncate if too many
    if len(open_threads) > args.max_threads:
        print(f"(Limiting to first {args.max_threads} threads — use --max-threads to adjust)", file=sys.stderr)
        open_threads = open_threads[:args.max_threads]

    focus_instruction = ""
    if args.focus:
        focus_instruction = f"Pay special attention to: {args.focus}"

    threads_text = format_threads_for_prompt(open_threads)
    prompt = TRIAGE_PROMPT.format(
        focus_instruction=focus_instruction,
        threads_text=threads_text,
    )

    try:
        result = run_claude(prompt)
    except RuntimeError as e:
        print(f"Error: {e}", file=sys.stderr)
        sys.exit(1)

    print("=" * 70)
    print("AI TRIAGE REPORT")
    print("=" * 70)
    print(result)
    print("=" * 70)
    print(f"\n{len(open_threads)} open thread(s) analyzed.")
    print("Use gh-thread-context <THREAD_ID> to view code context for any thread.")


if __name__ == "__main__":
    main()
