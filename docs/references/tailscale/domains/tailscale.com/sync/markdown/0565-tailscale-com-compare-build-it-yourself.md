Build it Yourself vs. Tailscale | Compare Free VPN Alternatives
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Go back](/compare#vpn-comparisons)
[Compare](/compare)
Build It Yourself
# Build It Yourself vs. Tailscale
On this page
[
Use Tailscale
](https://login.tailscale.com/start)[
Contact Sales
](/contact/sales)
Many people are interested in making a VPN between their devices in order to make collaboration easier. They do this to share files between devices without the cloud, play games together, collaborate on projects and more. All without worrying about confusing firewall settings and spending hours configuring things. WireGuard is a popular protocol to use for this because it is battery efficient and fast.
### [The Benefits of a VPN](#the-benefits-of-a-vpn)
VPNs offer the following benefits to users and the services they protect:
* End to end encryption: A service behind a VPN will always be protected with military-grade encryption. This will make it impossible for malicious actors in that coffee shop to be able to see what you are doing behind it.
* Private availability: Those computers behind the VPN won’t be directly visible from random places on the internet. This makes it impossible for hackers to break into them.
* Convenience: A VPN will let computers on that VPN communicate with each other, which means you don’t have to worry about firewalls getting in the way.
### [How to Make a VPN](#how-to-make-a-vpn)
Making a VPN with WireGuard can be a tedious and error-prone task. In order to do it, you need to do these steps:
1. Create or designate a server you pay for as the host for the VPN
2. Lock down all of the firewall settings so that only VPN and SSH traffic can go to it via the internet
3. Make sure that the server can route traffic through the VPN interface
4. Install the WireGuard kernel module
5. Set up a keypair for the server
6. Figure out an IP address range that won’t collide with home networks, coffee shops and other public Wi-Fi
7. Figure out every device you want to join to the VPN
8. Make a keypair for every device
9. Put the public key into the server configuration
10. Reload the server configuration, disrupting everyone’s connections in the process
11. Configure each client device (instructions vary by OS)
And voila, you have yourself a VPN! Everything is routed through that central server though, which can get expensive if you have a lot of data passing through computers behind the VPN. This can get worse if you have employees in multiple locations, multiple offices or even multiple continents. If the VPN hub is in Montreal and the service is in San Francisco, your packets go through Montreal even if you’re standing next to the machine in San Francisco.
### [An Alternative: Make your own VPN with Tailscale](#an-alternative-make-your-own-vpn-with-tailscale)
Making a VPN with Tailscale is a simplified process:
1. Sign up for free on tailscale.com
2. Install Tailscale on every device you want on the VPN
3. Log into Tailscale on those devices
4. There is no step 4: You’re done!
Much easier! Tailscale handles the [IP addressing](https://tailscale.com/kb/1015/100.x-addresses/), public key management and connectivity between your devices. The devices will all connect to each other instead of one big central server. This means that traffic from someone in San Francisco will go directly to a server in San Francisco instead of having to bounce around across the world. This allows you to have the fastest connections possible.
### [Tailscale vs a Build it Yourself VPN](#tailscale-vs-a-build-it-yourself-vpn)
Tailscale has even more benefits than we’ve listed here. Here’s a high level outline of some of the bigger ones:
|With Tailscale|Without Tailscale|
|Strong correlation between computers and users in the admin console, system tray icon and mobile apps|Spreadsheets keeping track of IP address ownership and names of computers|
|MagicDNS lets you connect to computers directly by name|Memorizing IP addresses or having to set up a complicated DNS server on your own|
|Taildrop for instant file sharing across computers like AirDrop on Apple devices|Setting up complicated file sharing systems using separate accounts from your identity provider|
|Use the identity management system you’re already used to, a Google Workspace user correlates 1:1 with a Tailscale user|Manual setup that requires error prone encryption key generation and configuration|
|Seamless adding of new machines|Disruptive rehashing of configuration files that kills all traffic until it’s done|
|Tailscale keeps growing and changing|Manual setup required for any additional features and polish|
|A support team to rely on if things go wrong|Expensive contractors and WireGuard experts|
|Distributed mesh|Single point of failure|
### [Frequently Asked Questions](#frequently-asked-questions)
### [How much does Tailscale cost? ](#how-much-does-tailscale-cost)
You can set up Tailscale free for personal use and evaluation. Check [our pricing page](https://tailscale.com/pricing) for more information.
### [Is creating a VPN illegal?](#is-creating-a-vpn-illegal)
In most [cases the answer is no](https://twitter.com/sugarpirate_/status/1348044775887233024), creating a VPN is not illegal. However, depending on government regulations the answer may be yes. Check your local government regulations of your country or locality if you are unsure.
### [Can you be tracked using Tailscale?](#can-you-be-tracked-using-tailscale)
A malicious actor will only be able to see that you are using Tailscale, they will not be able to see the contents of your traffic. Those contents are encrypted with better encryption than most banks use, which will keep your information secure.
### [Can I hide my IP address with Tailscale?](#can-i-hide-my-ip-address-with-tailscale)
You can set up an [Exit Node](https://tailscale.com/kb/1103/exit-nodes/) to hide your IP address with Tailscale however, Tailscale doesn’t do this by default. When you enable an Exit Node, all the traffic sent out to the internet will go through that node. This will make websites you connect to think that node’s IP address is the one you are using instead of the one you are actually connecting with, thus hiding your IP address behind the exit node.
### [Should I have a VPN at home?](#should-i-have-a-vpn-at-home)
This will depend on your individual security posture, but you should have a VPN at home for convenience if you need to access your home network on the go. Forget a file on your home tower? Remote into it over Tailscale and copy it over to your phone with Taildrop. This convenience expands to your workplace too. This allows you to use these same conveniences at home and work.
### [What can I host behind Tailscale?](#what-can-i-host-behind-tailscale)
You can host anything behind Tailscale ranging from a Minecraft server, a web server, photo collections or more. If you can do it on the public internet, you can do it privately with Tailscale.
### [How do I share services to other Tailscale users?](#how-do-i-share-services-to-other-tailscale-users)
Share services to other Tailscale users using [Node Sharing](https://tailscale.com/kb/1084/sharing/). Node Sharing allows you to share individual computers with other people. Giving someone access to a dedicated Minecraft server won’t give them access to your photo collection on another computer.
## Try Tailscale for free
[
Get started
](https://login.tailscale.com/start)
Schedule a demo
[
Contact sales
](/contact/sales)