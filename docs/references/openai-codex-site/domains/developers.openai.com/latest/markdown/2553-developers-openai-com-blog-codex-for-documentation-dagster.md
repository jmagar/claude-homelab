Using Codex for education at Dagster Labs | OpenAI Developers
Primary navigation
Search docs
### Suggested
responses createreasoning\_effortrealtimeprompt caching
Showcase Blog Cookbook Learn Community
* [ All posts ](/blog)
### Recent
* [ How Perplexity Brought Voice Search to Millions Using the Realtime API ](/blog/realtime-perplexity-computer)
* [ Designing delightful frontends with GPT-5.4 ](/blog/designing-delightful-frontends-with-gpt-5-4)
* [ From prompts to products: One year of Responses ](/blog/one-year-of-responses)
* [ Using skills to accelerate OSS maintenance ](/blog/skills-agents-sdk)
* [ Building frontend UIs with Codex and Figma ](/blog/building-frontend-uis-with-codex-and-figma)
### Topics
* [ General ](/blog/topic/general)
* [ API ](/blog/topic/api)
* [ Apps SDK ](/blog/topic/apps-sdk)
* [ Audio ](/blog/topic/audio)
* [ Codex ](/blog/topic/codex)
[API Dashboard](https://platform.openai.com/login)
Copy Page
Copy Page
At [Dagster Labs](https://dagster.io), we produce a lot of technical educational content for data engineers, machine learning engineers, and analysts to better understand how to use Dagster, an open source workflow orchestration framework. Because our users come from varied technical backgrounds, we’ve found it essential to meet each persona at the right technical depth.
In this post, I’ll share how we use OpenAI’s Codex to accelerate documentation, translate content across mediums, and even measure how complete our docs are.
## The power of CONTRIBUTING.md files
To make it easier for our community members and internal engineers to contribute documentation, we overhauled our [CONTRIBUTING.md](https://github.com/dagster-io/dagster/blob/3c2d36054f4014ca8316e533975a538d6eff62c4/docs/CONTRIBUTING.md) file. To our surprise, we had inadvertently significantly improved the utility of Codex. It turns out there is serious value in clearly outlining the hierarchy, structure, and best practices for writing documentation in your code base. Both for humans and robots.
```
`# Contributing documentation
## Content
### Links
#### Use full paths instead of relative links
Docusaurus doesn't always render relative links correctly, which can result in users seeing intermittent 404s when accessing those links. Use full paths instead of relative links, like this:
```
For more information, see "[Defining assets](/guides/build/assets/defining-assets)".
```
instead of this:
```
For more information, see "[Defining assets](defining-assets)".
```
#### Use non-trailing slash links to Dagster docs
e.g. use `/guides/build/assets/defining-assets` instead of `/guides/build/assets/defining-assets/`.
\*\*Context:\*\* Links to Dagster docs with trailing slashes automatically redirect to non-trailing slash links. While that's helpful for docs links we don't control, too many redirects on our own pages can confuse search engines and cause SEO issues.
### API documentation
...`
```
Codex is only as good as the scaffolding you give it. A well-structured CONTRIBUTING.md becomes both documentation for humans and a map for AI.
## Codex for understanding
Beyond writing docs, Codex can act as an always-available code explainer. For developer advocates and technical writers, this has been invaluable. In open source projects, or projects with many engineers, it can often be difficult to stay up-to-date on all of the features being developed, and how they work. This is especially true for smaller teams of developer advocates and technical writers. We’ve found that some of the best assistance Codex provides is through explaining pull requests, or pointing it to a part of the codebase and asking for an explanation.
A tip we’ve found here is to leverage the `gh` command from within Codex to explain pull requests. Ask it to review the PR description and diff, summarize why the feature was implemented, and explain how it should be exposed to end users.
## The power of the mono repo
This might be a controversial opinion, but I’m a big fan of mono repos. When context is key, having everything accessible in a single repository makes it so much easier to get access to what you need, and in the case of Codex, this means complete context: code, docs, and examples all in one place.
While some people have expressed concern about tools like Codex failing to scale with repositories, I’ve found this not to be the case. By making use of file references within Codex (`@`) you can give Codex the initial sub directory or file to start with before further exploration. And there are some serious benefits to having your framework code alongside your documentation in a single repository. This setup lets us prompt Codex to read framework code and draft initial documentation scaffolds that we can then refine.
Here’s an example where we prompted Codex to review an existing pull request, and add a section to the documentation on how exactly these environment variables are useful when configuring your deployment.
```
`\>\_ You are using OpenAI Codex in \~/src/dagster
To get started, describe a task or try one of these commands:
/init - create an AGENTS.md file with instructions for Codex
/status - show current session configuration and token usage
/approvals - choose what Codex can do without approval
/model - choose what model and reasoning effort to use
▌ Review the changes made in pull request 32557 using `gh pr diff \<number\>`, review the environment
▌ variables that were introduced and already exist for configuring the gRPC server, then update
▌ docs/docs/deployment/oss/oss-instance-configuration.md page to outline the configuration options.
\> I’ll fetch the diff for PR 32557 and scan for added/updated gRPC-related
environment variables, then cross-check with existing env var usage in the
repo.
• Ran gh pr diff 32557 | sed -n '1,200p'
• Ran gh pr diff 32557 | sed -n '200,400p'
• Explored
└ Search DAGSTER\_GRPC\_[A-Z\_]+ in dagster
Read api.py, code\_server.py, oss-instance-configuration.md
Search DAGSTER\_CODE\_SERVER\_[A-Z\_]+
Read constants.py
Search DAGSTER\_(REPOSITORY|SCHEDULE|SENSOR)\_GRPC\_TIMEOUT\_SECONDS|
DAGSTER\_GRPC\_SHUTDOWN\_GRACE\_PERIOD in dagster
Read proxy\_server\_manager.py
\> Next, I’ll expand the gRPC servers section of the instance configuration docs
to include API gRPC server variables and communication timeouts/limits, keeping
style consisten
...`
```
You can find the pull request that was produced by this session at [dagster-io/dagster # 32558](https://github.com/dagster-io/dagster/pull/32558).
## Translating between content mediums
Different personas prefer different learning formats, but the underlying ideas are often the same. Because of that, we produce a variety of content mediums: blog posts, tutorials, online courses, YouTube videos, and more. The core content of these materials can often be the same, just presented differently depending on the target persona.
Codex works exceptionally well at translating between these mediums. For example, taking a tutorial and producing a transcript for a YouTube video. Or taking a low-level tutorial, and abstracting it slightly for a blog post. In the below screenshot you can find an example prompt used to take one of our example projects and produce a video transcript. This approach saves hours of rewriting while keeping our messaging consistent across channels.
```
`\>\_ You are using OpenAI Codex in \~/src/dagster
▌Review the example project: examples/docs\_projects/project\_dagster\_modal\_pipes
▌and produce a video transcript to teach users the core Dagster and Modal concept
▌covered. Break the transcript into sections, and include code snippets to be
▌showcased in the video. The prose of the script should be fun but professional.
▌Save this to MODAL\_VIDEO\_TRANSCRIPT.md.
\> I’m going to scan the example project to understand its structure and code
before drafting the video transcript.
• Ran
└ bash -lc 'ls -la' bash -lc 'ls -la examples/docs\_projects/
project\_dagster\_modal\_pipes' bash -lc "rg --files examples/docs\_projects/
project\_dagster\_modal\_pipes | sed -n '1,120p'"
• Explored
└ List project\_dagster\_modal\_pipes
Search rg --files examples/docs\_projects/project\_dagster\_modal\_pipes
Read README.md, definitions.py, \_\_init\_\_.py, resources.py, constants.py,
feeds.py, pipeline\_factory.py, summarize.py, config.py, transcribe.py,
hello\_dagster.py, verify\_cloud\_mount.py
• Added MODAL\_VIDEO\_TRANSCRIPT.md (+335 -0)`
```
See the full video transcript [here](https://gist.github.com/cmpadden/a371c1300bdc42601a77b3eefb938483)!
## Evaluating documentation coverage
One of the more experimental ways we’re using Codex is as a proxy for human understanding.
By using documentation as the source-of-truth, and base context for Codex, we can have it generate code. For example, people often use Dagster for running and observing their dbt data models alongside other data processing code.
By prompting Codex to reference the documentation and produce the code for this project, we can then run a test suite on the resulting code to check that it operates as expected. If it works as expected we can assume that our documentation has adequate coverage of the required content. If Codex can generate working code purely from our documentation, it’s a strong signal that humans can as well which becomes an indirect measure of documentation completeness.
## Summary
All in all, the Dagster team has found Codex to be immensely helpful for creating, reviewing, and translating education content. It has enabled us to scale beyond our original capacity, helped us ensure that we have adequate documentation coverage as the framework evolves, and more importantly, it has made it so that we can more easily support our community.
Codex has underscored how important context and structure are. For us, that means refining our documentation architecture so both humans and AI can navigate it easily. This feedback loop, powered by AI, has improved both how we create content and how users generate framework code. As AI tools evolve, the line between documentation, code, and automation will blur. Teams that treat documentation as structured data will have a major advantage.