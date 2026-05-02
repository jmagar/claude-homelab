# ZFS Homelab Management

Comprehensive ZFS pool management for homelab environments with multi-device replication, automated snapshots, performance optimization, and health monitoring.

## What It Does

This skill provides complete ZFS management capabilities for homelab environments:

- **Monitor ZFS pool health** - Check pool state, capacity, scrub status, and errors
- **Automate snapshots** - Hourly/daily/weekly/monthly retention policies with Sanoid
- **Multi-device replication** - Pull-based replication from 5 devices to centralized backup server
- **Optimize properties** - LZ4 compression, atime settings, workload-specific recordsize tuning
- **Schedule scrubs** - Monthly scrub automation for data integrity
- **Troubleshoot issues** - Comprehensive recovery procedures for replication failures, degraded pools, and performance problems

## Architecture

**Recommended Setup: Pull-Based Replication**

```
Device 1 (ZFS) ──┐
Device 2 (ZFS) ──┤
Device 3 (ZFS) ──┼──> Backup Server (backup-server) ──> Google Drive
Device 4 (ZFS) ──┤         Pull-based              (rclone)
Device 5 (ZFS) ──┘         Syncoid
```

**Why Pull-Based?**
- **Security**: Source devices don't need write access to backup server
- **Coordination**: Single control point for all replication jobs
- **Simplicity**: Easier to monitor and troubleshoot from central location

## Setup

### Prerequisites

- **ZFS installed** on all devices (source + backup server)
- **SSH access** between backup server and all source devices
- **Sufficient storage** on backup server (recommend 2x source data for snapshots)
- **RAIDZ1 pools** on source devices (single parity - can tolerate 1 disk failure)

### Step 1: Install Sanoid/Syncoid

On all devices (sources + backup server):

```bash
# Debian/Ubuntu
sudo apt update
sudo apt install sanoid

# FreeBSD
sudo pkg install sanoid
```

### Step 2: Configure SSH Keys

Remote replication requires passwordless SSH authentication between the backup server and source devices. This allows Syncoid to pull snapshots automatically without manual intervention.

On the backup server:

```bash
# Generate SSH key (if not already exists)
ssh-keygen -t ed25519 -C "zfs-replication"

# Copy to each source device
ssh-copy-id user@device1
ssh-copy-id user@device2
ssh-copy-id user@device3
ssh-copy-id user@device4
ssh-copy-id user@device5

# Test passwordless authentication
ssh user@device1 echo "SSH working"
```

### Step 3: Configure ZFS Delegation

For non-root replication (recommended for security), delegate ZFS permissions on the backup server:

```bash
# On backup server, allow replication user to receive datasets
zfs allow -u replication-user create,mount,receive backup/device1
zfs allow -u replication-user create,mount,receive backup/device2
zfs allow -u replication-user create,mount,receive backup/device3
zfs allow -u replication-user create,mount,receive backup/device4
zfs allow -u replication-user create,mount,receive backup/device5

# Verify permissions
zfs allow backup/device1
```

### Step 4: Configure Sanoid

Copy the template and customize for your pools:

```bash
# Copy template
sudo cp assets/sanoid.conf.template /etc/sanoid/sanoid.conf

# Edit configuration
sudo nano /etc/sanoid/sanoid.conf
```

Update dataset paths to match your pools:

```toml
# Production datasets (important data)
[tank/important]
    use_template = production
    recursive = yes
    process_children_only = yes

# Media datasets (less critical)
[tank/media]
    use_template = backup
    recursive = yes

# Backup datasets (on backup server)
[backup/device1]
    use_template = backup_target
    recursive = yes
```

### Step 5: Test Snapshot Creation

```bash
# Create snapshots manually (on source devices)
sudo sanoid --take-snapshots --verbose

# Verify snapshots exist
zfs list -t snapshot

# Test snapshot pruning
sudo sanoid --prune-snapshots --verbose
```

### Step 6: Setup Replication

On the backup server, test manual replication:

```bash
# Pull from device1 (manual test)
syncoid --recursive user@device1:tank backup/device1

# With recommended options
syncoid \
  --recursive \
  --no-privilege-elevation \
  --identifier=device1 \
  --compress=zstd-fast \
  user@device1:tank backup/device1
```

### Step 7: Automate Replication

Add cron jobs on the backup server with staggered schedules:

```bash
# Edit crontab
crontab -e

# Add staggered replication (every 4 hours, offset by 15 minutes)
0 */4 * * * /usr/sbin/syncoid --recursive --compress=zstd-fast user@device1:tank backup/device1
15 */4 * * * /usr/sbin/syncoid --recursive --compress=zstd-fast user@device2:tank backup/device2
30 */4 * * * /usr/sbin/syncoid --recursive --compress=zstd-fast user@device3:tank backup/device3
45 */4 * * * /usr/sbin/syncoid --recursive --compress=zstd-fast user@device4:tank backup/device4
0 1-23/4 * * * /usr/sbin/syncoid --recursive --compress=zstd-fast user@device5:tank backup/device5
```

### Step 8: Schedule Scrubs

Monthly scrubs are **mandatory** for RAIDZ1 data integrity:

```bash
# On each device, add monthly scrub (first Sunday of month at 2 AM)
crontab -e

# Add scrub cron
0 2 * * 0 [ $(date +\%d) -le 7 ] && /usr/sbin/zpool scrub tank
```

## Usage Examples

### Check Pool Health

