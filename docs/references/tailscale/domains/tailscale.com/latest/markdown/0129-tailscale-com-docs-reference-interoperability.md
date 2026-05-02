Interoperability with other software · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Interoperability with other software
Last validated: Mar 25, 2026
Tailscale tries to cooperate and run alongside other software on your device, but sometimes that's not possible. Some operating systems impose limitations on how many VPN-type programs can run at once or register with certain OS-level facilities, and sometimes other software accidentally or by design breaks Tailscale.
When debugging issues where Tailscale doesn't work, we generally start by trying to identify how your device or network is different and what other software you're running on the device that's apparently conflicting. Here are some general questions to consider:
* Are you running any other networking, VPN, endpoint security, antivirus, virtualization or other security software?
* Any security proxy on the network/router?
A non-exhaustive list of other software that may or may not cause problems, depending on operating systems, versions, and configurations:
* [Apple Screen Time (or any other macOS content filters)](/docs/concepts/macos-webfilterproxyd)
* Apple Private Relay
* Avast
* Cisco Umbrella
* ClamXAV
* Clash, ClashX, Clash Pro X
* Cloudflare Warp
* CrowdStrike Falcon
* Docker Desktop
* FortiClient
* GlobalProtect VPN
* Little Snitch
* McAfee LiveSafe
* Mullvad
* Netskope
* PIA
* Proton VPN
* TunnelBear
* Tunnelblick
* VirtualBox
* VMware
* VMware Carbon Black
* Webroot
* WireGuard
* WSL
* ZeroTier
Let us know if you're running one of those, or similar programs. On some operating systems Tailscale is not even able to detect the presence of those programs due to sandboxing. If you let us know what you're running, we might be able to advise you on how to configure things to work. To let us know, [contact Tailscale Support](/contact/support).
If your device was supplied by your employer, it is very likely not just a stock macOS or Windows install. It is likely to be running other software.
Scroll to top