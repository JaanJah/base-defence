FireballSpell = Spell:extend()

function FireballSpell:new(character)
	local cooldown = 4
	self.super:new(cooldown)
	self.character = character
end

function FireballSpell:use()
	if self.curCooldown < 0 then
		local entity = FireballEntity(self.character)

		sceneManager.curScene:addEntity(entity)

		self.curCooldown = self.cooldown		
	end	
end

FireballEntity = SpellEntity:extend()

function FireballEntity:new(character)
	local activeTime = 3
	self.super:new(activeTime)

	self.x = character.x
	self.y = character.y
	self.dir = character.rot
	self.speed = 200
	self.shader = nil

	local shaderPath
    local shaderFile = io.open("./shaders/spells/fireball.glsl", "r")
    if (shaderFile) then
        shaderCode = shaderFile:read("*all")
        shaderFile:close()

		self.shader = love.graphics.newShader(shaderCode)
    else
        print("Shader not found:", path)
    end
end

function FireballEntity:update(dt)
	self.super:update(dt)
	self.x = self.x + math.cos(self.dir) * self.speed * dt
	self.y = self.y + math.sin(self.dir) * self.speed * dt
end

function FireballEntity:draw()
	love.graphics.setShader(self.shader)
	self.shader:send("time", self.curActiveTime)

	love.graphics.circle("fill", self.x, self.y, 20, 20)

	love.graphics.setShader()
end

