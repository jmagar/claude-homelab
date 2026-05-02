Securing customer data in production with Tailscale and Indent
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|May 09, 2023
# Securing customer data in production with Tailscale and Indent
*This blog post is contributed by Stevan Arychuk, Head of Information Security and Site Reliability at Reclaim.ai.*
[Reclaim.ai](https://reclaim.ai/) is an intelligent calendar assistant that helps teams and individuals optimize their schedules by automatically allocating time for their meetings, tasks and routines, whileintegrating with more of the places they already do their work. To do that, we process PII and Google calendar data for our 20k+ global customers.
We’re a globally distributed team with separate AWS accounts and virtual private clouds (VPCs) for developer, staging, and production environments. Our developer and staging environments don’t contain any customer data, so our focus on security controls is usually in production, and specifically our Aurora Postgres database — the only place customer data is persistently stored.
If you’re like us, this is what you’ll need from a networking and access management solution:
* Dead-simple to configure
* Low latency access/provisioning
* Integrates seamlessly with your stack and developer tools and workflow
The goal is to grant developers access to what they need with as little friction as possible, without compromising security. We do this by using Tailscale for networking and Indent for temporary access control.
### Secure the data layer
We wouldn’t be writing for the Tailscale blog if we didn’t think their zero-config VPN with the security benefits of point-to-point WireGuard® to secure our cloud network fit the bill perfectly.
So, how did we do it?
We set up individual Tailscale relays for each of our AWS environments by installing a Tailscale node for each account in our AWS org; we have separate accounts for each dev, staging and production to keep our customer data isolated.
The nodes then advertise and route traffic for their given VPC subnets; each developer has Tailscale installed on their laptop for secure access to these networks over the internet. Everything is further locked down in Tailscale using access controls (ACLs) to protect the resources in each environment, including our ECS workloads, databases and supporting AWS services.
The reason for this deployment model is that normally the AWS Managed NAT Gateway blocks UDP traffic. That’s an issue for Tailscale’s direct UDP traffic. With a node routing traffic on behalf of each VPC subnet, we have a great solution. This is way better than old AWS specific networking approaches, and keeps our bandwidth costs in check, while getting peak performance, and configurable security and access management policies.
By using Tailscale we were able to secure the network data layer, but there’s another important component to protecting customer data — by leveraging Tailscale ACLs to implement temporary fine-grained access, we prevent unnecessary persistent access to data in our production environment.
### Learn from our mistakes
We originally used this workflow to prevent persistent customer data access:
1. Engineer pings myself or our CEO, Patrick on Slack or via email indicating a need to access the production network/account.
2. We review their request, then deny or approve their access
3. To actually provision access, we need to update the Tailscale ACL for the production network/subnet to allow access from the Engineers laptop. We iterated through a number of approaches for this over time: 1. Updating the ACL via a curl command (see example in Tailscale docs)
1. Using a GitHub Action
2. Via Infrastructure-as-Code approaches using Terraform and/or Pulumi
3. We would then let the Engineer know their access has been provisioned
4. We then set a calendar reminder to remove the engineer later
5. Finally we manually remove the engineer from the ACL after an amount of time
*It was a flawless process that scaled infinitely. /s*
To say this was an imperfect process is to put it mildly — there were a number of obvious inefficiencies and pain points:
* It was generally just a pain for **everyone**
* Engineers had to wait hours or days for Patrick or me to update the ACLs to get access
* Access to the production network and customer data was often left open far longer than needed — unnecessarily increasing our threat profile.
After manually trying to lock everything down, we realized what we really wanted was time-bound RBAC so access would automatically revoke after the approved duration. Additionally, the overall automation of this workflow to reduce friction was key. We essentially now have our ACLs defined as code, which avoids things like manual changes, possible mistakes and more importantly forgotten or abandoned changes; the real win was not having to wait for the updates which meant context switching for everyone involved.
Automated compliance gathering was high on our wishlist as well, since generating evidence was needed for SOC 2 and similar audits and took a lot of time to collect and format. Both Indent and Tailscale make providing evidence for audits fairly painless, which is super important for a small team like ours.
While we didn’t know what it was called yet, the solution we were looking for was on-demand access control.
### On-demand production access
On-demand access management is a new space, but there are a few solutions out there. We ended up going with [Indent](https://indent.com/) since it has a native [OAuth integration](/blog/oauth/) with Tailscale and full access lifecycle automation; the team is also a great group of folks to work with — fun, responsive and open to working with us on our specific use cases.
By setting up on-demand access management for our production tailnet, it allows us to grant secure, justified but temporary access to our production network and data database while automatically generating SOC 2 evidence.
Our on-demand customer data access flow now looks like this:
1. Engineers enter `access.new` in their browser, use the `access` command in terminal, or `/access` in Slack, then specify what they need access to, why, and for how long
2. Their access request gets routed to our configured approvers who are @mentioned in Slack and can deny or approve access for the approver modifiable duration
3. If approved, Indent adds the user to the appropriate ACL, and Tailscale allows traffic from the users device to the production network
4. After the approved duration elapses, Indent fires off another request to the Tailscale API and removes the user from the ACL, revoking their access to the production network
Throughout the entire lifecycle Indent gathers audit evidence that we can export with a single click. (Bonus!) Just prior to the posting of this blog, we worked with Indent and their new auto-approvals feature, and integrated the above workflow with PagerDuty so engineers that are on-call are auto-approved ensuring they can get access to resolve issues in production if needed — without waking up Patrick or myself 😛.
Our advice when evaluating an on-demand access management provider is to look for these things to make setup and management easier:
1. Rules/policy based configuration so you don’t have to configure each workflow individually
2. Integrations with the tools used in your existing DevOps workflows
3. Automated triggers and logic for policy updates. Some solutions only allow you to do things like add users to the ACL/handle provisioning, but removing them from the ACL/revocation part is just as if not more important for security and compliance purposes.
4. Great UX that feels good to use, since this becomes a major part of developer and operations workflows
5. Easily provides evidence in formats and/or integrations helpful for compliance audits, preferably via APIs like Tailscale [audit logs](/blog/config-audit-logging/) to automate this key part of evidence collection.
### Benefits of on-demand customer data access with Tailscale and Indent
On-demand access management has been a major improvement on our previous system. Our engineers now wait 6 seconds on average to get access to customer data when they need it, but more importantly they ONLY get access when they need it, and it’s always temporary (and justified). This workflow is so painless that **no one in the company**, including myself or the CEO has permanent, unrestricted access to customer data.
From a compliance perspective we’re compliant basically by default — no one has access to customer data without explicit approval. Indent’s policy-based configuration method allows us to set rules that ensure approvers and access durations match our compliance controls. From there, it’s easy to apply those rules to multiple workflows which are implemented via Tailscale ACLs. That in addition to automated access revocation, auto-approvals and audit evidence generation saves us a lot of admin time.
Anyone who has been through an audit knows that a key component of compliance is evidence collection. For us, Tailscale is the actual implementation of our network security and access policies so the ability to [audit and log configuration changes](/blog/config-audit-logging/) and easily export them into our SIEM and audit platform is immensely helpful. We leverage the Tailscale API to not only implement our policy-based ACL changes, but also to retrieve these historical configuration change events programmatically, saving many hours of audit evidence collection and submission.
On-demand access management also increased our security posture through:
**Accident Protection**
Requesting on-demand access is like code review. It provides an opportunity for the approver to validate that a given server is what the user needs to access to accomplish their goal. This check prevents situations like updates to prod that were meant for testing.
**Abuse Protection**
When users need to give a business case every time they want access, it disincentivizes casual use of resources. This makes it less convenient for them to access things for personal reasons or out of curiosity.
**Attack Protection**
A common feature in recent attacks like [CircleCI](https://circleci.com/blog/jan-4-2023-incident-report/)[1](#one), is that the compromised user had standing production access. When users don’t retain access by default, the potential attack surface is significantly reduced.
### We give a damn about customer data, and you should too
We don’t take the trust of our customers lightly, and we need to respect the sensitivity of information our customers put in their calendars. A lot of companies bullshit their way through compliance audits, meeting the bare minimum to check a box, without any real commitment to infosec. At Reclaim, we’re not those people, and we hope you aren’t either because customers deserve more than that.
By implementing on-demand non-persistent access to customer data, in our case [leveraging technologies from Tailscale and Indent](/kb/1205/ondemand-indent/), you can still move quickly while protecting your production environments and customer data.
1Thank you to the CircleCI team for their transparency and for providing a great service.
Share
Author
Stevan Arychuk
Author
Stevan Arychuk
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