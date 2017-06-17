-- koi.object
-- an object is a table containing a coordinate, a sprite, ...

-- log : created 06-14-17
-- todo : constructor, controller handling

o = {}
local oft = {} -- object function table

function o.newObject(xP, yP, spriteP, inputP)
  return setmetatable({
    x = xP or 0, y = yP or 0,
    sprite = spriteP,
    input = inputP
  }, {__index = oft})
end

function oft:update(dt) -- page input
  -- update location, probably deal with extensibility
end

function oft:draw()
  this.sprite:draw(x, y)
end

return o
