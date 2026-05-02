#!/bin/bash
# Script Name: correspondent-api.sh
# Purpose: Paperless-ngx correspondent management (list, create, get, update, delete)
# Usage: ./correspondent-api.sh <command> [arguments]

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
# Usage: correspondent-api.sh list [--ordering "name"]
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

    api_call GET "/correspondents/?ordering=${ordering}"
}

# Command: create
# Usage: correspondent-api.sh create "Correspondent Name"
cmd_create() {
    local name="$1"

    if [[ -z "$name" ]]; then
        echo '{"error": "Correspondent name required"}' >&2
        exit 1
    fi

    local payload
    payload=$(jq -n --arg name "$name" '{name: $name}')

    api_call POST "/correspondents/" "$payload"
}

# Command: get
# Usage: correspondent-api.sh get <correspondent-id>
cmd_get() {
    local corr_id="$1"

    if [[ -z "$corr_id" ]]; then
        echo '{"error": "Correspondent ID required"}' >&2
        exit 1
    fi

    api_call GET "/correspondents/${corr_id}/"
}

# Command: update
# Usage: correspondent-api.sh update <correspondent-id> --name "New Name"
cmd_update() {
    local corr_id="$1"
    shift

    if [[ -z "$corr_id" ]]; then
        echo '{"error": "Correspondent ID required"}' >&2
        exit 1
    fi

    # Get current correspondent data
    local current_corr
    current_corr=$(api_call GET "/correspondents/${corr_id}/")

    local name=""

    while [[ $# -gt 0 ]]; do
        case "$1" in
            --name)
                name="$2"
                shift 2
                ;;
            *)
                echo '{"error": "Unknown option", "option": "'"$1"'"}' >&2
                exit 1
                ;;
        esac
    done

    if [[ -z "$name" ]]; then
        echo '{"error": "No update fields provided"}' >&2
        exit 1
    fi

    # Build update payload
    local payload
    payload=$(echo "$current_corr" | jq --arg n "$name" '.name = $n')

    api_call PUT "/correspondents/${corr_id}/" "$payload"
}

# Command: delete
# Usage: correspondent-api.sh delete <correspondent-id>
cmd_delete() {
    local corr_id="$1"

    if [[ -z "$corr_id" ]]; then
        echo '{"error": "Correspondent ID required"}' >&2
        exit 1
    fi

    # Get correspondent info for confirmation
    local corr_info
    corr_info=$(api_call GET "/correspondents/${corr_id}/")
    local corr_name
    corr_name=$(echo "$corr_info" | jq -r '.name')

    # Prompt for confirmation
    echo "⚠️  WARNING: This will remove correspondent \"${corr_name}\" from all documents" >&2
    echo -n "Type 'yes' to confirm: " >&2
    read -r confirmation

    if [[ "$confirmation" != "yes" ]]; then
        echo '{"error": "Deletion cancelled by user"}' >&2
        exit 1
    fi

    api_call DELETE "/correspondents/${corr_id}/"
    echo '{"success": true, "message": "Correspondent deleted", "id": '"$corr_id"'}'
}

# Usage message
usage() {
    cat <<EOF
Usage: $0 <command> [arguments]

Commands:
    list [--ordering "name"]
        List all correspondents

    create "Correspondent Name"
        Create a new correspondent

    get <correspondent-id>
        Get details of a specific correspondent

    update <correspondent-id> --name "New Name"
        Update correspondent name

    delete <correspondent-id>
        Delete a correspondent (requires confirmation)

Examples:
    $0 list
    $0 list --ordering "name"
    $0 create "Acme Corporation"
    $0 get 3
    $0 update 3 --name "Acme Corp Inc."
    $0 delete 3
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
