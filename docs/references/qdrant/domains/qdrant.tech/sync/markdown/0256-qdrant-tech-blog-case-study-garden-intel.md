How Garden Scaled Patent Intelligence with Qdrant
0
# How Garden Scaled Patent Intelligence with Qdrant
Daniel Azoulai
&#183;
May 09, 2025
* [Home](https://qdrant.tech/)
* /
* [Blog](https://qdrant.tech/blog/)
* /
* How Garden Scaled Patent Intelligence with Qdrant
On this page:
* [
Share on X](<https://twitter.com/intent/tweet?url=https://qdrant.tech/blog/case-study-garden-intel/&amp;text=How Garden Scaled Patent Intelligence with Qdrant>)
* [
Share on LinkedIn](https://www.linkedin.com/sharing/share-offsite/?url=https://qdrant.tech/blog/case-study-garden-intel/)
## Garden Accelerates Patent Intelligence with Qdrant’s Filterable Vector Search
For more than a century, patent litigation has been a slow, people-powered business. Analysts read page after page—sometimes tens of thousands of pages—hunting for the smoking-gun paragraph that proves infringement or invalidity. Garden, a New York-based startup, set out to change that by applying large-scale AI to the entire global patent corpus—more than 200 million patents—in conjunction with terabytes of real world data.
*“Our customers need to compare millions of possible patent–product pairings in seconds, not days,” explains co-founder Justin Mack. “That means vector search that can handle huge data sets and surgical-grade filtering.”*
### A data set that breaks naïve vector search
Each patent can run to 100+ pages and, thanks to decades of revisions, carries roughly 2,000 metadata fields: jurisdiction, grant date, family ID, claim dependencies, and so on. Garden splits every patent into semantically meaningful chunks, producing “many hundreds of millions” of vectors. The same pipeline ingests real-world product data to compare against the patents.
The engineering demands quickly outgrew Garden’s first solution, a fully-managed vector service. They had tens of gigabytes of data already costing ≈ $5,000 / month. And a lack of native filterable-HNSW meant that Garden had to stand up a separate index for every combination of country, date range, and technology tag. Finally, with no infrastructure visibility, troubleshooting was slow and expensive.
A second migration to a self-hosted open-source alternative cut costs but introduced new pains: on-call operations for a two-person team, upgrades during business hours, and—crucially—the same filtering limitations.
### Discovering Qdrant
When Garden found Qdrant’s blog post on filterable HNSW, the team realized they could get the search semantics they wanted without bolting on bespoke sharding logic.
*“Filterable HNSW was the deal-maker, but Qdrant Cloud’s *managed* Rust backbone sealed it,” says Mack. “We kept source-level transparency while off-loading 24×7 ops.”*
* **Scalar quantization (8-bit)** keeps hot vectors in RAM while colder, full-precision embeddings sit on disk—perfect for Garden’s read-heavy, bursty workload.
* **SLA-backed sub-100ms latency** meets Garden’s product target even when a user fires off thousands of queries in a single button-click.
* **Pay-for-what-you-use pricing** lets Garden store 10× more data for roughly the same cost it once paid for a fraction of the corpus.
### Migration in practice
Garden already held all vectors in Google Cloud Storage. A weekend of scripted ETL pushed the embeddings into Qdrant Cloud. Because Qdrant’s ingestion API mirrors popular open-source conventions, the team only altered a few lines of an existing migration script. The heaviest lift—GPU-based embedding of 200M patents—was finished months earlier on a 2,000-GPU transient cluster.
### **Business impact**
|KPI|Before Qdrant|After Qdrant|
|Addressable patent corpus|≈ 20M|**200M+**|
|Vector data under management|tens of millions|**hundreds of millions**|
|Typical query latency|250 – 400ms|**\< 100ms p95**|
|Cost per stored GB|baseline|**\~ 10× lower**|
|New revenue lines|0|**Full infringement-analysis product**|
Filterable HNSW didn’t just speed up existing workflows; it unlocked an entirely new line of business—high-confidence infringement detection. Clients now click a button and receive a claim-chart quality analysis in minutes. For some enterprises that translates into seven-plus-figure licensing wins or decisive defense against patent trolls.
### Looking ahead
As Garden’s customer base grows, query-per-second (QPS) requirements will rise faster than data volume. Meanwhile, Garden plans deeper enrichment of every patent—breaking long descriptions into structured facts the vector index can exploit.
*“We don’t have to think about the vector layer anymore,” Mack notes. “Qdrant lets us focus on the IP insights our customers pay for.”*
### Get Started with Qdrant Free
[Get Started](https://cloud.qdrant.io/signup)
Up!