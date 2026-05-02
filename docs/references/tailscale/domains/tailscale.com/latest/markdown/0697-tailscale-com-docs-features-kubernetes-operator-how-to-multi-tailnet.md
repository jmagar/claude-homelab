Use multiple tailnets for devices running on Kubernetes · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Use multiple tailnets for devices running on Kubernetes
Last validated: Mar 6, 2026
Using multiple tailnets with a single operator deployment is currently [in alpha](/docs/reference/tailscale-release-stages#alpha).
When deploying the Tailscale operator's [custom resources](https://kubernetes.io/docs/concepts/extend-kubernetes/api-extension/custom-resources), you may want workloads to not only be
able to communicate across clusters, but also across tailnets. For operator versions 1.96 and later you can now use the
`Tailnet` custom resource definition to specify which tailnet should be used by `ProxyGroup`, `Connector` and `Recorder`
instances.
## [Prerequisites](#prerequisites)
Before you begin, you will need access to multiple tailnets. This can either be through separate logins or managed by
a single organization. For more information on managing multiple tailnets within a single organization, refer to the
documentation for [managing multiple tailnets](/docs/features/kubernetes-operator/how-to/multi-tailnet).
Each tailnet you wish to expose requires the appropriate `tagOwners` set in your ACL policy file for the Kubernetes
operator:
```
`"tagOwners": {
"tag:k8s-operator": [],
"tag:k8s": ["tag:k8s-operator"],
}
`
```
If you're using different tags to the default `tag:k8s-operator`, use those in place of the example given
above.
Finally, each tailnet requires an [OAuth client](/docs/features/oauth-clients) that can be used by the operator to generate
auth keys for workloads. Before attempting to create a `Tailnet` resource, create a new OAuth client in the
[Trust credentials](https://login.tailscale.com/admin/settings/trust-credentials) page of the admin console for the tailnet you wish to provide
access to. Create the client with `Devices Core`, `Auth Keys`, `Services` write scopes, and the tag `tag:k8s-operator`.
## [Creating a Tailnet resource](#creating-a-tailnet-resource)
Each `Tailnet` resource references a set of OAuth credentials that must be stored as a Kubernetes `Secret` within the
same namespace as the operator.
Once you have the client id and secret, create a `Secret` resource:
```
`apiVersion: v1
kind: Secret
metadata:
name: example-tailnet
namespace: tailscale
stringData:
client\_id: "\<CLIENT\_ID\>"
client\_secret: "\<CLIENT\_SECRET\>"
`
```
If you deployed the Kubernetes operator into a different namespace, use the name of that namespace instead of
`tailscale`.
Next, create a `Tailnet` resource that references the secret containing the OAuth credentials:
```
`apiVersion: tailscale.com/v1alpha
kind: Tailnet
metadata:
name: example-tailnet
spec:
credentials:
secretName: example-tailnet
`
```
`Tailnet` resources are cluster-scoped and do not require a value in the `namespace` field.
Once deployed, the operator will perform checks that ensure the specified credentials exist and have access to the
Tailscale API. If successful, the `Tailnet` resource will transition into the `TailnetReady` state, and can be used
by other resources. Use the `kubectl get tailnet` command to view the status of your tailnet.
## [Choosing a Tailnet](#choosing-a-tailnet)
Once you have one or more `Tailnet` resources in your cluster, you can create `ProxyGroup`, `Connector` and `Recorder`
resources that connect to that tailnet using the `spec.tailnet` field. This field is immutable, with a blank tailnet
denoting that the resource should use the tailnet that the operator was originally configured with.
Below are some basic examples of how to configure these resources to use a specific tailnet:
```
`apiVersion: tailscale.com/v1alpha1
kind: Connector
metadata:
name: example-connector
spec:
replicas: 3
tailnet: example-tailnet
exitNode: true
`
```
For more information on `Connector` resources, refer to the [subnet routers and exit nodes](/docs/features/kubernetes-operator/how-to/connector) documentation.
```
`apiVersion: tailscale.com/v1alpha1
kind: Recorder
metadata:
name: example-recorder
spec:
replicas: 3
tailnet: example-tailnet
storage: {}
`
```
For more information on `Recorder` resources, refer to the [recorder nodes](/docs/features/kubernetes-operator/how-to/tsrecorder) documentation.
```
`apiVersion: tailscale.com/v1alpha1
kind: ProxyGroup
metadata:
name: example-proxygroup
spec:
replicas: 3
tailnet: example-tailnet
type: kube-apiserver
`
```
For more information on `ProxyGroup` resources, refer to the [ingress](/docs/features/kubernetes-operator/how-to/cluster-ingress) or [egress](/docs/features/kubernetes-operator/how-to/cluster-egress) documentation and
their relevant sections on using `ProxyGroup` resources.
Once started and ready, your devices should appear across your tailnets in the respective [Machines](https://login.tailscale.com/admin/machines)
pages of your tailnets.
On this page
* [Prerequisites](#prerequisites)
* [Creating a Tailnet resource](#creating-a-tailnet-resource)
* [Choosing a Tailnet](#choosing-a-tailnet)
Scroll to top