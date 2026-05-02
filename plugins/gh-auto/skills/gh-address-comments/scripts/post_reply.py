#!/usr/bin/env python3
"""
Post a reply to a GitHub PR review thread.

Useful for acknowledging feedback — e.g., "Fixed in abc1234" — before or
after marking the thread resolved. Keeps reviewers in the loop.

Usage:
  gh-post-reply <thread_id> <message>
  gh-post-reply <thread_id> --commit          # auto-generate "Fixed in <HEAD>"
  gh-post-reply <thread_id> --commit abc1234  # fixed in specific commit
  gh-post-reply --all --input pr.json --commit   # reply to ALL open threads

Examples:
  gh-post-reply PRRT_kwDOABCDEF1234567 "Fixed in abc1234 — added input validation"
  gh-post-reply PRRT_kwDOABCDEF1234567 --commit
  gh-post-reply --all --input pr.json --commit --dry-run
"""

from __future__ import annotations

import argparse
import json
import subprocess
import sys
from concurrent.futures import ThreadPoolExecutor, as_completed
from typing import Any


# GraphQL: look up the pull request database ID for a review thread,
# then post an issue comment on that PR (review thread replies via REST).
THREAD_PR_QUERY = """\
query($threadId: ID!) {
  node(id: $threadId) {
    ... on PullRequestReviewThread {
      pullRequest {
        number
        headRepository { nameWithOwner }
      }
    }
  }
}
"""

REPLY_MUTATION = """\
mutation($threadId: ID!, $body: String!) {
  addPullRequestReviewThreadReply(input: {pullRequestReviewThreadId: $threadId, body: $body}) {
    comment {
      id
      body
      createdAt
      author { login }
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
        raise RuntimeError(f"Failed to parse JSON: {e}\nRaw:\n{out}") from e


def _head_sha() -> str:
    return _run(["git", "rev-parse", "--short", "HEAD"]).strip()


def post_reply(thread_id: str, body: str) -> dict[str, Any]:
    cmd = [
        "gh", "api", "graphql",
        "-F", "query=@-",
        "-F", f"threadId={thread_id}",
        "-F", f"body={body}",
    ]
    result = _run_json(cmd, stdin=REPLY_MUTATION)
    if "errors" in result and result["errors"]:
        raise RuntimeError(f"GraphQL errors:\n{json.dumps(result['errors'], indent=2)}")
    return result


def reply_to_thread(thread_id: str, body: str, dry_run: bool) -> dict[str, Any]:
    if dry_run:
        return {"thread_id": thread_id, "success": True, "dry_run": True, "body": body}
    try:
        result = post_reply(thread_id, body)
        comment = result["data"]["addPullRequestReviewThreadReply"]["comment"]
        return {"thread_id": thread_id, "success": True, "comment_id": comment["id"]}
    except RuntimeError as e:
        return {"thread_id": thread_id, "success": False, "error": str(e)}


def load_open_thread_ids(path: str) -> list[str]:
    try:
        with open(path) as f:
            data = json.load(f)
    except (OSError, json.JSONDecodeError) as e:
        print(f"Error reading --input file: {e}", file=sys.stderr)
        sys.exit(1)
    return [
        t["id"] for t in data.get("review_threads", [])
        if not t.get("isResolved") and not t.get("isOutdated")
    ]


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Post a reply to a GitHub PR review thread",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog=(
            "Examples:\n"
            '  gh-post-reply PRRT_kwDO... "Fixed in abc1234"\n'
            "  gh-post-reply PRRT_kwDO... --commit\n"
            "  gh-post-reply --all --input pr.json --commit --dry-run\n"
        ),
    )
    group = parser.add_mutually_exclusive_group(required=True)
    group.add_argument("thread_id", nargs="?", metavar="THREAD_ID", help="Single thread to reply to")
    group.add_argument("--all", action="store_true", help="Reply to all open threads from --input FILE")

    parser.add_argument("message", nargs="?", metavar="MESSAGE", help="Reply text (omit when using --commit)")
    parser.add_argument("--commit", nargs="?", const="HEAD", metavar="SHA",
                        help="Auto-generate 'Fixed in <sha>' message (default: HEAD)")
    parser.add_argument("--input", "-i", metavar="FILE", help="JSON from gh-fetch-comments (required with --all)")
    parser.add_argument("--dry-run", action="store_true", help="Show what would be posted without sending")
    parser.add_argument("--workers", type=int, default=4, metavar="N", help="Max concurrent API calls (default: 4)")
    args = parser.parse_args()

    # Resolve message
    if args.commit is not None:
        sha = _head_sha() if args.commit == "HEAD" else args.commit
        base_msg = f"Fixed in {sha}"
        body = f"{base_msg} — {args.message}" if args.message else base_msg
    elif args.message:
        body = args.message
    else:
        parser.error("Provide a MESSAGE or use --commit")

    # Resolve thread IDs
    if args.all:
        if not args.input:
            parser.error("--all requires --input FILE")
        thread_ids = load_open_thread_ids(args.input)
        if not thread_ids:
            print("✓ No open threads found in input file.")
            sys.exit(0)
        print(f"Replying to {len(thread_ids)} open thread(s) with: {body!r}")
    else:
        thread_ids = [args.thread_id]

    if args.dry_run:
        print(f"[dry-run] Would post to {len(thread_ids)} thread(s):")
        for tid in thread_ids:
            print(f"  {tid}")
            print(f"  Message: {body!r}")
        sys.exit(0)

    results: list[dict[str, Any]] = [{}] * len(thread_ids)
    index_map = {tid: i for i, tid in enumerate(thread_ids)}

    with ThreadPoolExecutor(max_workers=min(args.workers, len(thread_ids))) as executor:
        futures = {executor.submit(reply_to_thread, tid, body, args.dry_run): tid for tid in thread_ids}
        for future in as_completed(futures):
            tid = futures[future]
            result = future.result()
            results[index_map[tid]] = result
            if result["success"]:
                print(f"✓ Replied to {tid}")
            else:
                print(f"✗ Failed to reply to {tid}: {result.get('error', '')}", file=sys.stderr)

    success_count = sum(1 for r in results if r["success"])
    print(f"\nPosted {success_count}/{len(results)} replies")
    if success_count < len(results):
        sys.exit(1)


if __name__ == "__main__":
    main()
