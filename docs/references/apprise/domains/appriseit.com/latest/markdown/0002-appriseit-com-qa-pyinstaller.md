PyInstaller Support | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# PyInstaller Support
[Pyinstaller](https://pyinstaller.org/) allows to package a python application with its dependencies in a single exe.
It is possible to package an application that is using Apprise but there is a trick.
Let’s take a simple script:
```
`
from apprise import Apprise
apobj = Apprise()
apobj.add('\<SCHEME\>://\<FQDN\>/\<TOKEN\>')
apobj.notify(title="a title", body="this is the body of the notification")
`
```
Then package with `pytinstaller`:
Terminal window
```
`
pyinstaller -F myscript.py
`
```
And launch it:
Terminal window
```
`
./dist/myscript
`
```
We get:
```
`
FileNotFoundError: [Errno 2] No such file or directory: '/tmp/\_MEIEbGkgo/apprise/attachment'
or
FileNotFoundError: [Errno 2] No such file or directory: '/tmp/\_MEIEbGkgo/apprise/plugins'
or
FileNotFoundError: [Errno 2] No such file or directory: '/tmp/\_MEIEbGkgo/apprise/config'
`
```
We have to use `--collect-all` option which, according to documentation:
>
> Collect all submodules, data files, and binaries from the specified package or module. This option can be used multiple times.
>
Terminal window
```
`
pyinstaller -F --collect-all apprise myscript.py
`
```
No more errors, notifications are sent.
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