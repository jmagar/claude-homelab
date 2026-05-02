URL Construction | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# URL Construction
## Introduction
[Section titled “Introduction”](#introduction)
Apprise is built around URLs. Unfortunately URLs have pre-reserved characters it uses as delimiters that help distinguish one argument/setting from another.
For example, in a URL, the **&**, **/**, and **%** all have extremely different meanings and if they also reside in your password or user-name, they can cause quite a troubleshooting mess as to why your notifications aren’t working.
Now there is a workaround: you can replace these characters with special **%XX** character-set (URL encoded) values. These encoded characters won’t cause the URL to be mis-interpreted allowing you to send notifications at will.
If you’d rather not escape special characters by hand, try the [Apprise URL Builder](../url-builder/). It helps assemble shareable Apprise URLs while keeping sensitive fields out of the generated link.
Below is a chart of special characters and the value you should set them:
|Character|URL Encoded|Description|
|**[**|**%5B**|The `[` character can cause confusion with ipv6 strings when parsing. You should use the encoded value of this if it exists in locations such as your password.|
|**]**|**%5D**|The `]` character can cause confusion with ipv6 strings when parsing. You should use the encoded value of this if it exists in locations such as your password.|
|**%**|**%25**|The percent sign itself is the starting value for defining the %XX character sets.|
|**&**|**%26**|The ampersand sign is how a URL knows to stop reading the current variable and move onto the next. If this existed within a password or username, it would only read ‘up’ to this character. You’ll need to escape it if you make use of it.|
|**#**|**%23**|The hash tag and/or pound symbol as it’s sometime referred to as can be used in URLs as anchors.|
|**?**|**%3F**|The question mark divides a url path from the arguments you pass into it. You should ideally escape this if this resides in your password or is intended to be one of the variables you pass into your url string.|
|*(a space)*|**%20**|While most URLs will work with the space, it’s a good idea to escape it so that it can be clearly read from the URL.|
|**/**|**%2F**|The slash is the most commonly used delimiter that exists in a URL and helps define a path and/or location.|
|**@**|**%40**|The at symbol is what divides the user and/or password from hostname in a URL. if your username and/or password contains an ’@’ symbol, it can cause the url parser to get confused.|
|**+**|**%2B**|By default a addition/plus symbol **(+)** is interpreted as a *space* when specified in the URL. It must be escaped if you actually want the character to be represented as a **+**.|
|**,**|**%2C**|A comma only needs to be escaped in *extremely rare circumstances* where one exists at the very end of a specific URL that has been chained with others using a comma. [See PR#104](https://github.com/caronc/apprise/pull/104) for more details as to why you *may* need this.|
|**:**|**%3A**|A colon will never need to be escaped unless it is found as part of a user/pass combination. Hence in a url `http://user:pass@host` you can see that a colon is already used to separate the *username* from the *password*. Thus if your *{user}* actually has a colon in it, it can confuse the parser into treating what follows as a password (and not the remaining of your username). This is a very rare case as most systems don’t allow a colon in a username field.|
|**;**|**%3B**|A semi-colon can cause issues as well if it exists in the URL. It’s best to convert these as well ([see 1433](https://github.com/caronc/apprise/issues/1433))|
## Apprise URLs on Command Line
[Section titled “Apprise URLs on Command Line”](#apprise-urls-on-command-line)
If you are passing a URL on the Command Line Interface (CLI) of your Linux/Windows/Mac shell, it is important that you surround the URL with “quotes”. URL’s leverage the `&` character which delimits one parameter from another (e.g. `schema://config?parm=value&parm2=value`).
The problem is that `&` characters are also interpreted by the CLI. The `&` causes the shell to execute everything defined before them into a background process. As a result, you would actually loose and not register any parameters beyond the first.
Terminal window
```
`
# Here is an example of a problematic Apprise URL without "quotes":
apprise -vvv -b "Test Email" \\
mailtos://user:pass@example.com?mode=ssl&smtp=smtp.example.com&from=Chris
# ^ ^^
# |--------------------------------------||
# | |
# This is all that gets passed into Apprise |
# |
# This launches the first part into Apprise as a
# background task depending on the CLI handles the
# entries specified after here very differently. Hence
# only "mailtos://user:pass@example.com?mode=ssl" was
# loaded into Apprise with respect to this example.
`
```
This is VERY likely NOT what you expect/want to happen. Instead the same URL could have been written like:
Terminal window
```
`
apprise -vvv -b "Test Email" \\
"mailtos://user:pass@example.com?mode=ssl&smtp=smtp.example.com&from=Chris"
# |-------------------------------------------------------------------------|
# |
# Now with quotes our entire URL gets correctly passed into Apprise! 🚀
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