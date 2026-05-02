Zero Trust networks
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|September 10, 2019
# Zero Trust networks
I am leery of jargon. I am as guilty of using it as the next engineer, but there comes a point where there are just too many precise, narrowly-understood terms polluting your vocabulary. The circle of people you can talk to shrinks until going to the store to buy milk feels like an exercise in speaking a foreign language you took one intro course to in college. Less jargon is better.
Thus the first few times I heard the terms *zero trust network* and *microsegments* I ignored them. The conversation went on even though I was a bit confused. Eventually I heard these enough that I had to figure out what these words mean. Turns out they are useful!
So what are they?
### Zero Trust Networking
The term *zero trust* [originated in 2010](https://www.ndm.net/firewall/pdf/palo_alto/Forrester-No-More-Chewy-Centers.pdf) with John Kindervag. It came as a fully-formed concept: we need to give up on the idea of trusted networks.
Traditional production and corporate networks have a notion of *perimeter security*, the big bad world is outside, and inside is a safer space with lax rules.
Perimeter security does not work. Eventually, someone will find their way in. Usually through a forgotten service hiding in the corner of your network. Once they are in, the lax rules and default trust of the internal network makes your adversary’s job easy: they jump from your forgotten tiny service to the critical, valuable services.
Zero Trust networking means treating the internal network just like an external network: authenticate every connection, encrypt all traffic, log everything. Plan as if every machine (virtual or otherwise) as if it is sitting on a public IP address.
Coincidentally, I learned about these concepts in a parallel universe at around the time the Zero Trust term was coined, in the network infrastructure of Google. The same ideas where developed both for [prod network security](https://cloud.google.com/security/encryption-in-transit/application-layer-transport-security/resources/alts-whitepaper.pdf) and the corp network. The latter got the cute project name [BeyondCorp](https://cloud.google.com/beyondcorp/) which has its way into public awareness.
### Microsegmentation
This one is a little trickier.
Microsgementation is a technique for transitioning from classic a chewy-center trusting network to Zero Trust network.
The process: take a traditional network. You have one segment. Now find a set of machines with a small surface area and cut them off from the larger network. Use access control rules to designate precisely how the rest of the network is allowed to communicate with the machines you have cut off. Now you have two segments.
Repeat the process, segmenting your traditional network and your new segments, until the segments are so small each only contains only a tiny number of machines. That is microsegmenting.
When each microsegment contains only one machine, congratulations you have a Zero Trust network.
This process is entirely possible today with the tools we have known for years: routers, firewalls, VPNs. But the process is daunting. Segmenting part of a network take months of archeology, calling retired employees, finding software engineers to modify services everyone had forgotten about (well, everyone but the handful of people who use them to make a large part of your company’s revenue).
Microsegmentation is extremely difficult with today’s tools.
### Why am I talking about these concepts?
It turns out we ([Tailscale](/)) are building a new Zero Trust networking product, designed specifically to make microsegmentation much easier.
Funnily enough, we did not realize that was the name for what we were doing until very recently. I knew of the principles behind BeyondCorp: authenticate everyone, encrypt every packet, log everything (Zero Trust), and we decided that companies need help reaching that goal incrementally (microsegmentation).
Sure, you could rewrite everything to be Zero Trust from day one, but almost no-one can afford the massive costs of such a multi-year project. Indeed, it is nearly impossible to develop an estimate for how expensive the process would be in a major company: turn over a rock and you will find a new server.
I find this particular problem space very interesting, because solving it well is not just about making existing software work well, it is about reclaiming a way of easy, cheap programming that has been made unsafe by the growing threats from the internet to the traditional trusted network model.
Share
Author
David Crawshaw
Author
David Crawshaw
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