What is Aperture? · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# What is Aperture?
Last validated: Apr 22, 2026
Aperture by Tailscale is currently [in beta](/docs/reference/tailscale-release-stages#beta).
As organizations adopt AI across development, automation, and internal tools, they face new challenges around security, visibility, and control. API keys are often scattered across developer devices, CI/CD (continuous integration/continuous delivery) systems, and automated agents, increasing the risk of leaks and making credentials difficult to rotate or audit. Teams lack clear insight into who is using which models, how frequently, and at what cost. This makes it difficult for security, platform, and compliance teams to support AI usage at scale without slowing developers down.
Aperture by Tailscale addresses these challenges with a centralized AI gateway that secures, monitors, and routes LLM requests across your organization. Aperture uses [Tailscale's identity layer](/docs/concepts/tailscale-identity) to automatically authenticate users, eliminating the need to distribute API keys. It injects provider credentials for users and automated agents and routes requests to upstream LLM providers such as OpenAI, Anthropic, and Google, without requiring changes to existing tools or workflows.
## [Use cases](#use-cases)
Aperture addresses common challenges organizations face when adopting LLM clients.
* **Centralized API key management**
Distributing API keys to developers creates security risks and an administrative burden. Keys get committed to repositories, shared insecurely, or forgotten when employees leave.
Aperture centralizes API keys in the [server configuration](/docs/aperture/configuration). Clients connect through the proxy without needing provider credentials. User identity comes from Tailscale's identity layer, which automatically identifies users based on their device.
* **Visibility into LLM usage**
Gain visibility into how engineering teams adopt LLM-powered tools. Aperture lets you answer questions such as:
* How many tokens did we use last month?
* Which models are teams using?
* What does the breakdown of our LLM spend look like?
Aperture captures every request with user attribution, model identification, and token counts. The [Aperture dashboard](/docs/aperture/reference/dashboard) aggregates this data by user, model, and time period.
* **Cost tracking**
LLM API costs scale with token usage, but tracking consumption across tools and providers requires aggregating data from each source individually. Developers might not realize how much their workflows cost, and finance teams lack the data to forecast budgets.
Aperture extracts token usage from every response, including input, output, cached, and reasoning tokens. This data feeds into dashboards and [exports](/docs/aperture/how-to/export-usage-data-to-s3) for cost analysis. You can also [set budgets and per-user spending limits](/docs/aperture/manage-spending) to prevent cost overruns.
* **Adoption analytics**
Gather adoption insights and answer questions such as:
* Which teams are using the tools? How frequently?
* Are there users who tried a tool one time and stopped?
The [**Adoption** page](/docs/aperture/reference/dashboard) of the Aperture dashboard shows organization-wide usage patterns, active users over time, and histograms of usage distribution.
* **Compliance and audit trails**
Regulated industries require audit trails for AI interactions. When LLM requests flow directly from client to provider, organizations have no record of what was sent or received.
Aperture stores full request and response bodies for review in the dashboard. The capture system preserves headers, payloads, and tool use data. The dashboard is not designed for long-term retention; configure a [retention policy](/docs/aperture/configuration#database) to control how long Aperture keeps capture data, and [export logs and events](/docs/aperture/how-to/export-usage-data-to-s3) to your SIEM for durable storage, monitoring, and compliance workflows.
* **LLM session debugging**
Debug LLM interactions by reviewing full request and response data. The **Logs** page of the Aperture dashboard groups related requests into sessions, letting you trace the flow of a conversation or coding task.
## [Requirements](#requirements)
Before setting up Aperture, confirm you have the following:
* **API keys from LLM provider developer platforms.** Aperture supports OpenAI, Anthropic, Google Gemini, OpenRouter, Amazon Bedrock, Vertex AI, and OpenAI-compatible APIs. Refer to [Set up LLM providers](/docs/aperture/set-up-providers) for provider-specific instructions.
Aperture requires API keys from provider developer platforms. Consumer and business subscription plans (such as Claude Pro, ChatGPT Plus, or Gemini Advanced) do not provide API keys and are not compatible with Aperture.
* **A Tailscale account.** Aperture runs on a [tailnet](/docs/concepts/tailnet). When you [sign up for Aperture](https://aperture.tailscale.com), the process creates a free Tailscale account if you don't have one.
* **Network connectivity to the Aperture instance.** Devices on the same tailnet connect directly. Devices outside the tailnet can connect using [ts-unplug](/docs/aperture/connect-outside-tailnet).
## [Limitations](#limitations)
Consider the following limitations before deployment. Tailscale is actively developing Aperture, so this list updates frequently.
* **Tailscale requirement**
The Aperture server runs on a Tailscale network. Clients can connect from inside the tailnet or from outside it using [ts-unplug](https://github.com/tailscale/ts-plug). Both paths provide Tailscale-based identity. Direct public internet access is not supported.
* **Provider support**
Metrics extraction relies on parsing provider response formats. Aperture handles OpenAI, Anthropic, Gemini, and OpenAI-compatible APIs. Refer to the [provider compatibility reference](/docs/aperture/provider-compatibility) for details. New providers or format changes might require updates.
* **No request modification**
Aperture captures and forwards requests without modification (except authentication headers). Aperture does not yet support request filtering or prompt injection detection.
* **Reducing quota capacity caps existing balances**
Aperture persists quota bucket balances. When you reduce a bucket's capacity, Aperture caps the existing balance at the new value; the excess is not recoverable. Aperture removes buckets whose quota definitions you delete from the configuration. For details, refer to [Bucket lifecycle](/docs/aperture/configuration#bucket-lifecycle).
* **Subscription plans not supported**
Aperture authenticates with LLM providers using API keys from provider developer platforms. Consumer and business subscription plans (such as [Claude Pro or Claude Max](https://www.anthropic.com/pricing), [ChatGPT Plus, Pro, or Team](https://openai.com/chatgpt/pricing), or [Gemini Advanced](https://gemini.google.com)) are separate from provider API access and do not provide API keys compatible with Aperture.
## [FAQ](#faq)
**What happens if a user tries to connect from outside the tailnet?**
Users outside the tailnet can [connect through ts-unplug](/docs/aperture/connect-outside-tailnet), which creates a lightweight tailnet node and proxies local traffic to Aperture. Without ts-unplug, the connection fails at the network level because Aperture listens on Tailscale interfaces.
**What happens when I add a new LLM provider to the configuration?**
Clients can immediately use models from that provider by specifying the model name in their requests. No client changes are required because the proxy routes based on model name.
**What happens if a streaming response is interrupted mid-stream?**
The proxy captures whatever data arrived before the interruption. Metrics extraction might fail or report partial data, but the proxy stores the partial capture for debugging.
**Do clients need API keys to use Aperture?**
No. Aperture identifies users through Tailscale and injects provider API keys automatically. Clients connect without credentials.
**Can I use my Claude Max, ChatGPT Plus, or other subscription plan with Aperture?**
No. Aperture requires API keys from provider developer platforms. Consumer and business subscription plans (such as [Claude Pro or Claude Max](https://www.anthropic.com/pricing), [ChatGPT Plus, Pro, or Team](https://openai.com/chatgpt/pricing), or [Gemini Advanced](https://gemini.google.com)) are separate from provider API access and do not provide API keys compatible with Aperture. Obtain API keys from the provider's developer platform (for example, the [Anthropic Console](https://console.anthropic.com), [OpenAI Platform](https://platform.openai.com), or [Google AI Studio](https://aistudio.google.com)).
**Can I use Aperture with providers not listed in the documentation?**
Yes, if the provider uses an OpenAI-compatible API format. Configure it as a provider with `openai\_chat: true` compatibility and the appropriate authorization type.
**Can I use Aperture with self-hosted LLMs?**
Yes, you can proxy self-hosted LLMs with Aperture without exposing the endpoints to the public internet.
**Can I use Aperture in CI/CD environments, such as GitHub Actions?**
Yes, as long as you can run Tailscale. Aperture works in common containerized environments such as GitHub Actions without needing to expose either the agent or the gateway to the public internet.
**Can I use Aperture with several tailnets?**
Yes, you can [connect to Aperture from another tailnet](/docs/aperture/connect-outside-tailnet) using [ts-unplug](https://github.com/tailscale/ts-plug). You can also use ts-unplug to connect from environments that aren't on a tailnet at all.
## [Learn more](#learn-more)
* [How Aperture works](/docs/aperture/how-aperture-works): identity and authentication, request routing by model, telemetry capture, and session tracking.
* [Get started with Aperture](/docs/aperture/get-started): sign up, configure providers, and connect your first LLM client.
On this page
* [Use cases](#use-cases)
* [Requirements](#requirements)
* [Limitations](#limitations)
* [FAQ](#faq)
* [Learn more](#learn-more)
Scroll to top