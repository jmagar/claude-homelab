#!/bin/bash
# ZFS Performance Tuning Example
# Demonstrates how to optimize ZFS properties for different workloads

set -euo pipefail

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

log_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

log_cmd() {
    echo -e "${BLUE}[CMD]${NC} $1"
}

log_warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

# Show current properties
show_properties() {
    local dataset=$1
    
    log_info "Current properties for $dataset:"
    zfs get compression,atime,recordsize,sync,dedup "$dataset" 2>/dev/null || {
        log_warn "Dataset $dataset not found"
        return 1
    }
}

# Optimize for databases (MySQL, PostgreSQL)
tune_for_database() {
    local dataset=$1
    
    log_info "Tuning $dataset for database workload..."
    echo
    
    log_cmd "zfs set compression=lz4 $dataset"
    log_info "  - LZ4 compression (minimal CPU overhead)"
    echo
    
    log_cmd "zfs set atime=off $dataset"
    log_info "  - Disable atime (reduce write amplification)"
    echo
    
    log_cmd "zfs set recordsize=8K $dataset"
    log_info "  - 8K recordsize (matches database block size)"
    echo
    
    log_cmd "zfs set logbias=latency $dataset"
    log_info "  - Optimize for low latency"
    echo
    
    log_cmd "zfs set sync=standard $dataset"
    log_info "  - Standard sync writes"
}

# Optimize for media (large files)
tune_for_media() {
    local dataset=$1
    
    log_info "Tuning $dataset for media/large file workload..."
    echo
    
    log_cmd "zfs set compression=lz4 $dataset"
    log_info "  - LZ4 compression (beneficial even for media)"
    echo
    
    log_cmd "zfs set atime=off $dataset"
    log_info "  - Disable atime"
    echo
    
    log_cmd "zfs set recordsize=1M $dataset"
    log_info "  - 1M recordsize (optimal for large sequential I/O)"
    echo
    
    log_cmd "zfs set sync=disabled $dataset"
    log_info "  - Disabled sync (faster writes, less durability)"
    log_warn "    WARNING: Use only for non-critical media files"
}

# Optimize for general use
tune_for_general() {
    local dataset=$1
    
    log_info "Tuning $dataset for general workload..."
    echo
    
    log_cmd "zfs set compression=lz4 $dataset"
    log_info "  - LZ4 compression (always recommended)"
    echo
    
    log_cmd "zfs set atime=off $dataset"
    log_info "  - Disable atime"
    echo
    
    log_cmd "zfs set recordsize=128K $dataset"
    log_info "  - 128K recordsize (default, balanced)"
}

# Show recommendations
show_recommendations() {
    echo
    log_info "=== ZFS Performance Tuning Recommendations ==="
    echo
    
    echo "Workload Type    | recordsize | compression | atime | sync"
    echo "-----------------|------------|-------------|-------|----------"
    echo "Database         | 8K         | lz4         | off   | standard"
    echo "Virtual Machines | 16K        | lz4         | off   | standard"
    echo "General Files    | 128K       | lz4         | off   | standard"
    echo "Media/Video      | 1M         | lz4         | off   | disabled"
    echo
    
    log_info "Universal recommendations:"
    echo "  ✓ Always enable LZ4 compression (0% CPU overhead)"
    echo "  ✓ Always disable atime (reduces writes)"
    echo "  ✗ Never enable dedup (requires 5GB RAM per TB)"
    echo
    
    log_warn "Important notes:"
    echo "  - Set recordsize BEFORE writing data"
    echo "  - Changing recordsize doesn't affect existing data"
    echo "  - Test performance after tuning"
}

# Main menu
main() {
    local dataset=${1:-}
    local workload=${2:-}
    
    if [ -z "$dataset" ]; then
        echo "Usage: $0 <dataset> [workload]"
        echo
        echo "Workloads:"
        echo "  database  - MySQL, PostgreSQL, etc."
        echo "  media     - Video, photos, large files"
        echo "  general   - Mixed workload (default)"
        echo "  show      - Show recommendations only"
        echo
        echo "Examples:"
        echo "  $0 tank/databases database"
        echo "  $0 tank/media media"
        echo "  $0 tank/data general"
        echo "  $0 - show"
        exit 1
    fi
    
    if [ "$dataset" = "-" ]; then
        show_recommendations
        exit 0
    fi
    
    # Show current properties first
    if [ "$workload" != "show" ]; then
        show_properties "$dataset" || exit 1
        echo
    fi
    
    # Apply tuning based on workload
    case "${workload:-general}" in
        database|db)
            tune_for_database "$dataset"
            ;;
        media|video)
            tune_for_media "$dataset"
            ;;
        general|default)
            tune_for_general "$dataset"
            ;;
        show)
            show_recommendations
            ;;
        *)
            log_warn "Unknown workload: $workload"
            show_recommendations
            exit 1
            ;;
    esac
    
    echo
    log_info "Commands shown above - run them to apply tuning"
    log_info "Or add --dry-run flag to this script to see without prompting"
}

main "$@"
