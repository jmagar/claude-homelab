Border0 is joining Tailscale
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|companyMarch 17, 2026
# Border0 is joining Tailscale
If you haven’t run into Border0 before, they’re a Vancouver-based startup focused on a familiar security problem: how to manage access to sensitive infrastructure. Think production systems, databases, Kubernetes, and other environments where access needs to be tightly controlled and auditable.
A lot of people call this “Privileged Access Management,” or PAM. It’s a useful label, but it’s also a bit of a difficult category. A lot of tools are overcomplex or hard to deploy, making it hard to benefit from them without slowing down your team.
The goal is simple. Implementations often aren’t.
## [From ‘can I connect?’ to ‘should I?’](#from-can-i-connect-to-should-i)
Tailscale started with secure connectivity: make it easy for devices and services to talk to each other, using identity, encryption, and direct connections whenever possible.
That solved a lot of painful problems: VPN hairballs, NAT traversal misery, and a lot of “Why can’t I just reach my own server?”
But it also gave teams something more important: a foundation for deciding who should be able to reach what, under what conditions, with a clear record of how that access was granted. In other words, Tailscale already handles a big part of what people need from modern access systems: connectivity, identity-based permissions, and auditability at the network layer.
Once you move from “Can this machine reach that machine?” to “Who should be allowed into this database, cluster, or admin interface, for how long, and with what visibility into what happened after they got there?”, the problem changes shape a bit.
That’s where Border0 fits.
They’ve been building the application connectivity and authorization layer: protocol-aware controls, session visibility, approval workflows, and the machinery that sits closer to the application itself. Those are exactly the kinds of things that are hard to bolt on later, and even harder to do well without making the whole system miserable to use.
What impressed me about Border0 wasn’t just the feature list. It was that they were approaching the problem with the same instincts we care about: identity-first, easy to deploy, and usable by actual humans.
From left: Avery Pennarun, CEO; Andree Toonk, now Director of Engineering (formerly CEO of Border0), and David Carney, Chief Strategy Officer.## [From prototype to platform](#from-prototype-to-platform)
I met Andree Toonk, Border0’s founder, last year at the RSA Conference in San Francisco. He showed me a demo of a user-friendly access system built on a WireGuard backend. The demo was good, but what stuck with me more was the instinct behind it: make secure access usable enough, and easy enough to deploy, that teams don’t immediately try to bypass it.
I told him, “That’s really cool. If you want to make it easier for customers to roll out, you should build it on [tsnet](https://tailscale.com/docs/features/tsnet).”
And he did.
In November we ran into each other again at AWS re:Invent. Andree showed up with a new version, fully integrated with Tailscale. That changed the whole picture. Now the access workflow could sit on top of the identity, NAT traversal, and policy foundation that tens of thousands of customers already use with Tailscale.
From there, it stopped being a question of “Can we partner?” and became “What could we build if we were all on the same team?” The more we dug in, the more it looked like a shared roadmap and a shared philosophy: strong security, minimal ceremony, and a system that people actually use.
So today I'd like to introduce you to Border0 … by Tailscale. Border0 is now part of Tailscale, and we're very glad to have the team here.
## [What this means for you](#what-this-means-for-you)
If you’re evaluating privileged access management right now, [talk to us about Border0](https://tailscale.com/contact/sales-border0). It covers the practical workflows teams usually need: SSH and Kubernetes access, remote admin (RDP and VNC), database access controls, session recording, and detailed command and query visibility. That’s basically the “PAM starter pack” most teams are looking for: tight access controls, good visibility, and an audit trail you can trust.
It’s also already fully integrated with Tailscale, so it can sit on top of your existing tailnet, identities, and policies. Over time, we’ll pull these capabilities closer into the Tailscale experience and build out a more native Tailscale PAM offering on top of the same foundation.
On the practical side, like what changes for Border0 customers or what happens next, [we’ve put those answers in an FAQ](http://tailscale.com/resources/border0-and-tailscale-faq).
We’re excited to have the Border0 team here. We’re super excited to build together.
[**Come try out our new PAM product!**](https://tailscale.com/contact/sales-border0)
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