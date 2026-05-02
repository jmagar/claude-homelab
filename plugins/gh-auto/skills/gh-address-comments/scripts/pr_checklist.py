#!/usr/bin/env python3
"""
Pre-merge gate: comprehensive checklist before merging a PR.

Checks CI, approvals, thread resolution, merge conflicts, branch staleness,
and draft status. Produces a pass/fail report with specific next-step commands
for each failure.

Usage:
  gh-pr-checklist --pr 2
  gh-pr-checklist --pr 2 --input pr.json   # use cached thread data
  gh-pr-checklist --pr 2 --require-approvals 2
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


# ── Individual checks ────────────────────────────────────────────────────────

def check_not_draft(pr: dict[str, Any]) -> tuple[bool, str, str]:
    if pr.get("isDraft"):
        return False, "PR is a draft", "Mark PR as ready: gh pr ready"
    return True, "Not a draft", ""


def check_ci(owner: str, repo: str, pr_number: int) -> tuple[bool, str, str]:
    try:
        checks = _run_json(["gh", "pr", "checks", str(pr_number), "--repo", f"{owner}/{repo}",
                             "--json", "name,state,bucket"])
        if not checks:
            return True, "No CI checks configured", ""
        failed = [c for c in checks if c.get("bucket") == "fail"]
        pending = [c for c in checks if c.get("bucket") == "pending"]
        passed = sum(1 for c in checks if c.get("bucket") == "pass")
        if failed:
            names = ", ".join(c["name"] for c in failed[:3])
            fix = f"View details: gh pr checks {pr_number}"
            return False, f"{len(failed)} failed: {names}", fix
        if pending:
            fix = f"Wait or re-run: gh pr checks {pr_number}"
            return False, f"{len(pending)} still pending, {passed} passed", fix
        return True, f"All {passed} CI checks passed", ""
    except Exception as e:
        return False, f"Could not fetch CI status: {e}", "gh pr checks"


def check_approvals(reviews: list[dict[str, Any]], required: int) -> tuple[bool, str, str]:
    approved = [r for r in reviews if r.get("state") == "APPROVED"]
    changes = [r for r in reviews if r.get("state") == "CHANGES_REQUESTED"]
    if changes:
        names = ", ".join(r["author"]["login"] for r in changes if r.get("author"))
        return False, f"Changes requested by: {names}", "Address feedback and re-request review"
    if len(approved) < required:
        have = len(approved)
        fix = "Request review: gh pr edit --add-reviewer <username>"
        return False, f"{have}/{required} required approvals", fix
    names = ", ".join(r["author"]["login"] for r in approved if r.get("author"))
    return True, f"{len(approved)} approval(s): {names}", ""


def check_threads(input_file: str | None, pr_number: int, owner: str, repo: str) -> tuple[bool, str, str]:
    try:
        if input_file:
            with open(input_file) as f:
                data = json.load(f)
        else:
            out = subprocess.run(
                [sys.executable, __file__.replace("pr_checklist.py", "fetch_comments.py"),
                 "--pr", str(pr_number), "--repo", f"{owner}/{repo}"],
                capture_output=True, text=True,
            )
            data = json.loads(out.stdout)
        threads = data.get("review_threads", [])
        open_threads = [t for t in threads if not t.get("isResolved") and not t.get("isOutdated")]
        if open_threads:
            fix = f"gh-verify-resolution --input <file>  or  gh-mark-resolved --all --input <file>"
            return False, f"{len(open_threads)} unresolved thread(s) of {len(threads)} total", fix
        return True, f"All {len(threads)} threads resolved", ""
    except Exception as e:
        return False, f"Could not check threads: {e}", "gh-fetch-comments --pr <N> -o pr.json"


def check_merge_state(mergeable: str, merge_state: str, base: str, head: str) -> tuple[bool, str, str]:
    if mergeable == "CONFLICTING":
        fix = f"Resolve conflicts: git fetch origin && git rebase origin/{base}"
        return False, "Merge conflicts with base branch", fix
    if mergeable == "UNKNOWN":
        return False, "GitHub still computing merge status — try again in a moment", ""
    if merge_state == "BEHIND":
        fix = f"Update branch: git fetch origin && git merge origin/{base}  or  gh pr update-branch"
        return False, f"Branch is behind {base}", fix
    if merge_state == "BLOCKED":
        return False, "Merge blocked by branch protection rules", "Check branch protection settings"
    if merge_state == "DIRTY":
        return False, "Branch has merge conflicts", f"git rebase origin/{base}"
    return True, "Clean merge — no conflicts", ""


# ── Main ─────────────────────────────────────────────────────────────────────

def main() -> None:
    parser = argparse.ArgumentParser(
        description="Pre-merge gate: comprehensive checklist for a pull request",
    )
    parser.add_argument("--pr", type=int, metavar="NUMBER", help="PR number (default: auto-detect)")
    parser.add_argument("--repo", metavar="OWNER/REPO", help="Repository (default: auto-detect)")
    parser.add_argument("--input", "-i", metavar="FILE", help="Cached thread JSON from gh-fetch-comments")
    parser.add_argument("--require-approvals", type=int, default=1, metavar="N",
                        help="Minimum approvals required (default: 1)")
    args = parser.parse_args()

    # Resolve repo
    if args.repo:
        parts = args.repo.split("/", 1)
        owner, repo = parts[0], parts[1]
    else:
        remote = _run_json(["gh", "repo", "view", "--json", "owner,name"])
        owner = remote["owner"]["login"]
        repo = remote["name"]

    # Fetch PR metadata
    pr_args = ["gh", "pr", "view", "--repo", f"{owner}/{repo}",
               "--json", "number,title,url,state,mergeable,mergeStateStatus,isDraft,baseRefName,headRefName,reviews"]
    if args.pr:
        pr_args += [str(args.pr)]

    try:
        pr = _run_json(pr_args)
    except Exception as e:
        print(f"Error fetching PR: {e}", file=sys.stderr)
        sys.exit(1)

    number = pr["number"]
    print(f"Pre-merge checklist for PR #{number}: {pr['title']}")
    print(f"URL: {pr['url']}")
    print("=" * 70)
    print()

    # Run all checks
    results: list[tuple[str, bool, str, str]] = []

    ok, msg, fix = check_not_draft(pr)
    results.append(("Draft status", ok, msg, fix))

    ok, msg, fix = check_ci(owner, repo, number)
    results.append(("CI checks", ok, msg, fix))

    ok, msg, fix = check_approvals(pr.get("reviews", []), args.require_approvals)
    results.append(("Approvals", ok, msg, fix))

    ok, msg, fix = check_threads(args.input, number, owner, repo)
    results.append(("Review threads", ok, msg, fix))

    ok, msg, fix = check_merge_state(
        pr.get("mergeable", ""),
        pr.get("mergeStateStatus", ""),
        pr.get("baseRefName", "main"),
        pr.get("headRefName", ""),
    )
    results.append(("Merge status", ok, msg, fix))

    # Display
    width = max(len(label) for label, _, _, _ in results) + 2
    for label, ok, msg, _ in results:
        print(f"  {_icon(ok)}  {label:<{width}} {msg}")

    failures = [(label, fix) for label, ok, _, fix in results if not ok]

    print()
    print("─" * 70)

    if not failures:
        print("✓  ALL CHECKS PASSED — ready to merge")
        print(f"\n   gh pr merge {number} --squash --delete-branch")
    else:
        print(f"✗  NOT READY — {len(failures)} issue(s) to resolve:\n")
        for i, (label, fix) in enumerate(failures, 1):
            print(f"  {i}. {label}")
            if fix:
                print(f"     → {fix}")
        sys.exit(1)


if __name__ == "__main__":
    main()
