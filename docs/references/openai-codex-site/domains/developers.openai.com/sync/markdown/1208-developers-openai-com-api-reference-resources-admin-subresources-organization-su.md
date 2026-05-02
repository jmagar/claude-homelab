List organization certificates | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Admin](/api/reference/resources/admin)
[Organization](/api/reference/resources/admin/subresources/organization)
[Certificates](/api/reference/resources/admin/subresources/organization/subresources/certificates)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# List organization certificates
GET/organization/certificates
List uploaded certificates for this organization.
##### Query ParametersExpand Collapse
after: optional string
A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj\_foo, your subsequent call can include after=obj\_foo in order to fetch the next page of the list.
[](<#(resource) admin.organization.certificates > (method) list > (params) default > (param) after > (schema)>)
limit: optional number
A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.
[](<#(resource) admin.organization.certificates > (method) list > (params) default > (param) limit > (schema)>)
order: optional "asc" or "desc"
Sort order by the `created\_at` timestamp of the objects. `asc` for ascending order and `desc` for descending order.
One of the following:
"asc"
[](<#(resource) admin.organization.certificates > (method) list > (params) default > (param) order > (schema) > (member) 0>)
"desc"
[](<#(resource) admin.organization.certificates > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) admin.organization.certificates > (method) list > (params) default > (param) order > (schema)>)
##### ReturnsExpand Collapse
data: array of [Certificate](</api/reference/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>) { id, certificate\_details, created\_at, 3 more }
id: string
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) id>)
certificate\_details: object { content, expires\_at, valid\_at }
content: optional string
The content of the certificate in PEM format.
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) certificate_details > (property) content>)
expires\_at: optional number
The Unix timestamp (in seconds) of when the certificate expires.
formatunixtime
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) certificate_details > (property) expires_at>)
valid\_at: optional number
The Unix timestamp (in seconds) of when the certificate becomes valid.
formatunixtime
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) certificate_details > (property) valid_at>)
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) certificate_details>)
created\_at: number
The Unix timestamp (in seconds) of when the certificate was uploaded.
formatunixtime
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) created_at>)
name: string
The name of the certificate.
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) name>)
object: "certificate" or "organization.certificate" or "organization.project.certificate"
The object type.
* If creating, updating, or getting a specific certificate, the object type is `certificate`.
* If listing, activating, or deactivating certificates for the organization, the object type is `organization.certificate`.
* If listing, activating, or deactivating certificates for a project, the object type is `organization.project.certificate`.
One of the following:
"certificate"
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) object > (member) 0>)
"organization.certificate"
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) object > (member) 1>)
"organization.project.certificate"
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) object > (member) 2>)
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) object>)
active: optional boolean
Whether the certificate is currently active at the specified scope. Not returned when getting details for a specific certificate.
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) active>)
[](<#(resource) admin.organization.certificates > (method) list > (network schema) > (property) data>)
has\_more: boolean
[](<#(resource) admin.organization.certificates > (method) list > (network schema) > (property) has_more>)
object: "list"
[](<#(resource) admin.organization.certificates > (method) list > (network schema) > (property) object>)
first\_id: optional string
[](<#(resource) admin.organization.certificates > (method) list > (network schema) > (property) first_id>)
last\_id: optional string
[](<#(resource) admin.organization.certificates > (method) list > (network schema) > (property) last_id>)
### List organization certificates
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
`curl https://api.openai.com/v1/organization/certificates \\
-H "Authorization: Bearer $OPENAI\_ADMIN\_KEY"
`
```
```
`{
"object": "list",
"data": [
{
"object": "organization.certificate",
"id": "cert\_abc",
"name": "My Example Certificate",
"active": true,
"created\_at": 1234567,
"certificate\_details": {
"valid\_at": 12345667,
"expires\_at": 12345678
}
},
],
"first\_id": "cert\_abc",
"last\_id": "cert\_abc",
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
"object": "organization.certificate",
"id": "cert\_abc",
"name": "My Example Certificate",
"active": true,
"created\_at": 1234567,
"certificate\_details": {
"valid\_at": 12345667,
"expires\_at": 12345678
}
},
],
"first\_id": "cert\_abc",
"last\_id": "cert\_abc",
"has\_more": false
}
`
```