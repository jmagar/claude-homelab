Aperture by Tailscale is now self-serve: Centralized AI access, usage, and spend
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|productMarch 23, 2026
# Aperture by Tailscale: More secure AI now available via self-serve
AI adoption is moving faster than security teams can keep up. Developers are connecting models into agents, internal tools, CI pipelines, and automation workflows—often by passing around LLM provider API keys.
Most of these integrations start the same way: generate an API key and add it to an environment variable. That works well enough at first.
But that key doesn’t stay in one place. It gets copied into a local .env file for testing. Then into a CI pipeline. Then into a container. Then into an agent runtime so it can call a model or tool on its own. Each step feels small and reasonable. No one stops to rethink it because nothing is obviously broken.
Until it is.
## [Key sprawl as unwanted architecture ](#key-sprawl-as-unwanted-architecture)
We’re starting to see what happens when those small decisions compound. AI keys keep getting [dropped into public repositories](https://www.wiz.io/blog/leaking-ai-secrets-in-public-code), whether belonging to Fortune 100 companies, [AI startups](https://www.wiz.io/blog/forbes-ai-50-leaking-secrets), or [one poor student messing with Gemini](https://eu.36kr.com/en/p/3486014581496960).
More automation is not necessarily a fix. In early lab testing, researchers are raising concerns about AI agents behaving unpredictably while operating with real credentials, taking actions that teams didn’t explicitly authorize.
These spreading credentials aren’t just assets, they’re infrastructure. Tracking, rotating, and auditing them becomes a massive headache. They also expand your attack surface in ways that don’t show up until something goes wrong.
**This is the problem Aperture was built to solve.**
Earlier this year [we introduced Aperture](https://tailscale.com/docs/features/aperture), an AI gateway that provides visibility into coding agent usage across your entire organization. Instead of distributing API keys across machines and services, Aperture centralizes those credentials and routes requests through a single point of control. Clients send requests to the gateway using Tailscale identity, and Aperture handles authentication to the model provider on their behalf.
If you want the full background, you can read the original announcement [here](https://tailscale.com/blog/aperture-partners-update).
## [Get started with Aperture, no waitlist needed](#get-started-with-aperture-no-waitlist-needed)
Today we are taking the next step. Aperture by Tailscale is now available in alpha via self-serve! No more waitlist or waiting around on approvals. You can get started on your own, spin it up in minutes, and begin tracking usage with far less painful deployments right away.
Let’s take a look under the hood:
### [**A safer architecture for AI access**](#a-safer-architecture-for-ai-access)
In most AI deployments, applications authenticate directly to model providers using API keys. A developer or agent makes a request, includes an API key, and sends it to the provider. That model requires credentials to live wherever requests originate, with all the problems that entails.
With Aperture, requests flow differently.
Instead of embedding API keys across machines and services, the credential stays inside the gateway. Requests arrive authenticated through Tailscale identity, and Aperture forwards them with the correct single key.
This changes where credentials live and how access is tracked. API keys remain centralized, and usage can be tied to the identities that generated the request.
### [**The lifecycle of AI system development**](#the-lifecycle-of-ai-system-development)
AI systems are rarely just one application calling one model. They often include developers experimenting locally, CI jobs generating code, agents invoking tools, and internal services interacting with models.
Over time, this makes it harder to understand how AI is actually being used. Spread across providers, models, and tools, It becomes difficult to answer basic questions like which teams are relying on AI and how much, which workflows are driving value, and where model usage is concentrated.
Centralizing credentials changes that.
A single control point makes it possible to see and understand AI usage across the organization. You can identify usage and costs, see tool calls and model usage, and gauge where AI is having real impact.
Aperture also upgrades the AI experience for developers and platform teams. Developers can experiment and build without needing to manage or store sensitive credentials on their machines. Platform and security teams gain a clearer view into how AI systems are being used, with a central place to observe access, apply guardrails, and audit activity across users, services and agents.
Aperture shifts API keys out of application environments and into a gateway designed to manage them, while tying every request to identity.
[Start using Aperture](http://aperture.tailscale.com) to centralize and control how AI is used across your organization. Aperture can be purchased for use separately from paid Tailscale plans.
We recorded a webinar on Aperture last week with partners from Cribl, Oso, and AWS/Amazon Bedrock, joining our CEO Avery Pennarun and YouTube host Alex Kretzschmar. It covers how Aperture works, how customers can use it to connect AI frontends and backends, contain key sprawl and monitor usage, and extend security into their AI usage. You can now [watch it on demand](https://tailscale.com/events-webinars/frictionless-agentic-ai-at-scale) to learn more.
*Please keep in mind that this is an early alpha release of an experimental product. It’s still a work in progress, so pieces may be incomplete, features may change, and you may experience bugs. We’re sharing it to learn and gather feedback, so before using it in production, please reach out to us at [aperture@tailscale.com](mailto:aperture@tailscale.com).*
Share
Author
Alyssa Miles
Author
Alyssa Miles
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