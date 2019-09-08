require "player"
require "map"

TestScene = Scene:extend()

function TestScene:new()
	TestScene.super.new(self)
	-- Always add map first
	self:addEntity(Map());
	self:addEntity(Player())
end

function TestScene:draw()
	love.graphics.setColor(1, 1, 1, 1)
	TestScene.super.draw(self)
end
