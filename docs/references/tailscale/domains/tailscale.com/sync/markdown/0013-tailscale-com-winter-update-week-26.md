Winter Update Week 2026
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
Winter Update Week 2026
Built for momentum
Secure connectivity makes things easier to run, easier to think through, and harder to mess up, even as environments get more dynamic.
[
See what's new
](/winter-update-week-26#features)[
Get started
](/winter-update-week-26#start)
## Missed the webinar? Watch the recording.
Solutions Engineer Jay Stapleton and Technical Staff Member Adrian Dewhurst discuss how Tailscale is evolving to better support modern development workflows, improve performance, strengthen enterprise compliance and auditability, and address the emerging challenges of securing AI systems with the releases in this Winter Update.
## Fast, centralized AI access designed for security
Identity-aware AI usage without API key sprawl.
### Aperture by Tailscale (open alpha)
Aperture provides visibility and control over AI agent usage by centralizing access and tying it to Tailscale identity. It acts as an AI gateway that eliminates the need to distribute API keys to devices and agents, leverages Tailscale identities to associate usage with users and machines, works with common coding agents and LLMs without blocking developer workflows, and centralizes usage logs for adoption insights, cost analysis, and compliance.
[
Learn more
](/blog/aperture-partners-update?utm_source=lp&amp;utm_medium=content&amp;utm_campaign=tailscale-winter-update-2026)
## High performance across real-world networks
High-throughput connectivity for constrained environments with improved logging and device posture enforcement.
### Tailscale Peer Relays (GA)
Tailscale Peer Relays now delivers significant throughput and reliability improvements at scale through customer-deployed, managed relays. Peer Relays ensures strong performance even in restrictive environments with smarter relay selection, support for static endpoints behind firewalls and load balancers, and the ability to replace traditional subnet routers while preserving Tailscale features.
[
Learn more
](/blog/peer-relays-ga?utm_source=lp&amp;utm_medium=content&amp;utm_campaign=tailscale-winter-update-2026)
### GCS log streaming
We’ve extended log streaming support to Google Cloud Storage (GCS) so you can stream network flow and audit logs to a customer-owned GCS bucket. GCS log streaming enables end-to-end encryption while maintaining visibility and allows you to apply existing GCP IAM controls, retention policies, and downstream workflows.
[
Learn more
](/blog/gcs-log-streaming?utm_source=lp&amp;utm_medium=content&amp;utm_campaign=tailscale-winter-update-2026)
### Fleet device posture integration
The new Fleet device posture integration connects device management and access enforcement. Fleet enrollment and policy state can be used in access rules to ensure only actively managed devices are granted access. When a device falls out of management or no longer meets defined conditions, enforcement reflects that change automatically.
[
Learn more
](/blog/fleet-device-posture-integration?utm_source=lp&amp;utm_medium=content&amp;utm_campaign=tailscale-winter-update-2026)
### Huntress device posture integration
Our Huntress device posture integration incorporates endpoint protection status into access enforcement. Antivirus and firewall state can be used in access rules to require baseline protections before devices reach critical systems. As protection status changes, enforcement stays aligned without manual updates.
[
Learn more
](/blog/huntress-device-posture-integration?utm_source=lp&amp;utm_medium=content&amp;utm_campaign=tailscale-winter-update-2026)
## Service connectivity with greater control
Application-aware service connectivity across environments, secured with keyless workload identity.
### Tailscale Services (GA)
Tailscale Services now integrates with tsnet applications to automatically register, route, and drain traffic based on application lifecycle events, simplifying service connectivity. It also provides service proxies for remote destinations, such as managed databases, third-party APIs, or services behind a subnet router. Declarative JSON configuration enables GitOps-style workflows, while per-service audit and flow logs and built-in access control testing provide strong observability and policy validation before deployment.
[
Learn more
](/blog/services-ga?utm_source=lp&amp;utm_medium=content&amp;utm_campaign=tailscale-winter-update-2026)
### Kubernetes egress proxy for Tailscale Services
The Tailscale Kubernetes Operator’s egress proxy is now aware of Tailscale Services, allowing workloads running inside Kubernetes pods to initiate outbound connections to any Service published in a tailnet. With this capability, Kubernetes applications can egress to Services regardless of where they’re running, whether on another cluster, a VM, or an external environment, using the same service-aware connectivity model.
[
Learn more
](/blog/services-ga?utm_source=lp&amp;utm_medium=content&amp;utm_campaign=tailscale-winter-update-2026)
### Workload identity federation (GA)
Federated identities can be created and managed through the Tailscale API and Terraform provider, allowing teams to define and maintain trust relationships as code and eliminating static API keys. Applications can authenticate without embedded secrets, while automatic cloud token discovery and exchange supports AWS, GCP, and GitHub environments.
[
Learn more
](/blog/workload-identity-ga?utm_source=lp&amp;utm_medium=content&amp;utm_campaign=tailscale-winter-update-2026)
## Visible and auditable privileged access
Identity-aware auditing across Kubernetes workloads, network flow logs, and SSH access in Linux.
### Kubernetes API proxy audit logging (beta)
Tailscale records individual Kubernetes API requests at the moment they are received and emits them as structured audit logs. Now in beta, this captures individual HTTP requests made to the Kubernetes API and exports audit data to cold storage, supporting long-term retention and compliance requirements. Structured logs make querying, searching, and forensic analysis easier, and you now have just one platform for connectivity, access control, and Kubernetes auditing.
[
Learn more
](https://tailscale.com/blog/auditable-infrastructure-access/?utm_source=lp&amp;utm_medium=content&amp;utm_campaign=tailscale-winter-update-2026)
### Actor identifiers in network flow logs
Enrich network flow logs with actor context, including user identity, device identity, and human-readable device names. This means that identity context is built directly into network flow logs, turning raw network data into meaningful access records and eliminating the need for separate log enrichment pipelines.
[
Learn more
](https://tailscale.com/blog/auditable-infrastructure-access/?utm_source=lp&amp;utm_medium=content&amp;utm_campaign=tailscale-winter-update-2026)
### SSH logins in Linux
Bridge the gap between identity-based access and host-level auditing without changing how teams already operate their systems with SSH logins in Linux. This works with native Linux audit systems (auditd, journald, kauditd), covers both Tailscale SSH and traditional SSH, and reduces audit ambiguity without added agents or tooling.
[
Learn more
](https://tailscale.com/blog/auditable-infrastructure-access/?utm_source=lp&amp;utm_medium=content&amp;utm_campaign=tailscale-winter-update-2026)
## Ready to dive in?
Your tailnet is about to get so much better.
### Aperture by Tailscale
Secure, identity-aware AI usage without API key sprawl.
[
Get started
](/docs/features/aperture?utm_source=lp&amp;utm_medium=content&amp;utm_campaign=tailscale-winter-update-2026)
### Tailscale Peer Relays
High-throughput connectivity for networks even in constrained environments.
[
Get started
](/docs/features/peer-relay?utm_source=lp&amp;utm_medium=content&amp;utm_campaign=tailscale-winter-update-2026)
### GCS log streaming
Export Tailscale audit and network flow logs to Google Cloud Storage.
[
Get started
](/docs/features/logging/log-streaming?utm_source=lp&amp;utm_medium=content&amp;utm_campaign=tailscale-winter-update-2026)
### Fleet device posture integration
Enforce tailnet access using Fleet signals.
[
Get started
](/docs/integrations/fleet?utm_source=lp&amp;utm_medium=content&amp;utm_campaign=tailscale-winter-update-2026)
### Huntress device posture integration
Enforce tailnet access using Huntress signals.
[
Get started
](/docs/integrations/huntress?utm_source=lp&amp;utm_medium=content&amp;utm_campaign=tailscale-winter-update-2026)
### Tailscale Services
Scalable, secure, and app-aware service connectivity.
[
Get started
](/docs/features/tailscale-services?utm_source=lp&amp;utm_medium=content&amp;utm_campaign=tailscale-winter-update-2026)
### Kubernetes egress proxy for Tailscale Services
Service-aware connectivity from inside Kubernetes.
[
Get started
](/docs/features/kubernetes-operator/how-to/cluster-egress?utm_source=lp&amp;utm_medium=content&amp;utm_campaign=tailscale-winter-update-2026)
### Workload identity federation
Keyless authentication for infrastructure workloads.
[
Get started
](/docs/features/workload-identity-federation?utm_source=lp&amp;utm_medium=content&amp;utm_campaign=tailscale-winter-update-2026)
### Kubernetes API Proxy Audit Logging (beta)
Clear, queryable records of Kubernetes access.
[
Get started
](/docs/features/kubernetes-operator/how-to/session-recording#kubernetes-api-request-events/?utm_source=lp&amp;utm_medium=content&amp;utm_campaign=tailscale-winter-update-2026)
### Actor Identifiers in Network Flow Logs
Human-readable network flow logs.
[
Get started
](/docs/features/logging/network-flow-logs?utm_source=lp&amp;utm_medium=content&amp;utm_campaign=tailscale-winter-update-2026)
### SSH Logins in Linux
Add Tailscale identity context to SSH logs across Linux systems.
[
Get started
](https://tailscale.com/blog/auditable-infrastructure-access/?utm_source=lp&amp;utm_medium=content&amp;utm_campaign=tailscale-winter-update-2026)
If that wasn't enough...
Hungry for more Winter Update?
[
Watch on YouTube
](https://www.youtube.com/@Tailscale)[
Catch up on the blog
](/blog?utm_source=lp&amp;utm_medium=content&amp;utm_campaign=tailscale-winter-update-2026)
## Try Tailscale for free
[
Get started
](https://login.tailscale.com/start)
Schedule a demo
[
Contact sales
](/contact/sales)