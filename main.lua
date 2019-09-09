function love.load()
	Object = require "util/classic"
	require "sceneManager"

	local defaultScene = MenuScene()
	sceneManager = SceneManager(defaultScene)
end

function love.update(dt)
	sceneManager:update(dt)
end

function love.draw()
	sceneManager:draw()
end
