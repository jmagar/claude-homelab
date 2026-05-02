# Resolution Workflow Reference

This document explains the enhanced PR comment resolution workflow in detail.

## Overview

The gh-address-comments skill now enforces complete resolution of all GitHub PR review threads using a systematic workflow:

1. **Fetch** - Pull all PR comments and threads via GraphQL
2. **Track** - Create task checklist for accountability
3. **Fix** - Apply code changes with commit linking
4. **Resolve** - Mark threads as resolved via API
5. **Verify** - Block completion if any threads remain unresolved

## Thread States

GitHub review threads can be in several states:

| State | Description | Considered Addressed? |
|-------|-------------|-----------------------|
| **Resolved** | Explicitly marked as resolved | ✓ Yes |
| **Outdated** | Code changed since comment | ✓ Yes |
| **Unresolved** | Active, needs attention | ✗ No |

## Workflow Phases

### Phase 1: Fetch Comments

**Script:** `gh-fetch-comments`

**Purpose:** Pull all PR data including conversation comments, reviews, and review threads.

**Output Structure:**
```json
{
  "pull_request": {
    "number": 123,
    "url": "https://github.com/...",
    "title": "Add feature X",
    "state": "OPEN",
    "owner": "org",
    "repo": "project"
  },
  "conversation_comments": [...],
  "reviews": [...],
  "review_threads": [
    {
      "id": "PRRT_kwDOABCDEF1234567",
      "isResolved": false,
      "isOutdated": false,
      "path": "src/api/users.ts",
      "line": 45,
      "comments": {
        "nodes": [
          {
            "id": "PRRTC_kwDOABCDEF7654321",
            "body": "Add input validation here",
            "author": { "login": "reviewer" },
            "createdAt": "2024-01-15T10:30:00Z"
          }
        ]
      }
    }
  ]
}
```

### Phase 2: Create Tracking Checklist

**Tool:** TaskCreate (Claude Code)

**Purpose:** Create accountability by tracking each thread as a separate task.

**Task Template:**
```
Subject: Address comment #1: src/api/users.ts:45
Description:
  Author: @reviewer
  Comment: Add input validation here
  Action: Implement Zod schema validation for email field

Metadata:
  {
    "thread_id": "PRRT_kwDOABCDEF1234567",
    "file": "src/api/users.ts",
    "line": 45
  }
```

**Benefits:**
- Visual progress tracking
- Prevents forgotten threads
- Parallel work across multiple threads
- Audit trail of what was addressed

### Phase 3: Apply Fixes with Linking

**Purpose:** Make code changes and link commits to specific review threads.

**Commit Message Format:**
```
fix: address PR comment #1 - add email validation

Resolves review thread PRRT_kwDOABCDEF1234567
- Added Zod schema validation for email field
- Added error handling for invalid formats

Co-authored-by: @reviewer
```

**Key Elements:**
- First line references comment number
- "Resolves review thread" links to GitHub thread ID
- Bullet points explain the changes
- Co-authored-by credits the reviewer

**Why Link Commits?**
- Traceability: Know which commit addressed which comment
- Audit: Easy to verify all comments have corresponding fixes
- Collaboration: Proper credit to reviewers
- History: Future developers understand context

### Phase 4: Mark Threads Resolved

**Script:** `scripts/mark_resolved.py`

**Purpose:** Explicitly mark review threads as resolved via GitHub GraphQL API.

**Usage:**
```bash
python scripts/mark_resolved.py PRRT_kwDOABCDEF1234567 PRRT_kwDOABCDEF7654321
```

**GraphQL Mutation:**
```graphql
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
```

**Output:**
```
✓ Resolved thread PRRT_kwDOABCDEF1234567 (by your-username)
✓ Resolved thread PRRT_kwDOABCDEF7654321 (by your-username)

Resolved 2/2 threads
```

**When to Mark Resolved:**
- After committing the fix
- After verifying tests pass
- Before pushing to remote

### Phase 5: Verify Complete Resolution

**Script:** `scripts/verify_resolution.py`

