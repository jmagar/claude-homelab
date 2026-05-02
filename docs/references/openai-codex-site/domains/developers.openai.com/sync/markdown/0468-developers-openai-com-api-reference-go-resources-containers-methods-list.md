List containers | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Containers](/api/reference/go/resources/containers)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# List containers
client.Containers.List(ctx, query) (\*CursorPage[[ContainerListResponse](</api/reference/go/resources/containers#(resource) containers > (model) ContainerListResponse > (schema)>)], error)
GET/containers
List Containers
##### ParametersExpand Collapse
query ContainerListParams
After param.Field[string]Optional
A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj\_foo, your subsequent call can include after=obj\_foo in order to fetch the next page of the list.
[](<#(resource) containers > (method) list > (params) default > (param) after>)
Limit param.Field[int64]Optional
A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.
[](<#(resource) containers > (method) list > (params) default > (param) limit>)
Name param.Field[string]Optional
Filter results by container name.
[](<#(resource) containers > (method) list > (params) default > (param) name>)
Order param.Field[[ContainerListParamsOrder](</api/reference/go/resources/containers/methods/list#(resource) containers > (method) list > (params) default > (param) order > (schema)>)]Optional
Sort order by the `created\_at` timestamp of the objects. `asc` for ascending order and `desc` for descending order.
const ContainerListParamsOrderAsc [ContainerListParamsOrder](</api/reference/go/resources/containers/methods/list#(resource) containers > (method) list > (params) default > (param) order > (schema)>) = "asc"
[](<#(resource) containers > (method) list > (params) default > (param) order > (schema) > (member) 0>)
const ContainerListParamsOrderDesc [ContainerListParamsOrder](</api/reference/go/resources/containers/methods/list#(resource) containers > (method) list > (params) default > (param) order > (schema)>) = "desc"
[](<#(resource) containers > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) containers > (method) list > (params) default > (param) order>)
[](<#(resource) containers > (method) list > (params) default>)
##### ReturnsExpand Collapse
type ContainerListResponse struct{…}
ID string
Unique identifier for the container.
[](<#(resource) containers > (model) ContainerListResponse > (schema) > (property) id>)
CreatedAt int64
Unix timestamp (in seconds) when the container was created.
formatunixtime
[](<#(resource) containers > (model) ContainerListResponse > (schema) > (property) created_at>)
Name string
Name of the container.
[](<#(resource) containers > (model) ContainerListResponse > (schema) > (property) name>)
Object string
The type of this object.
[](<#(resource) containers > (model) ContainerListResponse > (schema) > (property) object>)
Status string
Status of the container (e.g., active, deleted).
[](<#(resource) containers > (model) ContainerListResponse > (schema) > (property) status>)
ExpiresAfter ContainerListResponseExpiresAfterOptional
The container will expire after this time period.
The anchor is the reference point for the expiration.
The minutes is the number of minutes after the anchor before the container expires.
Anchor stringOptional
The reference point for the expiration.
[](<#(resource) containers > (model) ContainerListResponse > (schema) > (property) expires_after > (property) anchor>)
Minutes int64Optional
The number of minutes after the anchor before the container expires.
[](<#(resource) containers > (model) ContainerListResponse > (schema) > (property) expires_after > (property) minutes>)
[](<#(resource) containers > (model) ContainerListResponse > (schema) > (property) expires_after>)
LastActiveAt int64Optional
Unix timestamp (in seconds) when the container was last active.
formatunixtime
[](<#(resource) containers > (model) ContainerListResponse > (schema) > (property) last_active_at>)
MemoryLimit ContainerListResponseMemoryLimitOptional
The memory limit configured for the container.
One of the following:
const ContainerListResponseMemoryLimit1g ContainerListResponseMemoryLimit = "1g"
[](<#(resource) containers > (model) ContainerListResponse > (schema) > (property) memory_limit > (member) 0>)
const ContainerListResponseMemoryLimit4g ContainerListResponseMemoryLimit = "4g"
[](<#(resource) containers > (model) ContainerListResponse > (schema) > (property) memory_limit > (member) 1>)
const ContainerListResponseMemoryLimit16g ContainerListResponseMemoryLimit = "16g"
[](<#(resource) containers > (model) ContainerListResponse > (schema) > (property) memory_limit > (member) 2>)
const ContainerListResponseMemoryLimit64g ContainerListResponseMemoryLimit = "64g"
[](<#(resource) containers > (model) ContainerListResponse > (schema) > (property) memory_limit > (member) 3>)
[](<#(resource) containers > (model) ContainerListResponse > (schema) > (property) memory_limit>)
NetworkPolicy ContainerListResponseNetworkPolicyOptional
Network access policy for the container.
Type string
The network policy mode.
One of the following:
const ContainerListResponseNetworkPolicyTypeAllowlist ContainerListResponseNetworkPolicyType = "allowlist"
[](<#(resource) containers > (model) ContainerListResponse > (schema) > (property) network_policy > (property) type > (member) 0>)
const ContainerListResponseNetworkPolicyTypeDisabled ContainerListResponseNetworkPolicyType = "disabled"
[](<#(resource) containers > (model) ContainerListResponse > (schema) > (property) network_policy > (property) type > (member) 1>)
[](<#(resource) containers > (model) ContainerListResponse > (schema) > (property) network_policy > (property) type>)
AllowedDomains []stringOptional
Allowed outbound domains when `type` is `allowlist`.
[](<#(resource) containers > (model) ContainerListResponse > (schema) > (property) network_policy > (property) allowed_domains>)
[](<#(resource) containers > (model) ContainerListResponse > (schema) > (property) network_policy>)
[](<#(resource) containers > (model) ContainerListResponse > (schema)>)
### List containers
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
page, err := client.Containers.List(context.TODO(), openai.ContainerListParams{
})
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", page)
}
`
```
```
`{
"object": "list",
"data": [
{
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
],
"first\_id": "container\_123",
"last\_id": "container\_123",
"has\_more": false
}
`
```
##### Returns Examples
```
`{
"object": "list",
"data": [
{
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
],
"first\_id": "container\_123",
"last\_id": "container\_123",
"has\_more": false
}
`
```