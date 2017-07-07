-- koi.map
-- a map is a grid of tiles and objects
-- also contains tile definitions because they only get used in map

-- map really is kind of a mess. i didn't really plan this/obj out too well in
-- how they interact. going to go with a different system for koi++

m = {}
local mft = {}
local tsft = {}
local tift = {}

function m.newMap(widthP, heightP, tileWidthP, tileHeightP)
  local tempMap = {}
  for i = 1, widthP do
    tempMap[i] = {}
    for j = 1, heightP do
      tempMap[i][j] = {}
    end
  end
  return setmetatable({
    width = widthP, height = heightP,
    widthPx = widthP * tileWidthP,
    heightPx = heightP * tileHeightP,
    drawOffsetX = 0, drawOffsetY = 0,
    tileWidth = tileWidthP,
    tileHeight = tileHeightP,
    streaming = false, -- level streaming/chunk based system. tbd exactsies
    tilesets = {},
    instances = {},
    map = tempMap
  }, {__index = mft})
end

function mft:addObject(objectP, xP, yP, pixelConversionP)
  if xP and yP then
    if not pixelConversionP then
      xP = xP * self.tileWidth
      yP = yP * self.tileHeight
    end
  end

  self.instances[#self.instances + 1] = objectP
  self.instances[#self.instances].x = xP
  self.instances[#self.instances].y = yP
end

function mft:getObject(instanceP, objectP, guessxP, guessyP)
  if instanceP then
    return self.instances[instanceP]
  end
  closestDistance = self.widthP + self.heightP
  ret = nil
  for i, v in ipairs(self.instances) do
    if v == objectP then
      myDist = math.sqrt(math.pow(guessxP - v.x, 2) + math.pow(guessyP - v.y, 2))
      if myDist < closestDistance then
        closestDistance = myDist
        ret = v
      end
    end
  end
  return ret
end

function mft:update(dt)
  -- update animated tiles, entities on the map
  for i, v in ipairs(self.instances) do
    v:update(dt)
  end
end

function mft:drawTiles(drawRectP, drawToCoordP, xScaleP, yScaleP)
  for indexX, valueX in ipairs(self.map) do
    for indexY, valueY in ipairs(valueX) do
      valueY:draw(((indexX - 1) * self.tileWidth) - self.drawOffsetX,
                 ((indexY - 1) * self.tileHeight) - self.drawOffsetY)
    end
  end
end

function mft:drawObjects()
    for i, v in ipairs(self.instances) do
      v:draw(self.drawOffsetX, self.drawOffsetY)
    end
end

function mft:setTile(x, y)

end

function m.loadMapFile() -- the primary way to write a map: koibumi
  -- loads in from a text based map
end

function m.exportMapFile() -- for editor use
  -- exports a text based map
end

---------------------------------------------------------------

function m.newTileSet()
  -- tilesets hold tiles
end

function tsft:addTile()
  -- which are quads, but also have some basic collision data
end

function tift:draw(x, y)
  -- draw the tile
end

----------------------------------------------------------------

function tsft:addTileBatch()
  -- and can be added lots at the same time
end

function tsft:addAniTile()
  -- they can also be animated
end

function tsft:addAniTileBatch()
  -- again, batches!
end

function tsft:update()
  -- and the whole tileset updates at once
end

return m
