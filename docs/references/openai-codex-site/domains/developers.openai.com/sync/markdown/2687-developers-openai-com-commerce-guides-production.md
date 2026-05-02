In production – Agentic Commerce | OpenAI Developers
Primary navigation
Search docs
### Suggested
responses createreasoning\_effortrealtimeprompt caching
Apps SDK Commerce
* [ Home ](/commerce)
### Guides
* [ Get started ](/commerce/guides/get-started)
* [ Best practices ](/commerce/guides/best-practices)
### File Upload
* [ Overview ](/commerce/specs/file-upload/overview)
* [ Products ](/commerce/specs/file-upload/products)
### API
* [ Overview ](/commerce/specs/api/overview)
* [ Feeds ](/commerce/specs/api/feeds)
* [ Products ](/commerce/specs/api/products)
* [ Promotions ](/commerce/specs/api/promotions)
[API Dashboard](https://platform.openai.com/login)
Copy Page
Building with the Agentic Commerce Protocol is open to all. Instant Checkout
in ChatGPT is currently available to approved partners. To apply to
participate in Instant Checkout, fill out this form [here](https://chatgpt.com/merchants).
## Testing and launch certification
Before going live, complete and document the following tests in a sandbox environment.
Each item should be demonstrated end-to-end with request/response logs.
### Session creation and address handling
* **Create a checkout session with and without a shipping address.**
* Verify that shipping options and tax totals are returned once a valid address is provided.
* Confirm `API-Version` header is present and matches a supported version.
### Shipping option updates
* **Update the selected shipping option.**
* Ensure order totals are recomputed correctly when the option changes.
### Payment tokenization
* **Create a delegated payment token.**
* Send a `POST /agentic\_commerce/delegate\_payment` request with a valid `payment\_method` object, `allowance`, `billing\_address`, `risk\_signals`, and `metadata`.
* Include all required headers.
* Verify canonical JSON serialization and correct detached signature generation.
### Order completion
* **Complete the order with a tokenized payment.**
* Confirm the response contains the final order object in the `completed` state.
* Validate returned fields and ensure `HTTP 201 Created` status.
### Order updates
* **Emit order events.**
* Verify that both `order\_created` and subsequent `order\_updated` webhooks are sent with a valid HMAC signature.
### Error scenarios
* **Demonstrate recoverable error handling.**
* Trigger and log each error condition with appropriate HTTP status:
* `missing` (e.g., required field omitted → `invalid\_request / 400`)
* `out\_of\_stock` (simulate inventory failure)
* `payment\_declined` (simulate issuer decline)
### Idempotency
* **Verify idempotency safety.**
* Repeat create and complete calls using the same Idempotency-Key to confirm:
* Safe duplicate requests return the same result.
* Parameter mismatches return `idempotency\_conflict with HTTP 409`.
### Documentation and links
* **Check legal and UX links.**
* Ensure Terms of Service and Privacy Policy links are present and functional.
### IP egress ranges
* **Allowlist OpenAI’s IP addresses**
* OpenAI will call your action from an IP address from one of the [CIDR blocks](https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing) listed in [chatgpt-connectors.json](https://openai.com/chatgpt-connectors.json).
## Security and compliance
Security is a top priority for the Agentic Commerce Protocol and Instant Checkout. Our [security practices](https://www.openai.com/security) and [trust and compliance portal](https://trust.openai.com/) provide our most comprehensive and up-to-date documentation. For reference, here is our [Privacy Policy](https://openai.com/privacy/) and [Terms of Use](https://openai.com/api/policies/terms/).
**TLS and HTTPS**
All traffic to you must use TLS 1.2 or later on port 443 with a valid public certificate.
**PCI Scope**
The Product Feed Spec and Agentic Checkout Spec are deliberately kept out of PCI scope and do not transmit cardholder data. Using your PSP’s implementation of the Delegated Payment Spec may avoid any change in your PCI scope. However, using either your PSP’s forwarding APIs or integrating directly with OpenAI’s Delegated Payment endpoints involves handling cardholder data (CHD) and will likely be in PCI scope. We intend to migrate entirely to using network tokens as they become supported while ensuring backwards compatibility for ineligible cards.
Directly integrating with the Delegated Payment Spec involves directly handling cardholder data (CHD) and may affect your PCI scope. Check with your PSP and consult with your Qualified Security Assessor (QSA) or other PCI compliance advisor to determine the impact on your specific PCI DSS obligations. OpenAI may require your attestation of compliance (AOC) before enabling production access.
## FAQs
**Who is the merchant of record in an agentic checkout flow?**
The merchant actually selling goods and taking payment directly from the customer is. OpenAI and other trusted payment service providers are not the merchant of record. Customers will see the Merchant’s name on their credit card statement, as if they bought directly from the merchant website.
**Who manages chargebacks and refunds?**
The merchant does. Your platform is responsible for handling refunds and chargebacks, as you accepted the payment directly from the customer as the merchant of record.
Use the `ORDER\_UPDATE` webhook to notify ChatGPT (or any integrated partner) when a refund or chargeback status changes so order state stays synchronized.
**Do we need to support multiple shipments?**
Today, the protocol models a single shipping address and one selected shipping option per checkout session. In the future, the protocol may support multiple shipments.
If your system supports split shipments, consolidate them into a single buyer-visible selection and return aggregate totals for shipping and tax.