Tailscale Services · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Tailscale Services
Last validated: Feb 2, 2026
Services increase reliability, leverage Tailscale's access-controlled routing, and provide a centralized way to manage all internal resources available in your Tailscale network (known as a tailnet). You can focus on maintaining your applications while Tailscale handles the networking complexity.
Tailscale Services let you publish internal resources (like databases or web servers) as named services in your tailnet.
Instead of connecting to specific devices, users connect to Tailscale Services using stable [MagicDNS](/docs/features/magicdns) names while Tailscale automatically routes traffic to available hosts across your infrastructure.
This approach decouples your resources from the devices hosting them. For example, a database service remains accessible at the same address even when you migrate it to a different host, add redundant hosts for high availability, or route traffic across regions. You gain built-in traffic steering, granular access control, approval workflows, and the ability to configure different endpoint types for different layers of the networking stack.
## [Use cases](#use-cases)
You can use Tailscale Services in a variety of scenarios to securely expose internal resources within your tailnet in a way that decouples them from the devices hosting them. For example:
* **Developer workflows and internal tooling**: Make any internal application or developer resource highly available, horizontally scalable, and secure without complex load balancer configurations.
* **Database connectivity**: Connect securely to database clusters (PostgreSQL, MySQL, RDS) with simplified connection scaling and identity-based access controls.
* **Cluster meshes**: Enable cross-cluster or hybrid-cloud connectivity between any compute resources like EC2 instances, Kubernetes services, or containers.
* **Version-controlled applications**: Generate stable hostnames for frequently updated, version-controlled, or ephemeral resources that persist across deployments.
* **IoT integrations**: Stream device logs and telemetry securely to SIEM or logging services without exposing IoT devices to the public internet.
* **Internal APIs and webhooks**: Expose internal APIs securely without public domains or complex mTLS configurations while maintaining granular access control.
## [Prerequisites](#prerequisites)
To get started with Tailscale Services, you must have:
* An active tailnet.
* One or more devices running Tailscale v1.86.0 or later, or an [unstable](/docs/install/unstable) v1.87.x release.
* [Owner, Admin, or Network admin](/docs/reference/user-roles) account permissions.
* An internal resource running on a tailnet device that you want to expose as a Tailscale Service. The device hosting the resource must use a [tag-based](/docs/features/tags) identity.
## [Get started](#get-started)
To get started with Tailscale Services, you need to define a Service through the admin console, configure an endpoint on a tailnet device (the host), then advertise the endpoint.
### [Step 1: Define a Tailscale Service](#step-1-define-a-tailscale-service)
You define a Tailscale Service using the admin console. Each Tailscale Service consists of a MagicDNS name, a TailVIP (Tailscale Virtual IP address), a resource definition, and one or more back-end hosts.
1. Open the [Services](https://login.tailscale.com/admin/services) page of the admin console.
2. Select **Advertise**, and then select **Define a Service**.
3. Within the **Define a Service** dialog, provide a name and description for your Service.
4. Choose a port or set of endpoints your Service will advertise, including the `tcp:` transport protocol prefix (for example, `tcp:443`). Currently, TCP is the only supported transport protocol. Alternatively, enter `do-not-validate` to skip endpoint validation.
5. (Optional) Provide the Service with an identity by adding one or more [tags](/docs/features/tags).
6. Select **Add service**.
You have now defined the Service interface. Next, you need to configure a tailnet device as a Service host.
### [Step 2: Configure a Service host](#step-2-configure-a-service-host)
A Service host is a Tailscale device that runs the Tailscale client and advertises one or more endpoints for a specific Tailscale Service. The host handles incoming connections to the Service and routes them to the appropriate resource. Hosts can advertise both local and remote resources.
Any device you want to use as a Service host must use a [tag-based identity](/docs/features/tags). You cannot use a device authenticated with a user account as a Service host.
Make sure to start the resource on a tailnet device that you want to expose as a Tailscale Service. This resource can be a web server, database, or any other service that you want to make available through Tailscale.
For example, you might start a basic web server using Node.js and the [`http-server` package](https://www.npmjs.com/package/http-server) that listens on port `8080`:
```
`# Install globally
npm install -g http-server
# Then start a basic web server
http-server -p 8080
`
```
This example starts a basic web server that serves static files from the current directory on port `8080`.
After you have your resource running and listening for connections, you can configure it as a Service host.
You can configure a Service host using either the `tailscale serve` CLI command or using a [Service configuration file](/docs/reference/tailscale-services-configuration-file).
Tailscale recommends using the CLI method because it automatically handles both configuration and advertisement, while the configuration file method gives you control over these as separate steps.
1. Run the `tailscale serve` command with the `--service` flag followed by the service name, the protocol, the port number, and the destination:
```
`tailscale serve --service=svc:web-server --https=443 127.0.0.1:8080
`
```
The command returns output similar to the following:
```
`This machine is configured as a service host for `svc:web-server`, but approval from an admin is required. Once approved, it will be available in your Tailnet as:
http://web-server.\<tailnet-name\>.ts.net:443/
|-- proxy http://127.0.0.1:8080
`
```
When you configure and advertise an endpoint using the `tailscale serve` CLI command, it automatically uses background mode (which you would normally need to use the `--bg` flag for when using the `tailscale serve` command).
This command configures and automatically advertises an endpoint for the resource. When you use the `tailscale serve` command with the HTTPS protocol, Tailscale automatically provisions a TLS certificate for your unique tailnet DNS name.
2. Run the `tailscale serve status` command to verify your configuration:
```
`tailscale serve status --json
`
```
To use [regional routing](/docs/how-to/set-up-high-availability#regional-routing)'s in-region load balancing with Tailscale Services, you will need to enable it on your tailnet.
### [Step 3: Approve a Service host](#step-3-approve-a-service-host)
If your tailnet has [auto-approval](/docs/reference/syntax/policy-file#autoapprovers) policies set up for the Service, the host is automatically approved. If not, an [Admin, Network admin, or Owner](/docs/reference/user-roles) must approve the host before it becomes active.
1. Open the [Services](https://login.tailscale.com/admin/services) page of the admin console.
2. Select the name of the Service you created earlier.
3. Locate the pending advertisements in the **Service hosts** section.
4. Select **Approve**.
After approval, the host becomes active and starts handling traffic for the Tailscale Service. Users in the tailnet can now connect to the Service using its MagicDNS name or IP addresses (provided they have the necessary access permissions).
### [Step 4: Access Tailscale Services from other devices](#step-4-access-tailscale-services-from-other-devices)
After you configure and approve a Tailscale Service, you need to ensure that other devices in your tailnet can discover and use the routes to the advertised resources.
Tailscale clients version 1.94 and later no longer require enabling `accept-routes` to use Tailscale Services. This lets all clients leverage Tailscale Services by default while simultaneously not enabling `accept-routes` which can lead to route clashes.
Linux devices running Tailscale version 1.93 or earlier don't discover new routes to Tailscale Services by default. You must explicitly enable accepting routes using the `--accept-routes` flag with the [`tailscale set`](/docs/reference/tailscale-cli#set) command:
```
`sudo tailscale set --accept-routes
`
```
## [Common scenarios](#common-scenarios)
This section covers common scenarios for managing Tailscale Service hosts, including draining a host, removing a host configuration, and updating a Service host configuration.
### [Drain a host](#drain-a-host)
When you need to take a Service host offline, you should first drain the host. Draining a host stops it from accepting new incoming connections while letting existing connections to close gracefully.
Use the `tailscale serve drain` command to stop the host from advertising itself for a service (`svc:\<service-name\>`):
```
`tailscale serve drain svc:\<service-name\>
`
```
After you run the `tailscale serve drain` command, all associated endpoints on the host stop accepting new incoming connections. However, any ongoing connections remain alive until they close normally.
After all connections close gracefully, you can safely remove all relevant endpoint configurations.
### [Remove a host configuration](#remove-a-host-configuration)
Do not remove an endpoint configuration before draining it. Doing so abruptly ends all connections to the advertised resource.
After draining the endpoint for a resource, you can remove its configuration using one of three ways: remove a specific endpoint (for a single `protocol:port` endpoint mapping), remove the entire host configuration, or reset the configuration file. The best method depends on how much of the configuration file you want to preserve.
You can check your Service configuration file at any point using the `tailscale serve status` command.
```
`tailscale serve status -json
`
```
#### [Remove an endpoint](#remove-an-endpoint)
If you configured multiple endpoints for a single resource using different port numbers or protocols, you can use the `off` argument to remove only a specific endpoint mapping. To remove a specific endpoint mapping for a resource for a specific port number, re-run the original `tailscale serve` command (that you used to configure the endpoint) with the `off` argument. You must run the command with the same values and flags as you did to set up the endpoint.
```
`tailscale serve --service:"svc:\<service-name\>" --https:\<port\> \<additional-flags\> off
`
```
Adding the `off` argument at the end of the command you used to advertise the endpoint with the same flag removes the endpoint configured for a port. For example, have an endpoint for `web-server` on HTTPS port `443` and an endpoint for `web-server` on HTTP ports `80` and `3000` and you need to remove the endpoint for HTTPS port `443`:
1. Run this command to disable its configuration for only HTTPS port `443`:
```
`tailscale serve --service="svc:web-server" --https=443 off
`
```
2. Then, re-advertise with only HTTP port `80`:
```
`tailscale serve advertise svc:web-server
`
```
Here's a more complete example of removing an endpoint:
```
`# Run tailscale up \<...\>
# Set up a few L7 endpoints:
tailscale serve --service="svc:web-server" --https=443 8080
tailscale serve --service="svc:web-server" --https=443 --set-path /mt2 8081
tailscale serve --service="svc:web-server" --http=80 3000
# When you want to modify config, drain it first.
tailscale serve drain svc:web-server
# Wait until all connections close.
# To only remove the endpoint configuration for the /mt2 path on port 443:
tailscale serve --service="svc:web-server" --https=443 --set-path /mt2 off
# Then, advertise it again and it will only create one endpoint on HTTPS port 443
tailscale serve advertise svc:web-server
# To remove the endpoint configuration for for HTTPS port 443:
tailscale serve --service:"svc:web-server" --https=443 off
# You will see a prompt asking you to confirm
# After you confirm, it removes all configured endpoints on port 443 but preserves other port configured for the same service resource.
# Advertise the service again without the removed HTTPS port:
tailscale serve advertise svc:web-server
`
```
#### [Remove all endpoint mappings for a Service](#remove-all-endpoint-mappings-for-a-service)
To remove the configuration for a specific Service (which can have one or more endpoints), use the `tailscale serve clear` command.
```
`tailscale serve clear svc:\<service-name\>
`
```
This removes all endpoint configurations for the Service from service configuration file.
Here's a more complete example of removing all endpoint configurations for a resource:
```
`# Run tailscale up \<...\>
# Set up a few L7 endpoints:
tailscale serve --service="svc:web-server" --https=443 8080
tailscale serve --service="svc:web-server" --https=443 --set-path /mt2 8081
tailscale serve --service="svc:web-server" --http=80 3000
# When you want to modify config, drain it first:
tailscale serve drain svc:web-server
# Wait until all connections close.
# Remove the configuration for svc:web-server:
tailscale serve clear svc:web-server
`
```
#### [Remove all Service configurations](#remove-all-service-configurations)
To reset the entire configuration file (removing all configured Service configurations), use the `tailscale serve reset` command.
```
`tailscale serve reset
`
```
This removes all configured endpoints from the Services configuration file.
### [Update a Service host configuration](#update-a-service-host-configuration)
You can update or modify a host's Service configuration using the `tailscale serve` command or by editing the Service configuration file directly. You should drain the host before modification.
To update an endpoint configuration for a given protocol, port, and path, run `tailscale serve` with the same flags. For example, to start an endpoint configured with HTTPS on port `443`:
1. Run the following command to start an endpoint configured with HTTPS on port `443`:
```
`tailscale serve --service="svc:web-server" --https=443 https://localhost:443
`
```
2. Then, check the configuration with `tailscale serve get-config --all`:
```
`{
"version": "0.0.1",
"services": {
"svc:web-server": {
"endpoints": {
"tcp:443": "https://localhost:443"
}
}
}
}
`
```
To update the endpoint default path point to local port `8081`:
3. Run the following command:
```
`tailscale serve --service="svc:web-server" --https=443 https://localhost:8081
`
```
4. Then, check the configuration with `tailscale serve get-config --all`:
```
`{
"version": "0.0.1",
"services": {
"svc:web-server": {
"endpoints": {
"tcp:443": "https://localhost:8081"
}
}
}
}
`
```
To run a different protocol on a port for a local resource, you need to remove the existing endpoint configuration on the port, then add the configuration again. For example, let's say you have an endpoint configured for `my-web-app` with HTTPS on port `443` pointed to a text example, but you need to update it to use HTTP instead of HTTPS:
1. Remove the endpoint configuration for port `443` by running the following command:
```
`tailscale serve --service="svc:my-web-app" --https=443 off
`
```
2. Then, re-run the `tailscale serve` command to set up the endpoint with HTTP:
```
`tailscale serve --service="svc:my-web-app" --http=443 http://localhost:8081
`
```
The command returns output similar to the following:
```
`Available within your tailnet:
http://web-server.king-grouse.ts.net:443/
|-- text "example"
`
```
### [Configure a Service host using a configuration file](#configure-a-service-host-using-a-configuration-file)
To configure a Service host using the [Service configuration syntax](/docs/reference/tailscale-services-configuration-file), you need to create a configuration file (such as `serveconfig.json`) that contains the configuration for the Service host. Note that when you use the configuration file method, you must configure each endpoint mapping, then advertise it as two separate steps.
1. Create a file named `serveconfig.json` that contains a [`tailscale serve`](/docs/reference/tailscale-cli/serve) configuration. This example configures an endpoint for a local web server exposed on port `443` over HTTPS:
```
`{
"version": "0.0.1",
"services": {
"svc:web-server": {
"endpoints": {
"tcp:443": "https://localhost:443"
}
}
}
}
`
```
2. Use the `tailscale serve set-config` command to apply the configuration file:
```
`tailscale serve set-config --all serveconfig.json
`
```
3. Run the `tailscale serve status` command to verify your configuration:
```
`tailscale serve get-config --all
`
```
4. Advertise the endpoint:
```
`tailscale serve advertise svc:\<service-name\>
`
```
Your service host is now handling traffic for your Tailscale Service. You can validate this by running `tailscale status --json | jq '.Self.CapMap."service-host"'` to check the service-host status.
### [Set up automatic approval](#set-up-automatic-approval)
Tailscale clients can advertise new Service hosts, but administrators must approve or deny new advertisements (similar to [subnet route approval](/docs/features/subnet-routers#enable-subnet-routes-from-the-admin-console)). You can set auto-approval policies to enable certain clients, users, or tags to automatically advertise and approve new hosts for a specific Service or group of Services.
1. Go to the [Access controls](https://login.tailscale.com/admin/acls) page of the admin console.
2. Create an auto-approval policy to approve new hosts for an individual Tailscale Service or groups of Tailscale Services (defined by a [tag](/docs/features/tags)). The following shows an example:
```
`"autoApprovers": {
"services": {
"svc:\<service-name\>": ["tag:server"],
"tag:prod-service": ["tag:prod-infra"]
},
},
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
The example creates an auto-approval rule for Tailscale clients tagged with the `tag:server` to advertise new Service Proxies, for the Tailscale Service `svc:\<service-name\>`. Additionally, it specifies that Tailscale clients with the tag `tag:prod-infra` can advertise new Service Proxies, and automatically receive approval, for Tailscale Services with the tag `tag:prod-service`.
### [Validate your Service](#validate-your-service)
You can validate that your Service successfully advertised locally, and that it passed validation. To do this, run the following [`tailscale status`](/docs/reference/tailscale-cli#status) command and pass its output to the [`jq`](https://jqlang.org/) command-line JSON processor:
```
`tailscale status --json | jq '.Self.CapMap."service-host"'
`
```
The `jq` output should show the `service-host` status.
#### [Configure Service access](#configure-service-access)
You can use a Tailscale Service as a destination in [grant](/docs/features/access-control/grants) access control policies.
1. Go to the [Access controls](https://login.tailscale.com/admin/acls) page of the admin console.
2. Create a grant rule that grants access to your Service. For example, this grant uses `svc:web-server` a destination, on port `443`, with access granted to `"autogroup:member`.
```
`{
"src": ["autogroup:member"],
"dst": ["svc:web-server"],
"ip": ["443"],
},
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
You can also reference groups of Tailscale Services using a tag you've assigned to each Service. This example grants access to a group of production Services with access to the Service `svc:database`.
```
`{
"src": ["tag:prod-service"],
"dst": ["svc:database"],
"ip": ["5432"],
},
`
```
### [Use access control tests](#use-access-control-tests)
Tailscale Services are valid `accept` or `deny` destinations in [access control tests](/docs/reference/syntax/policy-file#tests).
### [Check availability](#check-availability)
To check the availability of your Service, you can use the [Services](https://login.tailscale.com/admin/services) page of the admin console.
1. Open the [Services](https://login.tailscale.com/admin/services) page of the Tailscale admin console.
2. Within the **Advertised** section, you should find your Tailscale Service listed with configured endpoints.
## [Reference](#reference)
This section provides reference information about Tailscale Services, including endpoint types and service states.
### [Endpoint types](#endpoint-types)
Tailscale supports three types of endpoints, each operating at different layers of the networking stack. While the OSI model isn't a perfect representation of modern networking, it provides a useful framework for understanding these distinctions. There are three different types of endpoints: layer 7 (application), layer 4 (transport), and layer 3 (network). This section explains each type, when to use them, and notes about their specific capabilities
#### [Layer 7 endpoints (application layer)](#layer-7-endpoints-application-layer)
Layer 7 (application) endpoints provide the most sophisticated forwarding mechanism by understanding and manipulating application layer protocols. It can inspect, modify, and route traffic based on application-specific content. These types of endpoints work well when you need Tailscale to inject authentication headers in the packets or path-based routing. For example, `/api/\*` requests might go to one server while `/static/\*` goes to another.
You can create a layer 7 endpoint by setting the protocol value to `http` or `https` when using `tailscale serve`.
* The port number is the port to expose the endpoint on.
* You can use the optional `--set-path` flag to use a custom file path. By default, it uses `/`.
* The destination can be text, a file path, or a local address. Refer to [Tailscale Serve examples](/docs/reference/examples/serve) for more examples.
#### [Layer 4 endpoints (transport layer)](#layer-4-endpoints-transport-layer)
Layer 4 (transport) endpoints operate at the transport (TCP) layer of the [OSI model](/docs/concepts/tailscale-osi). They act as TCP forwarders that don't modify packet data, but might not preserve packet boundaries and metadata. These types of endpoints work well for standard TCP services like web servers and databases. They have less overhead than layer 7 endpoints because they don't parse application layer protocols.
You can create a layer 4 endpoint by setting the protocol value to `tcp` or `tls-terminated-tcp` when using `tailscale serve`.
* The port number is the port to expose a TCP forwarder on. The TCP forwarder forwards raw TLS-terminated brackets.
* You cannot use the `--set-path` flag to use a custom file path. It must be empty or unset.
* The destination is the local address where the raw TCP packets will be forwarded to (for example, `tcp://localhost:5432`).
#### [Layer 3 endpoints (network layer)](#layer-3-endpoints-network-layer)
Layer 3 (network) endpoints are a special type of endpoint that operates at the IP packet level and forwards all traffic, unmodified, to the operating system networking stack.
You might consider using a layer 3 endpoint if the application or resource you're serving requires UDP support or you need to preserve exact packet boundaries and sizes. However, keep in mind that they have the following limitations:
* Require additional operating system configuration to handle the unmodified packets.
* Don't have any built-in application layer features like authentication headers.
* Only work on Linux.
You can create a layer 3 endpoint on a Linux device by running the `tailscale serve` command (with the service information) with the `--tun` flag.
```
`tailscale serve --service=svc:\<service-name\> --tun
`
```
Using the `--tun` flag creates a layer 3 protocol-agnostic endpoint, which offers more control over the way packets flow to the resource. This type of endpoint forwards all traffic heading to the Tailscale Service to your local device without modifying it. In this mode, you would likely be doing some of your own `iptables` configuration or something like that to take full control of the packet and make it go to your desired destination.
### [Service states](#service-states)
This section covers the states of Services in the admin console. In the Services page of the admin console, a Service can be in the following states:
* **Pending approval**: The Service has one or more hosts that have been advertised but are awaiting approval from an [Admin, Network admin, or Owner](/docs/reference/user-roles).
* **Needs configuration**: The host has been defined but has an invalid or missing configuration.
* **Connected**: At least one host is actively advertising the Service.
* **Offline**: No hosts are currently advertising the Service.
* **Pre-approved**: A device has been automatically approved based on an auto-approval policy but is not yet advertising the Service.
* **Draining**: The host is in the process of draining, meaning it is no longer accepting new connections but is still handling existing ones.
## [Limitations](#limitations)
Tailscale Services has the following limitations:
* **TCP-only protocol support**: Services currently only support TCP transport protocol, with UDP unavailable except through layer 3 endpoints on Linux that require additional operating system (OS) level configuration.
* **No outgoing connections**: Virtual IP addresses (TailVIPs) assigned to Services can only accept incoming connections, preventing any outgoing connections from being initiated.
* **No hairpinning**: Service host devices cannot access the Services they host.
* **Linux-only layer 3 endpoints**: Layer 3 endpoints that preserve packet boundaries only work on Linux and require additional tool configuration, such as `iptables`.
* **Text and file endpoints**: The Service configuration file method does not support `text:` or `file:` destinations. These are only available when using the `tailscale serve` CLI command.
* **Limitations with multiple network interfaces**: Service Hosts that have multiple network interfaces and define remote resource destinations might experience issues in specific circumstances. For example, a connection to a remote destination might fail if:
* The Service Host (1) is a Linux device, (2) is running `tailscaled` without `SO\_MARK`, (3) has multiple network interfaces, and (4) does not have the remote destination in its default route table. You can bypass this limitation by running `tailscaled` in [userspace-networking mode](/docs/reference/kernel-vs-userspace-routers#userspace-netstack-mode).
* The Service Host (1) is a macOS device using the [Mac App Store or Standalone variant](/docs/concepts/macos-variants), (2) has multiple network interfaces, and (3) does not have the remote endpoint in its default route table. In this case, you can bypass the issue by running the [open source macOS variant](/docs/concepts/macos-variants#open-source-tailscaled-variant) (which uses `tailscaled` in userspace-networking mode by default).
## [Additional information](#additional-information)
* Use the [Services endpoint](/api#tag/services) in the [Tailscale API](/docs/reference/tailscale-api) to manage Services for your tailnet.
* [List all services](/api#tag/services/get/tailnet/{tailnet}/services)
* [Get a service](/api#tag/services/get/tailnet/{tailnet}/services/{serviceName})
* [Update a service](/api#tag/services/put/tailnet/{tailnet}/services/{serviceName})
* [Delete a service](/api#tag/services/delete/tailnet/{tailnet}/services/{serviceName})
* [List devices hosting a service](/api#tag/services/get/tailnet/{tailnet}/services/{serviceName}/devices)
* [Get approval status of service on a device](/api#tag/services/get/tailnet/{tailnet}/services/{serviceName}/device/{deviceId}/approved)
* [Update approval status of service on a device](/api#tag/services/post/tailnet/{tailnet}/services/{serviceName}/device/{deviceId}/approved)
* For more information about using the [`tsnet`](/docs/features/tsnet) package and `Server.ListenService` with Go programs, refer to [`tsnet` server](/docs/reference/tsnet-server-api).
* For a complete example that uses `Server.ListenService` and `ServiceModeHTTP` with Tailscale Services, refer to [`tsnet` and Tailscale Services](/docs/features/tsnet/how-to/register-service).
On this page
* [Use cases](#use-cases)
* [Prerequisites](#prerequisites)
* [Get started](#get-started)
* [Step 1: Define a Tailscale Service](#step-1-define-a-tailscale-service)
* [Step 2: Configure a Service host](#step-2-configure-a-service-host)
* [Step 3: Approve a Service host](#step-3-approve-a-service-host)
* [Step 4: Access Tailscale Services from other devices](#step-4-access-tailscale-services-from-other-devices)
* [Common scenarios](#common-scenarios)
* [Drain a host](#drain-a-host)
* [Remove a host configuration](#remove-a-host-configuration)
* [Remove an endpoint](#remove-an-endpoint)
* [Remove all endpoint mappings for a Service](#remove-all-endpoint-mappings-for-a-service)
* [Remove all Service configurations](#remove-all-service-configurations)
* [Update a Service host configuration](#update-a-service-host-configuration)
* [Configure a Service host using a configuration file](#configure-a-service-host-using-a-configuration-file)
* [Set up automatic approval](#set-up-automatic-approval)
* [Validate your Service](#validate-your-service)
* [Configure Service access](#configure-service-access)
* [Use access control tests](#use-access-control-tests)
* [Check availability](#check-availability)
* [Reference](#reference)
* [Endpoint types](#endpoint-types)
* [Layer 7 endpoints (application layer)](#layer-7-endpoints-application-layer)
* [Layer 4 endpoints (transport layer)](#layer-4-endpoints-transport-layer)
* [Layer 3 endpoints (network layer)](#layer-3-endpoints-network-layer)
* [Service states](#service-states)
* [Limitations](#limitations)
* [Additional information](#additional-information)
Scroll to top