Workload identity federation GA: Eliminate static credentials with OIDC
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|productFebruary 19, 2026
# Workload identity federation is generally available
Today, we’re excited to announce that workload identity federation is generally available. Since launching [in beta last fall](https://tailscale.com/blog/workload-identity-beta/?utm_source=blog&amp;utm_medium=content&amp;utm_campaign=tailscale-winter-update-2026&amp;utm_content=workload_blog), we’ve expanded support across the Tailscale platform, including API and Terraform support for managing federated identities, automatic cloud token exchange, tsnet integration, and beta support for the Kubernetes operator. Together, these updates make it easier to authenticate infrastructure workloads—including CI systems, cloud services, and Kubernetes clusters—without relying on long-lived, hard-coded secrets.
If you’re new to [workload identity federation](https://tailscale.com/kb/1581/workload-identity-federation/?utm_source=blog&amp;utm_medium=content&amp;utm_campaign=tailscale-winter-update-2026&amp;utm_content=workload_blog), it allows CI/CD pipelines and cloud workloads to authenticate to Tailscale using their cloud provider’s federated OpenID Connect (OIDC) identities instead of static API keys, auth keys, or OAuth clients. Rather than relying on long-lived secrets that are difficult to manage and scale, workloads can authenticate using signed, short-lived tokens issued by the cloud provider’s identity system.
## [Secure automation at scale](#secure-automation-at-scale)
The Tailscale API now supports creating, reading, updating, and deleting federated identities. This lets you programmatically establish trust between Tailscale and cloud providers like GitHub, Google Cloud, and AWS, without manual setup in the admin console. You can define and manage trust configurations across dozens or hundreds of environments entirely through code.
Using the API, you can grant a new GitHub runner access to your tailnet, adjust scopes for an AWS service account, or update credential details as your infrastructure changes. You can also modify scopes and credentials after they’re created, making it easier to debug configurations or refine permissions without needing to delete and recreate identities.
The [Tailscale Terraform provider](https://tailscale.com/kb/1210/terraform-provider) also newly supports creating and managing federated identities, allowing you to define trust relationships as IaC (infrastructure as code). Teams can store these configurations in version control, making changes auditable, peer-reviewed, and easy to reproduce. Using Terraform, you can define OIDC issuers and claims directly in your `.tf` files. This includes specifying which GitHub repositories, cloud service accounts, or workloads can authenticate to your tailnet, along with their scopes and claim-matching rules.
The Terraform provider itself can also authenticate to Tailscale using workload identity federation. This allows a CI/CD runner, such as a GitHub Action, to use its own OIDC token to manage your tailnet, without storing static API keys or OAuth secrets.
## [Automatic cloud token discovery and exchange](#automatic-cloud-token-discovery-and-exchange)
Tailscale now supports automatic token discovery and exchange through a new `--audience` flag on the `tailscale up` command. This enables automatic generation of ID tokens for workload identity. When enabled, the Tailscale client can detect supported cloud and CI environments and retrieve a native identity token from the platform it’s running on. The client then uses this token to authenticate the node to your tailnet via workload identity federation—without requiring you to manually configure the token exchange with Tailscale.
## [tsnet support for authentication](#tsnet-support-for-authentication)
The [tsnet library](https://tailscale.com/kb/1244/tsnet) for Go now supports workload identity federation, allowing your Go applications to join your tailnet without any hardcoded credentials. Applications running in a cloud environment can request a native OIDC token from their platform and use it to authenticate to your tailnet, without ever handling a static `ts\_authkey` environment variable.
## [Support for the Tailscale Kubernetes Operator](#support-for-the-tailscale-kubernetes-operator)
Workload identity federation is also now available in beta for the [Tailscale Kubernetes operator](https://tailscale.com/kb/1236/kubernetes-operator). This allows the operator to authenticate to your tailnet using the cluster’s native workload identity, rather than a hard-coded secret. As a result, you can connect Kubernetes clusters to Tailscale without managing static credentials, reducing operational overhead and improving security.
## [Get started](#get-started)
Workload identity federation is production-ready and available today on all Tailscale plans. Whether you’re connecting a single CI runner or automating access for a fleet of cloud workloads, you can eliminate static credentials and build more secure infrastructure.
To get started, see the [workload identity federation documentation](https://tailscale.com/docs/features/workload-identity-federation/?utm_source=blog&amp;utm_medium=content&amp;utm_campaign=tailscale-winter-update-2026&amp;utm_content=workload_blog), or explore the [API reference](https://tailscale.com/docs/reference/tailscale-api/?utm_source=blog&amp;utm_medium=content&amp;utm_campaign=tailscale-winter-update-2026&amp;utm_content=workload_blog) and [Terraform provider guide](https://tailscale.com/docs/integrations/terraform-provider/?utm_source=blog&amp;utm_medium=content&amp;utm_campaign=tailscale-winter-update-2026&amp;utm_content=workload_blog) to automate your setup.
Share
Authors
Smriti Sharma
Sam Linville
Contributors
Matt Provost
Sam Linville
Walter Poupore
Sarah Wolfsont
Mario Minardi
Danni Popova
Authors
Smriti Sharma
Sam Linville
Contributors
Matt Provost
Sam Linville
Walter Poupore
Sarah Wolfsont
Mario Minardi
Danni Popova
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