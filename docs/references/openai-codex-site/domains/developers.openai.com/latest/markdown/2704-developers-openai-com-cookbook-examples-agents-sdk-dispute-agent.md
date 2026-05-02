Automating Dispute Management with Agents SDK and Stripe API
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
Mar 17, 2025
# Automating Dispute Management with Agents SDK and Stripe API
[ DB ](https://www.linkedin.com/in/dan-bell-b69721b1/)
[ Dan Bell ](https://www.linkedin.com/in/dan-bell-b69721b1/)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/agents_sdk/dispute_agent.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/agents_sdk/dispute_agent.ipynb)
We recently announced our new open-source **Agents SDK**, designed to help you build agentic AI applications using a lightweight, easy-to-use package with minimal abstractions.
This cookbook demonstrates how you can leverage the Agents SDK in combination with Stripe’s API to handle dispute management, a common operational challenge many businesses face. Specifically, we focus on two real-world scenarios:
1. **Company Mistake:**
A scenario where the company clearly made an error, such as failing to fulfill an order, where accepting the dispute the appropriate action.
2. **Customer Dispute (Final Sale):**
A scenario where a customer knowingly disputes a transaction despite receiving the correct item and understanding that the purchase was final sale, requiring further investigation to gather supporting evidence.
To address these scenarios, we’ll introduce three distinct agents:
* **Triage Agent:**
Determines whether to accept or escalate a dispute based on the fulfillment status of the order.
* **Acceptance Agent:**
Handles clear-cut cases by automatically accepting disputes, providing concise reasoning.
* **Investigator Agent:**
Performs thorough investigations into disputes by analyzing communication records and order information to collect essential evidence.
Throughout this cookbook, we’ll guide you step-by-step, illustrating how custom agentic workflows can automate dispute management and support your business operations.
## Prerequisites
Before running this cookbook, you must set up the following accounts and complete a few setup actions. These prerequisites are essential to interact with the APIs used in this project.
#### 1. OpenAI Account
* **Purpose:**
You need an OpenAI account to access language models and use the Agents SDK featured in this cookbook.
* **Action:**
[Sign up for an OpenAI account](https://openai.com) if you don’t already have one. Once you have an account, create an API key by visiting the [OpenAI API Keys page](https://platform.openai.com/api-keys).
#### 2. Stripe Account
* **Purpose:**
A Stripe account is required to simulate payment processing, manage disputes, and interact with the Stripe API as part of our demo workflow.
* **Action:**
Create a free Stripe account by visiting the [Stripe Signup Page](https://dashboard.stripe.com/register).
* **Locate Your API Keys:**
Log in to your Stripe dashboard and navigate to **Developers \> API keys**.
* **Use Test Mode:**
Use your **Test Secret Key** for all development and testing.
#### 3. Create a .env file with your OpenAI API and Stripe API Keys
```
`OPENAI\_API\_KEY=
STRIPE\_SECRET\_KEY=`
```
### Environment Setup
First we will install the necessary dependencies, then import the libraries and write some utility functions that we will use later on.
```
`%pip install python-dotenv --quiet
%pip install openai-agents --quiet
%pip install stripe --quiet
%pip install typing\_extensions --quiet`
```
```
`import os
import logging
import json
from dotenv import load\_dotenv
from agents import Agent, Runner, function\_tool # Only import what you need
import stripe
from typing\_extensions import TypedDict, Any
# Load environment variables from .env file
load\_dotenv()
# Configure logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(\_\_name\_\_)
# Set Stripe API key from environment variables
stripe.api\_key = os.getenv("STRIPE\_SECRET\_KEY")`
```
#### Define Function Tools
This section defines several helper function tools that support the dispute processing workflow.
* `get\_order`, `get\_phone\_logs` and `get\_emails` simulate external data lookups by returning order details and email/phone records based on provided identifiers.
* `retrieve\_payment\_intent` interacts with the Stripe API to fetch payment intent details.
* `close\_dispute` automatically closes a Stripe dispute using the provided dispute ID, ensuring that disputes are properly resolved and logged.
```
`@function\_tool
def get\_phone\_logs(phone\_number: str) -\> list:
"""
Return a list of phone call records for the given phone number.
Each record might include call timestamps, durations, notes,
and an associated order\_id if applicable.
"""
phone\_logs = [
{
"phone\_number": "+15551234567",
"timestamp": "2023-03-14 15:24:00",
"duration\_minutes": 5,
"notes": "Asked about status of order #1121",
"order\_id": 1121
},
{
"phone\_number": "+15551234567",
"timestamp": "2023-02-28 10:10:00",
"duration\_minutes": 7,
"notes": "Requested refund for order #1121, I told him we were unable to refund the order because it was final sale",
"order\_id": 1121
},
{
"phone\_number": "+15559876543",
"timestamp": "2023-01-05 09:00:00",
"duration\_minutes": 2,
"notes": "General inquiry; no specific order mentioned",
"order\_id": None
},
]
return [
log for log in phone\_logs if log["phone\_number"] == phone\_number
]
@function\_tool
def get\_order(order\_id: int) -\> str:
"""
Retrieve an order by ID from a predefined list of orders.
Returns the corresponding order object or 'No order found'.
"""
orders = [
{
"order\_id": 1234,
"fulfillment\_details": "not\_shipped"
},
{
"order\_id": 9101,
"fulfillment\_details": "shipped",
"tracking\_info": {
"carrier": "FedEx",
"tracking\_number": "123456789012"
},
"delivery\_status": "out for delivery"
},
{
"order\_id": 1121,
"fulfillment\_details": "delivered",
"customer\_id": "cus\_PZ1234567890",
"customer\_phone": "+15551234567",
"order\_date": "2023-01-01",
"customer\_email": "customer1@example.com",
"tracking\_info": {
"carrier": "UPS",
"tracking\_number": "1Z999AA10123456784",
"delivery\_status": "delivered"
},
"shipping\_address": {
"zip": "10001"
},
"tos\_acceptance": {
"date": "2023-01-01",
"ip": "192.168.1.1"
}
}
]
for order in orders:
if order["order\_id"] == order\_id:
return order
return "No order found"
@function\_tool
def get\_emails(email: str) -\> list:
"""
Return a list of email records for the given email address.
"""
emails = [
{
"email": "customer1@example.com",
"subject": "Order #1121",
"body": "Hey, I know you don't accept refunds but the sneakers don't fit and I'd like a refund"
},
{
"email": "customer2@example.com",
"subject": "Inquiry about product availability",
"body": "Hello, I wanted to check if the new model of the smartphone is available in stock."
},
{
"email": "customer3@example.com",
"subject": "Feedback on recent purchase",
"body": "Hi, I recently purchased a laptop from your store and I am very satisfied with the product. Keep up the good work!"
}
]
return [email\_data for email\_data in emails if email\_data["email"] == email]
@function\_tool
async def retrieve\_payment\_intent(payment\_intent\_id: str) -\> dict:
"""
Retrieve a Stripe payment intent by ID.
Returns the payment intent object on success or an empty dictionary on failure.
"""
try:
return stripe.PaymentIntent.retrieve(payment\_intent\_id)
except stripe.error.StripeError as e:
logger.error(f"Stripe error occurred while retrieving payment intent: {e}")
return {}
@function\_tool
async def close\_dispute(dispute\_id: str) -\> dict:
"""
Close a Stripe dispute by ID.
Returns the dispute object on success or an empty dictionary on failure.
"""
try:
return stripe.Dispute.close(dispute\_id)
except stripe.error.StripeError as e:
logger.error(f"Stripe error occurred while closing dispute: {e}")
return {}`
```
### Define the Agents
* The **Dispute Intake Agent (investigator\_agent)** is responsible for investigating disputes by gathering all relevant evidence and providing a report.
* The **Accept a Dispute Agent (accept\_dispute\_agent)** handles disputes that are determined to be valid by automatically closing them and providing a brief explanation for the decision.
* The **Triage Agent (triage\_agent)** serves as the decision-maker by extracting the order ID from the payment intent’s metadata, retrieving detailed order information, and then deciding whether to escalate the dispute to the investigator or to pass it to the accept dispute agent.
* Together, these agents form a modular workflow that automates and streamlines the dispute resolution process by delegating specific tasks to specialized agents.
```
`investigator\_agent = Agent(
name="Dispute Intake Agent",
instructions=(
"As a dispute investigator, please compile the following details in your final output:\\n\\n"
"Dispute Details:\\n"
"- Dispute ID\\n"
"- Amount\\n"
"- Reason for Dispute\\n"
"- Card Brand\\n\\n"
"Payment & Order Details:\\n"
"- Fulfillment status of the order\\n"
"- Shipping carrier and tracking number\\n"
"- Confirmation of TOS acceptance\\n\\n"
"Email and Phone Records:\\n"
"- Any relevant email threads (include the full body text)\\n"
"- Any relevant phone logs\\n"
),
model="o3-mini",
tools=[get\_emails, get\_phone\_logs]
)
accept\_dispute\_agent = Agent(
name="Accept Dispute Agent",
instructions=(
"You are an agent responsible for accepting disputes. Please do the following:\\n"
"1. Use the provided dispute ID to close the dispute.\\n"
"2. Provide a short explanation of why the dispute is being accepted.\\n"
"3. Reference any relevant order details (e.g., unfulfilled order, etc.) retrieved from the database.\\n\\n"
"Then, produce your final output in this exact format:\\n\\n"
"Dispute Details:\\n"
"- Dispute ID\\n"
"- Amount\\n"
"- Reason for Dispute\\n\\n"
"Order Details:\\n"
"- Fulfillment status of the order\\n\\n"
"Reasoning for closing the dispute\\n"
),
model="gpt-4o",
tools=[close\_dispute]
)
triage\_agent = Agent(
name="Triage Agent",
instructions=(
"Please do the following:\\n"
"1. Find the order ID from the payment intent's metadata.\\n"
"2. Retrieve detailed information about the order (e.g., shipping status).\\n"
"3. If the order has shipped, escalate this dispute to the investigator agent.\\n"
"4. If the order has not shipped, accept the dispute.\\n"
),
model="gpt-4o",
tools=[retrieve\_payment\_intent, get\_order],
handoffs=[accept\_dispute\_agent, investigator\_agent],
)`
```
#### Retrieve the Dispute and Initiate the Agentic Workflow
This function retrieves the dispute details from Stripe using the provided `payment\_intent\_id` and initiates the dispute-handling workflow by passing the retrieved dispute information to the specified `triage\_agent`.
```
`async def process\_dispute(payment\_intent\_id, triage\_agent):
"""Retrieve and process dispute data for a given PaymentIntent."""
disputes\_list = stripe.Dispute.list(payment\_intent=payment\_intent\_id)
if not disputes\_list.data:
logger.warning("No dispute data found for PaymentIntent: %s", payment\_intent\_id)
return None
dispute\_data = disputes\_list.data[0]
relevant\_data = {
"dispute\_id": dispute\_data.get("id"),
"amount": dispute\_data.get("amount"),
"due\_by": dispute\_data.get("evidence\_details", {}).get("due\_by"),
"payment\_intent": dispute\_data.get("payment\_intent"),
"reason": dispute\_data.get("reason"),
"status": dispute\_data.get("status"),
"card\_brand": dispute\_data.get("payment\_method\_details", {}).get("card", {}).get("brand")
}
event\_str = json.dumps(relevant\_data)
# Pass the dispute data to the triage agent
result = await Runner.run(triage\_agent, input=event\_str)
logger.info("WORKFLOW RESULT: %s", result.final\_output)
return relevant\_data, result.final\_output`
```
#### Scenario 1: Company Mistake (Product Not Received)
This scenario represents a situation where the company has clearly made an error—for instance, failing to fulfill or ship an order. In such cases, it may be appropriate to accept the dispute rather than contest it.
```
`payment = stripe.PaymentIntent.create(
amount=2000,
currency="usd",
payment\_method = "pm\_card\_createDisputeProductNotReceived",
confirm=True,
metadata={"order\_id": "1234"},
off\_session=True,
automatic\_payment\_methods={"enabled": True},
)
relevant\_data, triage\_result = await process\_dispute(payment.id, triage\_agent)`
```
#### Scenario 2: Customer Dispute (Final Sale)
This scenario describes a situation where a customer intentionally disputes a transaction, despite having received the correct product and being fully aware that the purchase was clearly marked as a “final sale” (no refunds or returns). Such disputes typically require further investigation to collect evidence in order to effectively contest the dispute.
```
`payment = stripe.PaymentIntent.create(
amount=2000,
currency="usd",
payment\_method = "pm\_card\_createDispute",
confirm=True,
metadata={"order\_id": "1121"},
off\_session=True,
automatic\_payment\_methods={"enabled": True},
)
relevant\_data, triage\_result = await process\_dispute(payment.id, triage\_agent)`
```
## Conclusion
In this Jupyter Notebook, we explored the capabilities of the **OpenAI Agents SDK**, demonstrating how to efficiently create agent-based AI applications using a simple, Python-first approach. Specifically, we showcased the following SDK features:
* **Agent Loop**: Manages tool calls, communicates results to the LLM, and loops until completion.
* **Handoffs**: Enables coordination and delegation tasks between multiple specialized agents.
* **Function Tools**: Converts Python functions into tools with automatic schema generation and validation.
Additionally, the SDK offers built-in **Tracing**, accessible via the OpenAI dashboard. Tracing helps you visualize, debug, and monitor your agent workflows during both development and production phases. It also integrates smoothly with OpenAI’s evaluation, fine-tuning, and distillation tools.
While we didn’t cover it directly in this notebook, implementing **Guardrails** is strongly recommended for production applications to validate inputs and proactively detect errors.
Overall, this notebook lays a clear foundation for further exploration, emphasizing how the OpenAI Agents SDK facilitates intuitive and effective agent-driven workflows.