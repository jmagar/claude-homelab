Vanna.AI - Qdrant
* [Documentation](https://qdrant.tech/documentation/)
*
* [Frameworks](https://qdrant.tech/documentation/frameworks/)
*
* Vanna.AI# Vanna.AI
[Vanna](https://vanna.ai/) is a Python package that uses retrieval augmentation to help you generate accurate SQL queries for your database using LLMs.
Vanna works in two easy steps - train a RAG &ldquo;model&rdquo; on your data, and then ask questions which will return SQL queries that can be set up to automatically run on your database.
Qdrant is available as a support vector store for ingesting and retrieving your RAG data.
## Installation
```
`pip install 'vanna[qdrant]'
`
```
## Setup
You can set up a Vanna agent using Qdrant as your vector store and any of the [LLMs supported by Vanna](https://vanna.ai/docs/postgres-openai-vanna-vannadb/).
We&rsquo;ll use OpenAI for demonstration.
```
`from vanna.openai import OpenAI\_Chat
from vanna.qdrant import Qdrant\_VectorStore
from qdrant\_client import QdrantClient
class MyVanna(Qdrant, OpenAI\_Chat):
def \_\_init\_\_(self, config=None):
Qdrant\_VectorStore.\_\_init\_\_(self, config=config)
OpenAI\_Chat.\_\_init\_\_(self, config=config)
vn = MyVanna(config={
'client': QdrantClient(...),
'api\_key': sk-...,
'model': gpt-4-...,
})
`
```
## Usage
Once a Vanna agent is instantiated, you can connect it to [any SQL database](https://vanna.ai/docs/FAQ/#can-i-use-this-with-my-sql-database) of your choosing.
For example, Postgres.
```
`vn.connect\_to\_postgres(host='my-host', dbname='my-dbname', user='my-user', password='my-password', port='my-port')
`
```
You can now train and begin querying your database with SQL.
```
`# You can add DDL statements that specify table names, column names, types, and potentially relationships
vn.train(ddl="""
CREATE TABLE IF NOT EXISTS my-table (
id INT PRIMARY KEY,
name VARCHAR(100),
age INT
)
""")
# You can add documentation about your business terminology or definitions.
vn.train(documentation="Our business defines OTIF score as the percentage of orders that are delivered on time and in full")
# You can also add SQL queries to your training data. This is useful if you have some queries already laying around.
vn.train(sql="SELECT \* FROM my-table WHERE name = 'John Doe'")
# You can remove training data if there's obsolete/incorrect information.
vn.remove\_training\_data(id='1-ddl')
# Whenever you ask a new question, Vanna will retrieve 10 most relevant pieces of training data and use it as part of the LLM prompt to generate the SQL.
vn.ask(question="\<YOUR\_QUESTION\>")
`
```
## Further reading
* [Getting started with Vanna.AI](https://vanna.ai/docs/app/)
* [Vanna.AI documentation](https://vanna.ai/docs/)
* [Source Code](https://github.com/vanna-ai/vanna/tree/main/src/vanna/integrations/qdrant)
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/frameworks/vanna-ai.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/frameworks/vanna-ai/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/frameworks/vanna-ai.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)