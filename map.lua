-- koi.map
-- a map is a grid of tiles and objects
-- also contains tile definitions because they only get used in map

-- map really is kind of a mess. i didn't really plan this/obj out too well in
-- how they interact. going to go with a different system for koi++

m = {}
local mft = {}
local tsft = {}

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
    tileset = {},
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
  for indexY, valueY in ipairs(self.map) do
    for indexX, valueX in ipairs(valueY) do
      self.tileset:draw(valueX,
                        ((indexX - 1) * self.tileWidth) - self.drawOffsetX,
                        ((indexY - 1) * self.tileHeight) - self.drawOffsetY)
    end
  end
end

function mft:drawObjects()
    for i, v in ipairs(self.instances) do
      v:draw(self.drawOffsetX, self.drawOffsetY)
    end
end

---------------------------------------------------------------

function m:newTileset(imgP, tileWidthP, tileHeightP)
  local img = love.graphics.newImage(imgP)
  self.tileset = setmetatable({
    tilesetSheet = img,
    tilesetWidth = img:getWidth(),
    tilesetHeight = img:getHeight(),
    tilesetTileWidth = tileWidthP or 32,
    tilesetTileHeight = tileHeightP or 32,
    tiles = {}
  }, {__index = tsft})
  return self.tileset;
end

function tsft:addTile(nameP, xP, yP)
  self.tiles[nameP] = love.graphics.newQuad(xP, yP,
                                            self.tilesetTileWidth,
                                            self.tilesetTileHeight,
                                            self.tilesetWidth,
                                            self.tilesetHeight)
end

function tsft:draw(tileP, xP, yP)
  love.graphics.draw(self.tilesetSheet, self.tiles[tileP], xP, yP)
end

----------------------------------------------------------------

function tsft:addAniTile()
  -- they can also be animated
end
-- (these two go together)
function tsft:update()
  -- and the whole tileset updates at once
end

return m
