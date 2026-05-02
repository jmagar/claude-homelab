#!/bin/bash
# Wrapper that guarantees output visibility
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ACTUAL_SCRIPT="$SCRIPT_DIR/qbit-api.sh"

# Capture output and explicitly print
output=$("$ACTUAL_SCRIPT" "$@" 2>&1)
printf '%s\n' "$output"
