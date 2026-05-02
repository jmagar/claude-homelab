Tailscale raises $100M… to fix the Internet
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|May 04, 2022
# Tailscale raises $100M… to fix the Internet
Let’s get this out of the way — we’ve raised $100M in a Series B financing led by CRV and Insight Partners, with participation from our existing major investors: Accel, Heavybit, and Uncork Capital, along with a cast of many prominent angels and smaller investors.
### But why?
I’ll get to that. First, storytime.
In 2019, David Carney, David Crawshaw, and I started with a simple idea: that the majority of projects executed by the majority of software teams don’t need to scale. Even when your core product scales to a billion users, your internal dashboards and tools never will.
At first, we only had an inkling of what we wanted to do. Crawshaw wrote [Remembering the LAN](/blog/remembering-the-lan), about the *feeling* of writing software back in the 1990s. Not that we want to reset back to the 1990s; we’ve come a long way. But back then, for the few people coding at all, there was a sense of liberation. That feeling has eroded, replaced by ever-increasing layers of boilerplate and frustration.
Today, when you start even the simplest project, you’re bombarded with infrastructure decisions that feel irrelevant to your goal: Should I use version control? Continuous integration? How many dependencies can I use and trust? Do they have security holes? Can I keep them updated? Will the updates break my program? How will I deploy it? Where will I deploy it? How much will it cost? How will I connect to that? How will my co-workers or friends connect to it? How do I make backups? How do I *restore* backups? And… how do I keep the bad people out?
Thoroughly solving all those problems, in the general case, would take hundreds of startups — and hundreds there are! Which means that keeping track of them all, and integrating them, is a whole job on its own, that you can buy even more tools for.
We took a different approach. Instead of comprehensively solving every case of one or two problems, we decided to work on only the parts that don’t scale: The internal dashboard and CI system that will never need to be public-facing. The HR database that will always have far less than a thousand queries per second. The dozens or hundreds of devs that ssh or RDP into servers, not the millions of users being served.
To [paraphrase Larry Wall](https://www.amazon.com/gp/feature.html?ie=UTF8&amp;docId=7137), Tailscale makes easy things easy. We get away with it because everyone else is already working to make hard things possible.
(It’s hard to make easy things easy. Tailscale itself is, ironically, not tail scale.)
We encountered resistance at first. Not from people who wanted problems to be hard, but from people who are so traumatized by the last two decades of computing that they assumed, if it’s not hard, then it must be wrong. Surely it will page me in the middle of the night? Or be a security nightmare. Or sell my private information on the black market? Everyone knows security and ease of use are two ends of a spectrum, not two things you can have at the same time. What’s the catch?
> >
> The beauty of
[> @Tailscale
](https://twitter.com/tailscale)> is that they enable people to make their own personal internet, for free in most cases. It’s this weird paradigm shift, since you have to actively work to make applications insecure rather than the other way around.
>
[](https://twitter.com/morgallant/status/1352029765050408962)>
For people who believe there’s a catch — and most still do — then I don’t know how to write a blog post or hire a marketing or sales team to change their minds. This poses a problem.
I mean, imagine. What if the Internet just [worked like it was supposed to](/blog/how-tailscale-works/)?
* What if we all just had a static IP address, and a DNS name?
* …and the address migrated around the world with you?
* …and you could connect to any of your devices no matter where they were?
* …and it was always encrypted?
* …and there was always a correctly configured firewall?
* …and you never had to worry about certificates?
* …and every device in your organization was tied to a user identity and SSO and MFA?
* …and all this just happened automatically?
In 2019, nobody believed this was possible. In 2020, maybe a few people thought we might be serious about trying. By 2021… it worked.
Now here we are in 2022, with people installing, trialing, and buying Tailscale, faster than we know how to sell it. Where are they all coming from?
Tailscale spreads primarily through “word of mouth,” which is a technical term for the thing where you end up on our website after searching for the word “Tailscale” because your friend absolutely insisted, at dinner last night, that you please just finally try it or they will never speak to you again because they’re tired of listening to you complain.
> >
> My lates tech love affair;
[> @Tailscale
](https://twitter.com/tailscale)> . I am currently running IT ops for
[> @Medeltidsveckan
](https://twitter.com/Medeltidsveckan)> . The festival covers several square kilometers in Visby, but
[> @Tailscale
](https://twitter.com/tailscale)> makes it so trivial to maintain and manage all our distributed systems.
>
[](https://twitter.com/tmertz/status/1425018379275063306)>
Where does word of mouth come from? Well, that’s a mystery. We didn’t set out to build a company around word of mouth. It just kind of happened.
I’ll tell you the only secret I know: I track a lot of analytics. I noticed that every time we improved the product quality — getting the packets from point A to B more reliably, on more platforms, or for more people — our growth rate went up that same day. What you can measure, you can improve. So naturally, we kept doing that.
That big insight didn’t come from a plan. I mean, I’m all for [product quality](https://apenwarr.ca/log/20161226), sure. All else being equal, you know, depending on what I have to give up to get it. But from what I’ve seen, with any newly launched startup or product, once you hit a certain quality threshold, it’s good enough, and it’s time to add more features.
Tailscale keeps defying my expectation. It’s pretty high quality already; users often describe it as magic, or “perfect.” We know it’s not really perfect: We keep statistics. We’re endlessly chasing more 9s of reliability. It’s pretty good, though. Our statistics would say that most likely, we already have more 9s than any other VPN that has ever existed.
> >
>
[> @tailscale
](https://twitter.com/tailscale)> busts double nat (travel router -&gt; plane Wi-Fi) and connects me to my home server so I can silence a prometheus humidity alert (can’t really add water to the humidifier from here).
>
[](https://twitter.com/devilmonastery/status/1231034101928517632)>
That’s maybe not a high bar. To put the market in perspective, there are VPNs that only work if one side has a static IP. And you explicitly forward a port on the firewall. And there’s no [NAT, double NAT, or CGNAT](/blog/how-nat-traversal-works/) in the way. And UDP isn’t blocked. And you have DNS in place. And you don’t switch Wi-Fi networks or suspend your laptop or have a mismatched version or exceed the capacity of your embedded router firmware, or something about refreshing your certificate. And even then, sometimes VPNs just kinda stop.
We exceed that bar already, but we’ve noticed that when we exceed it even more, other factors seem to matter even less. I’m told that in the investor world this is called “product-led growth” (PLG) because when the product gets better, you grow more. That sounds like us.
### Yes but the money
All this leads to the awkward question I somehow became responsible for answering in this blog post. How, Avery, on earth, are you all planning to spend **one hundred million dollars?**
I know the standard answer to this question: something about more marketing, and more sales, and more distribution channels, and enterprise, and growth growth growth! Honestly, I guess we’re going to do some of that, because we have analytics there too, and they all say those things are good investments for us. (Side note: Did you know that with $100M you could interrupt the Super Bowl for a full 7 minutes?)
But here’s the real answer. We’re paranoid. This is not our first rodeo. We don’t know where the economy or the market are going. We don’t want to be pressured into juicing growth numbers beyond where they belong. We don’t want to put revenue ahead of quality, because our stats say quality is where all our growth comes from. We [don’t want people to worry that we’re going to cancel their free plan](/blog/free-plan/), because the free plan is where all our referrals come from. We don’t want to lose sight of the amazing community of developers and operators who came together to make Tailscale what it is.
People [love Tailscale](https://twitter.com/apenwarr/status/1477023556341047306) already. They spread Tailscale already. They buy Tailscale already. They’ve built a beautiful, respectful community that deserves more of our best work. Yet, it’s a long way from here to making small-scale software development easy again. And from there, to making the Internet live up to its 1990s potential.
So, here’s what we’re going to do with a hundred million dollars: more of what we’ve been doing, for the people we’ve been doing it for. At a healthy pace, at human scale. With a focus on quality and craftsmanship. And trust. And security. And customer service. And… profitability. Like a bunch of weirdos.
I could show you our fancy Vision Statement and Mission Statement, but I’ve been referring to them less and less lately. Now I just tell people: We’re here to fix the Internet.
If we don’t, who will?
You can hear me talk about this, our funding, and other things on the latest [Screaming in the Cloud podcast](https://www.lastweekinaws.com/podcast/screaming-in-the-cloud/the-magic-of-tailscale-with-avery-pennarun).
Share
Author
Avery Pennarun
Author
Avery Pennarun
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