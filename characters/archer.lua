return {
	new = function(player)

		player.arrow_cd = 0

		function player:shoot_arrow(x, y)
			if player.arrow_cd == 0 then
				player.arrow_cd = 1

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
		end

		function player:update_character(dt)
			if love.keyboard.isDown('q') then
				player:shoot_arrow(player.body:getPosition())
			end

			player.arrow_cd = math.max(0, player.arrow_cd - dt)
		end

		return player
	end
}
