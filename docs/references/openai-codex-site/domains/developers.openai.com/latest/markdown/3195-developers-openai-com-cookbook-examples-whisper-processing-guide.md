Enhancing Whisper transcriptions: pre- & post-processing techniques
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
Aug 11, 2023
# Enhancing Whisper transcriptions: pre- & post-processing techniques
[ PR ](https://github.com/prestontuggle)
[ prestontuggle ](https://github.com/prestontuggle)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/Whisper_processing_guide.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/Whisper_processing_guide.ipynb)
This notebook offers a guide to improve the Whisper’s transcriptions. We’ll streamline your audio data via trimming and segmentation, enhancing Whisper’s transcription quality. After transcriptions, we’ll refine the output by adding punctuation, adjusting product terminology (e.g., ‘five two nine’ to ‘529’), and mitigating Unicode issues. These strategies will help improve the clarity of your transcriptions, but remember, customization based on your unique use-case may be beneficial.
## Setup
To get started let’s import a few different libraries:
* [PyDub](http://pydub.com/) is a simple and easy-to-use Python library for audio processing tasks such as slicing, concatenating, and exporting audio files.
* The `Audio` class from the `IPython.display` module allows you to create an audio control that can play sound in Jupyter notebooks, providing a straightforward way to play audio data directly in your notebook.
* For our audio file, we’ll use a fictional earnings call written by ChatGPT and read aloud by the author.This audio file is relatively short, but hopefully provides you with an illustrative idea of how these pre and post processing steps can be applied to any audio file.
```
`from openai import OpenAI
import os
import urllib
from IPython.display import Audio
from pathlib import Path
from pydub import AudioSegment
import ssl`
```
```
`client = OpenAI(api\_key=os.environ.get("OPENAI\_API\_KEY", "\<your OpenAI API key if not set as env var\>"))`
```
```
`# set download paths
earnings\_call\_remote\_filepath = "https://cdn.openai.com/API/examples/data/EarningsCall.wav"
# set local save locations
earnings\_call\_filepath = "data/EarningsCall.wav"
# download example audio files and save locally
ssl.\_create\_default\_https\_context = ssl.\_create\_unverified\_context
urllib.request.urlretrieve(earnings\_call\_remote\_filepath, earnings\_call\_filepath)`
```
```
`('data/EarningsCall.wav', \<http.client.HTTPMessage at 0x11be41f50\>)`
```
At times, files with long silences at the beginning can cause Whisper to transcribe the audio incorrectly. We’ll use Pydub to detect and trim the silence.
Here, we’ve set the decibel threshold of 20. You can change this if you would like.
```
`# Function to detect leading silence
# Returns the number of milliseconds until the first sound (chunk averaging more than X decibels)
def milliseconds\_until\_sound(sound, silence\_threshold\_in\_decibels=-20.0, chunk\_size=10):
trim\_ms = 0 # ms
assert chunk\_size \> 0 # to avoid infinite loop
while sound[trim\_ms:trim\_ms+chunk\_size].dBFS \< silence\_threshold\_in\_decibels and trim\_ms \< len(sound):
trim\_ms += chunk\_size
return trim\_ms`
```
```
`def trim\_start(filepath):
path = Path(filepath)
directory = path.parent
filename = path.name
audio = AudioSegment.from\_file(filepath, format="wav")
start\_trim = milliseconds\_until\_sound(audio)
trimmed = audio[start\_trim:]
new\_filename = directory / f"trimmed\_{filename}"
trimmed.export(new\_filename, format="wav")
return trimmed, new\_filename`
```
```
`def transcribe\_audio(file,output\_dir):
audio\_path = os.path.join(output\_dir, file)
with open(audio\_path, 'rb') as audio\_data:
transcription = client.audio.transcriptions.create(
model="whisper-1", file=audio\_data)
return transcription.text`
```
At times, we’ve seen unicode character injection in transcripts, removing any non-ASCII characters should help mitigate this issue.
Keep in mind you should not use this function if you are transcribing in Greek, Cyrillic, Arabic, Chinese, etc
```
`# Define function to remove non-ascii characters
def remove\_non\_ascii(text):
return ''.join(i for i in text if ord(i)\<128)`
```
This function will add formatting and punctuation to our transcript. Whisper generates a transcript with punctuation but without formatting.
```
`# Define function to add punctuation
def punctuation\_assistant(ascii\_transcript):
system\_prompt = """You are a helpful assistant that adds punctuation to text.
Preserve the original words and only insert necessary punctuation such as periods,
commas, capialization, symbols like dollar sings or percentage signs, and formatting.
Use only the context provided. If there is no context provided say, 'No context provided'\\n"""
response = client.chat.completions.create(
model="gpt-3.5-turbo",
temperature=0,
messages=[
{
"role": "system",
"content": system\_prompt
},
{
"role": "user",
"content": ascii\_transcript
}
]
)
return response`
```
Our audio file is a recording from a fake earnings call that includes a lot of financial products. This function can help ensure that if Whisper transcribes these financial product names incorrectly, that they can be corrected.
```
`# Define function to fix product mispellings
def product\_assistant(ascii\_transcript):
system\_prompt = """You are an intelligent assistant specializing in financial products;
your task is to process transcripts of earnings calls, ensuring that all references to
financial products and common financial terms are in the correct format. For each
financial product or common term that is typically abbreviated as an acronym, the full term
should be spelled out followed by the acronym in parentheses. For example, '401k' should be
transformed to '401(k) retirement savings plan', 'HSA' should be transformed to 'Health Savings Account (HSA)'
, 'ROA' should be transformed to 'Return on Assets (ROA)', 'VaR' should be transformed to 'Value at Risk (VaR)'
, and 'PB' should be transformed to 'Price to Book (PB) ratio'. Similarly, transform spoken numbers representing
financial products into their numeric representations, followed by the full name of the product in parentheses.
For instance, 'five two nine' to '529 (Education Savings Plan)' and 'four zero one k' to '401(k) (Retirement Savings Plan)'.
However, be aware that some acronyms can have different meanings based on the context (e.g., 'LTV' can stand for
'Loan to Value' or 'Lifetime Value'). You will need to discern from the context which term is being referred to
and apply the appropriate transformation. In cases where numerical figures or metrics are spelled out but do not
represent specific financial products (like 'twenty three percent'), these should be left as is. Your role is to
analyze and adjust financial product terminology in the text. Once you've done that, produce the adjusted
transcript and a list of the words you've changed"""
response = client.chat.completions.create(
model="gpt-4",
temperature=0,
messages=[
{
"role": "system",
"content": system\_prompt
},
{
"role": "user",
"content": ascii\_transcript
}
]
)
return response`
```
This function will create a new file with ‘trimmed’ appended to the original file name
```
`# Trim the start of the original audio file
trimmed\_audio = trim\_start(earnings\_call\_filepath)`
```
```
`trimmed\_audio, trimmed\_filename = trim\_start(earnings\_call\_filepath)`
```
Our fake earnings report audio file is fairly short in length, so we’ll adjust the segments accordingly. Keep in mind you can adjust the segment length as you need.
```
`# Segment audio
trimmed\_audio = AudioSegment.from\_wav(trimmed\_filename) # Load the trimmed audio file
one\_minute = 1 \* 60 \* 1000 # Duration for each segment (in milliseconds)
start\_time = 0 # Start time for the first segment
i = 0 # Index for naming the segmented files
output\_dir\_trimmed = "trimmed\_earnings\_directory" # Output directory for the segmented files
if not os.path.isdir(output\_dir\_trimmed): # Create the output directory if it does not exist
os.makedirs(output\_dir\_trimmed)
while start\_time \< len(trimmed\_audio): # Loop over the trimmed audio file
segment = trimmed\_audio[start\_time:start\_time + one\_minute] # Extract a segment
segment.export(os.path.join(output\_dir\_trimmed, f"trimmed\_{i:02d}.wav"), format="wav") # Save the segment
start\_time += one\_minute # Update the start time for the next segment
i += 1 # Increment the index for naming the next file`
```
```
`# Get list of trimmed and segmented audio files and sort them numerically
audio\_files = sorted(
(f for f in os.listdir(output\_dir\_trimmed) if f.endswith(".wav")),
key=lambda f: int(''.join(filter(str.isdigit, f)))
)`
```
```
`# Use a loop to apply the transcribe function to all audio files
transcriptions = [transcribe\_audio(file, output\_dir\_trimmed) for file in audio\_files]`
```
```
`# Concatenate the transcriptions
full\_transcript = ' '.join(transcriptions)`
```
```
`print(full\_transcript)`
```
```
`Good afternoon, everyone. And welcome to FinTech Plus Sync's second quarter 2023 earnings call. I'm John Doe, CEO of FinTech Plus. We've had a stellar Q2 with a revenue of 125 million, a 25% increase year over year. Our gross profit margin stands at a solid 58%, due in part to cost efficiencies gained from our scalable business model. Our EBITDA has surged to 37.5 million, translating to a remarkable 30% EBITDA margin. Our net income for the quarter rose to 16 million, which is a noteworthy increase from 10 million in Q2 2022. Our total addressable market has grown substantially thanks to the expansion of our high yield savings product line and the new RoboAdvisor platform. We've been diversifying our asset-backed securities portfolio, investing heavily in collateralized. debt obligations, and residential mortgage-backed securities. We've also invested $25 million in AAA rated corporate bonds, enhancing our risk adjusted returns. As for our balance sheet, total assets reached $1.5 billion with total liabilities at $900 million, leaving us with a solid equity base of $600 million. Our debt-to-equity ratio stands at 1.5, a healthy figure considering our expansionary phase. We continue to see substantial organic user growth, with customer acquisition cost dropping by 15% and lifetime value growing by 25%. Our LTVCAC ratio is at an impressive 3.5%. In terms of risk management, we have a value-at-risk model in place with a 99%... confidence level indicating that our maximum loss will not exceed 5 million in the next trading day. We've adopted a conservative approach to managing our leverage and have a healthy tier one capital ratio of 12.5%. Our forecast for the coming quarter is positive. We expect revenue to be around 135 million and 8% quarter over quarter growth driven primarily by our cutting edge blockchain solutions and AI driven predictive analytics. We're also excited about the upcoming IPO of our FinTech subsidiary Pay Plus, which we expect to raise 200 million, significantly bolstering our liquidity and paving the way for aggressive growth strategies. We thank our shareholders for their continued faith in us and we look forward to an even more successful Q3. Thank you so much.`
```
```
`# Remove non-ascii characters from the transcript
ascii\_transcript = remove\_non\_ascii(full\_transcript)`
```
```
`print(ascii\_transcript)`
```
```
`Good afternoon, everyone. And welcome to FinTech Plus Sync's second quarter 2023 earnings call. I'm John Doe, CEO of FinTech Plus. We've had a stellar Q2 with a revenue of 125 million, a 25% increase year over year. Our gross profit margin stands at a solid 58%, due in part to cost efficiencies gained from our scalable business model. Our EBITDA has surged to 37.5 million, translating to a remarkable 30% EBITDA margin. Our net income for the quarter rose to 16 million, which is a noteworthy increase from 10 million in Q2 2022. Our total addressable market has grown substantially thanks to the expansion of our high yield savings product line and the new RoboAdvisor platform. We've been diversifying our asset-backed securities portfolio, investing heavily in collateralized. debt obligations, and residential mortgage-backed securities. We've also invested $25 million in AAA rated corporate bonds, enhancing our risk adjusted returns. As for our balance sheet, total assets reached $1.5 billion with total liabilities at $900 million, leaving us with a solid equity base of $600 million. Our debt-to-equity ratio stands at 1.5, a healthy figure considering our expansionary phase. We continue to see substantial organic user growth, with customer acquisition cost dropping by 15% and lifetime value growing by 25%. Our LTVCAC ratio is at an impressive 3.5%. In terms of risk management, we have a value-at-risk model in place with a 99%... confidence level indicating that our maximum loss will not exceed 5 million in the next trading day. We've adopted a conservative approach to managing our leverage and have a healthy tier one capital ratio of 12.5%. Our forecast for the coming quarter is positive. We expect revenue to be around 135 million and 8% quarter over quarter growth driven primarily by our cutting edge blockchain solutions and AI driven predictive analytics. We're also excited about the upcoming IPO of our FinTech subsidiary Pay Plus, which we expect to raise 200 million, significantly bolstering our liquidity and paving the way for aggressive growth strategies. We thank our shareholders for their continued faith in us and we look forward to an even more successful Q3. Thank you so much.`
```
```
`# Use punctuation assistant function
response = punctuation\_assistant(ascii\_transcript)`
```
```
`# Extract the punctuated transcript from the model's response
punctuated\_transcript = response.choices[0].message.content`
```
```
`print(punctuated\_transcript)`
```
```
`Good afternoon, everyone. And welcome to FinTech Plus Sync's second quarter 2023 earnings call. I'm John Doe, CEO of FinTech Plus. We've had a stellar Q2 with a revenue of $125 million, a 25% increase year over year. Our gross profit margin stands at a solid 58%, due in part to cost efficiencies gained from our scalable business model. Our EBITDA has surged to $37.5 million, translating to a remarkable 30% EBITDA margin. Our net income for the quarter rose to $16 million, which is a noteworthy increase from $10 million in Q2 2022. Our total addressable market has grown substantially thanks to the expansion of our high yield savings product line and the new RoboAdvisor platform. We've been diversifying our asset-backed securities portfolio, investing heavily in collateralized debt obligations, and residential mortgage-backed securities. We've also invested $25 million in AAA rated corporate bonds, enhancing our risk-adjusted returns. As for our balance sheet, total assets reached $1.5 billion with total liabilities at $900 million, leaving us with a solid equity base of $600 million. Our debt-to-equity ratio stands at 1.5, a healthy figure considering our expansionary phase. We continue to see substantial organic user growth, with customer acquisition cost dropping by 15% and lifetime value growing by 25%. Our LTVCAC ratio is at an impressive 3.5%. In terms of risk management, we have a value-at-risk model in place with a 99% confidence level indicating that our maximum loss will not exceed $5 million in the next trading day. We've adopted a conservative approach to managing our leverage and have a healthy tier one capital ratio of 12.5%. Our forecast for the coming quarter is positive. We expect revenue to be around $135 million and 8% quarter over quarter growth driven primarily by our cutting-edge blockchain solutions and AI-driven predictive analytics. We're also excited about the upcoming IPO of our FinTech subsidiary Pay Plus, which we expect to raise $200 million, significantly bolstering our liquidity and paving the way for aggressive growth strategies. We thank our shareholders for their continued faith in us and we look forward to an even more successful Q3. Thank you so much.`
```
```
`# Use product assistant function
response = product\_assistant(punctuated\_transcript)`
```
```
`# Extract the final transcript from the model's response
final\_transcript = response.choices[0].message.content`
```
```
`print(final\_transcript)`
```
```
`Good afternoon, everyone. And welcome to FinTech Plus Sync's second quarter 2023 earnings call. I'm John Doe, CEO of FinTech Plus. We've had a stellar second quarter (Q2) with a revenue of $125 million, a 25% increase year over year. Our gross profit margin stands at a solid 58%, due in part to cost efficiencies gained from our scalable business model. Our Earnings Before Interest, Taxes, Depreciation, and Amortization (EBITDA) has surged to $37.5 million, translating to a remarkable 30% EBITDA margin. Our net income for the quarter rose to $16 million, which is a noteworthy increase from $10 million in second quarter (Q2) 2022. Our total addressable market has grown substantially thanks to the expansion of our high yield savings product line and the new RoboAdvisor platform. We've been diversifying our asset-backed securities portfolio, investing heavily in Collateralized Debt Obligations (CDOs), and Residential Mortgage-Backed Securities (RMBS). We've also invested $25 million in AAA rated corporate bonds, enhancing our risk-adjusted returns. As for our balance sheet, total assets reached $1.5 billion with total liabilities at $900 million, leaving us with a solid equity base of $600 million. Our Debt-to-Equity (D/E) ratio stands at 1.5, a healthy figure considering our expansionary phase. We continue to see substantial organic user growth, with Customer Acquisition Cost (CAC) dropping by 15% and Lifetime Value (LTV) growing by 25%. Our LTV to CAC (LTVCAC) ratio is at an impressive 3.5%. In terms of risk management, we have a Value at Risk (VaR) model in place with a 99% confidence level indicating that our maximum loss will not exceed $5 million in the next trading day. We've adopted a conservative approach to managing our leverage and have a healthy Tier 1 Capital ratio of 12.5%. Our forecast for the coming quarter is positive. We expect revenue to be around $135 million and 8% quarter over quarter growth driven primarily by our cutting-edge blockchain solutions and AI-driven predictive analytics. We're also excited about the upcoming Initial Public Offering (IPO) of our FinTech subsidiary Pay Plus, which we expect to raise $200 million, significantly bolstering our liquidity and paving the way for aggressive growth strategies. We thank our shareholders for their continued faith in us and we look forward to an even more successful third quarter (Q3). Thank you so much.
Words Changed:
1. Q2 -\> second quarter (Q2)
2. EBITDA -\> Earnings Before Interest, Taxes, Depreciation, and Amortization (EBITDA)
3. Q2 2022 -\> second quarter (Q2) 2022
4. CDOs -\> Collateralized Debt Obligations (CDOs)
5. RMBS -\> Residential Mortgage-Backed Securities (RMBS)
6. D/E -\> Debt-to-Equity (D/E)
7. CAC -\> Customer Acquisition Cost (CAC)
8. LTV -\> Lifetime Value (LTV)
9. LTVCAC -\> LTV to CAC (LTVCAC)
10. VaR -\> Value at Risk (VaR)
11. IPO -\> Initial Public Offering (IPO)
12. Q3 -\> third quarter (Q3)`
```