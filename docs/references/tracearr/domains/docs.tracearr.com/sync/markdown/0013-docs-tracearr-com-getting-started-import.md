Import Watch History - Tautulli & Jellystat | Tracearr Docs[Skip to Content](#nextra-skip-nav)
CTRL K
* [Introduction](/)
* Getting Started
* [Overview](/getting-started)
* Installation
* [Docker Compose](/getting-started/installation)
* [Docker UI](/getting-started/installation/docker-ui)
* [Supervised](/getting-started/installation/supervised)
* [Kubernetes (Helm)](/getting-started/installation/kubernetes)
* [Railway (Cloud)](/getting-started/installation/railway)
* [Connect a Server](/getting-started/first-server)
* [Import Data](/getting-started/import)
* Configuration
* [Overview](/configuration)
* [Environment Variables](/configuration/environment)
* [Rules](/configuration/rules)
* [Tailscale VPN](/configuration/tailscale)
* [Backup & Restore](/configuration/backup)
* [Mobile App](/configuration/mobile)
* [Debug Page](/configuration/debug)
* [Upgrading](/upgrading)
* [FAQ](/faq)
Light
* [Introduction](/)
* Getting Started
* [Overview](/getting-started)
* Installation
* [Docker Compose](/getting-started/installation)
* [Docker UI](/getting-started/installation/docker-ui)
* [Supervised](/getting-started/installation/supervised)
* [Kubernetes (Helm)](/getting-started/installation/kubernetes)
* [Railway (Cloud)](/getting-started/installation/railway)
* [Connect a Server](/getting-started/first-server)
* [Import Data](/getting-started/import)
* Configuration
* [Overview](/configuration)
* [Environment Variables](/configuration/environment)
* [Rules](/configuration/rules)
* [Tailscale VPN](/configuration/tailscale)
* [Backup & Restore](/configuration/backup)
* [Mobile App](/configuration/mobile)
* [Debug Page](/configuration/debug)
* [Upgrading](/upgrading)
* [FAQ](/faq)
Light
[Getting Started](/getting-started)Import Data
Copy page
# Import Watch History
Tracearr can import your existing watch history from **Tautulli** (for Plex) and **Jellystat** (for Jellyfin/Emby). This lets you keep your historical data when migrating to Tracearr.
Access the import feature at **Settings** → **Import**.
Before importing, make sure you’ve synced your media server in **Settings → Servers**. Tracearr matches imported sessions to existing users by their media server user ID. Sessions for users that don’t exist in Tracearr will be skipped.
## Import from Tautulli[](#import-from-tautulli)
Tautulli import connects directly to your Tautulli instance via API — no file export needed.
### Step 1: Connect to Tautulli[](#step-1-connect-to-tautulli)
1. Enter your **Tautulli URL** (e.g., `http://localhost:8181`)
2. Enter your **API Key**
* Find this in Tautulli: **Settings** → **Web Interface** → **API Key**
* Click **Test Connection** to verify
### Step 2: Configure Import[](#step-2-configure-import)
Once connected, you’ll see import options:
|Option|Description|
|**Target Server**|Select which Plex server to import sessions to|
|**Overwrite friendly names**|Replace existing user nicknames with names from Tautulli|
|**Include detailed stream data**|Fetch codec, bitrate, and resolution data for each session. Enables bandwidth/quality stats but significantly increases import time. *(Beta)*|
### Step 3: Start Import[](#step-3-start-import)
Click **Start Import** to begin. You’ll see real-time progress showing:
* **Processed** — Total records checked
* **Page** — Current page of results being fetched
* **Imported** — Successfully imported sessions
* **Skipped** — Records that weren’t imported
* **Errors** — Records that failed to import
Tautulli import fetches data in pages via the API. Large libraries may take several minutes depending on your history size and network speed.
### Why Records Are Skipped[](#why-records-are-skipped)
Records may be skipped for these reasons:
* **User not found** — The Plex user doesn’t exist in Tracearr. Sync your server first.
* **Duplicate session** — The session was already imported in a previous run.
* **In-progress session** — Active or incomplete sessions without a reference ID are skipped.
## Import from Jellystat[](#import-from-jellystat)
Jellystat import uses a JSON backup file that you export from Jellystat.
### Step 1: Export from Jellystat[](#step-1-export-from-jellystat)
1. In Jellystat, go to **Settings** → **Backup**
2. Under **Options**, **deselect everything except “Activity”** — selected options appear in purple, deselected options appear in red
1. Go back to **Settings** → **Settings** and scroll down to the **Tasks** section
2. Find **“Backup Jellystat”** and click the **Start** button on the far right
3. Return to **Settings** → **Backup** — you should see a new backup with the current timestamp in the file name
The **Date** column in Jellystat’s backup list is a known bug and always shows an incorrect date. Use the **File Name** timestamp to identify your backup.
1. On the far right of your new backup, click **Actions** → **Download** to save the JSON file
You must export an **Activity** backup specifically. Full backups are not supported — only the Activity backup contains the playback history needed for import.
### Step 2: Upload and Configure[](#step-2-upload-and-configure)
1. In Tracearr, go to **Settings** → **Import**
2. Select your **Target Server** (Jellyfin or Emby)
3. Drag and drop your downloaded JSON file, or click to select it
4. Configure import options:
For large backup files, it’s recommended to access Tracearr directly via local IP or through a WireGuard/Tailscale connection. Reverse proxies may impose upload size limits that cause the import to fail.
|Option|Description|
|**Enrich with media metadata**|Fetches season/episode numbers and artwork from your server. Slower but provides better data quality. *(Recommended)*|
|**Update existing records**|Updates previously imported sessions with codec, bitrate, and transcode data from the backup. Useful when re-importing to backfill new fields.|
### Step 3: Start Import[](#step-3-start-import-1)
Click **Start Import** to begin. Progress shows:
* **Processed** — Records parsed from the backup
* **Imported** — Successfully imported sessions
* **Skipped** — Records that weren’t imported
* **Enriched** — Records enhanced with additional metadata (if enabled)
* **Errors** — Records that failed
### Why Records Are Skipped[](#why-records-are-skipped-1)
Records may be skipped for these reasons:
* **User not found** — The Jellyfin/Emby user doesn’t exist in Tracearr. Sync your server first.
* **Duplicate session** — The session was already imported in a previous run.
If many records are skipped due to “user not found”, ensure you’ve synced your server recently in **Settings → Servers**.
## Migrating from Playback Reporting Plugin[](#migrating-from-playback-reporting-plugin)
If you’re using the [Jellyfin Playback Reporting plugin ](https://github.com/jellyfin/jellyfin-plugin-playbackreporting) to track watch history, you can migrate that data to Tracearr through Jellystat.
Direct import from the Playback Reporting plugin is planned for a future Tracearr release. For now, use Jellystat as an intermediary.
### Migration Path[](#migration-path)
1. **Install Jellystat** temporarily alongside your Jellyfin server
2. **Import your Playback Reporting data into Jellystat:**
* In Jellystat, go to **Settings**
* Click **Task** → **Complete Sync with Jellyfin**
* Click **Task** → **Import Playback Reporting Plugin Data**
* **Export from Jellystat** — Follow the [export steps above](#step-1-export-from-jellystat) to create and download an Activity backup
* **Import into Tracearr** — Follow the [Jellystat import steps](#import-from-jellystat) above
This is a one-time migration. Once your data is in Tracearr, you can uninstall both the Playback Reporting plugin and Jellystat if desired.
Some users have reported issues with TV show metadata when importing from the Playback Reporting plugin to Jellystat. Movies typically import cleanly, but TV episodes may show incomplete data. This is a limitation of the plugin’s data format, not Tracearr.
## After Importing[](#after-importing)
After import completes, you may want to run some maintenance jobs in **Settings → Jobs**:
|Job|When to Run|
|**Normalize Players**|If device names appear inconsistent (e.g., “AndroidTV” vs “Android TV”)|
|**Fix Imported Progress**|If imported sessions show 0% progress|
|**Backfill User Dates**|If users show “Never” for last activity despite having history|
|**Full Aggregate Rebuild**|If charts or statistics look incorrect|
See the [FAQ](/faq) for more details on these jobs.
## Re-importing Data[](#re-importing-data)
You can run imports multiple times safely:
* **Duplicate detection** — Sessions already in Tracearr are automatically skipped
* **Incremental updates** — Only new sessions since the last import are added
* **Stream details update** — Use the “Update existing records” option (Jellystat) to backfill codec/bitrate data on previously imported sessions
Last updated on March 15, 2026
[Connect a Server](/getting-started/first-server)[Overview](/configuration)