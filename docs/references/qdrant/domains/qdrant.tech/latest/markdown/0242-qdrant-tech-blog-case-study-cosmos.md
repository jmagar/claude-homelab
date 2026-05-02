How Cosmos delivered editorial-grade visual search with Qdrant
0
# How Cosmos delivered editorial-grade visual search with Qdrant
Daniel Azoulai
&#183;
November 20, 2025
* [Home](https://qdrant.tech/)
* /
* [Blog](https://qdrant.tech/blog/)
* /
* How Cosmos delivered editorial-grade visual search with Qdrant
On this page:
* [
Share on X](<https://twitter.com/intent/tweet?url=https://qdrant.tech/blog/case-study-cosmos/&amp;text=How Cosmos delivered editorial-grade visual search with Qdrant>)
* [
Share on LinkedIn](https://www.linkedin.com/sharing/share-offsite/?url=https://qdrant.tech/blog/case-study-cosmos/)
[Cosmos](https://www.cosmos.so/) is redefining how people find inspiration online. It’s a visual search app built for creative professionals and everyday users who want a clean, meditative, ad-free place to collect and curate ideas. In contrast to feeds dominated by doomscrolling, ads, and generative “AI slop,” Cosmos focuses on high-quality, human-made content. AI-powered search and captions connect each image to its creator, making visual discovery richer, more accurate, and easier to navigate.
Behind this front end sits a complex technical problem: powering text, color, and hybrid visual search for millions of users in real time. For Cosmos, the solution came from Qdrant Cloud.
### The challenge: Creative discovery that feels human
Cosmos serves a community of creatives who expect precision, clarity, and beauty. The platform hosts millions of “elements” — images, videos, text snippets, social embeds, and other creative artifacts a person uploads.
*Searching by image, color and term*
Search is at the heart of Cosmos. Users explore through:
* Text search (“modern ceramics,” “soft light photography”)
* Color search (exact hex or tone matching)
* Hybrid queries that blend both text and color context
* Similar elements that surface related elements to what the user is currently viewing
* Cluster recommendations to suggest additional elements to a cluster (group of elements)
The challenge was to deliver these multimodal results with sub-second latency while applying rich metadata filtering (format, engagement signals, and more).
Early prototypes relied on Postgres with pgvector, but scalability and performance quickly became potential concerns.
*“We wanted a vector search engine that could handle our color and text embeddings together while letting us filter by dozens of metadata dimensions.”*
-*Griffin Miller, AI/ML & Product*
Cosmos also needed a managed deployment to avoid maintaining reindexing, scaling, or balancing logic manually. The engineering team wanted to focus on product innovation, not infrastructure tuning.
### The solution: Qdrant Cloud as the retrieval layer
Cosmos migrated to Qdrant Cloud, using it as the foundation for all search and recommendations across the platform. Qdrant now powers:
* Text and color search, including hybrid text-plus-color results
* Similar-elements recommendations within clusters (Cosmos’s term for user collections)
* Candidate generation for Cosmos’ in-house ranker
* Element processing pipelines for deduplication
“Qdrant powers our text search, color search, hybrid search, and similar-elements view,” said Miller. “It lets us move fast on candidate generation while applying our own editorial and engagement logic on top.”
The team chose Qdrant Cloud’s fully managed deployment, citing its strong filtering, named vectors, and operational stability. “We didn’t want to manage our own reindexing or optimizations,” Miller explained. “Qdrant handled that automatically, and we’ve seen features like resharding and CPU budgets evolve right alongside our needs.”
### Engineering precision: Named vectors and exact color search
A key innovation at Cosmos is its exact color search system running in production at scale. People can input a color (for example, #FFFFFF white), and Qdrant retrieves images with perceptually matching tones.
To make this possible, Cosmos stores color data as CIELAB (L\*a\*b\*) vectors, a perceptual color model that better reflects how humans see hue and brightness. Each element contains five separate 3D color vectors (primary through quinary), all kept in memory for fast Euclidean distance search.
When a user searches by color, Cosmos converts the hex value to CIELAB, retrieves matches for all five color vectors, then re-ranks results based on how much of that color is actually present in the image. “If an image is 60% white in its primary palette, that matters,” Miller said.
Qdrant’s named vector capability made this design straightforward and efficient. Each element stores multiple embeddings (CLIP, CNN, pHash, and color vectors) in a single collection, allowing Cosmos to handle multimodal retrieval without cross-joins or maintaining separate indexes.
### Hybrid search, but with an editorial twist
Cosmos experimented with Qdrant’s built-in hybrid search via reciprocal rank fusion. It worked well for standard semantic retrieval, but for color-critical workflows, even slight approximations were noticeable.
“For us, color matching had to be exact,” said Miller. “Hybrid search was blending relevance and hue too much. We moved to an application-side fusion model. Qdrant handles the retrieval, and we handle the balancing between engagement, relevance, and aesthetics.”
That balance of relevance and aesthetics is core to how Cosmos approaches discovery. The team developed an aesthetic scoring model that applies a consistent quality measure to images, ensuring the feed retains high quality content throughout.
As Miller put it: “We want relevance, engagement, and beauty. That’s the triangle we’re always optimizing.”
### Results: Sub-second retrieval and faster pipelines
Today, Cosmos’s retrieval and recommendation stack on Qdrant Cloud delivers:
* 200–500 ms end-to-end search latency, including retrieval, filtering, and re-ranking
* Element processing reduced by 79%, after parallelizing CNN, CLIP, and pHash computation and leveraging Qdrant to store these vectors directly
* Predictable operations and lower costs through quantization, batching, and CPU budgeting
These improvements keep search responsive while ensuring the infrastructure scales smoothly with user growth.
### Building toward the next release
Cosmos is continuing to expand its AI capabilities. The team is refining multi-color search and preparing a major relaunch of its iOS and web apps, both built on the latest Qdrant configuration.
Miller highlighted the partnership: “Qdrant’s customer engineering team has been super responsive. Every new feature we’ve needed, like resharding, read-write separation, and optimizers, has shown up right when we needed it.”
As Cosmos moves toward its next release, its search stack now reflects its design philosophy: fast, thoughtful, and exact.
*“Our users are artists. They can tell the difference between ‘almost right’ and perfect. Qdrant helps us achieve this level of precision.”*
-*Griffin Miller, AI/ML & Product, Cosmos*
### Get Started with Qdrant Free
[Get Started](https://cloud.qdrant.io/signup)
Up!