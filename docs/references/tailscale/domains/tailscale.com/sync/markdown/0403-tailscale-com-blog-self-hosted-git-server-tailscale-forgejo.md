Making your own private, self-hosted Git server with Forgejo and Tailscale
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|insightsSeptember 15, 2025
# Forge your own path: A private code server with Forgejo and Tailscale
Let's talk about owning your code.
There's something deeply satisfying about having your repositories living on hardware you control, while still being accessible from anywhere you need them. That's exactly what we're building today: a local-first code hosting platform that runs on infrastructure you own, and you control.
Enter [Forgejo](https://forgejo.org/)—your very own self-hosted, lightweight, software forge. It's got everything you'd expect: repositories, issues, pull requests, even CI/CD runners, if you fancy them. And a lesser-known feature (that doesn’t get enough love, in my opinion), repository mirroring. I use mirroring to automatically back up all my public repositories to my own infrastructure every few hours.
Running a local code forge, it’s highly likely you’ll want to enable direct, transparent SSH access for clone operations. Ordinarily that would require specifying a port, as the available binding for port 22 is a hotly contested one. But using [Tailscale serve](https://tailscale.com/kb/1242/tailscale-serve), and these few lines of code below, we can use `TCPForward` to make SSH access a non-issue for anyone on your Tailnet.
```
`{
"TCP": {
"22": {
"TCPForward": "127.0.0.1:22"
},
"443": {
"HTTPS": true
}
},
"Web": {
"${TS\_CERT\_DOMAIN}:443": {
"Handlers": {
"/": {
"Proxy": "http://127.0.0.1:3000"
}
}
}
},
"AllowFunnel": {
"${TS\_CERT\_DOMAIN}:443": false
}
}`
```
As always with Tailscale, it just works. There’s no port forwarding to configure, no reverse proxies, no excruciating back-and-forth with your firewall rules. Just simple, encrypted peer-to-peer networking that makes your self-hosted Git server work exactly like you'd expect.
Full code snippets can be found linked in this [GitHub repository](https://github.com/tailscale-dev/video-code-snippets/tree/main/2025-09-forgejo). Be sure to get subscribed to the [YouTube channel](https://www.youtube.com/tailscale), as we’ll be covering self-hosted CI/CD runners with Forgejo soon!
Share
Author
Alex Kretzschmar
Author
Alex Kretzschmar
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