Logging overview · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Logging overview
Last validated: Jan 5, 2026
Each Tailscale agent in your distributed network streams its logs to a central log server (at `log.tailscale.com`). This includes real-time events for open and close events for every inter-machine connection (TCP or UDP) on your network.
Because every connection requires two endpoints, and both endpoints log every connection, it's possible to detect lost or tampered logs by comparing the double entries of each endpoint. You could also use IDS (intrusion detection system) rules to automatically detect suspicious activity on your network.
## [Client logs](#client-logs)
Each client logs information about its own operation and its attempts to contact other nodes. The data collected and how it is used are described in our [privacy policy](/privacy-policy).
You can access logs locally for nodes on some desktop platforms.
[Windows](/docs/features/logging?tab=windows)[macOS](/docs/features/logging?tab=macos)[iOS / tvOS](/docs/features/logging?tab=ios+/+tvos)[Android](/docs/features/logging?tab=android)[Linux](/docs/features/logging?tab=linux)
Logs are stored in `C:\\ProgramData\\Tailscale` (or, more generally `$env:ALLUSERSPROFILE\\Tailscale`).
### [Centralized log management](#centralized-log-management)
Some logs are centrally collected by Tailscale for debugging. This is done with a [custom-built, high-capacity, high-reliability, distributed logging system](https://apenwarr.ca/log/20190216).
Client operational logs are only accessible locally on each node, but you could stream your system- and container-level logs to the same centralized data store for further analysis. [Network flow logs](#network-flow-logs) are available from the admin console when enabled.
### [Opt out of client logging](#opt-out-of-client-logging)
If you block client logging, Tailscale may not be able to provide technical support.
[Windows](/docs/features/logging?tab=windows)[macOS](/docs/features/logging?tab=macos)[Linux](/docs/features/logging?tab=linux)
This is possible if you set the `TS\_NO\_LOGS\_NO\_SUPPORT` environment variable in `%ProgramData%\\Tailscale\\tailscaled-env.txt`:
```
`TS\_NO\_LOGS\_NO\_SUPPORT=true
`
```
To track when you can instead use the `--no-logs-no-support` flag, follow our [GitHub issue](https://github.com/tailscale/tailscale/issues/5114) for making it easier to use environment variables.
## [Kubernetes Operator logs](#kubernetes-operator-logs)
The Kubernetes Operator's reconciliation logs are centrally collected for debugging. These logs describe steps the Kubernetes Operator has taken to bring the deployed state in-line with the desired state regarding Kubernetes resources.
Refer to our [privacy policy](/privacy-policy) to understand the data collected and how we use it.
You can access logs locally using the `kubectl logs` command.
### [Opt out of Kubernetes logging](#opt-out-of-kubernetes-logging)
If you deployed the Kubernetes Operator with Helm, add the `TS\_NO\_LOGS\_NO\_SUPPORT` environment variable to the `operatorConfig.extraEnv` section:
```
`operatorConfig:
extraEnv:
- name: TS\_NO\_LOGS\_NO\_SUPPORT
value: "true"
`
```
If you deployed the Kubernetes Operator with static manifests, add the `TS\_NO\_LOGS\_NO\_SUPPORT` environment variable to the Kubernetes Operator's Deployment:
```
`env:
- name: TS\_NO\_LOGS\_NO\_SUPPORT
value: "true"
`
```
## [Network flow logs](#network-flow-logs)
Network flow logs are available for [the Premium and Enterprise plans](/pricing).
[Network flow logs](/docs/features/logging/network-flow-logs) are available to help you understand which devices are connecting to one another over time, that is, the *flow* of traffic across your tailnet.
These logs strictly do not contain any information about client operations or contents of network traffic.
Network flow logs must be [enabled](/docs/features/logging/network-flow-logs#enable-network-flow-logs).
Flow logs can be configured to [stream](/docs/features/logging/log-streaming) to a security information and event management (SIEM) system.
## [Server logs](#server-logs)
[Configuration audit logs](/docs/features/logging/audit-logging) record actions that modify a tailnet's configuration, including the type of action, the actor, the target resource, and the time.
All [users who have access to the admin console](/docs/reference/user-roles) can inspect configuration audit logs in the [Logs](https://login.tailscale.com/admin/logs) page of the admin console, and can filter these logs to find specific events.
Configuration audit logs are enabled by default for all tailnets, and are available for the most recent 90 days.
Audit logs can be configured to [stream](/docs/features/logging/log-streaming) to a security information and event management (SIEM) system.
## [Local SSH session logs](#local-ssh-session-logs)
Local SSH session logs are not supported as of version 1.48.0.
You can use [Tailscale SSH session recording](/docs/features/tailscale-ssh/tailscale-ssh-session-recording) to streaming recordings from the server device.
On this page
* [Client logs](#client-logs)
* [Centralized log management](#centralized-log-management)
* [Opt out of client logging](#opt-out-of-client-logging)
* [Kubernetes Operator logs](#kubernetes-operator-logs)
* [Opt out of Kubernetes logging](#opt-out-of-kubernetes-logging)
* [Network flow logs](#network-flow-logs)
* [Server logs](#server-logs)
* [Local SSH session logs](#local-ssh-session-logs)
Scroll to top