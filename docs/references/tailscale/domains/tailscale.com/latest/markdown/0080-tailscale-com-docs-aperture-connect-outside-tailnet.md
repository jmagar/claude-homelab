Connect devices outside your tailnet · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Connect devices outside your tailnet
Last validated: Apr 22, 2026
Aperture by Tailscale is currently [in alpha](/docs/reference/tailscale-release-stages#alpha).
Aperture runs on a [tailnet](/docs/concepts/tailnet), and devices in that tailnet can reach it directly. But not every device that needs LLM access can join the tailnet. CI/CD runners, contractor machines, personal devices, and devices in a different tailnet can all connect to Aperture using `ts-unplug`, a tool from the [ts-plug repository](https://github.com/tailscale/ts-plug) that creates a lightweight tailnet node and proxies local traffic to your Aperture instance.
When you run `ts-unplug` on a device, it joins your tailnet as its own node and opens a local port that forwards traffic to Aperture. The device does not need Tailscale installed. Aperture authenticates requests using the `ts-unplug` node's Tailscale identity, not a shared API key. If each person runs their own `ts-unplug` instance, Aperture attributes activity to individual users.
The `ts-plug` and `ts-unplug` tools are under active development. Refer to the [ts-plug repository](https://github.com/tailscale/ts-plug) for the latest status and release information.
## [Use cases](#use-cases)
`ts-unplug` is useful when devices cannot or should not join your tailnet directly.
* **CI/CD runners**: Ephemeral environments like GitHub Actions runners that need LLM access during builds. Use an [auth key](/docs/features/access-control/auth-keys) to skip interactive approval.
* **Contractor or vendor machines**: External collaborators who need Aperture access without joining your organization's tailnet.
* **Personal devices**: Team members who prefer not to install Tailscale on personal hardware.
* **Cross-tailnet access**: Devices in a different tailnet that need to reach your Aperture instance.
For devices that are already in your tailnet, connecting directly requires fewer steps and provides the same per-user identity. Refer to [Set up LLM clients](/docs/aperture/use-your-tools) for connection instructions.
## [Limitations](#limitations)
The following limitations apply while `ts-unplug` is in alpha:
* `ts-unplug` must be built from source. Pre-built binaries are not available.
* `ts-unplug` listens on `localhost` only. Other devices on the same network cannot access the proxy.
* Each `ts-unplug` instance creates a separate tailnet node. If you need many instances, consider using [auth keys](/docs/features/access-control/auth-keys) with appropriate tags and access control policies.
## [Prerequisites](#prerequisites)
Before you begin, confirm you have the following:
* **Go toolchain.** `ts-unplug` is built from source. Install [Go](https://go.dev/doc/install) 1.21 or later.
* **Git.** Required to clone the [ts-plug repository](https://github.com/tailscale/ts-plug).
* **The FQDN of your Aperture instance.** By default, this is `\<aperture-hostname\>.\<tailnet-id\>.ts.net`. Find your tailnet name in the [General](https://login.tailscale.com/admin/settings/general) of the admin console.
* **Permission to approve devices.** You need to be an [Owner, Admin, or Network admin](/docs/reference/user-roles) to approve the `ts-unplug` node in the admin console, unless you use an [auth key](/docs/features/access-control/auth-keys) to authenticate automatically.
## [Set up ts-unplug](#set-up-ts-unplug)
To connect a device to Aperture using `ts-unplug`, build the tool from source, start the proxy, and approve the device in your tailnet.
### [Step 1: Build ts-unplug](#step-1-build-ts-unplug)
Clone the [ts-plug repository](https://github.com/tailscale/ts-plug) and build `ts-unplug`:
```
`git clone https://github.com/tailscale/ts-plug.git
cd ts-plug
make ts-unplug
`
```
This creates the binary at `./build/ts-unplug`.
### [Step 2: Start ts-unplug](#step-2-start-ts-unplug)
Run `ts-unplug` and point it at your Aperture instance. Replace `\<tailnet-id\>` with your tailnet name and choose a local port:
```
`./build/ts-unplug -dir ./state -port 8080 \<aperture-hostname\>.\<tailnet-id\>.ts.net
`
```
On the first run, `ts-unplug` prints a URL to authenticate the new node. Open the URL in a browser to complete authentication.
### [Step 3: Approve the device](#step-3-approve-the-device)
Approve the new device in the [Machines](https://login.tailscale.com/admin/machines) of the admin console for the tailnet hosting Aperture.
After approval, `ts-unplug` displays `HTTP proxy listening` and you can access Aperture at `http://localhost:8080`.
### [Step 4: Verify the connection](#step-4-verify-the-connection)
After `ts-unplug` is running, confirm the connection works by sending a test request:
```
`curl -s http://localhost:8080/v1/messages \\
-H "Content-Type: application/json" \\
-d '{
"model": "claude-haiku-4-5-20251001",
"max\_tokens": 25,
"messages": [{"role": "user", "content": "respond with: hello"}]
}'
`
```
If the request succeeds, open the [Aperture dashboard](/docs/aperture/reference/dashboard) at `http://localhost:8080/ui/` to find the request in your usage history.
## [Next steps](#next-steps)
* **Configure tools to use the proxy**
After you confirm the connection works, configure your tools to use `http://localhost:\<port\>` as the base URL for API requests. For tool-specific configuration, refer to [Set up LLM clients](/docs/aperture/use-your-tools) and replace `http://\<aperture-hostname\>` with `http://localhost:\<port\>` in any configuration example.
* **Manage `ts-unplug` instances**
It's important to manage your `ts-unplug` instances to maintain security and keep your tailnet organized. You can stop the proxy when it's not in use, remove devices from your tailnet when they're no longer needed, and run multiple instances with separate state directories if multiple users need access.
On this page
* [Use cases](#use-cases)
* [Limitations](#limitations)
* [Prerequisites](#prerequisites)
* [Set up ts-unplug](#set-up-ts-unplug)
* [Step 1: Build ts-unplug](#step-1-build-ts-unplug)
* [Step 2: Start ts-unplug](#step-2-start-ts-unplug)
* [Step 3: Approve the device](#step-3-approve-the-device)
* [Step 4: Verify the connection](#step-4-verify-the-connection)
* [Next steps](#next-steps)
Scroll to top