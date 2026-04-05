# Claude Homelab — project recipes

set shell := ["bash", "-euo", "pipefail", "-c"]

# List available recipes
default:
    @just --list

# ─── Validation ──────────────────────────────────────────────────────

# Comprehensive homelab validation
validate:
    #!/usr/bin/env bash
    set -uo pipefail
    pass=0; warn=0; fail=0
    ok()   { pass=$((pass+1)); echo "  ✓ $1"; }
    skip() { warn=$((warn+1)); echo "  ⚠ $1"; }
    bad()  { fail=$((fail+1)); echo "  ✗ $1"; }

    # ── Plugin → env var mapping ──
    declare -A PLUGIN_VARS=(
        ["plex"]="PLEX_URL PLEX_TOKEN"
        ["radarr"]="RADARR_URL RADARR_API_KEY"
        ["sonarr"]="SONARR_URL SONARR_API_KEY"
        ["prowlarr"]="PROWLARR_URL PROWLARR_API_KEY"
        ["tautulli"]="TAUTULLI_URL TAUTULLI_API_KEY"
        ["qbittorrent"]="QBITTORRENT_URL QBITTORRENT_USERNAME QBITTORRENT_PASSWORD"
        ["sabnzbd"]="SABNZBD_URL SABNZBD_API_KEY"
        ["tailscale"]="TAILSCALE_API_KEY TAILSCALE_TAILNET"
        ["linkding"]="LINKDING_URL LINKDING_API_KEY"
        ["memos"]="MEMOS_URL MEMOS_API_TOKEN"
        ["bytestash"]="BYTESTASH_URL BYTESTASH_API_KEY"
        ["paperless-ngx"]="PAPERLESS_URL PAPERLESS_API_TOKEN"
        ["radicale"]="RADICALE_URL RADICALE_USERNAME RADICALE_PASSWORD"
        ["overseerr-mcp"]="OVERSEERR_URL OVERSEERR_API_KEY"
        ["unraid-mcp"]="UNRAID_SERVER1_URL UNRAID_SERVER1_API_KEY"
        ["unifi-mcp"]="UNIFI_URL UNIFI_USERNAME UNIFI_PASSWORD"
        ["gotify-mcp"]="GOTIFY_URL GOTIFY_TOKEN"
        ["swag-mcp"]="SWAG_HOST SWAG_CONTAINER_NAME"
    )
    # Plugin → primary URL var (for connectivity checks)
    declare -A PLUGIN_URL=(
        ["plex"]="PLEX_URL"
        ["radarr"]="RADARR_URL"
        ["sonarr"]="SONARR_URL"
        ["prowlarr"]="PROWLARR_URL"
        ["tautulli"]="TAUTULLI_URL"
        ["qbittorrent"]="QBITTORRENT_URL"
        ["sabnzbd"]="SABNZBD_URL"
        ["linkding"]="LINKDING_URL"
        ["memos"]="MEMOS_URL"
        ["bytestash"]="BYTESTASH_URL"
        ["paperless-ngx"]="PAPERLESS_URL"
        ["radicale"]="RADICALE_URL"
        ["overseerr-mcp"]="OVERSEERR_URL"
        ["unraid-mcp"]="UNRAID_SERVER1_URL"
        ["unifi-mcp"]="UNIFI_URL"
        ["gotify-mcp"]="GOTIFY_URL"
    )
    # External MCP plugin → default port
    declare -A MCP_PORTS=(
        ["overseerr-mcp"]="9151"
        ["unraid-mcp"]="6970"
        ["unifi-mcp"]="8001"
        ["gotify-mcp"]="9158"
        ["swag-mcp"]="8000"
        ["synapse-mcp"]="3000"
        ["arcane-mcp"]="44332"
        ["syslog-mcp"]="3100"
    )
    # MCP URL var names in ~/.claude/settings.json
    declare -A MCP_URL_VARS=(
        ["overseerr-mcp"]="OVERSEERR_MCP_URL"
        ["unraid-mcp"]="UNRAID_MCP_URL"
        ["unifi-mcp"]="UNIFI_MCP_URL"
        ["gotify-mcp"]="GOTIFY_MCP_URL"
        ["swag-mcp"]="SWAG_MCP_URL"
        ["synapse-mcp"]="SYNAPSE_MCP_URL"
        ["arcane-mcp"]="ARCANE_MCP_URL"
        ["syslog-mcp"]="SYSLOG_MCP_URL"
    )

    # Load .env into memory (keys only for checking, values for connectivity)
    env_file="$HOME/.claude-homelab/.env"
    declare -A ENV_VALS=()
    if [[ -f "$env_file" ]]; then
        while IFS='=' read -r key val; do
            [[ -z "$key" || "$key" =~ ^# ]] && continue
            key=$(echo "$key" | xargs)
            val=$(echo "$val" | xargs | sed 's/^["'\''"]//;s/["'\''"]$//')
            ENV_VALS["$key"]="$val"
        done < "$env_file"
    fi

    # Get installed marketplace plugins
    installed_file="$HOME/.claude/plugins/installed_plugins.json"
    marketplace=".claude-plugin/marketplace.json"
    declare -A INSTALLED=()
    if [[ -f "$installed_file" ]]; then
        while IFS= read -r p; do
            INSTALLED["$p"]=1
        done < <(jq -r '.plugins | keys[]' "$installed_file" | grep '@claude-homelab$' | sed 's/@claude-homelab$//')
    fi

    # ═══════════════════════════════════════
    echo "══════════════════════════════════════════"
    echo "  Claude Homelab Validation"
    echo "══════════════════════════════════════════"
    echo ""

    # ── 1. Environment ──
    echo "── Environment ──────────────────────────"
    if [[ -f "$env_file" ]]; then
        ok ".env exists at $env_file"
        perms=$(stat -c '%a' "$env_file")
        if [[ "$perms" == "600" ]]; then
            ok ".env permissions: $perms"
        else
            bad ".env permissions: $perms (should be 600)"
        fi
        count=${#ENV_VALS[@]}
        ok ".env has $count configured variables"
    else
        bad ".env not found at $env_file"
    fi
    if [[ -f "$HOME/.claude-homelab/load-env.sh" ]]; then
        ok "load-env.sh exists"
    else
        bad "load-env.sh missing from ~/.claude-homelab/"
    fi
    echo ""

    # ── 2. Versions ──
    echo "── Versions ─────────────────────────────"
    version_files="package.json Cargo.toml pyproject.toml .claude-plugin/plugin.json .codex-plugin/plugin.json gemini-extension.json README.md CLAUDE.md"
    versions=()
    for f in $version_files; do
        [[ ! -f "$f" ]] && continue
        case "$f" in
            *.json) v=$(grep -m1 '"version"' "$f" | sed 's/.*"version"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/') ;;
            *.toml) v=$(grep -m1 '^version' "$f" | sed 's/.*=[[:space:]]*"\([^"]*\)".*/\1/') ;;
            README.md) v=$(grep -m1 '^Version:' "$f" | sed 's/Version:[[:space:]]*//') ;;
            CLAUDE.md) v=$(grep -m1 '^\*\*Version:\*\*' "$f" | sed 's/\*\*Version:\*\*[[:space:]]*//') ;;
        esac
        [[ -n "${v:-}" ]] && versions+=("$f=$v")
    done
    if [[ ${#versions[@]} -gt 0 ]]; then
        first_ver="${versions[0]#*=}"
        drift=false
        for entry in "${versions[@]}"; do
            v="${entry#*=}"
            [[ "$v" != "$first_ver" ]] && drift=true && break
        done
        if $drift; then
            bad "Version drift detected:"
            for entry in "${versions[@]}"; do echo "    ${entry%%=*}: ${entry#*=}"; done
        else
            ok "All versions in sync: $first_ver"
        fi
    fi
    echo ""

    # ── 3. Installed Plugins & Env Vars ──
    installed_count=${#INSTALLED[@]}
    echo "── Installed Plugins ($installed_count from marketplace) ──"
    if [[ $installed_count -eq 0 ]]; then
        skip "No marketplace plugins found in installed_plugins.json"
    else
        for plugin in $(echo "${!INSTALLED[@]}" | tr ' ' '\n' | sort); do
            vars="${PLUGIN_VARS[$plugin]:-}"
            if [[ -z "$vars" ]]; then
                ok "$plugin (no env vars required)"
                continue
            fi
            missing=()
            present=()
            for var in $vars; do
                val="${ENV_VALS[$var]:-}"
                if [[ -z "$val" || "$val" =~ ^your[_-] ]]; then
                    missing+=("$var")
                else
                    present+=("$var")
                fi
            done
            if [[ ${#missing[@]} -eq 0 ]]; then
                ok "$plugin: all ${#present[@]} env vars set"
            else
                bad "$plugin: missing ${missing[*]}"
            fi
        done
    fi
    echo ""

    # ── 4. Connectivity ──
    echo "── Connectivity ─────────────────────────"
    for plugin in $(echo "${!INSTALLED[@]}" | tr ' ' '\n' | sort); do
        url_var="${PLUGIN_URL[$plugin]:-}"
        [[ -z "$url_var" ]] && continue
        url="${ENV_VALS[$url_var]:-}"
        if [[ -z "$url" || "$url" =~ ^your[_-] ]]; then
            skip "$plugin — $url_var not configured"
            continue
        fi
        code=$(curl -sk -o /dev/null -w '%{http_code}' --max-time 5 "$url" 2>/dev/null || echo "000")
        if [[ "$code" =~ ^[23] ]]; then
            ok "$plugin ($url) → $code"
        elif [[ "$code" == "000" ]]; then
            bad "$plugin ($url) → unreachable"
        else
            skip "$plugin ($url) → $code"
        fi
    done
    echo ""

    # ── 5. MCP Servers ──
    echo "── MCP Servers ──────────────────────────"
    for plugin in $(echo "${!MCP_PORTS[@]}" | tr ' ' '\n' | sort); do
        [[ -z "${INSTALLED[$plugin]:-}" ]] && continue
        port="${MCP_PORTS[$plugin]}"
        p_under="${plugin//-/_}"

        # Check Docker
        docker_running=false
        if docker ps -q -f "name=^${plugin}$" 2>/dev/null | grep -q .; then
            docker_running=true
        fi

        # Check local process
        local_count=$(ps aux 2>/dev/null | grep -E "(${plugin}|${p_under})" | grep -v -E 'grep|just |docker|emulator|qemu' | wc -l)

        if $docker_running && [[ $local_count -gt 0 ]]; then
            ok "$plugin: docker=running, local=$local_count process(es), port=$port"
        elif $docker_running; then
            ok "$plugin: docker=running, port=$port"
        elif [[ $local_count -gt 0 ]]; then
            ok "$plugin: local=$local_count process(es)"
        else
            # Neither running — check if port is free
            if ss -tlnp 2>/dev/null | grep -q ":${port} "; then
                bad "$plugin: not running but port $port is occupied"
            else
                skip "$plugin: not running (port $port is free)"
            fi
        fi
    done
    echo ""

    # ── 6. MCP Config ──
    echo "── MCP Config ───────────────────────────"
    # Claude settings.json
    settings="$HOME/.claude/settings.json"
    if [[ -f "$settings" ]]; then
        mcp_count=0
        for plugin in $(echo "${!MCP_URL_VARS[@]}" | tr ' ' '\n' | sort); do
            [[ -z "${INSTALLED[$plugin]:-}" ]] && continue
            var="${MCP_URL_VARS[$plugin]}"
            if jq -e ".env.\"$var\"" "$settings" &>/dev/null; then
                mcp_count=$((mcp_count+1))
            else
                bad "Claude settings.json missing $var for $plugin"
            fi
        done
        [[ $mcp_count -gt 0 ]] && ok "Claude: $mcp_count MCP URLs configured in settings.json"
    else
        bad "Claude settings.json not found"
    fi

    # Codex plugin
    if [[ -f ".codex-plugin/plugin.json" ]]; then
        ok "Codex: .codex-plugin/plugin.json exists"
    else
        skip "Codex: .codex-plugin/plugin.json not found"
    fi

    # Gemini extension
    if [[ -f "gemini-extension.json" ]]; then
        ok "Gemini: gemini-extension.json exists"
    else
        skip "Gemini: gemini-extension.json not found"
    fi

    # Workspace .mcp.json files
    mcp_json_count=0
    mcp_json_missing=()
    for plugin in $(echo "${!MCP_PORTS[@]}" | tr ' ' '\n' | sort); do
        [[ -z "${INSTALLED[$plugin]:-}" ]] && continue
        [[ "$plugin" == "plugin-lab" ]] && continue
        workspace="$HOME/workspace/$plugin"
        if [[ -f "$workspace/.mcp.json" ]]; then
            mcp_json_count=$((mcp_json_count+1))
        else
            mcp_json_missing+=("$plugin")
        fi
    done
    [[ $mcp_json_count -gt 0 ]] && ok "Workspace: $mcp_json_count repos have .mcp.json"
    for m in "${mcp_json_missing[@]:-}"; do
        [[ -n "$m" ]] && skip "Workspace: $m missing .mcp.json"
    done
    echo ""

    # ── Summary ──
    total=$((pass+warn+fail))
    echo "──────────────────────────────────────────"
    echo "Results: $pass passed, $warn warnings, $fail failed ($total checks)"
    [[ $fail -gt 0 ]] && exit 1
    exit 0

# ─── Version Management ──────────────────────────────────────────────

# Files that may carry a version field (checked only if they exist)
_version_files := "package.json Cargo.toml pyproject.toml .claude-plugin/plugin.json .codex-plugin/plugin.json gemini-extension.json README.md CLAUDE.md"

# Extract version from a single file (prints "file version" or nothing)
[private]
_extract_version file:
    #!/usr/bin/env bash
    f="{{file}}"
    [[ ! -f "$f" ]] && exit 0
    case "$f" in
        package.json|.claude-plugin/plugin.json|.codex-plugin/plugin.json|gemini-extension.json)
            v=$(grep -m1 '"version"' "$f" | sed 's/.*"version"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/')
            ;;
        Cargo.toml|pyproject.toml)
            v=$(grep -m1 '^version' "$f" | sed 's/.*=[[:space:]]*"\([^"]*\)".*/\1/')
            ;;
        README.md)
            v=$(grep -m1 '^Version:' "$f" | sed 's/Version:[[:space:]]*//')
            ;;
        CLAUDE.md)
            v=$(grep -m1 '^\*\*Version:\*\*' "$f" | sed 's/\*\*Version:\*\*[[:space:]]*//')
            ;;
        *) exit 0 ;;
    esac
    [[ -n "${v:-}" ]] && printf "%-40s %s\n" "$f" "$v"

# Check all version-bearing files for drift
version-check:
    #!/usr/bin/env bash
    set -euo pipefail
    versions=()
    files=()
    echo "File                                     Version"
    echo "──────────────────────────────────────── ───────"
    for f in {{_version_files}}; do
        [[ ! -f "$f" ]] && continue
        line=$(just _extract_version "$f")
        [[ -z "$line" ]] && continue
        echo "$line"
        v=$(echo "$line" | awk '{print $NF}')
        versions+=("$v")
        files+=("$f")
    done
    if [[ ${#versions[@]} -eq 0 ]]; then
        echo "No version-bearing files found."
        exit 0
    fi
    # Check for drift
    first="${versions[0]}"
    drift=false
    for v in "${versions[@]}"; do
        if [[ "$v" != "$first" ]]; then
            drift=true
            break
        fi
    done
    echo ""
    if $drift; then
        echo "DRIFT DETECTED — versions are not in sync."
        echo "Run: just version-sync <version>"
        exit 1
    else
        echo "All versions in sync: $first"
    fi

# Sync all version-bearing files to the given version
version-sync version:
    #!/usr/bin/env bash
    set -euo pipefail
    v="{{version}}"
    # Validate semver-ish format
    if ! [[ "$v" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
        echo "Error: version must be semver (e.g. 1.3.0), got: $v"
        exit 1
    fi
    for f in {{_version_files}}; do
        [[ ! -f "$f" ]] && continue
        case "$f" in
            package.json|.claude-plugin/plugin.json|.codex-plugin/plugin.json|gemini-extension.json)
                if grep -q '"version"' "$f"; then
                    sed -i 's/"version"[[:space:]]*:[[:space:]]*"[^"]*"/"version": "'"$v"'"/' "$f"
                    echo "Updated $f → $v"
                fi
                ;;
            Cargo.toml)
                if grep -q '^version' "$f"; then
                    sed -i 's/^version[[:space:]]*=.*/version = "'"$v"'"/' "$f"
                    echo "Updated $f → $v"
                fi
                ;;
            pyproject.toml)
                if grep -q '^version' "$f"; then
                    sed -i 's/^version[[:space:]]*=.*/version = "'"$v"'"/' "$f"
                    echo "Updated $f → $v"
                fi
                ;;
            README.md)
                if grep -q '^Version:' "$f"; then
                    sed -i 's/^Version:.*/Version: '"$v"'/' "$f"
                    echo "Updated $f → $v"
                fi
                ;;
            CLAUDE.md)
                if grep -q '^\*\*Version:\*\*' "$f"; then
                    sed -i 's/^\*\*Version:\*\*.*/\*\*Version:\*\* '"$v"'/' "$f"
                    echo "Updated $f → $v"
                fi
                ;;
        esac
    done
    echo ""
    echo "All files synced to $v"

# ─── Plugin Catalog ──────────────────────────────────────────────────

# List all marketplace plugins with repo and resolved local path
plugins:
    #!/usr/bin/env bash
    set -euo pipefail
    manifest=".claude-plugin/marketplace.json"
    if [[ ! -f "$manifest" ]]; then
        echo "Error: $manifest not found"
        exit 1
    fi
    # Known local path overrides (repo name != directory name)
    declare -A path_overrides=()
    printf "%-24s %-10s %-30s %s\n" "PLUGIN" "TYPE" "REPO" "LOCAL PATH"
    printf "%-24s %-10s %-30s %s\n" "────────────────────────" "──────────" "──────────────────────────────" "──────────────────────────────"
    jq -r '.plugins[] |
        if (.source | type) == "string" then
            "\(.name)\tlocal\tjmagar/claude-homelab\t\(.source)"
        else
            "\(.name)\t\(.source.source)\t\(.source.repo // .source.path // "-")\t-"
        end' "$manifest" | while IFS=$'\t' read -r name type repo _; do
        if [[ "$type" == "local" ]]; then
            # Local plugins — resolve relative to this repo
            local_path="$HOME/claude-homelab"
            if [[ "$name" != "homelab-core" ]]; then
                local_path="$HOME/claude-homelab/skills/$name"
            fi
        else
            # External plugins — check overrides, then default to ~/workspace/<repo-name>
            if [[ -n "${path_overrides[$repo]:-}" ]]; then
                local_path="${path_overrides[$repo]}"
            else
                local_path="$HOME/workspace/$(basename "$repo")"
            fi
        fi
        # Check existence
        if [[ -d "$local_path" ]]; then
            status=""
        else
            status=" (missing)"
        fi
        printf "%-24s %-10s %-30s %s\n" "$name" "$type" "$repo" "${local_path}${status}"
    done

# ─── Skill Validation ────────────────────────────────────────────────

# Validate all skills across all marketplace plugins
validate-skills:
    #!/usr/bin/env bash
    set -euo pipefail
    manifest=".claude-plugin/marketplace.json"
    declare -A overrides=()
    pass=0; fail=0; skip=0
    errors=()

    validate_dir() {
        local plugin="$1" dir="$2"
        local found=false
        while IFS= read -r skill_dir; do
            [[ ! -f "$skill_dir/SKILL.md" ]] && continue
            found=true
            local name
            name="$plugin/$(basename "$skill_dir")"
            echo "── $name"
            if output=$(npx skills-ref validate "$skill_dir" 2>&1); then
                echo "   PASS"
                pass=$((pass + 1))
            else
                echo "   FAIL"
                echo "$output" | sed 's/^/   /'
                fail=$((fail + 1))
                errors+=("$name")
            fi
        done < <(find "$dir" -mindepth 1 -maxdepth 1 -type d 2>/dev/null | sort)
        if ! $found; then
            skip=$((skip + 1))
        fi
    }

    # Local skills in this repo
    echo "═══ homelab-core (local) ═══"
    validate_dir "homelab-core" "skills"
    echo ""

    # External marketplace plugins
    plugins=$(jq -r '.plugins[] | select(.source | type == "object") | .name' "$manifest")
    for plugin in $plugins; do
        dir="${overrides[$plugin]:-$HOME/workspace/$plugin}"
        skills_dir="$dir/skills"
        if [[ ! -d "$skills_dir" ]]; then
            skip=$((skip + 1))
            continue
        fi
        echo "═══ $plugin ($dir) ═══"
        validate_dir "$plugin" "$skills_dir"
        echo ""
    done

    total=$((pass + fail))
    echo "Results: $pass passed, $fail failed, $skip plugins with no skills ($total total)"
    if [[ $fail -gt 0 ]]; then
        echo "Failed: ${errors[*]}"
        exit 1
    fi

# Validate a single skill (local: "plex", external: "jmagar/synapse-mcp/synapse")
validate-skill name:
    #!/usr/bin/env bash
    set -euo pipefail
    input="{{name}}"
    declare -A overrides=()
    # Count slashes to determine format
    slashes="${input//[^\/]/}"
    if [[ ${#slashes} -ge 2 ]]; then
        # jmagar/repo/skill format
        repo=$(echo "$input" | cut -d/ -f1-2)
        skill=$(echo "$input" | cut -d/ -f3-)
        repo_name=$(basename "$repo")
        dir="${overrides[$repo]:-$HOME/workspace/$repo_name}/skills/$skill"
    elif [[ "$input" == */* ]]; then
        # repo/skill shorthand (without owner)
        repo="${input%%/*}"
        skill="${input#*/}"
        dir="${overrides[jmagar/$repo]:-$HOME/workspace/$repo}/skills/$skill"
    else
        # local skill
        dir="skills/$input"
    fi
    if [[ ! -f "$dir/SKILL.md" ]]; then
        echo "Error: no SKILL.md at $dir"
        exit 1
    fi
    npx skills-ref validate "$dir"

# ─── Testing ─────────────────────────────────────────────────────────

_test_helpers := ""

# Run unit tests for a plugin (or "all") — pytest, vitest, cargo test
test-unit name="all":
    #!/usr/bin/env bash
    set -uo pipefail
    manifest=".claude-plugin/marketplace.json"
    declare -A overrides=()
    pass=0; fail=0; skip=0

    run_unit() {
        local plugin="$1"
        local dir="${overrides[$plugin]:-$HOME/workspace/$plugin}"
        [[ ! -d "$dir" ]] && return

        # Detect test runner
        local runner=""
        if [[ -f "$dir/pyproject.toml" ]] && [[ -d "$dir/tests" ]]; then
            runner="pytest"
        elif [[ -f "$dir/vitest.config.ts" ]]; then
            runner="vitest"
        elif [[ -f "$dir/Cargo.toml" ]] && [[ -d "$dir/tests" || -n "$(find "$dir/src" -name '*test*' 2>/dev/null | head -1)" ]]; then
            runner="cargo"
        fi

        if [[ -z "$runner" ]]; then
            skip=$((skip+1))
            return
        fi

        echo "━━━ $plugin ($runner) ━━━"
        local result=0
        case "$runner" in
            pytest)
                (cd "$dir" && uv run pytest tests/ -x -q --tb=short 2>&1) || result=$?
                ;;
            vitest)
                (cd "$dir" && npx vitest run --reporter=verbose 2>&1) || result=$?
                ;;
            cargo)
                (cd "$dir" && cargo test 2>&1) || result=$?
                ;;
        esac

        if [[ $result -eq 0 ]]; then
            pass=$((pass+1))
        else
            fail=$((fail+1))
        fi
        echo ""
    }

    if [[ "{{name}}" != "all" ]]; then
        run_unit "{{name}}"
        exit $?
    fi

    plugins=$(jq -r '.plugins[] | select(.source | type == "object") | .name' "$manifest")
    for plugin in $plugins; do
        run_unit "$plugin"
    done

    total=$((pass+fail+skip))
    echo "──────────────────────────────────────────"
    echo "Unit tests: $pass passed, $fail failed, $skip skipped ($total plugins)"
    [[ $fail -gt 0 ]] && exit 1

# Run smoke/live integration tests for a plugin (or "all")
test-live name="all":
    #!/usr/bin/env bash
    set -uo pipefail
    manifest=".claude-plugin/marketplace.json"
    declare -A overrides=()

    find_test_script() {
        local dir="$1"
        for f in "$dir/scripts/smoke-test.sh" "$dir/tests/test_live.sh" "$dir/tests/test-mcporter.sh"; do
            if [[ -x "$f" ]]; then
                echo "$f"
                return
            fi
        done
    }

    run_test() {
        local plugin="$1"
        local dir="${overrides[$plugin]:-$HOME/workspace/$plugin}"
        if [[ ! -d "$dir" ]]; then
            echo "⚠ $plugin: workspace dir not found ($dir)"
            return 1
        fi
        local script
        script=$(find_test_script "$dir")
        if [[ -z "$script" ]]; then
            echo "⚠ $plugin: no test script found"
            return 1
        fi
        echo "━━━ $plugin ($script) ━━━"
        (cd "$dir" && bash "$script") || return 1
        echo ""
    }

    if [[ "{{name}}" != "all" ]]; then
        run_test "{{name}}"
        exit $?
    fi

    pass=0; fail=0; skip=0
    plugins=$(jq -r '.plugins[] | select(.source | type == "object") | .name' "$manifest")
    for plugin in $plugins; do
        dir="${overrides[$plugin]:-$HOME/workspace/$plugin}"
        script=$(find_test_script "$dir" 2>/dev/null)
        if [[ -z "$script" ]]; then
            skip=$((skip+1))
            continue
        fi
        echo "━━━ $plugin ━━━"
        if (cd "$dir" && bash "$script"); then
            pass=$((pass+1))
        else
            fail=$((fail+1))
        fi
        echo ""
    done

    total=$((pass+fail+skip))
    echo "──────────────────────────────────────────"
    echo "Live tests: $pass passed, $fail failed, $skip skipped ($total plugins)"
    [[ $fail -gt 0 ]] && exit 1

# Run all tests (unit + live) for a plugin or all
test name="all":
    #!/usr/bin/env bash
    set -uo pipefail
    echo "══════════════════════════════════════════"
    echo "  Unit Tests"
    echo "══════════════════════════════════════════"
    just test-unit "{{name}}" || true
    echo ""
    echo "══════════════════════════════════════════"
    echo "  Live / Smoke Tests"
    echo "══════════════════════════════════════════"
    just test-live "{{name}}"

# ─── MCP Security Audit ──────────────────────────────────────────────

# Audit security of all configured MCP endpoints
mcp-security:
    #!/usr/bin/env bash
    set -uo pipefail
    pass=0; warn=0; fail=0
    ok()   { pass=$((pass+1)); echo "  ✓ $1"; }
    skip() { warn=$((warn+1)); echo "  ⚠ $1"; }
    bad()  { fail=$((fail+1)); echo "  ✗ $1"; }

    settings="$HOME/.claude/settings.json"
    env_file="$HOME/.claude-homelab/.env"

    if [[ ! -f "$settings" ]]; then
        echo "Error: ~/.claude/settings.json not found"
        exit 1
    fi

    # Load .env for token and no-auth checks
    declare -A ENV=()
    if [[ -f "$env_file" ]]; then
        while IFS='=' read -r key val; do
            [[ -z "$key" || "$key" =~ ^# ]] && continue
            key=$(echo "$key" | xargs)
            val=$(echo "$val" | xargs | sed 's/^["'\''"]//;s/["'\''"]$//')
            ENV["$key"]="$val"
        done < "$env_file"
    fi

    # Extract all MCP URLs from settings.json env block
    declare -A MCP_URLS=()
    while IFS=$'\t' read -r var url; do
        name=$(echo "$var" | sed 's/_MCP_URL$//' | tr '[:upper:]' '[:lower:]')
        MCP_URLS["$name"]="$url"
    done < <(jq -r '.env // {} | to_entries[] | select(.key | endswith("_MCP_URL")) | [.key, .value] | @tsv' "$settings")

    if [[ ${#MCP_URLS[@]} -eq 0 ]]; then
        echo "No MCP URLs found in settings.json"
        exit 0
    fi

    echo "══════════════════════════════════════════"
    echo "  MCP Security Audit"
    echo "══════════════════════════════════════════"
    echo ""
    echo "Found ${#MCP_URLS[@]} MCP endpoints"
    echo ""

    for name in $(echo "${!MCP_URLS[@]}" | tr ' ' '\n' | sort); do
        url="${MCP_URLS[$name]}"
        base_url="${url%/mcp}"
        prefix=$(echo "$name" | tr '[:lower:]' '[:upper:]' | tr '-' '_')
        token_var="${prefix}_MCP_TOKEN"
        noauth_var="${prefix}_MCP_NO_AUTH"
        token_val="${ENV[$token_var]:-}"
        noauth_val="${ENV[$noauth_var]:-}"

        echo "── $name ($url) ──"

        # ── Config flags ──
        if [[ "$noauth_val" == "true" || "$noauth_val" == "1" ]]; then
            skip "Config: ${noauth_var}=${noauth_val} — server-side auth DISABLED"
            echo "    ↳ Server accepts all requests without authentication."
            echo "    ↳ Only safe if behind an OAuth gateway or on a private network."
        fi
        if [[ -n "$token_val" ]]; then
            ok "Config: ${token_var} is set (bearer token configured)"
        else
            if [[ "$noauth_val" != "true" && "$noauth_val" != "1" ]]; then
                skip "Config: ${token_var} not set and ${noauth_var} not set"
            fi
        fi

        # ── 1. TLS ──
        if [[ "$url" =~ ^https:// ]]; then
            ok "TLS: HTTPS"
            host=$(echo "$url" | sed 's|https://||;s|/.*||')
            cert_expiry=$(echo | openssl s_client -servername "$host" -connect "$host:443" 2>/dev/null | openssl x509 -noout -enddate 2>/dev/null | sed 's/notAfter=//')
            if [[ -n "$cert_expiry" ]]; then
                expiry_epoch=$(date -d "$cert_expiry" +%s 2>/dev/null || echo 0)
                now_epoch=$(date +%s)
                days_left=$(( (expiry_epoch - now_epoch) / 86400 ))
                if [[ $days_left -lt 7 ]]; then
                    bad "TLS cert expires in $days_left days"
                elif [[ $days_left -lt 30 ]]; then
                    skip "TLS cert expires in $days_left days"
                else
                    ok "TLS cert valid ($days_left days remaining)"
                fi
            fi
        else
            bad "TLS: plain HTTP — not encrypted"
        fi

        # ── 2. Unauthenticated probe ──
        unauth_code=$(curl -sk -o /dev/null -w '%{http_code}' --max-time 5 "$url" 2>/dev/null || echo "000")
        if [[ "$unauth_code" == "401" || "$unauth_code" == "403" ]]; then
            ok "Unauth probe: blocked ($unauth_code)"
        elif [[ "$unauth_code" =~ ^[23] ]]; then
            if [[ "$noauth_val" == "true" || "$noauth_val" == "1" ]]; then
                skip "Unauth probe: OPEN ($unauth_code) — expected (no-auth is on)"
            else
                bad "Unauth probe: OPEN ($unauth_code) — anyone can access this endpoint!"
                echo "    ↳ Set ${token_var} to enable bearer auth, or put behind an OAuth gateway."
            fi
        elif [[ "$unauth_code" == "000" ]]; then
            bad "Unauth probe: unreachable"
            echo ""
            continue
        else
            skip "Unauth probe: unexpected ($unauth_code)"
        fi

        # ── 3. Bearer token validation ──
        if [[ -n "$token_val" ]]; then
            bearer_code=$(curl -sk -o /dev/null -w '%{http_code}' --max-time 5 -H "Authorization: Bearer $token_val" "$url" 2>/dev/null || echo "000")
            if [[ "$bearer_code" =~ ^[23] ]]; then
                ok "Bearer auth: token accepted ($bearer_code)"
            elif [[ "$bearer_code" == "401" || "$bearer_code" == "403" ]]; then
                bad "Bearer auth: token REJECTED ($bearer_code) — check ${token_var}"
            else
                skip "Bearer auth: unexpected ($bearer_code)"
            fi
        fi

        # ── 4. WWW-Authenticate header ──
        www_auth=$(curl -sk -D- -o /dev/null --max-time 5 "$url" 2>/dev/null | grep -i '^www-authenticate:' | head -1)
        if [[ -n "$www_auth" ]]; then
            if echo "$www_auth" | grep -qi 'Bearer'; then
                ok "Scheme: Bearer"
                as_uri=$(echo "$www_auth" | grep -oP 'as_uri="[^"]*"' | sed 's/as_uri="//;s/"$//')
                [[ -n "$as_uri" ]] && ok "OAuth AS: $as_uri"
                res_meta=$(echo "$www_auth" | grep -oP 'resource_metadata="[^"]*"' | sed 's/resource_metadata="//;s/"$//')
                [[ -n "$res_meta" ]] && ok "Resource meta: $res_meta (RFC 9728)"
            elif echo "$www_auth" | grep -qi 'Basic'; then
                skip "Scheme: Basic (credentials in every request)"
            fi
        fi

        # ── 5. OAuth discovery ──
        oauth_meta=$(curl -sk --max-time 5 "$base_url/.well-known/oauth-authorization-server" 2>/dev/null)
        if echo "$oauth_meta" | jq -e '.issuer' &>/dev/null; then
            issuer=$(echo "$oauth_meta" | jq -r '.issuer')
            ok "OAuth: $issuer"

            pkce=$(echo "$oauth_meta" | jq -r '.code_challenge_methods_supported // [] | join(", ")')
            [[ -n "$pkce" && "$pkce" != "null" ]] && ok "PKCE: $pkce" || skip "PKCE: not advertised"

            rfc8707=$(echo "$oauth_meta" | jq -r '.resource_indicators_supported // false')
            [[ "$rfc8707" == "true" ]] && ok "RFC 8707: resource indicators" || skip "RFC 8707: not advertised"

            jwks_uri=$(echo "$oauth_meta" | jq -r '.jwks_uri // empty')
            if [[ -n "$jwks_uri" ]]; then
                jwks_code=$(curl -sk -o /dev/null -w '%{http_code}' --max-time 5 "$jwks_uri" 2>/dev/null || echo "000")
                [[ "$jwks_code" =~ ^[23] ]] && ok "JWKS: reachable" || bad "JWKS: unreachable ($jwks_code)"
            fi

            token_ep=$(echo "$oauth_meta" | jq -r '.token_endpoint // empty')
            if [[ -n "$token_ep" ]]; then
                token_code=$(curl -sk -o /dev/null -w '%{http_code}' --max-time 5 -X POST "$token_ep" 2>/dev/null || echo "000")
                [[ "$token_code" =~ ^[34] ]] && ok "Token endpoint: responds ($token_code)" || skip "Token endpoint: $token_code"
            fi
        else
            skip "OAuth: no discovery metadata"
        fi

        # ── 6. Protected resource metadata (RFC 9728) ──
        prm=$(curl -sk --max-time 5 "$base_url/.well-known/oauth-protected-resource" 2>/dev/null)
        if echo "$prm" | jq -e '.resource' &>/dev/null; then
            resource=$(echo "$prm" | jq -r '.resource')
            scopes=$(echo "$prm" | jq -r '.scopes_supported // [] | join(", ")')
            ok "Resource: $resource"
            [[ -n "$scopes" ]] && ok "Scopes: $scopes"
            [[ "$resource" == "$base_url" ]] && ok "Audience: matches endpoint" || skip "Audience: mismatch ($resource != $base_url)"
        fi

        # ── 7. Health endpoint ──
        health_code=$(curl -sk -o /dev/null -w '%{http_code}' --max-time 5 "$base_url/health" 2>/dev/null || echo "000")
        [[ "$health_code" == "200" ]] && ok "Health: /health public (200)" || skip "Health: /health returned $health_code"

        # ── Security posture summary ──
        has_oauth=false
        echo "$oauth_meta" | jq -e '.issuer' &>/dev/null && has_oauth=true
        echo -n "  → Posture: "
        if $has_oauth && [[ "$unauth_code" == "401" ]]; then
            echo "OAuth gateway + server auth ✓"
        elif $has_oauth && [[ "$noauth_val" == "true" || "$noauth_val" == "1" ]]; then
            echo "OAuth gateway only (server auth disabled)"
        elif [[ -n "$token_val" ]] && [[ "$unauth_code" == "401" ]]; then
            echo "Bearer token auth ✓"
        elif [[ "$noauth_val" == "true" || "$noauth_val" == "1" ]] && ! $has_oauth; then
            echo "NO AUTH — exposed without protection!"
        else
            echo "Unknown"
        fi

        echo ""
    done

    # Summary
    total=$((pass+warn+fail))
    echo "──────────────────────────────────────────"
    echo "Results: $pass passed, $warn warnings, $fail failed ($total checks)"
    [[ $fail -gt 0 ]] && exit 1
    exit 0

# Push MCP server credentials from ~/.claude-homelab/.env to GitHub Actions secrets
push-secrets repo="":
    #!/usr/bin/env bash
    set -euo pipefail
    if [[ -n "{{repo}}" ]]; then
        bash scripts/push-github-secrets.sh "{{repo}}"
    else
        bash scripts/push-github-secrets.sh
    fi

# ─── Docker Compose Operations ───────────────────────────────────────

# Resolve a plugin name to its compose directory
[private]
_compose_dir name:
    #!/usr/bin/env bash
    set -euo pipefail
    manifest=".claude-plugin/marketplace.json"
    # Known path overrides
    declare -A overrides=()
    plugin="{{name}}"
    # Check override first
    if [[ -n "${overrides[$plugin]:-}" ]]; then
        dir="${overrides[$plugin]}"
    else
        # Must be an external (github-sourced) plugin
        is_external=$(jq -r --arg p "$plugin" '.plugins[] | select(.name == $p) | select(.source | type == "object") | .name' "$manifest")
        if [[ -z "$is_external" ]]; then
            echo "Error: '$plugin' is not an external plugin (only external MCP plugins have compose files)" >&2
            exit 1
        fi
        dir="$HOME/workspace/$plugin"
    fi
    # Find compose file
    if [[ -f "$dir/docker-compose.yaml" || -f "$dir/docker-compose.yml" ]]; then
        echo "$dir"
    else
        echo "Error: no docker-compose file in $dir" >&2
        exit 1
    fi

# Run docker compose up -d for a plugin (or "all" for all external plugins)
up name="all":
    #!/usr/bin/env bash
    set -euo pipefail
    if [[ "{{name}}" == "all" ]]; then
        just _compose_each up -d
    else
        dir=$(just _compose_dir "{{name}}")
        echo "── up: {{name}} ($dir)"
        docker compose -f "$dir"/docker-compose.y*ml up -d
    fi

# Run docker compose down for a plugin (or "all")
down name="all":
    #!/usr/bin/env bash
    set -euo pipefail
    if [[ "{{name}}" == "all" ]]; then
        just _compose_each down
    else
        dir=$(just _compose_dir "{{name}}")
        echo "── down: {{name}} ($dir)"
        docker compose -f "$dir"/docker-compose.y*ml down
    fi

# Run docker compose build for a plugin (or "all")
build name="all":
    #!/usr/bin/env bash
    set -euo pipefail
    if [[ "{{name}}" == "all" ]]; then
        just _compose_each build
    else
        dir=$(just _compose_dir "{{name}}")
        echo "── build: {{name}} ($dir)"
        docker compose -f "$dir"/docker-compose.y*ml build
    fi

# Run docker compose restart for a plugin (or "all")
restart name="all":
    #!/usr/bin/env bash
    set -euo pipefail
    if [[ "{{name}}" == "all" ]]; then
        just _compose_each restart
    else
        dir=$(just _compose_dir "{{name}}")
        echo "── restart: {{name}} ($dir)"
        docker compose -f "$dir"/docker-compose.y*ml restart
    fi

# Run docker compose <cmd> across all external plugins
[private]
_compose_each +args:
    #!/usr/bin/env bash
    set -euo pipefail
    manifest=".claude-plugin/marketplace.json"
    declare -A overrides=()
    plugins=$(jq -r '.plugins[] | select(.source | type == "object") | .name' "$manifest")
    for plugin in $plugins; do
        dir="${overrides[$plugin]:-$HOME/workspace/$plugin}"
        compose=$(ls "$dir"/docker-compose.y*ml 2>/dev/null | head -1)
        if [[ -z "$compose" ]]; then
            echo "⚠ $plugin: no compose file in $dir, skipping"
            continue
        fi
        echo "── $plugin ($dir)"
        docker compose -f "$compose" {{args}} || echo "  ⚠ $plugin: command failed"
    done

# Show docker compose status for all external plugins
compose-status:
    #!/usr/bin/env bash
    set -uo pipefail
    manifest=".claude-plugin/marketplace.json"
    declare -A overrides=()
    plugins=$(jq -r '.plugins[] | select(.source | type == "object") | .name' "$manifest")
    printf "%-24s %-10s %s\n" "PLUGIN" "STATUS" "COMPOSE DIR"
    printf "%-24s %-10s %s\n" "────────────────────────" "──────────" "──────────────────────────────"
    for plugin in $plugins; do
        dir="${overrides[$plugin]:-$HOME/workspace/$plugin}"
        compose=$(ls "$dir"/docker-compose.y*ml 2>/dev/null | head -1)
        if [[ -z "$compose" ]]; then
            printf "%-24s %-10s %s\n" "$plugin" "no-file" "$dir"
            continue
        fi
        running=$(docker compose -f "$compose" ps --status running -q 2>/dev/null | wc -l || echo 0)
        if [[ $running -gt 0 ]]; then
            printf "%-24s %-10s %s\n" "$plugin" "up ($running)" "$dir"
        else
            printf "%-24s %-10s %s\n" "$plugin" "down" "$dir"
        fi
    done

# ─── MCP Server Logs ─────────────────────────────────────────────────

# List running MCP servers from our marketplace (Docker + local processes)
mcp-servers:
    #!/usr/bin/env bash
    set -euo pipefail
    manifest=".claude-plugin/marketplace.json"
    found=false

    # Build list of external plugin names from marketplace
    mapfile -t plugins < <(jq -r '.plugins[] | select(.source | type == "object") | .name' "$manifest")

    # Docker containers — exact name match against plugin names
    fmt='{{"{{"}}.Names}}\t{{"{{"}}.Status}}\t{{"{{"}}.Image}}'
    all_containers=$(docker ps --format "$fmt" 2>/dev/null || true)
    matched_containers=""
    for p in "${plugins[@]}"; do
        match=$(echo "$all_containers" | grep -P "^${p}\t" || true)
        [[ -n "$match" ]] && matched_containers+="$match"$'\n'
    done
    matched_containers=$(echo "$matched_containers" | sed '/^$/d' | sort -u)
    if [[ -n "$matched_containers" ]]; then
        found=true
        echo "Docker Containers"
        printf "  %-24s %-30s %s\n" "CONTAINER" "STATUS" "IMAGE"
        printf "  %-24s %-30s %s\n" "────────────────────────" "──────────────────────────────" "──────────────────────────────"
        echo "$matched_containers" | while IFS=$'\t' read -r name status image; do
            printf "  %-24s %-30s %s\n" "$name" "$status" "$image"
        done
        echo ""
    fi

    # Local processes — deduplicated by plugin name
    # Build patterns: both hyphen and underscore variants
    declare -A seen_plugins
    proc_lines=""
    for p in "${plugins[@]}"; do
        p_under="${p//-/_}"
        # Search for processes matching this plugin (exclude docker, grep, just, emulator)
        matches=$(ps aux 2>/dev/null | grep -E "(${p}|${p_under})" | grep -v -E 'grep|just mcp|chrome.devtools|docker|emulator|qemu' | head -1 || true)
        if [[ -n "$matches" ]]; then
            seen_plugins["$p"]=1
            read -r user pid cpu mem vsz rss tty stat start time cmd <<< "$matches"
            sanitized=$(echo "$cmd" | sed -E 's|://[^@]+@|://***@|g')
            short_cmd="${sanitized:0:100}"
            proc_lines+=$(printf "  %-8s %-24s %s\n" "$pid" "$p" "$short_cmd")$'\n'
        fi
    done
    proc_lines=$(echo "$proc_lines" | sed '/^$/d')
    if [[ -n "$proc_lines" ]]; then
        found=true
        echo "Local Processes"
        printf "  %-8s %-24s %s\n" "PID" "PLUGIN" "COMMAND"
        printf "  %-8s %-24s %s\n" "────────" "────────────────────────" "──────────────────────────────"
        echo "$proc_lines"
        echo ""
    fi

    if ! $found; then
        echo "No running marketplace MCP servers found."
    fi

# Show logs for a specific MCP server (by plugin name or container name)
mcp-logs name lines="50":
    #!/usr/bin/env bash
    set -euo pipefail
    container="{{name}}"
    # Try exact match first, then append -mcp suffix
    if ! docker ps -q -f "name=^${container}$" | grep -q .; then
        if docker ps -q -f "name=^${container}-mcp$" | grep -q .; then
            container="${container}-mcp"
        else
            echo "Error: no running container matching '{{name}}' or '{{name}}-mcp'"
            echo ""
            echo "Running MCP containers:"
            docker ps --format '  {{"{{"}}.Names}}' | grep -i mcp | sort || echo "  (none)"
            exit 1
        fi
    fi
    docker logs --tail "{{lines}}" "$container" 2>&1

# Show logs for ALL running MCP servers (last N lines each)
mcp-logs-all lines="20":
    #!/usr/bin/env bash
    set -euo pipefail
    containers=$(docker ps --format '{{"{{"}}.Names}}' | grep -i mcp | sort || true)
    if [[ -z "$containers" ]]; then
        echo "No running MCP containers found."
        exit 0
    fi
    for c in $containers; do
        echo "━━━ $c ━━━"
        docker logs --tail "{{lines}}" "$c" 2>&1 || echo "  (failed to read logs)"
        echo ""
    done

# ─── Symlinks ────────────────────────────────────────────────────────

# Ensure AGENTS.md and GEMINI.md symlink to CLAUDE.md everywhere
link-claude-md:
    #!/usr/bin/env bash
    set -euo pipefail
    count=0
    while IFS= read -r claude_file; do
        dir=$(dirname "$claude_file")
        for target in AGENTS.md GEMINI.md; do
            link="$dir/$target"
            if [[ -L "$link" ]] && [[ "$(readlink "$link")" == "CLAUDE.md" ]]; then
                echo "OK   $link → CLAUDE.md"
            else
                rm -f "$link"
                ln -s CLAUDE.md "$link"
                echo "LINK $link → CLAUDE.md"
                count=$((count + 1))
            fi
        done
    done < <(find . -name CLAUDE.md -not -path './.git/*' -not -path './.beads/*' -type f)
    echo ""
    if [[ $count -eq 0 ]]; then
        echo "All symlinks already in place."
    else
        echo "Created $count new symlink(s)."
    fi

# Setup all bash-path symlinks (skills, agents, commands → ~/.claude/) and ~/.claude-homelab/
symlinks:
    #!/usr/bin/env bash
    set -euo pipefail
    REPO_ROOT="$(pwd)"
    CLAUDE_DIR="$HOME/.claude"
    HOMELAB_DIR="$HOME/.claude-homelab"
    created=0; skipped=0; errors=0

    link() {
        local src="$1" tgt="$2"
        if [[ ! -e "$src" ]]; then
            echo "  ✗ source missing: $src"
            errors=$((errors+1))
            return
        fi
        mkdir -p "$(dirname "$tgt")"
        if [[ -L "$tgt" ]] && [[ "$(readlink -f "$tgt")" == "$(readlink -f "$src")" ]]; then
            echo "  OK $tgt"
            skipped=$((skipped+1))
        elif [[ -e "$tgt" ]]; then
            echo "  ⚠  exists (not overwriting): $tgt"
            skipped=$((skipped+1))
        else
            ln -sf "$src" "$tgt"
            echo "  ✓  $tgt → $src"
            created=$((created+1))
        fi
    }

    echo "── Skills → ~/.claude/skills/"
    mkdir -p "$CLAUDE_DIR/skills"
    while IFS= read -r skill_dir; do
        name=$(basename "$skill_dir")
        [[ "$name" == .* ]] && continue
        link "$skill_dir" "$CLAUDE_DIR/skills/$name"
    done < <(find "$REPO_ROOT/skills" -mindepth 1 -maxdepth 1 -type d | sort)

    echo ""
    echo "── Agents → ~/.claude/agents/"
    mkdir -p "$CLAUDE_DIR/agents"
    while IFS= read -r agent; do
        name=$(basename "$agent")
        link "$agent" "$CLAUDE_DIR/agents/$name"
    done < <(find "$REPO_ROOT/agents" -maxdepth 1 -type f -name "*.md" 2>/dev/null | sort)

    echo ""
    echo "── Commands → ~/.claude/commands/"
    mkdir -p "$CLAUDE_DIR/commands"
    # Single .md files
    while IFS= read -r cmd; do
        name=$(basename "$cmd")
        link "$cmd" "$CLAUDE_DIR/commands/$name"
    done < <(find "$REPO_ROOT/commands" -maxdepth 1 -type f -name "*.md" 2>/dev/null | sort)
    # Namespaced directories
    while IFS= read -r cmd_dir; do
        name=$(basename "$cmd_dir")
        link "$cmd_dir" "$CLAUDE_DIR/commands/$name"
    done < <(find "$REPO_ROOT/commands" -mindepth 1 -maxdepth 1 -type d 2>/dev/null | sort)

    echo ""
    echo "── ~/.claude-homelab/"
    mkdir -p "$HOMELAB_DIR"
    cp "$REPO_ROOT/scripts/load-env.sh" "$HOMELAB_DIR/load-env.sh"
    echo "  ✓  installed load-env.sh"
    if [[ ! -f "$HOMELAB_DIR/.env" ]]; then
        cp "$REPO_ROOT/.env.example" "$HOMELAB_DIR/.env"
        chmod 600 "$HOMELAB_DIR/.env"
        echo "  ✓  created .env from .env.example"
        echo ""
        echo "  ⚠  Next: edit ~/.claude-homelab/.env with your credentials"
    else
        echo "  OK .env already exists"
    fi

    echo ""
    echo "── CLAUDE.md symlinks"
    just link-claude-md

    echo "──────────────────────────────────────────"
    echo "Created: $created, Skipped: $skipped, Errors: $errors"
    [[ $errors -gt 0 ]] && exit 1
    exit 0

# ─── Dev Workflow ────────────────────────────────────────────────────

# Build and start a plugin in one shot
deploy name:
    #!/usr/bin/env bash
    set -euo pipefail
    echo "── build: {{name}}"
    just build "{{name}}"
    echo ""
    echo "── up: {{name}}"
    just up "{{name}}"

# Git pull + rebuild + restart across all (or one) external plugin repos
update name="all":
    #!/usr/bin/env bash
    set -euo pipefail
    manifest=".claude-plugin/marketplace.json"
    declare -A overrides=()

    do_update() {
        local plugin="$1"
        local dir="${overrides[$plugin]:-$HOME/workspace/$plugin}"
        if [[ ! -d "$dir" ]]; then
            echo "  ⚠ $plugin: workspace dir not found"
            return
        fi
        echo "━━━ $plugin ($dir) ━━━"
        # Git pull
        if [[ -d "$dir/.git" ]]; then
            echo "  git pull..."
            (cd "$dir" && git pull --rebase 2>&1 | sed 's/^/  /')
        fi
        # Rebuild + restart if compose exists
        local compose
        compose=$(ls "$dir"/docker-compose.y*ml 2>/dev/null | head -1)
        if [[ -n "$compose" ]]; then
            echo "  docker compose build..."
            docker compose -f "$compose" build 2>&1 | tail -3 | sed 's/^/  /'
            echo "  docker compose up -d..."
            docker compose -f "$compose" up -d 2>&1 | sed 's/^/  /'
        fi
        echo ""
    }

    if [[ "{{name}}" != "all" ]]; then
        do_update "{{name}}"
    else
        plugins=$(jq -r '.plugins[] | select(.source | type == "object") | .name' "$manifest")
        for plugin in $plugins; do
            do_update "$plugin"
        done
    fi

# Show git status across all workspace repos
git-status:
    #!/usr/bin/env bash
    set -uo pipefail
    manifest=".claude-plugin/marketplace.json"
    declare -A overrides=()

    printf "%-24s %-12s %-12s %s\n" "REPO" "BRANCH" "STATUS" "DETAILS"
    printf "%-24s %-12s %-12s %s\n" "────────────────────────" "────────────" "────────────" "──────────────────────"

    check_repo() {
        local name="$1" dir="$2"
        if [[ ! -d "$dir/.git" ]]; then
            printf "%-24s %-12s %-12s %s\n" "$name" "-" "not a repo" "$dir"
            return
        fi
        local branch status_line ahead behind dirty
        branch=$(cd "$dir" && git branch --show-current 2>/dev/null || echo "detached")
        dirty=$(cd "$dir" && git status --porcelain 2>/dev/null | wc -l)
        # Fetch silently to check ahead/behind
        ahead=$(cd "$dir" && git rev-list --count '@{upstream}..HEAD' 2>/dev/null || echo "?")
        behind=$(cd "$dir" && git rev-list --count 'HEAD..@{upstream}' 2>/dev/null || echo "?")

        if [[ "$dirty" -eq 0 && "$ahead" == "0" && "$behind" == "0" ]]; then
            status_line="clean"
        elif [[ "$dirty" -gt 0 ]]; then
            status_line="dirty"
        else
            status_line="synced"
        fi

        local details=""
        [[ "$dirty" -gt 0 ]] && details+="${dirty} changed "
        [[ "$ahead" != "0" && "$ahead" != "?" ]] && details+="↑${ahead} "
        [[ "$behind" != "0" && "$behind" != "?" ]] && details+="↓${behind} "

        printf "%-24s %-12s %-12s %s\n" "$name" "$branch" "$status_line" "$details"
    }

    # This repo
    check_repo "claude-homelab" "$(pwd)"

    # External repos
    plugins=$(jq -r '.plugins[] | select(.source | type == "object") | .name' "$manifest")
    for plugin in $plugins; do
        dir="${overrides[$plugin]:-$HOME/workspace/$plugin}"
        check_repo "$plugin" "$dir"
    done

# Generate standalone CLIs for all 8 MCP servers against production.
# ⚠ Generated CLIs embed your OAuth token — do not commit, share, or distribute.
# ⚠ Requires bun at runtime. Run 'mcporter auth <name>' for any auth-required server.
generate-all-clis:
    #!/usr/bin/env bash
    set -uo pipefail
    mkdir -p dist dist/.cache
    echo "⚠  Generated CLIs embed your OAuth token — do not commit or share"
    declare -a failed=()
    for server in arcane gotify swag synapse syslog unifi unraid overseerr; do
      cache_file="dist/.cache/${server}-cli.schema_hash"
      current_hash=$(timeout 10 mcporter list "$server" --json 2>/dev/null | sha256sum | cut -d' ' -f1 || echo "nohash")
      if [[ -f "$cache_file" ]] && [[ "$(cat "$cache_file")" == "$current_hash" ]] && [[ -f "dist/${server}-cli" ]]; then
        echo "SKIP: ${server} schema unchanged"
        continue
      fi
      echo "Generating ${server}-cli..."
      if ! timeout 30 mcporter generate-cli \
          --server "$server" \
          --name "${server}-cli" \
          --output "dist/${server}-cli"; then
        echo "WARNING: failed to generate ${server}-cli"
        failed+=("$server")
      else
        printf '%s' "$current_hash" > "$cache_file"
      fi
    done
    if [[ ${#failed[@]} -gt 0 ]]; then
      echo "FAILED: ${failed[*]}"
      echo "Run 'mcporter auth <name>' for failed servers, then retry."
      exit 1
    fi
    echo "Done. CLIs in dist/ (require bun at runtime)"

# ─── Operations ──────────────────────────────────────────────────────

# Quick connectivity check for all configured services
health:
    #!/usr/bin/env bash
    set -uo pipefail
    env_file="$HOME/.claude-homelab/.env"
    if [[ ! -f "$env_file" ]]; then
        echo "Error: $env_file not found"
        exit 1
    fi
    # Load env
    declare -A ENV=()
    while IFS='=' read -r key val; do
        [[ -z "$key" || "$key" =~ ^# ]] && continue
        key=$(echo "$key" | xargs)
        val=$(echo "$val" | xargs | sed 's/^["'\''"]//;s/["'\''"]$//')
        ENV["$key"]="$val"
    done < "$env_file"

    # Service → URL var mapping
    declare -A SERVICES=(
        ["Plex"]="PLEX_URL"
        ["Radarr"]="RADARR_URL"
        ["Sonarr"]="SONARR_URL"
        ["Prowlarr"]="PROWLARR_URL"
        ["Tautulli"]="TAUTULLI_URL"
        ["qBittorrent"]="QBITTORRENT_URL"
        ["SABnzbd"]="SABNZBD_URL"
        ["Overseerr"]="OVERSEERR_URL"
        ["Gotify"]="GOTIFY_URL"
        ["Linkding"]="LINKDING_URL"
        ["Memos"]="MEMOS_URL"
        ["Bytestash"]="BYTESTASH_URL"
        ["Paperless"]="PAPERLESS_URL"
        ["Radicale"]="RADICALE_URL"
        ["UniFi"]="UNIFI_URL"
        ["Unraid"]="UNRAID_SERVER1_URL"
    )
    # MCP endpoints from settings.json
    settings="$HOME/.claude/settings.json"

    printf "%-16s %-6s %s\n" "SERVICE" "CODE" "URL"
    printf "%-16s %-6s %s\n" "────────────────" "──────" "──────────────────────────────"

    for name in $(echo "${!SERVICES[@]}" | tr ' ' '\n' | sort); do
        var="${SERVICES[$name]}"
        url="${ENV[$var]:-}"
        if [[ -z "$url" || "$url" =~ ^your ]]; then
            printf "%-16s %-6s %s\n" "$name" "—" "(not configured)"
            continue
        fi
        code=$(curl -sk -o /dev/null -w '%{http_code}' --max-time 5 "$url" 2>/dev/null || echo "000")
        printf "%-16s %-6s %s\n" "$name" "$code" "$url"
    done

    # MCP endpoints
    if [[ -f "$settings" ]]; then
        echo ""
        printf "%-16s %-6s %s\n" "MCP SERVER" "CODE" "URL"
        printf "%-16s %-6s %s\n" "────────────────" "──────" "──────────────────────────────"
        jq -r '.env // {} | to_entries[] | select(.key | endswith("_MCP_URL")) | [.key, .value] | @tsv' "$settings" | while IFS=$'\t' read -r var url; do
            name=$(echo "$var" | sed 's/_MCP_URL$//' | tr '[:upper:]' '[:lower:]')
            code=$(curl -sk -o /dev/null -w '%{http_code}' --max-time 5 "$url" 2>/dev/null || echo "000")
            printf "%-16s %-6s %s\n" "$name" "$code" "$url"
        done
    fi

# TLS certificate expiry dashboard
certs:
    #!/usr/bin/env bash
    set -uo pipefail
    settings="$HOME/.claude/settings.json"
    env_file="$HOME/.claude-homelab/.env"
    declare -A checked=()

    printf "%-30s %-8s %-12s %s\n" "HOST" "DAYS" "STATUS" "EXPIRES"
    printf "%-30s %-8s %-12s %s\n" "──────────────────────────────" "────────" "────────────" "──────────────────────"

    check_cert() {
        local url="$1" label="$2"
        [[ ! "$url" =~ ^https:// ]] && return
        local host
        host=$(echo "$url" | sed 's|https://||;s|/.*||;s|:.*||')
        [[ -n "${checked[$host]:-}" ]] && return
        checked["$host"]=1
        local port
        port=$(echo "$url" | sed 's|https://||;s|/.*||' | grep -oP ':\K[0-9]+' || echo "443")
        local expiry
        expiry=$(echo | openssl s_client -servername "$host" -connect "$host:$port" 2>/dev/null | openssl x509 -noout -enddate 2>/dev/null | sed 's/notAfter=//')
        if [[ -z "$expiry" ]]; then
            printf "%-30s %-8s %-12s %s\n" "$label ($host)" "?" "unreachable" ""
            return
        fi
        local expiry_epoch now_epoch days
        expiry_epoch=$(date -d "$expiry" +%s 2>/dev/null || echo 0)
        now_epoch=$(date +%s)
        days=$(( (expiry_epoch - now_epoch) / 86400 ))
        local status
        if [[ $days -lt 7 ]]; then
            status="CRITICAL"
        elif [[ $days -lt 30 ]]; then
            status="WARNING"
        else
            status="OK"
        fi
        printf "%-30s %-8s %-12s %s\n" "$label ($host)" "$days" "$status" "$expiry"
    }

    # MCP endpoints from settings.json
    if [[ -f "$settings" ]]; then
        jq -r '.env // {} | to_entries[] | select(.key | endswith("_MCP_URL")) | [.key, .value] | @tsv' "$settings" | while IFS=$'\t' read -r var url; do
            name=$(echo "$var" | sed 's/_MCP_URL$//' | tr '[:upper:]' '[:lower:]')
            check_cert "$url" "$name"
        done
    fi

    # Service URLs from .env
    if [[ -f "$env_file" ]]; then
        grep -E '_URL=' "$env_file" | grep -v '^#' | while IFS='=' read -r key val; do
            val=$(echo "$val" | xargs | sed 's/^["'\''"]//;s/["'\''"]$//')
            [[ -z "$val" || "$val" =~ ^your || ! "$val" =~ ^https ]] && continue
            name=$(echo "$key" | sed 's/_URL$//' | tr '[:upper:]' '[:lower:]')
            check_cert "$val" "$name"
        done
    fi

# Check for outdated dependencies across external repos
outdated:
    #!/usr/bin/env bash
    set -uo pipefail
    manifest=".claude-plugin/marketplace.json"
    declare -A overrides=()
    plugins=$(jq -r '.plugins[] | select(.source | type == "object") | .name' "$manifest")
    for plugin in $plugins; do
        dir="${overrides[$plugin]:-$HOME/workspace/$plugin}"
        script="$dir/scripts/check-outdated-deps.sh"
        if [[ -x "$script" ]]; then
            echo "━━━ $plugin ━━━"
            (cd "$dir" && bash "$script" 2>&1) || true
            echo ""
        fi
    done

# ─── Hygiene ─────────────────────────────────────────────────────────

# Lint everything: external repos, local Python, local shell scripts
lint:
    #!/usr/bin/env bash
    set -uo pipefail
    manifest=".claude-plugin/marketplace.json"
    declare -A overrides=()
    pass=0; fail=0; skip=0

    section() { echo ""; echo "═══ $1 ═══"; }
    ok()   { pass=$((pass+1)); }
    bad()  { fail=$((fail+1)); }


    # ── 2. Local Python scripts (ruff + ty) ──
    py_files=$(find skills -name "*.py" -not -path "*__pycache__*" -not -path "*.venv*" 2>/dev/null)
    if [[ -n "$py_files" ]]; then
        section "Python (ruff lint + format check + ty type check)"

        echo "━━━ ruff check ━━━"
        if ruff check $py_files 2>&1; then
            echo "  ✓ ruff lint passed"
            ok
        else
            echo "  ✗ ruff lint failed"
            bad
        fi

        echo ""
        echo "━━━ ruff format --check ━━━"
        if ruff format --check $py_files 2>&1; then
            echo "  ✓ ruff format passed"
            ok
        else
            echo "  ✗ ruff format failed (run: ruff format skills/)"
            bad
        fi

        echo ""
        echo "━━━ ty ━━━"
        if ty check $py_files 2>&1; then
            echo "  ✓ ty type check passed"
            ok
        else
            echo "  ✗ ty type check failed"
            bad
        fi
    fi

    # ── 3. Local shell scripts (shellcheck) ──
    sh_files=$(find scripts skills -name "*.sh" -not -path "*.venv*" 2>/dev/null)
    if [[ -n "$sh_files" ]]; then
        section "Shell (shellcheck)"
        sh_pass=0; sh_fail=0
        for f in $sh_files; do
            if shellcheck -S warning "$f" 2>&1 >/dev/null; then
                sh_pass=$((sh_pass+1))
            else
                echo "  ✗ $f"
                shellcheck -S warning "$f" 2>&1 | head -5 | sed 's/^/    /'
                sh_fail=$((sh_fail+1))
            fi
        done
        echo "  shellcheck: $sh_pass passed, $sh_fail failed"
        if [[ $sh_fail -eq 0 ]]; then ok; else bad; fi
    fi

    # ── 4. Skill validation ──
    section "Skills (skills-ref validate)"
    skill_pass=0; skill_fail=0
    while IFS= read -r skill_dir; do
        [[ ! -f "$skill_dir/SKILL.md" ]] && continue
        name=$(basename "$skill_dir")
        if npx skills-ref validate "$skill_dir" &>/dev/null; then
            skill_pass=$((skill_pass+1))
        else
            echo "  ✗ $name"
            npx skills-ref validate "$skill_dir" 2>&1 | tail -2 | sed 's/^/    /'
            skill_fail=$((skill_fail+1))
        fi
    done < <(find skills -mindepth 1 -maxdepth 1 -type d | sort)
    echo "  skills-ref: $skill_pass passed, $skill_fail failed"
    if [[ $skill_fail -eq 0 ]]; then ok; else bad; fi

    # ── 5. PR review comments (unresolved) ──
    section "PR Review Comments (unresolved threads)"
    fetch_script="$(pwd)/skills/gh-address-comments/scripts/fetch_comments.py"
    if [[ ! -f "$fetch_script" ]]; then
        echo "  ⚠ fetch_comments.py not found"
    else
        pr_issues=0; pr_clean=0
        all_repos=("$(pwd)")
        while IFS= read -r plugin; do
            all_repos+=("${overrides[$plugin]:-$HOME/workspace/$plugin}")
        done < <(jq -r '.plugins[] | select(.source | type == "object") | .name' "$manifest")
        for dir in "${all_repos[@]}"; do
            [[ ! -d "$dir/.git" ]] && continue
            repo_name=$(basename "$dir")
            # Get latest open PR number
            pr_num=$(cd "$dir" && gh pr list --limit 1 --state open --json number --jq '.[0].number' 2>/dev/null)
            if [[ -z "$pr_num" ]]; then
                continue
            fi
            # Fetch comments and count unresolved threads
            comments=$(cd "$dir" && python3 "$fetch_script" 2>/dev/null)
            if [[ -z "$comments" ]]; then
                continue
            fi
            unresolved=$(echo "$comments" | python3 -c "import sys,json; d=json.load(sys.stdin); print(sum(1 for t in d.get('review_threads',[]) if not t.get('isResolved',False)))" 2>/dev/null || echo 0)
            [[ -z "$unresolved" ]] && unresolved=0
            if [[ "$unresolved" -gt 0 ]]; then
                echo "  ✗ $repo_name PR #$pr_num: $unresolved unresolved thread(s)"
                pr_issues=$((pr_issues+1))
            else
                echo "  ✓ $repo_name PR #$pr_num: all threads resolved"
                pr_clean=$((pr_clean+1))
            fi
        done
        total_pr=$((pr_issues+pr_clean))
        if [[ $total_pr -eq 0 ]]; then
            echo "  (no open PRs found)"
        elif [[ $pr_issues -eq 0 ]]; then
            ok
        else
            bad
        fi
    fi

    # ── 6. Monolith detector ──
    section "Monolith Detector (files > 500 LOC)"
    monoliths=0
    # Check this repo
    while IFS= read -r f; do
        loc=$(wc -l < "$f")
        if [[ $loc -gt 500 ]]; then
            echo "  ⚠ $f: $loc lines"
            monoliths=$((monoliths+1))
        fi
    done < <(find . -type f \( -name "*.py" -o -name "*.ts" -o -name "*.js" -o -name "*.sh" -o -name "*.rs" -o -name "*.go" -o -name "*.mjs" \) -not -path "./.git/*" -not -path "*/node_modules/*" -not -path "*/.venv/*" -not -path "*/.cache/*" -not -path "*/dist/*" -not -path "*/build/*" -not -path "*/.next/*" 2>/dev/null)
    # Check external repos
    for plugin in $plugins; do
        dir="${overrides[$plugin]:-$HOME/workspace/$plugin}"
        [[ ! -d "$dir" ]] && continue
        while IFS= read -r f; do
            loc=$(wc -l < "$f")
            if [[ $loc -gt 500 ]]; then
                echo "  ⚠ $f: $loc lines"
                monoliths=$((monoliths+1))
            fi
        done < <(find "$dir" -type f \( -name "*.py" -o -name "*.ts" -o -name "*.js" -o -name "*.sh" -o -name "*.rs" -o -name "*.go" -o -name "*.mjs" \) -not -path "*/.git/*" -not -path "*/node_modules/*" -not -path "*/.venv/*" -not -path "*/.cache/*" -not -path "*/dist/*" -not -path "*/build/*" -not -path "*/target/*" -not -path "*/.next/*" 2>/dev/null)
    done
    if [[ $monoliths -eq 0 ]]; then
        echo "  ✓ No monoliths found"
        ok
    else
        echo "  $monoliths file(s) over 500 LOC"
        skip
    fi

    # ── Summary ──
    echo ""
    echo "──────────────────────────────────────────"
    total=$((pass+fail+skip))
    echo "Lint: $pass passed, $fail failed, $skip skipped ($total checks)"
    [[ $fail -gt 0 ]] && exit 1

# Find code files over a line threshold across all repos
monoliths threshold="500":
    #!/usr/bin/env bash
    set -uo pipefail
    manifest=".claude-plugin/marketplace.json"
    declare -A overrides=()
    threshold="{{threshold}}"
    count=0

    printf "%-8s %s\n" "LINES" "FILE"
    printf "%-8s %s\n" "────────" "──────────────────────────────────────────"

    scan_dir() {
        local dir="$1"
        find "$dir" -type f \( -name "*.py" -o -name "*.ts" -o -name "*.js" -o -name "*.sh" -o -name "*.rs" -o -name "*.go" -o -name "*.mjs" -o -name "*.tsx" -o -name "*.jsx" \) \
            -not -path "*/.git/*" -not -path "*/node_modules/*" -not -path "*/.venv/*" \
            -not -path "*/.cache/*" -not -path "*/dist/*" -not -path "*/build/*" \
            -not -path "*/target/*" -not -path "*/.beads/*" -not -path "*/.next/*" 2>/dev/null | while read -r f; do
            loc=$(wc -l < "$f")
            if [[ $loc -gt $threshold ]]; then
                printf "%-8s %s\n" "$loc" "$f"
            fi
        done
    }

    # This repo
    scan_dir "."

    # External repos
    plugins=$(jq -r '.plugins[] | select(.source | type == "object") | .name' "$manifest")
    for plugin in $plugins; do
        dir="${overrides[$plugin]:-$HOME/workspace/$plugin}"
        [[ -d "$dir" ]] && scan_dir "$dir"
    done | sort -rn

# Compare .env.example with actual .env to find new or missing variables
env-diff:
    #!/usr/bin/env bash
    set -uo pipefail
    example=".env.example"
    actual="$HOME/.claude-homelab/.env"
    if [[ ! -f "$example" ]]; then
        echo "Error: $example not found"
        exit 1
    fi
    if [[ ! -f "$actual" ]]; then
        echo "Error: $actual not found — run: just symlinks"
        exit 1
    fi
    # Extract keys (strip comments, empty lines, values)
    example_keys=$(grep -oP '^[A-Z][A-Z0-9_]+(?==)' "$example" | sort -u)
    actual_keys=$(grep -oP '^[A-Z][A-Z0-9_]+(?==)' "$actual" | sort -u)

    missing=$(comm -23 <(echo "$example_keys") <(echo "$actual_keys"))
    extra=$(comm -13 <(echo "$example_keys") <(echo "$actual_keys"))

    if [[ -n "$missing" ]]; then
        echo "Missing from .env (defined in .env.example):"
        echo "$missing" | sed 's/^/  - /'
        echo ""
    fi
    if [[ -n "$extra" ]]; then
        echo "Extra in .env (not in .env.example):"
        echo "$extra" | sed 's/^/  + /'
        echo ""
    fi
    if [[ -z "$missing" && -z "$extra" ]]; then
        echo "✓ .env and .env.example are in sync"
    fi

# ─── Observability ───────────────────────────────────────────────────

# One-screen dashboard: compose + health + versions + MCP
status:
    #!/usr/bin/env bash
    set -uo pipefail
    echo "══════════════════════════════════════════"
    echo "  Claude Homelab Status"
    echo "══════════════════════════════════════════"
    echo ""

    # Versions
    echo "── Versions ──"
    version_files="package.json Cargo.toml pyproject.toml .claude-plugin/plugin.json .codex-plugin/plugin.json gemini-extension.json README.md CLAUDE.md"
    versions=()
    for f in $version_files; do
        [[ ! -f "$f" ]] && continue
        case "$f" in
            *.json) v=$(grep -m1 '"version"' "$f" | sed 's/.*"version"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/') ;;
            *.toml) v=$(grep -m1 '^version' "$f" | sed 's/.*=[[:space:]]*"\([^"]*\)".*/\1/') ;;
            README.md) v=$(grep -m1 '^Version:' "$f" | sed 's/Version:[[:space:]]*//') ;;
            CLAUDE.md) v=$(grep -m1 '^\*\*Version:\*\*' "$f" | sed 's/\*\*Version:\*\*[[:space:]]*//') ;;
        esac
        [[ -n "${v:-}" ]] && versions+=("$v")
    done
    if [[ ${#versions[@]} -gt 0 ]]; then
        first="${versions[0]}"; drift=false
        for v in "${versions[@]}"; do [[ "$v" != "$first" ]] && drift=true && break; done
        if $drift; then echo "  ✗ Version drift detected"; else echo "  ✓ All versions: $first"; fi
    fi
    echo ""

    # Compose status
    echo "── Docker Compose ──"
    just compose-status 2>&1
    echo ""

    # Health
    echo "── Service Health ──"
    just health 2>&1
    echo ""

    # MCP servers
    echo "── MCP Servers ──"
    just mcp-servers 2>&1

# ─── Ports & Resources ──────────────────────────────────────────────

# List all host:port bindings for running MCP containers
ports:
    #!/usr/bin/env bash
    set -uo pipefail
    manifest=".claude-plugin/marketplace.json"
    mapfile -t plugins < <(jq -r '.plugins[] | select(.source | type == "object") | .name' "$manifest")

    fmt='{{"{{"}}.Names}}\t{{"{{"}}.Ports}}'
    all=$(docker ps --format "$fmt" 2>/dev/null || true)

    printf "%-24s %s\n" "PLUGIN" "PORTS"
    printf "%-24s %s\n" "────────────────────────" "──────────────────────────────────────────"
    for p in "${plugins[@]}"; do
        match=$(echo "$all" | grep -P "^${p}\t" || true)
        [[ -z "$match" ]] && continue
        ports=$(echo "$match" | cut -f2)
        printf "%-24s %s\n" "$p" "$ports"
    done

    # Also check for locally-bound MCP ports from .env
    echo ""
    echo "Configured MCP ports (from .env):"
    env_file="$HOME/.claude-homelab/.env"
    if [[ -f "$env_file" ]]; then
        grep -E '_MCP_PORT=' "$env_file" | grep -v '^#' | while IFS='=' read -r key val; do
            val=$(echo "$val" | xargs | sed 's/^["'\''"]//;s/["'\''"]$//')
            [[ -z "$val" ]] && continue
            name=$(echo "$key" | sed 's/_MCP_PORT$//' | tr '[:upper:]' '[:lower:]')
            # Check if port is in use
            if ss -tlnp 2>/dev/null | grep -q ":${val} "; then
                printf "  %-24s :%s (in use)\n" "$name" "$val"
            else
                printf "  %-24s :%s (free)\n" "$name" "$val"
            fi
        done
    fi

# Show resource usage for our marketplace MCP containers
resources:
    #!/usr/bin/env bash
    set -uo pipefail
    manifest=".claude-plugin/marketplace.json"
    mapfile -t plugins < <(jq -r '.plugins[] | select(.source | type == "object") | .name' "$manifest")

    # Collect running container names that match our plugins
    running=()
    for p in "${plugins[@]}"; do
        if docker ps -q -f "name=^${p}$" 2>/dev/null | grep -q .; then
            running+=("$p")
        fi
    done

    if [[ ${#running[@]} -eq 0 ]]; then
        echo "No marketplace MCP containers running."
        exit 0
    fi

    echo "══════════════════════════════════════════"
    echo "  MCP Server Resource Usage"
    echo "══════════════════════════════════════════"
    echo ""

    # Docker stats (one-shot, no stream)
    docker stats --no-stream --format "table {{"{{"}}.Name}}\t{{"{{"}}.CPUPerc}}\t{{"{{"}}.MemUsage}}\t{{"{{"}}.MemPerc}}\t{{"{{"}}.NetIO}}\t{{"{{"}}.PIDs}}" "${running[@]}" 2>/dev/null

    echo ""

    # Also show local process resource usage for our plugins
    echo "Local Processes:"
    printf "  %-24s %-8s %-12s %s\n" "PLUGIN" "PID" "RSS (MB)" "CPU%"
    printf "  %-24s %-8s %-12s %s\n" "────────────────────────" "────────" "────────────" "────────"
    for p in "${plugins[@]}"; do
        p_under="${p//-/_}"
        # Find matching processes, skip docker/grep/just
        ps aux 2>/dev/null | grep -E "(${p}|${p_under})" | grep -v -E 'grep|just |docker|emulator|qemu' | head -1 | while read -r user pid cpu mem vsz rss tty stat start time cmd; do
            rss_mb=$(echo "scale=1; $rss/1024" | bc 2>/dev/null || echo "?")
            printf "  %-24s %-8s %-12s %s\n" "$p" "$pid" "$rss_mb" "$cpu%"
        done
    done
