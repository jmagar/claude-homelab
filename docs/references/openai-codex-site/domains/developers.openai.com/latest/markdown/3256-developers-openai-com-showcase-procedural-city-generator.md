OpenAI showcase - Procedural City Generator
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
This 3D procedural city generator was generated with Codex + GPT-5.5. It lets you adjust layout, density, skyline, and visual parameters to see the city update in real time.
##
Build notes
###
Initial prompt
Copy prompt
```
Generate a React app to do procedural 3D city generation. Start by generating a mockup of what a beautiful editor for procedural generation might look like, then implement it staying as close as possible to the mockup.
There should be a full screen view of the generation, then a floating control panel on the right with controls for city size, city density, block size, street pattern, commercial vs residential vs industrial balance, and presets like industrial belt or residential area.
Add skyline controls such as average height and height variance. Add city style controls for modern glass, European, Tokyo dense, cyberpunk, and other styles that change the overall color palette and building style.
Add world controls for river probability, parks percentage, terrain roughness, and terrain style switchers like coastline or mountains. Finally, include view presets such as overhead and orbit, and make the editor pane feel modern and like a 3D editor or game engine.
```
[
Try in Codex
](<codex://new?prompt=Generate+a+React+app+to+do+procedural+3D+city+generation.+Start+by+generating+a+mockup+of+what+a+beautiful+editor+for+procedural+generation+might+look+like,+then+implement+it+staying+as+close+as+possible+to+the+mockup.
There+should+be+a+full+screen+view+of+the+generation,+then+a+floating+control+panel+on+the+right+with+controls+for+city+size,+city+density,+block+size,+street+pattern,+commercial+vs+residential+vs+industrial+balance,+and+presets+like+industrial+belt+or+residential+area.
Add+skyline+controls+such+as+average+height+and+height+variance.+Add+city+style+controls+for+modern+glass,+European,+Tokyo+dense,+cyberpunk,+and+other+styles+that+change+the+overall+color+palette+and+building+style.
Add+world+controls+for+river+probability,+parks+percentage,+terrain+roughness,+and+terrain+style+switchers+like+coastline+or+mountains.+Finally,+include+view+presets+such+as+overhead+and+orbit,+and+make+the+editor+pane+feel+modern+and+like+a+3D+editor+or+game+engine.>)
###
Iterations
1. Built the initial React and Three.js procedural city editor from a mockup, with a full-screen viewport and floating editor panel.
2. Added layout, district, skyline, city-style, world, terrain, and view-preset controls so the generated city could be shaped from the panel.
3. Expanded the visual presets so different city styles changed the palette, materials, density, and building feel.
4. Improved camera behavior with better default framing, multiple view modes, and manual orbit movement that no longer snapped back.
5. Expanded the generated footprint and terrain coverage so the city filled the viewport instead of feeling like a tight central cluster.
6. Converted most multi-choice controls to dropdowns while keeping view presets as quick icon-style switchers.
7. Added brighter default lighting and a dedicated lighting section for exposure, ambient fill, sun power, and sun height.
8.
Final step
Finished the procedural city editor with a larger default city footprint, full terrain coverage, stable camera controls, dropdown-based settings, and brighter adjustable lighting.
Built with
Codex + GPT-5.5
Model
GPT-5.5
APIs / Products
Codex
Tech stack
[ React ](/showcase?tech_stack=React)TypeScript
Use case
[ Creative tools ](/showcase?use_case=creative-tools)[ Visual experience ](/showcase?use_case=visual-experience)[ Data visualization ](/showcase?use_case=data-visualization)
Type
[ App ](/showcase?app_type=app)
##
Related projects
[
### Golden Gate Experience
This experience was generated with Codex + GPT-5
GPT-5.5 Codex React
](/showcase/golden-gate-flight-experience)[
### Real estate data viz
This app was generated with Codex + GPT-5
GPT-5.4 Codex Next.js
](/showcase/real-estate-data-viz)[
### London Dream Railway
London Dream Railway is an interactive 3D scene with miniature trains...
GPT-5.4 Codex Three.js
](/showcase/london-train)