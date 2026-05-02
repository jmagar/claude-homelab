Tailscale March newsletter
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|March 31, 2023
# Tailscale March newsletter
👉 We want to hear from you: How can we[improve Tailscale](https://docs.google.com/forms/d/e/1FAIpQLSdUzQfTOTaurTbviJO4_vbipN8JpbZr7_OLkxqlODZXnkF_tQ/viewform)?
March has flown by! All month long, we’ve been heads-down getting some cool new features over the finish line and into your hands. For example: Tailscale has long supported using Google, GitHub, and other popular identity providers for logging into your tailnet, and now we’ve introduced[custom OIDC](/blog/custom-oidc/)(beta), which allows you to use Tailscale with the OpenID Connect-compliant identity provider of your choice. You can also make new users’ onboarding process less daunting by[inviting](/kb/1064/invite-team-members/)them to join your tailnet, while [user approval](/kb/1239/user-approval/) lets you prevent people in your organization from joining your tailnet until they’ve been approved by an admin. And with[Funnel](/blog/tailscale-funnel-beta/), now in beta, you can share a web server on your private tailnet with the public internet to do all kinds of things, such as access a local development server or host a blog.
Also high on our priority list has been gearing up for two notable in-person events, both in San Francisco. We’ll be attending RSAC 2023 — stop by our booth (#4106) to say hello and check out our latest features.And we are*particularly*thrilled to be hosting our first in-person community conference,[Tailscale Up](https://tailscale.dev/up), featuring speakers Amye Scavarda Perrin, Justin Garrison, Emily Trau, Corey Quinn, and more to be announced soon. We are partnering with Dogpatch Studios in SF to host this event, and we’re excited to share more details about content, food, and more in the coming weeks.
🚀 Tailscale keeps on growing… and we’re hiring! We’re looking for people who are ridiculously passionate about security, enjoy collaborating with highly technical remote teams, and are comfortable working asynchronously. See open roles at our [Careers page](/careers/), and learn more about[our company vision](/company/).
We’ve got a bunch of community contributions and new Tailscale features to share this month. Let’s jump in:
**From the community**
[**Grid VMs + Tailscale**](https://www.youtube.com/watch?v=Boqjo6WS7SM)(video)
YouTube channel[ThreeFold](https://www.youtube.com/@ThreeFoldFoundation)explores using Tailscale to connect to your VMs on Threefold with high performance: “See how easy it is to connect to virtual machines on the Grid using Tailscale, without needing public IPs, gateways, or Planetary Network.”
[**Copy and paste with Tailscale**](https://twitter.com/hemarkable/status/1632295127032156160)(video)
Twitter user[@hemarkable](https://twitter.com/@hemarkable)shares, “I always wanted to easily copy-paste text across my devices, as it is something I do a lot. With[@Tailscale](https://twitter.com/Tailscale)I can.”
[**Discovering and connecting Elixir nodes over Tailscale
**](https://github.com/moomerman/libcluster_tailscale)GitHub user[Richard Taylor](https://github.com/moomerman)shares a read-me guide to a libcluster strategy for discovering and connecting Elixir nodes over Tailscale.
[**How to install Tailscale on Flatcar for VPN access
**](https://learn.umh.app/course/installing-tailscale-on-flatcar/)Learn how to install Tailscale on Flatcar to gain VPN access to your UMH instances on edge devices to ensure secure and reliable remote access to your IT/OT infrastructure. Written by[Jeremy Theocharis](https://learn.umh.app/instructor/jeremy/).
[**Globally distributed Elixir over Tailscale
**](https://www.richardtaylor.dev/articles/globally-distributed-elixir-over-tailscale)On his blog,[Richard Taylor](https://www.richardtaylor.dev/)shares “the result of my exploration of Elixir clustering and automating global network discovery and connection over Tailscale.”
[**Tailscale: A VPN for the rest of us? You bet!
**](https://blog.smittytone.net/2023/03/10/tailscale-a-vpn-for-the-rest-of-us-you-bet/)Tony Smith of the[Smittytone Messes with Micros](https://blog.smittytone.net/about/)blog shares, “I connected my office and home computers, tablet, and NAS with Tailscale… and very nicely it works, too.”
[**Tailscale takes all the “fun” out of VPNs
**](https://spin.atomicobject.com/2023/03/13/tailscale-vpns/?utm_source=twitter-ao&amp;utm_medium=social&amp;utm_campaign=tailscale-vpns)Over at[Atomic Object](https://www.atomicobject.com/),[Mattie Behrens](https://spin.atomicobject.com/author/mattie-behrens/)writes that “Tailscale uses the WireGuard protocol. What it does differently from WireGuard, though, is make it almost effortless to build and configure.”
[**Tailscale: fast and easy VPNs for developers
**](https://www.infoworld.com/article/3690616/tailscale-fast-and-easy-vpns-for-developers.html)[Martin Heller](https://www.infoworld.com/author/Martin-Heller/)from[InfoWorld](https://www.infoworld.com/)shares a post on Tailscale: “Simple and affordable Tailscale allows you to create an encrypted, peer-to-peer virtual network using the secure WireGuard protocol, without generating public keys or constantly typing passwords.”
[**How to reach any of your devices from anywhere with Tailscale
**](https://zapier.com/blog/what-is-tailscale/)Matt Haughey from[Zapier](https://zapier.com/)tried Tailscale and concludes: “Tailscale is a remarkably powerful app that protects you on random Wi-Fi networks, offers convenient ways to connect to your devices, and means that leaving a file at work or home is never going to block a project of yours from being completed again.”
**From the team**
[**Introducing custom OIDC
**](/blog/custom-oidc/)Tailscalars[Charlotte Brandhorst-Satzkorn](https://twitter.com/catzkorn)and[Tom D’Netto](https://twitter.com/Twitchyliquid64)write that whether you’re an enterprise customer with complex identity requirements or a privacy-minded power user self-hosting your own authentication solution — you’re now able to use Tailscale with an OpenID Connect (OIDC) compliant identity provider of your choice.
[**Invite and review users joining your tailnet
**](/blog/invite-users/)Now you can make onboarding new users to Tailscale even easier by[inviting](/kb/1064/invite-team-members/)them to join your tailnet. Inviting teammates helps make sure they’re onboarded with the right[role](/kb/1138/user-roles/)so they can quickly get to work. We’ve also made it possible to prevent new users in your organization from joining your tailnet until they’ve been approved by an admin, with[user approval](/kb/1239/user-approval/).
[**Tailscale Funnel now available in beta
**](/blog/tailscale-funnel-beta/)Tailscale Funnel, a tool that lets you share a web server on your private tailnet with the public internet, is now available as a beta feature for all users. With Funnel enabled, you can share access to a local development server, test a webhook, or even host a blog.
Want to know even more about Funnel? Check out this “Ask a Tailscale Engineer” video:
Tailscale's Brad Fitzpatrick and Jeff Spencer talk shop about Funnel
**Tailscale in real life + virtually**
[**Join us for Tailscale Up!**](http://tailscale.dev/up)(Dogpatch Studios, San Francisco)
In case you missed it, we’re bringing Tailscale out of the network layer and into the real world with Tailscale Up, the first-ever in-person Tailscale community conference, on Wednesday, May 31. Meet Open Source maintainers, hardware hackers, self-hosters, and Tailscalars (sometimes all the same person) to share stories and workflows, and to hear about the latest projects and integrations we’ve been working on.
We are pleased to announce our first batch of speakers:
* **Amye Scavarda Perrin:**“Your Family Needs Tailscale”
* **Justin Garrison:**“Build Your Own Game Streaming Service”
* **Emily Trau:**“All the Buttons”
* **Corey Quinn:**“The Managed NAT Gateway Time Machine”
[Learn more and register here!](https://tailscale.dev/up)And to stay up to date on the latest developments and announcements about Tailscale Up, follow[our Twitter](https://twitter.com/tailscale)and[our fediverse account](https://hachyderm.io/@tailscale).
[**Tailscale is a proud sponsor of the RSA Conference 2023!**](https://www.rsaconference.com/usa)(San Francisco)
Tailscale will be sponsoring the leading global information security conference, RSAC, April 24–27 in San Francisco. If you’re also attending, we’d love it if you stopped by booth #4106 to say hello, learn more about our latest features, and enter our sweepstakes for a chance to win a 256GB Steam Deck. Hope to see you there!
**Customer stories**
[**Duolingo uses Codespaces and Tailscale for secure remote development
**](https://diginomica.com/duolingo-uses-codespaces-and-tailscale-secure-remote-development)Journalist[Madeline Bennet](https://diginomica.com/author/madeline-bennett)writes in[diginomica](https://diginomica.com/)about how Tailscale helped Duolingo solve thorny firewall problems and move their development environment to the cloud.
**Tailscale learning library**
We are building a learning library to help folks at any stage in their career and to highlight ways Tailscale can help solve the problems your team faces. If you have a topic you’d like to see covered, send us a tweet[@Tailscale](https://twitter.com/Tailscale).
[**Understanding cloud access security brokers (CASBs)
**](/learn/understanding-cloud-access-security-brokers/)A cloud access security broker (CASB) is a cloud-hosted tool that serves as an additional layer of security between users and cloud service providers. This article explores what CASBs are, their pros and cons, and how they compare to VPNs.
[**Security information and event management (SIEM)
**](/learn/security-information-and-event-management/)At the most basic level, SIEM solutions perform data aggregation, consolidation, and sorting functions in order to identify threats and help your organization adhere to data compliance requirements. This article discusses what SIEM is, why it matters for securing an enterprise, and the cybersecurity use cases it can enable.
[**Bastion hosts vs. VPNs
**](/learn/bastion-hosts-vs-vpns/)Bastion hosts can be a valuable resource for companies, improving security and limiting access to shared resources. However, it may not be necessary to use a bastion host when resources can be accessed directly from your network. This article explores what bastion hosts are, what they’re used for, their limitations, and how they compare to VPNs such as Tailscale.
[**Tailscale can help you become SOC 2 compliant
**](/learn/tailscale-helps-soc2/)Tailscale can help you meet the ongoing requirements for SOC 2 certification. (We know, both from first-hand experience as Tailscale users and as a company that recently passed our SOC 2 audit.) This article details how.
That’s all for now. Stay well!
🔈Thank you for taking the time to[leave us a G2 review](https://www.g2.com/products/tailscale/reviews/start?return_to=https://www.g2.com/products/tailscale/take_survey)!
Share
Author
Mark Ogilbee
Author
Mark Ogilbee
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