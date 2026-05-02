Kubernetes 'kubectl' session and API request recording · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Kubernetes 'kubectl' session and API request recording
Last validated: Jan 5, 2026
Tailscale Kubernetes Operator session recording is currently [in beta](/docs/reference/tailscale-release-stages#beta).
The Tailscale Kubernetes Operator now supports recording all [Kubernetes API request events](#kubernetes-api-request-events).
In Tailscale 1.70 and later, you can record [kubectl exec](https://kubernetes.io/docs/reference/kubectl/generated/kubectl_exec/), [kubectl debug](https://kubernetes.io/docs/reference/kubectl/generated/kubectl_debug/), [kubectl attach](https://kubernetes.io/docs/reference/kubectl/generated/kubectl_attach/), and [kubectl run](https://kubernetes.io/docs/reference/kubectl/generated/kubectl_run/) session contents, as well as all Kubernetes API requests that pass through the [Kubernetes API server proxy](/docs/features/kubernetes-operator/how-to/api-server-proxy).
Tailscale Kubernetes Operator session recording is available for [the Personal and Enterprise plans](/pricing).
Recorded sessions are sent to a configured [`tsrecorder`](/docs/features/tailscale-ssh/tailscale-ssh-session-recording#deploy-a-recorder-node) instance in your tailnet.
The `tsrecorder` supports storing recorded sessions in an S3-compatible storage or on disk.
A recording contains:
* The command sent in the `kubectl` call. For example, `kubectl exec -- cat /myfile.txt` will show up as `cat /myfile.txt`.
* The session type being recorded (either `exec` or `attach`)
* The contents of `stdout` and `stderr` from the attached terminal, but not `stdin`. This prevents the recording of sensitive input, such as passwords.
* Session start timestamp.
* Name and namespace of the `Pod` and name of the container being recorded.
* Tailscale hostname of the API server proxy.
* [Tailscale identity](/docs/concepts/tailscale-identity) that initiated the session:
* Tailscale hostname of the source device from which the `kubectl` session was initiated.
* If the source device is [tagged](/docs/features/tags), tags of the device.
* If the source device is not tagged, Tailscale user ID and login name.
The API server proxy sends session contents to `tsrecorder` over the tailnet, so the traffic is end-to-end encrypted using WireGuard, like any other tailnet traffic.
You can choose whether a `kubectl` session should be allowed ('fail open') or be forbidden ('fail closed') if the recording fails. For example, if a connection to tsrecorder cannot be established or fails.
## [Kubernetes API request events](#kubernetes-api-request-events)
Tailscale Kubernetes Operator API request recording is currently [in beta](/docs/reference/tailscale-release-stages#beta).
With the Tailscale Kubernetes operator, you can record all Kubernetes API requests that pass through the [Kubernetes API server proxy](/docs/features/kubernetes-operator/how-to/api-server-proxy). This lets you create a detailed audit trail of cluster interactions for security and compliance purposes.
A request event contains:
* Timestamp of when the event occurred.
* Detailed information about the Kubernetes API request, including:
* The verb such as `get`, `list`, `create`.
* The targeted resource such as `pods` and `services`.
* The namespace, name, API group, and version.
* Full HTTP request details, including the method, path, request body and query parameters.
* User agent of the client that made the request (for example, `kubectl/v1.33.3`).
* Source Tailscale machine that the request came from.
* Tailscale identity that initiated the API call, including:
* Tailscale hostname of the source device.
* If the source device is tagged and the tags of the device.
* If the source device is not tagged, the Tailscale user ID and login name.
This is all encapsulated in a general tsrecorder event of type `kubernetes-api-request`.
The API server proxy sends API request events to [`tsrecorder`](/docs/features/tailscale-ssh/tailscale-ssh-session-recording#deploy-a-recorder-node) over your tailnet, so the traffic is end-to-end encrypted using WireGuard, just like any other tailnet traffic.
### [Enabling Kubernetes API request events](#enabling-kubernetes-api-request-events)
To enable this feature, refer to the [following section](#enabling-api-request-event-recording).
## [Prerequisites](#prerequisites)
* Set up the Tailscale Kubernetes Operator with the [API server proxy](/docs/features/kubernetes-operator/how-to/api-server-proxy) enabled.
* Deploy a [tagged](/docs/features/tags) [`tsrecorder` instance](/docs/features/tailscale-ssh/tailscale-ssh-session-recording#deploy-a-recorder-node).
Note that you can also [deploy `tsrecorder` on Kubernetes using the operator](/docs/features/kubernetes-operator/how-to/tsrecorder).
* Ensure that your [ACLs](/docs/features/access-control/acls) allow the operator to access port `80` of the `tsrecorder`.
## [Configure the session recording](#configure-the-session-recording)
You can configure session recording options using [grants](/docs/features/access-control/grants).
Grants only configure how the API server proxy treats incoming connections; they do not configure tailnet device connectivity. To allow clients to connect, refer to the [API server proxy prerequisites](/docs/features/kubernetes-operator/how-to/api-server-proxy#prerequisites).
You must specify the source (the tailnet identity that starts the `kubectl` session), the destination (the API server proxy), and the `tsrecorder` instance. You can also specify the failure policy. The default failure policy is to fail open.
The following example:
* Lets requests from `group:engineering` connect to the API server proxy on all operator instances tagged with `tag:k8s-operator` on port `443`.
* Enforces session recording for `kubectl` sessions from [tailnet group](/docs/reference/syntax/policy-file#groups) `group:engineering` to all API server proxy instances tagged with `tag:k8s-operator`.
* Configures the recorded sessions to be sent to a `tsrecorder` instance tagged with `tag:tsrecorder`.
* Sets failure policy to "fail closed" (if the recording fails, forbid the session).
```
`"acls": [
{
"action": "accept",
"src": ["group:engineering"],
"dst": ["tag:k8s-operator:443"]
}
],
"grants": [
{
"src": ["group:engineering"],
"dst": ["tag:k8s-operator"],
"app": {
"tailscale.com/cap/kubernetes": [{
"recorder": ["tag:tsrecorder"],
"enforceRecorder": true,
}],
},
},
]
`
```
If `tag:tsrecorder` resolves to multiple tailnet IP addresses, the API server proxy will send the recording to the first instance to which it succeeds at establishing a connection.
### [Enabling API request event recording](#enabling-api-request-event-recording)
To enable Kubernetes API request event recording, add `"enableEvents": true` to the `tailscale.com/cap/kubernetes` grant.
When `enableEvents` is set to `true`, all Kubernetes API requests that pass through the proxy will be recorded, in addition to `kubectl` sessions.
The following example:
* Lets requests from `group:engineering` connect to the API server proxy on all operator instances tagged with `tag:k8s-operator` on port `443`.
* Configures the recorded sessions to be sent to a `tsrecorder` instance tagged with `tag:tsrecorder`.
* Enables recording of Kubernetes API request events.
```
`"acls": [
{
"action": "accept",
"src": ["group:engineering"],
"dst": ["tag:k8s-operator:443"]
}
],
"grants": [
{
"src": ["group:engineering"],
"dst": ["tag:k8s-operator"],
"app": {
"tailscale.com/cap/kubernetes": [{
"recorder": ["tag:tsrecorder"],
"enableEvents": true,
}],
},
},
]
`
```
### [Combine session recording and group impersonation in grant rules](#combine-session-recording-and-group-impersonation-in-grant-rules)
A grant can also combine session recording rules and [API server proxy impersonation rules](/docs/features/kubernetes-operator/how-to/api-server-proxy#impersonating-kubernetes-groups-with-grants).
The following example:
* Lets requests from `group:engineering` connect to the API server proxy on all operator instances tagged with `tag:k8s-operator` on port `443`.
* Configures session recording for `kubectl` sessions from group `group:engineering` to all operator instances tagged with `tag:k8s-operator`.
* Configures the recorded sessions to be sent to a tsrecorder instance tagged with `tag:tsrecorder`.
* Configures that requests from `group:engineering` should be impersonated as from Kubernetes group `system:masters`.
```
`"acls": [
{
"action": "accept",
"src": ["group:engineering"],
"dst": ["tag:k8s-operator:443"]
}
],
"grants": [
{
"src": ["group:engineering"],
"dst": ["tag:k8s-operator"],
"app": {
"tailscale.com/cap/kubernetes": [{
"impersonate": {
"groups": ["system:masters"],
},
"recorder": ["tag:tsrecorder"],
}],
},
},
]
`
```
### [Enforce recording of all sessions](#enforce-recording-of-all-sessions)
To ensure the recording of all `kubectl` sessions, use the wildcard syntax (`\*`) as the grant's source and/or destination.
The following example:
* Enforces recording of all `kubectl` sessions from any source to any API server proxy instance.
* Configures the recording to be sent to tsrecorder instance tagged with `tag:tsrecorder`.
```
`"grants": [
{
"src": ["\*"],
"dst": ["\*"],
"app": {
"tailscale.com/cap/kubernetes": [{
"recorder": ["tag:tsrecorder"],
"enforceRecorder": true,
}],
},
},
]
`
```
## [Known issues and limitations](#known-issues-and-limitations)
* In some cases, if an established connection to `tsrecorder` fails midway (because the `tsrecorder` instance fails), the session will be allowed to continue even if the policy is to fail closed.
On this page
* [Kubernetes API request events](#kubernetes-api-request-events)
* [Enabling Kubernetes API request events](#enabling-kubernetes-api-request-events)
* [Prerequisites](#prerequisites)
* [Configure the session recording](#configure-the-session-recording)
* [Enabling API request event recording](#enabling-api-request-event-recording)
* [Combine session recording and group impersonation in grant rules](#combine-session-recording-and-group-impersonation-in-grant-rules)
* [Enforce recording of all sessions](#enforce-recording-of-all-sessions)
* [Known issues and limitations](#known-issues-and-limitations)
Scroll to top