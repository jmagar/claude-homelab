Changelog · Tailscale
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Changelog
Updates to the Tailscale client and service.
[Subscribe via RSS](/changelog/index.xml)
## [Apr 29, 2026](#2026-04-29)
* [View the device posture status](/docs/features/device-posture#check-device-posture-status) of a machine in your tailnet by using the **Machines** page of the admin console.
## [Apr 27, 2026](#2026-04-27)
A new release of [GitOps for Tailscale with GitHub Actions](/docs/integrations/github/gitops) is available. You can download it from the [GitHub Actions Marketplace](https://github.com/marketplace/actions/sync-tailscale-acls).
* Update dependencies to remove Node 20 deprecation warning.
## [Apr 23, 2026](#2026-04-23)
Use [Aperture](/docs/aperture) ([beta](/docs/reference/tailscale-release-stages#beta)) to secure and manage your LLM agents with a single control plane across all your providers and models.
* Create custom guardrails with [pre-LLM-call hooks](/docs/aperture/how-to/build-custom-webhook) to strip or block PII and [restrict specific agent tools](/docs/aperture/how-to/grant-mcp-tool-access) before requests reach the LLM.
* Configure log retention time down to zero for request/response capture logs, with [S3-compatible export](/docs/aperture/how-to/export-usage-data-to-s3) supported.
* [Audit logs](/docs/aperture/observe-and-export) for configuration changes and when admins view logs owned by other users are available using a new API endpoint and [UI](/docs/aperture/reference/dashboard).
* Set [customizable quotas](/docs/aperture/manage-spending) across providers, models, users, agents, or individual agent runs.
* [API-only tailnets](/docs/features/tailnet-creation-api) can be [accessed](/docs/features/tailnet-creation-api#authenticate-against-api-only-tailnets) by any [OAuth client](/docs/features/oauth-clients) with the `all` scope in the creating tailnet.
## [Apr 22, 2026](#2026-04-22)
* A [seat calculator](https://login.tailscale.com/admin/settings/billing/seat-calculator) is available to help you understand seat consumption on your account before upgrading to a new plan.
## [Apr 8, 2026](#2026-04-08)
* New tailnet plan signups are billed based on occupied user seats instead of monthly active users. Existing tailnets on a legacy plan will continue to be billed based on monthly active users.
* All plans can have an unlimited number of user devices in a tailnet.
* The Personal plan provides up to six free users instead of the previous three users.
* [Ephemeral node](/docs/features/ephemeral-nodes) usage is free up to a monthly limit, by [pricing plan](/pricing). After four hours in the tailnet, nodes are treated as standard [tagged devices](/docs/reference/syntax/policy-file#tags) and stop consuming ephemeral minutes.
* As part of the Personal plan change, [Aperture by Tailscale](/docs/aperture) also provides for up to six free users during the alpha testing phase.
* The Starter plan is no longer available as a plan option for new signups. The new Standard plan is the closest equivalent option.
* Promo codes can be applied to existing plans. Previously, promo codes could only be applied when upgrading to a new plan.
For more information about our pricing plans and the features available for each plan, refer to [Pricing](/pricing) and [Pricing FAQs](/pricing#faqs).
## [Apr 7, 2026](#2026-04-07)
A new release of the Tailscale container image is available. You can download it from [Docker Hub](https://hub.docker.com/r/tailscale/tailscale) or from our [GitHub packages repository](https://github.com/tailscale/tailscale/pkgs/container/tailscale).
* Services are now automatically advertised on startup. This can be disabled by setting the new environment variable, [`TS\_EXPERIMENTAL\_SERVICE\_AUTO\_ADVERTISEMENT`](/docs/features/containers/docker/docker-params#ts_experimental_service_auto_advertisement), to `false`.
* The Tailscale container no longer tries to create a secret using `TS\_KUBE\_SECRET` when the variable is empty.
A new release of the [Tailscale Kubernetes Operator](/docs/features/kubernetes-operator) is available. For guidance on installing and updating, refer to our [installation instructions](/docs/features/kubernetes-operator#installation).
* Ingress and Egress ProxyGroup pods are able to request a new authkey when required.
* Multiple tailnet access can be enabled with the use of the new [Tailnet](/docs/features/kubernetes-operator/how-to/multi-tailnet) custom resource.
* ProxyGroup creation controls can be managed by namespace with the new [ProxyGroupPolicy](/docs/features/kubernetes-operator/how-to/proxy-group-policy) custom resource.
* The environment variable `TS\_EXPERIMENTAL\_KUBE\_API\_EVENTS` is removed. This can instead be set via [Tailscale ACLs](https://tailscale.com/docs/features/kubernetes-operator/how-to/session-recording#enabling-api-request-event-recording).
* The environment variable `TS\_LOCAL\_ADDR\_PORT` no longer fails when it is populated with an IPv6 address without brackets.
A new release of the [Tailscale](/docs/features/tailscale-ssh/tailscale-ssh-session-recording) [`tsrecorder`](/docs/features/tailscale-ssh/tailscale-ssh-session-recording) is available. You can download it from [Docker Hub](https://hub.docker.com/r/tailscale/tsrecorder/tags).
* The `Recorder` CRD defaults to deploying a single replica StatefulSet, using the filesystem storage backend`.
## [Mar 30, 2026](#2026-03-30)
##### iOS
* An issue that could cause the network extension to encounter an out of memory condition on large tailnets is resolved.
#### tvOS
* An issue that could cause the network extension to encounter an out of memory condition on large tailnets is resolved.
## [Mar 27, 2026](#2026-03-27)
#### Linux
* An issue on forks of Linux caused by fallback-on-ENOSYS logic is resolved.
* An issue that could cause a segmentation violation during startup on MIPS devices is resolved.
#### Android
* An issue causing a deadlock when disconnecting from a tailnet is resolved.
#### Synology
* An issue on forks of Synology Linux caused by fallback-on-ENOSYS logic is resolved.
## [Mar 19, 2026](#2026-03-19)
##### Windows
* [DNS](/docs/reference/dns-in-tailscale) resolution issue caused by NRPT rule formatting is resolved.
## [Mar 18, 2026](#2026-03-18)
**Note**: 1.96.0 and 1.96.1 were [release candidates](/docs/reference/tailscale-client-versions#release-candidate-track) intended for testing only.
##### All Platforms
* [`tailscale dns query|status`](/docs/reference/tailscale-cli#dns) command supports `--json` flag to return JSON output.
* [`tailscale wait [flags]`](/docs/reference/tailscale-cli#wait) command waits for Tailscale resources to become available for binding.
* [`tailscale ip`](/docs/reference/tailscale-cli#ip) command supports `--assert=\<specific-ip-address\>` flag to assert that one or more of the node's IP addresses matches the specified IP address.
* [`tailscale version --track`](/docs/reference/tailscale-cli#version) and [`tailscale update --track`](/docs/reference/tailscale-cli#update) support `release-candidate` flag to check for and update to [release candidate builds](/docs/reference/tailscale-client-versions#release-candidate-track).
* For 1.96.x, Go is updated from version 1.25 to 1.26.
* [Tailscale Peer Relays](/docs/features/peer-relay) advertise addresses discovered via Amazon EC2 Instance Metadata Service.
* `tailscaled\_peer\_relay\_endpoints gauge` [user metrics](/docs/reference/tailscale-client-metrics#peer-relay-servers) are available for [Tailscale Peer Relays](/docs/features/peer-relay).
* The `AuthKey` [system policy](/docs/features/tailscale-system-policies#set-an-auth-key) applies only when a user is not in a logged in state.
* [UPnP](https://en.wikipedia.org/wiki/Universal_Plug_and_Play) routes as expected during long lived [port mapping sessions](/docs/reference/device-connectivity#port-mapping) scenarios, including [hard NAT](/docs/reference/device-connectivity#hard-nat).
##### Linux
* Launch the `systray` application on startup using autostart file with the [`tailscale configure systray --enable-startup=freedesktop`](/docs/features/client/linux-systray#start-the-systray-application) command.
* Scaling of [Tailscale Peer Relays](/docs/features/peer-relay) UDP sockets is gated by container-aware GOMAXPROCS defaults.
* Firewall rules created on Linux platforms correctly mark their traffic, avoiding [reverse path filtering](/docs/reference/reference-architectures/gcp#linux-vms-using-exit-nodes) dropping connections and producing health warnings and risk prompts.
* OpenWrt versions 25.12.0 or later using apk as a package manager supports Tailscale updates.
##### macOS
* Windowed UI mode for macOS is [generally available](/docs/reference/tailscale-release-stages#general-availability-ga).
* Double click an account in the **Accounts** section to switch to that account.
* A progress dialog indicates Tailscale is waiting on the browser to complete reauthentication.
* The [open source variant](https://github.com/tailscale/tailscale/wiki/Tailscaled-on-macOS) of Tailscale on macOS sets the [`node:osVersion`](/docs/features/device-posture#device-posture-attributes) attribute.
* The [Taildrop](/docs/features/taildrop) [Send File](/docs/features/mac-ios-shortcuts#send-file) action and shortcut do not transmit empty files on macOS Tahoe (version 26) or later.
* Tailscale data directories for the [macOS standalone version](/docs/concepts/macos-variants#standalone-variant) are excluded from Time Machine backups.
* An issue that required a machine reboot after installing a Tailscale update is resolved.
##### iOS
* iOS [bug report](/docs/account/bug-report?tab=ios) ID displays in its entirety instead of being truncated.
* The [Taildrop](/docs/features/taildrop) [Send File](/docs/features/mac-ios-shortcuts#send-file) action and shortcut do not transmit empty files on iOS version 26 or later.
## [Feb 19, 2026](#2026-02-19)
* Use [workload identity federation](/docs/features/workload-identity-federation) ([generally available](/docs/reference/tailscale-release-stages#general-availability-ga)) to authenticate [Tailscale API](/docs/reference/tailscale-api) requests with federated OIDC workload identities from third-party providers.
## [Feb 18, 2026](#2026-02-18)
* Use [Fleet Device Management](/docs/integrations/fleet) to collect device posture signals from devices in your tailnet.
* Use [Huntress Managed EDR](/docs/integrations/huntress) to collect device posture signals from devices in your tailnet.
* Use [Tailscale Peer Relays](/docs/features/peer-relay) to set up self-hosted high-throughput relay servers when direct connections aren't possible ([generally available](/docs/reference/tailscale-release-stages#general-availability-ga)).
## [Feb 17, 2026](#2026-02-17)
* Use [Aperture by Tailscale](/docs/aperture) to secure and monitor LLM sessions and AI agents ([alpha](/docs/reference/tailscale-release-stages#alpha)).
## [Feb 13, 2026](#2026-02-13)
A new release of the [Tailscale Kubernetes Operator](/docs/features/kubernetes-operator) is available. For guidance on installing and updating, refer to our [installation instructions](/docs/features/kubernetes-operator#installation).
* Configuring a single invalid Tailscale FQDN for an egress will no longer cause the egress to crash. It will instead log the error and continuing serving traffic.
## [Feb 12, 2026](#2026-02-12)
##### All Platforms
* Memory leak caused by high network map response rates is resolved.
## [Feb 5, 2026](#2026-02-05)
A new release of the Tailscale container image is available. You can download it from [Docker Hub](https://hub.docker.com/r/tailscale/tailscale) or from our [GitHub packages repository](https://github.com/tailscale/tailscale/pkgs/container/tailscale).
* [OAuth and workload identity federation](/docs/features/containers/docker#ts_client_id) support has been added for containers.
A new release of the [Tailscale Kubernetes Operator](/docs/features/kubernetes-operator) is available. For guidance on installing and updating, refer to our [installation instructions](/docs/features/kubernetes-operator#installation).
* The Egress proxy can now send traffic to Tailscale service VIPs.
* Use [Kubenetes API server proxy audit logging](/docs/features/kubernetes-operator/how-to/session-recording) [(beta)](/docs/reference/tailscale-release-stages#beta) to record Kubernetes API events on your cluster, in addition to or instead of entire recordings, that pass through your [Kubernetes Operator API server proxy](/docs/reference/kubernetes-operator-api-request-event-recording).
* In high availability (HA) mode, the write replica no longer serves stale TLS certificates after renewal.
* Setting container resources for the Tailscale container will no longer result in an invalid value error for “1Mi.”
A new release of the [Tailscale](/docs/features/tailscale-ssh/tailscale-ssh-session-recording) [`tsrecorder`](/docs/features/tailscale-ssh/tailscale-ssh-session-recording) is available. You can download it from [Docker Hub](https://hub.docker.com/r/tailscale/tsrecorder/tags).
* **Note**: This version contains no changes except for library updates.
## [Feb 4, 2026](#2026-02-04)
* Tailscale [network flow logs](/kb/1255/log-streaming#network-log-streaming) and [configuration audit logs](/kb/1255/log-streaming#configuration-log-streaming) can be streamed to [Google Cloud Storage](https://cloud.google.com/storage) (GCS).
## [Jan 30, 2026](#2026-01-30)
* [Workload identity federation](/kb/1581/workload-identity-federation) supports provider-native identity token authentication for [GitOps for Tailscale with GitHub Actions](/kb/1306/gitops-acls-github) and [GitOps for Tailscale with GitLab CI](/kb/1254/gitops-acls-gitlab).
* [Token exchange error details](/kb/1581/workload-identity-federation#debugging-token-exchange-errors) for a federated identity can be found in the **Trust credentials** page of the admin console.
## [Jan 27, 2026](#2026-01-27)
* Use [Tailscale Services](/kb/1552/tailscale-services) to decouple applications and services from the devices that host them ([generally available](/kb/1167/release-stages#general-availability-ga)).
* [tsnet](/kb/1244/tsnet) application support for [Tailscale Services](/kb/1552/tailscale-services) hosts.
## [Jan 26, 2026](#2026-01-26)
**Note**: 1.94.0 was a [release candidate](/kb/1168/versions#release-candidate-track) intended for testing only.
##### All Platforms
* [`tailscaled\_home\_derp\_region\_id`](/kb/1232/derp-servers#derp-server-locations) [client metrics](/kb/1482/client-metrics) are available.
* `tailscaled\_peer\_relay\_forwarded\_packets\_total` and `tailscaled\_peer\_relay\_forwarded\_bytes\_total` [client metrics](/kb/1482/client-metrics#peer-relay-servers) are available for [Tailscale Peer Relays](/kb/1591/peer-relays).
* [Identity tokens](/kb/1581/workload-identity-federation#exchange-workload-identity-tokens-with-tailscale) are automatically generated for [workload identities](/kb/1581/workload-identity-federation).
* [`--audience`](/kb/1581/workload-identity-federation#automatic-cloud-token-discovery-and-exchange) flag added to `tailscale up` command to support auto generation of ID tokens for workload identity.
* `tsnet` [nodes can host Tailscale Services.](https://pkg.go.dev/tailscale.com/tsnet#Server.ListenService)
* The [`tailscale lock status -json`](/kb/1080/cli#status) command returns [tailnet key authority (TKA)](/kb/1226/tailnet-lock#tailnet-key-authority) data in a stable format.
* [Tailscale Peer Relays](/kb/1591/peer-relays) deliver improved throughput through monotonic time comparison optimizations and reduced lock contention.
* [Tailscale Services](/kb/1552/tailscale-services) virtual IPs are now automatically accepted by clients across all platforms regardless of the status of the `--accept-routes` feature.
##### Linux
* [Custom DERP servers](/kb/1118/custom-derp-servers) support Google Cloud Platform (GCP) Certificate Manager.
* [Tailscale SSH](/kb/1193/tailscale-ssh) authentication, when successful, results in `LOGIN` audit messages being sent to the kernel audit subsystem.
* [Tailscale Peer Relay](/kb/1591/peer-relays) throughput is improved when the `SO\_REUSEPORT` socket option is supported on multi-core systems.
* [Tailscale Peer Relay](/kb/1591/peer-relays) server handshake transmission is guarded against routing loops over Tailscale.
* MagicDNS always resolves when using `resolve.conf` without a DNS manager.
##### macOS
* [`AuthBrowser.macos`](/kb/1315/mdm-keys#set-a-custom-browser-for-authentication) system policy sets a preferred browser for opening automatic authentication URLs.
* [`HideDockIcon`](/kb/1315/mdm-keys#hide-the-macos-dock-icon-after-all-windows-close) system policy determines if the Tailscale Dock icon persists after all Tailscale windows close.
* Install and automatically update to [release candidate](/kb/1168/versions#release-candidate-track) versions of the client in the **About** section, **Release Channel** drop-down.
* DNS related health warnings no longer display when [Tailscale DNS](/kb/1054/dns) is disabled.
* `tssentinelId` command injection vulnerability has been removed. This fix addresses a security vulnerability described in [TS-2026-001](/security-bulletins#ts-2026-001).
* Ping view is [Tailscale Peer Relay](/kb/1591/peer-relays) aware.
##### iOS
* Ping view is [Tailscale Peer Relay](/kb/1591/peer-relays) aware.
##### tvOS
* **Use Tailscale Subnets** toggle is added in **Subnet Routing Settings**.
* Ping view is [Tailscale Peer Relay](/kb/1591/peer-relays) aware.
##### Android
* Ping view is [Tailscale Peer Relay](/kb/1591/peer-relays) aware.
## [Jan 22, 2026](#2026-01-22)
* `IS SET` and `NOT SET` have been added as [device posture](/kb/1288/device-posture) operators.
## [Jan 21, 2026](#2026-01-21)
* The city name for the [DERP server](/kb/1232/derp-servers) hosted in India has been updated to reflect the official name of Bengaluru. The hosting provider and IP addresses remain unchanged.
## [Jan 6, 2026](#2026-01-06)
##### Linux
* [State file encryption](https://tailscale.com/kb/1596/secure-node-state-storage) and hardware attestation keys are no longer enabled by default.
* Failure to load hardware attestation keys no longer prevents the client from starting. This could happen when the TPM device is reset or replaced.
##### Windows
* [State file encryption](https://tailscale.com/kb/1596/secure-node-state-storage) and hardware attestation keys are no longer enabled by default.
* Failure to load hardware attestation keys no longer prevents the client from starting. This could happen when the TPM device is reset or replaced.
A new release of the Tailscale container image is available. You can download it from [Docker Hub](https://hub.docker.com/r/tailscale/tailscale) or from our [GitHub packages repository](https://github.com/tailscale/tailscale/pkgs/container/tailscale).
* Hardware attestation keys are no longer added to Kubernetes state `Secrets`, making it possible to change the Kubernetes node the Tailscale containers are deployed on.
A new release of the [Tailscale Kubernetes Operator](/kb/1236/kubernetes-operator) is available. For guidance on installing and updating, refer to our [installation instructions](/kb/1236/kubernetes-operator#installation).
* Certificate renewal is no longer done as an ARI order by default to avoid renewal failure if ACME account keys are recreated.
* Hardware attestation keys are no longer added to Kubernetes state `Secrets`, making it possible to change the Kubernetes node the Tailscale Kubernetes Operator is deployed on.
A new release of the [Tailscale](/kb/1246/tailscale-ssh-session-recording) [`tsrecorder`](/kb/1246/tailscale-ssh-session-recording) is available. You can download it from [Docker Hub](https://hub.docker.com/r/tailscale/tsrecorder/tags).
* **Note**: This version contains no changes except for library updates.
## [Jan 5, 2026](#2026-01-05)
* The [Tailscale API](/kb/1101/api) supports creating, reading, updating, and deleting [federated identities](/kb/1581/workload-identity-federation).
* [`tailscale-client-go-v2`](https://github.com/tailscale/tailscale-client-go-v2) can configure [federated identities](/kb/1581/workload-identity-federation).
* The [Tailscale Terraform provider](/kb/1210/terraform-provider) can configure [federated identities](/kb/1581/workload-identity-federation).
## [Dec 23, 2025](#2025-12-23)
* The [Tailscale GitHub Action](/kb/1276/tailscale-github-action) uses the correct architecture for storing and retrieving caches on macOS-based GitHub runners.
## [Dec 18, 2025](#2025-12-18)
A new release of the Tailscale container image is available. You can download it from [Docker Hub](https://hub.docker.com/r/tailscale/tailscale) or from our [GitHub packages repository](https://github.com/tailscale/tailscale/pkgs/container/tailscale).
* Ensure errors for background certificate renewal failures are logged.
A new release of the [Tailscale Kubernetes Operator](/kb/1236/kubernetes-operator) is available. For guidance on installing and updating, refer to our [installation instructions](/kb/1236/kubernetes-operator#installation).
* A Helm templating issue that occurred when an [OAuth client](/kb/1215/oauth-clients) secret was not set, is resolved.
A new release of the [Tailscale](/kb/1246/tailscale-ssh-session-recording) [`tsrecorder`](/kb/1246/tailscale-ssh-session-recording) is available. You can download it from [Docker Hub](https://hub.docker.com/r/tailscale/tsrecorder/tags).
**Note:** This version contains no changes except for library updates.
## [Dec 17, 2025](#2025-12-17)
A new release of the Tailscale container image is available. You can download it from [Docker Hub](https://hub.docker.com/r/tailscale/tailscale) or from our [GitHub packages repository](https://github.com/tailscale/tailscale/pkgs/container/tailscale).
* `iptables` can be used on hosts that don't support `nftables`, as expected.
A new release of the [Tailscale Kubernetes Operator](/kb/1236/kubernetes-operator) is available. For guidance on installing and updating, refer to our [installation instructions](/kb/1236/kubernetes-operator#installation).
* The operator supports [workload identity federation](/kb/1236/kubernetes-operator#installation-with-workload-identity-federation) for authenticating to a tailnet using provider-native identity tokens.
* `tailscale.com/http-redirect` annotation can be applied to Ingress resources for enabling HTTP to HTTPS redirects.
* The operator defaults to using the stable image for nameservers deployed using the `DNSConfig` resource.
* Recorder resources can specify a replica count for highly available deployments. Using multiple replicas requires using an S3 storage backend.
* ArgoCD compatibility is improved. You can use both boolean and string values when setting the `apiServerProxyConfig.mode` and `apiServerProxyConfig.allowImpersonation` values.
* The operator correctly reconciles managed Ingresses sharing the same namespace as other unmanaged Ingresses.
* `ProxyGroup` backed ingresses no longer get stuck during deletion if they use a Tailscale Service that had been deleted.
A new release of the [Tailscale](/kb/1246/tailscale-ssh-session-recording) [`tsrecorder`](/kb/1246/tailscale-ssh-session-recording) is available. You can download it from [Docker Hub](https://hub.docker.com/r/tailscale/tsrecorder/tags).
* `tsrecorder` can use a file containing an [auth key](/kb/1085/auth-keys) for authentication using the `TS\_AUTHKEY\_FILE` environment variable.
## [Dec 16, 2025](#2025-12-16)
##### All platforms
* [WireGuard](/kb/1035/wireguard) configuration that occurs automatically in the client, no longer results in a panic.
##### macOS
* [Tailscale system extension](/kb/1340/macos-sysext) no longer fails to install during an upgrade.
## [Dec 10, 2025](#2025-12-10)
**Note**: 1.92.0 was a [release candidate](/kb/1168/versions#release-candidate-track) intended for testing only.
###### All platforms
* [Tailscale Funnel](/kb/1223/funnel) and [Tailscale Serve](/kb/1312/serve) support the PROXY protocol, a header format that forwards information about the original client connection, such as the source IP and port, to the server before the actual traffic begins.
* [Tailscale Peer Relays](/kb/1591/peer-relays) can use static endpoints using the [`tailscale set`](/kb/1080/cli#set) command with the `--relay-server-static-endpoints` flag.
* [Tailscale Services](/kb/1552/tailscale-services) can be configured to use a remote target as a service destination.
* Nodes can authenticate using [workload identity federation](/kb/1581/workload-identity-federation) with the [`tailscale up`](/kb/1241/tailscale-up) command flags `--client-id` and `--id-token`.
* [Network flow logs](/kb/1219/network-flow-logs) automatically record node information about itself and peers it communicates with.
* [Tailnet Lock](/kb/1226/tailnet-lock) command [`tailscale lock log --json`](/kb/1243/tailscale-lock#lock-log) response returns [Authority Update Messages](/kb/1230/tailnet-lock-whitepaper#authority-update-messages-aums) (AUMs) in a more stable format.
* Tailscale Peer Relay endpoint advertisements include more candidate `IP:port` pairs.
* Tailscale Peer Relays support multiple, forward bind packets per handshake generation, which improves path selection and chances of completing a handshake.
###### macOS
* Redundant label text for VoiceOver is removed from the exit node picker.
###### iOS
* [Taildrop](/kb/1106/taildrop) supported nodes are shown in Device Details.
* Redundant label text for VoiceOver is removed from the exit node picker.
##### macOS
* [Taildrop](/kb/1106/taildrop) works as expected using the macOS **Share** option.
##### Android
* An issue in [custom control servers](/kb/1507/custom-control-server) (Headscale) that could result in connectivity problems is resolved.
## [Nov 25, 2025](#2025-11-25)
###### All platforms
* [`tailscaled`](/kb/1278/tailscaled) no longer deadlocks during event bursts.
* The client no longer hangs after wake up when [port mapping](/kb/1411/device-connectivity#port-mapping) is in use and interfaces are slow to become available.
###### Android
* [DNS](/kb/1054/dns) continues working when switching from cellular to Wi-Fi connections.
A new release of the Tailscale container image is available. You can download it from [Docker Hub](https://hub.docker.com/r/tailscale/tailscale) or from our [GitHub packages repository](https://github.com/tailscale/tailscale/pkgs/container/tailscale).
* [`tailscaled`](/kb/1278/tailscaled) no longer deadlocks during event bursts.
* The client no longer hangs after wake up when [port mapping](/kb/1411/device-connectivity#port-mapping) is in use and interfaces are slow to become available.
A new release of the [Tailscale Kubernetes operator](/kb/1236/kubernetes-operator) is available. For guidance on installing and updating, refer to our [installation instructions](/kb/1236/kubernetes-operator#installation).
**Note:** This version contains no changes except for library updates.
A new release of the [Tailscale](/kb/1246/tailscale-ssh-session-recording) [`tsrecorder`](/kb/1246/tailscale-ssh-session-recording) is available. You can download it from [Docker Hub](https://hub.docker.com/r/tailscale/tsrecorder/tags).
**Note:** This version contains no changes except for library updates.
## [Nov 19, 2025](#2025-11-19)
**Note**: v1.90.7 was an internal-only release.
###### All platforms
* Panic issue related to [Peer Relays](/kb/1591/peer-relays) is resolved.
* Deadlock issue no longer occurs when handling Peer Relays endpoint allocation requests.
* Memory leak in Peer Relays is resolved.
###### Linux
* Nodes without the [`tailscaled --statedir`](/kb/1278/tailscaled#flags-to-tailscaled) flag or the [`TS\_STATE\_DIR`](/kb/1282/docker#ts_state_dir) environment variable no longer fail to enforce signing checks in tailnets with [Tailnet Lock](/kb/1226/tailnet-lock) enabled. This fix addresses a security vulnerability described in [TS-2025-008](/security-bulletins#ts-2025-008).
###### macOS
* Connectivity issue related to sleep and wake is resolved.
A new release of the Tailscale container image is available. You can download it from [Docker Hub](https://hub.docker.com/r/tailscale/tailscale) or from our [GitHub packages repository](https://github.com/tailscale/tailscale/pkgs/container/tailscale).
* Nodes without the [`tailscaled --statedir`](/kb/1278/tailscaled#flags-to-tailscaled) flag or the [`TS\_STATE\_DIR`](/kb/1282/docker#ts_state_dir) environment variable no longer fail to enforce signing checks in tailnets with [Tailnet Lock](/kb/1226/tailnet-lock) enabled. This fix addresses a security vulnerability described in [TS-2025-008](/security-bulletins#ts-2025-008).
A new release of the [Tailscale Kubernetes operator](/kb/1236/kubernetes-operator) is available. For guidance on installing and updating, refer to our [installation instructions](/kb/1236/kubernetes-operator#installation).
**Note:** This version contains no changes except for library updates.
A new release of the [Tailscale](/kb/1246/tailscale-ssh-session-recording) [`tsrecorder`](/kb/1246/tailscale-ssh-session-recording) is available. You can download it from [Docker Hub](https://hub.docker.com/r/tailscale/tsrecorder/tags).
**Note:** This version contains no changes except for library updates.
## [Nov 13, 2025](#2025-11-13)
* The domain `log.tailscale.com` resolves to static IP address ranges registered and managed by Tailscale. If IP-based rules are required for your firewall, use the IPv4 range `199.165.136.0/24` and the IPv6 range `2606:B740:1::/48`.
**Note:** In most cases, you do not need to configure firewall rules to use Tailscale. For more information, refer to [What firewall ports should I open to use Tailscale?](/kb/1082/firewall-ports)
## [Oct 31, 2025](#2025-10-31)
###### App connectors
* Routes no longer stall and fail to apply when updated repeatedly in a short period of time.
A new release of the Tailscale container image is available. You can download it from [Docker Hub](https://hub.docker.com/r/tailscale/tailscale) or from our [GitHub packages repository](https://github.com/tailscale/tailscale/pkgs/container/tailscale).
* [App connector](/kb/1342/app-connectors-setup) routes no longer stall and fail to apply when updated repeatedly in a short period of time.
A new release of the [Tailscale Kubernetes operator](/kb/1236/kubernetes-operator) is available. For guidance on installing and updating, refer to our [installation instructions](/kb/1236/kubernetes-operator#installation).
**Note:** This version contains no changes except for library updates.
A new release of the [Tailscale](/kb/1246/tailscale-ssh-session-recording) [`tsrecorder`](/kb/1246/tailscale-ssh-session-recording) is available. You can download it from [Docker Hub](https://hub.docker.com/r/tailscale/tsrecorder/tags).
**Note:** This version contains no changes except for library updates.
## [Oct 30, 2025](#2025-10-30)
###### Linux
* [Tailscale SSH](/kb/1193/tailscale-ssh) no longer hangs for 10s when connecting to `tsrecorder`. This affected tailnets that use [Tailscale SSH recording](/kb/1246/tailscale-ssh-session-recording).
A new release of the Tailscale container image is available. You can download it from [Docker Hub](https://hub.docker.com/r/tailscale/tailscale) or from our [GitHub packages repository](https://github.com/tailscale/tailscale/pkgs/container/tailscale).
**Note:** This version contains no changes except for library updates.
A new release of the [Tailscale Kubernetes operator](/kb/1236/kubernetes-operator) is available. For guidance on installing and updating, refer to our [installation instructions](/kb/1236/kubernetes-operator#installation).
* [DNSConfig nameserver](/kb/1438/kubernetes-operator-cluster-egress#expose-a-tailnet-https-service-to-your-cluster-workloads) supports Pods with IPv6 addresses and will serve AAAA records.
* DNSConfig nameserver supports specifying a replica count for high-availability deployment.
* DNSConfig nameserver supports specifying pod [tolerations](https://kubernetes.io/docs/concepts/scheduling-eviction/taint-and-toleration/).
* [ProxyClass](/kb/1445/kubernetes-operator-customization) now supports the [`dnsConfig`](https://kubernetes.io/docs/concepts/services-networking/dns-pod-service/#pod-s-dns-policy) and [`dnsPolicy`](https://kubernetes.io/docs/concepts/services-networking/dns-pod-service/#pod-s-dns-policy) fields for refined DNS specifications.
* Reconciler logs are now sent to the Tailscale control plane in addition to the core client logs that are already sent. As before, this can be disabled by setting the [`TS\_NO\_LOGS\_NO\_SUPPORT`](/kb/1011/log-mesh-traffic#opting-out-of-client-logging) environment variable to `true` within the operator deployment.
A new release of the [Tailscale](/kb/1246/tailscale-ssh-session-recording) [`tsrecorder`](/kb/1246/tailscale-ssh-session-recording) is available. You can download it from [Docker Hub](https://hub.docker.com/r/tailscale/tsrecorder/tags).
* `tsrecorder` is updated with web interface search, filtering, and enhanced design. The web interface supports freeform text search for corresponding metadata such as user ID, date, and invoked commands.
* [`kubectl exec`](https://kubernetes.io/docs/reference/kubectl/generated/kubectl_exec/) sessions record as expected.
* Cached recordings on large datasets no longer fail if the caching process exceeds one minute.
* Recordings are no longer stopped when a session exceeds one minute.
* Use [workload identity federation](/kb/1581/workload-identity-federation) ([beta](/kb/1167/release-stages/#beta)) for creation of federated OIDC workload identities from third-party providers to authenticate requests to the [Tailscale API](/kb/1101/api).
* [`tailscale-client-go-v2`](https://github.com/tailscale/tailscale-client-go-v2) can use workload identity federation for authentication.
* The [Tailscale Terraform provider](/kb/1210/terraform-provider) can use workload identity federation for authentication.
* The [Tailscale GitHub Action](/kb/1276/tailscale-github-action) can use workload identity federation for auth key generation.
* The [`tailscale up`](/kb/1241/tailscale-up) command can use workload identity federation for auth key generation.
* OAuth client scopes and descriptions are editable in the **Trust credentials** page of the admin console.
* The **Trust credentials** page of the admin console replaces the **OAuth clients** page.
## [Oct 29, 2025](#2025-10-29)
* Administer [multiple tailnets](/kb/1509/multiple-tailnets) ([alpha](/kb/1167/release-stages#alpha)) under a single organization, using a common identity provider and domain.
* Use [Tailscale Peer Relays](/kb/1591/peer-relays) for client-to-client connections when direct connections aren't possible ([beta](/kb/1167/release-stages#beta)).
* Use the [visual policy editor](/kb/1550/visual-editor) to create and manage your tailnet policy file ([generally available](/kb/1167/release-stages#general-availability-ga)).
## [Oct 28, 2025](#2025-10-28)
###### All platforms
* A deadlock issue no longer occurs in the client when checking for the network to be available.
###### Linux
* [`tailscaled`](/kb/1278/tailscaled) no longer sporadically panics when a [Trusted Platform Module](/kb/1596/secure-node-state-storage) (TPM) device is present.
###### Windows
* [`tailscaled`](/kb/1278/tailscaled) no longer sporadically panics when a [Trusted Platform Module](/kb/1596/secure-node-state-storage) (TPM) device is present.
###### WASM
* The JS/WASM client used by [`tsconnect`](https://pkg.go.dev/tailscale.com/cmd/tsconnect) no longer crashes unexpectedly.
* Use [Tailscale Services](/kb/1552/tailscale-services) to decouple applications and services from the devices that host them ([beta](/kb/1167/release-stages#beta)).
## [Oct 27, 2025](#2025-10-27)
###### All platforms
* [`tailscaled`](/kb/1278/tailscaled) shuts down as expected and without panic.
###### Linux
* [`tailscaled`](/kb/1278/tailscaled) starts up as expected in a no router configuration environment.
###### macOS
* The Tailscale dock icon closes as expected when the client is not using the [windowed UI](/blog/windowed-macos-ui-beta) ([beta](/kb/1167/release-stages#general-availability-beta)).
###### FreeBSD
* [`tailscaled`](/kb/1278/tailscaled) starts up as expected in a no router configuration environment.
###### OpenBSD
* [`tailscaled`](/kb/1278/tailscaled) starts up as expected in a no router configuration environment.
## [Oct 24, 2025](#2025-10-24)
###### Linux
* An [`iptables`](/kb/1294/firewall-mode) regression on non-amd64/arm64 platforms is resolved, and the client starts as expected.
* Running Tailscale on devices equipped with Trusted Platform Module (TPM) 1.x no longer causes the [`tailscaled` daemon](/kb/1278/tailscaled) to fail.
* The [Tailscale GitHub Action](/kb/1276/tailscale-github-action) stops the background Tailscale processes when a CI job finishes.
* The [Tailscale GitHub Action](/kb/1276/tailscale-github-action) validates that tags are specified when using an OAuth client.
## [Oct 23, 2025](#2025-10-23)
**Note**: 1.90.0 was a [release candidate](/kb/1168/versions#release-candidate-track) intended for testing only.
###### All platforms
* Clients can use configured DNS resolvers for all domains even when the client also uses an exit node using the [nameserver](/kb/1054/dns#nameservers-and-exit-nodes) settings in the **DNS** page of the admin console.
* [Node keys](/kb/1010/node-keys) will be renewed seamlessly, so clients will maintain existing connections while re-authenticating.
* Go is updated to version 1.25.3.
* Unnecessary path discovery packets over [DERP servers](/kb/1232/derp-servers) are suppressed.
###### Linux
* Node key sealing is GA ([generally available](/kb/1167/release-stages#general-availability-ga)) and enabled by default. Existing nodes will migrate to node key sealing automatically on upgrade. For more information, including how to opt out, refer to [Secure node state storage](/kb/1596/secure-node-state-storage).
###### Windows
* Node key sealing is GA ([generally available](/kb/1167/release-stages#general-availability-ga)) and enabled by default. For more information, refer to [Secure node state storage](/kb/1596/secure-node-state-storage).
###### macOS
* The **Hide Dock Icon** checkbox located in **Settings** lets you remove the Tailscale icon from the macOS dock when the client window is closed.
* The [`tailscale drive`](/kb/1080/cli#drive) CLI command for sharing [Taildrive](/kb/1369/taildrive) directories is no longer available. Use the client GUI for sharing directories instead.
* Node key sealing is GA ([generally available](/kb/1167/release-stages#general-availability-ga)) and enabled by default. For more information, refer to [Secure node state storage](/kb/1596/secure-node-state-storage).
* [Exit node](/kb/1103/exit-nodes) selection using the [macOS Shortcuts](/kb/1233/mac-ios-shortcuts) app work as expected.
* Accounts displayed using the macOS menu bar Tailscale icon load as expected.
* Client users preference for automatic/recommended exit node selection is remembered as expected.
###### iOS
* [Exit node](/kb/1103/exit-nodes) selection using the [iOS Shortcuts](/kb/1233/mac-ios-shortcuts) app work as expected.
* Client users preference for automatic/recommended exit node selection is remembered as expected.
###### Android
* Client is able to establish [direct connections](/kb/1257/connection-types#direct-connections) as expected.
## [Oct 16, 2025](#2025-10-16)
**Note**: For more in-depth details about all the tailnet names and types, refer to [Tailnet name types](/kb/1217/tailnet-name).
* The **Display name** field is added to the **Settings** \> **General** page of the admin console. This is an optional field that lets you assign a custom [display name](/kb/1217/tailnet-name#display-name) to your tailnet that appears in the admin console, client UI, and client CLI, instead of your domain or email address.
* The **Tailnet ID** field is added to the **Settings** \> **General** page of the admin console. This string should be used in the `tailnetId` field for [Tailscale API](/kb/1101/api) path parameters instead of your organization name.
* The **Organization** field in **Settings** \> **General** page of the admin console is renamed **Legacy ID**. This field will continue to display for existing tailnets but will not display for newly created tailnets.
## [Oct 15, 2025](#2025-10-15)
* The [Tailscale GitHub Action](/kb/1276/tailscale-github-action) no longer logs the output of all shell commands to the runner's console unless debug logging is enabled.
* The [Tailscale GitHub Action](/kb/1276/tailscale-github-action) masks authentication secrets in logs unless debug logging is enabled.
## [Oct 14, 2025](#2025-10-14)
###### macOS
* The macOS Firewall system setting **Block all incoming connections** no longer causes intermittent connectivity disruptions when enabled.
A new release of the Tailscale container image is available. You can download it from [Docker Hub](https://hub.docker.com/r/tailscale/tailscale) or from our [GitHub packages repository](https://github.com/tailscale/tailscale/pkgs/container/tailscale).
**Note:** This version contains no changes except for library updates.
* The [Tailscale GitHub Action](/kb/1276/tailscale-github-action) no longer logs the output of the `tailscale status` command to the runner's console.
* The [Tailscale GitHub Action](/kb/1276/tailscale-github-action) supports a [`ping`](/kb/1276/tailscale-gibhub-action#ping-to-verify-connectivity) parameter to verify connectivity to tailnet devices.
* The Tailscale GitHub Action [logs out](/kb/1080/cli#logout) the Tailscale ephemeral node at the end of the CI run, removing it from the tailnet immediately.
* The Tailscale GitHub Action is implemented as a JavaScript action and requires runners that are capable of installing Node.js 24.
* [Caching](/kb/1276/tailscale-gibhub-action#cache-tailscale-binaries) of Tailscale binaries is enabled by default.
* DNS resolvers are properly set on macOS. Previously, attempting to reach devices using their full domain of the form `my-node.my-tailnet.ts.net` would fail due to incorrect DNS settings.
A new release of the [Tailscale Kubernetes operator](/kb/1236/kubernetes-operator) is available. For guidance on installing and updating, refer to our [installation instructions](/kb/1236/kubernetes-operator#installation).
**Note:** This version contains no changes except for library updates.
* [Preset apps](/kb/1339/preset-apps) are available for [Amazon AWS](https://aws.amazon.com) services such as Amazon CloudFront, Amazon EC2, and Amazon S3, [Salesforce (Hyperforce)](https://www.salesforce.com/platform/public-cloud-infrastructure), and [Microsoft 365](https://www.microsoft.com/en-us/microsoft-365).
A new release of the [Tailscale `tsrecorder`](/kb/1246/tailscale-ssh-session-recording) is available. You can download it from [Docker Hub](https://hub.docker.com/r/tailscale/tsrecorder/tags).
**Note:** This version contains no changes except for library updates.
## [Oct 9, 2025](#2025-10-09)
* Use [`autogroup:self`](/kb/1337/policy-syntax#autogroups) as a destination for any grant, ACL, or SSH `src` that includes `autogroup:\<role\>`, groups, or individual users in the tailnet policy file.
## [Oct 8, 2025](#2025-10-08)
* The Read and List endpoint responses in the [Devices API](api#tag/devices/get/tailnet/{tailnet}/devices) include a `connectedToControl` flag, which indicates whether the device has recently connected to the Tailscale control server.
* The `lastSeen` field is included only when `connectedToControl` is false.
## [Sep 29, 2025](#2025-09-29)
A new release of the Tailscale container image is available. You can download it from [Docker Hub](https://hub.docker.com/r/tailscale/tailscale) or from our [GitHub packages repository](https://github.com/tailscale/tailscale/pkgs/container/tailscale).
**Note:** This version contains no changes except for library updates.
A new release of the [Tailscale Kubernetes operator](/kb/1236/kubernetes-operator) is available. For guidance on installing and updating, refer to our [installation instructions](/kb/1236/kubernetes-operator#installation).
**Note:** This version contains no changes except for library updates.
A new release of the [Tailscale `tsrecorder`](/kb/1246/tailscale-ssh-session-recording) is available. You can download it from [Docker Hub](https://hub.docker.com/r/tailscale/tsrecorder/tags).
**Note:** This version contains no changes except for library updates.
## [Sep 25, 2025](#2025-09-25)
###### All platforms
* [Control plane](/kb/1508/control-data-planes#control-plane) connection issues which might have resulted in timing out during retries.
###### macOS
* [Taildrive](/kb/1369/taildrive) list of devices loads as expected when selecting **File Sharing** \> **Choose Shared Folders**.
###### iOS
* The UI and device list display as expected when initially connecting to the tailnet.
###### OpenBSD
* The client starts as expected when using the [`tailscale up`](/kb/1080/cli#up) command for the first time or re-authenticating a node.
## [Sep 18, 2025](#2025-09-18)
A new release of the Tailscale container image is available. You can download it from [Docker Hub](https://hub.docker.com/r/tailscale/tailscale) or from our [GitHub packages repository](https://github.com/tailscale/tailscale/pkgs/container/tailscale).
* [Kubernetes sidecars](/kb/1185/kubernetes#sample-sidecar) no longer error on first run if their state [Secret](https://kubernetes.io/docs/concepts/configuration/secret/) doesn't exist.
A new release of the [Tailscale Kubernetes operator](/kb/1236/kubernetes-operator) is available. For guidance on installing and updating, refer to our [installation instructions](/kb/1236/kubernetes-operator#installation).
* [ProxyClass](/kb/1445/kubernetes-operator-customization) resources supports setting a `priorityClassName` for created Pods.
* Connector resources can specify multiple replicas for [highly available subnet routers](/kb/1115/high-availability#subnet-router-high-availability), [app connectors](/kb/1115/high-availability#app-connector-high-availability), and [exit nodes](/kb/1103/exit-nodes).
* [DNSConfig](/kb/1438/kubernetes-operator-cluster-egress#expose-a-tailnet-https-service-to-your-cluster-workloads) resource works as expected for egress ProxyGroups.
* [Multi-cluster ingress](/kb/1541/kubernetes-operator-multi-cluster-ingress) devices no longer display an erroneous "Invalid certificate" message in the **Machines** page of the admin console.
A new release of the [Tailscale `tsrecorder`](/kb/1246/tailscale-ssh-session-recording) is available. You can download it from [Docker Hub](https://hub.docker.com/r/tailscale/tsrecorder/tags).
**Note:** This version contains no changes except for library updates.
## [Sep 17, 2025](#2025-09-17)
###### macOS
* The **Settings** button displays correctly when no account is logged in to the client.
* [UserDefaults](https://developer.apple.com/documentation/foundation/userdefaults), which apps and [system policies](/kb/1315/mdm-keys) use to store and read preferences, force string values like `true` or `1` into Booleans as expected.
###### iOS
* [UserDefaults](https://developer.apple.com/documentation/foundation/userdefaults), which apps and [system policies](/kb/1315/mdm-keys) use to store and read preferences, force string values like `true` or `1` into Booleans as expected.
## [Sep 11, 2025](#2025-09-11)
**Note:** v1.88.0 was an internal-only release.
###### All platforms
* [Tailscale CLI](/kb/1080/cli) prompts users to confirm with `y/n` before proceeding with impactful actions.
* Go is updated to version 1.25.1.
* [Tailscale SSH](/kb/1193/tailscale-ssh) works as expected when using an IP address instead of a hostname and [MagicDNS](/kb/1081/magicdns) is disabled.
* [Taildrive](/kb/1369/taildrive) folder sharing works correctly even when the `su` command is not present on the Linux or other Unix-like host.
* Taildrive files remain consistently accessible.
###### Linux
* The [system tray application](/kb/1597/linux-systray) for Linux desktops can be enabled to display some of the GUI options available in other Tailscale clients, including [fast user switching](/kb/1225/fast-user-switching) and [exit node](/kb/1408/quick-guide-exit-nodes) selection.
###### Windows
* The existing [`ExitNodeID=auto:any`](/kb/1315/mdm-keys#force-an-exit-node-to-always-be-used) system policy supports the new `ExitNode.AllowOverride` policy option that lets users select a different exit node while still requiring exit node usage.
###### macOS
* The existing [`ExitNodeID=auto:any`](/kb/1315/mdm-keys#force-an-exit-node-to-always-be-used) system policy supports the new `ExitNode.AllowOverride` policy option that lets users select a different exit node while still requiring exit node usage.
* Windowed UI mode ([beta](/kb/1167/release-stages#beta)) provides an updated client experience. To test, go to the **Settings** page of the admin console and toggle **Redesigned macOS Client UI**. Once enabled, all macOS clients display the new interface.
* `UseSystemProxy` default setting to indicate whether Tailscale respects proxy settings defined in **System Settings**.
* [`advertiseExitNode`](/kb/1315/mdm-keys#advertise-exit-node) system policy is available on macOS.
* macOS 12 is the minimum supported version.
* Automatic recommended exit node selection.
* UI improvements for iOS 26 and macOS 26 compatibility.
###### iOS
* UI improvements for iOS 26 and macOS 26 compatibility.
###### QNAP
* New [QNAP](/kb/1273/qnap) builds are available again. At the time of this release, you can manually download the update from our [packages site](https://pkgs.tailscale.com/stable/#qpkgs). After a period of time, the update will also be available in [QNAP App Center](https://www.qnap.com/en/app-center).
* The IPv4 and IPv6 addresses for the Singapore [DERP servers](/kb/1232/derp-servers) have changed. If you use custom firewall settings that rely on these addresses specifically, refer to the information in our DERP map and make the necessary updates. Otherwise, no action is required.
## [Sep 10, 2025](#2025-09-10)
* The IPv4 and IPv6 addresses for the Tokyo [DERP servers](/kb/1232/derp-servers) have changed. If you use custom firewall settings that rely on these addresses specifically, refer to the information in our DERP map and make the necessary updates. Otherwise, no action is required.
## [Sep 9, 2025](#2025-09-09)
* The IPv4 and IPv6 addresses for the Sydney [DERP servers](/kb/1232/derp-servers) have changed. If you use custom firewall settings that rely on these addresses specifically, refer to the information in our DERP map and make the necessary updates. Otherwise, no action is required.
## [Aug 22, 2025](#2025-08-22)
A new release of the Tailscale container image is available. You can download it from [Docker Hub](https://hub.docker.com/r/tailscale/tailscale) or from our [GitHub packages repository](https://github.com/tailscale/tailscale/pkgs/container/tailscale).
**Note:** This version contains no changes except for library updates.
A new release of the [Tailscale Kubernetes operator](/kb/1236/kubernetes-operator) is available. For guidance on installing and updating, refer to our [installation instructions](/kb/1236/kubernetes-operator#installation).
* DNS lookup errors that occur when routing traffic for a `ProxyGroup` of type `kube-apiserver` while running the [API server proxy](/kb/1437/kubernetes-operator-api-server-proxy) in high-availability mode.
A new release of the [Tailscale `tsrecorder`](/kb/1246/tailscale-ssh-session-recording) is available. You can download it from [Docker Hub](https://hub.docker.com/r/tailscale/tsrecorder/tags).
**Note:** This version contains no changes except for library updates.
## [Aug 19, 2025](#2025-08-19)
* The IPv4 and IPv6 addresses for the São Paulo [DERP servers](/kb/1232/derp-servers) have changed. If you use custom firewall settings that rely on these addresses specifically, refer to the information in our DERP map and make the necessary updates. Otherwise, no action is required.
## [Aug 7, 2025](#2025-08-07)
**Note:** v1.86.3 was an internal-only release.
###### macOS
* [`EncryptState`](/kb/1315/mdm-keys#encrypt-node-state-file) system policy changes are applied without needing to restart the [system extension](/kb/1340/macos-sysext).
* Startup crash on a fresh install of the [Standalone variant](/kb/1065/macos-variants#standalone-variant) of the client when the `EncryptState` system policy is enabled.
###### Android
* Persistent notifications about the [Taildrop](/kb/1106/taildrop) directory picker. The notification only displays on the first attempt to use the feature.
## [Aug 5, 2025](#2025-08-05)
* Use the [visual policy editor](/kb/1550/visual-editor) to manage your tailnet policy file ([beta](/kb/1167/release-stages#beta)).
## [Jul 31, 2025](#2025-07-31)
A new release of the Tailscale container image is available. You can download it from [Docker Hub](https://hub.docker.com/r/tailscale/tailscale) or from our [GitHub packages repository](https://github.com/tailscale/tailscale/pkgs/container/tailscale).
**Note:** We previously referred to this as the Tailscale Docker image and now refer to it more generically as the Tailscale container image.
* Improved direct connectivity to `ProxyGroup` Pods by using external node IP addresses as [static endpoints](/kb/1445/kubernetes-operator-customization#static-endpoints).
* Pod-specific state is cleared on start when running in Kubernetes.
A new release of the [Tailscale Kubernetes operator](/kb/1236/kubernetes-operator) is available. For guidance on installing and updating, refer to our [installation instructions](/kb/1236/kubernetes-operator#installation).
* The first release of [Tailscale Kubernetes proxy](/kb/1437/kubernetes-operator-api-server-proxy) is available.
* Record `kubectl attach` and `kubectl debug` sessions to [`tsrecorder`](/kb/1454/kubernetes-operator-session-recording).
* Helm chart outputs suggests next steps after [installation](/kb/1236/kubernetes-operator#installation).
* `ProxyGroup` type `kube-apiserver` for running the [API server proxy](/kb/1437/kubernetes-operator-api-server-proxy) in a high-availability mode.
* `ProxyClass` can use [annotations instead of labels](/kb/1445/kubernetes-operator-customization#customizing-tags). We recommend using annotations, but labels will continue to work.
* Custom Ingress class names are supported instead of the default `tailscale` class name.
* Static cluster IP for DNSConfig nameservers.
* Improved direct connectivity to `ProxyGroup` Pods by using external node IP addresses as [static endpoints](/kb/1445/kubernetes-operator-customization#static-endpoints).
* Tags passed to Tailscale Kubernetes Services are validated using `tailscale.com/tags` annotation to validate ACL tags.
* Kubernetes operator validates that a cluster does not contain more than one Tailscale Kubernetes Service that refers to the same Tailscale Service.
* Reliability of `ProxyGroup` proxies when updated and restarted.
A new release of the [Tailscale `tsrecorder`](/kb/1246/tailscale-ssh-session-recording) is available. You can download it from [Docker Hub](https://hub.docker.com/r/tailscale/tsrecorder/tags).
**Note:** This version contains no changes except for library updates.
## [Jul 29, 2025](#2025-07-29)
**Note:** v1.86.1 was an internal-only release.
###### All platforms
* A deadlock issue that may have occurred in the client.
* An occasional crash when establishing a new port mapping with a gateway or firewall.
###### macOS
* Issue preventing the reading of existing state files that may have required device re-approval if [device approval](/kb/1099/device-approval) is enabled on the tailnet.
* A spurious warning about uninstalling the system extension when upgrading the client.
* [`tailscale syspolicy`](/kb/1080/cli#syspolicy) CLI command output displays correctly when the `KeyExpirationNotice` or `ReconnectAfter` [system policies](/kb/1315/mdm-keys) are configured.
###### Windows
* [`tailscale syspolicy`](/kb/1080/cli#syspolicy) CLI command output displays correctly when the `KeyExpirationNotice` or `ReconnectAfter` [system policies](/kb/1315/mdm-keys) are configured.
## [Jul 24, 2025](#2025-07-24)
**Note:** Tailscale halted the rollout of version 1.86.0 for macOS on July 25, 2025, and for all other platforms on July 28, 2025, due to multiple regressions.
###### All platforms
* [`tsStateEncrypted`](/kb/1288/device-posture#device-posture-attributes) device posture attribute for checking whether the Tailscale client state is encrypted at rest.
* [Cross-site request forgery (CSRF)](https://en.wikipedia.org/wiki/Cross-site_request_forgery) issue that may have resulted in a log in error when accessing the [web interface](/kb/1325/device-web-interface).
* Hostnames are verified as expected when using CONNECT HTTPS proxy to connect to the [control plane](/kb/1508/control-data-planes).
* [Recommended exit node](/kb/1392/auto-exit-nodes) when the previously recommended exit node is offline.
###### Linux
* [`tailscale up --exit-node=auto:any`](/kb/1241/tailscale-up) and [`tailscale set --exit-node=auto:any`](/kb/1080/cli#set) CLI commands track the [recommended exit node](/kb/1392/auto-exit-nodes) and automatically switches to it when available exit nodes or network conditions change.
* [`tailscaled`](/kb/1278/tailscaled) CLI command flag `--encrypt-state` encrypts the node state file on the disk using [trusted platform module (TPM)](https://en.wikipedia.org/wiki/Trusted_Platform_Module).
###### Windows
* [`tailscale up --exit-node=auto:any`](/kb/1241/tailscale-up) and [`tailscale set --exit-node=auto:any`](/kb/1080/cli#set) CLI commands track the [recommended exit node](/kb/1392/auto-exit-nodes) and automatically switches to it when available exit nodes or network conditions change.
* [`EncryptState`](/kb/1315/mdm-keys#encrypt-node-state-file) system policy enforces storing the node state file in encrypted format on disk using [trusted platform module (TPM)](https://en.wikipedia.org/wiki/Trusted_Platform_Module).
* Selecting **Recommended** from the exit node picker makes the Tailscale client track the [recommended exit node](/kb/1392/auto-exit-nodes) and automatically switch to it when available exit nodes or network conditions change.
* [`AlwaysOn`](/kb/1315/mdm-keys#set-tailscale-to-always-be-connected) system policy is enforced as expected.
* System tray icon display a notification when the selected exit node is unavailable.
* [Mullvad exit node](/kb/1258/mullvad-exit-nodes) picker hides after switching from a profile with Mullvad exit nodes to one without any exit nodes.
* WDAP/PAC proxy detection on Windows 10 1607 and earlier to ensure successful connectivity when a proxy is required.
###### macOS
* [`tailscale up --exit-node=auto:any`](/kb/1241/tailscale-up) and [`tailscale set --exit-node=auto:any`](/kb/1080/cli#set) CLI commands track the [recommended exit node](/kb/1392/auto-exit-nodes) and automatically switches to it when available exit nodes or network conditions change.
* [`ReconnectAfter`](/kb/1315/mdm-keys#set-a-reconnection-timer) system policy setting, which configures the maximum period of time between a user disconnecting Tailscale and the client automatically reconnecting.
* [`EncryptState`](/kb/1315/mdm-keys#encrypt-node-state-file) system policy enforces storing the node state file in the [Keychain](https://support.apple.com/guide/keychain-access/what-is-keychain-access-kyca1083/mac). The App Store variant of the client always uses the Keychain regardless of this setting.
* [`OnboardingFlow`](/kb/1315/mdm-keys#suppress-the-first-launch-onboarding-flow) system policy enforces the suppression of the onboarding flow that displays when the client is installed. This replaces the deprecated [`TailscaleOnboardingSeen`](/kb/1315/mdm-keys#suppress-the-first-launch-onboarding-flow) system policy.
* **Remove all accounts** option in the [**Debug**](/kb/1023/troubleshooting#debug-menu-and-options) menu.
* [`TailscaleOnboardingSeen`](/kb/1315/mdm-keys#suppress-the-first-launch-onboarding-flow) system policy is deprecated. Use the new [`OnboardingFlow`](/kb/1315/mdm-keys#suppress-the-first-launch-onboarding-flow) system policy instead.
* Selecting **Recommended** from the exit node picker makes the Tailscale client track the [recommended exit node](/kb/1392/auto-exit-nodes) and automatically switch to it when available exit nodes or network conditions change.
* [`AlwaysOn`](/kb/1315/mdm-keys#set-tailscale-to-always-be-connected) system policy is enforced as expected.
* [Shortcut](/kb/1233/mac-ios-shortcuts) action issues.
###### iOS
* Selecting **Recommended** from the exit node picker makes the Tailscale client track the [recommended exit node](/kb/1392/auto-exit-nodes) and automatically switches to it when available exit nodes or network conditions change.
* **Reset keychain** option issues.
* [Shortcut](/kb/1233/mac-ios-shortcuts) action issues.
* [Taildrop](/kb/1106/taildrop) resending issues.
###### tvOS
* Selecting **Recommended** from the exit node picker makes the Tailscale client track the [recommended exit node](/kb/1392/auto-exit-nodes) and automatically switch to it when available exit nodes or network conditions change.
* Securely connect private data sources to [Grafana](/kb/1523/grafana) Cloud with Tailscale ([beta](/kb/1167/release-stages/#beta)).
## [Jul 17, 2025](#2025-07-17)
* The domains `login.tailscale.com`, `controlplane.tailscale.com`, and `api.tailscale.com` resolve to static IP address ranges registered and managed by Tailscale. If IP-based rules are required for your firewall, use the IPv4 range `192.200.0.0/24` and the IPv6 range `2606:B740:49::/48`.
**Note:** In most cases, you do not need to configure firewall rules to use Tailscale. For more information, refer to [What firewall ports should I open to use Tailscale?](/kb/1082/firewall-ports)
## [Jun 26, 2025](#2025-06-26)
**Note:** The Tailscale v1.84.3 client release includes fixes for Android TV only, and is exclusively released for Android TV.
###### Android TV
* Internal issue.
A new release of the [Tailscale Docker image](/kb/1282/docker) is available. You can download it from [Docker Hub](https://hub.docker.com/r/tailscale/tailscale) or from our [GitHub packages repository](https://github.com/tailscale/tailscale/pkgs/container/tailscale).
**Note:** This version contains no changes except for library updates.
* The [Tailscale GitHub Action](/kb/1276/tailscale-github-action) works on headless Windows-based [runners](https://docs.github.com/en/actions/about-github-actions/understanding-github-actions#runners) for systems that do not have a graphical desktop environment. Previously, running `tailscale up` would fail on systems such as Windows 11 Arm64 due to the missing `--unattended` argument required to enable [unattended mode](/kb/1088/run-unattended).
A new release of the [Tailscale Kubernetes operator](/kb/1236/kubernetes-operator) is available. For guidance on installing and updating, refer to our [installation instructions](/kb/1236/kubernetes-operator#installation).
* Issue in high availability (HA) ingress that prevents the `Ingress` proxies from issuing TLS certificates on initial startup.
A new release of the [Tailscale `tsrecorder`](/kb/1246/tailscale-ssh-session-recording) is available. You can download it from [Docker Hub](https://hub.docker.com/r/tailscale/tsrecorder/tags).
**Note:** This version contains no changes except for library updates.
## [Jun 23, 2025](#2025-06-23)
* Tailnet Lock GA ([generally available](/kb/1167/release-stages/#general-availability-ga))
* Use [Tailnet Lock](/kb/1226/tailnet-lock) to require your tailnet to verify new node keys distributed by the [coordination server](/kb/1155/terminology-and-concepts/#coordination-server) before trusting them.
## [Jun 9, 2025](#2025-06-09)
###### Windows
* This release is signed with a new code signing certificate. The certificate subject and issuer remain unchanged, but the certificate has a new serial number.
A new release of the [Tailscale Docker image](/kb/1282/docker) is available. You can download it from [Docker Hub](https://hub.docker.com/r/tailscale/tailscale) or from our [GitHub packages repository](https://github.com/tailscale/tailscale/pkgs/container/tailscale).
* Re-enable setting `—accept-dns` by using `TS\_EXTRA\_ARGS`. This issue resulted from stricter CLI arguments parsing introduced in Tailscale v1.84.0.
A new release of the [Tailscale Kubernetes operator](/kb/1236/kubernetes-operator) is available. For guidance on installing and updating, refer to our [installation instructions](/kb/1236/kubernetes-operator#installation).
* Explicitly specify protocol for Tailscale Services backing HA Ingress.
A new release of the [Tailscale `tsrecorder`](/kb/1246/tailscale-ssh-session-recording) is available. You can download it from [Docker Hub](https://hub.docker.com/r/tailscale/tsrecorder/tags).
**Note:** This version contains no changes except for library updates.
## [Jun 3, 2025](#2025-06-03)
* App connectors GA ([generally available](/kb/1167/release-stages/#general-availability-ga))
* Secure your software as a service (SaaS) application connections to your tailnet with [app connectors](/kb/1342/app-connectors-setup).
* **Policy file management** page in the admin console. Use the **Policy file management** page to prevent accidental policy file changes.
* Use the **External reference** section in the **Policy file management** page to specify the URL for your [GitOps for Tailscale](/kb/1204/gitops-acls) repository.
* We deprecated the GitOps code comment technique for specifying the URL for your GitOps for Tailscale repository. Use the **Policy file management** page in the admin console instead. If you use both the **Policy file management** page and the code comment technique, the **Policy file management** setting has precedence.
## [May 29, 2025](#2025-05-29)
###### macOS
* DNS drops when changing networks.
###### iOS
* Setting to toggle subnet routing.
* Issue where Taildrop notifications may not be presented.
* Issue where subnet routing would default to off.
###### Android
* Issue where Mullvad nodes may be listed as tailnet devices.
* Issue where subnet routing would default to off.
* Present a modal dialog that explains why you are prompted to select a directory.
* Use [grants](/kb/1324/grants) to define unified network and application layer access controls ([generally available](/kb/1167/release-stages#general-availability-ga)).
* **Note**: The default tailnet policy file now uses [grants syntax](/kb/1538/grants-syntax) instead of the original ACL syntax, but makes no changes to the effective permissions. This applies to all new tailnets and any tailnet policy file that has never been edited.
* Use [`via`](/kb/1378/via) to control how traffic routes from a source to a destination, such as through specific exit nodes, subnet routers, or app connectors ([generally available](/kb/1167/release-stages#general-availability-ga)).
## [May 23, 2025](#2025-05-23)
A new release of the [Tailscale Docker image](/kb/1282/docker) is available. You can download it from [Docker Hub](https://hub.docker.com/r/tailscale/tailscale) or from our [GitHub packages repository](https://github.com/tailscale/tailscale/pkgs/container/tailscale).
**Note:** This version contains no changes except for library updates.
A new release of the [Tailscale Kubernetes operator](/kb/1236/kubernetes-operator) is available. For guidance on installing and updating, refer to our [installation instructions](/kb/1236/kubernetes-operator#installation).
* Tailscale [`Ingress`](/kb/1439/kubernetes-operator-cluster-ingress#ingress-resource) resource supports high availability (HA) mode and multiplexing by using a `ProxyGroup`. You can expose an `Ingress` resource to a tailnet by using multiple active proxy replicas (`Pod`s). You can multiplex multiple `Ingress` resources on the same set of proxy `Pod`s.
* Tailscale Kubernetes Services support HA mode and multiplexing. You can expose a cluster app to a tailnet by using multiple active network layer proxy `Pod`s to help prevent downtime. You can expose multiple apps to a tailnet on the same set of proxy `Pod`s.
* Tailscale `Ingress` supports exposing applications deployed across multiple clusters (multi-cluster `Ingress`) to the tailnet.
* `Pod`s deployed for a `Recorder` resource can use AWS IAM Roles for Service Accounts (IRSA) instead of static Amazon S3 credentials by configuring the created `ServiceAccount` object's name and annotations.
* Tailscale Kubernetes Services support exposing to tailnet applications that are deployed across multiple clusters (multi-cluster `Service`).
* Tailscale Kubernetes operator needs to watch `EndpointSlice` objects at cluster scope, to ensure failover for multi-cluster `Service` and `Ingress` resources in cases where there are no healthy backends in one of the clusters.
* The Kubernetes Operator will default any path left unset on an `Ingress` resource to the `/` path.
A new release of the [Tailscale `tsrecorder`](/kb/1246/tailscale-ssh-session-recording) is available. You can download it from [Docker Hub](https://hub.docker.com/r/tailscale/tsrecorder/tags).
**Note:** This version contains no changes except for library updates.
## [May 21, 2025](#2025-05-21)
###### All platforms
* The `--reason` flag is added to the [`tailscale down`](/kb/1080/cli#down) command.
* [Tailscale CLI](/kb/1080/cli) commands throw an error if multiple of the same flag are detected.
* Network connectivity issues when creating a new profile or switching profiles while using an exit node.
###### Linux
* DNS-over-TCP fallback works correctly with upstream servers reachable only via the tailnet.
###### Windows
* [`AlwaysOn.Enabled`](/kb/1315/mdm-keys#set-tailscale-to-always-be-connected) and [`AlwaysOn.OverrideWithReason`](/kb/1315/mdm-keys#set-a-required-reason-for-disconnection) policy settings, which enable and configure a Tailscale client mode where the client stays connected at all times, unless an exception applies.
* [`ReconnectAfter`](/kb/1315/mdm-keys#set-a-reconnection-timer) policy setting, which configures the maximum period of time between a user disconnecting Tailscale and the client automatically reconnecting.
* When **Always On** mode is enabled, Tailscale connects as soon as a user signs in to the device and stays connected, regardless of whether the GUI is running. This enables access to tailnet resources, such as network-mapped drives, earlier in the sign-in process, and can also be used on headless Windows environments.
* [`EnableDNSRegistration`](/kb/1315/mdm-keys#force-tailscale-ip-registration-in-active-directory) policy setting, which configures whether Tailscale IP addresses should be registered with Active Directory DNS.
* The Tailscale GUI starts for all signed-in users when the client is installed.
* DNS-over-TCP fallback works correctly with upstream servers reachable only via the tailnet.
* Issue where the Tailscale GUI would not start if the client was installed via Group Policy or mobile device management (MDM) while a user was already signed in.
* Issue where the Tailscale GUI did not auto-start after a client update.
###### macOS
* [`AlwaysOn.Enabled`](/kb/1315/mdm-keys#set-tailscale-to-always-be-connected) and [`AlwaysOn.OverrideWithReason`](/kb/1315/mdm-keys#set-a-required-reason-for-disconnection) policy settings, which enable and configure a Tailscale client mode where the client stays connected at all times, unless an exception applies.
* `ForceEnabled` policy setting is deprecated in favor of the `AlwaysOn` policy setting.
* DNS-over-TCP fallback works correctly with upstream servers reachable only via the tailnet.
* Tailscale automatically recreates and/or reactivates its VPN configuration on start.
* Occasional crash in client during engine updates.
* [Taildrop](/kb/1106/taildrop) share sheet displays the correct error page when the tunnel is not connected.
* Hostname detection is improved in macOS clients running on macOS v15.x.
* Client (GUI) logs are properly captured and recorded in bug reports.
###### iOS
* [`AlwaysOn.Enabled`](/kb/1315/mdm-keys#set-tailscale-to-always-be-connected) and [`AlwaysOn.OverrideWithReason`](/kb/1315/mdm-keys#set-a-required-reason-for-disconnection) policy settings, which enable and configure a Tailscale client mode where the client stays connected at all times, unless an exception applies.
* `ForceEnabled` policy setting is deprecated in favor of the `AlwaysOn` policy setting.
* [Taildrop](/kb/1106/taildrop) share sheet displays the correct error page when the tunnel is not connected.
* Tailscale automatically recreates and/or reactivates its VPN configuration on start.
* Client (GUI) logs are properly captured and recorded in bug reports.
* Occasional crash in client during engine updates.
###### tvOS
* Tailscale automatically recreates and/or reactivates its VPN configuration on start.
* Client (GUI) logs are properly captured and recorded in bug reports.
* Occasional crash in client during engine updates.
###### Android
* [`ReconnectAfter`](/kb/1315/mdm-keys#set-a-reconnection-timer) policy setting, which configures the maximum period of time between a user disconnecting Tailscale and the client automatically reconnecting.
* Issue where Tailscale was disconnecting after excluding apps via split tunneling.
## [May 5, 2025](#2025-05-05)
A new release of the [Tailscale Docker image](/kb/1282/docker) is available. You can download it from [Docker Hub](https://hub.docker.com/r/tailscale/tailscale) or from our [GitHub packages repo](https://github.com/tailscale/tailscale/pkgs/container/tailscale).
**Note:** This version contains no changes except for library updates.
A new release of the [Tailscale Kubernetes operator](/kb/1236/kubernetes-operator) is available. For guidance on installing and updating, see our [installation instructions](/kb/1236/kubernetes-operator#installation).
**Note:** This version contains no changes except for library updates.
* The [Keys management APIs](https://tailscale.com/api#tag/keys) and [Terraform Provider](https://registry.terraform.io/providers/tailscale/tailscale) support managing [OAuth clients](/kb/1215/oauth-clients) programmatically.
A new release of the [Tailscale `tsrecorder`](/kb/1246/tailscale-ssh-session-recording) is available. You can download it from [Docker Hub](https://hub.docker.com/r/tailscale/tsrecorder/tags).
**Note:** This version contains no changes except for library updates.
## [Apr 22, 2025](#2025-04-22)
* We made a change to how [device posture](/kb/1288/device-posture) integrations are scheduled, prioritizing syncing of attributes for new nodes. Tailnets that use device posture integrations should see third-party attributes populated for new nodes faster than before.
## [Apr 21, 2025](#2025-04-21)
* The ACL editor in the **Access Controls** page of the admin console supports code folding, improving usability when navigating and managing large tailnet policy files. Collapse and expand sections like `hosts` and `groups` for a cleaner editing experience.
## [Apr 17, 2025](#2025-04-17)
###### All platforms
* A panic issue related to [CUBIC congestion control](https://en.wikipedia.org/wiki/CUBIC_TCP) in [userspace mode](/kb/1112/userspace-networking) is resolved.
###### macOS
* The VPN approval message during the client installation displays as expected.
* An issue related to the reachability of upstream DNS servers with loopback IPs is resolved.
###### Windows
* A service panic issue on the 32-bit version of Windows 10 is resolved.
## [Apr 15, 2025](#2025-04-15)
**Note:** Tailscale v1.82.4 includes fixes for Android devices only, and is exclusively released for Android. Tailscale v1.82.2 and v1.82.3 were internal-only releases.
###### Android
* An issue that might have resulted in the Tailscale app crashing on devices running versions earlier than Android 13 is resolved.
## [Apr 9, 2025](#2025-04-09)
* Use the [Tailscale GitHub Action](https://github.com/tailscale/github-action) on macOS and Windows [runners](https://docs.github.com/en/actions/about-github-actions/understanding-github-actions#runners) ([generally available](/kb/1167/release-stages/#general-availability-ga)). For more information, see the topic [Tailscale GitHub Action](/kb/1276/tailscale-github-action).
* The Tailscale GitHub Action supports caching Tailscale binaries when the `use-cache` input is set to `'true'`.
v0.19.0 of the [Tailscale Terraform Provider](https://registry.terraform.io/providers/tailscale/tailscale/latest) has been released with the following changes:
* [tailscale\_logstream\_configuration](https://registry.terraform.io/providers/tailscale/tailscale/latest/docs/resources/logstream_configuration) resource supports configuring `uploadPeriodMinutes` and `compressionFormat`.
## [Apr 2, 2025](#2025-04-02)
* Use [Tailscale Kubernetes Operator session recording](/kb/1454/kubernetes-operator-session-recording) to record [kubectl exec](https://kubernetes.io/docs/reference/kubectl/generated/kubectl_exec/) session contents when using the [Kubernetes API server proxy](/kb/1437/kubernetes-operator-api-server-proxy) ([beta](/kb/1167/release-stages#beta)).
* [Tailscale Kubernetes Operator](/kb/1236/kubernetes-operator) GA ([generally available](/kb/1167/release-stages/#general-availability-ga)).
* Use the Kubernetes Operator to integrate Tailscale with Kubernetes clusters.
## [Mar 31, 2025](#2025-03-31)
A new release of the [Tailscale Docker image](/kb/1282/docker) is available. You can download it from [Docker Hub](https://hub.docker.com/r/tailscale/tailscale) or from our [GitHub packages repo](https://github.com/tailscale/tailscale/pkgs/container/tailscale).
* Alpine image is updated to version 3.19.
A new release of the [Tailscale Kubernetes operator](/kb/1236/kubernetes-operator) is available. For guidance on installing and updating, see our [installation instructions](/kb/1236/kubernetes-operator#installation).
* Ingress TLS certificates can be issued from [Let's Encrypt's staging environment](https://letsencrypt.org/docs/staging-environment/) to avoid bumping into rate limits during initial setup. See our [GitHub documentation on ProxyClass APIs](https://github.com/tailscale/tailscale/blob/main/k8s-operator/api.md#proxyclassspec) to learn more.
* Alpine image is updated to version 3.19.
A new release of the [Tailscale `tsrecorder`](/kb/1246/tailscale-ssh-session-recording) is available. You can download it from [Docker Hub](https://hub.docker.com/r/tailscale/tsrecorder/tags).
**Note:** This version contains no changes except for library updates.
## [Mar 27, 2025](#2025-03-27)
**Note:** v1.82.1 includes fixes for Android devices only, and is exclusively released for Android.
###### Android
* Device search is available on Android TV running Android 13 or later.
* Enhanced device search UI is available on all devices running Android 13 or later.
## [Mar 26, 2025](#2025-03-26)
###### All platforms
* [DERP](/kb/1232/derp-servers) functionality within the client supports certificate pinning for self-signed IP address certificates for those unable to use [Let's Encrypt](https://letsencrypt.org/) or WebPKI certificates.
* Go is updated to version 1.24.1
* NAT traversal code uses the DERP connection that a packet arrived on as an ultimate fallback route if no other information is available, in the event of a slow or misbehaving server.
* [Captive portal](/kb/1457/captive-portals) detection reliability is improved on some in-flight Wi-Fi networks, including British Airways and WestJet.
* Port mapping success rate is improved by retrying in additional error cases.
* [Web interface](/kb/1325/device-web-interface) setting changes occur as expected and without error.
###### macOS
* The [.pkg installer](https://pkgs.tailscale.com/stable/#macos) size is decreased by 35%.
* Memory leak issue related to [shortcuts](/kb/1233/mac-ios-shortcuts) is resolved.
* [MagicDNS](/kb/1081/magicdns) intermittent configuration failures no longer occur when waking from sleep.
* Seamless [key renewals](/kb/1028/key-expiry#renewing-keys-for-an-expired-device) occur as expected, ensuring the client remains connected.
###### iOS
* Memory leak issue related to [shortcuts](/kb/1233/mac-ios-shortcuts) is resolved.
* [MagicDNS](/kb/1081/magicdns) intermittent configuration failures no longer occur when waking from sleep.
###### Android
**Note:** The Android client release for v1.82.0 was delayed and moved into the v1.82.1 client release instead.
###### App connectors
* [Port mapping](/kb/1411/device-connectivity#port-mapping) success rates for [app connectors](/kb/1281/app-connectors) are improved.
## [Mar 13, 2025](#2025-03-13)
* The [Tailscale GitHub Action](https://github.com/tailscale/github-action) supports running on Windows [runners](https://docs.github.com/en/actions/about-github-actions/understanding-github-actions#runners) ([beta](/kb/1167/release-stages/#beta)).
* The [Tailscale GitHub Action](https://github.com/tailscale/github-action) supports running on macOS [runners](https://docs.github.com/en/actions/about-github-actions/understanding-github-actions#runners) ([beta](/kb/1167/release-stages/#beta)).
## [Mar 7, 2025](#2025-03-07)
* An issue related to admin console sessions remaining active longer than the configured [console session inactivity timeouts](/kb/1461/admin-console-session-timeout) ([TS-2025-001](/security-bulletins/#ts-2025-001)).
## [Mar 5, 2025](#2025-03-05)
* Helsinki is added as a [DERP region](/kb/1232/derp-servers).
* Promo codes can be applied when upgrading to a Tailscale [paid plan](/pricing) in the **Billing** page of the admin console. While upgrading your plan, go to the **Upgrading to** section and select **Apply promo code**. For more information, see [Pricing & Plans FAQ](/kb/1251/pricing-faq#how-do-i-get-a-tailscale-promo-code).
## [Mar 4, 2025](#2025-03-04)
###### Linux
* [Web interface](/kb/1325/device-web-interface) setting changes occur as expected and without error.
###### App connectors
* [App connectors](/kb/1281/app-connectors) respond to DNS queries and update routes without failure. Previously, DNS resolution failures may have occurred due to a routing deadlock issue.
A new release of the [Tailscale Docker image](/kb/1282/docker) is available. You can download it from [Docker Hub](https://hub.docker.com/r/tailscale/tailscale) or from our [GitHub packages repo](https://github.com/tailscale/tailscale/pkgs/container/tailscale).
**Note:** This version contains no changes except for library updates.
A new release of the [Tailscale Kubernetes operator](/kb/1236/kubernetes-operator) is available. For guidance on installing and updating, see our [installation instructions](/kb/1236/kubernetes-operator#installation).
**Note:** This version contains no changes except for library updates.
A new release of the [Tailscale `tsrecorder`](/kb/1246/tailscale-ssh-session-recording) is available. You can download it from [Docker Hub](https://hub.docker.com/r/tailscale/tsrecorder/tags).
**Note:** This version contains no changes except for library updates.
## [Feb 26, 2025](#2025-02-26)
v0.18.0 of the [Tailscale Terraform Provider](https://registry.terraform.io/providers/tailscale/tailscale/latest) has been released with the following changes:
* The [tailscale\_logstream\_configuration](https://registry.terraform.io/providers/tailscale/tailscale/latest/docs/resources/logstream_configuration) resource can now manage streaming to [Amazon S3](/kb/1255/log-streaming?tab=amazon+s3#add-configuration-log-streaming) and [S3-compatible services](/kb/1255/log-streaming?tab=s3-compatible#add-configuration-log-streaming)
* The [tailscale\_tailnet\_key](https://registry.terraform.io/providers/tailscale/tailscale/latest/docs/resources/tailnet_key) resource can now be imported.
* Added a `reset\_acl\_on\_destroy` property to the [tailscale\_acl](https://registry.terraform.io/providers/tailscale/tailscale/latest/docs/resources/acl) resource which optionally allows for resetting the Tailscale policy file to its default when the resource is destroyed.
## [Feb 13, 2025](#2025-02-13)
* Ashburn and Nuremberg are added as [DERP regions](/kb/1232/derp-servers). We added them December 5, 2024, and apologize for the late notice.
###### All platforms
* Nodes could lose the display names of owners of peers in rare cases. This had manifested in missing names in [`tailscale status`](/kb/1080/cli#status) and could prevent incoming [Tailscale SSH](/kb/1193/tailscale-ssh) connections from being accepted. The behavior is reverted to that of v1.78.x and earlier.
###### Linux
* SSH clients that skip the [`none`](/kb/1193/tailscale-ssh#authentication-and-authorization) auth method and immediately try `publickey` can connect to [Tailscale SSH](/kb/1193/tailscale-ssh) as expected. The behavior is reverted to that of v1.78.x and earlier.
###### macOS
* SSH clients that skip the `none` auth method and immediately try `publickey` can connect to Tailscale SSH as expected. The behavior is reverted to that of v1.78.x and earlier.
###### FreeBSD
* SSH clients that skip the `none` auth method and immediately try `publickey` can connect to Tailscale SSH as expected. The behavior is reverted to that of v1.78.x and earlier.
## [Feb 7, 2025](#2025-02-07)
* Use `ip:country` as a geolocation [device posture attribute](/kb/1288/device-posture#device-posture-attributes) ([generally available](/kb/1167/release-stages#general-availability-ga)).
## [Feb 6, 2025](#2025-02-06)
###### macOS
* `System extension uninstalled` message no longer appears erroneously when removing third-party system extensions while Tailscale is running.
* Resolved an issue that could have caused the network extension to crash in rare cases while parsing the macOS routing table.
###### iOS
* Resolved an issue that could have caused the network extension to crash in rare cases while parsing the iOS routing table.
###### tvOS
* Resolved an issue that could have caused the network extension to crash in rare cases while parsing the tvOS routing table.
## [Feb 3, 2025](#2025-02-03)
A new release of the [Tailscale Docker image](/kb/1282/docker) is available. You can download it from [Docker Hub](https://hub.docker.com/r/tailscale/tailscale) or from our [GitHub packages repo](https://github.com/tailscale/tailscale/pkgs/container/tailscale).
* TLS certificate requests from [Let’s Encrypt](https://letsencrypt.org) include the device's DNS name in the CSR’s SAN extension and set the `Common Name` field.
* [Tailscale Funnel](/kb/1223/funnel) configuration on devices displays errors when [incoming connections](/kb/1072/client-preferences#allow-incoming-connections) are not permitted and connections are disallowed.
* Tailscale Funnel disabled on a device no longer displays as enabled in the admin console.
* Serve config provided using the `TS\_SERVE\_CONFIG` environment variable successfully loads for tailnets with HTTPS disabled, as long as the serve config does not define an HTTPS endpoint.
A new release of the [Tailscale Kubernetes operator](/kb/1236/kubernetes-operator) is available. For guidance on installing and updating, see [installation instructions](/kb/1236/kubernetes-operator#installation).
* The optional [`ServiceMonitor`](/kb/1445/kubernetes-operator-customization#prometheus-servicemonitor) created for the proxy metrics endpoints can be labelled with user-specified labels.
* Proxies created for the Kubernetes Operator dynamically reload the [tailscaled](/kb/1278/tailscaled) configuration when it has changed. Changes such as a hostname might mean slightly slower change propagation (up to a minute), but less downtime.
* TLS certificate requests from [Let’s Encrypt](https://letsencrypt.org) include the device's DNS name in the CSR’s SAN extension and set the `Common Name` field.
* Improved failover for egress [`ProxyGroup`](/kb/1438/kubernetes-operator-cluster-egress#configure-an-egress-service-using-proxygroup) replicas. Replica restarts no longer cause downtime for cluster workloads that access tailnet targets using egress `ProxyGroup`.
A new release of the [Tailscale `tsrecorder`](/kb/1246/tailscale-ssh-session-recording) is available. You can download it from [Docker Hub](https://hub.docker.com/r/tailscale/tsrecorder/tags).
* TLS certificate requests from [Let’s Encrypt](https://letsencrypt.org) include the device's DNS name in the CSR’s SAN extension and set the `Common Name` field.
## [Jan 30, 2025](#2025-01-30)
###### All platforms
* [`Hostname`](/kb/1315/mdm-keys#set-whether-device-hostnames-can-be-modified) system policy is added for overriding the device hostname configured by the operating system, using an MDM solution.
* [`tailscale configure`](/kb/1080/cli#configure) CLI command and corresponding subcommands are no longer in [alpha](/kb/1167/release-stages#alpha), except for the subcommand `kubeconfig`, which remains in alpha.
* [Web interface](/kb/1325/device-web-interface) displays a **Login** button instead of the **Reauthenticate** button when adding a new device to your tailnet.
* [Tailscale Funnel](/kb/1223/funnel) configuration on devices displays errors when [incoming connections](/kb/1072/client-preferences#allow-incoming-connections) are not permitted and connections are disallowed.
* Connections to a [custom coordination server](/blog/opensource#the-open-source-coordination-server) that does not support HTTPS will no longer fail when a custom port number is specified.
###### Linux
* TLS certificate requests from [Let’s Encrypt](https://letsencrypt.org) include the device's DNS name in the CSR’s SAN extension and set the `Common Name` field.
* [Tailscale Funnel](/kb/1223/funnel) disabled on a device no longer displays enabled in the admin console.
###### Windows
* Onboarding flow is added for easier initial setup of the app.
* TLS certificate requests from [Let’s Encrypt](https://letsencrypt.org) include the device's DNS name in the CSR’s SAN extension and set the `Common Name` field.
* Client installs as expected when using [Group Policy Software Installation](https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-gpsi/8ac65057-0663-45e5-9718-f490e87945dc) (GPSI).
* Race conditions that result in an incorrect state or a deadlock no longer cause issues when multiple Windows users are logged in simultaneously.
###### macOS
* [`configure sysext activate`](/kb/1080/cli#configure), [`configure sysext deactivate`](/kb/1080/cli#configure), and [`configure sysext status`](/kb/1080/cli#configure) CLI commands are added to the Standalone variant for managing the activation flow of the macOS system extension programmatically.
* Standalone variant detects if the system extension is manually disabled or uninstalled by the user and displays a notice in the client UI.
* **Flush DNS Cache** option is added to the [Debug menu](/kb/1023/troubleshooting#debug-menu-and-options).
* TLS certificate requests from [Let’s Encrypt](https://letsencrypt.org) include the device's DNS name in the CSR’s SAN extension and set the `Common Name` field.
* App preferences re-set configures **Use Tailscale Subnets** to On and **Allow Incoming Connections** to Off as these are the default settings.
* [Find Devices](/kb/1233/mac-ios-shortcuts#find-devices) shortcut action no longer hangs.
* Standalone variant works as expected when users are not members of `staff` macOS user group.
###### iOS
* [Auth keys](/kb/1085/auth-keys) can be used for connecting to a [custom coordination server](/blog/opensource#the-open-source-coordination-server).
* VPN extension no longer runs when logging out.
* [Find Devices](/kb/1233/mac-ios-shortcuts#find-devices) shortcut action no longer hangs.
###### tvOS
* [Auth keys](/kb/1085/auth-keys) are supported for [authenticating an Apple TV](/kb/1280/appletv#install-tailscale-on-tvos) in your tailnet.
* Auth keys can be used for connecting to a [custom coordination server](/blog/opensource#the-open-source-coordination-server).
* VPN extension no longer runs when logging out.
###### Android
* Devices can be configured as a [subnet router](/kb/1019/subnets) in the **Settings** menu of the app.
## [Jan 29, 2025](#2025-01-29)
* When a user changes their GitHub username used to authenticate to a [GitHub personal tailnet](/kb/1284/sso-github#create-a-github-personal-tailnet), upon next Tailscale login their [tailnet name](/kb/1217/tailnet-name) will automatically be renamed. This is a change from the previous behavior, which required the user to file a request with the Tailscale support team to rename the tailnet.
## [Jan 27, 2025](#2025-01-27)
* Use [4via6 subnet routers](/kb/1201/4via6-subnets) to route traffic when you have existing subnets with overlapping IPv4 addresses ([generally available](/kb/1167/release-stages#general-availability-ga)).
* Use [auto approvers](/kb/1337/acl-syntax/#autoapprovers) to auto-approve advertised subnet routes and exit nodes ([generally available](/kb/1167/release-stages#general-availability-ga)).
* Configure [different NextDNS profiles for different devices](/kb/1218/nextdns#use-different-nextdns-profiles-for-different-devices) using [`nodeAttrs`](/kb/1337/acl-syntax/#nodeattrs) ([generally available](/kb/1167/release-stages#general-availability-ga)).
* [Download invoices](/kb/1182/billing-information/#download-invoices) for your Tailscale account in the **Billing** page of the admin console ([generally available](/kb/1167/release-stages#general-availability-ga)).
* Use [fast user switching](/kb/1225/fast-user-switching) to quickly switch between two or more logged-in accounts on the same device, without requiring you to re-authenticate ([generally available](/kb/1167/release-stages#general-availability-ga)).
* Stream [configuration audit logs](/kb/1255/log-streaming#configuration-log-streaming) to [Amazon S3](/kb/1255/log-streaming?tab=amazon+s3#add-configuration-log-streaming) and [S3-compatible services](/kb/1255/log-streaming?tab=s3-compatible#add-configuration-log-streaming) ([generally available](/kb/1167/release-stages#general-availability-ga)).
* Stream [network flow logs](/kb/1255/log-streaming#network-log-streaming) to [Amazon S3](/kb/1255/log-streaming?tab=amazon+s3#add-a-network-log-streaming-destination) and [S3-compatible services](/kb/1255/log-streaming?tab=s3-compatible#add-a-network-log-streaming-destination) ([generally available](/kb/1167/release-stages#general-availability-ga)).
* Use [different NextDNS profiles for different devices](/kb/1218/nextdns#use-different-nextdns-profiles-for-different-devices) ([generally available](/kb/1167/release-stages#general-availability-ga)).
## [Jan 22, 2025](#2025-01-22)
* [GitHub secret scanning](https://docs.github.com/code-security/secret-scanning/introduction/about-secret-scanning) supports [detecting and revoking leaked Tailscale secrets](https://tailscale.com/kb/1301/secret-scanning#github).
## [Dec 13, 2024](#2024-12-13)
**Note**: Tailscale v1.78.2 was an internal-only release.
###### Containers
* Unit test that would previously fail if run in a container.
###### iOS
* **Advanced DNS Settings** view unexpectedly dismissed on iPhone.
###### Android
* Work in progress search bar is hidden behind a flag until the feature is ready.
## [Dec 12, 2024](#2024-12-12)
A new release of the [Tailscale Docker image](/kb/1282/docker) is available. You can download it from [Docker Hub](https://hub.docker.com/r/tailscale/tailscale) or from our [GitHub packages repo](https://github.com/tailscale/tailscale/pkgs/container/tailscale).
* A nil pointer exception when serve config is provided via the `TS\_SERVE\_CONFIG` environment variable.
A new release of the [Tailscale Kubernetes operator](/kb/1236/kubernetes-operator) is available. For guidance on installing and updating, see [installation instructions](/kb/1236/kubernetes-operator#installation).
**Note:** This version contains no changes except for library updates.
* The [Mullvad exit nodes](/kb/1258/mullvad-exit-nodes) add-on can be purchased for tailnets that are in [trial mode](/kb/1182/billing-information#how-plans-are-assigned-to-new-tailnets).
**Note**: Purchasing the Mullvad exit nodes add-on for your trial tailnet will result in changes requiring action. For more information, see the [Pricing & Plans FAQ](/kb/1251/pricing-faq#can-i-use-the-mullvad-exit-nodes-add-on-with-a-tailnet-trial) topic.
A new release of the [Tailscale `tsrecorder`](/kb/1246/tailscale-ssh-session-recording) is available. You can download it from [Docker Hub](https://hub.docker.com/r/tailscale/tsrecorder/tags).
**Note:** This version contains no changes except for library updates.
## [Dec 11, 2024](#2024-12-11)
* Device posture integrations GA ([generally available](/kb/1167/release-stages/#general-availability-ga))
* Restrict device access with Tailscale [device posture management](/kb/1288/device-posture) and additional GA integrations: [Jamf Pro](/kb/1409/jamf-pro), [Kandji](/kb/1405/kandji), [Microsoft Intune](/kb/1410/intune), and [SentinelOne](/kb/1390/sentinelone).
## [Dec 10, 2024](#2024-12-10)
A new release of the [Tailscale Docker image](/kb/1282/docker) is available. You can download it from [Docker Hub](https://hub.docker.com/r/tailscale/tailscale) or from our [GitHub packages repo](https://github.com/tailscale/tailscale/pkgs/container/tailscale).
* All Tailscale container images are annotated with Open Container Initiative (OCI) [annotations](https://specs.opencontainers.org/image-spec/annotations/).
* Clients should more accurately detect whether they are in a container when checking for updates.
A new release of the [Tailscale Kubernetes operator](/kb/1236/kubernetes-operator) is available. For guidance on installing and updating, see [installation instructions](/kb/1236/kubernetes-operator#installation).
* Tailscale [client metrics](/kb/1482/client-metrics) can be enabled using a `ProxyClass` with the `.spec.metrics.enable` field set.
* All Tailscale container images are annotated with Open Container Initiative (OCI) [annotations](https://specs.opencontainers.org/image-spec/annotations/).
* `ProxyClass` supports configuring topology spread constraints for the Proxy Pods.
* Connector Custom Resource Definition (CRD) can be used to configure the Kubernetes Operator to deploy a Tailscale [app connector](/kb/1281/app-connectors) on Kubernetes.
* Tailscale running on Kubernetes and using a [Kubernetes Secret](https://kubernetes.io/docs/concepts/configuration/secret) as a state store writes Kubernetes Events to its Pod when changes occur to the state stored in the Kubernetes Secret. The same is true when there are errors related to reading or writing the state. This should help debugging issues related to transient errors when talking to the Kubernetes API server to retrieve or update the state Secret.
* Kubernetes Operator can optionally create a [Prometheus ServiceMonitor](https://prometheus-operator.dev/) for proxy resources that have Tailscale [client metrics](/kb/1482/client-metrics) enabled.
* Container Storage Interface (CSI) driver volume for the operator's OAuth client credentials can be configured by using Helm values.
* [Kubernetes Ingress](/kb/1439/kubernetes-operator-cluster-ingress) has clearer warnings if it has been deployed to a tailnet that has no HTTPS enabled. Specifically, a new warning in proxy logs and empty hostname on the Ingress status.
* `tailscale.com/tailnet-ip` annotation is validated that it holds a valid IP address.
* Timeout for Kubernetes API server calls for reading/updating `tailscaled` state stored in a Kubernetes Secret has been changed from 5 seconds to the total of 30 seconds for the read/update operation and an operation to emit an Event about the state update. This should reduce errors related to slow API server connections.
* The `ProxyClass` field `.spec.metrics.enable` enables metrics at both `/metrics` and `/debug/metrics`, but `/debug/metrics` is deprecated. Users relying on `/debug/metrics` need to set `.spec.statefulSet.pod.tailscaleContainer.debug.enable` (which is a new field in Tailscale 1.78.1) until Tailscale 1.82.0 releases. When 1.82.0 releases, `/metrics` and `/debug/metrics` will both independently default to false.
* Kubernetes operator proxy containers created for ingress and egress Service resources, Connectors and ProxyGroups are privileged. This is needed because of recent changes in `containerd`. For more context, see [tailscale/tailscale/pull/14262](https://github.com/tailscale/tailscale/pull/14262).
* Tailscale running on Kubernetes reads its state from a Secret only once, and that is upon initial start. This should reduce bugs caused by transient issues when connecting to the Kubernetes API server as well as reduce the load on the API server and improve latency for state operations.
* [Kubernetes Egress](/kb/1438/kubernetes-operator-cluster-egress) Service ports for `ProxyGroup` can be changed from a single unnamed port to one or more named ports.
* Clients should more accurately detect whether they are in a container when checking for updates.
A new release of the [Tailscale `tsrecorder`](/kb/1246/tailscale-ssh-session-recording) is available. You can download it from [Docker Hub](https://hub.docker.com/r/tailscale/tsrecorder/tags).
* All Tailscale container images are annotated with Open Container Initiative (OCI) [annotations](https://specs.opencontainers.org/image-spec/annotations/).
* Clients should more accurately detect whether they are in a container when checking for updates.
## [Dec 5, 2024](#2024-12-05)
###### All platforms
* Issue which resulted in an unwanted change in source code line endings.
###### All platforms
* [Client metrics](/kb/1482/client-metrics) have been added, to provide insights into Tailscale client behavior, health, and performance.
* [`tailscale metrics`](/kb/1080/cli#metrics) command has been added, to expose and collect client metrics for use with third-party monitoring systems.
* [`tailscale syspolicy`](/kb/1080/cli#syspolicy) command has been added, to list [system policies](/kb/1315/mdm-keys), reload system policies, or view errors related to the system policies configured on the device.
* Tailscale system policies are applied immediately when pushed via mobile device management (MDM) or Group Policy, without requiring a client restart.
* [Tailscale SSH session recording](/kb/1246/tailscale-ssh-session-recording) detects the disappearance of the recorder node sooner. This fix addresses a security vulnerability described in [TS-2024-013](/security-bulletins#ts-2024-013).
###### Windows
* UI customization [system policies](/kb/1315/mdm-keys) are configurable for both devices and users.
###### macOS
* UI to configure custom DNS servers to use for Tailscale-bound traffic when Tailscale DNS is disabled in settings.
* The macOS configuration report diagnostic tool can collect a larger amount of diagnostics when requested by Tailscale support. This includes system and process logs on the [Standalone variant](/kb/1065/macos-variants#standalone-variant).
* **Update Available** notifications include a link to the client changelog.
* On macOS Sequoia, in **System Settings.app** \> **Login Items & Extension**, Tailscale is listed as **Tailscale Network Extension** instead of **IPNExtension**, to reduce user confusion.
* Performance optimizations reduce CPU and memory usage when parsing network maps, especially for users on larger and busy tailnets.
* Performance optimizations at the UI layer reduce flickering of the menus, especially for users on larger and busy tailnets where the contents of the network map change very frequently.
* Error messages displayed when failing to toggle a setting are improved and easier to understand.
###### iOS
* UI to configure custom DNS servers to use for Tailscale-bound traffic when Tailscale DNS is disabled in settings.
* On iPhones and iPads running iOS 18, the VPN can be toggled from Control Center. Hold down in an empty space to add the Tailscale Control.
###### tvOS
* UI to configure custom DNS servers to use for Tailscale-bound traffic when Tailscale DNS is disabled in settings.
###### Android
* Authentication by using a [generated code](/kb/1079/install-android#use-a-generated-code) is available for Android TV users.
* Search bar shows suggestions.
* The default avatar displays if the user has no profile picture.
* False positive health warnings in the UI are reduced.
* Health warnings are no longer displayed in the UI after stopping Tailscale.
* Crashes when sharing a file using [Taildrop](/kb/1106/taildrop) from another Android app are reduced.
* UI padding of the main app toolbar is improved.
## [Nov 27, 2024](#2024-11-27)
* `ip:country` has been added as a [device posture attribute](/kb/1288/device-posture#device-posture-attributes) ([beta](/kb/1167/release-stages/#beta)).
## [Nov 14, 2024](#2024-11-14)
* New scopes for [OAuth clients](/kb/1215/oauth-clients) have been added with more granular permissions. Existing OAuth clients using the previous set of scopes, and keys generated using these clients, are still valid.
## [Nov 8, 2024](#2024-11-08)
A new release of the [Tailscale Docker image](/kb/1282/docker) is available. You can download it from [Docker Hub](https://hub.docker.com/r/tailscale/tailscale) or from our [GitHub packages repo](https://github.com/tailscale/tailscale/pkgs/container/tailscale).
* Logging for when clients move home [DERP](/kb/1232/derp-servers) regions is improved.
* Tailscale clients no longer move their home DERP server prematurely in response to unusual latency at very specific times.
A new release of the [Tailscale Kubernetes operator](/kb/1236/kubernetes-operator) is available. For guidance on installing and updating, see [installation instructions](/kb/1236/kubernetes-operator#installation).
* Logging for when clients move home [DERP](/kb/1232/derp-servers) regions is improved.
* Tailscale clients no longer move their home DERP server prematurely in response to unusual latency at very specific times.
* Tailscale [network flow logs](/kb/1255/log-streaming#network-log-streaming) and [configuration audit logs](/kb/1255/log-streaming#configuration-log-streaming) can now be streamed to [Amazon S3](https://aws.amazon.com/s3/) and S3-compatible services ([beta](/kb/1167/release-stages/#beta)).
A new release of the [Tailscale `tsrecorder`](/kb/1246/tailscale-ssh-session-recording) is available. You can download it from [Docker Hub](https://hub.docker.com/r/tailscale/tsrecorder/tags).
* Logging for when clients move home [DERP](/kb/1232/derp-servers) regions is improved.
* Tailscale clients no longer move their home DERP server prematurely in response to unusual latency at very specific times.
## [Nov 6, 2024](#2024-11-06)
**Note**: v1.76.4 and v1.76.5 were internal-only releases.
###### All platforms
* Logging for when clients move home [DERP](/kb/1232/derp-servers) regions is improved.
* Tailscale clients no longer move their home DERP server prematurely in response to unusual latency at very specific times.
###### Android
* Android app no longer terminates unexpectedly when performing network transitions.
## [Nov 5, 2024](#2024-11-05)
* [User approval](/kb/1239/user-approval) GA ([generally available](/kb/1167/release-stages/#general-availability-ga))
* [Invite any user](/kb/1271/invite-any-user) GA
## [Oct 24, 2024](#2024-10-24)
* 1Password Extended Access Management (XAM) GA ([generally available](/kb/1167/release-stages/#general-availability-ga))
* [Restrict device access with 1Password XAM](/kb/1407/kolide) (formerly known as Kolide) and Tailscale [device posture management](/kb/1288/device-posture).
## [Oct 21, 2024](#2024-10-21)
**Note**: v1.76.3 includes fixes for Windows devices only, and is exclusively released for Windows.
###### Windows
* Mullvad VPN submenu no longer fails to populate with [Mullvad exit nodes](/kb/1258/mullvad-exit-nodes) if there aren't any non-Mullvad exit nodes in the tailnet.
## [Oct 17, 2024](#2024-10-17)
**Note**: v1.76.2 includes fixes for Android TV devices only, and is exclusively released for Android.
###### Android
* D-Pad navigation is optimized in the Tailscale app on Android TV devices.
## [Oct 16, 2024](#2024-10-16)
###### All platforms
* [`tailscale netcheck`](/kb/1080/cli#netcheck) CLI command no longer crashes when performing diagnostics on networks lacking UDP connectivity.
* Improperly formatted `SERVFAIL` responses no longer cause DNS timeouts when using an [exit node](/kb/1103/exit-nodes).
###### Linux
* dbus login sessions no longer fail on systems where `/bin/login` is missing.
###### Android
* Android application no longer crashes in certain configurations when editing the [app-based split tunneling](/kb/1444/android-app-split-tunneling) settings.
A new release of the [Tailscale Docker image](/kb/1282/docker) is available. You can download it from [Docker Hub](https://hub.docker.com/r/tailscale/tailscale) or from our [GitHub packages repo](https://github.com/tailscale/tailscale/pkgs/container/tailscale).
**Note:** This version contains no changes except for library updates.
* [User & group provisioning for Google Workspace](/kb/1317/sso-google-sync) GA ([generally available](/kb/1167/release-stages/#general-availability-ga))
* Sync Google Workspace groups and users to use in your [Tailscale ACLs](/kb/1337/acl-syntax/#provisioned-groups).
A new release of the [Tailscale Kubernetes operator](/kb/1236/kubernetes-operator) is available. For guidance on installing and updating, see [installation instructions](/kb/1236/kubernetes-operator#installation).
* [Tailnet services can be exposed](/kb/1438/kubernetes-operator-cluster-egress) to cluster workloads on multiple proxy replicas using a ProxyGroup. It's also possible to expose multiple tailnet services on a single set of ProxyGroup replicas.
* Single use proxy [auth keys](/kb/1085/auth-keys) no longer persist in the state Secrets after the proxies have logged in. This should fix an issue where, in some edge cases, the leftover keys were causing the proxies to attempt to re-authenticate after Pod restart.
A new release of the [Tailscale `tsrecorder`](/kb/1246/tailscale-ssh-session-recording) is available. You can download it from [Docker Hub](https://hub.docker.com/r/tailscale/tsrecorder/tags).
* State directory can be set with the `TS\_STATE\_DIR` environment variable. The state directory also defaults to `/tmp/` for all tsrecorder installations that explicitly set the statefile location.
## [Oct 10, 2024](#2024-10-10)
###### All platforms
* Clients lacking UDP connectivity no longer skip performing fallback latency measurements with [DERP servers](/kb/1232/derp-servers).
* Warnings no longer display unnecessarily.
* Tailscale connectivity on flights using Inflight Internet Wi-Fi (such as Alaska Airlines) no longer fails.
* Service-related processes no longer run unnecessarily when services are disabled on the tailnet.
* Error messages include explanations in addition to the HTTP status code.
###### Linux
* [Tailscale SSH](/kb/1193/tailscale-ssh) supports sending environment variables to hosts. It's also possible to specify permitted environment variables using the `acceptEnv` field.
* [Tailscale SSH](/kb/1193/tailscale-ssh) no longer breaks some terminal applications by omitting pixel width and height when resizing the application window.
###### Windows
* Ping messages sent through [subnet routers](/kb/1019/subnets) to unreachable hosts no longer generate ping responses.
###### macOS
* [Tailscale SSH](/kb/1193/tailscale-ssh) supports sending environment variables to hosts. You must specify permitted environment variables using the `acceptEnv` field.
* Tailscale `.pkg` installer for the [standalone variant](/kb/1065/macos-variants#standalone-variant) prevents potential conflicts by showing a warning if it detects a Homebrew install of Tailscale.
* [Bug report](/kb/1225/fast-user-switching) view shows a warning if Tailscale detects that Cloudflare WARP is installed. Some Cloudflare WARP configurations conflict with Tailscale.
* DNS settings no longer improperly set when keys expire or Tailscale stops.
###### iOS
* Battery usage is improved when [MagicDNS](/kb/1081/magicdns) is enabled. The improvement comes from adjusting the timeout of [DNS over HTTPS (DoH)](/kb/1381/what-is-quad100#10010010010053-is-a-dns-resolver) for idle connections and requiring a TLS 1.3 handshake when establishing a connection with the DoH server.
* DNS settings no longer improperly set when keys expire or Tailscale stops.
###### tvOS
* DNS settings no longer improperly set when keys expire or Tailscale stops.
###### Android
* [Account switcher](/kb/1225/fast-user-switching) displays the server hostname if the account uses a custom coordination server.
* Battery usage is improved when [MagicDNS](/kb/1081/magicdns) is enabled. The improvement comes from adjusting the timeout of [DNS over HTTPS (DoH)](/kb/1381/what-is-quad100#10010010010053-is-a-dns-resolver) for idle connections and requiring a TLS 1.3 handshake when establishing a connection with the DoH server.
* Quick tile toggle no longer fails to turn on Tailscale if Tailscale had been manually disconnected before it was last shut down.
## [Oct 3, 2024](#2024-10-03)
* The Personal Plus [pricing plan](/pricing) offers the same features as the Personal plan with up to 6 users for a flat rate. For details about billing, plan comparison, and support, see [Pricing & Plans FAQ](/kb/1251/pricing-faq).
## [Oct 2, 2024](#2024-10-02)
Tailscale v1.74.2 addresses an issue for iOS, and is exclusively released for that platform.
###### iOS
* The Tailscale app launches as expected when **Wi-Fi Calling on This iPhone** is enabled in the iOS **Cellular** settings.
* Tailnets containing multiple users can be [deleted](/kb/1237/delete-tailnet) from the admin console without first deleting the users manually.
## [Sep 27, 2024](#2024-09-27)
* The optional `expiry` and `comment` parameters have been added to the [Set custom device posture attributes](https://tailscale.com/api#tag/devices/POST/device/{deviceId}/attributes/{attributeKey}) endpoint of the [device posture attribute API](/kb/1288/device-posture#posture-attributes-api).
## [Sep 18, 2024](#2024-09-18)
Tailscale v1.74.1 addresses issues for Linux and Android, and is exclusively released for those platforms.
###### Linux
* Linux-only NAT traversal optimization added in v1.74.0 is now disabled following a bug report. The behavior is reverted to that of v1.72.x and earlier and will be re-added in a future release.
###### Android
**Note:** The Android client release for v1.74.0 was delayed and moved into the v1.74.1 client release instead.
* Device network change detection is improved to reflect accurate [Tailscale DNS](/kb/1054/dns) configuration updates.
* [System policies](/kb/1315/mdm-keys) for the Android client on ChromeOS work as expected.
A new release of the [Tailscale Docker image](/kb/1282/docker) is available. You can download it from [Docker Hub](https://hub.docker.com/r/tailscale/tailscale) or from our [GitHub packages repo](https://github.com/tailscale/tailscale/pkgs/container/tailscale).
**Note:** This version contains no changes except for library updates.
A new release of the [Tailscale Kubernetes operator](/kb/1236/kubernetes-operator) is available. For guidance on installing and updating, see [installation instructions](/kb/1236/kubernetes-operator#installation).
* Recorder CRD (custom resource) is added for deploying the [Tailscale `tsrecorder`](/kb/1246/tailscale-ssh-session-recording) to Kubernetes.
* Default [`ProxyClass`](/kb/1445/kubernetes-operator-customization) can now be specified for the Kubernetes Operator proxies. If you are using Helm, the default `ProxyClass` can be configured in the `proxyConfig.defaultProxyClass` Helm value or set using `PROXY\_DEFAULT\_CLASS` environment variable.
* Wildcards in [RBAC](https://kubernetes.io/docs/reference/access-authn-authz/rbac/) role definitions are replaced with exact verbs.
A new release of the [Tailscale `tsrecorder`](/kb/1246/tailscale-ssh-session-recording) is available. You can download it from [Docker Hub](https://hub.docker.com/r/tailscale/tsrecorder/tags).
**Note:** This version contains no changes except for library updates.
## [Sep 13, 2024](#2024-09-13)
v0.17.0 of the [Tailscale Terraform Provider](https://registry.terraform.io/providers/tailscale/tailscale/latest) has been released with the following changes:
##### Resources
* Manage [webhooks](/kb/1213/webhooks) with [`tailscale\_webhook`](https://registry.terraform.io/providers/tailscale/tailscale/latest/docs/resources/webhook).
* Manage [contact preferences](/kb/1224/contact-preferences) with [`tailscale\_contacts`](https://registry.terraform.io/providers/tailscale/tailscale/latest/docs/resources/contacts).
* Manage [device posture integrations](/kb/1288/device-posture) with [`tailscale\_posture\_integration`](https://registry.terraform.io/providers/tailscale/tailscale/latest/docs/resources/posture_integration).
* Manage [log streaming](/kb/1255/log-streaming) with [`tailscale\_logstream\_configuration`](https://registry.terraform.io/providers/tailscale/tailscale/latest/docs/resources/logstream_configuration).
* Manage [Tailnet settings](/api#tag/tailnetsettings/GET/tailnet/{tailnet}/settings) with [`tailscale\_tailnet\_settings`](https://registry.terraform.io/providers/tailscale/tailscale/latest/docs/resources/tailnet_settings).
* Changing the domain attribute for [`tailcale\_dns\_split\_nameservers`](https://registry.terraform.io/providers/tailscale/tailscale/latest/docs/resources/dns_split_nameservers) now properly removes the previous domain value.
##### Data Sources
* Fetch information for multiple users with [`tailcale\_users`](https://registry.terraform.io/providers/tailscale/tailscale/latest/docs/data-sources/users).
* Fetch information for a specific user with [`tailscale\_user`](https://registry.terraform.io/providers/tailscale/tailscale/latest/docs/data-sources/user).
## [Sep 12, 2024](#2024-09-12)
###### All platforms
* [`AuthKey`](/kb/1315/mdm-keys#set-an-auth-key) system policy can be used to authenticate a device with Tailscale using an [MDM solution](/kb/1362/mdm).
* [`tailscale dns`](/kb/1080/cli#dns) CLI command is added for accessing [Tailscale DNS](/kb/1054/dns) settings and status.
* Go is updated to version 1.23.1.
* [Tailnet Lock](kb/1226/tailnet-lock) long rotation signatures are truncated automatically to avoid excessive growth.
* **Log In** option in the client works as expected.
###### Linux
* [TCP generic receive offload](https://docs.kernel.org/networking/segmentation-offloads.html#generic-receive-offload) (GRO) support is added for improved userspace mode throughput.
* [TCP generic segmentation offload](https://docs.kernel.org/networking/segmentation-offloads.html#tcp-segmentation-offload) (GSO) is re-introduced for supporting improved userspace mode throughput. This was initially introduced in Tailscale v1.72.0 and then rolled back in v1.72.1.
###### Windows
* The client no longer connects to a tailnet automatically when restarting or switching profiles.
* Profiles created as Local System with Unattended Mode enabled are retained after a reboot.
###### macOS
* The [open-source variant](https://github.com/tailscale/tailscale/wiki/Tailscaled-on-macOS) of the Tailscale client can now read the system [DNS configuration](/kb/1054/dns) to provide DNS resolution when [`tailscale set -—accept-dns`](/kb/1080/cli#set) or [`tailscale up -—accept-dns`](/kb/1241/tailscale-up) is enabled and the **Override local DNS** option in the **DNS** page of the admin console is disabled.
* DNS resolution continues to work after a key expires.
###### tvOS
* The [ping](/kb/1280/appletv#test-device-latency) feature allows you to observe connectivity performance between your Apple TV and other devices in your tailnet.
###### Android
**Note:** The Android client release for v1.74.0 was delayed and moved into the v1.74.1 client release instead.
* [Tailscale DNS](/kb/1054/dns) works as expected when switching between Wi-Fi and cellular networks.
* [System policies](/kb/1315/mdm-keys) for the Android client on ChromeOS work as expected.
## [Sep 11, 2024](#2024-09-11)
* [Device posture](/kb/1288/device-posture) integration with [CrowdStrike Falcon](/kb/1289/crowdstrike-zta) can now use MAC addresses to match devices that lack serial numbers. When Falcon integration is configured, [Device Identity Collection](/kb/1326/device-identity-collection) will automatically collect MAC addresses.
## [Aug 26, 2024](#2024-08-26)
Tailscale v1.72.2 addresses issues for macOS, iOS, and tvOS, and is exclusively released for those platforms.
###### macOS
* An issue that could trigger a VPN permission prompt when starting Tailscale while another VPN app was already active is fixed.
* An issue that could prevent Tailscale from automatically launching at login on some Macs is fixed.
###### iOS
* An issue that could trigger a VPN permission prompt when starting Tailscale while another VPN app was already active is fixed.
###### tvOS
* An issue that could trigger a VPN permission prompt when starting Tailscale while another VPN app was already active is fixed.
## [Aug 23, 2024](#2024-08-23)
* Admin console [session timeouts from inactivity](/kb/1461/admin-console-session-timeout) are now configurable from the **User Management Settings** page of the admin console.
## [Aug 22, 2024](#2024-08-22)
Tailscale v1.72.1 addresses a Linux-specific issue, and is exclusively released for the Linux platform and containers.
###### Linux
* TCP generic segmentation offload (GSO) support for userspace mode is removed.
* DNS over TCP failures when querying the Tailscale-internal resolver are fixed.
A new release of the [Tailscale Docker image](/kb/1282/docker) is available. You can download it from [Docker Hub](https://hub.docker.com/r/tailscale/tailscale) or from our [GitHub packages repo](https://github.com/tailscale/tailscale/pkgs/container/tailscale).
* DNS over TCP failures when querying the Tailscale-internal resolver are fixed.
A new release of the [Tailscale Kubernetes operator](/kb/1236/kubernetes-operator) is available. For guidance on installing and updating, see [installation instructions](/kb/1236/kubernetes-operator#installation).
* DNS over TCP failures when querying the Tailscale-internal resolver are fixed.
A new release of the [Tailscale `tsrecorder`](/kb/1246/tailscale-ssh-session-recording) is available. You can download it from [Docker Hub](https://hub.docker.com/r/tailscale/tsrecorder/tags).
* DNS over TCP failures when querying the Tailscale-internal resolver are fixed.
## [Aug 21, 2024](#2024-08-21)
A new release of the [Tailscale Docker image](/kb/1282/docker) is available. You can download it from [Docker Hub](https://hub.docker.com/r/tailscale/tailscale) or from our [GitHub packages repo](https://github.com/tailscale/tailscale/pkgs/container/tailscale).
* An HTTP health check endpoint at `/healthz` can be enabled by setting `TS\_HEALTHCHECK\_ADDR\_PORT` to `[addr]:port`.
A new release of the [Tailscale Kubernetes operator](/kb/1236/kubernetes-operator) is available. For guidance on installing and updating, see [installation instructions](/kb/1236/kubernetes-operator#installation).
* Additional environment variables can now be passed for the Kubernetes Operator deployment via [Helm chart](/kb/1236/kubernetes-operator#helm) options.
* `DNSConfig CRD` reconcile logic is fixed for dual-stack clusters.
A new release of the [Tailscale `tsrecorder`](/kb/1246/tailscale-ssh-session-recording) is available. You can download it from [Docker Hub](https://hub.docker.com/r/tailscale/tsrecorder/tags).
* Running without HTTPS is now allowed when UI is disabled.
## [Aug 19, 2024](#2024-08-19)
###### All platforms
* [Captive portal detection](/kb/1457/captive-portals) is now supported.
* The [`tailscale cert`](/kb/1080/cli/#cert) command now contains the `--min-validity` flag. Use this flag to request a specified minimum remaining validity on the returned certificate. This flag is intended for automation, like cron jobs, that periodically refreshes certificates.
* The [`tailscale lock`](/kb/1243/tailscale-lock) command now supports passing keys as files. To pass a key as a file, use the prefix `file:` followed by the path to the file: `file:\<path-to-key-file\>`.
* A health warning is now raised if Tailscale is unable to forward DNS queries to the configured resolvers.
* An increase in send and receive buffer sizes for userspace mode TCP improves throughput over high latency paths.
###### Linux
* The addition of TCP generic segmentation offload (GSO) support to userspace mode improves throughput.
###### macOS
*Note*: macOS 10.15 Catalina is no longer supported. See the [v1.60.0 changelog](/changelog#2024-02-15) for our initial end of life announcement.
* Notifications are sent when a captive portal is detected.
* Health warnings in the UI are now sorted by their severity level.
* Reliability of the authentication process when launching the web browser is improved.
* The VPN tunnel is no longer automatically restarted if toggling Tailscale from the system VPN settings without disabling [VPN On Demand](/kb/1291/ios-vpn-on-demand) first.
###### iOS
* Notifications are sent when a captive portal is detected.
* Health warnings are displayed when connectivity is impacted.
* An error message is displayed while attempting to start the VPN when both Wi-Fi and cellular interfaces are down, instead of failing silently.
* The VPN tunnel is no longer automatically restarted if toggling Tailscale from the system VPN settings without disabling [VPN On Demand](/kb/1291/ios-vpn-on-demand) first.
###### tvOS
* Notifications are sent when a captive portal is detected.
* The VPN tunnel is no longer automatically restarted if toggling Tailscale from the system VPN settings without disabling [VPN On Demand](/kb/1291/ios-vpn-on-demand) first.
###### Android
* Health warnings, if any are present, are displayed in the main view of the app.
## [Aug 15, 2024](#2024-08-15)
* [Access control policies](/kb/1393/access-control) using [`via`](/kb/1378/via) are included in the **Preview rules** tab of the **Access Controls** page of the admin console.
## [Aug 13, 2024](#2024-08-13)
* [User & group provisioning for Microsoft Entra ID](/kb/1249/sso-entra-id-scim) GA ([generally available](/kb/1167/release-stages/#general-availability-ga))
* Sync Microsoft Entra ID groups and users to use in your [Tailscale ACLs](/kb/1337/acl-syntax/#provisioned-groups).
## [Aug 8, 2024](#2024-08-08)
* SSH `src` in [ACL](/kb/1018/acls) rules supports all role-based [autogroups](/kb/1337/acl-syntax#autogroups).
## [Aug 2, 2024](#2024-08-02)
* [1Password XAM](/kb/1407/kolide) is available as a device posture integration ([beta](/kb/1167/release-stages/#beta))
* [Jamf Pro](/kb/1409/jamf-pro) is available as a device posture integration ([beta](/kb/1167/release-stages/#beta))
* [Kandji](/kb/1405/kandji) is available as a device posture integration ([beta](/kb/1167/release-stages/#beta))
* [Microsoft Intune](/kb/1410/intune) is available as a device posture integration ([beta](/kb/1167/release-stages/#beta))
* [SentinelOne](/kb/1390/sentinelone) is available as a device posture integration ([beta](/kb/1167/release-stages/#beta))
## [Jul 25, 2024](#2024-07-25)
* [Control D DNS](/kb/1403/control-d) is available as a global nameserver in your tailnet.
## [Jul 22, 2024](#2024-07-22)
We have added the following endpoints to Tailscale's public API:
##### Device endpoints
* [Set device name](/api#tag/devices/POST/device/{deviceId}/name)
##### Webhook management endpoints
* [Get a webhook](/api#tag/webhooks/GET/webhooks/{endpointId})
##### Tailnet settings endpoints
* [Get tailnet settings](/api#tag/tailnetsettings/GET/tailnet/{tailnet}/settings).
* [Update tailnet settings](/api#tag/tailnetsettings/PATCH/tailnet/{tailnet}/settings).
A new release of the [Tailscale Docker image](/kb/1282/docker) is available. You can download it from [Docker Hub](https://hub.docker.com/r/tailscale/tailscale) or from our [GitHub packages repo](https://github.com/tailscale/tailscale/pkgs/container/tailscale).
* Egress proxies specified by an [FQDN](https://en.wikipedia.org/wiki/Fully_qualified_domain_name) now work also for IPv6-only network stacks.
A new release of the [Tailscale Kubernetes operator](/kb/1236/kubernetes-operator) is available. For guidance on installing and updating, see our [installation instructions](/kb/1236/kubernetes-operator#installation).
* Egress proxies specified by an [FQDN](https://en.wikipedia.org/wiki/Fully_qualified_domain_name) now work also for IPv6-only network stacks.
* Tailscale `Service` status now includes a custom Tailscale proxy status condition.
* Optionally record `kubectl exec` sessions.
* Cluster resources for failed egress proxies are now correctly cleaned up when the parent `Service` is deleted.
A new release of the [Tailscale `tsrecorder`](/kb/1246/tailscale-ssh-session-recording) is available. You can download it from [Docker Hub](https://hub.docker.com/r/tailscale/tsrecorder/tags).
* `tsrecorder` now plays session recordings for interactive sessions initiated by a command that explicitly specifies shell.
## [Jul 17, 2024](#2024-07-17)
###### All platforms
* Restrict [recommended](/kb/1392/auto-exit-nodes) and automatically selected exit nodes using the new `AllowedSuggestedExitNodes` [system policy](/kb/1315/mdm-keys). Applies only to platforms that support [system policies](/kb/1315/mdm-keys).
* Improved [NAT traversal](/blog/how-nat-traversal-works) for some uncommon scenarios.
* Optimized [sending firewall rules to clients](/kb/1018/acls) more efficiently.
* [Exit node suggestion](/kb/1392/auto-exit-nodes) CLI command now prints the hostname (which you can use with the [`tailscale set`](/kb/1080/cli#set) command).
* [Taildrive](/kb/1369/taildrive) share paths configured through the CLI resolve relative to where you run the `tailscale` command.
###### Linux
* Switching from unstable to stable tracks using the [`tailscale update`](/kb/1080/cli#update) command now works correctly.
###### Windows
* Use the value `auto:any` to automatically select an [exit node](/kb/1103/exit-nodes) for the existing `ExitNodeID` [system policy](/kb/1315/mdm-keys). Available for [Enterprise plan](/pricing) users only.
* The new `AllowedSuggestedExitNodes` [system policy](/kb/1315/mdm-keys) restricts which exit nodes Tailscale [recommends](/kb/1392/auto-exit-nodes) or automatically selects.
* DNS leak issue.
* Switching from unstable to stable tracks using the [`tailscale update`](/kb/1080/cli#update) command now works correctly.
* [Taildrive](/kb/1369/taildrive) server no longer starts unnecessarily when no drives are configured.
###### macOS
**Note**: As previously announced, Tailscale v1.70 is the last version to support macOS 10.15 Catalina. macOS 10.15 is no longer supported by Apple and no longer receives security updates. Users still running macOS 10.15 should update to a newer version of macOS to continue receiving security updates and new features.
* Toggle Tailscale DNS from Siri or the Shortcuts app.
* Receive health notifications in the client menu on macOS to inform you about lack of internet connectivity, firewalls blocking Tailscale, misconfiguration issues, and other issues. Health issues that affect [connectivity](/kb/1411/device-connectivity) also change the Tailscale icon in the system menubar to show an exclamation mark.
* On MacBooks with a notch in the display, a notification window will now appear if the Tailscale icon is hidden behind the notch due to too many menubar items.
* The Tailscale client now warns you when the built-in macOS [content filter (Screen Time)](/kb/1420/macos-webfilterproxyd) prevents Tailscale from connecting.
* Use the value `auto:any` to automatically select an exit node for the existing `ExitNodeID` [system policy](/kb/1315/mdm-keys). Available for [Enterprise plan](/pricing) users only.
* The exit node picker no longer presents exit node suggestions if the organization enforces always using the suggested exit node using the `ExitNodeID` [system policy](/kb/1315/mdm-keys).
* Disconnect shortcut no longer connects to the VPN tunnel if executed when Tailscale is disconnected.
* [Taildrive](/kb/1369/taildrive) server no longer starts unnecessarily when no drives are configured.
* Increased the reliability of the **Install Updates Automatically** setting.
###### iOS
* Toggle Tailscale DNS from Siri or the Shortcuts app.
* Use the value `auto:any` to automatically select an exit node for the existing `ExitNodeID` [system policy](/kb/1315/mdm-keys). Available for [Enterprise plan](/pricing) users only.
* [`wireguard-go`](https://github.com/WireGuard/wireguard-go/pull/106) memory pool deadlock issue is resolved.
* Disconnect shortcut no longer connects to the VPN tunnel if executed when Tailscale is disconnected.
* User interface no longer flickers when selecting an exit node.
###### tvOS
* Use the value `auto:any` to automatically select an exit node for the existing `ExitNodeID` [system policy](/kb/1315/mdm-keys). Available for [Enterprise plan](/pricing) users only.
* [`wireguard-go`](https://github.com/WireGuard/wireguard-go/pull/106) memory pool deadlock issue is resolved.
* User interface no longer flickers when selecting an exit node.
###### Android
* Access ping information and connection status by long-pressing on a device in the devices list and selecting **Ping**.
* Use [split tunneling](/kb/1444/android-app-split-tunneling) to force or exclude app traffic through your tailnet.
* [`wireguard-go`](https://github.com/WireGuard/wireguard-go/pull/106) memory pool deadlock issue is resolved.
## [Jul 15, 2024](#2024-07-15)
* [Indent](https://indent.com) shut down their service effective July 15, 2024.
If you were using Indent with your Tailscale network, migrate to another on-demand access system or Tailscale's [just-in-time accessbot (alpha)](/kb/1383/tailscale-slack-accessbot), or otherwise turn off your Indent integration with Tailscale.
## [Jul 11, 2024](#2024-07-11)
* The process for creating a new tailnet now asks you if the tailnet will be primarily used **At work** or **At home**. This determines whether to enroll the tailnet into a 14-day trial or the [Personal plan](/pricing). For more details, see the [Tailscale quickstart](/kb/1017/install#create-a-tailnet) topic.
* Newly created tailnets using custom domains are no longer automatically enrolled in a trial. Instead, the **At work** or **At home** selection determines trial enrollment.
## [Jul 10, 2024](#2024-07-10)
* Access an [OpenAPI spec for the Tailscale API](https://api.tailscale.com/api/v2). The spec is used to generate our new interactive documentation. Note that the spec definition may change without notice, so should not be relied upon for stability.
* Access [interactive documentation](/api) for the Tailscale API.
#### New API endpoints
We have added the following endpoints to Tailscale's public API:
##### Logging endpoints
* [Get log streaming status](/api#tag/logging/GET/tailnet/{tailnet}/logging/{logType}/stream/status).
* [Get log streaming configuration](/api#tag/logging/GET/tailnet/{tailnet}/logging/{logType}/stream).
* [Set log streaming configuration](/api#tag/logging/PUT/tailnet/{tailnet}/logging/{logType}/stream).
* [Disable log streaming](/api#tag/logging/DELETE/tailnet/{tailnet}/logging/{logType}/stream).
* Created a new endpoint for [listing configuration audit logs](/api#tag/logging/GET/tailnet/{tailnet}/logging/configuration). An earlier version of this endpoint is still supported for backwards compatibility.
* Created a new endpoint for [listing network flow logs](/api#tag/logging/GET/tailnet/{tailnet}/logging/network). An earlier version of this endpoint is still supported for backwards compatibility.
##### Webhook management endpoints
* [List all webhooks for a tailnet](https://tailscale.com/api#tag/webhooks/GET/tailnet/{tailnet}/webhooks).
* [Create a new webhook](https://tailscale.com/api#tag/webhooks/POST/tailnet/{tailnet}/webhooks).
* [Update a webhook](https://tailscale.com/api#tag/webhooks/PATCH/webhooks/{endpointId}).
* [Delete a webhook](https://tailscale.com/api#tag/webhooks/DELETE/webhooks/{endpointId}).
* [Test a webhook](https://tailscale.com/api#tag/webhooks/POST/webhooks/{endpointId}/test).
* [Rotate a webhook secret](https://tailscale.com/api#tag/webhooks/POST/webhooks/{endpointId}/rotate).
##### Device posture endpoints
* [List all posture integrations](/api#tag/deviceposture/GET/tailnet/{tailnet}/posture/integrations).
* [Create a posture integration](/api#tag/deviceposture/POST/tailnet/{tailnet}/posture/integrations).
* [Update a posture integration](/api#tag/deviceposture/PATCH/posture/integrations/{id}).
* [Delete a posture integration](/api#tag/deviceposture/DELETE/posture/integrations/{id}).
##### User management endpoints
* [List all users in the tailnet](/api#tag/users/GET/tailnet/{tailnet}/users).
* [Get details about a specific user](/api#tag/users/GET/users/{userId}).
* [Update the role for a specific user](/api#tag/users/POST/users/{userId}/role).
* [Approve a pending user's access to the tailnet](/api#tag/users/POST/users/{userId}/approve). This is only applicable to tailnets that have enabled [user approval](/kb/1239/user-approval).
* [Suspend a user](/api#tag/users/POST/users/{userId}/suspend). Available for the [Personal and Enterprise plans](/pricing).
* [Restore a suspended user](/api#tag/users/POST/users/{userId}/restore). Available for the [Personal and Enterprise plans](/pricing).
* [Delete a user](/api#tag/users/POST/users/{userId}/delete). Available for the [Personal and Enterprise plans](/pricing).
##### User invite endpoints
* [List all open (not yet accepted) user invites to the tailnet](/api#tag/userinvites/GET/tailnet/{tailnet}/user-invites).
* [Create user invite links and send user invite emails](/api#tag/userinvites/POST/tailnet/{tailnet}/user-invites).
* [Get details for a specific user invite](/api#tag/userinvites/GET/user-invites/{userInviteId}).
* [Delete an open (not yet accepted) user invite](/api#tag/userinvites/DELETE/user-invites/{userInviteId}).
* [Resend an open (not yet accepted) user invite that was originally sent via email](/api#tag/userinvites/POST/user-invites/{userInviteId}/resend).
##### Device invite endpoints
* [List all open (not yet accepted) device invites](/api#tag/deviceinvites/GET/device/{deviceId}/device-invites).
* [Create device invite links and send device invite emails](/api#tag/deviceinvites/POST/device/{deviceId}/device-invites).
* [Get details for a specific device invite](/api#tag/deviceinvites/GET/device-invites/{deviceInviteId}).
* [Delete an open (not yet accepted) device invite](/api#tag/deviceinvites/DELETE/device-invites/{deviceInviteId}).
* [Resend an open (not yet accepted) device invite](/api#tag/deviceinvites/POST/device-invites/{deviceInviteId}/resend).
* [Accept a device invite to your tailnet](/api#tag/deviceinvites/POST/device-invites/-/accept).
##### Contact preferences endpoints
* [List the tailnet's current contact preferences](/api#tag/contacts/GET/tailnet/{tailnet}/contacts).
* [Update a tailnet contact](/api#tag/contacts/PATCH/tailnet/{tailnet}/contacts/{contactType}).
* [Resend the verification email for a tailnet contact](/api#tag/contacts/POST/tailnet/{tailnet}/contacts/{contactType}/resend-verification-email).
* [Invite team member](/kb/1064/invite-team-members) invites are now automatically deleted 90 days after the last welcome email was sent.
## [Jul 8, 2024](#2024-07-08)
* IP sets GA ([generally available](/kb/1167/release-stages/#general-availability-ga))
* Use [IP sets](/kb/1387/ipsets) to target and manage cross-sections of your tailnet independently of other groupings like subnets, tags, and groups.
* Use [Via](/kb/1378/via) to add routing awareness to [grants](/kb/1324/acl-grants) ([beta](/kb/1167/release-stages#beta)).
* Define the exit nodes, subnet routers, or app connectors a source can access when they use a specific destination.
## [Jul 2, 2024](#2024-07-02)
###### All Platforms
* [Tailnet Lock](/kb/1226/tailnet-lock) validation of rotation signatures now permits multiple nodes signed by the same pre-signed reusable auth key.
###### macOS
* Wake from sleep reliability is improved for re-connections and transitions between networks.
###### iOS
* Wake from sleep reliability is improved for re-connections and transitions between networks.
## [Jun 25, 2024](#2024-06-25)
* [User & group provisioning for Google Workspace](/kb/1317/sso-google-sync) ([beta](/kb/1167/release-stages/#beta))
## [Jun 21, 2024](#2024-06-21)
* [Indent](https://indent.com) has announced they are shutting down 12:00 PM PST July 15, 2024.
If you are using Indent with your Tailscale network, migrate to another on-demand access system or Tailscale's [just-in-time accessbot (alpha)](/kb/1383/tailscale-slack-accessbot), or otherwise turn off your [Indent integration](/kb/1205/ondemand-indent) by that time.
## [Jun 20, 2024](#2024-06-20)
A new release of the [Tailscale Docker image](/kb/1282/docker) is available. You can download it from [Docker Hub](https://hub.docker.com/r/tailscale/tailscale) or from our [GitHub packages repo](https://github.com/tailscale/tailscale/pkgs/container/tailscale).
* [UDP GRO](/blog/quic-udp-throughput) forwarding can be turned on for containers configured as Tailscale subnet routers or exit nodes, using the new environment variable `TS\_EXPERIMENTAL\_ENABLE\_FORWARDING\_OPTIMIZATIONS`. To learn more, see [Performance best practices](/kb/1320/performance-best-practices).
* Containers that run on Kubernetes and store the [`tailscaled`](/kb/1278/tailscaled) state in a Kubernetes `Secret` can now be enforced to read the Kubernetes API server address and port from the environment variables `KUBERNETES\_SERVICE\_HOST` and `KUBERNETES\_SERVICE\_PORT\_HTTPS`. By default, the values are read from the Kubernetes `Service` in the default namespace. To enforce the environment variables, set `TS\_KUBERNETES\_READ\_API\_SERVER\_ADDRESS\_FROM\_ENV` to `true`.
A new release of the [Tailscale Kubernetes operator](/kb/1236/kubernetes-operator) is available. For guidance on installing and updating, see our [installation instructions](/kb/1236/kubernetes-operator#installation).
* Tailscale Kubernetes operator proxies can now be configured to accept routes advertised by tailnet peers using the new `proxyClass.spec.tailscale.acceptRoutes` field. To learn more, see our [ProxyClass documentation](https://github.com/tailscale/tailscale/blob/main/k8s-operator/api.md#proxyclass).
* Images and image pull policies can be configured for individual Tailscale Kubernetes operator proxies using ProxyClass.
* Connector Custom Resources status now includes the proxy's tailnet IP addresses and MagicDNS name.
* Helm values file now allows configuring image repositories using a repository key, which is a standard and expected by some tools.
A new release of the [Tailscale `tsrecorder`](/kb/1246/tailscale-ssh-session-recording) is available. You can download it from [Docker Hub](https://hub.docker.com/r/tailscale/tsrecorder/tags).
* `--state` flag or the `TS\_STATE` environment variable can be used to specify a Kubernetes `Secret` as [`tailscaled`](/kb/1278/tailscaled) state store when [deploying the `tsrecorder` container](/kb/1263/session-recording-s3#deploy-the-recorder-node).
* `--dst` flag for destination can be set as the environment variable `TSRECORDER\_DST` when deploying the `tsrecorder` container.
* `--bucket` flag for the S3 bucket name can be set as the environment variable `TSRECORDER\_BUCKET` when deploying the `tsrecorder` container.
* `--hostname` flag for the hostname can be set as the environment variable `TSRECORDER\_HOSTNAME` when deploying the `tsrecorder` container.
* `--ui` flag for the user interface can be set as the environment variable `TSRECORDER\_UI` when deploying the `tsrecorder` container.
* AWS ambient credentials can be used to access the S3 backend.
## [Jun 14, 2024](#2024-06-14)
###### All Platforms
* [4via6 subnet router](/kb/1201/4via6-subnets) advertisement works as expected.
###### Linux
* [Tailscale SSH](/kb/1193/tailscale-ssh) access to Security-Enhanced Linux (SELinux) machines works as expected.
###### Android
* Android TV navigation is improved.
## [Jun 12, 2024](#2024-06-12)
###### All Platforms
* [Auto-updates](/kb/1067/update#auto-updates) are available for containers. The tailnet-wide default is ignored in containers.
* When enabled, auto-updates get applied even if the node is down or disconnected from the [coordination server](/kb/1155/terminology-and-concepts#coordination-server).
* [`tailscale lock status`](/kb/1243/tailscale-lock#lock-status) now prints the node's signature.
* Go is updated to version 1.22.4.
###### Windows
* [`.exe` installer](/kb/1022/install-windows) no longer downloads MSI packages for Windows 7 and Windows 8, automatically. See the [v1.42.0 changelog](/changelog#2023-05-24) for our initial end of life announcement.
###### macOS
* [Standalone](/kb/1016/install-mac) variant of the client can now install a launcher for the [Tailscale CLI](/kb/1080/cli) in `/usr/local/bin` by going to **Settings**, **CLI integration**, then **Show me how**.
* Standalone variant of the client now supports notifications when a file is received using [Taildrop](/kb/1106/taildrop).
* Pop-up notification displays when a network might be vulnerable to a potential TunnelVision attack. For more information, see [TunnelVision vulnerability and Tailscale](/kb/1412/tunnel-vision).
* Client starts up more reliably if another VPN app is running when Tailscale is enabled.
* [`.pkg` installer](https://pkgs.tailscale.com/stable/#macos) terminates pre-existing copies of Tailscale and the VPN extension before proceeding with installation if Tailscale was already installed.
* TunnelBear installation is properly detected, and warns the user about incompatibility.
* `Using Exit Node` label no longer appears incorrectly in the app menu before completing onboarding, upon the first time app launch.
* Fixed a bug with split DNS domains being used as search domains after a network change.
###### iOS
* Battery life is optimized by offloading DNS resolution to iOS in more cases.
* Client now starts more reliably if another VPN app is running when Tailscale is enabled.
* Bug report view no longer copies the bug report ID to the clipboard automatically.
* **Reauthenticate** button for in-app key expiry notifications works as expected.
* Dark mode contains minor changes to UI colors.
* Fixed a bug with split DNS domains being used as search domains after a network change.
###### tvOS
* Client now starts more reliably if another VPN app is running when Tailscale is enabled.
* **Reauthenticate** button for in-app key expiry notifications works as expected.
###### Android
* On-off toggle state better matches the actual client state.
* Status notifications when Tailscale is disconnected are now background notifications, and tapping on notifications launches the Tailscale app.
* Client starts automatically after the first login.
* [System policy](/kb/1315/mdm-keys) (MDM) support is added for mandatory exit nodes.
* Organization name is now rendered properly when set in the [`ManagedByOrganizationName`](/kb/1315/mdm-keys#set-your-organization-name) system policy.
* Crashing no longer occurs when launching Tailscale and another VPN application was already running.
* [Running an exit node](/kb/1103/exit-nodes#advertise-a-device-as-an-exit-node) no longer lets you [use another device as an exit node](/kb/1103/exit-nodes#use-the-exit-node) and vice versa.
* Home screen shows the selected exit node country and city when using [Mullvad exit nodes](/kb/1258/mullvad-exit-nodes).
**Note**: The Tailscale client releases for containers such as the [Kubernetes operator](/kb/1236/kubernetes-operator), [Docker](/kb/1282/docker) image, and [tsrecorder](/kb/1246/tailscale-ssh-session-recording) are typically released a few days after the initial client release. A separate changelog will be published when client updates for containers are available.
## [May 30, 2024](#2024-05-30)
* You can now automatically select a [recommended exit node](/kb/1392/auto-exit-nodes) based on client information (such as location).
## [May 24, 2024](#2024-05-24)
* [Exit node](/kb/1103/exit-nodes) destination logging can now be configured from the **Network flow logs** tab in the **Logs** page of the admin console.
## [May 20, 2024](#2024-05-20)
###### All platforms
* Restored UDP connectivity through [Mullvad exit nodes](/kb/1258/mullvad-exit-nodes).
###### Linux
* Stateful filtering is now off by default. Stateful filtering was introduced in 1.66.0 as a mitigation for a vulnerability described in [TS-2024-005](/security-bulletins#ts-2024-005), and inadvertently broke DNS resolution from containers running on the host. Most vulnerable setups are protected by other mitigations already, except when `autogroup:danger-all` is used in [ACLs](/kb/1018/acls).
## [May 15, 2024](#2024-05-15)
*Note*: Tailscale v1.66.2 was an internal-only release.
###### All platforms
* Login URLs did not always appear in the console when running [`tailscale up`](/kb/1080/cli#up).
###### Android
* Reintroduced the Quick Settings title that v1.66.0 temporarily removed.
* Improved the VPN service connection logic, especially when rebooting the device with Always-On VPN enabled.
* The persistent VPN status notification now informs the user with a muted icon when the VPN is disconnected. VPN status notifications can be disabled in the system notification settings.
* The "Enable" button in the exit node selector banner now renders with the correct background color.
###### Kubernetes operator
* Starting with v1.66, the Kubernetes operator must always run the same or later version as the proxies it manages.
* [Expose cloud services](/kb/1440/kubernetes-operator-cloud-services) on cluster network to the tailnet, using Kubernetes `ExternalName` Services. This allows exposing cloud services, such as RDS instances, to tailnet by their DNS names.
* Expose tailnet services that use [Tailscale HTTPS](/kb/1153/enabling-https) to cluster workloads. Refer to [#11019](https://github.com/tailscale/tailscale/pull/11019).
* Cluster workloads can now refer to Tailscale Ingress resources by their MagicDNS names. Refer to [#11019](https://github.com/tailscale/tailscale/pull/11019).
* Configure environment variables for Tailscale Kubernetes operator proxies using `ProxyClass` CRD.
Refer to [`ProxyClass` API](https://github.com/tailscale/tailscale/blob/main/k8s-operator/api.md#proxyclass).
* Expose `tailscaled` metrics endpoint for Tailscale Kubernetes operator proxies through `ProxyClass` CRD. Note that the `tailscaled` metrics are unstable and will likely change in the future. Refer to [`ProxyClass` API](https://github.com/tailscale/tailscale/blob/main/k8s-operator/api.md#proxyclass).
* Configure labels for the Kubernetes operator Pods with Helm chart values. Refer to [Helm chart values](https://github.com/tailscale/tailscale/blob/main/cmd/k8s-operator/deploy/chart/values.yaml).
* Configure affinity rules for Kubernetes operator proxy Pods with `ProxyClass`. Refer to [`ProxyClass` API](https://github.com/tailscale/tailscale/blob/main/k8s-operator/api.md#proxyclass).
* Kubernetes operator proxy `init` container no longer attempts to enable IPv6 forwarding on systems that don't have IPv6 module loaded. Refer to [#11867](https://github.com/tailscale/tailscale/pull/11867).
###### Containers
* Tailscale containers running on Kubernetes no longer error if an empty Kubernetes `Secret` is pre-created for the `tailscaled` state. Refer to [#11326](https://github.com/tailscale/tailscale/pull/11326).
* Improved the ambiguous error messages when Tailscale running on Kubernetes does not have the right permissions to perform actions against the `tailscaled` state `Secret`. Refer to [#11326](https://github.com/tailscale/tailscale/pull/11326).
* Use the **Light**, **Dark**, or **Use system setting** theme in the admin console by clicking the avatar menu on the top-right and selecting **Appearance**. The default theme is **Use system setting**.
## [May 10, 2024](#2024-05-10)
* The Tailscale app for Android is now available in the [Amazon Appstore](https://www.amazon.com/dp/B0D38TRB3N) for [Amazon Fire TVs and tablets](/kb/1394/install-amazon-fire).
## [May 9, 2024](#2024-05-09)
This release is exclusively for Linux platforms and the [standalone variant](/kb/1065/macos-variants) of the macOS client. It is not available for other platforms.
###### Linux
* [`tailscale set`](/kb/1080/cli#set) command flags `--netfilter-mode`, `--snat-subnet-routes`, and `--stateful-filtering` are added.
* Issue with [`nftables`](/kb/1294/firewall-mode) rules for stateful filtering, introduced in v1.66.0.
###### macOS
* A version mismatch warning no longer displays when upgrading, if no mismatch is detected.
## [May 8, 2024](#2024-05-08)
* As part of a security fix to address an issue related to exit nodes and subnet routing ([TS-2024-005](/security-bulletins/#ts-2024-005)), changes are made to [ACLs](/kb/1018/acls).
* The meaning of `\*` when used in the [`src`](/kb/1337/acl-syntax#src) field in ACLs has been changed. Previously, `\*` expanded to include any IPv4 and IPv6 address. With this change, `\*` expands to all [Tailscale IP addresses](/kb/1015/100.x-addresses) and all IP addresses from approved [subnet routes](/kb/1019/subnets).
* The new `autogroup:danger-all` ACL type has been added, which matches the previous definition of `\*` when used in the `src` field. If you are using default ACLs or have specified `\*` in `src`, you don't need to make any ACL changes to get the new secure behavior.
* We recommend updating all Tailscale clients to v1.66 to benefit from the additional security improvements.
We recommend updating all Tailscale clients to v1.66.0 or later to benefit from additional security improvements.
###### All platforms
* Implemented client-side quarantining for shared-in exit nodes, as a mitigation for a security vulnerability described in [TS-2024-005](/security-bulletins#ts-2024-005).
###### Linux
* Use the `--stateful-filtering` flag for the [`tailscale up`](/kb/1241/tailscale-up) to enable stateful filtering for [subnet routers](/kb/1019/subnets) and [exit nodes](/kb/1103/exit-nodes), as a mitigation for a security vulnerability described in [TS-2024-005](/security-bulletins#ts-2024-005).
**Note:** This change can break existing setups that depend on forwarding connections from external hosts (internet, LAN, Docker containers, etc.) into the tailnet through a Tailscale node. If your setup depends on such forwarding, you can disable stateful filtering with the `tailscale up --stateful-filtering=false` command.
* Use [tab completion](/kb/1080/cli#tab-completion) to type the first few letters of a Tailscale CLI command, flag, or arguments, followed by the `tab` key to complete the item being typed. Set up tab completion by using the [`tailscale completion`](/kb/1080/cli#completion) command.
* Use the [`tailscale exit-node suggest`](/kb/1080/cli#exit-node) command to automatically pick an available exit node that is likely to perform best.
* [Site-to-site networking](/kb/1214/site-to-site) now also requires `--stateful-filtering=false` in addition to `--snat-subnet-routes=false` on new subnet routers. Existing subnet routers with `--snat-subnet-routes=false` will default to `--stateful-filtering=false`.
###### macOS
* View a suggested [exit node](/kb/1103/exit-nodes) in the **Exit Node** picker when available.
* Generate a macOS Configuration Report `.txt` file from the **Bug Report** view to help the Tailscale support team diagnose issues.
* Improved error detection logic warns the user when a version mismatch is detected between the Tailscale client GUI and the network extension.
###### iOS
* See direct vs. relayed connections in the **Ping** view.
* View a suggested [exit node](/kb/1103/exit-nodes) in the **Exit Node** picker when available.
* Use [auth keys](/kb/1085/auth-keys) to log in without using the browser.
* Search [tagged devices](/kb/1068/acl-tags) by tag in the **Devices** list.
* Remove accounts in the **Fast User Switching** view by using a long press, without having to log out.
* Improved UI experience to log into a custom coordination server like [Headscale](/blog/opensource#the-open-source-coordination-server).
* The **Fast User Switching** view can now be used when Tailscale is disconnected.
* Improved error detection logic warns the user when a version mismatch is detected between the Tailscale client GUI and the network extension.
* Reduced app launch time.
###### tvOS
* Manage DNS configuration in the **DNS Settings** view.
* Generate a [bug report](/kb/1227/bug-report) identifier by navigating to **About Tailscale** \> **Report an issue**.
* Improved error detection logic warns the user when a version mismatch is detected between the Tailscale client GUI and the network extension.
###### Android
We've rebuilt the Android app from the ground up, adopting a similar design that we've previously rolled out on iOS and using the latest Android best practices.
* Use new status indicators to see at-a-glance insights into node connectivity. Tap on a node to see detailed information.
* See detailed information about resolvers, domains, and routing configurations in a dedicated **DNS Settings** view.
* See the status of [Tailnet Lock](/kb/1226/tailnet-lock) and node keys.
* Use [Fast user switching](/kb/1225/fast-user-switching) to switch between two or more logged-in accounts on the same device, without requiring you to re-authenticate.
* Use [auth keys](/kb/1085/auth-keys) to log in without using the browser.
* Manage Android devices in your tailnet using [Mobile Device Management](/kb/1384/android-mdm) (MDM) solutions such as [Google Workspace](/kb/1386/mdm-google-workspace), [Microsoft Intune](/kb/1327/mmdm-microsoft-intune), or [TinyMDM](/kb/1385/tinymdm), among other tools.
* Accessibility support.
* Use dark mode as an alternative to light mode.
* The **Quick Settings** tile has been temporarily disabled, pending resolution of an issue.
* More intuitive behavior switching between exit nodes.
* Issue with LAN access during exit node use.
## [May 1, 2024](#2024-05-01)
* Device posture management GA ([generally available](/kb/1167/release-stages/#general-availability-ga))
* Use [Device posture management](/kb/1288/device-posture) to collect device properties and set device connectivity rules within your Tailscale network. Leverage [Tailscale's integration with CrowdStrike](/kb/1289/crowdstrike-zta) to use Falcon Zero Trust Assessment (ZTA) scores to enable granular access control based on device health and security.
## [Apr 30, 2024](#2024-04-30)
* The API can now [read](https://github.com/tailscale/tailscale/blob/main/api.md#get-split-dns), [update](https://github.com/tailscale/tailscale/blob/main/api.md#update-split-dns), and [set](https://github.com/tailscale/tailscale/blob/main/api.md#set-split-dns) [split DNS](/kb/1054/dns#nameservers).
* The [Tailscale Terraform provider](https://registry.terraform.io/providers/tailscale/tailscale/latest/docs/resources/dns_split_nameservers) can now manage [split DNS](/kb/1054/dns#nameservers).
## [Apr 23, 2024](#2024-04-23)
* Log streaming integration with [Axiom](https://axiom.co) GA ([generally available](/kb/1167/release-stages/#general-availability-ga)).
* Use Axiom for [log streaming](/kb/1255/log-streaming).
## [Apr 22, 2024](#2024-04-22)
* Windows machines in the admin console are now displayed using their marketing version number instead of their internal version number.
## [Apr 18, 2024](#2024-04-18)
* Allowable [identity providers](/kb/1013/sso-providers) are no longer limited by [pricing plan](/pricing). Any supported identity provider is available to all plans.
## [Apr 17, 2024](#2024-04-17)
###### Windows
* Installers are now built using WiX toolchain [version 3.14.1](https://www.firegiant.com/blog/2024/2/6/wix-security-releases-available/).
###### Synology
* DiskStation Manager UI no longer freezes for a few minutes at startup when attempting to clean unused routes. This update is applicable to the version provided on [pkgs.tailscale.com](https://pkgs.tailscale.com/stable/#spks).
## [Apr 15, 2024](#2024-04-15)
* The Tailscale changelog has migrated to a new server. To prevent disruptions to RSS readers that subscribe to our changelog, we have limited the RSS feed to entries published on or after 2024-04-15. Existing RSS subscriptions should not lose access to older entries that have already been downloaded. The full changelog history is always available on our website
* [Share devices](/kb/1084/sharing) by sending emails directly from the admin console. The email will contain the invitation and instructions on how to accept the device share.
## [Apr 11, 2024](#2024-04-11)
###### All platforms
* [`tailscale serve`](/kb/1080/cli/#serve) headers are now [RFC 2047](https://datatracker.ietf.org/doc/html/rfc2047) Q-encoded.
* Device web interface enabled by default locally on [`100.100.100.100`](/kb/1381/what-is-quad100).
* Go is updated to version 1.22.2.
###### macOS
* Use Tailscale for macOS as a Tailscale SSH client (Standalone variant only).
* Receive alerts when an error occurs while changing client preferences.
* Added a new [Internet Access Policy](https://www.obdev.at/iap/index.html) for [Little Snitch](https://www.obdev.at/products/littlesnitch/index.html) users.
* The `.pkg` installer no longer requires a system restart after installing the client (Standalone variant only).
* Unexpected terminations for some macOS 10.15 Catalina users.
* Reduced number of alerts if the network extension terminates unexpectedly.
###### iOS
* Improved reliability of the ping chart presentation.
###### Synology
* Update certificates using the [`cert`](/kb/1080/cli/#cert) CLI command.
* [IPv6](/kb/1121/ipv6) addresses are available again.
###### Kubernetes operator
* [`tailscale configure kubeconfig`](/kb/1080/cli#configure) now respects `KUBECONFIG` environment variable.
* [`tailscale configure kubeconfig`](/kb/1080/cli#configure) now works with partially empty `kubeconfig`.
* [MSS](https://en.wikipedia.org/wiki/) clamping for Kubernetes operator proxies using [nftables](https://wiki.nftables.org/wiki-nftables/index.php/What_is_nftables?).
###### Containers
* Containers on hosts with partial support for [ip6tables](https://www.man7.org/linux/man-pages/man8/iptables.8.html) no longer crash.
* [Salesforce](https://www.salesforce.com) is available as a [preset app](/kb/1339/preset-apps).
## [Apr 9, 2024](#2024-04-09)
* [External user invites](/kb/1271/invite-any-user) that are unused for 30 days will expire. This includes external invites sent by [email](/kb/1271/invite-any-user#send-an-invite-email) and [link](/kb/1271/invite-any-user#send-an-invite-link).
## [Apr 5, 2024](#2024-04-05)
* [Invite external users](/kb/1271/invite-any-user) by sending emails directly from the admin console. The email will contain the invitation and instructions on how to join the tailnet.
## [Mar 26, 2024](#2024-03-26)
* [ACL Preview](/kb/1338/acl-edit) now shows posture conditions
###### Linux
* Send load balancing hint HTTP request header
###### Windows
* Do not allow `msiexec` to reboot the operating system
###### macOS
* Issue that could cause the Tailscale system extension to not be installed upon app launch, when deploying Tailscale using MDM and using a configuration profile to pre-approve the VPN tunnel (applies to [standalone](/kb/1065/macos-variants) variant only)
###### Synology
* IPv6 routing
###### Kubernetes operator
* [Kubernetes operator](/kb/1236/kubernetes-operator) proxies should not accept subnet routes
## [Mar 22, 2024](#2024-03-22)
* Call [device posture attribute API](/kb/1288/device-posture#posture-attributes-api) endpoints using the [OAuth access token](/kb/1215/oauth-clients#scopes) scope ID `devices` and personal access tokens belonging to users with the [IT admin](/kb/1138/user-roles#it-admin) user role
* Tailscale SSH GA ([generally available](/kb/1167/release-stages#general-availability-ga))
* Use [Tailscale SSH](/kb/1193/tailscale-ssh) to manage the authentication and authorization of SSH connections in your tailnet
## [Mar 18, 2024](#2024-03-18)
* [Download invoices](/kb/1182/billing-information/#download-invoices) for your Tailscale account in the **Billing** page of the admin console ([beta](/kb/1167/release-stages/#beta))
## [Mar 13, 2024](#2024-03-13)
###### All platforms
* [Web interface](/kb/1325/device-web-interface) now uses ACL grants to manage access on tagged devices
* [Tailscale SSH](/kb/1193/tailscale-ssh) connections now disable unnecessary hostname [canonicalization](https://en.wikipedia.org/wiki/Canonicalization)
* [`tailscale bugreport`](/kb/1227/bug-report) command for generating diagnostic logs now contain ethtool information
* Mullvad's [family-friendly server](https://mullvad.net/en/blog/family-friendly-dns-content-blocking-now-added-to-our-encrypted-dns-service) is added to the list of well known DNS over HTTPS (DoH) servers
* DNS over HTTP requests now contain a timeout
* TCP forwarding attempts in [userspace mode](/kb/1177/kernel-vs-userspace-routers#userspace-netstack-mode) now have a per-client limit
* Endpoints with link-local IPv6 addresses is preferred over private addresses
* WireGuard logs are less verbose
* Go is updated to version 1.22.1
* [DERP server](/kb/1232/derp-servers) region no longer changes if connectivity to the new DERP region is degraded
###### Linux
* [Auto-update](/kb/1067/update#auto-updates) version detection on Alpine Linux is improved
* IPv6 support detection in a container environment is improved
* DNS configuration on Amazon Linux 2023 no longer causes an infinite loop
###### Windows
* [`ManagedByOrganizationName`](/kb/1315/mdm-keys#set-your-organization-name), [`ManagedByCaption`](/kb/1315/mdm-keys#set-an-info-message), and [`ManagedByURL`](/kb/1315/mdm-keys#set-a-support-url) system policy keys are now supported
* Tailscale Tunnel WinTun adapter handling is improved
* [MSI](/kb/1189/install-windows-msi) upgrades no longer ignore policy properties set during initial install
###### macOS
* A `.pkg` installer package is now available for the [standalone](/kb/1065/macos-variants) release of the Tailscale client
* [Taildrop](/kb/1106/taildrop) notifications now include actions to reveal the received file in the Finder, or delete it
* [Tailnet Lock](/kb/1226/tailnet-lock) settings UI displays more information about the status, including key and public key trust status
* The onboarding flow now guides the user in enabling the Tailscale system extension
* **Launch Tailscale at login** settings item can now be toggled when the Tailscale client is disconnected
* DNS behavior is improved when handling transitions between network interfaces
###### iOS
* Battery usage is improved
* [Taildrop](/kb/1106/taildrop) notifications now include actions to reveal the received file in the Files app, or delete it
* [Tailnet Lock](/kb/1226/tailnet-lock) settings UI displays more information about the status, including key and public key trust status
* Unnecessary log messages are removed when triggered by changes to device power state and routing
* DNS behavior is improved when handling interface transitions between Wi-Fi and Cellular
###### Android
* Settings persist from previous sign-ins
* Always-on VPN handling is improved
* Custom control server is applied on first start
###### Kubernetes operator
* [Ingress](/kb/1439/kubernetes-operator-cluster-ingress) resource handling is improved when deployed before its backing `Service` resource
* Destination NAT (DNAT) rule management by egress proxies in [`nftables`](/kb/1294/firewall-mode) mode when IP address of `tailscale.com/tailnet-fqdn` changes
## [Mar 7, 2024](#2024-03-07)
* Secret scanning integration with [GitLab](https://gitlab.com/)
* Use [secret scanning](/kb/1301/secret-scanning) to help mitigate accidental disclosure and prevent fraudulent use of [Tailscale-generated keys](/kb/1252/key-secret-management)
* [`sshTests`](/kb/1337/acl-syntax/#sshtests) ACL top-policy section lets you write assertions about your SSH access rules and functions similarly to ACL [`tests`](/kb/1337/acl-syntax/#tests), but for [Tailscale SSH](/kb/1193/tailscale-ssh)
* `user:\*@\<domain\>` [ACL autogroup](/kb/1337/acl-syntax/#autogroups) allows access for any user whose login is in the specified domain and is a direct member of the tailnet
* `localpart:\*@\<domain\>` ACL autogroup allows Tailscale SSH access to a user on the host whose name matches the local-part of the user's Tailscale login
## [Feb 29, 2024](#2024-02-29)
###### All platforms
* Exposing port `8080` to other devices in your tailnet works as expected
## [Feb 23, 2024](#2024-02-23)
* **Users** page of the admin console updated to provide more context around [user invitations](/kb/1271/invite-any-user), [user approval](/kb/1239/user-approval), and your tailnet's [identity provider](/kb/1013/sso-providers)
## [Feb 22, 2024](#2024-02-22)
* Users can only see [exit nodes](/kb/1103/exit-nodes) they have permission to use, based on the [ACL](/kb/1337/acl-syntax#subnet-routers-and-exit-nodes) settings for a tailnet. This includes visibility in the Tailscale client and the output for [Tailscale CLI](/kb/1080/cli) commands such as [`tailscale status`](/kb/1080/cli#status) and [`tailscale exit-node list`](/kb/1080/cli#exit-node).
* Preset Apps GA ([generally available](/kb/1167/release-stages/#general-availability-ga))
* Use [Preset Apps](/kb/1339/preset-apps) to configure common applications with only a few clicks or an ACL configuration. Routes and domains for Preset Apps are automatically updated and managed by Tailscale, based on each app’s source of truth. Routes for preset apps are automatically approved and pushed down to all selected [App connectors](/kb/1281/app-connectors).
* Confluence, GitHub, Google Workspace, Jira, Okta, and Stripe are now available as preset apps
## [Feb 21, 2024](#2024-02-21)
* The Free [pricing plan](/pricing) is now called the Personal plan. All other aspects of the plan remain the same.
* Customers who sign up with a custom domain will be auto-enrolled into a 14-day trial of the Enterprise plan with no provisioned user limits
* Personal plan customers who use a custom or vanity domain for their tailnet can opt out of the trial and continue to use the Personal plan
* Customers who use Tailscale for commercial purposes will be billed for all of their [active users](/kb/1251/pricing-faq#how-are-monthly-active-users-defined) once they sign up for a plan
*Note*: Free trials are available for business customers. For details about billing, plan comparison, and support, see [Pricing & Plans FAQ](/kb/1251/pricing-faq). For instructions on how to change your plan, see [Modify billing](/kb/1182/billing-information).
## [Feb 15, 2024](#2024-02-15)
###### All platforms
* [`tailscale status`](/kb/1080/cli#status) command output now includes location-based exit nodes
* [`tailscale web`](/kb/1080/cli#web) command flag `--read-only` is added to run the web UI in read-only mode
* A warning is logged when unable to find SSH host keys
* Support added for legacy "urn:dslforum-org" port mapping services
* Build with Go 1.22
* Detect when Tailscale is running on Digital Ocean and automatically use Digital Ocean's DNS resolvers
* Expose gVisor metrics in debug mode
* Improve error message when running as non-root
* A valid login page is presented to users when attempting to log in even after leaving device unattended for several days
* An issue with noisy peer mtu discovery errors
* A potential crash when no supported port mapping services are found
###### Windows
* Fixed:`tailscaled` could be slow or cause increased CPU usage with large routing tables
###### macOS
*Note*: Tailscale v1.60.0 is built with Go 1.22 and Go 1.22 is the last release that will run on macOS 10.15 Catalina ([source](https://tip.golang.org/doc/go1.22#darwin)). We are providing notice that around August 15, 2024, Tailscale will be built with Go 1.23 at which time macOS users that want to run the latest version of Tailscale will require macOS 11 Big Sur or later. Note that macOS 10.15 Catalina is no longer supported by Apple and is no longer receiving security updates.
* New UI to add, remove, and switch between user accounts, including using custom control servers
* New UI to change client preferences
* New UI to manage updates for the Standalone variant of the client, including switching in-app between stable and unstable builds
* [VPN On Demand](/kb/1291/ios-vpn-on-demand) is now supported on macOS, to automatically connect/disconnect Tailscale when specific conditions are triggered
* **Reset VPN Configuration** menu item in the **Debug** menu is now available to reset the system VPN configuration if needed
* An alert window is presented when the Tailscale network extension fails to start, providing suggested troubleshooting steps
* Tailscale appears in the macOS Dock when an app window is presented
* The **Network Devices** list now shows all devices known to the control server, not only those seen in the last 4 days
* The onboarding flow automatically advances once the user is connected
* A potential crash and excessive logging upon client launch
* **Start on Login** is set correctly on macOS Ventura and earlier versions
###### iOS
* A potential crash and excessive logging upon client launch
* Stale devices are no longer presented in the devices list
###### tvOS
* A potential crash and excessive logging upon client launch
* Stale devices are no longer presented in the devices list
###### Android
* Mullvad exit nodes now sorted to make it easier to find the best node for each location
* Mullvad tunnels are no longer shown as regular nodes in UI
* Quick settings tile now works
###### Synology
* An issue with stalling of SMB transfers of large files
###### Kubernetes operator
* A new `ProxyClass` custom resource that allows you to provide a custom configuration for cluster resources that the operator creates
* [ACL tags](/kb/1068/acl-tags) for the operator can now be configured via Helm chart values
* Routing to Ingress backends that require an exact path without a slash (`/`) suffix
###### App connectors
* [App connectors](/kb/1281/app-connectors) now flatten DNS CNAME chains down to a target A/AAAA routing record, for apps that are configured with a DNS record that is a CNAME
* Apps can be preconfigured with known routes to have those routes auto-advertised by all selected app connectors, and immediately begin to route traffic
## [Feb 14, 2024](#2024-02-14)
* [Auto-updates](/kb/1067/update#auto-updates) GA ([generally available](/kb/1167/release-stages/#general-availability-ga))
* Enable Tailscale client auto-updates in the **Device management** section of the admin console
* Initiate Tailscale client updates to devices from the **Machines** page of the admin console. For details, see [Auto-updates](/kb/1067/update#auto-updates).
## [Feb 12, 2024](#2024-02-12)
* New Apps and [app connectors](/kb/1281/app-connectors/) can no longer be selected via the `\*` wildcard in a tailnet policy file or configuration flow. Instead, [tag](/kb/1068/acl-tags) all app connectors and then use the tags as a selector. Existing `\*` configurations will need to update to a tag-based selector upon the next tailnet policy file change. For details, see [Wildcard connectors no longer supported](/kb/1281/app-connectors/#considerations).
* System policies GA ([generally available](/kb/1167/release-stages/#general-availability-ga))
* Use [system policies](/kb/1315/mdm-keys) (also known as MDM policies) to control Tailscale client settings for your users, such as UI visibility, organization customization, auto-update functionality, and runtime configurations
## [Feb 5, 2024](#2024-02-05)
* Secret scanning integration with [GitGuardian](https://www.gitguardian.com/)
* Use [secret scanning](/kb/1301/secret-scanning) to help mitigate accidental disclosure and prevent fraudulent use of [Tailscale-generated keys](/kb/1252/key-secret-management)
## [Jan 29, 2024](#2024-01-29)
* Device Posture is now supported in [ACL Tests](/kb/1337/acl-syntax#tests)
## [Jan 23, 2024](#2024-01-23)
*Note:* The 1.58.1 release needed to be re-done. Use 1.58.2 instead.
###### All platforms
* [App connectors](/kb/1281/app-connectors) have improved scheduling and merging of route changes under some conditions
* Crash when performing UPnP portmapping on older routers with no supported portmapping services
###### macOS
* Opening the **About** window no longer displays a user interface when there is no newer version
## [Jan 18, 2024](#2024-01-18)
*Note:* Rollout of 1.58.0 paused on 21-Jan-2024 while we investigate reports of a regression with portmapping.
###### All platforms
* The number of [4via6](/kb/1201/4via6-subnets) site IDs are increased from 256 to 65,536
* [Taildrop](/kb/1106/taildrop) allows category Z unicode characters
* [DERP](/kb/1232/derp-servers) flapping (flipping back and forth between two regions rapidly) is reduced when there's still an active connection for the home DERP server
* [Portmap](/kb/1257/connection-types#hard-nat) checks the epoch from NAT-PMP & PCP, and establishes a new portmapping if it changes
* Portmap better handles multiple interfaces
* Portmap handles multiple UPnP discovery responses
* Increased binary size with Tailscale 1.56 is resolved
* [Web interface](/kb/1325/device-web-interface) issue related to accessing shared devices
* Web interface login issue when accessed over HTTPS
###### Linux
* Shell shebang is added in postinstall script, which fixes some Debian installations
###### macOS
* **DNS Settings** view is added and displays the DNS configuration used when Tailscale is running
* Quit the app without terminating the VPN tunnel by holding down the **Option** button and selecting **Quit (Leave VPN Active)**
* **Toggle Tailscale** shortcut action can be used to connect or disconnect the VPN tunnel, depending on its current state
* The [`KeyExpirationNotice`](/kb/1315/mdm-keys#set-the-key-expiration-notice-period) system policy is now supported to customize the time interval before a key expiration notice is displayed to the user
* The [web interface](/kb/1325/device-web-interface) is now supported in the [standalone](/kb/1065/macos-variants) variant of the client
* Onboarding flow includes a step to ask the user to approve key expiry notifications
* Onboarding flow asks the user to approve the system extension if necessary, when using the standalone variant of the client
* Pre-Sonoma compatibility is improved
* VPN tunnel terminates upon closing the app
* Opening the **About** window triggers a check for updates
* The standalone variant of the client checks for updates every 72 hours
###### iOS
* **Toggle Tailscale** shortcut action can be used to connect or disconnect the VPN tunnel, depending on its current state. Ideal for the **Action Button** on iPhone 15 Pro.
* The [`KeyExpirationNotice`](/kb/1315/mdm-keys#set-the-key-expiration-notice-period) system policy is now supported to customize the time interval before a key expiration notice is displayed to the user
* **Sign** button in the [Tailnet Lock](/kb/1226/tailnet-lock) device sign view is rendered correctly
* Connectivity is no longer lost when transitioning from Wi-Fi to Cellular while an [exit node](/kb/1103/exit-nodes) is in use
###### Windows
* The [web interface](/kb/1325/device-web-interface) is now supported
* The lookup for `netsh.exe` uses the absolute path instead of the relative path
* ADMX [system policy](/kb/1315/mdm-keys) descriptions are now available
* Vestigial wintun support is removed, which might have caused Chocolatey installs to break
* A goroutine leak in winMon no longer occurs if the monitor is never started
* "This package requires Windows 10 or newer" message no longer falsely displays during an uninstall or repair
###### Android
* Active network change detection is improved
###### tvOS
* Improvements to persistence of the client when running in the background
###### Kubernetes Operator
* A Connector custom resource is added, allowing users to configure the operator to deploy an [exit node](/kb/1103/exit-nodes), [subnet router](/kb/1019/subnets), or both
* A warning displays if the unsupported ingress `Exact` path type is used
* StatefulSet labels are synced to their Pods
* A Tailscale [IngressClass](https://kubernetes.io/docs/concepts/services-networking/ingress/#ingress-class) resource is added
* Extra long [Service](/kb/1439/kubernetes-operator-cluster-ingress#loadbalancerclass) names are properly truncated
###### Containers
* Experimental support is added for configuring [`tailscaled`](/kb/1278/tailscaled) using a mounted config file
* Tailscale images now contain layers of the same media type and can be parsed by [Podman](https://podman.io/) and [Buildah](https://buildah.io/)
## [Jan 12, 2024](#2024-01-12)
* Zoho is now supported as a [custom OIDC provider](/kb/1240/sso-custom-oidc)
## [Jan 10, 2024](#2024-01-10)
* Available update icons on the **Machines** page of the admin console now differentiate between regular and security updates
* The Version filter on the **Machines** page can now show nodes with pending security updates
## [Jan 8, 2024](#2024-01-08)
###### Windows
* Added a security fix to address privilege escalation with [`tailscale serve`](/kb/1242/tailscale-serve) and [`tailscale funnel`](/kb/1311/tailscale-funnel) that allowed low-privilege users to serve files they did not have access to ([TS-2024-001](/security-bulletins/#ts-2024-001)). This release is intended for Windows 7 and 8 users. Those with later versions of Windows should run the latest stable version of Tailscale, which is 1.56.1. This issue was resolved in Tailscale 1.52.
## [Jan 2, 2024](#2024-01-02)
* [Invite any user](/kb/1271/invite-any-user) to your tailnet when using a GitHub organization or GitHub personal account as the [identity provider](/kb/1284/sso-github)
## [Dec 20, 2023](#2023-12-20)
* [View the TLS certificate status](/kb/1153/enabling-https/#view-certificate-status) of a machine in your tailnet by using the **Machines** page of the admin console
* HTTPS certificates GA ([generally available](/kb/1167/release-stages/#general-availability-ga))
* Use [HTTPS certificates](/kb/1153/enabling-https) to provision TLS certificates for devices in your tailnet
## [Dec 15, 2023](#2023-12-15)
###### Linux
* [Web interface](/kb/1325/device-web-interface) redirects to the correct self-IP known by the source peer
* [App connector](/kb/1281/app-connectors) domain list displays as expected
###### macOS
* [Custom login server](/kb/1315/mdm-keys#set-a-custom-control-server-url) uses the provided URL instead of the Tailscale default login URL
###### iOS
* [Custom login server](/kb/1315/mdm-keys#set-a-custom-control-server-url) uses the provided URL instead of the Tailscale default login URL
###### tvOS
* [Custom login server](/kb/1315/mdm-keys#set-a-custom-control-server-url) uses the provided URL instead of the Tailscale default login URL
## [Dec 14, 2023](#2023-12-14)
* Use [ACL Grants](/kb/1324/acl-grants) in your [tailnet policy file](/kb/1155/terminology-and-concepts/#tailnet-policy-file) to provide capabilities at either the IP layer or the application layer ([beta](/kb/1167/release-stages/#beta))
* Use [Device posture management](/kb/1288/device-posture) to collect device properties and set device connectivity rules within your Tailscale network ([beta](/kb/1167/release-stages/#beta))
* "Enable posture identity collection" and "Disable posture identity collection" are logged as [configuration audit logging events](/kb/1203/audit-logging/#events) when [device posture identifiers](/kb/1326/device-identity-collection) are enabled or disabled, respectively
* "Create posture integration" is logged when a new [device posture integration](/kb/1289/crowdstrike-zta) is added
* "Update posture integration" is logged when a device posture integration is updated
* "Remove posture integration" is logged when a device posture integration is removed
## [Dec 13, 2023](#2023-12-13)
###### All platforms
* [`tailscale whois`](/kb/1080/cli/#whois) command shows the machine and user associated with a Tailscale IP address
* [System policies](/kb/1315/mdm-keys) are now in [beta](/kb/1167/release-stages/#beta)
* [`tailscale switch --list`](/kb/1080/cli/#switch) command shows name and profile ID to disambiguate profiles with common login names
* Responsiveness is improved under load, especially with bidirectional traffic
* UPnP port mapping is improved
###### Linux
* The [web interface](/kb/1325/device-web-interface) allows users to configure some device settings such as [exit nodes](/kb/1103/exit-nodes), [subnet routers](/kb/1019/subnets), and [Tailscale SSH](/kb/1193/tailscale-ssh) using a browser-based GUI instead of the [Tailscale CLI](/kb/1080/cli/)
* [`tailscale update`](/kb/1080/cli/#update) command is supported for [Unraid](/kb/1307/nas/#unraid)
* `containerboot` symlinks its socket file if possible, making the Tailscale CLI work without `--socket=/tmp/tailscale.sock`
###### Windows
* Throughput is improved for [userspace ("netstack") mode](/kb/1177/kernel-vs-userspace-routers/#userspace-netstack-mode) in the presence of packet loss
* Profile switcher displays the tailnet name
* Dynamic DNS updates are disabled in the client interface via the registry setting
* Client improvements when restarting after an upgrade
###### macOS
* [Taildrop](/kb/1106/taildrop) notification displays when a file is received (App Store variant only)
* Taildrop shortcut action is added for file sharing
* Profile switcher displays the tailnet name
* **About Tailscale** dialog indicates when the app is running a [TestFlight](/kb/1083/install-unstable) build
* In-app warnings and push notifications display when internet connectivity is blocked because the current [exit node](/kb/1103/exit-nodes) is offline or its key has expired
* VPN tunnel fully terminates when Tailscale is stopped, using the menu bar toggle
* `/etc/resolv` file formatting with Tailscaled-on-macOS is improved
###### iOS
* **DNS Settings** view is added
* [Taildrop](/kb/1106/taildrop) shortcut action is added for file sharing
* Taildrop notifications include the received file names
* Profile switcher displays the tailnet name
* **About Tailscale** dialog indicates when the app is running a [TestFlight](/kb/1083/install-unstable) build
* **Allow Local Network Access** option is added to the exit node picker UI
* In-app warning and push notification displays when internet connectivity is blocked because the current [exit node](/kb/1103/exit-nodes) is offline or its key has expired
* App size is reduced by about 2 MB with better asset compression
###### tvOS
* [Apple TV](/kb/1280/appletv) can be configured as a subnet router, allowing you to remotely access resources on your home network that may not have Tailscale installed, such as a printer
* **About Tailscale** dialog indicates when the app is running a [TestFlight](/kb/1083/install-unstable) build
###### Kubernetes
* [Helm charts](/kb/1236/kubernetes-operator/#helm) for the [Tailscale Kubernetes Operator](https://github.com/tailscale/tailscale/blob/main/cmd/k8s-operator/deploy/manifests/operator.yaml) are now available on [pkgs.tailscale.com/helmcharts](https://pkgs.tailscale.com/helmcharts/index.yaml)
* [Kubernetes API server proxy](/kb/1437/kubernetes-operator-api-server-proxy) supports impersonating groups via [ACL Grants](/kb/1324/acl-grants)
* Kubernetes operator [cluster egress](/kb/1438/kubernetes-operator-cluster-egress) now supports referring to a tailnet service by its MagicDNS name in the `Service` annotation
###### GoKrazy
* TUN mode is used by default
## [Dec 12, 2023](#2023-12-12)
* Use [App connectors](/kb/1281/app-connectors) to connect software as a service (SaaS) applications to your Tailscale network ([beta](/kb/1167/release-stages/#beta))
* Use [Regional routing](/kb/1115/high-availability/#regional-routing) to route your traffic across distributed [high availability infrastructure](/kb/1115/high-availability) based on region ([generally available](/kb/1167/release-stages/#general-availability-ga))
## [Dec 5, 2023](#2023-12-05)
* `proto` field is now supported in [ACL tests](/kb/1337/acl-syntax/#tests)
## [Nov 30, 2023](#2023-11-30)
###### macOS
* Changing a pre-existing system policy value to nil no longer causes stability issues
###### iOS
* Changing a pre-existing system policy value to nil no longer causes stability issues
* Widget tracks the connection state more closely
###### tvOS
* Changing a pre-existing system policy value to nil no longer causes stability issues
* Use [IP pool](/kb/1304/ip-pool) to enable configuring a specific CGNAT IP range subset in your [tailnet policy file](/kb/1155/terminology-and-concepts/#tailnet-policy-file) ([alpha](/kb/1167/release-stages/#alpha))
## [Nov 28, 2023](#2023-11-28)
* Each individual [tailnet](/kb/1136/tailnet) can now use the full [CGNAT](/kb/1015/100.x-addresses) address range of 100.64.0.0/10
* [Tailscale IPv6 local addresses](/kb/1033/ip-and-dns-addresses/#tailscale-ipv6-local-address-prefix) are assigned from the [unique local address](https://en.wikipedia.org/wiki/Unique_local_address) prefix of `fd7a:115c:a1e0::/48`. Previously IPv6 addresses were assigned from `fd7a:115c:a1e0:ab12::/64`.
## [Nov 17, 2023](#2023-11-17)
* Log streaming integration with [Datadog](https://www.datadoghq.com/) GA ([generally available](/kb/1167/release-stages/#general-availability-ga))
* Use Datadog for [Log streaming](/kb/1255/log-streaming)
## [Nov 16, 2023](#2023-11-16)
* Require [check mode](/kb/1193/tailscale-ssh/#configure-tailscale-ssh-with-check-mode) on every [Tailscale SSH](/kb/1193/tailscale-ssh) connection by specifying `"checkPeriod": "always"` in your [tailnet policy file](/kb/1155/terminology-and-concepts/#tailnet-policy-file) from the **Access controls** page of the admin console
## [Nov 15, 2023](#2023-11-15)
###### All platforms
* Go is updated to version 1.21.4
###### Linux
* [Substantially improve throughput](/kb/1320/performance-best-practices/#ethtool-configuration) for UDP packets over TUN device with recent Linux kernels
* Added a security fix to address privilege escalation with [`tailscale serve`](/kb/1242/tailscale-serve) and [`tailscale funnel`](/kb/1311/tailscale-funnel) that allowed low-privilege users to serve files they did not have access to if the machine administrator had previously granted that user [`tailscale up --operator`](/kb/1241/tailscale-up) privilege ([TS-2024-001](/security-bulletins/#ts-2024-001))
###### Windows
* Open menu with a regular click in addition to a right-click
###### macOS
* Implement MDM settings for the [standalone macOS application](/kb/1065/macos-variants)
* Support for the [`tailscale update`](/kb/1080/cli/#update) command for the standalone macOS application
* Don't run Taildrop cleanup loop until the first file transfer, and avoid spurious security dialog
###### iOS
* Show a helpful banner if there are no other devices on the tailnet
* Add **Allow Local Network Access** setting when using an exit node
* Show info bubble when key expires within 8 hours, or has expired
* Widgets now reflect the state of the VPN tunnel more accurately
###### QNAP
* Support for the [`tailscale update`](/kb/1080/cli/#update) command
* Scanning for exposed Tailscale secrets
* [Scanning for exposed Tailscale secrets](/kb/1301/secret-scanning) helps mitigate accidental
disclosure and prevent fraudulent use of [Tailscale-generated keys](/kb/1252/key-secret-management)
* Secret scanning integration with TruffleHog
* [TruffleHog](https://trufflesecurity.com/trufflehog/) scans for exposed Tailscale keys
## [Nov 9, 2023](#2023-11-09)
* [Revert](/kb/1203/audit-logging/#reverting-acls-from-audit-logs) your [tailnet policy file](/kb/1155/terminology-and-concepts/#tailnet-policy-file) from the **Configuration logs** page of the admin console
## [Nov 3, 2023](#2023-11-03)
* Log streaming private endpoints GA
* Use [private endpoints](/kb/1255/log-streaming/#private-endpoints) in your tailnet for [Log streaming](/kb/1255/log-streaming) ([generally available](/kb/1167/release-stages/#general-availability-ga))
* [Configuration audit log streaming](/kb/1255/log-streaming) is now available to the [Free plan](/pricing)
* Log streaming integration with [Cribl](https://cribl.io/) GA
* Use Cribl for Log streaming (generally available)
## [Nov 2, 2023](#2023-11-02)
###### Windows
* Resolve an incompatibility with other software that uses wintun
###### NAS platforms
* Clean up downloaded upgrades after applying them
* [Delete](/kb/1145/remove-team-members) non-provisioned users on a tailnet with [user & group provisioning](/kb/1290/user-group-provisioning) enabled
## [Oct 31, 2023](#2023-10-31)
* Use [auto-updates](/kb/1067/update/#auto-updates) ([beta](/kb/1167/release-stages/#beta)) to keep your Tailscale client on the latest version
* [Tailscale Kubernetes operator](/kb/1236/kubernetes-operator/) is now in [beta](/kb/1167/release-stages/#beta)
* Use the Kubernetes operator to expose services in your Kubernetes cluster to your tailnet, connect to your tailnet from a Kubernetes cluster, and securely connect to the Kubernetes control plane
* [Use a Helm chart](/kb/1236/kubernetes-operator/#helm) to deploy the Kubernetes operator
* Tailscale extension for Visual Studio Code GA ([generally available](/kb/1167/release-stages/#general-availability-ga))
* Use the [Tailscale extension for Visual Studio Code](/kb/1265/vscode-extension) to interact with resources in your tailnet from within the VS Code IDE
## [Oct 30, 2023](#2023-10-30)
###### All platforms
* [`tailscale cert`](/kb/1080/cli/#cert) command renews in the background. The current certificate only displays if it has expired.
* [`tailscale status`](/kb/1080/cli/#status) command displays a message about client updates when newer versions are available
* [`tailscale up`](/kb/1080/cli/#up) command displays a message about client updates when newer versions are available
* [Taildrop](/kb/1106/taildrop) now resumes file transfers after partial transfers are interrupted
* Taildrop prevents file duplication
* Taildrop detects conflicting file transfers and only proceeds with one transfer
* Wake on LAN (WoL) is now supported for peer node wake-ups
* TCP DNS queries are speculatively started if UDP hasn't responded quickly enough
* Truncated UDP DNS results are properly retried using TCP
* Go is updated to version 1.21.3
###### Linux
* [`tailscale set`](/kb/1080/cli/#set) command flag `--auto-update` is added to opt in to automatic client updates ([beta](/kb/1167/release-stages/#beta))
* [`tailscale serve`](/kb/1242/tailscale-serve) and [`tailscale funnel`](/kb/1311/tailscale-funnel) commands are updated for improved usability
* [`tailscale update`](/kb/1080/cli/#update) command for manual updates is now in [beta](/kb/1167/release-stages/#beta)
* [Taildrop](/kb/1106/taildrop) file transfer displays a progress meter
* [`nftables`](/kb/1294/firewall-mode) auto-detection is improved when `TS\_DEBUG\_FIREWALL\_MODE=auto` is used
* DNS detection of `NetworkManager` with configured but absent `systemd-resolved`, such as EndeavourOS
* DNS detection for Debian `resolvconf` version 1.90 or later
###### Windows
* [`tailscale set`](/kb/1080/cli/#set) command flag `--auto-update` is added to opt in to automatic client updates ([beta](/kb/1167/release-stages/#beta))
* **Preferences** section contains auto-update setting
* Update notice displays, when a new version is available
* System policies allow system administrators to set a forced/suggested tailnet name, hide settings menu items, and more
* [`tailscale serve`](/kb/1242/tailscale-serve) and [`tailscale funnel`](/kb/1311/tailscale-funnel) commands are updated for improved usability
* [`tailscale update`](/kb/1080/cli/#update) command for manual updates is now in [beta](/kb/1167/release-stages/#beta)
* `iphlpsvc`, `netprofm`, and `WinHttpAutoProxySvc` service dependencies are checked during installation
* Added a security fix to address privilege escalation with [`tailscale serve`](/kb/1242/tailscale-serve) and [`tailscale funnel`](/kb/1311/tailscale-funnel) that allowed low-privilege users to serve files they did not have access to ([TS-2024-001](/security-bulletins/#ts-2024-001))
###### macOS
* [`tailscale set`](/kb/1080/cli/#set) command flag `--auto-update` is added to opt in to automatic client updates ([beta](/kb/1167/release-stages/#beta))
* App menu displays a notification item when a newer version is available
* System policies allow system administrators to set a forced/suggested tailnet name, prevent the VPN from stopping, hide categories of network devices and setting menu items, and more
* **Settings** section has an option added for turning on auto-updates
* **Reauthenticate** menu item shows time until expiry more prominently, presenting alerts when necessary
* [`tailscale serve`](/kb/1242/tailscale-serve) and [`tailscale funnel`](/kb/1311/tailscale-funnel) commands are updated for improved usability
* [`tailscale update`](/kb/1080/cli/#update) command for manual updates is now in [beta](/kb/1167/release-stages/#beta)
* **About** window more clearly distinguishes between the Standalone and App Store [variants](/kb/1065/macos-variants) of the client
* Sparkle is updated to version 2.5.1
###### iOS
* **Settings** page displays a notification banner when a newer version is available on the App Store
* Home and lock screen widgets are supported
* System policies allow system administrators to set a forced/suggested tailnet name, prevent the VPN from stopping, hide the VPN On Demand settings, categories of network devices and settings menu items, and more
###### tvOS
* DNS support when operating as an [exit node](/kb/1280/appletv/#use-a-device-exit-node)
* OAuth clients GA ([generally available](/kb/1167/release-stages/#general-availability-ga))
* Use [OAuth clients](/kb/1215/oauth-clients) to provide delegated fine-grained access to the [Tailscale API](/kb/1101/api)
* Search domains GA ([generally available](/kb/1167/release-stages/#general-availability-ga))
* Use [Search domains](/kb/1054/dns/#search-domains) to set custom DNS domain suffixes that are automatically appended to any domain name that is not a fully qualified domain name (FQDN)
## [Oct 18, 2023](#2023-10-18)
* Use the **Add device** button in the **Machines** page of the admin console to download the Tailscale client. See [Add a device](/kb/1316/device-add) for details.
## [Oct 2, 2023](#2023-10-02)
###### All platforms
* Fixed:`tailscale serve` configuration doesn't persist in container ([#9558](https://github.com/tailscale/tailscale/issues/9558))
* Tailnet Lock fails to sign node in container ([#9539](https://github.com/tailscale/tailscale/issues/9539))
* Funnel doesn't work for `tsnet` apps ([#9566](https://github.com/tailscale/tailscale/issues/9566))
* UPnP potentially crashes in specific circumstances
## [Sep 29, 2023](#2023-09-29)
* [Webhook](/kb/1213/webhooks) events are available in a format for Google Chat
## [Sep 25, 2023](#2023-09-25)
###### All platforms
* [Wikimedia DNS](https://meta.wikimedia.org/wiki/Wikimedia_DNS) using DNS-over-HTTPS is supported
* Build with Go 1.21.1
* [`tailscale update`](/kb/1080/cli/#update) command is unhidden on most platforms
* [`tailscale ping`](/kb/1080/cli/#ping) command sends an ICMP Ping code of `0`
* [`tailscale web`](/kb/1080/cli/#web)command updated to use React
* `tailscale debug portmap` command now has the `--log-http` option
* [`tailscale netcheck`](/kb/1080/cli/#netcheck) command works even if the OS platform lacks CA certificates
* UPnP falls back to a permanent lease if a limited lease fails
* WireGuard peer endpoint selections are improved
###### Linux
* Debian package lists the `iptables` and `iproute2` packages as recommended, not required
* `nftables` support interoperates with Uncomplicated Firewall (UFW)
###### Windows
* [`tailscale bugreport`](/kb/1227/bug-report) logs contain additional diagnostic information
* [Windows executable installer](/kb/1022/install-windows) detects when it is running on Windows 7 or Windows 8.x and will automatically download the appropriate v1.44.2 MSI package, which is the final release supporting those operating systems
* Windows executable installer no longer embeds MSI packages in the executable. Instead, it automatically downloads the correct package. Users desiring the previous behavior may download the "full" executable installer at [pkgs.tailscale.com](https://pkgs.tailscale.com/).
###### macOS
* Shortcuts are added for finding and pinging devices
* [Mullvad Exit Nodes](/kb/1258/mullvad-exit-nodes) allows you to select nodes by country and city
* [Tailnet Lock](/kb/1226/tailnet-lock) reliability improvements
* [Taildrop](/kb/1106/taildrop) no longer replaces spaces with `%20` in file names when sending files to Windows devices
###### iOS
* [Fast user switching](/kb/1225/fast-user-switching) is available
* iOS 17 supports customized device naming from **Settings**
* App Shortcuts in Spotlight and Siri are supported. Try saying: "*Hey Siri, connect to Tailscale*" or "*Hey Siri, is Tailscale connected?*".
* Shortcuts are added for finding and pinging devices
* Mullvad Exit Nodes includes an option to pick the best available node
* UI accessibility improvements when using VoiceOver
* Taildrop no longer replaces spaces with `%20` in file names when sending files to Windows devices
* [VPN On Demand](/kb/1291/ios-vpn-on-demand) rules are no longer reset when disabled and then restarted
* Requests for [OAuth access tokens](/kb/1215/oauth-clients) may now specify a custom set of tags instead of always inheriting the tags from the OAuth client
* Requesting [OAuth access tokens](/kb/1215/oauth-clients) with invalid scopes will now fail rather than returning a token with default scopes
## [Sep 22, 2023](#2023-09-22)
* Use the [Tailscale Kubernetes operator](/kb/1236/kubernetes-operator) to expose a Kubernetes cluster to your tailnet and securely connect to the Kubernetes control plane ([alpha](/kb/1167/release-stages/#alpha))
## [Sep 18, 2023](#2023-09-18)
* Apple TV GA ([generally available](/kb/1167/release-stages/#general-availability-ga))
* Use an [Apple TV](/kb/1280/appletv) to access your media server content remotely, route Apple TV traffic through an [exit node](/kb/1103/exit-nodes), or advertise Apple TV as an exit node
## [Sep 11, 2023](#2023-09-11)
###### All platforms
* Stability improvements for [Mullvad Exit Nodes](/kb/1258/mullvad-exit-nodes), particularly for users on IPv4-only networks
## [Sep 7, 2023](#2023-09-07)
* Use [Mullvad Exit Nodes](/kb/1258/mullvad-exit-nodes) to have [Mullvad VPN](https://mullvad.net/en/why-mullvad-vpn) endpoints as [exit nodes](/kb/1103/exit-nodes/) for your Tailscale network ([beta](/kb/1167/release-stages/#beta))
* "Enable Mullvad VPN for tailnet" and "Disable Mullvad VPN for tailnet" are logged as [configuration audit logging events](/kb/1203/audit-logging/#events) when Mullvad Exit Nodes are [enabled](/kb/1258/mullvad-exit-nodes/#enable-mullvad-exit-nodes) or [disabled](/kb/1258/mullvad-exit-nodes/#disable-mullvad-on-a-device), respectively
## [Aug 31, 2023](#2023-08-31)
* The **Active** status filter option in the **Users** page of the admin console is removed. Use the **Billing** page to track your [active users](/kb/1251/pricing-faq/#how-are-monthly-active-users-defined) instead.
* The **Inactive** badge and status filter option in the **Users** page of the admin console is renamed **Idle**
## [Aug 21, 2023](#2023-08-21)
###### All platforms
* Fix a security vulnerability in UPnP port mapping ([TS-2023-006](/security-bulletins/#ts-2023-006))
###### Linux
* Fixed: Resolve nftables interaction between Tailscale and UFW which
resulted in blocking subnet routed traffic
###### Synology
* Determine correct CPU architecture in `tailscale update` ([#8927](https://github.com/tailscale/tailscale/issues/8927))
## [Aug 18, 2023](#2023-08-18)
* [User & group provisioning for Microsoft Entra ID](/kb/1249/sso-entra-id-scim) ([beta](/kb/1167/release-stages/#beta))
* Sync Microsoft Entra ID groups to use in your [Tailscale ACLs](/kb/1337/acl-syntax/#provisioned-groups)
## [Aug 16, 2023](#2023-08-16)
###### All platforms
* [`tailscale exit-node`](/kb/1080/cli/#exit-node) subcommand
* `--upstream` flag in the [`tailscale version`](/kb/1080/cli/#version) command
* The [`tailscale funnel`](/kb/1080/cli/#funnel) command provides an interactive web UI that prompts you to allow Tailscale to enable Tailscale Funnel on your behalf
* The [`tailscale serve`](/kb/1242/tailscale-serve) command provides an interactive web UI that prompts you to allow Tailscale to enable HTTPS and Tailscale Funnel on your behalf
* [Tailnet Lock](/kb/1226/tailnet-lock/) is in [beta](/kb/1167/release-stages/#beta)
###### Linux
*Note:* 1.48.0 introduced a regression in the interaction between Tailscale and Linux `ufw`. The Linux release has been withdrawn pending a fix.
* Support for [`nftables`](/kb/1294/firewall-mode)
* RPM packages are now fully signed
* Support for the [`tailscale update`](/kb/1080/cli/#update) command on Alpine, Arch and Fedora distro families
###### Synology
* Support for the `tailscale update` command
###### macOS
* Support for the `tailscale update` command
###### iOS
* Support for [VPN On Demand](/kb/1291/ios-vpn-on-demand)
* VPN tunnel lifecycle improvements
* Improved exit node selection
* Minor UI tweaks
* The Tailscale CLI now guides users through enabling [`serve`](/kb/1242/tailscale-serve) and [`funnel`](/kb/1080/cli/#funnel).
* Log streaming integration with [Panther Labs](https://panther.com/) GA ([generally available](/kb/1167/release-stages/#general-availability-ga))
* Use Panther Labs for [Log streaming](/kb/1255/log-streaming/)
* [Tailnet Lock](/kb/1226/tailnet-lock) is now in [beta](/kb/1167/release-stages/#beta)
* Use Tailnet Lock to require your nodes to verify node keys distributed by the
[coordination server](/kb/1155/terminology-and-concepts/#coordination-server) before trusting them
## [Aug 15, 2023](#2023-08-15)
* Use the [Tailscale GitLab CI/CD configuration](/kb/1287/tailscale-gitlab-runner) to access devices in your tailnet directly from your GitLab Runner
## [Aug 11, 2023](#2023-08-11)
* View and interact with machines on your tailnet within the [Tailscale extension for Visual Studio Code](/kb/1265/vscode-extension). Powered by [Tailscale SSH](/tailscale-ssh/), you can remotely manage files, open terminal sessions, or attach remote VS Code sessions.
## [Aug 9, 2023](#2023-08-09)
* Use [private endpoints](/kb/1255/log-streaming/#private-endpoints) ([beta](/kb/1167/release-stages/#beta)) in your tailnet for [log streaming](/kb/1255/log-streaming)
## [Jul 31, 2023](#2023-07-31)
* [autogroup:tagged](/kb/1337/acl-syntax/#autogroups) to refer to all [tagged](/kb/1068/acl-tags) nodes in a tailnet
## [Jul 26, 2023](#2023-07-26)
###### All platforms
* Issue with [Tailnet Lock](/kb/1226/tailnet-lock) signature verification
###### Linux
* Crash issue on ARM64
###### Android
* DNS and subnet routes issue
## [Jul 25, 2023](#2023-07-25)
* Syntax for [autogroups](/kb/1337/acl-syntax/#autogroups) now supports `autogroup:member` in addition to `autogroup:members` when referring to all users in a tailnet
## [Jul 24, 2023](#2023-07-24)
* The `logs:read` OAuth scope can be used to grant API access to [configuration audit logs](/kb/1203/audit-logging)
* The `network-logs:read` OAuth scope can be used to grant API access to [network flow logs](/kb/1219/network-flow-logs)
## [Jul 20, 2023](#2023-07-20)
* The tailnet policy file validation endpoint will now return warnings about SCIM synced groups in addition to errors in the response object. These will be the same warnings you would have seen visually in the admin console if you had tried to save that policy file. See the [user and group provisioning documentation](/kb/1180/sso-okta-scim/#updating-okta-group-names) for more detail.
## [Jul 19, 2023](#2023-07-19)
###### Linux
* Initial support for nftables-based configuration. This option is currently behind a temporary flag for testing and feedback. See [issue #391](https://github.com/tailscale/tailscale/issues/391) for details.
###### Windows
* [Tailnet Lock](/kb/1226/tailnet-lock) is now supported
###### macOS
* Tailnet Lock is now supported
###### iOS
* Tailnet Lock is now supported
* Onboarding flow is added for easier initial setup of the app
* Ping devices on your tailnet from the app
* The app **Machines** page is improved
* The app **Exit Node** section is improved
* The app **Settings** page is improved
* The Tailscale iOS client is updated with significant design and engineering improvements
## [Jul 18, 2023](#2023-07-18)
###### All platforms
* Handling of custom HTTP ports in [`tailscale serve`](/kb/1242/tailscale-serve)
###### Windows
* Restore support for Microsoft Windows 7 and Microsoft Windows 8.x.
Tailscale v1.44.2 will be the last release to support the following operating systems: Microsoft Windows 7, Microsoft Windows 8, Microsoft Windows Server 2008, and Microsoft Windows Server 2012.
## [Jul 11, 2023](#2023-07-11)
* Use Panther Labs ([beta](/kb/1167/release-stages/#beta)) for [Log streaming](/kb/1255/log-streaming)
## [Jul 10, 2023](#2023-07-10)
###### Android
* Various bugs and improvements
## [Jul 5, 2023](#2023-07-05)
* Updated [Terms of Service](/terms)
* Updated [Privacy Policy](/privacy-policy)
## [Jun 29, 2023](#2023-06-29)
* The [Tailscale GitHub Action](https://github.com/tailscale/github-action) now supports use of an [OAuth client](/kb/1215/oauth-clients) for its node authorization. The action also supports running on ARM64 nodes.
* Network flow logs GA ([generally available](/kb/1167/release-stages/#general-availability-ga))
* Use [Network flow logs](/kb/1219/network-flow-logs) to understand which nodes connected to which other nodes, and when, in your tailnet
* Log streaming GA ([generally available](/kb/1167/release-stages/#general-availability-ga))
* Use [Log streaming](/kb/1255/log-streaming) to stream [Configuration audit logs](/kb/1203/audit-logging) and Network flow logs to a security information and event management ([SIEM](/learn/security-information-and-event-management)) system
## [Jun 26, 2023](#2023-06-26)
* Nairobi added as a [DERP region](/blog/how-tailscale-works/#encrypted-tcp-relays-derp)
## [Jun 23, 2023](#2023-06-23)
* **Description** field is added to the **Generate auth key** dialog in the **Keys** page of the admin console
* **Description** field is added to the **Generate access token** dialog in the **Keys** page of the admin console
* **Description** field is added to the **Generate OAuth client** dialog in the **OAuth clients** page of the admin console
## [Jun 21, 2023](#2023-06-21)
Note: This is the last release to support the following operating systems:
• macOS 10.13 High Sierra
• macOS 10.14 Mojave
Tailscale releases after 1.44.0 will no longer install on these operating systems, though we expect to maintain forward compatibility and critical security updates for 1.44.0 with future releases until at least June 30, 2024.
To install Tailscale on a High Sierra or Mojave system, visit the Purchased Items in the App Store Account page. macOS High Sierra or Mojave systems will be offered Tailscale 1.44 when the download link is clicked. If Tailscale does not appear in the Purchased Items it must first be successfully installed using a recent macOS system. The Tailscale app will then be available for the High Sierra or Mojave system to install from Purchased Items.
###### All platforms
* [`tailscale serve http`](/kb/1242/tailscale-serve) command to serve over HTTP (tailnet only)
* [`tailscale ssh`](/kb/1080/cli/#ssh) command now supports remote port forwarding
* Recursive DNS resolution is now initially supported to replace bootstrapDNS when operating in a parallel mode
* Build with Go 1.20.5
* `--tun-userspace-networking` stability improvements for userspace subnet routers
* MagicSock private addresses are given preference when both private and public are available, to help keep traffic in private VPCs, where possible
* Async support is removed from the `portlist` package. Update to use synchronous `Poll()` if this breaks your package.
* `WatchIPNBus` now only requires read-only permissions to read
* [`tailscale cert`](/kb/1080/cli/#cert) renewal decision is now based on the lifetime of the certificate instead of hard-coded. This better supports 14 day certificate lifetimes.
###### Linux
* Changed:`tailscale ssh` support improvements for Security-Enhanced Linux (SELinux) systems
* Changed:`tailscale ssh` supports user names with up to 256 characters
* `build\_dist.sh` better supports operating systems and CPU architectures which Tailscale release builds do not include
* The iputils package can now be installed on Alpine-based Docker containers
###### Windows
* PreferGo supports better DNS caching
###### macOS
* ICMP6 forwarding works as expected when running as a subnet router
###### FreeBSD
* ICMP6 forwarding works as expected when running as a subnet router
###### OpenBSD
* ICMP6 forwarding works as expected when running as a subnet router
###### WASI
* tsnet applications compiled to WebAssembly are now better supported
## [Jun 15, 2023](#2023-06-15)
* The Tailscale app for [QNAP](/kb/1273/qnap) is now available in the QNAP App Center
## [Jun 14, 2023](#2023-06-14)
* IPv6 addresses can now be directly specified in [ACL](/kb/1337/acl-syntax) rules and tests.
## [Jun 13, 2023](#2023-06-13)
* Codeberg and Gitea supported as [custom OIDC providers](/kb/1240/sso-custom-oidc)
## [Jun 9, 2023](#2023-06-09)
* [Edit group membership](/kb/1337/acl-syntax/#edit-a-users-group-membership-from-the-users-page)
in the **Users** page of the admin console
* Setup for [custom OIDC providers](/kb/1240/sso-custom-oidc) provides the option for specifying a prompt
(`none`, `consent`, `login`, `select\_account`) for the user authentication page. *If your
tailnet was already using a custom OIDC provider, we updated your setup automatically to use
`consent`, which prior to today was the only supported value.*
* Ping Identity is now available as a [custom OIDC provider](/kb/1240/sso-custom-oidc)
## [Jun 6, 2023](#2023-06-06)
* Changed: When logging in to a node that has an expired key in a tailnet that has enabled
[Tailnet Lock](/kb/1226/tailnet-lock), an error message is returned, directing you to
[reauthenticate](/kb/1272/reauth-under-tailnet-lock) instead of logging in, or to delete the
machine from within the admin console before logging in again
## [May 31, 2023](#2023-05-31)
* [Invite any user](/kb/1271/invite-any-user) to your tailnet with a URL invitation ([beta](/kb/1167/release-stages/#beta))
* "User joined external tailnet" is logged as a [configuration audit logging event](/kb/1203/audit-logging/#events) when a user in your tailnet joins [another tailnet](/kb/1271/invite-any-user)
* The **Leave tailnet** option has been added to the Tailscale **Login** page
* The **Leave tailnet** menu option has been added to the **Users** page of the admin console for the selected user
* "User left external tailnet" is logged as a [configuration audit logging event](/kb/1203/audit-logging/#events) when a user in your tailnet leaves [another tailnet](/kb/1271/invite-any-user/)
* Use a [passkey](/kb/1269/passkeys) to authenticate to a tailnet ([beta](/kb/1167/release-stages/#beta))
* **Sign in with passkey** option is added to the Tailscale **Login** page
* Use the [Tailscale extension for Visual Studio Code](/kb/1265/vscode-extension) to interact with resources in your tailnet from within the VS Code IDE ([beta](/kb/1167/release-stages/#beta))
## [May 25, 2023](#2023-05-25)
* Manage [Tailnet Lock](/kb/1226/tailnet-lock) from the **Device management** page of the admin console, when enabled
* Improved UI for Tailnet Lock settings in the **Machines** page of the admin console
## [May 24, 2023](#2023-05-24)
Note: This is the last release to support the following operating systems:
• Microsoft Windows 7
• Microsoft Windows 8
• Microsoft Windows Server 2008
• Microsoft Windows Server 2012
Tailscale releases after 1.42.0 will no longer install on these operating systems, though we expect to maintain forward compatibility and critical security updates for 1.42.0 with future releases until at least May 31, 2024.
Note: Do not install this version of the Tailscale client on macOS 10.13. Upgrade to version 1.44.0 instead.
###### All platforms
* [`tailscale serve reset`](/kb/1242/tailscale-serve/) command to clear out the current
serve configuration
* Changed: Update internal DNS handling to better support mixtures of global and private DNS
servers
###### Linux
* SSH login on platforms which lack `getent`
###### Windows
*Note: This release switches to a new application signing certificate, which is valid through 2025.*
* Notification icons are updated
###### macOS
* Update Sparkle to check more regularly
* Taildrop delivery of incomplete files
###### iOS
* **Delete Account** button to redirect to the admin panel
* Better handle memory management to avoid hitting 50 MByte memory limit
###### Unraid
* Support Unraid as a NAS platform similar to how Synology and QNAP are handled
###### Kubernetes
* Support for `priorityClassName`
## [May 22, 2023](#2023-05-22)
* [ACL tags](/kb/1068/acl-tags) for auth keys created via API are lowercased
* [Custom OIDC providers](/kb/1240/sso-custom-oidc) ([generally available](/kb/1167/release-stages/#general-availability-ga))
* Use a custom OIDC provider for authentication to your tailnet
## [May 16, 2023](#2023-05-16)
* [Webhook](/kb/1213/webhooks) events are available in formats for Discord and Mattermost
## [May 11, 2023](#2023-05-11)
* Use [Tailscale SSH session recording](/kb/1246/tailscale-ssh-session-recording) to stream Tailscale SSH session logs to a designated node in your tailnet ([beta](/kb/1167/release-stages/#beta))
## [May 10, 2023](#2023-05-10)
###### Linux
* [Tailscale SSH](/kb/1193/tailscale-ssh) is now supported for LDAP users
* Support for Tailscale SSH session recording to a local file is restored
* Debian and RPM packages for MIPS architecture generate as expected
###### Windows
* Notification icons are updated
* The 32-bit [Windows installer](/kb/1022/install-windows) for the Tailscale client works as expected
###### macOS
* [`tailscale cert`](/kb/1080/cli/#cert) command no longer causes timeout failures
###### Kubernetes
* The Tailscale version displays in the startup logs
## [May 5, 2023](#2023-05-05)
* Authelia is now available as a [custom OIDC provider](/kb/1240/sso-custom-oidc) ([beta](/kb/1167/release-stages/#beta))
## [May 4, 2023](#2023-05-04)
* Apple is now available as a [supported SSO identity provider](/kb/1013/sso-providers), for
[all plans](/pricing)
## [Apr 28, 2023](#2023-04-28)
* Use [Search Domains](/kb/1054/dns/#search-domains) to configure DNS for accessing network resources without having to specify the full domain path ([beta](/kb/1167/release-stages/#beta))
## [Apr 27, 2023](#2023-04-27)
* "Create logstream endpoint for tailnet", "Update logstream endpoint for tailnet", and "Delete logstream endpoint for tailnet" are logged as [configuration audit logging events](/kb/1203/audit-logging/#events) for [Log streaming](/kb/1255/log-streaming)
* Use [Log streaming](/kb/1255/log-streaming) to stream [configuration audit logs](/kb/1203/audit-logging)
and [network flow logs](/kb/1219/network-flow-logs) to a security information and event
management ([SIEM](/learn/security-information-and-event-management/)) system ([beta](/kb/1167/release-stages/#beta))
## [Apr 26, 2023](#2023-04-26)
###### All platforms
* [`tailscale up --force-reauth`](/kb/1241/tailscale-up) will now display a warning and 5 second countdown
if you are connected over SSH over Tailscale, unless `--accept-risk=lose-ssh` is also given
* Tailscale now dynamically increases the buffer size for DERP relay messages based on the amount of available RAM ([#7776](https://github.com/tailscale/tailscale/pull/7776))
* Improvements were made to how Tailscale advertises available endpoints to reduce the likelihood of a spurious loss of direct connections ([#7877](https://github.com/tailscale/tailscale/pull/7877))
###### Linux
* Substantially higher throughput—for details, see [Surpassing 10Gb/s over Tailscale](/blog/more-throughput)
* Improved CPU consumption on systems with a very large (1M+) routing table
###### Windows
* Redo migration of pre-[Fast-User-Switching](/kb/1225/fast-user-switching) state for better robustness
###### macOS
* "Settings" replaces "Preferences" as a menu item on macOS Ventura
###### Android
* Added intents `com.tailscale.ipn.CONNECT\_VPN` and `com.tailscale.ipn.DISCONNECT\_VPN`
###### gokrazy
* [Tailscale SSH](/kb/1193/tailscale-ssh) now works
###### QNAP
* UI failure after reboot
## [Apr 24, 2023](#2023-04-24)
* The **Machines** page of the
admin console has been updated to use **Version** as a column heading instead of
**OS**, and to show the Tailscale [client version](/kb/1168/versions) prior to the operating system name
## [Apr 21, 2023](#2023-04-21)
* "Update auto approved routes for node" is logged as a [configuration audit logging event](/kb/1203/audit-logging/#events) for [routes](/kb/1019/subnets) advertised by the node that are updated using [autogroups](/kb/1337/acl-syntax/#autogroups)
* "Update approved routes for node" replaces "Update advertised routes for node" in Configuration audit logging events
* `nodeDeleted` [webhook](/kb/1213/webhooks) event is now generated when a node is removed from the tailnet, including automatic removal of [ephemeral nodes](/kb/1111/ephemeral-nodes)
## [Apr 20, 2023](#2023-04-20)
* [Sync Tailscale ACLs](https://gitlab.com/tailscale-dev/gitops-acl-ci) GitLab CI Template to [keep your tailnet policy file in GitLab](/kb/1254/gitops-acls-gitlab), and automatically run tests and push changes to Tailscale
## [Apr 19, 2023](#2023-04-19)
* `autogroup:billing-admin` and `autogroup:auditor` added as [autogroups](/kb/1337/acl-syntax/#autogroups)
## [Apr 18, 2023](#2023-04-18)
* "Enable network flow logging for tailnet" and "Disable network flow logging for tailnet" are logged as [Configuration audit logging events](/kb/1203/audit-logging/#events) for [Network flow logs](/kb/1219/network-flow-logs)
* The **Billing** page of the admin console is updated to show new Tailscale [pricing](/pricing) plans and a tailnet's monthly active users
* Use [Network flow logs](/kb/1219/network-flow-logs) to understand which nodes connected to which other nodes, and when, in your tailnet ([beta](/kb/1167/release-stages/#beta))
* Auth0, Authentik, Dex, Duo, GitLab, JumpCloud, Keycloak, Ory, and ZITADEL are now available as [custom OIDC providers](/kb/1240/sso-custom-oidc) ([beta](/kb/1167/release-stages/#beta))
* The available [pricing plans](/pricing) are Free, Starter, Premium, and Enterprise. [Community on GitHub](/kb/1154/free-plans-discounts/#community-on-github) projects remain free, and discounts remain available for [charities, not-for-profit organizations, and educational institutions](/kb/1154/free-plans-discounts#charities-not-for-profit-organizations-and-educational-institutions). If you want, you can keep your old plan until *at least* April 30, 2024.
* The Free plan has three free users
* All plans only pay for incremental usage above three users
## [Apr 7, 2023](#2023-04-07)
* `autogroup:admin`, `autogroup:it-admin`, `autogroup:network-admin`, and `autogroup:owner`
added as [autogroups](/kb/1337/acl-syntax/#autogroups)
## [Apr 6, 2023](#2023-04-06)
* Click on a machine's IP address in the **Machines**
page of the admin console to display a machine address copy card. Within the machine address card, click to copy the MagicDNS name, IPV4 address, or IPV6 address of the machine to your clipboard.
## [Apr 5, 2023](#2023-04-05)
###### All platforms
* Build with Go 1.20.3 to address security fixes ([CVE-2023-24537, CVE-2023-24538, CVE-2023-24534, and CVE-2023-24536](https://groups.google.com/g/golang-announce/c/Xdv6JL9ENs8)). These address potential DoS attacks against DNS over HTTPS and Funnel that can occur over the public internet, and PeerAPI attacks launched from other nodes already on the tailnet.
* Added path support for proxy targets with [`tailscale serve`](/kb/1080/cli/#serve)
* Error displays when trying to use [Funnel](/kb/1223/tailscale-funnel) and [`tailscale up --shields-up`](/kb/1241/tailscale-up) simultaneously
###### Windows
* When connected to a Windows 10 client using [Windows RDP](/kb/1095/secure-rdp-windows), the Tailscale taskbar right-click option for the remote client works as expected ([#7698](https://github.com/tailscale/tailscale/issues/7698))
## [Apr 4, 2023](#2023-04-04)
* "Log in using the web interface" and "Log out using the web interface" are logged as [Configuration audit logging events](/kb/1203/audit-logging/#events) for the [Member](/kb/1138/user-roles/#member) user role. These events differentiate logins from users with access to the admin console.
## [Mar 31, 2023](#2023-03-31)
* [Tailnet Lock](/kb/1226/tailnet-lock) works with [shared nodes](/kb/1084/sharing) and [Tailscale SSH console](/kb/1216/tailscale-ssh-console)
## [Mar 30, 2023](#2023-03-30)
* [Tailscale Funnel](/kb/1223/tailscale-funnel) ([beta](/kb/1167/release-stages/#beta))
* Route traffic from the wider internet to one or more of your Tailscale nodes.
## [Mar 29, 2023](#2023-03-29)
###### All platforms
* Support for stripping HTTP request paths from Funnel proxy routes ([#6571](https://github.com/tailscale/tailscale/issues/6571))
* [Tailscale Funnel](/kb/1223/tailscale-funnel) is now [beta](/kb/1167/release-stages/#beta)
* [`tailscale serve`](/kb/1242/tailscale-serve) issue that did not use actual `SrcAddr` as `X-Forwarded-For`
###### Linux
* Certificate storage issue that did not actually use Kubernetes secrets
###### Windows
* Upgraded the Walk framework for the GUI client to improve menu responsiveness
## [Mar 28, 2023](#2023-03-28)
* [Invite multiple users at once and administer invites](/kb/1064/invite-team-members) from the **Users** page of the admin console
* "Invite user to join tailnet" is logged as a [Configuration audit logging event](/kb/1203/audit-logging/#events)
## [Mar 27, 2023](#2023-03-27)
* [Tailscale collects sales tax](/kb/1182/billing-information/#sales-tax) for jurisdictions
that require it, except for organizations with tax exempt status
* Use a [custom OIDC provider](/kb/1240/sso-custom-oidc) for authentication to your tailnet ([beta](/kb/1167/release-stages/#beta))
## [Mar 22, 2023](#2023-03-22)
###### All platforms
* `tailscale lock tskey-wrap` has been replaced by [`tailscale lock sign`](/kb/1243/tailscale-lock/#lock-sign)
* `tailscale lock sign` now supports signing auth keys
###### Linux
* `--tun=userspace-networking` issue running in [Azure App Services](/kb/1126/azure-app-service)
###### macOS
* Sparkle automatically checks [updates for the standalone package](https://pkgs.tailscale.com/stable/#macos). This does not impact the App Store package.
###### FreeBSD
* Fixed: Issue setting the effective group ID on some non-interactive Tailscale SSH
sessions. This issue is specific to FreeBSD's implementation of `setgroups` and does not
impact other platforms.
## [Mar 17, 2023](#2023-03-17)
* Create multi-use invite links in the **Machines** page of the admin console, for [sharing nodes](/kb/1084/sharing)
## [Mar 14, 2023](#2023-03-14)
###### All platforms
* [`tailscale configure`](/kb/1080/cli/#configure) command to configure resources that you want to include in your tailnet
* [`tailscale lock sign`](/kb/1243/tailscale-lock/#lock-sign) to sign [pre-approved auth keys](/kb/1085/auth-keys) for use with [Tailnet Lock](/kb/1226/tailnet-lock)
* `tailscale debug derp` command to help diagnose DERP-related difficulty
* `tailscale debug capture` command to write packet capturing for debugging
* The `tailscale debug portmap` command replaces `tailscaled debug -portmap`. This is now available on platforms without a `tailscaled` binary (like the macOS App Store).
* [`tailscale serve`](/kb/1242/tailscale-serve) command has been overhauled
* `tailscale serve funnel` has been made into its own command, [tailscale funnel](/kb/1080/cli#funnel)
* Several improvements to UPnP port mapping have been made that allow it to work with a broader set of home routers
###### Linux
* Certificates can be stored in Kubernetes secret storage
###### Windows
* MSI installers start the GUI without user interaction to allow remote upgrades
###### macOS
* Notification upon node key expiration (only on macOS 10.14 and later)
* [Tailscale SSH](/kb/1193/tailscale-ssh) server component is available for macOS open source [Tailscale + tailscaled CLI devices](https://github.com/tailscale/tailscale/wiki/Tailscaled-on-macOS)
###### iOS
* Support for alternate control servers by setting the URL in Settings page of the admin console
###### Android
* Chromecast support while Tailscale is active
*Note: v1.38.0 was never released.*
## [Mar 10, 2023](#2023-03-10)
* Use [user approval](/kb/1239/user-approval) to require an admin to approve a user before
they can join a tailnet ([beta](/kb/1167/release-stages/#beta))
* New: Enable user approval for tailnet, Disable user approval for tailnet, and Approve user
actions are logged as [Configuration audit logging events](/kb/1203/audit-logging/#events)
* `userNeedsApproval` and `userApproved` events are available as [webhook events](/kb/1213/webhooks/#events)
## [Mar 9, 2023](#2023-03-09)
* **Device management** section is added to the **Settings** page of the admin console
* **User management** section is added to the **Settings** page of the admin console
* **Feature Previews** section is removed from the **Settings** page of the admin console. All feature previews are now located in the **General** page.
* **Identity Provider** and **User & Group Provisioning** options are moved from the **General** page to the **User management** page of the admin console
* **Device Approval** and **Key Expiry** options are moved from the **General** page to the **Device management** page of the admin console
* **Billing** drop-down option for logged in users is removed from the admin console. Use the **Billing** section in the **General** page instead.
## [Mar 8, 2023](#2023-03-08)
* [Docker Desktop extension](/kb/1184/docker-desktop) ([generally available](/kb/1167/release-stages/#general-availability-ga))
* Use the Tailscale extension for Docker Desktop to securely connect to the resources you need for development
## [Feb 27, 2023](#2023-02-27)
* `userRoleUpdated` [webhook](/kb/1213/webhooks) event is now generated when a user role is [changed](/kb/1171/changing-user-roles)
## [Feb 22, 2023](#2023-02-22)
###### macOS
* Prevent using an exit node while being an exit node
* Improve detection of default interface
###### iOS
* Improve detection of default interface
###### Windows
* Improve clean out of registry entries during upgrade
* [Billing admin](/kb/1138/user-roles/#billing-admin) role to manage pricing plan and billing information, but not modify other tailnet settings
* All users with the [Admin](/kb/1138/user-roles/#admin) role can manage pricing plan and billing information
* [Configuration audit logging](/kb/1203/audit-logging) no longer includes "Update billing owner for tailnet" events. Changes to Billing admin roles are included in "Update role for user" events
## [Feb 21, 2023](#2023-02-21)
* `webhookUpdated` and `webhookDeleted` events are now generated when a
[webhook](/kb/1213/webhooks) is updated or deleted. These events are
subscribed by default and cannot be disabled.
## [Feb 13, 2023](#2023-02-13)
* "[Device approval](/kb/1099/device-approval)" replaces "Device authorization" as the name of the feature in the **General** settings page of the admin console
* "[Needs approval](/kb/1176/filter-devices/#filter-by-disabled)" replaces "Needs authorization" in the **Disabled** filter of the **Machines** page
* "[Pre-approved](/kb/1085/auth-keys/#types-of-auth-keys)" replaces "Pre-authorized" in the **Generate auth key** dialog of the **Keys** page
* "nodeApproved" replaces "nodeAuthorized" in [webhook events](/kb/1213/webhooks/#events)
* "nodeNeedsApproval" replaces "nodeNeedsAuthorization" in webhook events
* "Enable device approval for tailnet" replaces "Enable device authorization for tailnet" in [Configuration audit logging events](/kb/1203/audit-logging/#events)
* "Disable device approval for tailnet" replaces "Disable device authorization for tailnet" in Configuration audit logging events
* "Approve node" replaces "Authorize node" in Configuration audit logging events
## [Feb 10, 2023](#2023-02-10)
* [userCreated event](/kb/1213/webhooks/#events) in the Tailnet management category when a user is created
## [Feb 8, 2023](#2023-02-08)
* Generate auth keys to `stdout` for scripting with [`get-authkey` utility](/kb/1215/oauth-clients/#get-authkey-utility)
###### All Platforms
* Potential infinite loop when node key expires
###### macOS
* Handle starting the app before network interfaces are ready
###### iOS
* Handle starting the app before network interfaces are ready
* Get Status intent will not connect the VPN
###### Windows
* Potential crash in netstat handling
* Windows 7 checks for KB2533623
## [Jan 30, 2023](#2023-01-30)
* [Configuration audit logging](/kb/1203/audit-logging) ([generally available](/kb/1167/release-stages/#general-availability-ga))
* Identify who did what, and when, in your tailnet
## [Jan 27, 2023](#2023-01-27)
* Accept invite for feature events in [configuration audit logs](/kb/1203/audit-logging) no longer include the acceptor in the sharer's logs
## [Jan 26, 2023](#2023-01-26)
* Use [OAuth clients](/kb/1215/oauth-clients) to provide delegated fine-grained access to the [Tailscale API](/kb/1101/api) ([beta](/kb/1167/release-stages/#beta))
## [Jan 25, 2023](#2023-01-25)
* [Automate tasks](/kb/1233/mac-ios-shortcuts) with Tailscale actions for iOS and
macOS Shortcuts
## [Jan 24, 2023](#2023-01-24)
###### All Platforms
* `--json` flag for the [`tailscale lock status`](/kb/1243/tailscale-lock/#lock-status) and
[`tailscale lock log`](/kb/1243/tailscale-lock/#lock-log) commands
* `--json` flag for the [`tailscale version`](/kb/1080/cli/#version) command
* [`tailscale update`](/kb/1080/cli/#update) command to update client
* `tailscale debug daemon-logs` to watch server logs
* [`tailscale status --json`](/kb/1080/cli/#status) now includes `KeyExpiry` time and `Expired` boolean on nodes
* [`tailscale version`](/kb/1080/cli/#version) now advertises when you're on the [unstable](/kb/1083/install-unstable) (dev) track
* (Unix platforms) When `/etc/resolv.conf` needs to be overwritten for lack of options, a
comment in the file now links to [https://tailscale.com/s/resolvconf-overwrite](https://tailscale.com/s/resolvconf-overwrite)
* [Tailscale SSH](/kb/1193/tailscale-ssh): SSH to `tailscaled` as a non-root user works again,
as long as you only SSH to the same user that `tailscaled` is running as
* Fixed: Handle cases where a node expires and we don't receive an update about it from the control
server ([#6929](https://github.com/tailscale/tailscale/issues/6929) and
[#6937](https://github.com/tailscale/tailscale/issues/6937))
* Fixed: Support UPnP port mapping of gateway devices where they are deployed as a highly available
pair ([#6946](https://github.com/tailscale/tailscale/issues/6946))
* Support arbitrary IP protocols like EOIP and GRE ([#6423](https://github.com/tailscale/tailscale/issues/6423))
* Exit node handling of a large number of split DNS domains ([#6875](https://github.com/tailscale/tailscale/issues/6875))
* Accept DNS-over-TCP responses up to 4K bytes ([#6805](https://github.com/tailscale/tailscale/pull/6805))
###### Linux
* Add build support for Loongnix CPU architecture
* [Improved throughput performance](/blog/throughput-improvements) on Linux ([#6663](https://github.com/tailscale/tailscale/issues/6663))
###### macOS
* Tailscale actions (connect, disconnect, switch profile, use exit node) are available in the Shortcuts app (read the [blog post](/blog/ios-macos-shortcuts))
* Tailscale traffic looping upon certain sleep/resume/Wi-Fi change transitions ([#5156](https://github.com/tailscale/tailscale/issues/5156))
###### iOS
* Tailscale actions (connect, disconnect, use exit node) are available in the Shortcuts app
* Tailscale using cellular data even after Wi-Fi becomes available ([#6565](https://github.com/tailscale/tailscale/issues/6565))
###### Windows
* Add a more robust mechanism to remove WinTun ([#6433](https://github.com/tailscale/tailscale/issues/6433))
* Update taskbar menu radio button implementation
###### Android
* New version of the Gio UI library with internationalization and accessibility fixes
* Allow Sonos app to discover local devices while Tailscale is connected
###### Synology
* Show whether outgoing connections are configured in the web UI
###### Containers
* Run in a Kubernetes environment without setting `TS\_KUBE\_SECRET` ([#6704](https://github.com/tailscale/tailscale/issues/6704))
###### OpenBSD
* [Tailscale SSH](/kb/1193/tailscale-ssh) runs on OpenBSD
## [Jan 20, 2023](#2023-01-20)
* The Tailscale **Login** page describes the action taking
place, such as adding a new device or authorizing SSH access. For some actions, like adding a
new node, a second redirection page will be used as a confirmation step.
* UI functionality to [request access](/kb/1222/invite-only-feature/#joining-a-feature-invitation-waitlist) to [Tailscale Funnel](/kb/1223/tailscale-funnel)
## [Jan 18, 2023](#2023-01-18)
* UI functionality to [delete the legacy `beta.tailscale.net` nameserver](/kb/1081/magicdns/#removing-the-betatailscalenet-nameserver) if you are no longer using it
## [Jan 17, 2023](#2023-01-17)
* Available as an application in [Scoop](https://scoop.sh) in [Extras bucket](https://github.com/ScoopInstaller/Extras/blob/master/bucket/tailscale.json)
## [Jan 12, 2023](#2023-01-12)
* Updated [Terms of service](/terms)
* Updated [Privacy policy](/privacy-policy)
* [Data Privacy Addendum](/dpa) and [list of subprocessors](/dpa-subprocessors)
## [Jan 4, 2023](#2023-01-04)
###### Linux
* Handling of a very large number of SplitDNS domains with an exit node
###### macOS
* UI glitch with macOS 10.14 and 10.13
###### Windows
* Custom server URL from registry key support
###### Synology
* Crashes manifesting on ARM-based platforms and models with very old kernels
## [Jan 3, 2023](#2023-01-03)
* Access your tailnet from GitHub Codespaces [using Tailscale as a feature in a dev container](/kb/1160/github-codespaces/#integration) (Thanks [Ross Light](https://github.com/zombiezen)!)
## [Dec 16, 2022](#2022-12-16)
* [User & group provisioning for Okta](/kb/1180/sso-okta-scim) ([generally available](/kb/1167/release-stages/#general-availability-ga))
* Sync Okta groups to use in your Tailscale ACLs
* `nodeID` included in all node-related [webhook](/kb/1213/webhooks) event payloads
## [Dec 14, 2022](#2022-12-14)
* Use [Tailnet Lock](/kb/1226/tailnet-lock) to require your nodes to verify node keys distributed by the
[coordination server](/kb/1155/terminology-and-concepts/#coordination-server) before trusting them ([alpha](/kb/1167/release-stages/#alpha))
## [Dec 13, 2022](#2022-12-13)
###### Linux
* Unit tests on systems using `busybox ip`
* Regression handling `TS\_STATE\_DIR` in containerboot
###### macOS
* Issue which could fail to save the key for [`tailscale serve`](/kb/1080/cli/#serve) ([#6409](https://github.com/tailscale/tailscale/issues/6409))
* Issue which could cause crash when interfaces change ([#6641](https://github.com/tailscale/tailscale/issues/6641))
###### Windows
* Common cause of an issue with [Tailscale SSH](/kb/1193/tailscale-ssh) ([#6639](https://github.com/tailscale/tailscale/issues/6639))
## [Dec 7, 2022](#2022-12-07)
* Use the admin console to [export a list of devices](/kb/1228/export-device-list) and
[export a list of users](/kb/1229/export-user-list) in your tailnet
## [Dec 5, 2022](#2022-12-05)
###### All Platforms
* [`tailscale switch`](/kb/1080/cli/#switch) command to switch between accounts using [fast user switching](/blog/fast-user-switching)
* [`tailscale login`](/kb/1080/cli/#login) command to [login with a specified account](/kb/1225/fast-user-switching)
* [`tailscale set`](/kb/1080/cli/#set) command to modify configuration settings without needing to repeat the others
* [`tailscale lock`](/kb/1243/tailscale-lock) command to manage [Tailnet Lock](/kb/1226/tailnet-lock) for your tailnet
* Additional [4via6 DNS name](/kb/1201/4via6-subnets/#magicdns-name-for-the-ipv4-subnet-devices)
format, `Q-R-S-T-via-X` (or `Q-R-S-T-via-X.yak-bebop.ts.net`), for systems that required dashes instead
of dots
* Display decoded punycode hostnames in status list
* Warn in [`tailscale status`](/kb/1080/cli/#status) health and [`tailscale up`](/kb/1241/tailscale-up) if there are nodes advertising routes but `--accept-routes=false`
###### Linux
* Add [fast user switching](/kb/1225/fast-user-switching) using [`tailscale login`](/kb/1080/cli/#login)
and [`tailscale switch`](/kb/1080/cli/#switch)
* Warn in [`tailscale status`](/kb/1080/cli/#status) health if something else overwrites
`/etc/resolv.conf`
###### macOS
* Add [fast user switching](/kb/1225/fast-user-switching) by selecting the desired tailnet from the
Tailscale icon in the menubar, or via the [`tailscale login`](/kb/1080/cli/#login) and
[`tailscale switch`](/kb/1080/cli/#switch) commands
###### Windows
* Add [fast user switching](/kb/1225/fast-user-switching) by selecting the desired tailnet from the
Tailscale icon in the taskbar, or via the [`tailscale login`](/kb/1080/cli/#login) and
[`tailscale switch`](/kb/1080/cli/#switch) commands
* Use named pipes to communicate between UI and Service
* Changed: Move state storage responsibility from frontend to backend. The current state is migrated, this
should not be a noticeable change.
* Switch to `wingoes` for OLE support, use multithreaded apartment
* Received [Taildrop](/kb/1106/taildrop) files get placed in the `C:\\Users\\(username)\\Downloads` directory (previously they were placed in the `C:\\Users\\(username)\\Desktop` directory)
###### Android
* Allow Sonos app to discover speakers on the local LAN
###### Synology
* Better detect DSM version, locate local socket correctly
###### Containers
* Replace `run.sh` with `cmd/containerboot`
###### FreeBSD
* Support for [Tailscale SSH](/kb/1193/tailscale-ssh) (Thanks Pat Maddox!)
## [Dec 2, 2022](#2022-12-02)
* [Set contact preferences](/kb/1224/contact-preferences) in the
**Contact Preferences** page of
the admin console for notifications about account changes, configuration issues, security issues,
and billing
* Contact preference updates and verifications are included in [configuration audit logs](/kb/1203/audit-logging)
## [Nov 23, 2022](#2022-11-23)
* [Create invitations for feature previews](/kb/1222/invite-only-feature/#creating-a-feature-invitation) in the **General** settings page of the admin console
## [Nov 22, 2022](#2022-11-22)
* Tailscale unstable images on [Docker Hub](https://hub.docker.com/r/tailscale/tailscale) and in
[GitHub Packages](https://github.com/tailscale/tailscale/pkgs/container/tailscale) now contain
the prefix "unstable-", for example "unstable-v1.33" instead of "v1.33"
## [Nov 21, 2022](#2022-11-21)
###### All Platforms
* Security vulnerability in the Windows client that allows a malicious website to reconfigure the Tailscale daemon `tailscaled`,
which can then be used to remotely execute code ([CVE-2022-41924](https://www.cve.org/CVERecord?id=CVE-2022-41924), [TS-2022-004](/security-bulletins/#ts-2022-004))
* Fixed: Security vulnerability in the client that allows a malicious website to access the peer API, which can then be used to access
Tailscale environment variables ([CVE-2022-41925](https://www.cve.org/CVERecord?id=CVE-2022-41925), [TS-2022-005](/security-bulletins/#ts-2022-005))
###### Windows
* Set `Zone.Identifier` alternate data stream for Taildrop files
###### macOS
* Set `com.apple.quarantine` flag for Taildrop files
## [Nov 17, 2022](#2022-11-17)
* [Tailscale Funnel](/kb/1223/tailscale-funnel) to route traffic from the wider Internet to your Tailscale nodes (alpha)
## [Nov 10, 2022](#2022-11-10)
* [Use UI filters](/kb/1176/filter-devices) to easily filter devices in the **Machines** page of the admin console
## [Nov 8, 2022](#2022-11-08)
* The [actor](/kb/1203/audit-logging/#log-structure) is included in all [webhook](/kb/1213/webhooks) event payloads
* The [key expiration time](/kb/1028/key-expiry) is included in payloads for expiration-related events
* Slack messages generated for webhook events now have timestamps formatted in the local timezone of the user viewing the message
## [Nov 3, 2022](#2022-11-03)
* Set up billing in Azure with a [Tailscale in Azure Marketplace](/kb/1220/azure-marketplace) subscription
## [Oct 27, 2022](#2022-10-27)
* Create a [browser-based SSH session](/kb/1216/tailscale-ssh-console) from the admin console to a node on your tailnet ([beta](/kb/1167/release-stages/#beta))
## [Oct 26, 2022](#2022-10-26)
###### All Platforms
* Substantially improve userspace-networking handling of packet loss
###### macOS
* Fix a crash impacting some macOS systems ([#6065](https://github.com/tailscale/tailscale/issues/6065))
###### Android
* Fix a 4-in-6 DNS problem mainly impacting Android (fixed by Peter Cai) ([#5698](https://github.com/tailscale/tailscale/issues/5698))
* [Re-roll tailnet fun name](/kb/1217/tailnet-name/#re-roll-the-fun-name) if you want a different fun name *and* you haven't already used it for HTTPS certificates
* Use [webhooks](/kb/1213/webhooks) to subscribe to certain events on your tailnet and process the event notifications through an integration or app
## [Oct 21, 2022](#2022-10-21)
###### All Platforms
* Avoid crash in `tailscale netcheck` ([#5919](https://github.com/tailscale/tailscale/issues/5919))
###### macOS
* Avoid a condition which can result in high CPU consumption ([#5879](https://github.com/tailscale/tailscale/issues/5879))
* Fix Taildrop failures when sending many files ([#5873](https://github.com/tailscale/tailscale/issues/5873))
###### iOS
* Fix Taildrop failures when sending many files ([#5873](https://github.com/tailscale/tailscale/issues/5873))
###### Windows
* Correct IPv6 MTU setting ([#5914](https://github.com/tailscale/tailscale/issues/5914))
* Choose an expiry between 1 and 90 days for new [auth keys](/kb/1085/auth-keys) and [API keys](/kb/1101/api)
* Changed: In output of Tailscale API calls, a machine's name uses the fully qualified
domain name based on the [tailnet name](/kb/1217/tailnet-name), instead of the previous
format based on the [organization name](/kb/1217/tailnet-name/#organization-name). For
example, a machine name in API output is now `my-server.yak-bebop.ts.net` instead of
`my-server.example.com`. This is a display-only change and doesn't modify the name of any
machines.
## [Oct 20, 2022](#2022-10-20)
* [MagicDNS](/kb/1081/magicdns) ([generally available](/kb/1167/release-stages/#general-availability-ga))
* Access devices using short hostnames, like `my-server` or `dashboard`
## [Oct 18, 2022](#2022-10-18)
* Tailnets use `.ts.net` instead of `.beta.tailscale.net` for the [tailnet name](/kb/1217/tailnet-name)
* To avoid publicizing your organization name, Tailscale provides you with a tailnet name, which is used by features like MagicDNS, HTTPS, and sharing. The tailnet name is visible in the **DNS** page of the admin console.
* Previously, you might have used a name ending in `.beta.tailscale.net`. If so, migrate to the new tailnet name. The existing `beta.tailscale.net` name remains supported until at least November 1, 2023.
* What we previously called the tailnet name is now called the organization name. The
organization name is used by the Tailscale API, and is visible in the
**Settings** page of the admin console.
## [Oct 13, 2022](#2022-10-13)
* Use [configuration audit logging](/kb/1203/audit-logging) to identify who did what, and when,
in your tailnet ([beta](/kb/1167/release-stages/#beta))
## [Oct 12, 2022](#2022-10-12)
* Use [NextDNS as a global nameserver](/kb/1218/nextdns)
* Configure different NextDNS profiles for different devices using [`nodeAttrs`](/kb/1337/acl-syntax/#nodeattrs)
###### All Platforms
* Support NextDNS
* Add `tailscaled --no-logs-no-support` (or `TS\_NO\_LOGS\_NO\_SUPPORT=true` environment variable)
* `tailscale bugreport --record` flag to pause and write another bug report
* More in-depth health checks in a bugreport
* `tailscale netcheck` looks for a captive portal
* Build with Go 1.19.2
* IP fragmentation handling as an exit node
* SSH inadvertently closing tmux/etc panes at disconnect
* Always respond to 4via6 ICMP echo requests
* Normalize more process names in Services report
###### Linux
* Coexist with mwan3 package iptables rule fwmark masks, for OpenWRT
* Add an eBPF helper to pass the first packet on a new flow up to `tailscaled`
* Better detect when running in a container
###### macOS
* Incorrect list of Taildrop target devices
###### Windows
* Log Windows service diagnostics when the wintun device fails to install
###### iOS
* Incorrect list of Taildrop target devices
###### Android
* Show an error when unable to accommodate multiple users
###### Synology
* envknob support
* Configure-host version parsing
## [Oct 5, 2022](#2022-10-05)
* Per-DERP-region DNS entries, such as `derp1-all.tailscale.com`, available for [firewall allowlists](/kb/1082/firewall-ports#what-if-i-really-really-want-to-specify-the-hostnames-that-tailscale-uses-to-operate-its-service) or other compliance requirements
## [Sep 30, 2022](#2022-09-30)
* Key type is embedded in new keys, for example, `tskey-auth-012345abcdef` instead of `tskey-012345abcdef`
## [Sep 26, 2022](#2022-09-26)
* Honolulu added as a [DERP region](/blog/how-tailscale-works/#encrypted-tcp-relays-derp)
## [Sep 22, 2022](#2022-09-22)
* Dubai and Warsaw added as [DERP regions](/blog/how-tailscale-works/#encrypted-tcp-relays-derp)
## [Sep 16, 2022](#2022-09-16)
* Nodes provisioned with an auth key can use [Tailscale SSH](/kb/1193/tailscale-ssh) with [check mode](/kb/1193/tailscale-ssh/#configure-tailscale-ssh-with-check-mode)
###### All Platforms
* IPv6-mapped-IPv4 addresses in STUN responses
* Better detect when running in a container
## [Sep 15, 2022](#2022-09-15)
* Hong Kong, Madrid, and Toronto added as [DERP regions](/blog/how-tailscale-works/#encrypted-tcp-relays-derp)
## [Sep 14, 2022](#2022-09-14)
* Los Angeles and Paris added as [DERP regions](/blog/how-tailscale-works/#encrypted-tcp-relays-derp)
## [Sep 13, 2022](#2022-09-13)
* Johannesburg and Miami added as [DERP regions](/blog/how-tailscale-works/#encrypted-tcp-relays-derp)
## [Sep 12, 2022](#2022-09-12)
* Amsterdam and Denver added as [DERP regions](/blog/how-tailscale-works/#encrypted-tcp-relays-derp)
## [Sep 8, 2022](#2022-09-08)
###### All Platforms
* Exit nodes in userspace-networking mode break Chrome v.104 or later IPv6 connectivity
* SIGINT when running in a container without job control
## [Sep 2, 2022](#2022-09-02)
* [Sync Tailscale ACLs](https://github.com/marketplace/actions/sync-tailscale-acls) GitHub Action in GitHub Marketplace to [keep your tailnet policy file in Git](/kb/1204/gitops-acls), and automatically run tests and push changes to Tailscale
## [Sep 1, 2022](#2022-09-01)
* Recently expired and revoked [auth keys](/kb/1085/auth-keys/) and [API keys](/kb/1101/api) are now shown on the **Keys** page of the admin console
## [Aug 31, 2022](#2022-08-31)
###### All Platforms
* Use DNS-over-HTTPS for Mullvad DNS servers
* Report whether a subnet router is running in userspace-networking or kernel mode
* send Tailscale client version number in ACME requests (to Let's Encrypt, for example)
* Report whether host kernel supports IPv6
* Add `tailscale licenses` with link to open source licenses
* Delete node immediately if `tailscaled` exists and was using `mem:` state storage
* tsnet ephemeral nodes will delete themselves on `Close()`
* Add a timeout when writing to BIRD socket
* Clients can use Noise with any HTTPS port with capver 39 (mainly for Headscale)
* 100.100.100.100 will respond with SERVFAIL if there are no upstream resolvers
###### Linux
* Gracefully handle restarts in resolved support
###### macOS
* Report [variant](/kb/1065/macos-variants) (App Store, system extension) in the about box
* Fix missing IP address display in the status menu
###### Windows
* Add native ARM build for backend Tailscale service (only in NSIS installer in this release)
* Update Proxy support
* Notice when group policy entries change and move our NRPT rules between the local and group policy subkeys as needed
* Avoid 2.3 second DNS lookup delay when Smart Name Resolution is enabled by adding MagicDNS names to hosts file
* Disable NetBIOS nameservice on Tailscale interfaces
###### iOS
* Fix potential crash in notification handling
* Fix dismissing of error indication if a bugreport fails
###### Android
* Allow coordination server URL to be set. Click the Authentication menu three times quickly to enable
* Fix Google Stadia, Android Auto, GoPro, and Messages RCS with the VPN active
###### Synology
* Fix `/dev/net` permissions in `tailscale configure-host`
###### OpenBSD
* Support functioning as a subnet router or exit node using hybrid netstack mode
###### Other
* Accommodate shared nodes in nginx-auth
* Fix race in derper (Custom DERP servers) with manual certificates
## [Aug 30, 2022](#2022-08-30)
* [Tailscale Terraform provider](/kb/1210/terraform-provider) for managing your Tailscale resources, managed by Tailscale
## [Aug 26, 2022](#2022-08-26)
* Invite links for [sharing a device](/kb/1084/sharing) are automatically generated and copied, and no longer requires a label to be generated
## [Aug 25, 2022](#2022-08-25)
* Run [`tailscale logout`](/kb/1080/cli/#logout) to remove an [ephemeral node](/kb/1111/ephemeral-nodes) from your tailnet immediately
## [Aug 24, 2022](#2022-08-24)
* TrueCharts has added community support for a [TrueNAS SCALE app and Helm chart for Tailscale](https://truecharts.org/docs/charts/stable/tailscale/) (Thanks!)
## [Aug 15, 2022](#2022-08-15)
* On-demand access integration with [ConductorOne](/kb/1208/ondemand-conductorone),
[Indent](/kb/1205/ondemand-indent), [Opal](/kb/1209/ondemand-opal), and [Sym](/kb/1206/ondemand-sym)
## [Aug 11, 2022](#2022-08-11)
* The [network policy options section](/kb/1337/acl-syntax/#network-policy-options) in ACLs now
contains the `OneCGNATRoute` setting which controls the routes that Tailscale clients will generate
* Bug that can cause slow connects and a crash in a [custom DERP server](/kb/1118/custom-derp-servers)
in manual cert mode (not using Let's Encrypt). We encourage you to upgrade your `derper` binary.
If you use the default Let's Encrypt mode, no action is required
## [Aug 9, 2022](#2022-08-09)
* Connect with [Tailscale SSH](/kb/1193/tailscale-ssh) to [tagged](/kb/1068/acl-tags) nodes that are [shared](/kb/1084/sharing) with you
## [Jul 19, 2022](#2022-07-19)
* View the status of Tailscale services at [https://status.tailscale.com/](https://status.tailscale.com/)
## [Jul 18, 2022](#2022-07-18)
* Netgate has added Tailscale support to the [pfSense package repository](https://www.netgate.com/blog/tailscale-on-pfsense-software) (Thanks!)
###### All Platforms
* Add `ExitNodeStatus` to `tailscale status --json`
* Fix `tailscale ping -c N` to properly exit after N ping requests even if there are timeouts
* MagicDNS recursive resolution now returns `SERVFAIL` if all upstream resolvers fail
* portmapper: Send discovery packet for IGD specifically, some routers don't respond to `ssdp:all`
###### Linux
* Implement specific DNS support for AWS, Google Cloud, and Azure to add internal split DNS domain and fallback DNS
###### macOS
* Use one large 100.64.0.0/10 route entry if there are no other interfaces using CGNAT, to avoid Network Changed errors in browsers where possible
###### Windows
* Suppress nonfunctional link-local IPv6 addresses on Tailscale interface, PowerShell `ping (hostname)`
now works correctly
* Set registry values to not send DNS changes concerning our interface to AD domain controllers
* Update Windows split DNS settings to work alongside other NRPT entries set by group policy
* Set `AllowSameVersionUpgrades` attribute on `MajorUpgrade` tag in Windows MSI script
###### iOS
* Add portmapper support for NAT-PMP, PCP, UPnP
* Add MagicDNS support for TCP
* Changed: The minimum iOS version is now iOS 15, which makes substantially more memory available (the App Store
will offer Tailscale 1.26.2 for iOS 13 and 14 devices)
###### Android
* Android can now be an exit node (previously available but hidden)
## [Jul 5, 2022](#2022-07-05)
###### All Platforms
* `tailscaled` being able to restart while mosh-server is running from an SSH session
* Make `tailscale up --operator=""` clear a previously set operator
###### Linux
* [Tailscale SSH](/kb/1193/tailscale-ssh) support with Arch Linux
###### macOS
* Limit SSH login to 16 groups
###### Windows
* Make SSH command prefer Windows `ssh.exe` over `PATH`
###### iOS
* Try harder to notify for [SSH check mode](/kb/1193/tailscale-ssh/#configure-tailscale-ssh-with-check-mode)
## [Jun 23, 2022](#2022-06-23)
* Use [4via6 subnet routers](/kb/1201/4via6-subnets) to route traffic when you have existing
subnets with overlapping IPv4 addresses ([alpha](/kb/1167/release-stages/#alpha))
* [Sharing a device](/kb/1084/sharing) with a tailnet domain alias now lets the share recipient also use the shared device's `\*.ts.net` DNS name
## [Jun 22, 2022](#2022-06-22)
* Use [Tailscale SSH](/kb/1193/tailscale-ssh) to allow Tailscale to manage the authentication and authorization of SSH connections in your tailnet ([beta](/kb/1167/release-stages/#beta))
* [Default ACL](/kb/1192/acl-samples/#allow-all-default-acl) now allows users to access their own devices using [Tailscale SSH](/kb/1193/tailscale-ssh) with [check mode](/kb/1193/tailscale-ssh#configure-tailscale-ssh-with-check-mode). *This only affects tailnets with default ACLs, including new tailnets and tailnets which have never modified their ACLs*
## [Jun 18, 2022](#2022-06-18)
###### All Platforms
* Various bugs
## [Jun 6, 2022](#2022-06-06)
###### All Platforms
* Add `--peerapi \<peer\>` flag in [`tailscale ping`](/kb/1080/cli/#ping) to check connectivity to a peer using the PeerAPI
* Add `--timeout \<duration\>` flag in [`tailscale up`](/kb/1241/tailscale-up) to enforce a maximum amount of time to wait for the Tailscale service to initialize
* Allow `LoginInteractive` via `LocalAPI`
* MagicDNS supports DNS/TCP and handling IP fragmented UDP frames
* Add an overall 10 second timeout for recursive MagicDNS queries
* Add `Wake-on-LAN` function to PeerAPI. There is no UI for it currently.
* Provide [`/run.sh`](https://github.com/tailscale/tailscale/blob/main/docs/k8s/run.sh) as an entrypoint for Docker container builds
* Configured MTU is now consistent between a TUN device and a userspace device
* Refactor `tailscale.com/client/tailscale` package with `LocalClient` type
* Change MagicDNS "via route" DNS names from "via-SITEID.10.2.3.4" to "10.2.3.4.via-SITEID". The old format will continue to work for the next one or two releases.
* Build with Go 1.18.3
###### macOS
* [Tailscaled-on-macOS](/kb/1065/macos-variants) now supports MagicDNS, including Split DNS
* Initial release of a standalone macOS client, which is independent of the App Store, in the [stable track](https://pkgs.tailscale.com/stable/#macos)
###### Windows
* Add [`TS\_NOLAUNCH`](/kb/1189/install-windows-msi/#ts_nolaunch) property to allow admins to deploy silent MSI installs without automatically starting the GUI
* MagicDNS lookup of own hostname
* Handle more than 50 Split DNS domains
* Resolve one source of shutdown delay (there may still be more)
###### Synology
* Allow the NAS disks to hibernate by moving telemetry buffering to tmpfs
* Improve HTTP proxy handling
###### iOS
* **Bug report** menu option in the UI
## [Jun 3, 2022](#2022-06-03)
* Search for users and filter based on user role on the **Users** page of the admin console
* Pagination when user list is large in the Users page
## [May 20, 2022](#2022-05-20)
###### macOS
* [Initial release of a standalone macOS client](https://pkgs.tailscale.com/unstable/#macos), which is independent of the App Store, in the [unstable track](/kb/1083/install-unstable)
## [May 19, 2022](#2022-05-19)
* [Update billing email address](/kb/1182/billing-information) in the **Billing** page of the admin console
## [May 18, 2022](#2022-05-18)
* `autogroup:members` as a [tag owner](/kb/1337/acl-syntax/#tag-owners), to enable device tagging by any
user who is a direct member (not a shared user) of the tailnet
* ACLs are automatically formatted when saved from the **Access controls** page of the admin console or the API
## [May 17, 2022](#2022-05-17)
* The [allowed expiration range for keys](/kb/1028/key-expiry) is 1 to 180 days, instead of 3 to 180 days
## [May 16, 2022](#2022-05-16)
* [Update invoice name and address](/kb/1182/billing-information) in the **Billing** page of the admin console
## [May 10, 2022](#2022-05-10)
* Use the [Tailscale extension for Docker Desktop](/kb/1184/docker-desktop) to securely connect to the
resources you need for development ([beta](/kb/1167/release-stages/#beta))
## [May 9, 2022](#2022-05-09)
* When [adding common global DNS nameservers](/kb/1054/dns/#global-nameservers), Tailscale will automatically include all IPv4 and IPv6 addresses for that nameserver and treat them as one entity
## [May 5, 2022](#2022-05-05)
* The [tailnet ACL validate API call](https://github.com/tailscale/tailscale/blob/main/api.md#tailnet-acl-validate-post) also allows verifying ACL format and running [ACL tests](/kb/1337/acl-syntax/#tests), without posting a new ACL
* The [tailnet key detail API call](https://github.com/tailscale/tailscale/blob/main/api.md#tailnet-keys-key-get) includes whether an auth key is [pre-authorized](/kb/1099/device-authorization/#pre-approve-devices-with-an-auth-key)
## [Apr 28, 2022](#2022-04-28)
###### All Platforms
* Handling of HTTP proxies in certain circumstances
* An issue where the new control plane protocol could fail to make a connection to our servers ([#4557](https://github.com/tailscale/tailscale/issues/4557))
###### Synology
* Additional fix in handling of HTTP proxies
## [Apr 27, 2022](#2022-04-27)
###### All Platforms
* Two issues where the new control plane protocol could fail to make a connection to our servers ([#4544](https://github.com/tailscale/tailscale/issues/4544), [#4538](https://github.com/tailscale/tailscale/issues/4538))
* Set TCP keep-alives in userspace-networking subnet router to avoid connection leaks ([#4522](https://github.com/tailscale/tailscale/issues/4522))
* Avoid using the LTE radio after transition to Wi-Fi
## [Apr 25, 2022](#2022-04-25)
###### Android
* [Run Tailscale on Android TV](/kb/1079/install-android)
## [Apr 22, 2022](#2022-04-22)
###### All Platforms
* Initial support for site-relative IPv4 addressing using IPv6
* First for-keepsies deployment of ts2021 protocol
* tsnet now supports providing a custom ipn.StateStore
* Improve netstack performance via better GC tuning
* MagicDNS: PTR records for TS service IPs
* Build with Go 1.18
###### Linux
* taildrop: add `file get --loop`
* taildrop: add `file get --conflict=(skip|overwrite|rename)`
* Default to userspace-networking mode on [gokrazy](https://gokrazy.org/)
* Set tailscale0 link speed to UNKNOWN, not 1Gbps
* Attempt to load the xt\_mark kernel module when it is not present
###### Windows
* Improve HTTPS proxy handling
###### Synology
* Improve HTTPS proxy handling
###### Android
* Android TV support
* Fix and reintroduce Talkback support
###### FreeBSD
* Portmapping support
## [Apr 19, 2022](#2022-04-19)
* [User & group provisioning for Okta](/kb/1180/sso-okta-scim) ([beta](/kb/1167/release-stages/#beta))
* Filter based on user state (**Active**, **Inactive**, and **Suspended**) on the **Users** page of the admin console
* **Last seen** column on the **Users** page of the admin console
## [Apr 14, 2022](#2022-04-14)
* [Add or modify your tax identification number](/kb/1182/billing-information) from the **Billing** page of the admin console
## [Mar 25, 2022](#2022-03-25)
* [ACL tests](/kb/1337/acl-syntax/#tests) now support `group` as an option for the `src` field, and
as the `host` portion of the `accept` and `deny` fields.
## [Mar 21, 2022](#2022-03-21)
* Policy syntax for [ACL tests](/kb/1337/acl-syntax/#tests) now supports `accept`/`deny` in
addition to `allow`/`deny` when specifying destinations that the ACL rules should accept or deny.
## [Mar 17, 2022](#2022-03-17)
###### Linux
* Potential crash at startup when using BGP
###### Windows
* MSI not restarting GUI after MSI-to-MSI upgrade
## [Mar 15, 2022](#2022-03-15)
* Use [Caddy to manage Tailscale HTTPS certificates](/kb/1190/caddy-certificates)
## [Mar 10, 2022](#2022-03-10)
* [Tagged devices](/kb/1068/acl-tags) have [key expiry](/kb/1028/key-expiry) disabled by default
* ACL rules can use [`autogroup:members`](/kb/1337/acl-syntax/#autogroups) to write rules to allow access for users who are direct members (not shared users) of the tailnet
## [Mar 9, 2022](#2022-03-09)
###### All Platforms
* In `userspace-networking` mode, always close SOCKS proxied connections
###### Linux
* Better operation with [gokrazy](https://gokrazy.org/)
###### macOS
* Fix macOS GUI "Must restart" dialog in some cases
###### Windows
* Fix a Windows NSIS installer bug when upgrading
###### FreeBSD
* Fix portmapping
## [Mar 4, 2022](#2022-03-04)
* [Share an exit node](/kb/1084/sharing/#sharing--exit-nodes) ([beta](/kb/1167/release-stages/#beta))
## [Feb 23, 2022](#2022-02-23)
* [Auto Approvers for routes and exit nodes](/kb/1337/acl-syntax/#autoapprovers) to auto-approve advertised routes and exit nodes ([beta](/kb/1167/release-stages/#beta))
###### All Platforms
* New: DERP Return Path Optimization (DRPO), allows a pair of nodes in different DERP regions to connect more quickly
by only requiring one side to connect to the other, cutting down some DERP setup latency
* `tailscaled --state=mem:` registers as an ephemeral node and does not store state to disk
* `tailscale status --json` now shows `Tags` and `PrimaryRoutes` for Peers. `PrimaryRoutes` shows whether a HA
subnet router is currently the active one.
* `tailscale status --json | jq .TailnetName` will show the name of the tailnet
* The optional `tailscaled` debug server's Prometheus metrics exporter now also includes Go runtime metrics
* `tailscaled` supports a new `TS\_PERMIT\_CERT\_UID` environment variable containing either a userid or username to
allow to fetch Tailscale TLS certificates for the node. This environment variable can be set in
`/etc/default/tailscaled` to permit non-root web servers on the local machine to fetch certs from `tailscaled`.
* Send heartbeats less often, saving some battery, matching v1.20 change on mobile platforms.
* `--auth-key` and `--authkey` both work as `tailscale up` arguments
###### Linux
* More robust detection of systemd-resolved
* Efficiently parse extremely large `/proc/net/route` files
* Be more helpful in suggesting `tailscale --operator=USER` to use with Taildrop
* Some broken host DNS configurations are now detected and reported in `tailscale status`
###### Windows
* MSI installer
* Reject SIDs from deleted/invalid security principals to avoid `failed to look up user from userid` error
###### Synology
* Add `/var/packages/Tailscale/target/bin/tailscale configure-host` to restore needed
permissions. We recommend adding this as a scheduled task at boot.
## [Feb 22, 2022](#2022-02-22)
* Policy syntax for [ACL rules](/kb/1337/acl-syntax/#acls) now supports `src`/`dst` in
addition to `users`/`ports` when referring to sources and destinations
## [Feb 17, 2022](#2022-02-17)
* [Preview rules](/kb/1338/acl-edit/#preview-changes) in the admin console does not confuse access for tagged nodes with other tagged nodes ([#3957](https://github.com/tailscale/tailscale/issues/3957))
* Preview rules no longer shows `autogroup:self` for all tagged nodes
* Preview rules no longer shows an error if there is an `autogroup:self` rule
* Generate [auth keys](/kb/1085/auth-keys/) that are [pre-authorized for device authorization](/kb/1099/device-authorization/#pre-approve-devices-with-an-auth-key) ([#2120](https://github.com/tailscale/tailscale/issues/2120))
* [One-off ephemeral auth keys](/kb/1085/auth-keys/#types-of-auth-keys) actually create ephemeral nodes
* [`autogroup:self`](/kb/1337/acl-syntax/#autogroups) for users with mixed case accounts ([#3954](https://github.com/tailscale/tailscale/issues/3954))
## [Feb 9, 2022](#2022-02-09)
###### All Platforms
* DNS lookups via an exit node in many cases
###### Linux
* Better handling of extremely large `/proc/net/route` files for
very large routers
* BGP advertisement with subnet router failover
###### OpenBSD
* openresolv `/etc/resolv.conf` handling
## [Feb 4, 2022](#2022-02-04)
* [Disable node key expiry via API](https://github.com/tailscale/tailscale/blob/main/api.md#device-key-post)
* [Preview rules](/kb/1338/acl-edit/#preview-changes) in the admin console for tagged nodes
## [Feb 1, 2022](#2022-02-01)
* [ACL tags](/kb/1068/acl-tags/) ([generally available](/kb/1167/release-stages/#general-availability-ga))
* You can include tags as part of an authentication key, you can tag devices from the **Machines** page of the admin console, and tags can be owners of other tags. You must authenticate when re-tagging a device.
* [Preview rules](/kb/1338/acl-edit/#preview-changes) in the admin console for a user without any nodes
## [Jan 28, 2022](#2022-01-28)
* A device tagged with an [ACL tag](/kb/1068/acl-tags) is associated with the tag applied to it, not with the user who authenticated the device
* Tagged devices are listed under "Tagged Devices" in the list of Network devices in Tailscale clients
* Users cannot use Taildrop to send files to and from nodes they have tagged
* A user without any nodes can be specified as part of [an ACL test](/kb/1337/acl-syntax/#tests)
## [Jan 26, 2022](#2022-01-26)
###### Synology
* UI issues in Synology ([Synology 1.20.2 doesn’t have working options page](https://github.com/tailscale/tailscale/issues/3811))
Only the Synology client released v1.20.3. All other platforms remain with v1.20.2.
## [Jan 21, 2022](#2022-01-21)
* Self-serve [Synology packages](/kb/1131/synology) are now available on [pkgs.tailscale.com](https://pkgs.tailscale.com).
###### All Platforms
* Memory footprint growth in userspace-networking mode ([netstack: leaking packet buffers tailscale #3762](https://github.com/tailscale/tailscale/issues/3762))
* Userspace-networking will accept a TCP SYN with ECN bits set ([xt-userspace-networking incoming TCP doesn't always work right away tailscale #2642](https://github.com/tailscale/tailscale/issues/2642))
* Saving resolver list for OpenBSD
## [Jan 20, 2022](#2022-01-20)
* [Delete your tailnet](/kb/1237/delete-tailnet) from the **Settings** page of admin console if it only has one user. [Contact support](/contact/support) for other requests
## [Jan 13, 2022](#2022-01-13)
###### All Platforms
* Deadlock in handling the DERP map
## [Jan 12, 2022](#2022-01-12)
###### All Platforms
* When using an exit node, DNS queries will be forwarded to the exit node for resolution
* `tailscaled` now allows running the outgoing SOCKS5 and HTTP proxies on the same port.
* SOCKS5/HTTP proxies now allow connecting via subnet routers & exit nodes when run in `userspace-networking` mode
* More debug metrics available
* `tailscale ip -1` flag
* CLI now lets you select exit node by name
* CLI now shows you which nodes are offering exit nodes
* CLI now refuses to let you pick an invalid exit node (when connected)
* Packet filter now supports matching any IP protocol number when enabled in ACLs (previously only TCP, UDP, ICMP and SCTP)
* Added `Online` boolean to `tailscale status --json`, made `tailscale status` show offline nodes
* Added `tailscale up --json`
* MagicDNS now works over IPv6 when CGNAT IPv4 is disabled using `disableIPv4: true` in ACL
* Choose a new DERP relay server if the current DERP is removed from the DERPmap
* Bug fixes, cleanups, log spam reduction
###### Linux
* `tailscale file cp` sends via the local tailscaled now, so it now supports `tailscaled` running in tun-free, `userspace-networking` mode (such as on Synology DSM7 unless you [enable TUN mode](/kb/1131/synology#enable-outbound-connections))
###### Windows
* GUI support for running an exit node
###### macOS
* GUI support for running an exit node
###### iOS
* Send heartbeats less often to conserve battery
###### Android
* Talkback support
* Menu selection to generate a bug report
* "Allow LAN Access" checkbox in Exit Node menu
* Send heartbeats less often to conserve battery
* Implement DNS config reporting
* No longer require fallback DNS to be configured in admin console
* Report in the UI when connectivity is lost; this functionality was present but broken in prior releases
###### FreeBSD
* Now supports running in a jail (if devd isn't available, it falls back to network status polling mode)
## [Dec 17, 2021](#2021-12-17)
* [Auth keys can include an ACL tag binding](/kb/1068/tags#best-practices), so that when a device is authenticated, the tags are applied
* [ACL tags can be applied by an Owner, Admin, or Network admin from the admin console](/kb/1068/tags)
* [A tag can be the owner of another tag](/kb/1068/tags#apply-a-tag-from-another-tag)
* Auth keys can be generated via [API](https://github.com/tailscale/tailscale/blob/main/api.md#tailnet-keys-post)
## [Dec 15, 2021](#2021-12-15)
###### All Platforms
* Permit protocols other than TCP, UDP, or SCTP if an [ACL rule](/kb/1337/acl-syntax/#acls) has a `proto` specified and allows `\*` port range
* Exit node selection takes effect (almost) immediately
###### Linux
* In DNS DirectManager, allow comments at the end of a line
* Don't get stuck waiting for systemd-resolved to restart in one particular DNS configuration
###### Synology
* [Receive Taildrop files](/kb/1418/taildrop-nas#set-up-taildrop-on-synology)
## [Dec 9, 2021](#2021-12-09)
* ACLs can now use [`autogroup:self`](/kb/1337/acl-syntax/#autogroups) to write access rules to allow access to devices authenticated as the same user as the source IP address
## [Nov 25, 2021](#2021-11-25)
###### Linux
* Regressions on some kernel configs related to our direct use of netlink rather than using the `ip` command to program routes and policy routing
## [Nov 22, 2021](#2021-11-22)
* [User roles](/kb/1138/user-roles) for Network admin, IT admin, and Auditor
## [Nov 19, 2021](#2021-11-19)
* arm and arm64 container images on [Docker Hub](https://hub.docker.com/r/tailscale/tailscale) and in [GitHub Packages](https://github.com/orgs/tailscale/packages/container/package/tailscale)
## [Nov 18, 2021](#2021-11-18)
###### All Platforms
* `tailscaled` debug server now exports Prometheus metrics at `/debug/metrics`
* Improved UPnP discovery so that eero devices now work, allowing a port to be opened for direct connections (also in 1.16.2)
* State machine transition regarding expired key extension
* If unable to upload telemetry, limit amount buffered to 50MB
* Retry more transient DNS errors, instead of passing the failure back to the client
###### Linux
* Support storing Tailscale state using AWS SSM (for example, `tailscaled -state arn:aws:ssm:eu-west-1:123456789:parameter/foo`) (thank you Maxime Visonneau)
* If resolvconf wrote `/etc/resolv.conf` but pointed it to `systemd-resolved`, use `systemd-resolved` for DNS not resolvconf
* If NetworkManager wrote `/etc/resolv.conf` but pointed it to `systemd-resolved`, use `systemd-resolved` for DNS not NetworkManager
* Handle `/etc/resolv.conf` being a bind mount into a container, such that we cannot `rename()` it.
* Work around Ubuntu 18.04 setLinkDomain length limit by omitting reverse lookup information
* Use AF\_NETLINK messages to configure IP, not the `ip` command. Set `TS\_DEBUG\_USE\_IP\_COMMAND` environment variable to revert to use of `/sbin/ip` if this breaks your device
###### iOS
* On iOS 15+, where Network Extensions have more memory available, allow the same number of DNS-over-HTTPS requests in flight as other platforms
###### Synology
* Only use AmbientCaps on DSM7+
## [Nov 8, 2021](#2021-11-08)
* Available as a formula in [Homebrew](https://formulae.brew.sh/formula/tailscale) (Thanks!)
## [Nov 3, 2021](#2021-11-03)
* Available in the [Okta Integration Network](https://www.okta.com/integrations/tailscale/)
## [Oct 27, 2021](#2021-10-27)
* Users can be [suspended and restored](/kb/1145/remove-team-members/#suspending-users) from the **Users** page of the admin console
* Users who are [inactive](/kb/1145/remove-team-members/#managing-idle-users) are shown on the **Users** page of the admin console
## [Oct 26, 2021](#2021-10-26)
* Ephemeral nodes now have both IPv6 and IPv4 addresses
## [Oct 18, 2021](#2021-10-18)
* Officially supported in the [Synology package center](https://www.synology.com/en-global/dsm/packages/Tailscale)
## [Oct 13, 2021](#2021-10-13)
* Published Tailscale container image available on [Docker Hub](https://hub.docker.com/r/tailscale/tailscale) and in [GitHub Packages](https://github.com/orgs/tailscale/packages/container/package/tailscale)
## [Oct 7, 2021](#2021-10-07)
* Enable [device authorization](/kb/1099/device-authorization) from the **Settings** page of admin console
* Set [key expiry](/kb/1028/key-expiry) from the **Settings** page of admin console
###### All Platforms
* Support storage of node state as a Kubernetes secret.
* `tailscale up --authkey=file:/path/to/secret` support
* `tailscale up --qr` for QR codes
* tailscaled in userspace-networking mode can now run an HTTP proxy server (in addition to the prior SOCKS5 proxy server support)
* No longer need the `while tailscale up; do sleep 0.1; done` loops in Docker startup scripts.
* CPU/memory profiling support in `tailscale debug`
* Bake in Let's Encrypt's ISRG Root X1 root (also in 1.14.6)
###### Linux
* Support containers with !CAP\_NET\_RAW and !CAP\_NET\_ADMIN (like CircleCI runners)
* Service (portlist) scanning optimized; uses much less CPU on busy servers
###### Windows
* Move state to C:\\ProgramData (also in 1.14.4)
###### macOS
* Super rare Wireguard packet loop network flood when using a DNS server behind a subnet router, when a macOS device resumes from sleep and the network changes (also iOS, but triggers less there). Fixes [#1526](https://github.com/tailscale/tailscale/issues/1526) (also in 1.14.6).
###### iOS
* Turn the radio on less often to improve battery performance
###### Android
* Support Taildrop on older Android releases
* Turn the radio on less often to improve battery performance
## [Oct 6, 2021](#2021-10-06)
* Specify `--qr` as part of [`tailscale up`](/kb/1241/tailscale-up) to generate a QR code for the login URL
## [Oct 1, 2021](#2021-10-01)
###### All Platforms
* Include Let's Encrypt's ISRG Root X1 root as an alternate to try if the platform roots fail
* If tailscale cert fails because it needs to be run as root, say so.
* Avoid looping packets in tstun, believed to fix [#1526](https://github.com/tailscale/tailscale/issues/1526)
* Allow SOCKS5 proxy for `--tun=userspace-networking` to dial the HTTPS domain name of the Tailnet
* Ensure state directory is set to perm 0700.
###### iOS
* Ignore ipsec link monitor events for iOS to avoid waking the system
## [Sep 24, 2021](#2021-09-24)
###### Windows
* Move state files from C:\\Windows to C:\\ProgramData, to better handle Windows
###### Synology
* Fix segfaults shortly after starting, resolves [#2733](https://github.com/tailscale/tailscale/issues/2733)
## [Sep 22, 2021](#2021-09-22)
* Provision [TLS certificates](/kb/1153/enabling-https) for devices in your tailnet ([beta](/kb/1167/release-stages/#beta))
## [Sep 17, 2021](#2021-09-17)
* Free [Community on GitHub pricing plan](/kb/1154/free-plans-discounts/#community-on-github) for GitHub organizations using Tailscale for open source projects, families, and friends
## [Sep 16, 2021](#2021-09-16)
###### All Platforms
* `tailscale up` will wait for the socket to tailscaled to be created, not exit with an error. It should no longer be necessary to run it in a loop.
* Crash in TCP forwarding with userspace-networking; resolves [#2658](https://github.com/tailscale/tailscale/issues/2658)
###### Windows
* Default route lookup on Windows; resolves [#2707](https://github.com/tailscale/tailscale/issues/2707)
*Note: v1.14.1 and v1.14.2 were never released.*
## [Sep 7, 2021](#2021-09-07)
* [Device authorization](/kb/1099/device-authorization) is available in the API
* [Connect Tailscale action](https://github.com/marketplace/actions/connect-tailscale) available in GitHub Marketplace