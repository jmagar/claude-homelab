Using reasoning for data validation
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
Sep 12, 2024
# Using reasoning for data validation
[ RZ ](https://www.linkedin.com/in/roy-ziv-a46001149/)
[ Roy Ziv
(OpenAI)
](https://www.linkedin.com/in/roy-ziv-a46001149/)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/o1/Using_reasoning_for_data_validation.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/o1/Using_reasoning_for_data_validation.ipynb)
In this guide, we’ll explore how to use the o1 model, specifically o1-preview, to perform data validation through reasoning. We’ll walk through a practical example involving a synthetic medical dataset and demonstrate how to assess the model’s accuracy in identifying issues within the data.
## Overview
Data validation is a critical step in ensuring the quality and reliability of datasets, especially in sensitive fields like healthcare. Traditional validation methods often rely on predefined rules and patterns. However, advanced models like o1 can understand context and reason about data, offering a more flexible and intelligent approach to validation.
In this tutorial, we will:
* Generate a synthetic dataset of medical data that contains inconsistencies.
* Define a function that takes in a row of data and validates its accuracy
* Run the validation process and compute accuracy metrics.
* Analyze and interpret the results.
```
`from openai import OpenAI
import json
from IPython.display import display, HTML
from sklearn.metrics import precision\_score, recall\_score, f1\_score
from concurrent.futures import ThreadPoolExecutor, as\_completed
import csv
import pandas as pd
client = OpenAI()
MODEL = 'o1-preview'`
```
## Synthetic Data Generation
We will use a lot of the principles described in the [Synthetic Data Generation](https://cookbook.openai.com/examples/sdg1) cookbook to create the foundation of our dataset.
We will prompt the model to generate sets of medical data for our use case. We have provided detailed instructions to the model on how to create the dataset, what format to follow, and how to fill it with inaccuracies. We also provide a few rows of sample data to get the model started.
Each row in the dataset will have the following fields:
* Patient ID: A randomly generated patient id
* Date of Birth: Date of birth of the patient
* Gender: M/F
* Medical History: Past diagnoses
* Current Medications: Medication the patient is taking
* Allergies: Identified allergies
* Lab Results (Glucose mg/dL)
* Diagnoses: Current diagnosis
* Treatment Plan: Current treatment plan
* Is Valid: Whether or not the current row of data is valid (True/False)
* Issue: If the row of data is not valid, what the issue is
Some examples of inaccuracies that may be present in the data are:
* Prescribing medications that the patient is allergic to
* Current medications do not match medical history
* Treatment plan does not match diagnosis
```
`def generate\_data():
messages = [
{
"role": "user",
"content": """
You are a helpful assistant designed to generate data. You will be given a format for the data to generate and some examples of the data.
When generating Patient IDs, use the format 'P' followed by a three-digit number (e.g., P006, P941, P319).
Intentionally make some mistakes in the data generation and document them in the appropriate columns ('Is Valid' and 'Issue') if the row of data is invalid.
The types of mistakes to include are:
- \*\*Allergy Contradictions\*\*: Prescribing a medication that the patient is allergic to (e.g., prescribing Penicillin to a patient allergic to Penicillin).
- \*\*Medical History and Medication Mismatch\*\*: A patient with a medical condition not receiving appropriate medication (e.g., a diabetic patient not prescribed any diabetes medication).
- \*\*Lab Results and Diagnosis Mismatch\*\*: Lab results that do not support the diagnosis (e.g., normal glucose levels but diagnosed with Diabetes Type 2).
- \*\*Other Plausible Mistakes\*\*: Any other realistic errors that could occur in medical records, such as incorrect gender entries, impossible dates of birth, or inconsistent treatment plans.
Ensure that when 'Is Valid' is 'False', the 'Issue' column clearly explains the problem.
Return 100 rows of data for the user. Your response should strictly be in the format of a valid CSV.
Generate Synthetic Medical Records Dataset with the following columns:
- Patient ID: A randomly generated patient id
- Date of Birth: Date of birth of the patient
- Gender: M/F
- Medical History: Past diagnoses
- Current Medications: Medication the patient is taking
- Allergies: Identified allergies
- Lab Results (Glucose mg/dL)
- Diagnoses: Current diagnosis
- Treatment Plan: Current treatment plan
- Is Valid: Whether or not the current row of data is valid (True/False)
- Issue: If the row of data is not valid, what the issue is
Patient ID,Date of Birth,Gender,Medical History,Current Medications,Allergies,Lab Results (Glucose mg/dL),Diagnoses,Treatment Plan,Is Valid,Issue
P001,1980-05-14,M,Hypertension,Lisinopril,None,110,Hypertension,Continue Lisinopril,True,
P002,1975-11-30,F,Diabetes Type 2,Metformin,Penicillin,90,Diabetes Type 2,Continue Metformin,True,
P003,1990-07-22,F,Asthma,Albuterol,Aspirin,85,Asthma,Prescribe Albuterol,True,
P004,2000-03-10,M,None,Amoxicillin,Penicillin,95,Infection,Prescribe Amoxicillin,False,Prescribed Amoxicillin despite Penicillin allergy
P005,1985-09-18,F,Hyperlipidemia,Atorvastatin,None,200,Hyperlipidemia,Continue Atorvastatin,True,
P006,1978-12-05,M,Hypertension; Diabetes Type 2,Lisinopril; Insulin,None,55,Diabetes Type 2,Adjust insulin dosage,False,Low glucose level not properly addressed
"""
}
]
response = client.chat.completions.create(
model=MODEL,
messages=messages
)
return response.choices[0].message.content.replace('```csv', '').replace('```', '')`
```
```
`# Generate data three times using the existing dataGeneration function
generated\_data = []
data = generate\_data()
generated\_data.extend(data.strip().split('\\n'))
# Append the generated data to the medicalData.csv file
with open('../data/medicalData.csv', 'a', newline='') as csvfile:
csvwriter = csv.writer(csvfile)
for row in generated\_data:
csvwriter.writerow(row.split(','))
print("Synthetic data generation and appending completed.")`
```
```
`Synthetic data generation and appending completed.`
```
## Data Validation
Now that we have our dataset prepared, we will prompt the reasoning model to review each row of data and determine whether or not it contains an issue. We will ask the model to output whether or not there is an issue in the data and then offer an explanation of the issue.
Once we have the model determine its list of invalid data, we will pass those results on to a model grader to assess two metrics:
* Accuracy of the model’s ability correctly identify issues with the data
* For the subset of data that issues have been correctly identified, what is the accuracy of the model in identifying the issue at hand
Given that this task is much more narrow, we can use the faster gpt-4o model to calculate the accuracy.
REMINDER: Given that these models are still in beta, rate limits will be significantly reduced. Please adjust the number of concurrent workers accordingly.
```
`def validate\_data(input\_data):
messages = [
{
"role": "user",
"content": f"""
You are a helpful assistant designed to validate the quality of medical datasets. You will be given a single row of medical data, and your task is to determine whether the data is valid.
- Carefully analyze the data for any inconsistencies, contradictions, missing values, or implausible information.
- Consider the logical relationships between different fields (e.g., treatments should be appropriate for the diagnoses, medications should not conflict with allergies, lab results should be consistent with diagnoses, etc.).
- Use your general medical knowledge to assess the validity of the data.
- Focus solely on the information provided without making assumptions beyond the given data.
\*\*Return only a JSON object\*\* with the following two properties:
- `"is\_valid"`: a boolean (`true` or `false`) indicating whether the data is valid.
- `"issue"`: if `"is\_valid"` is `false`, provide a brief explanation of the issue; if `"is\_valid"` is `true`, set `"issue"` to `null`.
Both JSON properties must always be present.
Do not include any additional text or explanations outside the JSON object.
MEDICAL DATA:
{input\_data}
"""
}
]
response = client.chat.completions.create(
model=MODEL,
messages=messages
)
response\_content = response.choices[0].message.content.replace('```json', '').replace('```', '').strip()
try:
if isinstance(response\_content, dict):
response\_dict = response\_content
else:
response\_dict = json.loads(response\_content)
return response\_dict
except json.JSONDecodeError as e:
print(f"Failed to decode JSON response: {response\_content}")
raise e`
```
```
`# Read the CSV file and exclude the last two columns
input\_data = []
with open('../data/medicalData.csv', 'r') as file:
reader = csv.reader(file)
headers = next(reader)
for row in reader:
input\_data.append(row[:-2]) # Exclude "Is Valid" and "Issue" columns
# Initialize lists to store true labels
true\_is\_valid = []
true\_issues = []
# Extract true labels from the CSV file
with open('../data/medicalData.csv', 'r') as file:
reader = csv.reader(file)
headers = next(reader)
for row in reader:
true\_is\_valid.append(row[-2] == 'True')
true\_issues.append(row[-1])
# Function to validate a single row of data
def validate\_row(row):
input\_str = ','.join(row)
result\_json = validate\_data(input\_str)
return result\_json
# Validate data rows and collect results
pred\_is\_valid = [False] \* len(input\_data)
pred\_issues = [''] \* len(input\_data)
with ThreadPoolExecutor() as executor:
futures = {executor.submit(validate\_row, row): i for i, row in enumerate(input\_data)}
for future in as\_completed(futures):
i = futures[future] # Get the index of the current row
result\_json = future.result()
pred\_is\_valid[i] = result\_json['is\_valid']
pred\_issues[i] = result\_json['issue']`
```
Now that we have the model’s results, we can compare it against the source of truth and determine the system’s accuracy
```
`# Convert predicted and true 'is\_valid' labels to boolean if they aren't already
pred\_is\_valid\_bool = [bool(val) if isinstance(val, bool) else val == 'True' for val in pred\_is\_valid]
true\_is\_valid\_bool = [bool(val) if isinstance(val, bool) else val == 'True' for val in true\_is\_valid]
# Calculate precision, recall, and f1 score for the 'is\_valid' prediction
precision = precision\_score(true\_is\_valid\_bool, pred\_is\_valid\_bool, pos\_label=True)
recall = recall\_score(true\_is\_valid\_bool, pred\_is\_valid\_bool, pos\_label=True)
f1 = f1\_score(true\_is\_valid\_bool, pred\_is\_valid\_bool, pos\_label=True)
# Initialize issue\_matches\_full with False
issue\_matches\_full = [False] \* len(true\_is\_valid)`
```
```
`print(f"Precision: {precision:.2f}")
print(f"Recall: {recall:.2f}")
print(f"F1: {f1:.2f}")`
```
```
`Precision: 0.82
Recall: 0.87
F1: 0.84`
```
## Issue Identification
We will now determine the model’s ability to accurately classify the issue in the data
```
`def validate\_issue(model\_generated\_answer, correct\_answer):
messages = [
{
"role": "user",
"content": f"""
You are a medical expert assistant designed to validate the quality of an LLM-generated answer.
The model was asked to review a medical dataset row to determine if the data is valid. If the data is not valid, it should provide a justification explaining why.
Your task:
• Compare the model-generated justification with the correct reason provided.
• Determine if they address the same underlying medical issue or concern, even if phrased differently.
• Focus on the intent, medical concepts, and implications rather than exact wording.
Instructions:
• If the justifications have the same intent or address the same medical issue, return True.
• If they address different issues or concerns, return False.
• Only respond with a single word: True or False.
Examples:
1. Example 1:
• Model Generated Response: “The patient is allergic to penicillin”
• Correct Response: “The patient was prescribed penicillin despite being allergic”
• Answer: True
2. Example 2:
• Model Generated Response: “The date of birth of the patient is incorrect”
• Correct Response: “The patient was prescribed penicillin despite being allergic”
• Answer: False
Model Generated Response: {model\_generated\_answer}
Correct Response: {correct\_answer}
"""
}
]
response = client.chat.completions.create(
model="o1-preview",
messages=messages
)
result = response.choices[0].message.content
return result`
```
```
`# Validate issues for rows where both true and predicted 'is\_valid' are False
validation\_results = []
with ThreadPoolExecutor() as executor:
futures = {
executor.submit(validate\_issue, pred\_issues[i], true\_issues[i]): i
for i in range(len(pred\_is\_valid\_bool))
if not pred\_is\_valid\_bool[i] and not true\_is\_valid\_bool[i]
}
for future in as\_completed(futures):
i = futures[future] # Get the original index
issue\_match = future.result()
issue\_matches\_full[i] = (issue\_match == 'True')
validation\_results.append({
"index": i,
"predicted\_issue": pred\_issues[i],
"true\_issue": true\_issues[i],
"issue\_match": issue\_matches\_full[i]
})
# Calculate issue accuracy
issue\_accuracy = sum([i['issue\_match'] for i in validation\_results]) / len(validation\_results)
# Store the results in the dictionary
model\_results = {
"precision": precision,
"recall": recall,
"f1": f1,
"issue\_accuracy": issue\_accuracy
}
# Create a DataFrame to store the results
df\_results = pd.DataFrame([model\_results])
# Create a DataFrame to store the validation results for each row
df\_validation\_results = pd.DataFrame(validation\_results)`
```
Below we’ll display the subset of rows that we correctly identified contained an issue. For each row, we’ll show the predicted vs. true issue and whether or not there is a match
```
`def display\_formatted\_dataframe(df):
def format\_text(text):
return text.replace('\\n', '\<br\>')
df\_formatted = df.copy()
df\_formatted['predicted\_issue'] = df\_formatted['predicted\_issue'].apply(format\_text)
df\_formatted['true\_issue'] = df\_formatted['true\_issue'].apply(format\_text)
display(HTML(df\_formatted.to\_html(escape=False, justify='left')))
display\_formatted\_dataframe(pd.DataFrame(validation\_results))`
```
||index|predicted\_issue|true\_issue|issue\_match|
|0|39|Amoxicillin is prescribed to a patient with Penicillin allergy.|Prescribed Amoxicillin despite Penicillin allergy|True|
|1|50|Patient diagnosed with Type 1 Diabetes is not on any medications and the treatment field lists the diagnosis instead of appropriate treatment.|Diabetes Type 1 patient not receiving insulin|True|
|2|51|Lab result of 300 indicates hyperglycemia but no diagnosis or treatment is recorded.|Extremely high glucose level not diagnosed or treated|True|
|3|26|The patient is being prescribed penicillin despite having an allergy to penicillin.|Prescribed Penicillin despite Penicillin allergy|True|
|4|31|The patient's age (88) is inconsistent with the date of birth (1996-11-05).|Osteoporosis patient not receiving treatment|False|
|5|24|The 'Treatment Plan' field should not be 'Depression'; it should specify the treatment prescribed for depression.|Depression patient not receiving treatment|True|
|6|3|Patient is allergic to Penicillin but is prescribed Amoxicillin.|Prescribed Amoxicillin despite Penicillin allergy|True|
|7|28|The treatment field contains 'Asthma', which is a diagnosis, not a treatment.|Asthma patient not prescribed any medication|False|
|8|7|Patient with asthma and low lab result (100) is treated only with lifestyle modifications without medications, which is inappropriate.|Asthma patient not prescribed any medication|True|
|9|16|The patient's age (86) does not match the date of birth (1955-10-10).|COPD patient not receiving treatment|False|
|10|53|The age provided (92) is inconsistent with the date of birth (1983-08-19).|Depression patient not receiving treatment|False|
|11|23|Treatment field incorrectly lists 'Hyperlipidemia' instead of an appropriate treatment for the diagnosis.|Hyperlipidemia patient not prescribed any medication|True|
|12|13|Patient is allergic to sulfa drugs but is prescribed Sulfamethoxazole, which is a sulfa drug.|Prescribed Sulfa drug despite Sulfa allergy|True|
|13|98|The patient is prescribed Penicillin despite having a Penicillin allergy.|Prescribed Penicillin despite Penicillin allergy|True|
|14|9|Patient has a medication allergy to Penicillin but is prescribed Penicillin.|Prescribed Penicillin despite Penicillin allergy|True|
|15|85|Treatment field contains 'Hyperlipidemia', which is a diagnosis, not a treatment.|Hyperlipidemia patient not prescribed any medication|False|
|16|18|Prescribed treatment (Aspirin) is not appropriate for the diagnosis of infection.|Prescribed Aspirin despite Aspirin allergy; high glucose level not addressed|False|
|17|70|Treatment field contains a diagnosis 'Osteoporosis' instead of a treatment.|Osteoporosis patient not receiving treatment|True|
|18|57|Patient is allergic to Penicillin but is being prescribed Amoxicillin, which is contraindicated.|Prescribed Amoxicillin despite Penicillin allergy|True|
|19|80|Treatment field incorrectly lists 'Diabetes Type 2' instead of a valid treatment plan.|Diabetes Type 2 patient not receiving medication|True|
|20|87|Treatment plan includes prescribing Amoxicillin, which the patient is allergic to.|Prescribed Amoxicillin despite Penicillin allergy|True|
|21|37|Treatment field contains 'Hyperlipidemia', which is a diagnosis, not a treatment.|Hyperlipidemia patient not prescribed any medication|False|
|22|95|Treatment is listed as 'Asthma', which is not an appropriate treatment for the diagnosis.|Asthma patient not prescribed any medication|True|
|23|96|Treatment field lists 'Hyperlipidemia', which is not an appropriate treatment.|Hyperlipidemia patient not prescribed any medication|False|
|24|59|Treatment field contains 'Anemia', which is not a valid treatment.|Anemia patient not receiving treatment|False|
|25|5|Age does not match date of birth|Low glucose level not properly addressed|False|
```
`# Display the DataFrame
print(df\_results)`
```
```
` precision recall f1 issue\_accuracy
0 0.818182 0.870968 0.84375 0.615385`
```
## Conclusion
We can see from the results here that we’re able to generate a high precision/recall for issue identification as well as decent accuracy for pinpointing the exact issue in the data.
This should help streamline data validation for eval sets across a variety of domains.