Upgrading to Python 3 (Tautulli v2.5) · Tautulli/Tautulli Wiki · GitHub
[Skip to content](#start-of-content)
{{ message }}
[
Tautulli
](/Tautulli)
/
**
[Tautulli](/Tautulli/Tautulli)
**
Public
*
* [ Notifications
](/login?return_to=/Tautulli/Tautulli) You must be signed in to change notification settings
* [ Fork
623
](/login?return_to=/Tautulli/Tautulli)
*
[
Star
6.5k
](/login?return_to=/Tautulli/Tautulli)
# Upgrading to Python 3 (Tautulli v2.5)
[Jump to bottom](#wiki-pages-box)
JonnyWong16 edited this page Feb 9, 2021
&middot;
[9 revisions](/Tautulli/Tautulli/wiki/Upgrading-to-Python-3-(Tautulli-v2.5)/_history)
### Operating Systems:
[](#operating-systems)
* [Windows / macOS](#windows--macos)
* [Linux](#linux)
* [FreeBSD / FreeNAS](#freebsd--freenas)
## Windows / macOS
[](#windows--macos)
### Important changes
[](#important-changes)
Running Tautulli in the background on startup can be enabled by checking Tautulli Settings \> Web Interface \> Launch at System Startup.
* **Warning**: Make sure to remove any previous Tautulli shortcut from your startup folder or task in Windows Task Scheduler on Windows, or `.plist` files in your `LaunchAgents` folder on macOS, to prevent conflicts with the Tautulli setting! Refer to the deprecated instructions in the [Install as a Daemon](/Tautulli/Tautulli/wiki/Install-as-a-daemon) page.
### Reinstalling Tautulli using the app installer (recommended)
[](#reinstalling-tautulli-using-the-app-installer-recommended)
* Tautulli v2.5 and above can be installed on Windows or macOS (10.14 or newer) *without* needing to install Python. You can download the new Windows `.exe` or macOS `.pkg` installer from the [GitHub Releases page](https://github.com/Tautulli/Tautulli/releases/latest).
#### Instructions:
[](#instructions)
1. Go to the Tautulli Settings \> Help & Info page.
2. Click on the "Database File" link to download a copy of your Tautulli database.
3. Click on the "Configuration File" link to download a copy of your Tautulli configuration.
4. Shutdown Tautulli.
5. Install Tautulli using the Windows `.exe` or macOS `.pkg` installer.
6. Start Tautulli and complete the setup wizard.
7. Go to the Tautulli Settings \> Import & Backup page and re-import the database file (using the "Overwrite" method) and configuration file that you saved in the steps above.
8. Once you have the database imported and Tautulli successfully configured, you may uninstall the previous version of Tautulli by deleting the old folder (Windows: `C:\\Tautulli` or macOS: `/Applications/Tautulli`).
#### Notes:
[](#notes)
* Python still needs to be installed if you are running Python script notifications.
* To update Tautulli using the app installer, just download and run the new installer when a new update is available.
## Linux
[](#linux)
### Reinstalling Tautulli using the Snap package (recommended)
[](#reinstalling-tautulli-using-the-snap-package-recommended)
* Tautulli v2.6.3 and above can be installed on most Linux distributions using the Snap package *without* needing to install Python.
#### Instructions:
[](#instructions-1)
1. Go to the Tautulli Settings \> Help & Info page.
2. Click on the "Database File" link to download a copy of your Tautulli database.
3. Click on the "Configuration File" link to download a copy of your Tautulli configuration.
4. Shutdown Tautulli.
5. Install Tautulli using `snap` by following the [Installation](/Tautulli/Tautulli/wiki/Installation#linux) instructions.
6. Start Tautulli and complete the setup wizard.
7. Go to the Tautulli Settings \> Import & Backup page and re-import the database file (using the "Overwrite" method) and configuration file that you saved in the steps above.
8. Once you have the database imported and Tautulli successfully configured, you may uninstall the previous version of Tautulli by deleting the old folder (`/opt/Tautulli`) and the old service file (`/lib/systemd/system/tautulli.service`).
#### Notes:
[](#notes-1)
* Python still needs to be installed if you are running Python script notifications.
* Snap packages update automatically outside of Tautulli.
### Modifying an existing Tautulli install (alternative)
[](#modifying-an-existing-tautulli-install-alternative)
* This will update an existing Tautulli systemd service script that is using Python 2 to Python 3.
#### Instructions:
[](#instructions-2)
1. Make sure Tautulli is shutdown or run `sudo systemctl stop tautulli.service`.
2. Get the path to your `python3` interpreter using `command -v python3`.
* Note: You may need to replace `python3` with the correct value for your system (e.g. `python3.7`).
* Edit `/lib/systemd/system/tautulli.service`.
* Add the path to your `python3` interpreter from step 1 to the start of the `ExecStart=` command (e.g. `/usr/bin/python3`).
* Example:
```
`ExecStart=/usr/bin/python3 /opt/Tautulli/Tautulli.py --config /opt/Tautulli/config.ini --datadir /opt/Tautulli --quiet --daemon --nolaunch
`
```
* Start Tautulli with `sudo systemctl daemon-reload && sudo systemctl start tautulli.service`.
#### Notes:
[](#notes-2)
* If Tautulli will not start with the error `ImportError: bad magic number in 'pkg\_resources'`, run the `clean\_pyc.sh` file inside the Tautulli `contrib` folder.
```
`cd /opt/Tautulli/contrib
./clean\_pyc.sh
`
```
## FreeBSD / FreeNAS
[](#freebsd--freenas)
### Modifying an existing Tautulli install
[](#modifying-an-existing-tautulli-install)
* This will update an existing Tautulli service script that is using Python 2 to Python 3.
#### Instructions:
[](#instructions-3)
1. Make sure Tautulli is shutdown or run `service tautulli stop`.
2. Install all the prerequisites from the [Installation](/Tautulli/Tautulli/wiki/Installation#freebsd--freenas) instructions.
3. Remove the old symbolic link to Python 2 with `rm /usr/local/bin/python`.
4. Create a new symbolic link to Python 3 with `ln -s /usr/local/bin/python3 /usr/local/bin/python`.
5. Check the python version with `python -V` and it should say Python 3.7.x.
6. Edit `/usr/local/etc/rc.d/tautulli`.
7. Add `command\_interpreter="python"` above the `command` line (line 41).
* Example:
```
`command\_interpreter="python"
command="${tautulli\_dir}/Tautulli.py"
command\_args="--daemon --pidfile ${tautulli\_pid} --quiet --nolaunch ${tautulli\_flags}"
`
```
* Start Tautulli with `service tautulli start`.
#### Notes:
[](#notes-3)
* If Tautulli will not start with the error `ImportError: bad magic number in 'pkg\_resources'`, run the `clean\_pyc.sh` file inside the Tautulli `contrib` folder.
```
`cd /usr/local/share/Tautulli/contrib
./clean\_pyc.sh
`
```
* [Home](/Tautulli/Tautulli/wiki/Home)
* [Installation](/Tautulli/Tautulli/wiki/Installation)
* [Upgrading to Python 3 (Tautulli v2.5)](/Tautulli/Tautulli/wiki/Upgrading-to-Python-3-(Tautulli-v2.5))
* [Asking for Support](/Tautulli/Tautulli/wiki/Asking-for-Support)
* [Frequently Asked Questions](/Tautulli/Tautulli/wiki/Frequently-Asked-Questions)
* [Notification Agents Guide](/Tautulli/Tautulli/wiki/Notification-Agents-Guide)
* [Custom Notification Conditions](/Tautulli/Tautulli/wiki/Custom-Notification-Conditions)
* [Exporter Guide](/Tautulli/Tautulli/wiki/Exporter-Guide)
* [3rd Party APIs Guide](/Tautulli/Tautulli/wiki/3rd-Party-APIs-Guide)
* [Debugging](/Tautulli/Tautulli/wiki/Debugging)
* [Custom Scripts](/Tautulli/Tautulli/wiki/Custom-Scripts)
* [Tautulli API Reference](/Tautulli/Tautulli/wiki/Tautulli-API-Reference)
### Clone this wiki locally