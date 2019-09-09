Player = Object:extend()

function Player:new(camera)
    self.image = love.graphics.newImage("textures/player.png")
	self.camera = camera
	
	self.x = 200
	self.y = 300
	self.id = "player"

	self.speed = 300
	self.rot = 0

	self.ox = self.image:getWidth() / 2
	self.oy = self.image:getHeight() / 2

	self.scaleX = 0.5
	self.scaleY = 0.5

	self.spells = {}
	table.insert(self.spells, FireballSpell(self))
	self.selSpell = self.spells[1]
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

function Player:handleSpells(dt)
	if love.mouse.isDown(1) then
		self.selSpell:use()
	end

	for key, val in pairs(self.spells) do
		val:update(dt)
	end
end

function Player:updateRotation()
	local locMouseX = love.mouse.getX()
	local locMouseY = love.mouse.getY()

	local mouseX, mouseY = self.camera:toWorld(locMouseX, locMouseY) 

	local vectorX = mouseX - self.x
	local vectorY = mouseY - self.y

	self.rot = math.atan2(vectorY, vectorX)
end

function Player:update(dt)
	self:updateMovement(dt)
	self:updateRotation()
	self:handleSpells(dt)
end

function Player:draw()
	love.graphics.draw(self.image, self.x, self.y, self.rot, self.scaleX, self.scaleY, self.ox, self.oy)
end

