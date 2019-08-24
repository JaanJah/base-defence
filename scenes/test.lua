require "player"

TestScene = Scene:extend()

function TestScene:new()
	TestScene.super.new(self)

	self:addEntity(Player())
end

