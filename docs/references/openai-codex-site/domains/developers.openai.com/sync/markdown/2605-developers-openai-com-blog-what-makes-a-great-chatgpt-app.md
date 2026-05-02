What makes a great ChatGPT app | OpenAI Developers
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
At DevDay we introduced [ChatGPT Apps](https://openai.com/index/introducing-apps-in-chatgpt/) — a new way to bring your product directly into ChatGPT conversations. This post builds on that launch with practical guidance for developers, PMs, and designers on how to choose the right use case and design an app that’s actually useful once it’s live. We’ll focus on how to translate your product’s strengths into clear, well-scoped capabilities the model can apply across many different conversations and user intents. If you’re looking for the technical details, you can jump straight into the [Apps SDK quickstart](https://developers.openai.com/apps-sdk/quickstart) and [developer docs](https://developers.openai.com/apps-sdk).
We’ll cover:
* What a ChatGPT app really is (and isn’t)
* The three ways an app can genuinely add value
* How to design for conversation and discovery
* How to know whether your app is actually helping
* Concrete examples and suggestions for screenshots
## What a ChatGPT app actually is
When teams build their first ChatGPT app, the starting point is often:
 *“We already have a product. Let’s bring it into ChatGPT.”*
This often starts with taking an existing web or mobile experience — screens, menus, flows — and trying to reshape it for chat. It’s a reasonable instinct; for years, “software” has meant pages, navigation, and UI scaffolding.
However, building apps for ChatGPT is a different environment. Users aren’t “opening” your app and starting on the home page. They’re having a conversation about something and the model can decide when to bring an app into that conversation. They’re entering at a point in time.
In that world, the best apps look surprisingly small from the outside. They don’t try to recreate the entire product. Instead, they allow users to access a few **specific powers** while using the app in ChatGPT: the concrete things your product does best that the model can reuse in any conversation.
Outside of ChatGPT, your app is often the destination. Users:
1. Tap your icon
2. Enter your environment
3. Learn your navigation and UI patterns
Most product decisions flow from that assumption: “We own the screen.” You can invest heavily in layout, onboarding, and information architecture because users are committing to your space.
Inside ChatGPT, your app plays a different role:
* It’s a **capability** the model can call - for both context and visual engagement.
* It shows up **inside** an ongoing conversation.
* It’s one of several tools the model may orchestrate.
That means the “unit of value” is less your overall experience and more the specific things you can help the model and user accomplish at the right moment.
A practical definition:
**A ChatGPT app is a set of well defined tools that can perform tasks, trigger interactions, or access data.**
This has a few implications:
* You don’t need to port every feature.
* You don’t need a full navigation hierarchy.
* You *do* need a clear, compact API: a handful of operations that are easy to invoke and easy to build on.
You can think of it this way: your ChatGPT app is a toolkit the model reaches for when the user runs into a specific type of problem. The more precisely that toolkit is defined, the easier it is to use in the flow of conversation.
Once you see your app as “capabilities the model can orchestrate,” rather than “a mini version of our product,” design decisions get clearer. You start asking “What can we help with here?” instead of “Where should the user go next?”
## The three ways to add real value
A simple filter for any app idea:
* **Know:** Does it let the user work with new context or data they couldn’t see otherwise in ChatGPT?
* **Do:** Does the app take real actions on the user’s behalf?
* **Show:** Does the app present information in a clearer, more actionable UI than plain text?
This applies to **“serious”** productivity apps and to **“just for fun”** apps like games. A game might not help someone ship a report faster, but it still does something the base model can’t do well on its own: maintain stateful game logic, track progress, enforce rules, or render interesting views of the game world. The value is delight and engagement, but the underlying pattern is the same.
### 1) New things to know
Your app makes new context available within a ChatGPT conversation:
* Live prices, availability, inventory
* Internal metrics, logs, analytics
* Specialized, subscription-gated, or niche datasets
* User-specific data (accounts, history, preferences, entitlements)
* Sensor data, live video streams
In practice, this often means bridging into systems where data is correct, current, and permissioned. The app becomes the “eyes and ears” of the model in your domain, and can answer questions with more authority.
### 2) New things to *do*
Your app takes actions on the user’s behalf:
* Create or update records in internal tools
* Send messages, tickets, approvals, notifications
* Schedule, book, order, or configure things
* Trigger workflows (deploy, escalate, sync data)
* Play interactive games (apply rules, advance turns, track state)
* Take actions in the physical world (IoT, robotics control, etc.)
Here, the app is less a source of truth and more a pair of hands. It takes the user’s intent and turns it into concrete changes in the systems your team already lives in—or, in the case of games, concrete changes in the game state that make the experience feel consistent and fair. This is where your app shifts to an agent in a meaningful way.
### 3) Better ways to show
An app can present information in a GUI in a ChatGPT conversation, that makes the information more digestible or more actionable:
* Shortlists, comparisons, rankings
* Tables, timelines, charts
* Role-specific or decision-specific summaries
* Visual or structured views of game state (boards, inventories, scores)
This is especially valuable when users are making choices or trade-offs. Apps can give the model a language for structure: widgets that have columns, rows, scores, and visuals that match how people actually decide—or, in games, how they understand “where they are” in the world.
If an app doesn’t clearly move the needle on at least one of **know/do/show**, it tends to feel like it’s not adding value beyond what users can already do in ChatGPT. Users may not complain explicitly, but it’s a missed opportunity to provide more meaningful value to the user, whether the app is meant for work or play.
Here you can see an example of an experience enhanced by an app:
An example answer from ChatGPT
This answer is helpful, however, the user may want to use an app with additional capabilities to directly browse real properties without changing context or leaving the conversation.
Answer with the Zillow app
With the Zillow app, the user has the additional ability to search live property listings, filter by criteria, and view rich property details — all without leaving the chat.
Fullscreen mode for enriched discovery
The value here is you still get rich context from the model, and also an enriched app experience that can dynamically interact with your intent. Want to ask it for homes in a specific region? With the Zillow app, the model invokes the tool on the Zillow MCP server and re-renders the UI layer.
## Select capabilities, don’t port your product
A common first thought is to list all of your product’s features and ask, “How do we bring these into ChatGPT?”
On paper, that sounds thorough. In practice, it usually produces a large, fuzzy surface area that’s hard for the model to navigate and hard for users to understand. If you struggle to summarize what the app does in one sentence, the model too will have a harder time understanding it.
A more effective path:
1. **List the core jobs-to-be-done -** Identify the specific tasks or outcomes users are trying to accomplish that your product helps make possible. These are the reasons your product exists in the first place. Starting here keeps you anchored in user outcomes instead of feature checklists.
Examples:
* Help someone choose a home.
* Empower ideas into polished presentations.
* Translate intent into a delightful discovery experience.
* Turn raw data into a clear, shareable report.
* For each job, ask:
“Without an app, what can’t the user do within a ChatGPT conversation?”
Common answers:
* Access live or private data.
* Take real actions in our systems.
* Get the structured or visual output users need.
* This is where your unique value starts to show up. You’re no longer thinking “What can we technically expose?” but “Where are we uniquely helpful?”
* Turn those gaps into a handful of **clearly named operations**. For example:
* `search\_properties` – return a structured list of candidate homes.
* `explain\_metric\_change` – fetch relevant data and summarize likely drivers.
* `generate\_campaign\_variants` – create multiple ad variants with metadata.
* `create\_support\_ticket` – open a ticket and return a summary + link.
These operations are:
* Concrete enough for the model to choose confidently
* Simple enough to mix with other steps in a conversation
* Directly tied to value, not to your entire product map
Another way to think about this: if someone on your team asked, “What are the three things we absolutely need this app to do well?” those should map almost one-to-one to your product’s capabilities.
For example, the Canva app in ChatGPT can generate an entire presentation draft and the user can enter full screen mode that matches user expectations for navigating a slide deck, but deeper slide-by-slide editing still happens in the full Canva editor.
## Design for conversation and discovery
In your MCP server, you can define the [`description`](https://developers.openai.com/apps-sdk/reference#component-resource-_meta-fields) that provides the model with context when to invoke your tool, and specifically which tool calls, to perform a specific task. This helps map user intent to your tools actions.
### a) Vague intent
>
> Help me figure out where to live.
>
A good app response will:
* Use any relevant context already in the thread.
* Ask one or two clarifying questions at most, if needed.
* Produce something concrete quickly — for example, a few example cities with short explanations.
The user should feel like progress has started, not like they’ve been dropped into a multi-step onboarding flow. If they have to answer five questions before seeing anything useful, many will simply stop.
Let’s take a look at how that is handled in the **Canva** app:
Building a full scale presentation requires context. The Canva app asks for follow up questions to get the user to synthesize what they’re looking to build.
### b) Specific intent
>
> Find 3-bedroom homes in Seattle under $1.2M near well-rated elementary schools.
>
Here, the app shouldn’t ask the user to repeat themselves. It should:
* Parse the query.
* Call the right capabilities.
* Return a focused set of results with useful structure.
You can still offer refinements (“Do you care more about commute or school rating?”), but they should feel like optional tuning, not required setup.
**Canva example:**
When the user’s intent becomes clear and asks to generate a presentation, the model knows exactly when to call Canva and what capability to invoke.
As seen below, the tool shares a few options and also probes deeper if the user wants additional refinements:
### c) No brand awareness
You can’t assume the user knows who you are.
Your first meaningful response should:
* Explain your app’s role in one line (“I pull live listings and school ratings so you can compare options.”)
* Deliver useful output right away.
* Offer a clear next step (“Ask me to narrow by commute, neighborhood, or budget.”)
Think of it as a cold start problem: you’re introducing *what* you are, *why* you’re helpful, and *how* to use you — all inside one or two messages.
## Build for the model as well as the user
You’re designing for two audiences:
* The human in the chat
* The model runtime that decides when and how to call your app
Most teams are comfortable thinking about the first. The second is newer. But if the model can’t understand what your app does or how to use it, your human-facing experience won’t get many chances to run.
There’s a third dimension that matters just as much: **what user data flows through your app when the model calls it.** Good app design isn’t just about clear capabilities, it’s about being disciplined in *what* you ask for and *how* you use it.
* **Clear, descriptive actions and parameters:** Make it obvious when your app is relevant and how to call it. Use straightforward names (`search\_jobs`, `get\_rate\_quote`, `create\_ticket`) and spell out which params are required vs. optional and how to format them. Ambiguity is a tax on routing.
* **Privacy by design:** Only require fields you truly need. Avoid “blob” params that scoop up extra context. Prefer minimal, structured inputs and do not use instructions like “just send the whole conversation.”
* **Predictable, structured outputs:** Keep schemas stable; include IDs and clear field names. Pair a brief summary (“Three options that match your budget and commute time”) with a machine-friendly list (`[{id, address, price, commute\_minutes, school\_rating, url}, …]`). This lets the model talk naturally while keeping precise handles on data.
* **Be intentional about what you do *not* return:** Skip sensitive internals “just in case.” Keep tokens/secrets out of user-visible paths. Redact or aggregate when full fidelity isn’t necessary.
* **Be explicit about what you collect and why:** Ask for the minimum to do the job. When you need something sensitive (e.g., account access), say why in one sentence. Design actions and schemas so it’s obvious what’s being sent where.
## Design for an ecosystem, not a walled garden
In a real ChatGPT session, your app is rarely the only one in play. The model might call on multiple apps in the same conversation.
From the user’s perspective, it’s one flow. From your perspective, it’s a reminder that you’re part of an ecosystem, not a sealed product.
A few practical consequences:
* Keep actions **small and focused**
* `search\_candidates`, `score\_candidates`, `send\_outreach`
* rather than a single `run\_full\_recruiting\_pipeline`.
* Make outputs **easy to pass along**
* Stable IDs, clear field names, consistent structures.
* Avoid hiding important information only in free-form text.
* Avoid long, tunnel-like flows
* Do your part of the job and hand control back to the conversation.
* Let the model decide which tool should handle the next step.
If other apps (or future versions of your own app) can easily build on your outputs, you’ve set yourself up to benefit from improvements elsewhere in the ecosystem instead of competing with them.
## A quick checklist
A short checklist you can run before or after building:
* **1. New powers**
* Does your app clearly know, do, or show new things?
* Would users in your target scenarios notice if it stopped working?
* **2. Focused surface**
* Have you picked a small set of capabilities instead of cloning your entire product?
* Are those capabilities named and scoped in ways that map cleanly to real jobs-to-be-done?
* **3. First interaction**
* Does your app handle both vague and specific prompts gracefully?
* Can a new user understand your role from the first meaningful response?
* Do they see value on the first turn?
* **4. Model-friendliness**
* Are actions and parameters clear and unambiguous?
* Are outputs structured and consistent enough to chain and reuse?
* **5. Evaluation**
* Do you have a small, thoughtful test set with positive, negative, and edge cases?
* Do you have some notion of the win rate of the app-provided answer vs. the ChatGPT answer without the app?
* **6. Ecosystem fit**
* Can other apps and the user reasonably build on your output?
* Are you comfortable being one link in a multi-app chain, rather than the whole journey?
You don’t need to be perfect in every dimension to ship. But if you can answer “yes” to most of these, you’re not just putting your product inside ChatGPT, you’re giving ChatGPT real leverage in your domain — and that’s where these apps start to feel indispensable.