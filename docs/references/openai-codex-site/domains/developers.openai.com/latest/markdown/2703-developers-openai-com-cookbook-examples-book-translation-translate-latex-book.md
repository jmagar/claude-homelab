Translate a book writen in LaTeX from Slovenian into English
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
Mar 10, 2022
# Translate a book writen in LaTeX from Slovenian into English
This recipe is archived and may reference outdated models or APIs.
[ BO ](https://github.com/BorisPower)
[ BorisPower ](https://github.com/BorisPower)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/book_translation/translate_latex_book.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/book_translation/translate_latex_book.ipynb)
With permission of the author, we will demonstrate how to translate the book [Euclidean Plane Geometry](https://sites.google.com/site/projektivna/), written by Milan Mitrović from Slovenian into English, without modifying any of the LaTeX commands.
To achieve this, we will first split the book into chunks, each roughly a page long, then translate each chunk into English, and finally stitch them back together.
## 1. Read in the data
```
`from openai import OpenAI
import tiktoken
client = OpenAI()
# OpenAI tiktoken tokenizer: https://github.com/openai/tiktoken
# we use it to count the number of tokens in the text
tokenizer = tiktoken.get\_encoding("o200k\_base")
with open("data/geometry\_slovenian.tex", "r") as f:
text = f.read()`
```
### 1.1 Count the tokens in each chunk
```
`chunks = text.split('\\n\\n')
ntokens = []
for chunk in chunks:
ntokens.append(len(tokenizer.encode(chunk)))
print("Size of the largest chunk: ", max(ntokens))
print("Number of chunks: ", len(chunks))`
```
```
`Size of the largest chunk: 1211
Number of chunks: 5877`
```
It turns out that a double newline is a good separator in this case, in order not to break the flow of the text. Also no individual chunk is larger than 1211 tokens. The model we will use is gpt-4o, which has a limit of 16,384 tokens, so we don’t need to worry about breaking the chunks down further.
We will group the shorter chunks into chunks of around 15000 tokens, to increase the coherence of the text, and decrease the frequency of breaks within the text.
```
`def group\_chunks(chunks, ntokens, max\_len=15000, hard\_max\_len=16000):
"""
Group very short chunks, to form approximately page long chunks.
"""
batches = []
cur\_batch = ""
cur\_tokens = 0
# iterate over chunks, and group the short ones together
for chunk, ntoken in zip(chunks, ntokens):
# discard chunks that exceed hard max length
if ntoken \> hard\_max\_len:
print(f"Warning: Chunk discarded for being too long ({ntoken} tokens \> {hard\_max\_len} token limit). Preview: '{chunk[:50]}...'")
continue
# if room in current batch, add new chunk
if cur\_tokens + 1 + ntoken \<= max\_len:
cur\_batch += "\\n\\n" + chunk
cur\_tokens += 1 + ntoken # adds 1 token for the two newlines
# otherwise, record the batch and start a new one
else:
batches.append(cur\_batch)
cur\_batch = chunk
cur\_tokens = ntoken
if cur\_batch: # add the last batch if it's not empty
batches.append(cur\_batch)
return batches
chunks = group\_chunks(chunks, ntokens)
len(chunks)`
```
```
`39`
```
Notice that adding a sample untranslated and translated first command, where only the content of the chapter name needs to be translated, helps to get more consistent results.
The format of the prompt sent to the model consists of:
1. A high level instruction to translate only the text, but not commands into the desired language
2. A sample untranslated command, where only the content of the chapter name needs to be translated
3. The chunk of text to be translated
4. The translated sample command from 2, which shows the model the beginning of the translation process
The expected output is the translated chunk of text.
```
`def translate\_chunk(chunk, model='gpt-4o',
dest\_language='English',
sample\_translation=(
r"\\poglavje{Osnove Geometrije} \\label{osn9Geom}",
r"\\chapter{The basics of Geometry} \\label{osn9Geom}")):
prompt = f'''Translate only the text from the following LaTeX document into {dest\_language}. Leave all LaTeX commands unchanged
"""
{sample\_translation[0]}
{chunk}"""
{sample\_translation[1]}
'''
response = client.chat.completions.create(
messages=[{"role": "user", "content":prompt}],
model=model,
temperature=0,
top\_p=1,
max\_tokens=15000,
)
result = response.choices[0].message.content.strip()
result = result.replace('"""', '') # remove the double quotes, as we used them to surround the text
return result
print(translate\_chunk(chunks[2], model='gpt-4o', dest\_language='English'))`
```
```
`Certainly! Here's the translation of the text from the LaTeX document into English, with all LaTeX commands unchanged:
---
\\chapter{The basics of Geometry} \\label{osn9Geom}
Let us mention that the group structure also requires the property of associativity, i.e., $\\mathcal{I}\_1\\circ (\\mathcal{I}\_2\\circ \\mathcal{I}\_3)= (\\mathcal{I}\_1\\circ \\mathcal{I}\_2)\\circ \\mathcal{I}\_3$ (for arbitrary isometries $\\mathcal{I}\_1$, $\\mathcal{I}\_2$, and $\\mathcal{I}\_3$), which is automatically fulfilled in the operation of function composition. Let us also mention that the \\concept{identity} \\index{identity} $\\mathcal{E}$ from the previous axiom is a mapping for which $\\mathcal{E}(A)=A$ for every point of the plane. The mapping $\\mathcal{I}^{-1}$ is the \\concept{inverse mapping} for the isometry $\\mathcal{I}$ if $\\mathcal{I}^{-1}\\circ \\mathcal{I} =\\mathcal{I}\\circ\\mathcal{I}^{-1}=\\mathcal{E}$. According to the previous axiom, the identity and inverse mapping of each isometry are also isometries.
Let us prove the first consequences of the axioms of congruence. First, we will consider the following properties of isometries.
\\begin{theorem} \\label{izrekIzoB} Isometry maps a line to a line, a line segment to a line segment, a ray to a ray, a half-plane to a half-plane, an angle to an angle, and an $n$-gon to an $n$-gon.
\\end{theorem}
\\textbf{\\textit{Proof.}}
According to axiom \\ref{aksIII1}, isometries preserve the relation $\\mathcal{B}$. Therefore, all points of the line segment $AB$ under the isometry $I$ are mapped to points lying on the line segment $A'B'$, where $A'=\\mathcal{I}(A)$ and $B'=\\mathcal{I}(B)$. Since the inverse mapping $\\mathcal{I}^{-1}$ is also an isometry (axiom \\ref{aksIII4}), every point of the line segment $A'B'$ is the image of some point lying on the line segment $AB$. Thus, the line segment $AB$ is mapped to the line segment $A'B'$ by the isometry $\\mathcal{I}$.
The remaining figures from the theorem are also defined using the relation $\\mathcal{B}$, so the proof is similar to that for the line segment.
\\qed
From the proof of the previous theorem, it follows that the endpoints of the line segment $AB$ are mapped to the endpoints of the image $A'B'$ by the isometry. Similarly, the origin of a ray is mapped to the origin of the ray, the edge of a half-plane to the edge of a half-plane, the vertex of an angle to the vertex of an angle, and the vertex of a polygon to the vertex of a polygon.
Isometries are defined as bijective mappings that preserve the congruence of pairs of points. Is it also true that for congruent pairs of points, there exists an isometry that maps the first pair to the second? Let us provide the answer with the following theorem.
\\begin{theorem} \\label{izrekAB} If $(A,B)\\cong (A',B')$, then there is an isometry $\\mathcal{I}$, which maps the points $A$ and $B$ to the points $A'$ and $B'$, i.e.:
$$\\mathcal{I}: A, B\\mapsto A',B'.$$
\\end{theorem}
\\begin{figure}[!htb]
\\centering
\\input{sl.aks.2.3.7.pic}
\\caption{} \\label{sl.aks.2.3.7.pic}
\\end{figure}
\\textbf{\\textit{Proof.}}
Let $C$ be a point that does not lie on the line $AB$, and $C'$ a point that does not lie on the line $A'B'$ (Figure \\ref{sl.aks.2.3.7.pic}). According to axiom \\ref{aksIII2}, there exists a unique isometry $\\mathcal{I}$ that maps the point $A$ to the point $A'$, the ray $AB$ to the ray $A'B'$, and the half-plane $ABC$ to the half-plane $A'B'C'$. Since by assumption $(A,B)\\cong (A',B')$ from the same axiom \\ref{aksIII2}, it follows that $\\mathcal{I}(B)=B'$.
\\qed
The proof of the following theorem is similar, which will later be presented in a different form as the first theorem on the congruence of triangles.
\\begin{theorem} \\label{IizrekABC} Let $(A,B,C)$ and $(A',B',C')$ be triplets of non-collinear points such that $$(A,B,C)\\cong (A',B',C'),$$ then there is a single isometry $\\mathcal{I}$, that maps the points $A$, $B$, and $C$ into the points $A'$, $B'$, and $C'$, i.e.:
$$\\mathcal{I}: A, B,C\\mapsto A',B',C'.$$
\\end{theorem}
\\begin{figure}[!htb]
\\centering
\\input{sl.aks.2.3.5.pic}
\\caption{} \\label{sl.aks.2.3.5.pic}
\\end{figure}
\\textbf{\\textit{Proof.}}
According to axiom \\ref{aksIII2}, there exists a unique isometry $\\mathcal{I}$ that maps the point $A$ to the point $A'$, the ray $AB$ to the ray $A'B'$, and the half-plane $ABC$ to the half-plane $A'B'C'$ (Figure \\ref{sl.aks.2.3.5.pic}). Since by assumption $(A,B,C)\\cong (A',B',C')$ from the same axiom \\ref{aksIII2}, it follows that $\\mathcal{I}(B)=B'$ and $\\mathcal{I}(C)=C'$.
It is necessary to prove that $\\mathcal{I}$ is the only such isometry. Suppose there exists such an isometry $\\mathcal{\\widehat{I}}$ that satisfies $\\mathcal{\\widehat{I}}: A, B,C\\mapsto A',B',C'$. According to theorem \\ref{izrekIzoB}, the isometry $\\mathcal{\\widehat{I}}$ also maps the ray $AB$ to the ray $A'B'$ and the half-plane $ABC$ to the half-plane $A'B'C'$. From axiom \\ref{aksIII2}, it follows that $\\mathcal{\\widehat{I}}=\\mathcal{I}$.
\\qed
A direct consequence is the following theorem.
\\begin{theorem} \\label{IizrekABCident} Let $A$, $B$, and $C$ be three non-collinear points, then the identity map $\\mathcal{E}$ is the only isometry that maps points $A$, $B$, and $C$ to the same points $A$, $B$, and $C$.
\\end{theorem}
\\begin{figure}[!htb]
\\centering
\\input{sl.aks.2.3.5a.pic}
\\caption{} \\label{sl.aks.2.3.5a.pic}
\\end{figure}
\\textbf{\\textit{Proof.}} (Figure \\ref{sl.aks.2.3.5a.pic})
First, the identical mapping $\\mathcal{E}$, which maps the points $A$, $B$, and $C$ to the points $A$, $B$, and $C$, is an isometry according to axiom \\ref{aksIII4}. From the previous theorem \\ref{IizrekABC}, it follows that there is only one such isometry.
\\qed
For the point $A$, we say that it is a \\index{point!fixed} \\concept{fixed point} (or \\index{point!immovable} \\concept{immovable point}) of the isometry $\\mathcal{I}$ if $\\mathcal{I}(A)=A$. The previous theorem tells us that the only isometries that have three non-collinear fixed points are identities.
We will discuss isometries in more detail in chapter \\ref{pogIZO}, but for now, we will use them primarily to help introduce the congruence of figures. Two figures $\\Phi$ and $\\Phi'$ are \\index{figures!congruent}\\concept{congruent} (denoted $\\Phi\\cong \\Phi'$) if there exists an isometry $I$ that maps the figure $\\Phi$ to the figure $\\Phi'$.
A direct consequence of axiom \\ref{aksIII4} is the following theorem.
\\begin{theorem}
Congruence of figures is an equivalence relation. \\label{sklRelEkv}
\\end{theorem}
\\textbf{\\textit{Proof.}}
\\textit{Reflexivity.} For every figure $\\Phi$, it holds that $\\Phi \\cong \\Phi$, because the identical mapping $\\mathcal{E}$ is an isometry (axiom \\ref{aksIII4}) and $\\mathcal{E}:\\Phi\\rightarrow\\Phi$.
\\textit{Symmetry.} From $\\Phi \\cong \\Phi\_1$, it follows that there exists an isometry $\\mathcal{I}$ that maps the figure $\\Phi$ to the figure $\\Phi\_1$. The inverse mapping $\\mathcal{I}^{-1}$, which is an isometry according to axiom \\ref{aksIII4}, maps the figure $\\Phi\_1$ to the figure $\\Phi$, so $\\Phi\_1 \\cong \\Phi$.
\\textit{Transitivity.} From $\\Phi \\cong \\Phi\_1$ and $\\Phi\_1 \\cong \\Phi\_2$, it follows that there exist such isometries $\\mathcal{I}$ and $\\mathcal{I}'$ that satisfy $\\mathcal{I}:\\Phi\\rightarrow\\Phi\_1$ and $\\mathcal{I}':\\Phi\_1\\rightarrow\\Phi\_2$. Then the composition $\\mathcal{I}'\\circ\\mathcal{I}$, which is an isometry according to axiom \\ref{aksIII4}, maps the figure $\\Phi$ to the figure $\\Phi\_2$, so $\\Phi \\cong \\Phi\_2$.
\\qed
The concept of congruence of figures also applies to line segments. Intuitively, we have associated the congruence of line segments with the congruence of pairs of points. Now we will prove the equivalence of both relations.
\\begin{theorem} \\label{izrek(A,B)} $AB \\cong A'B' \\Leftrightarrow (A,B)\\cong (A',B')$
\\end{theorem}
\\textbf{\\textit{Proof.}}
($\\Rightarrow$) If $(A,B)\\cong (A',B')$, according to theorem \\ref{izrekAB}, there exists an isometry $\\mathcal{I}$ that maps the points $A$ and $B$ to the points $A'$ and $B'$. From theorem \\ref{izrekIzoB}, it follows that the isometry $\\mathcal{I}$ maps the line segment $AB$ to the line segment $A'B'$, i.e., $AB \\cong A'B'$.
($\\Leftarrow$) If $AB \\cong A'B'$, there exists an isometry $\\mathcal{I}$ that maps the line segment $AB$ to the line segment $A'B'$. According to the consequence of theorem \\ref{izrekIzoB}, the endpoint of the line segment is mapped to the endpoint of the line segment. This means that either $\\mathcal{I}:A,B\\mapsto A',B'$ or $\\mathcal{I}:A,B\\mapsto B',A'$. From the first relation, it follows that $(A,B)\\cong (A',B')$, and from the second, $(A,B)\\cong (B',A')$. However, even from the second case, we get $(A,B)\\cong (A',B')$, which is a consequence of axioms \\ref{aksIII3} and \\ref{aksIII4}.
\\qed
Due to the previous theorem, we will always write $AB\\cong A'B'$ instead of the relation $(A,B)\\cong (A',B')$ in the continuation.
\\begin{theorem} \\label{ABnaPoltrakCX}
For each line segment $AB$ and each ray $CX$, there is exactly one point $D$ on the ray $CX$ that $AB\\cong CD$ holds.
\\end{theorem}
\\begin{figure}[!htb]
\\centering
\\input{sl.aks.2.3.5b.pic}
\\caption{} \\label{sl.aks.2.3.5b.pic}
\\end{figure}
\\textbf{\\textit{Proof.}} Let $P$ be a point that does not lie on the line $AB$, and $Q$ a point that does not lie on the line $CX$ (Figure \\ref{sl.aks.2.3.5b.pic}). According to axiom \\ref{aksIII2}, there exists a unique isometry $\\mathcal{I}$ that maps the point $A$ to the point $C$, the ray $AB$ to the ray $CX$, and the half-plane $ABP$ to the half-plane $CXQ$. Let $D=\\mathcal{I}(C)$, then $AB \\cong CD$.
Assume that there is another point $\\widehat{D}$ on the ray $CX$ for which $AB \\cong C\\widehat{D}$. Since the rays $CX$ and $CD$ coincide, and the isometry $\\mathcal{I}$ maps the point $A$ to the point $C$, the ray $AB$ to the ray $CD$, and the half-plane $ABP$ to the half-plane $CDQ$, it follows from axiom \\ref{aksIII2} that $\\mathcal{I}(C)=\\widehat{D}$, i.e., $\\widehat{D}=D$.
\\qed
\\begin{theorem} \\label{izomEnaC'} Let $A$, $B$, $C$ be three non-collinear points and $A'$, $B'$ points of the edge of a half-plane $\\pi$ such that $AB \\cong A'B'$. Then there is exactly one point $C'$ in the half-plane $\\pi$ such that $AC \\cong A'C'$ and $BC \\cong B'C'$.
\\end{theorem}
\\begin{figure}[!htb]
\\centering
\\input{sl.aks.2.3.11a.pic}
\\caption{} \\label{sl.aks.2.3.11a.pic}
\\end{figure}
\\textbf{\\textit{Proof.}} (Figure \\ref{sl.aks.2.3.11a.pic})
According to axiom \\ref{aksIII2}, there exists a unique isometry $\\mathcal{I}$ that maps the point $A$ to the point $A'$, the ray $AB$ to the ray $A'B'$, and the half-plane $ABC$ to the half-plane $\\pi$, and it holds that $\\mathcal{I}(B)=B'$. Let $C'=\\mathcal{I}(C)$, then $AC \\cong A'C'$ and $BC \\cong B'C'$. Assume that there is such a point $\\widehat{C}'$ that lies in the half-plane $\\pi$ and satisfies $AC \\cong A'\\widehat{C}'$ and $BC \\cong B'\\widehat{C}'$. Since $AB \\cong A'B'$, according to theorem \\ref{IizrekABC}, there exists a unique isometry $\\mathcal{\\widehat{I}}$ that maps the points $A$, $B$, and $C$ to the points $A'$, $B'$, and $\\widehat{C}'$. However, it also maps the ray $AB$ to the ray $A'B'$ and the half-plane $ABC$ to the half-plane $A'B'\\widehat{C}'=\\pi$. According to axiom \\ref{aksIII2}, $\\mathcal{\\widehat{I}}=\\mathcal{I}$, and therefore $\\widehat{C}'=\\mathcal{\\widehat{I}}(C)=\\mathcal{I}(C)=C'$.
\\qed
\\begin{theorem} \\label{izoABAB} If $\\mathcal{I}$ is an isometry that maps a points $A$ and $B$ into the same points $A$ and $B$ (i.e. $\\mathcal{I}(A)=A$ and $\\mathcal{I}(B)=B$), then it also holds for each point $X$ on the line $AB$ (i.e. $\\mathcal{I}(X)=X$).
\\end{theorem}
\\begin{figure}[!htb]
\\centering
\\input{sl.aks.2.3.8.pic}
\\caption{} \\label{sl.aks.2.3.8.pic}
\\end{figure}
\\textbf{\\textit{Proof.}} Let $X$ be an arbitrary point on the line $AB$. Without loss of generality, assume that the point $X$ lies on the ray $AB$ (Figure \\ref{sl.aks.2.3.8.pic}). Let us prove that $\\mathcal{I}(X)=X$.
Let $P$ be a point that does not lie on the line $AB$ and $P'=\\mathcal{I}(P)$. The isometry $\\mathcal{I}$ maps the point $A$ to the point $A$, the ray $AB$ to the ray $AB$ (or the ray $AX$ to the ray $AX$), and the half-plane $ABP$ to the half-plane $ABP'$ (or the half-plane $AXP$ to the half-plane $AXP'$). According to axiom \\ref{aksIII2}, from $AX\\cong AX$, it follows that $\\mathcal{I}(X)=X$.
\\qed
Let us introduce new concepts related to line segments.
We say that the line segment $EF$ is the \\index{sum!of segments}\\concept{sum of segments} $AB$ and $CD$, denoted $EF=AB+CD$, if there exists such a point $P$ on the line segment $EF$ that $AB \\cong EP$ and $CD \\cong PF$ (Figure \\ref{sl.aks.2.3.9.pic}).
\\begin{figure}[!htb]
\\centering
\\input{sl.aks.2.3.9.pic}
\\caption{} \\label{sl.aks.2.3.9.pic}
\\end{figure}
The line segment $EF$ is the \\index{difference!of segments}\\concept{difference of segments} $AB$ and $CD$, denoted $EF=AB-CD$, if $AB=EF+CD$ (Figure \\ref{sl.aks.2.3.9.pic}).
In a similar way, we can also define the multiplication of a line segment by a natural and a positive rational number. For line segments $AB$ and $CD$, $AB=n\\cdot CD$ ($n\\in \\mathbb{N}$) if there exist such points $X\_1$, $X\_2$,..., $X\_{n-1}$ that $\\mathcal{B}(X\_1,X\_2,\\ldots,X\_{n-1})$ and $AX\_1 \\cong X\_1X\_2 \\cong X\_{n-1}B \\cong CD$ (Figure \\ref{sl.aks.2.3.10.pic}). In this case, $CD=\\frac{1}{n}\\cdot AB$.
At this point, we will not formally prove the fact that for every line segment $PQ$ and every natural number $n$, there exists a line segment $AB$ for which $AB=n\\cdot PQ$, and a line segment $CD$ for which $CD=\\frac{1}{n}\\cdot PQ$.
\\begin{figure}[!htb]
\\centering
\\input{sl.aks.2.3.10.pic}
\\caption{} \\label{sl.aks.2.3.10.pic}
\\end{figure}
The multiplication of a line segment by a positive rational number is introduced in the following way. For $q=\\frac{n}{m} \\in \\mathbb{Q^+}$, it is:
$$q\\cdot AB=\\frac{n}{m}\\cdot AB = n\\cdot\\left(\\frac{1}{m}\\cdot AB\\right)$$
If for a point $P$ of the line segment $AB$, it holds that $AP=\\frac{n}{m}\\cdot PB$, we say that the point $P$ divides the line segment $AB$ in the \\index{ratio} \\concept{ratio} $n:m$, which we write as $AP:PB=n:m$.
The line segment $AB$ is \\index{relation!of order of segments}\\concept{longer} than the line segment $CD$, denoted $AB\>CD$, if there exists such a point $P\\neq B$ on the line segment $AB$ that $CD \\cong AP$ (Figure \\ref{sl.aks.2.3.11.pic}). In this case, we also say that the line segment $CD$ is \\concept{shorter} than the line segment $AB$ (denoted $CD\<AB$).
\\begin{figure}[!htb]
\\centering
\\input{sl.aks.2.3.11.pic}
\\caption{} \\label{sl.aks.2.3.11.pic}
\\end{figure}
It is not difficult to prove that for line segments $AB$ and $CD$, exactly one of the relations $AB\>CD$, $AB\<CD$, or $AB \\cong CD$ holds. This is a consequence of theorem \\ref{ABnaPoltrakCX}.
The point $S$ is the \\index{midpoint!of a segment} \\concept{midpoint (bisector) of the segment} $AB$ if it lies on this line segment and $AS \\cong SB$ holds (Figure \\ref{sl.aks.2.3.12.pic}). It is clear that the midpoint divides the line segment in the ratio $1:1$. It is necessary to prove that such a point always exists.
\\begin{figure}[!htb]
\\centering
\\input{sl.aks.2.3.12.pic}
\\caption{} \\label{sl.aks.2.3.12.pic}
\\end{figure}
\\begin{theorem}
For every line segment, there is exactly one midpoint.
\\end{theorem}
\\begin{figure}[!htb]
\\centering
\\input{sl.aks.2.3.13.pic}
\\caption{} \\label{sl.aks.2.3.13.pic}
\\end{figure}
\\textbf{\\textit{Proof.}}
Let $AB$ be a line segment and $C$ an arbitrary point that does not lie on the line $AB$ (Figure \\ref{sl.aks.2.3.13.pic}). Denote by $\\pi$ the half-plane $ABC$ and by $\\pi'$ the complementary half-plane of the half-plane $\\pi$. According to axiom \\ref{aksIII2}, there exists a unique isometry $\\mathcal{I}$ that maps the point $A$ to the point $B$, the ray $AB$ to the ray $BA$, and the half-plane $\\pi$ to the half-plane $\\pi'$. From $AB\\cong BA$ (a consequence of axiom \\ref{aksIII3}), it follows from the same axiom that $\\mathcal{I}(B)=A$.
Let $C'=\\mathcal{I}(C)$, then $AC \\cong B'C'$ and $BC \\cong A'C'$. Since $C$ and $C'$ are on different sides of the line $AB$, the line $CC'$ intersects the line $AB$ at some point $S$. If $\\widehat{C}=\\mathcal{I}(C')$, then $A'C' \\cong B\\widehat{C}$ and $B'C' \\cong A\\widehat{C}$. Since $AC \\cong B'C'$ and $BC \\cong A'C'$, according to theorem \\ref{izomEnaC'}, $\\widehat{C}=C$, i.e., $\\mathcal{I}(C')=C$. Therefore, the isometry $\\mathcal{I}$ maps the lines $AB$ and $CC'$ onto themselves, so:
$$\\mathcal{I}(S)=\\mathcal{I}(AB\\cap CC')= \\mathcal{I}(AB)\\cap \\mathcal{I}(CC')= AB\\cap CC'=S.$$
Now, from $\\mathcal{I}:A,S\\mapsto B,S$, it follows that $AS\\cong SB$.
To prove that the point $S$ is indeed the midpoint of the line segment $AB$, it is necessary to prove that the point $S$ lies on the line segment $AB$. Assume the opposite. Without loss of generality, let $\\mathcal{B}(A,B,S)$. However, in this case, there exist two such points $A$ and $B$ on the ray $SA$ that $SA\\cong SB$, which contradicts theorem \\ref{ABnaPoltrakCX}.
Let us also prove that the line segment has only one midpoint. Let $\\widehat{S}\\neq S$ be a point on the line segment $AB$ and $A\\widehat{S}\\cong \\widehat{S}B$. From axiom \\ref{aksIII3}, it follows that $\\mathcal{I}(A\\widehat{S})=A\\widehat{S}$. This means (theorem \\ref{izoABAB}) that for every point $X\\in AB$, it holds that $\\mathcal{I}(X)=X$ and also $\\mathcal{I}(A)=A$, which is not possible. Therefore, $\\widehat{S}= S$.
\\qed
We say that the point $A$ is \\index{symmetry!with respect to a point}\\concept{symmetric} to the point $B$ with respect to the point $S$ if $S$ is the midpoint of the line segment $AB$. Symmetry with respect to a point (so-called central reflection) will be discussed in more detail in section \\ref{odd6SredZrc}.
Now we will introduce concepts and derive properties related to angles that are analogous to those we introduced for line segments. If theorem \\ref{ABnaPoltrakCX} intuitively refers to transferring a line segment with a compass to a ray, the following theorem will represent transferring an angle to a given ray.
\\begin{theorem} \\label{KotNaPoltrak}
For each angle $\\alpha$ and each ray $Sp$ lies on a line $p$, there is exactly one ray $Sq$ in one of the half-planes determined by the line $p$, such that $\\alpha \\cong \\angle pSq$.
\\end{theorem}
\\begin{figure}[!htb]
\\centering
\\input{sl.aks.2.3.14.pic}
\\caption{} \\label{sl.aks.2.3.14.pic}
\\end{figure}
\\textbf{\\textit{Proof.}}
Let $\\alpha=\\angle BAC$ and $\\pi'$ be one of the half-planes determined by the carrier of the ray $Sp$ (Figure \\ref{sl.aks.2.3.14.pic}).
According to theorem \\ref{ABnaPoltrakCX}, there exists a unique point $P$ on the ray $Sp$ such that $AB \\cong SP$. According to axiom \\ref{aksIII2}, there exists a unique isometry $\\mathcal{I}$ that maps the point $A$ to the point $S$, the ray $AB$ to the ray $Sp$, and the half-plane $ABC$ to the half-plane $\\pi'$. If $Q=\\mathcal{I}(C)$, then the ray $AC$ is mapped to the ray $SQ$ by this isometry. Therefore, the ray $SQ=Sq$ lies in the half-plane $\\pi'$ and $\\angle BAC\\cong pSq$ holds.
Assume that $S\\widehat{q}$ is also a ray that lies in the half-plane $\\pi'$ and $\\angle BAC\\cong pS\\widehat{q}$ holds. From the definition of congruence, it follows that there exists some isometry $\\mathcal{\\widehat{I}}$ that maps the angle $BAC$ to the angle $\\angle BAC\\cong pS\\widehat{q}$. Since the isometry $\\mathcal{\\widehat{I}}$ also maps the point $A$ to the point $S$, the ray $AB$ to the ray $Sp$, and the half-plane $ABC$ to the half-plane $\\pi'$, according to axiom \\ref{aksIII2}, $\\mathcal{\\widehat{I}}=\\mathcal{I}$. Therefore, $$S\\widehat{q}=\\mathcal{\\widehat{I}}(AB)=\\mathcal{I}(AB)=Sq,$$ which was to be proven.
\\qed
Since the carrier of the ray $Sp$ from the previous theorem determines two half-planes, there are two angles with the arm $Sp$ that are congruent to the angle $\\alpha$. These angles are differently oriented. This means that for the oriented angle $\\alpha$, only one of these two angles has the same orientation as $\\alpha$ (Figure \\ref{sl.aks.2.3.15.pic}).
\\begin{figure}[!htb]
\\centering
\\input{sl.aks.2.3.15.pic}
\\caption{} \\label{sl.aks.2.3.15.pic}
\\end{figure}
Similar to line segments, we define certain operations and relations between angles.
The angle $pq$ with the vertex $S$ is the \\index{sum!of angles}\\concept{sum of angles} $ab$ and $cd$, i.e., $\\angle pq = \\angle ab + \\angle cd$, if there exists a ray $s=SX$ that lies in the angle $pq$ and $\\angle ps \\cong \\angle ab$ and $\\angle sq \\cong \\angle cd$ hold (Figure \\ref{sl.aks.2.3.16.pic}). In this case, we also say that the angle $ab$ is the \\index{difference!of angles}\\concept{difference of angles} $pq$ and $cd$, i.e., $\\angle ab= \\angle pq - \\angle cd$.
\\begin{figure}[!htb]
\\centering
\\input{sl.aks.2.3.16.pic}
\\caption{} \\label{sl.aks.2.3.16.pic}
\\end{figure}
Analogously to line segments, for the angle $ab$, we define angles $n\\cdot \\angle ab$ and $\\frac{1}{n}\\cdot \\angle ab$ ($n\\in \\mathbb{N}$) and $q\\cdot \\angle ab$ ($q\\in \\mathbb{Q}$).
We say that the angle $ab$ with the vertex $S$ is \\index{relation!of order of angles}\\concept{greater} than the angle $cd$ ($\\angle ab \> \\angle cd$) if there exists a ray $s=SX$ in the angle $ab$ such that $\\angle as \\cong \\angle cd$ holds (Figure \\ref{sl.aks.2.3.17.pic}). In this case, the angle $cd$ is also \\concept{smaller} than the angle $ab$ ($\\angle cd\< \\angle ab$). It is not difficult to prove that for two angles $ab$ and $cd$, exactly one of the relations: $\\angle ab \> \\angle cd$, $\\angle ab \< \\angle cd$, or $\\angle ab \\cong \\angle cd$ holds.
\\begin{figure}[!htb]
\\centering
\\input{sl.aks.2.3.17.pic}
\\caption{} \\label{sl.aks.2.3.17.pic}
\\end{figure}
Angles are \\index{angles!supplementary}\\concept{supplementary} if their sum is equal to a straight angle (Figure \\ref{sl.aks.2.3.18.pic}).
\\begin{figure}[!htb]
\\centering
\\input{sl.aks.2.3.18.pic}
\\caption{} \\label{sl.aks.2.3.18.pic}
\\end{figure}
The ray $s=SX$ is the \\index{bisector of an angle}\\concept{bisector of the angle} $\\angle pSq=\\alpha$ (Figure \\ref{sl.aks.2.3.19.pic}) if it lies in this angle and $\\angle ps \\cong \\angle sq$ holds. The carrier of this bisector is the \\index{symmetry line!of an angle}\\concept{symmetry line of the angle} $pSq$ (line $s\_{\\alpha}$).
\\begin{figure}[!htb]
\\centering
\\input{sl.aks.2.3.19.pic}
\\caption{} \\label{sl.aks.2.3.19.pic}
\\end{figure}
Similar to the midpoint of a line segment, the following theorem holds for the bisector of an angle.
\\begin{theorem} \\label{izrekSimetralaKota}
An angle has exactly one bisector.
\\end{theorem}
\\textbf{\\textit{Proof.}}
Let $\\alpha=pSq$ be an arbitrary angle, $P$ an arbitrary point lying on the arm $Sp$ ($P\\neq S$), and $Q$ a point lying on the arm $Sq$ such that $SP\\cong SQ$.
\\begin{figure}[!htb]
\\centering
\\input{sl.aks.2.3.20.pic}
\\caption{} \\label{sl.aks.2.3.20.pic}
\\end{figure}
Assume that the angle $\\alpha$ is a straight angle (Figure \\ref{sl.aks.2.3.20.pic}), which determines the half-plane $\\pi$. Let $A$ be its arbitrary point. According to theorem \\ref{izomEnaC'}, there exists a unique point $B$ in the half-plane $\\pi$ such that $(P,Q,A)\\cong (Q,P,B)$. From theorem \\ref{IizrekABC}, it follows that there exists a unique isometry $\\mathcal{I}$ that maps the points $P$, $Q$, and $A$ to the points $Q$, $P$, and $B$. Let $\\mathcal{I}(B)=\\widehat{A}$. Since $(Q,P,B)\\cong(P,Q,\\widehat{A})$, according to theorem \\ref{izomEnaC'}, $\\widehat{A}=A$. Therefore:
$$\\mathcal{I}:P,Q,A,B\\mapsto Q,P,B,A.$$
Therefore, the midpoints $S$ and $L$ of the line segments $PQ$ and $AB$ are mapped onto themselves (axiom \\ref{aksIII4}), which then holds for the ray $s=SL$ and every point on it (theorem \\ref{izoABAB}). Therefore, the isometry $\\mathcal{I}$ maps the angle $pSs$ to the angle $sSq$, so $pSs\\cong sSq$, i.e., the ray $s$ is the bisector of the angle $pSq$.
Let us prove that $s$ is the only bisector of the angle $\\alpha$. Let $\\widehat{s}=S\\widehat{L}$ be a ray that lies in the angle $\\alpha$ and $pS\\widehat{s}\\cong \\widehat{s}Sq$ holds. Then there exists an isometry $\\mathcal{\\widehat{I}}$ that maps the angle $pS\\widehat{s}$ to the angle $\\widehat{s}Sq$. This isometry maps the point $S$ to the point $S$, the ray $p$ to the ray $q$, and the half-plane $\\pi$ to the half-plane $\\pi$, so according to axiom \\ref{aksIII2}, $\\mathcal{\\widehat{I}}=\\mathcal{I}$. Therefore, $\\mathcal{I}(\\widehat{s})= \\mathcal{\\widehat{I}}(\\widehat{s})=\\widehat{s}$. If $\\widehat{L} \\notin s$, the isometry $\\mathcal{I}$ maps three non-collinear points $S$, $L$, and $\\widehat{L}$ onto themselves, and $\\mathcal{I}$ is the identity mapping (theorem \\ref{IizrekABCident}), which is not possible. Therefore, $\\widehat{L} \\in s$, i.e., $\\widehat{s}=s$.
If $\\alpha$ is a non-convex angle, the bisector is obtained as the complementary (supplementary) ray of the ray $s$.
\\qed
Let us prove two theorems related to adjacent and vertical angles.\\index{angles!adjacent} \\index{angles!vertical}
\\begin{theorem}
The adjacent supplementary angles of two congruent angles are also congruent. \\label{sokota}
\\end{theorem}
\\begin{figure}[!htb]
\\centering
\\input{sl.aks.2.3.20a.pic}
\\caption{} \\label{sl.aks.2.3.20a.pic}
\\end{figure}
\\textbf{\\textit{Proof.}} Let $\\alpha'=\\angle P'OQ$ and $\\alpha\_1'=\\angle P\_1'O\_1Q\_1$ be the adjacent angles of two congruent angles $\\alpha=\\angle POQ$ and $\\alpha\_1=\\angle P\_1O\_1Q\_1$ (Figure \\ref{sl.aks.2.3.20a.pic}). According to axiom \\ref{aksIII2}, there exists a unique isometry $\\mathcal{I}$ that maps the point $O$ to the point $O\_1$, the ray $OP$ to the ray $O\_1P\_1$, and the half-plane $POQ$ to the half-plane $P\_1O\_1Q\_1$. Let $Q\_2=\\mathcal{I}(Q)$. Then $\\angle P\_1O\_1Q\_2\\cong \\angle POQ$. The isometry $\\mathcal{I}$ maps the half-plane $POQ$ to the half-plane $P\_1O\_1Q\_1$, so the point $Q\_2$ (and also the ray $O\_1Q\_2$) lies in the half-plane $P\_1O\_1Q\_1$. Since by assumption $\\angle POQ\\cong\\angle P\_1O\_1Q\_1$, according to theorem \\ref{KotNaPoltrak}, $OQ\_1$ and $OQ\_2$ represent the same ray. Therefore, the point $Q\_2$ lies on the ray $O\_1Q\_1$. Let $P\_2'=\\mathcal{I}(P')$. Since isometries map rays to rays (theorem \\ref{izrekIzoB}), the point $P\_2'$ lies on the ray $O\_1P\_1'$. From $\\mathcal{I}:P',O,Q\\mapsto P\_2',O\_1,Q\_2$, it follows that the isometry $\\mathcal{I}$ maps the angle $P'OQ$ to the angle $P\_2'O\_1Q\_2$ (theorem \\ref{izrekIzoB}), so $\\angle P'OQ\\cong \\angle P\_2'O\_1Q\_2=\\angle P\_1'O\_1Q\_1$.
\\qed
\\begin{theorem} \\label{sovrsnaSkladna}
Vertical angles are congruent.
\\end{theorem}
\\begin{figure}[!htb]
\\centering
\\input{sl.aks.2.3.20b.pic}
\\caption{} \\label{sl.aks.2.3.20b.pic}
\\end{figure}
\\textbf{\\textit{Proof.}} Let $\\alpha=\\angle POQ$ and $\\alpha'=\\angle P'OQ'$ be vertical angles, where the points $P$, $O$, $P'$ (or $Q$, $O$, $Q'$) are collinear (Figure \\ref{sl.aks.2.3.20b.pic}). The angle $\\beta=\\angle QOP'$ is the adjacent angle for both angles $\\alpha$ and $\\alpha'$. Since $\\beta\\cong\\beta$, according to the previous theorem \\ref{sokota}, $\\alpha\\cong\\alpha'$.
\\qed
\\begin{theorem} \\label{sredZrcObstoj}
For each point $S$, there exists an isometry $\\mathcal{I}$ such that $\\mathcal{I}(S)=S$. In addition, for each point $X\\neq S$, the following holds: if $\\mathcal{I}(X)=X'$, then $S$ is the midpoint of the line segment $XX'$.
\\end{theorem}
\\begin{figure}[!htb]
\\centering
\\input{sl.aks.2.3.20c.pic}
\\caption{} \\label{sl.aks.2.3.20c.pic}
\\end{figure}
\\textbf{\\textit{Proof.}} Let $P$ be an arbitrary point different from $S$ (Figure \\ref{sl.aks.2.3.20c.pic}). According to axiom \\ref{AksII3}, there exists such a point $Q$ on the line $SP$ that $\\mathcal{B}(P,S,Q)$ holds. Denote the half-planes determined by the edge $SP$ as $\\alpha$ and $\\alpha'$. According to axiom \\ref{aksIII2}, there exists (a unique) isometry $\\mathcal{I}$ that maps the point $S$ to the point $S$, the ray $SP$ to the ray $SQ$, and the half-plane $\\alpha$ to the half-plane $\\alpha'$.
Denote the line $SP$ as $p$. The point $P'=\\mathcal{I}(P)$ lies on the ray $SQ$, i.e., the line $p$. Since $\\mathcal{I}:S,P \\mapsto S,P'$, according to axiom \\ref{aksIII1}, the line $SP$ is mapped to the line $SP'$, i.e., $\\mathcal{I}:p\\rightarrow p$. The image of the half-plane $\\alpha'$ with the edge $p$ is therefore a half-plane with the same edge (theorem \\ref{izrekIzoB}). This half-plane cannot be $\\alpha'$, as the isometry $\\mathcal{I}$ is a bijective mapping and by assumption maps the half-plane $\\alpha$ to the half-plane $\\alpha'$. Therefore, $\\mathcal{I}:\\alpha'\\rightarrow \\alpha$.
Now it is clear that without loss of generality, it is sufficient to derive the proof only for points lying in the half-plane $\\alpha$ (without the edge or only the ray $SP$).
Let $X\\in \\alpha\\setminus p$ and $X'=\\mathcal{I}(X)$. It is immediately clear that $X'\\in \\alpha'\\setminus p$. According to axiom \\ref{AksII3}, there exists such a point $X\_1$ on the line $SX$ that $\\mathcal{B}(X,S,X\_1)$ holds. Since $\\angle PSX$ and $\\angle P'SX\_1$ are vertical angles, they are congruent according to theorem \\ref{sovrsnaSkladna}. However, from $\\mathcal{I}:S,P,X \\mapsto S,P',X'$, it follows that $\\angle PSX \\cong \\angle P'SX'$. Therefore, $\\angle P'SX\_1\\cong \\angle P'SX'$ (theorem \\ref{sklRelEkv}), so according to theorem \\ref{KotNaPoltrak}, the rays $SX\_1$ and $SX'$ are identical. This means that the point $X'$ lies on the ray $SX\_1$, i.e., $\\mathcal{B}(X,S,X')$. Since due to $\\mathcal{I}:S,X \\mapsto S,X'$, it is also $SX\\cong SX'$, according to the definition, the point $S$ is the midpoint of the line segment $XX'$.
Finally, let $Y$ be an arbitrary point of the ray $SP$ different from the point $S$, and $Y'=\\mathcal{I}(Y)$. The point $Y'$ lies on the ray $SQ$, so $\\mathcal{B}(Y,S,Y')$. Since due to $\\mathcal{I}:S,Y \\mapsto S,Y'$, it is also $SY\\cong SY'$, according to the definition, the point $S$ is the midpoint of the line segment $YY'$.
\\qed
In section \\ref{odd6SredZrc}, we will specifically discuss the isometry mentioned in the previous theorem \\ref{sredZrcObstoj}.
Let us define new types of angles. A convex angle is an \\index{angle!acute}\\concept{acute angle}, \\index{angle!right} \\concept{right angle}, or \\index{angle!obtuse}\\concept{obtuse angle} if it is smaller, equal, or greater than its adjacent angle (Figure \\ref{sl.aks.2.3.21.pic}).
\\begin{figure}[!htb]
\\centering
\\input{sl.aks.2.3.21.pic}
\\caption{} \\label{sl.aks.2.3.21.pic}
\\end{figure}
From the definition, it follows that acute (or obtuse) angles are those convex angles that are smaller (or greater) than a right angle.
From theorem \\ref{izrekSimetralaKota}, it follows that a right angle exists, as the bisector divides a straight angle into two congruent adjacent angles.
It is not difficult to prove that any two right angles are congruent and that an angle congruent to a right angle is also a right angle.
If the sum of two angles is a right angle, we say that the angles are \\index{angles!complementary}\\concept{complementary} (Figure \\ref{sl.aks.2.3.22.pic}).
\\begin{figure}[!htb]
\\centering
\\input{sl.aks.2.3.22.pic}
\\caption{} \\label{sl.aks.2.3.22.pic}
\\end{figure}
Now we will introduce an extremely important relation between lines. If the lines $p$ and $q$ contain the arms of a right angle, we say that $p$ and $q$ are \\concept{perpendicular}, denoted $p \\perp q$ (Figure \\ref{sl.aks.2.3.23.pic}).
\\begin{figure}[!htb]
\\centering
\\input{sl.aks.2.3.23.pic}
\\caption{} \\label{sl.aks.2.3.23.pic}
\\end{figure}
From the definition itself, it is clear that perpendicularity is a symmetric relation, i.e., from $p \\perp q$, it follows that $q \\perp p$. If $p \\perp q$ and $p \\cap q=S$, we say that the line $p$ is \\index{perpendicular!lines}\\concept{perpendicular} to the line $q$ at the point $S$, or that $p$ is a \\index{perpendicular line}\\concept{perpendicular line} of the line $q$ at this point.
The following theorem is the most important theorem characterizing the relation of perpendicularity.
\\begin{theorem} \\label{enaSamaPravokotnica}
For each point $A$ and each line $p$, there is a unique line $n$ going through the point $A$, which is perpendicular on the line $p$.
\\end{theorem}
\\textbf{\\textit{Proof.}}
Assume that the point $A$ does not lie on the line $p$. Let $B$ and $C$ be arbitrary points lying on the line $p$ (Figure \\ref{sl.aks.2.3.24.pic}). Denote the half-plane $BCA$ as $\\pi$, and the complementary half-plane as $\\pi\_1$. According to theorem \\ref{izomEnaC'}, there exists a unique point $A\_1\\in \\pi\_1$ for which $(A,B,C) \\cong (A\_1,B,C)$. From theorem \\ref{IizrekABC}, it follows that there exists a unique isometry $\\mathcal{I}$ that maps the points $A$, $B$, and $C$ to the points $A\_1$, $B$, and $C$. Denote the line $AA\_1$ as $n$. Since $A$ and $A\_1$ are on different sides of the line $p$, the line $n$ intersects the line $p$ at some point $S$. From $\\mathcal{I}:B,C \\mapsto B,C$, it follows that $\\mathcal{I}(S)=S$ (theorem \\ref{izoABAB}). Therefore, the isometry $\\mathcal{I}$ maps the angle $ASB$ to the angle $A\_1SB$. It follows that the angles $\\angle ASB$ and $\\angle A\_1SB$ are congruent adjacent angles, so they are also right angles. Therefore, $n \\perp p$.
\\begin{figure}[!htb]
\\centering
\\input{sl.aks.2.3.24.pic}
\\caption{} \\label{sl.aks.2.3.24.pic}
\\end{figure}
Let us prove that $n$ is the only perpendicular line to the line $p$ through the point $A$. Let $\\widehat{n}$ be a line for which $A\\in \\widehat{n}$ and $\\widehat{n} \\perp p$. Let $\\widehat{S}$ be the intersection of the lines $\\widehat{n}$ and $p$. By assumption, $\\angle A\\widehat{S}B$ is a right angle and is congruent to its adjacent angle $\\angle B\\widehat{S}A\_2$ ($A\_2$ is such a point that $\\mathcal{B}(A,\\widehat{S},A\_2)$ holds), which is also a right angle.
From $\\mathcal{I}:B,C \\mapsto B,C$, it follows that $\\mathcal{I}(\\widehat{S})=\\widehat{S}$ (theorem \\ref{izoABAB}). Therefore, the isometry $\\mathcal{I}$ maps the angle $A\\widehat{S}B$ to the angle $A\_1\\widehat{S}B$. It follows that the angles $\\angle A\\widehat{S}B$ and $\\angle A\_1\\widehat{S}B$ are congruent, so the angle $\\angle A\_1\\widehat{S}B$ is also a right angle. Therefore, the angles $A\_1\\widehat{S}B$ and $A\_2\\widehat{S}B$ are right angles and are therefore congruent. From this, it follows that the rays $\\widehat{S}A\_1$ and $\\widehat{S}A\_2$ are the same, so $A\_1 \\in \\widehat{S}A\_2=\\widehat{n}$, i.e., $\\widehat{n}=AA\_1=n$.
In the case when the point $A$ lies on the line $p$, the perpendicular line $n$ is the bisector of the corresponding straight angle (theorem \\ref{izrekSimetralaKota}).
\\qed
The previous theorem has the consequence of a very important fact - the existence of pairs of disjoint lines in the plane - i.e., those that do not have common points. This is the content of the following two theorems.
\\begin{theorem} \\label{absolGeom1}
Let $p$ and $q$ be lines perpendicular on a line $PQ$ in the points $P$ and $Q$. Then the lines $p$ and $q$ do not have a common points i.e. $p\\cap q=\\emptyset$.
\\end{theorem}
\\begin{figure}[!htb]
\\centering
\\input{sl.aks.2.3.25b.pic}
\\caption{} \\label{sl.aks.2.3.25b.pic}
\\end{figure}
\\textbf{\\textit{Proof.}} The theorem is a direct consequence of the previous theorem \\ref{enaSamaPravokotnica}. If the lines $p$ and $q$ were to intersect at some point $S$, there would be two perpendicular lines from the point $S$ to the line $PQ$ (Figure \\ref{sl.aks.2.3.25b.pic}), which contradicts the mentioned theorem.
\\qed
\\begin{theorem} \\label{absolGeom}
If $A$ is a point that does not lie on a line $p$, then there exists at least one line (in the same plane) passing through the point $A$ and not intersecting the line $p$ (Figure \\ref{sl.aks.2.3.25a.pic}).
\\end{theorem}
\\begin{figure}[!htb]
\\centering
\\input{sl.aks.2.3.25a.pic}
\\caption{} \\label{sl.aks.2.3.25a.pic}
\\end{figure}
\\textbf{\\textit{Proof.}} According to theorem \\ref{enaSamaPravokotnica}, there exists (exactly one) perpendicular line $n$ to the line $p$ that passes through the point $A$. Denote the intersection of the lines $p$ and $n$ as $A'$. From the same theorem, it follows that there exists another perpendicular line $q$ to the line $n$ at the point $A$. According to the previous theorem \\ref{absolGeom1}, $q$ is a line that passes through the point $A$ and does not have common points with the line $p$.
\\qed
The point $A'$ is the \\index{foot}\\concept{foot} or \\index{orthogonal projection}\\concept{orthogonal projection} of the point $A$ on the line $p$ if the perpendicular line to the line $p$ through the point $A$ intersects this line at the point $A'$. We will denote it as $A'=pr\_{\\perp p}(A)$ (Figure \\ref{sl.aks.2.3.25.pic}). From the previous theorem, it follows that for every point and line, there exists a unique orthogonal projection.
\\begin{figure}[!htb]
\\centering
\\input{sl.aks.2.3.25.pic}
\\caption{} \\label{sl.aks.2.3.25.pic}
\\end{figure}
The line that passes through the midpoint $S$ of the line segment $AB$ and is perpendicular to the line $AB$ is called the \\index{symmetry line!of a segment}\\concept{symmetry line of the segment} $AB$ and is denoted by $s\_{AB}$ (Figure \\ref{sl.aks.2.3.26.pic}). The properties of the symmetry line of a segment will be discussed in the next chapter.
\\begin{figure}[!htb]
\\centering
\\input{sl.aks.2.3.26.pic}
\\caption{} \\label{sl.aks.2.3.26.pic}
\\end{figure}
We say that the point $A$ is \\index{symmetry!with respect to a line}\\concept{symmetric} to the point $B$ with respect to the line $s$ if $s$ is the symmetry line of the line segment $AB$. Symmetry with respect to a line (as a mapping - so-called axial reflection) will be discussed in more detail in section \\ref{odd6OsnZrc}.
Let $S$ be a point and $AB$ a line segment. The set of all points $X$ for which $SX \\cong AB$ holds is called a \\index{circle}\\concept{circle} with \\index{center!of a circle}\\concept{center} $S$ and \\index{radius of a circle}\\concept{radius} $AB$; we denote it by $k(S,AB)$ (Figure \\ref{sl.aks.2.3.27.pic}), i.e.:
$$k(S,AB)=\\{X;\\hspace\*{1mm}SX \\cong AB\\}.$$
\\begin{figure}[!htb]
\\centering
\\input{sl.aks.2.3.27.pic}
\\caption{} \\label{sl.aks.2.3.27.pic}
\\end{figure}
Of course, the circle is a set of points in the plane, as in this book, we only deal with plane geometry (all points and all figures belong to the same plane).
From the definition, it is clear that for the radius, we can choose any line segment that is congruent to the line segment $AB$, i.e., any line segment $SP$, where $P$ is an arbitrary point on the circle. Since the radius is not tied to a specific line segment, we usually denote it with a lowercase letter $r$. Therefore, we can also write the circle as follows:
$$k(S,r)=\\{X;\\hspace\*{1mm}SX \\cong r\\}.$$
The set
$$\\{X;\\hspace\*{1mm}SX \\leq r\\}$$
is called a \\index{disk}\\concept{disk} with center $S$ and radius $r$ (Figure \\ref{sl.aks.2.3.28.pic}) and is denoted by $\\mathcal{K}(S,r)$.
The set
$$\\{X;\\hspace\*{1mm}SX \< r\\}$$
is the \\index{interior!of a disk} \\concept{interior of the disk} $\\mathcal{K}(S, r)$, and its points are \\concept{interior points of the disk}.
This means that the disk is actually the union of its interior and the corresponding circle.
The set
$$\\{X;\\hspace\*{1mm}SX \> r\\}$$
is called the \\index{exterior!of a disk}\\concept{exterior of the disk} $\\mathcal{K}(S, r)$ and its points are \\concept{exterior points of the disk}.`
```
We can see here that this one chunk in particular translates only the text, but leaves LaTeX commands intact.
Let’s now translate all the chunks in the book - this will take 2-3 hours, as we’re processing requests sequentially.
```
`dest\_language = "English"
translated\_chunks = []
for i, chunk in enumerate(chunks):
print(str(i+1) + " / " + str(len(chunks)))
# translate each chunk
translated\_chunks.append(translate\_chunk(chunk, model='gpt-4o', dest\_language=dest\_language))
# join the chunks together
result = '\\n\\n'.join(translated\_chunks)
# save the final result
with open(f"data/geometry\_{dest\_language}.tex", "w") as f:
f.write(result)`
```
```
`from concurrent.futures import ThreadPoolExecutor, as\_completed
# Function to translate a single chunk
def translate\_chunk\_wrapper(chunk, model='gpt-4o', dest\_language='English'):
return translate\_chunk(chunk, model=model, dest\_language=dest\_language)
# Set the destination language
dest\_language = "English"
# List to store translated chunks
translated\_chunks = []
# Use ThreadPoolExecutor to parallelize the translation
with ThreadPoolExecutor(max\_workers=5) as executor:
# Submit all translation tasks
futures = {executor.submit(translate\_chunk\_wrapper, chunk, 'gpt-4o', dest\_language): i for i, chunk in enumerate(chunks)}
# Process completed tasks as they finish
for future in as\_completed(futures):
i = futures[future]
try:
translated\_chunk = future.result()
translated\_chunks.append(translated\_chunk)
print(f"Chunk {i+1} / {len(chunks)} translated.")
except Exception as e:
print(f"Chunk {i+1} failed with exception: {e}")
# Join the translated chunks together
result = '\\n\\n'.join(translated\_chunks)
# Save the final result
with open(f"data/geometry\_{dest\_language}.tex", "w") as f:
f.write(result)`
```
```
`Chunk 1 / 39 translated.
Chunk 3 / 39 translated.
Chunk 5 / 39 translated.
Chunk 2 / 39 translated.
Chunk 6 / 39 translated.
Chunk 4 / 39 translated.
Chunk 8 / 39 translated.
Chunk 7 / 39 translated.
Chunk 9 / 39 translated.
Chunk 14 / 39 translated.
Chunk 10 / 39 translated.
Chunk 11 / 39 translated.`
```