Visualizing the embeddings in Kangas
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
Jul 11, 2023
# Visualizing the embeddings in Kangas
[ DS ](https://github.com/dsblank)
[ dsblank ](https://github.com/dsblank)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/third_party/Visualizing_embeddings_in_Kangas.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/third_party/Visualizing_embeddings_in_Kangas.ipynb)
## Visualizing the embeddings in Kangas
In this Jupyter Notebook, we construct a Kangas DataGrid containing the data and projections of the embeddings into 2 dimensions.
## What is Kangas?
[Kangas](https://github.com/comet-ml/kangas/) as an open source, mixed-media, dataframe-like tool for data scientists. It was developed by [Comet](https://comet.com/), a company designed to help reduce the friction of moving models into production.
### 1. Setup
To get started, we pip install kangas, and import it.
```
`%pip install kangas --quiet`
```
```
`import kangas as kg`
```
### 2. Constructing a Kangas DataGrid
We create a Kangas Datagrid with the original data and the embeddings. The data is composed of a rows of reviews, and the embeddings are composed of 1536 floating-point values. In this example, we get the data directly from github, in case you aren’t running this notebook inside OpenAI’s repo.
We use Kangas to read the CSV file into a DataGrid for further processing.
```
`data = kg.read\_csv("https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/data/fine\_food\_reviews\_with\_embeddings\_1k.csv")`
```
```
`Loading CSV file 'fine\_food\_reviews\_with\_embeddings\_1k.csv'...`
```
```
`1001it [00:00, 2412.90it/s]
100%|████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████| 1000/1000 [00:00\<00:00, 2899.16it/s]`
```
We can review the fields of the CSV file:
```
`data.info()`
```
```
`DataGrid (in memory)
Name : fine\_food\_reviews\_with\_embeddings\_1k
Rows : 1,000
Columns: 9
# Column Non-Null Count DataGrid Type
--- -------------------- --------------- --------------------
1 Column 1 1,000 INTEGER
2 ProductId 1,000 TEXT
3 UserId 1,000 TEXT
4 Score 1,000 INTEGER
5 Summary 1,000 TEXT
6 Text 1,000 TEXT
7 combined 1,000 TEXT
8 n\_tokens 1,000 INTEGER
9 embedding 1,000 TEXT`
```
And get a glimpse of the first and last rows:
```
`data`
```
| row-id | Column 1 | ProductId | UserId | Score | Summary | Text | combined | n\_tokens | embedding |
| 1 | 0 | B003XPF9BO | A3R7JR3FMEBXQB | 5 | where does one | Wanted to save | Title: where do | 52 | [0.007018072064 |
| 2 | 297 | B003VXHGPK | A21VWSCGW7UUAR | 4 | Good, but not W | Honestly, I hav | Title: Good, bu | 178 | [-0.00314055196 |
| 3 | 296 | B008JKTTUA | A34XBAIFT02B60 | 1 | Should advertis | First, these sh | Title: Should a | 78 | [-0.01757248118 |
| 4 | 295 | B000LKTTTW | A14MQ40CCU8B13 | 5 | Best tomato sou | I have a hard t | Title: Best tom | 111 | [-0.00139322795 |
| 5 | 294 | B001D09KAM | A34XBAIFT02B60 | 1 | Should advertis | First, these sh | Title: Should a | 78 | [-0.01757248118 |
|...|
| 996 | 623 | B0000CFXYA | A3GS4GWPIBV0NT | 1 | Strange inflamm | Truthfully wasn | Title: Strange | 110 | [0.000110913533 |
| 997 | 624 | B0001BH5YM | A1BZ3HMAKK0NC | 5 | My favorite and | You've just got | Title: My favor | 80 | [-0.02086931467 |
| 998 | 625 | B0009ET7TC | A2FSDQY5AI6TNX | 5 | My furbabies LO | Shake the conta | Title: My furba | 47 | [-0.00974910240 |
| 999 | 619 | B007PA32L2 | A15FF2P7RPKH6G | 5 | got this for th | all i have hear | Title: got this | 50 | [-0.00521062919 |
| 1000 | 999 | B001EQ5GEO | A3VYU0VO6DYV6I | 5 | I love Maui Cof | My first experi | Title: I love M | 118 | [-0.00605782261 |
| [1000 rows x 9 columns] |
||
|\* Use DataGrid.save() to save to disk|
|\*\* Use DataGrid.show() to start user interface|
Now, we create a new DataGrid, converting the numbers into an Embedding:
```
`import ast # to convert string of a list of numbers into a list of numbers
dg = kg.DataGrid(
name="openai\_embeddings",
columns=data.get\_columns(),
converters={"Score": str},
)
for row in data:
embedding = ast.literal\_eval(row[8])
row[8] = kg.Embedding(
embedding,
name=str(row[3]),
text="%s - %.10s" % (row[3], row[4]),
projection="umap",
)
dg.append(row)`
```
The new DataGrid now has an Embedding column with proper datatype.
```
`dg.info()`
```
```
`DataGrid (in memory)
Name : openai\_embeddings
Rows : 1,000
Columns: 9
# Column Non-Null Count DataGrid Type
--- -------------------- --------------- --------------------
1 Column 1 1,000 INTEGER
2 ProductId 1,000 TEXT
3 UserId 1,000 TEXT
4 Score 1,000 TEXT
5 Summary 1,000 TEXT
6 Text 1,000 TEXT
7 combined 1,000 TEXT
8 n\_tokens 1,000 INTEGER
9 embedding 1,000 EMBEDDING-ASSET`
```
We simply save the datagrid, and we’re done.
```
`dg.save()`
```
### 3. Render 2D Projections
To render the data directly in the notebook, simply show it. Note that each row contains an embedding projection.
Scroll to far right to see embeddings projection per row.
The color of the point in projection space represents the Score.
```
`dg.show()`
```
```
` \>\</iframe\>`
```
Group by “Score” to see rows of each group.
```
`dg.show(group="Score", sort="Score", rows=5, select="Score,embedding")`
```
```
` \>\</iframe\>`
```
An example of this datagrid is hosted here: [https://kangas.comet.com/?datagrid=/data/openai\_embeddings.datagrid](https://kangas.comet.com/?datagrid=/data/openai_embeddings.datagrid)