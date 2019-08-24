Player = Object:extend()

function Player:new()
    self.image = love.graphics.newImage("textures/player.png")
	
	self.x = 200
	self.y = 300

	self.speed = 300
	self.rot = 0

	self.ox = self.image:getWidth() / 2
	self.oy = self.image:getHeight() / 2

	self.scaleX = 0.5
	self.scaleY = 0.5
end

function Player:updateMovement(dt)
	if love.keyboard.isDown("a") then
		self.x = self.x - self.speed * dt
	end
	if love.keyboard.isDown("d") then
		self.x = self.x + self.speed * dt
	end
	if love.keyboard.isDown("w") then
		self.y = self.y - self.speed * dt
	end
	if love.keyboard.isDown("s") then
		self.y = self.y + self.speed * dt
	end
end

function Player:updateRotation()
	mouseX = love.mouse.getX()
	mouseY = love.mouse.getY()
	
	vectorX = self.x - mouseX
	vectorY = self.y - mouseY

	self.rot = -math.atan2(vectorX, vectorY)
end

function Player:update(dt)
	self:updateMovement(dt)
	self:updateRotation()
end

function Player:draw()
	love.graphics.draw(self.image, self.x, self.y, self.rot, self.scaleX, self.scaleY, self.ox, self.oy)
end

