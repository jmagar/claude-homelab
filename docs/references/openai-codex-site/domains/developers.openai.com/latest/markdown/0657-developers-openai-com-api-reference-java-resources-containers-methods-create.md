Create container | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Containers](/api/reference/java/resources/containers)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create container
[ContainerCreateResponse](</api/reference/java/resources/containers#(resource) containers > (model) ContainerCreateResponse > (schema)>) containers().create(ContainerCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/containers
Create Container
##### ParametersExpand Collapse
ContainerCreateParams params
String name
Name of the container to create.
[](<#(resource) containers > (method) create > (params) default > (param) body > (schema) > (property) name>)
Optional\<ExpiresAfter\> expiresAfter
Container expiration time in seconds relative to the ‘anchor’ time.
Anchor anchor
Time anchor for the expiration time. Currently only ‘last\_active\_at’ is supported.
[](<#(resource) containers > (method) create > (params) default > (param) body > (schema) > (property) expires_after > (property) anchor>)
long minutes
[](<#(resource) containers > (method) create > (params) default > (param) body > (schema) > (property) expires_after > (property) minutes>)
[](<#(resource) containers > (method) create > (params) default > (param) body > (schema) > (property) expires_after>)
Optional\<List\<String\>\> fileIds
IDs of files to copy to the container.
[](<#(resource) containers > (method) create > (params) default > (param) body > (schema) > (property) file_ids>)
Optional\<MemoryLimit\> memoryLimit
Optional memory limit for the container. Defaults to “1g”.
\_1G("1g")
[](<#(resource) containers > (method) create > (params) default > (param) body > (schema) > (property) memory_limit > (member) 0>)
\_4G("4g")
[](<#(resource) containers > (method) create > (params) default > (param) body > (schema) > (property) memory_limit > (member) 1>)
\_16G("16g")
[](<#(resource) containers > (method) create > (params) default > (param) body > (schema) > (property) memory_limit > (member) 2>)
\_64G("64g")
[](<#(resource) containers > (method) create > (params) default > (param) body > (schema) > (property) memory_limit > (member) 3>)
[](<#(resource) containers > (method) create > (params) default > (param) body > (schema) > (property) memory_limit>)
Optional\<NetworkPolicy\> networkPolicy
Network access policy for the container.
class ContainerNetworkPolicyDisabled:
JsonValue; type "disabled"constant"disabled"constant
Disable outbound network access. Always `disabled`.
[](<#(resource) responses > (model) container_network_policy_disabled > (schema) > (property) type>)
[](<#(resource) responses > (model) container_network_policy_disabled > (schema)>)
class ContainerNetworkPolicyAllowlist:
List\<String\> allowedDomains
A list of allowed domains when type is `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) allowed_domains>)
JsonValue; type "allowlist"constant"allowlist"constant
Allow outbound network access only to specified domains. Always `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) type>)
Optional\<List\<[ContainerNetworkPolicyDomainSecret](</api/reference/java/resources/responses#(resource) responses > (model) container_network_policy_domain_secret > (schema)>)\>\> domainSecrets
Optional domain-scoped secrets for allowlisted domains.
String domain
The domain associated with the secret.
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) domain>)
String name
The name of the secret to inject for the domain.
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) name>)
String value
The secret value to inject for the domain.
maxLength10485760
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) value>)
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) domain_secrets>)
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema)>)
[](<#(resource) containers > (method) create > (params) default > (param) body > (schema) > (property) network_policy>)
Optional\<List\<Skill\>\> skills
An optional list of skills referenced by id or inline data.
class SkillReference:
String skillId
The ID of the referenced skill.
maxLength64
minLength1
[](<#(resource) responses > (model) skill_reference > (schema) > (property) skill_id>)
JsonValue; type "skill\_reference"constant"skill\_reference"constant
References a skill created with the /v1/skills endpoint.
[](<#(resource) responses > (model) skill_reference > (schema) > (property) type>)
Optional\<String\> version
Optional skill version. Use a positive integer or ‘latest’. Omit for default.
[](<#(resource) responses > (model) skill_reference > (schema) > (property) version>)
[](<#(resource) responses > (model) skill_reference > (schema)>)
class InlineSkill:
String description
The description of the skill.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) description>)
String name
The name of the skill.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) name>)
[InlineSkillSource](</api/reference/java/resources/responses#(resource) responses > (model) inline_skill_source > (schema)>) source
Inline skill payload
String data
Base64-encoded skill zip bundle.
maxLength70254592
minLength1
[](<#(resource) responses > (model) inline_skill > (schema) > (property) source + (resource) responses > (model) inline_skill_source > (schema) > (property) data>)
JsonValue; mediaType "application/zip"constant"application/zip"constant
The media type of the inline skill payload. Must be `application/zip`.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) source + (resource) responses > (model) inline_skill_source > (schema) > (property) media_type>)
JsonValue; type "base64"constant"base64"constant
The type of the inline skill source. Must be `base64`.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) source + (resource) responses > (model) inline_skill_source > (schema) > (property) type>)
[](<#(resource) responses > (model) inline_skill > (schema) > (property) source>)
JsonValue; type "inline"constant"inline"constant
Defines an inline skill for this request.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) type>)
[](<#(resource) responses > (model) inline_skill > (schema)>)
[](<#(resource) containers > (method) create > (params) default > (param) body > (schema) > (property) skills>)
[](<#(resource) containers > (method) create > (params) default>)
##### ReturnsExpand Collapse
class ContainerCreateResponse:
String id
Unique identifier for the container.
[](<#(resource) containers > (model) ContainerCreateResponse > (schema) > (property) id>)
long createdAt
Unix timestamp (in seconds) when the container was created.
formatunixtime
[](<#(resource) containers > (model) ContainerCreateResponse > (schema) > (property) created_at>)
String name
Name of the container.
[](<#(resource) containers > (model) ContainerCreateResponse > (schema) > (property) name>)
String object\_
The type of this object.
[](<#(resource) containers > (model) ContainerCreateResponse > (schema) > (property) object>)
String status
Status of the container (e.g., active, deleted).
[](<#(resource) containers > (model) ContainerCreateResponse > (schema) > (property) status>)
Optional\<ExpiresAfter\> expiresAfter
The container will expire after this time period.
The anchor is the reference point for the expiration.
The minutes is the number of minutes after the anchor before the container expires.
Optional\<Anchor\> anchor
The reference point for the expiration.
[](<#(resource) containers > (model) ContainerCreateResponse > (schema) > (property) expires_after > (property) anchor>)
Optional\<Long\> minutes
The number of minutes after the anchor before the container expires.
[](<#(resource) containers > (model) ContainerCreateResponse > (schema) > (property) expires_after > (property) minutes>)
[](<#(resource) containers > (model) ContainerCreateResponse > (schema) > (property) expires_after>)
Optional\<Long\> lastActiveAt
Unix timestamp (in seconds) when the container was last active.
formatunixtime
[](<#(resource) containers > (model) ContainerCreateResponse > (schema) > (property) last_active_at>)
Optional\<MemoryLimit\> memoryLimit
The memory limit configured for the container.
One of the following:
\_1G("1g")
[](<#(resource) containers > (model) ContainerCreateResponse > (schema) > (property) memory_limit > (member) 0>)
\_4G("4g")
[](<#(resource) containers > (model) ContainerCreateResponse > (schema) > (property) memory_limit > (member) 1>)
\_16G("16g")
[](<#(resource) containers > (model) ContainerCreateResponse > (schema) > (property) memory_limit > (member) 2>)
\_64G("64g")
[](<#(resource) containers > (model) ContainerCreateResponse > (schema) > (property) memory_limit > (member) 3>)
[](<#(resource) containers > (model) ContainerCreateResponse > (schema) > (property) memory_limit>)
Optional\<NetworkPolicy\> networkPolicy
Network access policy for the container.
Type type
The network policy mode.
One of the following:
ALLOWLIST("allowlist")
[](<#(resource) containers > (model) ContainerCreateResponse > (schema) > (property) network_policy > (property) type > (member) 0>)
DISABLED("disabled")
[](<#(resource) containers > (model) ContainerCreateResponse > (schema) > (property) network_policy > (property) type > (member) 1>)
[](<#(resource) containers > (model) ContainerCreateResponse > (schema) > (property) network_policy > (property) type>)
Optional\<List\<String\>\> allowedDomains
Allowed outbound domains when `type` is `allowlist`.
[](<#(resource) containers > (model) ContainerCreateResponse > (schema) > (property) network_policy > (property) allowed_domains>)
[](<#(resource) containers > (model) ContainerCreateResponse > (schema) > (property) network_policy>)
[](<#(resource) containers > (model) ContainerCreateResponse > (schema)>)
### Create container
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
import com.openai.models.containers.ContainerCreateParams;
import com.openai.models.containers.ContainerCreateResponse;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
ContainerCreateParams params = ContainerCreateParams.builder()
.name("name")
.build();
ContainerCreateResponse container = client.containers().create(params);
}
}`
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