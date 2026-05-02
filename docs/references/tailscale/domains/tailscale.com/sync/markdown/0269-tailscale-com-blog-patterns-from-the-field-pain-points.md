Business challenges and pain points: Tailscale patterns from the field
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|insightsJanuary 29, 2025
# Business challenges and pain points: Tailscale patterns from the field
Chris Chang is Director of New Business Sales at Tailscale. In this two-part series, he provides some insights from his conversations with customers in that capacity.
I’ve been working at Tailscale for 2.5 years, and during that time I’ve spoken to hundreds of customers and indirectly advised our sales team on hundreds more. The wonderful thing about the Tailscale community is that you are all so freaking smart. I’m genuinely surprised, delighted, and amused when I talk to our customers. We have customers using Tailscale on their VMs, containers, Kubernetes clusters, CI/CD pipelines, autonomous vehicles, traffic toll roads, HVAC systems, and more.
So many people I speak to often wonder if their pain points and use cases are “normal” for Tailscale. The answer is likely “yes,” but we haven’t done a great job explaining how Tailscale is adopted by companies of every different size… probably because there are [over 30,000 companies using Tailscale](https://tailscale.com/blog/welcome-grace-lin-10000-customers)! In this post I want to help share back to the community everything I’ve learned.
This post covers the common business pain points that drive customers to look at Tailscale. We’re publishing this post with a companion piece, which covers [the many use cases for which customers use Tailscale](https://tailscale.com/blog/patterns-from-the-field-use-cases).
## [Pain points that kick off an evaluation](#pain-points-that-kick-off-an-evaluation)
Here are the most common reasons why customers start looking for a new tool to [replace their legacy business VPN](https://tailscale.com/switch):
1. Grumpy end users
2. Compliance audits
3. Scaling a business
4. Cloud or data center migration
5. New product launch
Here’s how Tailscale solves each of these challenges.
### [Grumpy end users](#grumpy-end-users)
Unfortunately, this pain point is very common. Consider these two journeys:
End users are frustrated that they’re constantly encountering VPN reconnects or poor performance. In some cases, end users have simply given up on using the VPN and internal company resources are exposed to the Internet.
On the other side, IT admins spend a good chunk of their work week manually onboarding and offboarding employees, struggling to set up proper access controls, and fielding helpdesk tickets.
I get it—IT and Security Engineering teams are often understaffed and have a huge backlog of priorities. But these productivity paper cuts add up over time, especially across an entire company.
#### [Real results with Tailscale’s VPN alternative](#real-results-with-tailscales-vpn-alternative)
* We recently helped an insurance company deploy to 160 users, and their helpdesk tickets dropped from 30 per month to just 2.
* At Enterprise scale, Instacart reduced their VPN-related tickets [from 10/week to nearly 0](https://tailscale.com/customers/instacart). They also made their thousands of engineers more productive, as each engineer was previously spending 20 minutes per day dealing with their various VPNs.
* Our Solutions Engineering team once helped a customer migrate 900 end users over a weekend. We can help you migrate very quickly if you’re motivated to make change! You can [contact our sales team](https://tailscale.com/contact/sales) for personalized treatment, or [check our events listings](https://tailscale.com/events-webinars) to ask questions at one of our regular SE Q&A sessions.### [Compliance and network security](#compliance-and-network-security)
The most common compliances I hear about are [SOC-2](https://tailscale.com/blog/soc2-type2), ISO, HIPAA, and PCI DSS.
Believe it or not, questions about each of these distinct compliances are addressed in pretty similar ways here at Tailscale. When I used to work at Amazon Web Services, I was supporting healthcare providers. It was quite the process negotiating Business Associate Agreements (BAAs) with customers—numerous lawyer calls over the course of weeks or months. At Tailscale, we don’t have any services in scope for HIPAA or PCI DSS because we don’t store any of your customers’ data. We only handle data in transit, and that data is end-to-end encrypted so we can never see it. No BAA required—whew!
We still, however, need to provide the controls necessary for customers to adhere to their requirements.
Tailscale integrates directly with your [Identity Provider](https://tailscale.com/kb/1013/sso-providers), which can be used to enforce MFA for VPN connectivity. You can either use any of our features—user approvals, EntraID and Okta SCIM, or Google Group Sync—to ensure that only authorized users are on your Tailscale network. You can directly reference your IdP groups with [Tailscale ACLs](https://tailscale.com/kb/1018/acls), and manage your ACLs as code via GitOps.
At the device level, you can ensure that only company-issued devices are allowed on the Tailscale network via [device identity collection](https://tailscale.com/kb/1326/device-identity) and device approval. You can install Tailscale on all company-issued devices via MDM, and further restrict a device’s access based on your EDR’s trust scores.
All of your Tailscale’s network traffic, along with any network configuration changes, can be logged and streamed to your SIEM for further analysis.
### [Scaling a business](#scaling-a-business)
Congrats! Your company is growing. That might mean you are increasing headcount, expanding to new geographies, acquiring new companies, or expanding your infrastructure footprint. Or maybe all of the above!
Tailscale is the easiest way to securely connect two devices, anywhere. I think the “magic” feeling that customers get is from our [NAT traversal techniques](https://tailscale.com/blog/how-nat-traversal-works) plus our consumer-grade user experience. You don’t have to configure port forwarding or certs, and you can install and use Tailscale like any other App Store app. On Linux, Windows or MacOS, you can [turn the device into a gateway](https://www.youtube.com/watch?v=UmVMaymH1-s) for your entire LAN in just a few commands.
These features result in a fast time-to-value that is useful for [homelabbers](https://tailscale.com/use-cases/homelab) who want a quick solution to access their home network, but also for Enterprise Engineering and IT teams who want to quickly connect to all of their corporate infrastructure.
I had a customer tell me that his company acquires 7 to 12 companies every year. It used to take him weeks to set up [site-to-site connectivity](https://tailscale.com/kb/1214/site-to-site) to all of the acquired company’s infrastructure. With Tailscale, he can set up connectivity within minutes of a deal closing.
### [Cloud or datacenter migration](#cloud-or-datacenter-migration)
I thought that by now, cloud and datacenter migrations would be a thing of the past. And yet, I talk to customers weekly who are still in the process of deprecating their datacenters or expanding their infrastructure footprint.
Our CEO summed it up perfectly in his [recent blog post about AI companies](https://tailscale.com/blog/ai-normal):
“The best prices for the particular GPU models you want are almost never at the big cloud providers. So you use a big cloud provider for most of your stuff, and a GPU Cloud provider (or several) for your GPU stuff, and then you have to send lots of data between them.”
Whether it’s finding the cheapest or best GPUs, signing a new customer who won’t let you use a particular Cloud, or negotiating a new strategic partnership, customers need an infrastructure-agnostic tool to manage all of their networks.
When a migration occurs, it’s a natural time for Engineering and IT teams to revisit how they have been operating. Perhaps they are rearchitecting their applications that run on VMs to run on containers and Kubernetes. Tailscale supports all of these compute types, and even[ serverless](https://tailscale.com/kb/1364/serverless). They also have to decide how and where they want to establish their network access controls. If you use your cloud provider’s native network security tools, they can’t be used with other infrastructure providers. Tailscale is an infrastructure-agnostic tool that can be used across infrastructure providers and all major operating systems.
### [New product launch](#new-product-launch)
When launching a new product, you get to reimagine everything from the ground up. Whether you’re launching your first product or your tenth, you want to make sure that the proper access controls are configured. Only on-call should be able to access production, and only the right team members should be able to access development or staging environments. Tailscale ACLs can be configured to provide [just-in-time access](https://tailscale.com/kb/1443/just-in-time-access) to your most critical resources. You can also audit privileged sessions with [Tailscale SSH](https://tailscale.com/tailscale-ssh), [SSH session recording](https://tailscale.com/kb/1246/tailscale-ssh-session-recording), and [Kubernetes session recording](https://tailscale.com/kb/1484/kubernetes-operator-deploying-tsrecorder).
## [How Tailscale can solve your connectivity challenges](#how-tailscale-can-solve-your-connectivity-challenges)
This post covered the common pain points we hear from companies reaching out to us, but of course reaching out is just the beginning. You can read about [how our customers are using Tailscale](https://tailscale.com/blog/patterns-from-the-field-use-cases) in the other post in this two-part series.
And if any of these pain points resonate with you, you can just start experimenting with [a free trial](https://login.tailscale.com/start). I guarantee you’ll be able to set up connectivity in less than 30 minutes. Otherwise, you can reach out to our [Sales](https://tailscale.com/contact/sales) or Support teams and we’ll help you get up and running ASAP.
Share
Author
Chris Chang
Author
Chris Chang
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