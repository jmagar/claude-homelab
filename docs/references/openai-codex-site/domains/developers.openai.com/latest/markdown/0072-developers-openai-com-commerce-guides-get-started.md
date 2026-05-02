Get Started – Agentic Commerce | OpenAI Developers
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
Onboarding product feeds in ChatGPT is currently available to approved
partners. To apply for access, fill out this form
[
here
](https://chatgpt.com/merchants)
## Overview
Start your ACP integration by sharing a structured product feed with OpenAI. Product feeds give ChatGPT the catalog data it needs to index your products, understand core attributes, and present accurate product information in shopping experiences.
Start with product feeds when you want to:
* Make your catalog understandable to ChatGPT.
* Share up-to-date product data, including titles, descriptions, images, price, and availability.
* Establish a clear integration path based on a documented schema and delivery model.
You can learn more about the Agentic Commerce Protocol at [agenticcommerce.dev](https://agenticcommerce.dev) and on [GitHub](https://github.com/agentic-commerce-protocol/agentic-commerce-protocol).
## Integration path
Use this sequence to stand up your integration with ACP:
1. **Decide** which integration method to use: [file upload](/commerce/specs/file-upload/overview) or [API](/commerce/specs/api/overview).
* It is generally recommended to provide the entire feed once a day via file upload, and then send updates throughout the day via the API.
* If your feed is small, you can provide both the entire feed and regular updates via the API.
* Promotions data can only be provided via the API.
* **Review** the specs for the chosen integration method, and confirm the required fields, canonical field names, and validation rules.
* **Validate** required fields for every record.
* **Upload** feed data through the chosen integration method.
* **Keep** the feed current based on the integration method:
* For file upload, overwrite the same file or shard set with your latest snapshot on a regular cadence.
* For the API, upsert products through the API.
## Prohibited products policy
To keep ChatGPT a safe place for everyone, we only allow products and services that are legal, safe, and appropriate for a general audience. Prohibited products include, but are not limited to, those that involve adult content, age-restricted products (for example, alcohol, nicotine, gambling), harmful or dangerous materials, weapons, prescription-only medications, unlicensed financial products, legally restricted goods, illegal activities, or deceptive practices.
Merchants are responsible for ensuring their products and content do not violate these restrictions or any applicable law. OpenAI may take corrective actions such as removing a product or banning a seller from being surfaced in ChatGPT if these policies are violated.
## Best practices
Review integration [best practices](/commerce/guides/best-practices) for guidance.