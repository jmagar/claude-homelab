Are You Vendor Locked? - Qdrant
0
# Are You Vendor Locked?
David Myriel
&#183;
May 05, 2024
* [Home](https://qdrant.tech/)
* /
* [Blog](https://qdrant.tech/blog/)
* /
* Are You Vendor Locked?
On this page:
* [
Share on X](<https://twitter.com/intent/tweet?url=https://qdrant.tech/blog/are-you-vendor-locked/&amp;text=Are You Vendor Locked?>)
* [
Share on LinkedIn](https://www.linkedin.com/sharing/share-offsite/?url=https://qdrant.tech/blog/are-you-vendor-locked/)
We all are.
*> “There is no use fighting it. Pick a vendor and go all in. Everything else is a mirage.”
*> The last words of a seasoned IT professional
As long as we are using any product, our solution’s infrastructure will depend on its vendors. Many say that building custom infrastructure will hurt velocity. **Is this true in the age of AI?**
It depends on where your company is at. Most startups don’t survive more than five years, so putting too much effort into infrastructure is not the best use of their resources. You first need to survive and demonstrate product viability.
**Sometimes you may pick the right vendors and still fail.**
We have all started to see the results of the AI hardware bottleneck. Running LLMs is expensive and smaller operations might fold to high costs. How will this affect large enterprises?
> If you are an established corporation, being dependent on a specific supplier can make or break a solid business case. For large-scale GenAI solutions, costs are essential to maintenance and dictate the long-term viability of such projects. In the short run, enterprises may afford high costs, but when the prices drop - then it’s time to adjust.
Unfortunately, the long run goal of scalability and flexibility may be countered by vendor lock-in. Shifting operations from one host to another requires expertise and compatibility adjustments. Should businesses become dependent on a single cloud service provider, they open themselves to risks ranging from soaring costs to stifled innovation.
**Finding the best vendor is key; but it’s crucial to stay mobile.**
## **Hardware is the New Vendor Lock**
*> “We’re so short on GPUs, the less people that use the tool [ChatGPT], the better.”
*> OpenAI CEO, Sam Altman
When GPU hosting becomes too expensive, large and exciting Gen AI projects lose their luster. If moving clouds becomes too costly or difficulty to implement - you are vendor-locked. This used to be common with software. Now, hardware is the new dependency.
*Enterprises have many reasons to stay provider agnostic - but cost is the main one.*
[Appenzeller, Bornstein & Casado from Andreessen Horowitz](https://a16z.com/navigating-the-high-cost-of-ai-compute/) point to growing costs of AI compute. It is still a vendor’s market for A100 hourly GPUs, largely due to supply constraints. Furthermore, the price differences between AWS, GCP and Azure are dynamic enough to justify extensive cost-benefit analysis from prospective customers.
*Source: Andreessen Horowitz*
Sure, your competitors can brag about all the features they can access - but are they willing to admit how much their company has lost to convenience and increasing costs?
As an enterprise customer, one shouldn’t expect a vendor to stay consistent in this market.
## How Does This Affect Qdrant?
As an open source vector database, Qdrant is completely risk-free. Furthermore, cost savings is one of the many reasons companies use it to augment the LLM. You won’t need to burn through GPU cash for training or inference. A basic instance with a CPU and RAM can easily manage indexing and retrieval.
*> However, we find that many of our customers want to host Qdrant in the same place as the rest of their infrastructure, such as the LLM or other data engineering infra. This can be for practical reasons, due to corporate security policies, or even global political reasons.
*
One day, they might find this infrastructure too costly. Although vector search will remain cheap, their training, inference and embedding costs will grow. Then, they will want to switch vendors.
What could interfere with the switch? Compatibility? Technologies? Lack of expertise?
In terms of features, cloud service standardization is difficult due to varying features between cloud providers. This leads to custom solutions and vendor lock-in, hindering migration and cost reduction efforts, [as seen with Snapchat and Twitter](https://www.businessinsider.com/snap-google-cloud-aws-reducing-costs-2023-2).
## **Fear, Uncertainty and Doubt**
You spend months setting up the infrastructure, but your competitor goes all in with a cheaper alternative and has a competing product out in one month? Does avoiding the lock-in matter if your company will be out of business while you try to setup a fully agnostic platform?
**Problem:** If you&rsquo;re not locked into a vendor, you&rsquo;re locked into managing a much larger team of engineers. The build vs buy tradeoff is real and it comes with its own set of risks and costs.
**Acknowledgement:** Any organization that processes vast amounts of data with AI needs custom infrastructure and dedicated resources, no matter the industry. Having to work with expensive services such as A100 GPUs justifies the existence of in-house DevOps crew. Any enterprise that scales up needs to employ vigilant operatives if it wants to manage costs.
> There is no need for
**> Fear, Uncertainty and Doubt
**> . Vendor lock is not a futile cause - so let’s dispel the sentiment that all vendors are adversaries. You just need to work with a company that is willing to accommodate flexible use of products.
**The Solution is Kubernetes:** Decoupling your infrastructure from a specific cloud host is currently the best way of staying risk-free. Any component of your solution that runs on Kubernetes can integrate seamlessly with other compatible infrastructure.
This is how you stay dynamic and move vendors whenever it suits you best.
## **What About Hybrid Cloud?**
The key to freedom is to building your applications and infrastructure to run on any cloud. By leveraging containerization and service abstraction using Kubernetes or Docker, software vendors can exercise good faith in helping their customers transition to other cloud providers.
We designed the architecture of Qdrant Hybrid Cloud to meet the evolving needs of businesses seeking unparalleled flexibility, control, and privacy.
This technology integrates Kubernetes clusters from any setting - cloud, on-premises, or edge - into a unified, enterprise-grade managed service.
#### Take a look. It&rsquo;s completely yours. We’ll help you manage it.
[Qdrant Hybrid Cloud](https://qdrant.tech/hybrid-cloud/) marks a significant advancement in vector databases, offering the most flexible way to implement vector search.
You can test out Qdrant Hybrid Cloud today. Sign up or log into your [Qdrant Cloud account](https://cloud.qdrant.io/login) and get started in the **Hybrid Cloud** section.
Also, to learn more about Qdrant Hybrid Cloud read our [Official Release Blog](https://qdrant.tech/blog/hybrid-cloud/) or our [Qdrant Hybrid Cloud website](https://qdrant.tech/hybrid-cloud/). For additional technical insights, please read our [documentation](https://qdrant.tech/documentation/hybrid-cloud/).
#### Try it out!
[](https://qdrant.to/cloud)
### Get Started with Qdrant Free
[Get Started](https://cloud.qdrant.io/signup)
Up!