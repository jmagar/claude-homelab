Gemini CLI extensions | Gemini CLI
[Skip to content](#_top)
# Gemini CLI extensions
Copy as Markdown Copied!
Gemini CLI extensions package prompts, MCP servers, custom commands, themes,
hooks, sub-agents, and agent skills into a familiar and user-friendly format.
With extensions, you can expand the capabilities of Gemini CLI and share those
capabilities with others. They are designed to be easily installable and
shareable.
To see what’s possible, browse the
[Gemini CLI extension gallery](https://geminicli.com/extensions/browse/).
## Choose your path
[Section titled “Choose your path”](#choose-your-path)
Choose the guide that best fits your needs.
### I want to use extensions
[Section titled “I want to use extensions”](#i-want-to-use-extensions)
Learn how to discover, install, and manage extensions to enhance your Gemini CLI
experience.
* **[Manage extensions](#manage-extensions):** List and verify your installed
extensions.
* **[Install extensions](#installation):** Add new capabilities from GitHub or
local paths.
### I want to build extensions
[Section titled “I want to build extensions”](#i-want-to-build-extensions)
Learn how to create, test, and share your own extensions with the community.
* **[Build extensions](/docs/extensions/writing-extensions):** Create your first extension
from a template.
* **[Best practices](/docs/extensions/best-practices):** Learn how to build secure and
reliable extensions.
* **[Publish to the gallery](/docs/extensions/releasing):** Share your work with the world.
## Manage extensions
[Section titled “Manage extensions”](#manage-extensions)
Use the interactive `/extensions` command to verify your installed extensions
and their status:
Terminal window
```
`
/extensions list
`
```
You can also manage extensions from your terminal using the `gemini extensions`
command group:
Terminal window
```
`
gemini extensions list
`
```
## Installation
[Section titled “Installation”](#installation)
Install an extension by providing its GitHub repository URL. For example:
Terminal window
```
`
gemini extensions install https://github.com/gemini-cli-extensions/workspace
`
```
For more advanced installation options, see the
[Extension reference](/docs/extensions/reference#install-an-extension).
Last updated: Feb 17, 2026
This website uses [cookies](https://policies.google.com/technologies/cookies) from Google to deliver and enhance the quality of its services and to analyze
traffic.
I understand.