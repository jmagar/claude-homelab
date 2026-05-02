Tailscale for DevOps: On-demand access to your Tailscale resources with Sym
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|August 03, 2022
# Tailscale for DevOps: On-demand access to your Tailscale resources with Sym
Managing privileged access can help improve security by reducing unnecessary access to sensitive resources and customer data. With [Tailscale ACLs](/kb/1018/acls/), you can already manage access to company resources and [restrict access with “default deny” rules](/kb/1018/acls/#introduction).
But what if there’s an emergency, and the person on call needs to access your production environment? Solving this is why we’re excited to [partner with Sym](https://blog.symops.com/2022/08/03/tailscale-integration-announcement/)! Now, users can easily request temporary access to sensitive resources in Tailscale via Slack. These requests can then be approved by team members directly in Slack, or even be automatically approved for certain people — such as on-call engineers.
### Escalate permissions based on Sym access requests
Tailscale helps users securely access resources in their network — such as production environments and databases — with access rules defined as code. However, sometimes a user needs a resource they don’t currently have permission to access. For example, a user might need to debug an issue, or an on-call employee may need to request elevated access during an emergency. That’s where *on-demand access* can help.
[Sym](https://symops.com/) provides intelligent approvals as code and lets teams centralize privileged access management for their whole infrastructure — enabling engineers to request temporary access to the sensitive resources they need to complete specific tasks.
With Sym, users can get time-limited access to resources on their Tailscale network by requesting membership to [groups defined in Tailscale ACLs](/kb/1018/acls/#groups). And since [Tailscale SSH](/kb/1193/tailscale-ssh/) also defines SSH access rules in ACLs, you can grant SSH access by updating group membership using Sym, if you have an access rule allowing SSH access.
To use Sym with Tailscale:
* Create ACLs in Tailscale that define which groups can access specific resources — for example, allowing `group:prod` to access `tag:prod`.
* Integrate Tailscale with Sym [following the documentation](https://docs.symops.com/docs/tailscale).
* Individuals can then use `/sym req` in Slack to request time-limited access, for example to `group:prod`.
Once approved, the requesting user will have access to the nodes, or ability to SSH into the instances that their escalated Tailscale ACL group gives them access to. Then, when the amount of time specified in their request is up, Sym automatically revokes the user’s access.
Sym also provides a [Python SDK](https://sdk.docs.symops.com/) that can be used to specify special routing rules for requests, or automate approvals based on a user’s identity, on-call status, or Okta group membership.
Check out Sym’s [documentation to get started with on-demand access to Tailscale](https://docs.symops.com/docs/tailscale).
### Request access to Tailscale using Okta groups
If you’re using [Okta user & group provisioning](/kb/1180/sso-okta-scim/) in Tailscale, you can also manage access to membership in groups synced from Okta to Tailscale using Sym. In this case, use [Sym’s Okta integration](https://docs.symops.com/docs/okta-shared) and set up a Sym access flow for each of the Okta groups included in your Tailscale ACLs.
### Sym and Tailscale
You can use Sym to request access to sensitive resources in your Tailscale network, including SSH access to your production environment. By using Sym with Tailscale you can:
* Give engineers time-limited SSH access to production resources when there’s an incident.
* Ensure new team members get access to the right resources based on their role.
* Automate approval for Tailscale resource requests based on who’s on call in PagerDuty, using the [Sym SDK](https://docs.symops.com/docs/python-sdk).
* Manage all requests and approvals from Slack, without losing context!
[See the documentation](/kb/1206/ondemand-sym/) to get started managing access to Tailscale resources with Sym.
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