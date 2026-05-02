How to automate AWS tasks with function calling
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
Sep 27, 2023
# How to automate AWS tasks with function calling
[ BA ](https://github.com/Barqawiz)
[ Barqawiz ](https://github.com/Barqawiz)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/third_party/How_to_automate_S3_storage_with_functions.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/third_party/How_to_automate_S3_storage_with_functions.ipynb)
This code demonstrates how to interact with ChatGPT functions to perform tasks related to Amazon S3 buckets. The notebook covers S3 bucket key functionalities such as running simple listing commands, searching for a specific file in all buckets, uploading a file to a bucket, and downloading a file from a bucket. The OpenAI Chat API understands the user instructions, generates the natural language responses, and extracts appropriate function calls based on the user’s input.
**Requirements**:
To run the notebook generate AWS access key with S3 bucket writing permission and store them in a local environment file alongside the Openai key. The “`.env`” file format:
```
`AWS\_ACCESS\_KEY\_ID=\<your-key\>
AWS\_SECRET\_ACCESS\_KEY=\<your-key\>
OPENAI\_API\_KEY=\<your-key\>`
```
```
`! pip install openai
! pip install boto3
! pip install tenacity
! pip install python-dotenv`
```
```
`from openai import OpenAI
import json
import boto3
import os
import datetime
from urllib.request import urlretrieve
# load environment variables
from dotenv import load\_dotenv
load\_dotenv()`
```
```
`True`
```
## Initials
```
`OpenAI.api\_key = os.environ.get("OPENAI\_API\_KEY")
GPT\_MODEL = "gpt-3.5-turbo"`
```
```
`# Optional - if you had issues loading the environment file, you can set the AWS values using the below code
# os.environ['AWS\_ACCESS\_KEY\_ID'] = ''
# os.environ['AWS\_SECRET\_ACCESS\_KEY'] = ''
# Create S3 client
s3\_client = boto3.client('s3')
# Create openai client
client = OpenAI()`
```
## Utilities
To connect user questions or commands to the appropriate function, we need to provide ChatGPT with the necessary function details and expected parameters.
```
`# Functions dict to pass S3 operations details for the GPT model
functions = [
{
"type": "function",
"function":{
"name": "list\_buckets",
"description": "List all available S3 buckets",
"parameters": {
"type": "object",
"properties": {}
}
}
},
{
"type": "function",
"function":{
"name": "list\_objects",
"description": "List the objects or files inside a given S3 bucket",
"parameters": {
"type": "object",
"properties": {
"bucket": {"type": "string", "description": "The name of the S3 bucket"},
"prefix": {"type": "string", "description": "The folder path in the S3 bucket"},
},
"required": ["bucket"],
},
}
},
{
"type": "function",
"function":{
"name": "download\_file",
"description": "Download a specific file from an S3 bucket to a local distribution folder.",
"parameters": {
"type": "object",
"properties": {
"bucket": {"type": "string", "description": "The name of the S3 bucket"},
"key": {"type": "string", "description": "The path to the file inside the bucket"},
"directory": {"type": "string", "description": "The local destination directory to download the file, should be specificed by the user."},
},
"required": ["bucket", "key", "directory"],
}
}
},
{
"type": "function",
"function":{
"name": "upload\_file",
"description": "Upload a file to an S3 bucket",
"parameters": {
"type": "object",
"properties": {
"source": {"type": "string", "description": "The local source path or remote URL"},
"bucket": {"type": "string", "description": "The name of the S3 bucket"},
"key": {"type": "string", "description": "The path to the file inside the bucket"},
"is\_remote\_url": {"type": "boolean", "description": "Is the provided source a URL (True) or local path (False)"},
},
"required": ["source", "bucket", "key", "is\_remote\_url"],
}
}
},
{
"type": "function",
"function":{
"name": "search\_s3\_objects",
"description": "Search for a specific file name inside an S3 bucket",
"parameters": {
"type": "object",
"properties": {
"search\_name": {"type": "string", "description": "The name of the file you want to search for"},
"bucket": {"type": "string", "description": "The name of the S3 bucket"},
"prefix": {"type": "string", "description": "The folder path in the S3 bucket"},
"exact\_match": {"type": "boolean", "description": "Set exact\_match to True if the search should match the exact file name. Set exact\_match to False to compare part of the file name string (the file contains)"}
},
"required": ["search\_name"],
},
}
}
]`
```
Create helper functions to interact with the S3 service, such as listing buckets, listing objects, downloading and uploading files, and searching for specific files.
```
`def datetime\_converter(obj):
if isinstance(obj, datetime.datetime):
return obj.isoformat()
raise TypeError(f"Object of type {obj.\_\_class\_\_.\_\_name\_\_} is not JSON serializable")`
```
```
`def list\_buckets():
response = s3\_client.list\_buckets()
return json.dumps(response['Buckets'], default=datetime\_converter)
def list\_objects(bucket, prefix=''):
response = s3\_client.list\_objects\_v2(Bucket=bucket, Prefix=prefix)
return json.dumps(response.get('Contents', []), default=datetime\_converter)
def download\_file(bucket, key, directory):
filename = os.path.basename(key)
# Resolve destination to the correct file path
destination = os.path.join(directory, filename)
s3\_client.download\_file(bucket, key, destination)
return json.dumps({"status": "success", "bucket": bucket, "key": key, "destination": destination})
def upload\_file(source, bucket, key, is\_remote\_url=False):
if is\_remote\_url:
file\_name = os.path.basename(source)
urlretrieve(source, file\_name)
source = file\_name
s3\_client.upload\_file(source, bucket, key)
return json.dumps({"status": "success", "source": source, "bucket": bucket, "key": key})
def search\_s3\_objects(search\_name, bucket=None, prefix='', exact\_match=True):
search\_name = search\_name.lower()
if bucket is None:
buckets\_response = json.loads(list\_buckets())
buckets = [bucket\_info["Name"] for bucket\_info in buckets\_response]
else:
buckets = [bucket]
results = []
for bucket\_name in buckets:
objects\_response = json.loads(list\_objects(bucket\_name, prefix))
if exact\_match:
bucket\_results = [obj for obj in objects\_response if search\_name == obj['Key'].lower()]
else:
bucket\_results = [obj for obj in objects\_response if search\_name in obj['Key'].lower()]
if bucket\_results:
results.extend([{"Bucket": bucket\_name, "Object": obj} for obj in bucket\_results])
return json.dumps(results)`
```
The below dictionary connects the name with the function to use it for execution based on ChatGPT responses.
```
`available\_functions = {
"list\_buckets": list\_buckets,
"list\_objects": list\_objects,
"download\_file": download\_file,
"upload\_file": upload\_file,
"search\_s3\_objects": search\_s3\_objects
}`
```
## ChatGPT
```
`def chat\_completion\_request(messages, functions=None, function\_call='auto',
model\_name=GPT\_MODEL):
if functions is not None:
return client.chat.completions.create(
model=model\_name,
messages=messages,
tools=functions,
tool\_choice=function\_call)
else:
return client.chat.completions.create(
model=model\_name,
messages=messages)`
```
### Conversation flow
Create a main function for the chatbot, which takes user input, sends it to the OpenAI Chat API, receives a response, executes any function calls generated by the API, and returns a final response to the user.
```
`def run\_conversation(user\_input, topic="S3 bucket functions.", is\_log=False):
system\_message=f"Don't make assumptions about what values to plug into functions. Ask for clarification if a user request is ambiguous. If the user ask question not related to {topic} response your scope is {topic} only."
messages = [{"role": "system", "content": system\_message},
{"role": "user", "content": user\_input}]
# Call the model to get a response
response = chat\_completion\_request(messages, functions=functions)
response\_message = response.choices[0].message
if is\_log:
print(response.choices)
# check if GPT wanted to call a function
if response\_message.tool\_calls:
function\_name = response\_message.tool\_calls[0].function.name
function\_args = json.loads(response\_message.tool\_calls[0].function.arguments)
# Call the function
function\_response = available\_functions[function\_name](\*\*function\_args)
# Add the response to the conversation
messages.append(response\_message)
messages.append({
"role": "tool",
"content": function\_response,
"tool\_call\_id": response\_message.tool\_calls[0].id,
})
# Call the model again to summarize the results
second\_response = chat\_completion\_request(messages)
final\_message = second\_response.choices[0].message.content
else:
final\_message = response\_message.content
return final\_message`
```
### S3 bucket bot testing
In the following examples, make sure to replace the placeholders such as `\<file\_name\>`, `\<bucket\_name\>`, and `\<directory\_path\>` with your specific values before execution.
#### Listing and searching
Let’s start by listing all the available buckets.
```
`print(run\_conversation('list my S3 buckets'))`
```
You can ask the assistant to search for a specific file name either in all the buckets or in a specific one.
```
`search\_file = '\<file\_name\>'
print(run\_conversation(f'search for a file {search\_file} in all buckets'))`
```
```
`search\_word = '\<file\_name\_part\>'
bucket\_name = '\<bucket\_name\>'
print(run\_conversation(f'search for a file contains {search\_word} in {bucket\_name}'))`
```
The model is expected to clarify the ask from the user in case of ambiguity in the parameters values as described in the system message.
```
`print(run\_conversation('search for a file'))`
```
```
`Sure, to help me find what you're looking for, could you please provide the name of the file you want to search for and the name of the S3 bucket? Also, should the search match the file name exactly, or should it also consider partial matches?`
```
#### Validate edge cases
We also instructed the model to reject irrelevant tasks. Let’s test it out and see how it works in action.
```
`# the model should not answer details not related to the scope
print(run\_conversation('what is the weather today'))`
```
```
`Apologies for the misunderstanding, but I am only able to assist with S3 bucket functions. Can you please ask a question related to S3 bucket functions?`
```
The provided functions are not limited to just retrieving information. They can also assist the user in uploading or downloading files.
#### Download a file
```
`search\_file = '\<file\_name\>'
bucket\_name = '\<bucket\_name\>'
local\_directory = '\<directory\_path\>'
print(run\_conversation(f'download {search\_file} from {bucket\_name} bucket to {local\_directory} directory'))`
```
#### Upload a file
```
`local\_file = '\<file\_name\>'
bucket\_name = '\<bucket\_name\>'
print(run\_conversation(f'upload {local\_file} to {bucket\_name} bucket'))`
```