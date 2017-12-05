-- TODO needed?

function vec_mod(x, y) 
	local meta = {}
	function meta:__index(i)
		if i == 0 then
			return x
		elseif i == 1 then
			return y
		else
			assert(false, "Vec: Index '" .. i .. "' out of range")
		end
	end

	function meta:__add(other)
		return vec_mod(self.x + other.x, self.y + other.y)
	end

	function meta:__sub(other)
		return vec_mod(self.x - other.x, self.y - other.y)
	end

	function meta:__mul(other)
		return vec_mod(self.x * other, self.y * other)
	end

	function meta:__div(other)
		return vec_mod(self.x / other, self.y / other)
	end

	function meta:__length()
		return (self.x + self.y)/2
	end

	local v = setmetatable({ x = x, y = y, kind = "vec" }, meta)
	return v
end

return vec_mod
