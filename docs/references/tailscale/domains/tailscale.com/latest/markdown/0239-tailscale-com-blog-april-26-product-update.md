Tailscale Monthly Update: April 2026
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|productApril 24, 2026
# This month at Tailscale for April 2026
We continuously ship updates to make your network more reliable, manageable, and secure. Each month, we highlight some of the most impactful changes across clients, admin tools, integrations, and infrastructure—so you can stay on top of what’s new and what’s better.
Here's a rundown of what's changed in Tailscale's software since our [last blog update in late March 2026](https://tailscale.com/blog/march-26-product-update). For instructions on how to update to the latest version, visit our [update guide](https://tailscale.com/kb/1067/update).
## [Aperture updates](#aperture-updates)
* **New: **Create custom guardrails with [pre-LLM-call hooks](https://tailscale.com/docs/aperture/how-to/build-custom-webhook) to strip or block PII and [restrict specific agent tools](https://tailscale.com/docs/aperture/how-to/grant-mcp-tool-access) before requests reach the LLM.
* **New: **Configure log retention time down to zero for request/response capture logs, with [S3-compatible export](https://tailscale.com/docs/aperture/how-to/export-usage-data-to-s3) supported.
* **New: **[Audit logs](https://tailscale.com/docs/aperture/observe-and-export) for configuration changes and when admins view logs owned by other users are available using a new API endpoint and [UI](https://tailscale.com/docs/aperture/reference/dashboard).
* **Changed: **Set customizable quotas across providers, models, users, agents, or individual agent runs.## [API-only tailnets and Oauth clients](#api-only-tailnets-and-oauth-clients)
* **New: **[API-only tailnets](https://tailscale.com/docs/features/tailnet-creation-api) can be [accessed](https://tailscale.com/docs/features/tailnet-creation-api#authenticate-against-api-only-tailnets) by any [OAuth client](https://tailscale.com/docs/features/oauth-clients) with the `all` scope in the creating tailnet.## [Client updates](#client-updates)
### [v1.96.5](#v1965)
These notable changes are inclusive of all updates from versions 1.96.4 to 196.5 For detailed notes on each release, [see our changelog](https://tailscale.com/changelog).
### [Linux](#linux)
* **Fixed: **An issue on forks of Linux caused by fallback-on-ENOSYS logic is resolved. (Also on Synology)
* **Fixed: **An issue that could cause a segmentation violation during startup on MIPS devices is resolved.### [iOS/tvOS](#iostvos)
* **Fixed: **An issue that could cause the network extension to encounter an out of memory condition on large tailnets is resolved.### [Android](#android)
* **Fixed: **An issue causing a deadlock when disconnecting from a tailnet is resolved.## [Container, Kubernetes, and `tsrecorder` updates](#container-kubernetes-and-tsrecorder-updates)
### [Container image v1.96.5](#container-image-v1965)
* **New: **Services are now automatically advertised on startup. This can be disabled by setting the new environment variable, [`TS\_EXPERIMENTAL\_SERVICE\_AUTO\_ADVERTISEMENT`](https://tailscale.com/docs/features/containers/docker/docker-params#ts_experimental_service_auto_advertisement), to `false`.
* **Fixed: **The Tailscale container no longer tries to create a secret using TS\_KUBE\_SECRET when the variable is empty.### [Kubernetes operator v1.96.5](#kubernetes-operator-v1965)
* **New: **Ingress and Egress ProxyGroup pods are able to request a new authkey when required.
* **New: **Multiple tailnet access can be enabled with the use of the new [Tailnet](https://tailscale.com/docs/features/kubernetes-operator/how-to/multi-tailnet) custom resource.
* **New: **ProxyGroup creation controls can be managed by namespace with the new [ProxyGroupPolicy](https://tailscale.com/docs/features/kubernetes-operator/how-to/proxy-group-policy) custom resource.
* **Changed: **The environment variable `TS\_EXPERIMENTAL\_KUBE\_API\_EVENTS` is removed. This can instead be set via [Tailscale ACLs](https://tailscale.com/docs/features/kubernetes-operator/how-to/session-recording#enabling-api-request-event-recording).
* **Fixed: **The environment variable `TS\_LOCAL\_ADDR\_PORT` no longer fails when it is populated with an IPv6 address without brackets.### [ tsrecorder v1.96.5](#tsrecorder-v1965)
* **Changed: **The `Recorder` CRD defaults to deploying a single replica StatefulSet, using the filesystem storage backend`.
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