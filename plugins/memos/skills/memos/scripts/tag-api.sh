#!/bin/bash
# Script Name: tag-api.sh
# Purpose: Manage tags in Memos
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

# Command: list
# Usage: tag-api.sh list
cmd_list() {
    # List all unique tags from memos
    # Note: Memos doesn't have a dedicated tags endpoint, so we extract from memos
    local memos_json
    memos_json=$(api_call GET "/memos?pageSize=1000")

    # Extract all tags and count occurrences
    echo "$memos_json" | jq -r '
        [.memos[]? | .content | scan("#\\w+") | sub("^#"; "")]
        | group_by(.)
        | map({tag: .[0], count: length})
        | sort_by(-.count)
        | {tags: .}
    '
}

# Command: search
# Usage: tag-api.sh search <tag-name>
cmd_search() {
    local tag="$1"

    if [[ -z "$tag" ]]; then
        echo '{"error": "Tag name required"}' >&2
        exit 1
    fi

    # Remove leading # if present
    tag="${tag#\#}"

    # Search memos containing the tag
    local filter="content.contains(\"#${tag}\")"
    local query_params="pageSize=100&filter=$(printf '%s' "$filter" | jq -sRr @uri)"

    api_call GET "/memos?${query_params}"
}

# Command: stats
# Usage: tag-api.sh stats
cmd_stats() {
    # Get tag statistics
    local memos_json
    memos_json=$(api_call GET "/memos?pageSize=1000")

    echo "$memos_json" | jq -r '
        {
            total_memos: (.memos | length),
            total_tags: ([.memos[]? | .content | scan("#\\w+") | sub("^#"; "")] | unique | length),
            tagged_memos: ([.memos[]? | select(.content | test("#\\w+"))] | length),
            untagged_memos: ([.memos[]? | select(.content | test("#\\w+") | not)] | length),
            tags: [.memos[]? | .content | scan("#\\w+") | sub("^#"; "")]
                  | group_by(.)
                  | map({tag: .[0], count: length})
                  | sort_by(-.count)
                  | .[0:10]
        }
    '
}

# Command: rename
# Usage: tag-api.sh rename <old-tag> <new-tag>
cmd_rename() {
    local old_tag="$1"
    local new_tag="$2"

    if [[ -z "$old_tag" ]] || [[ -z "$new_tag" ]]; then
        echo '{"error": "Both old and new tag names required"}' >&2
        exit 1
    fi

    # Remove leading # if present
    old_tag="${old_tag#\#}"
    new_tag="${new_tag#\#}"

    # Find all memos with old tag
    local filter="content.contains(\"#${old_tag}\")"
    local query_params="pageSize=1000&filter=$(printf '%s' "$filter" | jq -sRr @uri)"
    local memos_json
    memos_json=$(api_call GET "/memos?${query_params}")

    # Extract memo IDs
    local memo_ids
    memo_ids=$(echo "$memos_json" | jq -r '.memos[]? | .name')

    if [[ -z "$memo_ids" ]]; then
        echo '{"success": true, "updated": 0, "message": "No memos found with tag #'"$old_tag"'"}'
        exit 0
    fi

    # Update each memo
    local updated=0
    while IFS= read -r memo_id; do
        # Get memo content
        local memo_json
        memo_json=$(api_call GET "/${memo_id}")
        local content
        content=$(echo "$memo_json" | jq -r '.content')

        # Replace old tag with new tag
        local new_content
        new_content=$(echo "$content" | sed "s/#${old_tag}\\b/#${new_tag}/g")

        # Update memo
        local payload
        payload=$(jq -n --arg content "$new_content" '{content: $content}')
        api_call PATCH "/${memo_id}?updateMask=content" "$payload" > /dev/null

        ((updated++))
    done <<< "$memo_ids"

    echo '{"success": true, "updated": '"$updated"', "old_tag": "'"$old_tag"'", "new_tag": "'"$new_tag"'"}'
}

# Usage message
usage() {
    cat <<EOF
Usage: $0 <command> [arguments]

Commands:
    list
        List all tags with usage counts

    search <tag-name>
        Find memos with specific tag

    stats
        Show tag statistics (total tags, top tags, etc.)

    rename <old-tag> <new-tag>
        Rename a tag across all memos

Examples:
    $0 list
    $0 search work
    $0 search "#docker"
    $0 stats
    $0 rename old-project new-project
    $0 rename "#old-tag" "#new-tag"

Notes:
    - Tags are extracted from memo content (format: #tagname)
    - Tag names are case-sensitive
    - Leading # is optional in commands
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
        search)
            cmd_search "$@"
            ;;
        stats)
            cmd_stats "$@"
            ;;
        rename)
            cmd_rename "$@"
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
