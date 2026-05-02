Troubleshoot Linux operator permission · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Troubleshoot Linux operator permission
Last validated: Feb 18, 2026
The [Tailscale daemon](/docs/reference/tailscaled) (`tailscaled`) typically runs as the `root` user, and so only `root` can manage the daemon. To allow a different user to manage Tailscale, set the user as the operator using the [`tailscale set`](/docs/reference/tailscale-cli#set) command:
```
`sudo tailscale set --operator=\<USERNAME\>
`
```
Scroll to top