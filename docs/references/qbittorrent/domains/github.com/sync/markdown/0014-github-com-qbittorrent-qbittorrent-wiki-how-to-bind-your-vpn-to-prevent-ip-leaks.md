# Introduction
Many VPNs offer a 'kill-switch' feature designed to block all internet connections if the VPN connection drops, preventing accidental data leaks like your IP address. However, these kill switches can sometimes be unreliable. To add an additional layer of security, you can configure qBittorrent to bind with your VPN. This ensures data can be transferred if and only if your VPN is currently active, which helps prevent data leaks.
The following is a guide to enable this functionality
# Procedure
## Windows 11
1. Open the start menu by pressing the windows key, or by clicking on it.
2. Type into the search bar `view network connections` and hit `ENTER`. Alternatively, you can navigate with `Control Panel -> Network and Internet -> Network and Sharing Center`. This should open up a list of networks such as Ethernet and/or WiFi.
3. If your VPN is already listed, great! Remember the name of the adapter.
4. Otherwise, while this window is open, restart your VPN and a new network adapter may appear. This is your VPN.
5. This adapter may not have an obviously identifiable name at first. You may rename this to whatever you like by right-clicking and selecting 'rename'.
6. While your VPN is enabled, restart qBittorrent.
7. Click `Tools`.
8. Click `Options`.
9. Click `Advanced`.
10. Under the `Network Interface` drop down box, you should select the name of the VPN's adapter from before.
11. Select `Apply`.
12. Restart qBittorrent.
This completes the bind to your VPN. Note that qBittorrent should now only transfer data if your VPN is active.
If you're not seeing data being transferred with your VPN active, try restarting qBittorrent.