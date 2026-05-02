How Tailscale can make secure MCP access with DCR easier
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|insightsAugust 26, 2025
# Easy, Secure Dynamic Client Registration for MCP & AI Agents
If you’ve looked into building [Model Context Protocol](https://modelcontextprotocol.io/docs/getting-started/intro) (MCP) clients or servers that handle authorization, you’ve seen that it’s a lot of hoop-jumping.
You need to use the latest OAuth 2.1 features, implement automatic discovery through well-known metadata endpoints and [Resource Indicators](https://datatracker.ietf.org/doc/html/rfc8707), *and*, crucially, you should use [OAuth Dynamic Client Registration (DCR)](https://datatracker.ietf.org/doc/html/rfc7591). All this, just for basic client/server deployments, and that’s before digging into MCP proxies or gateways.
In this post we’ll look at one of the [MCP Authorization Spec](https://modelcontextprotocol.io/specification/draft/basic/authorization)’s strongest suggestions, DCR, and cover:
* What DCR is, and why you probably haven’t used it before
* Why secure DCR shouldn’t be as complicated as it is today
* How to easily add additional control to self-deployed authorization servers
* What we’re doing at Tailscale to make secure MCP access & DCR easy
Even if you’re only building an MCP server with authorization, it’s still important to understand DCR, as ignoring it will mean your users need to create keys or OAuth clients before using it. That might be fine to ask of a developer, but if you're building an MCP for non-technical folks, those demands could be extremely limiting and you’ll need to find a better solution.
## [What is Dynamic Client Registration (DCR) and why is it rare?](#what-is-dynamic-client-registration-dcr-and-why-is-it-rare)
You are probably not as familiar with DCR as you are with more common parts of the OAuth flow. When registering a new service that needs to authenticate users with one or more single sign-on identity providers (SSO IdP), DCR replaces the tedious manual click-ops in each developer portal with a relatively simple API. Amazingly, the original OAuth spec didn’t come with a standardized way to register clients; every single IdP (identity provider) did it differently, so it was extremely difficult to automate.
Then along came DCR, but despite being a simple and finalized spec for over 10 years, it hasn’t caught on yet.
Use cases requiring automation of OAuth registration, given they only really happen at scale, have been *relatively* rare … until the new wave of MCP servers started getting deployed. DCR still has not been implemented by most major public OAuth authorization servers, like Google, GitHub, or Microsoft Entra ID. But good news! With Tailscale and [tsidp](https://github.com/tailscale/tailscale/tree/main/cmd/tsidp), you’ll now be able to keep using your regular IdP for authentication, and *also* have DCR.
The DCR flow from client to auth server during MCP auth.
MCP, especially when used for AI agents, might just be the killer use case for broader adoption of DCR. Making MCPs a seamless experience that doesn’t ask too much of non-technical end users, while also supporting authorization, pretty much requires dynamic registration.
But there’s still a problem: How do you easily control who can register OAuth clients? As usual, with Tailscale we've aimed to make the secure way easier than the insecure way.
## [How does Tailscale make a more secure DCR easy?](#how-does-tailscale-make-a-more-secure-dcr-easy)
Network requests over Tailscale have a convenient property. Each request comes with the identity of the user (or machine) attached, as defined by your existing SSO provider (i.e. your work email). You can then write access control rules based on this information. Using just a bit of JSON (or the [ACL visual policy editor](https://tailscale.com/blog/visual-editor-beta)), and a locally hosted OAuth authorization server with DCR support (of which there are many), you can **ensure only certain users or groups can access the server and register clients** inside of your network.
Here's an example access control rule limiting access to just engineering:
```
`{
"grants": [
{
"src": ["group:eng"],
"dst": ["tag:internal-idp"],
"ip": ["tcp:443"]
}
]
}
`
```
While not as applicable for publicly accessible MCP servers, if you’re building an MCP server for internal use – the common, and much safer, use case – this can provide a simple, yet reasonably constrained version of DCR.
## [Why not just control access to MCP servers directly?](#why-not-just-control-access-to-mcp-servers-directly)
If you looked at the above example and thought, “Why not just use the same ACLs to directly control access to the MCP servers, and skip OAuth altogether?” You’re not alone! If you have a simple setup, it’s a safe and straightforward alternative.
Using the same Tailscale setup for DCR, you can completely side-step the OAuth server. Instead, the user's Tailscale identity can be checked directly by the MCP server, using an example like this [Tailscale identity-aware MCP echo server](https://github.com/remyguercio/tailscale-mcp-echo). Tailscale identity provides a simple and convenient alternative to OAuth based security to help improve the safety of small internal MCP deployments.
While convenient, this kind of simple identity model can break down when your deployments get more complex, especially when you want to run an "MCP gateway" that intermediates between your agents and MCP server backends. Neither indirect access, nor identity models involving intermediary agents, have yet to be adequately covered by the current MCP spec, but they're a real issue. It seems likely that some form of [STS Token Exchange](https://datatracker.ietf.org/doc/html/rfc8693) is needed for this model.
We're adding support for this in tsidp, which means only the intermediary gateway or agent (not your users or MCP backends) need to make any additional changes to support STS. Again, tsidp will work whether or not your company's main OAuth provider has STS on their roadmap.
## [Let’s work together!](#lets-work-together)
If you have an MCP use case that isn’t satisfied by existing auth patterns, or you’ve tried one of the open-source options and it didn’t work for you, I have exciting news! My team at Tailscale is *right now* upgrading [tsidp, an experimental authorization server](https://github.com/tailscale/tailscale/tree/main/cmd/tsidp), to natively support the specs required for MCP and AI agent use cases.
So if you’re actively building or deploying secure MCP servers, proxies, or agents to run within private networks, please reach out. Join the tsidp channel [on our Discord](https://discord.gg/tailscale), or [fill out this form](https://forms.gle/w3smZuaY4xvV6DGP7) and we’ll get back to you ASAP.
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