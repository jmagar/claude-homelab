OpenAI Terraform Provider | OpenAI API Reference
[Skip to content](#_top)
# OpenAI Terraform Provider
# OpenAI Terraform Provider
The [OpenAI Terraform provider](https://registry.terraform.io/providers/stainless-sdks/openai/latest/docs) provides convenient access to
the [OpenAI REST API](https://platform.openai.com/docs) from Terraform.
## Requirements
This provider requires Terraform CLI 1.0 or later. You can [install it for your system](https://developer.hashicorp.com/terraform/install)
on Hashicorp’s website.
## Usage
Add the following to your `main.tf` file:
```
`# Declare the provider and version
terraform {
required\_providers {
SDK\_ProviderTypeName = {
source = "stainless-sdks/openai"
version = "\~\> 0.0.1"
}
}
}
# Initialize the provider
provider "openai" {
api\_key = "My API Key" # or set OPENAI\_API\_KEY env variable
admin\_api\_key = "My Admin API Key" # or set OPENAI\_ADMIN\_KEY env variable
organization = "My Organization" # or set OPENAI\_ORG\_ID env variable
project = "My Project" # or set OPENAI\_PROJECT\_ID env variable
webhook\_secret = "My Webhook Secret" # or set OPENAI\_WEBHOOK\_SECRET env variable
}
# Configure a resource
resource "openai\_chat\_completion" "example\_chat\_completion" {
messages = [{
content = "Say this is a test"
role = "user"
name = "name"
}]
model = "gpt-4o"
audio = {
format = "wav"
voice = "string"
}
frequency\_penalty = -2
function\_call = "none"
functions = [{
name = "name"
description = "description"
parameters = {
foo = "bar"
}
}]
logit\_bias = {
foo = 0
}
logprobs = true
max\_completion\_tokens = 0
max\_tokens = 0
metadata = {
foo = "string"
}
modalities = ["text"]
n = 1
parallel\_tool\_calls = true
prediction = {
content = "string"
type = "content"
}
presence\_penalty = -2
prompt\_cache\_key = "prompt-cache-key-1234"
prompt\_cache\_retention = "in\_memory"
reasoning\_effort = "none"
response\_format = {
type = "text"
}
safety\_identifier = "safety-identifier-1234"
seed = -9007199254740991
service\_tier = "auto"
stop = \<\<EOT
EOT
store = true
stream = false
stream\_options = {
include\_obfuscation = true
include\_usage = true
}
temperature = 1
tool\_choice = "none"
tools = [{
function = {
name = "name"
description = "description"
parameters = {
foo = "bar"
}
strict = true
}
type = "function"
}]
top\_logprobs = 0
top\_p = 1
user = "user-1234"
verbosity = "low"
web\_search\_options = {
search\_context\_size = "low"
user\_location = {
approximate = {
city = "city"
country = "country"
region = "region"
timezone = "timezone"
}
type = "approximate"
}
}
}`
```
Initialize your project by running `terraform init` in the directory.
Additional examples can be found in the [./examples](https://github.com/stainless-sdks/openai-terraform/tree/main/./examples) folder within this repository, and you can
refer to the full documentation on [the Terraform Registry](https://registry.terraform.io/providers/stainless-sdks/openai/latest/docs).
### Provider Options
When you initialize the provider, the following options are supported. It is recommended to use environment variables for sensitive values like access tokens.
If an environment variable is provided, then the option does not need to be set in the terraform source.
|Property|Environment variable|Required|Default value|
|webhook\_secret|`OPENAI\_WEBHOOK\_SECRET`|false|—|
|project|`OPENAI\_PROJECT\_ID`|false|—|
|organization|`OPENAI\_ORG\_ID`|false|—|
|api\_key|`OPENAI\_API\_KEY`|false|—|
|admin\_api\_key|`OPENAI\_ADMIN\_KEY`|false|—|
## Semantic versioning
This package generally follows [SemVer](https://semver.org/spec/v2.0.0.html) conventions, though certain backwards-incompatible changes may be released as minor versions:
1. Changes to library internals which are technically public but not intended or documented for external use. *(Please open a GitHub issue to let us know if you are relying on such internals.)*
2. Changes that we do not expect to impact the vast majority of users in practice.
We take backwards-compatibility seriously and work hard to ensure you can rely on a smooth upgrade experience.
We are keen for your feedback; please open an [issue](https://www.github.com/stainless-sdks/openai-terraform/issues) with questions, bugs, or suggestions.
## Contributing
See [the contributing documentation](https://github.com/stainless-sdks/openai-terraform/tree/main/./CONTRIBUTING.md).