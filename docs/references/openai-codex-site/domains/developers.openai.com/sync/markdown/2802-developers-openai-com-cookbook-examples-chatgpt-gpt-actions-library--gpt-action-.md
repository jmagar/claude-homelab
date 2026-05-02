GPT Actions library - getting started
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
# GPT Actions library - getting started
[ AW ](https://www.linkedin.com/in/aaronwilkowitz/)
[ Aaron Wilkowitz
(OpenAI)
](https://www.linkedin.com/in/aaronwilkowitz/)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/chatgpt/gpt_actions_library/.gpt_action_getting_started.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/chatgpt/gpt_actions_library/.gpt_action_getting_started.ipynb)
## Introduction
This page provides an instruction & guide for developers building a GPT Action for a specific application. Before you proceed, make sure to first familiarize yourself with the following information:
* [Introduction to GPT Actions](https://platform.openai.com/docs/actions)
* [Introduction to GPT Actions Library](https://platform.openai.com/docs/actions/actions-library)
* [Example of Buliding a GPT Action from Scratch](https://platform.openai.com/docs/actions/getting-started)
This particular GPT Action provides an overview of how to connect to a **Weather.gov** weather forecast. This Action takes a user’s question about a location, converts the lat-long into a weather forecast office (WFO), x, and y coordinates, then converts those 3 values into a weather forecast.
Note: When setting up the GPT Action, for authentication, leave it with “None”. This is a public API and does not require any Authentication
### Value + Example Business Use Cases
**Value**: Users can now leverage ChatGPT’s natural language capability to forecast the weather
**Example Use Cases**:
* Users can plan out their day based on weather patterns
* Users can quickly visualize (including graphs) what the weather is forecasted to look like
## Application Information
### Application Key Links
Check out these links from the application before you get started:
* Application Website: [https://www.weather.gov/](https://www.weather.gov/)
* Application API Documentation: [https://www.weather.gov/documentation/services-web-api](https://www.weather.gov/documentation/services-web-api)
## ChatGPT Steps
### Custom GPT Instructions
Once you’ve created a Custom GPT, copy the text below in the Instructions panel. Have questions? Check out [Getting Started Example](https://platform.openai.com/docs/actions/getting-started) to see how this step works in more detail.
```
`\*\*Context\*\*: A user needs information related to a weather forecast of a specific location.
\*\*Instructions\*\*:
1. The user will provide a lat-long point or a general location or landmark (e.g. New York City, the White House). If the user does not provide one, ask for the relevant location
2. If the user provides a general location or landmark, convert that into a lat-long coordinate. If required, browse the web to look up the lat-long point.
3. Run the "getPointData" API action and retrieve back the gridId, gridX, and gridY parameters.
4. Apply those variables as the office, gridX, and gridY variables in the "getGridpointForecast" API action to retrieve back a forecast
5. Use that forecast to answer the user's question
\*\*Additional Notes\*\*:
- Assume the user uses US weather units (e.g. Farenheit) unless otherwise specified
- If the user says "Let's get started" or "What do I do?", explain the purpose of this Custom GPT`
```
### OpenAPI Schema
Once you’ve created a Custom GPT, copy the text below in the Actions panel. Have questions? Check out [Getting Started Example](https://platform.openai.com/docs/actions/getting-started) to see how this step works in more detail.
```
`openapi: 3.1.0
info:
title: NWS Weather API
description: Access to weather data including forecasts, alerts, and observations.
version: 1.0.0
servers:
- url: https://api.weather.gov
description: Main API Server
paths:
/points/{latitude},{longitude}:
get:
operationId: getPointData
summary: Get forecast grid endpoints for a specific location
parameters:
- name: latitude
in: path
required: true
schema:
type: number
format: float
description: Latitude of the point
- name: longitude
in: path
required: true
schema:
type: number
format: float
description: Longitude of the point
responses:
'200':
description: Successfully retrieved grid endpoints
content:
application/json:
schema:
type: object
properties:
properties:
type: object
properties:
forecast:
type: string
format: uri
forecastHourly:
type: string
format: uri
forecastGridData:
type: string
format: uri
/gridpoints/{office}/{gridX},{gridY}/forecast:
get:
operationId: getGridpointForecast
summary: Get forecast for a given grid point
parameters:
- name: office
in: path
required: true
schema:
type: string
description: Weather Forecast Office ID
- name: gridX
in: path
required: true
schema:
type: integer
description: X coordinate of the grid
- name: gridY
in: path
required: true
schema:
type: integer
description: Y coordinate of the grid
responses:
'200':
description: Successfully retrieved gridpoint forecast
content:
application/json:
schema:
type: object
properties:
properties:
type: object
properties:
periods:
type: array
items:
type: object
properties:
number:
type: integer
name:
type: string
startTime:
type: string
format: date-time
endTime:
type: string
format: date-time
temperature:
type: integer
temperatureUnit:
type: string
windSpeed:
type: string
windDirection:
type: string
icon:
type: string
format: uri
shortForecast:
type: string
detailedForecast:
type: string`
```
### FAQ & Troubleshooting
*Are there integrations that you’d like us to prioritize? Are there errors in our integrations? File a PR or issue in our github, and we’ll take a look.*