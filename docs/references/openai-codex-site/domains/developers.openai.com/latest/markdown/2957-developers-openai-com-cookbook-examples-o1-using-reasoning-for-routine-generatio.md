Using reasoning for routine generation
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
Sep 12, 2024
# Using reasoning for routine generation
[ RZ ](https://www.linkedin.com/in/roy-ziv-a46001149/)
[ Roy Ziv
(OpenAI)
](https://www.linkedin.com/in/roy-ziv-a46001149/)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/o1/Using_reasoning_for_routine_generation.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/o1/Using_reasoning_for_routine_generation.ipynb)
When developing customer service solutions, one of the initial steps involves transforming knowledge base articles into a set of routines that an LLM can comprehend and follow. A routine, in this context, refers to a set of step-by-step instructions designed specifically for the LLM to execute efficiently. Each routine is carefully structured so that a step corresponds to a clear action. Actions can include responding to a user, triggering a function call, or retrieving additional relevant knowledge.
Most internal knowledge base articles are complex and structured for human interpretation. They often include intricate diagrams, multi-step processes, and decision trees that pose challenges for LLM-based solutions to reason through in a meaningful way. By breaking down these documents into routines, each instruction can be simplified and formatted in a way that guides the LLM through a series of small, manageable tasks. This granular approach reduces ambiguity, allowing the LLM to process the information methodically and reducing the risk of hallucination or deviation from the expected path.
Converting these knowledge base articles into routines can be time-consuming and challenging, especially for companies attempting to build an automated pipeline. Each routine must account for various user scenarios, where actions need to be clearly defined. For instance, when a function call is necessary, the routine must specify the exact information to retrieve or the action to execute—whether it’s triggering an API, retrieving external data, or pulling in additional context. While automating this process with traditional GPT-class models can significantly reduce the manual effort involved, it often introduces new challenges. Some challenges include designing robust instructions that are specific enough for the LLM to follow consistently, capturing unique edge cases that may arise during customer interactions, providing high-quality few-shot examples to guide the model’s behavior, and in some cases, fine-tuning the model to achieve more reliable or specialized outcomes.
o1 has demonstrated the capability to efficiently deconstruct these articles and convert them into sets of routines zero-shot, meaning that the LLM can understand and follow the instructions without extensive examples or prior training on similar tasks. This minimizes the prompting effort required, as the routine structure itself provides the necessary guidance for the LLM to complete each step. By breaking down tasks into specific actions and integrating function calls where needed, o1’s approach ensures that even complex workflows can be handled seamlessly by the LLM, leading to more effective and scalable customer service solutions.
## Selecting Knowledge Base Articles
In this example, we will use a set of publicly available Help Center articles from the OpenAI website and convert them into internal routines that an LLM can execute. Besides transforming the policies into routines, we will also have the model generate functions that allow the LLM to perform actions on behalf of the user. This is necessary to allow the LLM to execute the same actions that human agents have, and access additional information that may not be immediately available just from the policy documentation.
We will begin by using the following Help Center articles for conversion into routines:
* [How do I delete my payment method](https://help.openai.com/en/articles/8156070-how-do-i-delete-my-payment-method)
* [How can I get a Business Associate Agreement (BAA) with OpenAI?](https://help.openai.com/en/articles/8660679-how-can-i-get-a-business-associate-agreement-baa-with-openai)
* [How can I set up prepaid billing?](https://help.openai.com/en/articles/8264644-how-can-i-set-up-prepaid-billing)
* [How do I submit a VAT exemption request](https://help.openai.com/en/articles/7232908-how-do-i-submit-a-vat-exemption-request)
```
`from openai import OpenAI
from IPython.display import display, HTML
import pandas as pd
from concurrent.futures import ThreadPoolExecutor
import csv
client = OpenAI()
MODEL = 'o1-preview'`
```
We have our articles stored in an accessible csv. We will take the articles and pass them to o1-preview in parallel and generate the initial routines.
Our instructions for converting the policy to a routine include:
* Converting the policy from an external facing document to an internal SOP routine
* Breaking down the policy in specific actions and sub-actions
* Outlining specific conditions for moving between steps
* Determing where external knowledge/actions may be required, and defining functions that we could use to get that information
```
`articles = []
with open('../data/helpcenter\_articles.csv', mode='r', encoding='utf-8') as file:
reader = csv.DictReader(file)
for row in reader:
articles.append({
"policy": row["policy"],
"content": row["content"]
})`
```
```
`CONVERSION\_PROMPT = """
You are a helpful assistant tasked with taking an external facing help center article and converting it into a internal-facing programmatically executable routine optimized for an LLM.
The LLM using this routine will be tasked with reading the policy, answering incoming questions from customers, and helping drive the case toward resolution.
Please follow these instructions:
1. \*\*Review the customer service policy carefully\*\* to ensure every step is accounted for. It is crucial not to skip any steps or policies.
2. \*\*Organize the instructions into a logical, step-by-step order\*\*, using the specified format.
3. \*\*Use the following format\*\*:
- \*\*Main actions are numbered\*\* (e.g., 1, 2, 3).
- \*\*Sub-actions are lettered\*\* under their relevant main actions (e.g., 1a, 1b).
\*\*Sub-actions should start on new lines\*\*
- \*\*Specify conditions using clear 'if...then...else' statements\*\* (e.g., 'If the product was purchased within 30 days, then...').
- \*\*For instructions that require more information from the customer\*\*, provide polite and professional prompts to ask for additional information.
- \*\*For actions that require data from external systems\*\*, write a step to call a function using backticks for the function name (e.g., `call the check\_delivery\_date function`).
- \*\*If a step requires the customer service agent to take an action\*\* (e.g., process a refund), generate a function call for this action (e.g., `call the process\_refund function`).
- \*\*Define any new functions\*\* by providing a brief description of their purpose and required parameters.
- \*\*If there is an action an assistant can performon behalf of the user\*\*, include a function call for this action (e.g., `call the change\_email\_address function`), and ensure the function is defined with its purpose and required parameters.
- This action may not be explicitly defined in the help center article, but can be done to help the user resolve their inquiry faster
- \*\*The step prior to case resolution should always be to ask if there is anything more you can assist with\*\*.
- \*\*End with a final action for case resolution\*\*: calling the `case\_resolution` function should always be the final step.
4. \*\*Ensure compliance\*\* by making sure all steps adhere to company policies, privacy regulations, and legal requirements.
5. \*\*Handle exceptions or escalations\*\* by specifying steps for scenarios that fall outside the standard policy.
\*\*Important\*\*: If at any point you are uncertain, respond with "I don't know."
Please convert the customer service policy into the formatted routine, ensuring it is easy to follow and execute programmatically.
"""`
```
```
`def generate\_routine(policy):
try:
messages = [
{
"role": "user",
"content": f"""
{CONVERSION\_PROMPT}
POLICY:
{policy}
"""
}
]
response = client.chat.completions.create(
model=MODEL,
messages=messages
)
return response.choices[0].message.content
except Exception as e:
print(f"An error occurred: {e}")`
```
```
`def process\_article(article):
routine = generate\_routine(article['content'])
return {"policy": article['policy'], "content": article['content'], "routine": routine}
with ThreadPoolExecutor() as executor:
results = list(executor.map(process\_article, articles))`
```
We’ll store the results of our routines in a dataframe and print them out so we can get an initial look.
```
`df = pd.DataFrame(results)
# Set display options to show all text in the dataframe cells
pd.set\_option('display.max\_colwidth', None)
# Function to display formatted text in HTML
def display\_formatted\_dataframe(df):
def format\_text(text):
return text.replace('\\n', '\<br\>')
df\_formatted = df.copy()
df\_formatted['content'] = df\_formatted['content'].apply(format\_text)
df\_formatted['routine'] = df\_formatted['routine'].apply(format\_text)
display(HTML(df\_formatted.to\_html(escape=False, justify='left')))
display\_formatted\_dataframe(df)`
```
||policy|content|routine|
|0|Delete Payment Method|How do I delete my payment method?
Updated over a week ago
We keep your payment method on file to cover any outstanding charges on your account. To stop charges to your payment method, please follow the steps below.
## ChatGPT
You can cancel your ChatGPT Plus subscription to stop further charges at any time:
Click on 'My Plan' in the ChatGPT sidebar.
Click on 'Manage my subscription' in the pop-up window.
Select 'Cancel Plan'.
Please note that your cancellation will take effect the day after the next billing date, and you can continue using our services until then. To avoid being charged for your next billing period, please cancel your subscription at least 24 hours before your next billing date.
## API
We'll need to keep a payment method on file to account for any outstanding usage costs. You're welcome to cancel your pay-as-you-go service, by clicking 'Cancel paid account' in your billing overview. After the current month's invoice has been issued, the current card will no longer be charged.
If you'd like to continue using the service, add a new payment method in the billing overview page and select 'Set as default'. You'll then be able to delete the old payment method.
|1. Verify the customer's account.
a. Politely ask the customer for their email address or account ID to locate their account.
b. `call the verify\_customer\_account(email\_or\_account\_id)`.
2. Verify the customer's identity.
a. Politely ask the customer to provide security information to confirm their identity (e.g., the last four digits of the payment method on file).
b. `call the verify\_customer\_identity(account\_id, security\_information)`.
c. If the customer's identity cannot be verified, then:
- Inform the customer that we are unable to proceed without identity verification for security reasons.
- Provide guidance on how they can verify their identity.
- Proceed to step 6.
3. Determine the customer's account type.
a. `call the check\_account\_type(account\_id)`.
4. If the customer is a ChatGPT Plus subscriber, then:
a. Ask the customer if they would like assistance with canceling their ChatGPT Plus subscription.
b. If the customer agrees, then:
- `call the cancel\_subscription(account\_id)`.
- Inform the customer that their subscription has been canceled and the cancellation will take effect the day after the next billing date.
- Remind the customer that they can continue using our services until then.
c. Else:
- Provide the following steps for the customer to cancel their subscription:
- Click on \*\*'My Plan'\*\* in the ChatGPT sidebar.
- Click on \*\*'Manage my subscription'\*\* in the pop-up window.
- Select \*\*'Cancel Plan'\*\*.
- Inform the customer about the cancellation effective date and continued access until then.
- Advise the customer to cancel at least 24 hours before their next billing date to avoid being charged for the next billing period.
5. Else if the customer is an API user, then:
a. Inform the customer that we need to keep a payment method on file to account for any outstanding usage costs.
b. Ask the customer if they would like assistance with canceling their pay-as-you-go service.
c. If the customer agrees, then:
- `call the cancel\_paid\_account(account\_id)`.
- Inform the customer that after the current month's invoice has been issued, the current card will no longer be charged.
d. Else:
- Provide the following steps for the customer to cancel their pay-as-you-go service:
- Go to the \*\*billing overview\*\* page.
- Click on \*\*'Cancel paid account'\*\*.
- Inform the customer that after the current month's invoice has been issued, the current card will no longer be charged.
e. If the customer wants to continue using the service but change the payment method:
- Ask the customer if they would like assistance with adding a new payment method and setting it as default.
- If the customer agrees:
- Politely request the new payment method details.
- `call the add\_payment\_method(account\_id, payment\_details)`.
- `call the set\_default\_payment\_method(account\_id, new\_payment\_method\_id)`.
- `call the delete\_payment\_method(account\_id, old\_payment\_method\_id)`.
- Inform the customer that the old payment method has been deleted and the new one is set as default.
- Else:
- Instruct the customer to add a new payment method in the billing overview page.
- Ask them to select \*\*'Set as default'\*\* for the new payment method.
- Inform them that they can then delete the old payment method.
6. Ask the customer if there is anything else you can assist them with.
7. `call the case\_resolution()`.
---
\*\*Function Definitions:\*\*
- `verify\_customer\_account(email\_or\_account\_id)`: Verifies the customer's account using their email address or account ID.
\*\*Parameters:\*\* `email\_or\_account\_id`
- `verify\_customer\_identity(account\_id, security\_information)`: Confirms the customer's identity using security information.
\*\*Parameters:\*\* `account\_id`, `security\_information`
- `check\_account\_type(account\_id)`: Retrieves the customer's account type (ChatGPT Plus subscriber or API user).
\*\*Parameters:\*\* `account\_id`
- `cancel\_subscription(account\_id)`: Cancels the ChatGPT Plus subscription for the customer.
\*\*Parameters:\*\* `account\_id`
- `cancel\_paid\_account(account\_id)`: Cancels the API pay-as-you-go service for the customer.
\*\*Parameters:\*\* `account\_id`
- `add\_payment\_method(account\_id, payment\_details)`: Adds a new payment method to the customer's account.
\*\*Parameters:\*\* `account\_id`, `payment\_details`
- `set\_default\_payment\_method(account\_id, payment\_method\_id)`: Sets a payment method as the default for the customer.
\*\*Parameters:\*\* `account\_id`, `payment\_method\_id`
- `delete\_payment\_method(account\_id, payment\_method\_id)`: Deletes a payment method from the customer's account.
\*\*Parameters:\*\* `account\_id`, `payment\_method\_id`
- `case\_resolution()`: Resolves the case and marks it as completed.|
|1|Business Associate Agreement|How can I get a Business Associate Agreement (BAA) with OpenAI?
Information about HIPAA compliance for healthcare companies
The Health Insurance Portability and Accountability Act (HIPAA) is a U.S. federal law that requires privacy and security protections for protected health information (PHI). Our API platform can be a great fit for any covered entity or business associate looking to process protected health information, and we’d be happy to assist you in fulfilling your HIPAA compliance. To use our API platform, you’ll first need a BAA with OpenAI.
How do I get started?
If you require a BAA before you can use our API, email us at baa@openai.com with details about your company and use case.
Our team will respond within 1-2 business days. We review each BAA request on a case-by-case basis and may need additional information. The process is usually completed within a few business days.
Can I get a BAA for ChatGPT?
If you're interested in exploring a BAA for ChatGPT Enterprise, please contact sales.
What happens if I’m not approved?
We are able to approve most customers that request BAAs, but occasionally a use case doesn’t pass our team's evaluation. In that case, we’ll give feedback and context as to why that is and give you the opportunity to update your intended use of our API and re-apply.
Are all API services covered by the BAA?
No, only endpoints that are eligible for zero retention are covered by the BAA. You can see a list of those endpoints.
Is an enterprise agreement requirement to sign a BAA?
No, an enterprise agreement is not required to sign a BAA.
|1. Thank the customer and ask for clarification:
a. "Thank you for reaching out! Could you please specify whether you require a Business Associate Agreement (BAA) for using our API or for ChatGPT Enterprise?"
2. If the customer requires a BAA for the API, then:
a. Inform the customer: "To obtain a BAA for our API, please email baa@openai.com with details about your company and use case."
b. Inform the customer: "Our team will respond within 1-2 business days."
c. Inform the customer: "We review each BAA request on a case-by-case basis and may need additional information."
d. Inform the customer: "The process is usually completed within a few business days."
e. Inform the customer: "Please note that only endpoints eligible for zero data retention are covered by the BAA."
i. Call the `provide\_list\_of\_zero\_retention\_endpoints` function.
f. Inform the customer: "An enterprise agreement is not required to sign a BAA."
3. If the customer requires a BAA for ChatGPT Enterprise, then:
a. Inform the customer: "To explore a BAA for ChatGPT Enterprise, please contact our sales team."
i. Call the `provide\_sales\_contact\_information` function.
4. If the customer is not approved, then:
a. Inform the customer: "We are able to approve most customers that request BAAs, but occasionally a use case doesn't pass our team's evaluation."
b. Inform the customer: "In that case, we'll provide feedback and context as to why and give you the opportunity to update your intended use of our API and re-apply."
5. Ask the customer if there is anything else you can assist with:
a. "Is there anything else I can assist you with today?"
6. Call the `case\_resolution` function.
---
\*\*Function Definitions:\*\*
- `provide\_list\_of\_zero\_retention\_endpoints`:
- \*\*Purpose\*\*: Provides the customer with a list of API endpoints that are eligible for zero data retention under the BAA.
- \*\*Parameters\*\*: None.
- `provide\_sales\_contact\_information`:
- \*\*Purpose\*\*: Provides the customer with contact information to reach our sales team for ChatGPT Enterprise inquiries.
- \*\*Parameters\*\*: None.
- `case\_resolution`:
- \*\*Purpose\*\*: Finalizes the case and marks it as resolved.
- \*\*Parameters\*\*: None.|
|2|Set up prepaid billing|How can I set up prepaid billing?
How it works
Prepaid billing allows API users to pre-purchase usage. The credits you've bought will be applied to your monthly invoice. This means that any API usage you incur will first be deducted from the prepaid credits. If your usage exceeds the credits you've purchased, you'll then be billed for the additional amount.
Prepaid billing helps developers know what they are committing to upfront which can provide more predictability for budgeting and spend management.
Setting up prepaid billing
If you're on a Monthly Billing plan, you may also choose to switch to prepaid billing and purchase credits upfront for API usage.
- Go to your billing overview in your account settings
- Click "Start payment plan" (you may see variations like "Buy credits")
Note: If you previously had an arrears billing plan, you'll need to cancel this existing payment plan first.
- Choose the initial amount of credits you want to purchase. The minimum purchase is $5. The maximum purchase will be based on your trust tier.
- Confirm and purchase your initial amount of credits.
- Use auto-recharge to set an automatic recharge amount, which is the amount of credits that will be added to your account when your balance falls below a set threshold.
Please note that any purchased credits will expire after 1 year and they are non-refundable.
After you’ve purchased credits, you should be able to start using the API. Note that there may be a couple minutes of delay while our systems update to reflect your credit balance.
Purchasing additional credits
Once you’ve consumed all your credits, your API requests will start returning an error letting you know you’ve hit your billing quota. If you’d like to continue your API usage, you can return to the billing portal and use the “Add to balance” button to purchase additional credits.
Delayed billing
Due to the complexity of our billing and processing systems, there may be delays in our ability to cut off access after you consume all of your credits. This excess usage may appear as a negative credit balance in your billing dashboard, and will be deducted from your next credit purchase.
|1. `call check\_billing\_plan(user\_id)`
- \*\*Function:\*\* `check\_billing\_plan(user\_id)`
- \*\*Purpose:\*\* Retrieves the user's current billing plan (e.g., Monthly Billing, Prepaid Billing, or Arrears Billing).
- \*\*Parameters:\*\*
- `user\_id`: The unique identifier of the user.
2. If the user has an arrears billing plan:
2a. Inform the user: "Please note that since you have an arrears billing plan, you'll need to cancel your existing payment plan before switching to prepaid billing. Would you like assistance with cancelling your current plan?"
2b. If the user agrees, `call cancel\_payment\_plan(user\_id)`
- \*\*Function:\*\* `cancel\_payment\_plan(user\_id)`
- \*\*Purpose:\*\* Cancels the user's current arrears billing plan.
- \*\*Parameters:\*\*
- `user\_id`: The unique identifier of the user.
3. Guide the user to set up prepaid billing:
3a. Instruct the user: "Please go to your billing overview in your account settings."
3b. Instruct the user: "Click on 'Start payment plan' (you may see variations like 'Buy credits')."
3c. Inform the user: "Choose the initial amount of credits you want to purchase. The minimum purchase is $5, and the maximum purchase will be based on your trust tier."
3d. Instruct the user: "Confirm and purchase your initial amount of credits."
3e. Suggest to the user: "You can set up auto-recharge to automatically add credits to your account when your balance falls below a set threshold."
4. Inform the user about credit expiration and refund policy:
4a. Inform the user: "Please note that any purchased credits will expire after 1 year and they are non-refundable."
5. Inform the user about activation time:
5a. Inform the user: "After you’ve purchased credits, you should be able to start using the API. Note that there may be a couple of minutes delay while our systems update to reflect your credit balance."
6. Ask the user: "Is there anything else I can assist you with today?"
7. If the user has no further questions, `call case\_resolution()`
- \*\*Function:\*\* `case\_resolution()`
- \*\*Purpose:\*\* Marks the case as resolved and ends the interaction.|
|3|VAT Exemption request|How do I submit a VAT exemption request?
Updated over a week ago
If you are eligible for a tax exemption and would like to apply it to your account, please follow these steps:
Depending on the state and if required:
1. Obtain a current tax exemption certificate from your state or local government and/or your fully completed non-profit sales tax exemption forms. The certificate/forms should include:
Your name and address
Tax exemption number
Signatures and dates, etc.
2. Send us a copy of your certificate using the chat widget in the bottom-right corner. Please include your organization id, invoice number or email address associated with the account, so we can easily find you. Instructions on how to find these items are below.
3. Once we receive your certificate/form, we will review it and apply the tax exemption to your account. You will receive a confirmation email once the exemption has been applied.
Please note that the tax exemption will only apply to future purchases. We cannot apply VAT exemptions retroactively.
Where to find your account data
In order to submit a Value Added Tax ('VAT') exemption request you will need the following from your organization Billing preferences:
1. Company name
2. Billing email
3. Primary business address
4. Business tax ID|1. Greet the customer and acknowledge their request.
1a. Say: "Certainly, I'd be happy to assist you with submitting a VAT exemption request."
2. Request necessary information from the customer.
2a. Politely ask for the following:
- "Could you please provide your \*\*company name\*\*?"
- "May I have the \*\*billing email\*\* associated with your account?"
- "Could you provide your \*\*primary business address\*\*?"
- "Please provide your \*\*business tax ID\*\*."
2b. If the customer needs assistance finding this information, provide guidance.
- Say: "You can find this information in your organization's billing preferences."
3. Request a copy of their current tax exemption certificate.
3a. Say: "Could you please send us a copy of your current \*\*tax exemption certificate\*\*? It should include your name and address, tax exemption number, signatures, and dates."
4. Instruct the customer on how to send the certificate.
4a. Say: "You can send us a copy of your certificate using the \*\*chat widget in the bottom-right corner\*\*."
4b. Say: "Please include your \*\*organization ID\*\*, \*\*invoice number\*\*, or the \*\*email address associated with your account\*\* so we can easily find you."
5. Once the customer has provided the required information and certificate:
5a. `call the process\_vat\_exemption\_request function` with parameters: company\_name, billing\_email, business\_address, business\_tax\_id, tax\_exemption\_certificate, account\_identifier.
5b. \*\*Define `process\_vat\_exemption\_request function`\*\*:
- \*\*Purpose\*\*: To review and apply the VAT exemption to the customer's account based on the provided information and certificate.
- \*\*Parameters\*\*:
- company\_name
- billing\_email
- business\_address
- business\_tax\_id
- tax\_exemption\_certificate
- account\_identifier (organization ID/invoice number/email address)
6. Inform the customer:
6a. Say: "Thank you. Once we have reviewed your certificate, we will apply the VAT exemption to your account."
6b. Say: "You will receive a confirmation email once the exemption has been applied."
6c. Say: "Please note that the tax exemption will only apply to future purchases. We cannot apply VAT exemptions retroactively."
6d. If the customer requests to apply the VAT exemption to past purchases:
- Say: "I apologize, but we're unable to apply VAT exemptions to past purchases. The tax exemption will only apply to future purchases once it's applied to your account."
7. Ask if there is anything more you can assist with.
7a. Say: "Is there anything else I can assist you with today?"
8. `call the case\_resolution function`|
## Results
Upon reviewing the generated routines, we can derive several insights:
* Sample Responses: The model effectively generates sample responses that the LLM can utilize when executing the policy (e.g., “Instruct the user: ‘Confirm and purchase your initial amount of credits.’”).
* Discrete Steps: The model excels at decomposing the problem into discrete actions that the LLM needs to execute. Each instruction is clearly defined and easy to interpret.
* Function Definitions: The routines’ outputs include clearly defined functions to retrieve external information or trigger actions (e.g., `review\_and\_apply\_tax\_exemption`, `get\_billing\_plan`, `update\_payment\_method`).
* This is crucial for any successful routine because LLMs often need to interact with external systems. Leveraging function calls is an effective way to interact with those systems and execute actions.
* IFTTT Logic: The model effectively employs IFTTT (If This, Then That) logic, which is ideal for an LLM (e.g., “If the customer requests assistance, proceed to step 3f.”).
* This type of translation becomes extremely valuable when the original knowledge base articles contain complex workflows and diagrams. Such complexity may not be easily understood by humans, and even less so by an LLM. IFTTT logic is easily comprehensible and works well for customer service solution
## Where do we go from here?
These routines can now be integrated into agentic systems to address specific customer issues. When a customer requests assistance with tasks such as setting up prepaid billing, we can employ a classifier to determine the appropriate routine to retrieve and provide that to the LLM to interact directly with the customer. Beyond providing instructions to the user on *how* to set up billing, the system can also perform the action on their behalf.
Before deploying these routines into production, we should develop comprehensive evaluations to test and validate the quality of the model’s responses. This process may necessitate adjusting the routines to ensure compliance and effectiveness.