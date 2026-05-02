Tailscale for DevOps: On-demand access to your Tailscale resources with Indent
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|July 26, 2022
# Tailscale for DevOps: On-demand access to your Tailscale resources with Indent
As your teams grow and become more distributed, it makes sense to limit an employee’s access based on their job function rather than to give everyone persistent access to your production environment. This not only lets you manage sensitive resources such as customer data more effectively, but it also reduces the risk of accidentally impacting production — for example, by running a query meant for your staging environment. This doesn’t mean you want to prevent the legitimate use of these resources, such as when someone’s on call, but simply to ensure they *only* have access when they’re on call.
Following the [principle of least privilege](/learn/principle-of-least-privilege/), teams should limit access to sensitive production resources to only those who need it, and only when they need it. [Tailscale ACLs](/kb/1018/acls/) already let you manage access to company resources and [restrict access by default with “default deny” rules](/kb/1018/acls/#introduction). But what if someone needs access to a server they don’t normally use? That’s why we’re excited to [partner with Indent](https://indent.com/blog/tailscale) — so members of your team can easily request, and reviewers can easily approve, time-bounded access to these resources without ever leaving Slack.
### On-demand access to sensitive resources
Tailscale helps users securely manage production resources with access rules defined as code. If a user needs access to something they don’t normally use — like a customer database, to debug an issue — that’s where *on-demand access* comes in. With Indent, users can request access to resources on their Tailscale network by requesting membership in [groups defined in Tailscale ACLs](/kb/1018/acls/#groups).
[Indent](https://indent.com/) lets users request access to the company resources they need to do their job, and either automatically approves requests or routes them to an approver. Auto-approved requests can leverage external information such as on-call status, and if a teammate or manager needs to review the request, users can provide additional information and get approval via Slack. This ensures valid and timely access to sensitive systems while still meeting requirements for SOC 2 and other compliance frameworks.
To use Indent with Tailscale, first you’ll need to create ACLs in Tailscale that define which groups can access specific resources — for example, allowing `group:sre` to access `tag:production`. Then, when a new teammate joins or the on-call rotation changes, that individual can request access using Indent to join the `group:sre`, getting access to the resources that group can access.
[Tailscale SSH](/kb/1193/tailscale-ssh/) also defines SSH access rules in ACLs, and similarly enables you to designate which users or groups can access which devices using Tailscale SSH. For example, you can have an SSH access rule allowing `group:prod-ssh` to access `tag:production` resources using Tailscale SSH:
```
`"ssh": [
{
"action": "accept",
"src": ["group:prod-ssh"],
"dst": ["tag:production"],
"users": ["root"]
}
]
`
```
Once Indent is connected to Tailscale, users can request access to the `prod-ssh` group and get instant, ephemeral SSH access to any of the machines tagged `tag:production`.
You can request access to a Tailscale group as part of an Indent petition, including a group that has access to use Tailscale SSH.
Check out [Indent’s documentation to get started with on-demand access to Tailscale](https://indent.com/docs/webhooks/deploy/tailscale).
### Time-bound access to production resources
In addition to automatically provisioning access, Indent can also automatically revoke access after a period of time — giving users [time-bound access to production resources](https://indent.com/use-cases/production) via Tailscale. This way, for example, users can access production environments only when they’re on call, and limit unnecessary permissions (and unnecessary pages).
When a user requests access to a group in Tailscale, the reviewer can specify a predefined amount of time for which the access is valid — 15 minutes, for example. When the time is up, the user’s access is automatically revoked. Every request and approval in Indent is logged, which can be turned into auditor-friendly reports with just a few clicks.
### Indent and Tailscale
You can use Indent to request access to anything in your Tailscale network whether it’s a sensitive internal web-based tool, internal API, or production SSH access. By using Indent with Tailscale you can:
* React to incidents faster with production access auto-approvals for on-call teams
* Get temporary access to run a production database migration
* View server logs or debug data to fix an issue without retaining persistent access
[See the documentation](/kb/1205/ondemand-indent/) to get started managing access to Tailscale resources with Indent.
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