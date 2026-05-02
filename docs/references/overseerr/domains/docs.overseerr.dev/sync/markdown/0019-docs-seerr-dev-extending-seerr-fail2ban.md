Fail2ban | Seerr
[Skip to main content](#__docusaurus_skipToContent_fallback)
warning
If you are running Seerr behind a reverse proxy, make sure that the **Enable Proxy Support** setting is **enabled**.
To use Fail2ban with Seerr, create a new file named `seerr.local` in your Fail2ban `filter.d` directory with the following filter definition:
```
`[Definition]
failregex = .\*\\[warn\\]\\[(API|Auth)\\]\\: Failed sign-in attempt.\*"ip":"\<HOST\>"
`
```
You can then add a jail using this filter in `jail.local`. Please see the [Fail2ban documentation](https://github.com/fail2ban/fail2ban/wiki) for details on how to configure the jail.