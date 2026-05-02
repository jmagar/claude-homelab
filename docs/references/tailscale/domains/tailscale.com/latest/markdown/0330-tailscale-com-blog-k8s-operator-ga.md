Tailscale Kubernetes Operator generally available for simple, secure K8s access
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|productApril 02, 2025
# Tailscale Kubernetes Operator now generally available
Tailscale helps your team build a network of encrypted and authenticated connections between resources, no matter where they’re running: in the cloud or on-prem, in VMs or in containers, at home or at work. Our users deploy the Tailscale Kubernetes Operator, now generally available, to securely connect internal users to apps inside the cluster and the Kubernetes control plane, enable simple service-to-service connectivity, and connect multiple clusters together.
The Tailscale Kubernetes Operator is now generally available to all Tailscale users. Since we released the [Tailscale Kubernetes Operator to beta](https://tailscale.com/blog/kubernetes-operator) a little over a year ago, thousands of organizations have adopted it, including for use in production environments. Today’s release marks the next milestone in stability and reliability that those users have already come to trust.
In this post, we will cover some of the most common operator use cases that we have seen over the past year.
### [Authenticated, secure access to Kubernetes control plane](#authenticated-secure-access-to-kubernetes-control-plane)
Organizations need access to Kubernetes APIs for different reasons — cluster admins need privileged access to deploy shared tooling, developers need access to deploy their applications, CI/CD runners need to deploy different components to the clusters and so on.
Managing least privileged access across the different use cases and personas can become a tedious and error prone job. Moreover, a common pattern is to assign a public IP address to the API server which makes it [an attractive target for attackers](https://securitylabs.datadoghq.com/cloud-security-atlas/vulnerabilities/unauthenticated-api-server/).
[Tailscale Kubernetes Operator API server proxy](https://tailscale.com/kb/1437/kubernetes-operator-api-server-proxy) solves both of these problems by routing API server requests over a secure, encrypted, private connection (i.e., no public IP needed) and by allowing Tailscale identities (groups, users and tagged devices) to be mapped to existing cluster roles.
An authenticated tailnet user or device can now access Kubernetes clusters via the proxy without a need for providing separate cluster credentials. When a user or device is removed from the tailnet, they are no longer able to access the cluster. Customers can combine these capabilities with other Tailscale security features such as automatic identity sync from external IdPs, device posture checks and Just-In-Time (JIT) access features, to further improve their clusters’ security posture.
The latest addition to the API server proxy is [kubectl exec session recording](https://tailscale.com/kb/1454/kubernetes-operator-session-recording) which, as the name suggests, allows kubectl exec session content to be recorded and stored in an S3-compatible bucket. These recordings can be used to detect threats, investigate security incidents, and ensure continued compliance with network security policies.
### [Connecting employees to internal applications](#connecting-employees-to-internal-applications)
Kubernetes clusters house many workloads and services, including apps that should be exposed to internal users only. For instance, app teams may need access to private Prometheus and Grafana instances to monitor the health and usage of their apps, sales and marketing teams may need access to internal dashboards, etc. As another example, customers in regulated industries may need to self-host third-party software for compliance and need a way to expose it to employees.
These workloads are not accessible by default and exposing them over the internet makes them vulnerable to attacks. Moreover, they often need to be made accessible to geographically distributed employees and contractors over a secure, private connection with fine grained permissions. Using the Tailscale Kubernetes Operator, customers can securely share these internal applications directly with employees and use ACLs to limit access to exactly the set of users who need it. We also strive to use native Kubernetes mechanisms, such as Ingress or a Service, to make it easy to embed these proxies into existing application deployment workflows.
Customers can create an [application layer proxy](https://tailscale.com/kb/1439/kubernetes-operator-cluster-ingress#exposing-cluster-workloads-using-a-kubernetes-ingress) to expose apps over HTTPS and offload TLS cert management to Tailscale. These are most applicable to apps that are accessed from a browser, an app or other HTTPS clients. Alternatively, customers can create a [network layer proxy](https://tailscale.com/kb/1439/kubernetes-operator-cluster-ingress#exposing-a-cluster-workload-using-a-kubernetes-service) to expose apps accessed using other protocols (e.g., TCP, UDP).
### [Hosting Tailscale resources in Kubernetes](#hosting-tailscale-resources-in-kubernetes)
We have customers that host most or all of the infrastructure on Kubernetes and wanted to host a Tailscale powered VPN on Kubernetes. That is why we added the Connector CRD which is used to host Tailscale resources like a [subnet router](https://tailscale.com/kb/1441/kubernetes-operator-connector#deploy-an-exit-node-or-subnet-router), an [exit node](https://tailscale.com/kb/1441/kubernetes-operator-connector#deploy-an-exit-node-or-subnet-router), an [app connector](https://tailscale.com/kb/1517/kubernetes-operator-app-connector) or an [SSH session recorder node](https://tailscale.com/kb/1484/kubernetes-operator-deploying-tsrecorder) in your cluster.
### [We are just getting started](#we-are-just-getting-started)
Aside from the use cases above, we have added many features over the past year to give customers more control over the resources deployed by the operator. These include [integration with Tailscale metrics](https://tailscale.com/kb/1445/kubernetes-operator-customization#exposing-metrics) and [mechanisms to customize proxy resources](https://tailscale.com/kb/1445/kubernetes-operator-customization#cluster-resource-customization-using-proxyclass).
#### [Improving availability and reliability](#improving-availability-and-reliability)
We are also actively working on supporting HA mode for the cluster proxies to ensure they can be used without downtime when accessing critical applications and the API server. This is currently [supported for the egress proxy](https://tailscale.com/kb/1438/kubernetes-operator-cluster-egress#configure-an-egress-service-using-proxygroup) and more will be added in the near future.
If you are interested in participating in early testing of these features, [reach out to us](https://tailscale.typeform.com/to/RvnnyWjb).
Learn more about the Tailscale Kubernetes Operator—and get set up today—with our [documentation](https://tailscale.com/kb/1236/kubernetes-operator).
Share
Author
Pouyan Aminian
Contributors
Irbe Krumina
Tom Proctor
Rhea Ghosh
Author
Pouyan Aminian
Contributors
Irbe Krumina
Tom Proctor
Rhea Ghosh
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