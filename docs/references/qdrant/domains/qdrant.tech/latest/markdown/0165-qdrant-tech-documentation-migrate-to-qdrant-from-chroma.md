From Chroma - Qdrant
* [Documentation](https://qdrant.tech/documentation/)
*
* [Migration Tool](https://qdrant.tech/documentation/migrate-to-qdrant/)
*
* From Chroma# Migrate from Chroma to Qdrant
## What You Need from Chroma
* **Chroma URL** — the HTTP endpoint of your Chroma server
* **Collection name** — the collection to migrate
* **Authentication** — API token or basic auth credentials, if configured## Concept Mapping
|Chroma|Qdrant|Notes|
|Collection|Collection|One-to-one mapping|
|Document|Point|Each document becomes a point|
|Embeddings|Vector|Mapped automatically|
|Metadata|Payload|Direct mapping|
|Documents (text)|Payload field|Stored via `--qdrant.document-field`|
## Run the Migration
```
`docker run --net=host --rm -it registry.cloud.qdrant.io/library/qdrant-migration chroma \\
--chroma.url 'http://localhost:8000' \\
--chroma.collection 'your-collection' \\
--qdrant.url 'https://your-instance.cloud.qdrant.io:6334' \\
--qdrant.api-key 'your-qdrant-api-key' \\
--qdrant.collection 'your-collection'
`
```
### With Authentication
```
`docker run --net=host --rm -it registry.cloud.qdrant.io/library/qdrant-migration chroma \\
--chroma.url 'https://your-chroma-host:8000' \\
--chroma.collection 'your-collection' \\
--chroma.auth-type token \\
--chroma.token 'your-chroma-token' \\
--qdrant.url 'https://your-instance.cloud.qdrant.io:6334' \\
--qdrant.api-key 'your-qdrant-api-key' \\
--qdrant.collection 'your-collection'
`
```
### All Chroma-Specific Flags
|Flag|Required|Description|
|`--chroma.url`|No|Chroma HTTP endpoint (default: `http://localhost:8000`)|
|`--chroma.collection`|Yes|Collection name to migrate|
|`--chroma.tenant`|No|Chroma tenant|
|`--chroma.database`|No|Chroma database|
|`--chroma.auth-type`|No|`none`, `basic`, or `token` (default: `none`)|
|`--chroma.username`|No|Username (when auth-type is `basic`)|
|`--chroma.password`|No|Password (when auth-type is `basic`)|
|`--chroma.token`|No|Token (when auth-type is `token`)|
|`--chroma.token-header`|No|Custom header name for token auth|
### Qdrant-Side Options
|Flag|Default|Description|
|`--qdrant.document-field`|`document`|Payload field name to store Chroma document text|
|`--qdrant.id-field`|`\_\_id\_\_`|Payload field name for original Chroma IDs|
|`--qdrant.distance-metric`|`euclid`|`cosine`, `dot`, `manhattan`, or `euclid`|
## Gotchas
* **Document text:** Chroma stores raw document text alongside embeddings. Use `--qdrant.document-field` to preserve this text as a payload field in Qdrant.
* **ID mapping:** Chroma uses string IDs. The migration tool maps these to Qdrant point IDs and stores the original Chroma ID in a payload field (default: `\_\_id\_\_`).
* **Distance metric:** Chroma defaults to L2 distance. Verify which metric your collection uses and set `--qdrant.distance-metric` accordingly.## Next Steps
After migration, verify your data arrived correctly with the [Migration Verification Guide](https://qdrant.tech/documentation/migration-guidance/).
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/migrate-to-qdrant/from-chroma.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/migrate-to-qdrant/from-chroma/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/migrate-to-qdrant/from-chroma.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)