return {
	new = function()
		local player = {}
		player.body = love.physics.newBody(world, 0, 0, "dynamic")
		player.shape = love.physics.newRectangleShape(TILESIZE * 2/3, TILESIZE * 2/3)
		player.fixture = love.physics.newFixture(player.body, player.shape)

		player.body:setPosition(650/2, 650/2)
		player.body:setFixedRotation(true)

		function player:update(dt)
			if love.keyboard.isDown("w") then
				self.body:applyForce(0, -400)
			end
			if love.keyboard.isDown("a") then
				self.body:applyForce(-400, 0)
			end
			if love.keyboard.isDown("d") then
				self.body:applyForce(400, 0)
			end
		end

		function player:render()
			love.graphics.setColor(0, 255, 0)
			love.graphics.polygon("fill", self.body:getWorldPoints(self.shape:getPoints()))
		end

		return player
	end
}
