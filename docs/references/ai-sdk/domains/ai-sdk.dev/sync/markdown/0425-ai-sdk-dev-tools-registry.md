AI SDK Tools Registry
[](https://vercel.com/oss)
Menu
# Tools Registry
Add powerful functionality to your agents with just a few lines of code. These pre-made tools provide everything from web search to extraction and more.
[
Code Execution
Execute Python code in a sandboxed environment using Vercel Sandbox. Run calculations, data processing, and other computational tasks safely in an isolated environment with Python 3.13.
code-executionsandbox
](/tools-registry/code-execution)[
Exa
Exa is a web search API that adds web search capabilities to your LLMs. Exa can search the web for code docs, current information, news, articles, and a lot more. Exa performs real-time web searches and can get page content from specific URLs. Add Exa web search tool to your LLMs in just a few lines of code.
searchwebextraction
](/tools-registry/exa)[
Parallel
Parallel gives AI agents best-in-class tools to search and extract context from the web. Web results returned by Parallel are compressed for optimal token efficiency at inference time.
searchwebextraction
](/tools-registry/parallel)[
ctx-zip
Transform MCP tools and AI SDK tools into code, write it to a Vercel sandbox file system and have the agent import the tools, write code, and execute it.
code-executionsandboxmcpcode-mode
](/tools-registry/ctx-zip)[
Perplexity Search
Search the web with real-time results and advanced filtering powered by Perplexity's Search API. Provides ranked search results with domain, language, date range, and recency filters. Supports multi-query searches and regional search results.
searchweb
](/tools-registry/perplexity-search)[
Tavily
Tavily is a web intelligence platform offering real-time web search optimized for AI applications. Tavily provides comprehensive web research capabilities including search, content extraction, website crawling, and site mapping to power AI agents with current information.
searchextractcrawl
](/tools-registry/tavily)[
Firecrawl
Firecrawl tools for the AI SDK. Web scraping, search, crawling, and data extraction for AI applications. Scrape any website into clean markdown, search the web, crawl entire sites, and extract structured data.
scrapingsearchcrawlingextractionweb
](/tools-registry/firecrawl)[
Amazon Bedrock AgentCore
Fully managed Browser and Code Interpreter tools for AI agents. Browser is a fast and secure cloud-based runtime for interacting with web applications, filling forms, navigating websites, and extracting information. Code Interpreter provides an isolated sandbox for executing Python, JavaScript, and TypeScript code to solve complex tasks.
code-executionbrowser-automationsandbox
](/tools-registry/bedrock-agentcore)[
Superagent
AI security guardrails for your LLMs. Protect your AI apps from prompt injection, redact PII/PHI (SSNs, emails, phone numbers), and verify claims against source materials. Add security tools to your LLMs in just a few lines of code.
securityguardrailspiiprompt-injectionverification
](/tools-registry/superagent)[
Tako Search
Search Tako's knowledge base for data visualizations, insights, and well-sourced information with charts and analytics.
searchdatavisualizationanalytics
](/tools-registry/tako-search)[
Valyu
Valyu provides powerful search tools for AI agents. Web search for real-time information, plus specialized domain-specific searchtools: financeSearch (stock prices, earnings, income statements, cash flows, etc), paperSearch (full-text PubMed, arXiv, bioRxiv, medRxiv), bioSearch (clinical trials, FDA drug labels, PubMed, medRxiv, bioRxiv), patentSearch (USPTO patents), secSearch (10-k/10-Q/8-k), economicsSearch (BLS, FRED, World Bank data), and companyResearch (comprehensive company research reports).
searchwebdomain-search
](/tools-registry/valyu)[
Airweave
Airweave is an open-source platform that makes any app searchable for your agent. Sync and search across 35+ data sources (Notion, Slack, Google Drive, databases, and more) with semantic search. Add unified search across all your connected data to your AI applications in just a few lines of code.
searchragdata-sourcessemantic-search
](/tools-registry/airweave)[
bash-tool
Provides bash, readFile, and writeFile tools for AI agents. Supports @vercel/sandbox for full VM isolation.
bashfile-systemsandboxcode-execution
](/tools-registry/bash-tool)[
Browserbase
Browserbase provides browser automation tools for AI agents powered by Stagehand. Navigate websites, take screenshots, click buttons, fill forms, extract structured data, and execute multi-step browser tasks in cloud-hosted sessions with built-in CAPTCHA solving and anti-bot stealth mode.
browserbrowser-automationwebextraction
](/tools-registry/browserbase)
## Build your own tools
Package your functionality and share it with others. Build custom tools that anyone can add to their agent in just a few lines of code.
[View template](https://github.com/vercel-labs/ai-sdk-tool-as-package-template)[Submit your tool](https://github.com/vercel/ai/blob/main/content/tools-registry/registry.ts)