Tailscale February newsletter
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|February 28, 2023
# Tailscale February newsletter
👉 We’d love to hear what you think about Tailscale, and filling out this[Google form](https://forms.gle/FA9UJwiTbdoRzKsK7)helps us build a better product for you!
We’re excited about what’s been happening at Tailscale this month![Configuration audit logs](/blog/config-audit-logging-ga/)are now generally available for all Tailscale users, and we’ve announced a new integration that lets your[CodeSandbox](/blog/codesandbox/)Repository access private resources on your tailnet. We’ve also introduced changes to make it easier to manage your billing with the[Billing Admin](/blog/billing-admin/)role, and we’ve launched improvements for[supporting OAuth in the Tailscale API](/blog/oauth/). And last — but absolutely not least — we’re announcing our first in-person Tailscale community conference,[Tailscale Up](/blog/tailscale-up-2023/).
🚀 Plus, we’re hiring! We’re looking for driven individuals who think differently, enjoy collaborating with highly technical remote teams, and are comfortable working asynchronously. See open roles at our [Careers page](/careers/), and learn more about[our company vision](/company/).
We’ve got lots of community contributions and new Tailscale features to share. Let’s jump in:
**From the community**
[Tailscale packages for Turris OS
](https://github.com/mato/tailscale-turris)GitHub user[Martin Lucina](https://github.com/mato)shares “code to run a Turris OS package feed source for automatic updates of Tailscale on your Turris OS router.”
[Exploring the Tailscale–Traefik Proxy integration
](https://traefik.io/blog/exploring-the-tailscale-traefik-proxy-integration/)[Traefik Labs](https://traefik.io/)explores two main ways Traefik Proxy uses Tailscale — one based on the utilization of the TLS management feature, and one bonus story for nerds!
[Anil Dash on Mastodon joining Fastly’s open source program (featuring Tailscale)
](https://thenewstack.io/anil-dash-on-mastodon-joining-fastlys-open-source-program/)Tech journalist[Richard MacManus](https://mobile.twitter.com/ricmac)reports: “I talk to the one and only @anildash about how his company @fastly is helping to fund #Mastodon, and a new web stack he’s floated based on Fediverse + Wasm + Tailscale + SQLite.”
[Tailscale running on pfSense software
](https://www.netgate.com/blog/tailscale-on-pfsense-software?utm_content=236081789&amp;utm_medium=social&amp;utm_source=twitter&amp;hss_channel=tw-435119060)[Christian McDonald](https://www.netgate.com/blog/author/christian-mcdonald)from[Netgate.com](https://www.netgate.com/)shares: “In this video, we introduce Tailscale running on pfSense and demonstrate a common site-to-site deployment scenario. What makes this scenario unique is that both remote sites are behind NAT firewalls with no open ports on WAN.”
[Obtaining a TLS certificate for Tailscale HTTPS dynamically with Traefik](https://dev.classmethod.jp/articles/traefik-integrates-with-tailscale/)(Japanese)
Twitter user[Ryuta Otak](https://twitter.com/takipone)shares, “Until now, Tailscale CLI and Caddy have supported certificate acquisition, but now it can be used with the OSS reverse proxy Traefik, so I will introduce how I tried it.”
[Using Tailscale with Nix
](https://maulana.id/soft-dev/2023--01--30--00--using-tailscale-with-nix/)Nix and NixOS support for the Tailscale network — brought to you by[Maulana.id](https://maulana.id/).
[Is it time for you to set up Tailscale ACLs?](https://blog.patshead.com/2022/10/is-it-time-for-you-to-set-up-tailscale-acls.html)
[Pat Regan](https://twitter.com/intent/user?screen_name=patsheadcom)shares a video on using Tailscale SSH: “Pretty much every computer I own has been running Tailscale for more than a year now.”
[A private event logger and job monitor for tailnets
](https://github.com/rverton/tevents)Twitter user[@RobinVerton](https://twitter.com/RobinVerton)made a service for @tailscale networks that allows you to centrally collect events in your network and display them on a web interface.
[Striking the right balance between development and security
](https://betanews.com/2023/02/10/striking-the-right-balance-between-development-and-security-qa/)Ian Barker from Beta News spoke to Avery Pennarun: “Add in the challenges of securing remote working and it’s clear that there’s a tricky balancing act needed to enable development while keeping the organization secure.”
[Leverage Tailscale webhooks to ingest audit events into Azure Log Analytics
](https://github.com/jaredhaight/TailscaleLogAnalyticsIngestor)GitHub user[@jaredhaight](https://github.com/jaredhaight)“wrote up a little server that forwards @tailscale audit events to #azure log analytics.”
**From the team**
[We ❤️️ integrations
](/blog/we-love-integrations/)Tailscale is, at its heart, network infrastructure. Our[Integrations page](/integrations/)gives you a long list of where you can use Tailscale, so that you can easily see if it works with your infrastructure, but — spoiler alert — Tailscale works almost everywhere.
[Manage pricing and billing with Billing Admin
](/blog/billing-admin/)If you have a large organization, you typically have a finance or accounting team that manages your spend on technology, but not the technology itself.[Claire Wang](https://github.com/clairew)and[Maya Kaczorowski](https://twitter.com/MayaKaczorowski)announce two changes to make it easier for you to manage billing: We’re introducing a new[Billing Admin](/kb/1138/user-roles/)role, and allowing individuals with the[Admin](/kb/1138/user-roles/)role to now manage billing.
[Reducing Tailscale’s binary size on macOS
](/blog/macos-binary-size/)Member of technical staff[Mihai Parparita](https://persistent.info/)describes his detective work in reducing Tailscale’s binary size in v1.36 — and reducing download and update times for everyone.
[Tailscale for DevOps: Give CodeSandbox access to private resources on your tailnet
](/blog/codesandbox/)Tailscalar[Jeff Spencer](https://www.linkedin.com/in/jeff393/)explains how[CodeSandbox](https://codesandbox.io/)lets you rapidly develop and share code in remote environments, even from mobile devices such as your phone or iPad. Having Tailscale set up means that you can also grant bi-directional access from containers in your CodeSandbox Repository environment to private resources in your tailnet.
[Configuration audit logs are generally available
](/blog/config-audit-logging-ga/)We’re pleased to announce that[configuration audit logs](/kb/1203/audit-logging/)are now generally available for all Tailscale users. Configuration audit logs record changes made to your Tailscale network’s (or tailnet’s) configuration.
[Supporting OAuth in the Tailscale API
](/blog/oauth/)Tailscalars[Will Norris](https://willnorris.com/)and[Jordan Whited](https://twitter.com/jordanwhited)share two improvements for authenticating to the Tailscale API: the ability to create scoped access tokens limited to specific operations, and the ability to continually generate or refresh access tokens using OAuth clients.
[Tailscale actions for iOS and macOS Shortcuts
](/blog/ios-macos-shortcuts/)[Mihai Parparita](https://persistent.info/)outlines how starting with Tailscale v1.36 (and in no small part thanks to[user feedback](https://github.com/tailscale/tailscale/issues/2504)!), Tailscale actions can be directly triggered and automated with Shortcuts on iOS and macOS.
**Tailscale in real life + virtually**
[Announcing “Tailscale Up” community conference](/blog/tailscale-up-2023/)(San Francisco)
We’re bringing Tailscale out of the network layer and into the real world with Tailscale Up, the first-ever in-person Tailscale community conference, on May 31. Meet Open Source maintainers, hardware hackers, self-hosters, and Tailscalars (sometimes all the same person) to share stories and workflows, and hear about the latest projects and integrations we’ve been working on.
To stay updated on the latest developments and announcements about Tailscale Up, follow[our Twitter](https://twitter.com/tailscale)and[our fediverse account](https://hachyderm.io/@tailscale), and you can[purchase tickets here](https://ti.to/tailscaleup/2023).
[Bringing Tailscale to work webinar + Q&A, hosted by Tailscale CEO and co-founder Avery Pennarun
](https://docs.google.com/forms/d/e/1FAIpQLSex2zXcZj0EFz5E1zgZ_24tKKHJ0aw1SRd7N9KIw24M3i2hlg/viewform)On March 9, at 1 p.m. PT (4 p.m. ET),[@apenwarr](https://twitter.com/apenwarr?lang=en)will discuss why companies are adopting Tailscale, and answer as many questions as possible. Register at the link above to come learn or share your insights with industry peers!
[Building virtual networks with Pulumi and Tailscale](https://www.youtube.com/watch?v=6JejC_bx8Yg)(video)
This workshop demonstrates how to use the Pulumi Tailscale provider to create virtual machines in AWS and securely connect them without needing to create and manage firewall rules.
[SCALE & DevOpsDays LA
](https://devopsdays.org/events/2023-los-angeles/welcome/)On March 10, Tailscale is sponsoring the coffee break at SCALE during DevOpsDays LA — a colocated event.
[Women Impact Tech 2023](https://womenimpacttech.com/)(San Francisco)
On March 22, Tailscale’s Head of Product[Maya Kaczorowski](https://twitter.com/MayaKaczorowski)will join the panel discussion “[The Importance of Cutting-edge Security and How to Combat Data Breaches](https://events.bizzabo.com/womenimpacttechsanfrancisco2023/agenda/session/1063664)” to discuss cloud security and managing visibility, accessibility, and risk.
**Customer stories**
Learn how Tailscale simplifies networking and brings peace of mind to teams of any size.
[Instacart reduces developer disruption with Tailscale
](/customers/instacart/)At one time, Instacart relied on eight different VPNs, resulting in lost time and productivity. But no more! “Because of Tailscale’s simplicity, both in architecture and end user experience, we can solve our acute problems quickly and easily.”
[Shiguredo uses Tailscale to solve the issues that arise with cloud services using bare-metal servers](/customers/shiguredo/)(Also:[in Japanese](/ja/customers/shiguredo/)!)
Software developers Shiguredo Inc. says, “Thanks to Tailscale, we are able to keep the cost of our services low, and we are also able to increase availability.”
**Tailscale learning library**
We are building a learning library to help folks at any stage in their career. If you have a topic you’d like to see covered, send us a tweet[@Tailscale](https://twitter.com/Tailscale).
[Work-from-home security: Managing remote network access
](/learn/work-from-home-security/)Among the many challenges that the work-from-home model brings, security is chief among them. Safeguarding employee networks involves choosing a secure VPN, providing proper employee support, and avoiding common mistakes associated with managing VPNs.
[How does a VPN protect you?
](/learn/how-vpn-protects-you/)A reliable VPN is critical for ensuring that remote workers can access internal company resources without putting sensitive data at risk. In this article, we discuss what VPNs are and how they protect your organization’s infrastructure, along with some common VPN protocols and strategies for choosing the best VPN for your needs.
[What is a System for Cross-domain Identity Management (SCIM)?
](/learn/what-is-scim/)SCIM is a standardized specification designed to manage user identity across multiple cloud-based applications and services cheaply, easily, and quickly. We take a closer look in this article.
That’s all for now. Stay well!
🔈P.S. Leaving a review on G2 helps more teams find Tailscale. We’d really appreciate it if[you took the time to put in a good word](https://www.g2.com/products/tailscale/reviews/start?return_to=https://www.g2.com/products/tailscale/take_survey).
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