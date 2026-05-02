October Tailscale newsletter
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|October 31, 2022
# October Tailscale newsletter
👉 We’d love to hear what you think about Tailscale, and filling out this [Google form](https://forms.gle/FA9UJwiTbdoRzKsK7) helps us build a better product for you!
It’s been a BIG month at Tailscale and we’re excited to share several new features with you. First off, [MagicDNS is now GA](/blog/magicdns/) (human-readable DNS names for each device in your tailnet). Speaking of DNS… have you ever wanted to run your own DNS resolver to block ads — but don’t *actually* want to run your own DNS resolver? [Tailscale now supports NextDNS](/blog/nextdns/). We’ve also been hard at work on [configuration audit logs](/blog/config-audit-logging/) (now in beta) so you can track changes to your tailnet, and use [webhooks](/blog/webhooks/) to get notified about changes or misconfigurations. We’re also making it safer to work remotely, even if there’s an emergency, with [Tailscale SSH Console](/blog/ssh-console) — which lets users initiate a secure browser-based SSH session from any device even if Tailscale isn’t installed on that device.
If the features above sound interesting, and you happen to be looking for a new gig, Tailscale is hiring! We’re looking for driven individuals who think differently, enjoy collaborating with highly technical remote teams, and are comfortable working asynchronously. See our open roles below, and learn more about [our company vision](/company/).
* [Developer Advocate](https://boards.greenhouse.io/tailscale/jobs/4093171005)
* [Software Engineer: Growth](https://boards.greenhouse.io/tailscale/jobs/4058901005)
* [Product Manager](https://boards.greenhouse.io/tailscale/jobs/4053245005)
* [Senior Product Designer](https://boards.greenhouse.io/tailscale/jobs/4051721005)
* [Recruiter](https://boards.greenhouse.io/tailscale/jobs/4038875005)
We’ve got lots of new community contributions and exciting new Tailscale features we’d love to tell you about, let’s check ’em out:
### From the community
[**How Fly.io and Tailscale saved Notado**](https://notado.substack.com/p/how-flyio-and-tailscale-saved-notado)
Learn the technical details of how [Notado](https://notado.app/) was modified to migrate from DigitalOcean to [Fly.io](https://fly.io/) using Tailscale to make private connections from a Fly micro VM to a DigitalOcean-managed Postgres database.
[**How Duolingo simplified developer onboarding with GitHub Codespaces + Tailscale**](https://blog.duolingo.com/developer-onboarding-with-github-codespaces/)
Duolingo shares how they made it easy for new developers to access private resources with Tailscale.
[**Run a Tailscale exit node on your phone**](https://www.youtube.com/watch?v=bN3q_F8NIH8) [video]
After updating Tailscale on his Android phone, Twitter user [@patsheadcom](https://twitter.com/patsheadcom) discovered that he can use his phone as a Tailscale exit node!
[**A CoreDNS plugin implementation for Tailscale networks**](https://github.com/damomurf/coredns-tailscale)
Twitter user [@damomurf](https://twitter.com/@damomurf) created a CoreDNS plugin for Tailscale to resolve Tailscale machines under your own domain, even with nice CNAMEs for virtual services.
[**Tailscale and TrueCharts**](https://www.youtube.com/watch?v=3hpfpKUDf2o&amp;t=1s) [video]
Twitter user [@briancmoses](https://twitter.com/@briancmoses) was thrilled when the [@useTrueCharts](https://twitter.com/useTrueCharts) team recently added a Tailscale app to their [@TrueNAS](https://twitter.com/TrueNAS) catalog to install Tailscale and share nodes.
[**WebVM: Linux virtualization in WebAssembly with full networking via Tailscale**](https://leaningtech.com/webvm-virtual-machine-with-networking-via-tailscale/)
[Yuri Iozzelli](https://leaningtech.com/author/yuri/) at [Leaning Technologies](https://leaningtech.com/) explains how Tailscale helped solve networking challenges in WebVM.
[**Netcat and Tailscale**](https://github.com/SeanHood/tailscale-netcat)
Twitter user [@SeanHood](https://twitter.com/@SeanHood) shares a tool designed to imitate netcat for the purposes of SSH’s ProxyCommand.
[**Identity management for WireGuard®**](https://lwn.net/SubscriberLink/910766/7678f8c4ede60928/)
Jordan Webb, an [LWN.net](https://lwn.net/) contributor, highlights open-source tools that can automate key management and make using WireGuard easier for both administrators and end users.
[**How to approach Tailscale security and compliance**](https://steampipe.io/blog/tailscale-security-compliance)
[Steampipe](https://steampipe.io/) evangelist [Chris Farris](https://twitter.com/jcfarris) highlights how Steampipe can help manage the security and compliance of your Tailscale network.
[**OmniAuth Strategy for authenticating via Tailscale**](https://github.com/caius/omniauth-tailscale)
An unofficial OmniAuth Strategy for authenticating via Tailscale.
[**Connecti for Tailscale**](https://github.com/jaxxstorm/connecti)
Connecti is a command line tool to quickly connect you to cloud infrastructure via Tailscale.
[**Using Tailscale on APPUiO Cloud**](https://twitter.com/tobruzh/status/1583453592735780865)
[Read more](https://www.vshn.ch/blog/vshn-hackday-tailscale-on-appuio-cloud/) about how as part of VSHN #HackDay Twitter users [@tobruzh](https://twitter.com/tobruzh) and [@**simu**](https://twitter.com/__simu__)figured out how to use Tailscale on APPUiO Cloud. More about how it works [in the docs](https://docs.appuio.cloud/user/how-to/tailscale.html).
Want to be included in future Tailscale newsletters? Tag [@Tailscale](https://twitter.com/Tailscale) in your rant, guides, or tutorials on Twitter.
### From the team
[**MagicDNS is generally available**](/blog/magicdns/)
MagicDNS automatically registers a human-readable, easy-to-remember DNS name for each device in your tailnet, and it’s now enabled by default for all new tailnets!
[**What’s in a name? Why it’s called “MagicDNS” and how it actually works**](/blog/magicdns-why-name/)
Go behind the scenes with the team to discover how MagicDNS works and why we named it what we did.
[**Use NextDNS everywhere you use Tailscale**](/blog/nextdns/)
With NextDNS and Tailscale, configure DNS exactly how you want, including blocking ads and trackers, or setting up kids’ profiles. Use NextDNS for all the devices in your tailnet, including mobile devices.
[**Use configuration audit logs (beta) to track changes in your tailnet**](/blog/config-audit-logging/)
Understand what changes were made to your Tailscale network, and who made them, with configuration audit logs.
[**Introducing a web-based SSH client: Tailscale SSH Console**](/blog/ssh-console)
SSH from your browser to devices on your Tailscale network. Initiate a secure browser-based SSH session from any device, even if you aren’t running Tailscale on that device.
[**Get notifications for events on your tailnet with webhooks**](/blog/webhooks/)
Get notifications for events on your tailnet with webhooks. You can configure webhooks to be sent to any HTTPS endpoint — for example, receiving notifications of changes to your ACLs in a Slack channel.
[**Don’t make databases available on the public internet**](/blog/introducing-pgproxy/)
Tailscale’s [Dave Anderson](https://twitter.com/dave_universetf) addresses an excellent [review of PostgreSQL security](https://innerjoin.bit.io/the-majority-of-postgresql-servers-on-the-internet-are-insecure-f1e5ea4b3da3) by the folks at [bit.io](https://bit.io/). Turns out, the vast majority of PostgreSQL connections that are happening over the public internet are insecure… but Tailscale can help!
[**Better Living Through Small Networks**](https://dojo.live/interviews/better-living-through-small-networks-avery-pennarun-tailscale/) [video]
Tailscale CEO Avery Pennarun sat down with [dojo.live](https://dojo.live/) to talk about how the internet can be a dangerous place, and what we might be able to do to make it better.
[**The Kubelist Podcast (ep. 33)**](<https://www.heavybit.com/library/podcasts/the-kubelist-podcast/ep-33-tailscale-with-avery-pennarun?utm_campaign=coschedule&amp;utm_source=twitter&amp;utm_medium=heavybit&amp;utm_content=The Kubelist Podcast - Ep. #33, Tailscale with Avery Pennarun>)
Tailscale CEO [@apenwarr](https://twitter.com/apenwarr) explores VPNs, mesh-overlay networks, Tailscale use cases, and lessons from 20+ years in development with [@mccode](https://twitter.com/mccode) of the Kubelist Podcast [@readkubelist](https://twitter.com/readkubelist).
### Tailscale customer stories
Learn how Tailscale simplifies networking and brings peace-of-mind to teams of any size.
[**How Mercari improved accessibility, security, and made VPNs simple with Tailscale**](/customers/mercari/)
Tokyo-based e-commerce company [Mercari](https://www.mercari.com/) switched to Tailscale for its VPN solution and concludes: “It’s like magic.”
[**Machinify gets HITRUST with low overhead using Tailscale SSH and ACLs**](/customers/machinify/)
[Machinify](https://www.machinify.com/home/) rolled out Tailscale to help meet strict healthcare compliance requirements. Machinify principal engineer Gavin Ray reflects: “It was the most joyous experience I’ve had with any commercial product.”
### Tailscale learning library
We are building a learning library to help folks at any stage in their career. If you have a topic you’d like to see covered, send us a tweet [@Tailscale](https://twitter.com/Tailscale).
[**Identity and access management**](/learn/identity-and-access-management/)
Identity and access management (IAM) helps keep your organization’s resources and information secure. Learn the principles of IAM and best practices for implementing it.
That’s all for now. Stay well!
🔈 P.S. Leaving a review on G2 helps more teams find Tailscale. We don’t ask this often — but we’d really appreciate it if [you took the time to put in a good word](https://www.g2.com/products/tailscale/reviews/start?return_to=https://www.g2.com/products/tailscale/take_survey).
Share
Author
Laura Franzese
Author
Laura Franzese
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