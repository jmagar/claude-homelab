#!/bin/bash
# ZFS Snapshot Automation Setup Example
# Demonstrates how to configure Sanoid for automated snapshot management

set -euo pipefail

# Configuration
SANOID_CONF="/etc/sanoid/sanoid.conf"

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

log_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

log_warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

# Main workflow
main() {
    local pool=${1:-tank}
    
    log_info "=== ZFS Snapshot Automation Setup Example ==="
    log_info "Pool: $pool"
    echo
    
    log_info "This example demonstrates Sanoid snapshot automation setup"
    log_info ""
    log_info "Step 1: Install Sanoid"
    echo "  sudo apt install sanoid"
    echo
    
    log_info "Step 2: Configure retention policy"
    echo "  Edit /etc/sanoid/sanoid.conf:"
    echo "  [$pool]"
    echo "      use_template = production"
    echo "      recursive = yes"
    echo
    
    log_info "Step 3: Add cron job"
    echo "  crontab -e"
    echo "  0 * * * * /usr/sbin/sanoid --cron"
    echo
    
    log_info "Step 4: Test snapshot creation"
    echo "  sudo sanoid --take-snapshots --verbose"
    echo
    
    log_info "Step 5: Verify snapshots"
    echo "  zfs list -t snapshot $pool"
}

main "$@"
