Manage client preferences · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Manage client preferences
Last validated: Jan 5, 2026
[Admins](/docs/reference/user-roles) can manage devices on a network, and restrict which devices can connect using access control policies.
Individual users still have control over their own devices, to block incoming connections from Tailscale or to ignore Tailscale's DNS settings and advertised routes.
## [Default configuration](#default-configuration)
By default, a Tailscale client will:
* Allow incoming connections
* Use Tailscale DNS settings
macOS, Windows, and other non-Linux devices use Tailscale subnets by default. Linux devices do not use Tailscale by default.
## [Allow incoming connections](#allow-incoming-connections)
If other devices in your tailnet are allowed to connect to your device based on access control policies, then the connection will be created. Access control policies are directional, so that an access rule allowing your laptop to connect to a web server does not allow the web server to establish connections to your laptop.
If you want to block all incoming connections, you can do so. This is also known as "shields up". In the menu bar of your device,
uncheck **Allow incoming connections**. When unchecked, your device will still
be visible and allowed to *send* traffic, but won't *accept* any connections
over Tailscale, including pings.
### [Toggling incoming connections](#toggling-incoming-connections)
This can be configured in the client menu bar or the CLI.
### [In the client menu bar](#in-the-client-menu-bar)
[macOS](/docs/features/client/manage-preferences?tab=macos)[iOS](/docs/features/client/manage-preferences?tab=ios)[Android](/docs/features/client/manage-preferences?tab=android)[Windows](/docs/features/client/manage-preferences?tab=windows)[Linux](/docs/features/client/manage-preferences?tab=linux)
If you are running Tailscale v1.60.0 or later, from the menu bar, select Tailscale, select **Settings**, and then check/uncheck **Allow incoming connections**.
If you are running a version of Tailscale earlier than v1.60.0, from the menu bar, select Tailscale and check/uncheck **Allow incoming connections**.
### [In the CLI](#in-the-cli)
To block incoming connections:
```
`tailscale set --shields-up
`
```
To allow incoming connections (default):
```
`tailscale set --shields-up=false
`
```
## [Use Tailscale DNS settings](#use-tailscale-dns-settings)
If an Admin has configured [DNS settings for your tailnet, including MagicDNS or split DNS](/docs/reference/dns-in-tailscale), then DNS queries for devices in your Tailscale network will respect those settings.
If you are using an [exit node](/docs/features/exit-nodes), your local DNS is the DNS for the exit node, not your device.
This can be configured in the client menu bar or the CLI.
### [In the client menu bar](#in-the-client-menu-bar-1)
If you want to only use local DNS, in the menu bar of your device, uncheck **Use Tailscale DNS settings**.
### [In the CLI](#in-the-cli-1)
To use Tailscale DNS settings (default):
```
`tailscale set --accept-dns=true
`
```
To not use Tailscale DNS settings:
```
`tailscale set --accept-dns=false
`
```
## [Use Tailscale subnets](#use-tailscale-subnets)
If an Admin has created [subnet routes](/docs/features/subnet-routers) for your tailnet, then Tailscale will route your device's traffic for the advertised subnets to the appropriate subnet router.
This can be configured in the client menu bar or the CLI.
### [In the client menu bar](#in-the-client-menu-bar-2)
If you want to ignore the advertised routes, in the menu bar of your device, uncheck **Use Tailscale subnets**.
### [In the CLI](#in-the-cli-2)
To use Tailscale subnets (default, except for Linux):
```
`tailscale set --accept-routes=true
`
```
To not use Tailscale subnets (default on Linux):
```
`tailscale set --accept-routes=false
`
```
On this page
* [Default configuration](#default-configuration)
* [Allow incoming connections](#allow-incoming-connections)
* [Toggling incoming connections](#toggling-incoming-connections)
* [In the client menu bar](#in-the-client-menu-bar)
* [In the CLI](#in-the-cli)
* [Use Tailscale DNS settings](#use-tailscale-dns-settings)
* [In the client menu bar](#in-the-client-menu-bar-1)
* [In the CLI](#in-the-cli-1)
* [Use Tailscale subnets](#use-tailscale-subnets)
* [In the client menu bar](#in-the-client-menu-bar-2)
* [In the CLI](#in-the-cli-2)
Scroll to top