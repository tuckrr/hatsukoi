-- koi.map
-- a map is a grid of tiles and objects
-- also contains tile definitions because they only get used in map

m = {}
mft = {}
tft = {}

--[[
todo:
primary functionality
  m.newMap
  mft.setTile
  mft.getTile
  mft.init
  mft.update
  mft.draw
  m.newTileSet
  tft.addTile

secondary
  mft.loadFile
  mft.writeFile
  tft.addTileBatch
  tft.addAniTile
  tft.addAniTileBatch
  tft.update
]]

return m
