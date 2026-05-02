Grants · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Grants
Last validated: May 29, 2025
Grants are Tailscale's enhanced [access control](/docs/features/access-control) system that combines [network layer](#network-capabilities) and [application layer](#application-capabilities) permissions into a unified framework. Grants let you precisely define what resources each user or device can access and which actions they can perform after connecting. They follow Tailscale's deny-by-default approach, aligned with [zero trust](/docs/concepts/zero-trust) and [least privilege](/learn/principle-of-least-privilege) principles.
Grants can do everything ACLs can, plus they facilitate application-level permissions and route filtering. Refer to [grants vs. ACLs](/docs/reference/grants-vs-acls).
Ready to get started? Check out the [get started guide](/docs/how-to/quickstart) or, if you've been using ACLs, the [migration guide](/docs/reference/migrate-acls-grants).
## [Benefits and use cases](#benefits-and-use-cases)
Grants offer significant advantages over traditional access control methods by unifying network and application permissions in a single system. This consolidated approach reduces complexity and provides a more consistent security model across your entire tailnet. With grants, you can:
* Define the hosts a device can connect to and the permissions it holds with applications running on the hosts after it connects.
* Implement fine-grained permissions based on [user roles](/docs/reference/user-roles), [device posture](/docs/features/device-posture), and other contextual factors.
* Extend access control policies by using [routing awareness with `via`](/docs/features/access-control/grants/grants-via).
Explore the collection of [example grants](/docs/reference/examples/grants) for common use cases.
## [Implementation basics](#implementation-basics)
Grants operate on a principle of explicitly defining which users or devices (sources) have access to which resources (destinations) along with what capabilities they have after connecting. Each grant consists of three core components:
* Source: The users or devices requesting access.
* Destination: The resources being accessed.
* Capabilities: The permissions granted to the source when accessing the destination. These are grouped by [network capabilities](#network-capabilities) (the `ip` field) and [application capabilities](#application-capabilities) (the `app` field).
When working with grants, you'll operate at two distinct layers: the network layer and the application layer. The network layer refers to IP addresses, ports, and protocols for connections between devices. The application layer refers to capabilities within applications themselves, such as which specific features or data sources a user can access. This dual-layer approach enables more comprehensive access control than network-only permissions.
Each grant uses the [`grant` syntax](/docs/reference/syntax/grants) with a source (`src`), a destination (`dst`), and at least one type of permissions: network permissions (`ip`) or application permissions (`app`). You can extend this basic structure with additional options including [device posture](/docs/features/device-posture) checks (`srcPosture`) and routing specifications (`via`).
## [Sources and destinations](#sources-and-destinations)
Sources (`src`) and destinations (`dst`) define who can access what in your tailnet. Both fields accept a wide range of selectors that identify users, devices, groups, or IP address ranges.
You can specify sources using selectors like:
* Specific email addresses (`name@example.com`) for individual users.
* [Groups](/docs/reference/targets-and-selectors#groups) (`group:engineering`) for user groups.
* [Tags](/docs/features/tags) (`tag:database`) for device groups.
* Roles (`autogroup:admin`) for administrative users.
Similarly, you can define destinations using the same types of [selectors](/docs/reference/targets-and-selectors), plus special selectors like `autogroup:internet` and `svc:web-server` (for [Tailscale Services](/docs/features/tailscale-services)).
Refer to the [grants syntax reference](/docs/reference/syntax/grants) for more information.
## [Network capabilities](#network-capabilities)
[Network capabilities](#network-capabilities) control basic connectivity between devices in your tailnet. These permissions define whether devices can establish connections and what protocols and ports they can use.
The `ip` field in a grant specifies network layer capabilities, allowing you to define access at the protocol and port level. You can grant access to specific ports, port ranges, or entire protocols. For example, `"ip": ["tcp:443", "udp:53"]` grants access to TCP port `443` (HTTPS) and UDP port `53` (DNS) on the destination.
Refer to the [grants syntax reference](/docs/reference/syntax/grants) for more information.
## [Application capabilities](#application-capabilities)
[Application layer capabilities](#application-capabilities) go beyond basic connectivity to define what actions you permit after a device establishes a connection. Applications running on the destination device can read these capabilities from requests made over the tailnet to authenticate and authorize the requester. These capabilities allow for fine-grained control over feature access within applications, similar to role-based access control systems.
The `app` field specifies application layer capabilities in the format `"domainName/capabilityName"`. For example, `"tailscale.com/cap/tailsql"` identifies capabilities for the [TailSQL](https://github.com/tailscale/tailsql) application. Each capability can include parameters that define specific permissions, such as which data sources the device can access or what operations to permit. This approach extends [zero trust principles](/docs/concepts/zero-trust) to the application layer, enforcing the principle of least privilege for connected applications.
Refer to the [grants syntax reference](/docs/reference/syntax/grants) for more information.
## [Limitations and considerations](#limitations-and-considerations)
While grants provide powerful access control capabilities, there are some important considerations to keep in mind:
* [Application layer capabilities](/docs/features/access-control/grants/grants-app-capabilities) are defined by the applications themselves, not by Tailscale. Each application is responsible for documenting its own capabilities and parameters, and for implementing the logic to react to application capabilities defined in grants
* The Tailscale policy engine treats application capability parameters as opaque JSON objects. It only validates that the application capability object is valid JSON and does not do any validation on the parameter content itself.
* [Device posture](/docs/features/device-posture) checks only apply to the source (`src`) of a grant, not to the destination (`dst`).
* Grants and [legacy ACLs](/docs/features/access-control/acls) can coexist in the same tailnet policy file. The recommended best practice is to favor grants for most use cases.
For more information, refer to [grants limitations and considerations](/docs/features/access-control/grants/grants-app-capabilities).
## [Next steps](#next-steps)
Not sure what to do next? Consider the following possibilities:
* Review your current access control model and identify opportunities to [migrate to more fine-grained permissions with grants](/docs/reference/migrate-acls-grants).
* Experiment with [creating a grant](/docs/reference/syntax/grants).
* Explore the collection of [example grants](/docs/reference/examples/grants).
* Refer to the [tailnet policy file documentation](/docs/features/tailnet-policy-file) to understand integrating grants with other policy components.
* Explore integrating grants with [device posture](/docs/features/device-posture) checking for context-aware access policies or adding routing awareness with [`via`](/docs/features/access-control/grants/grants-via).
* Consider implementing [GitOps workflows](/docs/gitops) for managing your tailnet policy file.
On this page
* [Benefits and use cases](#benefits-and-use-cases)
* [Implementation basics](#implementation-basics)
* [Sources and destinations](#sources-and-destinations)
* [Network capabilities](#network-capabilities)
* [Application capabilities](#application-capabilities)
* [Limitations and considerations](#limitations-and-considerations)
* [Next steps](#next-steps)
Scroll to top