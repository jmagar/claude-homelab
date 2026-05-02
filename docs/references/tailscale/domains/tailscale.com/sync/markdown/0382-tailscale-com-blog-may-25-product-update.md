Tailscale Monthly Update: May 2025
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|May 19, 2025
# This Month at Tailscale: Client Fixes, GitHub Gains, and DERPs for Days
We continuously ship updates to make your network more reliable, manageable, and secure. Each month, we highlight some of the most impactful changes across clients, admin tools, integrations, and infrastructure — so you can stay on top of what’s new and what’s better.
This month’s updates include quality-of-life improvements, reliability fixes, new DERP regions, and expanded automation options. Whether you're managing fleets, building integrations, or editing ACLs, these changes aim to make your work easier. For instructions on how to update to the latest version, visit our [update guide](https://tailscale.com/kb/1067/update).
### [Improved Automation and Integrations](#improved-automation-and-integrations)
##### [**Programmatic management of OAuth clients**](#programmatic-management-of-oauth-clients)
You can now manage OAuth clients using the [Keys management API](https://tailscale.com/api#tag/keys) and [Terraform Provider](https://registry.terraform.io/providers/tailscale/tailscale). This change supports teams that prefer to automate infrastructure management with code.
##### [**Tailscale GitHub Action for macOS and Windows**](#tailscale-github-action-for-macos-and-windows)
The [Tailscale GitHub Action](https://github.com/tailscale/github-action) now works on macOS and Windows runners. Connect CI/CD pipelines using any major operating system to resources on your Tailnet with just a little YAML.
##### [**Terraform Provider v0.19.0**](#terraform-provider-v0190)
The latest version of the [Tailscale Terraform Provider](https://registry.terraform.io/providers/tailscale/tailscale/latest) adds support for configuring uploadPeriodMinutes and compressionFormat in log stream resources. This gives you more flexibility when managing logs, which can help speed up workflows — particularly useful for teams running CI across macOS and Windows.
### [Stability and Bug Fixes](#stability-and-bug-fixes)
##### [**Tailscale v1.82.4 and v1.82.5**](#tailscale-v1824-and-v1825)
We released a series of fixes to improve stability across all platforms:
* **macOS:** VPN approval messages now display correctly during installation.
* **Windows:** Fixed a service panic affecting 32-bit versions of Windows 10.
* **Android:** Resolved a crash that could occur on versions earlier than Android 13.
* **All platforms: **Fixed a panic in [userspace mode](https://tailscale.com/kb/1112/userspace-networking) related to [CUBIC congestion control](https://en.wikipedia.org/wiki/CUBIC_TCP). We also addressed a DNS issue that affected upstream resolution when using loopback IPs.
All of these fixes are included in the current stable release, v1.82.5.
### [Admin and Policy Management](#admin-and-policy-management)
##### [**Code folding in the ACL editor**](#code-folding-in-the-acl-editor)
The [Access Controls](https://login.tailscale.com/admin/acls/file) editor in the admin console now supports code folding. Collapse and expand sections like hosts and groups, making large policy files easier to navigate and manage.
### [Device Security Improvements](#device-security-improvements)
##### [**Faster posture attribute syncing for new nodes**](#faster-posture-attribute-syncing-for-new-nodes)
[Device posture](https://tailscale.com/kb/1288/device-posture) integrations now prioritize syncing attributes for newly added nodes. If you use device posture checks, you should see third-party attributes show up faster, helping enforce security policies more reliably.
### [Image and Operator Updates](#image-and-operator-updates)
##### [**Docker image, Kubernetes operator, and tsrecorder v1.82.5**](#docker-image-kubernetes-operator-and-tsrecorder-v1825)
We released updated versions of the Tailscale Docker image, [Kubernetes operator](https://github.com/tailscale/k8s-operator), and tsrecorder. These updates include library upgrades but no functional changes. Staying current helps ensure long-term stability and support.
### [Improved Connectivity](#improved-connectivity)
##### [**New DERP regions: Helsinki, Ashburn, and Nuremberg**](#new-derp-regions-helsinki-ashburn-and-nuremberg)
We’ve added [DERP relay locations](https://tailscale.com/kb/1232/derp-servers) in Helsinki, Ashburn, and Nuremberg. These new regions improve connection performance and reliability for users nearby, especially in environments with restricted or multiple NAT traversal.
That’s everything for this month. If you have questions or feedback, [we’re here to help](https://tailscale.com/contact/support). Thanks for using Tailscale.
Share
Author
Remy Guercio
Author
Remy Guercio
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