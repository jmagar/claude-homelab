# GitHub CLI Commands Reference

Commands used by the gh-address-comments skill to interact with GitHub Pull Requests.

## Core Commands

### gh pr view

**Purpose:** View details of a pull request.

**Usage:**
```bash
# View current branch's PR
gh pr view

# View specific PR by number
gh pr view 123

# View PR with comments
gh pr view --comments

# JSON output
gh pr view --json number,title,state,author,url
```

**Output Fields:**
- `number` - PR number
- `title` - PR title
- `state` - PR state (OPEN, CLOSED, MERGED)
- `author` - PR author username
- `url` - PR URL
- `body` - PR description
- `comments` - Comment count
- `reviews` - Review states
- `additions` - Lines added
- `deletions` - Lines deleted

---

### gh pr status

**Purpose:** Check status of PRs related to current repository.

**Usage:**
```bash
# Show all PR status
gh pr status

# Current branch only
gh pr status --json
```

**Returns:**
- PRs created by you
- PRs requesting your review
- PRs mentioning you

---

### gh pr diff

**Purpose:** View diff of a pull request.

**Usage:**
```bash
# View diff of current branch's PR
gh pr diff

# View specific PR diff
gh pr diff 123

# Diff specific files only
gh pr diff -- path/to/file.py
```

---

## Review Commands

### gh pr review

**Purpose:** Review a pull request.

**Usage:**
```bash
# Start interactive review
gh pr review

# Approve PR
gh pr review --approve

# Request changes
gh pr review --request-changes --body "Please fix X"

# Comment only
gh pr review --comment --body "Looks good overall"
```

**Options:**
- `--approve` - Approve the pull request
- `--request-changes` - Request changes
- `--comment` - Add review comment without approval state
- `--body TEXT` - Review comment body

---

### gh api (for detailed comment access)

**Purpose:** Low-level GitHub API access for fetching PR comments.

**Usage:**
```bash
# Get PR comments
gh api repos/{owner}/{repo}/pulls/{pr_number}/comments

# Get review comments
gh api repos/{owner}/{repo}/pulls/{pr_number}/reviews

# Get all comments (issue + review)
gh api repos/{owner}/{repo}/issues/{pr_number}/comments
```

**Comment Types:**
1. **Issue comments** - General PR comments
2. **Review comments** - Line-specific code review comments
3. **Review summaries** - Overall review with approve/request changes

---

## Comment Parsing

### Fetching All Comments

The `scripts/fetch_comments.py` script uses GitHub API via `gh api`:

```python
import subprocess
import json

def fetch_pr_comments(pr_number):
    """Fetch all comments from a PR."""

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

    # Fetch issue comments
    issue_comments = subprocess.run(
        ["gh", "api", f"repos/{owner}/{name}/issues/{pr_number}/comments"],
        capture_output=True,
        text=True,
        check=True
    )

    # Fetch review comments
    review_comments = subprocess.run(
        ["gh", "api", f"repos/{owner}/{name}/pulls/{pr_number}/comments"],
        capture_output=True,
        text=True,
        check=True
    )

    return {
        "issue_comments": json.loads(issue_comments.stdout),
        "review_comments": json.loads(review_comments.stdout)
    }
```

---

### Comment Structure

**Issue Comment:**
```json
{
  "id": 123456,
  "user": {
    "login": "username"
  },
  "body": "Comment text here",
  "created_at": "2026-02-08T12:00:00Z",
  "updated_at": "2026-02-08T12:00:00Z",
  "html_url": "https://github.com/..."
}
```

**Review Comment:**
```json
{
  "id": 789012,
  "user": {
    "login": "reviewer"
  },
  "body": "Line-specific feedback",
  "path": "src/api.py",
  "line": 42,
  "commit_id": "abc123...",
  "created_at": "2026-02-08T12:00:00Z",
  "html_url": "https://github.com/..."
}
```

---

## Authentication

### gh auth status

**Purpose:** Check authentication status.

**Usage:**
```bash
# Check auth status
gh auth status

# Check with specific hostname
gh auth status --hostname github.com
```

**Required scopes:**
- `repo` - Full control of private repositories
- `workflow` - Update GitHub Actions workflows

---

### gh auth login

**Purpose:** Authenticate with GitHub.

**Usage:**
```bash
# Interactive login
gh auth login

# Login with specific scopes
gh auth login --scopes repo,workflow

# Login with token
gh auth login --with-token < token.txt
```

---

## Repository Commands

### gh repo view

**Purpose:** View repository information.

**Usage:**
```bash
# View current repo
gh repo view

# JSON output for scripting
gh repo view --json owner,name,url

# View specific repo
gh repo view owner/repo
```

---

## Error Handling

### Common Errors

**"No pull request found for current branch"**
- Cause: Branch doesn't have an open PR
- Solution: Create PR first with `gh pr create`

**"gh: command not found"**
- Cause: GitHub CLI not installed
- Solution: Install from https://cli.github.com/

**"HTTP 401: Unauthorized"**
- Cause: Not authenticated or token expired
- Solution: Run `gh auth login`

**"HTTP 403: Forbidden"**
- Cause: Insufficient permissions
- Solution: Re-login with required scopes: `gh auth login --scopes repo,workflow`

**"HTTP 404: Not Found"**
- Cause: PR number doesn't exist or no access
- Solution: Check PR number and repository access

**"Rate limit exceeded"**
- Cause: Too many API requests
- Solution: Wait for rate limit reset or authenticate for higher limits

---

## Best Practices

1. **Always check auth first:**
   ```bash
   gh auth status || gh auth login
   ```

2. **Use JSON output for scripting:**
   ```bash
   gh pr view --json number,title,state
   ```

3. **Handle errors gracefully:**
   ```bash
   if ! gh pr view &>/dev/null; then
     echo "No PR found for current branch"
     exit 1
   fi
   ```

4. **Cache API responses:**
   - Store PR data locally if making multiple requests
   - Reduces API calls and improves performance

5. **Check rate limits:**
   ```bash
   gh api rate_limit
   ```

---

## Reference

- **GitHub CLI Manual:** https://cli.github.com/manual/
- **GitHub API Docs:** https://docs.github.com/en/rest
- **Pull Request API:** https://docs.github.com/en/rest/pulls
- **Review API:** https://docs.github.com/en/rest/pulls/reviews
- **Comment API:** https://docs.github.com/en/rest/pulls/comments

---

**Note:** All `gh` commands require GitHub CLI to be installed and authenticated. Run `gh auth login` first if not already authenticated.
