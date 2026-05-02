Semantic search using Supabase Vector
Primary navigation
Search docs
### Suggested
responses createreasoning\_effortrealtimeprompt caching
Showcase Blog Cookbook Learn Community
* [ Home ](/cookbook)
### Topics
* [ Agents ](/cookbook/topic/agents)
* [ Evals ](/cookbook/topic/evals)
* [ Multimodal ](/cookbook/topic/multimodal)
* [ Text ](/cookbook/topic/text)
* [ Guardrails ](/cookbook/topic/guardrails)
* [ Optimization ](/cookbook/topic/optimization)
* [ ChatGPT ](/cookbook/topic/chatgpt)
* [ Codex ](/cookbook/topic/codex)
* [ gpt-oss ](/cookbook/topic/gpt-oss)
### Contribute
* [ Cookbook on GitHub ](https://github.com/openai/openai-cookbook)
[API Dashboard](https://platform.openai.com/login)
Copy Page
Copy Page
Dec 4, 2023
# Semantic search using Supabase Vector
[ GR ](https://twitter.com/ggrdson)
[ Greg Richardson ](https://twitter.com/ggrdson)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/vector_databases/supabase/semantic-search.mdx) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/vector_databases/supabase/semantic-search.mdx)
The purpose of this guide is to demonstrate how to store OpenAI embeddings in [Supabase Vector](https://supabase.com/docs/guides/ai) (Postgres + pgvector) for the purposes of semantic search.
[Supabase](https://supabase.com/docs) is an open-source Firebase alternative built on top of [Postgres](https://en.wikipedia.org/wiki/PostgreSQL), a production-grade SQL database. Since Supabase Vector is built on [pgvector](https://github.com/pgvector/pgvector), you can store your embeddings within the same database that holds the rest of your application data. When combined with pgvector’s indexing algorithms, vector search remains [fast at large scales](https://supabase.com/blog/increase-performance-pgvector-hnsw).
Supabase adds an ecosystem of services and tools to make app development as quick as possible (such as an [auto-generated REST API](https://postgrest.org/)). We’ll use these services to store and query embeddings within Postgres.
This guide covers:
1. [Setting up your database](#setup-database)
2. [Creating a SQL table](#create-a-vector-table) that can store vector data
3. [Generating OpenAI embeddings](#generate-openai-embeddings) using OpenAI’s JavaScript client
4. [Storing the embeddings](#store-embeddings-in-database) in your SQL table using the Supabase JavaScript client
5. [Performing semantic search](#semantic-search) over the embeddings using a Postgres function and the Supabase JavaScript client
## Setup database
First head over to [https://database.new](https://database.new) to provision your Supabase database. This will create a Postgres database on the Supabase cloud platform. Alternatively, you can follow the [local development](https://supabase.com/docs/guides/cli/getting-started) options if you prefer to run your database locally using Docker.
In the studio, jump to the [SQL editor](https://supabase.com/dashboard/project/_/sql/new) and execute the following SQL to enable pgvector:
```
`-- Enable the pgvector extension
create extension if not exists vector;`
```
>
> In a production application, the best practice is to use
[> database migrations
](https://supabase.com/docs/guides/cli/local-development#database-migrations)> so that all SQL operations are managed within source control. To keep things simple in this guide, we’ll execute queries directly in the SQL Editor. If you are building a production app, feel free to move these into a database migration.
>
## Create a vector table
Next we’ll create a table to store documents and embeddings. In the SQL Editor, run:
```
`create table documents (
id bigint primary key generated always as identity,
content text not null,
embedding vector (1536) not null
);`
```
Since Supabase is built on Postgres, we’re just using regular SQL here. You can modify this table however you like to better fit your application. If you have existing database tables, you can simply add a new `vector` column to the appropriate table.
The important piece to understand is the `vector` data type, which is a new data type that became available when we enabled the pgvector extension earlier. The size of the vector (1536 here) represents the number of dimensions in the embedding. Since we’re using OpenAI’s `text-embedding-3-small` model in this example, we set the vector size to 1536.
Let’s go ahead and create a vector index on this table so that future queries remain performant as the table grows:
```
`create index on documents using hnsw (embedding vector\_ip\_ops);`
```
This index uses the [HNSW](https://supabase.com/docs/guides/ai/vector-indexes/hnsw-indexes) algorithm to index vectors stored in the `embedding` column, and specifically when using the inner product operator (`\<#\>`). We’ll explain more about this operator later when we implement our match function.
Let’s also follow security best practices by enabling row level security on the table:
```
`alter table documents enable row level security;`
```
This will prevent unauthorized access to this table through the auto-generated REST API (more on this shortly).
## Generate OpenAI embeddings
This guide uses JavaScript to generate embeddings, but you can easily modify it to use any [language supported by OpenAI](https://platform.openai.com/docs/libraries).
If you are using JavaScript, feel free to use whichever server-side JavaScript runtime that you prefer (Node.js, Deno, Supabase Edge Functions).
If you’re using Node.js, first install `openai` as a dependency:
```
`npm install openai`
```
then import it:
```
`import OpenAI from "openai";`
```
If you’re using Deno or Supabase Edge Functions, you can import `openai` directly from a URL:
```
`import OpenAI from "https://esm.sh/openai@4";`
```
>
> In this example we import from
[> https://esm.sh
](https://esm.sh)> which is a CDN that automatically fetches the respective NPM module for you and serves it over HTTP.
>
Next we’ll generate an OpenAI embedding using [`text-embedding-3-small`](https://platform.openai.com/docs/guides/embeddings/embedding-models):
```
`const openai = new OpenAI();
const input = "The cat chases the mouse";
const result = await openai.embeddings.create({
input,
model: "text-embedding-3-small",
});
const [{ embedding }] = result.data;`
```
Remember that you will need an [OpenAI API key](https://platform.openai.com/api-keys) to interact with the OpenAI API. You can pass this as an environment variable called `OPENAI\_API\_KEY`, or manually set it when you instantiate your OpenAI client:
```
`const openai = new OpenAI({
apiKey: "\<openai-api-key\>",
});`
```
***Remember:** Never hard-code API keys in your code. Best practice is to either store it in a `.env` file and load it using a library like [`dotenv`](https://github.com/motdotla/dotenv) or load it from an external key management system.*
## Store embeddings in database
Supabase comes with an [auto-generated REST API](https://postgrest.org/) that dynamically builds REST endpoints for each of your tables. This means you don’t need to establish a direct Postgres connection to your database - instead you can interact with it simply using by the REST API. This is especially useful in serverless environments that run short-lived processes where re-establishing a database connection every time can be expensive.
Supabase comes with a number of [client libraries](https://supabase.com/docs#client-libraries) to simplify interaction with the REST API. In this guide we’ll use the [JavaScript client library](https://supabase.com/docs/reference/javascript), but feel free to adjust this to your preferred language.
If you’re using Node.js, install `@supabase/supabase-js` as a dependency:
```
`npm install @supabase/supabase-js`
```
then import it:
```
`import { createClient } from "@supabase/supabase-js";`
```
If you’re using Deno or Supabase Edge Functions, you can import `@supabase/supabase-js` directly from a URL:
```
`import { createClient } from "https://esm.sh/@supabase/supabase-js@2";`
```
Next we’ll instantiate our Supabase client and configure it so that it points to your Supabase project. In this guide we’ll store a reference to your Supabase URL and key in a `.env` file, but feel free to modify this based on how your application handles configuration.
If you are using Node.js or Deno, add your Supabase URL and service role key to a `.env` file. If you are using the cloud platform, you can find these from your Supabase dashboard [settings page](https://supabase.com/dashboard/project/_/settings/api). If you’re running Supabase locally, you can find these by running `npx supabase status` in a terminal.
*.env*
```
`SUPABASE\_URL=\<supabase-url\>
SUPABASE\_SERVICE\_ROLE\_KEY=\<supabase-service-role-key\>`
```
If you are using Supabase Edge Functions, these environment variables are automatically injected into your function for you so you can skip the above step.
Next we’ll pull these environment variables into our app.
In Node.js, install the `dotenv` dependency:
```
`npm install dotenv`
```
And retrieve the environment variables from `process.env`:
```
`import { config } from "dotenv";
// Load .env file
config();
const supabaseUrl = process.env["SUPABASE\_URL"];
const supabaseServiceRoleKey = process.env["SUPABASE\_SERVICE\_ROLE\_KEY"];`
```
In Deno, load the `.env` file using the `dotenv` standard library:
```
`import { load } from "https://deno.land/std@0.208.0/dotenv/mod.ts";
// Load .env file
const env = await load();
const supabaseUrl = env["SUPABASE\_URL"];
const supabaseServiceRoleKey = env["SUPABASE\_SERVICE\_ROLE\_KEY"];`
```
In Supabase Edge Functions, simply load the injected environment variables directly:
```
`const supabaseUrl = Deno.env.get("SUPABASE\_URL");
const supabaseServiceRoleKey = Deno.env.get("SUPABASE\_SERVICE\_ROLE\_KEY");`
```
Next let’s instantiate our `supabase` client:
```
`const supabase = createClient(supabaseUrl, supabaseServiceRoleKey, {
auth: { persistSession: false },
});`
```
From here we use the `supabase` client to insert our text and embedding (generated earlier) into the database:
```
`const { error } = await supabase.from("documents").insert({
content: input,
embedding,
});`
```
>
> In production, best practice would be to check the response
`> error
`> to see if there were any problems inserting the data and handle it accordingly.
>
## Semantic search
Finally let’s perform semantic search over the embeddings in our database. At this point we’ll assume your `documents` table has been filled with multiple records that we can search over.
Let’s create a match function in Postgres that performs the semantic search query. Execute the following in the [SQL Editor](https://supabase.com/dashboard/project/_/sql/new):
```
`create function match\_documents (
query\_embedding vector (1536),
match\_threshold float,
)
returns setof documents
language plpgsql
as $$
begin
return query
select \*
from documents
where documents.embedding \<#\> query\_embedding \< -match\_threshold
order by documents.embedding \<#\> query\_embedding;
end;
$$;`
```
This function accepts a `query\_embedding` which represents the embedding generated from the search query text (more on this shortly). It also accepts a `match\_threshold` which specifies how similar the document embeddings have to be in order for `query\_embedding` to count as a match.
Inside the function we implement the query which does two things:
* Filters the documents to only include those who’s embeddings match within the above `match\_threshold`. Since the `\<#\>` operator performs the negative inner product (versus positive inner product), we negate the similarity threshold before comparing. This means a `match\_threshold` of 1 is most similar, and -1 is most dissimilar.
* Orders the documents by negative inner product (`\<#\>`) ascending. This allows us to retrieve documents that match closest first.
>
> Since OpenAI embeddings are normalized, we opted to use inner product (
`> &#x3C;#>
`> ) because it is slightly more performant than other operators like cosine distance (
`> &#x3C;=>
`> ). It is important to note though this only works because the embeddings are normalized - if they weren’t, cosine distance should be used.
>
Now we can call this function from our application using the `supabase.rpc()` method:
```
`const query = "What does the cat chase?";
// First create an embedding on the query itself
const result = await openai.embeddings.create({
input: query,
model: "text-embedding-3-small",
});
const [{ embedding }] = result.data;
// Then use this embedding to search for matches
const { data: documents, error: matchError } = await supabase
.rpc("match\_documents", {
query\_embedding: embedding,
match\_threshold: 0.8,
})
.select("content")
.limit(5);`
```
In this example, we set a match threshold to 0.8. Adjust this threshold based on what works best with your data.
Note that since `match\_documents` returns a set of `documents`, we can treat this `rpc()` like a regular table query. Specifically this means we can chain additional commands to this query, like `select()` and `limit()`. Here we select just the columns we care about from the `documents` table (`content`), and we limit the number of documents returned (max 5 in this example).
At this point you have a list of documents that matched the query based on semantic relationship, ordered by most similar first.
## Next steps
You can use this example as the foundation for other semantic search techniques, like retrieval augmented generation (RAG).
For more information on OpenAI embeddings, read the [Embedding](https://platform.openai.com/docs/guides/embeddings) docs.
For more information on Supabase Vector, read the [AI & Vector](https://supabase.com/docs/guides/ai) docs.