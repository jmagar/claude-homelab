Mesh your Kubernetes cluster to the rest of your network with the Tailscale Kubernetes operator · Tailscale
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|October 31, 2023
# Mesh your Kubernetes cluster to the rest of your network with the Tailscale Kubernetes operator
Tailscale is a programmable network that lets you manage connections between your resources in a declarative way using [ACLs](/kb/1018/acls/), so you can define specifically which users should be able to connect to which services in your environment. Although Tailscale isn’t a service mesh per se, you can use it to connect Kubernetes services to each other. Tailscale is infrastructure agnostic — it allows you to connect your resources together no matter where they’re running, whether that’s in the cloud or on prem, in VMs or containers, at home or at work.
**Today, we’re releasing the **[**Tailscale Kubernetes operator**](/kubernetes-operator/)** to beta**. This allows you to more easily deploy Tailscale to your Kubernetes network in order to expose services in your cluster to your tailnet and egress from a cluster to a service on your tailnet, as well as to access the kube-apiserver securely.
### Meshes aren’t just for containers
Service meshes are typically used to instrument, secure and route traffic between services running inside a Kubernetes cluster. As the name implies, they operate in a distributed mesh to avoid introducing a single point of failure in the system.
Tailscale is also a mesh network, and as such shares a lot of similarities with service meshes. Tailscale provides security and networking between your users and services — these don’t have to be containerized services — they can be running in different clouds or datacenters, or be end user devices like iPhones. Connections are peer to peer, and your traffic flows are [monitored](/kb/1219/network-flow-logs/) and [end-to-end encrypted](/security/).
At the core Tailscale and service meshes solve different problems using similar technologies, but can also interoperate to allow you to move your mesh beyond just containers to any workload, and also [lets your dev team connect to those workloads](https://www.youtube.com/watch?v=yvbNdZxonSs).
### Connect Kubernetes services to the rest of your network
You can use Tailscale to connect your containerized workloads to other workloads in your environment — even if they’re not running in the same Kubernetes cluster.
You can use the Tailscale Kubernetes operator to [expose a service running on your Kubernetes cluster to your tailnet](/kb/1236/kubernetes-operator/) — that is, to non containerized workloads. For example, you might want to allow an on prem service to access a service running in a cluster in one of the public clouds, enable an engineer to access a CI/CD pipeline running in a cluster, or just expose an internal-only service running in a cluster to your employees. This can be done in a few ways: applying annotations on an existing Kubernetes service, making the service a `LoadBalancer` type with the `tailscale` `loadBalancerClass`, or creating a Kubernetes ingress resource fronting a service. When configured using an ingress resource, you also get the ability to identify callers using [HTTP headers](/kb/1247/funnel-serve-use-cases/) injected by the ingress proxy.
With the Kubernetes operator, to expose a Kubernetes service to your tailnet using `loadBalancerClass`, edit the service and make it a load balancer:
1. Set `spec.type` to `LoadBalancer`.
2. Set `spec.loadBalancerClass` to `tailscale`.
This will deploy the service as a `loadBalancerClass` in your cluster, and make it available to your tailnet. You can manage which services on your tailnet can access it by modifying [ACLs](/kb/1018/acls/).
You can also use the Tailscale Kubernetes operator for the inverse — to [egress traffic from your Kubernetes cluster to a service you have running elsewhere](/kb/1236/kubernetes-operator/), such as a database or image registry. This is similarly done by deploying a Tailscale proxy in the cluster which directs incoming traffic to the specified tailnet IP address. This exposes the specified IP address as just another Service inside your cluster.
With the Kubernetes operator, to advertise a service external to your cluster, create a Kubernetes Service of type `ExternalName` annotated with the Tailscale IP address of the service you want to make available:
```
`apiVersion: v1
kind: Service
metadata:
annotations:
tailscale.com/tailnet-ip: 100.68.29.93 // Tailscale IP address or subnet
name: nginx // service name
spec:
externalName: unused // any value - will be overwritten by operator
type: ExternalName
`
```
Then, wait for the Tailscale Kubernetes operator to deploy the proxy in the tailscale namespace, and to update the `spec.externalName` of the Kubernetes Service. It will get set to the DNS name of the egress proxy that Tailscale operator creates.
With the ingress and egress proxy building blocks, you are also able to expose services running in one cluster to another cluster — you can even peer across clouds or hosted Kubernetes providers. For each pair of services, you will need to set up cluster ingress and egress as described above.
### Securely connect to the Kubernetes control plane
You can also use the Tailscale Kubernetes operator to expose and access the Kubernetes control plane (kube-apiserver) over Tailscale. Giving your DevOps team secure, direct access to a cluster’s control plane is not always straightforward —especially if you’re hosting the cluster yourself, and not using a managed Kubernetes provider. Tailscale is particularly useful for exposing the kube-apiserver without having to expose it to the internet, as it allows direct connections to infrastructure, [even behind firewalls and NATs](/blog/how-nat-traversal-works/).
With the Kubernetes operator, you can use the API server proxy with or without [impersonation](https://kubernetes.io/docs/reference/access-authn-authz/authentication/#user-impersonation) headers. If you’re self-hosting a cluster, this provides you a way to add authentication to your requests, and users will hit the kube-apiserver with the same user identity they have in Tailscale. If you’re using a managed cluster, or already have a way to authenticate users to your cluster’s control plane, then you can just use Tailscale to help with connectivity, and not also authentication.
To get started, deploy the Tailscale Kubernetes operator [using a Helm chart](/kb/1236/kubernetes-operator/) or by using a manifest file. We’re working on hosting this Helm chart for easy access. Make sure to generate an OAuth client with the `Devices` scopes, and store the client ID and secret securely.
The Tailscale Kubernetes operator makes it easier to get started with Tailscale in Kubernetes, and means less overhead in setup — the operator will spin up and take down proxies as your team exposes services, so you don’t have to manually clean them up. If you prefer to set up Tailscale manually, though, you can also [use Tailscale to enable access to Kubernetes resources](/kb/1185/kubernetes/) by deploying Tailscale as a sidecar, proxy, or subnet router.
To learn more about the Tailscale Kubernetes operator and set it up, see the [documentation](/kb/1236/kubernetes-operator/).
Share
Authors
Irbe Krumina
Maisem Ali
Rhea Ghosh
David Crawshaw
Authors
Irbe Krumina
Maisem Ali
Rhea Ghosh
David Crawshaw
Share
Loading...
## Try Tailscale for free
[
Get started
](https://login.tailscale.com/start)
Schedule a demo
[
Contact sales
](/contact/sales)