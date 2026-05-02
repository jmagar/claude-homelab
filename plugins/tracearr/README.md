# Tracearr

Tracearr plugin scaffold for media-server monitoring workflows.

Tracearr is a free, open-source, self-hosted monitoring platform for Plex,
Jellyfin, and Emby. It provides a single dashboard for real-time stream
tracking, playback analytics, account-sharing detection, library analytics,
trust scores, Discord/webhook notifications, and imports from Tautulli or
Jellystat.

Sources:

- https://tracearr.com/
- https://docs.tracearr.com/
- https://github.com/connorgallopo/Tracearr

## Structure

- `.claude-plugin/plugin.json` — Claude plugin manifest
- `.mcp.json` — MCP server declarations
- `skills/tracearr/SKILL.md` — Tracearr skill instructions
- `scripts/` — helper scripts
- `commands/` — Claude Code command definitions
- `hooks/` — hook configuration
- `monitors/` — monitor configuration

## Status

This plugin is scaffolded and ready for implementation.

## Implementation Notes

- Tracearr runs with Docker and requires TimescaleDB/PostgreSQL plus Redis.
- The easiest image tag is `supervised`; the `latest` tag expects external DB
  and Redis services.
- Default app/API port is `3000`.
- Required environment includes `DATABASE_URL` and `REDIS_URL`; deployment docs
  also generate `JWT_SECRET` and `COOKIE_SECRET`.
- Tracearr exposes a read-only public REST API with Swagger UI at `/api-docs`
  after generating an API key in settings.
- For initial setup, Plex can authenticate through Plex sign-in; Jellyfin and
  Emby are added with server URL/name/API key from their admin dashboards.
