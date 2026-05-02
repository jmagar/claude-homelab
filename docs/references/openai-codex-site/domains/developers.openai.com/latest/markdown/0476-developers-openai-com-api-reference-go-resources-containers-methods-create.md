Create container | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Containers](/api/reference/go/resources/containers)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create container
client.Containers.New(ctx, body) (\*[ContainerNewResponse](</api/reference/go/resources/containers#(resource) containers > (model) ContainerNewResponse > (schema)>), error)
POST/containers
Create Container
##### ParametersExpand Collapse
body ContainerNewParams
Name param.Field[string]
Name of the container to create.
[](<#(resource) containers > (method) create > (params) default > (param) name>)
ExpiresAfter param.Field[[ContainerNewParamsExpiresAfter](</api/reference/go/resources/containers/methods/create#(resource) containers > (method) create > (params) default > (param) expires_after > (schema)>)]Optional
Container expiration time in seconds relative to the ‘anchor’ time.
Anchor string
Time anchor for the expiration time. Currently only ‘last\_active\_at’ is supported.
[](<#(resource) containers > (method) create > (params) default > (param) expires_after > (schema) > (property) anchor>)
Minutes int64
[](<#(resource) containers > (method) create > (params) default > (param) expires_after > (schema) > (property) minutes>)
[](<#(resource) containers > (method) create > (params) default > (param) expires_after>)
FileIDs param.Field[[]string]Optional
IDs of files to copy to the container.
[](<#(resource) containers > (method) create > (params) default > (param) file_ids>)
MemoryLimit param.Field[[ContainerNewParamsMemoryLimit](</api/reference/go/resources/containers/methods/create#(resource) containers > (method) create > (params) default > (param) memory_limit > (schema)>)]Optional
Optional memory limit for the container. Defaults to “1g”.
const ContainerNewParamsMemoryLimit1g [ContainerNewParamsMemoryLimit](</api/reference/go/resources/containers/methods/create#(resource) containers > (method) create > (params) default > (param) memory_limit > (schema)>) = "1g"
[](<#(resource) containers > (method) create > (params) default > (param) memory_limit > (schema) > (member) 0>)
const ContainerNewParamsMemoryLimit4g [ContainerNewParamsMemoryLimit](</api/reference/go/resources/containers/methods/create#(resource) containers > (method) create > (params) default > (param) memory_limit > (schema)>) = "4g"
[](<#(resource) containers > (method) create > (params) default > (param) memory_limit > (schema) > (member) 1>)
const ContainerNewParamsMemoryLimit16g [ContainerNewParamsMemoryLimit](</api/reference/go/resources/containers/methods/create#(resource) containers > (method) create > (params) default > (param) memory_limit > (schema)>) = "16g"
[](<#(resource) containers > (method) create > (params) default > (param) memory_limit > (schema) > (member) 2>)
const ContainerNewParamsMemoryLimit64g [ContainerNewParamsMemoryLimit](</api/reference/go/resources/containers/methods/create#(resource) containers > (method) create > (params) default > (param) memory_limit > (schema)>) = "64g"
[](<#(resource) containers > (method) create > (params) default > (param) memory_limit > (schema) > (member) 3>)
[](<#(resource) containers > (method) create > (params) default > (param) memory_limit>)
NetworkPolicy param.Field[[ContainerNewParamsNetworkPolicyUnion](</api/reference/go/resources/containers/methods/create#(resource) containers > (method) create > (params) default > (param) network_policy > (schema)>)]Optional
Network access policy for the container.
type ContainerNetworkPolicyDisabled struct{…}
Type Disabled
Disable outbound network access. Always `disabled`.
[](<#(resource) responses > (model) container_network_policy_disabled > (schema) > (property) type>)
[](<#(resource) responses > (model) container_network_policy_disabled > (schema)>)
type ContainerNetworkPolicyAllowlist struct{…}
AllowedDomains []string
A list of allowed domains when type is `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) allowed_domains>)
Type Allowlist
Allow outbound network access only to specified domains. Always `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) type>)
DomainSecrets [][ContainerNetworkPolicyDomainSecret](</api/reference/go/resources/responses#(resource) responses > (model) container_network_policy_domain_secret > (schema)>)Optional
Optional domain-scoped secrets for allowlisted domains.
Domain string
The domain associated with the secret.
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) domain>)
Name string
The name of the secret to inject for the domain.
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) name>)
Value string
The secret value to inject for the domain.
maxLength10485760
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) value>)
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) domain_secrets>)
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema)>)
[](<#(resource) containers > (method) create > (params) default > (param) network_policy>)
Skills param.Field[[]ContainerNewParamsSkillUnion]Optional
An optional list of skills referenced by id or inline data.
type SkillReference struct{…}
SkillID string
The ID of the referenced skill.
maxLength64
minLength1
[](<#(resource) responses > (model) skill_reference > (schema) > (property) skill_id>)
Type SkillReference
References a skill created with the /v1/skills endpoint.
[](<#(resource) responses > (model) skill_reference > (schema) > (property) type>)
Version stringOptional
Optional skill version. Use a positive integer or ‘latest’. Omit for default.
[](<#(resource) responses > (model) skill_reference > (schema) > (property) version>)
[](<#(resource) responses > (model) skill_reference > (schema)>)
type InlineSkill struct{…}
Description string
The description of the skill.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) description>)
Name string
The name of the skill.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) name>)
Source [InlineSkillSource](</api/reference/go/resources/responses#(resource) responses > (model) inline_skill_source > (schema)>)
Inline skill payload
Data string
Base64-encoded skill zip bundle.
maxLength70254592
minLength1
[](<#(resource) responses > (model) inline_skill > (schema) > (property) source + (resource) responses > (model) inline_skill_source > (schema) > (property) data>)
MediaType ApplicationZip
The media type of the inline skill payload. Must be `application/zip`.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) source + (resource) responses > (model) inline_skill_source > (schema) > (property) media_type>)
Type Base64
The type of the inline skill source. Must be `base64`.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) source + (resource) responses > (model) inline_skill_source > (schema) > (property) type>)
[](<#(resource) responses > (model) inline_skill > (schema) > (property) source>)
Type Inline
Defines an inline skill for this request.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) type>)
[](<#(resource) responses > (model) inline_skill > (schema)>)
[](<#(resource) containers > (method) create > (params) default > (param) skills>)
[](<#(resource) containers > (method) create > (params) default>)
##### ReturnsExpand Collapse
type ContainerNewResponse struct{…}
ID string
Unique identifier for the container.
[](<#(resource) containers > (model) ContainerNewResponse > (schema) > (property) id>)
CreatedAt int64
Unix timestamp (in seconds) when the container was created.
formatunixtime
[](<#(resource) containers > (model) ContainerNewResponse > (schema) > (property) created_at>)
Name string
Name of the container.
[](<#(resource) containers > (model) ContainerNewResponse > (schema) > (property) name>)
Object string
The type of this object.
[](<#(resource) containers > (model) ContainerNewResponse > (schema) > (property) object>)
Status string
Status of the container (e.g., active, deleted).
[](<#(resource) containers > (model) ContainerNewResponse > (schema) > (property) status>)
ExpiresAfter ContainerNewResponseExpiresAfterOptional
The container will expire after this time period.
The anchor is the reference point for the expiration.
The minutes is the number of minutes after the anchor before the container expires.
Anchor stringOptional
The reference point for the expiration.
[](<#(resource) containers > (model) ContainerNewResponse > (schema) > (property) expires_after > (property) anchor>)
Minutes int64Optional
The number of minutes after the anchor before the container expires.
[](<#(resource) containers > (model) ContainerNewResponse > (schema) > (property) expires_after > (property) minutes>)
[](<#(resource) containers > (model) ContainerNewResponse > (schema) > (property) expires_after>)
LastActiveAt int64Optional
Unix timestamp (in seconds) when the container was last active.
formatunixtime
[](<#(resource) containers > (model) ContainerNewResponse > (schema) > (property) last_active_at>)
MemoryLimit ContainerNewResponseMemoryLimitOptional
The memory limit configured for the container.
One of the following:
const ContainerNewResponseMemoryLimit1g ContainerNewResponseMemoryLimit = "1g"
[](<#(resource) containers > (model) ContainerNewResponse > (schema) > (property) memory_limit > (member) 0>)
const ContainerNewResponseMemoryLimit4g ContainerNewResponseMemoryLimit = "4g"
[](<#(resource) containers > (model) ContainerNewResponse > (schema) > (property) memory_limit > (member) 1>)
const ContainerNewResponseMemoryLimit16g ContainerNewResponseMemoryLimit = "16g"
[](<#(resource) containers > (model) ContainerNewResponse > (schema) > (property) memory_limit > (member) 2>)
const ContainerNewResponseMemoryLimit64g ContainerNewResponseMemoryLimit = "64g"
[](<#(resource) containers > (model) ContainerNewResponse > (schema) > (property) memory_limit > (member) 3>)
[](<#(resource) containers > (model) ContainerNewResponse > (schema) > (property) memory_limit>)
NetworkPolicy ContainerNewResponseNetworkPolicyOptional
Network access policy for the container.
Type string
The network policy mode.
One of the following:
const ContainerNewResponseNetworkPolicyTypeAllowlist ContainerNewResponseNetworkPolicyType = "allowlist"
[](<#(resource) containers > (model) ContainerNewResponse > (schema) > (property) network_policy > (property) type > (member) 0>)
const ContainerNewResponseNetworkPolicyTypeDisabled ContainerNewResponseNetworkPolicyType = "disabled"
[](<#(resource) containers > (model) ContainerNewResponse > (schema) > (property) network_policy > (property) type > (member) 1>)
[](<#(resource) containers > (model) ContainerNewResponse > (schema) > (property) network_policy > (property) type>)
AllowedDomains []stringOptional
Allowed outbound domains when `type` is `allowlist`.
[](<#(resource) containers > (model) ContainerNewResponse > (schema) > (property) network_policy > (property) allowed_domains>)
[](<#(resource) containers > (model) ContainerNewResponse > (schema) > (property) network_policy>)
[](<#(resource) containers > (model) ContainerNewResponse > (schema)>)
### Create container
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
container, err := client.Containers.New(context.TODO(), openai.ContainerNewParams{
Name: "name",
})
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", container.ID)
}
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