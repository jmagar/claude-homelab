#!/bin/bash
# ZFS Pool Health Check Script
# Checks pool status, capacity, scrub status, and SMART data

set -euo pipefail

# Load environment if available (ZFS doesn't require credentials, but supports standardized env loading)
SCRIPT_DIR="$(cd -P "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PLUGIN_ROOT="${CLAUDE_PLUGIN_ROOT:-$(cd "$SCRIPT_DIR/../../.." && pwd)}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
_LOAD_ENV="${HOME}/.claude-homelab/load-env.sh"
[[ ! -f "$_LOAD_ENV" ]] && _LOAD_ENV="$SCRIPT_DIR/../load-env.sh"
# shellcheck source=/dev/null
source "$_LOAD_ENV" || { echo "ERROR: load-env.sh not found. Run /homelab-core:setup" >&2; exit 1; }

# Colors for output
RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Parse arguments
POOL_NAME="${1:-}"
JSON_OUTPUT=false

if [[ "$POOL_NAME" == "--json" ]]; then
    JSON_OUTPUT=true
    POOL_NAME=""
elif [[ "${2:-}" == "--json" ]]; then
    JSON_OUTPUT=true
fi

# Function: Check pool exists
check_pool_exists() {
    local pool="$1"
    if ! zpool list "$pool" &>/dev/null; then
        echo "Error: Pool '$pool' not found"
        return 1
    fi
}

# Function: Get pool health status
get_pool_status() {
    local pool="$1"
    zpool status -v "$pool" 2>/dev/null || echo "UNKNOWN"
}

# Function: Get pool capacity
get_pool_capacity() {
    local pool="$1"
    zpool list -H -o cap "$pool" | tr -d '%'
}

# Function: Get last scrub date
get_last_scrub() {
    local pool="$1"
    local scrub_info=$(zpool status "$pool" | grep -A1 "scan:")

    if echo "$scrub_info" | grep -q "scrub repaired"; then
        echo "$scrub_info" | grep "scrub repaired" | sed 's/.*on //'
    elif echo "$scrub_info" | grep -q "scrub in progress"; then
        echo "IN_PROGRESS"
    else
        echo "NEVER"
    fi
}

# Function: Get pool state
get_pool_state() {
    local pool="$1"
    zpool list -H -o health "$pool"
}

# Function: Check for errors
get_pool_errors() {
    local pool="$1"
    local read_errors=$(zpool status "$pool" | grep "errors:" | awk '{print $2}' | head -1)
    local write_errors=$(zpool status "$pool" | grep "errors:" | awk '{print $3}' | head -1)
    local cksum_errors=$(zpool status "$pool" | grep "errors:" | awk '{print $4}' | head -1)

    echo "read=$read_errors,write=$write_errors,cksum=$cksum_errors"
}

# Function: Health check for single pool
check_single_pool() {
    local pool="$1"

    if ! check_pool_exists "$pool"; then
        return 1
    fi

    local state=$(get_pool_state "$pool")
    local capacity=$(get_pool_capacity "$pool")
    local last_scrub=$(get_last_scrub "$pool")
    local errors=$(get_pool_errors "$pool")

    if $JSON_OUTPUT; then
        cat <<EOF
{
  "pool": "$pool",
  "state": "$state",
  "capacity": $capacity,
  "last_scrub": "$last_scrub",
  "errors": "$errors",
  "alerts": []
}
EOF
    else
        echo "=== Pool: $pool ==="
        echo "State: $state"
        echo "Capacity: ${capacity}%"
        echo "Last Scrub: $last_scrub"
        echo "Errors: $errors"

        # Capacity warnings
        if [ "$capacity" -ge 90 ]; then
            echo -e "${RED}CRITICAL: Pool capacity >= 90%${NC}"
        elif [ "$capacity" -ge 80 ]; then
            echo -e "${YELLOW}WARNING: Pool capacity >= 80%${NC}"
        elif [ "$capacity" -ge 70 ]; then
            echo -e "${YELLOW}NOTICE: Pool capacity >= 70%${NC}"
        else
            echo -e "${GREEN}OK: Pool capacity < 70%${NC}"
        fi

        # State warnings
        if [ "$state" != "ONLINE" ]; then
            echo -e "${RED}CRITICAL: Pool state is $state (not ONLINE)${NC}"
        fi

        # Scrub warnings (check if older than 60 days)
        if [ "$last_scrub" == "NEVER" ]; then
            echo -e "${RED}CRITICAL: Pool has never been scrubbed${NC}"
        elif [ "$last_scrub" != "IN_PROGRESS" ]; then
            # Parse scrub date and check age (with BSD/macOS fallback)
            # Try GNU date first, fall back to skipping age check on BSD systems
            if scrub_epoch=$(date -d "$last_scrub" +%s 2>/dev/null); then
                current_epoch=$(date +%s)
                days_since_scrub=$(( (current_epoch - scrub_epoch) / 86400 ))

                if [ "$days_since_scrub" -gt 60 ]; then
                    echo -e "${YELLOW}WARNING: Last scrub was $days_since_scrub days ago (recommend monthly)${NC}"
                fi
            else
                # BSD/macOS - date parsing format differs, skip age check
                echo -e "Last scrub: $last_scrub (age check unavailable on BSD/macOS)"
            fi
        fi

        echo ""
    fi
}

# Function: Check all pools
check_all_pools() {
    local pools=$(zpool list -H -o name)

    if $JSON_OUTPUT; then
        echo "["
        local first=true
        for pool in $pools; do
            if [ "$first" = true ]; then
                first=false
            else
                echo ","
            fi
            check_single_pool "$pool"
        done
        echo "]"
    else
        for pool in $pools; do
            check_single_pool "$pool"
        done
    fi
}

# Main execution
main() {
    if [ -z "$POOL_NAME" ]; then
        check_all_pools
    else
        check_single_pool "$POOL_NAME"
    fi
}

main
