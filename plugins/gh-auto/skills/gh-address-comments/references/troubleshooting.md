# GitHub PR Comments - Troubleshooting

Common issues and solutions when working with GitHub PR comments.

## Installation Issues

### "gh: command not found"

**Cause:** GitHub CLI not installed.

**Solutions:**

**Ubuntu/Debian:**
```bash
# Add GitHub CLI repository
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null

# Install
sudo apt update
sudo apt install gh
```

**macOS:**
```bash
brew install gh
```

**Other:**
Download from https://cli.github.com/

**Verify:**
```bash
gh --version
```

---

## Authentication Issues

### "HTTP 401: Unauthorized"

**Cause:** Not authenticated or token expired.

**Solution:**
```bash
# Login with required scopes
gh auth login --scopes repo,workflow

# Verify authentication
gh auth status
```

---

### "HTTP 403: Forbidden"

**Cause:** Insufficient permissions or wrong scopes.

**Solutions:**

**Check current scopes:**
```bash
gh auth status
```

**Re-login with correct scopes:**
```bash
gh auth login --scopes repo,workflow
```

**Required scopes:**
- `repo` - Full control of private repositories
- `workflow` - Update GitHub Actions workflows

---

### "Token lacks required scopes"

**Cause:** Authenticated but missing required scopes.

**Solution:**
```bash
# Refresh authentication with additional scopes
gh auth refresh --scopes repo,workflow

# Or logout and login again
gh auth logout
gh auth login --scopes repo,workflow
```

---

## PR Detection Issues

### "No pull request found for current branch"

**Cause:** Current branch doesn't have an open PR.

**Solutions:**

**Check if PR exists:**
```bash
gh pr status
```

**Create PR if needed:**
```bash
gh pr create --title "Your title" --body "Description"
```

**Check branch name:**
```bash
git branch --show-current
```

**Ensure you're on the right branch:**
```bash
# Switch to feature branch
git checkout feature-branch

# Then retry
gh pr view
```

---

### "Multiple PRs found for branch"

**Cause:** Branch has multiple open PRs (unusual).

**Solution:**
```bash
# List all PRs
gh pr list

# View specific PR by number
gh pr view 123
```

---

## Comment Fetching Issues

### "scripts/fetch_comments.py not found"

**Cause:** Script doesn't exist or wrong directory.

**Solutions:**

**Check current directory:**
```bash
pwd
ls scripts/
```

**Navigate to repository root:**
```bash
cd $(git rev-parse --show-toplevel)
```

**Verify script exists:**
```bash
ls -la scripts/fetch_comments.py
```

---

### Python script errors

**"Python not found"**

**Solution:**
```bash
# Check Python version
python3 --version

# Install if needed (Ubuntu/Debian)
sudo apt install python3
```

**"No module named 'X'"**

**Solution:**
```bash
# Install required modules
pip3 install <module-name>
```

---

### Empty comment list

**Possible causes:**
1. No comments on PR yet
2. API permission issues
3. Wrong PR being accessed

**Solutions:**

**Verify PR has comments:**
```bash
gh pr view --comments
```

**Check PR number:**
```bash
gh pr view --json number
```

**Manually check API:**
```bash
# Get repo info
REPO=$(gh repo view --json owner,name --jq '.owner.login + "/" + .name')

# Get PR number
PR_NUM=$(gh pr view --json number --jq '.number')

# Check API directly
gh api "repos/$REPO/pulls/$PR_NUM/comments"
```

---

## Rate Limiting

### "API rate limit exceeded"

**Cause:** Too many API requests in short time.

**Solutions:**

**Check rate limit status:**
```bash
gh api rate_limit
```

**Output:**
```json
{
  "resources": {
    "core": {
      "limit": 5000,
      "remaining": 0,
      "reset": 1644336000
    }
  }
}
```

**Wait for reset:**
```bash
# Convert reset timestamp to readable time
date -d @1644336000
```

**Increase limits by authenticating:**
```bash
# Authenticated requests have higher limits
gh auth login
```

**Implement caching:**
```python
import json
import os
from datetime import datetime, timedelta

CACHE_FILE = '.pr_comments_cache.json'
CACHE_DURATION = timedelta(minutes=10)

def get_cached_comments():
    if os.path.exists(CACHE_FILE):
        with open(CACHE_FILE, 'r') as f:
            cache = json.load(f)
            cached_time = datetime.fromisoformat(cache['timestamp'])
            if datetime.now() - cached_time < CACHE_DURATION:
                return cache['comments']
    return None

def cache_comments(comments):
    with open(CACHE_FILE, 'w') as f:
        json.dump({
            'timestamp': datetime.now().isoformat(),
            'comments': comments
        }, f)
```

---

## Permission Issues

### "Resource not accessible by integration"

**Cause:** App permissions insufficient for action.

