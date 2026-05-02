Tailscale has reached general availability
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|April 02, 2020
# Tailscale has reached general availability
Just over a year ago, we founded Tailscale with a common sense of nostalgia for the “good old days” of LANs. In our collective opinion (then and now) networking and cloud infrastructure has become too complicated. Attempts to increase team connectivity and migrate towards remote work results in a corresponding burden of security. This reduces productivity. Systems and approaches don’t scale without significant time and effort. Everyone wins.
That’s why we are happy to announce that we’ve raised a $3M seed round, led by [Heavybit](https://heavybit.com/) with participation from [Uncork Capital](https://uncorkcapital.com) and others. This investment sets the expectation on what we’re aiming to achieve: a return to simple computer networking for everyone that works anywhere you can access the Internet.
### The Story
Twenty years ago, an office network was a LAN on a switch with a mail server. Nowadays, it’s a multi-tenant cloud solution with myriad SaaS integrations and a remote workforce. Yes, it’s an evolution and things are way more powerful, but there’s something liberating about setting up your own home network or a simple network with your friends. Unfortunately, once you step outside of these narrow use cases, the complexity rises exponentially.
Why is it so difficult? Because the threat model has changed. Before you needed to worry about internal threats (i.e. that friendly colleague who can’t resist clicking on attachments). Nowadays, everything you do is exposable. If you’re running a personal network or a small company, you face a much larger threat lurking on the other side of your firewall. Maybe you’re a little more cautious and have two firewalls. You don’t want to know the lengths that enterprises go through.
We explored these problems and were approached by David Taylor, CEO of [VersaBank](https://versabank.com/). They wanted to expand remote access for their team. They also needed to secure Windows client/server apps by using two-factor authentication (2FA). These sorts of applications don’t run over HTTP, so conventional proxy solutions wouldn’t work. At many companies, the typical response is to explain it can’t be done because it is impossibly expensive. Thankfully, the bank rejected this idea and asked us to figure things out.
We had an idea, starting with [WireGuard](https://wireguard.com/)® and by bringing authentication down into the networking layer. You already trust your existing identity management system, so we use that to make connections impossible unless you’ve authenticated. User and machine keys allow admins to control which users and which devices are permitted. Instead of shoehorning everything into your existing network, we build an overlay network on top of your infrastructure. Every Tailscale endpoint has its own static IP, unique to your team. The combination of these things makes Tailscale secure, portable, and incrementally deployable.
This has a lot of implications. You can securely connect endpoints regardless of their physical locations. You can build internal applications without worrying about authentication. You can control access (even non-HTTP) to services with 2FA. You can incrementally roll out a deployment one user or server at a time. Once everyone is using Tailscale, turn up your firewall rules and block all other traffic. Magic.
Over the following months, Tailscale took shape. We expanded the team from three to six and things accelerated. We published a blog post entitled “[How Tailscale Works](/blog/how-tailscale-works)”, which does a great job of explaining the architecture. We also [open sourced](https://github.com/tailscale) a significant portion of our code that you can compile yourself. We released clients for [iOS](https://apps.apple.com/us/app/tailscale/id1470499037?ls=1), [macOS](https://apps.apple.com/ca/app/tailscale/id1475387142?mt=12), [Windows](/kb/1029/install-files), and a [range of Linux distributions](/kb/1031/install-linux) (Android is on its way). Most recently, we released a significant update to improve the experience for those working behind esoteric NATs. Connectivity is better than ever.
Oh, and what happened with the bank? They went on to become [our first paying customer](https://www.businesswire.com/news/home/20200330005192/en/).
### The Present
>
> “I just solved 1000 problems I had with my Docker VPN setup in under 15 minutes with Tailscale. I almost don’t believe it. Tailscale is awesome.” —
[> @harper
](https://twitter.com/harper)
>
Today, Tailscale is a fully functional mesh VPN that can be deployed in minutes on top of your existing infrastructure. You can [get started](https://login.tailscale.com/start) with your personal email address to create a private network. When you’re ready, switch over to a custom domain and expand Tailscale to your team. Authentication is seamless because we integrate with GSuite, Okta, Ping, Active Directory, and more. We handle key management and NAT traversal, making it easy to deploy WireGuard, which is responsible for the transport and security. Everything scales nicely because it’s a mesh; there aren’t any VPN gateways or bottlenecks to worry about. In short, it just works and is exactly what you want from something so fundamental to your infrastructure.
Of course, we couldn’t have gotten here alone. Thanks to all of our amazing customers, advisers, and investors who have supported us so far. We are incredibly excited to partner with [Heavybit](https://heavybit.com) (Joe Ruscio) as our lead. We are proud to be part of Heavybit’s 9-month accelerator that has helped to launch [so many great developer and enterprise product companies](https://www.heavybit.com/portfolio/). We are also thrilled to have participation from [Uncork Capital](https://uncorkcapital.com/) (Andy McLoughlin), who have backed [many existing and upcoming next-generation tools](https://uncorkcapital.com/companies/).
In addition, many experienced operators and angel investors joined in the round. In alphabetical order, they are:
Edith Harbaugh (CEO of LaunchDarkly); Eric Lindvall (Co-founder of Papertrail); Inovia Capital (Todd Simpson); Jeff Hammerbacher (Co-founder of Cloudera); Josh Bleecher Snyder (Co-founder of card.io); Magnus Hillestad (CEO of Sanity.io); Marc-Antoine Ruel (Google); Michael Mettler (Co-founder of card.io); Mohamed Musbah (Director, Microsoft Research); Panache Ventures (David Dufresne); Raymond Colletti (VP of Revenue at Codecov, former Director of Enablement at Datadog); Shelly Glennon (former Product Lead on Google Fiber); Stephanie Schatz Friedman (experienced adviser and angel investor).
### The Future
We will continue to focus on building the best possible connectivity tool for teams of any scale. Whether you’re enterprise or a solo developer, our goal is to make your networking problems fade away.
Easy, incremental deployment makes it trivial to get started. More advanced monitoring and security tools will allow you to expand things to your team and beyond.
If you want to stay in the loop, we’ll be posting regular updates to [our blog](/blog/) and Twitter [@tailscale](https://twitter.com/tailscale), as well as the occasional newsletter (you can sign up below). Expect to see a lot more over the coming weeks and months.
[Better yet, download Tailscale and get started today!](/)
Share
Author
David Carney
Author
David Carney
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