Aperture: The fastest path to safer, easier AI deployment
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|productFebruary 17, 2026
# Aperture: Stop choosing between safe AI and fast AI
“Building a gateway is the obvious choice” is something a tech founder said offhand to me last summer. We were talking about the proliferation of MCP servers, people playing fast-and-loose with AI network security, identity management, and the like. They were right, but I didn’t think the world needed Yet Another Gateway. Instead, my team and I spent our time encouraging others to build on top of Tailscale, because you get connectivity, security, and identity out of the box.
But despite so many gateway products coming to market, I continued to hear the same thing from CISOs and CTOs: Bells and whistles are nice, but managing API keys is still a huge pain. Keys get traded, stolen, accidentally checked into repositories or shared. Security teams can’t see who is using which AI products, and how much, but they also can’t simply revoke keys without breaking things. It’s a tough spot to be in.
So back in November we decided to [showcase](https://tailscale.com/blog/aperture-private-alpha) one way to fix this acute problem by building a gateway that runs inside of your tailnet: [Aperture](https://aperture.tailscale.com). It uses [tsnet](https://tailscale.com/docs/features/tsnet) so that it appears as a node on your Tailscale network (tailnet). Aperture implicitly knows the identity of whatever is connecting to it, so you can stuff all your API keys inside and tell everyone to point their coding agents at Aperture to get access to LLMs. Every API call can be logged with an identity attached. This increases security, visibility, *and *ease-of-use: win-win-win.
“Aperture takes the friction out of our GenAI workflows, eliminating API key management, centralizing access to model providers including Bedrock, and giving us clear, granular visibility into usage and spend,” said Louis Gardner, director of security, infrastructure and IT at Corelight, an early Aperture user and partner.
We’re using Aperture at Tailscale and it’s already improving workflows. For instance, one product leader has been able to more rapidly craft and implement LLM-powered internal tools. They don’t need to request API keys, and configuring their coding agent is just a two-line config change. It’s been, in their words, a “huge unlock.”
Our goal is to make it so easy and secure to use AI that teams will never again have to choose between moving fast and staying safe. Our early customers love Aperture and are pushing us to expand its coverage and capabilities.
## [Customer-led upgrades](#customer-led-upgrades)
We’ve had so much fun building and dogfooding Aperture that we couldn’t wait to get it into users’ hands. In early January we started inviting some customers to share in the fun. Later that month, we [quietly launched a waitlist](https://tailscale.com/blog/aperture-private-alpha). These early adopters have pushed us in three broad directions:
### [More providers: Bedrock and Vertex Support](#more-providers-bedrock-and-vertex-support)
I’m happy to announce that we’ve recently added support for AWS Bedrock and Google Vertex. These enterprise-grade providers are heavily used by a lot of Tailscale’s larger customers and, unsurprisingly, can be tricky to set up and deploy. Aperture lets us encapsulate a lot of that complexity, drastically simplifying the authentication process (honestly, I was shocked).
Aperture already supports: all major LLM providers natively; LLM inference providers compliant with [OpenAI’s v1 API](https://platform.openai.com/docs/api-reference/introduction); self-hosted LLMs; and most major cloud AI endpoints. We’ll continue to add more providers, while ensuring Aperture manages the complexity and presents a simple, clean interface to its users.
### [More Integrations: real-time analysis with partners](#more-integrations-real-time-analysis-with-partners)
An S3 integration was one of the first feature requests that we built. After all, coding agents can generate a lot of logs, and security teams want to analyze these for things like PII, keys, and other credentials being improperly shared. There are a wealth of tools and services for this, beginning with post hoc log analysis and continuing into what CISOs have been asking for: real-time analysis and dynamic access policy management.
Aperture is the natural integration point for many of these services, and so we’re actively building APIs and integrations with companies like [Cribl](https://cribl.io/), [Oso](https://www.osohq.com/), [Apollo Research](https://www.apolloresearch.ai/), and [Cerbos](https://www.cerbos.dev/). When used in conjunction with Tailscale, these tools create opportunities for feedback loops for dynamic network security and access control, which will become increasingly critical for security as AI proliferates.
Clint Sharp, CEO of Cribl, told us how Aperture’s easier access and tracking fits into Cribl’s data engine model. At Cribl, Sharp said, “We get detailed audit logs out of the box, route them through Cribl Stream, and land them wherever they’re most useful, including Cribl Stream. That means our security team gets real observability and control over AI usage without slowing developers down.”
[Oso](https://www.osohq.com/) was one of the first partners to integrate with Aperture, giving engineers the freedom to go ham on the latest coding agents without giving their CISO a heart attack. “Oso protects your prompts, your agents, and your data,” says Graham Neray, co-founder and CEO of Oso. “You can start with visibility, risk scoring, and alerting—like, where did that local MCP server come from? Then you can progressively layer on deterministic controls, and move toward automated least privilege.”
AI safety firm Apollo Research incorporates Aperture data into its [Watcher](https://www.apolloresearch.ai/product/introducing-watcher-for-ai-oversight/) tool, scanning coding agent logs to provide both high-level overviews for CISOs/CTOs and real-time data for developers. “For everyone using coding agents, it should be easy and effortless to know exactly what the agent is doing and when it fails,” said Marius Hobbhahn, CEO and co-founder of Apollo Research. “The combination of Aperture and Watcher allows that perfectly.”
Cerbos, an enterprise authorization management platform, evaluates tool calls intercepted by Aperture. By [combining identity and capabilities from Aperture](https://cerbos.dev/tailscale-aperture) with real-time contextual signals, Cerbos rapidly decides if the call should execute. Cerbos doesn't just log what happened; it decides what's permitted. "Visibility into agent activity is necessary but insufficient on its own. Alerts only fire after a tool call has already been made," said Emre Baran, CEO at Cerbos. "Cerbos evaluates every request before execution and returns a binding decision that is deterministic, auditable, and traceable to a specific policy."
Expect to see us doing a lot more work to enable even more such partners and integrations.
## [More visibility and control: know where your tokens are going](#more-visibility-and-control-know-where-your-tokens-are-going)
Configuring Tailscale access policies became so much nicer when we launched a visual editor, so it was an easy decision to do the same with Aperture. In addition to simply looking nicer, you now have the ability to configure access to models on a per-user and per-role basis.
We’ve also added more visualizations to help you understand at a glance how your team is consuming tokens (e.g. by user, user agent, or model). There are a lot of insights to be gained here, creating opportunities for things like dynamic cost optimization and other features we’ll explore in the near future.
It's been thrilling to build a product with so much traction, that solves so many real AI challenges so quickly, on top of Tailscale. Even though it's early days, Aperture is already a critical part of our internal infrastructure and is quickly becoming essential for our earliest users. There's a lot more coming around cost controls, deeper partner integrations, and giving security teams the real-time control over AI usage that they've lacked.
Aperture makes deploying AI safer, easier, faster, and can save money while doing so. If you’re a security, platform, or engineering team working with coding agents, [sign up](https://aperture.tailscale.com/) and we'll happily get you started. And if you're already using Aperture, we'd love to hear what you want to see next.
Share
Author
David Carney
Contributors
Remy Guercio
Avery Pennarun
Benson Wong
Luke Kosewski
Larah Vasquez
Author
David Carney
Contributors
Remy Guercio
Avery Pennarun
Benson Wong
Luke Kosewski
Larah Vasquez
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