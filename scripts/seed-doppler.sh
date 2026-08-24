#!/bin/bash
# ============================================================================
# Seed Doppler secrets from .env.example
# ============================================================================
# Imports all variable names from .env.example into the Doppler project.
# Placeholder values are set so the operator knows what to fill in.
#
# Usage:
#   ./scripts/seed-doppler.sh              # import to prd config
#   ./scripts/seed-doppler.sh dev          # import to dev config
#   DOPPLER_PROJECT=claude-homelab ./scripts/seed-doppler.sh
# ============================================================================
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
ENV_EXAMPLE="$REPO_ROOT/.env.example"

PROJECT="${DOPPLER_PROJECT:-claude-homelab}"
CONFIG="${1:-prd}"

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

log_info() { echo -e "${BLUE}[INFO]${NC} $1"; }
log_success() { echo -e "${GREEN}[OK]${NC} $1"; }
log_warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
log_error() { echo -e "${RED}[ERR]${NC} $1"; }

# Check prerequisites
if ! command -v doppler &>/dev/null; then
    log_error "doppler CLI not found. Install: https://docs.doppler.com/docs/install-cli"
    exit 1
fi

if [[ ! -f "$ENV_EXAMPLE" ]]; then
    log_error ".env.example not found at $ENV_EXAMPLE"
    exit 1
fi

# Verify project exists
if ! doppler projects get "$PROJECT" &>/dev/null; then
    log_error "Doppler project '$PROJECT' not found."
    echo "Create it: doppler projects create $PROJECT"
    exit 1
fi

log_info "Seeding Doppler project '$PROJECT' config '$CONFIG' from .env.example"
echo ""

# Parse .env.example and build doppler secrets set command
# We batch all secrets into a single API call for speed
declare -a secrets_args=()
count=0

while IFS= read -r line; do
    # Skip empty lines and comments
    [[ -z "$line" || "$line" == \#* ]] && continue

    # Extract KEY=VALUE
    if [[ "$line" =~ ^([A-Za-z_][A-Za-z0-9_]*)=(.*) ]]; then
        key="${BASH_REMATCH[1]}"
        value="${BASH_REMATCH[2]}"

        # Strip surrounding quotes if present
        value="${value#\"}"
        value="${value%\"}"
        value="${value#\'}"
        value="${value%\'}"

        secrets_args+=("$key=$value")
        count=$((count + 1))
    fi
done < "$ENV_EXAMPLE"

if [[ ${#secrets_args[@]} -eq 0 ]]; then
    log_warn "No variables found in .env.example"
    exit 0
fi

log_info "Found $count variables to import"

# Upload all at once
if doppler secrets set \
    --project "$PROJECT" \
    --config "$CONFIG" \
    "${secrets_args[@]}" \
    --no-interactive >/dev/null 2>&1; then
    log_success "Seeded $count secrets into $PROJECT/$CONFIG"
else
    log_error "Failed to upload secrets to Doppler"
    log_info "Trying in smaller batches..."

    # Fall back to batches of 20
    batch_size=20
    for ((i = 0; i < ${#secrets_args[@]}; i += batch_size)); do
        batch=("${secrets_args[@]:i:batch_size}")
        doppler secrets set \
            --project "$PROJECT" \
            --config "$CONFIG" \
            "${batch[@]}" \
            --no-interactive >/dev/null 2>&1 || {
            log_error "Batch starting at index $i failed"
            exit 1
        }
    done
    log_success "Seeded $count secrets into $PROJECT/$CONFIG (batched)"
fi

echo ""
echo -e "${YELLOW}Next steps:${NC}"
echo "  1. Replace placeholder values with real credentials:"
echo "     doppler secrets set PLEX_TOKEN=real_token --project $PROJECT --config $CONFIG"
echo ""
echo "  2. Or open the Doppler dashboard:"
echo "     doppler open --project $PROJECT --config $CONFIG"
echo ""
echo "  3. Verify loading works:"
echo "     cd ~/claude-homelab && source scripts/load-env.sh && load_env_file && echo \$PLEX_URL"
