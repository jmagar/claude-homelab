OpenAI showcase - Brick Platformer
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
This platformer game was generated with Codex + GPT-5.5, using GPT Image 1.5 for visual assets. It places the player in a side-scrolling brick city scene with jump timing, platforms, and arcade movement.
##
Build notes
###
Initial prompt
Copy prompt
```
@game-studio build a 2D platformer, full screen, using imagegen to create sprites and other assets, and use @playwright-interactive to test that it works well visually. It needs to be a simple 2D platformer built with Phaser where the character jumps on platforms and goes up a brick building.
```
[
Try in Codex
](codex://new?prompt=@game-studio+build+a+2D+platformer,+full+screen,+using+imagegen+to+create+sprites+and+other+assets,+and+use+@playwright-interactive+to+test+that+it+works+well+visually.+It+needs+to+be+a+simple+2D+platformer+built+with+Phaser+where+the+character+jumps+on+platforms+and+goes+up+a+brick+building.)
###
Iterations
1. Generated the first Phaser platformer with GPT Image 1.5 sprites, environment assets, and in-browser visual testing.
2. Regenerated the character as a hooded climber with proper run and jump frames instead of mirrored placeholder motion.
3. Reworked the background so brick buildings frame an open night sky and full moon.
4. Iterated on platform spacing several times so jumps were challenging but the climb remained possible.
5. Fixed animation alignment issues that made the character shift vertically while running.
6. Added focused browser smoke coverage to verify the visuals and confirm the top-route treasure could be reached.
7.
Final step
Finished the platformer after browser checks confirmed the visual presentation worked and the final treasure route was reachable.
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
### Neon FPS
This browser FPS game was generated with Codex + GPT-5
GPT-5.5 Codex React
](/showcase/rift-vox)[
### Swifty Dungeon
Swifty Dungeon is a playable native macOS dungeon crawler created...
GPT-5.5 Codex Swift
](/showcase/swifty-dungeon)[
### Swifty Roguelike
Swifty Roguelike is a playable native macOS prototype created with Codex...
GPT-5.5 Codex Swift
](/showcase/swifty-roguelike)