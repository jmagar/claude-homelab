What we learned (and can share) from passing our SOC 2 Type II audit
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|September 06, 2022
# What we learned (and can share) from passing our SOC 2 Type II audit
Good news everyone: Tailscale is SOC 2 compliant! Wait… [weren’t we already compliant](/blog/soc2/)? Yes, but now we’re SOC 2 *Type II* compliant… which is kind of a big deal.
**As part of our ongoing commitment to security and privacy at Tailscale, we’ve completed a SOC 2 Type II audit**. Our Type I audit validated that we had policies and procedures in place to keep your information safe. Now, our Type II audit validates that our security controls were effective over the period of time evaluated and that we’re actually implementing the policies and procedures we committed to.
### SOC 2 Type II validates that we’ve *actually* implemented our stated security controls
SOC 2 is a compliance standard that dictates several controls for appropriately managing customer data. Our SOC 2 Type I audit (i.e. [what we completed a few months ago](/blog/soc2/)) verified that our internal policies and procedures were in line with industry standards to keep your information safe — as validated by an independent auditor. Our SOC 2 Type II report verifies that we’re *actually* following these policies and procedures. Whereas a SOC 2 Type I report looks at a snapshot of controls at a moment in time, and whether or not those controls have been appropriately defined, a SOC 2 Type II report looks at controls over a period of time and whether or not those controls have actually been put in place and are effective. To learn more about the overall SOC 2 process, [check out this great blog post from our friends over at Fly.io](https://fly.io/blog/soc2-the-screenshots-will-continue-until-security-improves/).
Example policies we have in place that our auditor reviewed during the test period:
* Require single sign-on (SSO) and multi-factor authentication (MFA) to access our production environment and limit access based on job function.
* Require that a second engineer approve any non-emergency changes before releasing them to our production environment.
* Have a customer approve any manual changes to their environment via a support ticket before we make a change in the production environment.
* Send automated alerts to the engineering team when changes are made to the production environment.
* Test our data restoration procedures to confirm the integrity of backup data.
* Follow our incident response process for security and availability incidents, including completing a post-mortem and [contacting affected parties](/security-bulletins/), if applicable.
* Enroll new employees in security awareness training as part of their onboarding process.
* Review our security policies.
* Review the vendors we use, what data they can access, and review their security practices.
**Our SOC 2 Type II report contains a more complete list and detailed explanations of our [security controls](/security), with validation from our auditor. This report covers a period from April 1 to June 30, 2022, for the trust services criteria of Security, Availability, and Confidentiality**. To request the report, [contact sales](/contact/sales). *Note that both existing and prospective customers will need to sign an NDA to access the report.*
Continue reading to learn about some of the challenges we faced with our audit, open source tools we’d like to share, and how we think our SOC 2 compliance efforts can be improved.
### Conversations with our auditors that didn’t go as planned
Our marketing team tells us you all love it when we write about “how things work,” so let’s talk about the parts of our SOC 2 process that didn’t go how we expected.
#### Even with good security controls, it took months to complete an audit
Against prudent advice, we *didn’t* start [preparing for SOC 2](https://latacora.micro.blog/2020/03/12/the-soc-starting.html) far enough in advance of engaging our auditors. Fortunately, we had already put significant effort into our security, such as using SSO for our apps, hardening access to our production environment, and running security awareness training at our virtual onsites.
So what was unexpected? Just how busy auditors get! The time it took to find and engage an auditor for our SOC 2 Type I report was about two months. Then, completing the SOC 2 Type I audit took another four months, as we implemented any missing security controls — though putting in place other processes are what took the bulk of effort, such as writing down our security policies or implementing our performance review process. After completing our SOC 2 Type I audit, we then underwent a SOC 2 Type II audit covering a three-month period. The lesson? Even if your security is pretty good, don’t expect to complete a SOC 2 Type I audit in fewer than six months, and a Type II audit in fewer than nine months. (And remember to take that into consideration before you make a commitment to customers!) Contact your auditor early.
#### The most time-consuming part of SOC 2 was defining our processes
Given where we started with this audit, by far the most time-consuming part of SOC 2 was implementing various internal processes such as how we do reference checks and performance reviews, update security policies, and complete vendor security assessments.
SOC 2 is a standard that was developed by accountants — so there are a lot of requirements related to job descriptions, org charts, performance reviews, business continuity plans, and other things that you might not think of as “security,” but that are strongly related to addressing potential risk in your organization. These were the things that took time. For example, you can’t (or rather you shouldn’t) just complete a performance review process without doing it well, and without explaining to employees what you’re doing. Take these processes into consideration when planning your SOC 2 audit.
#### Using non-standard infrastructure meant “easy SOC 2 tools” were out of the question
There are a lot of available tools that claim to help with SOC 2 audits. They do this by verifying you have the right security settings enabled in your infrastructure, or by helping get screenshots for your auditors. If you’re a fairly straightforward SaaS app using a cloud provider like AWS or GCP, these probably can save you a lot of time.
But… if you’re like us and you run infrastructure on AWS, DigitalOcean, and Vultr; and you use Ubuntu for some applications but NixOS for others; and [keep your database in a single file on disk](/blog/database-for-2022/)… the automated tools barely help at all. They can get you some screenshots in AWS, but that’s pretty much it. It didn’t make sense for us to use these tools, so we didn’t; instead, we had exhilarating real-time screenshot meetings with our auditors.
Putting in the effort to build, implement, and validate our own tools means we now have a set of controls that fit our business. And because we didn’t use a more automated SOC 2 process and auditor, we didn’t sign up for a set of controls that don’t work well for our business — and we don’t regret it! Right-size the controls that work for you, depending on what your environment and organization look like.
#### If you’re an auditor, Tailscale is a VPN
When we try to explain what Tailscale is, we sometimes have trouble summarizing everything it does. Tailscale lets you connect all your devices in a private network — so it’s a VPN! Right? Yes, no, I mean not like that.
When talking to an auditor, it’s really simple: Tailscale is a VPN. At Tailscale, we use Tailscale for our internal network, including managing access to specific applications and restricting access to production (don’t worry, we also have a backup solution, to avoid the bootstrapping problem). How did our auditors explain this?
>
> All transmissions of electronic information are encrypted as the default setting over public networks via secure transmission protocols (e.g., HTTPS and VPN).
>
We guess the lesson here is that we can talk about [WireGuard](https://www.wireguard.com/)®, [ACLs](/kb/1018/acls/), and [SSO](/kb/1013/sso-providers/) all day long if we want. Our auditors are just happy that traffic is encrypted and it’s a VPN. We’ll take it!
### Tools we used to help with our SOC 2 audit
Tackling security and compliance requirements (starting from non-standard infrastructure) for SOC 2 required heavy lifting — especially in areas where we didn’t already have a solution, or where using a vendor didn’t make sense. In those cases, we developed the tools we needed ourselves — and we’re now open-sourcing those tools so you can use them for your SOC 2 audit, too.
#### Approve emergency production changes with our “ToBeReviewed Bot”
Your SOC 2 auditor will probably insist that you approve every change *before* it gets made in production. For most situations, that makes sense; but when you’re dealing with an emergency alert at 2am, it doesn’t.
What does that mean in practice? For regular production changes such as fixing a bug, building a new feature, or updating dependencies, we use [branch protection rules to require a review](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/defining-the-mergeability-of-pull-requests/about-protected-branches#require-pull-request-reviews-before-merging) before merging. However, for emergency changes, we still allow developers to [force push a branch](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/defining-the-mergeability-of-pull-requests/about-protected-branches#allow-force-pushes) to production. But we always review these changes afterward to ensure they should have been permitted.
Here’s how our auditors explained it:
>
> Non-emergency pipeline releases and infrastructure changes must be tested and approved by a member of management prior to promotion into production.
>
>
> Emergency changes are implemented into production and reviewed by management for approval within two business days from the date of implementation.
>
To ensure we catch these force pushes and actually review them, we built the [ToBeReviewed Bot](https://github.com/tailscale/ToBeReviewedBot) (affectionately dubbed TBR bot). If a PR is submitted without an approver, the bot will notice and, within a few minutes, file a GitHub issue requiring follow-up. The bot also does not intervene where intent is clear — for example, merging someone else’s PR or commenting “LGTM” are both also considered approvals. We deploy TBR bot on Fly.io and use it to watch changes to our production repos.
**We’ve open-sourced [ToBeReviewed Bot](https://github.com/tailscale/ToBeReviewedBot) so you can use it as part of your workflows, too.** If you’re going through SOC 2 compliance and use protected branches, you might find it handy.
#### Take our security policies so you don’t have to start from scratch
Your SOC 2 auditor will also insist that you have a long list of security policies covering everything from incident response to vendor management. Prior to starting the SOC 2 process, we had a short 3-pager covering key points, but it didn’t lay out every item required by our auditors. We needed to develop more policies.
We set out to write these policies ourselves partly because we didn’t like the examples we saw, and partly because we have non-standard infrastructure, but mostly because we are very discerning about security. Again, we wanted to make sure our policies matched our reality — having a policy that doesn’t is useless. (Of course, we were still inspired by what we found online.)
We’ve put these policies in Git because like other documents needed for our SOC 2 audit, we need document control to track what changes were made over time, by whom, and who reviewed and approved those changes. Using Git gives us exactly that — we can suggest changes, then review them as part of our regular policy reviews.
**So, in the hope of helping you complete your SOC 2 audit (and us never having to write these policies at the next startup, ever again) — and in the spirit of transparency about where we are in terms of security — [we’re publishing our internal security policies](/security-policies).**
Tailscale has implemented several security policies to properly identify, respond to, and mitigate potential security risks. All employees, vendors, and contractors working with Tailscale must follow these policies in order to best protect Tailscale’s data and our customers’ data alike. *Coincidentally*, putting these policies in Git also makes it easier for you to be “inspired” by these security policies: [Check out tailscale/security-policies](https://github.com/tailscale/security-policies) for help when you create your organization’s security policies.
If you’re considering using Tailscale in your organization, these policies are one more document that you can use as part of your vendor security review. (Or at least one you won’t need to manually request!) Are they perfect? Absolutely not. But we hope to improve them over time. However, these policies *do* reflect the current state of our security practices as validated by an independent auditor in our SOC 2 Type II report. You can track how these change by [watching the repo](https://github.com/tailscale/security-policies).
#### Don’t do everything yourself: Use any third party for security awareness training, as long as it’s Ninjio
Some things are worth building yourself, and some things aren’t. When we started the SOC 2 process, our security awareness training was a video of two employees talking about using security keys. Useful? Yes. Engaging? Not really.
We enrolled all of our employees in security awareness training from [Ninjio](https://ninjio.com/), and they love it! Slack still blows up on the first Tuesday of every month with comments on everything from real-world security threats to the latest episode’s voice actors (this month: they’re from Relic Hunter and Wayne’s World), and the creative use of finger guns instead of real guns (more secure).
This was unexpected. Point is: while we didn’t build it, if you want a security awareness training solution that your employees love, we can wholeheartedly recommend Ninjio. We use the [SMB plan](https://ninjio.com/small-business/) with the anime videos (obviously).
### What could still be better
We realize that security and compliance work is never done, and we’ll keep working to improve both — to ensure we meet (or exceed) compliance requirements as we continue to grow. That said, some things surfaced during our SOC 2 process that we already know we want to improve on. With the goal of earning trust through transparency, here are a few areas where we’re working to get better.
#### Vendor security reviews are painful and time-consuming
As part of our SOC 2 audit, [we needed to put in place a more formalized process for vendor reviews](/security-policies/vendor/). Including past vendors and those currently under evaluation, we have 80+ vendors — everything from SaaS tools like Slack, infrastructure like AWS and Vultr, tools for specific teams like ticketing systems, and everything else, including our swag vendor. It’s a lot.
Even though we’re over the initial hump of documenting and reviewing all of our existing vendors, this hasn’t been an easy process.
Having completed lots ofvendor security questionnaires, we want to be as efficient with our vendors as possible, so we just ask them for their SOC 2 report. If they don’t have it, then we ask for security documentation as needed. If each SOC 2 report is 100+ pages, this is still a shockingly large amount of material to review. Right now, we track these audits with a makeshift ticketing system, and we right-size the audit to the vendor — for example, we might be more stringent about data access controls for a vendor with access to customer payment information or employees’ personal details than a vendor who manages our design assets.
We’re still working on improving our ticketing system and further automating vendor review (and re-reviews). (Please, please don’t email us to tell us your product is a solution to this problem. We know.)
#### You need to sign an NDA to get a SOC 2 report
After requesting many SOC 2 reports from our vendors, we know what we *don’t* want to do to our customers:
* You shouldn’t need a specific business subscription to access the SOC 2 report.
* You shouldn’t need to be signed in to access the SOC 2 report. If you’re a security reviewer, you might not have a business reason to use the tool, or it might be a tool you’re considering but haven’t started using yet.
* You shouldn’t need to file a support request, get passed on three times, and then be told to fill in a form to get a SOC 2 report.
(Yes, these all happened to us.) SOC 2 reports *do* however require an NDA to be accessed, because… auditors.
Unfortunately, if you are requesting a SOC 2 report from Tailscale today, our process *still* isn’t great. Whether you’re a new or existing customer, you can contact our sales team, who will ask you to sign an NDA and then share the report. It’s manual. It sucks (and we know it), so please be nice.
Following great examples from [CircleCI](https://circleci.com/security/), [Vercel](https://vercel.com/security), and [Notion](https://www.notion.so/help/security-and-privacy), what we’ve done is make as much information publicly available about our security controls as we can. You can find information about our security controls and answers to common questions on our [Security page](/security/) (including the aforementioned security policies). As for the SOC 2 report itself, we’re working on removing the need for a separate NDA, or automating an NDA flow, and we’re hoping to make the report available on our website to logged-in users in order to limit manual requests to only prospects who don’t yet have a Tailscale account. (Again, please don’t email us about your solution.)
*Update: Since 2023-01-12, existing customers don’t need a separate NDA to get our SOC 2 report — it’s covered by Tailscale’s Terms of Service. Prospective customers will still need to sign an NDA. Download the report from our [legal page](/legal).*
#### Our endpoints aren’t in scope for our SOC 2 audit
We didn’t put our endpoints (i.e. employee laptops) in scope for our SOC 2 audit. The good reason is that we don’t use these to store user data or to build our infrastructure (though we do use them to develop and test code). The bad reason is that we have a large variety of operating systems since we test Tailscale on many different platforms, and finding a reasonable MDM to cover roughly 50 employees’ worth of Linux (with many different distros), macOS, Windows, iOS, Android, Steam deck, Synology, and Chromebooks isn’t possible.
We’re still improving our endpoint security, and we hope to put them in scope for our future SOC 2 reports as needed.
It’s worth restating how ridiculously committed and passionate we are about security and privacy, because they really are super important. We’re glad that we’ve completed our first SOC 2 Type II audit, and we’re proud of the results — and we hope you’re satisfied with the results as well. This work is never done, and we’re now on the hamster wheel of keeping up with our security controls and delivering these audits on a regular basis. As always, we’ll keep working to make this easier, while improving our security.
Share
Authors
David Anderson
Rachel Lubman
Denton Gentry
David Crawshaw
Authors
David Anderson
Rachel Lubman
Denton Gentry
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