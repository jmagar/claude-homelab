#!/usr/bin/env python3
"""
Show file code context for a PR review thread.

Fetches the file at the PR's head commit and displays the lines around
the commented line — so you can read what's being discussed without
opening a browser.

Usage:
  gh-thread-context PRRT_kwDOABCDEF1234567 --input pr.json
  gh-thread-context PRRT_kwDOABCDEF1234567 --pr 2 --lines 15
  gh-thread-context --list --input pr.json    # list all open thread IDs
"""

from __future__ import annotations

import argparse
import base64
import json
import subprocess
import sys
from typing import Any


def _run(cmd: list[str]) -> str:
    p = subprocess.run(cmd, capture_output=True, text=True)
    if p.returncode != 0:
        raise RuntimeError(f"Command failed: {' '.join(cmd)}\n{p.stderr}")
    return p.stdout


def _run_json(cmd: list[str]) -> Any:
    return json.loads(_run(cmd))


def find_thread(data: dict[str, Any], thread_id: str) -> dict[str, Any] | None:
    for t in data.get("review_threads", []):
        if t.get("id") == thread_id:
            return t
    return None


def fetch_file_at_ref(owner: str, repo: str, path: str, ref: str) -> list[str]:
    result = _run_json(["gh", "api", f"repos/{owner}/{repo}/contents/{path}?ref={ref}"])
    content = base64.b64decode(result["content"]).decode("utf-8", errors="replace")
    return content.splitlines()


def get_head_sha(owner: str, repo: str, pr_number: int) -> str:
    pr = _run_json(["gh", "pr", "view", str(pr_number), "--repo", f"{owner}/{repo}",
                    "--json", "headRefOid"])
    return pr["headRefOid"]


def show_context(thread: dict[str, Any], lines: list[str], context: int) -> None:
    target_line = thread.get("line") or thread.get("originalLine")
    start_line = thread.get("startLine") or thread.get("originalStartLine") or target_line

    if target_line is None:
        print("(no line number — file-level comment)")
        return

    # 1-indexed → 0-indexed
    lo = max(0, start_line - 1 - context)
    hi = min(len(lines), target_line + context)

    for i in range(lo, hi):
        lineno = i + 1
        marker = "▶" if start_line <= lineno <= target_line else " "
        print(f"  {marker} {lineno:>5}  {lines[i]}")


def format_comment_preview(thread: dict[str, Any]) -> str:
    nodes = thread.get("comments", {}).get("nodes", [])
    if not nodes:
        return "(no comments)"
    c = nodes[0]
    author = c.get("author", {}).get("login", "?")
    body = c.get("body", "")[:300].replace("\n", " ")
    n_replies = len(nodes) - 1
    reply_str = f" (+{n_replies} replies)" if n_replies else ""
    return f"@{author}: {body}...{reply_str}"


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Show file code context for a PR review thread",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog=(
            "Examples:\n"
            "  gh-thread-context PRRT_kwDO... --input pr.json\n"
            "  gh-thread-context PRRT_kwDO... --pr 2 --lines 20\n"
            "  gh-thread-context --list --input pr.json\n"
        ),
    )
    parser.add_argument("thread_id", nargs="?", metavar="THREAD_ID", help="Thread ID to show context for")
    parser.add_argument("--list", action="store_true", help="List all open threads (no context fetch)")
    parser.add_argument("--input", "-i", metavar="FILE", help="Cached JSON from gh-fetch-comments")
    parser.add_argument("--pr", type=int, metavar="NUMBER", help="PR number (for live fetch or head SHA)")
    parser.add_argument("--repo", metavar="OWNER/REPO", help="Repository (default: auto-detect)")
    parser.add_argument("--lines", type=int, default=8, metavar="N", help="Lines of context above/below (default: 8)")
    args = parser.parse_args()

    if not args.thread_id and not args.list:
        parser.error("Provide a THREAD_ID or use --list")

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
        elif args.pr:
            out = subprocess.run(
                [sys.executable, __file__.replace("thread_context.py", "fetch_comments.py"),
                 "--pr", str(args.pr), "--repo", f"{owner}/{repo}"],
                capture_output=True, text=True,
            )
            data = json.loads(out.stdout)
        else:
            parser.error("Provide --input FILE or --pr NUMBER")
    except (OSError, json.JSONDecodeError) as e:
        print(f"Error loading thread data: {e}", file=sys.stderr)
        sys.exit(1)

    # --list mode
    if args.list:
        threads = data.get("review_threads", [])
        open_threads = [t for t in threads if not t.get("isResolved") and not t.get("isOutdated")]
        print(f"{len(open_threads)} open thread(s):\n")
        for t in open_threads:
            path = t.get("path", "?")
            line = t.get("line") or t.get("originalLine", "?")
            print(f"  {t['id']}")
            print(f"    {path}:L{line}")
            print(f"    {format_comment_preview(t)}")
            print()
        return

    # Single thread context
    thread = find_thread(data, args.thread_id)
    if not thread:
        print(f"Thread {args.thread_id} not found in data.", file=sys.stderr)
        sys.exit(1)

    path = thread.get("path", "")
    target_line = thread.get("line") or thread.get("originalLine")
    status = "resolved" if thread.get("isResolved") else ("outdated" if thread.get("isOutdated") else "open")

    print(f"Thread: {args.thread_id}")
    print(f"File:   {path}:L{target_line}")
    print(f"Status: {status}")
    print(f"Comment: {format_comment_preview(thread)}")

    # All replies
    nodes = thread.get("comments", {}).get("nodes", [])
    if len(nodes) > 1:
        print(f"\nReplies ({len(nodes) - 1}):")
        for c in nodes[1:]:
            author = c.get("author", {}).get("login", "?")
            body = c.get("body", "")[:200].replace("\n", " ")
            print(f"  @{author}: {body}...")

    if not path:
        print("\n(No file path — cannot show code context)")
        return

    print(f"\n{'─' * 70}")
    print(f"Code context ({args.lines} lines):")
    print()

    # Get head SHA
    try:
        if args.pr:
            sha = get_head_sha(owner, repo, args.pr)
        else:
            pr_num = data.get("pull_request", {}).get("number")
            if not pr_num:
                print("Cannot determine PR number — pass --pr NUMBER", file=sys.stderr)
                sys.exit(1)
            sha = get_head_sha(owner, repo, pr_num)

        file_lines = fetch_file_at_ref(owner, repo, path, sha)
        show_context(thread, file_lines, args.lines)
    except Exception as e:
        print(f"Could not fetch file content: {e}", file=sys.stderr)
        print(f"(The file may have been renamed, deleted, or permissions denied)")


if __name__ == "__main__":
    main()
