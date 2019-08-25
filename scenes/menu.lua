require "main_menu"

MenuScene = Scene:extend()

function MainMenu:new()
    MainMenu.super.new(self)

    self:addEntity(MainMenu())
end


