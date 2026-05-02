#!/bin/bash
# Script Name: memo-api.sh
# Purpose: Core Memos API operations (create, list, get, update, delete, archive)
# Usage: ./memo-api.sh <command> [arguments]

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
    local data="${3:-}"

    local curl_args=(
        -s
        -X "$method"
        -H "$AUTH_HEADER"
        -H "Content-Type: application/json"
    )

    if [[ -n "$data" ]]; then
        curl_args+=(-d "$data")
    fi

    curl "${curl_args[@]}" "${API_BASE}${endpoint}"
}

# Command: create
# Usage: memo-api.sh create "content" [--tags "tag1,tag2"] [--visibility PRIVATE|PROTECTED|PUBLIC]
cmd_create() {
    local content="$1"
    shift

    local tags=""
    local visibility="PRIVATE"

    while [[ $# -gt 0 ]]; do
        case "$1" in
            --tags)
                tags="$2"
                shift 2
                ;;
            --visibility)
                visibility="$2"
                shift 2
                ;;
            *)
                echo '{"error": "Unknown option", "option": "'"$1"'"}' >&2
                exit 1
                ;;
        esac
    done

    # Append hashtags to content if tags provided
    # Tags in Memos are parsed from content (format: #tagname)
    if [[ -n "$tags" ]]; then
        IFS=',' read -ra tag_array <<< "$tags"
        local hashtags=""
        for tag in "${tag_array[@]}"; do
            # Remove leading # if present, then add it back
            tag="${tag#\#}"
            hashtags+=" #${tag}"
        done
        content="${content}${hashtags}"
    fi

    # Build JSON payload
    local payload
    payload=$(jq -n \
        --arg content "$content" \
        --arg visibility "$visibility" \
        '{content: $content, visibility: $visibility}')

    api_call POST "/memos" "$payload"
}

# Command: list
# Usage: memo-api.sh list [--limit N] [--filter "expression"]
cmd_list() {
    local limit=50
    local filter=""
    local page_token=""

    while [[ $# -gt 0 ]]; do
        case "$1" in
            --limit)
                limit="$2"
                shift 2
                ;;
            --filter)
                filter="$2"
                shift 2
                ;;
            --page-token)
                page_token="$2"
                shift 2
                ;;
            *)
                echo '{"error": "Unknown option", "option": "'"$1"'"}' >&2
                exit 1
                ;;
        esac
    done

    local query="pageSize=${limit}"
    [[ -n "$filter" ]] && query+="&filter=$(printf '%s' "$filter" | jq -sRr @uri)"
    [[ -n "$page_token" ]] && query+="&pageToken=${page_token}"

    api_call GET "/memos?${query}"
}

# Command: get
# Usage: memo-api.sh get <memo-id>
cmd_get() {
    local memo_id="$1"

    if [[ -z "$memo_id" ]]; then
        echo '{"error": "Memo ID required"}' >&2
        exit 1
    fi

    # Strip "memos/" prefix if present
    memo_id="${memo_id#memos/}"

    api_call GET "/memos/${memo_id}"
}

# Command: update
# Usage: memo-api.sh update <memo-id> [content] [--add-tags "tag1,tag2"] [--visibility PRIVATE]
cmd_update() {
    local memo_id="$1"
    shift

    if [[ -z "$memo_id" ]]; then
        echo '{"error": "Memo ID required"}' >&2
        exit 1
    fi

    # Strip "memos/" prefix if present
    memo_id="${memo_id#memos/}"

    local content=""
    local add_tags=""
    local visibility=""

    # First arg might be content (no flag)
    if [[ $# -gt 0 ]] && [[ ! "$1" =~ ^-- ]]; then
        content="$1"
        shift
    fi

    while [[ $# -gt 0 ]]; do
        case "$1" in
            --add-tags)
                add_tags="$2"
                shift 2
                ;;
            --visibility)
                visibility="$2"
                shift 2
                ;;
            *)
                echo '{"error": "Unknown option", "option": "'"$1"'"}' >&2
                exit 1
                ;;
        esac
    done

    # Build update payload
    local update_mask=""
    local payload="{"
    local fields=()

    if [[ -n "$content" ]]; then
        payload+="\"content\": $(jq -n --arg c "$content" '$c')"
        fields+=("content")
    fi

    if [[ -n "$visibility" ]]; then
        [[ ${#fields[@]} -gt 0 ]] && payload+=","
        payload+="\"visibility\": \"$visibility\""
        fields+=("visibility")
    fi

    payload+="}"

    # Build update mask
    update_mask=$(IFS=,; echo "${fields[*]}")

    if [[ -z "$update_mask" ]]; then
        echo '{"error": "No fields to update"}' >&2
        exit 1
    fi

    api_call PATCH "/memos/${memo_id}?updateMask=${update_mask}" "$payload"
}

# Command: delete
# Usage: memo-api.sh delete <memo-id>
cmd_delete() {
    local memo_id="$1"

    if [[ -z "$memo_id" ]]; then
        echo '{"error": "Memo ID required"}' >&2
        exit 1
    fi

    # Strip "memos/" prefix if present
    memo_id="${memo_id#memos/}"

    api_call DELETE "/memos/${memo_id}"
}

# Command: archive
# Usage: memo-api.sh archive <memo-id>
cmd_archive() {
    local memo_id="$1"

    if [[ -z "$memo_id" ]]; then
        echo '{"error": "Memo ID required"}' >&2
        exit 1
    fi

    # Strip "memos/" prefix if present
    memo_id="${memo_id#memos/}"

    local payload='{"rowStatus": "ARCHIVED"}'
    api_call PATCH "/memos/${memo_id}?updateMask=rowStatus" "$payload"
}

# Usage message
usage() {
    cat <<EOF
Usage: $0 <command> [arguments]

Commands:
    create <content> [--tags "tag1,tag2"] [--visibility PRIVATE|PROTECTED|PUBLIC]
        Create a new memo

    list [--limit N] [--filter "expression"]
        List memos with optional filters

    get <memo-id>
        Get a specific memo by ID

    update <memo-id> [content] [--add-tags "tag1,tag2"] [--visibility PRIVATE]
        Update memo content, tags, or visibility

    delete <memo-id>
        Delete a memo

    archive <memo-id>
        Archive a memo (soft delete)

Examples:
    $0 create "My first memo"
    $0 create "Tagged memo" --tags "work,important" --visibility PUBLIC
    $0 list --limit 10
    $0 list --filter 'tag == "work"'
    $0 get 123
    $0 update 123 "Updated content"
    $0 update 123 --add-tags "urgent"
    $0 delete 123
    $0 archive 123
EOF
}

# Main command dispatcher
main() {
    if [[ $# -eq 0 ]]; then
        usage
        exit 1
    fi

    local command="$1"
    shift

    case "$command" in
        create)
            cmd_create "$@"
            ;;
        list)
            cmd_list "$@"
            ;;
        get)
            cmd_get "$@"
            ;;
        update)
            cmd_update "$@"
            ;;
        delete)
            cmd_delete "$@"
            ;;
        archive)
            cmd_archive "$@"
            ;;
        --help|-h|help)
            usage
            ;;
        *)
            echo '{"error": "Unknown command", "command": "'"$command"'"}' >&2
            usage
            exit 1
            ;;
    esac
}

main "$@"
