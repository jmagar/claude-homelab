#!/bin/bash
# Script Name: tag-api.sh
# Purpose: Paperless-ngx tag management (list, create, get, update, delete)
# Usage: ./tag-api.sh <command> [arguments]

set -euo pipefail

# Load credentials from .env
SCRIPT_DIR="$(cd -P "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PLUGIN_ROOT="${CLAUDE_PLUGIN_ROOT:-$(cd "$SCRIPT_DIR/../../.." && pwd)}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
_LOAD_ENV="${HOME}/.claude-homelab/load-env.sh"
[[ ! -f "$_LOAD_ENV" ]] && _LOAD_ENV="$SCRIPT_DIR/../load-env.sh"
# shellcheck source=/dev/null
source "$_LOAD_ENV" || { echo "ERROR: load-env.sh not found. Run /homelab-core:setup" >&2; exit 1; }
load_service_credentials "paperless-ngx" "PAPERLESS_URL" "PAPERLESS_API_TOKEN"

# API configuration
API_BASE="${PAPERLESS_URL}/api"
AUTH_HEADER="Authorization: Token ${PAPERLESS_API_TOKEN}"

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

# Command: list
# Usage: tag-api.sh list [--ordering "name"]
cmd_list() {
    local ordering="name"

    while [[ $# -gt 0 ]]; do
        case "$1" in
            --ordering)
                ordering="$2"
                shift 2
                ;;
            *)
                echo '{"error": "Unknown option", "option": "'"$1"'"}' >&2
                exit 1
                ;;
        esac
    done

    api_call GET "/tags/?ordering=${ordering}"
}

# Command: create
# Usage: tag-api.sh create "tag-name" [--color "#ff0000"]
cmd_create() {
    local name="$1"
    shift

    if [[ -z "$name" ]]; then
        echo '{"error": "Tag name required"}' >&2
        exit 1
    fi

    local color=""

    while [[ $# -gt 0 ]]; do
        case "$1" in
            --color)
                color="$2"
                shift 2
                ;;
            *)
                echo '{"error": "Unknown option", "option": "'"$1"'"}' >&2
                exit 1
                ;;
        esac
    done

    # Build payload
    local payload
    payload=$(jq -n --arg name "$name" '{name: $name}')

    if [[ -n "$color" ]]; then
        payload=$(echo "$payload" | jq --arg color "$color" '.color = $color')
    fi

    api_call POST "/tags/" "$payload"
}

# Command: get
# Usage: tag-api.sh get <tag-id>
cmd_get() {
    local tag_id="$1"

    if [[ -z "$tag_id" ]]; then
        echo '{"error": "Tag ID required"}' >&2
        exit 1
    fi

    api_call GET "/tags/${tag_id}/"
}

# Command: update
# Usage: tag-api.sh update <tag-id> [--name "new-name"] [--color "#00ff00"]
cmd_update() {
    local tag_id="$1"
    shift

    if [[ -z "$tag_id" ]]; then
        echo '{"error": "Tag ID required"}' >&2
        exit 1
    fi

    # Get current tag data
    local current_tag
    current_tag=$(api_call GET "/tags/${tag_id}/")

    local name=""
    local color=""

    while [[ $# -gt 0 ]]; do
        case "$1" in
            --name)
                name="$2"
                shift 2
                ;;
            --color)
                color="$2"
                shift 2
                ;;
            *)
                echo '{"error": "Unknown option", "option": "'"$1"'"}' >&2
                exit 1
                ;;
        esac
    done

    # Build update payload
    local payload="$current_tag"

    [[ -n "$name" ]] && payload=$(echo "$payload" | jq --arg n "$name" '.name = $n')
    [[ -n "$color" ]] && payload=$(echo "$payload" | jq --arg c "$color" '.color = $c')

    api_call PUT "/tags/${tag_id}/" "$payload"
}

# Command: delete
# Usage: tag-api.sh delete <tag-id>
cmd_delete() {
    local tag_id="$1"

    if [[ -z "$tag_id" ]]; then
        echo '{"error": "Tag ID required"}' >&2
        exit 1
    fi

    # Get tag info for confirmation
    local tag_info
    tag_info=$(api_call GET "/tags/${tag_id}/")
    local tag_name
    tag_name=$(echo "$tag_info" | jq -r '.name')

    # Prompt for confirmation
    echo "⚠️  WARNING: This will remove tag \"${tag_name}\" from all documents" >&2
    echo -n "Type 'yes' to confirm: " >&2
    read -r confirmation

    if [[ "$confirmation" != "yes" ]]; then
        echo '{"error": "Deletion cancelled by user"}' >&2
        exit 1
    fi

    api_call DELETE "/tags/${tag_id}/"
    echo '{"success": true, "message": "Tag deleted", "id": '"$tag_id"'}'
}

# Usage message
usage() {
    cat <<EOF
Usage: $0 <command> [arguments]

Commands:
    list [--ordering "name"]
        List all tags

    create "tag-name" [--color "#ff0000"]
        Create a new tag with optional color

    get <tag-id>
        Get details of a specific tag

    update <tag-id> [--name "new-name"] [--color "#00ff00"]
        Update tag name or color

    delete <tag-id>
        Delete a tag (requires confirmation)

Examples:
    $0 list
    $0 list --ordering "name"
    $0 create "project-alpha"
    $0 create "urgent" --color "#ff0000"
    $0 get 5
    $0 update 5 --name "important"
    $0 update 5 --color "#00ff00"
    $0 delete 5
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
        list)
            cmd_list "$@"
            ;;
        create)
            cmd_create "$@"
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
