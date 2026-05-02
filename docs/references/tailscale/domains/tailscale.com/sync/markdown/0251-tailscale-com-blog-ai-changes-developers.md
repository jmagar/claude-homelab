AI changes people
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|insightsApril 15, 2025
# AI changes people
Avery Pennarun is the CEO and co-founder of Tailscale. In this article he gives some thought to the current AI space and how it impacts us as people, the code we write and how we test our software.
*Editor's Note: This article was updated on 4/17/2025 to replace an earlier version originally [posted to Forbes](https://www.forbes.com/councils/forbestechcouncil/2025/02/25/how-ai-changes-developers-and-the-code-they-write/) for a more general reader. This version is truer to Avery's initial intent and writing for Tailscaile's blog audience.*
Every technology changes us, depending on how we choose to adopt it. Computers changed how we handle bureaucracy. The Internet changed how we communicate. Search engines changed how we remember. GPS navigation changed our mental model of roads. Smartphones changed how we deal with boredom. Social media changed how we socialize. With each shift, we gain something—and we lose something, too.
AI-assisted software development is one of those shifts that’s fascinating to watch. It’s already here. Non-programmers are using it to write programs they otherwise couldn’t. Programmers are using it to automate tedious tasks or get example code for debugging instead of writing everything from scratch. But that’s just the first-order change. We haven’t fully integrated AI into our cognitive workflow yet. We’re at the stage where accountants are using calculators alongside handwritten ledgers.
Eventually, AI will change software development in two major ways. First, the obvious one: how (or whether) we type code into editors. Second, and more interestingly: the platforms, libraries, and frameworks themselves will evolve to be more usable by AIs. The code will change shape.
### [AIs can’t write Rust](#ais-cant-write-rust)
A couple of months ago, I asked on Twitter whether LLMs can write Rust yet. The responses were mixed. In short: LLMs are useful for writing Rust if you’re doing a back-and-forth with the compiler and treating the AI as a co-debugger. But once you get into trouble with the borrow checker, the LLM usually gives up. You’re on your own.
> Wait, I never hear about AIs writing rust. Are they able to outsmart the borrow checker yet?
> &mdash; apenwarr (@apenwarr)
[> November 14, 2024
](https://twitter.com/apenwarr/status/1856855176134504734?ref_src=twsrc^tfw)
Why can LLMs write syntactically correct Python and JavaScript on the first try, but not Rust? Well, the same question applies to humans. And we know how that debate goes.
Here’s the thing. When someone says people just need to "get better" at using the borrow checker, they’re assuming it’s an education problem. Maybe it is. But that solution doesn’t work for AIs. You can’t tell GPT-4 to “just learn more Rust.” You get what you get.
So what do you do when today’s AI can’t handle your preferred language or framework? You switch. You use something the AI *can* handle.
And the cool part is, unlike humans, we can measure how well an AI performs with a framework objectively. You pick a problem set, run the AI against it, and compare frameworks. That’s usability testing.
### [Usability testing, accelerated](#usability-testing-accelerated)
The first time a developer watches a usability test of their product, it’s brutal.
In a classic usability test, test users are given tasks and left to figure them out—no hints allowed. Ideally, developers sit behind a one-way mirror so they can’t intervene. And what you find is: the test users fail. They fail at things you thought were “easy.” It’s soul-crushing.
If you’re mature enough, you fix what broke, test again, and repeat until it works. Most teams never do this. Some will see one test, file a few bugs, maybe fix one or two, and move on.
Why? Because it’s expensive. You need new users each round. You burn through testers. And it’s emotionally hard.
AI changes that. You can reset an AI to its original, untrained state. Run tests over and over. Automatically. You can even machine-generate new docs or framework changes, and test them instantly. The feedback loop goes from days to seconds.
It’s just *easier* to optimize for AIs than for humans.
### [We always optimize the fastest feedback loops first](#we-always-optimize-the-fastest-feedback-loops-first)
Here’s a personal theory I haven’t written much about: too much software gets written, and not enough other types of engineering (buildings, infrastructure, clean manufacturing) happen—because software has the fastest feedback loops.
Everyone knows software is the fastest to iterate. That’s why we have Lean, Agile, Extreme Programming, etc. But here’s the twist: the systemic result might actually be *bad* for society. We’ve over-optimized for speed and neglected bigger problems that move more slowly.
Optimizing the 87th online expense report system doesn’t add much value over the 86th. But fixing supply chains, energy, and housing? That’s harder, slower, and more important. But people don’t do it—because the fast feedback and rewards are in software.
In tech, we say what gets measured gets optimized. And fast feedback loops depend on fast measurements. AI lets us build those loops faster than ever.
### [AIs will become the canonical user](#ais-will-become-the-canonical-user)
Usability is hard to measure. That’s why it’s slow to improve. A/B tests are faster. Viral loops are faster. So they win.
But now, we can run usability tests *on AIs* faster than we can A/B test a landing page.
So: platforms will increasingly be optimized around AIs. Because they are fast, repeatable test subjects. And that’s not necessarily bad, because—
### [AIs are pretty average](#ais-are-pretty-average)
AI research used to define AI as “anything computers can’t do yet.” That’s outdated. LLMs clearly write better essays and emails than many humans. Do they exceed the average person? Probably.
Do they exceed the best humans? Not yet. We’re not getting Einstein-level discoveries or perfect poetry. But they’re competent. They hallucinate like humans, and they know more facts than most humans.
And they have *styles*. Different LLMs behave differently, even without prompting. Which is interesting, because if you clone five people a billion times, you don’t get one genius—you get five average people.
### [On average, humans are also pretty average](#on-average-humans-are-also-pretty-average)
LLMs are trained on the full spectrum of human data—and that averages out. So they behave a lot like average humans.
That makes them *great* usability test subjects.
If you optimize your platform for AIs, it’ll likely become more usable for average people, too. And that’s exciting, because—
### [Software platforms are currently terrible for average people](#software-platforms-are-currently-terrible-for-average-people)
Look at what it takes to build and deploy modern software:
* Text editors
* Compilers/interpreters
* Libraries and frameworks
* CI/CD
* Containers
* Cloud infra
* Kubernetes
* Firewalls, DNS, load balancers, certs…
It’s a nightmare. No average person can learn all this quickly, and even experts make mistakes.
AIs currently help a bit with the basics. But everyone *wants* them to do more—to replace the “1x engineers” at scale. And because they’re consistent, you can optimize around them.
### [Software will get better](#software-will-get-better)
So the question is: which will happen first?
* LLMs improve enough to handle secure, production-ready Kubernetes deployments on AWS?
— *or* —
* We simplify our stack enough that today’s LLMs can do it?
I’m betting on the latter.
And that’s why I’m optimistic. LLMs might finally push us to make simpler, more secure, more usable software—not because it's noble, but because it’s *easier.*
I hope.
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