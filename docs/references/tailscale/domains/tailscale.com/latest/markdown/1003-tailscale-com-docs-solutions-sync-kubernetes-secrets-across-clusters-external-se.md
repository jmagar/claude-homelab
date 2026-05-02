Sync Kubernetes secrets across clusters with External Secrets Operator · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Sync Kubernetes secrets across clusters with External Secrets Operator
Last validated: Mar 9, 2026
Managing secrets across multiple Kubernetes clusters is one of the harder problems in multi-cluster operations. Teams commonly resort to copying secrets between clusters manually, committing encrypted secrets to Git, or running a centralized vault that requires additional infrastructure. Each approach introduces operational burden or security risk.
[External Secrets Operator](https://external-secrets.io/) (ESO) solves this by synchronizing secrets from external providers into Kubernetes. Its [Kubernetes provider](https://external-secrets.io/latest/provider/kubernetes/) can read secrets directly from a remote cluster's API server, making it possible to treat one cluster as a secret source for others. The challenge is connecting ESO to those remote API servers securely.
This guide combines External Secrets Operator with the Tailscale Kubernetes Operator to sync secrets from a source cluster (the cluster that holds the canonical secrets) to one or more workload clusters over a private network. You'll configure Tailscale egress services to route traffic from ESO to the source cluster's API server, authenticated through Tailscale's [Kubernetes impersonation](/docs/features/access-control/grants/grants-app-capabilities#tailscale-kubernetes-operator). No secrets are stored in Git, no API servers are exposed to the internet, and adding a new workload cluster requires only a new egress service and a `ClusterSecretStore`.
## [Prerequisites](#prerequisites)
Before following this guide, make sure you have:
* Two or more Kubernetes clusters (a source cluster that holds secrets and one or more workload clusters that consume them)
* A [Tailscale account](https://login.tailscale.com/start) with [Admin](/docs/reference/user-roles) access
* The Tailscale Kubernetes Operator [installed in each cluster](/docs/kubernetes) with [OAuth credentials configured](/docs/features/kubernetes-operator#setting-up-the-kubernetes-operator)
* The API server proxy enabled on the source cluster's operator installation
* [External Secrets Operator](https://external-secrets.io/) installed in each workload cluster
## [Install the Tailscale Kubernetes Operator with API server proxy](#install-the-tailscale-kubernetes-operator-with-api-server-proxy)
Install the Tailscale Kubernetes Operator in your source cluster with the API server proxy enabled. This exposes the cluster's API server in your tailnet so that ESO in other clusters can read secrets from it.
```
`helm upgrade --install tailscale-operator tailscale/tailscale-operator \\
--namespace=tailscale \\
--create-namespace \\
--set-string oauth.clientId=\<YOUR\_OAUTH\_CLIENT\_ID\> \\
--set-string oauth.clientSecret=\<YOUR\_OAUTH\_CLIENT\_SECRET\> \\
--set operatorConfig.hostname=source-k8s-operator \\
--set apiServerProxyConfig.mode=true \\
--set apiServerProxyConfig.allowImpersonation=true \\
--wait
`
```
The key configuration options are:
* `apiServerProxyConfig.mode=true`: Enables the Kubernetes API server proxy, exposing the API server in your tailnet.
* `apiServerProxyConfig.allowImpersonation=true`: Lets Tailscale impersonate Kubernetes users and groups on behalf of connecting clients. This is how ESO authenticates — the bearer token is not used directly.
The workload clusters also need the Tailscale Kubernetes Operator installed, but they don't require the API server proxy:
```
`helm upgrade --install tailscale-operator tailscale/tailscale-operator \\
--namespace=tailscale \\
--create-namespace \\
--set-string oauth.clientId=\<YOUR\_OAUTH\_CLIENT\_ID\> \\
--set-string oauth.clientSecret=\<YOUR\_OAUTH\_CLIENT\_SECRET\> \\
--set operatorConfig.hostname=workload-k8s-operator \\
--wait
`
```
## [Configure access control policies](#configure-access-control-policies)
External Secrets Operator authenticates to the source cluster's API server through Tailscale [Kubernetes impersonation](/docs/features/access-control/grants/grants-app-capabilities#tailscale-kubernetes-operator). You need to configure [access control policies](/docs/features/access-control/acls) that grant the workload clusters permission to read secrets from the source cluster.
Add the following [grants](/docs/features/access-control/grants) to your tailnet policy file. You can update the tailnet policy file from the [Access controls](https://login.tailscale.com/admin/acls) page of the admin console:
This grants policy uses [application capabilities](/docs/features/access-control/grants/grants-app-capabilities#tailscale-kubernetes-operator) to provide fine-grained access to the source cluster's Kubernetes API. The `impersonate` field controls which Kubernetes groups the workload cluster's operator can act as.
```
`{
"grants": [
{
"src": ["tag:k8s-operator"],
"dst": ["tag:k8s-operator"],
"app": {
"tailscale.com/cap/kubernetes": [
{
"impersonate": {
"groups": ["tailscale:external-secrets"]
}
}
]
}
}
]
}
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
This policy lets any device tagged `k8s-operator` to impersonate the `tailscale:external-secrets` group when accessing another `k8s-operator` device's Kubernetes API.
The `impersonate.groups` field is the key connection between Tailscale access control and Kubernetes RBAC. When ESO's request reaches the source cluster's API server proxy, Tailscale identifies the calling device, checks that it has a matching grant, and forwards the request with the [Kubernetes impersonation header](https://kubernetes.io/docs/reference/access-authn-authz/authentication/#user-impersonation) `Impersonate-Group: tailscale:external-secrets`. The Kubernetes API server then evaluates the request as if it came from a member of that group. This means you control what ESO can do by creating a Kubernetes `ClusterRoleBinding` that binds the impersonated group to a `ClusterRole`.
Use a dedicated impersonation group like `tailscale:external-secrets` rather than `system:masters`. This follows the principle of least privilege, granting only the permissions ESO needs rather than full cluster admin access.
## [Create RBAC for the impersonated group on the source cluster](#create-rbac-for-the-impersonated-group-on-the-source-cluster)
The grant above causes requests from workload clusters to arrive at the source cluster's API server as the `tailscale:external-secrets` group. You now need to bind that group to a Kubernetes `ClusterRole` that grants the permissions ESO requires.
Create a `ClusterRole` and `ClusterRoleBinding` on the source cluster:
```
`apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
name: external-secrets-reader
rules:
- apiGroups: [""]
resources: ["secrets"]
verbs: ["get", "list", "watch"]
- apiGroups: ["authorization.k8s.io"]
resources: ["selfsubjectrulesreviews"]
verbs: ["create"]
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
name: external-secrets-reader
subjects:
- kind: Group
name: tailscale:external-secrets
apiGroup: rbac.authorization.k8s.io
roleRef:
kind: ClusterRole
name: external-secrets-reader
apiGroup: rbac.authorization.k8s.io
`
```
The `ClusterRoleBinding` subject group (`tailscale:external-secrets`) must match the `impersonate.groups` value in the grant exactly. The `selfsubjectrulesreviews` permission is required because ESO performs a self-check to verify it has the necessary permissions before attempting to read secrets.
Apply this to the source cluster:
```
`kubectl apply -f rbac.yaml --context source-k8s-operator.\<YOUR\_TAILNET\_NAME\>.ts.net
`
```
For tighter security, use a namespaced `Role` and `RoleBinding` instead of `ClusterRole` to restrict access to specific namespaces. For example, to restrict ESO to only read secrets from the `default` namespace:
```
`apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
name: external-secrets-reader
namespace: default
rules:
- apiGroups: [""]
resources: ["secrets"]
verbs: ["get", "list", "watch"]
- apiGroups: ["authorization.k8s.io"]
resources: ["selfsubjectrulesreviews"]
verbs: ["create"]
---
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
name: external-secrets-reader
namespace: default
subjects:
- kind: Group
name: tailscale:external-secrets
apiGroup: rbac.authorization.k8s.io
roleRef:
kind: Role
name: external-secrets-reader
apiGroup: rbac.authorization.k8s.io
`
```
## [Create a Tailscale egress service in the workload cluster](#create-a-tailscale-egress-service-in-the-workload-cluster)
In each workload cluster, create a Kubernetes `Service` that routes traffic to the source cluster's API server through Tailscale. This egress service gives ESO a stable in-cluster hostname to reach the remote API server.
```
`apiVersion: v1
kind: Service
metadata:
name: source-k8s-operator
annotations:
tailscale.com/tailnet-fqdn: source-k8s-operator.\<YOUR\_TAILNET\_NAME\>.ts.net
tailscale.com/proxy-group: \<YOUR\_PROXY\_GROUP\>
spec:
externalName: placeholder
type: ExternalName
ports:
- name: https
port: 443
protocol: TCP
`
```
Replace `\<YOUR\_TAILNET\_NAME\>` with your tailnet's [MagicDNS](/docs/features/magicdns) domain and `\<YOUR\_PROXY\_GROUP\>` with the name of your [proxy group](/docs/features/kubernetes-operator#proxy-group). The Tailscale Kubernetes Operator automatically provisions this service and routes traffic to the source cluster through the tailnet.
Apply this to your workload cluster in the namespace where the Tailscale operator manages egress services (typically `tailscale`):
```
`kubectl apply -f egress-service.yaml -n tailscale
`
```
The operator creates a backing `ClusterIP` service that pods in the workload cluster can use to reach the source cluster's API server. Pods anywhere in the cluster can resolve the MagicDNS hostname `source-k8s-operator.\<YOUR\_TAILNET\_NAME\>.ts.net` to this `ClusterIP` address.
## [Set up DNS resolution for MagicDNS](#set-up-dns-resolution-for-magicdns)
The `ClusterSecretStore` uses a [MagicDNS](/docs/features/magicdns) hostname (for example, `source-k8s-operator.\<YOUR\_TAILNET\_NAME\>.ts.net`) as the server URL. For ESO pods to resolve this hostname to the egress service's `ClusterIP`, you need to configure DNS resolution for `.ts.net` domains inside the cluster.
Create a `DNSConfig` resource in each workload cluster. This deploys a [Tailscale nameserver](/docs/reference/dns-in-tailscale#tailscale-dns-settings) that resolves `.ts.net` hostnames:
```
`apiVersion: tailscale.com/v1alpha1
kind: DNSConfig
metadata:
name: ts-dns
spec:
nameserver:
image:
tag: unstable
`
```
Apply this to your workload cluster:
```
`kubectl apply -f dns-config.yaml
`
```
Get the IP address of the Tailscale nameserver:
```
`kubectl get dnsconfig ts-dns -o jsonpath='{.status.nameserverStatus.ip}'
`
```
Make a note of the IP address returned (for example, `100.64.0.4` or `10.100.124.196`). Update your CoreDNS configuration to forward `.ts.net` queries to the Tailscale nameserver:
```
`kubectl edit configmap coredns -n kube-system
`
```
Add the following block to the `Corefile` section, replacing `\<TAILSCALE\_NAMESERVER\_IP\>` with the IP address you noted:
```
`ts.net:53 {
errors
cache 30
forward . \<TAILSCALE\_NAMESERVER\_IP\>
}
`
```
This step is required. Without it, ESO cannot resolve the `.ts.net` MagicDNS hostname in the `ClusterSecretStore` server URL, and the store will fail to connect.
## [Configure a ClusterSecretStore](#configure-a-clustersecretstore)
Create a `ClusterSecretStore` in each workload cluster that points to the source cluster through the Tailscale egress service. This tells ESO how to connect to the remote cluster and authenticate.
First, create a placeholder token secret. The Tailscale API server proxy handles authentication through impersonation (configured in the access control policies above), so the bearer token is not used directly. However, ESO's Kubernetes provider requires a token reference in the `ClusterSecretStore` spec:
```
`apiVersion: v1
kind: Secret
metadata:
name: tailscale-api-token
namespace: external-secrets
type: Opaque
stringData:
token: "unused"
`
```
The bearer token value is `"unused"` because authentication is handled entirely by Tailscale impersonation.
Then create the `ClusterSecretStore`:
```
`apiVersion: external-secrets.io/v1
kind: ClusterSecretStore
metadata:
name: kubernetes-source
spec:
provider:
kubernetes:
remoteNamespace: default
server:
url: https://source-k8s-operator.\<YOUR\_TAILNET\_NAME\>.ts.net
auth:
token:
bearerToken:
name: tailscale-api-token
namespace: external-secrets
key: token
`
```
The `server.url` uses the MagicDNS hostname, which resolves to the egress service's `ClusterIP` inside the workload cluster. The TLS certificate served by the Tailscale API server proxy is valid for this hostname, so no `caBundle` is needed. ESO falls back to system certificate authority (CA) roots when no CA is explicitly configured, and Let's Encrypt certificates (used by Tailscale) are included in the system trust store.
When a request arrives at the API server proxy, Tailscale identifies the source device, maps it to the impersonation groups defined in your access control policy, and forwards the request with those credentials. The ESO Kubernetes provider requires a `bearerToken` field, so a placeholder secret satisfies the schema.
Apply the `ClusterSecretStore`:
```
`kubectl apply -f cluster-secret-store.yaml
`
```
Verify the store is healthy:
```
`kubectl get clustersecretstore kubernetes-source
`
```
The `STATUS` column should show `Valid`, meaning ESO can successfully connect to the source cluster.
## [Create an ExternalSecret](#create-an-externalsecret)
With the `ClusterSecretStore` configured, you can now create `ExternalSecret` resources that pull specific secrets from the source cluster into the workload cluster. For example, to sync a TLS certificate:
```
`apiVersion: external-secrets.io/v1
kind: ExternalSecret
metadata:
name: \<YOUR\_SECRET\_NAME\>
namespace: \<YOUR\_NAMESPACE\>
spec:
refreshInterval: 1h
secretStoreRef:
kind: ClusterSecretStore
name: kubernetes-source
target:
name: \<YOUR\_SECRET\_NAME\>
creationPolicy: Owner
data:
- secretKey: ca.crt
remoteRef:
key: \<YOUR\_SOURCE\_SECRET\>
property: ca.crt
- secretKey: tls.crt
remoteRef:
key: \<YOUR\_SOURCE\_SECRET\>
property: tls.crt
- secretKey: tls.key
remoteRef:
key: \<YOUR\_SOURCE\_SECRET\>
property: tls.key
`
```
Apply the `ExternalSecret`:
```
`kubectl apply -f external-secret.yaml
`
```
Verify the secret was synced:
```
`kubectl get externalsecret \<YOUR\_SECRET\_NAME\> -n \<YOUR\_NAMESPACE\>
`
```
The `STATUS` column should show `SecretSynced`. ESO will re-fetch the secret from the source cluster at the `refreshInterval` you specified, keeping the workload cluster's copy up to date automatically.
## [Conclusion](#conclusion)
You've configured External Secrets Operator to sync secrets between Kubernetes clusters over Tailscale's private network. Secrets are fetched directly from the source cluster's API server through an encrypted mesh connection, with no intermediate storage or internet exposure.
This configuration provides several key benefits:
* **No secrets in Git**: Credentials are synced at runtime from the source of truth, not committed to repositories.
* **Automatic rotation**: ESO re-fetches secrets on a configurable interval, picking up rotations without manual intervention.
* **Private connectivity**: The source cluster's API server is never exposed to the internet. All traffic flows through Tailscale's encrypted network.
* **Fine-grained access**: Tailscale impersonation and Kubernetes RBAC work together to grant ESO exactly the permissions it needs and nothing more.
* **Scalable**: Adding a new workload cluster requires only a new egress service and `ClusterSecretStore`. No changes are needed on the source cluster.
For advanced configurations, explore [customizing the Tailscale Kubernetes Operator](/docs/features/kubernetes-operator/how-to/customize) or refer to the [External Secrets Operator documentation](https://external-secrets.io/) for additional providers and secret store types.
On this page
* [Prerequisites](#prerequisites)
* [Install the Tailscale Kubernetes Operator with API server proxy](#install-the-tailscale-kubernetes-operator-with-api-server-proxy)
* [Configure access control policies](#configure-access-control-policies)
* [Create RBAC for the impersonated group on the source cluster](#create-rbac-for-the-impersonated-group-on-the-source-cluster)
* [Create a Tailscale egress service in the workload cluster](#create-a-tailscale-egress-service-in-the-workload-cluster)
* [Set up DNS resolution for MagicDNS](#set-up-dns-resolution-for-magicdns)
* [Configure a ClusterSecretStore](#configure-a-clustersecretstore)
* [Create an ExternalSecret](#create-an-externalsecret)
* [Conclusion](#conclusion)
Scroll to top