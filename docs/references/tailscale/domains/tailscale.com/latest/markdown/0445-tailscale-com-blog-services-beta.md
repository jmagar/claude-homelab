Tailscale Services: Define resources on your tailnet, with granular controls
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|productOctober 28, 2025
# Introducing Tailscale Services
Today we’re excited to announce Tailscale Services, a new way to define available resources on your network and expand the granularity of your access controls.
Tailscale’s mesh-networking approach, combined with a flexible and powerful policy engine, has empowered our customers to provide precision access controls wherever Tailscale is installed.
But what if you’re unable to install Tailscale on a resource directly? What if that resource is on a dynamic IP address, or in ephemeral container orchestration environments? What if a single machine hosts multiple resources, or if a single logical resource exists in multiple places? What if you’ve got thousands of services you need to quickly stand up in a tailnet?
## [Your services, on Tailscale](#your-services-on-tailscale)
That’s where Tailscale Services come in. Tailscale Services allows you to assign virtual Tailscale IPv4 and IPv6 address pairs (TailVIPs) to any logical resource in your network, as long as that resource is reachable by a Tailscale client. Services get a unique human-readable [MagicDNS name](https://tailscale.com/kb/1081/magicdns?utm_source=blog&amp;utm_medium=content&amp;utm_campaign=fall-update-2025) for ease of reference. Services are a unit of policy on which you can grant access. And maintaining a service can be entirely automated via API.
Tailscale Services functions a lot like traditional Tailscale nodes, but the services are not tied to any particular hardware. A service can map to one or many Tailscale nodes. Because of that, Tailscale Services can replace traditional or cloud load balancing setups with simple intelligent routing and availability mechanisms.
## [**A new approach to connectivity**](#a-new-approach-to-connectivity)
We’ve been piloting Tailscale Services with select customers, and they’ve used it for all sorts of connectivity scenarios, from workload connectivity to critical developer tooling to internal application access. Our early design partners have built capability and identity-aware database proxies, highly available internal secret stores, simple and scalable MCP servers, globally distributed telemetry and logging gateways, and more—all without any complex networking and security infrastructure to set up.
One design partner used Tailscale Services alongside their CI pipelines to connect in-development workloads to testing suites, quality assurance teams, and their internal secret storage, migrating away from a legacy firewall, load balancer, and mutual TLS setup. The repeatable API-driven interface allowed them to easily scale their CI model across the organization with minimal infrastructure setup, internal approvals, and allowed for their development teams to focus on shipping code instead of debugging networking issues or fighting security constraints.
Another design partner leveraged Tailscale Services to expose a fleet of containerized applications in their homelab with MagicDNS names instead of having to remember their various port numbers. Their previous setup required complex local networking and didn’t allow for high availability during software updates or migrations.
Tailscale Services can help anywhere you need a simple and predictable connectivity path, precision access control policies, or can’t install Tailscale on the target workload.
## [Architecture](#architecture)
Every service consists of a stable TailVIP, unique MagicDNS name, a definition of the service’s endpoints, and a set of hosts that advertise the service. Optionally, services can be assigned to a tag for identification and grouping.
Services can be defined using the Tailscale API or in the admin console.
Services are backed by a set of Tailscale clients that act as service hosts. Each host advertises a set of endpoints, in line with the service’s definition, where those endpoints are mapped on the host to their final destination resources.
```
`{
"version": "0.0.1",
"services": [
"svc:webapp": {
"endpoints": {
"tcp:443": "http://localhost:8096"
}
},
"svc:db": {
"endpoints": {
"tcp:3306": "tcp://db:3306",
"tcp:443": "https://prod:8443",
}
},
]
}
`
```
*Service hosts can be defined in a declarative configuration format or from the command line with the tailscale serve subcommand.*
For a service host to be considered active, it must pass a set of validations. These validations are inherent to the service’s definition. If all validations pass, the host is considered active. If at least one host is active for a service, the service is considered *available*.
Service hosts must pass a set of validations including interface, connectivity, state, and tag checks.
Service hosts must be a [tagged](<https://tailscale.com/kb/1068/tags?utm_source=blog&amp;utm_medium=content&amp;utm_campaign=fall-update-2025 >) device, have an active service advertisement (similar to [subnet routes](<https://tailscale.com/kb/1019/subnets?utm_source=blog&amp;utm_medium=content&amp;utm_campaign=fall-update-2025 >)), and be approved for use by the service. This can be done manually by administrators, or via [auto approvers](<https://tailscale.com/kb/1337/policy-syntax#autoapprovers?utm_source=blog&amp;utm_medium=content&amp;utm_campaign=fall-update-2025 >).
```
`"autoApprovers": {
"services": {
// devices in the tag:vpc-staging
// can add hosts to the service staging-db without approval
"svc:staging-db": ["tag:vpc-staging"],
},
},`
```
*Service hosts can be automatically approved into a TailVIP based on their tag or Tailscale IP via auto approvers.*
Finally, users and devices on the tailnet must explicitly be granted access to a service via [Grants](https://tailscale.com/kb/1324/grants). Every service can be referenced by either its TailVIPs or MagicDNS name (with a `svc:` prefix). For example, you might want to give DevOps administrative access to your staging database hosts, while giving Engineering scoped access to just the staging database:
```
`"grants": [
{
"src": ["group:devops"],
"dst": ["tag:staging-db-hosts"]
"ip": ["\*"],
},
{
"src": ["group:eng"],
"dst": ["svc:staging-db"],
"ip": ["5432"],
},
]`
```
*Services are a valid Grant destination, for easy precision access controls.*
### [MagicDNS and TailVIP](#magicdns-and-tailvip)
Each service you define is identified by its MagicDNS name, and is assigned an IPv4 and IPv6 [address pair](https://tailscale.com/kb/1033/ip-and-dns-addresses), just like nodes. A service can be addressed via its TailVIPs or via their short and long MagicDNS names. Each device in a tailnet can configure and advertise a service using a declarative config file, or from the command line, using the `--service=svc:foo` flag in the `tailscale serve` command. To expose a staging database, for example, you might define a service in the admin panel, and then from a Tailscale client on your staging database run the following:
```
`# a network operator can configure and advertise the service "staging-db"
[admin@pg-db-staging-1]› tailscale serve --service="svc:staging-db" --tcp 5432
localhost:5432
This machine is configured as a service host for svc:staging-db, but approval from an admin is required. Once approved, it will be available on your tailnet as:
|-- tcp://staging-db.corp.ts.net:5432 (TLS over TCP)
|--\> tcp://localhost:5432
Serve started and running in the background.
To disable the host, run: tailscale serve --service=svc:staging-db --tcp=5432 off
To remove config for the service, run: tailscale serve clear svc:staging-db
`
```
*Service hosts can map and advertise endpoints from the command line with the tailscale serve subcommand.*
### [Highly available, out of the box](#highly-available-out-of-the-box)
Tailscale Services can optionally point to multiple destinations. Services leverage our [high availability options](<https://tailscale.com/kb/1115/high-availability?utm_source=blog&amp;utm_medium=content&amp;utm_campaign=fall-update-2025 >) to intelligently route clients to an available Service host. Because Tailscale Services make routing decisions based on network-level availability, host-level advertisement states, endpoint verification, global steering, and in-region load distribution, your service is instantly highly available and state-aware.
Services can be made highly available, with global intelligent steering powered by Tailscale Regional Routing.
To do so, simply configure & advertise multiple service hosts for the staging-db service from multiple Tailscale clients. Then, any user or device on the tailnet connecting to the `staging-db` service will follow the tailnet’s global routing policy to connect to the nearest available instance.
### [It’s entirely automatable](#its-entirely-automatable)
Services can be defined via the [Tailscale API](https://tailscale.com/api) for use at scale or in CI and automated workflows. Each service host can also locally configure their endpoint mappings using either the `tailscale serve` command, a configuration file, a local routing table like [iptables](https://linux.die.net/man/8/iptables), or setting up proxies like [caddy](https://caddyserver.com/) or [nginx](https://nginx.org/en/) and configuring their own local proxies.
## [What's next?](#whats-next)
**Tailscale Services is available today, on all plans, in public beta.** In the future, usage limitations will depend on plan type and the type of service deployed. During our open beta period, we won’t be charging customers or capping usage on the services they define and deploy, and we’ll provide a legacy exception for your usage.
We’re continuing to improve Tailscale Services with the features you’d expect from Tailscale, like Configuration Audit Logs, Network Flow Logs, and more. Currently, service hosts can only point to resources that are on the local host; in the coming 1.92 stable release they’ll be able to point at local network destinations. We’re also doing the standard bug squashing and usability testing, and readily listening to feedback from our customers.
This is just a foundation for what’s next. We have a long way to go, and we’d love to hear your thoughts on what’s most important and valuable. We’ve got ideas around:
* Bringing more state validation to Tailscale Services, with availability based on custom context
* Creating an API to register service hosts with [tsnet](https://tailscale.com/kb/1244/tsnet)
* Building identity in Tailscale Services, extending the boundary of trust from connection termination to where the workload is running
* Integrating natively with third-party proxies, so you can plug Tailscale into existing infrastructure
* Letting services hook up to Funnels for easy, public-facing HA access
* Discovering local services on the network and building easy workflows to expose them
* Building a service gateway to leverage Tailscale’s native MagicDNS across entire private subnets, and much more.
To get started today, head over to the admin console \> Services tab and define your first service. Or, follow along in [our documentation](<https://tailscale.com/kb/1552/tailscale-services?utm_source=blog&amp;utm_medium=content&amp;utm_campaign=fall-update-2025 >) for more details.
Share
Authors
Kabir Sikand
Adrian Dewhurst
Contributors
Fran Bull
Naman Sood
Kevin Liang
Authors
Kabir Sikand
Adrian Dewhurst
Contributors
Fran Bull
Naman Sood
Kevin Liang
Share
Loading...
## Try Tailscale for free
[
Get started
](https://login.tailscale.com/start)
Schedule a demo
[
Contact sales
](/contact/sales)