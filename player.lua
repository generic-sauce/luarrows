GROUND_CONTACT_THRESHOLD = 3

return {
	new = function()
		local player = {}
		player.body = love.physics.newBody(world, 0, 0, "dynamic")
		player.shape = love.physics.newRectangleShape(TILESIZE * 2/3, TILESIZE * 2/3)
		player.fixture = love.physics.newFixture(player.body, player.shape)

		player.body:setPosition(0, 0)
		player.body:setFixedRotation(true)

		function player:update(dt)
			if love.keyboard.isDown("w") and self:touchesGround() then
				local lin_vel_x, _ = self.body:getLinearVelocityFromLocalPoint(0, 0)
				self.body:setLinearVelocity(lin_vel_x, -100)
			end
			if love.keyboard.isDown("a") then
				self.body:applyForce(-400, 0)
			end
			if love.keyboard.isDown("d") then
				self.body:applyForce(400, 0)
			end

		end

		function player:touchesGround()
			local speed_x, speed_y = self.body:getLinearVelocity()
			if speed_y < 0 then
				return false
			end

			local _, y1, _, _, _, y3 = self.shape:getPoints()
			local _, py = self.body:getPosition()
			local y = py + math.abs(y1-y3)/2

			for _, c in pairs(self.body:getContactList()) do
				local _, cy1, _, cy2 = c:getPositions()
				local dist = 0
				if cy1 then
					dist = dist + math.abs(cy1-y)
				end
				if cy2 then
					dist = dist + math.abs(cy2-y)
				end
				if c:isTouching() and dist < GROUND_CONTACT_THRESHOLD then
					return true
				end
			end
			return false
		end

		function player:render()
			love.graphics.setColor(0, 255, 0)
			love.graphics.polygon("fill", self.body:getWorldPoints(self.shape:getPoints()))
		end

		return player
	end
}
