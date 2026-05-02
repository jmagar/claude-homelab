Turn Figma designs into code | Codex use cases
Primary navigation
Search docs
### Suggested
responses createreasoning\_effortrealtimeprompt caching
Docs Use cases
* [ Home ](/codex/use-cases)
* [ Collections ](/codex/use-cases/collections)
[API Dashboard](https://platform.openai.com/login)
Codex use case
# Turn Figma designs into code
Turn Figma selections into polished UI with structured design context and visual checks.
Difficulty **Intermediate**
Time horizon **1h**
Use Codex to pull design context, assets, and variants from Figma, translate them into code that matches the repo's design system, then use Playwright to compare the implementation to the Figma reference and iterate until it looks right.
## Best for
* Implementing already designed screens or flows from Figma in an existing codebase
* Teams that want Codex to work from structured design context
# Contents
[
← All use cases
](/codex/use-cases)
Copy page [ Export as PDF ](/codex/use-cases/figma-designs-to-code/?export=pdf)
Use Codex to pull design context, assets, and variants from Figma, translate them into code that matches the repo's design system, then use Playwright to compare the implementation to the Figma reference and iterate until it looks right.
Intermediate
1h
Related links
[ Codex skills ](/codex/skills)[ Model Context Protocol ](/codex/mcp)
##
Best for
* Implementing already designed screens or flows from Figma in an existing codebase
* Teams that want Codex to work from structured design context
##
Skills & Plugins
*
[ Figma ](https://github.com/openai/plugins/tree/main/plugins/figma)
Implement designs in code, create Code Connect mappings between published components and source files, and generate project-specific design system rules for repeatable Figma-to-code work.
*
[ Playwright ](https://github.com/openai/skills/tree/main/skills/.curated/playwright-interactive)
Check responsive behavior and verify the implemented UI in a real browser.
|
Skill
|
Why use it
|
|[ Figma ](https://github.com/openai/plugins/tree/main/plugins/figma)| Implement designs in code, create Code Connect mappings between published components and source files, and generate project-specific design system rules for repeatable Figma-to-code work. |
|[ Playwright ](https://github.com/openai/skills/tree/main/skills/.curated/playwright-interactive)| Check responsive behavior and verify the implemented UI in a real browser. |
##
Starter prompt
Implement this Figma design in the current project using the Figma skill.
Requirements:
- Start with `get\_design\_context` for the exact node or frame.
- If the response is truncated, use `get\_metadata` to map the file and then re-fetch only the needed nodes with `get\_design\_context`.
- Run `get\_screenshot` for the exact variant before you start coding.
- Reuse the existing design system components and tokens.
- Translate the Figma output into this repo's utilities and component patterns instead of inventing a parallel system.
- Match spacing, layout, hierarchy, and responsive behavior closely.
- Respect the repo's routing, state, and data-fetch patterns.
- Make the page responsive on desktop and mobile.
- If Figma returns localhost image or SVG sources, use them directly and do not create placeholders or add new icon packages.
Validation:
- Compare the finished UI against the Figma reference for both look and behavior.
- Use Playwright to check that the UI matches the reference and iterate as needed until it does.
[Open in the Codex app](<codex://new?prompt=Implement+this+Figma+design+in+the+current+project+using+the+Figma+skill.
Requirements:
-+Start+with+`get_design_context`+for+the+exact+node+or+frame.
-+If+the+response+is+truncated,+use+`get_metadata`+to+map+the+file+and+then+re-fetch+only+the+needed+nodes+with+`get_design_context`.
-+Run+`get_screenshot`+for+the+exact+variant+before+you+start+coding.
-+Reuse+the+existing+design+system+components+and+tokens.
-+Translate+the+Figma+output+into+this+repo's+utilities+and+component+patterns+instead+of+inventing+a+parallel+system.
-+Match+spacing,+layout,+hierarchy,+and+responsive+behavior+closely.
-+Respect+the+repo's+routing,+state,+and+data-fetch+patterns.
-+Make+the+page+responsive+on+desktop+and+mobile.
-+If+Figma+returns+localhost+image+or+SVG+sources,+use+them+directly+and+do+not+create+placeholders+or+add+new+icon+packages.
Validation:
-+Compare+the+finished+UI+against+the+Figma+reference+for+both+look+and+behavior.
-+Use+Playwright+to+check+that+the+UI+matches+the+reference+and+iterate+as+needed+until+it+does.>)
Implement this Figma design in the current project using the Figma skill.
Requirements:
- Start with `get\_design\_context` for the exact node or frame.
- If the response is truncated, use `get\_metadata` to map the file and then re-fetch only the needed nodes with `get\_design\_context`.
- Run `get\_screenshot` for the exact variant before you start coding.
- Reuse the existing design system components and tokens.
- Translate the Figma output into this repo's utilities and component patterns instead of inventing a parallel system.
- Match spacing, layout, hierarchy, and responsive behavior closely.
- Respect the repo's routing, state, and data-fetch patterns.
- Make the page responsive on desktop and mobile.
- If Figma returns localhost image or SVG sources, use them directly and do not create placeholders or add new icon packages.
Validation:
- Compare the finished UI against the Figma reference for both look and behavior.
- Use Playwright to check that the UI matches the reference and iterate as needed until it does.
## Introduction
When you have an exact Figma selection, Codex can turn it into polished UI without ignoring the patterns already established in your project.
With the Figma skill, Codex can use the Figma MCP server to pull structured design context, variables, assets, and the exact variant it should implement.
With the Playwright interactive skill, Codex can open the app in a real browser, compare the implementation to the Figma reference, and iterate on layout or behavior until the result is closer to the target.
## Set up your Figma project
The cleaner your Figma file is, the better the first implementation will be. To improve the handoff:
* Use variables or design tokens wherever possible, especially for colors, typography, and spacing
* Create components for reusable UI elements instead of repeating detached layers
* Use auto layout as much as possible instead of manual positioning
* Keep frame and layer names clear enough that the main screen, state, and variants are obvious
* Keep real icons and images in the file when possible so Codex does not need to guess
This gives Codex better structure to translate into a robust, production-ready UI.
## Be specific
The more specific you are about the expected interaction patterns and the style you want, the better the result will be.
If a state, breakpoint, or interaction matters, call it out. If the file contains multiple close variants, tell Codex which one should be treated as the source of truth.
The more explicit you are about what needs to match exactly and where repo conventions should win, the easier it is for Codex to make the right tradeoffs.
## Prepare the design system
Codex works best when the target repo already has a clear component layer. Codex can automatically use your existing component and design system instead of recreating them from scratch.
If you think it’s necessary, specify to Codex which primitives to reuse, where your tokens live, and what the repo considers canonical for buttons, inputs, cards, typography, and icons.
Treat the Figma MCP output, which often looks like React plus Tailwind, as a structural reference rather than final code style. Ask Codex to translate that output into the project’s actual utilities, component wrappers, color system, typography scale, spacing tokens, routing, state management, and data-fetch patterns.
## Workflow
### Start from a Figma selection
Copy a link to the exact Figma frame, component, or variant you want implemented. The Figma MCP flow is link-based, so the link needs to point to the exact node you want rather than a nearby parent frame.
### Prompt Codex to use Figma
Figma should drive the first pass. Ask Codex to follow the Figma MCP flow before it starts implementing.
Things to include in your prompt:
1. Run `get\_design\_context` for the exact node or frame first.
2. If the response is too large or truncated, run `get\_metadata` to map the file and then re-run `get\_design\_context` only for the nodes you need.
3. Run `get\_screenshot` for the exact variant being implemented.
4. Only after both the design context and the exact variant are available, download any required assets and start implementation.
5. Translate the result into the repo's conventions: reuse existing components, replace raw utility classes with the project's system when possible, and keep spacing, hierarchy, and responsive behavior aligned with the design.
6. If Figma returns a localhost image or SVG source, use it directly. Do not create placeholders or add a new icon package when the asset is already in the payload.
Once the first implementation is in place, Codex will use Playwright to verify the UI in a real browser and tighten any remaining visual or interaction mismatches.
##
Tech stack
Need
Default options
Why it's needed
Need
Design source
Default options
[ Figma ](https://www.figma.com/)
Why it's needed
A concrete frame or component selection keeps the implementation grounded.
|
Need
|
Default options
|
Why it's needed
|
| Design source |[ Figma ](https://www.figma.com/)| A concrete frame or component selection keeps the implementation grounded. |
##
Related use cases
[
### Build responsive front-end designs
Use Codex to translate screenshots and design briefs into code that matches the repo's...
Front-end Design
](/codex/use-cases/frontend-designs)[
### Generate slide decks
Use Codex to update existing presentations or build new decks by editing slides directly...
Data Integrations
](/codex/use-cases/generate-slide-decks)[
### Make granular UI changes
Use Codex to make one small UI adjustment at a time in an existing app, verify it in the...
Front-end Design
](/codex/use-cases/make-granular-ui-changes)