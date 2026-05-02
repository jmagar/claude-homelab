Tailscale’s visual policy editor is in beta: add, edit, and delete
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|productAugust 05, 2025
# Tailscale’s visual policy editor is in beta
Tailscale lets you manage your tailnet’s access permissions, including which users are allowed to connect to which machines, using our powerful HuJSON (JSON for Humans) [policy file](https://tailscale.com/kb/1337/policy-syntax). However, there may be times you prefer to use web forms instead of working with HuJSON directly. We've made this possible with our new visual policy editor.
The visual policy editor gives you a tabular view of each section of your policy file, and allows you to add, edit, and delete individual policy entries using visual forms.
You can use the visual editor in addition to the existing management methods. The policy file can still be edited directly in the admin console, [via GitOp](https://tailscale.com/kb/1204/gitops-acls), via Terraform using our [tailscale\_acl resource](https://registry.terraform.io/providers/tailscale/tailscale/latest/docs/resources/acl), or programatically via our [REST API](https://tailscale.com/api#tag/policyfile).
Lots of our users love the flexibility that the HuJSON policy file provides, but we’ve heard your requests for a more visual way to manage policies. We designed the new visual editor so that you don't have to choose. Under the covers, your policy continues to be stored as the familiar HuJSON, so you can toggle back and forth between both ways of working with your policy file. We even preserve your doc comments and surface them in the visual editor.
## [HuJSON preview](#hujson-preview)
Maybe you work primarily in HuJSON, but could use a little help with the policy file’s syntax from time to time. As you craft a rule, the visual policy editor provides a live preview for the most complex sections, and the resulting preview is ready to copy and paste into your editor, Terraform config, or GitOps managed policy file.
## [Break glass access](#break-glass-access)
If you manage your ACL policies via GitOps or Terraform, you can lock the editor to prevent conflicts.
Even when locked, your policy remains available in read-only mode. You can still preview edits, then copy the HuJSON to GitOps or Terraform.
If it's an emergency and you need to make a change quickly, go ahead and unlock the editor, use the visual editor to make your change, and then lock it again. Just remember to update your policy in GitOps or Terraform to make sure the change sticks!
Try out the new visual policy editor, and tell us what you think! We’re happy to make things that make your life easier.
Share
Author
Percy Wegmann
Author
Percy Wegmann
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