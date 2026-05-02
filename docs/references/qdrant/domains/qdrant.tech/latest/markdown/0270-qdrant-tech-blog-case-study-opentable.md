How OpenTable Reinvented Restaurant Discovery with Qdrant
0
# How OpenTable Reinvented Restaurant Discovery with Qdrant
Daniel Azoulai
&#183;
September 02, 2025
* [Home](https://qdrant.tech/)
* /
* [Blog](https://qdrant.tech/blog/)
* /
* How OpenTable Reinvented Restaurant Discovery with Qdrant
On this page:
* [
Share on X](<https://twitter.com/intent/tweet?url=https://qdrant.tech/blog/case-study-opentable/&amp;text=How OpenTable Reinvented Restaurant Discovery with Qdrant>)
* [
Share on LinkedIn](https://www.linkedin.com/sharing/share-offsite/?url=https://qdrant.tech/blog/case-study-opentable/)
## **Reinventing Restaurant Discovery: How OpenTable built Concierge, an AI Dining Assistant**
### Recognizing that AI would redefine restaurant discovery
When generative AI tools entered the mainstream, OpenTable knew diners would change how they find and choose restaurants. People were beginning to expect conversational, intelligent and context-aware assistants, rather than static search boxes.
Patrick Lombardo, Staff ML Engineer at OpenTable, recalls that the team wanted to move quickly. “We knew early on that generative AI was going to change user expectations. Concierge was an opportunity for us to transform the way that diners discover restaurants while building the tooling and infrastructure that will support future AI-powered experiences.”
That stepping stone is [Concierge](https://www.opentable.com/blog/concierge-ai-dining-assistant/), an AI-powered assistant designed to answer restaurant-related questions in natural language using OpenTable’s data.
### Setting clear priorities for accuracy, domain focus, and speed
For Concierge to succeed, the assistant needed to respond to the vast majority of user questions and every answer had to reflect reality. Incorrect menu items or outdated offerings could erode user and restaurant trust.
“The primary goal was answerability. We wanted to make sure the model could answer most questions. The second most important was accuracy, so that when the model gave an answer it was correct.” Puyuan Liu, Machine Learning Scientist, OpenTable
Beyond the application logic, the team needed a vector database that could handle sparse embeddings for keyword expansions and fine-grained filtering. Queries often narrowed results to a single restaurant out of more than 60,000, which placed heavy demands on filtering performance.
### Qdrant chosen due to sparse embeddings, filtering, and deployment.
Qdrant emerged as the preferred option for several reasons that aligned directly with OpenTable’s priorities.
First, its handling of sparse embeddings was a key differentiator. Concierge’s retrieval often required filtering down to a single restaurant, making the collection effectively sparse. Many vector databases see HNSW graph quality degrade under such conditions, but Qdrant’s optimizations avoided that performance drop.
Second, Qdrant delivered reliable high-precision filtering. In production, each query might target reviews, metadata, and other structured restaurant data all at once. Qdrant handled this with predictable performance, which was essential for hitting their latency budget.
Third, Qdrant Cloud provided a deployment path that was simpler than self-hosting.
Patrick Lombardo summed it up: &ldquo;Creating a Qdrant Cloud cluster was one of the easiest parts of the project. It just worked.&rdquo;
The production launch was global from the start, allowing Concierge to answer questions about restaurants in many regions without separate deployments.
### Achieving stability and setting the stage for future innovation
Concierge met its latency target and maintained high answerability without extensive post-launch tuning. Operationally, Qdrant became one of the most stable components in the stack. Ant White, Principal Software Engineer at OpenTable, explained, “Since running it in production, it is a frictionless part of the stack. ”
### Key takeaways from the Concierge rollout
Concierge is continuing to pave the way for OpenTable’s AI transformation. While it is a positive new user experience itself, it also gave OpenTable a safe environment to refine retrieval infrastructure before integrating it into core search. Sparse embeddings proved highly effective when combined with heavy filtering, keeping retrieval precise and efficient.
Operational stability turned out to be a significant advantage. With Qdrant handling retrieval without incident, the team was free to focus on improving model performance and user experience rather than troubleshooting the database layer.
With Concierge as a foundation, OpenTable is now positioned to continue to deliver richer, faster, and more intelligent dining experiences, from conversational search to visual dish discovery.
### Get Started with Qdrant Free
[Get Started](https://cloud.qdrant.io/signup)
Up!