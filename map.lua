-- koi.map
-- a map is a grid of tiles and objects
-- also contains tile definitions because they only get used in map

-- map really is kind of a mess. i didn't really plan this/obj out too well in
-- how they interact. going to go with a different system for koi++

m = {}
local mft = {}
local tft = {}

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
      xP = xP * self.tileWidthP
      yP = yP * self.tileHeightP
    end
  end

  self.instances[#self.instances + 1] = {obj = objectP, x = xP, y = yP}
end

function mft:getObject(instanceP, objectP, guessxP, guessyP)
  if instanceP then
    return self.instances[instanceP]
  end
  closestDistance = self.widthP + self.heightP
  ret = nil
  for i, v in ipairs(self.instances) do
    if v.obj == objectP then
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
    v.obj.update(dt)
  end
end

function mft:drawTiles(drawRectP, drawToCoordP, xScaleP, yScaleP)
  -- draw each tile in the section being drawn, with params from cam
end

function mft:drawObjects(scaleP)
    -- draw each object on the map
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

function tft:addTile()
  -- which are quads, but also have some basic collision data
end

function tft:addTileBatch()
  -- and can be added lots at the same time
end

function tft:addAniTile()
  -- they can also be animated
end

function tft:addAniTileBatch()
  -- again, batches!
end

function tft:update()
  -- and the whole tileset updates at once
end

return m
