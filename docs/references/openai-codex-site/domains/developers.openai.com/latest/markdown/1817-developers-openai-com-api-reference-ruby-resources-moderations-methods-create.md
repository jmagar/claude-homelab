Create moderation | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Moderations](/api/reference/ruby/resources/moderations)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create moderation
moderations.create(\*\*kwargs) -\> [ModerationCreateResponse](</api/reference/ruby/resources/moderations#(resource) moderations > (model) moderation_create_response > (schema)>) { id, model, results }
POST/moderations
Classifies if text and/or image inputs are potentially harmful. Learn
more in the [moderation guide](https://platform.openai.com/docs/guides/moderation).
##### ParametersExpand Collapse
input: String | Array[String] | Array[[ModerationMultiModalInput](</api/reference/ruby/resources/moderations#(resource) moderations > (model) moderation_multi_modal_input > (schema)>)]
Input (or inputs) to classify. Can be a single string, an array of strings, or
an array of multi-modal input objects similar to other models.
One of the following:
String = String
A string of text to classify for moderation.
[](<#(resource) moderations > (method) create > (params) default > (param) input > (schema) > (variant) 0>)
UnionMember1 = Array[String]
An array of strings to classify for moderation.
[](<#(resource) moderations > (method) create > (params) default > (param) input > (schema) > (variant) 1>)
ModerationMultiModalArray = Array[[ModerationMultiModalInput](</api/reference/ruby/resources/moderations#(resource) moderations > (model) moderation_multi_modal_input > (schema)>)]
An array of multi-modal inputs to the moderation model.
One of the following:
class ModerationImageURLInput { image\_url, type }
An object describing an image to classify.
image\_url: ImageURL{ url}
Contains either an image URL or a data URL for a base64 encoded image.
url: String
Either a URL of the image or the base64 encoded image data.
formaturi
[](<#(resource) moderations > (model) moderation_image_url_input > (schema) > (property) image_url > (property) url>)
[](<#(resource) moderations > (model) moderation_image_url_input > (schema) > (property) image_url>)
type: :image\_url
Always `image\_url`.
[](<#(resource) moderations > (model) moderation_image_url_input > (schema) > (property) type>)
[](<#(resource) moderations > (model) moderation_image_url_input > (schema)>)
class ModerationTextInput { text, type }
An object describing text to classify.
text: String
A string of text to classify.
[](<#(resource) moderations > (model) moderation_text_input > (schema) > (property) text>)
type: :text
Always `text`.
[](<#(resource) moderations > (model) moderation_text_input > (schema) > (property) type>)
[](<#(resource) moderations > (model) moderation_text_input > (schema)>)
[](<#(resource) moderations > (method) create > (params) default > (param) input > (schema) > (variant) 2>)
[](<#(resource) moderations > (method) create > (params) default > (param) input > (schema)>)
model: String | [ModerationModel](</api/reference/ruby/resources/moderations#(resource) moderations > (model) moderation_model > (schema)>)
The content moderation model you would like to use. Learn more in
[the moderation guide](https://platform.openai.com/docs/guides/moderation), and learn about
available models [here](https://platform.openai.com/docs/models#moderation).
One of the following:
String = String
[](<#(resource) moderations > (method) create > (params) default > (param) model > (schema) > (variant) 0>)
ModerationModel = :"omni-moderation-latest" | :"omni-moderation-2024-09-26" | :"text-moderation-latest" | :"text-moderation-stable"
One of the following:
:"omni-moderation-latest"
[](<#(resource) moderations > (model) moderation_model > (schema) > (member) 0>)
:"omni-moderation-2024-09-26"
[](<#(resource) moderations > (model) moderation_model > (schema) > (member) 1>)
:"text-moderation-latest"
[](<#(resource) moderations > (model) moderation_model > (schema) > (member) 2>)
:"text-moderation-stable"
[](<#(resource) moderations > (model) moderation_model > (schema) > (member) 3>)
[](<#(resource) moderations > (model) moderation_model > (schema)>)
[](<#(resource) moderations > (method) create > (params) default > (param) model > (schema)>)
##### ReturnsExpand Collapse
class ModerationCreateResponse { id, model, results }
Represents if a given text input is potentially harmful.
id: String
The unique identifier for the moderation request.
[](<#(resource) moderations > (model) moderation_create_response > (schema) > (property) id>)
model: String
The model used to generate the moderation results.
[](<#(resource) moderations > (model) moderation_create_response > (schema) > (property) model>)
results: Array[[Moderation](</api/reference/ruby/resources/moderations#(resource) moderations > (model) moderation > (schema)>) { categories, category\_applied\_input\_types, category\_scores, flagged } ]
A list of moderation objects.
categories: Categories{ harassment, harassment\_threatening, hate, 10 more}
A list of the categories, and whether they are flagged or not.
harassment: bool
Content that expresses, incites, or promotes harassing language towards any target.
[](<#(resource) moderations > (model) moderation > (schema) > (property) categories > (property) harassment>)
harassment\_threatening: bool
Harassment content that also includes violence or serious harm towards any target.
[](<#(resource) moderations > (model) moderation > (schema) > (property) categories > (property) harassment/threatening>)
hate: bool
Content that expresses, incites, or promotes hate based on race, gender, ethnicity, religion, nationality, sexual orientation, disability status, or caste. Hateful content aimed at non-protected groups (e.g., chess players) is harassment.
[](<#(resource) moderations > (model) moderation > (schema) > (property) categories > (property) hate>)
hate\_threatening: bool
Hateful content that also includes violence or serious harm towards the targeted group based on race, gender, ethnicity, religion, nationality, sexual orientation, disability status, or caste.
[](<#(resource) moderations > (model) moderation > (schema) > (property) categories > (property) hate/threatening>)
illicit: bool
Content that includes instructions or advice that facilitate the planning or execution of wrongdoing, or that gives advice or instruction on how to commit illicit acts. For example, “how to shoplift” would fit this category.
[](<#(resource) moderations > (model) moderation > (schema) > (property) categories > (property) illicit>)
illicit\_violent: bool
Content that includes instructions or advice that facilitate the planning or execution of wrongdoing that also includes violence, or that gives advice or instruction on the procurement of any weapon.
[](<#(resource) moderations > (model) moderation > (schema) > (property) categories > (property) illicit/violent>)
self\_harm: bool
Content that promotes, encourages, or depicts acts of self-harm, such as suicide, cutting, and eating disorders.
[](<#(resource) moderations > (model) moderation > (schema) > (property) categories > (property) self-harm>)
self\_harm\_instructions: bool
Content that encourages performing acts of self-harm, such as suicide, cutting, and eating disorders, or that gives instructions or advice on how to commit such acts.
[](<#(resource) moderations > (model) moderation > (schema) > (property) categories > (property) self-harm/instructions>)
self\_harm\_intent: bool
Content where the speaker expresses that they are engaging or intend to engage in acts of self-harm, such as suicide, cutting, and eating disorders.
[](<#(resource) moderations > (model) moderation > (schema) > (property) categories > (property) self-harm/intent>)
sexual: bool
Content meant to arouse sexual excitement, such as the description of sexual activity, or that promotes sexual services (excluding sex education and wellness).
[](<#(resource) moderations > (model) moderation > (schema) > (property) categories > (property) sexual>)
sexual\_minors: bool
Sexual content that includes an individual who is under 18 years old.
[](<#(resource) moderations > (model) moderation > (schema) > (property) categories > (property) sexual/minors>)
violence: bool
Content that depicts death, violence, or physical injury.
[](<#(resource) moderations > (model) moderation > (schema) > (property) categories > (property) violence>)
violence\_graphic: bool
Content that depicts death, violence, or physical injury in graphic detail.
[](<#(resource) moderations > (model) moderation > (schema) > (property) categories > (property) violence/graphic>)
[](<#(resource) moderations > (model) moderation > (schema) > (property) categories>)
category\_applied\_input\_types: CategoryAppliedInputTypes{ harassment, harassment\_threatening, hate, 10 more}
A list of the categories along with the input type(s) that the score applies to.
harassment: Array[:text]
The applied input type(s) for the category ‘harassment’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) harassment>)
harassment\_threatening: Array[:text]
The applied input type(s) for the category ‘harassment/threatening’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) harassment/threatening>)
hate: Array[:text]
The applied input type(s) for the category ‘hate’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) hate>)
hate\_threatening: Array[:text]
The applied input type(s) for the category ‘hate/threatening’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) hate/threatening>)
illicit: Array[:text]
The applied input type(s) for the category ‘illicit’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) illicit>)
illicit\_violent: Array[:text]
The applied input type(s) for the category ‘illicit/violent’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) illicit/violent>)
self\_harm: Array[:text | :image]
The applied input type(s) for the category ‘self-harm’.
One of the following:
:text
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) self-harm > (items) > (member) 0>)
:image
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) self-harm > (items) > (member) 1>)
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) self-harm>)
self\_harm\_instructions: Array[:text | :image]
The applied input type(s) for the category ‘self-harm/instructions’.
One of the following:
:text
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) self-harm/instructions > (items) > (member) 0>)
:image
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) self-harm/instructions > (items) > (member) 1>)
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) self-harm/instructions>)
self\_harm\_intent: Array[:text | :image]
The applied input type(s) for the category ‘self-harm/intent’.
One of the following:
:text
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) self-harm/intent > (items) > (member) 0>)
:image
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) self-harm/intent > (items) > (member) 1>)
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) self-harm/intent>)
sexual: Array[:text | :image]
The applied input type(s) for the category ‘sexual’.
One of the following:
:text
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) sexual > (items) > (member) 0>)
:image
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) sexual > (items) > (member) 1>)
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) sexual>)
sexual\_minors: Array[:text]
The applied input type(s) for the category ‘sexual/minors’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) sexual/minors>)
violence: Array[:text | :image]
The applied input type(s) for the category ‘violence’.
One of the following:
:text
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) violence > (items) > (member) 0>)
:image
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) violence > (items) > (member) 1>)
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) violence>)
violence\_graphic: Array[:text | :image]
The applied input type(s) for the category ‘violence/graphic’.
One of the following:
:text
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) violence/graphic > (items) > (member) 0>)
:image
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) violence/graphic > (items) > (member) 1>)
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) violence/graphic>)
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types>)
category\_scores: CategoryScores{ harassment, harassment\_threatening, hate, 10 more}
A list of the categories along with their scores as predicted by model.
harassment: Float
The score for the category ‘harassment’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) harassment>)
harassment\_threatening: Float
The score for the category ‘harassment/threatening’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) harassment/threatening>)
hate: Float
The score for the category ‘hate’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) hate>)
hate\_threatening: Float
The score for the category ‘hate/threatening’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) hate/threatening>)
illicit: Float
The score for the category ‘illicit’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) illicit>)
illicit\_violent: Float
The score for the category ‘illicit/violent’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) illicit/violent>)
self\_harm: Float
The score for the category ‘self-harm’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) self-harm>)
self\_harm\_instructions: Float
The score for the category ‘self-harm/instructions’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) self-harm/instructions>)
self\_harm\_intent: Float
The score for the category ‘self-harm/intent’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) self-harm/intent>)
sexual: Float
The score for the category ‘sexual’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) sexual>)
sexual\_minors: Float
The score for the category ‘sexual/minors’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) sexual/minors>)
violence: Float
The score for the category ‘violence’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) violence>)
violence\_graphic: Float
The score for the category ‘violence/graphic’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) violence/graphic>)
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores>)
flagged: bool
Whether any of the below categories are flagged.
[](<#(resource) moderations > (model) moderation > (schema) > (property) flagged>)
[](<#(resource) moderations > (model) moderation_create_response > (schema) > (property) results>)
[](<#(resource) moderations > (model) moderation_create_response > (schema)>)
### Create moderation
Ruby
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
`require "openai"
openai = OpenAI::Client.new(api\_key: "My API Key")
moderation = openai.moderations.create(input: "I want to kill them.")
puts(moderation)`
```
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