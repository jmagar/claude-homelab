Gemini CLI installation, execution, and releases | Gemini CLI
[Skip to content](#_top)
# Gemini CLI installation, execution, and releases
Copy as Markdown Copied!
This document provides an overview of Gemini CLI’s system requirements,
installation methods, and release types.
## Recommended system specifications
[Section titled “Recommended system specifications”](#recommended-system-specifications)
* **Operating System:**
* macOS 15+
* Windows 11 24H2+
* Ubuntu 20.04+
* **Hardware:**
* “Casual” usage: 4GB+ RAM (short sessions, common tasks and edits)
* “Power” usage: 16GB+ RAM (long sessions, large codebases, deep context)
* **Runtime:** Node.js 20.0.0+
* **Shell:** Bash, Zsh, or PowerShell
* **Location:**
[Gemini Code Assist supported locations](https://developers.google.com/gemini-code-assist/resources/available-locations#americas)
* **Internet connection required**
## Install Gemini CLI
[Section titled “Install Gemini CLI”](#install-gemini-cli)
We recommend most users install Gemini CLI using one of the following
installation methods. Note that Gemini CLI comes pre-installed on
[**Cloud Shell**](https://docs.cloud.google.com/shell/docs) and
[**Cloud Workstations**](https://cloud.google.com/workstations).
* [ npm ](#tab-panel-18)
* [ Homebrew (macOS/Linux) ](#tab-panel-19)
* [ MacPorts (macOS) ](#tab-panel-20)
* [ Anaconda ](#tab-panel-21)
Install globally with npm:
Terminal window
```
`
npm install -g @google/gemini-cli
`
```
## Run Gemini CLI
[Section titled “Run Gemini CLI”](#run-gemini-cli)
For most users, we recommend running Gemini CLI with the `gemini` command:
Terminal window
```
`
gemini
`
```
For a list of options and additional commands, see the
[CLI cheatsheet](/docs/cli/cli-reference).
You can also run Gemini CLI using one of the following advanced methods:
* [ npx ](#tab-panel-25)
* [ Docker/Podman Sandbox ](#tab-panel-26)
* [ From source ](#tab-panel-27)
Run instantly with npx. You can run Gemini CLI without permanent installation.
Terminal window
```
`
# Using npx (no installation required)
npx @google/gemini-cli
`
```
You can also execute the CLI directly from the main branch on GitHub, which is
helpful for testing features still in development:
Terminal window
```
`
npx https://github.com/google-gemini/gemini-cli
`
```
## Releases
[Section titled “Releases”](#releases)
Gemini CLI has three release channels: stable, preview, and nightly. For most
users, we recommend the stable release, which is the default installation.
* [ Stable ](#tab-panel-22)
* [ Preview ](#tab-panel-23)
* [ Nightly ](#tab-panel-24)
Stable releases are published each week. A stable release is created from the
previous week’s preview release along with any bug fixes. The stable release
uses the `latest` tag. Omitting the tag also installs the latest stable
release by default.
Terminal window
```
`
# Both commands install the latest stable release.
npm install -g @google/gemini-cli
npm install -g @google/gemini-cli@latest
`
```
Last updated: Apr 17, 2026
This website uses [cookies](https://policies.google.com/technologies/cookies) from Google to deliver and enhance the quality of its services and to analyze
traffic.
I understand.