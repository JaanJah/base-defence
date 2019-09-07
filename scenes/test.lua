require "player"
require "map"

TestScene = Scene:extend()

function TestScene:new()
	TestScene.super.new(self)
	self:addEntity(Player())
	self:addEntity(Map());
end

function TestScene:draw()
	love.graphics.setColor(1, 1, 1, 1)
	TestScene.super.draw(self)
end
