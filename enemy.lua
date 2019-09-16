Enemy = Object:extend()

function Enemy:new()
end

function Enemy:getDistance(x1, y1, x2, y2)
    local hDist = x1 - x2
    local vDist = y1 - y2

    local dist = math.sqrt((hDist ^ 2) + (vDist ^ 2))
    return dist
end

function Enemy:updateMovement(dt)
end

function Enemy:updateRotation()
end

function Enemy:update(dt)
    self:updateRotation()
    self:updateMovement(dt)
end

function Enemy:draw()
end
