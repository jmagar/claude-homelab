API Overview | OpenAI API Reference
[Skip to content](#_top)
API Reference
[Introduction](/api/reference/overview)
# API Overview
## Introduction
[Section titled “Introduction”](#introduction)
This API reference describes the RESTful, streaming, and realtime APIs you can use to interact with the OpenAI platform. REST APIs are usable via HTTP in any environment that supports HTTP requests. Language-specific SDKs are listed [on the libraries page](/docs/libraries).
## Authentication
[Section titled “Authentication”](#authentication)
The OpenAI API uses API keys for authentication. Create, manage, and learn more about API keys in your [organization settings](/settings/organization/api-keys).
**Remember that your API key is a secret!** Do not share it with others or expose it in any client-side code (browsers, apps). API keys should be securely loaded from an environment variable or key management service on the server.
API keys should be provided via [HTTP Bearer authentication](https://swagger.io/docs/specification/v3_0/authentication/bearer-authentication/).
```
`Authorization: Bearer OPENAI\_API\_KEY`
```
If you belong to multiple organizations or access projects through a legacy user API key, pass a header to specify which organization and project to use for an API request:
```
`curl https://api.openai.com/v1/models \\
-H "Authorization: Bearer $OPENAI\_API\_KEY" \\
-H "OpenAI-Organization: $ORGANIZATION\_ID" \\
-H "OpenAI-Project: $PROJECT\_ID"`
```
Usage from these API requests counts as usage for the specified organization and project.Organization IDs can be found on your [organization settings](/settings/organization/general) page.
Project IDs can be found on your [general settings](/settings) page by selecting the specific project.
## Debugging requests
[Section titled “Debugging requests”](#debugging-requests)
In addition to [error codes](/docs/guides/error-codes) returned from API responses, you can inspect HTTP response headers containing the unique ID of a particular API request or information about rate limiting applied to your requests. Below is an incomplete list of HTTP headers returned with API responses:
**API meta information**
* `openai-organization`: The [organization](/docs/guides/production-best-practices#setting-up-your-organization) associated with the request
* `openai-processing-ms`: Time taken processing your API request
* `openai-version`: REST API version used for this request (currently `2020-10-01`)
* `x-request-id`: Unique identifier for this API request (used in troubleshooting)
**[Rate limiting information](/docs/guides/rate-limits)**
* `x-ratelimit-limit-requests`
* `x-ratelimit-limit-tokens`
* `x-ratelimit-remaining-requests`
* `x-ratelimit-remaining-tokens`
* `x-ratelimit-reset-requests`
* `x-ratelimit-reset-tokens`
**OpenAI recommends logging request IDs in production deployments** for more efficient troubleshooting with our [support team](https://help.openai.com/en/), should the need arise. Our [official SDKs](/docs/libraries) provide a property on top-level response objects containing the value of the `x-request-id` header.
### Supplying your own request ID with `X-Client-Request-Id`
[Section titled “Supplying your own request ID with X-Client-Request-Id”](#supplying-your-own-request-id-with-x-client-request-id)
In addition to the server-generated `x-request-id`, you can supply your own unique identifier for each request via the `X-Client-Request-Id` request header. This header is not added automatically; you must explicitly set it on the request.
When you include `X-Client-Request-Id`:
* You control the ID format (for example, a UUID or your internal trace ID), but it must contain only ASCII characters and be no more than 512 characters long; otherwise, the request will fail with a 400 error. We strongly recommend making this value unique per request.
* OpenAI will log this value in our internal logs for supported endpoints, including chat/completions, embeddings, responses, and more.
* In cases like timeouts or network issues when you can’t get the `X-Request-Id` response header, you can share the `X-Client-Request-Id` value with our support team, and we can look up whether we received the request and when.
**Example:**
```
`curl https://api.openai.com/v1/chat/completions \\
-H "Authorization: Bearer $OPENAI\_API\_KEY" \\
-H "X-Client-Request-Id: 123e4567-e89b-12d3-a456-426614174000"`
```
## Backwards compatibility
[Section titled “Backwards compatibility”](#backwards-compatibility)
OpenAI is committed to providing stability to API users by avoiding breaking changes in major API versions whenever reasonably possible. This includes:
* The REST API (currently `v1`)
* Our first-party [SDKs](/docs/libraries) (released SDKs adhere to [semantic versioning](https://semver.org/))
* [Model](/docs/models) families (like `gpt-4o` or `o4-mini`)
**Model prompting behavior between snapshots is subject to change**.
Model outputs are by their nature variable, so expect changes in prompting and model behavior between snapshots. For example, if you moved from `gpt-4o-2024-05-13` to `gpt-4o-2024-08-06`, the same `system` or `user` messages could function differently between versions. The best way to ensure consistent prompting behavior and model output is to use pinned model versions, and to implement [evals](/docs/guides/evals) for your applications.
**Backwards-compatible API changes**:
* Adding new resources (URLs) to the REST API and SDKs
* Adding new optional API parameters
* Adding new properties to JSON response objects or event data
* Changing the order of properties in a JSON response object
* Changing the length or format of opaque strings, like resource identifiers and UUIDs
* Adding new event types (in either streaming or the Realtime API)
See the [changelog](/docs/changelog) for a list of backwards-compatible changes and rare breaking changes.