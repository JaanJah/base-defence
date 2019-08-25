require "scene"
-- Load scenes
require "scenes/test"
require "scenes/menu"

SceneManager = Object:extend()

function SceneManager:new(scene)
	self:setScene(scene)
end

function SceneManager:setScene(scene)
	self.curScene = scene
end

function SceneManager:update(dt)
	self.curScene:update(dt)
end

function SceneManager:draw()
	self.curScene:draw()
end

