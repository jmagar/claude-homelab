#!/bin/bash
# Script Name: bytestash-api.sh
# Purpose: ByteStash API wrapper for snippet management
# Usage: ./bytestash-api.sh <command> [options]

set -euo pipefail

# === Configuration ===
SCRIPT_DIR="$(cd -P "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PLUGIN_ROOT="${CLAUDE_PLUGIN_ROOT:-$(cd "$SCRIPT_DIR/../../.." && pwd)}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
_LOAD_ENV="${HOME}/.claude-homelab/load-env.sh"
[[ ! -f "$_LOAD_ENV" ]] && _LOAD_ENV="$SCRIPT_DIR/../load-env.sh"
# shellcheck source=/dev/null
source "$_LOAD_ENV" || { echo "ERROR: load-env.sh not found. Run /homelab-core:setup" >&2; exit 1; }

# === Functions ===

init_config() {
    load_service_credentials "bytestash" "BYTESTASH_URL" "BYTESTASH_API_KEY"
    BYTESTASH_URL="${BYTESTASH_URL%/}"
}

usage() {
    cat <<EOF
Usage: $0 <command> [options]

Commands:
    list                           List all snippets
    search <query>                 Search snippets by title
    search --category <category>   Search snippets by category
    get <id>                       Get snippet by ID
    create [options]               Create new snippet
    push [options]                 Create snippet from multiple files
    update <id> [options]          Update snippet
    delete <id>                    Delete snippet
    share <id> [--protected] [--expires <seconds>]
                                   Create share link
    shares <id>                    List all shares for a snippet
    unshare <share-id>             Delete share link
    view-share <share-id>          View shared snippet

Create/Push Options:
    --title <title>                Snippet title (required)
    --description <desc>           Snippet description (auto-generated with date if omitted)
    --categories <tags>            Comma-separated categories (auto-detected from language if omitted)
    --code <code>                  Code content (for create, required)
    --language <lang>              Programming language (auto-detected from filename if omitted)
    --filename <name>              File name for fragment (default: "snippet")
    --files <file1,file2,...>      Multiple files to push (for push, required)
    --public                       Make snippet public (default: private)

Update Options:
    --title <title>                Update snippet title
    --description <desc>           Update snippet description
    --categories <tags>            Update comma-separated categories

Examples:
    # Create with auto-generated metadata
    $0 create --title "Quick Script" --code "echo hi"

    # Create with full metadata
    $0 create --title "Docker Build" \\
      --description "Production build script - 2024-01-15" \\
      --categories "docker,devops,automation" \\
      --code "docker build -t app:latest ." \\
      --language "bash" \\
      --filename "build.sh"

    # Push multiple files (auto-detects language and categories)
    $0 push --title "FastAPI App" --files "app.py,requirements.txt,Dockerfile"

    # Create public snippet
    $0 create --title "Public Utility" --code "#!/bin/bash\\necho test" --public

    # Create test file (auto-adds "testing" category from filename)
    $0 create --title "User Service Test" --code "test code" --filename "user.test.ts"

    # Search and share
    $0 search "docker"
    $0 get 123
    $0 share 123 --protected --expires 86400

Auto-Detection Features:
    • Descriptions: "Created on YYYY-MM-DD HH:MM:SS" if omitted
    • Languages: From file extension (30+ languages supported)
    • Categories: Based on language + filename patterns
      - test/spec files → adds "testing"
      - config files → adds "configuration"
      - util/helper → adds "utilities"
      - api/route → adds "api"
      - And 10+ more context patterns
EOF
}

# Make API request
api_request() {
    local method="$1"
    local endpoint="$2"
    local data="${3:-}"

    local url="${BYTESTASH_URL}${endpoint}"
    local response
    local body
    local status

    if [[ -n "$data" ]]; then
        response=$(curl -sS -w '\n%{http_code}' -X "$method" "$url" \
            -H "x-api-key: $BYTESTASH_API_KEY" \
            -H "Content-Type: application/json" \
            -d "$data")
    else
        response=$(curl -sS -w '\n%{http_code}' -X "$method" "$url" \
            -H "x-api-key: $BYTESTASH_API_KEY")
    fi

    body="$(printf '%s' "$response" | sed '$d')"
    status="$(printf '%s' "$response" | tail -n1)"

    if [[ "$status" =~ ^[0-9]+$ ]] && (( status >= 400 )); then
        echo "HTTP ${status}: API request failed for ${method} ${endpoint}" >&2
        echo "$body" >&2
        return 1
    fi

    echo "$body"
}

