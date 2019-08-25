require "player"

TestScene = Scene:extend()

function TestScene:new()
	TestScene.super.new(self)
	self:addEntity(Player())
end

function TestScene:draw()
	love.graphics.setColor(1, 1, 1, 1)
	TestScene.super.draw(self)
end
