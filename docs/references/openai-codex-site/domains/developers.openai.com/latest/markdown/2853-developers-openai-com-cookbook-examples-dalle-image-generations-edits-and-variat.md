How to use the DALL·E API
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
Nov 4, 2022
# How to use the DALL·E API
This recipe is archived and may reference outdated models or APIs.
[ TS ](https://github.com/ted-at-openai)
[ Ted Sanders
(OpenAI)
](https://github.com/ted-at-openai)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/dalle/Image_generations_edits_and_variations_with_DALL-E.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/dalle/Image_generations_edits_and_variations_with_DALL-E.ipynb)
This notebook shows how to use OpenAI’s DALL·E image API endpoints.
There are three API endpoints:
* **Generations:** generates an image or images based on an input caption
* **Edits:** edits or extends an existing image
* **Variations:** generates variations of an input image
## Setup
* Import the packages you’ll need
* Import your OpenAI API key: You can do this by running ``export OPENAI\_API\_KEY="your API key"`` in your terminal.
* Set a directory to save images to
```
`# imports
from openai import OpenAI # OpenAI Python library to make API calls
import requests # used to download images
import os # used to access filepaths
from PIL import Image # used to print and edit images
# initialize OpenAI client
client = OpenAI(api\_key=os.environ.get("OPENAI\_API\_KEY", "\<your OpenAI API key if not set as env var\>"))`
```
```
`# set a directory to save DALL·E images to
image\_dir\_name = "images"
image\_dir = os.path.join(os.curdir, image\_dir\_name)
# create the directory if it doesn't yet exist
if not os.path.isdir(image\_dir):
os.mkdir(image\_dir)
# print the directory to save to
print(f"{image\_dir=}")`
```
```
`image\_dir='./images'`
```
## Generations
The generation API endpoint creates an image based on a text prompt. [API Reference](https://platform.openai.com/docs/api-reference/images/create)
**Required inputs:**
* `prompt` (str): A text description of the desired image(s). The maximum length is 1000 characters for dall-e-2 and 4000 characters for dall-e-3.
**Optional inputs:**
* `model` (str): The model to use for image generation. Defaults to dall-e-2
* `n` (int): The number of images to generate. Must be between 1 and 10. Defaults to 1.
* `quality` (str): The quality of the image that will be generated. hd creates images with finer details and greater consistency across the image. This param is only supported for dall-e-3.
* `response\_format` (str): The format in which the generated images are returned. Must be one of “url” or “b64\_json”. Defaults to “url”.
* `size` (str): The size of the generated images. Must be one of 256x256, 512x512, or 1024x1024 for dall-e-2. Must be one of 1024x1024, 1792x1024, or 1024x1792 for dall-e-3 models. Defaults to “1024x1024”.
* `style`(str | null): The style of the generated images. Must be one of vivid or natural. Vivid causes the model to lean towards generating hyper-real and dramatic images. Natural causes the model to produce more natural, less hyper-real looking images. This param is only supported for dall-e-3.
* `user` (str): A unique identifier representing your end-user, which will help OpenAI to monitor and detect abuse. [Learn more.](https://beta.openai.com/docs/usage-policies/end-user-ids)
```
`# create an image
# set the prompt
prompt = "A cyberpunk monkey hacker dreaming of a beautiful bunch of bananas, digital art"
# call the OpenAI API
generation\_response = client.images.generate(
model = "dall-e-3",
prompt=prompt,
n=1,
size="1024x1024",
response\_format="url",
)
# print response
print(generation\_response)`
```
```
`ImagesResponse(created=1701994117, data=[Image(b64\_json=None, revised\_prompt=None, url='https://oaidalleapiprodscus.blob.core.windows.net/private/org-9HXYFy8ux4r6aboFyec2OLRf/user-8OA8IvMYkfdAcUZXgzAXHS7d/img-ced13hkOk3lXkccQgW1fAQjm.png?st=2023-12-07T23%3A08%3A37Z&se=2023-12-08T01%3A08%3A37Z&sp=r&sv=2021-08-06&sr=b&rscd=inline&rsct=image/png&skoid=6aaadede-4fb3-4698-a8f6-684d7786b067&sktid=a48cca56-e6da-484e-a814-9c849652bcb3&skt=2023-12-07T16%3A41%3A48Z&ske=2023-12-08T16%3A41%3A48Z&sks=b&skv=2021-08-06&sig=tcD0iyU0ABOvWAKsY89gp5hLVIYkoSXQnrcmH%2Brkric%3D')])`
```
```
`# save the image
generated\_image\_name = "generated\_image.png" # any name you like; the filetype should be .png
generated\_image\_filepath = os.path.join(image\_dir, generated\_image\_name)
generated\_image\_url = generation\_response.data[0].url # extract image URL from response
generated\_image = requests.get(generated\_image\_url).content # download the image
with open(generated\_image\_filepath, "wb") as image\_file:
image\_file.write(generated\_image) # write the image to the file`
```
```
`# print the image
print(generated\_image\_filepath)
display(Image.open(generated\_image\_filepath))`
```
## Variations
The variations endpoint generates new images (variations) similar to an input image. [API Reference](https://platform.openai.com/docs/api-reference/images/createVariation)
Here we’ll generate variations of the image generated above.
**Required inputs:**
* `image` (str): The image to use as the basis for the variation(s). Must be a valid PNG file, less than 4MB, and square.
**Optional inputs:**
* `model` (str): The model to use for image variations. Only dall-e-2 is supported at this time.
* `n` (int): The number of images to generate. Must be between 1 and 10. Defaults to 1.
* `size` (str): The size of the generated images. Must be one of “256x256”, “512x512”, or “1024x1024”. Smaller images are faster. Defaults to “1024x1024”.
* `response\_format` (str): The format in which the generated images are returned. Must be one of “url” or “b64\_json”. Defaults to “url”.
* `user` (str): A unique identifier representing your end-user, which will help OpenAI to monitor and detect abuse. [Learn more.](https://beta.openai.com/docs/usage-policies/end-user-ids)
```
`# create variations
# call the OpenAI API, using `create\_variation` rather than `create`
variation\_response = client.images.create\_variation(
image=generated\_image, # generated\_image is the image generated above
n=2,
size="1024x1024",
response\_format="url",
)
# print response
print(variation\_response)`
```
```
`ImagesResponse(created=1701994139, data=[Image(b64\_json=None, revised\_prompt=None, url='https://oaidalleapiprodscus.blob.core.windows.net/private/org-9HXYFy8ux4r6aboFyec2OLRf/user-8OA8IvMYkfdAcUZXgzAXHS7d/img-noNRGgwaaotRGIe6Y2GVeSpr.png?st=2023-12-07T23%3A08%3A59Z&se=2023-12-08T01%3A08%3A59Z&sp=r&sv=2021-08-06&sr=b&rscd=inline&rsct=image/png&skoid=6aaadede-4fb3-4698-a8f6-684d7786b067&sktid=a48cca56-e6da-484e-a814-9c849652bcb3&skt=2023-12-07T16%3A39%3A11Z&ske=2023-12-08T16%3A39%3A11Z&sks=b&skv=2021-08-06&sig=ER5RUglhtIk9LWJXw1DsolorT4bnEmFostfnUjY21ns%3D'), Image(b64\_json=None, revised\_prompt=None, url='https://oaidalleapiprodscus.blob.core.windows.net/private/org-9HXYFy8ux4r6aboFyec2OLRf/user-8OA8IvMYkfdAcUZXgzAXHS7d/img-oz952tL11FFhf9iXXJVIRUZX.png?st=2023-12-07T23%3A08%3A59Z&se=2023-12-08T01%3A08%3A59Z&sp=r&sv=2021-08-06&sr=b&rscd=inline&rsct=image/png&skoid=6aaadede-4fb3-4698-a8f6-684d7786b067&sktid=a48cca56-e6da-484e-a814-9c849652bcb3&skt=2023-12-07T16%3A39%3A11Z&ske=2023-12-08T16%3A39%3A11Z&sks=b&skv=2021-08-06&sig=99rJOQwDKsfIeerlMXMHholhAhrHfYaQRFJBF8FKv74%3D')])`
```
```
`# save the images
variation\_urls = [datum.url for datum in variation\_response.data] # extract URLs
variation\_images = [requests.get(url).content for url in variation\_urls] # download images
variation\_image\_names = [f"variation\_image\_{i}.png" for i in range(len(variation\_images))] # create names
variation\_image\_filepaths = [os.path.join(image\_dir, name) for name in variation\_image\_names] # create filepaths
for image, filepath in zip(variation\_images, variation\_image\_filepaths): # loop through the variations
with open(filepath, "wb") as image\_file: # open the file
image\_file.write(image) # write the image to the file`
```
```
`# print the original image
print(generated\_image\_filepath)
display(Image.open(generated\_image\_filepath))
# print the new variations
for variation\_image\_filepaths in variation\_image\_filepaths:
print(variation\_image\_filepaths)
display(Image.open(variation\_image\_filepaths))`
```
## Edits
The edit endpoint uses DALL·E to generate a specified portion of an existing image. Three inputs are needed: the image to edit, a mask specifying the portion to be regenerated, and a prompt describing the desired image. [API Reference](https://platform.openai.com/docs/api-reference/images/createEdit)
**Required inputs:**
* `image` (str): The image to edit. Must be a valid PNG file, less than 4MB, and square. If mask is not provided, image must have transparency, which will be used as the mask.
* `prompt` (str): A text description of the desired image(s). The maximum length is 1000 characters.
**Optional inputs:**
* `mask` (file): An additional image whose fully transparent areas (e.g. where alpha is zero) indicate where image should be edited. Must be a valid PNG file, less than 4MB, and have the same dimensions as image.
* `model` (str): The model to use for edit image. Only dall-e-2 is supported at this time.
* `n` (int): The number of images to generate. Must be between 1 and 10. Defaults to 1.
* `size` (str): The size of the generated images. Must be one of “256x256”, “512x512”, or “1024x1024”. Smaller images are faster. Defaults to “1024x1024”.
* `response\_format` (str): The format in which the generated images are returned. Must be one of “url” or “b64\_json”. Defaults to “url”.
* `user` (str): A unique identifier representing your end-user, which will help OpenAI to monitor and detect abuse. [Learn more.](https://beta.openai.com/docs/usage-policies/end-user-ids)
### Set Edit Area
An edit requires a “mask” to specify which portion of the image to regenerate. Any pixel with an alpha of 0 (transparent) will be regenerated. The code below creates a 1024x1024 mask where the bottom half is transparent.
```
`# create a mask
width = 1024
height = 1024
mask = Image.new("RGBA", (width, height), (0, 0, 0, 1)) # create an opaque image mask
# set the bottom half to be transparent
for x in range(width):
for y in range(height // 2, height): # only loop over the bottom half of the mask
# set alpha (A) to zero to turn pixel transparent
alpha = 0
mask.putpixel((x, y), (0, 0, 0, alpha))
# save the mask
mask\_name = "bottom\_half\_mask.png"
mask\_filepath = os.path.join(image\_dir, mask\_name)
mask.save(mask\_filepath)`
```
### Perform Edit
Now we supply our image, caption and mask to the API to get 5 examples of edits to our image
```
`# edit an image
# call the OpenAI API
edit\_response = client.images.edit(
image=open(generated\_image\_filepath, "rb"), # from the generation section
mask=open(mask\_filepath, "rb"), # from right above
prompt=prompt, # from the generation section
n=1,
size="1024x1024",
response\_format="url",
)
# print response
print(edit\_response)`
```
```
`ImagesResponse(created=1701994167, data=[Image(b64\_json=None, revised\_prompt=None, url='https://oaidalleapiprodscus.blob.core.windows.net/private/org-9HXYFy8ux4r6aboFyec2OLRf/user-8OA8IvMYkfdAcUZXgzAXHS7d/img-9UOVGC7wB8MS2Q7Rwgj0fFBq.png?st=2023-12-07T23%3A09%3A27Z&se=2023-12-08T01%3A09%3A27Z&sp=r&sv=2021-08-06&sr=b&rscd=inline&rsct=image/png&skoid=6aaadede-4fb3-4698-a8f6-684d7786b067&sktid=a48cca56-e6da-484e-a814-9c849652bcb3&skt=2023-12-07T16%3A40%3A37Z&ske=2023-12-08T16%3A40%3A37Z&sks=b&skv=2021-08-06&sig=MsRMZ1rN434bVdWr%2B9kIoqu9CIrvZypZBfkQPTOhCl4%3D')])`
```
```
`# save the image
edited\_image\_name = "edited\_image.png" # any name you like; the filetype should be .png
edited\_image\_filepath = os.path.join(image\_dir, edited\_image\_name)
edited\_image\_url = edit\_response.data[0].url # extract image URL from response
edited\_image = requests.get(edited\_image\_url).content # download the image
with open(edited\_image\_filepath, "wb") as image\_file:
image\_file.write(edited\_image) # write the image to the file`
```
```
`# print the original image
print(generated\_image\_filepath)
display(Image.open(generated\_image\_filepath))
# print edited image
print(edited\_image\_filepath)
display(Image.open(edited\_image\_filepath))`
```