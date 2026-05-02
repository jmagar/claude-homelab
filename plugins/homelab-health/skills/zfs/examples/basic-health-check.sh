#!/bin/bash
# Basic ZFS Pool Health Check Example
# This script demonstrates how to check pool health and capacity

set -euo pipefail

echo "=== ZFS Pool Health Check ==="
echo

# Check if ZFS is available
if ! command -v zpool &> /dev/null; then
    echo "ERROR: zpool command not found. Is ZFS installed?"
    exit 1
fi

# Get list of all pools
pools=$(zpool list -H -o name 2>/dev/null || true)

if [ -z "$pools" ]; then
    echo "No ZFS pools found on this system"
    exit 0
fi

# Check each pool
for pool in $pools; do
    echo "Pool: $pool"
    echo "----------------------------------------"
    
    # Get pool status
    health=$(zpool list -H -o health "$pool")
    cap=$(zpool list -H -o cap "$pool" | tr -d '%')
    size=$(zpool list -H -o size "$pool")
    free=$(zpool list -H -o free "$pool")
    
    # Display basic info
    echo "  Health: $health"
    echo "  Size: $size"
    echo "  Free: $free"
    echo "  Capacity: ${cap}%"
    
    # Health warnings
    if [ "$health" != "ONLINE" ]; then
        echo "  ⚠️  WARNING: Pool is $health!"
    fi
    
    # Capacity warnings
    if [ "$cap" -ge 90 ]; then
        echo "  🚨 CRITICAL: Pool is ${cap}% full! (>90%)"
    elif [ "$cap" -ge 80 ]; then
        echo "  ⚠️  WARNING: Pool is ${cap}% full! (>80%)"
    elif [ "$cap" -ge 70 ]; then
        echo "  ℹ️  INFO: Pool is ${cap}% full (approaching 80%)"
    fi
    
    # Check last scrub
    last_scrub=$(zpool status "$pool" | grep "scan:" | head -1)
    echo "  Last scrub: ${last_scrub#*scan: }"
    
    echo
done

echo "Health check complete!"
