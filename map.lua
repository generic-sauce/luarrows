local rect_mod = require('rect')
local vec_mod = require('vec')

return {
	load_map = function(filename)
		local function pixel_to_tile(r, g, b, a)
			return { r = r, g = g, b = b }
		end
		local map = {}

		local image_data = love.graphics.newImage(filename):getData()
		for x = 1, image_data:getWidth() do
			map[x] = {}
			for y = 1, image_data:getHeight() do
				map[x][y] = pixel_to_tile(image_data:getPixel(x-1,y-1))
			end
		end

		function map:width()
			return image_data:getWidth()
		end

		function map:height()
			return image_data:getHeight()
		end

		function map:render()
			for x = 1, map:width()  do
				for y = 1, map:height()  do
					local tile = self[x][y]
					local world_rect = rect_mod.by_left_top_and_size(vec_mod(x, y), vec_mod(1, 1))
					cam:draw_world_rect(world_rect, tile.r, tile.g, tile.b)
				end
			end
		end

		return map
	end
}
