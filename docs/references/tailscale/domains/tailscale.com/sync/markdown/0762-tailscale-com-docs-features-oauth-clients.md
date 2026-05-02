OAuth clients · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# OAuth clients
Last validated: Jan 5, 2026
OAuth clients allow for ongoing access to the [Tailscale API](/docs/reference/tailscale-api) using the [client credentials flow](https://www.rfc-editor.org/rfc/rfc6749.html#section-4.4) of the [OAuth 2.0 protocol](https://www.rfc-editor.org/rfc/rfc6749.html).
## [How it works](#how-it-works)
You create an OAuth client that defines the [scopes](/docs/reference/trust-credentials#scopes) to allow when your client application uses the Tailscale API. An example scope is `dns:read`, which grants read-only access to a tailnet's DNS settings. Another example is the `devices:core` scope, which grants access to read and write the list of devices in the tailnet, authorize or remove machines, and manipulate tags on devices.
Tailscale restricts scopes to only the necessary Tailscale API endpoints needed for an operation. For example, tokens with the `dns:read` scope can access only the following Tailscale API endpoints:
* `GET /api/v2/tailnet/:tailnet/dns/nameservers`
* `GET /api/v2/tailnet/:tailnet/dns/preferences`
* `GET /api/v2/tailnet/:tailnet/dns/searchpaths`
* `GET /api/v2/tailnet/:tailnet/keys/:keyID` (for itself only)
An OAuth client consists of a client ID and a client secret. When you create an OAuth client, Tailscale creates these for you. Within your client application, use the client ID and client secret to request an API access token from the [Tailscale OAuth token endpoint](#tailscale-oauth-token-endpoint). You use the access token to make calls to the Tailscale API. The access token grants permission only for the scopes that you defined when you created the OAuth client.
An API access token expires after one hour. For continuous access, shortly before an API access token expires, request a new API access token from the Tailscale OAuth token endpoint.
OAuth client libraries in popular programming languages can handle the API access token generation and renewal.
The Tailscale OAuth implementation uses the [OAuth 2.0 protocol](https://www.rfc-editor.org/rfc/rfc6749.html).
## [Prerequisites](#prerequisites)
You need to be an [Owner, Admin, Network admin, or IT admin](/docs/reference/user-roles) of a tailnet to create, revoke, or delete OAuth clients.
Owners and Admins can create an OAuth client with any scope and any [tag](/docs/features/tags) that is in the tailnet. Other users can create an OAuth client with only the scopes and tags for which they have permissions. For example, a Network admin cannot grant the `devices:core` scope, but an IT admin can.
## [Setting up an OAuth client](#setting-up-an-oauth-client)
1. Open the [Trust credentials](https://login.tailscale.com/admin/settings/trust-credentials) page of the admin console.
2. Select the **Credential** button.
3. Select **OAuth**.
4. Select the set of operations that can be performed with tokens created by the new OAuth client. For a given operation, select **Read** or **Write**. For a description of the operations, refer to [Scopes](/docs/reference/trust-credentials#scopes).
5. Select **Generate credential**.
6. In the **Credential created** page, you can access the new OAuth client's ID and secret. Copy both the client ID and secret, as you need them for your client code. Note that after you close the **Credential created** page, you won't be able to copy the secret again.
Store the client secret securely.
7. Select **Done**.
Your OAuth client is now configured. Use the client ID and secret when you configure your OAuth client application. Note that Tailscale-generated OAuth client secrets are case-sensitive.
If a user creates an OAuth client, the OAuth client will continue to function and generate API access tokens even if the user no longer has access to the tailnet. Admins can access all configured OAuth clients in the [Trust credentials](https://login.tailscale.com/admin/settings/trust-credentials) page of the admin console.
## [Tailscale OAuth token endpoint](#tailscale-oauth-token-endpoint)
The Tailscale OAuth token endpoint is `https://api.tailscale.com/api/v2/oauth/token`.
Make requests to the Tailscale OAuth token endpoint when you need an API access token. The Tailscale OAuth token endpoint accepts requests that conform to the OAuth 2.0 client credentials grant [request format](https://www.rfc-editor.org/rfc/rfc6749.html#section-4.4.2), and returns responses that conform to the OAuth 2.0 client credentials grant [response format](https://www.rfc-editor.org/rfc/rfc6749.html#section-4.4.3).
Requests to the OAuth token endpoint can include `scope` and `tags` request parameters, which specify space-delimited lists of requested scopes and [tags](/docs/features/tags), respectively. The OAuth client must have permission to grant the requested scopes and tags. For example, an OAuth client with the `all` scope (which grants all other scopes as well as all device tags) can request an access token with the `devices:core` scope and the `tag:server` tag.
Tags are only relevant for tokens with the `devices:core`, `auth\_keys`, or `all` scopes. The OAuth client ignores tags if none of these scopes are present. The `tags` parameter is not part of the OAuth 2.0 specification, and not all clients might support it.
## [OAuth client libraries](#oauth-client-libraries)
Popular programming languages provide OAuth client libraries for using OAuth clients. Here are several:
* Go: `clientcredentials` [Visit page →](https://pkg.go.dev/golang.org/x/oauth2/clientcredentials)
* Node: `OAuth2` [Visit page →](https://github.com/ciaranj/node-oauth#oauth20)
* PHP: `ClientCredentials.php` [Visit page →](https://github.com/thephpleague/oauth2-client/blob/master/src/Grant/ClientCredentials.php)
* Ruby: `client\_credentials.rb` [Visit page →](https://gitlab.com/oauth-xx/oauth2/blob/main/lib/oauth2/strategy/client_credentials.rb)
* Rust: `Client Credentials Grant` [Visit page →](https://docs.rs/oauth2/latest/oauth2/#client-credentials-grant)
For example, the following Go code shows how to create an OAuth client object that uses your client ID and client secret to generate an API access token for calls to the Tailscale API:
```
`package main
import (
"context"
"fmt"
"io/ioutil"
"log"
"os"
"golang.org/x/oauth2/clientcredentials"
)
func main() {
var oauthConfig = &clientcredentials.Config{
ClientID: os.Getenv("OAUTH\_CLIENT\_ID"),
ClientSecret: os.Getenv("OAUTH\_CLIENT\_SECRET"),
TokenURL: "https://api.tailscale.com/api/v2/oauth/token",
}
client := oauthConfig.Client(context.Background())
// Replace example.com with your tailnet ID.
resp, err := client.Get("https://api.tailscale.com/api/v2/tailnet/example.com/devices")
if err != nil {
log.Fatalf("error getting keys: %v", err)
}
body, err := ioutil.ReadAll(resp.Body)
if err != nil {
log.Fatalf("error reading response body: %v", err)
}
fmt.Printf("response: %s", string(body))
}
`
```
The example requires that you define environment variables `OAUTH\_CLIENT\_ID` and `OAUTH\_CLIENT\_SECRET`, with their values set to the **Client ID** and **Client secret** that you create when you [set up an OAuth client](#setting-up-an-oauth-client).
## [Verifying you can generate API access tokens](#verifying-you-can-generate-api-access-tokens)
After you [set up an OAuth client](#setting-up-an-oauth-client), you can confirm that you can generate API access tokens by making a `curl` request to the [Tailscale OAuth token endpoint](#tailscale-oauth-token-endpoint).
```
` curl -d "client\_id=${OAUTH\_CLIENT\_ID}" -d "client\_secret=${OAUTH\_CLIENT\_SECRET}" \\
"https://api.tailscale.com/api/v2/oauth/token"
`
```
The example requires that you define environment variables `OAUTH\_CLIENT\_ID` and `OAUTH\_CLIENT\_SECRET`, with their values set to your **Client ID** and **Client secret**.
Here's an example response showing the API access token:
```
`{"access\_token":"tskey-0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ","token\_type":"Bearer","expires\_in":3600,"scope":"devices"}
`
```
## [Generating long-lived auth keys](#generating-long-lived-auth-keys)
You cannot generate long-lived [auth keys](/docs/features/access-control/auth-keys), because they expire after 90 days, or, for one-off keys, as soon as you use them.
Instead of a long-lived auth key, you can generate an OAuth client with the `auth\_keys` scope. Use the OAuth client to generate new auth keys as needed, by making a `POST` request to the [`/api/v2/tailnet/:tailnet/keys`](/api#tag/devices/POST/device/{deviceId}/key) API method. When you create an OAuth client with the scope `auth\_keys`, you must select one or more [tags](/docs/features/tags), which can be any tag or set of tags in your tailnet. You must also specify these tags in the API call.
For example, to assign your device a specific tag, such as `tag:server`, create an OAuth client with `tag:server`. When you create the auth key, specify `tag:server` as the tag for the auth key.
Alternatively, if you need an OAuth client that supports more than one tag, set up [tag ownership](/docs/features/tags#ownership). For example, to tag some devices with `tag:server` and others with `tag:database`:
1. Set up a tag owner `tag:terraform-tag-owner` for both `tag:server` and `tag:database`:
```
`{
"tagOwners": {
"tag:terraform-tag-owner": ["\<your-email-address\>"],
"tag:server": ["tag:terraform-tag-owner"],
"tag:database": ["tag:terraform-tag-owner"],
},
}
`
```
2. Create an OAuth client with tag `tag:terraform-tag-owner`.
3. Create an auth key from that OAuth client, and specify either `tag:server` or `tag:database` as the tag for the auth key.
## [Shorthand notation for tailnet ID](#shorthand-notation-for-tailnet-id)
When you use an access token to make an API call, you can optionally use the value `-` as the [tailnet ID](/docs/concepts/tailnet-name#tailnet-id). You can find your tailnet ID in the [General](https://login.tailscale.com/admin/settings/general) page of the admin console. You do not need to specify the tailnet ID.
For example, this command:
```
`curl -u $ACCESS\_TOKEN: "https://api.tailscale.com/api/v2/tailnet/example.com/devices"
`
```
is equivalent to:
```
`curl -u $ACCESS\_TOKEN: "https://api.tailscale.com/api/v2/tailnet/-/devices"
`
```
as long as the access token is owned by the `example.com` tailnet.
You can also include the access token in the request header by using the `-H` option:
```
`curl -H "Authorization: Bearer $ACCESS\_TOKEN" "https://api.tailscale.com/api/v2/tailnet/-/devices"
`
```
## [Register new nodes using OAuth credentials](#register-new-nodes-using-oauth-credentials)
You can use an OAuth secret directly in [`tailscale up`](/docs/reference/tailscale-cli/up) to register a new node:
```
`tailscale up --auth-key=${OAUTH\_CLIENT\_SECRET} --advertise-tags=tag:ci
`
```
The OAuth client must have the `auth\_keys` scope. When you [create a client](#setting-up-an-oauth-client) with the `auth\_keys` scope, you assign one or more [tags](/docs/features/tags) for the scope. You must pass in one or more of those tags to the `--advertise-tags` flag.
The `--auth-key` flag can accept additional URL-style parameters when used with OAuth secrets:
```
`tailscale up --auth-key='${OAUTH\_CLIENT\_SECRET}?ephemeral=false&preauthorized=true' --advertise-tags=tag:ci
`
```
The available parameters are:
* `ephemeral`: register as an [ephemeral node](/docs/features/ephemeral-nodes) (defaults to `true`)
* `preauthorized`: skip manual [device approval](/docs/features/access-control/device-management/device-approval) (defaults to `false`)
* `baseURL`: base URL for the Tailscale API (defaults to `https://api.tailscale.com`)
## [get-authkey utility](#get-authkey-utility)
The `get-authkey` utility returns a new auth key to `stdout`, based on environment variables that contain values for your OAuth client ID and secret. Use `get-authkey` to generate auth keys for scripts or other automation.
All auth keys created from an OAuth client must use [tags](/docs/features/tags). You can optionally pass in arguments to `get-authkey` to specify whether the [key type](/docs/features/access-control/auth-keys#types-of-auth-keys) is ephemeral, reusable, and/or pre-authorized.
`get-authkey` requires Go 1.23 or later.
To build and run `get-authkey` directly:
1. Set the following environment variables:
* `TS\_API\_CLIENT\_ID`: The OAuth client ID for your tailnet.
* `TS\_API\_CLIENT\_SECRET`: The OAuth client secret for your tailnet.
```
`export TS\_API\_CLIENT\_ID=\<clientID\> TS\_API\_CLIENT\_SECRET=\<secret\>
`
```
* Run:
```
`go run tailscale.com/cmd/get-authkey@latest -tags tag:development
`
```
You can pass in the following parameters:
* `-tags`: Required. Apply the comma-separated list of tags to the auth key.
* `-reusable` (Optional): Allocate a reusable auth key. If not set, defaults to false.
* `-ephemeral` (Optional): Allocate an ephemeral auth key. If not set, defaults to false.
* `-preauth` (Optional): Allocate the auth key as pre-authorized. If not set, defaults to true.
For example:
```
`go run tailscale.com/cmd/get-authkey@latest -reusable -tags tag:development
`
```
As an alternative, you can download the `get-authkey` source code and run it from a local repository:
1. Clone the [`tailscale/tailscale`](https://github.com/tailscale/tailscale) repository.
2. Open a command prompt and change directories to the root of the local `tailscale/` folder.
3. Run `get-authkey`:
```
`go run ./cmd/get-authkey/main.go -tags tag:development
`
```
## [Scopes](#scopes)
Information about our scopes has moved to the [trust credentials](/docs/reference/trust-credentials#scopes) topic.
## [Legacy scopes](#legacy-scopes)
Information about our legacy scopes has moved to the [trust credentials](/docs/reference/trust-credentials#legacy-scopes) topic.
## [Limitations](#limitations)
* OAuth clients must be owned by the tailnet, and not by an individual user.
* An OAuth access token expires after 1 hour—this time cannot be modified.
On this page
* [How it works](#how-it-works)
* [Prerequisites](#prerequisites)
* [Setting up an OAuth client](#setting-up-an-oauth-client)
* [Tailscale OAuth token endpoint](#tailscale-oauth-token-endpoint)
* [OAuth client libraries](#oauth-client-libraries)
* [Verifying you can generate API access tokens](#verifying-you-can-generate-api-access-tokens)
* [Generating long-lived auth keys](#generating-long-lived-auth-keys)
* [Shorthand notation for tailnet ID](#shorthand-notation-for-tailnet-id)
* [Register new nodes using OAuth credentials](#register-new-nodes-using-oauth-credentials)
* [get-authkey utility](#get-authkey-utility)
* [Scopes](#scopes)
* [Legacy scopes](#legacy-scopes)
* [Limitations](#limitations)
Scroll to top