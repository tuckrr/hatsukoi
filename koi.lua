-- koi
-- made with löve
-- something like an engine

return {
  sprite = require 'koi.sprite',
  object = require 'koi.object',
  input = require 'koi.input', -- not sure if this gets wiped in prototype
  map = require 'koi.map',
  --camera = require 'koi.camera',
  --logic = require 'koi.logic',
  --editor = require 'koi.editor',
  ui = require 'koi.ui'
}

-- koi prototype
-- just a place to be able to start making tiny games w/ love
-- useful for game jams/small projects while developing koi in c++

--[[
Koi priorities/order:
* Get map up and running (storing map data)
* Get camera working with map
* Audio (should be simple, just interface with Löve)
* UI should be relatively quick
* Editor might take a while
* By this point, have a *clear* idea of what logic does or scrap it
]]
