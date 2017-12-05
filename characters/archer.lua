return {
	new = function(player)

		function player:shoot_arrow(x, y)
			local arrow = {}
			arrow.body = love.physics.newBody(world, x, y, "dynamic")
			arrow.shape = love.physics.newRectangleShape(TILESIZE * 2/3, 5)
			arrow.fixture = love.physics.newFixture(arrow.body, arrow.shape)

			function arrow:update(dt) end

			function arrow:render()
				love.graphics.setColor(100, 100, 0)
				love.graphics.polygon("fill", self.body:getWorldPoints(self.shape:getPoints()))
			end

			entities[#entities + 1] = arrow
		end

		function player:update_character(dt)
			if love.keyboard.isDown('q') then
				player:shoot_arrow(player.body:getPosition())
			end
		end

		return player
	end
}
