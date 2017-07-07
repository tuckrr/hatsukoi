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

function sft:addAnimation(name)
	if not self.animations[name] then
		self.animations[name] = {}
	end
	return self.animations[name]
end

function sft:addFrame(anim, x, y)
	self.animations[anim][#self.animations[anim] + 1] = love.graphics.newQuad(x, y, self.width, self.height, self.spriteSheet:getWidth(), self.spriteSheet:getHeight())
	return #self.animations[anim]
end

function sft:setCurrentAnimation(anim, loop)
	if not (self.currentAnimation == anim) then
		if loop or loop == nil then
			self.loop = true
		else
			self.loop = false
		end
		self.currentAnimation = anim
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

function sft:draw(x, y)
	love.graphics.draw(self.spriteSheet, self.animations[self.currentAnimation][self.currentFrame], x, y, self.r, self.sx, self.sy, self.ox, self.oy, self.kx, self.ky)
end

return s
