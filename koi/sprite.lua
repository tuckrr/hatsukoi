-- koi.sprite
-- handles moving images and such
-- a sprite is a table of animations + a sprite sheet
-- an animation is a table of frames
-- a frame is a quad on the sprite sheet

-- todo : batch addFrame, probably clean up update

-- note: koi.sprite is feature complete. all future additions are qol changes

s = {}
local sft = {} -- sprite function table

function s.newSprite(imgP, wP, hP, animSpeedP, defaultAnimP)
	return setmetatable({
		spriteSheet = love.graphics.newImage(imgP),
		r = 0,
		sx = 1, sy = 1,
		ox = 0, oy = 0,
		kx = 0, ky = 0,
		width = wP or 32, height = hP or 32,
		animSpeed = animSpeedP, -- or nil, no need to be explicit
		currentAnimation = defaultAnimP or '',
		animations = {},
		elapsedTime = 0,
		currentFrame = 1,
		loop = true
	}, {__index = sft})
end

function sft:addAnimation(nameP, sxP, syP)
	if not self.animations[nameP] then
		self.animations[nameP] = {sx = sxP or 1, sy = syP or 1}
	end
	return self.animations[nameP]
end

function sft:addFrame(animP, xP, yP)
	self.animations[animP][#self.animations[animP] + 1] = love.graphics.newQuad(xP, yP, self.width, self.height, self.spriteSheet:getWidth(), self.spriteSheet:getHeight())
	return #self.animations[animP]
end

function sft:setCurrentAnimation(animP, loopP)
	if not (self.currentAnimation == animP) then
		if loopP or loopP == nil then
			self.loop = true
		else
			self.loop = false
		end
		self.currentAnimation = animP
		self.currentFrame = 1
	end
end

function sft:update(dt)
	if self.animSpeed and #self.animations[self.currentAnimation] > 0 then -- animSpeed = nil means static
		self.elapsedTime = self.elapsedTime + dt
		if self.elapsedTime >= self.animSpeed then
			self.elapsedTime = 0
			if self.currentFrame >= #self.animations[self.currentAnimation] then
				if self.loop then
					self.currentFrame = 1
				end
			else
				self.currentFrame = self.currentFrame + 1
			end
		end -- elapsedTime
	end
end

function sft:draw(xP, yP)
	love.graphics.draw(self.spriteSheet, self.animations[self.currentAnimation][self.currentFrame], xP, yP, self.r, self.sx * self.animations[self.currentAnimation].sx, self.sy * self.animations[self.currentAnimation].sy, self.ox, self.oy, self.kx, self.ky)
end

return s
