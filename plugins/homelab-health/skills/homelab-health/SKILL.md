---
name: homelab-health
description: "Unified health dashboard for all configured homelab services. Use when the user wants to check service status, verify credentials work, see which services are reachable, or diagnose connectivity issues. Triggers on: 'check health', 'service status', 'what's running', 'is plex up', 'verify my setup', 'homelab health', or after running /homelab-core:setup."
---

# Homelab Service Health Dashboard

Run the health check script and present results as a clean dashboard.

## Run the Check

```bash
bash ~/claude-homelab/skills/health/scripts/check-health.sh
```

Or from the plugin cache (when installed via Claude Code):
```bash
bash "${CLAUDE_PLUGIN_ROOT}/skills/health/scripts/check-health.sh"
```

## Present the Dashboard

Parse the JSON output and display as a formatted table:

```
Service Health Dashboard
========================
Category        Service          Status        URL
--------        -------          ------        ---
Media           plex             ✓ reachable   https://plex.example.com:32400
                radarr           ✓ reachable   https://radarr.example.com
                sonarr           ⚠ unreachable https://sonarr.example.com
                overseerr        ○ not configured
                prowlarr         ✓ reachable   https://prowlarr.example.com
                tautulli         ✓ reachable   https://tautulli.example.com

Downloads       qbittorrent      ✓ reachable   https://qbit.example.com
                sabnzbd          ✓ reachable   https://sabnzbd.example.com

Infrastructure  unraid-server1   ✓ reachable   https://unraid1.example.com/graphql
                unraid-server2   ○ not configured
                unifi            ✓ reachable   https://unifi.example.com
                tailscale        ✓ reachable   (API)

Utilities       gotify           ✓ reachable   https://gotify.example.com
                linkding         ✓ reachable   https://links.example.com
                memos            ⚠ unreachable https://memos.example.com
                bytestash        ○ not configured
                paperless        ✓ reachable   https://paperless.example.com
                radicale         ✓ reachable   https://cal.example.com

Summary: 12 reachable  ·  1 unreachable  ·  5 not configured
```

## Status Icons

| Icon | Status | Meaning |
|------|--------|---------|
| ✓ | reachable | URL responded (any HTTP code except timeout) |
| ⚠ | unreachable | URL configured but timed out or connection refused |
| ○ | not configured | No URL set in `~/.claude-homelab/.env` |

## Follow-Up Actions

After showing the dashboard, offer context-sensitive help:

- **Unreachable services**: "Want me to help diagnose `sonarr`? I can check if the URL is correct or test the connection."
- **Not configured services**: "You have 5 services not configured. Want to set them up now?" → offer to run `/homelab-core:setup`
- **All reachable**: "Everything looks good! All configured services are responding."

## Refresh

If the user asks to recheck a specific service, re-run the script and filter the output for that service. Don't run the full check for a single-service query.
