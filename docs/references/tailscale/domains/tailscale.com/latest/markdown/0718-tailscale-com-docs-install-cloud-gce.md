Access Google Compute Engine VMs privately using Tailscale · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Access Google Compute Engine VMs privately using Tailscale
Last validated: Dec 4, 2025
Google Cloud provides Linux virtual machines and you can use Tailscale to provide secure connectivity.
## [Prerequisites](#prerequisites)
Before you begin this guide, you'll need a Tailscale network (known as a tailnet) set up and configured with at least one existing device. Read our [getting started guide](/docs/how-to/quickstart) if you need help with this.
## [Step 1: Set up the Tailscale client for the VM](#step-1-set-up-the-tailscale-client-for-the-vm)
First, [create a Virtual Machine in the GCE Console](https://cloud.google.com/compute/docs/instances/create-start-instance).
When creating the instance select **Management, security, disks, networking, sole tenancy**, select **Networking**, and select the **Network Interface**. Because we're later going to enable subnet routing on this VM, we want to set **IP forwarding** to **On**.
Once you create the VM, SSH to the system and follow the steps to [install Tailscale on Linux](/docs/install/linux).
## [Step 2: Allow UDP port 41641](#step-2-allow-udp-port-41641)
If at least one side of a tunnel has "easy NAT," where Tailscale can determine the UDP port number on the far side of the NAT device, then it will make [direct connections to minimize latency.](/blog/how-tailscale-works). We ensure that GCE nodes can make direct connections by allowing UDP port `41641` to ingress through the firewall.
In **VPC Network** \> **Firewall** we add two rules:
1. An ingress rule to allow `0.0.0.0/0` for UDP port `41641` to all instances.
2. An ingress rule to allow `::/0` for UDP port `41641` to all instances.
## [Step 3: Advertise routes from the VM](#step-3-advertise-routes-from-the-vm)
To enable connections from your tailnet to the GCP subnet, configure the VM to act as a [subnet router](/docs/features/subnet-routers).
First, enable IP forwarding on the VM.
If your Linux system has a `/etc/sysctl.d` directory, use:
```
`echo 'net.ipv4.ip\_forward = 1' | sudo tee -a /etc/sysctl.d/99-tailscale.conf
echo 'net.ipv6.conf.all.forwarding = 1' | sudo tee -a /etc/sysctl.d/99-tailscale.conf
sudo sysctl -p /etc/sysctl.d/99-tailscale.conf
`
```
Otherwise, use:
```
`echo 'net.ipv4.ip\_forward = 1' | sudo tee -a /etc/sysctl.conf
echo 'net.ipv6.conf.all.forwarding = 1' | sudo tee -a /etc/sysctl.conf
sudo sysctl -p /etc/sysctl.conf
`
```
After enabling IP forwarding, configure the VM to advertise routes for the subnet it sits on. For example, if the subnet address range is `10.182.0.0/24`, the command would be:
```
`tailscale set --advertise-routes=10.182.0.0/24 --accept-dns=false
`
```
For GCE VMs it is generally best to let Google handle the DNS configuration, not have Tailscale override it, so we added `--accept-dns=false`.
## [Step 4: Add GCE DNS for your tailnet](#step-4-add-gce-dns-for-your-tailnet)
For the benefit of the *other* nodes in the tailnet we'll set up [split DNS](/docs/reference/dns-in-tailscale#tailscale-dns-settings) to allow use of the same DNS names as the ones that are inside of GCE.
The hostnames inside of GCE are of the form:
```
`\<vm-name\>.\<gce-project-name\>.internal
`
```
Use the Google Cloud CLI command [`gcloud dns policies create`](https://cloud.google.com/sdk/gcloud/reference/dns/policies/create) to create a new [Cloud DNS](https://cloud.google.com/dns) policy that lets inbound forwarding for your tailnet:
```
`gcloud dns policies create inbound-dns \\
--project="YOUR\_VPC\_PROJECT" \\
--description="Expose DNS endpoints per subnet" \\
--networks="YOUR\_VPC" \\
--enable-inbound-forwarding
`
```
where:
* `YOUR\_VPC\_PROJECT` is your Google Cloud [project ID](https://cloud.google.com/sdk/gcloud/reference#--project).
* `YOUR\_VPC` is the comma separated list of network names to associate with the policy.
Use the [`gcloud compute addresses list`](https://cloud.google.com/sdk/gcloud/reference/compute/addresses/list) to verify that your tailnet recognizes the DNS resolver for your tailnet subnet:
```
`gcloud compute addresses list \\
--project="YOUR\_VPC\_PROJECT" \\
--filter='purpose="DNS\_RESOLVER"' \\
--format='csv(address, region, subnetwork)' \\
| grep YOUR\_TAILNET\_SUBNET
`
```
where:
* `YOUR\_VPC\_PROJECT` is your Google Cloud [project ID](https://cloud.google.com/sdk/gcloud/reference#--project).
* `YOUR\_TAILNET\_SUBNET` is your subnet machine name.
Use the IP address returned from this command as a DNS resolver for your tailnet:
1. Open the [DNS](https://login.tailscale.com/admin/dns) page in the admin console.
2. Select **Add name server**.
3. Select **Custom**.
4. For **Nameserver**, enter the IP address from the `gcloud compute addresses list` command that you ran above. In this example, we use `10.243.117.59`.
5. Ensure **Restrict to search domain** is checked.
6. For **Search Domain**, enter **internal**.
7. Select **Save**.
Now the same hostnames which work between nodes running within GCE will also be available to all nodes in your tailnet.
## [Step 5: Remove public SSH access](#step-5-remove-public-ssh-access)
As we can now SSH to the system over the private Tailscale network, there is no reason to leave the SSH port open on a public IP address. You can delete the `default-allow-ssh` rule from **VPC network** \> **Firewall**.
On this page
* [Prerequisites](#prerequisites)
* [Step 1: Set up the Tailscale client for the VM](#step-1-set-up-the-tailscale-client-for-the-vm)
* [Step 2: Allow UDP port 41641](#step-2-allow-udp-port-41641)
* [Step 3: Advertise routes from the VM](#step-3-advertise-routes-from-the-vm)
* [Step 4: Add GCE DNS for your tailnet](#step-4-add-gce-dns-for-your-tailnet)
* [Step 5: Remove public SSH access](#step-5-remove-public-ssh-access)
Scroll to top