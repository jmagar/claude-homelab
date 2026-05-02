#!/bin/bash
# Script Name: paperless-api.sh
# Purpose: Core Paperless-ngx API operations (upload, search, list, get, update, delete, download)
# Usage: ./paperless-api.sh <command> [arguments]

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

# Command: upload
# Usage: paperless-api.sh upload <file> [--title "Title"] [--tags "tag1,tag2"] [--correspondent "Name"] [--document-type "Type"]
cmd_upload() {
    local file="$1"
    shift

    if [[ ! -f "$file" ]]; then
        echo '{"error": "File not found", "file": "'"$file"'"}' >&2
        exit 1
    fi

    local title=""
    local tags=""
    local correspondent=""
    local document_type=""
    local created_date=""

    while [[ $# -gt 0 ]]; do
        case "$1" in
            --title)
                title="$2"
                shift 2
                ;;
            --tags)
                tags="$2"
                shift 2
                ;;
            --correspondent)
                correspondent="$2"
                shift 2
                ;;
            --document-type)
                document_type="$2"
                shift 2
                ;;
            --created)
                created_date="$2"
                shift 2
                ;;
            *)
                echo '{"error": "Unknown option", "option": "'"$1"'"}' >&2
                exit 1
                ;;
        esac
    done

    # Build multipart form data
    local curl_args=(
        -s
        -X POST
        -H "$AUTH_HEADER"
        -F "document=@$file"
    )

    [[ -n "$title" ]] && curl_args+=(-F "title=$title")
    [[ -n "$tags" ]] && curl_args+=(-F "tags=$tags")
    [[ -n "$correspondent" ]] && curl_args+=(-F "correspondent=$correspondent")
    [[ -n "$document_type" ]] && curl_args+=(-F "document_type=$document_type")
    [[ -n "$created_date" ]] && curl_args+=(-F "created=$created_date")

    curl "${curl_args[@]}" "${API_BASE}/documents/post_document/"
}

# Command: search
# Usage: paperless-api.sh search "query" [--limit N] [--tags "tag1,tag2"] [--correspondent "Name"]
cmd_search() {
    local query="${1:-}"
    shift || true

    local limit=50
    local tags=""
    local correspondent=""
    local document_type=""
    local created_after=""
    local created_before=""

    while [[ $# -gt 0 ]]; do
        case "$1" in
            --limit)
                limit="$2"
                shift 2
                ;;
            --tags)
                tags="$2"
                shift 2
                ;;
            --correspondent)
                correspondent="$2"
                shift 2
                ;;
            --document-type)
                document_type="$2"
                shift 2
                ;;
            --created-after)
                created_after="$2"
                shift 2
                ;;
            --created-before)
                created_before="$2"
                shift 2
                ;;
            *)
                echo '{"error": "Unknown option", "option": "'"$1"'"}' >&2
                exit 1
                ;;
        esac
    done

    local params="page_size=${limit}"
    [[ -n "$query" ]] && params+="&query=$(printf '%s' "$query" | jq -sRr @uri)"
    [[ -n "$tags" ]] && params+="&tags__id__in=$(printf '%s' "$tags" | jq -sRr @uri)"
    [[ -n "$correspondent" ]] && params+="&correspondent__name__icontains=$(printf '%s' "$correspondent" | jq -sRr @uri)"
    [[ -n "$document_type" ]] && params+="&document_type__name__icontains=$(printf '%s' "$document_type" | jq -sRr @uri)"
    [[ -n "$created_after" ]] && params+="&created__date__gt=$created_after"
    [[ -n "$created_before" ]] && params+="&created__date__lt=$created_before"

    api_call GET "/documents/?${params}"
}

# Command: list
# Usage: paperless-api.sh list [--limit N] [--ordering "field"]
cmd_list() {
    local limit=50
    local ordering="-created"
    local page=1

    while [[ $# -gt 0 ]]; do
        case "$1" in
            --limit)
                limit="$2"
                shift 2
                ;;
            --ordering)
                ordering="$2"
                shift 2
                ;;
            --page)
                page="$2"
                shift 2
                ;;
            *)
                echo '{"error": "Unknown option", "option": "'"$1"'"}' >&2
                exit 1
                ;;
        esac
    done

    local params="page_size=${limit}&page=${page}&ordering=${ordering}"
    api_call GET "/documents/?${params}"
}

# Command: get
# Usage: paperless-api.sh get <document-id>
cmd_get() {
    local doc_id="$1"

    if [[ -z "$doc_id" ]]; then
        echo '{"error": "Document ID required"}' >&2
        exit 1
    fi

    api_call GET "/documents/${doc_id}/"
}

