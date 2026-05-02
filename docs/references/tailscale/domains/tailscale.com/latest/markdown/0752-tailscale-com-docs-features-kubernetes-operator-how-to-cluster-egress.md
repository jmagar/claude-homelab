Expose a tailnet service to your Kubernetes cluster (cluster egress) · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Expose a tailnet service to your Kubernetes cluster (cluster egress)
Last validated: Jan 5, 2026
Exposing tailnet services to your Kubernetes cluster is currently [in beta](/docs/reference/tailscale-release-stages#beta).
You can make services that are external to your cluster, but available in your tailnet, available to your Kubernetes cluster workloads by making the associated tailnet node accessible from the cluster.
You can configure the operator to set up an in-cluster egress proxy for a tailnet device by creating a Kubernetes `Service` that specifies a tailnet device either by its [Tailscale IP address](/docs/concepts/ip-and-dns-addresses) or its [MagicDNS name](/docs/features/magicdns). In both cases your cluster workloads will refer to the tailnet service by the Kubernetes `Service` name.
## [Prerequisites](#prerequisites)
* [Set up the Kubernetes Operator](/docs/features/kubernetes-operator#setup).
## [Expose a tailnet node to your cluster using its Tailscale MagicDNS name](#expose-a-tailnet-node-to-your-cluster-using-its-tailscale-magicdns-name)
1. Ensure that [**MagicDNS** is enabled for your cluster](/docs/features/magicdns#enabling-magicdns).
2. Create a Kubernetes `Service` of type [`ExternalName`](https://kubernetes.io/docs/concepts/services-networking/service/#externalname) annotated with the MagicDNS name of the tailnet device that you wish to make available:
```
`apiVersion: v1
kind: Service
metadata:
annotations:
tailscale.com/tailnet-fqdn: \<Tailscale MagicDNS name\>
name: rds-staging # service name
spec:
externalName: placeholder # any value - will be overwritten by operator
type: ExternalName
`
```
Note that the value of the `tailscale.com/tailnet-fqdn` annotation must be the full MagicDNS name of the tailnet service (not just hostname). The final dot is optional.
## [Expose a tailnet node to your cluster using its Tailscale IP address](#expose-a-tailnet-node-to-your-cluster-using-its-tailscale-ip-address)
1. Create a Kubernetes `Service` of type [`ExternalName`](https://kubernetes.io/docs/concepts/services-networking/service/#externalname) annotated with the Tailscale IP address of the tailnet node you want to make available:
```
`apiVersion: v1
kind: Service
metadata:
annotations:
tailscale.com/tailnet-ip: \<Tailscale IP address\>
name: rds-staging # service name
spec:
externalName: placeholder # any value - will be overwritten by operator
type: ExternalName
`
```
The value of the `tailscale.com/tailnet-ip` annotation can be either a tailnet IPv4 or IPv6 address or an IPv4 or IPv6 address exposed by a Tailscale subnet router.
IP address ranges are not supported. 4via6 addresses are also not supported.
Refer to the [Access an IP address behind a subnet router](#ip-behind-subnet) section for more information on how to access an IP address behind a subnet router.
### [Expose a tailnet HTTPS service to your cluster workloads](#expose-a-tailnet-https-service-to-your-cluster-workloads)
Cluster workloads that need access to tailnet services that use [Tailscale HTTPS](/docs/how-to/set-up-https-certificates) likely need to refer to those services by their MagicDNS names for the TLS handshake to succeed.
Sometimes, cluster workloads must access a service running in the same cluster, which is exposed over [Tailscale Ingress](/docs/features/kubernetes-operator/how-to/cluster-ingress) through its MagicDNS name. Both of these use cases require the ability of the workloads to resolve the MagicDNS names of the services they need to access.
With Kubernetes operator v1.66 and later, you can configure the cluster to resolve MagicDNS names of the tailnet services exposed using [cluster egress proxies](#cluster-egress) and the MagicDNS names of cluster workloads exposed to tailnet using [Tailscale Ingress](/docs/features/kubernetes-operator/how-to/cluster-ingress).
You can configure the operator to deploy a nameserver for `ts.net` DNS names of the tailnet services exposed using [cluster egress proxies](#cluster-egress) and for [Tailscale Ingress](/docs/features/kubernetes-operator/how-to/cluster-ingress) in the cluster, then add the nameserver as a [stub nameserver](https://kubernetes.io/docs/tasks/administer-cluster/dns-custom-nameservers/#configuration-of-stub-domain-and-upstream-nameserver-using-coredns) to your cluster DNS plugin.
1. Create a `DNSConfig` custom resource:
```
`apiVersion: tailscale.com/v1alpha1
kind: DNSConfig
metadata:
name: ts-dns
spec:
nameserver:
image:
repo: tailscale/k8s-nameserver
tag: unstable
`
```
The `DNSConfig` custom resource tells the Tailscale Kubernetes Operator to deploy a nameserver in the operator's namespace and dynamically populate the nameserver with the following DNS records:
* `A` records mapping [cluster egress](#cluster-egress) proxy `Pod`s' IP addresses to the MagicDNS names of the exposed tailnet services
* `A` records mapping [Tailscale Ingress](/docs/features/kubernetes-operator/how-to/cluster-ingress) proxy `Pod`s' IP addresses to the MagicDNS names of the `Ingress`es
* Find the IP address of the nameserver:
```
`kubectl get dnsconfig ts-dns
`
```
For example, this command will return information similar to the following:
```
`NAME NAMESERVERIP
ts-dns 10.100.124.196
`
```
* (If your cluster uses CoreDNS) update the `Corefile`.
[Update `Corefile` in `coredns` `ConfigMap` in `kube-system` namespace](https://kubernetes.io/docs/tasks/administer-cluster/dns-custom-nameservers/#configuration-of-stub-domain-and-upstream-nameserver-using-coredns) with a stanza for `ts.net` stub nameserver:
```
`Corefile: |
.:53 {
...
}
ts.net {
errors
cache 30
forward . 10.100.124.196
}
`
```
* (If your cluster uses `kube-dns`) update the `kube-dns` config.
[Update `kube-dns` `ConfigMap` in `kube-system` namespace](https://docs.cloud.google.com/kubernetes-engine/docs/concepts/kube-dns#stub-domains) to add a stub nameserver for `ts.net` DNS names:
```
`data:
stubDomains: |
{
"ts.net": [
"10.100.124.196"
]
}
`
```
* Access HTTPS tailnet services from the Kubernetes cluster.
Create an [egress](#cluster-egress) `Service`:
```
`apiVersion: v1
kind: Service
metadata:
annotations:
tailscale.com/tailnet-fqdn: "\<full MagicDNS name of the tailnet node\>"
name: ts-egress
spec:
externalName: unused
type: ExternalName
`
```
The operator automatically populates the nameserver's configuration with an `A` record mapping the MagicDNS name of the exposed tailnet service to proxy `Pod`'s IP address.
This record lets your cluster workloads access the tailnet service using its MagicDNS name.
* Access a Tailscale `Ingress` using its MagicDNS name from the cluster:
Create a [Tailscale `Ingress`](/docs/features/kubernetes-operator/how-to/cluster-ingress) resource with a `tailscale.com/experimental-forward-cluster-traffic-via-ingress` annotation:
```
`apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
name: nginx
annotations:
tailscale.com/experimental-forward-cluster-traffic-via-ingress: "true"
spec:
defaultBackend:
service:
name: nginx
port:
name: https
ingressClassName: tailscale
`
```
The operator automatically populates the nameserver's configuration with an `A` record mapping the MagicDNS name of the Tailscale `Ingress` to the proxy `Pod`'s IP address.
For `Ingress` resources annotated with `tailscale.com/experimental-forward-cluster-traffic-via-ingress`, the operator also ensures that the proxy created for that `Ingress` listens on its `Pod` IP address, so it can be accessed by cluster workloads.
We are actively seeking feedback for MagicDNS name resolution in cluster, especially with regards to further automating the workflow — do [reach out](https://github.com/tailscale/tailscale/issues/new/choose) if you have feedback or suggestions.
In Tailscale version 1.90 or later, this feature supports clusters with IPv6 `Pod` CIDRs as well as IPv4 CIDRs. Earlier versions only support IPv4 CIDRs.
## [Configure an egress `Service` using `ProxyGroup`](#configure-an-egress-service-using-proxygroup)
The operator by default creates a `StatefulSet` with a single proxy `Pod` for each egress `Service`.
If you want to expose the egress `Service`s on multiple `Pod`s redundantly or coalesce a number of egress
`Service`s on a smaller number of proxy `Pod`s, you can instead use a pre-created [`ProxyGroup`](/docs/features/kubernetes-operator#proxy-group).
To expose an egress `Service` on a `ProxyGroup`:
1. Follow the instructions to pre-create an [egress `ProxyGroup`](/docs/features/kubernetes-operator#proxy-group).
2. Create an ExternalName `Service` that references the `ProxyGroup` and the tailnet target:
```
` apiVersion: v1
kind: Service
metadata:
annotations:
tailscale.com/tailnet-fqdn: "\<full MagicDNS name of the tailnet node\>"
tailscale.com/proxy-group: "\<ProxyGroup name\>"
name: ts-egress
namespace: default
spec:
externalName: placeholder # any value - will be overwritten by the operator
type: ExternalName
ports:
- port: 8080
protocol: TCP
name: web # any value
- port: 3002
protocol: TCP
name: debug # any value
`
```
You can specify the tailnet target either [by a MagicDNS name](#tailnet-node-dnsname-expose) or [tailnet IP address](#tailnet-node-ip-expose).
The ExternalName Service must explicitly specify all port numbers that you want to access in the tailnet service in the `spec.ports` section.
Cluster traffic received to the ports (and protocols) specified on the ExternalName Service will be proxied to the same ports of the tailnet target.
Note that setting `service.spec.ports` fields other than `port`, `protocol` and `name` will have no effect.
1. (Optional) Wait for the `Service` to become ready:
```
`kubectl wait svc ts-egress --for=condition=TailscaleEgressSvcReady=true
`
```
2. Cluster workloads can now access the tailnet target by ExternalName `Service`'s DNS name, for example:
```
`curl ts-egress.default.svc.cluster.local:8080
`
```
Cluster traffic for ts-egress `Service` will be round robin load balanced across the `ProxyGroup` replicas.
Any number (restricted by resource consumption) of egress `Service`s can reference a single `ProxyGroup`.
You can also create multiple egress `ProxyGroup`s.
## [Access an IP address behind a subnet router](#access-an-ip-address-behind-a-subnet-router)
It is currently not possible to access 4via6 IP addresses using the egress proxy.
If you have a service with a static IP address that is behind a subnet router, you can make it accessible to cluster workloads using egress proxies.
1. Create a `ProxyClass` to ensure that the egress proxy accepts advertised subnet routes:
```
`apiVersion: tailscale.com/v1alpha1
kind: ProxyClass
metadata:
generation: 2
name: accept-routes
spec:
tailscale:
acceptRoutes: true
`
```
2. Create an ExternalName `Service` that references the `ProxyClass` and the target IP behind the subnet router:
```
`apiVersion: v1
kind: Service
metadata:
annotations:
tailscale.com/tailnet-ip: "\<IP-behind-the-subnet-router\>"
tailscale.com/proxy-class: accept-routes
name: ts-egress
spec:
externalName: unused
type: ExternalName
`
```
Cluster workloads should now be able to access the target behind the subnet router using the ExternalName `Service`'s cluster DNS name. For example:
```
`curl ts-egress.default.svc.cluster.local:8080
`
```
## [Validation](#validation)
Wait for the Tailscale Kubernetes Operator to update `spec.externalName` of the Kubernetes `Service` that you created. The `Service` external name should get set to the [Kubernetes DNS name](https://kubernetes.io/docs/concepts/services-networking/dns-pod-service/#services) of another Kubernetes `Service` that is fronting the egress proxy in `tailscale` namespace. The proxy is responsible for routing traffic to the exposed Tailscale node over the tailnet.
After the `Service` external name gets updated, workloads in your cluster should be able to access the exposed tailnet service by referring to it using the [Kubernetes DNS name](https://kubernetes.io/docs/concepts/services-networking/dns-pod-service/#services) of the `Service` that you created.
## [Customization](#customization)
[Customize the operator and resources it manages](/docs/features/kubernetes-operator/how-to/customize).
## [Troubleshooting](#troubleshooting)
[Troubleshoot the operator and resources it manages](/docs/reference/troubleshooting/containers/kubernetes-operator).
## [Limitations](#limitations)
* Egress to external services supports using an IPv4 or IPv6 address for a single route in the `tailscale.com/tailnet-ip` annotation, but not IP ranges.
* Egress to external services currently only supports clusters where privileged pods are permitted (that is, GKE Autopilot is not supported).
On this page
* [Prerequisites](#prerequisites)
* [Expose a tailnet node to your cluster using its Tailscale MagicDNS name](#expose-a-tailnet-node-to-your-cluster-using-its-tailscale-magicdns-name)
* [Expose a tailnet node to your cluster using its Tailscale IP address](#expose-a-tailnet-node-to-your-cluster-using-its-tailscale-ip-address)
* [Expose a tailnet HTTPS service to your cluster workloads](#expose-a-tailnet-https-service-to-your-cluster-workloads)
* [Configure an egress Service using ProxyGroup](#configure-an-egress-service-using-proxygroup)
* [Access an IP address behind a subnet router](#access-an-ip-address-behind-a-subnet-router)
* [Validation](#validation)
* [Customization](#customization)
* [Troubleshooting](#troubleshooting)
* [Limitations](#limitations)
Scroll to top