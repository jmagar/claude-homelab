Configuration | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Configuration
Apprise configuration is built around a single core abstraction: **`AppriseConfig`**.
This object is responsible for loading, resolving, and producing notification service definitions that can be consumed by the Apprise CLI, the Apprise-API, or embedded Python applications.
Unlike notification services, configuration does **not** send messages. It defines *what* can send messages, *how* they are grouped, and *how* they are discovered.
## AppriseConfig
[Section titled “AppriseConfig”](#appriseconfig)
`AppriseConfig` is the central configuration loader used throughout Apprise.
It is responsible for:
* Loading notification definitions from one or more sources
* Resolving `include` directives
* Applying tag-based filtering
* Producing a unified configuration that can be consumed by Apprise
Every Apprise execution, regardless of interface, ultimately operates on an `AppriseConfig` instance.
```
`
from apprise import Apprise, AppriseConfig
apprise = Apprise()
config = AppriseConfig()
config.add('config.yml')
apprise.add(config)
apprise.notify(
title='Status',
body='All systems operational',
)
`
```
## Common Configuration Patterns
[Section titled “Common Configuration Patterns”](#common-configuration-patterns)
* [ Single Configuration Source ](#tab-panel-59)
* [ Multiple Configuration Sources ](#tab-panel-60)
* [ Remote Configuration Source ](#tab-panel-61)
```
`
from apprise import Apprise, AppriseConfig
apprise = Apprise()
config = AppriseConfig()
config.add('config.yml')
apprise.add(config)
apprise.notify(
title='Single Config',
body='Loaded from one configuration source',
)
`
```
## Configuration Sources
[Section titled “Configuration Sources”](#configuration-sources)
An `AppriseConfig` instance may load configuration from multiple sources. Each source is processed and merged into a single effective configuration.
Supported sources include:
* Local files
* Remote URLs
* In-memory configuration
* Inline configuration content
Each source is treated uniformly by the configuration engine, regardless of origin.
## Configuration Formats
[Section titled “Configuration Formats”](#configuration-formats)
Apprise supports both text and YAML configuration files. The formats are functionally equivalent, but structured differently.
For a side-by-side explanation and examples, see [Getting Started: Configuration](../../getting-started/configuration/).
## Includes
[Section titled “Includes”](#includes)
The `include` directive allows one configuration source to reference another.
Includes are resolved recursively and may be used to:
* Share common notification definitions
* Centralise configuration
* Layer environment-specific configuration
* Reduce duplication
From the perspective of `AppriseConfig`, an include is simply another configuration source to load and merge.
Includes may reference:
* Local files
* Remote URLs
Includes are resolved in the order they are encountered.
## Layering and Precedence
[Section titled “Layering and Precedence”](#layering-and-precedence)
Configuration sources are processed sequentially.
Later sources may:
* Add new notification definitions
* Extend existing entries
* Refine tags and routing behaviour
Apprise does not impose a fixed base-or-override model. All configuration entries are additive unless explicitly filtered or constrained by tags.
## Cross-Include Safety Rules
[Section titled “Cross-Include Safety Rules”](#cross-include-safety-rules)
To prevent unsafe or unintended configuration behaviour, Apprise applies safety rules when resolving includes.
These rules control whether a configuration source may include another source of a different type.
For example:
* A local file may include another local file
* A remote configuration source may be restricted from including arbitrary local files
* Recursive include depth is limited to prevent infinite loops
These rules are enforced by the configuration engine and may vary depending on the host environment.
## Authenticated Remote Configuration Sources
[Section titled “Authenticated Remote Configuration Sources”](#authenticated-remote-configuration-sources)
Remote configuration sources may require authentication.
When using HTTP or HTTPS URLs, basic authentication credentials can be embedded directly into the URL:
```
`
config = AppriseConfig()
config.add('https://user:pass@apprise.example.com/cfg/mykey')
`
```
When provided in this form, credentials are used automatically when retrieving the configuration.
Embedding credentials directly in URLs may expose them through logs, shell history, or process listings.
When possible, prefer alternative authentication mechanisms or ensure access to configuration URLs is appropriately restricted.
## Security and Trust Boundaries
[Section titled “Security and Trust Boundaries”](#security-and-trust-boundaries)
`AppriseConfig` itself does **not** enforce security policy.
It is responsible for loading and resolving configuration, but **trust decisions are enforced by the host environment**.
For example:
* The Apprise CLI may allow unrestricted local includes
* A running Apprise-API server may restrict which configuration sources are permitted
* Embedded applications may impose their own security constraints
If a configuration source is rejected due to host policy, it is excluded before being merged into the final configuration.
## Apprise-API Configuration Locking
[Section titled “Apprise-API Configuration Locking”](#apprise-api-configuration-locking)
When configuration is hosted by an Apprise-API instance, additional security controls may apply.
An Apprise-API server may enable configuration locking to prevent remote clients from loading server-side configuration.
When configuration locking is enabled:
* Remote configuration includes targeting the Apprise-API are rejected
* Configuration endpoints cannot be consumed by external clients
* Only locally-defined configuration is permitted
This behaviour is enforced **by the Apprise-API server**, not by `AppriseConfig` itself.
Configuration locking exists to prevent:
* Accidental credential exposure
* Unauthorized configuration discovery
* Server-side request forgery (SSRF)
Configuration locking does **not** affect:
* Local configuration files
* In-memory configuration
* Custom configuration sources hosted outside of Apprise-API
## Tagging and Filtering
[Section titled “Tagging and Filtering”](#tagging-and-filtering)
Configuration entries may be associated with one or more tags.
Tags are used to control which notification services are selected when a message is sent.
Filtering may be applied to:
* Include only matching tags
* Always include untagged services
* Combine multiple tags using OR or AND semantics
Tag resolution is performed at notification time, not during configuration loading.
When sending through the Python library, `notify(tag=...)` follows these rules:
|`notify(tag=...)` expression|Selected services|
|`"TagA"`|Has `TagA`|
|`"TagA,TagB"`|Has `TagA`**AND**`TagB`|
|`["TagA", "TagB"]`|Has `TagA`**OR**`TagB`|
|`["TagA,TagC", "TagB"]`|Has (`TagA`**AND**`TagC`) **OR**`TagB`|
Lists are evaluated as **OR** groups. To express **AND** programmatically,
use a comma-separated string inside the `tag` argument.
## Next Steps
[Section titled “Next Steps”](#next-steps)
* For CLI usage and flags, see the [CLI documentation](../../cli/)
* For Apprise-API endpoints and security controls, see the [Apprise-API documentation](../../api/)
* For notification service definitions, see [Assets](.././assets/)
Questions or Feedback?
#### Documentation
Notice a typo or an error?
[
Report it
](https://github.com/caronc/apprise-docs/issues/)
or
[
contribute a fix
](https://github.com/caronc/apprise-docs)
.
#### Technical Issues
Having trouble with the code? Open an issue on GitHub:
* [
Apprise Core & CLI
](https://github.com/caronc/apprise/issues/)
* [
Apprise API
](https://github.com/caronc/apprise-api/issues/)
Made with love from Canada