**Purpose:** Block PR completion if any threads remain unresolved.

**Usage:**
```bash
python scripts/fetch_comments.py | python scripts/verify_resolution.py
```

**Success Output (Exit 0):**
```
Verifying PR #123: Add feature X
================================================================================

✓ 5 thread(s) resolved or outdated

================================================================================
✓ All review threads have been addressed!
  You may proceed with completing the PR review.
```

**Failure Output (Exit 1):**
```
Verifying PR #123: Add feature X
================================================================================

✓ 3 thread(s) resolved or outdated

✗ 2 UNRESOLVED thread(s):
  1. src/api/auth.ts:128 (@reviewer): Extract this logic into helper...
     Thread ID: PRRT_kwDOABCDEF9999999

  2. src/utils/validation.ts:56 (@reviewer): Add test coverage for edge case...
     Thread ID: PRRT_kwDOABCDEF8888888

================================================================================
BLOCKED: Address all unresolved threads before completing PR review.

To mark threads as resolved, use:
  python scripts/mark_resolved.py <thread_id_1> [thread_id_2] ...
```

**Blocking Behavior:**
- Exit code 1 stops automation
- Lists all unresolved threads with details
- Provides thread IDs for resolution
- Forces explicit user acknowledgment if threads are deferred

## Best Practices

### Commit Strategy

**Good:**
```bash
# One commit per logical fix, clearly linked
git commit -m "fix: address PR comment #1 - add email validation

Resolves review thread PRRT_kwDOABCDEF1234567
- Added Zod schema validation
- Added error messages"
```

**Bad:**
```bash
# Vague, no linking
git commit -m "fixed stuff"

# Multiple unrelated fixes in one commit
git commit -m "addressed all PR comments"
```

### Task Management

**Good:**
- Create tasks before starting work
- Update to `in_progress` when starting
- Update to `completed` when done
- Use TaskList to check remaining work

**Bad:**
- Skip task creation
- Leave tasks stale
- Mark as completed before actually resolving

### Deferring Threads

Sometimes threads can't be addressed immediately. In these cases:

1. **Get explicit user approval:**
   ```
   Thread #5 requires backend changes beyond this PR scope.
   Do you want to defer this to a follow-up PR? [Y/n]
   ```

2. **Create follow-up task:**
   ```
   Subject: [DEFERRED] Address PR #123 comment #5
   Description: Backend changes for auth validation
   ```

3. **Document in PR:**
   Add comment to the thread explaining deferral:
   ```
   This will be addressed in a follow-up PR focusing on backend validation.
   Tracking in issue #456.
   ```

## Troubleshooting

### "Command failed: gh api graphql"

**Cause:** Authentication or permission issues

**Solution:**
```bash
gh auth login
gh auth refresh -s repo -s workflow
```

### "Failed to resolve thread: Not Found"

**Cause:** Thread ID is incorrect or thread was deleted

**Solution:**
1. Re-fetch comments to get current thread IDs
2. Verify thread still exists in GitHub UI
3. Check you have write permissions on the PR

### "Verification blocked on outdated threads"

**Cause:** Code changed but thread is still showing as active

**Solution:**
- Outdated threads are automatically considered resolved
- If verification still fails, re-run `fetch_comments.py` to refresh state
- The thread may have been un-outdated if new changes touched the same lines

## Integration with Existing Workflows

This skill integrates with:

- **quick-push:** Commit messages already follow linking format
- **save-to-md:** Session logs capture which threads were addressed
- **comprehensive-review:full-review:** Pre-PR review can catch issues before human review
- **superpowers:finishing-a-development-branch:** Verification runs before declaring work complete

## Future Enhancements

Potential improvements for consideration:

1. **Auto-resolution after commit:** Detect thread IDs in commit messages and auto-resolve
2. **Conversation comment tracking:** Extend verification to non-threaded comments
3. **Stale thread detection:** Warn about threads older than N days
4. **Batch operations:** Resolve all threads in a file/directory at once
5. **GitHub Actions integration:** Auto-verify on push via CI
