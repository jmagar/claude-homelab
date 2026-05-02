How Deutsche Telekom Built a Multi-Agent Enterprise Platform Leveraging Qdrant
0
# How Deutsche Telekom Built a Multi-Agent Enterprise Platform Leveraging Qdrant
Manuel Meyer
&#183;
March 07, 2025
* [Home](https://qdrant.tech/)
* /
* [Blog](https://qdrant.tech/blog/)
* /
* How Deutsche Telekom Built a Multi-Agent Enterprise Platform Leveraging Qdrant
On this page:
* [
Share on X](<https://twitter.com/intent/tweet?url=https://qdrant.tech/blog/case-study-deutsche-telekom/&amp;text=How Deutsche Telekom Built a Multi-Agent Enterprise Platform Leveraging Qdrant>)
* [
Share on LinkedIn](https://www.linkedin.com/sharing/share-offsite/?url=https://qdrant.tech/blog/case-study-deutsche-telekom/)
**How Deutsche Telekom Built a Scalable, Multi-Agent Enterprise Platform Leveraging Qdrant—Powering Over 2 Million Conversations Across Europe**
[Arun Joseph](https://www.linkedin.com/in/arun-joseph-ab47102a/), who leads engineering and architecture for [Deutsche Telekom&rsquo;s AI Competence Center (AICC)](https://www.telekom.com/en/company/digital-responsibility/details/artificial-intelligence-at-deutsche-telekom-1055154), faced a critical challenge: how do you efficiently and scalably deploy AI-powered assistants across a vast enterprise ecosystem? The goal was to deploy GenAI for customer sales and service operations to resolve customer queries faster across the 10 countries where Deutsche Telekom operates in Europe.
To achieve this, Telekom developed [*Frag Magenta OneBOT*](https://www.telekom.de/hilfe/frag-magenta?samChecked=true) *(Eng: Ask Magenta)*, a platform that includes chatbots and voice bots, built as a Platform as a Service (PaaS) to ensure scalability across Deutsche Telekom&rsquo;s ten European subsidiaries.
&ldquo;We knew from the start that we couldn&rsquo;t just deploy RAG, tool calling, and workflows at scale without a platform-first approach,&rdquo; Arun explains. &ldquo;When I looked at the challenge, it looked a lot like a distributed systems and engineering challenge, not just an AI problem.&rdquo;
### Key Requirements for Scaling Enterprise AI Agents
While flashy AI demos are easy to build, Deutsche Telekom&rsquo;s team quickly discovered that scaling AI agents for enterprise use presents a far more complex challenge. &ldquo;This isn&rsquo;t just about AI,&rdquo; Arun explains. &ldquo;It&rsquo;s a distributed systems problem that requires rigorous engineering.&rdquo; Based on their experience deploying AI across multiple regions, they identified three key challenges in scaling AI agents in production:
1. **Handling Tenancy & Memory Management:** AI workloads spanning 10 different countries require strict data segregation and compliance.
2. **Horizontal Scaling & Context Sharing**: AI agents require real-time processing while maintaining historical context, so efficiently storing, retrieving, and processing AI-generated context at scale is critical.
3. **Non-Deterministic Agent Collaboration:** AI agents often exhibit unpredictable behavior, making seamless inter-agent communication and workflow orchestration complex.
&ldquo;From our experience, these challenges are fundamentally distributed systems problems, not just AI problems,&rdquo; Arun explains. &ldquo;We need feedback loops, state management, lifecycle orchestration, and intelligent routing for staggered rollouts. Microservices alone aren&rsquo;t enough — we need a domain-driven approach to AI agent design.&rdquo;
This insight led to the formation of [LMOS as an open-source Eclipse Foundation project](https://eclipse.dev/lmos/). Now, other companies can leverage LMOS for their own AI agent development.
### Why Deutsche Telekom Had to Rethink Its AI Stack from the Ground Up
The team started its journey in June 2023 with a small-scale Generative AI initiative, focusing on chatbots with customized AI models. Initially, they used LangChain and a major vector database provider for vector search and retrieval, alongside a custom Dense Passage Retrieval (DPR) model fine-tuned for German language use cases.
However, as they scaled, these issues quickly emerged:
* Memory spikes and operational instability due to the sheer number of components used in the previous provide
* Complex maintenance requirements, with frequent dependency issues, high operational overhead due to missing memory optimizations, and streamlined deployment.
Despite efforts to improve annotations and tuning, it became evident that this approach wouldn&rsquo;t scale for Deutsche Telekom.
Additionally, there was a strong need to leverage existing engineering assets, as most developers and systems were already equipped with SDKs and familiar tooling. Rather than building an entirely new stack from scratch, the focus shifted to enabling developers to build AI agents within the tools and frameworks they were already comfortable with. This approach allowed domain experts who understood the APIs and enterprise systems to quickly develop AI agents without disrupting existing workflows.
Recognizing this, the team made a bold decision: to build a **fully-fledged PaaS platform for AI agents**, streamlining development and accelerating deployment of AI Agents.
### LMOS: Deutsche Telekom&rsquo;s Open-Source Multi-Agent AI PaaS for Enterprise AI
Recognizing that an AI-driven platform required deep engineering rigor, the Telekom team designed **LMOS (Language Models Operating System)** — a multi-agent PaaS designed for high scalability and modular AI agent deployment. Key technical decisions included:
* **Choosing Kotlin and JVM** to ensure engineers familiar with existing Deutsche Telekom systems could easily integrate with LMOS.
* **Moving away from pre-built frameworks** in favor of a ground-up, highly optimized solution tailored to Deutsche Telekom&rsquo;s specific needs.
* **Providing a Heroku-like experience** where engineers don&rsquo;t need to worry about classifiers, agent lifecycles, deployment models, monitoring, and horizontal scaling.
* **Enterprise Grade while being flexible:** LMOS was built with enterprise-grade scalability, versioning, and multi-tenancy in mind, while also offering the flexibility to integrate agents from other frameworks — not just JVM-based solutions — ensuring interoperability across diverse AI ecosystems.
&ldquo;Our engineers already knew their APIs — billing, shopping, user profiles. Why should we introduce new abstractions that only complicate the stack?&rdquo; Arun notes, &ldquo;also, I envisioned us building the foundations of what I call **agentic computing**, playing a role in shaping the application stacks of the future on top of LLMs.&rdquo;
LMOS architecture powering AI agent collaboration and lifecycle management in a cloud-native environment.
### Why Qdrant? Finding the Right Vector Database for LMOS
When Deutsche Telekom began searching for a scalable, high-performance vector database, they faced operational challenges with their initial choice. Seeking a solution better suited to their PaaS-first approach and multitenancy requirements, they evaluated alternatives, and [Qdrant](https://qdrant.tech/qdrant-vector-database/) quickly stood out.
&ldquo;I was looking for open-source components with deep technical expertise behind them,&rdquo; Arun recalls. &ldquo;I looked at Qdrant and immediately loved the simplicity, [Rust-based efficiency](https://qdrant.tech/articles/why-rust/), and [memory management capabilities](https://qdrant.tech/articles/memory-consumption/). These guys knew what they were doing.&rdquo;
The team structured its evaluation around two key metrics:
1. **Qualitative metrics**: developer experience, ease of use, memory efficiency features.
2. **Operational simplicity**: how well it fit into their PaaS-first approach and [multitenancy requirements](https://qdrant.tech/documentation/manage-data/multitenancy/).
Deutsche Telekom&rsquo;s engineers also cited several standout features that made Qdrant the right fit:
1. **Simplicity in operations**—Qdrant is lightweight and doesn&rsquo;t require an excessive component stack.
2. **Developer experience**—libraries, multi-language clients, and cross-framework support make integrations seamless.
3. **WebUI & Collection Visualization**—engineers found Qdrant&rsquo;s [built-in collection visualization](https://qdrant.tech/documentation/web-ui/) tools highly useful.
As part of their evaluation, Deutsche Telekom engineers compared multiple solutions, weighing operational simplicity and reliability.
One engineer summarized their findings: &ldquo;Qdrant has way fewer components, compared to the another that required required Kafka, Zookeeper, and only had a hot standby for its index and query nodes. If you rescale it, you get downtime. Qdrant stays up.&rdquo;
### Scaling AI at Deutsche Telekom & The Future of LMOS
Today, LMOS with Qdrant serves as the backbone for Deutsche Telekom&rsquo;s AI services, processing over 2 million conversations across three countries. The time required to develop a new agent has dropped from 15 days to just 2.
With [LMOS now part of the Eclipse Foundation](https://projects.eclipse.org/projects/technology.lmos), Deutsche Telekom is opening up its platform to the broader AI engineering community. Arun sees a future ecosystem of like-minded developers coalescing around LMOS, Qdrant, and other AI infrastructure components.
&ldquo;For enterprises looking to build their own AI agent platforms, the future isn&rsquo;t just about AI models — it&rsquo;s about scalable, open, and opinionated infrastructure. And that&rsquo;s exactly what we&rsquo;ve built,&rdquo; says Arun Joseph.
You can learn more about Deutsche Telekom&rsquo;s AI Agents and Arun&rsquo;s vision for LMOS in his [talk](<https://www.infoq.com/presentations/ai-agents-platform >) at the InfoQ Dev Summit Boston.
### Watch livestream with Arun
In this Vector Space talk, Thierry from Qdrant and Arun from Deutsche Telekom talk about the key requirements for scaling enterprise AI agents, key AI stack considerations, and how the team built a Platform as a Service (PaaS) - LMOS (Language Models Operating System) — a multi-agent PaaS designed for high scalability and modular AI agent deployment.
### Get Started with Qdrant Free
[Get Started](https://cloud.qdrant.io/signup)
Up!