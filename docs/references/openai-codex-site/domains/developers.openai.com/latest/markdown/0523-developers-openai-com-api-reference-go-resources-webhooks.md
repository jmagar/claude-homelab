Webhooks | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Webhooks
##### [Unwrap](/api/reference/go/resources/webhooks/methods/unwrap)
client.Webhooks.Unwrap(ctx) error
Function
##### ModelsExpand Collapse
type BatchCancelledWebhookEvent struct{…}
Sent when a batch API request has been cancelled.
ID string
The unique ID of the event.
[](<#(resource) webhooks > (model) batch_cancelled_webhook_event > (schema) > (property) id>)
CreatedAt int64
The Unix timestamp (in seconds) of when the batch API request was cancelled.
formatunixtime
[](<#(resource) webhooks > (model) batch_cancelled_webhook_event > (schema) > (property) created_at>)
Data BatchCancelledWebhookEventData
Event data payload.
ID string
The unique ID of the batch API request.
[](<#(resource) webhooks > (model) batch_cancelled_webhook_event > (schema) > (property) data > (property) id>)
[](<#(resource) webhooks > (model) batch_cancelled_webhook_event > (schema) > (property) data>)
Type BatchCancelled
The type of the event. Always `batch.cancelled`.
[](<#(resource) webhooks > (model) batch_cancelled_webhook_event > (schema) > (property) type>)
Object BatchCancelledWebhookEventObjectOptional
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) batch_cancelled_webhook_event > (schema) > (property) object>)
[](<#(resource) webhooks > (model) batch_cancelled_webhook_event > (schema)>)
type BatchCompletedWebhookEvent struct{…}
Sent when a batch API request has been completed.
ID string
The unique ID of the event.
[](<#(resource) webhooks > (model) batch_completed_webhook_event > (schema) > (property) id>)
CreatedAt int64
The Unix timestamp (in seconds) of when the batch API request was completed.
formatunixtime
[](<#(resource) webhooks > (model) batch_completed_webhook_event > (schema) > (property) created_at>)
Data BatchCompletedWebhookEventData
Event data payload.
ID string
The unique ID of the batch API request.
[](<#(resource) webhooks > (model) batch_completed_webhook_event > (schema) > (property) data > (property) id>)
[](<#(resource) webhooks > (model) batch_completed_webhook_event > (schema) > (property) data>)
Type BatchCompleted
The type of the event. Always `batch.completed`.
[](<#(resource) webhooks > (model) batch_completed_webhook_event > (schema) > (property) type>)
Object BatchCompletedWebhookEventObjectOptional
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) batch_completed_webhook_event > (schema) > (property) object>)
[](<#(resource) webhooks > (model) batch_completed_webhook_event > (schema)>)
type BatchExpiredWebhookEvent struct{…}
Sent when a batch API request has expired.
ID string
The unique ID of the event.
[](<#(resource) webhooks > (model) batch_expired_webhook_event > (schema) > (property) id>)
CreatedAt int64
The Unix timestamp (in seconds) of when the batch API request expired.
formatunixtime
[](<#(resource) webhooks > (model) batch_expired_webhook_event > (schema) > (property) created_at>)
Data BatchExpiredWebhookEventData
Event data payload.
ID string
The unique ID of the batch API request.
[](<#(resource) webhooks > (model) batch_expired_webhook_event > (schema) > (property) data > (property) id>)
[](<#(resource) webhooks > (model) batch_expired_webhook_event > (schema) > (property) data>)
Type BatchExpired
The type of the event. Always `batch.expired`.
[](<#(resource) webhooks > (model) batch_expired_webhook_event > (schema) > (property) type>)
Object BatchExpiredWebhookEventObjectOptional
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) batch_expired_webhook_event > (schema) > (property) object>)
[](<#(resource) webhooks > (model) batch_expired_webhook_event > (schema)>)
type BatchFailedWebhookEvent struct{…}
Sent when a batch API request has failed.
ID string
The unique ID of the event.
[](<#(resource) webhooks > (model) batch_failed_webhook_event > (schema) > (property) id>)
CreatedAt int64
The Unix timestamp (in seconds) of when the batch API request failed.
formatunixtime
[](<#(resource) webhooks > (model) batch_failed_webhook_event > (schema) > (property) created_at>)
Data BatchFailedWebhookEventData
Event data payload.
ID string
The unique ID of the batch API request.
[](<#(resource) webhooks > (model) batch_failed_webhook_event > (schema) > (property) data > (property) id>)
[](<#(resource) webhooks > (model) batch_failed_webhook_event > (schema) > (property) data>)
Type BatchFailed
The type of the event. Always `batch.failed`.
[](<#(resource) webhooks > (model) batch_failed_webhook_event > (schema) > (property) type>)
Object BatchFailedWebhookEventObjectOptional
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) batch_failed_webhook_event > (schema) > (property) object>)
[](<#(resource) webhooks > (model) batch_failed_webhook_event > (schema)>)
type EvalRunCanceledWebhookEvent struct{…}
Sent when an eval run has been canceled.
ID string
The unique ID of the event.
[](<#(resource) webhooks > (model) eval_run_canceled_webhook_event > (schema) > (property) id>)
CreatedAt int64
The Unix timestamp (in seconds) of when the eval run was canceled.
formatunixtime
[](<#(resource) webhooks > (model) eval_run_canceled_webhook_event > (schema) > (property) created_at>)
Data EvalRunCanceledWebhookEventData
Event data payload.
ID string
The unique ID of the eval run.
[](<#(resource) webhooks > (model) eval_run_canceled_webhook_event > (schema) > (property) data > (property) id>)
[](<#(resource) webhooks > (model) eval_run_canceled_webhook_event > (schema) > (property) data>)
Type EvalRunCanceled
The type of the event. Always `eval.run.canceled`.
[](<#(resource) webhooks > (model) eval_run_canceled_webhook_event > (schema) > (property) type>)
Object EvalRunCanceledWebhookEventObjectOptional
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) eval_run_canceled_webhook_event > (schema) > (property) object>)
[](<#(resource) webhooks > (model) eval_run_canceled_webhook_event > (schema)>)
type EvalRunFailedWebhookEvent struct{…}
Sent when an eval run has failed.
ID string
The unique ID of the event.
[](<#(resource) webhooks > (model) eval_run_failed_webhook_event > (schema) > (property) id>)
CreatedAt int64
The Unix timestamp (in seconds) of when the eval run failed.
formatunixtime
[](<#(resource) webhooks > (model) eval_run_failed_webhook_event > (schema) > (property) created_at>)
Data EvalRunFailedWebhookEventData
Event data payload.
ID string
The unique ID of the eval run.
[](<#(resource) webhooks > (model) eval_run_failed_webhook_event > (schema) > (property) data > (property) id>)
[](<#(resource) webhooks > (model) eval_run_failed_webhook_event > (schema) > (property) data>)
Type EvalRunFailed
The type of the event. Always `eval.run.failed`.
[](<#(resource) webhooks > (model) eval_run_failed_webhook_event > (schema) > (property) type>)
Object EvalRunFailedWebhookEventObjectOptional
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) eval_run_failed_webhook_event > (schema) > (property) object>)
[](<#(resource) webhooks > (model) eval_run_failed_webhook_event > (schema)>)
type EvalRunSucceededWebhookEvent struct{…}
Sent when an eval run has succeeded.
ID string
The unique ID of the event.
[](<#(resource) webhooks > (model) eval_run_succeeded_webhook_event > (schema) > (property) id>)
CreatedAt int64
The Unix timestamp (in seconds) of when the eval run succeeded.
formatunixtime
[](<#(resource) webhooks > (model) eval_run_succeeded_webhook_event > (schema) > (property) created_at>)
Data EvalRunSucceededWebhookEventData
Event data payload.
ID string
The unique ID of the eval run.
[](<#(resource) webhooks > (model) eval_run_succeeded_webhook_event > (schema) > (property) data > (property) id>)
[](<#(resource) webhooks > (model) eval_run_succeeded_webhook_event > (schema) > (property) data>)
Type EvalRunSucceeded
The type of the event. Always `eval.run.succeeded`.
[](<#(resource) webhooks > (model) eval_run_succeeded_webhook_event > (schema) > (property) type>)
Object EvalRunSucceededWebhookEventObjectOptional
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) eval_run_succeeded_webhook_event > (schema) > (property) object>)
[](<#(resource) webhooks > (model) eval_run_succeeded_webhook_event > (schema)>)
type FineTuningJobCancelledWebhookEvent struct{…}
Sent when a fine-tuning job has been cancelled.
ID string
The unique ID of the event.
[](<#(resource) webhooks > (model) fine_tuning_job_cancelled_webhook_event > (schema) > (property) id>)
CreatedAt int64
The Unix timestamp (in seconds) of when the fine-tuning job was cancelled.
formatunixtime
[](<#(resource) webhooks > (model) fine_tuning_job_cancelled_webhook_event > (schema) > (property) created_at>)
Data FineTuningJobCancelledWebhookEventData
Event data payload.
ID string
The unique ID of the fine-tuning job.
[](<#(resource) webhooks > (model) fine_tuning_job_cancelled_webhook_event > (schema) > (property) data > (property) id>)
[](<#(resource) webhooks > (model) fine_tuning_job_cancelled_webhook_event > (schema) > (property) data>)
Type FineTuningJobCancelled
The type of the event. Always `fine\_tuning.job.cancelled`.
[](<#(resource) webhooks > (model) fine_tuning_job_cancelled_webhook_event > (schema) > (property) type>)
Object FineTuningJobCancelledWebhookEventObjectOptional
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) fine_tuning_job_cancelled_webhook_event > (schema) > (property) object>)
[](<#(resource) webhooks > (model) fine_tuning_job_cancelled_webhook_event > (schema)>)
type FineTuningJobFailedWebhookEvent struct{…}
Sent when a fine-tuning job has failed.
ID string
The unique ID of the event.
[](<#(resource) webhooks > (model) fine_tuning_job_failed_webhook_event > (schema) > (property) id>)
CreatedAt int64
The Unix timestamp (in seconds) of when the fine-tuning job failed.
formatunixtime
[](<#(resource) webhooks > (model) fine_tuning_job_failed_webhook_event > (schema) > (property) created_at>)
Data FineTuningJobFailedWebhookEventData
Event data payload.
ID string
The unique ID of the fine-tuning job.
[](<#(resource) webhooks > (model) fine_tuning_job_failed_webhook_event > (schema) > (property) data > (property) id>)
[](<#(resource) webhooks > (model) fine_tuning_job_failed_webhook_event > (schema) > (property) data>)
Type FineTuningJobFailed
The type of the event. Always `fine\_tuning.job.failed`.
[](<#(resource) webhooks > (model) fine_tuning_job_failed_webhook_event > (schema) > (property) type>)
Object FineTuningJobFailedWebhookEventObjectOptional
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) fine_tuning_job_failed_webhook_event > (schema) > (property) object>)
[](<#(resource) webhooks > (model) fine_tuning_job_failed_webhook_event > (schema)>)
type FineTuningJobSucceededWebhookEvent struct{…}
Sent when a fine-tuning job has succeeded.
ID string
The unique ID of the event.
[](<#(resource) webhooks > (model) fine_tuning_job_succeeded_webhook_event > (schema) > (property) id>)
CreatedAt int64
The Unix timestamp (in seconds) of when the fine-tuning job succeeded.
formatunixtime
[](<#(resource) webhooks > (model) fine_tuning_job_succeeded_webhook_event > (schema) > (property) created_at>)
Data FineTuningJobSucceededWebhookEventData
Event data payload.
ID string
The unique ID of the fine-tuning job.
[](<#(resource) webhooks > (model) fine_tuning_job_succeeded_webhook_event > (schema) > (property) data > (property) id>)
[](<#(resource) webhooks > (model) fine_tuning_job_succeeded_webhook_event > (schema) > (property) data>)
Type FineTuningJobSucceeded
The type of the event. Always `fine\_tuning.job.succeeded`.
[](<#(resource) webhooks > (model) fine_tuning_job_succeeded_webhook_event > (schema) > (property) type>)
Object FineTuningJobSucceededWebhookEventObjectOptional
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) fine_tuning_job_succeeded_webhook_event > (schema) > (property) object>)
[](<#(resource) webhooks > (model) fine_tuning_job_succeeded_webhook_event > (schema)>)
type RealtimeCallIncomingWebhookEvent struct{…}
Sent when Realtime API Receives a incoming SIP call.
ID string
The unique ID of the event.
[](<#(resource) webhooks > (model) realtime_call_incoming_webhook_event > (schema) > (property) id>)
CreatedAt int64
The Unix timestamp (in seconds) of when the model response was completed.
formatunixtime
[](<#(resource) webhooks > (model) realtime_call_incoming_webhook_event > (schema) > (property) created_at>)
Data RealtimeCallIncomingWebhookEventData
Event data payload.
CallID string
The unique ID of this call.
[](<#(resource) webhooks > (model) realtime_call_incoming_webhook_event > (schema) > (property) data > (property) call_id>)
SipHeaders []RealtimeCallIncomingWebhookEventDataSipHeader
Headers from the SIP Invite.
Name string
Name of the SIP Header.
[](<#(resource) webhooks > (model) realtime_call_incoming_webhook_event > (schema) > (property) data > (property) sip_headers > (items) > (property) name>)
Value string
Value of the SIP Header.
[](<#(resource) webhooks > (model) realtime_call_incoming_webhook_event > (schema) > (property) data > (property) sip_headers > (items) > (property) value>)
[](<#(resource) webhooks > (model) realtime_call_incoming_webhook_event > (schema) > (property) data > (property) sip_headers>)
[](<#(resource) webhooks > (model) realtime_call_incoming_webhook_event > (schema) > (property) data>)
Type RealtimeCallIncoming
The type of the event. Always `realtime.call.incoming`.
[](<#(resource) webhooks > (model) realtime_call_incoming_webhook_event > (schema) > (property) type>)
Object RealtimeCallIncomingWebhookEventObjectOptional
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) realtime_call_incoming_webhook_event > (schema) > (property) object>)
[](<#(resource) webhooks > (model) realtime_call_incoming_webhook_event > (schema)>)
type ResponseCancelledWebhookEvent struct{…}
Sent when a background response has been cancelled.
ID string
The unique ID of the event.
[](<#(resource) webhooks > (model) response_cancelled_webhook_event > (schema) > (property) id>)
CreatedAt int64
The Unix timestamp (in seconds) of when the model response was cancelled.
formatunixtime
[](<#(resource) webhooks > (model) response_cancelled_webhook_event > (schema) > (property) created_at>)
Data ResponseCancelledWebhookEventData
Event data payload.
ID string
The unique ID of the model response.
[](<#(resource) webhooks > (model) response_cancelled_webhook_event > (schema) > (property) data > (property) id>)
[](<#(resource) webhooks > (model) response_cancelled_webhook_event > (schema) > (property) data>)
Type ResponseCancelled
The type of the event. Always `response.cancelled`.
[](<#(resource) webhooks > (model) response_cancelled_webhook_event > (schema) > (property) type>)
Object ResponseCancelledWebhookEventObjectOptional
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) response_cancelled_webhook_event > (schema) > (property) object>)
[](<#(resource) webhooks > (model) response_cancelled_webhook_event > (schema)>)
type ResponseCompletedWebhookEvent struct{…}
Sent when a background response has been completed.
ID string
The unique ID of the event.
[](<#(resource) webhooks > (model) response_completed_webhook_event > (schema) > (property) id>)
CreatedAt int64
The Unix timestamp (in seconds) of when the model response was completed.
formatunixtime
[](<#(resource) webhooks > (model) response_completed_webhook_event > (schema) > (property) created_at>)
Data ResponseCompletedWebhookEventData
Event data payload.
ID string
The unique ID of the model response.
[](<#(resource) webhooks > (model) response_completed_webhook_event > (schema) > (property) data > (property) id>)
[](<#(resource) webhooks > (model) response_completed_webhook_event > (schema) > (property) data>)
Type ResponseCompleted
The type of the event. Always `response.completed`.
[](<#(resource) webhooks > (model) response_completed_webhook_event > (schema) > (property) type>)
Object ResponseCompletedWebhookEventObjectOptional
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) response_completed_webhook_event > (schema) > (property) object>)
[](<#(resource) webhooks > (model) response_completed_webhook_event > (schema)>)
type ResponseFailedWebhookEvent struct{…}
Sent when a background response has failed.
ID string
The unique ID of the event.
[](<#(resource) webhooks > (model) response_failed_webhook_event > (schema) > (property) id>)
CreatedAt int64
The Unix timestamp (in seconds) of when the model response failed.
formatunixtime
[](<#(resource) webhooks > (model) response_failed_webhook_event > (schema) > (property) created_at>)
Data ResponseFailedWebhookEventData
Event data payload.
ID string
The unique ID of the model response.
[](<#(resource) webhooks > (model) response_failed_webhook_event > (schema) > (property) data > (property) id>)
[](<#(resource) webhooks > (model) response_failed_webhook_event > (schema) > (property) data>)
Type ResponseFailed
The type of the event. Always `response.failed`.
[](<#(resource) webhooks > (model) response_failed_webhook_event > (schema) > (property) type>)
Object ResponseFailedWebhookEventObjectOptional
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) response_failed_webhook_event > (schema) > (property) object>)
[](<#(resource) webhooks > (model) response_failed_webhook_event > (schema)>)
type ResponseIncompleteWebhookEvent struct{…}
Sent when a background response has been interrupted.
ID string
The unique ID of the event.
[](<#(resource) webhooks > (model) response_incomplete_webhook_event > (schema) > (property) id>)
CreatedAt int64
The Unix timestamp (in seconds) of when the model response was interrupted.
formatunixtime
[](<#(resource) webhooks > (model) response_incomplete_webhook_event > (schema) > (property) created_at>)
Data ResponseIncompleteWebhookEventData
Event data payload.
ID string
The unique ID of the model response.
[](<#(resource) webhooks > (model) response_incomplete_webhook_event > (schema) > (property) data > (property) id>)
[](<#(resource) webhooks > (model) response_incomplete_webhook_event > (schema) > (property) data>)
Type ResponseIncomplete
The type of the event. Always `response.incomplete`.
[](<#(resource) webhooks > (model) response_incomplete_webhook_event > (schema) > (property) type>)
Object ResponseIncompleteWebhookEventObjectOptional
The object of the event. Always `event`.
[](<#(resource) webhooks > (model) response_incomplete_webhook_event > (schema) > (property) object>)
[](<#(resource) webhooks > (model) response_incomplete_webhook_event > (schema)>)