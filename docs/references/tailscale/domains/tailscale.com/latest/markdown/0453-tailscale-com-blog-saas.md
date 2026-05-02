Secure your SaaS with Tailscale App connectors
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|December 12, 2023
# Secure your SaaS with Tailscale App connectors
Tailscale is a universal zero trust network access platform that lets organizations securely connect users with internal resources. You can manage connections to those resources using [access control lists](/kb/1018/acls), in order to apply the principles of least privilege to your network’s access patterns.
Today, we’re introducing the Tailscale [App connector](/kb/1281/app-connectors). App connectors allow you to securely connect third party resources like SaaS applications to your tailnet in a reliable and scalable way. Now you can safeguard access to those applications to only authorized devices and users on your private network.
## Securing SaaS
Modern businesses use a myriad of Software as a Service providers in their day-to-day operations. These SaaS services need to be carefully controlled for operational, compliance, and security reasons – only certain employees and devices should have access to the data inside these applications. Our customers need a way to connect third party SaaS applications to their tailnets and enforce the same granular access controls they impose on applications they self-host.
## App connectors with Tailscale
App connectors are a Tailscale building block that allows customers to force all egress traffic for a particular application through a gateway they control. App connectors enable our customers to limit access to a third party application to only devices and users that are authorized to access that application, without requiring end users to configure anything.
As an added benefit, changes to the tailnet’s devices and users will immediately affect access to the connected SaaS applications. A user can, for example, be removed from the tailnet and as a result no longer be able to access third party SaaS applications. Alternatively, an employee can move to another business unit and instantly gain access to necessary tooling.
Using an app connector alongside an IP firewall, your SaaS apps can be locked down to only trusted users and devices, keeping threats out.
When you configure an app connector, you specify which applications you wish to make accessible over the tailnet, and the domains for those applications. Any traffic for that application is then forced over the tailnet to a node running an app connector before egressing to the target domains.
This is especially useful for cases where the application has an allowlist of IP addresses which can connect to it: the IP addresses of the node running the app connector can be added to the allowlist, and all nodes on the tailnet will use that IP address for their traffic egress. This will prevent third-party access to your SaaS applications.
## Protocol-agnostic and always-on
Apps configured to route through an app connector can be configured in an always-on mode, routing through an available app connector from all clients on the tailnet. App connectors will be used even when an exit node is enabled on a client’s device. App connectors support almost any available protocol (including web traffic, SSH, postgres, and more).
App connectors act as a DNS proxy and traffic relay for configured Apps.
App connectors work by proxying DNS for the target domains and advertising the subnet routes for the observed DNS results. Upon each query to a configured domain, the returned routes for that domain are advertised as routes via the app connector. In a similar manner to a [subnet router](/kb/1019/subnets/), the app connector is then used to connect to any IP addresses advertised by the target domain. These requests then egress the tailnet through the appropriate app connector. An app connector could be considered an automatic subnet router that is configured by domains instead of IP addresses.
## Don’t trust us. Trust yourself.
Tailscale App connectors are hosted and maintained by our customers. That means you have full control over availability, location, performance, and more. You don’t have to proxy your requests through our “edge networks” or trust our uptime commitments – instead, build your own edge, across any cloud or on-prem providers you’d like, with a business continuity plan you control.
Cold failover allows for global high availability across multiple connectors.
Tailscale supports multiple high availability schemes for App connectors. The default cold failover mode (available on all plans) uses a single app connector to forward traffic, choosing one as a primary and all others as secondary connectors. If the primary goes down, traffic is migrated to a secondary connector within seconds, globally.
Regional routing brings performance and reliability benefits to a global workforce.
For organizations with workforces spanning the globe, Tailscale supports [Regional routing](/kb/1115/high-availability/). Regional routing automatically routes traffic to SaaS applications through the closest available app connector. If multiple connectors are available within a region, load is distributed evenly across all available connectors in that region. [Regional routing](/kb/1115/high-availability/) is available for Premium and Enterprise customers.
## Continuous verification for SaaS with device posture
At the core of zero trust architecture lies the principle of continuous verification. It recognizes that trust cannot be assumed solely based on initial authentication. Instead, continuous verification constantly evaluates user identities, device posture, and other risk factors throughout a session to ensure ongoing trustworthiness. By adopting this approach, organizations can proactively detect and mitigate potential security breaches, minimizing the risk of unauthorized access to SaaS applications.
Tailscale’s Device posture rules can be used in conjunction with app connectors to ensure access to your SaaS apps is continuously verified, all from one unified policy engine. We’ll talk more about that feature soon 😉
## Take it for a spin
App connectors are available today. To get started, head over to our [developer documentation](/kb/1281/app-connectors), and begin by using `tailscale up --advertise-connector` on a recent install to spin up an app connector.
Share
Author
Kabir Sikand
Author
Kabir Sikand
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