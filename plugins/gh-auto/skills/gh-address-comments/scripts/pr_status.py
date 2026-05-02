#!/usr/bin/env python3
"""
Quick merge-readiness dashboard for a pull request.

Combines CI status, review approvals, thread resolution, merge conflicts,
and branch staleness into one pass/fail summary.

Usage:
  gh-pr-status --pr 2
  gh-pr-status              # auto-detect from current branch
  gh-pr-status --pr 2 --input pr.json   # use cached thread data
"""

from __future__ import annotations

import argparse
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


def _icon(ok: bool) -> str:
    return "✓" if ok else "✗"


def check_ci(owner: str, repo: str, pr_number: int) -> tuple[bool, str]:
    try:
        checks = _run_json(["gh", "pr", "checks", str(pr_number), "--repo", f"{owner}/{repo}",
                             "--json", "name,state,bucket"])
        if not checks:
            return True, "No CI checks configured"
        passed = sum(1 for c in checks if c.get("bucket") == "pass")
        failed = sum(1 for c in checks if c.get("bucket") == "fail")
        pending = sum(1 for c in checks if c.get("bucket") == "pending")
        total = len(checks)
        if failed:
            names = ", ".join(c["name"] for c in checks if c.get("bucket") == "fail")
            return False, f"{failed}/{total} failed: {names}"
        if pending:
            return False, f"{pending}/{total} pending, {passed} passed"
        return True, f"All {passed} passed"
    except Exception as e:
        return False, f"Could not fetch: {e}"


def check_reviews(reviews: list[dict[str, Any]]) -> tuple[bool, str]:
    approvals = [r for r in reviews if r.get("state") == "APPROVED"]
    changes = [r for r in reviews if r.get("state") == "CHANGES_REQUESTED"]
    if changes:
        names = ", ".join(r["author"]["login"] for r in changes if r.get("author"))
        return False, f"{len(changes)} changes requested by {names}"
    if not approvals:
        return False, "No approvals yet"
    names = ", ".join(r["author"]["login"] for r in approvals if r.get("author"))
    return True, f"{len(approvals)} approved by {names}"


def check_threads(input_file: str | None, pr_number: int, owner: str, repo: str) -> tuple[bool, str]:
    try:
        if input_file:
            with open(input_file) as f:
                data = json.load(f)
        else:
            # Live fetch (quiet)
            out = subprocess.run(
                [sys.executable,
                 __file__.replace("pr_status.py", "fetch_comments.py"),
                 "--pr", str(pr_number), "--repo", f"{owner}/{repo}"],
                capture_output=True, text=True,
            )
            data = json.loads(out.stdout)
        threads = data.get("review_threads", [])
        open_threads = [t for t in threads if not t.get("isResolved") and not t.get("isOutdated")]
        total = len(threads)
        if open_threads:
            return False, f"{len(open_threads)}/{total} threads unresolved"
        return True, f"All {total} threads resolved"
    except Exception as e:
        return False, f"Could not check threads: {e}"


def check_merge(mergeable: str, merge_state: str) -> tuple[bool, str]:
    if mergeable == "CONFLICTING":
        return False, "Merge conflicts detected"
    if mergeable == "UNKNOWN":
        return False, "Merge status unknown (GitHub still computing)"
    if merge_state == "BLOCKED":
        return False, "Merge blocked (branch protection rules)"
    if merge_state == "BEHIND":
        return False, "Branch is behind base — needs rebase/merge"
    return True, "No conflicts"


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Quick merge-readiness dashboard for a pull request",
    )
    parser.add_argument("--pr", type=int, metavar="NUMBER", help="PR number (default: auto-detect)")
    parser.add_argument("--repo", metavar="OWNER/REPO", help="Repository (default: auto-detect)")
    parser.add_argument("--input", "-i", metavar="FILE", help="Cached thread JSON from gh-fetch-comments")
    args = parser.parse_args()

    # Resolve repo
    if args.repo:
        parts = args.repo.split("/", 1)
        owner, repo = parts[0], parts[1]
    else:
        remote = json.loads(_run(["gh", "repo", "view", "--json", "owner,name"]))
        owner = remote["owner"]["login"]
        repo = remote["name"]

    # Resolve PR number and metadata
    pr_args = ["gh", "pr", "view", "--repo", f"{owner}/{repo}",
               "--json", "number,title,url,state,mergeable,mergeStateStatus,isDraft,baseRefName,headRefName,reviews"]
    if args.pr:
        pr_args += [str(args.pr)]
    pr = _run_json(pr_args)
    number = pr["number"]

    print(f"PR #{number}: {pr['title']}")
    print(f"URL:  {pr['url']}")
    if pr.get("isDraft"):
        print("⚠️  DRAFT PR")
    print("=" * 70)

    checks: list[tuple[str, bool, str]] = []

    ci_ok, ci_msg = check_ci(owner, repo, number)
    checks.append(("CI checks", ci_ok, ci_msg))

    rev_ok, rev_msg = check_reviews(pr.get("reviews", []))
    checks.append(("Approvals", rev_ok, rev_msg))

    th_ok, th_msg = check_threads(args.input, number, owner, repo)
    checks.append(("Threads", th_ok, th_msg))

    merge_ok, merge_msg = check_merge(pr.get("mergeable", ""), pr.get("mergeStateStatus", ""))
    checks.append(("Merge status", merge_ok, merge_msg))

    print()
    width = max(len(label) for label, _, _ in checks) + 2
    for label, ok, msg in checks:
        print(f"  {_icon(ok)}  {label:<{width}} {msg}")

    failures = [label for label, ok, _ in checks if not ok]
    print()
    print("─" * 70)
    if failures:
        print(f"✗  NOT READY — {len(failures)} issue(s): {', '.join(failures)}")
        sys.exit(1)
    else:
        print("✓  READY TO MERGE")


if __name__ == "__main__":
    main()