# List all snippets
list_snippets() {
    api_request "GET" "/api/v1/snippets"
}

# Search snippets
search_snippets() {
    local query="$1"
    local category="${2:-}"

    local all_snippets
    all_snippets=$(list_snippets)

    if [[ -n "$category" ]]; then
        echo "$all_snippets" | jq --arg cat "$category" \
            '.[] | select(.categories[]? == $cat)'
    else
        echo "$all_snippets" | jq --arg query "$query" \
            '.[] | select(.title | ascii_downcase | contains($query | ascii_downcase))'
    fi
}

# Get snippet by ID
get_snippet() {
    local id="$1"
    api_request "GET" "/api/v1/snippets/$id"
}

# Create snippet
create_snippet() {
    local title=""
    local description=""
    local categories=""
    local code=""
    local language=""
    local filename=""
    local is_public="false"

    while [[ $# -gt 0 ]]; do
        case "$1" in
            --title) title="$2"; shift 2 ;;
            --description) description="$2"; shift 2 ;;
            --categories) categories="$2"; shift 2 ;;
            --code) code="$2"; shift 2 ;;
            --language) language="$2"; shift 2 ;;
            --filename) filename="$2"; shift 2 ;;
            --public) is_public="true"; shift ;;
            *) echo "Unknown option: $1" >&2; exit 1 ;;
        esac
    done

    if [[ -z "$title" ]] || [[ -z "$code" ]]; then
        echo "ERROR: --title and --code are required" >&2
        exit 1
    fi

    # Auto-generate description with date if not provided
    if [[ -z "$description" ]]; then
        description="Created on $(date '+%Y-%m-%d %H:%M:%S')"
    fi

    # Detect language if not provided
    if [[ -z "$language" ]]; then
        language=$(detect_language "${filename:-snippet}")
    fi

    # Auto-detect categories from language if not provided
    if [[ -z "$categories" ]]; then
        categories=$(suggest_categories "$language")

        # Add context-aware categories based on filename patterns
        local context_cats=$(detect_context_categories "${filename:-snippet}")
        if [[ -n "$context_cats" ]]; then
            categories="$categories,$context_cats"
        fi
    fi

    # Build categories array
    local categories_json="[]"
    if [[ -n "$categories" ]]; then
        categories_json=$(echo "$categories" | jq -R 'split(",") | map(gsub("^\\s+|\\s+$";""))')
    fi

    # Build fragment
    local fragment_json
    fragment_json=$(jq -n \
        --arg code "$code" \
        --arg lang "$language" \
        --arg fname "${filename:-snippet}" \
        '{
            file_name: $fname,
            code: $code,
            language: $lang,
            position: 0
        }')

    # Build snippet JSON
    local snippet_json
    snippet_json=$(jq -n \
        --arg title "$title" \
        --arg desc "$description" \
        --argjson cats "$categories_json" \
        --argjson frag "[$fragment_json]" \
        --argjson public "$is_public" \
        '{
            title: $title,
            description: $desc,
            categories: $cats,
            fragments: $frag,
            is_public: ($public | if . == "true" then 1 else 0 end)
        }')

    api_request "POST" "/api/snippets" "$snippet_json"
}

