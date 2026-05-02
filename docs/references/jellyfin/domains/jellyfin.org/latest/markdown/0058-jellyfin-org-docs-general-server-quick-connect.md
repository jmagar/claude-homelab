Quick Connect | Jellyfin
[Skip to main content](#__docusaurus_skipToContent_fallback)
On this page
**Quick Connect** is a feature that allows users to sign in to clients **without entering a username or password**. Instead, a temporary **Quick Connect code** is generated and used to authorize login from an already authenticated client.
This feature streamlines the sign-in process, especially on devices with limited input options (like TVs or set-top boxes).
## Disabling Quick Connect (Server)[​](#disabling-quick-connect-server)
By default, Quick Connect is enabled.
To disable it, follow these steps:
1. Go to the **Admin Dashboard** on your Jellyfin server.
`Settings` \> `Dashboard`
2. Navigate to the **General** Tab
3. Uncheck the box:
✅ **Enable Quick Connect on this server**
## Supported Clients[​](#supported-clients)
Quick Connect functionality is supported in two contexts:
|Client|Log In|Authorize Others|
|JellyCon|✅|❌|
|Jellyfin Android|✅|✅|
|Jellyfin Android TV|✅|❌|
|Jellyfin Kodi|❌|❌|
|Jellyfin Media Player|✅|✅|
|Jellyfin Mobile (iOS)|✅|✅|
|Jellyfin MPV Shim|❌|❌|
|Jellyfin Roku|✅|❌|
|Jellyfin Vue|❌|❌|
|Jellyfin Web|✅|✅|
|Jellyfin WebOS|✅|✅|
|Jellyfin Xbox|✅|✅|
|Swiftfin (iOS)|✅|✅|
|Swiftfin (tvOS)|✅|❌|
## Using Quick Connect[​](#using-quick-connect)
The Quick Connect process involves two devices:
* **Device A**: A new client where you want to log in.
* **Device B**: An already authenticated client (such as your browser, phone, etc.).
### On Device A (New Device - the one you want to log into)[​](#on-device-a-new-device---the-one-you-want-to-log-into)
1. Open the Jellyfin client and choose **Quick Connect** (usually found on the login screen).
On some clients, you will first need to press **Manual Login**; others may display the quick-connect code directly.
2. A **6-character code** will be displayed. Keep this screen open.
### On Device B (Already Logged-In Device)[​](#on-device-b-already-logged-in-device)
1. Open Jellyfin and go to:
`Settings` \> `Quick Connect`
2. Enter the 6-character code from Device A and confirm.
3. If successful, Device A will be logged in automatically—no need to enter a username or password.
>
> If the code is invalid or expired, you will see an error message and must try again.
>
* [Disabling Quick Connect (Server)](#disabling-quick-connect-server)
* [Supported Clients](#supported-clients)
* [Using Quick Connect](#using-quick-connect)
* [On Device A (New Device - the one you want to log into)](#on-device-a-new-device---the-one-you-want-to-log-into)
* [On Device B (Already Logged-In Device)](#on-device-b-already-logged-in-device)