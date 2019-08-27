Spell = Object:extend()

function Spell:new(cooldown)
	self.cooldown = cooldown
	self.curCooldown = 0
end

function Spell:update(dt)
	self.curCooldown = self.curCooldown - dt
end

function Spell:use()
end

SpellEntity = Object:extend()

function SpellEntity:new(activeTime)
	self.activeTime = activeTime
	self.curActiveTime = 0
	self.dispose = false
end

function SpellEntity:update(dt)
	self.curActiveTime = self.curActiveTime + dt
	
	if self.curActiveTime > self.activeTime then
		self.dispose = true
	end
end

function SpellEntity:draw()
end
