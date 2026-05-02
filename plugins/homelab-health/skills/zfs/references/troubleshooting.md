# ZFS Troubleshooting Guide

## Common Replication Failures

### 1. Network Disconnection

**Symptom:** `cannot receive: failed to read from stream`

**Cause:** Network interruption during `zfs send/receive`

**Solution:**
```bash
# Check for resume token on destination
zfs get receive_resume_token backup/dataset

# If token exists, resume on source
RESUME_TOKEN=$(zfs get -H -o value receive_resume_token backup/dataset)
zfs send -t $RESUME_TOKEN | ssh backup-host zfs recv backup/dataset

# If no token, restart with -F (rollback destination - DESTRUCTIVE)
zfs send -i @previous @current | ssh backup-host zfs recv -F backup/dataset
```

**Prevention:** Syncoid automatically handles resume tokens (v1.4.18+)

### 2. Destination Out of Space

**Symptom:** `cannot receive new filesystem stream: out of space`

**Cause:** Backup pool capacity exhausted

**Solution:**
```bash
# Check destination capacity
zpool list backup-pool

# Prune old snapshots
sanoid --prune-snapshots --verbose

# Or manually destroy old snapshots
zfs destroy backup/dataset@old-snapshot

# Increase quota if set
zfs set quota=none backup/dataset
```

**Prevention:**
- Monitor capacity with alerts at 70% (warning), 80% (critical)
- Enable LZ4 compression on backup datasets
- Set aggressive pruning policies

### 3. Source Snapshot Deleted

**Symptom:** `cannot send: snapshot tank/data@snap has been destroyed`

**Cause:** Base snapshot deleted on source before replication completed

**Solution:**
```bash
# Option 1: Use bookmarks (prevents this issue)
zfs bookmark tank/data@snapshot tank/data#bookmark
zfs send -i tank/data#bookmark tank/data@new-snap | ssh dest zfs recv

# Option 2: Full resend (time-consuming)
zfs send -R tank/data@latest | ssh dest zfs recv -F backup/data
```

**Prevention:**
- Use `--no-sync-snap` with syncoid to preserve base snapshots
- Implement bookmark-based replication for space-constrained sources
- Never manually delete snapshots used for replication

### 4. Conflicting Snapshots

**Symptom:** `destination backup/data has been modified since most recent snapshot`

**Cause:** Manual changes or other replication tools modified destination

**Solution:**
```bash
# WARNING: DESTRUCTIVE - removes conflicting snapshots
syncoid --force-delete source:tank/data dest:backup/data

# Or manually identify and destroy conflicting snapshots
zfs list -t snapshot backup/data
zfs destroy backup/data@conflicting-snap
```

**Prevention:**
- Never manually modify backup datasets
- Use single replication tool per destination
- Use `--identifier` flag with syncoid for multi-source setups

### 5. Missing Common Snapshot

**Symptom:** `cannot send: incremental source does not exist`

**Cause:** No common snapshot between source and destination

**Solution:**
```bash
# Find common snapshots
zfs list -t snapshot -H -o name source/dataset | grep "@" > /tmp/source-snaps
zfs list -t snapshot -H -o name dest/dataset | grep "@" > /tmp/dest-snaps
comm -12 /tmp/source-snaps /tmp/dest-snaps

# If common snapshot found, use it
zfs send -i @common @latest | ssh dest zfs recv dest/dataset

# If no common snapshot, full resend required
zfs send -R source/dataset@latest | ssh dest zfs recv -F dest/dataset
```

**Prevention:**
- Maintain retention overlap between source and destination
- Use syncoid which automatically handles common snapshot detection
- Never prune all snapshots at once

## Pool Health Issues

### Degraded Pool (RAIDZ1)

**Symptom:** Pool state shows `DEGRADED`

**Cause:** One disk has failed in RAIDZ1 pool

**CRITICAL:** RAIDZ1 has single parity - a second disk failure means data loss!

**Solution:**
```bash
# Identify failed disk
zpool status -v pool

# Replace failed disk
# 1. Insert new disk
# 2. Replace in pool (ZFS rebuilds automatically)
zpool replace pool old-disk new-disk

# Monitor resilver progress
zpool status pool
```

**Expected resilver time:** 1-2 TB/hour on spinning disks

**Prevention:**
- Monitor SMART data weekly
- Replace disks showing reallocated sectors
- Consider migrating to RAIDZ2 for better redundancy

### High Capacity (>80%)

**Symptom:** Pool capacity warnings, performance degradation

**Cause:** Pool is approaching full capacity

**Solution:**
```bash
# Identify space hogs
zfs list -o space

# Check snapshot space usage
zfs list -t snapshot -o space

# Prune old snapshots
sanoid --prune-snapshots

# Enable compression if not already
zfs set compression=lz4 pool/dataset

# Or add more storage
zpool add pool raidz1 new-disk1 new-disk2 new-disk3
```

**Prevention:**
- Set up capacity alerts at 70%, 80%, 90%
- Implement automated snapshot pruning
- Plan storage expansion before reaching 80%

### Scrub Errors

**Symptom:** Scrub reports checksum errors or data corruption

**Cause:** Bit rot, disk errors, or hardware issues

