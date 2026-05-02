List containers | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Containers](/api/reference/resources/containers)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# List containers
GET/containers
List Containers
##### Query ParametersExpand Collapse
after: optional string
A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj\_foo, your subsequent call can include after=obj\_foo in order to fetch the next page of the list.
[](<#(resource) containers > (method) list > (params) default > (param) after > (schema)>)
limit: optional number
A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.
[](<#(resource) containers > (method) list > (params) default > (param) limit > (schema)>)
name: optional string
Filter results by container name.
[](<#(resource) containers > (method) list > (params) default > (param) name > (schema)>)
order: optional "asc" or "desc"
Sort order by the `created\_at` timestamp of the objects. `asc` for ascending order and `desc` for descending order.
One of the following:
"asc"
[](<#(resource) containers > (method) list > (params) default > (param) order > (schema) > (member) 0>)
"desc"
[](<#(resource) containers > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) containers > (method) list > (params) default > (param) order > (schema)>)
##### ReturnsExpand Collapse
data: array of object { id, created\_at, name, 6 more }
A list of containers.
id: string
Unique identifier for the container.
[](<#(resource) containers > (model) container_list_response > (schema) > (property) id>)
created\_at: number
Unix timestamp (in seconds) when the container was created.
formatunixtime
[](<#(resource) containers > (model) container_list_response > (schema) > (property) created_at>)
name: string
Name of the container.
[](<#(resource) containers > (model) container_list_response > (schema) > (property) name>)
object: string
The type of this object.
[](<#(resource) containers > (model) container_list_response > (schema) > (property) object>)
status: string
Status of the container (e.g., active, deleted).
[](<#(resource) containers > (model) container_list_response > (schema) > (property) status>)
expires\_after: optional object { anchor, minutes }
The container will expire after this time period.
The anchor is the reference point for the expiration.
The minutes is the number of minutes after the anchor before the container expires.
anchor: optional "last\_active\_at"
The reference point for the expiration.
[](<#(resource) containers > (model) container_list_response > (schema) > (property) expires_after > (property) anchor>)
minutes: optional number
The number of minutes after the anchor before the container expires.
[](<#(resource) containers > (model) container_list_response > (schema) > (property) expires_after > (property) minutes>)
[](<#(resource) containers > (model) container_list_response > (schema) > (property) expires_after>)
last\_active\_at: optional number
Unix timestamp (in seconds) when the container was last active.
formatunixtime
[](<#(resource) containers > (model) container_list_response > (schema) > (property) last_active_at>)
memory\_limit: optional "1g" or "4g" or "16g" or "64g"
The memory limit configured for the container.
One of the following:
"1g"
[](<#(resource) containers > (model) container_list_response > (schema) > (property) memory_limit > (member) 0>)
"4g"
[](<#(resource) containers > (model) container_list_response > (schema) > (property) memory_limit > (member) 1>)
"16g"
[](<#(resource) containers > (model) container_list_response > (schema) > (property) memory_limit > (member) 2>)
"64g"
[](<#(resource) containers > (model) container_list_response > (schema) > (property) memory_limit > (member) 3>)
[](<#(resource) containers > (model) container_list_response > (schema) > (property) memory_limit>)
network\_policy: optional object { type, allowed\_domains }
Network access policy for the container.
type: "allowlist" or "disabled"
The network policy mode.
One of the following:
"allowlist"
[](<#(resource) containers > (model) container_list_response > (schema) > (property) network_policy > (property) type > (member) 0>)
"disabled"
[](<#(resource) containers > (model) container_list_response > (schema) > (property) network_policy > (property) type > (member) 1>)
[](<#(resource) containers > (model) container_list_response > (schema) > (property) network_policy > (property) type>)
allowed\_domains: optional array of string
Allowed outbound domains when `type` is `allowlist`.
[](<#(resource) containers > (model) container_list_response > (schema) > (property) network_policy > (property) allowed_domains>)
[](<#(resource) containers > (model) container_list_response > (schema) > (property) network_policy>)
[](<#(resource) containers > (method) list > (network schema) > (property) data>)
first\_id: string
The ID of the first container in the list.
[](<#(resource) containers > (method) list > (network schema) > (property) first_id>)
has\_more: boolean
Whether there are more containers available.
[](<#(resource) containers > (method) list > (network schema) > (property) has_more>)
last\_id: string
The ID of the last container in the list.
[](<#(resource) containers > (method) list > (network schema) > (property) last_id>)
object: "list"
The type of object returned, must be ‘list’.
[](<#(resource) containers > (method) list > (network schema) > (property) object>)
### List containers
HTTP
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
`curl https://api.openai.com/v1/containers \\
-H "Authorization: Bearer $OPENAI\_API\_KEY"
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