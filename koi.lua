-- koi
-- made with löve
-- something like an engine

return {
  sprite = require 'koi.sprite',
  object = require 'koi.object',
  input = require 'koi.input',
  map = require 'koi.map',
  camera = require 'koi.camera',
  logic = require 'koi.logic',
  editor = require 'koi.editor',
  ui = require 'koi.ui'
}


--[[
Koi priorities/order:
* Get map up and running (storing map data)
* Get camera working with map
* Audio (should be simple, just interface with Löve)
* UI should be relatively quick
* Editor might take a while
* By this point, have a *clear* idea of what logic does or scrap it
]]
