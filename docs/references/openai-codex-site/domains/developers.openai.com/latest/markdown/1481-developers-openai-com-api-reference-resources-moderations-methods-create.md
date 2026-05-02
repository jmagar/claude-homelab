Create moderation | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Moderations](/api/reference/resources/moderations)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create moderation
POST/moderations
Classifies if text and/or image inputs are potentially harmful. Learn
more in the [moderation guide](/docs/guides/moderation).
##### Body ParametersJSONExpand Collapse
input: string or array of string or array of object { image\_url, type } or object { text, type }
Input (or inputs) to classify. Can be a single string, an array of strings, or
an array of multi-modal input objects similar to other models.
One of the following:
string
A string of text to classify for moderation.
[](<#(resource) moderations > (method) create > (params) 0 > (param) input > (schema) > (variant) 0>)
array of string
An array of strings to classify for moderation.
[](<#(resource) moderations > (method) create > (params) 0 > (param) input > (schema) > (variant) 1>)
array of object { image\_url, type } or object { text, type }
An array of multi-modal inputs to the moderation model.
One of the following:
object { image\_url, type }
An object describing an image to classify.
image\_url: object { url }
Contains either an image URL or a data URL for a base64 encoded image.
url: string
Either a URL of the image or the base64 encoded image data.
formaturi
[](<#(resource) moderations > (method) create > (params) 0 > (param) input > (schema) > (variant) 2 > (items) > (variant) 0 > (property) image_url > (property) url>)
[](<#(resource) moderations > (method) create > (params) 0 > (param) input > (schema) > (variant) 2 > (items) > (variant) 0 > (property) image_url>)
type: "image\_url"
Always `image\_url`.
[](<#(resource) moderations > (method) create > (params) 0 > (param) input > (schema) > (variant) 2 > (items) > (variant) 0 > (property) type>)
[](<#(resource) moderations > (method) create > (params) 0 > (param) input > (schema) > (variant) 2 > (items) > (variant) 0>)
object { text, type }
An object describing text to classify.
text: string
A string of text to classify.
[](<#(resource) moderations > (method) create > (params) 0 > (param) input > (schema) > (variant) 2 > (items) > (variant) 1 > (property) text>)
type: "text"
Always `text`.
[](<#(resource) moderations > (method) create > (params) 0 > (param) input > (schema) > (variant) 2 > (items) > (variant) 1 > (property) type>)
[](<#(resource) moderations > (method) create > (params) 0 > (param) input > (schema) > (variant) 2 > (items) > (variant) 1>)
[](<#(resource) moderations > (method) create > (params) 0 > (param) input > (schema) > (variant) 2>)
[](<#(resource) moderations > (method) create > (params) 0 > (param) input > (schema)>)
model: optional string or [ModerationModel](</api/reference/resources/moderations#(resource) moderations > (model) moderation_model > (schema)>)
The content moderation model you would like to use. Learn more in
[the moderation guide](/docs/guides/moderation), and learn about
available models [here](/docs/models#moderation).
One of the following:
string
[](<#(resource) moderations > (method) create > (params) 0 > (param) model > (schema) > (variant) 0>)
ModerationModel = "omni-moderation-latest" or "omni-moderation-2024-09-26" or "text-moderation-latest" or "text-moderation-stable"
One of the following:
"omni-moderation-latest"
[](<#(resource) moderations > (model) moderation_model > (schema) > (member) 0>)
"omni-moderation-2024-09-26"
[](<#(resource) moderations > (model) moderation_model > (schema) > (member) 1>)
"text-moderation-latest"
[](<#(resource) moderations > (model) moderation_model > (schema) > (member) 2>)
"text-moderation-stable"
[](<#(resource) moderations > (model) moderation_model > (schema) > (member) 3>)
[](<#(resource) moderations > (model) moderation_model > (schema)>)
[](<#(resource) moderations > (method) create > (params) 0 > (param) model > (schema)>)
##### ReturnsExpand Collapse
id: string
The unique identifier for the moderation request.
[](<#(resource) moderations > (model) moderation_create_response > (schema) > (property) id>)
model: string
The model used to generate the moderation results.
[](<#(resource) moderations > (model) moderation_create_response > (schema) > (property) model>)
results: array of [Moderation](</api/reference/resources/moderations#(resource) moderations > (model) moderation > (schema)>) { categories, category\_applied\_input\_types, category\_scores, flagged }
A list of moderation objects.
categories: object { harassment, "harassment/threatening", hate, 10 more }
A list of the categories, and whether they are flagged or not.
harassment: boolean
Content that expresses, incites, or promotes harassing language towards any target.
[](<#(resource) moderations > (model) moderation > (schema) > (property) categories > (property) harassment>)
"harassment/threatening": boolean
Harassment content that also includes violence or serious harm towards any target.
[](<#(resource) moderations > (model) moderation > (schema) > (property) categories > (property) harassment/threatening>)
hate: boolean
Content that expresses, incites, or promotes hate based on race, gender, ethnicity, religion, nationality, sexual orientation, disability status, or caste. Hateful content aimed at non-protected groups (e.g., chess players) is harassment.
[](<#(resource) moderations > (model) moderation > (schema) > (property) categories > (property) hate>)
"hate/threatening": boolean
Hateful content that also includes violence or serious harm towards the targeted group based on race, gender, ethnicity, religion, nationality, sexual orientation, disability status, or caste.
[](<#(resource) moderations > (model) moderation > (schema) > (property) categories > (property) hate/threatening>)
illicit: boolean
Content that includes instructions or advice that facilitate the planning or execution of wrongdoing, or that gives advice or instruction on how to commit illicit acts. For example, “how to shoplift” would fit this category.
[](<#(resource) moderations > (model) moderation > (schema) > (property) categories > (property) illicit>)
"illicit/violent": boolean
Content that includes instructions or advice that facilitate the planning or execution of wrongdoing that also includes violence, or that gives advice or instruction on the procurement of any weapon.
[](<#(resource) moderations > (model) moderation > (schema) > (property) categories > (property) illicit/violent>)
"self-harm": boolean
Content that promotes, encourages, or depicts acts of self-harm, such as suicide, cutting, and eating disorders.
[](<#(resource) moderations > (model) moderation > (schema) > (property) categories > (property) self-harm>)
"self-harm/instructions": boolean
Content that encourages performing acts of self-harm, such as suicide, cutting, and eating disorders, or that gives instructions or advice on how to commit such acts.
[](<#(resource) moderations > (model) moderation > (schema) > (property) categories > (property) self-harm/instructions>)
"self-harm/intent": boolean
Content where the speaker expresses that they are engaging or intend to engage in acts of self-harm, such as suicide, cutting, and eating disorders.
[](<#(resource) moderations > (model) moderation > (schema) > (property) categories > (property) self-harm/intent>)
sexual: boolean
Content meant to arouse sexual excitement, such as the description of sexual activity, or that promotes sexual services (excluding sex education and wellness).
[](<#(resource) moderations > (model) moderation > (schema) > (property) categories > (property) sexual>)
"sexual/minors": boolean
Sexual content that includes an individual who is under 18 years old.
[](<#(resource) moderations > (model) moderation > (schema) > (property) categories > (property) sexual/minors>)
violence: boolean
Content that depicts death, violence, or physical injury.
[](<#(resource) moderations > (model) moderation > (schema) > (property) categories > (property) violence>)
"violence/graphic": boolean
Content that depicts death, violence, or physical injury in graphic detail.
[](<#(resource) moderations > (model) moderation > (schema) > (property) categories > (property) violence/graphic>)
[](<#(resource) moderations > (model) moderation > (schema) > (property) categories>)
category\_applied\_input\_types: object { harassment, "harassment/threatening", hate, 10 more }
A list of the categories along with the input type(s) that the score applies to.
harassment: array of "text"
The applied input type(s) for the category ‘harassment’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) harassment>)
"harassment/threatening": array of "text"
The applied input type(s) for the category ‘harassment/threatening’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) harassment/threatening>)
hate: array of "text"
The applied input type(s) for the category ‘hate’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) hate>)
"hate/threatening": array of "text"
The applied input type(s) for the category ‘hate/threatening’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) hate/threatening>)
illicit: array of "text"
The applied input type(s) for the category ‘illicit’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) illicit>)
"illicit/violent": array of "text"
The applied input type(s) for the category ‘illicit/violent’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) illicit/violent>)
"self-harm": array of "text" or "image"
The applied input type(s) for the category ‘self-harm’.
One of the following:
"text"
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) self-harm > (items) > (member) 0>)
"image"
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) self-harm > (items) > (member) 1>)
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) self-harm>)
"self-harm/instructions": array of "text" or "image"
The applied input type(s) for the category ‘self-harm/instructions’.
One of the following:
"text"
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) self-harm/instructions > (items) > (member) 0>)
"image"
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) self-harm/instructions > (items) > (member) 1>)
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) self-harm/instructions>)
"self-harm/intent": array of "text" or "image"
The applied input type(s) for the category ‘self-harm/intent’.
One of the following:
"text"
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) self-harm/intent > (items) > (member) 0>)
"image"
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) self-harm/intent > (items) > (member) 1>)
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) self-harm/intent>)
sexual: array of "text" or "image"
The applied input type(s) for the category ‘sexual’.
One of the following:
"text"
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) sexual > (items) > (member) 0>)
"image"
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) sexual > (items) > (member) 1>)
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) sexual>)
"sexual/minors": array of "text"
The applied input type(s) for the category ‘sexual/minors’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) sexual/minors>)
violence: array of "text" or "image"
The applied input type(s) for the category ‘violence’.
One of the following:
"text"
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) violence > (items) > (member) 0>)
"image"
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) violence > (items) > (member) 1>)
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) violence>)
"violence/graphic": array of "text" or "image"
The applied input type(s) for the category ‘violence/graphic’.
One of the following:
"text"
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) violence/graphic > (items) > (member) 0>)
"image"
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) violence/graphic > (items) > (member) 1>)
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) violence/graphic>)
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types>)
category\_scores: object { harassment, "harassment/threatening", hate, 10 more }
A list of the categories along with their scores as predicted by model.
harassment: number
The score for the category ‘harassment’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) harassment>)
"harassment/threatening": number
The score for the category ‘harassment/threatening’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) harassment/threatening>)
hate: number
The score for the category ‘hate’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) hate>)
"hate/threatening": number
The score for the category ‘hate/threatening’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) hate/threatening>)
illicit: number
The score for the category ‘illicit’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) illicit>)
"illicit/violent": number
The score for the category ‘illicit/violent’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) illicit/violent>)
"self-harm": number
The score for the category ‘self-harm’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) self-harm>)
"self-harm/instructions": number
The score for the category ‘self-harm/instructions’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) self-harm/instructions>)
"self-harm/intent": number
The score for the category ‘self-harm/intent’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) self-harm/intent>)
sexual: number
The score for the category ‘sexual’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) sexual>)
"sexual/minors": number
The score for the category ‘sexual/minors’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) sexual/minors>)
violence: number
The score for the category ‘violence’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) violence>)
"violence/graphic": number
The score for the category ‘violence/graphic’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) violence/graphic>)
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores>)
flagged: boolean
Whether any of the below categories are flagged.
[](<#(resource) moderations > (model) moderation > (schema) > (property) flagged>)
[](<#(resource) moderations > (model) moderation_create_response > (schema) > (property) results>)
Single stringImage and text
### Create moderation
HTTP
HTTP
HTTP
TypeScript
TypeScript
Python
Python
Java
Java
Go
Go
Ruby
Ruby
Terraform
Terraform
```
`curl https://api.openai.com/v1/moderations \\
-H "Content-Type: application/json" \\
-H "Authorization: Bearer $OPENAI\_API\_KEY" \\
-d '{
"input": "I want to kill them."
}'
`
```
```
`{
"id": "modr-AB8CjOTu2jiq12hp1AQPfeqFWaORR",
"model": "text-moderation-007",
"results": [
{
"flagged": true,
"categories": {
"sexual": false,
"hate": false,
"harassment": true,
"self-harm": false,
"sexual/minors": false,
"hate/threatening": false,
"violence/graphic": false,
"self-harm/intent": false,
"self-harm/instructions": false,
"harassment/threatening": true,
"violence": true
},
"category\_scores": {
"sexual": 0.000011726012417057063,
"hate": 0.22706663608551025,
"harassment": 0.5215635299682617,
"self-harm": 2.227119921371923e-6,
"sexual/minors": 7.107352217872176e-8,
"hate/threatening": 0.023547329008579254,
"violence/graphic": 0.00003391829886822961,
"self-harm/intent": 1.646940972932498e-6,
"self-harm/instructions": 1.1198755256458526e-9,
"harassment/threatening": 0.5694745779037476,
"violence": 0.9971134662628174
}
}
]
}
`
```
### Create moderation
HTTP
HTTP
HTTP
TypeScript
TypeScript
Python
Python
Java
Java
Go
Go
Ruby
Ruby
Terraform
Terraform
```
`curl https://api.openai.com/v1/moderations \\
-X POST \\
-H "Content-Type: application/json" \\
-H "Authorization: Bearer $OPENAI\_API\_KEY" \\
-d '{
"model": "omni-moderation-latest",
"input": [
{ "type": "text", "text": "...text to classify goes here..." },
{
"type": "image\_url",
"image\_url": {
"url": "https://example.com/image.png"
}
}
]
}'
`
```
```
`{
"id": "modr-0d9740456c391e43c445bf0f010940c7",
"model": "omni-moderation-latest",
"results": [
{
"flagged": true,
"categories": {
"harassment": true,
"harassment/threatening": true,
"sexual": false,
"hate": false,
"hate/threatening": false,
"illicit": false,
"illicit/violent": false,
"self-harm/intent": false,
"self-harm/instructions": false,
"self-harm": false,
"sexual/minors": false,
"violence": true,
"violence/graphic": true
},
"category\_scores": {
"harassment": 0.8189693396524255,
"harassment/threatening": 0.804985420696006,
"sexual": 1.573112165348997e-6,
"hate": 0.007562942636942845,
"hate/threatening": 0.004208854591835476,
"illicit": 0.030535955153511665,
"illicit/violent": 0.008925306722380033,
"self-harm/intent": 0.00023023930975076432,
"self-harm/instructions": 0.0002293869201073356,
"self-harm": 0.012598046106750154,
"sexual/minors": 2.212566909570261e-8,
"violence": 0.9999992735124786,
"violence/graphic": 0.843064871157054
},
"category\_applied\_input\_types": {
"harassment": [
"text"
],
"harassment/threatening": [
"text"
],
"sexual": [
"text",
"image"
],
"hate": [
"text"
],
"hate/threatening": [
"text"
],
"illicit": [
"text"
],
"illicit/violent": [
"text"
],
"self-harm/intent": [
"text",
"image"
],
"self-harm/instructions": [
"text",
"image"
],
"self-harm": [
"text",
"image"
],
"sexual/minors": [
"text"
],
"violence": [
"text",
"image"
],
"violence/graphic": [
"text",
"image"
]
}
}
]
}
`
```
##### Returns Examples
200 example
```
`{
"id": "id",
"model": "model",
"results": [
{
"categories": {
"harassment": true,
"harassment/threatening": true,
"hate": true,
"hate/threatening": true,
"illicit": true,
"illicit/violent": true,
"self-harm": true,
"self-harm/instructions": true,
"self-harm/intent": true,
"sexual": true,
"sexual/minors": true,
"violence": true,
"violence/graphic": true
},
"category\_applied\_input\_types": {
"harassment": [
"text"
],
"harassment/threatening": [
"text"
],
"hate": [
"text"
],
"hate/threatening": [
"text"
],
"illicit": [
"text"
],
"illicit/violent": [
"text"
],
"self-harm": [
"text"
],
"self-harm/instructions": [
"text"
],
"self-harm/intent": [
"text"
],
"sexual": [
"text"
],
"sexual/minors": [
"text"
],
"violence": [
"text"
],
"violence/graphic": [
"text"
]
},
"category\_scores": {
"harassment": 0,
"harassment/threatening": 0,
"hate": 0,
"hate/threatening": 0,
"illicit": 0,
"illicit/violent": 0,
"self-harm": 0,
"self-harm/instructions": 0,
"self-harm/intent": 0,
"sexual": 0,
"sexual/minors": 0,
"violence": 0,
"violence/graphic": 0
},
"flagged": true
}
]
}`
```