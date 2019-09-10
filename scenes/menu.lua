require "main_menu"

MenuScene = Scene:extend()

function MenuScene:new()
    MenuScene.super.new(self)
    self:addEntity(MainMenu())
end

function MenuScene:draw()
    love.graphics.setColor(1, 1, 1, 1)
    MenuScene.super.draw(self)
end
