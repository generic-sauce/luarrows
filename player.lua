local vec_mod = require('vec')
local rect_mod = require('rect')

return {
	new = function()
		local player = {}
		player.pos = vec_mod(0, 0)
		player.speed = vec_mod(0, 0)

		function player:update(dt)
			if love.keyboard.isDown('d') then
				self.speed.x = self.speed.x + 40 * dt;
			elseif love.keyboard.isDown('a') then
				self.speed.x = self.speed.x - 40 * dt;
			end

			self.pos = self.pos + self.speed * dt;
		end

		function player:render()
			cam:draw_world_rect(rect_mod.by_left_top_and_size(self.pos, vec_mod(1, 1)), 0, 255, 0)
		end
		return player
	end
}
