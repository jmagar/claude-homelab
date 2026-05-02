August Tailscale newsletter
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|companyAugust 05, 2024
# August Tailscale newsletter
Do you ever feel overwhelmed by the complexity of computer networking? At Tailscale, we've always believed that some of that *complexity* is just *complication*: a distraction that is not essential to building great things. In a new post, adapted from an internal all-hands presentation, our CEO and co-founder presented a big-picture vision for [a New Internet of small, trusted, and human-scale networks](https://tailscale.com/blog/new-internet?utm_source=hs_email&amp;utm_medium=email&amp;_hsenc=p2ANqtz-_NId-F_mG3BlGFmAlZ6ZqX5arOKDf94Gqs4fmAZsiGFqh8I_gGbtsX05rtXwKjH65n6MKT).
Zooming back in: This month's newsletter brings a bunch of recent product updates, notes from the community about how folks are using Tailscale, and some upcoming events where you can catch us online and IRL.
### [Product Updates](#product-updates)
* **[Video: Getting started with Docker and Tailscale](https://tailscale.com/blog/getting-started-with-docker-and-tailscale?utm_source=hs_email&amp;utm_medium=email&amp;_hsenc=p2ANqtz-_NId-F_mG3BlGFmAlZ6ZqX5arOKDf94Gqs4fmAZsiGFqh8I_gGbtsX05rtXwKjH65n6MKT)
**In our latest video, we walk you through the basics of installing Docker and connecting your first container with Tailscale.
* **[Device posture integrations with various MDM and EDR tools now available in beta](https://tailscale.com/kb/1288/device-posture?utm_source=hs_email&amp;utm_medium=email&amp;_hsenc=p2ANqtz-_NId-F_mG3BlGFmAlZ6ZqX5arOKDf94Gqs4fmAZsiGFqh8I_gGbtsX05rtXwKjH65n6MKT)
**Tailscale's device posture management is now integrated with [Jamf Pro](https://tailscale.com/kb/1409/jamf-pro?utm_source=hs_email&amp;utm_medium=email&amp;_hsenc=p2ANqtz-_NId-F_mG3BlGFmAlZ6ZqX5arOKDf94Gqs4fmAZsiGFqh8I_gGbtsX05rtXwKjH65n6MKT), [MS Intune](https://tailscale.com/kb/1410/intune?utm_source=hs_email&amp;utm_medium=email&amp;_hsenc=p2ANqtz-_NId-F_mG3BlGFmAlZ6ZqX5arOKDf94Gqs4fmAZsiGFqh8I_gGbtsX05rtXwKjH65n6MKT), [Kandji](https://tailscale.com/kb/1405/kandji?utm_source=hs_email&amp;utm_medium=email&amp;_hsenc=p2ANqtz-_NId-F_mG3BlGFmAlZ6ZqX5arOKDf94Gqs4fmAZsiGFqh8I_gGbtsX05rtXwKjH65n6MKT), [SentinelOne](https://tailscale.com/kb/1390/sentinelone?utm_source=hs_email&amp;utm_medium=email&amp;_hsenc=p2ANqtz-_NId-F_mG3BlGFmAlZ6ZqX5arOKDf94Gqs4fmAZsiGFqh8I_gGbtsX05rtXwKjH65n6MKT), [1Password XAM](https://tailscale.com/kb/1407/kolide?utm_source=hs_email&amp;utm_medium=email&amp;_hsenc=p2ANqtz-_NId-F_mG3BlGFmAlZ6ZqX5arOKDf94Gqs4fmAZsiGFqh8I_gGbtsX05rtXwKjH65n6MKT)(previously Kolide) along with [Crowdstrike Falcon](https://tailscale.com/kb/1289/crowdstrike-zta?utm_source=hs_email&amp;utm_medium=email&amp;_hsenc=p2ANqtz-_NId-F_mG3BlGFmAlZ6ZqX5arOKDf94Gqs4fmAZsiGFqh8I_gGbtsX05rtXwKjH65n6MKT). The integrations are available in beta and these integrations would fetch signals from the respective EDR/MDM tool that you can use in your tailnet as part of device posture management.
* **[Control D, meet Tailscale](https://tailscale.com/blog/controld?utm_source=hs_email&amp;utm_medium=email&amp;_hsenc=p2ANqtz-_NId-F_mG3BlGFmAlZ6ZqX5arOKDf94Gqs4fmAZsiGFqh8I_gGbtsX05rtXwKjH65n6MKT)
**We’re excited to announce an integration with Control D, a customizable DNS service. With Control D and Tailscale, every device on your tailnet can be protected from internet threats, unwanted and malicious content, or ads.
* **[Axiom + Tailscale: elevate your network visibility and security](https://tailscale.com/blog/axiom?utm_source=hs_email&amp;utm_medium=email&amp;_hsenc=p2ANqtz-_NId-F_mG3BlGFmAlZ6ZqX5arOKDf94Gqs4fmAZsiGFqh8I_gGbtsX05rtXwKjH65n6MKT)
**Our new integration with Axiom allows you to stream your Tailscale audit and network flow logs directly to your Axiom account, providing more visibility and analysis capabilities for your tailnet's activity and health.
* **[New options for granular network policy](https://tailscale.com/blog/via?utm_source=hs_email&amp;utm_medium=email&amp;_hsenc=p2ANqtz-_NId-F_mG3BlGFmAlZ6ZqX5arOKDf94Gqs4fmAZsiGFqh8I_gGbtsX05rtXwKjH65n6MKT)
**We’ve released two new configuration methods for how traffic flows throughout your tailnet. IP sets allow you to define granular networks in policies, so that designated users or devices can only access necessary parts of a subnet. Via introduces a powerful routing filter to appropriately route traffic across a global fleet of exit nodes, subnet routers, or app connectors.### [Community Highlights](#community-highlights)
* [**“Full Tailscale Integration” in Screens 5.3**](https://blog.edovia.com/2024/07/09/screens-5-3-now-available/?utm_source=hs_email&amp;utm_medium=email&amp;_hsenc=p2ANqtz-_NId-F_mG3BlGFmAlZ6ZqX5arOKDf94Gqs4fmAZsiGFqh8I_gGbtsX05rtXwKjH65n6MKT)
Screens 5, the cross-platform app to allow remote connection and control of various Apple devices, now supports direct connections to machines within your tailnet.
* **[Community guide: How to use Tailscale to remotely use a printer via AirPrint on iOS](https://www.reddit.com/r/Tailscale/comments/1e5s90e/how_to_use_tailscale_to_remotely_use_a_printer/?utm_source=hs_email&amp;utm_medium=email&amp;_hsenc=p2ANqtz-_NId-F_mG3BlGFmAlZ6ZqX5arOKDf94Gqs4fmAZsiGFqh8I_gGbtsX05rtXwKjH65n6MKT)
**In the [Tailscale subreddit](https://www.reddit.com/r/Tailscale/?utm_source=hs_email&amp;utm_medium=email&amp;_hsenc=p2ANqtz-_NId-F_mG3BlGFmAlZ6ZqX5arOKDf94Gqs4fmAZsiGFqh8I_gGbtsX05rtXwKjH65n6MKT), /u/Player13377 lays out some simple steps for configuring remote printing with iOS and AirPrint.
* [**Jon Seager: “How I Computer in 2024”**](https://jnsgr.uk/2024/07/how-i-computer-in-2024/?utm_source=hs_email&amp;utm_medium=email&amp;_hsenc=p2ANqtz-_NId-F_mG3BlGFmAlZ6ZqX5arOKDf94Gqs4fmAZsiGFqh8I_gGbtsX05rtXwKjH65n6MKT)
Canonical’s VP of Engineering gives a full rundown of his current computing setup. “In 2021 I started using Tailscale in place of my hand-rolled Wireguard setup, and I haven’t looked back. It has to be one of my favourite pieces of technology ever. It runs on all of my things - desktops, laptops, servers, phones, tablets, etc.”### [Upcoming Events](#upcoming-events)
* [Webinar: Scaling Tailscale programmatically with Infrastructure as Code](https://tailscale.com/events-webinars/scaling-tailscale-webinar?utm_source=hs_email&amp;utm_medium=email&amp;_hsenc=p2ANqtz-_NId-F_mG3BlGFmAlZ6ZqX5arOKDf94Gqs4fmAZsiGFqh8I_gGbtsX05rtXwKjH65n6MKT)
August 6, 2024
While Tailscale is simple to set up on individual machines, deploying it across hundreds or thousands of devices demands automation. This webinar explores efficient ways to provision Tailscale in cloud environments using infrastructure as code.
* [DevOpsDays Minneapolis](https://devopsdays.org/events/2024-minneapolis/welcome/?utm_source=hs_email&amp;utm_medium=email&amp;_hsenc=p2ANqtz-_NId-F_mG3BlGFmAlZ6ZqX5arOKDf94Gqs4fmAZsiGFqh8I_gGbtsX05rtXwKjH65n6MKT)
August 6-7, 2024
Tailscale is sponsoring DevOpsDays Minneapolis to support and network with the local software development / IT infrastructure operations tech community.
* [SE Office Hours](https://tailscale.com/events-webinars/solutions-engineer-office-hours?utm_source=hs_email&amp;utm_medium=email&amp;_hsenc=p2ANqtz-_NId-F_mG3BlGFmAlZ6ZqX5arOKDf94Gqs4fmAZsiGFqh8I_gGbtsX05rtXwKjH65n6MKT)
August 14, 2024
Join the Tailscale Solutions Engineer team for our interactive monthly office hours series. Our team will rotate through demos for new and existing features and answer common technical questions. We will gather questions ahead of time and take live questions from whoever attends, giving you access to Tailscale product experts.
* [DevOpsDays Birmingham](https://devopsdays.org/events/2024-birmingham-al/welcome/?utm_source=hs_email&amp;utm_medium=email&amp;_hsenc=p2ANqtz-_NId-F_mG3BlGFmAlZ6ZqX5arOKDf94Gqs4fmAZsiGFqh8I_gGbtsX05rtXwKjH65n6MKT)
August 19-21, 2024
Tailscale is proud to sponsor DevOpsDays Birmingham to engage with and support the local software development and IT infrastructure operations community.
* [LeadDev NY](https://leaddev.com/leaddev-new-york?utm_source=hs_email&amp;utm_medium=email&amp;_hsenc=p2ANqtz-_NId-F_mG3BlGFmAlZ6ZqX5arOKDf94Gqs4fmAZsiGFqh8I_gGbtsX05rtXwKjH65n6MKT)
September 4-5, 2024
Tailscale is sponsoring LeadDev NY at the Javits Center to support their mission of furthering education and networking for technical engineering managers. Come by the Tailscale table to talk about easily and securely connecting to anything on the internet.
🚀Are you building something cool or exciting using Tailscale? We love hearing about [how our customers use Tailscale](https://tailscale.dev/blog/tailscale-sucks?utm_source=hs_email&amp;utm_medium=email&amp;_hsenc=p2ANqtz-_NId-F_mG3BlGFmAlZ6ZqX5arOKDf94Gqs4fmAZsiGFqh8I_gGbtsX05rtXwKjH65n6MKT) for their personal setups or at the workplace. We want to share these examples with the broader Tailscale community. If interested, [fill out this form](https://docs.google.com/forms/d/e/1FAIpQLSeYT_K9sDRRmelweRDJ3YBv_PVN0w46_uOK5SvRVGm9Wlx66g/viewform?usp=sf_link&amp;utm_source=hs_email&amp;utm_medium=email&amp;_hsenc=p2ANqtz-_NId-F_mG3BlGFmAlZ6ZqX5arOKDf94Gqs4fmAZsiGFqh8I_gGbtsX05rtXwKjH65n6MKT), and we will share your experience in an upcoming newsletter.
Share
Author
Parker Higgins
Author
Parker Higgins
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