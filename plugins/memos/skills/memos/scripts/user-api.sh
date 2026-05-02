#!/bin/bash
# Script Name: user-api.sh
# Purpose: User management operations in Memos
# Usage: ./user-api.sh <command> [arguments]

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

# Helper function to get current user ID from JWT token
get_current_user_id() {
    # Decode JWT token to extract user ID
    # JWT format: header.payload.signature
    local payload
    payload=$(echo "$MEMOS_API_TOKEN" | cut -d'.' -f2)

    # Add padding if needed for base64 decode
    local padding=$((4 - ${#payload} % 4))
    [[ $padding -ne 4 ]] && payload="${payload}$(printf '=%.0s' $(seq 1 $padding))"

    # Decode and extract user ID
    local user_id
    user_id=$(echo "$payload" | base64 -d 2>/dev/null | jq -r '.sub' 2>/dev/null)

    if [[ -z "$user_id" ]] || [[ "$user_id" == "null" ]]; then
        echo '{"error": "Failed to extract user ID from token"}' >&2
        return 1
    fi

    echo "$user_id"
}

# Command: whoami
# Usage: user-api.sh whoami
cmd_whoami() {
    local user_id
    user_id=$(get_current_user_id) || exit 1

    api_call GET "/users/${user_id}"
}

# Command: tokens
# Usage: user-api.sh tokens [user-id]
cmd_tokens() {
    local user_id="${1:-}"

    if [[ -z "$user_id" ]]; then
        # Get current user's tokens
        local current_user
        user_id=$(get_current_user_id) || exit 1
        user_id="users/${user_id}"
    fi

    api_call GET "/${user_id}/access-tokens"
}

# Command: create-token
# Usage: user-api.sh create-token [description]
cmd_create_token() {
    local description="${1:-API Token}"

    # Get current user
    local current_user
    current_user=$(api_call GET "/auth/current-user")
    local user_id
    user_id=$(echo "$current_user" | jq -r '.name')

    # Create payload
    local payload
    payload=$(jq -n --arg desc "$description" '{description: $desc}')

    api_call POST "/${user_id}/access-tokens" "$payload"
}

# Command: delete-token
# Usage: user-api.sh delete-token <token-name>
cmd_delete_token() {
    local token_name="$1"

    if [[ -z "$token_name" ]]; then
        echo '{"error": "Token name required"}' >&2
        exit 1
    fi

    # Get current user
    local current_user
    current_user=$(api_call GET "/auth/current-user")
    local user_id
    user_id=$(echo "$current_user" | jq -r '.name')

    api_call DELETE "/${user_id}/access-tokens/${token_name}"
}

# Command: profile
# Usage: user-api.sh profile [user-id]
cmd_profile() {
    local user_id="${1:-}"

    if [[ -z "$user_id" ]]; then
        # Get current user
        api_call GET "/auth/current-user"
    else
        api_call GET "/${user_id}"
    fi
}

# Command: update-profile
# Usage: user-api.sh update-profile [--nickname "name"] [--email "email"]
cmd_update_profile() {
    # Get current user
    local current_user
    current_user=$(api_call GET "/auth/current-user")
    local user_id
    user_id=$(echo "$current_user" | jq -r '.name')

    local nickname=""
    local email=""
    local update_mask_parts=()

    while [[ $# -gt 0 ]]; do
        case "$1" in
            --nickname)
                nickname="$2"
                update_mask_parts+=("nickname")
                shift 2
                ;;
            --email)
                email="$2"
                update_mask_parts+=("email")
                shift 2
                ;;
            *)
                echo '{"error": "Unknown option", "option": "'"$1"'"}' >&2
                exit 1
                ;;
        esac
    done

    if [[ ${#update_mask_parts[@]} -eq 0 ]]; then
        echo '{"error": "No fields to update"}' >&2
        exit 1
    fi

    # Build payload
    local payload="{"
    local first=true

    if [[ -n "$nickname" ]]; then
        payload+="\"nickname\": $(jq -n --arg n "$nickname" '$n')"
        first=false
    fi

    if [[ -n "$email" ]]; then
        [[ "$first" == "false" ]] && payload+=","
        payload+="\"email\": \"$email\""
    fi

    payload+="}"

    # Build update mask
    local update_mask
    update_mask=$(IFS=,; echo "${update_mask_parts[*]}")

    api_call PATCH "/${user_id}?updateMask=${update_mask}" "$payload"
}

# Usage message
usage() {
    cat <<EOF
Usage: $0 <command> [arguments]

Commands:
    whoami
        Get current authenticated user details

    tokens [user-id]
        List access tokens (for current user or specified user)

    create-token [description]
        Create a new access token

    delete-token <token-name>
        Delete an access token

    profile [user-id]
        Get user profile (current user or specified user)

    update-profile [--nickname "name"] [--email "email"]
        Update current user's profile

Examples:
    $0 whoami
    $0 tokens
    $0 create-token "API token for automation"
    $0 delete-token users/1/accessTokens/abc123
    $0 profile
    $0 profile users/1
    $0 update-profile --nickname "John Doe"
    $0 update-profile --nickname "John" --email "john@example.com"
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
        whoami)
            cmd_whoami "$@"
            ;;
        tokens)
            cmd_tokens "$@"
            ;;
        create-token)
            cmd_create_token "$@"
            ;;
        delete-token)
            cmd_delete_token "$@"
            ;;
        profile)
            cmd_profile "$@"
            ;;
        update-profile)
            cmd_update_profile "$@"
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
