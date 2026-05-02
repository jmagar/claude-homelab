Troubleshoot Windows ping issues · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Troubleshoot Windows ping issues
Last validated: Feb 18, 2026
Windows generally has aggressive firewall rules set up, even for ICMP (ping) traffic (both incoming and outgoing). Be sure that you've enabled your Windows devices to be able to both send and receive ICMP traffic.
A faster, but riskier approach to test this is to (temporarily) disable the Windows firewalls and check for any impact. Refer to [issue #454](https://github.com/tailscale/tailscale/issues/454) for updates on improving related notifications and user experience.
Scroll to top