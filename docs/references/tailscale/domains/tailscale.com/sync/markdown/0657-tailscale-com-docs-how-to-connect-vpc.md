Access your virtual private cloud (VPC) · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Access your virtual private cloud (VPC)
Last validated: Jan 5, 2026
This topic is a quick guide for setting up a Linux [subnet router](/docs/features/subnet-routers) to access your virtual private cloud (VPC). You can also set up a subnet router on [Windows](/docs/features/subnet-routers?tab=windows#connect-to-tailscale-as-a-subnet-router) or [macOS](/docs/features/subnet-routers?tab=macos#connect-to-tailscale-as-a-subnet-router). For more detailed information, see [Connect to an AWS VPC using subnet routes](/docs/install/cloud/aws).
## [Prerequisites](#prerequisites)
* You need a [Tailscale account](/docs/how-to/quickstart).
* You need a Linux VM. The following topics provide details for setting up a Linux VM using common cloud providers:
* [Create a Linux VM on Azure](https://learn.microsoft.com/en-us/azure/virtual-machines/linux/quick-create-portal?tabs=ubuntu).
* [Create a Linux VM on AWS](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EC2_GetStarted.html).
* [Create a Linux VM on GCP](https://cloud.google.com/compute/docs/create-linux-vm-instance).
* You need [Tailscale installed on your Linux VM](/docs/install/linux).
* You need [Tailscale installed on your local machine](/download).
## [Create a Tailscale subnet router](#create-a-tailscale-subnet-router)
1. Start by jotting down the IP address of the private resources you want to access and determine the Classless Inter-Domain Routing (CIDR) notation that represents the subnet boundaries for those resources.
For example, if you have a VM at `10.0.0.3` and another at `10.0.1.4`, you might consider using CIDR notations `10.0.0.0/24` and `10.0.1.0/24` to represent these subnets
Cloud providers may also provide CIDR address spaces for your VPCs which you can just use out of the box. For example, here is a screenshot for AWS:
This is a screenshot for Azure:
2. Start by accessing your VM to start configuring your subnet router.
This will most likely be the cloud-provided SSH mechanism and may require you to **temporarily** open up port `22` on that VM to your corporate network or the internet.
3. In a terminal window, run the following command to check if you have `sysctl.d` on your system:
```
`ls /etc | grep sysctl.d
`
```
4. If the command returns an output, it means `sysctl.d` is on your system, so you can run the following commands to set up IP forwarding on your router:
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
5. If you have firewalld installed on your VM instance, you should also allow masquerading for your subnet router to work:
```
`firewall-cmd --permanent --add-masquerade
`
```
If this command return an error that means you do not have `firewalld` installed and can skip to the next step.
6. Finally, run the [`tailscale set`](/docs/reference/tailscale-cli#set) command to start advertising routes to your subnet (the routes your recorded in step 1):
```
`sudo tailscale set --advertise-routes=\<subnet range 1\>,\<subnet range 2\>,...
`
```
Running this step will cause the VM to authenticate with Tailscale. You will be asked to login with your credentials and add the device to your tailnet. Here's an example of running the command with the subnet ranges we used in step 1:
```
`sudo tailscale set --advertise-routes=10.0.0.0/24,10.0.1.0/24
`
```
7. Open the [Access controls](https://login.tailscale.com/admin/acls) page of the Tailscale admin console and add the following lines to your tailnet policy file to allow connectivity through your subnet:
```
`"grants": [
{
"src": ["john.doe@example.com"],
"dst": ["\<subnet-range-1\>/24", "\<subnet-range-2\>/24"],
"ip": ["\*"]
}
]
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
This lets the designated subnets be reachable by you and to the ports that you designate in the rule. Here's an example of a rule based on subnets in step 1 which grants access to all ports in the subnet range to the user `john.doe@example.com`:
```
`"grants": [
{
"src": ["john.doe@example.com"],
"dst": ["10.0.0.0/24", "10.0.1.0/24"],
"ip": ["\*"]
}
]
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
8. If you are using a Linux-based local machine (not your subnet router) to connect, you need to run the [`tailscale set`](/docs/reference/tailscale-cli#set) command to accept the advertised routes. If you are not using a Linux-based local machine, you can skip this step.
```
`sudo tailscale set --accept-routes
`
```
## [Use the subnet router](#use-the-subnet-router)
1. From step 1 in [Create a Tailscale subnet router](#create-a-tailscale-subnet-router), find the private IP addresses for the resources or machine that you are trying to reach.
2. On your local machine, in a terminal window, ping those private IPs.
```
`ping \<your private vm ip address\>
`
```
Responses from them indicate that your subnet router is working as expected.
For example, using private IPs in step 1:
```
`ping 10.0.0.3 -t 4
`
```
If successful, a response from these private IP addresses displays similar to:
```
`PING 10.0.0.3 (10.0.0.3): 56 data bytes
64 bytes from 10.0.0.3: icmp\_seq=0 ttl=64 time=0.112 ms
64 bytes from 10.0.0.3: icmp\_seq=1 ttl=64 time=0.088 ms
64 bytes from 10.0.0.3: icmp\_seq=2 ttl=64 time=0.175 ms
64 bytes from 10.0.0.3: icmp\_seq=3 ttl=64 time=0.145 ms
`
```
On this page
* [Prerequisites](#prerequisites)
* [Create a Tailscale subnet router](#create-a-tailscale-subnet-router)
* [Use the subnet router](#use-the-subnet-router)
Scroll to top