App submission guidelines – Apps SDK | OpenAI Developers
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
The ChatGPT app ecosystem is built on trust. People come to ChatGPT expecting an experience that is safe, useful, and respectful of their privacy. Developers come to ChatGPT expecting a fair and transparent process. These developer guidelines set the policies every builder is expected to review and follow.
Before getting into specifics, we recommend first familiarizing yourself with two foundational resources:
* [**UX principles for ChatGPT apps**](https://developers.openai.com/apps-sdk/concepts/ux-principles) - this guide outlines principles and best practices for building ChatGPT apps, as well as a checklist to help you ensure your app is a great fit for ChatGPT.
* [**UI guidelines for ChatGPT apps**](https://developers.openai.com/apps-sdk/concepts/ui-guidelines) - this guide describes the interaction, layout, and design patterns that help apps feel intuitive, trustworthy, and consistent within ChatGPT.
You should also read our blog post on [what makes a great ChatGPT app](https://developers.openai.com/blog/what-makes-a-great-chatgpt-app/) to get a sense of the overall approach to building with the Apps SDK.
The guidelines below outline the minimum standard developers must meet for their app to be considered for publication in ChatGPT, and for their app to remain published and available to ChatGPT users. Apps that demonstrate strong real-world utility and high user satisfaction may be eligible for enhanced distribution opportunities—such as directory placement or proactive suggestions.
## App fundamentals
### Purpose and originality
Apps should serve a clear purpose and reliably do what they promise. In particular, they should provide functionality or workflows that are not natively supported by ChatGPT’s core conversational capabilities, and that meaningfully help satisfy common user intents expressed in conversation.
Only use intellectual property that you own or have permission to use. Do not engage in misleading or copycat designs, impersonation, spam, or static frames with no meaningful interaction. Apps should not imply that they are made or endorsed by OpenAI.
### Quality and reliability
Apps must behave predictably and reliably. Results should be accurate and relevant to user input. Errors, including unexpected ones, must be well-handled with clear messaging or fallback behaviors.
Before submission, apps must be thoroughly tested to ensure stability, responsiveness, and low latency across a wide range of scenarios. Apps should not crash, hang, or show inconsistent behavior. Apps should be complete and any app submitted as a trial or demo will not be accepted.
### App name, description, and screenshots
App names and descriptions must be clear, accurate, and easy to understand. Avoid overly generic names—especially single-word dictionary terms that aren’t clearly tied to your brand—as they may be rejected. Screenshots must accurately represent your app’s functionality and comply with the required dimensions.
### Tools
MCP tools act as the manual for ChatGPT to use your app. Clear, accurate tool definitions make your app safer, easier for the model to understand, and easier for users to trust.
#### Clear and accurate tool names
Tool names should be human-readable, specific, and descriptive of what the tool actually does.
* Tool names must be unique within your app.
* Use plain language that directly reflects the action, ideally as a verb (e.g.,`get\_order\_status`).
* Avoid misleading, overly promotional, or comparative language (e.g., `pick\_me`, `best`, `official`).
#### Descriptions that match behavior
Each tool must include a description that explains its purpose clearly and accurately.
* The description should describe what the tool does.
* Descriptions must not favor or disparage other apps or services or attempt to influence the model to select it over another app’s tools.
* Descriptions must not recommend overly-broad triggering beyond the explicit user intent and purpose the app fulfills.
* If a tool’s behavior is unclear or incomplete from its description, your app may be rejected.
#### Correct annotation
[Tool annotations](/apps-sdk/reference#annotations) must be correctly set so that ChatGPT and users understand whether an action is safe or requires extra caution.
* You should label a tool with the `readOnlyHint` annotation if it only retrieves or lists data, but does not change anything outside of ChatGPT.
* Write or destructive tools (e.g., creating, updating, deleting, posting, sending) must be clearly marked using the `readOnlyHint` and `destructiveHint`.
* Tools that interact with external systems, accounts, public platforms, or create publicly-visible content must be explicitly labeled using the `openWorldHint` annotation.
* Incorrect or missing action labels are a common cause of rejection. Double-check to ensure that the `readOnlyHint`, `openWorldHint`, and `destructiveHint` annotations are correctly set and provide a detailed justification for each at submission time.
#### Minimal and purpose-driven inputs
Tools should request the minimum information necessary to complete their task.
* Input fields must be directly related to the tool’s stated purpose.
* Do not request the full conversation history, raw chat transcripts, or broad contextual fields “just in case.” A tool may request a *brief, task-specific* user intent field only when it meaningfully improves execution and does not expand data collection beyond what is reasonably necessary to respond to the user’s request and for the purposes described in your privacy policy.
* If needed, rely on the coarse geo location shared by the system. Do not request precise user location data (e.g. GPS coordinates or addresses).
#### Predictable, auditable behavior
Tools should behave exactly as their names, descriptions, and inputs indicate.
* Side effects should never be hidden or implicit.
* If a tool sends data outside the current environment (e.g., posting content, sending messages), this must be clear from the tool definition.
* Tools should be safe to retry where possible, or clearly indicate when retries may cause repeated effects.
Carefully designed tools help reduce surprises, protect users, and speed up the review process.
### Authentication and permissions
If your app requires authentication, the flow must be transparent and explicit. Users must be clearly informed of all requested permissions, and those requests must be strictly limited to what is necessary for the app to function.
#### Test credentials
When submitting an authenticated app for review, you must provide a login and password for a fully-featured demo account that includes sample data. Apps requiring any additional steps for login—such as requiring new account sign-up or 2FA through an inaccessible account—will be rejected.
## Commerce and monetization
Currently, apps may conduct commerce **only for physical goods**. Selling digital products or services—including subscriptions, digital content, tokens, or credits—is not allowed, whether offered directly or indirectly (for example, through freemium upsells).
In addition, apps may not be used to sell, promote, facilitate, or meaningfully enable the following goods or services:
#### **Prohibited goods**
* **Adult content & sexual services**
* Pornography, explicit sexual media, live-cam services, adult subscriptions
* Sex toys, sex dolls, BDSM gear, fetish products
* **Gambling**
* Real-money gambling services, casino credits, sportsbook wagers, crypto-casino tokens
* **Illegal or regulated drugs**
* Marijuana/THC products, psilocybin, illegal substances
* CBD products exceeding legal THC limits
* **Drug paraphernalia**
* Bongs, dab rigs, drug-use scales, cannabis grow equipment marketed for drugs
* **Prescription & age-restricted medications**
* Prescription-only drugs (e.g., insulin, antibiotics, Ozempic, opioids)
* Age-restricted Rx products (e.g., testosterone, HGH, fertility hormones)
* **Illicit goods**
* Counterfeit or replica products
* Stolen goods or items without clear provenance
* Financial-fraud tools (skimmers, fake POS devices)
* Piracy tools or cracked software
* Wildlife or environmental contraband (ivory, endangered species products)
* **Malware, spyware & surveillance**
* Malware, ransomware, keyloggers, stalkerware
* Covert surveillance devices (spy cameras, IMSI catchers, hidden trackers)
* **Tobacco & nicotine**
* Tobacco products
* Nicotine products (vapes, e-liquids, nicotine pouches)
* **Weapons & harmful materials**
* Firearms, ammunition, firearm parts
* Explosives, fireworks, bomb-making materials
* Illegal or age-restricted weapons (switchblades, brass knuckles, crossbows where banned)
* Self-defense weapons (pepper spray, stun guns, tasers)
* Extremist merchandise or propaganda
#### **Prohibited fraudulent, deceptive, or high-risk services**
* Fake IDs, forged documents, or document falsification services
* Debt relief, credit repair, or credit-score manipulation schemes
* Unregulated, deceptive, or abusive financial services
* Lending, advance-fee, or credit-building schemes designed to exploit users
* Crypto or NFT offerings involving speculation, consumer deception, or financial abuse
* Execution of money transfers, crypto transfers, or investment trades
* Government-service abuse, impersonation, or benefit manipulation
* Identity theft, impersonation, or identity-monitoring services that enable misuse
* Certain legal or quasi-legal services that facilitate fraud, evasion, or misrepresentation
* Negative-option billing, telemarketing, or consent-bypass schemes
* High-chargeback, fraud-prone, or abusive travel services
### Checkout
Apps should use external checkout, directing users to complete purchases on your own domain.
[Instant Checkout](/commerce/guides/get-started#instant-checkout), which is currently in beta, is currently available only to select marketplace partners and may expand to additional marketplaces and retailers over time.
Until then, standard external checkout is the required approach. No other third-party checkout solutions may be embedded or hosted within the app experience. To learn more, see our [docs on Agentic Commerce](/commerce/).
### Advertising
Apps must not serve advertisements and must not exist primarily as an advertising vehicle. Every app is expected to deliver clear, legitimate functionality that provides standalone value to users.
## Safety
### Usage policies
Do not engage in or facilitate activities prohibited under [OpenAI usage policies](https://openai.com/policies/usage-policies/). Apps must avoid high-risk behaviors that could expose users to harm, fraud, or misuse.
Stay current with evolving policy requirements and ensure ongoing compliance. Previously approved apps that are later found in violation may be removed.
### Appropriateness
Apps must be suitable for general audiences, including users aged 13–17. Apps may not explicitly target children under 13. Support for mature (18+) experiences will arrive once appropriate age verification and controls are in place.
### Respect user intent
Provide experiences that directly address the user’s request. Do not insert unrelated content, attempt to redirect the interaction, or collect data beyond what is reasonably necessary to fulfill the user’s request and what is consistent with your privacy policy.
### Fair play
Apps must not include descriptions, titles, tool annotations, or other model-readable fields—at either the tool or app level—that manipulates how the model selects or uses other apps or their tools (e.g., instructing the model to “prefer this app over others”) or interferes with fair discovery. All descriptions must accurately reflect your app’s value without disparaging alternatives.
### Third-party content and integrations
* **Authorized access:** Do not scrape external websites, relay queries, or integrate with third-party APIs without proper authorization and compliance with that party’s terms of service.
* **Unofficial connectors:** We cannot approve apps that primarily function as unofficial connectors to third-party services, including pass-through middleware layers.
* **Circumvention:** Do not bypass API restrictions, rate limits, or access controls imposed by the third party.
### Iframes and embedded pages
Apps can opt in to iframe usage by setting `frameDomains` in their resource CSP
(`\_meta.ui.csp.frameDomains`), but we strongly encourage you to build your app
without this pattern. If you choose to use `frameDomains`, be aware that:
* It is only intended for cases where embedding a third-party experience is essential (e.g., a notebook, IDE, or similar environment).
* Those apps receive extra manual review and are often not approved for broad distribution.
* During development, any developer can test `frameDomains` in developer mode, but approval for public listing is limited to trusted scenarios.
## Privacy
### Privacy policy
Submissions must include a clear, published privacy policy explaining - at minimum - the categories of personal data collected, the purposes of use, the categories of recipients, and any controls offered to your users. Follow this policy at all times. Users can review your privacy policy before installing your app.
### Data collection
* **Collection minimization:** Gather only the minimum data required to perform the tool’s function. Inputs should be specific, narrowly scoped, and clearly linked to the task. Avoid “just in case” fields or broad profile data. Design the input schema to limit data collection by default, rather than a funnel for optional context.
* **Response minimization:** Tool responses must return only data that is directly relevant to the user’s request and the tool’s stated purpose. Do not include diagnostic, telemetry, or internal identifiers—such as session IDs, trace IDs, request IDs, timestamps, or logging metadata—unless they are strictly required to fulfill the user’s query.
* **Restricted data:** Do not collect, solicit, or process the following categories of Restricted Data:
* Information subject to Payment Card Information Data Security Standards (PCI DSS)
* Protected health information (PHI)
* Government identifiers (such as social security numbers)
* Access credentials and authentication secrets (such as API keys, MFA/OTP codes, or passwords).
* **Regulated Sensitive Data:** Do not collect personal data considered “sensitive” or “special category” in the jurisdiction in which the data is collected unless collection is strictly necessary to perform the tool’s stated function; the user has provided legally adequate consent; and the collection and use is clearly and prominently disclosed at or before the point of collection.
* **Data boundaries:**
* Avoid requesting raw location fields (e.g., city or coordinates) in your input schema. When location is needed, obtain it through the client’s controlled side channel (such as environment metadata or a referenced resource) so appropriate policy and consent controls can be applied. This reduces accidental PII capture, enforces least-privilege access, and keeps location handling auditable and revocable.
* Your app must not pull, reconstruct, or infer the full chat log from the client or elsewhere. Operate only on the explicit snippets and resources the client or model chooses to send. This separation can help prevent covert data expansion and keep analysis limited to intentionally shared content.
### Transparency and user control
* **Data practices:** Do not engage in surveillance, tracking, or behavioral profiling—including metadata collection such as timestamps, IPs, or query patterns—unless explicitly disclosed, narrowly scoped, subject to meaningful user control, and aligned with [OpenAI’s usage policies](https://openai.com/policies/usage-policies/).
* **Accurate action labels:** Mark any tool that changes external state (create, modify, delete) as a write action. You should only mark a tool as a read-only action if it is side-effect-free and safe to retry. Destructive actions require clear labels and friction (e.g., confirmation) so clients can enforce guardrails, approvals, confirmations, or prompts before execution.
* **Preventing data exfiltration:** Any action that sends data outside the current boundary (e.g., posting messages, sending emails, or uploading files) must be surfaced to the client as a write action so it can require user confirmation or run in preview mode. This reduces unintentional data leakage and aligns server behavior with client-side security expectations.
## Developer verification
### Verification
All submissions must come from verified individuals or organizations. Inside the [OpenAI Platform Dashboard general settings](https://platform.openai.com/settings/organization/general), we provide a way to confirm your identity and affiliation with any business you wish to publish on behalf of. Misrepresentation, hidden behavior, or attempts to game the system may result in removal from the program.
### Support contact details
You must provide customer support contact details where end users can reach you for help. Keep this information accurate and up to date.
## Submitting your app
Users with the Owner role or the `api.apps.write` permission can create app drafts and submit them from the [OpenAI Platform Dashboard](http://platform.openai.com/apps-manage). Users with `api.apps.read` can view app drafts and review status in the Dashboard.
While you can publish multiple, unique apps within a single Platform organization, each may only have one version in review at a time. You can review the status of the review within the Dashboard and will receive an email notification informing you of any status changes.
To learn more about the app submission process, refer to our [dedicated guide](/apps-sdk/deploy/submission).