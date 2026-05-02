Generate images with high input fidelity
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
Jul 17, 2025
# Generate images with high input fidelity
[ KG ](https://katia.gg)
[ Katia Gil Guzman
(OpenAI)
](https://katia.gg)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/Generate_Images_With_High_Input_Fidelity.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/Generate_Images_With_High_Input_Fidelity.ipynb)
This cookbook shows how you can leverage the `input\_fidelity` parameter, available in the Image API and the Responses image generation tool, to preserve distinctive features from the input.
Setting `input\_fidelity="high"` is especially useful when editing images with faces, logos, or any other details that require high fidelity in the output.
If you’re not already familiar with image generation using the OpenAI API, we recommend starting with our [introductory image generation cookbook](https://cookbook.openai.com/examples/generate_images_with_gpt_image).
## Set-up
```
`%pip install pillow openai -U # (skip if already installed)`
```
```
`import base64, os
from io import BytesIO
from PIL import Image
from IPython.display import display, Image as IPImage
from openai import OpenAI
client = OpenAI()
# Set your API key if not set globally
#client = OpenAI(api\_key=os.environ.get("OPENAI\_API\_KEY", "\<your OpenAI API key if not set as env var\>"))`
```
```
`folder\_path = "imgs"
os.makedirs(folder\_path, exist\_ok=True)`
```
```
`def resize\_img(image, target\_w):
w, h = image.size
target\_h = int(round(h \* (target\_w / float(w))))
resized\_image = image.resize((target\_w, target\_h), Image.LANCZOS)
return resized\_image
def edit\_img(input\_img, prompt):
result = client.images.edit(
model="gpt-image-1",
image=input\_img,
prompt=prompt,
input\_fidelity="high",
quality="high",
output\_format="jpeg"
)
image\_base64 = result.data[0].b64\_json
image\_bytes = base64.b64decode(image\_base64)
image = Image.open(BytesIO(image\_bytes))
return image`
```
## Precise editing
High input fidelity allows you to make subtle edits to an image without altering unrelated areas. This is ideal for controlled, localized changes.
Example use cases:
* **Item edits:** Change isolated elements (e.g., swap a mug color) while leaving everything else untouched.
* **Element removal:** Cleanly remove an isolated element without changing the rest of the picture.
* **Element addition:** Seamlessly insert new objects into a scene.
```
`edit\_input\_path = "imgs/desk.png"
edit\_input\_img = open(edit\_input\_path, "rb")
display(IPImage(edit\_input\_path))`
```
### Item edit
```
`edit\_prompt = "Make the mug olive green"
edit\_result = edit\_img(edit\_input\_img, edit\_prompt)`
```
```
`# Display result
edit\_resized\_result = resize\_img(edit\_result, 300)
display(edit\_resized\_result)`
```
### Remove item
```
`remove\_prompt = "Remove the mug from the desk"
remove\_result = edit\_img(edit\_input\_img, remove\_prompt)`
```
```
`# Display result
remove\_resized\_result = resize\_img(remove\_result, 300)
display(remove\_resized\_result)`
```
### Add item
```
`add\_prompt = "Add a post-it note saying 'Be right back!' to the monitor"
add\_result = edit\_img(edit\_input\_img, add\_prompt)`
```
```
`# Display result
add\_resized\_result = resize\_img(add\_result, 300)
display(add\_resized\_result)`
```
## Face preservation
When using high input fidelity, faces are preserved far more accurately than in standard mode. Use this when you need people to remain recognizable across edits.
Example use cases:
* **Image editing:** Edit your photos while preserving facial features.
* **Personalization:** Create avatars that still look like the original person across different backgrounds or styles.
* **Photo merge:** Combine faces from multiple pictures into one image.
**Note:** Currently, while all input images are preserved with high fidelity, only the first one you provide is preserved with extra richness in texture. When working with multiple faces from different photos, try combining all needed faces into a single composite image before sending the request (see the example below).
```
`face\_input\_path = "imgs/woman\_portrait.png"
face\_input\_img = open(face\_input\_path, "rb")
display(IPImage(face\_input\_path))`
```
### Image editing
```
`edit\_face\_prompt = "Add soft neon purple and lime green lighting and glowing backlighting."
edit\_face\_result = edit\_img(face\_input\_img, edit\_face\_prompt)`
```
```
`# Display result
edit\_face\_resized\_result = resize\_img(edit\_face\_result, 300)
display(edit\_face\_resized\_result)`
```
### Avatar
```
`avatar\_prompt = "Generate an avatar of this person in digital art style, with vivid splash of colors."
avatar\_result = edit\_img(face\_input\_img, avatar\_prompt)`
```
```
`# Display result
avatar\_resized\_result = resize\_img(avatar\_result, 300)
display(avatar\_resized\_result)`
```
### Combine multiple pictures with faces
```
`second\_woman\_input\_path = "imgs/woman\_smiling.jpg"
second\_woman\_input\_img = open(second\_woman\_input\_path, "rb")
display(IPImage(second\_woman\_input\_path))`
```
```
`def combine\_imgs(left\_path, right\_path, bg\_color=(255, 255, 255)):
left\_img = Image.open(open(left\_path, "rb"))
right\_img = Image.open(open(right\_path, "rb"))
# Ensure RGBA for safe pasting (handles transparency)
left = left\_img.convert("RGBA")
right = right\_img.convert("RGBA")
# Resize right to match left height
target\_h = left.height
scale = target\_h / float(right.height)
target\_w = int(round(right.width \* scale))
right = right.resize((target\_w, target\_h), Image.LANCZOS)
# New canvas
total\_w = left.width + right.width
canvas = Image.new("RGBA", (total\_w, target\_h), bg\_color + (255,))
# Paste
canvas.paste(left, (0, 0), left)
canvas.paste(right, (left.width, 0), right)
return canvas`
```
```
`combined\_img = combine\_imgs(second\_woman\_input\_path, face\_input\_path)
display(combined\_img)`
```
```
`import io
# utility function to convert to bytes
def pil\_to\_bytes(img, fmt="PNG"):
buf = io.BytesIO()
img.save(buf, format=fmt)
buf.seek(0)
return buf
combined\_img\_bytes = pil\_to\_bytes(combined\_img)`
```
```
`combined\_prompt = "Put these two women in the same picture, holding shoulders, as if part of the same photo."
combined\_result = edit\_img(("combined.png", combined\_img\_bytes, "image/png"), combined\_prompt)`
```
```
`# Display result
combined\_resized\_result = resize\_img(combined\_result, 300)
display(combined\_resized\_result)`
```
## Branding consistency
Sometimes, maintaining brand identity in generated images is essential. High input fidelity ensures that logos and other unique design elements remain true to the original assets.
Example use cases:
* **Marketing assets:** Generate banners or social posts that include your brand logo without distortion.
* **Mockups:** Place your logo or other brand assets into templates or lifestyle scenes without unintended changes.
* **Product photography:** Change a product’s background for different campaigns while keeping the product’s details crisp.
```
`logo\_input\_path = "imgs/logo.png"
logo\_input\_img = open(logo\_input\_path, "rb")
display(IPImage(logo\_input\_path))`
```
### Marketing assets
```
`marketing\_prompt = "Generate a beautiful, modern hero banner featuring this logo in the center. It should look futuristic, with blue & violet hues."
marketing\_result = edit\_img(logo\_input\_img, marketing\_prompt)`
```
```
`# Display result
marketing\_resized\_result = resize\_img(marketing\_result, 300)
display(marketing\_resized\_result)`
```
### Mockups
```
`mockup\_prompt = "Generate a highly realistic picture of a hand holding a tilted iphone, with an app on the screen that showcases this logo in the center with a loading animation below"
mockup\_result = edit\_img(logo\_input\_img, mockup\_prompt)`
```
```
`# Display result
mockup\_resized\_result = resize\_img(mockup\_result, 300)
display(mockup\_resized\_result)`
```
### Product photography
```
`bag\_input\_path = "imgs/bag.png"
bag\_input\_img = open(bag\_input\_path, "rb")
display(IPImage(bag\_input\_path))`
```
```
`product\_prompt = "Generate a beautiful ad with this bag in the center, on top of a dark background with a glowing halo emanating from the center, behind the bag."
product\_result = edit\_img(bag\_input\_img, product\_prompt)`
```
```
`# Display result
product\_resized\_result = resize\_img(product\_result, 300)
display(product\_resized\_result)`
```
## Fashion & Product Retouching
E-commerce and fashion often require editing outfits or product details without compromising realism. High input fidelity ensures fabric textures, patterns, and logos remain consistent.
Example use cases:
* **Outfit variations:** Change the color or style of clothing on a model photo.
* **Accessory addition:** Add jewelry, hats, or other accessories to a model photo without altering their pose or face.
* **Product extraction:** Show the same product or outfit in new settings while keeping details intact.
```
`model\_input\_path = "imgs/model.png"
model\_input\_img = open(model\_input\_path, "rb")
display(IPImage(model\_input\_path))`
```
### Outfit variations
```
`variation\_prompt = "Edit this picture so that the model wears a blue tank top instead of the coat and sweater."
variation\_result = edit\_img(model\_input\_img, variation\_prompt)`
```
```
`# Display result
variation\_resized\_result = resize\_img(variation\_result, 300)
display(variation\_resized\_result)`
```
### Accessory addition
In this example, we’ll combine 2 input images. The image containing the face should be provided as the first input as more details are retained from the first image.
```
`input\_imgs = [('model.png',
open('imgs/model.png', 'rb'),
'image/png'),
('bag.png', open('imgs/bag.png', 'rb'),'image/png'),
]`
```
```
`accessory\_prompt = "Add the crossbody bag to the outfit."
accessory\_result = edit\_img(input\_imgs, accessory\_prompt)`
```
```
`# Display result
accessory\_resized\_result = resize\_img(accessory\_result, 300)
display(accessory\_resized\_result)`
```
### Product extraction
```
`extraction\_prompt = "Generate a picture of this exact same jacket on a white background"
extraction\_result = edit\_img(model\_input\_img, extraction\_prompt)`
```
```
`# Display result
extraction\_resized\_result = resize\_img(extraction\_result, 300)
display(extraction\_resized\_result)`
```
## Wrapping up
In this guide, we covered how to enable high input fidelity to better preserve important visual details from input images.
Use the example use cases above as inspiration, and try the parameter with your own images to see where high input fidelity makes the biggest difference.
Keep in mind that high input fidelity consumes more image input tokens than the default. Also, while all input images are processed with high input fidelity, the first image in the list preserves the finest detail and richest texture, which is especially important for faces.
Happy building!