**Solution:**
```bash
# Use personal access token instead
gh auth login --with-token
# Paste token with required scopes
```

---

### "Can't access private repository"

**Cause:** Not a collaborator or insufficient permissions.

**Solutions:**
1. Verify you're a repository collaborator
2. Check organization permissions
3. Use account with proper access

---

## Network Issues

### "Failed to connect to GitHub"

**Possible causes:**
1. No internet connection
2. GitHub API down
3. Firewall/proxy blocking

**Solutions:**

**Check internet:**
```bash
ping -c 3 github.com
```

**Check GitHub status:**
Visit https://www.githubstatus.com/

**Test API directly:**
```bash
curl -I https://api.github.com
```

**Check proxy settings:**
```bash
# If using proxy, configure gh
export HTTPS_PROXY=http://proxy:port
gh pr view
```

---

### Connection timeout

**Cause:** Slow network or GitHub API latency.

**Solution:**

**Increase timeout:**
```bash
# Set timeout in environment
export GH_REQUEST_TIMEOUT=30

gh pr view
```

**Retry with exponential backoff:**
```bash
for i in {1..3}; do
    gh pr view && break
    echo "Retry $i/3..."
    sleep $((i * 2))
done
```

---

## Comment Parsing Issues

### Special characters in comments

**Issue:** Comments with quotes, newlines, or special characters break parsing.

**Solution:**

**Proper JSON parsing:**
```python
import json

# Don't use string manipulation
# ❌ comment_text = result.split('"')[1]

# Use JSON parsing
# ✅ data = json.loads(result)
#    comment_text = data['body']
```

**Escape special characters:**
```python
import shlex

# Safely handle shell arguments
safe_text = shlex.quote(comment_text)
```

---

### Unicode/emoji issues

**Issue:** Comments with emojis or unicode characters display incorrectly.

**Solution:**

**Set UTF-8 encoding:**
```python
import subprocess

result = subprocess.run(
    ["gh", "api", "..."],
    capture_output=True,
    text=True,
    encoding='utf-8',
    check=True
)
```

**Or use bytes:**
```python
result = subprocess.run(
    ["gh", "api", "..."],
    capture_output=True,
    check=True
)
data = result.stdout.decode('utf-8')
```

---

## Workflow Issues

### Addressed comment still shows as unresolved

**Cause:** Comment not marked as resolved in GitHub UI.

**Solutions:**

**Reply to comment:**
```bash
# GitHub may auto-resolve when you reply
gh pr comment --body "Fixed in commit abc123"
```

**Manually resolve:**
- Go to PR on GitHub web interface
- Click "Resolve conversation" on each thread

**Push new commit:**
```bash
# Sometimes GitHub auto-resolves when new code is pushed
git commit --amend --no-edit
git push --force-with-lease
```

---

### Changes pushed but PR not updating

**Possible causes:**
1. Pushed to wrong branch
2. CI/CD still running
3. GitHub caching

**Solutions:**

**Verify branch:**
```bash
# Check current branch
git branch --show-current

# Check remote branch
git branch -vv
```

**Force refresh:**
- Close and reopen browser tab
- Wait a few seconds for GitHub to update
- Check PR URL directly

**Check CI status:**
```bash
gh pr checks
```

---

## Best Practices to Avoid Issues

1. **Always check authentication first:**
   ```bash
   gh auth status || gh auth login
   ```

2. **Verify you're on correct branch:**
   ```bash
   git branch --show-current
   ```

3. **Cache API responses:**
   - Reduces rate limiting
   - Faster responses
   - Work offline

4. **Error handling in scripts:**
   ```python
   try:
       result = subprocess.run([...], check=True)
   except subprocess.CalledProcessError as e:
       print(f"Command failed: {e}")
       sys.exit(1)
   ```

5. **Use JSON output for scripting:**
   ```bash
   gh pr view --json number,title,state
   ```

---

## Getting Help

1. **GitHub CLI docs:** https://cli.github.com/manual/
2. **GitHub support:** https://support.github.com/
3. **GitHub CLI repo:** https://github.com/cli/cli
4. **Community forum:** https://github.com/orgs/community/discussions

---

**Debugging Tips:**

- Run commands with `--help` flag to see all options
- Use `set -x` in bash scripts to see command execution
- Check exit codes: `echo $?` after command
- Enable verbose output: `GH_DEBUG=api gh pr view`
- Test API manually with `curl` to isolate issues

---

**Common Error Code Reference:**

| Code | Meaning | Common Cause |
|------|---------|--------------|
| 401 | Unauthorized | Not authenticated |
| 403 | Forbidden | Insufficient permissions |
| 404 | Not Found | PR/repo doesn't exist |
| 422 | Unprocessable | Invalid input data |
| 429 | Too Many Requests | Rate limit exceeded |
| 500 | Internal Error | GitHub API issue |
