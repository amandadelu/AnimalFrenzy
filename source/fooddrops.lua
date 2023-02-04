local pd <const> = playdate
local gfx <const> = pd.graphics

class('FoodDrops').extends(gfx.sprite)

function FoodDrops:init(x, y, moveSpeed)
    local foodImage = gfx.image.new("images/goblin")
    self:setCollideRect(0,0, 30, 30)
    self:setImage(foodImage)
    self:moveTo(x, y)
    self:add()

    self.moveSpeed = moveSpeed
end

function FoodDrops:collisionResponse()
    return "overlap"
end

function FoodDrops:update()
    self:moveBy(0, self.moveSpeed)
    if self.y > 240 then
        resetGame()
    end
end






