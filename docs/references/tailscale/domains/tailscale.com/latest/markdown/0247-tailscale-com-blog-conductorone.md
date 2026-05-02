Tailscale for DevOps: On-demand access to your Tailscale resources with ConductorOne
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|August 02, 2022
# Tailscale for DevOps: On-demand access to your Tailscale resources with ConductorOne
Modern governance and access control policies for sensitive resources like production nodes, databases, and SSH access to servers on Tailscale can sometimes lead to extra work when requesting and approving on-demand access. Fortunately, [Tailscale ACLs](/kb/1018/acls/) already let you manage access to company resources and [restrict access with “default deny” rules](/kb/1018/acls/#introduction).
But what if you want to automate Tailscale access requests and approvals so that on-call employees and engineers can get access to sensitive resources where and when they need it? That’s why we’re really excited to [partner with ConductorOne](https://www.conductorone.com/blog/implementing-least-privilege-access-tailscale-conductorone), which pulls your Tailscale identities and ACLs into a centralized, automated identity security control center that gives you greater control over who has access to what and — crucially — when.
### On-demand and time-bound access
With ConductorOne, you can easily define and automatically enforce on-demand and time-bound access for sensitive permissions in your Tailscale network, including those managed through Tailscale SSH. This makes it easy to give your engineering team time-limited access to production environments, as an example.
ConductorOne also gives you the power to automate Tailscale access requests, build custom automated access review workflows, and pull audit reports, all with just a few clicks. Your security team and developers can feel free to experiment with Tailscale’s capabilities, because ConductorOne won’t allow unnecessary persistent access — it limits users to only the resources they actually need at the time.
### ConductorOne and Tailscale
To use ConductorOne with Tailscale:
* Provision and connect the Tailscale application to ConductorOne using a Tailscale API key.
* Then, ConductorOne will automatically sync and parse Tailscale ACLs to create entitlements by group and access rules, including SSH access rules — this is what users can request access to.
* For each access rule, the ConductorOne application owner can determine which grant policy to use, e.g., can it be self-approved? Should it be time restricted, and if so, for how long?
ConductorOne automatically updates Tailscale ACLs when requests for access are approved, and when they expire.
Users can request access to a particular resource (including resources that are accessed using Tailscale SSH) via Slack or the web — which then triggers customized and automated approval workflows based on the chain of command, duration of access, and other factors. Reviewers can approve or deny requests directly in Slack, and users are automatically provisioned and deprovisioned based on the status of their request.
You can also use ConductorOne to grant access to the Tailscale app in Okta using [Okta user & group provisioning](/kb/1180/sso-okta-scim/). When a user requests or is removed from access to Tailscale in Okta using ConductorOne, that change is synced to Tailscale.
By using ConductorOne with Tailscale, you can:
* Give users access to sensitive resources for a limited period of time so they can respond to incidents or perform specific tasks.
* Resource or application owners can approve access to restricted apps based on need.
* Manage requests via the web and modern collaboration tools such as Slack.
* Audit all access requests and approvals for resources in your Tailscale network.
[View our docs](/kb/1208/ondemand-conductorone) to get started managing access to Tailscale resources with ConductorOne.
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