# GitHub PR Comments - Quick Reference

Common commands and patterns for addressing PR comments.

## Quick Commands

### Check PR Status

```bash
# View current branch's PR
gh pr view

# Show PR status
gh pr status

# Get PR number
gh pr view --json number --jq '.number'
```

---

### View Comments

```bash
# View all comments in PR
gh pr view --comments

# View PR diff
gh pr diff

# View specific file diff
gh pr diff -- src/api.py
```

---

### Fetch Comments (Script)

```bash
# Fetch all PR comments and threads
python3 scripts/fetch_comments.py

# Save to file for verification
python3 scripts/fetch_comments.py > /tmp/pr_comments.json
```

---

### Mark Threads Resolved

```bash
# Mark specific review threads as resolved
python3 scripts/mark_resolved.py PRRT_kwDOABCDEF1234567 PRRT_kwDOABCDEF7654321

# Output:
# ✓ Resolved thread PRRT_kwDOABCDEF1234567 (by your-username)
# ✓ Resolved thread PRRT_kwDOABCDEF7654321 (by your-username)
# Resolved 2/2 threads
```

---

### Verify Resolution

```bash
# Verify all threads are resolved (blocks if unresolved)
python3 scripts/fetch_comments.py | python3 scripts/verify_resolution.py

# Exit 0: All resolved ✓
# Exit 1: Unresolved threads found (BLOCKED)
```

---

## Common Workflows

### Address Review Feedback (Enhanced with Resolution Tracking)

1. **Fetch comments and save:**
   ```bash
   python3 scripts/fetch_comments.py > /tmp/pr_comments.json
   ```

2. **Create task checklist** (using TaskCreate in Claude Code)
   - Parse threads and create tasks
   - Track progress visibly

3. **Select comments to address:**
   - Review numbered list
   - Choose which to fix in this session

4. **Apply fixes with proper linking:**
   ```bash
   # Make code changes

   # Commit with thread reference
   git add src/api/users.ts
   git commit -m "fix: address PR comment #1 - add email validation

   Resolves review thread PRRT_kwDOABCDEF1234567
   - Added Zod schema validation for email field
   - Added error handling for invalid formats

   Co-authored-by: @reviewer"
   ```

5. **Mark threads as resolved:**
   ```bash
   python3 scripts/mark_resolved.py PRRT_kwDOABCDEF1234567
   ```

6. **Verify complete resolution (MANDATORY):**
   ```bash
   python3 scripts/fetch_comments.py | python3 scripts/verify_resolution.py
   ```

7. **Push changes:**
   ```bash
   git push
   ```

---

### Approve After Fixes

```bash
# After addressing all comments
gh pr review --approve --body "All issues addressed, LGTM!"
```

---

### Request More Changes

```bash
gh pr review --request-changes --body "Please also update the tests"
```

---

## Comment Patterns

### Line-Specific Comments

Review comments have these fields:
- `path` - File path
- `line` - Line number
- `body` - Comment text
- `user.login` - Reviewer username

**Example:**
```
File: src/api.py
Line: 42
User: alice
Comment: "Use async/await instead of callbacks for better readability"
```

---

### General Comments

Issue comments (not line-specific):
- `body` - Comment text
- `user.login` - Commenter username

**Example:**
```
User: bob
Comment: "Great work! Just a few minor suggestions below."
```

---

## Authentication Quick Check

```bash
# Check if authenticated
gh auth status

# If not, login
gh auth login --scopes repo,workflow

# Verify scopes
gh auth status
```

---

## Parsing Comments (Python Example)

```python
import subprocess
import json

# Get PR number
pr_info = subprocess.run(
    ["gh", "pr", "view", "--json", "number"],
    capture_output=True,
    text=True,
    check=True
)
pr_number = json.loads(pr_info.stdout)["number"]

# Get repository info
repo_info = subprocess.run(
    ["gh", "repo", "view", "--json", "owner,name"],
    capture_output=True,
    text=True,
    check=True
)
repo = json.loads(repo_info.stdout)
owner = repo["owner"]["login"]
name = repo["name"]

# Fetch review comments
comments = subprocess.run(
    ["gh", "api", f"repos/{owner}/{name}/pulls/{pr_number}/comments"],
    capture_output=True,
    text=True,
    check=True
)
review_comments = json.loads(comments.stdout)

# Print numbered list
for i, comment in enumerate(review_comments, 1):
    user = comment["user"]["login"]
    path = comment["path"]
    line = comment.get("line", "N/A")
    body = comment["body"].split('\n')[0]  # First line only
    print(f"{i}. [{user}] Line {line} in {path}: {body}")
```

---

## Error Recovery

### PR Not Found

```bash
# Check if you're on a branch with PR
git branch --show-current

# Check PR status
gh pr status

# Create PR if needed
gh pr create
```

---

### Auth Issues

