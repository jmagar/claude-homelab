List fine-tuning events | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Fine Tuning](/api/reference/python/resources/fine_tuning)
[Jobs](/api/reference/python/resources/fine_tuning/subresources/jobs)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# List fine-tuning events
fine\_tuning.jobs.list\_events(strfine\_tuning\_job\_id, JobListEventsParams\*\*kwargs) -\> SyncCursorPage[[FineTuningJobEvent](</api/reference/python/resources/fine_tuning#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema)>)]
GET/fine\_tuning/jobs/{fine\_tuning\_job\_id}/events
Get status updates for a fine-tuning job.
##### ParametersExpand Collapse
fine\_tuning\_job\_id: str
[](<#(resource) fine_tuning.jobs > (method) list_events > (params) default > (param) fine_tuning_job_id > (schema)>)
after: Optional[str]
Identifier for the last event from the previous pagination request.
[](<#(resource) fine_tuning.jobs > (method) list_events > (params) default > (param) after > (schema)>)
limit: Optional[int]
Number of events to retrieve.
[](<#(resource) fine_tuning.jobs > (method) list_events > (params) default > (param) limit > (schema)>)
##### ReturnsExpand Collapse
class FineTuningJobEvent: …
Fine-tuning job event object
id: str
The object identifier.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema) > (property) id>)
created\_at: int
The Unix timestamp (in seconds) for when the fine-tuning job was created.
formatunixtime
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema) > (property) created_at>)
level: Literal["info", "warn", "error"]
The log level of the event.
One of the following:
"info"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema) > (property) level > (member) 0>)
"warn"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema) > (property) level > (member) 1>)
"error"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema) > (property) level > (member) 2>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema) > (property) level>)
message: str
The message of the event.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema) > (property) message>)
object: Literal["fine\_tuning.job.event"]
The object type, which is always “fine\_tuning.job.event”.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema) > (property) object>)
data: Optional[object]
The data associated with the event.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema) > (property) data>)
type: Optional[Literal["message", "metrics"]]
The type of event.
One of the following:
"message"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema) > (property) type > (member) 0>)
"metrics"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema) > (property) type > (member) 1>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema)>)
### List fine-tuning events
Python
HTTP
HTTP
TypeScript
TypeScript
Python
Python
Java
Java
Go
Go
Ruby
Ruby
Terraform
Terraform
```
`from openai import OpenAI
client = OpenAI()
client.fine\_tuning.jobs.list\_events(
fine\_tuning\_job\_id="ftjob-abc123",
limit=2
)
`
```
```
`{
"object": "list",
"data": [
{
"object": "fine\_tuning.job.event",
"id": "ft-event-ddTJfwuMVpfLXseO0Am0Gqjm",
"created\_at": 1721764800,
"level": "info",
"message": "Fine tuning job successfully completed",
"data": null,
"type": "message"
},
{
"object": "fine\_tuning.job.event",
"id": "ft-event-tyiGuB72evQncpH87xe505Sv",
"created\_at": 1721764800,
"level": "info",
"message": "New fine-tuned model created: ft:gpt-4o-mini:openai::7p4lURel",
"data": null,
"type": "message"
}
],
"has\_more": true
}
`
```
##### Returns Examples
```
`{
"object": "list",
"data": [
{
"object": "fine\_tuning.job.event",
"id": "ft-event-ddTJfwuMVpfLXseO0Am0Gqjm",
"created\_at": 1721764800,
"level": "info",
"message": "Fine tuning job successfully completed",
"data": null,
"type": "message"
},
{
"object": "fine\_tuning.job.event",
"id": "ft-event-tyiGuB72evQncpH87xe505Sv",
"created\_at": 1721764800,
"level": "info",
"message": "New fine-tuned model created: ft:gpt-4o-mini:openai::7p4lURel",
"data": null,
"type": "message"
}
],
"has\_more": true
}
`
```