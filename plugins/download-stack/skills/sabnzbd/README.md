# SABnzbd Skill

Manage Usenet downloads via SABnzbd.

## What It Does

- **Queue management** — view, pause, resume, delete downloads
- **Add NZBs** — by URL or local file
- **Speed control** — limit download speeds
- **History** — view completed/failed downloads, retry failed
- **Categories & scripts** — organize and automate

## Setup

### 1. Get Your API Key

1. Open SABnzbd web UI
2. Go to **Config → General → Security**
3. Copy your **API Key**

### 2. Add Credentials to .env

Add these lines to `~/.claude-homelab/.env`:

```bash
SABNZBD_URL="http://localhost:8080"
SABNZBD_API_KEY="<your_api_key>"
```

Replace:
- `http://localhost:8080` with your SABnzbd URL
- `<your_api_key>` with your actual API key

### 3. Secure the .env File

```bash
chmod 600 ~/.claude-homelab/.env
```

**Important:** Never commit the `.env` file to git. It's already in `.gitignore`.

### 4. Test It

```bash
./skills/sabnzbd/scripts/sab-api.sh status
```

## Usage Examples

### Queue management

```bash
# View queue
sab-api.sh queue

# Pause/resume all
sab-api.sh pause
sab-api.sh resume

# Pause specific job
sab-api.sh pause-job SABnzbd_nzo_xxxxx
```

### Add downloads

```bash
# Add by URL
sab-api.sh add "https://indexer.com/get.php?guid=..."

# Add with options
sab-api.sh add "URL" --name "My Download" --category movies --priority high

# Add local NZB file
sab-api.sh add-file /path/to/file.nzb --category tv
```

### Speed control

```bash
sab-api.sh speedlimit 50    # 50% of max
sab-api.sh speedlimit 5M    # 5 MB/s
sab-api.sh speedlimit 0     # Unlimited
```

### History

```bash
sab-api.sh history
sab-api.sh history --limit 20 --failed
sab-api.sh retry <nzo_id>       # Retry failed
sab-api.sh retry-all            # Retry all failed
```

## Environment Variables

The scripts load credentials from `~/.claude-homelab/.env`:

```bash
SABNZBD_URL="http://localhost:8080"
SABNZBD_API_KEY="your-api-key"
```

You can also override these temporarily in your shell:

```bash
export SABNZBD_URL="http://192.168.1.100:8080"
export SABNZBD_API_KEY="different-key"
./scripts/sab-api.sh status
```

## API Reference

Detailed API documentation is available in the `references/` directory:

- **[API Endpoints](./references/api-endpoints.md)** - Complete endpoint reference
- **[Quick Reference](./references/quick-reference.md)** - Common command examples
- **[Troubleshooting](./references/troubleshooting.md)** - Common issues and solutions

## Troubleshooting

**"Missing URL or API key"**
→ Check that `SABNZBD_URL` and `SABNZBD_API_KEY` are set in `~/.claude-homelab/.env`

**Connection refused**
→ Verify your SABnzbd URL is correct and accessible

**401 Unauthorized**
→ Your API key is invalid — check SABnzbd Config → General

**More troubleshooting**
→ See [references/troubleshooting.md](./references/troubleshooting.md) for detailed solutions

## License

MIT
