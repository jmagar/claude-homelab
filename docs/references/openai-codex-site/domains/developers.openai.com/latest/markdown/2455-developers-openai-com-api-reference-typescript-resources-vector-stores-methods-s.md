Search vector store | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Vector Stores](/api/reference/typescript/resources/vector_stores)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Search vector store
client.vectorStores.search(stringvectorStoreID, VectorStoreSearchParams { query, filters, max\_num\_results, 2 more } body, RequestOptionsoptions?): Page\<[VectorStoreSearchResponse](</api/reference/typescript/resources/vector_stores#(resource) vector_stores > (model) vector_store_search_response > (schema)>) { attributes, content, file\_id, 2 more } \>
POST/vector\_stores/{vector\_store\_id}/search
Search a vector store for relevant chunks based on a query and file attributes filter.
##### ParametersExpand Collapse
vectorStoreID: string
[](<#(resource) vector_stores > (method) search > (params) default > (param) vector_store_id > (schema)>)
body: VectorStoreSearchParams { query, filters, max\_num\_results, 2 more }
query: string | Array\<string\>
A query string for a search
One of the following:
string
[](<#(resource) vector_stores > (method) search > (params) default > (param) query > (schema) > (variant) 0>)
Array\<string\>
[](<#(resource) vector_stores > (method) search > (params) default > (param) query > (schema) > (variant) 1>)
[](<#(resource) vector_stores > (method) search > (params) default > (param) query>)
filters?: [ComparisonFilter](</api/reference/typescript/resources/$shared#(resource) $shared > (model) comparison_filter > (schema)>) { key, type, value } | [CompoundFilter](</api/reference/typescript/resources/$shared#(resource) $shared > (model) compound_filter > (schema)>) { filters, type }
A filter to apply based on file attributes.
One of the following:
ComparisonFilter { key, type, value }
A filter used to compare a specified attribute key to a given value using a defined comparison operation.
key: string
The key to compare against the value.
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) key>)
type: "eq" | "ne" | "gt" | 5 more
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
"eq"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 0>)
"ne"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 1>)
"gt"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 2>)
"gte"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 3>)
"lt"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 4>)
"lte"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 5>)
"in"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 6>)
"nin"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 7>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type>)
value: string | number | boolean | Array\<string | number\>
The value to compare against the attribute key; supports string, number, or boolean types.
One of the following:
string
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 0>)
number
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 1>)
boolean
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 2>)
Array\<string | number\>
string
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3 > (items) > (variant) 0>)
number
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3 > (items) > (variant) 1>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value>)
[](<#(resource) $shared > (model) comparison_filter > (schema)>)
CompoundFilter { filters, type }
Combine multiple filters using `and` or `or`.
filters: Array\<[ComparisonFilter](</api/reference/typescript/resources/$shared#(resource) $shared > (model) comparison_filter > (schema)>) { key, type, value } | unknown\>
Array of filters to combine. Items can be `ComparisonFilter` or `CompoundFilter`.
One of the following:
ComparisonFilter { key, type, value }
A filter used to compare a specified attribute key to a given value using a defined comparison operation.
key: string
The key to compare against the value.
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) key>)
type: "eq" | "ne" | "gt" | 5 more
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
"eq"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 0>)
"ne"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 1>)
"gt"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 2>)
"gte"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 3>)
"lt"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 4>)
"lte"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 5>)
"in"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 6>)
"nin"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 7>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type>)
value: string | number | boolean | Array\<string | number\>
The value to compare against the attribute key; supports string, number, or boolean types.
One of the following:
string
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 0>)
number
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 1>)
boolean
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 2>)
Array\<string | number\>
string
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3 > (items) > (variant) 0>)
number
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3 > (items) > (variant) 1>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value>)
[](<#(resource) $shared > (model) comparison_filter > (schema)>)
unknown
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) filters > (items) > (variant) 1>)
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) filters>)
type: "and" | "or"
Type of operation: `and` or `or`.
One of the following:
"and"
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) type > (member) 0>)
"or"
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) type > (member) 1>)
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) type>)
[](<#(resource) $shared > (model) compound_filter > (schema)>)
[](<#(resource) vector_stores > (method) search > (params) default > (param) filters>)
max\_num\_results?: number
The maximum number of results to return. This number should be between 1 and 50 inclusive.
minimum1
maximum50
[](<#(resource) vector_stores > (method) search > (params) default > (param) max_num_results>)
ranking\_options?: [RankingOptions](</api/reference/typescript/resources/vector_stores/methods/search#(resource) vector_stores > (method) search > (params) default > (param) ranking_options > (schema)>)
Ranking options for search.
ranker?: "none" | "auto" | "default-2024-11-15"
Enable re-ranking; set to `none` to disable, which can help reduce latency.
One of the following:
"none"
[](<#(resource) vector_stores > (method) search > (params) default > (param) ranking_options > (schema) > (property) ranker > (member) 0>)
"auto"
[](<#(resource) vector_stores > (method) search > (params) default > (param) ranking_options > (schema) > (property) ranker > (member) 1>)
"default-2024-11-15"
[](<#(resource) vector_stores > (method) search > (params) default > (param) ranking_options > (schema) > (property) ranker > (member) 2>)
[](<#(resource) vector_stores > (method) search > (params) default > (param) ranking_options > (schema) > (property) ranker>)
score\_threshold?: number
minimum0
maximum1
[](<#(resource) vector_stores > (method) search > (params) default > (param) ranking_options > (schema) > (property) score_threshold>)
[](<#(resource) vector_stores > (method) search > (params) default > (param) ranking_options>)
rewrite\_query?: boolean
Whether to rewrite the natural language query for vector search.
[](<#(resource) vector_stores > (method) search > (params) default > (param) rewrite_query>)
[](<#(resource) vector_stores > (method) search > (params) default>)
##### ReturnsExpand Collapse
VectorStoreSearchResponse { attributes, content, file\_id, 2 more }
attributes: Record\<string, string | number | boolean\> | null
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard. Keys are strings
with a maximum length of 64 characters. Values are strings with a maximum
length of 512 characters, booleans, or numbers.
One of the following:
string
[](<#(resource) vector_stores > (model) vector_store_search_response > (schema) > (property) attributes > (items) > (variant) 0>)
number
[](<#(resource) vector_stores > (model) vector_store_search_response > (schema) > (property) attributes > (items) > (variant) 1>)
boolean
[](<#(resource) vector_stores > (model) vector_store_search_response > (schema) > (property) attributes > (items) > (variant) 2>)
[](<#(resource) vector_stores > (model) vector_store_search_response > (schema) > (property) attributes>)
content: Array\<Content\>
Content chunks from the file.
text: string
The text content returned from search.
[](<#(resource) vector_stores > (model) vector_store_search_response > (schema) > (property) content > (items) > (property) text>)
type: "text"
The type of content.
[](<#(resource) vector_stores > (model) vector_store_search_response > (schema) > (property) content > (items) > (property) type>)
[](<#(resource) vector_stores > (model) vector_store_search_response > (schema) > (property) content>)
file\_id: string
The ID of the vector store file.
[](<#(resource) vector_stores > (model) vector_store_search_response > (schema) > (property) file_id>)
filename: string
The name of the vector store file.
[](<#(resource) vector_stores > (model) vector_store_search_response > (schema) > (property) filename>)
score: number
The similarity score for the result.
minimum0
maximum1
[](<#(resource) vector_stores > (model) vector_store_search_response > (schema) > (property) score>)
[](<#(resource) vector_stores > (model) vector_store_search_response > (schema)>)
### Search vector store
TypeScript
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
`import OpenAI from 'openai';
const client = new OpenAI({
apiKey: process.env['OPENAI\_API\_KEY'], // This is the default and can be omitted
});
// Automatically fetches more pages as needed.
for await (const vectorStoreSearchResponse of client.vectorStores.search('vs\_abc123', {
query: 'string',
})) {
console.log(vectorStoreSearchResponse.file\_id);
}`
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