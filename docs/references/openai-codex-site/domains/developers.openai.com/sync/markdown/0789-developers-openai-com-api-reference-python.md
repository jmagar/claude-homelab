OpenAI Python API library | OpenAI API Reference
[Skip to content](#_top)
# OpenAI Python API library
# OpenAI Python API library
[](https://pypi.org/project/openai/)
The OpenAI Python library provides convenient access to the OpenAI REST API from any Python 3.9+
application. The library includes type definitions for all request params and response fields,
and offers both synchronous and asynchronous clients powered by [httpx](https://github.com/encode/httpx).
It is generated from our [OpenAPI specification](https://github.com/openai/openai-openapi) with [Stainless](https://stainlessapi.com/).
## Documentation
The REST API documentation can be found on [platform.openai.com](https://platform.openai.com/docs/api-reference). The full API of this library can be found in [api.md](https://github.com/openai/openai-python/tree/main/api.md).
## Installation
```
`# install from PyPI
pip install openai`
```
## Usage
The full API of this library can be found in [api.md](https://github.com/openai/openai-python/tree/main/api.md).
The primary API for interacting with OpenAI models is the [Responses API](https://platform.openai.com/docs/api-reference/responses). You can generate text from the model with the code below.
```
`import os
from openai import OpenAI
client = OpenAI(
# This is the default and can be omitted
api\_key=os.environ.get("OPENAI\_API\_KEY"),
)
response = client.responses.create(
model="gpt-5.2",
instructions="You are a coding assistant that talks like a pirate.",
input="How do I check if a Python object is an instance of a class?",
)
print(response.output\_text)`
```
The previous standard (supported indefinitely) for generating text is the [Chat Completions API](https://platform.openai.com/docs/api-reference/chat). You can use that API to generate text from the model with the code below.
```
`from openai import OpenAI
client = OpenAI()
completion = client.chat.completions.create(
model="gpt-5.2",
messages=[
{"role": "developer", "content": "Talk like a pirate."},
{
"role": "user",
"content": "How do I check if a Python object is an instance of a class?",
},
],
)
print(completion.choices[0].message.content)`
```
While you can provide an `api\_key` keyword argument,
we recommend using [python-dotenv](https://pypi.org/project/python-dotenv/)
to add `OPENAI\_API\_KEY="My API Key"` to your `.env` file
so that your API key is not stored in source control.
[Get an API key here](https://platform.openai.com/settings/organization/api-keys).
### Workload Identity Authentication
For secure, automated environments like cloud-managed Kubernetes, Azure, and Google Cloud Platform, you can use workload identity authentication with short-lived tokens from cloud identity providers instead of long-lived API keys.
#### Kubernetes (service account tokens)
```
`from openai import OpenAI
from openai.auth import k8s\_service\_account\_token\_provider
client = OpenAI(
workload\_identity={
"client\_id": "your-client-id",
"identity\_provider\_id": "idp-123",
"service\_account\_id": "sa-456",
"provider": k8s\_service\_account\_token\_provider(
"/var/run/secrets/kubernetes.io/serviceaccount/token"
),
},
organization="org-xyz",
project="proj-abc",
)
response = client.chat.completions.create(
model="gpt-4",
messages=[{"role": "user", "content": "Hello!"}],
)`
```
#### Azure (managed identity)
```
`from openai import OpenAI
from openai.auth import azure\_managed\_identity\_token\_provider
client = OpenAI(
workload\_identity={
"client\_id": "your-client-id",
"identity\_provider\_id": "idp-123",
"service\_account\_id": "sa-456",
"provider": azure\_managed\_identity\_token\_provider(
resource="https://management.azure.com/",
),
},
)`
```
#### Google Cloud Platform (compute engine metadata)
```
`from openai import OpenAI
from openai.auth import gcp\_id\_token\_provider
client = OpenAI(
workload\_identity={
"client\_id": "your-client-id",
"identity\_provider\_id": "idp-123",
"service\_account\_id": "sa-456",
"provider": gcp\_id\_token\_provider(audience="https://api.openai.com/v1"),
},
)`
```
#### Custom subject token provider
```
`from openai import OpenAI
def get\_custom\_token() -\> str:
return "your-jwt-token"
client = OpenAI(
workload\_identity={
"client\_id": "your-client-id",
"identity\_provider\_id": "idp-123",
"service\_account\_id": "sa-456",
"provider": {
"token\_type": "jwt",
"get\_token": get\_custom\_token,
},
}
)`
```
You can also customize the token refresh buffer (default is 1200 seconds (20 minutes) before expiration):
```
`from openai import OpenAI
from openai.auth import k8s\_service\_account\_token\_provider
client = OpenAI(
workload\_identity={
"client\_id": "your-client-id",
"identity\_provider\_id": "idp-123",
"service\_account\_id": "sa-456",
"provider": k8s\_service\_account\_token\_provider("/var/token"),
"refresh\_buffer\_seconds": 120.0,
}
)`
```
### Vision
With an image URL:
```
`prompt = "What is in this image?"
img\_url = "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d5/2023\_06\_08\_Raccoon1.jpg/1599px-2023\_06\_08\_Raccoon1.jpg"
response = client.responses.create(
model="gpt-5.2",
input=[
{
"role": "user",
"content": [
{"type": "input\_text", "text": prompt},
{"type": "input\_image", "image\_url": f"{img\_url}"},
],
}
],
)`
```
With the image as a base64 encoded string:
```
`import base64
from openai import OpenAI
client = OpenAI()
prompt = "What is in this image?"
with open("path/to/image.png", "rb") as image\_file:
b64\_image = base64.b64encode(image\_file.read()).decode("utf-8")
response = client.responses.create(
model="gpt-5.2",
input=[
{
"role": "user",
"content": [
{"type": "input\_text", "text": prompt},
{"type": "input\_image", "image\_url": f"data:image/png;base64,{b64\_image}"},
],
}
],
)`
```
## Async usage
Simply import `AsyncOpenAI` instead of `OpenAI` and use `await` with each API call:
```
`import os
import asyncio
from openai import AsyncOpenAI
client = AsyncOpenAI(
# This is the default and can be omitted
api\_key=os.environ.get("OPENAI\_API\_KEY"),
)
async def main() -\> None:
response = await client.responses.create(
model="gpt-5.2", input="Explain disestablishmentarianism to a smart five year old."
)
print(response.output\_text)
asyncio.run(main())`
```
Functionality between the synchronous and asynchronous clients is otherwise identical.
### With aiohttp
By default, the async client uses `httpx` for HTTP requests. However, for improved concurrency performance you may also use `aiohttp` as the HTTP backend.
You can enable this by installing `aiohttp`:
```
`# install from PyPI
pip install openai[aiohttp]`
```
Then you can enable it by instantiating the client with `http\_client=DefaultAioHttpClient()`:
```
`import os
import asyncio
from openai import DefaultAioHttpClient
from openai import AsyncOpenAI
async def main() -\> None:
async with AsyncOpenAI(
api\_key=os.environ.get("OPENAI\_API\_KEY"), # This is the default and can be omitted
http\_client=DefaultAioHttpClient(),
) as client:
chat\_completion = await client.chat.completions.create(
messages=[
{
"role": "user",
"content": "Say this is a test",
}
],
model="gpt-5.2",
)
asyncio.run(main())`
```
## Streaming responses
We provide support for streaming responses using Server Side Events (SSE).
```
`from openai import OpenAI
client = OpenAI()
stream = client.responses.create(
model="gpt-5.2",
input="Write a one-sentence bedtime story about a unicorn.",
stream=True,
)
for event in stream:
print(event)`
```
The async client uses the exact same interface.
```
`import asyncio
from openai import AsyncOpenAI
client = AsyncOpenAI()
async def main():
stream = await client.responses.create(
model="gpt-5.2",
input="Write a one-sentence bedtime story about a unicorn.",
stream=True,
)
async for event in stream:
print(event)
asyncio.run(main())`
```
## Realtime API
The Realtime API enables you to build low-latency, multi-modal conversational experiences. It currently supports text and audio as both input and output, as well as [function calling](https://platform.openai.com/docs/guides/function-calling) through a WebSocket connection.
Under the hood the SDK uses the [`websockets`](https://websockets.readthedocs.io/en/stable/) library to manage connections.
The Realtime API works through a combination of client-sent events and server-sent events. Clients can send events to do things like update session configuration or send text and audio inputs. Server events confirm when audio responses have completed, or when a text response from the model has been received. A full event reference can be found [here](https://platform.openai.com/docs/api-reference/realtime-client-events) and a guide can be found [here](https://platform.openai.com/docs/guides/realtime).
Basic text based example:
```
`import asyncio
from openai import AsyncOpenAI
async def main():
client = AsyncOpenAI()
async with client.realtime.connect(model="gpt-realtime") as connection:
await connection.session.update(
session={"type": "realtime", "output\_modalities": ["text"]}
)
await connection.conversation.item.create(
item={
"type": "message",
"role": "user",
"content": [{"type": "input\_text", "text": "Say hello!"}],
}
)
await connection.response.create()
async for event in connection:
if event.type == "response.output\_text.delta":
print(event.delta, flush=True, end="")
elif event.type == "response.output\_text.done":
print()
elif event.type == "response.done":
break
asyncio.run(main())`
```
However the real magic of the Realtime API is handling audio inputs / outputs, see this example [TUI script](https://github.com/openai/openai-python/blob/main/examples/realtime/push_to_talk_app.py) for a fully fledged example.
### Realtime error handling
Whenever an error occurs, the Realtime API will send an [`error` event](https://platform.openai.com/docs/guides/realtime-model-capabilities#error-handling) and the connection will stay open and remain usable. This means you need to handle it yourself, as *no errors are raised directly* by the SDK when an `error` event comes in.
```
`client = AsyncOpenAI()
async with client.realtime.connect(model="gpt-realtime") as connection:
...
async for event in connection:
if event.type == 'error':
print(event.error.type)
print(event.error.code)
print(event.error.event\_id)
print(event.error.message)`
```
## Using types
Nested request parameters are [TypedDicts](https://docs.python.org/3/library/typing.html#typing.TypedDict). Responses are [Pydantic models](https://docs.pydantic.dev) which also provide helper methods for things like:
* Serializing back into JSON, `model.to\_json()`
* Converting to a dictionary, `model.to\_dict()`
Typed requests and responses provide autocomplete and documentation within your editor. If you would like to see type errors in VS Code to help catch bugs earlier, set `python.analysis.typeCheckingMode` to `basic`.
List methods in the OpenAI API are paginated.
This library provides auto-paginating iterators with each list response, so you do not have to request successive pages manually:
```
`from openai import OpenAI
client = OpenAI()
all\_jobs = []
# Automatically fetches more pages as needed.
for job in client.fine\_tuning.jobs.list(
limit=20,
):
# Do something with job here
all\_jobs.append(job)
print(all\_jobs)`
```
Or, asynchronously:
```
`import asyncio
from openai import AsyncOpenAI
client = AsyncOpenAI()
async def main() -\> None:
all\_jobs = []
# Iterate through items across all pages, issuing requests as needed.
async for job in client.fine\_tuning.jobs.list(
limit=20,
):
all\_jobs.append(job)
print(all\_jobs)
asyncio.run(main())`
```
Alternatively, you can use the `.has\_next\_page()`, `.next\_page\_info()`, or `.get\_next\_page()` methods for more granular control working with pages:
```
`first\_page = await client.fine\_tuning.jobs.list(
limit=20,
)
if first\_page.has\_next\_page():
print(f"will fetch next page using these details: {first\_page.next\_page\_info()}")
next\_page = await first\_page.get\_next\_page()
print(f"number of items we just fetched: {len(next\_page.data)}")
# Remove `await` for non-async usage.`
```
Or just work directly with the returned data:
```
`first\_page = await client.fine\_tuning.jobs.list(
limit=20,
)
print(f"next page cursor: {first\_page.after}") # =\> "next page cursor: ..."
for job in first\_page.data:
print(job.id)
# Remove `await` for non-async usage.`
```
## Nested params
Nested parameters are dictionaries, typed using `TypedDict`, for example:
```
`from openai import OpenAI
client = OpenAI()
response = client.chat.responses.create(
input=[
{
"role": "user",
"content": "How much ?",
}
],
model="gpt-5.2",
response\_format={"type": "json\_object"},
)`
```
## File uploads
Request parameters that correspond to file uploads can be passed as `bytes`, or a [`PathLike`](https://docs.python.org/3/library/os.html#os.PathLike) instance or a tuple of `(filename, contents, media type)`.
```
`from pathlib import Path
from openai import OpenAI
client = OpenAI()
client.files.create(
file=Path("input.jsonl"),
purpose="fine-tune",
)`
```
The async client uses the exact same interface. If you pass a [`PathLike`](https://docs.python.org/3/library/os.html#os.PathLike) instance, the file contents will be read asynchronously automatically.
## Webhook Verification
Verifying webhook signatures is *optional but encouraged*.
For more information about webhooks, see [the API docs](https://platform.openai.com/docs/guides/webhooks).
### Parsing webhook payloads
For most use cases, you will likely want to verify the webhook and parse the payload at the same time. To achieve this, we provide the method `client.webhooks.unwrap()`, which parses a webhook request and verifies that it was sent by OpenAI. This method will raise an error if the signature is invalid.
Note that the `body` parameter must be the raw JSON string sent from the server (do not parse it first). The `.unwrap()` method will parse this JSON for you into an event object after verifying the webhook was sent from OpenAI.
```
`from openai import OpenAI
from flask import Flask, request
app = Flask(\_\_name\_\_)
client = OpenAI() # OPENAI\_WEBHOOK\_SECRET environment variable is used by default
@app.route("/webhook", methods=["POST"])
def webhook():
request\_body = request.get\_data(as\_text=True)
try:
event = client.webhooks.unwrap(request\_body, request.headers)
if event.type == "response.completed":
print("Response completed:", event.data)
elif event.type == "response.failed":
print("Response failed:", event.data)
else:
print("Unhandled event type:", event.type)
return "ok"
except Exception as e:
print("Invalid signature:", e)
return "Invalid signature", 400
if \_\_name\_\_ == "\_\_main\_\_":
app.run(port=8000)`
```
### Verifying webhook payloads directly
In some cases, you may want to verify the webhook separately from parsing the payload. If you prefer to handle these steps separately, we provide the method `client.webhooks.verify\_signature()` to *only verify* the signature of a webhook request. Like `.unwrap()`, this method will raise an error if the signature is invalid.
Note that the `body` parameter must be the raw JSON string sent from the server (do not parse it first). You will then need to parse the body after verifying the signature.
```
`import json
from openai import OpenAI
from flask import Flask, request
app = Flask(\_\_name\_\_)
client = OpenAI() # OPENAI\_WEBHOOK\_SECRET environment variable is used by default
@app.route("/webhook", methods=["POST"])
def webhook():
request\_body = request.get\_data(as\_text=True)
try:
client.webhooks.verify\_signature(request\_body, request.headers)
# Parse the body after verification
event = json.loads(request\_body)
print("Verified event:", event)
return "ok"
except Exception as e:
print("Invalid signature:", e)
return "Invalid signature", 400
if \_\_name\_\_ == "\_\_main\_\_":
app.run(port=8000)`
```
## Handling errors
When the library is unable to connect to the API (for example, due to network connection problems or a timeout), a subclass of `openai.APIConnectionError` is raised.
When the API returns a non-success status code (that is, 4xx or 5xx
response), a subclass of `openai.APIStatusError` is raised, containing `status\_code` and `response` properties.
All errors inherit from `openai.APIError`.
```
`import openai
from openai import OpenAI
client = OpenAI()
try:
client.fine\_tuning.jobs.create(
model="gpt-4o",
training\_file="file-abc123",
)
except openai.APIConnectionError as e:
print("The server could not be reached")
print(e.\_\_cause\_\_) # an underlying Exception, likely raised within httpx.
except openai.RateLimitError as e:
print("A 429 status code was received; we should back off a bit.")
except openai.APIStatusError as e:
print("Another non-200-range status code was received")
print(e.status\_code)
print(e.response)`
```
Error codes are as follows:
|Status Code|Error Type|
|400|`BadRequestError`|
|401|`AuthenticationError`|
|403|`PermissionDeniedError`|
|404|`NotFoundError`|
|422|`UnprocessableEntityError`|
|429|`RateLimitError`|
|\>=500|`InternalServerError`|
|N/A|`APIConnectionError`|
## Request IDs
>
> For more information on debugging requests, see
[> these docs
](https://platform.openai.com/docs/api-reference/debugging-requests)
>
All object responses in the SDK provide a `\_request\_id` property which is added from the `x-request-id` response header so that you can quickly log failing requests and report them back to OpenAI.
```
`response = await client.responses.create(
model="gpt-5.2",
input="Say 'this is a test'.",
)
print(response.\_request\_id) # req\_123`
```
Note that unlike other properties that use an `\_` prefix, the `\_request\_id` property
*is* public. Unless documented otherwise, *all* other `\_` prefix properties,
methods and modules are *private*.
Important
If you need to access request IDs for failed requests you must catch the `APIStatusError` exception
```
`import openai
try:
completion = await client.chat.completions.create(
messages=[{"role": "user", "content": "Say this is a test"}], model="gpt-5.2"
)
except openai.APIStatusError as exc:
print(exc.request\_id) # req\_123
raise exc`
```
## Retries
Certain errors are automatically retried 2 times by default, with a short exponential backoff.
Connection errors (for example, due to a network connectivity problem), 408 Request Timeout, 409 Conflict,
429 Rate Limit, and \>=500 Internal errors are all retried by default.
You can use the `max\_retries` option to configure or disable retry settings:
```
`from openai import OpenAI
# Configure the default for all requests:
client = OpenAI(
# default is 2
max\_retries=0,
)
# Or, configure per-request:
client.with\_options(max\_retries=5).chat.completions.create(
messages=[
{
"role": "user",
"content": "How can I get the name of the current day in JavaScript?",
}
],
model="gpt-5.2",
)`
```
## Timeouts
By default requests time out after 10 minutes. You can configure this with a `timeout` option,
which accepts a float or an [`httpx.Timeout`](https://www.python-httpx.org/advanced/timeouts/#fine-tuning-the-configuration) object:
```
`from openai import OpenAI
# Configure the default for all requests:
client = OpenAI(
# 20 seconds (default is 10 minutes)
timeout=20.0,
)
# More granular control:
client = OpenAI(
timeout=httpx.Timeout(60.0, read=5.0, write=10.0, connect=2.0),
)
# Override per-request:
client.with\_options(timeout=5.0).chat.completions.create(
messages=[
{
"role": "user",
"content": "How can I list all files in a directory using Python?",
}
],
model="gpt-5.2",
)`
```
On timeout, an `APITimeoutError` is thrown.
Note that requests that time out are [retried twice by default](https://github.com/openai/openai-python/tree/main/#retries).
## Advanced
### Logging
We use the standard library [`logging`](https://docs.python.org/3/library/logging.html) module.
You can enable logging by setting the environment variable `OPENAI\_LOG` to `info`.
```
`$ export OPENAI\_LOG=info`
```
Or to `debug` for more verbose logging.
### How to tell whether `None` means `null` or missing
In an API response, a field may be explicitly `null`, or missing entirely; in either case, its value is `None` in this library. You can differentiate the two cases with `.model\_fields\_set`:
```
`if response.my\_field is None:
if 'my\_field' not in response.model\_fields\_set:
print('Got json like {}, without a "my\_field" key present at all.')
else:
print('Got json like {"my\_field": null}.')`
```
### Accessing raw response data (e.g. headers)
The “raw” Response object can be accessed by prefixing `.with\_raw\_response.` to any HTTP method call, e.g.,
```
`from openai import OpenAI
client = OpenAI()
response = client.chat.completions.with\_raw\_response.create(
messages=[{
"role": "user",
"content": "Say this is a test",
}],
model="gpt-5.2",
)
print(response.headers.get('X-My-Header'))
completion = response.parse() # get the object that `chat.completions.create()` would have returned
print(completion)`
```
These methods return a [`LegacyAPIResponse`](https://github.com/openai/openai-python/tree/main/src/openai/_legacy_response.py) object. This is a legacy class as we’re changing it slightly in the next major version.
For the sync client this will mostly be the same with the exception
of `content` & `text` will be methods instead of properties. In the
async client, all methods will be async.
A migration script will be provided & the migration in general should
be smooth.
#### `.with\_streaming\_response`
The above interface eagerly reads the full response body when you make the request, which may not always be what you want.
To stream the response body, use `.with\_streaming\_response` instead, which requires a context manager and only reads the response body once you call `.read()`, `.text()`, `.json()`, `.iter\_bytes()`, `.iter\_text()`, `.iter\_lines()` or `.parse()`. In the async client, these are async methods.
As such, `.with\_streaming\_response` methods return a different [`APIResponse`](https://github.com/openai/openai-python/tree/main/src/openai/_response.py) object, and the async client returns an [`AsyncAPIResponse`](https://github.com/openai/openai-python/tree/main/src/openai/_response.py) object.
```
`with client.chat.completions.with\_streaming\_response.create(
messages=[
{
"role": "user",
"content": "Say this is a test",
}
],
model="gpt-5.2",
) as response:
print(response.headers.get("X-My-Header"))
for line in response.iter\_lines():
print(line)`
```
The context manager is required so that the response will reliably be closed.
### Making custom/undocumented requests
This library is typed for convenient access to the documented API.
If you need to access undocumented endpoints, params, or response properties, the library can still be used.
#### Undocumented endpoints
To make requests to undocumented endpoints, you can make requests using `client.get`, `client.post`, and other
http verbs. Options on the client will be respected (such as retries) when making this request.
```
`import httpx
response = client.post(
"/foo",
cast\_to=httpx.Response,
body={"my\_param": True},
)
print(response.headers.get("x-foo"))`
```
#### Undocumented request params
If you want to explicitly send an extra param, you can do so with the `extra\_query`, `extra\_body`, and `extra\_headers` request
options.
#### Undocumented response properties
To access undocumented response properties, you can access the extra fields like `response.unknown\_prop`. You
can also get all the extra fields on the Pydantic model as a dict with
[`response.model\_extra`](https://docs.pydantic.dev/latest/api/base_model/#pydantic.BaseModel.model_extra).
### Configuring the HTTP client
You can directly override the [httpx client](https://www.python-httpx.org/api/#client) to customize it for your use case, including:
* Support for [proxies](https://www.python-httpx.org/advanced/proxies/)
* Custom [transports](https://www.python-httpx.org/advanced/transports/)
* Additional [advanced](https://www.python-httpx.org/advanced/clients/) functionality
```
`import httpx
from openai import OpenAI, DefaultHttpxClient
client = OpenAI(
# Or use the `OPENAI\_BASE\_URL` env var
base\_url="http://my.test.server.example.com:8083/v1",
http\_client=DefaultHttpxClient(
proxy="http://my.test.proxy.example.com",
transport=httpx.HTTPTransport(local\_address="0.0.0.0"),
),
)`
```
You can also customize the client on a per-request basis by using `with\_options()`:
```
`client.with\_options(http\_client=DefaultHttpxClient(...))`
```
### Managing HTTP resources
By default the library closes underlying HTTP connections whenever the client is [garbage collected](https://docs.python.org/3/reference/datamodel.html#object.__del__). You can manually close the client using the `.close()` method if desired, or with a context manager that closes when exiting.
```
`from openai import OpenAI
with OpenAI() as client:
# make requests here
...
# HTTP client is now closed`
```
## Microsoft Azure OpenAI
To use this library with [Azure OpenAI](https://learn.microsoft.com/azure/ai-services/openai/overview), use the `AzureOpenAI`
class instead of the `OpenAI` class.
Important
The Azure API shape differs from the core API shape which means that the static types for responses / params
won’t always be correct.
```
`from openai import AzureOpenAI
# gets the API Key from environment variable AZURE\_OPENAI\_API\_KEY
client = AzureOpenAI(
# https://learn.microsoft.com/azure/ai-services/openai/reference#rest-api-versioning
api\_version="2023-07-01-preview",
# https://learn.microsoft.com/azure/cognitive-services/openai/how-to/create-resource?pivots=web-portal#create-a-resource
azure\_endpoint="https://example-endpoint.openai.azure.com",
)
completion = client.chat.completions.create(
model="deployment-name", # e.g. gpt-35-instant
messages=[
{
"role": "user",
"content": "How do I output all files in a directory using Python?",
},
],
)
print(completion.to\_json())`
```
In addition to the options provided in the base `OpenAI` client, the following options are provided:
* `azure\_endpoint` (or the `AZURE\_OPENAI\_ENDPOINT` environment variable)
* `azure\_deployment`
* `api\_version` (or the `OPENAI\_API\_VERSION` environment variable)
* `azure\_ad\_token` (or the `AZURE\_OPENAI\_AD\_TOKEN` environment variable)
* `azure\_ad\_token\_provider`
An example of using the client with Microsoft Entra ID (formerly known as Azure Active Directory) can be found [here](https://github.com/openai/openai-python/blob/main/examples/azure_ad.py).
## Versioning
This package generally follows [SemVer](https://semver.org/spec/v2.0.0.html) conventions, though certain backwards-incompatible changes may be released as minor versions:
1. Changes that only affect static types, without breaking runtime behavior.
2. Changes to library internals which are technically public but not intended or documented for external use. *(Please open a GitHub issue to let us know if you are relying on such internals.)*
3. Changes that we do not expect to impact the vast majority of users in practice.
We take backwards-compatibility seriously and work hard to ensure you can rely on a smooth upgrade experience.
We are keen for your feedback; please open an [issue](https://www.github.com/openai/openai-python/issues) with questions, bugs, or suggestions.
### Determining the installed version
If you’ve upgraded to the latest version but aren’t seeing any new features you were expecting then your python environment is likely still using an older version.
You can determine the version that is being used at runtime with:
```
`import openai
print(openai.\_\_version\_\_)`
```
## Requirements
Python 3.9 or higher.
## Contributing
See [the contributing documentation](https://github.com/openai/openai-python/tree/main/./CONTRIBUTING.md).