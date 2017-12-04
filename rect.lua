local vec_mod = require('vec')

local rect_mod = {}

rect_mod.by_origin_and_size = function(origin, size)
	local rect = {
		kind = "rect",
		origin_vec = origin,
		size_vec = size
	}

	function rect:origin() 
		return rect.origin_vec
	end

	function rect:size() 
		return rect.size_vec
	end

	function rect:left()
		return self:origin().x - self:size().x/2
	end

	function rect:right()
		return self:origin().x + self:size().x/2
	end

	function rect:top()
		return self:origin().y - self:size().y/2
	end

	function rect:bottom()
		return self:origin().y + self:size().y/2
	end

	function rect:contains(vec)
		print("TODO")
		assert(false)
	end

	function rect:intersects(r2)
		print("TODO")
		assert(false)
	end

	function rect:left_top()
		return vec_mod(self:left(), self:top())
	end

	function rect:width()
		return self:size().x
	end

	function rect:height()
		return self:size().y
	end

	return rect
end

rect_mod.by_left_top_and_size = function(left_top, size)
	return rect_mod.by_origin_and_size(left_top + size/2, size)
end

return rect_mod
