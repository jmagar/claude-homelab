Troubleshoot Windows installation error · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Troubleshoot Windows installation error
Last validated: Feb 18, 2026
The Tailscale client installer requires the following Windows system services to be running:
* `Dnscache`
* `iphlpsvc`
* `netprofm`
* `WinHttpAutoProxySvc`
If the installer does not detect that these services are running, it will automatically fail. For official Microsoft guidance on disabling system services, refer to [Guidance on disabling system services on Windows Server 2016 with Desktop Experience](https://learn.microsoft.com/en-us/windows-server/security/windows-services/security-guidelines-for-disabling-system-services-in-windows-server).
Scroll to top