July Tailscale newsletter
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|July 29, 2022
# July Tailscale newsletter
>
> 👉 We’d love to hear your thoughts on Tailscale. Filling out this feedback form helps us build a better product for you:
[> https://forms.gle/FA9UJwiTbdoRzKsK7
](https://forms.gle/FA9UJwiTbdoRzKsK7)
>
It has been an eventful July for the team here — and we’ve been busy with new features (we have a [status page](https://status.tailscale.com/)), a new version ([Tailscale v.1.28](/kb/1067/update/)), and a growing learning library. Here’s all that, plus some of the meaningful contributions from our community that help make our vision of a more human internet possible.
Let’s jump in:
### From the community
* [**The MV720**](https://twit.tv/shows/security-now/episodes/881)[video, English, transcription available]
[This Week in Tech](https://twit.tv/)hosts[Steve Gibson](https://twit.tv/people/steve-gibson)and[Leo Laporte](https://twit.tv/people/leo-laporte)discuss MS Office VBA macros, Win 11 security changes, start button failure, and Tailscale in their latest podcast episode.
* [**Through the stack: Episode 17 — featuring Tailscale SSH**](https://blog.imfiny.com/through-the-stack-1-17-week-26/)
[Thomas Riboulet](https://blog.imfiny.com/author/thomas/)shares his thoughts on Ruby libraries, postmortems, and Tailscale SSH.
* [**Code-server, Caddy, Tailscale, and Hugo = My ultimate dev environment**](https://chrisshort.net/code-server-caddy-tailscale-and-hugo-my-ultimate-dev-environment/)
[Chris Short](https://twitter.com/@ChrisShort)shares his “ultimate development environment equivalent to nirvana.” We’re honored to be included.
* [**Private web-based IDE using Tailscale TLS Support**](https://blog.shalman.org/private-web-based-ide/)
Inspired by the Chris Short post above,[Nahum Shalman](https://mobile.twitter.com/nahumshalman)documents how he’s using a private web-based IDE with Tailscale HTTPS.
* [**Kubernetes and OpenGitOps with Chris Short**](https://www.lastweekinaws.com/podcast/screaming-in-the-cloud/kubernetes-and-opengitops-with-chris-short/)[audio, English, transcription available]
For the Last Week in AWS podcast,[Corey Quinn](https://twitter.com/QuinnyPig)and Chris Short talk about GitOps and configuration management, and conclude their time with a discussion about connectivity and Tailscale. [Gee Chris, this newsletter isn’t*short*on your contributions!]
* [**Replacing SSH over Cloudflare with Tailscale**](https://orth.uk/tailscale-ssh/)
[Ben Butterworth](https://orth.uk/about/)originally used Cloudflare Tunnel to SSH into machines at home from other networks. But after a lively discussion on HackerNews, he decided to document switching to Tailscale SSH. This is a quick tutorial for anyone interested in doing the same.
* [**Unraid: Internet sharing and VPNs (MyServers, WireGuard, Tailscale, Duckdns)**](https://www.youtube.com/watch?v=nbFRkGluq8g)[video, German]
[The Geek Freaks](https://www.youtube.com/c/TheGeekFreaks)demonstrate how to create an “extra-net” with WireGuard and Tailscale.
* [**Top 5 Home Assistant remote access methods**](https://www.youtube.com/watch?v=OmVSvg3Wytc)[video, English]
YouTuber[Mostly Chris](https://www.youtube.com/c/mostlychris)details his top 5 Home Assistant remote access methods, including Tailscale.
* [**A Tailscale package for pfsense Plus and CE**](https://www.youtube.com/watch?v=Fg_jIPVcioY)[video, English]
[Christian McDonald](https://www.youtube.com/c/ChristianMcDonald)debuts the new Tailscale package for pfsense Plus and CE. This is a detailed technical walkthrough for how to get started.
* [**Home Assistant remote access using Tailscale**](https://www.youtube.com/watch?v=MBraMXIjEo4)[video, English]
[Smart Home Addict](https://www.youtube.com/c/SmartHomeAddict)shares an overview of Tailscale and walks through setting it up so you can access Home Assistant from outside your network.
* [**No more SSH private keys?!**](https://www.youtube.com/watch?v=oAN8ye5CN-k)[video, English]
[Butter, What?!](https://www.youtube.com/channel/UC24t8AZTwmJkvpNWsBfZcbA)breaks down how Tailscale SSH makes SSH keys (almost) a thing of the past.
* [**Ansible collection includes a Tailscale inventory plugin**](https://github.com/freeformz/ansible)
[Edward Muller](https://twitter.com/freeformz)shares their[Ansible](https://twitter.com/ansible)collection with a[Tailscale](https://twitter.com/Tailscale)inventory plugin.
* [**How to set up the Tailscale VPN and routing on pfsense**](https://www.youtube.com/watch?v=P-q-8R67OPY)
[Lawrence Systems](https://www.youtube.com/user/TheTecknowledge)offers a step-by-step guide for setting up Tailscale with pfsense.
* [**How to access GitLab on a private network with Tailscale**](https://about.gitlab.com/blog/2022/07/21/how-to-access-gitlab-on-a-private-network-with-tailscale/)
With Tailscale, you can run GitLab at home and safely connect to it from outside your network.[Brendan O’Leary](https://about.gitlab.com/company/team/#brendan)explains how Tailscale lets him do it “with as little hassle as possible.”
* [**RainMachine and Tailscale**](https://gist.github.com/rspier/aa61100e5ba2155d0df64c1e482e7126)
Tailscale community member [Robert](https://twitter.com/rspier)shares how to install Tailscale on a RainMachine HD-12.
* [**Reddit: Question about Tailscale**](https://old.reddit.com/r/Tailscale/comments/w837l8/question_about_tailscale/)
Perhaps our favorite question to answer: “IS IT REALLY THIS EASY?”
Want to be included in future Tailscale newsletters? Tag us in your rant, guides, or tutorials on Twitter.
### From the team
* [**Putting Tailscale on the Steam Deck**](/blog/steam-deck/)
Learn how Member of Technical Staff[Xe Iaso](https://twitter.com/theprincessxena)put Tailscale on a Steam Deck and is no longer having to mess with authentication and SSH keys just to copy over a Skyrim mod or two.
* [**The Past, Present, and Future of Supply Chain Security**](https://www.youtube.com/watch?v=aaICfpPe6u0)[video, English]
A talk by[Dan Lorenc](https://twitter.com/lorenc_dan), with moderation by Tailscale Product Manager[Maya Kaczorowski](https://twitter.com/MayaKaczorowski).
### Tailscale IRL*ish*
* [**The Sheer Terror of PAM**](https://rustconf.com/schedule#the-sheer-terror-of-pam)
Tune in on August 5th to catch Member of Technical Staff Xe Iaso @RustConf 2022 and learn all about the PAM API, how PAM actually works, how to meet that API in Rust so you can write your own authentication logic, and more.
### What’s new and improved
* [**Tailscale for DevOps: On-demand access to your Tailscale resources with Indent**](/blog/indent/)
Tailscale simplifies network and SSH connections between devices. We partnered with Indent, and now those connections can be approved and time-bound.
Explore Indent’s interactive demo of this integration over at their[website](https://indent.com/blog/tailscale):
You can use Indent to request access to anything in your Tailscale network, whether it’s a sensitive internal web-based tool, internal API, or production SSH access. By using Indent with Tailscale, you can:
* React to incidents faster with production access auto-approvals for on-call teams
* Get temporary access to run a production database migration
* View server logs or debug data to fix an issue without retaining persistent access
See the [documentation](/kb/1205/ondemand-indent/) to get started managing access to Tailscale resources with Indent.
* **[Status page](https://status.tailscale.com/)**
🎉 Our status page is live!
### Tailscale v1.28
* Tailscale v1.28 arrived this month and is available on all clients (see our[updated instructions](/kb/1067/update/)).
* This version has a handful of fixes and updates that are listed fully on[our changelog](/changelog/).
### Tailscale learning library
* We are building a learning library to help folks at any stage in their career. If you have a topic you’d like to see covered, send us a tweet @Tailscale.
* [How to manage multiple cloud resources](/learn/multicloud/)
* [Ultimate guide to better DevOps](/learn/devsecops/)
* [Privileged access management](/learn/privileged-access-management/)
* [Principle of least privilege](/learn/principle-of-least-privilege/)
* [Why do I need split DNS?](/learn/why-split-dns/)
* [IPv4 vs. IPv6 FAQ](/kb/1134/ipv6-faq/)
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