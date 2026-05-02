Monetization – Apps SDK | OpenAI Developers
Primary navigation
Search docs
### Suggested
responses createreasoning\_effortrealtimeprompt caching
Apps SDK Commerce
* [ Home ](/apps-sdk)
* [ Quickstart ](/apps-sdk/quickstart)
### Core Concepts
* [ MCP Apps in ChatGPT ](/apps-sdk/mcp-apps-in-chatgpt)
* [ MCP Server ](/apps-sdk/concepts/mcp-server)
* [ UX principles ](/apps-sdk/concepts/ux-principles)
* [ UI guidelines ](/apps-sdk/concepts/ui-guidelines)
### Plan
* [ Research use cases ](/apps-sdk/plan/use-case)
* [ Define tools ](/apps-sdk/plan/tools)
* [ Design components ](/apps-sdk/plan/components)
### Build
* [ Set up your server ](/apps-sdk/build/mcp-server)
* [ Build your ChatGPT UI ](/apps-sdk/build/chatgpt-ui)
* [ Authenticate users ](/apps-sdk/build/auth)
* [ Manage state ](/apps-sdk/build/state-management)
* [ Monetize your app ](/apps-sdk/build/monetization)
* [ Examples ](/apps-sdk/build/examples)
### Deploy
* [ Deploy your app ](/apps-sdk/deploy)
* [ Connect from ChatGPT ](/apps-sdk/deploy/connect-chatgpt)
* [ Test your integration ](/apps-sdk/deploy/testing)
* [ Submit your app ](/apps-sdk/deploy/submission)
### Conversion apps
* [ Restaurant reservation spec ](/apps-sdk/guides/restaurant-reservation-conversion-spec)
* [ Product checkout spec ](/apps-sdk/guides/product-checkout-conversion-spec)
### Guides
* [ Optimize Metadata ](/apps-sdk/guides/optimize-metadata)
* [ Security & Privacy ](/apps-sdk/guides/security-privacy)
* [ Troubleshooting ](/apps-sdk/deploy/troubleshooting)
### Resources
* [ Changelog ](/apps-sdk/changelog)
* [ App submission guidelines ](/apps-sdk/app-submission-guidelines)
* [ Reference ](/apps-sdk/reference)
[API Dashboard](https://platform.openai.com/login)
Copy Page
## Overview
When building a ChatGPT app, developers are responsible for choosing how to monetize their experience. Today, the **recommended** and **generally available** approach is to use **external checkout**, where users complete purchases on the developer’s own domain. While current approval is limited to apps for physical goods purchases, we are actively working to support a wider range of commerce use cases.
We’re also enabling **in-app checkout with ChatGPT payment sheet** for select marketplace partners (beta), with plans to extend access to more marketplaces and physical-goods retailers over time. Until then, we recommend routing purchase flows to your standard external checkout.
## Recommended Monetization Approach
### ✅ External Checkout (recommended)
**External checkout** means directing users from ChatGPT to a **merchant-hosted checkout flow** on your own website or application, where you handle pricing, payments, subscriptions, and fulfillment.
This is the recommended approach for most developers building ChatGPT apps.
#### How it works
1. A user interacts with your app in ChatGPT.
2. Your app presents purchasable items, plans, or services (e.g., “Upgrade,” “Buy now,” “Subscribe”).
3. When the user decides to purchase, your app links or redirects them out of ChatGPT and to your external checkout flow.
4. Payment, billing, taxes, refunds, and compliance are handled entirely on your domain.
5. After purchase, the user can return to ChatGPT with confirmation or unlocked features.
### In-app Checkout with Saved Payment Methods
App developers can build a checkout flow directly in their ChatGPT app that allows customers to use payment methods already saved with the merchant. This flow can only display saved payment methods and cannot collect new payment method credentials from customers.
In this approach, the customer does not need to be redirected to another surface outside ChatGPT to complete the purchase.
#### How it works
1. A user interacts with your app in ChatGPT.
2. Your app presents purchasable items, plans, or services with the relevant totals.
3. Your app displays eligible payment methods that the customer has already saved with you.
4. The customer selects a saved payment method and confirms the purchase in ChatGPT.
5. Your backend processes the purchase with the saved payment method and returns confirmation to the app.
### In-app Checkout with ChatGPT Payment Sheet (private beta)
In-app checkout with ChatGPT payment sheet is limited to select marketplaces
today and is not available to all users.
In order to collect new payment methods within the in-app checkout flow, app developers need to use the ChatGPT payment sheet. Call `requestCheckout` with checkout session data (line items, totals, saved payment methods) to open the ChatGPT payment sheet. When the user clicks buy, a token representing the selected payment method is sent to your MCP server via the `complete\_checkout` tool call. You can use your PSP integration to collect payment using this token, and send back finalized order details as a response to the `complete\_checkout` tool call.
### Flow at a glance
1. **Server prepares session**: An MCP tool returns checkout session data (session id, line items, totals, payment provider) in `structuredContent`.
2. **Widget previews cart**: The widget renders line items and totals so the user can confirm.
3. **Widget calls `requestCheckout`**: The widget invokes `requestCheckout(session\_data)`. ChatGPT opens the payment sheet, displays the amount to charge, and displays various payment methods.
4. **Server finalizes**: Once the user clicks the pay button, the widget calls back to your MCP via the `complete\_checkout` tool call. The MCP tool returns the completed order, which will be returned back to widget as a response to `requestCheckout`.
## Checkout session
You are responsible for constructing the checkout session payload that the host will render. The exact values for certain fields such as `id` and `payment\_provider` depend on your PSP (payment service provider) and commerce backend. In practice, your MCP tool should return:
* Line items and quantities the user is purchasing.
* Totals (subtotal, tax, discounts, fees, total) that match your backend calculations.
* Provider metadata required by your PSP integration.
* Legal and policy links (terms, refund policy, etc.).
## Widget: calling `requestCheckout` (ChatGPT Apps SDK capability)
The host provides `window.openai.requestCheckout`. Use it to open the ChatGPT payment sheet when the user initiates a purchase:
Example:
```
`async function handleCheckout(sessionJson: string) {
const session = JSON.parse(sessionJson);
if (!window.openai?.requestCheckout) {
throw new Error("requestCheckout is not available in this host");
}
// Host opens the ChatGPT payment sheet.
const order = await window.openai.requestCheckout({
...session,
id: checkout\_session\_id, // Every unique checkout session should have a unique id
});
return order; // host returns the order payload
}`
```
In your component, you might initiate this in a button click:
```
`\<Button
onClick={async () =\> {
setIsLoading(true);
try {
const orderResponse = await handleCheckout(checkoutSessionJson);
setOrder(orderResponse);
} catch (error) {
console.error(error);
} finally {
setIsLoading(false);
}
}}
\>
{isLoading ? "Loading..." : "Checkout"}
\</Button\>`
```
Here is a minimal example that shows the shape of a checkout request you pass to the host. Populate the `merchant\_id` field with the value specified by your PSP:
```
`const checkoutRequest = {
id: checkoutSessionId,
payment\_provider: {
provider: "\<PSP\_NAME\>",
merchant\_id: "\<MERCHANT\_ID\>",
supported\_payment\_methods: ["card", "apple\_pay", "google\_pay"],
},
status: "ready\_for\_payment",
currency: "USD",
totals: [
{
type: "total",
display\_text: "Total",
amount: 330,
},
],
links: [
{ type: "terms\_of\_use", url: "\<TERMS\_OF\_USE\_URL\>" },
{ type: "privacy\_policy", url: "\<PRIVACY\_POLICY\_URL\>" },
],
payment\_mode: "live",
};
const response = await window.openai.requestCheckout(checkoutRequest);`
```
Key points:
* `window.openai.requestCheckout(session)` opens the host checkout UI.
* The promise resolves with the order result or rejects on error/cancel.
* Render the session JSON so users can review what they’re paying for.
* Consult your PSP to get your PSP specific `merchant\_id` value.
## MCP server: expose the `complete\_checkout` tool
You can mirror this pattern and swap in your logic:
```
`@tool(description="")
async def complete\_checkout(
self,
checkout\_session\_id: str,
buyer: Buyer,
payment\_data: PaymentData,
) -\> types.CallToolResult:
return types.CallToolResult(
content=[],
structuredContent={
"id": checkout\_session\_id,
"status": "completed",
"currency": "USD",
"line\_items": [
{
"id": "line\_item\_1",
"item": {
"id": "item\_1",
"quantity": 1,
},
"base\_amount": 3000,
"discount": 0,
"subtotal": 3000,
"tax": 300,
"total": 3300,
},
],
"fulfillment\_address": {
"name": "Jane Customer",
"line\_one": "123 Main St",
"line\_two": "Apt 4B",
"city": "San Francisco",
"state": "CA",
"country": "US",
"postal\_code": "94107",
"phone\_number": "+1 (555) 555-5555",
},
"fulfillment\_options": [
{
"id": "fulfillment\_option\_1",
"type": "shipping",
"title": "Standard shipping",
"subtitle": "3-5 business days",
"carrier": "USPS",
"earliest\_delivery\_time": "2026-02-24T15:00:00Z",
"latest\_delivery\_time": "2026-02-28T18:00:00Z",
"subtotal": 0,
"tax": 0,
"total": 0,
},
],
"fulfillment\_option\_id": "fulfillment\_option\_1",
"totals": [
{
"type": "items\_base\_amount",
"display\_text": "Items subtotal",
"amount": 3000,
},
{
"type": "subtotal",
"display\_text": "Subtotal",
"amount": 3000,
},
{
"type": "tax",
"display\_text": "Tax",
"amount": 300,
},
{
"type": "total",
"display\_text": "Total",
"amount": 3300,
},
],
"order": {
"id": "order\_id\_123",
"checkout\_session\_id": checkout\_session\_id,
"permalink\_url": "",
},
},
\_meta={META\_SESSION\_ID: "checkout-flow"},
isError=False,
)`
```
Adapt this to:
* Integrate with your PSP to charge the payment method within `payment\_data`.
* Persist the order in your backend.
* Return authoritative order/receipt data.
* Include `\_meta.ui.resourceUri` if you want to render a confirmation widget (ChatGPT honors `\_meta["openai/outputTemplate"]` as an optional compatibility alias).
The following PSPs support payments processing for the ChatGPT payment sheet:
* [Adyen](https://docs.adyen.com/online-payments/agentic-commerce)
* Checkout.com
* Fiserv
* [PayPal](https://docs.paypal.ai/growth/agentic-commerce/agent-ready)
* [Stripe](https://docs.stripe.com/agentic-commerce/apps)
* Worldpay
## Optional: Receive Raw Payment Methods
If you are a merchant with a PCI DSS Level 1 certificate, you can receive raw payment methods directly by implementing the Agentic Commerce Protocol Delegate Payment endpoint. The delegated payment request will include the full payment method details your payment flow requires, including the raw card number, expiration date, CVC, billing address, allowance constraints, risk signals, and metadata.
For example, a raw card payment method request is as follows:
```
`{
"payment\_method": {
"type": "card",
"card\_number\_type": "fpan",
"number": "4242424242424242",
"exp\_month": "11",
"exp\_year": "2026",
"name": "Jane Doe",
"cvc": "223",
"checks\_performed": ["avs", "cvv"],
"iin": "424242",
"display\_card\_funding\_type": "credit",
"display\_brand": "visa",
"display\_last4": "4242",
"metadata": {}
},
"allowance": {
"reason": "one\_time",
"max\_amount": 5000,
"currency": "usd",
"checkout\_session\_id": "cs\_01HV3P3ABC123",
"merchant\_id": "acme\_corp",
"expires\_at": "2026-02-13T12:00:00Z"
},
"billing\_address": {
"name": "Jane Doe",
"line\_one": "185 Berry Street",
"line\_two": "Suite 550",
"city": "San Francisco",
"state": "CA",
"country": "US",
"postal\_code": "94107"
},
"risk\_signals": [
{
"type": "card\_testing",
"score": 5,
"action": "authorized"
}
],
"metadata": {
"session\_id": "sess\_abc123",
"user\_agent": "ChatGPT/2.0"
}
}`
```
The corresponding response should return an id representing the payment method. This id will be passed to `complete\_checkout` as part of `payment\_data`.
```
`{
"id": "vt\_01J8Z3WXYZ9ABC123",
"created": "2026-02-12T14:30:00Z",
"metadata": {
"source": "agent\_checkout",
"merchant\_id": "acme\_corp",
"idempotency\_key": "idem\_xyz789"
}
}`
```
## Error Handling
The `complete\_checkout` tool call can send back messages of type `error`. Error messages with `code` set to `payment\_declined` or `requires\_3ds` will be displayed on the ChatGPT payment sheet. All other error messages will be sent back to the widget as a response to `requestCheckout`. The widget can display the error as desired.
## Test payment mode
You can set the value of the `payment\_mode` field to `test` in the call to `requestCheckout`. This will present a ChatGPT payment sheet that accepts test cards (such as the 4242 test card). The resulting `token` within `payment\_data` that is passed to the `complete\_checkout` tool can be processed in the staging environment of your PSP. This allows you to test end-to-end flows without moving real funds.
Note that in test payment mode, you might have to set a different value for `merchant\_id`. Refer to your PSP’s monetization guide for more details.
## Implementation checklist
1. **Define your checkout session model**: include ids, payment\_provider,
line\_items, totals, and legal links.
2. **Return the session from your MCP tool** in `structuredContent` alongside your widget template.
3. **Render the session in the widget** so users can review items, totals, and terms.
4. **Call `requestCheckout(session\_data)`** on user action; handle the resolved order or error.
5. **Charge the user** by implementing the `complete\_checkout` MCP tool which
returns a response that follows the checkout spec.
6. **Test end-to-end** with realistic amounts, taxes, and discounts to ensure the host renders the totals you expect.