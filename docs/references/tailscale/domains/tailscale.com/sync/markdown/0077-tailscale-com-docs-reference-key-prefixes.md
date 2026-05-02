Key prefixes · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Key prefixes
Last validated: Aug 1, 2025
Tailscale uses prefixes as part of the ID for keys. The prefix starts with `tskey-` and is followed by the key type. For example, when you create a Tailscale API access token, the prefix is `tskey-api`, resulting in a key ID in the form of:
`tskay-api-abcDEF1CNTRL-091234567890ABCDEF`
The type of key prefixes are:
|Key prefix|Description|
|`tskey-api`|The key is a [Tailscale API](/docs/reference/tailscale-api) access token.|
|`tskey-auth`|The key is a [pre-authentication key](/docs/features/access-control/auth-keys).|
|`tskey-client`|The key is a Tailscale [OAuth client](/docs/features/oauth-clients) key.|
|`tskey-scim`|The key is a [System for Cross-domain Identity Management](/learn/what-is-scim) (SCIM) key.|
|`tskey-webhook`|The key is a [webhook](/docs/features/webhooks) key.|
Note that all Tailscale-generated keys and secrets are case-sensitive. For more information about keys and secrets in general, refer to [Key and secret management](/docs/reference/key-secret-management).
Scroll to top