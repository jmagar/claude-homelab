Retrieve container | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Containers](/api/reference/java/resources/containers)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Retrieve container
[ContainerRetrieveResponse](</api/reference/java/resources/containers#(resource) containers > (model) ContainerRetrieveResponse > (schema)>) containers().retrieve(ContainerRetrieveParamsparams = ContainerRetrieveParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/containers/{container\_id}
Retrieve Container
##### ParametersExpand Collapse
ContainerRetrieveParams params
Optional\<String\> containerId
[](<#(resource) containers > (method) retrieve > (params) default > (param) container_id > (schema)>)
[](<#(resource) containers > (method) retrieve > (params) default>)
##### ReturnsExpand Collapse
class ContainerRetrieveResponse:
String id
Unique identifier for the container.
[](<#(resource) containers > (model) ContainerRetrieveResponse > (schema) > (property) id>)
long createdAt
Unix timestamp (in seconds) when the container was created.
formatunixtime
[](<#(resource) containers > (model) ContainerRetrieveResponse > (schema) > (property) created_at>)
String name
Name of the container.
[](<#(resource) containers > (model) ContainerRetrieveResponse > (schema) > (property) name>)
String object\_
The type of this object.
[](<#(resource) containers > (model) ContainerRetrieveResponse > (schema) > (property) object>)
String status
Status of the container (e.g., active, deleted).
[](<#(resource) containers > (model) ContainerRetrieveResponse > (schema) > (property) status>)
Optional\<ExpiresAfter\> expiresAfter
The container will expire after this time period.
The anchor is the reference point for the expiration.
The minutes is the number of minutes after the anchor before the container expires.
Optional\<Anchor\> anchor
The reference point for the expiration.
[](<#(resource) containers > (model) ContainerRetrieveResponse > (schema) > (property) expires_after > (property) anchor>)
Optional\<Long\> minutes
The number of minutes after the anchor before the container expires.
[](<#(resource) containers > (model) ContainerRetrieveResponse > (schema) > (property) expires_after > (property) minutes>)
[](<#(resource) containers > (model) ContainerRetrieveResponse > (schema) > (property) expires_after>)
Optional\<Long\> lastActiveAt
Unix timestamp (in seconds) when the container was last active.
formatunixtime
[](<#(resource) containers > (model) ContainerRetrieveResponse > (schema) > (property) last_active_at>)
Optional\<MemoryLimit\> memoryLimit
The memory limit configured for the container.
One of the following:
\_1G("1g")
[](<#(resource) containers > (model) ContainerRetrieveResponse > (schema) > (property) memory_limit > (member) 0>)
\_4G("4g")
[](<#(resource) containers > (model) ContainerRetrieveResponse > (schema) > (property) memory_limit > (member) 1>)
\_16G("16g")
[](<#(resource) containers > (model) ContainerRetrieveResponse > (schema) > (property) memory_limit > (member) 2>)
\_64G("64g")
[](<#(resource) containers > (model) ContainerRetrieveResponse > (schema) > (property) memory_limit > (member) 3>)
[](<#(resource) containers > (model) ContainerRetrieveResponse > (schema) > (property) memory_limit>)
Optional\<NetworkPolicy\> networkPolicy
Network access policy for the container.
Type type
The network policy mode.
One of the following:
ALLOWLIST("allowlist")
[](<#(resource) containers > (model) ContainerRetrieveResponse > (schema) > (property) network_policy > (property) type > (member) 0>)
DISABLED("disabled")
[](<#(resource) containers > (model) ContainerRetrieveResponse > (schema) > (property) network_policy > (property) type > (member) 1>)
[](<#(resource) containers > (model) ContainerRetrieveResponse > (schema) > (property) network_policy > (property) type>)
Optional\<List\<String\>\> allowedDomains
Allowed outbound domains when `type` is `allowlist`.
[](<#(resource) containers > (model) ContainerRetrieveResponse > (schema) > (property) network_policy > (property) allowed_domains>)
[](<#(resource) containers > (model) ContainerRetrieveResponse > (schema) > (property) network_policy>)
[](<#(resource) containers > (model) ContainerRetrieveResponse > (schema)>)
### Retrieve container
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
import com.openai.models.containers.ContainerRetrieveParams;
import com.openai.models.containers.ContainerRetrieveResponse;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
ContainerRetrieveResponse container = client.containers().retrieve("container\_id");
}
}`
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