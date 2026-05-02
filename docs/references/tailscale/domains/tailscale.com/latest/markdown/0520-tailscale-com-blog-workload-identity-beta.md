Workload identity federation: better infra and CI/CD auth with Tailscale
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|productOctober 30, 2025
# Better authentication with workload identity federation
Today we’re excited to announce [**workload identity federation**](<https://tailscale.com/kb/1581/workload-identity-federation?utm_source=blog&amp;utm_medium=content&amp;utm_campaign=fall-update-2025 >), a better way for your infrastructure and CI/CD systems to securely authenticate to Tailscale without managing long-lived API keys, auth keys, or OAuth clients.
Tailscale already makes it easy for users and devices to connect securely. Infrastructure, though, has its own authentication problem. CI pipelines, runners, and workloads need access to your tailnet to build, test, and deploy—and until now, the only option has been static credentials like API keys. Those keys are essentially passwords that prove to Tailscale that the machine is trusted, but they don’t scale well, and they’re difficult to manage safely.
Workload identity federation uses the identity systems already built into your cloud providers to replace those static secrets with signed, short-lived OIDC tokens your workloads can use to prove who they are.
Because this feature relies on open standards for identity, it works with any cloud provider that supports OIDC tokens—including GitHub Actions, GitLab CI/CD, Microsoft Azure, Google Cloud, Buildkite, CircleCI, and many others.
## [Secure access for your workloads](#secure-access-for-your-workloads)
Workload identity federation lets your workloads prove their identity to Tailscale using **trusted, signed tokens** issued directly by your cloud provider, instead of storing secrets in environment variables or CI configuration files.
As part of setting up workload identity federation, you tell Tailscale which tokens to trust—defining the specific cloud provider, repository, service account, or workload identities that are allowed to authenticate. When one of those workloads requests access, its provider mints a **signed identity token** that describes who it is and where it came from. Tailscale verifies that token against your configuration, checking its claims and signature before issuing a **short-lived API token** the workload can use to connect.
Because the entire exchange is built on verifiable tokens rather than stored secrets, there’s nothing to rotate or manage manually. Each token is short-lived, [granularly scoped](<http://tailscale.com/kb/1623/trust-credentials#scopes?utm_source=blog&amp;utm_medium=content&amp;utm_campaign=fall-update-2025 >), and trusted only if it matches what you’ve explicitly approved.
## [Built for automation and GitOps](#built-for-automation-and-gitops)
Workload identity federation was designed for environments where automation and security go hand in hand.
Teams are already using it to:
* **Connect CI/CD jobs** to private tailnet resources like databases, staging servers, and package registries—without injecting static auth keys or OAuth clients into their pipelines.
* **Sync Tailscale policy files** from version control through GitOps workflows, ensuring every change is auditable and automated.
* **Join ephemeral workloads** like containers, runners, and cloud VMs to a tailnet on startup, with access scoped exactly to what’s needed.
This approach makes it easy to give machines temporary, principle-of-least-privilege access to your network, while eliminating the burden of managing sensitive credentials.
## [How it works](#how-it-works)
Workload identity federation builds on open standards for cloud identity and authentication. Once you’ve configured a trusted **OIDC issuer** in the Tailscale admin console, defining which workloads are allowed to authenticate, the exchange looks like this:
1. Your workload requests an **OIDC token** from its cloud provider (like GitHub Actions or Google Cloud).
2. The token—a signed JSON Web Token (JWT)—confirms the workload’s identity.
3. Tailscale verifies the token’s signature, issuer, and claim rules against your configuration.
4. Tailscale issues a **short-lived API token** with the specific scopes and tags you’ve assigned.
5. The workload uses that API token to join your tailnet or call the Tailscale API.
All of this happens without ever handling a secret key.
## [Easier management in the admin console](#easier-management-in-the-admin-console)
Alongside this release, we’ve improved how you manage OAuth clients and federated identities in the admin console. You can now **edit scopes and credential details after creation**, making it simpler to debug or adjust configurations as your environments evolve.
These updates help reduce friction for teams adopting OIDC and federated identity workflows, whether they’re connecting a single build runner or orchestrating an entire fleet of ephemeral workloads.
## [What's next](#whats-next)
Workload identity federation is **available today in public beta**, on all Tailscale plans. You can get started right now by heading to the [**Trust credentials** page](https://login.tailscale.com/admin/settings/trust-credentials) in the admin console. Read our [workload identity federation documentation](<https://tailscale.com/kb/1581/workload-identity-federation?utm_source=blog&amp;utm_medium=content&amp;utm_campaign=fall-update-2025 >) for more details.
We can’t wait to see how you use workload identity federation to make your infrastructure simpler, safer, and more automated.
Share
Authors
Sam Linville
Mario Minardi
Contributors
Patrick O'Doherty
Sarah Wolfsont
Max Coulobme
Percy Wegmann
Authors
Sam Linville
Mario Minardi
Contributors
Patrick O'Doherty
Sarah Wolfsont
Max Coulobme
Percy Wegmann
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