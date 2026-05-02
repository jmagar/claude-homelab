Mediaserver Settings | Seerr
[Skip to main content](#__docusaurus_skipToContent_fallback)
On this page
* Jellyfin
* Emby
* Plex
info
To set up Jellyfin, make sure you log in using an account with administrative privileges.
The email address can be any email address and is only used for notifications, password resets, and local sign-in.
It is **not** tied to your Jellyfin account.
### Jellyfin Libraries[​](#jellyfin-libraries)
In this section, simply select the libraries you would like Seerr to scan. Seerr will periodically check the selected libraries for available content to update the media status that is displayed to users.
If you do not see your Jellyfin library listed, verify your Jellyfin settings are correct and click the Sync Libraries button.
### Manual Library Scan[​](#manual-library-scan)
Seerr will perform a full scan of your Jellyfin libraries once every 24 hours (recently added items are fetched more frequently). If this is your first time configuring Jellyfin, a one-time full manual library scan is recommended!
### Jellyfin Settings[​](#jellyfin-settings)
This section is where you configure the connection to your Jellyfin server.
* Latest
* develop
#### Internal URL[​](#internal-url)
The internal URL is the URL that Seerr will use to communicate with your Jellyfin server. This URL should be accessible from the machine running Seerr.
In most cases, this will be the hostname or IP address of the machine running Jellyfin, followed by the port number Jellyfin is running on (usually 8096).
note
When running Seerr in a docker container with a bridged network (default), the container's network will be separate from the host network. Therefore, you cannot use `localhost` or `127.0.0.1` as the internal URL as it will resolve to the container itself.
tip
If you are running Jellyfin in a docker container, you can put both Seerr and Jellyfin on the same docker network by using a custom [docker network](https://docs.docker.com/reference/cli/docker/network/). This will allow you to use the container name as the internal URL.
#### External URL[​](#external-url)
The external URL is the URL that your users will use to access Jellyfin. This URL is used to generate links in `Play on Jellyfin` buttons, Jellyfin avatars and other places where users need to access Jellyfin directly.
In most cases, the external URL will be different from the internal URL. This is especially true if you are connecting to Jellyfin using docker container names or local IP addresses.
#### Forgot Password URL[​](#forgot-password-url)
The forgot password URL is the URL that users will be directed to when they click the "Forgot Password" button on the login page. This URL should be accessible from the machine running Seerr.
By default, this field is empty and the "Forgot Password" button on the login page will redirect to the Jellyfin internal URL with the path `/web/index.html#!/forgotpassword`.
You can customize this URL to point to a custom password reset page if you have one.
* [Jellyfin Libraries](#jellyfin-libraries)
* [Manual Library Scan](#manual-library-scan)
* [Jellyfin Settings](#jellyfin-settings)
* [Emby Libraries](#emby-libraries)
* [Manual Library Scan](#manual-library-scan-1)
* [Emby Settings](#emby-settings)
* [Plex Settings](#plex-settings)
* [Plex Libraries](#plex-libraries)
* [Manual Library Scan](#manual-library-scan-2)