# Push multiple files as snippet
push_snippet() {
    local title=""
    local description=""
    local categories=""
    local files=""
    local is_public="false"

    while [[ $# -gt 0 ]]; do
        case "$1" in
            --title) title="$2"; shift 2 ;;
            --description) description="$2"; shift 2 ;;
            --categories) categories="$2"; shift 2 ;;
            --files) files="$2"; shift 2 ;;
            --public) is_public="true"; shift ;;
            *) echo "Unknown option: $1" >&2; exit 1 ;;
        esac
    done

    if [[ -z "$title" ]] || [[ -z "$files" ]]; then
        echo "ERROR: --title and --files are required" >&2
        exit 1
    fi

    # Auto-generate description with date if not provided
    if [[ -z "$description" ]]; then
        IFS=',' read -ra file_array <<< "$files"
        local file_count="${#file_array[@]}"
        description="Multi-file snippet ($file_count files) - Created on $(date '+%Y-%m-%d %H:%M:%S')"
    fi

    # Build fragments from files
    local fragments_json="[]"
    local position=0
    local detected_languages=""

    IFS=',' read -ra file_array <<< "$files"
    for file in "${file_array[@]}"; do
        file=$(echo "$file" | xargs)  # Trim whitespace

        if [[ ! -f "$file" ]]; then
            echo "ERROR: File not found: $file" >&2
            exit 1
        fi

        local code
        code=$(cat "$file")
        local filename
        filename=$(basename "$file")
        local language
        language=$(detect_language "$filename")

        # Track detected languages for auto-categorization
        if [[ -z "$detected_languages" ]]; then
            detected_languages="$language"
        elif [[ ! "$detected_languages" =~ $language ]]; then
            detected_languages="$detected_languages,$language"
        fi

        local fragment
        fragment=$(jq -n \
            --arg code "$code" \
            --arg lang "$language" \
            --arg fname "$filename" \
            --arg pos "$position" \
            '{
                file_name: $fname,
                code: $code,
                language: $lang,
                position: ($pos | tonumber)
            }')

        fragments_json=$(echo "$fragments_json" | jq --argjson frag "$fragment" '. + [$frag]')
        ((position++))
    done

    # Auto-detect categories from languages if not provided
    if [[ -z "$categories" ]]; then
        IFS=',' read -ra lang_array <<< "$detected_languages"
        local auto_cats=""
        for lang in "${lang_array[@]}"; do
            local suggested
            suggested=$(suggest_categories "$lang")
            if [[ -n "$suggested" ]]; then
                if [[ -z "$auto_cats" ]]; then
                    auto_cats="$suggested"
                else
                    auto_cats="$auto_cats,$suggested"
                fi
            fi
        done
        categories="$auto_cats"
    fi

    # Build categories array
    local categories_json="[]"
    if [[ -n "$categories" ]]; then
        categories_json=$(echo "$categories" | jq -R 'split(",") | map(gsub("^\\s+|\\s+$";"")) | unique')
    fi

    # Build snippet JSON
    local snippet_json
    snippet_json=$(jq -n \
        --arg title "$title" \
        --arg desc "$description" \
        --argjson cats "$categories_json" \
        --argjson frags "$fragments_json" \
        --argjson public "$is_public" \
        '{
            title: $title,
            description: $desc,
            categories: $cats,
            fragments: $frags,
            is_public: ($public | if . == "true" then 1 else 0 end)
        }')

    api_request "POST" "/api/snippets" "$snippet_json"
}

# Suggest categories based on language
suggest_categories() {
    local language="$1"

    case "$language" in
        python) echo "python,code" ;;
        javascript) echo "javascript,code" ;;
        typescript) echo "typescript,code" ;;
        jsx) echo "javascript,react,frontend" ;;
        tsx) echo "typescript,react,frontend" ;;
        vue) echo "vue,javascript,frontend" ;;
        svelte) echo "svelte,javascript,frontend" ;;
        bash) echo "bash,shell,script" ;;
        yaml|json) echo "config,devops" ;;
        toml|ini) echo "config" ;;
        xml) echo "config,data" ;;
        markdown) echo "documentation" ;;
        html|css) echo "web,frontend" ;;
        scss|sass|less) echo "css,frontend" ;;
        go) echo "go,code" ;;
        rust) echo "rust,code" ;;
        java) echo "java,code" ;;
        kotlin) echo "kotlin,code" ;;
        swift) echo "swift,code" ;;
        c|cpp) echo "c,code" ;;
        csharp) echo "csharp,dotnet,code" ;;
        ruby) echo "ruby,code" ;;
        php) echo "php,web" ;;
        perl) echo "perl,script" ;;
        lua) echo "lua,script" ;;
        r) echo "r,data-science" ;;
        dockerfile) echo "docker,devops" ;;
        terraform) echo "terraform,iac,devops" ;;
        makefile) echo "build,automation" ;;
        sql) echo "database,sql" ;;
        graphql) echo "graphql,api" ;;
        proto|protobuf) echo "protobuf,api" ;;
        *) echo "code" ;;
    esac
}

