Gpt-image-1.5 Prompting Guide
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
Dec 16, 2025
# Gpt-image-1.5 Prompting Guide
[ AB ](https://github.com/annikab-oai)[ MS ](https://github.com/msingh-openai)[ EO ](https://www.linkedin.com/in/emreokcular/)
[ Annika Brundyn , ](https://github.com/annikab-oai)[ Mandeep Singh
(OpenAI)
, ](https://github.com/msingh-openai)[ Emre Okcular ](https://www.linkedin.com/in/emreokcular/)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/multimodal/image-gen-1.5-prompting_guide.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/multimodal/image-gen-1.5-prompting_guide.ipynb)
## 1. Introduction
`gpt-image-1.5` is our latest image generation model, designed for production-quality visuals and highly controllable creative workflows. It delivers major improvements in realism, accuracy, and editability, making it well-suited for both professional design tasks and iterative content creation. It delivers major improvements in realism, accuracy, and editability compared to the previous generation, and supports both high-quality rendering and low-latency use cases.
Key Capabilities include:
* **High-fidelity photorealism** with natural lighting, accurate materials, and rich color rendering
* **Flexible quality–latency tradeoffs**, allowing faster generation at lower settings while still exceeding the visual quality of prior-generation image models
* **Robust facial and identity preservation** for edits, character consistency, and multi-step workflows
* **Reliable text rendering** with crisp lettering, consistent layout, and strong contrast inside images
* **Complex structured visuals**, including infographics, diagrams, and multi-panel compositions
* **Precise style control and style transfer** with minimal prompting, supporting everything from branded design systems to fine-art styles
* **Strong real-world knowledge and reasoning**, enabling accurate depictions of objects, environments, and scenarios
This guide highlights prompting patterns, best practices, and example prompts drawn from real production use cases.
## 2. Prompting Fundamentals
* **Structure + goal:** Write prompts in a consistent order (background/scene → subject → key details → constraints) and include the intended use (ad, UI mock, infographic) to set the “mode” and level of polish. For complex requests, use short labeled segments or line breaks instead of one long paragraph.
* **Specificity + quality cues:** Be concrete about materials, shapes, textures, and the visual medium (photo, watercolor, 3D render), and add targeted “quality levers” only when needed (e.g., *film grain*, *textured brushstrokes*, *macro detail*). For photorealism, camera/composition terms (lens, aperture feel, lighting) often steer realism more reliably than generic “8K/ultra-detailed.”
* **Latency vs fidelity**: For latency-sensitive or high-volume use cases, start with setting quality=“low” and evaluate whether it meets your visual requirements. In many cases, it provides sufficient fidelity with significantly faster generation.
* **Composition:** Specify framing and viewpoint (close-up, wide, top-down), perspective/angle (eye-level, low-angle), and lighting/mood (soft diffuse, golden hour, high-contrast) to control the shot. If layout matters, call out placement (e.g., “logo top-right,” “subject centered with negative space on left”).
* **Constraints (what to change vs preserve):** State exclusions and invariants explicitly (e.g., “no watermark,” “no extra text,” “no logos/trademarks,” “preserve identity/geometry/layout/brand elements”). For edits, use “change only X” + “keep everything else the same,” and repeat the preserve list on each iteration to reduce drift.
* **Text in images:** Put literal text in **quotes** or **ALL CAPS** and specify typography details (font style, size, color, placement) as constraints. For tricky words (brand names, uncommon spellings), spell them out letter-by-letter to improve character accuracy.
* **Multi-image inputs:** Reference each input by **index and description** (“Image 1: product photo… Image 2: style reference…”) and describe how they interact (“apply Image 2’s style to Image 1”). When compositing, be explicit about which elements move where (“put the bird from Image 1 on the elephant in Image 2”).
* **Iterate instead of overloading:** Start with a clean base prompt, then refine with small, single-change follow-ups (“make lighting warmer,” “remove the extra tree,” “restore the original background”). Use references like “same style as before” or “the subject” to leverage context, but re-specify critical details if they start to drift.
## 3. Setup
Run this once. It:
* creates the API client
* creates `output\_images/` in the images folder.
* adds a small helper to save base64 images
Put any reference images used for edits into `input\_images/` (or update the paths in the examples).
```
`import os
import base64
from openai import OpenAI
client = OpenAI()
os.makedirs("../../images/input\_images", exist\_ok=True)
os.makedirs("../../images/output\_images", exist\_ok=True)
def save\_image(result, filename: str) -\> None:
"""
Saves the first returned image to the given filename inside the output\_images folder.
"""
image\_base64 = result.data[0].b64\_json
out\_path = os.path.join("../../images/output\_images", filename)
with open(out\_path, "wb") as f:
f.write(base64.b64decode(image\_base64))`
```
## 4. Use Cases — Generate (text → image)
## 4.1 Infographics
Use infographics to explain structured information for a specific audience: students, executives, customers, or the general public. Examples include explainers, posters, labeled diagrams, timelines, and “visual wiki” assets. For dense layouts or heavy in-image text, it’s recommedned to set output generation quality to “high”.
```
`prompt = """
Create a detailed Infographic of the functioning and flow of an automatic coffee machine like a Jura.
From bean basket, to grinding, to scale, water tank, boiler, etc.
I'd like to understand technically and visually the flow.
"""
result = client.images.generate(
model="gpt-image-1.5",
prompt=prompt
)
save\_image(result, "infographic\_coffee\_machine.png")`
```
## 4.2 Translation in Images
Used for localizing existing designs (ads, UI screenshots, packaging, infographics) into another language without rebuilding the layout from scratch. The key is to preserve everything except the text—keep typography style, placement, spacing, and hierarchy consistent—while translating verbatim and accurately, with no extra words, no reflow unless necessary, and no unintended edits to logos, icons, or imagery.
```
`prompt = """
Translate the text in the infographic to Spanish. Do not change any other aspect of the image.
"""
result = client.images.edit(
model="gpt-image-1.5",
image=[
open("../../images/output\_images/infographic\_coffee\_machine.png", "rb"),
],
prompt=prompt
)
save\_image(result, "infographic\_coffee\_machine\_sp.png")`
```
Output Image:
## 4.3 Photorealistic Images that Feel “natural”
To get believable photorealism, prompt the model as if a real photo is being captured in the moment. Use photography language (lens, lighting, framing) and explicitly ask for real texture (pores, wrinkles, fabric wear, imperfections). Avoid words that imply studio polish or staging. When detail matters, set quality=“high”.
```
`prompt = """
Create a photorealistic candid photograph of an elderly sailor standing on a small fishing boat.
He has weathered skin with visible wrinkles, pores, and sun texture, and a few faded traditional sailor tattoos on his arms.
He is calmly adjusting a net while his dog sits nearby on the deck. Shot like a 35mm film photograph, medium close-up at eye level, using a 50mm lens.
Soft coastal daylight, shallow depth of field, subtle film grain, natural color balance.
The image should feel honest and unposed, with real skin texture, worn materials, and everyday detail. No glamorization, no heavy retouching.
"""
result = client.images.generate(
model="gpt-image-1.5",
prompt=prompt,
quality="high"
)
save\_image(result, "photorealism.png")`
```
Output Image:
## 4.4 World knowledge
GPT-image-1.5 has built-in reasoning and strong world knowledge. For example, when asked to generate a scene set in Bethel, New York in August 1969, it can infer Woodstock and produce an accurate, context-appropriate image without being explicitly told about the event.
```
`prompt = """
Create a realistic outdoor crowd scene in Bethel, New York on August 16, 1969.
Photorealistic, period-accurate clothing, staging, and environment.
"""
result = client.images.generate(
model="gpt-image-1.5",
prompt=prompt
)
save\_image(result, "world\_knowledge.png")`
```
Output Image:
## 4.5 Logo Generation
Strong logo generation comes from clear brand constraints and simplicity. Describe the brand’s personality and use case, then ask for a clean, original mark with strong shape, balanced negative space, and scalability across sizes.
You can specify parameter “n” to denote the number of variations you would like to generate.
```
`prompt = """
Create an original, non-infringing logo for a company called Field & Flour, a local bakery.
The logo should feel warm, simple, and timeless. Use clean, vector-like shapes, a strong silhouette, and balanced negative space.
Favor simplicity over detail so it reads clearly at small and large sizes. Flat design, minimal strokes, no gradients unless essential.
Plain background. Deliver a single centered logo with generous padding. No watermark.
"""
result = client.images.generate(
model="gpt-image-1.5",
prompt=prompt,
n=4 # Generate 4 versions of the logo
)
# Save all 4 images to separate files
for i, item in enumerate(result.data, start=1):
image\_base64 = item.b64\_json
image\_bytes = base64.b64decode(image\_base64)
with open(f"../../images/output\_images/logo\_generation\_{i}.png", "wb") as f:
f.write(image\_bytes)`
```
Output Images:
|Option 1|Option 2|Option 3|Option 4|
|||||
## 4.6 Story-to-Comic Strip
For story-to-comic generation, define the narrative as a sequence of clear visual beats, one per panel. Keep descriptions concrete and action-focused so the model can translate the story into readable, well-paced panels.
```
`prompt = """
Create a short vertical comic-style reel with 4 equal-sized panels.
Panel 1: The owner leaves through the front door. The pet is framed in the window behind them, small against the glass, eyes wide, paws pressed high, the house suddenly quiet.
Panel 2: The door clicks shut. Silence breaks. The pet slowly turns toward the empty house, posture shifting, eyes sharp with possibility.
Panel 3: The house transformed. The pet sprawls across the couch like it owns the place, crumbs nearby, sunlight cutting across the room like a spotlight.
Panel 4: The door opens. The pet is seated perfectly by the entrance, alert and composed, as if nothing happened.
"""
result = client.images.generate(
model="gpt-image-1.5",
prompt=prompt
)
save\_image(result, "comic\_reel.png")`
```
Output Image:
## 4.7 UI Mockups
UI mockups work best when you describe the product as if it already exists. Focus on layout, hierarchy, spacing, and real interface elements, and avoid concept art language so the result looks like a usable, shipped interface rather than a design sketch.
```
`prompt = """
Create a realistic mobile app UI mockup for a local farmers market.
Show today’s market with a simple header, a short list of vendors with small photos and categories, a small “Today’s specials” section, and basic information for location and hours.
Design it to be practical, and easy to use. White background, subtle natural accent colors, clear typography, and minimal decoration.
It should look like a real, well-designed, beautiful app for a small local market.
Place the UI mockup in an iPhone frame.
"""
result = client.images.generate(
model="gpt-image-1.5",
prompt=prompt
)
save\_image(result, "ui\_farmers\_market.png")`
```
Output Image:
## 5. Use cases — Edit (text + image → image)
## 5.1 Style Transfer
Style transfer is useful when you want to keep the *visual language* of a reference image (palette, texture, brushwork, film grain, etc.) while changing the subject or scene. For best results, describe what must stay consistent (style cues) and what must change (new content), and add hard constraints like background, framing, and “no extra elements” to prevent drift.
```
`prompt = """
Use the same style from the input image and generate a man riding a motorcycle on a white background.
"""
result = client.images.edit(
model="gpt-image-1.5",
image=[
open("../../images/input\_images/pixels.png", "rb"),
],
prompt=prompt
)
save\_image(result, "motorcycle.png")`
```
Input Image:
Output Image:
## 5.2 Virtual Clothing Try-On
Virtual try-on is ideal for ecommerce previews where identity preservation is critical. The key is to explicitly lock the person (face, body shape, pose, hair, expression) and allow changes *only* to garments, then require realistic fit (draping, folds, occlusion) plus consistent lighting/shadows so the outfit looks naturally worn—not pasted on.
```
`prompt = """
Edit the image to dress the woman using the provided clothing images. Do not change her face, facial features, skin tone, body shape, pose, or identity in any way. Preserve her exact likeness, expression, hairstyle, and proportions. Replace only the clothing, fitting the garments naturally to her existing pose and body geometry with realistic fabric behavior. Match lighting, shadows, and color temperature to the original photo so the outfit integrates photorealistically, without looking pasted on. Do not change the background, camera angle, framing, or image quality, and do not add accessories, text, logos, or watermarks.
"""
result = client.images.edit(
model="gpt-image-1.5",
image=[
open("../../images/input\_images/woman\_in\_museum.png", "rb"),
open("../../images/input\_images/tank\_top.png", "rb"),
open("../../images/input\_images/jacket.png", "rb"),
open("../../images/input\_images/tank\_top.png", "rb"),
open("../../images/input\_images/boots.png", "rb"),
],
prompt=prompt
)
save\_image(result, "outfit.png")`
```
Input Images:
|Full Body|Item 1|
|||
|Item 2|Item 3|
|||
Output Image:
## 5.3 Drawing → Image (Rendering)
Sketch-to-render workflows are great for turning rough drawings into photorealistic concepts while keeping the original intent. Treat the prompt like a spec: preserve layout and perspective, then *add realism* by specifying plausible materials, lighting, and environment. Include “do not add new elements/text” to avoid creative reinterpretations.
```
`prompt = """
Turn this drawing into a photorealistic image.
Preserve the exact layout, proportions, and perspective.
Choose realistic materials and lighting consistent with the sketch intent.
Do not add new elements or text.
"""
result = client.images.edit(
model="gpt-image-1.5",
image=[
open("../../images/input\_images/drawings.png", "rb"),
],
prompt=prompt
)
save\_image(result, "realistic\_valley.png")`
```
Input Image:
Output Image:
## 5.4 Product Mockups (transparent background + label integrity)
Product extraction and mockup prep is commonly used for catalogs, marketplaces, and design systems. Success depends on edge quality (clean silhouette, no fringing/halos) and label integrity (text stays sharp and unchanged). If you want realism without re-styling, ask for only light polishing and optionally a subtle contact shadow that respects the alpha.
```
`prompt = """
Extract the product from the input image.
Output: transparent background (RGBA PNG), crisp silhouette, no halos/fringing.
Preserve product geometry and label legibility exactly.
Optional: subtle, realistic contact shadow in the alpha (no hard cut line).
Do not restyle the product; only remove background and lightly polish.
"""
result = client.images.edit(
model="gpt-image-1.5",
image=[
open("../../images/input\_images/shampoo.png", "rb"),
],
prompt=prompt
)
save\_image(result, "extract\_product.png")`
```
Input Image:
Output Image:
## 5.5 Marketing Creatives with Real Text In-Image
Marketing creatives with real in-image text are great for rapid ad concepting, but typography needs explicit constraints. Put the exact copy in quotes, demand verbatim rendering (no extra characters), and describe placement and font style. If text fidelity is imperfect, keep the prompt strict and iterate—small wording/layout tweaks usually improve legibility.
```
`prompt = """
Create a realistic billboard mockup of the shampoo on a highway scene during sunset.
Billboard text (EXACT, verbatim, no extra characters):
"Fresh and clean"
Typography: bold sans-serif, high contrast, centered, clean kerning.
Ensure text appears once and is perfectly legible.
No watermarks, no logos.
"""
result = client.images.edit(
model="gpt-image-1.5",
image=[
open("../../images/input\_images/shampoo.png", "rb"),
],
prompt=prompt
)
save\_image(result, "billboard.png")`
```
Input Image:
Output Image:
## 5.6 Lighting and Weather Transformation
Used to re-stage a photo for different moods, seasons, or time-of-day variants (e.g., sunny → overcast, daytime → dusk, clear → snowy) while keeping the scene composition intact. The key is to change only environmental conditions—lighting direction/quality, shadows, atmosphere, precipitation, and ground wetness—while preserving identity, geometry, camera angle, and object placement so it still reads as the same original photo.
```
`prompt = """
Make it look like a winter evening with snowfall.
"""
result = client.images.edit(
model="gpt-image-1.5",
input\_fidelity="high",
quality="high",
image=[
open("../../images/output\_images/billboard.png", "rb"),
],
prompt=prompt
)
save\_image(result, "billboard\_winter.png")`
```
Output Image:
## 5.7 Object Removal
Person-in-scene compositing is useful for storyboards, campaigns, and “what if” scenarios where facial/identity preservation matters. Anchor realism by specifying a grounded photographic look (natural lighting, believable detail, no cinematic grading), and lock what must not change about the subject. When available, higher input fidelity helps maintain likeness during larger scene edits.
```
`prompt = """
Remove the tree logo from the white t-shirt of the man. Do not change anything else.
"""
prompt = """
Remove the red stripes from the white t-shirt of the man. Do not change anything else.
"""
prompt = """
Change the color of thered hat to light blue as velvet. Do not change anything else.
"""
result = client.images.edit(
model="gpt-image-1.5",
input\_fidelity="high",
quality="high",
image=[
open("../../images/output\_images/man\_with\_blue\_hat.png", "rb"),
],
prompt=prompt
)
save\_image(result, "man\_with\_no\_flower.png")`
```
|Original Input|Remove Red Stripes|Change Hat Color|
||||
## 5.8 Insert the Person Into a Scene
Person-in-scene compositing is useful for storyboards, campaigns, and “what if” scenarios where facial/identity preservation matters. Anchor realism by specifying a grounded photographic look (natural lighting, believable detail, no cinematic grading), and lock what must not change about the subject. When available, higher input fidelity helps maintain likeness during larger scene edits.
```
`prompt = """
Generate a highly realistic action scene where this person is running away from a large, realistic brown bear attacking a campsite. The image should look like a real photograph someone could have taken, not an overly enhanced or cinematic movie-poster image.
She is centered in the image but looking away from the camera, wearing outdoorsy camping attire, with dirt on her face and tears in her clothing. She is clearly afraid but focused on escaping, running away from the bear as it destroys the campsite behind her.
The campsite is in Yosemite National Park, with believable natural details. The time of day is dusk, with natural lighting and realistic colors. Everything should feel grounded, authentic, and unstyled, as if captured in a real moment. Avoid cinematic lighting, dramatic color grading, or stylized composition.
"""
result = client.images.edit(
model="gpt-image-1.5",
input\_fidelity="high",
quality="high",
image=[
open("../../images/input\_images/woman\_in\_museum.png", "rb"),
],
prompt=prompt
)
save\_image(result, "scene.png")`
```
Output Image:
## 5.9 Multi-Image Referencing and Compositing
Used to combine elements from multiple inputs into a single, believable image—great for “insert this object/person into that scene” workflows without re-generating everything. The key is to clearly specify what to transplant (the dog from image 2), where it should go (right next to the woman in image 1), and what must remain unchanged (scene, background, framing), while matching lighting, perspective, scale, and shadows so the composite looks naturally captured in the original photo.
```
`prompt = """
Place the dog from the second image into the setting of image 1, right next to the woman, use the same style of lighting, composition and background. Do not change anything else.
"""
result = client.images.edit(
model="gpt-image-1.5",
input\_fidelity="high",
quality="high",
image=[
open("../../images/output\_images/test\_woman.png", "rb"),
open("../../images/output\_images/test\_woman\_2.png", "rb"),
],
prompt=prompt
)
save\_image(result, "test\_woman\_with\_dog.png")`
```
|Image Input 1|Image Input 2|Output|
||||
## 6. Additional High-Value Use Cases
## 6.1 Interior design “swap” (precision edits)
Used for visualizing furniture or decor changes in real spaces without re-rendering the entire scene. The goal is surgical realism: swap a single object while preserving camera angle, lighting, shadows, and surrounding context so the edit looks like a real photograph, not a redesign.
```
`prompt = """
In this room photo, replace ONLY white with chairs made of wood.
Preserve camera angle, room lighting, floor shadows, and surrounding objects.
Keep all other aspects of the image unchanged.
Photorealistic contact shadows and fabric texture.
"""
result = client.images.edit(
model="gpt-image-1.5",
image=[
open("../../images/input\_images/kitchen.jpeg", "rb"),
],
prompt=prompt
)
save\_image(result, "kitchen-chairs.png")`
```
|Input Image|Output Image|
|||
## 6.2 3D pop-up holiday card (product-style mock)
Ideal for seasonal marketing concepts and print previews. Emphasizes tactile realism—paper layers, fibers, folds, and soft studio lighting—so the result reads as a photographed physical product rather than a flat illustration.
```
`scene\_description = (
"a cozy Christmas scene with an old teddy bear sitting inside a keepsake box, "
"slightly worn fur, soft stitching repairs, placed near a window with falling snow outside. "
"The scene suggests the child has grown up, but the memories remain."
)
short\_copy = "Merry Christmas — some memories never fade."
prompt = f"""
Create a Christmas holiday card illustration.
Scene:
{scene\_description}
Mood:
Warm, nostalgic, gentle, emotional.
Style:
Premium holiday card photography, soft cinematic lighting,
realistic textures, shallow depth of field,
tasteful bokeh lights, high print-quality composition.
Constraints:
- Original artwork only
- No trademarks
- No watermarks
- No logos
Include ONLY this card text (verbatim):
"{short\_copy}"
"""
result = client.images.generate(
model="gpt-image-1.5",
prompt=prompt,
)
save\_image(result, "christmas\_holiday\_card\_teddy.png")`
```
Output Image:
## 6.3 Collectible Action Figure / Plush Keychain (merch concept)
Used for early merch ideation and pitch visuals. Focuses on premium product photography cues (materials, packaging, print clarity) while keeping designs original and non-infringing. Works well for testing multiple character or packaging variants quickly.
```
`# ---- Inputs ----
character\_description = (
"a vintage-style toy propeller airplane with rounded wings, "
"a front-mounted spinning propeller, slightly worn paint edges, "
"classic childhood proportions, designed as a nostalgic holiday collectible"
)
short\_copy = "Christmas Memories Edition"
# ---- Prompt ----
prompt = f"""
Create a collectible action figure of {character\_description}, in blister packaging.
Concept:
A nostalgic holiday collectible inspired by the simple toy airplanes
children used to play with during winter holidays.
Evokes warmth, imagination, and childhood wonder.
Style:
Premium toy photography, realistic plastic and painted metal textures,
studio lighting, shallow depth of field,
sharp label printing, high-end retail presentation.
Constraints:
- Original design only
- No trademarks
- No watermarks
- No logos
Include ONLY this packaging text (verbatim):
"{short\_copy}"
"""
result = client.images.generate(
model="gpt-image-1.5",
prompt=prompt,
)
save\_image(result, "christmas\_collectible\_toy\_airplane.png")`
```
Output Image:
## 6.4 Children’s Book Art with Character Consistency (multi-image workflow)
Designed for multi-page illustration pipelines where character drift is unacceptable. A reusable “character anchor” ensures visual continuity across scenes, poses, and pages while allowing environmental and narrative variation.
1️⃣ Character Anchor — establish the reusable main character
Goal: Lock the character’s appearance, proportions, outfit, and tone.
```
`# ---- Inputs ----
prompt = """
Create a children’s book illustration introducing a main character.
Character:
A young, storybook-style hero inspired by a little forest outlaw,
wearing a simple green hooded tunic, soft brown boots, and a small belt pouch.
The character has a kind expression, gentle eyes, and a brave but warm demeanor.
Carries a small wooden bow used only for helping, never harming.
Theme:
The character protects and rescues small forest animals like squirrels, birds, and rabbits.
Style:
Children’s book illustration, hand-painted watercolor look,
soft outlines, warm earthy colors, whimsical and friendly.
Proportions suitable for picture books (slightly oversized head, expressive face).
Constraints:
- Original character (no copyrighted characters)
- No text
- No watermarks
- Plain forest background to clearly showcase the character
"""
# ---- Image generation ----
result = client.images.generate(
model="gpt-image-1.5",
prompt=prompt,
)
save\_image(result, "childrens\_book\_illustration\_1.png")`
```
Output Image:
2️⃣ Story continuation — reuse character, advance the narrative
Goal: Same character, new scene + action.
Character appearance must remain unchanged.
```
`# ---- Inputs ----
prompt = """
Continue the children’s book story using the same character.
Scene:
The same young forest hero is gently helping a frightened squirrel
out of a fallen tree after a winter storm.
The character kneels beside the squirrel, offering reassurance.
Character Consistency:
- Same green hooded tunic
- Same facial features, proportions, and color palette
- Same gentle, heroic personality
Style:
Children’s book watercolor illustration,
soft lighting, snowy forest environment,
warm and comforting mood.
Constraints:
- Do not redesign the character
- No text
- No watermarks
"""
# ---- Image generation ----
result = client.images.edit(
model="gpt-image-1.5",
image=[
open("../../images/output\_images/childrens\_book\_illustration\_1.png", "rb"), # ← use image from step 1
],
prompt=prompt,
)
save\_image(result, "childrens\_book\_illustration\_2.png")`
```
Output Image:
## Conclusion
In this notebook, we demonstrate how to use gpt-image-1.5 to build high-quality, controllable image generation and editing workflows that hold up in real production settings. The cookbook emphasizes prompt structure, explicit constraints, and small iterative changes as the primary tools for controlling realism, layout, text accuracy, and identity preservation. We cover both generation and editing patterns—ranging from infographics, photorealism, UI mockups, and logos to translation, style transfer, virtual try-on, compositing, and lighting changes. Throughout the examples, the cookbook reinforces the importance of clearly separating what should change from what must remain invariant, and of restating those invariants on every iteration to prevent drift. We also highlight how quality and input-fidelity settings enable deliberate tradeoffs between latency and visual precision depending on the use case. Together, these examples form a practical, repeatable playbook for deploying gpt-image-1.5 in production image workflows.