Expose a cloud service to your tailnet · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Expose a cloud service to your tailnet
Last validated: Jan 5, 2026
Exposing cloud services to your tailnet is currently [in beta](/docs/reference/tailscale-release-stages#beta).
You can use the Tailscale Kubernetes Operator to expose any cloud service, such as an RDS database on a cluster network, to your tailnet. If you have a cloud service that is not publicly accessible but is accessible to a Kubernetes cluster on that cloud, you can make it available to your tailnet using an operator deployed in the cluster.
## [Prerequisites](#prerequisites)
* [Set up the Kubernetes Operator](/docs/features/kubernetes-operator#setup).
## [Expose a cloud service using a Kubernetes `ExternalName` `Service`](#expose-a-cloud-service-using-a-kubernetes-externalname-service)
If the cloud service that you wish to expose has a DNS name that can be resolved from within the cluster, you can expose it using an [ExternalName Service](https://kubernetes.io/docs/concepts/services-networking/service/#externalname).
For example, to expose an RDS database and connect to it from a tailnet client:
1. Deploy Tailscale Kubernetes Operator to a Kubernetes cluster that is on the same network as the RDS instance.
Follow the [installation instructions](/docs/features/kubernetes-operator#setup) to deploy the operator.
2. Create an `ExternalName` `Service` with `tailscale.com/expose: "true"` annotation and `spec.externalName` set to the DNS name of the RDS instance:
```
`apiVersion: v1
kind: Service
metadata:
name: my-rds
annotations:
tailscale.com/expose: "true"
spec:
type: ExternalName
externalName: my-rds.eu-central-1.rds.amazonaws.com
`
```
3. Retrieve the Tailscale MagicDNS name of the cluster proxy that the operator creates for the `Service` using the [`view-secret kubectl` plugin](https://github.com/elsesiy/kubectl-view-secret):
```
`rds\_magic\_dns\_name=$(kubectl view-secret \\
$(kubectl get secret -n tailscale \\
--selector tailscale.com/parent-resource=my-rds,tailscale.com/parent-resource-ns=default,tailscale.com/parent-resource-type=svc \\
-ojsonpath='{.items[0].metadata.name}') \\
-n tailscale \\
device\_fqdn)
`
```
4. You can now connect to the RDS instance from a tailnet client using the MagicDNS name of the proxy as the database hostname.
For example, for a PostgreSQL database:
```
`psql -h ${rds\_magic\_dns\_name} -U postgres
`
```
The cluster proxies created for `ExternalName` `Service`s forward TCP traffic, so you should be able to use them with different backend protocols, such as PostgreSQL.
The Tailscale Kubernetes Operator periodically (every 10 minutes) attempts to resolve the IP addresses of the backend cloud service and reconfigures the proxy rules, if needed.
For proxies deployed with [firewall in nftables mode](/docs/features/firewall-mode), the traffic will only be proxied to the first IP address that the DNS name resolves to.
`ExternalName` `Service`s support the same `tailscale.com` labels and annotations as other `Service`s.
We are actively seeking feedback about this feature — [reach out](https://github.com/tailscale/tailscale/issues/new/choose) if you would like it to support additional workflows.
## [Expose a cloud service or services using `Connector`](#expose-a-cloud-service-or-services-using-connector)
If the cloud service that you intend to expose does not have a DNS name that can be resolved from within a cluster, or you want to expose a whole CIDR range, you can do so using [Connector](/docs/features/kubernetes-operator/how-to/connector):
```
`apiVersion: tailscale.com/v1alpha1
kind: Connector
metadata:
name: my-rds-instances
spec:
subnetRouter:
advertiseRoutes:
- "\<rds-cidr-range\>"
`
```
The above `Connector` instance configures the operator to deploy an in-cluster [subnet router](/docs/features/subnet-routers) that exposes the configured CIDR range to your tailnet.
## [Customization](#customization)
[Customize the operator and resources it manages](/docs/features/kubernetes-operator/how-to/customize).
## [Troubleshooting](#troubleshooting)
[Troubleshoot the operator and resources it manages](/docs/reference/troubleshooting/containers/kubernetes-operator).
On this page
* [Prerequisites](#prerequisites)
* [Expose a cloud service using a Kubernetes ExternalName Service](#expose-a-cloud-service-using-a-kubernetes-externalname-service)
* [Expose a cloud service or services using Connector](#expose-a-cloud-service-or-services-using-connector)
* [Customization](#customization)
* [Troubleshooting](#troubleshooting)
Scroll to top