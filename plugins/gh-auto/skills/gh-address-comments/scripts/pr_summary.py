#!/usr/bin/env python3
"""
Human-readable summary of PR review threads, grouped by file or reviewer.

Usage:
  gh-fetch-comments --pr 2 | gh-pr-summary
  gh-pr-summary --input pr.json
  gh-pr-summary --input pr.json --by reviewer
  gh-pr-summary --input pr.json --filter-priority P1
  gh-pr-summary --input pr.json --format markdown
"""

from __future__ import annotations

import argparse
import json
import re
import sys
from collections import defaultdict
from typing import Any

# Matches P0/P1/P2/P3 badges embedded by review bots (cubic, coderabbit, copilot, etc.)
_PRIORITY_RE = re.compile(r"\bP([0-3])\b")
_PRIORITY_BADGE_RE = re.compile(r"!\[P([0-3])\s+Badge\]")

PRIORITY_LABELS = {"0": "P0 (critical)", "1": "P1 (high)", "2": "P2 (medium)", "3": "P3 (low)"}
PRIORITY_ORDER = {"0": 0, "1": 1, "2": 2, "3": 3, None: 4}


def _first_comment(thread: dict[str, Any]) -> dict[str, Any]:
    nodes = thread.get("comments", {}).get("nodes", [])
    return nodes[0] if nodes else {}


def _thread_status(thread: dict[str, Any]) -> str:
    if thread.get("isResolved"):
        return "resolved"
    if thread.get("isOutdated"):
        return "outdated"
    return "open"


def _status_icon(status: str) -> str:
    return {"resolved": "✓", "outdated": "~", "open": "✗"}.get(status, "?")


def _extract_priority(thread: dict[str, Any]) -> str | None:
    """Return '0','1','2','3', or None by scanning all comments in the thread."""
    for comment in thread.get("comments", {}).get("nodes", []):
        body = comment.get("body", "")
        # Badge format: ![P1 Badge] takes precedence (explicit bot annotation)
        m = _PRIORITY_BADGE_RE.search(body)
        if m:
            return m.group(1)
        # Fallback: plain P1/P2 mention
        m = _PRIORITY_RE.search(body)
        if m:
            return m.group(1)
    return None


def _sort_key_priority(thread: dict[str, Any]) -> tuple[int, int]:
    p = _extract_priority(thread)
    return (PRIORITY_ORDER[p], thread.get("line") or thread.get("originalLine") or 0)


def _format_thread_line(thread: dict[str, Any], show_path: bool = False) -> list[str]:
    comment = _first_comment(thread)
    author = comment.get("author", {}).get("login", "?")
    line = thread.get("line") or thread.get("originalLine", "?")
    body = comment.get("body", "")[:120].replace("\n", " ")
    status = _thread_status(thread)
    icon = _status_icon(status)
    tid = thread.get("id", "")
    priority = _extract_priority(thread)
    pri_tag = f"[P{priority}] " if priority is not None else ""
    path_prefix = f"{thread.get('path', '?')}:" if show_path else ""
    lines = [f"    {icon} {pri_tag}{path_prefix}L{line} @{author}: {body}..."]
    if status == "open":
        lines.append(f"       ID: {tid}")
    return lines


def summarize_by_file(threads: list[dict[str, Any]]) -> None:
    by_file: dict[str, list[dict]] = defaultdict(list)
    for thread in threads:
        by_file[thread.get("path", "(unknown)")].append(thread)

    for path in sorted(by_file):
        file_threads = sorted(by_file[path], key=_sort_key_priority)
        open_count = sum(1 for t in file_threads if _thread_status(t) == "open")
        resolved_count = sum(1 for t in file_threads if _thread_status(t) == "resolved")
        print(f"\n  {path}  [{open_count} open, {resolved_count} resolved]")
        for thread in file_threads:
            for line in _format_thread_line(thread):
                print(line)


def summarize_by_reviewer(threads: list[dict[str, Any]]) -> None:
    by_reviewer: dict[str, list[dict]] = defaultdict(list)
    for thread in threads:
        comment = _first_comment(thread)
        author = comment.get("author", {}).get("login", "unknown")
        by_reviewer[author].append(thread)

    for reviewer in sorted(by_reviewer):
        rev_threads = sorted(by_reviewer[reviewer], key=_sort_key_priority)
        open_count = sum(1 for t in rev_threads if _thread_status(t) == "open")
        resolved_count = sum(1 for t in rev_threads if _thread_status(t) == "resolved")
        print(f"\n  @{reviewer}  [{open_count} open, {resolved_count} resolved]")
        for thread in rev_threads:
            for line in _format_thread_line(thread, show_path=True):
                print(line)


def summarize_by_priority(threads: list[dict[str, Any]]) -> None:
    by_pri: dict[str | None, list[dict]] = defaultdict(list)
    for thread in threads:
        by_pri[_extract_priority(thread)].append(thread)

    for pri in ["0", "1", "2", "3", None]:
        group = by_pri.get(pri, [])
        if not group:
            continue
        label = PRIORITY_LABELS.get(str(pri), "untagged") if pri is not None else "untagged"
        open_count = sum(1 for t in group if _thread_status(t) == "open")
        print(f"\n  {label}  [{open_count} open]")
        for thread in group:
            for line in _format_thread_line(thread, show_path=True):
                print(line)


