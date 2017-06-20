-- koi.map
-- a map is a grid of tiles and objects
-- also contains tile definitions because they only get used in map

m = {}
local mft = {}
local tft = {}

function m.newMap(widthP, heightP, tileWidthP, tileHeightP)
  tempMap = {}
  for i = 1, widthP do
    tempMap[i] = {}
  end
  return setmetatable({
    width = widthP, height = heightP,
    widthPx = widthP * tileWidthP,
    heightPx = heightP * tileHeightP,
    tileWidth = tileWidthP,
    tileHeight = tileHeightP,
    streaming = false, -- level streaming/chunk based system. tbd exactsies
    tilesets = {},
    map = tempMap
  }, {__index = mft})
end

function mft:setLocation(xP, yP)
  -- handle entities, tile, and more -.-
end
--[[
todo:
primary functionality
  mft.setLocation
  mft.getLocation
  mft.init
  mft.update
  mft.draw
  m.newTileSet
  tft.addTile

secondary
  mft.loadFile (the real meat)
  mft.writeFile (for editing)
  tft.addTileBatch
  tft.addAniTile
  tft.addAniTileBatch
  tft.update
]]

return m
