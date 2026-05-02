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
](#jsonrpcerror)
`JSONRPCError`
interface JSONRPCError {
 [jsonrpc](#jsonrpcerror-jsonrpc): “2.0”;
 [id](#jsonrpcerror-id): [RequestId](#requestid);
 [error](#jsonrpcerror-error): { code: number; message: string; data?: unknown };
}
A response to a request that indicates an error occurred.
jsonrpc: “2.0”[](#jsonrpcerror-jsonrpc)
id: RequestId[](#jsonrpcerror-id)
error: { code: number; message: string; data?: unknown }[](#jsonrpcerror-error)
Type Declaration
*
code: number
The error type that occurred.
*
message: string
A short description of the error. The message SHOULD be limited to a concise single sentence.
*
`Optional`data?: unknown
Additional information about the error. The value of this member is defined by the sender (e.g. detailed error information, nested errors etc.).
###
[​
](#jsonrpcmessage)
`JSONRPCMessage`
JSONRPCMessage:
 | [JSONRPCRequest](#jsonrpcrequest)
 | [JSONRPCNotification](#jsonrpcnotification)
 | [JSONRPCResponse](#jsonrpcresponse)
 | [JSONRPCError](#jsonrpcerror)
Refers to any valid JSON-RPC object that can be decoded off the wire, or encoded to be sent.
###
[​
](#jsonrpcnotification)
`JSONRPCNotification`
interface JSONRPCNotification {
 [method](#jsonrpcnotification-method): string;
 [params](#jsonrpcnotification-params)?: { \_meta?: { [key: string]: unknown }; [key: string]: unknown };
 [jsonrpc](#jsonrpcnotification-jsonrpc): “2.0”;
}
A notification which does not expect a response.
method: string[](#jsonrpcnotification-method)
Inherited from Notification.method
params?: { \_meta?: { [key: string]: unknown }; [key: string]: unknown }[](#jsonrpcnotification-params)
Type Declaration
*
[key: string]: unknown
*
`Optional`\_meta?: { [key: string]: unknown }
See [General fields: `\_meta`](/specification/2025-06-18/basic/index#meta) for notes on `\_meta` usage.
Inherited from Notification.params
jsonrpc: “2.0”[](#jsonrpcnotification-jsonrpc)
###
[​
](#jsonrpcrequest)
`JSONRPCRequest`
interface JSONRPCRequest {
 [method](#jsonrpcrequest-method): string;
 [params](#jsonrpcrequest-params)?: {
 \_meta?: { progressToken?: [ProgressToken](#progresstoken); [key: string]: unknown };
 [key: string]: unknown;
 };
 [jsonrpc](#jsonrpcrequest-jsonrpc): “2.0”;
 [id](#jsonrpcrequest-id): [RequestId](#requestid);
}
A request that expects a response.
method: string[](#jsonrpcrequest-method)
Inherited from Request.method
params?: { \_meta?: { progressToken?: ProgressToken; [key: string]: unknown }; [key: string]: unknown; }[](#jsonrpcrequest-params)
Type Declaration
*
[key: string]: unknown
*
`Optional`\_meta?: { progressToken?: [ProgressToken](#progresstoken); [key: string]: unknown }
See [General fields: `\_meta`](/specification/2025-06-18/basic/index#meta) for notes on `\_meta` usage.
*
`Optional`progressToken?: [ProgressToken](#progresstoken)
If specified, the caller is requesting out-of-band progress notifications for this request (as represented by notifications/progress). The value of this parameter is an opaque token that will be attached to any subsequent notifications. The receiver is not obligated to provide these notifications.
Inherited from Request.params
jsonrpc: “2.0”[](#jsonrpcrequest-jsonrpc)
id: RequestId[](#jsonrpcrequest-id)
###
[​
](#jsonrpcresponse)
`JSONRPCResponse`
interface JSONRPCResponse {
 [jsonrpc](#jsonrpcresponse-jsonrpc): “2.0”;
 [id](#jsonrpcresponse-id): [RequestId](#requestid);
 [result](#jsonrpcresponse-result): [Result](#result);
}
A successful (non-error) response to a request.
jsonrpc: “2.0”[](#jsonrpcresponse-jsonrpc)
id: RequestId[](#jsonrpcresponse-id)
result: Result[](#jsonrpcresponse-result)
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
Describes who the intended customer of this object or data is.
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
A response that indicates success but carries no data.
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
](#result)
`Result`
interface Result {
 [\_meta](#result-_meta)?: { [key: string]: unknown };
 [key: string]: unknown;
}
\_meta?: { [key: string]: unknown }[](#result-_meta)
See [General fields: `\_meta`](/specification/2025-06-18/basic/index#meta) for notes on `\_meta` usage.
###
[​
](#role)
`Role`
Role: “user” | “assistant”
The sender or recipient of messages and data in a conversation.
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
 [\_meta](#audiocontent-_meta)?: { [key: string]: unknown };
}
Audio provided to or from an LLM.
type: “audio”[](#audiocontent-type)
data: string[](#audiocontent-data)
The base64-encoded audio data.
mimeType: string[](#audiocontent-mimetype)
The MIME type of the audio. Different providers may support different audio types.
annotations?: Annotations[](#audiocontent-annotations)
Optional annotations for the client.
\_meta?: { [key: string]: unknown }[](#audiocontent-_meta)
See [General fields: `\_meta`](/specification/2025-06-18/basic/index#meta) for notes on `\_meta` usage.
###
[​
](#blobresourcecontents)
`BlobResourceContents`
interface BlobResourceContents {
 [uri](#blobresourcecontents-uri): string;
 [mimeType](#blobresourcecontents-mimetype)?: string;
 [\_meta](#blobresourcecontents-_meta)?: { [key: string]: unknown };
 [blob](#blobresourcecontents-blob): string;
}
uri: string[](#blobresourcecontents-uri)
The URI of this resource.
Inherited from ResourceContents.uri
mimeType?: string[](#blobresourcecontents-mimetype)
The MIME type of this resource, if known.
Inherited from ResourceContents.mimeType
\_meta?: { [key: string]: unknown }[](#blobresourcecontents-_meta)
See [General fields: `\_meta`](/specification/2025-06-18/basic/index#meta) for notes on `\_meta` usage.
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
 [\_meta](#embeddedresource-_meta)?: { [key: string]: unknown };
}
The contents of a resource, embedded into a prompt or tool call result.
It is up to the client how best to render embedded resources for the benefit
of the LLM and/or the user.
type: “resource”[](#embeddedresource-type)
resource: TextResourceContents | BlobResourceContents[](#embeddedresource-resource)
annotations?: Annotations[](#embeddedresource-annotations)
Optional annotations for the client.
\_meta?: { [key: string]: unknown }[](#embeddedresource-_meta)
See [General fields: `\_meta`](/specification/2025-06-18/basic/index#meta) for notes on `\_meta` usage.
###
[​
](#imagecontent)
`ImageContent`
interface ImageContent {
 [type](#imagecontent-type): “image”;
 [data](#imagecontent-data): string;
 [mimeType](#imagecontent-mimetype): string;
 [annotations](#imagecontent-annotations)?: [Annotations](#annotations);
 [\_meta](#imagecontent-_meta)?: { [key: string]: unknown };
}
An image provided to or from an LLM.
type: “image”[](#imagecontent-type)
data: string[](#imagecontent-data)
The base64-encoded image data.
mimeType: string[](#imagecontent-mimetype)
The MIME type of the image. Different providers may support different image types.
annotations?: Annotations[](#imagecontent-annotations)
Optional annotations for the client.
\_meta?: { [key: string]: unknown }[](#imagecontent-_meta)
See [General fields: `\_meta`](/specification/2025-06-18/basic/index#meta) for notes on `\_meta` usage.
###
[​
](#resourcelink)
`ResourceLink`
interface ResourceLink {
 [name](#resourcelink-name): string;
 [title](#resourcelink-title)?: string;
 [uri](#resourcelink-uri): string;
 [description](#resourcelink-description)?: string;
 [mimeType](#resourcelink-mimetype)?: string;
 [annotations](#resourcelink-annotations)?: [Annotations](#annotations);
 [size](#resourcelink-size)?: number;
 [\_meta](#resourcelink-_meta)?: { [key: string]: unknown };
 [type](#resourcelink-type): “resource\_link”;
}
A resource that the server is capable of reading, included in a prompt or tool call result.
Note: resource links returned by tools are not guaranteed to appear in the results of `resources/list` requests.
name: string[](#resourcelink-name)
Intended for programmatic or logical use, but used as a display name in past specs or fallback (if title isn’t present).
Inherited from [Resource](#resource).[name](#resource-name)
title?: string[](#resourcelink-title)
Intended for UI and end-user contexts — optimized to be human-readable and easily understood,
even by those unfamiliar with domain-specific terminology.
If not provided, the name should be used for display (except for Tool,
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
\_meta?: { [key: string]: unknown }[](#resourcelink-_meta)
See [General fields: `\_meta`](/specification/2025-06-18/basic/index#meta) for notes on `\_meta` usage.
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
 [\_meta](#textcontent-_meta)?: { [key: string]: unknown };
}
Text provided to or from an LLM.
type: “text”[](#textcontent-type)
text: string[](#textcontent-text)
The text content of the message.
annotations?: Annotations[](#textcontent-annotations)
Optional annotations for the client.
\_meta?: { [key: string]: unknown }[](#textcontent-_meta)
See [General fields: `\_meta`](/specification/2025-06-18/basic/index#meta) for notes on `\_meta` usage.
###
[​
](#textresourcecontents)
`TextResourceContents`
interface TextResourceContents {
 [uri](#textresourcecontents-uri): string;
 [mimeType](#textresourcecontents-mimetype)?: string;
 [\_meta](#textresourcecontents-_meta)?: { [key: string]: unknown };
 [text](#textresourcecontents-text): string;
}
uri: string[](#textresourcecontents-uri)
The URI of this resource.
Inherited from ResourceContents.uri
mimeType?: string[](#textresourcecontents-mimetype)
The MIME type of this resource, if known.
Inherited from ResourceContents.mimeType
\_meta?: { [key: string]: unknown }[](#textresourcecontents-_meta)
See [General fields: `\_meta`](/specification/2025-06-18/basic/index#meta) for notes on `\_meta` usage.
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
 [method](#completerequest-method): “completion/complete”;
 [params](#completerequest-params): {
 ref: [PromptReference](#promptreference) | [ResourceTemplateReference](#resourcetemplatereference);
 argument: { name: string; value: string };
 context?: { arguments?: { [key: string]: string } };
 };
}
A request from the client to the server, to ask for completion options.
method: “completion/complete”[](#completerequest-method)
Overrides Request.method
params: { ref: PromptReference | ResourceTemplateReference; argument: { name: string; value: string }; context?: { arguments?: { [key: string]: string } }; }[](#completerequest-params)
Type Declaration
*
ref: [PromptReference](#promptreference) | [ResourceTemplateReference](#resourcetemplatereference)
*
argument: { name: string; value: string }
The argument’s information
*
name: string
The name of the argument
*
value: string
The value of the argument to use for completion matching.
*
`Optional`context?: { arguments?: { [key: string]: string } }
Additional, optional context for completions
*
`Optional`arguments?: { [key: string]: string }
Previously-resolved variables in a URI template or prompt.
Overrides Request.params
###
[​
](#completeresult)
`CompleteResult`
interface CompleteResult {
 [\_meta](#completeresult-_meta)?: { [key: string]: unknown };
 [completion](#completeresult-completion): { values: string[]; total?: number; hasMore?: boolean };
 [key: string]: unknown;
}
The server’s response to a completion/complete request
\_meta?: { [key: string]: unknown }[](#completeresult-_meta)
See [General fields: `\_meta`](/specification/2025-06-18/basic/index#meta) for notes on `\_meta` usage.
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
If not provided, the name should be used for display (except for Tool,
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
 [method](#elicitrequest-method): “elicitation/create”;
 [params](#elicitrequest-params): {
 message: string;
 requestedSchema: {
 type: “object”;
 properties: { [key: string]: [PrimitiveSchemaDefinition](#primitiveschemadefinition) };
 required?: string[];
 };
 };
}
A request from the server to elicit additional information from the user via the client.
method: “elicitation/create”[](#elicitrequest-method)
Overrides Request.method
params: { message: string; requestedSchema: { type: “object”; properties: { [key: string]: PrimitiveSchemaDefinition }; required?: string[]; }; }[](#elicitrequest-params)
Type Declaration
*
message: string
The message to present to the user.
*
requestedSchema: {
 type: “object”;
 properties: { [key: string]: [PrimitiveSchemaDefinition](#primitiveschemadefinition) };
 required?: string[];
}
A restricted subset of JSON Schema.
Only top-level properties are allowed, without nesting.
Overrides Request.params
###
[​
](#elicitresult)
`ElicitResult`
interface ElicitResult {
 [\_meta](#elicitresult-_meta)?: { [key: string]: unknown };
 [action](#elicitresult-action): “accept” | “decline” | “cancel”;
 [content](#elicitresult-content)?: { [key: string]: string | number | boolean };
 [key: string]: unknown;
}
The client’s response to an elicitation request.
\_meta?: { [key: string]: unknown }[](#elicitresult-_meta)
See [General fields: `\_meta`](/specification/2025-06-18/basic/index#meta) for notes on `\_meta` usage.
Inherited from [Result](#result).[\_meta](#result-_meta)
action: “accept” | “decline” | “cancel”[](#elicitresult-action)
The user action in response to the elicitation.
* “accept”: User submitted the form/confirmed the action
* “decline”: User explicitly declined the action
* “cancel”: User dismissed without making an explicit choice
content?: { [key: string]: string | number | boolean }[](#elicitresult-content)
The submitted form data, only present when action is “accept”.
Contains values matching the requested schema.
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
type: “boolean”[](#booleanschema-type)
title?: string[](#booleanschema-title)
description?: string[](#booleanschema-description)
default?: boolean[](#booleanschema-default)
###
[​
](#enumschema)
`EnumSchema`
interface EnumSchema {
 [type](#enumschema-type): “string”;
 [title](#enumschema-title)?: string;
 [description](#enumschema-description)?: string;
 [enum](#enumschema-enum): string[];
 [enumNames](#enumschema-enumnames)?: string[];
}
type: “string”[](#enumschema-type)
title?: string[](#enumschema-title)
description?: string[](#enumschema-description)
enum: string[][](#enumschema-enum)
enumNames?: string[][](#enumschema-enumnames)
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
}
type: “number” | “integer”[](#numberschema-type)
title?: string[](#numberschema-title)
description?: string[](#numberschema-description)
minimum?: number[](#numberschema-minimum)
maximum?: number[](#numberschema-maximum)
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
](#stringschema)
`StringSchema`
interface StringSchema {
 [type](#stringschema-type): “string”;
 [title](#stringschema-title)?: string;
 [description](#stringschema-description)?: string;
 [minLength](#stringschema-minlength)?: number;
 [maxLength](#stringschema-maxlength)?: number;
 [format](#stringschema-format)?: “uri” | “email” | “date” | “date-time”;
}
type: “string”[](#stringschema-type)
title?: string[](#stringschema-title)
description?: string[](#stringschema-description)
minLength?: number[](#stringschema-minlength)
maxLength?: number[](#stringschema-maxlength)
format?: “uri” | “email” | “date” | “date-time”[](#stringschema-format)
##
[​
](#initialize)
`initialize`
###
[​
](#initializerequest)
`InitializeRequest`
interface InitializeRequest {
 [method](#initializerequest-method): “initialize”;
 [params](#initializerequest-params): {
 protocolVersion: string;
 capabilities: [ClientCapabilities](#clientcapabilities);
 clientInfo: [Implementation](#implementation);
 };
}
This request is sent from the client to the server when it first connects, asking it to begin initialization.
method: “initialize”[](#initializerequest-method)
Overrides Request.method
params: { protocolVersion: string; capabilities: ClientCapabilities; clientInfo: Implementation; }[](#initializerequest-params)
Type Declaration
*
protocolVersion: string
The latest version of the Model Context Protocol that the client supports. The client MAY decide to support older versions as well.
*
capabilities: [ClientCapabilities](#clientcapabilities)
*
clientInfo: [Implementation](#implementation)
Overrides Request.params
###
[​
](#initializeresult)
`InitializeResult`
interface InitializeResult {
 [\_meta](#initializeresult-_meta)?: { [key: string]: unknown };
 [protocolVersion](#initializeresult-protocolversion): string;
 [capabilities](#initializeresult-capabilities): [ServerCapabilities](#servercapabilities);
 [serverInfo](#initializeresult-serverinfo): [Implementation](#implementation);
 [instructions](#initializeresult-instructions)?: string;
 [key: string]: unknown;
}
After receiving an initialize request from the client, the server sends this response.
\_meta?: { [key: string]: unknown }[](#initializeresult-_meta)
See [General fields: `\_meta`](/specification/2025-06-18/basic/index#meta) for notes on `\_meta` usage.
Inherited from [Result](#result).[\_meta](#result-_meta)
protocolVersion: string[](#initializeresult-protocolversion)
The version of the Model Context Protocol that the server wants to use. This may not match the version that the client requested. If the client cannot support this version, it MUST disconnect.
capabilities: ServerCapabilities[](#initializeresult-capabilities)
serverInfo: Implementation[](#initializeresult-serverinfo)
instructions?: string[](#initializeresult-instructions)
Instructions describing how to use the server and its features.
This can be used by clients to improve the LLM’s understanding of available tools, resources, etc. It can be thought of like a “hint” to the model. For example, this information MAY be added to the system prompt.
###
[​
](#clientcapabilities)
`ClientCapabilities`
interface ClientCapabilities {
 [experimental](#clientcapabilities-experimental)?: { [key: string]: object };
 [roots](#clientcapabilities-roots)?: { listChanged?: boolean };
 [sampling](#clientcapabilities-sampling)?: object;
 [elicitation](#clientcapabilities-elicitation)?: object;
}
Capabilities a client may support. Known capabilities are defined here, in this schema, but this is not a closed set: any client can define its own, additional capabilities.
experimental?: { [key: string]: object }[](#clientcapabilities-experimental)
Experimental, non-standard capabilities that the client supports.
roots?: { listChanged?: boolean }[](#clientcapabilities-roots)
Present if the client supports listing roots.
Type Declaration
*
`Optional`listChanged?: boolean
Whether the client supports notifications for changes to the roots list.
sampling?: object[](#clientcapabilities-sampling)
Present if the client supports sampling from an LLM.
elicitation?: object[](#clientcapabilities-elicitation)
Present if the client supports elicitation from the server.
###
[​
](#implementation)
`Implementation`
interface Implementation {
 [name](#implementation-name): string;
 [title](#implementation-title)?: string;
 [version](#implementation-version): string;
}
Describes the name and version of an MCP implementation, with an optional title for UI representation.
name: string[](#implementation-name)
Intended for programmatic or logical use, but used as a display name in past specs or fallback (if title isn’t present).
Inherited from BaseMetadata.name
title?: string[](#implementation-title)
Intended for UI and end-user contexts — optimized to be human-readable and easily understood,
even by those unfamiliar with domain-specific terminology.
If not provided, the name should be used for display (except for Tool,
where `annotations.title` should be given precedence over using `name`,
if present).
Inherited from BaseMetadata.title
version: string[](#implementation-version)
###
[​
](#servercapabilities)
`ServerCapabilities`
interface ServerCapabilities {
 [experimental](#servercapabilities-experimental)?: { [key: string]: object };
 [logging](#servercapabilities-logging)?: object;
 [completions](#servercapabilities-completions)?: object;
 [prompts](#servercapabilities-prompts)?: { listChanged?: boolean };
 [resources](#servercapabilities-resources)?: { subscribe?: boolean; listChanged?: boolean };
 [tools](#servercapabilities-tools)?: { listChanged?: boolean };
}
Capabilities that a server may support. Known capabilities are defined here, in this schema, but this is not a closed set: any server can define its own, additional capabilities.
experimental?: { [key: string]: object }[](#servercapabilities-experimental)
Experimental, non-standard capabilities that the server supports.
logging?: object[](#servercapabilities-logging)
Present if the server supports sending log messages to the client.
completions?: object[](#servercapabilities-completions)
Present if the server supports argument autocompletion suggestions.
prompts?: { listChanged?: boolean }[](#servercapabilities-prompts)
Present if the server offers any prompt templates.
Type Declaration
*
`Optional`listChanged?: boolean
Whether this server supports notifications for changes to the prompt list.
resources?: { subscribe?: boolean; listChanged?: boolean }[](#servercapabilities-resources)
Present if the server offers any resources to read.
Type Declaration
*
`Optional`subscribe?: boolean
Whether this server supports subscribing to resource updates.
*
`Optional`listChanged?: boolean
Whether this server supports notifications for changes to the resource list.
tools?: { listChanged?: boolean }[](#servercapabilities-tools)
Present if the server offers any tools to call.
Type Declaration
*
`Optional`listChanged?: boolean
Whether this server supports notifications for changes to the tool list.
##
[​
](#logging/setlevel)
`logging/setLevel`
###
[​
](#setlevelrequest)
`SetLevelRequest`
interface SetLevelRequest {
 [method](#setlevelrequest-method): “logging/setLevel”;
 [params](#setlevelrequest-params): { level: [LoggingLevel](#logginglevel) };
}
A request from the client to the server, to enable or adjust logging.
method: “logging/setLevel”[](#setlevelrequest-method)
Overrides Request.method
params: { level: LoggingLevel }[](#setlevelrequest-params)
Type Declaration
*
level: [LoggingLevel](#logginglevel)
The level of logging that the client wants to receive from the server. The server should send all logs at this level and higher (i.e., more severe) to the client as notifications/message.
Overrides Request.params
##
[​
](#notifications/cancelled)
`notifications/cancelled`
###
[​
](#cancellednotification)
`CancelledNotification`
interface CancelledNotification {
 [method](#cancellednotification-method): “notifications/cancelled”;
 [params](#cancellednotification-params): { requestId: [RequestId](#requestid); reason?: string };
}
This notification can be sent by either side to indicate that it is cancelling a previously-issued request.
The request SHOULD still be in-flight, but due to communication latency, it is always possible that this notification MAY arrive after the request has already finished.
This notification indicates that the result will be unused, so any associated processing SHOULD cease.
A client MUST NOT attempt to cancel its `initialize` request.
method: “notifications/cancelled”[](#cancellednotification-method)
Overrides Notification.method
params: { requestId: RequestId; reason?: string }[](#cancellednotification-params)
Type Declaration
*
requestId: [RequestId](#requestid)
The ID of the request to cancel.
This MUST correspond to the ID of a request previously issued in the same direction.
*
`Optional`reason?: string
An optional string describing the reason for the cancellation. This MAY be logged or presented to the user.
Overrides Notification.params
##
[​
](#notifications/initialized)
`notifications/initialized`
###
[​
](#initializednotification)
`InitializedNotification`
interface InitializedNotification {
 [params](#initializednotification-params)?: { \_meta?: { [key: string]: unknown }; [key: string]: unknown };
 [method](#initializednotification-method): “notifications/initialized”;
}
This notification is sent from the client to the server after initialization has finished.
params?: { \_meta?: { [key: string]: unknown }; [key: string]: unknown }[](#initializednotification-params)
Type Declaration
*
[key: string]: unknown
*
`Optional`\_meta?: { [key: string]: unknown }
See [General fields: `\_meta`](/specification/2025-06-18/basic/index#meta) for notes on `\_meta` usage.
Inherited from Notification.params
method: “notifications/initialized”[](#initializednotification-method)
Overrides Notification.method
##
[​
](#notifications/message)
`notifications/message`
###
[​
](#loggingmessagenotification)
`LoggingMessageNotification`
interface LoggingMessageNotification {
 [method](#loggingmessagenotification-method): “notifications/message”;
 [params](#loggingmessagenotification-params): { level: [LoggingLevel](#logginglevel); logger?: string; data: unknown };
}
Notification of a log message passed from server to client. If no logging/setLevel request has been sent from the client, the server MAY decide which messages to send automatically.
method: “notifications/message”[](#loggingmessagenotification-method)
Overrides Notification.method
params: { level: LoggingLevel; logger?: string; data: unknown }[](#loggingmessagenotification-params)
Type Declaration
*
level: [LoggingLevel](#logginglevel)
The severity of this log message.
*
`Optional`logger?: string
An optional name of the logger issuing this message.
*
data: unknown
The data to be logged, such as a string message or an object. Any JSON serializable type is allowed here.
Overrides Notification.params
##
[​
](#notifications/progress)
`notifications/progress`
###
[​
](#progressnotification)
`ProgressNotification`
interface ProgressNotification {
 [method](#progressnotification-method): “notifications/progress”;
 [params](#progressnotification-params): {
 progressToken: [ProgressToken](#progresstoken);
 progress: number;
 total?: number;
 message?: string;
 };
}
An out-of-band notification used to inform the receiver of a progress update for a long-running request.
method: “notifications/progress”[](#progressnotification-method)
Overrides Notification.method
params: { progressToken: ProgressToken; progress: number; total?: number; message?: string; }[](#progressnotification-params)
Type Declaration
*
progressToken: [ProgressToken](#progresstoken)
The progress token which was given in the initial request, used to associate this notification with the request that is proceeding.
*
progress: number
The progress thus far. This should increase every time progress is made, even if the total is unknown.
*
`Optional`total?: number
Total number of items to process (or total progress required), if known.
*
`Optional`message?: string
An optional message describing the current progress.
Overrides Notification.params
##
[​
](#notifications/prompts/list_changed)
`notifications/prompts/list\_changed`
###
[​
](#promptlistchangednotification)
`PromptListChangedNotification`
interface PromptListChangedNotification {
 [params](#promptlistchangednotification-params)?: { \_meta?: { [key: string]: unknown }; [key: string]: unknown };
 [method](#promptlistchangednotification-method): “notifications/prompts/list\_changed”;
}
An optional notification from the server to the client, informing it that the list of prompts it offers has changed. This may be issued by servers without any previous subscription from the client.
params?: { \_meta?: { [key: string]: unknown }; [key: string]: unknown }[](#promptlistchangednotification-params)
Type Declaration
*
[key: string]: unknown
*
`Optional`\_meta?: { [key: string]: unknown }
See [General fields: `\_meta`](/specification/2025-06-18/basic/index#meta) for notes on `\_meta` usage.
Inherited from Notification.params
method: “notifications/prompts/list\_changed”[](#promptlistchangednotification-method)
Overrides Notification.method
##
[​
](#notifications/resources/list_changed)
`notifications/resources/list\_changed`
###
[​
](#resourcelistchangednotification)
`ResourceListChangedNotification`
interface ResourceListChangedNotification {
 [params](#resourcelistchangednotification-params)?: { \_meta?: { [key: string]: unknown }; [key: string]: unknown };
 [method](#resourcelistchangednotification-method): “notifications/resources/list\_changed”;
}
An optional notification from the server to the client, informing it that the list of resources it can read from has changed. This may be issued by servers without any previous subscription from the client.
params?: { \_meta?: { [key: string]: unknown }; [key: string]: unknown }[](#resourcelistchangednotification-params)
Type Declaration
*
[key: string]: unknown
*
`Optional`\_meta?: { [key: string]: unknown }
See [General fields: `\_meta`](/specification/2025-06-18/basic/index#meta) for notes on `\_meta` usage.
Inherited from Notification.params
method: “notifications/resources/list\_changed”[](#resourcelistchangednotification-method)
Overrides Notification.method
##
[​
](#notifications/resources/updated)
`notifications/resources/updated`
###
[​
](#resourceupdatednotification)
`ResourceUpdatedNotification`
interface ResourceUpdatedNotification {
 [method](#resourceupdatednotification-method): “notifications/resources/updated”;
 [params](#resourceupdatednotification-params): { uri: string };
}
A notification from the server to the client, informing it that a resource has changed and may need to be read again. This should only be sent if the client previously sent a resources/subscribe request.
method: “notifications/resources/updated”[](#resourceupdatednotification-method)
Overrides Notification.method
params: { uri: string }[](#resourceupdatednotification-params)
Type Declaration
*
uri: string
The URI of the resource that has been updated. This might be a sub-resource of the one that the client actually subscribed to.
Overrides Notification.params
##
[​
](#notifications/roots/list_changed)
`notifications/roots/list\_changed`
###
[​
](#rootslistchangednotification)
`RootsListChangedNotification`
interface RootsListChangedNotification {
 [params](#rootslistchangednotification-params)?: { \_meta?: { [key: string]: unknown }; [key: string]: unknown };
 [method](#rootslistchangednotification-method): “notifications/roots/list\_changed”;
}
A notification from the client to the server, informing it that the list of roots has changed.
This notification should be sent whenever the client adds, removes, or modifies any root.
The server should then request an updated list of roots using the ListRootsRequest.
params?: { \_meta?: { [key: string]: unknown }; [key: string]: unknown }[](#rootslistchangednotification-params)
Type Declaration
*
[key: string]: unknown
*
`Optional`\_meta?: { [key: string]: unknown }
See [General fields: `\_meta`](/specification/2025-06-18/basic/index#meta) for notes on `\_meta` usage.
Inherited from Notification.params
method: “notifications/roots/list\_changed”[](#rootslistchangednotification-method)
Overrides Notification.method
##
[​
](#notifications/tools/list_changed)
`notifications/tools/list\_changed`
###
[​
](#toollistchangednotification)
`ToolListChangedNotification`
interface ToolListChangedNotification {
 [params](#toollistchangednotification-params)?: { \_meta?: { [key: string]: unknown }; [key: string]: unknown };
 [method](#toollistchangednotification-method): “notifications/tools/list\_changed”;
}
An optional notification from the server to the client, informing it that the list of tools it offers has changed. This may be issued by servers without any previous subscription from the client.
params?: { \_meta?: { [key: string]: unknown }; [key: string]: unknown }[](#toollistchangednotification-params)
Type Declaration
*
[key: string]: unknown
*
`Optional`\_meta?: { [key: string]: unknown }
See [General fields: `\_meta`](/specification/2025-06-18/basic/index#meta) for notes on `\_meta` usage.
Inherited from Notification.params
method: “notifications/tools/list\_changed”[](#toollistchangednotification-method)
Overrides Notification.method
##
[​
](#ping)
`ping`
###
[​
](#pingrequest)
`PingRequest`
interface PingRequest {
 [params](#pingrequest-params)?: {
 \_meta?: { progressToken?: [ProgressToken](#progresstoken); [key: string]: unknown };
 [key: string]: unknown;
 };
 [method](#pingrequest-method): “ping”;
}
A ping, issued by either the server or the client, to check that the other party is still alive. The receiver must promptly respond, or else may be disconnected.
params?: { \_meta?: { progressToken?: ProgressToken; [key: string]: unknown }; [key: string]: unknown; }[](#pingrequest-params)
Type Declaration
*
[key: string]: unknown
*
`Optional`\_meta?: { progressToken?: [ProgressToken](#progresstoken); [key: string]: unknown }
See [General fields: `\_meta`](/specification/2025-06-18/basic/index#meta) for notes on `\_meta` usage.
*
`Optional`progressToken?: [ProgressToken](#progresstoken)
If specified, the caller is requesting out-of-band progress notifications for this request (as represented by notifications/progress). The value of this parameter is an opaque token that will be attached to any subsequent notifications. The receiver is not obligated to provide these notifications.
Inherited from Request.params
method: “ping”[](#pingrequest-method)
Overrides Request.method
##
[​
](#prompts/get)
`prompts/get`
###
[​
](#getpromptrequest)
`GetPromptRequest`
interface GetPromptRequest {
 [method](#getpromptrequest-method): “prompts/get”;
 [params](#getpromptrequest-params): { name: string; arguments?: { [key: string]: string } };
}
Used by the client to get a prompt provided by the server.
method: “prompts/get”[](#getpromptrequest-method)
Overrides Request.method
params: { name: string; arguments?: { [key: string]: string } }[](#getpromptrequest-params)
Type Declaration
*
name: string
The name of the prompt or prompt template.
*
`Optional`arguments?: { [key: string]: string }
Arguments to use for templating the prompt.
Overrides Request.params
###
[​
](#getpromptresult)
`GetPromptResult`
interface GetPromptResult {
 [\_meta](#getpromptresult-_meta)?: { [key: string]: unknown };
 [description](#getpromptresult-description)?: string;
 [messages](#getpromptresult-messages): [PromptMessage](#promptmessage)[];
 [key: string]: unknown;
}
The server’s response to a prompts/get request from the client.
\_meta?: { [key: string]: unknown }[](#getpromptresult-_meta)
See [General fields: `\_meta`](/specification/2025-06-18/basic/index#meta) for notes on `\_meta` usage.
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
This is similar to `SamplingMessage`, but also supports the embedding of
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
 [params](#listpromptsrequest-params)?: { cursor?: string };
 [method](#listpromptsrequest-method): “prompts/list”;
}
Sent from the client to request a list of prompts and prompt templates the server has.
params?: { cursor?: string }[](#listpromptsrequest-params)
Type Declaration
*
`Optional`cursor?: string
An opaque token representing the current pagination position.
If provided, the server should return results starting after this cursor.
Inherited from PaginatedRequest.params
method: “prompts/list”[](#listpromptsrequest-method)
Overrides PaginatedRequest.method
###
[​
](#listpromptsresult)
`ListPromptsResult`
interface ListPromptsResult {
 [\_meta](#listpromptsresult-_meta)?: { [key: string]: unknown };
 [nextCursor](#listpromptsresult-nextcursor)?: string;
 [prompts](#listpromptsresult-prompts): [Prompt](#prompt)[];
 [key: string]: unknown;
}
The server’s response to a prompts/list request from the client.
\_meta?: { [key: string]: unknown }[](#listpromptsresult-_meta)
See [General fields: `\_meta`](/specification/2025-06-18/basic/index#meta) for notes on `\_meta` usage.
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
 [name](#prompt-name): string;
 [title](#prompt-title)?: string;
 [description](#prompt-description)?: string;
 [arguments](#prompt-arguments)?: [PromptArgument](#promptargument)[];
 [\_meta](#prompt-_meta)?: { [key: string]: unknown };
}
A prompt or prompt template that the server offers.
name: string[](#prompt-name)
Intended for programmatic or logical use, but used as a display name in past specs or fallback (if title isn’t present).
Inherited from BaseMetadata.name
title?: string[](#prompt-title)
Intended for UI and end-user contexts — optimized to be human-readable and easily understood,
even by those unfamiliar with domain-specific terminology.
If not provided, the name should be used for display (except for Tool,
where `annotations.title` should be given precedence over using `name`,
if present).
Inherited from BaseMetadata.title
description?: string[](#prompt-description)
An optional description of what this prompt provides
arguments?: PromptArgument[][](#prompt-arguments)
A list of arguments to use for templating the prompt.
\_meta?: { [key: string]: unknown }[](#prompt-_meta)
See [General fields: `\_meta`](/specification/2025-06-18/basic/index#meta) for notes on `\_meta` usage.
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
If not provided, the name should be used for display (except for Tool,
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
 [params](#listresourcesrequest-params)?: { cursor?: string };
 [method](#listresourcesrequest-method): “resources/list”;
}
Sent from the client to request a list of resources the server has.
params?: { cursor?: string }[](#listresourcesrequest-params)
Type Declaration
*
`Optional`cursor?: string
An opaque token representing the current pagination position.
If provided, the server should return results starting after this cursor.
Inherited from PaginatedRequest.params
method: “resources/list”[](#listresourcesrequest-method)
Overrides PaginatedRequest.method
###
[​
](#listresourcesresult)
`ListResourcesResult`
interface ListResourcesResult {
 [\_meta](#listresourcesresult-_meta)?: { [key: string]: unknown };
 [nextCursor](#listresourcesresult-nextcursor)?: string;
 [resources](#listresourcesresult-resources): [Resource](#resource)[];
 [key: string]: unknown;
}
The server’s response to a resources/list request from the client.
\_meta?: { [key: string]: unknown }[](#listresourcesresult-_meta)
See [General fields: `\_meta`](/specification/2025-06-18/basic/index#meta) for notes on `\_meta` usage.
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
 [name](#resource-name): string;
 [title](#resource-title)?: string;
 [uri](#resource-uri): string;
 [description](#resource-description)?: string;
 [mimeType](#resource-mimetype)?: string;
 [annotations](#resource-annotations)?: [Annotations](#annotations);
 [size](#resource-size)?: number;
 [\_meta](#resource-_meta)?: { [key: string]: unknown };
}
A known resource that the server is capable of reading.
name: string[](#resource-name)
Intended for programmatic or logical use, but used as a display name in past specs or fallback (if title isn’t present).
Inherited from BaseMetadata.name
title?: string[](#resource-title)
Intended for UI and end-user contexts — optimized to be human-readable and easily understood,
even by those unfamiliar with domain-specific terminology.
If not provided, the name should be used for display (except for Tool,
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
\_meta?: { [key: string]: unknown }[](#resource-_meta)
See [General fields: `\_meta`](/specification/2025-06-18/basic/index#meta) for notes on `\_meta` usage.
##
[​
](#resources/read)
`resources/read`
###
[​
](#readresourcerequest)
`ReadResourceRequest`
interface ReadResourceRequest {
 [method](#readresourcerequest-method): “resources/read”;
 [params](#readresourcerequest-params): { uri: string };
}
Sent from the client to the server, to read a specific resource URI.
method: “resources/read”[](#readresourcerequest-method)
Overrides Request.method
params: { uri: string }[](#readresourcerequest-params)
Type Declaration
*
uri: string
The URI of the resource to read. The URI can use any protocol; it is up to the server how to interpret it.
Overrides Request.params
###
[​
](#readresourceresult)
`ReadResourceResult`
interface ReadResourceResult {
 [\_meta](#readresourceresult-_meta)?: { [key: string]: unknown };
 [contents](#readresourceresult-contents): ([TextResourceContents](#textresourcecontents) | [BlobResourceContents](#blobresourcecontents))[];
 [key: string]: unknown;
}
The server’s response to a resources/read request from the client.
\_meta?: { [key: string]: unknown }[](#readresourceresult-_meta)
See [General fields: `\_meta`](/specification/2025-06-18/basic/index#meta) for notes on `\_meta` usage.
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
 [method](#subscriberequest-method): “resources/subscribe”;
 [params](#subscriberequest-params): { uri: string };
}
Sent from the client to request resources/updated notifications from the server whenever a particular resource changes.
method: “resources/subscribe”[](#subscriberequest-method)
Overrides Request.method
params: { uri: string }[](#subscriberequest-params)
Type Declaration
*
uri: string
The URI of the resource to subscribe to. The URI can use any protocol; it is up to the server how to interpret it.
Overrides Request.params
##
[​
](#resources/templates/list)
`resources/templates/list`
###
[​
](#listresourcetemplatesrequest)
`ListResourceTemplatesRequest`
interface ListResourceTemplatesRequest {
 [params](#listresourcetemplatesrequest-params)?: { cursor?: string };
 [method](#listresourcetemplatesrequest-method): “resources/templates/list”;
}
Sent from the client to request a list of resource templates the server has.
params?: { cursor?: string }[](#listresourcetemplatesrequest-params)
Type Declaration
*
`Optional`cursor?: string
An opaque token representing the current pagination position.
If provided, the server should return results starting after this cursor.
Inherited from PaginatedRequest.params
method: “resources/templates/list”[](#listresourcetemplatesrequest-method)
Overrides PaginatedRequest.method
###
[​
](#listresourcetemplatesresult)
`ListResourceTemplatesResult`
interface ListResourceTemplatesResult {
 [\_meta](#listresourcetemplatesresult-_meta)?: { [key: string]: unknown };
 [nextCursor](#listresourcetemplatesresult-nextcursor)?: string;
 [resourceTemplates](#listresourcetemplatesresult-resourcetemplates): [ResourceTemplate](#resourcetemplate)[];
 [key: string]: unknown;
}
The server’s response to a resources/templates/list request from the client.
\_meta?: { [key: string]: unknown }[](#listresourcetemplatesresult-_meta)
See [General fields: `\_meta`](/specification/2025-06-18/basic/index#meta) for notes on `\_meta` usage.
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
 [name](#resourcetemplate-name): string;
 [title](#resourcetemplate-title)?: string;
 [uriTemplate](#resourcetemplate-uritemplate): string;
 [description](#resourcetemplate-description)?: string;
 [mimeType](#resourcetemplate-mimetype)?: string;
 [annotations](#resourcetemplate-annotations)?: [Annotations](#annotations);
 [\_meta](#resourcetemplate-_meta)?: { [key: string]: unknown };
}
A template description for resources available on the server.
name: string[](#resourcetemplate-name)
Intended for programmatic or logical use, but used as a display name in past specs or fallback (if title isn’t present).
Inherited from BaseMetadata.name
title?: string[](#resourcetemplate-title)
Intended for UI and end-user contexts — optimized to be human-readable and easily understood,
even by those unfamiliar with domain-specific terminology.
If not provided, the name should be used for display (except for Tool,
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
\_meta?: { [key: string]: unknown }[](#resourcetemplate-_meta)
See [General fields: `\_meta`](/specification/2025-06-18/basic/index#meta) for notes on `\_meta` usage.
##
[​
](#resources/unsubscribe)
`resources/unsubscribe`
###
[​
](#unsubscriberequest)
`UnsubscribeRequest`
interface UnsubscribeRequest {
 [method](#unsubscriberequest-method): “resources/unsubscribe”;
 [params](#unsubscriberequest-params): { uri: string };
}
Sent from the client to request cancellation of resources/updated notifications from the server. This should follow a previous resources/subscribe request.
method: “resources/unsubscribe”[](#unsubscriberequest-method)
Overrides Request.method
params: { uri: string }[](#unsubscriberequest-params)
Type Declaration
*
uri: string
The URI of the resource to unsubscribe from.
Overrides Request.params
##
[​
](#roots/list)
`roots/list`
###
[​
](#listrootsrequest)
`ListRootsRequest`
interface ListRootsRequest {
 [params](#listrootsrequest-params)?: {
 \_meta?: { progressToken?: [ProgressToken](#progresstoken); [key: string]: unknown };
 [key: string]: unknown;
 };
 [method](#listrootsrequest-method): “roots/list”;
}
Sent from the server to request a list of root URIs from the client. Roots allow
servers to ask for specific directories or files to operate on. A common example
for roots is providing a set of repositories or directories a server should operate
on.
This request is typically used when the server needs to understand the file system
structure or access specific locations that the client has permission to read from.
params?: { \_meta?: { progressToken?: ProgressToken; [key: string]: unknown }; [key: string]: unknown; }[](#listrootsrequest-params)
Type Declaration
*
[key: string]: unknown
*
`Optional`\_meta?: { progressToken?: [ProgressToken](#progresstoken); [key: string]: unknown }
See [General fields: `\_meta`](/specification/2025-06-18/basic/index#meta) for notes on `\_meta` usage.
*
`Optional`progressToken?: [ProgressToken](#progresstoken)
If specified, the caller is requesting out-of-band progress notifications for this request (as represented by notifications/progress). The value of this parameter is an opaque token that will be attached to any subsequent notifications. The receiver is not obligated to provide these notifications.
Inherited from Request.params
method: “roots/list”[](#listrootsrequest-method)
Overrides Request.method
###
[​
](#listrootsresult)
`ListRootsResult`
interface ListRootsResult {
 [\_meta](#listrootsresult-_meta)?: { [key: string]: unknown };
 [roots](#listrootsresult-roots): [Root](#root)[];
 [key: string]: unknown;
}
The client’s response to a roots/list request from the server.
This result contains an array of Root objects, each representing a root directory
or file that the server can operate on.
\_meta?: { [key: string]: unknown }[](#listrootsresult-_meta)
See [General fields: `\_meta`](/specification/2025-06-18/basic/index#meta) for notes on `\_meta` usage.
Inherited from [Result](#result).[\_meta](#result-_meta)
roots: Root[][](#listrootsresult-roots)
###
[​
](#root)
`Root`
interface Root {
 [uri](#root-uri): string;
 [name](#root-name)?: string;
 [\_meta](#root-_meta)?: { [key: string]: unknown };
}
Represents a root directory or file that the server can operate on.
uri: string[](#root-uri)
The URI identifying the root. This *must* start with file:// for now.
This restriction may be relaxed in future versions of the protocol to allow
other URI schemes.
name?: string[](#root-name)
An optional name for the root. This can be used to provide a human-readable
identifier for the root, which may be useful for display purposes or for
referencing the root in other parts of the application.
\_meta?: { [key: string]: unknown }[](#root-_meta)
See [General fields: `\_meta`](/specification/2025-06-18/basic/index#meta) for notes on `\_meta` usage.
##
[​
](#sampling/createmessage)
`sampling/createMessage`
###
[​
](#createmessagerequest)
`CreateMessageRequest`
interface CreateMessageRequest {
 [method](#createmessagerequest-method): “sampling/createMessage”;
 [params](#createmessagerequest-params): {
 messages: [SamplingMessage](#samplingmessage)[];
 modelPreferences?: [ModelPreferences](#modelpreferences);
 systemPrompt?: string;
 includeContext?: “none” | “thisServer” | “allServers”;
 temperature?: number;
 maxTokens: number;
 stopSequences?: string[];
 metadata?: object;
 };
}
A request from the server to sample an LLM via the client. The client has full discretion over which model to select. The client should also inform the user before beginning sampling, to allow them to inspect the request (human in the loop) and decide whether to approve it.
method: “sampling/createMessage”[](#createmessagerequest-method)
Overrides Request.method
params: { messages: SamplingMessage[]; modelPreferences?: ModelPreferences; systemPrompt?: string; includeContext?: “none” | “thisServer” | “allServers”; temperature?: number; maxTokens: number; stopSequences?: string[]; metadata?: object; }[](#createmessagerequest-params)
Type Declaration
*
messages: [SamplingMessage](#samplingmessage)[]
*
`Optional`modelPreferences?: [ModelPreferences](#modelpreferences)
The server’s preferences for which model to select. The client MAY ignore these preferences.
*
`Optional`systemPrompt?: string
An optional system prompt the server wants to use for sampling. The client MAY modify or omit this prompt.
*
`Optional`includeContext?: “none” | “thisServer” | “allServers”
A request to include context from one or more MCP servers (including the caller), to be attached to the prompt. The client MAY ignore this request.
*
`Optional`temperature?: number
*
maxTokens: number
The requested maximum number of tokens to sample (to prevent runaway completions).
The client MAY choose to sample fewer tokens than the requested maximum.
*
`Optional`stopSequences?: string[]
*
`Optional`metadata?: object
Optional metadata to pass through to the LLM provider. The format of this metadata is provider-specific.
Overrides Request.params
###
[​
](#createmessageresult)
`CreateMessageResult`
interface CreateMessageResult {
 [\_meta](#createmessageresult-_meta)?: { [key: string]: unknown };
 [model](#createmessageresult-model): string;
 [stopReason](#createmessageresult-stopreason)?: string;
 [role](#createmessageresult-role): [Role](#role);
 [content](#createmessageresult-content): [TextContent](#textcontent) | [ImageContent](#imagecontent) | [AudioContent](#audiocontent);
 [key: string]: unknown;
}
The client’s response to a sampling/create\_message request from the server. The client should inform the user before returning the sampled message, to allow them to inspect the response (human in the loop) and decide whether to allow the server to see it.
\_meta?: { [key: string]: unknown }[](#createmessageresult-_meta)
See [General fields: `\_meta`](/specification/2025-06-18/basic/index#meta) for notes on `\_meta` usage.
Inherited from [Result](#result).[\_meta](#result-_meta)
model: string[](#createmessageresult-model)
The name of the model that generated the message.
stopReason?: string[](#createmessageresult-stopreason)
The reason why sampling stopped, if known.
role: Role[](#createmessageresult-role)
Inherited from [SamplingMessage](#samplingmessage).[role](#samplingmessage-role)
content: TextContent | ImageContent | AudioContent[](#createmessageresult-content)
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
 [content](#samplingmessage-content): [TextContent](#textcontent) | [ImageContent](#imagecontent) | [AudioContent](#audiocontent);
}
Describes a message issued to or received from an LLM API.
role: Role[](#samplingmessage-role)
content: TextContent | ImageContent | AudioContent[](#samplingmessage-content)
##
[​
](#tools/call)
`tools/call`
###
[​
](#calltoolrequest)
`CallToolRequest`
interface CallToolRequest {
 [method](#calltoolrequest-method): “tools/call”;
 [params](#calltoolrequest-params): { name: string; arguments?: { [key: string]: unknown } };
}
Used by the client to invoke a tool provided by the server.
method: “tools/call”[](#calltoolrequest-method)
Overrides Request.method
params: { name: string; arguments?: { [key: string]: unknown } }[](#calltoolrequest-params)
Overrides Request.params
###
[​
](#calltoolresult)
`CallToolResult`
interface CallToolResult {
 [\_meta](#calltoolresult-_meta)?: { [key: string]: unknown };
 [content](#calltoolresult-content): [ContentBlock](#contentblock)[];
 [structuredContent](#calltoolresult-structuredcontent)?: { [key: string]: unknown };
 [isError](#calltoolresult-iserror)?: boolean;
 [key: string]: unknown;
}
The server’s response to a tool call.
\_meta?: { [key: string]: unknown }[](#calltoolresult-_meta)
See [General fields: `\_meta`](/specification/2025-06-18/basic/index#meta) for notes on `\_meta` usage.
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
 [params](#listtoolsrequest-params)?: { cursor?: string };
 [method](#listtoolsrequest-method): “tools/list”;
}
Sent from the client to request a list of tools the server has.
params?: { cursor?: string }[](#listtoolsrequest-params)
Type Declaration
*
`Optional`cursor?: string
An opaque token representing the current pagination position.
If provided, the server should return results starting after this cursor.
Inherited from PaginatedRequest.params
method: “tools/list”[](#listtoolsrequest-method)
Overrides PaginatedRequest.method
###
[​
](#listtoolsresult)
`ListToolsResult`
interface ListToolsResult {
 [\_meta](#listtoolsresult-_meta)?: { [key: string]: unknown };
 [nextCursor](#listtoolsresult-nextcursor)?: string;
 [tools](#listtoolsresult-tools): [Tool](#tool)[];
 [key: string]: unknown;
}
The server’s response to a tools/list request from the client.
\_meta?: { [key: string]: unknown }[](#listtoolsresult-_meta)
See [General fields: `\_meta`](/specification/2025-06-18/basic/index#meta) for notes on `\_meta` usage.
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
 [name](#tool-name): string;
 [title](#tool-title)?: string;
 [description](#tool-description)?: string;
 [inputSchema](#tool-inputschema): {
 type: “object”;
 properties?: { [key: string]: object };
 required?: string[];
 };
 [outputSchema](#tool-outputschema)?: {
 type: “object”;
 properties?: { [key: string]: object };
 required?: string[];
 };
 [annotations](#tool-annotations)?: [ToolAnnotations](#toolannotations);
 [\_meta](#tool-_meta)?: { [key: string]: unknown };
}
Definition for a tool the client can call.
name: string[](#tool-name)
Intended for programmatic or logical use, but used as a display name in past specs or fallback (if title isn’t present).
Inherited from BaseMetadata.name
title?: string[](#tool-title)
Intended for UI and end-user contexts — optimized to be human-readable and easily understood,
even by those unfamiliar with domain-specific terminology.
If not provided, the name should be used for display (except for Tool,
where `annotations.title` should be given precedence over using `name`,
if present).
Inherited from BaseMetadata.title
description?: string[](#tool-description)
A human-readable description of the tool.
This can be used by clients to improve the LLM’s understanding of available tools. It can be thought of like a “hint” to the model.
inputSchema: { type: “object”; properties?: { [key: string]: object }; required?: string[]; }[](#tool-inputschema)
A JSON Schema object defining the expected parameters for the tool.
outputSchema?: { type: “object”; properties?: { [key: string]: object }; required?: string[]; }[](#tool-outputschema)
An optional JSON Schema object defining the structure of the tool’s output returned in
the structuredContent field of a CallToolResult.
annotations?: ToolAnnotations[](#tool-annotations)
Optional additional tool information.
Display name precedence order is: title, annotations.title, then name.
\_meta?: { [key: string]: unknown }[](#tool-_meta)
See [General fields: `\_meta`](/specification/2025-06-18/basic/index#meta) for notes on `\_meta` usage.
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
Additional properties describing a Tool to clients.
NOTE: all properties in ToolAnnotations are **hints**.
They are not guaranteed to provide a faithful description of
tool behavior (including descriptive properties like `title`).
Clients should never make tool use decisions based on ToolAnnotations
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
will have no additional effect on the its environment.
(This property is meaningful only when `readOnlyHint == false`)
Default: false
openWorldHint?: boolean[](#toolannotations-openworldhint)
If true, this tool may interact with an “open world” of external
entities. If false, the tool’s domain of interaction is closed.
For example, the world of a web search tool is open, whereas that
of a memory tool is not.
Default: true