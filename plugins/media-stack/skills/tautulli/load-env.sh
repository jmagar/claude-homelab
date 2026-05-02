#!/bin/bash
# Environment Loading Library
# Canonical source: ~/claude-homelab/lib/load-env.sh
# Installed to:     ~/.claude-homelab/load-env.sh  (via setup-symlinks.sh)
#
# In skill scripts, source as:
#   source "$HOME/.claude-homelab/load-env.sh"

# Prevent direct execution
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    echo "Error: This library must be sourced, not executed directly" >&2
    exit 1
fi

# Load ~/.claude-homelab/.env (or an explicit override path)
# Usage: load_env_file [/optional/override/path]
load_env_file() {
    local env_file="${1:-$HOME/.claude-homelab/.env}"

    if [[ ! -f "$env_file" ]]; then
        echo "ERROR: $env_file not found" >&2
        echo "Run setup: ~/claude-homelab/scripts/setup-symlinks.sh" >&2
        echo "Then add your credentials to ~/.claude-homelab/.env" >&2
        return 1
    fi

    set -a
    # shellcheck source=/dev/null
    source "$env_file"
    set +a
}

# Validate that required environment variables are set and non-empty
# Usage: validate_env_vars "VAR1" "VAR2" ...
validate_env_vars() {
    local missing=()
    for var in "$@"; do
        [[ -z "${!var:-}" ]] && missing+=("$var")
    done

    if [[ ${#missing[@]} -gt 0 ]]; then
        echo "ERROR: Missing required variables in ~/.claude-homelab/.env: ${missing[*]}" >&2
        return 1
    fi
}

# Load and validate service credentials in one call
# Usage: load_service_credentials "service-name" "URL_VAR" "KEY_VAR"
load_service_credentials() {
    local url_var="$2"
    local key_var="$3"

    if [[ -z "${!url_var:-}" ]] || [[ -z "${!key_var:-}" ]]; then
        load_env_file || return 1
    fi

    validate_env_vars "$url_var" "$key_var"
}
