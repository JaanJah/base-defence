require "player"

TestScene = Scene:extend()

function TestScene:new()
	TestScene.super.new(self)
	self:addEntity(Player(self.camera))
end

function TestScene:update(dt)
	local player = self:getEntityById("player")

	local cameraX = player.x - (love.graphics.getWidth() / 2)
	local cameraY = player.y - (love.graphics.getHeight() / 2)

	self.camera:setPosition(player.x, player.y)
	TestScene.super.update(self, dt)
end

function TestScene:draw()
	love.graphics.setColor(1, 1, 1, 1)
	TestScene.super.draw(self)
end
