Troubleshoot Oracle cloud devices · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Troubleshoot Oracle cloud devices
Last validated: Mar 20, 2026
If you find that your Tailscale network (known as a tailnet) nodes cannot access your [Oracle Cloud Linux VM](/docs/install/cloud/oracle-cloud), you may need to update the VM's `iptables` configuration.
Before you modify `iptables`, make a backup of the current configuration:
```
`sudo iptables-save \> \~/iptables.old
`
```
Check your current `iptables` configuration by running:
```
`sudo iptables --list --line-numbers
`
```
If you want to provide HTTP access from your tailnet to the VM, run:
```
`sudo iptables -I INPUT 6 -m state --state NEW -p tcp --dport 80 -j ACCEPT
sudo netfilter-persistent save
`
```
Alternatively, if you find a specific rule that is rejecting your ingress access, you can delete it by line number:
```
`sudo iptables -D INPUT \<line-number\>
`
```
Check the `iptables` list again to make sure your change is in effect.
```
`sudo iptables --list --line-numbers
`
```
Then, try accessing the Oracle Cloud Linux VM from your tailnet node again.
Scroll to top