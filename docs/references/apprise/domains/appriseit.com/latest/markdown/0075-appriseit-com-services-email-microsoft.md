Microsoft | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Microsoft
Microsoft has permanently disabled **Basic Authentication** for:
* Outlook.com
* Hotmail
* Live.com
* Office 365 (personal and business)
This includes **SMTP AUTH**, even when using **App Passwords**.
If you attempt to use URLs such as:
```
`
mailto://user:password@smtp.office365.com
`
```
you will now receive errors similar to:
```
`
5.7.139 Authentication unsuccessful, basic authentication is disabled
`
```
This behaviour is **expected** and cannot be worked around.
**You must use OAuth 2.0 via the Microsoft Graph API**, which is what the Apprise Office 365 service provides.
## Why Azure App Registration Is Required
[Section titled “Why Azure App Registration Is Required”](#why-azure-app-registration-is-required)
Because Basic Authentication is disabled, Microsoft requires all email sending to use:
* OAuth 2.0
* Microsoft Graph API
* An Azure Entra ID application
As of recent Azure changes:
* App registrations **cannot exist outside of a directory**
* Personal Microsoft accounts must complete Azure onboarding
* This often requires creating a free Azure subscription
This is a Microsoft requirement, not an Apprise one.
Please use the [`azure://` Apprise plugin](/services/office365/) instead.
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