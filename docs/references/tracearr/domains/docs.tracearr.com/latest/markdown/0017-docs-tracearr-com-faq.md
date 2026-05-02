FAQ - Troubleshooting & Common Questions | Tracearr Docs[Skip to Content](#nextra-skip-nav)
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
FAQ
Copy page
# Frequently Asked Questions
**General**
* [What media servers does Tracearr support?](#what-media-servers-does-tracearr-support)
* [Is Tracearr free?](#is-tracearr-free)
* [Can I import data from Tautulli or Jellystat?](#can-i-import-data-from-tautulli-or-jellystat)
**Installation**
* [What are the system requirements?](#what-are-the-system-requirements)
* [Can I run Tracearr without Docker?](#can-i-run-tracearr-without-docker)
**Troubleshooting**
* [Tracearr can’t connect to my media server](#tracearr-cant-connect-to-my-media-server)
* [Disabling IPv6 in Docker](#disabling-ipv6-in-docker)
* [Sessions aren’t being tracked](#sessions-arent-being-tracked)
* [I don’t see any location data / Everything shows as local](#i-dont-see-any-location-data--everything-shows-as-local)
* [The location data is wrong / IP geolocation is inaccurate](#the-location-data-is-wrong--ip-geolocation-is-inaccurate)
* [How do I reset my Tracearr password?](#how-do-i-reset-my-tracearr-password)
* [Server Resources is empty](#server-resources-is-empty)
* [Pages are slow to load on Unraid](#pages-are-slow-to-load-on-unraid)
**Data & Maintenance Jobs**
* [I see inconsistent device names](#i-see-inconsistent-device-names-like-androidtv-android-tv-and-nvidia-shield)
* [I see both “US” and “United States” in my country data](#i-see-both-us-and-united-states-in-my-country-data)
* [My imported Tautulli sessions show 0% progress](#my-imported-tautulli-sessions-show-0-progress)
* [Users show “Never” for last activity](#users-show-never-for-last-activity-even-though-they-have-watch-history)
* [My Library Growth charts are empty](#my-library-growth-charts-are-empty-or-missing-historical-data)
* [My analytics numbers look wrong or charts show gaps](#my-analytics-numbers-look-wrong-or-charts-show-gaps)
* [A job says “already running” but I don’t see any progress](#a-job-says-already-running-but-i-dont-see-any-progress)
## General[](#general)
### What media servers does Tracearr support?[](#what-media-servers-does-tracearr-support)
Tracearr supports **Plex**, **Jellyfin**, and **Emby**. You can monitor multiple servers of different types from a single Tracearr instance.
### Is Tracearr free?[](#is-tracearr-free)
Yes, Tracearr is free and open source under the AGPL-3.0 license.
### Can I import data from Tautulli or Jellystat?[](#can-i-import-data-from-tautulli-or-jellystat)
Yes, Tracearr supports importing historical data from both Tautulli and Jellystat.
## Installation[](#installation)
### What are the system requirements?[](#what-are-the-system-requirements)
* Docker and Docker Compose (recommended)
* 1GB RAM minimum (2GB recommended)
* PostgreSQL/TimescaleDB for the database
* Redis for caching
### Can I run Tracearr without Docker?[](#can-i-run-tracearr-without-docker)
While Docker is recommended, you can run Tracearr directly with Node.js 20+. See the GitHub repository for manual installation instructions.
## Troubleshooting[](#troubleshooting)
### Tracearr can’t connect to my media server[](#tracearr-cant-connect-to-my-media-server)
1. Verify your server URL is correct and accessible from Tracearr
2. Check that your API key/token is valid
3. Ensure there are no firewall rules blocking the connection
4. Check the Tracearr logs for specific error messages
5. Try [Disabling IPv6 in Docker](#disabling-ipv6-in-docker)
### Disabling IPv6 in Docker[](#disabling-ipv6-in-docker)
If you get “cannot reach [Plex/Emby/Jellyfin] server … fetch failed” when adding your media server
This is commonly caused by IPv6 resolution issues inside the Docker container. If your media server’s hostname resolves to an IPv6 address but the network path doesn’t fully support IPv6, the connection will fail.
To fix this, disable IPv6 inside the Tracearr container by adding `sysctls` to your Docker Compose file:
```
`services:
tracearr:
image: ghcr.io/connorgallopo/tracearr:latest
# ... your existing config ...
sysctls:
- net.ipv6.conf.all.disable\_ipv6=1`
```
After adding this, recreate the compose stack:
```
`docker compose -f your-compose-file.yml down
docker compose -f your-compose-file.yml up -d`
```
This forces the container to use IPv4 only, which resolves the issue in most cases.
### Sessions aren’t being tracked[](#sessions-arent-being-tracked)
1. Verify the server connection is active in Settings → Servers
2. Check that polling is enabled for the server
3. Start a playback session and wait for the next poll interval
### I don’t see any location data / Everything shows as local[](#i-dont-see-any-location-data--everything-shows-as-local)
>
**> Note:
**> Local streams (those originating from your home network) will never show location data — this is expected behavior. Geolocation only applies to remote streams from outside your network. If your
*> remote
*> streams are showing as “local” or missing location data, continue reading.
>
Tracearr uses client IP addresses reported by your media server to determine geolocation. If remote sessions show as “local” or have no location data, your media server isn’t seeing the real client IPs — usually because a reverse proxy is in front of it.
**Two things need to be configured:**
1. **Your reverse proxy** must forward the real client IP via headers (`X-Forwarded-For`, `X-Forwarded-Proto`, `X-Forwarded-Host`)
2. **Your media server** must be configured to trust those headers:
* **Jellyfin**: Add your reverse proxy’s IP to **Settings → Networking → Known Proxies**
* **Emby**: Add your reverse proxy’s IP to **Settings → Networking → Known Proxies**
* **Plex**: Generally handles this automatically, but check **Settings → Network → List of IP addresses and networks that are allowed without auth**
See the [Jellyfin reverse proxy documentation ](https://jellyfin.org/docs/general/post-install/networking/reverse-proxy/) for detailed configuration examples for Nginx, Caddy, Apache, Traefik, and more. The reverse proxy concepts apply to all media server types.
**Quick checklist:**
* Reverse proxy sets `X-Forwarded-For` to the client’s real IP
* Media server’s “Known Proxies” includes your reverse proxy’s IP address
* For Docker setups, ensure the proxy sees real client IPs (not Docker network IPs)
### The location data is wrong / IP geolocation is inaccurate[](#the-location-data-is-wrong--ip-geolocation-is-inaccurate)
IP-based geolocation is inherently imprecise. Here’s why:
* **ISPs assign IPs regionally**, not by exact address — your IP might be registered to a city 50+ miles away
* **Mobile carriers and VPNs** often show locations far from the actual user
* **IP databases are updated periodically**, so recently reassigned IPs may show old locations
* **Some ISPs route traffic through central hubs**, making all users appear in one location
* **CGNAT (Carrier-Grade NAT)** — Many ISPs, especially mobile carriers, use CGNAT where thousands of customers share the same public IP address. This means the IP geolocates to the carrier’s infrastructure (often a data center), not the user’s actual location. CGNAT is increasingly common as IPv4 addresses become scarce.
**How Tracearr handles geolocation:**
By default, Tracearr uses the [MaxMind GeoLite2 ](https://www.maxmind.com/en/geoip2-databases) database **locally** — all IP lookups happen on your server and no data is sent externally. This keeps your users’ IP addresses private.
**Enhanced GeoIP option:**
In **Settings → General**, you can enable **“Enhanced GeoIP Lookup”**. When enabled, Tracearr sends IP addresses to Plex’s GeoIP service (`plex.tv/api/v2/geoip`) which may return more accurate results. This works for all media servers, not just Plex. The local MaxMind database is used as a fallback.
|Option|Privacy|Accuracy|
|Default (MaxMind)|All data stays local|Good for most cases|
|Enhanced|IPs sent to plex.tv|Potentially more accurate|
**Bottom line:** IP geolocation will never be as accurate as GPS. It’s best used for detecting general regions and impossible travel scenarios, not pinpointing exact addresses.
### How do I reset my Tracearr password?[](#how-do-i-reset-my-tracearr-password)
You can reset your password using the built-in CLI script. No access to the web UI is required.
This resets the password for your Tracearr user account, not your media server accounts.
It will not work if you are using external authentication (e.g., Plex Sign-In) since those users don’t have local passwords.
DockerProxmox LXC
### Docker
```
`# Interactive mode (you will be prompted to enter a new password)
docker exec -it tracearr node apps/server/scripts/reset-password.ts
# Non-interactive mode (sets password to "newpassword123")
docker exec -it tracearr node apps/server/scripts/reset-password.ts newpassword123`
```
### Server Resources is empty[](#server-resources-is-empty)
The Server Resources panel (CPU, memory, and transcoder metrics) is only available for **Plex** and requires **Plex Pass**. Plex’s resource monitoring API is a Plex Pass feature, and Tracearr currently does not detect whether your account has Plex Pass.
If you’re using Jellyfin or Emby, this section will not be displayed as these servers do not expose resource metrics through their APIs.
### Pages are slow to load on Unraid[](#pages-are-slow-to-load-on-unraid)
If Tracearr feels sluggish — especially pages with lots of history — the most likely cause is where your database is stored.
Paths under `/mnt/user` go through Unraid’s FUSE filesystem layer (shfs), which adds significant overhead to every database read and write. This affects all applications that use a database, not just Tracearr. On a typical Unraid setup, database operations through `/mnt/user` can be **50–100x slower** than direct disk access, even on NVMe drives.
**Fix:** Move your PostgreSQL data to a path that bypasses the array:
* `/mnt/cache/appdata/tracearr/postgres` — if you have a cache pool (most common)
* `/mnt/appdata/tracearr/postgres` — if you’ve set up a dedicated appdata share on cache
If you’re using the **supervised image** from Community Apps, edit the container and change the **PostgreSQL Data** path. If you’re using **Docker Compose** with named volumes, this doesn’t apply — Docker manages the volume storage directly.
## Data & Maintenance Jobs[](#data--maintenance-jobs)
Tracearr includes maintenance jobs in **Settings → Jobs** to fix common data issues.
### I see inconsistent device names like “AndroidTV”, “Android TV”, and “NVIDIA Shield”[](#i-see-inconsistent-device-names-like-androidtv-android-tv-and-nvidia-shield)
Run **Normalize Players** in Settings → Jobs. This standardizes device and platform names so they group correctly in charts and filters.
### I see both “US” and “United States” in my country data[](#i-see-both-us-and-united-states-in-my-country-data)
Run **Normalize Countries** in Settings → Jobs. This converts full country names to standard codes so your world map and country filters work properly.
### My imported Tautulli sessions show 0% progress[](#my-imported-tautulli-sessions-show-0-progress)
Run **Fix Imported Progress** in Settings → Jobs. This recalculates progress values for imported sessions that have duration but missing progress data.
### Users show “Never” for last activity even though they have watch history[](#users-show-never-for-last-activity-even-though-they-have-watch-history)
Run **Backfill User Dates** in Settings → Jobs. This scans session history to populate the first seen and last activity timestamps.
### My Library Growth charts are empty or missing historical data[](#my-library-growth-charts-are-empty-or-missing-historical-data)
Run **Backfill Library Snapshots** in Settings → Jobs. This generates historical data points from your library items.
### My analytics numbers look wrong or charts show gaps[](#my-analytics-numbers-look-wrong-or-charts-show-gaps)
Run **Full Aggregate Rebuild** in Settings → Jobs. This recalculates all statistics from scratch.
### A job says “already running” but I don’t see any progress[](#a-job-says-already-running-but-i-dont-see-any-progress)
Go to `/debug` (e.g., `http://your-tracearr:3000/debug`) and click **Clear Stuck Jobs**. A previous job crashed and left stale state.
Last updated on March 15, 2026
[Upgrading](/upgrading)