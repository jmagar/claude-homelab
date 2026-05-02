Function calling for nearby places: Leveraging the Google Places API and customer profiles
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
# Function calling for nearby places: Leveraging the Google Places API and customer profiles
[ PR ](https://github.com/prestontuggle)
[ prestontuggle ](https://github.com/prestontuggle)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/Function_calling_finding_nearby_places.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/Function_calling_finding_nearby_places.ipynb)
This notebook is centered around the integration of the Google Places API and custom user profiles to enhance location-based searches. Our approach involves using the Google Places API in combination with user preferences, aiming to make location discovery more personal and relevant. Please note that while we focus on the Google Places API in this instance, there are numerous other APIs you could explore and apply in a similar fashion.
We’ll explore the application of three main components:
* Customer profile: This mock profile captures individual preferences for types of places (e.g., restaurants, parks, museums), budget, preferred ratings, and other specific requirements.
* Google Places API: This API provides real-time data about nearby places. It factors in various data points such as ratings, types of venues, costs, and more from the locations around you.
* Function calling: A single command such as “I’m hungry” or “I want to visit a museum” activates the function which combines the user profile data and Google Places API to identify suitable venues.
This notebook introduces two primary use cases:
* Profile-based recommendations: Learn how to create a user profile and make place recommendations based on individual preferences.
* API integration with function calling: Understand how to integrate and call Google Places API effectively to source real-time data of various places using function calling.
Please note that while this system is highly versatile, its effectiveness may vary based on user preferences and available place data. For the purposes of this notebook, the customer data is fake and the location is hardcoded.
## Setup
Google Places API
To use the Google Places API, you’ll need two things:
* Google Account: If you don’t already have one, you will need to create a Google account.
* Google Places API Key: The API key is a unique identifier that is used to authenticate requests associated with your project for usage and billing purposes. You can get your API key from the [Google Cloud Console](https://console.cloud.google.com/getting-started?authuser=1).
Please note that Google Places API is a paid service, and the cost is associated with the number of API calls made. Keep track of your usage to avoid any unexpected charges.
The requests library is also needed, you can download it by using the following command:
```
`pip install requests
```python
import json
from openai import OpenAI
import os
import requests
client = OpenAI(api\_key=os.environ.get("OPENAI\_API\_KEY", "\<your OpenAI API key if not set as env var\>"))`
```
In this code snippet, we are defining a function `fetch\_customer\_profile` that accepts a `user\_id` and returns a mock user profile.
This function simulates an API call that fetches user data from a database. For this demo, we’re using hard-coded data. The user profile contains various details such as the user’s location (set to the coordinates of the Golden Gate Bridge for this example), preferences in food and activities, app usage metrics, recent interactions, and user rank.
In a production environment, you would replace this hard-coded data with a real API call to your user database.
```
`def fetch\_customer\_profile(user\_id):
# You can replace this with a real API call in the production code
if user\_id == "user1234":
return {
"name": "John Doe",
"location": {
"latitude": 37.7955,
"longitude": -122.4026,
},
"preferences": {
"food": ["Italian", "Sushi"],
"activities": ["Hiking", "Reading"],
},
"behavioral\_metrics": {
"app\_usage": {
"daily": 2, # hours
"weekly": 14 # hours
},
"favourite\_post\_categories": ["Nature", "Food", "Books"],
"active\_time": "Evening",
},
"recent\_searches": ["Italian restaurants nearby", "Book clubs"],
"recent\_interactions": ["Liked a post about 'Best Pizzas in New York'", "Commented on a post about 'Central Park Trails'"],
"user\_rank": "Gold", # based on some internal ranking system
}
else:
return None`
```
## Requesting and processing data from Google Places API
The function call\_google\_places\_api serves to request information from the Google Places API and provide a list of the top two places based on a given place\_type and optional food\_preference. We’ve limited this function to the top two results to manage usage since this is a paid service. However, you can modify this to retrieve any number of results as per your requirement.
The function is configured with a hardcoded location (set to the coordinates of the Transamerica Pyramid), your Google API key, and specific request parameters. Depending on the place\_type, it formulates the appropriate API request URL. If the place\_type is a restaurant and a food\_preference is specified, it is included in the API request.
After sending the GET request, the function checks the response status. If it’s successful, it processes the JSON response, extracts the relevant details using the get\_place\_details function, and returns them in a human-readable format. If the request fails, it prints out the error for debugging.
The get\_place\_details function is used to retrieve more detailed information about a place, given its place\_id. It sends a GET request to the Google Place Details API and returns the result if the request is successful. If the request fails, it prints out the error for debugging.
Both functions handle exceptions and return an error message if something goes wrong.
```
`def get\_place\_details(place\_id, api\_key):
URL = f"https://maps.googleapis.com/maps/api/place/details/json?place\_id={place\_id}&key={api\_key}"
response = requests.get(URL)
if response.status\_code == 200:
result = json.loads(response.content)["result"]
return result
else:
print(f"Google Place Details API request failed with status code {response.status\_code}")
print(f"Response content: {response.content}")
return None`
```
```
`def call\_google\_places\_api(user\_id, place\_type, food\_preference=None):
try:
# Fetch customer profile
customer\_profile = fetch\_customer\_profile(user\_id)
if customer\_profile is None:
return "I couldn't find your profile. Could you please verify your user ID?"
# Get location from customer profile
lat = customer\_profile["location"]["latitude"]
lng = customer\_profile["location"]["longitude"]
API\_KEY = os.getenv('GOOGLE\_PLACES\_API\_KEY') # retrieve API key from environment variable
LOCATION = f"{lat},{lng}"
RADIUS = 500 # search within a radius of 500 meters
TYPE = place\_type
# If the place\_type is restaurant and food\_preference is not None, include it in the API request
if place\_type == 'restaurant' and food\_preference:
URL = f"https://maps.googleapis.com/maps/api/place/nearbysearch/json?location={LOCATION}&radius={RADIUS}&type={TYPE}&keyword={food\_preference}&key={API\_KEY}"
else:
URL = f"https://maps.googleapis.com/maps/api/place/nearbysearch/json?location={LOCATION}&radius={RADIUS}&type={TYPE}&key={API\_KEY}"
response = requests.get(URL)
if response.status\_code == 200:
results = json.loads(response.content)["results"]
places = []
for place in results[:2]: # limit to top 2 results
place\_id = place.get("place\_id")
place\_details = get\_place\_details(place\_id, API\_KEY) # Get the details of the place
place\_name = place\_details.get("name", "N/A")
place\_types = next((t for t in place\_details.get("types", []) if t not in ["food", "point\_of\_interest"]), "N/A") # Get the first type of the place, excluding "food" and "point\_of\_interest"
place\_rating = place\_details.get("rating", "N/A") # Get the rating of the place
total\_ratings = place\_details.get("user\_ratings\_total", "N/A") # Get the total number of ratings
place\_address = place\_details.get("vicinity", "N/A") # Get the vicinity of the place
if ',' in place\_address: # If the address contains a comma
street\_address = place\_address.split(',')[0] # Split by comma and keep only the first part
else:
street\_address = place\_address
# Prepare the output string for this place
place\_info = f"{place\_name} is a {place\_types} located at {street\_address}. It has a rating of {place\_rating} based on {total\_ratings} user reviews."
places.append(place\_info)
return places
else:
print(f"Google Places API request failed with status code {response.status\_code}")
print(f"Response content: {response.content}") # print out the response content for debugging
return []
except Exception as e:
print(f"Error during the Google Places API call: {e}")
return []`
```
## Generating user-specific recommendations with GPT-3.5-Turbo and Google Places API
The function `provide\_user\_specific\_recommendations` interacts with GPT-3.5-Turbo and the Google Places API to provide responses tailored to a user’s preferences and location.
First, it fetches the customer’s profile using their `user\_id`. If no profile is found, it returns an error message.
With a valid profile, it extracts the customer’s food preferences and then interacts with the OpenAI model. It provides an initial system message, giving context to the AI model about its role, user preferences, and the usage of the Google Places API function.
The user input is also sent to the model as a message, and the function `call\_google\_places\_api` is defined in the `functions` parameter for the AI model to call as needed.
Finally, it processes the model’s response. If the model makes a function call to the Google Places API, the function is executed with the appropriate arguments, and the names of nearby places are returned. If there are no such places or the request isn’t understood, appropriate error messages are returned.
```
`def provide\_user\_specific\_recommendations(user\_input, user\_id):
customer\_profile = fetch\_customer\_profile(user\_id)
if customer\_profile is None:
return "I couldn't find your profile. Could you please verify your user ID?"
customer\_profile\_str = json.dumps(customer\_profile)
food\_preference = customer\_profile.get('preferences', {}).get('food', [])[0] if customer\_profile.get('preferences', {}).get('food') else None
response = client.chat.completions.create(
model="gpt-3.5-turbo",
messages=[
{
"role": "system",
"content": f"You are a sophisticated AI assistant, a specialist in user intent detection and interpretation. Your task is to perceive and respond to the user's needs, even when they're expressed in an indirect or direct manner. You excel in recognizing subtle cues: for example, if a user states they are 'hungry', you should assume they are seeking nearby dining options such as a restaurant or a cafe. If they indicate feeling 'tired', 'weary', or mention a long journey, interpret this as a request for accommodation options like hotels or guest houses. However, remember to navigate the fine line of interpretation and assumption: if a user's intent is unclear or can be interpreted in multiple ways, do not hesitate to politely ask for additional clarification. Make sure to tailor your responses to the user based on their preferences and past experiences which can be found here {customer\_profile\_str}"
},
{"role": "user", "content": user\_input}
],
temperature=0,
tools=[
{
"type": "function",
"function" : {
"name": "call\_google\_places\_api",
"description": "This function calls the Google Places API to find the top places of a specified type near a specific location. It can be used when a user expresses a need (e.g., feeling hungry or tired) or wants to find a certain type of place (e.g., restaurant or hotel).",
"parameters": {
"type": "object",
"properties": {
"place\_type": {
"type": "string",
"description": "The type of place to search for."
}
}
},
"result": {
"type": "array",
"items": {
"type": "string"
}
}
}
}
],
)
print(response.choices[0].message.tool\_calls)
if response.choices[0].finish\_reason=='tool\_calls':
function\_call = response.choices[0].message.tool\_calls[0].function
if function\_call.name == "call\_google\_places\_api":
place\_type = json.loads(function\_call.arguments)["place\_type"]
places = call\_google\_places\_api(user\_id, place\_type, food\_preference)
if places: # If the list of places is not empty
return f"Here are some places you might be interested in: {' '.join(places)}"
else:
return "I couldn't find any places of interest nearby."
return "I am sorry, but I could not understand your request."`
```
## Executing user-specific recommendations
Upon execution, the function fetches the user’s profile, interacts with the AI model, processes the model’s response, calls the Google Places API if necessary, and ultimately returns a list of recommendations tailored to the user’s preferences and location. The printed output would consist of these personalized recommendations.
```
`user\_id = "user1234"
user\_input = "I'm hungry"
output = provide\_user\_specific\_recommendations(user\_input, user\_id)
print(output)`
```
```
`[ChatCompletionMessageToolCall(id='call\_Q1mXIi7D6GhobfE4tkruX7nB', function=Function(arguments='{\\n "place\_type": "restaurant"\\n}', name='call\_google\_places\_api'), type='function')]
Here are some places you might be interested in: Sotto Mare is a restaurant located at 552 Green Street. It has a rating of 4.6 based on 3765 user reviews. Mona Lisa Restaurant is a restaurant located at 353 Columbus Avenue #3907. It has a rating of 4.4 based on 1888 user reviews.`
```