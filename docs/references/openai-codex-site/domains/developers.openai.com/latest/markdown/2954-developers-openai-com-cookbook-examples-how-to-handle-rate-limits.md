How to handle rate limits
Primary navigation
Search docs
### Suggested
responses createreasoning\_effortrealtimeprompt caching
Showcase Blog Cookbook Learn Community
* [ Home ](/cookbook)
### Topics
* [ Agents ](/cookbook/topic/agents)
* [ Evals ](/cookbook/topic/evals)
* [ Multimodal ](/cookbook/topic/multimodal)
* [ Text ](/cookbook/topic/text)
* [ Guardrails ](/cookbook/topic/guardrails)
* [ Optimization ](/cookbook/topic/optimization)
* [ ChatGPT ](/cookbook/topic/chatgpt)
* [ Codex ](/cookbook/topic/codex)
* [ gpt-oss ](/cookbook/topic/gpt-oss)
### Contribute
* [ Cookbook on GitHub ](https://github.com/openai/openai-cookbook)
[API Dashboard](https://platform.openai.com/login)
Copy Page
Copy Page
Jan 22, 2025
# How to handle rate limits
[ TS ](https://github.com/ted-at-openai)[ DW ](https://www.linkedin.com/in/dannywigg/)
[ Ted Sanders
(OpenAI)
, ](https://github.com/ted-at-openai)[ Danny Wigg
(OpenAI)
](https://www.linkedin.com/in/dannywigg/)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/How_to_handle_rate_limits.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/How_to_handle_rate_limits.ipynb)
When you call the OpenAI API repeatedly, you may encounter error messages that say `429: 'Too Many Requests'` or `RateLimitError`. These error messages come from exceeding the API’s rate limits.
This guide shares tips for avoiding and handling rate limit errors.
To see an example script for throttling parallel requests to avoid rate limit errors, see [api\_request\_parallel\_processor.py](https://github.com/openai/openai-cookbook/blob/main/examples/api_request_parallel_processor.py).
## Why rate limits exist
Rate limits are a common practice for APIs, and they’re put in place for a few different reasons.
* First, they help protect against abuse or misuse of the API. For example, a malicious actor could flood the API with requests in an attempt to overload it or cause disruptions in service. By setting rate limits, OpenAI can prevent this kind of activity.
* Second, rate limits help ensure that everyone has fair access to the API. If one person or organization makes an excessive number of requests, it could bog down the API for everyone else. By throttling the number of requests that a single user can make, OpenAI ensures that everyone has an opportunity to use the API without experiencing slowdowns.
* Lastly, rate limits can help OpenAI manage the aggregate load on its infrastructure. If requests to the API increase dramatically, it could tax the servers and cause performance issues. By setting rate limits, OpenAI can help maintain a smooth and consistent experience for all users.
Although hitting rate limits can be frustrating, rate limits exist to protect the reliable operation of the API for its users.
## Default rate limits
Your rate limit and spending limit (quota) are automatically adjusted based on a number of factors. As your usage of the OpenAI API goes up and you successfully pay the bill, we automatically increase your usage tier. You can find specific information regarding rate limits using the resources below.
### Other rate limit resources
Read more about OpenAI’s rate limits in these other resources:
* [Guide: Rate limits](https://platform.openai.com/docs/guides/rate-limits?context=tier-free)
* [Help Center: Is API usage subject to any rate limits?](https://help.openai.com/en/articles/5955598-is-api-usage-subject-to-any-rate-limits)
* [Help Center: How can I solve 429: ‘Too Many Requests’ errors?](https://help.openai.com/en/articles/5955604-how-can-i-solve-429-too-many-requests-errors)
### Requesting a rate limit increase
To learn more about increasing your organization’s usage tier and rate limit, visit your [Limits settings page](https://platform.openai.com/account/limits).
```
`import openai
import os
client = openai.OpenAI(api\_key=os.getenv("OPENAI\_API\_KEY", "\<your OpenAI API key if not set as env var\>"))`
```
## Example rate limit error
A rate limit error will occur when API requests are sent too quickly. If using the OpenAI Python library, they will look something like:
```
`RateLimitError: Rate limit reached for default-codex in organization org-{id} on requests per min. Limit: 20.000000 / min. Current: 24.000000 / min. Contact support@openai.com if you continue to have issues or if you’d like to request an increase.`
```
Below is example code for triggering a rate limit error.
```
`# request a bunch of completions in a loop
for \_ in range(100):
client.chat.completions.create(
model="gpt-4o-mini",
messages=[{"role": "user", "content": "Hello"}],
max\_tokens=10,
)`
```
```
`RateLimitError
Error code: 429 - {'error': {'message': 'You exceeded your current quota, please check your plan and billing details. For more information on this error, read the docs: https://platform.openai.com/docs/guides/error-codes/api-errors.', 'type': 'insufficient\_quota', 'param': None, 'code': 'insufficient\_quota'}}
[0;31m---------------------------------------------------------------------------[0m[0;31mRateLimitError[0m Traceback (most recent call last)Cell [0;32mIn[2], line 3[0m
[1;32m 1[0m [38;5;66;03m# request a bunch of completions in a loop[39;00m
[1;32m 2[0m [38;5;28;01mfor[39;00m \_ [38;5;129;01min[39;00m [38;5;28mrange[39m([38;5;241m100[39m):
[0;32m----\> 3[0m [43mclient[49m[38;5;241;43m.[39;49m[43mchat[49m[38;5;241;43m.[39;49m[43mcompletions[49m[38;5;241;43m.[39;49m[43mcreate[49m[43m([49m
[1;32m 4[0m [43m [49m[43mmodel[49m[38;5;241;43m=[39;49m[38;5;124;43m"[39;49m[38;5;124;43mgpt-4o-mini[39;49m[38;5;124;43m"[39;49m[43m,[49m
[1;32m 5[0m [43m [49m[43mmessages[49m[38;5;241;43m=[39;49m[43m[[49m[43m{[49m[38;5;124;43m"[39;49m[38;5;124;43mrole[39;49m[38;5;124;43m"[39;49m[43m:[49m[43m [49m[38;5;124;43m"[39;49m[38;5;124;43muser[39;49m[38;5;124;43m"[39;49m[43m,[49m[43m [49m[38;5;124;43m"[39;49m[38;5;124;43mcontent[39;49m[38;5;124;43m"[39;49m[43m:[49m[43m [49m[38;5;124;43m"[39;49m[38;5;124;43mHello[39;49m[38;5;124;43m"[39;49m[43m}[49m[43m][49m[43m,[49m
[1;32m 6[0m [43m [49m[43mmax\_tokens[49m[38;5;241;43m=[39;49m[38;5;241;43m10[39;49m[43m,[49m
[1;32m 7[0m [43m [49m[43m)[49m
File [0;32m\~/code/openai-cookbook/.venv/lib/python3.9/site-packages/openai/\_utils/\_utils.py:279[0m, in [0;36mrequired\_args.\<locals\>.inner.\<locals\>.wrapper[0;34m(\*args, \*\*kwargs)[0m
[1;32m 277[0m msg [38;5;241m=[39m [38;5;124mf[39m[38;5;124m"[39m[38;5;124mMissing required argument: [39m[38;5;132;01m{[39;00mquote(missing[[38;5;241m0[39m])[38;5;132;01m}[39;00m[38;5;124m"[39m
[1;32m 278[0m [38;5;28;01mraise[39;00m [38;5;167;01mTypeError[39;00m(msg)
[0;32m--\> 279[0m [38;5;28;01mreturn[39;00m [43mfunc[49m[43m([49m[38;5;241;43m\*[39;49m[43margs[49m[43m,[49m[43m [49m[38;5;241;43m\*[39;49m[38;5;241;43m\*[39;49m[43mkwargs[49m[43m)[49m
File [0;32m\~/code/openai-cookbook/.venv/lib/python3.9/site-packages/openai/resources/chat/completions.py:859[0m, in [0;36mCompletions.create[0;34m(self, messages, model, audio, frequency\_penalty, function\_call, functions, logit\_bias, logprobs, max\_completion\_tokens, max\_tokens, metadata, modalities, n, parallel\_tool\_calls, prediction, presence\_penalty, reasoning\_effort, response\_format, seed, service\_tier, stop, store, stream, stream\_options, temperature, tool\_choice, tools, top\_logprobs, top\_p, user, extra\_headers, extra\_query, extra\_body, timeout)[0m
[1;32m 817[0m [38;5;129m@required\_args[39m([[38;5;124m"[39m[38;5;124mmessages[39m[38;5;124m"[39m, [38;5;124m"[39m[38;5;124mmodel[39m[38;5;124m"[39m], [[38;5;124m"[39m[38;5;124mmessages[39m[38;5;124m"[39m, [38;5;124m"[39m[38;5;124mmodel[39m[38;5;124m"[39m, [38;5;124m"[39m[38;5;124mstream[39m[38;5;124m"[39m])
[1;32m 818[0m [38;5;28;01mdef[39;00m[38;5;250m [39m[38;5;21mcreate[39m(
[1;32m 819[0m [38;5;28mself[39m,
[0;32m (...)[0m
[1;32m 856[0m timeout: [38;5;28mfloat[39m [38;5;241m|[39m httpx[38;5;241m.[39mTimeout [38;5;241m|[39m [38;5;28;01mNone[39;00m [38;5;241m|[39m NotGiven [38;5;241m=[39m NOT\_GIVEN,
[1;32m 857[0m ) [38;5;241m-[39m[38;5;241m\>[39m ChatCompletion [38;5;241m|[39m Stream[ChatCompletionChunk]:
[1;32m 858[0m validate\_response\_format(response\_format)
[0;32m--\> 859[0m [38;5;28;01mreturn[39;00m [38;5;28;43mself[39;49m[38;5;241;43m.[39;49m[43m\_post[49m[43m([49m
[1;32m 860[0m [43m [49m[38;5;124;43m"[39;49m[38;5;124;43m/chat/completions[39;49m[38;5;124;43m"[39;49m[43m,[49m
[1;32m 861[0m [43m [49m[43mbody[49m[38;5;241;43m=[39;49m[43mmaybe\_transform[49m[43m([49m
[1;32m 862[0m [43m [49m[43m{[49m
[1;32m 863[0m [43m [49m[38;5;124;43m"[39;49m[38;5;124;43mmessages[39;49m[38;5;124;43m"[39;49m[43m:[49m[43m [49m[43mmessages[49m[43m,[49m
[1;32m 864[0m [43m [49m[38;5;124;43m"[39;49m[38;5;124;43mmodel[39;49m[38;5;124;43m"[39;49m[43m:[49m[43m [49m[43mmodel[49m[43m,[49m
[1;32m 865[0m [43m [49m[38;5;124;43m"[39;49m[38;5;124;43maudio[39;49m[38;5;124;43m"[39;49m[43m:[49m[43m [49m[43maudio[49m[43m,[49m
[1;32m 866[0m [43m [49m[38;5;124;43m"[39;49m[38;5;124;43mfrequency\_penalty[39;49m[38;5;124;43m"[39;49m[43m:[49m[43m [49m[43mfrequency\_penalty[49m[43m,[49m
[1;32m 867[0m [43m [49m[38;5;124;43m"[39;49m[38;5;124;43mfunction\_call[39;49m[38;5;124;43m"[39;49m[43m:[49m[43m [49m[43mfunction\_call[49m[43m,[49m
[1;32m 868[0m [43m [49m[38;5;124;43m"[39;49m[38;5;124;43mfunctions[39;49m[38;5;124;43m"[39;49m[43m:[49m[43m [49m[43mfunctions[49m[43m,[49m
[1;32m 869[0m [43m [49m[38;5;124;43m"[39;49m[38;5;124;43mlogit\_bias[39;49m[38;5;124;43m"[39;49m[43m:[49m[43m [49m[43mlogit\_bias[49m[43m,[49m
[1;32m 870[0m [43m [49m[38;5;124;43m"[39;49m[38;5;124;43mlogprobs[39;49m[38;5;124;43m"[39;49m[43m:[49m[43m [49m[43mlogprobs[49m[43m,[49m
[1;32m 871[0m [43m [49m[38;5;124;43m"[39;49m[38;5;124;43mmax\_completion\_tokens[39;49m[38;5;124;43m"[39;49m[43m:[49m[43m [49m[43mmax\_completion\_tokens[49m[43m,[49m
[1;32m 872[0m [43m [49m[38;5;124;43m"[39;49m[38;5;124;43mmax\_tokens[39;49m[38;5;124;43m"[39;49m[43m:[49m[43m [49m[43mmax\_tokens[49m[43m,[49m
[1;32m 873[0m [43m [49m[38;5;124;43m"[39;49m[38;5;124;43mmetadata[39;49m[38;5;124;43m"[39;49m[43m:[49m[43m [49m[43mmetadata[49m[43m,[49m
[1;32m 874[0m [43m [49m[38;5;124;43m"[39;49m[38;5;124;43mmodalities[39;49m[38;5;124;43m"[39;49m[43m:[49m[43m [49m[43mmodalities[49m[43m,[49m
[1;32m 875[0m [43m [49m[38;5;124;43m"[39;49m[38;5;124;43mn[39;49m[38;5;124;43m"[39;49m[43m:[49m[43m [49m[43mn[49m[43m,[49m
[1;32m 876[0m [43m [49m[38;5;124;43m"[39;49m[38;5;124;43mparallel\_tool\_calls[39;49m[38;5;124;43m"[39;49m[43m:[49m[43m [49m[43mparallel\_tool\_calls[49m[43m,[49m
[1;32m 877[0m [43m [49m[38;5;124;43m"[39;49m[38;5;124;43mprediction[39;49m[38;5;124;43m"[39;49m[43m:[49m[43m [49m[43mprediction[49m[43m,[49m
[1;32m 878[0m [43m [49m[38;5;124;43m"[39;49m[38;5;124;43mpresence\_penalty[39;49m[38;5;124;43m"[39;49m[43m:[49m[43m [49m[43mpresence\_penalty[49m[43m,[49m
[1;32m 879[0m [43m [49m[38;5;124;43m"[39;49m[38;5;124;43mreasoning\_effort[39;49m[38;5;124;43m"[39;49m[43m:[49m[43m [49m[43mreasoning\_effort[49m[43m,[49m
[1;32m 880[0m [43m [49m[38;5;124;43m"[39;49m[38;5;124;43mresponse\_format[39;49m[38;5;124;43m"[39;49m[43m:[49m[43m [49m[43mresponse\_format[49m[43m,[49m
[1;32m 881[0m [43m [49m[38;5;124;43m"[39;49m[38;5;124;43mseed[39;49m[38;5;124;43m"[39;49m[43m:[49m[43m [49m[43mseed[49m[43m,[49m
[1;32m 882[0m [43m [49m[38;5;124;43m"[39;49m[38;5;124;43mservice\_tier[39;49m[38;5;124;43m"[39;49m[43m:[49m[43m [49m[43mservice\_tier[49m[43m,[49m
[1;32m 883[0m [43m [49m[38;5;124;43m"[39;49m[38;5;124;43mstop[39;49m[38;5;124;43m"[39;49m[43m:[49m[43m [49m[43mstop[49m[43m,[49m
[1;32m 884[0m [43m [49m[38;5;124;43m"[39;49m[38;5;124;43mstore[39;49m[38;5;124;43m"[39;49m[43m:[49m[43m [49m[43mstore[49m[43m,[49m
[1;32m 885[0m [43m [49m[38;5;124;43m"[39;49m[38;5;124;43mstream[39;49m[38;5;124;43m"[39;49m[43m:[49m[43m [49m[43mstream[49m[43m,[49m
[1;32m 886[0m [43m [49m[38;5;124;43m"[39;49m[38;5;124;43mstream\_options[39;49m[38;5;124;43m"[39;49m[43m:[49m[43m [49m[43mstream\_options[49m[43m,[49m
[1;32m 887[0m [43m [49m[38;5;124;43m"[39;49m[38;5;124;43mtemperature[39;49m[38;5;124;43m"[39;49m[43m:[49m[43m [49m[43mtemperature[49m[43m,[49m
[1;32m 888[0m [43m [49m[38;5;124;43m"[39;49m[38;5;124;43mtool\_choice[39;49m[38;5;124;43m"[39;49m[43m:[49m[43m [49m[43mtool\_choice[49m[43m,[49m
[1;32m 889[0m [43m [49m[38;5;124;43m"[39;49m[38;5;124;43mtools[39;49m[38;5;124;43m"[39;49m[43m:[49m[43m [49m[43mtools[49m[43m,[49m
[1;32m 890[0m [43m [49m[38;5;124;43m"[39;49m[38;5;124;43mtop\_logprobs[39;49m[38;5;124;43m"[39;49m[43m:[49m[43m [49m[43mtop\_logprobs[49m[43m,[49m
[1;32m 891[0m [43m [49m[38;5;124;43m"[39;49m[38;5;124;43mtop\_p[39;49m[38;5;124;43m"[39;49m[43m:[49m[43m [49m[43mtop\_p[49m[43m,[49m
[1;32m 892[0m [43m [49m[38;5;124;43m"[39;49m[38;5;124;43muser[39;49m[38;5;124;43m"[39;49m[43m:[49m[43m [49m[43muser[49m[43m,[49m
[1;32m 893[0m [43m [49m[43m}[49m[43m,[49m
[1;32m 894[0m [43m [49m[43mcompletion\_create\_params[49m[38;5;241;43m.[39;49m[43mCompletionCreateParams[49m[43m,[49m
[1;32m 895[0m [43m [49m[43m)[49m[43m,[49m
[1;32m 896[0m [43m [49m[43moptions[49m[38;5;241;43m=[39;49m[43mmake\_request\_options[49m[43m([49m
[1;32m 897[0m [43m [49m[43mextra\_headers[49m[38;5;241;43m=[39;49m[43mextra\_headers[49m[43m,[49m[43m [49m[43mextra\_query[49m[38;5;241;43m=[39;49m[43mextra\_query[49m[43m,[49m[43m [49m[43mextra\_body[49m[38;5;241;43m=[39;49m[43mextra\_body[49m[43m,[49m[43m [49m[43mtimeout[49m[38;5;241;43m=[39;49m[43mtimeout[49m
[1;32m 898[0m [43m [49m[43m)[49m[43m,[49m
[1;32m 899[0m [43m [49m[43mcast\_to[49m[38;5;241;43m=[39;49m[43mChatCompletion[49m[43m,[49m
[1;32m 900[0m [43m [49m[43mstream[49m[38;5;241;43m=[39;49m[43mstream[49m[43m [49m[38;5;129;43;01mor[39;49;00m[43m [49m[38;5;28;43;01mFalse[39;49;00m[43m,[49m
[1;32m 901[0m [43m [49m[43mstream\_cls[49m[38;5;241;43m=[39;49m[43mStream[49m[43m[[49m[43mChatCompletionChunk[49m[43m][49m[43m,[49m
[1;32m 902[0m [43m [49m[43m)[49m
File [0;32m\~/code/openai-cookbook/.venv/lib/python3.9/site-packages/openai/\_base\_client.py:1283[0m, in [0;36mSyncAPIClient.post[0;34m(self, path, cast\_to, body, options, files, stream, stream\_cls)[0m
[1;32m 1269[0m [38;5;28;01mdef[39;00m[38;5;250m [39m[38;5;21mpost[39m(
[1;32m 1270[0m [38;5;28mself[39m,
[1;32m 1271[0m path: [38;5;28mstr[39m,
[0;32m (...)[0m
[1;32m 1278[0m stream\_cls: [38;5;28mtype[39m[\_StreamT] [38;5;241m|[39m [38;5;28;01mNone[39;00m [38;5;241m=[39m [38;5;28;01mNone[39;00m,
[1;32m 1279[0m ) [38;5;241m-[39m[38;5;241m\>[39m ResponseT [38;5;241m|[39m \_StreamT:
[1;32m 1280[0m opts [38;5;241m=[39m FinalRequestOptions[38;5;241m.[39mconstruct(
[1;32m 1281[0m method[38;5;241m=[39m[38;5;124m"[39m[38;5;124mpost[39m[38;5;124m"[39m, url[38;5;241m=[39mpath, json\_data[38;5;241m=[39mbody, files[38;5;241m=[39mto\_httpx\_files(files), [38;5;241m\*[39m[38;5;241m\*[39moptions
[1;32m 1282[0m )
[0;32m-\> 1283[0m [38;5;28;01mreturn[39;00m cast(ResponseT, [38;5;28;43mself[39;49m[38;5;241;43m.[39;49m[43mrequest[49m[43m([49m[43mcast\_to[49m[43m,[49m[43m [49m[43mopts[49m[43m,[49m[43m [49m[43mstream[49m[38;5;241;43m=[39;49m[43mstream[49m[43m,[49m[43m [49m[43mstream\_cls[49m[38;5;241;43m=[39;49m[43mstream\_cls[49m[43m)[49m)
File [0;32m\~/code/openai-cookbook/.venv/lib/python3.9/site-packages/openai/\_base\_client.py:960[0m, in [0;36mSyncAPIClient.request[0;34m(self, cast\_to, options, remaining\_retries, stream, stream\_cls)[0m
[1;32m 957[0m [38;5;28;01melse[39;00m:
[1;32m 958[0m retries\_taken [38;5;241m=[39m [38;5;241m0[39m
[0;32m--\> 960[0m [38;5;28;01mreturn[39;00m [38;5;28;43mself[39;49m[38;5;241;43m.[39;49m[43m\_request[49m[43m([49m
[1;32m 961[0m [43m [49m[43mcast\_to[49m[38;5;241;43m=[39;49m[43mcast\_to[49m[43m,[49m
[1;32m 962[0m [43m [49m[43moptions[49m[38;5;241;43m=[39;49m[43moptions[49m[43m,[49m
[1;32m 963[0m [43m [49m[43mstream[49m[38;5;241;43m=[39;49m[43mstream[49m[43m,[49m
[1;32m 964[0m [43m [49m[43mstream\_cls[49m[38;5;241;43m=[39;49m[43mstream\_cls[49m[43m,[49m
[1;32m 965[0m [43m [49m[43mretries\_taken[49m[38;5;241;43m=[39;49m[43mretries\_taken[49m[43m,[49m
[1;32m 966[0m [43m[49m[43m)[49m
File [0;32m\~/code/openai-cookbook/.venv/lib/python3.9/site-packages/openai/\_base\_client.py:1049[0m, in [0;36mSyncAPIClient.\_request[0;34m(self, cast\_to, options, retries\_taken, stream, stream\_cls)[0m
[1;32m 1047[0m [38;5;28;01mif[39;00m remaining\_retries [38;5;241m\>[39m [38;5;241m0[39m [38;5;129;01mand[39;00m [38;5;28mself[39m[38;5;241m.[39m\_should\_retry(err[38;5;241m.[39mresponse):
[1;32m 1048[0m err[38;5;241m.[39mresponse[38;5;241m.[39mclose()
[0;32m-\> 1049[0m [38;5;28;01mreturn[39;00m [38;5;28;43mself[39;49m[38;5;241;43m.[39;49m[43m\_retry\_request[49m[43m([49m
[1;32m 1050[0m [43m [49m[43minput\_options[49m[43m,[49m
[1;32m 1051[0m [43m [49m[43mcast\_to[49m[43m,[49m
[1;32m 1052[0m [43m [49m[43mretries\_taken[49m[38;5;241;43m=[39;49m[43mretries\_taken[49m[43m,[49m
[1;32m 1053[0m [43m [49m[43mresponse\_headers[49m[38;5;241;43m=[39;49m[43merr[49m[38;5;241;43m.[39;49m[43mresponse[49m[38;5;241;43m.[39;49m[43mheaders[49m[43m,[49m
[1;32m 1054[0m [43m [49m[43mstream[49m[38;5;241;43m=[39;49m[43mstream[49m[43m,[49m
[1;32m 1055[0m [43m [49m[43mstream\_cls[49m[38;5;241;43m=[39;49m[43mstream\_cls[49m[43m,[49m
[1;32m 1056[0m [43m [49m[43m)[49m
[1;32m 1058[0m [38;5;66;03m# If the response is streamed then we need to explicitly read the response[39;00m
[1;32m 1059[0m [38;5;66;03m# to completion before attempting to access the response text.[39;00m
[1;32m 1060[0m [38;5;28;01mif[39;00m [38;5;129;01mnot[39;00m err[38;5;241m.[39mresponse[38;5;241m.[39mis\_closed:
File [0;32m\~/code/openai-cookbook/.venv/lib/python3.9/site-packages/openai/\_base\_client.py:1098[0m, in [0;36mSyncAPIClient.\_retry\_request[0;34m(self, options, cast\_to, retries\_taken, response\_headers, stream, stream\_cls)[0m
[1;32m 1094[0m [38;5;66;03m# In a synchronous context we are blocking the entire thread. Up to the library user to run the client in a[39;00m
[1;32m 1095[0m [38;5;66;03m# different thread if necessary.[39;00m
[1;32m 1096[0m time[38;5;241m.[39msleep(timeout)
[0;32m-\> 1098[0m [38;5;28;01mreturn[39;00m [38;5;28;43mself[39;49m[38;5;241;43m.[39;49m[43m\_request[49m[43m([49m
[1;32m 1099[0m [43m [49m[43moptions[49m[38;5;241;43m=[39;49m[43moptions[49m[43m,[49m
[1;32m 1100[0m [43m [49m[43mcast\_to[49m[38;5;241;43m=[39;49m[43mcast\_to[49m[43m,[49m
[1;32m 1101[0m [43m [49m[43mretries\_taken[49m[38;5;241;43m=[39;49m[43mretries\_taken[49m[43m [49m[38;5;241;43m+[39;49m[43m [49m[38;5;241;43m1[39;49m[43m,[49m
[1;32m 1102[0m [43m [49m[43mstream[49m[38;5;241;43m=[39;49m[43mstream[49m[43m,[49m
[1;32m 1103[0m [43m [49m[43mstream\_cls[49m[38;5;241;43m=[39;49m[43mstream\_cls[49m[43m,[49m
[1;32m 1104[0m [43m[49m[43m)[49m
File [0;32m\~/code/openai-cookbook/.venv/lib/python3.9/site-packages/openai/\_base\_client.py:1049[0m, in [0;36mSyncAPIClient.\_request[0;34m(self, cast\_to, options, retries\_taken, stream, stream\_cls)[0m
[1;32m 1047[0m [38;5;28;01mif[39;00m remaining\_retries [38;5;241m\>[39m [38;5;241m0[39m [38;5;129;01mand[39;00m [38;5;28mself[39m[38;5;241m.[39m\_should\_retry(err[38;5;241m.[39mresponse):
[1;32m 1048[0m err[38;5;241m.[39mresponse[38;5;241m.[39mclose()
[0;32m-\> 1049[0m [38;5;28;01mreturn[39;00m [38;5;28;43mself[39;49m[38;5;241;43m.[39;49m[43m\_retry\_request[49m[43m([49m
[1;32m 1050[0m [43m [49m[43minput\_options[49m[43m,[49m
[1;32m 1051[0m [43m [49m[43mcast\_to[49m[43m,[49m
[1;32m 1052[0m [43m [49m[43mretries\_taken[49m[38;5;241;43m=[39;49m[43mretries\_taken[49m[43m,[49m
[1;32m 1053[0m [43m [49m[43mresponse\_headers[49m[38;5;241;43m=[39;49m[43merr[49m[38;5;241;43m.[39;49m[43mresponse[49m[38;5;241;43m.[39;49m[43mheaders[49m[43m,[49m
[1;32m 1054[0m [43m [49m[43mstream[49m[38;5;241;43m=[39;49m[43mstream[49m[43m,[49m
[1;32m 1055[0m [43m [49m[43mstream\_cls[49m[38;5;241;43m=[39;49m[43mstream\_cls[49m[43m,[49m
[1;32m 1056[0m [43m [49m[43m)[49m
[1;32m 1058[0m [38;5;66;03m# If the response is streamed then we need to explicitly read the response[39;00m
[1;32m 1059[0m [38;5;66;03m# to completion before attempting to access the response text.[39;00m
[1;32m 1060[0m [38;5;28;01mif[39;00m [38;5;129;01mnot[39;00m err[38;5;241m.[39mresponse[38;5;241m.[39mis\_closed:
File [0;32m\~/code/openai-cookbook/.venv/lib/python3.9/site-packages/openai/\_base\_client.py:1098[0m, in [0;36mSyncAPIClient.\_retry\_request[0;34m(self, options, cast\_to, retries\_taken, response\_headers, stream, stream\_cls)[0m
[1;32m 1094[0m [38;5;66;03m# In a synchronous context we are blocking the entire thread. Up to the library user to run the client in a[39;00m
[1;32m 1095[0m [38;5;66;03m# different thread if necessary.[39;00m
[1;32m 1096[0m time[38;5;241m.[39msleep(timeout)
[0;32m-\> 1098[0m [38;5;28;01mreturn[39;00m [38;5;28;43mself[39;49m[38;5;241;43m.[39;49m[43m\_request[49m[43m([49m
[1;32m 1099[0m [43m [49m[43moptions[49m[38;5;241;43m=[39;49m[43moptions[49m[43m,[49m
[1;32m 1100[0m [43m [49m[43mcast\_to[49m[38;5;241;43m=[39;49m[43mcast\_to[49m[43m,[49m
[1;32m 1101[0m [43m [49m[43mretries\_taken[49m[38;5;241;43m=[39;49m[43mretries\_taken[49m[43m [49m[38;5;241;43m+[39;49m[43m [49m[38;5;241;43m1[39;49m[43m,[49m
[1;32m 1102[0m [43m [49m[43mstream[49m[38;5;241;43m=[39;49m[43mstream[49m[43m,[49m
[1;32m 1103[0m [43m [49m[43mstream\_cls[49m[38;5;241;43m=[39;49m[43mstream\_cls[49m[43m,[49m
[1;32m 1104[0m [43m[49m[43m)[49m
File [0;32m\~/code/openai-cookbook/.venv/lib/python3.9/site-packages/openai/\_base\_client.py:1064[0m, in [0;36mSyncAPIClient.\_request[0;34m(self, cast\_to, options, retries\_taken, stream, stream\_cls)[0m
[1;32m 1061[0m err[38;5;241m.[39mresponse[38;5;241m.[39mread()
[1;32m 1063[0m log[38;5;241m.[39mdebug([38;5;124m"[39m[38;5;124mRe-raising status error[39m[38;5;124m"[39m)
[0;32m-\> 1064[0m [38;5;28;01mraise[39;00m [38;5;28mself[39m[38;5;241m.[39m\_make\_status\_error\_from\_response(err[38;5;241m.[39mresponse) [38;5;28;01mfrom[39;00m[38;5;250m [39m[38;5;28;01mNone[39;00m
[1;32m 1066[0m [38;5;28;01mreturn[39;00m [38;5;28mself[39m[38;5;241m.[39m\_process\_response(
[1;32m 1067[0m cast\_to[38;5;241m=[39mcast\_to,
[1;32m 1068[0m options[38;5;241m=[39moptions,
[0;32m (...)[0m
[1;32m 1072[0m retries\_taken[38;5;241m=[39mretries\_taken,
[1;32m 1073[0m )
[0;31mRateLimitError[0m: Error code: 429 - {'error': {'message': 'You exceeded your current quota, please check your plan and billing details. For more information on this error, read the docs: https://platform.openai.com/docs/guides/error-codes/api-errors.', 'type': 'insufficient\_quota', 'param': None, 'code': 'insufficient\_quota'}}`
```
## How to mitigate rate limit errors
### Retrying with exponential backoff
One easy way to mitigate rate limit errors is to automatically retry requests with a random exponential backoff. Retrying with exponential backoff means performing a short sleep when a rate limit error is hit, then retrying the unsuccessful request. If the request is still unsuccessful, the sleep length is increased and the process is repeated. This continues until the request is successful or until a maximum number of retries is reached.
This approach has many benefits:
* Automatic retries means you can recover from rate limit errors without crashes or missing data
* Exponential backoff means that your first retries can be tried quickly, while still benefiting from longer delays if your first few retries fail
* Adding random jitter to the delay helps retries from all hitting at the same time
Note that unsuccessful requests contribute to your per-minute limit, so continuously resending a request won’t work.
Below are a few example solutions.
#### Example #1: Using the Tenacity library
[Tenacity](https://tenacity.readthedocs.io/en/latest/) is an Apache 2.0 licensed general-purpose retrying library, written in Python, to simplify the task of adding retry behavior to just about anything.
To add exponential backoff to your requests, you can use the `tenacity.retry` [decorator](https://peps.python.org/pep-0318/). The following example uses the `tenacity.wait\_random\_exponential` function to add random exponential backoff to a request.
Note that the Tenacity library is a third-party tool, and OpenAI makes no guarantees about its reliability or security.
```
`from tenacity import (
retry,
stop\_after\_attempt,
wait\_random\_exponential,
) # for exponential backoff
@retry(wait=wait\_random\_exponential(min=1, max=60), stop=stop\_after\_attempt(6))
def completion\_with\_backoff(\*\*kwargs):
return client.chat.completions.create(\*\*kwargs)
completion\_with\_backoff(model="gpt-4o-mini", messages=[{"role": "user", "content": "Once upon a time,"}])`
```
```
`ChatCompletion(id='chatcmpl-8PAu6anX2JxQdYmJRzps38R8u0ZBC', choices=[Choice(finish\_reason='stop', index=0, message=ChatCompletionMessage(content='in a small village nestled among green fields and rolling hills, there lived a kind-hearted and curious young girl named Lily. Lily was known for her bright smile and infectious laughter, bringing joy to everyone around her.\\n\\nOne sunny morning, as Lily played in the meadows, she stumbled upon a mysterious book tucked away beneath a tall oak tree. Intrigued, she picked it up and dusted off its weathered cover to reveal intricate golden patterns. Without hesitation, she opened it, discovering that its pages were filled with magical tales and enchanting adventures.\\n\\nAmong the stories she found, one particularly caught her attention—a tale of a long-lost treasure hidden deep within a mysterious forest. Legend had it that whoever found this hidden treasure would be granted one wish, no matter how big or small. Excited by the prospect of finding such treasure and fulfilling her wildest dreams, Lily decided to embark on a thrilling journey to the forest.\\n\\nGathering her courage, Lily told her parents about the magical book and her quest to find the hidden treasure. Though concerned for their daughter\\'s safety, they couldn\\'t help but admire her spirit and determination. They hugged her tightly and blessed her with love and luck, promising to await her return.\\n\\nEquipped with a map she found within the book, Lily ventured into the depths of the thick forest. The trees whispered tales of forgotten secrets, and the enchanted creatures hidden within watched her every step. But Lily remained undeterred, driven by her desire to discover what lay ahead.\\n\\nDays turned into weeks as Lily traversed through dense foliage, crossed swift rivers, and climbed treacherous mountains. She encountered mystical beings who offered guidance and protection along her perilous journey. With their help, she overcame countless obstacles and grew braver with each passing day.\\n\\nFinally, after what felt like an eternity, Lily reached the heart of the forest. There, beneath a jeweled waterfall, she found the long-lost treasure—a magnificent chest adorned with sparkling gemstones. Overwhelmed with excitement, she gently opened the chest to reveal a brilliant light that illuminated the forest.\\n\\nWithin the glow, a wise voice echoed, "You have proven your courage and pure heart, young Lily. Make your wish, and it shall be granted."\\n\\nLily thought deeply about her wish, realizing that her true treasure was the love and happiness she felt in her heart. Instead of making a wish for herself, she asked for the wellbeing and prosperity of her village, spreading joy and harmony to everyone living there.\\n\\nAs the light faded, Lily knew her quest was complete. She retraced her steps through the forest, returning home to find her village flourishing. Fields bloomed with vibrant flowers, and laughter filled the air.\\n\\nThe villagers greeted Lily with open arms, recognizing her selflessness and the magic she had brought into their lives. From that day forward, they told the tale of Lily\\'s journey, celebrating her as a heroine who embodied the power of love, kindness, and the belief that true treasure lies within oneself.\\n\\nAnd so, the story of Lily became an everlasting legend, inspiring generations to follow their dreams, be selfless, and find the true treasures that lie within their hearts.', role='assistant', function\_call=None, tool\_calls=None))], created=1701010806, model='gpt-3.5-turbo-0613', object='chat.completion', system\_fingerprint=None, usage=CompletionUsage(completion\_tokens=641, prompt\_tokens=12, total\_tokens=653))`
```
#### Example #2: Using the backoff library
Another library that provides function decorators for backoff and retry is [backoff](https://pypi.org/project/backoff/).
Like Tenacity, the backoff library is a third-party tool, and OpenAI makes no guarantees about its reliability or security.
```
`import backoff # for exponential backoff
@backoff.on\_exception(backoff.expo, openai.RateLimitError, max\_time=60, max\_tries=6)
def completions\_with\_backoff(\*\*kwargs):
return client.chat.completions.create(\*\*kwargs)
completions\_with\_backoff(model="gpt-4o-mini", messages=[{"role": "user", "content": "Once upon a time,"}])`
```
```
`ChatCompletion(id='chatcmpl-AqRiD3gF3q8VVs6w8jgba6FHGr0L5', choices=[Choice(finish\_reason='stop', index=0, logprobs=None, message=ChatCompletionMessage(content="in a small village nestled between lush green hills and a shimmering lake, there lived a young girl named Elara. Elara had a curious spirit and a heart full of dreams. Every day, she would explore the woods surrounding her home, searching for hidden treasures and magical creatures.\\n\\nOne sunny afternoon, while wandering deeper into the forest than she ever had before, Elara stumbled upon a sparkling, crystal-clear pond. As she knelt down to take a closer look, she noticed a glimmering object at the bottom. It was a beautifully crafted key, shining with an otherworldly light. Without thinking twice, Elara reached into the cool water and retrieved the key, feeling a strange warmth envelop her.\\n\\nLittle did she know, this key was no ordinary key. It was said to unlock a secret door hidden in the heart of the forest, a door that led to a realm of wonder and adventure. Legends whispered of enchanted beings, ancient wisdom, and challenges that could only be overcome through bravery and kindness.\\n\\nExcited by the possibility of what awaited her, Elara set off on a quest to find the hidden door. Guided by a faint glow that seemed to beckon her, she journeyed through twisting pathways, lush groves, and enchanted glades.\\n\\nAlong the way, she encountered talking animals, wise old trees, and mischievous fairies, each offering clues and riddles that tested her resolve and imagination. With each challenge she faced, Elara grew stronger and more confident, realizing that the true magic lay not just in the world around her, but within herself.\\n\\nAfter what felt like days of exploring, she finally found the door—a majestic archway covered in vines and blossoms, with a keyhole that sparkled like the night sky. Heart pounding with excitement, Elara inserted the key. With a gentle turn, the door slowly creaked open, revealing a land more breathtaking than she could have ever imagined.\\n\\nAs she stepped through the doorway, she found herself in a vibrant world filled with colors beyond description, where the sky shimmered in hues of gold and lavender, and the air was filled with the sweet scent of flowers that sang as they swayed in the breeze. Here, she encountered beings of light who welcomed her with open arms.\\n\\nBut soon, she discovered that this realm was in peril. A dark shadow loomed over the land, threatening to steal its magic and joy. Elara knew she couldn’t stand by and do nothing. With the friends she had made along her journey and the courage she had found within herself, she set out to confront the darkness.\\n\\nThrough trials that tested her strength, intellect, and compassion, Elara and her friends gathered the forgotten magic of the realm. They united their powers, confronting the shadow in an epic battle of light and dark. In the end, it was Elara's unwavering belief in hope and friendship that banished the darkness, restoring peace and harmony to the land.\\n\\nGrateful for her bravery, the beings of light gifted Elara a shimmering pendant that would allow her to return to their world whenever she wished, reminding her that true magic lies in the connections we forge with others and the courage to follow our dreams.\\n\\nWith her heart full of joy, Elara returned to her village, forever changed by her adventure. She would often revisit the magical realm, sharing stories with her friends and inspiring them to embrace their own dreams. And so, the girl who once wandered the woods became a beacon of hope, a reminder that within every heart lies the power to change the world.\\n\\nAnd from that day on, the little village thrived, full of laughter, love, and dreams waiting to be explored—each adventure beginning just like hers, with a curious heart and a willingness to believe in the impossible. \\n\\nThe end.", refusal=None, role='assistant', audio=None, function\_call=None, tool\_calls=None), internal\_metrics=[{'cached\_prompt\_tokens': 0, 'total\_accepted\_tokens': 0, 'total\_batched\_tokens': 794, 'total\_predicted\_tokens': 0, 'total\_rejected\_tokens': 0, 'total\_tokens\_in\_completion': 795, 'cached\_embeddings\_bytes': 0, 'cached\_embeddings\_n': 0, 'uncached\_embeddings\_bytes': 0, 'uncached\_embeddings\_n': 0, 'fetched\_embeddings\_bytes': 0, 'fetched\_embeddings\_n': 0, 'n\_evictions': 0, 'sampling\_steps': 767, 'sampling\_steps\_with\_predictions': 0, 'batcher\_ttft': 0.20319080352783203, 'batcher\_initial\_queue\_time': 0.12981152534484863}])], created=1737062945, model='gpt-4o-mini-2024-07-18', object='chat.completion', service\_tier='default', system\_fingerprint='fp\_72ed7ab54c', usage=CompletionUsage(completion\_tokens=767, prompt\_tokens=12, total\_tokens=779, completion\_tokens\_details=CompletionTokensDetails(accepted\_prediction\_tokens=0, audio\_tokens=0, reasoning\_tokens=0, rejected\_prediction\_tokens=0), prompt\_tokens\_details=PromptTokensDetails(audio\_tokens=0, cached\_tokens=0, cached\_tokens\_internal=0)))`
```
#### Example 3: Manual backoff implementation
If you don’t want to use third-party libraries, you can implement your own backoff logic.
```
`# imports
import random
import time
# define a retry decorator
def retry\_with\_exponential\_backoff(
func,
initial\_delay: float = 1,
exponential\_base: float = 2,
jitter: bool = True,
max\_retries: int = 10,
errors: tuple = (openai.RateLimitError,),
):
"""Retry a function with exponential backoff."""
def wrapper(\*args, \*\*kwargs):
# Initialize variables
num\_retries = 0
delay = initial\_delay
# Loop until a successful response or max\_retries is hit or an exception is raised
while True:
try:
return func(\*args, \*\*kwargs)
# Retry on specified errors
except errors as e:
# Increment retries
num\_retries += 1
# Check if max retries has been reached
if num\_retries \> max\_retries:
raise Exception(
f"Maximum number of retries ({max\_retries}) exceeded."
)
# Increment the delay
delay \*= exponential\_base \* (1 + jitter \* random.random())
# Sleep for the delay
time.sleep(delay)
# Raise exceptions for any errors not specified
except Exception as e:
raise e
return wrapper
@retry\_with\_exponential\_backoff
def completions\_with\_backoff(\*\*kwargs):
return client.chat.completions.create(\*\*kwargs)
completions\_with\_backoff(model="gpt-4o-mini", messages=[{"role": "user", "content": "Once upon a time,"}])`
```
```
`ChatCompletion(id='chatcmpl-8PAxGvV3GbLpnOoKSvJ00XCUdOglM', choices=[Choice(finish\_reason='stop', index=0, message=ChatCompletionMessage(content="in a faraway kingdom, there lived a young princess named Aurora. She was known for her beauty, grace, and kind heart. Aurora's kingdom was filled with lush green meadows, towering mountains, and sparkling rivers. The princess loved spending time exploring the enchanting forests surrounding her castle.\\n\\nOne day, while Aurora was wandering through the woods, she stumbled upon a hidden clearing. At the center stood a majestic oak tree, its branches reaching towards the sky. Aurora approached the tree with curiosity, and as she got closer, she noticed a small door at its base.\\n\\nIntrigued, she gently pushed open the door and was amazed to find herself in a magical realm. The forest transformed into a breathtaking wonderland, with colorful flowers blooming in every direction and woodland creatures frolicking joyously. Aurora's eyes widened with wonder as she explored this extraordinary world.\\n\\nAs she explored further, Aurora came across a small cottage in the distance. Curiosity overcame her, and she cautiously approached the cottage. To her surprise, an elderly woman with twinkling eyes and a warm smile stood in the doorway, welcoming her inside.\\n\\nThe woman revealed herself to be a fairy named Luna. Luna informed Aurora that she had been chosen to undertake a quest that would bring harmony to both her kingdom and the mystical realm. Aurora, eager to help, listened intently as Luna explained that a powerful enchantress had cast a spell on the kingdom, causing darkness and despair to loom over the land.\\n\\nTo break the curse, Aurora had to embark on a journey to retrieve a magical crystal hidden deep within the heart of an ancient cave. Without hesitation, the princess agreed and bid farewell to Luna, promising to return victorious.\\n\\nWith newfound determination, Aurora set off on her quest. Along the way, she encountered numerous challenges and obstacles but never lost hope. She often drew strength from the enchanting woodland creatures who accompanied her on this journey, reminding her that she was not alone.\\n\\nAfter a long and arduous journey, Aurora reached the entrance of the ancient cave. Inside, she faced a series of tests that pushed her physical and emotional limits. With sheer determination and unwavering courage, she overcame each trial, paving her way to the crystal's resting place.\\n\\nAs Aurora held the crystal in her hands, its warmth spread through her body. The artifact contained unimaginable power that could shatter the enchantress's curse and restore light to her kingdom. Brimming with joy and newfound strength, she made her way back to Luna's cottage.\\n\\nUpon her return, Aurora and Luna performed a powerful ritual, using the crystal's magic to break the curse. Waves of light and color spread across the kingdom, banishing darkness and despair. The once-gray skies turned blue, and laughter filled the air once again. The kingdom rejoiced, thanking Princess Aurora for her bravery and selflessness.\\n\\nFrom that day forward, Aurora was hailed as a hero, not only in her kingdom but also in the mystical realm. She continued to be a beacon of hope and kindness, reminding everyone that true courage lies within, waiting to be awakened.\\n\\nAnd so, Princess Aurora's tale lived on as a timeless reminder that even in the darkest of times, there is always light and hope to be found.", role='assistant', function\_call=None, tool\_calls=None))], created=1701011002, model='gpt-3.5-turbo-0613', object='chat.completion', system\_fingerprint=None, usage=CompletionUsage(completion\_tokens=657, prompt\_tokens=12, total\_tokens=669))`
```
### Backing off to another model
If you encounter rate limit errors on your primary model, one option is to switch to a secondary model. This approach helps keep your application responsive when your primary model is throttled or unavailable.
However, fallback models can differ significantly in accuracy, latency, and cost. As a result, this strategy might not work for every use case; particularly those requiring highly consistent results. Additionally, keep in mind that some models share rate limits, which may reduce the effectiveness of simply switching models. You can see the models that share limits in your [organizations limit page](https://platform.openai.com/settings/organization/limits).
Before deploying this approach to production, thoroughly test how it affects output quality, user experience, and operational budgets. Validate your fallback solution with relevant evaluations to ensure it meets your requirements and maintains acceptable performance under real-world conditions.
```
`def completions\_with\_fallback(fallback\_model, \*\*kwargs):
try:
return client.chat.completions.create(\*\*kwargs)
except openai.RateLimitError:
kwargs['model'] = fallback\_model
return client.chat.completions.create(\*\*kwargs)
completions\_with\_fallback(fallback\_model="gpt-4o", model="gpt-4o-mini", messages=[{"role": "user", "content": "Once upon a time,"}])`
```
```
`ChatCompletion(id='chatcmpl-AsX9Zts2toXoKA80ZujeWMXKMolBy', choices=[Choice(finish\_reason='stop', index=0, logprobs=None, message=ChatCompletionMessage(content='in a quaint little village nestled between lush green hills and sparkling blue rivers, there lived a young girl named Elara. Elara was known for her adventurous spirit and her unwavering curiosity about the world beyond her village. She often spent her days wandering the meadows, exploring the enchanted forest, and collecting wildflowers.\\n\\nOne sunny afternoon, while she was picking daisies near the edge of the forest, Elara stumbled upon an old, ornate key half-buried in the ground. Intrigued, she dusted it off and inspected it closely. The key was beautifully crafted, with intricate patterns carved into its metal. Elara felt a strange pull towards it, as if it were meant for her.\\n\\nDetermined to uncover its secrets, Elara ran back to the village, her heart racing with excitement. She gathered her closest friends—Jasper, a clever boy with a knack for puzzles, and Lila, a brave girl who loved to climb trees—and shared her discovery with them.\\n\\n"Do you think it belongs to a hidden treasure?" Jasper wondered, his eyes sparkling with mischief.\\n\\n"Or perhaps a secret door!" Lila added, her imagination running wild.\\n\\nTogether, they decided to seek out the source of the key. They combed through old tales told by the village elders, searching for any clues about a hidden door or treasure nearby. After days of excitement and exploration, they stumbled upon an ancient map tucked away in an old library. The map illustrated a long-lost castle deep within the enchanted forest, rumored to have been abandoned for centuries.\\n\\nWith the map in hand and their imaginations ignited, Elara, Jasper, and Lila set off towards the castle. The journey through the enchanted forest was filled with wonders—glowing fireflies, singing birds, and trees that seemed to whisper secrets as the wind rustled through their leaves. Eventually, they reached the castle, its crumbling walls draped in vines and mysterious shadows.\\n\\nStanding before the grand entrance, Elara held the key tightly in her hand. "This is it," she whispered, her heart pounding in anticipation. The friends exchanged nervous glances but shared the thrill of adventure. Together, they pushed open the heavy door, which creaked eerily as it swung wide.\\n\\nInside, they found a majestic hall adorned with fading tapestries and dust-laden chandeliers. In the center of the room stood a locked chest, adorned with the same intricate patterns as the key. Elara knelt beside it, her friends gathering around as she inserted the key into the lock. With a satisfying click, the chest opened to reveal a trove of shimmering jewels, ancient scrolls, and forgotten treasures.\\n\\nBut among the riches, they discovered something even more valuable—an old book filled with stories of bravery, friendship, and magic. As they turned the pages, each story seemed to echo their own journey and the spirit of adventure that had led them to this moment.\\n\\nElara, Jasper, and Lila realized that the true treasure was not the jewels or gold, but the experiences they had shared and the bond they had formed through their journey. They decided to take the book back to their village and share its tales with everyone, inspiring others to seek their own adventures and explore the wonders of the world around them.\\n\\nFrom that day forward, the trio became known as the Keepers of the Forest, guardians of the stories that connected their village to the magic of the enchanted world. And as they continued their adventures, they learned that the real magic lay within their hearts and the friendships they cherished. \\n\\nAnd so, they lived happily ever after, their spirits forever intertwined in a tapestry of tales waiting to be told.', refusal=None, role='assistant', audio=None, function\_call=None, tool\_calls=None), internal\_metrics=[{'cached\_prompt\_tokens': 0, 'total\_accepted\_tokens': 0, 'total\_batched\_tokens': 774, 'total\_predicted\_tokens': 0, 'total\_rejected\_tokens': 0, 'total\_tokens\_in\_completion': 775, 'cached\_embeddings\_bytes': 0, 'cached\_embeddings\_n': 0, 'uncached\_embeddings\_bytes': 0, 'uncached\_embeddings\_n': 0, 'fetched\_embeddings\_bytes': 0, 'fetched\_embeddings\_n': 0, 'n\_evictions': 0, 'sampling\_steps': 747, 'sampling\_steps\_with\_predictions': 0, 'batcher\_ttft': 0.08919167518615723, 'batcher\_initial\_queue\_time': 0.008681058883666992}])], created=1737560517, model='gpt-4o-mini-2024-07-18', object='chat.completion', service\_tier='default', system\_fingerprint='fp\_72ed7ab54c', usage=CompletionUsage(completion\_tokens=747, prompt\_tokens=12, total\_tokens=759, completion\_tokens\_details=CompletionTokensDetails(accepted\_prediction\_tokens=0, audio\_tokens=0, reasoning\_tokens=0, rejected\_prediction\_tokens=0), prompt\_tokens\_details=PromptTokensDetails(audio\_tokens=0, cached\_tokens=0, cached\_tokens\_internal=0)))`
```
### Reducing `max\_tokens` to match expected completions
Rate limit usage is calculated based on the greater of:
1. `max\_tokens` - the maximum number of tokens allowed in a response.
2. Estimated tokens in your input – derived from your prompt’s character count.
If you set `max\_tokens` too high, your usage can be overestimated, even if the actual response is much shorter. To avoid hitting rate limits prematurely, configure `max\_tokens` so it closely matches the size of the response you expect. This ensures more accurate usage calculations and helps prevent unintended throttling.
```
`def completions\_with\_max\_tokens(\*\*kwargs):
return client.chat.completions.create(\*\*kwargs)
completions\_with\_max\_tokens(model="gpt-4o-mini", messages=[{"role": "user", "content": "Once upon a time,"}], max\_tokens=100)`
```
```
`ChatCompletion(id='chatcmpl-Aq0JmjugPw2i232ZEZuK5inHnx6Vc', choices=[Choice(finish\_reason='length', index=0, logprobs=None, message=ChatCompletionMessage(content='in a small village nestled between lush green hills and a sparkling river, there lived a young girl named Lila. Lila was known for her boundless curiosity and adventurous spirit. She had a wild imagination, often spinning tales about the mysteries that lay beyond the village borders.\\n\\nOne day, while exploring the forest, Lila stumbled upon a hidden path she had never seen before. The path was winding and overgrown, beckoning her with whispers of adventure. Against her better judgment, she decided to', refusal=None, role='assistant', audio=None, function\_call=None, tool\_calls=None), internal\_metrics=[{'cached\_prompt\_tokens': 0, 'total\_accepted\_tokens': 0, 'total\_batched\_tokens': 127, 'total\_predicted\_tokens': 0, 'total\_rejected\_tokens': 0, 'total\_tokens\_in\_completion': 128, 'cached\_embeddings\_bytes': 0, 'cached\_embeddings\_n': 0, 'uncached\_embeddings\_bytes': 0, 'uncached\_embeddings\_n': 0, 'fetched\_embeddings\_bytes': 0, 'fetched\_embeddings\_n': 0, 'n\_evictions': 0, 'sampling\_steps': 100, 'sampling\_steps\_with\_predictions': 0, 'batcher\_ttft': 0.030033111572265625, 'batcher\_initial\_queue\_time': 0.0006170272827148438}])], created=1736957642, model='gpt-4o-mini-2024-07-18', object='chat.completion', service\_tier='default', system\_fingerprint='fp\_bd83329f63', usage=CompletionUsage(completion\_tokens=100, prompt\_tokens=12, total\_tokens=112, completion\_tokens\_details=CompletionTokensDetails(accepted\_prediction\_tokens=0, audio\_tokens=0, reasoning\_tokens=0, rejected\_prediction\_tokens=0), prompt\_tokens\_details=PromptTokensDetails(audio\_tokens=0, cached\_tokens=0, cached\_tokens\_internal=0)))`
```
## How to maximize throughput of batch processing given rate limits
If you’re processing real-time requests from users, backoff and retry is a great strategy to minimize latency while avoiding rate limit errors.
However, if you’re processing large volumes of batch data, where throughput matters more than latency, there are a few other things you can do in addition to backoff and retry.
### Proactively adding delay between requests
If you are constantly hitting the rate limit, then backing off, then hitting the rate limit again, then backing off again, it’s possible that a good fraction of your request budget will be ‘wasted’ on requests that need to be retried. This limits your processing throughput, given a fixed rate limit.
Here, one potential solution is to calculate your rate limit and add a delay equal to its reciprocal (e.g., if your rate limit 20 requests per minute, add a delay of 3–6 seconds to each request). This can help you operate near the rate limit ceiling without hitting it and incurring wasted requests.
#### Example of adding delay to a request
```
`import time
# Define a function that adds a delay to a Completion API call
def delayed\_completion(delay\_in\_seconds: float = 1, \*\*kwargs):
"""Delay a completion by a specified amount of time."""
# Sleep for the delay
time.sleep(delay\_in\_seconds)
# Call the Completion API and return the result
return client.chat.completions.create(\*\*kwargs)
# Calculate the delay based on your rate limit
rate\_limit\_per\_minute = 20
delay = 60.0 / rate\_limit\_per\_minute
delayed\_completion(
delay\_in\_seconds=delay,
model="gpt-4o-mini",
messages=[{"role": "user", "content": "Once upon a time,"}]
)`
```
```
`ChatCompletion(id='chatcmpl-8PAyCR1axKsomV0e349XiCN1Z81pH', choices=[Choice(finish\_reason='stop', index=0, message=ChatCompletionMessage(content="in a small village, there lived a young girl named Maya. Maya was known for her kindness and love for nature. She spent hours exploring the forests surrounding the village, admiring the vibrant flowers and talking to the animals.\\n\\nOne sunny day, as Maya was picking wildflowers, she stumbled upon a wounded blackbird with a broken wing. Feeling sorry for the bird, Maya gently picked it up and cradled it in her hands. She knew she had to help the bird, so she hurried back to her cottage.\\n\\nMaya set up a cozy nest for the blackbird and carefully splinted its wing. She fed it worms and berries, doing everything she could to nurse it back to health. Each day, she would sing lullabies and tell stories to keep the blackbird company. Slowly, the bird's wing healed, and before long, it was ready to fly again.\\n\\nOn a beautiful morning, Maya opened the window of her cottage and released the blackbird into the sky. As the bird soared into the air, Maya's heart filled with joy and gratitude. Little did she know, this act of kindness would change her life forever.\\n\\nThe following night, a mysterious glowing light illuminated Maya's room. Startled, she sat up and saw a magical creature standing before her. It was a fairy, tiny yet radiating warmth and light.\\n\\nThe fairy introduced herself as Luna, the Guardian of the Forest. She had witnessed Maya's kindness towards the blackbird and had been watching her ever since. Luna explained that she had come to reward Maya for her selflessness.\\n\\nWith a wave of her wand, Luna granted Maya the ability to communicate with animals. Maya's eyes widened with amazement as she realized she could now understand the language of nature. Birds chirped melodies, rabbits whispered secrets, and trees shared their ancient wisdom.\\n\\nOver time, Maya's ability made her beloved by both humans and animals. Farmers sought her advice on how to care for their crops, and children flocked to her for stories of her enchanting encounters with the forest creatures. Maya used her gift to teach others about the importance of living in harmony with nature.\\n\\nAs years passed, Maya became known as the Village Guardian. She dedicated herself to protecting the surrounding forests from harm and educating others on sustainable living. The village flourished under Maya's guidance, and animals and humans lived side by side peacefully.\\n\\nAnd so, Maya's story became a legend passed down through generations. Her kindness, love for nature, and her ability to communicate with animals inspired people to treat the world around them with compassion and care.", role='assistant', function\_call=None, tool\_calls=None))], created=1701011060, model='gpt-3.5-turbo-0613', object='chat.completion', system\_fingerprint=None, usage=CompletionUsage(completion\_tokens=524, prompt\_tokens=12, total\_tokens=536))`
```
### Batching requests
The OpenAI API enforces separate limits for requests per minute/day (RPM/RPD) and tokens per minute (TPM). If you’re hitting RPM limits but still have available TPM capacity, consider batching multiple tasks into each request.
By bundling several prompts together, you reduce the total number of requests sent per minute, which helps avoid hitting the RPM cap. This approach may also lead to higher overall throughput if you manage your TPM usage carefully. However, keep the following points in mind:
* Each model has a maximum number of tokens it can process in one request. If your batched prompt exceeds this limit, the request will fail or be truncated.
* Batching can introduce extra waiting time if tasks are delayed until they’re grouped into a single request. This might affect user experience for time-sensitive applications.
* When sending multiple prompts, the response object may not return in the same order or format as the prompts that were submitted. You should try to match each response back to its corresponding prompt by post-processing the output.
#### Example without batching
```
`num\_stories = 10
content = "Once upon a time,"
# serial example, with one story completion per request
for \_ in range(num\_stories):
response = client.chat.completions.create(
model="gpt-4o-mini",
messages=[{"role": "user", "content": content}],
max\_tokens=20,
)
print(content + response.choices[0].message.content)`
```
```
`Once upon a time,in a quaint little village nestled between rolling hills and a sparkling river, there lived a young girl named
Once upon a time,Once upon a time, in a tranquil village nestled between rolling hills and lush forests, there lived a
Once upon a time,in a lush, green valley surrounded by towering mountains, there lay a small village called Eldergrove
Once upon a time,in a quaint little village nestled between rolling hills and a sparkling river, there lived a young girl named
Once upon a time,in a small village nestled between whispering woods and a sparkling river, there lived a curious young girl
Once upon a time,in a small village nestled between a vast forest and a shimmering lake, there lived a kind-hearted girl
Once upon a time,in a quaint little village nestled between rolling hills and a shimmering lake, there lived a curious girl named
Once upon a time,in a quaint little village nestled between emerald hills and a sparkling brook, there was a curious child named
Once upon a time,in a quaint little village nestled between rolling hills and lush forests, there lived an old clockmaker named
Once upon a time,in a quaint little village nestled between rolling hills and a shimmering lake, there lived a curious young girl`
```
#### Example batching multiple prompts in a single request with Structured Outputs
OpenAI’s [Structured Outputs](https://platform.openai.com/docs/guides/structured-outputs) feature offers a robust way to batch multiple prompts in a single request.
Here, rather than parsing raw text or hoping the model follows informal formatting, you specify a strict schema. This ensures your application can reliably parse the results by examining the defined structure. This eliminates the need for extensive validation or complicated parsing logic, as Structured Outputs guarantees consistent, type-safe data.
```
`from pydantic import BaseModel
# Define the Pydantic model for the structured output
class StoryResponse(BaseModel):
stories: list[str]
story\_count: int
num\_stories = 10
content = "Once upon a time,"
prompt\_lines = [f"Story #{i+1}: {content}" for i in range(num\_stories)]
prompt\_text = "\\n".join(prompt\_lines)
messages = [
{
"role": "developer",
"content": "You are a helpful assistant. Please respond to each prompt as a separate short story."
},
{
"role": "user",
"content": prompt\_text
}
]
# batched example, with all story completions in one request and using structured outputs
response = client.beta.chat.completions.parse(
model="gpt-4o-mini",
messages=messages,
response\_format=StoryResponse,
)
print(response.choices[0].message.content)`
```
```
`{"stories":["Once upon a time, in a lush green valley, there lived a curious little fox named Felix. Every day, he would explore the woods, finding hidden glades and sparkling streams. One day, while chasing a butterfly, he stumbled upon a magical oak tree that granted wishes. Felix wished for courage and became the bravest fox in the land, helping his friends as they faced challenges together.","Once upon a time, a village known for its beautiful gardens fell into despair when a drought struck. The villagers prayed for rain but to no avail. One evening, a wise old woman arrived and told them of a hidden spring deep in the forest. With hope, the villagers embarked on a quest to find it, learning the value of teamwork and perseverance. Eventually, they found the spring, and the rain returned, reviving their gardens and spirits.","Once upon a time, in a kingdom high atop the clouds, lived Princess Lumina who had the ability to control the stars. But she felt lonely and longed for a companion. One night, she captured a shooting star and transformed it into a dashing young man named Orion. Together, they painted the night skies with adventures until Lumina learned to find joy in her own light.","Once upon a time, in a bustling bazaar in the heart of the city, there lived a clever merchant named Amina. She had a special talent for selling spices that made people fall in love. One day, a mysterious stranger entered her shop and bought a rare spice, causing an unexpected romance between two feuding families. Amina realized her spices held the power of unity, and she continued to spread love through her trade.","Once upon a time, a little turtle named Tilly dreamed of flying. Every day she watched the birds soar above her, wishing she could join them. One night, she met an old owl who shared stories of how to fly in one's heart, rather than with wings. Inspired, Tilly began to paint her dreams on shells, and soon, her colorful art attracted the birds. They carried her art into the sky, proving that dreams can take flight in unexpected ways.","Once upon a time, there was a forgotten castle hidden deep in the mountains. In this castle lived an ancient dragon named Ignis, who guarded a treasure of wisdom unlike any other. One day, a brave yet naive knight named Roland attempted to seize the treasure. But Ignis offered him a riddle instead. After solving it, Roland realized that the true treasure was knowledge and understanding. He left the castle as a wiser man, sharing Ignis's teachings with his kingdom.","Once upon a time, in a world where colors had feelings, there lived a dull gray town where nobody smiled. One day, a little girl named Bloom arrived, carrying a bright yellow paintbrush. She began to paint laughter and joy on the walls. Slowly, the townspeople found happiness in her colors and learned to express their emotions. Eventually, the town transformed into a vibrant place where every day was a celebration of life.","Once upon a time, an old clockmaker named Mr. Tick was known for creating the finest clocks in the town. But his favorite creation was an enchanted clock that could tell stories of the past. One day, a little girl named Clara stumbled into his shop and begged him to tell her a story. Mr. Tick set the clock and took her on a journey through time, where Clara learned the importance of history and family. Inspired, she decided to become a storyteller.","Once upon a time, in a small fishing village, a mysterious blue whale appeared off the coast every summer. Legend had it that the whale could grant one wish to the person who dared to swim alongside it. A daring young boy named Leo decided to brave the waters. As he swam next to the majestic creature, he wished for prosperity for his village. From that day onward, the village thrived, and they celebrated the bond of friendship with the whale every summer.","Once upon a time, in a land of giants, there lived a tiny girl named Fiona. Despite her size, she had a heart full of ambition. She dreamt of building a bridge between her village and the giants’ realm to facilitate friendship. With determination and ingenuity, she crafted a plan. When the giants saw her efforts, they helped her, and together they constructed a magnificent bridge. Fiona's courage became a legend, and the two realms flourished in harmony."],"story\_count":10}`
```
## Example parallel processing script
We’ve written an example script for parallel processing large quantities of API requests: [api\_request\_parallel\_processor.py](https://github.com/openai/openai-cookbook/blob/main/examples/api_request_parallel_processor.py).
The script combines some handy features:
* Streams requests from file, to avoid running out of memory for giant jobs
* Makes requests concurrently, to maximize throughput
* Throttles both request and token usage, to stay under rate limits
* Retries failed requests, to avoid missing data
* Logs errors, to diagnose problems with requests
Feel free to use it as is or modify it to suit your needs.