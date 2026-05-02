Setup Environment | Gotify
[Skip to content](#VPContent)
Menu
Return to top
# Setup Environment [​](#setup-environment)
Gotify requires:
* Go 1.18 or newer
* Node 16.x or newer
* Yarn 1.9 or newer## Clone sources [​](#clone-sources)
Clone gotify server source from git:
bash
```
`$ git clone https://github.com/gotify/server.git && cd server`
```
## Setup Backend [​](#setup-backend)
Download dependencies
bash
```
`$ make download-tools`
```
## Setup UI [​](#setup-ui)
*Commands must be executed inside the ui directory.*
Download dependencies with [yarn](https://github.com/yarnpkg/yarn).
bash
```
`$ yarn`
```