Why it's so easy to find open, exposed AI servers on the web
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|insightsSeptember 03, 2025
# Finding 1,000 exposed AI servers took researchers 10 minutes
You can do clever things with a locally hosted AI server, like [Ollama](https://ollama.com/). Especially if you found it on someone else’s computer, open to the public internet, and vulnerable to attacks and infiltration.
Security researchers at Cisco’s Talos team used an (appropriately named) scanning tool, Shodan, to find unsecured LLM servers across the web. They found just over 1,100 exposed Ollama endpoints, the bulk of them within 10 minutes. About 20% of them are “actively hosting models susceptible to unauthorized access,” [according to Cisco](https://blogs.cisco.com/security/detecting-exposed-llm-servers-shodan-case-study-on-ollama). The other 80% did not have LLM models available, but remained vulnerable to manipulation, including untrusted model uploads.
“Despite their growing utility, the pace of LLM adoption has often outstripped the development and implementation of appropriate security practices,” writes Cisco’s Dr. Giannis Tziakouris. Self-hosted LLMs are often brought online with “default configurations, weak or absent authentication, and insufficient network isolation,” a symptom of AI enthusiasm that has “prioritized accessibility and performance over security,” according to Tziakouris.
What happens when someone other than Cisco’s security team finds your open endpoint? They can run up a huge hosting bill or wear out your hardware, for gruesome funsies. They might reconstruct model parameters through repeated queries, or use your AI to do things commercial AIs refuse to do. They can target your systems using [backdoor injection](https://www.cobalt.io/blog/backdoor-attacks-on-ai-models), [model poisoning](https://owasp.org/www-project-machine-learning-security-top-10/docs/ML10_2023-Model_Poisoning), and other known AI exploits.
You don’t have to imagine our surprise at these findings, because it doesn’t exist.
Tailscale CEO Avery Pennarun told the crowd at [Web Summit Vancouver in May 2025](https://youtu.be/m2iLUqUimJo?si=xlzT6BD6EcEjhOtE&amp;t=222) that, for too many AI companies, “Security is last on their list of priorities.” His blunt advice to the crowd: “Don’t put your private API servers on the public internet. Don’t do that. I know you’re not going to listen to me, but still don’t. I am going to laugh at you.”
Avery followed up on this thread in [an interview with Canadian tech news site BetaKit](https://betakit.com/tailscale-ceo-avery-pennarun-says-pressure-to-adopt-ai-has-created-a-wild-west-for-corporate-cybersecurity/). The Model Context Protocol (MCP) used by many companies for connecting data to AI, Avery said, is tricky to implement securely, so a lot of companies simply skip that part. “The way people are doing it instead is they slap something out on the public internet, and they cover their eyes and hope that nobody finds it,” Avery said.
## [There has to be a better way (and there is)](#there-has-to-be-a-better-way-and-there-is)
What goes for large companies with engineering staff certainly goes for solo tinkerers and small teams—the easy, up-and-running approach usually wins out. But it doesn’t have to.
Alex Kretzschmar detailed his method for [securely hosting your own Ollama server with Tailscale](https://tailscale.com/blog/self-host-a-local-ai-stack). The end result is an AI that, while accessible to you and anyone you share it with through Tailscale, is otherwise invisible to the broader web. Remy Guercio wrote just last week about how Tailscale is seeking to [make MCPs easier to access with identity-based authorization](https://tailscale.com/blog/dynamic-client-registration-dcr-for-mcp-ai), for both companies and individuals.
Cisco’s Tziakouris concludes that their experiment shows “widespread neglect of fundamental security practices such as access control, authentication, and network isolation” in custom and self-hosted AI. That’s essentially a list of issues that [Tailscale solves out of the box](https://login.tailscale.com/start), for both the AI hosted on your own GPU or [a GPU across the world](https://tailscale.com/events-webinars/bridging-the-gpu-availability-gap-with-tailscale).
You can read a lot more about the Talos group’s methodology and findings [at their blog post](https://blogs.cisco.com/security/detecting-exposed-llm-servers-shodan-case-study-on-ollama). And you can read more on our site about how Tailscale can provide a far more secure AI experience [for businesses](https://tailscale.com/use-cases/ai), for [AI providers](https://tailscale.com/customers/hugging-face), or just [for you](https://tailscale.com/blog/how-tailscale-works).
Share
Author
Kevin Purdy
Author
Kevin Purdy
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