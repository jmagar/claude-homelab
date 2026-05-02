Optimizing Retrieval-Augmented Generation using GPT-4o Vision Modality
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
Nov 12, 2024
# Optimizing Retrieval-Augmented Generation using GPT-4o Vision Modality
[ MS ](https://github.com/msingh-openai)
[ Mandeep Singh
(OpenAI)
](https://github.com/msingh-openai)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/vector_databases/pinecone/Using_vision_modality_for_RAG_with_Pinecone.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/vector_databases/pinecone/Using_vision_modality_for_RAG_with_Pinecone.ipynb)
## Optimizing Retrieval-Augmented Generation using GPT-4o Vision Modality
Implementing Retrieval-Augmented Generation (RAG) presents unique challenges when working with documents rich in images, graphics and tables. Traditional RAG models excel with textual data but often falter when visual elements play a crucial role in conveying information. In this cookbook, we bridge that gap by leveraging the vision modality to extract and interpret visual content, ensuring that the generated responses are as informative and accurate as possible.
Our approach involves parsing documents into images and utilizing metadata tagging to identify pages containing images, graphics and tables. When a semantic search retrieves such a page, we pass the page image to a vision model instead of relying solely on text. This method enhances the model’s ability to understand and answer user queries that pertain to visual data.
In this cookbook, we will explore and demonstrate the following key concepts:
##### 1. Setting Up a Vector Store with Pinecone:
* Learn how to initialize and configure Pinecone to store vector embeddings efficiently.
##### 2. Parsing PDFs and Extracting Visual Information:
* Discover techniques for converting PDF pages into images.
* Use GPT-4o vision modality to extract textual information from pages with images, graphics or tables.
##### 3. Generating Embeddings:
* Utilize embedding models to create vector representations of textual data.
* Flag the pages that have visual content so that we set a metadata flag on vector store, and retrieve images to pass on the GPT-4o using vision modality.
##### 4. Uploading Embeddings to Pinecone:
* Upload these embeddings to Pinecone for storage and retrieval.
##### 5. Performing Semantic Search for Relevant Pages:
* Implement semantic search on page text to find pages that best match the user’s query.
* Provide the matching page text to GPT-4o as context to answer user’s query.
##### 6. Handling Pages with Visual Content (Optional Step):
* Learn how to pass the image using GPT-4o vision modality for question answering with additional context.
* Understand how this process improves the accuracy of responses involving visual data.
By the end of this cookbook, you will have a robust understanding of how to implement RAG systems capable of processing and interpreting documents with complex visual elements. This knowledge will empower you to build AI solutions that deliver richer, more accurate information, enhancing user satisfaction and engagement.
We will use the World Bank report - [A Better Bank for a Better World: Annual Report 2024](https://documents1.worldbank.org/curated/en/099101824180532047/pdf/BOSIB13bdde89d07f1b3711dd8e86adb477.pdf) to illustrate the concepts as this document has a mix of images, tables and graphics data.
Keep in mind that using the Vision Modality is resource-intensive, leading to increased latency and cost. It is advisable to use Vision Modality only for cases where performance on evaluation benchmarks is unsatisfactory with plain text extraction methods. With this context, let’s dive in.
### Step 1: Setting up a Vector Store with Pinecone
In this section, we’ll set up a vector store using Pinecone to store and manage our embeddings efficiently. Pinecone is a vector database optimized for handling high-dimensional vector data, which is essential for tasks like semantic search and similarity matching.
**Prerequisites**
1. Sign-up for Pinecone and obtain an API key by following the instructions here [Pinecone Database Quickstart](https://docs.pinecone.io/guides/get-started/quickstart)
2. Install the Pinecone SDK using `pip install "pinecone[grpc]"`. gRPC (gRPC Remote Procedure Call) is a high-performance, open-source universal RPC framework that uses HTTP/2 for transport, Protocol Buffers (protobuf) as the interface definition language, and enables client-server communication in a distributed system. It is designed to make inter-service communication more efficient and suitable for microservices architectures.
**Store the API Key Securely**
1. Store the API key in an .env file for security purposes in you project directory as follows:
`PINECONE\_API\_KEY=your-api-key-here`.
2. Install `pip install python-dotenv` to read the API Key from the .env file.
**Create the Pinecone Index**
We’ll use the `create\_index` function to initialize our embeddings database on Pinecone. There are two crucial parameters to consider:
1. Dimension: This must match the dimensionality of the embeddings produced by your chosen model. For example, OpenAI’s text-embedding-ada-002 model produces embeddings with 1536 dimensions, while text-embedding-3-large produces embeddings with 3072 dimensions. We’ll use the text-embedding-3-large model, so we’ll set the dimension to 3072.
2. Metric: The distance metric determines how similarity is calculated between vectors. Pinecone supports several metrics, including cosine, dotproduct, and euclidean. For this cookbook, we’ll use the cosine similarity metric. You can learn more about distance metrics in the [Pinecone Distance Metrics documentation](https://docs.pinecone.io/guides/indexes/understanding-indexes#distance-metrics).
```
`import os
import time
# Import the Pinecone library
from pinecone.grpc import PineconeGRPC as Pinecone
from pinecone import ServerlessSpec
from dotenv import load\_dotenv
load\_dotenv()
api\_key = os.getenv("PINECONE\_API\_KEY")
# Initialize a Pinecone client with your API key
pc = Pinecone(api\_key)
# Create a serverless index
index\_name = "my-test-index"
if not pc.has\_index(index\_name):
pc.create\_index(
name=index\_name,
dimension=3072,
metric="cosine",
spec=ServerlessSpec(
cloud='aws',
region='us-east-1'
)
)
# Wait for the index to be ready
while not pc.describe\_index(index\_name).status['ready']:
time.sleep(1)`
```
Navigate to Indexes list on [Pinecone](https://app.pinecone.io/) and you should be able to view `my-test-index` in the list of indexes.
### Step 2: Parsing PDFs and Extracting Visual Information:
In this section, we will parse our PDF document the World Bank report - [A Better Bank for a Better World: Annual Report 2024](https://documents1.worldbank.org/curated/en/099101824180532047/pdf/BOSIB13bdde89d07f1b3711dd8e86adb477.pdf) and extract textual and visual information, such as describing images, graphics, and tables. The process involves three main steps:
1. **Parse the PDF into individual pages:** We split the PDF into separate pages for easier processing.
2. **Convert PDF pages to images:** This enabled vision GPT-4o vision capability to analyze the page as an image.
3. **Process images and tables:** Provide instructions to GPT-4o to extract text, and also describe the images, graphics or tables in the document.
**Prerequisites**
Before proceeding, make sure you have the following packages installed. Also ensure your OpenAI API key is set up as an environment variable. You may also need to install Poppler for PDF rendering.
`pip install PyPDF2 pdf2image pytesseract pandas tqdm`
**Step Breakdown:**
**1. Downloading and Chunking the PDF:**
* The `chunk\_document` function downloads the PDF from the provided URL and splits it into individual pages using PyPDF2.
* Each page is stored as a separate PDF byte stream in a list.
**2. Converting PDF Pages to Images:**
* The `convert\_page\_to\_image` function takes the PDF bytes of a single page and converts it into an image using pdf2image.
* The image is saved locally in an ‘images’ directory for further processing.
**3. Extracting Text Using GPT-4o vision modality:**
* The `extract\_text\_from\_image` function uses GPT-4o vision capability to extract text from the image of the page.
* This method can extract textual information even from scanned documents.
* Note that this modality is resource intensive thus has higher latency and cost associated with it.
**4. Processing the Entire Document:**
* The process\_document function orchestrates the processing of each page.
* It uses a progress bar (tqdm) to show the processing status.
* The extracted information from each page is collected into a list and then converted into a Pandas DataFrame.
```
`import base64
import requests
import os
import pandas as pd
from PyPDF2 import PdfReader, PdfWriter
from pdf2image import convert\_from\_bytes
from io import BytesIO
from openai import OpenAI
from tqdm import tqdm
# Link to the document we will use as the example
document\_to\_parse = "https://documents1.worldbank.org/curated/en/099101824180532047/pdf/BOSIB13bdde89d07f1b3711dd8e86adb477.pdf"
# OpenAI client
oai\_client = OpenAI()
# Chunk the PDF document into single page chunks
def chunk\_document(document\_url):
# Download the PDF document
response = requests.get(document\_url)
pdf\_data = response.content
# Read the PDF data using PyPDF2
pdf\_reader = PdfReader(BytesIO(pdf\_data))
page\_chunks = []
for page\_number, page in enumerate(pdf\_reader.pages, start=1):
pdf\_writer = PdfWriter()
pdf\_writer.add\_page(page)
pdf\_bytes\_io = BytesIO()
pdf\_writer.write(pdf\_bytes\_io)
pdf\_bytes\_io.seek(0)
pdf\_bytes = pdf\_bytes\_io.read()
page\_chunk = {
'pageNumber': page\_number,
'pdfBytes': pdf\_bytes
}
page\_chunks.append(page\_chunk)
return page\_chunks
# Function to encode the image
def encode\_image(local\_image\_path):
with open(local\_image\_path, "rb") as image\_file:
return base64.b64encode(image\_file.read()).decode('utf-8')
# Function to convert page to image
def convert\_page\_to\_image(pdf\_bytes, page\_number):
# Convert the PDF page to an image
images = convert\_from\_bytes(pdf\_bytes)
image = images[0] # There should be only one page
# Define the directory to save images (relative to your script)
images\_dir = 'images' # Use relative path here
# Ensure the directory exists
os.makedirs(images\_dir, exist\_ok=True)
# Save the image to the images directory
image\_file\_name = f"page\_{page\_number}.png"
image\_file\_path = os.path.join(images\_dir, image\_file\_name)
image.save(image\_file\_path, 'PNG')
# Return the relative image path
return image\_file\_path
# Pass the image to the LLM for interpretation
def get\_vision\_response(prompt, image\_path):
# Getting the base64 string
base64\_image = encode\_image(image\_path)
response = oai\_client.chat.completions.create(
model="gpt-4o",
messages=[
{
"role": "user",
"content": [
{"type": "text", "text": prompt},
{
"type": "image\_url",
"image\_url": {
"url": f"data:image/jpeg;base64,{base64\_image}"
},
},
],
}
],
)
return response
# Process document function that brings it all together
def process\_document(document\_url):
try:
# Update document status to 'Processing'
print("Document processing started")
# Get per-page chunks
page\_chunks = chunk\_document(document\_url)
total\_pages = len(page\_chunks)
# Prepare a list to collect page data
page\_data\_list = []
# Add progress bar here
for page\_chunk in tqdm(page\_chunks, total=total\_pages, desc='Processing Pages'):
page\_number = page\_chunk['pageNumber']
pdf\_bytes = page\_chunk['pdfBytes']
# Convert page to image
image\_path = convert\_page\_to\_image(pdf\_bytes, page\_number)
# Prepare question for vision API
system\_prompt = (
"The user will provide you an image of a document file. Perform the following actions: "
"1. Transcribe the text on the page. \*\*TRANSCRIPTION OF THE TEXT:\*\*"
"2. If there is a chart, describe the image and include the text \*\*DESCRIPTION OF THE IMAGE OR CHART\*\*"
"3. If there is a table, transcribe the table and include the text \*\*TRANSCRIPTION OF THE TABLE\*\*"
)
# Get vision API response
vision\_response = get\_vision\_response(system\_prompt, image\_path)
# Extract text from vision response
text = vision\_response.choices[0].message.content
# Collect page data
page\_data = {
'PageNumber': page\_number,
'ImagePath': image\_path,
'PageText': text
}
page\_data\_list.append(page\_data)
# Create DataFrame from page data
pdf\_df = pd.DataFrame(page\_data\_list)
print("Document processing completed.")
print("DataFrame created with page data.")
# Return the DataFrame
return pdf\_df
except Exception as err:
print(f"Error processing document: {err}")
# Update document status to 'Error'
df = process\_document(document\_to\_parse)`
```
```
`Document processing started`
```
```
`Processing Pages: 100%|██████████| 49/49 [18:54\<00:00, 23.14s/it]`
```
```
`Document processing completed.
DataFrame created with page data.`
```
Let’s examine the DataFrame to ensure that the pages have been processed correctly. For brevity, we will retrieve and display only the first five rows. Additionally, you should be able to see the page images generated in the ‘images’ directory.
```
`from IPython.display import display, HTML
# Convert the DataFrame to an HTML table and display top 5 rows
display(HTML(df.head().to\_html()))`
```
||PageNumber|ImagePath|PageText|
|0|1|images/page\_1.png|\*\*TRANSCRIPTION OF THE TEXT:\*\*\\n\\nPublic Disclosure Authorized \\nPublic Disclosure Authorized \\nA BETTER BANK FOR A BETTER WORLD \\nANNUAL REPORT 2024 \\nWORLD BANK GROUP \\nIBRD · IDA \\n\\n\*\*DESCRIPTION OF THE IMAGE OR CHART:\*\*\\n\\nThe image features a nighttime scene with a makeshift shelter illuminated from within. The shelter appears to be made of fabric and has patterns on it. Inside, there are people visible through the opening, and some items such as shoes can be seen on the ground outside the shelter. The setting suggests a community or family environment under starlit skies. The circular graphic elements overlaying the image may imply interconnectedness or global outreach.|
|1|2|images/page\_2.png|\*\*TRANSCRIPTION OF THE TEXT:\*\*\\n\\nCONTENTS\\n\\nMessage from the President 6 \\nMessage from the Executive Directors 8 \\nBecoming a Better Bank 10 \\nFiscal 2024 Financial Summary 12 \\nResults by Region 14 \\nResults by Theme 44 \\nHow We Work 68 \\n\\nKEY TABLES\\nIBRD Key Financial Indicators, Fiscal 2020–24 84 \\nIDA Key Financial Indicators, Fiscal 2020–24 88 \\n\\nThis annual report, which covers the period from July 1, 2023, to June 30, 2024, has been prepared by the Executive Directors of both the International Bank for Reconstruction and Development (IBRD) and the International Development Association (IDA)—collectively known as the World Bank—in accordance with the respective bylaws of the two institutions. Ajay Banga, President of the World Bank Group and Chairman of the Board of Executive Directors, has submitted this report, together with the accompanying administrative budgets and audited financial statements, to the Board of Governors.\\n\\nAnnual reports for the other World Bank Group institutions—the International Finance Corporation (IFC), the Multilateral Investment Guarantee Agency (MIGA), and the International Centre for Settlement of Investment Disputes (ICSID)—are published separately. Key highlights from each institution's annual report are available in the World Bank Group Annual Report Summary.\\n\\nThroughout the report, the term World Bank and the abbreviated Bank refer only to IBRD and IDA; the term World Bank Group and the abbreviated Bank Group refer to the five institutions. All dollar amounts used in this report are current U.S. dollars unless otherwise specified. Funds allocated to multiregional projects are accounted for by recipient country where possible in tables and text when referring to regional breakdowns. For sector and theme breakdowns, funds are accounted for by operation. Fiscal year commitments and disbursements data are in accordance with the audited figures reported in the IBRD and IDA Financial Statements and Management's Discussion and Analysis documents for Fiscal 2024. As a result of rounding, numbers in tables may not add to totals, and percentages in figures may not add to 100.\\n\\n\*\*DESCRIPTION OF THE IMAGE OR CHART\*\*\\n\\nThe image shows a close-up of a hand holding a bundle of rice plants, with golden stalks of rice grains. The background is blurred, showing more rice fields.|
|2|3|images/page\_3.png|\*\*TRANSCRIPTION OF THE TEXT:\*\*\\n\\nABOUT US\\n\\nThe World Bank Group is one of the world’s largest sources of funding and knowledge for developing countries. Our five institutions share a commitment to reducing poverty, increasing shared prosperity, and promoting sustainable development.\\n\\nOUR VISION \\nOur vision is to create a world free of poverty on a livable planet.\\n\\nOUR MISSION \\nOur mission is to end extreme poverty and boost shared prosperity on a livable planet. This is threatened by multiple, intertwined crises. Time is of the essence. We are building a better Bank to drive impactful development that is: \\n• Inclusive of everyone, including women and young people; \\n• Resilient to shocks, including against climate and biodiversity crises, pandemics and fragility; \\n• Sustainable, through growth and job creation, human development, fiscal and debt management, food security and access to clean air, water, and affordable energy.\\n\\nTo achieve this, we will work with all clients as one World Bank Group, in close partnership with other multilateral institutions, the private sector, and civil society.\\n\\nOUR CORE VALUES \\nOur work is guided by our core values: impact, integrity, respect, teamwork, and innovation. These inform everything we do, everywhere we work.|
|3|4|images/page\_4.png|\*\*TRANSCRIPTION OF THE TEXT:\*\*\\n\\nDRIVING ACTION, MEASURING RESULTS\\n\\nThe World Bank Group contributes to impactful, meaningful development results around the world. In the first half of fiscal 2024\*, we:\\n\\n- Helped feed 156 million people\\n- Improved schooling for 280 million students\\n- Reached 287 million people living in poverty with effective social protection support†\\n- Provided healthy water, sanitation, and/or hygiene to 59 million people\\n- Enabled access to sustainable transportation for 77 million people\\n- Provided 17 gigawatts of renewable energy capacity\\n- Committed to devote 45 percent of annual financing to climate action by 2025, deployed equally between mitigation and adaptation\\n\\n\*The development of the new Scorecard is ongoing at the time of printing; therefore, this report can only account for results up to December 31, 2023.\\nAs of the 2024 IMF-World Bank Group Annual Meetings, the full fiscal 2024 Scorecard data will be available at: https://scorecard.worldbankgroup.org\\n\\n† IBRD and IDA only indicator.\\n\\nIn fiscal 2024, the Bank Group announced the development of a new Scorecard that will track results across 22 indicators—a fraction of the previous 150—to provide a streamlined, clear picture of progress on all aspects of the Bank Group’s mission, from improving access to healthcare to making food systems sustainable to boosting private investment.\\n\\nFor the first time, the work of all Bank Group financing institutions will be tracked through the same set of indicators. The new Scorecard will track the Bank Group’s overarching vision of ending poverty on a livable planet.\\n\\nTHE WORLD BANK ANNUAL REPORT 2024\\n\\n\*\*DESCRIPTION OF THE IMAGE OR CHART:\*\*\\n\\nThe image displays a series of circular photographs connected with text highlights depicting World Bank Group achievements. The photos include people and infrastructure related to food, education, social protection, water, transportation, renewable energy, and environmental initiatives. Each photo correlates with a text entry describing a specific achievement or commitment.|
|4|5|images/page\_5.png|\*\*TRANSCRIPTION OF THE TEXT:\*\*\\n\\nMESSAGE FROM THE PRESIDENT\\n\\nDELIVERING ON OUR COMMITMENTS REQUIRES US TO DEVELOP NEW AND BETTER WAYS OF WORKING. IN FISCAL 2024, WE DID JUST THAT.\\n\\nAJAY BANGA\\n\\nIn fiscal 2024, the World Bank Group adopted a bold new vision of a world free of poverty on a livable planet. To achieve this, the Bank Group is enacting reforms to become a better partner to governments, the private sector, and, ultimately, the people we serve. Rarely in our 80-year history has our work been more urgent: We face declining progress in our fight against poverty, an existential climate crisis, mounting public debt, food insecurity, an unequal pandemic recovery, and the effects of geopolitical conflict.\\n\\nResponding to these intertwined challenges requires a faster, simpler, and more efficient World Bank Group. We are refocusing to confront these challenges not just through funding, but with knowledge. Our Knowledge Compact for Action, published in fiscal 2024, details how we will empower all Bank Group clients, public and private, by making our wealth of development knowledge more accessible. And we have reorganized the World Bank’s global practices into five Vice Presidency units—People, Prosperity, Planet, Infrastructure, and Digital—for more flexible and faster engagements with clients. Each of these units reached important milestones in fiscal 2024.\\n\\nWe are supporting countries in delivering quality, affordable health services to 1.5 billion people by 2030 so our children and grandchildren will lead healthier, better lives. This is part of our larger global effort to address a basic standard of care through every stage of a person’s life—infancy, childhood, adolescence, and adulthood. To help people withstand food-affected shocks and crises, we are strengthening social protection services to support half a billion people by the end of 2030—aiming for half of these beneficiaries to be women.\\n\\nWe are helping developing countries create jobs and employment, the surest enablers of prosperity. In the next 10 years, 1.2 billion young people across the Global South will become working-age adults. Yet, in the same period and the same countries, only 424 million jobs are expected to be created. The cost of hundreds of millions of young people with no hope for a decent job or future is unimaginable, and we are working urgently to create opportunity for all.\\n\\nIn response to climate change—arguably the greatest challenge of our generation—we’re channeling 45 percent of annual financing to climate action by 2025, deployed equally between mitigation and adaptation. Among other efforts, we intend to launch at least 15 country-led methane-reduction programs by fiscal 2026, and our Forest Carbon Partnership Facility has helped strengthen high-integrity carbon markets.\\n\\nAccess to electricity is a fundamental human right and foundational to any successful development effort. It will accelerate the digital development of developing countries, strengthen public infrastructure, and prepare people for the jobs of tomorrow. But half the population of Africa—600 million people—lacks access to electricity. In response, we have committed to provide electricity to 300 million people in Sub-Saharan Africa by 2030 in partnership with the African Development Bank.\\n\\nRecognizing that digitalization is the transformational opportunity of our time, we are collaborating with governments in more than 100 developing countries to enable digital economies. Our digital lending portfolio totaled $6.5 billion in commitments as of June 2024, and our new Digital Vice Presidency unit will guide our efforts to establish the foundations of a digital economy. Key measures include building and enhancing digital and data infrastructure, ensuring cybersecurity and data privacy for institutions, businesses, and citizens, and advancing digital government services.\\n\\nDelivering on our commitments requires us to develop new and better ways of working. In fiscal 2024, we did just that. We are squeezing our balance sheet and finding new opportunities to take more risk and boost our lending. Our new crisis preparedness and response tools, Global Challenge Programs, and Livable Planet Fund demonstrate how we are modernizing our approach to better thrive and meet outcomes. Our new Scorecard radically changes how we track results.\\n\\nBut we cannot deliver alone; we depend on our own. We need partners from both the public and private sectors to join our efforts. That’s why we are working closely with other multilateral development banks to improve the lives of people in developing countries in tangible, measurable ways. Our deepening relationship with the private sector is evidenced by our Private Sector Investment Lab, which is working to address the barriers preventing private sector investment in emerging markets. The Lab’s core group of 15 Chief Executive Officers and Chairs meets regularly, and already has informed our work—most notably with the development of the World Bank Group Guarantee Platform.\\n\\nThe impact and innovations we delivered this year will allow us to move forward with a raised ambition and a greater sense of urgency to improve people’s lives. I would like to recognize the remarkable efforts of our staff and Executive Directors, as well as the unwavering support of our clients and partners. Together, we head into fiscal 2025 with a great sense of optimism—and determination to create a better Bank for a better world.\\n\\nAJAY BANGA \\nPresident of the World Bank Group \\nand Chairman of the Board of Executive Directors\\n\\n\*\*DESCRIPTION OF THE IMAGE OR CHART:\*\*\\n\\nThe image shows a group of people engaged in agriculture. One person is holding a tomato, and others are observing. It reflects collaboration or assistance in agricultural practices, possibly in a developing country.|
Let’s take a look at a sample page, such as page 21, which contains embedded graphics and text. We can observe that the vision modality effectively extracted and described the visual information. For instance, the pie chart on this page is accurately described as:
`"FIGURE 6: MIDDLE EAST AND NORTH AFRICA IBRD AND IDA LENDING BY SECTOR - FISCAL 2024 SHARE OF TOTAL OF $4.6 BILLION" is a circular chart, resembling a pie chart, illustrating the percentage distribution of funds among different sectors. The sectors include:`
```
`# Filter and print rows where pageNumber is 21
filtered\_rows = df[df['PageNumber'] == 21]
for text in filtered\_rows.PageText:
print(text)`
```
```
`\*\*TRANSCRIPTION OF THE TEXT:\*\*
We also committed $35 million in grants to support emergency relief in Gaza. Working with the World Food Programme, the World Health Organization, and the UN Children’s Fund, the grants supported the delivery of emergency food, water, and medical supplies. In the West Bank, we approved a $200 million program for the continuation of education for children, $22 million to support municipal services, and $45 million to strengthen healthcare and hospital services.
\*\*Enabling green and resilient growth\*\*
To help policymakers in the region advance their climate change and development goals, we published Country Climate and Development Reports for the West Bank and Gaza, Lebanon, and Tunisia. In Libya, the catastrophic flooding in September 2023 devastated eastern localities, particularly the city of Derna. The World Bank, together with the UN and the European Union, produced a Rapid Damage and Needs Assessment to inform recovery and reconstruction efforts.
We signed a new Memorandum of Understanding (MoU) with the Islamic Development Bank to promote further collaboration between our institutions. The MoU focuses on joint knowledge and operational engagements around the energy, food, and water nexus, climate impact, empowering women and youth to engage with the private sector, and advancing the digital transition and regional integration. The MoU aims to achieve a co-financing value of $6 billion through 2026, 45 percent of which has already been met.
\*\*Expanding economic opportunities for women\*\*
The World Bank has drawn on a variety of instruments to support Jordan’s commitment to increase female labor force participation, including through the recently approved Country Partnership Framework. Through operations, technical assistance (such as Mashreq Gender Facility; Women Entrepreneurs Finance Initiative; and the Women, Business and the Law report), and policy dialogue, we have contributed to legal reforms in Jordan that removed job restrictions on women, prohibited gender-based discrimination in the workplace, and criminalized sexual harassment in the workplace. In fiscal 2024, we approved the first women-focused Bank project in the region: the Enhancing Women’s Economic Opportunities Program for Results aims to improve workplace conditions, increase financial inclusion and entrepreneurship, make public transport safer, and increase access to affordable, quality childcare services.
\*\*Analyzing critical infrastructure needs\*\*
We published an Interim Damage Assessment for Gaza in partnership with the UN and with financial support from the EU. This found that a preliminary estimate of the cost of damages to critical infrastructure from the conflict in Gaza between October 2023 and the end of January 2024 was around $18.5 billion—equivalent to 97 percent of the 2022 GDP of the West Bank and Gaza combined. When the situation allows, a full-fledged Rapid Damage and Needs Assessment will be conducted.
\*\*COUNTRY IMPACT\*\*
Egypt: The Bank-supported Takaful and Karama social protection program has reached 4.7 million vulnerable households, benefitting approximately 20 million individuals, 75 percent of them women.
Lebanon: A roads project has rehabilitated over 500 km of roads in 25 districts across the country and generated 1.3 million labor days for Lebanese workers and Syrian refugees.
Morocco: Our programs have benefited more than 400,000 people directly and more than 33 million people indirectly, through more than 230 disaster risk reduction projects.
\*\*DESCRIPTION OF THE IMAGE OR CHART:\*\*
The image is a pie chart titled "FIGURE 6: MIDDLE EAST AND NORTH AFRICA IBRD AND IDA LENDING BY SECTOR - FISCAL 2024 SHARE OF TOTAL OF $4.6 BILLION." The chart breaks down the sectors as follows:
- Public Administration: 24%
- Social Protection: 13%
- Health: 13%
- Education: 17%
- Agriculture, Fishing, and Forestry: 8%
- Water, Sanitation, and Waste Management: 8%
- Transportation: 5%
- Energy and Extractives: 3%
- Financial Sector: 1%
- Industry, Trade, and Services: 2%
- Information and Communications Technologies: 6%
\*\*TRANSCRIPTION OF THE TABLE:\*\*
TABLE 13: MIDDLE EAST AND NORTH AFRICA REGIONAL SNAPSHOT
| INDICATOR | 2000 | 2012 | CURRENT DATA\* |
|----------------------------------------------------------|--------|----------|---------------|
| Total population (millions) | 283.9 | 356.2 | 430.9 |
| Population growth (annual %) | 2.0 | 1.8 | 1.5 |
| GNI per capita (Atlas method, current US$) | 1,595.5| 4,600.4 | 3,968.1 |
| GDP per capita growth (annual %) | 4.0 | 1.7 | 1.2 |
| Population living below $2.15 a day (millions) | 9.7 | 8.2 | 19.1 |
| Life expectancy at birth, females (years) | 70.8 | 73.9 | 74.8 |
| Life expectancy at birth, males (years) | 66.5 | 69.6 | 69.9 |
| Carbon dioxide emissions (megatons) | 813.2 | 1,297.7 | 1,370.9 |
| Extreme poverty (% of population below $2.15 a day, 2017 PPP)| 3.4 | 2.3 | 4.7 |
| Debt service as a proportion of exports of goods, services, and primary income | 15.1 | 5.2 | 12.4 |
| Ratio of female to male labor force participation rate (%) (modeled ILO estimate) | 24.5 | 26.2 | 23.2 |
| Vulnerable employment, total (% of total employment) (modeled ILO estimate) | 35.4 | 31.7 | 31.4 |
| Under-5 mortality rate per 1,000 live births | 46.7 | 29.0 | 20.9 |
| Primary completion rate (% of relevant age group) | 81.4 | 88.9 | 86.7 |
| Individuals using the Internet (% of population) | 0.9 | 26.0 | 73.4 |
| Access to electricity (% of population) | 91.4 | 94.7 | 96.9 |
| Renewable energy consumption (% of total final energy consumption) | 3.0 | 3.6 | 2.9 |
| People using at least basic drinking water services (% of population) | 86.5 | 90.6 | 93.7 |
| People using at least basic sanitation services (% of population) | 79.4 | 86.2 | 90.4 |
\*Note: ILO = International Labour Organization. PPP = purchasing power parity. a. The most current data available between 2018 and 2023; visit [https://data.worldbank.org](https://data.worldbank.org) for data updates.
For more information, visit [www.worldbank.org/mena](http://www.worldbank.org/mena).`
```
### Step 3: Generating Embeddings:
In this section, we focus on transforming the textual content extracted from each page of the document into vector embeddings. These embeddings capture the semantic meaning of the text, enabling efficient similarity searches and various Natural Language Processing (NLP) tasks. We also identify pages containing visual elements, such as images, graphics, or tables, and flag them for special handling.
**Step Breakdown:**
**1. Adding a flag for visual content**
To process pages containing visual information, in Step 2 we used the vision modality to extract content from charts, tables, and images. By including specific instructions in our prompt, we ensure that the model adds markers such as `DESCRIPTION OF THE IMAGE OR CHART` or `TRANSCRIPTION OF THE TABLE` when describing visual content. In this step, if such a marker is detected, we set the Visual\_Input\_Processed flag to ‘Y’; otherwise, it remains ‘N’.
While the vision modality captures most visual information effectively, some details—particularly in complex visuals like engineering drawings—may be lost in translation. In Step 6, we will use this flag to determine when to pass the image of the page to GPT-4 Vision as additional context. This is an optional enhancement that can significantly improve the effectiveness of a RAG solution.
**2. Generating Embeddings with OpenAI’s Embedding Model**
We use OpenAI’s embedding model, `text-embedding-3-large`, to generate high-dimensional embeddings that represent the semantic content of each page.
Note: It is crucial to ensure that the dimensions of the embedding model you use are consistent with the configuration of your Pinecone vector store. In our case, we set up the Pinecone database with 3072 dimensions to match the default dimensions of `text-embedding-3-large`.
```
`# Add a column to flag pages with visual content
df['Visual\_Input\_Processed'] = df['PageText'].apply(
lambda x: 'Y' if 'DESCRIPTION OF THE IMAGE OR CHART' in x or 'TRANSCRIPTION OF THE TABLE' in x else 'N'
)
# Function to get embeddings
def get\_embedding(text\_input):
response = oai\_client.embeddings.create(
input=text\_input,
model="text-embedding-3-large"
)
return response.data[0].embedding
# Generate embeddings with a progress bar
embeddings = []
for text in tqdm(df['PageText'], desc='Generating Embeddings'):
embedding = get\_embedding(text)
embeddings.append(embedding)
# Add the embeddings to the DataFrame
df['Embeddings'] = embeddings`
```
```
`Generating Embeddings: 100%|██████████| 49/49 [00:18\<00:00, 2.61it/s]`
```
We can verify that our logic correctly flagged pages requiring visual input. For instance, page 21, which we previously examined, has the Visual\_Input\_Needed flag set to “Y”.
```
`# Display the flag for page 21
filtered\_rows = df[df['PageNumber'] == 21]
print(filtered\_rows.Visual\_Input\_Processed)`
```
```
`20 Y
Name: Visual\_Input\_Processed, dtype: object`
```
#### Step 4: Uploading embeddings to Pinecone:
In this section, we will upload the embeddings we’ve generated for each page of our document to Pinecone. Along with the embeddings, we’ll include relevant metadata tags that describe each page, such as the page number, text content, image paths, and whether the page includes graphics.
**Step Breakdown:**
**1. Create Metadata Fields:**
Metadata enhances our ability to perform more granular searches, find the text or image associated with the vector, and enables filtering within the vector database.
* pageId: Combines the document\_id and pageNumber to create a unique identifier for each page. We will use this as a unique identifier for our embeddings.
* pageNumber: The numerical page number within the document.
* text: The extracted text content from the page.
* ImagePath: The file path to the image associated with the page.
* GraphicIncluded: A boolean or flag indicating whether the page includes graphical elements that may require visual processing.
**2. Upload embeddings:**
We will use Pinecone API to in function `upsert\_vector` to “upserts” the values -
* A unique identifier
* Embeddings
* Metadata as defined above
Note: “Upsert” is a combination of the words “update” and “insert.” In database operations, an upsert is an atomic operation that updates an existing record if it exists or inserts a new record if it doesn’t. This is particularly useful when you want to ensure that your database has the most recent data without having to perform separate checks for insertion or updating.
```
`# reload the index from Pinecone
index = pc.Index(index\_name)
# Create a document ID prefix
document\_id = 'WB\_Report'
# Define the async function correctly
def upsert\_vector(identifier, embedding, metadata):
try:
index.upsert([
{
'id': identifier,
'values': embedding,
'metadata': metadata
}
])
except Exception as e:
print(f"Error upserting vector with ID {identifier}: {e}")
raise
for idx, row in tqdm(df.iterrows(), total=df.shape[0], desc='Uploading to Pinecone'):
pageNumber = row['PageNumber']
# Create meta-data tags to be added to Pinecone
metadata = {
'pageId': f"{document\_id}-{pageNumber}",
'pageNumber': pageNumber,
'text': row['PageText'],
'ImagePath': row['ImagePath'],
'GraphicIncluded': row['Visual\_Input\_Processed']
}
upsert\_vector(metadata['pageId'], row['Embeddings'], metadata)`
```
```
`Uploading to Pinecone: 100%|██████████| 49/49 [00:08\<00:00, 5.93it/s]`
```
Navigate to Indexes list on [Pinecone](https://app.pinecone.io/) and you should be able to view the vectors upserted into the database with metadata.
### Step 5: Performing Semantic Search for Relevant Pages:
In this section, we implement a semantic search to find the most relevant pages in our document that answer a user’s question. This approach uses the embeddings stored in the Pinecone vector database to retrieve pages based on the semantic similarity of their content to the user’s query. By doing so, we can effectively search textual content, and provide it as context to GPT-4o for answering user’s question.
**Step Breakdown:**
**1. Generate an Embedding for the User’s Question**
* We use OpenAI’s embedding model to generate a high-dimensional vector representation of the user’s question.
* This vector captures the semantic meaning of the question, allowing us to perform an efficient similarity search against our stored embeddings.
* The embedding is crucial for ensuring that the search query is semantically aligned with the content of the document, even if the exact words do not match.
**2. Query the Pinecone Index for Relevant Pages**
* Using the generated embedding, we query the Pinecone index to find the most relevant pages.
* Pinecone performs a similarity search by comparing the question’s embedding to the embeddings stored in the vector database using `cosine` similarity. If you recall, we set this as `metric` parameter in Step 1 when we created our Pinecone database.
* We specify the number of top matches to retrieve, typically based on a balance between coverage and relevance. For instance, retrieving the top 3-5 pages is often sufficient to provide a comprehensive answer without overwhelming the model with too much context.
**3. Compile the Metadata of Matched Pages to Provide Context**
* Once the relevant embeddings are identified, we gather their associated metadata, including the extracted text and the page number.
* This metadata is essential for structuring the context provided to GPT-4o.
* We also format the compiled information as a JSON to make it easy for the LLM to interpret.
**4. Use the GPT-4o Model to Generate an Answer**
* Finally, we pass the compiled context to the GPT-4o.
* The model uses the context to generate an informative, coherent, and contextually relevant answer to the user’s question.
* The retrieved context helps the LLM answer questions with greater accuracy, as it has access to relevant information from the document.
```
`import json
# Function to get response to a user's question
def get\_response\_to\_question(user\_question, pc\_index):
# Get embedding of the question to find the relevant page with the information
question\_embedding = get\_embedding(user\_question)
# get response vector embeddings
response = pc\_index.query(
vector=question\_embedding,
top\_k=2,
include\_values=True,
include\_metadata=True
)
# Collect the metadata from the matches
context\_metadata = [match['metadata'] for match in response['matches']]
# Convert the list of metadata dictionaries to prompt a JSON string
context\_json = json.dumps(context\_metadata, indent=3)
prompt = f"""You are a helpful assistant. Use the following context and images to answer the question. In the answer, include the reference to the document, and page number you found the information on between \<source\>\</source\> tags. If you don't find the information, you can say "I couldn't find the information"
question: {user\_question}
\<SOURCES\>
{context\_json}
\</SOURCES\>
"""
# Call completions end point with the prompt
completion = oai\_client.chat.completions.create(
model="gpt-4o",
messages=[
{"role": "system", "content": prompt}
]
)
return completion.choices[0].message.content`
```
Now, let’s pose a question that requires information from a diagram. In this case, the relevant details are found within a pie chart.
```
`question = "What percentage was allocated to social protections in Western and Central Africa?"
answer = get\_response\_to\_question(question, index)
print(answer)`
```
```
`Social protection was allocated 8% of the total lending in Western and Central Africa in fiscal 2024. \<source\>WB\_Report-13, page 13\</source\>`
```
Let’s make it more challenging by asking a question that requires interpretation of information presented in a table. In our Step 2, we extracted this information using the GPT-4o vision modality.
```
`question = "What was the increase in access to electricity between 2000 and 2012 in Western and Central Africa?"
answer = get\_response\_to\_question(question, index)
print(answer)`
```
```
`The increase in access to electricity between 2000 and 2012 in Western and Central Africa was from 34.1% to 44.1%, which is an increase of 10 percentage points.
\<source\>WB\_Report-13, page 13\</source\>`
```
This approach worked well. However, there may be cases where information is embedded within images or graphics that lose fidelity when translated to text, such as complex engineering drawings.
By using the GPT-4o Vision modality, we can pass the image of the page directly to the model as context. In the next section, we will explore how to improve the accuracy of model responses using image inputs.
### Step 6: Handling Pages with Visual Content (Optional Step):
When metadata indicates the presence of an image, graphic or a table, we can pass the image as the context to GPT-4o instead of the extracted text. This approach can be useful in cases where text description of the visual information is not sufficient to convey the context. It can be the case for complex graphics such as engineering drawings or complex diagrams.
**Step Breakdown:**
The difference between this Step and Step 5, is that we’ve added additional logic to identify when `Visual\_Input\_Processed` flag is set for an embedding. In that case, instead of passing the text as the context, we pass the image of the page using GPT-4o vision modality as the context.
Note: This approach does increase both latency and cost, as processing image inputs is more resource intensive and expensive. Therefore, it should only be used if the desired results cannot be achieved with the text-only modality as outlined in Step 5 above.
```
`import base64
import json
def get\_response\_to\_question\_with\_images(user\_question, pc\_index):
# Get embedding of the question to find the relevant page with the information
question\_embedding = get\_embedding(user\_question)
# Get response vector embeddings
response = pc\_index.query(
vector=question\_embedding,
top\_k=3,
include\_values=True,
include\_metadata=True
)
# Collect the metadata from the matches
context\_metadata = [match['metadata'] for match in response['matches']]
# Build the message content
message\_content = []
# Add the initial prompt
initial\_prompt = f"""You are a helpful assistant. Use the text and images provided by the user to answer the question. You must include the reference to the page number or title of the section you the answer where you found the information. If you don't find the information, you can say "I couldn't find the information"
question: {user\_question}
"""
message\_content.append({"role": "system", "content": initial\_prompt})
context\_messages = []
# Process each metadata item to include text or images based on 'Visual\_Input\_Processed'
for metadata in context\_metadata:
visual\_flag = metadata.get('GraphicIncluded')
page\_number = metadata.get('pageNumber')
page\_text = metadata.get('text')
message =""
if visual\_flag =='Y':
# Include the image
print(f"Adding page number {page\_number} as an image to context")
image\_path = metadata.get('ImagePath', None)
try:
base64\_image = encode\_image(image\_path)
image\_type = 'jpeg'
# Prepare the messages for the API call
context\_messages.append({
"type": "image\_url",
"image\_url": {
"url": f"data:image/{image\_type};base64,{base64\_image}"
},
})
except Exception as e:
print(f"Error encoding image at {image\_path}: {e}")
else:
# Include the text
print(f"Adding page number {page\_number} as text to context")
context\_messages.append({
"type": "text",
"text": f"Page {page\_number} - {page\_text}",
})
# Prepare the messages for the API call
messages = {
"role": "user",
"content": context\_messages
}
message\_content.append(messages)
completion = oai\_client.chat.completions.create(
model="gpt-4o",
messages=message\_content
)
return completion.choices[0].message.content`
```
Let’s examine the same questions we asked for the text only semantic search in Step 5. We notice that the GPT-4o model can identify the diagram that has relevant information to answer the question.
```
`question = "What percentage was allocated to social protections in Western and Central Africa?"
answer = get\_response\_to\_question\_with\_images(question, index)
print(answer)`
```
```
`Adding page number 13.0 as an image to context
Adding page number 12.0 as an image to context
Adding page number 11.0 as an image to context
The percentage allocated to social protection in Western and Central Africa is 8% (Figure 2: Western and Central Africa; IBRD and IDA Lending by Sector).`
```
Now let’s ask a question that possibly cannot be answered by text-only modality, such as find a relevant image in the document and describe the image.
```
`question = "Can you find the image associated with digital improvements and describe what you see in the images?"
answer = get\_response\_to\_question\_with\_images(question, index)
print(answer)`
```
```
`Adding page number 32.0 as an image to context
Adding page number 10.0 as an image to context
Adding page number 4.0 as an image to context
### Image Descriptions
1. \*\*Page 60-61 (Digital Section)\*\*:
- \*\*Left Side\*\*: A person is sitting and working on a laptop, holding a smartphone. The setting seems informal, possibly in a small office or a cafe.
- \*\*Text\*\*: Discussion on scaling digital development, thought leadership, partnerships, and establishment of a Digital Vice Presidency unit for digital transformation efforts.
2. \*\*Page 16-17 (Eastern and Southern Africa Section)\*\*:
- \*\*Right Side\*\*: A group of people standing on a paved street, some using mobile phones. It seems to be a casual, evening setting.
- \*\*Text\*\*: Information about improving access to electricity in Rwanda and efforts for education and other services in Eastern and Southern Africa.
3. \*\*Page 4-5 (Driving Action, Measuring Results)\*\*:
- \*\*Images\*\*: Various circular images and icons accompany text highlights such as feeding people, providing schooling, access to clean water, transport, and energy.
- \*\*Text\*\*: Summary of key development results achieved by the World Bank Group in fiscal 2024.
These images illustrate the initiatives and impacts of the World Bank's projects and activities in various sectors.`
```
### Conclusion
In this cookbook, we embarked on a journey to enhance Retrieval-Augmented Generation (RAG) systems for documents rich in images, graphics and tables. Traditional RAG models, while proficient with textual data, often overlook the wealth of information conveyed through visual elements. By integrating vision models and leveraging metadata tagging, we’ve bridged this gap, enabling AI to interpret and utilize visual content effectively.
We began by setting up a vector store using Pinecone, establishing a foundation for efficient storage and retrieval of vector embeddings. Parsing PDFs and extracting visual information using GPT-4o vision modality allowed us to convert document pages into relevant text. By generating embeddings and flagging pages with visual content, we created a robust metadata filtering system within our vector store.
Uploading these embeddings to Pinecone facilitated seamless integration with our RAG processing workflow. Through semantic search, we retrieved relevant pages that matched user queries, ensuring that both textual and visual information were considered. Handling pages with visual content by passing them to vision models enhanced the accuracy and depth of the responses, particularly for queries dependent on images or tables.
Using the World Bank’s **A Better Bank for a Better World: Annual Report 2024** as our guiding example, we demonstrated how these techniques come together to process and interpret complex documents. This approach not only enriches the information provided to users but also significantly enhances user satisfaction and engagement by delivering more comprehensive and accurate responses.
By following the concepts outlined in this cookbook, you are now equipped to build RAG systems capable of processing and interpreting documents with intricate visual elements. This advancement opens up new possibilities for AI applications across various domains where visual data plays a pivotal role.