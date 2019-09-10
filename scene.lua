local gamera = require "util/gamera"

Scene = Object:extend()

function Scene:new()
	self.entities = {}

	local cameraX = 0
	local cameraY = 0
	local cameraWidth = 2000
	local cameraHeight = 2000
	self.camera = gamera.new(cameraX, cameraY, cameraWidth, cameraHeight)
end

function Scene:addEntity(entity)
	table.insert(self.entities, entity)
end

function Scene:getEntityById(id)
	for key, val in pairs(self.entities) do
		if val.id == id then
			return val
		end
	end

	return -1
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
	self.camera:draw(
		function(l, t, w, h)
			for key, val in pairs(self.entities) do
				val:draw()
			end
		end
	)
end
