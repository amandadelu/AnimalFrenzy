local pd <const> = playdate
local gfx <const> = pd.graphics

-- Removes all sprites from the screen
function clearSprites()
    local allSprites = gfx.sprite.getAllSprites()
    for index, sprite in ipairs(allSprites) do
        sprite:remove()
    end
 end
  
 -- Sets the background image
 function setBackground(imageName)
    -- Display a background image
    local backgroundImage = gfx.image.new( "images/" .. imageName )
    assert(backgroundImage)
  
    gfx.sprite.setBackgroundDrawingCallback(
        function( x, y, width, height )
            gfx.setClipRect(x,y,width, height)
            backgroundImage:draw( 0, 0 )
            gfx.clearClipRect()
        end
    )
 end
  
 -- Sets up the starting scene
 function setStartingScene()
    gameState = 'start'
    clearSprites()
  
    --PlayGameButton(200, 200)
    setBackground('AnimalFrenzyz3')
  
 end
  
 -- Sets up the game scene
 function setGameScene()
    gameState = 'game'
    clearSprites()
   
    Player(200, 220)
    createScoreDisplay()
    startSpawner()
    setBackground('backgroundEmpty')
 end
  
 -- Sets up the game over scene
 function setGameOverScene()
    gameState = 'game over'
    stopSpawner()
    --showFinalScore()
    
    clearSprites()
    setBackground('YouLost2')
 end