#!/usr/bin/env python3
"""
Generate a changelog from PR commits that reference resolved review threads.

Scans commit messages for "Resolves review thread PRRT_..." patterns,
cross-references with thread data, and produces a structured summary of
what was fixed — useful for updating the PR description before merge.

Usage:
  gh-pr-changelog --pr 2 --input pr.json
  gh-pr-changelog --pr 2                  # live fetch thread data
  gh-pr-changelog --pr 2 --format markdown
"""

from __future__ import annotations

import argparse
import json
import re
import subprocess
import sys
from collections import defaultdict
from typing import Any

# Matches: "Resolves review thread PRRT_kwDO..."
_THREAD_REF_RE = re.compile(r"Resolves review thread (PRRT_\S+)", re.IGNORECASE)
# Also match: "address PR comment #N - description"
_COMMENT_REF_RE = re.compile(r"address PR comment #(\d+)\s*[-–]\s*(.+)", re.IGNORECASE)


def _run(cmd: list[str]) -> str:
    p = subprocess.run(cmd, capture_output=True, text=True)
    if p.returncode != 0:
        raise RuntimeError(f"Command failed: {' '.join(cmd)}\n{p.stderr}")
    return p.stdout


def _run_json(cmd: list[str]) -> Any:
    return json.loads(_run(cmd))


def get_pr_commits(owner: str, repo: str, pr_number: int) -> list[dict[str, Any]]:
    commits = _run_json(["gh", "pr", "view", str(pr_number), "--repo", f"{owner}/{repo}",
                         "--json", "commits"])
    return commits.get("commits", [])


def parse_thread_refs(commit: dict[str, Any]) -> list[str]:
    body = commit.get("messageBody", "") or ""
    headline = commit.get("messageHeadline", "") or ""
    full_msg = f"{headline}\n{body}"
    return _THREAD_REF_RE.findall(full_msg)


def parse_comment_desc(commit: dict[str, Any]) -> str | None:
    headline = commit.get("messageHeadline", "") or ""
    m = _COMMENT_REF_RE.search(headline)
    return m.group(2).strip() if m else None


def build_thread_index(data: dict[str, Any]) -> dict[str, dict[str, Any]]:
    return {t["id"]: t for t in data.get("review_threads", [])}


def thread_summary(thread: dict[str, Any]) -> str:
    path = thread.get("path", "?")
    line = thread.get("line") or thread.get("originalLine", "?")
    comments = thread.get("comments", {}).get("nodes", [])
    if not comments:
        return f"{path}:L{line}"
    first = comments[0]
    author = first.get("author", {}).get("login", "?")
    body = first.get("body", "")[:120].replace("\n", " ")
    return f"{path}:L{line} (@{author}): {body}..."


def format_text(pr: dict[str, Any], entries: list[dict[str, Any]], unlinked: list[dict[str, Any]]) -> str:
    lines = [
        f"Changelog for PR #{pr.get('number', '?')}: {pr.get('title', '')}",
        f"URL: {pr.get('url', '')}",
        "=" * 70,
        "",
    ]

    if entries:
        lines.append(f"Resolved threads ({len(entries)}):")
        lines.append("")
        for e in entries:
            sha = e["sha"][:8]
            desc = e["commit_desc"]
            lines.append(f"  [{sha}] {desc}")
            for t in e["threads"]:
                lines.append(f"    → {t}")
            lines.append("")
    else:
        lines.append("No commits found with 'Resolves review thread' references.")
        lines.append("(Use the commit message format from gh-address-comments skill to enable this)")
        lines.append("")

    if unlinked:
        lines.append(f"Resolved threads with no linked commit ({len(unlinked)}):")
        for t in unlinked:
            lines.append(f"  • {t}")
        lines.append("")

    return "\n".join(lines)


def format_markdown(pr: dict[str, Any], entries: list[dict[str, Any]], unlinked: list[dict[str, Any]]) -> str:
    lines = [
        f"## Review Feedback Addressed",
        "",
        f"The following review threads were resolved in this PR:",
        "",
    ]

    if entries:
        for e in entries:
            sha = e["sha"][:8]
            desc = e["commit_desc"]
            lines.append(f"### {desc} (`{sha}`)")
            for t in e["threads"]:
                lines.append(f"- {t}")
            lines.append("")
    else:
        lines.append("_No commits found with structured thread references._")
        lines.append("")

    if unlinked:
        lines.append("### Additionally resolved (no commit link)")
        for t in unlinked:
            lines.append(f"- {t}")
        lines.append("")

    return "\n".join(lines)


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Generate a changelog from PR commits referencing resolved threads",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog=(
            "Examples:\n"
            "  gh-pr-changelog --pr 2 --input pr.json\n"
            "  gh-pr-changelog --pr 2 --format markdown\n"
        ),
    )
    parser.add_argument("--pr", type=int, metavar="NUMBER", required=True, help="PR number")
    parser.add_argument("--repo", metavar="OWNER/REPO", help="Repository (default: auto-detect)")
    parser.add_argument("--input", "-i", metavar="FILE", help="Cached thread JSON from gh-fetch-comments")
    parser.add_argument("--format", choices=["text", "markdown"], default="text",
                        help="Output format (default: text)")
    args = parser.parse_args()

    # Resolve repo
    if args.repo:
        parts = args.repo.split("/", 1)
        owner, repo = parts[0], parts[1]
    else:
        remote = _run_json(["gh", "repo", "view", "--json", "owner,name"])
        owner = remote["owner"]["login"]
        repo = remote["name"]

    # Load thread data
    try:
        if args.input:
            with open(args.input) as f:
                data = json.load(f)
        else:
            out = subprocess.run(
                [sys.executable, __file__.replace("pr_changelog.py", "fetch_comments.py"),
                 "--pr", str(args.pr), "--repo", f"{owner}/{repo}"],
                capture_output=True, text=True,
            )
            data = json.loads(out.stdout)
    except (OSError, json.JSONDecodeError) as e:
        print(f"Error loading thread data: {e}", file=sys.stderr)
        sys.exit(1)

    pr_meta = data.get("pull_request", {})
    thread_index = build_thread_index(data)
    resolved_thread_ids = {
        t["id"] for t in data.get("review_threads", []) if t.get("isResolved")
    }

    # Get commits
    try:
        commits = get_pr_commits(owner, repo, args.pr)
    except Exception as e:
        print(f"Error fetching commits: {e}", file=sys.stderr)
        sys.exit(1)

    # Build entries: commit → threads it resolved
    linked_thread_ids: set[str] = set()
    entries: list[dict[str, Any]] = []

    for commit in commits:
        thread_ids = parse_thread_refs(commit)
        if not thread_ids:
            continue
        sha = commit.get("oid", "")
        desc = parse_comment_desc(commit) or commit.get("messageHeadline", sha[:8])
        thread_summaries = []
        for tid in thread_ids:
            linked_thread_ids.add(tid)
            thread = thread_index.get(tid)
            if thread:
                thread_summaries.append(thread_summary(thread))
            else:
                thread_summaries.append(f"{tid} (thread data not found)")
        entries.append({"sha": sha, "commit_desc": desc, "threads": thread_summaries})

    # Resolved threads with no linked commit
    unlinked = [
        thread_summary(thread_index[tid])
        for tid in resolved_thread_ids
        if tid not in linked_thread_ids and tid in thread_index
    ]

    if args.format == "markdown":
        print(format_markdown(pr_meta, entries, unlinked))
    else:
        print(format_text(pr_meta, entries, unlinked))


if __name__ == "__main__":
    main()
