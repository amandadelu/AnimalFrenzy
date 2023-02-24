import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

import "player"
--import "fooddrops"
import "scoreDisplay"
import "foodSpawner"
import "globals"
import "sceneController"
import "playGameButton"

local pd <const> = playdate
local gfx <const> = playdate.graphics

setStartingScene()

function resetGame()
	resetScore()
	clearEnemies()
	stopSpawner()
	startSpawner()
end

createScoreDisplay()
Player(200, 220)
--FoodDrops(200, 60, 1)
startSpawner()

local playerSprite = nil


--local backgroundImage = gfx.image.new("images/spritesheet1")
--gfx.sprite.setBackgroundDrawingCallback(
	--function(x, y, width, height)
		--gfx.setClipRect(x,y,width, height)
		--backgroundImage:draw(0,0)
		--gfx.clearClipRect()
	--end
--)



function playdate.update()
	gfx.sprite.update()
	pd.timer.updateTimers()

end

