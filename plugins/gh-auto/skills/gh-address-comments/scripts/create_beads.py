#!/usr/bin/env python3
"""
Create a bead for each open PR review thread.

Beads are created with priority mapped from P0-P3 badges, the thread's file
and line as context, and the full comment body as description. A mapping file
is saved alongside --input so gh-close-beads can close them later.

Mapping file: <input>.beads.json (e.g. pr.json → pr.beads.json)

Usage:
  gh-create-beads --input pr.json
  gh-create-beads --input pr.json --dry-run
  gh-create-beads --input pr.json --label pr-review --label team-alpha
"""

from __future__ import annotations

import argparse
import json
import os
import re
import subprocess
import sys
from pathlib import Path
from typing import Any

sys.path.insert(0, str(Path(__file__).parent))
from _bd_utils import check_bd_ready

_PRIORITY_BADGE_RE = re.compile(r"!\[P([0-3])\s+Badge\]")
_PRIORITY_RE = re.compile(r"\bP([0-3])\b")

# Map detected priority → bd priority (0=critical, 4=lowest)
_PRI_MAP = {"0": "0", "1": "1", "2": "2", "3": "3"}
_DEFAULT_PRI = "2"


def _run(cmd: list[str]) -> subprocess.CompletedProcess[str]:
    return subprocess.run(cmd, capture_output=True, text=True)


def _extract_priority(thread: dict[str, Any]) -> str:
    for comment in thread.get("comments", {}).get("nodes", []):
        body = comment.get("body", "")
        m = _PRIORITY_BADGE_RE.search(body)
        if m:
            return _PRI_MAP[m.group(1)]
        m = _PRIORITY_RE.search(body)
        if m:
            return _PRI_MAP.get(m.group(1), _DEFAULT_PRI)
    return _DEFAULT_PRI


def _first_comment(thread: dict[str, Any]) -> dict[str, Any]:
    nodes = thread.get("comments", {}).get("nodes", [])
    return nodes[0] if nodes else {}


def _bead_title(thread: dict[str, Any], pr_number: int) -> str:
    path = thread.get("path", "?")
    line = thread.get("line") or thread.get("originalLine", "?")
    comment = _first_comment(thread)
    author = comment.get("author", {}).get("login", "?")
    body = comment.get("body", "").replace("\n", " ").strip()[:80]
    return f"PR #{pr_number} review: {path}:L{line} (@{author}) {body}"


def _bead_description(thread: dict[str, Any], pr: dict[str, Any]) -> str:
    path = thread.get("path", "?")
    line = thread.get("line") or thread.get("originalLine", "?")
    pr_url = pr.get("url", "")
    tid = thread.get("id", "")
    parts = [
        f"PR: {pr_url}",
        f"File: {path}:L{line}",
        f"Thread ID: {tid}",
        "",
    ]
    for i, comment in enumerate(thread.get("comments", {}).get("nodes", [])):
        author = comment.get("author", {}).get("login", "?")
        body = comment.get("body", "").strip()
        label = "Comment" if i == 0 else f"Reply {i}"
        parts.append(f"{label} (@{author}):")
        parts.append(body[:1000])
        parts.append("")
    return "\n".join(parts)


def create_bead(thread: dict[str, Any], pr: dict[str, Any], extra_labels: list[str], dry_run: bool) -> str | None:
    """Create a bead and return its ID, or None on failure."""
    title = _bead_title(thread, pr.get("number", "?"))
    description = _bead_description(thread, pr)
    priority = _extract_priority(thread)
    tid = thread.get("id", "")
    path = thread.get("path", "")
    line = thread.get("line") or thread.get("originalLine", "")
    pr_number = pr.get("number", "")

    labels = ["pr-review"] + extra_labels
    reviewer = (_first_comment(thread).get("author") or {}).get("login")
    if reviewer:
        labels.append(f"reviewer-{reviewer}")

    metadata = json.dumps({
        "thread_id": tid,
        "pr": pr_number,
        "path": path,
        "line": line,
        "pr_url": pr.get("url", ""),
    })

    cmd = [
        "bd", "create", title,
        "-t", "task",
        "-p", priority,
        "-d", description,
        "--external-ref", f"gh-thread-{tid}",
        "--metadata", metadata,
        "--silent",
    ]
    for label in labels:
        cmd += ["-l", label]

    if dry_run:
        print(f"  [dry-run] Would create: {title[:80]}")
        print(f"            priority={priority} labels={labels}")
        return "dry-run"

    result = _run(cmd)
    if result.returncode != 0:
        print(f"  ✗ Failed to create bead for {tid}: {result.stderr.strip()}", file=sys.stderr)
        return None

    return result.stdout.strip()


