Realtime Prompting Guide
Primary navigation
Search docs
### Suggested
responses createreasoning\_effortrealtimeprompt caching
Showcase Blog Cookbook Learn Community
* [ Home ](/cookbook)
### Topics
* [ Agents ](/cookbook/topic/agents)
* [ Evals ](/cookbook/topic/evals)
* [ Multimodal ](/cookbook/topic/multimodal)
* [ Text ](/cookbook/topic/text)
* [ Guardrails ](/cookbook/topic/guardrails)
* [ Optimization ](/cookbook/topic/optimization)
* [ ChatGPT ](/cookbook/topic/chatgpt)
* [ Codex ](/cookbook/topic/codex)
* [ gpt-oss ](/cookbook/topic/gpt-oss)
### Contribute
* [ Cookbook on GitHub ](https://github.com/openai/openai-cookbook)
[API Dashboard](https://platform.openai.com/login)
Copy Page
Copy Page
Feb 25, 2026
# Realtime Prompting Guide
[ MH ](https://www.linkedin.com/in/minhajul-hoque-83242b163/)
[ Minhajul Hoque ](https://www.linkedin.com/in/minhajul-hoque-83242b163/)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/Realtime_prompting_guide.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/Realtime_prompting_guide.ipynb)
Today, we’re releasing gpt-realtime — our most capable speech-to-speech model yet in the API and announcing the general availability of the Realtime API.
Speech-to-speech systems are essential for enabling voice as a core AI interface. The new release enhances robustness and usability, giving enterprises the confidence to deploy mission-critical voice agents at scale.
The new gpt-realtime model delivers stronger instruction following, more reliable tool calling, noticeably better voice quality, and an overall smoother feel. These gains make it practical to move from chained approaches to true realtime experiences, cutting latency and producing responses that sound more natural and expressive.
Realtime model benefits from different prompting techniques that wouldn’t directly apply to text based models. This prompting guide starts with a suggested prompt skeleton, then walks through each part with practical tips, small patterns you can copy, and examples you can adapt to your use case.
```
`# !pip install ipython jupyterlab
from IPython.display import Audio, display`
```
# General Tips
* **Iterate relentlessly**: Small wording changes can make or break behavior.
* Example: For unclear audio instruction, we swapped “inaudible” → “unintelligible” which improved noisy input handling.
* **Prefer bullets over paragraphs**: Clear, short bullets outperform long paragraphs.
* **Guide with examples**: The model strongly closely follows sample phrases.
* **Be precise**: Ambiguity or conflicting instructions = degraded performance similar to GPT-5.
* **Control language**: Pin output to a target language if you see unwanted language switching.
* **Reduce repetition**: Add a Variety rule to reduce robotic phrasing.
* **Use capitalized text for emphasis**: Capitalizing key rules makes them stand out and easier for the model to follow.
* **Convert non-text rules to text**: instead of writing “IF x \> 3 THEN ESCALATE”, write, “IF MORE THAN THREE FAILURES THEN ESCALATE”.
# Prompt Structure
Organizing your prompt makes it easier for the model to understand context and stay consistent across turns. Also makes it easier for you to iterate and modify problematic sections.
* **What it does**: Use clear, labeled sections in your system prompt so the model can find and follow them. Keep each section focused on one thing.
* **How to adapt**: Add domain-specific sections (e.g., Compliance, Brand Policy). Remove sections you don’t need (e.g., Reference Pronunciations if not struggling with pronunciation).
Example
```
`# Role & Objective — who you are and what “success” means
# Personality & Tone — the voice and style to maintain
# Context — retrieved context, relevant info
# Reference Pronunciations — phonetic guides for tricky words
# Tools — names, usage rules, and preambles
# Instructions / Rules — do’s, don’ts, and approach
# Conversation Flow — states, goals, and transitions
# Safety & Escalation — fallback and handoff logic`
```
# Role and Objective
This section defines who the agent is and what “done” means. The examples show two different identities to demonstrate how tightly the model will adhere to role and objective when they’re explicit.
* **When to use**: The model is not taking on the persona, role, or task scope you need.
* **What it does**: Pins identity of the voice agent so that its responses are conditioned to that role description
* **How to adapt**: Modify the role based on your use case
### Example (model takes on a specific accent)
```
`# Role & Objective
You are french quebecois speaking customer service bot. Your task is to answer the user's question.`
```
This is the audio from our old `gpt-4o-realtime-preview-2025-06-03`
```
`Audio("./data/audio/obj\_06.mp3")`
```
Your browser does not support the audio element.
This is the audio from our new GA model `gpt-realtime`
```
`Audio("./data/audio/obj\_07.mp3")`
```
Your browser does not support the audio element.
### Example (model takes on a character)
```
`# Role & Objective
You are a high-energy game-show host guiding the caller to guess a secret number from 1 to 100 to win 1,000,000$.`
```
This is the audio from our old `gpt-4o-realtime-preview-2025-06-03`
```
`Audio("./data/audio/obj\_2\_06.mp3")`
```
Your browser does not support the audio element.
This is the audio from our new GA model `gpt-realtime`
```
`Audio("./data/audio/obj\_2\_07.mp3")`
```
Your browser does not support the audio element.
The new realtime model is able to better enact the role.
# Personality and Tone
The newer model snapshot is really great at following instructions to imitate a particular personality or tone. You can tailor the voice experience and delivery depending on what your use case expects.
* **When to use**: Responses feel flat, overly verbose, or inconsistent across turns.
* **What it does**: Sets voice, brevity, and pacing so replies sound natural and consistent.
* **How to adapt**: Tune warmth/formality and default length. For regulated domains, favor neutral precision. Add other subsections that are relevant to your use case.
### Example
```
`# Personality & Tone
## Personality
- Friendly, calm and approachable expert customer service assistant.
## Tone
- Warm, concise, confident, never fawning.
## Length
2–3 sentences per turn.`
```
### Example (multi-emotion)
```
`# Personality & Tone
- Start your response very happy
- Midway, change to sad
- At the end change your mood to very angry`
```
This is the audio from our new GA model `gpt-realtime`
```
`Audio("./data/audio/multi-emotion.mp3")`
```
Your browser does not support the audio element.
The model is able to adhere to the complex instructions and switch from 3 emotions throughout the audio response.
## Speed Instructions
In the Realtime API, the `speed` parameter changes playback rate, not how the model composes speech. To actually sound faster, add instructions that can guide the pacing.
* **When to use**: Users want faster speaking voice; playback speed (with speed parameter) alone doesn’t fix speaking style.
* **What it does**: Tunes speaking style (brevity, cadence) independent of client playback speed.
* **How to adapt**: Modify speed instruction to meet use case requirements.
### Example
```
`# Personality & Tone
## Personality
- Friendly, calm and approachable expert customer service assistant.
## Tone
- Warm, concise, confident, never fawning.
## Length
- 2–3 sentences per turn.
## Pacing
- Deliver your audio response fast, but do not sound rushed.
- Do not modify the content of your response, only increase speaking speed for the same response.`
```
This is the audio from our old `gpt-4o-realtime-preview-2025-06-03` with speed instructions
```
`Audio("./data/audio/pace\_06.mp3")`
```
Your browser does not support the audio element.
This is the audio from our new GA model `gpt-realtime` with speed instructions
```
`Audio("./data/audio/pace\_07.mp3")`
```
Your browser does not support the audio element.
The audio for the new realtime model is noticeably faster in pace (without sounding too hurried!).
## Language Constraint
Language constraints ensure the model consistently responds in the intended language, even in challenging conditions like background noise or multilingual inputs.
* **When to use**: To prevent accidental language switching in multilingual or noisy environments.
* **What it does**: Locks output to the chosen language to prevent accidental language changes.
* **How to adapt**: Switch “English” to your target language; or add more complex instructions based on your use case.
### Example (pinning to one language)
```
`# Personality & Tone
## Personality
- Friendly, calm and approachable expert customer service assistant.
## Tone
- Warm, concise, confident, never fawning.
## Length
- 2–3 sentences per turn.
## Language
- The conversation will be only in English.
- Do not respond in any other language even if the user asks.
- If the user speaks another language, politely explain that support is limited to English.`
```
This is the responses after applying the instruction using `gpt-realtime`
### Example (model teaches a language)
```
`# Role & Objective
- You are a friendly, knowledgeable voice tutor for French learners.
- Your goal is to help the user improve their French speaking and listening skills through engaging conversation and clear explanations.
- Balance immersive French practice with supportive English guidance to ensure understanding and progress.
# Personality & Tone
## Personality
- Friendly, calm and approachable expert customer service assistant.
## Tone
- Warm, concise, confident, never fawning.
## Length
- 2–3 sentences per turn.
## Language
### Explanations
Use English when explaining grammar, vocabulary, or cultural context.
### Conversation
Speak in French when conducting practice, giving examples, or engaging in dialogue.`
```
This is the responses after applying the instruction using `gpt-realtime`
The model is able to easily code switch from one language to another based on our custom instructions!
## Reduce Repetition
The realtime model can follow sample phrases closely to stay on-brand, but it may overuse them, making responses sound robotic or repetitive. Adding a repetition rule helps maintain variety while preserving clarity and brand voice.
* **When to use**: Outputs recycle the same openings, fillers, or sentence patterns across turns or sessions.
* **What it does**: Adds a variety constraint—discourages repeated phrases, nudges synonyms and alternate sentence structures, and keeps required terms intact.
* **How to adapt**: Tune strictness (e.g., “don’t reuse the same opener more than once every N turns”), whitelist must-keep phrases (legal/compliance/brand), and allow tighter phrasing where consistency matters.
### Example
```
`# Personality & Tone
## Personality
- Friendly, calm and approachable expert customer service assistant.
## Tone
- Warm, concise, confident, never fawning.
## Length
- 2–3 sentences per turn.
## Language
- The conversation will be only in English.
- Do not respond in any other language even if the user asks.
- If the user speaks another language, politely explain that support is limited to English.
## Variety
- Do not repeat the same sentence twice.
- Vary your responses so it doesn't sound robotic.`
```
This is the responses **before** applying the instruction using `gpt-realtime`. The model repeats the same confirmation `Got it`.
This is the responses **after** applying the instruction using `gpt-realtime`
Now the model is able to vary its responses and confirmation and not sound robotic.
# Reference Pronunciations
This section covers how to ensure the model pronounces important words, numbers, names, and terms correctly during spoken interactions.
* **When to use**: Brand names, technical terms, or locations are often mispronounced.
* **What it does**: Improves trust and clarity with phonetic hints.
* **How to adapt**: Keep to a short list; update as you hear errors.
### Example
```
`# Reference Pronunciations
When voicing these words, use the respective pronunciations:
- Pronounce “SQL” as “sequel.”
- Pronounce “PostgreSQL” as “post-gress.”
- Pronounce “Kyiv” as “KEE-iv.”
- Pronounce "Huawei" as “HWAH-way”`
```
This is the audio from our old `gpt-4o-realtime-preview-2025-06-03` using the reference pronunciations.
It is unable to reliably pronounce SQL as “sequel” as instructed in the system prompt.
```
`Audio("./data/audio/sql\_before.mp3")`
```
Your browser does not support the audio element.
This is the audio from our new GA model `gpt-realtime` using the reference pronunciations.
It is able to correctly pronounce SQL as “sequel”.
```
`Audio("./data/audio/sql\_after.mp3")`
```
Your browser does not support the audio element.
## Alphanumeric Pronunciations
Realtime S2S can blur or merge digits/letters when reading back key info (phone, credit card, order IDs). Explicit character-by-character confirmation prevents mishearing and drives clearer synthesis.
* **When to use**: If the model is struggling capturing or reading back phone numbers, card numbers, 2FA codes, order IDs, serials, addresses/unit numbers, or mixed alphanumeric strings.
* **What it does**: Forces the model to speak one character at a time (with separators), then confirms with the user and re-confirm after corrections. Optionally uses a phonetic disambiguator for letters (e.g., “A as in Alpha”).
### Example (general instruction section)
```
`# Instructions/Rules
- When reading numbers or codes, speak each character separately, separated by hyphens (e.g., 4-1-5).
- Repeat EXACTLY the provided number, do not forget any.`
```
*Tip: If you are following a conversation flow prompting strategy, you can specify which conversation state needs to apply the alpha-numeric pronunciations instruction.*
### Example (instruction in conversation state)
*(taken from the conversation flow of the prompt of our [openai-realtime-agents](https://github.com/openai/openai-realtime-agents/blob/main/src/app/agentConfigs/customerServiceRetail/authentication.ts))*
```
`{
"id": "3\_get\_and\_verify\_phone",
"description": "Request phone number and verify by repeating it back.",
"instructions": [
"Politely request the user’s phone number.",
"Once provided, confirm it by repeating each digit and ask if it’s correct.",
"If the user corrects you, confirm AGAIN to make sure you understand.",
],
"examples": [
"I'll need some more information to access your account if that's okay. May I have your phone number, please?",
"You said 0-2-1-5-5-5-1-2-3-4, correct?",
"You said 4-5-6-7-8-9-0-1-2-3, correct?"
],
"transitions": [{
"next\_step": "4\_authentication\_DOB",
"condition": "Once phone number is confirmed"
}]
}`
```
This is the responses **before** applying the instruction using `gpt-realtime`
>
> Sure! The number is 55119765423. Let me know if you need anything else!
>
This is the responses **after** applying the instruction using `gpt-realtime`
>
> Sure! The number is: 5-5-1-1-1-9-7-6-5-4-2-3. Please let me know if you need anything else!
>
# Instructions
This section covers prompt guidance around instructing your model to solve your task and potentially best practices and how to fix possible problems.
Perhaps unsurprisingly, we recommend prompting patterns that are similar to [GPT-4.1 for best results](https://cookbook.openai.com/examples/gpt4-1_prompting_guide).
## Instruction Following
Like GPT-4.1 and GPT-5, if the instructions are conflicting, ambiguous or not clear, the new realtime model will perform worse
* **When to use**: Outputs drift from rules, skip phases, or misuse tools.
* **What it does**: Uses an LLM to point out ambiguity, conflicts, and missing definitions before you ship.
### **Instructions Quality Prompt (can be used in ChatGPT or with API)**
Use the following prompt with GPT-5 to identify problematic areas in your prompt that you can fix.
```
`## Role & Objective
You are a \*\*Prompt-Critique Expert\*\*.
Examine a user-supplied LLM prompt and surface any weaknesses following the instructions below.
## Instructions
Review the prompt that is meant for an LLM to follow and identify the following issues:
- Ambiguity: Could any wording be interpreted in more than one way?
- Lacking Definitions: Are there any class labels, terms, or concepts that are not defined that might be misinterpreted by an LLM?
- Conflicting, missing, or vague instructions: Are directions incomplete or contradictory?
- Unstated assumptions: Does the prompt assume the model has to be able to do something that is not explicitly stated?
## Do \*\*NOT\*\* list issues of the following types:
- Invent new instructions, tool calls, or external information. You do not know what tools need to be added that are missing.
- Issues that you are unsure about.
## Output Format
"""
# Issues
- Numbered list; include brief quote snippets.
# Improvements
- Numbered list; provide the revised lines you would change and how you would change them.
# Revised Prompt
- Revised prompt where you have applied all your improvements surgically with minimal edits to the original prompt
"""`
```
### **Prompt Optimization Meta Prompt (can be used in ChatGPT or with API)**
This meta-prompt helps you improve your base system prompt by targeting a specific failure mode. Provide the current prompt and describe the issue you’re seeing, the model (GPT-5) will suggest refined variants that tighten constraints and reduce the problem.
```
`Here's my current prompt to an LLM:
[BEGIN OF CURRENT PROMPT]
{CURRENT\_PROMPT}
[END OF CURRENT PROMPT]
But I see this issue happening from the LLM:
[BEGIN OF ISSUE]
{ISSUE}
[END OF ISSUE]
Can you provide some variants of the prompt so that the model can better understand the constraints to alleviate the issue?`
```
## No Audio or Unclear Audio
Sometimes the model thinks it hears something and tries to respond. You can add a custom instruction telling the model on how to behave when it hears unclear audio or user input. Modify the desire behaviour to fit your use case (maybe you don’t want the model to ask for a clarification, but to repeat the same question for example)
* **When to use**: Background noise, partial words, or silence trigger unwanted replies.
* **What it does**: Stops spurious responses and creates graceful clarification.
* **How to adapt**: Choose whether to ask for clarification or repeat the last question depending on use case.
### Example (coughing and unclear audio)
```
`# Instructions/Rules
...
## Unclear audio
- Always respond in the same language the user is speaking in, if unintelligible.
- Only respond to clear audio or text.
- If the user's audio is not clear (e.g. ambiguous input/background noise/silent/unintelligible) or if you did not fully hear or understand the user, ask for clarification using {preferred\_language} phrases.`
```
This is the responses **after** applying the instruction using `gpt-realtime`
```
`Audio("./data/audio/unclear\_audio.mp3")`
```
Your browser does not support the audio element.
In this example, the model asks for clarification after my *(very)* loud cough and unclear audio.
## Background Music or Sounds
Occasionally, the model may generate unintended background music, humming, rhythmic noises, or sound-like artifacts during speech generation. These artifacts can diminish clarity, distract users, or make the assistant feel less professional. The following instructions helps prevent or significantly reduce these occurrences.
* **When to use**: Use when you observe unintended musical elements or sound effects in Realtime audio responses.
* **What it does**: Steers the model to avoid generating these unwanted audio artifacts.s
* **How to adapt**: Adjust the instruction to try to explicitly suppress the specific sound patterns you are encountering.
### Example
```
`# Instructions/Rules
...
- Do not include any sound effects or onomatopoeic expressions in your responses.`
```
# Tools
Use this section to tell the model how to use your functions and tools. Spell out when and when not to call a tool, which arguments to collect, what to say while a call is running, and how to handle errors or partial results.
## Tool Selection
The new Realtime snapshot is really good at instruction following. However, this means if you have conflicting instructions in your prompt to what the model is expecting, such as mentioning tools in your prompt NOT passed in the tools list, it can lead to bad responses.
* **When to use**: Prompts mention tools that aren’t actually available.
* **What it does**: Review available tools and system prompt to ensure it aligns
### Example
```
`# Tools
## lookup\_account(email\_or\_phone)
...
## check\_outage(address)
...`
```
We need to ensure the tool list has the same availability tools and **the descriptions do not contradict each other**:
```
`[
{
"name": "lookup\_account",
"description": "Retrieve a customer account using either an email or phone number to enable verification and account-specific actions.",
"parameters": {
...
},
{
"name": "check\_outage",
"description": "Check for network outages affecting a given service address and return status and ETA if applicable.",
"parameters": {
...
}
]`
```
## Tool Call Preambles
Some use cases could benefit from the Realtime model providing an audio response at the same time as calling a tool. This leads to a better user experience, masking latency. You can modify the sample phrase to provide.
* **When to use**: Users need immediate confirmation at the same time of a tool call; helps mask latency.
* **What it does**: Adds a short, consistent preamble before a tool call.
### Example
```
`# Tools
- Before any tool call, say one short line like “I’m checking that now.” Then call the tool immediately.`
```
This is the responses after applying the instruction using `gpt-realtime`
Using the instruction, the model outputs an audio response “I’m checking that right now” at the same time as the tool call.
### Tool Call Preambles + Sample Phrases
If you want to control more closely what type of phrases the model outputs at the same time it calls a tool, you can add sample phrases in the tool spec description.
#### Example
```
`tools = [
{
"name": "lookup\_account",
"description": "Retrieve a customer account using either an email or phone number to enable verification and account-specific actions.
Preamble sample phrases:
- For security, I’ll pull up your account using the email on file.
- Let me look up your account by {email} now.
- I’m fetching the account linked to {phone} to verify access.
- One moment—I’m opening your account details."
"parameters": {
"..."
}
},
{
"name": "check\_outage",
"description": "Check for network outages affecting a given service address and return status and ETA if applicable.
Preamble sample phrases:
- I’ll check for any outages at {service\_address} right now.
- Let me look up network status for your area.
- I’m checking whether there’s an active outage impacting your address.
- One sec—verifying service status and any posted ETA.",
"parameters": {
"..."
}
}
]
`
```
## Tool Calls Without Confirmation
Sometimes the model might ask for confirmation before a tool call. For some use cases, this can lead to poor experience for the end user since the model is not being proactive.
* **When to use**: The agent asks for permission before obvious tool calls.
* **What it does**: Removes unnecessary confirmation loops.
### Example
```
`# Tools
- When calling a tool, do not ask for any user confirmation. Be proactive`
```
This is the responses **after** applying the instruction using `gpt-realtime`
In the example, you notice that the realtime model did not produce any response audio, it directly called the respective tool.
*Tip: If you notice the model is jumping too quickly to call a tool, try softening the wording. For example, swapping out stronger terms like “proactive” with something gentler can help guide the model to take a calmer, less eager approach.*
## Tool Call Performance
As use cases grow more complex and the number of available tools increases, it becomes critical to explicitly guide the model on when to use each tool and just as importantly, when not to. Clear usage rules not only improve tool call accuracy but also help the model choose the right tool at the right time.
* **When to use**: Model is struggling with tool call performance and needs the instructions to be explicit to reduce misuse.
* **What it does**: Add instructions on when to “use/avoid” each tool. You can also add instructions on sequences of tool calls (after Tool call A, you can call Tool call B or C)
### Example
```
`# Tools
- When you call any tools, you must output at the same time a response letting the user know that you are calling the tool.
## lookup\_account(email\_or\_phone)
Use when: verifying identity or viewing plan/outage flags.
Do NOT use when: the user is clearly anonymous and only asks general questions.
## check\_outage(address)
Use when: user reports connectivity issues or slow speeds.
Do NOT use when: question is billing-only.
## refund\_credit(account\_id, minutes)
Use when: confirmed outage \> 240 minutes in the past 7 days.
Do NOT use when: outage is unconfirmed; route to Diagnose → check\_outage first.
## schedule\_technician(account\_id, window)
Use when: repeated failures after reboot and outage status = false.
Do NOT use when: outage status = true (send status + ETA instead).
## escalate\_to\_human(account\_id, reason)
Use when: user seems very frustrated, abuse/harassment, repeated failures, billing disputes \>$50, or user requests escalation.`
```
*Tip: If a tool call can fail unpredictably, add clear failure-handling instructions so the model responds gracefully.*
## Tool Level Behavior
You can fine-tune how the model behaves for specific tools instead of applying one global rule. For example, you may want READ tools to be called proactively, while WRITE tools require explicit confirmation.
* **When to use**: Global instructions for proactiveness, confirmation, or preambles don’t suit every tool.
* **What it does**: Adds per-tool behavior rules that define whether the model should call the tool immediately, confirm first, or speak a preamble before the call.
### Example
```
`# TOOLS
- For the tools marked PROACTIVE: do not ask for confirmation from the user and do not output a preamble.
- For the tools marked as CONFIRMATION FIRST: always ask for confirmation to the user.
- For the tools marked as PREAMBLES: Before any tool call, say one short line like “I’m checking that now.” Then call the tool immediately.
## lookup\_account(email\_or\_phone) — PROACTIVE
Use when: verifying identity or accessing billing.
Do NOT use when: caller refuses to identify after second request.
## check\_outage(address) — PREAMBLES
Use when: caller reports failed connection or speed lower than 10 Mbps.
Do NOT use when: purely billing OR when internet speed is above 10 Mbps.
If either condition applies, inform the customer you cannot assist and hang up.
## refund\_credit(account\_id, minutes) — CONFIRMATION FIRST
Use when: confirmed outage \> 240 minutes in the past 7 days (credit 60 minutes).
Do NOT use when: outage unconfirmed.
Confirmation phrase: “I can issue a credit for this outage—would you like me to go ahead?”
## schedule\_technician(account\_id, window) — CONFIRMATION FIRST
Use when: reboot + line checks fail AND outage=false.
Windows: “10am–12pm ET” or “2pm–4pm ET”.
Confirmation phrase: “I can schedule a technician to visit—should I book that for you?”
## escalate\_to\_human(account\_id, reason) — PREAMBLES
Use when: harassment, threats, self-harm, repeated failure, billing disputes \> $50, caller is frustrated, or caller requests escalation.
Preamble: “Let me connect you to a senior agent who can assist further.”`
```
## Tool Output Formatting
Some tool outputs, especially long strings that must be repeated verbatim, can be out-of-distribution for the model. During training, tool outputs commonly look like JSON objects with named fields. If your tool returns a raw string and separately asks the model to “repeat exactly,” the model may be more prone to paraphrasing, truncation, or blending in its own preamble.
A practical fix is to make the tool output look like a normal tool result and make the verbatim requirement machine-explicit.
* **When to use:** A tool returns **long or complex structured content** (multi-sentence instructions, handoff packets, IDs/links, policy summaries, multi-step procedures, etc.) and you observe **truncation, paraphrasing, dropped fields, reordering, or the model blending in its own preamble/commentary**.
* **What it does:** Wraps the tool output in a **small, explicit JSON envelope** (e.g., `response\_text` plus flags like `require\_repeat\_verbatim`, `format`, or `content\_type`) so the response looks more **in-distribution** and the expected realization behavior is **machine-clear**.
* **How to adapt:** Keep the schema **minimal and stable**. Clearly document the expected tool output shape in both your **Tools instructions** and next to the **tool definition** (e.g., “If `require\_repeat\_verbatim` is true, output exactly `response\_text` and nothing else,” or “Render `response\_text` as-is; do not add, omit, or reorder fields from the tool output.”).
### Examples
#### Example: raw string (more error-prone)
Tool returns:
```
`I just sent you an email with the verification link. Please open it and click “Confirm”.`
```
Model sometimes says:
* “I’ve emailed you a verification link…” (paraphrase)
* Drops the last sentence (truncation)
* Adds extra commentary (“Can I help with anything else?”)
#### Example: wrapped JSON (more in-distribution, more reliable)
Tool returns:
```
`{
"response\_text": "I just sent you an email with the verification link. Please open it and click “Confirm”.",
"require\_repeat\_verbatim": true
}`
```
Because this looks like a typical tool result (JSON object), the model generally has an easier time:
* recognizing what the “authoritative” content is (response\_text)
* understanding the realization constraint (require\_repeat\_verbatim)
* reproducing the tool output cleanly, without truncation or extra commentary
## Rephrase Supervisor Tool (Responder-Thinker Architecture)
In many voice setups, the realtime model acts as the responder (speaks to the user) while a stronger text model acts as the thinker (does planning, policy lookups, SOP completion). Text replies are not automatically good for speech, so the responder must rephrase the thinker’s text into an audio-friendly response before generating audio.
* **When to use**: When the responder’s spoken output sounds robotic, too long, or awkward after receiving a thinker response.
* **What it does**: Adds clear instructions that guide the responder to rephrase the thinker’s text into a short, natural, speech-first reply.
* **How to adapt**: Tweak phrasing style, openers, and brevity limits to match your use case expectation.
### Example
```
`# Tools
## Supervisor Tool
Name: getNextResponseFromSupervisor(relevantContextFromLastUserMessage: string)
When to call:
- Any request outside the allow list.
- Any factual, policy, account, or process question.
- Any action that might require internal lookups or system changes.
When not to call:
- Simple greetings and basic chitchat.
- Requests to repeat or clarify.
- Collecting parameters for later Supervisor use:
- phone\_number for account help (getUserAccountInfo)
- zip\_code for store lookup (findNearestStore)
- topic or keyword for policy lookup (lookupPolicyDocument)
Usage rules and preamble:
1) Say a neutral filler phrase to the user, then immediately call the tool. Approved fillers: “One moment.”, “Let me check.”, “Just a second.”, “Give me a moment.”, “Let me see.”, “Let me look into that.” Fillers must not imply success or failure.
2) Do not mention the “Supervisor” when responding with filler phrase.
3) relevantContextFromLastUserMessage is a one-line summary of the latest user message; use an empty string if nothing salient.
4) After the tool returns, apply Rephrase Supervisor and send your reply.
### Rephrase Supervisor
- Start with a brief conversational opener using active language, then flow into the answer (for example: “Thanks for waiting—”, “Just finished checking that.”, “I’ve got that pulled up now.”).
- Keep it short: no more than 2 sentences.
- Use this template: opener + one-sentence gist + up to 3 key details + a quick confirmation or choice (for example: “Does that match what you expected?”, “Want me to review options?”).
- Read numbers for speech: money naturally (“$45.20” → “forty-five dollars and twenty cents”), phone numbers 3-3-4, addresses with individual digits, dates/times plainly (“August twelfth”, “three-thirty p.m.”).`
```
Here’s an example without the rephrasing instruction:
>
> Assistant: Your current credit card balance is positive at 32,323,232 AUD.
>
Here’s the same example with the rephrasing instruction:
>
> Assistant: Just finished checking that—your credit card balance is thirty-two million three hundred twenty-three thousand two hundred thirty-two dollars in your favor. Your last payment was processed on August first. Does that match what you expected?
>
## Common Tools
The new model snapshot has been trained to effectively use the following common tools. If your use case needs similar behavior, keep the names, signatures, and descriptions close to these to maximize reliability and to be more in-distribution.
Below are some of the important common tools that the model has been trained on:
### Example
```
`# answer(question: string)
Description: Call this when the customer asks a question that you don't have an answer to or asks to perform an action.
# escalate\_to\_human()
Description: Call this when a customer asks for escalation, or to talk to someone else, or expresses dissatisfaction with the call.
# finish\_session()
Description: Call this when a customer says they're done with the session or doesn't want to continue. If it's ambiguous, confirm with the customer before calling. `
```
# Conversation Flow
This section covers how to structure the dialogue into clear, goal-driven phases so the model knows exactly what to do at each step. It defines the purpose of each phase, the instructions for moving through it, and the concrete “exit criteria” for transitioning to the next. This prevents the model from stalling, skipping steps, or jumping ahead, and ensures the conversation stays organized from greeting to resolution.
As well, by organizing your prompt into various conversation states, it becomes easier to identify error modes and iterate more effectively.
* **When to use**: If conversations feel disorganized, stall before reaching the goal or model struggling to effectively complete the objective.
* **What it does**: Breaks the interaction into phases with clear goals, instructions and exit criteria.
* **How to adapt**: Rename phases to match your workflow; Modify instructions for each phase to follow your intended behaviour; keep “Exit when” concrete and minimal.
### Example
```
`# Conversation Flow
## 1) Greeting
Goal: Set tone and invite the reason for calling.
How to respond:
- Identify as NorthLoop Internet Support.
- Keep the opener brief and invite the caller’s goal.
- Confirm that customer is a Northloop customer
Exit to Discovery: Caller states they are a Northloop customer and mentions an initial goal or symptom.
## 2) Discover
Goal: Classify the issue and capture minimal details.
How to respond:
- Determine billing vs connectivity with one targeted question.
- For connectivity: collect the service address.
- For billing/account: collect email or phone used on the account.
Exit when: Intent and address (for connectivity) or email/phone (for billing) are known.
## 3) Verify
Goal: Confirm identity and retrieve the account.
How to respond:
- Once you have email or phone, call lookup\_account(email\_or\_phone).
- If lookup fails, try the alternate identifier once; otherwise proceed with general guidance or offer escalation if account actions are required.
Exit when: Account ID is returned.
## 4) Diagnose
Goal: Decide outage vs local issue.
How to respond:
- For connectivity, call check\_outage(address).
- If outage=true, skip local steps; move to Resolve with outage context.
- If outage=false, guide a short reboot/cabling check; confirm each step’s result before continuing.
Exit when: Root cause known.
## 5) Resolve
Goal: Apply fix, credit, or appointment.
How to respond:
- If confirmed outage \> 240 minutes in the last 7 days, call refund\_credit(account\_id, 60).
- If outage=false and issue persists after basic checks, offer “10am–12pm ET” or “2pm–4pm ET” and call schedule\_technician(account\_id, chosen window).
- If the local fix worked, state the result and next steps briefly.
Exit when: A fix/credit/appointment has been applied and acknowledged by the caller.
## 6) Confirm/Close
Goal: Confirm outcome and end cleanly.
How to respond:
- Restate the result and any next step (e.g., stabilization window or tech ETA).
- Invite final questions; close politely if none.
Exit when: Caller declines more help.`
```
## Sample Phrases
Sample phrases act as “anchor examples” for the model. They show the style, brevity, and tone you want it to follow, without locking it into one rigid response.
* **When to use**: Responses lack your brand style or are not consistent.
* **What it does**: Provides sample phrases the model can vary to stay natural and brief.
* **How to adapt**: Swap examples for brand-fit; keep the “do not always use” warning.
### Example
```
`# Sample Phrases
- Below are sample examples that you should use for inspiration. DO NOT ALWAYS USE THESE EXAMPLES, VARY YOUR RESPONSES.
Acknowledgements: “On it.” “One moment.” “Good question.”
Clarifiers: “Do you want A or B?” “What’s the deadline?”
Bridges: “Here’s the quick plan.” “Let’s keep it simple.”
Empathy (brief): “That’s frustrating—let’s fix it.”
Closers: “Anything else before we wrap?” “Happy to help next time.”`
```
*Note: If your voice system ends up consistently only repeating the sample phrases, leading to a more robotic voice experience, try adding the Variety constraint. We’ve seen this fix the issue.*
## Conversation flow + Sample Phrases
It is an useful pattern to add sample phrases in the different conversation flow states to teach the model how a good response looks like:
### Example
```
`# Conversation Flow
## 1) Greeting
Goal: Set tone and invite the reason for calling.
How to respond:
- Identify as NorthLoop Internet Support.
- Keep the opener brief and invite the caller’s goal.
Sample phrases (do not always repeat the same phrases, vary your responses):
- “Thanks for calling NorthLoop Internet—how can I help today?”
- “You’ve reached NorthLoop Support. What’s going on with your service?”
- “Hi there—tell me what you’d like help with.”
Exit when: Caller states an initial goal or symptom.
## 2) Discover
Goal: Classify the issue and capture minimal details.
How to respond:
- Determine billing vs connectivity with one targeted question.
- For connectivity: collect the service address.
- For billing/account: collect email or phone used on the account.
Sample phrases (do not always repeat the same phrases, vary your responses):
- “Is this about your bill or your internet speed?”
- “What address are you using for the connection?”
- “What’s the email or phone number on the account?”
Exit when: Intent and address (for connectivity) or email/phone (for billing) are known.
## 3) Verify
Goal: Confirm identity and retrieve the account.
How to respond:
- Once you have email or phone, call lookup\_account(email\_or\_phone).
- If lookup fails, try the alternate identifier once; otherwise proceed with general guidance or offer escalation if account actions are required.
Sample phrases:
- “Thanks—looking up your account now.”
- “If that doesn’t pull up, what’s the other contact—email or phone?”
- “Found your account. I’ll take care of this.”
Exit when: Account ID is returned.
## 4) Diagnose
Goal: Decide outage vs local issue.
How to respond:
- For connectivity, call check\_outage(address).
- If outage=true, skip local steps; move to Resolve with outage context.
- If outage=false, guide a short reboot/cabling check; confirm each step’s result before continuing.
Sample phrases (do not always repeat the same phrases, vary your responses):
- “I’m running a quick outage check for your area.”
- “No outage reported—let’s try a fast modem reboot.”
- “Please confirm the modem lights: is the internet light solid or blinking?”
Exit when: Root cause known.
## 5) Resolve
Goal: Apply fix, credit, or appointment.
How to respond:
- If confirmed outage \> 240 minutes in the last 7 days, call refund\_credit(account\_id, 60).
- If outage=false and issue persists after basic checks, offer “10am–12pm ET” or “2pm–4pm ET” and call schedule\_technician(account\_id, chosen window).
- If the local fix worked, state the result and next steps briefly.
Sample phrases (do not always repeat the same phrases, vary your responses):
- “There’s been an extended outage—adding a 60-minute bill credit now.”
- “No outage—let’s book a technician. I can do 10am–12pm ET or 2pm–4pm ET.”
- “Credit applied—you’ll see it on your next bill.”
Exit when: A fix/credit/appointment has been applied and acknowledged by the caller.
## 6) Confirm/Close
Goal: Confirm outcome and end cleanly.
How to respond:
- Restate the result and any next step (e.g., stabilization window or tech ETA).
- Invite final questions; close politely if none.
Sample phrases (do not always repeat the same phrases, vary your responses):
- “We’re all set: [credit applied / appointment booked / service restored].”
- “You should see stable speeds within a few minutes.”
- “Your technician window is 10am–12pm ET.”
Exit when: Caller declines more help.
`
```
## Advanced Conversation Flow
As use cases grow more complex, you’ll need a structure that scales while keeping the model effective. The key is balancing maintainability with simplicity: too many rigid states can overload the model, hurting performance and making conversations feel robotic.
A better approach is to design flows that reduce the model’s perceived complexity. By handling state in a structured but flexible way, you make it easier for the model to stay focused and responsive, which improves user experience.
Two common patterns for managing complex scenarios are:
1. Conversation Flow as State Machine
2. Dynamic Conversation Flow via session.updates
### Conversation Flow as State Machine
Define your conversation as a JSON structure that encodes both states and transitions. This makes it easy to reason about coverage, identify edge cases, and track changes over time. Since it’s stored as code, you can version, diff, and extend it as your flow evolves. A state machine also gives you fine-grained control over exactly how and when the conversation moves from one state to another.
#### Example
```
`# Conversation States
[
{
"id": "1\_greeting",
"description": "Begin each conversation with a warm, friendly greeting, identifying the service and offering help.",
"instructions": [
"Use the company name 'Snowy Peak Boards' and provide a warm welcome.",
"Let them know upfront that for any account-specific assistance, you’ll need some verification details."
],
"examples": [
"Hello, this is Snowy Peak Boards. Thanks for reaching out! How can I help you today?"
],
"transitions": [{
"next\_step": "2\_get\_first\_name",
"condition": "Once greeting is complete."
}, {
"next\_step": "3\_get\_and\_verify\_phone",
"condition": "If the user provides their first name."
}]
},
{
"id": "2\_get\_first\_name",
"description": "Ask for the user’s name (first name only).",
"instructions": [
"Politely ask, 'Who do I have the pleasure of speaking with?'",
"Do NOT verify or spell back the name; just accept it."
],
"examples": [
"Who do I have the pleasure of speaking with?"
],
"transitions": [{
"next\_step": "3\_get\_and\_verify\_phone",
"condition": "Once name is obtained, OR name is already provided."
}]
},
{
"id": "3\_get\_and\_verify\_phone",
"description": "Request phone number and verify by repeating it back.",
"instructions": [
"Politely request the user’s phone number.",
"Once provided, confirm it by repeating each digit and ask if it’s correct.",
"If the user corrects you, confirm AGAIN to make sure you understand.",
],
"examples": [
"I'll need some more information to access your account if that's okay. May I have your phone number, please?",
"You said 0-2-1-5-5-5-1-2-3-4, correct?",
"You said 4-5-6-7-8-9-0-1-2-3, correct?"
],
"transitions": [{
"next\_step": "4\_authentication\_DOB",
"condition": "Once phone number is confirmed"
}]
},
...`
```
### Dynamic Conversation Flow
In this pattern, the conversation adapts in real time by updating the system prompt and tool list based on the current state. Instead of exposing the model to all possible rules and tools at once, you only provide what’s relevant to the active phase of the conversation.
When the end conditions for a state are met, you use session.update to transition, replacing the prompt and tools with those needed for the next phase.
This approach reduces the model’s cognitive load, making it easier for it to handle complex tasks without being distracted by unnecessary context.
#### Example
```
`from typing import Dict, List, Literal
State = Literal["verify", "resolve"]
# Allowed transitions
TRANSITIONS: Dict[State, List[State]] = {
"verify": ["resolve"],
"resolve": [] # terminal
}
def build\_state\_change\_tool(current: State) -\> dict:
allowed = TRANSITIONS[current]
readable = ", ".join(allowed) if allowed else "no further states (terminal)"
return {
"type": "function",
"name": "set\_conversation\_state",
"description": (
f"Switch the conversation phase. Current: '{current}'. "
f"You may switch only to: {readable}. "
"Call this AFTER exit criteria are satisfied."
),
"parameters": {
"type": "object",
"properties": {
"next\_state": {"type": "string", "enum": allowed}
},
"required": ["next\_state"]
}
}
# Minimal business tools per state
TOOLS\_BY\_STATE: Dict[State, List[dict]] = {
"verify": [{
"type": "function",
"name": "lookup\_account",
"description": "Fetch account by email or phone.",
"parameters": {
"type": "object",
"properties": {"email\_or\_phone": {"type": "string"}},
"required": ["email\_or\_phone"]
}
}],
"resolve": [{
"type": "function",
"name": "schedule\_technician",
"description": "Book a technician visit.",
"parameters": {
"type": "object",
"properties": {
"account\_id": {"type": "string"},
"window": {"type": "string", "enum": ["10-12 ET", "14-16 ET"]}
},
"required": ["account\_id", "window"]
}
}]
}
# Short, phase-specific instructions
INSTRUCTIONS\_BY\_STATE: Dict[State, str] = {
"verify": (
"# Role & Objective\\n"
"Verify identity to access the account.\\n\\n"
"# Conversation (Verify)\\n"
"- Ask for the email or phone on the account.\\n"
"- Read back digits one-by-one (e.g., '4-1-5… Is that correct?').\\n"
"Exit when: Account ID is returned.\\n"
"When exit is satisfied: call set\_conversation\_state(next\_state=\\"resolve\\")."
),
"resolve": (
"# Role & Objective\\n"
"Apply a fix by booking a technician.\\n\\n"
"# Conversation (Resolve)\\n"
"- Offer two windows: '10–12 ET' or '2–4 ET'.\\n"
"- Book the chosen window.\\n"
"Exit when: Appointment is confirmed.\\n"
"When exit is satisfied: end the call politely."
)
}
def build\_session\_update(state: State) -\> dict:
"""Return the JSON payload for a Realtime `session.update` event."""
return {
"type": "session.update",
"session": {
"instructions": INSTRUCTIONS\_BY\_STATE[state],
"tools": TOOLS\_BY\_STATE[state] + [build\_state\_change\_tool(state)]
}
}`
```
# Safety & Escalation
Often with Realtime voice agents, having a reliable way to escalate to a human is important. In this section, you should modify the instructions on WHEN to escalate depending on your use case.
* **When to use**: Model is struggling in determining when to properly escalate to a human or fallback system
* **What it does**: Defines fast, reliable escalation and what to say.
* **How to adapt**: Insert your own thresholds and what the model has to say.
### Example
```
`# Safety & Escalation
When to escalate (no extra troubleshooting):
- Safety risk (self-harm, threats, harassment)
- User explicitly asks for a human
- Severe dissatisfaction (e.g., “extremely frustrated,” repeated complaints, profanity)
- \*\*2\*\* failed tool attempts on the same task \*\*or\*\* \*\*3\*\* consecutive no-match/no-input events
- Out-of-scope or restricted (e.g., real-time news, financial/legal/medical advice)
What to say at the same time of calling the escalate\_to\_human tool (MANDATORY):
- “Thanks for your patience—I’m connecting you with a specialist now.”
- Then call the tool: `escalate\_to\_human`
Examples that would require escalation:
- “This is the third time the reset didn’t work. Just get me a person.”
- “I am extremely frustrated!”`
```
This is the conversation responses from our old snapshot model `gpt-4o-realtime-preview-2025-06-03` using the instruction.
This is the conversation responses from our new GA model `gpt-realtime` using the instruction.
The new realtime model is able to better follow the instruction and escalate to a human more reliably.