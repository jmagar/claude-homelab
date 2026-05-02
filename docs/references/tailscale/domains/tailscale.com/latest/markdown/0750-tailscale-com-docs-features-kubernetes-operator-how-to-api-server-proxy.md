Access the Kubernetes control plane using an API server proxy · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Access the Kubernetes control plane using an API server proxy
Last validated: Jan 5, 2026
Accessing the Kubernetes control plane using the API server proxy is currently [in beta](/docs/reference/tailscale-release-stages#beta).
You can use the Tailscale Kubernetes operator to expose and access the Kubernetes control plane (kube-apiserver) over Tailscale.
You can also record kubectl exec, attach, and debug sessions that are executed via the proxy by [creating and configuring a Recorder](/docs/features/kubernetes-operator/how-to/session-recording).
The Tailscale API server proxy can run in one of two modes:
* Auth mode: In auth mode, requests from the tailnet proxied over to the Kubernetes API server are additionally [impersonated](https://kubernetes.io/docs/reference/access-authn-authz/authentication/#user-impersonation) using the sender's tailnet identity. Kubernetes RBAC can then be used to configure granular API server permissions for individual tailnet identities or groups.
* `noauth` mode: In `noauth` mode, requests from the tailnet will be proxied over to the Kubernetes API server but not authenticated. This mechanism can be combined with another authentication/authorization mechanism, such as an authenticating proxy provided by an external IdP or a cloud provider.
Additionally, the Tailscale API server proxy can be deployed in two different ways:
* As an in-process proxy running within the operator itself. This deployment mode is the easiest to get started with but is limited to a single replica. Any access control policies should use the operator's tags as the destination.
* As a high availability set of proxies managed by a [`ProxyGroup` of type `kube-apiserver`](#high-availability). Any access control policies should use the `ProxyGroup`'s tags as the destination. This deployment mode advertises the same URL from multiple replicas using a new Tailscale feature, Tailscale Services, currently in beta.
## [Prerequisites](#prerequisites)
* [Set up the Kubernetes Operator](/docs/features/kubernetes-operator#setup).
* [Enable HTTPS](/docs/how-to/set-up-https-certificates#configure-https) for your tailnet.
* Ensure that your [access control policies](/docs/features/access-control/acls) allow devices and users to access the API server proxy devices on port 443 over TCP. If you install the API server proxy using helm, this device will be an in-process proxy run on the operator itself. If you install the API server proxy using a `ProxyGroup` resource, this will be devices with the ProxyGroup's tags. For example, if you use the in-process proxy and your operator uses `tag:k8s-operator`, allow access for all tailnet devices tagged with `tag:k8s-readers` using a policy like this:
```
`"grants": [
{
"src": ["tag:k8s-readers"],
"dst": ["tag:k8s-operator"],
"ip": ["tcp:443"]
}
]
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
Access to the proxy over the tailnet does not grant tailnet users any default permissions to access Kubernetes API server resources. Tailnet users will only be able to access API server resources that they have been explicitly authorized to access by [Kubernetes RBAC](https://kubernetes.io/docs/reference/access-authn-authz/rbac).
## [Configuring the API server proxy in auth mode](#configuring-the-api-server-proxy-in-auth-mode)
### [Installation](#installation)
#### [Helm](#helm)
If you are installing the Tailscale Kubernetes Operator with [Helm](#helm), you can install the proxy in auth mode by passing `--set-string apiServerProxyConfig.mode=true` flag to the install command:
```
`helm upgrade \\
--install \\
tailscale-operator \\
tailscale/tailscale-operator \\
--namespace=tailscale \\
--create-namespace \\
--set-string oauth.clientId=\<OAauthClientId\> \\
--set-string oauth.clientSecret=\<OAuthClientSecret\> \\
--set-string apiServerProxyConfig.mode="true" \\
--wait
`
```
If you want to deploy a [highly available API server proxy](#high-availability) using a `ProxyGroup`, you can reduce the permissions assigned to the operator's service account by instead using `--set-string apiServerProxyConfig.allowImpersonation=true`:
```
`helm upgrade \\
--install \\
tailscale-operator \\
tailscale/tailscale-operator \\
--namespace=tailscale \\
--create-namespace \\
--set-string oauth.clientId=\<OAauthClientId\> \\
--set-string oauth.clientSecret=\<OAuthClientSecret\> \\
--set-string apiServerProxyConfig.allowImpersonation="true" \\
--wait
`
```
Refer to [Configuring `kubeconfig`](#configuring-kubeconfig) to configure `kubectl` to use the API server proxy.
#### [Static manifests with `kubectl`](#static-manifests-with-kubectl)
If you are installing the Tailscale Kubernetes Operator [using static manifests](#static-manifests-with-kubectl):
1. (Optional) If you are using the operator's in-process API server proxy, set the environment variable `APISERVER\_PROXY=true` in the deployment manifest.
```
`name: APISERVER\_PROXY
value: "true"
`
```
2. Download and apply [RBAC for the API server proxy](https://github.com/tailscale/tailscale/blob/main/cmd/k8s-operator/deploy/manifests/authproxy-rbac.yaml) from the [`tailscale/tailscale`](https://github.com/tailscale/tailscale) repository.
Refer to [Configuring `kubeconfig`](#configuring-kubeconfig) to configure `kubectl` to use the API server proxy.
### [Configuring authentication and authorization](#configuring-authentication-and-authorization)
API server proxy in auth mode [impersonates](https://kubernetes.io/docs/reference/access-authn-authz/authentication/#user-impersonation) requests from the tailnet to the Kubernetes API server. You can then use Kubernetes RBAC to control what API server resources tailnet identities can access.
The impersonation is applied as follows:
* If the user who sends a request to the Kubernetes API server using the proxy is in a tailnet user group for which [API server proxy grants](#impersonating-kubernetes-groups-with-grants) have been configured for that proxy instance, the request will be impersonated as a Kubernetes group specified in the grant. It will also be impersonated as a Kubernetes user whose name matches the tailnet user's name.
* If grants are not used and the node from which the request is sent is [tagged](/docs/features/tags), the request will be impersonated as if from a Kubernetes group whose name matches the tag.
* If grants are not used and the node from which the request is sent is not tagged, the request will be impersonated as a Kubernetes user whose name matches the sender's tailnet username.
### [Impersonating Kubernetes groups with grants](#impersonating-kubernetes-groups-with-grants)
You can use [grants](/docs/features/access-control/grants) to configure the Kubernetes API server resources Tailscale user groups can access.
For example, to give a tailnet user group `group:prod` cluster admin access and give the tailnet user group `group:k8s-readers` read permission for most Kubernetes resources:
1. Update your [grants](/docs/features/access-control/grants):
```
`{
"grants": [
{
"src": ["group:prod"],
"dst": ["tag:k8s-operator"],
"app": {
"tailscale.com/cap/kubernetes": [{
"impersonate": {
"groups": ["system:masters"],
},
}],
},
},
{
"src": ["group:k8s-readers"],
"dst": ["tag:k8s-operator"],
"app": {
"tailscale.com/cap/kubernetes": [{
"impersonate": {
"groups": ["tailnet-readers"],
},
}],
},
}
],
}
`
```
* `grants.src` is the [Tailscale user group](/docs/reference/syntax/policy-file#groups) the grant applies to.
* `grants.dst` must be [the tag of the Tailscale Kubernetes Operator](#prerequisites).
* `system:masters` is a Kubernetes group with [default RBAC bindings](https://kubernetes.io/docs/reference/access-authn-authz/rbac/#user-facing-roles) in all clusters. Kubernetes creates a default `ClusterRole` `cluster-admin` that lets you perform all actions against all Kubernetes API server resources and a `ClusterRoleBinding` `cluster-admin` that binds the `cluster-admin` `ClusterRole` to `system:masters` group.
* `tailnet-readers` is a Kubernetes group that you will bind the [default Kubernetes `view` `ClusterRole`](https://kubernetes.io/docs/reference/access-authn-authz/rbac/#user-facing-roles) to in a following step. (Note that Kubernetes group names do not refer to existing identities in Kubernetes- they do not need to be pre-created to start using them in `(Cluster)RoleBinding`s).
* Bind `tailnet-readers` to the `view` `ClusterRole`:
```
`kubectl create clusterrolebinding tailnet-readers-view --group=tailnet-readers --clusterrole=view
`
```
#### [Impersonating Kubernetes groups with tagged tailnet nodes](#impersonating-kubernetes-groups-with-tagged-tailnet-nodes)
If the request is sent from a [tagged device](/docs/features/tags), it will be impersonated as a [Kubernetes group](https://kubernetes.io/docs/reference/access-authn-authz/rbac/#referring-to-subjects) whose name matches the tag. For example, a request from a tailnet device tagged with `tag:k8s-readers` will be authenticated by the API server as from a Kubernetes group `tag:k8s-readers`.
You can create Kubernetes `(Cluster)Roles` and `(Cluster)RoleBindings` to configure the permissions the group should have or bind an existing `(Cluster)Role` to the group.
For example, to grant devices tagged with `tag:k8s-readers` read-only access to most Kubernetes resources, you can bind Kubernetes group `tag:k8s-users` to the [default Kubernetes `view` ClusterRole](https://kubernetes.io/docs/reference/access-authn-authz/rbac/#user-facing-roles):
```
`kubectl create clusterrolebinding tailnet-readers --group="tag:k8s-readers" --clusterrole=view
`
```
#### [Impersonating Kubernetes users](#impersonating-kubernetes-users)
If the request is *not* sent from a [tagged device](/docs/features/tags), it will be impersonated as a Kubernetes user named the same as the sender's tailnet user.
You can then create Kubernetes `(Cluster)Roles` and `(Cluster)RoleBindings` to configure the permissions the user should have or bind an existing `(Cluster)Role` to the user.
For example, to allow the tailnet user `alice@tailscale.com` read-only access to most Kubernetes resources, bind Kubernetes user `alice@tailscale.com` to the [default Kubernetes `view` ClusterRole](https://kubernetes.io/docs/reference/access-authn-authz/rbac/#user-facing-roles) like so:
```
`kubectl create clusterrolebinding alice-view --user="alice@tailscale.com" --clusterrole=view
`
```
## [Configuring API server proxy in `noauth` mode](#configuring-api-server-proxy-in-noauth-mode)
The `noauth` mode of the API server proxy is useful if you want to use Tailscale to provide access to the Kubernetes API server over the tailnet, but want to keep using your existing authentication and authorization mechanism.
### [Installation](#installation-1)
#### [Helm](#helm-1)
If you are installing the Tailscale Kubernetes Operator with [Helm](#helm), you can install the proxy in auth mode by passing `--set-string apiServerProxyConfig.mode=noauth` flag to the install command. You can skip setting `apiServerProxyConfig` if you are going to configure the API server proxy using a [`kube-apiserver` `ProxyGroup`](#high-availability).
```
`helm upgrade \\
--install \\
tailscale-operator \\
tailscale/tailscale-operator \\
--namespace=tailscale \\
--create-namespace \\
--set-string oauth.clientId=\<OAauth client ID\> \\
--set-string oauth.clientSecret=\<OAuth client secret\> \\
--set-string apiServerProxyConfig.mode="noauth" \\
--wait
`
```
Refer to [Configuring `kubeconfig`](#configuring-kubeconfig) to configure `kubectl` to use the API server proxy.
#### [Static manifests with `kubectl`](#static-manifests-with-kubectl-1)
If you are installing the Tailscale Kubernetes Operator [using static manifests](#static-manifests-with-kubectl):
1. (Optional) If you are using the operator's in-process API server proxy, set the environment variable `APISERVER\_PROXY=noauth` in the Tailscale Kubernetes Operator deployment manifest.
```
`name: APISERVER\_PROXY
value: "noauth"
`
```
Refer to [Configuring `kubeconfig`](#configuring-kubeconfig) to configure `kubectl` to use the API server proxy.
### [Authentication and authorization](#authentication-and-authorization)
When run in `noauth` mode, the API server proxy exposes the Kubernetes API server to the tailnet but does not provide authentication. You can use the proxy endpoint (`\<TailscaleOperatorHostname\>:443`) instead of the Kubernetes API server address and set up authentication and authorization over that using any other mechanism (such as another [authenticating proxy](https://kubernetes.io/docs/reference/access-authn-authz/authentication/#authenticating-proxy) provided by your managed Kubernetes provider or IdP or similar).
## [Configuring a high availability API server proxy](#configuring-a-high-availability-api-server-proxy)
1. Ensure that your [access control policies](/docs/features/access-control/acls) allow devices and users to access the API server proxy devices on both port `80` and `443` over TCP. For example, if you use default tag `tag:k8s` for your `ProxyGroup`, allow access for all tailnet devices tagged with `tag:k8s-readers` using a policy like this:
```
`"grants": [
{
"src": ["tag:k8s-readers"],
"dst": ["tag:k8s"],
"ip": ["tcp:80", "tcp:443"]
}
]
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
2. Update [`autoApprovers`](/docs/reference/syntax/policy-file#autoapprovers) in your tailnet policy file to let the `ProxyGroup` proxies advertise Tailscale Services with the tag `tag:k8s`:
```
` "autoApprovers": {
"services": {
"tag:k8s": ["tag:k8s"],
},
}
`
```
3. Apply the following `ProxyGroup` resource to create a set of Tailscale devices that will act as API server proxies. Set `spec.apiServerProxyConfig.mode` to `noauth` if you want it to run in `noauth` mode.
```
`apiVersion: tailscale.com/v1alpha1
kind: ProxyGroup
metadata:
name: my-cluster
spec:
type: kube-apiserver
replicas: 2
tags: ["tag:k8s"]
kubeAPIServer:
mode: auth
`
```
4. (Optional) Wait for the ProxyGroup to become ready:
```
`kubectl wait proxygroup my-cluster --for=condition=ProxyGroupReady=true
`
```
5. Ensure your [client accepts routes](/docs/features/subnet-routers#use-your-subnet-routes-from-other-devices). Clients other than Linux accept routes by default.
Refer to [Configuring `kubeconfig`](#configuring-kubeconfig) to configure `kubectl` to use the API server proxy.
## [Configuring `kubeconfig`](#configuring-kubeconfig)
You can run the [`tailscale configure kubeconfig`](/docs/reference/tailscale-cli#configure) command to configure `kubectl` for authentication using the Tailscale Kubernetes API server proxy.
By default, the operator's hostname is `tailscale-operator`:
```
`tailscale configure kubeconfig tailscale-operator
`
```
Or if you're using a `kube-apiserver` `ProxyGroup`, you can use the URL printed in its status field:
```
`kubectl get proxygroup my-cluster
NAME STATUS URL TYPE AGE
my-cluster ProxyGroupReady https://my-cluster.tailxyz.ts.net kube-apiserver 31s
`
```
```
`tailscale configure kubeconfig https://my-cluster.tailxyz.ts.net
`
```
The hostname defaults to the name of the `ProxyGroup`, but you can customize it using the `ProxyGroup` field `spec.kubeAPIServer.hostname`.
## [Customization](#customization)
[Customize the operator and resources it manages](/docs/features/kubernetes-operator/how-to/customize).
## [Troubleshooting](#troubleshooting)
[Troubleshoot the operator and resources it manages](/docs/reference/troubleshooting/containers/kubernetes-operator).
## [Limitations](#limitations)
* The API server proxy runs inside the cluster. If your cluster is non-functional or unable to schedule pods, you might lose access to the API server proxy and potentially your cluster.
* The API server proxy requires TLS certificates. When deployed with `ProxyGroup`, the operator will wait for certificates to be provisioned before marking the `ProxyGroup` ready. However, if you are using the operator's in-process proxy, it provisions certificates automatically on the first API call, meaning the first call might be slow or even time out.
On this page
* [Prerequisites](#prerequisites)
* [Configuring the API server proxy in auth mode](#configuring-the-api-server-proxy-in-auth-mode)
* [Installation](#installation)
* [Helm](#helm)
* [Static manifests with kubectl](#static-manifests-with-kubectl)
* [Configuring authentication and authorization](#configuring-authentication-and-authorization)
* [Impersonating Kubernetes groups with grants](#impersonating-kubernetes-groups-with-grants)
* [Impersonating Kubernetes groups with tagged tailnet nodes](#impersonating-kubernetes-groups-with-tagged-tailnet-nodes)
* [Impersonating Kubernetes users](#impersonating-kubernetes-users)
* [Configuring API server proxy in noauth mode](#configuring-api-server-proxy-in-noauth-mode)
* [Installation](#installation-1)
* [Helm](#helm-1)
* [Static manifests with kubectl](#static-manifests-with-kubectl-1)
* [Authentication and authorization](#authentication-and-authorization)
* [Configuring a high availability API server proxy](#configuring-a-high-availability-api-server-proxy)
* [Configuring kubeconfig](#configuring-kubeconfig)
* [Customization](#customization)
* [Troubleshooting](#troubleshooting)
* [Limitations](#limitations)
Scroll to top