Use Claude Code with Aperture · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Use Claude Code with Aperture
Last validated: Apr 9, 2026
Aperture by Tailscale is currently [in beta](/docs/reference/tailscale-release-stages#beta).
Configure [Claude Code](https://docs.anthropic.com/en/docs/claude-code) to send requests through [Aperture by Tailscale](/docs/aperture) so your organization gets centralized API key management, usage tracking, and session logging.
## [Prerequisites](#prerequisites)
Before you begin, you need:
* An Aperture instance with at least one configured AI provider (such as Anthropic), accessible from your device. Refer to [get started with Aperture](/docs/aperture/get-started) if you have not set this up.
* The Aperture host URL accessible from your device. Use `http://`, not `https://`.
* [Claude Code](https://docs.anthropic.com/en/docs/claude-code) installed on your device.
To avoid unexpected TLS issues, use `http://` for the Aperture URL when configuring LLM clients. All connections remain encrypted using WireGuard, even when HTTPS is not used.
Aperture routes requests based on the model name, not the LLM client. Any LLM client configured to use Aperture can access any provider your admin has set up. Refer to the [provider compatibility reference](/docs/aperture/provider-compatibility) for the full list of supported providers and API formats.
## [Configure Claude Code](#configure-claude-code)
To configure Claude Code to use Aperture, create or edit the global Claude Code settings file (`\~/.claude/settings.json`) to use the Aperture URL as the `ANTHROPIC\_BASE\_URL`. The following example includes some additional recommended settings:
```
`{
"apiKeyHelper": "echo '-'",
"env": {
"ANTHROPIC\_BASE\_URL": "http://\<aperture-hostname\>"
}
}
`
```
The `apiKeyHelper` setting returns a placeholder value because Aperture injects credentials automatically. You do not need to configure an API key on the client.
You can also configure Claude Code using environment variables instead of a settings file. Set the following environment variables:
```
`export ANTHROPIC\_BASE\_URL="http://\<aperture-hostname\>"
`
```
Claude Code v1.x requires additional configuration because the `apiKeyHelper` setting does not exist in earlier versions. You must provide a placeholder authentication token and explicitly specify the model.
```
`{
"model": "claude-sonnet-4-5",
"env": {
"ANTHROPIC\_AUTH\_TOKEN": "bearer-managed",
"ANTHROPIC\_BASE\_URL": "http://\<aperture-hostname\>"
}
}
`
```
### [Claude Code with Amazon Bedrock](#claude-code-with-amazon-bedrock)
If your Aperture instance routes through Amazon Bedrock, add the following to your `settings.json` instead of the default configuration:
```
`{
"env": {
"ANTHROPIC\_MODEL": "claude-sonnet-4-5",
"ANTHROPIC\_BEDROCK\_BASE\_URL": "http://\<aperture-hostname\>/bedrock",
"CLAUDE\_CODE\_USE\_BEDROCK": "1",
"CLAUDE\_CODE\_SKIP\_BEDROCK\_AUTH": "1"
}
}
`
```
If you use Claude Code in VS Code with Bedrock, also add `"claudeCode.disableLoginPrompt": true` to your VS Code user settings JSON (open the **Command Palette** and select **Preferences: Open User Settings (JSON)**).
### [Claude Code with Vertex AI](#claude-code-with-vertex-ai)
If your Aperture instance routes through Vertex AI, add the following to your `settings.json` instead of the default configuration. Replace `\<project-id\>` with your Google Cloud project ID.
```
`{
"env": {
"CLOUD\_ML\_REGION": "global",
"ANTHROPIC\_VERTEX\_PROJECT\_ID": "\<project-id\>",
"CLAUDE\_CODE\_USE\_VERTEX": "1",
"CLAUDE\_CODE\_SKIP\_VERTEX\_AUTH": "1",
"ANTHROPIC\_VERTEX\_BASE\_URL": "http://\<aperture-hostname\>"
}
}
`
```
If you use Claude Code in VS Code with Vertex, also add `"claudeCode.disableLoginPrompt": true` to your VS Code user settings JSON (open the **Command Palette** and select **Preferences: Open User Settings (JSON)**).
## [Verify the connection](#verify-the-connection)
1. Send a test message in Claude Code.
2. Open the Aperture dashboard at `http://\<aperture-hostname\>/ui/` and confirm the request appears on the **Logs** page.
If the request does not appear, refer to the [Aperture troubleshooting guide](/docs/aperture/troubleshooting).
## [Next steps](#next-steps)
* [Grant model access to users](/docs/aperture/how-to/grant-model-access): Control which models each user or group can access through Aperture.
* [View your usage dashboards](/docs/aperture/reference/dashboard): Monitor token consumption, costs, and session activity across your organization.
* [Set per-user spending limits](/docs/aperture/how-to/set-per-user-spending-limits): Configure quota buckets to control costs for individual users.
On this page
* [Prerequisites](#prerequisites)
* [Configure Claude Code](#configure-claude-code)
* [Claude Code with Amazon Bedrock](#claude-code-with-amazon-bedrock)
* [Claude Code with Vertex AI](#claude-code-with-vertex-ai)
* [Verify the connection](#verify-the-connection)
Scroll to top