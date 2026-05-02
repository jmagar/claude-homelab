Search vector store | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Vector Stores](/api/reference/java/resources/vector_stores)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Search vector store
VectorStoreSearchPage vectorStores().search(VectorStoreSearchParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/vector\_stores/{vector\_store\_id}/search
Search a vector store for relevant chunks based on a query and file attributes filter.
##### ParametersExpand Collapse
VectorStoreSearchParams params
Optional\<String\> vectorStoreId
[](<#(resource) vector_stores > (method) search > (params) default > (param) vector_store_id > (schema)>)
Query query
A query string for a search
String
[](<#(resource) vector_stores > (method) search > (params) default > (param) body > (schema) > (property) query > (variant) 0>)
List\<String\>
[](<#(resource) vector_stores > (method) search > (params) default > (param) body > (schema) > (property) query > (variant) 1>)
[](<#(resource) vector_stores > (method) search > (params) default > (param) body > (schema) > (property) query>)
Optional\<Filters\> filters
A filter to apply based on file attributes.
class ComparisonFilter:
A filter used to compare a specified attribute key to a given value using a defined comparison operation.
String key
The key to compare against the value.
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) key>)
Type type
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
EQ("eq")
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 0>)
NE("ne")
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 1>)
GT("gt")
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 2>)
GTE("gte")
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 3>)
LT("lt")
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 4>)
LTE("lte")
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 5>)
IN("in")
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 6>)
NIN("nin")
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 7>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type>)
Value value
The value to compare against the attribute key; supports string, number, or boolean types.
One of the following:
String
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 0>)
double
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 1>)
boolean
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 2>)
List\<ComparisonFilterValueItem\>
One of the following:
String
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3 > (items) > (variant) 0>)
double
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3 > (items) > (variant) 1>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value>)
[](<#(resource) $shared > (model) comparison_filter > (schema)>)
class CompoundFilter:
Combine multiple filters using `and` or `or`.
List\<Filter\> filters
Array of filters to combine. Items can be `ComparisonFilter` or `CompoundFilter`.
One of the following:
class ComparisonFilter:
A filter used to compare a specified attribute key to a given value using a defined comparison operation.
String key
The key to compare against the value.
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) key>)
Type type
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
EQ("eq")
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 0>)
NE("ne")
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 1>)
GT("gt")
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 2>)
GTE("gte")
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 3>)
LT("lt")
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 4>)
LTE("lte")
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 5>)
IN("in")
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 6>)
NIN("nin")
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 7>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type>)
Value value
The value to compare against the attribute key; supports string, number, or boolean types.
One of the following:
String
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 0>)
double
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 1>)
boolean
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 2>)
List\<ComparisonFilterValueItem\>
One of the following:
String
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3 > (items) > (variant) 0>)
double
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3 > (items) > (variant) 1>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value>)
[](<#(resource) $shared > (model) comparison_filter > (schema)>)
JsonValue
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) filters > (items) > (variant) 1>)
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) filters>)
Type type
Type of operation: `and` or `or`.
One of the following:
AND("and")
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) type > (member) 0>)
OR("or")
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) type > (member) 1>)
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) type>)
[](<#(resource) $shared > (model) compound_filter > (schema)>)
[](<#(resource) vector_stores > (method) search > (params) default > (param) body > (schema) > (property) filters>)
Optional\<Long\> maxNumResults
The maximum number of results to return. This number should be between 1 and 50 inclusive.
minimum1
maximum50
[](<#(resource) vector_stores > (method) search > (params) default > (param) body > (schema) > (property) max_num_results>)
Optional\<RankingOptions\> rankingOptions
Ranking options for search.
Optional\<Ranker\> ranker
Enable re-ranking; set to `none` to disable, which can help reduce latency.
One of the following:
NONE("none")
[](<#(resource) vector_stores > (method) search > (params) default > (param) body > (schema) > (property) ranking_options > (property) ranker > (member) 0>)
AUTO("auto")
[](<#(resource) vector_stores > (method) search > (params) default > (param) body > (schema) > (property) ranking_options > (property) ranker > (member) 1>)
DEFAULT\_2024\_11\_15("default-2024-11-15")
[](<#(resource) vector_stores > (method) search > (params) default > (param) body > (schema) > (property) ranking_options > (property) ranker > (member) 2>)
[](<#(resource) vector_stores > (method) search > (params) default > (param) body > (schema) > (property) ranking_options > (property) ranker>)
Optional\<Double\> scoreThreshold
minimum0
maximum1
[](<#(resource) vector_stores > (method) search > (params) default > (param) body > (schema) > (property) ranking_options > (property) score_threshold>)
[](<#(resource) vector_stores > (method) search > (params) default > (param) body > (schema) > (property) ranking_options>)
Optional\<Boolean\> rewriteQuery
Whether to rewrite the natural language query for vector search.
[](<#(resource) vector_stores > (method) search > (params) default > (param) body > (schema) > (property) rewrite_query>)
[](<#(resource) vector_stores > (method) search > (params) default>)
##### ReturnsExpand Collapse
class VectorStoreSearchResponse:
Optional\<Attributes\> attributes
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard. Keys are strings
with a maximum length of 64 characters. Values are strings with a maximum
length of 512 characters, booleans, or numbers.
One of the following:
String
[](<#(resource) vector_stores > (model) VectorStoreSearchResponse > (schema) > (property) attributes > (items) > (variant) 0>)
double
[](<#(resource) vector_stores > (model) VectorStoreSearchResponse > (schema) > (property) attributes > (items) > (variant) 1>)
boolean
[](<#(resource) vector_stores > (model) VectorStoreSearchResponse > (schema) > (property) attributes > (items) > (variant) 2>)
[](<#(resource) vector_stores > (model) VectorStoreSearchResponse > (schema) > (property) attributes>)
List\<Content\> content
Content chunks from the file.
String text
The text content returned from search.
[](<#(resource) vector_stores > (model) VectorStoreSearchResponse > (schema) > (property) content > (items) > (property) text>)
Type type
The type of content.
[](<#(resource) vector_stores > (model) VectorStoreSearchResponse > (schema) > (property) content > (items) > (property) type>)
[](<#(resource) vector_stores > (model) VectorStoreSearchResponse > (schema) > (property) content>)
String fileId
The ID of the vector store file.
[](<#(resource) vector_stores > (model) VectorStoreSearchResponse > (schema) > (property) file_id>)
String filename
The name of the vector store file.
[](<#(resource) vector_stores > (model) VectorStoreSearchResponse > (schema) > (property) filename>)
double score
The similarity score for the result.
minimum0
maximum1
[](<#(resource) vector_stores > (model) VectorStoreSearchResponse > (schema) > (property) score>)
[](<#(resource) vector_stores > (model) VectorStoreSearchResponse > (schema)>)
### Search vector store
Java
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
`package com.openai.example;
import com.openai.client.OpenAIClient;
import com.openai.client.okhttp.OpenAIOkHttpClient;
import com.openai.models.vectorstores.VectorStoreSearchPage;
import com.openai.models.vectorstores.VectorStoreSearchParams;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
VectorStoreSearchParams params = VectorStoreSearchParams.builder()
.vectorStoreId("vs\_abc123")
.query("string")
.build();
VectorStoreSearchPage page = client.vectorStores().search(params);
}
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