List fine-tuning events | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Fine Tuning](/api/reference/go/resources/fine_tuning)
[Jobs](/api/reference/go/resources/fine_tuning/subresources/jobs)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# List fine-tuning events
client.FineTuning.Jobs.ListEvents(ctx, fineTuningJobID, query) (\*CursorPage[[FineTuningJobEvent](</api/reference/go/resources/fine_tuning#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema)>)], error)
GET/fine\_tuning/jobs/{fine\_tuning\_job\_id}/events
Get status updates for a fine-tuning job.
##### ParametersExpand Collapse
fineTuningJobID string
[](<#(resource) fine_tuning.jobs > (method) list_events > (params) default > (param) fine_tuning_job_id > (schema)>)
query FineTuningJobListEventsParams
After param.Field[string]Optional
Identifier for the last event from the previous pagination request.
[](<#(resource) fine_tuning.jobs > (method) list_events > (params) default > (param) after>)
Limit param.Field[int64]Optional
Number of events to retrieve.
[](<#(resource) fine_tuning.jobs > (method) list_events > (params) default > (param) limit>)
[](<#(resource) fine_tuning.jobs > (method) list_events > (params) default>)
##### ReturnsExpand Collapse
type FineTuningJobEvent struct{…}
Fine-tuning job event object
ID string
The object identifier.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema) > (property) id>)
CreatedAt int64
The Unix timestamp (in seconds) for when the fine-tuning job was created.
formatunixtime
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema) > (property) created_at>)
Level FineTuningJobEventLevel
The log level of the event.
One of the following:
const FineTuningJobEventLevelInfo FineTuningJobEventLevel = "info"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema) > (property) level > (member) 0>)
const FineTuningJobEventLevelWarn FineTuningJobEventLevel = "warn"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema) > (property) level > (member) 1>)
const FineTuningJobEventLevelError FineTuningJobEventLevel = "error"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema) > (property) level > (member) 2>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema) > (property) level>)
Message string
The message of the event.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema) > (property) message>)
Object FineTuningJobEvent
The object type, which is always “fine\_tuning.job.event”.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema) > (property) object>)
Data anyOptional
The data associated with the event.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema) > (property) data>)
Type FineTuningJobEventTypeOptional
The type of event.
One of the following:
const FineTuningJobEventTypeMessage FineTuningJobEventType = "message"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema) > (property) type > (member) 0>)
const FineTuningJobEventTypeMetrics FineTuningJobEventType = "metrics"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema) > (property) type > (member) 1>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema)>)
### List fine-tuning events
Go
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
`package main
import (
"context"
"fmt"
"github.com/openai/openai-go"
"github.com/openai/openai-go/option"
)
func main() {
client := openai.NewClient(
option.WithAPIKey("My API Key"),
)
page, err := client.FineTuning.Jobs.ListEvents(
context.TODO(),
"ft-AF1WoRqd3aJAHsqc9NY7iL8F",
openai.FineTuningJobListEventsParams{
},
)
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", page)
}
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