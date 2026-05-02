Agno - Qdrant
* [Documentation](https://qdrant.tech/documentation/)
*
* [Frameworks](https://qdrant.tech/documentation/frameworks/)
*
* Agno# Agno
[Agno](https://github.com/agno-agi/agno) is an incredibly fast multi-agent framework, runtime and UI. It enables you to build multi-agent systems with memory, knowledge, human-in-the-loop capabilities, and Model Context Protocol (MCP) support.
You can orchestrate agents as multi-agent teams (providing more autonomy) or step-based agentic workflows (offering more control). Agno works seamlessly with Qdrant as a vector database for knowledge bases, enabling efficient storage and retrieval of information for your AI agents.
Agno supports both synchronous and asynchronous operations, making it flexible for various use cases and deployment scenarios.
## Usage
* Install the required dependencies
```
`pip install agno qdrant-client
`
```
* Set up environment variables for Qdrant connection
```
`export QDRANT\_API\_KEY="\<your-qdrant-api-key\>"
export QDRANT\_URL="\<your-qdrant-url\>"
`
```
* Create an agent with Qdrant knowledge base
```
`import os
from agno.agent import Agent
from agno.knowledge.knowledge import Knowledge
from agno.vectordb.qdrant import Qdrant
# Configure Qdrant vector database
api\_key = os.getenv("QDRANT\_API\_KEY")
qdrant\_url = os.getenv("QDRANT\_URL")
COLLECTION\_NAME = "my-knowledge-base"
vector\_db = Qdrant(
collection=COLLECTION\_NAME,
url=qdrant\_url,
# or you can just url="http://localhost:6333"
api\_key=api\_key, # (optional)
)
# Create a knowledge base with Qdrant
knowledge\_base = Knowledge(
vector\_db=vector\_db,
)
# Add content to the knowledge base
knowledge\_base.add\_content(
url="https://example.com/document.pdf"
)
# Create an agent with the knowledge base
agent = Agent(
knowledge=knowledge\_base,
debug\_mode=True,
)
# Use the agent
response = agent.print\_response("What information do you have?")
`
```
## Further Reading
* [Agno Documentation](https://docs.agno.com/introduction)
* [Qdrant integration with Agno](https://docs.agno.com/integrations/vectordb/qdrant/overview)
* [Qdrant Asynchronous](https://docs.agno.com/integrations/vectordb/qdrant/usage/async-qdrant-db)
* [Agno GitHub Repository](https://github.com/agno-agi/agno)
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/frameworks/agno.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/frameworks/agno/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/frameworks/agno.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)