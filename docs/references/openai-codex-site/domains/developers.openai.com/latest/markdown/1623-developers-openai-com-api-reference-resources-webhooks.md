Webhooks events | OpenAI API Reference
[Skip to content](#_top)
Sent when a background response has been completed.
id: string
The unique ID of the event.
[](<#(resource) webhooks > (model) response_completed_webhook_event > (schema) > (property) id>)
created\_at: number
The Unix timestamp (in seconds) of when the model response was completed.
formatunixtime
[](<#(resource) webhooks > (model) response_completed_webhook_event > (schema) > (property) created_at>)
data: object { id }
Event data payload.
id: string
The unique ID of the model response.
[](<#(resource) webhooks > (model) response_completed_webhook_event > (schema) > (property) data > (property) id>)
[](<#(resource) webhooks > (model) response_completed_webhook_event > (schema) > (property) data>)
type: "response.completed"
The type of the event. Always `response.completed`.
[](<#(resource) webhooks > (model) response_completed_webhook_event > (schema) > (property) type>)
object: optional "event"
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) response_completed_webhook_event > (schema) > (property) object>)
OBJECT### response.completed
```
`{
"id": "evt\_abc123",
"type": "response.completed",
"created\_at": 1719168000,
"data": {
"id": "resp\_abc123"
}
}`
```
Sent when a background response has been cancelled.
id: string
The unique ID of the event.
[](<#(resource) webhooks > (model) response_cancelled_webhook_event > (schema) > (property) id>)
created\_at: number
The Unix timestamp (in seconds) of when the model response was cancelled.
formatunixtime
[](<#(resource) webhooks > (model) response_cancelled_webhook_event > (schema) > (property) created_at>)
data: object { id }
Event data payload.
id: string
The unique ID of the model response.
[](<#(resource) webhooks > (model) response_cancelled_webhook_event > (schema) > (property) data > (property) id>)
[](<#(resource) webhooks > (model) response_cancelled_webhook_event > (schema) > (property) data>)
type: "response.cancelled"
The type of the event. Always `response.cancelled`.
[](<#(resource) webhooks > (model) response_cancelled_webhook_event > (schema) > (property) type>)
object: optional "event"
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) response_cancelled_webhook_event > (schema) > (property) object>)
OBJECT### response.cancelled
```
`{
"id": "evt\_abc123",
"type": "response.cancelled",
"created\_at": 1719168000,
"data": {
"id": "resp\_abc123"
}
}`
```
Sent when a background response has failed.
id: string
The unique ID of the event.
[](<#(resource) webhooks > (model) response_failed_webhook_event > (schema) > (property) id>)
created\_at: number
The Unix timestamp (in seconds) of when the model response failed.
formatunixtime
[](<#(resource) webhooks > (model) response_failed_webhook_event > (schema) > (property) created_at>)
data: object { id }
Event data payload.
id: string
The unique ID of the model response.
[](<#(resource) webhooks > (model) response_failed_webhook_event > (schema) > (property) data > (property) id>)
[](<#(resource) webhooks > (model) response_failed_webhook_event > (schema) > (property) data>)
type: "response.failed"
The type of the event. Always `response.failed`.
[](<#(resource) webhooks > (model) response_failed_webhook_event > (schema) > (property) type>)
object: optional "event"
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) response_failed_webhook_event > (schema) > (property) object>)
OBJECT### response.failed
```
`{
"id": "evt\_abc123",
"type": "response.failed",
"created\_at": 1719168000,
"data": {
"id": "resp\_abc123"
}
}`
```
Sent when a background response has been interrupted.
id: string
The unique ID of the event.
[](<#(resource) webhooks > (model) response_incomplete_webhook_event > (schema) > (property) id>)
created\_at: number
The Unix timestamp (in seconds) of when the model response was interrupted.
formatunixtime
[](<#(resource) webhooks > (model) response_incomplete_webhook_event > (schema) > (property) created_at>)
data: object { id }
Event data payload.
id: string
The unique ID of the model response.
[](<#(resource) webhooks > (model) response_incomplete_webhook_event > (schema) > (property) data > (property) id>)
[](<#(resource) webhooks > (model) response_incomplete_webhook_event > (schema) > (property) data>)
type: "response.incomplete"
The type of the event. Always `response.incomplete`.
[](<#(resource) webhooks > (model) response_incomplete_webhook_event > (schema) > (property) type>)
object: optional "event"
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) response_incomplete_webhook_event > (schema) > (property) object>)
OBJECT### response.incomplete
```
`{
"id": "evt\_abc123",
"type": "response.incomplete",
"created\_at": 1719168000,
"data": {
"id": "resp\_abc123"
}
}`
```
Sent when a batch API request has been completed.
id: string
The unique ID of the event.
[](<#(resource) webhooks > (model) batch_completed_webhook_event > (schema) > (property) id>)
created\_at: number
The Unix timestamp (in seconds) of when the batch API request was completed.
formatunixtime
[](<#(resource) webhooks > (model) batch_completed_webhook_event > (schema) > (property) created_at>)
data: object { id }
Event data payload.
id: string
The unique ID of the batch API request.
[](<#(resource) webhooks > (model) batch_completed_webhook_event > (schema) > (property) data > (property) id>)
[](<#(resource) webhooks > (model) batch_completed_webhook_event > (schema) > (property) data>)
type: "batch.completed"
The type of the event. Always `batch.completed`.
[](<#(resource) webhooks > (model) batch_completed_webhook_event > (schema) > (property) type>)
object: optional "event"
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) batch_completed_webhook_event > (schema) > (property) object>)
OBJECT### batch.completed
```
`{
"id": "evt\_abc123",
"type": "batch.completed",
"created\_at": 1719168000,
"data": {
"id": "batch\_abc123"
}
}`
```
Sent when a batch API request has been cancelled.
id: string
The unique ID of the event.
[](<#(resource) webhooks > (model) batch_cancelled_webhook_event > (schema) > (property) id>)
created\_at: number
The Unix timestamp (in seconds) of when the batch API request was cancelled.
formatunixtime
[](<#(resource) webhooks > (model) batch_cancelled_webhook_event > (schema) > (property) created_at>)
data: object { id }
Event data payload.
id: string
The unique ID of the batch API request.
[](<#(resource) webhooks > (model) batch_cancelled_webhook_event > (schema) > (property) data > (property) id>)
[](<#(resource) webhooks > (model) batch_cancelled_webhook_event > (schema) > (property) data>)
type: "batch.cancelled"
The type of the event. Always `batch.cancelled`.
[](<#(resource) webhooks > (model) batch_cancelled_webhook_event > (schema) > (property) type>)
object: optional "event"
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) batch_cancelled_webhook_event > (schema) > (property) object>)
OBJECT### batch.cancelled
```
`{
"id": "evt\_abc123",
"type": "batch.cancelled",
"created\_at": 1719168000,
"data": {
"id": "batch\_abc123"
}
}`
```
Sent when a batch API request has expired.
id: string
The unique ID of the event.
[](<#(resource) webhooks > (model) batch_expired_webhook_event > (schema) > (property) id>)
created\_at: number
The Unix timestamp (in seconds) of when the batch API request expired.
formatunixtime
[](<#(resource) webhooks > (model) batch_expired_webhook_event > (schema) > (property) created_at>)
data: object { id }
Event data payload.
id: string
The unique ID of the batch API request.
[](<#(resource) webhooks > (model) batch_expired_webhook_event > (schema) > (property) data > (property) id>)
[](<#(resource) webhooks > (model) batch_expired_webhook_event > (schema) > (property) data>)
type: "batch.expired"
The type of the event. Always `batch.expired`.
[](<#(resource) webhooks > (model) batch_expired_webhook_event > (schema) > (property) type>)
object: optional "event"
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) batch_expired_webhook_event > (schema) > (property) object>)
OBJECT### batch.expired
```
`{
"id": "evt\_abc123",
"type": "batch.expired",
"created\_at": 1719168000,
"data": {
"id": "batch\_abc123"
}
}`
```
Sent when a batch API request has failed.
id: string
The unique ID of the event.
[](<#(resource) webhooks > (model) batch_failed_webhook_event > (schema) > (property) id>)
created\_at: number
The Unix timestamp (in seconds) of when the batch API request failed.
formatunixtime
[](<#(resource) webhooks > (model) batch_failed_webhook_event > (schema) > (property) created_at>)
data: object { id }
Event data payload.
id: string
The unique ID of the batch API request.
[](<#(resource) webhooks > (model) batch_failed_webhook_event > (schema) > (property) data > (property) id>)
[](<#(resource) webhooks > (model) batch_failed_webhook_event > (schema) > (property) data>)
type: "batch.failed"
The type of the event. Always `batch.failed`.
[](<#(resource) webhooks > (model) batch_failed_webhook_event > (schema) > (property) type>)
object: optional "event"
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) batch_failed_webhook_event > (schema) > (property) object>)
OBJECT### batch.failed
```
`{
"id": "evt\_abc123",
"type": "batch.failed",
"created\_at": 1719168000,
"data": {
"id": "batch\_abc123"
}
}`
```
Sent when a fine-tuning job has succeeded.
id: string
The unique ID of the event.
[](<#(resource) webhooks > (model) fine_tuning_job_succeeded_webhook_event > (schema) > (property) id>)
created\_at: number
The Unix timestamp (in seconds) of when the fine-tuning job succeeded.
formatunixtime
[](<#(resource) webhooks > (model) fine_tuning_job_succeeded_webhook_event > (schema) > (property) created_at>)
data: object { id }
Event data payload.
id: string
The unique ID of the fine-tuning job.
[](<#(resource) webhooks > (model) fine_tuning_job_succeeded_webhook_event > (schema) > (property) data > (property) id>)
[](<#(resource) webhooks > (model) fine_tuning_job_succeeded_webhook_event > (schema) > (property) data>)
type: "fine\_tuning.job.succeeded"
The type of the event. Always `fine\_tuning.job.succeeded`.
[](<#(resource) webhooks > (model) fine_tuning_job_succeeded_webhook_event > (schema) > (property) type>)
object: optional "event"
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) fine_tuning_job_succeeded_webhook_event > (schema) > (property) object>)
OBJECT### fine\_tuning.job.succeeded
```
`{
"id": "evt\_abc123",
"type": "fine\_tuning.job.succeeded",
"created\_at": 1719168000,
"data": {
"id": "ftjob\_abc123"
}
}`
```
Sent when a fine-tuning job has failed.
id: string
The unique ID of the event.
[](<#(resource) webhooks > (model) fine_tuning_job_failed_webhook_event > (schema) > (property) id>)
created\_at: number
The Unix timestamp (in seconds) of when the fine-tuning job failed.
formatunixtime
[](<#(resource) webhooks > (model) fine_tuning_job_failed_webhook_event > (schema) > (property) created_at>)
data: object { id }
Event data payload.
id: string
The unique ID of the fine-tuning job.
[](<#(resource) webhooks > (model) fine_tuning_job_failed_webhook_event > (schema) > (property) data > (property) id>)
[](<#(resource) webhooks > (model) fine_tuning_job_failed_webhook_event > (schema) > (property) data>)
type: "fine\_tuning.job.failed"
The type of the event. Always `fine\_tuning.job.failed`.
[](<#(resource) webhooks > (model) fine_tuning_job_failed_webhook_event > (schema) > (property) type>)
object: optional "event"
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) fine_tuning_job_failed_webhook_event > (schema) > (property) object>)
OBJECT### fine\_tuning.job.failed
```
`{
"id": "evt\_abc123",
"type": "fine\_tuning.job.failed",
"created\_at": 1719168000,
"data": {
"id": "ftjob\_abc123"
}
}`
```
Sent when a fine-tuning job has been cancelled.
id: string
The unique ID of the event.
[](<#(resource) webhooks > (model) fine_tuning_job_cancelled_webhook_event > (schema) > (property) id>)
created\_at: number
The Unix timestamp (in seconds) of when the fine-tuning job was cancelled.
formatunixtime
[](<#(resource) webhooks > (model) fine_tuning_job_cancelled_webhook_event > (schema) > (property) created_at>)
data: object { id }
Event data payload.
id: string
The unique ID of the fine-tuning job.
[](<#(resource) webhooks > (model) fine_tuning_job_cancelled_webhook_event > (schema) > (property) data > (property) id>)
[](<#(resource) webhooks > (model) fine_tuning_job_cancelled_webhook_event > (schema) > (property) data>)
type: "fine\_tuning.job.cancelled"
The type of the event. Always `fine\_tuning.job.cancelled`.
[](<#(resource) webhooks > (model) fine_tuning_job_cancelled_webhook_event > (schema) > (property) type>)
object: optional "event"
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) fine_tuning_job_cancelled_webhook_event > (schema) > (property) object>)
OBJECT### fine\_tuning.job.cancelled
```
`{
"id": "evt\_abc123",
"type": "fine\_tuning.job.cancelled",
"created\_at": 1719168000,
"data": {
"id": "ftjob\_abc123"
}
}`
```
Sent when an eval run has succeeded.
id: string
The unique ID of the event.
[](<#(resource) webhooks > (model) eval_run_succeeded_webhook_event > (schema) > (property) id>)
created\_at: number
The Unix timestamp (in seconds) of when the eval run succeeded.
formatunixtime
[](<#(resource) webhooks > (model) eval_run_succeeded_webhook_event > (schema) > (property) created_at>)
data: object { id }
Event data payload.
id: string
The unique ID of the eval run.
[](<#(resource) webhooks > (model) eval_run_succeeded_webhook_event > (schema) > (property) data > (property) id>)
[](<#(resource) webhooks > (model) eval_run_succeeded_webhook_event > (schema) > (property) data>)
type: "eval.run.succeeded"
The type of the event. Always `eval.run.succeeded`.
[](<#(resource) webhooks > (model) eval_run_succeeded_webhook_event > (schema) > (property) type>)
object: optional "event"
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) eval_run_succeeded_webhook_event > (schema) > (property) object>)
OBJECT### eval.run.succeeded
```
`{
"id": "evt\_abc123",
"type": "eval.run.succeeded",
"created\_at": 1719168000,
"data": {
"id": "evalrun\_abc123"
}
}`
```
Sent when an eval run has failed.
id: string
The unique ID of the event.
[](<#(resource) webhooks > (model) eval_run_failed_webhook_event > (schema) > (property) id>)
created\_at: number
The Unix timestamp (in seconds) of when the eval run failed.
formatunixtime
[](<#(resource) webhooks > (model) eval_run_failed_webhook_event > (schema) > (property) created_at>)
data: object { id }
Event data payload.
id: string
The unique ID of the eval run.
[](<#(resource) webhooks > (model) eval_run_failed_webhook_event > (schema) > (property) data > (property) id>)
[](<#(resource) webhooks > (model) eval_run_failed_webhook_event > (schema) > (property) data>)
type: "eval.run.failed"
The type of the event. Always `eval.run.failed`.
[](<#(resource) webhooks > (model) eval_run_failed_webhook_event > (schema) > (property) type>)
object: optional "event"
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) eval_run_failed_webhook_event > (schema) > (property) object>)
OBJECT### eval.run.failed
```
`{
"id": "evt\_abc123",
"type": "eval.run.failed",
"created\_at": 1719168000,
"data": {
"id": "evalrun\_abc123"
}
}`
```
Sent when an eval run has been canceled.
id: string
The unique ID of the event.
[](<#(resource) webhooks > (model) eval_run_canceled_webhook_event > (schema) > (property) id>)
created\_at: number
The Unix timestamp (in seconds) of when the eval run was canceled.
formatunixtime
[](<#(resource) webhooks > (model) eval_run_canceled_webhook_event > (schema) > (property) created_at>)
data: object { id }
Event data payload.
id: string
The unique ID of the eval run.
[](<#(resource) webhooks > (model) eval_run_canceled_webhook_event > (schema) > (property) data > (property) id>)
[](<#(resource) webhooks > (model) eval_run_canceled_webhook_event > (schema) > (property) data>)
type: "eval.run.canceled"
The type of the event. Always `eval.run.canceled`.
[](<#(resource) webhooks > (model) eval_run_canceled_webhook_event > (schema) > (property) type>)
object: optional "event"
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) eval_run_canceled_webhook_event > (schema) > (property) object>)
OBJECT### eval.run.canceled
```
`{
"id": "evt\_abc123",
"type": "eval.run.canceled",
"created\_at": 1719168000,
"data": {
"id": "evalrun\_abc123"
}
}`
```
Sent when Realtime API Receives a incoming SIP call.
id: string
The unique ID of the event.
[](<#(resource) webhooks > (model) realtime_call_incoming_webhook_event > (schema) > (property) id>)
created\_at: number
The Unix timestamp (in seconds) of when the model response was completed.
formatunixtime
[](<#(resource) webhooks > (model) realtime_call_incoming_webhook_event > (schema) > (property) created_at>)
data: object { call\_id, sip\_headers }
Event data payload.
call\_id: string
The unique ID of this call.
[](<#(resource) webhooks > (model) realtime_call_incoming_webhook_event > (schema) > (property) data > (property) call_id>)
sip\_headers: array of object { name, value }
Headers from the SIP Invite.
name: string
Name of the SIP Header.
[](<#(resource) webhooks > (model) realtime_call_incoming_webhook_event > (schema) > (property) data > (property) sip_headers > (items) > (property) name>)
value: string
Value of the SIP Header.
[](<#(resource) webhooks > (model) realtime_call_incoming_webhook_event > (schema) > (property) data > (property) sip_headers > (items) > (property) value>)
[](<#(resource) webhooks > (model) realtime_call_incoming_webhook_event > (schema) > (property) data > (property) sip_headers>)
[](<#(resource) webhooks > (model) realtime_call_incoming_webhook_event > (schema) > (property) data>)
type: "realtime.call.incoming"
The type of the event. Always `realtime.call.incoming`.
[](<#(resource) webhooks > (model) realtime_call_incoming_webhook_event > (schema) > (property) type>)
object: optional "event"
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) realtime_call_incoming_webhook_event > (schema) > (property) object>)
OBJECT### realtime.call.incoming
```
`{
"id": "evt\_abc123",
"type": "realtime.call.incoming",
"created\_at": 1719168000,
"data": {
"call\_id": "rtc\_479a275623b54bdb9b6fbae2f7cbd408",
"sip\_headers": [
{"name": "Max-Forwards", "value": "63"},
{"name": "CSeq", "value": "851287 INVITE"},
{"name": "Content-Type", "value": "application/sdp"},
]
}
}`
```