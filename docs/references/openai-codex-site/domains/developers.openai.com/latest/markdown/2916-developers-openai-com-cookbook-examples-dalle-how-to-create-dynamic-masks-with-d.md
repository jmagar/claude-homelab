How to create dynamic masks with DALL·E and Segment Anything
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
May 19, 2023
# How to create dynamic masks with DALL·E and Segment Anything
[ CJ ](https://twitter.com/colintjarvis)
[ Colin Jarvis
(OpenAI)
](https://twitter.com/colintjarvis)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/dalle/How_to_create_dynamic_masks_with_DALL-E_and_Segment_Anything.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/dalle/How_to_create_dynamic_masks_with_DALL-E_and_Segment_Anything.ipynb)
Segment Anything is a model from Meta that can be used to select portions of images. Combined with DALL·E’s ability to inpaint specified portions of images, you can use Segment Anything to easily select any part of an image you’d like to alter.
In this notebook, we’ll use these tools to become fashion designers and dynamically replace our digital models’ outfits with tailored, original creations. The notebook follows this flow:
* **Setup:** Initialise your libraries and any location directories.
* **Generate original image:** Make an original image that we’ll create dynamic masks from.
* **Generate mask:** Use Segment Anything to create a dynamic mask.
* **Create new image:** Generate a new image with the masked area inpainted with a fresh prompt.
## Setup
To get started we’ll need to follow the [instructions](https://github.com/facebookresearch/segment-anything) for using the Segment Anything (SAM) model open-sourced by Meta. As of May 2023, the key steps are:
* Install [Pytorch](https://pytorch.org/get-started/locally/) (version 1.7+).
* Install the library using `pip install git+https://github.com/facebookresearch/segment-anything.git`.
* Install dependencies using `pip install opencv-python pycocotools matplotlib onnxruntime onnx`.
* Download a [model checkpoint](https://github.com/facebookresearch/segment-anything#model-checkpoints) to use (default size is 2.4 GB).
```
`!pip install torch torchvision torchaudio
!pip install git+https://github.com/facebookresearch/segment-anything.git
!pip install opencv-python pycocotools matplotlib onnxruntime onnx
!pip install requests
!pip install openai
!pip install numpy`
```
```
`!wget https://dl.fbaipublicfiles.com/segment\_anything/sam\_vit\_h\_4b8939.pth`
```
```
`import cv2
import matplotlib.pyplot as plt
import matplotlib.image as mpimg
from matplotlib import rcParams
import numpy as np
from openai import OpenAI
import os
from PIL import Image
import requests
from segment\_anything import sam\_model\_registry, SamAutomaticMaskGenerator, SamPredictor
import torch
# Set directories for generation images and edit images
base\_image\_dir = os.path.join("images", "01\_generations")
mask\_dir = os.path.join("images", "02\_masks")
edit\_image\_dir = os.path.join("images", "03\_edits")
# Point to your downloaded SAM model
sam\_model\_filepath = "./sam\_vit\_h\_4b8939.pth"
# Initiate SAM model
sam = sam\_model\_registry["default"](checkpoint=sam\_model\_filepath)
# Initiate openAI client
client = OpenAI(api\_key=os.environ.get("OPENAI\_API\_KEY", "\<your OpenAI API key if not set as env var\>"))`
```
## Generate original image
First we’ll create an original image which we’ll generate masks from.
```
`def process\_dalle\_images(response, filename, image\_dir):
# save the images
urls = [datum.url for datum in response.data] # extract URLs
images = [requests.get(url).content for url in urls] # download images
image\_names = [f"{filename}\_{i + 1}.png" for i in range(len(images))] # create names
filepaths = [os.path.join(image\_dir, name) for name in image\_names] # create filepaths
for image, filepath in zip(images, filepaths): # loop through the variations
with open(filepath, "wb") as image\_file: # open the file
image\_file.write(image) # write the image to the file
return filepaths`
```
```
`dalle\_prompt = '''
Full length, zoomed out photo of our premium Lederhosen-inspired jumpsuit.
Showcase the intricate hand-stitched details and high-quality leather, while highlighting the perfect blend of Austrian heritage and modern fashion.
This piece appeals to a sophisticated, trendsetting audience who appreciates cultural fusion and innovative design.
'''`
```
```
`# Generate your images
generation\_response = client.images.generate(
model = "dall-e-3",
prompt=dalle\_prompt,
n=3,
size="1024x1024",
response\_format="url",
)`
```
```
`filepaths = process\_dalle\_images(generation\_response, "generation", base\_image\_dir)`
```
```
`# print the new generations
for filepath in filepaths:
print(filepath)
display(Image.open(filepath))`
```
## Generate Mask
Next we’ll load up one of our images and generate masks.
For this demonstration we’re picking a UX where we “click” on a point on the image to generate masks from. However, there are [example notebooks](https://github.com/facebookresearch/segment-anything/blob/main/notebooks/automatic_mask_generator_example.ipynb) provided by Meta which show how to generate every possible mask for an image, draw a box, and some other useful approaches.
```
`# Pick one of your generated images
chosen\_image = "images/01\_generations/generation\_2.png"`
```
```
`# Function to display mask using matplotlib
def show\_mask(mask, ax):
color = np.array([30 / 255, 144 / 255, 255 / 255, 0.6])
h, w = mask.shape[-2:]
mask\_image = mask.reshape(h, w, 1) \* color.reshape(1, 1, -1)
ax.imshow(mask\_image)
# Function to display where we've "clicked"
def show\_points(coords, labels, ax, marker\_size=375):
pos\_points = coords[labels == 1]
neg\_points = coords[labels == 0]
ax.scatter(
pos\_points[:, 0],
pos\_points[:, 1],
color="green",
marker="\*",
s=marker\_size,
edgecolor="white",
linewidth=1.25,
)
ax.scatter(
neg\_points[:, 0],
neg\_points[:, 1],
color="red",
marker="\*",
s=marker\_size,
edgecolor="white",
linewidth=1.25,
)`
```
```
`# Load chosen image using opencv
image = cv2.imread(chosen\_image)
image = cv2.cvtColor(image, cv2.COLOR\_BGR2RGB)
# Display our chosen image
plt.figure(figsize=(10, 10))
plt.imshow(image)
plt.axis("on")
plt.show()`
```
```
`# Set the pixel coordinates for our "click" to assign masks
input\_point = np.array([[525, 325]])
input\_label = np.array([1])
# Display the point we've clicked on
plt.figure(figsize=(10, 10))
plt.imshow(image)
show\_points(input\_point, input\_label, plt.gca())
plt.axis("on")
plt.show()`
```
```
`# Initiate predictor with Segment Anything model
predictor = SamPredictor(sam)
predictor.set\_image(image)
# Use the predictor to gather masks for the point we clicked
masks, scores, logits = predictor.predict(
point\_coords=input\_point,
point\_labels=input\_label,
multimask\_output=True,
)
# Check the shape - should be three masks of the same dimensions as our image
masks.shape`
```
```
`(3, 1024, 1024)`
```
```
`# Display the possible masks we can select along with their confidence
for i, (mask, score) in enumerate(zip(masks, scores)):
plt.figure(figsize=(10, 10))
plt.imshow(image)
show\_mask(mask, plt.gca())
show\_points(input\_point, input\_label, plt.gca())
plt.title(f"Mask {i+1}, Score: {score:.3f}", fontsize=18)
plt.axis("off")
plt.show()`
```
```
`# Choose which mask you'd like to use
chosen\_mask = masks[1]
# We'll now reverse the mask so that it is clear and everything else is white
chosen\_mask = chosen\_mask.astype("uint8")
chosen\_mask[chosen\_mask != 0] = 255
chosen\_mask[chosen\_mask == 0] = 1
chosen\_mask[chosen\_mask == 255] = 0
chosen\_mask[chosen\_mask == 1] = 255`
```
```
`# create a base blank mask
width = 1024
height = 1024
mask = Image.new("RGBA", (width, height), (0, 0, 0, 1)) # create an opaque image mask
# Convert mask back to pixels to add our mask replacing the third dimension
pix = np.array(mask)
pix[:, :, 3] = chosen\_mask
# Convert pixels back to an RGBA image and display
new\_mask = Image.fromarray(pix, "RGBA")
new\_mask`
```
```
`# We'll save this mask for re-use for our edit
new\_mask.save(os.path.join(mask\_dir, "new\_mask.png"))`
```
## Create new image
Now we’ll combine our original image with the mask and the Edit endpoint for DALLE to inpaint the transparent area according to a new prompt. (as 0f January 2024 dall-e-2 is the only model that supports edits)
```
`# edit an image
edit\_response = client.images.edit(
image=open(chosen\_image, "rb"), # from the generation section
mask=open(os.path.join(mask\_dir, "new\_mask.png"), "rb"), # from right above
prompt="Brilliant leather Lederhosen with a formal look, detailed, intricate, photorealistic", # provide a prompt to fill the space
n=3,
size="1024x1024",
response\_format="url",
)
edit\_filepaths = process\_dalle\_images(edit\_response, "edits", edit\_image\_dir)`
```
```
`# Display your beautiful creations!
%matplotlib inline
# figure size in inches optional
rcParams["figure.figsize"] = 11 ,8
# read images
img\_A = mpimg.imread(edit\_filepaths[0])
img\_B = mpimg.imread(edit\_filepaths[1])
img\_C = mpimg.imread(edit\_filepaths[2])
# display images
fig, ax = plt.subplots(1,3)
[a.axis("off") for a in ax]
ax[0].imshow(img\_A)
ax[1].imshow(img\_B)
ax[2].imshow(img\_C)`
```
```
`\<matplotlib.image.AxesImage at 0x791b1f4c58a0\>`
```
Beautiful!
Now you too can easily create dynamic masks to extend your images - enjoy the APIs, and please share what you build!