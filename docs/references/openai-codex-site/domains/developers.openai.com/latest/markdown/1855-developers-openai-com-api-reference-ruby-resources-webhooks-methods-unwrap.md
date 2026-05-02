| OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Webhooks](/api/reference/ruby/resources/webhooks)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Unwrap
webhooks.unwrap() -\> void
Function
Validates that the given payload was sent by OpenAI and parses the payload.
### Unwrap
Ruby
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
`require "openai"
openai = OpenAI::Client.new(api\_key: "My API Key")
result = openai.webhooks.unwrap
puts(result)`
```
##### Returns Examples