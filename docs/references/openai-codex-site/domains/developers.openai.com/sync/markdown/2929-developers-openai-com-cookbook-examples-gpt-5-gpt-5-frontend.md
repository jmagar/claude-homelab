Frontend coding with GPT-5
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
Aug 7, 2025
# Frontend coding with GPT-5
[ WB ](https://www.linkedin.com/in/wulfie-bain/)[ AK ](https://x.com/anoopkotha)
[ Wulfie Bain
(OpenAI)
, ](https://www.linkedin.com/in/wulfie-bain/)[ Anoop Kotha
(OpenAI)
](https://x.com/anoopkotha)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/gpt-5/gpt-5_frontend.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/gpt-5/gpt-5_frontend.ipynb)
GPT-5 is a large leap forward in frontend development. We have seen the model be excellent at developing full stack applications in one shot, making complex refactors look easy, and making surgical edits within large codebases.
In this cookbook we will show some examples and some learnings of developing frontend applications with GPT-5 across multiple axes.
## Intro
There are some general principles we have seen be effective in developing strong frontend applications. We share some of these learnings in the [prompt guide](https://cookbook.openai.com/examples/gpt-5/gpt-5_prompting_guide). Below are some important pieces to consider when building frontend applications.
Here are libraries and packages we recommend to start with steering the model:
* Frameworks: Next.js (TypeScript), React, HTML
* Styling / UI: Tailwind CSS, shadcn/ui, Radix Themes
* Icons: Material Symbols, Heroicons, Lucide
* Animation: Motion
* Fonts: San Serif, Inter, Geist, Mona Sans, IBM Plex Sans, Manrope
These packages are not an exhaustive list and we have seen many different application styles.
Below you’ll find an easy way to iterate over frontend abstractions on the API. We’re excited to see how users can unlock creativity with GPT-5.
## Interactive Example
Let’s dive into an example of creating frontends from scratch. First let’s create some help functions to see the generated websites from GPT-5.
```
`import os
import re
import webbrowser
from pathlib import Path
import openai
from openai.types.responses import ResponseInputParam
client = openai.OpenAI()
def get\_response\_output\_text(input: str | ResponseInputParam):
response = client.responses.create(
model="gpt-5",
input=input,
)
return response.output\_text
def extract\_html\_from\_text(text: str):
"""Extract an HTML code block from text; fallback to first code block, else full text."""
html\_block = re.search(r"```html\\s\*(.\*?)\\s\*```", text, re.DOTALL | re.IGNORECASE)
if html\_block:
result = html\_block.group(1)
return result
any\_block = re.search(r"```\\s\*(.\*?)\\s\*```", text, re.DOTALL)
if any\_block:
result = any\_block.group(1)
return result
return text
def save\_html(html: str, filename: str) -\> Path:
"""Save HTML to outputs/ directory and return the path."""
try:
base\_dir = Path(\_\_file\_\_).parent
except NameError:
base\_dir = Path.cwd()
folder = "outputs"
outputs\_dir = base\_dir / folder
outputs\_dir.mkdir(parents=True, exist\_ok=True)
output\_path = outputs\_dir / filename
output\_path.write\_text(html, encoding="utf-8")
return output\_path
def open\_in\_browser(path: Path) -\> None:
"""Open a file in the default browser (macOS compatible)."""
try:
webbrowser.open(path.as\_uri())
except Exception:
os.system(f'open "{path}"')`
```
Now, let’s combine the above into one helper function.
```
`def make\_website\_and\_open\_in\_browser(\*, website\_input: str | ResponseInputParam, filename: str = "website.html"):
response\_text = get\_response\_output\_text(website\_input)
html = extract\_html\_from\_text(response\_text)
output\_path = save\_html(html, filename)
open\_in\_browser(output\_path)`
```
We’ll start with a simple example: one-shot building a retro gaming store with the right theme
```
`make\_website\_and\_open\_in\_browser(
website\_input="Make me landing page for a retro-games store. Retro-arcade noir some might say",
filename="retro\_dark.html",
)`
```
```
`get\_response: finished
extract\_html\_from\_text: finished (raw text)
save\_html: finished -\> outputs/retro\_dark.html
open\_in\_browser: finished`
```
Not bad for a one line, one shot prompt!
Now let’s steer it to be lighter, and a bit softer
```
`make\_website\_and\_open\_in\_browser(
website\_input="Make me landing page for a retro-games store. Make it light, more pastel coloured & flowery (think Mario, not cyberpunk)",
filename="retro\_light.html"
)`
```
```
`get\_response: finished
extract\_html\_from\_text: finished (raw text)
save\_html: finished -\> outputs/retro\_light.html
open\_in\_browser: finished`
```
As you can see GPT-5 is incredibly steerable - with just a one line you can change entire applications effortlessly
But what if you have existing website designs that you want to make additions to? For example, we already have this dashboard.
Since GPT-5 is natively multimodal and accepts both image and text input, when you are generating frontend applications we can take advantage of image input to improve model performance.
```
`import base64
from openai.types.responses import ResponseInputImageParam
# Function to encode the image
def encode\_image(image\_path: str):
with open(image\_path, "rb") as image\_file:
return base64.b64encode(image\_file.read()).decode("utf-8")
image\_path="/cookbook/assets/images/input\_image.png"
encoded\_image = encode\_image(image\_path)
input\_image: ResponseInputImageParam = {"type": "input\_image", "image\_url": f"data:image/png;base64,{encoded\_image}", "detail": "auto"}
input: ResponseInputParam = [
{
"role": "user",
"content": [
{"type": "input\_text", "text": "Can you make a login page for this website that maintains the same theme"},
input\_image,
],
}
]
make\_website\_and\_open\_in\_browser(
website\_input=input,
filename="login\_page.html"
)`
```
```
`get\_response: finished
extract\_html\_from\_text: finished (raw text)
save\_html: finished -\> outputs/login\_page.html
open\_in\_browser: finished`
```
As you can see, GPT-5 does an incredible job of matching the existing style & vibe of the app.
So far this has been pretty static - let’s try a more interactive task
```
`make\_website\_and\_open\_in\_browser(
website\_input="Make me a snake game. It should be futuristic, neon, cyberpunk style. Make sure the typography is suitably cool.",
filename="snake\_game.html"
)`
```
```
`get\_response: finished
extract\_html\_from\_text: finished (raw text)
save\_html: finished -\> outputs/snake\_game.html
open\_in\_browser: finished`
```
We’ve got a theme consistent snake game: matching colours, typography, and even sound
We hope this has given some ideas of how powerful GPT-5 is at frontend. From a single underspecified prompt and API call, we get production grade outputs.
Now it’s your turn - we can’t wait to see what you’ll build
```
`your\_prompt = "[edit this! what website would you like to build?]"
make\_website\_and\_open\_in\_browser(
website\_input=your\_prompt,
filename="your\_website.html"
)`
```
```
`get\_response: finished
extract\_html\_from\_text: finished (raw text)
save\_html: finished -\> outputs/your\_website.html
open\_in\_browser: finished`
```