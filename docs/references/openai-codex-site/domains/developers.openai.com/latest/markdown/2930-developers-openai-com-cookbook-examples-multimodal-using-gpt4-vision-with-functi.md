Using GPT4 Vision with Function Calling
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
Dec 13, 2024
# Using GPT4 Vision with Function Calling
[ SA ](https://twitter.com/shyamalanadkat)[ MW ](https://www.linkedin.com/in/mitchwelzen/)
[ Shyamal Anadkat
(OpenAI)
, ](https://twitter.com/shyamalanadkat)[ Mitch Welzen
(OpenAI)
](https://www.linkedin.com/in/mitchwelzen/)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/multimodal/Using_GPT4_Vision_With_Function_Calling.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/multimodal/Using_GPT4_Vision_With_Function_Calling.ipynb)
The GPT-4o, available as gpt-4o-2024-11-20 as of Novemeber 2024, now enables function calling with vision capabilities, better reasoning and a knowledge cutoff date of Oct 2023. Using images with function calling will unlock multimodal use cases and the ability to use reasoning, allowing you to go beyond OCR and image descriptions.
We will go through two examples to demonstrate the use of function calling with GPT-4o with Vision:
1. Simulating a customer service assistant for delivery exception support
2. Analyzing an organizational chart to extract employee information
### Installation and Setup
```
`!pip install pymupdf --quiet
!pip install openai --quiet
!pip install matplotlib --quiet
# instructor makes it easy to work with function calling
!pip install instructor --quiet`
```
```
`import base64
import os
from enum import Enum
from io import BytesIO
from typing import Iterable
from typing import List
from typing import Literal, Optional
import fitz
# Instructor is powered by Pydantic, which is powered by type hints. Schema validation, prompting is controlled by type annotations
import instructor
import matplotlib.pyplot as plt
import pandas as pd
from IPython.display import display
from PIL import Image
from openai import OpenAI
from pydantic import BaseModel, Field`
```
```
`Matplotlib is building the font cache; this may take a moment.`
```
## 1. Simulating a customer service assistant for delivery exception support
We will simulate a customer service assistant for a delivery service that is equipped to analyze images of packages. The assistant will perform the following actions based on the image analysis:
* If a package appears damaged in the image, automatically process a refund according to policy.
* If the package looks wet, initiate a replacement.
* If the package appears normal and not damaged, escalate to an agent.
Let’s look at the sample images of packages that the customer service assistant will analyze to determine the appropriate action. We will encode the images as base64 strings for processing by the model.
```
`# Function to encode the image as base64
def encode\_image(image\_path: str):
# check if the image exists
if not os.path.exists(image\_path):
raise FileNotFoundError(f"Image file not found: {image\_path}")
with open(image\_path, "rb") as image\_file:
return base64.b64encode(image\_file.read()).decode('utf-8')
# Sample images for testing
image\_dir = "images"
# encode all images within the directory
image\_files = os.listdir(image\_dir)
image\_data = {}
for image\_file in image\_files:
image\_path = os.path.join(image\_dir, image\_file)
# encode the image with key as the image file name
image\_data[image\_file.split('.')[0]] = encode\_image(image\_path)
print(f"Encoded image: {image\_file}")
def display\_images(image\_data: dict):
fig, axs = plt.subplots(1, 3, figsize=(18, 6))
for i, (key, value) in enumerate(image\_data.items()):
img = Image.open(BytesIO(base64.b64decode(value)))
ax = axs[i]
ax.imshow(img)
ax.axis("off")
ax.set\_title(key)
plt.tight\_layout()
plt.show()
display\_images(image\_data)`
```
```
`Encoded image: wet\_package.jpg
Encoded image: damaged\_package.jpg
Encoded image: normal\_package.jpg`
```
We have successfully encoded the sample images as base64 strings and displayed them. The customer service assistant will analyze these images to determine the appropriate action based on the package condition.
Let’s now define the functions/tools for order processing, such as escalating an order to an agent, refunding an order, and replacing an order. We will create placeholder functions to simulate the processing of these actions based on the identified tools. We will be using Pydantic models to define the structure of the data for order actions.
```
`MODEL = "gpt-4o-2024-11-20"
class Order(BaseModel):
"""Represents an order with details such as order ID, customer name, product name, price, status, and delivery date."""
order\_id: str = Field(..., description="The unique identifier of the order")
product\_name: str = Field(..., description="The name of the product")
price: float = Field(..., description="The price of the product")
status: str = Field(..., description="The status of the order")
delivery\_date: str = Field(..., description="The delivery date of the order")
# Placeholder functions for order processing
def get\_order\_details(order\_id):
# Placeholder function to retrieve order details based on the order ID
return Order(
order\_id=order\_id,
product\_name="Product X",
price=100.0,
status="Delivered",
delivery\_date="2024-04-10",
)
def escalate\_to\_agent(order: Order, message: str):
# Placeholder function to escalate the order to a human agent
return f"Order {order.order\_id} has been escalated to an agent with message: `{message}`"
def refund\_order(order: Order):
# Placeholder function to process a refund for the order
return f"Order {order.order\_id} has been refunded successfully."
def replace\_order(order: Order):
# Placeholder function to replace the order with a new one
return f"Order {order.order\_id} has been replaced with a new order."
class FunctionCallBase(BaseModel):
rationale: Optional[str] = Field(..., description="The reason for the action.")
image\_description: Optional[str] = Field(
..., description="The detailed description of the package image."
)
action: Literal["escalate\_to\_agent", "replace\_order", "refund\_order"]
message: Optional[str] = Field(
...,
description="The message to be escalated to the agent if action is escalate\_to\_agent",
)
# Placeholder functions to process the action based on the order ID
def \_\_call\_\_(self, order\_id):
order: Order = get\_order\_details(order\_id=order\_id)
if self.action == "escalate\_to\_agent":
return escalate\_to\_agent(order, self.message)
if self.action == "replace\_order":
return replace\_order(order)
if self.action == "refund\_order":
return refund\_order(order)
class EscalateToAgent(FunctionCallBase):
"""Escalate to an agent for further assistance."""
pass
class OrderActionBase(FunctionCallBase):
pass
class ReplaceOrder(OrderActionBase):
"""Tool call to replace an order."""
pass
class RefundOrder(OrderActionBase):
"""Tool call to refund an order."""
pass`
```
### Simulating user messages and processing the package images
We will simulate user messages containing the package images and process the images using the GPT-4o with Vision model. The model will identify the appropriate tool call based on the image analysis and the predefined actions for damaged, wet, or normal packages. We will then process the identified action based on the order ID and display the results.
```
`# extract the tool call from the response
ORDER\_ID = "12345" # Placeholder order ID for testing
INSTRUCTION\_PROMPT = "You are a customer service assistant for a delivery service, equipped to analyze images of packages. If a package appears damaged in the image, automatically process a refund according to policy. If the package looks wet, initiate a replacement. If the package appears normal and not damaged, escalate to agent. For any other issues or unclear images, escalate to agent. You must always use tools!"
def delivery\_exception\_support\_handler(test\_image: str):
payload = {
"model": MODEL,
"response\_model": Iterable[RefundOrder | ReplaceOrder | EscalateToAgent],
"tool\_choice": "auto", # automatically select the tool based on the context
"temperature": 0.0, # for less diversity in responses
"seed": 123, # Set a seed for reproducibility
}
payload["messages"] = [
{
"role": "user",
"content": INSTRUCTION\_PROMPT,
},
{
"role": "user",
"content": [
{
"type": "image\_url",
"image\_url": {
"url": f"data:image/jpeg;base64,{image\_data[test\_image]}"
}
},
],
}
]
function\_calls = instructor.from\_openai(
OpenAI(), mode=instructor.Mode.PARALLEL\_TOOLS
).chat.completions.create(\*\*payload)
for tool in function\_calls:
print(f"- Tool call: {tool.action} for provided img: {test\_image}")
print(f"- Parameters: {tool}")
print(f"\>\> Action result: {tool(ORDER\_ID)}")
return tool
print("Processing delivery exception support for different package images...")
print("\\n===================== Simulating user message 1 =====================")
assert delivery\_exception\_support\_handler("damaged\_package").action == "refund\_order"
print("\\n===================== Simulating user message 2 =====================")
assert delivery\_exception\_support\_handler("normal\_package").action == "escalate\_to\_agent"
print("\\n===================== Simulating user message 3 =====================")
assert delivery\_exception\_support\_handler("wet\_package").action == "replace\_order"`
```
```
`Processing delivery exception support for different package images...
===================== Simulating user message 1 =====================
- Tool call: refund\_order for provided img: damaged\_package
- Parameters: rationale='The package appears damaged as it is visibly crushed and deformed.' image\_description='A package that is visibly crushed and deformed, with torn and wrinkled packaging material.' action='refund\_order' message=None
\>\> Action result: Order 12345 has been refunded successfully.
===================== Simulating user message 2 =====================
- Tool call: escalate\_to\_agent for provided img: normal\_package
- Parameters: rationale='The package appears normal and undamaged in the image.' image\_description='A cardboard box placed on a wooden floor, showing no visible signs of damage or wetness.' action='escalate\_to\_agent' message='The package appears normal and undamaged. Please review further.'
\>\> Action result: Order 12345 has been escalated to an agent with message: `The package appears normal and undamaged. Please review further.`
===================== Simulating user message 3 =====================
- Tool call: replace\_order for provided img: wet\_package
- Parameters: rationale='The package appears wet, which may compromise its contents.' image\_description="A cardboard box labeled 'Fragile' with visible wet spots on its surface." action='replace\_order' message=None
\>\> Action result: Order 12345 has been replaced with a new order.`
```
## 2. Analyzing an organizational chart to extract employee information
For the second example, we will analyze an organizational chart image to extract employee information, such as employee names, roles, managers, and manager roles. We will use GPT-4o with Vision to process the organizational chart image and extract structured data about the employees in the organization. Indeed, function calling lets us go beyond OCR to actually deduce and translate hierarchical relationships within the chart.
We will start with a sample organizational chart in PDF format that we want to analyze and convert the first page of the PDF to a JPEG image for analysis.
```
`# Function to convert a single page PDF page to a JPEG image
def convert\_pdf\_page\_to\_jpg(pdf\_path: str, output\_path: str, page\_number=0):
if not os.path.exists(pdf\_path):
raise FileNotFoundError(f"PDF file not found: {pdf\_path}")
doc = fitz.open(pdf\_path)
page = doc.load\_page(page\_number) # 0 is the first page
pix = page.get\_pixmap()
# Save the pixmap as a JPEG
pix.save(output\_path)
def display\_img\_local(image\_path: str):
img = Image.open(image\_path)
display(img)
pdf\_path = 'data/org-chart-sample.pdf'
output\_path = 'org-chart-sample.jpg'
convert\_pdf\_page\_to\_jpg(pdf\_path, output\_path)
display\_img\_local(output\_path)`
```
The organizational chart image has been successfully extracted from the PDF file and displayed. Let’s now define a function to analyze the organizational chart image using the new GPT4o with Vision. The function will extract information about the employees, their roles, and their managers from the image. We will use function/tool calling to specify the input parameters for the organizational structure, such as the employee name, role, and manager’s name and role. We will use Pydantic models to define the structure of the data.
```
`base64\_img = encode\_image(output\_path)
class RoleEnum(str, Enum):
"""Defines possible roles within an organization."""
CEO = "CEO"
CTO = "CTO"
CFO = "CFO"
COO = "COO"
EMPLOYEE = "Employee"
MANAGER = "Manager"
INTERN = "Intern"
OTHER = "Other"
class Employee(BaseModel):
"""Represents an employee, including their name, role, and optional manager information."""
employee\_name: str = Field(..., description="The name of the employee")
role: RoleEnum = Field(..., description="The role of the employee")
manager\_name: Optional[str] = Field(None, description="The manager's name, if applicable")
manager\_role: Optional[RoleEnum] = Field(None, description="The manager's role, if applicable")
class EmployeeList(BaseModel):
"""A list of employees within the organizational structure."""
employees: List[Employee] = Field(..., description="A list of employees")
def parse\_orgchart(base64\_img: str) -\> EmployeeList:
response = instructor.from\_openai(OpenAI()).chat.completions.create(
model=MODEL,
response\_model=EmployeeList,
messages=[
{
"role": "user",
"content": 'Analyze the given organizational chart and very carefully extract the information.',
},
{
"role": "user",
"content": [
{
"type": "image\_url",
"image\_url": {
"url": f"data:image/jpeg;base64,{base64\_img}"
}
},
],
}
],
)
return response`
```
Now, we will define a function to parse the response from GPT-4o with vision and extract the employee data. We will tabulate the extracted data for easy visualization. Please note that the accuracy of the extracted data may vary based on the complexity and clarity of the input image.
```
`# call the functions to analyze the organizational chart and parse the response
result = parse\_orgchart(base64\_img)
# tabulate the extracted data
df = pd.DataFrame([{
'employee\_name': employee.employee\_name,
'role': employee.role.value,
'manager\_name': employee.manager\_name,
'manager\_role': employee.manager\_role.value if employee.manager\_role else None
} for employee in result.employees])
display(df)`
```
||employee\_name|role|manager\_name|manager\_role|
|0|Juliana Silva|CEO|None|None|
|1|Kim Chun Hei|CFO|Juliana Silva|CEO|
|2|Cahaya Dewi|Manager|Kim Chun Hei|CFO|
|3|Drew Feig|Employee|Cahaya Dewi|Manager|
|4|Richard Sanchez|Employee|Cahaya Dewi|Manager|
|5|Sacha Dubois|Intern|Cahaya Dewi|Manager|
|6|Chad Gibbons|CTO|Juliana Silva|CEO|
|7|Shawn Garcia|Manager|Chad Gibbons|CTO|
|8|Olivia Wilson|Employee|Shawn Garcia|Manager|
|9|Matt Zhang|Intern|Shawn Garcia|Manager|
|10|Chiaki Sato|COO|Juliana Silva|CEO|
|11|Aaron Loeb|Manager|Chiaki Sato|COO|
|12|Avery Davis|Employee|Aaron Loeb|Manager|
|13|Harper Russo|Employee|Aaron Loeb|Manager|
|14|Taylor Alonso|Intern|Aaron Loeb|Manager|
The extracted data from the organizational chart has been successfully parsed and displayed in a DataFrame. This approach allows us to leverage GPT-4o with Vision capabilities to extract structured information from images, such as organizational charts and diagrams, and process the data for further analysis. By using function calling, we can extend the functionality of multimodal models to perform specific tasks or call external functions.