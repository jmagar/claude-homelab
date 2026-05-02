# Linkding Skill

Manage bookmarks via Linkding REST API.

## What It Does

- **Bookmarks** — list, search, create, update, archive, delete
- **Tags** — list and create tags
- **Bundles** — saved searches with filters
- **Check URLs** — see if a link is already bookmarked

## Setup

### 1. Get Your API Token

1. Open your Linkding web UI
2. Go to **Settings**
3. Find the **REST API** section
4. Copy your **API Token**

### 2. Add Credentials to .env

Add these variables to `~/.claude-homelab/.env`:

```bash
LINKDING_URL="http://localhost:9090"
LINKDING_API_KEY="<your_api_token>"
```

**Security:**
- The `.env` file is gitignored and should have permissions `chmod 600`
- Replace the URL with your actual Linkding server address
- Never commit the `.env` file to version control

### 3. Test It

```bash
./scripts/linkding-api.sh bookmarks --limit 5
```

## Usage Examples

### List and search bookmarks

```bash
# Recent bookmarks
linkding-api.sh bookmarks

# Search by keyword
linkding-api.sh bookmarks --query "python tutorial"

# Archived bookmarks
linkding-api.sh bookmarks --archived

# With pagination
linkding-api.sh bookmarks --limit 20 --offset 40
```

### Create bookmark

```bash
# Basic
linkding-api.sh create "https://example.com"

# With metadata
linkding-api.sh create "https://example.com" \
  --title "Example Site" \
  --description "A great resource" \
  --tags "reference,docs"

# Create and archive immediately
linkding-api.sh create "https://example.com" --archived
```

### Check if URL exists

```bash
linkding-api.sh check "https://example.com"
```

### Manage bookmarks

```bash
# Update
linkding-api.sh update 123 --title "New Title" --tags "newtag"

# Archive/unarchive
linkding-api.sh archive 123
linkding-api.sh unarchive 123

# Delete
linkding-api.sh delete 123
```

### Tags

```bash
linkding-api.sh tags           # List all tags
linkding-api.sh tag-create "mytag"
```

### Bundles (saved searches)

```bash
linkding-api.sh bundles        # List bundles

linkding-api.sh bundle-create "Work Resources" \
  --search "productivity" \
  --any-tags "work,tools"
```

## Environment Variables

The script automatically loads credentials from `~/.claude-homelab/.env`. You can also set them in your shell environment:

```bash
export LINKDING_URL="https://linkding.example.com"
export LINKDING_API_KEY="your-api-token"
```

## API Reference

Detailed API documentation is available in the `references/` directory:

- **[API Endpoints](./references/api-endpoints.md)** - Complete endpoint reference

## Troubleshooting

**"LINKDING_URL and LINKDING_API_KEY must be set"**
→ Check that `~/.claude-homelab/.env` exists and contains these variables

**401 Unauthorized**
→ Your API token is invalid — regenerate it in Linkding settings

**"No such file or directory: .env"**
→ Create the `.env` file at `~/.claude-homelab/.env` with your credentials

## License

MIT