```bash
# Re-authenticate
gh auth login --scopes repo,workflow

# Force refresh token
gh auth refresh
```

---

### Rate Limiting

```bash
# Check rate limit status
gh api rate_limit

# Wait if limit exceeded, or:
# - Authenticate for higher limits
# - Cache API responses
```

---

## Bash Shortcuts

### Get PR URL

```bash
gh pr view --json url --jq '.url'
```

---

### Get Comment Count

```bash
gh pr view --json comments --jq '.comments | length'
```

---

### Get PR Author

```bash
gh pr view --json author --jq '.author.login'
```

---

### Check PR State

```bash
gh pr view --json state --jq '.state'
```

---

## Complete Example Workflow (Enhanced)

```bash
#!/bin/bash
set -euo pipefail

echo "=== Addressing PR Comments with Resolution Tracking ==="

# 1. Check authentication
if ! gh auth status &>/dev/null; then
    echo "Not authenticated. Please run: gh auth login"
    exit 1
fi

# 2. Fetch PR info
echo "Fetching PR information..."
PR_NUM=$(gh pr view --json number --jq '.number')
PR_TITLE=$(gh pr view --json title --jq '.title')
echo "PR #$PR_NUM: $PR_TITLE"

# 3. Fetch and save comments
echo -e "\nFetching comments..."
COMMENTS_FILE="/tmp/pr_${PR_NUM}_comments.json"
python3 scripts/fetch_comments.py > "$COMMENTS_FILE"

# 4. Display threads
cat "$COMMENTS_FILE" | jq -r '.review_threads[] | select(.isResolved == false) |
    "\(.id)\t\(.path):\(.line)\t\(.comments.nodes[0].author.login)\t\(.comments.nodes[0].body[:80])"' |
    nl -w2 -s'. '

# 5. User selects comments to address
read -p "Which comment numbers to address? (e.g., 1,3,5): " SELECTED

# 6. Extract thread IDs for selected comments
THREAD_IDS=()
for num in ${SELECTED//,/ }; do
    THREAD_ID=$(cat "$COMMENTS_FILE" | jq -r ".review_threads[$((num-1))].id")
    THREAD_IDS+=("$THREAD_ID")
done

# 7. Apply fixes (manual or automated)
echo "Applying fixes for selected comments..."
# ... implementation-specific code changes ...

# 8. Commit with proper linking
for i in "${!THREAD_IDS[@]}"; do
    THREAD_ID="${THREAD_IDS[$i]}"
    COMMENT_NUM=$((i+1))

    git add -A
    git commit -m "fix: address PR comment #${COMMENT_NUM} - [description]

Resolves review thread ${THREAD_ID}
- [Describe change 1]
- [Describe change 2]

Co-authored-by: @reviewer"
done

# 9. Mark threads as resolved
echo "Marking threads as resolved..."
python3 scripts/mark_resolved.py "${THREAD_IDS[@]}"

# 10. Verify complete resolution (MANDATORY)
echo -e "\nVerifying resolution..."
if python3 scripts/fetch_comments.py | python3 scripts/verify_resolution.py; then
    echo "✓ All threads resolved"

    # 11. Push changes
    git push

    echo "✅ Comments addressed and verified successfully!"
else
    echo "✗ Unresolved threads remain - fix before pushing"
    exit 1
fi
```

---

## Tips

- **Always fetch fresh comments** - Don't work from stale comment list
- **Link commits to threads** - Include `Resolves review thread <ID>` in commit messages
- **Create task checklist** - Track progress with TaskCreate/TaskUpdate
- **Mark threads resolved** - Use `mark_resolved.py` after committing fixes
- **Verify before pushing** - ALWAYS run `verify_resolution.py` to block incomplete work
- **Test before marking resolved** - Ensure fixes actually work
- **Group related fixes** - One commit per logical change
- **Document deferrals** - If deferring a thread, create follow-up task and get user approval

---

**Quick Reference Card:**

| Task | Command |
|------|---------|
| View PR | `gh pr view` |
| View comments | `gh pr view --comments` |
| View diff | `gh pr diff` |
| Fetch comments | `python3 scripts/fetch_comments.py` |
| Mark resolved | `python3 scripts/mark_resolved.py <thread_id>` |
| Verify resolution | `python3 scripts/verify_resolution.py` |
| Add comment | `gh pr comment --body "text"` |
| Approve PR | `gh pr review --approve` |
| Request changes | `gh pr review --request-changes` |
| Check auth | `gh auth status` |
| Login | `gh auth login` |

---

**Mandatory Workflow Steps:**

1. Fetch comments → Save to file
2. Create task checklist for tracking
3. Apply fixes with proper commit linking
4. Mark threads as resolved
5. **Verify complete resolution** (blocks if incomplete)
6. Push changes

**Remember:** Always address the root cause, not just the symptom mentioned in the comment!
