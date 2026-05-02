Why AI companies love Tailscale as an AI infrastructure solution
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|insightsOctober 18, 2024
# AI companies are surprisingly normal
Avery Pennarun is the CEO and co-founder of Tailscale.
*> So first, I must disappoint you. From an ops standpoint, you sand off the identifying marks and AI is just some external services, a few servers with special capabilities, and some odd data stores. Tailscale solves no problems stemming from AI, and I'm not sure how it can or if it should.
*
— a Tailscale customer disappointing one of our PMs
A year ago, we started noticing that Tailscale was getting popular with AI companies. Kevin, our CRO, told me something like, “Five of the top five AI companies use Tailscale already.” I haven’t re-confirmed that fact lately, and not everybody using Tailscale gives us [logo rights](https://tailscale.com/blog/5000-customers)\*, but let’s say there are at least hundreds of AI-first companies using Tailscale, and some of them are very big and growing very fast.
Anyway, that was good news. The bad news was, uh, nowhere on [tailscale.com](http://tailscale.com) could you find the words “AI” or “machine learning” or “GPU,” so I guess that success had little to do with our expert market segmentation skills and a lot to do with luck. (We’re getting better since then. Read about our new [AI Startups Program](https://tailscale.com/ai-startup-program) or how to [use Tailscale to access LLMs and GPUs](https://tailscale.com/use-cases/ai) or our [HuggingFace case study](https://tailscale.com/customers/hugging-face).)
As many people know, I’m a big fan of [Crossing the Chasm](https://en.wikipedia.org/wiki/Crossing_the_Chasm) and the related post-chasm [Bowling Alley model](https://blas.com/inside-the-tornado/) for market segmentation. So, late or not, we declared AI-first companies to be a key market segment for us (that we were somehow winning already). We stuck it in our OKRs\*\* and sent some PMs and PMMs out to do market research. We needed to find out what exactly we were selling and why and to whom.
With these sorts of stories, I can never tell if I’m bragging or humblebragging or what. Ultimately, Tailscale is a successful and fast-growing company (*brag*). But on the other hand, we often have trouble figuring out where the growth comes from (*humble*) so we can invest in more of it. But on the first hand again, it makes a good story (*or what*) which I then leverage into a blog post which then leads to more growth.
Sorry, I digress. Here’s what we found from our research.
### [AI companies use Tailscale to connect their computers together](#ai-companies-use-tailscale-to-connect-their-computers-together)
I guess this part is obvious since that's what Tailscale does, but it’s important to note, because it’s the centerpiece of what, to me, was a surprising outcome. AI-first companies use Tailscale a lot like how other companies use Tailscale. They have networking challenges, especially inside prod or from engineering PCs to prod or for isolating dev environments, and they use Tailscale as an [AI infrastructure](https://tailscale.com/use-cases/ai) solution to make their problems go away.
AI companies are characterized by:
* Very rapid growth;
* Extreme urgency due to heavy competition;
* Extreme early adopters (by nature of their industry I guess);
* World-class experts in machine learning who are, understandably, usually not experts in networking;
* And yet, they have big networking problems because they need to transfer immense amounts of data between many machines, often geographically distant from each other and hosted in multiple cloud providers;
* And, lots of privacy, cryptography, compliance, identity, and access control concerns because they process immense amounts of their customers’ personal data and their reputation is paramount.
In short, this is an ideal use case for Tailscale. Maybe we should change our motto to "we do networking so you don't have to."
### [GPUs and Multi-cloud](#gpus-and-multi-cloud)
Another thing I didn’t expect: nearly every AI company uses multiple cloud providers. Why? Because GPUs are expensive. The best prices [for the particular GPU models you want](https://www.latent.space/p/gpu-bubble) are almost never at the big cloud providers. So you use a big cloud provider for most of your stuff, and a GPU Cloud provider (or several) for your GPU stuff, and then you have to send lots of data between them.
There are two bits of Internet wisdom I've picked up about multi-cloud:
1. You probably shouldn’t do multi-cloud, [according to people like Corey Quinn](https://www.lastweekinaws.com/blog/multi-cloud-is-the-worst-practice/), because it makes everything more complicated with little benefit. You're probably not actually going to switch cloud providers. You probably won't even switch regions.
2. Thus, your startup probably shouldn't target multi-cloud users, because that's a self-limiting group.
Normally, I agree with both of those points. But here we are anyway with a bunch of multi-cloud AI customers. We got here because AI companies are the exception to rule #1: those pesky GPUs are a good reason to use multiple clouds. And Tailscale, though we’ve never thought of ourselves as a “multi-cloud infrastructure” company, happens to do well in that use case because of its mesh network and point-to-point "proxyless" connections.
Ironically, providing multi-cloud services has become a good business to be in, precisely because sensible people have avoided it. This looks like it will continue, as different clouds and services specialize in different speed/cost/latency tradeoffs. Future companies might put user-facing stuff in one cloud, inference in another, training in a third, and "AI at the Edge" in multiple locations. All that data needs to interconnect.
### [Kubernetes](#kubernetes)
Another surprise to me — perhaps I shouldn’t have been surprised — was how many of our AI-using customers are using k8s. They use it for training clusters, GPU allocation, query interference backends, and dev environments. At some companies, every dev gets a batch of GPUs in their own k8s cluster.
It turned out that usage by AI customers accelerated even more when we released a greatly improved version of our [Tailscale k8s operator](https://tailscale.com/kb/1236/kubernetes-operator) last year. For those who don’t know, our k8s operator lets you easily provide ingress for any number of k8s-hosted services directly over Tailscale, without needing extra layers of proxies. And it automatically registers them in DNS and gets each one its own TLS cert, and applies different ACLs to each type of service based on tags. And, you don't have to open any firewall ports.
Our PMs did some more research, and apparently multi-cloud plus k8s is a sweet spot for Tailscale even outside AI companies. Multi-cloud is hard, and connecting multi-cloud kubernetes clusters together is a nightmare. We fixed that combination by accident, by doing each of the two things well in ways that turned out to combine elegantly.
### [What else makes AI companies unusual](#what-else-makes-ai-companies-unusual)
We often ask customers: is there anything special about your company where we could make your use case even smoother? What could make Tailscale a more perfect fit for AI companies?
The universal answer was… not a lot. Most AI companies are, from their own point of view, just regular companies that have, as in the quote above, “a few servers with special capabilities, and some odd data stores.”
We got plenty of feature requests of course. But, upon analysis, it turned out that the top AI feature requests were ones we get elsewhere too. People wanted a better Pulumi provider, a declarative way to configure [Tailscale Funnel](https://tailscale.com/kb/1223/funnel), more language support in [tsnet](https://tailscale.dev/blog/tsup-tsnet), more ways to reference Tailscale ACLs inside their apps (such as [granting certain Tailscale users admin access to a dashboard](https://tailscale.dev/blog/id-headers-tailscale-serve-flask) and others regular user access), [more](https://tailscale.com/blog/crowdstrike) [tool](https://tailscale.com/kb/1327/mdm-microsoft-intune) [integrations](https://tailscale.com/kb/1407/kolide), and so on. We’ve fixed up some of those already, and are working hard on the rest.
### [Retroactive market segmentation](#retroactive-market-segmentation)
Many people we interviewed were apologetic: “Sorry I couldn’t help you more, but we just don’t need anything special, Tailscale is fine already.”
This situation is so rare — successfully finding product/market fit before you realize there is a market — that we [didn’t know how to respond](https://xkcd.com/55/) at first. We had to think about it. In the end, we realized: that’s the ideal case, isn’t it? Normally to approach a market segment, you have to fine-tune your product for them. But it’s not a bad thing if you don’t have to. It’s just an amazingly lucky coincidence, in the long string of lucky coincidences that created Tailscale. Instead, let's put work into writing it down, and combining the roadmap with the roadmaps from users in other segments.
I would like to tell you there’s a moral to this story. Let’s see. Uh, I guess, when opportunity knocks, answer the door.
And sign up for our [AI Startups Program](https://tailscale.com/ai-startup-program), it's an amazing deal.
\*: By the way, we’re up to 10,000 paying companies now.
\*\*: I’m using this footnote as a chance to say “[sell shovels](https://www.reddit.com/r/business/comments/18pjopf/there_is_a_saying_during_a_gold_rush_sell_shovels/)” because I know you were all thinking it anyway.
Share
Author
Avery Pennarun
Author
Avery Pennarun
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