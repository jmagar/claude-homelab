OpenAI showcase - Theme Park Builder
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
This mini-game was generated with Codex + GPT-5.5, using GPT Image 1.5 for visual assets. You can add rides, paths, shops, and scenery to build out a theme park scene.
##
Build notes
###
Initial prompt
Copy prompt
```
Generate a React app: a minigame, theme park builder, isometric style. Use Image Gen to create the sprites with GPT Image 1.5.
I want the user to have funds and they get more funds as more guests are using the theme park. With the funds they can build the park, adding more on the map (path, benches, restrooms, rides...).
Show a status bar with funds, guests, happiness level, cleanliness, and overall rating. Also show a panel with live guest reactions.
```
[
Try in Codex
](<codex://new?prompt=Generate+a+React+app:+a+minigame,+theme+park+builder,+isometric+style.+Use+Image+Gen+to+create+the+sprites+with+GPT+Image+1.5.
I+want+the+user+to+have+funds+and+they+get+more+funds+as+more+guests+are+using+the+theme+park.+With+the+funds+they+can+build+the+park,+adding+more+on+the+map+(path,+benches,+restrooms,+rides...).
Show+a+status+bar+with+funds,+guests,+happiness+level,+cleanliness,+and+overall+rating.+Also+show+a+panel+with+live+guest+reactions.>)
###
Iterations
1. Generated the initial GPT Image 1.5 sprite set for paths, amenities, rides, food stands, gardens, and guests.
2. Built the core management loop with funds, guests, income, build costs, cleanliness, happiness, and rating.
3. Added the main UI surfaces: status bar, build panel, isometric map, selected-item inspector, and guest reactions.
4. Polished the isometric presentation by grounding sprites, removing visible guest sprites while keeping the simulation, and expanding the map.
5. Regenerated and normalized the path sprite so it filled the isometric tile cleanly.
6. Retuned the color system and verified the app through production builds and browser reloads.
7.
Final step
Finished the isometric theme park builder with normalized sprites, a larger visible map, a tuned economy loop, and polished management UI.
Built with
Codex + GPT-5.5 + GPT Image 1.5
Models
GPT-5.5GPT Image 1.5
APIs / Products
Codex
Tech stack
[ React ](/showcase?tech_stack=React)TypeScript
Use case
[ Games ](/showcase?use_case=games)
Type
[ Game ](/showcase?app_type=game)
##
Related projects
[
### Brick Platformer
This platformer game was generated with Codex + GPT-5
GPT-5.5 Codex React
](/showcase/brick-platformer)[
### Neon FPS
This browser FPS game was generated with Codex + GPT-5
GPT-5.5 Codex React
](/showcase/rift-vox)[
### Turn-based RPG
Play a turn-based RPG where GPT-5
GPT-5.4 Codex Next.js
](/showcase/turn-based-rpg)