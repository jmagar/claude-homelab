List containers | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Containers](/api/reference/java/resources/containers)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# List containers
ContainerListPage containers().list(ContainerListParamsparams = ContainerListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/containers
List Containers
##### ParametersExpand Collapse
ContainerListParams params
Optional\<String\> after
A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj\_foo, your subsequent call can include after=obj\_foo in order to fetch the next page of the list.
[](<#(resource) containers > (method) list > (params) default > (param) after > (schema)>)
Optional\<Long\> limit
A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.
[](<#(resource) containers > (method) list > (params) default > (param) limit > (schema)>)
Optional\<String\> name
Filter results by container name.
[](<#(resource) containers > (method) list > (params) default > (param) name > (schema)>)
Optional\<[Order](</api/reference/java/resources/containers/methods/list#(resource) containers > (method) list > (params) default > (param) order > (schema)>)\> order
Sort order by the `created\_at` timestamp of the objects. `asc` for ascending order and `desc` for descending order.
ASC("asc")
[](<#(resource) containers > (method) list > (params) default > (param) order > (schema) > (member) 0>)
DESC("desc")
[](<#(resource) containers > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) containers > (method) list > (params) default > (param) order > (schema)>)
[](<#(resource) containers > (method) list > (params) default>)
##### ReturnsExpand Collapse
class ContainerListResponse:
String id
Unique identifier for the container.
[](<#(resource) containers > (model) ContainerListResponse > (schema) > (property) id>)
long createdAt
Unix timestamp (in seconds) when the container was created.
formatunixtime
[](<#(resource) containers > (model) ContainerListResponse > (schema) > (property) created_at>)
String name
Name of the container.
[](<#(resource) containers > (model) ContainerListResponse > (schema) > (property) name>)
String object\_
The type of this object.
[](<#(resource) containers > (model) ContainerListResponse > (schema) > (property) object>)
String status
Status of the container (e.g., active, deleted).
[](<#(resource) containers > (model) ContainerListResponse > (schema) > (property) status>)
Optional\<ExpiresAfter\> expiresAfter
The container will expire after this time period.
The anchor is the reference point for the expiration.
The minutes is the number of minutes after the anchor before the container expires.
Optional\<Anchor\> anchor
The reference point for the expiration.
[](<#(resource) containers > (model) ContainerListResponse > (schema) > (property) expires_after > (property) anchor>)
Optional\<Long\> minutes
The number of minutes after the anchor before the container expires.
[](<#(resource) containers > (model) ContainerListResponse > (schema) > (property) expires_after > (property) minutes>)
[](<#(resource) containers > (model) ContainerListResponse > (schema) > (property) expires_after>)
Optional\<Long\> lastActiveAt
Unix timestamp (in seconds) when the container was last active.
formatunixtime
[](<#(resource) containers > (model) ContainerListResponse > (schema) > (property) last_active_at>)
Optional\<MemoryLimit\> memoryLimit
The memory limit configured for the container.
One of the following:
\_1G("1g")
[](<#(resource) containers > (model) ContainerListResponse > (schema) > (property) memory_limit > (member) 0>)
\_4G("4g")
[](<#(resource) containers > (model) ContainerListResponse > (schema) > (property) memory_limit > (member) 1>)
\_16G("16g")
[](<#(resource) containers > (model) ContainerListResponse > (schema) > (property) memory_limit > (member) 2>)
\_64G("64g")
[](<#(resource) containers > (model) ContainerListResponse > (schema) > (property) memory_limit > (member) 3>)
[](<#(resource) containers > (model) ContainerListResponse > (schema) > (property) memory_limit>)
Optional\<NetworkPolicy\> networkPolicy
Network access policy for the container.
Type type
The network policy mode.
One of the following:
ALLOWLIST("allowlist")
[](<#(resource) containers > (model) ContainerListResponse > (schema) > (property) network_policy > (property) type > (member) 0>)
DISABLED("disabled")
[](<#(resource) containers > (model) ContainerListResponse > (schema) > (property) network_policy > (property) type > (member) 1>)
[](<#(resource) containers > (model) ContainerListResponse > (schema) > (property) network_policy > (property) type>)
Optional\<List\<String\>\> allowedDomains
Allowed outbound domains when `type` is `allowlist`.
[](<#(resource) containers > (model) ContainerListResponse > (schema) > (property) network_policy > (property) allowed_domains>)
[](<#(resource) containers > (model) ContainerListResponse > (schema) > (property) network_policy>)
[](<#(resource) containers > (model) ContainerListResponse > (schema)>)
### List containers
Java
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
`package com.openai.example;
import com.openai.client.OpenAIClient;
import com.openai.client.okhttp.OpenAIOkHttpClient;
import com.openai.models.containers.ContainerListPage;
import com.openai.models.containers.ContainerListParams;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
ContainerListPage page = client.containers().list();
}
}`
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