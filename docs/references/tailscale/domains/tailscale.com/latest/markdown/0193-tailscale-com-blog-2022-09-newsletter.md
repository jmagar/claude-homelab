September Tailscale newsletter
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|September 30, 2022
# September Tailscale newsletter
👉 We’d love to hear your thoughts on Tailscale. Filling out this feedback form helps us build a better product for you:[https://forms.gle/FA9UJwiTbdoRzKsK7](https://forms.gle/FA9UJwiTbdoRzKsK7)
This month we’re making sharing nodes a*rewarding*experience! When you share a node with a unique user and they accept the invitation, we’ll increase the device limit on both your accounts by two. The rewards will be reflected in your device limits on your[Billing page](https://login.tailscale.com/admin/settings/billing). (Don’t worry, if you happened to do this before we officially launched our rewards, your device count has been automatically updated.)
Tailscale is growing! We’re looking for motivated individuals who can think on their feet, enjoy collaborating with highly technical teams, and are comfortable working asynchronously. See our open roles below, and learn more about[our company vision](/company/).
* [People Operations Manager](https://boards.greenhouse.io/tailscale/jobs/4094399005)
* [Developer Advocate](https://boards.greenhouse.io/tailscale/jobs/4093171005)
* [Software Engineer: Growth](https://boards.greenhouse.io/tailscale/jobs/4058901005)
* [Product Manager](https://boards.greenhouse.io/tailscale/jobs/4053245005)
* [Senior Product Designer](https://boards.greenhouse.io/tailscale/jobs/4051721005)
It was a busy September. We have lots of community and Tailscale contributions to spotlight. Let’s jump in:
### From the community
* [**Tailscale gets hot: NAT traversal and zero config VPN**](https://twit.tv/shows/floss-weekly/episodes/696)
Floss Weekly interviews Avery Pennarun: “Since Pennarun’s last appearance, Tailscale has received $100 million in funding to push the service into the mainstream further, all while honoring[open source values](/blog/opensource/).”
* [**Tailscale — An update**](https://tech.davidfield.co.uk/2022/08/27/tailscale-an-update/)
David Field shares: “Over the last year, because of improvements to Tailscale, I’ve added some features which have some bonuses to making life easier to manage a home or business infrastructure.”
* [**Migrating Kafka to Amazon MSK**](https://medium.com/voltus-engineering/migrating-kafka-to-amazon-msk-1f3a7d45b5f2)
A detailed story about a complex migration from self-managed Kafka to managed Kafka on Amazon MSK using Tailscale. By Leo Robinovitch.
* [**Configure your Raspberry Pi as a gateway with Pantavisor and Tailscale**](https://pantacor.com/blog/tailscale-gateway-pantavisor/)
Pantacor shares how to create a VPN gateway with Tailscale and Pantavisor on a Raspberry Pi 3.
* [**Interview with Dave Hamilton — CEO of BackBeat Media, Mac Geek Gab, Gig Gab, and Business Brain Podcasts**](https://commandcontrolpower.com/podcast/2022/8/21/480-interview-with-dave-hamilton-ceo-of-backbeat-media-mac-geek-gab-gig-gab-and-business-brain-podcasts)
Command Control Power podcast mentions, “a tip that Jerry heard on Dave’s show was about Tailscale, which makes a virtual network out of your devices, no matter where you are.”
* [**Remote access to GQRX and an Airspy HF+ SDR on an old MacBook Air**](https://vielmetti.typepad.com/w8emv/2022/09/remote-access-to-gqrx-and-an-airspy-hf-sdr-on-an-old-macbook-air.html)
Ed Vielmetti says, “The first bit of the remote access puzzle has been to install Tailscale everywhere I ever need to use a computer.”
* [**Using Tailscale for home lab VPN connectivity**](https://lostdomain.org/2022/09/12/using-tailscale-for-home-lab-vpn-connectivity/)
Got a home lab? Need access wherever you are? According to Lostdomain, Tailscale solves all the problems.
* [**Trayscale and Tailscale**](https://github.com/DeedleFake/trayscale)
GitHub user DeedleFake shares Trayscale, an “unofficial GUI wrapper around the Tailscale CLI client, particularly for use on Linux, as no official Linux GUI client exists.
* [**cURL + Apache in a Tailscale network**](https://www.youtube.com/watch?v=ydEA-NTtf2U) (video)
YouTube user Stefan Eissing shares his “curl://up 2022 presentation on how to make your own internet using Tailscale and a bit of cURL and Apache.”
* [**Your old Android device can be your VPN server**](https://www.youtube.com/watch?v=Uu-zwV3wvPE) (video)
YouTube channel MRP details how to convert your old Android device into a VPN server with help from Tailscale. Setup takes just 60 seconds!
* [**Tailscale load balancer**](https://github.com/zombiezen/tailscale-lb)
GitHub user zombiezen (aka Ross Light) presents “a basic load-balancer for forwarding Tailscale TCP traffic. This is useful for setting up virtual IPs for services on Tailscale.”
* [**Tailscale 1Password secrets automation proxy**](https://github.com/peterkeen/tailscale-op-proxy/)
GitHub user Pete Keen created a way to “securely access secrets from 1Password Secrets Automation without using a bunch of 1Password Secrets Automation tokens while exploiting Tailscale ACL tags.”
* [**The many ways to manage access to an EC2 instance**](https://blog.symops.com/2022/09/22/ec2-access/)
Mathew Pregasen explains how to get out of the key and user management business: “Tailscale’s SSH is built on their mesh VPN technology which lets you connect from one device to any other, including your production servers, directly. Plus, Tailscale[**integrates with Sym**](https://blog.symops.com/2022/08/03/tailscale-integration-announcement/)!”
* [**Tailscale + Steampipe**](https://hub.steampipe.io/plugins/turbot/tailscale)
Steampipe is an open source CLI for various APIs. They’ve recently added Tailscale support.
Want to be included in future Tailscale newsletters? Tag us in your rant, guides, or tutorials on Twitter.
### From the team
* [**Tailscale: a modern replacement for Hamachi**](/blog/hamachi/)
This article traces back Xe’s personal nostalgia for Hamachi and explains how Tailscale solves many of the same problems in ways that are better for today’s Internet.
* [**Making heads or tails of open source**](/blog/opensource/)
David Crawshaw on the history of open source at Tailscale.
* [**Now with more DERP**](/blog/more-derp/)
We added nine additional DERP locations to complement our existing relay network (plus three more since this blog post!). By operating in more locations globally, your devices are more likely to be closer to a server. David Crawshaw and Denton Gentry detail the DERPs for you.
* [**The case of the spiky file descriptors**](/blog/case-of-spiky-file-descriptors/)
Not all engineering work at Tailscale requires changing Go internals or deep insights into how to leverage the birthday paradox for NAT traversal. There are countless small bugs and edge cases that we investigate in our quest to meet an unreasonably high percentile of our users’ expectations. Mihai Parparita details the story of one such investigation.
* [**What we learned (and can share) from passing our SOC 2 Type II audit**](/blog/soc2-type2/)
David Anderson, Rachel Lubman, Denton Gentry and Maya Kaczorowski share the good, the bad, and the ugly from passing our SOC 2 Type II audit.
* [**GitOps for Tailscale ACLs**](/blog/gitops-acls/)
Our own Archmage of Infrastructure Xe Iaso covers how you can set up a GitOps workflow for your tailnet policy file with GitHub Actions so you can maintain ACLs in a central repository; apply the same controls for changes to your configuration file as you do for code (“config as code”), such as requiring review; and automatically apply these configuration changes to your network.
## Tailscale IRL
### GopherCon Chicago
Join the Tailscale team for exclusive swag, to talk shop, and fuel up at the 2121 Pantry at the Marriott Marquis in Chicago for our “Coffee & Go” event.
### Monktoberfest
We are proud to be the lunch sponsors for the upcoming Monktoberfest October 6-7 in Portland, Maine. If you’re planning to attend, be sure to say hello to Maya, our Head of Product!
### Tailscale learning library
We are building a learning library to help folks at any stage in their career. If you have a topic you’d like to see covered, send us a tweet @Tailscale.
* [**Implementing privileged access management**](/learn/implementing-privileged-access-management/)
No, the other PAM. Privileged access management (PAM) is a method of restricting access to sensitive resources to only those who need it. Learn the best practices for implementing PAM.
* [**How to secure Remote Desktop Protocol**](/learn/secure-remote-desktop-protocol/)
Remote Desktop Protocol (RDP) is a convenient method for interacting with a remote machine, but it’s also a common vector for attacks. Learn how to make RDP more secure.
That’s all for now. Stay well!
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