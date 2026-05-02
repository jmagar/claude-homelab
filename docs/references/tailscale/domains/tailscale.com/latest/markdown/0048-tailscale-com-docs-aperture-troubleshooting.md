Troubleshooting Aperture by Tailscale · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Troubleshooting Aperture by Tailscale
Last validated: Apr 9, 2026
Use the following sections to diagnose and resolve common issues with [Aperture by Tailscale](/docs/aperture).
|Symptom|Likely cause|
|[Cannot connect using hostname](#cannot-connect-to-aperture-using-hostname)|MagicDNS disabled, wrong URL|
|[HTTP 403 error](#http-403-access-denied-error)|Missing grant|
|[Instance becomes unreachable](#aperture-instance-becomes-unreachable)|Key expiry|
|[HTTP 429 errors](#http-429-rate-limit-errors)|Quota misconfiguration|
|[Mullvad exit nodes](#intermittent-failures-with-mullvad-exit-nodes)|Mullvad IP collision|
|[All sessions from same user](#all-sessions-appear-to-come-from-the-same-user)|Tag-based identity|
|[HTTPS connection issues](#https-connection-issues)|Use `http://`|
|[Client connection issues](#client-connection-issues)|Wrong base URL or missing auth|
## [Client connection issues](#client-connection-issues)
If a client tool does not connect to Aperture or requests do not appear in the Aperture logs:
* Confirm the base URL in your client configuration matches your Aperture hostname. For most tools, the URL is `http://\<aperture-hostname\>` or `http://\<aperture-hostname\>/v1`.
* Confirm your client has a valid authentication entry. Most tools require a placeholder API key (such as `-`) even though Aperture injects the real credentials.
* Verify your device can reach Aperture by opening `http://\<aperture-hostname\>/ui/` in a browser.
* If you [connect through ts-unplug](/docs/aperture/connect-outside-tailnet), confirm ts-unplug is running and use `http://localhost:\<port-number\>` instead of `http://\<aperture-hostname\>`.
For tool-specific configuration, refer to the [Set up LLM clients](/docs/aperture/use-your-tools) guides, or refer to individual guides for [Claude Code](/docs/aperture/how-to/use-claude-code), [Codex](/docs/aperture/how-to/use-codex), or [OpenAI-compatible tools](/docs/aperture/how-to/use-openai-compatible-tools). If you use the [CLI launcher](/docs/aperture/cli-launcher), it handles base URLs and authentication automatically.
## [All sessions appear to come from the same user](#all-sessions-appear-to-come-from-the-same-user)
If you use tag-based identities to authenticate user devices, all LLM sessions from those devices appear to come from the same user. This happens because Tailscale tags do not provide per-user identity. The intended use of tags is service account or server device authentication, not individual user authentication. For example, you might use a tag identity for a fleet of PostgreSQL database servers. Refer to the [tags documentation](/docs/features/tags) for more information.
To resolve this issue, ensure that users connect to Aperture from devices associated with their individual Tailscale accounts. For details on how Aperture resolves identity for tagged nodes, refer to the [tagged device identity documentation](/docs/aperture/how-aperture-works#tagged-node-identity).
## [HTTPS connection issues](#https-connection-issues)
If you encounter HTTPS connection issues when accessing the [Aperture dashboard](/docs/aperture/reference/dashboard) or using LLM clients, verify that you're using `http://` and not `https://` for the Aperture URL. For example, use `http://\<aperture-hostname\>/ui/`. For more information on configuring Aperture, refer to the [Aperture configuration reference](/docs/aperture/configuration).
If the hostname does not resolve at all, the problem might be that MagicDNS is disabled rather than an HTTPS issue. Refer to [cannot connect to Aperture using hostname](#cannot-connect-to-aperture-using-hostname).
## [Cannot connect to Aperture using hostname](#cannot-connect-to-aperture-using-hostname)
If you cannot connect to Aperture using its short hostname (for example, `http://\<aperture-hostname\>`), [MagicDNS](/docs/features/magicdns) might be disabled in your tailnet. Aperture relies on MagicDNS to resolve its hostname. When MagicDNS is off, the hostname does not resolve, and connection attempts fail.
Do not use `tailscale ping` to diagnose this issue. `tailscale ping` succeeds even when MagicDNS is disabled because it routes traffic through DERP relay using the Tailscale IP address directly. Instead, run `tailscale dns status` to verify that MagicDNS is active, or check the [DNS](https://login.tailscale.com/admin/dns) settings page of the Tailscale admin console. You can also run `nslookup \<hostname\>.\<tailnet\>.ts.net` to test resolution directly. Replace `\<hostname\>` with your Aperture hostname (`ai` is the default, but it might be a custom name). If the generated client configurations show a placeholder URL such as `http://your-aperture-host`, MagicDNS is likely not enabled.
To resolve this issue, enable MagicDNS in the Tailscale admin console under [DNS](https://login.tailscale.com/admin/dns) settings. Refer to the [MagicDNS documentation](/docs/features/magicdns) for setup instructions. Alternatively, bypass hostname resolution by using the Tailscale IP address directly (for example, `http://\<tailscale-ip\>/` instead of `http://\<aperture-hostname\>/`). You can find the IP address of the admin console under [Machines](https://login.tailscale.com/admin/machines).
## [HTTP 403 access denied error](#http-403-access-denied-error)
If you receive an HTTP 403 error with the message `access denied: no role granted`, the issue is a missing or misconfigured grant. Aperture uses two independent layers of access control, and both must be configured correctly:
1. **tailnet access control rule**: A rule in the tailnet policy file that permits network connections to the Aperture device. Without this rule, the connection fails before reaching Aperture.
2. **Aperture grant**: A grant in the [Aperture configuration](/docs/aperture/configuration) that assigns a user or group access to specific models and a role. Without a matching grant, Aperture returns a 403 error.
The most common causes are a missing access control rule in the tailnet policy file, a missing grant in the Aperture configuration, or an incorrect `src` pattern. For step-by-step instructions on configuring Aperture grants, refer to [Control model access](/docs/aperture/how-to/grant-model-access) and [Set up admin access](/docs/aperture/how-to/set-up-admin-access). The `src` field requires an exact match. For tagged devices, the `src` value must match the exact comma-joined tag string that Aperture generates. Refer to the [tagged device identity documentation](/docs/aperture/how-aperture-works#tagged-node-identity) for details on how Aperture matches tagged devices.
To help diagnose this issue, use the [Preview rules](https://login.tailscale.com/admin/acls/preview) in the Tailscale admin console to check that the user's device can reach the Aperture instance. Then check that the Aperture configuration includes a grant with a `src` pattern matching the connecting user or tag. If the 403 errors are intermittent and correlate with VPN use, refer to [intermittent failures with Mullvad exit nodes](#intermittent-failures-with-mullvad-exit-nodes) for a related cause.
## [Aperture instance becomes unreachable](#aperture-instance-becomes-unreachable)
If an Aperture instance that was previously working becomes unreachable, the most likely cause is node key expiry. When the key expires, the instance repeatedly restarts and waits for reauthorization that never completes, remaining in a `NeedsLogin` state. The same behavior occurs if you accidentally delete the device from the Tailscale admin console. Check the admin console to determine whether the device is listed as expired or missing.
Aperture displays a warning banner of the admin console when a node key is within 7 days of expiring. This banner is visible only to admin users.
There is no way to recover an expired instance. You must deploy a new Aperture instance and reconfigure your clients. To prevent this, disable key expiry for the Aperture device from the admin console, or deploy Aperture as a [tagged device](/docs/features/tags). Refer to the [key expiry documentation](/docs/features/access-control/key-expiry) for more information.
## [HTTP 429 rate limit errors](#http-429-rate-limit-errors)
If you receive an HTTP 429 rate limit error when you expect to have access, the issue is likely a misconfigured quota in the Aperture configuration. Aperture's quota system fails closed: if the quota configuration cannot be parsed, Aperture rejects all requests matching that quota with a 429 error. Common causes include a typo in the quota bucket name, an invalid quota value, or a quota limit set to zero.
Check the Aperture configuration for quota fields and verify that bucket names are spelled correctly and that values are valid. Refer to the [quota configuration documentation](/docs/aperture/configuration#quotas) for the expected syntax. To resolve the issue, correct the quota value in the configuration. If you do not need custom quotas, remove the quota field entirely to use the default settings. For step-by-step instructions on checking and refilling budgets, refer to [Check and refill budgets](/docs/aperture/how-to/check-and-refill-budgets).
## [Intermittent failures with Mullvad exit nodes](#intermittent-failures-with-mullvad-exit-nodes)
If you experience intermittent 403 errors or connection failures when accessing Aperture while a Mullvad exit node is active, this is due to an IP address range collision. Tailscale assigns device addresses from the CGNAT range `100.64.0.0/10`, and Mullvad also uses addresses in this range. When a Mullvad exit node is active, traffic destined for Tailscale addresses can be misrouted through Mullvad, causing grant evaluation failures that are indistinguishable from [grant permission issues](#http-403-access-denied-error).
To confirm this is the cause, disconnect from the Mullvad exit node and retry the connection. If the errors stop, use [Tailscale exit nodes](/docs/features/exit-nodes) instead, or exclude the Tailscale interface from Mullvad's routing configuration if your Mullvad client supports split tunneling.
On this page
* [Client connection issues](#client-connection-issues)
* [All sessions appear to come from the same user](#all-sessions-appear-to-come-from-the-same-user)
* [HTTPS connection issues](#https-connection-issues)
* [Cannot connect to Aperture using hostname](#cannot-connect-to-aperture-using-hostname)
* [HTTP 403 access denied error](#http-403-access-denied-error)
* [Aperture instance becomes unreachable](#aperture-instance-becomes-unreachable)
* [HTTP 429 rate limit errors](#http-429-rate-limit-errors)
* [Intermittent failures with Mullvad exit nodes](#intermittent-failures-with-mullvad-exit-nodes)
Scroll to top