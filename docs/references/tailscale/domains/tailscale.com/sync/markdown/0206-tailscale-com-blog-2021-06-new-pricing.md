New Pricing Model Makes Scaling with Tailscale Less Expensive
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|June 28, 2021
# New Pricing Model Makes Scaling with Tailscale Less Expensive
Today, we’re announcing **a new pricing model for Tailscale** that makes it less expensive for everyone, and easier to scale from a small test deployment to something your whole friend group, startup, or organization can use.
[Check out the new pricing](https://tailscale.com/pricing), or read on for details about what’s changed and why.
### [What’s new?](#whats-new)
We have an all new set of plans — we’re replacing our current Connectivity and Business plans with the new **Team plan** and **Business plan**. We’re also now providing an annual billing option, which gives two months off whichever plan you choose.
When billed annually, the Team plan is $5/user/month, and the Business plan is $15/user/month, **up to 50% less than before.**
#### [Device limits](#device-limits)
For team plans, device limits now scale with the size of your network.
Previously, teams were stuck at a flat limit of 100 devices or 500 devices depending on their plan. **Now, for each user you add to your network, your device limits grows too.** This makes it easy for small teams to get started with trials and scale alongside their deployment. We also offer the ability to add 10 additional devices for $5 per month.
For the solo plan, we’re changing the device limit for new users from 100 to 20 devices. While this sounds like a large reduction, fewer than 0.4% of individual users have more than 20 devices, and leads into our next announcement…
#### [Personal Pro plan](#personal-pro-plan)
Alongside our Team and Business plans, we’re introducing a **Personal Pro plan**, for homelab hobbyists or personal users with complex setups. It expands your personal network with 80 more devices, an additional subnet router, and access to team features like customizable key rotation policies.
We’ve also had some individual users who insisted on paying us, but were previously restricted from doing so. If you really want to… now you can!
We’ll also be gifting lifetime Personal Pro subscriptions to prominent contributors to the community and users whose code we rely on.
#### [Subnet routers](#subnet-routers)
Subnet routers, which [let you connect devices you can’t install Tailscale on](https://tailscale.com/kb/1019/subnets/), are now available for every plan.
All plans now include a set number of subnet routers. 95% of teams and companies using Tailscale today already fit within these limits. If you need more, you can purchase additional routers for $25 per router per month.
(Note: Some teams use subnet routers to more easily connect to Kubernetes clusters, or work around limitations of Tailscale. If your team falls into this category, get in touch and we’re happy to work something out.)
#### [Access controls](#access-controls)
ACLs are now available for all pricing plans! How does this work?
For organizations on the Business plan, nothing changes. You still have full access to all ACL features, now at a lower price.
For other plans, your plan now comes with an included number of unique users in your ACL policy. Rules you write that target individual users count against that number. Rules that target devices, subnets, tags, or wildcards (read: everyone) are always free and don’t count.
For example, here’s a policy that allows **two unique users** who need access to sensitive resources to have that access, and apply wildcard rules for everyone else.
```
`{
"Groups": {
"group:engineers": ["shreya@smallhouse.co", "sam@smallhouse.co"],
"group:founders": ["shreya@smallhouse.co"]
},
"Hosts": {
"gitlab": "100.72.83.124",
"file-server": "100.35.46.13",
"staging": "10.0.1.0/24",
"production": "10.0.2.0/24"
},
"ACLs": [
// Everyone can access internal tools
{
"action": "accept",
"src": ["\*"],
"dst": ["gitlab:\*", "file-server:\*"]
},
// Engineers can access production and staging servers
{
"action": "accept",
"src": ["group:engineers"],
"dst": ["staging:\*", "production:\*"]
},
// Founders can access everything
{ "action": "accept", "src": ["group:founders"], "dst": ["\*:\*"] }
]
}`
```
Since most teams only need a few users with privileged access, the 5 included users on the Team plan means big cost savings. And if you need just a few more, you can add them to your plan for an extra $12 per user per month.
#### [Other features](#other-features)
Beyond these changes, our new plans also offer more features to more plans:
* Basic access control features [like ACL tags](https://tailscale.com/kb/1018/acls#acl-tags), which help manage services that don’t belong to any one user, are now available on every plan.
* A new feature for large networks, [subnet router failover](https://tailscale.com/kb/1115/subnet-failover/), is now available to users on the Business & Enterprise plans.
* Okta SSO integration is now available for all teams, not just Security plan users.### [What happens if I exceed my plan’s limits?](#what-happens-if-i-exceed-my-plans-limits)
With both legacy and new pricing, we’ll continue to use **soft limits**. You’ll never be stopped from spinning up more devices or subnet routers, or trying out ACL rules. We encourage you to play around, find what works best for you, and [update your payment settings](https://tailscale.com/account/billing) after-the-fact.
If you’re using vastly more resources than your plan allows, we’ll get in touch about upgrading to something suited for your needs.
### [What changes today?](#what-changes-today)
**If you’re already on a plan — nothing changes.** You can stay on your existing plan (including the old free plan) with the existing limits, and continue to edit/update the number of seats you’re paying for. However, we recommend you look at the new plans, as they result in \>25% in savings for most teams.
**If you’re not already a subscriber**, the new pricing is now available. Find more details [on our pricing page](https://tailscale.com/pricing).
If you have any feedback or questions, [please let us know](mailto:support@tailscale.com)!
Share
Authors
David Carney
Ross Zurowski
Sonia Appasamy
Authors
David Carney
Ross Zurowski
Sonia Appasamy
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