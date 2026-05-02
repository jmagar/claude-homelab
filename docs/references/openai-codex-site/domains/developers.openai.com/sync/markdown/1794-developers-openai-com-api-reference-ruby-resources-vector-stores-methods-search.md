Search vector store | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Vector Stores](/api/reference/ruby/resources/vector_stores)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Search vector store
vector\_stores.search(vector\_store\_id, \*\*kwargs) -\> Page\<[VectorStoreSearchResponse](</api/reference/ruby/resources/vector_stores#(resource) vector_stores > (model) vector_store_search_response > (schema)>) { attributes, content, file\_id, 2 more } \>
POST/vector\_stores/{vector\_store\_id}/search
Search a vector store for relevant chunks based on a query and file attributes filter.
##### ParametersExpand Collapse
vector\_store\_id: String
[](<#(resource) vector_stores > (method) search > (params) default > (param) vector_store_id > (schema)>)
query: String | Array[String]
A query string for a search
One of the following:
String = String
[](<#(resource) vector_stores > (method) search > (params) default > (param) query > (schema) > (variant) 0>)
UnionMember1 = Array[String]
[](<#(resource) vector_stores > (method) search > (params) default > (param) query > (schema) > (variant) 1>)
[](<#(resource) vector_stores > (method) search > (params) default > (param) query > (schema)>)
filters: [ComparisonFilter](</api/reference/ruby/resources/$shared#(resource) $shared > (model) comparison_filter > (schema)>) { key, type, value } | [CompoundFilter](</api/reference/ruby/resources/$shared#(resource) $shared > (model) compound_filter > (schema)>) { filters, type }
A filter to apply based on file attributes.
One of the following:
class ComparisonFilter { key, type, value }
A filter used to compare a specified attribute key to a given value using a defined comparison operation.
key: String
The key to compare against the value.
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) key>)
type: :eq | :ne | :gt | 5 more
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
:eq
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 0>)
:ne
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 1>)
:gt
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 2>)
:gte
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 3>)
:lt
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 4>)
:lte
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 5>)
:in
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 6>)
:nin
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 7>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type>)
value: String | Float | bool | Array[String | Float]
The value to compare against the attribute key; supports string, number, or boolean types.
One of the following:
String = String
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 0>)
Float = Float
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 1>)
UnionMember2 = bool
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 2>)
UnionMember3 = Array[String | Float]
One of the following:
String = String
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3 > (items) > (variant) 0>)
Float = Float
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3 > (items) > (variant) 1>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value>)
[](<#(resource) $shared > (model) comparison_filter > (schema)>)
class CompoundFilter { filters, type }
Combine multiple filters using `and` or `or`.
filters: Array[[ComparisonFilter](</api/reference/ruby/resources/$shared#(resource) $shared > (model) comparison_filter > (schema)>) { key, type, value } | untyped]
Array of filters to combine. Items can be `ComparisonFilter` or `CompoundFilter`.
One of the following:
class ComparisonFilter { key, type, value }
A filter used to compare a specified attribute key to a given value using a defined comparison operation.
key: String
The key to compare against the value.
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) key>)
type: :eq | :ne | :gt | 5 more
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
:eq
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 0>)
:ne
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 1>)
:gt
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 2>)
:gte
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 3>)
:lt
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 4>)
:lte
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 5>)
:in
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 6>)
:nin
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 7>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type>)
value: String | Float | bool | Array[String | Float]
The value to compare against the attribute key; supports string, number, or boolean types.
One of the following:
String = String
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 0>)
Float = Float
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 1>)
UnionMember2 = bool
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 2>)
UnionMember3 = Array[String | Float]
One of the following:
String = String
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3 > (items) > (variant) 0>)
Float = Float
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3 > (items) > (variant) 1>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value>)
[](<#(resource) $shared > (model) comparison_filter > (schema)>)
UnionMember1 = untyped
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) filters > (items) > (variant) 1>)
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) filters>)
type: :and | :or
Type of operation: `and` or `or`.
One of the following:
:and
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) type > (member) 0>)
:or
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) type > (member) 1>)
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) type>)
[](<#(resource) $shared > (model) compound_filter > (schema)>)
[](<#(resource) vector_stores > (method) search > (params) default > (param) filters > (schema)>)
max\_num\_results: Integer
The maximum number of results to return. This number should be between 1 and 50 inclusive.
minimum1
maximum50
[](<#(resource) vector_stores > (method) search > (params) default > (param) max_num_results > (schema)>)
ranking\_options: RankingOptions{ ranker, score\_threshold}
Ranking options for search.
ranker: :none | :auto | :"default-2024-11-15"
Enable re-ranking; set to `none` to disable, which can help reduce latency.
One of the following:
:none
[](<#(resource) vector_stores > (method) search > (params) default > (param) ranking_options > (schema) > (property) ranker > (member) 0>)
:auto
[](<#(resource) vector_stores > (method) search > (params) default > (param) ranking_options > (schema) > (property) ranker > (member) 1>)
:"default-2024-11-15"
[](<#(resource) vector_stores > (method) search > (params) default > (param) ranking_options > (schema) > (property) ranker > (member) 2>)
[](<#(resource) vector_stores > (method) search > (params) default > (param) ranking_options > (schema) > (property) ranker>)
score\_threshold: Float
minimum0
maximum1
[](<#(resource) vector_stores > (method) search > (params) default > (param) ranking_options > (schema) > (property) score_threshold>)
[](<#(resource) vector_stores > (method) search > (params) default > (param) ranking_options > (schema)>)
rewrite\_query: bool
Whether to rewrite the natural language query for vector search.
[](<#(resource) vector_stores > (method) search > (params) default > (param) rewrite_query > (schema)>)
##### ReturnsExpand Collapse
class VectorStoreSearchResponse { attributes, content, file\_id, 2 more }
attributes: Hash[Symbol, String | Float | bool]
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard. Keys are strings
with a maximum length of 64 characters. Values are strings with a maximum
length of 512 characters, booleans, or numbers.
One of the following:
String = String
[](<#(resource) vector_stores > (model) vector_store_search_response > (schema) > (property) attributes > (items) > (variant) 0>)
Float = Float
[](<#(resource) vector_stores > (model) vector_store_search_response > (schema) > (property) attributes > (items) > (variant) 1>)
UnionMember2 = bool
[](<#(resource) vector_stores > (model) vector_store_search_response > (schema) > (property) attributes > (items) > (variant) 2>)
[](<#(resource) vector_stores > (model) vector_store_search_response > (schema) > (property) attributes>)
content: Array[Content{ text, type}]
Content chunks from the file.
text: String
The text content returned from search.
[](<#(resource) vector_stores > (model) vector_store_search_response > (schema) > (property) content > (items) > (property) text>)
type: :text
The type of content.
[](<#(resource) vector_stores > (model) vector_store_search_response > (schema) > (property) content > (items) > (property) type>)
[](<#(resource) vector_stores > (model) vector_store_search_response > (schema) > (property) content>)
file\_id: String
The ID of the vector store file.
[](<#(resource) vector_stores > (model) vector_store_search_response > (schema) > (property) file_id>)
filename: String
The name of the vector store file.
[](<#(resource) vector_stores > (model) vector_store_search_response > (schema) > (property) filename>)
score: Float
The similarity score for the result.
minimum0
maximum1
[](<#(resource) vector_stores > (model) vector_store_search_response > (schema) > (property) score>)
[](<#(resource) vector_stores > (model) vector_store_search_response > (schema)>)
### Search vector store
Ruby
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
`require "openai"
openai = OpenAI::Client.new(api\_key: "My API Key")
page = openai.vector\_stores.search("vs\_abc123", query: "string")
puts(page)`
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