# Command: update
# Usage: paperless-api.sh update <document-id> [--title "Title"] [--add-tags "tag1,tag2"] [--correspondent "Name"]
cmd_update() {
    local doc_id="$1"
    shift

    if [[ -z "$doc_id" ]]; then
        echo '{"error": "Document ID required"}' >&2
        exit 1
    fi

    # Get current document data
    local current_doc
    current_doc=$(api_call GET "/documents/${doc_id}/")

    local title=""
    local add_tags=""
    local remove_tags=""
    local correspondent=""
    local document_type=""
    local archive_serial_number=""

    while [[ $# -gt 0 ]]; do
        case "$1" in
            --title)
                title="$2"
                shift 2
                ;;
            --add-tags)
                add_tags="$2"
                shift 2
                ;;
            --remove-tags)
                remove_tags="$2"
                shift 2
                ;;
            --correspondent)
                correspondent="$2"
                shift 2
                ;;
            --document-type)
                document_type="$2"
                shift 2
                ;;
            --archive-serial-number)
                archive_serial_number="$2"
                shift 2
                ;;
            *)
                echo '{"error": "Unknown option", "option": "'"$1"'"}' >&2
                exit 1
                ;;
        esac
    done

    # Build update payload starting with current document
    local payload
    payload=$(echo "$current_doc" | jq '.')

    # Update fields
    [[ -n "$title" ]] && payload=$(echo "$payload" | jq --arg t "$title" '.title = $t')
    [[ -n "$correspondent" ]] && payload=$(echo "$payload" | jq --arg c "$correspondent" '.correspondent = $c')
    [[ -n "$document_type" ]] && payload=$(echo "$payload" | jq --arg d "$document_type" '.document_type = $d')
    [[ -n "$archive_serial_number" ]] && payload=$(echo "$payload" | jq --argjson a "$archive_serial_number" '.archive_serial_number = $a')

    # Handle tags (merge with existing)
    if [[ -n "$add_tags" ]]; then
        IFS=',' read -ra tag_array <<< "$add_tags"
        for tag in "${tag_array[@]}"; do
            payload=$(echo "$payload" | jq --arg t "$tag" '.tags += [$t]')
        done
        payload=$(echo "$payload" | jq '.tags |= unique')
    fi

    if [[ -n "$remove_tags" ]]; then
        IFS=',' read -ra tag_array <<< "$remove_tags"
        for tag in "${tag_array[@]}"; do
            payload=$(echo "$payload" | jq --arg t "$tag" '.tags -= [$t]')
        done
    fi

    api_call PUT "/documents/${doc_id}/" "$payload"
}

# Command: delete
# Usage: paperless-api.sh delete <document-id>
cmd_delete() {
    local doc_id="$1"

    if [[ -z "$doc_id" ]]; then
        echo '{"error": "Document ID required"}' >&2
        exit 1
    fi

    # Get document info for confirmation
    local doc_info
    doc_info=$(api_call GET "/documents/${doc_id}/")
    local doc_title
    doc_title=$(echo "$doc_info" | jq -r '.title // "Untitled"')

    # Prompt for confirmation
    echo "⚠️  WARNING: This will permanently delete document #${doc_id}: \"${doc_title}\"" >&2
    echo -n "Type 'yes' to confirm: " >&2
    read -r confirmation

    if [[ "$confirmation" != "yes" ]]; then
        echo '{"error": "Deletion cancelled by user"}' >&2
        exit 1
    fi

    api_call DELETE "/documents/${doc_id}/"
    echo '{"success": true, "message": "Document deleted", "id": '"$doc_id"'}'
}

# Command: download
# Usage: paperless-api.sh download <document-id> [--output /path/to/save.pdf]
cmd_download() {
    local doc_id="$1"
    shift

    if [[ -z "$doc_id" ]]; then
        echo '{"error": "Document ID required"}' >&2
        exit 1
    fi

    local output=""

    while [[ $# -gt 0 ]]; do
        case "$1" in
            --output)
                output="$2"
                shift 2
                ;;
            *)
                echo '{"error": "Unknown option", "option": "'"$1"'"}' >&2
                exit 1
                ;;
        esac
    done

    # Get document metadata to get filename
    local doc_info
    doc_info=$(api_call GET "/documents/${doc_id}/")
    local original_filename
    original_filename=$(echo "$doc_info" | jq -r '.original_file_name // ("document_" + (.id | tostring) + ".pdf")')

    # Set output filename
    if [[ -z "$output" ]]; then
        output="./${original_filename}"
    fi

    # Download document
    curl -s -H "$AUTH_HEADER" -o "$output" "${API_BASE}/documents/${doc_id}/download/"

    echo '{"success": true, "saved_to": "'"$output"'", "id": '"$doc_id"'}'
}

# Usage message
usage() {
    cat <<EOF
Usage: $0 <command> [arguments]

Commands:
    upload <file> [--title "Title"] [--tags "tag1,tag2"] [--correspondent "Name"] [--document-type "Type"]
        Upload a document with optional metadata

    search [query] [--limit N] [--tags "tag1,tag2"] [--correspondent "Name"] [--document-type "Type"]
        Search documents by content and filters

    list [--limit N] [--ordering "field"] [--page N]
        List all documents with pagination

    get <document-id>
        Get full details of a specific document

    update <document-id> [--title "Title"] [--add-tags "tag1,tag2"] [--correspondent "Name"]
        Update document metadata

    delete <document-id>
        Delete a document (requires confirmation)

    download <document-id> [--output /path/to/save.pdf]
        Download document file

Examples:
    $0 upload receipt.pdf --tags "expense,receipt" --correspondent "Store"
    $0 search "invoice" --limit 10
    $0 search --correspondent "Acme Corp" --tags "urgent"
    $0 list --ordering "-created"
    $0 get 123
    $0 update 123 --title "New Title" --add-tags "reviewed"
    $0 delete 123
    $0 download 123 --output ~/Downloads/document.pdf
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
        upload)
            cmd_upload "$@"
            ;;
        search)
            cmd_search "$@"
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
        download)
            cmd_download "$@"
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
