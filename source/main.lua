import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

import "player"
--import "fooddrops"
import "scoreDisplay"
import "foodSpawner"

local pd <const> = playdate
local gfx <const> = playdate.graphics

function resetGame()
	loadHighscore()
	resetScore()
	clearEnemies()
	stopSpawner()
	startSpawner()
end

loadHighscore()
createScoreDisplay()
Player(200, 220)
--FoodDrops(200, 60, 1)
startSpawner()


local playerSprite = nil

function playdate.update()
	gfx.sprite.update()
	pd.timer.updateTimers()

end

