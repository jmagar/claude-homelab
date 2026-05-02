Mullvad on Tailscale: Secure & Anonymous Internet Access
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|September 07, 2023
# Mullvad on Tailscale: Privately browse the web
Tailscale has partnered with Mullvad to make its global network of VPN servers available for our customers. You can now easily browse the web using any one of Mullvad’s available servers as a Tailscale [exit node](https://tailscale.com/kb/1103/exit-nodes/) while maintaining the user privacy that’s synonymous with Mullvad.
[Mullvad](https://mullvad.net/) is a Virtual Private Network (VPN) service that’s known for its strong commitment to user privacy, anonymity, and security. It safeguards user privacy by not logging or monitoring user activity, and it uses a unique account number system for subscriptions, meaning personal data is not tied to your account. Services like Mullvad help you browse the internet more privately.
Taking advantage of this new partnership means that even when you’re far from home, you can stay connected to the things you care about via Tailscale and maintain private internet browsing from your tailnet thanks to Mullvad’s secure and high-speed global network.
### [Tailscale vs. Mullvad](#tailscale-vs-mullvad)
You may have heard the term VPN being used interchangeably to refer to Tailscale and services like Mullvad. While both uses are technically correct, there’s a stark difference in why you’d use each type of service. Tailscale helps smooth out the connectivity problems of today by building you a personal private internet, which we call a tailnet. This helps you connect to the services and people you care about, securely, from just about anywhere on the planet. Privacy VPNs help you connect to the internet in a secure, private, and anonymous manner. You can protect yourself from advertisers, ISPs, threat actors on a public Wi-Fi network, marketing sites, and more by using a privacy VPN to mask your device identity.
Before today, you’d have to roll your own infrastructure to get some of the same benefits of a privacy VPN while using Tailscale. With our Mullvad partnership, that changes.
### [Mullvad is your privacy edge](#mullvad-is-your-privacy-edge)
When you use Mullvad, you get instant access to hundreds of servers in 40+ countries around the world. To connect to any one of those servers, your device generates a WireGuard key pair: the public key is used to identify peers in Mullvad’s infrastructure, and the private key is used to encrypt traffic. When you use Tailscale with a Mullvad exit node, it’s the same thing! Your node registers its existing Tailscale-generated WireGuard key pair with Mullvad’s infrastructure. Any traffic coming over the internet is terminated at Mullvad’s network edge, and end-to-end encrypted all the way to your device. Basically, you get to bring Mullvad’s entire fleet of servers into your tailnet.
### [Tailscale is a coordination layer](#tailscale-is-a-coordination-layer)
Tailscale acts as a coordination layer between your devices and Mullvad’s network edge. Tailscale’s control layer continually updates the available Mullvad network map, and tells your devices which servers to connect to in each available region or city, and alerts your device of any changes that may affect your connection. Tailscale then lets your device know which Mullvad nodes are available, and sends your device connection information for the selected region or city. From there, traffic goes directly through the connected Mullvad node to the internet. Like other traffic flowing over your tailnet, your data is end-to-end encrypted. Tailscale doesn’t have the private key, so we can’t see your traffic.
Mullvad never knows who you are; just that a device is connecting to one of its servers to proxy internet-bound traffic.### [Using Mullvad Exit Nodes](#using-mullvad-exit-nodes)
Starting today, you can use Mullvad exit nodes to do things like privately and securely browse the web at home or on-the-go, protect yourself prying eyes on public Wi-Fi, connect to the internet from specific locations around the globe, and forward non-standard port traffic like web, game, or media servers through Mullvad’s network edge. Want to give it a try yourself?
* To enable Mullvad Exit Nodes, have a tailnet admin head over to the [general settings](https://login.tailscale.com/admin/settings/general) page of your admin console, and click **Configure**.
* Select the devices you’d like to use with Mullvad on your tailnet.Configure which devices should have access to Mullvad’s global VPN infrastructure.
* Continue through the checkout flow to purchase Mullvad licenses. Licenses cost $5 per month for every 5 devices you wish to use.
* On any device where you’ve granted Mullvad VPN access, you can now select Mullvad exit nodes. Each device can enable or disable an exit node separately.
Your browser does not support the video tag.
Easily select a Mullvad exit node from your enabled devices.
For more information on how to use Mullvad with Tailscale, head over to [our documentation](https://tailscale.com/kb/1258/mullvad-exit-nodes/).
### [Private and (mostly) anonymous](#private-and-mostly-anonymous)
Tailscale is a privacy-first company, and we go out of our way to design our software to preserve the privacy of its users. We’re also an identity-based company, and that property is similarly built into our architecture. Each Tailscale connection is a WireGuard tunnel — which is end-to-end encrypted, meaning that we can’t see the contents of the traffic even if we wanted to, and also authenticated, providing strong guarantees that traffic is flowing between endpoints that are who they claim to be.
You can see how this works in the design of the feature we’re announcing today. Mullvad is not sent any of your personal information; while Tailscale knows who you are through associated identity providers, this information is never needed for a connection to Mullvad’s servers. We let your local Tailscale client know where to send over its public WireGuard keys to establish a connection. From there, any traffic to the internet will flow through Mullvad VPN infrastructure, obscuring the personal details of your device, network, and connection from prying eyes.
For many use cases, that is a great combination. You get Tailscale’s strong privacy guarantees and a framework that keeps the number of parties with access to your identity to a minimum. It’s not true anonymity, because that’s a problem Tailscale is not trying to solve. But for the many users who want Tailscale’s powerful encryption and ease of use, and whose threat model allows for that kind of conditional anonymity, it works.
There are also valid use cases that require privacy *and* true anonymity. But there are risks to providing these guarantees commercially, [as cited by Mullvad](https://mullvad.net/en/blog/2023/5/29/removing-the-support-for-forwarded-ports/) and [others](https://www.ivpn.net/blog/gradual-removal-of-port-forwarding/). Bad actors can take advantage of these services, turning them into abuse vectors. That in turn can lead to a worse experience for everyone, including the people who most rely on these services for their own safety. This is a genuinely hard problem, compounded by the fact that it can affect vulnerable populations with very little room for error. For people with this challenging threat model, education is important: resources like [EFF’s Surveillance Self-Defense guide](https://ssd.eff.org/) can help explain what tools are appropriate.
### [Mullvad + Tailscale](#mullvad-tailscale)
Mullvad exit nodes are ready to use starting today, available as a public beta. You can scale your Mullvad use across your family or team for a rate of $5 per month for every 5 devices with access, with recurring automated billing. Mullvad is available as a paid add-on to any current Tailscale plans, including our Free plan. To get started, head over to your [general settings](https://login.tailscale.com/admin/settings/general) tab in the admin console and select **Configure**.
Share
Authors
Kabir Sikand
Parker Higgins
James Tucker
Authors
Kabir Sikand
Parker Higgins
James Tucker
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