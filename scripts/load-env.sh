#!/bin/bash
# Environment Loading Library (Doppler-backed)
# Canonical source: ~/claude-homelab/scripts/load-env.sh
# Installed to:     ~/.claude-homelab/load-env.sh  (via setup-symlinks.sh)
#
# Secrets are stored in Doppler (project: claude-homelab, config: prd).
# Falls back to ~/.claude-homelab/.env if Doppler is unavailable.
#
# In skill scripts, source as:
#   source "$HOME/.claude-homelab/load-env.sh"

# Prevent direct execution
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    echo "Error: This library must be sourced, not executed directly" >&2
    exit 1
fi

# Internal: export all secrets from Doppler into the current shell
_load_from_doppler() {
    local project="${DOPPLER_PROJECT:-claude-homelab}"
    local config="${DOPPLER_CONFIG:-prd}"

    local secrets
    secrets=$(doppler secrets download \
        --project "$project" \
        --config "$config" \
        --no-file --format env-no-quotes 2>/dev/null) || return 1

    # Export each line into the environment
    while IFS= read -r line; do
        # Skip empty lines and comments
        [[ -z "$line" || "$line" == \#* ]] && continue
        export "${line?}"
    done <<< "$secrets"
}

# Internal: fall back to flat .env file
_load_from_file() {
    local env_file="${1:-$HOME/.claude-homelab/.env}"

    if [[ ! -f "$env_file" ]]; then
        echo "ERROR: $env_file not found and Doppler unavailable" >&2
        echo "Run: doppler setup --project claude-homelab --config prd" >&2
        echo "Or create ~/.claude-homelab/.env manually" >&2
        return 1
    fi

    set -a
    # shellcheck source=/dev/null
    source "$env_file"
    set +a
}

# Load secrets from Doppler (preferred) or fall back to ~/.claude-homelab/.env
# Usage: load_env_file [/optional/fallback/path]
load_env_file() {
    # If secrets are already loaded (e.g., running under `doppler run`), skip
    if [[ -n "${DOPPLER_ENVIRONMENT:-}" ]]; then
        return 0
    fi

    # Try Doppler first
    if command -v doppler &>/dev/null; then
        if _load_from_doppler; then
            return 0
        fi
        echo "WARN: Doppler fetch failed, falling back to .env file" >&2
    fi

    # Fallback to flat file
    _load_from_file "$@"
}

# Validate that required environment variables are set and non-empty
# Usage: validate_env_vars "VAR1" "VAR2" ...
validate_env_vars() {
    local missing=()
    for var in "$@"; do
        [[ -z "${!var:-}" ]] && missing+=("$var")
    done

    if [[ ${#missing[@]} -gt 0 ]]; then
        echo "ERROR: Missing required variables: ${missing[*]}" >&2
        echo "Set them in Doppler (project: claude-homelab, config: prd)" >&2
        echo "  doppler secrets set ${missing[*]}" >&2
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
