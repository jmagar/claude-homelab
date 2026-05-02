Tailscale GitHub Action · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Tailscale GitHub Action
Last validated: Jan 30, 2026
The [Tailscale GitHub Action](https://github.com/marketplace/actions/connect-tailscale) is a [GitHub Action](https://github.com/features/actions) that lets you connect your Tailscale network (known as a tailnet) to a GitHub Actions [workflow](https://docs.github.com/en/actions/using-workflows/about-workflows).
You can access devices in your tailnet directly from your GitHub workflow, which opens up a range of possibilities:
* Securely deploy your application to an internal server (even if you're using a [GitHub-hosted runner](https://docs.github.com/en/actions/concepts/runners/github-hosted-runners)).
* Securely reach your [self-hosted runners](https://docs.github.com/en/actions/concepts/runners/self-hosted-runners) for specific platforms.
* Reach your database of test data without leaving it exposed on the internet.
* Access an internal deployment monitoring tool.
## [Prerequisites](#prerequisites)
Before using the Tailscale GitHub Action, ensure you have the following:
1. A Tailscale account with [Owner, Admin, or Network admin](/docs/reference/user-roles) permissions.
2. A GitHub repository that you have admin access to (required to set up the GitHub Action).
3. At least one configured [tag](/docs/features/tags).
4. A [federated identity](/docs/features/workload-identity-federation) client ID and audience OR an [OAuth client](/docs/features/oauth-clients) ID and secret OR an [auth key](/docs/features/access-control/auth-keys).
5. A runner image version \>= 2.237.1 (required to support running Node.js 24).
## [How it works](#how-it-works)
When you add the Tailscale GitHub Action to your workflow, subsequent steps in your GitHub Action can then access nodes in your tailnet. For example, the workflow could access a node that has a database of test data.
The Tailscale GitHub Action requires a [federated identity](/docs/features/workload-identity-federation) client ID and audience OR an [OAuth client](/docs/features/oauth-clients) ID and secret OR an [auth key](/docs/features/access-control/auth-keys) that uses a [tag identity](/docs/features/tags) and is reusable, ephemeral, and (if applicable) [pre-approved](/docs/features/access-control/device-management/device-approval).
We recommend that you use workload identity federation for authentication by supplying a federated identity client ID and audience. The federated identity requires the [`auth\_keys`](/docs/reference/trust-credentials#scopes) scope. You can store the federated identity client ID as [GitHub encrypted secrets](https://docs.github.com/en/actions/security-guides/encrypted-secrets). Federated identities are not associated with any user in your tailnet you must create [tag](/docs/features/tags) to identify the GitHub runner. When you identify a device (such as GitHub runner) with a tag, it automatically applies the access permissions granted to that tag.
When your workflow runs, it uses the federated identity and a GitHub JWT identity token to create an [ephemeral node](/docs/features/ephemeral-nodes). The ephemeral node can then access devices in your tailnet based on the access permissions granted to the tag you use to identify the GitHub runner.
Any ephemeral node that the Tailscale GitHub Action creates using a federated identity is [pre-approved](/docs/features/access-control/auth-keys#types-of-auth-keys) on tailnets that use [device approval](/docs/features/access-control/device-management/device-approval).
The GitHub Action logs out the ephemeral node immediately after the CI workflow completes, at which point the control server automatically removes the ephemeral node from your tailnet. The next time the action runs, it creates a new ephemeral node that's only available for the new workflow.
## [Add the Tailscale GitHub Action to a workflow](#add-the-tailscale-github-action-to-a-workflow)
1. Create at least one [tag](/docs/features/tags) for the ephemeral nodes that the Tailscale GitHub Action will create. For example, `tag:ci`, which is used for this example. The access permissions that you grant to the tags are applied to the nodes that will be created by the workflow.
2. Set up a [Tailscale federated identity](/docs/features/workload-identity-federation#setting-up-a-federated-identity). You'll need the value of your federated identity **Client ID** and **Audience**.
3. Create a [GitHub repository](https://docs.github.com/en/actions/how-tos/write-workflows/choose-what-workflows-do/use-secrets) secret with the name `TS\_OAUTH\_CLIENT\_ID` and assign your OAuth **Client ID** as the secret value.
4. Create a GitHub repository secret with the name `TS\_AUDIENCE` and assign your federated identity **Audience** as the secret value.
5. In your GitHub Actions [workflow](https://docs.github.com/en/actions/using-workflows/about-workflows), connect to your tailnet using the Tailscale GitHub Action. For example:
```
`- name: Tailscale
uses: tailscale/github-action@v4
with:
oauth-client-id: ${{ secrets.TS\_OAUTH\_CLIENT\_ID }}
audience: ${{ secrets.TS\_AUDIENCE }}
tags: tag:ci
`
```
`oauth-client-id` and `audience` are your federated identity Client ID and audience, respectively. `tags` is a comma-separated list of the tags applied to the ephemeral nodes that the GitHub Action creates. These tags must already exist in your tailnet.
Workload identity federation requires the `id-token: write` [permission setting](https://docs.github.com/en/actions/how-tos/secure-your-work/security-harden-deployments/oidc-in-cloud-providers#adding-permissions-settings) for the workflow:
```
`permissions:
id-token: write # This is required for the Tailscale action to request a JWT from GitHub
# Additional required permissions for your workflow
`
```
When the action runs, it creates an ephemeral node. The node can access nodes in your tailnet, subject to the access rules applied to the specified tag or tags. In the rest of your workflow, access other nodes in your tailnet as needed.
The ephemeral node is automatically cleaned up shortly after the action finishes.
## [Using an OAuth client](#using-an-oauth-client)
1. Create at least one [tag](/docs/features/tags) for the ephemeral nodes that the Tailscale GitHub Action will create. For example, `tag:ci`, which is used for this example. The access permissions that you grant to the tags are applied to the nodes that will be created by the workflow.
2. Set up a [Tailscale OAuth client](/docs/features/oauth-clients#setting-up-an-oauth-client). You'll need the value of your OAuth **Client ID** and **Client secret**. If you are using an [auth key](/docs/features/access-control/auth-keys) instead of an OAuth client, refer to [Using an auth key](#auth-key-local).
3. Create a [GitHub repository](https://docs.github.com/en/actions/how-tos/write-workflows/choose-what-workflows-do/use-secrets) secret with the name `TS\_OAUTH\_CLIENT\_ID` and assign your OAuth **Client ID** as the secret value.
4. Create a GitHub repository secret with the name `TS\_OAUTH\_SECRET` and assign your OAuth **Client secret** as the secret value.
5. In your GitHub Actions [workflow](https://docs.github.com/en/actions/using-workflows/about-workflows), connect to your tailnet using the Tailscale GitHub Action. For example:
```
`- name: Tailscale
uses: tailscale/github-action@v4
with:
oauth-client-id: ${{ secrets.TS\_OAUTH\_CLIENT\_ID }}
oauth-secret: ${{ secrets.TS\_OAUTH\_SECRET }}
tags: tag:ci
`
```
`oauth-client-id` and `oauth-secret` are your OAuth Client ID and Client secret, respectively. `tags` is a comma-separated list of the tags applied to the ephemeral nodes that the GitHub Action creates. These tags must already exist in your tailnet.
When the action runs, it creates an ephemeral node. The node can access nodes in your tailnet, subject to the access rules applied to the specified tag or tags. In the rest of your workflow, access other nodes in your tailnet as needed.
The ephemeral node is automatically cleaned up shortly after the action finishes.
## [Auth key considerations](#auth-key-considerations)
If you are using an [auth key](/docs/features/access-control/auth-keys) instead of an OAuth client, it's best practice to ensure that the [key type](/docs/features/access-control/auth-keys#types-of-auth-keys) uses a tag identity, is reusable, and is ephemeral. If the tailnet uses [device approval](/docs/features/access-control/device-management/device-approval), ensure that the key type is also pre-approved.
To use the auth key for your workflow, create a GitHub secret with the name `TAILSCALE\_AUTHKEY` and the value set to your auth key. Then use the `authkey` field to reference the secret in your workflow. For example:
```
`- name: Tailscale
uses: tailscale/github-action@v4
with:
authkey: ${{ secrets.TAILSCALE\_AUTHKEY }}
`
```
## [Ping to verify connectivity](#ping-to-verify-connectivity)
Information about new tailnet devices, such as the ephemeral node created by this GitHub Action, takes some time to propagate across your tailnet, and you might experience brief delays.
These devices only allow connections from your GitHub workflow node after they have received this information.
Tailscale recommends that you check connectivity to the intended devices by specifying their IP addresses or hostnames using the `ping` parameter.
The GitHub Action waits up to three minutes to verify either [direct or relayed](/docs/reference/connection-types) connectivity to the listed peers.
For example:
```
`- name: Tailscale
uses: tailscale/github-action@v4
with:
ping: 100.x.y.z,machine-1.my-tailnet.ts.net,machine-2
`
```
If you do not wish to use the `ping` feature, or you do not know the peer tailnet devices at the time of installing Tailscale in the workflow, consider using the [`tailscale ping`](/docs/reference/tailscale-cli#ping) command in your own workflow step:
```
`tailscale ping my-target.my-tailnet.ts.net
`
```
## [Tailscale client version](#tailscale-client-version)
Tailscale does not update the client version for the Tailscale GitHub Action every time there is a new Tailscale client release. The [default version](https://github.com/tailscale/github-action/blob/main/action.yml#L23) specified in the base YAML file remains unchanged for long periods of time. It changes only when there is a meaningful reason to do so.
If you would like to set the version yourself, add a `version` entry to your workflow:
```
` - name: Tailscale
uses: tailscale/github-action@v4
with:
oauth-client-id: ${{ secrets.TS\_OAUTH\_CLIENT\_ID }}
audience: ${{ secrets.TS\_AUDIENCE }}
tags: tag:ci
version: 1.66.0
`
```
If you would like to specify the latest stable version, set the `version` to `latest`.
```
` - name: Tailscale
uses: tailscale/github-action@v4
with:
oauth-client-id: ${{ secrets.TS\_OAUTH\_CLIENT\_ID }}
audience: ${{ secrets.TS\_AUDIENCE }}
tags: tag:ci
version: latest
`
```
If you would like to specify the latest unstable version, set the `version` to `unstable`.
```
` - name: Tailscale
uses: tailscale/github-action@v4
with:
oauth-client-id: ${{ secrets.TS\_OAUTH\_CLIENT\_ID }}
audience: ${{ secrets.TS\_AUDIENCE }}
tags: tag:ci
version: unstable
`
```
You can find the latest Tailscale stable version number at our [stable release track](https://pkgs.tailscale.com/stable/#static),
and the latest unstable version number at our [unstable release track](https://pkgs.tailscale.com/unstable/#static).
For Linux and Windows, this uses the version published at [`https://pkgs.tailscale.com/unstable`](https://pkgs.tailscale.com/unstable/), and macOS uses the `HEAD` of the `main` branch of [`https://github.com/tailscale/tailscale/`](https://github.com/tailscale/tailscale/).
## [Cache Tailscale binaries](#cache-tailscale-binaries)
Caching can reduce download times and download failures on runners with slower network connectivity. Caching is enabled by default.
You can opt out of caching Tailscale binaries by passing `'false'` to the `use-cache` input:
```
` - name: Tailscale
uses: tailscale/github-action@v4
with:
oauth-client-id: ${{ secrets.TS\_OAUTH\_CLIENT\_ID }}
audience: ${{ secrets.TS\_AUDIENCE }}
use-cache: 'false'
`
```
On this page
* [Prerequisites](#prerequisites)
* [How it works](#how-it-works)
* [Add the Tailscale GitHub Action to a workflow](#add-the-tailscale-github-action-to-a-workflow)
* [Using an OAuth client](#using-an-oauth-client)
* [Auth key considerations](#auth-key-considerations)
* [Ping to verify connectivity](#ping-to-verify-connectivity)
* [Tailscale client version](#tailscale-client-version)
* [Cache Tailscale binaries](#cache-tailscale-binaries)
Scroll to top