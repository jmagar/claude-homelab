Kubernetes operator · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Kubernetes operator
Last validated: Jan 5, 2026
Tailscale Kubernetes Operator is available for [all plans](/pricing).
The [Tailscale Kubernetes Operator](https://github.com/tailscale/tailscale/blob/main/cmd/k8s-operator/deploy/manifests/operator.yaml) lets you:
* [Access the Kubernetes control plane using an API server proxy](/docs/features/kubernetes-operator/how-to/api-server-proxy)
* [Expose a tailnet service to your Kubernetes cluster (cluster egress)](/docs/features/kubernetes-operator/how-to/cluster-egress)
* [Expose a cluster workload to your tailnet (cluster ingress)](/docs/features/kubernetes-operator/how-to/cluster-ingress)
* [Expose a cluster workload to another cluster (cross-cluster connectivity)](/docs/features/kubernetes-operator/how-to/cross-cluster)
* [Expose a cloud service to your tailnet](/docs/features/kubernetes-operator/how-to/cloud-services)
* [Deploy exit nodes and subnet routers](/docs/features/kubernetes-operator/how-to/connector)
* [Deploy app connector](/docs/features/kubernetes-operator/how-to/app-connector)
* [Deploy `tsrecorder`](/docs/features/kubernetes-operator/how-to/tsrecorder)
* [Expose multi-cluster applications to internal users](/docs/features/kubernetes-operator/how-to/multi-cluster-ingress)
* [Manage multi-cluster deployments with ArgoCD](/docs/solutions/manage-multi-cluster-kubernetes-deployments-argocd)
## [Setting up the Kubernetes operator](#setting-up-the-kubernetes-operator)
### [Prerequisites](#prerequisites)
Tailscale Kubernetes Operator must be configured with [OAuth client credentials](/docs/features/oauth-clients#setting-up-an-oauth-client). The operator uses these credentials to manage devices by using the [Tailscale API](/docs/reference/tailscale-api) and to create [auth keys](/docs/features/access-control/auth-keys) for itself and the devices it manages.
1. In your [tailnet policy file](/docs/features/access-control/acls), create the [tags](/docs/features/tags) `tag:k8s-operator` and `tag:k8s`, and make `tag:k8s-operator` an owner of `tag:k8s`. If you want your `Services` to be exposed with tags other than the default `tag:k8s`, create those as well and make `tag:k8s-operator` an owner.
```
`"tagOwners": {
"tag:k8s-operator": [],
"tag:k8s": ["tag:k8s-operator"],
}
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
2. [Create an OAuth client](/docs/features/oauth-clients#setting-up-an-oauth-client) in the [Trust credentials](https://login.tailscale.com/admin/settings/trust-credentials) page of the admin console. Create the client with `Devices Core`, `Auth Keys`, `Services` write scopes, and the tag `tag:k8s-operator`.
### [Installation](#installation)
A default operator installation creates:
* A `"tailscale"` `Namespace`.
* An `"operator"` `Deployment`.
* Role-based access control (RBAC) for the operator.
* A `"tailscale"` `IngressClass`.
* `ProxyClass`, `Connector`, `ProxyGroup`, `DNSConfig`, `Recorder` Custom Resource Definitions (CRDs).
There are two ways to install the Tailscale Kubernetes Operator: using [Helm](#helm) or applying [static manifests with `kubectl`](#static-manifests).
#### [Helm](#helm)
Tailscale Kubernetes Operator's Helm charts are available from two chart repositories.
The `https://pkgs.tailscale.com/helmcharts` repository contains well-tested charts for [stable Tailscale versions](/docs/reference/tailscale-client-versions).
Helm charts and container images for a new stable Tailscale version are released a few days after the official release. This is done to avoid releasing image
versions with potential bugs in the core Linux client or core libraries.
The `https://pkgs.tailscale.com/unstable/helmcharts` repository contains charts with the very latest changes, published in between official releases.
The charts in both repositories are different versions of the same chart and you can upgrade from one to the other.
To install the latest Kubernetes Tailscale operator from `https://pkgs.tailscale.com/helmcharts` in `tailscale` namespace:
1. Add `https://pkgs.tailscale.com/helmcharts` to your local Helm repositories:
```
`helm repo add tailscale https://pkgs.tailscale.com/helmcharts
`
```
2. Update your local Helm cache:
```
`helm repo update
`
```
3. Install the operator passing the OAuth client credentials that you created earlier:
```
`helm upgrade \\
--install \\
tailscale-operator \\
tailscale/tailscale-operator \\
--namespace=tailscale \\
--create-namespace \\
--set-string oauth.clientId="\<OAauth client ID\>" \\
--set-string oauth.clientSecret="\<OAuth client secret\>" \\
--wait
`
```
#### [Static manifests with `kubectl`](#static-manifests-with-kubectl)
1. Download the Tailscale Kubernetes Operator [manifest file](https://github.com/tailscale/tailscale/blob/main/cmd/k8s-operator/deploy/manifests/operator.yaml) from the [`tailscale/tailscale`](https://github.com/tailscale/tailscale) repository.
2. Edit your version of the manifest file:
1. Find `# SET CLIENT ID HERE` and replace it with your OAuth client ID.
2. Find `# SET CLIENT SECRET HERE` and replace it with your OAuth client secret. The OAuth client secret is case-sensitive.
For both the client ID and secret, quote the value, to avoid any potential YAML misinterpretation of unquoted strings. For example, use:
```
`client\_id: "k123456CNTRL"
client\_secret: "tskey-client-k123456CNTRL-abcdef"
`
```
instead of:
```
`client\_id: k123456CNTRL
client\_secret: tskey-client-k123456CNTRL-abcdef
`
```
3. Apply the edited file to your Kubernetes cluster:
```
`kubectl apply -f manifest.yaml
`
```
### [Installation with workload identity federation](#installation-with-workload-identity-federation)
Workload identity federation is currently [in beta](/docs/reference/tailscale-release-stages#beta).
Tailscale supports [workload identity federation](/docs/features/workload-identity-federation) for authenticating to a tailnet using provider-native identity tokens. The operator can leverage its ServiceAccount token as an OIDC identity and authenticate without requiring a long-lived OAuth client secret.
#### [Prerequisites](#prerequisites-1)
* The Kubernetes cluster's OIDC discovery endpoints must be publicly accessible. Bind the `"unauthenticated"` group to the `"system:service-account-issuer-discovery"` `ClusterRole` to allow unauthenticated access:
```
`kubectl create clusterrolebinding oidc-discovery \\
--clusterrole=system:service-account-issuer-discovery \\
--group=system:unauthenticated
`
```
#### [Helm](#helm-1)
1. Get your cluster's issuer:
The following command has a `jq` dependency. You may need to install `jq` on your device.
```
`ISSUER="$(kubectl get --raw /.well-known/openid-configuration | jq '.issuer')"
`
```
2. [Configure a federated identity in the admin console](/docs/features/workload-identity-federation#configure-federated-identities-in-the-admin-console) using:
* Set the **Issuer** to **Custom issuer**.
* Set the **Issuer URL** to the value of `$ISSUER` from the previous step.
* Set the **Subject** to `system:serviceaccount:tailscale:operator`.
* Leave the **Audience** field blank.
* Set `Devices Core` and `Auth Keys` and `Services` write scopes.
* And the tag `tag:k8s-operator`.
* Add `https://pkgs.tailscale.com/helmcharts` to your local Helm repositories:
```
`helm repo add tailscale https://pkgs.tailscale.com/helmcharts
`
```
* Update your local Helm cache:
```
`helm repo update
`
```
* Install the operator passing the OAuth client details that you created earlier:
```
`helm upgrade \\
--install \\
tailscale-operator \\
tailscale/tailscale-operator \\
--namespace=tailscale \\
--create-namespace \\
--set-string oauth.clientId="\<OAauth client ID\>" \\
--set-string oauth.audience="\<OAuth client audience\>" \\
--wait
`
```
### [Validation](#validation)
Verify that the Tailscale operator has joined your tailnet. Open the [Machines](https://login.tailscale.com/admin/machines) page of the admin console and look for a node named `tailscale-operator` (or your customized hostname) tagged with the `tag:k8s-operator` tag. It may take some time for the operator to join your tailnet as the container image downloads and the Pod starts.
### [(Optional) Pre-creating a `ProxyGroup`](#optional-pre-creating-a-proxygroup)
When a user configures an [ingress](/docs/features/kubernetes-operator/how-to/cluster-ingress) or [egress](/docs/features/kubernetes-operator/how-to/cluster-egress) proxy, the default mode for the operator is to create a tailnet device deployed as a `StatefulSet` with a single `Pod`.
This model has a few caveats:
* a single `Pod` means that there will be some downtime during proxy upgrades, cluster upgrades, etc
* a `Pod` per proxy may not be feasible for large installations (high resource consumption)
Tailscale Kubernetes Operator 1.76 and later provides the ability to pre-create a multi-replica `ProxyGroup`. [Ingress](/docs/features/kubernetes-operator/how-to/cluster-ingress) and [egress](/docs/features/kubernetes-operator/how-to/cluster-egress) can then be exposed redundantly by using the `ProxyGroup`.
To create a `ProxyGroup` with three replicas for Tailscale egress `Service`s:
1. Apply the following manifest:
```
`apiVersion: tailscale.com/v1alpha1
kind: ProxyGroup
metadata:
name: ts-proxies
spec:
type: egress
replicas: 3
`
```
2. (Optional) Wait for the `ProxyGroup` to become ready:
```
`kubectl wait proxygroup ts-proxies --for=condition=ProxyGroupReady=true
`
```
For the above `ProxyGroup` the operator creates a `StatefulSet` with three replicas, each of which is a tailnet device.
Egress `Service`s can now refer to the newly created `ProxyGroup`. Refer to [Configure an egress `Service` using `ProxyGroup`](/docs/features/kubernetes-operator/how-to/cluster-egress).
You can find [all available `ProxyGroup` configuration options on GitHub →](https://github.com/tailscale/tailscale/blob/main/k8s-operator/api.md#proxygroup)
## [Supported versions](#supported-versions)
### [Operator and proxies](#operator-and-proxies)
Tailscale recommends that you use the same version for the operator and the proxies, because majority of our tests run against the same versions.
The operator supports proxies running a Tailscale version up to four minor versions earlier than the operator's version.
The operator does not support proxies running a Tailscale version later than the operator's version.
### [Kubernetes versions](#kubernetes-versions)
The earliest supported version of Kubernetes is v1.23.0.
## [CNI compatibility](#cni-compatibility)
The operator creates proxies that configure custom routing and forwarding rules in each proxy `Pod`'s network namespace only.
Because the proxying is implemented in the proxy `Pod`'s namespace, the routing and firewall configuration on the `Node` (for example, using iptables, eBPF, or any other mechanism) doesn't affect the proxies.
This means that the proxies work with most CNI configurations out of the box.
## [TLS certificates and renewal](#tls-certificates-and-renewal)
The operator automatically provisions TLS certificates for Tailscale Ingress and API server proxy services. Certificates are valid for 90 days, and typically renew two-thirds through their validity period. Certificates only renew if there is traffic to the service. If a certificate expires, the next request to the service will trigger a renewal.
## [EKS Fargate](#eks-fargate)
On [EKS Fargate](https://docs.aws.amazon.com/eks/latest/userguide/fargate.html), currently the only supported operator features are [Tailscale `Ingress`](/docs/features/kubernetes-operator/how-to/cluster-ingress#ingress-resource) and [Tailscale API server proxy](/docs/features/kubernetes-operator/how-to/api-server-proxy).
[Tailscale ingress `Service`s](/docs/features/kubernetes-operator/how-to/cluster-ingress#ingress-service), [Tailscale egress `Service`s](/docs/features/kubernetes-operator/how-to/cluster-egress) and the [`Connector`](/docs/features/kubernetes-operator/how-to/connector) configurations currently contain [privileged containers](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/) and containers with [CAP\_NET\_ADMIN](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/).
This is not supported on EKS Fargate.
### [Cilium in kube-proxy replacement mode](#cilium-in-kube-proxy-replacement-mode)
You must enable [bypassing socket load balancer in Pods' namespaces](https://docs.cilium.io/en/stable/network/kubernetes/kubeproxy-free/#socket-loadbalancer-bypass-in-pod-namespace) if you run Cilium in [kube-proxy replacement mode](https://docs.cilium.io/en/stable/network/kubernetes/kubeproxy-free) and want to do one or more of the following:
* Expose a Kubernetes `Service` to your tailnet as a [Tailscale LoadBalancer `Service`](/docs/features/kubernetes-operator/how-to/cluster-ingress#loadbalancerclass).
* Expose a Kubernetes `Service` to your tailnet using [`tailscale.com/expose` annotation](/docs/features/kubernetes-operator/how-to/cluster-ingress).
* Expose a Service CIDR range by using [`Connector`](/docs/features/kubernetes-operator/how-to/connector).
This is needed because when Cilium runs in kube-proxy replacement mode with the socket load balancing in `Pod`s' namespaces enabled, connections from `Pod`s to `ClusterIP`s go over a TCP socket (instead of going out via `Pod`s' `veth` devices) and thus bypasses [Tailscale firewall rules](/docs/reference/netfilter-modes) that are attached to [netfilter hooks](https://www.netfilter.org).
If you encounter bandwidth issues while using Cilium, use the `--devices` flag to explicitly specify which network interfaces Cilium should monitor for the maximum transmission unit (MTU). This prevents Cilium from defaulting to the MTU of the `tailscale0` interface and instead ensures it uses the MTU of a physical interface on the host.
## [Customization](#customization)
[Customize the operator and resources it manages](/docs/features/kubernetes-operator/how-to/customize).
## [Troubleshooting](#troubleshooting)
[Troubleshoot the operator and resources it manages](/docs/reference/troubleshooting/containers/kubernetes-operator).
## [Limitations](#limitations)
* There are no dashboards or metrics. We are interested to hear what metrics you would find useful — do [reach out](https://github.com/tailscale/tailscale/issues/new/choose).
* The container images, charts or manifests are not signed. *We are working on this.*
* The static manifests are currently only available from the [`tailscale/tailscale`](https://github.com/tailscale/tailscale) codebase. *We are working to improve this flow.*
* Using the operator on [OpenShift](https://www.redhat.com/en/technologies/cloud-computing/openshift) is currently not supported.
## [Glossary](#glossary)
**Proxy**
In the context of this document, a proxy is the Tailscale node deployed for each user-configured component that the operator manages (such as a [`Tailscale Ingress`](/docs/features/kubernetes-operator/how-to/cluster-ingress#ingress-resource) or a [`Connector`](/docs/features/kubernetes-operator/how-to/connector)).
The proxy is deployed as a `StatefulSet` in the operator's namespace (defaults to `tailscale`).
The `StatefulSet`s name is prefixed by a portion of the configured component's name.
If you need to reliably refer to the proxy's `StatefulSet`, you can use label selectors.
For example, to find `StatefulSet` for a Tailscale `Ingress` resource named `ts-ingress` in `prod` namespace , you can run:
```
`kubectl get statefulset \\
--namespace tailscale \\
--selector="tailscale.com/managed=true,tailscale.com/parent-resource-type=ingress,tailscale.com/parent-resource=ts-ingress,tailscale.com/parent-resource-ns=prod"
`
```
The `tailscale.com/parent-resource` label is set to `svc` for a `Service` and to `connector` for a `Connector`.
The `tailscale.com` labels are also propagated to the `Pod`.
On this page
* [Setting up the Kubernetes operator](#setting-up-the-kubernetes-operator)
* [Prerequisites](#prerequisites)
* [Installation](#installation)
* [Helm](#helm)
* [Static manifests with kubectl](#static-manifests-with-kubectl)
* [Installation with workload identity federation](#installation-with-workload-identity-federation)
* [Prerequisites](#prerequisites-1)
* [Helm](#helm-1)
* [Validation](#validation)
* [(Optional) Pre-creating a ProxyGroup](#optional-pre-creating-a-proxygroup)
* [Supported versions](#supported-versions)
* [Operator and proxies](#operator-and-proxies)
* [Kubernetes versions](#kubernetes-versions)
* [CNI compatibility](#cni-compatibility)
* [TLS certificates and renewal](#tls-certificates-and-renewal)
* [EKS Fargate](#eks-fargate)
* [Cilium in kube-proxy replacement mode](#cilium-in-kube-proxy-replacement-mode)
* [Customization](#customization)
* [Troubleshooting](#troubleshooting)
* [Limitations](#limitations)
* [Glossary](#glossary)
Scroll to top