# ZFS Quick Reference

Quick command cheatsheet for common ZFS operations.

## Pool Health

```bash
# Check all pools
zpool list
zpool status

# Check specific pool
zpool status -v tank

# Check scrub status
zpool status tank | grep scrub

# List all pools with health
zpool list -o name,size,cap,health
```

## Pool Management

```bash
# Create RAIDZ1 pool (3 disks minimum)
zpool create tank raidz /dev/sda /dev/sdb /dev/sdc

# Add SLOG device
zpool add tank log /dev/nvme0n1p1

# Add L2ARC cache
zpool add tank cache /dev/nvme0n1p2

# Scrub pool
zpool scrub tank

# Replace failed disk
zpool replace tank /dev/sdb /dev/sdx

# Import/export pool
zpool export tank
zpool import tank
```

## Dataset Operations

```bash
# List all datasets
zfs list

# List with properties
zfs list -o name,used,avail,refer,compression

# Create dataset
zfs create tank/data

# Create with properties
zfs create -o compression=lz4 -o atime=off tank/data

# Destroy dataset
zfs destroy tank/data

# Get property
zfs get compression tank/data

# Set property
zfs set compression=lz4 tank/data
```

## Snapshots

```bash
# Create snapshot
zfs snapshot tank/data@2026-02-08

# List snapshots
zfs list -t snapshot
zfs list -t snapshot tank/data

# Rollback to snapshot (DESTRUCTIVE)
zfs rollback tank/data@2026-02-08

# Clone snapshot
zfs clone tank/data@2026-02-08 tank/data-copy

# Destroy snapshot
zfs destroy tank/data@2026-02-08

# Browse snapshot files
cd /tank/data/.zfs/snapshot/2026-02-08
```

## Replication (Manual)

```bash
# Full send (initial)
zfs send tank/data@snapshot | ssh backup 'zfs receive backup/data'

# Incremental send
zfs send -i @prev @current tank/data | ssh backup 'zfs receive backup/data'

# Resume interrupted send
TOKEN=$(ssh backup 'zfs get -H -o value receive_resume_token backup/data')
zfs send -t $TOKEN | ssh backup 'zfs receive backup/data'

# Check for resume token
zfs get receive_resume_token backup/data
```

## Sanoid (Automated Snapshots)

```bash
# Take snapshots
sudo sanoid --take-snapshots --verbose

# Prune old snapshots
sudo sanoid --prune-snapshots --verbose

# Both (typical cron usage)
sudo sanoid --cron

# Dry run
sudo sanoid --readonly --verbose
```

## Syncoid (Automated Replication)

```bash
# Basic replication
syncoid tank/data backup/data

# Recursive replication
syncoid --recursive tank backup

# Remote replication (pull)
syncoid --recursive user@device1:tank backup/device1

# With compression
syncoid --recursive --compress=zstd-fast user@device1:tank backup/device1

# Non-root replication
syncoid --recursive --no-privilege-elevation user@device1:tank backup/device1

# With identifier (multi-source)
syncoid --recursive --identifier=device1 user@device1:tank backup/device1
```

## Property Optimization

```bash
# Enable compression (always recommended)
zfs set compression=lz4 tank/data

# Disable atime (reduce writes)
zfs set atime=off tank/data

# Tune recordsize for workload
zfs set recordsize=8K tank/databases     # Small random I/O
zfs set recordsize=128K tank/data        # Default balanced
zfs set recordsize=1M tank/media         # Large sequential I/O

# Set quota
zfs set quota=1T tank/data

# Set reservation
zfs set reservation=500G tank/data
```

## ZFS Delegation (Non-Root)

```bash
# Allow user to create/receive datasets
zfs allow -u username create,mount,receive backup/device1

# View delegations
zfs allow backup/device1

# Remove delegation
zfs unallow -u username backup/device1
```

## Bookmarks (Space-Efficient Replication)

```bash
# Create bookmark
zfs bookmark tank/data@snapshot tank/data#bookmark

# Send from bookmark (incremental)
zfs send -i tank/data#bookmark tank/data@new | ssh backup 'zfs receive backup/data'

# List bookmarks
zfs list -t bookmark tank/data

# Destroy bookmark
zfs destroy tank/data#bookmark
```

## Pool Health Check Script

```bash
# Check all pools
./scripts/pool-health.sh

# Check specific pool
./scripts/pool-health.sh tank

# JSON output
./scripts/pool-health.sh --json
```

## Monitoring & Maintenance

