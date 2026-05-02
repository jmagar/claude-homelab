Pricing v3, plans, packages, and debugging
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|April 18, 2023
# Pricing v3, plans, packages, and debugging
Today we’re announcing the third generation of Tailscale plans and pricing. Most noticeably:
* The Free plan is expanding from one to three users.
* Monthly paid plans now include three free users, and bill you only for additional users who actively exchange data over Tailscale (“usage-based billing”) rather than for a fixed number of seats.
* Annual prepaid plans will have a new structure.
The new plans should save money for essentially everyone, but **you can keep your old plan if you want.**[1](#one) Existing annual, custom, and enterprise subscriptions are unaffected, and changes are opt-in. Monthly prices per user are staying the same.
You can find the details on our new [Pricing page](/pricing/) and our [Pricing & Plans FAQ](/kb/1251/pricing-faq/). And information about our new Enterprise plan in [David Carney’s blog post.](/blog/enterprise)
…Phew! Thank goodness that’s over with. Now let’s talk about debugging Tailscale’s pricing plans.
### Friction points
In [How our free plan stays free](/blog/free-plan/), I wrote about why we have a free plan at all, how our word of mouth multiplier works, how individuals use Tailscale at home, and how some of them then bring it to work. That’s all still true. But sometimes when we look at the data we find interesting things. For example:
Figure 1. Moving-average rate of creation (i.e. first derivative) of new 1-user vs 3-user tailnets over a long period (note: different y axis scales). Notice the accelerating curve of the first and the linear increase of the latter
Not to brag, but both of these growth curves are great news. Since they describe the *creation rate* of new tailnets, they show the aggregate number of tailnets is increasing very rapidly in both cases. What they say is the number of new tailnets created each week or month is consistently greater than the number created the previous week or month. 🚀 Super.
Nevertheless, the two curves have different shapes. The single-user tailnet signup rate is growing exponentially (aggregate tailnets: also exponentially) while the multi-user tailnet signup rate is growing linearly (aggregate tailnets: quadratically). Both user growth rate patterns are pretty common for SaaS startups and both are signs of rapid success, but they come from different places. Contrary to intuition, [most hypergrowth startups experience quadratic rather than exponential growth](https://longform.asmartbear.com/exponential-growth/index.html#hypergrowth-is-quadratic).
But exponential growth is even better. We’re seeing it in our single-user tailnets, which means our [R0 is more than 1.0](https://en.wikipedia.org/wiki/Basic_reproduction_number), but not when tailnets get bigger, which means an R0 of less than 1.0. Why?
Because there is a tremendous difference between trying Tailscale yourself, and convincing a friend or co-worker to try Tailscale with you. In fancy startup speak we call that difference *friction*.
Our hypothesis: friction in creating multi-user tailnets reduces the R0 of multi-user tailnets to less than 1.0, preventing exponential growth. As a result the slower (albeit still rather fast) quadratic growth effect is what’s left.
Because we’re perfectionists, all the changes in today’s Pricing v3 are intended to reduce this friction and make these two curves the same shape.[2](#two)
### A quick note on retention
>
> For simplicity, these plots are showing signups. But please don’t immediately go reorient your own entire company strategy around signup rates. There are many other factors in a growing user base, including users actually using the product (“activation”) and then continuing to do so (“retention” which is the opposite of “churn”). Every SaaS company has lossy activation and imperfect retention, including Tailscale. Even a very low churn rate can eventually become the limiting factor on growth. For now, suffice it to say that we also spend a lot of effort on activation and retention and we’re confident that those rates don’t impact the present discussion.
>
### Personal, self-serve, and enterprise
Over and over in our analytics, we have found that [Adam Gross’s GTM 3.0 model](https://www.heavybit.com/library/video/self-serve-go-to-market) matches exactly how users think about Tailscale. I wrote about it in [How our free plan stays free](/blog/free-plan/).
In his talk, Adam says modern SaaS products provide three kinds of value to users: personal (where people get value from using the product on their own); self-serve bottom-up (where people get value from collaborating with their team); and enterprise top-down (where companies get value from centralized control and regulatory compliance). The three types of customer value are different, and they appeal to different kinds of buyers. Tailscale has buyers in all three categories.[3](#three)
A consequence of the GTM 3.0 model is that there will *always* be some friction between 1 user (personal) and 2+ users (self-serve), because they are totally different ways of using the product.
In contrast, once a team has gotten over the hump from one user to two, there’s much less friction when adding more. I call this friction point the “1→2 transition.” (I won’t show it here, but we’ve confirmed that the curve shapes for 2-user, 3-user, and 30-user tailnet creation are essentially the same, just proportionally smaller. So there’s only that one high-friction point for bottom-up users.)
Our job is to move as much friction as we can, away from that special 1→2 transition. And so: **from now on you get 3 free users rather than one.**[4](#four)
Plus, on the new Free plan, you can try out almost all the features of Tailscale,[5](#five) not just basic ones, because locked-out features also create friction. So do trial signups, trial time limits, “contact sales” buttons, unlisted prices, having to enter a credit card, and having to get budget approval from your boss. Some of those you’ll have to do eventually anyway, but we don’t want them at the critical 1→2 point.
Now you and a couple of co-workers can bring Tailscale to work and use it in production for as long as you want and be sure you’re not going to pay us accidentally, because you don’t have to enter a credit card at all, and there is no time limit. [Free means free](/blog/free-plan/). Free means no budget approvals are needed before you can get work done.
### Removing discontinuities
Another oddity that has always bugged us about Tailscale’s pricing until now (affectionately known as Pricing v2) is that if you upgraded from the free 1-user plan to a paid 2-user plan, i.e. added one additional user, you had to pay for *two* users.
To smooth the discontinuity, all paid plans now only pay for incremental usage above three users. That is, if you have a 5-person team at work, the first three are still free. You’d pay for only the 2 additional users (and only if they’re active, more on that below). There’s obviously a new friction point at the 3→4 transition (you have to start paying!) but it should be less annoying since there’s no outsized jump when you activate the first paid user.
### Fewer arbitrary limits
When we created [Pricing v2 back in 2021](/blog/2021-06-new-pricing/), we had a few hypotheses about how people might use Tailscale, which our experience have now shown to be false. So we loosened some limits:
* **No more limits on subnet routers.**[6](#six) We thought people might overuse subnet routers instead of installing Tailscale directly on nodes and getting the benefits of true end-to-end encryption. Our fears were unfounded; in our experience people are using subnet routers wisely for the right reasons, and the tight limits on subnet routers were holding people back in certain important cases. Gone.
* **No more limits on admin accounts.** It wasn’t a useful plan differentiator and created friction. Now you can have as many admin accounts as you want.
* **More free nodes, and twice as many nodes per user.** We picked the old nodes-per-user limit based on the 99th percentile of Tailscale usage back in early 2021. Since then, we’ve launched [tsnet native apps](/blog/tsnet-virtual-private-services/), [Tailscale in docker containers](/kb/1184/docker-desktop/), [ephemeral nodes](/kb/1111/ephemeral-nodes/), and other features that encourage typical users to create more nodes. That’s great! We never intended to make you pay extra for those. Fixed.
* **Simpler scaling of ACLs.** Our previous “ACL named users” limit turned out to be hard to explain, understand, and plan for. In our new [Starter package](/kb/1251/pricing-faq/), we’ve switched to a simpler limit based on how we observed real teams using ACLs when directly replacing a traditional VPN, using [autogroups](/kb/1018/acls/) for all users or only admins. The Premium package still has unlimited fine-grained ACLs.
### Usage-based billing
Here’s a problem nearly every software vendor faces, but few want to talk about. Sometimes customers don’t fully deploy or use all the seats that they buy.
Of course they *intend* to use them. Their usage goes up, and sometimes down, over time. But sometimes the deployment gets delayed, or the adoption isn’t as quick as anyone expected. Sometimes usage even starts to decline.
Below is some fake but realistic data of a hypothetical Tailscale customer that did all of the above. They started by ramping up more seats than they paid for, eventually upgraded their subscription, exceeded it again by a bit, and then perhaps got hit by an economic downturn and had to scale back, at which time they were using fewer seats than they paid for.
Figure 2. A simulated customer whose usage did not exactly match what they paid for. Blue areas indicate times when they should have paid more; red areas indicate times when they could have paid less.
Nobody really likes overpaying *or* underpaying. We can do better. The solution for self-serve customers turns out to be simple: **we’ll bill you retrospectively each month for the number of users who actively used Tailscale** (i.e., exchanged bytes of data over your tailnet). That is, even if you roll out Tailscale to 1000 employees, if only 10 of them use your Tailscale network in a given month, we’ll only bill you for those 10 “active” users, automatically (and since the first 3 are free, we’ll actually only bill you for 7). Since most of our paying customers have at least some fraction of their paid seats inactive in a given month, **almost everyone will save money under this plan.**
More importantly, it aligns our incentives. We don’t want you to buy Tailscale seats for no reason; if you’re deploying it, you hope people will use it. With this change, we don’t get paid for a user in your tailnet until that user is getting value from Tailscale. That means it’s not just our job to sell seats, but to help you succeed.
### Annual plans
Traditional self-serve annual plans don’t make sense with metered billing: will we wait 12 months before billing you for what you used that year? Accountants say no.
Luckily, our analytics showed that our customers pay for, on average, 20% more seats than are active in a given month. That means switching to monthly usage-based billing typically results in about a 20% discount from what you thought you were going to pay. That’s bigger than our old annual discount (16%). So we won’t be offering new self-serve annual plans for now.
However, we know different companies and enterprises have varying needs, so we’re not removing your choices. You can opt into self-serve monthly metered billing, or buy an old fashioned fixed-rate annual plan, or buy prepaid credits that will be deducted monthly based on your usage. [Contact our sales team](/contact/sales/) to learn more about flexible billing options.
### The Unexpected Giant Bill problem
If you’re anything like me, when you hear “usage-based billing” or “metered billing” or “consumption-based billing” you start to panic a little. We’ve all heard stories of university students who woke up one morning and found out they owed AWS tens of thousands of dollars because they left a 1000-node experimental cluster running wild for a few days after doing a school project. Or maybe you’ve experienced something similar at work when you egressed too much data or an autoscaler autoscaled a little too optimistically and nobody noticed until it was too late.
Although usage-based billing is the most honest way to charge for Tailscale, we also want to prevent unhappy surprises. Your spending is capped in three different ways:
* Only users in your domain in your SSO identity provider (IdP) can join your tailnet in the first place, so you’ll never pay for more seats than there are users at your company. When an employee leaves, their devices will go inactive so you will automatically stop paying for them.
* If you activate our new [user approval feature](/kb/1239/user-approval/), you can prevent any user from joining your tailnet without specific approval, even if they are in your IdP. [Invite users](/kb/1064/invite-team-members/) to your tailnet when you’re ready to onboard them. This gives you strict control over who joins your tailnet, and thus your maximum bill.
* You can modify your [tailnet policy](/kb/1018/acls/) (your ACLs), which is default-deny, to only enumerate specific users or [Okta SCIM groups](/kb/1180/sso-okta-scim/) who are allowed to send traffic over Tailscale. For any other users: no ACL, so no traffic, so no charge.
And of course, on the Free plan there are only a maximum of three provisioned users, period, and no credit card on file, so you’ll never have to worry about being accidentally billed.
### What’s next
So that’s why we made the changes we have, and what we expect the outcomes to be. I hope you’ll experience it all as less friction, more aligned incentives, and the kind of thoughtful refinement we try to achieve whenever we make a change.
…But just in case you don’t, we’re always looking for feedback on our pricing, packaging, plans, and every other part of our product. Great ways to talk to us are on [Mastodon](https://hachyderm.io/@tailscale), on [Twitter](https://twitter.com/tailscale/), or by [contacting our sales team](/contact/sales/) or [our support team](/contact/support/).
1We will keep our v1 and v2 pricing plans available until *at least* April 30, 2024.
2Obviously there will always be far fewer 3-user tailnets than 1-user ones, which is fine. We just want them to be proportional.
3We also have two distinct categories of self-serve bottom-up buyers, hence two different price points, but we’ll leave that discussion for another day.
4For historical architectural reasons you cannot currently have more than one user on a “personal” tailnet (such as a gmail.com account). You need either your own domain or a [GitHub Organization](/kb/1154/free-plans-discounts/). Sorry. We will fix this, but not today. Meanwhile, don’t forget that you can use [Node Sharing](/kb/1084/sharing/) to share devices (including [Exit Nodes](/kb/1103/exit-nodes/)) across individual tailnets.
5Except network flow logging (for privacy and abuse reasons) and SCIM group sync (because of the support costs for getting people set up). We’re hoping to remove these limitations in a thoughtful way once we figure out how.
6In the same sense as a “no limit” credit card, we will have to have some kind of technical limit on subnet routers so you don’t crash our servers. But you shouldn’t run into those limits unless you’re doing something really weird. From now on, even a setup with several subnet routes advertised by each and every node on your network will be fine.
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