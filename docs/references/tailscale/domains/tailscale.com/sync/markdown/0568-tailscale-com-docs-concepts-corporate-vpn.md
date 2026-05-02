Corporate VPN, explained · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Corporate VPN, explained
Last validated: Jan 5, 2026
A corporate VPN extends the office network to remote locations.
This used to mean accessing shared files on a workstation from home
by using a laptop, and as the business use of computing has increased in
scope, so has the business VPN.
Today it can mean accessing data center or cloud resources from the
office, or from home, or in the field with a phone or tablet.
The business VPN can connect data centers or be used to migrate
between cloud providers.
The modern business network is built on VPNs.
## [Business VPN Security](#business-vpn-security)
The most important property of a business VPN is security.
The VPN stops unauthorized people from seeing network traffic.
This involves two components: encryption and authentication, using an identity provider
such as Okta, Active Directory, or Google Workspace.
Many corporate VPNs are based on TLS encryption, a reliable
technology that can be used to secure connections between computers.
Tailscale is based on next-generation encrypted point-to-point
tunnels: [WireGuard®](https://www.wireguard.com).
## [Connectivity](#connectivity)
The traditional business VPN is based on the concept of a concentrator.
That is, a dedicated piece of hardware in an office that remote users
connect to, for accessing any of the machines in that office.
The modern business VPN needs to be far more accommodating of our
diverse computing environment.
Modern business VPNs also provide selective routing by default.
Only connections to corporate resources need to flow through the VPN,
allowing users to access internet resources directly.
### [Hardware-based VPNs are obsolete](#hardware-based-vpns-are-obsolete)
Modern networks are not central offices with a few remote offices and
home computers: they are distributed across the internet.
You may have Virtual Machines in half-a-dozen data centers and across
cloud providers, with users on phones and tablets, some on dedicated
fiber lines and others connecting by using satellite.
Shipping hardware to a data center to spin up a Virtual Machine for a
weekend training class across the country is impossible.
Similarly, being limited by the deployed concentrator hardware when
suddenly all your employees are working from home is a huge business
risk.
Dedicated hardware has too long a procurement cycle and reduces the
flexibility of your business.
Modern corporate VPNs are entirely software based.
You can spin up a concentrator as a VPN, and split concentrators into
subnets when they become overloaded.
Advanced corporate VPNs like Tailscale can abolish concentrators
completely: every server can run Tailscale directly, and individual
clients can form point-to-point connections to each server it needs to
talk to.
Fine-grained centrally-managed [access controls](/docs/features/access-control) let you incrementally
convert your corporate network to a zero-trust environment.
## [Access Control Panel](#access-control-panel)
All VPNs need to be managed. Legacy hardware VPNs require devices to
be procured, tracked, deployed, and re-deployed as business needs
change by a corporate IT department.
Modern software VPNs need to be configured so only the resources an
employee should have access to are accessible to their computers.
If you build a business VPN from a toolbox-style solution, you have to
factor in a lot of IT time for future management.
Sophisticated modern business VPNs provide central inventory and access
control management.
The Tailscale admin console gives network administrators control over
the devices in the corporate network, the access each person has (and
thus, their devices), at both a high level where devices can be
categorized by tags and at a low-level where administrators can
restrict access to precise port numbers.
Access control is managed by using the Tailscale access control system:
```
`"grants": [
// Engineering users, plus the president, can access port 22 (ssh)
// and port 3389 (remote desktop protocol) on all servers, and all
// ports on git-server or ci-server.
{
"src": ["group:engineering", "president@example.com"],
"dst": ["\*"],
"ip": ["22", "3389"]
},
{
"src": ["group:engineering", "president@example.com"],
"dst": ["git-server", "ci-server"],
"ip": ["\*"]
}
]
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
Networks can be configured so employees can add their own
devices to the corporate network, or restricted so that IT must
authorize each piece of equipment beforehand.
By using an identity provider, authentication periods and MFA can be
required as a matter of corporate policy.
Sensible defaults mean that small businesses can also adopt Tailscale
without needing to configure any policies.
You can set up a simple modern corporate VPN in ten minutes,
download it today to give it a try.
On this page
* [Business VPN Security](#business-vpn-security)
* [Connectivity](#connectivity)
* [Hardware-based VPNs are obsolete](#hardware-based-vpns-are-obsolete)
* [Access Control Panel](#access-control-panel)
Scroll to top