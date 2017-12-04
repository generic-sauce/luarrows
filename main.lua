local map_mod = require('map')
local player_mod = require('player')
local cam_mod = require('cam')
local rect_mod = require('rect')
local vec_mod = require('vec')

function love.load()
	entities = { player_mod.new() }
	map = map_mod.load_map('map.jpg')
	cam = cam_mod.fixed(rect_mod.by_origin_and_size(vec_mod(0, 0), vec_mod(10, 10)))
end

function love.update(dt)
end

function love.draw()
	for _, entity in pairs(entities) do
		entity:render()
	end
	map:render()
end
