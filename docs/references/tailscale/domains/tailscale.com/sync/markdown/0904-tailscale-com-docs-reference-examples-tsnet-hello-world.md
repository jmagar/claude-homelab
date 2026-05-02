What is hello.ts.net? · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# What is hello.ts.net?
Last validated: Dec 10, 2025
[`hello.ts.net`](https://hello.ts.net) is a server administered by Tailscale staff to demonstrate how
Tailscale works for new users.
`hello.ts.net` can only be accessed over Tailscale.
If `hello.ts.net` loads in your browser, you're connected over Tailscale!
`hello.ts.net` is not available to [ephemeral nodes](/docs/features/ephemeral-nodes).
`hello.ts.net` is a private, "one-way" server. It is not accessible from the
public internet, and [access control policies](/docs/features/access-control) restrict it
from making any outgoing connections. Tailscale does not start connections
from `hello.ts.net` to your tailnet. It serves no purpose other than to let you
verify you're connected to Tailscale.
Previously, `hello.ipn.dev` was used rather than `hello.ts.net`. These serve the same purpose.
## [How can I add hello.ts.net?](#how-can-i-add-hellotsnet)
If you would like to add it for testing purposes,
you can use this special invite link to accept it into your network:
[> login.tailscale.com/admin/invite/hello.ts.net
> ↗
](https://login.tailscale.com/admin/invite/hello.ts.net)
## [How can I remove it from my network?](#how-can-i-remove-it-from-my-network)
You can remove `hello.ts.net` at any time from the [Machines](https://login.tailscale.com/admin/machines) page of the admin console. Press the menu for a link to remove it.
Once removed, it will disappear from the list, and no users on your network will
be able to connect to it.
## [Does hello.ts.net have a reliability guarantee?](#does-hellotsnet-have-a-reliability-guarantee)
Tailscale operates `hello.ts.net` on a best-effort basis. It is not critical
infrastructure for the Tailscale service, and you should not rely on it as
critical infrastructure for your tailnet.
In particular, probing `hello.ts.net` is not an ideal way to determine whether the
Tailscale service is up. To do that, you can run `tailscale status -json | jq -r .BackendState` (or `tailscale status --json | grep BackendState` if you don't
have `jq`) from the CLI, which will print `Running` when connected, and
`Stopped` when not. You can also attempt to connect to a resource on your
tailnet either with standard tools like `curl` or with, for example,
[`LocalClient.DialTCP`](https://pkg.go.dev/tailscale.com/client/tailscale#LocalClient.DialTCP).
On this page
* [How can I add hello.ts.net?](#how-can-i-add-hellotsnet)
* [How can I remove it from my network?](#how-can-i-remove-it-from-my-network)
* [Does hello.ts.net have a reliability guarantee?](#does-hellotsnet-have-a-reliability-guarantee)
Scroll to top