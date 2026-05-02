| OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Webhooks](/api/reference/python/resources/webhooks)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Unwrap
webhooks.unwrap()
Function
Validates that the given payload was sent by OpenAI and parses the payload.
### Unwrap
Python
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
`import os
from openai import OpenAI
client = OpenAI(
api\_key=os.environ.get("OPENAI\_API\_KEY"), # This is the default and can be omitted
)
client.webhooks.unwrap()`
```
##### Returns Examples