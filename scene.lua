local gamera = require "gamera"

Scene = Object:extend()

function Scene:new()
	self.entities = {}
	self.camera = gamera.new(0, 0, 2000, 2000)
end

function Scene:addEntity(entity)
	table.insert(self.entities, entity)
end

function Scene:update(dt)
	for key, val in pairs(self.entities) do
		if val.dispose then
			self.entities[key] = nil
		else
			val:update(dt)
		end
	end
end

function Scene:draw()
	self.camera:draw(function(l, t, w, h)
		for key, val in pairs(self.entities) do
			val:draw()
		end
	end)
end

