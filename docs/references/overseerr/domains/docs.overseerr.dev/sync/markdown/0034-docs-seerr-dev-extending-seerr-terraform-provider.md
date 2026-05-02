Terraform/OpenTofu Provider (Advanced) | Seerr
[Skip to main content](#__docusaurus_skipToContent_fallback)
On this page
warning
This provider is maintained by the community, not by the Seerr team. Please report bugs or feature requests in the [provider repository](https://github.com/Josh-Archer/terraform-provider-seerr).
The community-maintained [Seerr Terraform/OpenTofu provider](https://search.opentofu.org/provider/josh-archer/seerr/latest) can manage Seerr settings and integrations from infrastructure-as-code workflows.
## Basic Example[​](#basic-example)
Configure the provider with your Seerr URL and API key, then manage Seerr resources in the same configuration as the rest of your infrastructure.
```
`terraform {
required\_providers {
seerr = {
source = "registry.opentofu.org/josh-archer/seerr"
}
}
}
variable "seerr\_api\_key" {
type = string
sensitive = true
}
provider "seerr" {
url = "https://seerr.example.com"
api\_key = var.seerr\_api\_key
insecure\_skip\_verify = false # Set to true for self-signed certificates.
}
resource "seerr\_main\_settings" "main" {
app\_title = "Seerr"
application\_url = "https://seerr.example.com"
locale = "en"
movie\_requests\_enabled = true
series\_requests\_enabled = true
}
`
```
The provider also includes resources and data sources for common Seerr integrations:
* Plex
* Jellyfin
* Emby
* Radarr
* Sonarr
* Tautulli
* Notifications
* Users
* Permissions
* Requests
* Issues
* Background job schedules
* And many more.
* [Basic Example](#basic-example)