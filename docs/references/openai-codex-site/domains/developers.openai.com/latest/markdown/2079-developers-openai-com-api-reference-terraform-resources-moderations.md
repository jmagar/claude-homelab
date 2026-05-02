Moderations | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/terraform)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Moderations
Given text and/or image inputs, classifies if those inputs are potentially harmful.
#### resource openai\_moderation
##### required Expand Collapse
input: String
Input (or inputs) to classify. Can be a single string, an array of strings, or
an array of multi-modal input objects similar to other models.
[](<#(resource) moderations > (terraform resource) > (attribute) input>)
##### optional Expand Collapse
model?: String
The content moderation model you would like to use. Learn more in
[the moderation guide](https://platform.openai.com/docs/guides/moderation), and learn about
available models [here](https://platform.openai.com/docs/models#moderation).
[](<#(resource) moderations > (terraform resource) > (attribute) model>)
##### computed Expand Collapse
id: String
The unique identifier for the moderation request.
[](<#(resource) moderations > (terraform resource) > (attribute) id>)
results: List[Attributes]
A list of moderation objects.
categories: Attributes
A list of the categories, and whether they are flagged or not.
harassment: Bool
Content that expresses, incites, or promotes harassing language towards any target.
[](<#(resource) moderations > (terraform resource) > (attribute) results > (attribute) categories > (attribute) harassment>)
harassment\_threatening: Bool
Harassment content that also includes violence or serious harm towards any target.
[](<#(resource) moderations > (terraform resource) > (attribute) results > (attribute) categories > (attribute) harassment_threatening>)
hate: Bool
Content that expresses, incites, or promotes hate based on race, gender, ethnicity, religion, nationality, sexual orientation, disability status, or caste. Hateful content aimed at non-protected groups (e.g., chess players) is harassment.
[](<#(resource) moderations > (terraform resource) > (attribute) results > (attribute) categories > (attribute) hate>)
hate\_threatening: Bool
Hateful content that also includes violence or serious harm towards the targeted group based on race, gender, ethnicity, religion, nationality, sexual orientation, disability status, or caste.
[](<#(resource) moderations > (terraform resource) > (attribute) results > (attribute) categories > (attribute) hate_threatening>)
illicit: Bool
Content that includes instructions or advice that facilitate the planning or execution of wrongdoing, or that gives advice or instruction on how to commit illicit acts. For example, “how to shoplift” would fit this category.
[](<#(resource) moderations > (terraform resource) > (attribute) results > (attribute) categories > (attribute) illicit>)
illicit\_violent: Bool
Content that includes instructions or advice that facilitate the planning or execution of wrongdoing that also includes violence, or that gives advice or instruction on the procurement of any weapon.
[](<#(resource) moderations > (terraform resource) > (attribute) results > (attribute) categories > (attribute) illicit_violent>)
self\_harm: Bool
Content that promotes, encourages, or depicts acts of self-harm, such as suicide, cutting, and eating disorders.
[](<#(resource) moderations > (terraform resource) > (attribute) results > (attribute) categories > (attribute) self_harm>)
self\_harm\_instructions: Bool
Content that encourages performing acts of self-harm, such as suicide, cutting, and eating disorders, or that gives instructions or advice on how to commit such acts.
[](<#(resource) moderations > (terraform resource) > (attribute) results > (attribute) categories > (attribute) self_harm_instructions>)
self\_harm\_intent: Bool
Content where the speaker expresses that they are engaging or intend to engage in acts of self-harm, such as suicide, cutting, and eating disorders.
[](<#(resource) moderations > (terraform resource) > (attribute) results > (attribute) categories > (attribute) self_harm_intent>)
sexual: Bool
Content meant to arouse sexual excitement, such as the description of sexual activity, or that promotes sexual services (excluding sex education and wellness).
[](<#(resource) moderations > (terraform resource) > (attribute) results > (attribute) categories > (attribute) sexual>)
sexual\_minors: Bool
Sexual content that includes an individual who is under 18 years old.
[](<#(resource) moderations > (terraform resource) > (attribute) results > (attribute) categories > (attribute) sexual_minors>)
violence: Bool
Content that depicts death, violence, or physical injury.
[](<#(resource) moderations > (terraform resource) > (attribute) results > (attribute) categories > (attribute) violence>)
violence\_graphic: Bool
Content that depicts death, violence, or physical injury in graphic detail.
[](<#(resource) moderations > (terraform resource) > (attribute) results > (attribute) categories > (attribute) violence_graphic>)
[](<#(resource) moderations > (terraform resource) > (attribute) results > (attribute) categories>)
category\_applied\_input\_types: Attributes
A list of the categories along with the input type(s) that the score applies to.
harassment: List[String]
The applied input type(s) for the category ‘harassment’.
[](<#(resource) moderations > (terraform resource) > (attribute) results > (attribute) category_applied_input_types > (attribute) harassment>)
harassment\_threatening: List[String]
The applied input type(s) for the category ‘harassment/threatening’.
[](<#(resource) moderations > (terraform resource) > (attribute) results > (attribute) category_applied_input_types > (attribute) harassment_threatening>)
hate: List[String]
The applied input type(s) for the category ‘hate’.
[](<#(resource) moderations > (terraform resource) > (attribute) results > (attribute) category_applied_input_types > (attribute) hate>)
hate\_threatening: List[String]
The applied input type(s) for the category ‘hate/threatening’.
[](<#(resource) moderations > (terraform resource) > (attribute) results > (attribute) category_applied_input_types > (attribute) hate_threatening>)
illicit: List[String]
The applied input type(s) for the category ‘illicit’.
[](<#(resource) moderations > (terraform resource) > (attribute) results > (attribute) category_applied_input_types > (attribute) illicit>)
illicit\_violent: List[String]
The applied input type(s) for the category ‘illicit/violent’.
[](<#(resource) moderations > (terraform resource) > (attribute) results > (attribute) category_applied_input_types > (attribute) illicit_violent>)
self\_harm: List[String]
The applied input type(s) for the category ‘self-harm’.
[](<#(resource) moderations > (terraform resource) > (attribute) results > (attribute) category_applied_input_types > (attribute) self_harm>)
self\_harm\_instructions: List[String]
The applied input type(s) for the category ‘self-harm/instructions’.
[](<#(resource) moderations > (terraform resource) > (attribute) results > (attribute) category_applied_input_types > (attribute) self_harm_instructions>)
self\_harm\_intent: List[String]
The applied input type(s) for the category ‘self-harm/intent’.
[](<#(resource) moderations > (terraform resource) > (attribute) results > (attribute) category_applied_input_types > (attribute) self_harm_intent>)
sexual: List[String]
The applied input type(s) for the category ‘sexual’.
[](<#(resource) moderations > (terraform resource) > (attribute) results > (attribute) category_applied_input_types > (attribute) sexual>)
sexual\_minors: List[String]
The applied input type(s) for the category ‘sexual/minors’.
[](<#(resource) moderations > (terraform resource) > (attribute) results > (attribute) category_applied_input_types > (attribute) sexual_minors>)
violence: List[String]
The applied input type(s) for the category ‘violence’.
[](<#(resource) moderations > (terraform resource) > (attribute) results > (attribute) category_applied_input_types > (attribute) violence>)
violence\_graphic: List[String]
The applied input type(s) for the category ‘violence/graphic’.
[](<#(resource) moderations > (terraform resource) > (attribute) results > (attribute) category_applied_input_types > (attribute) violence_graphic>)
[](<#(resource) moderations > (terraform resource) > (attribute) results > (attribute) category_applied_input_types>)
category\_scores: Attributes
A list of the categories along with their scores as predicted by model.
harassment: Float64
The score for the category ‘harassment’.
[](<#(resource) moderations > (terraform resource) > (attribute) results > (attribute) category_scores > (attribute) harassment>)
harassment\_threatening: Float64
The score for the category ‘harassment/threatening’.
[](<#(resource) moderations > (terraform resource) > (attribute) results > (attribute) category_scores > (attribute) harassment_threatening>)
hate: Float64
The score for the category ‘hate’.
[](<#(resource) moderations > (terraform resource) > (attribute) results > (attribute) category_scores > (attribute) hate>)
hate\_threatening: Float64
The score for the category ‘hate/threatening’.
[](<#(resource) moderations > (terraform resource) > (attribute) results > (attribute) category_scores > (attribute) hate_threatening>)
illicit: Float64
The score for the category ‘illicit’.
[](<#(resource) moderations > (terraform resource) > (attribute) results > (attribute) category_scores > (attribute) illicit>)
illicit\_violent: Float64
The score for the category ‘illicit/violent’.
[](<#(resource) moderations > (terraform resource) > (attribute) results > (attribute) category_scores > (attribute) illicit_violent>)
self\_harm: Float64
The score for the category ‘self-harm’.
[](<#(resource) moderations > (terraform resource) > (attribute) results > (attribute) category_scores > (attribute) self_harm>)
self\_harm\_instructions: Float64
The score for the category ‘self-harm/instructions’.
[](<#(resource) moderations > (terraform resource) > (attribute) results > (attribute) category_scores > (attribute) self_harm_instructions>)
self\_harm\_intent: Float64
The score for the category ‘self-harm/intent’.
[](<#(resource) moderations > (terraform resource) > (attribute) results > (attribute) category_scores > (attribute) self_harm_intent>)
sexual: Float64
The score for the category ‘sexual’.
[](<#(resource) moderations > (terraform resource) > (attribute) results > (attribute) category_scores > (attribute) sexual>)
sexual\_minors: Float64
The score for the category ‘sexual/minors’.
[](<#(resource) moderations > (terraform resource) > (attribute) results > (attribute) category_scores > (attribute) sexual_minors>)
violence: Float64
The score for the category ‘violence’.
[](<#(resource) moderations > (terraform resource) > (attribute) results > (attribute) category_scores > (attribute) violence>)
violence\_graphic: Float64
The score for the category ‘violence/graphic’.
[](<#(resource) moderations > (terraform resource) > (attribute) results > (attribute) category_scores > (attribute) violence_graphic>)
[](<#(resource) moderations > (terraform resource) > (attribute) results > (attribute) category_scores>)
flagged: Bool
Whether any of the below categories are flagged.
[](<#(resource) moderations > (terraform resource) > (attribute) results > (attribute) flagged>)
[](<#(resource) moderations > (terraform resource) > (attribute) results>)
### openai\_moderation
Terraform
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
`resource "openai\_moderation" "example\_moderation" {
input = "I want to kill them."
model = "string"
}
`
```