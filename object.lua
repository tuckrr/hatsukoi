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
    input = inputP,
    inFun = {}
  }, {__index = oft})
end

function oft:update(dt) -- page input
  take = input:page(input.real)
  -- for each function in the objin table, check if
  -- it's true in {take} and run it with dt as a param
end

function oft:draw()
  this.sprite:draw(x, y)
end

-- implement: a table of functions to search @ page time

return o