def format_markdown(pr: dict[str, Any], threads: list[dict[str, Any]], open_only: bool) -> str:
    display = [t for t in threads if _thread_status(t) == "open"] if open_only else threads
    display = sorted(display, key=_sort_key_priority)

    lines = [
        f"## PR Review Checklist — #{pr.get('number', '?')}",
        f"**{pr.get('title', '')}**  {pr.get('url', '')}",
        "",
    ]

    open_count = sum(1 for t in threads if _thread_status(t) == "open")
    resolved_count = sum(1 for t in threads if _thread_status(t) == "resolved")
    lines.append(f"**{open_count} open · {resolved_count} resolved**\n")

    by_file: dict[str, list[dict]] = defaultdict(list)
    for thread in display:
        by_file[thread.get("path", "(unknown)")].append(thread)

    for path in sorted(by_file):
        lines.append(f"### `{path}`")
        for thread in sorted(by_file[path], key=_sort_key_priority):
            comment = _first_comment(thread)
            author = comment.get("author", {}).get("login", "?")
            line_no = thread.get("line") or thread.get("originalLine", "?")
            body = comment.get("body", "")[:200].replace("\n", " ")
            status = _thread_status(thread)
            tid = thread.get("id", "")
            priority = _extract_priority(thread)
            checked = "x" if status != "open" else " "
            pri_tag = f"**[P{priority}]** " if priority is not None else ""
            lines.append(f"- [{checked}] {pri_tag}L{line_no} @{author}: {body}...")
            if status == "open":
                lines.append(f"  - Thread ID: `{tid}`")
        lines.append("")

    return "\n".join(lines)


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Human-readable summary of PR review threads",
        epilog="Reads JSON produced by gh-fetch-comments.",
    )
    parser.add_argument("--input", "-i", metavar="FILE", help="Read from FILE instead of stdin")
    parser.add_argument(
        "--by", choices=["file", "reviewer", "priority"], default="file",
        help="Group threads by file (default), reviewer, or priority",
    )
    parser.add_argument("--open-only", action="store_true", help="Show only unresolved threads")
    parser.add_argument(
        "--filter-priority", metavar="LEVEL", choices=["P0", "P1", "P2", "P3"],
        help="Show only threads at this priority level (e.g. P1)",
    )
    parser.add_argument(
        "--format", choices=["text", "markdown"], default="text",
        help="Output format: text (default) or markdown checklist",
    )
    args = parser.parse_args()

    try:
        if args.input:
            with open(args.input) as f:
                data = json.load(f)
        else:
            data = json.load(sys.stdin)
    except (json.JSONDecodeError, OSError) as e:
        print(f"Error: {e}", file=sys.stderr)
        sys.exit(1)

    pr = data.get("pull_request", {})
    threads: list[dict[str, Any]] = data.get("review_threads", [])
    conv_comments: list[dict[str, Any]] = data.get("conversation_comments", [])
    reviews: list[dict[str, Any]] = data.get("reviews", [])

    open_threads = [t for t in threads if _thread_status(t) == "open"]
    resolved_threads = [t for t in threads if _thread_status(t) == "resolved"]
    outdated_threads = [t for t in threads if _thread_status(t) == "outdated"]

    # Apply filters
    display_threads = open_threads if args.open_only else threads
    if args.filter_priority:
        level = args.filter_priority[1]  # "P1" -> "1"
        display_threads = [t for t in display_threads if _extract_priority(t) == level]

    if args.format == "markdown":
        print(format_markdown(pr, threads, args.open_only))
        return

    # Text output
    print(f"PR #{pr.get('number', '?')}: {pr.get('title', 'Unknown')}")
    print(f"URL: {pr.get('url', '')}")
    print("=" * 80)
    print(f"  Review threads:  {len(open_threads)} open  •  {len(resolved_threads)} resolved  •  {len(outdated_threads)} outdated")
    print(f"  Conversation:    {len(conv_comments)} comment(s)")
    print(f"  Reviews:         {len(reviews)} submission(s)")

    # Priority breakdown for open threads
    pri_counts: dict[str, int] = defaultdict(int)
    for t in open_threads:
        p = _extract_priority(t)
        pri_counts[f"P{p}" if p is not None else "untagged"] += 1
    if pri_counts:
        breakdown = "  •  ".join(f"{k}: {v}" for k, v in sorted(pri_counts.items()))
        print(f"  Priority:        {breakdown}")

    if not display_threads:
        print("\n✓ No threads to display.")
        return

    filter_desc = f"{args.filter_priority} " if args.filter_priority else ""
    label = f"open {filter_desc}threads" if args.open_only else f"all {filter_desc}threads"
    print(f"\n{'─' * 80}")
    print(f"Grouped by {args.by} ({label}):")

    if args.by == "file":
        summarize_by_file(display_threads)
    elif args.by == "reviewer":
        summarize_by_reviewer(display_threads)
    else:
        summarize_by_priority(display_threads)

    if open_threads and not args.filter_priority:
        print(f"\n{'─' * 80}")
        print("To resolve all open threads at once:")
        print("  gh-mark-resolved --all --input <your-pr.json>")


if __name__ == "__main__":
    main()
