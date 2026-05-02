December Tailscale newsletter
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|December 31, 2022
# December Tailscale newsletter
👉 We’d love to hear what you think about Tailscale, and filling out this [Google form](https://forms.gle/FA9UJwiTbdoRzKsK7) helps us build a better product for you!
Our December newsletter is out a bit early as we here at Tailscale take the final days of 2022 to rest up, be festive, and reflect on the year gone by — and what a momentous year it’s been, with lots of big product updates and company news. Here are just a few highlights:
We launched [Tailscale SSH](/tailscale-ssh/), which lets you SSH into devices on your tailnet from anywhere, even mobile, without hassling with additional software, firewall rules, or key management. You can even SSH into devices on your tailnet from any web browser via [SSH Console](/tailscale-ssh-console/).
We added support for on-demand access integrations with partners [ConductorOne](/blog/conductorone/), [Indent](/blog/indent/), [Opal](/blog/opal/), and [Sym](/blog/sym/), each of whom vastly simplify the process of provisioning new users with temporary access to sensitive resources.
We received our SOC 2 (both [Type I](/blog/soc2/) and [Type II](/blog/soc2-type2/)) compliance reports, reaffirming the ridiculously passionate [commitment to security](/security/) that’s baked into our DNA.
We announced a [$100 million Series B financing round](/blog/series-b/) led by CRV and Insight Partners, with participation from our existing major investors: Accel, Heavybit, and Uncork Capital, along with a cast of many prominent angels and smaller investors.
🚀 Plus: As we move into 2023, Tailscale is hiring! We’re looking for driven individuals who think differently, enjoy collaborating with highly technical remote teams, and are comfortable working asynchronously. See some of our open roles below, and learn more about our [company vision](/company/).
* [Technical Writer](https://boards.greenhouse.io/tailscale/jobs/4131985005)
* [Software Engineer: Data](https://boards.greenhouse.io/tailscale/jobs/4041710005)
* [Marketing Operations Manager](https://boards.greenhouse.io/tailscale/jobs/4142567005)
* [Product Manager](https://boards.greenhouse.io/tailscale/jobs/4053245005)
* [Product Manager EU](https://boards.greenhouse.io/tailscale/jobs/4142495005)
* [Senior Product Designer](https://boards.greenhouse.io/tailscale/jobs/4051721005)
Despite being a short-ish month for work, December still brought plenty of community contributions and new Tailscale features to share. Let’s jump in:
### From the community
**[Installing Ubuntu over 17000 KM distance using MAAS, VxLAN and Tailscale](https://medium.com/@antongslismith/bare-metal-cloud-provisioning-from-gcp-de4b65747de)**
Medium user [Anton Gisli Smith](https://medium.com/@antongslismith) describes how he spent a lot of time figuring out how to give people an easy and awesome experience, as fast as possible: “Whilst I’ve set up many a WireGuard network (by hand), I wondered if by now there was better tooling. Well, Tailscale is that better tooling. VERY GOOD TOOLING indeed.”
**[Tailscale… and SSH](https://www.zerotofullstack.io/p/tailscale-and-ssh)**
Over on Zero to Full Stack, Twitter user [Zach Silveira](https://twitter.com/zachcodes) writes about Tailscale and SSH, concluding that it’s “super cool for anyone who has a few Linux or other servers lying around.”
**[Running R remotely](https://vuorre.netlify.app/posts/remote-r/)**
Twitter user [Matti Vuorre](https://twitter.com/vuorre) shares a blog post on running R remotely via Tailscale. “It really is quite easy, and that’s why I use Tailscale and not some other SSH or VPN-based solution.”
**[How can journalists use Tailscale, Larix Broadcaster & OBS for live news](https://www.youtube.com/watch?v=vKNGaYAe5OA)** [video]
YouTube channel [Thrifty Broadcasts](https://www.youtube.com/@thriftybroadcasts) offers a tutorial on how journalists can use free tools and readily available equipment to remotely contribute audio-visual content to live news.
**[Tailscale makes networking easy](https://forum.asustor.com/viewtopic.php?f=42&amp;t=13511&amp;p=45389)**
User father.mande shares in the ASUSTOR Community Forum: “APKG for Tailscale — This APKG is for the native version, no Docker, no container, nothing breaking the security you can expect for a VPN.”
**[How to securely access your Synology NAS from anywhere](https://www.androidcentral.com/accessories/how-to-securely-access-your-synology-nas-from-anywhere)**
[Harish Jonnalagadda](https://www.androidcentral.com/author/harish-jonnalagadda) on Android Central lays out why Tailscale is the best way to log in to your Synology NAS from outside your home network.
**[LMS remote access: Safe, secure, and free with Tailscale](https://forums.slimdevices.com/forum/user-forums/logitech-media-server/113997-lms-remote-access-safe-secure-and-free-with-tailscale-mesh-vpn)**
Logitech Squeezebox forum member [artatgray](https://forums.slimdevices.com/member/73037-artatgray?73037-artatgray) recommends Tailscale: “After not too much effort, I’m able to access my Logitech Media Server remotely, securely and for free over cellular using a VPN.”
### From the team
**[Tailscale for DevOps: Connect to any subnet in your tailnet with connecti (by Pulumi)](/blog/pulumi-connecti/)**
[Lee Briggs](https://www.pulumi.com/blog/author/lee-briggs/) and [Jeff Spencer](https://www.linkedin.com/in/jeff393/) talk about provisioning sensitive services in private subnets with [connecti](https://connecti.cloud/) — a command line tool that uses [Pulumi](https://www.pulumi.com/)’s automation API, allowing you to provision Tailscale subnet routers in seconds without writing a single line of infrastructure code.
**[User and group provisioning for Okta is generally available](/blog/sync-okta-ga/)**
Tailscalars [Ramya Nagarajan](https://twitter.com/ramyfication) and [Jeff Spencer](https://www.linkedin.com/in/jeff393/) are pleased to announce that [user & group provisioning for Okta](/kb/1180/sso-okta-scim/) is now [generally available](/kb/1167/release-stages/).
**[Quickly switch between Tailscaile accounts](/blog/fast-user-switching/)**
[Maisem Ali](https://twitter.com/maisem_ali), [Mihai Parparita](https://twitter.com/mihai), and [Alessandro Mingione](https://twitter.com/sonovawolf) explain how to easily switch between Tailscale accounts on the same device, without re-authenticating.
**[Userspace isn’t slow, some kernel interfaces are!](/blog/throughput-improvements/)**
Tailscale engineers [Jordan Whited](https://twitter.com/jordanwhited) and [James Tucker](https://twitter.com/raggi) detail how we made significant improvements to the throughput of wireguard-go. “What this means for you: improved performance of the Tailscale client on Linux.”
**[Ask a Tailscale engineer: Throughput improvements to wireguard-go](https://www.youtube.com/watch?v=wCqXYPQFNuE)** [video]
This video walks through improvements that Tailscale engineers [Jordan Whited](https://twitter.com/jordanwhited) and [James Tucker](https://twitter.com/raggi) made to wireguard-go, which is the userspace WireGuard implementation that Tailscale uses.
**[Introducing tailnet lock: Use Tailscale without trusting our infrastructure!](/blog/tailnet-lock/)**
Users sometimes ask us, “How can I trust Tailscale?” [Tom D’Netto](https://twitter.com/Twitchyliquid64) and [Adrian Dewhurst](https://twitter.com/sailorfrag) explain our new security feature where your nodes verify the public keys distributed by the coordination server before trusting them for network connectivity.
**[Postgres Crunchy Bridge with Tailscale](/blog/crunchy-bridge/)**
Crunchy Bridge has integrated with Tailscale to provide easy access to your database from any of your devices, wherever they’re running.
### Tailscale in real life
**[AWS re:Invent 2022](https://reinvent.awsevents.com/)**
In November, we headed to Las Vegas with a small contingent of Tailscalars to attend re:Invent 2022. It was wonderful to chat with so many passionate Tailscale users, and we appreciate all the great feedback. If we missed you this year, we apologize, and we look forward to seeing you all again next year!
### Tailscale learning library
We are building a learning library to help folks at any stage in their career. If you have a topic you’d like to see covered, send us a tweet [@Tailscale](https://twitter.com/Tailscale).
**[What you need to know about secure access service edge (SASE)](/learn/secure-access-service-edge/)**
Secure access service edge integrates networking and security functions in a single, cloud-delivered service, providing simplified administration, increased agility, and improved security.
**[How infrastructure as code (IaC) improves DevOps](/learn/infrastructure-as-code/)**
Infrastructure as code makes it easy to manage infrastructure declaratively and version control changes, as well as collaborate on those changes with other team members.
**[What is a lateral movement attack and how do you prevent it?](/learn/lateral-movement-attacks/)**
In a lateral movement attack, hackers can leverage a single network vulnerability to infiltrate your entire network. This article looks at the ways a lateral movement attack can affect your organization, as well as how to detect and prevent it.
That’s all for now. Stay well!
🔈P.S. Leaving a review on G2 helps more teams find Tailscale. We’d really appreciate it if [you took the time to put in a good word](https://www.g2.com/products/tailscale/reviews/start?return_to=https://www.g2.com/products/tailscale/take_survey).
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