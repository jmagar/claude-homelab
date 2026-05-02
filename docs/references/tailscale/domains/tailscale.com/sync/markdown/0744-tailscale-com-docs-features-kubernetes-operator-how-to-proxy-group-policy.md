Control access to ProxyGroup resources · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Control access to ProxyGroup resources
Last validated: Mar 9, 2026
Kubernetes Operator ProxyGroupPolicy resources are currently [in alpha](/docs/reference/tailscale-release-stages#alpha). To try it, follow the steps below to enable it for your network using Tailscale v1.96 or later.
When managing a multi-tenant Kubernetes cluster, you may wish to limit access to your deployed `ProxyGroup` resources,
especially when those `ProxyGroup` instances use different tailnets. For operator versions 1.96, and later you can now
use the `ProxyGroupPolicy` resource that lets cluster administrators limit usage of the `tailscale.com/proxy-group`
annotation on `Service` and `Ingress` resources within individual namespaces.
`ProxyGroupPolicy` resources let you specify whether a namespace can use a given `ProxyGroup` for ingress or egress.
Should a user attempt to create an `Ingress` or `Service` that specifies a `ProxyGroup`'s name that is not within
the allow list, it will be rejected by the Kubernetes API server.
## [Prerequisites](#prerequisites)
* [Set up the Kubernetes Operator](/docs/features/kubernetes-operator#setup).
A namespace that contains no `ProxyGroupPolicy` resource is effectively
considered an "allow-all". When applying a `ProxyGroupPolicy` to a namespace that
already contains `Service` or `Ingress` resources using the
`tailscale.com/proxy-group` annotation, these resources will not be evaluated until they are
next modified.
Below is an example of a `ProxyGroupPolicy` that limits access to all `ProxyGroup` resources, effectively a "deny-all"
policy:
```
`apiVersion: tailscale.com/v1alpha1
kind: ProxyGroupPolicy
metadata:
name: deny-all
namespace: example
spec:
ingress: []
egress: []
`
```
The above `ProxyGroupPolicy` will be transformed into native `ValidatingAdmissionPolicy` and `ValidatingAdmissionPolicyBinding`
resources that evaluate the contents of the `tailscale.com/proxy-group` annotation on `Ingress` and `Service` resources
within the same namespace.
If a namespace contains multiple `ProxyGroupPolicy` resources, they will be
merged into a single `ValidatingAdmissionPolicy` resource.
## [Multi-tenant example](#multi-tenant-example)
Imagine a multi-tenant Kubernetes cluster in which teams use separate tailnets for their services and each team is granted
a namespace within the cluster for their own personal workloads.
To set up access to their respective tailnets a `ProxyGroup` resource is created for each team pointing to their personal
tailnets. To ensure ingress or egress is not allowed to any other tailnets from those namespaces, a `ProxyGroupPolicy`
can be specified for each namespace:
```
`apiVersion: tailscale.com/v1alpha1
kind: ProxyGroupPolicy
metadata:
name: billing
namespace: team-billing
spec:
ingress:
- billing-ingress
egress:
- billing-egress
---
apiVersion: tailscale.com/v1alpha1
kind: ProxyGroupPolicy
metadata:
name: customer-engineering
namespace: team-customer-engineering
spec:
ingress:
- customer-engineering-ingress
egress:
- customer-engineering-egress
`
```
This then only lets `Service` and `Ingress` resources within the `team-billing` namespace use the `billing-ingress`
and `billing-egress` `tailscale.com/proxy-group` annotations. The following `Ingress` resource would then be rejected by
the Kubernetes API server:
```
`apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
name: example-ingress
namespace: team-billing
annotations:
tailscale.com/proxy-group: customer-engineering-egress
spec:
defaultBackend:
service:
name: example
port:
number: 80
ingressClassName: tailscale
tls:
- hosts:
- example
`
```
The same will also occur for any other ingress/egress methods the operator supports that rely on `ProxyGroup` resources.
On this page
* [Prerequisites](#prerequisites)
* [Multi-tenant example](#multi-tenant-example)
Scroll to top