Generate slide decks | Codex use cases
Primary navigation
Search docs
### Suggested
responses createreasoning\_effortrealtimeprompt caching
Docs Use cases
* [ Home ](/codex/use-cases)
* [ Collections ](/codex/use-cases/collections)
[API Dashboard](https://platform.openai.com/login)
Codex use case
# Generate slide decks
Manipulate pptx files and use image generation to automate slide creation.
Difficulty **Easy**
Time horizon **30m**
Use Codex to update existing presentations or build new decks by editing slides directly through code, generating visuals, and applying repeatable layout rules slide by slide.
## Best for
* Teams turning notes or structured inputs into repeatable slide decks
* Creating new visual presentations from scratch
* Rebuilding or extending decks from screenshots, PDFs, or reference presentations
# Contents
[
← All use cases
](/codex/use-cases)
Copy page [ Export as PDF ](/codex/use-cases/generate-slide-decks/?export=pdf)
Use Codex to update existing presentations or build new decks by editing slides directly through code, generating visuals, and applying repeatable layout rules slide by slide.
Easy
30m
Related links
[ Image generation guide ](/api/docs/guides/image-generation)
##
Best for
* Teams turning notes or structured inputs into repeatable slide decks
* Creating new visual presentations from scratch
* Rebuilding or extending decks from screenshots, PDFs, or reference presentations
##
Skills & Plugins
*
Slides
Create and edit `.pptx` decks in JavaScript with PptxGenJS, bundled helpers, and render and validation scripts for overflow, overlap, and font checks.
*
ImageGen
Generate illustrations, cover art, diagrams, and slide visuals that match one reusable visual direction.
|
Skill
|
Why use it
|
| Slides | Create and edit `.pptx` decks in JavaScript with PptxGenJS, bundled helpers, and render and validation scripts for overflow, overlap, and font checks. |
| ImageGen | Generate illustrations, cover art, diagrams, and slide visuals that match one reusable visual direction. |
##
Starter prompt
Use the $slides and $imagegen skills to edit this slide deck in the following way:
- If present, add logo.png in the bottom right corner on every slide
- On slides X, Y and Z, move the text to the left and use image generation to generate an illustration (style: abstract, digital art) on the right
- Preserve text as text and simple charts as native PowerPoint charts where practical.
- Add these slides: [describe new slides here]
- Use the existing branding on new slides and new text (colors, fonts, layout, etc.)
- Render the updated deck to slide images, review the output, and fix layout issues before delivery.
- Run overflow and font-substitution checks before delivery, especially if the deck is dense.
- Save reusable prompts or generation notes when you create a batch of related images.
Output:
- A copy of the slide deck with the changes applied
- notes on which slides were generated, rewritten, or left unchanged
[Open in the Codex app](<codex://new?prompt=Use+the+$slides+and+$imagegen+skills+to+edit+this+slide+deck+in+the+following+way:
-+If+present,+add+logo.png+in+the+bottom+right+corner+on+every+slide
-+On+slides+X,+Y+and+Z,+move+the+text+to+the+left+and+use+image+generation+to+generate+an+illustration+(style:+abstract,+digital+art)+on+the+right
-+Preserve+text+as+text+and+simple+charts+as+native+PowerPoint+charts+where+practical.
-+Add+these+slides:+[describe+new+slides+here]
-+Use+the+existing+branding+on+new+slides+and+new+text+(colors,+fonts,+layout,+etc.)+
-+Render+the+updated+deck+to+slide+images,+review+the+output,+and+fix+layout+issues+before+delivery.
-+Run+overflow+and+font-substitution+checks+before+delivery,+especially+if+the+deck+is+dense.
-+Save+reusable+prompts+or+generation+notes+when+you+create+a+batch+of+related+images.
Output:
-+A+copy+of+the+slide+deck+with+the+changes+applied
-+notes+on+which+slides+were+generated,+rewritten,+or+left+unchanged>)
Use the $slides and $imagegen skills to edit this slide deck in the following way:
- If present, add logo.png in the bottom right corner on every slide
- On slides X, Y and Z, move the text to the left and use image generation to generate an illustration (style: abstract, digital art) on the right
- Preserve text as text and simple charts as native PowerPoint charts where practical.
- Add these slides: [describe new slides here]
- Use the existing branding on new slides and new text (colors, fonts, layout, etc.)
- Render the updated deck to slide images, review the output, and fix layout issues before delivery.
- Run overflow and font-substitution checks before delivery, especially if the deck is dense.
- Save reusable prompts or generation notes when you create a batch of related images.
Output:
- A copy of the slide deck with the changes applied
- notes on which slides were generated, rewritten, or left unchanged
## Introduction
You can use Codex to manipulate PowerPoint decks in a systematic way, using the slides system skill, which comes with Codex by default, to create and edit decks with PptxGenJS, and using image generation to generate visuals for the slides.
Skills can be installed directly from the Codex app–see our [skills documentation](/codex/skills) for more details.
You can create new decks from scratch, describing what you want, but the ideal workflow is to start from an existing deck–already set up with your branding guidelines–and ask Codex to edit it.
## Start from the source deck and references
If a deck already exists, ask Codex to inspect it before making changes.
The slides system skill is opinionated here: match the source aspect ratio before you rebuild layout, and default to 16:9 only when the source material does not already define the deck size. If the references are screenshots or a PDF, ask Codex to render or inspect them first so it can compare slide geometry visually instead of guessing.
## Keep the deck editable
When building out new slides, ask Codex to keep the slides editable: when slides contain text, charts, or simple layout elements, those should stay PowerPoint-native when practical. Text should stay text. Simple bar, line, pie, and histogram visuals should stay native charts when possible. For diagrams or visuals that are too custom for native slide objects, Codex can generate or place SVG and image assets deliberately instead of rasterizing the whole slide.
For example, if you want to build a complex timeline with illustrations, instead of generating a whole image, ask Codex to generate each illustration separately (using a set style prompt as reference), place them on the slide, then link them using native lines. The text and dates should be text objects as well, and not included in the illustrations.
## Generate visuals intentionally
The imagegen system skill is already installed with Codex and is most useful when the slides need a cover image, a concept illustration, or a lightweight diagram that would otherwise take manual design work. Ask Codex to define the visual direction first, then reuse that direction consistently across the whole deck.
When several slides need related visuals, have Codex save the prompts or generation notes it used. That makes the deck easier to extend later without starting over stylistically.
## Keep slide logic explicit
Deck automation works better when Codex treats each slide as its own decision. Some slides should preserve exact copy, some need a stronger headline and cleaner structure, and some should stay mostly untouched apart from asset cleanup or formatting fixes.
The slides system skill also ships with bundled layout helpers. Ask Codex to copy those helpers into the working directory and reuse them instead of reimplementing spacing, text-sizing, and image-placement logic on every deck.
## Validation before delivery
Decks are easy to get almost right and still ship with clipped text, substituted fonts, or layout drift that only shows up after export. The slides system skill includes scripts to render decks to per-slide PNGs, build a quick montage for review, detect overflow beyond the slide canvas, and report missing or substituted fonts.
Ask Codex to use those checks before it hands back the final deck, especially when slides are dense or margins are tight.
## Example ideas
Here are some ideas you could try with this use case:
### New deck from scratch
You can create new slide decks from scratch, describing what you want slide by slide and the overall vibe.
If you have assets like logos or images, you can copy them in the same folder so that Codex can easily access them.
Create a new slide deck with the following slides:
- Slide 1: Title slide with the company logo (logo.png) and the title of the presentation
- Slide 2: Agenda slide with the key points of the presentation
- Slide 3: [TITLE] [TAGLINE] [DESCRIPTION]
- ...
- Slide N: Conclusion slide with the key takeaways
- Slide N+1: Q&A slide with my picture (my-picture.png)
### Deck template update
You can update a deck template on a regular basis (weekly, monthly, quarterly, etc.) with new content.
If you’re doing this frequently, create a file like `guidelines.md` to define the content and structure of the deck and how it should be updated.
Combine it with other skills to fetch information from your preferred data
sources.
For example, if you need to give quarterly updates to your stakeholders, you can update the deck template with new numbers and insights.
Update the deck template, pulling content from [integration 1] and [integration 2].
Make sure to follow guidelines defined in guidelines.md.
### Adjust existing deck
If you built a deck but want to adjust it to fix spacing, misaligned text, or other layout issues, you can ask Codex to fix it.
Adjust the deck to make sure the following layout rules are followed:
- Spacing should be consistent when there are multiple items on the same slide displayed in a row or grid.
- When there are multiple items on the same slide displayed in a row or grid, the items are aligned horizontally or vertically depending on the content.
- All text boxes should be aligned left, except when they are below an illustration
- All titles should use the font [font name] and size [size]
- All captions should be in [color]
- ....
##
Related use cases
[
### Coordinate new-hire onboarding
Use Codex to gather approved new-hire context, stage tracker updates, draft team-by-team...
Integrations Data
](/codex/use-cases/new-hire-onboarding)[
### Turn feedback into actions
Connect Codex to multiple data sources such as Slack, GitHub, Linear, or Google Drive to...
Data Integrations
](/codex/use-cases/feedback-synthesis)[
### Complete tasks from messages
Use Computer Use to read one Messages thread, complete the task, and draft a reply.
Knowledge Work Integrations
](/codex/use-cases/complete-tasks-from-messages)