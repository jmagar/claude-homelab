Route filtering with Via · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Route filtering with Via
Last validated: Jan 5, 2026
Via introduces routing awareness to [grants](/docs/features/access-control/grants) by letting you include a `via` field to specify *how* Tailscale can route the destination (`dst`) from the source (`src`).
You can use the [`via` syntax](#syntax) to define the [exit nodes](/docs/features/exit-nodes), [subnet routers](/docs/features/subnet-routers), or [app connectors](/docs/features/app-connectors) a source can access when they use a specific destination. For example, you can create a grant that forces traffic through a specific exit node when it goes from the engineering team group to the GitHub app connector.
Using the `via` field in grants lets you do things like:
* Route traffic to an enterprise application through a specific exit node.
* Route traffic from devices through different exit nodes based on whether they meet device posture criteria.
* Route traffic from specific users through a subnet router.
You can omit the `via` field (or set it to `[]` or `null`) when you create a grant to allow any group of devices to access a resource (through any exit node, subnet router, or app connector).
## [Limitations](#limitations)
* You can only use [tags](/docs/features/tags) within the `via` field.
* For [failover and regional routing reasons](/docs/how-to/set-up-high-availability), you can only use accessible routers as `via` candidates. The routers accessible to users depends on applicable [access policies](/docs/features/access-control/acls).
## [Syntax](#syntax)
Via is an extension of the grant syntax. It adds a single field, `via`, that you can use to specify how the source routes to the destination. The following example shows how to use the `via` field.
```
`"grants": [
{
"src": ["\<source\>"],
"dst": ["\<destination\>"],
"via": ["tag:\<tag-name\>"],
"ip": ["\*"]
},
]
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
This example ensures traffic from `\<source\>` to `\<destination\>` goes through a device with the tag `\<tag-name\>`.
## [Examples](#examples)
The following examples illustrate using the `via` field in grants for common use cases.
* [Route traffic based on device posture rules](#route-traffic-based-on-device-posture-rules).
* [Route users through exit nodes based on location](#route-users-through-exit-nodes-based-on-location).
* [Route users through app connectors](#route-users-through-app-connectors).
### [Route traffic based on device posture rules](#route-traffic-based-on-device-posture-rules)
You can use the `via` field to segment access to resources through different [routers based on device posture](/docs/solutions/protect-postgresql-unencrypted-macbooks) management rules.
The following example demonstrates a scenario in which the engineering team group can access a `192.0.2.0/24` using any available router if they comply with the `latestMac` posture (which ensures they are running the latest stable version of the Tailscale client for macOS). Anyone else (`autogroup:member`) can access `192.0.2.0/24` using the designated office router (`tag:office-router`).
```
`"postures": {
"posture:latestMac": [
"node:os == 'macos'",
"node:osVersion == '13.4.0'",
"node:tsReleaseTrack == 'stable'",
]
},
"grants": [
{
"src": ["group:eng"],
"srcPosture": ["posture:latestMac"],
"dst": ["192.0.2.0/24"],
"ip": ["\*"],
},
{
"src": ["autogroup:member"],
"dst": ["192.0.2.0/24"],
"via": ["tag:office-router"],
"ip": ["\*"],
},
]
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
### [Route users through exit nodes based on location](#route-users-through-exit-nodes-based-on-location)
You can use the `via` field to segment different [exit nodes](/docs/features/exit-nodes) to different users.
The following example demonstrates a scenario where users can access internet resources through an exit node based on the user's home office location.
Users in the Toronto (`group:tor`) and Seattle (`group:sea`) offices can access internet resources using exit nodes near their home offices (or directly from their device when exit nodes are not selected). Users on the engineering team (`group:eng`) can access internet resources using any exit node in the tailnet (or directly from their device when exit nodes are not selected).
```
`"grants": [
{
"src": ["group:tor"],
"dst": ["autogroup:internet"],
"via": ["tag:exit-node-tor"],
"ip": ["\*"],
},
{
"src": ["group:sea"],
"dst": ["autogroup:internet"],
"via": ["tag:exit-node-sea"],
"ip": ["\*"],
},
{
"src": ["group:eng"],
"dst": ["autogroup:internet"],
"ip": ["\*"],
},
]
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
### [Route users through app connectors](#route-users-through-app-connectors)
You can use the `via` field to segment different [app connectors](/docs/features/app-connectors) to different users.
The following example demonstrates a scenario in which users in the group `group:github-users` can access GitHub through an app connector tagged `tag:github-appconnector` while users in the group `group:salesforce-users` can access Salesforce through an app connector tagged `tag:salesforce-appconnector`.
```
`"grants": [
{
"src": ["group:github-users"],
"dst": ["autogroup:internet"],
"ip": ["\*"],
"via": ["tag:github-appconnector"],
},
{
"src": ["group:salesforce-users"],
"dst": ["autogroup:internet"],
"ip": ["\*"],
"via": ["tag:salesforce-appconnector"],
}
]
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
On this page
* [Limitations](#limitations)
* [Syntax](#syntax)
* [Examples](#examples)
* [Route traffic based on device posture rules](#route-traffic-based-on-device-posture-rules)
* [Route users through exit nodes based on location](#route-users-through-exit-nodes-based-on-location)
* [Route users through app connectors](#route-users-through-app-connectors)
Scroll to top