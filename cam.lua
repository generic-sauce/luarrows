return {
	fixed = function(rect)
		local cam = { viewport = rect }

		function cam:viewport()
			return self.viewport
		end

		return cam
	end
}
