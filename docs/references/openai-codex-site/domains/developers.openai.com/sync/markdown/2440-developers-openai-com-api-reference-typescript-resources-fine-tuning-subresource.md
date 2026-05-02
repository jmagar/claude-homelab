List fine-tuning events | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Fine Tuning](/api/reference/typescript/resources/fine_tuning)
[Jobs](/api/reference/typescript/resources/fine_tuning/subresources/jobs)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# List fine-tuning events
client.fineTuning.jobs.listEvents(stringfineTuningJobID, JobListEventsParams { after, limit } query?, RequestOptionsoptions?): CursorPage\<[FineTuningJobEvent](</api/reference/typescript/resources/fine_tuning#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema)>) { id, created\_at, level, 4 more } \>
GET/fine\_tuning/jobs/{fine\_tuning\_job\_id}/events
Get status updates for a fine-tuning job.
##### ParametersExpand Collapse
fineTuningJobID: string
[](<#(resource) fine_tuning.jobs > (method) list_events > (params) default > (param) fine_tuning_job_id > (schema)>)
query: JobListEventsParams { after, limit }
after?: string
Identifier for the last event from the previous pagination request.
[](<#(resource) fine_tuning.jobs > (method) list_events > (params) default > (param) after>)
limit?: number
Number of events to retrieve.
[](<#(resource) fine_tuning.jobs > (method) list_events > (params) default > (param) limit>)
[](<#(resource) fine_tuning.jobs > (method) list_events > (params) default>)
##### ReturnsExpand Collapse
FineTuningJobEvent { id, created\_at, level, 4 more }
Fine-tuning job event object
id: string
The object identifier.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema) > (property) id>)
created\_at: number
The Unix timestamp (in seconds) for when the fine-tuning job was created.
formatunixtime
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema) > (property) created_at>)
level: "info" | "warn" | "error"
The log level of the event.
One of the following:
"info"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema) > (property) level > (member) 0>)
"warn"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema) > (property) level > (member) 1>)
"error"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema) > (property) level > (member) 2>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema) > (property) level>)
message: string
The message of the event.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema) > (property) message>)
object: "fine\_tuning.job.event"
The object type, which is always “fine\_tuning.job.event”.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema) > (property) object>)
data?: unknown
The data associated with the event.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema) > (property) data>)
type?: "message" | "metrics"
The type of event.
One of the following:
"message"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema) > (property) type > (member) 0>)
"metrics"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema) > (property) type > (member) 1>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema)>)
### List fine-tuning events
TypeScript
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
`import OpenAI from "openai";
const openai = new OpenAI();
async function main() {
const list = await openai.fineTuning.list\_events(id="ftjob-abc123", limit=2);
for await (const fineTune of list) {
console.log(fineTune);
}
}
main();`
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