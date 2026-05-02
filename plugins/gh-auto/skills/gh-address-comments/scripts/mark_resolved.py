#!/usr/bin/env python3
"""
Mark specific review threads as resolved using the GitHub GraphQL API.

Usage:
  gh-mark-resolved <thread_id_1> [thread_id_2] [...]
  gh-mark-resolved --all --input pr.json
  gh-mark-resolved --dry-run --all --input pr.json

Examples:
  gh-mark-resolved PRRT_kwDOABCDEF1234567 PRRT_kwDOABCDEF7654321
  gh-fetch-comments --pr 2 -o pr.json && gh-mark-resolved --all --input pr.json
"""

from __future__ import annotations

import argparse
import json
import os
import subprocess
import sys
from concurrent.futures import ThreadPoolExecutor, as_completed
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent))
from _bd_utils import check_bd_ready
from typing import Any


MUTATION = """\
mutation($threadId: ID!) {
  resolveReviewThread(input: {threadId: $threadId}) {
    thread {
      id
      isResolved
      resolvedBy {
        login
      }
    }
  }
}
"""


def _run(cmd: list[str], stdin: str | None = None) -> str:
    p = subprocess.run(cmd, input=stdin, capture_output=True, text=True)
    if p.returncode != 0:
        raise RuntimeError(f"Command failed: {' '.join(cmd)}\n{p.stderr}")
    return p.stdout


def _run_json(cmd: list[str], stdin: str | None = None) -> dict[str, Any]:
    out = _run(cmd, stdin=stdin)
    try:
        return json.loads(out)
    except json.JSONDecodeError as e:
        raise RuntimeError(
            f"Failed to parse JSON from command output: {e}\nRaw:\n{out}"
        ) from e


def mark_thread_resolved(thread_id: str) -> dict[str, Any]:
    cmd = [
        "gh", "api", "graphql",
        "-F", "query=@-",
        "-F", f"threadId={thread_id}",
    ]
    result = _run_json(cmd, stdin=MUTATION)
    if "errors" in result and result["errors"]:
        raise RuntimeError(
            f"Failed to resolve thread {thread_id}:\n"
            f"{json.dumps(result['errors'], indent=2)}"
        )
    return result


def resolve_thread(thread_id: str, dry_run: bool) -> dict[str, Any]:
    if dry_run:
        return {"thread_id": thread_id, "success": True, "dry_run": True}
    try:
        result = mark_thread_resolved(thread_id)
        thread = result["data"]["resolveReviewThread"]["thread"]
        resolved_by = (thread.get("resolvedBy") or {}).get("login", "unknown")
        return {"thread_id": thread_id, "success": True, "resolved_by": resolved_by}
    except RuntimeError as e:
        return {"thread_id": thread_id, "success": False, "error": str(e)}


def load_unresolved_from_file(path: str) -> list[str]:
    try:
        with open(path) as f:
            data = json.load(f)
    except (OSError, json.JSONDecodeError) as e:
        print(f"Error reading --input file: {e}", file=sys.stderr)
        sys.exit(1)
    threads = data.get("review_threads", [])
    unresolved = [t["id"] for t in threads if not t.get("isResolved") and not t.get("isOutdated")]
    return unresolved


def run_resolution(thread_ids: list[str], dry_run: bool, workers: int) -> int:
    """Resolve thread_ids concurrently. Returns number of failures."""
    if not thread_ids:
        print("No unresolved threads to resolve.")
        return 0

    if dry_run:
        print(f"[dry-run] Would resolve {len(thread_ids)} thread(s):")
        for tid in thread_ids:
            print(f"  {tid}")
        print()

    results: list[dict[str, Any]] = [{}] * len(thread_ids)
    index_map = {tid: i for i, tid in enumerate(thread_ids)}

    with ThreadPoolExecutor(max_workers=min(workers, len(thread_ids))) as executor:
        futures = {executor.submit(resolve_thread, tid, dry_run): tid for tid in thread_ids}
        for future in as_completed(futures):
            tid = futures[future]
            result = future.result()
            results[index_map[tid]] = result

            if result["success"]:
                if dry_run:
                    print(f"  [dry-run] {tid}")
                else:
                    print(f"✓ Resolved {tid} (by {result.get('resolved_by', 'unknown')})")
            else:
                print(f"✗ Failed to resolve {tid}: {result.get('error', '')}", file=sys.stderr)

    success_count = sum(1 for r in results if r["success"])
    total_count = len(results)
    label = "[dry-run] " if dry_run else ""
    print(f"\n{label}Resolved {success_count}/{total_count} threads")
    return total_count - success_count


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Mark GitHub PR review threads as resolved",
        epilog="Thread IDs look like: PRRT_kwDOABCDEF1234567",
    )
    group = parser.add_mutually_exclusive_group(required=True)
    group.add_argument("thread_ids", nargs="*", metavar="THREAD_ID", help="Review thread ID(s) to resolve")
    group.add_argument("--all", action="store_true", help="Resolve all unresolved threads from --input FILE")
    parser.add_argument("--input", "-i", metavar="FILE", help="JSON file from gh-fetch-comments (required with --all)")
    parser.add_argument("--dry-run", action="store_true", help="Preview which threads would be resolved without making changes")
    parser.add_argument("--workers", type=int, default=8, metavar="N", help="Max concurrent API calls (default: 8)")
    parser.add_argument("--no-beads", action="store_true", help="Skip automatic bead closing after resolving")
    args = parser.parse_args()

    if args.all:
        if not args.input:
            parser.error("--all requires --input FILE")
        thread_ids = load_unresolved_from_file(args.input)
        if not thread_ids:
            print("✓ No unresolved threads found in input file.")
            sys.exit(0)
        print(f"Found {len(thread_ids)} unresolved thread(s) in {args.input}")
    else:
        thread_ids = args.thread_ids
        if not thread_ids:
            parser.error("Provide at least one THREAD_ID or use --all --input FILE")

    failures = run_resolution(thread_ids, args.dry_run, args.workers)

    # Auto-close beads for resolved threads (skip silently if bd not ready or no mapping)
    if not args.no_beads and not failures and args.input:
        if args.dry_run or check_bd_ready(fatal=False):
            base, _ = os.path.splitext(args.input)
            mpath = base + ".beads.json"
            if os.path.exists(mpath):
                print(f"\nClosing beads...")
                close_cmd = [
                    sys.executable,
                    str(Path(__file__).parent / "close_beads.py"),
                    "--input", args.input,
                    "--reason", "Thread marked resolved via gh-mark-resolved",
                ]
                if args.dry_run:
                    close_cmd.append("--dry-run")
                subprocess.run(close_cmd, check=False)

    if failures:
        sys.exit(1)


if __name__ == "__main__":
    main()
