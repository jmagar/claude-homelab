Build From Source (Advanced) | Seerr
[Skip to main content](#__docusaurus_skipToContent_fallback)
On this page
warning
This method is not recommended for most users. It is intended for advanced users who are familiar with managing their own server infrastructure.
Refer to [Configuring Databases](/extending-seerr/database-config#postgresql-options) for details on how to configure your database.
### Prerequisites[​](#prerequisites)
* [Node.js 22.x](https://nodejs.org/en/download/)
* [Pnpm 10.x](https://pnpm.io/installation)
* [Git](https://git-scm.com/downloads)
## Unix (Linux, macOS)[​](#unix-linux-macos)
### Installation[​](#installation)
1. Assuming you want the working directory to be `/opt/seerr`, create the directory and navigate to it:
```
`sudo mkdir -p /opt/seerr && cd /opt/seerr
`
```
1. Clone the Seerr repository and checkout the main branch:
```
`git clone https://github.com/seerr-team/seerr.git .
git checkout main
`
```
1. Install the dependencies:
```
`CYPRESS\_INSTALL\_BINARY=0 pnpm install --frozen-lockfile
`
```
1. Build the project:
```
`pnpm build
`
```
1. Start Seerr:
```
`pnpm start
`
```
info
You can now access Seerr by visiting `http://localhost:5055` in your web browser.
#### Extending the installation[​](#extending-the-installation)
* Linux
* macOS
* PM2
To run seerr as a systemd service:
1. create the environment file at `/etc/seerr/seerr.conf`:
```
`## Seerr's default port is 5055, if you want to use both, change this.
## specify on which port to listen
PORT=5055
## specify on which interface to listen, by default seerr listens on all interfaces
#HOST=127.0.0.1
## Uncomment if you want to force Node.js to resolve IPv4 before IPv6 (advanced users only)
# FORCE\_IPV4\_FIRST=true
`
```
1. Then run the following commands:
```
`which node
`
```
Copy the path to node, it should be something like `/usr/bin/node`.
1. Create the systemd service file at `/etc/systemd/system/seerr.service`, using either `sudo systemctl edit seerr` or `sudo nano /etc/systemd/system/seerr.service`:
```
`[Unit]
Description=Seerr Service
Wants=network-online.target
After=network-online.target
[Service]
EnvironmentFile=/etc/seerr/seerr.conf
Environment=NODE\_ENV=production
Type=exec
Restart=on-failure
WorkingDirectory=/opt/seerr
ExecStart=/usr/bin/node dist/index.js
[Install]
WantedBy=multi-user.target
`
```
note
If you are using a different path to node, replace `/usr/bin/node` with the path to node.
1. Enable and start the service:
```
`sudo systemctl enable seerr
sudo systemctl start seerr
`
```
## Windows[​](#windows)
### Installation[​](#installation-1)
1. Assuming you want the working directory to be `C:\\seerr`, create the directory and navigate to it:
```
`mkdir C:\\seerr
cd C:\\seerr
`
```
1. Clone the Seerr repository and checkout the main branch:
```
`git clone https://github.com/seerr-team/seerr.git .
git checkout main
`
```
1. Install the dependencies:
```
`npm install -g win-node-env
$env:CYPRESS\_INSTALL\_BINARY = 0; pnpm install --frozen-lockfile
`
```
1. Build the project:
```
`pnpm build
`
```
1. Start Seerr:
```
`pnpm start
`
```
tip
You can add the environment variables to a `.env` file in the Seerr directory.
info
You can now access Seerr by visiting `http://localhost:5055` in your web browser.
#### Extending the installation[​](#extending-the-installation-1)
* Task Scheduler
* NSSM
* PM2
To run seerr as a bat script:
1. Create a file named `start-seerr.bat` in the seerr directory:
```
`@echo off
set PORT=5055
set NODE\_ENV=production
node dist/index.js
`
```
1. Create a task in Task Scheduler:
* Open Task Scheduler
* Click on "Create Basic Task"
* Name the task "Seerr"
* Set the trigger to "When the computer starts"
* Set the action to "Start a program"
* Set the program/script to the path of the `start-seerr.bat` file
* Set the "Start in" to the seerr directory.
* Click "Finish"
Now, Seerr will start when the computer boots up in the background.
### Updating[​](#updating)
To update Seerr, navigate to the Seerr directory and run the following commands:
```
`git pull
`
```
Then, follow the steps in the installation section to rebuild and restart Seerr.
* [Prerequisites](#prerequisites)
* [Unix (Linux, macOS)](#unix-linux-macos)
* [Installation](#installation)
* [Windows](#windows)
* [Installation](#installation-1)
* [Updating](#updating)