#!/bin/bash
# Script Name: bulk-api.sh
# Purpose: Paperless-ngx bulk operations (add-tag, remove-tag, set-correspondent, delete)
# Usage: ./bulk-api.sh <command> [arguments]

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

# Command: add-tag
# Usage: bulk-api.sh add-tag <tag-id> --documents "1,2,3"
cmd_add_tag() {
    local tag_id="$1"
    shift

    if [[ -z "$tag_id" ]]; then
        echo '{"error": "Tag ID required"}' >&2
        exit 1
    fi

    local documents=""

    while [[ $# -gt 0 ]]; do
        case "$1" in
            --documents)
                documents="$2"
                shift 2
                ;;
            *)
                echo '{"error": "Unknown option", "option": "'"$1"'"}' >&2
                exit 1
                ;;
        esac
    done

    if [[ -z "$documents" ]]; then
        echo '{"error": "Document IDs required"}' >&2
        exit 1
    fi

    # Convert comma-separated string to JSON array
    local doc_array
    doc_array=$(echo "$documents" | jq -R 'split(",") | map(tonumber)')

    # Build payload
    local payload
    payload=$(jq -n \
        --argjson docs "$doc_array" \
        --argjson tag "$tag_id" \
        '{documents: $docs, method: "add_tag", parameters: {tag: $tag}}')

    api_call POST "/documents/bulk_edit/" "$payload"
}

# Command: remove-tag
# Usage: bulk-api.sh remove-tag <tag-id> --documents "1,2,3"
cmd_remove_tag() {
    local tag_id="$1"
    shift

    if [[ -z "$tag_id" ]]; then
        echo '{"error": "Tag ID required"}' >&2
        exit 1
    fi

    local documents=""

    while [[ $# -gt 0 ]]; do
        case "$1" in
            --documents)
                documents="$2"
                shift 2
                ;;
            *)
                echo '{"error": "Unknown option", "option": "'"$1"'"}' >&2
                exit 1
                ;;
        esac
    done

    if [[ -z "$documents" ]]; then
        echo '{"error": "Document IDs required"}' >&2
        exit 1
    fi

    # Convert comma-separated string to JSON array
    local doc_array
    doc_array=$(echo "$documents" | jq -R 'split(",") | map(tonumber)')

    # Build payload
    local payload
    payload=$(jq -n \
        --argjson docs "$doc_array" \
        --argjson tag "$tag_id" \
        '{documents: $docs, method: "remove_tag", parameters: {tag: $tag}}')

    api_call POST "/documents/bulk_edit/" "$payload"
}

# Command: set-correspondent
# Usage: bulk-api.sh set-correspondent <correspondent-id> --documents "1,2,3"
cmd_set_correspondent() {
    local corr_id="$1"
    shift

    if [[ -z "$corr_id" ]]; then
        echo '{"error": "Correspondent ID required"}' >&2
        exit 1
    fi

    local documents=""

    while [[ $# -gt 0 ]]; do
        case "$1" in
            --documents)
                documents="$2"
                shift 2
                ;;
            *)
                echo '{"error": "Unknown option", "option": "'"$1"'"}' >&2
                exit 1
                ;;
        esac
    done

    if [[ -z "$documents" ]]; then
        echo '{"error": "Document IDs required"}' >&2
        exit 1
    fi

    # Convert comma-separated string to JSON array
    local doc_array
    doc_array=$(echo "$documents" | jq -R 'split(",") | map(tonumber)')

    # Build payload
    local payload
    payload=$(jq -n \
        --argjson docs "$doc_array" \
        --argjson corr "$corr_id" \
        '{documents: $docs, method: "set_correspondent", parameters: {correspondent: $corr}}')

    api_call POST "/documents/bulk_edit/" "$payload"
}

# Command: set-document-type
# Usage: bulk-api.sh set-document-type <type-id> --documents "1,2,3"
cmd_set_document_type() {
    local type_id="$1"
    shift

    if [[ -z "$type_id" ]]; then
        echo '{"error": "Document type ID required"}' >&2
        exit 1
    fi

    local documents=""

    while [[ $# -gt 0 ]]; do
        case "$1" in
            --documents)
                documents="$2"
                shift 2
                ;;
            *)
                echo '{"error": "Unknown option", "option": "'"$1"'"}' >&2
                exit 1
                ;;
        esac
    done

    if [[ -z "$documents" ]]; then
        echo '{"error": "Document IDs required"}' >&2
        exit 1
    fi

    # Convert comma-separated string to JSON array
    local doc_array
    doc_array=$(echo "$documents" | jq -R 'split(",") | map(tonumber)')

    # Build payload
    local payload
    payload=$(jq -n \
        --argjson docs "$doc_array" \
        --argjson type "$type_id" \
        '{documents: $docs, method: "set_document_type", parameters: {document_type: $type}}')

    api_call POST "/documents/bulk_edit/" "$payload"
}

# Command: delete
# Usage: bulk-api.sh delete --documents "1,2,3"
cmd_delete() {
    local documents=""

    while [[ $# -gt 0 ]]; do
        case "$1" in
            --documents)
                documents="$2"
                shift 2
                ;;
            *)
                echo '{"error": "Unknown option", "option": "'"$1"'"}' >&2
                exit 1
                ;;
        esac
    done

    if [[ -z "$documents" ]]; then
        echo '{"error": "Document IDs required"}' >&2
        exit 1
    fi

    # Count documents for confirmation
    local doc_count
    doc_count=$(echo "$documents" | tr ',' '\n' | wc -l)

    # Prompt for confirmation
    echo "⚠️  WARNING: This will permanently delete ${doc_count} documents: ${documents}" >&2
    echo -n "Type 'yes' to confirm: " >&2
    read -r confirmation

    if [[ "$confirmation" != "yes" ]]; then
        echo '{"error": "Deletion cancelled by user"}' >&2
        exit 1
    fi

    # Convert comma-separated string to JSON array
    local doc_array
    doc_array=$(echo "$documents" | jq -R 'split(",") | map(tonumber)')

    # Build payload
    local payload
    payload=$(jq -n \
        --argjson docs "$doc_array" \
        '{documents: $docs, method: "delete"}')

    api_call POST "/documents/bulk_edit/" "$payload"
    echo '{"success": true, "message": "Documents deleted", "count": '"$doc_count"'}'
}

# Usage message
usage() {
    cat <<EOF
Usage: $0 <command> [arguments]

Commands:
    add-tag <tag-id> --documents "1,2,3"
        Add tag to multiple documents

    remove-tag <tag-id> --documents "1,2,3"
        Remove tag from multiple documents

    set-correspondent <correspondent-id> --documents "1,2,3"
        Set correspondent on multiple documents

    set-document-type <type-id> --documents "1,2,3"
        Set document type on multiple documents

    delete --documents "1,2,3"
        Delete multiple documents (requires confirmation)

Examples:
    $0 add-tag 5 --documents "1,2,3,4,5"
    $0 remove-tag 5 --documents "1,2,3"
    $0 set-correspondent 2 --documents "10,11,12"
    $0 set-document-type 3 --documents "15,16,17"
    $0 delete --documents "100,101,102"
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
        add-tag)
            cmd_add_tag "$@"
            ;;
        remove-tag)
            cmd_remove_tag "$@"
            ;;
        set-correspondent)
            cmd_set_correspondent "$@"
            ;;
        set-document-type)
            cmd_set_document_type "$@"
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
