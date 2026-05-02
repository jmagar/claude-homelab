Apprise Docs | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Apprise Docs
## Contributing to Apprise Documentation
[Section titled “Contributing to Apprise Documentation”](#contributing-to-apprise-documentation)
We welcome documentation improvements! Please follow the guidelines below to help us review and
merge your contributions smoothly.
## Retrieve from GitHub
[Section titled “Retrieve from GitHub”](#retrieve-from-github)
Terminal window
```
`
# Acquire the documentation source from its official resting spot on GitHub
git clone git@github.com:caronc/apprise-docs.git
`
```
## Repository Layout
[Section titled “Repository Layout”](#repository-layout)
All documentation lives under the `locales/` directory.
Each locale mirrors the same structure so navigation remains predictable across languages.
```
`
locales/
\<locale\>/
index.md
getting-started/
guides/
services/
\<service\>/
index.md
config/
qa/
dev/
contributing/
assets/
`
```
### Directory Guide
[Section titled “Directory Guide”](#directory-guide)
* **Getting Started** (`getting-started/`)
Introductory material for new users
* **Guides** (`guides/`)
How-to articles, workflows, best practices, and troubleshooting patterns
* **Config** (`config/`)
Configuration syntax and reference material
* **QA** (`qa/`)
Troubleshooting, diagnostics, and FAQs
* **Dev** (`dev/`)
Developer-focused documentation and internals
* **Contributing** (`contributing/`)
How to help improve Apprise and its ecosystem
* **Services** (`services/`)
Documentation specific to a notification service, including URL syntax,
configuration options, and examples
## Getting Started as a Contributor
[Section titled “Getting Started as a Contributor”](#getting-started-as-a-contributor)
### Prerequisites
[Section titled “Prerequisites”](#prerequisites)
* Node.js (LTS recommended)
* `pnpm` (version pinned in `package.json`)
* Git
### Quick Start
[Section titled “Quick Start”](#quick-start)
1. Install dependencies:
Terminal window
```
`
pnpm install
`
```
2. Make your documentation changes
Add, edit, or improve any Markdown file.
3. Run validation:
Terminal window
```
`
pnpm lint
`
```
Most formatting issues can be fixed automatically with:
Terminal window
```
`
pnpm lint:fix
`
```
4. Open a pull request 🎉
>
> If linting fails, it will tell you exactly what needs attention.
>
## Adding or Improving a Service
[Section titled “Adding or Improving a Service”](#adding-or-improving-a-service)
Each service lives at:
```
`
locales/\<locale\>/services/\<service\>/index.md
`
```
Optionally, a service may include an `images/` directory for logos or diagrams.
```
`
services/\<service\>/
├── index.md
└── images/
└── logo.svg
`
```
### Service Logos
[Section titled “Service Logos”](#service-logos)
Service logos are optional, but encouraged when an official logo is available.
* Supported formats: `.svg`, `.png`, `.jpg`, `.jpeg`
* Raster images should not exceed:
* **200px height**
* **440px width**
If present, logos are automatically rendered on the service page.
## Service Page Template
[Section titled “Service Page Template”](#service-page-template)
Each service page starts with a frontmatter block that describes its capabilities.
This metadata is **used to generate the Overview section automatically** on the site.
A minimal example:
```
`
---
title: "Example Notifications"
description: "Send notifications using Example"
sidebar:
label: "Example"
source: https://example.com
group: general
schemas:
- example://
sample\_urls:
- example://{token}/
- example://{token}/{target}
---
\<!-- SERVICE:DETAILS --\>
## Account Setup
How to get set up with Example
## Syntax
Valid syntax is as follows:
- `example://{token}`
- `example://{token}/{target}`
## Parameter Breakdown
| Variable | Required | Description |
| -------- | -------- | ---------------------------------------------------------------------------------------------- |
| token | yes | Token to access the example server |
| target | no | The target you wish to notify. If no target is specified, we send a notification to ourselves. |
### Global Parameters
| Variable | Description |
| -------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| overflow | This parameter can be set to either `split`, `truncate`, or `upstream`. This determines how Apprise delivers the message you pass it. By default this is set to `upstream` \<br/\> 👉 `upstream`: Do nothing at all; pass the message exactly as you received it to the service.\<br/\> 👉 `truncate`: Ensure that the message will fit within the service's documented upstream message limit. If more information was passed then the defined limit, the overhead information is truncated.\<br/\> 👉 `split`: similar to truncate except if the message doesn't fit within the service's documented upstream message limit, it is split into smaller chunks and they are all delivered sequentially there-after. |
| format | This parameter can be set to either `text`, `html`, or `markdown`. Some services support the ability to post content by several different means. The default of this varies (it can be one of the 3 mentioned at any time depending on which service you choose). You can optionally force this setting to stray from the defaults if you wish. If the service doesn't support different types of transmission formats, then this field is ignored. |
| verify | External requests made to secure locations (such as through the use of `https`) will have certificates associated with them. By default, Apprise will verify that these certificates are valid; if they are not then no notification will be sent to the source. In some occasions, a user might not have a certificate authority to verify the key against or they trust the source; in this case you will want to set this flag to `no`. By default it is set to `yes`. |
| cto | This stands for Socket Connect Timeout. This is the number of seconds Requests will wait for your client to establish a connection to a remote machine (corresponding to the \_connect()\_) call on the socket. The default value is 4.0 seconds. |
| rto | This stands for Socket Read Timeout. This is the number of seconds the client will wait for the server to send a response. The default value is 4.0 seconds. |
| emojis | Enable Emoji support (such as providing `:+1:` would translate to 👍). By default this is set to `no`. \<br/\>\*\*Note:\*\* Depending on server side settings, the administrator has the power to disable emoji support at a global level; but default this is not the case. |
| tz | Identify the IANA Time Zone Database you wish to operate as. By default this is detected based on the configuration the server hosting Apprise is running on. You can set this to things like `America/Toronto`, or any other properly formated Timezone describing your area. |
## Example
Send a Example notification:
```bash
apprise -vv -t "My Title" -b "Message Body" \\
"example://my-token/target"
```
`
```
>
> The markers such as
`> &#x3C;!-- SERVICE:DETAILS -->
`> are intentional and must be left in place.
> They are replaced automatically when the documentation is rendered.
>
If you created an `mdx` file instead, you can use `{/\* SERVICE:DETAILS \*}` or `{/\_ SERVICE:DETAILS \_/}` insead, e.g.: `{/\*- SERVICE:DETAILS \*/}`
## Localization and Translations
[Section titled “Localization and Translations”](#localization-and-translations)
* Each language lives under `locales/\<locale\>/`
* English (`en`) is the default
* Translations may be partial and incremental
* Prefer relative links between docs pages inside a locale
* Avoid root-absolute internal docs links such as `/services/` or `/url-builder/` in translated content
* Root-absolute shared assets such as `/assets/...` are fine when they are intentionally global
Examples:
```
`
[Supported Services](../services/)
[URL Builder](../url-builder/)
![Service Logo](./images/logo.svg)
`
```
The site build includes a safeguard that rewrites locale-local internal links
for non-default locales during sync, but contributors should still author
locale-safe links in source content whenever practical.
Even partial translations are welcome.
## Linting and Validation
[Section titled “Linting and Validation”](#linting-and-validation)
This repository uses automated checks to ensure:
* Consistent Markdown formatting
* Supported frontmatter keys and structure
* Predictable rendering on the website
Linting exists to **help contributors**, not to block them. Most failures are
formatting or unsupported metadata issues and are easy to fix.
## How You Can Help
[Section titled “How You Can Help”](#how-you-can-help)
* Improve documentation for a service you use
* Clarify confusing sections
* Add examples
* Fix typos or formatting issues
* Translate content into another language
If you are unsure where something belongs, open an issue and ask.
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