-- koi.input
-- handles/simulates input to be passed to an object

i = {}
ift = {} -- input function table

function i.newInput(typeP)
  return setmetatable({
    type = typeP,
    keyboard = {}, -- real inputs (love.keyboard.isdown)
    joystick = {}, -- real inputs (love.joystick.blah)
    mouse = {}, -- real inputs (love.mouse.blah)
    virtual = {}, -- fake inputs (true/false from ?? koibumi ??)
    out = {} -- updated with page, the status on each input
  }, {__index = ift})
end

function ift:addSource(typeP, nameP, inputP)
  self[typeP][nameP] = inputP
  self.out[nameP] = false
end

-- updates output table
function ift:page(typeP)
  local out = {}
  if typeP == 'real' then
    for k, v in pairs(self.keyboard) do
      out[k] = love.keyboard.isDown(v)
    end
    -- implement some sort of logic for the rest of the real
    -- sorts of input (mouse and joystick)
    -- remember that joystick will return true if it's any
    -- non false/nil, use this to your advantage by
    -- returnin the value and actually using it easypz
  else
    for k, v in pairs(self.virtual) do
      out[k] = v
    end
  end
  return out
end -- page

return i
