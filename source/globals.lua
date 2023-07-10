local pd <const> = playdate
local gfx <const> = pd.graphics


--Global gamestate variable which indicates what stage the user is at (start, game, game over)
gameState = 'start'

score = 0

playerSpeedMultiplier = 1
dropSpeedMultiplier = 1