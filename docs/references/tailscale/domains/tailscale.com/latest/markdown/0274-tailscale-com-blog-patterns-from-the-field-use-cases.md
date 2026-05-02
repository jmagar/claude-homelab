Real-world enterprise use cases: Tailscale patterns from the field
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|insightsJanuary 29, 2025
# Real-world enterprise use cases: Tailscale patterns from the field
Chris Chang is Director of New Business Sales at Tailscale. In this two-part series, he provides some insights from his conversations with customers in that capacity.
One great thing about working in Sales here at Tailscale is we get to talk to new customers throughout the process of adopting the product. We really get to see how it solves their problems, and over time, we see that teams tend to roll out deployments in common patterns to fit common use cases.
In part one of this two-part blog series, we talked about [the pain points that often precede a call to our Sales team](https://tailscale.com/blog/patterns-from-the-field-pain-points). But a sales call is just the beginning of a journey, and that journey continues when sales prospects become new customers and start to deploy those use cases.
## [Use cases](#use-cases)
These are some of the most common use cases that I see customers use Tailscale for. This is not an exhaustive list, and I’d love to hear from you if your use case isn’t captured here!
1. Business VPN
2. Accessing regulated environments
3. Infrastructure access
4. Kubernetes networking
5. CI/CD connectivity
6. Developer application testing
7. Edge & industrial IoT### [Business VPN for remote access](#business-vpn-for-remote-access)
The business VPN use case is the most universal, as any company that has an office, datacenter, or cloud footprint likely needs one. Tailscale is considered one of the best business VPN solutions due to its security, scalability, and ease of use. I think of this use case as providing business network access for:
* Full time employees
* Traveling workforce
* External contractors
The components these users need to access may include private corporate resources, such as a Windows file share, [Synology NAS](https://tailscale.com/kb/1131/synology), internal dashboard, or homegrown customer support application.
Since these business users are often non-technical, a smooth user experience is important to reduce frustration and ensure productivity for them (and the IT teams that support them). In practice, users often forget that Tailscale is running because it gracefully handles network changes (no annoying reconnects!) and splits traffic by default. The connections use the [WireGuard protocol](https://tailscale.com/kb/1035/wireguard), which provides high performance and built-in roaming. Logging into Tailscale is done via your Identity Provider, so there are no credentials or certs to manage anymore.
IT administrators can leverage our Mobile Device Management (MDM) and Endpoint Detection and Response ([EDR](https://tailscale.com/solutions/security)) integrations to automatically install, update, and manage the VPN experience for employees. For example, you can choose to have Tailscale start running once a user logs into their computer or restrict access if a device’s trust score is below a certain level.
Tailscale is [split tunnel](https://tailscale.com/learn/what-is-split-tunneling-secure-critical-data-vpn) by default, but there are also many traffic shaping options to give you full control over the network. A typical Tailscale network might have the following components:
* [Subnet router](https://tailscale.com/kb/1019/subnets) (split tunnel) routes traffic to internal resources in a cloud VPC. You can configure multiple subnet routers if you want to connect to multiple cloud VPCs, regions, or offices.
* [App connector](https://tailscale.com/kb/1281/app-connectors) (split tunnel) routes traffic for SaaS applications (e.g. Salesforce, Zendesk, or Github) that you specify. You can configure IP allowlisting on these SaaS applications (using the public IP of the app connector machine) to ensure they’re only accessible while on the VPN.
* [Exit node](https://tailscale.com/kb/1103/exit-nodes) (full tunnel) routes all Internet traffic. You can provide this to traveling employees who frequent untrusted networks. You can either host the exit node on your own infrastructure, or use hosted exit nodes through our [Mullvad partnership](https://tailscale.com/kb/1258/mullvad-exit-nodes).### [Accessing regulated environments](#accessing-regulated-environments)
Customers that sell to or work with regulated industries, such as healthcare or financial services, often need to connect to these institutions’ backend systems in order to exchange data or to provide troubleshooting support. Installing software such as an agent or setting up a site-to-site VPN in a bank’s datacenter is a non-starter. As a result, regulated organizations like banks will often ask their vendors to provide a static public IP that will be allowlisted.
Our customers can use any of our traffic shaping features (subnet routers, app connectors, or exit nodes) to create a central egress point on their network that can be allowlisted in a hospital or bank’s network.
### [Secure infrastructure access](#secure-infrastructure-access)
This is our bread-and-butter use case: IT and Engineering teams looking for privileged access to internal resources. Whether your compute runs on bare metal, virtual machines, containers, Kubernetes, we have you covered.
**Quick win**: You can replace your publicly exposed bastion hosts with subnet routers that are only accessible to your Tailscale network. You can set up private access to all of your infrastructure in minutes.
You can deploy Tailscale incrementally to further secure your most critical workloads and unlock additional functionality. Installing the Tailscale client directly on a machine enables: direct connectivity (lower latency and higher throughput), end-to-end encryption, and additional features like MagicDNS, ACL Tags, and [Tailscale SSH](https://tailscale.com/kb/1193/tailscale-ssh).
With [MagicDNS](https://tailscale.com/kb/1081/magicdns), you don’t have to use Tailscale IPs or memorize private IP addresses anymore. You can programmatically assign DNS names for each machine and access devices by their machine name. For example, if you have a machine named “monitoring” you can SSH into it by running `ssh username@monitoring`.
You can use[ ACL Tags](https://tailscale.com/kb/1068/tags) to group your non-user devices based on purpose, such as servers or ephemeral nodes. This enables you to write intuitive network access rules, such as “allow the SRE team to access all production resources”:
```
`{
"acls": [
{
"action": "accept",
"src": ["group:sre"],
"dst": ["tag:prod:\*"],
},
],
}`
```
[Tailscale SSH](https://tailscale.com/kb/1193/tailscale-ssh) is included in the Linux client, so you can provide SSH access to VMs or containers without needing to manage credentials or keys. You can optionally [record these SSH sessions](https://tailscale.com/kb/1246/tailscale-ssh-session-recording) to comply with your audit, troubleshooting, and compliance requirements.
Lastly, you can configure just-in-time access for engineers who need to perform critical tasks for a limited amount of time. Tailscale’s ACL file can be managed via API or [GitOps](https://tailscale.com/kb/1254/gitops-acls-gitlab), so customers can modify their ACLs based on their on-call schedule or Slackbot approval process.
### [Kubernetes networking](#kubernetes-networking)
There are many ways you can use Tailscale with Kubernetes and they all unlock different use cases. We’ll cover each use case.
#### [Infrastructure access](#infrastructure-access)
When Engineering teams need privileged access to Kubernetes resources, they need to issue commands against the Kubernetes control plane.
The [Tailscale Kubernetes operator](https://tailscale.com/kb/1236/kubernetes-operator) can be used to set up an API server proxy to your Kubernetes control plane. This enables you to remove public Internet access to your control plane, and to [record](https://tailscale.com/kb/1454/kubernetes-operator-session-recording) `kubectl exec` sessions for your audit requirements.
#### [Business VPN](#business-vpn)
If you have a homegrown dashboard or customer support tooling that is hosted in Kubernetes, you’ll need a way to provide end users access.
You could set up a Tailscale subnet router which would quickly enable connectivity to all of your Kubernetes resources. Alternatively, you can use the operator to create more granular access controls—[down to a specific Kubernetes Service](https://tailscale.com/kb/1439/kubernetes-operator-cluster-ingress).
#### [Machine-to-machine connectivity](#machine-to-machine-connectivity)
The operator can also be used to help with Kubernetes cluster egress traffic—that is, if your Kubernetes resources need access to other resources outside of the cluster. Popular examples might include RDS or MongoDB Atlas databases, or even other Kubernetes clusters.
### [CI/CD connectivity](#cicd-connectivity)
Tailscale can be used to connect your fully managed or self-hosted runners to the rest of your infrastructure (such as an internal test database). The neat thing about using Tailscale for this use case is that it’s all programmatic and cleans up after itself.
You use [Tailscale auth keys](https://tailscale.com/kb/1085/auth-keys) to programmatically create new containers that have an ACL tag scoped to the proper permissions, and designated as an ephemeral node. Once the container is destroyed, the machine automatically disappears from your Tailscale network. We have a thorough [guide](https://tailscale.com/kb/1287/tailscale-gitlab-runner) in our docs.
### [Developer application testing](#developer-application-testing)
Product Engineers need to collaborate and iterate quickly to ship fast. Engineers can use [Tailscale Serve](https://tailscale.com/kb/1312/serve) to make a local service available to other users on the same tailnet, or use [Tailscale Funnel](https://tailscale.com/kb/1223/funnel) to easily expose it to the internet. This can come in handy if you need to quickly show a preview to a client or to external contractors.
I also mentioned Mullvad earlier as a way to help secure Internet traffic for traveling employees. Well, they host servers all around the world which you can use to spoof your location and do localization testing on your website or app. Curious how your product looks in Japan? You can quickly test the end user experience for your application by choosing an exit node in Tokyo or Osaka.
### [Secure access for edge & industrial IoT devices](#secure-access-for-edge-and-industrial-iot-devices)
Some customers use Tailscale to connect to tens of thousands of devices out in the wild. These devices range from autonomous tractors to HVAC systems, and everything in-between. We provide [small binaries](https://tailscale.com/kb/1207/small-tailscale) for embedded devices and wide OS support so that you can install Tailscale directly on your devices. If you’re trying to connect to cameras or sensors that don’t run an OS, you can configure a simple Linux device (such as a Raspberry Pi) as a subnet router to connect to them.
Edge & IoT devices are often deployed in networks that you don’t have full control over, so that’s where Tailscale’s easy [NAT traversal](https://tailscale.com/blog/how-nat-traversal-works) shines. Tailscale can establish connectivity across any network—satellite, LTE, 5g, WiFi, etc.—with little to no firewall changes.
There are two primary connectivity patterns for this use case:
* Devices in the field need to send telemetry data back to a control plane that runs in the cloud or datacenter. With Tailscale ACLs, you can configure granular rules to only allow your devices to communicate to the control plane on port 443 or 8883.
* Support or Engineering teams also need troubleshooting access to devices. You can use Tailscale ACLs to ensure that each team only can access devices related to their help ticket, Tailscale SSH to connect to the device(s), and SSH recording to audit the SSH sessions.## [How Tailscale can help](#how-tailscale-can-help)
This post covered the actual use cases we see from customers who have adopted Tailscale. In the other post in this two-part series, we addressed [the pain points that lead people to look into Tailscale](https://tailscale.com/blog/patterns-from-the-field-pain-points) as a solution in the first place.
And if any of these use cases resonate with you, you can just start experimenting with [a free trial](https://login.tailscale.com/start). I guarantee you’ll be able to set up connectivity in less than 30 minutes. Otherwise, you can reach out to our [Sales](https://tailscale.com/contact/sales) or Support teams and we’ll help you get up and running ASAP.
Share
Author
Chris Chang
Author
Chris Chang
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