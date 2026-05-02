Testing Agent Skills Systematically with Evals | OpenAI Developers
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
When you’re iterating on a skill for an agent like Codex, it’s hard to tell whether you’re actually improving it or just changing its behavior. One version feels faster, another seems more reliable, and then a regression slips in: the skill doesn’t trigger, it skips a required step, or it leaves extra files behind.
At its core, a skill is an [organized collection of prompts and instructions](https://developers.openai.com/codex/skills) for an LLM. The most reliable way to improve a skill over time is to evaluate it the same way you would [any other prompt for LLM applications](https://platform.openai.com/docs/guides/evaluation-best-practices).
*Evals* (short for *evaluations*) check whether a model’s output, and the steps it took to produce it, match what you intended. Instead of asking “does this feel better?” (or relying on vibes), evals let you ask concrete questions like:
* Did the agent invoke the skill?
* Did it run the expected commands?
* Did it produce outputs that follow the conventions you care about?
Concretely, an eval is: a prompt → a captured run (trace + artifacts) → a small set of checks → a score you can compare over time.
In practice, evals for agent skills look a lot like lightweight end-to-end tests: you run the agent, record what happened, and score the result against a small set of rules.
This post walks through a clear pattern for doing that with Codex, starting from defining success, then adding deterministic checks and rubric-based grading so improvements (and regressions) are clear.
## **1. Define success before you write the skill**
Before writing the skill itself, write down what “success” means in terms you can actually measure. A useful way to think about this is to split your checks into a few categories:
* **Outcome goals:** Did the task complete? Does the app run?
* **Process goals:** Did Codex invoke the skill and follow the tools and steps you intended?
* **Style goals:** Does the output follow the conventions you asked for?
* **Efficiency goals:** Did it get there without thrashing (for example, unnecessary commands or excessive token use)?
Keep this list small and focused on must-pass checks. The goal isn’t to encode every preference up front, but to capture the behaviors you care about most.
In this post, for example, the guide evaluates a skill that sets up a demo app. Some checks are concrete. Did it run `npm install`? Did it create `package.json`? The guide pairs those with a structured style rubric to evaluate conventions and layout.
This mix is intentional. You want fast, targeted signals that surface specific regressions early, rather than a single pass/fail verdict at the end.
## **2. Create the skill**
A Codex skill is a directory with a `SKILL.md` file that includes YAML front matter (`name`, `description`), followed by the Markdown instructions that define the skill’s behavior and optional resources and scripts. The name and description matter more than they might seem. They’re the primary signals Codex uses to decide *whether* to invoke the skill at all, and *when* to inject the rest of `SKILL.md` into the agent’s context. If these are vague or overloaded, the skill won’t trigger reliably.
The fastest way to get started is to use Codex’s built-in skill creator ([which itself is also a skill](https://github.com/openai/skills/tree/main/skills/.system/skill-creator)). It walks you through:
```
`$skill-creator`
```
The creator asks you what the skill does, when it should trigger, and whether it’s instruction-only or script-backed (instruction-only is the default recommendation). To learn more about creating a skill, [check out the documentation](/codex/skills#create-a-skill).
### **A sample skill**
This post uses an intentionally minimal example: a skill that sets up a small React demo app in a predictable, repeatable way.
This skill will:
* Scaffold a project using Vite’s React + TypeScript template
* Configure Tailwind CSS using the official Vite plugin approach
* Enforce a minimal, consistent file structure
* Define a clear “definition of done” so success is straightforward to evaluate
Below is a compact draft you can paste either into:
* `.codex/skills/setup-demo-app/SKILL.md` (repo-scoped), or
* `\~/.codex/skills/setup-demo-app/SKILL.md` (user-scoped).
```
`---
name: setup-demo-app
description: Scaffold a Vite + React + Tailwind demo app with a small, consistent project structure.
---
## When to use this
Use when you need a fresh demo app for quick UI experiments or reproductions.
## What to build
Create a Vite React TypeScript app and configure Tailwind. Keep it minimal.
Project structure after setup:
- src/
- main.tsx (entry)
- App.tsx (root UI)
- components/
- Header.tsx
- Card.tsx
- index.css (Tailwind import)
- index.html
- package.json
Style requirements:
- TypeScript components
- Functional components only
- Tailwind classes for styling (no CSS modules)
- No extra UI libraries
## Steps
1. Scaffold with Vite using the React TS template:
npm create vite@latest demo-app -- --template react-ts
2. Install dependencies:
cd demo-app
npm install
3. Install and configure Tailwind using the Vite plugin.
- npm install tailwindcss @tailwindcss/vite
- Add the tailwind plugin to vite.config.ts
- In src/index.css, replace contents with:
@import "tailwindcss";
4. Implement the minimal UI:
- Header: app title and short subtitle
- Card: reusable card container
- App: render Header + 2 Cards with placeholder text
## Definition of done
- npm run dev starts successfully
- package.json exists
- src/components/Header.tsx and src/components/Card.tsx exist`
```
This sample skill takes an opinionated stance on purpose. Without clear constraints, there’s nothing concrete to evaluate.
## **3. Manually trigger the skill to expose hidden assumptions**
Because skill invocation depends so much on the *name* and *description* in `SKILL.md`, the first thing to check is whether the `setup-demo-app` skill triggers when you expect it to.
Early on, explicitly activate the skill, either via the `/skills` slash command or by referencing it with the `$` prefix, in a real repository or a scratch directory, and watch where it breaks. This is where you surface the misses: cases where the skill doesn’t trigger at all, triggers too eagerly, or runs but deviates from the intended steps.
At this stage, you’re not optimizing for speed or polish. You’re looking for hidden assumptions the skill is making, such as:
* **Triggering assumptions**: Prompts like “set up a quick React demo” that *should* invoke `setup-demo-app` but don’t, or more generic prompts (“add Tailwind styling”) that unintentionally trigger it.
* **Environment assumptions**: The skill assumes it’s running in an empty directory, or that `npm` is available and preferred over other package managers.
* **Execution assumptions**: The agent skips `npm install` because it assumes dependencies are already installed, or configures Tailwind before the Vite project exists.
Once you’re ready to make these runs repeatable, switch to `codex exec`. It’s designed for automation and CI: it streams progress to `stderr` and writes only the final result to `stdout`, which makes runs easier to script, capture, and inspect.
By default, `codex exec` runs in a restricted sandbox. If your task needs to write files, run it with `--full-auto`. As a general rule, especially when automating, use the least permissions needed to get the job done.
A basic manual run might look like:
```
`codex exec --full-auto \\
'Use the $setup-demo-app skill to create the project in this directory.'`
```
This first hands-on pass is less about validating correctness and more about discovering edge cases. Every manual fix you make here, such as adding a missing `npm install`, correcting the Tailwind setup, or tightening the trigger description, is a candidate for a future eval, so you can lock in the intended behavior before evaluating at scale.
## **4. Use a small, targeted prompt set to catch regressions early**
You don’t need a large benchmark to get value from evals. For a single skill, a small set of 10–20 prompts is enough to surface regressions and confirm improvements early.
Start with a small CSV and grow it over time as you encounter real failures during development or usage. Each row should represent a situation where you care whether the `setup-demo-app` skill *does* or *does not* activate, and what success looks like when it does.
For example, an initial `evals/setup-demo-app.prompts.csv` might look like this:
```
`id,should\_trigger,prompt
test-01,true,"Create a demo app named `devday-demo` using the $setup-demo-app skill"
test-02,true,"Set up a minimal React demo app with Tailwind for quick UI experiments"
test-03,true,"Create a small demo app to showcase the Responses API"
test-04,false,"Add Tailwind styling to my existing React app"`
```
Each of these cases is testing something slightly different:
* **Explicit invocation (`test-01`)**
This prompt names the skill directly. It ensures that Codex can invoke `setup-demo-app` when asked, and that changes to the skill’s name, description, or instructions don’t break direct usage.
* **Implicit invocation (`test-02`)**
This prompt describes *exactly* the scenario the skill targets, setting up a minimal React + Tailwind demo, without mentioning the skill by name. It tests whether the name and description in `SKILL.md` are strong enough for Codex to select the skill on its own.
* **Contextual invocation (`test-03`)**
This prompt adds domain context (the Responses API) but still requires the same underlying setup. It checks that the skill triggers in realistic, slightly noisy prompts, and that the resulting app still matches the expected structure and conventions.
* **Negative control (`test-04`)**
This prompt should **not** invoke `setup-demo-app`. It’s a common adjacent request (“add Tailwind to an existing app”) that can unintentionally match the skill’s description (“React + Tailwind demo”). Including at least one `should\_trigger=false` case helps catch **false positives**, where Codex selects the skill too eagerly and scaffolds a new project when the user wanted an incremental change to an existing one.
This mix is intentional. Some evals should confirm that the skill behaves correctly when invoked explicitly; others should check that it activates in real-world prompts where the user never mentions the skill at all.
As you discover misses, prompts that fail to trigger the skill, or cases where the output drifts from your expectations, add them as new rows. Over time, this small CSV becomes a living record of the scenarios the `setup-demo-app` skill must continue to get right.
Over time, this small dataset becomes a living record of what the skill must continue to get right.
## **5. Get started with lightweight deterministic graders**
This is the core of the evaluation step: use `codex exec --json` so your eval harness can score *what actually happened*, not just whether the final output looks right.
When you enable `--json`, `stdout` becomes a JSONL stream of structured events. That makes it straightforward to write deterministic checks tied directly to the behavior you care about, for example:
* Did it run `npm install`?
* Did it create `package.json`?
* Did it invoke the expected commands, in the expected order?
These checks are intentionally lightweight. They give you fast, explainable signals before you add any model-based grading.
### **A minimal Node.js runner**
A “good enough” approach looks like this:
1. For each prompt, run `codex exec --json --full-auto "\<prompt\>"`
2. Save the JSONL trace to disk
3. Parse the trace and run deterministic checks over the events
```
`// evals/run-setup-demo-app-evals.mjs
import { spawnSync } from "node:child\_process";
import { readFileSync, writeFileSync, existsSync, mkdirSync } from "node:fs";
import path from "node:path";
function runCodex(prompt, outJsonlPath) {
const res = spawnSync(
"codex",
[
"exec",
"--json", // REQUIRED: emit structured events
"--full-auto", // Allow file system changes
prompt,
],
{ encoding: "utf8" }
);
mkdirSync(path.dirname(outJsonlPath), { recursive: true });
// stdout is JSONL when --json is enabled
writeFileSync(outJsonlPath, res.stdout, "utf8");
return { exitCode: res.status ?? 1, stderr: res.stderr };
}
function parseJsonl(jsonlText) {
return jsonlText
.split("\\n")
.filter(Boolean)
.map((line) =\> JSON.parse(line));
}
// deterministic check: did the agent run `npm install`?
function checkRanNpmInstall(events) {
return events.some(
(e) =\>
(e.type === "item.started" || e.type === "item.completed") &&
e.item?.type === "command\_execution" &&
typeof e.item?.command === "string" &&
e.item.command.includes("npm install")
);
}
// deterministic check: did `package.json` get created?
function checkPackageJsonExists(projectDir) {
return existsSync(path.join(projectDir, "package.json"));
}
// Example single-case run
const projectDir = process.cwd();
const tracePath = path.join(projectDir, "evals", "artifacts", "test-01.jsonl");
const prompt =
"Create a demo app named demo-app using the $setup-demo-app skill";
runCodex(prompt, tracePath);
const events = parseJsonl(readFileSync(tracePath, "utf8"));
console.log({
ranNpmInstall: checkRanNpmInstall(events),
hasPackageJson: checkPackageJsonExists(path.join(projectDir, "demo-app")),
});`
```
The value here is that everything is **deterministic and debuggable**.
If a check fails, you can open the JSONL file and see exactly what happened. Every command execution appears as an `item.\*` event, in order. That makes regressions straightforward to explain and fix, which is exactly what you want at this stage.
## **6. Conduct qualitative checks with Codex and rubric-based grading**
Deterministic checks answer *“did it do the basics?”* but they don’t answer *“did it do it the way you wanted?”*
For skills like `setup-demo-app`, many requirements are qualitative: component structure, styling conventions, or whether Tailwind follows the intended configuration. These are hard to capture with basic file existence checks or command counts alone.
A pragmatic solution is to add a second, model-assisted step to your eval pipeline:
1. Run the setup skill (this writes code to disk)
2. Run a **read-only style check** against the resulting repository
3. Require a **structured response** that your harness can score consistently
Codex supports this directly via `--output-schema`, which constrains the final response to a JSON Schema you define.
### **A small rubric schema**
Start by defining a small schema that captures the checks you care about. For example, create `evals/style-rubric.schema.json`:
```
`{
"type": "object",
"properties": {
"overall\_pass": { "type": "boolean" },
"score": { "type": "integer", "minimum": 0, "maximum": 100 },
"checks": {
"type": "array",
"items": {
"type": "object",
"properties": {
"id": { "type": "string" },
"pass": { "type": "boolean" },
"notes": { "type": "string" }
},
"required": ["id", "pass", "notes"],
"additionalProperties": false
}
}
},
"required": ["overall\_pass", "score", "checks"],
"additionalProperties": false
}`
```
This schema gives you stable fields (`overall\_pass`, `score`, per-check results) that you can combine, diff, and track over time.
### **The style-check prompt**
Next, run a second `codex exec` that *only inspects the repository* and emits a rubric-compliant JSON response:
```
`codex exec \\
"Evaluate the demo-app repository against these requirements:
- Vite + React + TypeScript project exists
- Tailwind is configured via @tailwindcss/vite and CSS imports tailwindcss
- src/components contains Header.tsx and Card.tsx
- Components are functional and styled with Tailwind utility classes (no CSS modules)
Return a rubric result as JSON with check ids: vite, tailwind, structure, style." \\
--output-schema ./evals/style-rubric.schema.json \\
-o ./evals/artifacts/test-01.style.json`
```
This is where `--output-schema` is handy. Instead of free-form text that’s hard to parse or compare, you get a predictable JSON object that your eval harness can score across many runs.
If you later move this eval suite into CI, the Codex GitHub Action explicitly supports passing `--output-schema` through `codex-args`, so you can enforce the same structured output in automated workflows.
## **7. Extending your evals as the skill matures**
Once you have the core loop in place, you can extend your evals in the directions that matter most for your skill. Start small, then layer in deeper checks only where they add real confidence.
Some examples include:
* **Command count and thrashing:** Count `command\_execution` items in the JSONL trace to catch regressions where the agent starts looping or re-running commands. Token usage is also available in `turn.completed` events.
* **Token budget:** Track `usage.input\_tokens` and `usage.output\_tokens` to spot accidental prompt bloat and compare efficiency across versions.
* **Build checks:** Run `npm run build` after the skill completes. This acts as a stronger end-to-end signal and catches broken imports or incorrectly configured tooling.
* **Runtime smoke checks:** Start `npm run dev` and hit the dev server with `curl`, or run a lightweight Playwright check if you already have one. Use this selectively. It adds confidence but costs time.
* **Repository cleanliness:** Ensure the run generates no unwanted files and that `git status --porcelain` is empty (or matches an explicit allow list).
* **Sandbox and permission regressions:** Verify the skill still works without escalating permissions beyond what you intended. Least-privilege defaults matter most once you automate.
The pattern is consistent: begin with fast checks that explain behavior, then add slower, heavier checks only when they reduce risk.
## **8. Key takeaways**
This small `setup-demo-app` example shows the shift from “it feels better” to “proof”: run the agent, record what happened, and grade it with a small set of checks. Once that loop exists, every tweak becomes easier to confirm, and every regression becomes clear. Here are the key takeaways:
* **Measure what matters.** Good evals make regressions clear and failures explainable.
* **Start from a checkable definition of done.** Use `$skill-creator` to bootstrap, then tighten the instructions until success is unambiguous.
* **Ground evals in behavior.** Capture JSONL with `codex exec --json` and write deterministic checks against `command\_execution` events.
* **Use Codex where rules fall short.** Add a structured, rubric-based pass with `--output-schema` to grade style and conventions reliably.
* **Let real failures drive coverage.** Every manual fix is a signal. Turn it into a test so the skill keeps getting it right.