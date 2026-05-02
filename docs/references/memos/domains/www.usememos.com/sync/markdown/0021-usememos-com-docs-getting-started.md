Getting Started - Memos
[Memos](/)
Search
⌘K
Documentation
[Documentation](/docs)
Getting Started
[Getting Started](/docs/getting-started)
Deploy
Configuration
Usage
Operations
Development
Integrations
Admin
Troubleshooting
[FAQ](/docs/faq)
[](https://github.com/usememos/memos)
Getting Started
# Getting Started
Run Memos locally, create the first admin user, and publish your first memo.
Memos is designed to be usable within minutes. The shortest path is Docker with SQLite and a local data volume, then you can harden deployment and storage once the instance is up.
## [Prerequisite](#prerequisite)
* Docker installed on the machine running Memos
## [1. Start a local instance](#1-start-a-local-instance)
```
`docker run -d \\
--name memos \\
-p 5230:5230 \\
-v \~/.memos:/var/opt/memos \\
neosmemo/memos:stable`
```
What this gives you:
* `5230` exposed on the host
* a persistent data directory at `\~/.memos`
* SQLite by default
* one container that is easy to inspect and replace
If you want a checked-in deployment file, use [Docker Compose](/docs/deploy/docker-compose). If you are contributing or need a custom build, use [Build From Source](/docs/deploy/development).
## [2. Verify the instance](#2-verify-the-instance)
Open the UI after the container starts:
* Docker default: `http://localhost:5230`
* Binary default: `http://localhost:8081`
If you want to verify the service from the terminal first:
```
`docker logs memos`
```
## [3. Create the first admin account](#3-create-the-first-admin-account)
The first user becomes the host admin and can configure registration, authentication, storage, and other global settings.
Recommended first actions:
* use a strong password
* confirm the instance URL if the app will sit behind a reverse proxy
* decide whether user registration should remain disabled or be opened later
* decide whether public memos should be allowed at all
## [4. Create your first memo](#4-create-your-first-memo)
Use the editor at the top of the home page and try a memo that exercises the main features:
```
`# Welcome to Memos
This is my first memo.
## Tasks
- [x] Install Memos
- [ ] Write a real note
## Tags
Trying #memos and #getting-started
## Code
```ts
console.log("hello from memos");
````
```
Useful things to try immediately:
* set memo visibility to `PRIVATE`, `PROTECTED`, or `PUBLIC`
* add a checklist with `- [ ]`
* upload a screenshot or document
* create tags inline with `#tagname`
* pin an important memo so it stays visible
## [5. Understand visibility](#5-understand-visibility)
Each memo uses one of three visibility levels:
* `PRIVATE`: only you can read it
* `PROTECTED`: authenticated users on the instance can read it
* `PUBLIC`: anyone with access to the URL can read it
For a private team or personal instance, disabling public memos is often the safest default.
## [6. Explore the core workflows](#6-explore-the-core-workflows)
After the first memo, the next high-value workflows are:
* [Writing Markdown](/docs/usage/writing-markdown)
* [Tags](/docs/usage/tags)
* [Shortcuts](/docs/usage/shortcuts)
* [Sharing](/docs/usage/sharing)
* [Attachments](/docs/usage/attachments)
## [Keyboard shortcuts](#keyboard-shortcuts)
|Shortcut|Action|
|`Ctrl+Enter` / `Cmd+Enter`|Post current memo|
|`Escape`|Clear editor|
|`Ctrl+K` / `Cmd+K`|Focus search|
|`/`|Focus memo editor|
|`Ctrl+B` / `Cmd+B`|Bold text|
|`Ctrl+I` / `Cmd+I`|Italic text|
## [Common first-run issues](#common-first-run-issues)
* If `http://localhost:5230` does not load, check `docker logs memos`.
* If the data directory is not writable, verify permissions on `\~/.memos`.
* If you run behind a reverse proxy, set `MEMOS\_INSTANCE\_URL` to the public URL.
[
Documentation
Practical guides for installing, configuring, and using Memos.
](/docs)[
Deploy
Install and run Memos in local, server, and production environments.
](/docs/deploy)
### On this page
[Prerequisite](#prerequisite)[1. Start a local instance](#1-start-a-local-instance)[2. Verify the instance](#2-verify-the-instance)[3. Create the first admin account](#3-create-the-first-admin-account)[4. Create your first memo](#4-create-your-first-memo)[5. Understand visibility](#5-understand-visibility)[6. Explore the core workflows](#6-explore-the-core-workflows)[Keyboard shortcuts](#keyboard-shortcuts)[Common first-run issues](#common-first-run-issues)