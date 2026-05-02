Visual policy editor · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Visual policy editor
Last validated: Mar 13, 2026
The visual policy editor is an alternative way to edit the [human JSON (HuJSON)](https://nigeltao.github.io/blog/2021/json-with-commas-comments.html) syntax of the tailnet policy file with an interactive graphical user interface. You can switch between the visual editor and the JSON editor anytime. Changes you make using the visual editor sync with the JSON editor when you save them.
You can use the visual policy editor for the following tailnet policy file features:
* Access control policies ([grants](/docs/features/access-control/grants))
* [Tailscale SSH](/docs/features/tailscale-ssh) access rules
* [Tests](/docs/reference/syntax/policy-file#tests) and [SSH Tests](/docs/reference/syntax/policy-file#ssh-tests)
* [Groups](/docs/reference/syntax/policy-file#groups)
* [Tags](/docs/features/tags)
* [IP sets](/docs/features/tailnet-policy-file/ip-sets)
* [Hosts](/docs/reference/syntax/policy-file#hosts)
* [Node attributes](/docs/reference/syntax/policy-file#node-attributes)
* [Device posture](/docs/features/device-posture#postures)
* [Auto approvers](/docs/reference/syntax/policy-file#auto-approvers)
To make changes to the [network policy options](/docs/reference/syntax/policy-file#network-options) of the tailnet policy (such as `derpMap`, `disableIPv4`, `OneCGNATRoute`, and `randomizeClientPort`) you must use the JSON editor.
The visual editor translates your configuration choices into the underlying HuJSON policy file format. You can switch between the visual editor and the JSON editor at any time to work with policies in the format that best suits your needs. The bidirectional synchronization ensures that changes in either editor immediately reflect in the other. For a comprehensive understanding of the underlying policy syntax, refer to [Tailscale's policy syntax documentation](/docs/reference/syntax/policy-file).
Go to the [Access controls](https://login.tailscale.com/admin/acls) page of the Tailscale admin console to access the visual editor. The editor displays with the **Visual editor** tab selected by default.
## [Editor modes](#editor-modes)
The visual policy editor supports three distinct operating modes that serve different workflow preferences and requirements. Each mode maintains full compatibility with the underlying [policy file format](/docs/reference/syntax/policy-file) while offering different interaction patterns.
* **Visual editor** lets you manage policies interactively through a graphical user interface. All changes sync immediately with the underlying JSON representation. This mode works best when you need to make targeted changes to specific rules or when you're learning the policy syntax.
* **JSON editor** gives you direct access to the HuJSON policy file with syntax highlighting. This mode suits users who prefer working directly with code or need to make bulk changes. The JSON editor provides full control over policy structure and lets you use advanced features that might not yet have visual interfaces. The JSON editor also includes a **Convert to grants** button that automatically converts your `acls` section to equivalent [grants](/docs/features/access-control/grants). Refer to [Migrate from ACLs to grants](/docs/reference/migrate-acls-grants) for more information.
* **GitOps** mode is when you [manage your tailnet policy file through GitOps](/docs/gitops). In this mode, you can search, filter, and preview potential changes but cannot save modifications. Your version control system remains the single source of truth for policy changes. This mode ensures that all policy modifications go through your established review and approval processes.
To prevent users from editing policies on the admin console when using GitOps, you must lock the editor. To do this, go to [Policy file management](https://login.tailscale.com/admin/settings/policy-file-management) \> **Lock editor**, then enable **Prevent edits in the admin console**.
## [General access rules](#general-access-rules)
General access rules let you manage access between devices in your tailnet using [grants syntax](/docs/features/access-control/grants).
[Manage general access rules using the visual editor](/docs/reference/visual-editor#general-access-rules).
## [Tailscale SSH](#tailscale-ssh)
[Tailscale SSH rules](/docs/features/tailscale-ssh) let you control SSH access to devices in your tailnet without managing SSH keys.
[Manage Tailscale SSH rules using the visual editor](/docs/reference/visual-editor#tailscale-ssh).
## [Groups](#groups)
[Groups](/docs/reference/targets-and-selectors) let you organize users into logical groups for access control management. There are three types of groups: user-defined groups, synced groups from your identity provider, and built-in autogroups.
[Manage groups using the visual editor](/docs/reference/visual-editor#groups).
## [Tags](#tags)
[Tags](/docs/features/tags) provide a way to authenticate and organize non-user devices like servers into functional groups for use in access control policies.
[Manage tags using the visual editor](/docs/reference/visual-editor#tags).
## [IP sets](#ip-sets)
[IP sets](/docs/features/tailnet-policy-file/ip-sets) let you create collections of IP addresses, hosts, and subnets to use in access control policies.
[Manage IP sets using the visual editor](/docs/reference/visual-editor#ip-sets).
## [Hosts](#hosts)
[Hosts](/docs/reference/syntax/policy-file#hosts) are a way to create friendly names for IP addresses and CIDR ranges to improve policy readability by replacing numeric addresses with meaningful identifiers.
[Manage hosts using the visual editor](/docs/reference/visual-editor#hosts).
## [Node attributes](#node-attributes)
[Node attributes](/docs/reference/syntax/policy-file#nodeattrs) let you apply settings and attributes to device to do things like control feature availability and device behavior across your tailnet.
[Manage node attributes using the visual editor](/docs/reference/visual-editor#node-attributes).
## [Device posture](#device-posture)
[Device posture](/docs/features/device-posture) rules let you specify the requirements a device must meet before it can access sensitive resources.
[Manage device posture rules using the visual editor](/docs/reference/visual-editor#device-posture).
## [Auto approvers](#auto-approvers)
[Auto approvers](/docs/reference/syntax/policy-file#autoapprovers) let you create policies to pre-approve specific operations for devices, such as advertising subnet routes or exit nodes, without manual intervention.
[Manage auto approvers using the visual editor](/docs/reference/visual-editor#auto-approvers).
## [Tests](#tests)
[Tests](/docs/reference/syntax/policy-file#tests) validate that access control changes meet expected behavior before saving.
[Manage tests using the visual editor](/docs/reference/visual-editor#tests).
## [Data synchronization](#data-synchronization)
Changes in the visual editor immediately sync to the JSON editor after you save them. This bidirectional synchronization ensures consistency regardless of which editor you use.
GitOps mode prevents modifications to maintain version control as the source of truth. In this mode, use the visual editor to preview and validate changes before committing them to your repository. The read-only mode indicates when GitOps manages your configuration. For GitOps implementation examples, refer to the documentation for [GitHub Actions](/docs/integrations/github/gitops), [GitLab CI](/docs/integrations/gitlab/gitops), and [Bitbucket](/docs/integrations/bitbucket/gitops).
When you use the visual editor, it automatically converts ACL syntax to grants syntax on the backend. Grants syntax supports all the same capabilities as ACL syntax with additional features like [route filtering](/docs/features/access-control/grants/grants-via) and [app capabilities](/docs/features/access-control/grants/grants-app-capabilities). Refer to [grants versus ACLs](/docs/reference/grants-vs-acls) for more information.
### [Finding and filtering](#finding-and-filtering)
All major sections include search fields that filter content in real time. Search works across every visible column in a section. You can find configurations using any identifying information without switching search modes.
The dropdown list arrow in search fields provides additional filtering options:
* Filter by user, group, device, or tag.
* Search by port or IP address.
* Apply multiple filters simultaneously.
Real-time filtering helps manage large policy files efficiently. Type any part of a configuration to display only matching items. This approach eliminates manual scrolling through hundreds of entries.
### [Configuration validation](#configuration-validation)
The visual editor validates your input as you work. This approach lets you work through complex configurations without interruption. Required fields appear without optional labels because they represent the baseline requirement.
Field-specific validation errors appear near the relevant fields, while validation errors that aren't field-specific appear at the top of the page. Examples of these include failed general tests and failed SSH tests.
### [JSON output previews](#json-output-previews)
Most configurations include JSON preview panels showing the HuJSON syntax your selections generate. These previews update immediately as you modify fields. The preview helps you understand how visual selections translate to policy file syntax.
The JSON preview serves several purposes:
* Explore policy file syntax without leaving the visual editor.
* Verify that configurations produce expected output.
* Copy snippets for documentation or team discussions.
* Debug complex configurations by examining generated code.
* Share exact configurations with team members.
The copy button lets you copy the policy JSON to your clipboard for use in version control, documentation, or team collaboration. This feature connects visual and code-based configuration workflows.
JSON previews are available even when the policy file is locked because it's managed through GitOps. You can still view and copy generated HuJSON snippets for reference.
## [Feedback](#feedback)
The visual editor continues to evolve with regular feature additions. Your feedback helps prioritize improvements and identify issues.
Select **Give feedback** from the top of the [Visual editor](https://login.tailscale.com/admin/acls/visual) page to submit suggestions, report bugs, or request features. The product team reviews all submissions and uses them to guide development priorities.
Include specific use cases and workflows in your feedback. The more context you provide, the better the team can understand and address your needs. Screenshots and detailed descriptions help communicate complex issues or feature requests.
On this page
* [Editor modes](#editor-modes)
* [General access rules](#general-access-rules)
* [Tailscale SSH](#tailscale-ssh)
* [Groups](#groups)
* [Tags](#tags)
* [IP sets](#ip-sets)
* [Hosts](#hosts)
* [Node attributes](#node-attributes)
* [Device posture](#device-posture)
* [Auto approvers](#auto-approvers)
* [Tests](#tests)
* [Data synchronization](#data-synchronization)
* [Finding and filtering](#finding-and-filtering)
* [Configuration validation](#configuration-validation)
* [JSON output previews](#json-output-previews)
* [Feedback](#feedback)
Scroll to top