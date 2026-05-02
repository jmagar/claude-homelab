Webhooks | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Webhooks
##### ModelsExpand Collapse
class BatchCancelledWebhookEvent:
Sent when a batch API request has been cancelled.
String id
The unique ID of the event.
[](<#(resource) webhooks > (model) batch_cancelled_webhook_event > (schema) > (property) id>)
long createdAt
The Unix timestamp (in seconds) of when the batch API request was cancelled.
formatunixtime
[](<#(resource) webhooks > (model) batch_cancelled_webhook_event > (schema) > (property) created_at>)
Data data
Event data payload.
String id
The unique ID of the batch API request.
[](<#(resource) webhooks > (model) batch_cancelled_webhook_event > (schema) > (property) data > (property) id>)
[](<#(resource) webhooks > (model) batch_cancelled_webhook_event > (schema) > (property) data>)
JsonValue; type "batch.cancelled"constant"batch.cancelled"constant
The type of the event. Always `batch.cancelled`.
[](<#(resource) webhooks > (model) batch_cancelled_webhook_event > (schema) > (property) type>)
Optional\<Object\> object\_
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) batch_cancelled_webhook_event > (schema) > (property) object>)
[](<#(resource) webhooks > (model) batch_cancelled_webhook_event > (schema)>)
class BatchCompletedWebhookEvent:
Sent when a batch API request has been completed.
String id
The unique ID of the event.
[](<#(resource) webhooks > (model) batch_completed_webhook_event > (schema) > (property) id>)
long createdAt
The Unix timestamp (in seconds) of when the batch API request was completed.
formatunixtime
[](<#(resource) webhooks > (model) batch_completed_webhook_event > (schema) > (property) created_at>)
Data data
Event data payload.
String id
The unique ID of the batch API request.
[](<#(resource) webhooks > (model) batch_completed_webhook_event > (schema) > (property) data > (property) id>)
[](<#(resource) webhooks > (model) batch_completed_webhook_event > (schema) > (property) data>)
JsonValue; type "batch.completed"constant"batch.completed"constant
The type of the event. Always `batch.completed`.
[](<#(resource) webhooks > (model) batch_completed_webhook_event > (schema) > (property) type>)
Optional\<Object\> object\_
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) batch_completed_webhook_event > (schema) > (property) object>)
[](<#(resource) webhooks > (model) batch_completed_webhook_event > (schema)>)
class BatchExpiredWebhookEvent:
Sent when a batch API request has expired.
String id
The unique ID of the event.
[](<#(resource) webhooks > (model) batch_expired_webhook_event > (schema) > (property) id>)
long createdAt
The Unix timestamp (in seconds) of when the batch API request expired.
formatunixtime
[](<#(resource) webhooks > (model) batch_expired_webhook_event > (schema) > (property) created_at>)
Data data
Event data payload.
String id
The unique ID of the batch API request.
[](<#(resource) webhooks > (model) batch_expired_webhook_event > (schema) > (property) data > (property) id>)
[](<#(resource) webhooks > (model) batch_expired_webhook_event > (schema) > (property) data>)
JsonValue; type "batch.expired"constant"batch.expired"constant
The type of the event. Always `batch.expired`.
[](<#(resource) webhooks > (model) batch_expired_webhook_event > (schema) > (property) type>)
Optional\<Object\> object\_
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) batch_expired_webhook_event > (schema) > (property) object>)
[](<#(resource) webhooks > (model) batch_expired_webhook_event > (schema)>)
class BatchFailedWebhookEvent:
Sent when a batch API request has failed.
String id
The unique ID of the event.
[](<#(resource) webhooks > (model) batch_failed_webhook_event > (schema) > (property) id>)
long createdAt
The Unix timestamp (in seconds) of when the batch API request failed.
formatunixtime
[](<#(resource) webhooks > (model) batch_failed_webhook_event > (schema) > (property) created_at>)
Data data
Event data payload.
String id
The unique ID of the batch API request.
[](<#(resource) webhooks > (model) batch_failed_webhook_event > (schema) > (property) data > (property) id>)
[](<#(resource) webhooks > (model) batch_failed_webhook_event > (schema) > (property) data>)
JsonValue; type "batch.failed"constant"batch.failed"constant
The type of the event. Always `batch.failed`.
[](<#(resource) webhooks > (model) batch_failed_webhook_event > (schema) > (property) type>)
Optional\<Object\> object\_
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) batch_failed_webhook_event > (schema) > (property) object>)
[](<#(resource) webhooks > (model) batch_failed_webhook_event > (schema)>)
class EvalRunCanceledWebhookEvent:
Sent when an eval run has been canceled.
String id
The unique ID of the event.
[](<#(resource) webhooks > (model) eval_run_canceled_webhook_event > (schema) > (property) id>)
long createdAt
The Unix timestamp (in seconds) of when the eval run was canceled.
formatunixtime
[](<#(resource) webhooks > (model) eval_run_canceled_webhook_event > (schema) > (property) created_at>)
Data data
Event data payload.
String id
The unique ID of the eval run.
[](<#(resource) webhooks > (model) eval_run_canceled_webhook_event > (schema) > (property) data > (property) id>)
[](<#(resource) webhooks > (model) eval_run_canceled_webhook_event > (schema) > (property) data>)
JsonValue; type "eval.run.canceled"constant"eval.run.canceled"constant
The type of the event. Always `eval.run.canceled`.
[](<#(resource) webhooks > (model) eval_run_canceled_webhook_event > (schema) > (property) type>)
Optional\<Object\> object\_
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) eval_run_canceled_webhook_event > (schema) > (property) object>)
[](<#(resource) webhooks > (model) eval_run_canceled_webhook_event > (schema)>)
class EvalRunFailedWebhookEvent:
Sent when an eval run has failed.
String id
The unique ID of the event.
[](<#(resource) webhooks > (model) eval_run_failed_webhook_event > (schema) > (property) id>)
long createdAt
The Unix timestamp (in seconds) of when the eval run failed.
formatunixtime
[](<#(resource) webhooks > (model) eval_run_failed_webhook_event > (schema) > (property) created_at>)
Data data
Event data payload.
String id
The unique ID of the eval run.
[](<#(resource) webhooks > (model) eval_run_failed_webhook_event > (schema) > (property) data > (property) id>)
[](<#(resource) webhooks > (model) eval_run_failed_webhook_event > (schema) > (property) data>)
JsonValue; type "eval.run.failed"constant"eval.run.failed"constant
The type of the event. Always `eval.run.failed`.
[](<#(resource) webhooks > (model) eval_run_failed_webhook_event > (schema) > (property) type>)
Optional\<Object\> object\_
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) eval_run_failed_webhook_event > (schema) > (property) object>)
[](<#(resource) webhooks > (model) eval_run_failed_webhook_event > (schema)>)
class EvalRunSucceededWebhookEvent:
Sent when an eval run has succeeded.
String id
The unique ID of the event.
[](<#(resource) webhooks > (model) eval_run_succeeded_webhook_event > (schema) > (property) id>)
long createdAt
The Unix timestamp (in seconds) of when the eval run succeeded.
formatunixtime
[](<#(resource) webhooks > (model) eval_run_succeeded_webhook_event > (schema) > (property) created_at>)
Data data
Event data payload.
String id
The unique ID of the eval run.
[](<#(resource) webhooks > (model) eval_run_succeeded_webhook_event > (schema) > (property) data > (property) id>)
[](<#(resource) webhooks > (model) eval_run_succeeded_webhook_event > (schema) > (property) data>)
JsonValue; type "eval.run.succeeded"constant"eval.run.succeeded"constant
The type of the event. Always `eval.run.succeeded`.
[](<#(resource) webhooks > (model) eval_run_succeeded_webhook_event > (schema) > (property) type>)
Optional\<Object\> object\_
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) eval_run_succeeded_webhook_event > (schema) > (property) object>)
[](<#(resource) webhooks > (model) eval_run_succeeded_webhook_event > (schema)>)
class FineTuningJobCancelledWebhookEvent:
Sent when a fine-tuning job has been cancelled.
String id
The unique ID of the event.
[](<#(resource) webhooks > (model) fine_tuning_job_cancelled_webhook_event > (schema) > (property) id>)
long createdAt
The Unix timestamp (in seconds) of when the fine-tuning job was cancelled.
formatunixtime
[](<#(resource) webhooks > (model) fine_tuning_job_cancelled_webhook_event > (schema) > (property) created_at>)
Data data
Event data payload.
String id
The unique ID of the fine-tuning job.
[](<#(resource) webhooks > (model) fine_tuning_job_cancelled_webhook_event > (schema) > (property) data > (property) id>)
[](<#(resource) webhooks > (model) fine_tuning_job_cancelled_webhook_event > (schema) > (property) data>)
JsonValue; type "fine\_tuning.job.cancelled"constant"fine\_tuning.job.cancelled"constant
The type of the event. Always `fine\_tuning.job.cancelled`.
[](<#(resource) webhooks > (model) fine_tuning_job_cancelled_webhook_event > (schema) > (property) type>)
Optional\<Object\> object\_
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) fine_tuning_job_cancelled_webhook_event > (schema) > (property) object>)
[](<#(resource) webhooks > (model) fine_tuning_job_cancelled_webhook_event > (schema)>)
class FineTuningJobFailedWebhookEvent:
Sent when a fine-tuning job has failed.
String id
The unique ID of the event.
[](<#(resource) webhooks > (model) fine_tuning_job_failed_webhook_event > (schema) > (property) id>)
long createdAt
The Unix timestamp (in seconds) of when the fine-tuning job failed.
formatunixtime
[](<#(resource) webhooks > (model) fine_tuning_job_failed_webhook_event > (schema) > (property) created_at>)
Data data
Event data payload.
String id
The unique ID of the fine-tuning job.
[](<#(resource) webhooks > (model) fine_tuning_job_failed_webhook_event > (schema) > (property) data > (property) id>)
[](<#(resource) webhooks > (model) fine_tuning_job_failed_webhook_event > (schema) > (property) data>)
JsonValue; type "fine\_tuning.job.failed"constant"fine\_tuning.job.failed"constant
The type of the event. Always `fine\_tuning.job.failed`.
[](<#(resource) webhooks > (model) fine_tuning_job_failed_webhook_event > (schema) > (property) type>)
Optional\<Object\> object\_
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) fine_tuning_job_failed_webhook_event > (schema) > (property) object>)
[](<#(resource) webhooks > (model) fine_tuning_job_failed_webhook_event > (schema)>)
class FineTuningJobSucceededWebhookEvent:
Sent when a fine-tuning job has succeeded.
String id
The unique ID of the event.
[](<#(resource) webhooks > (model) fine_tuning_job_succeeded_webhook_event > (schema) > (property) id>)
long createdAt
The Unix timestamp (in seconds) of when the fine-tuning job succeeded.
formatunixtime
[](<#(resource) webhooks > (model) fine_tuning_job_succeeded_webhook_event > (schema) > (property) created_at>)
Data data
Event data payload.
String id
The unique ID of the fine-tuning job.
[](<#(resource) webhooks > (model) fine_tuning_job_succeeded_webhook_event > (schema) > (property) data > (property) id>)
[](<#(resource) webhooks > (model) fine_tuning_job_succeeded_webhook_event > (schema) > (property) data>)
JsonValue; type "fine\_tuning.job.succeeded"constant"fine\_tuning.job.succeeded"constant
The type of the event. Always `fine\_tuning.job.succeeded`.
[](<#(resource) webhooks > (model) fine_tuning_job_succeeded_webhook_event > (schema) > (property) type>)
Optional\<Object\> object\_
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) fine_tuning_job_succeeded_webhook_event > (schema) > (property) object>)
[](<#(resource) webhooks > (model) fine_tuning_job_succeeded_webhook_event > (schema)>)
class RealtimeCallIncomingWebhookEvent:
Sent when Realtime API Receives a incoming SIP call.
String id
The unique ID of the event.
[](<#(resource) webhooks > (model) realtime_call_incoming_webhook_event > (schema) > (property) id>)
long createdAt
The Unix timestamp (in seconds) of when the model response was completed.
formatunixtime
[](<#(resource) webhooks > (model) realtime_call_incoming_webhook_event > (schema) > (property) created_at>)
Data data
Event data payload.
String callId
The unique ID of this call.
[](<#(resource) webhooks > (model) realtime_call_incoming_webhook_event > (schema) > (property) data > (property) call_id>)
List\<SipHeader\> sipHeaders
Headers from the SIP Invite.
String name
Name of the SIP Header.
[](<#(resource) webhooks > (model) realtime_call_incoming_webhook_event > (schema) > (property) data > (property) sip_headers > (items) > (property) name>)
String value
Value of the SIP Header.
[](<#(resource) webhooks > (model) realtime_call_incoming_webhook_event > (schema) > (property) data > (property) sip_headers > (items) > (property) value>)
[](<#(resource) webhooks > (model) realtime_call_incoming_webhook_event > (schema) > (property) data > (property) sip_headers>)
[](<#(resource) webhooks > (model) realtime_call_incoming_webhook_event > (schema) > (property) data>)
JsonValue; type "realtime.call.incoming"constant"realtime.call.incoming"constant
The type of the event. Always `realtime.call.incoming`.
[](<#(resource) webhooks > (model) realtime_call_incoming_webhook_event > (schema) > (property) type>)
Optional\<Object\> object\_
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) realtime_call_incoming_webhook_event > (schema) > (property) object>)
[](<#(resource) webhooks > (model) realtime_call_incoming_webhook_event > (schema)>)
class ResponseCancelledWebhookEvent:
Sent when a background response has been cancelled.
String id
The unique ID of the event.
[](<#(resource) webhooks > (model) response_cancelled_webhook_event > (schema) > (property) id>)
long createdAt
The Unix timestamp (in seconds) of when the model response was cancelled.
formatunixtime
[](<#(resource) webhooks > (model) response_cancelled_webhook_event > (schema) > (property) created_at>)
Data data
Event data payload.
String id
The unique ID of the model response.
[](<#(resource) webhooks > (model) response_cancelled_webhook_event > (schema) > (property) data > (property) id>)
[](<#(resource) webhooks > (model) response_cancelled_webhook_event > (schema) > (property) data>)
JsonValue; type "response.cancelled"constant"response.cancelled"constant
The type of the event. Always `response.cancelled`.
[](<#(resource) webhooks > (model) response_cancelled_webhook_event > (schema) > (property) type>)
Optional\<Object\> object\_
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) response_cancelled_webhook_event > (schema) > (property) object>)
[](<#(resource) webhooks > (model) response_cancelled_webhook_event > (schema)>)
class ResponseCompletedWebhookEvent:
Sent when a background response has been completed.
String id
The unique ID of the event.
[](<#(resource) webhooks > (model) response_completed_webhook_event > (schema) > (property) id>)
long createdAt
The Unix timestamp (in seconds) of when the model response was completed.
formatunixtime
[](<#(resource) webhooks > (model) response_completed_webhook_event > (schema) > (property) created_at>)
Data data
Event data payload.
String id
The unique ID of the model response.
[](<#(resource) webhooks > (model) response_completed_webhook_event > (schema) > (property) data > (property) id>)
[](<#(resource) webhooks > (model) response_completed_webhook_event > (schema) > (property) data>)
JsonValue; type "response.completed"constant"response.completed"constant
The type of the event. Always `response.completed`.
[](<#(resource) webhooks > (model) response_completed_webhook_event > (schema) > (property) type>)
Optional\<Object\> object\_
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) response_completed_webhook_event > (schema) > (property) object>)
[](<#(resource) webhooks > (model) response_completed_webhook_event > (schema)>)
class ResponseFailedWebhookEvent:
Sent when a background response has failed.
String id
The unique ID of the event.
[](<#(resource) webhooks > (model) response_failed_webhook_event > (schema) > (property) id>)
long createdAt
The Unix timestamp (in seconds) of when the model response failed.
formatunixtime
[](<#(resource) webhooks > (model) response_failed_webhook_event > (schema) > (property) created_at>)
Data data
Event data payload.
String id
The unique ID of the model response.
[](<#(resource) webhooks > (model) response_failed_webhook_event > (schema) > (property) data > (property) id>)
[](<#(resource) webhooks > (model) response_failed_webhook_event > (schema) > (property) data>)
JsonValue; type "response.failed"constant"response.failed"constant
The type of the event. Always `response.failed`.
[](<#(resource) webhooks > (model) response_failed_webhook_event > (schema) > (property) type>)
Optional\<Object\> object\_
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) response_failed_webhook_event > (schema) > (property) object>)
[](<#(resource) webhooks > (model) response_failed_webhook_event > (schema)>)
class ResponseIncompleteWebhookEvent:
Sent when a background response has been interrupted.
String id
The unique ID of the event.
[](<#(resource) webhooks > (model) response_incomplete_webhook_event > (schema) > (property) id>)
long createdAt
The Unix timestamp (in seconds) of when the model response was interrupted.
formatunixtime
[](<#(resource) webhooks > (model) response_incomplete_webhook_event > (schema) > (property) created_at>)
Data data
Event data payload.
String id
The unique ID of the model response.
[](<#(resource) webhooks > (model) response_incomplete_webhook_event > (schema) > (property) data > (property) id>)
[](<#(resource) webhooks > (model) response_incomplete_webhook_event > (schema) > (property) data>)
JsonValue; type "response.incomplete"constant"response.incomplete"constant
The type of the event. Always `response.incomplete`.
[](<#(resource) webhooks > (model) response_incomplete_webhook_event > (schema) > (property) type>)
Optional\<Object\> object\_
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) response_incomplete_webhook_event > (schema) > (property) object>)
[](<#(resource) webhooks > (model) response_incomplete_webhook_event > (schema)>)