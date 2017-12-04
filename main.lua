map_mod = require('map')
player_mod = require('player')
cam_mod = require('cam')

function love.load()
	entities = { player_mod.new() }
	map = map_mod.load_map('map.jpg')
	cam = cam_mod.new()
end

function love.update(dt)
end

function love.draw()
	for _, entity in pairs(entities) do
		entity:render()
	end
	map:render()
end
