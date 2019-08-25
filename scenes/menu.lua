require "main_menu"

MenuScene = Scene:extend()

function MenuScene:new()
    MenuScene.super.new(self)
	a = MainMenu()
    self:addEntity(a)
end

