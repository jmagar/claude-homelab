Joining Tailscale: simplifying networking, authentication, and authorization
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|January 31, 2020
# Joining Tailscale: simplifying networking, authentication, and authorization
I used to tolerate and expect complexity. Working on Go [the past 10 years](https://bradfitz.com/2020/01/27/leaving-google) has changed my perspective, though. I now value simplicity above almost all else and tolerate complexity only when it’s well isolated, well documented, well tested, and necessary to make things simpler overall at other layers for most people. For example, the Go runtime is relatively complex internally but it permits simple APIs and programming models for users who then don’t need to worry about memory management, thread management, blocking, the [color of their functions](https://journal.stuffwithstuff.com/2015/02/01/what-color-is-your-function/), etc. A small number of people need to understand the runtime’s complexity, but millions of people can read & write simple Go code as a result. More importantly, Go users then have that much more complexity budget to work with to build their actual application. I would’ve never built [Perkeep](https://perkeep.org/) had I needed to fight both its internal complexity and the complexity imposed on me by other contender languages/environments at the time.
All that is to say, simplicity is not only refreshing, but it also enables. Go made me feel productive in a way I hadn’t felt in many years where everything just felt like it was getting more complex. Ever since finding Go, I’ve been regularly hunting for other technologies that provide simplicity as a feature.
I’ve always found networking and authentication and web apps to be a bit tedious and overly complex. I built [LiveJournal](https://www.livejournal.com/) back in 1999 ([including OpenID](https://en.wikipedia.org/wiki/OpenID#History) for it some years after) and have had little desire since to build other web apps. HTTP authentication and cookies and web security and redirects and OpenID and OAuth and such just aren’t very fun. It’s not the sort of complexity most developers, especially those writing internal or personal apps, want to deal with.
I somewhat accidentally discovered [WireGuard](https://www.wireguard.com/) about a year ago. I didn’t realize what it enabled at the time; I’d just wanted to connect some networks and devices together. What I discovered is how it also solves a lot of identity/authentications issues.
My parents recently got an RV to do the retiree thing of driving around the country. My dad put a Raspberry Pi on its [CAN bus](https://en.wikipedia.org/wiki/CAN_bus) so he could monitor and control its sensors & settings with a little Go HTTP server. Later he added an LTE modem to it and we set up WireGuard so he could access it from his phone remotely. When he later wanted to expose a read-only version of its interface to the world, the authn/z check was simple: check the IP address. If it’s one of the trusted WireGuard IPs, it can change settings. No cookies, no redirects. And we didn’t have to proxy all the traffic through a cloud provider and pay for the bandwidth there as well.
Since then I keep following that same model for all my personal projects and it’s been a joy. (I know [my homelab is gratuitous](https://github.com/bradfitz/homelab/) and atypical, but I’ve hit many of the same problems in work projects.)
Unfortunately, my bespoke home configs have grown unwieldy, I have no key rotation, and it’s tedious and manual for me to add new devices. This could all really use some nice tooling. (Another thing I learned to love from Go!)
So, I’m going to join [Tailscale](/) to help build this, so everybody can enjoy this simplicity, whether they’re a hobbyist or large enterprise or anybody wanting the “[BeyondCorp](https://research.google/pubs/pub43231/)” security model, but at the IP level instead of the HTTP level. You should be able to write private IP/UDP/TCP/HTTP servers where you can check who the user is by looking at the IP address only, and firewall/audit by just looking at the IP address (which Tailscale could also help manage in its tooling). And it shouldn’t matter whether all the devices on the network are behind NATs, have IPv6 [or not](https://www.google.com/intl/en/ipv6/statistics.html), or are actively roaming around between networks. They should all be addressable and reachable easily, and without modifying applications.
And yes, we want to open source much of this, not only because it’s what we enjoy, but also because it’ll let you trust us. There will be paid and hosted bits, but more on the business side of things in the future.
There’s much to do, and much to figure out, but I’m excited to help build it and to see what sorts of applications can be built with a simple identity & connectivity layer at the bottom. I have some ideas in mind, but more on that later too.
Share
Author
Brad Fitzpatrick
Author
Brad Fitzpatrick
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