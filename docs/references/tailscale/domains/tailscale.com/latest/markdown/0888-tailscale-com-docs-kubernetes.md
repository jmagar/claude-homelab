Tailscale on Kubernetes · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Tailscale on Kubernetes
Last validated: Jan 5, 2026
Kubernetes is a popular method for deploying, scaling, and managing containerized applications. There are many ways you can use Tailscale with Kubernetes. Examples include for ingress to Kubernetes services, egress to a tailnet, and secure access to the cluster control plane (kube-apiserver). You can run Tailscale inside a Kubernetes Cluster using the [Tailscale Kubernetes Operator](#use-the-kubernetes-operator), or as a sidecar, as a proxy, or as a subnet router. This doc shows several common ways.
Tailscale is available as a [Docker image](/docs/features/containers/docker).
## [Prerequisites](#prerequisites)
You can follow the examples in this doc by cloning from GitHub. For example:
```
`gh repo clone tailscale/tailscale
cd tailscale/docs/k8s
`
```
## [Setup](#setup)
1. (Optional) You can choose to use an [auth key](/docs/features/access-control/auth-keys) to automate your container logging in
to your tailnet. Create an auth key in the [Keys](https://login.tailscale.com/admin/settings/keys) page of the admin console.
We recommend using an [ephemeral key](/docs/features/ephemeral-nodes) for this purpose, since it will
automatically clean up devices after they shut down. We also recommend using a
[reusable key](/docs/features/access-control/auth-keys#types-of-auth-keys) so when containers are stopped and started they can still connect to
your tailnet.
The **Pre-approved** option will only display in the dialog if [device approval](/docs/features/access-control/device-management/device-approval) is enabled in your Tailscale network.
If you don't provide the key, you can still authenticate by logging in at the URL provided in logs when using the container image below.
```
`apiVersion: v1
kind: Secret
metadata:
name: tailscale-auth
stringData:
TS\_AUTHKEY: tskey-0123456789abcdef
`
```
1. Tailscale (v1.16 or later) supports storing state inside a
[Kubernetes Secret](https://kubernetes.io/docs/concepts/configuration/secret).
Configure role-based access control (RBAC) to allow the Tailscale pod to read/write the `tailscale` secret.
```
`export SA\_NAME=tailscale
export TS\_KUBE\_SECRET=tailscale-auth
make rbac | kubectl apply -f-
`
```
## [Use the Kubernetes operator](#use-the-kubernetes-operator)
Tailscale also provides the [Tailscale Kubernetes Operator](/docs/features/kubernetes-operator). The Kubernetes operator lets you:
* Expose [services](https://kubernetes.io/docs/concepts/services-networking/service) in your Kubernetes cluster to your Tailscale network (known as a tailnet).
* Securely connect to the [Kubernetes control plane (kube-apiserver)](https://kubernetes.io/docs/concepts/overview/components/#kube-apiserver) by using an API server proxy, with or without authentication.
* Egress from a Kubernetes cluster to an external service in your tailnet.
## [Sample sidecar](#sample-sidecar)
Running as a sidecar lets you directly expose a Kubernetes pod over Tailscale. This is particularly useful if you do not wish to expose a service on the public internet. This method enables bi-directional connectivity between the pod and other devices in the tailnet. You can use [access control policies](/docs/features/access-control) to control traffic flow.
1. Create and login to the sample nginx pod with a Tailscale sidecar:
```
`make sidecar | kubectl apply -f-
# If not using an auth key, authenticate by grabbing the Login URL here:
kubectl logs nginx ts-sidecar
`
```
2. Check if you can connect to nginx over Tailscale:
```
`curl http://nginx
`
```
Or, if you have [MagicDNS](/docs/features/magicdns) disabled:
```
`curl "http://$(tailscale ip -4 nginx)"
`
```
## [Userspace sidecar](#userspace-sidecar)
You can also run the sidecar in [userspace networking mode](/docs/concepts/userspace-networking). The obvious benefit is reducing the amount of permissions Tailscale needs to run. The downside is that for outbound connectivity from the pod to the tailnet you would need to use either the [SOCKS5 proxy or HTTP proxy](/docs/concepts/userspace-networking#socks5-vs-http).
1. Create and login to the sample nginx pod with a Tailscale sidecar:
```
`make userspace-sidecar | kubectl apply -f-
# If not using an auth key, authenticate by grabbing the Login URL here:
kubectl logs nginx ts-sidecar
`
```
2. Check if you can connect to nginx over Tailscale:
```
`curl http://nginx
`
```
Or, if you have [MagicDNS](/docs/features/magicdns) disabled:
```
`curl "http://$(tailscale ip -4 nginx)"
`
```
## [Sample proxy](#sample-proxy)
Running a Tailscale proxy lets you provide inbound connectivity to a Kubernetes Service.
Visit the [Kubernetes operator ingress](/docs/features/kubernetes-operator/how-to/cluster-ingress) page for details on deploying an ingress proxy using the operator instead.
1. Provide the `ClusterIP` of the service you want to reach by either:
**Creating a new deployment**
```
`kubectl create deployment nginx --image nginx
kubectl expose deployment nginx --port 80
export TS\_DEST\_IP="$(kubectl get svc nginx -o=jsonpath='{.spec.clusterIP}')"
`
```
**Using an existing service**
```
`export TS\_DEST\_IP="$(kubectl get svc \<SVC\_NAME\> -o=jsonpath='{.spec.clusterIP}')"
`
```
2. Deploy the proxy pod:
```
`make proxy | kubectl apply -f-
# If not using an auth key, authenticate by grabbing the Login URL here:
kubectl logs proxy
`
```
3. Check if you can connect to nginx over Tailscale:
```
`curl http://proxy
`
```
Or, if you have [MagicDNS](/docs/features/magicdns) disabled:
```
`curl "http://$(tailscale ip -4 proxy)"
`
```
## [Subnet router](#subnet-router)
Running a Tailscale [subnet router](/docs/features/subnet-routers) lets you access the entire Kubernetes cluster network (assuming NetworkPolicies allow) over Tailscale.
Visit the [Kubernetes operator subnet routers](/docs/features/kubernetes-operator/how-to/connector) page for details on deploying a subnet router using the operator instead.
1. Identify the Pod/Service CIDRs that cover your Kubernetes cluster. These will vary depending on [which CNI](https://kubernetes.io/docs/concepts/cluster-administration/networking) you are using and on the Cloud Provider you are using. Add these to the `TS\_ROUTES` variable as comma-separated values.
```
`SERVICE\_CIDR=10.20.0.0/16
POD\_CIDR=10.42.0.0/15
export TS\_ROUTES=$SERVICE\_CIDR,$POD\_CIDR
`
```
2. Deploy the subnet-router pod.
```
`make subnet-router | kubectl apply -f-
# If not using an auth key, authenticate by grabbing the Login URL here:
kubectl logs subnet-router
`
```
3. In the [Machines](https://login.tailscale.com/admin/machines) page of the admin console, ensure that the routes for the subnet-router are enabled.
4. Make sure that any client you want to connect from has `--accept-routes` enabled.
5. Check if you can connect to a `ClusterIP` or a `PodIP` over Tailscale:
```
`# Get the Service IP
INTERNAL\_IP="$(kubectl get svc \<SVC\_NAME\> -o=jsonpath='{.spec.clusterIP}')"
# or, the Pod IP
# INTERNAL\_IP="$(kubectl get po \<POD\_NAME\> -o=jsonpath='{.status.podIP}')"
INTERNAL\_PORT=8080
curl http://$INTERNAL\_IP:$INTERNAL\_PORT
`
```
## [(Optional) Add DNS information](#optional-add-dns-information)
By default, we do not set DNS for containers. To enable [MagicDNS](/docs/features/magicdns) for a Kubernetes container, you will need to export `TS\_ACCEPT\_DNS=true` in the environment.
## [Remove ephemeral nodes from a tailnet](#remove-ephemeral-nodes-from-a-tailnet)
When an ephemeral node goes offline, it is automatically removed from your tailnet. You can also control ephemeral node removal using the [`tailscale logout`](/docs/reference/tailscale-cli#logout) command to either manually force the removal or incorporate the command into the [`tailscaled`](/docs/reference/tailscaled) Tailscale daemon. For more information, refer to [Ephemeral nodes](/docs/features/ephemeral-nodes#faq).
On this page
* [Prerequisites](#prerequisites)
* [Setup](#setup)
* [Use the Kubernetes operator](#use-the-kubernetes-operator)
* [Sample sidecar](#sample-sidecar)
* [Userspace sidecar](#userspace-sidecar)
* [Sample proxy](#sample-proxy)
* [Subnet router](#subnet-router)
* [(Optional) Add DNS information](#optional-add-dns-information)
* [Remove ephemeral nodes from a tailnet](#remove-ephemeral-nodes-from-a-tailnet)
Scroll to top