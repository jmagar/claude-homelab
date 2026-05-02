Access Oracle Cloud VMs privately using Tailscale · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Access Oracle Cloud VMs privately using Tailscale
Last validated: Jan 5, 2026
Oracle Cloud provides Linux virtual machines, notably featuring the ARM CPU architecture.
We can use Tailscale to securely access Oracle virtual machines.
## [Prerequisites](#prerequisites)
Before you begin this guide, you'll need a Tailscale network set up and configured with at
least one existing device. Read our [getting started guide](/docs/how-to/quickstart)
if you need help with this.
## [Step 1: Set up the Tailscale client for the VM](#step-1-set-up-the-tailscale-client-for-the-vm)
First, [create a Virtual Machine in the OCN Console](https://cloud.oracle.com/compute/instances/create).
SSH to the system and follow the steps to
[install Tailscale on Oracle Linux](/docs/install/linux).
## [Step 2: Allow UDP port 41641](#step-2-allow-udp-port-41641)
If at least one side of a tunnel has "easy NAT," where Tailscale can determine the UDP port
number on the far side of the NAT device, then it will make
[direct connections to minimize latency.](/blog/how-tailscale-works)
We ensure that OCN nodes can make direct connections by allowing UDP port 41641 to ingress
through the firewall.
In the [Networking tab](https://cloud.oracle.com/networking/vcns) select **Virtual Cloud Networks**
select the specific VCN the VM has been created on.
Select **Security Lists** in the left hand column, and the security list in use (probably
a Default).
Add a Stateless ingress rule for 0.0.0.0/0 UDP port 41641.
## [Step 3: Advertise routes from the VM](#step-3-advertise-routes-from-the-vm)
For the benefit of the *other* nodes in the tailnet we'll set up
[split DNS](/docs/reference/dns-in-tailscale#tailscale-dns-settings) to allow
use of the same DNS names as are used inside of Oracle Cloud. The DNS server provided by Oracle
is 169.254.169.254, and supports hostnames of the form `instance.subnet01234567.vcn01234567.oraclevcn.com`.
We'll have our VM advertise routes for both the subnet it sits on as well as the Oracle DNS
server. For example, if the subnet address range is 10.0.0.0/24, the command would be:
```
`tailscale set --advertise-routes=10.0.0.0/24,169.254.169.254/32 --accept-dns=false
`
```
For Oracle Cloud VMs it is generally best to let Oracle handle the DNS configuration,
not have Tailscale override it, so we added `--accept-dns=false`.
## [Step 4: Add Oracle DNS for your tailnet](#step-4-add-oracle-dns-for-your-tailnet)
In the [DNS](https://login.tailscale.com/admin/dns) page of the admin console we add a nameserver
restricted to the `oraclevcn.com` domain, pointing to the Oracle DNS server which we
made available through our VM.
Now the same hostnames which work between nodes running within Oracle Cloud will also be available
to all nodes on our tailnet.
## [Step 5: Remove public SSH access](#step-5-remove-public-ssh-access)
As we can now SSH to the system over the private Tailscale network, there is no reason to leave
the SSH port open on a public IP address. In the Network \> Security List the SSH rule can be
removed.
## [Troubleshooting](#troubleshooting)
For troubleshooting information, refer to [Troubleshoot Linux cloud devices](/docs/reference/troubleshooting/cloud/oracle-cloud).
On this page
* [Prerequisites](#prerequisites)
* [Step 1: Set up the Tailscale client for the VM](#step-1-set-up-the-tailscale-client-for-the-vm)
* [Step 2: Allow UDP port 41641](#step-2-allow-udp-port-41641)
* [Step 3: Advertise routes from the VM](#step-3-advertise-routes-from-the-vm)
* [Step 4: Add Oracle DNS for your tailnet](#step-4-add-oracle-dns-for-your-tailnet)
* [Step 5: Remove public SSH access](#step-5-remove-public-ssh-access)
* [Troubleshooting](#troubleshooting)
Scroll to top