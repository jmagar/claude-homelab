Tailscale for DevOps: On-demand access to your Tailscale resources with Opal
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|August 15, 2022
# Tailscale for DevOps: On-demand access to your Tailscale resources with Opal
When you’re working in an environment with strict compliance needs, you want to make sure you’re following the [principle of least privilege](/learn/principle-of-least-privilege/) and granting employees access only to the resources they need to do their job. [Tailscale ACLs](/kb/1018/acls/) already make that possible by letting you define what someone can access — and restricting their access to everything else — with [“default deny” rules](/kb/1018/acls/#introduction).
In many organizations, access to resources needs to be granted temporarily, such as when someone needs additional information in order to debug a customer issue. This is why we’re [partnering with Opal](https://opal.dev/blog-post/tailscale): to provide short-lived, granular, on-demand access to resources in your tailnet. With Opal, your team can generate self-serve access requests and get automatic approvals for faster access to the resources they need, rather than waiting for their help desk ticket to be manually reviewed and provisioned.
### Just-in-time SSH access to tagged resources
Tailscale manages access to resources in your tailnet, such as SSH access to production resources, using [access rules defined as code](/kb/1018/acls/). If an employee needs access they don’t already have, the Tailscale admin needs to update the access rule or SSH access rule to reflect the change in permissions. This is a manual process, which can take time, and the new, increased access remains in effect until it is manually revoked.
That’s where [Opal](https://opal.dev/) comes in. With Opal, admins set up powerful approval and security guardrails by adding and removing members from [SSH access rules](/kb/1018/acls/#tailscale-ssh) for ACL tags as defined in Tailscale ACLs. Admins can also pre-determine how long access will remain active, or to extend it indefinitely. This means that when they need to, users can easily make access requests to resources using an automated, self-service catalog.
To use Opal with Tailscale:
* Create SSH access rules that define which groups can access which resources. We recommend you define groups based on job responsibilities and use tags to manage shared resources like servers. For example, define an SSH access rule that allows `group:oncall` to access `tag:production` using [Tailscale SSH](/kb/1193/tailscale-ssh/).
* Add the Tailscale app to Opal [following the documentation](/kb/1209/ondemand-opal/).
* Users can then use the web or Slack to request SSH access to tagged resources, including in [check mode](/kb/1193/tailscale-ssh/#configure-tailscale-ssh-with-check-mode). These accesses can require a reason, and they can automatically expire after a period of time or be granted indefinitely.
### Assigning users to Tailscale in Okta as part of onboarding
Opal also provides the ability to manage Okta apps and Okta group membership. This means that if you use Tailscale with [user & group provisioning for Okta](/kb/1180/sso-okta-scim/), you can assign new users to Tailscale when they join, and users can request access if they need it for their job.
### Opal and Tailscale
By setting up the Tailscale app in Opal, you can granularly manage your organization’s Tailscale SSH access, so that you can:
* Allow users to request just-in-time access to resources on your tailnet from web and Slack.
* Set the right resource owners to delegate approvals to those with the most context.
* Configure day-one access to Tailscale for new employees by assigning the Tailscale app in Okta.
* Automatically escalate and revoke privileged resource access based on on-call schedules, like those in PagerDuty or Opsgenie.
[See the documentation](/kb/1209/ondemand-opal/) to get started managing access to resources on your tailnet with Opal.
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