What Tailscale isn't: an anonymity service
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|August 06, 2025
# What Tailscale isn't: an anonymity service
Tailscale is a secure connectivity tool that puts the highest value on the privacy of your packets. But we made an intentional choice from day one that we weren't going to try to be an anonymity tool. Quite the opposite in fact! We're an [identity-centric network](https://tailscale.com/blog/zero-trust-report-2025-secure-networks-survey).
Anonymity tools, like Tor, need to be architected very differently. They trade away speed to reduce traceability. They are hard to inspect and diagnose and debug, as a feature. They make enemies, both political and corporate. They are inherently hard to audit and control, by design. In short, they are the exact opposite of what you want your corporate (or even homelab) network to be.
We believe anonymity tools are essential to safe network infrastructure and a free society. But, those tools are made by other people.
## [What privacy means to us](#what-privacy-means-to-us)
When we say Tailscale is privacy‑focused, we mean a whole array of things.
* **End‑to‑end encryption
**Everything between devices in your tailnet is encrypted with WireGuard™. Your private key never leaves your machine which means no devices but your own [¹](/blog/tailscale-privacy-anonymity#footnote-1) can ever decrypt your traffic [²](/blog/tailscale-privacy-anonymity#footnote-2). Even our relay servers (DERP) don’t know what they’re carrying because they never see any decryption keys.
* **No traffic inspection
**We never see or log your browsing activity, DNS queries (other than MagicDNS internal names), or communications. Your decrypted traffic never passes through any servers controlled by us. Even when you subscribe to [Mullvad over Tailscale](https://tailscale.com/mullvad), Mullvad runs the exit nodes, and we don't tell them who our customers are. You may choose to configure your Tailscale client to manage other traffic (subnet routers and exit nodes), but we intentionally never log that traffic [³](/blog/tailscale-privacy-anonymity#footnote-3).
* **No monetizing your data
**We don’t monetize your personal data or traffic information, and our business model doesn’t include ads. Our free plan is supported by paying customers, and those paying customers come from rabidly excited free users. I wrote more about how we built a sustainable business in [How our free plan stays free](https://tailscale.com/blog/free-plan).
* **Only the necessary telemetry
**We do collect metadata and logs needed to operate, protect and improve our service. That’s things like your IP addresses, OS version, and connection state machine diagnostics. For example, we might log that nodes X and Y formed (or tried to form) a connection at a certain time, or that a connection attempt failed due to a NAT issue. You can see exactly what's in this telemetry, because on Linux for example, it ends up in your systemd logs [⁴](/blog/tailscale-privacy-anonymity#footnote-4).
At Tailscale, privacy is about keeping your tailnet yours. What happens on your tailnet stays on your tailnet, as they say.
## [But privacy is not anonymity](#but-privacy-is-not-anonymity)
All that said, the fact that your tailnet *exists* is known to us because of [How Tailscale works](https://tailscale.com/blog/how-tailscale-works). Your identity is known to us. The names of your computers and your IP addresses, and which of your nodes connect to which others at which times, are known to us, because our servers are needed to facilitate the peer-to-peer connections. The vagaries of your firewall's obscure [NAT traversal bugs](https://tailscale.com/blog/how-nat-traversal-works) in every possible unusual situation are, unfortunately, known to us.
All that information in theory could be subpoenaed by law enforcement in any of several different countries where we operate. And if it’s a valid request, we would have to comply. Knowing that, we made careful choices about what information we see, have access to, collect, log, and store.
But if you’re looking for complete anonymity online, Tailscale is not the tool for you. Y'all, we're an *identity-centric network with a centralized control plane*. You should assume law enforcement can easily find out that you use Tailscale. Tailscale packets are pretty easy to detect, so you can assume they could know, through ISP logs, the shape and size of data you send between different nodes in different places (albeit without knowing the decrypted packet contents). You should assume they can correlate that flow metadata with your login identity [⁵](/blog/tailscale-privacy-anonymity#footnote-5).
Tailscale aims for a level of public-facing anonymity comparable to the Internet itself. Your ISP can (unfortunately) see which packets you send to where, so they can see which web sites you visit, even though Tailscale can't. So, they can also see which Tailscale nodes connect to each other. If the packets originate from your house, they can tell it's you. They can't ever see what's inside the packets, but they can collect a lot of metadata and draw conclusions.
Tools exist that attempt to hide your traffic patterns. Tailscale is not one of them.
## [*Telemetry* is a scary word](#telemetry-is-a-scary-word)
Tailscale runs a global mesh network with millions of nodes, connecting laptops, servers, phones, routers, VMs, containers, drones, cameras, sensors, satellites, and everything in between. [NAT traversal](https://tailscale.com/blog/how-nat-traversal-works) is extremely hard and 6+ years after starting, we're still not perfect at it. The only way we can keep everything working is with constant feedback.
Personally, when I hear the word *telemetry* I get defensive. When Windows collects *telemetry* and uses [dark patterns](https://www.urbanexile.net/2022/12/windows-11-dark-patterns/) to trick me into opting in, I assume they are collecting anything and everything for every possible nefarious reason. I mean, they put ads in the Start menu! Of course they're using that information to target the ads and do all manner of other things I didn't ask for. I've been in the tech industry a long time. I know companies do this. I know it sucks.
Tailscale is different. We don't sell ads. We aren't an operating system. We collect **only the information necessary to run the service, **which for those of us familiar with the [GDPR](https://gdpr-info.eu/art-5-gdpr/), are magic words. Our "service" is very constrained. We connect your devices to… your devices. The information we need to run the service is… information about your devices. Not your habits online, not which web sites you browse, not things outside your tailnet. The information we do need is, frankly, hard to misuse because your devices are mostly not interesting to anyone but you. So we have no incentive to be evil. Also, our [privacy policy](https://tailscale.com/privacy-policy) says we won't. As a result, it would be illegal to misuse this information, in several countries where we operate.
But, here's the trade. **There is no separate opt-in for telemetry collection because we don't need one.** That’s what our [Privacy Policy](https://tailscale.com/privacy-policy) and [Terms of Service](https://tailscale.com/terms) – which you agree to by installing and using the product – are for, and we encourage you to read them. If we were collecting more information than is *necessary to run the service*, there'd be a separate telemetry opt-in, like you see in website cookie banners all over the web. But we don't, so there isn't [⁶](/blog/tailscale-privacy-anonymity#footnote-6).
I know the lack of a separate telemetry opt-in screen annoys some people, just like the absence of cookie banners on a website annoys some people. But, we take a principled stance on this. The information is *necessary to operate the service*. Even when everything's going great, we need the information about what is going great, on which parts of the Internet, when, and how. That information, and our team of engineers responding to it, is why Tailscale's mesh network is bigger, faster, and more reliable than any other mesh network in the history of computing. It's why we can efficiently provide free support to every user including on our free plan.
We're building [the New Internet](https://tailscale.com/blog/new-internet), together. The physical Internet had telemetry from day one, you just didn't see it because your computer wasn't the router. The New Internet, a truly functional internetworking layer built on top of the physical Internet, needs telemetry too. So the network engineers can do their jobs.
## [Bottom line: what you're signing up for with Tailscale](#bottom-line-what-youre-signing-up-for-with-tailscale)
When you use Tailscale, you’re choosing a tool that prioritizes **secure connectivity and privacy** over anonymity. We want to be upfront about the fact that Tailscale knows who you are (your login) and which devices you’re connecting. We record metadata about your network connections. That's how we work, and how we constantly improve the network.
If your threat model requires complete anonymity, you need to look at other solutions. Please do so! The worst disaster we can imagine is, say, a journalist who misunderstands Tailscale's architecture, attempts to use it for anonymity, and has that anonymity breached. That's simply not what Tailscale is for.
By contrast, if your goal is safe, encrypted, private, easy connectivity among your own devices, Tailscale is a great fit. You get your own tailnet whose traffic is end-to-end encrypted, and insulated from the Internet at large. **Nobody except you and the people you explicitly trust can access your tailnet or see your data**. And yes, your telemetry metadata helps us continually make that network faster and more reliable for everyone. We think that’s a pretty good deal, and it’s one we’re proud to be transparent about.
### [Footnotes](#footnotes)
1.
If you're worried about Tailscale adding rogue devices to your network in a breach, try
[Tailnet Lock](https://tailscale.com/kb/1226/tailnet-lock).
2.
Using some especially clever techniques, we make sure we can't decrypt your traffic
[even in Tailscale Funnel](https://tailscale.com/kb/1223/funnel)
where that should have been impossible.
3.
The only exception may be if you explicitly enable
[Network Flow Logs](https://tailscale.com/kb/1219/network-flow-logs)
for your own use. The original version of flow logs didn't support logging public traffic information that passes through your exit node. But doing so was a popular feature request from our corporate customers. To prevent abuse of this capability, flow logs are one of the few features not available to try on our free plan.
4.
People have accused our logs of being hopelessly verbose, but I've never seen someone look at them and think they're too invasive. The separate
[List of Running Services](https://tailscale.com/kb/1100/services)
data collection is opt-in, because it's an optional feature and felt potentially invasive to us.
5.
By the way, this is why Tailscale sucks as a botnet control or phishing tool. If you perpetrate a scam or crime and someone reports it, it's easily traceable back to you. You need different life choices, or at least a different tool.
6.
You can run the Tailscale client with the flag `--no-logs-no-support` to prevent it from sending diagnostic logs. This mode exists for power users who really want it, particularly if they're using an alternative control plane. The tradeoff is that our support team won’t have much to go on if you run into an issue.
Share
Author
Avery Pennarun
Author
Avery Pennarun
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