Access PiKVM from anywhere · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Access PiKVM from anywhere
Last validated: Jan 5, 2026
PiKVM is a Raspberry Pi based KVM (keyboard, video, and mouse) over IP solution. It lets you connect to a computer remotely and use it as if you were in front of it. This guide shows you how to set up Tailscale on PiKVM.
To find out more about PiKVM, visit [`pikvm.org`](https://pikvm.org). We also have a video guide on how to set up Tailscale on PiKVM.
## [Prerequisites](#prerequisites)
* A PiKVM device or a Raspberry Pi with PiKVM installed.
* The PiKVM project [recommends](https://docs.pikvm.org/faq/) a Pi 4. The Pi 5 provides little to no performance improvement for this use case.
* [A Tailscale account](https://login.tailscale.com/start)-the free [Personal plan](/pricing) includes all you need to get started.
## [Install Tailscale](#install-tailscale)
1. Access your PiKVM through the web interface and open the web terminal.
2. Elevate to root.
```
`# default password is 'root'
su -
`
```
3. Enable read-write mode.
```
`rw
`
```
If you reboot your PiKVM during this process, you will need to re-enable read-write mode.
1. Install the `tailscale-pikvm` package.
```
`pacman -Sy tailscale-pikvm
`
```
We recommend the `tailscale-pikvm` package as a result of [this issue](https://github.com/tailscale/tailscale/issues/2934)
1. Enable and start the Tailscale service.
```
`systemctl enable --now tailscaled
`
```
2. Log in to Tailscale.
For more information on the available login options, refer to our [Command Reference](/docs/reference/tailscale-cli#up).
```
`tailscale up
`
```
3. (Optional) Enable [Tailscale SSH](/docs/features/tailscale-ssh).
```
`tailscale set --ssh
`
```
4. Revert to read-only mode.
```
`ro
`
```
You might prefer to disable key expiry on your subnet nodes to avoid having to periodically reauthenticate. Refer to [key expiry](/docs/features/access-control/key-expiry) for more information about machine keys and how to disable their expiry. If you use [tags](/docs/features/tags), [key expiry is disabled by default](/docs/features/tags#key-expiry).
## [Access your PiKVM device](#access-your-pikvm-device)
Once you have installed Tailscale on your PiKVM device, you can access it from anywhere using the Tailscale network.
Open the [Machines](https://login.tailscale.com/admin/machines) page of the admin console and find your PiKVM device.
You can access the web interface by visiting `https://\<your-pikvm\>.\<your-tailnet\>.ts.net`. For example, if your PiKVM device is named `pikvm` and your Tailscale network is named `pango-lin`, you would visit `https://pikvm.pango-lin.ts.net`.
### [Use Tailscale Serve to access your PiKVM device](#use-tailscale-serve-to-access-your-pikvm-device)
You can set up Tailscale Serve to proxy your PiKVM's web interface. This provides a valid TLS certificate for your PiKVM device, preventing your browser from displaying a security warning.
To setup Tailscale Serve, follow the instructions below. You can also find more information on our [Use Tailscale Funnel and Serve](/docs/reference/examples/funnel) topic.
A Tailscale Serve server can only be access over your tailnet. It is not accessible from the public internet. Using [Tailscale Funnel](/docs/features/tailscale-funnel) would open your PiKVM device to the public internet, which is not recommended.
```
`tailscale serve --bg https+insecure://localhost:443
`
```
After running the command above, you can access your PiKVM device, as before, by visiting `https://\<your-pikvm\>.\<your-tailnet\>.ts.net`. The difference is that the connection is proxied through your Tailscale Serve server, providing a valid TLS certificate for your PiKVM device.
The first request to your PiKVM device may take a few seconds to complete. This is because Tailscale Serve needs to fetch a valid TLS certificate for your PiKVM device. Subsequent requests will be much faster.
### [Use your PiKVM node as an exit node or subnet router](#use-your-pikvm-node-as-an-exit-node-or-subnet-router)
Now that PiKVM is in your tailnet, you can configure it to do other useful things, such as functioning an [exit node](/docs/features/exit-nodes) or a [subnet router](/docs/features/subnet-routers).
On this page
* [Prerequisites](#prerequisites)
* [Install Tailscale](#install-tailscale)
* [Access your PiKVM device](#access-your-pikvm-device)
* [Use Tailscale Serve to access your PiKVM device](#use-tailscale-serve-to-access-your-pikvm-device)
* [Use your PiKVM node as an exit node or subnet router](#use-your-pikvm-node-as-an-exit-node-or-subnet-router)
Scroll to top