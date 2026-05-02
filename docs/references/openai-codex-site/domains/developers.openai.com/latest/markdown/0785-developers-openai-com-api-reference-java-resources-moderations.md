Moderations | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Moderations
Given text and/or image inputs, classifies if those inputs are potentially harmful.
##### [Create moderation](/api/reference/java/resources/moderations/methods/create)
[ModerationCreateResponse](</api/reference/java/resources/moderations#(resource) moderations > (model) ModerationCreateResponse > (schema)>) moderations().create(ModerationCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/moderations
##### ModelsExpand Collapse
class Moderation:
Categories categories
A list of the categories, and whether they are flagged or not.
boolean harassment
Content that expresses, incites, or promotes harassing language towards any target.
[](<#(resource) moderations > (model) moderation > (schema) > (property) categories > (property) harassment>)
boolean harassmentThreatening
Harassment content that also includes violence or serious harm towards any target.
[](<#(resource) moderations > (model) moderation > (schema) > (property) categories > (property) harassment/threatening>)
boolean hate
Content that expresses, incites, or promotes hate based on race, gender, ethnicity, religion, nationality, sexual orientation, disability status, or caste. Hateful content aimed at non-protected groups (e.g., chess players) is harassment.
[](<#(resource) moderations > (model) moderation > (schema) > (property) categories > (property) hate>)
boolean hateThreatening
Hateful content that also includes violence or serious harm towards the targeted group based on race, gender, ethnicity, religion, nationality, sexual orientation, disability status, or caste.
[](<#(resource) moderations > (model) moderation > (schema) > (property) categories > (property) hate/threatening>)
Optional\<Boolean\> illicit
Content that includes instructions or advice that facilitate the planning or execution of wrongdoing, or that gives advice or instruction on how to commit illicit acts. For example, “how to shoplift” would fit this category.
[](<#(resource) moderations > (model) moderation > (schema) > (property) categories > (property) illicit>)
Optional\<Boolean\> illicitViolent
Content that includes instructions or advice that facilitate the planning or execution of wrongdoing that also includes violence, or that gives advice or instruction on the procurement of any weapon.
[](<#(resource) moderations > (model) moderation > (schema) > (property) categories > (property) illicit/violent>)
boolean selfHarm
Content that promotes, encourages, or depicts acts of self-harm, such as suicide, cutting, and eating disorders.
[](<#(resource) moderations > (model) moderation > (schema) > (property) categories > (property) self-harm>)
boolean selfHarmInstructions
Content that encourages performing acts of self-harm, such as suicide, cutting, and eating disorders, or that gives instructions or advice on how to commit such acts.
[](<#(resource) moderations > (model) moderation > (schema) > (property) categories > (property) self-harm/instructions>)
boolean selfHarmIntent
Content where the speaker expresses that they are engaging or intend to engage in acts of self-harm, such as suicide, cutting, and eating disorders.
[](<#(resource) moderations > (model) moderation > (schema) > (property) categories > (property) self-harm/intent>)
boolean sexual
Content meant to arouse sexual excitement, such as the description of sexual activity, or that promotes sexual services (excluding sex education and wellness).
[](<#(resource) moderations > (model) moderation > (schema) > (property) categories > (property) sexual>)
boolean sexualMinors
Sexual content that includes an individual who is under 18 years old.
[](<#(resource) moderations > (model) moderation > (schema) > (property) categories > (property) sexual/minors>)
boolean violence
Content that depicts death, violence, or physical injury.
[](<#(resource) moderations > (model) moderation > (schema) > (property) categories > (property) violence>)
boolean violenceGraphic
Content that depicts death, violence, or physical injury in graphic detail.
[](<#(resource) moderations > (model) moderation > (schema) > (property) categories > (property) violence/graphic>)
[](<#(resource) moderations > (model) moderation > (schema) > (property) categories>)
CategoryAppliedInputTypes categoryAppliedInputTypes
A list of the categories along with the input type(s) that the score applies to.
List\<Harassment\> harassment
The applied input type(s) for the category ‘harassment’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) harassment>)
List\<HarassmentThreatening\> harassmentThreatening
The applied input type(s) for the category ‘harassment/threatening’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) harassment/threatening>)
List\<Hate\> hate
The applied input type(s) for the category ‘hate’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) hate>)
List\<HateThreatening\> hateThreatening
The applied input type(s) for the category ‘hate/threatening’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) hate/threatening>)
List\<Illicit\> illicit
The applied input type(s) for the category ‘illicit’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) illicit>)
List\<IllicitViolent\> illicitViolent
The applied input type(s) for the category ‘illicit/violent’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) illicit/violent>)
List\<SelfHarm\> selfHarm
The applied input type(s) for the category ‘self-harm’.
One of the following:
TEXT("text")
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) self-harm > (items) > (member) 0>)
IMAGE("image")
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) self-harm > (items) > (member) 1>)
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) self-harm>)
List\<SelfHarmInstruction\> selfHarmInstructions
The applied input type(s) for the category ‘self-harm/instructions’.
One of the following:
TEXT("text")
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) self-harm/instructions > (items) > (member) 0>)
IMAGE("image")
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) self-harm/instructions > (items) > (member) 1>)
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) self-harm/instructions>)
List\<SelfHarmIntent\> selfHarmIntent
The applied input type(s) for the category ‘self-harm/intent’.
One of the following:
TEXT("text")
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) self-harm/intent > (items) > (member) 0>)
IMAGE("image")
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) self-harm/intent > (items) > (member) 1>)
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) self-harm/intent>)
List\<Sexual\> sexual
The applied input type(s) for the category ‘sexual’.
One of the following:
TEXT("text")
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) sexual > (items) > (member) 0>)
IMAGE("image")
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) sexual > (items) > (member) 1>)
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) sexual>)
List\<SexualMinor\> sexualMinors
The applied input type(s) for the category ‘sexual/minors’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) sexual/minors>)
List\<Violence\> violence
The applied input type(s) for the category ‘violence’.
One of the following:
TEXT("text")
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) violence > (items) > (member) 0>)
IMAGE("image")
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) violence > (items) > (member) 1>)
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) violence>)
List\<ViolenceGraphic\> violenceGraphic
The applied input type(s) for the category ‘violence/graphic’.
One of the following:
TEXT("text")
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) violence/graphic > (items) > (member) 0>)
IMAGE("image")
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) violence/graphic > (items) > (member) 1>)
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types > (property) violence/graphic>)
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_applied_input_types>)
CategoryScores categoryScores
A list of the categories along with their scores as predicted by model.
double harassment
The score for the category ‘harassment’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) harassment>)
double harassmentThreatening
The score for the category ‘harassment/threatening’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) harassment/threatening>)
double hate
The score for the category ‘hate’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) hate>)
double hateThreatening
The score for the category ‘hate/threatening’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) hate/threatening>)
double illicit
The score for the category ‘illicit’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) illicit>)
double illicitViolent
The score for the category ‘illicit/violent’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) illicit/violent>)
double selfHarm
The score for the category ‘self-harm’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) self-harm>)
double selfHarmInstructions
The score for the category ‘self-harm/instructions’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) self-harm/instructions>)
double selfHarmIntent
The score for the category ‘self-harm/intent’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) self-harm/intent>)
double sexual
The score for the category ‘sexual’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) sexual>)
double sexualMinors
The score for the category ‘sexual/minors’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) sexual/minors>)
double violence
The score for the category ‘violence’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) violence>)
double violenceGraphic
The score for the category ‘violence/graphic’.
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores > (property) violence/graphic>)
[](<#(resource) moderations > (model) moderation > (schema) > (property) category_scores>)
boolean flagged
Whether any of the below categories are flagged.
[](<#(resource) moderations > (model) moderation > (schema) > (property) flagged>)
[](<#(resource) moderations > (model) moderation > (schema)>)
class ModerationImageUrlInput:
An object describing an image to classify.
ImageUrl imageUrl
Contains either an image URL or a data URL for a base64 encoded image.
String url
Either a URL of the image or the base64 encoded image data.
formaturi
[](<#(resource) moderations > (model) moderation_image_url_input > (schema) > (property) image_url > (property) url>)
[](<#(resource) moderations > (model) moderation_image_url_input > (schema) > (property) image_url>)
JsonValue; type "image\_url"constant"image\_url"constant
Always `image\_url`.
[](<#(resource) moderations > (model) moderation_image_url_input > (schema) > (property) type>)
[](<#(resource) moderations > (model) moderation_image_url_input > (schema)>)
enum ModerationModel:
OMNI\_MODERATION\_LATEST("omni-moderation-latest")
[](<#(resource) moderations > (model) moderation_model > (schema) > (member) 0>)
OMNI\_MODERATION\_2024\_09\_26("omni-moderation-2024-09-26")
[](<#(resource) moderations > (model) moderation_model > (schema) > (member) 1>)
TEXT\_MODERATION\_LATEST("text-moderation-latest")
[](<#(resource) moderations > (model) moderation_model > (schema) > (member) 2>)
TEXT\_MODERATION\_STABLE("text-moderation-stable")
[](<#(resource) moderations > (model) moderation_model > (schema) > (member) 3>)
[](<#(resource) moderations > (model) moderation_model > (schema)>)
class ModerationMultiModalInput: A class that can be one of several variants.union
An object describing an image to classify.
class ModerationImageUrlInput:
An object describing an image to classify.
ImageUrl imageUrl
Contains either an image URL or a data URL for a base64 encoded image.
String url
Either a URL of the image or the base64 encoded image data.
formaturi
[](<#(resource) moderations > (model) moderation_image_url_input > (schema) > (property) image_url > (property) url>)
[](<#(resource) moderations > (model) moderation_image_url_input > (schema) > (property) image_url>)
JsonValue; type "image\_url"constant"image\_url"constant
Always `image\_url`.
[](<#(resource) moderations > (model) moderation_image_url_input > (schema) > (property) type>)
[](<#(resource) moderations > (model) moderation_image_url_input > (schema)>)
class ModerationTextInput:
An object describing text to classify.
String text
A string of text to classify.
[](<#(resource) moderations > (model) moderation_text_input > (schema) > (property) text>)
JsonValue; type "text"constant"text"constant
Always `text`.
[](<#(resource) moderations > (model) moderation_text_input > (schema) > (property) type>)
[](<#(resource) moderations > (model) moderation_text_input > (schema)>)
[](<#(resource) moderations > (model) moderation_multi_modal_input > (schema)>)
class ModerationTextInput:
An object describing text to classify.
String text
A string of text to classify.
[](<#(resource) moderations > (model) moderation_text_input > (schema) > (property) text>)
JsonValue; type "text"constant"text"constant
Always `text`.
[](<#(resource) moderations > (model) moderation_text_input > (schema) > (property) type>)
[](<#(resource) moderations > (model) moderation_text_input > (schema)>)