map_mod = require('map')
player_mod = require('player')
cam_mod = require('cam')
rect_mod = require('rect')
vec_mod = require('vec')

function love.load()
	entities = { player_mod.new() }
	map = map_mod.load_map('map.jpg')
	cam = cam_mod.fixed(rect_mod.by_origin_and_size(vec_mod(0, 0), vec_mod(100, 100)))
end

function love.update(dt)
end

function love.draw()
	for _, entity in pairs(entities) do
		entity:render()
	end
	map:render()
end
