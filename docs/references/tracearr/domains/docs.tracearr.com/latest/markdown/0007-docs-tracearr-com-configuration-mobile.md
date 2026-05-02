Mobile App - Pairing, Notifications & Settings | Tracearr Docs[Skip to Content](#nextra-skip-nav)
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
[Configuration](/configuration)Mobile App
Copy page
# Mobile App
The Tracearr mobile app lets you monitor your media servers on the go. Available for iOS and Android.
## Enabling Mobile Access[](#enabling-mobile-access)
Before you can pair devices, you need to enable mobile access on your Tracearr server.
### Open Settings[](#open-settings)
Go to **Settings** → **Mobile** in your Tracearr dashboard.
### Enable Mobile Access[](#enable-mobile-access)
Click **Enable Mobile Access**. This activates the pairing system and allows devices to connect.
### Set External URL (if needed)[](#set-external-url-if-needed)
If you’re accessing Tracearr through a reverse proxy or remotely, go to **Settings** → **External URL** and set your public URL (e.g., `https://tracearr.yourdomain.com`). The mobile app uses this URL to connect.
Without an external URL configured, the QR code will contain your local network address, which won’t work when you’re away from home.
## Pairing a Device[](#pairing-a-device)
You can pair up to 5 devices per Tracearr instance.
### QR Code (Recommended)[](#qr-code-recommended)
### Generate a Pairing Code[](#generate-a-pairing-code)
In **Settings** → **Mobile**, click **Add Device**. A QR code appears with a countdown timer.
### Open the Tracearr App[](#open-the-tracearr-app)
Launch the Tracearr app on your phone. On first launch, you’ll see the pairing screen automatically.
### Scan the QR Code[](#scan-the-qr-code)
Point your camera at the QR code. The app will automatically detect and pair with your server.
### Done[](#done)
Once paired, you’ll be taken to the dashboard. Your device now appears in the “Connected Devices” list on the web.
The pairing token expires after **5 minutes** and can only be used **once**. If it expires, click “Add Device” again to generate a new code.
### Manual Entry[](#manual-entry)
If you can’t scan the QR code:
1. In the mobile app, tap **Enter URL and Token Manually**
2. Enter your **Server URL** — e.g., `https://tracearr.yourdomain.com`
3. Enter the **Access Token** — shown below the QR code, starts with `trr\_mob\_...`
4. Tap **Connect**
## Push Notifications[](#push-notifications)
The mobile app supports push notifications for real-time alerts.
### Enabling Notifications[](#enabling-notifications)
1. In the app, go to **Settings** → **Notifications**
2. Toggle **Enable Push Notifications**
3. Grant notification permissions when prompted by your device
### Notification Events[](#notification-events)
You can enable or disable notifications for each event type:
|Event|Description|
|**Violation Detected**|A sharing rule was triggered|
|**Stream Started**|Someone started watching|
|**Stream Stopped**|Playback ended|
|**Concurrent Streams**|User exceeded stream limit|
|**New Device**|New device detected for a user|
|**Trust Score Changed**|User’s trust score degraded|
|**Server Down**|Media server became unreachable|
|**Server Up**|Media server is back online|
### Violation Filters[](#violation-filters)
When violation notifications are enabled, you can filter by:
* **Rule Type** — Impossible Travel, Simultaneous Locations, Device Velocity, Concurrent Streams, Geo Restriction
* **Minimum Severity** — All, Warning & High only, or High only
### Quiet Hours[](#quiet-hours)
Pause non-critical notifications during sleeping hours:
1. Enable **Quiet Hours**
2. Set your start and end times (e.g., 11 PM to 8 AM)
3. Optionally enable **Override for Critical** to still receive high-severity violation alerts
### Rate Limiting[](#rate-limiting)
To prevent notification spam, the app enforces rate limits:
* Maximum notifications per minute
* Maximum notifications per hour
You can see your current rate limit status in the notification settings.
## Managing Connected Devices[](#managing-connected-devices)
In **Settings** → **Mobile** on the web dashboard:
### View Connected Devices[](#view-connected-devices)
Each device shows:
* **Device Name** — e.g., “John’s iPhone”
* **Platform** — iOS or Android
* **Last Seen** — When the device last connected
* **Connected Date** — When it was paired
### Revoke a Device[](#revoke-a-device)
Click the trash icon next to a device to disconnect it. The device will need to pair again with a new token.
### Revoke All Sessions[](#revoke-all-sessions)
Click **Revoke All** to disconnect every device at once. Useful if you suspect unauthorized access.
### Disable Mobile Access[](#disable-mobile-access)
Click **Disable Mobile Access** to turn off the feature entirely. All devices will be disconnected and the pairing system will be disabled.
## Troubleshooting[](#troubleshooting)
### ”Invalid QR code” or “Pairing Failed”[](#invalid-qr-code-or-pairing-failed)
* The token may have expired (5-minute limit) — generate a new one
* Ensure your phone has a clear view of the QR code
* Try manual entry instead
### App Can’t Connect to Server[](#app-cant-connect-to-server)
* Verify your **External URL** is set correctly in Settings
* Check that your server is accessible from outside your network
* Ensure HTTPS is working if you’re using it
* Check your firewall allows incoming connections
### Not Receiving Push Notifications[](#not-receiving-push-notifications)
1. Check that notifications are enabled in the app settings
2. Verify your device’s notification permissions for Tracearr
3. Use **Send Test Notification** to verify the connection
4. Check that you haven’t hit rate limits
### Device Shows “Last seen” a Long Time Ago[](#device-shows-last-seen-a-long-time-ago)
The app updates its “last seen” timestamp when it connects to fetch data. If the app hasn’t been opened recently, this is normal.
### Can’t Add More Devices[](#cant-add-more-devices)
The default limit is 5 devices. You’ll need to remove an existing device before adding a new one.
Last updated on March 15, 2026
[Backup & Restore](/configuration/backup)[Debug Page](/configuration/debug)