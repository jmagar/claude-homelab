Key concepts – Agentic Commerce | OpenAI Developers
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
Supporting Instant Checkout in ChatGPT requires a merchant to implement three flows.
## Sharing a product feed
The [Product feeds docs](/commerce/specs) define how merchants share structured product data with OpenAI so ChatGPT can accurately surface their products in search and shopping experiences.
* Merchants provide a secure, regularly refreshed feed (CSV or JSON) containing key details such as identifiers, descriptions, pricing, inventory, media, and fulfillment options.
* Required fields ensure correct display of price and availability, while recommended attributes—like rich media, reviews, and performance signals—improve ranking, relevance, and user trust.
* Integration involves sending an initial sample feed for validation, and daily snapshots.
## Handling orders and checkout
The [Agentic Checkout Spec](/commerce/specs/checkout) enables ChatGPT to act as the customer’s AI agent and renders a checkout experience embedded in ChatGPT’s UI.
* ChatGPT collects buyer, fulfillment, and payment information from the user.
* ChatGPT calls the merchant’s Agentic Commerce Protocol endpoints to create or update a checkout session, and securely share information.
* The merchant performs validation, determines fulfillment options, calculates and charges sales tax, , analyzes payment and risk signals on their own stack, and charges the payment method with their existing payment processor. The merchant accepts or declines the order, and returns this state to ChatGPT.
* ChatGPT reflects states and shows the order confirmation (or decline) message to the user.
The checkout session is rendered in the OpenAI UI, but the actual checkout
state and payment processing occurs on the merchant’s systems. OpenAI sends
the merchant information and the merchant determines whether to accept or
decline the order, charge the payment method, and confirm the order – all on
their own systems.
## Handling payments
The [Delegated Payment Spec](/commerce/specs/payment) allows OpenAI to securely share payment details with the merchant or its designated payment service provider (PSP). The merchant and its PSP then handle the transaction and process the related payment in the same manner as any other order and payment they collect.
* OpenAI prepares a one-time delegated payment request and sets a maximum chargeable amount and expiry based on what the user has selected to buy in ChatGPT’s UI.
* This payload is passed to the merchant’s trusted PSP who will handle the transaction.
* The PSP responds with a payment token that OpenAI passes on to the merchant to complete the payment.
* [Stripe’s Shared Payment Token](https://docs.stripe.com/agentic-commerce) is the first Delegated Payment Spec-compatible implementation, with more PSPs coming soon.
* Eligible cards will be upgraded using network tokenization.
* If you’re a PSP or a PCI DSS level 1 merchant with your own vault, [learn how to build a direct integration with OpenAI](/commerce/specs/payment).
OpenAI is not the merchant of record in the Agentic Commerce Protocol.
Merchants are expected to bring their own PSP and handle payments just as they
do for accepting any other digital payment. The OpenAI Delegated Payment Spec
ensures that restrictions are placed on how these payment credentials are used
to secure user transactions.
## End-to-end flow diagram
This diagram illustrates the end-to-end data flow of the Agentic Commerce Protocol.