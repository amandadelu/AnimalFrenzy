local pd <const> = playdate
local gfx <const> = pd.graphics

local scoreSprite
--local score
local highscore
local highscoreSprite
local scoreTable

function createScoreDisplay()
    --current score sprite
scoreSprite = gfx.sprite.new()
score = 0
scoreSprite:setCenter(0,0)
scoreSprite:moveTo(320, 4)
scoreSprite:add()
--highscore sprite
highscoreSprite = gfx.sprite.new()
highscoreSprite:setCenter(0,0)
highscoreSprite:moveTo(8,4)
highscoreSprite:add()
end

function loadHighscore()
    --if highscore stored load, if not set to zero
    scoreTable = playdate.datastore.read('scoreInfo')
    if scoreTable ~= nil then
        highscore = scoreTable[1]
    else 
        scoreTable = {}
        scoreTable[1] = 0
        highscore = 0
    end
end

function saveScore(newScore)
    --saves score to the device
    if scoreTable ~= nil then
        if newScore > scoreTable[1] then
            scoreTable[1] = newScore
            playdate.datascore.write(scoreTable, 'scoreInfo')
        end
    end
end


function updateDisplay()
    --current score
local scoreText = "Score: " .. score
local textWidth, textHeight = gfx.getTextSize(scoreText)
local scoreImage = gfx.image.new(textWidth, textHeight)
gfx.pushContext(scoreImage)
gfx.drawText(scoreText, 0, 0)
gfx.popContext()
scoreSprite:setImage(scoreImage)
--highscore
local highscoreText = 'Highscore:' .. highscore
local highscoreTextWidth, highscoreTextHeight = gfx.getTextSize(highscoreText)
local highscoreImage = gfx.image.new(highscoreTextWidth, highscoreTextHeight)
gfx.pushContext(highscoreImage)
gfx.drawText(highscoreText, 0, 0)
gfx.popContext()
highscoreSprite:setImage(highscoreImage)
end

function incrementScore()
    --updates the score
score += 1
--if score > highScore then
--highScore = score
 updateDisplay()
end

function resetScore()
score = 0
updateDisplay()
end

function getScore()
    return score
end
