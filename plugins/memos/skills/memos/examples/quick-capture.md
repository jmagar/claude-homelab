# Quick Capture Examples

Real-world examples of capturing information from Claude conversations into Memos.

## Example 1: Save Code Snippet

**Scenario:** User shares a useful code snippet during conversation

**Command:**
```bash
cd ~/claude-homelab/skills/memos

bash scripts/memo-api.sh create "$(cat <<'EOF'
Useful Docker cleanup command:

```bash
docker system prune -a --volumes
```

This removes:
- All stopped containers
- All networks not used by at least one container
- All volumes not used by at least one container
- All images without at least one container
- All build cache

**Warning:** Use with caution - this is destructive!
EOF
)" --tags "docker,cleanup,commands"
```

**Expected Output:**
```json
{
  "name": "memos/abc123",
  "content": "Useful Docker cleanup command...",
  "tags": ["docker", "cleanup", "commands"],
  "visibility": "PRIVATE"
}
```

## Example 2: Capture Meeting Notes

**Scenario:** Quick notes from a conversation about a project

**Command:**
```bash
bash scripts/memo-api.sh create "$(cat <<'EOF'
Project Alpha Meeting - 2026-02-07

Attendees: Team leads
Topics discussed:
- Migration timeline: Q2 2026
- Tech stack: React + FastAPI
- Database: PostgreSQL
- Hosting: Self-hosted on Unraid

Action items:
- [ ] Set up development environment
- [ ] Create project repository
- [ ] Schedule kickoff meeting

Next meeting: 2026-02-14
EOF
)" --tags "project-alpha,meetings,planning"
```

## Example 3: Save Troubleshooting Solution

**Scenario:** User finds solution to a problem

**Command:**
```bash
bash scripts/memo-api.sh create "$(cat <<'EOF'
Fixed: PostgreSQL connection refused

**Problem:** Could not connect to PostgreSQL from Docker container

**Solution:** Added container to correct Docker network

```bash
docker network connect my_network postgres_container
docker network connect my_network app_container
```

**Root cause:** Containers were on different networks

References: https://docs.docker.com/network/
EOF
)" --tags "postgresql,docker,troubleshooting,til"
```

## Example 4: Capture Quick Thought

**Scenario:** Brief idea or reminder

**Command:**
```bash
bash scripts/memo-api.sh create "Remember to update the SSL certificates before they expire on March 15th" --tags "reminder,ssl,important"
```

**Expected Output:**
```json
{
  "name": "memos/xyz789",
  "content": "Remember to update the SSL certificates before they expire on March 15th #reminder #ssl #important",
  "tags": ["reminder", "ssl", "important"]
}
```

## Example 5: Save URL with Context

**Scenario:** Interesting article or documentation

**Command:**
```bash
bash scripts/memo-api.sh create "$(cat <<'EOF'
Excellent guide on Kubernetes networking:

https://kubernetes.io/docs/concepts/services-networking/

Key takeaways:
- Services provide stable endpoints for pods
- ClusterIP is default service type
- Use LoadBalancer for external access
- Ingress for HTTP/HTTPS routing

Worth revisiting when setting up production cluster.
EOF
)" --tags "kubernetes,networking,documentation,reference"
```

## Example 6: Multi-line Technical Note

**Scenario:** Detailed technical explanation

**Command:**
```bash
bash scripts/memo-api.sh create "$(cat <<'EOF'
Understanding Docker Volume Mounts vs Bind Mounts

**Volume Mounts** (preferred):
- Managed by Docker
- Location: /var/lib/docker/volumes/
- Portable across hosts
- Better performance on macOS/Windows

Example:
```bash
docker run -v myvolume:/data myimage
```

**Bind Mounts**:
- Direct host filesystem access
- Specific host paths
- Good for development
- Can cause permission issues

Example:
```bash
docker run -v /host/path:/container/path myimage
```

**When to use:**
- Volumes: Production, portability
- Bind mounts: Development, host file access

Source: Docker official docs
EOF
)" --tags "docker,volumes,storage,reference"
```

## Example 7: Save with Specific Visibility

**Scenario:** Create public memo for sharing

**Command:**
```bash
bash scripts/memo-api.sh create "Quick tip: Use \`docker compose\` (not \`docker-compose\`) for Compose V2. The hyphenated version is deprecated." --tags "docker,tips,psa" --visibility PUBLIC
```

## Example 8: Capture Error and Solution

**Scenario:** Document error message and fix

**Command:**
```bash
bash scripts/memo-api.sh create "$(cat <<'EOF'
Error: "Cannot connect to Docker daemon"

Full error:
```
Cannot connect to the Docker daemon at unix:///var/run/docker.sock.
Is the docker daemon running?
```

**Fix:** Add user to docker group
```bash
sudo usermod -aG docker $USER
newgrp docker  # or logout/login
```

**Verification:**
```bash
docker ps  # Should work without sudo
```
EOF
)" --tags "docker,errors,troubleshooting"
```

## Tips for Effective Capture

1. **Use heredoc for multi-line content**: Preserves formatting
2. **Add context**: Include why you're saving it
3. **Tag consistently**: Use established tag names
4. **Include dates**: For time-sensitive information
5. **Link references**: Include URLs to sources
6. **Use Markdown**: Code blocks, lists, headers
7. **Default visibility**: PRIVATE (safe default)

## Verification

After creating a memo, verify it was saved:

```bash
# Get the memo ID from create response
MEMO_ID="abc123"  # Replace with actual ID from response

# Verify content
bash scripts/memo-api.sh get $MEMO_ID | jq '{content, tags, visibility}'
```

## Search Your Captured Notes

```bash
# Find Docker-related memos
bash scripts/search-api.sh "docker" --tags "troubleshooting"

# Find recent memos from last 7 days
bash scripts/search-api.sh "" --from "$(date -d '7 days ago' +%Y-%m-%d)"

# Find memos with "error" in content
bash scripts/search-api.sh "error"
```
