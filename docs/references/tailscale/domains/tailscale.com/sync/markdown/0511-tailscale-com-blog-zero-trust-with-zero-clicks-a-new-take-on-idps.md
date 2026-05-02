Zero trust with zero clicks, a new take on IdPs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|insightsSeptember 22, 2025
# Zero trust with zero clicks, a new take on IdPs
tsidp is a lightweight OIDC/OAuth server that leverages Tailscale's cryptographically guaranteed network identity to eliminate authentication prompts while also improving security posture. With Tailscale and tsidp, it’s even possible to securely isolate and authorize MCP servers for private AI deployments with minimal effort.
I’m tired of logging into things. I’m *really* tired of *re*-logging into things. Oh, I need to rotate my unique, randomly generated 32-character password? Really? I’m already two minutes late to my next meeting, and now I have to find my phone for a 2FA code, too? Fine. I guess I’ll be three minutes late.
One of our most-read blog posts is on how [frequent reauth doesn’t make things more secure](https://tailscale.com/blog/frequent-reauth-security). As a matter of fact, it may even make things worse, especially with the rise of techniques like [MFA exhaustion attacks](https://www.bleepingcomputer.com/news/security/mfa-fatigue-hackers-new-favorite-tactic-in-high-profile-breaches/). Add in password rotation and complexity requirements, and now a password manager (*another* password + login!) becomes necessary to manage it all.
But what if I only had to manage a single password? That’s not *so* bad, right? That’s what SSO promised, and it worked out rather well, especially in the enterprise. But wait — why did I have to log in again, right before my meeting? Just to click a picture of my face, which I’ve already done five times today.
That’s because at some point, a [SOC](https://en.wikipedia.org/wiki/System_and_Organization_Controls) audit forced a security team to make a decision that sessions should expire every 1, 7, 30 days. Look, I’m not saying that it’s an entirely unreasonable request to confirm I’m still the person sitting at my laptop. But didn’t I already log into it, the VPN, and the five other apps that prompted me this morning? Why do I need to do it again when I’m already three minutes — no, wait — *four* minutes late to my meeting?
This tedious dance that I, and you, have to do at the end of every arbitrary, determined-by-committee, audit-enforced interval, where everyone can still feel reasonably secure? This is why we built tsidp.
[tsidp](https://github.com/tailscale/tsidp) takes the fact that you’ve already logged into the corporate network and seamlessly passes along that information to all the local, SaaS, and AI applications as you go to log in. No extra clicks. No extra codes. No extra passwords or passkeys. Just you, your computer, and now five extra minutes you have back in your day.
## [Zero click, surely that can't be safe?](#zero-click-surely-that-cant-be-safe)
Yep, I know what you’re thinking: Reducing authentication steps can’t be safe, right? Let me walk through how tsidp, combined with Tailscale’s identity-first networking approach, does it.
tsidp itself is a lightweight OIDC (OpenID Connect) & OAuth Authorization server that leverages your existing IdP (Identity Provider) and runs inside of your private Tailscale network (tailnet). To any application that supports a custom auth provider, tsidp presents itself as an IdP just like Google, Entra ID, Okta, etc. After registering a locally hosted or SaaS application with tsidp and configuring tsidp as the auth provider, users authenticating into the app will be redirected to tsidp, their identity verified, and then immediately redirected back.
Every network request that happens over Tailscale comes with the identity of the requestor attached. Identity quite literally accompanies every packet. This identity, sourced from the existing corporate IdP used for the tailnet and guaranteed cryptographically by Tailscale thanks to WireGuard®, is passed to the tsidp server via a [tsnet](https://tailscale.com/kb/1244/tsnet) (a library that enables embedding Tailscale directly into a Go program). Using this identity, as well as additional metadata passed to tsidp via [application capabilities grants](https://tailscale.com/kb/1537/grants-app-capabilities), tsidp is able to authenticate the user and pass along additional information via OAuth claims to the app. All of this happens in real time, giving instant security without any user action.
Here’s where things get extra interesting for security teams, as well as end users. Tailscale’s access policy rules include additional information called [device postures](https://tailscale.com/kb/1288/device-posture). Device postures let you control access to network resources based on device attributes: IP geolocation, MDM management status, CrowdStrike Falcon score, OS version, JIT (Just-in-Time) access rules, and more. Using access policies with device postures enables the consolidation of network, local, and SaaS application access rules into a single location.
## [Now for AI & MCP!](#now-for-ai-and-mcp)
I wouldn’t be writing a blog post in 2025 if I didn’t mention AI or MCP (Model Context Protocol) at some point. As it turns out, tsidp has something for folks trying to securely experiment with MCP deployments as well. The MCP committee recently adopted OAuth as the preferred way of supporting authorization for MCP use cases. It’s a great first step. The problem is that the committee adopted not just the popular parts of OAuth, but some of the less-commonly-supported aspects as well.
In theory, this means that to use MCP as intended as part of an enterprise deployment, you would need to switch IdPs. That’s not exactly something you can do on a whim. If you’re using tsidp, however, it can make your existing IdP MCP compliant, as it already supports less common specifications, like [Dynamic Client Registration (DCR)](https://tailscale.com/blog/dynamic-client-registration-dcr-for-mcp-ai) and Security Token Service (STS). With Tailscale and tsidp, it’s possible to securely isolate and authorize MCP servers, gateways, and clients on your network, without a new IdP.
## [We’re just getting started with tsidp](#were-just-getting-started-with-tsidp)
You've already heard me say it, but I mean it. I’m sick of logging in to applications over and over again. It’s not something you need to do. While I didn’t touch on it too much here, if you’ve been experimenting with authenticated MCP servers, you realize how much worse the login experience can get with constant prompts from each server.
If you’re looking to make life at work (or in your homelab) a little easier, check out [tsidp](https://github.com/tailscale/tsidp) today. You can also join the conversation in the[ #tsidp channel on Discord](https://discord.gg/tailscale) or file an[ issue or feature request on GitHub](https://github.com/tailscale/tsidp/issues).
Share
Author
Remy Guercio
Author
Remy Guercio
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