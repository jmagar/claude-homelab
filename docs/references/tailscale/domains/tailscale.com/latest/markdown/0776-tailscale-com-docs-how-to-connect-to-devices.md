Connect to devices · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Connect to devices
Last validated: Jan 5, 2026
Tailscale automatically assigns each device on your network a unique [Tailscale IP address](/docs/concepts/tailscale-ip-addresses) and [MagicDNS](/docs/features/magicdns) name so that you can establish stable connections between devices anywhere in the world, even if they're behind a firewall or change networks. This guide covers connecting to devices in your tailnet after you've installed Tailscale on two or more devices.
Before you explore the connection process, it's crucial to understand that Tailscale provides network connectivity between devices, but you must run a specific [service](/docs/features/services) (like SSH or a web server) on the destination device. Tailscale does not provide these services automatically.
## [Prerequisites](#prerequisites)
* Tailscale installed on at least two devices.
* [Access control policies](/docs/features/access-control/acls) that allow the devices to connect. If you're using the [default access control policies](/docs/reference/examples/acls#allow-all-default-acl), all connections will be allowed between any device in your tailnet.
* At least one [service](/docs/features/services) running on one of the devices.
## [Connect to devices in your tailnet](#connect-to-devices-in-your-tailnet)
To connect to another device in your tailnet:
1. [Identify the device to connect to](#identify-your-devices).
2. [Make sure the device is running a service you can access](#ensure-services-are-running).
3. [Connect to the service](#connect-to-a-service).
### [Identify your devices](#identify-your-devices)
Open the [Machines](https://login.tailscale.com/admin/machines) page of the admin console. You'll find a list of all devices in your tailnet, along with their hostnames ([device names](/docs/concepts/machine-names)) and [Tailscale IP addresses](/docs/concepts/tailscale-ip-addresses).
### [Ensure services are running](#ensure-services-are-running)
Remember, you can only connect to services running on your devices. Common services include:
* SSH (usually on port `22`)
You can also use [Tailscale SSH](/docs/features/tailscale-ssh).
* Web servers (often on port `80` or `443`)
* File sharing services (such as SFTP)
* Remote access tools (such as RDP)
Ensure the [service](/docs/features/services) you want to access runs on the target device. You can do so by checking the [Services](https://login.tailscale.com/admin/services) page of the admin console, or by confirming the service is running on the destination device.
### [Connect to a service](#connect-to-a-service)
Tailscale offers a feature called [MagicDNS](/docs/features/magicdns), which allows you to use [device names](/docs/concepts/machine-names) instead of Tailscale IP addresses. It's enabled by default, so you can use it right away.
To connect to a service on a device in your tailnet:
* Use the [device name](/docs/concepts/machine-names) or [Tailscale IP address](/docs/concepts/tailscale-ip-addresses) of the target device.
* Specify the port of the service you're trying to access.
For example, if you want to SSH into a device with the [MagicDNS](/docs/features/magicdns) [name](/docs/concepts/machine-names) `dev-build-server`, you can use the following command in a terminal emulator:
```
`ssh username@dev-build-server
`
```
Visit the following topics to find more information more about connecting to different types of services:
* [Connect to a database](/docs/database).
* [Connect to a Windows server using RDP](/docs/solutions/access-remote-desktops-using-windows-rdp).
* [Connect to a cloud server](/docs/cloud-server).
* [Connect to a remote development environment](/docs/remote-code).
* [Connect to a network attached storage (NAS)](/docs/integrations/nas).
## [Troubleshooting](#troubleshooting)
If you can't connect to a service:
* Check if you can reach the device using [`tailscale ping`](/docs/reference/tailscale-cli#ping).
* Verify that you're using the correct connection information.
* Ensure the service is running on the target device at the expected port number.
* Check if any [firewalls](/docs/integrations/firewalls) (including the built-in firewall on the target device) are blocking the connection.
* Ensure that your [tailnet policy file](/docs/features/tailnet-policy-file/manage-tailnet-policies) doesn't contain any [grants](/docs/features/access-control/grants) or [ACLs](/docs/features/access-control/acls) that prevent a connection between the two devices.
* Visit [troubleshooting device connectivity](/docs/reference/device-connectivity).
## [Advanced topics](#advanced-topics)
The following sections cover other ways you can manage connections to devices in your tailnet.
### [Access control](#access-control)
When you create a tailnet, Tailscale automatically applies a [default access control policy](/docs/reference/examples/acls#allow-all-default-acl) that lets you connect to all devices you own. You can customize [access control policies](/docs/features/access-control) (such as [ACLs](/docs/features/access-control/acls) or [grants](/docs/features/access-control/grants)) in the [tailnet policy file](/docs/features/tailnet-policy-file/manage-tailnet-policies) to create policies that control how devices in your tailnet connect to each other and other devices on the internet.
### [Tailscale SSH](#tailscale-ssh)
Tailscale offers a built-in SSH feature that extends and simplifies SSH connections between your devices. When enabled, [Tailscale SSH](/docs/features/tailscale-ssh) manages the authentication and authorization of SSH connections in your tailnet, letting you add additional security checks and providing a web console interface.
### [Sharing devices](#sharing-devices)
You can [share devices](/docs/features/sharing) or [specific services](/docs/features/tailscale-serve) with other Tailscale users, allowing collaboration while maintaining security.
### [Routing](#routing)
You can configure a device to route outbound traffic by running it as an [exit node](/docs/features/exit-nodes) or inbound traffic by running it as a [subnet router](/docs/features/subnet-routers). Using a device as a subnet router lets you access devices without installing the Tailscale client.
On this page
* [Prerequisites](#prerequisites)
* [Connect to devices in your tailnet](#connect-to-devices-in-your-tailnet)
* [Identify your devices](#identify-your-devices)
* [Ensure services are running](#ensure-services-are-running)
* [Connect to a service](#connect-to-a-service)
* [Troubleshooting](#troubleshooting)
* [Advanced topics](#advanced-topics)
* [Access control](#access-control)
* [Tailscale SSH](#tailscale-ssh)
* [Sharing devices](#sharing-devices)
* [Routing](#routing)
Scroll to top