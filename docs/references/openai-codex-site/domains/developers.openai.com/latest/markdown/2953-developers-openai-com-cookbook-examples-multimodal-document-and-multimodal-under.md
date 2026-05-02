Getting the Most out of GPT-5.4 for Vision and Document Understanding
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
Mar 6, 2026
# Getting the Most out of GPT-5.4 for Vision and Document Understanding
[ AB ](https://github.com/annikab-oai)[ KL ](https://github.com/kathylau-oai)[ NS ](https://github.com/nsingaraju-oai)
[ Annika Brundyn , ](https://github.com/annikab-oai)[ Kathy Lau , ](https://github.com/kathylau-oai)[ Nishanth Singaraju
(OpenAI)
](https://github.com/nsingaraju-oai)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/multimodal/document_and_multimodal_understanding_tips.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/multimodal/document_and_multimodal_understanding_tips.ipynb)
GPT-5.4 is a major step forward for real-world multimodal workloads.
Documents that previously strained vision systems or required stitching together OCR, layout detection, and custom parsers, including dense scans, handwritten forms, engineering diagrams, and chart-heavy reports, can now often be interpreted and reasoned over in a single model pass with GPT-5.4.
However, model configuration is key for unlocking SOTA results. Small choices around image detail, verbosity, reasoning effort, and tool usage can significantly affect performance.
This notebook focuses on the highest-leverage adjustments for document workloads: image detail, verbosity, reasoning effort, and tool use. The goal is to show when each one matters, how it changes the output, and how to choose a setup that is both robust and practical.
All examples in this notebook use the **Responses API** via `client.responses.create(...)`. The “settings” we talk about are request parameters you pass into that call.
### Input shape
* **`input`**: a list of message-like objects (commonly one `{ "role": "user", "content": [...] }`)
* **`content`**: a list of typed blocks, typically:
* `{ "type": "input\_text", "text": "..." }`
* `{ "type": "input\_image", "image\_url": "...", "detail": "auto" | "original" }`
### Parameters used throughout this notebook
* **Image detail** (`input\_image.detail`): controls the image resolution used for vision. Use `"auto"` for most pages; use `"original"` when text is tiny, handwritten, or the scan is low-quality.
* **Verbosity** (`text={"verbosity": ...}`): influences how compressed vs literal the text output is. Higher verbosity is helpful for faithful transcription.
* **Reasoning effort** (`reasoning={"effort": ...}`): allocates more compute to multi-step visual reasoning (charts, tables, diagrams) once the image is already readable.
* **Tool use** (`tools=[...]` + `instructions=...`): optionally lets the model use tools like **Code Interpreter** to zoom/crop/inspect before answering; omit tools when a single-pass answer is enough.
A minimal request looks like:
```
`response = client.responses.create(
model="gpt-5.4",
input=[
{
"role": "user",
"content": [
{"type": "input\_text", "text": "Extract the total amount due."},
{
"type": "input\_image",
"image\_url": "data:image/png;base64,...",
"detail": "auto",
},
],
}
],
)`
```
### Output shape
* The model returns a **response object** with one or more output items.
* In this notebook, we mostly use `response.output\_text` as a convenient way to get the final text.
* For **structured outputs**, you still receive text — you just ask the model to format it as JSON using `text={"format": ...}` and then `json.loads(response.output\_text)`.
## A quick decision guide
Use this as a starting point. A good rule of thumb is to start simple, then adjust the setting that matches the failure mode.
|If your task looks like this|Start with this setup|Why|
|Ordinary document QA or extraction|`detail="auto"`|Lowest-friction default for readable pages|
|Dense scans, screenshots, handwriting, or tiny labels|`detail="original"`|Preserves small visual signals that often get lost|
|Literal transcription or markdown conversion|`text={"verbosity": "high"}`|Encourages the model to keep more layout and fewer paraphrases|
|Region localization|Ask for `[x\_min, y\_min, x\_max, y\_max]` in a fixed `0..999` grid|Easy to crop, draw, debug, and feed into downstream systems|
|Chart, table, form, or drawing QA across multiple regions|increase reasoning effort to ‘high’ or ‘xhigh’|Improves multi-step visual reasoning|
|Multi-pass visual inspection|Add Code Interpreter|Best when a human would zoom, crop, rotate, or inspect several subregions before answering|
## Setup
Before running this notebook, make sure you have `OPENAI\_API\_KEY` set in your environment. If you don’t have an API key yet, you can create one at [platform.openai.com](https://platform.openai.com/api-keys).
```
`export OPENAI\_API\_KEY="your\_api\_key\_here"`
```
If needed, install the notebook dependencies:
```
`pip install --upgrade openai pillow`
```
```
`import base64
import json
import mimetypes
import tempfile
from pathlib import Path
from IPython.display import Markdown, display
from PIL import Image, ImageDraw
from openai import OpenAI
client = OpenAI()`
```
```
`### Helper function
def image\_to\_data\_url(image\_path: str | Path) -\> str:
path = Path(image\_path)
if not path.exists():
raise FileNotFoundError(f"Image not found: {path}")
mime\_type = mimetypes.guess\_type(path.name)[0] or "image/png"
encoded = base64.b64encode(path.read\_bytes()).decode("ascii")
return f"data:{mime\_type};base64,{encoded}"`
```
## 1. Increase image detail for dense pages and handwriting
The `detail` parameter controls the resolution the model uses when processing an image. Most applications should start with `detail="auto"` which lets the model choose an appropriate resolution. However, when pages contain handwriting, small labels, dense tables, low contrast scans, or screenshots with fine text, switching to `detail="original"` can significantly improve results. If the model is mostly correct but consistently misses small fields or annotations, increasing image detail is usually the first adjustment to try.
This example intentionally includes small email and phone fields, not just the larger handwritten names. Those are the kinds of details that tend to degrade first when the image is downsampled.
```
`handwriting\_prompt = """
Read the handwritten earthquake insurance application and return JSON with these keys:
- applicant\_name
- applicant\_email
- applicant\_home\_phone
- applicant\_cell\_phone
- co\_applicant\_name
- co\_applicant\_email
- co\_applicant\_home\_phone
- co\_applicant\_work\_phone
- effective\_date
- expiration\_date
- dwelling\_coverage\_limit\_usd
- square\_footage
- year\_of\_construction
"""
handwritten\_form\_path = "/cookbook/assets/images/3C\_insurance\_form.png"
handwriting\_response = client.responses.create(
model="gpt-5.4",
input=[
{
"role": "user",
"content": [
{"type": "input\_text", "text": handwriting\_prompt},
{
"type": "input\_image",
"image\_url": image\_to\_data\_url(handwritten\_form\_path),
"detail": "original",
},
],
}
],
text={"format": {"type": "json\_object"}
},
)
handwriting\_result = json.loads(handwriting\_response.output\_text)
display(Markdown(f"### Extracted insurance form\\n\\n```json\\n{json.dumps(handwriting\_result, indent=2, ensure\_ascii=False)}\\n```"))`
```
### Extracted insurance form
```
`{
"applicant\_name": "Smith, James L",
"applicant\_email": "jsmith1@gmail.com",
"applicant\_home\_phone": "510 331 5555",
"applicant\_cell\_phone": "510 212 5555",
"co\_applicant\_name": "Roberts, Jesse T",
"co\_applicant\_email": "jrobertsjr@gmail.com",
"co\_applicant\_home\_phone": "510 331 5555",
"co\_applicant\_work\_phone": "415 626 5555",
"effective\_date": "5/31/25",
"expiration\_date": "5/31/27",
"dwelling\_coverage\_limit\_usd": 900000,
"square\_footage": 1200,
"year\_of\_construction": 2005
}`
```
## 2. Increase verbosity for faithful transcription
When asked to transcribe documents, multimodal models tend to compress layout. They preserve meaning but may simplify whitespace, line breaks, and table-like layout. This behavior is often desirable for question answering, but not for OCR-style tasks.
Increase verbosity - `text={"verbosity": "high"}` encourages the model toward a more literal rendering and precise transcription. Use it for OCR-style workloads and targeted extractions where completeness and formatting fidelity matter.
The example below `Ticket To The Arts` panel, asking for a full transcription of all four listings while keeping the image detail fixed.
```
`section\_prompt = "Transcribe everything in the Ticket To The Arts section. Do not summarize or paraphrase. Do not add any additional text."
newspaper\_path = "../../examples/multimodal//cookbook/assets/examples/multimodal/images/newspaper.png"
section\_response = client.responses.create(
model="gpt-5.4",
input=[
{
"role": "user",
"content": [
{"type": "input\_text", "text": section\_prompt},
{
"type": "input\_image",
"image\_url": image\_to\_data\_url(newspaper\_path),
"detail": "original",
},
],
}
],
text={"verbosity": "high"},
)
display(Markdown(f"### Transcription preview\\n\\n```text\\n{section\_response.output\_text}\\n```"))`
```
### Transcription preview
```
`Ticket To
The Arts
THEATER
MUSIC
CRUMBS FROM THE TABLE OF
JOY
NOW-FEBRUARY 2
BY LYNN NOTTAGE
DIRECTED BY TASIA A. JONES
Set in 1950’s Brooklyn, two sisters mourn
the loss of their mother with Hollywood films,
daydreams, and lots of cookies. When a shocking
decision is made by their father, the family must
find new meaning in what makes a home. Tickets
at lyricstage.com or by calling the box office at
617-585-5678
RUSSIAN WINTER
Sun. 1/12 at 3PM, Sanders Theatre
Prokofiev: Quintet in G minor, Op. 39
Arensky: Piano Trio No. 1 in D minor, Op. 32
Glazunov: String Quintet in A major, Op. 39
$30-$68; Sr: $4 off; Student: $9
617.349.0086 / bostonchambermusic.org
DANCE
MUSIC
BACK IN BOSTON FOR THE 1ST
TIME IN 6 YEARS!
Legendary dance company Mark Morris Dance
Group performs “The Look of Love” — a must-
see homage to the chart-topping hits of Burt
Bacharach, including “I Say a Little Prayer,”
“What the World Needs Now” & more. A powerful
fusion of dance and music feat. a live band and
vocals sung by Broadway star Marcy Harriell,
“this is choreography that, in the words of the
song, says ‘more than just words could ever
say.’ ” —The New York Times
Jan 23–26, Emerson Cutler Majestic Theatre
For tix & info: globalartslive.org 617.876.4275
SPM CELEBRATES THEA
MUSGRAVE
Musgraves Turbulent Landscapes, Elgar Enigma
Variations, Wm. Walton Portsmouth Point. Sat
Jan 25 7:30pm Hudson High School, Sun Jan 26
3:00pm St. John’s Founders Hall, Shrewsbury.
Tix: https://www.symphonypromusica.org`
```
## 3. Raise reasoning effort when the image is readable but the answer is compositional
Once the image is readable, the next bottleneck is often reasoning instead of perception. This shows up in documents where the answer depends on combining information across multiple parts of the image rather than reading a single field. Charts, tables, technical diagrams, and dense visual layouts often fall into this category.
In those cases, increasing reasoning effort `reasoning={"effort": "high"}` can help more than increasing image detail. The model already sees the content. What it needs is more capacity to connect labels, compare regions, follow structure, and compute the final answer correctly.
Below are examples of different types of tasks or images where higher reasoning is helpful.
### Example: floorplan reasoning
The floorplan below is a good example of a task that goes beyond transcription. To answer correctly, the model has to read room labels, interpret spatial relationships, and use visible dimensions to compute values.
```
`floorplan\_prompt = """
Inspect this apartment floorplan and return JSON with these keys:
- total\_named\_rooms\_excluding\_hallways\_and\_closets
- largest\_room
- room\_immediately\_east\_of\_kitchen
- room\_immediately\_south\_of\_study
- bedroom\_1\_total\_area\_ft2
- bedroom\_2\_total\_area\_ft2
Rules:
- Use the room labels and dimension annotations that are visible on the drawing.
- Return integers for numeric fields.
- Return JSON only.
"""
floorplan\_path = "../../examples/multimodal//cookbook/assets/examples/multimodal/images/apartment\_floorplan.png"
floorplan\_response = client.responses.create(
model="gpt-5.4",
input=[
{
"role": "user",
"content": [
{"type": "input\_text", "text": floorplan\_prompt},
{
"type": "input\_image",
"image\_url": image\_to\_data\_url(floorplan\_path),
"detail": "original",
},
],
}
],
reasoning={"effort": "high"},
text={"format": {"type": "json\_object"}},
)
floorplan\_result = json.loads(floorplan\_response.output\_text)
display(Markdown(f"### Floorplan reasoning result\\n\\n```json\\n{json.dumps(floorplan\_result, indent=2, ensure\_ascii=False)}\\n```"))`
```
### Floorplan reasoning result
```
`{
"total\_named\_rooms\_excluding\_hallways\_and\_closets": 7,
"largest\_room": "Living Room",
"room\_immediately\_east\_of\_kitchen": "Dining",
"room\_immediately\_south\_of\_study": "Bedroom 2",
"bedroom\_1\_total\_area\_ft2": 168,
"bedroom\_2\_total\_area\_ft2": 96
}`
```
### Example: chart understanding
The same pattern shows up in chart understanding. If the task is simply to read a title or identify one plotted value, default settings may be enough. But if the answer depends on comparing multiple series, tracking changes across adjacent intervals, or estimating trends over time, reasoning becomes the limiting factor.
```
`chart\_prompt = """
Inspect this line chart and return a JSON with these keys:
- largest\_qoq\_increase: {"channel": ..., "from\_quarter": ..., "to\_quarter": ..., "approx\_delta\_millions": ...}
- largest\_qoq\_drop: {"channel": ..., "from\_quarter": ..., "to\_quarter": ..., "approx\_delta\_millions": ...}
- fastest\_growing\_channel\_overall
Rules:
- Use approximate values only when exact values are not printed.
- Base the answer on the visible lines and quarter labels.
- Return JSON only.
"""
chart\_path = "/cookbook/assets/images/NotRealCorp\_chart.png"
chart\_response = client.responses.create(
model="gpt-5.4",
input=[
{
"role": "user",
"content": [
{"type": "input\_text", "text": chart\_prompt},
{
"type": "input\_image",
"image\_url": image\_to\_data\_url(chart\_path),
"detail": "original",
},
],
}
],
reasoning={"effort": "high"},
text={"format": {"type": "json\_object",}},
)
chart\_result = json.loads(chart\_response.output\_text)
display(Markdown(f"### Chart reasoning result\\n\\n```json\\n{json.dumps(chart\_result, indent=2, ensure\_ascii=False)}\\n```"))`
```
### Chart reasoning result
```
`{
"largest\_qoq\_increase": {
"channel": "Online Sales",
"from\_quarter": "2021 Q4",
"to\_quarter": "2022 Q1",
"approx\_delta\_millions": 0.15
},
"largest\_qoq\_drop": {
"channel": "Retail Partners",
"from\_quarter": "2023 Q4",
"to\_quarter": "2024 Q1",
"approx\_delta\_millions": -0.06
},
"fastest\_growing\_channel\_overall": "Online Sales"
}`
```
### Example: long-range visual reasoning on a dense bracket
Dense tournament brackets are a strong candidate for reasoning because the model has to follow paths across a crowded layout, keep left and right regions distinct, and identify the final outcomes without losing track of structure.
```
`bracket\_prompt = """
Inspect this tournament bracket image and return JSON with these keys:
- left\_bracket\_title
- right\_bracket\_title
- mens\_champion\_team
- womens\_champion\_team
- mens\_runner\_up\_team
- womens\_runner\_up\_team
Rules:
- Use the visible central championship score boxes.
- Team labels may include seeds; if you include a seed, keep it attached to the same string.
- Return JSON only.
"""
bracket\_path = "../../examples/multimodal//cookbook/assets/examples/multimodal/images/bracket.png"
bracket\_response = client.responses.create(
model="gpt-5.4",
input=[
{
"role": "user",
"content": [
{"type": "input\_text", "text": bracket\_prompt},
{
"type": "input\_image",
"image\_url": image\_to\_data\_url(bracket\_path),
"detail": "original",
},
],
}
],
reasoning={"effort": "high"},
text={"format": {"type": "json\_object"}},
)
bracket\_result = json.loads(bracket\_response.output\_text)
display(Markdown(f"### Bracket reasoning result\\n\\n```json\\n{json.dumps(bracket\_result, indent=2, ensure\_ascii=False)}\\n```"))`
```
### Bracket reasoning result
```
`{
"left\_bracket\_title": "Women’s Bracket",
"right\_bracket\_title": "Men’s Bracket",
"mens\_champion\_team": "Connecticut 4",
"womens\_champion\_team": "L.S.U. 3",
"mens\_runner\_up\_team": "5 S.D. State",
"womens\_runner\_up\_team": "2 Iowa"
}`
```
## 4. Use Code Interpreter for multi-pass inspection and bounding-box localization
Some document tasks are easier to solve the way a person would: inspect the full page, zoom or crop a region, check another area, and then combine evidence into a final answer.
Code Interpreter is particularly useful for vision tasks when:
* the page is dense and evidence is spread across multiple regions
* the model needs to zoom, crop, rotate, or run intermediate checks
* qualitative accuracy matters more than minimum latency
For localization tasks (including bounding boxes), provide access to code interpreter as well as a strict coordinate contract like `[x\_min, y\_min, x\_max, y\_max]` and a fixed coordinate space such as `0..999` with the origin in the top-left corner.
In practice, this combination (code interpreter tool use + explicit box format) is often more reliable and repeatable than a single-pass vision call.
```
`bbox\_prompt = """
Find the license plate number for Vehicle 1 and Vehicle 2 in this police report form.
It is written after License # and is a 7-digit number.
Do not guess or infer the license plate number.
Return JSON with this schema:
{
"b": [
{"label": "vehicle\_1\_license\_plate", "bbox": [x\_min, y\_min, x\_max, y\_max]},
{"label": "vehicle\_2\_license\_plate", "bbox": [x\_min, y\_min, x\_max, y\_max]}
]
}
Use discrete normalized coordinates between 0 and 999.
Return JSON only.
"""
police\_form\_path = "../../examples/multimodal//cookbook/assets/examples/multimodal/images/police\_form.png"
with Path(police\_form\_path).open("rb") as asset\_file:
uploaded\_file = client.files.create(file=asset\_file, purpose="user\_data")
bbox\_schema = {
"type": "object",
"properties": {
"b": {
"type": "array",
"items": {
"type": "object",
"properties": {
"label": {
"type": "string",
"enum": ["vehicle\_1\_license\_plate", "vehicle\_2\_license\_plate"],
},
"bbox": {
"type": "array",
"items": {"type": "integer", "minimum": 0, "maximum": 999},
"minItems": 4,
"maxItems": 4,
},
},
"required": ["label", "bbox"],
"additionalProperties": False,
},
"minItems": 2,
"maxItems": 2,
}
},
"required": ["b"],
"additionalProperties": False,
}
bbox\_response = client.responses.create(
model="gpt-5.4",
input=[
{
"role": "user",
"content": [
{"type": "input\_text", "text": bbox\_prompt},
{
"type": "input\_image",
"image\_url": image\_to\_data\_url(police\_form\_path),
"detail": "original",
},
],
}
],
reasoning={"effort": "high"},
text={
"format": {
"type": "json\_schema",
"name": "plate\_bboxes",
"schema": bbox\_schema,
"strict": True,
}
},
instructions=(
"You are an expert document analyst. Use Code Interpreter before answering. "
"Inspect the uploaded file, crop or zoom if needed, then answer in JSON."
),
tools=[
{
"type": "code\_interpreter",
"container": {
"type": "auto",
"memory\_limit": "4g",
"file\_ids": [uploaded\_file.id],
},
}
],
)
bbox\_results = json.loads(bbox\_response.output\_text)["b"]
display(Markdown(f"### Detected plate regions\\n\\n```json\\n{json.dumps(bbox\_results, indent=2, ensure\_ascii=False)}\\n```"))
annotated = Image.open(police\_form\_path).convert("RGB")
draw = ImageDraw.Draw(annotated)
width, height = annotated.size
palette = ["red", "dodgerblue", "limegreen", "orange", "magenta", "cyan"]
for index, item in enumerate(bbox\_results):
color = palette[index % len(palette)]
x\_min, y\_min, x\_max, y\_max = item["bbox"]
pixel\_bbox = [
round(x\_min \* (width - 1) / 999),
round(y\_min \* (height - 1) / 999),
round(x\_max \* (width - 1) / 999),
round(y\_max \* (height - 1) / 999),
]
draw.rectangle(pixel\_bbox, outline=color, width=4)
draw.text((pixel\_bbox[0] + 4, max(0, pixel\_bbox[1] - 16)), item["label"], fill=color)
display(annotated)`
```
### Detected plate regions
```
`[
{
"label": "vehicle\_1\_license\_plate",
"bbox": [
136,
308,
178,
315
]
},
{
"label": "vehicle\_2\_license\_plate",
"bbox": [
136,
662,
188,
669
]
}
]`
```
## 5. If you cannot use Code Interpreter, build a narrow crop-and-rerun pipeline
In restricted environments, you may not want to grant the model a general Python sandbox. A practical alternative is a two-stage workflow:
1. localize the field or region you care about
2. crop that region locally
3. rerun a smaller, more focused prompt on the crop
This often recovers much of the value of multi-pass inspection while keeping the control surface small.
```
`target\_region = next(
item for item in bbox\_results if item["label"] == "vehicle\_2\_license\_plate"
)
source\_image = Image.open(police\_form\_path).convert("RGB")
width, height = source\_image.size
x\_min, y\_min, x\_max, y\_max = target\_region["bbox"]
pixel\_bbox = [
round(x\_min \* (width - 1) / 999),
round(y\_min \* (height - 1) / 999),
round(x\_max \* (width - 1) / 999),
round(y\_max \* (height - 1) / 999),
]
padding = 0.18
pad\_x = round((pixel\_bbox[2] - pixel\_bbox[0]) \* padding)
pad\_y = round((pixel\_bbox[3] - pixel\_bbox[1]) \* padding)
crop = source\_image.crop(
(
max(0, pixel\_bbox[0] - pad\_x),
max(0, pixel\_bbox[1] - pad\_y),
min(width, pixel\_bbox[2] + pad\_x),
min(height, pixel\_bbox[3] + pad\_y),
)
)
tmp = tempfile.NamedTemporaryFile(suffix=".png", delete=False)
crop\_path = Path(tmp.name)
tmp.close()
crop.save(crop\_path)
display(crop)
crop\_prompt = """
Read the license number value in this cropped police-form region.
It is next to the word License #.
Return JSON with one key:
- license\_number
Return JSON only.
"""
crop\_schema = {
"type": "object",
"properties": {
"license\_number": {"type": "string"},
},
"required": ["license\_number"],
"additionalProperties": False,
}
crop\_response = client.responses.create(
model="gpt-5.4",
input=[
{
"role": "user",
"content": [
{"type": "input\_text", "text": crop\_prompt},
{
"type": "input\_image",
"image\_url": image\_to\_data\_url(crop\_path),
"detail": "original",
},
],
}
],
text={
"format": {
"type": "json\_schema",
"name": "license\_number\_extraction",
"schema": crop\_schema,
"strict": True,
}
},
)
crop\_result = json.loads(crop\_response.output\_text)
display(Markdown(f"### Crop-and-rerun result\\n\\n```json\\n{json.dumps(crop\_result, indent=2, ensure\_ascii=False)}\\n```"))`
```
### Crop-and-rerun result
```
`{
"license\_number": "S76389777"
}`
```
## Conclusion
To summarize, start simple: use native vision with detail=“auto” and no tools when the task is simple and the page is clear.
Raise image detail (detail=“original”) when text is tiny, handwritten, low-contrast, or scan quality is poor.
Raise verbosity when you need faithful transcription rather than compressed summaries.
Raise reasoning effort when the image is readable but the answer requires combining multiple regions.
Use Code Interpreter for multi-pass inspection (zoom/crop/rotate), especially on dense pages.
For bounding boxes, require a strict contract: [x\_min, y\_min, x\_max, y\_max] in a fixed 0..999 coordinate space (top-left origin), and enforce structured JSON output.
If Code Interpreter is unavailable, use crop-and-rerun: localize, crop locally, then run a focused extraction prompt.
In restricted environments, expose lightweight visual tools (crop/zoom/rotate/OCR-region fallback) for tighter control.