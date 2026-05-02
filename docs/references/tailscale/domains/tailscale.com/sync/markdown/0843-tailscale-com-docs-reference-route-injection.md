Route injection · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Route injection
Last validated: Feb 13, 2026
When you set up [subnet routers](/docs/features/subnet-routers), [exit nodes](/docs/features/exit-nodes), or [app connectors](/docs/features/app-connectors), Tailscale injects routes into client routing tables so traffic reaches the correct destination. This topic explains the complete route injection process, including when routes appear in client routing tables, how access controls interact with routing, and how router selection works.
## [Route injection and access controls](#route-injection-and-access-controls)
Routes and access controls operate at different layers and serve different purposes:
* **Routes** (Layer 3): Determine which IP ranges are reachable through the Tailscale tunnel
* **Access controls (ACLs/grants)**: Determine which connections are permitted over the Tailscale network
A common misconception is that [grants](/docs/features/access-control/grants) or [ACLs](/docs/features/access-control/acls) control route injection. They do not. Grants control packet filtering, while routes are injected based on what subnet routers advertise and what the control plane approves.
For traffic to flow successfully, you need both:
1. A route to direct packets into the tunnel
2. An access control rule to permit the packets
You can have a route without ACL access (packets enter the tunnel but are dropped by the filter), or ACL access without a route (packets never enter the tunnel). Both conditions must be satisfied for end-to-end connectivity.
## [When routes are injected](#when-routes-are-injected)
Routes are injected into a client's routing table when all following conditions are met:
1. **A subnet router advertises the route**. The subnet router uses `--advertise-routes` to announce which subnets it can reach.
2. **An admin approves the route**. Routes must be approved in the [admin console](/docs/features/subnet-routers#enable-subnet-routes-from-the-admin-console) or through [`autoApprovers`](/docs/reference/syntax/policy-file#autoapprovers) in the tailnet policy file.
3. **The control plane distributes the route**. After approval, the control plane includes the route in the network map sent to clients.
4. **The client accepts subnet routes**. The client must have route acceptance enabled:
* Windows, macOS, Android, iOS, and tvOS accept routes by default
* Linux requires [`tailscale set --accept-routes`](/docs/reference/tailscale-cli#set)
Routes appear because clients receive them in the network map after they're advertised and approved; clients don't probe a router with pings before installing routes.
If a router is offline or access controls don't permit traffic to flow, the route may still be present but traffic won't successfully traverse it.
## [How routes and ACLs interact with CIDR ranges](#how-routes-and-acls-interact-with-cidr-ranges)
A common question is whether a grant allowing a CIDR range (like `0.0.0.0/0`) causes all advertised routes within that range to be injected. The answer is no. Grants and routes are evaluated independently:
* **Route injection**: The client receives exactly the routes that subnet routers advertise and admins approve. If a router advertises `10.1.0.0/24`, clients get a route to `10.1.0.0/24`. A grant allowing `10.0.0.0/8` does not cause additional routes to be injected.
* **ACL evaluation**: When traffic flows through an injected route, the packet filter checks if a grant permits that specific traffic. A grant allowing `10.0.0.0/8` permits traffic to any IP within that range, regardless of how many or how few routes exist within it.
### [Route prefix matching for failover](#route-prefix-matching-for-failover)
When multiple subnet routers advertise routes, only *exact* prefix matches are grouped for [high availability](/docs/how-to/set-up-high-availability). For example:
* Two routers advertising `10.0.0.0/24` are failover candidates for each other
* One router advertising `10.0.0.0/24` and another advertising `10.0.0.0/16` are *not* failover candidates, even though the `/16` contains the `/24`
The operating system's routing table handles longest-prefix matching as usual. If routes exist to both `10.0.0.0/8` and `10.1.0.0/16`, traffic to `10.1.0.5` uses the more specific `/16` route.
## [Choosing a router (when multiple routers advertise the same route)](#choosing-a-router-when-multiple-routers-advertise-the-same-route)
When multiple subnet routers advertise the same route, the control plane distributes the available routers in the network map and clients choose an active route based on availability and preferences (for example, high-availability or regional routing settings).
The choice depends on factors such as:
* **Availability**: The router must be connected to the control plane with a valid, unexpired key.
* **High availability**: If you configure multiple routers for the same prefix, clients can fail over when the active router becomes unavailable.
* **Regional routing**: If [regional routing](/docs/how-to/set-up-high-availability) is enabled, clients prefer a router in their closest DERP region based on latency measurements.
### [Accessible routers for `via` routing](#accessible-routers-for-via-routing)
When using the [`via` field](/docs/features/access-control/grants/grants-via) in grants to specify which routers can handle traffic, only "accessible" routers are candidates. A router is accessible when:
* The router is connected to the control plane
* The router's key has not expired
* Access control rules permit the user to reach the router
`via` routing is policy-aware: a router must be eligible for the user and traffic in question, and tailnet policy can limit which routers may be used.
If policy prevents a user from using a router, that router won't be a usable `via` candidate for that user.
## [Interaction between routes and grants](#interaction-between-routes-and-grants)
Consider this example grant:
```
`{
"grants": [
{
"src": ["group:engineering"],
"dst": ["192.168.0.0/16"],
"ip": ["\*"]
}
]
}
`
```
This grant permits `group:engineering` to send traffic to `192.168.0.0/16`. However, the grant does not inject any routes. For traffic to actually reach `192.168.0.0/16`:
1. A subnet router must advertise a route covering that range
2. The route must be approved
3. Each client must accept routes
If a subnet router advertises `192.168.1.0/24`, clients receive that specific route. Traffic to `192.168.1.50` works (route exists, ACL permits). Traffic to `192.168.2.50` fails because no route covers it, even though the grant would permit the traffic.
Conversely, if a subnet router advertises `10.0.0.0/8` but no grant covers it, clients receive the route but traffic is dropped by the packet filter.
## [Troubleshooting](#troubleshooting)
### [Routes not appearing on client](#routes-not-appearing-on-client)
If expected routes don't appear on a client:
1. Verify the subnet router is advertising the routes in the admin console or with `tailscale status --json` on the router.
2. Confirm the routes are approved in the admin console.
3. On Linux, verify route acceptance is enabled. Run `tailscale debug prefs` and check if `RouteAll` is `true`. If `false`, run `tailscale set --accept-routes`.
4. Check if a more specific local route takes precedence using your OS routing table commands (`ip route` on Linux, `netstat -rn` on macOS).
### [Traffic blocked despite route existing](#traffic-blocked-despite-route-existing)
If routes exist but traffic is blocked:
1. Verify an ACL or grant permits the traffic. Run `tailscale debug netmap` and examine the `PacketFilter` section to check effective rules.
2. Confirm the destination is reachable from the subnet router itself.
3. Check if firewalls on the subnet router or destination are blocking traffic.
### [Failover not working](#failover-not-working)
If failover between subnet routers isn't working:
1. Verify both routers advertise exactly the same routes (same CIDR prefixes).
2. Confirm both routes are approved in the admin console.
3. Check that both routers are connected and have valid keys.
On this page
* [Route injection and access controls](#route-injection-and-access-controls)
* [When routes are injected](#when-routes-are-injected)
* [How routes and ACLs interact with CIDR ranges](#how-routes-and-acls-interact-with-cidr-ranges)
* [Route prefix matching for failover](#route-prefix-matching-for-failover)
* [Choosing a router (when multiple routers advertise the same route)](#choosing-a-router-when-multiple-routers-advertise-the-same-route)
* [Accessible routers for via routing](#accessible-routers-for-via-routing)
* [Interaction between routes and grants](#interaction-between-routes-and-grants)
* [Troubleshooting](#troubleshooting)
* [Routes not appearing on client](#routes-not-appearing-on-client)
* [Traffic blocked despite route existing](#traffic-blocked-despite-route-existing)
* [Failover not working](#failover-not-working)
Scroll to top