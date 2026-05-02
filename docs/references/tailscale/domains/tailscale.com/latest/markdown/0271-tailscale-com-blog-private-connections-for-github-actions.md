Private connections for every GitHub Actions runner
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|productJune 10, 2025
# Private connections for every GitHub Actions runner
Use the updated Tailscale GitHub Action to unify secure connectivity for your entire build pipeline with Windows and macOS support joining Linux in General Availability.
We hear you loud and clear, Windows and macOS developers. While Tailscale has been great for securely connecting CI/CD pipelines that only relied on Linux, other OSes have been feeling left out. You've been stuck with workarounds, juggling multiple systems, or worse, exposing your pipelines to the public internet just to make things work.
With support for all three major operating systems, you can now use the [Tailscale GitHub Action](https://github.com/tailscale/github-action) to securely:
* Deploy applications to internal servers.
* Debug your private test runners via SSH.
* Connect a runner to a test database without exposing it to the public internet.
* Connect a runner to an internal deployment monitoring tool.
Using secure connections offered by Tailscale and the GitHub Action, it’s possible to both improve your security posture with least privileged access while simultaneously making the lives of Engineering and DevOps easier.
## How to get started with Tailscale and GitHub Actions
If you’re already using GitHub Actions, it’s an incredibly straightforward process to get started:
1. Create a [tag](https://tailscale.com/kb/1068/tags) for the nodes that the Tailscale GitHub Action will create (e.g. tag:ci). Tags make it easy to control access between devices that are not specifically tied to a Tailscale user (e.g. your laptop).
2. Set up a [Tailscale OAuth client](https://tailscale.com/kb/1215/oauth-clients#setting-up-an-oauth-client) with the `auth\_keys` scope. You'll need the value of your OAuth client ID and secret. It’s also possible to use an [auth key](https://tailscale.com/kb/1085/auth-keys) instead of an OAuth client.
3. Create GitHub secrets with the names `TS\_OAUTH\_CLIENT\_ID` and `TS\_OAUTH\_SECRET` and assign the relevant values.
4. In your GitHub Actions workflow, connect to your tailnet by using the Tailscale GitHub Action. For example:
```
` name: Tailscale
uses: tailscale/github-action@v3
with:
oauth-client-id: ${{ secrets.TS\_OAUTH\_CLIENT\_ID }}
oauth-secret: ${{ secrets.TS\_OAUTH\_SECRET }}
tags: tag:ci
`
```
Going beyond the custom GitHub Action itself, two core Tailscale features make using Tailscale seamless in CI/CD pipelines: ephemeral nodes and tags. You’ll find these useful in any use case where nodes constantly spin up and down.
### Ephemeral nodes — automatic cleanup of old nodes
[Ephemeral nodes](https://tailscale.com/kb/1111/ephemeral-nodes) are like regular Tailscale nodes (e.g. your laptop), but they are automatically deleted from a tailnet after being offline for a short period of time. The use of ephemeral nodes allows Tailscale to better support a multitude of use cases beyond a typical VPN. These include direct connectivity to containers in serverless environments, Kubernetes clusters, and of course CI/CD pipelines. It’s possible to easily automate the entire lifecycle of an ephemeral node by configuring OAuth clients and auth keys to create nodes as ephemeral nodes.
### Tags — automatically group nodes to control access
[Tags](https://tailscale.com/kb/1068/tags) make it incredibly simple to control access between large groups of devices and other devices or users. In the case of a CI/CD pipeline, you can easily [create a set of rules](https://tailscale.com/kb/1324/grants) that enforce least privileged access to runners and data.
Below is a common pattern. DevOps has access to any tagged runners for debugging over port 22, and runners have access to a staging database on port 5432 (the default Postgres port).
```
`"grants": [
{
"src": ["group:devops"],
"dst": ["tag:ci"],
"ip": ["22"],
},
{
"src": ["tag:ci"],
"dst": ["tag:staging-db"],
"ip": ["5432"],
},
],
`
```
Once your tags, groups, OAuth clients, and access controls are configured, there’s no more maintenance required. Group membership updates are now trivial [via SCIM](https://tailscale.com/kb/1290/user-group-provisioning), while new nodes are automatically added and removed from their assigned tag.
## Get started with Tailscale & GitHub Actions today
Regardless of whether or not your pipeline requires Linux, Windows, or macOS, it’s now possible to securely connect everything and everyone with minimal overhead. Find the [Tailscale GitHub Action](https://github.com/tailscale/github-action) on the GitHub Actions marketplace and start using it today!
Share
Author
Remy Guercio
Author
Remy Guercio
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