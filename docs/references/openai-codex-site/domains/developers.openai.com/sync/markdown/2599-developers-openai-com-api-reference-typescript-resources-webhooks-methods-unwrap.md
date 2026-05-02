| OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Webhooks](/api/reference/typescript/resources/webhooks)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Unwrap
client.webhooks.unwrap(RequestOptionsoptions?): void
Function
Validates that the given payload was sent by OpenAI and parses the payload.
### Unwrap
TypeScript
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
`import OpenAI from 'openai';
const client = new OpenAI({
apiKey: process.env['OPENAI\_API\_KEY'], // This is the default and can be omitted
});
await client.webhooks.unwrap();`
```
##### Returns Examples