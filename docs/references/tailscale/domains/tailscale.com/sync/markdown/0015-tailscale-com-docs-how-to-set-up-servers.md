Setting up a server on your Tailscale network · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Setting up a server on your Tailscale network
Last validated: Dec 4, 2025
If you're setting up servers on Tailscale, we recommend you use an [auth key](/docs/features/access-control/auth-keys) to provision the server, and a [tag](/docs/features/tags) to restrict its access. You can also set up [Tailscale SSH](/docs/features/tailscale-ssh) to access your servers.
Here's how to set up a server in Tailscale:
1. Create a new [tag](/docs/features/tags) in your tailnet for the type of shared resource you are managing. For example, you can use the tag `server` for your servers, `prod` or `test` for your environments, and `front-end` for grouping of other resources that you maintain.
To create a tag, modify the [tailnet policy file](/docs/features/access-control/acls) to specify the owner of the tag, which is the team or user who can use that tag. You can use an existing tag for all servers. If you're also setting up Tailscale SSH, we recommend using a new tag.
```
`{
"tagOwners": {
"tag:server": ["alice@example.com"]
}
}
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
2. Write [access rules](/docs/reference/syntax/policy-file#acls) in the tailnet policy file which:
* Allow the desired sources to reach the tagged resources
* If you're also setting up Tailscale SSH, allow the desired sources to reach the tagged resources using Tailscale SSH
```
`{
"grants": [
{
"src": ["group:sre"],
"dst": ["tag:server"],
"ip": ["\*"]
}
],
"ssh": [
{
"action": "accept",
"src": ["group:sre"],
"dst": ["tag:server"],
"users": ["ubuntu", "root"]
}
]
}
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
* Generate an [authentication key](/docs/features/access-control/auth-keys) to automatically connect servers to your network. Select the tag or tags you wish to use for your servers as part of this auth key.
* If you're authenticating more than one server, use a reusable auth key. Or, for long-lived auth keys, set up an [OAuth client with the scope `auth\_keys`](/docs/features/oauth-clients#generating-long-lived-auth-keys).
* If you're authenticating ephemeral workloads like containers or functions, use an ephemeral key.
* If your tailnet has [device approval](/docs/features/access-control/device-management/device-approval) enabled, and you only intend to use that to approve end-user devices, use a pre-authorized auth key.
The **Pre-approved** option will only display in the dialog if [device approval](/docs/features/access-control/device-management/device-approval) is enabled in your Tailscale network.
Currently, if your client node is provisioned with an [authentication key](/docs/features/access-control/auth-keys), you cannot use [check mode](/docs/features/tailscale-ssh#check-mode) when
establishing a Tailscale SSH connection using the node as a source.
1. When you provision a new server, [install](/download) and connect to Tailscale manually or as part of your automation tooling. Make sure to specify the auth key including the tags you want, and to enable Tailscale SSH.
```
`tailscale up --auth-key=$TS\_AUTHKEY
`
```
If you want to specify a particular machine name for your server to use with [MagicDNS](/docs/features/magicdns), then also specify `--hostname`:
```
`tailscale up --auth-key=$TS\_AUTHKEY --hostname=$TS\_HOSTNAME
`
```
If the auth key was not generated with tags, then also specify `--advertise-tags`:
```
`tailscale up --auth-key=$TS\_AUTHKEY --advertise-tags=\<tags\>
`
```
If you want to enable Tailscale SSH, then also specify `--ssh`:
```
`tailscale up --auth-key=$TS\_AUTHKEY --ssh
`
```
2. To access your servers over Tailscale, you can connect to them like any other device in your tailnet.
If you have Tailscale SSH set up, you can connect to your severs using [Tailscale SSH](/docs/features/tailscale-ssh) or [Tailscale SSH Console](/docs/features/tailscale-ssh/tailscale-ssh-console).
Scroll to top