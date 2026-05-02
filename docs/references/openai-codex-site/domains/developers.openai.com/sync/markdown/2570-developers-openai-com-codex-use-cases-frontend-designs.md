Build responsive front-end designs | Codex use cases
Primary navigation
Search docs
### Suggested
responses createreasoning\_effortrealtimeprompt caching
Docs Use cases
* [ Home ](/codex/use-cases)
* [ Collections ](/codex/use-cases/collections)
[API Dashboard](https://platform.openai.com/login)
Codex use case
# Build responsive front-end designs
Turn screenshots and visual references into responsive UI with visual checks.
Difficulty **Intermediate**
Time horizon **1h**
Use Codex to translate screenshots and design briefs into code that matches the repo's design system, then use Playwright to compare the implementation to your references for different screen sizes and iterate until it looks right.
## Best for
* Creating new front-end projects from scratch
* Implementing already designed screens or flows from screenshots in an existing codebase
# Contents
[
← All use cases
](/codex/use-cases)
Copy page [ Export as PDF ](/codex/use-cases/frontend-designs/?export=pdf)
Use Codex to translate screenshots and design briefs into code that matches the repo's design system, then use Playwright to compare the implementation to your references for different screen sizes and iterate until it looks right.
Intermediate
1h
Related links
[ Codex skills ](/codex/skills)
##
Best for
* Creating new front-end projects from scratch
* Implementing already designed screens or flows from screenshots in an existing codebase
##
Skills & Plugins
*
[ Playwright ](https://github.com/openai/skills/tree/main/skills/.curated/playwright-interactive)
Open the app in a real browser to verify the implementation and iterate on layout and behavior.
|
Skill
|
Why use it
|
|[ Playwright ](https://github.com/openai/skills/tree/main/skills/.curated/playwright-interactive)| Open the app in a real browser to verify the implementation and iterate on layout and behavior. |
##
Starter prompt
Implement this UI in the current project using the screenshots and notes I provide as the source of truth.
Requirements:
- Reuse the existing design system components and tokens.
- Translate the screenshots into this repo's utilities and component patterns instead of inventing a parallel system.
- Match spacing, layout, hierarchy, and responsive behavior closely.
- Respect the repo's routing, state, and data-fetch patterns.
- Make the page responsive on desktop and mobile.
- If any screenshot detail is ambiguous, choose the simplest implementation that still matches the overall direction and note the assumption briefly.
Validation:
- Compare the finished UI against the provided screenshots for both look and behavior.
- Use $playwright-interactive to check that the UI matches the references and iterate as needed until it does.
[Open in the Codex app](<codex://new?prompt=Implement+this+UI+in+the+current+project+using+the+screenshots+and+notes+I+provide+as+the+source+of+truth.
Requirements:
-+Reuse+the+existing+design+system+components+and+tokens.
-+Translate+the+screenshots+into+this+repo's+utilities+and+component+patterns+instead+of+inventing+a+parallel+system.
-+Match+spacing,+layout,+hierarchy,+and+responsive+behavior+closely.
-+Respect+the+repo's+routing,+state,+and+data-fetch+patterns.
-+Make+the+page+responsive+on+desktop+and+mobile.
-+If+any+screenshot+detail+is+ambiguous,+choose+the+simplest+implementation+that+still+matches+the+overall+direction+and+note+the+assumption+briefly.
Validation:
-+Compare+the+finished+UI+against+the+provided+screenshots+for+both+look+and+behavior.
-+Use+$playwright-interactive+to+check+that+the+UI+matches+the+references+and+iterate+as+needed+until+it+does.>)
Implement this UI in the current project using the screenshots and notes I provide as the source of truth.
Requirements:
- Reuse the existing design system components and tokens.
- Translate the screenshots into this repo's utilities and component patterns instead of inventing a parallel system.
- Match spacing, layout, hierarchy, and responsive behavior closely.
- Respect the repo's routing, state, and data-fetch patterns.
- Make the page responsive on desktop and mobile.
- If any screenshot detail is ambiguous, choose the simplest implementation that still matches the overall direction and note the assumption briefly.
Validation:
- Compare the finished UI against the provided screenshots for both look and behavior.
- Use $playwright-interactive to check that the UI matches the references and iterate as needed until it does.
## Introduction
When you have screenshots, a short design brief, or a few references for inspiration, Codex can turn those into responsive UI without ignoring the patterns already established in your project.
With the Playwright skill, Codex can open the app in a real browser, compare the implementation to your screenshots for different screen sizes, and iterate on layout or behavior until the result is closer to the target.
## Start from references
Give Codex the clearest references you have for the UI you want. A single screenshot can be enough for a narrow task, but the handoff gets better when you include multiple states such as desktop and mobile layouts, hover or selected states, and any empty or loading views that matter.
The references do not need to be perfect design deliverables. They just need to make the intended hierarchy, spacing, and direction concrete enough that Codex is not guessing.
## Be specific
The more specific you are about the expected interaction patterns and the style you want, the better the result will be.
The model tends to default to high-frequency patterns and style so if it’s not obvious from your references that you want something else, the UI might look generic.
The more input you give, be it more reference inspiration or more specific instructions, the more you can expect to have a UI that stands out.
## Prepare the design system
Codex works best when the target repo already has a clear component layer. Codex can automatically use your existing component and design system instead of recreating them from scratch.
If you think it’s necessary (i.e. if you’re not using a standard stack), specify to Codex which primitives to reuse, where your tokens live, and what the repo considers canonical for buttons, inputs, cards, typography, and icons.
If you’re starting from an existing codebase, it’s very likely that Codex will understand on its own how to use your components and design system, but if starting from scratch, it’s a good idea to be explicit.
Ask Codex to treat the screenshots as a visual target but to translate that target into the project’s actual utilities, component wrappers, color system, typography scale, spacing tokens, routing, state management, and data-fetch patterns.
## Leverage Playwright
Playwright is a great tool to help Codex iterate on the UI. With it, Codex can open the app in a real browser, compare the implementation to the screenshots you provided, and iterate on layout or behavior.
It can resize the browser window to different screen sizes and check the layout at different breakpoints.
Make sure you have the Playwright interactive skill enabled in Codex. For more details, see the [skills documentation](/codex/skills).
## Iterate
The first pass should already be directionally close to the screenshots. For complex layouts, interactions, or animation-heavy UI, expect a few rounds of adjustment.
Ask Codex to compare the implementation back to the screenshots, not just whether the page builds. When conflicts come up, it should prefer the repo’s design-system tokens and only make minimal spacing or sizing adjustments needed to preserve the overall look of the design.
Use additional screenshots or short notes if they help clarify states that are not obvious from one image.
### Suggested follow-up prompt
[current implementation image] [reference image]
This doesn't look right. Make sure to implement something that matches closely the reference:
[if needed, specify what is different]
##
Related use cases
[
### Turn Figma designs into code
Use Codex to pull design context, assets, and variants from Figma, translate them into code...
Front-end Design
](/codex/use-cases/figma-designs-to-code)[
### Generate slide decks
Use Codex to update existing presentations or build new decks by editing slides directly...
Data Integrations
](/codex/use-cases/generate-slide-decks)[
### Make granular UI changes
Use Codex to make one small UI adjustment at a time in an existing app, verify it in the...
Front-end Design
](/codex/use-cases/make-granular-ui-changes)