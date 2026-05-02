Data Extraction and Transformation in ELT Workflows using GPT-4o as an OCR Alternative
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
Jul 9, 2024
# Data Extraction and Transformation in ELT Workflows using GPT-4o as an OCR Alternative
[ CJ ](https://www.linkedin.com/in/charu-j-8a866471)
[ Charu Jaiswal
(OpenAI)
](https://www.linkedin.com/in/charu-j-8a866471)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/Data_extraction_transformation.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/Data_extraction_transformation.ipynb)
A lot of enterprise data is unstructured and locked up in difficult-to-use formats, e.g. PDFs, PPT, PNG, that are not optimized for use with LLMs or databases. As a result this type of data tends to be underutilized for analysis and product development, despite it being so valuable. The traditional way of extracting information from unstructured or non-ideal formats has been to use OCR, but OCR struggles with complex layouts and can have limited multilingual support. Moreover, manually applying transforms to data can be cumbersome and timeconsuming.
The multi-modal capabilities of GPT-4o enable new ways to extract and transform data because of GPT-4o’s ability to adapt to different types of documents and to use reasoning for interpreting the content of documents. Here are some reasons why you would choose GPT-4o for your extraction and transformation workflows over traditional methods.
|**Extraction**|**Transformation**|
|**Adaptable**: Handles complex document layouts better, reducing errors|**Schema Adaptability**: Easily transforms data to fit specific schemas for database ingestion|
|**Multilingual Support**: Seamlessly processes documents in multiple languages|**Dynamic Data Mapping**: Adapts to different data structures and formats, providing flexible transformation rules|
|**Contextual Understanding**: Extracts meaningful relationships and context, not just text|**Enhanced Insight Generation**: Applies reasoning to create more insightful transformations, enriching the dataset with derived metrics, metadata and relationships|
|**Multimodality**: Processes various document elements, including images and tables||
This cookbook has three parts:
1. How to extract data from multilingual PDFs
2. How to transform data according to a schema for loading into a database
3. How to load transformed data into a database for downstream analysis
We’re going to mimic a simple ELT workflow where data is first extracted from PDFs into JSON using GPT-4o, stored in an unstructured format somewhere like a data lake, transformed to fit a schema using GPT-4o, and then finally ingested into a relational database for querying. It’s worth noting that you can do all of this with the BatchAPI if you’re interested in lowering the cost of this workflow.
The data we’ll be using is a set of publicly available 2019 hotel invoices from Germany available on [Jens Walter’s GitHub](https://github.com/JensWalter/my-receipts/tree/master/2019/de/hotel), (thank you Jens!). Though hotel invoices generally contain similar information (reservation details, charges, taxes etc.), you’ll notice that the invoices present itemized information in different ways and are multilingual containing both German and English. Fortunately GPT-4o can adapt to a variety of different document styles without us having to specify formats and it can seamlessly handle a variety of languages, even in the same document.
Here is what one of the invoices looks like:
## Part 1: Extracting data from PDFs using GPT-4o’s vision capabilities
GPT-4o doesn’t natively handle PDFs so before we extract any data we’ll first need to convert each page into an image and then encode the images as base64.
```
`from openai import OpenAI
import fitz # PyMuPDF
import io
import os
from PIL import Image
import base64
import json
api\_key = os.getenv("OPENAI\_API\_KEY")
client = OpenAI(api\_key=api\_key)
@staticmethod
def encode\_image(image\_path):
with open(image\_path, "rb") as image\_file:
return base64.b64encode(image\_file.read()).decode("utf-8")
def pdf\_to\_base64\_images(pdf\_path):
#Handles PDFs with multiple pages
pdf\_document = fitz.open(pdf\_path)
base64\_images = []
temp\_image\_paths = []
total\_pages = len(pdf\_document)
for page\_num in range(total\_pages):
page = pdf\_document.load\_page(page\_num)
pix = page.get\_pixmap()
img = Image.open(io.BytesIO(pix.tobytes()))
temp\_image\_path = f"temp\_page\_{page\_num}.png"
img.save(temp\_image\_path, format="PNG")
temp\_image\_paths.append(temp\_image\_path)
base64\_image = encode\_image(temp\_image\_path)
base64\_images.append(base64\_image)
for temp\_image\_path in temp\_image\_paths:
os.remove(temp\_image\_path)
return base64\_images`
```
We can then pass each base64 encoded image in a GPT-4o LLM call, specifying a high level of detail and JSON as the response format. We’re not concerned about enforcing a schema at this step, we just want all of the data to be extracted regardless of type.
```
`def extract\_invoice\_data(base64\_image):
system\_prompt = f"""
You are an OCR-like data extraction tool that extracts hotel invoice data from PDFs.
1. Please extract the data in this hotel invoice, grouping data according to theme/sub groups, and then output into JSON.
2. Please keep the keys and values of the JSON in the original language.
3. The type of data you might encounter in the invoice includes but is not limited to: hotel information, guest information, invoice information,
room charges, taxes, and total charges etc.
4. If the page contains no charge data, please output an empty JSON object and don't make up any data.
5. If there are blank data fields in the invoice, please include them as "null" values in the JSON object.
6. If there are tables in the invoice, capture all of the rows and columns in the JSON object.
Even if a column is blank, include it as a key in the JSON object with a null value.
7. If a row is blank denote missing fields with "null" values.
8. Don't interpolate or make up data.
9. Please maintain the table structure of the charges, i.e. capture all of the rows and columns in the JSON object.
"""
response = client.chat.completions.create(
model="gpt-4o",
response\_format={ "type": "json\_object" },
messages=[
{
"role": "system",
"content": system\_prompt
},
{
"role": "user",
"content": [
{"type": "text", "text": "extract the data in this hotel invoice and output into JSON "},
{"type": "image\_url", "image\_url": {"url": f"data:image/png;base64,{base64\_image}", "detail": "high"}}
]
}
],
temperature=0.0,
)
return response.choices[0].message.content`
```
Because invoice data can span multiple pages in a PDF, we’re going to produce JSON objects for each page in the invoice and then append them together. The final invoice extraction will be a single JSON file.
```
`def extract\_from\_multiple\_pages(base64\_images, original\_filename, output\_directory):
entire\_invoice = []
for base64\_image in base64\_images:
invoice\_json = extract\_invoice\_data(base64\_image)
invoice\_data = json.loads(invoice\_json)
entire\_invoice.append(invoice\_data)
# Ensure the output directory exists
os.makedirs(output\_directory, exist\_ok=True)
# Construct the output file path
output\_filename = os.path.join(output\_directory, original\_filename.replace('.pdf', '\_extracted.json'))
# Save the entire\_invoice list as a JSON file
with open(output\_filename, 'w', encoding='utf-8') as f:
json.dump(entire\_invoice, f, ensure\_ascii=False, indent=4)
return output\_filename
def main\_extract(read\_path, write\_path):
for filename in os.listdir(read\_path):
file\_path = os.path.join(read\_path, filename)
if os.path.isfile(file\_path):
base64\_images = pdf\_to\_base64\_images(file\_path)
extract\_from\_multiple\_pages(base64\_images, filename, write\_path)
read\_path= "./data/hotel\_invoices/receipts\_2019\_de\_hotel"
write\_path= "./data/hotel\_invoices/extracted\_invoice\_json"
main\_extract(read\_path, write\_path)`
```
Each invoice JSON will have different keys depending on what data the original invoice contained, so at this point you can store the unschematized JSON files in a data lake that can handle unstructured data. For simplicity though, we’re going to store the files in a folder. Here is what one of the extracted JSON files looks like, you’ll notice that even though we didn’t specify a schema, GPT-4o was able to understand German and group similar information together. Moreover, if there was a blank field in the invoice GPT-4o transcribed that as “null”.
```
`[
{
"Hotel Information": {
"Name": "Hamburg City (Zentrum)",
"Address": "Willy-Brandt-Straße 21, 20457 Hamburg, Deutschland",
"Phone": "+49 (0) 40 3039 379 0"
},
"Guest Information": {
"Name": "APIMEISTER CONSULTING GmbH",
"Guest": "Herr Jens Walter",
"Address": "Friedrichstr. 123, 10117 Berlin"
},
"Invoice Information": {
"Rechnungsnummer": "GABC19014325",
"Rechnungsdatum": "23.09.19",
"Referenznummer": "GABC015452127",
"Buchungsnummer": "GABR15867",
"Ankunft": "23.09.19",
"Abreise": "27.09.19",
"Nächte": 4,
"Zimmer": 626,
"Kundereferenz": 2
},
"Charges": [
{
"Datum": "23.09.19",
"Uhrzeit": "16:36",
"Beschreibung": "Übernachtung",
"MwSt.%": 7.0,
"Betrag": 77.0,
"Zahlung": null
},
{
"Datum": "24.09.19",
"Uhrzeit": null,
"Beschreibung": "Übernachtung",
"MwSt.%": 7.0,
"Betrag": 135.0,
"Zahlung": null
},
{
"Datum": "25.09.19",
"Uhrzeit": null,
"Beschreibung": "Übernachtung",
"MwSt.%": 7.0,
"Betrag": 82.0,
"Zahlung": null
},
{
"Datum": "26.09.19",
"Uhrzeit": null,
"Beschreibung": "Übernachtung",
"MwSt.%": 7.0,
"Betrag": 217.0,
"Zahlung": null
},
{
"Datum": "24.09.19",
"Uhrzeit": "9:50",
"Beschreibung": "Premier Inn Frühstücksbuffet",
"MwSt.%": 19.0,
"Betrag": 9.9,
"Zahlung": null
},
{
"Datum": "25.09.19",
"Uhrzeit": "9:50",
"Beschreibung": "Premier Inn Frühstücksbuffet",
"MwSt.%": 19.0,
"Betrag": 9.9,
"Zahlung": null
},
{
"Datum": "26.09.19",
"Uhrzeit": "9:50",
"Beschreibung": "Premier Inn Frühstücksbuffet",
"MwSt.%": 19.0,
"Betrag": 9.9,
"Zahlung": null
},
{
"Datum": "27.09.19",
"Uhrzeit": "9:50",
"Beschreibung": "Premier Inn Frühstücksbuffet",
"MwSt.%": 19.0,
"Betrag": 9.9,
"Zahlung": null
}
],
"Payment Information": {
"Zahlung": "550,60",
"Gesamt (Rechnungsbetrag)": "550,60",
"Offener Betrag": "0,00",
"Bezahlart": "Mastercard-Kreditkarte"
},
"Tax Information": {
"MwSt.%": [
{
"Rate": 19.0,
"Netto": 33.28,
"MwSt.": 6.32,
"Brutto": 39.6
},
{
"Rate": 7.0,
"Netto": 477.57,
"MwSt.": 33.43,
"Brutto": 511.0
}
]
}
}
]`
```
## Part 2: Transforming data according to a schema
You’ve extracted data from PDFs and have likely loaded the unstructured extractions as JSON objects in a data lake. The next step in our ELT workflow is to use GPT-4o to transform the extractions according to our desired schema. This will enable us to ingest any resulting tables into a database. We’ve decided upon the following schema that broadly covers most of the information we would have seen across the different invoices. This schema will be used to process each raw JSON extraction into our desired schematized JSON and can specify particular formats such as “date”: “YYYY-MM-DD”. We’re also going to translate the data into English at this step.
```
`[
{
"hotel\_information": {
"name": "string",
"address": {
"street": "string",
"city": "string",
"country": "string",
"postal\_code": "string"
},
"contact": {
"phone": "string",
"fax": "string",
"email": "string",
"website": "string"
}
},
"guest\_information": {
"company": "string",
"address": "string",
"guest\_name": "string"
},
"invoice\_information": {
"invoice\_number": "string",
"reservation\_number": "string",
"date": "YYYY-MM-DD",
"room\_number": "string",
"check\_in\_date": "YYYY-MM-DD",
"check\_out\_date": "YYYY-MM-DD"
},
"charges": [
{
"date": "YYYY-MM-DD",
"description": "string",
"charge": "number",
"credit": "number"
}
],
"totals\_summary": {
"currency": "string",
"total\_net": "number",
"total\_tax": "number",
"total\_gross": "number",
"total\_charge": "number",
"total\_credit": "number",
"balance\_due": "number"
},
"taxes": [
{
"tax\_type": "string",
"tax\_rate": "string",
"net\_amount": "number",
"tax\_amount": "number",
"gross\_amount": "number"
}
]
}
]`
```
```
`def transform\_invoice\_data(json\_raw, json\_schema):
system\_prompt = f"""
You are a data transformation tool that takes in JSON data and a reference JSON schema, and outputs JSON data according to the schema.
Not all of the data in the input JSON will fit the schema, so you may need to omit some data or add null values to the output JSON.
Translate all data into English if not already in English.
Ensure values are formatted as specified in the schema (e.g. dates as YYYY-MM-DD).
Here is the schema:
{json\_schema}
"""
response = client.chat.completions.create(
model="gpt-4o",
response\_format={ "type": "json\_object" },
messages=[
{
"role": "system",
"content": system\_prompt
},
{
"role": "user",
"content": [
{"type": "text", "text": f"Transform the following raw JSON data according to the provided schema. Ensure all data is in English and formatted as specified by values in the schema. Here is the raw JSON: {json\_raw}"}
]
}
],
temperature=0.0,
)
return json.loads(response.choices[0].message.content)
def main\_transform(extracted\_invoice\_json\_path, json\_schema\_path, save\_path):
# Load the JSON schema
with open(json\_schema\_path, 'r', encoding='utf-8') as f:
json\_schema = json.load(f)
# Ensure the save directory exists
os.makedirs(save\_path, exist\_ok=True)
# Process each JSON file in the extracted invoices directory
for filename in os.listdir(extracted\_invoice\_json\_path):
if filename.endswith(".json"):
file\_path = os.path.join(extracted\_invoice\_json\_path, filename)
# Load the extracted JSON
with open(file\_path, 'r', encoding='utf-8') as f:
json\_raw = json.load(f)
# Transform the JSON data
transformed\_json = transform\_invoice\_data(json\_raw, json\_schema)
# Save the transformed JSON to the save directory
transformed\_filename = f"transformed\_{filename}"
transformed\_file\_path = os.path.join(save\_path, transformed\_filename)
with open(transformed\_file\_path, 'w', encoding='utf-8') as f:
json.dump(transformed\_json, f, ensure\_ascii=False, indent=2)
extracted\_invoice\_json\_path = "./data/hotel\_invoices/extracted\_invoice\_json"
json\_schema\_path = "./data/hotel\_invoices/invoice\_schema.json"
save\_path = "./data/hotel\_invoices/transformed\_invoice\_json"
main\_transform(extracted\_invoice\_json\_path, json\_schema\_path, save\_path)`
```
## Part 3: Loading transformed data into a database
Now that we’ve schematized all of our data, we can segment it into tables for ingesting into a relational database. In particular, we’re going to create four tables: Hotels, Invoices, Charges and Taxes. All of the invoices pertained to one guest, so we won’t create a guest table.
```
`import os
import json
import sqlite3
def ingest\_transformed\_jsons(json\_folder\_path, db\_path):
conn = sqlite3.connect(db\_path)
cursor = conn.cursor()
# Create necessary tables
cursor.execute('''
CREATE TABLE IF NOT EXISTS Hotels (
hotel\_id INTEGER PRIMARY KEY AUTOINCREMENT,
name TEXT,
street TEXT,
city TEXT,
country TEXT,
postal\_code TEXT,
phone TEXT,
fax TEXT,
email TEXT,
website TEXT
)
''')
cursor.execute('''
CREATE TABLE IF NOT EXISTS Invoices (
invoice\_id INTEGER PRIMARY KEY AUTOINCREMENT,
hotel\_id INTEGER,
invoice\_number TEXT,
reservation\_number TEXT,
date TEXT,
room\_number TEXT,
check\_in\_date TEXT,
check\_out\_date TEXT,
currency TEXT,
total\_net REAL,
total\_tax REAL,
total\_gross REAL,
total\_charge REAL,
total\_credit REAL,
balance\_due REAL,
guest\_company TEXT,
guest\_address TEXT,
guest\_name TEXT,
FOREIGN KEY(hotel\_id) REFERENCES Hotels(hotel\_id)
)
''')
cursor.execute('''
CREATE TABLE IF NOT EXISTS Charges (
charge\_id INTEGER PRIMARY KEY AUTOINCREMENT,
invoice\_id INTEGER,
date TEXT,
description TEXT,
charge REAL,
credit REAL,
FOREIGN KEY(invoice\_id) REFERENCES Invoices(invoice\_id)
)
''')
cursor.execute('''
CREATE TABLE IF NOT EXISTS Taxes (
tax\_id INTEGER PRIMARY KEY AUTOINCREMENT,
invoice\_id INTEGER,
tax\_type TEXT,
tax\_rate TEXT,
net\_amount REAL,
tax\_amount REAL,
gross\_amount REAL,
FOREIGN KEY(invoice\_id) REFERENCES Invoices(invoice\_id)
)
''')
# Loop over all JSON files in the specified folder
for filename in os.listdir(json\_folder\_path):
if filename.endswith(".json"):
file\_path = os.path.join(json\_folder\_path, filename)
# Load the JSON data
with open(file\_path, 'r', encoding='utf-8') as f:
data = json.load(f)
# Insert Hotel Information
cursor.execute('''
INSERT INTO Hotels (name, street, city, country, postal\_code, phone, fax, email, website)
VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
''', (
data["hotel\_information"]["name"],
data["hotel\_information"]["address"]["street"],
data["hotel\_information"]["address"]["city"],
data["hotel\_information"]["address"]["country"],
data["hotel\_information"]["address"]["postal\_code"],
data["hotel\_information"]["contact"]["phone"],
data["hotel\_information"]["contact"]["fax"],
data["hotel\_information"]["contact"]["email"],
data["hotel\_information"]["contact"]["website"]
))
hotel\_id = cursor.lastrowid
# Insert Invoice Information
cursor.execute('''
INSERT INTO Invoices (hotel\_id, invoice\_number, reservation\_number, date, room\_number, check\_in\_date, check\_out\_date, currency, total\_net, total\_tax, total\_gross, total\_charge, total\_credit, balance\_due, guest\_company, guest\_address, guest\_name)
VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
''', (
hotel\_id,
data["invoice\_information"]["invoice\_number"],
data["invoice\_information"]["reservation\_number"],
data["invoice\_information"]["date"],
data["invoice\_information"]["room\_number"],
data["invoice\_information"]["check\_in\_date"],
data["invoice\_information"]["check\_out\_date"],
data["totals\_summary"]["currency"],
data["totals\_summary"]["total\_net"],
data["totals\_summary"]["total\_tax"],
data["totals\_summary"]["total\_gross"],
data["totals\_summary"]["total\_charge"],
data["totals\_summary"]["total\_credit"],
data["totals\_summary"]["balance\_due"],
data["guest\_information"]["company"],
data["guest\_information"]["address"],
data["guest\_information"]["guest\_name"]
))
invoice\_id = cursor.lastrowid
# Insert Charges
for charge in data["charges"]:
cursor.execute('''
INSERT INTO Charges (invoice\_id, date, description, charge, credit)
VALUES (?, ?, ?, ?, ?)
''', (
invoice\_id,
charge["date"],
charge["description"],
charge["charge"],
charge["credit"]
))
# Insert Taxes
for tax in data["taxes"]:
cursor.execute('''
INSERT INTO Taxes (invoice\_id, tax\_type, tax\_rate, net\_amount, tax\_amount, gross\_amount)
VALUES (?, ?, ?, ?, ?, ?)
''', (
invoice\_id,
tax["tax\_type"],
tax["tax\_rate"],
tax["net\_amount"],
tax["tax\_amount"],
tax["gross\_amount"]
))
conn.commit()
conn.close()`
```
Now let’s check that we’ve correctly ingested the data by running a sample SQL query to determine the most expensive hotel stay and the same of the hotel!
You can even automate the generation of SQL queries at this step by using function calling, check out our [cookbook on function calling with model generated arguments](https://cookbook.openai.com/examples/how_to_call_functions_with_chat_models#how-to-call-functions-with-model-generated-arguments) to learn how to do that.
```
`
def execute\_query(db\_path, query, params=()):
"""
Execute a SQL query and return the results.
Parameters:
db\_path (str): Path to the SQLite database file.
query (str): SQL query to be executed.
params (tuple): Parameters to be passed to the query (default is an empty tuple).
Returns:
list: List of rows returned by the query.
"""
try:
# Connect to the SQLite database
conn = sqlite3.connect(db\_path)
cursor = conn.cursor()
# Execute the query with parameters
cursor.execute(query, params)
results = cursor.fetchall()
# Commit if it's an INSERT/UPDATE/DELETE query
if query.strip().upper().startswith(('INSERT', 'UPDATE', 'DELETE')):
conn.commit()
return results
except sqlite3.Error as e:
print(f"An error occurred: {e}")
return []
finally:
# Close the connection
if conn:
conn.close()
# Example usage
transformed\_invoices\_path = "./data/hotel\_invoices/transformed\_invoice\_json"
db\_path = "./data/hotel\_invoices/hotel\_DB.db"
ingest\_transformed\_jsons(transformed\_invoices\_path, db\_path)
query = '''
SELECT
h.name AS hotel\_name,
i.total\_gross AS max\_spent
FROM
Invoices i
JOIN
Hotels h ON i.hotel\_id = h.hotel\_id
ORDER BY
i.total\_gross DESC
LIMIT 1;
'''
results = execute\_query(db\_path, query)
for row in results:
print(row)`
```
```
`('Citadines Michel Hamburg', 903.63)`
```
To recap in this cookbook we showed you how to use GPT-4o for extracting and transforming data that would otherwise be inaccessible for data analysis. If you don’t need these workflows to happen in real-time, you can take advantage of OpenAI’s BatchAPI to run jobs asynchronously at a much lower cost!