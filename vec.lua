return function(x, y) 
	local meta = {}
	function meta:__index(i)
		if (i == 0) then
			return x
		elseif (i == 1) then
			return y
		else
			assert(false) -- index out of range
		end
	end

	function meta:__length()
		return (self.x + self.y)/2
	end

	local v = setmetatable({ x = x, y = y }, meta)
	return v
end
