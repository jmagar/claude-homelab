Troubleshooting | Seerr
[Skip to main content](#__docusaurus_skipToContent_fallback)
On this page
## [TMDB] failed to retrieve/fetch XXX[​](#tmdb-failed-to-retrievefetch-xxx)
### Option 1: Change your DNS servers[​](#option-1-change-your-dns-servers)
This error often comes from your Internet Service Provider (ISP) blocking TMDB API. The ISP may block the DNS resolution to the TMDB API hostname.
To fix this, you can change your DNS servers to a public DNS service like Google's DNS or Cloudflare's DNS:
* Docker CLI
* Docker Compose
* Windows
* Linux
Add the following to your `docker run` command to use Google's DNS:
```
`--dns=8.8.8.8
`
```
or for Cloudflare's DNS:
```
`--dns=1.1.1.1
`
```
or for Quad9 DNS:
```
`--dns=9.9.9.9
`
```
You can try them all and see which one works for your network.
### Option 2: Use Seerr through a proxy[​](#option-2-use-seerr-through-a-proxy)
If you can't change your DNS servers or force IPV4 resolution, you can use Seerr through a proxy.
In some places (like China), the ISP blocks not only the DNS resolution but also the connection to the TMDB API.
You can configure Seerr to use a proxy with the [HTTP(S) Proxy](/using-seerr/settings/general#enable-proxy-support) setting.
### Option 3: Force IPV4 resolution first[​](#option-3-force-ipv4-resolution-first)
Sometimes there are configuration issues with IPV6 that prevent the hostname resolution from working correctly.
You can try to force the resolution to use IPV4 first by going to `Settings \> Networking \> Advanced Networking` and enabling `Force IPv4 Resolution First` setting and restarting Seerr.
### Option 4: Check that your server can reach TMDB API[​](#option-4-check-that-your-server-can-reach-tmdb-api)
Make sure that your server can reach the TMDB API by running the following command:
* Docker CLI
* Docker Compose
* Linux
* Windows
```
`docker exec -it seerr sh -c "apk update && apk add curl && curl -L https://api.themoviedb.org"
`
```
If you can't get a response, then your server can't reach the TMDB API.
This is usually due to a network configuration issue or a firewall blocking the connection.
## Account does not have admin privileges[​](#account-does-not-have-admin-privileges)
If your admin account no longer has admin privileges, this is typically because your Jellyfin/Emby user ID has changed on the server side.
This can happen if you have a new installation of Jellyfin/Emby or if you have changed the user ID of your admin account.
### Solution: Reset admin access[​](#solution-reset-admin-access)
1. Back up your `settings.json` file (located in your Seerr data directory)
2. Stop the Seerr container/service
3. Delete the `settings.json` file
4. Start Seerr again
5. This will force the setup page to appear
6. Go through the setup process with the same login details
7. You can skip the services setup
8. Once you reach the discover page, stop Seerr
9. Restore your backed-up `settings.json` file
10. Start Seerr again
This process should restore your admin privileges while preserving your settings.
## Failed to enable web push notifications[​](#failed-to-enable-web-push-notifications)
### Option 1: You are using Pi-hole[​](#option-1-you-are-using-pi-hole)
When using Pi-hole, you need to whitelist the proper domains in order for the queries to not be intercepted and blocked by Pi-hole.
If you are using a chromium based browser (eg: Chrome, Brave, Edge...), the domain you need to whitelist is `fcm.googleapis.com`
If you are using Firefox, the domain you need to whitelist is `push.services.mozilla.com`
1. Log into your Pi-hole through the admin interface, then click on Domains situated under GROUP MANAGEMENT.
2. Add the domain corresponding to your browser in the `Domain to be added` field and then click on Add to allowed domains.
3. Now in order for those changes to be used you need to flush your current dns cache.
4. You can do so by using this command line in your Pi-hole terminal:
```
`pihole restartdns
`
```
If this command fails (which is unlikely), use this equivalent:
```
`pihole -f && pihole restartdns
`
```
1. Then restart your Seerr instance and try to enable the web push notifications again.
### Option 2: You are using Brave browser[​](#option-2-you-are-using-brave-browser)
Brave is a "De-Googled" browser. So by default or if you refused a prompt in the past, it cuts the access to the FCM (Firebase Cloud Messaging) service, which is mandatory for the web push notifications on Chromium based browsers.
1. Open Brave and paste this address in the url bar: `brave://settings/privacy`
2. Look for the option: "Use Google services for push messaging"
3. Activate this option
4. Relaunch Brave completely
5. You should now see the notifications prompt appearing instead of an error message.
If you still encounter issues, please reach out on our support channels.
* [[TMDB] failed to retrieve/fetch XXX](#tmdb-failed-to-retrievefetch-xxx)
* [Option 1: Change your DNS servers](#option-1-change-your-dns-servers)
* [Option 2: Use Seerr through a proxy](#option-2-use-seerr-through-a-proxy)
* [Option 3: Force IPV4 resolution first](#option-3-force-ipv4-resolution-first)
* [Option 4: Check that your server can reach TMDB API](#option-4-check-that-your-server-can-reach-tmdb-api)
* [Account does not have admin privileges](#account-does-not-have-admin-privileges)
* [Solution: Reset admin access](#solution-reset-admin-access)
* [Failed to enable web push notifications](#failed-to-enable-web-push-notifications)
* [Option 1: You are using Pi-hole](#option-1-you-are-using-pi-hole)
* [Option 2: You are using Brave browser](#option-2-you-are-using-brave-browser)