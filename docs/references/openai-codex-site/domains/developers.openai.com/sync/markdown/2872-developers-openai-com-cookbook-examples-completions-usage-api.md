How to use the Usage API and Cost API to monitor your OpenAI usage
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
Jan 14, 2025
# How to use the Usage API and Cost API to monitor your OpenAI usage
[ MW ](https://www.linkedin.com/in/mitchwelzen/)[ TL ](https://www.linkedin.com/in/thli/)
[ Mitch Welzen
(OpenAI)
, ](https://www.linkedin.com/in/mitchwelzen/)[ Thomas Li ](https://www.linkedin.com/in/thli/)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/completions_usage_api.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/completions_usage_api.ipynb)
For most of our users, the [default usage and cost dashboards](https://platform.openai.com/usage) are sufficient. However, if you need more detailed data or a custom dashboard, you can use the Completions Usage API.
This notebook demonstrates how to retrieve and visualize usage data from the OpenAI Completions Usage API and Costs API. We’ll:
* Call the API to get completions usage data.
* Parse the JSON response into a pandas DataFrame.
* Visualize token usage over time using matplotlib.
* Use grouping by model to analyze token usage across different models.
* Display model distribution with a pie chart.
We also include placeholders for all possible API parameters for a comprehensive overview.
```
`# Install required libraries (if not already installed)
!pip install requests pandas numpy matplotlib --quiet
# Import libraries
import requests
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.patches as mpatches
import time
import json
# For inline plotting in Jupyter
%matplotlib inline`
```
## Setup API Credentials and Parameters
Set up an Admin Key - [https://platform.openai.com/settings/organization/admin-keys](https://platform.openai.com/settings/organization/admin-keys)
Replace `'PLACEHOLDER'` with your actual ADMIN API key. It’s best practice to load the key from an environment variable for security.
```
`# Reusable function for retrieving paginated data from the API
def get\_data(url, params):
# Set up the API key and headers
OPENAI\_ADMIN\_KEY = 'PLACEHOLDER'
headers = {
"Authorization": f"Bearer {OPENAI\_ADMIN\_KEY}",
"Content-Type": "application/json",
}
# Initialize an empty list to store all data
all\_data = []
# Initialize pagination cursor
page\_cursor = None
# Loop to handle pagination
while True:
if page\_cursor:
params["page"] = page\_cursor
response = requests.get(url, headers=headers, params=params)
if response.status\_code == 200:
data\_json = response.json()
all\_data.extend(data\_json.get("data", []))
page\_cursor = data\_json.get("next\_page")
if not page\_cursor:
break
else:
print(f"Error: {response.status\_code}")
break
if all\_data:
print("Data retrieved successfully!")
else:
print("Issue: No data available to retrieve.")
return all\_data`
```
```
`# Define the API endpoint
url = "https://api.openai.com/v1/organization/usage/completions"
# Calculate start time: n days ago from now
days\_ago = 30
start\_time = int(time.time()) - (days\_ago \* 24 \* 60 \* 60)
# Define parameters with placeholders for all possible options
params = {
"start\_time": start\_time, # Required: Start time (Unix seconds)
# "end\_time": end\_time, # Optional: End time (Unix seconds)
"bucket\_width": "1d", # Optional: '1m', '1h', or '1d' (default '1d')
# "project\_ids": ["proj\_example"], # Optional: List of project IDs
# "user\_ids": ["user\_example"], # Optional: List of user IDs
# "api\_key\_ids": ["key\_example"], # Optional: List of API key IDs
# "models": ["o1-2024-12-17", "gpt-4o-2024-08-06", "gpt-4o-mini-2024-07-18"], # Optional: List of models
# "batch": False, # Optional: True for batch jobs, False for non-batch
# "group\_by": ["model"], # Optional: Fields to group by
"limit": 7, # Optional: Number of buckets to return, this will chunk the data into 7 buckets
# "page": "cursor\_string" # Optional: Cursor for pagination
}
usage\_data = get\_data(url, params)`
```
```
`Data retrieved successfully!`
```
## Inspect the JSON Response
Let’s take a look at the raw JSON response from the API to understand its structure.
```
`print(json.dumps(usage\_data, indent=2))`
```
```
`[
{
"object": "bucket",
"start\_time": 1736616660,
"end\_time": 1736640000,
"results": [
{
"object": "organization.usage.completions.result",
"input\_tokens": 141201,
"output\_tokens": 9756,
"num\_model\_requests": 470,
"project\_id": null,
"user\_id": null,
"api\_key\_id": null,
"model": null,
"batch": null,
"input\_cached\_tokens": 0,
"input\_audio\_tokens": 0,
"output\_audio\_tokens": 0
}
]
},
{
"object": "bucket",
"start\_time": 1736640000,
"end\_time": 1736726400,
"results": [
{
"object": "organization.usage.completions.result",
"input\_tokens": 45949,
"output\_tokens": 282,
"num\_model\_requests": 150,
"project\_id": null,
"user\_id": null,
"api\_key\_id": null,
"model": null,
"batch": null,
"input\_cached\_tokens": 0,
"input\_audio\_tokens": 0,
"output\_audio\_tokens": 0
}
]
},
{
"object": "bucket",
"start\_time": 1736726400,
"end\_time": 1736812800,
"results": [
{
"object": "organization.usage.completions.result",
"input\_tokens": 3718360,
"output\_tokens": 97756,
"num\_model\_requests": 3053,
"project\_id": null,
"user\_id": null,
"api\_key\_id": null,
"model": null,
"batch": null,
"input\_cached\_tokens": 76544,
"input\_audio\_tokens": 5776,
"output\_audio\_tokens": 3166
}
]
},
{
"object": "bucket",
"start\_time": 1736812800,
"end\_time": 1736899200,
"results": [
{
"object": "organization.usage.completions.result",
"input\_tokens": 52786,
"output\_tokens": 38204,
"num\_model\_requests": 157,
"project\_id": null,
"user\_id": null,
"api\_key\_id": null,
"model": null,
"batch": null,
"input\_cached\_tokens": 5440,
"input\_audio\_tokens": 4066,
"output\_audio\_tokens": 1097
}
]
},
{
"object": "bucket",
"start\_time": 1736899200,
"end\_time": 1736985600,
"results": [
{
"object": "organization.usage.completions.result",
"input\_tokens": 35664,
"output\_tokens": 1835,
"num\_model\_requests": 55,
"project\_id": null,
"user\_id": null,
"api\_key\_id": null,
"model": null,
"batch": null,
"input\_cached\_tokens": 192,
"input\_audio\_tokens": 2520,
"output\_audio\_tokens": 1549
}
]
},
{
"object": "bucket",
"start\_time": 1736985600,
"end\_time": 1737072000,
"results": [
{
"object": "organization.usage.completions.result",
"input\_tokens": 5464,
"output\_tokens": 2667,
"num\_model\_requests": 8,
"project\_id": null,
"user\_id": null,
"api\_key\_id": null,
"model": null,
"batch": null,
"input\_cached\_tokens": 0,
"input\_audio\_tokens": 0,
"output\_audio\_tokens": 0
}
]
},
{
"object": "bucket",
"start\_time": 1737072000,
"end\_time": 1737158400,
"results": [
{
"object": "organization.usage.completions.result",
"input\_tokens": 3390547,
"output\_tokens": 38604,
"num\_model\_requests": 2687,
"project\_id": null,
"user\_id": null,
"api\_key\_id": null,
"model": null,
"batch": null,
"input\_cached\_tokens": 25344,
"input\_audio\_tokens": 0,
"output\_audio\_tokens": 0
}
]
},
{
"object": "bucket",
"start\_time": 1737158400,
"end\_time": 1737244800,
"results": [
{
"object": "organization.usage.completions.result",
"input\_tokens": 8117824,
"output\_tokens": 105662,
"num\_model\_requests": 6335,
"project\_id": null,
"user\_id": null,
"api\_key\_id": null,
"model": null,
"batch": null,
"input\_cached\_tokens": 46464,
"input\_audio\_tokens": 0,
"output\_audio\_tokens": 0
}
]
},
{
"object": "bucket",
"start\_time": 1737244800,
"end\_time": 1737331200,
"results": [
{
"object": "organization.usage.completions.result",
"input\_tokens": 13542,
"output\_tokens": 85,
"num\_model\_requests": 46,
"project\_id": null,
"user\_id": null,
"api\_key\_id": null,
"model": null,
"batch": null,
"input\_cached\_tokens": 0,
"input\_audio\_tokens": 0,
"output\_audio\_tokens": 0
}
]
},
{
"object": "bucket",
"start\_time": 1737331200,
"end\_time": 1737417600,
"results": []
},
{
"object": "bucket",
"start\_time": 1737417600,
"end\_time": 1737504000,
"results": [
{
"object": "organization.usage.completions.result",
"input\_tokens": 29806,
"output\_tokens": 57604,
"num\_model\_requests": 98,
"project\_id": null,
"user\_id": null,
"api\_key\_id": null,
"model": null,
"batch": null,
"input\_cached\_tokens": 0,
"input\_audio\_tokens": 0,
"output\_audio\_tokens": 0
}
]
},
{
"object": "bucket",
"start\_time": 1737504000,
"end\_time": 1737590400,
"results": [
{
"object": "organization.usage.completions.result",
"input\_tokens": 1823,
"output\_tokens": 1467,
"num\_model\_requests": 7,
"project\_id": null,
"user\_id": null,
"api\_key\_id": null,
"model": null,
"batch": null,
"input\_cached\_tokens": 0,
"input\_audio\_tokens": 0,
"output\_audio\_tokens": 0
}
]
},
{
"object": "bucket",
"start\_time": 1737590400,
"end\_time": 1737676800,
"results": [
{
"object": "organization.usage.completions.result",
"input\_tokens": 7126,
"output\_tokens": 1896,
"num\_model\_requests": 19,
"project\_id": null,
"user\_id": null,
"api\_key\_id": null,
"model": null,
"batch": null,
"input\_cached\_tokens": 0,
"input\_audio\_tokens": 0,
"output\_audio\_tokens": 0
}
]
},
{
"object": "bucket",
"start\_time": 1737676800,
"end\_time": 1737763200,
"results": [
{
"object": "organization.usage.completions.result",
"input\_tokens": 22187,
"output\_tokens": 822,
"num\_model\_requests": 75,
"project\_id": null,
"user\_id": null,
"api\_key\_id": null,
"model": null,
"batch": null,
"input\_cached\_tokens": 640,
"input\_audio\_tokens": 2557,
"output\_audio\_tokens": 3103
}
]
},
{
"object": "bucket",
"start\_time": 1737763200,
"end\_time": 1737849600,
"results": [
{
"object": "organization.usage.completions.result",
"input\_tokens": 30204,
"output\_tokens": 65673,
"num\_model\_requests": 99,
"project\_id": null,
"user\_id": null,
"api\_key\_id": null,
"model": null,
"batch": null,
"input\_cached\_tokens": 0,
"input\_audio\_tokens": 0,
"output\_audio\_tokens": 0
}
]
},
{
"object": "bucket",
"start\_time": 1737849600,
"end\_time": 1737936000,
"results": []
},
{
"object": "bucket",
"start\_time": 1737936000,
"end\_time": 1738022400,
"results": []
},
{
"object": "bucket",
"start\_time": 1738022400,
"end\_time": 1738108800,
"results": [
{
"object": "organization.usage.completions.result",
"input\_tokens": 2541,
"output\_tokens": 1604,
"num\_model\_requests": 14,
"project\_id": null,
"user\_id": null,
"api\_key\_id": null,
"model": null,
"batch": null,
"input\_cached\_tokens": 0,
"input\_audio\_tokens": 0,
"output\_audio\_tokens": 0
}
]
},
{
"object": "bucket",
"start\_time": 1738108800,
"end\_time": 1738195200,
"results": [
{
"object": "organization.usage.completions.result",
"input\_tokens": 68339,
"output\_tokens": 49525,
"num\_model\_requests": 217,
"project\_id": null,
"user\_id": null,
"api\_key\_id": null,
"model": null,
"batch": null,
"input\_cached\_tokens": 7296,
"input\_audio\_tokens": 20033,
"output\_audio\_tokens": 3168
}
]
},
{
"object": "bucket",
"start\_time": 1738195200,
"end\_time": 1738281600,
"results": [
{
"object": "organization.usage.completions.result",
"input\_tokens": 18481,
"output\_tokens": 17500,
"num\_model\_requests": 84,
"project\_id": null,
"user\_id": null,
"api\_key\_id": null,
"model": null,
"batch": null,
"input\_cached\_tokens": 2944,
"input\_audio\_tokens": 10076,
"output\_audio\_tokens": 4966
}
]
},
{
"object": "bucket",
"start\_time": 1738281600,
"end\_time": 1738368000,
"results": [
{
"object": "organization.usage.completions.result",
"input\_tokens": 1187894,
"output\_tokens": 139134,
"num\_model\_requests": 5528,
"project\_id": null,
"user\_id": null,
"api\_key\_id": null,
"model": null,
"batch": null,
"input\_cached\_tokens": 2112,
"input\_audio\_tokens": 4935,
"output\_audio\_tokens": 993
}
]
},
{
"object": "bucket",
"start\_time": 1738368000,
"end\_time": 1738454400,
"results": []
},
{
"object": "bucket",
"start\_time": 1738454400,
"end\_time": 1738540800,
"results": [
{
"object": "organization.usage.completions.result",
"input\_tokens": 7268,
"output\_tokens": 30563,
"num\_model\_requests": 24,
"project\_id": null,
"user\_id": null,
"api\_key\_id": null,
"model": null,
"batch": null,
"input\_cached\_tokens": 0,
"input\_audio\_tokens": 0,
"output\_audio\_tokens": 0
}
]
},
{
"object": "bucket",
"start\_time": 1738540800,
"end\_time": 1738627200,
"results": [
{
"object": "organization.usage.completions.result",
"input\_tokens": 15121,
"output\_tokens": 22866,
"num\_model\_requests": 48,
"project\_id": null,
"user\_id": null,
"api\_key\_id": null,
"model": null,
"batch": null,
"input\_cached\_tokens": 0,
"input\_audio\_tokens": 0,
"output\_audio\_tokens": 0
}
]
},
{
"object": "bucket",
"start\_time": 1738627200,
"end\_time": 1738713600,
"results": [
{
"object": "organization.usage.completions.result",
"input\_tokens": 16735,
"output\_tokens": 16177,
"num\_model\_requests": 50,
"project\_id": null,
"user\_id": null,
"api\_key\_id": null,
"model": null,
"batch": null,
"input\_cached\_tokens": 1152,
"input\_audio\_tokens": 0,
"output\_audio\_tokens": 0
}
]
},
{
"object": "bucket",
"start\_time": 1738713600,
"end\_time": 1738800000,
"results": [
{
"object": "organization.usage.completions.result",
"input\_tokens": 6573,
"output\_tokens": 4238,
"num\_model\_requests": 43,
"project\_id": null,
"user\_id": null,
"api\_key\_id": null,
"model": null,
"batch": null,
"input\_cached\_tokens": 0,
"input\_audio\_tokens": 0,
"output\_audio\_tokens": 0
}
]
},
{
"object": "bucket",
"start\_time": 1738800000,
"end\_time": 1738886400,
"results": [
{
"object": "organization.usage.completions.result",
"input\_tokens": 1402,
"output\_tokens": 2042,
"num\_model\_requests": 18,
"project\_id": null,
"user\_id": null,
"api\_key\_id": null,
"model": null,
"batch": null,
"input\_cached\_tokens": 0,
"input\_audio\_tokens": 0,
"output\_audio\_tokens": 0
}
]
},
{
"object": "bucket",
"start\_time": 1738886400,
"end\_time": 1738972800,
"results": [
{
"object": "organization.usage.completions.result",
"input\_tokens": 11847,
"output\_tokens": 21938,
"num\_model\_requests": 47,
"project\_id": null,
"user\_id": null,
"api\_key\_id": null,
"model": null,
"batch": null,
"input\_cached\_tokens": 0,
"input\_audio\_tokens": 0,
"output\_audio\_tokens": 0
}
]
},
{
"object": "bucket",
"start\_time": 1738972800,
"end\_time": 1739059200,
"results": [
{
"object": "organization.usage.completions.result",
"input\_tokens": 1993,
"output\_tokens": 12,
"num\_model\_requests": 7,
"project\_id": null,
"user\_id": null,
"api\_key\_id": null,
"model": null,
"batch": null,
"input\_cached\_tokens": 0,
"input\_audio\_tokens": 0,
"output\_audio\_tokens": 0
}
]
},
{
"object": "bucket",
"start\_time": 1739059200,
"end\_time": 1739145600,
"results": []
},
{
"object": "bucket",
"start\_time": 1739145600,
"end\_time": 1739208663,
"results": [
{
"object": "organization.usage.completions.result",
"input\_tokens": 332,
"output\_tokens": 1509,
"num\_model\_requests": 8,
"project\_id": null,
"user\_id": null,
"api\_key\_id": null,
"model": null,
"batch": null,
"input\_cached\_tokens": 0,
"input\_audio\_tokens": 0,
"output\_audio\_tokens": 0
}
]
}
]`
```
## Parse the API Response and Create a DataFrame
Now we will parse the JSON data, extract relevant fields, and create a pandas DataFrame for easier manipulation and analysis.
```
`# Initialize a list to hold parsed records
records = []
# Iterate through the data to extract bucketed data
for bucket in usage\_data:
start\_time = bucket.get("start\_time")
end\_time = bucket.get("end\_time")
for result in bucket.get("results", []):
records.append(
{
"start\_time": start\_time,
"end\_time": end\_time,
"input\_tokens": result.get("input\_tokens", 0),
"output\_tokens": result.get("output\_tokens", 0),
"input\_cached\_tokens": result.get("input\_cached\_tokens", 0),
"input\_audio\_tokens": result.get("input\_audio\_tokens", 0),
"output\_audio\_tokens": result.get("output\_audio\_tokens", 0),
"num\_model\_requests": result.get("num\_model\_requests", 0),
"project\_id": result.get("project\_id"),
"user\_id": result.get("user\_id"),
"api\_key\_id": result.get("api\_key\_id"),
"model": result.get("model"),
"batch": result.get("batch"),
}
)
# Create a DataFrame from the records
df = pd.DataFrame(records)
# Convert Unix timestamps to datetime for readability
df["start\_datetime"] = pd.to\_datetime(df["start\_time"], unit="s")
df["end\_datetime"] = pd.to\_datetime(df["end\_time"], unit="s")
# Reorder columns for better readability
df = df[
[
"start\_datetime",
"end\_datetime",
"start\_time",
"end\_time",
"input\_tokens",
"output\_tokens",
"input\_cached\_tokens",
"input\_audio\_tokens",
"output\_audio\_tokens",
"num\_model\_requests",
"project\_id",
"user\_id",
"api\_key\_id",
"model",
"batch",
]
]
# Display the DataFrame
df.head()`
```
||start\_datetime|end\_datetime|start\_time|end\_time|input\_tokens|output\_tokens|input\_cached\_tokens|input\_audio\_tokens|output\_audio\_tokens|num\_model\_requests|project\_id|user\_id|api\_key\_id|model|batch|
|0|2025-01-11 17:31:00|2025-01-12|1736616660|1736640000|141201|9756|0|0|0|470|None|None|None|None|None|
|1|2025-01-12 00:00:00|2025-01-13|1736640000|1736726400|45949|282|0|0|0|150|None|None|None|None|None|
|2|2025-01-13 00:00:00|2025-01-14|1736726400|1736812800|3718360|97756|76544|5776|3166|3053|None|None|None|None|None|
|3|2025-01-14 00:00:00|2025-01-15|1736812800|1736899200|52786|38204|5440|4066|1097|157|None|None|None|None|None|
|4|2025-01-15 00:00:00|2025-01-16|1736899200|1736985600|35664|1835|192|2520|1549|55|None|None|None|None|None|
## Visualize Token Usage Over Time
We’ll create a bar chart to visualize input and output token usage for each time bucket.
```
`if not df.empty:
plt.figure(figsize=(12, 6))
# Create bar charts for input and output tokens
width = 0.35 # width of the bars
indices = range(len(df))
plt.bar(indices, df["input\_tokens"], width=width, label="Input Tokens", alpha=0.7)
plt.bar(
[i + width for i in indices],
df["output\_tokens"],
width=width,
label="Output Tokens",
alpha=0.7,
)
# Set labels and ticks
plt.xlabel("Time Bucket")
plt.ylabel("Number of Tokens")
plt.title("Daily Input vs Output Token Usage Last 30 Days")
plt.xticks(
[i + width / 2 for i in indices],
[dt.strftime("%Y-%m-%d") for dt in df["start\_datetime"]],
rotation=45,
)
plt.legend()
plt.tight\_layout()
plt.show()
else:
print("No data available to plot.")`
```
## Visual Example: Grouping by Model
In this section, we retrieve and visualize usage data grouped by model and project\_id. This can help you see the total tokens used by each model over the specified period.
### Note on Grouping Parameter
* If you do not specify a `group\_by` parameter, fields such as `project\_id`, `model`, and others will return as `null`.
Although the `group\_by` parameter is optional, it is recommended to include it in most cases to retrieve meaningful data.
* You can specify multiple group fields by separating them with commas. For example: `group\_by=["model", "project\_id"]`.
```
`# Calculate start time: n days ago from now
days\_ago = 30
start\_time = int(time.time()) - (days\_ago \* 24 \* 60 \* 60)
# Define parameters with grouping by model and project\_id
params = {
"start\_time": start\_time, # Required: Start time (Unix seconds)
"bucket\_width": "1d", # Optional: '1m', '1h', or '1d' (default '1d')
"group\_by": ["model", "project\_id"], # Group data by model and project\_id
"limit": 7, # Optional: Number of buckets to return
}
# Initialize an empty list to store all data
all\_group\_data = get\_data(url, params)
# Initialize a list to hold parsed records
records = []
# Iterate through the data to extract bucketed data
for bucket in all\_group\_data:
start\_time = bucket.get("start\_time")
end\_time = bucket.get("end\_time")
for result in bucket.get("results", []):
records.append(
{
"start\_time": start\_time,
"end\_time": end\_time,
"input\_tokens": result.get("input\_tokens", 0),
"output\_tokens": result.get("output\_tokens", 0),
"input\_cached\_tokens": result.get("input\_cached\_tokens", 0),
"input\_audio\_tokens": result.get("input\_audio\_tokens", 0),
"output\_audio\_tokens": result.get("output\_audio\_tokens", 0),
"num\_model\_requests": result.get("num\_model\_requests", 0),
"project\_id": result.get("project\_id", "N/A"),
"user\_id": result.get("user\_id", "N/A"),
"api\_key\_id": result.get("api\_key\_id", "N/A"),
"model": result.get("model", "N/A"),
"batch": result.get("batch", "N/A"),
}
)
# Create a DataFrame from the records
df = pd.DataFrame(records)
# Convert Unix timestamps to datetime for readability
df["start\_datetime"] = pd.to\_datetime(df["start\_time"], unit="s", errors="coerce")
df["end\_datetime"] = pd.to\_datetime(df["end\_time"], unit="s", errors="coerce")
# Reorder columns for better readability
df = df[
[
"start\_datetime",
"end\_datetime",
"start\_time",
"end\_time",
"input\_tokens",
"output\_tokens",
"input\_cached\_tokens",
"input\_audio\_tokens",
"output\_audio\_tokens",
"num\_model\_requests",
"project\_id",
"user\_id",
"api\_key\_id",
"model",
"batch",
]
]
# Display the DataFrame
df.head()`
```
```
`Data retrieved successfully!`
```
||start\_datetime|end\_datetime|start\_time|end\_time|input\_tokens|output\_tokens|input\_cached\_tokens|input\_audio\_tokens|output\_audio\_tokens|num\_model\_requests|project\_id|user\_id|api\_key\_id|model|batch|
|0|2025-01-11 17:31:39|2025-01-12|1736616699|1736640000|6897|97|0|0|0|97|proj\_hNhhQzyYu7HxySZWs7cA3Ugu|None|None|gpt-4o-mini-2024-07-18|None|
|1|2025-01-11 17:31:39|2025-01-12|1736616699|1736640000|33984|206|0|0|0|95|proj\_hNhhQzyYu7HxySZWs7cA3Ugu|None|None|ft:gpt-4o-2024-08-06:distillation-test:wordle2...|None|
|2|2025-01-11 17:31:39|2025-01-12|1736616699|1736640000|2846|8874|0|0|0|8|proj\_hNhhQzyYu7HxySZWs7cA3Ugu|None|None|o1-mini-2024-09-12|None|
|3|2025-01-11 17:31:39|2025-01-12|1736616699|1736640000|97474|579|0|0|0|270|proj\_hNhhQzyYu7HxySZWs7cA3Ugu|None|None|gpt-4o-2024-08-06|None|
|4|2025-01-12 00:00:00|2025-01-13|1736640000|1736726400|1989|28|0|0|0|28|proj\_hNhhQzyYu7HxySZWs7cA3Ugu|None|None|gpt-4o-mini-2024-07-18|None|
## Parse the API Response into DataFrame and render a stacked bar chart
Now we will parse the JSON data, extract relevant fields, and create a pandas DataFrame for easier manipulation and analysis.
```
`# Group data by model and project\_id and aggregate model request counts
grouped\_by\_model\_project = (
df.groupby(["model", "project\_id"])
.agg(
{
"num\_model\_requests": "sum",
}
)
.reset\_index()
)
# Determine unique models and project IDs for plotting and color mapping
models = sorted(grouped\_by\_model\_project["model"].unique())
project\_ids = sorted(grouped\_by\_model\_project["project\_id"].unique())
distinct\_colors = [
"#1f77b4",
"#ff7f0e",
"#2ca02c",
"#d62728",
"#9467bd",
"#8c564b",
"#e377c2",
"#7f7f7f",
"#bcbd22",
"#17becf",
]
project\_color\_mapping = {
pid: distinct\_colors[i % len(distinct\_colors)] for i, pid in enumerate(project\_ids)
}
# Calculate total number of requests per project\_id for legend
project\_totals = (
grouped\_by\_model\_project.groupby("project\_id")["num\_model\_requests"]
.sum()
.sort\_values(ascending=False) # Sort by highest total first
)
# Set up bar positions
n\_models = len(models)
bar\_width = 0.6
x = np.arange(n\_models)
plt.figure(figsize=(12, 6))
# Plot stacked bars for each model
for model\_idx, model in enumerate(models):
# Filter data for the current model
model\_data = grouped\_by\_model\_project[grouped\_by\_model\_project["model"] == model]
bottom = 0
# Stack segments for each project ID within the bars
for \_, row in model\_data.iterrows():
color = project\_color\_mapping[row["project\_id"]]
plt.bar(
x[model\_idx],
row["num\_model\_requests"],
width=bar\_width,
bottom=bottom,
color=color,
)
bottom += row["num\_model\_requests"]
# Labeling and styling
plt.xlabel("Model")
plt.ylabel("Number of Model Requests")
plt.title("Total Model Requests by Model and Project ID Last 30 Days")
plt.xticks(x, models, rotation=45, ha="right")
# Create a sorted legend with totals
handles = [
mpatches.Patch(color=project\_color\_mapping[pid], label=f"{pid} (Total: {total})")
for pid, total in project\_totals.items()
]
plt.legend(handles=handles, bbox\_to\_anchor=(1.05, 1), loc="upper left")
plt.tight\_layout()
plt.show()`
```
## Visual Example: Model Distribution Pie Chart
This section visualizes the distribution of token usage across different models using a pie chart.
```
`records = []
for bucket in all\_group\_data:
for result in bucket.get("results", []):
records.append(
{
"project\_id": result.get("project\_id", "N/A"),
"num\_model\_requests": result.get("num\_model\_requests", 0),
}
)
# Create a DataFrame
df = pd.DataFrame(records)
# Aggregate data by project\_id
grouped\_by\_project = (
df.groupby("project\_id").agg({"num\_model\_requests": "sum"}).reset\_index()
)
# Visualize Pie Chart
if not grouped\_by\_project.empty:
# Filter out rows where num\_model\_requests == 0
filtered\_grouped\_by\_project = grouped\_by\_project[
grouped\_by\_project["num\_model\_requests"] \> 0
]
# Calculate the total model requests after filtering
total\_requests = filtered\_grouped\_by\_project["num\_model\_requests"].sum()
if total\_requests \> 0:
# Calculate percentage of total for each project
filtered\_grouped\_by\_project["percentage"] = (
filtered\_grouped\_by\_project["num\_model\_requests"] / total\_requests
) \* 100
# Separate "Other" projects (below 5%)
other\_projects = filtered\_grouped\_by\_project[
filtered\_grouped\_by\_project["percentage"] \< 5
]
main\_projects = filtered\_grouped\_by\_project[
filtered\_grouped\_by\_project["percentage"] \>= 5
]
# Sum up "Other" projects
if not other\_projects.empty:
other\_row = pd.DataFrame(
{
"project\_id": ["Other"],
"num\_model\_requests": [other\_projects["num\_model\_requests"].sum()],
"percentage": [other\_projects["percentage"].sum()],
}
)
filtered\_grouped\_by\_project = pd.concat(
[main\_projects, other\_row], ignore\_index=True
)
# Sort by number of requests for better legend organization
filtered\_grouped\_by\_project = filtered\_grouped\_by\_project.sort\_values(
by="num\_model\_requests", ascending=False
)
# Main pie chart for distribution of model requests by project\_id
plt.figure(figsize=(10, 8))
plt.pie(
filtered\_grouped\_by\_project["num\_model\_requests"],
labels=filtered\_grouped\_by\_project["project\_id"],
autopct=lambda p: f"{p:.1f}%\\n({int(p \* total\_requests / 100):,})",
startangle=140,
textprops={"fontsize": 10},
)
plt.title("Distribution of Model Requests by Project ID", fontsize=14)
plt.axis("equal") # Equal aspect ratio ensures pie chart is circular.
plt.tight\_layout()
plt.show()
# If there are "Other" projects, generate a second pie chart for breakdown
if not other\_projects.empty:
other\_total\_requests = other\_projects["num\_model\_requests"].sum()
plt.figure(figsize=(10, 8))
plt.pie(
other\_projects["num\_model\_requests"],
labels=other\_projects["project\_id"],
autopct=lambda p: f"{p:.1f}%\\n({int(p \* other\_total\_requests / 100):,})",
startangle=140,
textprops={"fontsize": 10},
)
plt.title('Breakdown of "Other" Projects by Model Requests', fontsize=14)
plt.axis("equal") # Equal aspect ratio ensures pie chart is circular.
plt.tight\_layout()
plt.show()
else:
print("Total model requests is zero. Pie chart will not be rendered.")
else:
print("No grouped data available for pie chart.")`
```
## Costs API Example
In this section, we’ll work with the OpenAI Costs API to retrieve and visualize cost data. Similar to the completions data, we’ll:
* Call the Costs API to get aggregated cost data.
* Parse the JSON response into a pandas DataFrame.
* Visualize costs grouped by line item using a bar chart.
```
`# Calculate start time: n days ago from now
days\_ago = 30
start\_time = int(time.time()) - (days\_ago \* 24 \* 60 \* 60)
# Define the Costs API endpoint
costs\_url = "https://api.openai.com/v1/organization/costs"
costs\_params = {
"start\_time": start\_time, # Required: Start time (Unix seconds)
"bucket\_width": "1d", # Optional: Currently only '1d' is supported
"limit": 30, # Optional: Number of buckets to return
}
# Initialize an empty list to store all data
all\_costs\_data = get\_data(costs\_url, costs\_params)`
```
```
`Data retrieved successfully!`
```
```
`print(json.dumps(all\_costs\_data, indent=2))`
```
```
`[
{
"object": "bucket",
"start\_time": 1736553600,
"end\_time": 1736640000,
"results": [
{
"object": "organization.costs.result",
"amount": {
"value": 0.13080438340307526,
"currency": "usd"
},
"line\_item": null,
"project\_id": null,
"organization\_id": "org-GLHrIv00VVN9dEQC2b4wsBkf"
}
]
},
{
"object": "bucket",
"start\_time": 1736640000,
"end\_time": 1736726400,
"results": [
{
"object": "organization.costs.result",
"amount": {
"value": 0.12270423340307525,
"currency": "usd"
},
"line\_item": null,
"project\_id": null,
"organization\_id": "org-GLHrIv00VVN9dEQC2b4wsBkf"
}
]
},
{
"object": "bucket",
"start\_time": 1736726400,
"end\_time": 1736812800,
"results": [
{
"object": "organization.costs.result",
"amount": {
"value": 9.888144383403077,
"currency": "usd"
},
"line\_item": null,
"project\_id": null,
"organization\_id": "org-GLHrIv00VVN9dEQC2b4wsBkf"
}
]
},
{
"object": "bucket",
"start\_time": 1736812800,
"end\_time": 1736899200,
"results": [
{
"object": "organization.costs.result",
"amount": {
"value": 0.3507639334030752,
"currency": "usd"
},
"line\_item": null,
"project\_id": null,
"organization\_id": "org-GLHrIv00VVN9dEQC2b4wsBkf"
}
]
},
{
"object": "bucket",
"start\_time": 1736899200,
"end\_time": 1736985600,
"results": [
{
"object": "organization.costs.result",
"amount": {
"value": 0.2977481185324674,
"currency": "usd"
},
"line\_item": null,
"project\_id": null,
"organization\_id": "org-GLHrIv00VVN9dEQC2b4wsBkf"
}
]
},
{
"object": "bucket",
"start\_time": 1736985600,
"end\_time": 1737072000,
"results": [
{
"object": "organization.costs.result",
"amount": {
"value": 0.00925485477848094,
"currency": "usd"
},
"line\_item": null,
"project\_id": null,
"organization\_id": "org-GLHrIv00VVN9dEQC2b4wsBkf"
}
]
},
{
"object": "bucket",
"start\_time": 1737072000,
"end\_time": 1737158400,
"results": [
{
"object": "organization.costs.result",
"amount": {
"value": 8.889884136532304,
"currency": "usd"
},
"line\_item": null,
"project\_id": null,
"organization\_id": "org-GLHrIv00VVN9dEQC2b4wsBkf"
}
]
},
{
"object": "bucket",
"start\_time": 1737158400,
"end\_time": 1737244800,
"results": [
{
"object": "organization.costs.result",
"amount": {
"value": 21.167310118127915,
"currency": "usd"
},
"line\_item": null,
"project\_id": null,
"organization\_id": "org-GLHrIv00VVN9dEQC2b4wsBkf"
}
]
},
{
"object": "bucket",
"start\_time": 1737244800,
"end\_time": 1737331200,
"results": [
{
"object": "organization.costs.result",
"amount": {
"value": 0.04955636812791847,
"currency": "usd"
},
"line\_item": null,
"project\_id": null,
"organization\_id": "org-GLHrIv00VVN9dEQC2b4wsBkf"
}
]
},
{
"object": "bucket",
"start\_time": 1737331200,
"end\_time": 1737417600,
"results": [
{
"object": "organization.costs.result",
"amount": {
"value": 0.0003226181279184669,
"currency": "usd"
},
"line\_item": null,
"project\_id": null,
"organization\_id": "org-GLHrIv00VVN9dEQC2b4wsBkf"
}
]
},
{
"object": "bucket",
"start\_time": 1737417600,
"end\_time": 1737504000,
"results": [
{
"object": "organization.costs.result",
"amount": {
"value": 0.6320363681279185,
"currency": "usd"
},
"line\_item": null,
"project\_id": null,
"organization\_id": "org-GLHrIv00VVN9dEQC2b4wsBkf"
}
]
},
{
"object": "bucket",
"start\_time": 1737504000,
"end\_time": 1737590400,
"results": [
{
"object": "organization.costs.result",
"amount": {
"value": 52.41558761812793,
"currency": "usd"
},
"line\_item": null,
"project\_id": null,
"organization\_id": "org-GLHrIv00VVN9dEQC2b4wsBkf"
}
]
},
{
"object": "bucket",
"start\_time": 1737590400,
"end\_time": 1737676800,
"results": [
{
"object": "organization.costs.result",
"amount": {
"value": 104.88761235323427,
"currency": "usd"
},
"line\_item": null,
"project\_id": null,
"organization\_id": "org-GLHrIv00VVN9dEQC2b4wsBkf"
}
]
},
{
"object": "bucket",
"start\_time": 1737676800,
"end\_time": 1737763200,
"results": [
{
"object": "organization.costs.result",
"amount": {
"value": 0.3376030385950106,
"currency": "usd"
},
"line\_item": null,
"project\_id": null,
"organization\_id": "org-GLHrIv00VVN9dEQC2b4wsBkf"
}
]
},
{
"object": "bucket",
"start\_time": 1737763200,
"end\_time": 1737849600,
"results": [
{
"object": "organization.costs.result",
"amount": {
"value": 0.062551042553524,
"currency": "usd"
},
"line\_item": null,
"project\_id": null,
"organization\_id": "org-GLHrIv00VVN9dEQC2b4wsBkf"
}
]
},
{
"object": "bucket",
"start\_time": 1737849600,
"end\_time": 1737936000,
"results": [
{
"object": "organization.costs.result",
"amount": {
"value": 0.00032195744715549047,
"currency": "usd"
},
"line\_item": null,
"project\_id": null,
"organization\_id": "org-GLHrIv00VVN9dEQC2b4wsBkf"
}
]
},
{
"object": "bucket",
"start\_time": 1737936000,
"end\_time": 1738022400,
"results": [
{
"object": "organization.costs.result",
"amount": {
"value": 0.0003084210662774742,
"currency": "usd"
},
"line\_item": null,
"project\_id": null,
"organization\_id": "org-GLHrIv00VVN9dEQC2b4wsBkf"
}
]
},
{
"object": "bucket",
"start\_time": 1738022400,
"end\_time": 1738108800,
"results": [
{
"object": "organization.costs.result",
"amount": {
"value": 0.00032195744715549047,
"currency": "usd"
},
"line\_item": null,
"project\_id": null,
"organization\_id": "org-GLHrIv00VVN9dEQC2b4wsBkf"
}
]
},
{
"object": "bucket",
"start\_time": 1738108800,
"end\_time": 1738195200,
"results": [
{
"object": "organization.costs.result",
"amount": {
"value": 0.5142559074471554,
"currency": "usd"
},
"line\_item": null,
"project\_id": null,
"organization\_id": "org-GLHrIv00VVN9dEQC2b4wsBkf"
}
]
},
{
"object": "bucket",
"start\_time": 1738195200,
"end\_time": 1738281600,
"results": [
{
"object": "organization.costs.result",
"amount": {
"value": 0.21870350744715547,
"currency": "usd"
},
"line\_item": null,
"project\_id": null,
"organization\_id": "org-GLHrIv00VVN9dEQC2b4wsBkf"
}
]
},
{
"object": "bucket",
"start\_time": 1738281600,
"end\_time": 1738368000,
"results": [
{
"object": "organization.costs.result",
"amount": {
"value": 1.4528752074471551,
"currency": "usd"
},
"line\_item": null,
"project\_id": null,
"organization\_id": "org-GLHrIv00VVN9dEQC2b4wsBkf"
}
]
},
{
"object": "bucket",
"start\_time": 1738368000,
"end\_time": 1738454400,
"results": [
{
"object": "organization.costs.result",
"amount": {
"value": 0.00042714787262957543,
"currency": "usd"
},
"line\_item": null,
"project\_id": null,
"organization\_id": "org-GLHrIv00VVN9dEQC2b4wsBkf"
}
]
},
{
"object": "bucket",
"start\_time": 1738454400,
"end\_time": 1738540800,
"results": [
{
"object": "organization.costs.result",
"amount": {
"value": 0.00032195744715549047,
"currency": "usd"
},
"line\_item": null,
"project\_id": null,
"organization\_id": "org-GLHrIv00VVN9dEQC2b4wsBkf"
}
]
},
{
"object": "bucket",
"start\_time": 1738540800,
"end\_time": 1738627200,
"results": [
{
"object": "organization.costs.result",
"amount": {
"value": 0.0031147346857709622,
"currency": "usd"
},
"line\_item": null,
"project\_id": null,
"organization\_id": "org-GLHrIv00VVN9dEQC2b4wsBkf"
}
]
},
{
"object": "bucket",
"start\_time": 1738627200,
"end\_time": 1738713600,
"results": [
{
"object": "organization.costs.result",
"amount": {
"value": 68.30023964957941,
"currency": "usd"
},
"line\_item": null,
"project\_id": null,
"organization\_id": "org-GLHrIv00VVN9dEQC2b4wsBkf"
}
]
},
{
"object": "bucket",
"start\_time": 1738713600,
"end\_time": 1738800000,
"results": [
{
"object": "organization.costs.result",
"amount": {
"value": 14.858330207447157,
"currency": "usd"
},
"line\_item": null,
"project\_id": null,
"organization\_id": "org-GLHrIv00VVN9dEQC2b4wsBkf"
}
]
},
{
"object": "bucket",
"start\_time": 1738800000,
"end\_time": 1738886400,
"results": [
{
"object": "organization.costs.result",
"amount": {
"value": 0.3137180574471555,
"currency": "usd"
},
"line\_item": null,
"project\_id": null,
"organization\_id": "org-GLHrIv00VVN9dEQC2b4wsBkf"
}
]
},
{
"object": "bucket",
"start\_time": 1738886400,
"end\_time": 1738972800,
"results": [
{
"object": "organization.costs.result",
"amount": {
"value": 0.02677460744715549,
"currency": "usd"
},
"line\_item": null,
"project\_id": null,
"organization\_id": "org-GLHrIv00VVN9dEQC2b4wsBkf"
}
]
},
{
"object": "bucket",
"start\_time": 1738972800,
"end\_time": 1739059200,
"results": [
{
"object": "organization.costs.result",
"amount": {
"value": 0.007399792553524012,
"currency": "usd"
},
"line\_item": null,
"project\_id": null,
"organization\_id": "org-GLHrIv00VVN9dEQC2b4wsBkf"
}
]
},
{
"object": "bucket",
"start\_time": 1739059200,
"end\_time": 1739145600,
"results": [
{
"object": "organization.costs.result",
"amount": {
"value": 0.00032195744715549047,
"currency": "usd"
},
"line\_item": null,
"project\_id": null,
"organization\_id": "org-GLHrIv00VVN9dEQC2b4wsBkf"
}
]
},
{
"object": "bucket",
"start\_time": 1739145600,
"end\_time": 1739232000,
"results": [
{
"object": "organization.costs.result",
"amount": {
"value": 0.00012073404268330895,
"currency": "usd"
},
"line\_item": null,
"project\_id": null,
"organization\_id": "org-GLHrIv00VVN9dEQC2b4wsBkf"
}
]
}
]`
```
## Parse the Costs API Response and Create a DataFrame
We will now parse the JSON data from the Costs API, extract relevant fields, and create a pandas DataFrame for further analysis.
```
`# Initialize a list to hold parsed cost records
cost\_records = []
# Extract bucketed cost data from all\_costs\_data
for bucket in all\_costs\_data:
start\_time = bucket.get("start\_time")
end\_time = bucket.get("end\_time")
for result in bucket.get("results", []):
cost\_records.append(
{
"start\_time": start\_time,
"end\_time": end\_time,
"amount\_value": result.get("amount", {}).get("value", 0),
"currency": result.get("amount", {}).get("currency", "usd"),
"line\_item": result.get("line\_item"),
"project\_id": result.get("project\_id"),
}
)
# Create a DataFrame from the cost records
cost\_df = pd.DataFrame(cost\_records)
# Convert Unix timestamps to datetime for readability
cost\_df["start\_datetime"] = pd.to\_datetime(cost\_df["start\_time"], unit="s")
cost\_df["end\_datetime"] = pd.to\_datetime(cost\_df["end\_time"], unit="s")
# Display the first few rows of the DataFrame
cost\_df.head()`
```
||start\_time|end\_time|amount\_value|currency|line\_item|project\_id|start\_datetime|end\_datetime|
|0|1736553600|1736640000|0.130804|usd|None|None|2025-01-11|2025-01-12|
|1|1736640000|1736726400|0.122704|usd|None|None|2025-01-12|2025-01-13|
|2|1736726400|1736812800|9.888144|usd|None|None|2025-01-13|2025-01-14|
|3|1736812800|1736899200|0.350764|usd|None|None|2025-01-14|2025-01-15|
|4|1736899200|1736985600|0.297748|usd|None|None|2025-01-15|2025-01-16|
## Visualize Total Costs per Day
We’ll create a bar chart to visualize the total costs aggregated by day. This helps give a high level perspective on organizational spend.
```
`if not cost\_df.empty:
# Ensure datetime conversion for 'start\_datetime' column
if (
"start\_datetime" not in cost\_df.columns
or not pd.api.types.is\_datetime64\_any\_dtype(cost\_df["start\_datetime"])
):
cost\_df["start\_datetime"] = pd.to\_datetime(
cost\_df["start\_time"], unit="s", errors="coerce"
)
# Create a new column for just the date part of 'start\_datetime'
cost\_df["date"] = cost\_df["start\_datetime"].dt.date
# Group by date and sum the amounts
cost\_per\_day = cost\_df.groupby("date")["amount\_value"].sum().reset\_index()
# Plot the data
plt.figure(figsize=(12, 6))
plt.bar(
cost\_per\_day["date"],
cost\_per\_day["amount\_value"],
width=0.6,
color="skyblue",
alpha=0.8,
)
plt.xlabel("Date")
plt.ylabel("Total Cost (USD)")
plt.title("Total Cost per Day (Last 30 Days)")
plt.xticks(rotation=45, ha="right")
plt.tight\_layout()
plt.show()
else:
print("No cost data available to plot.")`
```
## Visualize Costs by Line Item
We’ll create a bar chart to visualize the total costs aggregated by line item. This helps identify which categories (e.g., models or other services) contribute most to the expenses.
```
`days\_ago = 30
start\_time = int(time.time()) - (days\_ago \* 24 \* 60 \* 60)
costs\_params = {
"start\_time": start\_time, # Required: Start time (Unix seconds)
"bucket\_width": "1d", # Optional: Currently only '1d' is supported
"limit": 30, # Optional: Number of buckets to return
"group\_by": ["line\_item"],
}
line\_item\_cost\_data = get\_data(costs\_url, costs\_params)
# Initialize a list to hold parsed cost records
cost\_records = []
# Extract bucketed cost data from all\_costs\_data
for bucket in line\_item\_cost\_data:
start\_time = bucket.get("start\_time")
end\_time = bucket.get("end\_time")
for result in bucket.get("results", []):
cost\_records.append(
{
"start\_time": start\_time,
"end\_time": end\_time,
"amount\_value": result.get("amount", {}).get("value", 0),
"currency": result.get("amount", {}).get("currency", "usd"),
"line\_item": result.get("line\_item"),
"project\_id": result.get("project\_id"),
}
)
# Create a DataFrame from the cost records
cost\_df = pd.DataFrame(cost\_records)
# Convert Unix timestamps to datetime for readability
cost\_df["start\_datetime"] = pd.to\_datetime(cost\_df["start\_time"], unit="s")
cost\_df["end\_datetime"] = pd.to\_datetime(cost\_df["end\_time"], unit="s")
# Display the first few rows of the DataFrame
cost\_df.head()`
```
```
`Data retrieved successfully!`
```
||start\_time|end\_time|amount\_value|currency|line\_item|project\_id|start\_datetime|end\_datetime|
|0|1736553600|1736640000|0.127440|usd|ft-gpt-4o-2024-08-06, input|proj\_hNhhQzyYu7HxySZWs7cA3Ugu|2025-01-11|2025-01-12|
|1|1736553600|1736640000|0.003090|usd|ft-gpt-4o-2024-08-06, output|proj\_hNhhQzyYu7HxySZWs7cA3Ugu|2025-01-11|2025-01-12|
|2|1736553600|1736640000|0.000271|usd|assistants api | file search|proj\_L67gOme4S2nBA8aQieEOwLy7|2025-01-11|2025-01-12|
|3|1736553600|1736640000|0.000003|usd|assistants api | file search|proj\_VV4ZAjd6ALfFd9uh0vY8joR1|2025-01-11|2025-01-12|
|4|1736640000|1736726400|0.028607|usd|evals | gpt-4o-mini-2024-07-18, input|proj\_L67gOme4S2nBA8aQieEOwLy7|2025-01-12|2025-01-13|
```
`if not cost\_df.empty:
# Ensure datetime conversion for 'start\_datetime' column
if "start\_datetime" not in cost\_df.columns or not pd.api.types.is\_datetime64\_any\_dtype(cost\_df["start\_datetime"]):
cost\_df["start\_datetime"] = pd.to\_datetime(cost\_df["start\_time"], unit="s", errors="coerce")
# Create a new column for just the date part of 'start\_datetime'
cost\_df["date"] = cost\_df["start\_datetime"].dt.date
# Group by date and line\_item and sum the amounts
cost\_per\_day = cost\_df.groupby(["date", "line\_item"])["amount\_value"].sum().reset\_index()
# Pivot the DataFrame so each date has one bar with line\_item stacks
cost\_pivot = cost\_per\_day.pivot(index="date", columns="line\_item", values="amount\_value").fillna(0)
cost\_pivot = cost\_pivot.sort\_index()
# Plot a stacked bar chart with one bar for each grouped day
plt.figure(figsize=(12, 6))
ax = cost\_pivot.plot(kind="bar", stacked=True, ax=plt.gca(), width=0.8)
plt.xlabel("Date")
plt.ylabel("Total Cost (USD)")
plt.title("Total Cost by Line Item")
plt.xticks(rotation=45, ha="right")
# Update legend so it doesn't overlay the graph by placing it outside the plot area
plt.legend(bbox\_to\_anchor=(1.05, 1), loc="upper left", borderaxespad=0.)
plt.tight\_layout()
plt.show()
else:
print("No cost data available to plot.")`
```
```
`/var/folders/r\_/g8r2dz8s2qd104th5p5yxljr0000gp/T/ipykernel\_49468/2813361465.py:25: UserWarning: Tight layout not applied. The bottom and top margins cannot be made large enough to accommodate all Axes decorations.
plt.tight\_layout()`
```
## Additional Visualizations (Optional)
You can extend this notebook with more visualizations for both the Completions and Costs APIs. For example:
**Completions API:**
* Group by user, project, or model to see which ones consume the most tokens.
* Create line plots for time series analysis of token usage over days or hours.
* Use pie charts to visualize distribution of tokens across models, users, or projects.
* Experiment with different `group\_by` parameters (e.g., `["model", "user\_id"]`) to gain deeper insights.
**Costs API:**
* Group by project or line item to identify spending patterns.
* Create line or bar charts to visualize daily cost trends.
* Use pie charts to show how costs are distributed across projects, services, or line items.
* Try various `group\_by` options (e.g., `["project\_id"]`, `["line\_item"]`) for granular analysis.
Experiment with different parameters and visualization techniques using `pandas` and `matplotlib` (or libraries like Plotly/Bokeh) to gain deeper insights, and consider integrating these visualizations into interactive dashboards for real-time monitoring.
## Integrating with Third-Party Dashboarding Platforms
To bring OpenAI usage and cost data into external dashboarding tools like Tableau, Power BI, or custom platforms (e.g., Plotly Dash, Bokeh), follow these steps:
1. **Data Collection & Preparation:**
* Use Python scripts to regularly fetch data from the Completions and Costs APIs.
* Process and aggregate the data with pandas, then store it in a database, data warehouse, or export it as CSV/JSON files.
* **Connecting to a Dashboard:**
* **BI Tools (Tableau, Power BI):**
* Connect directly to the prepared data source (SQL database, CSV files, or web APIs).
* Use built-in connectors to schedule data refreshes, ensuring dashboards always display current information.
* **Custom Dashboards (Plotly Dash, Bokeh):**
* Embed API calls and data processing into the dashboard code.
* Build interactive visual components that automatically update as new data is fetched.
* **Real-Time & Automated Updates:**
* Schedule scripts using cron jobs, task schedulers, or workflow tools (e.g., Apache Airflow) to refresh data periodically.
* Implement webhooks or streaming APIs (if available) for near real-time data updates.
By integrating API data into third-party platforms, you can create interactive, real-time dashboards that combine OpenAI metrics with other business data, offering comprehensive insights and automated monitoring.