OpenAI showcase - Forged in Silence
Primary navigation
Search docs
### Suggested
responses createreasoning\_effortrealtimeprompt caching
Showcase Blog Cookbook Learn Community
* [ Home ](/showcase)
* [ API examples ](/showcase/api-examples)
[API Dashboard](https://platform.openai.com/login)
[
← All projects
](/showcase)
Description
Forged in Silence is a premium ecommerce storefront built with Codex from a researched Vite, React, and React Three Fiber plan. The home page is a scroll-driven 3D experience where a procedurally generated katana, built without Blender or an external 3D model, animates through cinematic sections before continuing into product pages, cart behavior, checkout, custom commission requests, and contact flows.
##
Build notes
###
Initial prompt
Copy prompt
```
Create a new Vite + React project with the following setup:
1. Initialize a Vite project with React template in the root directory.
2. Install these exact dependencies:
- three
- @react-three/fiber
- @react-three/drei
- gsap
- @gsap/react
- lenis
3. Create this exact folder structure:
src/
components/
Scene.jsx
Katana.jsx
sections/
HeroDrop.jsx
BladeSection.jsx
EdgeSection.jsx
RotationSection.jsx
DrawSection.jsx
EndCard.jsx
hooks/
useScrollAnimation.js
styles/
global.css
App.jsx
main.jsx
4. In index.html, add this inside \<head\>:
\<link rel="preconnect" href="https://fonts.googleapis.com"\>
\<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+JP:wght@300;400;700&family=Bebas+Neue&display=swap" rel="stylesheet"\>
5. In src/styles/global.css write the base reset, black/white/steel/gold/accent variables, fixed full-viewport canvas styling, and scroll-container/section layout for a 100vh cinematic scroll experience.
6. In src/main.jsx render App with React.StrictMode and import global.css.
7. In src/App.jsx create a placeholder with \<Scene /\> and six 100vh scroll sections inside .scroll-container.
8. In src/components/Scene.jsx create a React Three Fiber Canvas with camera position [0, 0, 5], ambient and directional lighting, and a simple metallic blade placeholder mesh.
Make sure vite.config.js is standard React config. Run npm install. Do not run the dev server. Run "npm run build" and fix any errors that appear. Do not change any visual or logic code — only fix build errors.
```
[
Try in Codex
](<codex://new?prompt=Create+a+new+Vite+++React+project+with+the+following+setup:
1.+Initialize+a+Vite+project+with+React+template+in+the+root+directory.
2.+Install+these+exact+dependencies:
-+three
-+@react-three/fiber
-+@react-three/drei
-+gsap
-+@gsap/react
-+lenis
3.+Create+this+exact+folder+structure:
src/
components/
Scene.jsx
Katana.jsx
sections/
HeroDrop.jsx
BladeSection.jsx
EdgeSection.jsx
RotationSection.jsx
DrawSection.jsx
EndCard.jsx
hooks/
useScrollAnimation.js
styles/
global.css
App.jsx
main.jsx
4.+In+index.html,+add+this+inside+<head>:
<link+rel="preconnect"+href="https://fonts.googleapis.com">
<link+href="https://fonts.googleapis.com/css2?family=Noto+Serif+JP:wght@300;400;700&family=Bebas+Neue&display=swap"+rel="stylesheet">
5.+In+src/styles/global.css+write+the+base+reset,+black/white/steel/gold/accent+variables,+fixed+full-viewport+canvas+styling,+and+scroll-container/section+layout+for+a+100vh+cinematic+scroll+experience.
6.+In+src/main.jsx+render+App+with+React.StrictMode+and+import+global.css.
7.+In+src/App.jsx+create+a+placeholder+with+<Scene+/>+and+six+100vh+scroll+sections+inside+.scroll-container.
8.+In+src/components/Scene.jsx+create+a+React+Three+Fiber+Canvas+with+camera+position+[0,+0,+5],+ambient+and+directional+lighting,+and+a+simple+metallic+blade+placeholder+mesh.
Make+sure+vite.config.js+is+standard+React+config.+Run+npm+install.+Do+not+run+the+dev+server.+Run+"npm+run+build"+and+fix+any+errors+that+appear.+Do+not+change+any+visual+or+logic+code+—+only+fix+build+errors.>)
###
Iterations
1. Researched the Vite, React, and React Three Fiber architecture, then gave Codex a detailed scaffold spec.
2. Set up the Vite app with React, Three.js, React Three Fiber, GSAP, Lenis, and a section-based component structure.
3. Built the katana procedurally in Three.js BufferGeometry without relying on Blender or an external model.
4. Tuned cinematic lighting and materials across several Codex passes, including metalness, roughness, key light, fill light, gold highlights, RectAreaLight, SpotLight, and environment reflections.
5. Connected Lenis smooth scrolling to a GSAP ScrollTrigger timeline across six cinematic sections.
6. Added mixed Japanese and English typography, scroll-triggered text reveals, dust particles, vignette, CRT scanlines, a gold progress indicator, DPR capping, and responsive camera behavior.
7.
Final step
Expanded the cinematic 3D scene into a complete storefront with product pages, cart behavior, checkout, custom commission requests, and contact flows.
Built with
Codex + GPT-5.4
Model
GPT-5.4
APIs / Products
Codex
Tech stack
[ React ](/showcase?tech_stack=React)[ Three.js ](/showcase?tech_stack=Three.js)ViteGSAPLenis
Use case
[ Ecommerce ](/showcase?use_case=ecommerce)[ Visual experience ](/showcase?use_case=visual-experience)
Harness
Codex
Type
[ Storefront ](/showcase?app_type=storefront)
##
Related projects
[
### E-commerce website
This storefront was generated with Codex, using `gpt-image-1
GPT-5.4 Codex Next.js
](/showcase/e-commerce-website)[
### Watchmaker Landing Page
This landing page was generated with Codex + GPT-5
GPT-5.5 Codex
](/showcase/watchmaker-landing-page)[
### London Dream Railway
London Dream Railway is an interactive 3D scene with miniature trains...
GPT-5.4 Codex Three.js
](/showcase/london-train)