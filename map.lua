return {
	load_map = function(filename)
		local function pixel_to_tile(r, g, b, a)
			if r == 255 and g == 255 and b == 255 then
				return { r = r, g = g, b = b, tile_type = "void" }
			elseif r == 0 and g == 0 and b == 0 then
				return { r = r, g = g, b = b, tile_type = "normal" }
			else
				return { r = 255, g = 0, b = 255, tile_type = "unknown" }
			end
		end
		local map = {}

		local image_data = love.graphics.newImage(filename):getData()
		for x = 0, image_data:getWidth() -1 do
			map[x] = {}
			for y = 0, image_data:getHeight() -1 do
				local tile = pixel_to_tile(image_data:getPixel(x,y))
				map[x][y] = tile

				tile.body = love.physics.newBody(world, x * TILESIZE, y * TILESIZE)
				tile.shape = love.physics.newRectangleShape(TILESIZE, TILESIZE)
				tile.fixture = love.physics.newFixture(tile.body, tile.shape);

				if tile.tile_type == "void" or tile.tile_type == "unknown" then
					tile.body:setActive(false)
				end
			end
		end

		function map:width()
			return image_data:getWidth()
		end

		function map:height()
			return image_data:getHeight()
		end

		function map:render()
			for x = 0, map:width() -1 do
				for y = 0, map:height() -1 do
					local tile = self[x][y]
					love.graphics.setColor(tile.r, tile.g, tile.b)
					love.graphics.polygon("fill", tile.body:getWorldPoints(tile.shape:getPoints()))
				end
			end
		end

		return map
	end
}