```bash
# Check pool capacity
zpool list -o name,cap

# Check for errors
zpool status -v | grep errors

# View ARC stats
arc_summary

# Limit scrub speed (50 MB/s)
echo 50000000 | sudo tee /sys/module/zfs/parameters/zfs_scan_limit
```

## Cron Automation

```bash
# Sanoid snapshots (hourly)
0 * * * * /usr/sbin/sanoid --cron

# Syncoid replication (every 4 hours, staggered)
0 */4 * * * /usr/sbin/syncoid --recursive --compress=zstd-fast user@device1:tank /backup/device1
15 */4 * * * /usr/sbin/syncoid --recursive --compress=zstd-fast user@device2:tank /backup/device2

# Monthly scrub (first Sunday at 2 AM)
0 2 * * 0 [ $(date +\%d) -le 7 ] && /usr/sbin/zpool scrub tank
```

## Emergency Recovery

```bash
# Import pool on new system
zpool import

# Import specific pool
zpool import tank

# Force import
zpool import -f tank

# Readonly import
zpool import -o readonly=on tank

# Recovery import
zpool import -F tank

# Replace failed disk
zpool replace tank /dev/sdb /dev/sdx

# Monitor resilver progress
watch -n 5 zpool status tank
```

## Capacity Management

```bash
# Identify space hogs
zfs list -o space tank

# Check snapshot space
zfs list -t snapshot -o space tank/data

# Destroy old snapshots
sanoid --prune-snapshots

# Enable compression
zfs set compression=lz4 tank/data
```

## Common Workflows

### Setup New Dataset with Snapshots

```bash
# 1. Create dataset
zfs create tank/important

# 2. Optimize properties
zfs set compression=lz4 tank/important
zfs set atime=off tank/important
zfs set recordsize=128K tank/important

# 3. Add to Sanoid config
sudo nano /etc/sanoid/sanoid.conf
# Add [tank/important] with template

# 4. Take initial snapshot
sudo sanoid --take-snapshots --dataset tank/important
```

### Setup Pull-Based Replication

```bash
# 1. Setup SSH keys (on backup server)
ssh-keygen -t ed25519 -C "zfs-replication"
ssh-copy-id user@device1

# 2. Test SSH
ssh user@device1 echo "SSH working"

# 3. Delegate permissions (on backup server)
zfs allow -u replication-user create,mount,receive backup/device1

# 4. Test manual replication
syncoid --recursive user@device1:tank backup/device1

# 5. Add to cron
crontab -e
# Add: 0 */4 * * * /usr/sbin/syncoid --recursive --compress=zstd-fast user@device1:tank backup/device1
```

### Restore from Snapshot

```bash
# Option 1: Rollback (DESTRUCTIVE)
zfs rollback tank/data@yesterday

# Option 2: Clone (non-destructive)
zfs clone tank/data@yesterday tank/data-restored

# Option 3: Restore individual files
cd /tank/data/.zfs/snapshot/yesterday
cp important-file.txt /tank/data/
```

## Performance Tips

| Operation | Command | Impact |
|-----------|---------|--------|
| Enable compression | `zfs set compression=lz4 pool/data` | Often improves performance |
| Disable atime | `zfs set atime=off pool/data` | Reduces write amplification |
| Tune recordsize | `zfs set recordsize=8K pool/db` | Match workload (8K=DB, 1M=media) |
| Add SLOG | `zpool add pool log /dev/nvme0n1` | Faster sync writes |
| Add L2ARC | `zpool add pool cache /dev/nvme0n1` | Cache reads on SSD |

## Common Errors

**"pool is busy"**
```bash
# Check what's using it
lsof | grep poolname
fuser -m /poolname

# Force export (last resort)
zpool export -f poolname
```

**"cannot receive: permission denied"**
```bash
# Delegate permissions
zfs allow -u username create,mount,receive pool/dataset
```

**"cannot receive: destination has been modified"**
```bash
# Use force flag (DESTRUCTIVE)
syncoid --force-delete source:pool dest:pool

# Or manually resolve conflicts
zfs destroy pool/dataset@conflicting-snapshot
```

## Useful One-Liners

```bash
# List pools sorted by capacity
zpool list -o name,cap | sort -k2 -rn

# Find largest datasets
zfs list -o name,used | sort -k2 -rn | head -10

# Count snapshots per dataset
zfs list -H -t snapshot -o name | cut -d@ -f1 | uniq -c

# Total snapshot space
zfs list -t snapshot -o used | tail -n +2 | awk '{sum+=$1} END {print sum}'

# Pools needing scrub
zpool status | grep -B1 "scan: scrub" | grep -v "scan:" | grep -v "^--"
```
