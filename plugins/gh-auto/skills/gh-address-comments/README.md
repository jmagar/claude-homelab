# GitHub PR Comment Handler with Resolution Tracking

Systematically address review comments on GitHub pull requests using the GitHub CLI (`gh`) with mandatory resolution verification to ensure nothing slips through the cracks.

## What It Does

- **Fetches** all comments and review threads from the current branch's open PR
- **Tracks** each comment as a task for accountability
- **Links** commits to specific review threads for traceability
- **Resolves** threads explicitly via GitHub GraphQL API
- **Verifies** complete resolution before allowing PR completion (blocks if unresolved)
- Integrates with GitHub CLI for seamless authentication

All operations use the `gh` CLI tool for GitHub API access.

## Setup

### Prerequisites

1. **GitHub CLI installed:**
   ```bash
   # Check if gh is installed
   gh --version

   # Install if needed (Ubuntu/Debian)
   sudo apt install gh

   # Or download from https://cli.github.com/
   ```

2. **Authenticate with GitHub:**
   ```bash
   # First time only
   gh auth login

   # Verify authentication and scopes
   gh auth status
   ```

### Required Permissions

The `gh` CLI needs these scopes:
- `repo` - Full control of private repositories
- `workflow` - Update GitHub Action workflows

If authentication fails during usage, re-run:
```bash
gh auth login --scopes repo,workflow
```

## Usage Examples

### Basic Workflow

1. **Ensure you're on the PR branch:**
   ```bash
   git branch --show-current
   ```

2. **Invoke the skill:**
   Ask Claude: "Address the PR comments" or "Fix review feedback"

3. **Claude will:**
   - Run `scripts/fetch_comments.py` to get all comments
   - Number and summarize each review thread
   - Ask which comments you want to address
   - Apply fixes for selected items

### Example Interaction

```
User: "Address the PR comments"

Claude:
- Runs fetch_comments.py and saves output
- Creates task checklist for tracking
- Shows numbered list of review threads:

  1. src/api.py:42 (@alice): Use async/await instead of callbacks
     Thread ID: PRRT_kwDOABCDEF1234567
     Status: Unresolved

  2. README.md:15 (@bob): Fix typo "teh" → "the"
     Thread ID: PRRT_kwDOABCDEF2345678
     Status: Unresolved

  3. src/api.py:89 (@alice): Add error handling for network failures
     Thread ID: PRRT_kwDOABCDEF3456789
     Status: Unresolved

Claude: "Which comments would you like me to address? (e.g., 1,3)"

User: "1 and 3"

Claude:
- Applies fixes for comments 1 and 3
- Commits with proper thread linking:
  "fix: address PR comment #1 - use async/await

  Resolves review thread PRRT_kwDOABCDEF1234567
  - Refactored callbacks to async/await
  - Added error handling

  Co-authored-by: @alice"

- Marks threads as resolved via GitHub API
- Runs verification check
- Reports: "✓ All selected threads resolved and verified"
```

## How It Works

1. **Fetch Comments** - `scripts/fetch_comments.py` uses `gh api` GraphQL to get all PR data
2. **Create Checklist** - Claude creates tasks for each review thread using TaskCreate
3. **Present Summary** - Claude numbers and summarizes each review thread with thread IDs
4. **User Selection** - You choose which comments to address
5. **Apply Fixes** - Claude implements changes with commits linked to thread IDs
6. **Mark Resolved** - `scripts/mark_resolved.py` explicitly marks threads as resolved
7. **Verify Completion** - `scripts/verify_resolution.py` blocks if any threads remain unresolved (MANDATORY)

## Resolution Tracking Features

### Task Checklist
Each review thread becomes a tracked task:
- **Subject**: `Address comment #N: file.ts:line`
- **Status**: `pending` → `in_progress` → `completed`
- **Metadata**: Stores thread ID, file path, line number

### Commit Linking
Every commit references the thread it addresses:
```
fix: address PR comment #1 - add validation

Resolves review thread PRRT_kwDOABCDEF1234567
- Added Zod schema for email validation
- Added error messages

Co-authored-by: @reviewer
```

### Explicit Resolution
`scripts/mark_resolved.py` marks threads as resolved via GitHub GraphQL:
- Updates thread state to "resolved"
- Records who resolved it
- Visible in GitHub UI immediately

### Mandatory Verification
`scripts/verify_resolution.py` blocks completion if unresolved threads exist:
- **Exit 0**: All threads resolved → safe to proceed
- **Exit 1**: Unresolved threads found → BLOCKED
- Lists unresolved threads with IDs for easy resolution
- Prevents incomplete PR reviews from being closed

**IMPORTANT**: The verification step is mandatory. Do not skip it.

## Troubleshooting

### "gh: command not found"

Install GitHub CLI:
```bash
# Ubuntu/Debian
sudo apt install gh

# macOS
brew install gh

# Or download from https://cli.github.com/
```

### "gh auth status" fails

Re-authenticate with proper scopes:
```bash
gh auth login --scopes repo,workflow
gh auth status
```

### "No pull request found for current branch"

Ensure:
1. You're on a branch (not `main`)
2. The branch has an open PR
3. You're in a git repository

Check with:
```bash
git branch --show-current
gh pr status
```

### Rate limiting errors

Wait a few minutes or authenticate to increase rate limits:
```bash
gh auth login
```

## Notes

- Requires active internet connection for GitHub API
- Works with both public and private repositories
- Respects GitHub API rate limits
- Uses elevated network access for `gh` commands
- Verification step is mandatory and cannot be bypassed
- Thread resolution is persistent in GitHub
- Outdated threads (code changed) are automatically considered resolved

## Scripts Reference

| Script | Purpose | Exit Codes |
|--------|---------|------------|
| `fetch_comments.py` | Fetch all PR data via GraphQL | 0=success, 1=error |
| `mark_resolved.py` | Mark threads as resolved | 0=all resolved, 1=some failed |
| `verify_resolution.py` | Block if unresolved threads exist | 0=all resolved, 1=unresolved found |

## Reference Files

- `references/resolution-workflow.md` - Detailed workflow documentation
- `references/quick-reference.md` - Quick command reference
- `references/api-endpoints.md` - GitHub API endpoint documentation
- `references/troubleshooting.md` - Common issues and solutions

## External Resources

- **GitHub CLI Docs:** https://cli.github.com/manual/
- **GitHub GraphQL API:** https://docs.github.com/en/graphql
- **PR Review API:** https://docs.github.com/en/rest/pulls/reviews

---

**Version:** 2.0.0
**Type:** Read-Write (Resolution Tracking)
**Dependencies:** GitHub CLI (`gh`), Python 3.12+
**Breaking Changes from v1.x:**
- Added mandatory verification step
- Requires explicit thread resolution
- Task tracking integrated
