Schema Reference - Model Context Protocol
## > Documentation Index
> Fetch the complete documentation index at:
[> https://modelcontextprotocol.io/llms.txt
](https://modelcontextprotocol.io/llms.txt)
> Use this file to discover all available pages before exploring further.
##
[​
](#json-rpc)
JSON-RPC
###
[​
](#jsonrpcerrorresponse)
`JSONRPCErrorResponse`
interface JSONRPCErrorResponse {
 [jsonrpc](#jsonrpcerrorresponse-jsonrpc): “2.0”;
 [id](#jsonrpcerrorresponse-id)?: [RequestId](#requestid);
 [error](#jsonrpcerrorresponse-error): [Error](#error);
}
A response to a request that indicates an error occurred.
jsonrpc: “2.0”[](#jsonrpcerrorresponse-jsonrpc)
id?: RequestId[](#jsonrpcerrorresponse-id)
error: Error[](#jsonrpcerrorresponse-error)
###
[​
](#jsonrpcmessage)
`JSONRPCMessage`
JSONRPCMessage: [JSONRPCRequest](#jsonrpcrequest) | [JSONRPCNotification](#jsonrpcnotification) | [JSONRPCResponse](#jsonrpcresponse)
Refers to any valid JSON-RPC object that can be decoded off the wire, or encoded to be sent.
###
[​
](#jsonrpcnotification)
`JSONRPCNotification`
interface JSONRPCNotification {
 [method](#jsonrpcnotification-method): string;
 [params](#jsonrpcnotification-params)?: { [key: string]: any };
 [jsonrpc](#jsonrpcnotification-jsonrpc): “2.0”;
}
A notification which does not expect a response.
method: string[](#jsonrpcnotification-method)
Inherited from Notification.method
params?: { [key: string]: any }[](#jsonrpcnotification-params)
Inherited from Notification.params
jsonrpc: “2.0”[](#jsonrpcnotification-jsonrpc)
###
[​
](#jsonrpcrequest)
`JSONRPCRequest`
interface JSONRPCRequest {
 [method](#jsonrpcrequest-method): string;
 [params](#jsonrpcrequest-params)?: { [key: string]: any };
 [jsonrpc](#jsonrpcrequest-jsonrpc): “2.0”;
 [id](#jsonrpcrequest-id): [RequestId](#requestid);
}
A request that expects a response.
method: string[](#jsonrpcrequest-method)
Inherited from Request.method
params?: { [key: string]: any }[](#jsonrpcrequest-params)
Inherited from Request.params
jsonrpc: “2.0”[](#jsonrpcrequest-jsonrpc)
id: RequestId[](#jsonrpcrequest-id)
###
[​
](#jsonrpcresponse)
`JSONRPCResponse`
JSONRPCResponse: [JSONRPCResultResponse](#jsonrpcresultresponse) | [JSONRPCErrorResponse](#jsonrpcerrorresponse)
A response to a request, containing either the result or error.
###
[​
](#jsonrpcresultresponse)
`JSONRPCResultResponse`
interface JSONRPCResultResponse {
 [jsonrpc](#jsonrpcresultresponse-jsonrpc): “2.0”;
 [id](#jsonrpcresultresponse-id): [RequestId](#requestid);
 [result](#jsonrpcresultresponse-result): [Result](#result);
}
A successful (non-error) response to a request.
jsonrpc: “2.0”[](#jsonrpcresultresponse-jsonrpc)
id: RequestId[](#jsonrpcresultresponse-id)
result: Result[](#jsonrpcresultresponse-result)
##
[​
](#common-types)
Common Types
###
[​
](#annotations)
`Annotations`
interface Annotations {
 [audience](#annotations-audience)?: [Role](#role)[];
 [priority](#annotations-priority)?: number;
 [lastModified](#annotations-lastmodified)?: string;
}
Optional annotations for the client. The client can use annotations to inform how objects are used or displayed
audience?: Role[][](#annotations-audience)
Describes who the intended audience of this object or data is.
It can include multiple entries to indicate content useful for multiple audiences (e.g., `[“user”, “assistant”]`).
priority?: number[](#annotations-priority)
Describes how important this data is for operating the server.
A value of 1 means “most important,” and indicates that the data is
effectively required, while 0 means “least important,” and indicates that
the data is entirely optional.
lastModified?: string[](#annotations-lastmodified)
The moment the resource was last modified, as an ISO 8601 formatted string.
Should be an ISO 8601 formatted string (e.g., “2025-01-12T15:00:58Z”).
Examples: last activity timestamp in an open file, timestamp when the resource
was attached, etc.
###
[​
](#cursor)
`Cursor`
Cursor: string
An opaque token used to represent a cursor for pagination.
###
[​
](#emptyresult)
`EmptyResult`
EmptyResult: [Result](#result)
A result that indicates success but carries no data.
###
[​
](#icon)
`Icon`
interface Icon {
 [src](#icon-src): string;
 [mimeType](#icon-mimetype)?: string;
 [sizes](#icon-sizes)?: string[];
 [theme](#icon-theme)?: “light” | “dark”;
}
An optionally-sized icon that can be displayed in a user interface.
src: string[](#icon-src)
A standard URI pointing to an icon resource. May be an HTTP/HTTPS URL or a `data:` URI with Base64-encoded image data.
Consumers SHOULD take steps to ensure URLs serving icons are from the
same domain as the client/server or a trusted domain.
Consumers SHOULD take appropriate precautions when consuming SVGs as they can contain
executable JavaScript.
mimeType?: string[](#icon-mimetype)
Optional MIME type override if the source MIME type is missing or generic.
For example: `“image/png”`, `“image/jpeg”`, or `“image/svg+xml”`.
sizes?: string[][](#icon-sizes)
Optional array of strings that specify sizes at which the icon can be used.
Each string should be in WxH format (e.g., `“48x48”`, `“96x96”`) or `“any”` for scalable formats like SVG.
If not provided, the client should assume that the icon can be used at any size.
theme?: “light” | “dark”[](#icon-theme)
Optional specifier for the theme this icon is designed for. `“light”` indicates
the icon is designed to be used with a light background, and `“dark”` indicates
the icon is designed to be used with a dark background.
If not provided, the client should assume the icon can be used with any theme.
###
[​
](#jsonarray)
`JSONArray`
JSONArray: [JSONValue](#jsonvalue)[]
###
[​
](#jsonobject)
`JSONObject`
JSONObject: { [key: string]: [JSONValue](#jsonvalue) }
Type Declaration
*
[key: string]: [JSONValue](#jsonvalue)
###
[​
](#jsonvalue)
`JSONValue`
JSONValue: string | number | boolean | null | [JSONObject](#jsonobject) | [JSONArray](#jsonarray)
###
[​
](#logginglevel)
`LoggingLevel`
LoggingLevel:
 | “debug”
 | “info”
 | “notice”
 | “warning”
 | “error”
 | “critical”
 | “alert”
 | “emergency”
The severity of a log message.
These map to syslog message severities, as specified in RFC-5424: [[https://datatracker.ietf.org/doc/html/rfc5424#section-6.2.1](https://datatracker.ietf.org/doc/html/rfc5424#section-6.2.1)](https://datatracker.ietf.org/doc/html/rfc5424#section-6.2.1)
###
[​
](#metaobject)
`MetaObject`
MetaObject: Record\<string, unknown\>
Represents the contents of a `\_meta` field, which clients and servers use to attach additional metadata to their interactions.
Certain key names are reserved by MCP for protocol-level metadata; implementations MUST NOT make assumptions about values at these keys. Additionally, specific schema definitions may reserve particular names for purpose-specific metadata, as declared in those definitions.
Valid keys have two segments:
**Prefix:**
* Optional — if specified, MUST be a series of *labels* separated by dots (`.`), followed by a slash (`/`).
* Labels MUST start with a letter and end with a letter or digit. Interior characters may be letters, digits, or hyphens (`-`).
* Any prefix consisting of zero or more labels, followed by `modelcontextprotocol` or `mcp`, followed by any label, is **reserved** for MCP use. For example: `modelcontextprotocol.io/`, `mcp.dev/`, `api.modelcontextprotocol.org/`, and `tools.mcp.com/` are all reserved.
**Name:**
* Unless empty, MUST start and end with an alphanumeric character (`[a-z0-9A-Z]`).
* Interior characters may be alphanumeric, hyphens (`-`), underscores (`\_`), or dots (`.`).
See[](#see)
[General fields: `\_meta`](/specification/draft/basic/index#meta) for more details.
###
[​
](#notificationparams)
`NotificationParams`
interface NotificationParams {
 [\_meta](#notificationparams-_meta)?: [MetaObject](#metaobject);
}
Common params for any notification.
\_meta?: MetaObject[](#notificationparams-_meta)
###
[​
](#paginatedrequestparams)
`PaginatedRequestParams`
interface PaginatedRequestParams {
 [\_meta](#paginatedrequestparams-_meta)?: [RequestMetaObject](#requestmetaobject);
 [cursor](#paginatedrequestparams-cursor)?: string;
}
Common params for paginated requests.
Example: List request with cursor[](#paginatedrequestparams-example-list-request-with-cursor)
```
`{
“cursor”: “eyJwYWdlIjogMn0=”
} `Copy
```
\_meta?: RequestMetaObject[](#paginatedrequestparams-_meta)
Inherited from [RequestParams](#requestparams).[\_meta](#requestparams-_meta)
cursor?: string[](#paginatedrequestparams-cursor)
An opaque token representing the current pagination position.
If provided, the server should return results starting after this cursor.
###
[​
](#progresstoken)
`ProgressToken`
ProgressToken: string | number
A progress token, used to associate progress notifications with the original request.
###
[​
](#requestid)
`RequestId`
RequestId: string | number
A uniquely identifying ID for a request in JSON-RPC.
###
[​
](#requestmetaobject)
`RequestMetaObject`
interface RequestMetaObject {
 [progressToken](#requestmetaobject-progresstoken)?: [ProgressToken](#progresstoken);
 [key: string]: unknown;
}
Extends [MetaObject](#metaobject) with additional request-specific fields. All key naming rules from `MetaObject` apply.
See[](#see)
* [MetaObject](#metaobject) for key naming rules and reserved prefixes.
* [General fields: `\_meta`](/specification/draft/basic/index#meta) for more details.
progressToken?: ProgressToken[](#requestmetaobject-progresstoken)
If specified, the caller is requesting out-of-band progress notifications for this request (as represented by [notifications/progress](#progressnotification)). The value of this parameter is an opaque token that will be attached to any subsequent notifications. The receiver is not obligated to provide these notifications.
###
[​
](#requestparams)
`RequestParams`
interface RequestParams {
 [\_meta](#requestparams-_meta)?: [RequestMetaObject](#requestmetaobject);
}
Common params for any request.
\_meta?: RequestMetaObject[](#requestparams-_meta)
###
[​
](#result)
`Result`
interface Result {
 [\_meta](#result-_meta)?: [MetaObject](#metaobject);
 [key: string]: unknown;
}
Common result fields.
\_meta?: MetaObject[](#result-_meta)
###
[​
](#role)
`Role`
Role: “user” | “assistant”
The sender or recipient of messages and data in a conversation.
##
[​
](#errors)
Errors
###
[​
](#error)
`Error`
interface Error {
 [code](#error-code): number;
 [message](#error-message): string;
 [data](#error-data)?: unknown;
}
code: number[](#error-code)
The error type that occurred.
message: string[](#error-message)
A short description of the error. The message SHOULD be limited to a concise single sentence.
data?: unknown[](#error-data)
Additional information about the error. The value of this member is defined by the sender (e.g. detailed error information, nested errors etc.).
###
[​
](#internalerror)
`InternalError`
interface InternalError {
 [message](#internalerror-message): string;
 [data](#internalerror-data)?: unknown;
 [code](#internalerror-code): -32603;
}
A JSON-RPC error indicating that an internal error occurred on the receiver. This error is returned when the receiver encounters an unexpected condition that prevents it from fulfilling the request.
See[](#see)
[JSON-RPC 2.0 Error Object](https://www.jsonrpc.org/specification#error_object)
Example: Unexpected error[](#internalerror-example-unexpected-error)
```
`{
“code”: -32603,
“message”: “Internal error”
} `Copy
```
message: string[](#internalerror-message)
A short description of the error. The message SHOULD be limited to a concise single sentence.
Inherited from [Error](#error).[message](#error-message)
data?: unknown[](#internalerror-data)
Additional information about the error. The value of this member is defined by the sender (e.g. detailed error information, nested errors etc.).
Inherited from [Error](#error).[data](#error-data)
code: -32603[](#internalerror-code)
The error type that occurred.
Overrides [Error](#error).[code](#error-code)
###
[​
](#invalidparamserror)
`InvalidParamsError`
interface InvalidParamsError {
 [message](#invalidparamserror-message): string;
 [data](#invalidparamserror-data)?: unknown;
 [code](#invalidparamserror-code): -32602;
}
A JSON-RPC error indicating that the method parameters are invalid or malformed.
In MCP, this error is returned in various contexts when request parameters fail validation:
* **Tools**: Unknown tool name or invalid tool arguments
* **Prompts**: Unknown prompt name or missing required arguments
* **Pagination**: Invalid or expired cursor values
* **Logging**: Invalid log level
* **Tasks**: Invalid or nonexistent task ID, invalid cursor, or attempting to cancel a task already in a terminal status
* **Elicitation**: Server requests an elicitation mode not declared in client capabilities
* **Sampling**: Missing tool result or tool results mixed with other content
See[](#see)
[JSON-RPC 2.0 Error Object](https://www.jsonrpc.org/specification#error_object)
Example: Unknown tool[](#invalidparamserror-example-unknown-tool)
```
`{
“code”: -32602,
“message”: “Unknown tool: invalid\_tool\_name”
} `Copy
```
Example: Invalid tool arguments[](#invalidparamserror-example-invalid-tool-arguments)
```
`{
“code”: -32602,
“message”: “Invalid arguments for tool calculate: Missing required property ‘expression’”
} `Copy
```
Example: Unknown prompt[](#invalidparamserror-example-unknown-prompt)
```
`{
“code”: -32602,
“message”: “Unknown prompt: invalid\_prompt\_name”
} `Copy
```
Example: Invalid cursor[](#invalidparamserror-example-invalid-cursor)
```
`{
“code”: -32602,
“message”: “Invalid cursor”
} `Copy
```
message: string[](#invalidparamserror-message)
A short description of the error. The message SHOULD be limited to a concise single sentence.
Inherited from [Error](#error).[message](#error-message)
data?: unknown[](#invalidparamserror-data)
Additional information about the error. The value of this member is defined by the sender (e.g. detailed error information, nested errors etc.).
Inherited from [Error](#error).[data](#error-data)
code: -32602[](#invalidparamserror-code)
The error type that occurred.
Overrides [Error](#error).[code](#error-code)
###
[​
](#invalidrequesterror)
`InvalidRequestError`
interface InvalidRequestError {
 [message](#invalidrequesterror-message): string;
 [data](#invalidrequesterror-data)?: unknown;
 [code](#invalidrequesterror-code): -32600;
}
A JSON-RPC error indicating that the request is not a valid request object. This error is returned when the message structure does not conform to the JSON-RPC 2.0 specification requirements for a request (e.g., missing required fields like `jsonrpc` or `method`, or using invalid types for these fields).
See[](#see)
[JSON-RPC 2.0 Error Object](https://www.jsonrpc.org/specification#error_object)
message: string[](#invalidrequesterror-message)
A short description of the error. The message SHOULD be limited to a concise single sentence.
Inherited from [Error](#error).[message](#error-message)
data?: unknown[](#invalidrequesterror-data)
Additional information about the error. The value of this member is defined by the sender (e.g. detailed error information, nested errors etc.).
Inherited from [Error](#error).[data](#error-data)
code: -32600[](#invalidrequesterror-code)
The error type that occurred.
Overrides [Error](#error).[code](#error-code)
###
[​
](#methodnotfounderror)
`MethodNotFoundError`
interface MethodNotFoundError {
 [message](#methodnotfounderror-message): string;
 [data](#methodnotfounderror-data)?: unknown;
 [code](#methodnotfounderror-code): -32601;
}
A JSON-RPC error indicating that the requested method does not exist or is not available.
In MCP, this error is returned when a request is made for a method that requires a capability that has not been declared. This can occur in either direction:
* A server returning this error when the client requests a capability it doesn’t support (e.g., requesting completions when the `completions` capability was not advertised)
* A client returning this error when the server requests a capability it doesn’t support (e.g., requesting roots when the client did not declare the `roots` capability)
See[](#see)
[JSON-RPC 2.0 Error Object](https://www.jsonrpc.org/specification#error_object)
Example: Roots not supported[](#methodnotfounderror-example-roots-not-supported)
```
`{
“code”: -32601,
“message”: “Roots not supported”,
“data”: {
“reason”: “Client does not have roots capability”
}
} `Copy
```
message: string[](#methodnotfounderror-message)
A short description of the error. The message SHOULD be limited to a concise single sentence.
Inherited from [Error](#error).[message](#error-message)
data?: unknown[](#methodnotfounderror-data)
Additional information about the error. The value of this member is defined by the sender (e.g. detailed error information, nested errors etc.).
Inherited from [Error](#error).[data](#error-data)
code: -32601[](#methodnotfounderror-code)
The error type that occurred.
Overrides [Error](#error).[code](#error-code)
###
[​
](#parseerror)
`ParseError`
interface ParseError {
 [message](#parseerror-message): string;
 [data](#parseerror-data)?: unknown;
 [code](#parseerror-code): -32700;
}
A JSON-RPC error indicating that invalid JSON was received by the server. This error is returned when the server cannot parse the JSON text of a message.
See[](#see)
[JSON-RPC 2.0 Error Object](https://www.jsonrpc.org/specification#error_object)
Example: Invalid JSON[](#parseerror-example-invalid-json)
```
`{
“code”: -32700,
“message”: “Parse error: Invalid JSON”
} `Copy
```
message: string[](#parseerror-message)
A short description of the error. The message SHOULD be limited to a concise single sentence.
Inherited from [Error](#error).[message](#error-message)
data?: unknown[](#parseerror-data)
Additional information about the error. The value of this member is defined by the sender (e.g. detailed error information, nested errors etc.).
Inherited from [Error](#error).[data](#error-data)
code: -32700[](#parseerror-code)
The error type that occurred.
Overrides [Error](#error).[code](#error-code)
##
[​
](#content)
Content
###
[​
](#audiocontent)
`AudioContent`
interface AudioContent {
 [type](#audiocontent-type): “audio”;
 [data](#audiocontent-data): string;
 [mimeType](#audiocontent-mimetype): string;
 [annotations](#audiocontent-annotations)?: [Annotations](#annotations);
 [\_meta](#audiocontent-_meta)?: [MetaObject](#metaobject);
}
Audio provided to or from an LLM.
Example: `audio/wav` content[](#audiocontent-example-audiowav-content)
```
`{
“type”: “audio”,
“data”: “UklGRiQAAABXQVZFZm10IBAAAAABAAEARKwAAIhYAQACABAAZGF0YQAAAAA=”,
“mimeType”: “audio/wav”
} `Copy
```
type: “audio”[](#audiocontent-type)
data: string[](#audiocontent-data)
The base64-encoded audio data.
mimeType: string[](#audiocontent-mimetype)
The MIME type of the audio. Different providers may support different audio types.
annotations?: Annotations[](#audiocontent-annotations)
Optional annotations for the client.
\_meta?: MetaObject[](#audiocontent-_meta)
###
[​
](#blobresourcecontents)
`BlobResourceContents`
interface BlobResourceContents {
 [uri](#blobresourcecontents-uri): string;
 [mimeType](#blobresourcecontents-mimetype)?: string;
 [\_meta](#blobresourcecontents-_meta)?: [MetaObject](#metaobject);
 [blob](#blobresourcecontents-blob): string;
}
Example: Image file contents[](#blobresourcecontents-example-image-file-contents)
```
`{
“uri”: “file:///example.png”,
“mimeType”: “image/png”,
“blob”: “iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNk+M9QDwADhgGAWjR9awAAAABJRU5ErkJggg==”
} `Copy
```
uri: string[](#blobresourcecontents-uri)
The URI of this resource.
Inherited from ResourceContents.uri
mimeType?: string[](#blobresourcecontents-mimetype)
The MIME type of this resource, if known.
Inherited from ResourceContents.mimeType
\_meta?: MetaObject[](#blobresourcecontents-_meta)
Inherited from ResourceContents.\_meta
blob: string[](#blobresourcecontents-blob)
A base64-encoded string representing the binary data of the item.
###
[​
](#contentblock)
`ContentBlock`
ContentBlock:
 | [TextContent](#textcontent)
 | [ImageContent](#imagecontent)
 | [AudioContent](#audiocontent)
 | [ResourceLink](#resourcelink)
 | [EmbeddedResource](#embeddedresource)
###
[​
](#embeddedresource)
`EmbeddedResource`
interface EmbeddedResource {
 [type](#embeddedresource-type): “resource”;
 [resource](#embeddedresource-resource): [TextResourceContents](#textresourcecontents) | [BlobResourceContents](#blobresourcecontents);
 [annotations](#embeddedresource-annotations)?: [Annotations](#annotations);
 [\_meta](#embeddedresource-_meta)?: [MetaObject](#metaobject);
}
The contents of a resource, embedded into a prompt or tool call result.
It is up to the client how best to render embedded resources for the benefit
of the LLM and/or the user.
Example: Embedded file resource with annotations[](#embeddedresource-example-embedded-file-resource-with-annotations)
```
`{
“type”: “resource”,
“resource”: {
“uri”: “file:///project/src/main.rs”,
“mimeType”: “text/x-rust”,
“text”: “fn main() {\\n println!(\\“Hello world!\\”);\\n}”
},
“annotations”: {
“audience”: [“user”, “assistant”],
“priority”: 0.7,
“lastModified”: “2025-05-03T14:30:00Z”
}
} `Copy
```
type: “resource”[](#embeddedresource-type)
resource: TextResourceContents | BlobResourceContents[](#embeddedresource-resource)
annotations?: Annotations[](#embeddedresource-annotations)
Optional annotations for the client.
\_meta?: MetaObject[](#embeddedresource-_meta)
###
[​
](#imagecontent)
`ImageContent`
interface ImageContent {
 [type](#imagecontent-type): “image”;
 [data](#imagecontent-data): string;
 [mimeType](#imagecontent-mimetype): string;
 [annotations](#imagecontent-annotations)?: [Annotations](#annotations);
 [\_meta](#imagecontent-_meta)?: [MetaObject](#metaobject);
}
An image provided to or from an LLM.
Example: `image/png` content with annotations[](#imagecontent-example-imagepng-content-with-annotations)
```
`{
“type”: “image”,
“data”: “iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNk+M9QDwADhgGAWjR9awAAAABJRU5ErkJggg==”,
“mimeType”: “image/png”,
“annotations”: {
“audience”: [“user”],
“priority”: 0.9
}
} `Copy
```
type: “image”[](#imagecontent-type)
data: string[](#imagecontent-data)
The base64-encoded image data.
mimeType: string[](#imagecontent-mimetype)
The MIME type of the image. Different providers may support different image types.
annotations?: Annotations[](#imagecontent-annotations)
Optional annotations for the client.
\_meta?: MetaObject[](#imagecontent-_meta)
###
[​
](#resourcelink)
`ResourceLink`
interface ResourceLink {
 [icons](#resourcelink-icons)?: [Icon](#icon)[];
 [name](#resourcelink-name): string;
 [title](#resourcelink-title)?: string;
 [uri](#resourcelink-uri): string;
 [description](#resourcelink-description)?: string;
 [mimeType](#resourcelink-mimetype)?: string;
 [annotations](#resourcelink-annotations)?: [Annotations](#annotations);
 [size](#resourcelink-size)?: number;
 [\_meta](#resourcelink-_meta)?: [MetaObject](#metaobject);
 [type](#resourcelink-type): “resource\_link”;
}
A resource that the server is capable of reading, included in a prompt or tool call result.
Note: resource links returned by tools are not guaranteed to appear in the results of [resources/list](#listresourcesrequest) requests.
Example: File resource link[](#resourcelink-example-file-resource-link)
```
`{
“type”: “resource\_link”,
“uri”: “file:///project/src/main.rs”,
“name”: “main.rs”,
“description”: “Primary application entry point”,
“mimeType”: “text/x-rust”
} `Copy
```
icons?: Icon[][](#resourcelink-icons)
Optional set of sized icons that the client can display in a user interface.
Clients that support rendering icons MUST support at least the following MIME types:
* `image/png` - PNG images (safe, universal compatibility)
* `image/jpeg` (and `image/jpg`) - JPEG images (safe, universal compatibility)
Clients that support rendering icons SHOULD also support:
* `image/svg+xml` - SVG images (scalable but requires security precautions)
* `image/webp` - WebP images (modern, efficient format)
Inherited from [Resource](#resource).[icons](#resource-icons)
name: string[](#resourcelink-name)
Intended for programmatic or logical use, but used as a display name in past specs or fallback (if title isn’t present).
Inherited from [Resource](#resource).[name](#resource-name)
title?: string[](#resourcelink-title)
Intended for UI and end-user contexts — optimized to be human-readable and easily understood,
even by those unfamiliar with domain-specific terminology.
If not provided, the name should be used for display (except for [Tool](#tool),
where `annotations.title` should be given precedence over using `name`,
if present).
Inherited from [Resource](#resource).[title](#resource-title)
uri: string[](#resourcelink-uri)
The URI of this resource.
Inherited from [Resource](#resource).[uri](#resource-uri)
description?: string[](#resourcelink-description)
A description of what this resource represents.
This can be used by clients to improve the LLM’s understanding of available resources. It can be thought of like a “hint” to the model.
Inherited from [Resource](#resource).[description](#resource-description)
mimeType?: string[](#resourcelink-mimetype)
The MIME type of this resource, if known.
Inherited from [Resource](#resource).[mimeType](#resource-mimetype)
annotations?: Annotations[](#resourcelink-annotations)
Optional annotations for the client.
Inherited from [Resource](#resource).[annotations](#resource-annotations)
size?: number[](#resourcelink-size)
The size of the raw resource content, in bytes (i.e., before base64 encoding or any tokenization), if known.
This can be used by Hosts to display file sizes and estimate context window usage.
Inherited from [Resource](#resource).[size](#resource-size)
\_meta?: MetaObject[](#resourcelink-_meta)
Inherited from [Resource](#resource).[\_meta](#resource-_meta)
type: “resource\_link”[](#resourcelink-type)
###
[​
](#textcontent)
`TextContent`
interface TextContent {
 [type](#textcontent-type): “text”;
 [text](#textcontent-text): string;
 [annotations](#textcontent-annotations)?: [Annotations](#annotations);
 [\_meta](#textcontent-_meta)?: [MetaObject](#metaobject);
}
Text provided to or from an LLM.
Example: Text content[](#textcontent-example-text-content)
```
`{
“type”: “text”,
“text”: “Tool result text”
} `Copy
```
type: “text”[](#textcontent-type)
text: string[](#textcontent-text)
The text content of the message.
annotations?: Annotations[](#textcontent-annotations)
Optional annotations for the client.
\_meta?: MetaObject[](#textcontent-_meta)
###
[​
](#textresourcecontents)
`TextResourceContents`
interface TextResourceContents {
 [uri](#textresourcecontents-uri): string;
 [mimeType](#textresourcecontents-mimetype)?: string;
 [\_meta](#textresourcecontents-_meta)?: [MetaObject](#metaobject);
 [text](#textresourcecontents-text): string;
}
Example: Text file contents[](#textresourcecontents-example-text-file-contents)
```
`{
“uri”: “file:///example.txt”,
“mimeType”: “text/plain”,
“text”: “Resource content”
} `Copy
```
uri: string[](#textresourcecontents-uri)
The URI of this resource.
Inherited from ResourceContents.uri
mimeType?: string[](#textresourcecontents-mimetype)
The MIME type of this resource, if known.
Inherited from ResourceContents.mimeType
\_meta?: MetaObject[](#textresourcecontents-_meta)
Inherited from ResourceContents.\_meta
text: string[](#textresourcecontents-text)
The text of the item. This must only be set if the item can actually be represented as text (not binary data).
##
[​
](#completion/complete)
`completion/complete`
###
[​
](#completerequest)
`CompleteRequest`
interface CompleteRequest {
 [jsonrpc](#completerequest-jsonrpc): “2.0”;
 [id](#completerequest-id): [RequestId](#requestid);
 [method](#completerequest-method): “completion/complete”;
 [params](#completerequest-params): [CompleteRequestParams](#completerequestparams);
}
A request from the client to the server, to ask for completion options.
Example: Completion request[](#completerequest-example-completion-request)
```
`{
“jsonrpc”: “2.0”,
“id”: “completion-example”,
“method”: “completion/complete”,
“params”: {
“ref”: {
“type”: “ref/prompt”,
“name”: “code\_review”
},
“argument”: {
“name”: “language”,
“value”: “py”
}
}
} `Copy
```
jsonrpc: “2.0”[](#completerequest-jsonrpc)
Inherited from [JSONRPCRequest](#jsonrpcrequest).[jsonrpc](#jsonrpcrequest-jsonrpc)
id: RequestId[](#completerequest-id)
Inherited from [JSONRPCRequest](#jsonrpcrequest).[id](#jsonrpcrequest-id)
method: “completion/complete”[](#completerequest-method)
Overrides [JSONRPCRequest](#jsonrpcrequest).[method](#jsonrpcrequest-method)
params: CompleteRequestParams[](#completerequest-params)
Overrides [JSONRPCRequest](#jsonrpcrequest).[params](#jsonrpcrequest-params)
###
[​
](#completerequestparams)
`CompleteRequestParams`
interface CompleteRequestParams {
 [\_meta](#completerequestparams-_meta)?: [RequestMetaObject](#requestmetaobject);
 [ref](#completerequestparams-ref): [PromptReference](#promptreference) | [ResourceTemplateReference](#resourcetemplatereference);
 [argument](#completerequestparams-argument): { name: string; value: string };
 [context](#completerequestparams-context)?: { arguments?: { [key: string]: string } };
}
Parameters for a `completion/complete` request.
Example: Prompt argument completion[](#completerequestparams-example-prompt-argument-completion)
```
`{
“ref”: {
“type”: “ref/prompt”,
“name”: “code\_review”
},
“argument”: {
“name”: “language”,
“value”: “py”
}
} `Copy
```
Example: Prompt argument completion with context[](#completerequestparams-example-prompt-argument-completion-with-context)
```
`{
“ref”: {
“type”: “ref/prompt”,
“name”: “code\_review”
},
“argument”: {
“name”: “framework”,
“value”: “fla”
},
“context”: {
“arguments”: {
“language”: “python”
}
}
} `Copy
```
\_meta?: RequestMetaObject[](#completerequestparams-_meta)
Inherited from [RequestParams](#requestparams).[\_meta](#requestparams-_meta)
ref: PromptReference | ResourceTemplateReference[](#completerequestparams-ref)
argument: { name: string; value: string }[](#completerequestparams-argument)
The argument’s information
Type Declaration
*
name: string
The name of the argument
*
value: string
The value of the argument to use for completion matching.
context?: { arguments?: { [key: string]: string } }[](#completerequestparams-context)
Additional, optional context for completions
Type Declaration
*
`Optional`arguments?: { [key: string]: string }
Previously-resolved variables in a URI template or prompt.
###
[​
](#completeresultresponse)
`CompleteResultResponse`
interface CompleteResultResponse {
 [jsonrpc](#completeresultresponse-jsonrpc): “2.0”;
 [id](#completeresultresponse-id): [RequestId](#requestid);
 [result](#completeresultresponse-result): [CompleteResult](#completeresult);
}
A successful response from the server for a [completion/complete](#completerequest) request.
Example: Completion result response[](#completeresultresponse-example-completion-result-response)
```
`{
“jsonrpc”: “2.0”,
“id”: “completion-example”,
“result”: {
“completion”: {
“values”: [“flask”],
“total”: 1,
“hasMore”: false
}
}
} `Copy
```
jsonrpc: “2.0”[](#completeresultresponse-jsonrpc)
Inherited from [JSONRPCResultResponse](#jsonrpcresultresponse).[jsonrpc](#jsonrpcresultresponse-jsonrpc)
id: RequestId[](#completeresultresponse-id)
Inherited from [JSONRPCResultResponse](#jsonrpcresultresponse).[id](#jsonrpcresultresponse-id)
result: CompleteResult[](#completeresultresponse-result)
Overrides [JSONRPCResultResponse](#jsonrpcresultresponse).[result](#jsonrpcresultresponse-result)
###
[​
](#completeresult)
`CompleteResult`
interface CompleteResult {
 [\_meta](#completeresult-_meta)?: [MetaObject](#metaobject);
 [completion](#completeresult-completion): { values: string[]; total?: number; hasMore?: boolean };
 [key: string]: unknown;
}
The result returned by the server for a [completion/complete](#completerequest) request.
Example: Single completion value[](#completeresult-example-single-completion-value)
```
`{
“completion”: {
“values”: [“flask”],
“total”: 1,
“hasMore”: false
}
} `Copy
```
Example: Multiple completion values with more available[](#completeresult-example-multiple-completion-values-with-more-available)
```
`{
“completion”: {
“values”: [“python”, “pytorch”, “pyside”],
“total”: 10,
“hasMore”: true
}
} `Copy
```
\_meta?: MetaObject[](#completeresult-_meta)
Inherited from [Result](#result).[\_meta](#result-_meta)
completion: { values: string[]; total?: number; hasMore?: boolean }[](#completeresult-completion)
Type Declaration
*
values: string[]
An array of completion values. Must not exceed 100 items.
*
`Optional`total?: number
The total number of completion options available. This can exceed the number of values actually sent in the response.
*
`Optional`hasMore?: boolean
Indicates whether there are additional completion options beyond those provided in the current response, even if the exact total is unknown.
###
[​
](#promptreference)
`PromptReference`
interface PromptReference {
 [name](#promptreference-name): string;
 [title](#promptreference-title)?: string;
 [type](#promptreference-type): “ref/prompt”;
}
Identifies a prompt.
name: string[](#promptreference-name)
Intended for programmatic or logical use, but used as a display name in past specs or fallback (if title isn’t present).
Inherited from BaseMetadata.name
title?: string[](#promptreference-title)
Intended for UI and end-user contexts — optimized to be human-readable and easily understood,
even by those unfamiliar with domain-specific terminology.
If not provided, the name should be used for display (except for [Tool](#tool),
where `annotations.title` should be given precedence over using `name`,
if present).
Inherited from BaseMetadata.title
type: “ref/prompt”[](#promptreference-type)
###
[​
](#resourcetemplatereference)
`ResourceTemplateReference`
interface ResourceTemplateReference {
 [type](#resourcetemplatereference-type): “ref/resource”;
 [uri](#resourcetemplatereference-uri): string;
}
A reference to a resource or resource template definition.
type: “ref/resource”[](#resourcetemplatereference-type)
uri: string[](#resourcetemplatereference-uri)
The URI or URI template of the resource.
##
[​
](#elicitation/create)
`elicitation/create`
###
[​
](#elicitrequest)
`ElicitRequest`
interface ElicitRequest {
 [jsonrpc](#elicitrequest-jsonrpc): “2.0”;
 [id](#elicitrequest-id): [RequestId](#requestid);
 [method](#elicitrequest-method): “elicitation/create”;
 [params](#elicitrequest-params): [ElicitRequestParams](#elicitrequestparams);
}
A request from the server to elicit additional information from the user via the client.
Example: Elicitation request[](#elicitrequest-example-elicitation-request)
```
`{
“jsonrpc”: “2.0”,
“id”: “elicitation-example”,
“method”: “elicitation/create”,
“params”: {
“mode”: “form”,
“message”: “Please provide your GitHub username”,
“requestedSchema”: {
“type”: “object”,
“properties”: {
“name”: {
“type”: “string”
}
},
“required”: [“name”]
}
}
} `Copy
```
jsonrpc: “2.0”[](#elicitrequest-jsonrpc)
Inherited from [JSONRPCRequest](#jsonrpcrequest).[jsonrpc](#jsonrpcrequest-jsonrpc)
id: RequestId[](#elicitrequest-id)
Inherited from [JSONRPCRequest](#jsonrpcrequest).[id](#jsonrpcrequest-id)
method: “elicitation/create”[](#elicitrequest-method)
Overrides [JSONRPCRequest](#jsonrpcrequest).[method](#jsonrpcrequest-method)
params: ElicitRequestParams[](#elicitrequest-params)
Overrides [JSONRPCRequest](#jsonrpcrequest).[params](#jsonrpcrequest-params)
###
[​
](#elicitrequestparams)
`ElicitRequestParams`
ElicitRequestParams: [ElicitRequestFormParams](#elicitrequestformparams) | [ElicitRequestURLParams](#elicitrequesturlparams)
The parameters for a request to elicit additional information from the user via the client.
###
[​
](#elicitresultresponse)
`ElicitResultResponse`
interface ElicitResultResponse {
 [jsonrpc](#elicitresultresponse-jsonrpc): “2.0”;
 [id](#elicitresultresponse-id): [RequestId](#requestid);
 [result](#elicitresultresponse-result): [ElicitResult](#elicitresult);
}
A successful response from the client for a [elicitation/create](#elicitrequest) request.
Example: Elicitation result response[](#elicitresultresponse-example-elicitation-result-response)
```
`{
“jsonrpc”: “2.0”,
“id”: “elicitation-example”,
“result”: {
“action”: “accept”,
“content”: {
“name”: “octocat”
}
}
} `Copy
```
jsonrpc: “2.0”[](#elicitresultresponse-jsonrpc)
Inherited from [JSONRPCResultResponse](#jsonrpcresultresponse).[jsonrpc](#jsonrpcresultresponse-jsonrpc)
id: RequestId[](#elicitresultresponse-id)
Inherited from [JSONRPCResultResponse](#jsonrpcresultresponse).[id](#jsonrpcresultresponse-id)
result: ElicitResult[](#elicitresultresponse-result)
Overrides [JSONRPCResultResponse](#jsonrpcresultresponse).[result](#jsonrpcresultresponse-result)
###
[​
](#elicitresult)
`ElicitResult`
interface ElicitResult {
 [\_meta](#elicitresult-_meta)?: [MetaObject](#metaobject);
 [action](#elicitresult-action): “accept” | “decline” | “cancel”;
 [content](#elicitresult-content)?: { [key: string]: string | number | boolean | string[] };
 [key: string]: unknown;
}
The result returned by the client for an [elicitation/create](#elicitrequest) request.
Example: Input single field[](#elicitresult-example-input-single-field)
```
`{
“action”: “accept”,
“content”: {
“name”: “octocat”
}
} `Copy
```
Example: Input multiple fields[](#elicitresult-example-input-multiple-fields)
```
`{
“action”: “accept”,
“content”: {
“name”: “Monalisa Octocat”,
“email”: “[octocat@github.com](mailto:octocat@github.com)”,
“age”: 30
}
} `Copy
```
Example: Accept URL mode (no content)[](#elicitresult-example-accept-url-mode-no-content)
```
`{
“action”: “accept”
} `Copy
```
\_meta?: MetaObject[](#elicitresult-_meta)
Inherited from [Result](#result).[\_meta](#result-_meta)
action: “accept” | “decline” | “cancel”[](#elicitresult-action)
The user action in response to the elicitation.
* `“accept”`: User submitted the form/confirmed the action
* `“decline”`: User explicitly declined the action
* `“cancel”`: User dismissed without making an explicit choice
content?: { [key: string]: string | number | boolean | string[] }[](#elicitresult-content)
The submitted form data, only present when action is `“accept”` and mode was `“form”`.
Contains values matching the requested schema.
Omitted for out-of-band mode responses.
###
[​
](#booleanschema)
`BooleanSchema`
interface BooleanSchema {
 [type](#booleanschema-type): “boolean”;
 [title](#booleanschema-title)?: string;
 [description](#booleanschema-description)?: string;
 [default](#booleanschema-default)?: boolean;
}
Example: Boolean input schema[](#booleanschema-example-boolean-input-schema)
```
`{
“type”: “boolean”,
“title”: “Display Name”,
“description”: “Description text”,
“default”: false
} `Copy
```
type: “boolean”[](#booleanschema-type)
title?: string[](#booleanschema-title)
description?: string[](#booleanschema-description)
default?: boolean[](#booleanschema-default)
###
[​
](#elicitrequestformparams)
`ElicitRequestFormParams`
interface ElicitRequestFormParams {
 [task](#elicitrequestformparams-task)?: [TaskMetadata](#taskmetadata);
 [\_meta](#elicitrequestformparams-_meta)?: [RequestMetaObject](#requestmetaobject);
 [mode](#elicitrequestformparams-mode)?: “form”;
 [message](#elicitrequestformparams-message): string;
 [requestedSchema](#elicitrequestformparams-requestedschema): {
 $schema?: string;
 type: “object”;
 properties: { [key: string]: [PrimitiveSchemaDefinition](#primitiveschemadefinition) };
 required?: string[];
 };
}
The parameters for a request to elicit non-sensitive information from the user via a form in the client.
Example: Elicit single field[](#elicitrequestformparams-example-elicit-single-field)
```
`{
“mode”: “form”,
“message”: “Please provide your GitHub username”,
“requestedSchema”: {
“type”: “object”,
“properties”: {
“name”: {
“type”: “string”
}
},
“required”: [“name”]
}
} `Copy
```
Example: Elicit multiple fields[](#elicitrequestformparams-example-elicit-multiple-fields)
```
`{
“mode”: “form”,
“message”: “Please provide your contact information”,
“requestedSchema”: {
“type”: “object”,
“properties”: {
“name”: {
“type”: “string”,
“description”: “Your full name”
},
“email”: {
“type”: “string”,
“format”: “email”,
“description”: “Your email address”
},
“age”: {
“type”: “number”,
“minimum”: 18,
“description”: “Your age”
}
},
“required”: [“name”, “email”]
}
} `Copy
```
task?: TaskMetadata[](#elicitrequestformparams-task)
If specified, the caller is requesting task-augmented execution for this request.
The request will return a [CreateTaskResult](#createtaskresult) immediately, and the actual result can be
retrieved later via [tasks/result](#gettaskpayloadrequest).
Task augmentation is subject to capability negotiation - receivers MUST declare support
for task augmentation of specific request types in their capabilities.
Inherited from TaskAugmentedRequestParams.task
\_meta?: RequestMetaObject[](#elicitrequestformparams-_meta)
Inherited from TaskAugmentedRequestParams.\_meta
mode?: “form”[](#elicitrequestformparams-mode)
The elicitation mode.
message: string[](#elicitrequestformparams-message)
The message to present to the user describing what information is being requested.
requestedSchema: { $schema?: string; type: “object”; properties: { [key: string]: PrimitiveSchemaDefinition }; required?: string[]; }[](#elicitrequestformparams-requestedschema)
A restricted subset of JSON Schema.
Only top-level properties are allowed, without nesting.
###
[​
](#elicitrequesturlparams)
`ElicitRequestURLParams`
interface ElicitRequestURLParams {
 [task](#elicitrequesturlparams-task)?: [TaskMetadata](#taskmetadata);
 [\_meta](#elicitrequesturlparams-_meta)?: [RequestMetaObject](#requestmetaobject);
 [mode](#elicitrequesturlparams-mode): “url”;
 [message](#elicitrequesturlparams-message): string;
 [elicitationId](#elicitrequesturlparams-elicitationid): string;
 [url](#elicitrequesturlparams-url): string;
}
The parameters for a request to elicit information from the user via a URL in the client.
Example: Elicit sensitive data[](#elicitrequesturlparams-example-elicit-sensitive-data)
```
`{
“mode”: “url”,
“elicitationId”: “550e8400-e29b-41d4-a716-446655440000”,
“url”: “[https://mcp.example.com/ui/set&#x5F;api&#x5F;key](https://mcp.example.com/ui/set&amp;#x5F;api&amp;#x5F;key)”,
“message”: “Please provide your API key to continue.”
} `Copy
```
task?: TaskMetadata[](#elicitrequesturlparams-task)
If specified, the caller is requesting task-augmented execution for this request.
The request will return a [CreateTaskResult](#createtaskresult) immediately, and the actual result can be
retrieved later via [tasks/result](#gettaskpayloadrequest).
Task augmentation is subject to capability negotiation - receivers MUST declare support
for task augmentation of specific request types in their capabilities.
Inherited from TaskAugmentedRequestParams.task
\_meta?: RequestMetaObject[](#elicitrequesturlparams-_meta)
Inherited from TaskAugmentedRequestParams.\_meta
mode: “url”[](#elicitrequesturlparams-mode)
The elicitation mode.
message: string[](#elicitrequesturlparams-message)
The message to present to the user explaining why the interaction is needed.
elicitationId: string[](#elicitrequesturlparams-elicitationid)
The ID of the elicitation, which must be unique within the context of the server.
The client MUST treat this ID as an opaque value.
url: string[](#elicitrequesturlparams-url)
The URL that the user should navigate to.
###
[​
](#enumschema)
`EnumSchema`
EnumSchema:
 | [SingleSelectEnumSchema](#singleselectenumschema)
 | [MultiSelectEnumSchema](#multiselectenumschema)
 | [LegacyTitledEnumSchema](#legacytitledenumschema)
###
[​
](#legacytitledenumschema)
`LegacyTitledEnumSchema`
interface LegacyTitledEnumSchema {
 [type](#legacytitledenumschema-type): “string”;
 [title](#legacytitledenumschema-title)?: string;
 [description](#legacytitledenumschema-description)?: string;
 [enum](#legacytitledenumschema-enum): string[];
 [enumNames](#legacytitledenumschema-enumnames)?: string[];
 [default](#legacytitledenumschema-default)?: string;
}
Use [TitledSingleSelectEnumSchema](#titledsingleselectenumschema) instead.
This interface will be removed in a future version.
type: “string”[](#legacytitledenumschema-type)
title?: string[](#legacytitledenumschema-title)
description?: string[](#legacytitledenumschema-description)
enum: string[][](#legacytitledenumschema-enum)
enumNames?: string[][](#legacytitledenumschema-enumnames)
(Legacy) Display names for enum values.
Non-standard according to JSON schema 2020-12.
default?: string[](#legacytitledenumschema-default)
###
[​
](#multiselectenumschema)
`MultiSelectEnumSchema`
MultiSelectEnumSchema:
 | [UntitledMultiSelectEnumSchema](#untitledmultiselectenumschema)
 | [TitledMultiSelectEnumSchema](#titledmultiselectenumschema)
###
[​
](#numberschema)
`NumberSchema`
interface NumberSchema {
 [type](#numberschema-type): “number” | “integer”;
 [title](#numberschema-title)?: string;
 [description](#numberschema-description)?: string;
 [minimum](#numberschema-minimum)?: number;
 [maximum](#numberschema-maximum)?: number;
 [default](#numberschema-default)?: number;
}
Example: Number input schema[](#numberschema-example-number-input-schema)
```
`{
“type”: “number”,
“title”: “Display Name”,
“description”: “Description text”,
“minimum”: 0,
“maximum”: 100,
“default”: 50
} `Copy
```
type: “number” | “integer”[](#numberschema-type)
title?: string[](#numberschema-title)
description?: string[](#numberschema-description)
minimum?: number[](#numberschema-minimum)
maximum?: number[](#numberschema-maximum)
default?: number[](#numberschema-default)
###
[​
](#primitiveschemadefinition)
`PrimitiveSchemaDefinition`
PrimitiveSchemaDefinition:
 | [StringSchema](#stringschema)
 | [NumberSchema](#numberschema)
 | [BooleanSchema](#booleanschema)
 | [EnumSchema](#enumschema)
Restricted schema definitions that only allow primitive types
without nested objects or arrays.
###
[​
](#singleselectenumschema)
`SingleSelectEnumSchema`
SingleSelectEnumSchema:
 | [UntitledSingleSelectEnumSchema](#untitledsingleselectenumschema)
 | [TitledSingleSelectEnumSchema](#titledsingleselectenumschema)
###
[​
](#stringschema)
`StringSchema`
interface StringSchema {
 [type](#stringschema-type): “string”;
 [title](#stringschema-title)?: string;
 [description](#stringschema-description)?: string;
 [minLength](#stringschema-minlength)?: number;
 [maxLength](#stringschema-maxlength)?: number;
 [format](#stringschema-format)?: “uri” | “email” | “date” | “date-time”;
 [default](#stringschema-default)?: string;
}
Example: Email input schema[](#stringschema-example-email-input-schema)
```
`{
“type”: “string”,
“title”: “Display Name”,
“description”: “Description text”,
“minLength”: 3,
“maxLength”: 50,
“format”: “email”,
“default”: “[user@example.com](mailto:user@example.com)”
} `Copy
```
type: “string”[](#stringschema-type)
title?: string[](#stringschema-title)
description?: string[](#stringschema-description)
minLength?: number[](#stringschema-minlength)
maxLength?: number[](#stringschema-maxlength)
format?: “uri” | “email” | “date” | “date-time”[](#stringschema-format)
default?: string[](#stringschema-default)
###
[​
](#titledmultiselectenumschema)
`TitledMultiSelectEnumSchema`
interface TitledMultiSelectEnumSchema {
 [type](#titledmultiselectenumschema-type): “array”;
 [title](#titledmultiselectenumschema-title)?: string;
 [description](#titledmultiselectenumschema-description)?: string;
 [minItems](#titledmultiselectenumschema-minitems)?: number;
 [maxItems](#titledmultiselectenumschema-maxitems)?: number;
 [items](#titledmultiselectenumschema-items): { anyOf: { const: string; title: string }[] };
 [default](#titledmultiselectenumschema-default)?: string[];
}
Schema for multiple-selection enumeration with display titles for each option.
Example: Titled color multi-select schema[](#titledmultiselectenumschema-example-titled-color-multi-select-schema)
```
`{
“type”: “array”,
“title”: “Color Selection”,
“description”: “Choose your favorite colors”,
“minItems”: 1,
“maxItems”: 2,
“items”: {
“anyOf”: [
{ “const”: “#FF0000”, “title”: “Red” },
{ “const”: “#00FF00”, “title”: “Green” },
{ “const”: “#0000FF”, “title”: “Blue” }
]
},
“default”: [“#FF0000”, “#00FF00”]
} `Copy
```
type: “array”[](#titledmultiselectenumschema-type)
title?: string[](#titledmultiselectenumschema-title)
Optional title for the enum field.
description?: string[](#titledmultiselectenumschema-description)
Optional description for the enum field.
minItems?: number[](#titledmultiselectenumschema-minitems)
Minimum number of items to select.
maxItems?: number[](#titledmultiselectenumschema-maxitems)
Maximum number of items to select.
items: { anyOf: { const: string; title: string }[] }[](#titledmultiselectenumschema-items)
Schema for array items with enum options and display labels.
Type Declaration
*
anyOf: { const: string; title: string }[]
Array of enum options with values and display labels.
default?: string[][](#titledmultiselectenumschema-default)
Optional default value.
###
[​
](#titledsingleselectenumschema)
`TitledSingleSelectEnumSchema`
interface TitledSingleSelectEnumSchema {
 [type](#titledsingleselectenumschema-type): “string”;
 [title](#titledsingleselectenumschema-title)?: string;
 [description](#titledsingleselectenumschema-description)?: string;
 [oneOf](#titledsingleselectenumschema-oneof): { const: string; title: string }[];
 [default](#titledsingleselectenumschema-default)?: string;
}
Schema for single-selection enumeration with display titles for each option.
Example: Titled color select schema[](#titledsingleselectenumschema-example-titled-color-select-schema)
```
`{
“type”: “string”,
“title”: “Color Selection”,
“description”: “Choose your favorite color”,
“oneOf”: [
{ “const”: “#FF0000”, “title”: “Red” },
{ “const”: “#00FF00”, “title”: “Green” },
{ “const”: “#0000FF”, “title”: “Blue” }
],
“default”: “#FF0000”
} `Copy
```
type: “string”[](#titledsingleselectenumschema-type)
title?: string[](#titledsingleselectenumschema-title)
Optional title for the enum field.
description?: string[](#titledsingleselectenumschema-description)
Optional description for the enum field.
oneOf: { const: string; title: string }[][](#titledsingleselectenumschema-oneof)
Array of enum options with values and display labels.
Type Declaration
*
const: string
The enum value.
*
title: string
Display label for this option.
default?: string[](#titledsingleselectenumschema-default)
Optional default value.
###
[​
](#untitledmultiselectenumschema)
`UntitledMultiSelectEnumSchema`
interface UntitledMultiSelectEnumSchema {
 [type](#untitledmultiselectenumschema-type): “array”;
 [title](#untitledmultiselectenumschema-title)?: string;
 [description](#untitledmultiselectenumschema-description)?: string;
 [minItems](#untitledmultiselectenumschema-minitems)?: number;
 [maxItems](#untitledmultiselectenumschema-maxitems)?: number;
 [items](#untitledmultiselectenumschema-items): { type: “string”; enum: string[] };
 [default](#untitledmultiselectenumschema-default)?: string[];
}
Schema for multiple-selection enumeration without display titles for options.
Example: Color multi-select schema[](#untitledmultiselectenumschema-example-color-multi-select-schema)
```
`{
“type”: “array”,
“title”: “Color Selection”,
“description”: “Choose your favorite colors”,
“minItems”: 1,
“maxItems”: 2,
“items”: {
“type”: “string”,
“enum”: [“Red”, “Green”, “Blue”]
},
“default”: [“Red”, “Green”]
} `Copy
```
type: “array”[](#untitledmultiselectenumschema-type)
title?: string[](#untitledmultiselectenumschema-title)
Optional title for the enum field.
description?: string[](#untitledmultiselectenumschema-description)
Optional description for the enum field.
minItems?: number[](#untitledmultiselectenumschema-minitems)
Minimum number of items to select.
maxItems?: number[](#untitledmultiselectenumschema-maxitems)
Maximum number of items to select.
items: { type: “string”; enum: string[] }[](#untitledmultiselectenumschema-items)
Schema for the array items.
Type Declaration
*
type: “string”
*
enum: string[]
Array of enum values to choose from.
default?: string[][](#untitledmultiselectenumschema-default)
Optional default value.
###
[​
](#untitledsingleselectenumschema)
`UntitledSingleSelectEnumSchema`
interface UntitledSingleSelectEnumSchema {
 [type](#untitledsingleselectenumschema-type): “string”;
 [title](#untitledsingleselectenumschema-title)?: string;
 [description](#untitledsingleselectenumschema-description)?: string;
 [enum](#untitledsingleselectenumschema-enum): string[];
 [default](#untitledsingleselectenumschema-default)?: string;
}
Schema for single-selection enumeration without display titles for options.
Example: Color select schema[](#untitledsingleselectenumschema-example-color-select-schema)
```
`{
“type”: “string”,
“title”: “Color Selection”,
“description”: “Choose your favorite color”,
“enum”: [“Red”, “Green”, “Blue”],
“default”: “Red”
} `Copy
```
type: “string”[](#untitledsingleselectenumschema-type)
title?: string[](#untitledsingleselectenumschema-title)
Optional title for the enum field.
description?: string[](#untitledsingleselectenumschema-description)
Optional description for the enum field.
enum: string[][](#untitledsingleselectenumschema-enum)
Array of enum values to choose from.
default?: string[](#untitledsingleselectenumschema-default)
Optional default value.
##
[​
](#initialize)
`initialize`
###
[​
](#initializerequest)
`InitializeRequest`
interface InitializeRequest {
 [jsonrpc](#initializerequest-jsonrpc): “2.0”;
 [id](#initializerequest-id): [RequestId](#requestid);
 [method](#initializerequest-method): “initialize”;
 [params](#initializerequest-params): [InitializeRequestParams](#initializerequestparams);
}
This request is sent from the client to the server when it first connects, asking it to begin initialization.
Example: Initialize request[](#initializerequest-example-initialize-request)
```
`{
“jsonrpc”: “2.0”,
“id”: “initialize-example”,
“method”: “initialize”,
“params”: {
“protocolVersion”: “2024-11-05”,
“capabilities”: {
“roots”: {
“listChanged”: true
},
“sampling”: {},
“elicitation”: {
“form”: {},
“url”: {}
},
“tasks”: {
“requests”: {
“elicitation”: {
“create”: {}
},
“sampling”: {
“createMessage”: {}
}
}
}
},
“clientInfo”: {
“name”: “ExampleClient”,
“title”: “Example Client Display Name”,
“version”: “1.0.0”,
“description”: “An example MCP client application”,
“icons”: [
{
“src”: “[https://example.com/icon.png](https://example.com/icon.png)”,
“mimeType”: “image/png”,
“sizes”: [“48x48”]
}
],
“websiteUrl”: “[https://example.com](https://example.com)”
}
}
} `Copy
```
jsonrpc: “2.0”[](#initializerequest-jsonrpc)
Inherited from [JSONRPCRequest](#jsonrpcrequest).[jsonrpc](#jsonrpcrequest-jsonrpc)
id: RequestId[](#initializerequest-id)
Inherited from [JSONRPCRequest](#jsonrpcrequest).[id](#jsonrpcrequest-id)
method: “initialize”[](#initializerequest-method)
Overrides [JSONRPCRequest](#jsonrpcrequest).[method](#jsonrpcrequest-method)
params: InitializeRequestParams[](#initializerequest-params)
Overrides [JSONRPCRequest](#jsonrpcrequest).[params](#jsonrpcrequest-params)
###
[​
](#initializerequestparams)
`InitializeRequestParams`
interface InitializeRequestParams {
 [\_meta](#initializerequestparams-_meta)?: [RequestMetaObject](#requestmetaobject);
 [protocolVersion](#initializerequestparams-protocolversion): string;
 [capabilities](#initializerequestparams-capabilities): [ClientCapabilities](#clientcapabilities);
 [clientInfo](#initializerequestparams-clientinfo): [Implementation](#implementation);
}
Parameters for an `initialize` request.
Example: Full client capabilities[](#initializerequestparams-example-full-client-capabilities)
```
`{
“protocolVersion”: “2024-11-05”,
“capabilities”: {
“roots”: {
“listChanged”: true
},
“sampling”: {},
“elicitation”: {
“form”: {},
“url”: {}
},
“tasks”: {
“requests”: {
“elicitation”: {
“create”: {}
},
“sampling”: {
“createMessage”: {}
}
}
}
},
“clientInfo”: {
“name”: “ExampleClient”,
“title”: “Example Client Display Name”,
“version”: “1.0.0”,
“description”: “An example MCP client application”,
“icons”: [
{
“src”: “[https://example.com/icon.png](https://example.com/icon.png)”,
“mimeType”: “image/png”,
“sizes”: [“48x48”]
}
],
“websiteUrl”: “[https://example.com](https://example.com)”
}
} `Copy
```
\_meta?: RequestMetaObject[](#initializerequestparams-_meta)
Inherited from [RequestParams](#requestparams).[\_meta](#requestparams-_meta)
protocolVersion: string[](#initializerequestparams-protocolversion)
The latest version of the Model Context Protocol that the client supports. The client MAY decide to support older versions as well.
capabilities: ClientCapabilities[](#initializerequestparams-capabilities)
clientInfo: Implementation[](#initializerequestparams-clientinfo)
###
[​
](#initializeresultresponse)
`InitializeResultResponse`
interface InitializeResultResponse {
 [jsonrpc](#initializeresultresponse-jsonrpc): “2.0”;
 [id](#initializeresultresponse-id): [RequestId](#requestid);
 [result](#initializeresultresponse-result): [InitializeResult](#initializeresult);
}
A successful response from the server for a [initialize](#initializerequest) request.
Example: Initialize result response[](#initializeresultresponse-example-initialize-result-response)
```
`{
“jsonrpc”: “2.0”,
“id”: “initialize-example”,
“result”: {
“protocolVersion”: “2024-11-05”,
“capabilities”: {
“logging”: {},
“prompts”: {
“listChanged”: true
},
“resources”: {
“subscribe”: true,
“listChanged”: true
},
“tools”: {
“listChanged”: true
},
“tasks”: {
“list”: {},
“cancel”: {},
“requests”: {
“tools”: {
“call”: {}
}
}
}
},
“serverInfo”: {
“name”: “ExampleServer”,
“title”: “Example Server Display Name”,
“version”: “1.0.0”,
“description”: “An example MCP server providing tools and resources”,
“icons”: [
{
“src”: “[https://example.com/server-icon.svg](https://example.com/server-icon.svg)”,
“mimeType”: “image/svg+xml”,
“sizes”: [“any”]
}
],
“websiteUrl”: “[https://example.com/server](https://example.com/server)”
},
“instructions”: “Optional instructions for the client”
}
} `Copy
```
jsonrpc: “2.0”[](#initializeresultresponse-jsonrpc)
Inherited from [JSONRPCResultResponse](#jsonrpcresultresponse).[jsonrpc](#jsonrpcresultresponse-jsonrpc)
id: RequestId[](#initializeresultresponse-id)
Inherited from [JSONRPCResultResponse](#jsonrpcresultresponse).[id](#jsonrpcresultresponse-id)
result: InitializeResult[](#initializeresultresponse-result)
Overrides [JSONRPCResultResponse](#jsonrpcresultresponse).[result](#jsonrpcresultresponse-result)
###
[​
](#initializeresult)
`InitializeResult`
interface InitializeResult {
 [\_meta](#initializeresult-_meta)?: [MetaObject](#metaobject);
 [protocolVersion](#initializeresult-protocolversion): string;
 [capabilities](#initializeresult-capabilities): [ServerCapabilities](#servercapabilities);
 [serverInfo](#initializeresult-serverinfo): [Implementation](#implementation);
 [instructions](#initializeresult-instructions)?: string;
 [key: string]: unknown;
}
The result returned by the server for an [initialize](#initializerequest) request.
Example: Full server capabilities[](#initializeresult-example-full-server-capabilities)
```
`{
“protocolVersion”: “2024-11-05”,
“capabilities”: {
“logging”: {},
“prompts”: {
“listChanged”: true
},
“resources”: {
“subscribe”: true,
“listChanged”: true
},
“tools”: {
“listChanged”: true
},
“tasks”: {
“list”: {},
“cancel”: {},
“requests”: {
“tools”: {
“call”: {}
}
}
}
},
“serverInfo”: {
“name”: “ExampleServer”,
“title”: “Example Server Display Name”,
“version”: “1.0.0”,
“description”: “An example MCP server providing tools and resources”,
“icons”: [
{
“src”: “[https://example.com/server-icon.svg](https://example.com/server-icon.svg)”,
“mimeType”: “image/svg+xml”,
“sizes”: [“any”]
}
],
“websiteUrl”: “[https://example.com/server](https://example.com/server)”
},
“instructions”: “Optional instructions for the client”
} `Copy
```
\_meta?: MetaObject[](#initializeresult-_meta)
Inherited from [Result](#result).[\_meta](#result-_meta)
protocolVersion: string[](#initializeresult-protocolversion)
The version of the Model Context Protocol that the server wants to use. This may not match the version that the client requested. If the client cannot support this version, it MUST disconnect.
capabilities: ServerCapabilities[](#initializeresult-capabilities)
serverInfo: Implementation[](#initializeresult-serverinfo)
instructions?: string[](#initializeresult-instructions)
Instructions describing how to use the server and its features.
Instructions should focus on information that helps the model use the server effectively (e.g., cross-tool relationships, workflow patterns, constraints), but should not duplicate information already in tool descriptions.
Clients MAY add this information to the system prompt.
Example: Server with workflow instructions[](#initializeresult-example-server-with-workflow-instructions)
```
`{
“protocolVersion”: “2024-11-05”,
“capabilities”: {
“tools”: {}
},
“serverInfo”: {
“name”: “DatabaseServer”,
“version”: “1.0.0”,
“description”: “PostgreSQL database management server”
},
“instructions”: “Use ‘validate\_schema’ before ‘migrate\_schema’ for safe migrations. Rate limited to 10 req/min.”
} `Copy
```
###
[​
](#clientcapabilities)
`ClientCapabilities`
interface ClientCapabilities {
 [experimental](#clientcapabilities-experimental)?: { [key: string]: [JSONObject](#jsonobject) };
 [roots](#clientcapabilities-roots)?: { listChanged?: boolean };
 [sampling](#clientcapabilities-sampling)?: { context?: [JSONObject](#jsonobject); tools?: [JSONObject](#jsonobject) };
 [elicitation](#clientcapabilities-elicitation)?: { form?: [JSONObject](#jsonobject); url?: [JSONObject](#jsonobject) };
 [tasks](#clientcapabilities-tasks)?: {
 list?: [JSONObject](#jsonobject);
 cancel?: [JSONObject](#jsonobject);
 requests?: {
 sampling?: { createMessage?: [JSONObject](#jsonobject) };
 elicitation?: { create?: [JSONObject](#jsonobject) };
 };
 };
 [extensions](#clientcapabilities-extensions)?: { [key: string]: [JSONObject](#jsonobject) };
}
Capabilities a client may support. Known capabilities are defined here, in this schema, but this is not a closed set: any client can define its own, additional capabilities.
experimental?: { [key: string]: JSONObject }[](#clientcapabilities-experimental)
Experimental, non-standard capabilities that the client supports.
roots?: { listChanged?: boolean }[](#clientcapabilities-roots)
Present if the client supports listing roots.
Type Declaration
*
`Optional`listChanged?: boolean
Whether the client supports notifications for changes to the roots list.
Example: Roots — minimum baseline support[](#clientcapabilities-example-roots-minimum-baseline-support)
```
`{
“roots”: {}
} `Copy
```
Example: Roots — list changed notifications[](#clientcapabilities-example-roots-list-changed-notifications)
```
`{
“roots”: {
“listChanged”: true
}
} `Copy
```
sampling?: { context?: JSONObject; tools?: JSONObject }[](#clientcapabilities-sampling)
Present if the client supports sampling from an LLM.
Type Declaration
*
`Optional`context?: [JSONObject](#jsonobject)
Whether the client supports context inclusion via `includeContext` parameter.
If not declared, servers SHOULD only use `includeContext: “none”` (or omit it).
*
`Optional`tools?: [JSONObject](#jsonobject)
Whether the client supports tool use via `tools` and `toolChoice` parameters.
Example: Sampling — minimum baseline support[](#clientcapabilities-example-sampling-minimum-baseline-support)
```
`{
“sampling”: {}
} `Copy
```
Example: Sampling — tool use support[](#clientcapabilities-example-sampling-tool-use-support)
```
`{
“sampling”: {
“tools”: {}
}
} `Copy
```
Example: Sampling — context inclusion support (soft-deprecated)[](#clientcapabilities-example-sampling-context-inclusion-support-soft-deprecated)
```
`{
“sampling”: {
“context”: {}
}
} `Copy
```
elicitation?: { form?: JSONObject; url?: JSONObject }[](#clientcapabilities-elicitation)
Present if the client supports elicitation from the server.
Example: Elicitation — form and URL mode support[](#clientcapabilities-example-elicitation-form-and-url-mode-support)
```
`{
“elicitation”: {
“form”: {},
“url”: {}
}
} `Copy
```
Example: Elicitation — form mode only (implicit)[](#clientcapabilities-example-elicitation-form-mode-only-implicit)
```
`{
“elicitation”: {}
} `Copy
```
tasks?: { list?: JSONObject; cancel?: JSONObject; requests?: { sampling?: { createMessage?: JSONObject }; elicitation?: { create?: JSONObject }; }; }[](#clientcapabilities-tasks)
Present if the client supports task-augmented requests.
Type Declaration
*
`Optional`list?: [JSONObject](#jsonobject)
Whether this client supports [tasks/list](#listtasksrequest).
*
`Optional`cancel?: [JSONObject](#jsonobject)
Whether this client supports [tasks/cancel](#canceltaskrequest).
*
`Optional`requests?: {
 sampling?: { createMessage?: [JSONObject](#jsonobject) };
 elicitation?: { create?: [JSONObject](#jsonobject) };
}
Specifies which request types can be augmented with tasks.
*
`Optional`sampling?: { createMessage?: [JSONObject](#jsonobject) }
Task support for sampling-related requests.
*
`Optional`createMessage?: [JSONObject](#jsonobject)
Whether the client supports task-augmented `sampling/createMessage` requests.
*
`Optional`elicitation?: { create?: [JSONObject](#jsonobject) }
Task support for elicitation-related requests.
*
`Optional`create?: [JSONObject](#jsonobject)
Whether the client supports task-augmented [elicitation/create](#elicitrequest) requests.
extensions?: { [key: string]: JSONObject }[](#clientcapabilities-extensions)
Optional MCP extensions that the client supports. Keys are extension identifiers
(e.g., “io.modelcontextprotocol/oauth-client-credentials”), and values are
per-extension settings objects. An empty object indicates support with no settings.
Example: Extensions — UI extension with MIME type support[](#clientcapabilities-example-extensions-ui-extension-with-mime-type-support)
```
`{
“extensions”: {
“io.modelcontextprotocol/apps”: {
“mimeTypes”: [“text/html;profile=mcp-app”]
}
}
} `Copy
```
###
[​
](#implementation)
`Implementation`
interface Implementation {
 [icons](#implementation-icons)?: [Icon](#icon)[];
 [name](#implementation-name): string;
 [title](#implementation-title)?: string;
 [version](#implementation-version): string;
 [description](#implementation-description)?: string;
 [websiteUrl](#implementation-websiteurl)?: string;
}
Describes the MCP implementation.
icons?: Icon[][](#implementation-icons)
Optional set of sized icons that the client can display in a user interface.
Clients that support rendering icons MUST support at least the following MIME types:
* `image/png` - PNG images (safe, universal compatibility)
* `image/jpeg` (and `image/jpg`) - JPEG images (safe, universal compatibility)
Clients that support rendering icons SHOULD also support:
* `image/svg+xml` - SVG images (scalable but requires security precautions)
* `image/webp` - WebP images (modern, efficient format)
Inherited from Icons.icons
name: string[](#implementation-name)
Intended for programmatic or logical use, but used as a display name in past specs or fallback (if title isn’t present).
Inherited from BaseMetadata.name
title?: string[](#implementation-title)
Intended for UI and end-user contexts — optimized to be human-readable and easily understood,
even by those unfamiliar with domain-specific terminology.
If not provided, the name should be used for display (except for [Tool](#tool),
where `annotations.title` should be given precedence over using `name`,
if present).
Inherited from BaseMetadata.title
version: string[](#implementation-version)
The version of this implementation.
description?: string[](#implementation-description)
An optional human-readable description of what this implementation does.
This can be used by clients or servers to provide context about their purpose
and capabilities. For example, a server might describe the types of resources
or tools it provides, while a client might describe its intended use case.
websiteUrl?: string[](#implementation-websiteurl)
An optional URL of the website for this implementation.
###
[​
](#servercapabilities)
`ServerCapabilities`
interface ServerCapabilities {
 [experimental](#servercapabilities-experimental)?: { [key: string]: [JSONObject](#jsonobject) };
 [logging](#servercapabilities-logging)?: [JSONObject](#jsonobject);
 [completions](#servercapabilities-completions)?: [JSONObject](#jsonobject);
 [prompts](#servercapabilities-prompts)?: { listChanged?: boolean };
 [resources](#servercapabilities-resources)?: { subscribe?: boolean; listChanged?: boolean };
 [tools](#servercapabilities-tools)?: { listChanged?: boolean };
 [tasks](#servercapabilities-tasks)?: {
 list?: [JSONObject](#jsonobject);
 cancel?: [JSONObject](#jsonobject);
 requests?: { tools?: { call?: [JSONObject](#jsonobject) } };
 };
 [extensions](#servercapabilities-extensions)?: { [key: string]: [JSONObject](#jsonobject) };
}
Capabilities that a server may support. Known capabilities are defined here, in this schema, but this is not a closed set: any server can define its own, additional capabilities.
experimental?: { [key: string]: JSONObject }[](#servercapabilities-experimental)
Experimental, non-standard capabilities that the server supports.
logging?: JSONObject[](#servercapabilities-logging)
Present if the server supports sending log messages to the client.
Example: Logging — minimum baseline support[](#servercapabilities-example-logging-minimum-baseline-support)
```
`{
“logging”: {}
} `Copy
```
completions?: JSONObject[](#servercapabilities-completions)
Present if the server supports argument autocompletion suggestions.
Example: Completions — minimum baseline support[](#servercapabilities-example-completions-minimum-baseline-support)
```
`{
“completions”: {}
} `Copy
```
prompts?: { listChanged?: boolean }[](#servercapabilities-prompts)
Present if the server offers any prompt templates.
Type Declaration
*
`Optional`listChanged?: boolean
Whether this server supports notifications for changes to the prompt list.
Example: Prompts — minimum baseline support[](#servercapabilities-example-prompts-minimum-baseline-support)
```
`{
“prompts”: {}
} `Copy
```
Example: Prompts — list changed notifications[](#servercapabilities-example-prompts-list-changed-notifications)
```
`{
“prompts”: {
“listChanged”: true
}
} `Copy
```
resources?: { subscribe?: boolean; listChanged?: boolean }[](#servercapabilities-resources)
Present if the server offers any resources to read.
Type Declaration
*
`Optional`subscribe?: boolean
Whether this server supports subscribing to resource updates.
*
`Optional`listChanged?: boolean
Whether this server supports notifications for changes to the resource list.
Example: Resources — minimum baseline support[](#servercapabilities-example-resources-minimum-baseline-support)
```
`{
“resources”: {}
} `Copy
```
Example: Resources — subscription to individual resource updates (only)[](#servercapabilities-example-resources-subscription-to-individual-resource-updates-only)
```
`{
“resources”: {
“subscribe”: true
}
} `Copy
```
Example: Resources — list changed notifications (only)[](#servercapabilities-example-resources-list-changed-notifications-only)
```
`{
“resources”: {
“listChanged”: true
}
} `Copy
```
Example: Resources — all notifications[](#servercapabilities-example-resources-all-notifications)
```
`{
“resources”: {
“subscribe”: true,
“listChanged”: true
}
} `Copy
```
tools?: { listChanged?: boolean }[](#servercapabilities-tools)
Present if the server offers any tools to call.
Type Declaration
*
`Optional`listChanged?: boolean
Whether this server supports notifications for changes to the tool list.
Example: Tools — minimum baseline support[](#servercapabilities-example-tools-minimum-baseline-support)
```
`{
“tools”: {}
} `Copy
```
Example: Tools — list changed notifications[](#servercapabilities-example-tools-list-changed-notifications)
```
`{
“tools”: {
“listChanged”: true
}
} `Copy
```
tasks?: { list?: JSONObject; cancel?: JSONObject; requests?: { tools?: { call?: JSONObject } }; }[](#servercapabilities-tasks)
Present if the server supports task-augmented requests.
Type Declaration
*
`Optional`list?: [JSONObject](#jsonobject)
Whether this server supports [tasks/list](#listtasksrequest).
*
`Optional`cancel?: [JSONObject](#jsonobject)
Whether this server supports [tasks/cancel](#canceltaskrequest).
*
`Optional`requests?: { tools?: { call?: [JSONObject](#jsonobject) } }
Specifies which request types can be augmented with tasks.
*
`Optional`tools?: { call?: [JSONObject](#jsonobject) }
Task support for tool-related requests.
*
`Optional`call?: [JSONObject](#jsonobject)
Whether the server supports task-augmented [tools/call](#calltoolrequest) requests.
extensions?: { [key: string]: JSONObject }[](#servercapabilities-extensions)
Optional MCP extensions that the server supports. Keys are extension identifiers
(e.g., “io.modelcontextprotocol/apps”), and values are per-extension settings
objects. An empty object indicates support with no settings.
Example: Extensions — UI extension support[](#servercapabilities-example-extensions-ui-extension-support)
```
`{
“extensions”: {
“io.modelcontextprotocol/apps”: {}
}
} `Copy
```
##
[​
](#logging/setlevel)
`logging/setLevel`
###
[​
](#setlevelrequest)
`SetLevelRequest`
interface SetLevelRequest {
 [jsonrpc](#setlevelrequest-jsonrpc): “2.0”;
 [id](#setlevelrequest-id): [RequestId](#requestid);
 [method](#setlevelrequest-method): “logging/setLevel”;
 [params](#setlevelrequest-params): [SetLevelRequestParams](#setlevelrequestparams);
}
A request from the client to the server, to enable or adjust logging.
Example: Set logging level request[](#setlevelrequest-example-set-logging-level-request)
```
`{
“jsonrpc”: “2.0”,
“id”: “set-logging-level-example”,
“method”: “logging/setLevel”,
“params”: {
“level”: “info”
}
} `Copy
```
jsonrpc: “2.0”[](#setlevelrequest-jsonrpc)
Inherited from [JSONRPCRequest](#jsonrpcrequest).[jsonrpc](#jsonrpcrequest-jsonrpc)
id: RequestId[](#setlevelrequest-id)
Inherited from [JSONRPCRequest](#jsonrpcrequest).[id](#jsonrpcrequest-id)
method: “logging/setLevel”[](#setlevelrequest-method)
Overrides [JSONRPCRequest](#jsonrpcrequest).[method](#jsonrpcrequest-method)
params: SetLevelRequestParams[](#setlevelrequest-params)
Overrides [JSONRPCRequest](#jsonrpcrequest).[params](#jsonrpcrequest-params)
###
[​
](#setlevelrequestparams)
`SetLevelRequestParams`
interface SetLevelRequestParams {
 [\_meta](#setlevelrequestparams-_meta)?: [RequestMetaObject](#requestmetaobject);
 [level](#setlevelrequestparams-level): [LoggingLevel](#logginglevel);
}
Parameters for a `logging/setLevel` request.
Example: Set log level to “info”[](#setlevelrequestparams-example-set-log-level-to-info)
```
`{
“level”: “info”
} `Copy
```
\_meta?: RequestMetaObject[](#setlevelrequestparams-_meta)
Inherited from [RequestParams](#requestparams).[\_meta](#requestparams-_meta)
level: LoggingLevel[](#setlevelrequestparams-level)
The level of logging that the client wants to receive from the server. The server should send all logs at this level and higher (i.e., more severe) to the client as [notifications/message](#loggingmessagenotification).
###
[​
](#setlevelresultresponse)
`SetLevelResultResponse`
interface SetLevelResultResponse {
 [jsonrpc](#setlevelresultresponse-jsonrpc): “2.0”;
 [id](#setlevelresultresponse-id): [RequestId](#requestid);
 [result](#setlevelresultresponse-result): [Result](#result);
}
A successful response from the server for a [logging/setLevel](#setlevelrequest) request.
Example: Set logging level result response[](#setlevelresultresponse-example-set-logging-level-result-response)
```
`{
“jsonrpc”: “2.0”,
“id”: “set-logging-level-example”,
“result”: {}
} `Copy
```
jsonrpc: “2.0”[](#setlevelresultresponse-jsonrpc)
Inherited from [JSONRPCResultResponse](#jsonrpcresultresponse).[jsonrpc](#jsonrpcresultresponse-jsonrpc)
id: RequestId[](#setlevelresultresponse-id)
Inherited from [JSONRPCResultResponse](#jsonrpcresultresponse).[id](#jsonrpcresultresponse-id)
result: Result[](#setlevelresultresponse-result)
Overrides [JSONRPCResultResponse](#jsonrpcresultresponse).[result](#jsonrpcresultresponse-result)
##
[​
](#notifications/cancelled)
`notifications/cancelled`
###
[​
](#cancellednotification)
`CancelledNotification`
interface CancelledNotification {
 [jsonrpc](#cancellednotification-jsonrpc): “2.0”;
 [method](#cancellednotification-method): “notifications/cancelled”;
 [params](#cancellednotification-params): [CancelledNotificationParams](#cancellednotificationparams);
}
This notification can be sent by either side to indicate that it is cancelling a previously-issued request.
The request SHOULD still be in-flight, but due to communication latency, it is always possible that this notification MAY arrive after the request has already finished.
This notification indicates that the result will be unused, so any associated processing SHOULD cease.
A client MUST NOT attempt to cancel its `initialize` request.
For task cancellation, use the [tasks/cancel](#canceltaskrequest) request instead of this notification.
Example: User-requested cancellation[](#cancellednotification-example-user-requested-cancellation)
```
`{
“jsonrpc”: “2.0”,
“method”: “notifications/cancelled”,
“params”: {
“requestId”: “123”,
“reason”: “User requested cancellation”
}
} `Copy
```
jsonrpc: “2.0”[](#cancellednotification-jsonrpc)
Inherited from [JSONRPCNotification](#jsonrpcnotification).[jsonrpc](#jsonrpcnotification-jsonrpc)
method: “notifications/cancelled”[](#cancellednotification-method)
Overrides [JSONRPCNotification](#jsonrpcnotification).[method](#jsonrpcnotification-method)
params: CancelledNotificationParams[](#cancellednotification-params)
Overrides [JSONRPCNotification](#jsonrpcnotification).[params](#jsonrpcnotification-params)
###
[​
](#cancellednotificationparams)
`CancelledNotificationParams`
interface CancelledNotificationParams {
 [\_meta](#cancellednotificationparams-_meta)?: [MetaObject](#metaobject);
 [requestId](#cancellednotificationparams-requestid)?: [RequestId](#requestid);
 [reason](#cancellednotificationparams-reason)?: string;
}
Parameters for a `notifications/cancelled` notification.
Example: User-requested cancellation[](#cancellednotificationparams-example-user-requested-cancellation)
```
`{
“requestId”: “123”,
“reason”: “User requested cancellation”
} `Copy
```
\_meta?: MetaObject[](#cancellednotificationparams-_meta)
Inherited from [NotificationParams](#notificationparams).[\_meta](#notificationparams-_meta)
requestId?: RequestId[](#cancellednotificationparams-requestid)
The ID of the request to cancel.
This MUST correspond to the ID of a request previously issued in the same direction.
This MUST be provided for cancelling non-task requests.
This MUST NOT be used for cancelling tasks (use the [tasks/cancel](#canceltaskrequest) request instead).
reason?: string[](#cancellednotificationparams-reason)
An optional string describing the reason for the cancellation. This MAY be logged or presented to the user.
##
[​
](#notifications/initialized)
`notifications/initialized`
###
[​
](#initializednotification)
`InitializedNotification`
interface InitializedNotification {
 [jsonrpc](#initializednotification-jsonrpc): “2.0”;
 [method](#initializednotification-method): “notifications/initialized”;
 [params](#initializednotification-params)?: [NotificationParams](#notificationparams);
}
This notification is sent from the client to the server after initialization has finished.
Example: Initialized notification[](#initializednotification-example-initialized-notification)
```
`{
“jsonrpc”: “2.0”,
“method”: “notifications/initialized”
} `Copy
```
jsonrpc: “2.0”[](#initializednotification-jsonrpc)
Inherited from [JSONRPCNotification](#jsonrpcnotification).[jsonrpc](#jsonrpcnotification-jsonrpc)
method: “notifications/initialized”[](#initializednotification-method)
Overrides [JSONRPCNotification](#jsonrpcnotification).[method](#jsonrpcnotification-method)
params?: NotificationParams[](#initializednotification-params)
Overrides [JSONRPCNotification](#jsonrpcnotification).[params](#jsonrpcnotification-params)
##
[​
](#notifications/tasks/status)
`notifications/tasks/status`
###
[​
](#taskstatusnotification)
`TaskStatusNotification`
interface TaskStatusNotification {
 [jsonrpc](#taskstatusnotification-jsonrpc): “2.0”;
 [method](#taskstatusnotification-method): “notifications/tasks/status”;
 [params](#taskstatusnotification-params): [TaskStatusNotificationParams](#taskstatusnotificationparams);
}
An optional notification from the receiver to the requestor, informing them that a task’s status has changed. Receivers are not required to send these notifications.
jsonrpc: “2.0”[](#taskstatusnotification-jsonrpc)
Inherited from [JSONRPCNotification](#jsonrpcnotification).[jsonrpc](#jsonrpcnotification-jsonrpc)
method: “notifications/tasks/status”[](#taskstatusnotification-method)
Overrides [JSONRPCNotification](#jsonrpcnotification).[method](#jsonrpcnotification-method)
params: TaskStatusNotificationParams[](#taskstatusnotification-params)
Overrides [JSONRPCNotification](#jsonrpcnotification).[params](#jsonrpcnotification-params)
###
[​
](#taskstatusnotificationparams)
`TaskStatusNotificationParams`
TaskStatusNotificationParams: [NotificationParams](#notificationparams) & [Task](#task)
Parameters for a `notifications/tasks/status` notification.
##
[​
](#notifications/message)
`notifications/message`
###
[​
](#loggingmessagenotification)
`LoggingMessageNotification`
interface LoggingMessageNotification {
 [jsonrpc](#loggingmessagenotification-jsonrpc): “2.0”;
 [method](#loggingmessagenotification-method): “notifications/message”;
 [params](#loggingmessagenotification-params): [LoggingMessageNotificationParams](#loggingmessagenotificationparams);
}
JSONRPCNotification of a log message passed from server to client. If no `logging/setLevel` request has been sent from the client, the server MAY decide which messages to send automatically.
Example: Log database connection failed[](#loggingmessagenotification-example-log-database-connection-failed)
```
`{
“jsonrpc”: “2.0”,
“method”: “notifications/message”,
“params”: {
“level”: “error”,
“logger”: “database”,
“data”: {
“error”: “Connection failed”,
“details”: {
“host”: “localhost”,
“port”: 5432
}
}
}
} `Copy
```
jsonrpc: “2.0”[](#loggingmessagenotification-jsonrpc)
Inherited from [JSONRPCNotification](#jsonrpcnotification).[jsonrpc](#jsonrpcnotification-jsonrpc)
method: “notifications/message”[](#loggingmessagenotification-method)
Overrides [JSONRPCNotification](#jsonrpcnotification).[method](#jsonrpcnotification-method)
params: LoggingMessageNotificationParams[](#loggingmessagenotification-params)
Overrides [JSONRPCNotification](#jsonrpcnotification).[params](#jsonrpcnotification-params)
###
[​
](#loggingmessagenotificationparams)
`LoggingMessageNotificationParams`
interface LoggingMessageNotificationParams {
 [\_meta](#loggingmessagenotificationparams-_meta)?: [MetaObject](#metaobject);
 [level](#loggingmessagenotificationparams-level): [LoggingLevel](#logginglevel);
 [logger](#loggingmessagenotificationparams-logger)?: string;
 [data](#loggingmessagenotificationparams-data): unknown;
}
Parameters for a `notifications/message` notification.
Example: Log database connection failed[](#loggingmessagenotificationparams-example-log-database-connection-failed)
```
`{
“level”: “error”,
“logger”: “database”,
“data”: {
“error”: “Connection failed”,
“details”: {
“host”: “localhost”,
“port”: 5432
}
}
} `Copy
```
\_meta?: MetaObject[](#loggingmessagenotificationparams-_meta)
Inherited from [NotificationParams](#notificationparams).[\_meta](#notificationparams-_meta)
level: LoggingLevel[](#loggingmessagenotificationparams-level)
The severity of this log message.
logger?: string[](#loggingmessagenotificationparams-logger)
An optional name of the logger issuing this message.
data: unknown[](#loggingmessagenotificationparams-data)
The data to be logged, such as a string message or an object. Any JSON serializable type is allowed here.
##
[​
](#notifications/progress)
`notifications/progress`
###
[​
](#progressnotification)
`ProgressNotification`
interface ProgressNotification {
 [jsonrpc](#progressnotification-jsonrpc): “2.0”;
 [method](#progressnotification-method): “notifications/progress”;
 [params](#progressnotification-params): [ProgressNotificationParams](#progressnotificationparams);
}
An out-of-band notification used to inform the receiver of a progress update for a long-running request.
Example: Progress message[](#progressnotification-example-progress-message)
```
`{
“jsonrpc”: “2.0”,
“method”: “notifications/progress”,
“params”: {
“progressToken”: “oivaizmir”,
“progress”: 50,
“total”: 100,
“message”: “Reticulating splines…”
}
} `Copy
```
jsonrpc: “2.0”[](#progressnotification-jsonrpc)
Inherited from [JSONRPCNotification](#jsonrpcnotification).[jsonrpc](#jsonrpcnotification-jsonrpc)
method: “notifications/progress”[](#progressnotification-method)
Overrides [JSONRPCNotification](#jsonrpcnotification).[method](#jsonrpcnotification-method)
params: ProgressNotificationParams[](#progressnotification-params)
Overrides [JSONRPCNotification](#jsonrpcnotification).[params](#jsonrpcnotification-params)
###
[​
](#progressnotificationparams)
`ProgressNotificationParams`
interface ProgressNotificationParams {
 [\_meta](#progressnotificationparams-_meta)?: [MetaObject](#metaobject);
 [progressToken](#progressnotificationparams-progresstoken): [ProgressToken](#progresstoken);
 [progress](#progressnotificationparams-progress): number;
 [total](#progressnotificationparams-total)?: number;
 [message](#progressnotificationparams-message)?: string;
}
Parameters for a [notifications/progress](#progressnotification) notification.
Example: Progress message[](#progressnotificationparams-example-progress-message)
```
`{
“progressToken”: “oivaizmir”,
“progress”: 50,
“total”: 100,
“message”: “Reticulating splines…”
} `Copy
```
\_meta?: MetaObject[](#progressnotificationparams-_meta)
Inherited from [NotificationParams](#notificationparams).[\_meta](#notificationparams-_meta)
progressToken: ProgressToken[](#progressnotificationparams-progresstoken)
The progress token which was given in the initial request, used to associate this notification with the request that is proceeding.
progress: number[](#progressnotificationparams-progress)
The progress thus far. This should increase every time progress is made, even if the total is unknown.
total?: number[](#progressnotificationparams-total)
Total number of items to process (or total progress required), if known.
message?: string[](#progressnotificationparams-message)
An optional message describing the current progress.
##
[​
](#notifications/prompts/list_changed)
`notifications/prompts/list\_changed`
###
[​
](#promptlistchangednotification)
`PromptListChangedNotification`
interface PromptListChangedNotification {
 [jsonrpc](#promptlistchangednotification-jsonrpc): “2.0”;
 [method](#promptlistchangednotification-method): “notifications/prompts/list\_changed”;
 [params](#promptlistchangednotification-params)?: [NotificationParams](#notificationparams);
}
An optional notification from the server to the client, informing it that the list of prompts it offers has changed. This may be issued by servers without any previous subscription from the client.
Example: Prompts list changed[](#promptlistchangednotification-example-prompts-list-changed)
```
`{
“jsonrpc”: “2.0”,
“method”: “notifications/prompts/list\_changed”
} `Copy
```
jsonrpc: “2.0”[](#promptlistchangednotification-jsonrpc)
Inherited from [JSONRPCNotification](#jsonrpcnotification).[jsonrpc](#jsonrpcnotification-jsonrpc)
method: “notifications/prompts/list\_changed”[](#promptlistchangednotification-method)
Overrides [JSONRPCNotification](#jsonrpcnotification).[method](#jsonrpcnotification-method)
params?: NotificationParams[](#promptlistchangednotification-params)
Overrides [JSONRPCNotification](#jsonrpcnotification).[params](#jsonrpcnotification-params)
##
[​
](#notifications/resources/list_changed)
`notifications/resources/list\_changed`
###
[​
](#resourcelistchangednotification)
`ResourceListChangedNotification`
interface ResourceListChangedNotification {
 [jsonrpc](#resourcelistchangednotification-jsonrpc): “2.0”;
 [method](#resourcelistchangednotification-method): “notifications/resources/list\_changed”;
 [params](#resourcelistchangednotification-params)?: [NotificationParams](#notificationparams);
}
An optional notification from the server to the client, informing it that the list of resources it can read from has changed. This may be issued by servers without any previous subscription from the client.
Example: Resources list changed[](#resourcelistchangednotification-example-resources-list-changed)
```
`{
“jsonrpc”: “2.0”,
“method”: “notifications/resources/list\_changed”
} `Copy
```
jsonrpc: “2.0”[](#resourcelistchangednotification-jsonrpc)
Inherited from [JSONRPCNotification](#jsonrpcnotification).[jsonrpc](#jsonrpcnotification-jsonrpc)
method: “notifications/resources/list\_changed”[](#resourcelistchangednotification-method)
Overrides [JSONRPCNotification](#jsonrpcnotification).[method](#jsonrpcnotification-method)
params?: NotificationParams[](#resourcelistchangednotification-params)
Overrides [JSONRPCNotification](#jsonrpcnotification).[params](#jsonrpcnotification-params)
##
[​
](#notifications/resources/updated)
`notifications/resources/updated`
###
[​
](#resourceupdatednotification)
`ResourceUpdatedNotification`
interface ResourceUpdatedNotification {
 [jsonrpc](#resourceupdatednotification-jsonrpc): “2.0”;
 [method](#resourceupdatednotification-method): “notifications/resources/updated”;
 [params](#resourceupdatednotification-params): [ResourceUpdatedNotificationParams](#resourceupdatednotificationparams);
}
A notification from the server to the client, informing it that a resource has changed and may need to be read again. This should only be sent if the client previously sent a [resources/subscribe](#subscriberequest) request.
Example: File resource updated notification[](#resourceupdatednotification-example-file-resource-updated-notification)
```
`{
“jsonrpc”: “2.0”,
“method”: “notifications/resources/updated”,
“params”: {
“uri”: “file:///project/src/main.rs”
}
} `Copy
```
jsonrpc: “2.0”[](#resourceupdatednotification-jsonrpc)
Inherited from [JSONRPCNotification](#jsonrpcnotification).[jsonrpc](#jsonrpcnotification-jsonrpc)
method: “notifications/resources/updated”[](#resourceupdatednotification-method)
Overrides [JSONRPCNotification](#jsonrpcnotification).[method](#jsonrpcnotification-method)
params: ResourceUpdatedNotificationParams[](#resourceupdatednotification-params)
Overrides [JSONRPCNotification](#jsonrpcnotification).[params](#jsonrpcnotification-params)
###
[​
](#resourceupdatednotificationparams)
`ResourceUpdatedNotificationParams`
interface ResourceUpdatedNotificationParams {
 [\_meta](#resourceupdatednotificationparams-_meta)?: [MetaObject](#metaobject);
 [uri](#resourceupdatednotificationparams-uri): string;
}
Parameters for a `notifications/resources/updated` notification.
Example: File resource updated[](#resourceupdatednotificationparams-example-file-resource-updated)
```
`{
“uri”: “file:///project/src/main.rs”
} `Copy
```
\_meta?: MetaObject[](#resourceupdatednotificationparams-_meta)
Inherited from [NotificationParams](#notificationparams).[\_meta](#notificationparams-_meta)
uri: string[](#resourceupdatednotificationparams-uri)
The URI of the resource that has been updated. This might be a sub-resource of the one that the client actually subscribed to.
##
[​
](#notifications/roots/list_changed)
`notifications/roots/list\_changed`
###
[​
](#rootslistchangednotification)
`RootsListChangedNotification`
interface RootsListChangedNotification {
 [jsonrpc](#rootslistchangednotification-jsonrpc): “2.0”;
 [method](#rootslistchangednotification-method): “notifications/roots/list\_changed”;
 [params](#rootslistchangednotification-params)?: [NotificationParams](#notificationparams);
}
A notification from the client to the server, informing it that the list of roots has changed.
This notification should be sent whenever the client adds, removes, or modifies any root.
The server should then request an updated list of roots using the [ListRootsRequest](#listrootsrequest).
Example: Roots list changed[](#rootslistchangednotification-example-roots-list-changed)
```
`{
“jsonrpc”: “2.0”,
“method”: “notifications/roots/list\_changed”
} `Copy
```
jsonrpc: “2.0”[](#rootslistchangednotification-jsonrpc)
Inherited from [JSONRPCNotification](#jsonrpcnotification).[jsonrpc](#jsonrpcnotification-jsonrpc)
method: “notifications/roots/list\_changed”[](#rootslistchangednotification-method)
Overrides [JSONRPCNotification](#jsonrpcnotification).[method](#jsonrpcnotification-method)
params?: NotificationParams[](#rootslistchangednotification-params)
Overrides [JSONRPCNotification](#jsonrpcnotification).[params](#jsonrpcnotification-params)
##
[​
](#notifications/tools/list_changed)
`notifications/tools/list\_changed`
###
[​
](#toollistchangednotification)
`ToolListChangedNotification`
interface ToolListChangedNotification {
 [jsonrpc](#toollistchangednotification-jsonrpc): “2.0”;
 [method](#toollistchangednotification-method): “notifications/tools/list\_changed”;
 [params](#toollistchangednotification-params)?: [NotificationParams](#notificationparams);
}
An optional notification from the server to the client, informing it that the list of tools it offers has changed. This may be issued by servers without any previous subscription from the client.
Example: Tools list changed[](#toollistchangednotification-example-tools-list-changed)
```
`{
“jsonrpc”: “2.0”,
“method”: “notifications/tools/list\_changed”
} `Copy
```
jsonrpc: “2.0”[](#toollistchangednotification-jsonrpc)
Inherited from [JSONRPCNotification](#jsonrpcnotification).[jsonrpc](#jsonrpcnotification-jsonrpc)
method: “notifications/tools/list\_changed”[](#toollistchangednotification-method)
Overrides [JSONRPCNotification](#jsonrpcnotification).[method](#jsonrpcnotification-method)
params?: NotificationParams[](#toollistchangednotification-params)
Overrides [JSONRPCNotification](#jsonrpcnotification).[params](#jsonrpcnotification-params)
##
[​
](#notifications/elicitation/complete)
`notifications/elicitation/complete`
###
[​
](#elicitationcompletenotification)
`ElicitationCompleteNotification`
interface ElicitationCompleteNotification {
 [jsonrpc](#elicitationcompletenotification-jsonrpc): “2.0”;
 [method](#elicitationcompletenotification-method): “notifications/elicitation/complete”;
 [params](#elicitationcompletenotification-params): { elicitationId: string };
}
An optional notification from the server to the client, informing it of a completion of a out-of-band elicitation request.
Example: Elicitation complete[](#elicitationcompletenotification-example-elicitation-complete)
```
`{
“jsonrpc”: “2.0”,
“method”: “notifications/elicitation/complete”,
“params”: {
“elicitationId”: “550e8400-e29b-41d4-a716-446655440000”
}
} `Copy
```
jsonrpc: “2.0”[](#elicitationcompletenotification-jsonrpc)
Inherited from [JSONRPCNotification](#jsonrpcnotification).[jsonrpc](#jsonrpcnotification-jsonrpc)
method: “notifications/elicitation/complete”[](#elicitationcompletenotification-method)
Overrides [JSONRPCNotification](#jsonrpcnotification).[method](#jsonrpcnotification-method)
params: { elicitationId: string }[](#elicitationcompletenotification-params)
Type Declaration
*
elicitationId: string
The ID of the elicitation that completed.
Overrides [JSONRPCNotification](#jsonrpcnotification).[params](#jsonrpcnotification-params)
##
[​
](#ping)
`ping`
###
[​
](#pingrequest)
`PingRequest`
interface PingRequest {
 [jsonrpc](#pingrequest-jsonrpc): “2.0”;
 [id](#pingrequest-id): [RequestId](#requestid);
 [method](#pingrequest-method): “ping”;
 [params](#pingrequest-params)?: [RequestParams](#requestparams);
}
A ping, issued by either the server or the client, to check that the other party is still alive. The receiver must promptly respond, or else may be disconnected.
Example: Ping request[](#pingrequest-example-ping-request)
```
`{
“jsonrpc”: “2.0”,
“id”: “ping-example”,
“method”: “ping”
} `Copy
```
jsonrpc: “2.0”[](#pingrequest-jsonrpc)
Inherited from [JSONRPCRequest](#jsonrpcrequest).[jsonrpc](#jsonrpcrequest-jsonrpc)
id: RequestId[](#pingrequest-id)
Inherited from [JSONRPCRequest](#jsonrpcrequest).[id](#jsonrpcrequest-id)
method: “ping”[](#pingrequest-method)
Overrides [JSONRPCRequest](#jsonrpcrequest).[method](#jsonrpcrequest-method)
params?: RequestParams[](#pingrequest-params)
Overrides [JSONRPCRequest](#jsonrpcrequest).[params](#jsonrpcrequest-params)
###
[​
](#pingresultresponse)
`PingResultResponse`
interface PingResultResponse {
 [jsonrpc](#pingresultresponse-jsonrpc): “2.0”;
 [id](#pingresultresponse-id): [RequestId](#requestid);
 [result](#pingresultresponse-result): [Result](#result);
}
A successful response for a [ping](#pingrequest) request.
Example: Ping result response[](#pingresultresponse-example-ping-result-response)
```
`{
“jsonrpc”: “2.0”,
“id”: “ping-example”,
“result”: {}
} `Copy
```
jsonrpc: “2.0”[](#pingresultresponse-jsonrpc)
Inherited from [JSONRPCResultResponse](#jsonrpcresultresponse).[jsonrpc](#jsonrpcresultresponse-jsonrpc)
id: RequestId[](#pingresultresponse-id)
Inherited from [JSONRPCResultResponse](#jsonrpcresultresponse).[id](#jsonrpcresultresponse-id)
result: Result[](#pingresultresponse-result)
Overrides [JSONRPCResultResponse](#jsonrpcresultresponse).[result](#jsonrpcresultresponse-result)
##
[​
](#tasks)
`tasks`
###
[​
](#createtaskresultresponse)
`CreateTaskResultResponse`
interface CreateTaskResultResponse {
 [jsonrpc](#createtaskresultresponse-jsonrpc): “2.0”;
 [id](#createtaskresultresponse-id): [RequestId](#requestid);
 [result](#createtaskresultresponse-result): [CreateTaskResult](#createtaskresult);
}
A successful response for a task-augmented request.
jsonrpc: “2.0”[](#createtaskresultresponse-jsonrpc)
Inherited from [JSONRPCResultResponse](#jsonrpcresultresponse).[jsonrpc](#jsonrpcresultresponse-jsonrpc)
id: RequestId[](#createtaskresultresponse-id)
Inherited from [JSONRPCResultResponse](#jsonrpcresultresponse).[id](#jsonrpcresultresponse-id)
result: CreateTaskResult[](#createtaskresultresponse-result)
Overrides [JSONRPCResultResponse](#jsonrpcresultresponse).[result](#jsonrpcresultresponse-result)
###
[​
](#createtaskresult)
`CreateTaskResult`
interface CreateTaskResult {
 [\_meta](#createtaskresult-_meta)?: [MetaObject](#metaobject);
 [task](#createtaskresult-task): [Task](#task);
 [key: string]: unknown;
}
The result returned for a task-augmented request.
\_meta?: MetaObject[](#createtaskresult-_meta)
Inherited from [Result](#result).[\_meta](#result-_meta)
task: Task[](#createtaskresult-task)
###
[​
](#relatedtaskmetadata)
`RelatedTaskMetadata`
interface RelatedTaskMetadata {
 [taskId](#relatedtaskmetadata-taskid): string;
}
Metadata for associating messages with a task.
Include this in the `\_meta` field under the key `io.modelcontextprotocol/related-task`.
taskId: string[](#relatedtaskmetadata-taskid)
The task identifier this message is associated with.
###
[​
](#task)
`Task`
interface Task {
 [taskId](#task-taskid): string;
 [status](#task-status): [TaskStatus](#taskstatus);
 [statusMessage](#task-statusmessage)?: string;
 [createdAt](#task-createdat): string;
 [lastUpdatedAt](#task-lastupdatedat): string;
 [ttl](#task-ttl): number | null;
 [pollInterval](#task-pollinterval)?: number;
}
Data associated with a task.
taskId: string[](#task-taskid)
The task identifier.
status: TaskStatus[](#task-status)
Current task state.
statusMessage?: string[](#task-statusmessage)
Optional human-readable message describing the current task state.
This can provide context for any status, including:
* Reasons for “cancelled” status
* Summaries for “completed” status
* Diagnostic information for “failed” status (e.g., error details, what went wrong)
createdAt: string[](#task-createdat)
ISO 8601 timestamp when the task was created.
lastUpdatedAt: string[](#task-lastupdatedat)
ISO 8601 timestamp when the task was last updated.
ttl: number | null[](#task-ttl)
Actual retention duration from creation in milliseconds, null for unlimited.
pollInterval?: number[](#task-pollinterval)
Suggested polling interval in milliseconds.
###
[​
](#taskmetadata)
`TaskMetadata`
interface TaskMetadata {
 [ttl](#taskmetadata-ttl)?: number;
}
Metadata for augmenting a request with task execution.
Include this in the `task` field of the request parameters.
ttl?: number[](#taskmetadata-ttl)
Requested duration in milliseconds to retain task from creation.
###
[​
](#taskstatus)
`TaskStatus`
TaskStatus: “working” | “input\_required” | “completed” | “failed” | “cancelled”
The status of a task.
##
[​
](#tasks/get)
`tasks/get`
###
[​
](#gettaskrequest)
`GetTaskRequest`
interface GetTaskRequest {
 [jsonrpc](#gettaskrequest-jsonrpc): “2.0”;
 [id](#gettaskrequest-id): [RequestId](#requestid);
 [method](#gettaskrequest-method): “tasks/get”;
 [params](#gettaskrequest-params): { taskId: string };
}
A request to retrieve the state of a task.
jsonrpc: “2.0”[](#gettaskrequest-jsonrpc)
Inherited from [JSONRPCRequest](#jsonrpcrequest).[jsonrpc](#jsonrpcrequest-jsonrpc)
id: RequestId[](#gettaskrequest-id)
Inherited from [JSONRPCRequest](#jsonrpcrequest).[id](#jsonrpcrequest-id)
method: “tasks/get”[](#gettaskrequest-method)
Overrides [JSONRPCRequest](#jsonrpcrequest).[method](#jsonrpcrequest-method)
params: { taskId: string }[](#gettaskrequest-params)
Type Declaration
*
taskId: string
The task identifier to query.
Overrides [JSONRPCRequest](#jsonrpcrequest).[params](#jsonrpcrequest-params)
###
[​
](#gettaskresultresponse)
`GetTaskResultResponse`
interface GetTaskResultResponse {
 [jsonrpc](#gettaskresultresponse-jsonrpc): “2.0”;
 [id](#gettaskresultresponse-id): [RequestId](#requestid);
 [result](#gettaskresultresponse-result): [GetTaskResult](#gettaskresult);
}
A successful response for a [tasks/get](#gettaskrequest) request.
jsonrpc: “2.0”[](#gettaskresultresponse-jsonrpc)
Inherited from [JSONRPCResultResponse](#jsonrpcresultresponse).[jsonrpc](#jsonrpcresultresponse-jsonrpc)
id: RequestId[](#gettaskresultresponse-id)
Inherited from [JSONRPCResultResponse](#jsonrpcresultresponse).[id](#jsonrpcresultresponse-id)
result: GetTaskResult[](#gettaskresultresponse-result)
Overrides [JSONRPCResultResponse](#jsonrpcresultresponse).[result](#jsonrpcresultresponse-result)
###
[​
](#gettaskresult)
`GetTaskResult`
GetTaskResult: [Result](#result) & [Task](#task)
The result returned for a [tasks/get](#gettaskrequest) request.
##
[​
](#tasks/result)
`tasks/result`
###
[​
](#gettaskpayloadrequest)
`GetTaskPayloadRequest`
interface GetTaskPayloadRequest {
 [jsonrpc](#gettaskpayloadrequest-jsonrpc): “2.0”;
 [id](#gettaskpayloadrequest-id): [RequestId](#requestid);
 [method](#gettaskpayloadrequest-method): “tasks/result”;
 [params](#gettaskpayloadrequest-params): { taskId: string };
}
A request to retrieve the result of a completed task.
jsonrpc: “2.0”[](#gettaskpayloadrequest-jsonrpc)
Inherited from [JSONRPCRequest](#jsonrpcrequest).[jsonrpc](#jsonrpcrequest-jsonrpc)
id: RequestId[](#gettaskpayloadrequest-id)
Inherited from [JSONRPCRequest](#jsonrpcrequest).[id](#jsonrpcrequest-id)
method: “tasks/result”[](#gettaskpayloadrequest-method)
Overrides [JSONRPCRequest](#jsonrpcrequest).[method](#jsonrpcrequest-method)
params: { taskId: string }[](#gettaskpayloadrequest-params)
Type Declaration
*
taskId: string
The task identifier to retrieve results for.
Overrides [JSONRPCRequest](#jsonrpcrequest).[params](#jsonrpcrequest-params)
###
[​
](#gettaskpayloadresultresponse)
`GetTaskPayloadResultResponse`
interface GetTaskPayloadResultResponse {
 [jsonrpc](#gettaskpayloadresultresponse-jsonrpc): “2.0”;
 [id](#gettaskpayloadresultresponse-id): [RequestId](#requestid);
 [result](#gettaskpayloadresultresponse-result): [GetTaskPayloadResult](#gettaskpayloadresult);
}
A successful response for a [tasks/result](#gettaskpayloadrequest) request.
jsonrpc: “2.0”[](#gettaskpayloadresultresponse-jsonrpc)
Inherited from [JSONRPCResultResponse](#jsonrpcresultresponse).[jsonrpc](#jsonrpcresultresponse-jsonrpc)
id: RequestId[](#gettaskpayloadresultresponse-id)
Inherited from [JSONRPCResultResponse](#jsonrpcresultresponse).[id](#jsonrpcresultresponse-id)
result: GetTaskPayloadResult[](#gettaskpayloadresultresponse-result)
Overrides [JSONRPCResultResponse](#jsonrpcresultresponse).[result](#jsonrpcresultresponse-result)
###
[​
](#gettaskpayloadresult)
`GetTaskPayloadResult`
interface GetTaskPayloadResult {
 [\_meta](#gettaskpayloadresult-_meta)?: [MetaObject](#metaobject);
 [key: string]: unknown;
}
The result returned for a [tasks/result](#gettaskpayloadrequest) request.
The structure matches the result type of the original request.
For example, a [tools/call](#calltoolrequest) task would return the [CallToolResult](#calltoolresult) structure.
\_meta?: MetaObject[](#gettaskpayloadresult-_meta)
Inherited from [Result](#result).[\_meta](#result-_meta)
##
[​
](#tasks/list)
`tasks/list`
###
[​
](#listtasksrequest)
`ListTasksRequest`
interface ListTasksRequest {
 [jsonrpc](#listtasksrequest-jsonrpc): “2.0”;
 [id](#listtasksrequest-id): [RequestId](#requestid);
 [params](#listtasksrequest-params)?: [PaginatedRequestParams](#paginatedrequestparams);
 [method](#listtasksrequest-method): “tasks/list”;
}
A request to retrieve a list of tasks.
jsonrpc: “2.0”[](#listtasksrequest-jsonrpc)
Inherited from PaginatedRequest.jsonrpc
id: RequestId[](#listtasksrequest-id)
Inherited from PaginatedRequest.id
params?: PaginatedRequestParams[](#listtasksrequest-params)
Inherited from PaginatedRequest.params
method: “tasks/list”[](#listtasksrequest-method)
Overrides PaginatedRequest.method
###
[​
](#listtasksresultresponse)
`ListTasksResultResponse`
interface ListTasksResultResponse {
 [jsonrpc](#listtasksresultresponse-jsonrpc): “2.0”;
 [id](#listtasksresultresponse-id): [RequestId](#requestid);
 [result](#listtasksresultresponse-result): [ListTasksResult](#listtasksresult);
}
A successful response for a [tasks/list](#listtasksrequest) request.
jsonrpc: “2.0”[](#listtasksresultresponse-jsonrpc)
Inherited from [JSONRPCResultResponse](#jsonrpcresultresponse).[jsonrpc](#jsonrpcresultresponse-jsonrpc)
id: RequestId[](#listtasksresultresponse-id)
Inherited from [JSONRPCResultResponse](#jsonrpcresultresponse).[id](#jsonrpcresultresponse-id)
result: ListTasksResult[](#listtasksresultresponse-result)
Overrides [JSONRPCResultResponse](#jsonrpcresultresponse).[result](#jsonrpcresultresponse-result)
###
[​
](#listtasksresult)
`ListTasksResult`
interface ListTasksResult {
 [\_meta](#listtasksresult-_meta)?: [MetaObject](#metaobject);
 [nextCursor](#listtasksresult-nextcursor)?: string;
 [tasks](#listtasksresult-tasks): [Task](#task)[];
 [key: string]: unknown;
}
The result returned for a [tasks/list](#listtasksrequest) request.
\_meta?: MetaObject[](#listtasksresult-_meta)
Inherited from PaginatedResult.\_meta
nextCursor?: string[](#listtasksresult-nextcursor)
An opaque token representing the pagination position after the last returned result.
If present, there may be more results available.
Inherited from PaginatedResult.nextCursor
tasks: Task[][](#listtasksresult-tasks)
##
[​
](#tasks/cancel)
`tasks/cancel`
###
[​
](#canceltaskrequest)
`CancelTaskRequest`
interface CancelTaskRequest {
 [jsonrpc](#canceltaskrequest-jsonrpc): “2.0”;
 [id](#canceltaskrequest-id): [RequestId](#requestid);
 [method](#canceltaskrequest-method): “tasks/cancel”;
 [params](#canceltaskrequest-params): { taskId: string };
}
A request to cancel a task.
jsonrpc: “2.0”[](#canceltaskrequest-jsonrpc)
Inherited from [JSONRPCRequest](#jsonrpcrequest).[jsonrpc](#jsonrpcrequest-jsonrpc)
id: RequestId[](#canceltaskrequest-id)
Inherited from [JSONRPCRequest](#jsonrpcrequest).[id](#jsonrpcrequest-id)
method: “tasks/cancel”[](#canceltaskrequest-method)
Overrides [JSONRPCRequest](#jsonrpcrequest).[method](#jsonrpcrequest-method)
params: { taskId: string }[](#canceltaskrequest-params)
Type Declaration
*
taskId: string
The task identifier to cancel.
Overrides [JSONRPCRequest](#jsonrpcrequest).[params](#jsonrpcrequest-params)
###
[​
](#canceltaskresultresponse)
`CancelTaskResultResponse`
interface CancelTaskResultResponse {
 [jsonrpc](#canceltaskresultresponse-jsonrpc): “2.0”;
 [id](#canceltaskresultresponse-id): [RequestId](#requestid);
 [result](#canceltaskresultresponse-result): [CancelTaskResult](#canceltaskresult);
}
A successful response for a [tasks/cancel](#canceltaskrequest) request.
jsonrpc: “2.0”[](#canceltaskresultresponse-jsonrpc)
Inherited from [JSONRPCResultResponse](#jsonrpcresultresponse).[jsonrpc](#jsonrpcresultresponse-jsonrpc)
id: RequestId[](#canceltaskresultresponse-id)
Inherited from [JSONRPCResultResponse](#jsonrpcresultresponse).[id](#jsonrpcresultresponse-id)
result: CancelTaskResult[](#canceltaskresultresponse-result)
Overrides [JSONRPCResultResponse](#jsonrpcresultresponse).[result](#jsonrpcresultresponse-result)
###
[​
](#canceltaskresult)
`CancelTaskResult`
CancelTaskResult: [Result](#result) & [Task](#task)
The result returned for a [tasks/cancel](#canceltaskrequest) request.
##
[​
](#prompts/get)
`prompts/get`
###
[​
](#getpromptrequest)
`GetPromptRequest`
interface GetPromptRequest {
 [jsonrpc](#getpromptrequest-jsonrpc): “2.0”;
 [id](#getpromptrequest-id): [RequestId](#requestid);
 [method](#getpromptrequest-method): “prompts/get”;
 [params](#getpromptrequest-params): [GetPromptRequestParams](#getpromptrequestparams);
}
Used by the client to get a prompt provided by the server.
Example: Get prompt request[](#getpromptrequest-example-get-prompt-request)
```
`{
“jsonrpc”: “2.0”,
“id”: “get-prompt-example”,
“method”: “prompts/get”,
“params”: {
“name”: “code\_review”,
“arguments”: {
“code”: “def hello():\\n print(‘world’)”
}
}
} `Copy
```
jsonrpc: “2.0”[](#getpromptrequest-jsonrpc)
Inherited from [JSONRPCRequest](#jsonrpcrequest).[jsonrpc](#jsonrpcrequest-jsonrpc)
id: RequestId[](#getpromptrequest-id)
Inherited from [JSONRPCRequest](#jsonrpcrequest).[id](#jsonrpcrequest-id)
method: “prompts/get”[](#getpromptrequest-method)
Overrides [JSONRPCRequest](#jsonrpcrequest).[method](#jsonrpcrequest-method)
params: GetPromptRequestParams[](#getpromptrequest-params)
Overrides [JSONRPCRequest](#jsonrpcrequest).[params](#jsonrpcrequest-params)
###
[​
](#getpromptrequestparams)
`GetPromptRequestParams`
interface GetPromptRequestParams {
 [\_meta](#getpromptrequestparams-_meta)?: [RequestMetaObject](#requestmetaobject);
 [name](#getpromptrequestparams-name): string;
 [arguments](#getpromptrequestparams-arguments)?: { [key: string]: string };
}
Parameters for a `prompts/get` request.
Example: Get code review prompt[](#getpromptrequestparams-example-get-code-review-prompt)
```
`{
“name”: “code\_review”,
“arguments”: {
“code”: “def hello():\\n print(‘world’)”
}
} `Copy
```
\_meta?: RequestMetaObject[](#getpromptrequestparams-_meta)
Inherited from [RequestParams](#requestparams).[\_meta](#requestparams-_meta)
name: string[](#getpromptrequestparams-name)
The name of the prompt or prompt template.
arguments?: { [key: string]: string }[](#getpromptrequestparams-arguments)
Arguments to use for templating the prompt.
###
[​
](#getpromptresultresponse)
`GetPromptResultResponse`
interface GetPromptResultResponse {
 [jsonrpc](#getpromptresultresponse-jsonrpc): “2.0”;
 [id](#getpromptresultresponse-id): [RequestId](#requestid);
 [result](#getpromptresultresponse-result): [GetPromptResult](#getpromptresult);
}
A successful response from the server for a [prompts/get](#getpromptrequest) request.
Example: Get prompt result response[](#getpromptresultresponse-example-get-prompt-result-response)
```
`{
“jsonrpc”: “2.0”,
“id”: “get-prompt-example”,
“result”: {
“description”: “Code review prompt”,
“messages”: [
{
“role”: “user”,
“content”: {
“type”: “text”,
“text”: “Please review this Python code:\\ndef hello():\\n print(‘world’)”
}
}
]
}
} `Copy
```
jsonrpc: “2.0”[](#getpromptresultresponse-jsonrpc)
Inherited from [JSONRPCResultResponse](#jsonrpcresultresponse).[jsonrpc](#jsonrpcresultresponse-jsonrpc)
id: RequestId[](#getpromptresultresponse-id)
Inherited from [JSONRPCResultResponse](#jsonrpcresultresponse).[id](#jsonrpcresultresponse-id)
result: GetPromptResult[](#getpromptresultresponse-result)
Overrides [JSONRPCResultResponse](#jsonrpcresultresponse).[result](#jsonrpcresultresponse-result)
###
[​
](#getpromptresult)
`GetPromptResult`
interface GetPromptResult {
 [\_meta](#getpromptresult-_meta)?: [MetaObject](#metaobject);
 [description](#getpromptresult-description)?: string;
 [messages](#getpromptresult-messages): [PromptMessage](#promptmessage)[];
 [key: string]: unknown;
}
The result returned by the server for a [prompts/get](#getpromptrequest) request.
Example: Code review prompt[](#getpromptresult-example-code-review-prompt)
```
`{
“description”: “Code review prompt”,
“messages”: [
{
“role”: “user”,
“content”: {
“type”: “text”,
“text”: “Please review this Python code:\\ndef hello():\\n print(‘world’)”
}
}
]
} `Copy
```
\_meta?: MetaObject[](#getpromptresult-_meta)
Inherited from [Result](#result).[\_meta](#result-_meta)
description?: string[](#getpromptresult-description)
An optional description for the prompt.
messages: PromptMessage[][](#getpromptresult-messages)
###
[​
](#promptmessage)
`PromptMessage`
interface PromptMessage {
 [role](#promptmessage-role): [Role](#role);
 [content](#promptmessage-content): [ContentBlock](#contentblock);
}
Describes a message returned as part of a prompt.
This is similar to [SamplingMessage](#samplingmessage), but also supports the embedding of
resources from the MCP server.
role: Role[](#promptmessage-role)
content: ContentBlock[](#promptmessage-content)
##
[​
](#prompts/list)
`prompts/list`
###
[​
](#listpromptsrequest)
`ListPromptsRequest`
interface ListPromptsRequest {
 [jsonrpc](#listpromptsrequest-jsonrpc): “2.0”;
 [id](#listpromptsrequest-id): [RequestId](#requestid);
 [params](#listpromptsrequest-params)?: [PaginatedRequestParams](#paginatedrequestparams);
 [method](#listpromptsrequest-method): “prompts/list”;
}
Sent from the client to request a list of prompts and prompt templates the server has.
Example: List prompts request[](#listpromptsrequest-example-list-prompts-request)
```
`{
“jsonrpc”: “2.0”,
“id”: “list-prompts-example”,
“method”: “prompts/list”
} `Copy
```
jsonrpc: “2.0”[](#listpromptsrequest-jsonrpc)
Inherited from PaginatedRequest.jsonrpc
id: RequestId[](#listpromptsrequest-id)
Inherited from PaginatedRequest.id
params?: PaginatedRequestParams[](#listpromptsrequest-params)
Inherited from PaginatedRequest.params
method: “prompts/list”[](#listpromptsrequest-method)
Overrides PaginatedRequest.method
###
[​
](#listpromptsresultresponse)
`ListPromptsResultResponse`
interface ListPromptsResultResponse {
 [jsonrpc](#listpromptsresultresponse-jsonrpc): “2.0”;
 [id](#listpromptsresultresponse-id): [RequestId](#requestid);
 [result](#listpromptsresultresponse-result): [ListPromptsResult](#listpromptsresult);
}
A successful response from the server for a [prompts/list](#listpromptsrequest) request.
Example: List prompts result response[](#listpromptsresultresponse-example-list-prompts-result-response)
```
`{
“jsonrpc”: “2.0”,
“id”: “list-prompts-example”,
“result”: {
“prompts”: [
{
“name”: “code\_review”,
“title”: “Request Code Review”,
“description”: “Asks the LLM to analyze code quality and suggest improvements”,
“arguments”: [
{
“name”: “code”,
“description”: “The code to review”,
“required”: true
}
],
“icons”: [
{
“src”: “[https://example.com/review-icon.svg](https://example.com/review-icon.svg)”,
“mimeType”: “image/svg+xml”,
“sizes”: [“any”]
}
]
}
],
“nextCursor”: “next-page-cursor”
}
} `Copy
```
jsonrpc: “2.0”[](#listpromptsresultresponse-jsonrpc)
Inherited from [JSONRPCResultResponse](#jsonrpcresultresponse).[jsonrpc](#jsonrpcresultresponse-jsonrpc)
id: RequestId[](#listpromptsresultresponse-id)
Inherited from [JSONRPCResultResponse](#jsonrpcresultresponse).[id](#jsonrpcresultresponse-id)
result: ListPromptsResult[](#listpromptsresultresponse-result)
Overrides [JSONRPCResultResponse](#jsonrpcresultresponse).[result](#jsonrpcresultresponse-result)
###
[​
](#listpromptsresult)
`ListPromptsResult`
interface ListPromptsResult {
 [\_meta](#listpromptsresult-_meta)?: [MetaObject](#metaobject);
 [nextCursor](#listpromptsresult-nextcursor)?: string;
 [prompts](#listpromptsresult-prompts): [Prompt](#prompt)[];
 [key: string]: unknown;
}
The result returned by the server for a [prompts/list](#listpromptsrequest) request.
Example: Prompts list with cursor[](#listpromptsresult-example-prompts-list-with-cursor)
```
`{
“prompts”: [
{
“name”: “code\_review”,
“title”: “Request Code Review”,
“description”: “Asks the LLM to analyze code quality and suggest improvements”,
“arguments”: [
{
“name”: “code”,
“description”: “The code to review”,
“required”: true
}
],
“icons”: [
{
“src”: “[https://example.com/review-icon.svg](https://example.com/review-icon.svg)”,
“mimeType”: “image/svg+xml”,
“sizes”: [“any”]
}
]
}
],
“nextCursor”: “next-page-cursor”
} `Copy
```
\_meta?: MetaObject[](#listpromptsresult-_meta)
Inherited from PaginatedResult.\_meta
nextCursor?: string[](#listpromptsresult-nextcursor)
An opaque token representing the pagination position after the last returned result.
If present, there may be more results available.
Inherited from PaginatedResult.nextCursor
prompts: Prompt[][](#listpromptsresult-prompts)
###
[​
](#prompt)
`Prompt`
interface Prompt {
 [icons](#prompt-icons)?: [Icon](#icon)[];
 [name](#prompt-name): string;
 [title](#prompt-title)?: string;
 [description](#prompt-description)?: string;
 [arguments](#prompt-arguments)?: [PromptArgument](#promptargument)[];
 [\_meta](#prompt-_meta)?: [MetaObject](#metaobject);
}
A prompt or prompt template that the server offers.
icons?: Icon[][](#prompt-icons)
Optional set of sized icons that the client can display in a user interface.
Clients that support rendering icons MUST support at least the following MIME types:
* `image/png` - PNG images (safe, universal compatibility)
* `image/jpeg` (and `image/jpg`) - JPEG images (safe, universal compatibility)
Clients that support rendering icons SHOULD also support:
* `image/svg+xml` - SVG images (scalable but requires security precautions)
* `image/webp` - WebP images (modern, efficient format)
Inherited from Icons.icons
name: string[](#prompt-name)
Intended for programmatic or logical use, but used as a display name in past specs or fallback (if title isn’t present).
Inherited from BaseMetadata.name
title?: string[](#prompt-title)
Intended for UI and end-user contexts — optimized to be human-readable and easily understood,
even by those unfamiliar with domain-specific terminology.
If not provided, the name should be used for display (except for [Tool](#tool),
where `annotations.title` should be given precedence over using `name`,
if present).
Inherited from BaseMetadata.title
description?: string[](#prompt-description)
An optional description of what this prompt provides
arguments?: PromptArgument[][](#prompt-arguments)
A list of arguments to use for templating the prompt.
\_meta?: MetaObject[](#prompt-_meta)
###
[​
](#promptargument)
`PromptArgument`
interface PromptArgument {
 [name](#promptargument-name): string;
 [title](#promptargument-title)?: string;
 [description](#promptargument-description)?: string;
 [required](#promptargument-required)?: boolean;
}
Describes an argument that a prompt can accept.
name: string[](#promptargument-name)
Intended for programmatic or logical use, but used as a display name in past specs or fallback (if title isn’t present).
Inherited from BaseMetadata.name
title?: string[](#promptargument-title)
Intended for UI and end-user contexts — optimized to be human-readable and easily understood,
even by those unfamiliar with domain-specific terminology.
If not provided, the name should be used for display (except for [Tool](#tool),
where `annotations.title` should be given precedence over using `name`,
if present).
Inherited from BaseMetadata.title
description?: string[](#promptargument-description)
A human-readable description of the argument.
required?: boolean[](#promptargument-required)
Whether this argument must be provided.
##
[​
](#resources/list)
`resources/list`
###
[​
](#listresourcesrequest)
`ListResourcesRequest`
interface ListResourcesRequest {
 [jsonrpc](#listresourcesrequest-jsonrpc): “2.0”;
 [id](#listresourcesrequest-id): [RequestId](#requestid);
 [params](#listresourcesrequest-params)?: [PaginatedRequestParams](#paginatedrequestparams);
 [method](#listresourcesrequest-method): “resources/list”;
}
Sent from the client to request a list of resources the server has.
Example: List resources request[](#listresourcesrequest-example-list-resources-request)
```
`{
“jsonrpc”: “2.0”,
“id”: “list-resources-example”,
“method”: “resources/list”
} `Copy
```
jsonrpc: “2.0”[](#listresourcesrequest-jsonrpc)
Inherited from PaginatedRequest.jsonrpc
id: RequestId[](#listresourcesrequest-id)
Inherited from PaginatedRequest.id
params?: PaginatedRequestParams[](#listresourcesrequest-params)
Inherited from PaginatedRequest.params
method: “resources/list”[](#listresourcesrequest-method)
Overrides PaginatedRequest.method
###
[​
](#listresourcesresultresponse)
`ListResourcesResultResponse`
interface ListResourcesResultResponse {
 [jsonrpc](#listresourcesresultresponse-jsonrpc): “2.0”;
 [id](#listresourcesresultresponse-id): [RequestId](#requestid);
 [result](#listresourcesresultresponse-result): [ListResourcesResult](#listresourcesresult);
}
A successful response from the server for a [resources/list](#listresourcesrequest) request.
Example: List resources result response[](#listresourcesresultresponse-example-list-resources-result-response)
```
`{
“jsonrpc”: “2.0”,
“id”: “list-resources-example”,
“result”: {
“resources”: [
{
“uri”: “file:///project/src/main.rs”,
“name”: “main.rs”,
“title”: “Rust Software Application Main File”,
“description”: “Primary application entry point”,
“mimeType”: “text/x-rust”,
“icons”: [
{
“src”: “[https://example.com/rust-file-icon.png](https://example.com/rust-file-icon.png)”,
“mimeType”: “image/png”,
“sizes”: [“48x48”]
}
]
}
],
“nextCursor”: “eyJwYWdlIjogM30=”
}
} `Copy
```
jsonrpc: “2.0”[](#listresourcesresultresponse-jsonrpc)
Inherited from [JSONRPCResultResponse](#jsonrpcresultresponse).[jsonrpc](#jsonrpcresultresponse-jsonrpc)
id: RequestId[](#listresourcesresultresponse-id)
Inherited from [JSONRPCResultResponse](#jsonrpcresultresponse).[id](#jsonrpcresultresponse-id)
result: ListResourcesResult[](#listresourcesresultresponse-result)
Overrides [JSONRPCResultResponse](#jsonrpcresultresponse).[result](#jsonrpcresultresponse-result)
###
[​
](#listresourcesresult)
`ListResourcesResult`
interface ListResourcesResult {
 [\_meta](#listresourcesresult-_meta)?: [MetaObject](#metaobject);
 [nextCursor](#listresourcesresult-nextcursor)?: string;
 [resources](#listresourcesresult-resources): [Resource](#resource)[];
 [key: string]: unknown;
}
The result returned by the server for a [resources/list](#listresourcesrequest) request.
Example: Resources list with cursor[](#listresourcesresult-example-resources-list-with-cursor)
```
`{
“resources”: [
{
“uri”: “file:///project/src/main.rs”,
“name”: “main.rs”,
“title”: “Rust Software Application Main File”,
“description”: “Primary application entry point”,
“mimeType”: “text/x-rust”,
“icons”: [
{
“src”: “[https://example.com/rust-file-icon.png](https://example.com/rust-file-icon.png)”,
“mimeType”: “image/png”,
“sizes”: [“48x48”]
}
]
}
],
“nextCursor”: “eyJwYWdlIjogM30=”
} `Copy
```
\_meta?: MetaObject[](#listresourcesresult-_meta)
Inherited from PaginatedResult.\_meta
nextCursor?: string[](#listresourcesresult-nextcursor)
An opaque token representing the pagination position after the last returned result.
If present, there may be more results available.
Inherited from PaginatedResult.nextCursor
resources: Resource[][](#listresourcesresult-resources)
###
[​
](#resource)
`Resource`
interface Resource {
 [icons](#resource-icons)?: [Icon](#icon)[];
 [name](#resource-name): string;
 [title](#resource-title)?: string;
 [uri](#resource-uri): string;
 [description](#resource-description)?: string;
 [mimeType](#resource-mimetype)?: string;
 [annotations](#resource-annotations)?: [Annotations](#annotations);
 [size](#resource-size)?: number;
 [\_meta](#resource-_meta)?: [MetaObject](#metaobject);
}
A known resource that the server is capable of reading.
Example: File resource with annotations[](#resource-example-file-resource-with-annotations)
```
`{
“uri”: “file:///project/README.md”,
“name”: “README.md”,
“title”: “Project Documentation”,
“mimeType”: “text/markdown”,
“annotations”: {
“audience”: [“user”],
“priority”: 0.8,
“lastModified”: “2025-01-12T15:00:58Z”
}
} `Copy
```
icons?: Icon[][](#resource-icons)
Optional set of sized icons that the client can display in a user interface.
Clients that support rendering icons MUST support at least the following MIME types:
* `image/png` - PNG images (safe, universal compatibility)
* `image/jpeg` (and `image/jpg`) - JPEG images (safe, universal compatibility)
Clients that support rendering icons SHOULD also support:
* `image/svg+xml` - SVG images (scalable but requires security precautions)
* `image/webp` - WebP images (modern, efficient format)
Inherited from Icons.icons
name: string[](#resource-name)
Intended for programmatic or logical use, but used as a display name in past specs or fallback (if title isn’t present).
Inherited from BaseMetadata.name
title?: string[](#resource-title)
Intended for UI and end-user contexts — optimized to be human-readable and easily understood,
even by those unfamiliar with domain-specific terminology.
If not provided, the name should be used for display (except for [Tool](#tool),
where `annotations.title` should be given precedence over using `name`,
if present).
Inherited from BaseMetadata.title
uri: string[](#resource-uri)
The URI of this resource.
description?: string[](#resource-description)
A description of what this resource represents.
This can be used by clients to improve the LLM’s understanding of available resources. It can be thought of like a “hint” to the model.
mimeType?: string[](#resource-mimetype)
The MIME type of this resource, if known.
annotations?: Annotations[](#resource-annotations)
Optional annotations for the client.
size?: number[](#resource-size)
The size of the raw resource content, in bytes (i.e., before base64 encoding or any tokenization), if known.
This can be used by Hosts to display file sizes and estimate context window usage.
\_meta?: MetaObject[](#resource-_meta)
##
[​
](#resources/read)
`resources/read`
###
[​
](#readresourcerequest)
`ReadResourceRequest`
interface ReadResourceRequest {
 [jsonrpc](#readresourcerequest-jsonrpc): “2.0”;
 [id](#readresourcerequest-id): [RequestId](#requestid);
 [method](#readresourcerequest-method): “resources/read”;
 [params](#readresourcerequest-params): [ReadResourceRequestParams](#readresourcerequestparams);
}
Sent from the client to the server, to read a specific resource URI.
Example: Read resource request[](#readresourcerequest-example-read-resource-request)
```
`{
“jsonrpc”: “2.0”,
“id”: “read-resource-example”,
“method”: “resources/read”,
“params”: {
“uri”: “file:///project/src/main.rs”
}
} `Copy
```
jsonrpc: “2.0”[](#readresourcerequest-jsonrpc)
Inherited from [JSONRPCRequest](#jsonrpcrequest).[jsonrpc](#jsonrpcrequest-jsonrpc)
id: RequestId[](#readresourcerequest-id)
Inherited from [JSONRPCRequest](#jsonrpcrequest).[id](#jsonrpcrequest-id)
method: “resources/read”[](#readresourcerequest-method)
Overrides [JSONRPCRequest](#jsonrpcrequest).[method](#jsonrpcrequest-method)
params: ReadResourceRequestParams[](#readresourcerequest-params)
Overrides [JSONRPCRequest](#jsonrpcrequest).[params](#jsonrpcrequest-params)
###
[​
](#readresourcerequestparams)
`ReadResourceRequestParams`
interface ReadResourceRequestParams {
 [\_meta](#readresourcerequestparams-_meta)?: [RequestMetaObject](#requestmetaobject);
 [uri](#readresourcerequestparams-uri): string;
}
Parameters for a `resources/read` request.
\_meta?: RequestMetaObject[](#readresourcerequestparams-_meta)
Inherited from ResourceRequestParams.\_meta
uri: string[](#readresourcerequestparams-uri)
The URI of the resource. The URI can use any protocol; it is up to the server how to interpret it.
Inherited from ResourceRequestParams.uri
###
[​
](#readresourceresultresponse)
`ReadResourceResultResponse`
interface ReadResourceResultResponse {
 [jsonrpc](#readresourceresultresponse-jsonrpc): “2.0”;
 [id](#readresourceresultresponse-id): [RequestId](#requestid);
 [result](#readresourceresultresponse-result): [ReadResourceResult](#readresourceresult);
}
A successful response from the server for a [resources/read](#readresourcerequest) request.
Example: Read resource result response[](#readresourceresultresponse-example-read-resource-result-response)
```
`{
“jsonrpc”: “2.0”,
“id”: “read-resource-example”,
“result”: {
“contents”: [
{
“uri”: “file:///project/src/main.rs”,
“mimeType”: “text/x-rust”,
“text”: “fn main() {\\n println!(\\“Hello world!\\”);\\n}”
}
]
}
} `Copy
```
jsonrpc: “2.0”[](#readresourceresultresponse-jsonrpc)
Inherited from [JSONRPCResultResponse](#jsonrpcresultresponse).[jsonrpc](#jsonrpcresultresponse-jsonrpc)
id: RequestId[](#readresourceresultresponse-id)
Inherited from [JSONRPCResultResponse](#jsonrpcresultresponse).[id](#jsonrpcresultresponse-id)
result: ReadResourceResult[](#readresourceresultresponse-result)
Overrides [JSONRPCResultResponse](#jsonrpcresultresponse).[result](#jsonrpcresultresponse-result)
###
[​
](#readresourceresult)
`ReadResourceResult`
interface ReadResourceResult {
 [\_meta](#readresourceresult-_meta)?: [MetaObject](#metaobject);
 [contents](#readresourceresult-contents): ([TextResourceContents](#textresourcecontents) | [BlobResourceContents](#blobresourcecontents))[];
 [key: string]: unknown;
}
The result returned by the server for a [resources/read](#readresourcerequest) request.
Example: File resource contents[](#readresourceresult-example-file-resource-contents)
```
`{
“contents”: [
{
“uri”: “file:///project/src/main.rs”,
“mimeType”: “text/x-rust”,
“text”: “fn main() {\\n println!(\\“Hello world!\\”);\\n}”
}
]
} `Copy
```
\_meta?: MetaObject[](#readresourceresult-_meta)
Inherited from [Result](#result).[\_meta](#result-_meta)
contents: (TextResourceContents | BlobResourceContents)[][](#readresourceresult-contents)
##
[​
](#resources/subscribe)
`resources/subscribe`
###
[​
](#subscriberequest)
`SubscribeRequest`
interface SubscribeRequest {
 [jsonrpc](#subscriberequest-jsonrpc): “2.0”;
 [id](#subscriberequest-id): [RequestId](#requestid);
 [method](#subscriberequest-method): “resources/subscribe”;
 [params](#subscriberequest-params): [SubscribeRequestParams](#subscriberequestparams);
}
Sent from the client to request [resources/updated](#resourceupdatednotification) notifications from the server whenever a particular resource changes.
Example: Subscribe request[](#subscriberequest-example-subscribe-request)
```
`{
“jsonrpc”: “2.0”,
“id”: “subscribe-example”,
“method”: “resources/subscribe”,
“params”: {
“uri”: “file:///project/src/main.rs”
}
} `Copy
```
jsonrpc: “2.0”[](#subscriberequest-jsonrpc)
Inherited from [JSONRPCRequest](#jsonrpcrequest).[jsonrpc](#jsonrpcrequest-jsonrpc)
id: RequestId[](#subscriberequest-id)
Inherited from [JSONRPCRequest](#jsonrpcrequest).[id](#jsonrpcrequest-id)
method: “resources/subscribe”[](#subscriberequest-method)
Overrides [JSONRPCRequest](#jsonrpcrequest).[method](#jsonrpcrequest-method)
params: SubscribeRequestParams[](#subscriberequest-params)
Overrides [JSONRPCRequest](#jsonrpcrequest).[params](#jsonrpcrequest-params)
###
[​
](#subscriberequestparams)
`SubscribeRequestParams`
interface SubscribeRequestParams {
 [\_meta](#subscriberequestparams-_meta)?: [RequestMetaObject](#requestmetaobject);
 [uri](#subscriberequestparams-uri): string;
}
Parameters for a `resources/subscribe` request.
Example: Subscribe to file resource[](#subscriberequestparams-example-subscribe-to-file-resource)
```
`{
“uri”: “file:///project/src/main.rs”
} `Copy
```
\_meta?: RequestMetaObject[](#subscriberequestparams-_meta)
Inherited from ResourceRequestParams.\_meta
uri: string[](#subscriberequestparams-uri)
The URI of the resource. The URI can use any protocol; it is up to the server how to interpret it.
Inherited from ResourceRequestParams.uri
###
[​
](#subscriberesultresponse)
`SubscribeResultResponse`
interface SubscribeResultResponse {
 [jsonrpc](#subscriberesultresponse-jsonrpc): “2.0”;
 [id](#subscriberesultresponse-id): [RequestId](#requestid);
 [result](#subscriberesultresponse-result): [Result](#result);
}
A successful response from the server for a [resources/subscribe](#subscriberequest) request.
Example: Subscribe result response[](#subscriberesultresponse-example-subscribe-result-response)
```
`{
“jsonrpc”: “2.0”,
“id”: “subscribe-example”,
“result”: {}
} `Copy
```
jsonrpc: “2.0”[](#subscriberesultresponse-jsonrpc)
Inherited from [JSONRPCResultResponse](#jsonrpcresultresponse).[jsonrpc](#jsonrpcresultresponse-jsonrpc)
id: RequestId[](#subscriberesultresponse-id)
Inherited from [JSONRPCResultResponse](#jsonrpcresultresponse).[id](#jsonrpcresultresponse-id)
result: Result[](#subscriberesultresponse-result)
Overrides [JSONRPCResultResponse](#jsonrpcresultresponse).[result](#jsonrpcresultresponse-result)
##
[​
](#resources/templates/list)
`resources/templates/list`
###
[​
](#listresourcetemplatesrequest)
`ListResourceTemplatesRequest`
interface ListResourceTemplatesRequest {
 [jsonrpc](#listresourcetemplatesrequest-jsonrpc): “2.0”;
 [id](#listresourcetemplatesrequest-id): [RequestId](#requestid);
 [params](#listresourcetemplatesrequest-params)?: [PaginatedRequestParams](#paginatedrequestparams);
 [method](#listresourcetemplatesrequest-method): “resources/templates/list”;
}
Sent from the client to request a list of resource templates the server has.
Example: List resource templates request[](#listresourcetemplatesrequest-example-list-resource-templates-request)
```
`{
“jsonrpc”: “2.0”,
“id”: “list-resource-templates-example”,
“method”: “resources/templates/list”
} `Copy
```
jsonrpc: “2.0”[](#listresourcetemplatesrequest-jsonrpc)
Inherited from PaginatedRequest.jsonrpc
id: RequestId[](#listresourcetemplatesrequest-id)
Inherited from PaginatedRequest.id
params?: PaginatedRequestParams[](#listresourcetemplatesrequest-params)
Inherited from PaginatedRequest.params
method: “resources/templates/list”[](#listresourcetemplatesrequest-method)
Overrides PaginatedRequest.method
###
[​
](#listresourcetemplatesresultresponse)
`ListResourceTemplatesResultResponse`
interface ListResourceTemplatesResultResponse {
 [jsonrpc](#listresourcetemplatesresultresponse-jsonrpc): “2.0”;
 [id](#listresourcetemplatesresultresponse-id): [RequestId](#requestid);
 [result](#listresourcetemplatesresultresponse-result): [ListResourceTemplatesResult](#listresourcetemplatesresult);
}
A successful response from the server for a [resources/templates/list](#listresourcetemplatesrequest) request.
Example: List resource templates result response[](#listresourcetemplatesresultresponse-example-list-resource-templates-result-response)
```
`{
“jsonrpc”: “2.0”,
“id”: “list-resource-templates-example”,
“result”: {
“resourceTemplates”: [
{
“uriTemplate”: “file:///{path}”,
“name”: “Project Files”,
“title”: “Project Files”,
“description”: “Access files in the project directory”,
“mimeType”: “application/octet-stream”,
“icons”: [
{
“src”: “[https://example.com/folder-icon.png](https://example.com/folder-icon.png)”,
“mimeType”: “image/png”,
“sizes”: [“48x48”]
}
]
}
]
}
} `Copy
```
jsonrpc: “2.0”[](#listresourcetemplatesresultresponse-jsonrpc)
Inherited from [JSONRPCResultResponse](#jsonrpcresultresponse).[jsonrpc](#jsonrpcresultresponse-jsonrpc)
id: RequestId[](#listresourcetemplatesresultresponse-id)
Inherited from [JSONRPCResultResponse](#jsonrpcresultresponse).[id](#jsonrpcresultresponse-id)
result: ListResourceTemplatesResult[](#listresourcetemplatesresultresponse-result)
Overrides [JSONRPCResultResponse](#jsonrpcresultresponse).[result](#jsonrpcresultresponse-result)
###
[​
](#listresourcetemplatesresult)
`ListResourceTemplatesResult`
interface ListResourceTemplatesResult {
 [\_meta](#listresourcetemplatesresult-_meta)?: [MetaObject](#metaobject);
 [nextCursor](#listresourcetemplatesresult-nextcursor)?: string;
 [resourceTemplates](#listresourcetemplatesresult-resourcetemplates): [ResourceTemplate](#resourcetemplate)[];
 [key: string]: unknown;
}
The result returned by the server for a [resources/templates/list](#listresourcetemplatesrequest) request.
Example: Resource templates list[](#listresourcetemplatesresult-example-resource-templates-list)
```
`{
“resourceTemplates”: [
{
“uriTemplate”: “file:///{path}”,
“name”: “Project Files”,
“title”: ”📁 Project Files”,
“description”: “Access files in the project directory”,
“mimeType”: “application/octet-stream”,
“icons”: [
{
“src”: “[https://example.com/folder-icon.png](https://example.com/folder-icon.png)”,
“mimeType”: “image/png”,
“sizes”: [“48x48”]
}
]
}
]
} `Copy
```
\_meta?: MetaObject[](#listresourcetemplatesresult-_meta)
Inherited from PaginatedResult.\_meta
nextCursor?: string[](#listresourcetemplatesresult-nextcursor)
An opaque token representing the pagination position after the last returned result.
If present, there may be more results available.
Inherited from PaginatedResult.nextCursor
resourceTemplates: ResourceTemplate[][](#listresourcetemplatesresult-resourcetemplates)
###
[​
](#resourcetemplate)
`ResourceTemplate`
interface ResourceTemplate {
 [icons](#resourcetemplate-icons)?: [Icon](#icon)[];
 [name](#resourcetemplate-name): string;
 [title](#resourcetemplate-title)?: string;
 [uriTemplate](#resourcetemplate-uritemplate): string;
 [description](#resourcetemplate-description)?: string;
 [mimeType](#resourcetemplate-mimetype)?: string;
 [annotations](#resourcetemplate-annotations)?: [Annotations](#annotations);
 [\_meta](#resourcetemplate-_meta)?: [MetaObject](#metaobject);
}
A template description for resources available on the server.
icons?: Icon[][](#resourcetemplate-icons)
Optional set of sized icons that the client can display in a user interface.
Clients that support rendering icons MUST support at least the following MIME types:
* `image/png` - PNG images (safe, universal compatibility)
* `image/jpeg` (and `image/jpg`) - JPEG images (safe, universal compatibility)
Clients that support rendering icons SHOULD also support:
* `image/svg+xml` - SVG images (scalable but requires security precautions)
* `image/webp` - WebP images (modern, efficient format)
Inherited from Icons.icons
name: string[](#resourcetemplate-name)
Intended for programmatic or logical use, but used as a display name in past specs or fallback (if title isn’t present).
Inherited from BaseMetadata.name
title?: string[](#resourcetemplate-title)
Intended for UI and end-user contexts — optimized to be human-readable and easily understood,
even by those unfamiliar with domain-specific terminology.
If not provided, the name should be used for display (except for [Tool](#tool),
where `annotations.title` should be given precedence over using `name`,
if present).
Inherited from BaseMetadata.title
uriTemplate: string[](#resourcetemplate-uritemplate)
A URI template (according to RFC 6570) that can be used to construct resource URIs.
description?: string[](#resourcetemplate-description)
A description of what this template is for.
This can be used by clients to improve the LLM’s understanding of available resources. It can be thought of like a “hint” to the model.
mimeType?: string[](#resourcetemplate-mimetype)
The MIME type for all resources that match this template. This should only be included if all resources matching this template have the same type.
annotations?: Annotations[](#resourcetemplate-annotations)
Optional annotations for the client.
\_meta?: MetaObject[](#resourcetemplate-_meta)
##
[​
](#resources/unsubscribe)
`resources/unsubscribe`
###
[​
](#unsubscriberequest)
`UnsubscribeRequest`
interface UnsubscribeRequest {
 [jsonrpc](#unsubscriberequest-jsonrpc): “2.0”;
 [id](#unsubscriberequest-id): [RequestId](#requestid);
 [method](#unsubscriberequest-method): “resources/unsubscribe”;
 [params](#unsubscriberequest-params): [UnsubscribeRequestParams](#unsubscriberequestparams);
}
Sent from the client to request cancellation of [resources/updated](#resourceupdatednotification) notifications from the server. This should follow a previous [resources/subscribe](#subscriberequest) request.
Example: Unsubscribe request[](#unsubscriberequest-example-unsubscribe-request)
```
`{
“jsonrpc”: “2.0”,
“id”: “unsubscribe-example”,
“method”: “resources/unsubscribe”,
“params”: {
“uri”: “file:///project/src/main.rs”
}
} `Copy
```
jsonrpc: “2.0”[](#unsubscriberequest-jsonrpc)
Inherited from [JSONRPCRequest](#jsonrpcrequest).[jsonrpc](#jsonrpcrequest-jsonrpc)
id: RequestId[](#unsubscriberequest-id)
Inherited from [JSONRPCRequest](#jsonrpcrequest).[id](#jsonrpcrequest-id)
method: “resources/unsubscribe”[](#unsubscriberequest-method)
Overrides [JSONRPCRequest](#jsonrpcrequest).[method](#jsonrpcrequest-method)
params: UnsubscribeRequestParams[](#unsubscriberequest-params)
Overrides [JSONRPCRequest](#jsonrpcrequest).[params](#jsonrpcrequest-params)
###
[​
](#unsubscriberequestparams)
`UnsubscribeRequestParams`
interface UnsubscribeRequestParams {
 [\_meta](#unsubscriberequestparams-_meta)?: [RequestMetaObject](#requestmetaobject);
 [uri](#unsubscriberequestparams-uri): string;
}
Parameters for a `resources/unsubscribe` request.
\_meta?: RequestMetaObject[](#unsubscriberequestparams-_meta)
Inherited from ResourceRequestParams.\_meta
uri: string[](#unsubscriberequestparams-uri)
The URI of the resource. The URI can use any protocol; it is up to the server how to interpret it.
Inherited from ResourceRequestParams.uri
###
[​
](#unsubscriberesultresponse)
`UnsubscribeResultResponse`
interface UnsubscribeResultResponse {
 [jsonrpc](#unsubscriberesultresponse-jsonrpc): “2.0”;
 [id](#unsubscriberesultresponse-id): [RequestId](#requestid);
 [result](#unsubscriberesultresponse-result): [Result](#result);
}
A successful response from the server for a [resources/unsubscribe](#unsubscriberequest) request.
Example: Unsubscribe result response[](#unsubscriberesultresponse-example-unsubscribe-result-response)
```
`{
“jsonrpc”: “2.0”,
“id”: “unsubscribe-example”,
“result”: {}
} `Copy
```
jsonrpc: “2.0”[](#unsubscriberesultresponse-jsonrpc)
Inherited from [JSONRPCResultResponse](#jsonrpcresultresponse).[jsonrpc](#jsonrpcresultresponse-jsonrpc)
id: RequestId[](#unsubscriberesultresponse-id)
Inherited from [JSONRPCResultResponse](#jsonrpcresultresponse).[id](#jsonrpcresultresponse-id)
result: Result[](#unsubscriberesultresponse-result)
Overrides [JSONRPCResultResponse](#jsonrpcresultresponse).[result](#jsonrpcresultresponse-result)
##
[​
](#roots/list)
`roots/list`
###
[​
](#listrootsrequest)
`ListRootsRequest`
interface ListRootsRequest {
 [jsonrpc](#listrootsrequest-jsonrpc): “2.0”;
 [id](#listrootsrequest-id): [RequestId](#requestid);
 [method](#listrootsrequest-method): “roots/list”;
 [params](#listrootsrequest-params)?: [RequestParams](#requestparams);
}
Sent from the server to request a list of root URIs from the client. Roots allow
servers to ask for specific directories or files to operate on. A common example
for roots is providing a set of repositories or directories a server should operate
on.
This request is typically used when the server needs to understand the file system
structure or access specific locations that the client has permission to read from.
Example: List roots request[](#listrootsrequest-example-list-roots-request)
```
`{
“jsonrpc”: “2.0”,
“id”: “list-roots-example”,
“method”: “roots/list”
} `Copy
```
jsonrpc: “2.0”[](#listrootsrequest-jsonrpc)
Inherited from [JSONRPCRequest](#jsonrpcrequest).[jsonrpc](#jsonrpcrequest-jsonrpc)
id: RequestId[](#listrootsrequest-id)
Inherited from [JSONRPCRequest](#jsonrpcrequest).[id](#jsonrpcrequest-id)
method: “roots/list”[](#listrootsrequest-method)
Overrides [JSONRPCRequest](#jsonrpcrequest).[method](#jsonrpcrequest-method)
params?: RequestParams[](#listrootsrequest-params)
Overrides [JSONRPCRequest](#jsonrpcrequest).[params](#jsonrpcrequest-params)
###
[​
](#listrootsresultresponse)
`ListRootsResultResponse`
interface ListRootsResultResponse {
 [jsonrpc](#listrootsresultresponse-jsonrpc): “2.0”;
 [id](#listrootsresultresponse-id): [RequestId](#requestid);
 [result](#listrootsresultresponse-result): [ListRootsResult](#listrootsresult);
}
A successful response from the client for a [roots/list](#listrootsrequest) request.
Example: List roots result response[](#listrootsresultresponse-example-list-roots-result-response)
```
`{
“jsonrpc”: “2.0”,
“id”: “list-roots-example”,
“result”: {
“roots”: [
{
“uri”: “file:///home/user/projects/myproject”,
“name”: “My Project”
}
]
}
} `Copy
```
jsonrpc: “2.0”[](#listrootsresultresponse-jsonrpc)
Inherited from [JSONRPCResultResponse](#jsonrpcresultresponse).[jsonrpc](#jsonrpcresultresponse-jsonrpc)
id: RequestId[](#listrootsresultresponse-id)
Inherited from [JSONRPCResultResponse](#jsonrpcresultresponse).[id](#jsonrpcresultresponse-id)
result: ListRootsResult[](#listrootsresultresponse-result)
Overrides [JSONRPCResultResponse](#jsonrpcresultresponse).[result](#jsonrpcresultresponse-result)
###
[​
](#listrootsresult)
`ListRootsResult`
interface ListRootsResult {
 [\_meta](#listrootsresult-_meta)?: [MetaObject](#metaobject);
 [roots](#listrootsresult-roots): [Root](#root)[];
 [key: string]: unknown;
}
The result returned by the client for a [roots/list](#listrootsrequest) request.
This result contains an array of [Root](#root) objects, each representing a root directory
or file that the server can operate on.
Example: Single root directory[](#listrootsresult-example-single-root-directory)
```
`{
“roots”: [
{
“uri”: “file:///home/user/projects/myproject”,
“name”: “My Project”
}
]
} `Copy
```
Example: Multiple root directories[](#listrootsresult-example-multiple-root-directories)
```
`{
“roots”: [
{
“uri”: “file:///home/user/repos/frontend”,
“name”: “Frontend Repository”
},
{
“uri”: “file:///home/user/repos/backend”,
“name”: “Backend Repository”
}
]
} `Copy
```
\_meta?: MetaObject[](#listrootsresult-_meta)
Inherited from [Result](#result).[\_meta](#result-_meta)
roots: Root[][](#listrootsresult-roots)
###
[​
](#root)
`Root`
interface Root {
 [uri](#root-uri): string;
 [name](#root-name)?: string;
 [\_meta](#root-_meta)?: [MetaObject](#metaobject);
}
Represents a root directory or file that the server can operate on.
Example: Project directory root[](#root-example-project-directory-root)
```
`{
“uri”: “file:///home/user/projects/myproject”,
“name”: “My Project”
} `Copy
```
uri: string[](#root-uri)
The URI identifying the root. This *must* start with `file://` for now.
This restriction may be relaxed in future versions of the protocol to allow
other URI schemes.
name?: string[](#root-name)
An optional name for the root. This can be used to provide a human-readable
identifier for the root, which may be useful for display purposes or for
referencing the root in other parts of the application.
\_meta?: MetaObject[](#root-_meta)
##
[​
](#sampling/createmessage)
`sampling/createMessage`
###
[​
](#createmessagerequest)
`CreateMessageRequest`
interface CreateMessageRequest {
 [jsonrpc](#createmessagerequest-jsonrpc): “2.0”;
 [id](#createmessagerequest-id): [RequestId](#requestid);
 [method](#createmessagerequest-method): “sampling/createMessage”;
 [params](#createmessagerequest-params): [CreateMessageRequestParams](#createmessagerequestparams);
}
A request from the server to sample an LLM via the client. The client has full discretion over which model to select. The client should also inform the user before beginning sampling, to allow them to inspect the request (human in the loop) and decide whether to approve it.
Example: Sampling request[](#createmessagerequest-example-sampling-request)
```
`{
“jsonrpc”: “2.0”,
“id”: “sampling-example”,
“method”: “sampling/createMessage”,
“params”: {
“messages”: [
{
“role”: “user”,
“content”: {
“type”: “text”,
“text”: “What is the capital of France?”
}
}
],
“modelPreferences”: {
“hints”: [
{
“name”: “claude-3-sonnet”
}
],
“intelligencePriority”: 0.8,
“speedPriority”: 0.5
},
“systemPrompt”: “You are a helpful assistant.”,
“maxTokens”: 100
}
} `Copy
```
jsonrpc: “2.0”[](#createmessagerequest-jsonrpc)
Inherited from [JSONRPCRequest](#jsonrpcrequest).[jsonrpc](#jsonrpcrequest-jsonrpc)
id: RequestId[](#createmessagerequest-id)
Inherited from [JSONRPCRequest](#jsonrpcrequest).[id](#jsonrpcrequest-id)
method: “sampling/createMessage”[](#createmessagerequest-method)
Overrides [JSONRPCRequest](#jsonrpcrequest).[method](#jsonrpcrequest-method)
params: CreateMessageRequestParams[](#createmessagerequest-params)
Overrides [JSONRPCRequest](#jsonrpcrequest).[params](#jsonrpcrequest-params)
###
[​
](#createmessagerequestparams)
`CreateMessageRequestParams`
interface CreateMessageRequestParams {
 [task](#createmessagerequestparams-task)?: [TaskMetadata](#taskmetadata);
 [\_meta](#createmessagerequestparams-_meta)?: [RequestMetaObject](#requestmetaobject);
 [messages](#createmessagerequestparams-messages): [SamplingMessage](#samplingmessage)[];
 [modelPreferences](#createmessagerequestparams-modelpreferences)?: [ModelPreferences](#modelpreferences);
 [systemPrompt](#createmessagerequestparams-systemprompt)?: string;
 [includeContext](#createmessagerequestparams-includecontext)?: “none” | “thisServer” | “allServers”;
 [temperature](#createmessagerequestparams-temperature)?: number;
 [maxTokens](#createmessagerequestparams-maxtokens): number;
 [stopSequences](#createmessagerequestparams-stopsequences)?: string[];
 [metadata](#createmessagerequestparams-metadata)?: [JSONObject](#jsonobject);
 [tools](#createmessagerequestparams-tools)?: [Tool](#tool)[];
 [toolChoice](#createmessagerequestparams-toolchoice)?: [ToolChoice](#toolchoice);
}
Parameters for a `sampling/createMessage` request.
Example: Basic request[](#createmessagerequestparams-example-basic-request)
```
`{
“messages”: [
{
“role”: “user”,
“content”: {
“type”: “text”,
“text”: “What is the capital of France?”
}
}
],
“modelPreferences”: {
“hints”: [
{
“name”: “claude-3-sonnet”
}
],
“intelligencePriority”: 0.8,
“speedPriority”: 0.5
},
“systemPrompt”: “You are a helpful assistant.”,
“maxTokens”: 100
} `Copy
```
Example: Request with tools[](#createmessagerequestparams-example-request-with-tools)
```
`{
“messages”: [
{
“role”: “user”,
“content”: {
“type”: “text”,
“text”: “What’s the weather like in Paris and London?”
}
}
],
“tools”: [
{
“name”: “get\_weather”,
“description”: “Get current weather for a city”,
“inputSchema”: {
“type”: “object”,
“properties”: {
“city”: {
“type”: “string”,
“description”: “City name”
}
},
“required”: [“city”]
}
}
],
“toolChoice”: {
“mode”: “auto”
},
“maxTokens”: 1000
} `Copy
```
Example: Follow-up request with tool results[](#createmessagerequestparams-example-follow-up-request-with-tool-results)
```
`{
“messages”: [
{
“role”: “user”,
“content”: {
“type”: “text”,
“text”: “What’s the weather like in Paris and London?”
}
},
{
“role”: “assistant”,
“content”: [
{
“type”: “tool\_use”,
“id”: “call\_abc123”,
“name”: “get\_weather”,
“input”: { “city”: “Paris” }
},
{
“type”: “tool\_use”,
“id”: “call\_def456”,
“name”: “get\_weather”,
“input”: { “city”: “London” }
}
]
},
{
“role”: “user”,
“content”: [
{
“type”: “tool\_result”,
“toolUseId”: “call\_abc123”,
“content”: [
{
“type”: “text”,
“text”: “Weather in Paris: 18°C, partly cloudy”
}
]
},
{
“type”: “tool\_result”,
“toolUseId”: “call\_def456”,
“content”: [
{
“type”: “text”,
“text”: “Weather in London: 15°C, rainy”
}
]
}
]
}
],
“tools”: [
{
“name”: “get\_weather”,
“description”: “Get current weather for a city”,
“inputSchema”: {
“type”: “object”,
“properties”: {
“city”: { “type”: “string” }
},
“required”: [“city”]
}
}
],
“maxTokens”: 1000
} `Copy
```
task?: TaskMetadata[](#createmessagerequestparams-task)
If specified, the caller is requesting task-augmented execution for this request.
The request will return a [CreateTaskResult](#createtaskresult) immediately, and the actual result can be
retrieved later via [tasks/result](#gettaskpayloadrequest).
Task augmentation is subject to capability negotiation - receivers MUST declare support
for task augmentation of specific request types in their capabilities.
Inherited from TaskAugmentedRequestParams.task
\_meta?: RequestMetaObject[](#createmessagerequestparams-_meta)
Inherited from TaskAugmentedRequestParams.\_meta
messages: SamplingMessage[][](#createmessagerequestparams-messages)
modelPreferences?: ModelPreferences[](#createmessagerequestparams-modelpreferences)
The server’s preferences for which model to select. The client MAY ignore these preferences.
systemPrompt?: string[](#createmessagerequestparams-systemprompt)
An optional system prompt the server wants to use for sampling. The client MAY modify or omit this prompt.
includeContext?: “none” | “thisServer” | “allServers”[](#createmessagerequestparams-includecontext)
A request to include context from one or more MCP servers (including the caller), to be attached to the prompt.
The client MAY ignore this request.
Default is `“none”`. Values `“thisServer”` and `“allServers”` are soft-deprecated. Servers SHOULD only use these values if the client
declares [ClientCapabilities.sampling.context](#clientcapabilities-sampling). These values may be removed in future spec releases.
temperature?: number[](#createmessagerequestparams-temperature)
maxTokens: number[](#createmessagerequestparams-maxtokens)
The requested maximum number of tokens to sample (to prevent runaway completions).
The client MAY choose to sample fewer tokens than the requested maximum.
stopSequences?: string[][](#createmessagerequestparams-stopsequences)
metadata?: JSONObject[](#createmessagerequestparams-metadata)
Optional metadata to pass through to the LLM provider. The format of this metadata is provider-specific.
tools?: Tool[][](#createmessagerequestparams-tools)
Tools that the model may use during generation.
The client MUST return an error if this field is provided but [ClientCapabilities.sampling.tools](#clientcapabilities-sampling) is not declared.
toolChoice?: ToolChoice[](#createmessagerequestparams-toolchoice)
Controls how the model uses tools.
The client MUST return an error if this field is provided but [ClientCapabilities.sampling.tools](#clientcapabilities-sampling) is not declared.
Default is `{ mode: “auto” }`.
###
[​
](#createmessageresultresponse)
`CreateMessageResultResponse`
interface CreateMessageResultResponse {
 [jsonrpc](#createmessageresultresponse-jsonrpc): “2.0”;
 [id](#createmessageresultresponse-id): [RequestId](#requestid);
 [result](#createmessageresultresponse-result): [CreateMessageResult](#createmessageresult);
}
A successful response from the client for a [sampling/createMessage](#createmessagerequest) request.
Example: Sampling result response[](#createmessageresultresponse-example-sampling-result-response)
```
`{
“jsonrpc”: “2.0”,
“id”: “sampling-example”,
“result”: {
“role”: “assistant”,
“content”: {
“type”: “text”,
“text”: “The capital of France is Paris.”
},
“model”: “claude-3-sonnet-20240307”,
“stopReason”: “endTurn”
}
} `Copy
```
jsonrpc: “2.0”[](#createmessageresultresponse-jsonrpc)
Inherited from [JSONRPCResultResponse](#jsonrpcresultresponse).[jsonrpc](#jsonrpcresultresponse-jsonrpc)
id: RequestId[](#createmessageresultresponse-id)
Inherited from [JSONRPCResultResponse](#jsonrpcresultresponse).[id](#jsonrpcresultresponse-id)
result: CreateMessageResult[](#createmessageresultresponse-result)
Overrides [JSONRPCResultResponse](#jsonrpcresultresponse).[result](#jsonrpcresultresponse-result)
###
[​
](#createmessageresult)
`CreateMessageResult`
interface CreateMessageResult {
 [\_meta](#createmessageresult-_meta)?: [MetaObject](#metaobject);
 [model](#createmessageresult-model): string;
 [stopReason](#createmessageresult-stopreason)?: string;
 [role](#createmessageresult-role): [Role](#role);
 [content](#createmessageresult-content): [SamplingMessageContentBlock](#samplingmessagecontentblock) | [SamplingMessageContentBlock](#samplingmessagecontentblock)[];
 [key: string]: unknown;
}
The result returned by the client for a [sampling/createMessage](#createmessagerequest) request.
The client should inform the user before returning the sampled message, to allow them
to inspect the response (human in the loop) and decide whether to allow the server to see it.
Example: Text response[](#createmessageresult-example-text-response)
```
`{
“role”: “assistant”,
“content”: {
“type”: “text”,
“text”: “The capital of France is Paris.”
},
“model”: “claude-3-sonnet-20240307”,
“stopReason”: “endTurn”
} `Copy
```
Example: Tool use response[](#createmessageresult-example-tool-use-response)
```
`{
“role”: “assistant”,
“content”: [
{
“type”: “tool\_use”,
“id”: “call\_abc123”,
“name”: “get\_weather”,
“input”: {
“city”: “Paris”
}
},
{
“type”: “tool\_use”,
“id”: “call\_def456”,
“name”: “get\_weather”,
“input”: {
“city”: “London”
}
}
],
“model”: “claude-3-sonnet-20240307”,
“stopReason”: “toolUse”
} `Copy
```
Example: Final response after tool use[](#createmessageresult-example-final-response-after-tool-use)
```
`{
“role”: “assistant”,
“content”: {
“type”: “text”,
“text”: “Based on the current weather data:\\n\\n- \*\*Paris\*\*: 18°C and partly cloudy - quite pleasant!\\n- \*\*London\*\*: 15°C and rainy - you’ll want an umbrella.\\n\\nParis has slightly warmer and drier conditions today.”
},
“model”: “claude-3-sonnet-20240307”,
“stopReason”: “endTurn”
} `Copy
```
\_meta?: MetaObject[](#createmessageresult-_meta)
Inherited from [Result](#result).[\_meta](#result-_meta)
model: string[](#createmessageresult-model)
The name of the model that generated the message.
stopReason?: string[](#createmessageresult-stopreason)
The reason why sampling stopped, if known.
Standard values:
* `“endTurn”`: Natural end of the assistant’s turn
* `“stopSequence”`: A stop sequence was encountered
* `“maxTokens”`: Maximum token limit was reached
* `“toolUse”`: The model wants to use one or more tools
This field is an open string to allow for provider-specific stop reasons.
role: Role[](#createmessageresult-role)
Inherited from [SamplingMessage](#samplingmessage).[role](#samplingmessage-role)
content: SamplingMessageContentBlock | SamplingMessageContentBlock[][](#createmessageresult-content)
Inherited from [SamplingMessage](#samplingmessage).[content](#samplingmessage-content)
###
[​
](#modelhint)
`ModelHint`
interface ModelHint {
 [name](#modelhint-name)?: string;
}
Hints to use for model selection.
Keys not declared here are currently left unspecified by the spec and are up
to the client to interpret.
name?: string[](#modelhint-name)
A hint for a model name.
The client SHOULD treat this as a substring of a model name; for example:
* `claude-3-5-sonnet` should match `claude-3-5-sonnet-20241022`
* `sonnet` should match `claude-3-5-sonnet-20241022`, `claude-3-sonnet-20240229`, etc.
* `claude` should match any Claude model
The client MAY also map the string to a different provider’s model name or a different model family, as long as it fills a similar niche; for example:
* `gemini-1.5-flash` could match `claude-3-haiku-20240307`
###
[​
](#modelpreferences)
`ModelPreferences`
interface ModelPreferences {
 [hints](#modelpreferences-hints)?: [ModelHint](#modelhint)[];
 [costPriority](#modelpreferences-costpriority)?: number;
 [speedPriority](#modelpreferences-speedpriority)?: number;
 [intelligencePriority](#modelpreferences-intelligencepriority)?: number;
}
The server’s preferences for model selection, requested of the client during sampling.
Because LLMs can vary along multiple dimensions, choosing the “best” model is
rarely straightforward. Different models excel in different areas—some are
faster but less capable, others are more capable but more expensive, and so
on. This interface allows servers to express their priorities across multiple
dimensions to help clients make an appropriate selection for their use case.
These preferences are always advisory. The client MAY ignore them. It is also
up to the client to decide how to interpret these preferences and how to
balance them against other considerations.
Example: With hints and priorities[](#modelpreferences-example-with-hints-and-priorities)
```
`{
“hints”: [
{ “name”: “claude-3-sonnet” },
{ “name”: “claude” }
],
“costPriority”: 0.3,
“speedPriority”: 0.8,
“intelligencePriority”: 0.5
} `Copy
```
hints?: ModelHint[][](#modelpreferences-hints)
Optional hints to use for model selection.
If multiple hints are specified, the client MUST evaluate them in order
(such that the first match is taken).
The client SHOULD prioritize these hints over the numeric priorities, but
MAY still use the priorities to select from ambiguous matches.
costPriority?: number[](#modelpreferences-costpriority)
How much to prioritize cost when selecting a model. A value of 0 means cost
is not important, while a value of 1 means cost is the most important
factor.
speedPriority?: number[](#modelpreferences-speedpriority)
How much to prioritize sampling speed (latency) when selecting a model. A
value of 0 means speed is not important, while a value of 1 means speed is
the most important factor.
intelligencePriority?: number[](#modelpreferences-intelligencepriority)
How much to prioritize intelligence and capabilities when selecting a
model. A value of 0 means intelligence is not important, while a value of 1
means intelligence is the most important factor.
###
[​
](#samplingmessage)
`SamplingMessage`
interface SamplingMessage {
 [role](#samplingmessage-role): [Role](#role);
 [content](#samplingmessage-content): [SamplingMessageContentBlock](#samplingmessagecontentblock) | [SamplingMessageContentBlock](#samplingmessagecontentblock)[];
 [\_meta](#samplingmessage-_meta)?: [MetaObject](#metaobject);
}
Describes a message issued to or received from an LLM API.
Example: Single content block[](#samplingmessage-example-single-content-block)
```
`{
“role”: “user”,
“content”: {
“type”: “text”,
“text”: “What is the capital of France?”
}
} `Copy
```
Example: Multiple content blocks[](#samplingmessage-example-multiple-content-blocks)
```
`{
“role”: “user”,
“content”: [
{
“type”: “tool\_result”,
“toolUseId”: “call\_123”,
“content”: [{ “type”: “text”, “text”: “Result 1” }]
},
{
“type”: “tool\_result”,
“toolUseId”: “call\_456”,
“content”: [{ “type”: “text”, “text”: “Result 2” }]
}
]
} `Copy
```
role: Role[](#samplingmessage-role)
content: SamplingMessageContentBlock | SamplingMessageContentBlock[][](#samplingmessage-content)
\_meta?: MetaObject[](#samplingmessage-_meta)
###
[​
](#samplingmessagecontentblock)
`SamplingMessageContentBlock`
SamplingMessageContentBlock:
 | [TextContent](#textcontent)
 | [ImageContent](#imagecontent)
 | [AudioContent](#audiocontent)
 | [ToolUseContent](#toolusecontent)
 | [ToolResultContent](#toolresultcontent)
###
[​
](#toolchoice)
`ToolChoice`
interface ToolChoice {
 [mode](#toolchoice-mode)?: “none” | “required” | “auto”;
}
Controls tool selection behavior for sampling requests.
mode?: “none” | “required” | “auto”[](#toolchoice-mode)
Controls the tool use ability of the model:
* `“auto”`: Model decides whether to use tools (default)
* `“required”`: Model MUST use at least one tool before completing
* `“none”`: Model MUST NOT use any tools
###
[​
](#toolresultcontent)
`ToolResultContent`
interface ToolResultContent {
 [type](#toolresultcontent-type): “tool\_result”;
 [toolUseId](#toolresultcontent-tooluseid): string;
 [content](#toolresultcontent-content): [ContentBlock](#contentblock)[];
 [structuredContent](#toolresultcontent-structuredcontent)?: { [key: string]: unknown };
 [isError](#toolresultcontent-iserror)?: boolean;
 [\_meta](#toolresultcontent-_meta)?: [MetaObject](#metaobject);
}
The result of a tool use, provided by the user back to the assistant.
Example: `get\_weather` tool result[](#toolresultcontent-example-get_weather-tool-result)
```
`{
“type”: “tool\_result”,
“toolUseId”: “call\_abc123”,
“content”: [
{
“type”: “text”,
“text”: “Weather in Paris: 18°C, partly cloudy”
}
]
} `Copy
```
type: “tool\_result”[](#toolresultcontent-type)
toolUseId: string[](#toolresultcontent-tooluseid)
The ID of the tool use this result corresponds to.
This MUST match the ID from a previous [ToolUseContent](#toolusecontent).
content: ContentBlock[][](#toolresultcontent-content)
The unstructured result content of the tool use.
This has the same format as [CallToolResult.content](#calltoolresult-content) and can include text, images,
audio, resource links, and embedded resources.
structuredContent?: { [key: string]: unknown }[](#toolresultcontent-structuredcontent)
An optional structured result object.
If the tool defined an [Tool.outputSchema](#tool-outputschema), this SHOULD conform to that schema.
isError?: boolean[](#toolresultcontent-iserror)
Whether the tool use resulted in an error.
If true, the content typically describes the error that occurred.
Default: false
\_meta?: MetaObject[](#toolresultcontent-_meta)
Optional metadata about the tool result. Clients SHOULD preserve this field when
including tool results in subsequent sampling requests to enable caching optimizations.
###
[​
](#toolusecontent)
`ToolUseContent`
interface ToolUseContent {
 [type](#toolusecontent-type): “tool\_use”;
 [id](#toolusecontent-id): string;
 [name](#toolusecontent-name): string;
 [input](#toolusecontent-input): { [key: string]: unknown };
 [\_meta](#toolusecontent-_meta)?: [MetaObject](#metaobject);
}
A request from the assistant to call a tool.
Example: `get\_weather` tool use[](#toolusecontent-example-get_weather-tool-use)
```
`{
“type”: “tool\_use”,
“id”: “call\_abc123”,
“name”: “get\_weather”,
“input”: {
“city”: “Paris”
}
} `Copy
```
type: “tool\_use”[](#toolusecontent-type)
id: string[](#toolusecontent-id)
A unique identifier for this tool use.
This ID is used to match tool results to their corresponding tool uses.
name: string[](#toolusecontent-name)
The name of the tool to call.
input: { [key: string]: unknown }[](#toolusecontent-input)
The arguments to pass to the tool, conforming to the tool’s input schema.
\_meta?: MetaObject[](#toolusecontent-_meta)
Optional metadata about the tool use. Clients SHOULD preserve this field when
including tool uses in subsequent sampling requests to enable caching optimizations.
##
[​
](#tools/call)
`tools/call`
###
[​
](#calltoolrequest)
`CallToolRequest`
interface CallToolRequest {
 [jsonrpc](#calltoolrequest-jsonrpc): “2.0”;
 [id](#calltoolrequest-id): [RequestId](#requestid);
 [method](#calltoolrequest-method): “tools/call”;
 [params](#calltoolrequest-params): [CallToolRequestParams](#calltoolrequestparams);
}
Used by the client to invoke a tool provided by the server.
Example: Call tool request[](#calltoolrequest-example-call-tool-request)
```
`{
“jsonrpc”: “2.0”,
“id”: “call-tool-example”,
“method”: “tools/call”,
“params”: {
“name”: “get\_weather”,
“arguments”: {
“location”: “New York”
}
}
} `Copy
```
jsonrpc: “2.0”[](#calltoolrequest-jsonrpc)
Inherited from [JSONRPCRequest](#jsonrpcrequest).[jsonrpc](#jsonrpcrequest-jsonrpc)
id: RequestId[](#calltoolrequest-id)
Inherited from [JSONRPCRequest](#jsonrpcrequest).[id](#jsonrpcrequest-id)
method: “tools/call”[](#calltoolrequest-method)
Overrides [JSONRPCRequest](#jsonrpcrequest).[method](#jsonrpcrequest-method)
params: CallToolRequestParams[](#calltoolrequest-params)
Overrides [JSONRPCRequest](#jsonrpcrequest).[params](#jsonrpcrequest-params)
###
[​
](#calltoolrequestparams)
`CallToolRequestParams`
interface CallToolRequestParams {
 [task](#calltoolrequestparams-task)?: [TaskMetadata](#taskmetadata);
 [\_meta](#calltoolrequestparams-_meta)?: [RequestMetaObject](#requestmetaobject);
 [name](#calltoolrequestparams-name): string;
 [arguments](#calltoolrequestparams-arguments)?: { [key: string]: unknown };
}
Parameters for a `tools/call` request.
Example: `get\_weather` tool call params[](#calltoolrequestparams-example-get_weather-tool-call-params)
```
`{
“name”: “get\_weather”,
“arguments”: {
“location”: “New York”
}
} `Copy
```
Example: Tool call params with progress token[](#calltoolrequestparams-example-tool-call-params-with-progress-token)
```
`{
“\_meta”: {
“progressToken”: “oivaizmir”
},
“name”: “build\_simulation”,
“arguments”: {
“city”: “Micropolis”
}
} `Copy
```
task?: TaskMetadata[](#calltoolrequestparams-task)
If specified, the caller is requesting task-augmented execution for this request.
The request will return a [CreateTaskResult](#createtaskresult) immediately, and the actual result can be
retrieved later via [tasks/result](#gettaskpayloadrequest).
Task augmentation is subject to capability negotiation - receivers MUST declare support
for task augmentation of specific request types in their capabilities.
Inherited from TaskAugmentedRequestParams.task
\_meta?: RequestMetaObject[](#calltoolrequestparams-_meta)
Inherited from TaskAugmentedRequestParams.\_meta
name: string[](#calltoolrequestparams-name)
The name of the tool.
arguments?: { [key: string]: unknown }[](#calltoolrequestparams-arguments)
Arguments to use for the tool call.
###
[​
](#calltoolresultresponse)
`CallToolResultResponse`
interface CallToolResultResponse {
 [jsonrpc](#calltoolresultresponse-jsonrpc): “2.0”;
 [id](#calltoolresultresponse-id): [RequestId](#requestid);
 [result](#calltoolresultresponse-result): [CallToolResult](#calltoolresult);
}
A successful response from the server for a [tools/call](#calltoolrequest) request.
Example: Call tool result response[](#calltoolresultresponse-example-call-tool-result-response)
```
`{
“jsonrpc”: “2.0”,
“id”: “call-tool-example”,
“result”: {
“content”: [
{
“type”: “text”,
“text”: “Current weather in New York:\\nTemperature: 72°F\\nConditions: Partly cloudy”
}
],
“isError”: false
}
} `Copy
```
jsonrpc: “2.0”[](#calltoolresultresponse-jsonrpc)
Inherited from [JSONRPCResultResponse](#jsonrpcresultresponse).[jsonrpc](#jsonrpcresultresponse-jsonrpc)
id: RequestId[](#calltoolresultresponse-id)
Inherited from [JSONRPCResultResponse](#jsonrpcresultresponse).[id](#jsonrpcresultresponse-id)
result: CallToolResult[](#calltoolresultresponse-result)
Overrides [JSONRPCResultResponse](#jsonrpcresultresponse).[result](#jsonrpcresultresponse-result)
###
[​
](#calltoolresult)
`CallToolResult`
interface CallToolResult {
 [\_meta](#calltoolresult-_meta)?: [MetaObject](#metaobject);
 [content](#calltoolresult-content): [ContentBlock](#contentblock)[];
 [structuredContent](#calltoolresult-structuredcontent)?: { [key: string]: unknown };
 [isError](#calltoolresult-iserror)?: boolean;
 [key: string]: unknown;
}
The result returned by the server for a [tools/call](#calltoolrequest) request.
Example: Result with unstructured text[](#calltoolresult-example-result-with-unstructured-text)
```
`{
“content”: [
{
“type”: “text”,
“text”: “Current weather in New York:\\nTemperature: 72°F\\nConditions: Partly cloudy”
}
],
“isError”: false
} `Copy
```
Example: Result with structured content[](#calltoolresult-example-result-with-structured-content)
```
`{
“content”: [
{
“type”: “text”,
“text”: ”{\\“temperature\\”: 22.5, \\“conditions\\”: \\“Partly cloudy\\”, \\“humidity\\”: 65}”
}
],
“structuredContent”: {
“temperature”: 22.5,
“conditions”: “Partly cloudy”,
“humidity”: 65
}
} `Copy
```
Example: Invalid tool input error[](#calltoolresult-example-invalid-tool-input-error)
```
`{
“content”: [
{
“type”: “text”,
“text”: “Invalid departure date: must be in the future. Current date is 08/08/2025.”
}
],
“isError”: true
} `Copy
```
\_meta?: MetaObject[](#calltoolresult-_meta)
Inherited from [Result](#result).[\_meta](#result-_meta)
content: ContentBlock[][](#calltoolresult-content)
A list of content objects that represent the unstructured result of the tool call.
structuredContent?: { [key: string]: unknown }[](#calltoolresult-structuredcontent)
An optional JSON object that represents the structured result of the tool call.
isError?: boolean[](#calltoolresult-iserror)
Whether the tool call ended in an error.
If not set, this is assumed to be false (the call was successful).
Any errors that originate from the tool SHOULD be reported inside the result
object, with `isError` set to true, *not* as an MCP protocol-level error
response. Otherwise, the LLM would not be able to see that an error occurred
and self-correct.
However, any errors in *finding* the tool, an error indicating that the
server does not support tool calls, or any other exceptional conditions,
should be reported as an MCP error response.
##
[​
](#tools/list)
`tools/list`
###
[​
](#listtoolsrequest)
`ListToolsRequest`
interface ListToolsRequest {
 [jsonrpc](#listtoolsrequest-jsonrpc): “2.0”;
 [id](#listtoolsrequest-id): [RequestId](#requestid);
 [params](#listtoolsrequest-params)?: [PaginatedRequestParams](#paginatedrequestparams);
 [method](#listtoolsrequest-method): “tools/list”;
}
Sent from the client to request a list of tools the server has.
Example: List tools request[](#listtoolsrequest-example-list-tools-request)
```
`{
“jsonrpc”: “2.0”,
“id”: “list-tools-example”,
“method”: “tools/list”
} `Copy
```
jsonrpc: “2.0”[](#listtoolsrequest-jsonrpc)
Inherited from PaginatedRequest.jsonrpc
id: RequestId[](#listtoolsrequest-id)
Inherited from PaginatedRequest.id
params?: PaginatedRequestParams[](#listtoolsrequest-params)
Inherited from PaginatedRequest.params
method: “tools/list”[](#listtoolsrequest-method)
Overrides PaginatedRequest.method
###
[​
](#listtoolsresultresponse)
`ListToolsResultResponse`
interface ListToolsResultResponse {
 [jsonrpc](#listtoolsresultresponse-jsonrpc): “2.0”;
 [id](#listtoolsresultresponse-id): [RequestId](#requestid);
 [result](#listtoolsresultresponse-result): [ListToolsResult](#listtoolsresult);
}
A successful response from the server for a [tools/list](#listtoolsrequest) request.
Example: List tools result response[](#listtoolsresultresponse-example-list-tools-result-response)
```
`{
“jsonrpc”: “2.0”,
“id”: “list-tools-example”,
“result”: {
“tools”: [
{
“name”: “get\_weather”,
“title”: “Weather Information Provider”,
“description”: “Get current weather information for a location”,
“inputSchema”: {
“type”: “object”,
“properties”: {
“location”: {
“type”: “string”,
“description”: “City name or zip code”
}
},
“required”: [“location”]
},
“icons”: [
{
“src”: “[https://example.com/weather-icon.png](https://example.com/weather-icon.png)”,
“mimeType”: “image/png”,
“sizes”: [“48x48”]
}
]
}
],
“nextCursor”: “next-page-cursor”
}
} `Copy
```
jsonrpc: “2.0”[](#listtoolsresultresponse-jsonrpc)
Inherited from [JSONRPCResultResponse](#jsonrpcresultresponse).[jsonrpc](#jsonrpcresultresponse-jsonrpc)
id: RequestId[](#listtoolsresultresponse-id)
Inherited from [JSONRPCResultResponse](#jsonrpcresultresponse).[id](#jsonrpcresultresponse-id)
result: ListToolsResult[](#listtoolsresultresponse-result)
Overrides [JSONRPCResultResponse](#jsonrpcresultresponse).[result](#jsonrpcresultresponse-result)
###
[​
](#listtoolsresult)
`ListToolsResult`
interface ListToolsResult {
 [\_meta](#listtoolsresult-_meta)?: [MetaObject](#metaobject);
 [nextCursor](#listtoolsresult-nextcursor)?: string;
 [tools](#listtoolsresult-tools): [Tool](#tool)[];
 [key: string]: unknown;
}
The result returned by the server for a [tools/list](#listtoolsrequest) request.
Example: Tools list with cursor[](#listtoolsresult-example-tools-list-with-cursor)
```
`{
“tools”: [
{
“name”: “get\_weather”,
“title”: “Weather Information Provider”,
“description”: “Get current weather information for a location”,
“inputSchema”: {
“type”: “object”,
“properties”: {
“location”: {
“type”: “string”,
“description”: “City name or zip code”
}
},
“required”: [“location”]
},
“icons”: [
{
“src”: “[https://example.com/weather-icon.png](https://example.com/weather-icon.png)”,
“mimeType”: “image/png”,
“sizes”: [“48x48”]
}
]
}
],
“nextCursor”: “next-page-cursor”
} `Copy
```
\_meta?: MetaObject[](#listtoolsresult-_meta)
Inherited from PaginatedResult.\_meta
nextCursor?: string[](#listtoolsresult-nextcursor)
An opaque token representing the pagination position after the last returned result.
If present, there may be more results available.
Inherited from PaginatedResult.nextCursor
tools: Tool[][](#listtoolsresult-tools)
###
[​
](#tool)
`Tool`
interface Tool {
 [icons](#tool-icons)?: [Icon](#icon)[];
 [name](#tool-name): string;
 [title](#tool-title)?: string;
 [description](#tool-description)?: string;
 [inputSchema](#tool-inputschema): {
 $schema?: string;
 type: “object”;
 properties?: { [key: string]: [JSONValue](#jsonvalue) };
 required?: string[];
 };
 [execution](#tool-execution)?: [ToolExecution](#toolexecution);
 [outputSchema](#tool-outputschema)?: {
 $schema?: string;
 type: “object”;
 properties?: { [key: string]: [JSONValue](#jsonvalue) };
 required?: string[];
 };
 [annotations](#tool-annotations)?: [ToolAnnotations](#toolannotations);
 [\_meta](#tool-_meta)?: [MetaObject](#metaobject);
}
Definition for a tool the client can call.
Example: With default 2020-12 input schema[](#tool-example-with-default-2020-12-input-schema)
```
`{
“name”: “calculate\_sum”,
“description”: “Add two numbers”,
“inputSchema”: {
“type”: “object”,
“properties”: {
“a”: { “type”: “number” },
“b”: { “type”: “number” }
},
“required”: [“a”, “b”]
}
} `Copy
```
Example: With explicit draft-07 input schema[](#tool-example-with-explicit-draft-07-input-schema)
```
`{
“name”: “calculate\_sum”,
“description”: “Add two numbers”,
“inputSchema”: {
“$schema”: “[http://json-schema.org/draft-07/schema#](http://json-schema.org/draft-07/schema#)”,
“type”: “object”,
“properties”: {
“a”: { “type”: “number” },
“b”: { “type”: “number” }
},
“required”: [“a”, “b”]
}
} `Copy
```
Example: With no parameters[](#tool-example-with-no-parameters)
```
`{
“name”: “get\_current\_time”,
“description”: “Returns the current server time”,
“inputSchema”: {
“type”: “object”,
“additionalProperties”: false
}
} `Copy
```
Example: With output schema for structured content[](#tool-example-with-output-schema-for-structured-content)
```
`{
“name”: “get\_weather\_data”,
“title”: “Weather Data Retriever”,
“description”: “Get current weather data for a location”,
“inputSchema”: {
“type”: “object”,
“properties”: {
“location”: {
“type”: “string”,
“description”: “City name or zip code”
}
},
“required”: [“location”]
},
“outputSchema”: {
“type”: “object”,
“properties”: {
“temperature”: {
“type”: “number”,
“description”: “Temperature in celsius”
},
“conditions”: {
“type”: “string”,
“description”: “Weather conditions description”
},
“humidity”: {
“type”: “number”,
“description”: “Humidity percentage”
}
},
“required”: [“temperature”, “conditions”, “humidity”]
}
} `Copy
```
icons?: Icon[][](#tool-icons)
Optional set of sized icons that the client can display in a user interface.
Clients that support rendering icons MUST support at least the following MIME types:
* `image/png` - PNG images (safe, universal compatibility)
* `image/jpeg` (and `image/jpg`) - JPEG images (safe, universal compatibility)
Clients that support rendering icons SHOULD also support:
* `image/svg+xml` - SVG images (scalable but requires security precautions)
* `image/webp` - WebP images (modern, efficient format)
Inherited from Icons.icons
name: string[](#tool-name)
Intended for programmatic or logical use, but used as a display name in past specs or fallback (if title isn’t present).
Inherited from BaseMetadata.name
title?: string[](#tool-title)
Intended for UI and end-user contexts — optimized to be human-readable and easily understood,
even by those unfamiliar with domain-specific terminology.
If not provided, the name should be used for display (except for [Tool](#),
where `annotations.title` should be given precedence over using `name`,
if present).
Inherited from BaseMetadata.title
description?: string[](#tool-description)
A human-readable description of the tool.
This can be used by clients to improve the LLM’s understanding of available tools. It can be thought of like a “hint” to the model.
inputSchema: { $schema?: string; type: “object”; properties?: { [key: string]: JSONValue }; required?: string[]; }[](#tool-inputschema)
A JSON Schema object defining the expected parameters for the tool.
execution?: ToolExecution[](#tool-execution)
Execution-related properties for this tool.
outputSchema?: { $schema?: string; type: “object”; properties?: { [key: string]: JSONValue }; required?: string[]; }[](#tool-outputschema)
An optional JSON Schema object defining the structure of the tool’s output returned in
the structuredContent field of a [CallToolResult](#calltoolresult).
Defaults to JSON Schema 2020-12 when no explicit `$schema` is provided.
Currently restricted to `type: “object”` at the root level.
annotations?: ToolAnnotations[](#tool-annotations)
Optional additional tool information.
Display name precedence order is: `title`, `annotations.title`, then `name`.
\_meta?: MetaObject[](#tool-_meta)
###
[​
](#toolannotations)
`ToolAnnotations`
interface ToolAnnotations {
 [title](#toolannotations-title)?: string;
 [readOnlyHint](#toolannotations-readonlyhint)?: boolean;
 [destructiveHint](#toolannotations-destructivehint)?: boolean;
 [idempotentHint](#toolannotations-idempotenthint)?: boolean;
 [openWorldHint](#toolannotations-openworldhint)?: boolean;
}
Additional properties describing a [Tool](#tool) to clients.
NOTE: all properties in `ToolAnnotations` are **hints**.
They are not guaranteed to provide a faithful description of
tool behavior (including descriptive properties like `title`).
Clients should never make tool use decisions based on `ToolAnnotations`
received from untrusted servers.
title?: string[](#toolannotations-title)
A human-readable title for the tool.
readOnlyHint?: boolean[](#toolannotations-readonlyhint)
If true, the tool does not modify its environment.
Default: false
destructiveHint?: boolean[](#toolannotations-destructivehint)
If true, the tool may perform destructive updates to its environment.
If false, the tool performs only additive updates.
(This property is meaningful only when `readOnlyHint == false`)
Default: true
idempotentHint?: boolean[](#toolannotations-idempotenthint)
If true, calling the tool repeatedly with the same arguments
will have no additional effect on its environment.
(This property is meaningful only when `readOnlyHint == false`)
Default: false
openWorldHint?: boolean[](#toolannotations-openworldhint)
If true, this tool may interact with an “open world” of external
entities. If false, the tool’s domain of interaction is closed.
For example, the world of a web search tool is open, whereas that
of a memory tool is not.
Default: true
###
[​
](#toolexecution)
`ToolExecution`
interface ToolExecution {
 [taskSupport](#toolexecution-tasksupport)?: “forbidden” | “optional” | “required”;
}
Execution-related properties for a tool.
taskSupport?: “forbidden” | “optional” | “required”[](#toolexecution-tasksupport)
Indicates whether this tool supports task-augmented execution.
This allows clients to handle long-running operations through polling
the task system.
* `“forbidden”`: Tool does not support task-augmented execution (default when absent)
* `“optional”`: Tool may support task-augmented execution
* `“required”`: Tool requires task-augmented execution
Default: `“forbidden”`