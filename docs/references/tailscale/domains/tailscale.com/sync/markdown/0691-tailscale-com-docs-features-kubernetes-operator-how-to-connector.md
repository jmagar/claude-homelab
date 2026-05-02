Deploy exit nodes and subnet routers on Kubernetes · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Deploy exit nodes and subnet routers on Kubernetes
Last validated: Dec 4, 2025
Deploying exit nodes and subnet routers on Kubernetes is currently [in beta](/docs/reference/tailscale-release-stages#beta).
Tailscale Kubernetes Operator installation includes a `Connector` [Custom Resource Definition](https://kubernetes.io/docs/concepts/extend-kubernetes/api-extension/custom-resources).
You can use the `Connector` to configure the operator to deploy a Tailscale device that acts as a Tailscale [subnet router](/docs/features/subnet-routers), [exit-node](/docs/features/exit-nodes), or both.
For example, you can deploy a `Connector` that acts as a subnet router and exposes to your tailnet cluster `Service` CIDRs or some cloud service CIDRs that are available from the cluster, but not publicly accessible.
## [Prerequisites](#prerequisites)
* [Set up the Kubernetes Operator](/docs/features/kubernetes-operator#setup).
## [Deploy an exit node or subnet router](#deploy-an-exit-node-or-subnet-router)
To create a `Connector` that exposes `10.40.0.0/14` CIDR to your tailnet:
1. (Optional) Set the [tag](/docs/features/tags) of the `Connector` node to be [auto-approved](/docs/reference/syntax/policy-file#autoapprovers). By default, the device will be tagged with `tag:k8s`. You can set one or more custom tags using `.connector.spec.tags` in step 2. If you set a custom tag, you must also ensure that the operator is an [owner](/docs/reference/syntax/policy-file#tag-owners) of this tag.
2. Create a `Connector` Custom Resource:
```
`apiVersion: tailscale.com/v1alpha1
kind: Connector
metadata:
name: ts-pod-cidrs
spec:
replicas: 1
hostnamePrefix: ts-pod-cidrs
subnetRouter:
advertiseRoutes:
- "10.40.0.0/14"
`
```
3. Wait for the `Connector` resources to get created:
```
`kubectl get connector ts-pod-cidrs
`
```
For example, this command will return information similar to the following:
```
`NAME SUBNETROUTES ISEXITNODE STATUS
ts-pod-cidrs 10.40.0.0/14 false ConnectorCreated
`
```
4. (Optional) If you did not configure the route to be auto-approved in step 1, open the [Machines](https://login.tailscale.com/admin/machines) page of the admin console and manually approve the newly created `ts-pod-cidrs` device to advertise the `10.40.0.0/14` route.
5. (Optional and for Linux clients only) Ensure that clients that need to access resources in the subnet have [accepted the advertised route](/docs/features/subnet-routers#use-your-subnet-routes-from-other-devices).
## [Customization](#customization)
[Customize the operator and resources it manages](/docs/features/kubernetes-operator/how-to/customize). You can find [all available `Connector` configuration options on GitHub](https://github.com/tailscale/tailscale/blob/main/k8s-operator/api.md#connector).
## [Troubleshooting](#troubleshooting)
[Troubleshoot the operator and resources it manages](/docs/reference/troubleshooting/containers/kubernetes-operator).
On this page
* [Prerequisites](#prerequisites)
* [Deploy an exit node or subnet router](#deploy-an-exit-node-or-subnet-router)
* [Customization](#customization)
* [Troubleshooting](#troubleshooting)
Scroll to top