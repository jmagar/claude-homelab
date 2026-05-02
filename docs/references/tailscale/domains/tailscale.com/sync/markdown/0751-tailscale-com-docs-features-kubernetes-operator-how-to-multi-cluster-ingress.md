Multi-cluster Ingress · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Multi-cluster Ingress
Last validated: Jan 5, 2026
Kubernetes Operator multi-cluster Ingress is currently [in alpha](/docs/reference/tailscale-release-stages#alpha). To try it, follow the steps below to enable it for your network using Tailscale v1.84 or later.
The following example shows the process for exposing an application, deployed across two different clusters, to your tailnet. A single MagicDNS name routes each Tailscale client to their closest cluster.
* A [`ProxyGroup`](/docs/features/kubernetes-operator#optional-pre-creating-a-proxygroup) in each cluster will manage a set of highly available proxies.
* A Tailscale `Ingress` in each cluster will configure proxies to route tailnet traffic to the in-cluster app instance.
* A single Tailscale Service ensures that tailnet traffic for the app is routed to a proxy in the closest cluster.
This tutorial covers exposing multi-cluster applications using Tailscale's application layer ingress via `Ingress` resource.
You can use the same approach to expose multi-cluster applications using Tailscale's network layer ingress via `Service` resource.
## [Setup](#setup)
1. Ensure you have two clusters available, preferably in different geographical regions, so you can test clients in different regions being routed to the closest cluster.
2. Update [`tagOwners`](/docs/reference/syntax/policy-file#tag-owners) in your tailnet policy file to let the Kubernetes Operator to create `ProxyGroup` proxies with the tag `tag:ingress-proxies` and Tailscale Services with the tag `tag:internal-apps`:
```
` "tagOwners": {
"tag:k8s-operator": [],
"tag:internal-apps": ["tag:k8s-operator"],
"tag:ingress-proxies": ["tag:k8s-operator"],
...
},
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
3. Update [`autoApprovers`](/docs/reference/syntax/policy-file#autoapprovers) in your tailnet policy file to let the `ProxyGroup` proxies to advertise Tailscale Services with the tag `tag:internal-apps`:
```
` "autoApprovers": {
"services": {
"tag:ingress-proxies": ["tag:internal-apps"],
},
}
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
4. Update [grants](/docs/reference/syntax/policy-file#grants) to allow tailnet clients access to the cluster apps you want to expose.
There will be a Tailscale Service created for each app. The Service's ACL tag can be used to grant permissions to access the app.
For example, to grant the Tailscale user group `group:engineering` access to apps tagged with `tag:internal-apps`:
```
` "grants": [
{
"src": ["group:engineering"],
"dst": ["tag:internal-apps:80","tag:internal-apps:443"],
"ip": ["tcp:80","tcp:443"],
},
{
"src": ["group:engineering"],
"ip": ["icmp:22"],
"dst": ["tag:ingress-proxies"],
},
...
]
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
The requirement to grant access to the devices to access a Tailscale Service is a temporary limitation.
5. Ensure your [client accepts routes](/docs/features/subnet-routers#use-your-subnet-routes-from-other-devices). Clients other than Linux accept routes by default.
6. Ensure your tailnet has [regional routing](/docs/how-to/set-up-high-availability#regional-routing) enabled.
## [In each cluster](#in-each-cluster)
1. [Create OAuth client credentials](/docs/features/kubernetes-operator#setting-up-the-kubernetes-operator) for the Kubernetes Operator with write scopes for `Services`, `Devices Core`, and `Auth Keys`.
2. Add `https://pkgs.tailscale.com/helmcharts` to your local Helm repositories:
```
`helm repo add tailscale https://pkgs.tailscale.com/helmcharts
`
```
3. Update your local Helm cache:
```
`helm repo update
`
```
4. Install the operator:
```
`helm upgrade --install operator tailscale/tailscale-operator \\
-n tailscale --create-namespace \\
--set oauth.clientId=\<id\> \\
--set oauth.clientSecret=\<key\> \\
--wait
`
```
5. Apply the following `ProxyGroup` and [`ProxyClass`](/docs/features/kubernetes-operator/how-to/customize#cluster-resource-customization-using-proxyclass) resources to create a set of Tailscale devices that will act as proxies:
While initially deploying `Ingress` resources, we highly recommend you use Let's Encrypt's [staging environment](https://letsencrypt.org/docs/staging-environment/) to avoid production's tighter rate limits.
The following example uses Let's Encrypt's staging environment, but you can unset `useLetsEncryptStagingEnvironment` once you are ready to provision production HTTPS certificates.
```
`apiVersion: tailscale.com/v1alpha1
kind: ProxyGroup
metadata:
name: ingress-proxies
spec:
type: ingress
hostnamePrefix: eu-west
replicas: 2
tags: ["tag:ingress-proxies"]
proxyClass: letsencrypt-staging
---
apiVersion: tailscale.com/v1alpha1
kind: ProxyClass
metadata:
name: letsencrypt-staging
spec:
useLetsEncryptStagingEnvironment: true
`
```
6. (Optional) Wait for the ProxyGroup to become ready:
```
`kubectl wait proxygroup ingress-proxies --for=condition=ProxyGroupReady=true
`
```
For the above `ProxyGroup` the operator creates a `StatefulSet` with two replicas.
Each replica `Pod` runs a Tailscale device with a [tag](/docs/features/tags) `tag:ingress-proxies` and hostname with prefix `eu-west-`
7. (Optional) if you don't have an existing workload to route traffic to, deploy `nginx` as a sample application:
```
`apiVersion: v1
kind: Pod
metadata:
labels:
run: nginx
name: nginx
spec:
containers:
- name: nginx
image: nginx
---
apiVersion: v1
kind: Service
metadata:
labels:
run: nginx
name: nginx
spec:
ports:
- port: 80
protocol: TCP
targetPort: 80
selector:
run: nginx
`
```
8. Apply the following `Ingress` resource to expose nginx with the DNS name `nginx.\<your-tailnet-domain\>`:
```
`apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
name: nginx
annotations:
tailscale.com/proxy-group: ingress-proxies
tailscale.com/tags: "tag:internal-apps"
spec:
tls:
- hosts:
- nginx
rules:
- http:
paths:
- backend:
service:
name: nginx
port:
number: 80
pathType: Prefix
path: /
ingressClassName: tailscale
`
```
9. (Optional) Wait for the HTTPS endpoints to be ready:
```
`kubectl wait --timeout=80s ingress nginx --for=jsonpath='{.status.loadBalancer.ingress[0].ports[0].port}'=443
`
```
For the above `Ingress` resource, the Kubernetes Operator ensures that a Tailscale Service named `svc:nginx` exists for the tailnet and that proxies route tailnet traffic for the Tailscale Service to the Kubernetes `Service` `nginx`.
The Tailscale Service's name is determined from `ingress.spec.tls[0].hosts[0]` field.
The Tailscale Service will be created if it does not already exist. `Ingress` resources in multiple clusters can define backends for a single Tailscale Service by using the same `ingress.spec.tls[0].hosts[0]` field.
10. Repeat the steps from this section for your second cluster (optionally changing `proxyGroup.spec.hostnamePrefix` field value).
You can expose any number of `Ingress` resources on the same `ProxyGroup` (limited by resource consumption).
You can not create multiple `Ingress` resources for the same Tailscale Service in the same cluster.
## [Test](#test)
1. Check the MagicDNS name for the created Ingress:
```
`kubectl get ingress
NAME CLASS HOSTS ADDRESS PORTS AGE
nginx tailscale \* nginx.tailxyz.ts.net 443 3h18m
`
```
2. Test that traffic flows for the MagicDNS name:
```
`curl -ksS https://nginx.tailxyz.ts.net
\<!DOCTYPE html\>
\<html\>
\<head\>
\<title\>Welcome to nginx!\</title\>
...
`
```
## [(Optional) Cluster-specific DNS names](#optional-cluster-specific-dns-names)
When using a single DNS name for `Ingress` resources deployed across multiple clusters, clients will automatically route to their closest cluster.
If you want to also create cluster-specific DNS names, you can deploy additional `Ingress` resources that are specific to each cluster.
Apply a cluster-specific `Ingress` such as:
```
`apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
name: nginx-eu
annotations:
tailscale.com/proxy-group: ingress-proxies
tailscale.com/tags: "tag:internal-apps"
spec:
tls:
- hosts:
- nginx-eu
rules:
- http:
paths:
- backend:
service:
name: nginx
port:
number: 80
pathType: Prefix
path: /
ingressClassName: tailscale
`
```
## [TLS certificates](#tls-certificates)
The cluster app behind the `Ingress` is exposed to tailnet over HTTPS with a MagicDNS name constructed using the value of `ingress.spec.tls[0].hosts[0]` field and the tailnet domain.
A single TLS certificate is issued for the `Ingress` and shared amongst the `ProxyGroup` replicas.
TLS certificates are issued from Let's Encrypt's production environment by default.
Let's Encrypt imposes [rate limits](https://letsencrypt.org/docs/rate-limits/) to certificate issuance.
Tailscale's `ts.net` domain is in [public suffix list](https://publicsuffix.org/).
This means that Let's Encrypt considers a tailnet's top level domain (for example, `tailxyz.ts.net`) a registered domain and rate limits are applied to each tailnet individually.
For example:
* [50 certificates per week per domain](https://letsencrypt.org/docs/rate-limits/#certificates-per-registered-domain). This means no more than 50 unique Ingresses per week per tailnet.
Note that any other certs issued for tailnet devices also count toward this limit.
* [5 certificates for the same hostname per week](https://letsencrypt.org/docs/rate-limits/#duplicate-certificate-limit).
This means that the number of clusters that can expose the same app with the same DNS name is limited to 5 per week.
We highly recommend testing using Let's Encrypt's staging environment to avoid tighter rate limits until you are ready to deploy to production.
### [Using Let's Encrypt's staging environment](#using-lets-encrypts-staging-environment)
You can use the staging environment with a `ProxyGroup` and `ProxyClass` such as the following:
```
`apiVersion: tailscale.com/v1alpha1
kind: ProxyGroup
metadata:
name: ingress-proxies
spec:
type: ingress
replicas: 2
tags: ["tag:ingress-proxies"]
proxyClass: letsencrypt-staging
---
apiVersion: tailscale.com/v1alpha1
kind: ProxyClass
metadata:
name: letsencrypt-staging
spec:
useLetsEncryptStagingEnvironment: true
`
```
For the above configuration, the operator will create a `ProxyGroup` that always uses Let's Encrypt's staging endpoint to issue certificates for any Tailscale `Ingress` DNS names.
### [Advertising an HTTP endpoint](#advertising-an-http-endpoint)
You can optionally enable an HTTP endpoint on port 80 in addition to the HTTPS endpoint on port 443.
This may be helpful if you want the `Ingress` to still be available when an HTTPS certificate cannot be issued due to rate limits or other failure cases.
To enable an HTTP endpoint, add a `tailscale.com/http-endpoint: enabled` annotation to your `Ingress`.
Note that:
* If an `Ingress` does not have an HTTP endpoint enabled, the proxies that advertise this `Ingress` will only be considered healthy once the certificate issuance has succeeded.
For example, if you have `Ingress` resources that expose app `nginx` with DNS name `nginx.tailxyx.ts.net` in clusters `us-east`, `us-west` and `eu-west` and certificate issuance only
succeeds in `us-west` and `eu-west`, tailnet traffic for `nginx.tailxyz.ts.net` will never be routed to `us-east`.
The proxies in `us-east` will retry issuance and once it succeeds, they will be considered healthy and tailnet traffic will start getting routed to `us-east`.
* If an `Ingress` does have an HTTP endpoint enabled, the proxies that advertise this `Ingress` will be considered healthy, even if certificate issuance has failed.
So, if you have `Ingress` resources that expose app `nginx` in clusters in `us-east`, `us-west` and `eu-west`, and certificate issuance only
succeeds in `us-west` and `eu-west`, tailnet traffic will still be routed to all three clusters, but only the HTTP endpoint is guaranteed to be healthy.
The proxies in `us-east` will retry issuance and once it succeeds, all clients will be able to reach the app by using HTTPS in any cluster.
## [Debugging](#debugging)
### [Debugging `Ingress` resource failure](#debugging-ingress-resource-failure)
1. Take a look at [operator's logs](/docs/reference/troubleshooting/containers/kubernetes-operator#operator-logs).
2. Take a look at the proxies:
For a `ProxyGroup` named `ingress-proxies`:
```
`kubectl get pod -n tailscale -l tailscale.com/parent-resource="ingress-proxies",tailscale.com/parent-resource-type="proxygroup"
NAME READY STATUS RESTARTS AGE
ingress-proxies-0 1/1 Running 0 2d22h
ingress-proxies-1 1/1 Running 0 2d22h
`
```
```
`kubectl logs ingress-proxies-0 -n tailscale -c tailscale
boot: 2025/03/28 14:20:43 Starting tailscaled
...
`
```
### [Validate to which cluster a tailnet client's requests are routed](#validate-to-which-cluster-a-tailnet-clients-requests-are-routed)
1. Find the MagicDNS name by which Ingress is exposed to tailnet.
This will be the DNS name of the corresponding Tailscale Service.
```
`kubectl get ingress
NAME CLASS HOSTS ADDRESS PORTS AGE
nginx tailscale \* nginx.tailxyz.ts.net 443 3h18m
`
```
2. Find the tailnet IP address of the Tailscale Service:
```
`dig nginx.tailxyz.ts.net +short
100.100.126.127
`
```
If the Tailscale Service's IP address can not be resolved, its creation might have failed. Check the operator's logs.
3. Find which proxy the tailnet client uses as a backend for the Tailscale Service.
Each tailnet client's requests for a Tailscale Service will be routed to a proxy in the closest cluster.
You can run the following commands on a client to find which proxy it uses as a backend for a Tailscale Service:
```
`tailscale status --json | jq '.Peer | to\_entries[] | select(.value.AllowedIPs[] | contains("100.100.126.127/32")) | .value |
{DNSName, ID}'
{
"DNSName": "ingress-proxies-eu-0.tailxyz.ts.net.",
"ID": "n9Ch5VvNug11CNTRL"
}
`
```
The first part of DNS name is either `proxyGroup.spec.hostnamePrefix` or the `ProxyGroup` name - you can use that to identify which cluster the tailnet client's traffic will be routed to.
If `tailscale status --json` does not contain any results for the given tailnet IP address then the client likely does not have permissions to access the Tailscale Service.
## [Best practices](#best-practices)
* Use Let's Encrypt's staging environment for initial testing.
* Set a different `proxygroup.spec.hostnamePrefix` field values for `ProxyGroup` resources in different clusters (or simply name the `ProxyGroup` resources differently).
This will ensure that proxies in different clusters can be easily identified by the Tailscale hostname.
## [Current limitations](#current-limitations)
* Exposing a new `Ingress` resource takes up to a minute to become available. We are working to make this faster.
* The current access model requires explicitly defining access for each app in ACLs.
We are working on allowing tag based access.
* When exposing `Ingress` resources with the same DNS name concurrently, you may hit transient failures due to DNS challenge errors.
We are working on fixing this.
* Currently Let's Encrypt's staging endpoint can only be enabled for the `ProxyGroup` as a whole and not for individual `Ingress` resources.
* Currently you must ensure that multi-cluster `Ingress` resources for the same app all have the same tag and all either expose an HTTP endpoint or not.
Applying `Ingress` resources for the same app, but with different tags or different HTTP endpoint settings, might result in the operator instances in the different clusters continuously attempting to reconcile the Tailscale Service.
On this page
* [Setup](#setup)
* [In each cluster](#in-each-cluster)
* [Test](#test)
* [(Optional) Cluster-specific DNS names](#optional-cluster-specific-dns-names)
* [TLS certificates](#tls-certificates)
* [Using Let's Encrypt's staging environment](#using-lets-encrypts-staging-environment)
* [Advertising an HTTP endpoint](#advertising-an-http-endpoint)
* [Debugging](#debugging)
* [Debugging Ingress resource failure](#debugging-ingress-resource-failure)
* [Validate to which cluster a tailnet client's requests are routed](#validate-to-which-cluster-a-tailnet-clients-requests-are-routed)
* [Best practices](#best-practices)
* [Current limitations](#current-limitations)
Scroll to top