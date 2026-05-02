Fail2Ban | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Fail2Ban
Fail2ban is a log-monitoring service that detects suspicious behaviour, such as repeated authentication failures, and automatically blocks offending IP addresses.
Apprise integrates with Fail2ban as a notification action, allowing you to receive alerts through any of Apprise’s supported services, including email, push notifications, chat platforms, and webhooks.
This guide assumes:
* A fresh Fail2ban installation
* systemd is available
* A single host configuration
* sshd is the first service being monitored
Distribution-specific paths and advanced jail configurations are intentionally deferred.
## Prerequisites
[Section titled “Prerequisites”](#prerequisites)
Before you begin, ensure the following are installed:
* Fail2ban
* Apprise (CLI)
* Apprise API is optional (if configuration is centralized)
Verify both are available:
Terminal window
```
`
fail2ban-client --version
apprise --version
`
```
## Installing Fail2ban
[Section titled “Installing Fail2ban”](#installing-fail2ban)
On most systems, Fail2ban is available via the system package manager.
Enable and start the service:
Terminal window
```
`
sudo systemctl enable fail2ban
sudo systemctl start fail2ban
`
```
Verify it is running:
Terminal window
```
`
sudo systemctl status fail2ban
`
```
## Configuring Apprise
[Section titled “Configuring Apprise”](#configuring-apprise)
Be sure to be comfortable with [Apprise Configuration Files](/getting-started/configuration/) and know which [service(s)](/services/) you plan on using. We will choose to assign the tag `fail2ban` to all of the end points we wish to be notified if an event occurs:
/etc/fail2ban/apprise.conf
```
`
# Define our fail2ban configuration tag, and assign it to a Discord webhook
# as an example for the purpose of this guide. But you can use any
# service you want.
fail2ban=discord://4174216298/JHMHI8qBe7bk2ZwO5U711o3dV\_js
`
```
:::
## Configuring Apprise for Fail2ban
[Section titled “Configuring Apprise for Fail2ban”](#configuring-apprise-for-fail2ban)
For your convenience, this guide detected your public address as ` `Detecting your IP...` `. If this is the workstation you will remote into your server from, you may wish to add this to the `ignore=` line.
Add the following to `/etc/fail2ban/jail.local`
/etc/fail2ban/jail.local
```
`
[DEFAULT]
# ignoreip acts as a safelist; requests coming from these IPs are imune to
# Fail2Ban monitoring. Each entry is separated by a space (' ').
# You only want to specify safe access points:
# - 127.0.0.1/8 : Localhost (this PC); you don't want Fail2Ban banning internal
# requests.. this one is safe to add. the `/8` is safe to leave
# on the end of the IP for this entry.
# - YOUR\_IP/32 : If you are accessing your server running Fail2Ban remotely, then
# replace the 'YOUR\_IP/32' entry below with 'your actual IP address'.
# make sure to add `/32` if an IPv4 address or `/128` if it is an
# IPv6 address.
ignoreip = 127.0.0.1/8 YOUR\_IP/32
# how far back to look
findtime = 5m
# ban if we trigger on 4 failed authenticate within the findtime
maxretry = 4
# ban time; how long do we restrict this user from our system for?
bantime = 1d
#
# Now we define our Apprise Action
#
# - Read from /etc/fail2ban/apprise.conf
# - Only notify end points tagged with 'fail2ban'
#
action = apprise[config="/etc/fail2ban/apprise.conf", args="--tag fail2ban"]
#
# Now we will define our jails
#
[sshd]
enabled = true
port = ssh
logpath = %(sshd\_log)s
backend = %(sshd\_backend)s
# Optionally over-ride our defaults above
maxretry = 5
findtime = 10m
bantime = 1h
# The below entry is not nessisary as it's defined in the [DEFAULT] section above
# but this is to show that you could also define another entry here as well
# and assign it a different set of tags.
action = apprise[config="/etc/fail2ban/apprise.conf", args="--tag fail2ban"]
`
```
You can easily leverage an Apprise API instance by setting:
```
`
action = apprise[config="http://api.example.ca:8000/cfg/apprise-key", args="--tag fail2ban"]
`
```
Restart Fail2ban:
Terminal window
```
`
sudo systemctl restart fail2ban
`
```
Verify the jail is active:
Terminal window
```
`
sudo fail2ban-client status sshd
`
```
## Testing Your Setup
[Section titled “Testing Your Setup”](#testing-your-setup)
Trigger a test ban by exceeding authentication attempts, or simulate manually:
Terminal window
```
`
sudo fail2ban-client set sshd banip 203.0.113.10
`
```
You should receive an Apprise notification immediately.
## Troubleshooting
[Section titled “Troubleshooting”](#troubleshooting)
View Fail2ban logs:
Terminal window
```
`
journalctl -u fail2ban
`
```
Increase verbosity for Apprise actions (by adding `-vv` and test to see what might be going on:
Terminal window
```
`
apprise -vv --tag fail2ban --config /etc/fail2ban/apprise.conf \\
--body "fail2ban trigger test"
`
```
Confirm Apprise URLs independently before debugging Fail2ban.
## Useful Tips
[Section titled “Useful Tips”](#useful-tips)
Fail2ban is amazing, but it can be tedious to use at times. Sometimes it helps to have a few handy notes on the side to troubleshoot with:
Terminal window
```
`
# See all jails:
fail2ban-client status
# Look into the status of one of the specific jails
fail2ban-client status sshd
# quick and dirty way to unban an IP (regardless of which jail banned it)
fail2ban-client unban 1.2.3.4
`
```
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