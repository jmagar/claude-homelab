#!/usr/bin/env python3
"""
Close beads for resolved PR review threads.

Reads the mapping file produced by gh-create-beads, re-fetches or reads the
current thread state, and closes any beads whose threads are now resolved.

Mapping file: <input>.beads.json (auto-discovered from --input)

Usage:
  gh-close-beads --input pr.json
  gh-close-beads --input pr.json --dry-run
  gh-close-beads --input pr.json --refresh   # re-fetch live state first
"""

from __future__ import annotations

import argparse
import json
import os
import subprocess
import sys
from pathlib import Path
from typing import Any

sys.path.insert(0, str(Path(__file__).parent))
from _bd_utils import check_bd_ready


def _run(cmd: list[str]) -> subprocess.CompletedProcess[str]:
    return subprocess.run(cmd, capture_output=True, text=True)


def mapping_path_for(input_path: str) -> str:
    base, _ = os.path.splitext(input_path)
    return base + ".beads.json"


def load_mapping(mpath: str) -> dict[str, str]:
    try:
        with open(mpath) as f:
            return json.load(f)
    except (OSError, json.JSONDecodeError) as e:
        print(f"Error reading mapping file {mpath}: {e}", file=sys.stderr)
        sys.exit(1)


def fetch_live(pr_number: int, repo: str | None) -> dict[str, Any]:
    cmd = [sys.executable, __file__.replace("close_beads.py", "fetch_comments.py"),
           "--pr", str(pr_number)]
    if repo:
        cmd += ["--repo", repo]
    result = subprocess.run(cmd, capture_output=True, text=True)
    if result.returncode != 0:
        print(f"Error fetching live data: {result.stderr}", file=sys.stderr)
        sys.exit(1)
    return json.loads(result.stdout)


def bead_exists_and_open(bead_id: str) -> bool:
    """Check whether the bead is still open (not already closed)."""
    result = _run(["bd", "show", bead_id, "--json"])
    if result.returncode != 0:
        return False
    try:
        data = json.loads(result.stdout)
        status = data.get("status", "")
        return status not in ("closed",)
    except json.JSONDecodeError:
        return True  # assume open if we can't parse


def close_bead(bead_id: str, reason: str, dry_run: bool) -> bool:
    if dry_run:
        return True
    result = _run(["bd", "close", bead_id, "--reason", reason])
    return result.returncode == 0


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Close beads for resolved PR review threads",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog=(
            "Examples:\n"
            "  gh-close-beads --input pr.json\n"
            "  gh-close-beads --input pr.json --refresh\n"
            "  gh-close-beads --input pr.json --dry-run\n"
        ),
    )
    parser.add_argument("--input", "-i", metavar="FILE", required=True,
                        help="Cached JSON from gh-fetch-comments (mapping file auto-discovered)")
    parser.add_argument("--beads", metavar="FILE",
                        help="Explicit mapping file path (default: <input>.beads.json)")
    parser.add_argument("--refresh", action="store_true",
                        help="Re-fetch live thread state before closing (instead of using cached)")
    parser.add_argument("--pr", type=int, metavar="NUMBER",
                        help="PR number for --refresh (auto-detected from cached data if omitted)")
    parser.add_argument("--repo", metavar="OWNER/REPO",
                        help="Repository for --refresh")
    parser.add_argument("--reason", metavar="TEXT",
                        default="PR review thread resolved",
                        help="Reason written to the bead on close (default: 'PR review thread resolved')")
    parser.add_argument("--dry-run", action="store_true",
                        help="Show what would be closed without calling bd")
    args = parser.parse_args()

    if not args.dry_run:
        check_bd_ready()

    # Load thread data
    try:
        with open(args.input) as f:
            cached_data = json.load(f)
    except (OSError, json.JSONDecodeError) as e:
        print(f"Error reading input: {e}", file=sys.stderr)
        sys.exit(1)

    if args.refresh:
        pr_number = args.pr or cached_data.get("pull_request", {}).get("number")
        if not pr_number:
            print("Cannot determine PR number for refresh — pass --pr NUMBER", file=sys.stderr)
            sys.exit(1)
        print(f"Re-fetching live thread state for PR #{pr_number}...")
        data = fetch_live(pr_number, args.repo)
    else:
        data = cached_data

    pr = data.get("pull_request", {})
    threads = data.get("review_threads", [])

    # Build resolved set
    resolved_ids = {
        t["id"] for t in threads
        if t.get("isResolved") or t.get("isOutdated")
    }

    # Load mapping
    mpath = args.beads or mapping_path_for(args.input)
    if not os.path.exists(mpath):
        print(f"No mapping file found at {mpath}.", file=sys.stderr)
        print(f"Run gh-create-beads --input {args.input} first.", file=sys.stderr)
        sys.exit(1)

    mapping: dict[str, str] = load_mapping(mpath)

    to_close = {tid: bid for tid, bid in mapping.items() if tid in resolved_ids}
    already_open = {tid: bid for tid, bid in mapping.items() if tid not in resolved_ids}

    print(f"PR #{pr.get('number', '?')}: {pr.get('title', '')}")
    print(f"{len(resolved_ids)} resolved thread(s) — {len(to_close)} have beads to close, {len(already_open)} still open")
    print()

    if not to_close:
        print("✓ No beads to close.")
        return

    closed = 0
    skipped = 0
    failed = 0

    for tid, bead_id in to_close.items():
        thread = next((t for t in threads if t["id"] == tid), {})
        path = thread.get("path", "?")
        line = thread.get("line") or thread.get("originalLine", "?")
        print(f"  {path}:L{line}  bead={bead_id}")

        if not args.dry_run and not bead_exists_and_open(bead_id):
            print(f"    ~ Already closed, skipping")
            skipped += 1
            continue

        ok = close_bead(bead_id, args.reason, args.dry_run)
        if ok:
            print(f"    {'[dry-run] Would close' if args.dry_run else '✓ Closed'} {bead_id}")
            closed += 1
        else:
            print(f"    ✗ Failed to close {bead_id}", file=sys.stderr)
            failed += 1

    print()
    label = "[dry-run] " if args.dry_run else ""
    print(f"{label}Closed {closed} bead(s)", end="")
    if skipped:
        print(f", {skipped} already closed", end="")
    if failed:
        print(f", {failed} failed", end="")
    print()

    if failed:
        sys.exit(1)


if __name__ == "__main__":
    main()
