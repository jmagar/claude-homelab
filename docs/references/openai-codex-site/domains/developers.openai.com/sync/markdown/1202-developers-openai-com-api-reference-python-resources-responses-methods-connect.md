| OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Responses](/api/reference/python/resources/responses)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Connect
responses.connect()
Function
Connect to a persistent Responses API WebSocket. Send `response.create` events and receive response stream events over the socket.
### Connect
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
client.responses.connect()`
```
##### Returns Examples