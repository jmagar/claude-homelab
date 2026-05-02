Troubleshooting Proxmox issues · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Troubleshooting Proxmox issues
Last validated: Mar 18, 2026
The following sections provide suggestions and tips to help troubleshoot common Proxmox issues.
## [Installing Tailscale within a VM](#installing-tailscale-within-a-vm)
Proxmox can run virtual machines, emulating a hardware device and allowing an unmodified operating system to run within it. [Tailscale can be installed](/docs/install) in the OS within the virtual machine as normal.
## [Installing Tailscale within an LXC](#installing-tailscale-within-an-lxc)
Proxmox can also run lightweight Linux containers called LXC/LXD and can run them privileged or unprivileged. Tailscale can run within LXC/LXD containers, though running within an unprivileged container [requires an adjustment in the config](/docs/features/containers/lxc/lxc-unprivileged).
## [resolv.conf within LXC](#resolvconf-within-lxc)
By default Proxmox writes its own DNS config to `/etc/resolv.conf` within the LXC. Even if the LXC gets its DNS configuration from DHCP, Proxmox will overwrite `/etc/resolv.conf` with its own. If Tailscale is installed on Proxmox and using MagicDNS, Proxmox will write that config to the container's `/etc/resolv.conf`:
```
`# --- BEGIN PVE ---
nameserver 100.100.100.100
search example.ts.net
# --- END PVE ---
`
```
If the LXC itself does not have Tailscale installed, this configuration is unlikely to work and DNS lookups will time out.
Two options to mitigate this behavior are:
* Configure `tailscale` without MagicDNS on the Proxmox host with `tailscale set --accept-dns=false`.
* Create a file named `/etc/.pve-ignore.resolv.conf` *within each LXC's filesystem* that will tell Proxmox not to overwrite `/etc/resolv.conf`.
On this page
* [Installing Tailscale within a VM](#installing-tailscale-within-a-vm)
* [Installing Tailscale within an LXC](#installing-tailscale-within-an-lxc)
* [resolv.conf within LXC](#resolvconf-within-lxc)
Scroll to top