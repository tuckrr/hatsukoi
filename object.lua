-- koi.object
-- an object is a table containing a coordinate, a sprite, ...

-- log : created 06-14-17
-- todo : constructor, controller handling

o = {}
local oft = {} -- object function table

function o.newObject(spriteP, inputP, xP, yP)
  return setmetatable({
    x = xP or 0, y = yP or 0,
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

function oft:draw(offsetXP, offsetYP)
  offsetXP = offsetXP or 0
  offsetYP = offsetYP or 0
  self.sprite:draw(self.x - offsetXP, self.y - offsetYP)
end

-- implement: a table of functions to search @ page time

return o
