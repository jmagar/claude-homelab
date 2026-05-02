Moderations | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Moderations
Given text and/or image inputs, classifies if those inputs are potentially harmful.
##### [Create moderation](/api/reference/python/resources/moderations/methods/create)
moderations.create(ModerationCreateParams\*\*kwargs) -\> [ModerationCreateResponse](</api/reference/python/resources/moderations#(resource) moderations > (model) moderation_create_response > (schema)>)
POST/moderations
##### ModelsExpand Collapse
class Moderation: …
categories: Categories
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
illicit: Optional[bool]
Content that includes instructions or advice that facilitate the planning or execution of wrongdoing, or that gives advice or instruction on how to commit illicit acts. For example, “how to shoplift” would fit this category.
[](<#(resource) moderations > (model) moderation > (schema) > (property) categories > (property) illicit>)
illicit\_violent: Optional[bool]
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
category\_applied\_input\_types: CategoryAppliedInputTypes
A list of the categories along with the input type(s) that the score applies to.
harassment: List[Literal["text"]]
The applied input type(s) for the category ‘harassment’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) harassment>)
harassment\_threatening: List[Literal["text"]]
The applied input type(s) for the category ‘harassment/threatening’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) harassment/threatening>)
hate: List[Literal["text"]]
The applied input type(s) for the category ‘hate’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) hate>)
hate\_threatening: List[Literal["text"]]
The applied input type(s) for the category ‘hate/threatening’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) hate/threatening>)
illicit: List[Literal["text"]]
The applied input type(s) for the category ‘illicit’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) illicit>)
illicit\_violent: List[Literal["text"]]
The applied input type(s) for the category ‘illicit/violent’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) illicit/violent>)
self\_harm: List[Literal["text", "image"]]
The applied input type(s) for the category ‘self-harm’.
One of the following:
"text"
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) self-harm > (items) > (member) 0>)
"image"
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) self-harm > (items) > (member) 1>)
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) self-harm>)
self\_harm\_instructions: List[Literal["text", "image"]]
The applied input type(s) for the category ‘self-harm/instructions’.
One of the following:
"text"
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) self-harm/instructions > (items) > (member) 0>)
"image"
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) self-harm/instructions > (items) > (member) 1>)
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) self-harm/instructions>)
self\_harm\_intent: List[Literal["text", "image"]]
The applied input type(s) for the category ‘self-harm/intent’.
One of the following:
"text"
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) self-harm/intent > (items) > (member) 0>)
"image"
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) self-harm/intent > (items) > (member) 1>)
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) self-harm/intent>)
sexual: List[Literal["text", "image"]]
The applied input type(s) for the category ‘sexual’.
One of the following:
"text"
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) sexual > (items) > (member) 0>)
"image"
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) sexual > (items) > (member) 1>)
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) sexual>)
sexual\_minors: List[Literal["text"]]
The applied input type(s) for the category ‘sexual/minors’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) sexual/minors>)
violence: List[Literal["text", "image"]]
The applied input type(s) for the category ‘violence’.
One of the following:
"text"
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) violence > (items) > (member) 0>)
"image"
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) violence > (items) > (member) 1>)
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) violence>)
violence\_graphic: List[Literal["text", "image"]]
The applied input type(s) for the category ‘violence/graphic’.
One of the following:
"text"
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) violence/graphic > (items) > (member) 0>)
"image"
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) violence/graphic > (items) > (member) 1>)
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) violence/graphic>)
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types>)
category\_scores: CategoryScores
A list of the categories along with their scores as predicted by model.
harassment: float
The score for the category ‘harassment’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) harassment>)
harassment\_threatening: float
The score for the category ‘harassment/threatening’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) harassment/threatening>)
hate: float
The score for the category ‘hate’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) hate>)
hate\_threatening: float
The score for the category ‘hate/threatening’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) hate/threatening>)
illicit: float
The score for the category ‘illicit’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) illicit>)
illicit\_violent: float
The score for the category ‘illicit/violent’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) illicit/violent>)
self\_harm: float
The score for the category ‘self-harm’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) self-harm>)
self\_harm\_instructions: float
The score for the category ‘self-harm/instructions’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) self-harm/instructions>)
self\_harm\_intent: float
The score for the category ‘self-harm/intent’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) self-harm/intent>)
sexual: float
The score for the category ‘sexual’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) sexual>)
sexual\_minors: float
The score for the category ‘sexual/minors’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) sexual/minors>)
violence: float
The score for the category ‘violence’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) violence>)
violence\_graphic: float
The score for the category ‘violence/graphic’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) violence/graphic>)
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores>)
flagged: bool
Whether any of the below categories are flagged.
[](<#(resource) moderations > (model) moderation > (schema) > (property) flagged>)
[](<#(resource) moderations > (model) moderation > (schema)>)
class ModerationImageURLInput: …
An object describing an image to classify.
image\_url: ImageURL
Contains either an image URL or a data URL for a base64 encoded image.
url: str
Either a URL of the image or the base64 encoded image data.
formaturi
[](<#(resource) moderations > (model) moderation_image_url_input > (schema) > (property) image_url > (property) url>)
[](<#(resource) moderations > (model) moderation_image_url_input > (schema) > (property) image_url>)
type: Literal["image\_url"]
Always `image\_url`.
[](<#(resource) moderations > (model) moderation_image_url_input > (schema) > (property) type>)
[](<#(resource) moderations > (model) moderation_image_url_input > (schema)>)
Literal["omni-moderation-latest", "omni-moderation-2024-09-26", "text-moderation-latest", "text-moderation-stable"]
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
[ModerationMultiModalInput](</api/reference/python/resources/moderations#(resource) moderations > (model) moderation_multi_modal_input > (schema)>)
An object describing an image to classify.
One of the following:
class ModerationImageURLInput: …
An object describing an image to classify.
image\_url: ImageURL
Contains either an image URL or a data URL for a base64 encoded image.
url: str
Either a URL of the image or the base64 encoded image data.
formaturi
[](<#(resource) moderations > (model) moderation_image_url_input > (schema) > (property) image_url > (property) url>)
[](<#(resource) moderations > (model) moderation_image_url_input > (schema) > (property) image_url>)
type: Literal["image\_url"]
Always `image\_url`.
[](<#(resource) moderations > (model) moderation_image_url_input > (schema) > (property) type>)
[](<#(resource) moderations > (model) moderation_image_url_input > (schema)>)
class ModerationTextInput: …
An object describing text to classify.
text: str
A string of text to classify.
[](<#(resource) moderations > (model) moderation_text_input > (schema) > (property) text>)
type: Literal["text"]
Always `text`.
[](<#(resource) moderations > (model) moderation_text_input > (schema) > (property) type>)
[](<#(resource) moderations > (model) moderation_text_input > (schema)>)
[](<#(resource) moderations > (model) moderation_multi_modal_input > (schema)>)
class ModerationTextInput: …
An object describing text to classify.
text: str
A string of text to classify.
[](<#(resource) moderations > (model) moderation_text_input > (schema) > (property) text>)
type: Literal["text"]
Always `text`.
[](<#(resource) moderations > (model) moderation_text_input > (schema) > (property) type>)
[](<#(resource) moderations > (model) moderation_text_input > (schema)>)
class ModerationCreateResponse: …
Represents if a given text input is potentially harmful.
id: str
The unique identifier for the moderation request.
[](<#(resource) moderations > (model) moderation_create_response > (schema) > (property) id>)
model: str
The model used to generate the moderation results.
[](<#(resource) moderations > (model) moderation_create_response > (schema) > (property) model>)
results: List[[Moderation](</api/reference/python/resources/moderations#(resource) moderations > (model) moderation > (schema)>)]
A list of moderation objects.
categories: Categories
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
illicit: Optional[bool]
Content that includes instructions or advice that facilitate the planning or execution of wrongdoing, or that gives advice or instruction on how to commit illicit acts. For example, “how to shoplift” would fit this category.
[](<#(resource) moderations > (model) moderation > (schema) > (property) categories > (property) illicit>)
illicit\_violent: Optional[bool]
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
category\_applied\_input\_types: CategoryAppliedInputTypes
A list of the categories along with the input type(s) that the score applies to.
harassment: List[Literal["text"]]
The applied input type(s) for the category ‘harassment’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) harassment>)
harassment\_threatening: List[Literal["text"]]
The applied input type(s) for the category ‘harassment/threatening’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) harassment/threatening>)
hate: List[Literal["text"]]
The applied input type(s) for the category ‘hate’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) hate>)
hate\_threatening: List[Literal["text"]]
The applied input type(s) for the category ‘hate/threatening’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) hate/threatening>)
illicit: List[Literal["text"]]
The applied input type(s) for the category ‘illicit’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) illicit>)
illicit\_violent: List[Literal["text"]]
The applied input type(s) for the category ‘illicit/violent’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) illicit/violent>)
self\_harm: List[Literal["text", "image"]]
The applied input type(s) for the category ‘self-harm’.
One of the following:
"text"
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) self-harm > (items) > (member) 0>)
"image"
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) self-harm > (items) > (member) 1>)
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) self-harm>)
self\_harm\_instructions: List[Literal["text", "image"]]
The applied input type(s) for the category ‘self-harm/instructions’.
One of the following:
"text"
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) self-harm/instructions > (items) > (member) 0>)
"image"
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) self-harm/instructions > (items) > (member) 1>)
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) self-harm/instructions>)
self\_harm\_intent: List[Literal["text", "image"]]
The applied input type(s) for the category ‘self-harm/intent’.
One of the following:
"text"
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) self-harm/intent > (items) > (member) 0>)
"image"
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) self-harm/intent > (items) > (member) 1>)
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) self-harm/intent>)
sexual: List[Literal["text", "image"]]
The applied input type(s) for the category ‘sexual’.
One of the following:
"text"
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) sexual > (items) > (member) 0>)
"image"
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) sexual > (items) > (member) 1>)
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) sexual>)
sexual\_minors: List[Literal["text"]]
The applied input type(s) for the category ‘sexual/minors’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) sexual/minors>)
violence: List[Literal["text", "image"]]
The applied input type(s) for the category ‘violence’.
One of the following:
"text"
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) violence > (items) > (member) 0>)
"image"
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) violence > (items) > (member) 1>)
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) violence>)
violence\_graphic: List[Literal["text", "image"]]
The applied input type(s) for the category ‘violence/graphic’.
One of the following:
"text"
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) violence/graphic > (items) > (member) 0>)
"image"
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) violence/graphic > (items) > (member) 1>)
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) violence/graphic>)
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types>)
category\_scores: CategoryScores
A list of the categories along with their scores as predicted by model.
harassment: float
The score for the category ‘harassment’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) harassment>)
harassment\_threatening: float
The score for the category ‘harassment/threatening’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) harassment/threatening>)
hate: float
The score for the category ‘hate’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) hate>)
hate\_threatening: float
The score for the category ‘hate/threatening’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) hate/threatening>)
illicit: float
The score for the category ‘illicit’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) illicit>)
illicit\_violent: float
The score for the category ‘illicit/violent’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) illicit/violent>)
self\_harm: float
The score for the category ‘self-harm’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) self-harm>)
self\_harm\_instructions: float
The score for the category ‘self-harm/instructions’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) self-harm/instructions>)
self\_harm\_intent: float
The score for the category ‘self-harm/intent’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) self-harm/intent>)
sexual: float
The score for the category ‘sexual’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) sexual>)
sexual\_minors: float
The score for the category ‘sexual/minors’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) sexual/minors>)
violence: float
The score for the category ‘violence’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) violence>)
violence\_graphic: float
The score for the category ‘violence/graphic’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) violence/graphic>)
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores>)
flagged: bool
Whether any of the below categories are flagged.
[](<#(resource) moderations > (model) moderation > (schema) > (property) flagged>)
[](<#(resource) moderations > (model) moderation_create_response > (schema) > (property) results>)
[](<#(resource) moderations > (model) moderation_create_response > (schema)>)