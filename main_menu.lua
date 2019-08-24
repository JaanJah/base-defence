BUTTON_HEIGHT = 64

local
function newButton(text, fn)
    return {
        text = text,
        fn = fn,

        now = false,
        last = false,
    }
end

local buttons = {}
local font = nil

function love.load()
    font = love.graphics.newFont(32)
    table.insert(buttons, newButton(
        "Start Game",
        function()
            print("Starting game")
        end))

    table.insert(buttons, newButton(
        "Load Game",
        function()
            print("Loading game")
        end))

    table.insert(buttons, newButton(
        "Settings",
        function()
            print("Settings menu")
        end))

    table.insert(buttons, newButton(
        "Quit",
        function()
            love.event.quit(0)
        end))
end

function love.update(dt)
end

function love.draw()
    local window_width = love.graphics.getWidth()
    local window_height = love.graphics.getHeight()

    local button_width = window_width * (1/3)
    local margin = 16

    local total_height = (BUTTON_HEIGHT + margin) * #buttons
    local cursor_y = 0

    for i, button in ipairs(buttons) do
        button.last = button.now

        local button_x = (window_width * 0.5) - (button_width * 0.5)
        local button_y = (window_height * 0.5) - (total_height * 0.5) + cursor_y

        local color = {0.4, 0.4, 0.5, 1.0}
        local mouse_x, mouse_y = love.mouse.getPosition()

        local hot = mouse_x > button_x
                and mouse_x < button_x + button_width
                and mouse_y > button_y
                and mouse_y < button_y + BUTTON_HEIGHT

        if hot then
            color = {0.8, 0.8, 0.9, 1.0}
        end

        button.now = love.mouse.isDown(1)
        if button.now and not button.last and hot then
            button.fn()
        end

        love.graphics.setColor(unpack(color))
        love.graphics.rectangle(
            "fill",
            button_x,
            button_y,
            button_width,
            BUTTON_HEIGHT
        )

        love.graphics.setColor(0, 0, 0, 1)

        local text_width = font:getWidth(button.text)
        local text_height = font:getHeight(button.text)
        love.graphics.print(
            button.text,
            font,
            (window_width * 0.5) - text_width * 0.5,
            button_y + text_height * 0.5
        )

        cursor_y = cursor_y + (BUTTON_HEIGHT + margin)
    end
end