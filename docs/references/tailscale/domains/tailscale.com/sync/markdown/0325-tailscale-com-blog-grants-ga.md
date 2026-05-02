Grants generally available as an easier option to ACL syntax
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|productMay 29, 2025
# A new generation of Tailscale access controls
Grants are generally available as an easier option to write and read than ACL syntax. Anything you can write as an ACL can be expressed as a grant, coexisting in perfect harmony.
Today, we’re announcing the general availability of grants, Tailscale’s next generation of access controls that combine network and application capabilities into a single syntax.
Grants are a superset of our original ACLs — anything you can write as an ACL can be expressed as a grant. In most scenarios, grants are easier to write and read than the ACL syntax. Let’s take a look:
```
`// ACL syntax
"acls": [
{
"action": "accept",
"src": ["group:eng"],
"dst": ["tag:internal-tool:443"],
"proto": ["tcp"],
},
],
// Grants syntax
"grants": [
{
"src": ["group:eng"],
"dst": ["tag:internal-tool"],
"ip": ["tcp:443"],
},
],`
```
Grants are designed to be easy to write and easy to read, for both humans and computers. We combined ports and protocols into a single `ip` field, and removed the redundant `action` field. This simplifies our original ACL syntax, where these fields were needed in every rule.
## [The new stuff](#the-new-stuff)
Grants go beyond simplifying the ACL syntax, they also add new tools that you can use for more powerful access controls.
### [Application capability extensions](#application-capability-extensions)
Tailscale’s access controls have always been able to define network-level permissions at [Layer 3](https://tailscale.com/kb/1456/osi), but this is only half the story — you still need to handle authentication and authorization for users once their packets reach your applications.
For private services inside your tailnet, like internal tools, implementing auth on every app is overkill. That’s why we developed `tsnet`, a Go library that embeds Tailscale directly in your applications. This lets you see and react to the identity of every user who makes a request to your app. So, authentication is handled…what about authorization?
That’s where grants come in. You define application capabilities in a grant, and they’re passed to your application. There, you can read them alongside the identity of the user. Together, grants and `tsnet` let you build private services that rely on Tailscale's [RBAC policy expansion](https://tailscale.com/blog/rbac-like-it-was-meant-to-be) for authentication and authorization.
Application capabilities are namespaced, freeform JSON objects. You can define permissions that should be granted to the entities in the `src` field of your grant. Tailscale has defined a schema in some of our own apps, but you’re not limited to that. The magic of application capabilities is that you can easily define your own capabilities to use in your apps.
Let’s look at [Golink](https://github.com/tailscale/golink), a tiny internal shortlink service we use every day at Tailscale. Users in Golink are authenticated with their Tailscale identity, and there are normal users and admin users. We can use grants to not only determine who is allowed to access the Golink service, but also to assign the admin role to specific groups of users:
```
`"grants": [
{
// All users in the tailnet can access Golink
"src": ["autogroup:member"],
"dst": ["tag:golink"],
"ip": ["\*"],
},
{
// Only the golink-admins group gets Admin privileges in the app
"src": ["group:golink-admins"],
"dst": ["tag:golink"],
"app": {
"tailscale.com/cap/golink": [{
"admin": true
}],
},
},
],`
```
Instead of managing network access to Golink in Tailscale and implementing user role management inside the Golink app, we can centralize both policies in Tailscale. Every request made to Golink includes the Tailscale identity of the requestor and the permissions to grant to that user. This makes it easy to read those properties in the app, making authentication and authorization decisions without maintaining yet another user database.
Here’s what that looks like on the Golink side, using our [tsnet library](https://tailscale.com/kb/1244/tsnet):
```
`// This example is simplified for brevity;
// you can read the full version of this code at
// https://github.com/tailscale/golink/blob/main/golink.go
var localClient \*tailscale.LocalClient
const peerCapName = "tailscale.com/cap/golink"
type capabilities struct {
Admin bool `json:"admin"`
}
type user struct {
login string
isAdmin bool
}
// Read the identity of the requestor from localClient and their capabilities that were defined in grants.
var currentUser = func(r \*http.Request) (user, error) {
if err != nil {
return user{}, err
}
login := whois.UserProfile.LoginName
caps, \_ := tailcfg.UnmarshalCapJSON[capabilities](whois.CapMap, peerCapName)
for \_, cap := range caps {
if cap.Admin {
return user{login: login, isAdmin: true}, nil
}
return user{login: login}, nil
}
// In the app logic, we can then check for the isAdmin property on the currentUser when making authorization decisions.`
```
Golink isn’t the only application that already takes advantage of application capabilities in grants. We’ve open sourced several other tools that demonstrate how using grants to unify network and application permissions simplifies access management:
* [TailSQL](https://github.com/tailscale/tailsql): a private SQL playground inside your tailnet
* [Setec](https://tailscale.com/community/community-projects/setec): a secrets management service that uses app capabilities for access control
* [Kubernetes API server proxy](https://tailscale.com/kb/1437/kubernetes-operator-api-server-proxy): a Tailscale operator tool to expose and access the Kubernetes control plane
[Read more about application capabilities](https://tailscale.com/kb/1537/grants-app-capabilities)
### [Routing awareness with `via`](#routing-awareness-with-via)
Grants also add a new field, `via`, to let you define the [exit nodes](https://tailscale.com/kb/1103/exit-nodes), [subnet routers](https://tailscale.com/kb/1019/subnets), or [app connectors](https://tailscale.com/kb/1281/app-connectors) that your devices must use when accessing particular resources.
For example, you can use the `via` field to direct your users’ internet traffic through different exit nodes depending on their office location:
```
`"grants": [
{
"src": ["group:toronto-employees"],
"dst": ["autogroup:internet"],
"via": ["tag:exit-node-tor"],
"ip": ["\*"],
},
{
"src": ["group:seattle-employees"],
"dst": ["autogroup:internet"],
"via": ["tag:exit-node-sea"],
"ip": ["\*"],
},
],`
```
You can use the `via` field to route traffic through tagged sets of exit nodes, app connectors, or subnet routers. It also supports regional routing and failover when using tagged subnet routers in a [high availability](https://tailscale.com/kb/1115/high-availability) configuration.
[Read more about via](https://tailscale.com/kb/1378/via)
## [But what about my existing policies?](#but-what-about-my-existing-policies)
If you’re an existing Tailscale user, you probably have lots of access controls written in our older ACL syntax. I can feel your anxiety through the screen. *When do I have to update all those policies to use the new syntax? *In our industry, these kinds of announcements usually have a small paragraph tacked on to the end with words like “deprecated”, “migration plan”, and “deadline.”
I have great news: You never have to update your existing rules to use the new grants syntax. We will support our original ACL syntax **forever.** You can even use ACLs and grants side-by-side in the same policy. When we say that [Tailscale is a stable platform](https://tailscale.com/blog/community-projects#tailscale-is-a-stable-platform), we aren’t kidding around.
You only need to rewrite your existing ACL policies if you want to take advantage of the newer features we add to the grants syntax. You can do this incrementally, one rule at a time, because grants and ACLs coexist in perfect harmony.
[Read the migration guide](https://tailscale.com/kb/1542/grants-migration)
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