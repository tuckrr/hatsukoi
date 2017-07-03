-- koi.map
-- a map is a grid of tiles and objects
-- also contains tile definitions because they only get used in map

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
    objectP.x = xP
    objectP.y = yP
  end

  self.instances[#self.instances + 1] = objectP
end

function mft:getObjectLocation(objectP, instanceP, guessxP, guessyP)
  -- find out where on the map an instance is
end

function mft:setLocationTile(xP, yP, pixelConversionP)
  -- handle tiles
end

function mft:getLocation(xP, yP, pixelConversionP)
  -- return a table containing data about the location
end

function mft:init()
  -- load the entities, tiles in the map and shit
end

function mft:update()
  -- update animated tiles, entities on the map
end

function mft:draw()
  -- draw each tile in the section being drawn, with params from cam
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
