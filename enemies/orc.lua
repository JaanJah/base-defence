Orc = Enemy:extend()

function Enemy:new()
	self.image = love.graphics.newImage("textures/orc.png")

	self.x = 200
	self.y = 300

	self.speed = 50
	self.rot = 0

	self.ox = self.image:getWidth() / 2
	self.oy = self.image:getHeight() / 2

	self.scaleX = 0.25
	self.scaleY = 0.25

	self.visionDist = 200
end

function Enemy:updateMovement(dt)
	local dist = self:getDistance(self.x, self.y, player.x, player.y)

	if dist < self.visionDist and dist > 40 then
		self.x = self.x + math.cos(self.rot) * self.speed * dt
		self.y = self.y + math.sin(self.rot) * self.speed * dt
	end
end

function Enemy:updateRotation()
	local dist = self:getDistance(self.x, self.y, player.x, player.y)

	if dist < self.visionDist then
		self.rot = math.atan2(player.y - self.y, player.x - self.x)
	end
end

function Enemy:draw()
	love.graphics.draw(self.image, self.x, self.y, self.rot, self.scaleX, self.scaleY, self.ox, self.oy)
end
