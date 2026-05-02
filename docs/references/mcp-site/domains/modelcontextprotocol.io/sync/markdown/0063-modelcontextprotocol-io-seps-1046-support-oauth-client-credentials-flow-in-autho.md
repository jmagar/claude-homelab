SEP-1046: Support OAuth client credentials flow in authorization - Model Context Protocol
## > Documentation Index
> Fetch the complete documentation index at:
[> https://modelcontextprotocol.io/llms.txt
](https://modelcontextprotocol.io/llms.txt)
> Use this file to discover all available pages before exploring further.
FinalStandards Track
|Field|Value|
|**SEP**|1046|
|**Title**|Support OAuth client credentials flow in authorization|
|**Status**|Final|
|**Type**|Standards Track|
|**Created**|2025-07-23|
|**Author(s)**|Darin McAdams ([@D-McAdams](https://github.com/D-McAdams) )|
|**Sponsor**|None|
|**PR**|[#1046](https://github.com/modelcontextprotocol/modelcontextprotocol/pull/1046)|
##
[​
](#abstract)
Abstract
Recommends adding the OAuth client credentials flow to the authorization spec to enable machine-to-machine scenarios.
###
[​
](#motivation)
Motivation
The original authorization spec mentioned the client credentials flow, but it was dropped in subsequent revisions. Therefore, the spec is currently silent on how to solve machine-to-machine scenarios where an end-user is unavailable for interactive authorization.
###
[​
](#specification)
Specification
The authorization spec would be amended to list the OAuth client credentials flow as being allowed. Adhering to the patterns established by OAuth 2.1, the specification would RECOMMEND the use of asymmetric methods defined in RFC 753 (JWT Assertions), but also allow client secrets.
As guidance to implementors, the spec overview would also be updated to describe the different flows and when each is applicable. In addition, to address a common question, the spec would be updated to indicate that implementors may implement other authorization scenarios beyond what’s defined; emphasizing that the specification defines the baseline requirements.
###
[​
](#rationale)
Rationale
To maximize interoperability (and minimize SDK complexity), this change would intentionally constrain the client credentials flow to two options:
1. JWT Assertions as per RFC 7523 (RECOMMENDED)
2. Client Secrets via HTTP Basic authentication (Allowed for maximum compatibility with existing systems)
Other options, such as mTLS, are not included.
While the spec encourages the use of RFC 7523 (JWT Assertions), it does not yet specify how to populate the JWT contents nor how to discover the client’s JWKS URI to validate the JWT. In future iterations of the spec, it will be beneficial to do so. However, this was currently left unspecified pending maturity of other RFCs that can define these profiles. The other RFCs include [WIMSE Headless JWT Authentication](https://www.ietf.org/archive/id/draft-levy-wimse-headless-jwt-authentication-01.html) (for specifying JWT contents) and [Client ID Metadata](https://datatracker.ietf.org/doc/draft-parecki-oauth-client-id-metadata-document/) (for specifying the JWKS URI). This revision intentionally leaves extensibility for these future profiles. As a practical matter, this means implementers needing to ship solutions ASAP will most likely use client secrets which are widely supported today, whereas the JWT Assertion pattern represents the longer-term direction.
###
[​
](#backward-compatibility)
Backward Compatibility
This change is fully backward compatible. It introduces a new authorization flow, but does not alter the existing flows.
###
[​
](#security-implications)
Security Implications
The specification refers to the existing OAuth security guidance.