# Detect context-based categories from filename patterns
detect_context_categories() {
    local filename="$1"
    local cats=""

    # Convert to lowercase for pattern matching
    local lower_filename=$(echo "$filename" | tr '[:upper:]' '[:lower:]')

    # Pattern matching
    [[ "$lower_filename" =~ test|spec|__test__ ]] && cats="${cats:+$cats,}testing"
    [[ "$lower_filename" =~ config|settings|env ]] && cats="${cats:+$cats,}configuration"
    [[ "$lower_filename" =~ example|sample|demo ]] && cats="${cats:+$cats,}examples"
    [[ "$lower_filename" =~ util|helper|common ]] && cats="${cats:+$cats,}utilities"
    [[ "$lower_filename" =~ api|endpoint|route ]] && cats="${cats:+$cats,}api"
    [[ "$lower_filename" =~ model|schema|entity ]] && cats="${cats:+$cats,}data-model"
    [[ "$lower_filename" =~ service|provider ]] && cats="${cats:+$cats,}service"
    [[ "$lower_filename" =~ component|widget ]] && cats="${cats:+$cats,}ui-component"
    [[ "$lower_filename" =~ hook|use[A-Z] ]] && cats="${cats:+$cats,}react-hooks"
    [[ "$lower_filename" =~ migration|seed ]] && cats="${cats:+$cats,}database"
    [[ "$lower_filename" =~ deploy|ci|cd|pipeline ]] && cats="${cats:+$cats,}deployment"
    [[ "$lower_filename" =~ docker|compose ]] && cats="${cats:+$cats,}docker"
    [[ "$lower_filename" =~ script|task|job ]] && cats="${cats:+$cats,}automation"

    echo "$cats"
}

# Detect language from filename
detect_language() {
    local filename="$1"
    local ext="${filename##*.}"

    # Check for special filenames first
    case "$filename" in
        Dockerfile*|dockerfile*) echo "dockerfile"; return ;;
        docker-compose.yml|docker-compose.yaml) echo "yaml"; return ;;
        Makefile|makefile) echo "makefile"; return ;;
        package.json|package-lock.json) echo "json"; return ;;
        requirements.txt|Pipfile|pyproject.toml) echo "python"; return ;;
        tsconfig.json|jsconfig.json) echo "json"; return ;;
        .eslintrc*|.prettierrc*) echo "json"; return ;;
        next.config.*|vite.config.*|webpack.config.*) echo "javascript"; return ;;
        terraform.tfstate) echo "json"; return ;;
        *.env|.env.*) echo "ini"; return ;;
    esac

    case "$ext" in
        py) echo "python" ;;
        js|mjs) echo "javascript" ;;
        ts) echo "typescript" ;;
        jsx) echo "jsx" ;;
        tsx) echo "tsx" ;;
        vue) echo "vue" ;;
        svelte) echo "svelte" ;;
        sh|bash) echo "bash" ;;
        yml|yaml) echo "yaml" ;;
        json) echo "json" ;;
        toml) echo "toml" ;;
        ini|conf) echo "ini" ;;
        xml) echo "xml" ;;
        md|markdown) echo "markdown" ;;
        html|htm) echo "html" ;;
        css) echo "css" ;;
        scss|sass|less) echo "scss" ;;
        go) echo "go" ;;
        rs) echo "rust" ;;
        java) echo "java" ;;
        kt|kts) echo "kotlin" ;;
        swift) echo "swift" ;;
        c) echo "c" ;;
        cpp|cc|cxx|h|hpp) echo "cpp" ;;
        cs) echo "csharp" ;;
        rb) echo "ruby" ;;
        php) echo "php" ;;
        pl|pm) echo "perl" ;;
        lua) echo "lua" ;;
        r) echo "r" ;;
        sql) echo "sql" ;;
        graphql|gql) echo "graphql" ;;
        proto) echo "proto" ;;
        tf|tfvars) echo "terraform" ;;
        dockerfile) echo "dockerfile" ;;
        *) echo "text" ;;
    esac
}

# Update snippet
update_snippet() {
    local id="$1"
    shift

    local title=""
    local description=""
    local categories=""

    while [[ $# -gt 0 ]]; do
        case "$1" in
            --title) title="$2"; shift 2 ;;
            --description) description="$2"; shift 2 ;;
            --categories) categories="$2"; shift 2 ;;
            *) echo "Unknown option: $1" >&2; exit 1 ;;
        esac
    done

    # Get existing snippet
    local existing
    existing=$(get_snippet "$id")

    # Build update JSON
    local update_json="$existing"

    if [[ -n "$title" ]]; then
        update_json=$(echo "$update_json" | jq --arg title "$title" '.title = $title')
    fi

    if [[ -n "$description" ]]; then
        update_json=$(echo "$update_json" | jq --arg desc "$description" '.description = $desc')
    fi

    if [[ -n "$categories" ]]; then
        local categories_json
        categories_json=$(echo "$categories" | jq -R 'split(",") | map(gsub("^\\s+|\\s+$";""))')
        update_json=$(echo "$update_json" | jq --argjson cats "$categories_json" '.categories = $cats')
    fi

    api_request "PUT" "/api/snippets/$id" "$update_json"
}

