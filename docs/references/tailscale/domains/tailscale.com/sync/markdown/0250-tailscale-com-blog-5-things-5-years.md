5 Things We’ve Learned From 5 Years of Tailscale
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|companyApril 03, 2025
# 5 Things We’ve Learned From 5 Years of Tailscale
*(Oh, and we’re giving away lifetime Personal Plus plans, so keep reading! 🎉)*
If we’d been a little more on top of our calendar, we might have published this blog post *yesterday* — exactly five years to the day that [Tailscale officially launched into general availability](https://tailscale.com/blog/tailscale-launch). But instead, we did what any good startup would do: we [shipped a feature](http://tailscale.com/blog/k8s-operator-ga).
Honestly, I prefer it this way. Getting stuff out the door and into customers’ hands is a lot more rewarding than patting ourselves on the back, but I think a little of that now and then is totally fine. So, with \~half a decade of trying to make the internet just a little less terrible for everyone, we figured now’s a good time to pause, reflect, and share some things we’ve learned along the way.
### [1. Simplicity is a superpower](#1-simplicity-is-a-superpower)
Early on, we had a simple idea: what if computers didn’t suck so much? Okay, too broad. What if setting up a secure private network wasn’t miserable? Better. No port forwarding. No weird firewall rules. No troubleshooting mystery DNS issues at 2 AM. No giving up and disabling the firewall because it’s now 3 AM and way past your bedtime.
Five years later, that’s still what resonates. Turns out most people are like us: they’d rather be spending all of their time on building fun and novel stuff on top of systems and platforms that *just work*. We’ve learned that reliability and usability aren’t features you bolt on later; they’re the product.
### [2. Reliability compounds (and yes, it’s worth it)](#2-reliability-compounds-and-yes-its-worth-it)
A lot of startups talk about shipping fast and breaking things. We knew from the beginning that, when it comes to networking, breaking things is… bad. People expect their infrastructure to work, and that means things always have to be highly available **and** backwards compatible.
What surprised us is how quickly this investment in reliability paid off. Today, we’re trusted by over **10,000 business customers**. We have **hundreds of thousands of individual users** — homelabbers, indie devs, and IT pros — connecting everything from laptops to LLMs to lightbulbs. And last September, we crossed a wild milestone: **1 million devices connected simultaneously**.
When your product *just works*, people tell their friends. And then their friends tell their friends. And then random people at restaurants and airports begin noticing your company t-shirt and want to tell you about how much of an impact your product has made in their and their friends’ lives. Goodwill compounds.
### [3. A tool for homelabbers *and* global enterprises — and everyone in between](#3-a-tool-for-homelabbers-and-global-enterprises-and-everyone-in-between)
We imagined Tailscale to become something that fixes the Internet. Initially we helped small teams connect to their servers, devices, and even the occasional [dogcam](https://tailscale.com/kb/1076/dogcam). And that’s still a huge part of what we see every day.
But five years in, the range of use cases has blown us away. There are homelabbers wiring up 3D printers and retro game consoles. IoT tinkerers managing garden sensors and solar panels. AI researchers spinning up GPU clusters. Fintech and healthcare teams securing sensitive systems. Fortune 500 companies connecting global offices, apps, and devices — all using the exact same product.
What’s wild is how often those worlds overlap. The same features that power a homelab also solve real problems at scale. Private networking turns out to be... surprisingly horizontal.
**Lesson learned:** If you build something *useful*, *easy to use*, and *adaptable*, people will find ways to use it you never imagined — and that’s the best kind of surprise.
### [4. Laziness is a virtue, sometimes](#4-laziness-is-a-virtue-sometimes)
Part of the reason Tailscale works the way it does is because we didn’t want to run a giant pile of infrastructure.
Early on, we asked ourselves: do we *really* want to build and maintain massive data centers just to relay packets between two machines sitting five feet apart? Of course not. That sounded like a nightmare — expensive, brittle, and kind of missing the point of the internet.
So, we leaned into the lazy path: make devices connect directly, end-to-end encrypted, whenever possible. Help the packets find the shortest path — not the most expensive one. Turns out, laziness was the right call.
Direct connections are faster, cheaper, and more reliable. And the funny thing? Even when people are using Tailscale *inside* the cloud — connecting apps across regions, VPCs, or providers — the peer-to-peer model still wins. Less infrastructure for us, better performance for everyone.
Sometimes, the easiest way really *is* the best way.
### [5. Networking is about people, not just packets](#5-networking-is-about-people-not-just-packets)
If there’s one thing that’s really stuck with us over the years, it’s this: building a good network isn’t just a technical problem — it’s a trust problem.
It’s easy to think networking is all about encryption and routing tables. But the hard part isn’t making packets fly around securely — it’s giving people confidence in who’s allowed to connect, and why. Who can see what? Who’s allowed *right now* versus next week?
That’s why we built Tailscale on a **Zero Trust** foundation from the start. Not just because it was trendy (though it was), but because we knew the best way to *earn* trust was to make sure nobody had to blindly trust *us* at all.
We don’t sit in the middle inspecting your traffic. We can’t see what you’re sending — and frankly, we don’t want to. Our job is to get out of the way and give you the tools to define your own rules:
* **Access controls** that make it clear who can reach what
* **ACLs and tags** you can update instantly — no waiting, no redeploys
* **Granular sharing** for just the services or devices you want, nothing more
* **Audit logs** so you know exactly what happened, when
* **Identity integration** — we didn’t write our own IdP (because... yikes). You keep trusting the systems you already trust: Okta, Google, Microsoft, whatever works for you
* **Tailnet Lock** — cryptographic signing that makes sure only your trusted devices, with your keys, can access your tailnet
The result? You stay in control. Not us. And that, weirdly enough, is what makes people trust us. Because they don’t *have* to.
## [To celebrate 5 years, we’re giving away 5 lifetime Personal Plus plans](#to-celebrate-5-years-were-giving-away-5-lifetime-personal-plus-plans)
We figured: what better way to say thanks than to give something back? So, to mark five years of Tailscale, we’re giving away **5 lifetime [Personal Plus](https://tailscale.com/kb/1251/pricing-faq) plans** — free, forever, to 5 lucky winners.
#### [Here’s how to enter (short version):](#heres-how-to-enter-short-version)
* Find our post about this blog on [LinkedIn](https://www.linkedin.com/posts/tailscale_5-years-of-tailscale-giveaway-were-activity-7313548458290814979-NLqJ?utm_source=share&amp;utm_medium=member_desktop&amp;rcm=ACoAAAIB-NYBiTm_LIe3f6JgzEAeunCTsvxLScA), [X (Twitter)](https://x.com/Tailscale/status/1907782665282969678), [Bluesky](https://bsky.app/profile/tailscale.com/post/3llvxypp2lr2w), or [Mastodon](https://hachyderm.io/@tailscale/114274193667078570)
* Repost *or* comment on the post and include the hashtag #5yearsofTailscale
* That’s it — you’ve entered!
Subject to [Official Rules](/blog/5-things-5-years#footnote-1)
Winners will be randomly drawn and announced on **April 10th**. We'll share the winners on our social channels. You'll need to DM us or email [5yearwinner@tailscale.com](mailto:5yearwinner@tailscale.com) to claim your prize.
Thanks for being part of this journey — whether you’ve been with us since day one or just joined last week. Here’s to the next five years. 🥂
</a>
**Official Rules**
NO PURCHASE NECESSARY TO ENTER OR WIN. A PURCHASE WILL NOT INCREASE YOUR CHANCES OF WINNING. Enter between 12:01:01 AM EST on March 26, 2025 and 11:59:59 PM EST (US) on April 9, 2025. Must be 18+ to enter. Void where prohibited by law. Odds of winning depend on the number of eligible entries received. Enter by (1) finding our post about our 5th birthday on LinkedIn, X (Twitter), Bluesky or Mastodon (each a “social platform”), (2) either (a) sharing the post or (b) commenting on the post, and (3) include #5yearsofTailscale to be entered in the drawing. Limit 1 entry per person per social platform, for a total of 4 entries per person. Prize: one (1) lifetime Personal Plus plan. ARV: USD$5/mo. 5 winners total, randomly selected. Winners will be announced over each social platform on April 10, 2025. Winners will be notified via DM on the social platform associated with their winning entry. Winners must contact Tailscale via email within 7 days to claim their prize. A winners’ list can be obtained by DM’ing Tailscale with 90 days of close date. UK and Australian winners may object to their surname and county/region being made publicly available. See our Privacy Policy [here](http://tailscale.com/privacy-policy). Canadian residents must correctly answer a mathematical skill-testing question to win. Quebec residents: Any litigation respecting the conduct or organization of a publicity contest may be submitted to the Régie des alcools, des courses et des jeux for a ruling. Any litigation respecting the awarding of a prize may be submitted to the Régie only for the purpose of helping the parties reach a settlement. German residents: Der Rechtsweg ist ausgeschlossen. Sponsor: Tailscale Inc., 100 King Street West, Suite 6200, 1 First Canadian Place, Toronto, ON, M5X 1B8 Canada. This giveaway is not sponsored by social platforms.
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