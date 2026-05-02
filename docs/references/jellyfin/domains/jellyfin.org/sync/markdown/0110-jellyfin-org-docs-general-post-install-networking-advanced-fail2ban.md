fail2ban | Jellyfin
[Skip to main content](#__docusaurus_skipToContent_fallback)
On this page
[Fail2ban](https://github.com/fail2ban/fail2ban) is an intrusion prevention software framework that protects computer servers from brute-force attacks.
Fail2ban operates by monitoring log files (e.g. /var/log/auth.log, /var/log/apache/access.log, etc.) for selected entries and running scripts based on their content.
Jellyfin produces logs that can be monitored by Fail2ban to prevent brute-force attacks on your machine.
## Requirements[​](#requirements)
* Jellyfin remotely accessible
* Fail2ban installed and running
* Knowing where the logs for Jellyfin are stored: by default `/var/log/jellyfin/` for desktop and `/config/log/` for docker containers.
* Jellyfin log level set to `Info` (failed authentication entries are not logged at `Error`). This setting is can be found in `logging.json`
## Step one: create the jail[​](#step-one-create-the-jail)
You need to create a jail for Fail2ban. If you're on Ubuntu and use nano as editor, run:
```
`
sudoedit /etc/fail2ban/jail.d/jellyfin.local
`
```
Add this to the new file, replacing `/path\_to\_logs` with the path to the log files above, e.g. `/var/log/jellyfin/`:
```
`
[jellyfin]
backend = auto
enabled = true
port = 80,443
protocol = tcp
filter = jellyfin
maxretry = 3
bantime = 86400
findtime = 43200
logpath = /path\_to\_logs/log\_\*.log
`
```
Save and exit nano.
Note:
1. If Jellyfin is running in a docker container, add the following to the `jellyfin.local` file:
```
`
action = iptables-allports[name=jellyfin, chain=DOCKER-USER]
`
```
2. If you're running Jellyfin on a non-standard port, then change the port from `80,443` to the relevant port say `8096,8920`
## Step two: create the filter[​](#step-two-create-the-filter)
The filter contains a set of rules which Fail2ban will use to identify a failed authentication attempt. Create the filter by running:
```
`
sudoedit /etc/fail2ban/filter.d/jellyfin.conf
`
```
Paste:
```
`
[Definition]
failregex = ^.\*Authentication request for .\* has been denied \\(IP: "\<ADDR\>"\\)\\.
`
```
Save and exit, then reload Fail2ban:
```
`
sudo systemctl restart fail2ban
`
```
Check fail2ban is running:
```
`
sudo systemctl status fail2ban
`
```
## Step three: test[​](#step-three-test)
Assuming you've at least one failed authentication attempt, you can test this new jail with `fail2ban-regex`:
```
`
sudo fail2ban-regex /path\_to\_logs/log\_\*.log /etc/fail2ban/filter.d/jellyfin.conf --print-all-matched
`
```
## Advanced Fail2Ban Setup: Forwarding and Managing Bans on an Upstream Proxy Server[​](#advanced-fail2ban-setup-forwarding-and-managing-bans-on-an-upstream-proxy-server)
To enhance security, Fail2Ban can manage IP bans on an upstream reverse proxy server instead of directly on the Jellyfin server. This setup allows you to block malicious IPs closer to your network’s entry point, potentially benefiting other services using the same proxy.
This guide offers a configuration for setting up Fail2Ban to manage IP bans on an upstream reverse proxy server using **Dynamic Chains**, where each Fail2Ban jail creates and manages its own `iptables` chain on the upstream server.
### Assumptions[​](#assumptions)
* **Fail2Ban** is installed on your local server (where Jellyfin is running).
* **iptables** is configured on the upstream server.
### Step one: Set Up SSH Key-Based Authentication[​](#step-one-set-up-ssh-key-based-authentication)
Ensure the Fail2Ban server can SSH into the upstream server without needing a password. This is crucial for automating the IP ban/unban process.
Replace `\<upstream-server-ip\>` with the actual IP address of your upstream server.
1. **Generate SSH Key (if not already done):**
```
`
ssh-keygen -t rsa -b 4096 -f /root/.ssh/id\_rsa
`
```
2. **Copy the SSH Key to the Upstream Server:**
```
`
ssh-copy-id -i /root/.ssh/id\_rsa.pub root@\<upstream-server-ip\>
`
```
3. **Test SSH Access:**
Ensure the SSH connection works without needing a password:
```
`
ssh -i /root/.ssh/id\_rsa root@\<upstream-server-ip\>
`
```
### Step two: Configure Fail2Ban for Dynamic Chains[​](#step-two-configure-fail2ban-for-dynamic-chains)
1. **Create the Fail2Ban Action File**:
On the Fail2Ban server, create a new action file:
```
`
sudo nano /etc/fail2ban/action.d/proxy-iptables-dynamic.conf
`
```
And add the Following Configuration, which will dynamically create, manage, and remove `iptables` chains on the upstream server per jail:
Remember to replace `\<upstream-server-ip\>` with the actual IP address of your upstream server.
```
`
[Definition]
# Option: actionban
# 1. Create the chain if it doesn't exist
# 2. Add the banned IP to the dynamic chain based on the jail name
# 3. Log the event
actionban = ssh -i /root/.ssh/id\_rsa -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null root@\<upstream-server-ip\> \\
'iptables -N f2b-\<name\> 2\>/dev/null || true; \\
iptables -C INPUT -j f2b-\<name\> 2\>/dev/null || iptables -I INPUT -j f2b-\<name\>; \\
iptables -I f2b-\<name\> 1 -s \<ip\> -j DROP' && \\
echo "Banned \<ip\> from jail \<name\> via upstream proxy" \>\> /var/log/fail2ban.log
# Option: actionunban
# 1. Remove the banned IP from the dynamic chain
# 2. Remove the chain if it becomes empty (cleanup)
# 3. Log the event
actionunban = ssh -i /root/.ssh/id\_rsa -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null root@\<upstream-server-ip\> \\
'iptables -D f2b-\<name\> -s \<ip\> -j DROP; \\
if ! iptables -L f2b-\<name\> | grep -q "DROP"; then \\
iptables -D INPUT -j f2b-\<name\>; \\
iptables -F f2b-\<name\>; \\
iptables -X f2b-\<name\>; \\
fi' && \\
echo "Unbanned \<ip\> from jail \<name\> via upstream proxy and cleaned up chain if empty" \>\> /var/log/fail2ban.log
`
```
After making changes, save and close the file.
2. **Update Fail2Ban Jails to Use the Dynamic Chain Action**:
Open your jail configuration file, usually located at `/etc/fail2ban/jail.local`:
```
`
sudo nano /etc/fail2ban/jail.local
`
```
And for each jail you want to manage via the upstream proxy, add or modify the action line to use the proxy-iptables-dynamic action. Here’s an example configuration for two jails:
```
`
[jellyfin]
enabled = true
filter = jellyfin
logpath = /path/to/jellyfin/log
maxretry = 3
bantime = 3600
action = proxy-iptables-dynamic
[nginx-http-auth]
enabled = true
filter = nginx-http-auth
logpath = /var/log/nginx/error.log
maxretry = 5
bantime = 3600
action = proxy-iptables-dynamic
`
```
After making changes, save and close the file.
### Step three: Add proxy IPs to Jellyfin[​](#step-three-add-proxy-ips-to-jellyfin)
1. **Get Proxy IPs**
Since you're using a proxy server, we need Jellyfin to output the correct IPs in logs for fail2ban to read.
Depending on your hosting setup, these IP ranges could be from internal Docker IPs, haproxy, or some other service.
Jellyfin accepts IPs with subnet masks such as `172.18.0.1/24`. You'll need a comma-separated list of these.
2. **Add Proxies to Jellyfin**
Open your Jellyfin server's dashboard, go to `Advanced` -\> `Networking`, and then scroll down to `Known proxies`.
Enter your comma-separated list of proxy IP ranges. You'll need to reboot the Jellyfin server as indicated.
### Step four: Restart Fail2Ban and Test the Setup[​](#step-four-restart-fail2ban-and-test-the-setup)
1. **Restart Fail2Ban**:
After making the configuration changes, restart Fail2Ban to apply the new settings:
```
`
sudo systemctl restart fail2ban
`
```
2. **Check Jail Status**:
Verify the status of your jails to ensure they are running correctly:
```
`
sudo fail2ban-client status jellyfin
`
```
3. **Test a Ban**:
Trigger a ban by performing invalid login attempts or by manually banning an IP. For example:
```
`
sudo fail2ban-client set jellyfin banip 192.168.1.100
`
```
4. **Verify on Upstream Server**:
Check if the IP is banned in the corresponding jail's chain on the upstream server ('f2b-jail-name'):
```
`
ssh root@\<upstream-server-ip\> "iptables -L f2b-jellyfin"
`
```
5. **Test Unbanning**:
To test unbanning, manually unban the IP:
```
`
sudo fail2ban-client set jellyfin unbanip 192.168.1.100
`
```
6. **Verify Unban**:
Verify that the IP is removed from the corresponding jail's chain ('f2b-jail-name'):
```
`
ssh root@\<upstream-server-ip\> "iptables -L f2b-jellyfin"
`
```
### Step five: Monitor Logs[​](#step-five-monitor-logs)
Monitor the Fail2Ban log to ensure that actions are being executed properly:
```
`
tail -f /var/log/fail2ban.log
`
```
This log will display messages whenever an IP is banned or unbanned, helping you confirm that the configuration is working as expected.
* [Requirements](#requirements)
* [Step one: create the jail](#step-one-create-the-jail)
* [Step two: create the filter](#step-two-create-the-filter)
* [Step three: test](#step-three-test)
* [Advanced Fail2Ban Setup: Forwarding and Managing Bans on an Upstream Proxy Server](#advanced-fail2ban-setup-forwarding-and-managing-bans-on-an-upstream-proxy-server)
* [Assumptions](#assumptions)
* [Step one: Set Up SSH Key-Based Authentication](#step-one-set-up-ssh-key-based-authentication)
* [Step two: Configure Fail2Ban for Dynamic Chains](#step-two-configure-fail2ban-for-dynamic-chains)
* [Step three: Add proxy IPs to Jellyfin](#step-three-add-proxy-ips-to-jellyfin)
* [Step four: Restart Fail2Ban and Test the Setup](#step-four-restart-fail2ban-and-test-the-setup)
* [Step five: Monitor Logs](#step-five-monitor-logs)