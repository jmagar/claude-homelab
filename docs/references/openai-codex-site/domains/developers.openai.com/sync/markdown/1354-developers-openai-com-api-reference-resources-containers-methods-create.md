Create container | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Containers](/api/reference/resources/containers)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create container
POST/containers
Create Container
##### Body ParametersJSONExpand Collapse
name: string
Name of the container to create.
[](<#(resource) containers > (method) create > (params) 0 > (param) name > (schema)>)
expires\_after: optional object { anchor, minutes }
Container expiration time in seconds relative to the ‘anchor’ time.
anchor: "last\_active\_at"
Time anchor for the expiration time. Currently only ‘last\_active\_at’ is supported.
[](<#(resource) containers > (method) create > (params) 0 > (param) expires_after > (schema) > (property) anchor>)
minutes: number
[](<#(resource) containers > (method) create > (params) 0 > (param) expires_after > (schema) > (property) minutes>)
[](<#(resource) containers > (method) create > (params) 0 > (param) expires_after > (schema)>)
file\_ids: optional array of string
IDs of files to copy to the container.
[](<#(resource) containers > (method) create > (params) 0 > (param) file_ids > (schema)>)
memory\_limit: optional "1g" or "4g" or "16g" or "64g"
Optional memory limit for the container. Defaults to “1g”.
One of the following:
"1g"
[](<#(resource) containers > (method) create > (params) 0 > (param) memory_limit > (schema) > (member) 0>)
"4g"
[](<#(resource) containers > (method) create > (params) 0 > (param) memory_limit > (schema) > (member) 1>)
"16g"
[](<#(resource) containers > (method) create > (params) 0 > (param) memory_limit > (schema) > (member) 2>)
"64g"
[](<#(resource) containers > (method) create > (params) 0 > (param) memory_limit > (schema) > (member) 3>)
[](<#(resource) containers > (method) create > (params) 0 > (param) memory_limit > (schema)>)
network\_policy: optional [ContainerNetworkPolicyDisabled](</api/reference/resources/responses#(resource) responses > (model) container_network_policy_disabled > (schema)>) { type } or [ContainerNetworkPolicyAllowlist](</api/reference/resources/responses#(resource) responses > (model) container_network_policy_allowlist > (schema)>) { allowed\_domains, type, domain\_secrets }
Network access policy for the container.
One of the following:
ContainerNetworkPolicyDisabled object { type }
type: "disabled"
Disable outbound network access. Always `disabled`.
[](<#(resource) responses > (model) container_network_policy_disabled > (schema) > (property) type>)
[](<#(resource) responses > (model) container_network_policy_disabled > (schema)>)
ContainerNetworkPolicyAllowlist object { allowed\_domains, type, domain\_secrets }
allowed\_domains: array of string
A list of allowed domains when type is `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) allowed_domains>)
type: "allowlist"
Allow outbound network access only to specified domains. Always `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) type>)
domain\_secrets: optional array of [ContainerNetworkPolicyDomainSecret](</api/reference/resources/responses#(resource) responses > (model) container_network_policy_domain_secret > (schema)>) { domain, name, value }
Optional domain-scoped secrets for allowlisted domains.
domain: string
The domain associated with the secret.
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) domain>)
name: string
The name of the secret to inject for the domain.
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) name>)
value: string
The secret value to inject for the domain.
maxLength10485760
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) value>)
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) domain_secrets>)
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema)>)
[](<#(resource) containers > (method) create > (params) 0 > (param) network_policy > (schema)>)
skills: optional array of [SkillReference](</api/reference/resources/responses#(resource) responses > (model) skill_reference > (schema)>) { skill\_id, type, version } or [InlineSkill](</api/reference/resources/responses#(resource) responses > (model) inline_skill > (schema)>) { description, name, source, type }
An optional list of skills referenced by id or inline data.
One of the following:
SkillReference object { skill\_id, type, version }
skill\_id: string
The ID of the referenced skill.
maxLength64
minLength1
[](<#(resource) responses > (model) skill_reference > (schema) > (property) skill_id>)
type: "skill\_reference"
References a skill created with the /v1/skills endpoint.
[](<#(resource) responses > (model) skill_reference > (schema) > (property) type>)
version: optional string
Optional skill version. Use a positive integer or ‘latest’. Omit for default.
[](<#(resource) responses > (model) skill_reference > (schema) > (property) version>)
[](<#(resource) responses > (model) skill_reference > (schema)>)
InlineSkill object { description, name, source, type }
description: string
The description of the skill.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) description>)
name: string
The name of the skill.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) name>)
source: [InlineSkillSource](</api/reference/resources/responses#(resource) responses > (model) inline_skill_source > (schema)>) { data, media\_type, type }
Inline skill payload
data: string
Base64-encoded skill zip bundle.
maxLength70254592
minLength1
[](<#(resource) responses > (model) inline_skill > (schema) > (property) source + (resource) responses > (model) inline_skill_source > (schema) > (property) data>)
media\_type: "application/zip"
The media type of the inline skill payload. Must be `application/zip`.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) source + (resource) responses > (model) inline_skill_source > (schema) > (property) media_type>)
type: "base64"
The type of the inline skill source. Must be `base64`.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) source + (resource) responses > (model) inline_skill_source > (schema) > (property) type>)
[](<#(resource) responses > (model) inline_skill > (schema) > (property) source>)
type: "inline"
Defines an inline skill for this request.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) type>)
[](<#(resource) responses > (model) inline_skill > (schema)>)
[](<#(resource) containers > (method) create > (params) 0 > (param) skills > (schema)>)
##### ReturnsExpand Collapse
id: string
Unique identifier for the container.
[](<#(resource) containers > (model) container_create_response > (schema) > (property) id>)
created\_at: number
Unix timestamp (in seconds) when the container was created.
formatunixtime
[](<#(resource) containers > (model) container_create_response > (schema) > (property) created_at>)
name: string
Name of the container.
[](<#(resource) containers > (model) container_create_response > (schema) > (property) name>)
object: string
The type of this object.
[](<#(resource) containers > (model) container_create_response > (schema) > (property) object>)
status: string
Status of the container (e.g., active, deleted).
[](<#(resource) containers > (model) container_create_response > (schema) > (property) status>)
expires\_after: optional object { anchor, minutes }
The container will expire after this time period.
The anchor is the reference point for the expiration.
The minutes is the number of minutes after the anchor before the container expires.
anchor: optional "last\_active\_at"
The reference point for the expiration.
[](<#(resource) containers > (model) container_create_response > (schema) > (property) expires_after > (property) anchor>)
minutes: optional number
The number of minutes after the anchor before the container expires.
[](<#(resource) containers > (model) container_create_response > (schema) > (property) expires_after > (property) minutes>)
[](<#(resource) containers > (model) container_create_response > (schema) > (property) expires_after>)
last\_active\_at: optional number
Unix timestamp (in seconds) when the container was last active.
formatunixtime
[](<#(resource) containers > (model) container_create_response > (schema) > (property) last_active_at>)
memory\_limit: optional "1g" or "4g" or "16g" or "64g"
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
network\_policy: optional object { type, allowed\_domains }
Network access policy for the container.
type: "allowlist" or "disabled"
The network policy mode.
One of the following:
"allowlist"
[](<#(resource) containers > (model) container_create_response > (schema) > (property) network_policy > (property) type > (member) 0>)
"disabled"
[](<#(resource) containers > (model) container_create_response > (schema) > (property) network_policy > (property) type > (member) 1>)
[](<#(resource) containers > (model) container_create_response > (schema) > (property) network_policy > (property) type>)
allowed\_domains: optional array of string
Allowed outbound domains when `type` is `allowlist`.
[](<#(resource) containers > (model) container_create_response > (schema) > (property) network_policy > (property) allowed_domains>)
[](<#(resource) containers > (model) container_create_response > (schema) > (property) network_policy>)
### Create container
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
-H "Authorization: Bearer $OPENAI\_API\_KEY" \\
-H "Content-Type: application/json" \\
-d '{
"name": "My Container",
"memory\_limit": "4g",
"skills": [
{
"type": "skill\_reference",
"skill\_id": "skill\_4db6f1a2c9e73508b41f9da06e2c7b5f"
},
{
"type": "skill\_reference",
"skill\_id": "openai-spreadsheets",
"version": "latest"
}
],
"network\_policy": {
"type": "allowlist",
"allowed\_domains": ["api.buildkite.com"]
}
}'
`
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