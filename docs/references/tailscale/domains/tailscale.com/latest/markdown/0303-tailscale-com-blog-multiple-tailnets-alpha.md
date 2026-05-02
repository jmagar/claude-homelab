Multiple tailnets alpha: separate tailnets with a single identity provider
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|productOctober 29, 2025
# One organization, multiple tailnets
You can now create multiple tailnets within a single organization—all managed under one identity provider. Perfect for teams who need extra separation for testing, development, or automation, without adding complexity.
We’re adding something new to Tailscale: organizations can now **create and manage more than one tailnet**, all backed by the same identity provider.
For most people, a single tailnet is all you’ll ever need. It keeps everything simple, connected, and secure. But as some teams and products grow, they start to need more separation—testing new features, running development environments, or managing connectivity for their own customers.
Now you can get that separation without setting up a new organization or identity system. It’s the same Tailscale experience, with more flexibility when you need it.
## [How it works](#how-it-works)
Each tailnet created in your organization is available to users who sign in with your existing identity provider. When more than one tailnet exists, we’ll ask your users to choose which one they’re trying to use when they sign in. If you don’t want one of these additional tailnet to be seen by your whole organization, you can mark it as “unlisted,” and provide a special URL to any of your users who you’d like to invite.
Each tailnet maintains its own distinct policy file, tags, devices, and settings. You can assign specific owners and admins to each tailnet based on your preferences.
For enterprises that sync group assignments from Google Workspace, Okta, or Microsoft Entra ID, those groups can be referenced across all of the tailnets in your organization, with no need to set up syncing on every tailnet.
## [Putting multiple tailnets to work](#putting-multiple-tailnets-to-work)
We’ve partnered with select customers to help us shape the vision for this capability, and it’s been exciting to see all the ways that the ability to use multiple tailnets has deepened what’s possible with Tailscale. Here are some of my favorites:
Many teams set up a **sandbox tailnet** to test new ACLs, devices, or features before rolling them out to production. It gives admins a way to validate changes in a real environment, without worrying about accidental disruptions.
Engineering and R&D teams often create **dedicated lab tailnets** where they can prototype services, experiment with infrastructure, or share access to specialized hardware. Because these tailnets are isolated from the main network, teams can move quickly, without taking on risk for everyone else.
Some organizations map their existing deployment workflows directly to separate tailnets for **development, staging, and production**. Each environment can have its own policies and devices, which makes access controls simpler and allows them to evolve independently.
And for teams building products on top of Tailscale, having multiple tailnets can make it easier to **manage connectivity for their own customers**. A per-customer or per-project tailnet provides strong isolation, predictable networking, and straightforward lifecycle management, all under the same identity provider and organizational policies.
## [For builders and integrators](#for-builders-and-integrators)
But wait, there’s more! We’ve also released an API that allows you to create tailnets programmatically, to make it easier for developers to bring the magic of Tailscale connectivity into their applications in a secure and logical way.
These API-generated tailnets work a little differently. They don’t include human users—just tagged devices, and they aren’t managed in the admin console. Instead, they’re the perfect lightweight private network to manage exclusively via our API, which makes them useful for automation, OEM, and integration scenarios. When you create a tailnet for the first time via the API, the response contains an OAuth client with the `all` scope, enabling you to use our [public API](<https://tailscale.com/api?utm_source=blog&amp;utm_medium=content&amp;utm_campaign=fall-update-2025 >) to set up the tailnet.
We’ve seen early testers use it to embed Tailscale directly into their own products, spinning up a tailnet per customer to provide secure, effortless connectivity between their infrastructure and the customer’s environment.
```
`curl https://api.tailscale.com/api/v2/organizations/-/tailnets \\
--request POST \\
--header 'Authorization: Bearer YOUR\_SECRET\_TOKEN' \\
--data '{"displayName": "Tailnet A"}'
Response:
{
"id": "T123456CNTRL",
"displayName": "Tailnet A",
"orgId": "o123456CNTRL",
"dnsName": "tail1234.ts.net",
"createdAt": "2025-01-01T12:00:00Z",
"oauthClient": {
"id": "k123456CNTRL",
"secret": "tskey-client-xxxxxxxxxxxx-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
}
}
`
```
If you’re reading this and you immediately thought of a way this API could improve your own applications, please reach out! We’d love to give you access to the API and see what you build.
## [What’s next?](#whats-next)
You can get access to both features—multiple standard tailnets or our tailnet creation API—starting today by [signing up to join the alpha program](https://tailscale.typeform.com/to/fzttus4x). To learn more, take a look at our [documentation for managing multiple tailnets](<https://tailscale.com/kb/1509/multiple-tailnets?utm_source=blog&amp;utm_medium=content&amp;utm_campaign=fall-update-2025 >) or our [API documentation](<https://tailscale.com/kb/1572/tailnet-creation-api?utm_source=blog&amp;utm_medium=content&amp;utm_campaign=fall-update-2025 >).
I’m really excited about what we’ve built so far, but I’m *more* excited about what’s coming next. Here’s a taste of what we’ll be building out as we move towards beta and general availability:
* Assign users to specific tailnets based on groups
* Self-serve access to create tailnets in the admin console
* Organization-level controls for maintaining permissions across tailnets
Share
Author
Sam Linville
Author
Sam Linville
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