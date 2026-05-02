How Anima Health scaled clinical document intelligence with Qdrant
0
# How Anima Health scaled clinical document intelligence with Qdrant
Daniel Azoulai
&#183;
January 28, 2026
* [Home](https://qdrant.tech/)
* /
* [Blog](https://qdrant.tech/blog/)
* /
* How Anima Health scaled clinical document intelligence with Qdrant
On this page:
* [
Share on X](<https://twitter.com/intent/tweet?url=https://qdrant.tech/blog/case-study-anima-health/&amp;text=How Anima Health scaled clinical document intelligence with Qdrant>)
* [
Share on LinkedIn](https://www.linkedin.com/sharing/share-offsite/?url=https://qdrant.tech/blog/case-study-anima-health/)
Primary care systems across the UK are under intense strain. General practitioners (GPs) balance their time with patient demand, understaffing, administrative burden vs. delivering care. [Anima Health](https://animahealth.com/) set out to address this challenge by building a clinical operating system designed to make primary care more efficient, more informed, and more humane for both clinicians and patients.
At the heart of Anima’s platform is the ability to process large volumes of unstructured clinical data, including documents, test results, referral letters, and notes, while maintaining strict privacy guarantees. To achieve this at scale, Anima relies on Qdrant as a core infrastructure component for vector search, similarity analysis, and agentic AI workflows.
### The challenge: Under-capacity clinics and unstructured data overload
Anima focuses on GP practices in the UK, where under-capacity is the defining operational constraint. Clinics must triage and treat more patients than ever, with too few clinicians and limited administrative resources.
A major bottleneck lies in unstructured clinical documents. These can include PDFs, handwritten notes, blood test results, and referral letters. Important information often arrives late, is poorly indexed, or requires manual review by clinicians.
> “The main bottleneck is GPs. We are completely understaffed across the UK, and there is no end in sight. Optimizing GP time is essential.”
> -Colin Cooke, Lead AI Engineer, Anima Health
This overload creates two compounding problems: First, clinicians lack timely access to information that could inform better decisions, and second, highly trained medical staff spend a disproportionate amount of time on administrative work rather than patient care.
### The solution: Vector-powered clinical intelligence with Qdrant
From the earliest stages of the product, Anima identified vector search as foundational infrastructure. Qdrant became the backbone of several key workflows, most notably clinical document coding.
Clinical documents are analyzed using large language models (LLMs) to extract meaning from unstructured text. However, LLMs alone cannot reliably handle medical ontologies such as SNOMED (Systematized Nomenclature of Medicine) codes, which are numeric identifiers with precise clinical meaning and downstream implications. These codes must be exact.
Anima represents SNOMED codes inside Qdrant as vector embeddings, enriched with metadata. During document processing, Qdrant is used as a retrieval layer inside an agentic pipeline. It narrows the search space, surfaces candidate codes, and enables high-confidence recommendations that clinicians can review and approve.
> “LLMs are great at understanding unstructured data, but they cannot free recall SNOMED codes. Those numeric IDs matter, and getting them wrong has real consequences.”
> -Colin Cooke, Lead AI Engineer, Anima Health
Beyond coding, Anima uses Qdrant to understand documents at scale. By working with embedded representations of documents rather than raw text, the system can identify patterns across documents while preserving patient privacy. These signals influence downstream workflows without exposing sensitive content to models or operators.
> “Embeddings let us do a lot with clinical data without ever coming close to violating patient privacy. That is something we lean on heavily.”
> -Colin Cooke, Lead AI Engineer, Anima Health
### Why Qdrant: Deployment control, cost predictability, and flexibility
Several factors made Qdrant a strong fit for healthcare workloads.
[Deployment flexibility](https://qdrant.tech/documentation/installation/) was non-negotiable. Anima requires data to remain at rest in the UK, allowing them to make strong guarantees to customers about compliance and residency. Qdrant’s self-hosted and region-controlled deployment options enabled this without compromising performance.
Cost predictability also played a critical role. With a fixed infrastructure cost for vector search, Anima could use retrieval across multiple passes in their pipelines. This unlocked higher-quality results without eroding margins.
> “Knowing that retrieval is reliable and low cost changed how we build. We do not think twice about using vector search as part of our pipelines.”
> -Colin Cooke, Lead AI Engineer, Anima Health
Finally, Qdrant’s vector-native capabilities mattered. [Payload-based filtering](https://qdrant.tech/documentation/manage-data/payload/) allows Anima to scope searches precisely across different electronic health record systems. [Multivector support](https://qdrant.tech/documentation/manage-data/payload/) enables experimentation with multiple embedding strategies and providers, reducing long-term lock-in and easing future transitions.
### Results: Scalable, privacy-first AI in production
Since moving into production, Qdrant has scaled quietly alongside Anima’s growth. Despite rapid increases in workload, the vector layer required minimal operational attention, even as it became deeply embedded across multiple pipelines.
> “We experienced significant growth, and Qdrant was never something I had to think about. It just continued to work.”
> -Colin Cooke, Lead AI Engineer, Anima Health
Clinicians benefit from faster document processing, better prioritization, and reduced administrative overhead. Patients benefit from more timely and informed care decisions. Internally, Anima gained the confidence to build increasingly agentic workflows on top of a reliable retrieval foundation.
## What’s next for Anima Health
As Anima Health continues to scale, the team is looking beyond individual workflows toward more fully agentic clinical systems. These systems are designed to operate with greater autonomy while remaining tightly governed by clinical and regulatory constraints.
A key focus area is expanding how medical knowledge and patient context are represented and retrieved. Today, vector search already plays a central role in document understanding and classification. Going forward, Anima sees embeddings as a way to model longer-term patient state and clinical context that can evolve over time.
> “As we move toward more agentic systems, having reliable tools between the agent and our medical knowledge is essential. Qdrant is becoming one of those core tools.”
> -Colin Cooke, Lead AI Engineer, Anima Health
Another area of exploration is temporal relevance. Clinical information can become stale at different rates depending on its nature. Anima is interested in systems that can reason about how recent or uncertain a piece of information is, and adjust retrieval and decision-making accordingly.
The team is also investing in flexibility across their AI stack. This includes experimenting with multiple embedding models in parallel and transitioning between providers without disrupting production systems. Qdrant’s capabilities make this kind of controlled experimentation possible, allowing Anima to adopt better models as they emerge.
> “I do not want to be locked into a single embedding provider. Multivector support gives us the freedom to test and transition as models improve.”
> -Colin Cooke, Lead AI Engineer, Anima Health
Ultimately, Anima’s roadmap points toward AI systems that can support clinicians continuously rather than reactively. By grounding these systems in robust retrieval, strict privacy boundaries, and predictable infrastructure, Anima aims to scale clinical intelligence without sacrificing trust.
As healthcare organizations look to adopt more advanced AI workflows, Anima’s approach shows how vector search can serve not just as a technical optimization, but as a foundation for safe, future-proof clinical AI.
### Get Started with Qdrant Free
[Get Started](https://cloud.qdrant.io/signup)
Up!