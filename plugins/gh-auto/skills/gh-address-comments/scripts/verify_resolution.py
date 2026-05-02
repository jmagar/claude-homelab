#!/usr/bin/env python3
"""
Verify that all review threads have been addressed.

Reads PR comment data (from gh-fetch-comments output) and checks that all
review threads are either resolved or outdated.

Usage:
  gh-fetch-comments --pr 2 | gh-verify-resolution
  gh-fetch-comments --pr 2 -o pr.json && gh-verify-resolution --input pr.json
  gh-verify-resolution --pr 2 --watch --interval 30

Exit codes:
  0 - All threads addressed
  1 - Unresolved threads found
"""

from __future__ import annotations

import argparse
import json
import subprocess
import sys
import time
from typing import Any


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
        raise RuntimeError(f"Failed to parse JSON: {e}\nRaw:\n{out}") from e


def fetch_live(pr: int, repo: str | None) -> dict[str, Any]:
    """Re-fetch PR data live via gh-fetch-comments subprocess."""
    cmd = [sys.executable, __file__.replace("verify_resolution.py", "fetch_comments.py"), "--pr", str(pr)]
    if repo:
        cmd += ["--repo", repo]
    out = _run(cmd)
    return json.loads(out)


def analyze_threads(data: dict[str, Any]) -> tuple[list[dict], list[dict]]:
    review_threads = data.get("review_threads", [])
    unresolved, resolved = [], []
    for thread in review_threads:
        if thread.get("isResolved") or thread.get("isOutdated"):
            resolved.append(thread)
        else:
            unresolved.append(thread)
    return unresolved, resolved


def format_thread_summary(thread: dict[str, Any], index: int) -> str:
    path = thread.get("path", "unknown file")
    line = thread.get("line") or thread.get("originalLine", "?")
    comments = thread.get("comments", {}).get("nodes", [])
    if not comments:
        return f"  {index}. {path}:{line} (no comments)"
    first_comment = comments[0]
    author = first_comment.get("author", {}).get("login", "unknown")
    body_preview = first_comment.get("body", "")[:100].replace("\n", " ")
    return f"  {index}. {path}:{line} (@{author}): {body_preview}..."


def verify_once(data: dict[str, Any], verbose: bool = True) -> tuple[bool, list[dict], list[dict]]:
    unresolved, resolved = analyze_threads(data)
    pr_info = data.get("pull_request", {})
    pr_number = pr_info.get("number", "?")
    pr_title = pr_info.get("title", "Unknown PR")

    if verbose:
        print(f"Verifying PR #{pr_number}: {pr_title}")
        print("=" * 80)
        if resolved:
            print(f"\n✓ {len(resolved)} thread(s) resolved or outdated")
        if unresolved:
            print(f"\n✗ {len(unresolved)} UNRESOLVED thread(s):")
            for idx, thread in enumerate(unresolved, 1):
                print(format_thread_summary(thread, idx))
                print(f"     Thread ID: {thread.get('id', 'unknown')}")
            print("\n" + "=" * 80)
            print("BLOCKED: Address all unresolved threads before completing PR review.")
            print("\nTo mark threads as resolved, run:")
            print("  gh-mark-resolved <thread_id_1> [thread_id_2] ...")
        else:
            print("\n" + "=" * 80)
            print("✓ All review threads have been addressed!")
            print("  You may proceed with completing the PR review.")

    return len(unresolved) == 0, unresolved, resolved


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Verify all PR review threads are resolved",
        epilog="Reads JSON produced by gh-fetch-comments.",
    )
    parser.add_argument("--input", "-i", metavar="FILE", help="Read from FILE instead of stdin")
    parser.add_argument("--watch", action="store_true", help="Poll until all threads are resolved")
    parser.add_argument("--pr", type=int, metavar="NUMBER", help="PR number for --watch live re-fetch")
    parser.add_argument("--repo", metavar="OWNER/REPO", help="Repository for --watch live re-fetch")
    parser.add_argument("--interval", type=int, default=30, metavar="SECONDS", help="Poll interval for --watch (default: 30)")
    args = parser.parse_args()

    if args.watch and not args.pr:
        parser.error("--watch requires --pr NUMBER")

    def load_data() -> dict[str, Any]:
        if args.watch:
            return fetch_live(args.pr, args.repo)
        if args.input:
            with open(args.input) as f:
                return json.load(f)
        return json.load(sys.stdin)

    if not args.watch:
        try:
            data = load_data()
        except (json.JSONDecodeError, OSError) as e:
            print(f"Error: Failed to parse JSON input: {e}", file=sys.stderr)
            sys.exit(1)
        ok, _, _ = verify_once(data)
        sys.exit(0 if ok else 1)

    # Watch mode
    attempt = 0
    while True:
        attempt += 1
        try:
            data = load_data()
        except Exception as e:
            print(f"[watch] Fetch failed: {e}", file=sys.stderr)
            time.sleep(args.interval)
            continue

        pr_info = data.get("pull_request", {})
        unresolved, resolved = analyze_threads(data)
        total = len(unresolved) + len(resolved)
        timestamp = time.strftime("%H:%M:%S")

        if not unresolved:
            print(f"\n[{timestamp}] ✓ All {total} thread(s) resolved — done.")
            sys.exit(0)

        print(f"[{timestamp}] {len(resolved)}/{total} resolved, {len(unresolved)} remaining — next check in {args.interval}s")
        for thread in unresolved:
            path = thread.get("path", "?")
            line = thread.get("line") or thread.get("originalLine", "?")
            print(f"  • {path}:{line}  {thread.get('id', '')}")

        try:
            time.sleep(args.interval)
        except KeyboardInterrupt:
            print("\n[watch] Interrupted.")
            sys.exit(1)


if __name__ == "__main__":
    main()
