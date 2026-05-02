Tailscale API · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Tailscale API
Last validated: Jan 30, 2026
The Tailscale API is available for [all plans](/pricing).
Tailscale offers an application programming interface (API) to let you automate various aspects of your network.
[Visit our interactive API documentation →](/api)
## [Authentication](#authentication)
You need to be an [Owner, Admin, IT admin, or Network admin](/docs/reference/user-roles) of a tailnet to generate an access token.
Requests to the API are authenticated by using an access token (sometimes called an API key), which can be generated
from the [Keys](https://login.tailscale.com/admin/settings/keys) page of the admin console. You can choose the number of days, between 1 and 90 inclusive, for the key expiry. Also note that Tailscale-generated API access tokens are case-sensitive.
This access token will automatically expire after the chosen number of days. If you want to continue using an access token after this access token expires, you need to generate a new access tokens. Access tokens can also be
revoked before their expiration. Recently expired and revoked access token are shown on
the [Keys](https://login.tailscale.com/admin/settings/keys) page.
As an alternative to an access token that has full permission to the Tailscale API, use
[trust credentials](/docs/reference/trust-credentials) to provide delegated fine-grained control to the Tailscale API.
More details about authenticating with the API can be [found in our interactive API docs](/api).
On this page
* [Authentication](#authentication)
Scroll to top