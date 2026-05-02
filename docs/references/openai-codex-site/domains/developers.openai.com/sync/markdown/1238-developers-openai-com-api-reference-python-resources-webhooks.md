Webhooks | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Webhooks
##### [Unwrap](/api/reference/python/resources/webhooks/methods/unwrap)
webhooks.unwrap()
Function
##### ModelsExpand Collapse
class BatchCancelledWebhookEvent: …
Sent when a batch API request has been cancelled.
id: str
The unique ID of the event.
[](<#(resource) webhooks > (model) batch_cancelled_webhook_event > (schema) > (property) id>)
created\_at: int
The Unix timestamp (in seconds) of when the batch API request was cancelled.
formatunixtime
[](<#(resource) webhooks > (model) batch_cancelled_webhook_event > (schema) > (property) created_at>)
data: Data
Event data payload.
id: str
The unique ID of the batch API request.
[](<#(resource) webhooks > (model) batch_cancelled_webhook_event > (schema) > (property) data > (property) id>)
[](<#(resource) webhooks > (model) batch_cancelled_webhook_event > (schema) > (property) data>)
type: Literal["batch.cancelled"]
The type of the event. Always `batch.cancelled`.
[](<#(resource) webhooks > (model) batch_cancelled_webhook_event > (schema) > (property) type>)
object: Optional[Literal["event"]]
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) batch_cancelled_webhook_event > (schema) > (property) object>)
[](<#(resource) webhooks > (model) batch_cancelled_webhook_event > (schema)>)
class BatchCompletedWebhookEvent: …
Sent when a batch API request has been completed.
id: str
The unique ID of the event.
[](<#(resource) webhooks > (model) batch_completed_webhook_event > (schema) > (property) id>)
created\_at: int
The Unix timestamp (in seconds) of when the batch API request was completed.
formatunixtime
[](<#(resource) webhooks > (model) batch_completed_webhook_event > (schema) > (property) created_at>)
data: Data
Event data payload.
id: str
The unique ID of the batch API request.
[](<#(resource) webhooks > (model) batch_completed_webhook_event > (schema) > (property) data > (property) id>)
[](<#(resource) webhooks > (model) batch_completed_webhook_event > (schema) > (property) data>)
type: Literal["batch.completed"]
The type of the event. Always `batch.completed`.
[](<#(resource) webhooks > (model) batch_completed_webhook_event > (schema) > (property) type>)
object: Optional[Literal["event"]]
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) batch_completed_webhook_event > (schema) > (property) object>)
[](<#(resource) webhooks > (model) batch_completed_webhook_event > (schema)>)
class BatchExpiredWebhookEvent: …
Sent when a batch API request has expired.
id: str
The unique ID of the event.
[](<#(resource) webhooks > (model) batch_expired_webhook_event > (schema) > (property) id>)
created\_at: int
The Unix timestamp (in seconds) of when the batch API request expired.
formatunixtime
[](<#(resource) webhooks > (model) batch_expired_webhook_event > (schema) > (property) created_at>)
data: Data
Event data payload.
id: str
The unique ID of the batch API request.
[](<#(resource) webhooks > (model) batch_expired_webhook_event > (schema) > (property) data > (property) id>)
[](<#(resource) webhooks > (model) batch_expired_webhook_event > (schema) > (property) data>)
type: Literal["batch.expired"]
The type of the event. Always `batch.expired`.
[](<#(resource) webhooks > (model) batch_expired_webhook_event > (schema) > (property) type>)
object: Optional[Literal["event"]]
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) batch_expired_webhook_event > (schema) > (property) object>)
[](<#(resource) webhooks > (model) batch_expired_webhook_event > (schema)>)
class BatchFailedWebhookEvent: …
Sent when a batch API request has failed.
id: str
The unique ID of the event.
[](<#(resource) webhooks > (model) batch_failed_webhook_event > (schema) > (property) id>)
created\_at: int
The Unix timestamp (in seconds) of when the batch API request failed.
formatunixtime
[](<#(resource) webhooks > (model) batch_failed_webhook_event > (schema) > (property) created_at>)
data: Data
Event data payload.
id: str
The unique ID of the batch API request.
[](<#(resource) webhooks > (model) batch_failed_webhook_event > (schema) > (property) data > (property) id>)
[](<#(resource) webhooks > (model) batch_failed_webhook_event > (schema) > (property) data>)
type: Literal["batch.failed"]
The type of the event. Always `batch.failed`.
[](<#(resource) webhooks > (model) batch_failed_webhook_event > (schema) > (property) type>)
object: Optional[Literal["event"]]
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) batch_failed_webhook_event > (schema) > (property) object>)
[](<#(resource) webhooks > (model) batch_failed_webhook_event > (schema)>)
class EvalRunCanceledWebhookEvent: …
Sent when an eval run has been canceled.
id: str
The unique ID of the event.
[](<#(resource) webhooks > (model) eval_run_canceled_webhook_event > (schema) > (property) id>)
created\_at: int
The Unix timestamp (in seconds) of when the eval run was canceled.
formatunixtime
[](<#(resource) webhooks > (model) eval_run_canceled_webhook_event > (schema) > (property) created_at>)
data: Data
Event data payload.
id: str
The unique ID of the eval run.
[](<#(resource) webhooks > (model) eval_run_canceled_webhook_event > (schema) > (property) data > (property) id>)
[](<#(resource) webhooks > (model) eval_run_canceled_webhook_event > (schema) > (property) data>)
type: Literal["eval.run.canceled"]
The type of the event. Always `eval.run.canceled`.
[](<#(resource) webhooks > (model) eval_run_canceled_webhook_event > (schema) > (property) type>)
object: Optional[Literal["event"]]
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) eval_run_canceled_webhook_event > (schema) > (property) object>)
[](<#(resource) webhooks > (model) eval_run_canceled_webhook_event > (schema)>)
class EvalRunFailedWebhookEvent: …
Sent when an eval run has failed.
id: str
The unique ID of the event.
[](<#(resource) webhooks > (model) eval_run_failed_webhook_event > (schema) > (property) id>)
created\_at: int
The Unix timestamp (in seconds) of when the eval run failed.
formatunixtime
[](<#(resource) webhooks > (model) eval_run_failed_webhook_event > (schema) > (property) created_at>)
data: Data
Event data payload.
id: str
The unique ID of the eval run.
[](<#(resource) webhooks > (model) eval_run_failed_webhook_event > (schema) > (property) data > (property) id>)
[](<#(resource) webhooks > (model) eval_run_failed_webhook_event > (schema) > (property) data>)
type: Literal["eval.run.failed"]
The type of the event. Always `eval.run.failed`.
[](<#(resource) webhooks > (model) eval_run_failed_webhook_event > (schema) > (property) type>)
object: Optional[Literal["event"]]
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) eval_run_failed_webhook_event > (schema) > (property) object>)
[](<#(resource) webhooks > (model) eval_run_failed_webhook_event > (schema)>)
class EvalRunSucceededWebhookEvent: …
Sent when an eval run has succeeded.
id: str
The unique ID of the event.
[](<#(resource) webhooks > (model) eval_run_succeeded_webhook_event > (schema) > (property) id>)
created\_at: int
The Unix timestamp (in seconds) of when the eval run succeeded.
formatunixtime
[](<#(resource) webhooks > (model) eval_run_succeeded_webhook_event > (schema) > (property) created_at>)
data: Data
Event data payload.
id: str
The unique ID of the eval run.
[](<#(resource) webhooks > (model) eval_run_succeeded_webhook_event > (schema) > (property) data > (property) id>)
[](<#(resource) webhooks > (model) eval_run_succeeded_webhook_event > (schema) > (property) data>)
type: Literal["eval.run.succeeded"]
The type of the event. Always `eval.run.succeeded`.
[](<#(resource) webhooks > (model) eval_run_succeeded_webhook_event > (schema) > (property) type>)
object: Optional[Literal["event"]]
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) eval_run_succeeded_webhook_event > (schema) > (property) object>)
[](<#(resource) webhooks > (model) eval_run_succeeded_webhook_event > (schema)>)
class FineTuningJobCancelledWebhookEvent: …
Sent when a fine-tuning job has been cancelled.
id: str
The unique ID of the event.
[](<#(resource) webhooks > (model) fine_tuning_job_cancelled_webhook_event > (schema) > (property) id>)
created\_at: int
The Unix timestamp (in seconds) of when the fine-tuning job was cancelled.
formatunixtime
[](<#(resource) webhooks > (model) fine_tuning_job_cancelled_webhook_event > (schema) > (property) created_at>)
data: Data
Event data payload.
id: str
The unique ID of the fine-tuning job.
[](<#(resource) webhooks > (model) fine_tuning_job_cancelled_webhook_event > (schema) > (property) data > (property) id>)
[](<#(resource) webhooks > (model) fine_tuning_job_cancelled_webhook_event > (schema) > (property) data>)
type: Literal["fine\_tuning.job.cancelled"]
The type of the event. Always `fine\_tuning.job.cancelled`.
[](<#(resource) webhooks > (model) fine_tuning_job_cancelled_webhook_event > (schema) > (property) type>)
object: Optional[Literal["event"]]
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) fine_tuning_job_cancelled_webhook_event > (schema) > (property) object>)
[](<#(resource) webhooks > (model) fine_tuning_job_cancelled_webhook_event > (schema)>)
class FineTuningJobFailedWebhookEvent: …
Sent when a fine-tuning job has failed.
id: str
The unique ID of the event.
[](<#(resource) webhooks > (model) fine_tuning_job_failed_webhook_event > (schema) > (property) id>)
created\_at: int
The Unix timestamp (in seconds) of when the fine-tuning job failed.
formatunixtime
[](<#(resource) webhooks > (model) fine_tuning_job_failed_webhook_event > (schema) > (property) created_at>)
data: Data
Event data payload.
id: str
The unique ID of the fine-tuning job.
[](<#(resource) webhooks > (model) fine_tuning_job_failed_webhook_event > (schema) > (property) data > (property) id>)
[](<#(resource) webhooks > (model) fine_tuning_job_failed_webhook_event > (schema) > (property) data>)
type: Literal["fine\_tuning.job.failed"]
The type of the event. Always `fine\_tuning.job.failed`.
[](<#(resource) webhooks > (model) fine_tuning_job_failed_webhook_event > (schema) > (property) type>)
object: Optional[Literal["event"]]
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) fine_tuning_job_failed_webhook_event > (schema) > (property) object>)
[](<#(resource) webhooks > (model) fine_tuning_job_failed_webhook_event > (schema)>)
class FineTuningJobSucceededWebhookEvent: …
Sent when a fine-tuning job has succeeded.
id: str
The unique ID of the event.
[](<#(resource) webhooks > (model) fine_tuning_job_succeeded_webhook_event > (schema) > (property) id>)
created\_at: int
The Unix timestamp (in seconds) of when the fine-tuning job succeeded.
formatunixtime
[](<#(resource) webhooks > (model) fine_tuning_job_succeeded_webhook_event > (schema) > (property) created_at>)
data: Data
Event data payload.
id: str
The unique ID of the fine-tuning job.
[](<#(resource) webhooks > (model) fine_tuning_job_succeeded_webhook_event > (schema) > (property) data > (property) id>)
[](<#(resource) webhooks > (model) fine_tuning_job_succeeded_webhook_event > (schema) > (property) data>)
type: Literal["fine\_tuning.job.succeeded"]
The type of the event. Always `fine\_tuning.job.succeeded`.
[](<#(resource) webhooks > (model) fine_tuning_job_succeeded_webhook_event > (schema) > (property) type>)
object: Optional[Literal["event"]]
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) fine_tuning_job_succeeded_webhook_event > (schema) > (property) object>)
[](<#(resource) webhooks > (model) fine_tuning_job_succeeded_webhook_event > (schema)>)
class RealtimeCallIncomingWebhookEvent: …
Sent when Realtime API Receives a incoming SIP call.
id: str
The unique ID of the event.
[](<#(resource) webhooks > (model) realtime_call_incoming_webhook_event > (schema) > (property) id>)
created\_at: int
The Unix timestamp (in seconds) of when the model response was completed.
formatunixtime
[](<#(resource) webhooks > (model) realtime_call_incoming_webhook_event > (schema) > (property) created_at>)
data: Data
Event data payload.
call\_id: str
The unique ID of this call.
[](<#(resource) webhooks > (model) realtime_call_incoming_webhook_event > (schema) > (property) data > (property) call_id>)
sip\_headers: List[DataSipHeader]
Headers from the SIP Invite.
name: str
Name of the SIP Header.
[](<#(resource) webhooks > (model) realtime_call_incoming_webhook_event > (schema) > (property) data > (property) sip_headers > (items) > (property) name>)
value: str
Value of the SIP Header.
[](<#(resource) webhooks > (model) realtime_call_incoming_webhook_event > (schema) > (property) data > (property) sip_headers > (items) > (property) value>)
[](<#(resource) webhooks > (model) realtime_call_incoming_webhook_event > (schema) > (property) data > (property) sip_headers>)
[](<#(resource) webhooks > (model) realtime_call_incoming_webhook_event > (schema) > (property) data>)
type: Literal["realtime.call.incoming"]
The type of the event. Always `realtime.call.incoming`.
[](<#(resource) webhooks > (model) realtime_call_incoming_webhook_event > (schema) > (property) type>)
object: Optional[Literal["event"]]
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) realtime_call_incoming_webhook_event > (schema) > (property) object>)
[](<#(resource) webhooks > (model) realtime_call_incoming_webhook_event > (schema)>)
class ResponseCancelledWebhookEvent: …
Sent when a background response has been cancelled.
id: str
The unique ID of the event.
[](<#(resource) webhooks > (model) response_cancelled_webhook_event > (schema) > (property) id>)
created\_at: int
The Unix timestamp (in seconds) of when the model response was cancelled.
formatunixtime
[](<#(resource) webhooks > (model) response_cancelled_webhook_event > (schema) > (property) created_at>)
data: Data
Event data payload.
id: str
The unique ID of the model response.
[](<#(resource) webhooks > (model) response_cancelled_webhook_event > (schema) > (property) data > (property) id>)
[](<#(resource) webhooks > (model) response_cancelled_webhook_event > (schema) > (property) data>)
type: Literal["response.cancelled"]
The type of the event. Always `response.cancelled`.
[](<#(resource) webhooks > (model) response_cancelled_webhook_event > (schema) > (property) type>)
object: Optional[Literal["event"]]
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) response_cancelled_webhook_event > (schema) > (property) object>)
[](<#(resource) webhooks > (model) response_cancelled_webhook_event > (schema)>)
class ResponseCompletedWebhookEvent: …
Sent when a background response has been completed.
id: str
The unique ID of the event.
[](<#(resource) webhooks > (model) response_completed_webhook_event > (schema) > (property) id>)
created\_at: int
The Unix timestamp (in seconds) of when the model response was completed.
formatunixtime
[](<#(resource) webhooks > (model) response_completed_webhook_event > (schema) > (property) created_at>)
data: Data
Event data payload.
id: str
The unique ID of the model response.
[](<#(resource) webhooks > (model) response_completed_webhook_event > (schema) > (property) data > (property) id>)
[](<#(resource) webhooks > (model) response_completed_webhook_event > (schema) > (property) data>)
type: Literal["response.completed"]
The type of the event. Always `response.completed`.
[](<#(resource) webhooks > (model) response_completed_webhook_event > (schema) > (property) type>)
object: Optional[Literal["event"]]
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) response_completed_webhook_event > (schema) > (property) object>)
[](<#(resource) webhooks > (model) response_completed_webhook_event > (schema)>)
class ResponseFailedWebhookEvent: …
Sent when a background response has failed.
id: str
The unique ID of the event.
[](<#(resource) webhooks > (model) response_failed_webhook_event > (schema) > (property) id>)
created\_at: int
The Unix timestamp (in seconds) of when the model response failed.
formatunixtime
[](<#(resource) webhooks > (model) response_failed_webhook_event > (schema) > (property) created_at>)
data: Data
Event data payload.
id: str
The unique ID of the model response.
[](<#(resource) webhooks > (model) response_failed_webhook_event > (schema) > (property) data > (property) id>)
[](<#(resource) webhooks > (model) response_failed_webhook_event > (schema) > (property) data>)
type: Literal["response.failed"]
The type of the event. Always `response.failed`.
[](<#(resource) webhooks > (model) response_failed_webhook_event > (schema) > (property) type>)
object: Optional[Literal["event"]]
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) response_failed_webhook_event > (schema) > (property) object>)
[](<#(resource) webhooks > (model) response_failed_webhook_event > (schema)>)
class ResponseIncompleteWebhookEvent: …
Sent when a background response has been interrupted.
id: str
The unique ID of the event.
[](<#(resource) webhooks > (model) response_incomplete_webhook_event > (schema) > (property) id>)
created\_at: int
The Unix timestamp (in seconds) of when the model response was interrupted.
formatunixtime
[](<#(resource) webhooks > (model) response_incomplete_webhook_event > (schema) > (property) created_at>)
data: Data
Event data payload.
id: str
The unique ID of the model response.
[](<#(resource) webhooks > (model) response_incomplete_webhook_event > (schema) > (property) data > (property) id>)
[](<#(resource) webhooks > (model) response_incomplete_webhook_event > (schema) > (property) data>)
type: Literal["response.incomplete"]
The type of the event. Always `response.incomplete`.
[](<#(resource) webhooks > (model) response_incomplete_webhook_event > (schema) > (property) type>)
object: Optional[Literal["event"]]
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) response_incomplete_webhook_event > (schema) > (property) object>)
[](<#(resource) webhooks > (model) response_incomplete_webhook_event > (schema)>)