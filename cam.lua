-- TODO needed?

local rect_mod = require('rect')

return {
	fixed = function(rect)
		local cam = {
			kind = "cam",
			viewport_rect = rect --[[ world coordinates ]],
			zoom = 20 -- zoom represents the TILESIZE
		}

		function cam:viewport()
			return self.viewport_rect
		end

		function cam:draw_world_rect(world_rect, r, g, b)
			local screen_rect = cam:world_to_screen_rect(world_rect)
			love.graphics.setColor(r, g, b)
			love.graphics.rectangle("fill", screen_rect:left(), screen_rect:top(), screen_rect:width(), screen_rect:height())
		end

		function cam:world_to_screen_vec(vec)
			return (vec - self:viewport():left_top()) * cam.zoom
		end

		function cam:world_to_screen_rect(rect)
			return rect_mod.by_origin_and_size(
				self:world_to_screen_vec(rect:origin()),
				rect:size() * self.zoom
			)
		end

		return cam
	end
}
