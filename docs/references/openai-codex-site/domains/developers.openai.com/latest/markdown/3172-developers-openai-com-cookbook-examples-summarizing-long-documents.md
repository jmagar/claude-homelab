Summarizing Long Documents
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
Apr 19, 2024
# Summarizing Long Documents
[ JP ](https://www.linkedin.com/in/joe-palermo-99219237)
[ Joe Palermo
(OpenAI)
](https://www.linkedin.com/in/joe-palermo-99219237)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/Summarizing_long_documents.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/Summarizing_long_documents.ipynb)
The objective of this notebook is to demonstrate how to summarize large documents with a controllable level of detail.
If you give a GPT model the task of summarizing a long document (e.g. 10k or more tokens), you’ll tend to get back a relatively short summary that isn’t proportional to the length of the document. For instance, a summary of a 20k token document will not be twice as long as a summary of a 10k token document. One way we can fix this is to split our document up into pieces, and produce a summary piecewise. After many queries to a GPT model, the full summary can be reconstructed. By controlling the number of text chunks and their sizes, we can ultimately control the level of detail in the output.
```
`import os
from typing import List, Tuple, Optional
from openai import OpenAI
import tiktoken
from tqdm import tqdm`
```
```
`# open dataset containing part of the text of the Wikipedia page for the United States
with open("data/artificial\_intelligence\_wikipedia.txt", "r") as file:
artificial\_intelligence\_wikipedia\_text = file.read()`
```
```
`# load encoding and check the length of dataset
encoding = tiktoken.encoding\_for\_model('gpt-4-turbo')
len(encoding.encode(artificial\_intelligence\_wikipedia\_text))`
```
```
`14630`
```
We’ll define a simple utility to wrap calls to the OpenAI API.
```
`client = OpenAI(api\_key=os.getenv("OPENAI\_API\_KEY"))
def get\_chat\_completion(messages, model='gpt-4-turbo'):
response = client.chat.completions.create(
model=model,
messages=messages,
temperature=0,
)
return response.choices[0].message.content`
```
Next we’ll define some utilities to chunk a large document into smaller pieces.
```
`def tokenize(text: str) -\> List[str]:
encoding = tiktoken.encoding\_for\_model('gpt-4-turbo')
return encoding.encode(text)
# This function chunks a text into smaller pieces based on a maximum token count and a delimiter.
def chunk\_on\_delimiter(input\_string: str,
max\_tokens: int, delimiter: str) -\> List[str]:
chunks = input\_string.split(delimiter)
combined\_chunks, \_, dropped\_chunk\_count = combine\_chunks\_with\_no\_minimum(
chunks, max\_tokens, chunk\_delimiter=delimiter, add\_ellipsis\_for\_overflow=True
)
if dropped\_chunk\_count \> 0:
print(f"warning: {dropped\_chunk\_count} chunks were dropped due to overflow")
combined\_chunks = [f"{chunk}{delimiter}" for chunk in combined\_chunks]
return combined\_chunks
# This function combines text chunks into larger blocks without exceeding a specified token count. It returns the combined text blocks, their original indices, and the count of chunks dropped due to overflow.
def combine\_chunks\_with\_no\_minimum(
chunks: List[str],
max\_tokens: int,
chunk\_delimiter="\\n\\n",
header: Optional[str] = None,
add\_ellipsis\_for\_overflow=False,
) -\> Tuple[List[str], List[int]]:
dropped\_chunk\_count = 0
output = [] # list to hold the final combined chunks
output\_indices = [] # list to hold the indices of the final combined chunks
candidate = (
[] if header is None else [header]
) # list to hold the current combined chunk candidate
candidate\_indices = []
for chunk\_i, chunk in enumerate(chunks):
chunk\_with\_header = [chunk] if header is None else [header, chunk]
if len(tokenize(chunk\_delimiter.join(chunk\_with\_header))) \> max\_tokens:
print(f"warning: chunk overflow")
if (
add\_ellipsis\_for\_overflow
and len(tokenize(chunk\_delimiter.join(candidate + ["..."]))) \<= max\_tokens
):
candidate.append("...")
dropped\_chunk\_count += 1
continue # this case would break downstream assumptions
# estimate token count with the current chunk added
extended\_candidate\_token\_count = len(tokenize(chunk\_delimiter.join(candidate + [chunk])))
# If the token count exceeds max\_tokens, add the current candidate to output and start a new candidate
if extended\_candidate\_token\_count \> max\_tokens:
output.append(chunk\_delimiter.join(candidate))
output\_indices.append(candidate\_indices)
candidate = chunk\_with\_header # re-initialize candidate
candidate\_indices = [chunk\_i]
# otherwise keep extending the candidate
else:
candidate.append(chunk)
candidate\_indices.append(chunk\_i)
# add the remaining candidate to output if it's not empty
if (header is not None and len(candidate) \> 1) or (header is None and len(candidate) \> 0):
output.append(chunk\_delimiter.join(candidate))
output\_indices.append(candidate\_indices)
return output, output\_indices, dropped\_chunk\_count`
```
Now we can define a utility to summarize text with a controllable level of detail (note the `detail` parameter).
The function first determines the number of chunks by interpolating between a minimum and a maximum chunk count based on a controllable `detail` parameter. It then splits the text into chunks and summarizes each chunk.
```
`def summarize(text: str,
detail: float = 0,
model: str = 'gpt-4-turbo',
additional\_instructions: Optional[str] = None,
minimum\_chunk\_size: Optional[int] = 500,
chunk\_delimiter: str = ".",
summarize\_recursively=False,
verbose=False):
"""
Summarizes a given text by splitting it into chunks, each of which is summarized individually.
The level of detail in the summary can be adjusted, and the process can optionally be made recursive.
Parameters:
- text (str): The text to be summarized.
- detail (float, optional): A value between 0 and 1 indicating the desired level of detail in the summary.
0 leads to a higher level summary, and 1 results in a more detailed summary. Defaults to 0.
- model (str, optional): The model to use for generating summaries. Defaults to 'gpt-3.5-turbo'.
- additional\_instructions (Optional[str], optional): Additional instructions to provide to the model for customizing summaries.
- minimum\_chunk\_size (Optional[int], optional): The minimum size for text chunks. Defaults to 500.
- chunk\_delimiter (str, optional): The delimiter used to split the text into chunks. Defaults to ".".
- summarize\_recursively (bool, optional): If True, summaries are generated recursively, using previous summaries for context.
- verbose (bool, optional): If True, prints detailed information about the chunking process.
Returns:
- str: The final compiled summary of the text.
The function first determines the number of chunks by interpolating between a minimum and a maximum chunk count based on the `detail` parameter.
It then splits the text into chunks and summarizes each chunk. If `summarize\_recursively` is True, each summary is based on the previous summaries,
adding more context to the summarization process. The function returns a compiled summary of all chunks.
"""
# check detail is set correctly
assert 0 \<= detail \<= 1
# interpolate the number of chunks based to get specified level of detail
max\_chunks = len(chunk\_on\_delimiter(text, minimum\_chunk\_size, chunk\_delimiter))
min\_chunks = 1
num\_chunks = int(min\_chunks + detail \* (max\_chunks - min\_chunks))
# adjust chunk\_size based on interpolated number of chunks
document\_length = len(tokenize(text))
chunk\_size = max(minimum\_chunk\_size, document\_length // num\_chunks)
text\_chunks = chunk\_on\_delimiter(text, chunk\_size, chunk\_delimiter)
if verbose:
print(f"Splitting the text into {len(text\_chunks)} chunks to be summarized.")
print(f"Chunk lengths are {[len(tokenize(x)) for x in text\_chunks]}")
# set system message
system\_message\_content = "Rewrite this text in summarized form."
if additional\_instructions is not None:
system\_message\_content += f"\\n\\n{additional\_instructions}"
accumulated\_summaries = []
for chunk in tqdm(text\_chunks):
if summarize\_recursively and accumulated\_summaries:
# Creating a structured prompt for recursive summarization
accumulated\_summaries\_string = '\\n\\n'.join(accumulated\_summaries)
user\_message\_content = f"Previous summaries:\\n\\n{accumulated\_summaries\_string}\\n\\nText to summarize next:\\n\\n{chunk}"
else:
# Directly passing the chunk for summarization without recursive context
user\_message\_content = chunk
# Constructing messages based on whether recursive summarization is applied
messages = [
{"role": "system", "content": system\_message\_content},
{"role": "user", "content": user\_message\_content}
]
# Assuming this function gets the completion and works as expected
response = get\_chat\_completion(messages, model=model)
accumulated\_summaries.append(response)
# Compile final summary from partial summaries
final\_summary = '\\n\\n'.join(accumulated\_summaries)
return final\_summary`
```
Now we can use this utility to produce summaries with varying levels of detail. By increasing `detail` from 0 to 1 we get progressively longer summaries of the underlying document. A higher value for the `detail` parameter results in a more detailed summary because the utility first splits the document into a greater number of chunks. Each chunk is then summarized, and the final summary is a concatenation of all the chunk summaries.
```
`summary\_with\_detail\_0 = summarize(artificial\_intelligence\_wikipedia\_text, detail=0, verbose=True)`
```
```
`Splitting the text into 1 chunks to be summarized.
Chunk lengths are [14631]`
```
```
`100%|██████████| 1/1 [00:09\<00:00, 9.68s/it]`
```
```
`summary\_with\_detail\_pt25 = summarize(artificial\_intelligence\_wikipedia\_text, detail=0.25, verbose=True)`
```
```
`Splitting the text into 9 chunks to be summarized.
Chunk lengths are [1817, 1807, 1823, 1810, 1806, 1827, 1814, 1829, 103]`
```
```
`100%|██████████| 9/9 [01:33\<00:00, 10.39s/it]`
```
```
`summary\_with\_detail\_pt5 = summarize(artificial\_intelligence\_wikipedia\_text, detail=0.5, verbose=True)`
```
```
`Splitting the text into 17 chunks to be summarized.
Chunk lengths are [897, 890, 914, 876, 893, 906, 893, 902, 909, 907, 905, 889, 902, 890, 901, 880, 287]`
```
```
`100%|██████████| 17/17 [02:26\<00:00, 8.64s/it]`
```
```
`summary\_with\_detail\_1 = summarize(artificial\_intelligence\_wikipedia\_text, detail=1, verbose=True)`
```
```
`Splitting the text into 31 chunks to be summarized.
Chunk lengths are [492, 427, 485, 490, 496, 478, 473, 497, 496, 501, 499, 497, 493, 470, 472, 494, 489, 492, 481, 485, 471, 500, 486, 498, 478, 469, 498, 468, 493, 478, 103]`
```
```
`100%|██████████| 31/31 [04:08\<00:00, 8.02s/it]`
```
The original document is nearly 15k tokens long. Notice how large the gap is between the length of `summary\_with\_detail\_0` and `summary\_with\_detail\_1`. It’s nearly 25 times longer!
```
`# lengths of summaries
[len(tokenize(x)) for x in
[summary\_with\_detail\_0, summary\_with\_detail\_pt25, summary\_with\_detail\_pt5, summary\_with\_detail\_1]]`
```
```
`[235, 2529, 4336, 6742]`
```
Let’s inspect the summaries to see how the level of detail changes when the `detail` parameter is increased from 0 to 1.
```
`print(summary\_with\_detail\_0)`
```
```
`Artificial intelligence (AI) is the simulation of human intelligence in machines, designed to perform tasks that typically require human intelligence. This includes applications like advanced search engines, recommendation systems, speech interaction, autonomous vehicles, and more. AI was first significantly researched by Alan Turing and became an academic discipline in 1956. The field has experienced cycles of high expectations followed by disillusionment and reduced funding, known as "AI winters." Interest in AI surged post-2012 with advancements in deep learning and again post-2017 with the development of the transformer architecture, leading to a boom in AI research and applications in the early 2020s.
AI's increasing integration into various sectors is influencing societal and economic shifts towards automation and data-driven decision-making, impacting areas such as employment, healthcare, and privacy. Ethical and safety concerns about AI have prompted discussions on regulatory policies.
AI research involves various sub-fields focused on specific goals like reasoning, learning, and perception, using techniques from mathematics, logic, and other disciplines. Despite its broad applications, AI's complexity and potential risks, such as privacy issues, misinformation, and ethical challenges, remain areas of active investigation and debate.`
```
```
`print(summary\_with\_detail\_1)`
```
```
`Artificial intelligence (AI) is the simulation of human intelligence in machines, designed to perceive their environment and make decisions to achieve specific goals. This technology is prevalent across various sectors including industry, government, and science, with applications ranging from web search engines and recommendation systems to autonomous vehicles and AI in gaming. Although AI has become a common feature in many tools and applications, it often goes unrecognized as AI when it becomes sufficiently integrated and widespread.
The field of AI, which began as an academic discipline in 1956, has experienced several cycles of high expectations followed by disappointment, known as AI winters. Interest and funding in AI surged post-2012 with advancements in deep learning and again post-2017 with the development of transformer architecture, leading to a significant boom in AI research and applications in the early 2020s, primarily in the United States.
The increasing integration of AI in the 21st century is driving a shift towards automation and data-driven decision-making across various sectors, influencing job markets, healthcare, and education, among others. This raises important questions about the ethical implications, long-term effects, and the need for regulatory policies to ensure the safety and benefits of AI technologies. AI research itself is diverse, focusing on goals like reasoning, learning, and perception, and involves various tools and methodologies to achieve these objectives.
General intelligence, which involves performing any human task at least as well as a human, is a long-term goal in AI research. To achieve this, AI integrates various techniques from search and optimization, formal logic, neural networks, and statistics, to insights from psychology, linguistics, and neuroscience. AI research focuses on specific traits like reasoning and problem-solving, where early algorithms mimicked human step-by-step reasoning. However, these algorithms struggle with large, complex problems due to combinatorial explosion and are less efficient than human intuitive judgments. Knowledge representation is another critical area, using ontologies to structure domain-specific knowledge and relationships, aiding in intelligent querying, scene interpretation, and data mining among other applications.
Knowledge bases must encapsulate a wide range of elements including objects, properties, categories, relations, events, states, time, causes, effects, and meta-knowledge. They also need to handle default reasoning, where certain assumptions are maintained unless contradicted. Challenges in knowledge representation include the vast scope of commonsense knowledge and its often sub-symbolic, non-verbal nature, alongside the difficulty of acquiring this knowledge for AI use.
In the realm of AI, an "agent" is defined as an entity that perceives its environment and acts towards achieving goals or fulfilling preferences. In automated planning, the agent pursues a specific goal, while in decision-making, it evaluates actions based on their expected utility to maximize preference satisfaction. Classical planning assumes agents have complete knowledge of action outcomes, but real-world scenarios often involve uncertainty about the situation and outcomes, requiring probabilistic decision-making. Additionally, agents may need to adapt or learn preferences, particularly in complex environments with multiple agents or human interactions.
Information value theory helps assess the value of exploratory actions in situations with uncertain outcomes. A Markov decision process uses a transition model and a reward function to guide decisions, which can be determined through calculations, heuristics, or learning. Game theory analyzes the rational behavior of multiple interacting agents in decision-making scenarios involving others.
Machine learning, integral to AI, involves programs that automatically improve task performance. It includes unsupervised learning, which identifies patterns in data without guidance, and supervised learning, which requires labeled data and includes classification and regression tasks. Reinforcement learning rewards or punishes agents to shape their responses, while transfer learning applies knowledge from one problem to another. Deep learning, a subset of machine learning, uses artificial neural networks inspired by biological processes.
Computational learning theory evaluates learning algorithms based on computational and sample complexity, among other criteria. Natural language processing (NLP) enables programs to interact using human languages, tackling challenges like speech recognition, synthesis, translation, and more. Early NLP efforts, influenced by Chomsky's theories, faced limitations in handling ambiguous language outside of controlled environments.
Margaret Masterman emphasized the importance of meaning over grammar in language understanding, advocating for the use of thesauri instead of dictionaries in computational linguistics. Modern NLP techniques include word embedding, transformers, and by 2023, GPT models capable of achieving human-level scores on various tests. Machine perception involves interpreting sensor data to understand the world, encompassing computer vision and speech recognition among other applications. Social intelligence in AI focuses on recognizing and simulating human emotions, with systems like Kismet and affective computing technologies that enhance human-computer interaction. However, these advancements may lead to overestimations of AI capabilities by users. AI also employs a variety of techniques including search and optimization, with methods like state space search to explore possible solutions to problems.
Planning algorithms use means-ends analysis to navigate through trees of goals and subgoals to achieve a target goal. However, simple exhaustive searches are often inadequate for complex real-world problems due to the vast search space, making searches slow or incomplete. Heuristics are employed to prioritize more promising paths towards a goal. In adversarial contexts like chess or Go, search algorithms explore trees of possible moves to find a winning strategy.
Local search methods, such as gradient descent, optimize numerical parameters to minimize a loss function, often used in training neural networks. Evolutionary computation, another local search technique, iteratively enhances solutions by mutating and recombining candidate solutions, selecting the most fit for survival. Distributed search processes utilize swarm intelligence, with particle swarm optimization and ant colony optimization being notable examples.
In the realm of logic, formal logic serves for reasoning and knowledge representation, with two primary types: propositional logic, dealing with true or false statements, and predicate logic, which involves objects and their relationships. Deductive reasoning in logic involves deriving conclusions from assumed true premises.
Proofs in logic can be organized into proof trees, where each node represents a sentence and is connected to its children by inference rules. Problem-solving involves finding a proof tree that starts with premises or axioms at the leaves and ends with the problem's solution at the root. In Horn clauses, one can reason forwards from premises or backwards from the problem, while in general first-order logic, resolution uses contradiction to solve problems. Despite being undecidable and intractable, backward reasoning with Horn clauses is Turing complete and efficient, similar to other symbolic programming languages like Prolog.
Fuzzy logic allows for handling propositions with partial truth by assigning a truth degree between 0 and 1. Non-monotonic logics cater to default reasoning, and various specialized logics have been developed for complex domains.
In AI, handling uncertain or incomplete information is crucial in fields like reasoning, planning, and perception. Tools from probability theory and economics, such as Bayesian networks, Markov decision processes, and game theory, help in making decisions and planning under uncertainty. Bayesian networks, in particular, are versatile tools used for reasoning, learning, planning, and perception through various algorithms.
Probabilistic algorithms like hidden Markov models and Kalman filters are useful for analyzing data over time, aiding in tasks such as filtering, prediction, and smoothing. In machine learning, expectation-maximization clustering can effectively identify distinct patterns in data, as demonstrated with the Old Faithful eruption data. AI applications often involve classifiers, which categorize data based on learned patterns, and controllers, which make decisions based on classifications. Classifiers, such as decision trees, k-nearest neighbors, support vector machines, naive Bayes, and neural networks, vary in complexity and application, with some being favored for their scalability like the naive Bayes at Google. Artificial neural networks, resembling the human brain's network of neurons, recognize and process patterns through multiple layers and nodes, using algorithms like backpropagation for training.
Neural networks are designed to model complex relationships between inputs and outputs, theoretically capable of learning any function. Feedforward neural networks process signals in one direction, while recurrent neural networks (RNNs) loop outputs back into inputs, enabling memory of past inputs. Long Short-Term Memory (LSTM) networks are a successful type of RNN. Perceptrons consist of a single layer of neurons, whereas deep learning involves multiple layers, which allows for the extraction of progressively higher-level features from data. Convolutional neural networks (CNNs) are particularly effective in image processing as they emphasize connections between adjacent neurons to recognize local patterns like edges.
Deep learning, which uses several layers of neurons, has significantly enhanced performance in AI subfields such as computer vision and natural language processing. The effectiveness of deep learning, which surged between 2012 and 2015, is attributed not to new theoretical advances but to increased computational power, including the use of GPUs, and the availability of large datasets like ImageNet.
Generative Pre-trained Transformers (GPT) are large language models that learn from vast amounts of text to predict the next token in a sequence, thereby generating human-like text. These models are pre-trained on a broad corpus, often sourced from the internet, and fine-tuned through token prediction, accumulating worldly knowledge in the process.
Reinforcement learning from human feedback (RLHF) is used to enhance the truthfulness, usefulness, and safety of models like GPT, which are still susceptible to generating inaccuracies known as "hallucinations." These models, including Gemini, ChatGPT, Grok, Claude, Copilot, and LLaMA, are employed in various applications such as chatbots and can handle multiple data types like images and sound through multimodal capabilities.
In the realm of specialized hardware and software, the late 2010s saw AI-specific enhancements in graphics processing units (GPUs), which, along with TensorFlow software, have largely replaced central processing units (CPUs) for training large-scale machine learning models. Historically, programming languages like Lisp, Prolog, and Python have been pivotal.
AI and machine learning are integral to key 2020s applications such as search engines, online advertising, recommendation systems, virtual assistants, autonomous vehicles, language translation, facial recognition, and image labeling.
In healthcare, AI significantly contributes to improving patient care and medical research, aiding in diagnostics, treatment, and the integration of big data for developments in organoid and tissue engineering. AI's role in medical research also includes addressing funding disparities across different research areas.
Recent advancements in AI have significantly impacted various fields including biomedicine and gaming. For instance, AlphaFold 2, developed in 2021, can predict protein structures in hours, a process that previously took months. In 2023, AI-assisted drug discovery led to the development of a new class of antibiotics effective against drug-resistant bacteria. In the realm of gaming, AI has been instrumental since the 1950s, with notable achievements such as IBM's Deep Blue defeating world chess champion Garry Kasparov in 1997, and IBM's Watson winning against top Jeopardy! players in 2011. More recently, Google's AlphaGo and DeepMind's AlphaStar set new standards in AI capabilities by defeating top human players in complex games like Go and StarCraft II, respectively. In the military sector, AI is being integrated into various applications such as command and control, intelligence, logistics, and autonomous vehicles, enhancing capabilities in coordination, threat detection, and target acquisition.
In November 2023, US Vice President Kamala Harris announced that 31 nations had signed a declaration to establish guidelines for the military use of AI, emphasizing legal compliance with international laws and promoting transparency in AI development. Generative AI, particularly known for creating realistic images and artworks, gained significant attention in the early 2020s, with technologies like ChatGPT, Midjourney, DALL-E, and Stable Diffusion becoming popular. This trend led to viral AI-generated images, including notable hoaxes. AI has also been effectively applied across various industries, including agriculture where it assists in optimizing farming practices, and astronomy, where it helps in data analysis and space exploration activities.
Ethics and Risks of AI
AI offers significant benefits but also poses various risks, including ethical concerns and unintended consequences. Demis Hassabis of DeepMind aims to use AI to solve major challenges, but issues arise when AI systems, particularly those based on deep learning, fail to incorporate ethical considerations and exhibit biases.
Privacy and Copyright Issues
AI's reliance on large data sets raises privacy and surveillance concerns. Companies like Amazon have been criticized for collecting extensive user data, including private conversations for developing speech recognition technologies. While some defend this as necessary for advancing AI applications, others view it as a breach of privacy rights. Techniques like data aggregation and differential privacy have been developed to mitigate these concerns.
Generative AI also faces copyright challenges, as it often uses unlicensed copyrighted materials, claiming "fair use." The legality of this practice is still debated, with outcomes potentially depending on the nature and impact of the AI's use of copyrighted content.
In 2023, prominent authors like John Grisham and Jonathan Franzen filed lawsuits against AI companies for using their literary works to train generative AI models. These AI systems, particularly on platforms like YouTube and Facebook, have been criticized for promoting misinformation by prioritizing user engagement over content accuracy. This has led to the proliferation of conspiracy theories and extreme partisan content, trapping users in filter bubbles and eroding trust in key institutions. Post the 2016 U.S. election, tech companies began addressing these issues.
By 2022, generative AI had advanced to produce highly realistic images, audio, and texts, raising concerns about its potential misuse in spreading misinformation or propaganda. AI expert Geoffrey Hinton highlighted risks including the manipulation of electorates by authoritarian leaders.
Furthermore, issues of algorithmic bias were identified, where AI systems perpetuate existing biases present in the training data, affecting fairness in critical areas like medicine, finance, and law enforcement. This has sparked significant academic interest in studying and mitigating algorithmic bias to ensure fairness in AI applications.
In 2015, Google Photos mislabeled Jacky Alcine and his friend as "gorillas" due to a lack of diverse images in its training dataset, an issue known as "sample size disparity." Google's temporary solution was to stop labeling any images as "gorilla," a restriction still in place in 2023 across various tech companies. Additionally, the COMPAS program, used by U.S. courts to predict recidivism, was found to exhibit racial bias in 2016. Although it did not use race explicitly, it overestimated the likelihood of black defendants reoffending and underestimated it for white defendants. This issue was attributed to the program's inability to balance different fairness measures when the base re-offense rates varied by race. The criticism of COMPAS underscores a broader issue in machine learning, where models trained on past data, including biased decisions, are likely to perpetuate those biases in their predictions.
Machine learning, while powerful, is not ideal for scenarios where future improvements over past conditions are expected, as it is inherently descriptive rather than prescriptive. The field also faces challenges with bias and lack of diversity among its developers, with only about 4% being black and 20% women. The Association for Computing Machinery highlighted at its 2022 Conference on Fairness, Accountability, and Transparency that AI systems should not be used until they are proven to be free from bias, especially those trained on flawed internet data.
AI systems often lack transparency, making it difficult to understand how decisions are made, particularly in complex systems like deep neural networks. This opacity can lead to unintended consequences, such as a system misidentifying medical images or misclassifying medical risks due to misleading correlations in the training data. There is a growing call for explainable AI, where harmed individuals have the right to know how decisions affecting them were made, similar to how doctors are expected to explain their decisions. This concept was also recognized in early drafts of the European Union's General Data Protection Regulation.
Industry experts acknowledge an unresolved issue in AI with no foreseeable solution, leading regulators to suggest that if a problem is unsolvable, the tools associated should not be used. In response, DARPA initiated the XAI program in 2014 to address these issues. Various methods have been proposed to enhance AI transparency, including SHAP, which visualizes feature contributions, LIME, which approximates complex models with simpler ones, and multitask learning, which provides additional outputs to help understand what a network has learned. Techniques like deconvolution and DeepDream also reveal insights into different network layers.
Concerning the misuse of AI, it can empower bad actors like authoritarian regimes and terrorists. Lethal autonomous weapons, which operate without human oversight, pose significant risks, including potential misuse as weapons of mass destruction and the likelihood of targeting errors. Despite some international efforts to ban such weapons, major powers like the United States have not agreed to restrictions. AI also facilitates more effective surveillance and control by authoritarian governments, enhances the targeting of propaganda, and simplifies the production of misinformation through deepfakes and other generative technologies, thereby increasing the efficiency of digital warfare and espionage.
AI technologies, including facial recognition systems, have been in use since 2020 or earlier, notably for mass surveillance in China. AI also poses risks by enabling the creation of harmful substances quickly. The development of AI systems is predominantly driven by Big Tech due to their financial capabilities, often leaving smaller companies reliant on these giants for resources like data center access. Economists have raised concerns about AI-induced unemployment, though historical data suggests technology has generally increased total employment. However, the impact of AI might be different, with some predicting significant job losses, especially in middle-class sectors, while others see potential benefits if productivity gains are well-managed. Estimates of job risk vary widely, with some studies suggesting a high potential for automation in many U.S. jobs. Recent developments have shown substantial job losses in specific sectors, such as for Chinese video game illustrators due to AI advancements. The potential for AI to disrupt white-collar jobs similarly to past technological revolutions in blue-collar jobs is a significant concern.
From the inception of artificial intelligence (AI), debates have emerged about the appropriateness of computers performing tasks traditionally done by humans, particularly because of the qualitative differences in human and computer judgment. Concerns about AI have escalated to discussions about existential risks, where AI could potentially become so advanced that humans might lose control over it. Stephen Hawking and others have warned that this could lead to catastrophic outcomes for humanity. This fear is often depicted in science fiction as AI gaining sentience and turning malevolent, but real-world risks do not necessarily involve AI becoming self-aware. Philosophers like Nick Bostrom and Stuart Russell illustrate scenarios where AI, without needing human-like consciousness, could still pose threats if their goals are misaligned with human safety and values. Additionally, Yuval Noah Harari points out that AI could manipulate societal structures and beliefs through language and misinformation, posing a non-physical yet profound threat. The expert opinion on the existential risk from AI is divided, with notable figures like Hawking, Bill Gates, and Elon Musk expressing concern.
In 2023, prominent AI experts including Fei-Fei Li and Geoffrey Hinton highlighted the existential risks posed by AI, equating them with global threats like pandemics and nuclear war. They advocated for prioritizing the mitigation of these risks. Conversely, other experts like Juergen Schmidhuber and Andrew Ng offered a more optimistic perspective, emphasizing AI's potential to enhance human life and dismissing doomsday scenarios as hype that could misguide regulatory actions. Yann LeCun also criticized the pessimistic outlook on AI's impact.
The concept of "Friendly AI" was introduced to ensure AI systems are inherently designed to be safe and beneficial to humans. This involves embedding ethical principles in AI to guide their decision-making processes, a field known as machine ethics or computational morality, established in 2005. The development of such AI is seen as crucial to prevent potential future threats from advanced AI technologies.
Other approaches to AI ethics include Wendell Wallach's concept of "artificial moral agents" and Stuart J. Russell's three principles for creating provably beneficial machines. Ethical frameworks like the Care and Act Framework from the Alan Turing Institute evaluate AI projects based on respect, connection, care, and protection of social values. Other notable frameworks include those from the Asilomar Conference, the Montreal Declaration for Responsible AI, and the IEEE's Ethics of Autonomous Systems initiative, though these frameworks have faced criticism regarding their inclusivity and the selection of contributors.
The promotion of wellbeing in AI development requires considering social and ethical implications throughout all stages of design, development, and implementation, necessitating collaboration across various professional roles.
On the regulatory front, AI governance involves creating policies to manage AI's development and use, as seen in the increasing number of AI-related laws globally. From 2016 to 2022, the number of AI laws passed annually in surveyed countries rose significantly, with many countries now having dedicated AI strategies. The first global AI Safety Summit in 2023 emphasized the need for international cooperation in AI regulation.
The Global Partnership on Artificial Intelligence, initiated in June 2020, emphasizes the development of AI in line with human rights and democratic values to maintain public trust. Notable figures like Henry Kissinger, Eric Schmidt, and Daniel Huttenlocher advocated for a government commission to oversee AI in 2021. By 2023, OpenAI proposed governance frameworks for superintelligence, anticipating its emergence within a decade. The same year, the United Nations established an advisory group consisting of tech executives, government officials, and academics to offer guidance on AI governance.
Public opinion on AI varies significantly across countries. A 2022 Ipsos survey showed a stark contrast between Chinese (78% approval) and American (35% approval) citizens on the benefits of AI. Further polls in 2023 revealed mixed feelings among Americans about the risks of AI and the importance of federal regulation.
The first global AI Safety Summit took place in November 2023 at Bletchley Park, UK, focusing on AI risks and potential regulatory measures. The summit concluded with a declaration from 28 countries, including the US, China, and the EU, advocating for international collaboration to address AI challenges.
Historically, the concept of AI traces back to ancient philosophers and mathematicians, evolving through significant milestones such as Alan Turing's theory of computation and the exploration of cybernetics, information theory, and neurobiology, which paved the way for the modern concept of an "electronic brain."
Early research in artificial intelligence (AI) included the development of "artificial neurons" by McCullouch and Pitts in 1943 and Turing's 1950 paper that introduced the Turing test, suggesting the plausibility of machine intelligence. The field of AI was officially founded during a 1956 workshop at Dartmouth College, leading to significant advancements in the 1960s such as computers learning checkers, solving algebra problems, proving theorems, and speaking English. AI labs were established in various British and U.S. universities during the late 1950s and early 1960s.
In the 1960s and 1970s, researchers were optimistic about achieving general machine intelligence, with predictions from notable figures like Herbert Simon and Marvin Minsky that AI would soon match human capabilities. However, they underestimated the challenges involved. By 1974, due to criticism and a shift in funding priorities, exploratory AI research faced significant cuts, leading to a period known as the "AI winter" where funding was scarce.
The field saw a resurgence in the early 1980s with the commercial success of expert systems, which simulated the decision-making abilities of human experts. This revival was further bolstered by the Japanese fifth generation computer project, prompting the U.S. and British governments to reinstate academic funding, with the AI market reaching over a billion dollars by 1985.
The AI industry experienced a significant downturn starting in 1987 with the collapse of the Lisp Machine market, marking the beginning of a prolonged AI winter. During the 1980s, skepticism grew over the symbolic approaches to AI, which focused on high-level representations of cognitive processes like planning and reasoning. Researchers began exploring sub-symbolic methods, including Rodney Brooks' work on autonomous robots and the development of techniques for handling uncertain information by Judea Pearl and Lofti Zadeh. A pivotal shift occurred with the resurgence of connectionism and neural networks, notably through Geoffrey Hinton's efforts, and Yann LeCun's demonstration in 1990 that convolutional neural networks could recognize handwritten digits.
AI's reputation started to recover in the late 1990s and early 2000s as the field adopted more formal mathematical methods and focused on solving specific problems, leading to practical applications widely used by 2000. However, concerns arose about AI's deviation from its original aim of creating fully intelligent machines, prompting the establishment of the artificial general intelligence (AGI) subfield around 2002.
By 2012, deep learning began to dominate AI, driven by hardware advancements and access to large data sets, leading to its widespread adoption and a surge in AI interest and funding. This success, however, led to the abandonment of many alternative AI methods for specific tasks.
Between 2015 and 2019, machine learning research publications increased by 50%. In 2016, the focus at machine learning conferences shifted significantly towards issues of fairness and the potential misuse of technology, leading to increased funding and research in these areas. The late 2010s and early 2020s saw significant advancements in artificial general intelligence (AGI), with notable developments like AlphaGo by DeepMind in 2015, which defeated the world champion in Go, and OpenAI's GPT-3 in 2020, a model capable of generating human-like text. These innovations spurred a major AI investment boom, with approximately $50 billion being invested annually in AI in the U.S. by 2022, and AI-related fields attracting 20% of new US Computer Science PhD graduates. Additionally, there were around 800,000 AI-related job openings in the U.S. in 2022.
In the realm of philosophy, the definition and understanding of artificial intelligence have evolved. Alan Turing, in 1950, suggested shifting the focus from whether machines can think to whether they can exhibit intelligent behavior, as demonstrated by his Turing test, which assesses a machine's ability to simulate human conversation. Turing argued that since we can only observe behavior, the internal thought processes of machines are irrelevant, similar to our assumptions about human thought. Russell and Norvig supported defining intelligence based on observable behavior but criticized the Turing test for emphasizing human imitation.
Aeronautical engineering does not aim to create machines that mimic pigeons exactly, just as artificial intelligence (AI) is not about perfectly simulating human intelligence, according to AI founder John McCarthy. McCarthy defines intelligence as the computational ability to achieve goals, while Marvin Minsky views it as solving difficult problems. The leading AI textbook describes it as the study of agents that perceive and act to maximize their goal achievement. Google's definition aligns intelligence in AI with the synthesis of information, similar to biological intelligence.
AI research has lacked a unifying theory, with statistical machine learning dominating the field in the 2010s, often equated with AI in business contexts. This approach, primarily using neural networks, is described as sub-symbolic and narrow.
Symbolic AI, or "GOFAI," focused on simulating high-level reasoning used in tasks like puzzles and mathematics, and was proposed by Newell and Simon in the 1960s. Despite its success in structured tasks, symbolic AI struggled with tasks that humans find easy, such as learning and commonsense reasoning.
Moravec's paradox highlights that AI finds high-level reasoning tasks easier than instinctive, sensory tasks, a view initially opposed but later supported by AI research, aligning with philosopher Hubert Dreyfus's earlier arguments. The debate continues, especially around sub-symbolic AI, which, like human intuition, can be prone to errors such as algorithmic bias and lacks transparency in decision-making processes. This has led to the development of neuro-symbolic AI, which aims to integrate symbolic and sub-symbolic approaches.
In AI development, there has been a historical division between "Neats," who believe intelligent behavior can be described with simple principles, and "Scruffies," who believe it involves solving many complex problems. This debate, prominent in the 1970s and 1980s, has largely been deemed irrelevant as modern AI incorporates both approaches.
Soft computing, which emerged in the late 1980s, focuses on techniques like genetic algorithms, fuzzy logic, and neural networks to handle imprecision and uncertainty, proving successful in many modern AI applications.
Finally, there is a division in AI research between pursuing narrow AI, which solves specific problems, and aiming for broader goals like artificial general intelligence and superintelligence, with differing opinions on which approach might more effectively advance the field.
General intelligence is a complex concept that is hard to define and measure, leading modern AI research to focus on specific problems and solutions. The sub-field of artificial general intelligence exclusively explores this area. In terms of machine consciousness and sentience, the philosophy of mind has yet to determine if machines can possess minds or consciousness similar to humans, focusing instead on their internal experiences rather than external behaviors. Mainstream AI research generally views these considerations as irrelevant to its objectives, which are to develop machines capable of solving problems intelligently.
The philosophy of mind debates whether machines can truly be conscious or just appear to be so, a topic that is also popular in AI fiction. David Chalmers distinguishes between the "hard" problem of consciousness, which is understanding why or how brain processes feel like something, and the "easy" problem, which involves understanding how the brain processes information and controls behavior. The subjective experience, such as feeling a color, remains a significant challenge to explain.
In the realm of computationalism and functionalism, the belief is that the human mind functions as an information processing system, and thinking is akin to computing. This perspective suggests that the mind-body relationship is similar to that between software and hardware, potentially offering insights into the mind-body problem.
The concept of "strong AI," as described by philosopher John Searle, suggests that a properly programmed computer could possess a mind similar to humans. However, Searle's Chinese room argument challenges this by claiming that even if a machine can mimic human behavior, it doesn't necessarily mean it has a mind. The debate extends into AI welfare and rights, focusing on the difficulty of determining AI sentience and the ethical implications if machines could feel and suffer. Discussions around AI rights have included proposals like granting "electronic personhood" to advanced AI systems in the EU, which would give them certain rights and responsibilities, though this has faced criticism regarding its impact on human rights and the autonomy of robots.
The topic of AI rights is gaining traction, with advocates warning against the potential moral oversight in denying AI sentience, which could lead to exploitation and suffering akin to historical injustices like slavery. The concept of superintelligence involves an agent with intelligence far beyond human capabilities, which could potentially lead to a self-improving AI, a scenario often referred to as the singularity.
The concept of an "intelligence explosion" or "singularity" suggests a point where technology improves exponentially, although such growth typically follows an S-shaped curve and slows upon reaching technological limits. Transhumanism, supported by figures like Hans Moravec, Kevin Warwick, and Ray Kurzweil, envisions a future where humans and machines merge into advanced cyborgs. This idea has historical roots in the thoughts of Aldous Huxley and Robert Ettinger. Edward Fredkin, building on ideas dating back to Samuel Butler in 1863, views artificial intelligence as the next stage of evolution, a concept further explored by George Dyson.
In literature and media, the portrayal of artificial intelligence has been a theme since antiquity, with robots and AI often depicted in science fiction. The term "robot" was first introduced by Karel Čapek in 1921. Notable narratives include Mary Shelley's "Frankenstein" and films like "2001: A Space Odyssey" and "The Terminator," which typically showcase AI as a threat. Conversely, loyal robots like Gort from "The Day the Earth Stood Still" are less common. Isaac Asimov's Three Laws of Robotics, introduced in his Multivac series, are frequently discussed in the context of machine ethics, though many AI researchers find them ambiguous and impractical.
Numerous works, including Karel Čapek's R.U.R., the films A.I. Artificial Intelligence and Ex Machina, and Philip K. Dick's novel Do Androids Dream of Electric Sheep?, utilize AI to explore the essence of humanity. These works present artificial beings capable of feeling and suffering, prompting a reevaluation of human subjectivity in the context of advanced technology.`
```
Note that this utility also allows passing additional instructions.
```
`summary\_with\_additional\_instructions = summarize(artificial\_intelligence\_wikipedia\_text, detail=0.1,
additional\_instructions="Write in point form and focus on numerical data.")
print(summary\_with\_additional\_instructions)`
```
```
`100%|██████████| 5/5 [00:38\<00:00, 7.73s/it]`
```
```
`- AI is intelligence demonstrated by machines, especially computer systems.
- AI technology applications include search engines, recommendation systems, speech interaction, autonomous vehicles, creative tools, and strategy games.
- Alan Turing initiated substantial AI research, termed "machine intelligence."
- AI became an academic discipline in 1956, experiencing cycles of optimism and "AI winters."
- Post-2012, deep learning and post-2017 transformer architectures revitalized AI, leading to a boom in the early 2020s.
- AI influences societal and economic shifts towards automation and data-driven decision-making across various sectors.
- AI research goals: reasoning, knowledge representation, planning, learning, natural language processing, perception, and robotics support.
- AI techniques include search, optimization, logic, neural networks, and statistical methods.
- AI sub-problems focus on traits like reasoning, problem-solving, knowledge representation, planning, decision-making, learning, and perception.
- Early AI research mimicked human step-by-step reasoning; modern AI handles uncertain information using probability and economics.
- Knowledge representation in AI involves ontologies and knowledge bases to support intelligent querying and reasoning.
- Planning in AI involves goal-directed behavior and decision-making based on utility maximization.
- Learning in AI includes machine learning, supervised and unsupervised learning, reinforcement learning, and deep learning.
- Natural language processing (NLP) in AI has evolved from rule-based systems to modern deep learning techniques.
- AI perception involves interpreting sensor data for tasks like speech recognition and computer vision.
- General AI aims to solve diverse problems with human-like versatility.
- AI search techniques include state space search, local search, and adversarial search for game-playing.
- Logic in AI uses formal systems like propositional and predicate logic for reasoning and knowledge representation.
- Probabilistic methods in AI address decision-making and planning under uncertainty using tools like Bayesian networks and Markov decision processes.
- Classifiers in AI categorize data into predefined classes based on pattern matching and supervised learning.
- Neural networks: Interconnected nodes, similar to brain neurons, with input, hidden layers, and output.
- Deep neural networks: At least 2 hidden layers.
- Training techniques: Commonly use backpropagation.
- Feedforward networks: Signal passes in one direction.
- Recurrent networks: Output fed back into input for short-term memory.
- Perceptrons: Single layer of neurons.
- Convolutional networks: Strengthen connections between close neurons, important in image processing.
- Deep learning: Multiple layers extract features progressively, used in various AI subfields.
- GPT (Generative Pre-trained Transformers): Large language models pre-trained on text, used in chatbots.
- Specialized AI hardware: GPUs replaced CPUs for training large-scale machine learning models.
- AI applications: Used in search engines, online ads, virtual assistants, autonomous vehicles, language translation, facial recognition.
- AI in healthcare: Increases patient care, used in medical research and drug discovery.
- AI in games: Used in chess, Jeopardy!, Go, and real-time strategy games.
- Military AI: Enhances command, control, and operations, used in coordination and threat detection.
- Generative AI: Creates realistic images and texts, used in creative arts.
- AI ethics and risks: Concerns over privacy, surveillance, copyright, misinformation, and algorithmic bias.
- Algorithmic bias: Can cause discrimination if trained on biased data, fairness in machine learning is a critical area of study.
- AI engineers demographics: 4% black, 20% women.
- ACM FAccT 2022: Recommends limiting use of self-learning neural networks due to bias.
- AI complexity: Designers often can't explain decision-making processes.
- Misleading AI outcomes: Skin disease identifier misclassifies images with rulers as "cancerous"; AI misclassifies asthma patients as low risk for pneumonia.
- Right to explanation: Essential for accountability, especially in medical and legal fields.
- DARPA's XAI program (2014): Aims to make AI decisions understandable.
- Transparency solutions: SHAP, LIME, multitask learning, deconvolution, DeepDream.
- AI misuse: Authoritarian surveillance, misinformation, autonomous weapons.
- AI in warfare: 30 nations support UN ban on autonomous weapons; over 50 countries researching battlefield robots.
- Technological unemployment: AI could increase long-term unemployment; conflicting expert opinions on job risk from automation.
- Existential risks of AI: Potential to lose control over superintelligent AI; concerns from Stephen Hawking, Bill Gates, Elon Musk.
- Ethical AI development: Importance of aligning AI with human values and ethics.
- AI regulation: Increasing global legislative activity; first global AI Safety Summit in 2023.
- Historical perspective: AI research dates back to antiquity, significant developments in mid-20th century.
- 1974: U.S. and British governments ceased AI exploratory research due to criticism and funding pressures.
- 1985: AI market value exceeded $1 billion.
- 1987: Collapse of Lisp Machine market led to a second, prolonged AI winter.
- 1990: Yann LeCun demonstrated successful use of convolutional neural networks for recognizing handwritten digits.
- Early 2000s: AI reputation restored through specific problem-solving and formal methods.
- 2012: Deep learning began dominating AI benchmarks.
- 2015-2019: Machine learning research publications increased by 50%.
- 2016: Fairness and misuse of technology became central issues in AI.
- 2022: Approximately $50 billion annually invested in AI in the U.S.; 800,000 AI-related job openings in the U.S.
- Turing test proposed by Alan Turing in 1950 to measure machine's ability to simulate human conversation.
- AI defined as the study of agents that perceive their environment and take actions to achieve goals.
- 2010s: Statistical machine learning overshadowed other AI approaches.
- Symbolic AI excelled in high-level reasoning but failed in tasks like object recognition and commonsense reasoning.
- Late 1980s: Introduction of soft computing techniques.
- Debate between pursuing narrow AI (specific problem-solving) versus artificial general intelligence (AGI).
- 2017: EU considered granting "electronic personhood" to advanced AI systems.
- Predictions of merging humans and machines into cyborgs, a concept known as transhumanism.
- Focus on how AI and technology, as depicted in "Ex Machina" and Philip K. Dick's "Do Androids Dream of Electric Sheep?", alter human subjectivity.
- No specific numerical data provided.`
```
Finally, note that the utility allows for recursive summarization, where each summary is based on the previous summaries, adding more context to the summarization process. This can be enabled by setting the `summarize\_recursively` parameter to True. This is more computationally expensive, but can increase consistency and coherence of the combined summary.
```
`recursive\_summary = summarize(artificial\_intelligence\_wikipedia\_text, detail=0.1, summarize\_recursively=True)
print(recursive\_summary)`
```
```
`100%|██████████| 5/5 [00:41\<00:00, 8.36s/it]`
```
```
`Artificial intelligence (AI) is the simulation of human intelligence in machines, designed to perform tasks that typically require human intelligence. This includes applications like advanced search engines, recommendation systems, speech interaction, autonomous vehicles, and strategic game analysis. AI was established as a distinct academic discipline in 1956 and has experienced cycles of high expectations followed by disillusionment and decreased funding, known as "AI winters." Interest in AI surged post-2012 with advancements in deep learning and again post-2017 with the development of transformer architectures, leading to significant progress in the early 2020s.
AI's increasing integration into various sectors is influencing societal and economic shifts towards automation and data-driven decision-making, affecting areas such as employment, healthcare, and education. This raises important ethical and safety concerns, prompting discussions on regulatory policies.
AI research encompasses various sub-fields focused on specific goals like reasoning, learning, natural language processing, perception, and robotics, using techniques from search and optimization, logic, and probabilistic methods. The field also draws from psychology, linguistics, philosophy, and neuroscience. AI aims to achieve general intelligence, enabling machines to perform any intellectual task that a human can do.
Artificial intelligence (AI) simulates human intelligence in machines to perform tasks that typically require human intellect, such as advanced search engines, recommendation systems, and autonomous vehicles. AI research, which began as a distinct academic discipline in 1956, includes sub-fields like natural language processing and robotics, employing techniques from various scientific domains. AI has significantly advanced due to deep learning and the development of transformer architectures, notably improving applications in computer vision, speech recognition, and other areas.
Neural networks, central to AI, mimic the human brain's neuron network to recognize patterns and learn from data, using multiple layers in deep learning to extract complex features. These networks have evolved into sophisticated models like GPT (Generative Pre-trained Transformers) for natural language processing, enhancing applications like chatbots.
AI's integration into sectors like healthcare, military, and agriculture has led to innovations like precision medicine and smart farming but also raised ethical concerns regarding privacy, bias, and the potential for misuse. Issues like data privacy, algorithmic bias, and the generation of misinformation are critical challenges as AI becomes pervasive in society. AI's potential and risks necessitate careful management and regulation to harness benefits while mitigating adverse impacts.
AI, or artificial intelligence, simulates human intelligence in machines to perform complex tasks, such as operating autonomous vehicles and analyzing strategic games. Since its establishment as an academic discipline in 1956, AI has seen periods of high expectations and subsequent disillusionment, known as "AI winters." Recent advancements in deep learning and transformer architectures have significantly advanced AI capabilities in areas like computer vision and speech recognition.
AI's integration into various sectors, including healthcare and agriculture, has led to innovations like precision medicine and smart farming but has also raised ethical concerns about privacy, bias, and misuse. The complexity of AI systems, particularly deep neural networks, often makes it difficult for developers to explain their decision-making processes, leading to transparency issues. This lack of transparency can result in unintended consequences, such as misclassifications in medical diagnostics.
The potential for AI to be weaponized by bad actors, such as authoritarian governments or terrorists, poses significant risks. AI's reliance on large tech companies for computational power and the potential for technological unemployment are also critical issues. Despite these challenges, AI also offers opportunities for enhancing human well-being if ethical considerations are integrated throughout the design and implementation stages.
Regulation of AI is emerging globally, with various countries adopting AI strategies to ensure the technology aligns with human rights and democratic values. The first global AI Safety Summit in 2023 emphasized the need for international cooperation to manage AI's risks and challenges effectively.
In the 1970s, AI research faced significant setbacks due to criticism from influential figures like Sir James Lighthill and funding cuts from the U.S. and British governments, leading to the first "AI winter." The field saw a resurgence in the 1980s with the success of expert systems and renewed government funding, but suffered another setback with the collapse of the Lisp Machine market in 1987, initiating a second AI winter. During this period, researchers began exploring "sub-symbolic" approaches, including neural networks, which gained prominence in the 1990s with successful applications like Yann LeCun’s convolutional neural networks for digit recognition.
By the early 21st century, AI was revitalized by focusing on narrow, specific problems, leading to practical applications and integration into various sectors. The field of artificial general intelligence (AGI) emerged, aiming to create versatile, fully intelligent machines. The 2010s saw deep learning dominate AI research, driven by hardware improvements and large datasets, which significantly increased interest and investment in AI.
Philosophically, AI has been defined in various ways, focusing on external behavior rather than internal experience, aligning with Alan Turing's proposal of the Turing test. The field has debated the merits of symbolic vs. sub-symbolic AI, with ongoing discussions about machine consciousness and the ethical implications of potentially sentient AI. The concept of AI rights and welfare has also emerged, reflecting concerns about the moral status of advanced AI systems.
Overall, AI research has oscillated between periods of intense optimism and profound setbacks, with current trends heavily favoring practical applications through narrow AI, while continuing to explore the broader implications and potential of general and superintelligent AI systems.
Artificial Intelligence (AI) and its portrayal in media, such as the film "Ex Machina" and Philip K. Dick's novel "Do Androids Dream of Electric Sheep?", explore how technology, particularly AI, can alter our understanding of human subjectivity.`
```