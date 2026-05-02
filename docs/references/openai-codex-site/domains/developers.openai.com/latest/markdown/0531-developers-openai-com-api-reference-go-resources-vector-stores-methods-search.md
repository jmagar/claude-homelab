Search vector store | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Vector Stores](/api/reference/go/resources/vector_stores)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Search vector store
client.VectorStores.Search(ctx, vectorStoreID, body) (\*Page[[VectorStoreSearchResponse](</api/reference/go/resources/vector_stores#(resource) vector_stores > (model) VectorStoreSearchResponse > (schema)>)], error)
POST/vector\_stores/{vector\_store\_id}/search
Search a vector store for relevant chunks based on a query and file attributes filter.
##### ParametersExpand Collapse
vectorStoreID string
[](<#(resource) vector_stores > (method) search > (params) default > (param) vector_store_id > (schema)>)
body VectorStoreSearchParams
Query param.Field[[VectorStoreSearchParamsQueryUnion](</api/reference/go/resources/vector_stores/methods/search#(resource) vector_stores > (method) search > (params) default > (param) query > (schema)>)]
A query string for a search
string
[](<#(resource) vector_stores > (method) search > (params) default > (param) query > (schema) > (variant) 0>)
type VectorStoreSearchParamsQueryArray []string
[](<#(resource) vector_stores > (method) search > (params) default > (param) query > (schema) > (variant) 1>)
[](<#(resource) vector_stores > (method) search > (params) default > (param) query>)
Filters param.Field[[VectorStoreSearchParamsFiltersUnion](</api/reference/go/resources/vector_stores/methods/search#(resource) vector_stores > (method) search > (params) default > (param) filters > (schema)>)]Optional
A filter to apply based on file attributes.
type ComparisonFilter struct{…}
A filter used to compare a specified attribute key to a given value using a defined comparison operation.
Key string
The key to compare against the value.
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) key>)
Type ComparisonFilterType
Specifies the comparison operator: `eq`, `ne`, `gt`, `gte`, `lt`, `lte`, `in`, `nin`.
* `eq`: equals
* `ne`: not equal
* `gt`: greater than
* `gte`: greater than or equal
* `lt`: less than
* `lte`: less than or equal
* `in`: in
* `nin`: not in
One of the following:
const ComparisonFilterTypeEq ComparisonFilterType = "eq"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 0>)
const ComparisonFilterTypeNe ComparisonFilterType = "ne"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 1>)
const ComparisonFilterTypeGt ComparisonFilterType = "gt"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 2>)
const ComparisonFilterTypeGte ComparisonFilterType = "gte"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 3>)
const ComparisonFilterTypeLt ComparisonFilterType = "lt"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 4>)
const ComparisonFilterTypeLte ComparisonFilterType = "lte"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 5>)
const ComparisonFilterTypeIn ComparisonFilterType = "in"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 6>)
const ComparisonFilterTypeNin ComparisonFilterType = "nin"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 7>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type>)
Value ComparisonFilterValueUnion
The value to compare against the attribute key; supports string, number, or boolean types.
One of the following:
string
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 0>)
float64
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 1>)
bool
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 2>)
type ComparisonFilterValueArray []ComparisonFilterValueArrayItemUnion
One of the following:
string
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3 > (items) > (variant) 0>)
float64
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3 > (items) > (variant) 1>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value>)
[](<#(resource) $shared > (model) comparison_filter > (schema)>)
type CompoundFilter struct{…}
Combine multiple filters using `and` or `or`.
Filters [][ComparisonFilter](</api/reference/go/resources/$shared#(resource) $shared > (model) comparison_filter > (schema)>)
Array of filters to combine. Items can be `ComparisonFilter` or `CompoundFilter`.
One of the following:
type ComparisonFilter struct{…}
A filter used to compare a specified attribute key to a given value using a defined comparison operation.
Key string
The key to compare against the value.
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) key>)
Type ComparisonFilterType
Specifies the comparison operator: `eq`, `ne`, `gt`, `gte`, `lt`, `lte`, `in`, `nin`.
* `eq`: equals
* `ne`: not equal
* `gt`: greater than
* `gte`: greater than or equal
* `lt`: less than
* `lte`: less than or equal
* `in`: in
* `nin`: not in
One of the following:
const ComparisonFilterTypeEq ComparisonFilterType = "eq"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 0>)
const ComparisonFilterTypeNe ComparisonFilterType = "ne"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 1>)
const ComparisonFilterTypeGt ComparisonFilterType = "gt"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 2>)
const ComparisonFilterTypeGte ComparisonFilterType = "gte"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 3>)
const ComparisonFilterTypeLt ComparisonFilterType = "lt"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 4>)
const ComparisonFilterTypeLte ComparisonFilterType = "lte"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 5>)
const ComparisonFilterTypeIn ComparisonFilterType = "in"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 6>)
const ComparisonFilterTypeNin ComparisonFilterType = "nin"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 7>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type>)
Value ComparisonFilterValueUnion
The value to compare against the attribute key; supports string, number, or boolean types.
One of the following:
string
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 0>)
float64
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 1>)
bool
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 2>)
type ComparisonFilterValueArray []ComparisonFilterValueArrayItemUnion
One of the following:
string
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3 > (items) > (variant) 0>)
float64
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3 > (items) > (variant) 1>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value>)
[](<#(resource) $shared > (model) comparison_filter > (schema)>)
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) filters>)
Type CompoundFilterType
Type of operation: `and` or `or`.
One of the following:
const CompoundFilterTypeAnd CompoundFilterType = "and"
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) type > (member) 0>)
const CompoundFilterTypeOr CompoundFilterType = "or"
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) type > (member) 1>)
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) type>)
[](<#(resource) $shared > (model) compound_filter > (schema)>)
[](<#(resource) vector_stores > (method) search > (params) default > (param) filters>)
MaxNumResults param.Field[int64]Optional
The maximum number of results to return. This number should be between 1 and 50 inclusive.
minimum1
maximum50
[](<#(resource) vector_stores > (method) search > (params) default > (param) max_num_results>)
RankingOptions param.Field[[VectorStoreSearchParamsRankingOptions](</api/reference/go/resources/vector_stores/methods/search#(resource) vector_stores > (method) search > (params) default > (param) ranking_options > (schema)>)]Optional
Ranking options for search.
Ranker stringOptional
Enable re-ranking; set to `none` to disable, which can help reduce latency.
One of the following:
const VectorStoreSearchParamsRankingOptionsRankerNone VectorStoreSearchParamsRankingOptionsRanker = "none"
[](<#(resource) vector_stores > (method) search > (params) default > (param) ranking_options > (schema) > (property) ranker > (member) 0>)
const VectorStoreSearchParamsRankingOptionsRankerAuto VectorStoreSearchParamsRankingOptionsRanker = "auto"
[](<#(resource) vector_stores > (method) search > (params) default > (param) ranking_options > (schema) > (property) ranker > (member) 1>)
const VectorStoreSearchParamsRankingOptionsRankerDefault2024\_11\_15 VectorStoreSearchParamsRankingOptionsRanker = "default-2024-11-15"
[](<#(resource) vector_stores > (method) search > (params) default > (param) ranking_options > (schema) > (property) ranker > (member) 2>)
[](<#(resource) vector_stores > (method) search > (params) default > (param) ranking_options > (schema) > (property) ranker>)
ScoreThreshold float64Optional
minimum0
maximum1
[](<#(resource) vector_stores > (method) search > (params) default > (param) ranking_options > (schema) > (property) score_threshold>)
[](<#(resource) vector_stores > (method) search > (params) default > (param) ranking_options>)
RewriteQuery param.Field[bool]Optional
Whether to rewrite the natural language query for vector search.
[](<#(resource) vector_stores > (method) search > (params) default > (param) rewrite_query>)
[](<#(resource) vector_stores > (method) search > (params) default>)
##### ReturnsExpand Collapse
type VectorStoreSearchResponse struct{…}
Attributes map[string, VectorStoreSearchResponseAttributeUnion]
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard. Keys are strings
with a maximum length of 64 characters. Values are strings with a maximum
length of 512 characters, booleans, or numbers.
One of the following:
string
[](<#(resource) vector_stores > (model) VectorStoreSearchResponse > (schema) > (property) attributes > (items) > (variant) 0>)
float64
[](<#(resource) vector_stores > (model) VectorStoreSearchResponse > (schema) > (property) attributes > (items) > (variant) 1>)
bool
[](<#(resource) vector_stores > (model) VectorStoreSearchResponse > (schema) > (property) attributes > (items) > (variant) 2>)
[](<#(resource) vector_stores > (model) VectorStoreSearchResponse > (schema) > (property) attributes>)
Content []VectorStoreSearchResponseContent
Content chunks from the file.
Text string
The text content returned from search.
[](<#(resource) vector_stores > (model) VectorStoreSearchResponse > (schema) > (property) content > (items) > (property) text>)
Type string
The type of content.
[](<#(resource) vector_stores > (model) VectorStoreSearchResponse > (schema) > (property) content > (items) > (property) type>)
[](<#(resource) vector_stores > (model) VectorStoreSearchResponse > (schema) > (property) content>)
FileID string
The ID of the vector store file.
[](<#(resource) vector_stores > (model) VectorStoreSearchResponse > (schema) > (property) file_id>)
Filename string
The name of the vector store file.
[](<#(resource) vector_stores > (model) VectorStoreSearchResponse > (schema) > (property) filename>)
Score float64
The similarity score for the result.
minimum0
maximum1
[](<#(resource) vector_stores > (model) VectorStoreSearchResponse > (schema) > (property) score>)
[](<#(resource) vector_stores > (model) VectorStoreSearchResponse > (schema)>)
### Search vector store
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
page, err := client.VectorStores.Search(
context.TODO(),
"vs\_abc123",
openai.VectorStoreSearchParams{
Query: openai.VectorStoreSearchParamsQueryUnion{
OfString: openai.String("string"),
},
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
"object": "vector\_store.search\_results.page",
"search\_query": "What is the return policy?",
"data": [
{
"file\_id": "file\_123",
"filename": "document.pdf",
"score": 0.95,
"attributes": {
"author": "John Doe",
"date": "2023-01-01"
},
"content": [
{
"type": "text",
"text": "Relevant chunk"
}
]
},
{
"file\_id": "file\_456",
"filename": "notes.txt",
"score": 0.89,
"attributes": {
"author": "Jane Smith",
"date": "2023-01-02"
},
"content": [
{
"type": "text",
"text": "Sample text content from the vector store."
}
]
}
],
"has\_more": false,
"next\_page": null
}
`
```
##### Returns Examples
```
`{
"object": "vector\_store.search\_results.page",
"search\_query": "What is the return policy?",
"data": [
{
"file\_id": "file\_123",
"filename": "document.pdf",
"score": 0.95,
"attributes": {
"author": "John Doe",
"date": "2023-01-01"
},
"content": [
{
"type": "text",
"text": "Relevant chunk"
}
]
},
{
"file\_id": "file\_456",
"filename": "notes.txt",
"score": 0.89,
"attributes": {
"author": "Jane Smith",
"date": "2023-01-02"
},
"content": [
{
"type": "text",
"text": "Sample text content from the vector store."
}
]
}
],
"has\_more": false,
"next\_page": null
}
`
```