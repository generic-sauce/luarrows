TILESIZE = 20

local map_mod = require('map')
local player_mod = require('player')

function love.load()
	love.physics.setMeter(10)

	world = love.physics.newWorld(0, 80, true)

	entities = { player_mod.new("archer") }
	map = map_mod.load_map('map.jpg')
end

function love.update(dt)
	world:update(dt)

	for _, entity in pairs(entities) do
		entity:update(dt)
	end
end

function love.draw()
	map:render()
	for _, entity in pairs(entities) do
		entity:render()
	end
end
