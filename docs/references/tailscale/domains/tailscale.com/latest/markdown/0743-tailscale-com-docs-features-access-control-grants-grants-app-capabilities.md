Application capabilities · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Application capabilities
Last validated: Dec 1, 2025
Application capabilities, commonly referred to as "app capabilities", extend Tailscale's access control system beyond traditional network traffic rules. While standard grants control which devices can communicate with each other over specific ports and protocols, app capabilities provide fine-grained permissions for specific features and functionality operating at higher application layers. This enables precise control over what actions devices can perform, rather than just which network connections they can establish.
App capabilities go within the grants section of a [tailnet policy file](/docs/features/tailnet-policy-file) using the `app` field. Each capability represents a specific permission or feature that you can enable between devices in your [tailnet](/docs/concepts/tailnet). This document explains how app capabilities work, their requirements and limitations, and provides details on all built-in Tailscale capabilities with practical examples.
## [How app capabilities work](#how-app-capabilities-work)
This section explains the core mechanisms behind app capabilities, including formatting and processing.
You define app capabilities within the `app` map of a grant rule. The grant itself defines which source devices (`src`) can access which destination devices (`dst`), and the app map defines the specific capabilities to grant for that connection. Each capability follows a domain name convention, typically in the format `domain.com/cap/feature`. The value associated with each capability is an array of JSON objects, each containing capability-specific configuration options.
Basic structure within a grant:
```
`"grants": [
{
"src": ["user@example.com", "group:engineering"],
"dst": ["tag:server"],
"app": {
"capability.name/string": [
{ /\* Configuration object 1 \*/ },
{ /\* Configuration object 2 \*/ }
],
}
}
]
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
To leverage granted capabilities in applications running on the destination, capabilities for a source device can be read from the `tailscale whois` command on the CLI, from [LocalAPI](https://pkg.go.dev/tailscale.com/ipn/localapi), the `tailscale serve` [application capabilities header](/docs/features/tailscale-serve#app-capabilities-header), or with the [`tsnet` Go library](/docs/features/tsnet) for embedding Tailscale in a Go application.
## [Requirements and limitations](#requirements-and-limitations)
App capabilities in Tailscale grants must conform to several technical requirements and are subject to specific limitations. This section outlines the validation rules, source and destination restrictions, and naming requirements that apply to app capabilities in your tailnet policy.
* Every grant rule must specify either `ip` or `app` fields (or both). At least one of these fields must exist.
* Capability names must not be empty.
Certain restrictions apply to which sources and destinations you can use with app capabilities.
* When using `autogroup:self` as a destination, the source must be an individual user, group, or role-based autogroup (such as `autogroup:member`, `autogroup:admin`, `autogroup:owner`, and so on) to ensure proper permission mapping.
* Destination restrictions prevent using `autogroup:shared` or `autogroup:danger-all` as destinations for capabilities.
* App grants cannot target `autogroup:internet` destinations, nor can they use administrative autogroups such as `autogroup:admin` as destinations.
Capability names must follow a specific format to ensure proper organization and prevent conflicts.
* The format must follow the `{domain}/{path}` pattern, such as `example.com/cap/custom-app`.
* Capabilities under `tailscale.com` and `tailscale.io` domains are reserved for Tailscale's use when developing application capabilities that you can use with the product.
* When creating custom capabilities for your own applications, you should use a domain you control to avoid potential conflicts with built-in capabilities or third-party integrations.
## [Built-in Tailscale capabilities](#built-in-tailscale-capabilities)
Tailscale provides a range of built-in capabilities that enable specific features and functions in Tailscale products or [Community Projects](/community/community-projects). This section documents all the standard capabilities that are provided by Tailscale, explaining their purpose, configuration options, and providing practical examples of their use in policy files.
### [Taildrive](#taildrive)
[Taildrive](/docs/features/taildrive) extends Tailscale's file sharing capabilities by allowing devices to share and access entire directories with other devices. Its' capability (`tailscale.com/cap/drive`, `tailscale.com/cap/drive-sharer`) is used to precisely control who can read and write in shared directories.
The `shares` parameter accepts an array of share names or `"\*"` to represent all shares. The `access` parameter determines whether the access is read-only (`"ro"`) or read-write (`"rw"`). The `drive-sharer` capability is automatically added to the source device, simplifying policy management. Administrators can specify different access levels for different shares, and using `"\*"` grants access to all shares on the target device.
```
`"grants": [
{
"src": ["group:developers"],
"dst": ["fileserver"],
"app": {
"tailscale.com/cap/drive": [
{"shares": ["projects", "documentation"], "access": "rw"},
{"shares": ["archives"], "access": "ro"}
]
}
}
]
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
### [Tailscale Kubernetes operator](#tailscale-kubernetes-operator)
Tailscale's [Kubernetes capability](/docs/kubernetes) (`tailscale.com/cap/kubernetes`) provides secure access to Kubernetes clusters through granular permission controls and optional session recording. The operator streamlines cluster management while maintaining strong security through your tailnet policy. The app capability lets you define precisely who can access which clusters and with what permissions, while optionally enforcing session recording for audit and compliance purposes.
Configuration options for the Kubernetes capability include
* `recorders`: an array of tags specifying devices to record sessions.
* `enforceRecorder`: a boolean that determines whether connections fail when recorders are unavailable.
* `impersonate`: an object defining Kubernetes impersonation configuration.
The capability has two important implementation details:
* Only one recorder tag is allowed per rule.
* The recorder tag must be defined in the policy.
```
`"grants": [
{
"src": ["group:devops"],
"dst": ["tag:k8s-cluster"],
"app": {
"tailscale.com/cap/kubernetes": [
{
"recorders": ["tag:k8s-recorder"],
"enforceRecorder": true,
"impersonate": {
"groups": ["system:masters"]
}
}
]
}
}
]
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
### [`setec`](#setec)
[`setec`](https://github.com/tailscale/setec) is an open source secrets management tool maintained by Tailscale and used in our production environments. You can use it to provide secure access to sensitive credentials across all of your tailnet users and applications.
The secrets capability (`tailscale.com/cap/secrets`) defines precisely which devices or users can perform which actions on specific secrets or secret paths. This provides a centralized and secure approach to managing sensitive information, such as API keys, credentials, and certificates, across your organization.
Configuration for the secrets capability centers on two key parameters:
* `action`: an array of permitted actions (`"get"`, `"put"`, `"info"`, `"activate"`, `"delete"`).
* `secret`: an array of secret path patterns that support wildcards (for example, `"dev/\*"`, `"prod/db/creds"`).
Path patterns support flexible wildcards, allowing you to group secrets logically and assign permissions at the appropriate level of granularity. Different groups can have different permission levels, enabling a least-privilege approach to secrets management.
```
`"grants": [
{
"src": ["group:developers"],
"dst": ["tag:app-servers"],
"app": {
"tailscale.com/cap/secrets": [
{"action": ["get", "info"], "secret": ["dev/\*"]}
]
}
},
{
"src": ["group:security"],
"dst": ["tag:app-servers"],
"app": {
"tailscale.com/cap/secrets": [
{"action": ["get", "put", "delete"], "secret": ["prod/api-keys/\*"]}
]
}
}
]
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
### [TailSQL](#tailsql)
[TailSQL](https://github.com/tailscale/tailsql) is a SQL playground you can host in your tailnet.
TailSQL expects an application capability (`tailscale.com/cap/tailsql`) that defines a `src`, in the form of an array of allowed data sources such as `"main"` or `"self"`. This determines which data stores the granted device can query, providing control over access to potentially sensitive information about your tailnet's configuration and state.
```
`"grants": [
{
"src": ["group:eng"],
"dst": ["tag:tailsql"],
"app": {
"tailscale.com/cap/tailsql": [
{"src": ["main", "self"]}
]
}
}
]
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
### [Golink](#golink)
[Golink](https://github.com/tailscale/golink) is an internal link shortening and management service within your tailnet that lets teams create memorable shortcuts to frequently accessed URLs.
The Golink application capability (`tailscale.com/cap/golink`) expects an `admin` parameter set to `true` for any users or devices that should have elevated admin privileges in the service. You do not need to specify an application capability to provide basic access to Golink to your users.
```
`"grants": [
{
"src": ["group:managers"],
"dst": ["tag:golink-server"],
"app": {
"tailscale.com/cap/golink": [{"admin": true}]
}
}
]
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
## [Custom capabilities](#custom-capabilities)
You can [create custom application capabilities](/docs/features/access-control/grants/grants-app-capabilities) for your own applications by integrating with Tailscale using [tsnet](/docs/features/tsnet), the [`tailscale whois`](/docs/reference/tailscale-cli#whois) CLI command, the `tailscale serve` [application capabilities header](/docs/features/tailscale-serve#app-capabilities-header) or [LocalAPI](https://pkg.go.dev/tailscale.com/ipn/localapi). Custom capabilities let you define permissions for your own applications that go beyond network-level access control, letting you specify exactly what actions users can perform within your apps after they have network access.
Tailscale offers four approaches for integrating app capabilities with your applications:
* [**`tsnet`**](/docs/features/tsnet) is a Go library that lets you embed Tailscale in a Go application. Your application receives a Tailscale IP address and hostname with built-in HTTPS certificate management. The entire solution deploys as a single binary, making it ideal for microservices and internal tools that benefit from dedicated network identities. It's easy to use `tsnet` to read the capabilities that are granted to devices that make requests to your application inside the tailnet.
* [**LocalAPI**](https://pkg.go.dev/tailscale.com/ipn/localapi) suits applications across any programming language. Your application can use the underlying host's Tailscale client to query application capabilities, requiring minimal architectural changes to add Tailscale functionality.
* [**`tailscale whois`**](/docs/reference/tailscale-cli#whois) provides application capability data for any device in the tailnet. It's best to use the `tailscale whois` CLI command for debugging. When writing code that understands app capabilities, querying LocalAPI is usually a better choice for receiving app capability data.
* [**`tailscale serve`**](/docs/features/tailscale-serve#app-capabilities-header) lets you share an application that runs on a device in your tailnet, such as a website, with the rest of your tailnet. When other devices connect to the application, Serve can forward their capabilities to the application in a request header.
## [Complete example with multiple capabilities](#complete-example-with-multiple-capabilities)
To demonstrate how multiple capabilities can work together in a comprehensive policy, this section provides a complete example of a tailnet policy file incorporating various capabilities for different user groups and resources.
The following example showcases a more comprehensive tailnet policy that combines multiple capabilities to create a complete access control system. This demonstrates using different capabilities together to implement sophisticated permission models tailored to specific organizational needs.
```
`{
"groups": {
"group:engineers": ["alice@example.com", "bob@example.com"],
"group:devops": ["charlie@example.com", "dave@example.com"],
"group:analysts": ["eve@example.com"]
},
"tagOwners": {
"tag:server": ["group:devops"],
"tag:k8s-cluster": ["group:devops"],
"tag:k8s-recorder": ["group:devops"],
"tag:grafana": ["group:devops"]
},
"grants": [
// Engineers can share files among themselves
{
"src": ["group:engineers"],
"dst": ["group:engineers"],
"app": {
"tailscale.com/cap/drive": [{"shares": ["\*"], "access": "rw"}]
}
},
// DevOps can access Kubernetes clusters with recording
{
"src": ["group:devops"],
"dst": ["tag:k8s-cluster"],
"app": {
"tailscale.com/cap/kubernetes": [
{
"recorders": ["tag:k8s-recorder"],
"enforceRecorder": true,
"impersonate": {
"groups": ["system:masters"]
}
}
]
}
},
// Engineers can access secrets in development
{
"src": ["group:engineers"],
"dst": ["tag:server"],
"app": {
"tailscale.com/cap/secrets": [
{"action": ["get", "info"], "secret": ["dev/\*"]}
]
}
},
// DevOps can manage all secrets
{
"src": ["group:devops"],
"dst": ["tag:server"],
"app": {
"tailscale.com/cap/secrets": [
{"action": ["get", "put", "info", "delete"], "secret": ["\*"]}
]
}
}
]
}
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
This example shows how you can assign different capabilities to different groups based on their roles and responsibilities. Engineers can share files among themselves and access development secrets. DevOps personnel have broader access, including Kubernetes cluster management with mandatory session recording and full secrets management. Analysts have limited access to Grafana dashboards in a viewer role, allowing them to access monitoring data without the ability to make changes. This layered approach to permissions demonstrates the flexibility and power of Tailscale's application capabilities.
On this page
* [How app capabilities work](#how-app-capabilities-work)
* [Requirements and limitations](#requirements-and-limitations)
* [Built-in Tailscale capabilities](#built-in-tailscale-capabilities)
* [Taildrive](#taildrive)
* [Tailscale Kubernetes operator](#tailscale-kubernetes-operator)
* [setec](#setec)
* [TailSQL](#tailsql)
* [Golink](#golink)
* [Custom capabilities](#custom-capabilities)
* [Complete example with multiple capabilities](#complete-example-with-multiple-capabilities)
Scroll to top