Using OPNsense with Tailscale · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Using OPNsense with Tailscale
Last validated: Dec 4, 2025
[OPNsense](https://opnsense.org) is an open source router and firewall platform built using FreeBSD. Tailscale can be installed on an OPNsense platform, joining it to your WireGuard-based mesh network.
OPNsense is a community supported platform for Tailscale.
As of OPNsense v24.711, an `os-tailscale` plugin is available. This plugin does not require the following command-line steps.
## [Installation](#installation)
Connect to the console of OPNsense using SSH or another preferred method. Select option `8) Shell` and ensure you are the root user.
First we must download the ports tree. More information about this can be found in the OPNsense [documentation](https://docs.opnsense.org/manual/software_included.html), and the FreeBSD ports [documentation](https://docs.freebsd.org/en/books/handbook/ports).
```
`# opnsense-code ports
Updating OPNsense repository catalogue...
...
Cloning into '/usr/ports'...
...
Your branch is up to date with 'origin/master'.
`
```
Make sure to run `opnsense-code ports` again even if you have done so previously, to update the ports tree to current versions. The version of Tailscale in the FreeBSD ports is periodically updated for new releases. More information on updates can be found below.
Once the ports tree is downloaded, execute the following steps as root to install Tailscale.
```
`# cd /usr/ports/security/tailscale
# make install
`
```
Once installed, start and enable the `tailscaled` daemon and verify that Tailscale is working properly with `tailscale version`.
```
`# service tailscaled enable
# service tailscaled start
# tailscale version
root@opnsense:\~ # tailscale version
1.56.1
go version: go1.21.5
`
```
## [Connect](#connect)
To add the OPNsense machine as a node in your tailnet run the following command as root:
```
`# tailscale up
To authenticate, visit:
https://tailscale.com/a/abc123abc123
`
```
You'll be asked to authenticate to Tailscale in your browser. This is an appropriate time to specify other useful options such as [subnet-routes](/docs/features/subnet-routers), [exit nodes](/docs/features/exit-nodes), and so on.
Once started, Tailscale should appear in the list of interfaces in the OPNsense UI. It can be used in firewall rules and other OPNsense functions.
## [Update Tailscale](#update-tailscale)
To update Tailscale perform the following steps as the root user:
```
`# opnsense-code ports
# cd /usr/ports/security/tailscale
# make deinstall
# make clean
# make install
# service tailscaled restart
`
```
This might take a few minutes depending on the strength of the CPU in use. Verify Tailscale updated using `tailscale version`. Sometimes it is necessary to restart the tailscaled service with `service tailscaled restart`.
## [Direct Connections for LAN Clients](#direct-connections-for-lan-clients)
As a router/firewall, OPNsense may also be providing internet connectivity for LAN devices which themselves have a Tailscale client installed. The NAT implementation in OPNsense is an [Endpoint-Dependent Mapping, or "hard" NAT](/blog/how-nat-traversal-works), which means that LAN devices have difficulty making direct connections and often resort to [DERP Relays](/docs/reference/derp-servers).
There are a few options in which OPNsense can enable devices on the LAN to make direct connections to remote Tailscale nodes. Static NAT port mapping and NAT-PMP.
## [Static NAT port mapping](#static-nat-port-mapping)
By default, OPNsense software rewrites the source port on all outgoing connections to enhance security and prevent direct exposure of internal port numbers.
Static port mapping in OPNsense involves creating a fixed association between a specific external port number and an internal IP address and port, allowing incoming traffic to be directed to the correct destination within the local network.
Go to **Firewall \> NAT**, **Outbound** tab. Select **Hybrid Outbound NAT rule generation**. Select **Save**. Select **↑ Add** to create a new NAT rule to the top of the list.
Configure the rule to match UDP traffic as shown below. Note, for each rule, select the appropriate **Address Family** (IP version), **IPv4** for one and **IPv6** for the other.
Check **Static Port** in the **Translation** section of the page. Select **Save**. Select **Apply Changes**.
In your ACLs, set [randomizeClientPort](/docs/reference/syntax/policy-file#network-policy-options).
```
`{
// Other configurations
"randomizeClientPort": true
}
`
```
From the command line, use `tailscale ping node` to verify the connection path between two nodes. Also useful in this scenario is `tailscale netcheck`.
## [NAT-PMP](#nat-pmp)
NAT-PMP is a protocol by which LAN clients can ask the firewall to temporarily create port mappings.
Enable the UPnP service and **Allow NAT-PMP Port Mapping** in **Services** \> **Universal Plug and Play**. Only NAT-PMP is needed for Tailscale's use, but enabling UPnP can be helpful for other applications like gaming consoles.
## [Further reading](#further-reading)
Setting up [subnet routing](/docs/features/subnet-routers) or acting as an [exit node](/docs/features/exit-nodes) may be of interest for a router using OPNsense.
## [Special thanks](#special-thanks)
Special thanks to GitHub user [@newmy-de](https://github.com/newmy-de) who helped us provide these installation instructions.
On this page
* [Installation](#installation)
* [Connect](#connect)
* [Update Tailscale](#update-tailscale)
* [Direct Connections for LAN Clients](#direct-connections-for-lan-clients)
* [Static NAT port mapping](#static-nat-port-mapping)
* [NAT-PMP](#nat-pmp)
* [Further reading](#further-reading)
* [Special thanks](#special-thanks)
Scroll to top