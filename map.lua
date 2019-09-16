Map = Object:extend()
require "tilemap/tiledmap"

function Map:new()
    _G.map = loadTiledMap('tilemap/map_data');
end

function Map:update(dt)
end

function Map.draw()
    _G.map:draw()
end