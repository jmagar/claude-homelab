Expose a Kubernetes cluster workload to your tailnet (cluster ingress) · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Expose a Kubernetes cluster workload to your tailnet (cluster ingress)
Last validated: Jan 5, 2026
Exposing a Kubernetes cluster workload to your tailnet is currently [in beta](/docs/reference/tailscale-release-stages#beta).
You can use the Tailscale Kubernetes operator to expose a Kubernetes cluster workload to your tailnet in three ways:
* Create a `LoadBalancer` type `Service` with the `tailscale` [`loadBalancerClass`](#loadbalancerclass) that fronts your workload.
* [Annotate](#annotations) an existing `Service` that fronts your workload.
* Create an [`Ingress` resource](#ingress-resource) fronting a `Service` or `Service`s for the workloads you wish to expose.
## [Prerequisites](#prerequisites)
* [Set up the Kubernetes Operator](/docs/features/kubernetes-operator#setup).
## [Exposing a cluster workload using a Kubernetes `Service`](#exposing-a-cluster-workload-using-a-kubernetes-service)
### [Exposing a cluster workload by using a Tailscale Load Balancer Service](#exposing-a-cluster-workload-by-using-a-tailscale-load-balancer-service)
Create a new Kubernetes `Service` of type `LoadBalancer`:
1. Set `spec.type` to `LoadBalancer`.
2. Set `spec.loadBalancerClass` to `tailscale`.
After provisioning completes, the Service status will show the [fully-qualified domain name](/docs/features/magicdns) of the Service in your tailnet. You can review the Service status by running `kubectl get service \<service name\>`.
You should also notice a new node with that name appear in the [Machines](https://login.tailscale.com/admin/machines) page of the admin console.
### [Exposing a cluster workload by annotating an existing `Service`](#exposing-a-cluster-workload-by-annotating-an-existing-service)
If the `Service` you want to expose already exists, you can expose it to Tailscale using [object annotations](https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations).
Edit the `Service` and under `metadata.annotations`, add the annotation `tailscale.com/expose` with the value `"true"`. Note that `"true"` is quoted because annotation values are strings, and an unquoted `true` will be incorrectly interpreted as a boolean.
In this mode, Kubernetes doesn't tell you the Tailscale machine name. You can look up the node in the [Machines](https://login.tailscale.com/admin/machines) page of the admin console to find its machine name. By default, the machine name of an exposed `Service` is `\<k8s-namespace\>-\<k8s-servicename\>`, but it [can be changed](/docs/features/kubernetes-operator/how-to/customize#custom-machine-names).
Exposing headless `Service`s is not supported.
## [Exposing cluster workloads using a Kubernetes `Ingress`](#exposing-cluster-workloads-using-a-kubernetes-ingress)
You can expose cluster workloads either to your tailnet or the public internet over TLS using an `Ingress` resource.
When using an `Ingress` resource, you also get the ability to identify callers using [HTTP headers](/docs/features/tailscale-serve#identity-headers) injected by the `Ingress` proxy.
`Ingress` resources only support TLS, and are only exposed over HTTPS using a [MagicDNS](/docs/features/magicdns) name and publicly
trusted certificates from Let's Encrypt. You must [enable HTTPS](/docs/how-to/set-up-https-certificates) and [MagicDNS](/docs/features/magicdns) on your
tailnet.
Edit the `Ingress` resource you want to expose to use the `Ingress` class `tailscale`:
1. Set `spec.ingressClassName` to `tailscale`.
2. Set `tls.hosts` to the desired host name of the Tailscale node. Only the first label is used. Refer to [custom machine names](/docs/features/kubernetes-operator/how-to/customize#custom-machine-names) for more information.
For example, to expose an `Ingress` resource `nginx` to your tailnet:
```
`apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
name: nginx
spec:
defaultBackend:
service:
name: nginx
port:
number: 80
ingressClassName: tailscale
tls:
- hosts:
- nginx
`
```
The backend is HTTP by default. To use HTTPS on the backend, either set the port name to `https` or the port number to `443`:
```
`apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
name: nginx
spec:
defaultBackend:
service:
name: nginx
port:
name: https
ingressClassName: tailscale
---
apiVersion: v1
kind: Service
metadata:
name: nginx
spec:
ports:
- name: https
port: 443
targetPort: 443
type: ClusterIP
`
```
A single `Ingress` resource can be used to front multiple backend `Services`:
```
`apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
name: ingress
spec:
ingressClassName: tailscale
rules:
- http:
paths:
- path: /
pathType: Prefix
backend:
service:
name: ui-svc
port:
number: 80
- path: /api
pathType: Prefix
backend:
service:
name: api-svc
port:
number: 80
`
```
Currently the only supported [`Ingress` path type](https://kubernetes.io/docs/concepts/services-networking/ingress/#path-types) is `Prefix`. Requests for paths with other path types will be routed according to `Prefix` rules.
A Tailscale `Ingress` can only be accessed on port 443.
## [Exposing a `Service` to the public internet using `Ingress` and Tailscale Funnel](#exposing-a-service-to-the-public-internet-using-ingress-and-tailscale-funnel)
You can also use the Tailscale Kubernetes Operator to expose an `Ingress` resource in your Kubernetes cluster to the public internet using [Tailscale Funnel](/docs/features/tailscale-funnel). To do so:
1. Add a `tailscale.com/funnel: "true"` annotation:
```
`apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
name: funnel
annotations:
tailscale.com/funnel: "true"
spec:
defaultBackend:
service:
name: funnel
port:
number: 80
ingressClassName: tailscale
tls:
- hosts:
- funnel
`
```
2. Update the access control policies for your tailnet to allow Kubernetes Operator proxy services to use Tailscale Funnel.
Add a [node attribute](/docs/features/tailscale-funnel#requirements-and-limitations) to allow nodes created by the Kubernetes operator to use Funnel:
```
`"nodeAttrs": [
{
"target": ["tag:k8s"], // tag that Tailscale Operator uses to tag proxies; defaults to 'tag:k8s'
"attr": ["funnel"],
},
// Additional noteAttrs as needed
]
`
```
Note that even if your policy has the `funnel` attribute assigned to `autogroup:member` (the default), you still need to add it to the tag used by proxies because `autogroup:member` does not include tagged devices.
## [Removing a Service](#removing-a-service)
Any of the following actions remove a Kubernetes `Service` you exposed from your tailnet:
* Delete the `Service` entirely.
* If you use the `tailscale.com/expose` annotation, remove the annotation.
* If you use an `Ingress` resource, delete it or change or unset `spec.ingressClassName`.
Deleting a `Service`'s Tailscale node in the [Machines](https://login.tailscale.com/admin/machines) page does not clean up the Kubernetes state associated with that `Service`.
## [High availability](#high-availability)
Tailscale versions 1.84 and later support deploying Tailscale Kubernetes Operator's ingress proxies in high availability (HA) mode, using [`ProxyGroup`](/docs/features/kubernetes-operator#proxy-group) and a new Tailscale feature, [Tailscale Services](/docs/features/tailscale-services).
The HA mode lets you:
* Expose a Kubernetes `Service` or `Ingress` resource to your tailnet through multiple active ingress proxies, to prevent downtime during proxy `Pod` restarts.
* Expose many `Service` and `Ingress` resources to your tailnet using a smaller number of proxy `Pod`s.
### [Prerequisites](#prerequisites-1)
* Ensure that the OAuth client credentials [used by the Tailscale Kubernetes Operator](/docs/features/kubernetes-operator#setup) have `Services`, `Devices Core` and `Auth Keys` write scopes.
If you are updating credentials for an existing installation, you must recreate the Kubernetes Operator's `Pod`.
* Create a [`ProxyGroup`](/docs/features/kubernetes-operator#proxy-group) with `spec.type` set to `ingress`:
```
`apiVersion: tailscale.com/v1alpha1
kind: ProxyGroup
metadata:
name: ingress-proxies
spec:
type: ingress
`
```
Refer to the [`ProxyGroup` API documentation](https://github.com/tailscale/tailscale/blob/main/k8s-operator/api.md#proxygroup) for all available configuration options.
### [Expose a Tailscale Ingress in HA mode](#expose-a-tailscale-ingress-in-ha-mode)
* [Configure permissions](#permissions)
* Create a Tailscale `Ingress` resource that references the `ProxyGroup` you created in the previous step.
The `spec.tls.hosts` field can contain (at most) a single entry that determines the first label of the DNS name by which the `Ingress` will be exposed to the tailnet. If unset, it defaults to `\<ingress-name\>-\<namespace\>`.
```
`apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
name: nginx
annotations:
tailscale.com/proxy-group: ingress-proxies
spec:
defaultBackend:
service:
name: nginx
port:
number: 80
ingressClassName: tailscale
tls:
- hosts:
- nginx
`
```
* Wait for the `Ingress` resource to become ready.
```
`kubectl wait --timeout=80s ingress nginx --for=jsonpath='{.status.loadBalancer.ingress[0].ports[0].port}'=443
`
```
* Ensure that your Tailscale client [accepts routes](/docs/features/subnet-routers#use-your-subnet-routes-from-other-devices). Clients other than Linux accept routes by default.
* Access the cluster workload from a Tailscale client:
```
`kubectl get ingress nginx
NAME CLASS HOSTS ADDRESS PORTS AGE
nginx tailscale \* nginx.tailxyz.ts.net 80, 443 15s
`
```
```
`curl https://nginx.tailxyz.ts.net
...
`
```
### [Expose a Tailscale Service in HA mode](#expose-a-tailscale-service-in-ha-mode)
* [Configure permissions](#permissions)
* Create a Tailscale LoadBalancer `Service` that references the `ProxyGroup` you created in the previous step.
You can use the `tailscale.com/hostname` annotation to set the first label of the DNS name by which the `Service` will be exposed to the tailnet. If unset, it defaults to `\<service-name\>-\<namespace\>`.
```
`apiVersion: v1
kind: Service
metadata:
name: nginx
annotations:
tailscale.com/proxy-group: ingress-proxies
tailscale.com/hostname: nginx
spec:
ports:
- name: http
port: 80
targetPort: 80
type: LoadBalancer
loadBalancerClass: tailscale
`
```
* Wait for the resources to be configured.
```
`kubectl wait svc nginx --for condition=TailscaleIngressSvcConfigured
`
```
* Access the cluster workload from the tailnet.
```
`kubectl get svc nginx
NAME TYPE CLUSTER-IP EXTERNAL-IP PORT(S) AGE
nginx LoadBalancer 10.96.194.223 100.91.19.147 80:31967/TCP 5m16s
`
```
```
`curl http://nginx.tailxyz.ts.net
...
`
```
You can expose an [annotated Tailscale ingress Service](#annotations) in the same way.
### [Configure permissions](#configure-permissions)
By default, the `ProxyGroup` proxies are [tagged](/docs/features/tags) with the tag `tag:k8s`.
You can configure tags using the `.tags` field in the [`ProxyGroup` spec](https://github.com/tailscale/tailscale/blob/main/k8s-operator/api.md#proxygroup).
You must ensure that the tag by which you tagged the [operator's OAuth client credentials](/docs/features/kubernetes-operator#setup) is a [`tagOwner`](/docs/reference/syntax/policy-file#tag-owners) of the `ProxyGroup` device tags.
Unlike with non-HA proxies, the proxy tags are not used to grant access to the cluster apps exposed using the proxies.
For each HA `Service` or `Ingress` exposed on a `ProxyGroup`, the Kubernetes Operator creates a Tailscale Service.
Each `ProxyGroup` proxy advertises the Tailscale Service, by configuring itself as a backend for the tailnet traffic for the Tailscale Service.
The Tailscale IP address and DNS name given to the `Ingress` or `Service` are the IP addresses and DNS name of the Tailscale Service.
You can [tag](/docs/features/tags) Tailscale Service and use the tag to configure which tailnet devices can advertise the Service and which tailnet identities can access it.
By default, the Kubernetes Operator tags all Tailscale Services with a tag `tag:k8s`.
You can configure Tailscale Service tags using `tailscale.com/tags` annotation on the `Service` or `Ingress` resource.
#### [Ensure that `ProxyGroup` devices can advertise the Tailscale Service](#ensure-that-proxygroup-devices-can-advertise-the-tailscale-service)
To permit `ProxyGroup` devices to advertise a Tailscale Service, use the [`autoApprovers`](/docs/reference/syntax/policy-file#autoapprovers) section of the tailnet policy file.
For example, to let `ProxyGroup` devices with the tag `tag:eu-cluster` to advertise Tailscale Services with tag `tag:monitoring`, add the following to your tailnet policy file:
```
`"autoApprovers": {
"services": {
"tag:monitoring": ["tag:eu-cluster"],
},
}
`
```
#### [Configure access](#configure-access)
You can use Tailscale Service tags to control access to it.
For example, to let the user group `group:eng` to access Tailscale Services with the tag `tag:monitoring` exposed on a `ProxyGroup` with the tag `tag:eu-cluster`, add the following to your tailnet policy file:
```
`"grants": [
{
"src": ["group:eng"],
"dst": ["tag:monitoring"],
"ip": ["\*"],
},
{
"src": ["group:eng"],
"dst": ["tag:eu-cluster:\*"],
"ip": ["icmp:\*"],
},
]
`
```
The requirement to permit access to the `ProxyGroup` devices to access Tailscale Services is a temporary limitation.
## [IPv6 support](#ipv6-support)
### [Ingress](#ingress)
To proxy traffic to IPv6 backends, you might need to disable IPv4 tailnet addresses for the proxy tailnet nodes.
You need to disable IPv4 tailnet addresses for:
* Proxies used to expose cluster workloads using [Tailscale ingress `Service`s](/docs/features/kubernetes-operator/how-to/cluster-ingress) if they are running in a cluster that allocates IPv6 addresses to `Service`s.
* Proxies used to expose cloud services using [Tailscale ExternalName `Service`s](/docs/features/kubernetes-operator/how-to/cloud-services) if the cloud services have IPv6 addresses.
You can disable tailnet IPv4 addresses for a specific [tag](/docs/features/tags) using a `disable-ipv4` [node attribute](/docs/reference/syntax/policy-file#nodeattrs).
The following node attributes configuration example disables IPv4 addresses for all nodes tagged with `tag:k8s`:
```
`"nodeAttrs": [
{
"target": ["tag:k8s"],
"attr": [
"disable-ipv4",
],
},
]
`
```
Tailnet IPv6 connectivity does not depend on host support for IPv6, so you can disable IPv4 addresses for nodes running on hosts that do not support IPv6.
Similarly, tailnet clients can connect to proxies with only tailnet IPv6 addresses even if they aren't running on hosts with IPv6 support.
## [Customization](#customization)
[Customize the operator and resources it manages](/docs/features/kubernetes-operator/how-to/customize).
## [Troubleshooting](#troubleshooting)
[Troubleshoot the operator and resources it manages](/docs/reference/troubleshooting/containers/kubernetes-operator).
## [Limitations](#limitations)
* Tags are only considered during initial provisioning. That is, editing `tailscale.com/tags` on an already exposed `Service` doesn't update the tags until you clean up and re-expose the `Service`.
* The requested machine name is only considered during initial provisioning. That is, editing `tailscale.com/hostname` on an already exposed `Service` doesn't update the machine name until you clean up and re-expose the `Service`.
* Cluster-ingress using Kubernetes `Ingress` resource requires TLS certificates. Currently, the certificates are provisioned on the first connect. This means that the first connection might be slow or even time out.
On this page
* [Prerequisites](#prerequisites)
* [Exposing a cluster workload using a Kubernetes Service](#exposing-a-cluster-workload-using-a-kubernetes-service)
* [Exposing a cluster workload by using a Tailscale Load Balancer Service](#exposing-a-cluster-workload-by-using-a-tailscale-load-balancer-service)
* [Exposing a cluster workload by annotating an existing Service](#exposing-a-cluster-workload-by-annotating-an-existing-service)
* [Exposing cluster workloads using a Kubernetes Ingress](#exposing-cluster-workloads-using-a-kubernetes-ingress)
* [Exposing a Service to the public internet using Ingress and Tailscale Funnel](#exposing-a-service-to-the-public-internet-using-ingress-and-tailscale-funnel)
* [Removing a Service](#removing-a-service)
* [High availability](#high-availability)
* [Prerequisites](#prerequisites-1)
* [Expose a Tailscale Ingress in HA mode](#expose-a-tailscale-ingress-in-ha-mode)
* [Expose a Tailscale Service in HA mode](#expose-a-tailscale-service-in-ha-mode)
* [Configure permissions](#configure-permissions)
* [Ensure that ProxyGroup devices can advertise the Tailscale Service](#ensure-that-proxygroup-devices-can-advertise-the-tailscale-service)
* [Configure access](#configure-access)
* [IPv6 support](#ipv6-support)
* [Ingress](#ingress)
* [Customization](#customization)
* [Troubleshooting](#troubleshooting)
* [Limitations](#limitations)
Scroll to top