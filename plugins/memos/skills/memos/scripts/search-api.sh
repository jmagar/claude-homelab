#!/bin/bash
# Script Name: search-api.sh
# Purpose: Search memos by content, tags, and date range
# Usage: ./search-api.sh <query> [options]

set -euo pipefail

# Load credentials from .env
SCRIPT_DIR="$(cd -P "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PLUGIN_ROOT="${CLAUDE_PLUGIN_ROOT:-$(cd "$SCRIPT_DIR/../../.." && pwd)}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
_LOAD_ENV="${HOME}/.claude-homelab/load-env.sh"
[[ ! -f "$_LOAD_ENV" ]] && _LOAD_ENV="$SCRIPT_DIR/../load-env.sh"
# shellcheck source=/dev/null
source "$_LOAD_ENV" || { echo "ERROR: load-env.sh not found. Run /homelab-core:setup" >&2; exit 1; }
load_service_credentials "memos" "MEMOS_URL" "MEMOS_API_TOKEN"

# API configuration
API_BASE="${MEMOS_URL}/api/v1"
AUTH_HEADER="Authorization: Bearer ${MEMOS_API_TOKEN}"

# Helper function for API calls
api_call() {
    local method="$1"
    local endpoint="$2"

    curl -s \
        -X "$method" \
        -H "$AUTH_HEADER" \
        -H "Content-Type: application/json" \
        "${API_BASE}${endpoint}"
}

# Main search function
search_memos() {
    local query="$1"
    shift

    local tags=""
    local from_date=""
    local to_date=""
    local visibility=""
    local limit=50

    while [[ $# -gt 0 ]]; do
        case "$1" in
            --tags)
                tags="$2"
                shift 2
                ;;
            --from)
                from_date="$2"
                shift 2
                ;;
            --to)
                to_date="$2"
                shift 2
                ;;
            --visibility)
                visibility="$2"
                shift 2
                ;;
            --limit)
                limit="$2"
                shift 2
                ;;
            *)
                echo '{"error": "Unknown option", "option": "'"$1"'"}' >&2
                exit 1
                ;;
        esac
    done

    # Build filter expression (Google AIP-160 standard)
    local filters=()

    # Content search (case-insensitive substring match)
    if [[ -n "$query" ]]; then
        filters+=("content.contains(\"${query}\")")
    fi

    # Tag filter
    if [[ -n "$tags" ]]; then
        IFS=',' read -ra tag_array <<< "$tags"
        for tag in "${tag_array[@]}"; do
            filters+=("tag == \"${tag}\"")
        done
    fi

    # Date range filter
    if [[ -n "$from_date" ]]; then
        filters+=("create_time >= \"${from_date}T00:00:00Z\"")
    fi
    if [[ -n "$to_date" ]]; then
        filters+=("create_time <= \"${to_date}T23:59:59Z\"")
    fi

    # Visibility filter
    if [[ -n "$visibility" ]]; then
        filters+=("visibility == \"${visibility}\"")
    fi

    # Combine filters with AND
    local filter_expr=""
    if [[ ${#filters[@]} -gt 0 ]]; then
        filter_expr=$(IFS=" && "; echo "${filters[*]}")
    fi

    # Build query parameters
    local query_params="pageSize=${limit}"
    if [[ -n "$filter_expr" ]]; then
        query_params+="&filter=$(printf '%s' "$filter_expr" | jq -sRr @uri)"
    fi

    # Execute search
    api_call GET "/memos?${query_params}"
}

# Usage message
usage() {
    cat <<EOF
Usage: $0 <query> [options]

Search memos by content, tags, and date range.

Arguments:
    <query>         Search query (searches in memo content)

Options:
    --tags TAG1,TAG2        Filter by tags (comma-separated)
    --from YYYY-MM-DD      Filter memos created after date
    --to YYYY-MM-DD        Filter memos created before date
    --visibility PRIVATE|PROTECTED|PUBLIC
                           Filter by visibility
    --limit N              Maximum results (default: 50)

Examples:
    # Search by content
    $0 "docker kubernetes"

    # Search with tags
    $0 "networking" --tags "devops,infrastructure"

    # Search by date range
    $0 "meeting" --from "2024-01-01" --to "2024-12-31"

    # Combined search
    $0 "project alpha" --tags "work" --from "2024-01-01" --limit 20

    # Search only private memos
    $0 "personal" --visibility PRIVATE
EOF
}

# Main
main() {
    if [[ $# -eq 0 ]]; then
        usage
        exit 1
    fi

    case "$1" in
        --help|-h|help)
            usage
            exit 0
            ;;
        *)
            search_memos "$@"
            ;;
    esac
}

main "$@"
