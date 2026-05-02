Create moderation | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Moderations](/api/reference/go/resources/moderations)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create moderation
client.Moderations.New(ctx, body) (\*[ModerationNewResponse](</api/reference/go/resources/moderations#(resource) moderations > (model) ModerationNewResponse > (schema)>), error)
POST/moderations
Classifies if text and/or image inputs are potentially harmful. Learn
more in the [moderation guide](https://platform.openai.com/docs/guides/moderation).
##### ParametersExpand Collapse
body ModerationNewParams
Input param.Field[[ModerationNewParamsInputUnion](</api/reference/go/resources/moderations/methods/create#(resource) moderations > (method) create > (params) default > (param) input > (schema)>)]
Input (or inputs) to classify. Can be a single string, an array of strings, or
an array of multi-modal input objects similar to other models.
string
[](<#(resource) moderations > (method) create > (params) default > (param) input > (schema) > (variant) 0>)
type ModerationNewParamsInputArray []string
An array of strings to classify for moderation.
[](<#(resource) moderations > (method) create > (params) default > (param) input > (schema) > (variant) 1>)
type ModerationNewParamsInputModerationMultiModalArray [][ModerationMultiModalInputUnion](</api/reference/go/resources/moderations#(resource) moderations > (model) moderation_multi_modal_input > (schema)>)
An array of multi-modal inputs to the moderation model.
One of the following:
type ModerationImageURLInput struct{…}
An object describing an image to classify.
ImageURL ModerationImageURLInputImageURL
Contains either an image URL or a data URL for a base64 encoded image.
URL string
Either a URL of the image or the base64 encoded image data.
formaturi
[](<#(resource) moderations > (model) moderation_image_url_input > (schema) > (property) image_url > (property) url>)
[](<#(resource) moderations > (model) moderation_image_url_input > (schema) > (property) image_url>)
Type ImageURL
Always `image\_url`.
[](<#(resource) moderations > (model) moderation_image_url_input > (schema) > (property) type>)
[](<#(resource) moderations > (model) moderation_image_url_input > (schema)>)
type ModerationTextInput struct{…}
An object describing text to classify.
Text string
A string of text to classify.
[](<#(resource) moderations > (model) moderation_text_input > (schema) > (property) text>)
Type Text
Always `text`.
[](<#(resource) moderations > (model) moderation_text_input > (schema) > (property) type>)
[](<#(resource) moderations > (model) moderation_text_input > (schema)>)
[](<#(resource) moderations > (method) create > (params) default > (param) input > (schema) > (variant) 2>)
[](<#(resource) moderations > (method) create > (params) default > (param) input>)
Model param.Field[[ModerationModel](</api/reference/go/resources/moderations#(resource) moderations > (model) moderation_model > (schema)>)]Optional
The content moderation model you would like to use. Learn more in
[the moderation guide](https://platform.openai.com/docs/guides/moderation), and learn about
available models [here](https://platform.openai.com/docs/models#moderation).
string
[](<#(resource) moderations > (method) create > (params) default > (param) model > (schema) > (variant) 0>)
type ModerationModel string
One of the following:
const ModerationModelOmniModerationLatest [ModerationModel](</api/reference/go/resources/moderations#(resource) moderations > (model) moderation_model > (schema)>) = "omni-moderation-latest"
[](<#(resource) moderations > (model) moderation_model > (schema) > (member) 0>)
const ModerationModelOmniModeration2024\_09\_26 [ModerationModel](</api/reference/go/resources/moderations#(resource) moderations > (model) moderation_model > (schema)>) = "omni-moderation-2024-09-26"
[](<#(resource) moderations > (model) moderation_model > (schema) > (member) 1>)
const ModerationModelTextModerationLatest [ModerationModel](</api/reference/go/resources/moderations#(resource) moderations > (model) moderation_model > (schema)>) = "text-moderation-latest"
[](<#(resource) moderations > (model) moderation_model > (schema) > (member) 2>)
const ModerationModelTextModerationStable [ModerationModel](</api/reference/go/resources/moderations#(resource) moderations > (model) moderation_model > (schema)>) = "text-moderation-stable"
[](<#(resource) moderations > (model) moderation_model > (schema) > (member) 3>)
[](<#(resource) moderations > (model) moderation_model > (schema)>)
[](<#(resource) moderations > (method) create > (params) default > (param) model>)
[](<#(resource) moderations > (method) create > (params) default>)
##### ReturnsExpand Collapse
type ModerationNewResponse struct{…}
Represents if a given text input is potentially harmful.
ID string
The unique identifier for the moderation request.
[](<#(resource) moderations > (model) ModerationNewResponse > (schema) > (property) id>)
Model string
The model used to generate the moderation results.
[](<#(resource) moderations > (model) ModerationNewResponse > (schema) > (property) model>)
Results [][Moderation](</api/reference/go/resources/moderations#(resource) moderations > (model) moderation > (schema)>)
A list of moderation objects.
Categories ModerationCategories
A list of the categories, and whether they are flagged or not.
Harassment bool
Content that expresses, incites, or promotes harassing language towards any target.
[](<#(resource) moderations > (model) moderation > (schema) > (property) categories > (property) harassment>)
HarassmentThreatening bool
Harassment content that also includes violence or serious harm towards any target.
[](<#(resource) moderations > (model) moderation > (schema) > (property) categories > (property) harassment/threatening>)
Hate bool
Content that expresses, incites, or promotes hate based on race, gender, ethnicity, religion, nationality, sexual orientation, disability status, or caste. Hateful content aimed at non-protected groups (e.g., chess players) is harassment.
[](<#(resource) moderations > (model) moderation > (schema) > (property) categories > (property) hate>)
HateThreatening bool
Hateful content that also includes violence or serious harm towards the targeted group based on race, gender, ethnicity, religion, nationality, sexual orientation, disability status, or caste.
[](<#(resource) moderations > (model) moderation > (schema) > (property) categories > (property) hate/threatening>)
Illicit bool
Content that includes instructions or advice that facilitate the planning or execution of wrongdoing, or that gives advice or instruction on how to commit illicit acts. For example, “how to shoplift” would fit this category.
[](<#(resource) moderations > (model) moderation > (schema) > (property) categories > (property) illicit>)
IllicitViolent bool
Content that includes instructions or advice that facilitate the planning or execution of wrongdoing that also includes violence, or that gives advice or instruction on the procurement of any weapon.
[](<#(resource) moderations > (model) moderation > (schema) > (property) categories > (property) illicit/violent>)
SelfHarm bool
Content that promotes, encourages, or depicts acts of self-harm, such as suicide, cutting, and eating disorders.
[](<#(resource) moderations > (model) moderation > (schema) > (property) categories > (property) self-harm>)
SelfHarmInstructions bool
Content that encourages performing acts of self-harm, such as suicide, cutting, and eating disorders, or that gives instructions or advice on how to commit such acts.
[](<#(resource) moderations > (model) moderation > (schema) > (property) categories > (property) self-harm/instructions>)
SelfHarmIntent bool
Content where the speaker expresses that they are engaging or intend to engage in acts of self-harm, such as suicide, cutting, and eating disorders.
[](<#(resource) moderations > (model) moderation > (schema) > (property) categories > (property) self-harm/intent>)
Sexual bool
Content meant to arouse sexual excitement, such as the description of sexual activity, or that promotes sexual services (excluding sex education and wellness).
[](<#(resource) moderations > (model) moderation > (schema) > (property) categories > (property) sexual>)
SexualMinors bool
Sexual content that includes an individual who is under 18 years old.
[](<#(resource) moderations > (model) moderation > (schema) > (property) categories > (property) sexual/minors>)
Violence bool
Content that depicts death, violence, or physical injury.
[](<#(resource) moderations > (model) moderation > (schema) > (property) categories > (property) violence>)
ViolenceGraphic bool
Content that depicts death, violence, or physical injury in graphic detail.
[](<#(resource) moderations > (model) moderation > (schema) > (property) categories > (property) violence/graphic>)
[](<#(resource) moderations > (model) moderation > (schema) > (property) categories>)
CategoryAppliedInputTypes ModerationCategoryAppliedInputTypes
A list of the categories along with the input type(s) that the score applies to.
Harassment []string
The applied input type(s) for the category ‘harassment’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) harassment>)
HarassmentThreatening []string
The applied input type(s) for the category ‘harassment/threatening’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) harassment/threatening>)
Hate []string
The applied input type(s) for the category ‘hate’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) hate>)
HateThreatening []string
The applied input type(s) for the category ‘hate/threatening’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) hate/threatening>)
Illicit []string
The applied input type(s) for the category ‘illicit’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) illicit>)
IllicitViolent []string
The applied input type(s) for the category ‘illicit/violent’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) illicit/violent>)
SelfHarm []string
The applied input type(s) for the category ‘self-harm’.
One of the following:
const ModerationCategoryAppliedInputTypesSelfHarmText ModerationCategoryAppliedInputTypesSelfHarm = "text"
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) self-harm > (items) > (member) 0>)
const ModerationCategoryAppliedInputTypesSelfHarmImage ModerationCategoryAppliedInputTypesSelfHarm = "image"
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) self-harm > (items) > (member) 1>)
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) self-harm>)
SelfHarmInstructions []string
The applied input type(s) for the category ‘self-harm/instructions’.
One of the following:
const ModerationCategoryAppliedInputTypesSelfHarmInstructionText ModerationCategoryAppliedInputTypesSelfHarmInstruction = "text"
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) self-harm/instructions > (items) > (member) 0>)
const ModerationCategoryAppliedInputTypesSelfHarmInstructionImage ModerationCategoryAppliedInputTypesSelfHarmInstruction = "image"
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) self-harm/instructions > (items) > (member) 1>)
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) self-harm/instructions>)
SelfHarmIntent []string
The applied input type(s) for the category ‘self-harm/intent’.
One of the following:
const ModerationCategoryAppliedInputTypesSelfHarmIntentText ModerationCategoryAppliedInputTypesSelfHarmIntent = "text"
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) self-harm/intent > (items) > (member) 0>)
const ModerationCategoryAppliedInputTypesSelfHarmIntentImage ModerationCategoryAppliedInputTypesSelfHarmIntent = "image"
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) self-harm/intent > (items) > (member) 1>)
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) self-harm/intent>)
Sexual []string
The applied input type(s) for the category ‘sexual’.
One of the following:
const ModerationCategoryAppliedInputTypesSexualText ModerationCategoryAppliedInputTypesSexual = "text"
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) sexual > (items) > (member) 0>)
const ModerationCategoryAppliedInputTypesSexualImage ModerationCategoryAppliedInputTypesSexual = "image"
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) sexual > (items) > (member) 1>)
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) sexual>)
SexualMinors []string
The applied input type(s) for the category ‘sexual/minors’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) sexual/minors>)
Violence []string
The applied input type(s) for the category ‘violence’.
One of the following:
const ModerationCategoryAppliedInputTypesViolenceText ModerationCategoryAppliedInputTypesViolence = "text"
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) violence > (items) > (member) 0>)
const ModerationCategoryAppliedInputTypesViolenceImage ModerationCategoryAppliedInputTypesViolence = "image"
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) violence > (items) > (member) 1>)
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) violence>)
ViolenceGraphic []string
The applied input type(s) for the category ‘violence/graphic’.
One of the following:
const ModerationCategoryAppliedInputTypesViolenceGraphicText ModerationCategoryAppliedInputTypesViolenceGraphic = "text"
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) violence/graphic > (items) > (member) 0>)
const ModerationCategoryAppliedInputTypesViolenceGraphicImage ModerationCategoryAppliedInputTypesViolenceGraphic = "image"
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) violence/graphic > (items) > (member) 1>)
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) violence/graphic>)
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types>)
CategoryScores ModerationCategoryScores
A list of the categories along with their scores as predicted by model.
Harassment float64
The score for the category ‘harassment’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) harassment>)
HarassmentThreatening float64
The score for the category ‘harassment/threatening’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) harassment/threatening>)
Hate float64
The score for the category ‘hate’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) hate>)
HateThreatening float64
The score for the category ‘hate/threatening’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) hate/threatening>)
Illicit float64
The score for the category ‘illicit’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) illicit>)
IllicitViolent float64
The score for the category ‘illicit/violent’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) illicit/violent>)
SelfHarm float64
The score for the category ‘self-harm’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) self-harm>)
SelfHarmInstructions float64
The score for the category ‘self-harm/instructions’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) self-harm/instructions>)
SelfHarmIntent float64
The score for the category ‘self-harm/intent’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) self-harm/intent>)
Sexual float64
The score for the category ‘sexual’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) sexual>)
SexualMinors float64
The score for the category ‘sexual/minors’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) sexual/minors>)
Violence float64
The score for the category ‘violence’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) violence>)
ViolenceGraphic float64
The score for the category ‘violence/graphic’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) violence/graphic>)
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores>)
Flagged bool
Whether any of the below categories are flagged.
[](<#(resource) moderations > (model) moderation > (schema) > (property) flagged>)
[](<#(resource) moderations > (model) ModerationNewResponse > (schema) > (property) results>)
[](<#(resource) moderations > (model) ModerationNewResponse > (schema)>)
### Create moderation
Go
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
`package main
import (
"context"
"fmt"
"github.com/openai/openai-go"
"github.com/openai/openai-go/option"
)
func main() {
client := openai.NewClient(
option.WithAPIKey("My API Key"),
)
moderation, err := client.Moderations.New(context.TODO(), openai.ModerationNewParams{
Input: openai.ModerationNewParamsInputUnion{
OfString: openai.String("I want to kill them."),
},
})
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", moderation.ID)
}
`
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