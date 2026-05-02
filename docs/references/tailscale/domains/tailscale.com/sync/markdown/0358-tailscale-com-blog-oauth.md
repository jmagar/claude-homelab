OAuth Support for Tailscale API: Enhanced Access Control
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|January 26, 2023
# Supporting OAuth in the Tailscale API
Tailscale’s [API](/kb/1101/api/) gives you programmatic access to many of your Tailscale resources, including devices on your tailnet, access controls in your tailnet policy file, and DNS settings. **Today we’re launching two improvements to how you authenticate to the Tailscale API: the ability to create scoped access tokens limited to specific operations, and the ability to continually generate or refresh access tokens using OAuth clients.**
Until today, API requests have always been authenticated using simple API keys tied to the user that created them. Because these keys have the same permission as the owning user, we’ve limited their lifetime to no more than 90 days. This works all right for simple automation scripts or testing, but it doesn’t scale very well beyond basic scenarios. What if you want to give a tool or service access to manage devices, but not to edit access controls? Or what happens to the production system using an API key owned by a departing employee? Or what if you have a third-party integration with Tailscale that needs an auth key to continually add ephemeral services to your tailnet?
To support these kinds of use cases, we are introducing [OAuth support](/kb/1215/oauth-clients/) to the Tailscale API. Tailnet administrators can create OAuth clients that are scoped to specific types of operations. These clients can then be used with any standard OAuth 2.0 library that supports [client credentials grants](https://www.rfc-editor.org/rfc/rfc6749#section-4.4) to obtain short-lived access tokens that can be used to authenticate API requests. For example, an OAuth client with the `devices` scope can be used to generate auth keys with a specific set of tags for adding new devices.
OAuth clients are not owned by individual users and they don’t expire. However, creation and use of OAuth client credentials are [logged in configuration audit logs](/kb/1203/audit-logging/), and they can be revoked at any time. Additionally, administrators can only set scopes that grant the permissions allowed by [their role](/kb/1138/user-roles/).
OAuth clients are available today in beta for all tailnets. Create an OAuth client from the [OAuth clients page](https://login.tailscale.com/admin/settings/oauth) of the admin console, or [read the documentation](/kb/1215/oauth-clients/) to learn more.
Share
Authors
Will Norris
Jordan Whited
Authors
Will Norris
Jordan Whited
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