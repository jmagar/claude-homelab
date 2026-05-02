#!/bin/bash
# =============================================================================
# Service Health Checker
# =============================================================================
# Checks reachability of all configured homelab services.
# Outputs JSON array to stdout.
# =============================================================================

set -euo pipefail

ENV_FILE="$HOME/.claude-homelab/.env"

if [[ ! -f "$ENV_FILE" ]]; then
    echo '[{"service":"config","status":"error","message":"~/.claude-homelab/.env not found — run /homelab-core:setup first"}]'
    exit 0
fi

# shellcheck disable=SC1090
source "$ENV_FILE"

TIMEOUT=5
results=()

# Check a service given its name, URL, and optional auth header
check_service() {
    local name="$1"
    local url="$2"
    local auth_header="${3:-}"

    if [[ -z "$url" || "$url" == *"your-"* || "$url" == *"example"* ]]; then
        results+=("{\"service\":\"$name\",\"status\":\"not_configured\",\"url\":\"\"}")
        return
    fi

    local http_code
    if [[ -n "$auth_header" ]]; then
        http_code=$(curl -s -o /dev/null -w "%{http_code}" \
            --max-time "$TIMEOUT" \
            -H "$auth_header" \
            "$url" 2>/dev/null || echo "000")
    else
        http_code=$(curl -s -o /dev/null -w "%{http_code}" \
            --max-time "$TIMEOUT" \
            "$url" 2>/dev/null || echo "000")
    fi

    local status
    if [[ "$http_code" == "000" ]]; then
        status="unreachable"
    else
        status="reachable"
    fi

    # Escape URL for JSON
    local safe_url="${url//\"/\\\"}"
    results+=("{\"service\":\"$name\",\"status\":\"$status\",\"url\":\"$safe_url\",\"http_code\":\"$http_code\"}")
}

# --- Media ---
check_service "plex"       "${PLEX_URL:-}"       "${PLEX_TOKEN:+X-Plex-Token: $PLEX_TOKEN}"
check_service "radarr"     "${RADARR_URL:-}/api/v3/health"   "${RADARR_API_KEY:+X-Api-Key: $RADARR_API_KEY}"
check_service "sonarr"     "${SONARR_URL:-}/api/v3/health"   "${SONARR_API_KEY:+X-Api-Key: $SONARR_API_KEY}"
check_service "overseerr"  "${OVERSEERR_URL:-}/api/v1/status" "${OVERSEERR_API_KEY:+X-Api-Key: $OVERSEERR_API_KEY}"
check_service "prowlarr"   "${PROWLARR_URL:-}/api/v1/health" "${PROWLARR_API_KEY:+X-Api-Key: $PROWLARR_API_KEY}"
check_service "tautulli"   "${TAUTULLI_URL:-}/api/v2?apikey=${TAUTULLI_API_KEY:-}&cmd=get_server_info" ""

# --- Downloads ---
check_service "qbittorrent" "${QBITTORRENT_URL:-}" ""
check_service "sabnzbd"    "${SABNZBD_URL:-}" ""

# --- Infrastructure ---
# Unraid: check SERVER1 and SERVER2 vars
_unraid1_name="${UNRAID_SERVER1_NAME:-unraid-server1}"
_unraid1_url="${UNRAID_SERVER1_URL:-}"
_unraid1_key="${UNRAID_SERVER1_API_KEY:-}"
_unraid2_name="${UNRAID_SERVER2_NAME:-unraid-server2}"
_unraid2_url="${UNRAID_SERVER2_URL:-}"
_unraid2_key="${UNRAID_SERVER2_API_KEY:-}"
check_service "$_unraid1_name" "$_unraid1_url" "${_unraid1_key:+X-Api-Key: $_unraid1_key}"
check_service "$_unraid2_name" "$_unraid2_url" "${_unraid2_key:+X-Api-Key: $_unraid2_key}"
check_service "unifi"      "${UNIFI_URL:-}" ""
check_service "tailscale"  "https://api.tailscale.com/api/v2/tailnet/${TAILSCALE_TAILNET:-}/devices" \
    "${TAILSCALE_API_KEY:+Authorization: Bearer $TAILSCALE_API_KEY}"

# --- Utilities ---
check_service "gotify"     "${GOTIFY_URL:-}/health" ""
check_service "linkding"   "${LINKDING_URL:-}/api/bookmarks/?limit=1" \
    "${LINKDING_API_KEY:+Authorization: Token $LINKDING_API_KEY}"
check_service "memos"      "${MEMOS_URL:-}/api/v1/memo?limit=1" \
    "${MEMOS_API_TOKEN:+Authorization: Bearer $MEMOS_API_TOKEN}"
check_service "bytestash"  "${BYTESTASH_URL:-}" ""
check_service "paperless"  "${PAPERLESS_URL:-}/api/" \
    "${PAPERLESS_API_TOKEN:+Authorization: Token $PAPERLESS_API_TOKEN}"
check_service "radicale"   "${RADICALE_URL:-}" ""

# Output JSON array
printf '[\n'
for i in "${!results[@]}"; do
    if [[ $i -lt $(( ${#results[@]} - 1 )) ]]; then
        printf '  %s,\n' "${results[$i]}"
    else
        printf '  %s\n' "${results[$i]}"
    fi
done
printf ']\n'
