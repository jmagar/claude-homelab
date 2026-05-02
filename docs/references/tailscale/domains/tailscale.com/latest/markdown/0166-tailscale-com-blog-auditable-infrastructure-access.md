Updates to Kubernetes audit logging, network flow logs, and SSH records
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|productFebruary 20, 2026
# Making infrastructure access lighter, simpler, and smarter
Modern infrastructure access has changed. Teams are cloud-native, workloads are ephemeral, and access is increasingly identity-based. But one expectation hasn’t changed: When something goes wrong, you still need clear answers. You need to know who accessed a system, what they did, when it happened, and whether you can prove it later.
Historically, answering those questions meant deploying heavyweight systems that sat alongside your connectivity layer, with separate tools for access, auditing, session recording, and long-term retention. This traditional PAM model is expensive, complex, and increasingly misaligned with how modern teams actually work.
Tailscale takes a meaningful step toward closing that gap by extending identity-aware auditing and visibility across Kubernetes, network traffic, and SSH access, using the same lightweight connectivity model teams already rely on.
## [From “Can they connect?” to “What actually happened?”](#from-can-they-connect-to-what-actually-happened)
Tailscale has always focused on “who can connect to what,” with identity, zero trust, and least-privilege networking as its foundation. The Winter Update builds on that foundation by improving what you can see and prove after access is granted. Three new capabilities work together to do this:
* Kubernetes API proxy audit logging
* Actor identifiers in network flow logs
* Identity-enriched SSH login logs on Linux
Individually, each improves visibility. Together, they create a much stronger access governance story, without introducing new infrastructure or workflows.
## [Clear, queryable records of Kubernetes access](#clear-queryable-records-of-kubernetes-access)
Tailscale’s Kubernetes API server proxy already allows teams to record `kubectl` sessions via tsrecorder. But session recordings alone make it difficult to answer more precise questions, such as who changed a specific resource, which API call triggered an outage, or what configuration specifics look like.
With [Kubernetes API Proxy Audit Logging](https://tailscale.com/docs/features/kubernetes-operator/how-to/api-server-proxy/?utm_source=blog&amp;utm_medium=content&amp;utm_campaign=tailscale-winter-update-2026) (beta), Tailscale now records individual Kubernetes API requests at the moment they are received and emits them as structured audit logs. This extends our existing PAM capabilities, such as [Tailscale SSH recordings](https://tailscale.com/docs/features/tailscale-ssh/tailscale-ssh-session-recording), by complementing session-level context with precise, request-by-request visibility into what actually happened.
This matters because audit visibility now extends beyond high-level session recordings to include the HTTP requests made directly to the Kubernetes API. The logs are structured for easier querying, searching, and forensic analysis, making it simpler to correlate specific events during an investigation. Audit data can also be exported to cold storage, supporting long-term retention and compliance requirements. And because connectivity, access control, and Kubernetes auditing are handled through the same platform, teams can reduce operational complexity instead of stitching together multiple tools.
## [Making network logs human-readable](#making-network-logs-human-readable)
Network flow logs are essential for compliance, incident response, and troubleshooting, but they’re often painful to work with. IP addresses, ports, and opaque node IDs are hard to parse and pinpoint who was actually responsible for a given connection.
With this update, Tailscale enriches network flow logs with actor context, including user identity, device identity, and human-readable device names.
As a result, network logs reflect who initiated traffic, not just where it came from. Security and compliance teams can investigate incidents and perform audits without relying on separate enrichment pipelines, while the added identity context turns raw network data into meaningful access records. This brings network-level visibility closer to how modern teams already think about access—in terms of users and devices, not IP addresses and spreadsheets.
## [Marrying system logs with Tailscale identity](#marrying-system-logs-with-tailscale-identity)
Linux already has robust auditing frameworks like `auditd`, `journald`, and `kauditd`, but they can be noisy, expensive to operate, and difficult to interpret for access governance. Tailscale now integrates directly with these native Linux auditing systems so that SSH login events across both Tailscale SSH and traditional SSH are logged with Tailscale identity context alongside local system user data.
The result is cleaner, more useful SSH access records that include both device and identity context, reducing ambiguity during audits and investigations. Because logs are emitted through the same systems teams already collect and analyze, there’s no need to deploy additional logging agents or proprietary collectors, keeping operational overhead low.
This bridges the gap between identity-based access and host-level auditing without changing how teams already operate their systems.
## [A simpler way to govern privileged access](#a-simpler-way-to-govern-privileged-access)
Taken together, these capabilities address a familiar set of challenges: auditing sensitive access across systems, tying actions back to real people and devices, retaining logs for compliance and forensic analysis, and doing all of it without deploying complex, high-friction infrastructure.
Tailscale extends identity-aware networking to include identity-aware visibility. The same model that governs connectivity now provides the context required for auditing and governance.
## [Building towards a platform](#building-towards-a-platform)
The Winter Update reflects a broader direction: treating secure connectivity, access control, and audit observability as one cohesive system rather than separate concerns. By bringing these capabilities together, Tailscale is building toward a platform that reduces operational complexity while still meeting increasingly strict governance requirements.
For teams looking to consolidate tooling without sacrificing visibility or control, this approach offers a practical alternative—one designed to fit modern infrastructure instead of fighting it.
Share
Author
Smriti Sharma
Contributors
Samuel Jinadu
Eric Weinstein
Dee Klieb
Joseph Tsai
Jim Scott
Mike Stefaniak
Fernando Serboncini
Sam Linville
Tom Proctor
Author
Smriti Sharma
Contributors
Samuel Jinadu
Eric Weinstein
Dee Klieb
Joseph Tsai
Jim Scott
Mike Stefaniak
Fernando Serboncini
Sam Linville
Tom Proctor
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