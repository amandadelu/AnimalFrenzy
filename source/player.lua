local pd <const> = playdate
local gfx <const> = pd.graphics

class('Player').extends(gfx.sprite)
class('FoodDrops').extends(gfx.sprite)

function Player:init(x, y)
    local playerImage = gfx.image.new("images/player")
    self:setCollideRect(0,0,30, 30)
    self:setImage(playerImage)
    self:moveTo(x, y)
    self:add()


    self.speed = 5
end

function Player:update()

    local actualX, actualY, collisions, length = self:checkCollisions(self.x, self.y)
    if length > 0 then
        for index, collision in pairs(collisions) do
            local collidedObject = collision['other']
            if collidedObject:isa(FoodDrops) then
                collidedObject:remove()
                incrementScore()
            end
        end
    end
    if pd.buttonIsPressed(pd.kButtonLeft) then
        --if (self.x > 16) then -- can only move left
        self:moveBy(-self.speed, 0)
    elseif pd.buttonIsPressed(pd.kButtonRight) then
        --if (self.x < 384) then -- get stuck moving right
        self:moveBy(self.speed, 0)
    end
end


