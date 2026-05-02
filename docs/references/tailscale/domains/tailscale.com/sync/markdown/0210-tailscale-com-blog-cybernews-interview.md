We all have to do a better job managing our infrastructure
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|April 29, 2022
# We all have to do a better job managing our infrastructure
*This is an interview with Tailscale co-founder and CTO David Crawshaw from [CyberNews](https://cybernews.com/security/david-crawshaw-tailscale-we-all-have-to-do-a-better-job-managing-our-infrastructure/?fbclid=IwAR0uXGAny476ZGA8oZhmxPVIrakQ09l2S9SSD5LQf9B-n0pyamTiMbSLDj8), reprinted with permission.*
***The impressive technological progress led to a variety of exciting developments, such as the emergence of the cloud and wireless technology. With our lives being so interconnected with the digital realm, can we still have the same level of privacy as a few decades ago?***
Back in the day, when an ethernet cable was the only way to connect to the online world, privacy was less of an issue because data could only be accessed by devices on the same network. Now, with a Wi-Fi connection, we are more linked than ever but have less privacy and more security issues. So can we have better connectivity but maintain the same security quality as with the ethernet cable?
We sat down with David Crawshaw, the Co-Founder and Chief Technology Officer of Tailscale, which is a VPN service provider focusing on a more secure cyber world, to discuss ever-evolving cybersecurity issues the world is currently facing.
**How did the idea of Tailscale come about?**
We found our way to the product from two directions. First, we found a pattern of business software that was written to trust the network, which had been made unsafe by a world where we can no longer trust physical networks. In theory, this happened long ago, but software lives a lot longer than many people acknowledge. The only solutions were to rewrite this software to follow a “zero-trust” model or hide it away from the world behind awkward security products.
Second, we found writing “zero-trust” software to be unpleasant. OAuth is hard to use. Managing private TLS certificates is initially a bit frustrating but creates ongoing work that tends to break software. Every piece of software you use has its own bespoke configuration. And you have to think about authorization all the time when writing programs. It is a constant extra weight programmers carry around.
Both of these problems have much more elegant solutions if we can trust the network. The core concepts to do this existed in overlay networks, but no software available actually did it. So we did.
**On your website, you mention returning to the original vision of the internet as one of your goals. Can you tell us more about this approach?**
The internet used to be an interconnection between institutional networks. They are managed and create varying degrees of trust. If you ran ethernet in a building, before there was an internet to connect it to, you knew anything you spoke to over your ethernet was being run by someone down the hall. You could go and talk to them when the network stopped working and figure out a solution.
This was a reasonably safe and pleasant place to write software. We did not have to be concerned with encryption. There were many easy physical concepts we could latch onto for authentication and authorization.
Now, there are billions of people down the hall. Your computer is connected to the entire human condition: criminals, hostile governments, toddlers. This is not a safe place for software.
Our dream is not to “return” to the days of slow dial-up modems and progressive JPEGs, but to create new safe places for software. Every room in the developed world is connected today, and soon, every place on Earth will be. The internet can be the substrate we use for building networks. Just as we used to run ethernet cables in wall cavities, we can run virtual ethernet cables through the internet.
The way managed institutional networks used to work is a useful guide for the new networks we are trying to build.
**What makes Tailscale different from other VPNs on the market?**
There are, broadly, two kinds of VPN products. The first are internet proxies, services you can use to mask the source of your traffic to internet services. Tailscale is not an internet proxy, in fact, by design, we never see your unencrypted traffic.
The second kind of VPN product is used to access private resources. Tailscale is one of these. It is built on a new tunnel protocol, WireGuard. What distinguishes Tailscale is it builds a point-to-point mesh network (gone are the old VPN *concentrators*) with default SSO integration, and provides fallback relays to work around difficult networks.
**Do you think the pandemic has altered the way the public perceives cybersecurity?**
The pandemic has increased the need for access-from-anywhere. Businesses dependent on VPNs to access office resources are struggling with what exactly an office is. But this trend already existed: cloud resources hosted with different providers or in different regions, flexible work environments. Software-based VPNs that make deploying a new location difficult are increasingly problematic, and hardware-based VPNs are now a serious limit to be worked around.
**It is evident that you strongly support open source development, even providing free Tailscale services for open source projects. Why is this practice so important for your company?**
I became a software engineer because of open-source software. Without GCC, I would never have learned to write C. Open source software has been an integral part of the careers of many Tailscale engineers. Anything else would be alien to us. Our client software, which contains our most sophisticated engineering, is also open source.
**Since the Tailscale team is 100% remote, what tips do you have for other organizations to improve communication and collaboration between remote employees?**
There are different kinds of remote work. At one end of the spectrum are companies that are entirely “asynchronous”, working wholly through the written word in media that don’t require an interactive response. At the other end are companies with a traditional office, and a small percentage of their workforce working remotely, spread across onsite teams. Tailscale is in the middle – we are all remote, but we keep to a few close time zones, which gives us plenty of time to hop on a video call and chat about projects.
Firstly, I would recommend avoiding the model where a minority of employees are remote. If half the team is in the room, and half the team dials in from remote locations, then half the team is meeting and the other half is listening. That’s fine in the short term, but long term it does not work. Get everyone onsite, or get everyone to dial into the meeting separately.
Secondly, err on the side of over-communicating. In the office, companies always have too many meetings. A useful thing you can do in any office is acquire the power to cancel meetings and do it. With remote work, there are far fewer opportunities to chat, and far more activation energy is required to do it. So there are never enough meetings. One of the best things you can do is find a colleague you haven’t spoken to in a while and give them a call.
**With remote work becoming the new normal, what security measures should companies invest in to secure their workload?**
There are many emerging technologies that are great fun to talk about, but the truth is that what the typical organization needs to invest in today is the latest technology of the previous decade: two-factor authentication and Single Sign-On (SSO).
**What would you consider to be the main cybersecurity threats concerning organizations nowadays?**
Companies have more computing infrastructure than ever before, spread over more locations. One executive relayed to me that “we have some twenty thousand servers. Wherever we try to count them, we turn over a rock and find more servers.” We all have to do a better job tracking and managing our infrastructure, and that is going to require better software.
**What does the future hold for Tailscale?**
There are so many more networks to build! Today Tailscale is being used as a traditional business VPN replacement and as a tool for technology enthusiasts and software developers. But every household has multiple devices in it today. Typically, without Tailscale, we connect them with a hodgepodge of cloud services, storing our thermostat temperature setting in a data center in another state. This nearly absurd complexity is because networks became untrustworthy. We can fix that.
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