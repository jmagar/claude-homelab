Tailscale Services GA: App-aware connectivity with more control
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|productFebruary 19, 2026
# Tailscale Services is now generally available
Today, we’re excited to announce that **Tailscale Services is now generally available**.
Since [launching the beta in October](https://tailscale.com/blog/services-beta/?utm_source=blog&amp;utm_medium=content&amp;utm_campaign=tailscale-winter-update-2026&amp;utm_content=services_blog), we’ve worked closely with customers to refine and expand the product based on real-world usage. That beta represented a meaningful shift in Tailscale’s connectivity model: Instead of connecting only machines and IP addresses, Tailscale Services introduced **service-aware networking**, i.e. a way to give resources stable identities, granular access controls, consistent endpoints, and an auditable registry. Tailscale Services brings customers a simpler connectivity story, without the overhead of a traditional service mesh.
If you’re new to [Tailscale Services](https://tailscale.com/docs/features/tailscale-services/?utm_source=blog&amp;utm_medium=content&amp;utm_campaign=tailscale-winter-update-2026&amp;utm_content=workload_blog), it lets you publish internal resources like databases, APIs, and web servers as named services in your tailnet, using stable [MagicDNS](https://tailscale.com/docs/features/magicdns/?utm_source=blog&amp;utm_medium=content&amp;utm_campaign=tailscale-winter-update-2026) names. Rather than connecting to individual machines, teams connect to logical services that automatically route traffic to healthy, available backends across your infrastructure. This decoupling makes migrations, scaling, and high availability far easier, without reconfiguring clients, rewriting access policies, or standing up load balancers. Our documentation has details on use cases, requirements, and implementation.
Since the beta, customers have used Tailscale Services for everything from CI/CD pipelines and internal developer tooling to production database connectivity. Today’s GA release builds on that foundation with major improvements that make Tailscale Services more powerful, more observable, and easier to operate at scale, extending Tailscale as a secure connectivity platform across environments.
## [Services are now application-aware with tsnet integration](#services-are-now-application-aware-with-tsnet-integration)
The biggest addition is native integration with [tsnet](https://tailscale.com/docs/features/tsnet/?utm_source=blog&amp;utm_medium=content&amp;utm_campaign=tailscale-winter-update-2026&amp;utm_content=services_blog), Tailscale’s Go library for embedding Tailscale directly into your applications. Each embedded app can join your tailnet as its own device, with its own Tailscale IP address, DNS name, and HTTPS certificates.
This lets you run multiple services with distinct access controls on the same machine, expose them only over Tailscale, and rely on Tailscale’s built-in identity and ACLs, without managing separate VPNs or custom network plumbing. Now your Go applications can register directly with a Tailscale Service using the new Service API within tsnet without requiring any external configuration files or CLI commands.
This makes services truly app-aware. When your application starts, it can automatically advertise its availability. When you need it to shut down gracefully, it can drain active connections and withdraw its advertisement. All of this can happen as part of the application lifecycle, without external orchestration. Because services now integrate directly with your application, they can act on real application state and identity. Traffic steering (ingress) and availability decisions happen in real time, based on what the app knows about itself, not just whether a host is reachable.
For ephemeral and containerized environments, this is a game-changer. Instead of managing separate lifecycles for applications and network configuration, both are now synchronized at the code level, eliminating configuration hassles and making dynamic environments far easier to operate.
## [Extending Tailscale Services connectivity to Kubernetes workloads](#extending-tailscale-services-connectivity-to-kubernetes-workloads)
The [Tailscale Kubernetes Operator](https://tailscale.com/docs/features/kubernetes-operator/?utm_source=blog&amp;utm_medium=content&amp;utm_campaign=tailscale-winter-update-2026)’s egress proxy is now aware of Tailscale Services, allowing workloads running inside Kubernetes pods to initiate outbound connections to any Service published in a tailnet. With this capability, Kubernetes applications can egress to services regardless of where they’re running, whether on another cluster, a VM, or an external environment, using the same service-aware connectivity model.
Previously, workloads using the Tailscale Kubernetes Operator couldn’t directly communicate with Tailscale Services, often requiring custom networking workarounds or architectural compromises. With Service-aware egress, that complexity goes away. Platform and DevOps teams can rely on a single, consistent connectivity model across Kubernetes and non-Kubernetes environments, and confidently adopt Tailscale Services knowing they’re fully supported from within the cluster.
## [Connect to services behind tailnet devices with custom DNS names](#connect-to-services-behind-tailnet-devices-with-custom-dns-names)
Tailscale Services can now point to remote destinations beyond localhost. This means you can create service proxies that connect to resources where you can't install Tailscale, like managed databases, third-party APIs, or services behind a subnet router. Dev teams no longer need to build custom DNS translation layers or maintain separate tooling to make cloud-managed services accessible with human-readable names. Everything gets a consistent MagicDNS name in your tailnet, and everything is governed by the same access control policies—whether it's a container in your VPC or a managed PostgreSQL instance.
## [Improved visibility through audit logs and network flow logs](#improved-visibility-through-audit-logs-and-network-flow-logs)
In GA release, Tailscale Services now provide stronger visibility into both configuration changes and service traffic, making them easier to observe and audit in production.
Per-service audit logs now capture every meaningful change to a service or service proxy, including approval requests and status changes, updates to metadata, IP addresses, or DNS names, and the removal or reconfiguration of proxies, along with who made each change and when. This gives admins a clear audit trail that supports governance, compliance, and faster incident investigation.
Tailscale Services also integrates directly with [network flow logs](https://tailscale.com/docs/features/logging/network-flow-logs/?utm_source=blog&amp;utm_medium=content&amp;utm_campaign=tailscale-winter-update-2026&amp;utm_content=services_blog), which now include both the service’s virtual IP and the underlying service proxy’s machine IP. This makes it easier to track and debug service traffic, verify that requests are routing through the expected proxies, and understand how services are actually being used in production.
Together, audit logs and network flow logs provide the observability teams need to confidently scale services across their tailnet.
## [Declarative configuration for GitOps-style workflows](#declarative-configuration-for-gitops-style-workflows)
Tailscale Services now supports declarative configuration through a JSON-based file stored locally on a Tailscale node. When the file changes, admins can trigger a reload via a local API endpoint or CLI command, applying updates without restarts or manual `serve` commands. The format is standard JSON (not HuJSON), so it works seamlessly with off-the-shelf JSON libraries for automation and formatting. Each Service reports its configuration version, helping teams understand exactly what’s running.
Declarative configuration supports full service and proxy definitions, including multiple proxies per Service, multiple ports, and proxy types such as HTTP, HTTPS, TLS-terminated TCP, and TUN. Proxies can forward traffic to local or remote destinations, and teams can mix declarative and CLI-managed services to adopt the model incrementally. This enables GitOps-style workflows and a more predictable, auditable way to manage services at scale.
## [Access control tests for services](#access-control-tests-for-services)
Tailscale Services is now fully supported in access control tests, just like machine and user connections. You can write tests to verify that policies behave as intended before rolling them out to production. Because access control mistakes can be costly, whether by granting overly broad access or breaking legitimate traffic, these tests provide a safe way to validate changes ahead of time, reducing the risk of misconfiguration and making it easier to strengthen your security posture.
## [No need to accept subnet routes](#no-need-to-accept-subnet-routes)
Virtual IP addresses for a service are now automatically sent to connecting clients on the tailnet, regardless of the node’s accept subnet routes setting. This means customers can use services just like they can use other Tailscale nodes, even if they don’t want to accept the tailnet’s subnet routes. This capability requires Tailscale client version 1.94.1 or later.
## [What’s next](#whats-next)
With these additions, Tailscale Services has evolved from a promising beta into a production-ready foundation for service-aware networking. Services are now application-aware, with real-time control tightly integrated into the application lifecycle, and flexible enough to represent managed, external, and legacy resources. They’re easier to operate through improved observability and declarative configuration, and safer to manage at scale thanks to policy testing and automation.
Tailscale Services is available on all plans. Every Tailscale user, including our Personal users, can create up to 10 services. In addition, as a thanks to everybody who helped us with beta testing, your Tailscale Services usage during the beta will not count against your 10 plans for at least one year. [Reach out](https://tailscale.com/contact/sales/?utm_source=blog&amp;utm_medium=content&amp;utm_campaign=tailscale-winter-update-2026&amp;utm_content=services_blog) if you need more services.
You can start using Tailscale Services today from the admin console or API. As always, we’re excited to see what you build and we’ll keep iterating based on how you use it.
Share
Authors
Smriti Sharma
Kabir Sikand
Contributors
Harry Harpham
Naman Sood
Kevin Liang
Fran Bull
Adrian Dewhurst
Brad Kouchi
Brendan Creane
Authors
Smriti Sharma
Kabir Sikand
Contributors
Harry Harpham
Naman Sood
Kevin Liang
Fran Bull
Adrian Dewhurst
Brad Kouchi
Brendan Creane
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