Response Codes | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Response Codes
Apprise API uses standard HTTP status codes. Many error responses return a short message as `text/plain`. If you request JSON (send `Accept: application/json`), error responses include an `error` field.
|Code|Meaning|Where you will see it|
|`200`|OK|Request succeeded.|
|`204`|No Content|No configuration exists for the requested key, or a stateless notify request had no valid URLs to notify.|
|`400`|Bad Request|Invalid payload, unsupported `type` or `format`, invalid tag definition, invalid recursion header, or a payload field mapping rule (`:source=target`) could not be resolved (e.g. the dot-notation path was not found in the payload or exceeded the maximum depth).|
|`403`|Forbidden|The server is configured to deny the request (for example, `APPRISE\_CONFIG\_LOCK=yes`, or `/cfg` listing is disabled).|
|`405`|Method Not Allowed|The request used an unsupported HTTP method for the endpoint.|
|`406`|Not Acceptable|The recursion limit has been reached, or the request was rejected by a server rule.|
|`417`|Expectation Failed|Health check detected a blocking condition (for example, missing write permissions).|
|`421`|Misdirected Request|API-only mode is enabled and a web UI page was requested.|
|`424`|Failed Dependency|At least one notification failed to send.|
|`431`|Request Header Fields Too Large|The request exceeded the configured in-memory upload limit and Django rejected it.|
|`500`|Internal Server Error|Server-side error saving or loading configuration, or an unexpected I/O error.|
Some error cases are endpoint-specific and may return either `text/plain` or JSON depending on `Accept`.
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