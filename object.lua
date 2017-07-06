-- koi.object
-- an object is a table containing a coordinate, a sprite, ...

-- log : created 06-14-17
-- todo : constructor, controller handling

o = {}
local oft = {} -- object function table

function o.newObject(spriteP, inputP, xP, yP)
  return setmetatable({
    mapX = xP or 0, mapY = yP or 0,
    screenX = xP or 0, screenY = yP or 0,
    sprite = spriteP,
    input = inputP,
    actions = {}
  }, {__index = oft})
end

function oft:update(dt)
  -- page input
  local take = self.input:page(self.input.type)
  for k, v in pairs(self.actions) do
    if take[k] then
      if take[k] == true then
        self.actions[k](self, dt)
      else
        self.actions[k](self, dt, take[k])
      end -- specifics of take
    end -- if take
  end -- for @ input

  self.sprite:update(dt)

end -- update fn

function oft:setActionTable(t)
  self.actions = t
end

function oft:draw()
  self.sprite:draw(self.screenX, self.screenY)
end

-- implement: a table of functions to search @ page time

return o
