How we built a lightweight identity provider using Tailscale's tools
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|insightsOctober 30, 2025
# Building on Tailscale: How we made a tiny identity provider
Most people think of Tailscale as “the VPN that actually works,” or “an easy way to connect all of your devices.” And while, yes, it is those things, it’s also quite a bit more.
Be honest. Before you read the title of this post, did you know that it’s possible to build an application directly on top of Tailscale? No? That’s alright, we really should talk about it more, so here it goes.
Building [tsidp](https://github.com/tailscale/tsidp), a lightweight identity provider (IdP) that’s Tailscale-aware, was surprisingly simple thanks to three powerful features of Tailscale: [tsnet](https://tailscale.com/kb/1244/tsnet), [application capability grants](https://tailscale.com/kb/1537/grants-app-capabilities), and [Funnel](https://tailscale.com/kb/1223/funnel). With these three features, it’s possible to quickly build and configure secure applications that work both inside and outside of a tailnet. Let me show you how we did exactly that.
It’s not necessary to know how an identity provider works to follow along with this example, but it’s important to know that network requests through Tailscale come with the identity of the requestor attached (typically sourced from a corporate SSO IdP). Tsidp, using tsnet, leverages this built-in property to authorize users into other applications that support custom OAuth/OIDC providers.
### [Getting connected with tsnet](#getting-connected-with-tsnet)
[tsnet](https://tailscale.com/kb/1244/tsnet) is a small library that lets you directly embed Tailscale connectivity inside of a go program. Once included, we use `tsnet.Server` to connect the program to your tailnet with only two things: a hostname and an auth key with appropriate permissions. After connecting, it’s possible to then listen with a `net.Listener` like would typically do when writing a server in go. In practice it looks like this. Note the auth key is automatically loaded from the environmental variable `TS\_AUTHKEY` if provided:
```
`srv := new(tsnet.Server)
srv.Hostname = "idp"
ln, err := srv.ListenTLS("tcp", ":443")
if err != nil {
log.Fatal(err)
}`
```
In the case of tsidp, it will automatically try to register the hostname of idp on your Tailscale network (tailnet) when launched and listen on port 443 by default. Once you’ve successfully launched your first instance of tsidp, it should look just like any other node in your tailnet.
## [Getting user information from tsnet](#getting-user-information-from-tsnet)
As mentioned earlier, Tailscale network connections come with identity information included in the request. To get this information inside of your application you can make a .WhoIs call inside of your application, that will provide back user, node, and application capability grant information associated with the request.
It’s this `.WhoIs` call that tsidp uses to identify the user when they are redirected to the `/authorize` endpoint of tsidp during the auth flow. Once identified, tsidp creates the necessary token, then redirects them back to the application they’re trying to log into.
## [User or group configuration with application capability grants](#user-or-group-configuration-with-application-capability-grants)
In the previous section, I mentioned that application capability grants are returned with a `.WhoIs` call. Application capability grants are custom JSON that can be passed to an application from the Tailscale ACL file, on a per-user or per-group basis. In the case of tsidp, they look like this:
```
`"grants": [
{
"src": ["autogroup:admin"],
"dst": ["tag:tsidp"],
"app": {
"tailscale.com/cap/tsidp": [
{
// allow access to UI
"allow\_admin\_ui": true,
// allow dynamic client registration
"allow\_dcr": true,
// Secure Token Service (STS) controls
"users": ["\*"],
"resources": ["\*"],
"extraClaims": {
"extraCool": true,
"theBegining": "Thursday, January 1, 1970 12:00:00 AM",
"everythingAnswer": 42,
},
"includeInUserInfo": true,
},
],
},
},
],
`
```
Tsidp uses this arbitrarily defined JSON to control behavior of various endpoints:
* `allow\_admin\_ui`: Who can see, add, delete, or edit registered application
* `allow\_dcr`: Who can [dynamically register](https://tailscale.com/blog/dynamic-client-registration-dcr-for-mcp-ai) new OAuth clients for use cases like MCP
* `extraClaims`: Custom data injected into OAuth tokens## [Going off tailnet with Funnel](#going-off-tailnet-with-funnel)
In addition to exposing applications inside of a tailnet, it’s also possible to expose them to the world using [Funnel](<https://tailscale.com/kb/1223/funnel?utm_source=blog&amp;utm_medium=content&amp;utm_campaign=fall-update-2025 >). Tsidp can use Funnel to expose just the application-facing endpoints to the public internet, while keeping the `/authorize` endpoint, accessed only by tailnet users, private.
By using Funnel in this way, tsidp can also support a seamless login experience to public SaaS apps that support custom OIDC. When users are logged into their private tailnet, it’s all the authentication they need.
## [Build your own app with tsnet](#build-your-own-app-with-tsnet)
Tsidp is just one example of what you can do with tsnet. We’ve also previously highlighted a [custom internal link shortener](https://tailscale.com/community/community-projects/golink), a [lightweight configurable secret store](https://tailscale.com/community/community-projects/setec), and many more things, as demonstrated in our [community projects](https://tailscale.com/community/community-projects?category=Apps).
Want to build something? Check out the [tsidp source code](https://github.com/tailscale/tsidp) and the [tsnet documentation](https://tailscale.com/kb/1244/tsnet?utm_source=blog&amp;utm_medium=content&amp;utm_campaign=fall-update-2025) to get started. We'd love to see what you build!
Share
Author
Remy Guercio
Author
Remy Guercio
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