local koi = require 'koi.koi'

-- Adapting the GB classic Link's Awakening as an exercise and example.

-- Credit to Bruce Juice, Drshnaps for ripping the sprites used.
-- You can find both sheets used @ (the) spriters-resource.com

-- PLAYER OBJECT DEFINITION
  -- PLAYER SPRITE
sprLink = koi.sprite.newSprite('art/link_ladx.png', 16, 16, 1/2, 'down')
sprLink:addAnimation('down')
sprLink:addFrame('down', 36, 36)
sprLink:addFrame('down', 50, 36)
sprLink:addAnimation('up')
sprLink:addFrame('up', 65, 36)
sprLink:addFrame('up', 79, 36)
sprLink:addAnimation('right')
sprLink:addFrame('right', 93, 36)
sprLink:addFrame('right', 109, 36)
sprLink:addAnimation('left')
sprLink:addFrame('left', 5, 36)
sprLink:addFrame('left', 21, 36)
  -- END OF PLAYER SPRITE
  -- PLAYER INPUT
inpPlayer = koi.input.newInput('real')
inpPlayer:addSource('keyboard', 'moveDown', 's')
inpPlayer:addSource('keyboard', 'moveUp', 'w')
inpPlayer:addSource('keyboard', 'moveRight', 'd')
inpPlayer:addSource('keyboard', 'moveLeft', 'a')
  -- END OF PLAYER INPUT
objPlayer = koi.object.newObject(sprLink, inpPlayer)
objPlayer.speed = 50
objPlayer:setActionTable({
  -- todo: diagonal spritefix
  moveDown = function(self, dt)
    self.y = self.y + (self.speed * dt)
    objPlayer.sprite:setCurrentAnimation('down')
  end,
  moveUp = function(self, dt)
    self.y = self.y - (self.speed * dt)
    objPlayer.sprite:setCurrentAnimation('up')
  end,
  moveRight = function(self, dt)
    self.x = self.x + (self.speed * dt)
    objPlayer.sprite:setCurrentAnimation('right')
  end,
  moveLeft = function(self, dt)
    self.x = self.x - (self.speed * dt)
    objPlayer.sprite:setCurrentAnimation('left')
  end
})
-- END OF PLAYER OBJECT

-- MAP DEFINITION
mapOW = koi.map.newMap(32, 32, 16, 16)
mapOW.tileset = koi.map:newTileset('art/ladx_owtiles.png', 16, 16)
mapOW.tileset:addTile('grass top left', 1, 86)
mapOW.tileset:addTile('grass top', 18, 86)
mapOW.tileset:addTile('grass top right', 35, 86)
mapOW.tileset:addTile('grass left', 1, 103)
mapOW.tileset:addTile('grass center', 18, 103)
mapOW.tileset:addTile('grass right', 35, 103)
mapOW.tileset:addTile('grass bot left', 1, 120)
mapOW.tileset:addTile('grass bot', 18, 120)
mapOW.tileset:addTile('grass bot right', 35, 120)
mapOW.tileset:addTile('sand', 18, 154)

g = 'grass center'
tl = 'grass top left'
gt = 'grass top'
tr = 'grass top right'
gl = 'grass left'
gr = 'grass right'
bl = 'grass bot left'
gb = 'grass bot'
br = 'grass bot right'
s = 'sand'

mapOW.map = {
  { s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s },
  { s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s },
  { s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s },
  { s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s },
  { s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s },
  { s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s },
  { s, s, s, s, s, s,tl,gt,gt,gt,gt,gt,gt,gt,gt,gt,gt,gt,gt,gt,gt,gt,gt,gt,gt,tr, s, s, s, s, s, s },
  { s, s, s, s, s, s,gl, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g,gr, s, s, s, s, s, s },
  { s, s, s, s, s, s,gl, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g,gr, s, s, s, s, s, s },
  { s, s, s, s, s, s,gl, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g,gr, s, s, s, s, s, s },
  { s, s, s, s, s, s,gl, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g,gr, s, s, s, s, s, s },
  { s, s, s, s, s, s,gl, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g,gr, s, s, s, s, s, s },
  { s, s, s, s, s, s,gl, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g,gr, s, s, s, s, s, s },
  { s, s, s, s, s, s,gl, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g,gr, s, s, s, s, s, s },
  { s, s, s, s, s, s,gl, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g,gr, s, s, s, s, s, s },
  { s, s, s, s, s, s,gl, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g,gr, s, s, s, s, s, s },
  { s, s, s, s, s, s,gl, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g,gr, s, s, s, s, s, s },
  { s, s, s, s, s, s,gl, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g,gr, s, s, s, s, s, s },
  { s, s, s, s, s, s,gl, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g,gr, s, s, s, s, s, s },
  { s, s, s, s, s, s,gl, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g,gr, s, s, s, s, s, s },
  { s, s, s, s, s, s,gl, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g,gr, s, s, s, s, s, s },
  { s, s, s, s, s, s,gl, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g,gr, s, s, s, s, s, s },
  { s, s, s, s, s, s,gl, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g,gr, s, s, s, s, s, s },
  { s, s, s, s, s, s,gl, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g,gr, s, s, s, s, s, s },
  { s, s, s, s, s, s,gl, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g,gr, s, s, s, s, s, s },
  { s, s, s, s, s, s,bl,gb,gb,gb,gb,gb,gb,gb,gb,gb,gb,gb,gb,gb,gb,gb,gb,gb,gb,br, s, s, s, s, s, s },
  { s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s },
  { s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s },
  { s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s },
  { s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s },
  { s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s },
  { s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s, s }
}
-- END OF MAP DEFINITION

mapOW:addObject(objPlayer, 5, 5)

function mapOW:lerpTowards(targetXP, targetYP, speedP)
 -- todo: lerp the screen towards an object
end

return mapOW
