#!/usr/bin/env python3
"""
Fetch all PR conversation comments + reviews + review threads (inline threads)
for the PR associated with the current git branch, by shelling out to:

  gh api graphql

Requires:
  - `gh auth login` already set up
  - current branch has an associated (open) PR

Usage:
  gh-fetch-comments --pr 2 -o pr.json
  gh-fetch-comments --pr 2 --since pr_old.json   # show only new comments
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

QUERY = """\
query(
  $owner: String!,
  $repo: String!,
  $number: Int!,
  $commentsCursor: String,
  $reviewsCursor: String,
  $threadsCursor: String
) {
  repository(owner: $owner, name: $repo) {
    pullRequest(number: $number) {
      number
      url
      title
      state

      # Top-level "Conversation" comments (issue comments on the PR)
      comments(first: 100, after: $commentsCursor) {
        pageInfo { hasNextPage endCursor }
        nodes {
          id
          body
          createdAt
          updatedAt
          author { login }
        }
      }

      # Review submissions (Approve / Request changes / Comment), with body if present
      reviews(first: 100, after: $reviewsCursor) {
        pageInfo { hasNextPage endCursor }
        nodes {
          id
          state
          body
          submittedAt
          author { login }
        }
      }

      # Inline review threads (grouped), includes resolved state
      reviewThreads(first: 100, after: $threadsCursor) {
        pageInfo { hasNextPage endCursor }
        nodes {
          id
          isResolved
          isOutdated
          path
          line
          diffSide
          startLine
          startDiffSide
          originalLine
          originalStartLine
          resolvedBy { login }
          comments(first: 100) {
            nodes {
              id
              body
              createdAt
              updatedAt
              author { login }
            }
          }
        }
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
        raise RuntimeError(f"Failed to parse JSON from command output: {e}\nRaw:\n{out}") from e


def _ensure_gh_authenticated() -> None:
    try:
        _run(["gh", "auth", "status"])
    except RuntimeError:
        print("run `gh auth login` to authenticate the GitHub CLI", file=sys.stderr)
        raise RuntimeError("gh auth status failed; run `gh auth login` to authenticate the GitHub CLI") from None


def _check_rate_limit() -> None:
    """Warn if GraphQL rate limit headroom is low (< 20% of 5000 points/hour)."""
    try:
        data = _run_json(["gh", "api", "rate_limit"])
        graphql = data.get("resources", {}).get("graphql", {})
        remaining = graphql.get("remaining", None)
        limit = graphql.get("limit", 5000)
        reset_at = graphql.get("reset", None)
        if remaining is None:
            return
        pct = remaining / limit * 100
        if pct < 20:
            import datetime
            reset_str = ""
            if reset_at:
                reset_dt = datetime.datetime.fromtimestamp(reset_at)
                reset_str = f", resets at {reset_dt.strftime('%H:%M:%S')}"
            print(
                f"⚠️  GitHub GraphQL rate limit low: {remaining}/{limit} points remaining ({pct:.0f}%{reset_str})",
                file=sys.stderr,
            )
    except Exception:
        pass  # Rate limit check is best-effort; don't block on failure


def gh_pr_view_json(fields: str) -> dict[str, Any]:
    return _run_json(["gh", "pr", "view", "--json", fields])


def get_current_pr_ref() -> tuple[str, str, int]:
    pr = gh_pr_view_json("number,headRepositoryOwner,headRepository")
    owner = pr["headRepositoryOwner"]["login"]
    repo = pr["headRepository"]["name"]
    number = int(pr["number"])
    return owner, repo, number


def gh_api_graphql(
    owner: str,
    repo: str,
    number: int,
    comments_cursor: str | None = None,
    reviews_cursor: str | None = None,
    threads_cursor: str | None = None,
) -> dict[str, Any]:
    cmd = [
        "gh", "api", "graphql",
        "-F", "query=@-",
        "-F", f"owner={owner}",
        "-F", f"repo={repo}",
        "-F", f"number={number}",
    ]
    if comments_cursor:
        cmd += ["-F", f"commentsCursor={comments_cursor}"]
    if reviews_cursor:
        cmd += ["-F", f"reviewsCursor={reviews_cursor}"]
    if threads_cursor:
        cmd += ["-F", f"threadsCursor={threads_cursor}"]
    return _run_json(cmd, stdin=QUERY)


def fetch_all(owner: str, repo: str, number: int) -> dict[str, Any]:
    conversation_comments: list[dict[str, Any]] = []
    reviews: list[dict[str, Any]] = []
    review_threads: list[dict[str, Any]] = []

    comments_cursor: str | None = None
    reviews_cursor: str | None = None
    threads_cursor: str | None = None
    pr_meta: dict[str, Any] | None = None

    while True:
        payload = gh_api_graphql(
            owner=owner, repo=repo, number=number,
            comments_cursor=comments_cursor,
            reviews_cursor=reviews_cursor,
            threads_cursor=threads_cursor,
        )

        if "errors" in payload and payload["errors"]:
            raise RuntimeError(f"GitHub GraphQL errors:\n{json.dumps(payload['errors'], indent=2)}")

        pr = payload["data"]["repository"]["pullRequest"]
        if pr_meta is None:
            pr_meta = {
                "number": pr["number"],
                "url": pr["url"],
                "title": pr["title"],
                "state": pr["state"],
                "owner": owner,
                "repo": repo,
            }

        c = pr["comments"]
        r = pr["reviews"]
        t = pr["reviewThreads"]

        conversation_comments.extend(c.get("nodes") or [])
        reviews.extend(r.get("nodes") or [])
        review_threads.extend(t.get("nodes") or [])

        comments_cursor = c["pageInfo"]["endCursor"] if c["pageInfo"]["hasNextPage"] else None
        reviews_cursor = r["pageInfo"]["endCursor"] if r["pageInfo"]["hasNextPage"] else None
        threads_cursor = t["pageInfo"]["endCursor"] if t["pageInfo"]["hasNextPage"] else None

        if not (comments_cursor or reviews_cursor or threads_cursor):
            break

    assert pr_meta is not None

    conversation_comments.sort(key=lambda x: x["createdAt"], reverse=True)
    reviews.sort(key=lambda x: x["submittedAt"] or "", reverse=True)
    review_threads.sort(
        key=lambda x: x["comments"]["nodes"][0]["createdAt"] if x["comments"]["nodes"] else "",
        reverse=True,
    )

    return {
        "pull_request": pr_meta,
        "conversation_comments": conversation_comments,
        "reviews": reviews,
        "review_threads": review_threads,
    }


def _diff_since(current: dict[str, Any], baseline: dict[str, Any]) -> dict[str, Any]:
    """Return only items that are new or changed compared to the baseline snapshot."""
    baseline_comment_ids = {c["id"] for c in baseline.get("conversation_comments", [])}
    baseline_review_ids = {r["id"] for r in baseline.get("reviews", [])}
    baseline_threads = {t["id"]: t for t in baseline.get("review_threads", [])}

    new_comments = [c for c in current["conversation_comments"] if c["id"] not in baseline_comment_ids]
    new_reviews = [r for r in current["reviews"] if r["id"] not in baseline_review_ids]

    # New threads + threads whose resolution state changed
    changed_threads = []
    for thread in current["review_threads"]:
        old = baseline_threads.get(thread["id"])
        if old is None:
            changed_threads.append({**thread, "_change": "new"})
        elif thread.get("isResolved") != old.get("isResolved"):
            changed_threads.append({**thread, "_change": "resolved" if thread.get("isResolved") else "reopened"})
        else:
            # Check for new comments within existing thread
            old_comment_ids = {c["id"] for c in old.get("comments", {}).get("nodes", [])}
            new_thread_comments = [
                c for c in thread.get("comments", {}).get("nodes", [])
                if c["id"] not in old_comment_ids
            ]
            if new_thread_comments:
                changed_threads.append({**thread, "_change": "new_reply", "_new_comments": new_thread_comments})

    return {
        "pull_request": current["pull_request"],
        "diff_since": baseline["pull_request"].get("fetched_at", "previous snapshot"),
        "conversation_comments": new_comments,
        "reviews": new_reviews,
        "review_threads": changed_threads,
    }


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Fetch PR comments via GitHub GraphQL",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog=(
            "Examples:\n"
            "  gh-fetch-comments --pr 2 -o pr.json\n"
            "  gh-fetch-comments --pr 2 --since pr_old.json   # show only new/changed items\n"
        ),
    )
    parser.add_argument("--pr", type=int, metavar="NUMBER", help="PR number (default: auto-detect from current branch)")
    parser.add_argument("--repo", metavar="OWNER/REPO", help="Repository (default: auto-detect from gh)")
    parser.add_argument("--output", "-o", metavar="FILE", help="Save full output to FILE instead of stdout")
    parser.add_argument("--since", metavar="FILE", help="Compare against a previous snapshot; output only new/changed items")
    parser.add_argument("--no-beads", action="store_true", help="Skip automatic bead creation after saving")
    args = parser.parse_args()

    _ensure_gh_authenticated()
    _check_rate_limit()

    if args.pr and args.repo:
        repo_parts = args.repo.split("/", 1)
        if len(repo_parts) != 2:
            print("--repo must be in OWNER/REPO format", file=sys.stderr)
            sys.exit(1)
        owner, repo, number = repo_parts[0], repo_parts[1], args.pr
    elif args.pr:
        remote = _run(["gh", "repo", "view", "--json", "owner,name"]).strip()
        remote_data = json.loads(remote)
        owner = remote_data["owner"]["login"]
        repo = remote_data["name"]
        number = args.pr
    else:
        owner, repo, number = get_current_pr_ref()

    result = fetch_all(owner, repo, number)

    if args.output:
        with open(args.output, "w") as f:
            json.dump(result, f, indent=2)
        print(f"Saved PR #{number} comments to {args.output}", file=sys.stderr)
        # Update completion cache with latest thread IDs
        cache_dir = os.path.expanduser("~/.cache/gh-comments")
        os.makedirs(cache_dir, exist_ok=True)
        with open(os.path.join(cache_dir, "threads.json"), "w") as f:
            json.dump(result, f)
        # Auto-create beads for open threads (skip silently if bd not ready)
        if not args.no_beads and check_bd_ready(fatal=False):
            open_count = sum(
                1 for t in result.get("review_threads", [])
                if not t.get("isResolved") and not t.get("isOutdated")
            )
            if open_count:
                print(f"Creating beads for {open_count} open thread(s)...", file=sys.stderr)
                subprocess.run([
                    sys.executable,
                    str(Path(__file__).parent / "create_beads.py"),
                    "--input", args.output,
                ], check=False)

    if args.since:
        try:
            with open(args.since) as f:
                baseline = json.load(f)
        except (OSError, json.JSONDecodeError) as e:
            print(f"Error reading --since file: {e}", file=sys.stderr)
            sys.exit(1)
        diff = _diff_since(result, baseline)
        n_new = len(diff["conversation_comments"]) + len(diff["review_threads"]) + len(diff["reviews"])
        if n_new == 0:
            print("No new or changed items since last snapshot.", file=sys.stderr)
        else:
            print(json.dumps(diff, indent=2))
    elif not args.output:
        print(json.dumps(result, indent=2))


if __name__ == "__main__":
    main()
