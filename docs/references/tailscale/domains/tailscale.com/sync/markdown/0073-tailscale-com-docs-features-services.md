Viewing the list of endpoints on your network · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Viewing the list of endpoints on your network
Last validated: Jan 5, 2026
Tailscale's endpoint collection feature lets you monitor and easily connect to the endpoints running
on machines in your Tailscale network.
The endpoint collection view is currently [in alpha](/docs/reference/tailscale-release-stages#alpha).
## [What are endpoints?](#what-are-endpoints)
Endpoints are the network-exposed ports running on each of your Tailscale machines, defined
by their `port` and `protocol`. If your network has enabled endpoint collection, each of your
machines will share its live list of endpoints with your Tailscale network.
## [Enabling endpoint collection](#enabling-endpoint-collection)
This feature is disabled by default, meaning that endpoint data is never collected or shared
between your devices unless you choose to enable endpoint collection. You can change this
setting on the [Services](https://login.tailscale.com/admin/services) page of the admin console, after selecting
the **Discovered** tab.
Although endpoint collection is a global setting for your Tailscale network, endpoints
will not be sent from any machines that are [blocking incoming connections](/docs/features/client/manage-preferences).
## [Monitoring your endpoints](#monitoring-your-endpoints)
With endpoint collection enabled, your admin console will display the list of endpoints
on your network. We don't currently store endpoints in our database, so the page acts as a
monitoring tool for *live* endpoints. As you start and stop endpoints, you'll find the page
reflects those changes.
Below is a preview of the **Discovered** tab on the [Services](https://login.tailscale.com/admin/services) page.
An endpoints table is also visible on each machine's details page with just the endpoints exposed by that machine.
The endpoints tables includes a `type` column. We categorize endpoints into types to help
you better identify them. Our categorization rules are basic and will be tuned over time,
so note that if you use an uncommon port, we may fallback to "Other" type.
## [Launching endpoints](#launching-endpoints)
From the endpoints tables, you can directly launch certain applications.
* For SSH, we show a copyable `ssh 100.x.y.z` command.
* For VNC and [RDP](/docs/solutions/access-remote-desktops-using-windows-rdp), we show a one-select **Launch** button to start a remote session.
* For HTTP and HTTPS, we show a one-select **Open** button to open the web server.
## [Access controls](#access-controls)
You can configure the access for each of your endpoints using [Tailscale access control policies](/docs/features/access-control). If you're interested
in knowing who can access each endpoint, hover over the info icon in the **Access Controls** column of the
**Endpoints** table.
If someone has [shared](/docs/features/sharing) a machine from another network with you, their machine's shared
ports will be visible in your endpoints list. Note that for shared machines you will *only* see
the endpoints that the sharer has given you access to via their network's access control policies.
On this page
* [What are endpoints?](#what-are-endpoints)
* [Enabling endpoint collection](#enabling-endpoint-collection)
* [Monitoring your endpoints](#monitoring-your-endpoints)
* [Launching endpoints](#launching-endpoints)
* [Access controls](#access-controls)
Scroll to top