Make granular UI changes | Codex use cases
Primary navigation
Search docs
### Suggested
responses createreasoning\_effortrealtimeprompt caching
Docs Use cases
* [ Home ](/codex/use-cases)
* [ Collections ](/codex/use-cases/collections)
[API Dashboard](https://platform.openai.com/login)
Codex use case
# Make granular UI changes
Use Codex-Spark for fast, focused UI iteration in an existing app.
Difficulty **Easy**
Time horizon **5m**
Use Codex to make one small UI adjustment at a time in an existing app, verify it in the browser, and keep iterating quickly from a popped-out chat window near your preview.
## Best for
* Existing apps where the main structure is already built and you need small visual adjustments
* Fast product or design review loops where each note should become one focused code change
* UI polish passes that need browser verification but should not turn into a broad redesign
# Contents
[
← All use cases
](/codex/use-cases)
Copy page [ Export as PDF ](/codex/use-cases/make-granular-ui-changes/?export=pdf)
Use Codex to make one small UI adjustment at a time in an existing app, verify it in the browser, and keep iterating quickly from a popped-out chat window near your preview.
Easy
5m
Related links
[ Codex-Spark ](/codex/speed#codex-spark)[ Floating pop-out window ](/codex/app/features#floating-pop-out-window)
##
Best for
* Existing apps where the main structure is already built and you need small visual adjustments
* Fast product or design review loops where each note should become one focused code change
* UI polish passes that need browser verification but should not turn into a broad redesign
##
Skills & Plugins
*
[ Playwright ](https://github.com/openai/skills/tree/main/skills/.curated/playwright-interactive)
Open the running app in a real browser, inspect the changed route, and verify each small UI adjustment before the next iteration.
|
Skill
|
Why use it
|
|[ Playwright ](https://github.com/openai/skills/tree/main/skills/.curated/playwright-interactive)| Open the running app in a real browser, inspect the changed route, and verify each small UI adjustment before the next iteration. |
##
Starter prompt
Make this UI change in the existing app:
[describe the exact spacing, alignment, color, copy, responsive, or component-state adjustment]
Constraints:
- Change only the files needed for this UI adjustment.
- Reuse existing components, tokens, icons, and layout patterns.
- Keep behavior, data flow, and routing unchanged unless I explicitly ask for it.
- Start or reuse the dev server, inspect the current UI in the browser, make the smallest patch, and verify the result visually.
Stop after this one change and summarize the files changed plus the browser check you ran.
[Open in the Codex app](<codex://new?prompt=Make+this+UI+change+in+the+existing+app:
[describe+the+exact+spacing,+alignment,+color,+copy,+responsive,+or+component-state+adjustment]
Constraints:
-+Change+only+the+files+needed+for+this+UI+adjustment.
-+Reuse+existing+components,+tokens,+icons,+and+layout+patterns.
-+Keep+behavior,+data+flow,+and+routing+unchanged+unless+I+explicitly+ask+for+it.
-+Start+or+reuse+the+dev+server,+inspect+the+current+UI+in+the+browser,+make+the+smallest+patch,+and+verify+the+result+visually.
Stop+after+this+one+change+and+summarize+the+files+changed+plus+the+browser+check+you+ran.>)
Make this UI change in the existing app:
[describe the exact spacing, alignment, color, copy, responsive, or component-state adjustment]
Constraints:
- Change only the files needed for this UI adjustment.
- Reuse existing components, tokens, icons, and layout patterns.
- Keep behavior, data flow, and routing unchanged unless I explicitly ask for it.
- Start or reuse the dev server, inspect the current UI in the browser, make the smallest patch, and verify the result visually.
Stop after this one change and summarize the files changed plus the browser check you ran.
## Introduction
When you have an existing app and want to iterate fast on the UI, you can use `gpt-5.3-codex-spark` to make small, focused changes to the UI.
Codex-Spark is our fastest model, optimized for near-instant, real-time coding iteration.
This works best as a tight loop: one visual note, one focused edit, one browser check, then the next note.
You can use the [Codex Spark model](/codex/models#gpt-53-codex-spark) for this
task. It is available on Pro plans.
## Pick your model
For fast UI iteration, start with `gpt-5.3-codex-spark` if you have access to it. It is less capable that our general-purpose models, but is designed for real-time coding iteration. If you don’t have access to it, use our latest model with `medium` or `low` reasoning effort.
That tradeoff is useful for granular UI work. You usually do not need the deepest model to move a button, tune a breakpoint, or adjust a component state. You need a model that responds quickly, understands the local code, edits the right file, and can repeat the loop without making the iteration feel heavy.
## Development flow
1. Open the existing app and get the relevant route or component visible.
2. Pop out the active Codex conversation into a [floating window](/codex/app/features#floating-pop-out-window) and keep it near your browser, editor, or design preview while you work.
3. Give Codex one specific UI change at a time. Include the route, viewport, current screenshot, target screenshot, or exact product note if you have it.
4. Ask Codex to inspect the current implementation, make the smallest defensible edit, and preserve the app’s existing components, tokens, layout primitives, and data flow.
5. Review the result, then send the next small adjustment in the same thread.
## Write small prompts
Granular UI prompts should be direct and narrow. A good prompt names the surface, the target change, and the validation you expect.
If the result is close but not quite right, keep the follow-up equally specific:
The change is close. Keep the implementation, but adjust only this detail:
[describe the remaining mismatch]
Verify the same route and viewport again before you stop.
## When to slow down
Do not keep using the fast loop if the task stops being granular. Switch to a stronger model and a more deliberate prompt when the change needs broad refactoring, a new design system primitive, non-trivial accessibility behavior, or a product decision that affects more than one screen.
Fast UI iteration works best when Codex is adjusting an already-understood surface, not redesigning the app from scratch.
##
Related use cases
[
### Add iOS app intents
Use Codex and the Build iOS Apps plugin to identify the actions and entities your app should...
iOS Code
](/codex/use-cases/ios-app-intents)[
### Adopt liquid glass
Use Codex and the Build iOS Apps plugin to audit existing iPhone and iPad UI, replace custom...
iOS Code
](/codex/use-cases/ios-liquid-glass)[
### Build a Mac app shell
Use Codex and the Build macOS Apps plugin to turn an app idea into a desktop-native...
macOS Code
](/codex/use-cases/macos-sidebar-detail-inspector)