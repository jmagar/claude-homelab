Connect a GitHub Action to your Tailscale network
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|September 07, 2021
# Connect a GitHub Action to your Tailscale network — now in GitHub marketplace!
A few months back we [released a GitHub Action](https://tailscale.com/blog/2021-05-github-actions-and-tailscale/) to make it easier for you to access Tailscale. This allows a GitHub Action you’re running to first connect to Tailscale using an [ephemeral authentication key](https://tailscale.com/kb/1085/auth-keys/), then perform other steps. Ephemeral auth keys clean up their state after the runner finishes, meaning you’re not persisting a connection to your network.
We’re excited that our GitHub Action is now available in the marketplace! This means that with the [Connect Tailscale](https://github.com/marketplace/actions/connect-tailscale) action, you can easily pull this into whatever actions you write.
Generate an ephemeral auth key, then specify:
```
` - name: Tailscale
uses: tailscale/github-action@v1
with:
authkey: ${{ secrets.TAILSCALE\_AUTHKEY }}
`
```
So, what can you use this for? Connect your GitHub Action to Tailscale and then:
* Securely deploy your application to an internal server
* Securely reach your private test runners for specific platforms
* Reach your database of test data without leaving it exposed on the Internet
* Access an internal deployment monitoring tool
* And much more!
Check out the [Connect Tailscale GitHub Action](https://github.com/marketplace/actions/connect-tailscale) now.
Share
Author
Naman Sood
Author
Naman Sood
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