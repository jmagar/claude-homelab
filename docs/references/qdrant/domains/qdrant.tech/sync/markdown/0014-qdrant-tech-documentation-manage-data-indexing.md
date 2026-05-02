Indexing - Qdrant
* [Documentation](https://qdrant.tech/documentation/)
*
* [Manage Data](https://qdrant.tech/documentation/manage-data/)
*
* Indexing# Indexing
A key feature of Qdrant is the effective combination of vector and traditional indexes. It is essential to have this because for vector search to work effectively with filters, having a vector index only is not enough. In simpler terms, a vector index speeds up vector search, and payload indexes speed up filtering.
The indexes in the segments exist independently, but the parameters of the indexes themselves are configured for the whole collection.
Not all segments automatically have indexes.
Their necessity is determined by the [optimizer](https://qdrant.tech/documentation/ops-optimization/optimizer/) settings and depends, as a rule, on the number of stored points.
## Payload Index
Payload index in Qdrant is similar to the index in conventional document-oriented databases.
This index is built for a specific field and type, and is used for quick point requests by the corresponding filtering condition.
The index is also used to accurately estimate the filter cardinality, which helps the [query planning](https://qdrant.tech/documentation/search/search/#query-planning) choose a search strategy.
Creating an index requires additional computational resources and memory, so choosing fields to be indexed is essential. Qdrant does not make this choice but grants it to the user.
To mark a field as indexable, you can use the following:
```
`PUT /collections/{collection\_name}/index
{
"field\_name": "name\_of\_the\_field\_to\_index",
"field\_schema": "keyword"
}
`
```
```
`client.create\_payload\_index(
collection\_name="{collection\_name}",
field\_name="name\_of\_the\_field\_to\_index",
field\_schema=models.PayloadSchemaType.KEYWORD,
)
`
```
```
`client.createPayloadIndex("{collection\_name}", {
field\_name: "name\_of\_the\_field\_to\_index",
field\_schema: "keyword",
});
`
```
```
`use qdrant\_client::qdrant::{CreateFieldIndexCollectionBuilder, FieldType};
client
.create\_field\_index(
CreateFieldIndexCollectionBuilder::new(
"{collection\_name}",
"name\_of\_the\_field\_to\_index",
FieldType::Keyword,
)
.wait(true),
)
.await?;
`
```
```
`import io.qdrant.client.grpc.Collections.PayloadSchemaType;
client.createPayloadIndexAsync(
"{collection\_name}",
"name\_of\_the\_field\_to\_index",
PayloadSchemaType.Keyword,
null,
true,
null,
null);
`
```
```
`using Qdrant.Client;
var client = new QdrantClient("localhost", 6334);
await client.CreatePayloadIndexAsync(
collectionName: "{collection\_name}",
fieldName: "name\_of\_the\_field\_to\_index"
);
`
```
```
`import (
"context"
"github.com/qdrant/go-client/qdrant"
)
client, err := qdrant.NewClient(&qdrant.Config{
Host: "localhost",
Port: 6334,
})
client.CreateFieldIndex(context.Background(), &qdrant.CreateFieldIndexCollection{
CollectionName: "{collection\_name}",
FieldName: "name\_of\_the\_field\_to\_index",
FieldType: qdrant.FieldType\_FieldTypeKeyword.Enum(),
})
`
```
You can use dot notation to specify a nested field for indexing. Similar to specifying [nested filters](https://qdrant.tech/documentation/search/filtering/#nested-key).
Available field types are:
* `keyword` - for [keyword](https://qdrant.tech/documentation/manage-data/payload/#keyword) payload, affects [Match](https://qdrant.tech/documentation/search/filtering/#match) filtering conditions.
* `integer` - for [integer](https://qdrant.tech/documentation/manage-data/payload/#integer) payload, affects [Match](https://qdrant.tech/documentation/search/filtering/#match) and [Range](https://qdrant.tech/documentation/search/filtering/#range) filtering conditions.
* `float` - for [float](https://qdrant.tech/documentation/manage-data/payload/#float) payload, affects [Range](https://qdrant.tech/documentation/search/filtering/#range) filtering conditions.
* `bool` - for [bool](https://qdrant.tech/documentation/manage-data/payload/#bool) payload, affects [Match](https://qdrant.tech/documentation/search/filtering/#match) filtering conditions (available as of v1.4.0).
* `geo` - for [geo](https://qdrant.tech/documentation/manage-data/payload/#geo) payload, affects [Geo Bounding Box](https://qdrant.tech/documentation/search/filtering/#geo-bounding-box) and [Geo Radius](https://qdrant.tech/documentation/search/filtering/#geo-radius) filtering conditions.
* `datetime` - for [datetime](https://qdrant.tech/documentation/manage-data/payload/#datetime) payload, affects [Range](https://qdrant.tech/documentation/search/filtering/#range) filtering conditions (available as of v1.8.0).
* `text` - a special kind of index, available for [keyword](https://qdrant.tech/documentation/manage-data/payload/#keyword) / string payloads, affects [Full Text search](https://qdrant.tech/documentation/search/filtering/#full-text-match) filtering conditions. Read more about [text index configuration](#full-text-index)
* `uuid` - a special type of index, similar to `keyword`, but optimized for [UUID values](https://qdrant.tech/documentation/manage-data/payload/#uuid).
Affects [Match](https://qdrant.tech/documentation/search/filtering/#match) filtering conditions. (available as of v1.11.0)
Payload index may occupy some additional memory, so it is recommended to only use the index for those fields that are used in filtering conditions.
If you need to filter by many fields and the memory limits do not allow for indexing all of them, it is recommended to choose the field that limits the search result the most.
As a rule, the more different values a payload value has, the more efficiently the index will be used.
It's highly recommended to create all payload indices immediately after collection creation. Creating them later may block updates for some time. HNSW graphs will also only benefit from [additional optimizations](#filterable-hnsw-index) (extra edges) when they are generated after payload index creation.### Parameterized index
*Available as of v1.8.0*
We&rsquo;ve added a parameterized variant to the `integer` index, which allows
you to fine-tune indexing and search performance.
Both the regular and parameterized `integer` indexes use the following flags:
* `lookup`: enables support for direct lookup using
[Match](https://qdrant.tech/documentation/search/filtering/#match) filters.
* `range`: enables support for
[Range](https://qdrant.tech/documentation/search/filtering/#range) filters.
The regular `integer` index assumes both `lookup` and `range` are `true`. In
contrast, to configure a parameterized index, you would set only one of these
filters to `true`:
|`lookup`|`range`|Result|
|`true`|`true`|Regular integer index|
|`true`|`false`|Parameterized integer index|
|`false`|`true`|Parameterized integer index|
|`false`|`false`|No integer index|
The parameterized index can enhance performance in collections with millions
of points. We encourage you to try it out. If it does not enhance performance
in your use case, you can always restore the regular `integer` index.
Note: If you set `"lookup": true` with a range filter, that may lead to
significant performance issues.
For example, the following code sets up a parameterized integer index which
supports only range filters:
```
`PUT /collections/{collection\_name}/index
{
"field\_name": "name\_of\_the\_field\_to\_index",
"field\_schema": {
"type": "integer",
"lookup": false,
"range": true
}
}
`
```
```
`from qdrant\_client import QdrantClient, models
client = QdrantClient(url="http://localhost:6333")
client.create\_payload\_index(
collection\_name="{collection\_name}",
field\_name="name\_of\_the\_field\_to\_index",
field\_schema=models.IntegerIndexParams(
type=models.IntegerIndexType.INTEGER,
lookup=False,
range=True,
),
)
`
```
```
`import { QdrantClient } from "@qdrant/js-client-rest";
const client = new QdrantClient({ host: "localhost", port: 6333 });
client.createPayloadIndex("{collection\_name}", {
field\_name: "name\_of\_the\_field\_to\_index",
field\_schema: {
type: "integer",
lookup: false,
range: true,
},
});
`
```
```
`use qdrant\_client::Qdrant;
use qdrant\_client::qdrant::{
CreateFieldIndexCollectionBuilder, FieldType, IntegerIndexParamsBuilder,
};
let client = Qdrant::from\_url("http://localhost:6334").build()?;
client
.create\_field\_index(
CreateFieldIndexCollectionBuilder::new(
"{collection\_name}",
"name\_of\_the\_field\_to\_index",
FieldType::Integer,
)
.field\_index\_params(IntegerIndexParamsBuilder::new(false, true).build()),
)
.await?;
`
```
```
`import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
import io.qdrant.client.grpc.Collections.IntegerIndexParams;
import io.qdrant.client.grpc.Collections.PayloadIndexParams;
import io.qdrant.client.grpc.Collections.PayloadSchemaType;
QdrantClient client =
new QdrantClient(QdrantGrpcClient.newBuilder("localhost", 6334, false).build());
client
.createPayloadIndexAsync(
"{collection\_name}",
"name\_of\_the\_field\_to\_index",
PayloadSchemaType.Integer,
PayloadIndexParams.newBuilder()
.setIntegerIndexParams(
IntegerIndexParams.newBuilder().setLookup(false).setRange(true).build())
.build(),
null,
null,
null)
.get();
`
```
```
`using Qdrant.Client;
using Qdrant.Client.Grpc;
var client = new QdrantClient("localhost", 6334);
await client.CreatePayloadIndexAsync(
collectionName: "{collection\_name}",
fieldName: "name\_of\_the\_field\_to\_index",
schemaType: PayloadSchemaType.Integer,
indexParams: new PayloadIndexParams
{
IntegerIndexParams = new()
{
Lookup = false,
Range = true
}
}
);
`
```
```
`import (
"context"
"github.com/qdrant/go-client/qdrant"
)
client, err := qdrant.NewClient(&qdrant.Config{
Host: "localhost",
Port: 6334,
})
client.CreateFieldIndex(context.Background(), &qdrant.CreateFieldIndexCollection{
CollectionName: "{collection\_name}",
FieldName: "name\_of\_the\_field\_to\_index",
FieldType: qdrant.FieldType\_FieldTypeInteger.Enum(),
FieldIndexParams: qdrant.NewPayloadIndexParamsInt(
&qdrant.IntegerIndexParams{
Lookup: qdrant.PtrOf(false),
Range: qdrant.PtrOf(true),
}),
})
`
```
### On-disk payload index
*Available as of v1.11.0*
By default all payload-related structures are stored in memory. In this way, the vector index can quickly access payload values during search.
As latency in this case is critical, it is recommended to keep hot payload indexes in memory.
There are, however, cases when payload indexes are too large or rarely used. In those cases, it is possible to store payload indexes on disk.
On-disk payload index might affect cold requests latency, as it requires additional disk I/O operations.
To configure on-disk payload index, you can use the following index parameters:
```
`PUT /collections/{collection\_name}/index
{
"field\_name": "payload\_field\_name",
"field\_schema": {
"type": "keyword",
"on\_disk": true
}
}
`
```
```
`client.create\_payload\_index(
collection\_name="{collection\_name}",
field\_name="payload\_field\_name",
field\_schema=models.KeywordIndexParams(
type=models.KeywordIndexType.KEYWORD,
on\_disk=True,
),
)
`
```
```
`client.createPayloadIndex("{collection\_name}", {
field\_name: "payload\_field\_name",
field\_schema: {
type: "keyword",
on\_disk: true
},
});
`
```
```
`use qdrant\_client::qdrant::{
CreateFieldIndexCollectionBuilder,
KeywordIndexParamsBuilder,
FieldType
};
use qdrant\_client::Qdrant;
let client = Qdrant::from\_url("http://localhost:6334").build()?;
client.create\_field\_index(
CreateFieldIndexCollectionBuilder::new(
"{collection\_name}",
"payload\_field\_name",
FieldType::Keyword,
)
.field\_index\_params(
KeywordIndexParamsBuilder::default()
.on\_disk(true),
),
).await?;
`
```
```
`import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
import io.qdrant.client.grpc.Collections.KeywordIndexParams;
import io.qdrant.client.grpc.Collections.PayloadIndexParams;
import io.qdrant.client.grpc.Collections.PayloadSchemaType;
QdrantClient client =
new QdrantClient(QdrantGrpcClient.newBuilder("localhost", 6334, false).build());
client
.createPayloadIndexAsync(
"{collection\_name}",
"payload\_field\_name",
PayloadSchemaType.Keyword,
PayloadIndexParams.newBuilder()
.setKeywordIndexParams(
KeywordIndexParams.newBuilder()
.setOnDisk(true)
.build())
.build(),
null,
null,
null)
.get();
`
```
```
`using Qdrant.Client;
using Qdrant.Client.Grpc;
var client = new QdrantClient("localhost", 6334);
await client.CreatePayloadIndexAsync(
collectionName: "{collection\_name}",
fieldName: "payload\_field\_name",
schemaType: PayloadSchemaType.Keyword,
indexParams: new PayloadIndexParams
{
KeywordIndexParams = new KeywordIndexParams
{
OnDisk = true
}
}
);
`
```
```
`import (
"context"
"github.com/qdrant/go-client/qdrant"
)
client, err := qdrant.NewClient(&qdrant.Config{
Host: "localhost",
Port: 6334,
})
client.CreateFieldIndex(context.Background(), &qdrant.CreateFieldIndexCollection{
CollectionName: "{collection\_name}",
FieldName: "name\_of\_the\_field\_to\_index",
FieldType: qdrant.FieldType\_FieldTypeKeyword.Enum(),
FieldIndexParams: qdrant.NewPayloadIndexParamsKeyword(
&qdrant.KeywordIndexParams{
OnDisk: qdrant.PtrOf(true),
}),
})
`
```
Payload index on-disk is supported for the following types:
* `keyword`
* `integer`
* `float`
* `datetime`
* `uuid`
* `text`
* `geo`
The list will be extended in future versions.
### Tenant Index
*Available as of v1.11.0*
Many vector search use-cases require multitenancy. In a multi-tenant scenario the collection is expected to contain multiple subsets of data, where each subset belongs to a different tenant.
Qdrant supports efficient multi-tenant search by enabling [special configuration](https://qdrant.tech/documentation/manage-data/multitenancy/) vector index, which disables global search and only builds sub-indexes for each tenant.
In Qdrant, tenants are not necessarily non-overlapping. It is possible to have subsets of data that belong to multiple tenants.
However, knowing that the collection contains multiple tenants unlocks more opportunities for optimization.
To optimize storage in Qdrant further, you can enable tenant indexing for payload fields.
This option will tell Qdrant which fields are used for tenant identification and will allow Qdrant to structure storage for faster search of tenant-specific data.
One example of such optimization is localizing tenant-specific data closer on disk, which will reduce the number of disk reads during search.
To enable tenant index for a field, you can use the following index parameters:
```
`PUT /collections/{collection\_name}/index
{
"field\_name": "payload\_field\_name",
"field\_schema": {
"type": "keyword",
"is\_tenant": true
}
}
`
```
```
`client.create\_payload\_index(
collection\_name="{collection\_name}",
field\_name="payload\_field\_name",
field\_schema=models.KeywordIndexParams(
type=models.KeywordIndexType.KEYWORD,
is\_tenant=True,
),
)
`
```
```
`client.createPayloadIndex("{collection\_name}", {
field\_name: "payload\_field\_name",
field\_schema: {
type: "keyword",
is\_tenant: true
},
});
`
```
```
`use qdrant\_client::qdrant::{
CreateFieldIndexCollectionBuilder,
KeywordIndexParamsBuilder,
FieldType
};
use qdrant\_client::Qdrant;
let client = Qdrant::from\_url("http://localhost:6334").build()?;
client.create\_field\_index(
CreateFieldIndexCollectionBuilder::new(
"{collection\_name}",
"payload\_field\_name",
FieldType::Keyword,
)
.field\_index\_params(
KeywordIndexParamsBuilder::default()
.is\_tenant(true),
),
).await?;
`
```
```
`import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
import io.qdrant.client.grpc.Collections.KeywordIndexParams;
import io.qdrant.client.grpc.Collections.PayloadIndexParams;
import io.qdrant.client.grpc.Collections.PayloadSchemaType;
QdrantClient client =
new QdrantClient(QdrantGrpcClient.newBuilder("localhost", 6334, false).build());
client
.createPayloadIndexAsync(
"{collection\_name}",
"payload\_field\_name",
PayloadSchemaType.Keyword,
PayloadIndexParams.newBuilder()
.setKeywordIndexParams(
KeywordIndexParams.newBuilder()
.setIsTenant(true)
.build())
.build(),
null,
null,
null)
.get();
`
```
```
`using Qdrant.Client;
using Qdrant.Client.Grpc;
var client = new QdrantClient("localhost", 6334);
await client.CreatePayloadIndexAsync(
collectionName: "{collection\_name}",
fieldName: "payload\_field\_name",
schemaType: PayloadSchemaType.Keyword,
indexParams: new PayloadIndexParams
{
KeywordIndexParams = new KeywordIndexParams
{
IsTenant = true
}
}
);
`
```
```
`import (
"context"
"github.com/qdrant/go-client/qdrant"
)
client, err := qdrant.NewClient(&qdrant.Config{
Host: "localhost",
Port: 6334,
})
client.CreateFieldIndex(context.Background(), &qdrant.CreateFieldIndexCollection{
CollectionName: "{collection\_name}",
FieldName: "name\_of\_the\_field\_to\_index",
FieldType: qdrant.FieldType\_FieldTypeKeyword.Enum(),
FieldIndexParams: qdrant.NewPayloadIndexParamsKeyword(
&qdrant.KeywordIndexParams{
IsTenant: qdrant.PtrOf(true),
}),
})
`
```
Tenant optimization is supported for the following datatypes:
* `keyword`
* `uuid`### Principal Index
*Available as of v1.11.0*
Similar to the tenant index, the principal index is used to optimize storage for faster search, assuming that the search request is primarily filtered by the principal field.
A good example of a use case for the principal index is time-related data, where each point is associated with a timestamp. In this case, the principal index can be used to optimize storage for faster search with time-based filters.
```
`PUT /collections/{collection\_name}/index
{
"field\_name": "timestamp",
"field\_schema": {
"type": "integer",
"is\_principal": true
}
}
`
```
```
`client.create\_payload\_index(
collection\_name="{collection\_name}",
field\_name="timestamp",
field\_schema=models.IntegerIndexParams(
type=models.IntegerIndexType.INTEGER,
is\_principal=True,
),
)
`
```
```
`client.createPayloadIndex("{collection\_name}", {
field\_name: "timestamp",
field\_schema: {
type: "integer",
is\_principal: true
},
});
`
```
```
`use qdrant\_client::qdrant::{
CreateFieldIndexCollectionBuilder,
IntegerIndexParamsBuilder,
FieldType
};
use qdrant\_client::Qdrant;
let client = Qdrant::from\_url("http://localhost:6334").build()?;
client.create\_field\_index(
CreateFieldIndexCollectionBuilder::new(
"{collection\_name}",
"timestamp",
FieldType::Integer,
)
.field\_index\_params(
IntegerIndexParamsBuilder::default()
.is\_principal(true),
),
).await?;
`
```
```
`import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
import io.qdrant.client.grpc.Collections.IntegerIndexParams;
import io.qdrant.client.grpc.Collections.KeywordIndexParams;
import io.qdrant.client.grpc.Collections.PayloadIndexParams;
import io.qdrant.client.grpc.Collections.PayloadSchemaType;
QdrantClient client =
new QdrantClient(QdrantGrpcClient.newBuilder("localhost", 6334, false).build());
client
.createPayloadIndexAsync(
"{collection\_name}",
"timestamp",
PayloadSchemaType.Integer,
PayloadIndexParams.newBuilder()
.setIntegerIndexParams(
IntegerIndexParams.newBuilder()
.setIsPrincipal(true)
.build())
.build(),
null,
null,
null)
.get();
`
```
```
`using Qdrant.Client;
using Qdrant.Client.Grpc;
var client = new QdrantClient("localhost", 6334);
await client.CreatePayloadIndexAsync(
collectionName: "{collection\_name}",
fieldName: "timestamp",
schemaType: PayloadSchemaType.Integer,
indexParams: new PayloadIndexParams
{
IntegerIndexParams = new IntegerIndexParams
{
IsPrincipal = true
}
}
);
`
```
```
`import (
"context"
"github.com/qdrant/go-client/qdrant"
)
client, err := qdrant.NewClient(&qdrant.Config{
Host: "localhost",
Port: 6334,
})
client.CreateFieldIndex(context.Background(), &qdrant.CreateFieldIndexCollection{
CollectionName: "{collection\_name}",
FieldName: "name\_of\_the\_field\_to\_index",
FieldType: qdrant.FieldType\_FieldTypeInteger.Enum(),
FieldIndexParams: qdrant.NewPayloadIndexParamsInt(
&qdrant.IntegerIndexParams{
IsPrincipal: qdrant.PtrOf(true),
}),
})
`
```
Principal optimization is supported for following types:
* `integer`
* `float`
* `datetime`## Full-text index
Qdrant supports full-text search for string payload.
Full-text index allows you to filter points by the presence of a word or a phrase in the payload field.
Full-text index configuration is a bit more complex than other indexes, as you can specify the tokenization parameters.
Tokenization is the process of splitting a string into tokens, which are then indexed in the inverted index.
See [Full Text match](https://qdrant.tech/documentation/search/filtering/#full-text-match) for examples of querying with a full-text index.
To create a full-text index, you can use the following:
```
`PUT /collections/{collection\_name}/index
{
"field\_name": "name\_of\_the\_field\_to\_index",
"field\_schema": {
"type": "text",
"tokenizer": "word",
"min\_token\_len": 2,
"max\_token\_len": 10,
"lowercase": true
}
}
`
```
```
`from qdrant\_client import QdrantClient, models
client = QdrantClient(url="http://localhost:6333")
client.create\_payload\_index(
collection\_name="{collection\_name}",
field\_name="name\_of\_the\_field\_to\_index",
field\_schema=models.TextIndexParams(
type=models.TextIndexType.TEXT,
tokenizer=models.TokenizerType.WORD,
min\_token\_len=2,
max\_token\_len=10,
lowercase=True,
),
)
`
```
```
`import { QdrantClient } from "@qdrant/js-client-rest";
const client = new QdrantClient({ host: "localhost", port: 6333 });
client.createPayloadIndex("{collection\_name}", {
field\_name: "name\_of\_the\_field\_to\_index",
field\_schema: {
type: "text",
tokenizer: "word",
min\_token\_len: 2,
max\_token\_len: 10,
lowercase: true,
},
});
`
```
```
`use qdrant\_client::qdrant::{
CreateFieldIndexCollectionBuilder,
TextIndexParamsBuilder,
FieldType,
TokenizerType,
};
use qdrant\_client::Qdrant;
let client = Qdrant::from\_url("http://localhost:6334").build()?;
let text\_index\_params = TextIndexParamsBuilder::new(TokenizerType::Word)
.min\_token\_len(2)
.max\_token\_len(10)
.lowercase(true);
client
.create\_field\_index(
CreateFieldIndexCollectionBuilder::new(
"{collection\_name}",
"name\_of\_the\_field\_to\_index",
FieldType::Text,
).field\_index\_params(text\_index\_params.build()),
)
.await?;
`
```
```
`import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
import io.qdrant.client.grpc.Collections.PayloadIndexParams;
import io.qdrant.client.grpc.Collections.PayloadSchemaType;
import io.qdrant.client.grpc.Collections.TextIndexParams;
import io.qdrant.client.grpc.Collections.TokenizerType;
QdrantClient client =
new QdrantClient(QdrantGrpcClient.newBuilder("localhost", 6334, false).build());
client
.createPayloadIndexAsync(
"{collection\_name}",
"name\_of\_the\_field\_to\_index",
PayloadSchemaType.Text,
PayloadIndexParams.newBuilder()
.setTextIndexParams(
TextIndexParams.newBuilder()
.setTokenizer(TokenizerType.Word)
.setMinTokenLen(2)
.setMaxTokenLen(10)
.setLowercase(true)
.build())
.build(),
null,
null,
null)
.get();
`
```
```
`using Qdrant.Client;
using Qdrant.Client.Grpc;
var client = new QdrantClient("localhost", 6334);
await client.CreatePayloadIndexAsync(
collectionName: "{collection\_name}",
fieldName: "name\_of\_the\_field\_to\_index",
schemaType: PayloadSchemaType.Text,
indexParams: new PayloadIndexParams
{
TextIndexParams = new TextIndexParams
{
Tokenizer = TokenizerType.Word,
MinTokenLen = 2,
MaxTokenLen = 10,
Lowercase = true
}
}
);
`
```
```
`import (
"context"
"github.com/qdrant/go-client/qdrant"
)
client, err := qdrant.NewClient(&qdrant.Config{
Host: "localhost",
Port: 6334,
})
client.CreateFieldIndex(context.Background(), &qdrant.CreateFieldIndexCollection{
CollectionName: "{collection\_name}",
FieldName: "name\_of\_the\_field\_to\_index",
FieldType: qdrant.FieldType\_FieldTypeText.Enum(),
FieldIndexParams: qdrant.NewPayloadIndexParamsText(
&qdrant.TextIndexParams{
Tokenizer: qdrant.TokenizerType\_Whitespace,
MinTokenLen: qdrant.PtrOf(uint64(2)),
MaxTokenLen: qdrant.PtrOf(uint64(10)),
Lowercase: qdrant.PtrOf(true),
}),
})
`
```
### Tokenizers
Tokenizers are algorithms used to split text into smaller units called tokens, which are then indexed and searched in a full-text index.
In the context of Qdrant, tokenizers determine how string payloads are broken down for efficient searching and filtering.
The choice of tokenizer affects how queries match the indexed text, supporting different languages, word boundaries, and search behaviours such as prefix or phrase matching.
Available tokenizers are:
* `word` (default) - splits the string into words, separated by spaces, punctuation marks, and special characters.
* `whitespace` - splits the string into words, separated by spaces.
* `prefix` - splits the string into words, separated by spaces, punctuation marks, and special characters, and then creates a prefix index for each word. For example: `hello` will be indexed as `h`, `he`, `hel`, `hell`, `hello`.
* `multilingual` - a special type of tokenizer based on multiple packages like [charabia](https://github.com/meilisearch/charabia) and [vaporetto](https://github.com/daac-tools/vaporetto) to deliver fast and accurate tokenization for a large variety of languages. It allows proper tokenization and lemmatization for multiple languages, including those with non-Latin alphabets and non-space delimiters. See the [charabia documentation](https://github.com/meilisearch/charabia) for a full list of supported languages and normalization options. Note: For the Japanese language, Qdrant relies on the `vaporetto` project, which has much less overhead compared to `charabia`, while maintaining comparable performance.### Lowercasing
By default, full-text search in Qdrant is case-insensitive. For example, users can search for the lowercase term `tv` and find text fields containing the uppercase word `TV`. Case-insensitivity is achieved by converting both the words in the index and the query terms to lowercase.
Lowercasing is enabled by default. To use case-sensitive full-text search, configure a full-text index with `lowercase` set to `false`.
```
`PUT /collections/{collection\_name}/index
{
"field\_name": "name\_of\_the\_field\_to\_index",
"field\_schema": {
"type": "text",
"tokenizer": "word",
"lowercase": false
}
}
`
```
```
`from qdrant\_client import QdrantClient, models
client = QdrantClient(url="http://localhost:6333")
client.create\_payload\_index(
collection\_name="{collection\_name}",
field\_name="name\_of\_the\_field\_to\_index",
field\_schema=models.TextIndexParams(
type=models.TextIndexType.TEXT,
tokenizer=models.TokenizerType.WORD,
lowercase=False,
),
)
`
```
```
`import { QdrantClient } from "@qdrant/js-client-rest";
const client = new QdrantClient({ host: "localhost", port: 6333 });
client.createPayloadIndex("{collection\_name}", {
field\_name: "name\_of\_the\_field\_to\_index",
field\_schema: {
type: "text",
tokenizer: "word",
lowercase: false,
},
});
`
```
```
`use qdrant\_client::qdrant::{
CreateFieldIndexCollectionBuilder,
TextIndexParamsBuilder,
FieldType,
TokenizerType,
};
use qdrant\_client::Qdrant;
let client = Qdrant::from\_url("http://localhost:6334").build()?;
let text\_index\_params = TextIndexParamsBuilder::new(TokenizerType::Word)
.lowercase(false);
client
.create\_field\_index(
CreateFieldIndexCollectionBuilder::new(
"{collection\_name}",
"name\_of\_the\_field\_to\_index",
FieldType::Text,
).field\_index\_params(text\_index\_params.build()),
)
.await?;
`
```
```
`import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
import io.qdrant.client.grpc.Collections.PayloadIndexParams;
import io.qdrant.client.grpc.Collections.PayloadSchemaType;
import io.qdrant.client.grpc.Collections.TextIndexParams;
import io.qdrant.client.grpc.Collections.TokenizerType;
QdrantClient client =
new QdrantClient(QdrantGrpcClient.newBuilder("localhost", 6334, false).build());
client
.createPayloadIndexAsync(
"{collection\_name}",
"name\_of\_the\_field\_to\_index",
PayloadSchemaType.Text,
PayloadIndexParams.newBuilder()
.setTextIndexParams(
TextIndexParams.newBuilder()
.setTokenizer(TokenizerType.Word)
.setLowercase(true)
.build())
.build(),
null,
null,
null)
.get();
`
```
```
`using Qdrant.Client;
using Qdrant.Client.Grpc;
var client = new QdrantClient("localhost", 6334);
await client.CreatePayloadIndexAsync(
collectionName: "{collection\_name}",
fieldName: "name\_of\_the\_field\_to\_index",
schemaType: PayloadSchemaType.Text,
indexParams: new PayloadIndexParams
{
TextIndexParams = new TextIndexParams
{
Tokenizer = TokenizerType.Word,
Lowercase = true,
}
}
);
`
```
```
`import (
"context"
"github.com/qdrant/go-client/qdrant"
)
client, err := qdrant.NewClient(&qdrant.Config{
Host: "localhost",
Port: 6334,
})
client.CreateFieldIndex(context.Background(), &qdrant.CreateFieldIndexCollection{
CollectionName: "{collection\_name}",
FieldName: "name\_of\_the\_field\_to\_index",
FieldType: qdrant.FieldType\_FieldTypeText.Enum(),
FieldIndexParams: qdrant.NewPayloadIndexParamsText(
&qdrant.TextIndexParams{
Tokenizer: qdrant.TokenizerType\_Word,
Lowercase: qdrant.PtrOf(true),
}),
})
`
```
### ASCII Folding
*Available as of v1.16.0*
When enabled, ASCII folding converts Unicode characters into their corresponding ASCII equivalents, for example, by removing diacritics. For instance, the character `ã` is changed into `a`, `ç` becomes `c`, and `é` is converted to `e`.
Because ASCII folding is applied to both the words in the index and the query terms, it increases recall. For example, users can search for `cafe` and also find text fields containing the word `café`.
ASCII folding is not enabled by default. To enable it, configure a full-text index with `ascii\_folding` set to `true`.
```
`PUT /collections/{collection\_name}/index
{
"field\_name": "name\_of\_the\_field\_to\_index",
"field\_schema": {
"type": "text",
"tokenizer": "word",
"ascii\_folding": true
}
}
`
```
```
`from qdrant\_client import QdrantClient, models
client = QdrantClient(url="http://localhost:6333")
client.create\_payload\_index(
collection\_name="{collection\_name}",
field\_name="name\_of\_the\_field\_to\_index",
field\_schema=models.TextIndexParams(
type=models.TextIndexType.TEXT,
tokenizer=models.TokenizerType.WORD,
ascii\_folding=True,
),
)
`
```
```
`import { QdrantClient } from "@qdrant/js-client-rest";
const client = new QdrantClient({ host: "localhost", port: 6333 });
client.createPayloadIndex("{collection\_name}", {
field\_name: "name\_of\_the\_field\_to\_index",
field\_schema: {
type: "text",
tokenizer: "word",
ascii\_folding: true,
},
});
`
```
```
`use qdrant\_client::qdrant::{
CreateFieldIndexCollectionBuilder,
TextIndexParamsBuilder,
FieldType,
TokenizerType,
};
use qdrant\_client::Qdrant;
let client = Qdrant::from\_url("http://localhost:6334").build()?;
let text\_index\_params = TextIndexParamsBuilder::new(TokenizerType::Word)
.ascii\_folding(true);
client
.create\_field\_index(
CreateFieldIndexCollectionBuilder::new(
"{collection\_name}",
"name\_of\_the\_field\_to\_index",
FieldType::Text,
).field\_index\_params(text\_index\_params.build()),
)
.await?;
`
```
```
`import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
import io.qdrant.client.grpc.Collections.PayloadIndexParams;
import io.qdrant.client.grpc.Collections.PayloadSchemaType;
import io.qdrant.client.grpc.Collections.TextIndexParams;
import io.qdrant.client.grpc.Collections.TokenizerType;
QdrantClient client =
new QdrantClient(QdrantGrpcClient.newBuilder("localhost", 6334, false).build());
client
.createPayloadIndexAsync(
"{collection\_name}",
"name\_of\_the\_field\_to\_index",
PayloadSchemaType.Text,
PayloadIndexParams.newBuilder()
.setTextIndexParams(
TextIndexParams.newBuilder()
.setTokenizer(TokenizerType.Word)
.setLowercase(true)
.setAsciiFolding(true)
.build())
.build(),
null,
null,
null)
.get();
`
```
```
`using Qdrant.Client;
using Qdrant.Client.Grpc;
var client = new QdrantClient("localhost", 6334);
await client.CreatePayloadIndexAsync(
collectionName: "{collection\_name}",
fieldName: "name\_of\_the\_field\_to\_index",
schemaType: PayloadSchemaType.Text,
indexParams: new PayloadIndexParams
{
TextIndexParams = new TextIndexParams
{
Tokenizer = TokenizerType.Word,
Lowercase = true,
AsciiFolding = true,
}
}
);
`
```
```
`import (
"context"
"github.com/qdrant/go-client/qdrant"
)
client, err := qdrant.NewClient(&qdrant.Config{
Host: "localhost",
Port: 6334,
})
client.CreateFieldIndex(context.Background(), &qdrant.CreateFieldIndexCollection{
CollectionName: "{collection\_name}",
FieldName: "name\_of\_the\_field\_to\_index",
FieldType: qdrant.FieldType\_FieldTypeText.Enum(),
FieldIndexParams: qdrant.NewPayloadIndexParamsText(
&qdrant.TextIndexParams{
Tokenizer: qdrant.TokenizerType\_Word,
Lowercase: qdrant.PtrOf(true),
AsciiFolding: qdrant.PtrOf(true),
}),
})
`
```
### Stemmer
A **stemmer** is an algorithm used in text processing to reduce words to their root or base form, known as the &ldquo;stem.&rdquo; For example, the words &ldquo;running&rdquo;, &ldquo;runner and &ldquo;runs&rdquo; can all be reduced to the stem &ldquo;run.&rdquo;
When configuring a full-text index in Qdrant, you can specify a stemmer to be used for a particular language. This enables the index to recognize and match different inflections or derivations of a word.
Qdrant provides an implementation of [Snowball stemmer](https://snowballstem.org/), a widely used and performant variant for some of the most popular languages.
For the list of supported languages, please visit the [rust-stemmers repository](https://github.com/qdrant/rust-stemmers).
For full-text indices, stemming is not enabled by default. To enable it, configure the `snowball` stemmer with the desired language:
```
`PUT /collections/{collection\_name}/index
{
"field\_name": "name\_of\_the\_field\_to\_index",
"field\_schema": {
"type": "text",
"tokenizer": "word",
"stemmer": {
"type": "snowball",
"language": "english"
}
}
}
`
```
```
`from qdrant\_client import QdrantClient, models
client = QdrantClient(url="http://localhost:6333")
client.create\_payload\_index(
collection\_name="{collection\_name}",
field\_name="name\_of\_the\_field\_to\_index",
field\_schema=models.TextIndexParams(
type=models.TextIndexType.TEXT,
tokenizer=models.TokenizerType.WORD,
stemmer=models.SnowballParams(
type=models.Snowball.SNOWBALL,
language=models.SnowballLanguage.ENGLISH
)
),
)
`
```
```
`import { QdrantClient } from "@qdrant/js-client-rest";
const client = new QdrantClient({ host: "localhost", port: 6333 });
client.createPayloadIndex("{collection\_name}", {
field\_name: "name\_of\_the\_field\_to\_index",
field\_schema: {
type: "text",
tokenizer: "word",
stemmer: {
type: "snowball",
language: "english"
}
}
});
`
```
```
`use qdrant\_client::qdrant::{
CreateFieldIndexCollectionBuilder,
TextIndexParamsBuilder,
FieldType,
TokenizerType,
};
use qdrant\_client::Qdrant;
let client = Qdrant::from\_url("http://localhost:6334").build()?;
let text\_index\_params = TextIndexParamsBuilder::new(TokenizerType::Word)
.snowball\_stemmer("english".to\_string());
client
.create\_field\_index(
CreateFieldIndexCollectionBuilder::new(
"{collection\_name}",
"{field\_name}",
FieldType::Text,
).field\_index\_params(text\_index\_params.build()),
)
.await?;
`
```
```
`import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
import io.qdrant.client.grpc.Collections.PayloadIndexParams;
import io.qdrant.client.grpc.Collections.PayloadSchemaType;
import io.qdrant.client.grpc.Collections.SnowballParams;
import io.qdrant.client.grpc.Collections.StemmingAlgorithm;
import io.qdrant.client.grpc.Collections.TextIndexParams;
import io.qdrant.client.grpc.Collections.TokenizerType;
QdrantClient client =
new QdrantClient(QdrantGrpcClient.newBuilder("localhost", 6334, false).build());
client
.createPayloadIndexAsync(
"{collection\_name}",
"name\_of\_the\_field\_to\_index",
PayloadSchemaType.Text,
PayloadIndexParams.newBuilder()
.setTextIndexParams(
TextIndexParams.newBuilder()
.setTokenizer(TokenizerType.Word)
.setStemmer(
StemmingAlgorithm.newBuilder()
.setSnowball(
SnowballParams.newBuilder().setLanguage("english").build())
.build())
.build())
.build(),
true,
null,
null)
.get();
`
```
```
`using Qdrant.Client;
using Qdrant.Client.Grpc;
var client = new QdrantClient("localhost", 6334);
await client.CreatePayloadIndexAsync(
collectionName: "{collection\_name}",
fieldName: "name\_of\_the\_field\_to\_index",
schemaType: PayloadSchemaType.Text,
indexParams: new PayloadIndexParams
{
TextIndexParams = new TextIndexParams
{
Tokenizer = TokenizerType.Word,
Stemmer = new StemmingAlgorithm
{
Snowball = new SnowballParams
{
Language = "english"
}
}
}
}
);
`
```
```
`import (
"context"
"github.com/qdrant/go-client/qdrant"
)
client, err := qdrant.NewClient(&qdrant.Config{
Host: "localhost",
Port: 6334,
})
client.CreateFieldIndex(context.Background(), &qdrant.CreateFieldIndexCollection{
CollectionName: "{collection\_name}",
FieldName: "name\_of\_the\_field\_to\_index",
FieldType: qdrant.FieldType\_FieldTypeText.Enum(),
FieldIndexParams: qdrant.NewPayloadIndexParamsText(
&qdrant.TextIndexParams{
Tokenizer: qdrant.TokenizerType\_Word,
Stemmer: qdrant.NewStemmingAlgorithmSnowball(&qdrant.SnowballParams{
Language: "english",
}),
}),
})
`
```
### Stopwords
Stopwords are common words (such as &ldquo;the&rdquo;, &ldquo;is&rdquo;, &ldquo;at&rdquo;, &ldquo;which&rdquo;, and &ldquo;on&rdquo;) that are often filtered out during text processing because they carry little meaningful information for search and retrieval tasks.
In Qdrant, you can specify a list of stopwords to be ignored during full-text indexing and search. This helps simplify search queries and improves relevance.
You can configure stopwords based on predefined languages, as well as extend existing stopword lists with custom words.
For full-text indices, stopword removal is not enabled by default. To enable it, configure the `stopwords` parameter with the desired languages and any custom stopwords:
```
`// Simple
PUT /collections/{collection\_name}/index
{
"field\_name": "name\_of\_the\_field\_to\_index",
"field\_schema": {
"type": "text",
"tokenizer": "word",
"stopwords": "english"
}
}
// Explicit
PUT /collections/{collection\_name}/index
{
"field\_name": "name\_of\_the\_field\_to\_index",
"field\_schema": {
"type": "text",
"tokenizer": "word",
"stopwords": {
"languages": [
"english",
"spanish"
],
"custom": [
"example"
]
}
}
}
`
```
```
`from qdrant\_client import QdrantClient, models
client = QdrantClient(url="http://localhost:6333")
# Simple
client.create\_payload\_index(
collection\_name="{collection\_name}",
field\_name="name\_of\_the\_field\_to\_index",
field\_schema=models.TextIndexParams(
type=models.TextIndexType.TEXT,
tokenizer=models.TokenizerType.WORD,
stopwords=models.Language.ENGLISH,
),
)
# Explicit
client.create\_payload\_index(
collection\_name="{collection\_name}",
field\_name="name\_of\_the\_field\_to\_index",
field\_schema=models.TextIndexParams(
type=models.TextIndexType.TEXT,
tokenizer=models.TokenizerType.WORD,
stopwords=models.StopwordsSet(
languages=[
models.Language.ENGLISH,
models.Language.SPANISH,
],
custom=[
"example"
]
),
),
)
`
```
```
`import { QdrantClient } from "@qdrant/js-client-rest";
const client = new QdrantClient({ host: "localhost", port: 6333 });
// Simple
client.createPayloadIndex("{collection\_name}", {
field\_name: "name\_of\_the\_field\_to\_index",
field\_schema: {
type: "text",
tokenizer: "word",
stopwords: "english"
},
});
// Explicit
client.createPayloadIndex("{collection\_name}", {
field\_name: "name\_of\_the\_field\_to\_index",
field\_schema: {
type: "text",
tokenizer: "word",
stopwords: {
languages: [
"english",
"spanish"
],
custom: [
"example"
]
}
},
});
`
```
```
`use qdrant\_client::qdrant::{
CreateFieldIndexCollectionBuilder,
TextIndexParamsBuilder,
FieldType,
TokenizerType,
StopwordsSet,
};
use qdrant\_client::Qdrant;
let client = Qdrant::from\_url("http://localhost:6334").build()?;
// Simple
let text\_index\_params = TextIndexParamsBuilder::new(TokenizerType::Word)
.stopwords\_language("english".to\_string());
client
.create\_field\_index(
CreateFieldIndexCollectionBuilder::new(
"{collection\_name}",
"name\_of\_the\_field\_to\_index",
FieldType::Text,
).field\_index\_params(text\_index\_params.build()),
)
.await?;
// Explicit
let text\_index\_params = TextIndexParamsBuilder::new(TokenizerType::Word)
.stopwords(StopwordsSet {
languages: vec![
"english".to\_string(),
"spanish".to\_string(),
],
custom: vec!["example".to\_string()],
});
client
.create\_field\_index(
CreateFieldIndexCollectionBuilder::new(
"{collection\_name}",
"{field\_name}",
FieldType::Text,
).field\_index\_params(text\_index\_params.build()),
)
.await?;
`
```
```
`import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
import io.qdrant.client.grpc.Collections.PayloadIndexParams;
import io.qdrant.client.grpc.Collections.PayloadSchemaType;
import io.qdrant.client.grpc.Collections.StopwordsSet;
import io.qdrant.client.grpc.Collections.TextIndexParams;
import io.qdrant.client.grpc.Collections.TokenizerType;
import java.util.List;
QdrantClient client =
new QdrantClient(QdrantGrpcClient.newBuilder("localhost", 6334, false).build());
client
.createPayloadIndexAsync(
"{collection\_name}",
"name\_of\_the\_field\_to\_index",
PayloadSchemaType.Text,
PayloadIndexParams.newBuilder()
.setTextIndexParams(
TextIndexParams.newBuilder()
.setTokenizer(TokenizerType.Word)
.setStopwords(
StopwordsSet.newBuilder()
.addAllLanguages(List.of("english", "spanish"))
.addAllCustom(List.of("example"))
.build())
.build())
.build(),
true,
null,
null)
.get();
`
```
```
`using Qdrant.Client;
using Qdrant.Client.Grpc;
var client = new QdrantClient("localhost", 6334);
await client.CreatePayloadIndexAsync(
collectionName: "{collection\_name}",
fieldName: "name\_of\_the\_field\_to\_index",
schemaType: PayloadSchemaType.Text,
indexParams: new PayloadIndexParams
{
TextIndexParams = new TextIndexParams
{
Tokenizer = TokenizerType.Word,
Stopwords = new StopwordsSet
{
Languages = { "english", "spanish" },
Custom = { "example" }
}
}
}
);
`
```
```
`import (
"context"
"github.com/qdrant/go-client/qdrant"
)
client, err := qdrant.NewClient(&qdrant.Config{
Host: "localhost",
Port: 6334,
})
client.CreateFieldIndex(context.Background(), &qdrant.CreateFieldIndexCollection{
CollectionName: "{collection\_name}",
FieldName: "name\_of\_the\_field\_to\_index",
FieldType: qdrant.FieldType\_FieldTypeText.Enum(),
FieldIndexParams: qdrant.NewPayloadIndexParamsText(
&qdrant.TextIndexParams{
Tokenizer: qdrant.TokenizerType\_Word,
Stopwords: &qdrant.StopwordsSet{
Languages: []string{"english", "spanish"},
Custom: []string{"example"},
},
}),
})
`
```
### Phrase Search
Phrase search in Qdrant allows you to find documents or points where a specific sequence of words appears together, in the same order, within a text payload field.
This is useful when you want to match exact phrases rather than individual words scattered throughout the text.
When using a full-text index with phrase search enabled, you can perform phrase search by enclosing the desired phrase in double quotes in your filter query.
For example, searching for `"machine learning"` will only return results where the words &ldquo;machine&rdquo; and &ldquo;learning&rdquo; appear together as a phrase, not just anywhere in the text.
For efficient phrase search, Qdrant requires building an additional data structure, so it needs to be configured during the creation of the full-text index:
```
`PUT /collections/{collection\_name}/index
{
"field\_name": "name\_of\_the\_field\_to\_index",
"field\_schema": {
"type": "text",
"tokenizer": "word",
"lowercase": true,
"phrase\_matching": true
}
}
`
```
```
`from qdrant\_client import QdrantClient, models
client = QdrantClient(url="http://localhost:6333")
client.create\_payload\_index(
collection\_name="{collection\_name}",
field\_name="name\_of\_the\_field\_to\_index",
field\_schema=models.TextIndexParams(
type=models.TextIndexType.TEXT,
tokenizer=models.TokenizerType.WORD,
lowercase=True,
phrase\_matching=True,
),
)
`
```
```
`import { QdrantClient } from "@qdrant/js-client-rest";
const client = new QdrantClient({ host: "localhost", port: 6333 });
client.createPayloadIndex("{collection\_name}", {
field\_name: "name\_of\_the\_field\_to\_index",
field\_schema: {
type: "text",
tokenizer: "word",
lowercase: true,
phrase\_matching: true,
},
});
`
```
```
`use qdrant\_client::qdrant::{
CreateFieldIndexCollectionBuilder,
TextIndexParamsBuilder,
FieldType,
TokenizerType,
};
use qdrant\_client::Qdrant;
let client = Qdrant::from\_url("http://localhost:6334").build()?;
let text\_index\_params = TextIndexParamsBuilder::new(TokenizerType::Word)
.phrase\_matching(true)
.lowercase(true);
client
.create\_field\_index(
CreateFieldIndexCollectionBuilder::new(
"{collection\_name}",
"name\_of\_the\_field\_to\_index",
FieldType::Text,
).field\_index\_params(text\_index\_params.build()),
)
.await?;
`
```
```
`import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
import io.qdrant.client.grpc.Collections.PayloadIndexParams;
import io.qdrant.client.grpc.Collections.PayloadSchemaType;
import io.qdrant.client.grpc.Collections.TextIndexParams;
import io.qdrant.client.grpc.Collections.TokenizerType;
QdrantClient client =
new QdrantClient(QdrantGrpcClient.newBuilder("localhost", 6334, false).build());
client
.createPayloadIndexAsync(
"{collection\_name}",
"name\_of\_the\_field\_to\_index",
PayloadSchemaType.Text,
PayloadIndexParams.newBuilder()
.setTextIndexParams(
TextIndexParams.newBuilder()
.setTokenizer(TokenizerType.Word)
.setLowercase(true)
.setPhraseMatching(true)
.build())
.build(),
null,
null,
null)
.get();
`
```
```
`using Qdrant.Client;
using Qdrant.Client.Grpc;
var client = new QdrantClient("localhost", 6334);
await client.CreatePayloadIndexAsync(
collectionName: "{collection\_name}",
fieldName: "name\_of\_the\_field\_to\_index",
schemaType: PayloadSchemaType.Text,
indexParams: new PayloadIndexParams
{
TextIndexParams = new TextIndexParams
{
Tokenizer = TokenizerType.Word,
Lowercase = true,
PhraseMatching = true
}
}
);
`
```
```
`import (
"context"
"github.com/qdrant/go-client/qdrant"
)
client, err := qdrant.NewClient(&qdrant.Config{
Host: "localhost",
Port: 6334,
})
client.CreateFieldIndex(context.Background(), &qdrant.CreateFieldIndexCollection{
CollectionName: "{collection\_name}",
FieldName: "name\_of\_the\_field\_to\_index",
FieldType: qdrant.FieldType\_FieldTypeText.Enum(),
FieldIndexParams: qdrant.NewPayloadIndexParamsText(
&qdrant.TextIndexParams{
Tokenizer: qdrant.TokenizerType\_Whitespace,
Lowercase: qdrant.PtrOf(true),
PhraseMatching: qdrant.PtrOf(true),
}),
})
`
```
See [Phrase Match](https://qdrant.tech/documentation/search/filtering/#phrase-match) for examples of querying phrases with a full-text index.
## Vector Index
A vector index is a data structure built on vectors through a specific mathematical model.
Through the vector index, we can efficiently query several vectors similar to the target vector.
Qdrant currently only uses HNSW as a dense vector index.
[HNSW](https://arxiv.org/abs/1603.09320) (Hierarchical Navigable Small World Graph) is a graph-based indexing algorithm. It builds a multi-layer navigation structure for an image according to certain rules. In this structure, the upper layers are more sparse and the distances between nodes are farther. The lower layers are denser and the distances between nodes are closer. The search starts from the uppermost layer, finds the node closest to the target in this layer, and then enters the next layer to begin another search. After multiple iterations, it can quickly approach the target position.
In order to improve performance, HNSW limits the maximum degree of nodes on each layer of the graph to `m`. In addition, you can use `ef\_construct` (when building an index) or `ef` (when searching targets) to specify a search range.
The corresponding parameters could be configured in the configuration file:
```
`storage:
# Default parameters of HNSW Index. Could be overridden for each collection or named vector individually
hnsw\_index:
# Number of edges per node in the index graph.
# Larger the value - more accurate the search, more space required.
m: 16
# Number of neighbours to consider during the index building.
# Larger the value - more accurate the search, more time required to build index.
ef\_construct: 100
# Minimal size threshold (in KiloBytes) below which full-scan is preferred over HNSW search.
# This measures the total size of vectors being queried against.
# When the maximum estimated amount of points that a condition satisfies is smaller than
# `full\_scan\_threshold\_kb`, the query planner will use full-scan search instead of HNSW index
# traversal for better performance.
# Note: 1Kb = 1 vector of size 256
full\_scan\_threshold: 10000
`
```
And so in the process of creating a [collection](https://qdrant.tech/documentation/manage-data/collections/). The `ef` parameter is configured during [the search](https://qdrant.tech/documentation/search/search/) and by default is equal to `ef\_construct`.
HNSW is chosen for several reasons.
First, HNSW is well-compatible with the modification that allows Qdrant to use filters during a search.
Second, it is one of the most accurate and fastest algorithms, according to [public benchmarks](https://github.com/erikbern/ann-benchmarks).
*Available as of v1.1.1*
The HNSW parameters can also be configured on a collection and named vector
level by setting [`hnsw\_config`](https://qdrant.tech/documentation/manage-data/indexing/#vector-index) to fine-tune search
performance.
### Filterable HNSW Index
Separately, a payload index and a vector index cannot completely address the challenges of filtered search.
In the case of high-selectivity (weak) filters, you can use the HNSW index as it is.
In the case of low-selectivity (strict) filters, you can use the payload index and do a complete rescore.
However, for cases in the middle, this approach does not work well.
On one hand, we cannot apply a full scan on too many vectors.
On the other hand, the HNSW graph starts to fall apart when using filters that are too strict.
Qdrant solves this problem by extending the HNSW graph with additional edges based on indexed payload values.
Extra edges allow you to efficiently search for nearby vectors using the HNSW index and apply filters as you search in the graph.
You can find more information on this approach in our [article](https://qdrant.tech/articles/filterable-hnsw/).
For the HNSW graph to be optimized for filtered search, it's highly recommended to create all payload indices immediately after collection creation, before ingesting data. Extra edges for the HNSW graph can only be generated after payload index creation.#### The ACORN Search Algorithm
*Available as of v1.16.0*
In some cases, the additional edges built for Qdrant&rsquo;s filterable HNSW may not be sufficient.
These extra edges are added for each payload index separately, but not for every possible combination of payload indices.
As a result, a combination of two or more strict filters might still lead to disconnected graph components.
The same can happen when there are a large number of soft-deleted points in the graph.
In such cases, use the [ACORN Search Algorithm](https://qdrant.tech/documentation/search/search/#acorn-search-algorithm).
When using ACORN, during graph traversal, it explores not just direct neighbors (first hop), but also neighbors of neighbors (second hop) when direct neighbors are filtered out. This improves search accuracy at the cost of performance.
#### Disable the Creation of Extra Edges for Payload Fields
*Available as of v1.17.0*
Not all payload indices may be intended for use with dense vector search. For example, when a collection contains both dense and sparse vectors, some payload fields may only be used to filter sparse vector searches. Since sparse vector search does not use the HNSW index, it is unnecessary to build extra edges in the HNSW graph for these fields. Creating extra edges adds indexing latency and increases the size of the HNSW graph, which consumes memory as well as disk space, so you may want to disable it for fields that do not require it.
You can disable the creation of extra edges for an indexed payload field by setting `enable\_hnsw` to `false` when configuring a payload index:
```
`PUT /collections/{collection\_name}/index
{
"field\_name": "name\_of\_the\_field\_to\_index",
"field\_schema": {
"type": "keyword",
"enable\_hnsw": false
}
}
`
```
```
`from qdrant\_client import QdrantClient, models
client = QdrantClient(url="http://localhost:6333")
client.create\_payload\_index(
collection\_name="{collection\_name}",
field\_name="name\_of\_the\_field\_to\_index",
field\_schema=models.TextIndexParams(
type=models.TextIndexType.TEXT,
tokenizer=models.TokenizerType.WORD,
enable\_hnsw=False,
),
)
`
```
```
`client.createPayloadIndex("{collection\_name}", {
field\_name: "name\_of\_the\_field\_to\_index",
field\_schema: {
type: "keyword",
enable\_hnsw: false,
},
});
`
```
```
`use qdrant\_client::qdrant::{
CreateFieldIndexCollectionBuilder, FieldType, KeywordIndexParamsBuilder,
};
use qdrant\_client::Qdrant;
let client = Qdrant::from\_url("http://localhost:6334").build()?;
client
.create\_field\_index(
CreateFieldIndexCollectionBuilder::new(
"{collection\_name}",
"name\_of\_the\_field\_to\_index",
FieldType::Keyword,
)
.field\_index\_params(KeywordIndexParamsBuilder::default().enable\_hnsw(false)),
)
.await?;
`
```
```
`import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
import io.qdrant.client.grpc.Collections.KeywordIndexParams;
import io.qdrant.client.grpc.Collections.PayloadIndexParams;
import io.qdrant.client.grpc.Collections.PayloadSchemaType;
QdrantClient client =
new QdrantClient(QdrantGrpcClient.newBuilder("localhost", 6334, false).build());
client
.createPayloadIndexAsync(
"{collection\_name}",
"name\_of\_the\_field\_to\_index",
PayloadSchemaType.Keyword,
PayloadIndexParams.newBuilder()
.setKeywordIndexParams(
KeywordIndexParams.newBuilder()
.setEnableHnsw(false)
.build())
.build(),
null,
null,
null)
.get();
`
```
```
`using Qdrant.Client;
using Qdrant.Client.Grpc;
var client = new QdrantClient("localhost", 6334);
await client.CreatePayloadIndexAsync(
collectionName: "{collection\_name}",
fieldName: "name\_of\_the\_field\_to\_index",
schemaType: PayloadSchemaType.Keyword,
indexParams: new PayloadIndexParams
{
KeywordIndexParams = new KeywordIndexParams
{
EnableHnsw = false
}
}
);
`
```
```
`import (
"context"
"github.com/qdrant/go-client/qdrant"
)
client, err := qdrant.NewClient(&qdrant.Config{
Host: "localhost",
Port: 6334,
})
client.CreateFieldIndex(context.Background(), &qdrant.CreateFieldIndexCollection{
CollectionName: "{collection\_name}",
FieldName: "name\_of\_the\_field\_to\_index",
FieldType: qdrant.FieldType\_FieldTypeKeyword.Enum(),
FieldIndexParams: qdrant.NewPayloadIndexParamsKeyword(
&qdrant.KeywordIndexParams{
EnableHnsw: qdrant.PtrOf(false),
}),
})
`
```
## Sparse Vector Index
*Available as of v1.7.0*
Sparse vectors in Qdrant are indexed with a special data structure, which is optimized for vectors that have a high proportion of zeroes. In some ways, this indexing method is similar to the inverted index, which is used in text search engines.
* A sparse vector index in Qdrant is exact, meaning it does not use any approximation algorithms.
* All sparse vectors added to the collection are immediately indexed in the mutable version of a sparse index.
With Qdrant, you can benefit from a more compact and efficient immutable sparse index, which is constructed during the same optimization process as the dense vector index.
This approach is particularly useful for collections storing both dense and sparse vectors.
To configure a sparse vector index, create a collection with the following parameters:
```
`PUT /collections/{collection\_name}
{
"sparse\_vectors": {
"text": {
"index": {
"on\_disk": false
}
}
}
}
`
```
```
`from qdrant\_client import QdrantClient, models
client = QdrantClient(url="http://localhost:6333")
client.create\_collection(
collection\_name="{collection\_name}",
vectors\_config={},
sparse\_vectors\_config={
"text": models.SparseVectorParams(
index=models.SparseIndexParams(on\_disk=False),
)
},
)
`
```
```
`import { QdrantClient, Schemas } from "@qdrant/js-client-rest";
const client = new QdrantClient({ host: "localhost", port: 6333 });
client.createCollection("{collection\_name}", {
sparse\_vectors: {
"splade-model-name": {
index: {
on\_disk: false
}
}
}
});
`
```
```
`use qdrant\_client::qdrant::{
CreateCollectionBuilder, SparseIndexConfigBuilder, SparseVectorParamsBuilder,
SparseVectorsConfigBuilder,
};
use qdrant\_client::Qdrant;
let client = Qdrant::from\_url("http://localhost:6334").build()?;
let mut sparse\_vectors\_config = SparseVectorsConfigBuilder::default();
sparse\_vectors\_config.add\_named\_vector\_params(
"splade-model-name",
SparseVectorParamsBuilder::default()
.index(SparseIndexConfigBuilder::default().on\_disk(true)),
);
client
.create\_collection(
CreateCollectionBuilder::new("{collection\_name}")
.sparse\_vectors\_config(sparse\_vectors\_config),
)
.await?;
`
```
```
`import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
import io.qdrant.client.grpc.Collections;
QdrantClient client = new QdrantClient(
QdrantGrpcClient.newBuilder("localhost", 6334, false).build());
client.createCollectionAsync(
Collections.CreateCollection.newBuilder()
.setCollectionName("{collection\_name}")
.setSparseVectorsConfig(
Collections.SparseVectorConfig.newBuilder().putMap(
"splade-model-name",
Collections.SparseVectorParams.newBuilder()
.setIndex(
Collections.SparseIndexConfig
.newBuilder()
.setOnDisk(false)
.build()
).build()
).build()
).build()
).get();
`
```
```
`using Qdrant.Client;
using Qdrant.Client.Grpc;
var client = new QdrantClient("localhost", 6334);
await client.CreateCollectionAsync(
collectionName: "{collection\_name}",
sparseVectorsConfig: ("splade-model-name", new SparseVectorParams{
Index = new SparseIndexConfig {
OnDisk = false,
}
})
);
`
```
```
`import (
"context"
"github.com/qdrant/go-client/qdrant"
)
client, err := qdrant.NewClient(&qdrant.Config{
Host: "localhost",
Port: 6334,
})
client.CreateCollection(context.Background(), &qdrant.CreateCollection{
CollectionName: "{collection\_name}",
SparseVectorsConfig: qdrant.NewSparseVectorsConfig(
map[string]\*qdrant.SparseVectorParams{
"splade-model-name": {
Index: &qdrant.SparseIndexConfig{
OnDisk: qdrant.PtrOf(false),
}},
}),
})
`
```
`
The following parameters may affect performance:
* `on\_disk: true` - The index is stored on disk, which lets you save memory. This may slow down search performance.
* `on\_disk: false` - The index is still persisted on disk, but it is also loaded into memory for faster search.
Unlike a dense vector index, a sparse vector index does not require a predefined vector size. It automatically adjusts to the size of the vectors added to the collection.
**Note:** A sparse vector index only supports dot-product similarity searches. It does not support other distance metrics.
### IDF Modifier
*Available as of v1.10.0*
For many search algorithms, it is important to consider how often an item occurs in a collection.
Intuitively speaking, the less frequently an item appears in a collection, the more important it is in a search.
This is also known as the Inverse Document Frequency (IDF). It is used in text search engines to rank search results based on the rarity of a word in a collection.
IDF depends on the currently stored documents and therefore can&rsquo;t be pre-computed in the sparse vectors in streaming inference mode.
In order to support IDF in the sparse vector index, Qdrant provides an option to modify the sparse vector query with the IDF statistics automatically.
The only requirement is to enable the IDF modifier in the collection configuration:
```
`PUT /collections/{collection\_name}
{
"sparse\_vectors": {
"text": {
"modifier": "idf"
}
}
}
`
```
```
`from qdrant\_client import QdrantClient, models
client = QdrantClient(url="http://localhost:6333")
client.create\_collection(
collection\_name="{collection\_name}",
vectors\_config={},
sparse\_vectors\_config={
"text": models.SparseVectorParams(
modifier=models.Modifier.IDF,
),
},
)
`
```
```
`import { QdrantClient, Schemas } from "@qdrant/js-client-rest";
const client = new QdrantClient({ host: "localhost", port: 6333 });
client.createCollection("{collection\_name}", {
sparse\_vectors: {
"text": {
modifier: "idf"
}
}
});
`
```
```
`use qdrant\_client::qdrant::{
CreateCollectionBuilder, Modifier, SparseVectorParamsBuilder, SparseVectorsConfigBuilder,
};
use qdrant\_client::Qdrant;
let client = Qdrant::from\_url("http://localhost:6334").build()?;
let mut sparse\_vectors\_config = SparseVectorsConfigBuilder::default();
sparse\_vectors\_config.add\_named\_vector\_params(
"text",
SparseVectorParamsBuilder::default().modifier(Modifier::Idf),
);
client
.create\_collection(
CreateCollectionBuilder::new("{collection\_name}")
.sparse\_vectors\_config(sparse\_vectors\_config),
)
.await?;
`
```
```
`import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
import io.qdrant.client.grpc.Collections.CreateCollection;
import io.qdrant.client.grpc.Collections.Modifier;
import io.qdrant.client.grpc.Collections.SparseVectorConfig;
import io.qdrant.client.grpc.Collections.SparseVectorParams;
QdrantClient client =
new QdrantClient(QdrantGrpcClient.newBuilder("localhost", 6334, false).build());
client
.createCollectionAsync(
CreateCollection.newBuilder()
.setCollectionName("{collection\_name}")
.setSparseVectorsConfig(
SparseVectorConfig.newBuilder()
.putMap("text", SparseVectorParams.newBuilder().setModifier(Modifier.Idf).build()))
.build())
.get();
`
```
```
`using Qdrant.Client;
using Qdrant.Client.Grpc;
var client = new QdrantClient("localhost", 6334);
await client.CreateCollectionAsync(
collectionName: "{collection\_name}",
sparseVectorsConfig: ("text", new SparseVectorParams {
Modifier = Modifier.Idf,
})
);
`
```
```
`import (
"context"
"github.com/qdrant/go-client/qdrant"
)
client, err := qdrant.NewClient(&qdrant.Config{
Host: "localhost",
Port: 6334,
})
client.CreateCollection(context.Background(), &qdrant.CreateCollection{
CollectionName: "{collection\_name}",
SparseVectorsConfig: qdrant.NewSparseVectorsConfig(
map[string]\*qdrant.SparseVectorParams{
"text": {
Modifier: qdrant.Modifier\_Idf.Enum(),
},
}),
})
`
```
Qdrant uses the following formula to calculate the IDF modifier:
$$
\\text{IDF}(q\_i) = \\ln \\left(\\frac{N - n(q\_i) + 0.5}{n(q\_i) + 0.5}+1\\right)
$$
Where:
* `N` is the total number of documents in the collection.
* `n` is the number of documents containing non-zero values for the given vector element.
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/manage-data/indexing.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/manage-data/indexing/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/manage-data/indexing.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)