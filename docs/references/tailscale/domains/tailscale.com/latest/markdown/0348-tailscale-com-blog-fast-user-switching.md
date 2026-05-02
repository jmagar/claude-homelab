Quickly Switch Between Tailscale Accounts Without Re-Authenticating
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|December 05, 2022
# Quickly switch between Tailscale accounts
Fast user switching has come to Tailscale! Starting in v1.34, out today, you’ll be able to quickly switch between Tailscale accounts on the same device, without re-authenticating. ([We heard you](https://github.com/tailscale/tailscale/issues/713).)
To switch between tailnets on macOS, click on the Tailscale icon in the menu bar and select the other account.
When using Tailscale both at work and at home, it used to be cumbersome to switch between accounts to do things like switch to your home account to access that one photo of your trip to Rome that’s stored on your NAS, and then switch back to your work account to share it with your colleagues (and make them jealous).
Now, you can switch to a different account (say, Alice on the `example.com` tailnet), just by typing in the terminal:
```
`tailscale switch alice@example.com
`
```
You’ll connect in seconds.
You can also set nicknames either during login:
```
`tailscale login --nickname=work
`
```
Or after logging in:
```
`tailscale set --nickname=work
`
```
and use them to switch accounts even more easily:
```
`tailscale switch work
`
```
With fast user switching, each identity is completely separate on the device. It’s equivalent to your device dropping packets in one tailnet, and allowing packets in another. You’re not transmitting packets to multiple tailnets *simultaneously*. And, separate tailnets don’t learn anything about each other (such as that the device is also part of another tailnet — or that another tailnet even exists).
Fast user switching means you don’t need to re-authenticate every time you change accounts — but you’ll still need to re-authenticate the connection if the device’s [node key is expired](https://tailscale.com/kb/1028/key-expiry/).
Fast user switching is in alpha, and available in Tailscale v1.34 on Linux (CLI), macOS (CLI and UI), and Windows (CLI and UI). Support for other platforms will be coming later.
To learn more about using fast user switching, [read the documentation](https://tailscale.com/kb/1225/fast-user-switching).
Share
Authors
Maisem Ali
Mihai Parparita
Alessandro Mingione
Authors
Maisem Ali
Mihai Parparita
Alessandro Mingione
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