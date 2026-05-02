How Pariti Doubled Its Fill Rate with Qdrant
0
# How Pariti Doubled Its Fill Rate with Qdrant
Daniel Azoulai
&#183;
May 01, 2025
* [Home](https://qdrant.tech/)
* /
* [Blog](https://qdrant.tech/blog/)
* /
* How Pariti Doubled Its Fill Rate with Qdrant
On this page:
* [
Share on X](<https://twitter.com/intent/tweet?url=https://qdrant.tech/blog/case-study-pariti/&amp;text=How Pariti Doubled Its Fill Rate with Qdrant>)
* [
Share on LinkedIn](https://www.linkedin.com/sharing/share-offsite/?url=https://qdrant.tech/blog/case-study-pariti/)
## From Manual Bottlenecks to Millisecond Matching: Connecting Africa’s Best Talent
Pariti’s mission is bold: connect Africa’s best talent with the continent’s most-promising startups—fast. Its referral-driven marketplace lets anyone nominate a great candidate, but viral growth triggered an avalanche of data. A single job post now attracts more than 300 applicants within 72 hours, yet Pariti still promises clients an interview-ready shortlist inside those same five days.
By 2023 the strain was obvious. Analysts spent four minutes vetting each résumé and frequently worked through 400+ candidate backlogs. As fatigue set in, strong profiles buried near the bottom went unseen. Meanwhile, roughly 70,000 historical candidates sat idle because there was no practical way to resurface them. Fill-rate plateaued at just 20 percent.
### A Laptop Experiment Shows the Way
Data Scientist Chiara Stramaccioni built a quick Python script on her laptop: encode the text requirements of a new role, embed every candidate’s experience, compare vectors, and rank the results. Quality looked excellent, but each query took half a minute of local compute, and only Chiara could run it. The prototype proved feasibility, but it did not solve scale.
### Dropping Qdrant into Production
Engineering Lead Elvis Moraa needed a production-grade vector database that could ship immediately and stay out of the team’s way. He chose Qdrant Cloud for three pragmatic reasons:
1. Zero-ops deployment—a managed cluster spun up in minutes with regional hosting on Google Cloud, keeping latency low.
2. An intuitive Python SDK—analysts could call it as easily as Pandas, without wrestling with Kafka or index-tuning ceremonies.
3. Clear documentation to move from “Hello, vectors” to a live integration in a single afternoon.
Pariti ingested the entire 70,000-candidate corpus, and a lightweight back-end now creates embeddings the moment new data arrives. Queries travel over HTTP and come back in between 22 and 40 milliseconds with 0 percent downtime since launch.
### What the Workflow Looks Like Today
Hiring analysts open an internal web app, paste or tweak the role description, and adjust sliders that weight features such as industry expertise or publication history. The app hits Qdrant, which returns a ranked shortlist instantly. Because the vectors already sit in memory, each retrieval saves an average of 34 seconds compared with the old monthly-refreshed pickle file.
Every recommendation still gets a human glance, but that glance is now brief: vetting time has fallen from four minutes to one minute per candidate—a 70 percent reduction. When a new vacancy closely resembles past roles, the analysts skip manual sourcing almost entirely. They refine the filters, review the top suggestions, and send them onward. For these “database finds”, 24 percent of candidates make it to interviews, quadruple the 6 percent success rate of traditional channels.
Accuracy remains the north star. Pariti defines “true high performers” as applicants who ultimately receive an offer from a client. Over the past quarter 94 percent of those winners were already sitting in the application’s top decile, giving hiring managers near-perfect confidence that they are seeing the best talent first.
### Better search results = more hires
* Fill-rate soared from 20 percent to 48 percent, and Pariti now averages eight successful placements every month, sustaining a vacancy-fill rate comfortably above 40 percent.
* Analysts reclaimed entire workdays each week; instead of drowning in résumé triage, they spend time coaching clients and candidates.
* The platform handles 100-plus searches per day without breaking a sweat, and has logged zero unplanned outages since migrating to Qdrant.
“Qdrant is the last thing I worry about breaking.” — Elvis Moraa, Engineering Lead, Pariti
### The Road Ahead
The team is productising the tool as a customer-facing portal. Hiring managers will tune ranking sliders themselves and watch shortlists refresh in real time. To meet the coming spike in traffic, Pariti is evaluating GPU-assisted indexing and vector quantization—features already built into Qdrant—while keeping costs in line with the challenging realities of many African startup budgets.
What began as an after–hours experiment on a single laptop has become the backbone of a talent marketplace that moves at startup speed. With Qdrant handling the heavy lifting in 22 milliseconds, Pariti can focus on its real job: unlocking opportunity.
### Get Started with Qdrant Free
[Get Started](https://cloud.qdrant.io/signup)
Up!