```bash
# Check all pools
./scripts/pool-health.sh

# Check specific pool
./scripts/pool-health.sh tank

# JSON output for monitoring
./scripts/pool-health.sh --json
```

### Monitor Snapshots

```bash
# List all snapshots
zfs list -t snapshot

# List snapshots for specific dataset
zfs list -t snapshot tank/important

# Check snapshot space usage
zfs list -t snapshot -o space tank/important
```

### Manual Replication

```bash
# Replicate single dataset
syncoid user@device1:tank/data backup/device1/data

# Replicate entire pool recursively
syncoid --recursive user@device1:tank backup/device1

# Resume interrupted replication (automatic with Syncoid)
syncoid --recursive user@device1:tank backup/device1
```

### Performance Tuning

```bash
# Enable compression (always recommended)
zfs set compression=lz4 tank/data

# Disable atime (reduce write amplification)
zfs set atime=off tank/data

# Tune recordsize for workload
zfs set recordsize=8K tank/databases    # Small random I/O
zfs set recordsize=1M tank/media        # Large sequential I/O
zfs set recordsize=128K tank/data       # Default balanced
```

### Restore from Snapshot

```bash
# List available snapshots
zfs list -t snapshot tank/data

# Rollback to snapshot (DESTRUCTIVE - loses changes since snapshot)
zfs rollback tank/data@autosnap_2026-02-08_12:00:00

# Clone snapshot (non-destructive)
zfs clone tank/data@autosnap_2026-02-08_12:00:00 tank/data-restored

# Restore individual files
cd /tank/data/.zfs/snapshot/autosnap_2026-02-08_12:00:00
cp important-file.txt /tank/data/
```

## Common Workflows

### Daily Operations

1. **Morning health check**: `./scripts/pool-health.sh`
2. **Review replication logs**: `grep syncoid /var/log/syslog | tail -20`
3. **Check capacity warnings**: Monitor pools above 70% capacity
4. **Verify snapshots**: Confirm yesterday's snapshots exist

### Weekly Maintenance

1. **Review SMART data**: Check for failing disks
2. **Test manual replication**: Verify SSH connectivity
3. **Check scrub completion**: Ensure monthly scrubs finished successfully
4. **Prune old snapshots**: `sudo sanoid --prune-snapshots --verbose`

### Monthly Tasks

1. **Verify scrub results**: Check for checksum errors
2. **Review capacity trends**: Plan storage expansion before reaching 80%
3. **Test restore procedure**: Practice restoring from snapshots
4. **Update documentation**: Record any configuration changes

## Troubleshooting

For detailed troubleshooting procedures, see [references/troubleshooting.md](references/troubleshooting.md).

### Quick Diagnostics

**Replication failed?**
```bash
# Check for resume token
zfs get receive_resume_token backup/device1

# Check SSH connectivity
ssh user@device1 echo "SSH working"

# Review syncoid logs
grep syncoid /var/log/syslog | tail -50
```

**Pool degraded?**
```bash
# Check pool status
zpool status -v tank

# Identify failed disk
zpool status tank | grep DEGRADED

# Replace failed disk (after inserting new disk)
zpool replace tank old-disk new-disk
```

**High capacity?**
```bash
# Identify space hogs
zfs list -o space tank

# Prune old snapshots
sudo sanoid --prune-snapshots

# Enable compression if not already
zfs set compression=lz4 tank/data
```

## Critical Warnings

### RAIDZ1 Risks

- **Single parity** - Can tolerate only **1 disk failure**
- **Two disk failures = complete data loss**
- **Monthly scrubs MANDATORY** for data integrity
- Monitor SMART data aggressively
- Replace failing disks immediately
- Consider migrating to RAIDZ2 for critical data

### Capacity Thresholds

- **<70%**: Optimal performance
- **70%**: Warning threshold (plan expansion)
- **80%**: Critical (fragmentation increases, performance degrades)
- **90%**: Emergency (severe write degradation)
- **>95%**: Risk of pool exhaustion

### Never Enable Dedup

- Requires **5GB RAM per TB** of data
- Severe performance penalty
- Use LZ4 compression instead (0% CPU overhead)

## Performance Expectations

- **Scrub speed**: 1-2 TB/hour on spinning disks
- **Resilver speed**: 1-2 TB/hour (after disk replacement)
- **Replication speed**: Network-limited (typically 100-1000 MB/s)
- **Compression ratio**: 1.5-2.0x with LZ4 on typical data

## References

- **Quick Reference**: See [references/quick-reference.md](references/quick-reference.md) for command cheatsheet
- **Command Reference**: See [references/command-reference.md](references/command-reference.md) for complete ZFS command syntax
- **Troubleshooting**: See [references/troubleshooting.md](references/troubleshooting.md) for detailed recovery procedures
- **Research Report**: Based on 130+ URLs, 56,000+ vectors, 112 sources

## External Documentation

- [OpenZFS Documentation](https://openzfs.github.io/openzfs-docs/)
- [Oracle ZFS Administration Guide](https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/manage-zfs/)
- [FreeBSD ZFS Handbook](https://docs.freebsd.org/en/books/handbook/zfs/)
- [Sanoid/Syncoid GitHub](https://github.com/jimsalterjrs/sanoid)
- [zrepl Documentation](https://zrepl.github.io/)

## Version

**Skill Version**: 1.0.0
**Last Updated**: 2026-02-08
**Based on Research**: 130+ URLs, 56,000+ vectors, 112 sources