def load_mapping(mapping_path: str) -> dict[str, str]:
    """Load existing thread_id → bead_id mapping."""
    if os.path.exists(mapping_path):
        try:
            with open(mapping_path) as f:
                return json.load(f)
        except (OSError, json.JSONDecodeError):
            pass
    return {}


def save_mapping(mapping_path: str, mapping: dict[str, str]) -> None:
    with open(mapping_path, "w") as f:
        json.dump(mapping, f, indent=2)


def mapping_path_for(input_path: str) -> str:
    base, _ = os.path.splitext(input_path)
    return base + ".beads.json"


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Create a bead for each open PR review thread",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog=(
            "Examples:\n"
            "  gh-create-beads --input pr.json\n"
            "  gh-create-beads --input pr.json --dry-run\n"
            "  gh-create-beads --input pr.json -l sprint-42\n"
        ),
    )
    parser.add_argument("--input", "-i", metavar="FILE", required=True,
                        help="Cached JSON from gh-fetch-comments")
    parser.add_argument("--label", "-l", metavar="LABEL", action="append", default=[],
                        dest="labels", help="Extra label(s) to add to all beads (repeatable)")
    parser.add_argument("--dry-run", action="store_true",
                        help="Show what would be created without calling bd")
    parser.add_argument("--force", action="store_true",
                        help="Re-create beads even if a mapping already exists")
    args = parser.parse_args()

    if not args.dry_run:
        check_bd_ready()

    try:
        with open(args.input) as f:
            data = json.load(f)
    except (OSError, json.JSONDecodeError) as e:
        print(f"Error reading input: {e}", file=sys.stderr)
        sys.exit(1)

    pr = data.get("pull_request", {})
    threads = data.get("review_threads", [])
    open_threads = [t for t in threads if not t.get("isResolved") and not t.get("isOutdated")]

    if not open_threads:
        print("✓ No open threads to create beads for.")
        return

    mpath = mapping_path_for(args.input)
    mapping = {} if args.force else load_mapping(mpath)

    already = sum(1 for t in open_threads if t["id"] in mapping)
    to_create = [t for t in open_threads if t["id"] not in mapping]

    print(f"PR #{pr.get('number', '?')}: {pr.get('title', '')}")
    print(f"{len(open_threads)} open thread(s) — {already} already have beads, creating {len(to_create)}")
    if not args.dry_run:
        print(f"Mapping file: {mpath}")
    print()

    created = 0
    for thread in to_create:
        tid = thread["id"]
        path = thread.get("path", "?")
        line = thread.get("line") or thread.get("originalLine", "?")
        print(f"  {path}:L{line} ({tid[:20]}...)")

        bead_id = create_bead(thread, pr, args.labels, args.dry_run)
        if bead_id and not args.dry_run:
            mapping[tid] = bead_id
            print(f"  ✓ Created bead {bead_id}")
            created += 1
        elif bead_id == "dry-run":
            created += 1

    if not args.dry_run and created:
        save_mapping(mpath, mapping)
        print(f"\n✓ Created {created} bead(s). Mapping saved to {mpath}")
        print(f"\nTo close beads when threads are resolved:")
        print(f"  gh-close-beads --input {args.input}")
    elif args.dry_run:
        print(f"\n[dry-run] Would create {created} bead(s).")


if __name__ == "__main__":
    main()
