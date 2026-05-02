Configure Tailscale clients to use a custom control server · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Configure Tailscale clients to use a custom control server
Last validated: Jan 5, 2026
The Tailscale clients let you specify a custom control server URL instead of the default `https://controlplane.tailscale.com` server. If you are using a self-managed deployment of [Headscale](/blog/opensource#the-open-source-coordination-server) as your control plane, use your Headscale instance's URL.
[macOS](/docs/how-to/set-up-custom-control-server?tab=macos)[Windows](/docs/how-to/set-up-custom-control-server?tab=windows)[Linux](/docs/how-to/set-up-custom-control-server?tab=linux)[iOS](/docs/how-to/set-up-custom-control-server?tab=ios)[Android](/docs/how-to/set-up-custom-control-server?tab=android)[tvOS](/docs/how-to/set-up-custom-control-server?tab=tvos)
If you're using the [App Store or Standalone variants](/docs/concepts/macos-variants) of the Tailscale client, you can add a custom control server URL in the Tailscale user interface:
The following instructions only work when at least one other tailnet has been authenticated in the client. If no other tailnets have been added to the device, use the Tailscale CLI instructions instead.
1. Select the Tailscale icon in the macOS menu bar.
2. Choose **Settings** from the menu.
3. Select the **Accounts** tab.
4. Select the down arrow in the lower left corner of the window.
5. Enter your custom control server URL and select **Add account**.
Alternatively, to sign in with a custom control server URL from the Tailscale CLI, run the following command. Replace `\<URL\>` with your custom coordination server URL.
```
`tailscale login --login-server=\<URL\>
`
```
Scroll to top