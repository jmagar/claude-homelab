#!/bin/bash
# Multi-Device ZFS Replication Example
# Demonstrates pull-based replication from 5 devices to centralized backup server

set -euo pipefail

# Configuration
BACKUP_ROOT="backup"  # Root dataset for backups
COMPRESS="zstd-fast"  # Compression algorithm for network transfer

# Device list (modify for your environment)
declare -A DEVICES=(
    ["device1"]="user@device1.local:tank"
    ["device2"]="user@device2.local:tank"
    ["device3"]="user@device3.local:tank"
    ["device4"]="user@device4.local:tank"
    ["device5"]="user@device5.local:tank"
)

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

log_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

log_warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Test SSH connectivity
test_ssh() {
    local device=$1
    local connection=$2
    local host=${connection%%:*}
    
    log_info "Testing SSH connection to $device ($host)..."
    
    if ssh -o ConnectTimeout=5 -o BatchMode=yes "$host" echo "SSH OK" &>/dev/null; then
        log_info "  ✓ SSH connection successful"
        return 0
    else
        log_error "  ✗ SSH connection failed"
        return 1
    fi
}

# Replicate from one device
replicate_device() {
    local device=$1
    local source=$2
    local dest="${BACKUP_ROOT}/${device}"
    
    log_info "Starting replication: $device"
    log_info "  Source: $source"
    log_info "  Destination: $dest"
    
    # Run syncoid with recommended options
    if syncoid \
        --recursive \
        --no-privilege-elevation \
        --identifier="$device" \
        --compress="$COMPRESS" \
        "$source" "$dest" 2>&1 | tee "/tmp/syncoid-${device}.log"; then
        
        log_info "  ✓ Replication completed successfully"
        return 0
    else
        log_error "  ✗ Replication failed (check /tmp/syncoid-${device}.log)"
        return 1
    fi
}

# Main replication workflow
main() {
    log_info "=== Multi-Device ZFS Replication ==="
    echo
    
    # Check if syncoid is available
    if ! command -v syncoid &> /dev/null; then
        log_error "syncoid command not found. Install sanoid package."
        exit 1
    fi
    
    # Test all SSH connections first
    log_info "Testing SSH connectivity to all devices..."
    local failed_devices=()
    
    for device in "${!DEVICES[@]}"; do
        if ! test_ssh "$device" "${DEVICES[$device]}"; then
            failed_devices+=("$device")
        fi
    done
    
    if [ ${#failed_devices[@]} -gt 0 ]; then
        log_warn "SSH connectivity failed for: ${failed_devices[*]}"
        log_warn "These devices will be skipped."
        echo
    fi
    
    # Replicate from each device
    local success_count=0
    local fail_count=0
    
    for device in "${!DEVICES[@]}"; do
        # Skip devices with failed SSH
        if [[ " ${failed_devices[*]} " =~ " ${device} " ]]; then
            log_warn "Skipping $device (SSH connection failed)"
            ((fail_count++))
            continue
        fi
        
        echo
        if replicate_device "$device" "${DEVICES[$device]}"; then
            ((success_count++))
        else
            ((fail_count++))
        fi
        
        # Stagger replications to avoid network congestion
        if [ $((success_count + fail_count)) -lt ${#DEVICES[@]} ]; then
            log_info "Waiting 30 seconds before next replication..."
            sleep 30
        fi
    done
    
    # Summary
    echo
    log_info "=== Replication Summary ==="
    log_info "Successful: $success_count"
    log_info "Failed: $fail_count"
    log_info "Total: ${#DEVICES[@]}"
    
    if [ $fail_count -gt 0 ]; then
        exit 1
    fi
}

main "$@"
