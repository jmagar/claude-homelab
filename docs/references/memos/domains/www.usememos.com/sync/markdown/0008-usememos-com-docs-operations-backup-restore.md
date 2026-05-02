Backup & Restore - Memos
[Memos](/)
Search
⌘K
Documentation
[Documentation](/docs)
Getting Started
Deploy
Configuration
Usage
Operations
[Operations](/docs/operations)[Architecture](/docs/operations/architecture)[Backup & Restore](/docs/operations/backup-restore)[Performance Tuning](/docs/operations/performance-tuning)
Development
Integrations
Admin
Troubleshooting
[FAQ](/docs/faq)
[](https://github.com/usememos/memos)
Operations
# Backup & Restore
Plan recoverable backups for the database and any external attachment storage.
Your backup plan depends on both the database backend and the attachment storage backend.
## [Default data directory layout](#default-data-directory-layout)
```
`\~/.memos/
├── memos\_prod.db # SQLite database (default)
└── assets/ # Uploaded files and attachments`
```
The location is controlled by `MEMOS\_DATA`. Override it at runtime or use the default.
## [What to back up](#what-to-back-up)
* the database itself
* local attachment storage when attachments are not stored in the database
* deployment configuration such as environment variables, compose files, and proxy config
## [SQLite backup](#sqlite-backup)
The safest offline approach is to stop Memos and copy the database file:
```
`sudo systemctl stop memos
tar -czf memos-backup-$(date +%Y%m%d).tar.gz -C \~/.memos .
sudo systemctl start memos`
```
For online backups while Memos is running, use SQLite's built-in `.backup` command which handles WAL mode correctly:
```
`sqlite3 \~/.memos/memos\_prod.db ".backup \~/.memos/memos\_backup.db"`
```
Automated daily backup with 7-day retention:
```
`#!/bin/bash
BACKUP\_DIR="/var/backups/memos"
DATE=$(date +%Y%m%d-%H%M%S)
MEMOS\_DATA="${MEMOS\_DATA:-$HOME/.memos}"
mkdir -p "$BACKUP\_DIR"
sqlite3 "$MEMOS\_DATA/memos\_prod.db" ".backup $BACKUP\_DIR/memos-$DATE.db"
tar -czf "$BACKUP\_DIR/assets-$DATE.tar.gz" -C "$MEMOS\_DATA" assets
find "$BACKUP\_DIR" -name "memos-\*.db" -mtime +7 -delete
find "$BACKUP\_DIR" -name "assets-\*.tar.gz" -mtime +7 -delete`
```
Add to cron: `0 2 \* \* \* /usr/local/bin/backup-memos.sh`
## [MySQL backup](#mysql-backup)
```
`# Backup
mysqldump -u memos\_user -p memos\_db | gzip \> memos-backup-$(date +%Y%m%d).sql.gz
tar -czf assets-backup-$(date +%Y%m%d).tar.gz -C \~/.memos assets
# Restore
gunzip \< memos-backup.sql.gz | mysql -u memos\_user -p memos\_db
tar -xzf assets-backup.tar.gz -C \~/.memos`
```
## [PostgreSQL backup](#postgresql-backup)
```
`# Backup
pg\_dump -U memos\_user -d memos\_db -F c -f memos-backup-$(date +%Y%m%d).dump
tar -czf assets-backup-$(date +%Y%m%d).tar.gz -C \~/.memos assets
# Restore
pg\_restore -U memos\_user -d memos\_db memos-backup.dump
tar -xzf assets-backup.tar.gz -C \~/.memos`
```
## [Recovery mindset](#recovery-mindset)
Backups only matter if restore is realistic. Keep enough information to answer:
* where the data lived
* which database driver was in use
* whether attachments were in the database, on disk, or in object storage
* how the instance URL and proxy were configured
## [Operational advice](#operational-advice)
* test restore at least once before you depend on the backup plan
* record the storage backend alongside the backup process
* treat attachment recovery as a first-class part of restore, not an afterthought
[
Architecture
High-level system structure and the main moving parts in a Memos deployment.
](/docs/operations/architecture)[
Performance Tuning
Focus on the parts of a Memos deployment that most affect real-world performance.
](/docs/operations/performance-tuning)
### On this page
[Default data directory layout](#default-data-directory-layout)[What to back up](#what-to-back-up)[SQLite backup](#sqlite-backup)[MySQL backup](#mysql-backup)[PostgreSQL backup](#postgresql-backup)[Recovery mindset](#recovery-mindset)[Operational advice](#operational-advice)