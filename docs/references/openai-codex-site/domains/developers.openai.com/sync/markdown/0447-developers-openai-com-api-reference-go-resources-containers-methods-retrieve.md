Retrieve container | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Containers](/api/reference/go/resources/containers)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Retrieve container
client.Containers.Get(ctx, containerID) (\*[ContainerGetResponse](</api/reference/go/resources/containers#(resource) containers > (model) ContainerGetResponse > (schema)>), error)
GET/containers/{container\_id}
Retrieve Container
##### ParametersExpand Collapse
containerID string
[](<#(resource) containers > (method) retrieve > (params) default > (param) container_id > (schema)>)
##### ReturnsExpand Collapse
type ContainerGetResponse struct{…}
ID string
Unique identifier for the container.
[](<#(resource) containers > (model) ContainerGetResponse > (schema) > (property) id>)
CreatedAt int64
Unix timestamp (in seconds) when the container was created.
formatunixtime
[](<#(resource) containers > (model) ContainerGetResponse > (schema) > (property) created_at>)
Name string
Name of the container.
[](<#(resource) containers > (model) ContainerGetResponse > (schema) > (property) name>)
Object string
The type of this object.
[](<#(resource) containers > (model) ContainerGetResponse > (schema) > (property) object>)
Status string
Status of the container (e.g., active, deleted).
[](<#(resource) containers > (model) ContainerGetResponse > (schema) > (property) status>)
ExpiresAfter ContainerGetResponseExpiresAfterOptional
The container will expire after this time period.
The anchor is the reference point for the expiration.
The minutes is the number of minutes after the anchor before the container expires.
Anchor stringOptional
The reference point for the expiration.
[](<#(resource) containers > (model) ContainerGetResponse > (schema) > (property) expires_after > (property) anchor>)
Minutes int64Optional
The number of minutes after the anchor before the container expires.
[](<#(resource) containers > (model) ContainerGetResponse > (schema) > (property) expires_after > (property) minutes>)
[](<#(resource) containers > (model) ContainerGetResponse > (schema) > (property) expires_after>)
LastActiveAt int64Optional
Unix timestamp (in seconds) when the container was last active.
formatunixtime
[](<#(resource) containers > (model) ContainerGetResponse > (schema) > (property) last_active_at>)
MemoryLimit ContainerGetResponseMemoryLimitOptional
The memory limit configured for the container.
One of the following:
const ContainerGetResponseMemoryLimit1g ContainerGetResponseMemoryLimit = "1g"
[](<#(resource) containers > (model) ContainerGetResponse > (schema) > (property) memory_limit > (member) 0>)
const ContainerGetResponseMemoryLimit4g ContainerGetResponseMemoryLimit = "4g"
[](<#(resource) containers > (model) ContainerGetResponse > (schema) > (property) memory_limit > (member) 1>)
const ContainerGetResponseMemoryLimit16g ContainerGetResponseMemoryLimit = "16g"
[](<#(resource) containers > (model) ContainerGetResponse > (schema) > (property) memory_limit > (member) 2>)
const ContainerGetResponseMemoryLimit64g ContainerGetResponseMemoryLimit = "64g"
[](<#(resource) containers > (model) ContainerGetResponse > (schema) > (property) memory_limit > (member) 3>)
[](<#(resource) containers > (model) ContainerGetResponse > (schema) > (property) memory_limit>)
NetworkPolicy ContainerGetResponseNetworkPolicyOptional
Network access policy for the container.
Type string
The network policy mode.
One of the following:
const ContainerGetResponseNetworkPolicyTypeAllowlist ContainerGetResponseNetworkPolicyType = "allowlist"
[](<#(resource) containers > (model) ContainerGetResponse > (schema) > (property) network_policy > (property) type > (member) 0>)
const ContainerGetResponseNetworkPolicyTypeDisabled ContainerGetResponseNetworkPolicyType = "disabled"
[](<#(resource) containers > (model) ContainerGetResponse > (schema) > (property) network_policy > (property) type > (member) 1>)
[](<#(resource) containers > (model) ContainerGetResponse > (schema) > (property) network_policy > (property) type>)
AllowedDomains []stringOptional
Allowed outbound domains when `type` is `allowlist`.
[](<#(resource) containers > (model) ContainerGetResponse > (schema) > (property) network_policy > (property) allowed_domains>)
[](<#(resource) containers > (model) ContainerGetResponse > (schema) > (property) network_policy>)
[](<#(resource) containers > (model) ContainerGetResponse > (schema)>)
### Retrieve container
Go
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
`package main
import (
"context"
"fmt"
"github.com/openai/openai-go"
"github.com/openai/openai-go/option"
)
func main() {
client := openai.NewClient(
option.WithAPIKey("My API Key"),
)
container, err := client.Containers.Get(context.TODO(), "container\_id")
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", container.ID)
}
`
```
```
`{
"id": "cntr\_682dfebaacac8198bbfe9c2474fb6f4a085685cbe3cb5863",
"object": "container",
"created\_at": 1747844794,
"status": "running",
"expires\_after": {
"anchor": "last\_active\_at",
"minutes": 20
},
"last\_active\_at": 1747844794,
"memory\_limit": "4g",
"name": "My Container"
}
`
```
##### Returns Examples
```
`{
"id": "cntr\_682dfebaacac8198bbfe9c2474fb6f4a085685cbe3cb5863",
"object": "container",
"created\_at": 1747844794,
"status": "running",
"expires\_after": {
"anchor": "last\_active\_at",
"minutes": 20
},
"last\_active\_at": 1747844794,
"memory\_limit": "4g",
"name": "My Container"
}
`
```