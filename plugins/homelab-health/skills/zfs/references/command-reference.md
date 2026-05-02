# ZFS Command Reference

Complete command syntax reference for ZFS pool and dataset management.

## Table of Contents

1. [Pool Management (zpool)](#pool-management-zpool)
2. [Dataset Management (zfs)](#dataset-management-zfs)
3. [Sanoid Commands](#sanoid-commands)
4. [Syncoid Commands](#syncoid-commands)

---

## Pool Management (zpool)

### zpool list

List all ZFS pools with capacity and health information.

**Syntax:**
```bash
zpool list [pool] [-H] [-o property[,property]...]
```

**Common Options:**
- `-H` - Scripting mode (no headers, tab-separated)
- `-o` - Specify properties to display

**Properties:**
- `name` - Pool name
- `size` - Total size
- `alloc` - Allocated space
- `free` - Free space
- `cap` - Capacity (percentage)
- `health` - Pool health (ONLINE, DEGRADED, FAULTED)
- `dedup` - Deduplication ratio

**Examples:**
```bash
# List all pools
zpool list

# List specific pool
zpool list tank

# Custom properties
zpool list -o name,size,alloc,free,cap,health

# Scripting mode
zpool list -H -o name,cap
```

### zpool status

Display detailed health status and configuration of pools.

**Syntax:**
```bash
zpool status [-v] [pool]
```

**Options:**
- `-v` - Verbose mode (show individual file errors)
- `-x` - Only show pools with problems

**Examples:**
```bash
# Status of all pools
zpool status

# Status of specific pool
zpool status tank

# Verbose output with errors
zpool status -v tank

# Only unhealthy pools
zpool status -x
```

**Output Fields:**
- `state` - ONLINE, DEGRADED, FAULTED, OFFLINE, UNAVAIL, SUSPENDED
- `scan` - Scrub/resilver status and progress
- `config` - vdev hierarchy and health
- `errors` - Read/write/checksum error counts

### zpool scrub

Initiate or pause scrub operation for data integrity checking.

**Syntax:**
```bash
zpool scrub [-s | -p] pool
```

**Options:**
- `-s` - Stop scrub in progress
- `-p` - Pause scrub in progress

**Examples:**
```bash
# Start scrub
zpool scrub tank

# Pause scrub
zpool scrub -p tank

# Stop scrub
zpool scrub -s tank

# Check scrub progress
zpool status tank
```

**Notes:**
- Scrubs verify checksums of all data in the pool
- Can run while pool is online (performance impact minimal)
- Monthly scrubs recommended for RAIDZ1/2/3
- Resume from where they left off if interrupted

### zpool create

Create a new ZFS storage pool.

**Syntax:**
```bash
zpool create [-f] [-o property=value] pool vdev_spec
```

**Options:**
- `-f` - Force creation (override warnings)
- `-o property=value` - Set pool properties

**vdev Types:**
- `mirror` - Mirror (n-way replication)
- `raidz` - RAIDZ1 (single parity)
- `raidz2` - RAIDZ2 (double parity)
- `raidz3` - RAIDZ3 (triple parity)
- `log` - Dedicated ZIL device
- `cache` - L2ARC cache device
- `spare` - Hot spare device

**Examples:**
```bash
# Single disk (not recommended for production)
zpool create tank /dev/sda

# Mirror
zpool create tank mirror /dev/sda /dev/sdb

# RAIDZ1 (3 disks)
zpool create tank raidz /dev/sda /dev/sdb /dev/sdc

# RAIDZ2 (6 disks)
zpool create tank raidz2 /dev/sda /dev/sdb /dev/sdc /dev/sdd /dev/sde /dev/sdf

# With options
zpool create -o ashift=12 tank raidz /dev/sda /dev/sdb /dev/sdc
```

### zpool add

Add vdevs to an existing pool.

**Syntax:**
```bash
zpool add [-f] pool vdev_spec
```

**Examples:**
```bash
# Add mirror vdev
zpool add tank mirror /dev/sdc /dev/sdd

# Add SLOG device
zpool add tank log /dev/nvme0n1p1

# Add L2ARC cache
zpool add tank cache /dev/nvme0n1p2

# Add hot spare
zpool add tank spare /dev/sde
```

**Important:**
- Cannot change vdev type after creation (mirror → raidz impossible)
- Can add additional vdevs of same type
- Mixing vdev types (mirror + raidz) in same pool possible but not recommended

### zpool replace

Replace a disk in a pool (resilver automatically starts).

**Syntax:**
```bash
zpool replace pool old-device [new-device]
```

**Examples:**
```bash
# Replace failed disk with new disk
zpool replace tank /dev/sdb /dev/sdx

# Replace disk with same name (if removed and re-inserted)
zpool replace tank /dev/sdb

# Monitor resilver progress
watch -n 5 zpool status tank
```

**Notes:**
- Resilver copies data from redundant vdevs to new disk
- Pool remains accessible during resilver (degraded performance)
- For RAIDZ1, no redundancy until resilver completes (risk!)

### zpool import/export

Import or export pools for portability.

**Syntax:**
```bash
zpool import [-d dir] [pool | id]
zpool export pool
```

**Options:**
- `-d dir` - Search for devices in directory
- `-f` - Force import
- `-F` - Recovery import (attempt to fix damaged pool)
- `-o property=value` - Set pool properties on import

**Examples:**
```bash
# List importable pools
zpool import

# Import pool
zpool import tank

# Import pool from specific directory
zpool import -d /dev/disk/by-id tank

# Force import (if pool was not cleanly exported)
zpool import -f tank

# Recovery import
zpool import -F tank

# Export pool
zpool export tank
```

---

## Dataset Management (zfs)

### zfs list

List datasets and their properties.

**Syntax:**
```bash
zfs list [-t type] [-r] [-o property[,property]...] [dataset]
```

**Options:**
- `-t type` - Type: `filesystem`, `snapshot`, `volume`, `bookmark`, `all`
- `-r` - Recursive listing
- `-H` - Scripting mode (no headers)
- `-o property` - Specify properties to display
- `-s property` - Sort by property
- `-S property` - Reverse sort by property

**Common Properties:**
- `name` - Dataset name
- `used` - Space used by dataset and snapshots
- `avail` - Available space
- `refer` - Referenced data (excluding snapshots)
- `mountpoint` - Mount point
- `compression` - Compression algorithm
- `compressratio` - Achieved compression ratio

**Examples:**
```bash
# List all datasets
zfs list

# List all snapshots
zfs list -t snapshot

# List specific dataset
zfs list tank/data

# Recursive with custom properties
zfs list -r -o name,used,avail,refer,mountpoint,compression tank

# Scripting mode
zfs list -H -o name,used
```

### zfs create

Create a new dataset or volume.

**Syntax:**
```bash
zfs create [-p] [-o property=value] dataset
zfs create -V size [-o property=value] volume
```

**Options:**
- `-p` - Create parent datasets if needed
- `-o property=value` - Set properties
- `-V size` - Create volume (block device) instead of filesystem

**Examples:**
```bash
# Create dataset
zfs create tank/data

# Create with parent datasets
zfs create -p tank/backups/device1

# Create with properties
zfs create -o compression=lz4 -o atime=off tank/data

# Create volume (block device)
zfs create -V 10G tank/vm-disk1
```

### zfs destroy

Destroy dataset or snapshot.

**Syntax:**
```bash
zfs destroy [-r] [-R] [-f] dataset|snapshot
```

**Options:**
- `-r` - Recursive (destroy children)
- `-R` - Recursive (destroy children and snapshots)
- `-f` - Force (unmount if mounted)

**Examples:**
```bash
# Destroy dataset
zfs destroy tank/old-data

# Destroy with children
zfs destroy -r tank/old-data

# Destroy snapshot
zfs destroy tank/data@old-snapshot

# Destroy all snapshots of dataset
zfs destroy -R tank/data
```

**WARNING:** Destructive operation, no confirmation prompt!

### zfs get/set

Get or set dataset properties.

**Syntax:**
```bash
zfs get [-r] [-H] [-o field[,field]...] property[,property]... dataset
zfs set property=value dataset
```

**Examples:**
```bash
# Get single property
zfs get compression tank/data

# Get all properties
zfs get all tank/data

# Get multiple properties
zfs get compression,atime,recordsize tank/data

# Recursive get
zfs get -r compression tank

# Scripting mode
zfs get -H -o name,property,value compression tank/data

# Set property
zfs set compression=lz4 tank/data

# Set multiple properties
zfs set compression=lz4 tank/data
zfs set atime=off tank/data
zfs set recordsize=1M tank/data
```

**Common Properties:**

| Property | Values | Purpose |
|----------|--------|---------|
| `compression` | off, lz4, gzip, zstd | Enable compression |
| `atime` | on, off | Update access time |
| `recordsize` | 512-1M (power of 2) | Block size for files |
| `quota` | size or none | Maximum dataset size |
| `reservation` | size or none | Guaranteed space |
| `dedup` | on, off, verify | Deduplication (NOT recommended) |
| `sync` | standard, always, disabled | Synchronous writes |
| `mountpoint` | path or none | Mount point |
| `readonly` | on, off | Read-only mode |

### zfs snapshot

Create point-in-time snapshot.

**Syntax:**
```bash
zfs snapshot [-r] dataset@snapname
```

**Options:**
- `-r` - Recursive (snapshot children too)

**Examples:**
```bash
# Create snapshot
zfs snapshot tank/data@manual-2026-02-08

# Recursive snapshot
zfs snapshot -r tank@backup-2026-02-08

# List snapshots
zfs list -t snapshot tank/data

# Delete snapshot
zfs destroy tank/data@old-snapshot
```

**Notes:**
- Snapshots are read-only
- Space-efficient (copy-on-write)
- Can be cloned or rolled back

### zfs rollback

Revert dataset to snapshot state.

**Syntax:**
```bash
zfs rollback [-r] [-R] [-f] snapshot
```

**Options:**
- `-r` - Destroy later snapshots
- `-R` - Destroy later snapshots and clones
- `-f` - Force unmount if needed

**Examples:**
```bash
# Rollback to snapshot
zfs rollback tank/data@yesterday

# Rollback destroying later snapshots
zfs rollback -r tank/data@yesterday

# Force rollback
zfs rollback -f tank/data@yesterday
```

**WARNING:** Destructive! All changes after snapshot are lost.

### zfs clone

Create writable clone from snapshot.

**Syntax:**
```bash
zfs clone snapshot dataset
```

**Examples:**
```bash
# Clone snapshot
zfs clone tank/data@snapshot tank/data-copy

# Clone with properties
zfs clone -o mountpoint=/mnt/clone tank/data@snapshot tank/data-copy
```

**Notes:**
- Clone is writable (unlike snapshot)
- Shares blocks with origin (space-efficient)
- Can be promoted to become independent

### zfs send/receive

Send and receive snapshots (replication).

**Syntax:**
```bash
zfs send [-R] [-i snapshot | -I snapshot] snapshot > file
zfs receive [-F] [-u] [-d | -e] filesystem|snapshot < file
```

**Send Options:**
- `-R` - Replicate (include snapshots and properties)
- `-i snapshot` - Incremental from snapshot
- `-I snapshot` - Incremental-stream from snapshot
- `-t token` - Resume from token

**Receive Options:**
- `-F` - Force rollback if needed
- `-u` - Don't mount received filesystem
- `-d` - Discard pool name
- `-e` - Discard pool and parent names

**Examples:**
```bash
# Full send (initial replication)
zfs send tank/data@snapshot | ssh backup 'zfs receive backup/data'

# Incremental send
zfs send -i @prev @current tank/data | ssh backup 'zfs receive backup/data'

# Replicate with snapshots
zfs send -R tank/data@snapshot | ssh backup 'zfs receive -F backup/data'

# Resume interrupted send
TOKEN=$(ssh backup 'zfs get -H -o value receive_resume_token backup/data')
zfs send -t $TOKEN | ssh backup 'zfs receive backup/data'

# Save to file
zfs send tank/data@snapshot | gzip > /mnt/backup/data.zfs.gz
gunzip -c /mnt/backup/data.zfs.gz | zfs receive backup/data
```

### zfs allow

Delegate ZFS permissions to non-root users.

**Syntax:**
```bash
zfs allow [-r] user|group permission[,permission]... dataset
zfs unallow [-r] user|group [permission[,permission]...] dataset
```

**Common Permissions:**
- `create` - Create datasets
- `destroy` - Destroy datasets
- `mount` - Mount filesystems
- `snapshot` - Create snapshots
- `send` - Send snapshots
- `receive` - Receive snapshots
- `rollback` - Rollback to snapshot
- `clone` - Clone snapshots

**Examples:**
```bash
# Allow user to create/receive
zfs allow -u replication create,mount,receive backup/device1

# Allow group to snapshot
zfs allow -g backup snapshot tank/data

# View delegations
zfs allow backup/device1

# Remove delegation
zfs unallow -u replication backup/device1
```

### zfs bookmark

Create lightweight bookmarks for replication.

**Syntax:**
```bash
zfs bookmark snapshot bookmark
zfs destroy dataset#bookmark
```

**Examples:**
```bash
# Create bookmark
zfs bookmark tank/data@snapshot tank/data#bookmark

# Incremental send from bookmark
zfs send -i tank/data#bookmark tank/data@new | ssh backup 'zfs receive backup/data'

# List bookmarks
zfs list -t bookmark tank/data

# Destroy bookmark
zfs destroy tank/data#bookmark
```

**Notes:**
- Bookmarks preserve replication base without snapshot overhead
- Use for source systems with tight retention
- Cannot be rolled back (unlike snapshots)

---

## Sanoid Commands

### sanoid

Automated snapshot management with retention policies.

**Syntax:**
```bash
sanoid [options]
```

**Common Options:**
- `--take-snapshots` - Create snapshots based on config
- `--prune-snapshots` - Delete old snapshots based on retention
- `--monitor-snapshots` - Check snapshot health (for monitoring systems)
- `--verbose` - Verbose output
- `--debug` - Debug output
- `--configdir=path` - Config directory (default: /etc/sanoid)
- `--cron` - Suppress non-error output
- `--readonly` - Dry run (no changes)

**Examples:**
```bash
# Take snapshots
sudo sanoid --take-snapshots --verbose

# Prune old snapshots
sudo sanoid --prune-snapshots --verbose

# Both (typical cron usage)
sudo sanoid --cron

# Dry run
sudo sanoid --take-snapshots --prune-snapshots --readonly --verbose

# Monitor mode (nagios/icinga)
sudo sanoid --monitor-snapshots
```

### Configuration (/etc/sanoid/sanoid.conf)

**Format:**
```ini
[dataset/path]
    use_template = template_name
    recursive = yes|no
    process_children_only = yes|no

[template_name]
    frequently = count    # 15-minute snapshots
    hourly = count
    daily = count
    weekly = count
    monthly = count
    yearly = count
    autosnap = yes|no     # Create snapshots automatically
    autoprune = yes|no    # Prune snapshots automatically
```

**Example:**
```ini
[tank/important]
    use_template = production
    recursive = yes

[template_production]
    hourly = 24
    daily = 30
    weekly = 12
    monthly = 36
    yearly = 0
    autosnap = yes
    autoprune = yes
```

---

## Syncoid Commands

### syncoid

ZFS replication tool (wrapper around zfs send/receive).

**Syntax:**
```bash
syncoid [options] source_dataset target_dataset
```

**Common Options:**
- `--recursive` - Replicate all child datasets
- `--no-sync-snap` - Don't create sync snapshot (use existing)
- `--identifier=name` - Identifier for sync snapshots
- `--compress=type` - Compression for network transfer (none, gzip, lz4, zstd-fast)
- `--no-privilege-elevation` - Don't use sudo on remote
- `--sshport=port` - SSH port (default: 22)
- `--force-delete` - Delete conflicting snapshots
- `--debug` - Debug output
- `--dumpsnaps` - List snapshots and exit
- `--no-resume` - Don't use resume tokens

**Examples:**
```bash
# Basic replication
syncoid tank/data backup/data

# Recursive replication
syncoid --recursive tank backup

# Remote replication (pull)
syncoid --recursive user@remote:tank backup/remote-tank

# Remote replication (push)
syncoid --recursive tank user@remote:backup/tank

# With compression
syncoid --recursive --compress=zstd-fast user@remote:tank backup/tank

# Non-root replication
syncoid --recursive --no-privilege-elevation user@remote:tank backup/tank

# With identifier (multi-source)
syncoid --recursive --identifier=device1 user@device1:tank backup/device1

# Force delete conflicting snapshots
syncoid --recursive --force-delete user@remote:tank backup/tank
```

**Notes:**
- Automatically handles incremental sends
- Supports resume tokens for interrupted transfers
- Creates sync snapshots (syncoid_*) for consistency
- Requires SSH for remote replication

---

## Performance Tuning

### Recordsize Optimization

| Workload | Recordsize | Rationale |
|----------|-----------|-----------|
| Databases (PostgreSQL, MySQL) | 8K | Matches database block size |
| Virtual machines (qcow2, vmdk) | 16K | Matches VM filesystem blocks |
| General files | 128K | Default, balanced |
| Media (video, photos) | 1M | Large sequential I/O |
| Small files (<128K) | 128K | Default handles well |

**Set before writing data:**
```bash
zfs set recordsize=8K tank/databases
zfs set recordsize=1M tank/media
```

### Compression Comparison

| Algorithm | Ratio | CPU | Use Case |
|-----------|-------|-----|----------|
| `lz4` | 1.5-2.0x | ~0% | **Always use** (default) |
| `gzip` (1-9) | 2-3x | 10-30% | High compression, low performance |
| `zstd` | 2-3x | 5-15% | Better than gzip, slower than lz4 |
| `zstd-fast` | 1.3-1.7x | 1-3% | Faster than lz4, less compression |

**Recommendation:**
```bash
# Always enable LZ4 (0% overhead, often improves performance)
zfs set compression=lz4 tank/data
```

### ARC (Adaptive Replacement Cache)

**Limit ARC size (if needed):**
```bash
# /etc/modprobe.d/zfs.conf
options zfs zfs_arc_max=17179869184  # 16GB in bytes

# Apply
sudo update-initramfs -u
sudo reboot
```

**Check ARC stats:**
```bash
arc_summary
```

**Recommended ARC size:**
- Desktop: 25-50% of RAM
- Server: 50-75% of RAM (if no other services)

---

## Common Patterns

### Health Check Script

```bash
#!/bin/bash
zpool list -H -o name | while read pool; do
    status=$(zpool list -H -o health "$pool")
    cap=$(zpool list -H -o cap "$pool" | tr -d '%')

    if [[ "$status" != "ONLINE" ]]; then
        echo "CRITICAL: Pool $pool is $status"
    elif [[ "$cap" -ge 80 ]]; then
        echo "WARNING: Pool $pool is ${cap}% full"
    else
        echo "OK: Pool $pool is healthy (${cap}%)"
    fi
done
```

### Automated Snapshots (Cron)

```cron
# /etc/cron.d/sanoid
# Take snapshots and prune hourly
0 * * * * root /usr/sbin/sanoid --cron
```

### Automated Replication (Cron)

```cron
# /etc/cron.d/syncoid
# Replicate every 4 hours with stagger
0 */4 * * * root /usr/sbin/syncoid --recursive --compress=zstd-fast user@device1:tank /backup/device1
15 */4 * * * root /usr/sbin/syncoid --recursive --compress=zstd-fast user@device2:tank /backup/device2
```

### Monthly Scrub (Cron)

```cron
# First Sunday of month at 2 AM
0 2 * * 0 root [ $(date +\%d) -le 7 ] && /usr/sbin/zpool scrub tank
```

---

## References

- [OpenZFS Documentation](https://openzfs.github.io/openzfs-docs/)
- [Sanoid/Syncoid GitHub](https://github.com/jimsalterjrs/sanoid)
- [Oracle ZFS Administration Guide](https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/manage-zfs/)
- [FreeBSD ZFS Handbook](https://docs.freebsd.org/en/books/handbook/zfs/)
