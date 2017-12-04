return {
	by_origin_and_size = function(origin, size)
		local rect = {
			origin = origin,
			size = size
		}

		function rect:origin() 
			return self.origin
		end

		function rect:size() 
			return self.size
		end

		function rect:left()
			return self.origin.x - self.size.x/2
		end

		function rect:right()
			return self.origin.x + self.size.x/2
		end

		function rect:top()
			return self.origin.y - self.size.y/2
		end

		function rect:bottom()
			return self.origin.y + self.size.y/2
		end

		function rect:contains(vec)
			print("TODO")
			assert(false)
		end

		function rect:intersects(r2)
			print("TODO")
			assert(false)
		end

		return rect
	end
}
