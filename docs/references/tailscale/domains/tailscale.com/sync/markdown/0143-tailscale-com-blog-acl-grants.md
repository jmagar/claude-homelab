Manage network and application access with Tailscale Grants
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|December 14, 2023
# Tailscale Grants: Unified Network & Application Access Control
The Tailscale policy file shapes your tailnet, by letting you define who can access what, how devices connect, and even how IP addresses are assigned to nodes. At the heart of this policy file lies the ACLs section, which holds the access rules for your network. The Tailscale policy engine evaluates these rules and sends them to all your clients, enabling each one to independently check permissions without relying on the coordination server.
Although ACLs provide a great way to manage permissions at the network layer, they are not always sufficient and we end up wishing for more granular access at the application layer. Today we’re introducing **grants**, the next generation of ACLs. Grants extend your ability to manage access controls from the network layer into the application layer.
### Evolving ACLs
Ever since Tailscale started, we&rsquo;ve put a lot of effort into developing ACLs and the policy engine. It&rsquo;s been a journey of continuous improvement, shaped by new challenges and needs faced by our customers. With the introduction of grants you can now integrate Tailscale&rsquo;s robust access controls into your own applications.
#### A quick refresher
Before we start, let’s take a quick look at what ACLs look like today. A simple ACL that allows **group:prod** to access a service running on a device tagged with **tag:server** on port **22** would look like:
```
`{
"acls": [{
"action": "accept",
"src": ["group:prod"],
"dst": ["tag:server:22"],
}]
}
`
```
In addition to network ACLs, the Tailscale policy file has another top-level section used to configure Tailscale SSH rules. Tailscale SSH is our answer to the perennial headache of managing SSH keys across a fleet of devices and a team of users with varying permissions. Instead of generating and distributing and managing SSH keys, Tailscale SSH users can authenticate and authorize sessions between devices based on the rules compiled by the policy engine.
The following example builds upon the rule above to grant Tailscale SSH access as **ubuntu** and **root**.
```
`{
"acls": [{
"action": "accept",
"src": ["group:prod"],
"dst": ["tag:server:22"],
}],
"ssh": [{
"action": "accept",
"src": ["group:prod"],
"dst": ["tag:server"],
"users": ["ubuntu", "root"],
}]
}
`
```
The success and simplicity of Tailscale SSH was due to the flexibility of our policy engine, so we started wondering whether we could bring that same level of simplicity and security to other applications. Hence, we noticed a common pattern:
Each ACL entry grants:
**src access** to connect to each **dst** on the specified **ports**.
Each SSH entry grants:
**src access** to SSH into **dst** as one of the **users**.
It then dawned on us that these are both specific examples of a more general statement:
**src** has **capabilities** when communicating with **dst**.
We built that unifying idea as a new top-level concept in the policy file, that we call **grants**. Grants are an evolution and extension of **acls**. They combine **ip** layer and **app** layer capabilities into a shared grammar to allow for better readability and usability.
The ACL that we saw above can be written as a grant as such:
```
`{
"grants": [{
"src": ["group:prod"],
"dst": ["tag:server"],
"ip": ["tcp:22"]
}]
}
`
```
All ACLs today require you to add the `action` field, yet the only possible value is `accept`. Tailscale access rules are `default deny` and access needs to be explicitly granted. We felt that was redundant as we moved to the new grammar, as each grant may only **grant** access and not restrict it. Notice that this new syntax also divides `dst` and `port` into distinct sections allowing for better readability and grouping.
Functionally these two examples describe the same policy, so you may be wondering what’s different. As it pertains to network layer access controls, grants and ACLs are at feature parity. You can even use them together in the same policy. However, grants let you also specify access controls for your application. These can be used for any application that you would like to, let’s look at a few examples of how we use them internally at Tailscale today.
#### TailSQL: a web SQL playground
[TailSQL](https://github.com/tailscale/tailsql) is an open-source tool we&rsquo;ve developed for internal use at Tailscale. We rely on it for a variety of use cases and as such our instance is configured to query multiple data sources. As it is not always wise to allow every individual user to query all the possible datasets, we use grants to not only specify who can access the service as a whole, but also attach fine-grained authorization policies that restrict which users are allowed to query which data sources.
In the following example, we specify that members of **group:analytics** are allowed to contact **tag:tailsql** (which hosts the playground) but we restrict them to only be able to access the **warehouse** data source. Members of **group:prod**, by contrast, can access all available data sources:
```
`{
"grants": [{
"src": ["group:prod"],
"dst": ["tag:tailsql"],
"ip": ["443"],
"app": {
"tailscale.com/cap/tailsql": [{
"dataSrc": ["\*"], // allow all
}],
},
},{
"src": ["group:analytics"],
"dst": ["tag:tailsql"],
"ip": ["443"],
"app": {
"tailscale.com/cap/tailsql": [{
"dataSrc": ["warehouse"],
}],
},
}]
}
`
```
When the policy engine sees this grant, it compiles it and pushes it down to the relevant clients. When TailSQL receives a request, it is then able to query the local Tailscale client (or tsnet.Server) to fetch the authorization policy associated with the connection using the **tailscale whois** subcommand (or its equivalent [LocalAPI](https://pkg.go.dev/tailscale.com/client/tailscale#LocalClient.WhoIs) endpoint) and is then able to perform the necessary authorization decisions.
From the perspective of the policy engine, the parameters associated with **tailscale.com/cap/tailsql** are an opaque JSON blob. The policy engine does not interpret them, nor does it have any a priori knowledge of the syntax. This flexibility allows any application developer to define their own capability and use it in their applications. We restrict the capability name to be prefixed by a domain name followed by a URL path such as **example.com/cap/my-app.** The value associated with the capability is a JSON array consisting of raw JSON blobs.
Let’s take a look at a few more examples of how you can use grants today.
#### Setec: a secrets manager
Programs in production often need access to passwords, API keys, parameterized connection URLs, and other sensitive information at runtime. [Setec](https://github.com/tailscale/setec) is an open-source tsnet-based server we use internally, it exports a lightweight HTTP-based API allowing programs running on a tailnet to securely fetch secrets at runtime. Access to secrets is governed via grants, and the server maintains secrets in encrypted storage. Grants allow fine-grained control over which users and applications have access to which secrets, and what operations are allowed.
For example, the following grants members of **group:prod** to view metadata, add new values, and set the active version of production secrets, but not to read the values of existing secrets. In addition, we grant nodes bearing **tag:app** to read the values of production secrets belonging to that app, but not to modify their values.
```
`{
"grants": [{
"src": ["group:prod"],
"dst": ["tag:secrets"],
"app": {
"tailscale.com/cap/secrets": [
{
"action": ["put", "activate"],
"secret": ["prod/\*"]
}
]
}
},{
"src": ["tag:app"],
"dst": ["tag:secrets"],
"app": {
"tailscale.com/cap/secrets": [
{
"action": ["get", "info"],
"secret": ["prod/app/\*"]
}
]
}
}]
}
`
```
#### Kubernetes auth proxy
Our Kubernetes auth proxy allows you to present your identity to the Kubernetes control plane when interacting with it using kubectl or the Kubernetes API. This lets you define RBAC rules on a per-user basis, however that means you have to duplicate RoleBindings per user you want to give access to. Starting with version **v1.56.0** of the operator, grants can also be used to transparently [impersonate groups](https://kubernetes.io/docs/reference/access-authn-authz/authentication/#user-impersonation), which allows you to drastically simplify your RBAC rules.
The following rule allows **group:prod** to impersonate the **system:masters** group effectively becoming a Cluster Admin, whereas **group:k8s-user** will impersonate the **group:k8s-user** which can then be matched against using [Kubernetes RoleBindings](https://kubernetes.io/docs/reference/access-authn-authz/rbac/#role-binding-examples).
```
`{
"grants": [{
"src": ["group:prod"],
"dst": ["tag:k8s-auth-proxy"],
"app": {
"tailscale.com/cap/kubernetes": [{
"impersonate": {
"groups": ["system:masters"],
},
}],
},
},{
"src": ["group:k8s-user"],
"dst": ["tag:k8s-auth-proxy"],
"app": {
"tailscale.com/cap/kubernetes": [{
"impersonate": {
"groups": ["group:k8s-user"],
},
}],
},
}]
}
`
```
#### Golink
Our [golink project](https://github.com/tailscale/golink) allows you to create and share private short links with others in your tailnet. Normally, only the owner of a go link can edit or delete it. But it&rsquo;s often useful to allow others the ability to manage go links when the link owner is unavailable. We now allow you to grant the &ldquo;admin&rdquo; role to any set of users, giving them the ability to edit any go link. You could grant this role only to a specific group or all members of your tailnet, effectively removing the ownership model entirely, which has been a [long-standing feature request](https://github.com/tailscale/golink/issues/18).
This example uses **autogroup:admin** to grant the admin role to all tailnet admins for any device tagged **tag:golink**.
```
`{
"grants": [{
"src": ["autogroup:admin"],
"dst": ["tag:golink"],
"app": {
"tailscale.com/cap/golink": [{
"admin": true
}]
}
}]
}
`
```
### Future and what’s next
We&rsquo;re excited to introduce grants and hope that you will find them to be a valuable addition to your security toolkit. Our work is never done and we expect to soon unify Tailscale SSH into grants as well so that you can further simplify your policy file.
We invite you to explore grants, experiment with their features in your own setups, and experience how they can effectively streamline your network management and enhance application security. We look forward to hearing from you and incorporating your feedback.
Share
Authors
Maisem Ali
Ben Lee-Cohen
Authors
Maisem Ali
Ben Lee-Cohen
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