# Delete snippet
delete_snippet() {
    local id="$1"

    echo "Are you sure you want to delete snippet $id? (y/N) " >&2
    read -r confirm

    if [[ "$confirm" != "y" && "$confirm" != "Y" ]]; then
        echo "Deletion cancelled" >&2
        exit 0
    fi

    api_request "DELETE" "/api/snippets/$id"
}

# Create share link
create_share() {
    local snippet_id="$1"
    shift

    local protected="false"
    local expires_in="0"

    while [[ $# -gt 0 ]]; do
        case "$1" in
            --protected) protected="true"; shift ;;
            --expires) expires_in="$2"; shift 2 ;;
            *) echo "Unknown option: $1" >&2; exit 1 ;;
        esac
    done

    local share_json
    share_json=$(jq -n \
        --arg sid "$snippet_id" \
        --argjson protected "$protected" \
        --arg expires "$expires_in" \
        '{
            snippetId: ($sid | tonumber),
            requiresAuth: $protected,
            expiresIn: ($expires | tonumber)
        }')

    api_request "POST" "/api/share" "$share_json"
}

# List shares for snippet
list_shares() {
    local snippet_id="$1"
    api_request "GET" "/api/share/snippet/$snippet_id"
}

# Delete share
delete_share() {
    local share_id="$1"
    api_request "DELETE" "/api/share/$share_id"
}

# View shared snippet
view_share() {
    local share_id="$1"
    api_request "GET" "/api/share/$share_id"
}

# === Main Script ===

main() {
    for cmd in curl jq; do
        if ! command -v "$cmd" >/dev/null 2>&1; then
            echo "ERROR: Required command not found: $cmd" >&2
            exit 1
        fi
    done

    # Show help without requiring credentials
    if [[ $# -eq 0 ]] || [[ "${1:-}" == "--help" ]] || [[ "${1:-}" == "-h" ]]; then
        usage
        exit 0
    fi

    init_config

    local command="$1"
    shift

    case "$command" in
        list)
            list_snippets
            ;;
        search)
            if [[ $# -eq 0 ]]; then
                echo "ERROR: search requires a query" >&2
                exit 1
            fi

            if [[ "$1" == "--category" ]]; then
                search_snippets "" "$2"
            else
                search_snippets "$1"
            fi
            ;;
        get)
            if [[ $# -eq 0 ]]; then
                echo "ERROR: get requires snippet ID" >&2
                exit 1
            fi
            get_snippet "$1"
            ;;
        create)
            create_snippet "$@"
            ;;
        push)
            push_snippet "$@"
            ;;
        update)
            if [[ $# -eq 0 ]]; then
                echo "ERROR: update requires snippet ID" >&2
                exit 1
            fi
            update_snippet "$@"
            ;;
        delete)
            if [[ $# -eq 0 ]]; then
                echo "ERROR: delete requires snippet ID" >&2
                exit 1
            fi
            delete_snippet "$1"
            ;;
        share)
            if [[ $# -eq 0 ]]; then
                echo "ERROR: share requires snippet ID" >&2
                exit 1
            fi
            create_share "$@"
            ;;
        shares)
            if [[ $# -eq 0 ]]; then
                echo "ERROR: shares requires snippet ID" >&2
                exit 1
            fi
            list_shares "$1"
            ;;
        unshare)
            if [[ $# -eq 0 ]]; then
                echo "ERROR: unshare requires share ID" >&2
                exit 1
            fi
            delete_share "$1"
            ;;
        view-share)
            if [[ $# -eq 0 ]]; then
                echo "ERROR: view-share requires share ID" >&2
                exit 1
            fi
            view_share "$1"
            ;;
        *)
            echo "ERROR: Unknown command: $command" >&2
            usage
            exit 1
            ;;
    esac
}

main "$@"