**Solution:**
```bash
# Review scrub results
zpool status -v pool

# If repairable errors, scrub fixes them automatically
# If permanent errors exist:
zpool status -v pool | grep "DEGRADED\|FAULTED"

# For permanent errors on files (not metadata):
# 1. Restore from backup
# 2. Or accept data loss and clear errors
zpool clear pool
```

**Prevention:**
- Run monthly scrubs minimum
- Monitor SMART data
- Replace failing disks immediately

## Performance Issues

### Slow Writes

**Symptom:** Write performance significantly degraded

**Possible causes:**
1. **Pool >80% full** - Fragmentation increases
2. **Sync writes without SLOG** - Every write waits for disk
3. **Deduplication enabled** - Massive RAM requirement

**Solutions:**
```bash
# Check pool capacity
zpool list

# Disable dedup if enabled (doesn't affect existing data)
zfs set dedup=off pool/dataset

# Add SSD SLOG device for sync writes
zpool add pool log nvme0n1p1

# Enable compression (often improves write speed)
zfs set compression=lz4 pool/dataset
```

### Slow Reads

**Symptom:** Read performance slower than expected

**Possible causes:**
1. **Insufficient ARC** - Not enough RAM for cache
2. **Random I/O on large recordsize** - Mismatch with workload

**Solutions:**
```bash
# Check ARC hit rate
arc_summary | grep "Hit Rate"

# Add more RAM (ARC automatically uses it)
# Or add L2ARC SSD cache
zpool add pool cache nvme0n1p2

# Tune recordsize for workload
zfs set recordsize=8K pool/databases   # Small random I/O
zfs set recordsize=1M pool/media       # Large sequential I/O
```

## SSH/Network Issues

### Connection Refused

**Symptom:** `ssh: connect to host refused`

**Cause:** SSH service not running or firewall blocking

**Solution:**
```bash
# On destination, check SSH status
systemctl status sshd

# Check firewall
sudo ufw status
sudo ufw allow 22/tcp

# Test connection
ssh user@backup-host echo "SSH working"
```

### Permission Denied (Public Key)

**Symptom:** `Permission denied (publickey)`

**Cause:** SSH keys not configured or wrong permissions

**Solution:**
```bash
# Generate SSH key if not exists
ssh-keygen -t ed25519 -C "zfs-replication"

# Copy to backup server
ssh-copy-id user@backup-host

# Or manually
cat ~/.ssh/id_ed25519.pub | ssh user@backup-host "cat >> ~/.ssh/authorized_keys"

# Fix permissions
chmod 700 ~/.ssh
chmod 600 ~/.ssh/id_ed25519
chmod 644 ~/.ssh/id_ed25519.pub
```

### ZFS Permission Denied (Non-Root)

**Symptom:** `cannot receive: permission denied`

**Cause:** User lacks ZFS permissions

**Solution:**
```bash
# On destination, delegate ZFS permissions
zfs allow -u replication-user create,mount,receive backup/device1

# Verify permissions
zfs allow backup/device1

# Use --no-privilege-elevation with syncoid
syncoid --no-privilege-elevation source:pool/data dest:backup/data
```

## Recovery Procedures

### Restore from Snapshot

```bash
# List available snapshots
zfs list -t snapshot pool/dataset

# Rollback to snapshot (DESTRUCTIVE - loses changes since snapshot)
zfs rollback pool/dataset@snapshot

# Or clone snapshot to new dataset (non-destructive)
zfs clone pool/dataset@snapshot pool/dataset-restored

# Or restore individual files
cd /pool/dataset/.zfs/snapshot/snapshot-name
cp file /pool/dataset/
```

### Full Pool Recovery (Disaster Scenario)

```bash
# 1. Import pool (if moved to new system)
zpool import

# 2. Import specific pool
zpool import -f pool

# 3. If pool won't import, try readonly
zpool import -o readonly=on pool

# 4. If pool damaged, try recovery mode
zpool import -F pool

# 5. Restore from backup
zfs recv -F pool/dataset < backup-stream
```

## Decision Trees

### Replication Failed - What to Do?

```
Replication Failed
├─ Resume token exists?
│  ├─ YES → zfs send -t <token>
│  └─ NO → Check last common snapshot
│     ├─ Common snapshot found?
│     │  ├─ YES → zfs send -i @common @new
│     │  └─ NO → Full resend with -F (destructive!)
│     └─ Disk/network issue?
│        └─ Fix underlying problem, retry
```

### Pool State Analysis

```
Pool State
├─ ONLINE → ✅ Healthy
├─ DEGRADED → ⚠️ Disk failure (replace immediately for RAIDZ1!)
├─ FAULTED → 🚨 Multiple failures (data loss likely)
├─ UNAVAIL → 🚨 Cannot open pool (check hardware)
└─ SUSPENDED → ⏸️ Waiting for device (check connections)
```

### Performance Troubleshooting

```
Performance Issue
├─ Slow writes?
│  ├─ Pool >80% full? → Add storage or prune snapshots
│  ├─ Sync=standard without SLOG? → Add SLOG SSD
│  └─ Dedup enabled? → Disable (zfs set dedup=off)
├─ Slow reads?
│  ├─ ARC hit rate <80%? → Add RAM or L2ARC
│  └─ Recordsize mismatch? → Tune per workload
└─ High latency?
   └─ Check disk health (SMART data)
```
