Create container | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Containers](/api/reference/python/resources/containers)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create container
containers.create(ContainerCreateParams\*\*kwargs) -\> [ContainerCreateResponse](</api/reference/python/resources/containers#(resource) containers > (model) container_create_response > (schema)>)
POST/containers
Create Container
##### ParametersExpand Collapse
name: str
Name of the container to create.
[](<#(resource) containers > (method) create > (params) default > (param) name > (schema)>)
expires\_after: Optional[[ExpiresAfter](</api/reference/python/resources/containers/methods/create#(resource) containers > (method) create > (params) default > (param) expires_after > (schema)>)]
Container expiration time in seconds relative to the ‘anchor’ time.
anchor: Literal["last\_active\_at"]
Time anchor for the expiration time. Currently only ‘last\_active\_at’ is supported.
[](<#(resource) containers > (method) create > (params) default > (param) expires_after > (schema) > (property) anchor>)
minutes: int
[](<#(resource) containers > (method) create > (params) default > (param) expires_after > (schema) > (property) minutes>)
[](<#(resource) containers > (method) create > (params) default > (param) expires_after > (schema)>)
file\_ids: Optional[Sequence[str]]
IDs of files to copy to the container.
[](<#(resource) containers > (method) create > (params) default > (param) file_ids > (schema)>)
memory\_limit: Optional[Literal["1g", "4g", "16g", "64g"]]
Optional memory limit for the container. Defaults to “1g”.
One of the following:
"1g"
[](<#(resource) containers > (method) create > (params) default > (param) memory_limit > (schema) > (member) 0>)
"4g"
[](<#(resource) containers > (method) create > (params) default > (param) memory_limit > (schema) > (member) 1>)
"16g"
[](<#(resource) containers > (method) create > (params) default > (param) memory_limit > (schema) > (member) 2>)
"64g"
[](<#(resource) containers > (method) create > (params) default > (param) memory_limit > (schema) > (member) 3>)
[](<#(resource) containers > (method) create > (params) default > (param) memory_limit > (schema)>)
network\_policy: Optional[[NetworkPolicy](</api/reference/python/resources/containers/methods/create#(resource) containers > (method) create > (params) default > (param) network_policy > (schema)>)]
Network access policy for the container.
One of the following:
class ContainerNetworkPolicyDisabled: …
type: Literal["disabled"]
Disable outbound network access. Always `disabled`.
[](<#(resource) responses > (model) container_network_policy_disabled > (schema) > (property) type>)
[](<#(resource) responses > (model) container_network_policy_disabled > (schema)>)
class ContainerNetworkPolicyAllowlist: …
allowed\_domains: List[str]
A list of allowed domains when type is `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) allowed_domains>)
type: Literal["allowlist"]
Allow outbound network access only to specified domains. Always `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) type>)
domain\_secrets: Optional[List[[ContainerNetworkPolicyDomainSecret](</api/reference/python/resources/responses#(resource) responses > (model) container_network_policy_domain_secret > (schema)>)]]
Optional domain-scoped secrets for allowlisted domains.
domain: str
The domain associated with the secret.
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) domain>)
name: str
The name of the secret to inject for the domain.
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) name>)
value: str
The secret value to inject for the domain.
maxLength10485760
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) value>)
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) domain_secrets>)
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema)>)
[](<#(resource) containers > (method) create > (params) default > (param) network_policy > (schema)>)
skills: Optional[Iterable[Skill]]
An optional list of skills referenced by id or inline data.
One of the following:
class SkillReference: …
skill\_id: str
The ID of the referenced skill.
maxLength64
minLength1
[](<#(resource) responses > (model) skill_reference > (schema) > (property) skill_id>)
type: Literal["skill\_reference"]
References a skill created with the /v1/skills endpoint.
[](<#(resource) responses > (model) skill_reference > (schema) > (property) type>)
version: Optional[str]
Optional skill version. Use a positive integer or ‘latest’. Omit for default.
[](<#(resource) responses > (model) skill_reference > (schema) > (property) version>)
[](<#(resource) responses > (model) skill_reference > (schema)>)
class InlineSkill: …
description: str
The description of the skill.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) description>)
name: str
The name of the skill.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) name>)
source: [InlineSkillSource](</api/reference/python/resources/responses#(resource) responses > (model) inline_skill_source > (schema)>)
Inline skill payload
data: str
Base64-encoded skill zip bundle.
maxLength70254592
minLength1
[](<#(resource) responses > (model) inline_skill > (schema) > (property) source + (resource) responses > (model) inline_skill_source > (schema) > (property) data>)
media\_type: Literal["application/zip"]
The media type of the inline skill payload. Must be `application/zip`.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) source + (resource) responses > (model) inline_skill_source > (schema) > (property) media_type>)
type: Literal["base64"]
The type of the inline skill source. Must be `base64`.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) source + (resource) responses > (model) inline_skill_source > (schema) > (property) type>)
[](<#(resource) responses > (model) inline_skill > (schema) > (property) source>)
type: Literal["inline"]
Defines an inline skill for this request.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) type>)
[](<#(resource) responses > (model) inline_skill > (schema)>)
[](<#(resource) containers > (method) create > (params) default > (param) skills > (schema)>)
##### ReturnsExpand Collapse
class ContainerCreateResponse: …
id: str
Unique identifier for the container.
[](<#(resource) containers > (model) container_create_response > (schema) > (property) id>)
created\_at: int
Unix timestamp (in seconds) when the container was created.
formatunixtime
[](<#(resource) containers > (model) container_create_response > (schema) > (property) created_at>)
name: str
Name of the container.
[](<#(resource) containers > (model) container_create_response > (schema) > (property) name>)
object: str
The type of this object.
[](<#(resource) containers > (model) container_create_response > (schema) > (property) object>)
status: str
Status of the container (e.g., active, deleted).
[](<#(resource) containers > (model) container_create_response > (schema) > (property) status>)
expires\_after: Optional[ExpiresAfter]
The container will expire after this time period.
The anchor is the reference point for the expiration.
The minutes is the number of minutes after the anchor before the container expires.
anchor: Optional[Literal["last\_active\_at"]]
The reference point for the expiration.
[](<#(resource) containers > (model) container_create_response > (schema) > (property) expires_after > (property) anchor>)
minutes: Optional[int]
The number of minutes after the anchor before the container expires.
[](<#(resource) containers > (model) container_create_response > (schema) > (property) expires_after > (property) minutes>)
[](<#(resource) containers > (model) container_create_response > (schema) > (property) expires_after>)
last\_active\_at: Optional[int]
Unix timestamp (in seconds) when the container was last active.
formatunixtime
[](<#(resource) containers > (model) container_create_response > (schema) > (property) last_active_at>)
memory\_limit: Optional[Literal["1g", "4g", "16g", "64g"]]
The memory limit configured for the container.
One of the following:
"1g"
[](<#(resource) containers > (model) container_create_response > (schema) > (property) memory_limit > (member) 0>)
"4g"
[](<#(resource) containers > (model) container_create_response > (schema) > (property) memory_limit > (member) 1>)
"16g"
[](<#(resource) containers > (model) container_create_response > (schema) > (property) memory_limit > (member) 2>)
"64g"
[](<#(resource) containers > (model) container_create_response > (schema) > (property) memory_limit > (member) 3>)
[](<#(resource) containers > (model) container_create_response > (schema) > (property) memory_limit>)
network\_policy: Optional[NetworkPolicy]
Network access policy for the container.
type: Literal["allowlist", "disabled"]
The network policy mode.
One of the following:
"allowlist"
[](<#(resource) containers > (model) container_create_response > (schema) > (property) network_policy > (property) type > (member) 0>)
"disabled"
[](<#(resource) containers > (model) container_create_response > (schema) > (property) network_policy > (property) type > (member) 1>)
[](<#(resource) containers > (model) container_create_response > (schema) > (property) network_policy > (property) type>)
allowed\_domains: Optional[List[str]]
Allowed outbound domains when `type` is `allowlist`.
[](<#(resource) containers > (model) container_create_response > (schema) > (property) network_policy > (property) allowed_domains>)
[](<#(resource) containers > (model) container_create_response > (schema) > (property) network_policy>)
[](<#(resource) containers > (model) container_create_response > (schema)>)
### Create container
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
container = client.containers.create(
name="name",
)
print(container.id)`
```
```
`{
"id": "cntr\_682e30645a488191b6363a0cbefc0f0a025ec61b66250591",
"object": "container",
"created\_at": 1747857508,
"status": "running",
"expires\_after": {
"anchor": "last\_active\_at",
"minutes": 20
},
"last\_active\_at": 1747857508,
"network\_policy": {
"type": "allowlist",
"allowed\_domains": ["api.buildkite.com"]
},
"memory\_limit": "4g",
"name": "My Container"
}
`
```
##### Returns Examples
```
`{
"id": "cntr\_682e30645a488191b6363a0cbefc0f0a025ec61b66250591",
"object": "container",
"created\_at": 1747857508,
"status": "running",
"expires\_after": {
"anchor": "last\_active\_at",
"minutes": 20
},
"last\_active\_at": 1747857508,
"network\_policy": {
"type": "allowlist",
"allowed\_domains": ["api.buildkite.com"]
},
"memory\_limit": "4g",
"name": "My Container"
}
`
```