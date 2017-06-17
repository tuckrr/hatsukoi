-- koi.input
-- handles/simulates input to be passed to an object

i = {}
ift = {} -- input function table

function i.newInput()
  return setmetatable({
    real = {},
    virtual = {}
  }, {__index = ift})
end

function ift:addSource(realP, nameP, inputTable)
  if realP then -- real input
    if not self.real[nameP] then
      self.real[nameP] = inputTable
    else
      for i, v in ipairs(inputTable) do
        self.real[nameP][#self.real[nameP] + i] = v
      end
    end
  else -- virtual input
    if not self.virtual[nameP] then
      self.virtual[nameP] = inputTable
    else
      for i, v in ipairs(inputTable) do
        self.virtual[nameP][#self.virtual[nameP] + i] = v
      end
    end
  end
end

function ift:page(realP)
  out = {} -- output table
  if realP then query = 'real' else query = 'virtual' end
  for k, v in pairs(self[query]) do
    out[k] = love.keyboard.isDown(v) -- don't think this works
  end
end -- page

return i
