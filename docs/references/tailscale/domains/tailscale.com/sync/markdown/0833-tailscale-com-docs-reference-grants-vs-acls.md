Grants vs. ACLs · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Grants vs. ACLs
Last validated: Aug 1, 2025
Tailscale offers two methods for defining access controls in your tailnet: Access control lists ([ACLs](/docs/features/access-control/acls)) and [grants](/docs/features/access-control/grants). Both methods follow a deny-by-default principle and exist in the [tailnet policy file](/docs/features/tailnet-policy-file) using a declarative [huJSON syntax](https://en.wikipedia.org/wiki/JSON). This document compares these two methods, exploring their capabilities, limitations, and appropriate use cases.
The following table provides a concise overview of the key differences between these two access control methods, highlighting how grants offer a more modern, flexible approach to security management. This comparison serves as a framework for the more detailed explanations that follow in subsequent sections.
|Feature|ACLs|Grants|
|Access control methodology|Network layer only|Network and application layers|
|Default action|Always requires explicit "accept" `action`|Implied accept|
|Format|Separate fields for network destinations and ports|Cleaner separation of destinations and protocols|
|Application capabilities|No|Yes|
|Routing awareness|No|Yes (with the `via` field)|
|Device posture support|Yes|Yes|
Grants are *feature complete* with ACLs, which means they have all the capabilities of ACLs. The primary difference is that grants will continue to receive new features and improvements, while ACLs will not.
## [Comparison](#comparison)
The evolution from ACLs to grants represents a shift in how Tailscale approaches [access control](/docs/features/access-control). This section explores the philosophical and architectural differences between these two methods, tracing how Tailscale's access control model has matured from a traditional network-centric approach to a more sophisticated system that bridges network and application security. Understanding these conceptual differences provides important context for appreciating why grants have become the recommended approach for modern tailnet deployments.
### [ACLs](#acls)
ACLs have been a foundation of Tailscale's access control methodology since the platform's inception. ACLs operate exclusively at the network layer, controlling which devices can communicate with each other and over which ports and protocols. The ACL system follows an explicit deny-by-default principle, requiring administrators to specifically allow each connection type.
As organizations increasingly need more nuanced access policies that extend beyond network connectivity, ACLs alone can become insufficient for modern access control requirements.
For more information, refer to the [ACL syntax reference](/docs/reference/syntax/policy-file).
### [Grants](#grants)
Grants represent an important evolution in Tailscale's access control capabilities, combining both network and application layer security into a unified, flexible [syntax](/docs/reference/syntax/grants). Grants expand the security model from only controlling which devices can talk to each other to controlling what specific [capabilities](/docs/features/access-control/grants/grants-app-capabilities) devices and users can exercise when interacting with applications and services.
This evolution stems from recognizing a common pattern: both network permissions and application permissions essentially boil down to the same conceptual model: *a source has capabilities when communicating with a destination*. Grants formalize this concept, creating a concise, powerful way to define permissions. The grants system maintains the deny-by-default security model but removes redundant elements like the mandatory action field, as each grant inherently implies an `accept` action.
Grants also introduce more advanced access control parameters, including managing access to application features and controlling how a source accesses a destination (using [`via`](/docs/features/access-control/grants/grants-via)).
For more information, refer to the [grants syntax reference](/docs/reference/syntax/grants).
## [When to use each method](#when-to-use-each-method)
This section provides guidance on which access control method is most appropriate for different scenarios, explaining why grants are typically the preferred choice for new deployments while acknowledging the specific circumstances where ACLs might still be relevant. Understanding these considerations will help you make informed decisions about your tailnet configuration while planning for future security needs.
### [Using grants (recommended)](#using-grants-recommended)
Grants are the recommended approach for all new tailnets and for updating existing deployments. You should use grants when:
* Building new tailnet policies from scratch.
* Controlling application level permissions.
* Needing cleaner, more maintainable policy files.
* Using [route filtering](/docs/features/access-control/grants/grants-via) with the `via` field.
* Implementing [device posture](/docs/features/device-posture)-based access controls.
* Creating [Kubernetes](/docs/kubernetes) impersonation rules.
* Building custom applications that integrate with Tailscale for authentication and authorization.
The grants system is actively developed and will continue to receive new features and improvements. Tailscale's internal tools and many open-source projects such as [TailSQL](https://github.com/tailscale/tailsql), the [Kubernetes Operator](/docs/features/kubernetes-operator), and [`golink`](https://github.com/tailscale/golink) already leverage grants for fine-grained access control.
### [Using ACLs](#using-acls)
Tailscale will always support ACLs as the first iteration of access control policies. You may continue to use ACLs indefinitely.
You should only use ACLs when:
* Maintaining existing deployments that heavily rely on the ACL syntax.
* Working with tools or scripts that specifically expect the ACL format.
* Needing compatibility with older integrations.
Even in these cases, Tailscale recommends gradually [migrating toward grants](/docs/reference/migrate-acls-grants), as they offer superior capabilities and a cleaner syntax. Grants and ACLs can coexist in the same policy file during transition periods, allowing for a phased migration approach.
On this page
* [Comparison](#comparison)
* [ACLs](#acls)
* [Grants](#grants)
* [When to use each method](#when-to-use-each-method)
* [Using grants (recommended)](#using-grants-recommended)
* [Using ACLs](#using-acls)
Scroll to top