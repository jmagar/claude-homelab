Use grants with standard HTTP headers: Tailscale app capabilities
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|productOctober 30, 2025
# App capabilities, now for all your apps
Today we’re announcing availability of Tailscale app capabilities and user identities in HTTP headers, for use in all the applications you connect to your tailnet. App capabilities help you build identity and capability-aware applications.
Tailscale’s identity-based access controls allow for building powerful, secure applications on entirely private tailnets. You can already [leverage user identity](http://tailscale.com/blog/building-tsidp?utm_source=blog&amp;utm_medium=content&amp;utm_campaign=fall-update-2025) with our Go-based [tsnet](https://tailscale.com/kb/1244/tsnet?utm_source=blog&amp;utm_medium=content&amp;utm_campaign=fall-update-2025). Now we’re building on our [prior work](<https://tailscale.com/blog/acl-grants?utm_source=blog&amp;utm_medium=content&amp;utm_campaign=fall-update-2025 >) and taking it a significant step further, with Tailscale app capabilities. With the latest version of Tailscale’s [serve function](https://tailscale.com/kb/1312/serve#identity-headers?utm_source=blog&amp;utm_medium=content&amp;utm_campaign=fall-update-2025), third-party applications can accept [grants](https://tailscale.com/kb/1324/grants?utm_source=blog&amp;utm_medium=content&amp;utm_campaign=fall-update-2025) through standard HTTP headers, in whatever language suits your needs.
Customers have told us they want to go beyond basic authentication in building apps on their tailnet. At the same time, they don’t want to be restricted to the coding languages that have an existing Tailscale client library, or have to write custom code to understand more about who is connecting to their apps, and what they can do.
With app capabilities, that means building your app in whatever language you prefer, and still taking advantage of Tailscale’s rich identity offerings. That unlocks tools like:
* Single applications on a tailnet that provide granular access to different teams or customers
* Dashboards and administration panels that automatically shift their displays and functions based on group membership
* Tailscale-based authorization in any application, without needing specific SDKs or integrations.
By choosing the neutral platform of HTTP headers, we can expand the types of applications with which Tailscale can interact and improve upon. We can also relieve developers of some future-proofing grief. If tsnet or other Tailscale tools are released for other languages, your app that uses serve-based headers still works, and should not need to be re-engineered.
## [How it works](#how-it-works)
Enabling your Tailscale serve sessions to consume grants and other capabilities is opt-in, unlocked with a flag on the `serve` command, `--accept-app-caps`, specifying the name of the application capability (or multiple names as a comma-separated list) you want to receive:
`tailscale serve --accept-app-caps example.com/cap/someapp`
Once enabled, `serve` will look up the capabilities of the peer that makes each request, select the capabilities requested in the command line, and then forward them in a header named `Tailscale-App-Capabilities`.
Here’s an example ACL, providing Alice and Bob with different capabilities:
```
`{
"grants": [
{
"src": ["user:alice@example.com"],
"dst": ["someapp"],
"app": {
"example.com/cap/someapp": [{
"action": ["\*"],
"resources": ["\*"]
}]
}
},
{
"src": ["user:bob@example.com"],
"dst": ["someapp"],
"app": {
"example.com/cap/someapp": [{
"action": ["list\_devices"],
"resources": ["bootstrap://status", "tailscale://devices"]
}]
}
}
]
}`
```
Should Alice (`alice@example.com`) make a request of a node that has serve running, the resulting header looks like this:
`Tailscale-App-Capabilities: {"example.com/cap/someapp":[{"action": ["\*"],"resources":["\*"]}]}`
Bob, in turn, gets back this:
`Tailscale-App-Capabilities: {"example.com/cap/someapp":[{"action": ["list\_devices"],"resources":["bootstrap://status","tailscale://devices"]}]}`
Some HTTP servers enforce a limit on overall HTTP header size. Adding app capabilities does grow the header to a larger size than serve currently transmits. But after an analysis of existing customer header policies, capability-enabled headers should stay well within the limit (typically around 8 KB).
## [CLI for now, declarative coming soon](#cli-for-now-declarative-coming-soon)
You might have seen [the new Services feature](<https://tailscale.com/blog/services-beta?utm_source=blog&amp;utm_medium=content&amp;utm_campaign=fall-update-2025 >) we rolled out, in beta, earlier this week. We’re planning on making app capabilities available through a declarative service configuration, rather than individually configuring endpoints via `serve` CLI flags.
App capabilities are available in the latest **unstable** builds of Tailscale right now, and will be available in the coming **1.92** stable release. We’re looking forward to seeing what gets built with secure, flexible identity and permissions built right into your apps. If you have feedback, please send it our way via [GitHub Issues](https://github.com/tailscale/tailscale/issues), [Reddit](https://www.reddit.com/r/Tailscale/), or our [Discord community](https://discord.com/invite/tailscale).
Share
Author
Kevin Purdy
Contributors
Kabir Sikand
Gesa Stupperich
Author
Kevin Purdy
Contributors
Kabir Sikand
Gesa Stupperich
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