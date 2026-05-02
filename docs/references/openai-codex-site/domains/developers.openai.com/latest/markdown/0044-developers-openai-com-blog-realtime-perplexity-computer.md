How Perplexity Brought Voice Search to Millions Using the Realtime API | OpenAI Developers
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
At Perplexity, we care a lot about building products that feel amazing to use. For [Perplexity Comet](https://www.perplexity.ai/comet), our agentic browser, and [Perplexity Computer](https://www.perplexity.ai/products/computer), our powerful, general-purpose digital worker, a big part of that was making these fully usable through voice. There is something uniquely satisfying about being able to just say what you want, hand off the task, and watch it go. We are bullish on voice as an interface because it makes the actual interaction feel a little closer to magic.
We used [Realtime-1.5](https://developers.openai.com/api/docs/guides/realtime) in production to bring that magic to the millions of voice sessions Perplexity manages every month. Watching the growth of voice through Computer’s interface has been incredibly exciting and educational. We’ll share a few of the surprising things we’ve learned so far. We encourage you to try [Realtime-1.5](https://developers.openai.com/api/docs/models/gpt-realtime-1.5) and share what you learn with us too.
Your browser does not support the video tag.
## 1. Figure Out Your Context Management Strategy
Long-form content, especially dense multi-hour podcasts, was one of our clearest tests of context management. We wanted to make podcast transcripts usable through voice so a user could jump in, ask what was happening at a specific moment two and a half hours in, and get a coherent answer.
You can’t fit the whole transcript into context. Our first pass was to send it in large chunks. We quickly found that large updates fail in an all-or-nothing way. If you try to send a 10,000-token update into a window that only has room for 5,000 more tokens, the model will lose all of the preceding history. That made large chunks much riskier because one oversized update could wipe out a whole block of context instead of letting the system forget more gracefully.
So we changed the approach. Instead of large updates, we started breaking everything into much smaller 2,000 token chunks and feeding them incrementally. This is more overhead, but the behavior is much more stable. When truncation does happen it trims a bit of history instead of wiping everything out.
One other subtle thing we learned was that not all context should enter the model in the same way. When using `conversation.item.create` to update context, the `item.type: "message"` has three roles: `system`, `user`, and `assistant`. These roles tell the model what kind of message it is seeing. `system` is for instructions and behavior shaping, `user` is for end-user input, and `assistant` is for model-generated output.
When we got this wrong the interaction started to feel off. If too much context came in as `user`, the model behaved as though the user was narrating every block of text, including webpage snippets and comments, instead of simply asking a question grounded in that material. If too much came in as `system`, the opposite happened. The model lost the distinction between what it inherently “knew,” what had been supplied as context, and what the user was actually asking in the moment.
A good example is browsing flows. As someone scrolls through a page we continuously update the model with what’s on screen. If all of that is framed as user input, the model starts acting like the user said each paragraph out loud. That is not the right mental model. We want the system to feel like it is aware of the page in the background, and then answer naturally when the user asks something. That ended up being less about raw context volume and more about getting the conversation semantics correct.
## 2. Standardize Audio Across Product Surfaces
Perplexity has multiple product surfaces, such as Ask, Comet, and Computer. Each is built on a different client stack. Swift, TypeScript, Rust, and C++ can all produce different native audio buffers. When we let every client send its own raw or native audio format to the Realtime API, this led to inconsistencies in performance.
We eventually built an SDK in Rust to abstract away those platform-specific differences and make sure every client sent the API the same audio contract. In practice, that meant processing the waveform before it ever reached the server: resampling to 48 kHz mono, matching Opus codec preference and WebRTC’s internal rate, running it through WebRTC APM for echo cancellation, automatic gain control, noise reduction, and high-pass filtering, then encoding for transport. The SDK gave us one place to standardize audio constants, resample, and set up the full processing pipeline instead of doing it client by client.
## 3. Tune for the Messy Environment
It is important to tune VAD in the environment users live in. That means calibrating against real microphones, speaker volume, and background noise. One of our internal test cases was a noisy San Francisco bar because that felt like a real product moment. Someone says, “did you try the new Perplexity app?”. Their friend pulls out their phone and if voice fails we’ve just lost two users. When it works, the reaction is closer to “holy s\*\*t”. That was a useful forcing function for us. What works in clean conditions often breaks in the real world. It is better to tune for the messy environment first.
One of the hardest parts of voice UX was getting pauses right. People naturally stop to think, pull something up on screen, or get ready to read something aloud. The model can easily treat that pause as the end of the turn and jump in too early. We saw this in cases like someone asking for help with a maths derivation. They’d pause to find the formula only for the model to jump in before they finished their question. That is what led us to voice lock. Rather than using a traditional push-to-talk approach where voice is off by default and the user has to press to speak, we invert it. The interaction stays ambient by default, but when the user wants to hold the floor for a moment they can lock the voice and take ownership of the turn. We also see this as more than a one-off feature. As voice interfaces move into more complicated workflows, we believe some version of this interaction pattern will become standard.
## 4. Use Only Core Tools and Keep Them In Distribution
Narrow the toolset to the few tools that matter most, which in our case meant under ten. We focused on a small core set that covered the highest-value actions. That trade-off made sense and is likely to get better as newer snapshots improve.
We added explicit instructions in our system prompt on when and how each tool should be called. We were careful to keep both the tool schemas and the outputs in distribution for the model. In practice, that meant formatting tool outputs like ordinary structured tool data rather than like assistant dialogue. We returned structured JSON with clearly separated fields, such as `response\_text` for the user-facing utterance and flags like `require\_repeat\_verbatim` for behavior, instead of mixing spoken content with inline instructions. That made tool use more stable and kept the interaction pattern closer to what the model had likely seen during training.
```
`// Good:`
```
```
`{
"response\_text": "I kicked-off the task to create a market research dashboard",
"require\_repeat\_verbatim": true
}`
```
```
`// Avoid:
I kicked-off the task to create a market research dashboard
# Response Instructions
Read the above instructions EXACTLY as they are`
```
## Realtime is Ready
Realtime-1.5 is an inflection point for the industry. There are certainly areas of improvement with handling long context, more tools, and intelligence-heavy tasks. But we expect the models to get better. At Perplexity, we think about building for that future today. We want to make today’s systems usable while preparing for the next wave of Realtime models and the new voice experiences they will unlock.