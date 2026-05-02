How Tailscale's free plan stays free
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|March 16, 2022
# How our free plan stays free
TL;DR: Tailscale’s free plan is free because we keep our scaling costs low relative to typical SaaS companies. We care about privacy, so unlike some other freemium models, you and your data are not the product. Rather, increased word-of-mouth from free plans sells the more valuable corporate plans. I know, it sounds too good to be true. Let’s see some details.
### “Just keep doing what you’re doing.”
Each month we send out a customer satisfaction survey as part of our newsletter. Along with the [now-industry-standard question](https://review.firstround.com/how-superhuman-built-an-engine-to-find-product-market-fit) about “How would you feel if you could no longer use Tailscale?” (answer: apparently very disappointed), we have a free-text question about what we could do to make Tailscale better.
Along with the usual excellent feature requests, every month we get feedback like this:
>
> “Gonna pay for a Personal Pro plan, not because I need more devices or extra features… but simply because I want to pay them for some of the value they delivered.”
>
>
> “Please continue doing what you are doing!”
>
>
> “It’s perfect. Make me pay money for it!!”
>
>
> “Keep it running please.”
>
>
> “Keep your sweet product focus. Your excellent team should go tackle the next problem.”
>
>
> “Keep a free plan as long as possible. Or keep us on a legacy plan!”
>
There’s a certain… *concern* about our profitability. One gets the impression that people may be scarred by the tech industry. (I get it. I’ve been scarred too. I use a [Wordstar-clone text editor](https://joe-editor.sourceforge.io/) and a [long-abandoned X11 window manager](https://apenwarr.ca/log/20080408) I’ve been forward-porting since 2002. I hate unnecessary software changes, “pivots,” and deprecations.)
We also get users who write in to support asking, “How can it possibly be free?!?” In certain tech communities, you will sometimes see a comment like this[1](#fn:1) on articles about Tailscale:
>
> “If you’re not paying, then you’re not the customer. You’re the product.”
>
I’ve always disliked that claim. It starts from a grain of truth, especially for advertising- or spyware-based companies. But it’s not universally relevant. Sometimes a free lunch is just a free lunch.
Is there really such a thing? What’s the catch? Let’s discuss Tailscale’s business model.
### Tailscale is designed to be cost-effective to run
Perhaps we’re not supposed to say the quiet part out loud, but it’s important for the discussion. Our architectural decisions were made carefully, and are paying off.
In [How Tailscale Works](/blog/how-tailscale-works/), we discuss the separation between Tailscale’s “control plane” (the centralized service we run to help your nodes find each other) and the “data plane” (the peer-to-peer network that sends end-to-end encrypted data directly between your nodes, not through us). This “hybrid” centralized/decentralized architecture lets corporate users centrally manage, audit, and lock down their distributed network, while still eliminating packet bottlenecks and optimizing latency.
But it serves another purpose too: it makes the operational costs for us extremely reasonable.
SaaS companies typically track three major kinds of costs, spanning both infrastructure and salaries: product development (“fixed” costs, since they don’t vary with number of users); customer acquisition cost (or “cost of sales”); and cost of goods sold.
**Product development** is where most of our money goes. We use venture capital money to accelerate growth, not to survive. Almost all SaaS companies are initially “cash-flow negative”—on purpose, but always with a path to become cash-flow positive on demand. We never “sell each unit at a loss and make it up in volume.” That’s not how you become successful.
**Customer acquisition cost (CAC)** is marketing, sales, and pre-sales support activities. Our cost of sales is currently low, because Tailscale spreads primarily through word of mouth. [Continuously improving](https://apenwarr.ca/log/20161226) product quality, implementing self-serve payments, writing good documentation, and helping people find community support, all help keep sales costs low.
**Cost of goods sold (COGS)** is where the majority of our scaling costs lie. Tailscale’s COGS can be divided into three main categories:
1. **Scaling and operating the coordination service**. This is the control plane, including the “public key drop box” that your nodes use to find each other, log in, set ACLs, etc.
2. **Scaling and operating the [DERP network](/kb/1232/derp-servers)**. These are relays for your (still always end-to-end encrypted so we can’t read it) traffic when a point-to-point link can’t be established.
3. **Providing technical services and support**.
Although it’s hosted on an expensive service (AWS), the coordination service footprint is carefully minimized to keep its costs manageable. (We could currently scale to, say, 100x our existing volume before I start to be alarmed about the cost of running the coordination service. But if that happens, one expects our revenues will scale up too (perhaps after some lag), and then I will go back to sleeping well at night.)
Next, we keep the DERP network costs under control… by trying to never use it. When using Tailscale, almost all of your traffic goes peer to peer, so DERP is only used as a backup. We continue to improve our core product so it can build point-to-point links in [ever-more-obscure situations](/blog/how-nat-traversal-works/). When it can’t, DERP uses fair queuing, overload protection, and rate limiting to prevent abuse and spiraling bandwidth costs. And we host DERP relays around the world, close to our users, on lower-cost hosting providers that give us better deals on bandwidth. (Since the DERP relays never see your private keys, data packets[2](#fn:2), DNS traffic[3](#fn:3), or metadata[4](#fn:4), so they don’t need any more trust than a random third-party IP router on the Internet. So, this is somewhere we can save on costs without compromising security.)
Finally, of those three parts of COGS, tech support is our biggest expense, because it requires non-scalable human time. Right now, Tailscale provides [free human support](/contact/support/) to all of our users. It’s an area we’ve explicitly chosen to invest in. When our signup rate increases, we have to hire more. We take feedback from support and feed it into our documentation, and into our product, so that, yes, even our support team can scale better over time.
Luckily, we’ve observed that on average, support questions arrive mainly during the early days after a user signs up. This is common for many kinds of products. It means costs mainly scale with the *rate* of signups, not with the accumulated total number of users.
Plus, people with more advanced support questions seem to turn into paying customers more often. That means, on average, it’s worth our time to continue providing great support to everyone who asks. (When we get deluged with requests after a popular blog post or press article or interview, sometimes we have to triage. But so far we have been able to get to everyone eventually.)
All this is to say: our costs are carefully managed. Like other SaaS companies, we don’t build physical infrastructure. We avoid touching your packets—for privacy, but also to reduce our costs. We fix bugs and docs instead of answering the same questions over and over. Our control plane is lightweight, and our DERP network is cost-controlled. This allows us to maintain healthy operating margins, so that a free tier isn’t competing for resources with our paying customers.
### So are free users “the product?”
No.
If we’re going to *fix the Internet*, there’s no point only fixing it for big companies who can pay a lot. That misses the point of the whole adventure. The Internet is for everyone. We have to fix it for *everyone*, or why bother? We knew we had to design a business model and a technical architecture that removes any incentive to abuse your privacy. Providing an ever-expanding free tier is how we help as many people as possible.
On top, we provide value-added corporate control features (like [machine cert-based approval](/kb/1099/device-approval/) and [access controls](/kb/1018/acls/)) to differentiate our paid plans. Corporations seem to be excited about these corporate features. Willingness to pay for these controls is how we make more than enough money to cover all our costs.
### But Real Capitalists don’t give things away for free!
True.
Tailscale is run by Real Capitalists, or as close as you can get when two of three founders are Canadian.
So okay, maybe you don’t believe our story about making the Internet better for the good of everyone. That’s understandable; neither would I. Let me give you the capitalist version.
Tailscale’s go-to-market strategy is what we call bottom-up[5](#fn:5) growth, or product-led growth (PLG). An earlier name for this is “GTM 3.0,” which is explained beautifully in a [presentation by Adam Gross](https://www.heavybit.com/library/video/self-serve-go-to-market/), hosted by Heavybit, our earliest lead investors, who are big believers in that strategy. For some reason, [it’s not really a thing in security yet](https://medium.com/@rosshaleliuk/product-led-growth-in-cybersecurity-past-present-future-65f29d90b6d1).
To summarize: in GTM 3.0, you give away an unlimited free tier for individual use. (Not a trial, a free tier; this is what makes it different from GTM 2.0.) Then, for collaboration in small teams, you charge a bit. Then, for big company control and auditability, you charge even more. At each level, the value proposition is different, so that users use your tech differently and benefit differently from it. And at each level, the buyer is different, so the messaging is different.
For Tailscale specifically, we have several [pricing tiers](/pricing/): individuals use us for things like [Pi-hole](/kb/1114/pi-hole/), [Home Assistant](https://github.com/hassio-addons/addon-tailscale), [Minecraft](/kb/1137/minecraft/), and [Synology NAS](/kb/1131/synology/) appliances. Dev teams use [Tailscale with Gitpod](/blog/gitpod/) or [Codespaces](/blog/github-codespaces/), or to share their running [Docker containers](/kb/1112/userspace-networking/), or to [ssh into prod](/kb/1009/protect-ssh-servers/) clusters. And bigger IT teams use us as a drop-in, incrementally deployable, bottleneck removing, more secure, SSO and 2FA-enabled, company-wide replacement for their [legacy VPNs](/kb/1144/corporate-vpn/). Three different use cases, different buyers, different needs, different benefits. Same tech underneath.
The magic of this “bottom-up” marketing is that people who love Tailscale at home tend to tell their friends, and the next thing you know, they’re bringing it to work, where a dev manager or TLM pays us on a corporate credit card. Not long after that, they tell the IT and security teams how much better it is than the crufty corporate VPN, and we go through a Vendor Security Review and an interminable legalese discussion and sign a deal for tens of thousands of seats. At that point the revenues from a hundred people having fun with a hundred home Raspberries Pi, some of whom might have been willing to pay us $X, are not worth stressing about.
This bottom-up, GTM 3.0 style all falls apart if we stop giving away the free plan for free. It cramps our viral coefficient, which increases our CAC, which means we have to fight harder for every deal. We are Canadians, we hate fighting, it feels like work. All so we could charge a tax on fun? Bleh.
In capitalism we call this a win/win deal. You get free stuff. You enjoy it. You tell your boss. Your boss gives us money (eventually). And nobody’s personal information got misplaced along the way. You did pay us—by talking about us.
Try out our [free tiers](/kb/1154/free-plans-discounts/) (counterintuitively, there is more than one, because of our plan for open source projects).
1. Also one more actual comment, not included in the list above:
“Isn’t this just WireGuard + VPS with extra steps?”[↩︎](#fnref:1)
2. Even if you use Tailscale’s [exit nodes](/kb/1103/exit-nodes/) feature, they’re your exit nodes, not ours, so we still don’t ever see your public Internet traffic. Even if the route to your exit node needs to pass through our DERP network (because [NAT traversal](/blog/how-nat-traversal-works/) is blocked), all we see are encrypted packets to your exit node. We don’t know where they’re going from there. Since our code, including DERP relay server code, is open source, you can confirm this claim for yourself.[↩︎](#fnref:2)
3. If you use [MagicDNS or split DNS](/kb/1054/dns/), your public DNS queries may end up passing through your device’s local Tailscale DNS proxy, and Tailscale nodes do not log any DNS queries. Again, you can confirm this in the source code.[↩︎](#fnref:3)
4. We do receive metadata about which of your private nodes connect to which other private nodes. This is unavoidable because the job of our coordination service is to help your nodes find each other in the first place. Other than providing the service, this metadata has no value to us—it’s not like we can sell you ads based on your internal IP addresses of your own boring private servers. We never see any information about your *public* Internet or browsing activity.[↩︎](#fnref:4)
5. Pedantic note: Bottom-up is for marketing. Bottoms-up is for beer.[↩︎](#fnref:5)
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