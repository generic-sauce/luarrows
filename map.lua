return {
	load_map = function(filename)
		local function pixel_to_tile(pixel)
			return {}
		end
		local map = {}
		local image_data = love.graphics.newImage(filename):getData()
		for x = 1, image_data:getWidth() do
			map[x] = {}
			for y = 1, image_data:getHeight() do
				map[x][y] = pixel_to_tile(image_data:getPixel(x-1,y-1))
			end
		end

		function map:render()
			-- TODO
		end

		return map
	end
}
