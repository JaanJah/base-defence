function love.load()
	Object = require "classic"
	require "enemy"
	require "enemies/orc"
	require "player"

	orc = Orc()
	player = Player()
end

function love.update(dt)
	player:update(dt)
	orc:update(dt)
end

function love.draw()
	player:draw()
	orc:draw()
end

