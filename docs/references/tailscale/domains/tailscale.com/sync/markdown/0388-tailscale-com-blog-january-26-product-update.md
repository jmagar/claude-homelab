Tailscale Monthly Update: January 2026
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|productJanuary 23, 2026
# This month at Tailscale for January 2026
We continuously ship updates to make your network more reliable, manageable, and secure. Each month, we highlight some of the most impactful changes across clients, admin tools, integrations, and infrastructure—so you can stay on top of what’s new and what’s better.
Here's a rundown of what's changed in Tailscale's software lately. There are changes to clients, API improvements, and other updates. For instructions on how to update to the latest version, visit our [update guide](https://tailscale.com/kb/1067/update).
## [Changes](#changes)
### [Workload identity federation API](#workload-identity-federation-api)
[Federated identities](https://tailscale.com/kb/1581/workload-identity-federation) are now integrated into more parts of Tailscale:
* The [Tailscale API](https://tailscale.com/kb/1101/api) (create, read, update, delete)
* `tailscale-client-go-v2` (configure)
* [Tailscale Terraform provider](https://tailscale.com/kb/1210/terraform-provider) (configure)### [India DERP region city name updated](#india-derp-region-city-name-updated)
The city name for the [DERP server](https://tailscale.com/kb/1232/derp-servers) hosted in India has been updated to reflect the official name of Bengaluru. The hosting provider and IP addresses remain unchanged.
## [Client updates](#client-updates)
### [v1.92.5](#v1925)
As of Tailscale 1.92.5, Windows and Linux clients no longer enable [state file encryption](https://tailscale.com/kb/1596/secure-node-state-storage) and hardware attestation keys by default. A Tailscale engineer wrote about this change [in a Hacker News thread](https://news.ycombinator.com/item?id=46531925). Clients on Apple devices and Android continue to have secure node state storage encryption by default.
## [GitHub Action ](#github-action)
### [v4.1.1](#v411)
The [Tailscale GitHub Action](https://tailscale.com/kb/1276/tailscale-github-action) now uses the correct architecture for storing and retrieving caches on macOS-based GitHub runners.
## [Container, Kubernetes, and `tsrecorder` updates](#container-kubernetes-and-tsrecorder-updates)
### [**Container image v1.92.5**](#container-image-v1925)
* Hardware attestation keys are no longer added to Kubernetes state `Secrets`, making it possible to change the Kubernetes node the Tailscale containers are deployed on.### [**Kubernetes operator v1.92.5**](#kubernetes-operator-v1925)
* Certificate renewal is no longer done as an ARI order by default to avoid renewal failure if ACME account keys are recreated.
* Hardware attestation keys are no longer added to Kubernetes state `Secrets`, making it possible to change the Kubernetes node the Tailscale Kubernetes Operator is deployed on.### [** tsrecorder v1.92.5**](#tsrecorder-v1925)
This version contains no changes except for library updates.
Those are the highlights for recent weeks. If you have questions or feedback, [we're here to help](https://tailscale.com/contact/support). Thank you for using Tailscale.
Share
Author
Kevin Purdy
Author
Kevin Purdy
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