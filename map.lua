return {
	load_map = function(filename)
		local function pixel_to_tile(pixel)
			local r, g, b, a = pixel
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
			for x=0, map:width()  do
				for y=0, map:height()  do
					love.graphics.rectangle("fill", 1, 1, 10, 10)
				end
			end
		end

		return map
	end
}
