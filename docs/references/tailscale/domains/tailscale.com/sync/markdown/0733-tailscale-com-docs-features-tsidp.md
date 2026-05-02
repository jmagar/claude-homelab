tsidp · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# tsidp
Last validated: Mar 10, 2026
`tsidp` is a lightweight OIDC/OAuth server that leverages Tailscale's cryptographically guaranteed [network identity](/docs/concepts/tailscale-identity) to eliminate authentication prompts while also improving security posture. With Tailscale and `tsidp`, you can securely isolate and authorize any service that supports OIDC/OAuth including self-hosted apps like Grafana and even Model Context Protocol (MCP) servers for private AI deployments with minimal effort.
`tsidp` is available as an open source project at [https://github.com/tailscale/tsidp](https://github.com/tailscale/tsidp).
`tsidp` is an experimental project. It is under active development and might experience breaking changes.
## [How it works](#how-it-works)
When you run `tsidp` on your Tailscale network (known as a tailnet), it exposes standard OIDC endpoints so OIDC-capable applications like Grafana and Proxmox can use it as an identity provider. The application performs OIDC discovery against the `tsidp` endpoints. When a user needs to access the application, the application presents a **Log in using Tailscale** option, and then redirects the login request to `tsidp`. `tsidp` uses the LocalAPI `whois` functionality to determine the caller's identity. `tsidp` and the application exchange information with `tsidp` ultimately sending an ID token and access token to the application. The application can verify the ID token digital signature. Optionally, the application can retrieve `userinfo` contents to retrieve information such as the user name, email, or picture, if available.
`tsidp` uses [`tsnet`](/docs/features/tsnet), which lets applications programmatically make direct connections to devices in your tailnet. Among other functionality, `tsnet` provides `tsidp` with access to [LocalAPI](https://github.com/tailscale/tailscale/blob/main/ipn/localapi/localapi.go), which lets applications programmatically retrieve information about the Tailscale client, including the `whois` identity.
## [Prerequisites](#prerequisites)
To set up `tsidp`, you need the following prerequisites:
* A tailnet. If you do not have a tailnet, [sign up](https://login.tailscale.com/start).
* A Tailscale account with [Owner, Admin, or Network admin](/docs/reference/user-roles) permissions, so you can perform the following tasks on the tailnet where you want to set up `tsidp`:
* Enable MagicDNS.
* Enable HTTPS.
* Edit the tailnet policy file.
* (Optional) Create an [authentication key](/docs/features/access-control/auth-keys) (auth key) or an [OAuth client](/docs/features/oauth-clients). The purpose is to pre-approve the `tsidp` instance when it joins your tailnet, without requiring an interactive login.
* A device in your tailnet upon which you will run the `tsidp` binary.
* (Recommended) Docker installed on your device. This topic assumes you have Docker installed.
* Ability to create a configuration file and run CLI commands so you can run the `tsidp` binary.
To use `tsidp` with an application, the application needs to support OIDC/OAuth and needs to know which endpoints to use for a `tsidp` server. Configuring an application to know which endpoints to use is application-specific, so it is not documented here.
## [Configure your tailnet](#configure-your-tailnet)
You need to perform the following tasks to configure your tailnet for `tsidp`.
### [Enable MagicDNS](#enable-magicdns)
MagicDNS automatically registers DNS names for devices in your tailnet. Tailnets created on or after October 20, 2022 have MagicDNS enabled by default. For information about enabling MagicDNS, refer to [Enabling MagicDNS](/docs/features/magicdns#enabling-magicdns).
### [Enable HTTPS](#enable-https)
Enabling HTTPS lets you provision Transport Layer Security (TLS) certificates for devices in your tailnet. The `tsidp` functionality requires your `tsidp` server to have a TLS certificate. For information about enabling HTTPS, refer to [Configure HTTPS](/docs/how-to/set-up-https-certificates).
### [(Optional) Create an auth key or other credential](#optional-create-an-auth-key-or-other-credential)
If you want to pre-approve adding the `tsidp` instance to your tailnet, you need an [authentication key](/docs/features/access-control/auth-keys) (auth key) or an [OAuth client](/docs/features/oauth-clients). Without one of these credentials, you need to interactively log in the `tsidp` instance, before it can join your tailnet.
For purposes of this topic, the credential is an auth key.
1. Open the [Keys](https://login.tailscale.com/admin/settings/keys) page of the admin console.
2. Select **Generate auth key**.
3. For **Description**, enter `tsidp` or another string that you want. This value is used only for organizing your auth keys.
4. (Optional) Configure other settings for the auth key. For information about auth key settings, refer to [Auth keys](/docs/features/access-control/auth-keys).
5. Select **Generate key**.
6. Copy the auth key value and keep it secure. It won't be shown in full again. You need the auth key value later, when you set the `TS\_AUTHKEY` environment variable.
7. Select **Done**.
### [Set up an application capability grant](#set-up-an-application-capability-grant)
Access to the `tsidp` admin user interface and dynamic client registration (DCR) endpoints are denied by default.
To allow access, you need to set up a `tailscale.com/cap/tsidp` [application capability](/docs/features/access-control/grants/grants-app-capabilities) (app capability) grant. For example, to let your tailnet admins access devices with the [tag](/docs/features/tags) `tag:server`, [create the tag](/docs/features/tags#define-a-tag) and [edit your tailnet policy file](/docs/features/tailnet-policy-file/manage-tailnet-policies) to add a grant like the following:
```
`"grants": [
{
// Allow admins to access any device with the tag "tag:server"
"src": ["autogroup:admin"],
"dst": ["tag:server"],
"app": {
"tailscale.com/cap/tsidp": [
{
// allow access to UI
"allow\_admin\_ui": true,
// Security Token Service (STS) controls
"users": ["\*"],
"resources": ["\*"],
// extraClaims are included in the id\_token
// recommend: keep this small and simple
"extraClaims": {
"bools": true,
"strings": "Mon Jan 2 15:04:05 MST 2006",
"numbers": 180,
"array1": [1,2,3],
"array2": ["one", "two", "three"]
},
// include extraClaims data in /userinfo response
"includeInUserInfo": true,
},
],
},
},
],
`
```
The following table describes the `app` fields when you define a `tailscale.com/cap/tsidp` app capability.
|Field|Description|
|`allow\_admin\_ui`|Whether the users specified in `users` can access the `tsidp` admin user interface.|
|`users`|The users that are allowed to request a security token from the STS.|
|`resources`|The resources that a security token provides access to.|
|`extraClaims`|Any extra claims to include in the security token.|
|`includeInUserInfo`|Whether to include extra claims in `/userinfo` responses.|
You can add more grants as needed. As an example, you could allow `group:sales` to access devices that are tagged as `tag:sales`. That would be a separate grant, containing its own `tailscale.com/cap/tsidp` definition.
The `tsidp` app capability schema is in development and might change at any time.
App capability grants are per request and are updated immediately. There is no need to restart `tsidp` when you create or modify your app capability grant.
## [Deploy a tsidp instance](#deploy-a-tsidp-instance)
The `tsidp` source code is at [https://github.com/tailscale/tsidp](https://github.com/tailscale/tsidp). We recommend that you use the pre-built Docker image, as shown in the following steps.
1. On a device in your tailnet that is running Docker, create a folder that you want to use for `tsidp` and make it the active working directory.
2. Create a `compose.yaml` file and use the following template for its content:
```
`services:
tsidp:
container\_name: tsidp
image: ghcr.io/tailscale/tsidp:latest
volumes:
- tsidp-data:/data
environment:
- TAILSCALE\_USE\_WIP\_CODE=1 # tsidp is experimental - needed while version \<1.0.0
- TS\_STATE\_DIR=/data # store persistent tsnet and tsidp state
- TS\_HOSTNAME=idp # Hostname on tailnet (becomes idp.your-tailnet.ts.net)
- TSIDP\_ENABLE\_STS=1 # Enable OAuth token exchange
volumes:
tsidp-data:
`
```
3. Create the `TS\_ADVERTISE\_TAGS` environment variable and assign it the tag that you created earlier, in your tailnet policy file:
```
`export TS\_ADVERTISE\_TAGS=tag:tsidp
`
```
4. Create the `TS\_AUTHKEY` environment variable and assign it the auth key that you created earlier:
```
`export TTS\_AUTHKEY=\<your-auth-key\>
`
```
Replace `\<your-auth-key\>` with your auth key. Alternatively, if you created an OAuth client, replace `\<your-auth-key\>` with the OAuth client secret.
5. Run the `tsidp` binary:
```
`docker compose up -d
`
```
6. (Optional) Stream output from `stdout` and `stderr` for the `tsidp` container:
```
`docker compose logs -f
`
```
When you want to stop streaming the logs output, press `Ctrl+C`.
As part of the initialization, the `tsidp` binary generates a TLS certificate for the `tsidp` instance.
If you're running `tsidp` for the first time, it might take a few minutes for the TLS certificate to generate. You might not be able to access the `tsidp` server until the certificate is ready.
7. After `tsidp` starts, from a device in your tailnet, open `https://idp.\<your-tailnet-dns-name\>`, replacing `\<your-tailnet-dns-name\>` with your actual [tailnet DNS name](/docs/concepts/tailnet-name#tailnet-dns-name). You can find your tailnet DNS name in the [DNS](https://login.tailscale.com/admin/dns) page of the admin console. For example, `https://idp.cat-crocodile.ts.net`.
Now that you have `tsidp` running on your tailnet, you can use it to manage credentials.
## [Use tsidp to manage credentials](#use-tsidp-to-manage-credentials)
After you start your `tsidp` server, use the `tsidp` admin user interface to create, update, or delete an OIDC client.
### [Create an OIDC client](#create-an-oidc-client)
1. Open the **Tailscale OIDC Identity Provider** URL that was provided by your `tsidp` application.
2. Select **Create Client**.
3. For **Client Name**, provide a name for the client.
4. For **Redirect URIs**, provide the one or more redirect URIs that users will be redirected to after authentication. Enter one redirect per line.
5. Select **Create Client**.
6. Copy both the Client ID and the Client Secret. The Client Secret will not be visible again, after you close the Add New OIDC Client page.
7. Use the Client ID and the Client Secret in your Hosted or SaaS applications as needed. Information on how to do so is application-specific, so it is not documented here.
### [Update an OIDC client](#update-an-oidc-client)
1. Open the **Tailscale OIDC Identity Provider** URL that was provided by your `tsidp` application.
2. For the client that you want to update, select **Edit**.
3. Update the client name and redirect URIs as needed.
4. Select **Update Client**.
### [Regenerate a client secret](#regenerate-a-client-secret)
1. Open the **Tailscale OIDC Identity Provider** URL that was provided by your `tsidp` application.
2. For the client whose secret you plan to update, select **Edit**.
3. Select **Regenerate Secret**.
4. Select **OK** to confirm you want to regenerate the secret.
5. Copy the new Client Secret. The Client Secret will not be visible again, after you close the **Edit OIDC Client** page.
6. Use the new Client Secret in your Hosted or SaaS applications as needed.
### [Delete an OIDC client](#delete-an-oidc-client)
1. Open the **Tailscale OIDC Identity Provider** URL that was provided by your `tsidp` application.
2. For the client that you want to delete, select **Edit**.
3. Select **Delete Client**.
4. Select **OK** to confirm you want to delete the client.
## [Next steps](#next-steps)
* To configure `tsidp` as an identity provider for [Proxmox](https://www.proxmox.com/), refer to the [`tsidp` Proxmox example](https://github.com/tailscale/tsidp/blob/main/docs/proxmox/README.md).
* `tsidp` supports endpoints required and suggested by the [MCP Authorization specification](https://modelcontextprotocol.io/specification/draft/basic/authorization), including [Dynamic Client Registration](https://www.rfc-editor.org/rfc/rfc7591.html). For more information, refer to the following examples:
* [MCP Client / Server](https://github.com/tailscale/tsidp/blob/main/examples/mcp-server/README.md)
* [MCP Client / Gateway Server](https://github.com/tailscale/tsidp/blob/main/examples/mcp-gateway/README.md)
* As an alternative to using an auth key, you can use an OAuth client to pre-approve your `tsidp` instance. For more information, refer to [OAuth clients](/docs/features/oauth-clients).
* For more information about `tsidp` configuration, refer to [`tsidp` configuration](/docs/reference/tsidp-configuration).
On this page
* [How it works](#how-it-works)
* [Prerequisites](#prerequisites)
* [Configure your tailnet](#configure-your-tailnet)
* [Enable MagicDNS](#enable-magicdns)
* [Enable HTTPS](#enable-https)
* [(Optional) Create an auth key or other credential](#optional-create-an-auth-key-or-other-credential)
* [Set up an application capability grant](#set-up-an-application-capability-grant)
* [Deploy a tsidp instance](#deploy-a-tsidp-instance)
* [Use tsidp to manage credentials](#use-tsidp-to-manage-credentials)
* [Create an OIDC client](#create-an-oidc-client)
* [Update an OIDC client](#update-an-oidc-client)
* [Regenerate a client secret](#regenerate-a-client-secret)
* [Delete an OIDC client](#delete-an-oidc-client)
* [Next steps](#next-steps)
Scroll to top