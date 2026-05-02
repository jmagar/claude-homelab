Overview – Agentic Commerce | OpenAI Developers
Primary navigation
Search docs
### Suggested
responses createreasoning\_effortrealtimeprompt caching
Apps SDK Commerce
* [ Home ](/commerce)
### Guides
* [ Get started ](/commerce/guides/get-started)
* [ Best practices ](/commerce/guides/best-practices)
### File Upload
* [ Overview ](/commerce/specs/file-upload/overview)
* [ Products ](/commerce/specs/file-upload/products)
### API
* [ Overview ](/commerce/specs/api/overview)
* [ Feeds ](/commerce/specs/api/feeds)
* [ Products ](/commerce/specs/api/products)
* [ Promotions ](/commerce/specs/api/promotions)
[API Dashboard](https://platform.openai.com/login)
Copy Page
Use this guide to move from first sample to production feed delivery with
minimal back-and-forth, and use the
[products spec](/commerce/specs/file-upload/products) for full schema and field
definitions.
## Feed model and delivery
### Supported feed type
* **Full snapshot feed**: a complete catalog export treated as the source of truth.
* **Recommended cadence**: at least daily.
### Delivery and file requirements
|Topic|Guidance|
|Delivery model|Push feeds to OpenAI via SFTP.|
|Formats|Prefer `parquet` (ideally with `ztsd` compression). `jsonl.gz`, `csv.gz`, and `tsv.gz` are also supported.|
|Encoding|UTF-8|
|Filename stability|Use a stable file name. Keep the same file name on every update and overwrite it with the latest snapshot instead of creating a new name each run.|
|Update behavior|If you use multiple shard files, keep that shard set stable and replace the same shard files on each update.|
|Shard sizing|Up to 500k items per shard is recommended; target shard files under \~500MB|
### Watch common ingestion failures
* Missing required fields
* Outdated or non-spec field names
* Malformed field values
### Handle removals explicitly
* To remove a product, either set `is\_eligible\_search=false` or remove the record from your next full snapshot.
### Operate as a snapshot pipeline
* Publish full snapshots on a predictable cadence (at least daily).
### Use push-based delivery and stable filenames
* Push feeds through supported channels.
* Reuse the same file path/name each publish and overwrite in place.
* If multiple brand feeds share one location, use clear brand-prefixed names.
### Validate in phases
* Start with a small sample (around 100 items).
* Include all required fields in every sample row.
* Run QA on the first full snapshot.
* Move to steady-state automation once validation is clean.