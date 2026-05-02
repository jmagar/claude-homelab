How Aspen Insights Deployed a Load Balanced Proxy to Solve a unique On-Prem Kubernetes problem
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|January 08, 2024
# How Aspen Insights Deployed a Load Balanced Proxy to Solve a unique On-Prem Kubernetes problem
At Aspen Insights, we use Tailscale as our [corporate VPN](https://tailscale.com/use-cases/business-vpn) to connect to on-premise resources, 3rd party devices, and our cloud resources. It simplifies and secures a lot of traffic that would have taken considerable time with corporate certificates and CA management in a traditional way.
Aspen Insights uses Tailscale [subnet routers](https://tailscale.com/kb/1019/subnets) to connect to our Kubernetes cluster. From tailnet devices with appropriate permissions users can connect via an internal Kubernetes service endpoint such as prometheus.monitoring.svc.cluster.local. This saves time and does not require the use of a pod jump box or other connectivity service like ingresses.
However, there was a unique on-premise Kubernetes cluster we did not own, but worked on. We wanted to hit cloud APIs in a secure way without going over the public internet. Tailscale was an obvious answer.
## [Background](#background)
You can run Tailscale inside a Kubernetes Cluster using the Tailscale [Kubernetes operator](https://tailscale.com/kubernetes-operator), or as a sidecar, as a proxy, or as a subnet router.
Tailscale has clear [documentation on how to set up a sidecar](https://tailscale.com/kb/1185/kubernetes/), the method we used at Aspen. The configuration is straightforward. You generate an auth key and store that as a kubernetes secret and reference it as an environmental variable in the Tailscale sidecar as shown below.
```
`# Copyright (c) Tailscale Inc & AUTHORS
# SPDX-License-Identifier: BSD-3-Clause
apiVersion: v1
kind: Pod
metadata:
name: nginx
spec:
serviceAccountName: "{{SA\_NAME}}"
containers:
- name: nginx
image: nginx
- name: ts-sidecar
imagePullPolicy: Always
image: "ghcr.io/tailscale/tailscale:latest"
env:
# Store the state in a k8s secret
- name: TS\_KUBE\_SECRET
value: "{{TS\_KUBE\_SECRET}}"
- name: TS\_USERSPACE
value: "false"
- name: TS\_AUTHKEY
valueFrom:
secretKeyRef:
name: tailscale-auth
key: TS\_AUTHKEY
optional: true
securityContext:
capabilities:
add:
- NET\_ADMIN`
```
This works perfectly to connect to cloud resources when a subnet router is present. However, to reach specific cloud resources the DNS can be tricky:
DNS would not resolve cloud based DNS records no matter what we tried
The cloud APIs were exposed with private endpoints not public ones
All traffic was forced over the VPN and the service IP address was mapped to the virtual network subnet IP space
The solution was a [`host alias` feature on Kubernetes](https://kubernetes.io/docs/tasks/network/customize-hosts-file-for-pods/) deployment container templates:
```
`spec:
...
hostAliases:
- ip: "10.12.3.4"
hostnames:
- "api.internal.cloudprovider.io"
...`
```
While meeting the need for one pod and one use case, this quickly became untenable due to more pods needing access and which required more sidecars and more secrets, and secrets are namespaced locked so now we had to reflect secrets. Ugh.
## [Deploying Tailscale Load Balanced Proxy](#deploying-tailscale-load-balanced-proxy)
So we sat and thought hard. Sure we could continue the way we were headed and guarantee future employment forever by way of never-ending maintenance, or we could innovate ourselves out of the job. Like any good engineer, we chose the latter.
It occurred to us that Tailscale's built-in proxy is fast enough; why not just set up one pod running nothing but Tailscale. Then all local references to cloud resources could just set the proxy to that Tailscale pod's service address.
Could it be that simple? TLDR; Yes!
```
`apiVersion: apps/v1
kind: StatefulSet
metadata:
name: tailscale
namespace: tailscale
spec:
replicas: 3
selector:
matchLabels:
selector: aspen-hopelessly-set-piglet
template:
metadata:
labels:
selector: aspen-hopelessly-set-piglet
spec:
initContainers:
- name: sysctler
image: busybox
command:
- /bin/sh
- '-c'
- sysctl -w net.ipv4.ip\_forward=1 net.ipv6.conf.all.forwarding=1
securityContext:
privileged: true
runAsNonRoot: false
readOnlyRootFilesystem: false
allowPrivilegeEscalation: true
containers:
- name: tailscale-proxy
image: tailscale/tailscale:latest
ports:
- name: tailscale
containerPort: 1055
protocol: TCP
envFrom:
- secretRef:
name: tailscale-ts-authkey
optional: false
env:
- name: POD\_HOSTNAME
valueFrom:
fieldRef:
apiVersion: v1
fieldPath: metadata.name
- name: TS\_KUBE\_SECRET
value: $(POD\_HOSTNAME)-ts-state
- name: TS\_OUTBOUND\_HTTP\_PROXY\_LISTEN
value: 0.0.0.0:1055
- name: TS\_USERSPACE
value: 'false'
- name: TS\_AUTH\_ONCE
value: 'true'
- name: TS\_EXTRA\_ARGS
value: '--accept-routes'
- name: TS\_SOCKS5\_SERVER
value: 0.0.0.0:1055
resources:
requests:
cpu: 10m
memory: 75Mi
imagePullPolicy: IfNotPresent
securityContext:
capabilities:
add:
- NET\_ADMIN
privileged: false
runAsNonRoot: false
readOnlyRootFilesystem: false
allowPrivilegeEscalation: true
serviceAccountName: tailscale
serviceAccount: tailscale
hostAliases:
- ip: 10.12.3.4
hostnames:
- api.internal.cloudprovider.io
serviceName: tailscale-headless `
```
This stateful set shows the Tailscale proxy we setup; three stateful pods to run a load balanced proxy. The stateful set provides consistent pod host naming which makes the Tailscale dashboard easier to read, plus other benefits. The sysctler perpares the host to forward ipv4 and ipv6 traffic. We bind every proxy to 0.0.0.0 on port 1055. Another thing to note is this doesn't not run in userspace mode.
## [Advantages of the New Approach](#advantages-of-the-new-approach)
With this approach sidecars were no longer needed on every pod. For each pod that needs to reach cloud resources the client configuration for the proxy is still needed. Environment variables or package libraries will need settings like `HTTP\_PROXY, http\_proxy, HTTPS\_PROXY, https\_proxy, ..` and so on. Another benefit of this solution is the host aliases can are centralized, so management is easier.
Tailscale Proxy Solution Diagram## [Lessons Learned and Best Practices](#lessons-learned-and-best-practices)
This setup reduced our maintenance workload and simplified our setup greatly. This setup is a scalable solution with a few adjustments the deployment can be configured with an autoscaler to scale wide if needed. Ideally we'd like to get rid of the host alias configuration, but we have varying levels of success using DNS resolution over Tailscale.
## [Conclusion](#conclusion)
Proxying traffic to the cloud can be tricky. And sidecar bloat is always a concern, but Tailscale allowed Aspen Insights to connect to cloud resources in a simple and scalable way. Our pod resources on a on-premise cluster can now reach specific cloud service in a easy way while still secure.
Share
Authors
Matt Landowski
Johnny Giddings
Authors
Matt Landowski
Johnny Giddings
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