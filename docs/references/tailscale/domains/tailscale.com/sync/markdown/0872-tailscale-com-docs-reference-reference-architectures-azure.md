Azure reference architecture · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Azure reference architecture
Last validated: Jan 5, 2026
This document details best practices and a reference architecture for Tailscale deployments on Microsoft Azure. The following guidance applies for all Tailscale modes of operation—such as devices, exit nodes, and subnet routers.
**Tailscale device**—for the purposes of this document Tailscale device can refer to a Tailscale node, exit node, subnet router, and the like. Refer to [Terminology and concepts](/docs/reference/glossary) for additional terms.
## [High-level architecture](#high-level-architecture)
## [Ways to deploy Tailscale to connect to and from Azure resources](#ways-to-deploy-tailscale-to-connect-to-and-from-azure-resources)
Tailscale provides a few options for connecting to resources within Azure. At a high-level they are:
* **[Agent-to-Agent connectivity](#agent-to-agent-connectivity)**—connect to "static" resources such as virtual machines (VMs). This is recommended where you can install and run Tailscale directly on the resource you wish to connect to.
* **[IP-based connectivity with a Tailscale subnet router](#ip-based-connectivity-with-subnet-router)**—connect to managed Azure resources (such as Azure SQL or Azure Cosmos DB). This is recommended where you cannot run Tailscale on the resource you are connecting to, or want to expose an existing [subnet](/docs/features/subnet-routers) or services in a virtual network to your tailnet.
* **[DNS-based routing with a Tailscale app connector](#dns-based-routing-with-an-app-connector)**—connect to software as a service (SaaS) applications or other resources over your tailnet with DNS-based routing.
* **[Kubernetes services and auth proxy with the Tailscale Kubernetes Operator](#kubernetes-services-and-api-server-proxy-with-tailscale-kubernetes-operator)**—expose services in your Azure Kubernetes Service (AKS) cluster and your AKS cluster control plane directly to your Tailscale network. This is recommended where you are connecting to resources running in a Kubernetes cluster, or to a Kubernetes cluster's control plane.
* **[Azure Functions, Azure App Service, and other container solutions](#azure-functions-azure-app-service-and-other-container-solutions)**—access resources in your tailnet from Azure Functions, Azure App Service, and other container solutions.
### [Agent-to-Agent connectivity](#agent-to-agent-connectivity)
We recommend [installing the Tailscale agent](/docs/install) wherever possible—for example, [setting up servers](/docs/how-to/set-up-servers) on Azure VMs. This generally provides the best and most scalable connectivity while enabling Tailscale agent-based functionality such as Tailscale SSH.
Refer to [Access Azure Linux VMs privately using Tailscale](/docs/install/cloud/azure/linux) and [Access Azure Windows VMs privately using Tailscale](/docs/install/cloud/azure/windows) for general guides.
### [IP-based connectivity with subnet router](#ip-based-connectivity-with-subnet-router)
For managed resources where you cannot install the Tailscale agent, such as Azure SQL or Azure Cosmos DB, you can run a [subnet router](/docs/features/subnet-routers) within your virtual network to access these resources from Tailscale.
### [DNS-based routing with an app connector](#dns-based-routing-with-an-app-connector)
[App connectors](/docs/features/app-connectors) let you route traffic bound for SaaS applications or managed services by proxying DNS for the target domains and advertising the subnet routes for the observed DNS results. This is useful for cases where the application has an allowlist of IP addresses which can connect to it; the IP addresses of the nodes running an app connector can be added to the allowlist, and all nodes in the tailnet will use that IP address for their traffic egress.
### [Kubernetes services and API server proxy with Tailscale Kubernetes Operator](#kubernetes-services-and-api-server-proxy-with-tailscale-kubernetes-operator)
The [Tailscale Kubernetes Operator](/docs/features/kubernetes-operator) lets you expose services in your Kubernetes cluster to your Tailscale network, and use an API server proxy for secure connectivity to the Kubernetes control plane.
### [Azure Functions, Azure App Service, and other container solutions](#azure-functions-azure-app-service-and-other-container-solutions)
Tailscale supports [userspace networking](/docs/concepts/userspace-networking) where processes in the container can connect to other resources on your Tailscale network by using a SOCKS5 or HTTP proxy. This lets [Azure Functions](https://azure.microsoft.com/en-us/products/functions), [Azure App Service](https://azure.microsoft.com/en-us/products/app-service), and other container-based solutions to connect to the Tailscale network with minimal configuration needed.
Refer to [Using Tailscale on Azure App Service](/docs/install/cloud/azure/azure-app-service) for a general guide.
## [Production best practices](#production-best-practices)
Below are general recommendations and best practices for running Tailscale in production environments. Much of what is listed below is explained in greater detail throughout this document:
* When possible deploy [subnet routers](/docs/features/subnet-routers), [exit nodes](/docs/features/exit-nodes), [app connectors](/docs/features/app-connectors), and the like, to public subnets with public IP addresses to ensure [direct connections](/docs/reference/connection-types) and optimal performance.
* Run subnet routers, exit nodes, app connectors, and the like, separately from the systems you are administering with Tailscale—for example, run your subnet routers outside of your Azure AKS clusters.
* Deploy dynamically scaled resources (for example, containers or serverless functions) as [ephemeral nodes](/docs/features/ephemeral-nodes) to automatically clean up devices after they shut down.
### [High availability and regional routing](#high-availability-and-regional-routing)
* Run multiple [subnet routers](/docs/features/subnet-routers) and [app connectors](/docs/features/app-connectors) across multiple Azure availability zones to improve resiliency against zone failures with [high availability failover](/docs/how-to/set-up-high-availability) and deploy across multiple regions for [regional routing](/docs/how-to/set-up-high-availability#regional-routing).
* Run multiple Tailscale SSH session recorder nodes across multiple Azure availability zones to improve resiliency against zone failures with [recorder node failover](/docs/reference/multiple-recorder-nodes) and deploy across multiple regions for [regional routing](/docs/how-to/set-up-high-availability#regional-routing).
## [Performance best practices](#performance-best-practices)
Refer to [Performance best practices](/docs/reference/best-practices/performance) for general recommendations.
### [In-region load balancing](#in-region-load-balancing)
Deploy multiple overlapping connectors within a [DERP](/docs/reference/derp-servers) region to take advantage of [in-region load balancing](/docs/how-to/set-up-high-availability#in-region-load-balancing-default) to evenly spread load across the connectors and provide in-region redundancy.
### [Recommended VM sizing](#recommended-vm-sizing)
#### [Normal usage](#normal-usage)
When installing Tailscale on an Azure VM as a "normal" Tailscale device (for example, not a subnet router, exit node, and the like), you likely have already sized that VM to a suitable type for its workload and running Tailscale on it will likely add negligible resource usage.
#### [Subnet routers, exit nodes, and app connectors](#subnet-routers-exit-nodes-and-app-connectors)
There are many variables that affect performance and workloads vary widely so we do not have specific size recommendations, but we do have general guidance for selecting a VM size for an Azure VM running as a [subnet router](/docs/features/subnet-routers), [exit node](/docs/features/exit-nodes), or [app connector](/docs/features/app-connectors):
* In general, higher CPU clock speed is more important than more cores.
* In general, VMs with Ampere Altra ARM–based processors are quite cost effective for packet forwarding.
* Use a non-burstable VM type to achieve consistent CPU performance.
* Per [Azure documentation](https://learn.microsoft.com/en-us/azure/virtual-machines/sizes-b-series-burstable), burstable performance machine sizes (such as B-series VMs) use a CPU credit mechanism which can result in variable performance.
* Tailscale will generally perform better on Linux than other operating systems due to additional optimizations that have been implemented.
## [Using Tailscale with Azure](#using-tailscale-with-azure)
### [Network security groups](#network-security-groups)
Tailscale uses various [NAT traversal techniques](/blog/how-nat-traversal-works) to safely connect to other Tailscale nodes without manual intervention. Nearly all the time, you do not need to open any [firewall ports](/docs/integrations/firewalls) for Tailscale. However, if your virtual network and network security groups are overly restrictive about internet-bound egress traffic, refer to [What firewall ports should I open to use Tailscale](/docs/reference/faq/firewall-ports).
### [Public vs private subnets](#public-vs-private-subnets)
Tailscale devices deployed to a public subnet with a public IP address will benefit from [direct connections](/docs/reference/connection-types) between nodes for the best performance.
#### [Azure NAT Gateway](#azure-nat-gateway)
Tailscale uses both [direct and relayed connections](/docs/reference/connection-types), opting for direct connections where possible. Azure NAT Gateway is a [Hard NAT](/docs/reference/device-connectivity#hard-nat) and will prevent direct connections causing connections to use [DERP relay servers](/docs/reference/derp-servers). This can lead to lower throughput and performance than direct connections.
Tailscale [Peer Relays](/docs/features/peer-relay) let you use devices in your tailnet as high-throughput relay servers when direct connections aren't possible due to network conditions such as being in a private subnet behind an Azure NAT Gateway. To bypass Azure NAT Gateway, follow the steps to deploy and [configure a peer relay](/docs/features/peer-relay#get-started) to a public subnet in your virtual network, with a public IP address, and allow incoming UDP traffic to the relay port.
### [Virtual network DNS resolution](#virtual-network-dns-resolution)
To allow non-Azure devices in your tailnet to query Azure DNS private zones, create a [Azure DNS private resolver](https://learn.microsoft.com/en-us/azure/dns/dns-private-resolver-overview) for your virtual network and configure [split DNS](/docs/reference/dns-in-tailscale#tailscale-dns-settings) to forward queries for your virtual network's internal domain name suffix to the IP address of the DNS private resolver's inbound endpoint.
### [Virtual network peering](#virtual-network-peering)
[Virtual network peering](https://learn.microsoft.com/en-us/azure/virtual-network/virtual-network-peering-overview) is a common strategy for connecting multiple virtual networks together. You can deploy a subnet router (or a set for high availability) within a virtual network to allow access to multiple virtual networks.
If you have virtual networks or subnets with overlapping IPv4 addresses, use [4via6 subnet routers](/docs/features/subnet-routers/4via6-subnets) to access resources with unique IPv6 addresses for each overlapping subnet.
### [Subnet routers](#subnet-routers)
#### [Operating a subnet router within Azure AKS](#operating-a-subnet-router-within-azure-aks)
Oftentimes organizations are using Tailscale to connect to and administer their Azure AKS clusters. While Tailscale can [run within a container](/docs/concepts/userspace-networking) and be deployed to AKS, we recommend running your [subnet routers](/docs/features/subnet-routers) externally to these clusters to ensure connectivity is available in the event your cluster is having issues. In other words, run your subnet router on dedicated VMs or an AKS cluster separate from than the cluster you're administering.
### [Tailscale SSH session recording](#tailscale-ssh-session-recording)
Deploy [multiple session recorder instances](/docs/reference/multiple-recorder-nodes) across multiple availability zones to improve resiliency against zone failures. If your organization operates across multiple regions, consider deploying SSH session recording nodes in each region you operate and [configure SSH access rules](/docs/features/tailscale-ssh/tailscale-ssh-session-recording#turn-on-session-recording-in-acls) to send recording information to the local region for your nodes.
## [Limitations](#limitations)
* Azure NAT Gateway is a [hard NAT](#azure-nat-gateway). All devices and services behind an Azure NAT Gateway will connect using [DERP relay servers](/docs/reference/derp-servers). For best performance, put devices in a [public subnet](#public-vs-private-subnets) to facilitate direct connections.
On this page
* [High-level architecture](#high-level-architecture)
* [Ways to deploy Tailscale to connect to and from Azure resources](#ways-to-deploy-tailscale-to-connect-to-and-from-azure-resources)
* [Agent-to-Agent connectivity](#agent-to-agent-connectivity)
* [IP-based connectivity with subnet router](#ip-based-connectivity-with-subnet-router)
* [DNS-based routing with an app connector](#dns-based-routing-with-an-app-connector)
* [Kubernetes services and API server proxy with Tailscale Kubernetes Operator](#kubernetes-services-and-api-server-proxy-with-tailscale-kubernetes-operator)
* [Azure Functions, Azure App Service, and other container solutions](#azure-functions-azure-app-service-and-other-container-solutions)
* [Production best practices](#production-best-practices)
* [High availability and regional routing](#high-availability-and-regional-routing)
* [Performance best practices](#performance-best-practices)
* [In-region load balancing](#in-region-load-balancing)
* [Recommended VM sizing](#recommended-vm-sizing)
* [Normal usage](#normal-usage)
* [Subnet routers, exit nodes, and app connectors](#subnet-routers-exit-nodes-and-app-connectors)
* [Using Tailscale with Azure](#using-tailscale-with-azure)
* [Network security groups](#network-security-groups)
* [Public vs private subnets](#public-vs-private-subnets)
* [Azure NAT Gateway](#azure-nat-gateway)
* [Virtual network DNS resolution](#virtual-network-dns-resolution)
* [Virtual network peering](#virtual-network-peering)
* [Subnet routers](#subnet-routers)
* [Operating a subnet router within Azure AKS](#operating-a-subnet-router-within-azure-aks)
* [Tailscale SSH session recording](#tailscale-ssh-session-recording)
* [Limitations](#limitations)
Scroll to top