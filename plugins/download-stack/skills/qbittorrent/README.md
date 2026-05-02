# qBittorrent Skill

Manage torrents via qBittorrent WebUI.

## What It Does

- **List torrents** — filter by status, category, or tags
- **Add torrents** — by magnet link, URL, or local file
- **Control downloads** — pause, resume, delete, recheck
- **Speed limits** — set upload/download limits
- **Categories & tags** — organize your torrents

## Setup

### 1. Enable WebUI

1. Open qBittorrent
2. Go to **Tools → Options → Web UI**
3. Enable **Web User Interface (Remote control)**
4. Set a username and password
5. Note the port (default: 8080)

### 2. Add Credentials to .env

Add these variables to `~/.claude-homelab/.env`:

```bash
QBITTORRENT_URL="http://localhost:8080"
QBITTORRENT_USERNAME="admin"
QBITTORRENT_PASSWORD="<your_password>"
```

Replace with your actual WebUI credentials.

Set file permissions:
```bash
chmod 600 ~/.claude-homelab/.env
```

### 3. Test It

```bash
./skills/qbittorrent/scripts/qbit-api.sh version
```

## Usage Examples

### List torrents

```bash
# All torrents
qbit-api.sh list

# Filter by status
qbit-api.sh list --filter downloading
qbit-api.sh list --filter seeding
qbit-api.sh list --filter paused

# Filter by category
qbit-api.sh list --category movies
```

### Add torrents

```bash
# By magnet link
qbit-api.sh add "magnet:?xt=..." --category movies

# By .torrent file
qbit-api.sh add-file /path/to/file.torrent --paused
```

### Control torrents

```bash
qbit-api.sh pause <hash>      # or "all"
qbit-api.sh resume <hash>     # or "all"
qbit-api.sh delete <hash>     # keep files
qbit-api.sh delete <hash> --files  # delete files too
```

### Speed limits

```bash
qbit-api.sh transfer          # view current speeds
qbit-api.sh set-speedlimit --down 5M --up 1M
```

### Categories & tags

```bash
qbit-api.sh categories
qbit-api.sh tags
qbit-api.sh set-category <hash> movies
qbit-api.sh add-tags <hash> "important,archive"
```

## Notes

- Credentials are loaded from `~/.claude-homelab/.env`
- All operations require valid credentials
- The script automatically handles session management

## API Reference

Detailed API documentation is available in the `references/` directory:

- **[API Endpoints](./references/api-endpoints.md)** - Complete endpoint reference
- **[Quick Reference](./references/quick-reference.md)** - Common operations with copy-paste ready examples
- **[Troubleshooting](./references/troubleshooting.md)** - Authentication, connection, and common error solutions

## Troubleshooting

**"ERROR: .env file not found"**
→ Create `.env` file at `~/.claude-homelab/.env`

**"QBITTORRENT_URL and QBITTORRENT_USERNAME and QBITTORRENT_PASSWORD must be set in .env"**
→ Check that all three variables are defined in `~/.claude-homelab/.env`

**Connection refused**
→ Make sure WebUI is enabled in qBittorrent settings

**403 Forbidden**
→ Check username/password, or whitelist your IP in qBittorrent WebUI settings

**"Banned" after too many attempts**
→ qBittorrent bans IPs after failed logins — wait or restart qBittorrent

## License

MIT
