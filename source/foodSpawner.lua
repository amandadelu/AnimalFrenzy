import "fooddrops"

local pd <const> = playdate
local gfx <const> = pd.graphics

local spawnTimer

function startSpawner()
    math.randomseed(pd.getSecondsSinceEpoch())
    createTimer()
end

function createTimer()
    local spawnTime = math.random(500, 1000)
    spawnTimer = pd.timer.performAfterDelay(spawnTime, function ()
    createTimer()
    spawnFood()
end)
end

function spawnFood()
    local spawnPosition = math.random(10, 400)
    FoodDrops(spawnPosition, 60, 1)
end

function stopSpawner()
    if spawnTimer then
        spawnTimer:remove()
    end
end

function clearEnemies()
    local allSprites = gfx.sprite.getAllSprites()
    for index, sprite in ipairs(allSprites) do
        if sprite:isa(FoodDrops) then
            sprite:remove()
            saveScore(getScore())
        end        
    end
end





