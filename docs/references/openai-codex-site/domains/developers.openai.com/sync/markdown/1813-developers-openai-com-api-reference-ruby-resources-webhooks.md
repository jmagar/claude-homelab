Webhooks | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Webhooks
##### [Unwrap](/api/reference/ruby/resources/webhooks/methods/unwrap)
webhooks.unwrap() -\> void
Function
##### ModelsExpand Collapse
class BatchCancelledWebhookEvent { id, created\_at, data, 2 more }
Sent when a batch API request has been cancelled.
id: String
The unique ID of the event.
[](<#(resource) webhooks > (model) batch_cancelled_webhook_event > (schema) > (property) id>)
created\_at: Integer
The Unix timestamp (in seconds) of when the batch API request was cancelled.
formatunixtime
[](<#(resource) webhooks > (model) batch_cancelled_webhook_event > (schema) > (property) created_at>)
data: Data{ id}
Event data payload.
id: String
The unique ID of the batch API request.
[](<#(resource) webhooks > (model) batch_cancelled_webhook_event > (schema) > (property) data > (property) id>)
[](<#(resource) webhooks > (model) batch_cancelled_webhook_event > (schema) > (property) data>)
type: :"batch.cancelled"
The type of the event. Always `batch.cancelled`.
[](<#(resource) webhooks > (model) batch_cancelled_webhook_event > (schema) > (property) type>)
object: :event
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) batch_cancelled_webhook_event > (schema) > (property) object>)
[](<#(resource) webhooks > (model) batch_cancelled_webhook_event > (schema)>)
class BatchCompletedWebhookEvent { id, created\_at, data, 2 more }
Sent when a batch API request has been completed.
id: String
The unique ID of the event.
[](<#(resource) webhooks > (model) batch_completed_webhook_event > (schema) > (property) id>)
created\_at: Integer
The Unix timestamp (in seconds) of when the batch API request was completed.
formatunixtime
[](<#(resource) webhooks > (model) batch_completed_webhook_event > (schema) > (property) created_at>)
data: Data{ id}
Event data payload.
id: String
The unique ID of the batch API request.
[](<#(resource) webhooks > (model) batch_completed_webhook_event > (schema) > (property) data > (property) id>)
[](<#(resource) webhooks > (model) batch_completed_webhook_event > (schema) > (property) data>)
type: :"batch.completed"
The type of the event. Always `batch.completed`.
[](<#(resource) webhooks > (model) batch_completed_webhook_event > (schema) > (property) type>)
object: :event
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) batch_completed_webhook_event > (schema) > (property) object>)
[](<#(resource) webhooks > (model) batch_completed_webhook_event > (schema)>)
class BatchExpiredWebhookEvent { id, created\_at, data, 2 more }
Sent when a batch API request has expired.
id: String
The unique ID of the event.
[](<#(resource) webhooks > (model) batch_expired_webhook_event > (schema) > (property) id>)
created\_at: Integer
The Unix timestamp (in seconds) of when the batch API request expired.
formatunixtime
[](<#(resource) webhooks > (model) batch_expired_webhook_event > (schema) > (property) created_at>)
data: Data{ id}
Event data payload.
id: String
The unique ID of the batch API request.
[](<#(resource) webhooks > (model) batch_expired_webhook_event > (schema) > (property) data > (property) id>)
[](<#(resource) webhooks > (model) batch_expired_webhook_event > (schema) > (property) data>)
type: :"batch.expired"
The type of the event. Always `batch.expired`.
[](<#(resource) webhooks > (model) batch_expired_webhook_event > (schema) > (property) type>)
object: :event
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) batch_expired_webhook_event > (schema) > (property) object>)
[](<#(resource) webhooks > (model) batch_expired_webhook_event > (schema)>)
class BatchFailedWebhookEvent { id, created\_at, data, 2 more }
Sent when a batch API request has failed.
id: String
The unique ID of the event.
[](<#(resource) webhooks > (model) batch_failed_webhook_event > (schema) > (property) id>)
created\_at: Integer
The Unix timestamp (in seconds) of when the batch API request failed.
formatunixtime
[](<#(resource) webhooks > (model) batch_failed_webhook_event > (schema) > (property) created_at>)
data: Data{ id}
Event data payload.
id: String
The unique ID of the batch API request.
[](<#(resource) webhooks > (model) batch_failed_webhook_event > (schema) > (property) data > (property) id>)
[](<#(resource) webhooks > (model) batch_failed_webhook_event > (schema) > (property) data>)
type: :"batch.failed"
The type of the event. Always `batch.failed`.
[](<#(resource) webhooks > (model) batch_failed_webhook_event > (schema) > (property) type>)
object: :event
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) batch_failed_webhook_event > (schema) > (property) object>)
[](<#(resource) webhooks > (model) batch_failed_webhook_event > (schema)>)
class EvalRunCanceledWebhookEvent { id, created\_at, data, 2 more }
Sent when an eval run has been canceled.
id: String
The unique ID of the event.
[](<#(resource) webhooks > (model) eval_run_canceled_webhook_event > (schema) > (property) id>)
created\_at: Integer
The Unix timestamp (in seconds) of when the eval run was canceled.
formatunixtime
[](<#(resource) webhooks > (model) eval_run_canceled_webhook_event > (schema) > (property) created_at>)
data: Data{ id}
Event data payload.
id: String
The unique ID of the eval run.
[](<#(resource) webhooks > (model) eval_run_canceled_webhook_event > (schema) > (property) data > (property) id>)
[](<#(resource) webhooks > (model) eval_run_canceled_webhook_event > (schema) > (property) data>)
type: :"eval.run.canceled"
The type of the event. Always `eval.run.canceled`.
[](<#(resource) webhooks > (model) eval_run_canceled_webhook_event > (schema) > (property) type>)
object: :event
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) eval_run_canceled_webhook_event > (schema) > (property) object>)
[](<#(resource) webhooks > (model) eval_run_canceled_webhook_event > (schema)>)
class EvalRunFailedWebhookEvent { id, created\_at, data, 2 more }
Sent when an eval run has failed.
id: String
The unique ID of the event.
[](<#(resource) webhooks > (model) eval_run_failed_webhook_event > (schema) > (property) id>)
created\_at: Integer
The Unix timestamp (in seconds) of when the eval run failed.
formatunixtime
[](<#(resource) webhooks > (model) eval_run_failed_webhook_event > (schema) > (property) created_at>)
data: Data{ id}
Event data payload.
id: String
The unique ID of the eval run.
[](<#(resource) webhooks > (model) eval_run_failed_webhook_event > (schema) > (property) data > (property) id>)
[](<#(resource) webhooks > (model) eval_run_failed_webhook_event > (schema) > (property) data>)
type: :"eval.run.failed"
The type of the event. Always `eval.run.failed`.
[](<#(resource) webhooks > (model) eval_run_failed_webhook_event > (schema) > (property) type>)
object: :event
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) eval_run_failed_webhook_event > (schema) > (property) object>)
[](<#(resource) webhooks > (model) eval_run_failed_webhook_event > (schema)>)
class EvalRunSucceededWebhookEvent { id, created\_at, data, 2 more }
Sent when an eval run has succeeded.
id: String
The unique ID of the event.
[](<#(resource) webhooks > (model) eval_run_succeeded_webhook_event > (schema) > (property) id>)
created\_at: Integer
The Unix timestamp (in seconds) of when the eval run succeeded.
formatunixtime
[](<#(resource) webhooks > (model) eval_run_succeeded_webhook_event > (schema) > (property) created_at>)
data: Data{ id}
Event data payload.
id: String
The unique ID of the eval run.
[](<#(resource) webhooks > (model) eval_run_succeeded_webhook_event > (schema) > (property) data > (property) id>)
[](<#(resource) webhooks > (model) eval_run_succeeded_webhook_event > (schema) > (property) data>)
type: :"eval.run.succeeded"
The type of the event. Always `eval.run.succeeded`.
[](<#(resource) webhooks > (model) eval_run_succeeded_webhook_event > (schema) > (property) type>)
object: :event
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) eval_run_succeeded_webhook_event > (schema) > (property) object>)
[](<#(resource) webhooks > (model) eval_run_succeeded_webhook_event > (schema)>)
class FineTuningJobCancelledWebhookEvent { id, created\_at, data, 2 more }
Sent when a fine-tuning job has been cancelled.
id: String
The unique ID of the event.
[](<#(resource) webhooks > (model) fine_tuning_job_cancelled_webhook_event > (schema) > (property) id>)
created\_at: Integer
The Unix timestamp (in seconds) of when the fine-tuning job was cancelled.
formatunixtime
[](<#(resource) webhooks > (model) fine_tuning_job_cancelled_webhook_event > (schema) > (property) created_at>)
data: Data{ id}
Event data payload.
id: String
The unique ID of the fine-tuning job.
[](<#(resource) webhooks > (model) fine_tuning_job_cancelled_webhook_event > (schema) > (property) data > (property) id>)
[](<#(resource) webhooks > (model) fine_tuning_job_cancelled_webhook_event > (schema) > (property) data>)
type: :"fine\_tuning.job.cancelled"
The type of the event. Always `fine\_tuning.job.cancelled`.
[](<#(resource) webhooks > (model) fine_tuning_job_cancelled_webhook_event > (schema) > (property) type>)
object: :event
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) fine_tuning_job_cancelled_webhook_event > (schema) > (property) object>)
[](<#(resource) webhooks > (model) fine_tuning_job_cancelled_webhook_event > (schema)>)
class FineTuningJobFailedWebhookEvent { id, created\_at, data, 2 more }
Sent when a fine-tuning job has failed.
id: String
The unique ID of the event.
[](<#(resource) webhooks > (model) fine_tuning_job_failed_webhook_event > (schema) > (property) id>)
created\_at: Integer
The Unix timestamp (in seconds) of when the fine-tuning job failed.
formatunixtime
[](<#(resource) webhooks > (model) fine_tuning_job_failed_webhook_event > (schema) > (property) created_at>)
data: Data{ id}
Event data payload.
id: String
The unique ID of the fine-tuning job.
[](<#(resource) webhooks > (model) fine_tuning_job_failed_webhook_event > (schema) > (property) data > (property) id>)
[](<#(resource) webhooks > (model) fine_tuning_job_failed_webhook_event > (schema) > (property) data>)
type: :"fine\_tuning.job.failed"
The type of the event. Always `fine\_tuning.job.failed`.
[](<#(resource) webhooks > (model) fine_tuning_job_failed_webhook_event > (schema) > (property) type>)
object: :event
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) fine_tuning_job_failed_webhook_event > (schema) > (property) object>)
[](<#(resource) webhooks > (model) fine_tuning_job_failed_webhook_event > (schema)>)
class FineTuningJobSucceededWebhookEvent { id, created\_at, data, 2 more }
Sent when a fine-tuning job has succeeded.
id: String
The unique ID of the event.
[](<#(resource) webhooks > (model) fine_tuning_job_succeeded_webhook_event > (schema) > (property) id>)
created\_at: Integer
The Unix timestamp (in seconds) of when the fine-tuning job succeeded.
formatunixtime
[](<#(resource) webhooks > (model) fine_tuning_job_succeeded_webhook_event > (schema) > (property) created_at>)
data: Data{ id}
Event data payload.
id: String
The unique ID of the fine-tuning job.
[](<#(resource) webhooks > (model) fine_tuning_job_succeeded_webhook_event > (schema) > (property) data > (property) id>)
[](<#(resource) webhooks > (model) fine_tuning_job_succeeded_webhook_event > (schema) > (property) data>)
type: :"fine\_tuning.job.succeeded"
The type of the event. Always `fine\_tuning.job.succeeded`.
[](<#(resource) webhooks > (model) fine_tuning_job_succeeded_webhook_event > (schema) > (property) type>)
object: :event
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) fine_tuning_job_succeeded_webhook_event > (schema) > (property) object>)
[](<#(resource) webhooks > (model) fine_tuning_job_succeeded_webhook_event > (schema)>)
class RealtimeCallIncomingWebhookEvent { id, created\_at, data, 2 more }
Sent when Realtime API Receives a incoming SIP call.
id: String
The unique ID of the event.
[](<#(resource) webhooks > (model) realtime_call_incoming_webhook_event > (schema) > (property) id>)
created\_at: Integer
The Unix timestamp (in seconds) of when the model response was completed.
formatunixtime
[](<#(resource) webhooks > (model) realtime_call_incoming_webhook_event > (schema) > (property) created_at>)
data: Data{ call\_id, sip\_headers}
Event data payload.
call\_id: String
The unique ID of this call.
[](<#(resource) webhooks > (model) realtime_call_incoming_webhook_event > (schema) > (property) data > (property) call_id>)
sip\_headers: Array[SipHeader{ name, value}]
Headers from the SIP Invite.
name: String
Name of the SIP Header.
[](<#(resource) webhooks > (model) realtime_call_incoming_webhook_event > (schema) > (property) data > (property) sip_headers > (items) > (property) name>)
value: String
Value of the SIP Header.
[](<#(resource) webhooks > (model) realtime_call_incoming_webhook_event > (schema) > (property) data > (property) sip_headers > (items) > (property) value>)
[](<#(resource) webhooks > (model) realtime_call_incoming_webhook_event > (schema) > (property) data > (property) sip_headers>)
[](<#(resource) webhooks > (model) realtime_call_incoming_webhook_event > (schema) > (property) data>)
type: :"realtime.call.incoming"
The type of the event. Always `realtime.call.incoming`.
[](<#(resource) webhooks > (model) realtime_call_incoming_webhook_event > (schema) > (property) type>)
object: :event
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) realtime_call_incoming_webhook_event > (schema) > (property) object>)
[](<#(resource) webhooks > (model) realtime_call_incoming_webhook_event > (schema)>)
class ResponseCancelledWebhookEvent { id, created\_at, data, 2 more }
Sent when a background response has been cancelled.
id: String
The unique ID of the event.
[](<#(resource) webhooks > (model) response_cancelled_webhook_event > (schema) > (property) id>)
created\_at: Integer
The Unix timestamp (in seconds) of when the model response was cancelled.
formatunixtime
[](<#(resource) webhooks > (model) response_cancelled_webhook_event > (schema) > (property) created_at>)
data: Data{ id}
Event data payload.
id: String
The unique ID of the model response.
[](<#(resource) webhooks > (model) response_cancelled_webhook_event > (schema) > (property) data > (property) id>)
[](<#(resource) webhooks > (model) response_cancelled_webhook_event > (schema) > (property) data>)
type: :"response.cancelled"
The type of the event. Always `response.cancelled`.
[](<#(resource) webhooks > (model) response_cancelled_webhook_event > (schema) > (property) type>)
object: :event
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) response_cancelled_webhook_event > (schema) > (property) object>)
[](<#(resource) webhooks > (model) response_cancelled_webhook_event > (schema)>)
class ResponseCompletedWebhookEvent { id, created\_at, data, 2 more }
Sent when a background response has been completed.
id: String
The unique ID of the event.
[](<#(resource) webhooks > (model) response_completed_webhook_event > (schema) > (property) id>)
created\_at: Integer
The Unix timestamp (in seconds) of when the model response was completed.
formatunixtime
[](<#(resource) webhooks > (model) response_completed_webhook_event > (schema) > (property) created_at>)
data: Data{ id}
Event data payload.
id: String
The unique ID of the model response.
[](<#(resource) webhooks > (model) response_completed_webhook_event > (schema) > (property) data > (property) id>)
[](<#(resource) webhooks > (model) response_completed_webhook_event > (schema) > (property) data>)
type: :"response.completed"
The type of the event. Always `response.completed`.
[](<#(resource) webhooks > (model) response_completed_webhook_event > (schema) > (property) type>)
object: :event
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) response_completed_webhook_event > (schema) > (property) object>)
[](<#(resource) webhooks > (model) response_completed_webhook_event > (schema)>)
class ResponseFailedWebhookEvent { id, created\_at, data, 2 more }
Sent when a background response has failed.
id: String
The unique ID of the event.
[](<#(resource) webhooks > (model) response_failed_webhook_event > (schema) > (property) id>)
created\_at: Integer
The Unix timestamp (in seconds) of when the model response failed.
formatunixtime
[](<#(resource) webhooks > (model) response_failed_webhook_event > (schema) > (property) created_at>)
data: Data{ id}
Event data payload.
id: String
The unique ID of the model response.
[](<#(resource) webhooks > (model) response_failed_webhook_event > (schema) > (property) data > (property) id>)
[](<#(resource) webhooks > (model) response_failed_webhook_event > (schema) > (property) data>)
type: :"response.failed"
The type of the event. Always `response.failed`.
[](<#(resource) webhooks > (model) response_failed_webhook_event > (schema) > (property) type>)
object: :event
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) response_failed_webhook_event > (schema) > (property) object>)
[](<#(resource) webhooks > (model) response_failed_webhook_event > (schema)>)
class ResponseIncompleteWebhookEvent { id, created\_at, data, 2 more }
Sent when a background response has been interrupted.
id: String
The unique ID of the event.
[](<#(resource) webhooks > (model) response_incomplete_webhook_event > (schema) > (property) id>)
created\_at: Integer
The Unix timestamp (in seconds) of when the model response was interrupted.
formatunixtime
[](<#(resource) webhooks > (model) response_incomplete_webhook_event > (schema) > (property) created_at>)
data: Data{ id}
Event data payload.
id: String
The unique ID of the model response.
[](<#(resource) webhooks > (model) response_incomplete_webhook_event > (schema) > (property) data > (property) id>)
[](<#(resource) webhooks > (model) response_incomplete_webhook_event > (schema) > (property) data>)
type: :"response.incomplete"
The type of the event. Always `response.incomplete`.
[](<#(resource) webhooks > (model) response_incomplete_webhook_event > (schema) > (property) type>)
object: :event
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) response_incomplete_webhook_event > (schema) > (property) object>)
[](<#(resource) webhooks > (model) response_incomplete_webhook_event > (schema)>)